@implementation SAAIRetrySearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("RetrySearch");
}

+ (id)retrySearch
{
  return objc_alloc_init((Class)a1);
}

- (double)minimumDurationForRetry
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("minimumDurationForRetry"));
}

- (void)setMinimumDurationForRetry:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("minimumDurationForRetry"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
