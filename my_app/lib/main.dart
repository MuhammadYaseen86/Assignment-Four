import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Home(),
        title: new Text(
          'Welcome to Assignment Three',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
        ),
        //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.green[100],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [Calculator(), TodoApp(), EcommerceAppScreen()];

  void _onItemTap(int Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Ecom App UI', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(children: [
        Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Calculator'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: 'TodoApp'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var text) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + text;
          });
        },
        child: Text(text));
  }

  Clear() {
    setState(() {
      result = "";
    });
  }

  Output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              SizedBox(height: 50),
              btn("2"),
              SizedBox(height: 50),
              btn("3"),
              SizedBox(height: 50),
              btn("4"),
              SizedBox(height: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("5"),
              SizedBox(height: 50),
              btn("6"),
              SizedBox(height: 50),
              btn("7"),
              SizedBox(height: 50),
              btn("8"),
              SizedBox(height: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("9"),
              SizedBox(height: 50),
              btn("0"),
              SizedBox(height: 50),
              btn("+"),
              SizedBox(height: 50),
              btn("-"),
              SizedBox(height: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("*"),
              SizedBox(height: 50),
              btn("/"),
              SizedBox(height: 50),
              ElevatedButton(onPressed: Clear, child: Text("Clear")),
              SizedBox(height: 50),
              ElevatedButton(onPressed: Output, child: Text("=")),
            ],
          ),
        ],
      ),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> lst = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 70,
                  color: Colors.green,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("${lst[index]}"),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Edit Item"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  lst.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                              },
                                              child: Text("Edit"))
                                        ],
                                      );
                                    });
                              },
                              child: Icon(Icons.edit)),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ));
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add Item"),
                    content: TextField(
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              lst.add(output);
                            });
                          },
                          child: Text("Save"))
                    ],
                  );
                });
          },
          child: Text("Add"),
        ));
  }
}

class EcommerceAppScreen extends StatelessWidget {
  final List productListObj = [
    {
      'background': 'assets/images/gaming_pc.jpg',
      'names': "Iphone",
      "reviews": "4.8",
      "description": "testing one two three",
      "price": "10"
    },
    {
      'background': 'assets/images/iphone12.jpg',
      'names': "Samsung S3",
      "reviews": "2.8",
      "description": "This is new model",
      "price": "245"
    },
    {
      'background': 'assets/images/keyboard.jpg',
      'names': "Iphone 5s",
      "reviews": "3.8",
      "description": "This is Excellent Condition",
      "price": "275"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Poco M3",
      "reviews": "2.9",
      "description": "This is new model",
      "price": "25"
    },
    {
      'background': 'assets/images/note_20_ultra.jpg',
      'names': "Blackberry",
      "reviews": "5.0",
      "description": "Long Time Batttery",
      "price": "295"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Oppo S3",
      "reviews": "2.9",
      "description": "This is new model",
      "price": "25"
    },
    {
      'background': 'assets/images/note_20_ultra.jpg',
      'names': "Infinix",
      "reviews": "5.0",
      "description": "This is new model",
      "price": "295"
    },
    {
      'background': 'assets/images/iphone12.jpg',
      'names': "Iphone 12Pro",
      "reviews": "2.9",
      "description": "This a latest Iphone",
      "price": "25"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Iphone 7s",
      "reviews": "3.8",
      "description": "This is new model",
      "price": "275"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Q-Mobile",
      "reviews": "3.8",
      "description": "This is new model",
      "price": "215"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Oppo S3",
      "reviews": "2.9",
      "description": "Coming Soon new model",
      "price": "25"
    },
    {
      'background': 'assets/images/note_20_ultra.jpg',
      'names': "Iphone 8Pro",
      "reviews": "2.9",
      "description": "Real is new model",
      "price": "25"
    },
    {
      'background': 'assets/images/macbook_air.jpg',
      'names': "Galaxy S3",
      "reviews": "2.9",
      "description": "This is new model",
      "price": "125"
    },
  ];

  final List productCategoryList = [
    {
      'names': "Clothes",
      "catcount": "4",
    },
    {
      'names': "Electronics",
      "catcount": "3",
    },
    {
      'names': "House",
      "catcount": "8",
    },
    {
      'names': "Appliances",
      "catcount": "7",
    },
    {
      'names': "Others",
      "catcount": "6",
    },
  ];

  final List catIcons = [
    Icon(
      Icons.shopping_bag,
      color: Colors.purple,
      size: 30,
    ),
    Icon(
      Icons.bolt,
      color: Colors.purple,
      size: 30,
    ),
    Icon(Icons.king_bed, color: Colors.purple),
    Icon(Icons.kitchen, color: Colors.purple),
    Icon(Icons.read_more, color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   width: 500.0,
            //   height: 400.0,
            //   color: Colors.green,
            //   child: Column(
            //     children: [
            //       Container(
            //         child: Text("Red One"),
            //       ),
            //       SizedBox(height: 20),
            //       Container(
            //         child: Text("Red Two"),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: 30),
            Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text("Red One"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CarouselSlider(
                        items: productListObj.map((item) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 13,
                                      spreadRadius: 2,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: Image.network(
                                            "${item["background"]}")),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${item["names"]}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star_half,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      Text(
                                          '${item["name"]} ( ${item["reviews"]} Reviews)')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                          height: 300,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          scrollDirection: Axis.horizontal,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          // enlargeCenterPage: true,
                          // viewportFraction: 8.0
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 70,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: productCategoryList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: 200,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ListTile(
                        leading: catIcons[index],
                        title: Text(
                          '${productCategoryList[index]['names']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 0.5),
                        ),
                        subtitle: Text(
                          '${productCategoryList[index]['catcount']} items',
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 30),
            Container(
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    child: Text("Red One Most "),
                  ),
                  SizedBox(height: 20),
                  Container(
                    //height: 700.0,
                    child: GridView.count(
                      shrinkWrap: true, // use it
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: const EdgeInsets.all(8.0),
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(productListObj.length, (index) {
                        return Container(
                          //padding: EdgeInsets.only(left: 10),
                          decoration:
                              BoxDecoration(color: Colors.grey[50], boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 13,
                              spreadRadius: 2,
                            )
                          ]),
                          //child:(Text(productListObj[0]['names']))
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  //borderRadius: BorderRadius.all(Radius.circular(5)),
                                  child: Image.network(
                                    productListObj[index]['background'],
                                    //width: 170,
                                    fit: BoxFit.fill,
                                    width: double.maxFinite,
                                    height: 150,
                                    //fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                flex: 4,
                                child: Container(
                                    child:
                                        (Text(productListObj[index]['names']))),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
