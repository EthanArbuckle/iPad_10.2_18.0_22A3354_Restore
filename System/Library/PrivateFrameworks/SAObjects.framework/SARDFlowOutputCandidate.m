@implementation SARDFlowOutputCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("FlowOutputCandidate");
}

- (NSArray)payload
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("payload"), &unk_1EE77C568);
}

- (void)setPayload:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("payload"), (uint64_t)a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (SARDServerContextUpdateCandidate)serverContextUpdateCandidate
{
  return (SARDServerContextUpdateCandidate *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("serverContextUpdateCandidate"));
}

- (void)setServerContextUpdateCandidate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("serverContextUpdateCandidate"), a3);
}

- (BOOL)shouldNotMitigateAsFalseTrigger
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldNotMitigateAsFalseTrigger"));
}

- (void)setShouldNotMitigateAsFalseTrigger:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldNotMitigateAsFalseTrigger"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
