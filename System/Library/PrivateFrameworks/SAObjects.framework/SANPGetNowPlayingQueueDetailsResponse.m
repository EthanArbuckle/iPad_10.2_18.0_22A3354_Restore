@implementation SANPGetNowPlayingQueueDetailsResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("GetNowPlayingQueueDetailsResponse");
}

+ (id)getNowPlayingQueueDetailsResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)nextItems
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("nextItems"), v3);
}

- (void)setNextItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("nextItems"), (uint64_t)a3);
}

- (NSArray)previousItems
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("previousItems"), v3);
}

- (void)setPreviousItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("previousItems"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
