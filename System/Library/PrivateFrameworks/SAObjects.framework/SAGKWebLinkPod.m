@implementation SAGKWebLinkPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("WebLinkPod");
}

+ (id)webLinkPod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)links
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("links"), v3);
}

- (void)setLinks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("links"), (uint64_t)a3);
}

@end
