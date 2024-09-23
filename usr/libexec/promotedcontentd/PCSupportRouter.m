@implementation PCSupportRouter

- (id)actionReceiverForConnection:(id)a3
{
  id v3;
  unsigned __int8 v4;
  unsigned int v5;
  PCSupportReceiver *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.developer.healthkit"));
  v5 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.developer.homekit"));
  if ((v4 & 1) != 0 || v5)
  {
    v7 = APLogForCategory(36);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Apps using HealthKit or HomeKit are not permitted to use PromotedContent segment APIs. This request will be ignored.", v10, 2u);
    }

    v6 = 0;
  }
  else
  {
    v6 = -[PCSupportReceiver initWithConnection:]([PCSupportReceiver alloc], "initWithConnection:", v3);
  }

  return v6;
}

- (PCSupportRouter)init
{
  PCSupportRouter *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  v8.receiver = self;
  v8.super_class = (Class)PCSupportRouter;
  v2 = -[PCSupportRouter init](&v8, "init");
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
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for PromotedContentSupport ", buf, 0xCu);

    }
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  }
  return v2;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.promotedcontent.supportinterface");
}

@end
