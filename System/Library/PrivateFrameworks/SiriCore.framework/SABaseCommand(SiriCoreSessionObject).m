@implementation SABaseCommand(SiriCoreSessionObject)

- (id)siriCore_serializedAceDataError:()SiriCoreSessionObject
{
  return +[SiriCoreAceSerialization dataForObject:error:](SiriCoreAceSerialization, "dataForObject:error:", a1, a3);
}

- (uint64_t)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

- (uint64_t)siriCore_isRetryable
{
  return 1;
}

- (uint64_t)siriCore_isProvisional
{
  return 0;
}

- (uint64_t)siriCore_requestId
{
  return 0;
}

- (uint64_t)siriCore_supportedByLocalSession
{
  return 1;
}

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 1;
}

@end
