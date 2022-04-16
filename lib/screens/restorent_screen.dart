import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';

import '../models/food.dart';
import '../models/restaurant.dart';

class RestorentScreen extends StatefulWidget {
  final Restaurant restorent;
  const RestorentScreen({required this.restorent});

  @override
  State<RestorentScreen> createState() => _RestorentScreenState();
}

class _RestorentScreenState extends State<RestorentScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 175.0,
              width: 175.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(menuItem.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: const [0.1, 0.4, 0.6, 0.9],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                menuItem.name,
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '\$${menuItem.price}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: TextButton(
              onPressed: () {},
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 24,
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: widget.restorent.imageUrl,
              child: Image(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(
                  widget.restorent.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor,
                    iconSize: 35.0,
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.restorent.name,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "0.2 miles away",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              RatingStar(widget.restorent.rating),
              const SizedBox(height: 6),
              Text(
                widget.restorent.address,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Theme.of(context).primaryColor,
              child: const Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Theme.of(context).primaryColor,
              child: const Text(
                "Contact",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Center(
          child: Text(
            "Menu",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(10.0),
            crossAxisCount: 2,
            children: List.generate(widget.restorent.menu.length, (index) {
              Food food = widget.restorent.menu[index];
              return Center(
                child: _buildMenuItem(food),
              );
            }),
          ),
        ),
      ]),
    );
  }
}
