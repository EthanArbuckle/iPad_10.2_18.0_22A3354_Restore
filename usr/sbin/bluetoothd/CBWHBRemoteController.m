@implementation CBWHBRemoteController

- (id)description
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = sub_1000A15D4(self->_remoteDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = NSPrintF_safe("CBWHBRemoteController: %@", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  if (self->_discoveryFlags != a3)
  {
    self->_discoveryFlags = a3;
    -[CBDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", a3 & 0xFFFFBFFFFFFFFFFFLL);
  }
}

- (void)activate
{
  id v3;
  void *v4;
  CBDiscovery *v5;
  void *v6;
  id v7;
  void *v8;
  CBDiscovery *v9;
  CBDiscovery *v10;
  _QWORD v11[4];
  CBDiscovery *v12;
  CBWHBRemoteController *v13;
  _QWORD v14[4];
  CBDiscovery *v15;
  CBWHBRemoteController *v16;
  _QWORD v17[4];
  CBDiscovery *v18;
  CBWHBRemoteController *v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
  {
    v3 = sub_1000A15D4(self->_remoteDevice);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_100977D88, "-[CBWHBRemoteController activate]", 30, "Remote controller activate: %@", v4);

  }
  v5 = self->_activatedDiscovery;
  if (!v5)
  {
    v5 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_activatedDiscovery, v5);
    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", self->_discoveryFlags & 0xFFFFBFFFFFFFFFFFLL);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer xpcListenerEndpoint](self->_daemonServer, "xpcListenerEndpoint"));
    if (v6)
    {
      -[CBDiscovery setTestListenerEndpoint:](v5, "setTestListenerEndpoint:", v6);
      v7 = objc_alloc_init((Class)CBDevice);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self->_remoteDevice, "idsDeviceIdentifier"));
      objc_msgSend(v7, "setIdentifier:", v8);

      -[CBDiscovery setRemoteDevice:](v5, "setRemoteDevice:", v7);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000A1918;
      v17[3] = &unk_1009171C0;
      v9 = v5;
      v18 = v9;
      v19 = self;
      -[CBDiscovery setDeviceFoundHandler:](v9, "setDeviceFoundHandler:", v17);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000A1938;
      v14[3] = &unk_1009171C0;
      v10 = v9;
      v15 = v10;
      v16 = self;
      -[CBDiscovery setDeviceLostHandler:](v10, "setDeviceLostHandler:", v14);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000A1958;
      v11[3] = &unk_1009171E8;
      v12 = v10;
      v13 = self;
      -[CBDiscovery activateWithCompletion:](v12, "activateWithCompletion:", v11);

    }
    else if (dword_100977D88 <= 90
           && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 90)))
    {
      LogPrintF_safe(&dword_100977D88, "-[CBWHBRemoteController activate]", 90, "### No XPC listener endpoint");
    }

  }
}

- (void)invalidate
{
  id v3;
  void *v4;
  CBDiscovery *activatedDiscovery;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977D88 <= 30 && (dword_100977D88 != -1 || _LogCategory_Initialize(&dword_100977D88, 30)))
  {
    v3 = sub_1000A15D4(self->_remoteDevice);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_100977D88, "-[CBWHBRemoteController invalidate]", 30, "Remote controller invalidate: %@", v4);

  }
  -[CBDiscovery invalidate](self->_activatedDiscovery, "invalidate");
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  self->_invalidated = 1;
}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (void)setActivatedDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_activatedDiscovery, a3);
}

- (NSString)controllerID
{
  return self->_controllerID;
}

- (void)setControllerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_daemonServer, a3);
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPCompanionLinkDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (CBWHBDiscoveryDaemon)whbDaemon
{
  return self->_whbDaemon;
}

- (void)setWhbDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_whbDaemon, a3);
}

- (unint64_t)activationRetryCount
{
  return self->_activationRetryCount;
}

- (void)setActivationRetryCount:(unint64_t)a3
{
  self->_activationRetryCount = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbDaemon, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end
