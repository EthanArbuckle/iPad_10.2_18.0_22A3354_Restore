@implementation SARDAsrOutcomeCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("AsrOutcomeCandidate");
}

+ (id)asrOutcomeCandidate
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
