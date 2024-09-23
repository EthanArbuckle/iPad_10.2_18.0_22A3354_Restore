@implementation SAUIShowFullScreenEffect

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ShowFullScreenEffect");
}

+ (id)showFullScreenEffect
{
  return objc_alloc_init((Class)a1);
}

- (NSString)fullScreenEffectType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullScreenEffectType"));
}

- (void)setFullScreenEffectType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullScreenEffectType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
