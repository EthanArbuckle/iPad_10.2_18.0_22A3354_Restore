@implementation APMetricListener

- (id)actionReceiverForConnection:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  APMetricReceiver *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
    v12 = 138478083;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{private}@] Opening new connection from %{public}@", (uint8_t *)&v12, 0x16u);

  }
  v10 = -[APMetricReceiver initWithConnection:]([APMetricReceiver alloc], "initWithConnection:", v4);

  return v10;
}

- (APMetricListener)init
{
  APMetricListener *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)APMetricListener;
  v2 = -[APMetricListener init](&v8, "init");
  if (v2)
  {
    v3 = APLogForCategory(29);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class(v2);
      *(_DWORD *)buf = 138477827;
      v10 = v5;
      v6 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for MetricRouter", buf, 0xCu);

    }
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  }
  return v2;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.promotedcontent.metrics");
}

@end
