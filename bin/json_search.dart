void main(List<String> arguments) {
  List<Map<String, dynamic>> json = [
    {"nome": "Paulo", "idade": 19, "pai": "Eduardo"},
    {"nome": "Eduardo", "idade": 25, "pai": "Jacó"}
  ];
  List<Map<String, dynamic>> result =
      search(filter: "all", str: 'Edu', listJson: json);

  print(result);
}

List<Map<String, dynamic>> search(
    {String filter = 'all',
    required String str,
    required List<Map<String, dynamic>> listJson}) {
  List<Map<String, dynamic>> list = [];
  str = str.toLowerCase();

  if (filter == 'all') {
    for (Map<String, dynamic> json in listJson) {
      Iterable<String> keys = json.keys;

      for (String key in keys) {
        if (json[key].toString().toLowerCase().contains(str) &&
            !list.contains(json)) {
          list.add(json);
        }
      }
    }
  } else {
    for (Map<String, dynamic> json in listJson) {
      Iterable<String> keys = json.keys;

      for (String key in keys) {
        if (json[key].toString().toLowerCase().contains(str) &&
            !list.contains(json) &&
            key == filter) {
          list.add(json);
        }
      }
    }
  }

  return list;
}
