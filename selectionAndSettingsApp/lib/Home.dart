import 'package:flutter/material.dart';
import './Months.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int optionSelected = 0;

  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection and Settings $optionSelected'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          for (int i = 0; i < months.length; i++)
            MonthOption(
              months[i]['month'] as String,
              img: months[i]['img'] as String,
              onTap: () => checkOption(i + 1),
              selected: i + 1 == optionSelected,
            )
        ],
      ),
    );
  }
}

class MonthOption extends StatelessWidget {
  const MonthOption(
    this.title, {
    Key key,
    this.img,
    this.onTap,
    this.selected,
  }) : super(key: key);

  final String title;
  final String img;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.cover,
      image: AssetImage(img),
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: selected ?? false ? Colors.red : Colors.transparent,
                  width: selected ?? false ? 5 : 0,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selected ?? false
                      ? Colors.blue.withOpacity(0.8)
                      : Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
