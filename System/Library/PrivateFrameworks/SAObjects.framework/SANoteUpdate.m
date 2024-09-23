@implementation SANoteUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("Update");
}

+ (id)update
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentsToAppend
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentsToAppend"));
}

- (void)setContentsToAppend:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentsToAppend"), a3);
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
