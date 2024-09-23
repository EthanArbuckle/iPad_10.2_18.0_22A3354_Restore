@implementation SACreateVOXListItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CreateVOXListItem");
}

+ (id)createVOXListItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)displayHints
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayHints"));
}

- (void)setDisplayHints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayHints"), a3);
}

- (NSString)speakableInSequence
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableInSequence"));
}

- (void)setSpeakableInSequence:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableInSequence"), a3);
}

- (NSString)speakableStandalone
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableStandalone"));
}

- (void)setSpeakableStandalone:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableStandalone"), a3);
}

@end
