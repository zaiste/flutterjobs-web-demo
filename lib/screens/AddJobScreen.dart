import 'package:flutter_web/material.dart';
import 'package:flutterjobs/model/job.dart';

class AddJobScreen extends StatefulWidget {
  @override
  _AddJobScreenState createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  String title = "";
  String company = "";
  String description = "";
  String location = "";
  String type = "";

  Map<String, bool> _types = {
    'fulltime': false,
    'contract': false,
    'remote': false,
  };

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Flutter Job"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "`TITLE` cannot be empty";
                    } else if (len < 4) {
                      return "`TITLE` must be longer than 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) => title = value,
                  decoration: InputDecoration(
                    labelText: 'TITLE',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "`COMPANY` cannot be empty";
                    } else if (len < 4) {
                      return "`COMPANY` must be longer than 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) => company = value,
                  decoration: InputDecoration(
                    labelText: 'COMPANY',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "`LOCATION` cannot be empty";
                    } else if (len < 4) {
                      return "`LOCATION` must be longer than 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) => location = value,
                  decoration: InputDecoration(
                    labelText: 'LOCATION',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text("Fulltime"),
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _types['fulltime'] = value;
                  });
                },
                value: _types['fulltime'],
              ),
              CheckboxListTile(
                title: Text("Contract"),
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _types['contract'] = value;
                  });
                },
                value: _types['contract'],
              ),
              CheckboxListTile(
                title: Text("Remote"),
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _types['remote'] = value;
                  });
                },
                value: _types['remote'],
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  onSaved: (value) => description = value,
                  decoration: InputDecoration(
                    labelText: 'DESCRIPTION',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 9,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    print("Hello");
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      print("Validated");

                      Job job = Job(
                        title: title,
                        description: description,
                        location: location,
                        type: type,
                        company: company,
                      );

                      print("Created; $job");

                      Navigator.pop(context, job);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
