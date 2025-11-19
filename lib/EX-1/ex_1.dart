import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickableButton(),
              SizedBox(height: 20),
              ClickableButton(),
              SizedBox(height: 20),
              ClickableButton(),
              SizedBox(height: 20),
              ClickableButton(),
            ],
          ),
        ),
      ),
    ));

class ClickableButton extends StatefulWidget {
  const ClickableButton({super.key});

  @override
  State<ClickableButton> createState() => _ClickableButtonState();
}

class _ClickableButtonState extends State<ClickableButton> {
  bool _isSelected = false;

  String get label => _isSelected ? "Selected" : "Not selected";

  Color get textColor => _isSelected ? Colors.white : Colors.black;

  Color? get backgroundColor =>
      _isSelected ? Colors.blue[500] : Colors.blue[50];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
