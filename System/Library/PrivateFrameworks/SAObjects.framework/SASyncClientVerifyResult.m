@implementation SASyncClientVerifyResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ClientVerifyResult");
}

+ (id)clientVerifyResult
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)checksums
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("checksums"), v3);
}

- (void)setChecksums:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("checksums"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
