@implementation SACancelRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CancelRequest");
}

+ (id)cancelRequest
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)clientCancellationCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("clientCancellationCode"));
}

- (void)setClientCancellationCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("clientCancellationCode"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
