@implementation SARDServerContextUpdateCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("ServerContextUpdateCandidate");
}

- (NSArray)mappedDomainEntities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("mappedDomainEntities"), v3);
}

- (void)setMappedDomainEntities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("mappedDomainEntities"), (uint64_t)a3);
}

- (NSData)nlContextUpdatePayload
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlContextUpdatePayload"));
}

- (void)setNlContextUpdatePayload:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlContextUpdatePayload"), a3);
}

- (NSData)pegasusConversationContext
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pegasusConversationContext"));
}

- (void)setPegasusConversationContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pegasusConversationContext"), a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
