@implementation SNConnectionInfo

- (SNConnectionInfo)init
{
  SNConnectionInfo *v2;
  SNConnectionInfoInternal *v3;
  SNConnectionInfoInternal *underlyingConnectionInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNConnectionInfo;
  v2 = -[SNConnectionInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SNConnectionInfoInternal);
    underlyingConnectionInfo = v2->_underlyingConnectionInfo;
    v2->_underlyingConnectionInfo = v3;

  }
  return v2;
}

- (void)setConnectionProtocolTechnology:(int64_t)a3
{
  -[SNConnectionInfoInternal setConnectionProtocolTechnology:](self->_underlyingConnectionInfo, "setConnectionProtocolTechnology:", a3);
}

- (int64_t)connectionProtocolTechnology
{
  if (-[SNConnectionInfoInternal connectionProtocolTechnology](self->_underlyingConnectionInfo, "connectionProtocolTechnology") == 2)return 2;
  else
    return 1;
}

- (void)setCommunicationProtocolTechnology:(int64_t)a3
{
  -[SNConnectionInfoInternal setCommunicationProtocolTechnology:](self->_underlyingConnectionInfo, "setCommunicationProtocolTechnology:", a3);
}

- (int64_t)communicationProtocolTechnology
{
  if (-[SNConnectionInfoInternal communicationProtocolTechnology](self->_underlyingConnectionInfo, "communicationProtocolTechnology") == 2)return 2;
  else
    return 1;
}

- (void)setAssistantIdentifier:(id)a3
{
  -[SNConnectionInfoInternal setAssistantIdentifier:](self->_underlyingConnectionInfo, "setAssistantIdentifier:", a3);
}

- (NSString)assistantIdentifier
{
  return -[SNConnectionInfoInternal assistantIdentifier](self->_underlyingConnectionInfo, "assistantIdentifier");
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  -[SNConnectionInfoInternal setPeerAssistantIdentifier:](self->_underlyingConnectionInfo, "setPeerAssistantIdentifier:", a3);
}

- (NSString)peerAssistantIdentifier
{
  return -[SNConnectionInfoInternal peerAssistantIdentifier](self->_underlyingConnectionInfo, "peerAssistantIdentifier");
}

- (void)setConnectionId:(id)a3
{
  -[SNConnectionInfoInternal setConnectionId:](self->_underlyingConnectionInfo, "setConnectionId:", a3);
}

- (NSString)connectionId
{
  return -[SNConnectionInfoInternal connectionId](self->_underlyingConnectionInfo, "connectionId");
}

- (void)setAceHost:(id)a3
{
  -[SNConnectionInfoInternal setAceHost:](self->_underlyingConnectionInfo, "setAceHost:", a3);
}

- (NSString)aceHost
{
  return -[SNConnectionInfoInternal aceHost](self->_underlyingConnectionInfo, "aceHost");
}

- (void)setLanguageCode:(id)a3
{
  -[SNConnectionInfoInternal setLanguageCode:](self->_underlyingConnectionInfo, "setLanguageCode:", a3);
}

- (NSString)languageCode
{
  return -[SNConnectionInfoInternal languageCode](self->_underlyingConnectionInfo, "languageCode");
}

- (void)setPrefersWWAN:(BOOL)a3
{
  -[SNConnectionInfoInternal setPrefersWWAN:](self->_underlyingConnectionInfo, "setPrefersWWAN:", a3);
}

- (BOOL)prefersWWAN
{
  return -[SNConnectionInfoInternal prefersWWAN](self->_underlyingConnectionInfo, "prefersWWAN");
}

- (void)setSkipPeer:(BOOL)a3
{
  -[SNConnectionInfoInternal setSkipPeer:](self->_underlyingConnectionInfo, "setSkipPeer:", a3);
}

- (BOOL)skipPeer
{
  return -[SNConnectionInfoInternal skipPeer](self->_underlyingConnectionInfo, "skipPeer");
}

- (void)setUseWiFiHint:(BOOL)a3
{
  -[SNConnectionInfoInternal setUseWiFiHint:](self->_underlyingConnectionInfo, "setUseWiFiHint:", a3);
}

- (BOOL)useWiFiHint
{
  return -[SNConnectionInfoInternal useWiFiHint](self->_underlyingConnectionInfo, "useWiFiHint");
}

- (void)setSkipPeerErrorReason:(id)a3
{
  -[SNConnectionInfoInternal setSkipPeerErrorReason:](self->_underlyingConnectionInfo, "setSkipPeerErrorReason:", a3);
}

- (NSError)skipPeerErrorReason
{
  return -[SNConnectionInfoInternal skipPeerErrorReason](self->_underlyingConnectionInfo, "skipPeerErrorReason");
}

- (void)setForceReconnect:(BOOL)a3
{
  -[SNConnectionInfoInternal setForceReconnect:](self->_underlyingConnectionInfo, "setForceReconnect:", a3);
}

- (BOOL)forceReconnect
{
  return -[SNConnectionInfoInternal forceReconnect](self->_underlyingConnectionInfo, "forceReconnect");
}

- (void)setTimeout:(double)a3
{
  -[SNConnectionInfoInternal setTimeout:](self->_underlyingConnectionInfo, "setTimeout:", a3);
}

- (double)timeout
{
  double result;

  -[SNConnectionInfoInternal timeout](self->_underlyingConnectionInfo, "timeout");
  return result;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  -[SNConnectionInfoInternal setImposePolicyBan:](self->_underlyingConnectionInfo, "setImposePolicyBan:", a3);
}

- (BOOL)imposePolicyBan
{
  return -[SNConnectionInfoInternal imposePolicyBan](self->_underlyingConnectionInfo, "imposePolicyBan");
}

- (void)setConnectionPolicy:(id)a3
{
  -[SNConnectionInfoInternal setConnectionPolicy:](self->_underlyingConnectionInfo, "setConnectionPolicy:", a3);
}

- (SAConnectionPolicy)connectionPolicy
{
  return -[SNConnectionInfoInternal connectionPolicy](self->_underlyingConnectionInfo, "connectionPolicy");
}

- (void)setConnectionPolicyRoute:(id)a3
{
  -[SNConnectionInfoInternal setConnectionPolicyRoute:](self->_underlyingConnectionInfo, "setConnectionPolicyRoute:", a3);
}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  return -[SNConnectionInfoInternal connectionPolicyRoute](self->_underlyingConnectionInfo, "connectionPolicyRoute");
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
  -[SNConnectionInfoInternal setForceOnDeviceOnlyDictation:](self->_underlyingConnectionInfo, "setForceOnDeviceOnlyDictation:", a3);
}

- (BOOL)isForceOnDeviceOnlyDictationEnabled
{
  return -[SNConnectionInfoInternal forceOnDeviceOnlyDictation](self->_underlyingConnectionInfo, "forceOnDeviceOnlyDictation");
}

- (void)setProductTypePrefix:(id)a3
{
  -[SNConnectionInfoInternal setProductTypePrefix:](self->_underlyingConnectionInfo, "setProductTypePrefix:", a3);
}

- (NSString)productTypePrefix
{
  return -[SNConnectionInfoInternal productTypePrefix](self->_underlyingConnectionInfo, "productTypePrefix");
}

- (void)setPeerType:(id)a3
{
  -[SNConnectionInfoInternal setPeerType:](self->_underlyingConnectionInfo, "setPeerType:", a3);
}

- (NSString)peerType
{
  return -[SNConnectionInfoInternal peerType](self->_underlyingConnectionInfo, "peerType");
}

- (void)setPeerVersion:(id)a3
{
  -[SNConnectionInfoInternal setPeerVersion:](self->_underlyingConnectionInfo, "setPeerVersion:", a3);
}

- (NSString)peerVersion
{
  return -[SNConnectionInfoInternal peerVersion](self->_underlyingConnectionInfo, "peerVersion");
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  -[SNConnectionInfoInternal setDeviceIsInWalkaboutExperimentGroup:](self->_underlyingConnectionInfo, "setDeviceIsInWalkaboutExperimentGroup:", a3);
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return -[SNConnectionInfoInternal deviceIsInWalkaboutExperimentGroup](self->_underlyingConnectionInfo, "deviceIsInWalkaboutExperimentGroup");
}

- (void)setUsesProxyConnection:(BOOL)a3
{
  -[SNConnectionInfoInternal setUsesProxyConnection:](self->_underlyingConnectionInfo, "setUsesProxyConnection:", a3);
}

- (BOOL)usesProxyConnection
{
  return -[SNConnectionInfoInternal usesProxyConnection](self->_underlyingConnectionInfo, "usesProxyConnection");
}

- (void)setUsesPeerManagedSync:(BOOL)a3
{
  -[SNConnectionInfoInternal setUsesPeerManagedSync:](self->_underlyingConnectionInfo, "setUsesPeerManagedSync:", a3);
}

- (BOOL)usesPeerManagedSync
{
  return -[SNConnectionInfoInternal usesPeerManagedSync](self->_underlyingConnectionInfo, "usesPeerManagedSync");
}

- (SNConnectionInfoInternal)underlyingConnectionInfo
{
  return self->_underlyingConnectionInfo;
}

- (void)setUnderlyingConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingConnectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingConnectionInfo, 0);
}

@end
