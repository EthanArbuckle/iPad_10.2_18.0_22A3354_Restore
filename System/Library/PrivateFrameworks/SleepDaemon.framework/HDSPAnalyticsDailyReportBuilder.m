@implementation HDSPAnalyticsDailyReportBuilder

- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 morningIndexRange:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  id v10;
  HDSPAnalyticsDailyReportBuilder *v11;
  HDSPAnalyticsDailyReportBuilder *v12;
  HDSPAnalyticsDailyReportBuilder *v13;
  uint64_t v15;
  NSArray *daySummaries;
  objc_super v18;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HDSPAnalyticsDailyReportBuilder;
  v11 = -[HDSPAnalyticsDailyReportBuilder init](&v18, sel_init);
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    if (var0 == *MEMORY[0x24BDD2B60] && var1 == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
    {
      v13 = 0;
    }
    else
    {
      objc_storeWeak((id *)&v11->_environment, v9);
      v15 = objc_msgSend(v10, "copy");
      daySummaries = v12->_daySummaries;
      v12->_daySummaries = (NSArray *)v15;

      v12->_morningIndexRange.start = var0;
      v12->_morningIndexRange.duration = var1;
      v13 = v12;
    }
  }

  return v13;
}

- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 breathingDisturbanceSamples:(id)a5 sleepApneaFeatureStatus:(id)a6 morningIndexRange:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  id v16;
  HDSPSleepApneaAnalyticsBuilder *v17;
  void *v18;
  HDSPSleepApneaAnalyticsBuilder *v19;
  HDSPSleepApneaAnalyticsBuilder *sleepApneaAnalyticsBuilder;
  HDSPAnalyticsDailyReportBuilder *v21;

  var1 = a7.var1;
  var0 = a7.var0;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [HDSPSleepApneaAnalyticsBuilder alloc];
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDSPSleepApneaAnalyticsBuilder initWithBreathingDisturbanceSamples:sleepApneaFeatureStatus:morningIndexRange:gregorianCalendar:](v17, "initWithBreathingDisturbanceSamples:sleepApneaFeatureStatus:morningIndexRange:gregorianCalendar:", v14, v13, var0, var1, v18);

  sleepApneaAnalyticsBuilder = self->_sleepApneaAnalyticsBuilder;
  self->_sleepApneaAnalyticsBuilder = v19;

  v21 = -[HDSPAnalyticsDailyReportBuilder initWithEnvironment:daySummaries:morningIndexRange:](self, "initWithEnvironment:daySummaries:morningIndexRange:", v16, v15, var0, var1);
  return v21;
}

- (id)buildReports
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    -[HDSPAnalyticsDailyReportBuilder daySummaries](self, "daySummaries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[HDSPAnalyticsDailyReportBuilder morningIndexRange](self, "morningIndexRange");
    NSStringFromHKDayIndexRange();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v3;
    v33 = 2050;
    v34 = v6;
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building daily analytics report from %{public}lu summaries in range %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showSensitiveLogItems");

  if (v9)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HDSPAnalyticsDailyReportBuilder daySummaries](self, "daySummaries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          HKSPLogForCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (void *)objc_opt_class();
            v17 = v16;
            HKSensitiveLogItem();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v16;
            v33 = 2114;
            v34 = (uint64_t)v18;
            _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Summary: %{public}@", buf, 0x16u);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

  }
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HDSPAnalyticsDailyReportBuilder _dailyReportEvent](self, "_dailyReportEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

  -[HDSPAnalyticsDailyReportBuilder _windDownEvents](self, "_windDownEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v21);

  -[HDSPAnalyticsDailyReportBuilder analyticsStore](self, "analyticsStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "markAllActionsAsCollected");

  v23 = (void *)objc_msgSend(v19, "copy");
  return v23;
}

- (id)currentDate
{
  void *v2;
  void (**v3)(void);
  void *v4;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDateProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)healthStore
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthStoreProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sleepSchedule
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sleepSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sleepFocusConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepFocusModeBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepFocusConfiguration:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)analyticsManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPAnalyticsDailyReportBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analyticsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)analyticsStore
{
  void *v2;
  void *v3;

  -[HDSPAnalyticsDailyReportBuilder analyticsManager](self, "analyticsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analyticsStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dailyReportEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  int v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  -[HDSPAnalyticsDailyReportBuilder currentDate](self, "currentDate");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEA9A20];
  -[HDSPAnalyticsDailyReportBuilder daySummaries](self, "daySummaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPAnalyticsDailyReportBuilder morningIndexRange](self, "morningIndexRange");
  objc_msgSend(v5, "sleepMetricsForDaySummaries:inMorningIndexRange:", v6, v7, v8);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BEA9840]);
  -[HDSPAnalyticsDailyReportBuilder sleepSchedule](self, "sleepSchedule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder sleepSettings](self, "sleepSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder analyticsManager](self, "analyticsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsImproveHealthAndActivitySubmissionAllowed:", objc_msgSend(v12, "isImproveHealthAndActivitySubmissionAllowed"));

  -[HDSPAnalyticsDailyReportBuilder _userAgeForCurrentDate:](self, "_userAgeForCurrentDate:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserAge:", v13);

  -[HDSPAnalyticsDailyReportBuilder _biologicalSex](self, "_biologicalSex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBiologicalSex:", v14);

  objc_msgSend(MEMORY[0x24BEA9848], "activePairedWatchProductType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveWatchProductType:", v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sleepEventRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sleepCoachingOnboardingFirstCompletedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder _weeksSinceOnboardDate:currentDate:calendar:](self, "_weeksSinceOnboardDate:currentDate:calendar:", v19, v3, v4);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sleepTrackingOnboardingFirstCompletedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder _weeksSinceOnboardDate:currentDate:calendar:](self, "_weeksSinceOnboardDate:currentDate:calendar:", v21, v3, v4);
  v22 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v3;
  -[HDSPAnalyticsDailyReportBuilder _weeksSinceOnboardDate:currentDate:calendar:](self, "_weeksSinceOnboardDate:currentDate:calendar:", v23, v3, v4);
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWeeksSinceOnboardedSleepSchedule:", v20);
  v78 = (void *)v22;
  objc_msgSend(v9, "setWeeksSinceOnboardedSleepTracking:", v22);
  v77 = (void *)v24;
  objc_msgSend(v9, "setWeeksSinceOnboardedWindDownActions:", v24);
  if (v20)
    v25 = 0;
  else
    v25 = objc_msgSend(v10, "hasOccurrences");
  objc_msgSend(v9, "setScheduleMigration:", v25);
  objc_msgSend(v10, "sleepDurationGoal");
  objc_msgSend(v9, "setSleepGoal:");
  objc_msgSend(v9, "setWatchSleepTrackingEnabled:", objc_msgSend(v11, "sleepTracking"));
  objc_msgSend(v9, "setTimeInBedTrackingEnabled:", objc_msgSend(v11, "timeInBedTracking"));
  objc_msgSend(v9, "setBedTimeWindDownRemindersEnabled:", objc_msgSend(v11, "bedtimeReminders"));
  objc_msgSend(v9, "setWakeUpResultsEnabled:", objc_msgSend(v11, "wakeUpResults"));
  objc_msgSend(v9, "setScheduledSleepModeEnabled:", objc_msgSend(v11, "scheduledSleepMode"));
  objc_msgSend(v9, "setChargeRemindersEnabled:", objc_msgSend(v11, "chargingReminders"));
  objc_msgSend(v9, "setInteractedWithWindDownLast24Hrs:", -[HDSPAnalyticsDailyReportBuilder _didInteractWithWindDownActionsWithinLastTwoDays](self, "_didInteractWithWindDownActionsWithinLastTwoDays"));
  objc_msgSend(v9, "setUseSleepScreen:", ((unint64_t)objc_msgSend(v11, "sleepModeOptions") >> 14) & 1);
  objc_msgSend(v9, "setMaxSleepCoachingVersionOnboarded:", objc_msgSend(v18, "sleepCoachingOnboardingCompletedVersion"));
  objc_msgSend(v9, "setMaxSleepTrackingVersionOnboarded:", objc_msgSend(v18, "sleepTrackingOnboardingCompletedVersion"));
  -[HDSPAnalyticsDailyReportBuilder sleepFocusConfiguration](self, "sleepFocusConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v18;
  v81 = v11;
  v79 = (void *)v20;
  v75 = v26;
  if (objc_msgSend(v26, "hasSleepFocusMode"))
    v27 = objc_msgSend(v26, "state") != 1;
  else
    v27 = 0;
  objc_msgSend(v9, "setHasSleepFocusConfigured:", v27);
  objc_msgSend(v10, "occurrenceOnDay:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleMonday:", v28 != 0);
  objc_msgSend(v28, "alarmConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmMonday:", objc_msgSend(v29, "isEnabled"));

  objc_msgSend(v28, "alarmConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "toneIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierMonday:", v31);

  v74 = v28;
  objc_msgSend(v9, "setIsDefaultScheduleMonday:", objc_msgSend(v28, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v10, "occurrenceOnDay:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleTuesday:", v32 != 0);
  objc_msgSend(v32, "alarmConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmTuesday:", objc_msgSend(v33, "isEnabled"));

  objc_msgSend(v32, "alarmConfiguration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "toneIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierTuesday:", v35);

  v73 = v32;
  objc_msgSend(v9, "setIsDefaultScheduleTuesday:", objc_msgSend(v32, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v10, "occurrenceOnDay:", 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleWednesday:", v36 != 0);
  objc_msgSend(v36, "alarmConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmWednesday:", objc_msgSend(v37, "isEnabled"));

  objc_msgSend(v36, "alarmConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "toneIdentifier");
  v39 = v10;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierWednesday:", v40);

  v72 = v36;
  objc_msgSend(v9, "setIsDefaultScheduleWednesday:", objc_msgSend(v36, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v39, "occurrenceOnDay:", 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleThursday:", v41 != 0);
  objc_msgSend(v41, "alarmConfiguration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmThursday:", objc_msgSend(v42, "isEnabled"));

  objc_msgSend(v41, "alarmConfiguration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "toneIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierThursday:", v44);

  v70 = v41;
  objc_msgSend(v9, "setIsDefaultScheduleThursday:", objc_msgSend(v41, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v39, "occurrenceOnDay:", 6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleFriday:", v45 != 0);
  objc_msgSend(v45, "alarmConfiguration");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmFriday:", objc_msgSend(v46, "isEnabled"));

  objc_msgSend(v45, "alarmConfiguration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "toneIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierFriday:", v48);

  v69 = v45;
  objc_msgSend(v9, "setIsDefaultScheduleFriday:", objc_msgSend(v45, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v39, "occurrenceOnDay:", 7);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleSaturday:", v49 != 0);
  objc_msgSend(v49, "alarmConfiguration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmSaturday:", objc_msgSend(v50, "isEnabled"));

  objc_msgSend(v49, "alarmConfiguration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "toneIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierSaturday:", v52);

  objc_msgSend(v9, "setIsDefaultScheduleSaturday:", objc_msgSend(v49, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v39, "occurrenceOnDay:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleSunday:", v53 != 0);
  objc_msgSend(v53, "alarmConfiguration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlarmSunday:", objc_msgSend(v54, "isEnabled"));

  objc_msgSend(v53, "alarmConfiguration");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "toneIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHapticToneIdentifierSunday:", v56);

  objc_msgSend(v9, "setIsDefaultScheduleSunday:", objc_msgSend(v53, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v9, "setScheduleDisabled:", objc_msgSend(v39, "isEnabled") ^ 1);
  objc_msgSend(v9, "setScheduleChangePast24Hours:", -[HDSPAnalyticsDailyReportBuilder _changedSchedule:withinNumberOfDays:currentDate:calendar:](self, "_changedSchedule:withinNumberOfDays:currentDate:calendar:", v39, 1, v76, v4));
  v71 = v39;
  objc_msgSend(v9, "setScheduleChangePast7days:", -[HDSPAnalyticsDailyReportBuilder _changedSchedule:withinNumberOfDays:currentDate:calendar:](self, "_changedSchedule:withinNumberOfDays:currentDate:calendar:", v39, 7, v76, v4));
  objc_msgSend(v82, "standardDeviationActualTimeAsleep");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStddevActualTimeAsleep:", v57);

  objc_msgSend(v82, "standardDeviationScheduledTimeAsleep");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStddevScheduledTimeAsleep:", v58);

  objc_msgSend(v82, "standardDeviationActualVsScheduledTimeAsleep");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStddevActualVsScheduledTimeAsleep:", v59);

  objc_msgSend(v9, "setDaysWornWatchToSleepInLast7Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 7, 0, v4));
  objc_msgSend(v9, "setDaysWornWatchToSleepInLast30Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 30, 0, v4));
  objc_msgSend(v9, "setWeekendDaysWornWatchToSleepInLast7Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 7, 1, v4));
  objc_msgSend(v9, "setDidWearWatchToSleepLastNight:", -[HDSPAnalyticsDailyReportBuilder _woreWatchToSleepLastNight](self, "_woreWatchToSleepLastNight"));
  -[HDSPAnalyticsDailyReportBuilder _bucketedSleepDurationLastNight](self, "_bucketedSleepDurationLastNight");
  objc_msgSend(v9, "setSleepDurationLastNight:");
  -[HDSPAnalyticsDailyReportBuilder _sleepDurationLastNightIncludingAwake:](self, "_sleepDurationLastNightIncludingAwake:", 1);
  v60 = (void *)objc_opt_class();
  -[HDSPAnalyticsDailyReportBuilder _lastNightsDurationForSleepStage:](self, "_lastNightsDurationForSleepStage:", 2);
  objc_msgSend(v9, "setSleepStagePercentAwakeLastNight:", (double)(unint64_t)objc_msgSend(v60, "_stageDurationPercentage:ofTotalDuration:"));
  v61 = (void *)objc_opt_class();
  -[HDSPAnalyticsDailyReportBuilder _lastNightsDurationForSleepStage:](self, "_lastNightsDurationForSleepStage:", 5);
  objc_msgSend(v9, "setSleepStagePercentRemLastNight:", (double)(unint64_t)objc_msgSend(v61, "_stageDurationPercentage:ofTotalDuration:"));
  v62 = (void *)objc_opt_class();
  -[HDSPAnalyticsDailyReportBuilder _lastNightsDurationForSleepStage:](self, "_lastNightsDurationForSleepStage:", 3);
  objc_msgSend(v9, "setSleepStagePercentCoreLastNight:", (double)(unint64_t)objc_msgSend(v62, "_stageDurationPercentage:ofTotalDuration:"));
  v63 = (void *)objc_opt_class();
  -[HDSPAnalyticsDailyReportBuilder _lastNightsDurationForSleepStage:](self, "_lastNightsDurationForSleepStage:", 4);
  objc_msgSend(v9, "setSleepStagePercentDeepLastNight:", (double)(unint64_t)objc_msgSend(v63, "_stageDurationPercentage:ofTotalDuration:"));
  v64 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v64, "behavior");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "features");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "nebula");

  if (v67)
    -[HDSPSleepApneaAnalyticsBuilder updateDailyReportWithSleepApneaAnalytics:](self->_sleepApneaAnalyticsBuilder, "updateDailyReportWithSleepApneaAnalytics:", v9);

  return v9;
}

- (int64_t)_daysWatchWornToSleepOverLastNumberOfDays:(int64_t)a3 excludeWeekdays:(BOOL)a4 calendar:(id)a5
{
  id v8;
  void *v9;
  int64_t duration;
  int64_t v11;
  int64_t v12;
  void *v13;
  NSArray *daySummaries;
  id v15;
  id v16;
  void *v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  int64_t v23;
  int64_t v24;
  BOOL v25;

  v8 = a5;
  v9 = v8;
  duration = self->_morningIndexRange.duration;
  v11 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = v11 - a3 + 1;
  objc_msgSend(v8, "hk_weekendDays");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  daySummaries = self->_daySummaries;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __102__HDSPAnalyticsDailyReportBuilder__daysWatchWornToSleepOverLastNumberOfDays_excludeWeekdays_calendar___block_invoke;
  v20[3] = &unk_24D4E3EF0;
  v23 = v12;
  v24 = a3;
  v25 = a4;
  v21 = v9;
  v22 = v13;
  v15 = v13;
  v16 = v9;
  -[NSArray hk_filter:](daySummaries, "hk_filter:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  return v18;
}

uint64_t __102__HDSPAnalyticsDailyReportBuilder__daysWatchWornToSleepOverLastNumberOfDays_excludeWeekdays_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "morningIndex");
  v5 = *(_QWORD *)(a1 + 48);
  v6 = __OFSUB__(v4, v5);
  v7 = v4 - v5;
  v8 = v7 < 0 == v6 && v7 < *(_QWORD *)(a1 + 56);
  if (v8 && objc_msgSend(v3, "containsPeriodsWithAppleSleepTrackingData"))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v3, "dateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "component:fromDate:", 512, v11);

      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_woreWatchToSleepLastNight
{
  int64_t duration;
  int64_t v3;
  NSArray *daySummaries;
  void *v5;
  char v6;
  _QWORD v8[6];

  duration = self->_morningIndexRange.duration;
  v3 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  daySummaries = self->_daySummaries;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HDSPAnalyticsDailyReportBuilder__woreWatchToSleepLastNight__block_invoke;
  v8[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v8[4] = v3;
  v8[5] = 1;
  -[NSArray na_firstObjectPassingTest:](daySummaries, "na_firstObjectPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsPeriodsWithAppleSleepTrackingData");

  return v6;
}

BOOL __61__HDSPAnalyticsDailyReportBuilder__woreWatchToSleepLastNight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = objc_msgSend(a2, "morningIndex");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __OFSUB__(v3, v4);
  v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(_QWORD *)(a1 + 40);
}

- (double)_bucketedSleepDurationLastNight
{
  double v2;
  double v3;
  unint64_t v4;
  unint64_t v5;
  double v6;

  -[HDSPAnalyticsDailyReportBuilder _sleepDurationLastNightIncludingAwake:](self, "_sleepDurationLastNightIncludingAwake:", 0);
  v3 = v2 / 60.0;
  v4 = (unint64_t)v3 / 0x3C;
  v5 = (unint64_t)v3 % 0x3C;
  v6 = dbl_216185E80[v5 < 0x2D];
  if (v5 < 0xF)
    v6 = 0.0;
  return v6 + (double)v4 * 3600.0;
}

- (double)_sleepDurationLastNightIncludingAwake:(BOOL)a3
{
  int64_t duration;
  int64_t v5;
  NSArray *daySummaries;
  uint64_t v7;
  void *v8;
  double v9;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];

  duration = self->_morningIndexRange.duration;
  v5 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  daySummaries = self->_daySummaries;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke;
  v17[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v17[4] = v5;
  v17[5] = 1;
  -[NSArray na_firstObjectPassingTest:](daySummaries, "na_firstObjectPassingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_2;
  v11[3] = &unk_24D4E3F60;
  v12 = a3;
  v11[4] = &v13;
  objc_msgSend(v8, "hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:", v11);
  v9 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v9;
}

BOOL __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = objc_msgSend(a2, "morningIndex");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __OFSUB__(v3, v4);
  v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(_QWORD *)(a1 + 40);
}

void __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  v6 = a2;
  HKCategoryValueSleepAnalysisAsleepValues();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
  {

    goto LABEL_5;
  }
  if (!*(_BYTE *)(a1 + 40))
  {

    goto LABEL_7;
  }
  v5 = objc_msgSend(v6, "category");

  if (v5 == 2)
  {
LABEL_5:
    objc_msgSend(v6, "sampleIntervals", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_3;
    v7[3] = &unk_24D4E3F38;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
LABEL_7:

  }
}

double __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "duration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (double)_lastNightsDurationForSleepStage:(int64_t)a3
{
  int64_t duration;
  int64_t v5;
  NSArray *daySummaries;
  uint64_t v7;
  void *v8;
  double v9;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];

  duration = self->_morningIndexRange.duration;
  v5 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  daySummaries = self->_daySummaries;
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke;
  v16[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v16[4] = v5;
  v16[5] = 1;
  -[NSArray na_firstObjectPassingTest:](daySummaries, "na_firstObjectPassingTest:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_2;
  v11[3] = &unk_24D4E3F88;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v8, "hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:", v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

BOOL __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = objc_msgSend(a2, "morningIndex");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __OFSUB__(v3, v4);
  v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(_QWORD *)(a1 + 40);
}

void __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = a2;
  if (objc_msgSend(v4, "category") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "sampleIntervals");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_3;
    v5[3] = &unk_24D4E3F38;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  }
}

double __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "duration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

+ (unint64_t)_stageDurationPercentage:(double)a3 ofTotalDuration:(double)a4
{
  if (a4 <= 0.0)
    return 0;
  else
    return vcvtad_u64_f64(a3 / a4 * 100.0);
}

- (id)_windDownEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder analyticsStore](self, "analyticsStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uncollectedWindDownActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEA9848], "activePairedWatchProductType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepEventRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder currentDate](self, "currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAnalyticsDailyReportBuilder _weeksSinceOnboardDate:currentDate:calendar:](self, "_weeksSinceOnboardDate:currentDate:calendar:", v10, v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__HDSPAnalyticsDailyReportBuilder__windDownEvents__block_invoke;
  v17[3] = &unk_24D4E3FB0;
  v18 = v6;
  v19 = v12;
  v13 = v12;
  v14 = v6;
  objc_msgSend(v5, "na_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __50__HDSPAnalyticsDailyReportBuilder__windDownEvents__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEA9860];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithWindDownEventData:watchProductType:weeksSinceOnboarded:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v5;
}

- (BOOL)_didInteractWithWindDownActionsWithinLastTwoDays
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HDSPAnalyticsDailyReportBuilder currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hk_morningIndexWithCalendar:", v4) - 2;

  -[HDSPAnalyticsDailyReportBuilder analyticsStore](self, "analyticsStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windDownActionsAfterMorningIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "wasUsed") & 1) != 0)
              {

                v19 = 1;
                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v16)
              continue;
            break;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v19 = 0;
    }
    while (v10);
  }
  else
  {
    v19 = 0;
  }
LABEL_19:

  return v19;
}

- (BOOL)_changedSchedule:(id)a3 withinNumberOfDays:(unint64_t)a4 currentDate:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "lastModifiedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "lastModifiedDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hksp_isAfterDate:", v10);

    if (!v14)
    {
      objc_msgSend(v9, "lastModifiedDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:toDate:options:", 16, v17, v10, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v18, "day") <= a4;
      goto LABEL_8;
    }
    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543362;
      v22 = (id)objc_opt_class();
      v20 = v22;
      _os_log_error_impl(&dword_21610C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Schedule's last modified date occurred after the current date", (uint8_t *)&v21, 0xCu);

    }
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)_weeksSinceOnboardDate:(id)a3 currentDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (!objc_msgSend(v7, "hksp_isAfterDate:", v8))
    {
      objc_msgSend(v9, "startOfDayForDate:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startOfDayForDate:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "components:fromDate:toDate:options:", 0x2000, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "weekOfYear"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v16 = v18;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Onboard date occurred after the current date", (uint8_t *)&v17, 0xCu);

    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_biologicalSex
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HDSPAnalyticsDailyReportBuilder healthStore](self, "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "biologicalSexWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      v10 = v9;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Unable access biological sex due to error: %{public}@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "biologicalSex");
  if (v6 > 3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = off_24D4E4020[v6];
LABEL_8:

  return v7;
}

- (id)_userAgeForCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPAnalyticsDailyReportBuilder healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "dateOfBirthComponentsWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v7;
      v13 = v12;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable access age due to error: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v6, "hk_ageWithCurrentDate:", v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- (HDSPSleepApneaAnalyticsBuilder)sleepApneaAnalyticsBuilder
{
  return self->_sleepApneaAnalyticsBuilder;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepApneaAnalyticsBuilder, 0);
  objc_storeStrong((id *)&self->_daySummaries, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
