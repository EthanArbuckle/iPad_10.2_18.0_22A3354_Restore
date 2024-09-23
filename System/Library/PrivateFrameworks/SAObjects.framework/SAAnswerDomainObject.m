@implementation SAAnswerDomainObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DomainObject");
}

+ (id)domainObject
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appPunchOut"));
}

- (void)setAppPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appPunchOut"), a3);
}

- (NSString)category
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("category"));
}

- (void)setCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("category"), a3);
}

- (SAAnswerDirectAnswer)directAnswer
{
  return (SAAnswerDirectAnswer *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("directAnswer"));
}

- (void)setDirectAnswer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("directAnswer"), a3);
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

- (NSArray)structuredAnswers
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("structuredAnswers"), &unk_1EE7B4E80);
}

- (void)setStructuredAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("structuredAnswers"), (uint64_t)a3);
}

@end
