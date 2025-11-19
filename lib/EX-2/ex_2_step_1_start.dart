import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: const [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key, required this.isFavorite});

  // Part 2: parameter the isFavorite value
  final bool isFavorite;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  // Part 3: Each card manages its own favorite state
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),

      // Card Layout (Part 1)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Expanded column with title + description
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description'),
              ],
            ),
          ),

          // Favorite Icon Button
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
