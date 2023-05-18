import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<XFile> capturedImages = []; // List to store captured images

  Future<void> _takePicture() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          capturedImages.add(image);
        });
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void removeImage(int index) {
    setState(() {
      capturedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        itemCount: capturedImages.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            // Display the button to take a photo
            return Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.withOpacity(0.4),
                ),
                onPressed: _takePicture,
                child: const Text(
                  "Take Pic",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            // Display the captured image
            return Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(capturedImages[index - 1].path),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        removeImage(index - 1);
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
