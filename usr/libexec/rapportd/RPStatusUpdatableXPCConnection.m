@implementation RPStatusUpdatableXPCConnection

- (RPStatusUpdatableXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  RPStatusUpdatableXPCConnection *v9;
  RPStatusUpdatableXPCConnection *v10;
  RPStatusUpdatableXPCConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPStatusUpdatableXPCConnection;
  v9 = -[RPStatusUpdatableXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  RPStatusProvider *provider;
  RPStatusProvider *v4;
  RPStatusSubscriber *subscriber;
  RPStatusSubscriber *v6;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131B88 <= 20 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 20)))
    LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  provider = self->_provider;
  if (provider)
  {
    -[RPStatusProvider invalidate](provider, "invalidate");
    v4 = self->_provider;
    self->_provider = 0;

  }
  subscriber = self->_subscriber;
  if (subscriber)
  {
    -[RPStatusSubscriber invalidate](subscriber, "invalidate");
    v6 = self->_subscriber;
    self->_subscriber = 0;

  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.StatusUpdates")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100131B88 <= 90
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 90)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection _entitledAndReturnError:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.rapport.StatusUpdates"));
    }
    if (a3)
    {
      v14 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("com.apple.rapport.StatusUpdates"));
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      result = 0;
      *a3 = v15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcStatusUpdatableProvideStatus:(id)a3 statusInfo:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131B88 <= 30 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableProvideStatus:statusInfo:]", 30, "ProvideStatus: %@ with info: %@", v7, v6);

}

- (void)xpcStatusUpdatableCancelProvideStatus:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131B88 <= 30 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableCancelProvideStatus:]", 30, "CancelStatus: %@", v4);

}

- (void)xpcStatusUpdatableSubscribeToStatus:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131B88 <= 30 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableSubscribeToStatus:]", 30, "SubscribeToStatus: %@", v4);

}

- (void)xpcStatusUpdatableUnsubscribeToStatus:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131B88 <= 30 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusUpdatableUnsubscribeToStatus:]", 30, "UnsubscribeToStatus: %@", v4);

}

- (void)xpcStatusProviderActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v19 = 0;
  -[RPStatusUpdatableXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  v15 = v19;
  if (v15)
  {
    if (v8)
      v8[2](v8, 0, v15);
  }
  else if (self->_provider)
  {
    if (dword_100131B88 <= 90
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 90)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusProviderActivate:completion:]", 90, "### RPStatusProvider activate when already activated");
    }
    if (v8)
    {
      v16 = RPErrorF(4294960575, (uint64_t)"Provider already active", v9, v10, v11, v12, v13, v14, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v17);

    }
  }
  else
  {
    if (dword_100131B88 <= 30
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusProviderActivate:completion:]", 30, "RPStatusProvider Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_provider, a3);
    if (v8)
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0);
    -[RPStatusDaemon _update](self->_daemon, "_update");
  }

}

- (void)xpcStatusSubscriberActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v19 = 0;
  -[RPStatusUpdatableXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  v15 = v19;
  if (v15)
  {
    if (v8)
      v8[2](v8, 0, v15);
  }
  else if (self->_subscriber)
  {
    if (dword_100131B88 <= 90
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 90)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusSubscriberActivate:completion:]", 90, "### RPStatusSubscriber activate when already activated");
    }
    if (v8)
    {
      v16 = RPErrorF(4294960575, (uint64_t)"Subscriber already active", v9, v10, v11, v12, v13, v14, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v17);

    }
  }
  else
  {
    if (dword_100131B88 <= 30
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusUpdatableXPCConnection xpcStatusSubscriberActivate:completion:]", 30, "RPStatusSubscriber Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    -[RPStatusSubscriber setDispatchQueue:](self->_subscriber, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_subscriber, a3);
    if (v8)
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0);
    -[RPStatusDaemon _update](self->_daemon, "_update");
  }

}

- (RPStatusDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPStatusProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (RPStatusSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
