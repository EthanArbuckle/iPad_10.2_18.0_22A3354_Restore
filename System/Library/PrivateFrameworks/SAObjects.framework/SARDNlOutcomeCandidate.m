@implementation SARDNlOutcomeCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("NlOutcomeCandidate");
}

+ (id)nlOutcomeCandidate
{
  return objc_alloc_init((Class)a1);
}

- (NSData)nlIntentHierarchyContainerProto
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlIntentHierarchyContainerProto"));
}

- (void)setNlIntentHierarchyContainerProto:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlIntentHierarchyContainerProto"), a3);
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
