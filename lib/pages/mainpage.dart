import 'package:flutter/material.dart';
import 'package:pet_shop_app/const.dart';
import 'package:pet_shop_app/pages/favarite.dart';
import 'package:pet_shop_app/pages/home_page.dart';
import 'package:pet_shop_app/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<IconData> icons = [
    Icons.home_filled,
    Icons.favorite_border_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];
  List<Widget> _page = [HomePage(), FavoritePage(), FavoritePage(), ProfilePage()];
  int selectedPage = 0;
  @override
  void initState() {
    _page[0] = HomePage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: _page[selectedPage],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          // backgroundColor: white,
          unselectedItemColor: black,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          selectedItemColor: deepPurple,
          items: List.generate(
              icons.length,
              (index) => BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          icons[index],
                          color: selectedPage == index
                              ? deepPurple
                              : Colors.black87,
                        ),
                        const SizedBox(height: 5),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: selectedPage == index ? 15 : 0,
                          height: selectedPage == index ? 3 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: deepPurple),
                        )
                      ],
                    ),
                    label: '',
                  )),
        ),
      ),
    );
  }
}