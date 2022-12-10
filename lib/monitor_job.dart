// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:batch/batch.dart';

import 'task/monitor_user_task.dart';

class MonitoringJob implements ScheduledJobBuilder {
  @override
  ScheduledJob build() => ScheduledJob(
        name: 'Monitoring Job',
        schedule: CronParser('*/3 * * * * * '),
        steps: [
          Step(
            name: 'Monitor User Step',
            task: MonitorUserTask(),
          ),
        ],
      );
}
