@implementation SYBacklinkIndicatorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_19);
  return (id)sharedInstance___instance_1;
}

void __44__SYBacklinkIndicatorService_sharedInstance__block_invoke()
{
  SYBacklinkIndicatorService *v0;
  void *v1;

  v0 = objc_alloc_init(SYBacklinkIndicatorService);
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;

}

- (SYBacklinkIndicatorService)init
{
  SYBacklinkIndicatorService *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCListener *listener;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SYBacklinkIndicatorService;
  v2 = -[SYBacklinkIndicatorService init](&v8, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_DEFAULT, "Starting Backlink Manager Service", v7, 2u);
    }

    if (objc_msgSend((id)objc_opt_class(), "_forTesting"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.backlinkindicator"));
    }
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

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
  v3.super_class = (Class)SYBacklinkIndicatorService;
  -[SYBacklinkIndicatorService dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (NSXPCListener *)a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkIndicatorService.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newConnection"));

  }
  if (self->_listener != v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF498058);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v10);

  if ((objc_msgSend((id)objc_opt_class(), "_forTesting") & 1) != 0)
  {
LABEL_9:
    objc_msgSend(v8, "setExportedObject:", self);
    objc_msgSend(v8, "resume");
    v9 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.synapse.allowBacklinkIndicatorRequests"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
  {

    goto LABEL_9;
  }
  v13 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorService: Refusing connection from non-entitled client with connection: %@", buf, 0xCu);
  }

LABEL_4:
  v9 = 0;
LABEL_10:

  return v9;
}

- (void)showIndicatorForBacklinkWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4 displayID:(unsigned int)a5 corner:(int64_t)a6 action:(int64_t)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v9 = *(_QWORD *)&a5;
  v18 = a3;
  v12 = a4;
  -[SYBacklinkIndicatorService delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 == 3)
  {
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[SYBacklinkIndicatorService delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hotCornerExited");
LABEL_6:

    }
  }
  else
  {
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      SYMakeEditNoteUserActivity(v18, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYBacklinkIndicatorService delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "showIndicatorForBacklinkWithUserActivity:displayID:corner:toggle:", v15, v9, a6, a7 == 2);

      goto LABEL_6;
    }
  }

}

- (void)hideIndicator
{
  void *v3;
  char v4;
  id v5;

  -[SYBacklinkIndicatorService delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SYBacklinkIndicatorService delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideIndicator");

  }
}

- (SYBacklinkIndicatorServiceDelegate)delegate
{
  return (SYBacklinkIndicatorServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)_forTesting
{
  return __forTesting;
}

+ (void)set_forTesting:(BOOL)a3
{
  __forTesting = a3;
}

- (id)_listenerEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

@end
