@implementation SAMPSetQueueQueueFilter

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SetQueueQueueFilter");
}

+ (id)setQueueQueueFilter
{
  return objc_alloc_init((Class)a1);
}

- (NSString)mediaItemProperty
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaItemProperty"));
}

- (void)setMediaItemProperty:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaItemProperty"), a3);
}

- (NSString)operation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("operation"));
}

- (void)setOperation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("operation"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
