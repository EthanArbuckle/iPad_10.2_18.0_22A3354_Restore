@implementation SAMPNowPlayingQueuePosition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("NowPlayingQueuePosition");
}

+ (id)nowPlayingQueuePosition
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)index
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("index"));
}

- (void)setIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("index"), a3);
}

- (int64_t)queueSize
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("queueSize"));
}

- (void)setQueueSize:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("queueSize"), a3);
}

@end
