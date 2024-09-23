@implementation SAReminderListObjectWrapper

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("ListObjectWrapper");
}

+ (id)listObjectWrapper
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)generation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("generation"));
}

- (void)setGeneration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("generation"), a3);
}

@end
