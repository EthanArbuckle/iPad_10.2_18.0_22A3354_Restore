@implementation SAConnectionPolicy

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ConnectionPolicy");
}

+ (id)connectionPolicy
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)disableMPTCP
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disableMPTCP"));
}

- (void)setDisableMPTCP:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disableMPTCP"), a3);
}

- (NSNumber)enableOptimisticDNS
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enableOptimisticDNS"));
}

- (void)setEnableOptimisticDNS:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enableOptimisticDNS"), a3);
}

- (NSNumber)enableTLS13
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enableTLS13"));
}

- (void)setEnableTLS13:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enableTLS13"), a3);
}

- (NSNumber)enableTLS13ZeroRTT
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enableTLS13ZeroRTT"));
}

- (void)setEnableTLS13ZeroRTT:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enableTLS13ZeroRTT"), a3);
}

- (NSNumber)enableTcpFastOpen
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enableTcpFastOpen"));
}

- (void)setEnableTcpFastOpen:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enableTcpFastOpen"), a3);
}

- (BOOL)enabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enabled"));
}

- (void)setEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enabled"), a3);
}

- (NSNumber)globalTimeout
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("globalTimeout"));
}

- (void)setGlobalTimeout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("globalTimeout"), a3);
}

- (NSNumber)mptcpFallbackPort
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mptcpFallbackPort"));
}

- (void)setMptcpFallbackPort:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mptcpFallbackPort"), a3);
}

- (NSString)policyId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("policyId"));
}

- (void)setPolicyId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("policyId"), a3);
}

- (NSArray)routes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("routes"), v3);
}

- (void)setRoutes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("routes"), (uint64_t)a3);
}

- (NSNumber)timeToLive
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeToLive"));
}

- (void)setTimeToLive:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeToLive"), a3);
}

@end
