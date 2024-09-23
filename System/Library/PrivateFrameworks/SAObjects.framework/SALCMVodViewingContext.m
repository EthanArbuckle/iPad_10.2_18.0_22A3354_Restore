@implementation SALCMVodViewingContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("VodViewingContext");
}

+ (id)vodViewingContext
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)originalEventStartTime
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalEventStartTime"));
}

- (void)setOriginalEventStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalEventStartTime"), a3);
}

@end
