@implementation WiFiP2PTrafficRegistrationReservation

- (id)initForService:(id)a3
{
  id v4;
  WiFiP2PTrafficRegistrationReservation *v5;
  uint64_t v6;
  NSString *service;
  WiFiP2PXPCConnection *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  uint64_t v11;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WiFiP2PTrafficRegistrationReservation;
  v5 = -[WiFiP2PTrafficRegistrationReservation init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    service = v5->_service;
    v5->_service = (NSString *)v6;

    v5->_showsUIAlertOnError = 0;
    v5->_enabledCount = 0;
    v8 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.TrafficRegistrationReservation", 0, v9);
    v11 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v8, "initWithEndpointType:queue:retryTimeout:", 0, v10, +[WiFiP2PXPCConnection defaultRetryTimeout](WiFiP2PXPCConnection, "defaultRetryTimeout"));
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (WiFiP2PXPCConnection *)v11;

    -[WiFiP2PXPCConnection setDelegate:](v5->_xpcConnection, "setDelegate:", v5);
  }

  return v5;
}

- (id)trafficRegistrationConfiguration
{
  AWDLTrafficRegistrationConfiguration *v3;
  void *v4;
  void *v5;
  AWDLTrafficRegistrationConfiguration *v6;

  v3 = [AWDLTrafficRegistrationConfiguration alloc];
  -[WiFiP2PTrafficRegistrationReservation service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiMACAddress zeroAddress](WiFiMACAddress, "zeroAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AWDLTrafficRegistrationConfiguration initWithUniqueIdentifier:peerAddress:](v3, "initWithUniqueIdentifier:peerAddress:", v4, v5);

  if (-[WiFiP2PTrafficRegistrationReservation showsUIAlertOnError](self, "showsUIAlertOnError"))
    -[AWDLTrafficRegistrationConfiguration setOptions:](v6, "setOptions:", -[AWDLTrafficRegistrationConfiguration options](v6, "options") | 4);
  return v6;
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "createXPCResponderWithType:completionHandler:", 1, a4);
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_enabledCount)
  {
    v4 = 0;
    do
    {
      -[WiFiP2PTrafficRegistrationReservation trafficRegistrationConfiguration](self, "trafficRegistrationConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reserveTrafficRegistrationsForConfiguration:enabled:completionHandler:", v5, 1, &__block_literal_global_177);

      ++v4;
    }
    while (v4 < self->_enabledCount);
  }

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  WiFiP2PXPCConnection *xpcConnection;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[WiFiP2PTrafficRegistrationReservation trafficRegistrationConfiguration](self, "trafficRegistrationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E1ED20;
  v11[4] = self;
  v12 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6E1ED48;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  v8 = v5;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientErrorHandler:](xpcConnection, "withRemoteObjectProxy:clientErrorHandler:", v11, v9);

}

uint64_t __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  return objc_msgSend(a2, "reserveTrafficRegistrationsForConfiguration:enabled:completionHandler:", *(_QWORD *)(a1 + 40), 1, a3);
}

void __64__WiFiP2PTrafficRegistrationReservation_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v4 + 16))
    {
      v6 = v3;
      objc_msgSend(*(id *)(v4 + 8), "stop");
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v7 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v7;
  }

}

- (void)invalidate
{
  void *v3;
  WiFiP2PXPCConnection *xpcConnection;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  -[WiFiP2PTrafficRegistrationReservation trafficRegistrationConfiguration](self, "trafficRegistrationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpcConnection = self->_xpcConnection;
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke;
  v7[3] = &unk_1E6E1ED20;
  v7[4] = self;
  v8 = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke_2;
  v6[3] = &unk_1E6E1ED70;
  v5 = v3;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientErrorHandler:](xpcConnection, "withRemoteObjectProxy:clientErrorHandler:", v7, v6);

}

void __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    *(_QWORD *)(v4 + 16) = v5 - 1;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = a3;
    objc_msgSend(a2, "reserveTrafficRegistrationsForConfiguration:enabled:completionHandler:", v7, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = a3;
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifip2pd"), 2, 0);
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    a3[2](v9);

  }
}

uint64_t __51__WiFiP2PTrafficRegistrationReservation_invalidate__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 16))
    return objc_msgSend(*(id *)(v1 + 8), "stop");
  return result;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4F80);
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)showsUIAlertOnError
{
  return self->_showsUIAlertOnError;
}

- (void)setShowsUIAlertOnError:(BOOL)a3
{
  self->_showsUIAlertOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
