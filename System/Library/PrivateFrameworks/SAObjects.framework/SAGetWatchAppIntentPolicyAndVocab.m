@implementation SAGetWatchAppIntentPolicyAndVocab

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetWatchAppIntentPolicyAndVocab");
}

+ (id)getWatchAppIntentPolicyAndVocab
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clientIdentifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientIdentifiers"));
}

- (void)setClientIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientIdentifiers"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
