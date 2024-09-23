@implementation SASyncServerVerify

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ServerVerify");
}

+ (id)serverVerify
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)fetchSyncDebugInfo
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("fetchSyncDebugInfo"));
}

- (void)setFetchSyncDebugInfo:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("fetchSyncDebugInfo"), a3);
}

- (BOOL)performInternalVerification
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("performInternalVerification"));
}

- (void)setPerformInternalVerification:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("performInternalVerification"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
