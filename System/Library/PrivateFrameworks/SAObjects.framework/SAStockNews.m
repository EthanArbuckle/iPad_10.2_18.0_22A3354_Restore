@implementation SAStockNews

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("News");
}

+ (id)news
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)timeStamp
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeStamp"));
}

- (void)setTimeStamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeStamp"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSString)url
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("url"), a3);
}

@end
