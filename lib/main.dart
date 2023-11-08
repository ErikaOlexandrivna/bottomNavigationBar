import 'package:bottom_bar/page/home_page.dart';
import 'package:bottom_bar/page/profile_page.dart';
import 'package:bottom_bar/page/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarApp(),
    );
  }
}

  //Головний клас
class BottomNavigationBarApp extends StatefulWidget {
  // Конструктор
  const BottomNavigationBarApp({super.key});


  // Метод createState() визначається для StatefulWidget.
  // Він викликається Flutter фреймворком для створення об'єкту State,
  // який буде пов'язаний з цим StatefulWidget.
  // Цей метод повинен повертати новий екземпляр класу State,
  // який у цьому випадку є _BottomNavigationBarAppState.
  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}


// Клас State для BottomNavigationBarApp
// Розширення State<BottomNavigationBarApp> означає,
// що цей клас надає стан для віджета BottomNavigationBarApp.
class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int selectIndex = 1;


  // Функція для обробки натискання на вкладку
  void onTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  // Отримати віджет сторінки в залежності від індексу
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      body: getPage(selectIndex), // Відображення сторінки на основі обраного індексу
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded), label: 'Profile'),
        ],
        // selectedItemColor: Colors.red, // змінюємо колір вибраного елемента
        // unselectedItemColor: Colors.grey, // колір невибраних елементів
        // backgroundColor: Colors.blue, // фон навігаційної панелі
        // type: BottomNavigationBarType.shifting, // анімація вибраних елементів
        // iconSize: 30, // розмір іконок
        // elevation: 5, // висота тіні
        // showSelectedLabels: true, // показувати мітки вибраних елементів
        // showUnselectedLabels: false, // не показувати мітки невибраних елементів
        // selectedFontSize: 14, // розмір шрифта для вибраних міток
        // unselectedFontSize: 12, // розмір шрифта для невибраних міток
      ),
    );
  }
}
