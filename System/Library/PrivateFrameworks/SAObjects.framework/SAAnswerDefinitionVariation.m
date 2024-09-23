@implementation SAAnswerDefinitionVariation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DefinitionVariation");
}

+ (id)definitionVariation
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)examples
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("examples"));
}

- (void)setExamples:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("examples"), a3);
}

- (NSString)variation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("variation"));
}

- (void)setVariation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("variation"), a3);
}

@end
