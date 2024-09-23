@implementation SADialogText

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DialogText");
}

- (NSString)speakableTextOverride
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableTextOverride"));
}

- (void)setSpeakableTextOverride:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableTextOverride"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
