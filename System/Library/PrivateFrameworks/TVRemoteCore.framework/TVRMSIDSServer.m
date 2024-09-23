@implementation TVRMSIDSServer

+ (id)server
{
  if (server_onceToken != -1)
    dispatch_once(&server_onceToken, &__block_literal_global_0);
  return (id)server_server;
}

void __24__TVRMSIDSServer_server__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)server_server;
  server_server = v0;

}

- (TVRMSIDSServer)init
{
  TVRMSIDSServer *v2;
  uint64_t v3;
  TVRMSSessionManager *sessionManager;
  uint64_t v5;
  NSMutableDictionary *nowPlayingSessions;
  uint64_t v7;
  NSMutableDictionary *pairingSessions;
  uint64_t v9;
  NSMutableDictionary *touchRemoteSessions;
  void *v11;
  uint64_t v12;
  IDSService *idsService;
  IDSService *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TVRMSIDSServer;
  v2 = -[TVRMSIDSServer init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sessionManager = v2->_sessionManager;
    v2->_sessionManager = (TVRMSSessionManager *)v3;

    -[TVRMSSessionManager setDelegate:](v2->_sessionManager, "setDelegate:", v2);
    v5 = objc_opt_new();
    nowPlayingSessions = v2->_nowPlayingSessions;
    v2->_nowPlayingSessions = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    pairingSessions = v2->_pairingSessions;
    v2->_pairingSessions = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    touchRemoteSessions = v2->_touchRemoteSessions;
    v2->_touchRemoteSessions = (NSMutableDictionary *)v9;

    -[TVRMSSessionManager persistedSessionIdentifiers](v2->_sessionManager, "persistedSessionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.remotemediaservices"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v12;

    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleSessionHeartbeat_, 16);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleBeginDiscovery_, 1);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleEndDiscovery_, 3);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleConnectToService_, 5);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleLogout_, 7);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handlePlaybackCommand_, 8);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handlePickAudioRoute_, 18);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleSetVolume_, 20);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleTouchMove_, 21);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleTouchEnd_, 22);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleNavigationCommand_, 23);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleBeginObservingNowPlaying_, 9);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleEndObservingNowPlaying_, 11);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleNowPlayingArtworkRequest_, 24);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleBeginPairing_, 26);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleEndPairing_, 28);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleSetLikeState_, 31);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleAddToWishlist_, 33);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleSeekToPlaybackTime_, 35);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleUpdatePairedNetworkNames_, 39);
    v14 = v2->_idsService;
    dispatch_get_global_queue(25, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSService addDelegate:queue:](v14, "addDelegate:queue:", v2, v15);

    -[TVRMSIDSServer _cleanupStaleSessions:](v2, "_cleanupStaleSessions:", v11);
  }
  return v2;
}

- (void)_handleSessionHeartbeat:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      v15 = 67109120;
      v16 = v8;
      _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat", (uint8_t *)&v15, 8u);
    }

    -[TVRMSSessionManager refreshSessionWithIdentifier:](self->_sessionManager, "refreshSessionWithIdentifier:", v8);
    v13 = 1;
  }
  else
  {
    if (v12)
    {
      v15 = 67109120;
      v16 = v8;
      _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat, but session was no longer active - respond with timeout error", (uint8_t *)&v15, 8u);
    }

    v13 = 4294967293;
  }
  objc_msgSend(v10, "setResponseCode:", v13);
  objc_msgSend(v10, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v14, 17, 10, 0, v4);

}

- (void)_handleBeginDiscovery:(id)a3
{
  id v4;
  NSObject *v5;
  TVRMSBeginDiscoveryMessage *v6;
  void *v7;
  TVRMSBeginDiscoveryMessage *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  TVRMSSessionManager *sessionManager;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin discovery session", buf, 2u);
  }

  v6 = [TVRMSBeginDiscoveryMessage alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TVRMSBeginDiscoveryMessage initWithData:](v6, "initWithData:", v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDiscoveryTypes:", -[TVRMSBeginDiscoveryMessage discoveryTypes](v8, "discoveryTypes"));
  objc_msgSend(v9, "setDelegate:", self);
  if (-[TVRMSBeginDiscoveryMessage hasPairedNetworkNames](v8, "hasPairedNetworkNames"))
  {
    _TVRCRMSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Client supplied a list of paired network names, use this for filtering discovery", buf, 2u);
    }

    -[TVRMSBeginDiscoveryMessage pairedNetworkNames](v8, "pairedNetworkNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPairedNetworkNames:", v11);

  }
  sessionManager = self->_sessionManager;
  v13 = (int)*(double *)&TVRMSDiscoverySessionTimeout;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke;
  v16[3] = &unk_24DCD7630;
  v16[4] = self;
  v17 = v4;
  v18 = v9;
  v14 = v9;
  v15 = v4;
  -[TVRMSSessionManager beginSession:timeout:shouldTakePowerAssertion:completionHandler:](sessionManager, "beginSession:timeout:shouldTakePowerAssertion:completionHandler:", v14, v13, 1, v16);

}

void __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  int v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke_2;
  v4[3] = &unk_24DCD7608;
  v7 = a2;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSessionIdentifier:", *(unsigned int *)(a1 + 56));
  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 56);
    v9 = 67109120;
    v10 = v4;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin discovery response", (uint8_t *)&v9, 8u);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v2, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendData:type:timeout:queueOneID:inResponseTo:", v6, 2, 10, 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "beginDiscovery");
  if ((objc_msgSend(*(id *)(a1 + 48), "isNetworkAvailable") & 1) == 0)
  {
    _TVRCRMSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(a1 + 56);
      v9 = 67109120;
      v10 = v8;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Network not available, immediately notify client", (uint8_t *)&v9, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "discoverySessionNetworkAvailabilityDidChange:", *(_QWORD *)(a1 + 48));
  }

}

- (void)_handleUpdatePairedNetworkNames:(id)a3
{
  id v4;
  NSObject *v5;
  TVRMSUpdatePairedNetworNamesMessage *v6;
  void *v7;
  TVRMSUpdatePairedNetworNamesMessage *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received request to update paired network names", v11, 2u);
  }

  v6 = [TVRMSUpdatePairedNetworNamesMessage alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TVRMSUpdatePairedNetworNamesMessage initWithData:](v6, "initWithData:", v7);
  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", -[TVRMSUpdatePairedNetworNamesMessage sessionIdentifier](v8, "sessionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSUpdatePairedNetworNamesMessage pairedNetworkNames](v8, "pairedNetworkNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPairedNetworkNames:", v10);

}

- (void)_handleEndDiscovery:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end discovery session", (uint8_t *)v10, 8u);
  }

  -[TVRMSSessionManager endSessionWithIdentifier:completionHandler:](self->_sessionManager, "endSessionWithIdentifier:completionHandler:", v8, &__block_literal_global_54);
}

uint64_t __38__TVRMSIDSServer__handleEndDiscovery___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endDiscovery");
}

- (void)_handleConnectToService:(id)a3
{
  id v4;
  NSObject *v5;
  TVRMSConnectToServiceMessage *v6;
  void *v7;
  TVRMSConnectToServiceMessage *v8;
  void *v9;
  TVRMSSessionManager *sessionManager;
  uint64_t v11;
  id v12;
  id v13;
  TVRMSConnectToServiceMessage *v14;
  _QWORD v15[4];
  TVRMSConnectToServiceMessage *v16;
  id v17;
  TVRMSIDSServer *v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received request to connect to service", buf, 2u);
  }

  v6 = [TVRMSConnectToServiceMessage alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TVRMSConnectToServiceMessage initWithData:](v6, "initWithData:", v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDelegate:", self);
  sessionManager = self->_sessionManager;
  v11 = (int)*(double *)&TVRMSDAAPControlSessionTimeout;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__TVRMSIDSServer__handleConnectToService___block_invoke;
  v15[3] = &unk_24DCD76C0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v4;
  v12 = v4;
  v13 = v9;
  v14 = v8;
  -[TVRMSSessionManager beginSession:timeout:shouldTakePowerAssertion:completionHandler:](sessionManager, "beginSession:timeout:shouldTakePowerAssertion:completionHandler:", v13, v11, 0, v15);

}

void __42__TVRMSIDSServer__handleConnectToService___block_invoke(uint64_t a1, int a2)
{
  TVRMSService *v4;
  void *v5;
  TVRMSService *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int v12;

  v4 = [TVRMSService alloc];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRMSService initWithProtobuf:](v4, "initWithProtobuf:", v5);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pairingGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__TVRMSIDSServer__handleConnectToService___block_invoke_2;
  v10[3] = &unk_24DCD7698;
  v12 = a2;
  v9 = *(void **)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 48);
  v11 = v9;
  objc_msgSend(v7, "connectToService:pairingGUID:completionHandler:", v6, v8, v10);

}

void __42__TVRMSIDSServer__handleConnectToService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setResponseCode:", a2);
  objc_msgSend(v5, "protobuf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setControlInterface:", v7);
  objc_msgSend(v6, "setSessionIdentifier:", *(unsigned int *)(a1 + 48));
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(a1 + 48);
    NSStringFromRMSResponseCode(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 67109378;
    v13[1] = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending connection result: %@", (uint8_t *)v13, 0x12u);

  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sendData:type:priority:timeout:queueOneID:inResponseTo:", v12, 6, 300, 15, 0, *(_QWORD *)(a1 + 40));

}

- (void)_handleLogout:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for logout", (uint8_t *)v10, 8u);
  }

  -[TVRMSSessionManager endSessionWithIdentifier:completionHandler:](self->_sessionManager, "endSessionWithIdentifier:completionHandler:", v8, &__block_literal_global_61);
}

uint64_t __32__TVRMSIDSServer__handleLogout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logout");
}

- (void)_handlePlaybackCommand:(id)a3
{
  id v4;
  TVRMSPlaybackCommandMessage *v5;
  void *v6;
  TVRMSPlaybackCommandMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSPlaybackCommandMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSPlaybackCommandMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSPlaybackCommandMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for playback command", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendPlaybackCommand:completionHandler:", -[TVRMSPlaybackCommandMessage playbackCommand](v7, "playbackCommand"), 0);

}

- (void)_handleBeginObservingNowPlaying:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to begin observing now playing", (uint8_t *)v13, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginObservingNowPlaying");
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setResponseCode:", 1);
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v12, 10, 15, 0, v4);

}

- (void)_handleEndObservingNowPlaying:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end observing now playing session", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endObservingNowPlaying");

}

- (void)_handlePickAudioRoute:(id)a3
{
  id v4;
  TVRMSPickAudioRouteMessage *v5;
  void *v6;
  TVRMSPickAudioRouteMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int v16;
  id buf;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSPickAudioRouteMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSPickAudioRouteMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSPickAudioRouteMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to pick audio route", (uint8_t *)&buf, 8u);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setMacAddress:", -[TVRMSPickAudioRouteMessage macAddress](v7, "macAddress"));
  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&buf, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__TVRMSIDSServer__handlePickAudioRoute___block_invoke;
  v13[3] = &unk_24DCD7728;
  v16 = v8;
  objc_copyWeak(&v15, &buf);
  v12 = v4;
  v14 = v12;
  objc_msgSend(v11, "pickAudioRoute:completionHandler:", v10, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);

}

void __40__TVRMSIDSServer__handlePickAudioRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseCode:", a2);
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(a1 + 48);
    NSStringFromRMSResponseCode(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick route response: %@", (uint8_t *)v10, 0x12u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sendData:type:timeout:queueOneID:inResponseTo:", v9, 19, 30, 0, *(_QWORD *)(a1 + 32));

}

- (void)_handleSetVolume:(id)a3
{
  id v4;
  TVRMSSetVolumeMessage *v5;
  void *v6;
  TVRMSSetVolumeMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSetVolumeMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSetVolumeMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSetVolumeMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set volume", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSSetVolumeMessage volume](v7, "volume");
  objc_msgSend(v10, "setVolume:completionHandler:", 0);

}

- (void)_handleSeekToPlaybackTime:(id)a3
{
  id v4;
  TVRMSSeekToPlaybackTimeMessage *v5;
  void *v6;
  TVRMSSeekToPlaybackTimeMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSeekToPlaybackTimeMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSeekToPlaybackTimeMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSeekToPlaybackTimeMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received message to seek to playbacktime", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "seekToPlaybackTime:completionHandler:", -[TVRMSSeekToPlaybackTimeMessage playbackTime](v7, "playbackTime"), 0);

}

- (void)_handleNowPlayingArtworkRequest:(id)a3
{
  id v4;
  TVRMSNowPlayingArtworkRequestMessage *v5;
  void *v6;
  TVRMSNowPlayingArtworkRequestMessage *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSNowPlayingArtworkRequestMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSNowPlayingArtworkRequestMessage initWithData:](v5, "initWithData:", v6);

  -[TVRMSNowPlayingArtworkRequestMessage artworkIdentifier](v7, "artworkIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = (uint64_t)v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Received artwork request for identifier: %@", (uint8_t *)&v21, 0xCu);
  }

  +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkDataForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[TVRMSNowPlayingArtworkRequestMessage width](v7, "width");
    v13 = -[TVRMSNowPlayingArtworkRequestMessage height](v7, "height");
    -[TVRMSNowPlayingArtworkRequestMessage compressionQuality](v7, "compressionQuality");
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v15;
    objc_msgSend(v16, "rms_jpegDataScaledToSize:compressionQuality:", (double)v12, (double)v13, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    _TVRCRMSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[NSObject length](v18, "length");
      v21 = 134217984;
      v22 = v20;
      _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Sending artwork, size=%td", (uint8_t *)&v21, 0xCu);
    }

    -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v18, 25, (int)*MEMORY[0x24BE4FD70], CFSTR("ArtworkData"), v4);
  }
  else
  {
    _TVRCRMSLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Artwork data not found", (uint8_t *)&v21, 2u);
    }
  }

}

- (void)_handleSetLikeState:(id)a3
{
  id v4;
  TVRMSSetLikeStateMessage *v5;
  void *v6;
  TVRMSSetLikeStateMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id buf;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSetLikeStateMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSSetLikeStateMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSSetLikeStateMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set like state", (uint8_t *)&buf, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&buf, self);
  v11 = -[TVRMSSetLikeStateMessage likeState](v7, "likeState");
  v12 = -[TVRMSSetLikeStateMessage itemID](v7, "itemID");
  v13 = -[TVRMSSetLikeStateMessage databaseID](v7, "databaseID");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__TVRMSIDSServer__handleSetLikeState___block_invoke;
  v15[3] = &unk_24DCD7750;
  objc_copyWeak(&v17, &buf);
  v14 = v4;
  v16 = v14;
  objc_msgSend(v10, "setLikedState:itemID:databaseID:completionHandler:", v11, v12, v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);

}

void __38__TVRMSIDSServer__handleSetLikeState___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseCode:", a2);
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromRMSResponseCode(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Sending set like state response: %@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sendData:type:timeout:queueOneID:inResponseTo:", v8, 32, 15, 0, *(_QWORD *)(a1 + 32));

}

- (void)_handleAddToWishlist:(id)a3
{
  id v4;
  TVRMSAddToWishlistMessage *v5;
  void *v6;
  TVRMSAddToWishlistMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id buf;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSAddToWishlistMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSAddToWishlistMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSAddToWishlistMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to add to wishlist", (uint8_t *)&buf, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&buf, self);
  v11 = -[TVRMSAddToWishlistMessage itemID](v7, "itemID");
  v12 = -[TVRMSAddToWishlistMessage databaseID](v7, "databaseID");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__TVRMSIDSServer__handleAddToWishlist___block_invoke;
  v14[3] = &unk_24DCD7750;
  objc_copyWeak(&v16, &buf);
  v13 = v4;
  v15 = v13;
  objc_msgSend(v10, "addToWishlist:databaseID:completionHandler:", v11, v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);

}

void __39__TVRMSIDSServer__handleAddToWishlist___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseCode:", a2);
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromRMSResponseCode(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Sending add to wishlist response: %@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sendData:type:timeout:queueOneID:inResponseTo:", v8, 32, 15, 0, *(_QWORD *)(a1 + 32));

}

- (void)_handleTouchMove:(id)a3
{
  id v4;
  TVRMSTouchMessage *v5;
  void *v6;
  TVRMSTouchMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSTouchMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSTouchMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSTouchMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch move", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendTouchMoveWithDirection:repeatCount:", -[TVRMSTouchMessage direction](v7, "direction"), -[TVRMSTouchMessage repeatCount](v7, "repeatCount"));

}

- (void)_handleTouchEnd:(id)a3
{
  id v4;
  TVRMSTouchMessage *v5;
  void *v6;
  TVRMSTouchMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSTouchMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSTouchMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSTouchMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch end", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendTouchEndWithDirection:repeatCount:", -[TVRMSTouchMessage direction](v7, "direction"), -[TVRMSTouchMessage repeatCount](v7, "repeatCount"));

}

- (void)_handleNavigationCommand:(id)a3
{
  id v4;
  TVRMSNavigationCommandMessage *v5;
  void *v6;
  TVRMSNavigationCommandMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSNavigationCommandMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSNavigationCommandMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSNavigationCommandMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for navigation command", (uint8_t *)v11, 8u);
  }

  -[TVRMSSessionManager sessionWithIdentifier:](self->_sessionManager, "sessionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendNavigationCommand:", -[TVRMSNavigationCommandMessage navigationCommand](v7, "navigationCommand"));

}

- (void)_handleBeginPairing:(id)a3
{
  id v4;
  NSObject *v5;
  TVRMSBeginPairingMessage *v6;
  void *v7;
  TVRMSBeginPairingMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TVRMSSessionManager *sessionManager;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  TVRMSIDSServer *v20;
  id v21;
  uint8_t buf[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin pairing session", buf, 2u);
  }

  v6 = [TVRMSBeginPairingMessage alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TVRMSBeginPairingMessage initWithData:](v6, "initWithData:", v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDelegate:", self);
  -[TVRMSBeginPairingMessage passcode](v8, "passcode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPasscode:", v10);

  -[TVRMSBeginPairingMessage appName](v8, "appName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdvertisedAppName:", v11);

  -[TVRMSBeginPairingMessage deviceName](v8, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdvertisedDeviceName:", v12);

  -[TVRMSBeginPairingMessage deviceModel](v8, "deviceModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdvertisedDeviceModel:", v13);

  sessionManager = self->_sessionManager;
  v15 = (int)*(double *)&TVRMSPairingSessionTimeout;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __38__TVRMSIDSServer__handleBeginPairing___block_invoke;
  v18[3] = &unk_24DCD7630;
  v19 = v9;
  v20 = self;
  v21 = v4;
  v16 = v4;
  v17 = v9;
  -[TVRMSSessionManager beginSession:timeout:shouldTakePowerAssertion:completionHandler:](sessionManager, "beginSession:timeout:shouldTakePowerAssertion:completionHandler:", v17, v15, 1, v18);

}

void __38__TVRMSIDSServer__handleBeginPairing___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "beginPairing");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSessionIdentifier:", a2);
  objc_msgSend(v4, "setResponseCode:", 1);
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin pairing response", (uint8_t *)v8, 8u);
  }

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendData:type:timeout:queueOneID:inResponseTo:", v7, 27, 15, 0, *(_QWORD *)(a1 + 48));

}

- (void)_handleEndPairing:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end pairing session", (uint8_t *)v10, 8u);
  }

  -[TVRMSSessionManager endSessionWithIdentifier:completionHandler:](self->_sessionManager, "endSessionWithIdentifier:completionHandler:", v8, &__block_literal_global_80);
}

uint64_t __36__TVRMSIDSServer__handleEndPairing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endPairing");
}

- (void)_cleanupStaleSessions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = (int)*MEMORY[0x24BE4FD70];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setSessionIdentifier:", objc_msgSend(v10, "intValue"));
        _TVRCRMSLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v10, "intValue");
          *(_DWORD *)buf = 67109120;
          v20 = v13;
          _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Session is stale, notifying client", buf, 8u);
        }

        objc_msgSend(v11, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v14, 37, v8, 0, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

}

- (void)_sendData:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 inResponseTo:(id)a7
{
  -[TVRMSIDSServer _sendData:type:priority:timeout:queueOneID:inResponseTo:](self, "_sendData:type:priority:timeout:queueOneID:inResponseTo:", a3, a4, 200, *(_QWORD *)&a5, a6, a7);
}

- (void)_sendData:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 timeout:(int)a6 queueOneID:(id)a7 inResponseTo:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  IDSService *idsService;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[4];

  v9 = *(_QWORD *)&a6;
  v11 = a4;
  v43[3] = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v15 = a8;
  v16 = (objc_class *)MEMORY[0x24BE4FE40];
  v17 = a3;
  v18 = (void *)objc_msgSend([v16 alloc], "initWithProtobufData:type:isResponse:", v17, v11, v15 != 0);

  v19 = objc_alloc(MEMORY[0x24BDBCED8]);
  v42[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BE4FA90];
  v43[0] = v20;
  v43[1] = MEMORY[0x24BDBD1C8];
  v22 = *MEMORY[0x24BE4FAD8];
  v42[1] = v21;
  v42[2] = v22;
  v43[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v19, "initWithDictionary:", v23);

  if (v15)
  {
    objc_msgSend(v15, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outgoingResponseIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE4FAF0]);

  }
  if (v14)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE4FB18]);
  if (a5 == 300)
  {
    v27 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAA8]);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BE4FA78]);
  }
  idsService = self->_idsService;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FD60]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = 0;
  -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](idsService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v18, v29, a5, v24, &v37, &v36);
  v30 = v37;
  v31 = v36;

  _TVRCRMSLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v33)
    {
      NSStringFromRMSMessageType(v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v34;
      v40 = 2112;
      v41 = v31;
      v35 = "Error sending message of type %@: %@";
LABEL_12:
      _os_log_impl(&dword_21A51B000, v32, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);

    }
  }
  else if (v33)
  {
    NSStringFromRMSMessageType(v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v34;
    v40 = 2112;
    v41 = v30;
    v35 = "Sent message of type: %@, IDS identifier: %@";
    goto LABEL_12;
  }

}

- (void)discoverySessionDidUpdateAvailableServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "availableServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVRMSService protobufsFromServices:](TVRMSService, "protobufsFromServices:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", v4);

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "setServices:", v9);

  objc_msgSend(v8, "setSessionIdentifier:", v7);
  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending available services: %@", (uint8_t *)v12, 0x12u);
  }

  objc_msgSend(v8, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v11, 4, (int)*MEMORY[0x24BE4FD70], CFSTR("AvailableServices"), 0);

}

- (void)discoverySessionNetworkAvailabilityDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", v4);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setSessionIdentifier:", v5);
  objc_msgSend(v6, "setWifiAvailable:", objc_msgSend(v4, "isNetworkAvailable"));
  _TVRCRMSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "isNetworkAvailable");
    v9 = CFSTR("unavailable");
    if (v8)
      v9 = CFSTR("available");
    v11[0] = 67109378;
    v11[1] = v5;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending wifi availability message: %@", (uint8_t *)v11, 0x12u);
  }

  objc_msgSend(v6, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v10, 38, (int)*MEMORY[0x24BE4FD70], CFSTR("NetworkAvailability"), 0);

}

- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  TVRMSSessionManager *sessionManager;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sessionManager = self->_sessionManager;
  v7 = a4;
  v8 = -[TVRMSSessionManager identifierForSession:](sessionManager, "identifierForSession:", a3);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "protobuf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setNowPlayingInfo:", v10);
  objc_msgSend(v9, "setSessionIdentifier:", v8);
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending now playing info update", (uint8_t *)v13, 8u);
  }

  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v12, 12, (int)*MEMORY[0x24BE4FD70], CFSTR("NowPlayingInfo"), 0);

}

- (void)controlSession:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5
{
  TVRMSSessionManager *sessionManager;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sessionManager = self->_sessionManager;
  v8 = a5;
  v9 = -[TVRMSSessionManager identifierForSession:](sessionManager, "identifierForSession:", a3);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSessionIdentifier:", v9);
  objc_msgSend(v10, "setArtworkIdentifier:", v8);

  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v9;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending artwork updated notification", (uint8_t *)v13, 8u);
  }

  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v12, 13, (int)*MEMORY[0x24BE4FD70], 0, 0);

}

- (void)controlSession:(id)a3 didUpdateAudioRoutes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  +[TVRMSAudioRoute protobufsFromAudioRoutes:](TVRMSAudioRoute, "protobufsFromAudioRoutes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", v7);
  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setAudioRoutes:", v11);

  objc_msgSend(v8, "setSessionIdentifier:", v10);
  _TVRCRMSLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v10;
    _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending audio routes update", (uint8_t *)v14, 8u);
  }

  objc_msgSend(v8, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v13, 14, (int)*MEMORY[0x24BE4FD70], CFSTR("AudioRoutes"), 0);

}

- (void)controlSession:(id)a3 didUpdateVolume:(float)a4
{
  uint64_t v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", a3);
  v7 = (void *)objc_opt_new();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setVolume:", v8);
  objc_msgSend(v7, "setSessionIdentifier:", v6);
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending volume update", (uint8_t *)v11, 8u);
  }

  objc_msgSend(v7, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v10, 15, 10, CFSTR("Volume"), 0);

}

- (void)controlSessionDidEnd:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", v4);

  if ((_DWORD)v6)
  {
    objc_msgSend(v5, "setSessionIdentifier:", v6);
    _TVRCRMSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending control session ended", (uint8_t *)v9, 8u);
    }

    objc_msgSend(v5, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v8, 37, (int)*MEMORY[0x24BE4FD70], 0, 0);

    -[TVRMSSessionManager endSessionWithIdentifier:completionHandler:](self->_sessionManager, "endSessionWithIdentifier:completionHandler:", v6, 0);
  }

}

- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5
{
  id v8;
  TVRMSSessionManager *sessionManager;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  sessionManager = self->_sessionManager;
  v10 = a5;
  v11 = -[TVRMSSessionManager identifierForSession:](sessionManager, "identifierForSession:", a3);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setServiceNetworkName:", v8);
  objc_msgSend(v12, "setPairingGUID:", v10);

  objc_msgSend(v12, "setSessionIdentifier:", v11);
  _TVRCRMSLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v11;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing success with service network name: %@", (uint8_t *)v15, 0x12u);
  }

  objc_msgSend(v12, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v14, 29, (int)*MEMORY[0x24BE4FD70], 0, 0);

}

- (void)pairingSessionDidFail:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = -[TVRMSSessionManager identifierForSession:](self->_sessionManager, "identifierForSession:", a3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionIdentifier:", v4);
  -[TVRMSSessionManager endSessionWithIdentifier:completionHandler:](self->_sessionManager, "endSessionWithIdentifier:completionHandler:", v4, 0);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing session failed message", (uint8_t *)v8, 8u);
  }

  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v7, 30, (int)*MEMORY[0x24BE4FD70], 0, 0);

}

- (void)sessionManager:(id)a3 sessionDidTimeout:(int)a4
{
  uint64_t v4;
  void *v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending session ended due to timeout", (uint8_t *)v9, 8u);
  }

  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSServer _sendData:type:timeout:queueOneID:inResponseTo:](self, "_sendData:type:timeout:queueOneID:inResponseTo:", v8, 37, (int)*MEMORY[0x24BE4FD70], 0, 0);

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v7, "type");
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Unhandled message type: %d", (uint8_t *)v9, 8u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_touchRemoteSessions, 0);
  objc_storeStrong((id *)&self->_pairingSessions, 0);
  objc_storeStrong((id *)&self->_nowPlayingSessions, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

@end
