```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle successful response
      final jsonData = json.decode(response.body);
      // Use the jsonData
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    // Rethrow the exception to be handled higher up in the call stack
    rethrow;
  }
}
```