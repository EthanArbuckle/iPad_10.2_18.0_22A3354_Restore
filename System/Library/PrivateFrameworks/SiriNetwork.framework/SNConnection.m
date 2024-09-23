@implementation SNConnection

- (SNConnection)init
{

  return 0;
}

- (SNConnection)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4
{
  id v6;
  id v7;
  SNConnection *v8;
  SNConnection *v9;
  SNConnectionInfoInternal *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SNConnectionInternal *v22;
  SNConnectionInternal *underlyingConnection;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SNConnection;
  v8 = -[SNConnection init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SNConnection setConnectionInfo:](v8, "setConnectionInfo:", v6);
    v10 = objc_alloc_init(SNConnectionInfoInternal);
    -[SNConnectionInfoInternal setConnectionProtocolTechnology:](v10, "setConnectionProtocolTechnology:", objc_msgSend(v6, "connectionProtocolTechnology"));
    objc_msgSend(v6, "assistantIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setAssistantIdentifier:](v10, "setAssistantIdentifier:", v11);

    objc_msgSend(v6, "peerAssistantIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setPeerAssistantIdentifier:](v10, "setPeerAssistantIdentifier:", v12);

    objc_msgSend(v6, "connectionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setConnectionId:](v10, "setConnectionId:", v13);

    objc_msgSend(v6, "aceHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setAceHost:](v10, "setAceHost:", v14);

    objc_msgSend(v6, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setLanguageCode:](v10, "setLanguageCode:", v15);

    -[SNConnectionInfoInternal setPrefersWWAN:](v10, "setPrefersWWAN:", objc_msgSend(v6, "prefersWWAN"));
    -[SNConnectionInfoInternal setSkipPeer:](v10, "setSkipPeer:", objc_msgSend(v6, "skipPeer"));
    -[SNConnectionInfoInternal setUseWiFiHint:](v10, "setUseWiFiHint:", objc_msgSend(v6, "useWiFiHint"));
    objc_msgSend(v6, "skipPeerErrorReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setSkipPeerErrorReason:](v10, "setSkipPeerErrorReason:", v16);

    -[SNConnectionInfoInternal setForceReconnect:](v10, "setForceReconnect:", objc_msgSend(v6, "forceReconnect"));
    objc_msgSend(v6, "timeout");
    -[SNConnectionInfoInternal setTimeout:](v10, "setTimeout:");
    -[SNConnectionInfoInternal setImposePolicyBan:](v10, "setImposePolicyBan:", objc_msgSend(v6, "imposePolicyBan"));
    objc_msgSend(v6, "connectionPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setConnectionPolicy:](v10, "setConnectionPolicy:", v17);

    objc_msgSend(v6, "connectionPolicyRoute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setConnectionPolicyRoute:](v10, "setConnectionPolicyRoute:", v18);

    -[SNConnectionInfoInternal setForceOnDeviceOnlyDictation:](v10, "setForceOnDeviceOnlyDictation:", objc_msgSend(v6, "isForceOnDeviceOnlyDictationEnabled"));
    objc_msgSend(v6, "peerType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setPeerType:](v10, "setPeerType:", v19);

    objc_msgSend(v6, "peerVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setPeerVersion:](v10, "setPeerVersion:", v20);

    -[SNConnectionInfoInternal setDeviceIsInWalkaboutExperimentGroup:](v10, "setDeviceIsInWalkaboutExperimentGroup:", objc_msgSend(v6, "deviceIsInWalkaboutExperimentGroup"));
    objc_msgSend(v6, "peerType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNConnectionInfoInternal setPeerType:](v10, "setPeerType:", v21);

    -[SNConnectionInfoInternal setUsesProxyConnection:](v10, "setUsesProxyConnection:", objc_msgSend(v6, "usesProxyConnection"));
    -[SNConnectionInfoInternal setUsesPeerManagedSync:](v10, "setUsesPeerManagedSync:", objc_msgSend(v6, "usesPeerManagedSync"));
    v22 = -[SNConnectionInternal initWithConnectionInfo:connectionQueue:]([SNConnectionInternal alloc], "initWithConnectionInfo:connectionQueue:", v10, v7);
    underlyingConnection = v9->_underlyingConnection;
    v9->_underlyingConnection = v22;

    -[SNConnectionInternal setDelegate:](v9->_underlyingConnection, "setDelegate:", v9);
  }

  return v9;
}

- (id)start
{
  SNConnectionInternal *underlyingConnection;
  id v4;

  underlyingConnection = self->_underlyingConnection;
  v4 = 0;
  -[SNConnectionInternal startAndReturnError:](underlyingConnection, "startAndReturnError:", &v4);
  return v4;
}

- (void)sendData:(id)a3 completion:(id)a4
{
  -[SNConnectionInternal sendData:with:](self->_underlyingConnection, "sendData:with:", a3, a4);
}

- (void)sendCommand:(id)a3 completion:(id)a4
{
  -[SNConnectionInternal sendCommand:with:](self->_underlyingConnection, "sendCommand:with:", a3, a4);
}

- (void)sendCommands:(id)a3 completion:(id)a4
{
  -[SNConnectionInternal sendCommands:with:](self->_underlyingConnection, "sendCommands:with:", a3, a4);
}

- (void)setSendPings:(BOOL)a3
{
  -[SNConnectionInternal setSendPings:](self->_underlyingConnection, "setSendPings:", a3);
}

- (void)cancelSynchronously:(BOOL)a3 isOnConnectionQueue:(BOOL)a4 completion:(id)a5
{
  -[SNConnectionInternal cancelSynchronously:isOnConnectionQueue:with:](self->_underlyingConnection, "cancelSynchronously:isOnConnectionQueue:with:", a3, a4, a5);
}

- (void)getSNConnectionMetrics:(BOOL)a3 completion:(id)a4
{
  -[SNConnectionInternal getSNConnectionMetrics:with:](self->_underlyingConnection, "getSNConnectionMetrics:with:", a3, a4);
}

- (void)getSNConnectionAnalysisInfo:(id)a3
{
  -[SNConnectionInternal getSNConnectionAnalysisInfo:](self->_underlyingConnection, "getSNConnectionAnalysisInfo:", a3);
}

- (void)probeConnection
{
  -[SNConnectionInternal probeConnection](self->_underlyingConnection, "probeConnection");
}

- (void)barrier:(id)a3
{
  -[SNConnectionInternal barrierWith:](self->_underlyingConnection, "barrierWith:", a3);
}

- (void)willStartConnection:(id)a3 type:(id)a4
{
  SNConnection *v6;
  SNConnectionType *v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "delegate");
  v6 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = -[SNConnectionType initWithTechnology:]([SNConnectionType alloc], "initWithTechnology:", objc_msgSend(v9, "connectionTypeRawValue"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "willStartConnection:type:", self, v7);

  }
}

- (void)willStartConnection:(id)a3 with:(id)a4
{
  SNConnection *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "delegate");
  v6 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "willStartConnection:with:", self, v8);

  }
}

- (void)didOpenConnectionType:(id)a3 type:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7
{
  id v12;
  id v13;
  SNConnection *v14;
  SNConnectionType *v15;
  id WeakRetained;
  id v17;

  v17 = a4;
  v12 = a5;
  v13 = a7;
  objc_msgSend(a3, "delegate");
  v14 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v14 == self)
  {
    v15 = -[SNConnectionType initWithTechnology:]([SNConnectionType alloc], "initWithTechnology:", objc_msgSend(v17, "connectionTypeRawValue"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didOpenConnectionType:type:routeId:delay:method:", self, v15, v12, v13, a6);

  }
}

- (void)didReceiveObject:(id)a3 object:(id)a4
{
  SNConnection *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "delegate");
  v6 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didReceiveObject:object:", self, v8);

  }
}

- (void)didReceiveAceObject:(id)a3 object:(id)a4
{
  SNConnection *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "delegate");
  v6 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didReceiveAceObject:object:", self, v8);

  }
}

- (void)didCloseConnection:(id)a3
{
  SNConnection *v4;
  id WeakRetained;

  objc_msgSend(a3, "delegate");
  v4 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didCloseConnection:", self);

  }
}

- (void)didEncounterError:(id)a3 error:(id)a4 analysisInfo:(id)a5
{
  id v8;
  SNConnection *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v8 = a5;
  objc_msgSend(a3, "delegate");
  v9 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didEncounterError:error:analysisInfo:", self, v11, v8);

  }
}

- (void)didEncounterIntermediateError:(id)a3 error:(id)a4
{
  SNConnection *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "delegate");
  v6 = (SNConnection *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didEncounterIntermediateError:error:", self, v8);

  }
}

- (SNConnectionDelegate)delegate
{
  return (SNConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SNConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (SNConnectionInternal)underlyingConnection
{
  return self->_underlyingConnection;
}

- (void)setUnderlyingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
