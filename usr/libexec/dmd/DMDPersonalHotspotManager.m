@implementation DMDPersonalHotspotManager

+ (DMDPersonalHotspotManager)sharedManager
{
  if (qword_1000EBA30 != -1)
    dispatch_once(&qword_1000EBA30, &stru_1000BBAC8);
  return (DMDPersonalHotspotManager *)(id)qword_1000EBA28;
}

- (DMDPersonalHotspotManager)init
{
  DMDPersonalHotspotManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMDPersonalHotspotManager;
  v2 = -[DMDPersonalHotspotManager init](&v4, "init");
  if (v2)
  {
    v2->_scDynamicStore = SCDynamicStoreCreate(0, CFSTR("com.apple.managedconfiguration.DMDPersonalHotspotManager"), 0, 0);
    v2->_netrbClient = (NETRBClient *)_NETRBClientCreate(0, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  _NETRBClientDestroy(self->_netrbClient, a2);
  CFRelease(self->_scDynamicStore);
  v3.receiver = self;
  v3.super_class = (Class)DMDPersonalHotspotManager;
  -[DMDPersonalHotspotManager dealloc](&v3, "dealloc");
}

- (BOOL)enabled
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  void *v16;

  if (-[DMDPersonalHotspotManager scDynamicStore](self, "scDynamicStore"))
  {
    v3 = SCDynamicStoreCopyValue(-[DMDPersonalHotspotManager scDynamicStore](self, "scDynamicStore"), CFSTR("com.apple.MobileInternetSharing"));
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("State")));
      v6 = objc_msgSend(v5, "intValue");

      v7 = v6 == 1023;
      v8 = DMFPersonalHotspotLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = MCStringForBool(v6 == 1023);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v15 = 138543362;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Personal hotspot enabled: %{public}@", (uint8_t *)&v15, 0xCu);

      }
    }
    else
    {
      v13 = DMFPersonalHotspotLog();
      v9 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000787B8();
      v7 = 0;
    }

  }
  else
  {
    v12 = DMFPersonalHotspotLog();
    v4 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10007878C();
    v7 = 0;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NETRBClient *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;

  v3 = a3;
  v4 = -[DMDPersonalHotspotManager netrbClient](self, "netrbClient");
  v5 = DMFPersonalHotspotLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000787E4();
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = MCStringForBool(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting personal hotspot enabled to %{public}@", (uint8_t *)&v12, 0xCu);

  }
  if (v3)
    v10 = 1023;
  else
    v10 = 1022;
  if ((_NETRBClientSetGlobalServiceState(v4, v10) & 1) == 0)
  {
    v11 = DMFPersonalHotspotLog();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100078810();
LABEL_12:

  }
}

- (NETRBClient)netrbClient
{
  return self->_netrbClient;
}

- (void)setNetrbClient:(NETRBClient *)a3
{
  self->_netrbClient = a3;
}

- (__SCDynamicStore)scDynamicStore
{
  return self->_scDynamicStore;
}

- (void)setScDynamicStore:(__SCDynamicStore *)a3
{
  self->_scDynamicStore = a3;
}

@end
