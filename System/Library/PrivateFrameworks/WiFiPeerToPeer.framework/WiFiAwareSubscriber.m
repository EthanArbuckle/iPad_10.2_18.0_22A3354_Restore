@implementation WiFiAwareSubscriber

- (WiFiAwareSubscriber)initWithConfiguration:(id)a3
{
  id v5;
  WiFiAwareSubscriber *v6;
  WiFiAwareSubscriber *v7;
  WiFiP2PXPCConnection *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  uint64_t v11;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WiFiAwareSubscriber;
  v6 = -[WiFiAwareSubscriber init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwareSubscriber", 0, v9);
    v11 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v8, "initWithEndpointType:queue:retryTimeout:", 1, v10, +[WiFiP2PXPCConnection defaultRetryTimeout](WiFiP2PXPCConnection, "defaultRetryTimeout"));
    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = (WiFiP2PXPCConnection *)v11;

    -[WiFiP2PXPCConnection setDelegate:](v7->_xpcConnection, "setDelegate:", v7);
  }

  return v7;
}

- (void)handleError:(int64_t)a3
{
  void *v5;
  NSNumber *subscribeID;
  id v7;

  -[WiFiAwareSubscriber delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (self->_subscribeID)
    objc_msgSend(v5, "subscriber:terminatedWithReason:", self, -1);
  else
    objc_msgSend(v5, "subscriber:failedToStartWithError:", self, a3);
  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;

}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4D40);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A1BB0);
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WiFiAwareSubscriber configuration](self, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createSubscribeWithConfiguration:completionHandler:", v8, v6);

}

- (void)start
{
  -[WiFiP2PXPCConnection start](self->_xpcConnection, "start");
}

- (void)stop
{
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](self->_xpcConnection, "withRemoteObjectProxy:", &__block_literal_global_0);
}

uint64_t __27__WiFiAwareSubscriber_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)sendMessage:(id)a3 toPeerAddress:(id)a4 withInstanceID:(unsigned __int8)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  WiFiP2PXPCConnection *xpcConnection;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unsigned __int8 v18;

  v10 = a3;
  v11 = a4;
  xpcConnection = self->_xpcConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__WiFiAwareSubscriber_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke;
  v15[3] = &unk_1E6E1E5A0;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v15, a6);

}

uint64_t __82__WiFiAwareSubscriber_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "sendMessage:toPeerAddress:withInstanceID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), a3);
}

- (NSString)description
{
  NSNumber *subscribeID;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  subscribeID = self->_subscribeID;
  if (subscribeID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), subscribeID);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("unset");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareSubscriber configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<WiFiAwareSubscriber: SubscribeID=%@, Service=%@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)subscribeStartedWithInstanceID:(unsigned __int8)a3
{
  NSNumber *subscribeID;
  NSNumber *v5;
  NSNumber *v6;
  id v7;

  subscribeID = self->_subscribeID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = self->_subscribeID;
  self->_subscribeID = v5;

  if (!subscribeID)
  {
    -[WiFiAwareSubscriber delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subscriberStarted:", self);

  }
}

- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[WiFiAwareSubscriber delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscriber:lostDiscoveryResultForPublishID:address:", self, v4, v6);

}

- (void)subscribeReceivedDiscoveryResult:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WiFiAwareSubscriber delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "subscriber:receivedDiscoveryResult:", self, v4);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "subscriber:receivedDiscoveyResult:", self, v4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v5;
      _os_log_error_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "WiFiAwareSubscriberDelegate %{public}@ is using deprecated method - (void)subscriber:receivedDiscoveyResult: should be using - (void)subscriber:receivedDiscoveryResult: instead.", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = 138543362;
    v7 = v5;
    _os_log_fault_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "WiFiAwareSubscriberDelegate %{public}@ is missing required method - (void)subscriber:receivedDiscoveryResult:", (uint8_t *)&v6, 0xCu);
  }

}

- (void)subscribeTerminatedWithReason:(int64_t)a3
{
  NSNumber *subscribeID;
  void *v6;

  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;

  -[WiFiAwareSubscriber delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriber:terminatedWithReason:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (void)subscribeFailedToStartWithError:(int64_t)a3
{
  NSNumber *subscribeID;
  void *v6;

  subscribeID = self->_subscribeID;
  self->_subscribeID = 0;

  -[WiFiAwareSubscriber delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriber:failedToStartWithError:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (void)subscribeReceivedMessage:(id)a3 fromPublishID:(unsigned __int8)a4 address:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  -[WiFiAwareSubscriber delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "subscriber:receivedMessage:fromPublishID:address:", self, v10, v6, v8);

}

- (WiFiAwareSubscriberDelegate)delegate
{
  return (WiFiAwareSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WiFiAwareSubscribeConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscribeID, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
