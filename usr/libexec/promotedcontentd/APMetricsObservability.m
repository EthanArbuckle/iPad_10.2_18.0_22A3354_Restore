@implementation APMetricsObservability

- (APObservabilitySignalMonitoring)signalMonitor
{
  return self->_signalMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_payloadUploadSuccessForBatchInfos:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  APMetricsObservability *v11;
  id v12;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.ap.observabilitymonitor");
  v6 = objc_claimAutoreleasedReturnValue(-[APMetricsObservability queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D4C4;
  block[3] = &unk_1002159F0;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)_batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  id v17;

  v8 = a5;
  v9 = APLogForCategory(13);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218498;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    v16 = 2114;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Batch dequeued waiting time: %f, queue length: %ld, batch ID: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsObservability signalMonitor](self, "signalMonitor"));
  objc_msgSend(v11, "batchDequeuedWithWaitingTime:queueLength:batchID:", a4, v8, a3);

}

- (void)_batchClosedWithBatchLifetime:(double)a3 batchID:(id)a4 eventsCount:(int64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  id v17;

  v8 = a4;
  v9 = APLogForCategory(13);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218498;
    v13 = a3;
    v14 = 2048;
    v15 = a5;
    v16 = 2114;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Batch closed lifetime: %f, events count: %ld BatchID: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsObservability signalMonitor](self, "signalMonitor"));
  objc_msgSend(v11, "batchClosedWithBatchLifetime:eventsCount:", a5, a3);

}

- (void)_batchEnqueuedWithQueueLength:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  int64_t v9;

  v5 = APLogForCategory(13);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Batch enqueued, queue length: %ld", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsObservability signalMonitor](self, "signalMonitor"));
  objc_msgSend(v7, "batchEnqueuedWithQueueLength:", a3);

}

- (void)_payloadUploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchInfos:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  APMetricsObservability *v15;
  id v16;
  int64_t v17;
  int64_t v18;

  v8 = a5;
  v9 = (void *)os_transaction_create("com.apple.ap.observabilitymonitor");
  v10 = objc_claimAutoreleasedReturnValue(-[APMetricsObservability queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001268B4;
  block[3] = &unk_100215A80;
  v17 = a3;
  v18 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

}

- (void)setSignalMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_signalMonitor, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signalMonitor, 0);
}

@end
