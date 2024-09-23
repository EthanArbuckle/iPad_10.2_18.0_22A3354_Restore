@implementation BTNetworkMonitor

- (void)startMonitoringWithCallback:(id)a3
{
  dispatch_queue_attr_t v5;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  void *v9;
  id v10;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = a3;
  v8 = dispatch_queue_create("BTNetworkMonitor", v6);
  -[BTNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", v8);

  -[BTNetworkMonitor setBlock:](self, "setBlock:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](NWPathEvaluator, "sharedDefaultEvaluator"));
  -[BTNetworkMonitor setEvaluator:](self, "setEvaluator:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);

}

- (void)stopMonitoring
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);

  -[BTNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", 0);
  -[BTNetworkMonitor setBlock:](self, "setBlock:", 0);
  -[BTNetworkMonitor setEvaluator:](self, "setEvaluator:", 0);
}

- (BOOL)isMonitoring
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isNetworkUp
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = -[BTNetworkMonitor isMonitoring](self, "isMonitoring");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v6 = (unint64_t)objc_msgSend(v5, "status");

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v3;
}

- (void)setCachedIsNetworkUp:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_cachedIsNetworkUp != v3)
  {
    self->_cachedIsNetworkUp = v3;
    -[BTNetworkMonitor notifyNetworkStateChange](self, "notifyNetworkStateChange");
  }
}

- (void)notifyNetworkStateChange
{
  NSObject *v3;
  os_log_t v4;
  NSObject *v5;
  unsigned int v6;
  const __CFString *v7;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const __CFString *v10;

  v3 = objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000681B8("NetworkMonitor");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[BTNetworkMonitor cachedIsNetworkUp](self, "cachedIsNetworkUp");
    v7 = CFSTR("DOWN");
    if (v6)
      v7 = CFSTR("UP");
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network state changed: %@", buf, 0xCu);
  }

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1000568F0;
  activity_block[3] = &unk_1001E20E8;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("path")))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100056B2C;
    v10[3] = &unk_1001E23E8;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_evaluator, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (BOOL)cachedIsNetworkUp
{
  return self->_cachedIsNetworkUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
}

@end
