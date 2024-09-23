@implementation SAReminderSiriKitSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitSnippet");
}

+ (id)siriKitSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)interactions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("interactions"), v3);
}

- (void)setInteractions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("interactions"), (uint64_t)a3);
}

@end
