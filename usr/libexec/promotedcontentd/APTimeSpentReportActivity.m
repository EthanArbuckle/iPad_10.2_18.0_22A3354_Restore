@implementation APTimeSpentReportActivity

- (APTimeSpentReportActivity)initWithLegacyInterface:(id)a3
{
  id v5;
  APTimeSpentReportActivity *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APTimeSpentReportActivity;
  v6 = -[APTimeSpentReportActivity init](&v12, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.ap.promotedcontentd.timespentactivity.queue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_legacyInterface, a3);
  }

  return v6;
}

- (NSString)taskID
{
  return (NSString *)CFSTR("com.apple.ap.promotedcontentd.timespent");
}

- (BOOL)runActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[APTimeSpentReportActivity setIsCancelled:](self, "setIsCancelled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentReportActivity legacyInterface](self, "legacyInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeSpentProcessor"));
  -[APTimeSpentReportActivity setTimeSpentLegacyInterface:](self, "setTimeSpentLegacyInterface:", v6);

  objc_initWeak(&location, self);
  v7 = objc_claimAutoreleasedReturnValue(-[APTimeSpentReportActivity queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003985C;
  v10[3] = &unk_10020DF88;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = APLogForCategory(48);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Request Time Spent Report activity deferral.", v8, 2u);
  }

  -[APTimeSpentReportActivity cancelActiveWork:](self, "cancelActiveWork:", v5);
}

- (void)terminateActivity:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = APLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Time Spent Activity Terminated.", v6, 2u);
  }

  -[APTimeSpentReportActivity cancelActiveWork:](self, "cancelActiveWork:", 0);
}

- (void)makeTimeSpentRequests:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  APTimeSpentStoreDatabase *v24;
  void *v25;
  APTimeSpentStoreDatabase *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  void *v48;

  v6 = a3;
  v7 = a4;
  if (!-[APTimeSpentReportActivity isCancelled](self, "isCancelled"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v38 = v7;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contentId"));
      if (objc_msgSend(v41, "length"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", v41));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentData"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

        if (objc_msgSend(v39, "length"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v39));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idAccount"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anonymousDemandID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "anonymousDemandID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
          v36 = v6;
          v18 = v12;
          v19 = v8;
          v20 = objc_msgSend(v15, "isEqualToString:", v17) ^ 1;

          v6 = v36;
        }
        else
        {
          v22 = APLogForCategory(48);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v41;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No managed content data for %{public}@.", buf, 0xCu);
          }

          v19 = v8;
          v20 = 0;
          v11 = 0;
        }
        v21 = v19;
        if (!-[APTimeSpentReportActivity sendDiagnosticReport:context:isUserChanged:](self, "sendDiagnosticReport:context:isUserChanged:", v19, v11, v20))
        {
          if (!v19)
          {
LABEL_17:

            v7 = v38;
            goto LABEL_18;
          }
          v26 = (APTimeSpentStoreDatabase *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contentDataPrivate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contentDataTransient"));
          objc_msgSend(v29, "timeSpent");
          v31 = v30;

          objc_initWeak((id *)buf, self);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentReportActivity timeSpentLegacyInterface](self, "timeSpentLegacyInterface"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientId"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentStoreDatabase adResponseIdentifier](v26, "adResponseIdentifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentStoreDatabase batchResponseID](v26, "batchResponseID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentStoreDatabase impressionIdentifier](v26, "impressionIdentifier"));
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100039F80;
          v42[3] = &unk_10020DFB0;
          v43 = v6;
          objc_copyWeak(&v45, (id *)buf);
          v44 = v38;
          objc_msgSend(v32, "sendTimeSpentMetricFor:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:completionHandler:", v33, v41, v39, v37, v34, v35, v31, v42);

          objc_destroyWeak(&v45);
          objc_destroyWeak((id *)buf);
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        v21 = 0;
        v11 = 0;
        v39 = 0;
        if (!-[APTimeSpentReportActivity sendDiagnosticReport:context:isUserChanged:](self, "sendDiagnosticReport:context:isUserChanged:", 0, 0, 0))goto LABEL_17;
      }
      v24 = [APTimeSpentStoreDatabase alloc];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
      v26 = -[APTimeSpentStoreDatabase initWithDatabase:](v24, "initWithDatabase:", v25);

      v46 = v41;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
      -[APTimeSpentStoreDatabase removeEntriesForContentIds:](v26, "removeEntriesForContentIds:", v27);

      objc_msgSend(v6, "removeLastObject");
      v28 = objc_autoreleasePoolPush();
      -[APTimeSpentReportActivity makeTimeSpentRequests:activity:](self, "makeTimeSpentRequests:activity:", v6, v38);
      objc_autoreleasePoolPop(v28);
      goto LABEL_16;
    }
    objc_msgSend(v7, "finished");
  }
LABEL_18:

}

- (BOOL)sendDiagnosticReport:(id)a3 context:(id)a4 isUserChanged:(BOOL)a5
{
  BOOL v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 1;
  v6 = v5 || a5;
  if (v6)
  {
    v7 = a5;
    v8 = a4 == 0;
    v9 = a3 == 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trying to send time spent metric for promoted content with content id: %@, but couldn't find it or user account changed."), v10));

    v21[0] = CFSTR("ManagedContentNotFound");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    v22[0] = v12;
    v21[1] = CFSTR("ManagedContextNotFound");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
    v22[1] = v13;
    v21[2] = CFSTR("ExpiredAnonId");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v22[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));

    CreateDiagnosticReport(v11, v15, CFSTR("TimeSpentDailyRequester"));
    v16 = APLogForCategory(48);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@.", buf, 0xCu);
    }

  }
  return v6;
}

- (void)cancelActiveWork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[APTimeSpentReportActivity setIsCancelled:](self, "setIsCancelled:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentReportActivity timeSpentLegacyInterface](self, "timeSpentLegacyInterface"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentReportActivity timeSpentLegacyInterface](self, "timeSpentLegacyInterface"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003A310;
    v7[3] = &unk_10020DFD8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "cancel:", v7);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (double)retrieveTimeSpentTTLConfigValue
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = +[APConfigurationMediator configurationForClass:usingCache:](APConfigurationMediator, "configurationForClass:usingCache:", objc_opt_class(APSponsorshipPlacementConfig), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeSpentMetricTTL"));
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = 21600.0;
  }

  return v7;
}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (APTimeSpentLegacyInterface)timeSpentLegacyInterface
{
  return self->_timeSpentLegacyInterface;
}

- (void)setTimeSpentLegacyInterface:(id)a3
{
  objc_storeStrong((id *)&self->_timeSpentLegacyInterface, a3);
}

- (APMetricsLegacyInterface)legacyInterface
{
  return self->_legacyInterface;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyInterface, 0);
  objc_storeStrong((id *)&self->_timeSpentLegacyInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->criteria, 0);
  objc_storeStrong((id *)&self->taskID, 0);
}

@end
