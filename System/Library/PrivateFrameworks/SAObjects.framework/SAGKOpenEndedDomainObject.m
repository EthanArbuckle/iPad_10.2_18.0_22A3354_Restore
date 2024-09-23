@implementation SAGKOpenEndedDomainObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("OpenEndedDomainObject");
}

+ (id)openEndedDomainObject
{
  return objc_alloc_init((Class)a1);
}

- (SAGKDirectAnswer)directAnswer
{
  return (SAGKDirectAnswer *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("directAnswer"));
}

- (void)setDirectAnswer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("directAnswer"), a3);
}

- (NSArray)image
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("image"), v3);
}

- (void)setImage:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("image"), (uint64_t)a3);
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
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("structuredAnswers"), &unk_1EE7B8AC0);
}

- (void)setStructuredAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("structuredAnswers"), (uint64_t)a3);
}

@end
