@implementation SAGKVideoPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("VideoPod");
}

+ (id)videoPod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)videos
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("videos"), v3);
}

- (void)setVideos:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("videos"), (uint64_t)a3);
}

@end
