@implementation SAMacStartScreenSaver

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.mac");
}

- (id)encodedClassName
{
  return CFSTR("StartScreenSaver");
}

+ (id)startScreenSaver
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
