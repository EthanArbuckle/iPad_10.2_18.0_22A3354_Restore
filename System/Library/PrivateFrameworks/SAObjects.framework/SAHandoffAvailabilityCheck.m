@implementation SAHandoffAvailabilityCheck

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("HandoffAvailabilityCheck");
}

+ (id)handoffAvailabilityCheck
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
