// ignore_for_file: file_names

import 'dart:ui';

class Tools {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double rpx = 0;
  static double px = 0;
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double dpr = 0;
  static double statusHeight = 0;
  static double bottomHeight = 0;
  static double navgationHeight = 44;
  static double fullNavgationHeight = 0;

  static void initialize({double standardWidth = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.底部安全高度
    bottomHeight = window.padding.bottom / dpr;

    // 6.计算rpx px的大小, iPhone6下 1px = 2rpx
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;

    fullNavgationHeight = statusHeight + navgationHeight;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return rpx * size * 2;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return rpx * size;
  }
}

// ignore: camel_case_extensions
extension toolsDouble on double {
  double get px {
    return Tools.setPx(this);
  }

  double get rpx {
    return Tools.setRpx(this);
  }
}
