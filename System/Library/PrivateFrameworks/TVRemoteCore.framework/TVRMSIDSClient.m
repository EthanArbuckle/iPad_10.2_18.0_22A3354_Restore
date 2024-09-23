@implementation TVRMSIDSClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global);
  return (id)sharedClient_sharedConnectionManager;
}

void __30__TVRMSIDSClient_sharedClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedClient_sharedConnectionManager;
  sharedClient_sharedConnectionManager = v0;

}

- (TVRMSIDSClient)init
{
  TVRMSIDSClient *v2;
  uint64_t v3;
  NSMutableDictionary *messageRecords;
  uint64_t v5;
  IDSService *idsService;
  dispatch_queue_t v7;
  OS_dispatch_queue *idsDispatchQueue;
  uint64_t v9;
  OS_dispatch_queue *idsOutgoingQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVRMSIDSClient;
  v2 = -[TVRMSIDSClient init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    messageRecords = v2->_messageRecords;
    v2->_messageRecords = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.remotemediaservices"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v5;

    v7 = dispatch_queue_create("com.apple.remotemediaservices.ids", 0);
    idsDispatchQueue = v2->_idsDispatchQueue;
    v2->_idsDispatchQueue = (OS_dispatch_queue *)v7;

    dispatch_get_global_queue(33, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    idsOutgoingQueue = v2->_idsOutgoingQueue;
    v2->_idsOutgoingQueue = (OS_dispatch_queue *)v9;

    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleAvailableServicesDidUpdate_, 4);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleNowPlayingInfoDidUpdate_, 12);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleNowPlayingArtworkAvailable_, 13);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleAudioRoutesDidUpdate_, 14);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleVolumeDidUpdate_, 15);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handlePairingDidSucceed_, 29);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handlePairingDidFail_, 30);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleSessionDidEnd_, 37);
    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_idsService, "setProtobufAction:forIncomingRequestsOfType:", sel__handleWifiAvailabilityDidChange_, 38);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleBeginDiscoverySessionResponse_, 2);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleConnectToServiceResponse_, 6);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleNowPlayingArtworkDataResponse_, 25);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleBeginPairingSessionResponse_, 27);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleHeartbeatResponse_, 17);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handlePickAudioRouteResponse_, 19);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleSetLikedStateResponse_, 32);
    -[IDSService setProtobufAction:forIncomingResponsesOfType:](v2->_idsService, "setProtobufAction:forIncomingResponsesOfType:", sel__handleBeginObservingNowPlayingResponse_, 10);
    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_idsDispatchQueue);
    v2->_companionAvailable = 1;
    -[TVRMSIDSClient _updateCompanionAvailability](v2, "_updateCompanionAvailability");
  }
  return v2;
}

- (void)beginDiscoverySessionWithDiscoveryTypes:(int)a3 pairedNetworkNames:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setDiscoveryTypes:", v6);
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v12, "setPairedNetworkNames:", v10);
  objc_msgSend(v12, "setHasPairedNetworkNames:", 1);
  v11 = (void *)MEMORY[0x220746068](v8);

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v12, 1, 10, 0, 200, v11);
}

- (void)updatePairedNetworkNames:(id)a3 sessionIdentifier:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setSessionIdentifier:", v4);
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "setPairedNetworkNames:", v7);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v8, 39, 10, CFSTR("UpdatePairedNetworkNames"), 200, 0);

}

- (void)_handleBeginDiscoverySessionResponse:(id)a3
{
  id v4;
  TVRMSSessionMessage *v5;
  void *v6;
  TVRMSSessionMessage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSSessionMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSSessionMessage initWithData:](v5, "initWithData:", v6);

  objc_msgSend(v4, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "incomingResponseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TVRMSSessionMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v10;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin discovery response", (uint8_t *)v12, 8u);
  }

  -[TVRMSIDSClient _invokeBeginDiscoveryResponseBlock:success:session:](self, "_invokeBeginDiscoveryResponseBlock:success:session:", v9, 1, v10);
}

- (void)_invokeBeginDiscoveryResponseBlock:(id)a3 success:(BOOL)a4 session:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v9[2](v9, v6, v5);
  }
  else if (v6)
  {
    -[TVRMSIDSClient endDiscoverySession:](self, "endDiscoverySession:", v5);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v10);

}

- (void)_handleAvailableServicesDidUpdate:(id)a3
{
  id v4;
  TVRMSAvailableServicesDidUpdateMessage *v5;
  void *v6;
  TVRMSAvailableServicesDidUpdateMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSAvailableServicesDidUpdateMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSAvailableServicesDidUpdateMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSAvailableServicesDidUpdateMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received discovery available services update", (uint8_t *)v16, 8u);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));

  -[TVRMSAvailableServicesDidUpdateMessage services](v7, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TVRMSAvailableServicesDidUpdateMessage services](v7, "services");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVRMSService servicesFromProtobufs:](TVRMSService, "servicesFromProtobufs:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("RMSIDSClientAvailableServicesNotificationKey"));
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientAvailableServicesDidUpdateNotification"), self, v10);

}

- (void)endDiscoverySession:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionIdentifier:", v3);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end discovery message", (uint8_t *)v7, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v5, 3, (int)*MEMORY[0x24BE4FD70], 0, 200, 0);
}

- (void)sendHeartbeatWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending heartbeat message", (uint8_t *)v10, 8u);
  }

  v9 = (void *)MEMORY[0x220746068](v6);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 16, 20, 0, 200, v9);

}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = (id)objc_opt_new();
  objc_msgSend(v10, "protobuf");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setService:", v11);
  objc_msgSend(v13, "setPairingGUID:", v9);

  v12 = (void *)MEMORY[0x220746068](v8);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v13, 5, 15, 0, 300, v12);

}

- (void)_handleConnectToServiceResponse:(id)a3
{
  id v4;
  TVRMSConnectToServiceResponseMessage *v5;
  void *v6;
  TVRMSConnectToServiceResponseMessage *v7;
  TVRMSControlInterface *v8;
  void *v9;
  TVRMSControlInterface *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSConnectToServiceResponseMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSConnectToServiceResponseMessage initWithData:](v5, "initWithData:", v6);

  v8 = [TVRMSControlInterface alloc];
  -[TVRMSConnectToServiceResponseMessage controlInterface](v7, "controlInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TVRMSControlInterface initWithProtobuf:](v8, "initWithProtobuf:", v9);

  v11 = -[TVRMSConnectToServiceResponseMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received connection response", (uint8_t *)v15, 8u);
  }

  objc_msgSend(v4, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "incomingResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRMSIDSClient _invokeConnectToServiceResponseBlock:responseCode:controlInterface:session:](self, "_invokeConnectToServiceResponseBlock:responseCode:controlInterface:session:", v14, -[TVRMSConnectToServiceResponseMessage responseCode](v7, "responseCode"), v10, v11);
}

- (void)logoutWithSessionIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionIdentifier:", v3);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending logout message", (uint8_t *)v7, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v5, 7, (int)*MEMORY[0x24BE4FD70], 0, 200, 0);
}

- (void)_invokeConnectToServiceResponseBlock:(id)a3 responseCode:(int64_t)a4 controlInterface:(id)a5 session:(int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v13;

  v6 = *(_QWORD *)&a6;
  v13 = a3;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "responseBlock");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
    ((void (**)(_QWORD, int64_t, id, uint64_t))v12)[2](v12, a4, v10, v6);
  -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v13);

}

- (void)sendPlaybackCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPlaybackCommand:", a3);
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending playback command", (uint8_t *)v9, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 8, 5, 0, 300, 0);
}

- (void)setVolume:(float)a3 sessionIdentifier:(int)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = *(_QWORD *)&a4;
  v11 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setVolume:", v8);
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set volume message", (uint8_t *)v10, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 20, 5, CFSTR("SetVolume"), 300, 0);
}

- (void)pickAudioRouteWithMacAddress:(unint64_t)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v5 = *(_QWORD *)&a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setMacAddress:", a3);
  objc_msgSend(v9, "setSessionIdentifier:", v5);
  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick audio route message", (uint8_t *)v12, 8u);
  }

  v11 = (void *)MEMORY[0x220746068](v8);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v9, 18, 30, 0, 200, v11);

}

- (void)_handlePickAudioRouteResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received pick audio route response", v6, 2u);
  }

  -[TVRMSIDSClient _handleResponseCodeMessage:](self, "_handleResponseCodeMessage:", v4);
}

- (void)seekToPlaybackTime:(int)a3 sessionIdentifier:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPlaybackTime:", v5);
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending seek to playback time message", (uint8_t *)v9, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 35, 5, CFSTR("SeekToPlaybackTime"), 300, 0);
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 sessionIdentifier:(int)a6 completionHandler:(id)a7
{
  uint64_t v7;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v7 = *(_QWORD *)&a6;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLikeState:", a3);
  objc_msgSend(v13, "setItemID:", a4);
  objc_msgSend(v13, "setDatabaseID:", a5);
  objc_msgSend(v13, "setSessionIdentifier:", v7);
  _TVRCRMSLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v7;
    _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set like state message", (uint8_t *)v16, 8u);
  }

  v15 = (void *)MEMORY[0x220746068](v12);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v13, 31, 10, 0, 200, v15);

}

- (void)_handleSetLikedStateResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received set like state response", v6, 2u);
  }

  -[TVRMSIDSClient _handleResponseCodeMessage:](self, "_handleResponseCodeMessage:", v4);
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 sessionIdentifier:(int)a5 completionHandler:(id)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v6 = *(_QWORD *)&a5;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setItemID:", a3);
  objc_msgSend(v11, "setDatabaseID:", a4);
  objc_msgSend(v11, "setSessionIdentifier:", v6);
  _TVRCRMSLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v6;
    _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending add to wishlist message", (uint8_t *)v14, 8u);
  }

  v13 = (void *)MEMORY[0x220746068](v10);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v11, 33, 10, 0, 200, v13);

}

- (void)_handleAddToWishlistResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received add to wishlist response", v6, 2u);
  }

  -[TVRMSIDSClient _handleResponseCodeMessage:](self, "_handleResponseCodeMessage:", v4);
}

- (void)beginObservingNowPlayingWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin observing now playing message", (uint8_t *)v10, 8u);
  }

  v9 = (void *)MEMORY[0x220746068](v6);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 9, 10, 0, 200, v9);

}

- (void)endObservingNowPlayingWithSessionIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionIdentifier:", v3);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end observing now playing message", (uint8_t *)v7, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v5, 11, (int)*MEMORY[0x24BE4FD70], 0, 200, 0);
}

- (void)_handleAudioRoutesDidUpdate:(id)a3
{
  id v4;
  TVRMSAudioRoutesDidUpdateMessage *v5;
  void *v6;
  TVRMSAudioRoutesDidUpdateMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSAudioRoutesDidUpdateMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSAudioRoutesDidUpdateMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSAudioRoutesDidUpdateMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing audio routes update", buf, 8u);
  }

  -[TVRMSAudioRoutesDidUpdateMessage audioRoutes](v7, "audioRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVRMSAudioRoute audioRoutesFromProtobufs:](TVRMSAudioRoute, "audioRoutesFromProtobufs:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("RMSIDSClientNowPlayingAudioRoutesNotificationKey");
  v16[0] = v12;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientNowPlayingAudioRoutesDidUpdateNotification"), self, v13);

}

- (void)_handleVolumeDidUpdate:(id)a3
{
  id v4;
  TVRMSVolumeDidUpdateMessage *v5;
  void *v6;
  TVRMSVolumeDidUpdateMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSVolumeDidUpdateMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSVolumeDidUpdateMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSVolumeDidUpdateMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing volume update", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("RMSIDSClientNowPlayingVolumeNotificationKey");
  v16[0] = v10;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[TVRMSVolumeDidUpdateMessage volume](v7, "volume");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientNowPlayingVolumeDidUpdateNotification"), self, v13);

}

- (void)_handleNowPlayingInfoDidUpdate:(id)a3
{
  id v4;
  TVRMSNowPlayingInfoDidUpdateMessage *v5;
  void *v6;
  TVRMSNowPlayingInfoDidUpdateMessage *v7;
  TVRMSNowPlayingInfo *v8;
  void *v9;
  TVRMSNowPlayingInfo *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSNowPlayingInfoDidUpdateMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSNowPlayingInfoDidUpdateMessage initWithData:](v5, "initWithData:", v6);
  v8 = [TVRMSNowPlayingInfo alloc];
  -[TVRMSNowPlayingInfoDidUpdateMessage nowPlayingInfo](v7, "nowPlayingInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TVRMSNowPlayingInfo initWithProtobuf:](v8, "initWithProtobuf:", v9);

  v11 = -[TVRMSNowPlayingInfoDidUpdateMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v11;
    _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing info update", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("RMSIDSClientNowPlayingInfoNotificationKey");
  v17[0] = v13;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientNowPlayingInfoDidUpdateNotification"), self, v14);

}

- (void)_handleNowPlayingArtworkAvailable:(id)a3
{
  id v4;
  TVRMSNowPlayingArtworkAvailableMessage *v5;
  void *v6;
  TVRMSNowPlayingArtworkAvailableMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSNowPlayingArtworkAvailableMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSNowPlayingArtworkAvailableMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSNowPlayingArtworkAvailableMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing artwork update", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("RMSIDSClientNowPlayingArtworkIdentifierKey");
  v15[0] = v10;
  -[TVRMSNowPlayingArtworkAvailableMessage artworkIdentifier](v7, "artworkIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientNowPlayingArtworkDidBecomeAvailableNotification"), self, v12);

}

- (void)requestArtworkDataForNowPlayingInfo:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 compressionQuality:(float)a6 completionHandler:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v12 = a7;
  v13 = a3;
  v17 = (id)objc_opt_new();
  objc_msgSend(v13, "artworkIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setArtworkIdentifier:", v14);
  objc_msgSend(v17, "setWidth:", v9);
  objc_msgSend(v17, "setHeight:", v8);
  *(float *)&v15 = a6;
  objc_msgSend(v17, "setCompressionQuality:", v15);
  v16 = (void *)MEMORY[0x220746068](v12);

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v17, 24, 30, CFSTR("RequestArtworkData"), 200, v16);
}

- (void)_handleNowPlayingArtworkDataResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incomingResponseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received artwork data, length=%td", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSIDSClient _invokeArtworkDataResponseBlock:artworkData:](self, "_invokeArtworkDataResponseBlock:artworkData:", v6, v9);

}

- (void)_invokeArtworkDataResponseBlock:(id)a3 artworkData:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseBlock");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
    ((void (**)(_QWORD, id))v8)[2](v8, v6);
  -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v9);

}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDirection:", a3);
  objc_msgSend(v9, "setRepeatCount:", v6);
  objc_msgSend(v9, "setSessionIdentifier:", v5);
  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch move", (uint8_t *)v11, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v9, 21, 5, 0, 300, 0);
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDirection:", a3);
  objc_msgSend(v9, "setRepeatCount:", v6);
  objc_msgSend(v9, "setSessionIdentifier:", v5);
  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch end", (uint8_t *)v11, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v9, 22, 5, 0, 300, 0);
}

- (void)sendNavigationCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setNavigationCommand:", a3);
  objc_msgSend(v7, "setSessionIdentifier:", v4);
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending navigation command message", (uint8_t *)v9, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v7, 23, 5, 0, 300, 0);
}

- (void)beginPairingSessionWithPasscode:(id)a3 appName:(id)a4 deviceName:(id)a5 deviceModel:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setPasscode:", v12);
  objc_msgSend(v17, "setAppName:", v16);

  objc_msgSend(v17, "setDeviceName:", v15);
  objc_msgSend(v17, "setDeviceModel:", v14);

  _TVRCRMSLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Sending begin pairing message with passcode [%@]", (uint8_t *)&v20, 0xCu);
  }

  v19 = (void *)MEMORY[0x220746068](v13);
  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v17, 26, 20, 0, 200, v19);

}

- (void)endPairingSession:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionIdentifier:", v3);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end pairing message", (uint8_t *)v7, 8u);
  }

  -[TVRMSIDSClient _sendMessage:type:timeout:queueOneID:priority:responseBlock:](self, "_sendMessage:type:timeout:queueOneID:priority:responseBlock:", v5, 28, (int)*MEMORY[0x24BE4FD70], 0, 200, 0);
}

- (void)_handleBeginPairingSessionResponse:(id)a3
{
  id v4;
  TVRMSBeginPairingResponseMessage *v5;
  void *v6;
  TVRMSBeginPairingResponseMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSBeginPairingResponseMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRMSBeginPairingResponseMessage initWithData:](v5, "initWithData:", v6);

  v8 = -[TVRMSBeginPairingResponseMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin pairing response", (uint8_t *)v12, 8u);
  }

  objc_msgSend(v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incomingResponseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRMSIDSClient _invokeBeginPairingResponseBlock:responseCode:session:](self, "_invokeBeginPairingResponseBlock:responseCode:session:", v11, -[TVRMSBeginPairingResponseMessage responseCode](v7, "responseCode"), v8);
}

- (void)_invokeBeginPairingResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5
{
  uint64_t v5;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v9[2](v9, a4, v5);
  }
  else if (a4 == 1)
  {
    -[TVRMSIDSClient endPairingSession:](self, "endPairingSession:", v5);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v10);

}

- (void)_handlePairingDidSucceed:(id)a3
{
  id v4;
  TVRMSPairingSessionDidPairMessage *v5;
  void *v6;
  TVRMSPairingSessionDidPairMessage *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSPairingSessionDidPairMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSPairingSessionDidPairMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSPairingSessionDidPairMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received successful pairing", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("RMSIDSClientServiceNetworkNameNotificationKey");
  -[TVRMSPairingSessionDidPairMessage serviceNetworkName](v7, "serviceNetworkName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = CFSTR("RMSIDSClientPairingGUIDNotificationKey");
  -[TVRMSPairingSessionDidPairMessage pairingGUID](v7, "pairingGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientDidPairWithServiceNotification"), self, v13);

}

- (void)_handlePairingDidFail:(id)a3
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
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 67109120;
    v16 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received failure pairing", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientPairingDidFailNotification"), self, v11);

}

- (void)_handleSessionDidEnd:(id)a3
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
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 67109120;
    v16 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received session did end", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientSessionDidEndNotification"), self, v11);

}

- (void)_handleWifiAvailabilityDidChange:(id)a3
{
  id v4;
  TVRMSWifiAvailabilityDidChangeMessage *v5;
  void *v6;
  TVRMSWifiAvailabilityDidChangeMessage *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TVRMSWifiAvailabilityDidChangeMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TVRMSWifiAvailabilityDidChangeMessage initWithData:](v5, "initWithData:", v6);
  v8 = -[TVRMSWifiAvailabilityDidChangeMessage sessionIdentifier](v7, "sessionIdentifier");
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[TVRMSWifiAvailabilityDidChangeMessage wifiAvailable](v7, "wifiAvailable");
    v11 = CFSTR("unavailable");
    if (v10)
      v11 = CFSTR("available");
    *(_DWORD *)buf = 67109378;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received wifi availability message: %@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8, CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("RMSIDSClientWifiAvailabilityNotificationKey");
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TVRMSWifiAvailabilityDidChangeMessage wifiAvailable](v7, "wifiAvailable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("RMSIDSClientWifiAvailabilityDidChangeNotification"), self, v14);

}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *idsOutgoingQueue;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  TVRMSIDSClient *v25;
  int64_t v26;
  int v27;
  unsigned __int16 v28;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  idsOutgoingQueue = self->_idsOutgoingQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke;
  v21[3] = &unk_24DCD75C0;
  v28 = a4;
  v27 = a5;
  v22 = v14;
  v23 = v16;
  v25 = self;
  v26 = a7;
  v24 = v15;
  v18 = v15;
  v19 = v16;
  v20 = v14;
  dispatch_async(idsOutgoingQueue, v21);

}

void __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE4FE40]);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProtobufData:type:isResponse:", v3, *(unsigned __int16 *)(a1 + 76), 0);

  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  v35[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE4FA90];
  v36[0] = v6;
  v36[1] = MEMORY[0x24BDBD1C8];
  v8 = *MEMORY[0x24BE4FAD8];
  v35[1] = v7;
  v35[2] = v8;
  v36[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithDictionary:", v9);

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAA0]);
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE4FB18]);
  if (*(_QWORD *)(a1 + 64) == 300)
  {
    v12 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAA8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE4FA78]);
  }
  v13 = *(void **)(*(_QWORD *)(a1 + 56) + 16);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FD60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 64);
  v29 = 0;
  v30 = 0;
  v16 = objc_msgSend(v13, "sendProtobuf:toDestinations:priority:options:identifier:error:", v4, v14, v15, v10, &v30, &v29);
  v17 = v30;
  v18 = v29;

  _TVRCRMSLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v16 || v18)
  {
    if (v20)
    {
      NSStringFromRMSMessageType(*(unsigned __int16 *)(a1 + 76));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v18;
      _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Error sending message of type %@: %@", buf, 0x16u);

    }
    goto LABEL_15;
  }
  if (v20)
  {
    NSStringFromRMSMessageType(*(unsigned __int16 *)(a1 + 76));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v21;
    v33 = 2112;
    v34 = v17;
    _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Sent message of type: %@, IDS identifier: %@", buf, 0x16u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v19 = objc_opt_new();
    -[NSObject setMessageType:](v19, "setMessageType:", *(unsigned __int16 *)(a1 + 76));
    v22 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    -[NSObject setResponseBlock:](v19, "setResponseBlock:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "setObject:forKeyedSubscript:", v19, v17);
    objc_initWeak((id *)buf, *(id *)(a1 + 56));
    v23 = dispatch_time(0, 1000000000 * *(int *)(a1 + 72));
    v24 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 24);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke_149;
    v26[3] = &unk_24DCD7230;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v17;
    dispatch_after(v23, v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
LABEL_15:

  }
}

void __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke_149(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleTimeoutForMessageWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_handleResponseCodeMessage:(id)a3
{
  id v4;
  TVRMSResponseCodeMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  TVRMSResponseCodeMessage *v9;

  v4 = a3;
  v5 = [TVRMSResponseCodeMessage alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TVRMSResponseCodeMessage initWithData:](v5, "initWithData:", v6);

  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "incomingResponseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRMSIDSClient _invokeResponseCodeResponseBlock:responseCode:](self, "_invokeResponseCodeResponseBlock:responseCode:", v8, -[TVRMSResponseCodeMessage responseCode](v9, "responseCode"));
}

- (void)_invokeResponseCodeResponseBlock:(id)a3 responseCode:(int64_t)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v7)
    v7[2](v7, a4);
  -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v8);

}

- (void)_updateCompanionAvailability
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TVRMSIDSClient__updateCompanionAvailability__block_invoke;
  block[3] = &unk_24DCD70C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__TVRMSIDSClient__updateCompanionAvailability__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isCompanionAvailable");
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40) != v2)
  {
    v3 = v2;
    _TVRCRMSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("unavailable");
      if (v3)
        v5 = CFSTR("avalable");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Companion availability changed: %@", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = v3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("RMSIDSClientCompanionAvailabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_isCompanionAvailable
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[IDSService devices](self->_idsService, "devices");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isDefaultPairedDevice", (_QWORD)v8)
          && (objc_msgSend(v6, "isConnected") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
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

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a7;
  if (!a6)
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "IDS message %@ failed with error: %@", (uint8_t *)&v13, 0x16u);
    }

    -[TVRMSIDSClient _handleTimeoutForMessageWithIdentifier:](self, "_handleTimeoutForMessageWithIdentifier:", v10);
  }

}

- (void)_handleTimeoutForMessageWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _TVRCRMSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromRMSMessageType(objc_msgSend(v5, "messageType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Handling timeout for message type: %@", (uint8_t *)&v11, 0xCu);

    }
    v8 = objc_msgSend(v5, "messageType");
    if (v8 > 15)
    {
      switch(v8)
      {
        case 25:
          -[TVRMSIDSClient _invokeArtworkDataResponseBlock:artworkData:](self, "_invokeArtworkDataResponseBlock:artworkData:", v4, 0);
          break;
        case 26:
          -[TVRMSIDSClient _invokeBeginPairingResponseBlock:responseCode:session:](self, "_invokeBeginPairingResponseBlock:responseCode:session:", v4, -3, 0);
          break;
        case 27:
        case 28:
        case 29:
        case 30:
        case 32:
          goto LABEL_16;
        case 31:
        case 33:
          goto LABEL_15;
        default:
          if (v8 == 16 || v8 == 18)
            goto LABEL_15;
          goto LABEL_16;
      }
    }
    else
    {
      switch(v8)
      {
        case 1:
          -[TVRMSIDSClient _invokeBeginDiscoveryResponseBlock:success:session:](self, "_invokeBeginDiscoveryResponseBlock:success:session:", v4, 0, 0);
          break;
        case 5:
          -[TVRMSIDSClient _invokeConnectToServiceResponseBlock:responseCode:controlInterface:session:](self, "_invokeConnectToServiceResponseBlock:responseCode:controlInterface:session:", v4, -3, 0, 0);
          break;
        case 9:
LABEL_15:
          -[TVRMSIDSClient _invokeResponseCodeResponseBlock:responseCode:](self, "_invokeResponseCodeResponseBlock:responseCode:", v4, -3);
          break;
        default:
LABEL_16:
          _TVRCRMSLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromRMSMessageType(objc_msgSend(v5, "messageType"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = 138412290;
            v12 = v10;
            _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "No known timeout handler for message type %@", (uint8_t *)&v11, 0xCu);

          }
          -[NSMutableDictionary removeObjectForKey:](self->_messageRecords, "removeObjectForKey:", v4);
          break;
      }
    }
  }

}

- (BOOL)isCompanionAvailable
{
  return self->_companionAvailable;
}

- (void)setCompanionAvailable:(BOOL)a3
{
  self->_companionAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsOutgoingQueue, 0);
  objc_storeStrong((id *)&self->_idsDispatchQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_messageRecords, 0);
}

@end
