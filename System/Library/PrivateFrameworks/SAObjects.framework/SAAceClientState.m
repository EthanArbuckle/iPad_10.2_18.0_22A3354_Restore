@implementation SAAceClientState

+ (id)deliveryDeadline
{
  return CFSTR("UNDEFINED");
}

+ (id)persistencePolicy
{
  return CFSTR("UNDEFINED");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceClientState");
}

+ (id)aceClientState
{
  return objc_alloc_init((Class)a1);
}

@end
