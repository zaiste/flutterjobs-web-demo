import 'package:flutter_web/material.dart';
import 'package:flutterjobs/model/job.dart';
import 'package:flutterjobs/screens/AddJobScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple[400],
        accentColor: Colors.grey[800],
      ),
      home: JobListScreen(
        title: 'Flutter Jobs',
      ),
    );
  }
}

class JobListScreen extends StatefulWidget {
  JobListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<Job> jobs = [
    Job(
      title: "First Flutter Job",
      company: "Google",
      description: "This is a job at Google.",
      location: "Mountain View, CA",
    ),
    Job(
      title: "Second Flutter Job",
      company: "Google",
      description: "This is another job at Google.",
      location: "Mountain View, CA",
    ),
  ];

  void _show() {}

  void _add() async {
    var job = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AddJobScreen(),
      ),
    );

    setState(() {
      jobs.add(job);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          var job = jobs[index];

          return ListTile(
            title: Text(job.title),
            subtitle: Text(job.company),
            trailing: Text(job.location),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(job.title),
                      ),
                      body: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(job.description),
                      ),
                    );
                  },
                ),
              );
            },
          );
          //
        },
        separatorBuilder: (context, index) => Divider(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _add,
        icon: Icon(Icons.add),
        label: Text("Add New Job"),
      ),
    );
  }
}
