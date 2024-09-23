@implementation RPNWNearbyInvitationDiscoverySession

- (RPNWNearbyInvitationDiscoverySession)init
{
  RPNWNearbyInvitationDiscoverySession *v2;
  uint64_t v3;
  NSUUID *discoverySessionID;
  RPNWNearbyInvitationDiscoverySession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPNWNearbyInvitationDiscoverySession;
  v2 = -[RPNWNearbyInvitationDiscoverySession init](&v7, "init");
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
  v2.super_class = (Class)RPNWNearbyInvitationDiscoverySession;
  -[RPNWNearbyInvitationDiscoverySession dealloc](&v2, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("  RPNWNearbyInvitationDiscoverySession[%p] id=%@\n"), self, self->_discoverySessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNearbyInvitationEndpoint listEndpointsForDiscoverySession:](RPNWNearbyInvitationEndpoint, "listEndpointsForDiscoverySession:", self->_discoverySessionID));
  objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (void)updateClientBrowseResult
{
  +[RPNWNearbyInvitationEndpoint updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:](RPNWNearbyInvitationEndpoint, "updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:", self->_browseClient, self->_browseResponse, self->_agentUUID, self->_applicationService, self->_discoverySessionID);
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:](RPNWNearbyInvitationEndpoint, "addEndpointMapping:endpointID:applicationService:discoverySessionID:", a3, a4, self->_applicationService, self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:](RPNWNearbyInvitationEndpoint, "updateEndpointMapping:discoverySessionID:", a3, self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)removeDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint removeEndpointMapping:discoverySessionID:](RPNWNearbyInvitationEndpoint, "removeEndpointMapping:discoverySessionID:", a3, self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }
}

- (void)removeAllDevices
{
  RPNWNearbyInvitationDiscoverySession *v3;
  id v4;
  NSUUID *discoverySessionID;

  if (self->_discoverySessionID)
  {
    if (dword_100130B68 <= 30
      && (dword_100130B68 != -1 || _LogCategory_Initialize(&dword_100130B68, 30)))
    {
      v3 = self;
      v4 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v4, "appendFormat:", CFSTR("%p"), v3);

      LogPrintF(&dword_100130B68, "-[RPNWNearbyInvitationDiscoverySession removeAllDevices]", 30, "DISCOVER: RPNWNearbyInvitationDiscoverySession[%@]: Ending discovery session", v4);
    }
    +[RPNWNearbyInvitationEndpoint removeDiscoverySessionFromAllEndpoints:](RPNWNearbyInvitationEndpoint, "removeDiscoverySessionFromAllEndpoints:", self->_discoverySessionID);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0;

  }
}

- (void)startDiscovery
{
  RPNWNearbyInvitationPeer *v3;
  RPNWNearbyInvitationPeer *discoveryClient;
  RPNWNearbyInvitationPeer *v5;
  NSString *applicationService;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (self->_discoveryClient)
  {
    if (dword_100130B68 <= 90
      && (dword_100130B68 != -1 || _LogCategory_Initialize(&dword_100130B68, 90)))
    {
      LogPrintF(&dword_100130B68, "-[RPNWNearbyInvitationDiscoverySession startDiscovery]", 90, "DISCOVER: Failed to start RPNWNearbyInvitationDiscoverySession - discovery already running.");
    }
  }
  else
  {
    v3 = objc_alloc_init(RPNWNearbyInvitationPeer);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v3;

    v5 = self->_discoveryClient;
    applicationService = self->_applicationService;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100052EFC;
    v10[3] = &unk_100112C70;
    v10[4] = self;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100052F5C;
    v9[3] = &unk_100112C70;
    v9[4] = self;
    v7[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100052F68;
    v8[3] = &unk_100112C70;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100052F74;
    v7[3] = &unk_1001110F8;
    -[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:](v5, "startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:", applicationService, v10, v9, v8, v7);
  }
}

- (void)stopDiscovery
{
  RPNWNearbyInvitationDiscoverySession *v3;
  id v4;
  RPNWNearbyInvitationPeer *discoveryClient;

  if (self->_discoveryClient)
  {
    if (dword_100130B68 <= 30
      && (dword_100130B68 != -1 || _LogCategory_Initialize(&dword_100130B68, 30)))
    {
      v3 = self;
      v4 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v4, "appendFormat:", CFSTR("%p"), v3);

      LogPrintF(&dword_100130B68, "-[RPNWNearbyInvitationDiscoverySession stopDiscovery]", 30, "DISCOVER: Stopping RPNWNearbyInvitationDiscoverySession[%@]", v4);
    }
    -[RPNWNearbyInvitationPeer stopDiscovery](self->_discoveryClient, "stopDiscovery");
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0;

  }
  -[RPNWNearbyInvitationDiscoverySession removeAllDevices](self, "removeAllDevices");
}

- (RPNWNearbyInvitationPeer)discoveryClient
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
  objc_storeStrong((id *)&self->_browseClient, a3);
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
