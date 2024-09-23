@implementation SASyncServerVerifyResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ServerVerifyResponse");
}

+ (id)serverVerifyResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)internalVerifications
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("internalVerifications"), v3);
}

- (void)setInternalVerifications:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("internalVerifications"), (uint64_t)a3);
}

- (NSArray)serverChecksums
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("serverChecksums"), v3);
}

- (void)setServerChecksums:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("serverChecksums"), (uint64_t)a3);
}

- (NSArray)syncDebugInfo
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("syncDebugInfo"), v3);
}

- (void)setSyncDebugInfo:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("syncDebugInfo"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
