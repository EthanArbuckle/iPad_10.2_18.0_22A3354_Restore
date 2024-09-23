@implementation SACFMMessageTextParseChunk

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.client.local.messages");
}

- (id)encodedClassName
{
  return CFSTR("MessageTextParseChunk");
}

+ (id)messageTextParseChunk
{
  return objc_alloc_init((Class)a1);
}

- (NSString)chunkType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("chunkType"));
}

- (void)setChunkType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("chunkType"), a3);
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
