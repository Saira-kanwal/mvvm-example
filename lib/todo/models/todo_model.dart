class Todo{
  final String? title;
  final bool? status;
  final DateTime? dateTime;

  Todo({this.dateTime,this.status,this.title});

  factory Todo.fromMap(Map data)
  {
    return Todo(
        title: data['title'],
      status: data['status'],
      dateTime: DateTime.fromMicrosecondsSinceEpoch(data['dateTime']?? DateTime.now().microsecondsSinceEpoch)
    );
  }

//send data to DB and convert the class data to Map object

toMap()
{
  Map<String, dynamic> data = {
    "title" : title,
    "status" : status,
    "dateTime": dateTime!.millisecond,
  };
  return data;
}
}

