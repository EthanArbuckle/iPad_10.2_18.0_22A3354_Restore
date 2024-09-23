@implementation CLPCPolicyInterfaceHelper

+ (id)sharedInstance
{
  if (qword_10001BEC0 != -1)
    dispatch_once(&qword_10001BEC0, &stru_100014778);
  return (id)qword_10001BEC8;
}

- (CLPCPolicyInterfaceHelper)init
{
  CLPCPolicyInterfaceHelper *v2;
  os_log_t v3;
  OS_os_log *log;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[8];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLPCPolicyInterfaceHelper;
  v2 = -[CLPCPolicyInterfaceHelper init](&v12, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.powerexperienced", "CLPCPolicyInterfaceHelper");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    if ((MGGetBoolAnswer(CFSTR("IsVirtualDevice")) & 1) == 0)
    {
      v11 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterface createClient:](CLPCPolicyInterface, "createClient:", &v11));
      v6 = v11;
      -[CLPCPolicyInterfaceHelper setClpcClient:](v2, "setClpcClient:", v5);

      v7 = v2->_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initialized CLPC Policy Interface", v10, 2u);
      }
      if (v6)
      {
        v8 = v2->_log;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_10000CEE0((uint64_t)v6, v8);

      }
    }
  }
  return v2;
}

- (void)updatePowerTargetForMode:(id)a3 withState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  uint64_t *v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  NSObject *v23;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));

  if (!v7)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000D360(v10);
    goto LABEL_20;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("RestrictedPerfMode")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    v19 = 0;
    v9 = (id *)&v19;
    objc_msgSend(v8, "setHotInPocketMode:options:error:", v4, 0, &v19);
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("AcceleratedChargingMode")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    v8 = v11;
    v18 = 0;
    v9 = (id *)&v18;
    v12 = &v18;
    v13 = v4;
    v14 = 2;
LABEL_10:
    objc_msgSend(v11, "setContextualPowerMode:options:error:", v13, v14, v12);
LABEL_11:
    v10 = *v9;

    if (v10)
    {
      v15 = objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10000D3A0((uint64_t)v6, (uint64_t)v10, v15);
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("LongChargingMode")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    v8 = v11;
    v17 = 0;
    v9 = (id *)&v17;
    v12 = &v17;
    v13 = v4;
    v14 = 1;
    goto LABEL_10;
  }
LABEL_14:
  if (v4)
    v16 = v6;
  else
    v16 = 0;
  -[CLPCPolicyInterfaceHelper setCurrentActiveMode:](self, "setCurrentActiveMode:", v16);
  v10 = objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updated CLPC with power target for mode %@ status %@", buf, 0x16u);
LABEL_19:

  }
LABEL_20:

}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CLPCPolicyAccess)clpcClient
{
  return (CLPCPolicyAccess *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClpcClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)currentActiveMode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentActiveMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActiveMode, 0);
  objc_storeStrong((id *)&self->_clpcClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
