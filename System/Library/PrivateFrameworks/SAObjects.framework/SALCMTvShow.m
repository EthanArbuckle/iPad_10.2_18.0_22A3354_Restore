@implementation SALCMTvShow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("TvShow");
}

+ (id)tvShow
{
  return objc_alloc_init((Class)a1);
}

- (NSString)seriesName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seriesName"));
}

- (void)setSeriesName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seriesName"), a3);
}

@end
