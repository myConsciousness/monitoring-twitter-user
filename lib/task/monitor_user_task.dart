// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:async';

import 'package:batch/batch.dart';
import 'package:line_notify/line_notify.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class MonitorUserTask extends Task<MonitorUserTask> {
  @override
  FutureOr<void> execute(ExecutionContext context) async {
    final TwitterApi twitter = context.sharedParameters['twitterApi'];

    try {
      final enemy = await twitter.users.lookupById(userId: '3266693869');

      log.info(enemy.rateLimit);
    } on TwitterException {
      final LineNotify lineNotify = context.sharedParameters['lineNotifyApi'];
      await lineNotify.send(
        message: "@ShinyaKato was deleted, it's time to change your username!",
      );
    }
  }
}
