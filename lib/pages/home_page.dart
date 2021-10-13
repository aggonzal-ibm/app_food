import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey,
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
                'Popular recipes',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BotomNavigator(),
      body: _ListRecipes(),
    );
  }
}

class _ListRecipes extends StatefulWidget {
  _ListRecipes({Key? key}) : super(key: key);

  @override
  __ListRecipesState createState() => __ListRecipesState();
}

class __ListRecipesState extends State<_ListRecipes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _card(
          title: "Parrillada Doble",
          subtitle: "40 recetas disponibles",
          path: "assets/uno.jpg",
        ),
        _card(
          title: "Punta Picana",
          subtitle: "20 recetas disponibles",
          path: "assets/2.jpg",
        ),
        _card(
          title: "Costillar Brasilero",
          subtitle: "10 recetas disponibles",
          path: "assets/3.jpg",
        ),
      ],
    );
  }
}

Widget _card({
  required String title,
  required String subtitle,
  required String path,
}) {
  return Container(
    width: 200.0,
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15.0),
    height: 230.0,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10.0),
      image: DecorationImage(
        image: AssetImage(path),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class _BotomNavigator extends StatefulWidget {
  _BotomNavigator({Key? key}) : super(key: key);

  @override
  __BotomNavigatorState createState() => __BotomNavigatorState();
}

class __BotomNavigatorState extends State<_BotomNavigator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
