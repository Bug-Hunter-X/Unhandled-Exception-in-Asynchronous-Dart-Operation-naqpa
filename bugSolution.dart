```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // Process jsonData
    } else {
      // Handle error specifically
      throw HttpException('HTTP error: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
  } on HttpException catch (e) {
    // Handle HTTP errors specifically
    print('HTTP error: ${e.message} at ${e.uri}');
  } catch (e) {
    // Handle other unexpected exceptions
    print('An unexpected error occurred: $e');
  }
}
```