@implementation SAGetResultObjects(SiriCoreSessionObject)

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

- (uint64_t)siriCore_isProvisional
{
  return 1;
}

@end
