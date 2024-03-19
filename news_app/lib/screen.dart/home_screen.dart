// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Newsrepository ns = Newsrepository();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    child: const Text('BlOCK NEWS',
                        style: TextStyle(
                            color: Color.fromARGB(255, 155, 10, 10),
                            fontSize: 25,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.7),
                  width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.05),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: height * 0.08),
                child: BlocConsumer<NewsBloc, NewsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is Newsloadingstate) {
                        context.read<NewsBloc>().add(StartEvent());
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is Newsloadedstate) {
                        List<NewsModel> newslist = [];
                        newslist = state.newsmodel;
                        return ListView.builder(
                            itemCount: newslist.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.grey,
                                          offset: Offset(0, 3),
                                          spreadRadius: 1,
                                        )
                                      ]),
                                  height: height * 0.15,
                                  margin: EdgeInsets.only(
                                      bottom: height * 0.01,
                                      top: height * 0.01,
                                      left: width * 0.02,
                                      right: width * 0.02),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * 0.6,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    newslist[index].urlToImage),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: height * 0.10,
                                              width: width * 0.55,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: height * 0.01),
                                              child: Text(
                                                newslist[index].title,
                                                overflow: TextOverflow.clip,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              SizedBox(height: height *0.02,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: height *0.03,
                                                width: width *0.15,
                                                  child: Text(
                                                newslist[index].author.toString(),
                                                overflow: TextOverflow.clip,
                                              )),
                                              SizedBox(width: width *0.25,),
                                               SizedBox(
                                                height: height *0.03,
                                                width: width *0.30,
                                                  child: Text(
                                               newslist[index].publishedAt.toString(),
                                                overflow: TextOverflow.clip,
                                                style: const TextStyle(color: Colors.black38),
                                              )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  FlutterWebBrowser.openWebPage(
                                    url: newslist[index].url,
                                    customTabsOptions: const CustomTabsOptions(
                                      colorScheme: CustomTabsColorScheme.dark,
                                      toolbarColor:
                                          Color.fromARGB(255, 12, 84, 15),
                                      secondaryToolbarColor: Colors.amber,
                                      navigationBarColor: Colors.black,
                                      shareState: CustomTabsShareState.on,
                                      instantAppsEnabled: true,
                                      showTitle: true,
                                      urlBarHidingEnabled: true,
                                    ),
                                  );
                                },
                              );
                            });
                      } else if (state is NewsErrorstate) {
                        String error = state.errormessage;
                        return Center(
                          child: Text(error),
                        );
                      } else {
                        return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.green));
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
