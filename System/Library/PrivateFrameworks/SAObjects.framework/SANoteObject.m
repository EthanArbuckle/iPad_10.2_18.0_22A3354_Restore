@implementation SANoteObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
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

- (NSDate)createdDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("createdDate"));
}

- (void)setCreatedDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("createdDate"), a3);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastModifiedDate"));
}

- (void)setLastModifiedDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastModifiedDate"), a3);
}

- (BOOL)restricted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("restricted"));
}

- (void)setRestricted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("restricted"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
