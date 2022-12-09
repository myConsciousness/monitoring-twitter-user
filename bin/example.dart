// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:batch/batch.dart';
import 'package:example/monitor_job.dart';

import 'package:line_notify/line_notify.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

void main(List<String> args) => runWorkflow(
      args: args,
      argsConfigBuilder: (parser) => parser
        ..addOption('apiConsumerKey', abbr: 'k')
        ..addOption('apiConsumerSecret', abbr: 'c')
        ..addOption('apiToken', abbr: 't')
        ..addOption('apiSecret', abbr: 's')
        ..addOption('lineNotifyToken', abbr: 'l'),
      onLoadArgs: (args) => <String, dynamic>{
        'twitterApi': TwitterApi(
          bearerToken: '',
          oauthTokens: OAuthTokens(
            consumerKey: args['apiConsumerKey'],
            consumerSecret: args['apiConsumerSecret'],
            accessToken: args['apiToken'],
            accessTokenSecret: args['apiSecret'],
          ),
          retryConfig: RetryConfig.ofExponentialBackOffAndJitter(
            maxAttempts: 15,
            onExecute: (event) =>
                print('Retry attempts: ${event.retryCount + 1}`'),
          ),
        ),
        'lineNotifyApi': LineNotify(
          token: args['lineNotifyToken'],
        ),
      },
      jobs: [
        MonitoringJob(),
      ],
      logConfig: LogConfiguration(printLog: true),
    );
