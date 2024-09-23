@implementation SASyncStartDeepSyncVerification

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("StartDeepSyncVerification");
}

+ (id)startDeepSyncVerification
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)keys
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keys"));
}

- (void)setKeys:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keys"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
