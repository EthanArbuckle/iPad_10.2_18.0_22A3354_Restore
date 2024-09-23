@implementation SBSWidgetMetricsServer

+ (id)checkOutServerInstance
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  os_unfair_lock_lock((os_unfair_lock_t)&__sharedServerInstanceLock);
  v2 = (void *)__sharedServerInstance;
  if (!__sharedServerInstance)
  {
    v3 = -[SBSWidgetMetricsServer _init]([SBSWidgetMetricsServer alloc], "_init");
    v4 = (void *)__sharedServerInstance;
    __sharedServerInstance = (uint64_t)v3;

    v2 = (void *)__sharedServerInstance;
  }
  v5 = v2;
  ++__sharedServerInstanceCheckoutCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedServerInstanceLock);
  return v5;
}

+ (void)returnServerInstance:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedServerInstanceLock);
  v6 = __sharedServerInstance;

  if ((id)v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSWidgetMetricsServer.m"), 49, CFSTR("unknown server instance returned"));

  }
  v7 = __sharedServerInstanceCheckoutCount;
  if (!__sharedServerInstanceCheckoutCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSWidgetMetricsServer.m"), 50, CFSTR("returnServerInstance: call unbalanced with checkOutServerInstance"));

    v7 = __sharedServerInstanceCheckoutCount;
  }
  __sharedServerInstanceCheckoutCount = v7 - 1;
  if (v7 == 1)
  {
    v8 = (void *)__sharedServerInstance;
    __sharedServerInstance = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedServerInstanceLock);
}

- (SBSWidgetMetricsServer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSWidgetMetricsServer.m"), 60, CFSTR("Use +checkOutServerInstance"));

  return 0;
}

- (id)_init
{
  SBSWidgetMetricsServer *v2;
  SBSWidgetMetricsServer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSWidgetMetricsServer;
  v2 = -[SBSWidgetMetricsServer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBSWidgetMetricsServer _createConnection](v2, "_createConnection");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSWidgetMetricsServer;
  -[SBSWidgetMetricsServer dealloc](&v3, sel_dealloc);
}

- (id)systemMetricsForWidget:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  void *v5;
  void *v6;

  connection = self->_connection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemMetricsForWidget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  void *v5;
  void *v6;

  connection = self->_connection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMetricsSpecificationForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  BSServiceConnection *connection;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  connection = self->_connection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  BSServiceConnection *connection;
  id v6;
  id v7;
  void *v8;
  void *v9;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemMetricsForWidget:inHostingEnvironment:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  void *v5;
  void *v6;

  connection = self->_connection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMetricsSpecificationsForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  BSServiceConnection *connection;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  connection = self->_connection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewMetricsSpecificationsForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_createConnection
{
  void *v3;
  void *v4;
  void *v5;
  BSServiceConnection *v6;
  BSServiceConnection *connection;
  id v8;

  v3 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSWidgetMetricsServiceInterfaceSpecification identifier](SBSWidgetMetricsServiceInterfaceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v8);
  v6 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v6;

  -[BSServiceConnection configureConnection:](self->_connection, "configureConnection:", &__block_literal_global_19);
  -[BSServiceConnection activate](self->_connection, "activate");

}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  +[SBSWidgetMetricsServiceInterfaceSpecification serviceQuality](SBSWidgetMetricsServiceInterfaceSpecification, "serviceQuality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v2);

  +[SBSWidgetMetricsServiceInterfaceSpecification interface](SBSWidgetMetricsServiceInterfaceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v3);

  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_15_0);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_17_1);

}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "SBSWidgetMetricsServer: connection interrupted; attempting to re-activate",
      v4,
      2u);
  }

  objc_msgSend(v2, "activate");
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_16()
{
  NSObject *v0;

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__SBSWidgetMetricsServer__createConnection__block_invoke_16_cold_1(v0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_16_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "SBSWidgetMetricsServer: connection invalidated", v1, 2u);
}

@end
