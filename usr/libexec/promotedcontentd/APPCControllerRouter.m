@implementation APPCControllerRouter

- (id)actionReceiverForConnection:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id *v8;
  int v10;
  const char *v11;
  __int16 v12;
  APPCControllerRouter *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = APLogForCategory(50);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
    v10 = 136643587;
    v11 = "-[APPCControllerRouter actionReceiverForConnection:]";
    v12 = 2050;
    v13 = self;
    v14 = 2050;
    v15 = v4;
    v16 = 2114;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{sensitive}s: controller router %{public}p connection %{public}p bundleID is %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  v8 = sub_10001DF64((id *)[APPCControllerReceiver alloc], v4);

  return v8;
}

- (APPCControllerRouter)init
{
  APPCControllerRouter *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)APPCControllerRouter;
  v2 = -[APPCControllerRouter init](&v8, "init");
  if (v2)
  {
    v3 = APLogForCategory(50);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class(v2);
      *(_DWORD *)buf = 138477827;
      v10 = v5;
      v6 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing listener for PCController", buf, 0xCu);

    }
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  }
  return v2;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.promotedcontent.pcinterface");
}

@end
