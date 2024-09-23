@implementation SAUIDecoratedText

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DecoratedText");
}

+ (id)decoratedText
{
  return objc_alloc_init((Class)a1);
}

- (NSString)ducId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ducId"));
}

- (void)setDucId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ducId"), a3);
}

- (NSArray)regions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("regions"), v3);
}

- (void)setRegions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("regions"), (uint64_t)a3);
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
