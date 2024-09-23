@implementation SAARParaphrasedSuggestedResultsPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alternatives");
}

- (id)encodedClassName
{
  return CFSTR("ParaphrasedSuggestedResultsPod");
}

+ (id)paraphrasedSuggestedResultsPod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)suggestedResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("suggestedResults"), v3);
}

- (void)setSuggestedResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("suggestedResults"), (uint64_t)a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
