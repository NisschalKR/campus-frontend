import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class LostFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost & Found Module'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Report and Find Lost Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportLostItemPage()),
                );
              },
              child: Text('Report Lost Item'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewFoundItemPage()),
                );
              },
              child: Text('View Found Items'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportLostItemPage extends StatefulWidget {
  @override
  _ReportLostItemPageState createState() => _ReportLostItemPageState();
}

class _ReportLostItemPageState extends State<ReportLostItemPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Lost Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Report Lost Item", 
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Date of Lost',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: contactController,
                        decoration: InputDecoration(
                          labelText: 'Contact Info',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 15),
                      _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(_image!, height: 150, fit: BoxFit.cover))
                          : Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Icon(Icons.image, size: 50, color: Colors.grey)),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: Icon(Icons.upload),
                        label: Text("Upload Image"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                          }
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ViewFoundItemPage extends StatefulWidget {
  @override
  _ViewFoundItemPageState createState() => _ViewFoundItemPageState();
}

class _ViewFoundItemPageState extends State<ViewFoundItemPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Found Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("View Found Item", 
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Date of Found',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: contactController,
                        decoration: InputDecoration(
                          labelText: 'Contact Info',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.phone,
                        readOnly: true,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
