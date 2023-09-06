import 'dart:io';
import 'dart:typed_data';

import 'package:davinci/davinci.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_widget/home_widget.dart';
import 'package:home_widget_demo/constants/strings.dart';
import 'package:path_provider/path_provider.dart';

class HomeWidgetConfig {
  static Future<void> update(context, Widget widget) async {
    Uint8List bytes = await DavinciCapture.offStage(widget,
        context: context,
        returnImageUint8List: true,
        wait: const Duration(seconds: 1),
        openFilePreview: true);

    final directory = await getApplicationSupportDirectory();
    File tempFile =
        File("${directory.path}/${DateTime.now().toIso8601String()}.png");
    await tempFile.writeAsBytes(bytes);

    await HomeWidget.saveWidgetData('filename', tempFile.path);
    await HomeWidget.updateWidget(
        iOSName: iosWidget, androidName: androidWidget);
  }

  static Future<void> initialize() async {
    await HomeWidget.setAppGroupId(groupId);
  }
}
