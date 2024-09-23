@implementation SASMUXStartAsrOnServerRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("MUXStartAsrOnServerRequest");
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
