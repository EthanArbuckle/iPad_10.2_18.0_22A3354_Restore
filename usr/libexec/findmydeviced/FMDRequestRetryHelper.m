@implementation FMDRequestRetryHelper

- (FMDRequestRetryHelper)initWithRequest:(id)a3 retryAction:(id)a4
{
  id v6;
  id v7;
  FMDRequestRetryHelper *v8;
  id v9;
  id retryAction;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FMDRequestRetryHelper;
  v8 = -[FMDRequestRetryHelper init](&v13, "init");
  if (v8)
  {
    v9 = objc_retainBlock(v7);
    retryAction = v8->_retryAction;
    v8->_retryAction = v9;

    objc_storeWeak((id *)&v8->_request, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, "_networkStateChanged:", FMLocalNetworkStatusChangedNotification, 0);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[FMDRequestRetryHelper deinitializeHelper](self, "deinitializeHelper");
  v3.receiver = self;
  v3.super_class = (Class)FMDRequestRetryHelper;
  -[FMDRequestRetryHelper dealloc](&v3, "dealloc");
}

- (void)deinitializeHelper
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, FMLocalNetworkStatusChangedNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper retryTimer](self, "retryTimer"));
  objc_msgSend(v4, "invalidate");

  -[FMDRequestRetryHelper setRetryTimer:](self, "setRetryTimer:", 0);
  -[FMDRequestRetryHelper setNextRetryTime:](self, "setNextRetryTime:", 0);
  -[FMDRequestRetryHelper setRetryAction:](self, "setRetryAction:", 0);
  -[FMDRequestRetryHelper setRequest:](self, "setRequest:", 0);
}

- (void)checkAndScheduleRetries
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  void *v24;
  id v25;
  const __CFString *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  signed int v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  signed int v49;
  uint64_t v50;
  double v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  double v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  _BYTE v68[24];
  double v69;

  -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper request](self, "request"));
  if (!v3)
    -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  if (v4)
  {

  }
  else if (objc_msgSend(v3, "completed"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v68 = 138412546;
      *(_QWORD *)&v68[4] = objc_opt_class(v3, v7);
      *(_WORD *)&v68[12] = 2048;
      *(_QWORD *)&v68[14] = v3;
      v8 = *(id *)&v68[4];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request is complete", v68, 0x16u);

    }
    -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType", *(_OWORD *)v68, *(_QWORD *)&v68[16]));
  if (v9)
  {

  }
  else if ((objc_msgSend(v3, "canRequestBeRetriedNow") & 1) == 0)
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class(v3, v12);
      *(_DWORD *)v68 = 138412546;
      *(_QWORD *)&v68[4] = v13;
      *(_WORD *)&v68[12] = 2048;
      *(_QWORD *)&v68[14] = v3;
      v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Request cannot be retried anymore. Not scheduling any more retries", v68, 0x16u);

    }
    -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));

  v16 = -1.0;
  if (!v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseHeaders"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("X-Apple-Retry-After")));

    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      if (v19 < 0.0)
      {
        v20 = sub_1000031B8();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v23 = -1.0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_opt_class(v3, v22);
          *(_DWORD *)v68 = 138412546;
          *(_QWORD *)&v68[4] = v24;
          *(_WORD *)&v68[12] = 2048;
          *(_QWORD *)&v68[14] = v3;
          v25 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Server requested that no more retries be done.", v68, 0x16u);

        }
        v26 = CFSTR("NoMoreRetries");
LABEL_25:

        -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", v26);
        v16 = v23;
        goto LABEL_26;
      }
      if (v19 > 0.0)
      {
        v23 = v19;
        v27 = sub_1000031B8();
        v21 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_opt_class(v3, v28);
          *(_DWORD *)v68 = 138412802;
          *(_QWORD *)&v68[4] = v29;
          *(_WORD *)&v68[12] = 2048;
          *(_QWORD *)&v68[14] = v3;
          *(_WORD *)&v68[22] = 2048;
          v69 = v23;
          v30 = v29;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Server requested a retry after %f seconds", v68, 0x20u);

        }
        v26 = CFSTR("ServerDelayedRetry");
        goto LABEL_25;
      }
    }
LABEL_26:

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  if (v31)
  {

  }
  else if (objc_msgSend(v3, "responseErrorType") == (id)257)
  {
    -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v32 = objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  if (v32)
  {
    v33 = (void *)v32;
LABEL_33:

    goto LABEL_36;
  }
  if (objc_msgSend(v3, "responseErrorType") == (id)514
    && !-[FMDRequestRetryHelper _retryCountForType:](self, "_retryCountForType:", CFSTR("TryOriginalHost")))
  {
    -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("TryOriginalHost"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authId"));
    +[FMDRealmSupport clearCachedHostsWithContext:](FMDRealmSupport, "clearCachedHostsWithContext:", v33);
    v16 = 0.0;
    goto LABEL_33;
  }
LABEL_36:
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  if (v34)
  {

  }
  else if (((unint64_t)objc_msgSend(v3, "responseErrorType") & 0x200) != 0)
  {
    v35 = -[FMDRequestRetryHelper _retryCountForType:](self, "_retryCountForType:", CFSTR("TimerBasedNetworkRetry"));
    if (objc_msgSend(v3, "maxTimerBasedNetworkRetries") == (id)-1
      || (uint64_t)objc_msgSend(v3, "maxTimerBasedNetworkRetries") > v35)
    {
      -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("TimerBasedNetworkRetry"));
      -[FMDRequestRetryHelper _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v35);
      v16 = v36;
    }
    else
    {
      v37 = -[FMDRequestRetryHelper _consecutiveRetryCountForType:](self, "_consecutiveRetryCountForType:", CFSTR("NotificationBasedNetworkRetry"));
      if (objc_msgSend(v3, "maxConsecutiveNetworkNotificationRetries") == (id)-1
        || (uint64_t)objc_msgSend(v3, "maxConsecutiveNetworkNotificationRetries") > v37)
      {
        -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NotificationBasedNetworkRetry"));
        v38 = sub_1000031B8();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_opt_class(v3, v40);
          *(_DWORD *)v68 = 138412546;
          *(_QWORD *)&v68[4] = v41;
          *(_WORD *)&v68[12] = 2048;
          *(_QWORD *)&v68[14] = v3;
          v42 = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Waiting for a network-up notification to retry again", v68, 0x16u);

        }
        v16 = -1.0;
      }
      else
      {
        -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
        v43 = sub_1000031B8();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (void *)objc_opt_class(v3, v45);
          *(_DWORD *)v68 = 138412546;
          *(_QWORD *)&v68[4] = v46;
          *(_WORD *)&v68[12] = 2048;
          *(_QWORD *)&v68[14] = v3;
          v47 = v46;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of consecutive network-up notification based retries", v68, 0x16u);

        }
      }
    }
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  if (v48)
  {

  }
  else if (objc_msgSend(v3, "responseErrorType") == (id)1025)
  {
    v49 = -[FMDRequestRetryHelper _retryCountForType:](self, "_retryCountForType:", CFSTR("RedirectRetry"));
    if (v49)
    {
      v50 = v49;
      if (objc_msgSend(v3, "maxNonNetworkRelatedRetries") == (id)-1
        || (uint64_t)objc_msgSend(v3, "maxNonNetworkRelatedRetries") > v50)
      {
        -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("RedirectRetry"));
        -[FMDRequestRetryHelper _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v50);
        v16 = v51;
      }
      else
      {
        -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
        v52 = sub_1000031B8();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_opt_class(v3, v54);
          *(_DWORD *)v68 = 138412546;
          *(_QWORD *)&v68[4] = v55;
          *(_WORD *)&v68[12] = 2048;
          *(_QWORD *)&v68[14] = v3;
          v56 = v55;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of redirect retries", v68, 0x16u);

        }
      }
    }
    else
    {
      -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("RedirectRetry"));
      v16 = 0.0;
    }
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));

  if (!v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "httpResponseStatus")));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringValue"));

    v60 = -[FMDRequestRetryHelper _retryCountForType:](self, "_retryCountForType:", v59);
    if (objc_msgSend(v3, "maxNonNetworkRelatedRetries") == (id)-1
      || (uint64_t)objc_msgSend(v3, "maxNonNetworkRelatedRetries") > v60)
    {
      -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", v59);
      -[FMDRequestRetryHelper _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v60);
      v16 = v61;
    }
    else
    {
      -[FMDRequestRetryHelper setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
      v62 = sub_1000031B8();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v65 = (void *)objc_opt_class(v3, v64);
        *(_DWORD *)v68 = 138412802;
        *(_QWORD *)&v68[4] = v65;
        *(_WORD *)&v68[12] = 2048;
        *(_QWORD *)&v68[14] = v3;
        *(_WORD *)&v68[22] = 2112;
        v69 = *(double *)&v59;
        v66 = v65;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Stopped retrying since we exceeded the maximum number of retries for status code %@", v68, 0x20u);

      }
    }

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
  objc_msgSend(v3, "setWillRetry:", objc_msgSend(v67, "isEqualToString:", CFSTR("NoMoreRetries")) ^ 1);

  -[FMDRequestRetryHelper _scheduleRetryAfterTimeInterval:](self, "_scheduleRetryAfterTimeInterval:", v16);
}

- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper request](self, "request"));
  objc_msgSend(v4, "firstRetryInterval");
  v6 = v5;
  objc_msgSend(v4, "retryIntervalDecayFactor");
  v8 = v6 * pow(v7, (double)a3);
  objc_msgSend(v4, "maxRetryInterval");
  if (v9 > -1.0)
  {
    objc_msgSend(v4, "maxRetryInterval");
    if (v8 > v10)
    {
      objc_msgSend(v4, "maxRetryInterval");
      v8 = v11;
    }
  }

  return v8;
}

- (void)_retryTimerFired
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper retryTimer](self, "retryTimer"));
  objc_msgSend(v3, "invalidate");

  -[FMDRequestRetryHelper setRetryTimer:](self, "setRetryTimer:", 0);
  -[FMDRequestRetryHelper setNextRetryTime:](self, "setNextRetryTime:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper request](self, "request"));
  if (objc_msgSend(v4, "canRequestBeRetriedNow") && !objc_msgSend(v4, "inProgress"))
  {
    -[FMDRequestRetryHelper _retryNow](self, "_retryNow");
  }
  else
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = (id)objc_opt_class(v4, v7);
      v11 = 2048;
      v12 = v4;
      v8 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Retry time arrived, but request cannot be retried anymore or retry is already in progress. Not retrying", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_retryNow
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035BEC;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_networkCameUp
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  _BYTE v32[24];
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper request](self, "request"));
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v32 = 138412546;
    *(_QWORD *)&v32[4] = objc_opt_class(v3, v6);
    *(_WORD *)&v32[12] = 2048;
    *(_QWORD *)&v32[14] = v3;
    v7 = *(id *)&v32[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Network came up", v32, 0x16u);

  }
  if (objc_msgSend(v3, "canRequestBeRetriedNow")
    && (objc_msgSend(v3, "inProgress") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("TimerBasedNetworkRetry")))
    {

      goto LABEL_8;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry"));

    if (v10)
    {
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", *(_OWORD *)v32, *(_QWORD *)&v32[16]));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry")) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryTime](self, "nextRetryTime"));

        if (v13)
        {
          v14 = sub_1000031B8();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_opt_class(v3, v16);
            v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryTime](self, "nextRetryTime"));
            *(_DWORD *)v32 = 138412802;
            *(_QWORD *)&v32[4] = v17;
            *(_WORD *)&v32[12] = 2048;
            *(_QWORD *)&v32[14] = v3;
            *(_WORD *)&v32[22] = 2112;
            v33 = v19;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Network up retry already pending for %@", v32, 0x20u);

          }
          goto LABEL_28;
        }
      }
      else
      {

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper lastRetryType](self, "lastRetryType"));
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry")) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper lastRetryTime](self, "lastRetryTime"));

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper lastRetryTime](self, "lastRetryTime"));
          objc_msgSend(v11, "timeIntervalSinceDate:", v22);
          v24 = v23;

          if (v24 >= 60.0 || v24 < 0.0)
            v26 = 0.0;
          else
            v26 = 60.0 - v24;
          goto LABEL_23;
        }
      }
      else
      {

      }
      v26 = 0.0;
LABEL_23:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryTime](self, "nextRetryTime"));

      if (!v27
        || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryTime](self, "nextRetryTime")),
            objc_msgSend(v28, "timeIntervalSinceDate:", v11),
            v30 = v29,
            v28,
            v30 < 0.0)
        || v30 >= v26)
      {
        -[FMDRequestRetryHelper _scheduleRetryAfterTimeInterval:](self, "_scheduleRetryAfterTimeInterval:", v26);
        goto LABEL_30;
      }
      v31 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_10022772C((uint64_t)v3, self, v15);
LABEL_28:

LABEL_30:
    }
  }

}

- (void)_scheduleRetryAfterTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper request](self, "request"));
  if (a3 <= 0.0)
  {
    v20 = sub_1000031B8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a3 >= 0.0)
    {
      if (v22)
      {
        v25 = (void *)objc_opt_class(v5, v23);
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
        *(_DWORD *)buf = 138412802;
        v30 = v25;
        v31 = 2048;
        v32 = v5;
        v33 = 2112;
        v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Scheduling retry of type '%@' to occur now", buf, 0x20u);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[FMDRequestRetryHelper setNextRetryTime:](self, "setNextRetryTime:", v28);

      -[FMDRequestRetryHelper _retryNow](self, "_retryNow");
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        v30 = (id)objc_opt_class(v5, v23);
        v31 = 2048;
        v32 = v5;
        v24 = v30;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Not scheduling any retry", buf, 0x16u);

      }
      -[FMDRequestRetryHelper setNextRetryTime:](self, "setNextRetryTime:", 0);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
    -[FMDRequestRetryHelper setNextRetryTime:](self, "setNextRetryTime:", v6);

    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class(v5, v9);
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryType](self, "nextRetryType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper nextRetryTime](self, "nextRetryTime"));
      *(_DWORD *)buf = 138413058;
      v30 = v10;
      v31 = 2048;
      v32 = v5;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Scheduling retry of type '%@' to occur at %@", buf, 0x2Au);

    }
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud.findmydeviced.retry.%@-%p"), objc_opt_class(self, v14), self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v16, self, "_retryTimerFired", 0, a3);
    -[FMDRequestRetryHelper setRetryTimer:](self, "setRetryTimer:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper retryTimer](self, "retryTimer"));
    objc_msgSend(v18, "setMinimumEarlyFireProportion:", 0.75);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper retryTimer](self, "retryTimer"));
    objc_msgSend(v19, "scheduleInQueue:", &_dispatch_main_q);

  }
}

- (int)_retryCountForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper totalRetriesByType](self, "totalRetriesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;

  return v7;
}

- (int)_consecutiveRetryCountForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper consecutiveRetriesByType](self, "consecutiveRetriesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;

  return v7;
}

- (void)_incrementRetryCountForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _UNKNOWN **v16;
  void *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper totalRetriesByType](self, "totalRetriesByType"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[FMDRequestRetryHelper setTotalRetriesByType:](self, "setTotalRetriesByType:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[FMDRequestRetryHelper setConsecutiveRetriesByType:](self, "setConsecutiveRetriesByType:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper totalRetriesByType](self, "totalRetriesByType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v18));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper totalRetriesByType](self, "totalRetriesByType"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v18);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper consecutiveRetriesByType](self, "consecutiveRetriesByType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v18));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper lastRetryType](self, "lastRetryType"));
    v15 = objc_msgSend(v18, "isEqualToString:", v14);

    if (v15)
      v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "intValue") + 1));
    else
      v16 = &off_1002D80B0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestRetryHelper consecutiveRetriesByType](self, "consecutiveRetriesByType"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    v4 = v18;
  }
  ++self->_totalRetryCount;

}

- (void)_networkStateChanged:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", FMLocalNetworkStatusKey));

  if (objc_msgSend(v5, "BOOLValue"))
    -[FMDRequestRetryHelper _networkCameUp](self, "_networkCameUp");

}

- (NSString)nextRetryType
{
  return self->_nextRetryType;
}

- (void)setNextRetryType:(id)a3
{
  objc_storeStrong((id *)&self->_nextRetryType, a3);
}

- (int64_t)totalRetryCount
{
  return self->_totalRetryCount;
}

- (void)setTotalRetryCount:(int64_t)a3
{
  self->_totalRetryCount = a3;
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMDRequest)request
{
  return (FMDRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (NSMutableDictionary)totalRetriesByType
{
  return self->_totalRetriesByType;
}

- (void)setTotalRetriesByType:(id)a3
{
  objc_storeStrong((id *)&self->_totalRetriesByType, a3);
}

- (NSMutableDictionary)consecutiveRetriesByType
{
  return self->_consecutiveRetriesByType;
}

- (void)setConsecutiveRetriesByType:(id)a3
{
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, a3);
}

- (NSString)lastRetryType
{
  return self->_lastRetryType;
}

- (void)setLastRetryType:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryType, a3);
}

- (NSDate)lastRetryTime
{
  return self->_lastRetryTime;
}

- (void)setLastRetryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryTime, a3);
}

- (NSDate)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextRetryTime, a3);
}

- (PCPersistentTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_nextRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryType, 0);
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, 0);
  objc_storeStrong((id *)&self->_totalRetriesByType, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong(&self->_retryAction, 0);
  objc_storeStrong((id *)&self->_nextRetryType, 0);
}

@end
