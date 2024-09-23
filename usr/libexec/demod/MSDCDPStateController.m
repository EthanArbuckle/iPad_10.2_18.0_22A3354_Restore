@implementation MSDCDPStateController

- (id)initForPrimaryiCloudAccount
{
  void *v3;
  MSDCDPStateController *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount"));
  if (v3)
  {
    self = -[MSDCDPStateController initWithCDPContext:](self, "initWithCDPContext:", v3);
    v4 = self;
  }
  else
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000C98FC(v6, v7, v8, v9, v10, v11, v12, v13);

    v4 = 0;
  }

  return v4;
}

- (MSDCDPStateController)initWithAuthenticationResults:(id)a3
{
  id v4;
  id v5;
  MSDCDPStateController *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)CDPContext), "initWithAuthenticationResults:", v4);

  v6 = -[MSDCDPStateController initWithCDPContext:](self, "initWithCDPContext:", v5);
  return v6;
}

- (MSDCDPStateController)initWithCDPContext:(id)a3
{
  id v4;
  MSDCDPStateController *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDCDPStateController;
  v5 = -[MSDCDPStateController init](&v8, "init");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)CDPStateController), "initWithContext:", v4);
    -[MSDCDPStateController setCdpController:](v5, "setCdpController:", v6);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MSDCDPStateController;
  -[MSDCDPStateController dealloc](&v4, "dealloc");
}

- (BOOL)isCDPEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

  if (v5)
  {
    v6 = +[CDPAccount isICDPEnabledForDSID:](CDPAccount, "isICDPEnabledForDSID:", v5);
  }
  else
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C9930(v8, v9, v10, v11, v12, v13, v14, v15);

    v6 = 0;
  }

  return v6;
}

- (BOOL)isCDPManateeAvailable
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  v9 = 0;
  v3 = objc_msgSend(v2, "isManateeAvailable:", &v9);
  v4 = v9;

  if ((v3 & 1) == 0)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CDP manatee is NOT available because: %{public}@", buf, 0xCu);

    }
  }

  return v3;
}

- (BOOL)isRecoveryKeyAvailable:(id *)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  v10 = 0;
  v5 = objc_msgSend(v4, "isRecoveryKeyAvailableWithError:", &v10);
  v6 = v10;

  if (v6)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C9964(v6);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (id)generateRecoveryKeyWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "generateRandomRecoveryKey:", &v10));
  v6 = v10;

  if (!v5)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C99E0(v6);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (CDPStateController)cdpController
{
  return self->_cdpController;
}

- (void)setCdpController:(id)a3
{
  objc_storeStrong((id *)&self->_cdpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpController, 0);
}

@end
