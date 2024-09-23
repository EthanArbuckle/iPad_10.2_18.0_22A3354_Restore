@implementation APPCEventStorageListener

+ (id)sharedInstance
{
  void *v3;
  APPCEventStorageListener *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APUniversalSingleton sharedInstance](APUniversalSingleton, "sharedInstance"));
  v4 = (APPCEventStorageListener *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStorageListener"));
  if (!v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v4 = (APPCEventStorageListener *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStorageListener"));
    if (!v4)
    {
      v4 = objc_alloc_init(APPCEventStorageListener);
      objc_msgSend(v3, "setEventStorageListener:", v4);
    }
    objc_sync_exit(v5);

  }
  return v4;
}

- (APPCEventStorageListener)init
{
  APPCEventStorageListener *v2;
  NSSet *v3;
  NSSet *allowList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APPCEventStorageListener;
  v2 = -[APPCBaseEventListener init](&v6, "init");
  if (v2)
  {
    v3 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("com.apple.AppStore"), CFSTR("com.apple.AppStore.ProductPageExtension"), 0);
    allowList = v2->_allowList;
    v2->_allowList = v3;

  }
  return v2;
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
  v8 = sub_10016CBC8;
  v9 = &unk_1002187B0;
  objc_copyWeak(&v10, &location);
  v5 = objc_msgSend(v4, "registerHandlerForPurpose:closure:", 100, &v6);
  -[APPCBaseEventListener setToken:](self, "setToken:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_storeEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  id v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  const __CFString *v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPCEventStorageListener allowList](self, "allowList"));
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = APLogForCategory(34);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v51 = (id)objc_opt_class(self);
        v52 = 2114;
        v53 = (uint64_t)v5;
        v10 = v51;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{private}@] Event Storage discarding metric for BundleId: %{public}@", buf, 0x16u);

      }
      goto LABEL_35;
    }
LABEL_8:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
    v18 = objc_msgSend(v17, "getTableForClass:", objc_opt_class(APDBEvent));
    v9 = objc_claimAutoreleasedReturnValue(v18);

    if (v9)
    {
      v19 = (char *)objc_msgSend(v4, "metric");
      if ((unint64_t)(v19 - 1406) <= 5 && ((1 << (v19 - 126)) & 0x25) != 0)
      {
        if (objc_msgSend(v4, "metric") == (id)1406)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "properties"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("percent")));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "properties"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("duration")));

          v24 = 0;
          if (v21 && v23)
          {
            objc_msgSend(v21, "doubleValue");
            if (v25 >= 50.0)
            {
              objc_msgSend(v23, "doubleValue");
              v24 = v33 >= 1000.0;
            }
            else
            {
              v24 = 0;
            }
          }

        }
        else
        {
          v24 = 0;
        }
        v34 = APLogForCategory(34);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = (void *)objc_opt_class(self);
          v37 = v36;
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
          v39 = (void *)v38;
          v40 = CFSTR("NO");
          *(_DWORD *)buf = 138478339;
          v51 = v36;
          v52 = 2114;
          if (v24)
            v40 = CFSTR("YES");
          v53 = v38;
          v54 = 2114;
          v55 = v40;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "[%{private}@] Storing event %{public}@ as impression: %{public}@", buf, 0x20u);

        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "metric")));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        -[NSObject insertEvent:handle:impression:timestamp:](v9, "insertEvent:handle:impression:timestamp:", v28, v31, v24, v32);
LABEL_34:

        goto LABEL_35;
      }
      if (v19 == (char *)1000)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internalProperties"));
        v27 = v26;
        if (v26)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", kAPMetricSubscriptionIdentifier));
          v29 = kAPMetricImpressionIdentifier;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", kAPMetricImpressionIdentifier));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", kAPMetadataIdentifier));
          if (v30)
          {
            v48 = v29;
            v49 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
          }
          else
          {
            v32 = 0;
          }

        }
        else
        {
          v32 = 0;
          v31 = 0;
          v28 = 0;
        }
        v41 = APLogForCategory(34);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          v43 = (void *)objc_opt_class(self);
          v47 = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
          *(_DWORD *)buf = 138478083;
          v51 = v43;
          v52 = 2114;
          v53 = (uint64_t)v44;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "[%{private}@] Storing recieved event %{public}@", buf, 0x16u);

        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
        -[NSObject insertReceivedEventWithHandle:bundleId:adamId:adMetadata:adProperties:](v9, "insertReceivedEventWithHandle:bundleId:adamId:adMetadata:adProperties:", v45, v46, v28, v31, v32);

        goto LABEL_34;
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  v11 = APLogForCategory(34);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_opt_class(self);
    v14 = v13;
    v15 = objc_msgSend(v4, "metric");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
    *(_DWORD *)buf = 138478339;
    v51 = v13;
    v52 = 2048;
    v53 = (uint64_t)v15;
    v54 = 2114;
    v55 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{private}@] BundleID is nil for metric %ld for contentIdentifier %{public}@", buf, 0x20u);

  }
  if (objc_msgSend(v4, "source") == 978)
    goto LABEL_8;
LABEL_36:

}

- (NSSet)allowList
{
  return self->_allowList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end
