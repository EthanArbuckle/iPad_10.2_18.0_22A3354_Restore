@implementation WiFiUtil

- (WiFiUtil)init
{
  WiFiUtil *v2;
  uint64_t v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *q;
  __WiFiManagerClient *wifiClient;
  CFRunLoopRef Main;
  objc_super v9;
  void *v10;
  void *v11[2];
  char v12;
  std::string __p;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUtil;
  v2 = -[WiFiUtil init](&v9, "init");
  if (v2)
  {
    v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    v2->_wifiClient = (__WiFiManagerClient *)v3;
    if (!v3)
    {
      sub_1000D5048(v11, "");
      sub_100227518("Failed to create connection to wifi daemon", &__p);
      sub_100174738((uint64_t)v11, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v12 < 0)
        operator delete(v11[0]);
      sub_1000F2AE4((uint64_t)&v10);
    }
    v4 = dispatch_queue_create("com.apple.pipelined.wifiutil", 0);
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v4;

    -[WiFiUtil onQueueReEnumerateDevices](v2, "onQueueReEnumerateDevices");
    wifiClient = v2->_wifiClient;
    Main = CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop(wifiClient, Main, kCFRunLoopCommonModes);
  }
  return v2;
}

- (void)invalidate
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100319CD0;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_async(q, block);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WiFiUtil;
  -[WiFiUtil dealloc](&v2, "dealloc");
}

- (void)onQueueInvalidate
{
  -[WiFiUtil onQueueDeregisterDevices](self, "onQueueDeregisterDevices");
  if (self->_wifiClient)
  {
    -[WiFiUtil onQueueDeregisterManager](self, "onQueueDeregisterManager");
    CFRelease(self->_wifiClient);
    self->_wifiClient = 0;
  }
}

- (void)onQueueRegisterDevices
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_wifiDevices;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        WiFiDeviceClientRegisterPowerCallback(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), sub_100319E70, self);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)onQueueDeregisterDevices
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_wifiDevices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        WiFiDeviceClientRegisterPowerCallback(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), 0, 0);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)onQueueDeregisterManager
{
  WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiClient, 0, 0);
}

- (void)onQueueRegisterManager
{
  WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiClient, sub_100319FB0, self);
}

- (BOOL)isDisabled
{
  return WiFiManagerClientGetPower(self->_wifiClient, a2) == 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  q = self->_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031A058;
  v7[3] = &unk_1003EE800;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(q, v7);

}

- (void)deviceAttached:(__WiFiDeviceClient *)a3
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031A104;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_async(q, block);
}

- (void)onQueueReEnumerateDevices
{
  NSArray *v3;
  NSArray *wifiDevices;
  id WeakRetained;

  -[WiFiUtil onQueueDeregisterDevices](self, "onQueueDeregisterDevices");
  v3 = (NSArray *)WiFiManagerClientCopyDevices(self->_wifiClient);
  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    -[WiFiUtil onQueueRegisterDevices](self, "onQueueRegisterDevices");
}

- (void)notifyDevicePowerChanged
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031A1BC;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_async(q, block);
}

- (WiFiUtilDelegate)delegate
{
  return (WiFiUtilDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wifiDevices, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

@end
