@implementation SAWebNewsResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("NewsResult");
}

+ (id)newsResult
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)publicationDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("publicationDate"));
}

- (void)setPublicationDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("publicationDate"), a3);
}

- (NSString)source
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("source"));
}

- (void)setSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("source"), a3);
}

@end
