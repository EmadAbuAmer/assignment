void main() {
  Map<int,dynamic> libraryManagementSystem = {1:{
    "title": "data structure", 
    "author": "Alice",
    "year": 1825,
    "genre": "science"
  },2:{
    "title": "algorithms",
    "author": "ahmed",
    "year": 1998,
    "genre": "science"
  }
}; 

  addBook(
    libraryManagementSystem, 
    title: "Flutter for Beginners", 
    author: "John Doe", 
    year: 2022, 
    genre: "Programming"
  );
  print(retrieveBook(libraryManagementSystem, 'algorithms'));
  listAllBooks(libraryManagementSystem,'Programming');
  List <String> listOfBooks= listAllBooksByGenre(libraryManagementSystem, 'Programming');
  print(listOfBooks);
  removeBook(libraryManagementSystem, title:"Flutter for Beginners");
}

void addBook(Map<int,dynamic> library,{
  required String title,
  String author="Unkown",
  int year=0,
  String genre= "Unkown"
}){
  int newKey=library.keys.isNotEmpty ? library.keys.last +1: 1;
  library[newKey]={
    "title":title,
    "author":author,
    "year":year,
    "genre":genre
  };
}
String retrieveBook(Map<int,dynamic> library,String title) {
  String ?returnedValue=title;
  int indexOfBook=0;
  for(int i=library.length; i> 0;i--){
    if(library[i]['title']==title){
      returnedValue=title;
      indexOfBook=i;
    }
  }
  if(returnedValue != null){
    String bookInfo='${library[indexOfBook]['author']} ${library[indexOfBook]['year']} ${library[indexOfBook]['genre']}';
    return bookInfo;
  }else{
    String bookInfo='book not found';
    return bookInfo;
  }
  
}
void listAllBooks(Map<int,dynamic>library,String genre){

  if(library.isEmpty){
    print("no data available");
    return;
  }else{
    print('list all books');
    library.forEach((key, book) {
      if(book['genre'].isEmpty ||book['genre'] == genre ){
        print('list all books by genre');
        print(' ${book['title']} by ${book['author']} in ${book['year']} Genre  [${book['genre']}]');
      }else{
        print(' ${book['title']} by ${book['author']} in ${book['year']} Genre  [${book['genre']}]');
      }
    });
  }
}

List<String> listAllBooksByGenre(Map<int,dynamic> library,String genre){
  List<String> listOfBooks=[];
    library.forEach((key, book) {
      if(book['genre'] == genre ){
        listOfBooks.add(book['title']);
      }
    });
    if(listOfBooks.isEmpty){
      print('No books found for this genre.');
    }
    return listOfBooks;
}

void removeBook(Map<int,dynamic> library,{required String title}){
  String bookRemoved='';
    library.forEach((key, book) {
      if(book['title'] == title){
        print(book['title']);
        bookRemoved=book['title'];
        book.remove(title.toLowerCase());
      }
    });
  if(bookRemoved.isNotEmpty){
    print('Book removed successfully');
  }else{
    print('book not found');
  }
}