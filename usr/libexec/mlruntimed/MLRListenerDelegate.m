@implementation MLRListenerDelegate

- (MLRListenerDelegate)initWithXPCActivityManager:(id)a3
{
  id v5;
  MLRListenerDelegate *v6;
  MLRListenerDelegate *v7;
  MLRListenerDelegate *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MLRListenerDelegate;
    v6 = -[MLRListenerDelegate init](&v10, "init");
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_XPCActivityManager, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  MLRXPCActivityManager *XPCActivityManager;
  id v5;
  MLRServiceConnection *v6;
  uint64_t XPCInterface;
  void *v8;

  XPCActivityManager = self->_XPCActivityManager;
  v5 = a4;
  -[MLRXPCActivityManager registerIfNeeded](XPCActivityManager, "registerIfNeeded");
  v6 = -[MLRServiceConnection initWithXPCConnection:]([MLRServiceConnection alloc], "initWithXPCConnection:", v5);
  XPCInterface = DESServiceGetXPCInterface(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  objc_msgSend(v5, "setExportedInterface:", v8);

  objc_msgSend(v5, "setExportedObject:", v6);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCActivityManager, 0);
}

@end
