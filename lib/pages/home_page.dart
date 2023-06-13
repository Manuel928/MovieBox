// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/config.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> fetchMovies() async {
    const apiKey = tmdbApiKey; // Replace with your actual API key
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List movies = jsonData['results'];
      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  List<dynamic> movies = [];
  @override
  initState() {
    fetchMovies()
        .then((data) => {
              setState(() {
                movies = data;
              })
            })
        .catchError((error) {
      return error;
    });
    super.initState();
  }

  // void search(String text) {
  //   List<dynamic> results = [];
  //   if (text.isEmpty) {
  //     results = movies;
  //   } else {
  //     results = movies
  //         .where((element) => element['title']
  //             .toLowerCase()
  //             .contains(text.toLowerCase().trim()))
  //         .toList()
  //         .cast();
  //   }
  //   setState(() {
  //     foundMovies = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    late List<dynamic> filteredMovies = movies.where((movie) {
      final title = movie['title'].toString().toLowerCase();
      final overview = movie['overview'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query) || overview.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        'MovieBox',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      )),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                child: TextField(
                  onChanged: (value) {
                    searchQuery = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'What movie are you looking for?',
                      border: InputBorder.none,
                      iconColor: Colors.green[800],
                      prefixIcon: Icon(Icons.search_rounded),
                      fillColor: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    double cWidth = MediaQuery.of(context).size.width * 0.4;
                    void launchWatchWebsite() async {
                      var watchUrl = movie
                          .watchLink; // Replace with the desired website URL
                      if (await canLaunchUrl(Uri.parse(watchUrl))) {
                        await launchUrl(Uri.parse(watchUrl));
                      } else {
                        throw 'Could not launch $watchUrl';
                      }
                    }

                    void launchDownloadWebsite() async {
                      var downloadUrl = movie
                          .downloadLink; // Replace with the desired website URL
                      if (await canLaunchUrl(Uri.parse(downloadUrl))) {
                        await launchUrl(Uri.parse(downloadUrl));
                      } else {
                        throw 'Could not launch $downloadUrl';
                      }
                    }

                    // return ListTile(
                    //   leading: Image.network(movie.movieImage),
                    //   title: Text(movie.movieName),
                    //   subtitle: Text(movie.releaseYear),
                    // );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        height: 200,
                        width: 70,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w185' +
                                    movie['poster_path'],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      left: 8.0,
                                      right: 8.0,
                                      bottom: 8.0),
                                  child: Container(
                                    width: cWidth,
                                    child: Text(
                                      movie['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1.0,
                                      left: 8.0,
                                      right: 8.0,
                                      bottom: 8.0),
                                  child: Text(
                                    movie['release_date'],
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: <Widget>[
                                //     for (var mov in movie.tags)
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             left: 3, right: 3, bottom: 8),
                                //         child: Text(mov),
                                //       ),
                                //   ],
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: launchWatchWebsite,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green[800],
                                            foregroundColor: Colors.white,
                                            elevation: 8,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Watch",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Icon(
                                                      Icons.tv,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: launchDownloadWebsite,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red[800],
                                            foregroundColor: Colors.white,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Download",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Icon(
                                                      Icons.download,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
