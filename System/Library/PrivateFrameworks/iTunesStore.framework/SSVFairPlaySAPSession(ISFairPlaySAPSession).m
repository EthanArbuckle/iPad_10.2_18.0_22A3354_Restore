@implementation SSVFairPlaySAPSession(ISFairPlaySAPSession)

+ (id)sharedDefaultSession
{
  if (sharedDefaultSession_sOnce != -1)
    dispatch_once(&sharedDefaultSession_sOnce, &__block_literal_global_12);
  return (id)sharedDefaultSession_sSession;
}

+ (id)sharedPrimeSession
{
  if (sharedPrimeSession_sOnce != -1)
    dispatch_once(&sharedPrimeSession_sOnce, &__block_literal_global_1);
  return (id)sharedPrimeSession_sSession;
}

@end
