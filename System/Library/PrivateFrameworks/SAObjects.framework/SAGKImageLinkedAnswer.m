@implementation SAGKImageLinkedAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("ImageLinkedAnswer");
}

+ (id)imageLinkedAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)fileSize
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fileSize"));
}

- (void)setFileSize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fileSize"), a3);
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

@end
