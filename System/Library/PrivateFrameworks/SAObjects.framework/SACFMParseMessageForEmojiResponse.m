@implementation SACFMParseMessageForEmojiResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("ParseMessageForEmojiResponse");
}

+ (id)parseMessageForEmojiResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)parseChunks
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("parseChunks"), v3);
}

- (void)setParseChunks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("parseChunks"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
