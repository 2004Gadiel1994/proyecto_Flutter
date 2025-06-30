import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

Future<RssFeed> getNews(String url) async {
  final response = await http.get(Uri.parse(url));
  return RssFeed.parse(response.body);
}