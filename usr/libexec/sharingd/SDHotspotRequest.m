@implementation SDHotspotRequest

- (void)dealloc
{
  RPCompanionLinkClient *companionLinkClient;
  LogCategory *logCategory;
  objc_super v5;

  -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", 0);
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  logCategory = self->_logCategory;
  if (logCategory && (logCategory->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(logCategory);
    self->_logCategory = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SDHotspotRequest;
  -[SDHotspotRequest dealloc](&v5, "dealloc");
}

- (SFRemoteHotspotTrafficFilterParams)trafficFilterParams
{
  return self->_trafficFilterParams;
}

- (void)setTrafficFilterParams:(id)a3
{
  objc_storeStrong((id *)&self->_trafficFilterParams, a3);
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (SFRemoteHotspotDevice)hotspotDevice
{
  return self->_hotspotDevice;
}

- (void)setHotspotDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotDevice, a3);
}

- (id)hotspotInfoHandler
{
  return self->_hotspotInfoHandler;
}

- (void)setHotspotInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LogCategory)logCategory
{
  return self->_logCategory;
}

- (void)setLogCategory:(LogCategory *)a3
{
  self->_logCategory = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hotspotInfoHandler, 0);
  objc_storeStrong((id *)&self->_hotspotDevice, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_trafficFilterParams, 0);
}

@end
