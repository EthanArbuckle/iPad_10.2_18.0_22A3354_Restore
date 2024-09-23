@implementation _LTActivityLogger

- (_LTActivityLogger)init
{
  _LTActivityLogger *v2;
  uint64_t v3;
  NSCalendar *calendar;
  _LTActivityLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTActivityLogger;
  v2 = -[_LTActivityLogger init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

    objc_storeWeak((id *)&v2->_delegate, v2);
    v5 = v2;
  }

  return v2;
}

- (void)registerActivity:(int64_t)a3
{
  void *v5;
  NSObject *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    v6 = _LTOSLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_LTActivityLogger registerActivity:].cold.1(v6);
  }
  -[_LTActivityLogger _registerActivity:onDate:](self, "_registerActivity:onDate:", a3, v5);

}

- (void)_registerActivity:(int64_t)a3 onDate:(id)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (!a3)
  {
    objc_msgSend(WeakRetained, "lastAggregateLogDateForActivityLogger:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_10:
    -[_LTActivityLogger _logAllIntervalsForTask:date:](self, "_logAllIntervalsForTask:date:", a3, v9);
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "activityLogger:lastLoggedDateForTask:", self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTActivityLogger _registerActivity:onDate:](self, "_registerActivity:onDate:", 0, v9);
  if (!v8)
    goto LABEL_10;
LABEL_3:
  if (!-[NSCalendar isDate:inSameDayAsDate:](self->_calendar, "isDate:inSameDayAsDate:", v9, v8))
    -[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 0, v9);
  if (!-[NSCalendar isDate:equalToDate:toUnitGranularity:](self->_calendar, "isDate:equalToDate:toUnitGranularity:", v9, v8, 0x2000))-[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 1, v9);
  if (!-[NSCalendar isDate:equalToDate:toUnitGranularity:](self->_calendar, "isDate:equalToDate:toUnitGranularity:", v9, v8, 8))-[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 2, v9);
LABEL_11:
  -[_LTActivityLogger _updateLastLoggedDate:forTask:](self, "_updateLastLoggedDate:forTask:", v9, a3);

}

- (void)_logAllIntervalsForTask:(int64_t)a3 date:(id)a4
{
  id v6;

  v6 = a4;
  -[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 0, v6);
  -[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 1, v6);
  -[_LTActivityLogger _logActivityForTask:interval:date:](self, "_logActivityForTask:interval:date:", a3, 2, v6);

}

- (void)_logActivityForTask:(int64_t)a3 interval:(unint64_t)a4 date:(id)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = _LTOSLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 2)
      v10 = CFSTR("undefined");
    else
      v10 = off_251A10EF0[a4];
    v11 = v9;
    -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_DEFAULT, "Log %{public}@ activity for %{public}@", (uint8_t *)&v15, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "activityLogger:logUsageForTask:interval:date:", self, a3, a4, v8);
  }
  else
  {
    objc_msgSend(WeakRetained, "activityLogger:logAggregateUsageForInterval:date:", self, a4, v8);
    if (a4 == 1)
      -[_LTActivityLogger _logAssetSnapshotForDate:](self, "_logAssetSnapshotForDate:", v8);
  }

}

- (void)_logAssetSnapshotForDate:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _LTDAnalyticsAssetSnapshotProvider *v7;
  _LTDAnalyticsAssetSnapshotProvider *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assetSnapshotProvider);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (_LTDAnalyticsAssetSnapshotProvider *)WeakRetained;
  else
    v7 = objc_alloc_init(_LTDAnalyticsAssetSnapshotProvider);
  v8 = v7;

  v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_LTActivityLogger _logAssetSnapshotForDate:].cold.1(v9);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke;
  v11[3] = &unk_251A10ED0;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  -[_LTDAnalyticsAssetSnapshotProvider collectAssetSnapshotWithCompletion:](v8, "collectAssetSnapshotWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_updateLastLoggedDate:(id)a3 forTask:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _LTOSLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = v7;
    -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v6;
    _os_log_debug_impl(&dword_2491B9000, v10, OS_LOG_TYPE_DEBUG, "Updating last logged date for %{public}@ to: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (a4)
    objc_msgSend(WeakRetained, "activityLogger:updateLastLoggedDate:forTask:", self, v6, a4);
  else
    objc_msgSend(WeakRetained, "activityLogger:updateLastAggregateLogDate:", self, v6);

}

- (void)activityLogger:(id)a3 logUsageForTask:(int64_t)a4 interval:(unint64_t)a5 date:(id)a6
{
  id v10;
  id v11;

  v11 = a3;
  v10 = a6;
  switch(a5)
  {
    case 2uLL:
      -[_LTActivityLogger _sendMonthlyUsageForTask:date:](self, "_sendMonthlyUsageForTask:date:", a4, v10);
      break;
    case 1uLL:
      -[_LTActivityLogger _sendWeeklyUsageForTask:date:](self, "_sendWeeklyUsageForTask:date:", a4, v10);
      break;
    case 0uLL:
      -[_LTActivityLogger _sendDailyUsageForTask:date:](self, "_sendDailyUsageForTask:date:", a4, v10);
      break;
  }

}

- (id)activityLogger:(id)a3 lastLoggedDateForTask:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_LTActivityLogger _activityDatePreferenceKeyForTask:](self, "_activityDatePreferenceKeyForTask:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)activityLogger:(id)a3 updateLastLoggedDate:(id)a4 forTask:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  -[_LTActivityLogger _activityDatePreferenceKeyForTask:](self, "_activityDatePreferenceKeyForTask:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (void)activityLogger:(id)a3 logAggregateUsageForInterval:(unint64_t)a4 date:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  switch(a4)
  {
    case 2uLL:
      -[_LTActivityLogger _sendMonthlyUsageForTask:date:](self, "_sendMonthlyUsageForTask:date:", 0, v8);
      break;
    case 1uLL:
      -[_LTActivityLogger _sendWeeklyUsageForTask:date:](self, "_sendWeeklyUsageForTask:date:", 0, v8);
      break;
    case 0uLL:
      -[_LTActivityLogger _sendDailyUsageForTask:date:](self, "_sendDailyUsageForTask:date:", 0, v8);
      break;
  }

}

- (void)activityLogger:(id)a3 logAssetSnapshot:(id)a4 forDate:(id)a5
{
  -[_LTActivityLogger _sendWeeklyMobileAssetSnapshot:date:](self, "_sendWeeklyMobileAssetSnapshot:date:", a4, a5);
}

- (id)lastAggregateLogDateForActivityLogger:(id)a3
{
  return -[_LTActivityLogger activityLogger:lastLoggedDateForTask:](self, "activityLogger:lastLoggedDateForTask:", a3, 0);
}

- (void)activityLogger:(id)a3 updateLastAggregateLogDate:(id)a4
{
  -[_LTActivityLogger activityLogger:updateLastLoggedDate:forTask:](self, "activityLogger:updateLastLoggedDate:forTask:", a3, a4, 0);
}

- (void)_sendDailyUsageForTask:(int64_t)a3 date:(id)a4
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("feature");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)_weekNameForDate:(id)a3
{
  void *v3;
  void *v4;

  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 8196, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0*ld_%ld"), 2, objc_msgSend(v3, "weekOfYear"), objc_msgSend(v3, "year"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_sendWeeklyUsageForTask:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTActivityLogger _weekNameForDate:](self, "_weekNameForDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("feature");
  v10[1] = CFSTR("week_name");
  v11[0] = v7;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)_sendMonthlyUsageForTask:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 12, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0*ld_%ld"), 2, objc_msgSend(v8, "month"), objc_msgSend(v8, "year"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("feature");
  v11[1] = CFSTR("month_name");
  v12[0] = v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)_sendWeeklyMobileAssetSnapshot:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_LTActivityLogger _weekNameForDate:](self, "_weekNameForDate:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[0] = CFSTR("week_name");
  v17[1] = CFSTR("asset_build_number");
  objc_msgSend(v6, "assetBuild");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<UNAVAILABLE>");
  v18[1] = v10;
  v17[2] = CFSTR("expected_configuration_version");
  objc_msgSend(v6, "expectedAssetVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("<UNAVAILABLE>");
  v18[2] = v13;
  v17[3] = CFSTR("installed_configuration_version");
  objc_msgSend(v6, "installedAssetVersion");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = CFSTR("<UNAVAILABLE>");
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)_featureNameForTask:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("aggregate");
  else
    return off_251A10F08[a3];
}

- (id)_activityDatePreferenceKeyForTask:(int64_t)a3
{
  void *v3;
  void *v4;

  -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("LastActivityDate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_LTActivityLoggerDelegate)delegate
{
  return (_LTActivityLoggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_LTDAnalyticsAssetSnapshotProviding)assetSnapshotProvider
{
  return (_LTDAnalyticsAssetSnapshotProviding *)objc_loadWeakRetained((id *)&self->_assetSnapshotProvider);
}

- (void)setAssetSnapshotProvider:(id)a3
{
  objc_storeWeak((id *)&self->_assetSnapshotProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetSnapshotProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)registerActivity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2491B9000, log, OS_LOG_TYPE_FAULT, "Client attempted to register unspecified event; clients should always specify which event is being logged",
    v1,
    2u);
  OUTLINED_FUNCTION_0();
}

- (void)_logAssetSnapshotForDate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Beginning request to collect asset snapshot", v1, 2u);
  OUTLINED_FUNCTION_0();
}

@end
