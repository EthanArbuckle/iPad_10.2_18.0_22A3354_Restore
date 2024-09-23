@implementation WBSPasswordBreachHelperListener

- (WBSPasswordBreachHelperListener)init
{
  WBSPasswordBreachHelperListener *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  WBSPasswordBreachHelperListener *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordBreachHelperListener;
  v2 = -[WBSPasswordBreachHelperListener init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0D89EB8]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v6 = v2;
  }

  return v2;
}

- (BOOL)_connectionHasValidEntitlements:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.private.Safari.PasswordBreachHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  WBSPasswordBreachHelper *v8;

  v5 = a4;
  v6 = -[WBSPasswordBreachHelperListener _connectionHasValidEntitlements:](self, "_connectionHasValidEntitlements:", v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7205B8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);
    v8 = objc_alloc_init(WBSPasswordBreachHelper);
    objc_msgSend(v5, "setExportedObject:", v8);
    objc_msgSend(v5, "resume");

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[WBSPasswordBreachHelperListener listener:shouldAcceptNewConnection:].cold.1();
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A3D90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Connection to PasswordBreachHelper denied: Missing entitlement.", v0, 2u);
}

@end
