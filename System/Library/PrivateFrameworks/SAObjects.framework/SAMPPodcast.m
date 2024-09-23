@implementation SAMPPodcast

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Podcast");
}

+ (id)podcast
{
  return objc_alloc_init((Class)a1);
}

- (NSString)seriesId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seriesId"));
}

- (void)setSeriesId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seriesId"), a3);
}

- (NSString)seriesTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seriesTitle"));
}

- (void)setSeriesTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seriesTitle"), a3);
}

@end
