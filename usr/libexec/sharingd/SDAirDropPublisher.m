@implementation SDAirDropPublisher

- (SDAirDropPublisher)initWithPort:(id)a3 identity:(__SecIdentity *)a4
{
  id v7;
  SDAirDropPublisher *v8;
  SDAirDropPublisher *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *txtRecord;
  NSMutableDictionary *v12;
  NSMutableDictionary *properties;
  uint64_t v14;
  SDStatusMonitor *monitor;
  __SecIdentity *v16;
  SDAirDropPublisher *v17;
  NSObject *v18;
  uint64_t v19;
  OS_dispatch_source *restartTimer;
  _QWORD v22[4];
  SDAirDropPublisher *v23;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SDAirDropPublisher;
  v8 = -[SDAirDropPublisher init](&v24, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_port, a3);
    objc_storeWeak((id *)&v9->_delegate, 0);
    v9->_service = 0;
    v9->_retryCount = 0;
    v10 = objc_opt_new(NSMutableDictionary);
    txtRecord = v9->_txtRecord;
    v9->_txtRecord = v10;

    v12 = objc_opt_new(NSMutableDictionary);
    properties = v9->_properties;
    v9->_properties = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v14;

    if (a4)
      v16 = (__SecIdentity *)CFRetain(a4);
    else
      v16 = 0;
    v9->_identity = v16;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100033794;
    v22[3] = &unk_1007146D8;
    v17 = v9;
    v23 = v17;
    v18 = sub_10019AAD8(0, &_dispatch_main_q, v22);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    restartTimer = v17->_restartTimer;
    v17->_restartTimer = (OS_dispatch_source *)v19;

    v17->_bonjourNameConflictDetected = 0;
    dispatch_resume((dispatch_object_t)v17->_restartTimer);
    -[SDAirDropPublisher addObservers](v17, "addObservers");

  }
  return v9;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  -[SDAirDropPublisher removeObservers](self, "removeObservers");
  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropPublisher;
  -[SDAirDropPublisher dealloc](&v4, "dealloc");
}

- (void)publishCallBack:(id *)a3
{
  int var1;
  int *p_var1;
  uint64_t v7;
  NSObject *v8;
  int64_t retryCount;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  dispatch_time_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *restartTimer;
  dispatch_time_t v25;
  uint64_t v26;
  CFStringRef Name;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint8_t v31[24];

  p_var1 = &a3->var1;
  var1 = a3->var1;
  if (a3->var0 == kCFStreamErrorDomainNetServices && var1 == -72001)
  {
    v12 = sub_10004DA00(0, 0);
    v16 = airdrop_log(v12);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10003425C((uint64_t)v12, v17, v18, v19, v20, v21, v22, v23);

    self->_bonjourNameConflictDetected = 1;
    sub_10004DC8C();
    restartTimer = self->_restartTimer;
    v25 = sub_10019AAC0(1.0);
    sub_10019AB78(restartTimer, v25);
    goto LABEL_20;
  }
  if (!var1)
  {
    self->_retryCount = 0;
    v26 = airdrop_log(self);
    v12 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      Name = CFNetServiceGetName(self->_service);
      *(_DWORD *)v31 = 138412290;
      *(_QWORD *)&v31[4] = Name;
      v28 = "Bonjour advertise %@ started";
      v29 = v12;
      v30 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, v31, v30);
    }
LABEL_20:

    goto LABEL_21;
  }
  v7 = airdrop_log(self);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000342C0();

  retryCount = self->_retryCount;
  self->_retryCount = retryCount + 1;
  v11 = airdrop_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (retryCount > 8)
  {
    if (v13)
    {
      *(_WORD *)v31 = 0;
      v28 = "Giving up trying to advertise with Bonjour";
      v29 = v12;
      v30 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v13)
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrying Bonjour advertise in 3 seconds...", v31, 2u);
  }

  v14 = self->_restartTimer;
  v15 = sub_10019AAC0(3.0);
  sub_10019AB78(v14, v15);
LABEL_21:
  -[SDStatusMonitor setAirDropPublished:](self->_monitor, "setAirDropPublished:", *p_var1 == 0, *(_OWORD *)v31);
}

- (void)updateTXTRecordAndNotify
{
  uint64_t v3;
  int Boolean;
  uint64_t v5;
  void *v6;
  NSMutableDictionary **p_txtRecord;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFData *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[5];

  if (self->_service)
  {
    if (SFWalletAppAvailable())
    {
      if (-[SDStatusMonitor myAppleIDIsManaged](self->_monitor, "myAppleIDIsManaged"))
        v3 = 871;
      else
        v3 = 887;
    }
    else
    {
      v3 = 871;
    }
    if (MGGetBoolAnswer(CFSTR("jMiqevikb6QWeHOhvLsw6A")))
      v3 |= 0x80uLL;
    Boolean = GestaltGetBoolean(CFSTR("R1Capability"), 0, 0);
    v5 = v3 | 0x400;
    if (!Boolean)
      v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v5));
    p_txtRecord = &self->_txtRecord;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_txtRecord, "setObject:forKeyedSubscript:", v6, CFSTR("flags"));

    if (-[SDStatusMonitor enableStrangers](self->_monitor, "enableStrangers"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
      v9 = objc_msgSend(v8, "isEqual:", kSFOperationDiscoverableModeEveryone);

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleAuthTag"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedStringWithOptions:", 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](*p_txtRecord, "setObject:forKeyedSubscript:", v12, CFSTR("atag"));

      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](*p_txtRecord, "setObject:forKeyedSubscript:", 0, CFSTR("atag"));
      }
    }
    v13 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSNetService dataFromTXTRecordDictionary:](NSNetService, "dataFromTXTRecordDictionary:", *p_txtRecord));
    if (v13)
    {
      CFNetServiceSetTXTData(self->_service, v13);
    }
    else
    {
      v14 = airdrop_log(0);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100034398(v15, v16, v17, v18, v19, v20, v21, v22);

      v24 = airdrop_log(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100034330((uint64_t)&self->_txtRecord, v25, v26, v27, v28, v29, v30, v31);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033C80;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.UserPictureChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.ComputerNameChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.DiscoverableModeChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("SDNotificationNameNearbyBLEAuthTagChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)publish
{
  id WeakRetained;
  __CFNetService *service;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFNetService *v8;
  __CFNetService *v9;
  __CFRunLoop *Main;
  _BOOL8 v11;
  CFOptionFlags v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  CFStreamError error;
  CFNetServiceClientContext clientContext;
  uint8_t buf[4];
  const __CFString *v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    service = self->_service;

    if (!service)
    {
      clientContext.version = 0;
      clientContext.info = self;
      clientContext.retain = (CFAllocatorRetainCallBack)&_CFRetain;
      clientContext.release = (CFAllocatorReleaseCallBack)&_CFRelease;
      clientContext.copyDescription = 0;
      v5 = sub_10004DA00(0, self->_bonjourNameConflictDetected);
      self->_bonjourNameConflictDetected = 0;
      if (v5)
      {
        v6 = v5;
        error.domain = 0;
        *(_QWORD *)&error.error = 0;
        v7 = sub_1000CEC14();
        v8 = CFNetServiceCreate(kCFAllocatorDefault, CFSTR("local"), v7, v6, -[NSNumber intValue](self->_port, "intValue"));
        self->_service = v8;
        CFNetServiceSetClient(v8, (CFNetServiceClientCallBack)sub_100033FF4, &clientContext);
        v9 = self->_service;
        Main = CFRunLoopGetMain();
        CFNetServiceScheduleWithRunLoop(v9, Main, kCFRunLoopDefaultMode);
        -[SDAirDropPublisher updateTXTRecordAndNotify](self, "updateTXTRecordAndNotify");
        v11 = sub_10019CA64();
        if (v11 || (v11 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode")))
        {
          v12 = 2049;
        }
        else
        {
          v11 = -[SDStatusMonitor registerAllInterfaces](self->_monitor, "registerAllInterfaces");
          if (v11)
            v12 = 1050625;
          else
            v12 = 3147777;
        }
        v22 = airdrop_log(v11);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Bonjour advertise %@", buf, 0xCu);
        }

        v24 = CFNetServiceRegisterWithOptions(self->_service, v12, &error);
        if (!(_DWORD)v24)
        {
          v25 = airdrop_log(v24);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            sub_100034400();

        }
        CFRelease(v6);
      }
      else
      {
        v13 = airdrop_log(0);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1000343CC(v14, v15, v16, v17, v18, v19, v20, v21);

      }
    }
  }
}

- (void)start
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034058;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  CFStringRef Name;
  __CFNetService *service;
  __CFRunLoop *Main;
  int v8;
  CFStringRef v9;

  if (self->_service)
  {
    -[NSMutableDictionary removeAllObjects](self->_txtRecord, "removeAllObjects");
    v3 = airdrop_log(-[SDStatusMonitor setAirDropPublished:](self->_monitor, "setAirDropPublished:", 0));
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      Name = CFNetServiceGetName(self->_service);
      v8 = 138412290;
      v9 = Name;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bonjour advertise %@ stopped", (uint8_t *)&v8, 0xCu);
    }

    service = self->_service;
    Main = CFRunLoopGetMain();
    CFNetServiceUnscheduleFromRunLoop(service, Main, kCFRunLoopDefaultMode);
    CFNetServiceSetClient(self->_service, 0, 0);
    CFNetServiceCancel(self->_service);
    CFRelease(self->_service);
    if (!-[SDStatusMonitor disableRotation](self->_monitor, "disableRotation"))
      sub_10004DC8C();
    self->_service = 0;
  }
}

- (void)invalidate
{
  NSObject *restartTimer;
  OS_dispatch_source *v4;

  -[SDAirDropPublisher stop](self, "stop");
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    dispatch_source_cancel(restartTimer);
    v4 = self->_restartTimer;
    self->_restartTimer = 0;

  }
}

- (SDAirDropPublisherDelegate)delegate
{
  return (SDAirDropPublisherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_port, 0);
}

@end
