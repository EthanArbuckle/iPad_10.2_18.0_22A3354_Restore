@implementation CBDRemoteDeviceDiscovery

- (CBDRemoteDeviceDiscovery)init
{
  CBDRemoteDeviceDiscovery *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBDRemoteDeviceDiscovery;
  v2 = -[CBDRemoteDeviceDiscovery init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.checkerboard.easyrider.browse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)resume
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *started;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, int);
  void *v10;
  CBDRemoteDeviceDiscovery *v11;
  id v12;
  id buf[2];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceDiscovery dispatchQueue](self, "dispatchQueue"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000017E4;
  v10 = &unk_10000C400;
  objc_copyWeak(&v12, buf);
  v11 = self;
  started = (void *)remote_device_start_browsing(9, v5, &v7);
  -[CBDRemoteDeviceDiscovery setBrowser:](self, "setBrowser:", started, v7, v8, v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)invalidate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceDiscovery browser](self, "browser"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceDiscovery browser](self, "browser"));
    remote_device_browser_cancel();

    -[CBDRemoteDeviceDiscovery setBrowser:](self, "setBrowser:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CBDRemoteDeviceDiscovery invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CBDRemoteDeviceDiscovery;
  -[CBDRemoteDeviceDiscovery dealloc](&v3, "dealloc");
}

- (CBDDeviceDiscoveryDelegate)delegate
{
  return (CBDDeviceDiscoveryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_remote_device_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
