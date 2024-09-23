@implementation SAUIShowHelp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ShowHelp");
}

+ (id)showHelp
{
  return objc_alloc_init((Class)a1);
}

- (NSString)speakableText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableText"));
}

- (void)setSpeakableText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableText"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
