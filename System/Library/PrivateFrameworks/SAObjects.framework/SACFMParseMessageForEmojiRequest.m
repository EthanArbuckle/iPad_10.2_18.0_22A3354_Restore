@implementation SACFMParseMessageForEmojiRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("ParseMessageForEmojiRequest");
}

+ (id)parseMessageForEmojiRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)locale
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locale"));
}

- (void)setLocale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locale"), a3);
}

- (NSString)messageText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("messageText"));
}

- (void)setMessageText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("messageText"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
