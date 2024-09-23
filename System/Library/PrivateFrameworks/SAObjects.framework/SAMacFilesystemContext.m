@implementation SAMacFilesystemContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.mac");
}

- (id)encodedClassName
{
  return CFSTR("FilesystemContext");
}

+ (id)filesystemContext
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)targetEntities
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("targetEntities"));
}

- (void)setTargetEntities:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("targetEntities"), a3);
}

@end
