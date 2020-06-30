import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, "CALL"),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return Scaffold(
//      appBar: AppBar(
//        title: Text("Hello"),
//      ),
      body: ListView(
        children: <Widget>[
//          Image.network(
//            'https://www.telegraph.co.uk/content/dam/Travel/ski/K2-mountain-Andrzej-Bargiel-first-ski-descent-by-Piotr-Pawlus-Red-Bull-Content-Pool.jpg?imwidth=450',
//          ),
          Image.asset(
            'img/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
//      Title section
          buildTitleSection(),
//      Btn section
//          buildButtonSection(context),  //duplicate
          buttonSection,
//      Text section
          buildTextSection(),
        ],
      ),
    );
  }

  Widget buildTextSection() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  Row buildButtonSection(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平均分配
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(Icons.call),
            Text("CALL"),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.near_me, color: Theme.of(context).primaryColor),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                "ROUTE",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.share),
            Text("SHARE"),
          ],
        )
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitleSection() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Mountain name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Mountain location",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  )
                ]),
          ),
//          Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          Text("41"),
          FavoriteWidget(),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}
