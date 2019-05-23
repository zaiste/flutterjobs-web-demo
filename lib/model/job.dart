class Job {
  final String title;
  final String company;
  final String description;
  final String location;
  final String type;

  Job(
      {this.title,
      this.company,
      this.description = "",
      this.location,
      this.type});

  @override
  String toString() {
    return "Job: $title, $company, $description, $location, $type";
  }
}
