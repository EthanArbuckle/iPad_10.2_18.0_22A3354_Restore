@implementation SANoteCreate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("Create");
}

+ (id)create
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contents
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contents"));
}

- (void)setContents:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contents"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
