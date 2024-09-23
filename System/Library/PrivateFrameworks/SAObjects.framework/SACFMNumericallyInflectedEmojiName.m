@implementation SACFMNumericallyInflectedEmojiName

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("NumericallyInflectedEmojiName");
}

+ (id)numericallyInflectedEmojiName
{
  return objc_alloc_init((Class)a1);
}

- (NSString)withEmoji
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("withEmoji"));
}

- (void)setWithEmoji:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("withEmoji"), a3);
}

- (NSString)withoutEmoji
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("withoutEmoji"));
}

- (void)setWithoutEmoji:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("withoutEmoji"), a3);
}

@end
