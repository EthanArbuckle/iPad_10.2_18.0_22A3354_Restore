@implementation SAGKEncyclopediaDomainObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("EncyclopediaDomainObject");
}

+ (id)encyclopediaDomainObject
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)linkedAnswerGroups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("linkedAnswerGroups"), v3);
}

- (void)setLinkedAnswerGroups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("linkedAnswerGroups"), (uint64_t)a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSString)nameAnnotation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nameAnnotation"));
}

- (void)setNameAnnotation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nameAnnotation"), a3);
}

- (NSArray)structuredAnswers
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("structuredAnswers"), &unk_1EE7B8AC0);
}

- (void)setStructuredAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("structuredAnswers"), (uint64_t)a3);
}

@end
