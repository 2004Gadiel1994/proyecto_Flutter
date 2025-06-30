import 'package:flutter/material.dart';
import 'package:proyecto/downloadRssFeed/downloadRss.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class MyAppventanaHttp extends StatelessWidget {
  const MyAppventanaHttp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prueba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePageventanaHttp(title: 'Http'),
    );
  }
}

class MyHomePageventanaHttp extends StatefulWidget {
  const MyHomePageventanaHttp({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageventanaHttp> createState() => _MyHomePageStateventanaHttp();
}

class _MyHomePageStateventanaHttp extends State<MyHomePageventanaHttp> {
  int currentPageIndex = 0;

  final List<String> feedUrls = [
    "https://www.elcomercio.com/feed/",
    "https://feeds.bbci.co.uk/mundo/rss.xml",
    "https://cnnespanol.cnn.com/feed/",
  ];

  final List<String> feedTitles = [
    "El Comercio",
    "BBC Mundo",
    "CNN Español",
  ];

  Future<RssFeed>? infoNews;

  @override
  void initState() {
    super.initState();
    infoNews = getNews(feedUrls[currentPageIndex]);
  }

  void _onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
      infoNews = getNews(feedUrls[currentPageIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(feedTitles[currentPageIndex])),
      body: FutureBuilder(
        future: infoNews,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: Text('Error en captura de datos'));
              }
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ListView.builder(
              itemCount: snapshot.data.items.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        if (snapshot.data.image?.url != null)
                          Image.network(
                            snapshot.data.image.url,
                            width: 60,
                            height: 60,
                          ),
                        const SizedBox(width: 20),
                        Expanded(child: Text(snapshot.data.description ?? '')),
                      ],
                    ),
                  );
                }

                return _item(snapshot.data.items[index - 1]);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'El Comercio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'BBC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'CNN',
          ),
        ],
      ),
    );
  }

  Widget _item(RssItem item) {
    return Card(
      color: Colors.amber[100],
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.categories?.isNotEmpty ?? false)
              Text(
                item.categories!.first.value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            Text(item.title ?? '', style: const TextStyle(fontSize: 16)),
            Text('Autor: ${item.dc?.creator ?? "Desconocido"}'),
            SizedBox(
              width: 120,
              height: 120,
              child: item.enclosure?.url != null
                  ? Image.network(item.enclosure!.url!)
                  : const SizedBox.shrink(),
            ),
            
          ],
        ),
      ),
    );
  }
}
