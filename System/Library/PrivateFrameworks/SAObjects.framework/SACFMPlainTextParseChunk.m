@implementation SACFMPlainTextParseChunk

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("PlainTextParseChunk");
}

+ (id)plainTextParseChunk
{
  return objc_alloc_init((Class)a1);
}

@end
