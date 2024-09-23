@implementation SAMacOpenAboutThisMac

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.mac");
}

- (id)encodedClassName
{
  return CFSTR("OpenAboutThisMac");
}

+ (id)openAboutThisMac
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
