@implementation WBSCyclerConnectionManager

+ (unint64_t)countOfEnabledCyclers
{
  unsigned int v3;
  unint64_t v4;

  v3 = objc_msgSend(a1, "isBookmarkCyclerEnabled");
  v4 = objc_msgSend(a1, "isTabCyclerEnabled") + (unint64_t)v3;
  return v4 + objc_msgSend(a1, "isExtensionCyclerEnabled");
}

+ (BOOL)isTabCyclerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTabCyclerEnabled"));

  return v3;
}

+ (BOOL)isExtensionCyclerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSExtensionCyclerEnabled"));

  return v3;
}

+ (BOOL)isBookmarkCyclerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSBookmarkCyclerEnabled"));

  return v3;
}

+ (BOOL)shouldTabCyclerSlowDown
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTabCyclerSlowedDown"));

  return v3;
}

- (WBSCyclerConnectionManager)init
{

  return 0;
}

- (WBSCyclerConnectionManager)initWithTestTarget:(id)a3
{
  id v5;
  WBSCyclerConnectionManager *v6;
  WBSCyclerConnectionManager *v7;
  WBSCyclerConnectionManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCyclerConnectionManager;
  v6 = -[WBSCyclerConnectionManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testTarget, a3);
    v8 = v7;
  }

  return v7;
}

- (void)connect
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSObject *v5;
  WBSCyclerServiceProxy *v6;
  WBSCyclerServiceProxy *cyclerProxy;
  WBSCyclerServiceProxy *v8;
  void *v9;
  uint8_t v10[16];

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Set up XPC listener; sending endpoint to cycler", v10, 2u);
  }
  v6 = objc_alloc_init(WBSCyclerServiceProxy);
  cyclerProxy = self->_cyclerProxy;
  self->_cyclerProxy = v6;

  v8 = self->_cyclerProxy;
  -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerServiceProxy setTestTargetEndpoint:reply:](v8, "setTestTargetEndpoint:reply:", v9, &__block_literal_global_34);

}

void __37__WBSCyclerConnectionManager_connect__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__WBSCyclerConnectionManager_connect__block_invoke_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Successfully sent endpoint to cycler", v11, 2u);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v18 = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Received new connection %{public}@ from cycler", (uint8_t *)&v18, 0xCu);
  }
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.Safari.can-use-cycler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70E028);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v9);

    objc_msgSend(v5, "setExportedObject:", self->_testTarget);
    objc_msgSend(v5, "resume");
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSCyclerConnectionManager listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
  }

  return v8;
}

- (WBSCyclerTestTarget)testTarget
{
  return self->_testTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testTarget, 0);
  objc_storeStrong((id *)&self->_cyclerProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __37__WBSCyclerConnectionManager_connect__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Error sending endpoint to cycler: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Remote process is not entitled to use cycler functionality; rejecting connection %{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
