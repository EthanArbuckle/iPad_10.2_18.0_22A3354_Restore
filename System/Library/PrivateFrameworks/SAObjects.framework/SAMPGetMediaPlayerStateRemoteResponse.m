@implementation SAMPGetMediaPlayerStateRemoteResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GetMediaPlayerStateRemoteResponse");
}

+ (id)getMediaPlayerStateRemoteResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)routeResponses
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("routeResponses"), v3);
}

- (void)setRouteResponses:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("routeResponses"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
