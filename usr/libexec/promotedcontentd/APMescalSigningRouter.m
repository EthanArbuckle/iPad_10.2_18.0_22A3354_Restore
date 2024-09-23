@implementation APMescalSigningRouter

- (APMescalSigningRouter)initWithAMSProvider:(BOOL)a3
{
  _BOOL8 v3;
  APMescalSigningRouter *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APMescalSigningRouter;
  v4 = -[APMescalSigningRouter init](&v10, "init");
  if (v4)
  {
    v5 = APLogForCategory(50);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class(v4);
      *(_DWORD *)buf = 138477827;
      v12 = v7;
      v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing listener for MescalSigning", buf, 0xCu);

    }
    +[APMescalSigningService createServiceWithAMSProvider:](APMescalSigningService, "createServiceWithAMSProvider:", v3);
    +[APXPCListenerManager addDelegate:](APXPCListenerManager, "addDelegate:", v4);
  }
  return v4;
}

- (id)machServiceName
{
  return CFSTR("com.apple.ap.promotedcontent.mescalinterface");
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v5 = (void (**)(id, void *, id))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signatureForData:error:", v6, &v12));

  v9 = v12;
  if (v9)
  {
    v10 = APLogForCategory(28);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "signatureForData returned an error: %{public}@.", buf, 0xCu);
    }

  }
  if (v5)
    v5[2](v5, v8, v9);

}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100121DF0;
  v11[3] = &unk_1002156E0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "signatureForData:waitTime:completion:", v8, v11, a4);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APMescalSigningDaemonInterface;
}

- (void)connectionInterrupted
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(28);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection to client for MescalSigning was interrupted.", v4, 2u);
  }

}

- (void)connectionInvalidated
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(28);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection to client for MescalSigning was invalidated.", v4, 2u);
  }

}

@end
