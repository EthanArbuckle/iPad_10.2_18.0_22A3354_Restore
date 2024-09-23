@implementation OTDeviceInformationActualAdapter

- (void)dealloc
{
  objc_super v3;

  if (-[OTDeviceInformationActualAdapter store](self, "store"))
  {
    CFRelease(-[OTDeviceInformationActualAdapter store](self, "store"));
    -[OTDeviceInformationActualAdapter setStore:](self, "setStore:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)OTDeviceInformationActualAdapter;
  -[OTDeviceInformationActualAdapter dealloc](&v3, "dealloc");
}

- (BOOL)isMachineIDOverridden
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter overriddenMachineID](self, "overriddenMachineID"));
  v3 = v2 != 0;

  return v3;
}

- (void)clearOverride
{
  -[OTDeviceInformationActualAdapter setOverriddenMachineID:](self, "setOverriddenMachineID:", 0);
}

- (id)modelID
{
  if (qword_100340EB8 != -1)
    dispatch_once(&qword_100340EB8, &stru_1002DBE90);
  return (id)qword_100340EB0;
}

- (id)deviceName
{
  __CFString *v2;

  if (SecIsInternalRelease(self, a2))
    v2 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  else
    v2 = 0;
  return v2;
}

- (void)registerForDeviceNameUpdates:(id)a3
{
  uint64_t v4;
  OTDeviceInformationActualAdapter *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (SecIsInternalRelease(v7, v4))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[OTDeviceInformationActualAdapter setupDeviceNameListener](v5, "setupDeviceNameListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter deviceNameUpdateListeners](v5, "deviceNameUpdateListeners"));
    objc_msgSend(v6, "registerListener:", v7);

    objc_sync_exit(v5);
  }

}

- (id)serialNumber
{
  void *v2;
  uint64_t v3;
  const void *v4;
  NSObject *v5;
  int v7;
  uint8_t buf[4];
  int v9;

  v7 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("SerialNumber"), 0, &v7);
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v4 = sub_10000EF14("octagon");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "failed getting serial number: %d", buf, 8u);
    }

    v2 = 0;
  }
  return v2;
}

- (BOOL)isHomePod
{
  return 0;
}

- (BOOL)isAppleTV
{
  return 0;
}

- (BOOL)isWatch
{
  return 0;
}

- (void)setupDeviceNameListener
{
  void *v3;
  CKKSListenerCollection *v4;
  CFStringRef ComputerName;
  CFStringRef v6;
  const __CFArray *v7;
  __SCDynamicStore *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  SCDynamicStoreContext v11;
  CFStringRef v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter deviceNameUpdateListeners](self, "deviceNameUpdateListeners"));

  if (!v3)
  {
    v4 = -[CKKSListenerCollection initWithName:]([CKKSListenerCollection alloc], "initWithName:", CFSTR("OTDeviceInformationActualAdapter"));
    -[OTDeviceInformationActualAdapter setDeviceNameUpdateListeners:](self, "setDeviceNameUpdateListeners:", v4);

    ComputerName = SCDynamicStoreKeyCreateComputerName(0);
    if (ComputerName)
    {
      v6 = ComputerName;
      v12 = ComputerName;
      v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      CFRelease(v6);
      v11.version = 0;
      memset(&v11.retain, 0, 24);
      v11.info = self;
      -[OTDeviceInformationActualAdapter setStore:](self, "setStore:", SCDynamicStoreCreate(0, CFSTR("OTDeviceInformationActualAdapter"), (SCDynamicStoreCallBack)sub_10004EE24, &v11));
      if (-[OTDeviceInformationActualAdapter store](self, "store"))
      {
        SCDynamicStoreSetNotificationKeys(-[OTDeviceInformationActualAdapter store](self, "store"), v7, 0);
        v8 = -[OTDeviceInformationActualAdapter store](self, "store");
        global_queue = dispatch_get_global_queue(0, 0);
        v10 = objc_claimAutoreleasedReturnValue(global_queue);
        SCDynamicStoreSetDispatchQueue(v8, v10);

      }
    }
  }
}

- (CKKSListenerCollection)deviceNameUpdateListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceNameUpdateListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void)setStore:(__SCDynamicStore *)a3
{
  self->_store = a3;
}

- (NSString)overriddenMachineID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOverriddenMachineID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenMachineID, 0);
  objc_storeStrong((id *)&self->_deviceNameUpdateListeners, 0);
}

- (id)osVersion
{
  __int128 v0;
  int v1;
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  size_t v8;
  size_t v9;
  _OWORD v10[15];
  __int128 v11;
  _OWORD v12[15];
  __int128 v13;

  *(_QWORD *)&v0 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[14] = v0;
  v13 = v0;
  v12[12] = v0;
  v12[13] = v0;
  v12[10] = v0;
  v12[11] = v0;
  v12[8] = v0;
  v12[9] = v0;
  v12[6] = v0;
  v12[7] = v0;
  v12[4] = v0;
  v12[5] = v0;
  v12[2] = v0;
  v12[3] = v0;
  v12[0] = v0;
  v12[1] = v0;
  v9 = 256;
  v1 = sysctlbyname("kern.osrelease", v12, &v9, 0, 0);
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[14] = v2;
  v11 = v2;
  v10[12] = v2;
  v10[13] = v2;
  v10[10] = v2;
  v10[11] = v2;
  v10[8] = v2;
  v10[9] = v2;
  v10[6] = v2;
  v10[7] = v2;
  v10[4] = v2;
  v10[5] = v2;
  v10[2] = v2;
  v10[3] = v2;
  v10[0] = v2;
  v10[1] = v2;
  v8 = 256;
  if (sysctlbyname("kern.osversion", v10, &v8, 0, 0) | v1
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s (%s)"), v12, v10))) == 0))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operatingSystemVersionString"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Version"), &stru_1002EE888));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("iphone"), v5));

  return v6;
}

@end
