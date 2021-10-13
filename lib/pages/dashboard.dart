import 'package:flutter/material.dart';
import 'package:app_food/widgets/card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CardGenerator myCard = CardGenerator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_horiz,
                color: Color.fromRGBO(180, 167, 125, 1.0),
              ),
              color: Colors.yellowAccent,
              elevation: 20,
              enabled: true,
              onSelected: (value) {},
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("First"),
                      value: "first",
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
                      value: "Second",
                    ),
                  ])
        ],
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SearchBar(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Most  Liked Reciped',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  // color: Colors.red,
                  child: MostLikedRecipes(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Popular Reciped',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  // color: Colors.red,
                  child: ListFood(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MostLikedRecipes extends StatelessWidget {
  const MostLikedRecipes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardGenerator myCard = CardGenerator();

    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          myCard.cardGenerator(
            title: "Parrillada Doble",
            subtitle: "40 recetas disponibles",
            path: "assets/uno.jpg",
            rating: 2,
          ),
          myCard.cardGenerator(
            title: "Hueso Carnudo ",
            subtitle: "40 recetas disponibles",
            path: "assets/2.jpg",
            rating: 4,
          ),
          myCard.cardGenerator(
            title: "Picana Braileira",
            subtitle: "40 recetas disponibles",
            path: "assets/3.jpg",
            rating: 5,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: 'Search for something',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
        ),
      ),
    );
  }
}

class ListFood extends StatelessWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      //color: Colors.yellow,
      child: Column(
        children: [
          _food(
            title: "Parrillada Cuatriple",
            number: "6.2K",
            path: "assets/4.jpg",
          ),
          _food(
            title: "Costillas BBQ",
            number: "3.4K",
            path: "assets/5.jpg",
          ),
          _food(
            title: "Big Parrilla",
            number: "3.4K",
            path: "assets/6.jpg",
          ),
          _food(
            title: "Carnitas",
            number: "3.4K",
            path: "assets/7.jpeg",
          ),
        ],
      ),
    );
  }

  Widget _food({
    required String title,
    required String number,
    required String path,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Special Diets",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 17,
                  color: Color.fromRGBO(180, 167, 125, 1.0),
                ),
                Icon(
                  Icons.star,
                  size: 17,
                  color: Color.fromRGBO(180, 167, 125, 1.0),
                ),
                Icon(
                  Icons.star,
                  size: 17,
                  color: Color.fromRGBO(180, 167, 125, 1.0),
                ),
                Icon(
                  Icons.star,
                  size: 17,
                  color: Color.fromRGBO(180, 167, 125, 1.0),
                ),
                Icon(
                  Icons.star_outline,
                  size: 17,
                  color: Color.fromRGBO(180, 167, 125, 1.0),
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          width: 60.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Cooked",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
