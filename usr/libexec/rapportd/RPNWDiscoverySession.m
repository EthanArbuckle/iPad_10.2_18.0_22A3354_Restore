@implementation RPNWDiscoverySession

- (RPNWDiscoverySession)init
{
  RPNWDiscoverySession *v2;
  uint64_t v3;
  NSUUID *discoverySessionID;
  RPNWDiscoverySession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPNWDiscoverySession;
  v2 = -[RPNWDiscoverySession init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    discoverySessionID = v2->_discoverySessionID;
    v2->_discoverySessionID = (NSUUID *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWDiscoverySession;
  -[RPNWDiscoverySession dealloc](&v2, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("  RPNWDiscoverySession[%p] id=%@\n"), self, self->_discoverySessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWEndpoint listEndpointsForDiscoverySession:](RPNWEndpoint, "listEndpointsForDiscoverySession:", self->_discoverySessionID));
  objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (void)updateClientBrowseResult
{
  +[RPNWEndpoint updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:](RPNWEndpoint, "updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:", self->_browseClient, self->_browseResponse, self->_agentUUID, self->_pid, self->_applicationService, self->_discoverySessionID);
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:](RPNWEndpoint, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:", a3, a4, self->_applicationService, self->_discoverySessionID, 1))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWEndpoint updateEndpointMapping:discoverySessionID:](RPNWEndpoint, "updateEndpointMapping:discoverySessionID:", a3, self->_discoverySessionID))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)removeDevice:(id)a3
{
  if (+[RPNWEndpoint removeEndpointMapping:discoverySessionID:immediate:](RPNWEndpoint, "removeEndpointMapping:discoverySessionID:immediate:", a3, self->_discoverySessionID, 0))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)removeAllDevices
{
  void *v3;
  RPNWDiscoverySession *v4;
  id v5;
  NSUUID *discoverySessionID;

  if (self->_discoverySessionID)
  {
    if (dword_100131550 <= 30
      && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      v4 = self;
      v5 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v4);

      LogPrintF(&dword_100131550, "-[RPNWDiscoverySession removeAllDevices]", 30, "%@ DISCOVER: RPNWDiscoverySession[%@]: Ending discovery session", v3, v5);
    }
    +[RPNWEndpoint removeDiscoverySessionFromAllEndpoints:](RPNWEndpoint, "removeDiscoverySessionFromAllEndpoints:", self->_discoverySessionID);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0;

  }
}

- (void)startDiscovery:(unsigned int)a3 controlFlags:(unint64_t)a4 deviceFilter:(id)a5
{
  uint64_t v6;
  id v8;
  RPNWPeer *v9;
  RPNWPeer *discoveryClient;
  void *v11;
  RPNWDiscoverySession *v12;
  id v13;
  RPNWPeer *v14;
  id v15;
  RPNWPeer *v16;
  NSString *applicationService;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = objc_alloc_init(RPNWPeer);
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = v9;

  if (dword_100131550 <= 30 && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v12 = self;
    v13 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v13, "appendFormat:", CFSTR("%p"), v12);

    v14 = self->_discoveryClient;
    v15 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v15, "appendFormat:", CFSTR("%p"), v14);

    LogPrintF(&dword_100131550, "-[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]", 30, "%@ DISCOVER: Starting RPNWDiscoverySession[%@], _discoveryClient=%@ with controlFlags %ll{flags}", v11, v13, v15, a4, &unk_10010AA7D);
  }
  v16 = self->_discoveryClient;
  applicationService = self->_applicationService;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100076634;
  v21[3] = &unk_100112DB8;
  v21[4] = self;
  v19[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100076740;
  v20[3] = &unk_100112DB8;
  v20[4] = self;
  v18[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100076830;
  v19[3] = &unk_100112DB8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100076920;
  v18[3] = &unk_1001110F8;
  -[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:](v16, "startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:", v6, applicationService, a4, v8, v21, v20, v19, v18);

}

- (void)stopDiscovery
{
  void *v3;
  RPNWDiscoverySession *v4;
  id v5;
  RPNWPeer *discoveryClient;

  if (self->_discoveryClient)
  {
    if (dword_100131550 <= 30
      && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      v4 = self;
      v5 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v4);

      LogPrintF(&dword_100131550, "-[RPNWDiscoverySession stopDiscovery]", 30, "%@ DISCOVER: Stopping RPNWDiscoverySession[%@]", v3, v5);
    }
    -[RPNWPeer stopDiscovery](self->_discoveryClient, "stopDiscovery");
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0;

  }
  -[RPNWDiscoverySession removeAllDevices](self, "removeAllDevices");
}

- (RPNWPeer)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryClient, a3);
}

- (NSUUID)agentUUID
{
  return self->_agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_agentUUID, a3);
}

- (NSUUID)discoverySessionID
{
  return self->_discoverySessionID;
}

- (void)setDiscoverySessionID:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySessionID, a3);
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_applicationService, a3);
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
  objc_storeStrong((id *)&self->_browseClient, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseClient, 0);
  objc_storeStrong(&self->_browseResponse, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_discoverySessionID, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

@end
