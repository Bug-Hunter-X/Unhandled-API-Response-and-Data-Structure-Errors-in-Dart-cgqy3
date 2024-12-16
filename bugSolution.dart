```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('items') && jsonResponse['items'] is List) {
        final items = jsonResponse['items'] as List<dynamic>;
        for (var item in items) {
          if (item is Map && item.containsKey('name')) {
            print(item['name']);
          } else {
            print('Error: Invalid item structure: $item');
          }
        }
      } else {
        print('Error: Unexpected JSON response structure: $jsonResponse');
      }
    } else {
      print('Error: Failed to load data. Status code: ${response.statusCode}, Response Body: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```