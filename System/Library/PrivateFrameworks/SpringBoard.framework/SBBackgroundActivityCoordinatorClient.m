@implementation SBBackgroundActivityCoordinatorClient

- (SBBackgroundActivityCoordinatorClient)initWithConnection:(id)a3 andBackgroundActivityIdentifiers:(id)a4
{
  id v6;
  id v7;
  SBBackgroundActivityCoordinatorClient *v8;
  SBBackgroundActivityCoordinatorClient *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBBackgroundActivityCoordinatorClient;
  v8 = -[SBBackgroundActivityCoordinatorClient init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SBBackgroundActivityCoordinatorClient setConnection:](v8, "setConnection:", v6);
    -[SBBackgroundActivityCoordinatorClient setRegisteredBackgroundActivityIdentifiers:](v9, "setRegisteredBackgroundActivityIdentifiers:", v7);
  }

  return v9;
}

- (void)acquireAssertionAndDeliverTapContextToClient:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[5];
  uint8_t buf[16];

  v4 = (objc_class *)MEMORY[0x1E0D00DB8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPID:flags:reason:name:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), 3, 10002, CFSTR("SBSStatusBarStyleOverridesCoordinatorTapEventDeliveryAssertion"));
  if ((objc_msgSend(v6, "acquire") & 1) == 0)
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Could not acquire assertion to deliver tap event to process.", buf, 2u);
    }

  }
  v8 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke;
  v19[3] = &unk_1E8EA78D8;
  v19[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 10000000000);
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  v13 = v6;
  v18 = v13;
  dispatch_after(v11, v12, block);

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_4;
  v15[3] = &unk_1E8E9DED8;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v10, "statusBarTappedWithContext:reply:", v5, v15);

}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Could not send tap event to coordinator (%@) due to xpc error retrieving remote proxy.", (uint8_t *)&v4, 0xCu);
  }

}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "valid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2_cold_1(v2);

  }
}

uint64_t __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "tap event reply block received", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSSet)registeredBackgroundActivityIdentifiers
{
  return self->_registeredBackgroundActivityIdentifiers;
}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)registeredOverridesQueue
{
  return self->_registeredOverridesQueue;
}

- (void)setRegisteredOverridesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_registeredOverridesQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredOverridesQueue, 0);
  objc_storeStrong((id *)&self->_registeredBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Invalidating process assertion due to timeout of 10 seconds", v1, 2u);
}

@end
