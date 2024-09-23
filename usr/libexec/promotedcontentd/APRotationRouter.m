@implementation APRotationRouter

- (APRotationRouter)init
{
  APRotationRouter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APRotationRouter;
  v2 = -[APRotationRouter init](&v4, "init");
  if (v2)
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v2);
  return v2;
}

- (id)machServiceName
{
  return kPromotedContentXPCMachServiceName;
}

- (void)rotate:(id)a3
{
  void (**v3)(id, id);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  v3 = (void (**)(id, id))a3;
  v4 = APLogForCategory(42);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC Request to rotate promotedcontentd pool manager sessions.", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APSigningAuthorityPoolManager sharedInstance](APSigningAuthorityPoolManager, "sharedInstance"));
  v9 = 0;
  objc_msgSend(v6, "rotateWithError:", &v9);
  v7 = v9;

  if (v3)
    v3[2](v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.ap.promotedcontend.rotationRouter.clientRotated"), 0);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APRotateXPC;
}

- (void)connectionInterrupted
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(42);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection to client for Rotation was interrupted.", v4, 2u);
  }

}

- (void)connectionInvalidated
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(42);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection to client for Rotation was invalidated.", v4, 2u);
  }

}

- (id)requiredEntitlements
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", kPromotedContentClientEntitlement);
}

@end
