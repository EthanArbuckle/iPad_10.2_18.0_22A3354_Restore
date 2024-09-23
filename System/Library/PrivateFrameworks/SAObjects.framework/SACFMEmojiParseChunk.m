@implementation SACFMEmojiParseChunk

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("EmojiParseChunk");
}

+ (id)emojiParseChunk
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)emojiCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("emojiCount"));
}

- (void)setEmojiCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("emojiCount"), a3);
}

- (NSArray)inflectedEmojiList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("inflectedEmojiList"), v3);
}

- (void)setInflectedEmojiList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("inflectedEmojiList"), (uint64_t)a3);
}

@end
