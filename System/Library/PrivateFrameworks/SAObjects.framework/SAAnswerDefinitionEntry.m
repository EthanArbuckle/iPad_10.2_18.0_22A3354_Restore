@implementation SAAnswerDefinitionEntry

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DefinitionEntry");
}

+ (id)definitionEntry
{
  return objc_alloc_init((Class)a1);
}

- (NSString)definition
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("definition"));
}

- (void)setDefinition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("definition"), a3);
}

- (NSArray)examples
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("examples"));
}

- (void)setExamples:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("examples"), a3);
}

- (NSArray)variations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("variations"), v3);
}

- (void)setVariations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("variations"), (uint64_t)a3);
}

@end
