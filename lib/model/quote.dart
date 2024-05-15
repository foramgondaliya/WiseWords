class Quotes {
  String? quote;
  String? author;
  String? catagoryname;

  Quotes(
      {required this.quote, required this.author, required this.catagoryname});

  factory Quotes.fromMap({required Map<String, dynamic> data}) {
    return Quotes(
      quote: data['quote'],
      author: data['author'],
      catagoryname: data['categoryname'],
    );
  }
}
