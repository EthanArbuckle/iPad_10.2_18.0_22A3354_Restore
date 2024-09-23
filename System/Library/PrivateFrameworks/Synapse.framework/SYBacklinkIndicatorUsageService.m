@implementation SYBacklinkIndicatorUsageService

+ (void)beginObservingUsage
{
  id v2;

  v2 = (id)objc_msgSend(a1, "sharedInstance");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  return (id)sharedInstance___instance_0;
}

void __49__SYBacklinkIndicatorUsageService_sharedInstance__block_invoke()
{
  SYBacklinkIndicatorUsageService *v0;
  void *v1;

  v0 = objc_alloc_init(SYBacklinkIndicatorUsageService);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (SYBacklinkIndicatorUsageService)init
{
  SYBacklinkIndicatorUsageService *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSXPCListener *listener;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkIndicatorUsageService;
  v2 = -[SYBacklinkIndicatorUsageService init](&v9, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_DEFAULT, "Starting Backlink Manager Service", v8, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_testingDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.backlink-indicator-usage"));
    }
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SYBacklinkIndicatorUsageService;
  -[SYBacklinkIndicatorUsageService dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v7;
  id v8;
  NSXPCListener *listener;
  void *v10;
  void *v12;

  v7 = (NSXPCListener *)a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkIndicatorUsageService.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newConnection"));

  }
  listener = self->_listener;
  if (listener == v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF497818);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v10);

  }
  objc_msgSend(v8, "setExportedObject:", self);
  objc_msgSend(v8, "resume");

  return listener == v7;
}

- (void)didActivateBacklinkItemWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_testingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didActivateBacklinkItemWithIdentifier:", v4);

}

- (void)didDismissBacklinkItemWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_testingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didDismissBacklinkItemWithIdentifier:", v4);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (_SYBacklinkIndicatorUsageService_TestingDelegate)_testingDelegate
{
  return (_SYBacklinkIndicatorUsageService_TestingDelegate *)(id)__testingDelegate;
}

+ (void)set_testingDelegate:(id)a3
{
  objc_storeStrong((id *)&__testingDelegate, a3);
}

+ (id)_listenerEndpoint
{
  id *v2;
  void *v3;

  +[SYBacklinkIndicatorUsageService sharedInstance](SYBacklinkIndicatorUsageService, "sharedInstance");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[1], "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
