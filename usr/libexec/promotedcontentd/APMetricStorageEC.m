@implementation APMetricStorageEC

- (void)_processMetric:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  unsigned int v32;
  const __CFString *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  NSObject *v37;
  id v38;
  unsigned int v39;
  char v40;
  BOOL v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  uint64_t v48;
  objc_class *v49;
  NSString *v50;
  _QWORD block[4];
  id v52;
  NSObject *v53;
  BOOL v54;
  char v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;

  v4 = (__CFString *)a3;
  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138478083;
    v57 = v9;
    v58 = 2114;
    v59 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{private}@] Processing metric: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString metricRoute](v4, "metricRoute"));
  if (!objc_msgSend(v10, "metricIsDiagnosticsAndUsage:", -[__CFString metric](v4, "metric")))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:", -[__CFString purpose](v4, "purpose")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject collectionType](v12, "collectionType"));
    v19 = objc_msgSend(v18, "integerValue");

    if (v19 == (id)7401
      && (+[NSProcessInfo isDNUEnabled](NSProcessInfo, "isDNUEnabled") & 1) == 0)
    {
      v27 = APLogForCategory(29);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = (objc_class *)objc_opt_class(self);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = +[NSProcessInfo isDNUEnabled](NSProcessInfo, "isDNUEnabled");
        v33 = CFSTR("NO");
        *(_DWORD *)buf = 138478339;
        v57 = v31;
        v58 = 2114;
        if (v32)
          v33 = CFSTR("YES");
        v59 = v33;
        v60 = 2114;
        v61 = CFSTR("YES");
        v34 = "[%{private}@] Metric will not be processed: DNUEnabled (%{public}@), isDNUCollection (%{public}@)";
        v35 = v28;
        v36 = 32;
        goto LABEL_31;
      }
LABEL_32:

      goto LABEL_33;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC sampler](self, "sampler"));
    v21 = objc_msgSend(v20, "sampleEvent:", -[__CFString purpose](v4, "purpose"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v23 = objc_msgSend(v22, "isRunningTests");

    if ((v23 & 1) != 0)
    {
LABEL_22:
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "channel"));
      if (v28)
      {
        v37 = objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _openBatchForChannel:](self, "_openBatchForChannel:", v28));
        -[NSObject receivedMetric:](v37, "receivedMetric:", v4);
        -[APMetricStorageEC addActiveChannel:](self, "addActiveChannel:", v28);
        v38 = -[__CFString options](v4, "options");
        v39 = -[NSObject shouldRotate](v37, "shouldRotate");
        v40 = v39;
        if ((unint64_t)v38 > 0xFFFFFFFF7FFFFFFFLL || v39)
        {
          v41 = (unint64_t)v38 > 0xFFFFFFFF7FFFFFFFLL;
          -[APMetricStorageEC _closeBatchForChannel:](self, "_closeBatchForChannel:", v28);
          v42 = objc_claimAutoreleasedReturnValue(-[APMetricStorageEC metricsQueue](self, "metricsQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10012476C;
          block[3] = &unk_100215830;
          v54 = v41;
          v52 = (id)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDelivery](self, "serverDelivery"));
          v53 = v28;
          v55 = v40;
          v43 = v52;
          dispatch_async(v42, block);

        }
      }
      else
      {
        v44 = APLogForCategory(29);
        v37 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class(self);
          v46 = NSStringFromClass(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          *(_DWORD *)buf = 138478083;
          v57 = v47;
          v58 = 2114;
          v59 = v4;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: Metric has no channel: %{public}@", buf, 0x16u);

        }
      }

      goto LABEL_32;
    }
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v24 = objc_alloc((Class)NSUserDefaults);
      v25 = objc_msgSend(v24, "initWithSuiteName:", APDefaultsBundleID);
      v26 = objc_msgSend(v25, "integerForKey:", CFSTR("ec.noSampleOverride"));
      if (v26 == (id)1)
      {

        goto LABEL_29;
      }
      if (!v26)
      {

        goto LABEL_22;
      }

    }
    if ((v21 & 1) != 0)
      goto LABEL_22;
LABEL_29:
    v48 = APLogForCategory(29);
    v28 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v49 = (objc_class *)objc_opt_class(self);
      v50 = NSStringFromClass(v49);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v50);
      *(_DWORD *)buf = 138478083;
      v57 = v31;
      v58 = 2114;
      v59 = CFSTR("NO");
      v34 = "[%{private}@] Metric will not be processed: sampled (%{public}@)";
      v35 = v28;
      v36 = 22;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, v34, buf, v36);

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  v11 = APLogForCategory(29);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = APDiagnosticsSubmissionAllowed();
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138478339;
    v57 = v15;
    v58 = 2114;
    if (v16)
      v17 = CFSTR("YES");
    v59 = v17;
    v60 = 2114;
    v61 = CFSTR("YES");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{private}@] Metric will not be processed: DiagnosticSubmissionAllowed (%{public}@), isDNUMetric (%{public}@)", buf, 0x20u);

  }
LABEL_33:

}

- (APECMetricSampler)sampler
{
  return self->_sampler;
}

- (id)_openBatchForChannel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC currentBatches](self, "currentBatches"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  if (!v6)
  {
    v7 = objc_alloc(+[MetricsModuleClasses batchClass](MetricsModuleClasses, "batchClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protectedDestination"));
    v6 = objc_msgSend(v7, "initWithDestination:purpose:", v9, objc_msgSend(v4, "purpose"));

    if (v6)
    {
      objc_msgSend(v5, "setObject:forKey:", v6, v4);
    }
    else
    {
      v10 = APLogForCategory(29);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 138477827;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't create open batch: %{private}@", (uint8_t *)&v16, 0xCu);
      }

      v6 = 0;
    }
  }
  v12 = APLogForCategory(29);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v16 = 138477827;
    v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "using open batch %{private}@", (uint8_t *)&v16, 0xCu);

  }
  return v6;
}

- (NSMutableDictionary)currentBatches
{
  return self->_currentBatches;
}

+ (NSString)openStoragePathPrefix
{
  return (NSString *)CFSTR("o");
}

- (void)receivedMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricOffsetSettings settings](APMetricOffsetSettings, "settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = v7;
  if (!v6 || (objc_msgSend(v7, "timeIntervalSinceDate:", v6), v9 > 14400.0))
    objc_msgSend(v5, "resetRouteOffsets");
  v10 = objc_msgSend(v4, "purpose");
  if (!isInternalPurpose())
  {
    if (!self->_eventCollectionDisabled)
    {
      -[APMetricStorageEC _notifyListenersOfMetric:](self, "_notifyListenersOfMetric:", v4);
      -[NSLock lock](self->_storageLock, "lock");
      -[APMetricStorageEC _processMetric:](self, "_processMetric:", v4);
      -[NSLock unlock](self->_storageLock, "unlock");
      goto LABEL_10;
    }
    v11 = APLogForCategory(29);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v19 = 138478083;
      v20 = v15;
      v21 = 2114;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{private}@] Event collection disabled. Not processing metric %{public}@", (uint8_t *)&v19, 0x16u);

    }
  }
  -[APMetricStorageEC _notifyListenersOfMetric:](self, "_notifyListenersOfMetric:", v4);
LABEL_10:
  if (isExternalPurpose(v10) && !self->_eventCollectionDisabled)
  {
    if (!v6 || (objc_msgSend(v8, "timeIntervalSinceDate:", v6), v16 > 60.0))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v5, "setLastActivity:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDelivery](self, "serverDelivery"));
    objc_msgSend(v18, "startDeliveryTimer");

  }
}

- (void)_notifyListenersOfMetric:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ecServerDictionaryRepresentation"));
    v13 = 138478083;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@] Received metric: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC notificationRegistrar](self, "notificationRegistrar"));
  v12 = objc_msgSend(v4, "copyWithZone:", 0);
  objc_msgSend(v11, "receivedMetric:", v12);

}

- (APMetricNotificationRegister)notificationRegistrar
{
  return self->_notificationRegistrar;
}

- (APMetricServerDelivering)serverDelivery
{
  return self->_serverDelivery;
}

- (void)addActiveChannel:(id)a3
{
  void *v4;
  void *v5;
  APMetricStorageEC *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC channels](self, "channels"));
  if ((objc_msgSend(v4, "containsObject:", v11) & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC channels](v6, "channels"));
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v5 = v9;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObject:", v11));
    -[APMetricStorageEC setChannels:](v6, "setChannels:", v10);
    -[APMetricStorageEC _writeChannels](v6, "_writeChannels");

    objc_sync_exit(v6);
  }

}

- (NSSet)channels
{
  return self->_channels;
}

- (id)_closeBatchesForChannels:(id)a3 shelved:(BOOL)a4 groupBatches:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  char *v18;
  char *v19;
  void *v20;
  objc_class *v21;
  char *i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id obj;
  uint64_t v34;
  id v35;
  _BOOL4 v36;
  id v37;
  APMetricStorageEC *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];

  v5 = a5;
  v36 = a4;
  v7 = a3;
  v38 = self;
  -[NSLock lock](self->_storageLock, "lock");
  if (v5)
    v8 = 10;
  else
    v8 = 1;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v8));
  v37 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v48;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v34)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
      v11 = objc_autoreleasePoolPush();
      v12 = APLogForCategory(29);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v52 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting close batches for channel %{private}@", buf, 0xCu);
      }

      if (v36)
        v14 = objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _shelvedPathForChannel:](v38, "_shelvedPathForChannel:", v10));
      else
        v14 = objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _closedPathForChannel:](v38, "_closedPathForChannel:", v10));
      v15 = (void *)v14;
      v46 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contentsOfDirectoryAtPath:error:", v14, &v46));
      v17 = v46;
      v18 = (char *)objc_msgSend(v16, "count");
      if (v8 >= (unint64_t)v18)
        v19 = v18;
      else
        v19 = (char *)v8;
      if (v19)
      {
        v40 = v17;
        v41 = v16;
        v42 = v10;
        v43 = v11;
        v44 = v9;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingSelector:", "compare:"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subarrayWithRange:", 0, v19));
        v21 = +[MetricsModuleClasses batchClass](MetricsModuleClasses, "batchClass");
        for (i = 0; i != v19; ++i)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", i));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v23));
          v25 = objc_msgSend([v21 alloc], "initWithPath:", v24);
          v26 = APLogForCategory(29);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          v28 = v27;
          if (v25)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v52 = v23;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Closed batch %{private}@", buf, 0xCu);
            }

            objc_msgSend(v45, "addObject:", v25);
            --v8;
          }
          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v52 = v23;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't create closed batch: %{private}@", buf, 0xCu);
            }

          }
        }

        v11 = v43;
        v9 = v44;
        v16 = v41;
        v10 = v42;
        v17 = v40;
      }
      v29 = APLogForCategory(29);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v52 = v10;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Ending close batches for channel %{private}@", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v11);
      if (v8 < 1)
        break;
      if ((id)++v9 == v35)
      {
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v35)
          goto LABEL_6;
        break;
      }
    }
  }

  -[NSLock unlock](v38->_storageLock, "unlock");
  v31 = objc_msgSend(v45, "copy");

  return v31;
}

- (id)_closedPathForChannel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "closedStoragePathPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  v10 = objc_msgSend(v4, "purpose");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v12));

  return v13;
}

+ (NSString)closedStoragePathPrefix
{
  return (NSString *)CFSTR("c");
}

- (void)setEventCollectionDisabled:(BOOL)a3
{
  self->_eventCollectionDisabled = a3;
}

- (void)rotateIDAccount
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  -[APMetricStorageEC setEventCollectionDisabled:](self, "setEventCollectionDisabled:", objc_msgSend(v3, "isChild"));

}

- (BOOL)hasBacklogForChannel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _closedPathForChannel:](self, "_closedPathForChannel:", v4));

  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, &v10));
  v8 = (unint64_t)objc_msgSend(v7, "count") > 0xA;

  return v8;
}

- (id)closeBatchesForChannels:(id)a3
{
  return -[APMetricStorageEC _closeBatchesForChannels:shelved:groupBatches:](self, "_closeBatchesForChannels:shelved:groupBatches:", a3, 0, 1);
}

- (void)closeActiveBatches
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];

  -[NSLock lock](self->_storageLock, "lock");
  v3 = APLogForCategory(29);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting close active batches", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC activeChannels](self, "activeChannels"));
  v6 = objc_msgSend(v5, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = APLogForCategory(29);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "close active batch for %{private}@", buf, 0xCu);
        }

        -[APMetricStorageEC _closeBatchForChannel:](self, "_closeBatchForChannel:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  v15 = APLogForCategory(29);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Exiting close active batches", buf, 2u);
  }

  -[NSLock unlock](self->_storageLock, "unlock");
}

- (void)_closeBatchForChannel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC currentBatches](self, "currentBatches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v7));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "close");
    objc_msgSend(v4, "removeObjectForKey:", v7);
  }

}

+ (id)destinationsStoragePath
{
  return CFSTR("d");
}

- (APMetricStorageEC)init
{
  APMetricStorageEC *v2;
  APMetricStorageEC *v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *metricsQueue;
  APMetricNotificationRegister *v9;
  APMetricNotificationRegister *notificationRegistrar;
  APMetricServerDelivering *v11;
  APMetricServerDelivering *serverDelivery;
  NSLock *v13;
  NSLock *storageLock;
  NSMutableDictionary *v15;
  NSMutableDictionary *currentBatches;
  uint64_t v17;
  NSSet *channels;
  APUnfairLock *v19;
  APUnfairLock *serverDeliveryLock;
  APECMetricSampler *v21;
  APECMetricSampler *sampler;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)APMetricStorageEC;
  v2 = -[APMetricStorageEC init](&v24, "init");
  v3 = v2;
  if (qword_100269A18 != -1)
  {
    dispatch_once(&qword_100269A18, &stru_1002157C8);
    if (!v3)
      return v3;
    goto LABEL_3;
  }
  if (v2)
  {
LABEL_3:
    v4 = +[MetricsModuleClasses notificationRegistrarClass](MetricsModuleClasses, "notificationRegistrarClass");
    v5 = +[MetricsModuleClasses serverDeliveryClass](MetricsModuleClasses, "serverDeliveryClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
    v7 = dispatch_queue_create("com.apple.ap.metrics", 0);
    metricsQueue = v3->_metricsQueue;
    v3->_metricsQueue = (OS_dispatch_queue *)v7;

    v9 = (APMetricNotificationRegister *)objc_alloc_init(v4);
    notificationRegistrar = v3->_notificationRegistrar;
    v3->_notificationRegistrar = v9;

    v11 = (APMetricServerDelivering *)objc_alloc_init(v5);
    serverDelivery = v3->_serverDelivery;
    v3->_serverDelivery = v11;

    v13 = (NSLock *)objc_alloc_init((Class)NSLock);
    storageLock = v3->_storageLock;
    v3->_storageLock = v13;

    v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
    currentBatches = v3->_currentBatches;
    v3->_currentBatches = v15;

    v17 = objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _readChannels](v3, "_readChannels"));
    channels = v3->_channels;
    v3->_channels = (NSSet *)v17;

    v19 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    serverDeliveryLock = v3->_serverDeliveryLock;
    v3->_serverDeliveryLock = v19;

    v21 = objc_alloc_init(APECMetricSampler);
    sampler = v3->_sampler;
    v3->_sampler = v21;

    v3->_eventCollectionDisabled = objc_msgSend(v6, "isChild");
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  APMetricStorageEC *v7;

  v3 = APLogForCategory(29);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138477827;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Metric storage (%{private}@) was dealloced!", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)APMetricStorageEC;
  -[APMetricStorageEC dealloc](&v5, "dealloc");
}

- (void)setup
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[APMetricStorageEC _cleanupLeftovers](self, "_cleanupLeftovers");
  v3 = objc_msgSend((id)objc_opt_class(self), "openStoragePathPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(self), "closedStoragePathPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[APMetricStorage_private moveExistingOpenFilesToClosed:closedPrefix:](APMetricStorage_private, "moveExistingOpenFilesToClosed:closedPrefix:", v4, v6);

  v7 = -[APMetricStorageEC journeySettings](self, "journeySettings");
}

- (APJourneySettings)journeySettings
{
  APJourneySettings *journeySettings;
  APJourneySettings *v4;
  APJourneySettings *v5;

  journeySettings = self->_journeySettings;
  if (!journeySettings)
  {
    v4 = (APJourneySettings *)objc_claimAutoreleasedReturnValue(+[APJourneySettings settings](APJourneySettings, "settings"));
    v5 = self->_journeySettings;
    self->_journeySettings = v4;

    journeySettings = self->_journeySettings;
  }
  return journeySettings;
}

- (id)_readChannels
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;

  v3 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v4 = objc_msgSend((id)objc_opt_class(self), "destinationsStoragePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v33 = 0;
  v6 = objc_msgSend(v3, "fileExistsAtPath:error:", v5, &v33);
  v7 = v33;
  v8 = v7;
  if (v6)
  {
    v32 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectStoredAtPath:error:", v5, &v32));
    v10 = v32;

    if (v10)
    {
      v11 = APLogForCategory(29);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        v35 = v5;
        v36 = 2114;
        v37 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error reading destinations from path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
    v14 = objc_opt_class(NSURL);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) != 0)
    {
      v31 = v10;
      objc_msgSend(v3, "removeObjectAtPath:error:", v5, &v31);
      v8 = v31;

      if (v8)
      {
        v16 = APLogForCategory(29);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138740227;
          v35 = v5;
          v36 = 2114;
          v37 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error removing old destinations from path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
        }

      }
      v18 = 0;
      goto LABEL_22;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
    v20 = objc_opt_self(NSString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_opt_isKindOfClass(v19, v21);

    if ((v22 & 1) != 0)
    {
      v23 = APLogForCategory(29);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Upgrading channels", buf, 2u);
      }

      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compactMapObjectsUsingBlock:", &stru_100215808));
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
      v27 = objc_opt_self(APEventChannel);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = objc_opt_isKindOfClass(v26, v28);

      if ((v29 & 1) == 0)
      {
        v18 = 0;
        goto LABEL_21;
      }
      v25 = v9;
    }
    v18 = v25;
LABEL_21:
    v8 = v10;
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (void)_writeChannels
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC channels](self, "channels"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
    v5 = objc_msgSend((id)objc_opt_class(self), "destinationsStoragePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v13 = 0;
    v7 = objc_msgSend(v4, "storeObject:atPath:error:", v3, v6, &v13);
    v8 = v13;
    v9 = v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 0;
    if (!v10)
    {
      v11 = APLogForCategory(29);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        v15 = v6;
        v16 = 2114;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error writing destinations to path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
      }

    }
  }

}

- (id)_shelvedPathForChannel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("s"), "stringByAppendingPathComponent:", v5));

  v7 = objc_msgSend(v3, "purpose");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v9));

  return v10;
}

- (id)closeShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC _closeBatchesForChannels:shelved:groupBatches:](self, "_closeBatchesForChannels:shelved:groupBatches:", v7, 1, v4, v10));
  return v8;
}

- (void)startEventsRotation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDeliveryLock](self, "serverDeliveryLock"));
  objc_msgSend(v3, "lock");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDelivery](self, "serverDelivery"));
  objc_msgSend(v4, "pause");

}

- (void)finishEventsRotationWithSigningAuthority:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APEventChannel unused](APEventChannel, "unused"));
  -[APMetricStorageEC _closeBatchForChannel:](self, "_closeBatchForChannel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APEventChannel unused](APEventChannel, "unused"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protectedEventChannel"));
  +[APMetricStorage_private shelveClosedForChannel:](APMetricStorage_private, "shelveClosedForChannel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDelivery](self, "serverDelivery"));
  objc_msgSend(v8, "resume");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDeliveryLock](self, "serverDeliveryLock"));
  objc_msgSend(v9, "unlock");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[APEventChannel unused](APEventChannel, "unused"));
  -[APMetricStorageEC _withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:](self, "_withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:", v10, 1, v4);

}

- (void)_withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 signingAuthority:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricStorageEC serverDelivery](self, "serverDelivery"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001249E4;
  v15[3] = &unk_100215858;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "withdrawShelvedBatchesForChannel:groupBatches:withSaveObjectBlock:", v13, v6, v15);

}

- (void)_cleanupLeftovers
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APEventChannel unused](APEventChannel, "unused"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "protectedEventChannel"));
  +[APMetricStorage_private shelveClosedForChannel:](APMetricStorage_private, "shelveClosedForChannel:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[APEventChannel unused](APEventChannel, "unused"));
  -[APMetricStorageEC _withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:](self, "_withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:", v5, 0, 0);

}

- (id)preparedMetricDataForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a5;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectedDestination"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricStorage_private preparedDataPathForDestination:purpose:containsSignature:](APMetricStorage_private, "preparedDataPathForDestination:purpose:containsSignature:", v9, a4, v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v10, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v11, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17), (_QWORD)v21));
        objc_msgSend(v12, "addObject:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v19 = objc_msgSend(v12, "copy");
  return v19;
}

- (void)setServerDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_serverDelivery, a3);
}

- (void)setNotificationRegistrar:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRegistrar, a3);
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (NSLock)storageLock
{
  return self->_storageLock;
}

- (void)setCurrentBatches:(id)a3
{
  objc_storeStrong((id *)&self->_currentBatches, a3);
}

- (void)setChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (APUnfairLock)serverDeliveryLock
{
  return self->_serverDeliveryLock;
}

- (void)setSampler:(id)a3
{
  objc_storeStrong((id *)&self->_sampler, a3);
}

- (BOOL)eventCollectionDisabled
{
  return self->_eventCollectionDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_serverDeliveryLock, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_journeySettings, 0);
  objc_storeStrong((id *)&self->_currentBatches, 0);
  objc_storeStrong((id *)&self->_storageLock, 0);
  objc_storeStrong((id *)&self->_serverDelivery, 0);
  objc_storeStrong((id *)&self->_notificationRegistrar, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
}

@end
