@implementation APMetricPreparedDataServerDelivery

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)backoffTimerFired
{
  -[APMetricPreparedDataServerDelivery _continueProcessing](self, "_continueProcessing");
}

- (void)_continueProcessing
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery processor](self, "processor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001288E8;
  v4[3] = &unk_1002158D0;
  objc_copyWeak(&v5, &location);
  sub_10012DE30(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_uploadFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery metricsFileManager](self, "metricsFileManager"));
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileForReadingAtKeyPath:error:", v4, &v17));
  v7 = v17;

  if (v7)
  {
    v8 = APLogForCategory(29);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to open metrics data file: %{public}@", buf, 0xCu);
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
  if (!v9)
  {
    v13 = APLogForCategory(29);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to read data from %{public}@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery metricsFileManager](self, "metricsFileManager"));
    objc_msgSend(v15, "removeObjectAtPath:error:", v4, 0);

    goto LABEL_11;
  }
  v10 = -[APMetricPreparedDataServerDelivery _sendRequest:](self, "_sendRequest:", v9);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery metricsFileManager](self, "metricsFileManager"));
    objc_msgSend(v11, "removeObjectAtPath:error:", v4, 0);

  }
  v12 = v10 ^ 1;
LABEL_12:

  return v12;
}

- (BOOL)_sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  char *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery httpDelivery](self, "httpDelivery"));
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sendHTTPDeliveryRequest:error:", v4, &v17));

  v7 = v17;
  if (v7)
  {
    v8 = objc_msgSend(v7, "code");
    v9 = APLogForCategory(29);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = v8;
      v20 = 2114;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error (%ld) attempting to send metrics data: %{public}@", buf, 0x16u);
    }

    goto LABEL_5;
  }
  v12 = (char *)objc_msgSend(v6, "statusCode");
  if ((unint64_t)(v12 - 200) <= 0x63)
  {
    -[APMetricPreparedDataServerDelivery _backoffTimerReset](self, "_backoffTimerReset");
LABEL_13:
    v11 = 1;
    goto LABEL_14;
  }
  v13 = v12;
  if (v12 != (char *)503 && (unint64_t)(v12 - 400) > 0xC7)
  {
    v14 = APLogForCategory(29);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received unknown status code from response (%ld)!", buf, 0xCu);
    }

    goto LABEL_13;
  }
LABEL_5:
  -[APMetricPreparedDataServerDelivery _backoffTimerScheduleNextLevel](self, "_backoffTimerScheduleNextLevel");
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)_backoffTimerScheduleNextLevel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery backoffTimer](self, "backoffTimer"));

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)APBackoffTimer), "initWithSchedule:name:", 0, CFSTR("Prepared Data"));
    -[APMetricPreparedDataServerDelivery setBackoffTimer:](self, "setBackoffTimer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery backoffTimer](self, "backoffTimer"));
    objc_msgSend(v5, "setDelegate:", self);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery backoffTimer](self, "backoffTimer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery queue](self, "queue"));
  v8 = objc_msgSend(v6, "scheduleNextLevelWithQueue:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = APLogForCategory(29);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Metric Data Server.", v11, 2u);
    }

  }
}

- (void)_backoffTimerReset
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedDataServerDelivery backoffTimer](self, "backoffTimer"));
  objc_msgSend(v3, "reset");

  -[APMetricPreparedDataServerDelivery setBackoffTimer:](self, "setBackoffTimer:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (APMetricStoringEC)storage
{
  return (APMetricStoringEC *)objc_loadWeakRetained((id *)&self->_storage);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak((id *)&self->_storage, a3);
}

- (APMetricHTTPDelivery)httpDelivery
{
  return (APMetricHTTPDelivery *)objc_loadWeakRetained((id *)&self->_httpDelivery);
}

- (void)setHttpDelivery:(id)a3
{
  objc_storeWeak((id *)&self->_httpDelivery, a3);
}

- (NSEnumerator)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (APSequentialProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_processor, a3);
}

- (APStorageManager)metricsFileManager
{
  return self->_metricsFileManager;
}

- (void)setMetricsFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricsFileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsFileManager, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_destroyWeak((id *)&self->_httpDelivery);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
