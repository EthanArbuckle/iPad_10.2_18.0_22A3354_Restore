@implementation SAAnswerDomainObjectSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectSnippet");
}

+ (id)domainObjectSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)answerPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("answerPunchOut"));
}

- (void)setAnswerPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("answerPunchOut"), a3);
}

- (NSArray)answers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("answers"), v3);
}

- (void)setAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("answers"), (uint64_t)a3);
}

@end
