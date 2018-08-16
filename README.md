# Flutter_Custom_StateBar

GET START
----

简介：一个自定义状态栏封装
---
三种状态栏：</br></br>
1.STATUS_BAR_TRANSPARENT  透明状态栏</br></br>
2.STATUS_BAR              默认状态栏</br></br>
3.NO_STATUS_BAR           没有状态栏</br></br>
4.topCustomStateBar       不为空事，状态栏为你传入的weight</br></br>

用法
=====
```java
new TopBarPage(
            stateBar: StateStyle.STATUS_BAR,
            child: ClassifyPage(),
            leftBtnGone: true,
            rightBtnGone: true,
            title: "目的地",
          );
```

属性:
=====
  属性  | 作用
  ------------- | -------------
 title  | 顶部文字
 stateBar  | 状态栏样式</br>STATUS_BAR_TRANSPARENT</br>STATUS_BAR</br>NO_STATUS_BAR
 child | 内容布局
 topDiver | 顶部状态栏分割线
 topBgColor | 顶部状态栏背景颜色
 topText | 顶部状态栏自定义文字</br>STATUS_BAR_TRANSPARENT,STATUS_BAR 下添加有效</br> NO_STATUS_BAR,自定义状态栏添加无效
 topCustomStateBar | 顶部自定义状态栏(除去child，其他属性失效)
 leftBtnGone | 左边图标是否显示
 rightBtnGone | 右边图标是否显示
 centerTextGone | 中间文字是否显示
 leftBtnImgAssets | 左边图标资源文件
 rightBtnImgAssets | 右边图标资源文件
 clickListener | 状态栏图标以及文字点击事件
 mTopBgBoxDecoration | 顶部状态栏背景框颜色(此时topBgColor属性失效)
 
点击事件：(0表示左边图片的点击事件，1表示中间文字点击事件，2表示右边图片点击事件)
--
```java
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
```
