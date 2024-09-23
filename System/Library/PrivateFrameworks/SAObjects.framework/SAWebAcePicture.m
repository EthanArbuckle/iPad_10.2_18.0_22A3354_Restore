@implementation SAWebAcePicture

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("AcePicture");
}

+ (id)acePicture
{
  return objc_alloc_init((Class)a1);
}

- (NSString)format
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("format"));
}

- (void)setFormat:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("format"), a3);
}

- (NSNumber)height
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("height"));
}

- (void)setHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("height"), a3);
}

- (NSNumber)width
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("width"));
}

- (void)setWidth:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("width"), a3);
}

@end
