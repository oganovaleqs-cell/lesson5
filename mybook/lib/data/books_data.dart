import '../models/book.dart';

List<Book> buildInitialBooks() => [
      Book(id: '1', title: 'Վերք Հայաստանի', author: 'Խաչատուր Աբովյան', genre: Genre.novel),
      Book(id: '2', title: 'Սամվել', author: 'Րաֆֆի', genre: Genre.novel),
      Book(id: '3', title: 'Գիքորը', author: 'Հովհաննես Թումանյան', genre: Genre.story),
      Book(id: '4', title: 'Անուշ', author: 'Հովհաննես Թումանյան', genre: Genre.poetry),
      Book(id: '5', title: 'Քաոս', author: 'Շիրվանզադե', genre: Genre.novel),
      Book(id: '6', title: 'Մատանիների տիրակալը', author: 'Ջ. Ռ. Ռ. Թոլքին', genre: Genre.fantasy),
      Book(id: '7', title: 'Հարրի Փոթեր', author: 'Ջ. Ք. Ռոուլինգ', genre: Genre.fantasy),
      Book(id: '8', title: 'Հին աստվածներ', author: 'Լևոն Շանթ', genre: Genre.story),
      Book(id: '9', title: 'Երկիր Նաիրի', author: 'Եղիշե Չարենց', genre: Genre.novel),
      Book(id: '10', title: 'Տաղարան', author: 'Եղիշե Չարենց', genre: Genre.poetry),
    ];