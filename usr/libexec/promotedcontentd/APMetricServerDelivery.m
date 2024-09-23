@implementation APMetricServerDelivery

- (void)startDeliveryTimer
{
  void *v3;
  APMetricServerDelivery *v4;
  NSObject *v5;
  _QWORD *v6;
  double v7;
  double v8;
  uint64_t v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryTimer](self, "serverDeliveryTimer"));

  if (!v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryTimer](v4, "serverDeliveryTimer"));
    if (!v5)
    {
      v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v4->_serverDeliveryQueue);
      -[APMetricServerDelivery setServerDeliveryTimer:](v4, "setServerDeliveryTimer:", v5);
      if (v5)
      {
        objc_initWeak(location, v4);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100002864;
        v16[3] = &unk_100213F18;
        objc_copyWeak(&v17, location);
        v6 = objc_retainBlock(v16);
        -[APMetricServerDelivery _periodicDelay](v4, "_periodicDelay");
        v8 = v7 * 1000000000.0;
        v9 = (unint64_t)v8;
        v10 = dispatch_time(0, (uint64_t)v8);
        dispatch_source_set_timer(v5, v10, v9, 0x37E11D600uLL);
        dispatch_source_set_event_handler(v5, v6);
        dispatch_resume(v5);
        v11 = APLogForCategory(29);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start Metric Server Delivery Timer", v15, 2u);
        }

        objc_destroyWeak(&v17);
        objc_destroyWeak(location);
      }
      else
      {
        v13 = APLogForCategory(29);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not create a dispatch timer!", (uint8_t *)location, 2u);
        }

        APSimulateCrash(5, CFSTR("Could not create a dispatch timer!"), 1);
        v5 = 0;
      }
    }

    objc_sync_exit(v4);
  }
}

- (OS_dispatch_source)serverDeliveryTimer
{
  return self->_serverDeliveryTimer;
}

- (BOOL)processMetrics:(int64_t)a3 forChannel:(id)a4
{
  id v6;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  APMetricPayload *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  uint8_t v56[16];
  _QWORD v57[4];
  id v58;
  APMetricServerDelivery *v59;
  _BYTE *v60;
  unsigned __int8 v61;
  id v62;
  id v63;
  _BYTE buf[24];
  char v65;

  v6 = a4;
  v7 = -[APMetricServerDelivery isRunningTests](self, "isRunningTests");
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v7 & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryQueue](self, "serverDeliveryQueue"));
    dispatch_assert_queue_V2(v8);

  }
  v9 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.process-metrics");
  if ((v7 & 1) != 0)
    goto LABEL_5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[APSigningAuthorityPoolManager sharedInstance](APSigningAuthorityPoolManager, "sharedInstance"));
  v20 = (unint64_t)objc_msgSend(v19, "state");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 0x4651)
  {
    if ((byte_100269B28 & 1) == 0)
    {
      v21 = APLogForCategory(29);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class(self);
        v24 = NSStringFromClass(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{private}@] Signing is now ready so we can process metrics. State: %ld", buf, 0x16u);

      }
      byte_100269B28 = 1;
    }
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery lastProcessingDateForDestination:](self, "lastProcessingDateForDestination:", v11));

    objc_msgSend(v10, "timeIntervalSinceDate:", v12);
    v14 = v13;
    -[APMetricServerDelivery _periodicDelay](self, "_periodicDelay");
    if (a3 == 1 && v14 < v15 * 0.5
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination")),
          v17 = -[APMetricServerDelivery _shouldBackoffForDestination:](self, "_shouldBackoffForDestination:", v16),
          v16,
          (v17 & 1) != 0))
    {
      v18 = 0;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery processingDestinationsLock](self, "processingDestinationsLock"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery processingDestinations](self, "processingDestinations"));
      objc_msgSend(v30, "lock");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
      v32 = objc_msgSend(v55, "containsObject:", v31);

      if (v32)
      {
        objc_msgSend(v30, "unlock");
        v18 = 0;
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
        objc_msgSend(v55, "addObject:", v33);

        objc_msgSend(v30, "unlock");
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
        v34 = objc_autoreleasePoolPush();
        v62 = 0;
        v63 = 0;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:](self, "_loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:", v6, 0, 1, &v63, &v62));
        v52 = v63;
        v53 = v62;
        objc_autoreleasePoolPop(v34);
        if (v54)
          v35 = v53 == 0;
        else
          v35 = 1;
        v18 = v35;
        if (!v35)
        {
          v36 = APLogForCategory(29);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "jsonRepresentationWithOptions:", 1));
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)&buf[4] = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Batch payload %{private}@", buf, 0xCu);

          }
          v39 = APLogForCategory(29);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v41 = objc_msgSend(v54, "length");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Batch payload size %lu", buf, 0xCu);
          }

          v42 = objc_alloc_init(APMetricPayload);
          -[APMetricPayload setBatchesData:](v42, "setBatchesData:", v54);
          -[APMetricPayload setBilling:](v42, "setBilling:", v53);
          -[APMetricPayload setChannel:](v42, "setChannel:", v6);
          -[APMetricPayload setBatchInfos:](v42, "setBatchInfos:", v52);
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery fakeNetworkResponse](self, "fakeNetworkResponse"));
          -[APMetricPayload setFakeNetworkResponse:](v42, "setFakeNetworkResponse:", v43);

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v65 = 0;
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10002DAA4;
          v57[3] = &unk_100215E88;
          v61 = v7;
          v58 = v52;
          v59 = self;
          v60 = buf;
          -[APMetricServerDelivery _sendPayload:successCompletionHandler:](self, "_sendPayload:successCompletionHandler:", v42, v57);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
          -[APMetricServerDelivery setLastProcessingDate:forDestination:](self, "setLastProcessingDate:forDestination:", v10, v44);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protectedEventChannel"));
            v46 = objc_msgSend(v51, "hasBacklogForChannel:", v45);

            if (v46)
            {
              v47 = APLogForCategory(29);
              v48 = objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v56 = 0;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Starting metrics processing due to a long backlog.", v56, 2u);
              }

              -[APMetricServerDelivery _asyncProcessMetrics:forChannel:](self, "_asyncProcessMetrics:forChannel:", 4, v6);
            }
          }

          _Block_object_dispose(buf, 8);
        }
        objc_msgSend(v30, "lock");
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
        objc_msgSend(v55, "removeObject:", v49);

        objc_msgSend(v30, "unlock");
        v9 = 0;
      }

    }
LABEL_43:

    goto LABEL_44;
  }
  v26 = APLogForCategory(29);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Signing isn't ready yet so we can't send metrics.", buf, 2u);
  }

  if (byte_100269B28 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Signing authority pool manager status changed from 'success' to %ld"), v20));
    v28 = APLogForCategory(29);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    CreateDiagnosticReport(v10, 0, CFSTR("EC Signing"));
    v18 = 0;
    byte_100269B28 = 0;
    goto LABEL_43;
  }
  v18 = 0;
LABEL_44:

  return v18;
}

- (void)setLastProcessingDate:(id)a3 forDestination:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery lastProcessingDates](self, "lastProcessingDates"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (OS_dispatch_queue)serverDeliveryQueue
{
  return self->_serverDeliveryQueue;
}

- (NSMutableSet)processingDestinations
{
  return self->_processingDestinations;
}

- (NSLock)processingDestinationsLock
{
  return self->_processingDestinationsLock;
}

- (void)processServerDeliveryTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  void *i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  _BYTE v51[128];

  v3 = APLogForCategory(29);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "server delivery timer fired", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeChannels"));
  objc_msgSend(v5, "closeActiveBatches");
  v37 = v5;
  v7 = objc_msgSend((id)objc_opt_class(v5), "closedStoragePathPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[APMetricStorage_private removeExpiredBatchesFromClosedPrefix:](APMetricStorage_private, "removeExpiredBatchesFromClosedPrefix:", v8);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    v13 = 1;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        if (-[APMetricServerDelivery isRunningTests](self, "isRunningTests"))
        {
          v16 = APLogForCategory(29);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138739971;
            v44 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Timer fired, processing batch for channel: %{sensitive}@", buf, 0xCu);
          }

        }
        v18 = objc_autoreleasePoolPush();
        v19 = -[APMetricServerDelivery processMetrics:forChannel:](self, "processMetrics:forChannel:", 1, v15);
        objc_autoreleasePoolPop(v18);
        if ((v19 & 1) == 0)
        {
          v20 = APLogForCategory(29);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Unprocessed metrics cannot suspend timer", buf, 2u);
          }

          v13 = 0;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 1;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricOffsetSettings settings](APMetricOffsetSettings, "settings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastActivity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v25 = objc_alloc((Class)NSUserDefaults);
    v26 = objc_msgSend(v25, "initWithSuiteName:", APDefaultsBundleID);
    v27 = objc_msgSend(v26, "integerForKey:", CFSTR("SuspendTimer"));
    if ((uint64_t)v27 <= 0)
      v28 = 600;
    else
      v28 = (uint64_t)v27;

  }
  else
  {
    v28 = 600;
  }
  v29 = APLogForCategory(29);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v38 = v22;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13 & 1));
    objc_msgSend(v24, "timeIntervalSinceDate:", v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v28));
    objc_msgSend(v24, "timeIntervalSinceDate:", v23);
    *(_DWORD *)buf = 138413058;
    v34 = CFSTR("NO");
    v44 = v31;
    if (v35 > (double)v28)
      v34 = CFSTR("YES");
    v45 = 2112;
    v46 = v32;
    v47 = 2112;
    v48 = v33;
    v49 = 2112;
    v50 = v34;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Can suspend (%@), timer (%@), suspend time (%@)), ok to suspend (%@)", buf, 0x2Au);

    v22 = v38;
  }

  if ((v13 & 1) != 0)
  {
    if (!v23 || (objc_msgSend(v24, "timeIntervalSinceDate:", v23), v36 > (double)v28))
      -[APMetricServerDelivery _stopDeliveryTimer](self, "_stopDeliveryTimer");
  }

}

- (APMetricPreparedDataServerDelivery)preparedDataServerDelivery
{
  return self->_preparedDataServerDelivery;
}

- (NSMutableDictionary)lastProcessingDates
{
  return self->_lastProcessingDates;
}

- (id)lastProcessingDateForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery lastProcessingDates](self, "lastProcessingDates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));

  return v6;
}

- (BOOL)isRunningTests
{
  return self->_isRunningTests;
}

- (APMetricHTTPDelivering)httpDelivery
{
  return self->_httpDelivery;
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (NSMutableDictionary)backoffTimers
{
  return self->_backoffTimers;
}

- (id)backoffTimerForDestination:(id)a3
{
  id v4;
  void *v5;
  APECBackoffTimer *v6;
  APECBackoffTimer *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery backoffTimers](self, "backoffTimers"));
  v6 = (APECBackoffTimer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  if (!v6)
  {
    v7 = [APECBackoffTimer alloc];
    v8 = objc_alloc_init((Class)APSystemClock);
    v6 = -[APECBackoffTimer initWithClock:](v7, "initWithClock:", v8);

    objc_msgSend(v5, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (BOOL)_shouldBackoffForDestination:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery backoffTimerForDestination:](self, "backoffTimerForDestination:", v4));
  v6 = objc_msgSend(v5, "isWaitingForBackoff");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apLocalSharedFormatter](NSISO8601DateFormatter, "apLocalSharedFormatter"));
    v8 = APLogForCategory(29);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheduledDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v10));
      v13 = 138740227;
      v14 = v4;
      v15 = 2114;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Metrics is in backoff for %{sensitive}@. Scheduled time: %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }

  return v6;
}

- (void)_sendPayload:(id)a3 successCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char *v19;
  char *v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  void *v30;

  v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery httpDelivery](self, "httpDelivery"));
  v26 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sendPayload:error:", v6, &v26));
  v10 = v26;
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  v12 = (char *)objc_msgSend(v10, "code");
  v13 = APLogForCategory(29);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v28 = v12;
    v29 = 2114;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error (%ld) attempting to send batch: %{public}@", buf, 0x16u);
  }

  if (v12 == (char *)8898)
  {
    v15 = APLogForCategory(29);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sendData failed due to error code APMetricHTTPDeliveringErrorCodeMescalSigningFailed. Not sending batches.", buf, 2u);
    }
  }
  else
  {
LABEL_7:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "channel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "destination"));
    v16 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery backoffTimerForDestination:](self, "backoffTimerForDestination:", v18));

    v19 = (char *)objc_msgSend(v9, "statusCode");
    v20 = v19;
    if ((unint64_t)(v19 - 200) > 0x63)
    {
      if (v11)
        v21 = v19 == 0;
      else
        v21 = 0;
      v22 = v21;
      if ((unint64_t)(v19 - 400) < 0xC8 || v22)
      {
        if (v19 == (char *)503)
          -[APMetricServerDelivery startTimer:withResponse:](self, "startTimer:withResponse:", v16, v9);
        else
          -[NSObject startNextTimer](v16, "startNextTimer");
      }
      else
      {
        v23 = APLogForCategory(29);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v28 = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Received unknown status code from response (%ld)!", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v19 == (char *)202)
        -[APMetricServerDelivery startTimer:withResponse:](self, "startTimer:withResponse:", v16, v9);
      else
        -[NSObject resetTimer](v16, "resetTimer");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery preparedDataServerDelivery](self, "preparedDataServerDelivery"));
      sub_100033170(v25);

      if (v7)
        v7[2](v7, v20 != (char *)202);
    }
  }

}

- (id)_purposeConfig:(int64_t)a3
{
  void *v3;
  _QWORD *v4;
  id v5;

  v3 = 0;
  if (a3 > 102)
  {
    if (a3 == 103)
    {
      v4 = APECReportsPurposeConfig_ptr;
      goto LABEL_10;
    }
    if (a3 == 8501)
    {
      v4 = APECObservabilityPurposeConfig_ptr;
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 == 100)
    {
      v4 = APECJourneyPurposeConfig_ptr;
      goto LABEL_10;
    }
    if (a3 == 101)
    {
      v4 = APECDiagnosticPurposeConfig_ptr;
LABEL_10:
      v5 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(*v4));
      v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }
  }
  return v3;
}

- (double)_periodicDelay
{
  if (qword_100269B20 != -1)
    dispatch_once(&qword_100269B20, &stru_100215D80);
  return *(double *)&qword_100269B18;
}

- (id)_loadBatchesAsDataForChannel:(id)a3 useShelvedData:(BOOL)a4 groupBatches:(BOOL)a5 batchInfos:(id *)a6 billing:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  _QWORD *v24;
  void *v25;
  __CFString *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = objc_autoreleasePoolPush();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10002D3C0;
  v35 = sub_10002D370;
  v37 = v11;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _purposeConfig:](self, "_purposeConfig:", objc_msgSend(v11, "purpose")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allowedPurposes"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100002BD0;
    v28[3] = &unk_100215E60;
    v29 = v11;
    v30 = &v31;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v28);

  }
  v17 = v32[5];
  v26 = CFSTR("com.apple.ap.promotedcontentd");
  v27 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:](self, "_dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:", v25, v9, v17, v8, &v27, &v26, a7));
  v19 = v27;
  v20 = v26;
  _Block_object_dispose(&v31, 8);

  objc_autoreleasePoolPop(v14);
  if (v18)
  {
    objc_msgSend(v12, "addObjectsFromArray:", v18);
    objc_msgSend(v13, "addObjectsFromArray:", v19);
  }
  if (a6)
    *a6 = objc_retainAutorelease(v13);
  if (v24)
    *v24 = objc_retainAutorelease(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _dataFromBatchDictionaries:](self, "_dataFromBatchDictionaries:", v12));

  return v21;
}

- (id)_dictionariesFromBatchesInStorage:(id)a3 useShelvedData:(BOOL)a4 channels:(id)a5 groupBatches:(BOOL)a6 batchInfos:(id *)a7 billing:(id *)a8
{
  _BOOL8 v10;
  _BOOL4 v12;
  id v13;
  id v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *i;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  APMetricBatchInfo *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id *v40;
  id v41;
  id v43;
  unsigned int v44;
  id v45;
  id obj;
  uint64_t v47;
  id v48;
  _QWORD v49[4];
  id v50;
  __int128 *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[128];

  v10 = a6;
  v12 = a4;
  v43 = a3;
  v13 = a5;
  v14 = 0;
  v40 = a7;
  if (a7 && a8)
  {
    v41 = v13;
    v15 = -[APMetricServerDelivery isRunningTests](self, "isRunningTests");
    if (v12)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "protectedEventChannel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "closeShelvedBatchesForChannel:groupBatches:", v17, v10));

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mapObjectsUsingBlock:", &stru_100215E10));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "closeBatchesForChannels:", v16));
    }

    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v18, "count"));
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v18, "count"));
    v21 = objc_alloc_init((Class)NSCountedSet);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v18;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v53;
      v45 = v21;
      v44 = v15;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v47)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&v62 = 0;
          *((_QWORD *)&v62 + 1) = &v62;
          v63 = 0x2020000000;
          v64 = 0;
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_10002DD58;
          v49[3] = &unk_100215E38;
          v51 = &v62;
          v50 = v21;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serverDictionaryRepresentationWithBlock:", v49));
          if (v24)
          {
            v25 = APLogForCategory(29);
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v27 = v20;
              v28 = v19;
              v29 = a8;
              v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
              v31 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 24);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "jsonDataWithOptions:", 0x400000));
              v33 = objc_msgSend(v32, "length");
              *(_DWORD *)buf = 138543874;
              v57 = v30;
              v58 = 2048;
              v59 = v31;
              v60 = 2048;
              v61 = v33;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Send batch %{public}@ with %lu metrics, batchSize %lu", buf, 0x20u);

              a8 = v29;
              v19 = v28;
              v20 = v27;
              v21 = v45;
              v15 = v44;

            }
            objc_msgSend(v20, "addObject:", v24);
            v34 = objc_alloc_init(APMetricBatchInfo);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
            -[APMetricBatchInfo setIdentifier:](v34, "setIdentifier:", v35);

            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fileSystemToken"));
            -[APMetricBatchInfo setFileSystemToken:](v34, "setFileSystemToken:", v36);

            -[APMetricBatchInfo setPurpose:](v34, "setPurpose:", objc_msgSend(v23, "purpose"));
            if (v15)
              -[APMetricBatchInfo setMetricsCount:](v34, "setMetricsCount:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 24));
            objc_msgSend(v19, "addObject:", v34, v40);

          }
          else
          {
            objc_msgSend(v23, "delete");
          }

          _Block_object_dispose(&v62, 8);
        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v48);
    }

    *v40 = objc_msgSend(v19, "copy");
    if (objc_msgSend(v20, "count"))
    {
      *a8 = (id)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _determineBillable:](self, "_determineBillable:", v21));
      v14 = v20;
    }
    else
    {
      v37 = APLogForCategory(29);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        LODWORD(v62) = 138412290;
        *(_QWORD *)((char *)&v62 + 4) = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "No batches to send for channels: %@", (uint8_t *)&v62, 0xCu);
      }

      v14 = 0;
    }

    v13 = v41;
  }

  return v14;
}

- (id)_determineBillable:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {
    v6 = 0;
LABEL_14:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));

    v6 = (void *)v15;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      v11 = objc_msgSend(v3, "countForObject:", v10);
      if ((unint64_t)v11 > v7)
      {
        v12 = (unint64_t)v11;
        v13 = v10;

        v6 = v13;
        v7 = v12;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v5);
  if (!v6 || !objc_msgSend(v6, "length"))
    goto LABEL_14;
LABEL_15:

  return v6;
}

- (id)_dataFromBatchDictionaries:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v29;
  uint8_t buf[4];
  id v31;
  _QWORD v32[6];
  _QWORD v33[6];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter iso8601TruncatedToMinutes](NSDateFormatter, "iso8601TruncatedToMinutes"));
    v29 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo osIdentifier](APSystemInfo, "osIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buildVersion"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceModel"));

    v32[0] = CFSTR("local_utc");
    v32[1] = CFSTR("batches");
    v33[0] = v6;
    v33[1] = v3;
    v32[2] = CFSTR("version");
    v32[3] = CFSTR("os");
    v33[2] = &off_10022A068;
    v33[3] = v7;
    v32[4] = CFSTR("build");
    v32[5] = CFSTR("model");
    v33[4] = v9;
    v33[5] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 6));
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v13 = objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v13, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("internal"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v13));

      v15 = objc_alloc((Class)NSUserDefaults);
      v16 = objc_msgSend(v15, "initWithSuiteName:", APDefaultsBundleID);
      v17 = objc_msgSend(v16, "BOOLForKey:", kAPAutomationLoggingEnabled);

      if (v17)
      {
        v18 = APLogForCategory(29);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "jsonString"));
          *(_DWORD *)buf = 138477827;
          v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Batch payload %{private}@", buf, 0xCu);

        }
      }

    }
    else
    {
      v14 = v12;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "jsonDataWithOptions:", 0x400000));
    v22 = APLogForCategory(29);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_msgSend(v21, "length");
      *(_DWORD *)buf = 134217984;
      v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Batch payload size %lu", buf, 0xCu);
    }

    if (v21)
    {
      v25 = v21;
    }
    else
    {
      v26 = APLogForCategory(29);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NSJSONSerialization resulted in empty data!", buf, 2u);
      }

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (APMetricServerDelivery)init
{
  APMetricServerDelivery *v2;
  APMetricHTTPDelivering *v3;
  APMetricHTTPDelivering *httpDelivery;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serverDeliveryQueue;
  NSMutableSet *v9;
  NSMutableSet *processingDestinations;
  NSLock *v11;
  NSLock *processingDestinationsLock;
  NSMutableDictionary *v13;
  NSMutableDictionary *lastProcessingDates;
  NSMutableDictionary *v15;
  NSMutableDictionary *backoffTimers;
  id batchDeliveredClosure;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)APMetricServerDelivery;
  v2 = -[APMetricServerDelivery init](&v28, "init");
  if (v2)
  {
    v3 = (APMetricHTTPDelivering *)objc_alloc_init(+[MetricsModuleClasses httpDeliveryClass](MetricsModuleClasses, "httpDeliveryClass"));
    httpDelivery = v2->_httpDelivery;
    v2->_httpDelivery = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.ap.pc.metrics.queue", v6);
    serverDeliveryQueue = v2->_serverDeliveryQueue;
    v2->_serverDeliveryQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
    processingDestinations = v2->_processingDestinations;
    v2->_processingDestinations = v9;

    v11 = (NSLock *)objc_alloc_init((Class)NSLock);
    processingDestinationsLock = v2->_processingDestinationsLock;
    v2->_processingDestinationsLock = v11;

    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    lastProcessingDates = v2->_lastProcessingDates;
    v2->_lastProcessingDates = v13;

    v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    backoffTimers = v2->_backoffTimers;
    v2->_backoffTimers = v15;

    batchDeliveredClosure = v2->_batchDeliveredClosure;
    v2->_batchDeliveredClosure = 0;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v2->_isRunningTests = objc_msgSend(v18, "isRunningTests");

    -[APMetricServerDelivery startDeliveryTimer](v2, "startDeliveryTimer");
    objc_initWeak(&location, v2);
    v19 = dispatch_time(0, 5000000000);
    v20 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryQueue](v2, "serverDeliveryQueue"));
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_10012E4E0;
    v25 = &unk_100213F18;
    objc_copyWeak(&v26, &location);
    dispatch_after(v19, v20, &v22);

    -[APMetricServerDelivery _startTestCommandsListener](v2, "_startTestCommandsListener", v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_startTestCommandsListener
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APTestingRig sharedInstance](APTestingRig, "sharedInstance"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10012E5EC;
    v4[3] = &unk_100215DD0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "subscribeForDictMessage:handler:", CFSTR("metrics-start-upload"), v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[APMetricServerDelivery _stopDeliveryTimer](self, "_stopDeliveryTimer");
  v3.receiver = self;
  v3.super_class = (Class)APMetricServerDelivery;
  -[APMetricServerDelivery dealloc](&v3, "dealloc");
}

- (void)_stopDeliveryTimer
{
  APMetricServerDelivery *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryTimer](v2, "serverDeliveryTimer"));
  v4 = v3;
  if (v3)
  {
    dispatch_source_cancel(v3);
    -[APMetricServerDelivery setServerDeliveryTimer:](v2, "setServerDeliveryTimer:", 0);
    v5 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stop Metric Server Delivery Timer", v7, 2u);
    }

  }
  objc_sync_exit(v2);

}

- (void)startTimer:(id)a3 withResponse:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = -[APMetricServerDelivery backoffFromResponse:](self, "backoffFromResponse:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "startNextTimer");
  else
    objc_msgSend(v7, "startMinimumTimer:", (double)v6);

}

- (int64_t)backoffFromResponse:(id)a3
{
  void *v3;
  id v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForHTTPHeaderField:", CFSTR("Retry-After")));
  v4 = objc_msgSend(v3, "integerValue");
  if (v4)
    v5 = (int64_t)v4;
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)_asyncProcessMetrics:(int64_t)a3 forChannel:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryQueue](self, "serverDeliveryQueue"));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012EA4C;
  v9[3] = &unk_100215EB0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)metricsReadyForDeliveryToChannel:(id)a3
{
  -[APMetricServerDelivery _asyncProcessMetrics:forChannel:](self, "_asyncProcessMetrics:forChannel:", 2, a3);
}

- (void)flushMetricsToServerForChannel:(id)a3
{
  -[APMetricServerDelivery _asyncProcessMetrics:forChannel:](self, "_asyncProcessMetrics:forChannel:", 3, a3);
}

- (void)withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 withSaveObjectBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  int v42;
  uint64_t (**v43)(id, void *);
  APMetricServerDelivery *v44;
  void *v45;
  id v46;
  void *context;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;

  v6 = a4;
  v8 = a3;
  v43 = (uint64_t (**)(id, void *))a5;
  v9 = 0;
  v10 = 50;
  if (!v6)
    v10 = 500;
  v36 = v8;
  v44 = self;
  while (v10 >= 1)
  {
    v11 = v10;
    v48 = v10 - 1;
    context = objc_autoreleasePoolPush();
    v12 = objc_autoreleasePoolPush();
    v55 = 0;
    v56 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery _loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:](self, "_loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:", v8, 1, v6, &v56, &v55));
    v49 = v56;
    v14 = v55;
    objc_autoreleasePoolPop(v12);
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery httpDelivery](self, "httpDelivery"));
      v54 = 0;
      v45 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "buildMetricDeliveryRequestFromData:toChannel:billing:signingAuthority:failIfSignatureIsNotAvailable:error:", v13, v8, v14, 0, 0, &v54));
      v46 = v54;
      if (v46)
      {
        v17 = v8;
        v18 = v9;
        v19 = v16;
        v20 = v13;
        v21 = APLogForCategory(29);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v46;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to build metric delivery request: %{public}@", buf, 0xCu);
        }

        v13 = v20;
        v16 = v19;
        v9 = v18;
        v8 = v17;
        self = v44;
      }
      v23 = v43[2](v43, v16);
      if (v23)
      {
        v37 = v23;
        v38 = v16;
        v39 = v14;
        v40 = v13;
        v41 = v11;
        v42 = v9;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v24 = v49;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(_QWORD *)v51 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
              v30 = APLogForCategory(29);
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
                *(_DWORD *)buf = 138543362;
                v59 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Deleting batch %{public}@", buf, 0xCu);

              }
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fileSystemToken"));
              +[APMetricBatch removeBatchByFileSystemToken:](APMetricBatch, "removeBatchByFileSystemToken:", v33);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
          }
          while (v26);
        }

        v8 = v36;
        self = v44;
        v9 = v42;
        v13 = v40;
        v11 = v41;
        v16 = v38;
        v14 = v39;
        v23 = v37;
      }
      v9 |= v23;

    }
    objc_autoreleasePoolPop(context);
    v10 = v48;
    if (!v13)
    {
      if (v11 > 1)
        goto LABEL_25;
      break;
    }
  }
  APSimulateCrashNoKillProcess(5, CFSTR("Failed to process saved metrics: exceeded %ld requests."));
LABEL_25:
  if ((v9 & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery preparedDataServerDelivery](self, "preparedDataServerDelivery"));
    sub_100128628(v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery preparedUnsignedDataProcessor](self, "preparedUnsignedDataProcessor"));
    sub_100125208(v35);

  }
}

- (void)pause
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryTimer](self, "serverDeliveryTimer"));
  -[APMetricServerDelivery setServerDeliveryTimerWasRunningWhenPaused:](self, "setServerDeliveryTimerWasRunningWhenPaused:", v3 != 0);

  if (-[APMetricServerDelivery serverDeliveryTimerWasRunningWhenPaused](self, "serverDeliveryTimerWasRunningWhenPaused"))
  {
    -[APMetricServerDelivery _stopDeliveryTimer](self, "_stopDeliveryTimer");
  }
  v4 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryQueue](self, "serverDeliveryQueue"));
  dispatch_suspend(v4);

  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Suspended server delivery.", v7, 2u);
  }

}

- (void)resume
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery serverDeliveryQueue](self, "serverDeliveryQueue"));
  dispatch_resume(v3);

  if (-[APMetricServerDelivery serverDeliveryTimerWasRunningWhenPaused](self, "serverDeliveryTimerWasRunningWhenPaused"))
  {
    -[APMetricServerDelivery startDeliveryTimer](self, "startDeliveryTimer");
  }
  v4 = APLogForCategory(29);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Resumed server delivery.", v6, 2u);
  }

}

- (void)_configurePreparedDataObjects
{
  void *v3;
  APMetricPreparedDataServerDelivery *v4;
  void *v5;
  id *v6;
  APMetricPreparedUnsignedDataProcessor *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricStorage_private metricsFileManager](APMetricStorage_private, "metricsFileManager"));
  v4 = [APMetricPreparedDataServerDelivery alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v6 = sub_100128420((id *)&v4->super.isa, v5, self->_serverDeliveryQueue, self->_httpDelivery, v3);
  -[APMetricServerDelivery setPreparedDataServerDelivery:](self, "setPreparedDataServerDelivery:", v6);

  v7 = [APMetricPreparedUnsignedDataProcessor alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v9 = sub_100124FD8((id *)&v7->super.isa, v8, self->_serverDeliveryQueue, v3);
  -[APMetricServerDelivery setPreparedUnsignedDataProcessor:](self, "setPreparedUnsignedDataProcessor:", v9);

  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10012F18C;
  v15 = &unk_100213F18;
  objc_copyWeak(&v16, &location);
  sub_1001258FC(self->_preparedUnsignedDataProcessor, (char *)&v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery preparedUnsignedDataProcessor](self, "preparedUnsignedDataProcessor", v12, v13, v14, v15));
  sub_100125208(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricServerDelivery preparedDataServerDelivery](self, "preparedDataServerDelivery"));
  sub_100128628(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)setHttpDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_httpDelivery, a3);
}

- (void)setServerDeliveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverDeliveryQueue, a3);
}

- (void)setServerDeliveryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_serverDeliveryTimer, a3);
}

- (void)setLastProcessingDates:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessingDates, a3);
}

- (void)setBackoffTimers:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimers, a3);
}

- (id)batchDeliveredClosure
{
  return self->_batchDeliveredClosure;
}

- (void)setBatchDeliveredClosure:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setIsRunningTests:(BOOL)a3
{
  self->_isRunningTests = a3;
}

- (BOOL)serverDeliveryTimerWasRunningWhenPaused
{
  return self->_serverDeliveryTimerWasRunningWhenPaused;
}

- (void)setServerDeliveryTimerWasRunningWhenPaused:(BOOL)a3
{
  self->_serverDeliveryTimerWasRunningWhenPaused = a3;
}

- (void)setPreparedDataServerDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_preparedDataServerDelivery, a3);
}

- (APMetricPreparedUnsignedDataProcessor)preparedUnsignedDataProcessor
{
  return self->_preparedUnsignedDataProcessor;
}

- (void)setPreparedUnsignedDataProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_preparedUnsignedDataProcessor, a3);
}

- (void)setFakeNetworkResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_preparedUnsignedDataProcessor, 0);
  objc_storeStrong((id *)&self->_preparedDataServerDelivery, 0);
  objc_storeStrong(&self->_batchDeliveredClosure, 0);
  objc_storeStrong((id *)&self->_backoffTimers, 0);
  objc_storeStrong((id *)&self->_lastProcessingDates, 0);
  objc_storeStrong((id *)&self->_processingDestinationsLock, 0);
  objc_storeStrong((id *)&self->_processingDestinations, 0);
  objc_storeStrong((id *)&self->_serverDeliveryTimer, 0);
  objc_storeStrong((id *)&self->_serverDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_httpDelivery, 0);
}

@end
