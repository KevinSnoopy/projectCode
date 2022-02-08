// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_extensions
extension imageString on String {
  AssetImage get image {
    return AssetImage("lib/resource/" + this);
  }
}

// ignore: camel_case_extensions
extension colorString on String {
  Color get color {
    String hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }
}

// ignore: camel_case_extensions
extension numString on String {
  String get noZero {
    if (contains(".") && length > 1) {
      if (substring(length - 1, length) == "0" ||
          substring(length - 1, length) == ".") {
        return substring(0, length - 1).noZero;
      }
    }
    return this;
  }
}

// ignore: camel_case_extensions
extension fontString on String {
  static const String pingFangSC = "PingFangSC";
}

// ignore: camel_case_extensions
extension stringDouble on double {
  String get noZero {
    return toString().noZero;
  }
}

// ignore: camel_case_extensions
extension normalFont on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
}

// ignore: camel_case_extensions
extension alphaColor on Color {
  Color alpha(double a) {
    return withAlpha((a * 255).toInt());
  }
}

// ignore: camel_case_extensions
extension stringDate on DateTime {
  String get yyyymmdd {
    String year = this.year.toString();
    String month = this.month.toString();
    String day = this.day.toString();
    if (this.month <= 9) {
      month = "0" + month;
    }
    if (this.day <= 9) {
      day = "0" + day;
    }
    return year + month + day;
  }

  // ignore: non_constant_identifier_names
  String get yyyymmdd_cn {
    String year = this.year.toString();
    String month = this.month.toString();
    String day = this.day.toString();
    return year + "年" + month + "月" + day + "日";
  }

  String get yyyYmMdD {
    String year = this.year.toString();
    String month = this.month.toString();
    String day = this.day.toString();
    if (this.month <= 9) {
      month = "0" + month;
    }
    if (this.day <= 9) {
      day = "0" + day;
    }
    return year + "/" + month + "/" + day;
  }
}

// ignore: camel_case_extensions
extension dateString on String {
  DateTime get date {
    if (length == 8) {
      return DateTime(year, month, day);
    }
    return DateTime.now();
  }

  int get year {
    if (length == 8) {
      return int.parse(substring(0, 4));
    }
    return 0;
  }

  int get month {
    if (length == 8) {
      return int.parse(substring(4, 6));
    }
    return 0;
  }

  int get day {
    if (length == 8) {
      return int.parse(substring(6, 8));
    }
    return 0;
  }
}

// ignore: camel_case_extensions
extension textString on String {
  Size getSize(TextStyle style, double maxWidth) {
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: this,
        style: style,
      ),
      textDirection: TextDirection.ltr,
      maxLines: null,
      ellipsis: '...',
    );
    painter.layout(
      maxWidth: maxWidth,
    );
    return painter.size;
  }

  Size normalSize(TextStyle style) {
    return getSize(
      style,
      double.infinity,
    );
  }
}
