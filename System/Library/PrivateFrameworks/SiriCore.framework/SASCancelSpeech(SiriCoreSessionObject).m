@implementation SASCancelSpeech(SiriCoreSessionObject)

- (uint64_t)siriCore_isRestartable
{
  return 0;
}

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

@end
