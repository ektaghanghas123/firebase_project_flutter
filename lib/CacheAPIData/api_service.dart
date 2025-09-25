import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  // Fetch data from API or cache
  Future<List<dynamic>> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = "api_cache";

    try {
      // Try API call
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Store in cache
        prefs.setString(cacheKey, jsonEncode(data));

        return data;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      // On error, load from cache
      final cachedData = prefs.getString(cacheKey);
      if (cachedData != null) {
        return jsonDecode(cachedData);
      } else {
        throw Exception("No internet and no cached data available");
      }
    }
  }
}


class ShoeAPiCaching extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowAPICachingState();
  }


}

class ShowAPICachingState extends State<ShoeAPiCaching>{

  final service = ApiService();

  late Future<dynamic> dataList ;
  @override
  void initState() {
    super.initState();

    dataList = service.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("List data"),),
      body: FutureBuilder(future: dataList, builder: (context,snapShot){

        if(snapShot.connectionState== ConnectionState.waiting){
          return CircularProgressIndicator();

        }
        final data = snapShot.data;
        return ListView.builder(
          itemCount: data.length,
            itemBuilder: (context,index){

            return ListTile(title: Text(data[index]['title']),);

        });
      }),


    );
  }

}