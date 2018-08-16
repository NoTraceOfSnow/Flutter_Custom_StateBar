import 'package:flutter/material.dart';
import 'package:flutter_app/classify/ClassifyPage.dart';
import 'package:flutter_app/index/IndexPage.dart';
import 'package:flutter_app/myself/MySelfPage.dart';
import 'package:flutter_app/shopping/ShoppingPage.dart';
import 'package:flutter_app/top_bar/TopBarPage.dart';
import 'package:flutter_app/top_bar/StateStyle.dart';

class MyHomePage extends StatefulWidget {
  @override
  createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 0;

  Map<int, TopBarPage> mPage = {};

  TopBarPage getContainerView(int index) {
    if (mPage != null && mPage[index] != null) {
      print("$index 已经存在");
      return mPage[index];
    } else {
      switch (index) {
        case 0:
          mPage[index] = new TopBarPage(
            stateBar: StateStyle.STATUS_BAR_TRANSPARENT,
            child: IndexPage(),
            title: "首页",
            clickListener: (index) {
              switch (index) {
                case 0:
                  print("左边图片");
                  break;
                case 1:
                  print("中间文字");
                  break;
                case 2:
                  print("右边图片");
                  break;
              }
            },
          );
          return mPage[index];
        case 1:
          mPage[index] = new TopBarPage(
            stateBar: StateStyle.STATUS_BAR,
            child: ClassifyPage(),
            leftBtnGone: true,
            rightBtnGone: true,
            title: "目的地",
          );
          return mPage[index];
        case 2:
          mPage[index] = new TopBarPage(
            stateBar: StateStyle.STATUS_BAR,
            child: ShoppingPage(),
            leftBtnGone: true,
            rightBtnGone: true,
            title: "订单",
          );
          return mPage[index];
        case 3:
          mPage[index] = new TopBarPage(
            stateBar: StateStyle.NO_STATUS_BAR,
            child: MySelfPage(),
            title: "我的",
          );
          return mPage[index];
        default:
          mPage[index] = new TopBarPage(
            stateBar: StateStyle.STATUS_BAR_TRANSPARENT,
            child: IndexPage(),
            title: "首页",
          );
          return mPage[index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return new Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: 4,
        reverse: false,
        onPageChanged: onPageChanged,
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          return getContainerView(index);
        },
      ),
//      TopBarPage(
//        stateBar: getStateBar(page),
//        title: getCurrentTitle(page),
//        child: PageView(
//          children: mPage,
//          controller: pageController,
//          onPageChanged: onPageChanged,
//        ),
//      ),
//      body: PageView.builder(
//        itemCount: mPage.length,
//        controller: pageController,
//        onPageChanged: onPageChanged,
//        itemBuilder: (BuildContext context, int index) {
//          return Stack(
//            children: <Widget>[
//              mPage[index],
//              new Container(
//                height: barHeight,
//                width: getScreenWidth(context),
//                decoration: BoxDecoration(color: Colors.blueGrey),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: getSysStatsHeight(context),
//                      decoration: BoxDecoration(color: Colors.red),
//                    ),
//                    Expanded(
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Image(
//                            image:
//                                new AssetImage('images/icon_black_arrow.png'),
//                            height: 32.0,
//                            width: 32.0,
//                          ),
//                          Text("222"),
//                          Image(
//                            image:
//                                new AssetImage('images/icon_black_share.png'),
//                            height: 32.0,
//                            width: 32.0,
//                          ),
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//              )
//            ],
//          );
//        },
//      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.laptop_chromebook),
            title: new Text("主页"),
            backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text("分类"),
            backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.local_grocery_store),
            title: new Text("购物车"),
            backgroundColor: Colors.grey),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text("我的"),
            backgroundColor: Colors.grey)
      ], onTap: onClickTap, currentIndex: page),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onClickTap(int index) {
//    pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  void onPageChanged(int page) {
    setState(() {
      print("onPageChanged");
      this.page = page;
    });
  }
}
