import 'package:flutter/material.dart';

import 'data/models/post.dart';
import 'data/repositories/post_repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repository Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> title = <String>['title1', 'title2', 'title3'];
  final List<String> body = <String>['body1', 'body2body2', 'body3body3body3'];

  late PostRepositories repo;

  @override
  void initState() {
    super.initState();
    repo = PostRepositories.create();
    // repo = RankingRepositories(RestClient(Dio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Post>>(
          future: repo.getPosts(),
          builder: (context, snapshot) {
            final post = snapshot.data!;
            return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(post[index].title!),
                  subtitle: Text(post[index].body!),
                );
              },
            );
          }),
    );
  }
}
