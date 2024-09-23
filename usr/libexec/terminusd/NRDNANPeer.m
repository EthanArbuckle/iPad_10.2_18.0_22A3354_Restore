@implementation NRDNANPeer

- (NRDNANPeer)init
{
  NRDNANPeer *result;
  id v3;
  int IsLevelEnabled;
  id v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NRDNANPeer;
  result = -[NRDNANPeer init](&v12, "init");
  if (!result)
  {
    v3 = sub_100115594();
    IsLevelEnabled = _NRLogIsLevelEnabled(v3, 16);

    if (IsLevelEnabled)
    {
      v5 = sub_100115594();
      _NRLogWithArgs(v5, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDNANPeer init]", 137);

    }
    v6 = _os_log_pack_size(12);
    v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v8 = __error();
    v9 = _os_log_pack_fill(v7, v6, *v8, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v9 = 136446210;
    *(_QWORD *)(v9 + 4) = "-[NRDNANPeer init]";
    v10 = sub_100115594();
    _NRLogAbortWithPack(v10, v7);
  }
  result->_identifier = ++dword_1001E4998;
  return result;
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t peerInstanceID;
  uint64_t identifier;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)NSString);
  if (self->_isInitiator)
    v4 = "I";
  else
    v4 = "R";
  peerInstanceID = self->_peerInstanceID;
  identifier = self->_identifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NWAddressEndpoint hostname](self->_peerEndpoint, "hostname"));
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRDNANPeer[%u, %s, id %u, %@]"), identifier, v4, peerInstanceID, v7);

  return v8;
}

- (BOOL)hasActiveDataSession
{
  return self->_localInterfaceIndex != 0;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NWAddressEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setPeerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_peerEndpoint, a3);
}

- (unsigned)peerInstanceID
{
  return self->_peerInstanceID;
}

- (void)setPeerInstanceID:(unsigned __int8)a3
{
  self->_peerInstanceID = a3;
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- (WiFiAwareDiscoveryResult)initiatorDiscoveryResult
{
  return self->_initiatorDiscoveryResult;
}

- (void)setInitiatorDiscoveryResult:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorDiscoveryResult, a3);
}

- (WiFiAwareDataSession)initiatorDataSession
{
  return self->_initiatorDataSession;
}

- (void)setInitiatorDataSession:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorDataSession, a3);
}

- (WiFiAwarePublisherDataSessionHandle)responderDataSession
{
  return self->_responderDataSession;
}

- (void)setResponderDataSession:(id)a3
{
  objc_storeStrong((id *)&self->_responderDataSession, a3);
}

- (NSString)remoteIDSDeviceID
{
  return self->_remoteIDSDeviceID;
}

- (void)setRemoteIDSDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteIDSDeviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_responderDataSession, 0);
  objc_storeStrong((id *)&self->_initiatorDataSession, 0);
  objc_storeStrong((id *)&self->_initiatorDiscoveryResult, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
