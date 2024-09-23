@implementation APDailyReportActivity

- (NSString)taskID
{
  return (NSString *)CFSTR("com.apple.ap.promotedcontentd.dailyreport");
}

- (APXPCActivityCriteria)criteria
{
  id v3;

  v3 = objc_alloc_init((Class)APXPCActivityCriteria);
  objc_msgSend(v3, "setRequiresNetworkConnectivity:", 0);
  objc_msgSend(v3, "setIsRepeating:", 0);
  objc_msgSend(v3, "setGracePeriod:", 3600);
  objc_msgSend(v3, "setIsCPUIntensive:", 0);
  objc_msgSend(v3, "setPriority:", XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  objc_msgSend(v3, "setRequireSleep:", 1);
  objc_msgSend(v3, "setDelay:", -[APDailyReportActivity _delay](self, "_delay"));
  objc_msgSend(v3, "setRequireClassCData:", 1);
  return (APXPCActivityCriteria *)v3;
}

- (BOOL)runActivity:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  APSigningObservabilityCorrespondent *v7;
  void *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = APLogForCategory(39);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Daily Report Activity Started.", v10, 2u);
  }

  PreparePastDueReports();
  PrepareReports();
  -[APDailyReportActivity _dropExpiredEventTables](self, "_dropExpiredEventTables");
  -[APDailyReportActivity _sendEventDatabaseCoreAnalytics](self, "_sendEventDatabaseCoreAnalytics");
  v7 = objc_alloc_init(APSigningObservabilityCorrespondent);
  -[APSigningObservabilityCorrespondent submitReport](v7, "submitReport");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
  objc_msgSend(v8, "incrementalVacuumIfNeeded");

  objc_msgSend(v4, "schedule");
  return 0;
}

- (void)terminateActivity:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = APLogForCategory(39);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daily Report Activity Terminated.", v5, 2u);
  }

}

- (int64_t)_delay
{
  double v3;

  -[APDailyReportActivity _timeIntervalToTomorrow](self, "_timeIntervalToTomorrow");
  return (uint64_t)(v3
                 + (double)(arc4random_uniform(-[APDailyReportActivity _deliveryLeeway](self, "_deliveryLeeway")) + 1));
}

- (int)_deliveryLeeway
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = +[APConfigurationMediator configurationForClass:usingCache:](APConfigurationMediator, "configurationForClass:usingCache:", objc_opt_class(APCSIntegrityReport), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deliveryLeeway"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deliveryLeeway"));
    v6 = objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = 10800;
  }

  return v6;
}

- (double)_timeIntervalToTomorrow
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSGregorianCalendar);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  objc_msgSend(v2, "setTimeZone:", v3);
  v4 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v4, "setHour:", 0);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v4, "setTimeZone:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nextDateAfterDate:matchingComponents:options:", v5, v4, 2));
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  return v8;
}

- (void)_dropExpiredEventTables
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  __int16 v14;
  uint8_t buf[16];
  __int16 v16;

  if (-[APDailyReportActivity _isEventDatabaseStorageEnabled](self, "_isEventDatabaseStorageEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    v3 = objc_msgSend(v2, "getTableForClass:", objc_opt_class(APDBEvent));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

    if (v4)
    {
      if (objc_msgSend(v4, "dropExpiredEventTables"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
        v6 = objc_msgSend(v5, "getTableForClass:", objc_opt_class(APDBAdInstance));
        v7 = objc_claimAutoreleasedReturnValue(v6);

        if (-[NSObject deleteAdInstancesWithNoEvents](v7, "deleteAdInstancesWithNoEvents"))
        {
          v8 = APLogForCategory(11);
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Event Database expiration of data completed successfully.", buf, 2u);
          }

          goto LABEL_14;
        }

      }
      v13 = APLogForCategory(11);
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = 0;
        v11 = "Event Database expiration of data completed with error.";
        v12 = (uint8_t *)&v14;
        goto LABEL_13;
      }
    }
    else
    {
      v10 = APLogForCategory(11);
      v7 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v16 = 0;
        v11 = "Error: Daily Activity did not get Event Table instance, drop events failed.";
        v12 = (uint8_t *)&v16;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v11, v12, 2u);
      }
    }
LABEL_14:

  }
}

- (BOOL)_isEventDatabaseStorageEnabled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;

  v2 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSEventDatabase));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isEventDatabaseStorageEnabled"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isEventDatabaseStorageEnabled"));
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }
  v7 = APLogForCategory(34);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("DISABLED");
    if (v6)
      v9 = CFSTR("ENABLED");
    v11 = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[Event Database] Event storage is: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (void)_sendEventDatabaseCoreAnalytics
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  NSObject *v28;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    v3 = objc_msgSend(v2, "getTableForClass:", objc_opt_class(APDBEvent));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allEvents"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allEvents"));
        v7 = objc_msgSend(v6, "count");

        v8 = objc_claimAutoreleasedReturnValue(+[APDatabasePath pathForName:](APDatabasePath, "pathForName:", CFSTR("APDatabase")));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject databaseFilePath](v8, "databaseFilePath"));
        v24 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, &v24));
        v12 = v24;
        v13 = (unint64_t)objc_msgSend(v11, "fileSize");

        if (v12)
        {
          v14 = APLogForCategory(11);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
            *(_DWORD *)buf = 138543362;
            v28 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error: Daily Activity couldn't get file size, error: %{public}@", buf, 0xCu);

          }
        }
        else
        {
          v25[0] = CFSTR("DBFilesize");
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13 / 0x3E8));
          v25[1] = CFSTR("TotalEvents");
          v26[0] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
          v26[1] = v21;
          v15 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));

          v22 = APLogForCategory(11);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Event Database Core Analytics, payload: %{public}@", buf, 0xCu);
          }

          +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("EventCollectionDatabase"), v15);
        }

        goto LABEL_16;
      }
      v19 = APLogForCategory(11);
      v8 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v18 = "Error: Daily Activity did not get All Events array. Event DB CA failed.";
        goto LABEL_11;
      }
    }
    else
    {
      v17 = APLogForCategory(11);
      v8 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v18 = "Error: Daily Activity did not get Event Table instance, Event DB CA failed.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v18, buf, 2u);
      }
    }
LABEL_16:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->criteria, 0);
  objc_storeStrong((id *)&self->taskID, 0);
}

@end
