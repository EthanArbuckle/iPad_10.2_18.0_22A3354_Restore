@implementation SASMUXResultCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("MUXResultCandidate");
}

- (NSString)rcID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rcID"));
}

- (void)setRcID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rcID"), a3);
}

- (NSDictionary)resultCandidates
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("resultCandidates"), v3);
}

- (void)setResultCandidates:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("resultCandidates"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
