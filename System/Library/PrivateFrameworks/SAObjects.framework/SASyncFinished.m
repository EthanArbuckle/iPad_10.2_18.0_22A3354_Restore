@implementation SASyncFinished

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("Finished");
}

+ (id)finished
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
