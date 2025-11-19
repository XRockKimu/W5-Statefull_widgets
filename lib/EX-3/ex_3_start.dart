import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/w4-s2/bird.jpg",
  "lib/EX-3/w4-s2/bird2.jpg",
  "lib/EX-3/w4-s2/insect.jpg",
  "lib/EX-3/w4-s2/girl.jpg",
  "lib/EX-3/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
                                      // Why this line ? Can you explain it ?
  debugShowCheckedModeBanner: false, // Answer: To hide the Text [ Debug ] in UI.
  home: ImageViewer(),
));

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int _currentIndex = 0;

  void _showNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _showPreviousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _showNextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[_currentIndex]),
      ),
    );
  }
}
