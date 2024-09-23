@implementation APPCIntegrityReportEventListener

+ (id)sharedInstance
{
  void *v3;
  APPCIntegrityReportEventListener *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APUniversalSingleton sharedInstance](APUniversalSingleton, "sharedInstance"));
  v4 = (APPCIntegrityReportEventListener *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "integrityReportEventListener"));
  if (!v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v4 = (APPCIntegrityReportEventListener *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "integrityReportEventListener"));
    if (!v4)
    {
      v4 = objc_alloc_init(APPCIntegrityReportEventListener);
      objc_msgSend(v3, "setIntegrityReportEventListener:", v4);
    }
    objc_sync_exit(v5);

  }
  return v4;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;
  void **v6;
  uint64_t v7;
  void (*v8)(id *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationRegistrar"));
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10016A7BC;
  v9 = &unk_1002187B0;
  objc_copyWeak(&v10, &location);
  v5 = objc_msgSend(v4, "registerHandlerForExternalPurposesAndAllMetricsWithClosure:", &v6);
  -[APPCBaseEventListener setToken:](self, "setToken:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_storeIntegrityEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  APReportDate *v7;
  void *v8;
  APReportDate *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  int v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "metric")));
    v7 = [APReportDate alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = -[APReportDate initWithDate:](v7, "initWithDate:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    v11 = objc_msgSend(v10, "getTableForClass:", objc_opt_class(APDBReportEventCount));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APReportDate monthDayInteger](v9, "monthDayInteger")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "purpose")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "branch"));
    v16 = objc_msgSend(v12, "addCountForDayOfYear:purpose:event:value:environment:branch:", v13, v14, v6, 0, CFSTR("PROD"), v15);

    if ((v16 & 1) == 0)
    {
      v17 = APLogForCategory(34);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 138477827;
        v21 = (id)objc_opt_class(self);
        v19 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Store integrity event to DB failed.", (uint8_t *)&v20, 0xCu);

      }
    }

  }
}

@end
