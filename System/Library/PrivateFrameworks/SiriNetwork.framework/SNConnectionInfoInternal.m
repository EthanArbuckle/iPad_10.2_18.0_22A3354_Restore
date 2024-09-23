@implementation SNConnectionInfoInternal

- (SAConnectionPolicy)policy
{
  id v2;

  ConnectionInfo.policy.getter();
  return (SAConnectionPolicy *)v2;
}

- (void)setPolicy:(id)a3
{
  id v5;
  SNConnectionInfoInternal *v6;

  v5 = a3;
  v6 = self;
  ConnectionInfo.policy.setter((uint64_t)a3);

}

- (SAConnectionPolicyRoute)policyRoute
{
  id v2;

  ConnectionInfo.policyRoute.getter();
  return (SAConnectionPolicyRoute *)v2;
}

- (void)setPolicyRoute:(id)a3
{
  id v5;
  SNConnectionInfoInternal *v6;

  v5 = a3;
  v6 = self;
  ConnectionInfo.policyRoute.setter((uint64_t)a3);

}

- (SNConnectionInfoInternal)init
{
  return (SNConnectionInfoInternal *)ConnectionInfo.init()();
}

- (int64_t)connectionProtocolTechnology
{
  SNConnectionInfoInternal *v2;
  int64_t v3;

  v2 = self;
  v3 = ConnectionInfo.connectionProtocolTechnology.getter((uint64_t)v2);

  return v3;
}

- (void)setConnectionProtocolTechnology:(int64_t)a3
{
  ConnectionInfo.connectionProtocolTechnology.setter(a3);
}

- (int64_t)communicationProtocolTechnology
{
  SNConnectionInfoInternal *v2;
  int64_t v3;

  v2 = self;
  v3 = ConnectionInfo.communicationProtocolTechnology.getter((uint64_t)v2);

  return v3;
}

- (void)setCommunicationProtocolTechnology:(int64_t)a3
{
  ConnectionInfo.communicationProtocolTechnology.setter(a3);
}

- (NSString)assistantIdentifier
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.assistantIdentifier.getter);
}

- (void)setAssistantIdentifier:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.assistantIdentifier.setter);
}

- (NSString)peerAssistantIdentifier
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerAssistantIdentifier.getter);
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.peerAssistantIdentifier.setter);
}

- (NSString)connectionId
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.connectionId.getter);
}

- (void)setConnectionId:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.connectionId.setter);
}

- (NSString)aceHost
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.aceHost.getter);
}

- (void)setAceHost:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.aceHost.setter);
}

- (NSString)languageCode
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.languageCode.getter);
}

- (void)setLanguageCode:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.languageCode.setter);
}

- (BOOL)prefersWWAN
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.prefersWWAN.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  ConnectionInfo.prefersWWAN.setter(a3);
}

- (BOOL)skipPeer
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.skipPeer.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setSkipPeer:(BOOL)a3
{
  ConnectionInfo.skipPeer.setter(a3);
}

- (BOOL)useWiFiHint
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.useWiFiHint.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setUseWiFiHint:(BOOL)a3
{
  ConnectionInfo.useWiFiHint.setter(a3);
}

- (NSError)skipPeerErrorReason
{
  SNConnectionInfoInternal *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  ConnectionInfo.skipPeerErrorReason.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)_convertErrorToNSError(_:)();

  }
  else
  {
    v5 = 0;
  }
  return (NSError *)v5;
}

- (void)setSkipPeerErrorReason:(id)a3
{
  id v4;
  SNConnectionInfoInternal *v5;

  v5 = self;
  v4 = a3;
  ConnectionInfo.skipPeerErrorReason.setter((uint64_t)a3);

}

- (BOOL)forceReconnect
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.forceReconnect.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setForceReconnect:(BOOL)a3
{
  ConnectionInfo.forceReconnect.setter(a3);
}

- (double)timeout
{
  SNConnectionInfoInternal *v2;
  double v3;

  v2 = self;
  v3 = ConnectionInfo.timeout.getter((uint64_t)v2);

  return v3;
}

- (void)setTimeout:(double)a3
{
  ConnectionInfo.timeout.setter(a3);
}

- (BOOL)imposePolicyBan
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.imposePolicyBan.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  ConnectionInfo.imposePolicyBan.setter(a3);
}

- (SAConnectionPolicy)connectionPolicy
{
  id v2;

  ConnectionInfo.policy.getter();
  return (SAConnectionPolicy *)v2;
}

- (void)setConnectionPolicy:(id)a3
{
  id v5;
  SNConnectionInfoInternal *v6;

  v5 = a3;
  v6 = self;
  ConnectionInfo.connectionPolicy.setter(a3);

}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  id v2;

  ConnectionInfo.policyRoute.getter();
  return (SAConnectionPolicyRoute *)v2;
}

- (void)setConnectionPolicyRoute:(id)a3
{
  id v5;
  SNConnectionInfoInternal *v6;

  v5 = a3;
  v6 = self;
  ConnectionInfo.connectionPolicyRoute.setter(a3);

}

- (BOOL)forceOnDeviceOnlyDictation
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.forceOnDeviceOnlyDictation.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
  ConnectionInfo.forceOnDeviceOnlyDictation.setter(a3);
}

- (NSString)productTypePrefix
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.productTypePrefix.getter);
}

- (void)setProductTypePrefix:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.productTypePrefix.setter);
}

- (NSString)peerType
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerType.getter);
}

- (void)setPeerType:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.peerType.setter);
}

- (NSString)peerVersion
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerVersion.getter);
}

- (void)setPeerVersion:(id)a3
{
  @objc ConnectionInfo.assistantIdentifier.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))ConnectionInfo.peerVersion.setter);
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.deviceIsInWalkaboutExperimentGroup.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  ConnectionInfo.deviceIsInWalkaboutExperimentGroup.setter(a3);
}

- (BOOL)usesProxyConnection
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.usesProxyConnection.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setUsesProxyConnection:(BOOL)a3
{
  ConnectionInfo.usesProxyConnection.setter(a3);
}

- (BOOL)usesPeerManagedSync
{
  SNConnectionInfoInternal *v2;
  char v3;
  char v4;

  v2 = self;
  ConnectionInfo.usesPeerManagedSync.getter((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)setUsesPeerManagedSync:(BOOL)a3
{
  ConnectionInfo.usesPeerManagedSync.setter(a3);
}

- (void).cxx_destruct
{
  void *v3;
  _BYTE v4[520];

  v3 = OUTLINED_FUNCTION_28(v4, (char *)self + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration);
  OUTLINED_FUNCTION_8_19((uint64_t)v3);

  OUTLINED_FUNCTION_3();
}

@end
