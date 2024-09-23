@implementation APAttributionRouter

- (APAttributionRouter)init
{
  APAttributionRouter *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)APAttributionRouter;
  v2 = -[APAttributionRouter init](&v8, "init");
  if (v2)
  {
    v3 = APLogForCategory(50);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class(v2);
      *(_DWORD *)buf = 138477827;
      v10 = v5;
      v6 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for Attribution", buf, 0xCu);

    }
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  }
  return v2;
}

- (id)actionReceiverForConnection:(id)a3
{
  id v3;
  APAttributionReceiver *v4;

  v3 = a3;
  v4 = -[APAttributionReceiver initWithConnection:]([APAttributionReceiver alloc], "initWithConnection:", v3);

  return v4;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.promotedcontent.attributionservice");
}

@end
