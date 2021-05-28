import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(
            create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<MyModel>(
                        //            <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              // We have access to the model.
                              myModel.doSomethingFuture("Hello World");
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>(
                      //              <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red[200],
                      child: Consumer<AnotherModel>(
                        //      <--- AnotherModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething();
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.yellow[200],
                    child: Consumer<AnotherModel>(
                      //        <--- AnotherModel Consumer
                      builder: (context, anotherModel, child) {
                        return Text('${anotherModel.someValue}');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  //                        <--- MyModel
  String someValue = 'Hello';
  void doSomething(String data) {
    someValue = data;
    print(someValue);
    notifyListeners();
  }

  Future<void> doSomethingFuture(String data) async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier {
  //                   <--- AnotherModel
  int someValue = 0;
  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}

class Movies extends ChangeNotifier {
  final List<MovieModel> _movies = [
    MovieModel(
      movieId: 'M1',
      movieName: 'The Godfather',
      posterUrl:
          'https://lunkiandsika.files.wordpress.com/2011/11/the-godfather-alternative-poster-1972-01.png',
    ),
    MovieModel(
      movieId: 'M2',
      movieName: 'The Notebook',
      posterUrl: 'http://www.impawards.com/2004/posters/notebook.jpg',
    ),
  ];
  List<MovieModel> get movies {
    return _movies;
  }

  int get movieCount {
    return _movies.length;
  }

  void updateFavorite(MovieModel movieItem) {
    movieItem.toggleFavorite();
    notifyListeners();
  }

  List<MovieModel> get favoriteMovies {
    return movies.where((movie) => movie.isFavorite).toList();
  }

  int get favCount {
    return favoriteMovies.length;
  }
}

class MovieModel {
  String movieId;
  String movieName;
  bool isFavorite;
  String posterUrl;

  MovieModel(
      {@required this.movieId,
      @required this.movieName,
      @required this.posterUrl,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
