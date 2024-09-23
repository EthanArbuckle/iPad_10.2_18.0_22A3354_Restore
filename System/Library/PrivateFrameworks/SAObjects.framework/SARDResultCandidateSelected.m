@implementation SARDResultCandidateSelected

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("ResultCandidateSelected");
}

+ (id)resultCandidateSelected
{
  return objc_alloc_init((Class)a1);
}

- (SARDNativeFlowContextUpdate)nativeFlowContextUpdate
{
  return (SARDNativeFlowContextUpdate *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nativeFlowContextUpdate"));
}

- (void)setNativeFlowContextUpdate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nativeFlowContextUpdate"), a3);
}

- (NSString)selectedResultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedResultCandidateId"));
}

- (void)setSelectedResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedResultCandidateId"), a3);
}

- (BOOL)serverFallback
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("serverFallback"));
}

- (void)setServerFallback:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("serverFallback"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
