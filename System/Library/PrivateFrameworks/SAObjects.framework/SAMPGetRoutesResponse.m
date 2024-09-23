@implementation SAMPGetRoutesResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GetRoutesResponse");
}

+ (id)getRoutesResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)speakers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("speakers"), v3);
}

- (void)setSpeakers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("speakers"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
