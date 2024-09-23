@implementation APAdRequester

- (void)sendAnalyticsForGettingAdResponse:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  double v31;
  __int16 v32;
  double v33;

  v3 = a3;
  v4 = APLogForCategory(21);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v31 = *(double *)&v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[LegacyInterface] Context (%@) got an ad response.", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "prefetchTimestamp"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "prefetchTimestamp"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v10);
    v12 = v11;

    v13 = APLogForCategory(21);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
      *(_DWORD *)buf = 138543618;
      v31 = *(double *)&v16;
      v32 = 2050;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[LegacyInterface] Context %{public}@: Pre-fetch to daemon ad response interval is %{public}f.", buf, 0x16u);

    }
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"));
    v19 = -[NSObject isEqual:](v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = APLogForCategory(21);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%f Invalid interval", buf, 0xCu);
      }
    }
    else
    {
      v29[0] = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", 4, CFSTR("Interval"), CFSTR("IntervalType")));
      v29[1] = v23;
      v28[2] = CFSTR("NetworkType");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", 0));
      v29[2] = v24;
      v28[3] = CFSTR("PlacementType");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "current"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v25, "placement")));
      v29[3] = v26;
      v28[4] = CFSTR("Failed");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v29[4] = v27;
      v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 5));

      +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("adtiming"), v21);
    }

  }
  else
  {
    v22 = APLogForCategory(21);
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "prefetchTimestamp is nil!", buf, 2u);
    }
  }

}

- (void)requestAds:(id)a3
{
  id v4;
  APAdBatchRequester *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  APAdBatchRequester *v10;
  APAdBatchRequester *v11;
  _QWORD v12[4];
  APAdBatchRequester *v13;
  APAdRequester *v14;

  v4 = a3;
  v5 = [APAdBatchRequester alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester clientInfo](self, "clientInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester idAccount](self, "idAccount"));
  v10 = -[APAdBatchRequester initWithBatch:bundleID:requestIdentifier:clientInfo:idAccount:](v5, "initWithBatch:bundleID:requestIdentifier:clientInfo:idAccount:", v4, v6, v7, v8, v9);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000168F0;
  v12[3] = &unk_100214620;
  v13 = v10;
  v14 = self;
  v11 = v10;
  -[APAdBatchRequester makeRequest:](v11, "makeRequest:", v12);

}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (APIDAccount_Private)idAccount
{
  return (APIDAccount_Private *)objc_getProperty(self, a2, 40, 1);
}

- (APClientInfo)clientInfo
{
  return (APClientInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)checkForDiscards:(id)a3 placementType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  APJourneyDaemonMetricHelper *v12;
  void *v13;
  APJourneyDaemonMetricHelper *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));

    v12 = [APJourneyDaemonMetricHelper alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
    v14 = -[APJourneyDaemonMetricHelper initWithContentData:](v12, "initWithContentData:", v13);

    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.AdValidationErrorDomain")))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
      v17 = objc_msgSend(v16, "code");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v19 = -[APAdRequester _handleAdValidationErrorDomainWithJourneyMetricsHelper:code:internalContent:type:](self, "_handleAdValidationErrorDomainWithJourneyMetricsHelper:code:internalContent:type:", v14, v17, v6, v18);

      if ((v19 & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ap.DaemonDiscardedErrorDomain")))
      {
        v20 = objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "error"));
        -[APJourneyDaemonMetricHelper discardedForBundleID:withCode:](v14, "discardedForBundleID:withCode:", v20, objc_msgSend(v22, "code"));
        goto LABEL_11;
      }
      if (objc_msgSend(v11, "isEqualToString:", NSURLErrorDomain))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester identifier](self, "identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
        -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v14, "requestFailedForBundleID:withCode:requestID:placement:placementType:", v23, 3300, v25, 0, a4);

      }
    }
    v26 = APLogForCategory(21);
    v20 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
    v27 = 138543618;
    v28 = v22;
    v29 = 2114;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Error domain for Content %{public}@ is %{public}@. Not sending a discard metric.", (uint8_t *)&v27, 0x16u);
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatorLock, 0);
  objc_storeStrong((id *)&self->_adAccumulator, 0);
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (APAdRequester)initWithBundleID:(id)a3 identifier:(id)a4 clientInfo:(id)a5 idAccount:(id)a6 accumulateRequests:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  APAdRequester *v17;
  APAdRequester *v18;
  uint64_t v19;
  NSObject *v20;
  APUnfairLock *v21;
  APUnfairLock *accumulatorLock;
  objc_super v24;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)APAdRequester;
  v17 = -[APAdRequester init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleID, a3);
    objc_storeStrong((id *)&v18->_identifier, a4);
    v18->_cancelled = 0;
    objc_storeStrong((id *)&v18->_clientInfo, a5);
    objc_storeStrong((id *)&v18->_idAccount, a6);
    if (v7)
    {
      v19 = APPerfLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v18->_signpostID = os_signpost_id_generate(v20);

      v21 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
      accumulatorLock = v18->_accumulatorLock;
      v18->_accumulatorLock = v21;

      -[APAdRequester _setupAccumulator](v18, "_setupAccumulator");
    }
  }

  return v18;
}

- (void)cancelRequest
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = APLogForCategory(21);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester identifier](self, "identifier"));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancelling request %{public}@", (uint8_t *)&v6, 0xCu);

  }
  self->_cancelled = 1;
}

- (BOOL)_handleAdValidationErrorDomainWithJourneyMetricsHelper:(id)a3 code:(int64_t)a4 internalContent:(id)a5 type:(id)a6
{
  id v10;
  id v11;
  id v12;
  APDiagnosticDaemonMetricHelper *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  APDiagnosticDaemonMetricHelper *v18;
  uint64_t v19;
  BOOL v20;
  APDiagnosticDaemonMetricHelper *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v32;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4 == 4509)
  {
    v13 = (APDiagnosticDaemonMetricHelper *)objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester identifier](self, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    v16 = objc_msgSend(v12, "integerValue");
    v17 = v10;
    v18 = v13;
    v19 = 3302;
  }
  else
  {
    if (a4 != 4508)
    {
      v21 = [APDiagnosticDaemonMetricHelper alloc];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v13 = -[APDiagnosticDaemonMetricHelper initWithContentData:](v21, "initWithContentData:", v22);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "error"));
      v24 = objc_msgSend(v23, "code");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "error"));
      v27 = v11;
      v28 = v10;
      v29 = v12;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedDescription"));
      -[APDiagnosticDaemonMetricHelper validationFailed:reason:](v13, "validationFailed:reason:", v24, v30);

      v12 = v29;
      v10 = v28;
      v11 = v27;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
      objc_msgSend(v10, "discardedForBundleID:withCode:", v14, 2605);
      v20 = 1;
      goto LABEL_7;
    }
    v13 = (APDiagnosticDaemonMetricHelper *)objc_claimAutoreleasedReturnValue(-[APAdRequester bundleID](self, "bundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester identifier](self, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    v16 = objc_msgSend(v12, "integerValue");
    v17 = v10;
    v18 = v13;
    v19 = 3301;
  }
  objc_msgSend(v17, "requestFailedForBundleID:withCode:requestID:placement:placementType:", v18, v19, v15, 0, v16);

  v20 = 0;
LABEL_7:

  return v20;
}

- (void)_setupAccumulator
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  APAccumulator *v19;
  APAccumulator *adAccumulator;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester accumulatorLock](self, "accumulatorLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester adAccumulator](self, "adAccumulator"));
  if (v4)
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(-[APAdRequester accumulatorLock](self, "accumulatorLock"));
    objc_msgSend(v23, "unlock");

    return;
  }
  v5 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APAdBatchAccumulatorConfig));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v6)
  {
    v10 = 200;
    v11 = 100;
LABEL_13:
    v16 = 4;
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accumulationTime"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accumulationTime"));
    v10 = objc_msgSend(v9, "unsignedIntValue");

  }
  else
  {
    v10 = 200;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inactivityTime"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inactivityTime"));
    v11 = objc_msgSend(v13, "unsignedIntValue");

  }
  else
  {
    v11 = 100;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemLimit"));

  if (!v14)
    goto LABEL_13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemLimit"));
  v16 = objc_msgSend(v15, "unsignedIntValue");

LABEL_14:
  v17 = APLogForCategory(21);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v27 = v10;
    v28 = 2048;
    v29 = v11;
    v30 = 2048;
    v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Creating ad accumulator with parameters: accumulate: %lu, inactivity: %lu, limit: %lu", buf, 0x20u);
  }

  v19 = -[APAccumulator initWithAccumulationTime:inactivityTime:itemLimit:]([APAccumulator alloc], "initWithAccumulationTime:inactivityTime:itemLimit:", v10, v11, v16);
  adAccumulator = self->_adAccumulator;
  self->_adAccumulator = v19;

  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CB1D8;
  v24[3] = &unk_100214648;
  objc_copyWeak(&v25, (id *)buf);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester adAccumulator](self, "adAccumulator"));
  objc_msgSend(v21, "setAccumulationHandler:", v24);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester accumulatorLock](self, "accumulatorLock"));
  objc_msgSend(v22, "unlock");

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)accumulateAdRequests:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  APAdRequester *v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  -[APUnfairLock lock](self->_accumulatorLock, "lock");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v33;
    *(_QWORD *)&v6 = 134349570;
    v29 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester adAccumulator](self, "adAccumulator", v29));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accumulatedItems"));
        v13 = objc_msgSend(v12, "count");

        if (!v13)
        {
          v14 = APPerfLogForCategory(0);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = -[APAdRequester signpostID](self, "signpostID");
          if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v17 = v16;
            if (os_signpost_enabled(v15))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "AccumulationInterval", ", buf, 2u);
            }
          }

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester adAccumulator](self, "adAccumulator"));
        objc_msgSend(v18, "accumulate:", v10);

        v19 = APLogForCategory(21);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequester adAccumulator](self, "adAccumulator"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accumulatedItems"));
          v22 = objc_msgSend(v21, "count");
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
          v25 = self;
          v26 = v7;
          v27 = v8;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
          *(_DWORD *)buf = v29;
          v37 = v22;
          v38 = 2114;
          v39 = v23;
          v40 = 2114;
          v41 = v28;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Adding request #%{public}lu to batch with identifier %{public}@ and context %{public}@", buf, 0x20u);

          v8 = v27;
          v7 = v26;
          self = v25;

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v7);
  }

  -[APUnfairLock unlock](self->_accumulatorLock, "unlock");
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setIdAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (APAccumulator)adAccumulator
{
  return self->_adAccumulator;
}

- (void)setAdAccumulator:(id)a3
{
  objc_storeStrong((id *)&self->_adAccumulator, a3);
}

- (APUnfairLock)accumulatorLock
{
  return self->_accumulatorLock;
}

- (void)setAccumulatorLock:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatorLock, a3);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
