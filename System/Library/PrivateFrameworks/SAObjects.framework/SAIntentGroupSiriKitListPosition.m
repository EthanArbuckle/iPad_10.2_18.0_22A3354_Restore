@implementation SAIntentGroupSiriKitListPosition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitListPosition");
}

+ (id)siriKitListPosition
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)offset
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("offset"));
}

- (void)setOffset:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("offset"), a3);
}

- (NSString)position
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

@end
