@implementation HDSPWakeUpResultsNotificationBuilder

- (HDSPWakeUpResultsNotificationBuilder)initWithDaySummaries:(id)a3 morningIndexRange:(id)a4 userFirstName:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  id v10;
  HDSPWakeUpResultsNotificationBuilder *v11;
  uint64_t v12;
  NSArray *daySummaries;
  HDSPWakeUpResultsNotificationBuilder *v14;
  objc_super v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDSPWakeUpResultsNotificationBuilder;
  v11 = -[HDSPWakeUpResultsNotificationBuilder init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    daySummaries = v11->_daySummaries;
    v11->_daySummaries = (NSArray *)v12;

    v11->_morningIndexRange.start = var0;
    v11->_morningIndexRange.duration = var1;
    objc_storeStrong((id *)&v11->_userFirstName, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)hasSufficientSleepData
{
  NSArray *daySummaries;
  void *v5;
  uint64_t v6;
  int64_t duration;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_morningIndexRange.start == *MEMORY[0x24BDD2B60]
    && self->_morningIndexRange.duration == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      NSStringFromHKDayIndexRange();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Init failed: Invalid morning index range %{public}@", (uint8_t *)&v19, 0x16u);

    }
    goto LABEL_23;
  }
  daySummaries = self->_daySummaries;
  if (!daySummaries)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v13 = v20;
      v14 = "[%{public}@] Init failed: Nil sleep day summaries";
      goto LABEL_22;
    }
LABEL_23:

    return 0;
  }
  if (!-[NSArray count](daySummaries, "count"))
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v13 = v20;
      v14 = "[%{public}@] Init failed: Zero sleep day summaries";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  -[NSArray lastObject](self->_daySummaries, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "morningIndex");
  duration = self->_morningIndexRange.duration;
  if (duration <= 0)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = self->_morningIndexRange.start + duration - 1;

  if (v6 != v8)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v13 = v20;
      v14 = "[%{public}@] Init failed: No sleep day summary for last night";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  -[NSArray lastObject](self->_daySummaries, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sleepDuration");
  v11 = v10;

  if (v11 <= 0.0)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v13 = v20;
      v14 = "[%{public}@] Init failed: No asleep duration for last night";
LABEL_22:
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0xCu);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  return 1;
}

- (id)buildNotification
{
  NSObject *v3;
  void *v4;
  NSArray *daySummaries;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSArray *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  HDSPWakeUpResultsNotificationBuilder *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    daySummaries = self->_daySummaries;
    v6 = v4;
    v7 = -[NSArray count](daySummaries, "count");
    NSStringFromHKDayIndexRange();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v4;
    v35 = 2048;
    v36 = v7;
    v37 = 2114;
    v38 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building notification from %lu summaries in range %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showSensitiveLogItems");

  if (v10)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_daySummaries;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v29;
      *(_QWORD *)&v13 = 138543618;
      v27 = v13;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v11);
          HKSPLogForCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = self;
            v19 = (void *)objc_opt_class();
            v20 = v19;
            HKSensitiveLogItem();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v34 = v19;
            self = v18;
            v35 = 2114;
            v36 = (uint64_t)v21;
            _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Summary: %{public}@", buf, 0x16u);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

  }
  if (-[HDSPWakeUpResultsNotificationBuilder _didMeetSleepDurationGoalLastNight](self, "_didMeetSleepDurationGoalLastNight", v27, v28))
  {
    -[HDSPWakeUpResultsNotificationBuilder _sleepDurationGoalAchievedTwoWeekNotification](self, "_sleepDurationGoalAchievedTwoWeekNotification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      -[HDSPWakeUpResultsNotificationBuilder _sleepDurationGoalAchievedShortWeekNotification](self, "_sleepDurationGoalAchievedShortWeekNotification");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        -[HDSPWakeUpResultsNotificationBuilder _sleepDurationGoalAchievedLastNightNotification](self, "_sleepDurationGoalAchievedLastNightNotification");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    HKSPLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v34 = v24;
      v25 = v24;
      _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not meet sleep duration goal last night; this is required for all notifications",
        buf,
        0xCu);

    }
    v22 = 0;
  }
  return v22;
}

- (BOOL)_didMeetSleepDurationGoalLastNight
{
  int64_t duration;
  int64_t v3;
  void *v4;
  BOOL v5;

  duration = self->_morningIndexRange.duration;
  if (duration <= 0)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = self->_morningIndexRange.start + duration - 1;
  objc_msgSend(MEMORY[0x24BEA9A20], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sleepDurationGoalAchievedCount") == 1;

  return v5;
}

- (id)_sleepDurationGoalAchievedTwoWeekNotification
{
  int64_t start;
  int64_t duration;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  start = self->_morningIndexRange.start;
  duration = self->_morningIndexRange.duration;
  objc_msgSend(MEMORY[0x24BEA9A20], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, start, duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepDurationGoalAchievedCount");
  if (v6 > 9)
  {
    v10 = v6;
    if ((unint64_t)v6 < 0xF)
    {
      v12 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, (double)v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 2, start, duration, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v8 = v17;
      v9 = "[%{public}@] Too many days achieved for two-week goal notification";
      goto LABEL_7;
    }
  }
  else
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v8 = v17;
      v9 = "[%{public}@] Not enough days achieved for two-week goal notification";
LABEL_7:
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0xCu);

    }
  }

  v11 = 0;
LABEL_10:

  return v11;
}

- (id)_sleepDurationGoalAchievedShortWeekNotification
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = self->_morningIndexRange.start + 10;
  objc_msgSend(MEMORY[0x24BEA9A20], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sleepDurationGoalAchievedCount");
  if (v5 > 2)
  {
    v9 = v5;
    if ((unint64_t)v5 < 5)
    {
      v11 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, (double)v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 1, v3, 4, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v7 = v16;
      v8 = "[%{public}@] Too many days achieved for short-week goal notification";
      goto LABEL_7;
    }
  }
  else
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v7 = v16;
      v8 = "[%{public}@] Not enough days achieved for short-week goal notification";
LABEL_7:
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);

    }
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (id)_sleepDurationGoalAchievedLastNightNotification
{
  int64_t duration;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  duration = self->_morningIndexRange.duration;
  if (duration <= 0)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = self->_morningIndexRange.start + duration - 1;
  objc_msgSend(MEMORY[0x24BEA9A20], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepDurationGoalAchievedCount");
  if (v6 <= 0)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      v12 = "[%{public}@] Not enough days achieved for last night goal notification";
LABEL_11:
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);

    }
LABEL_12:

    v9 = 0;
    goto LABEL_13;
  }
  if (v6 != 1)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      v12 = "[%{public}@] Too many days achieved for last night goal notification";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  -[NSArray lastObject](self->_daySummaries, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepDurationGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 0, v4, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v9;
}

- (int64_t)_randomNotificationVariantForCategory:(unint64_t)a3
{
  uint32_t v3;

  if (a3 > 2)
    v3 = 0;
  else
    v3 = dword_216185F30[a3];
  return arc4random_uniform(v3) + 1;
}

- (id)_notificationForCategory:(unint64_t)a3 morningIndexRange:(id)a4 goalAchieved:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  HDSPWakeUpResultsNotification *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  HDSPWakeUpResultsNotification *v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a5;
  v10 = [HDSPWakeUpResultsNotification alloc];
  if (var1 <= 0)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = var1 + var0 - 1;
  v12 = -[HDSPWakeUpResultsNotificationBuilder _randomNotificationVariantForCategory:](self, "_randomNotificationVariantForCategory:", a3);
  -[HDSPWakeUpResultsNotificationBuilder userFirstName](self, "userFirstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDSPWakeUpResultsNotification initWithCategory:endMorningIndex:goalAchieved:notificationVariant:userFirstName:](v10, "initWithCategory:endMorningIndex:goalAchieved:notificationVariant:userFirstName:", a3, v11, v9, v12, v13);

  return v14;
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_morningIndexRange.duration;
  start = self->_morningIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFirstName, 0);
  objc_storeStrong((id *)&self->_daySummaries, 0);
}

@end
