@implementation SAAnswerSocialStructuredAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SocialStructuredAnswer");
}

+ (id)socialStructuredAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSString)category
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("category"));
}

- (void)setCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("category"), a3);
}

- (NSArray)socialQuestions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("socialQuestions"), v3);
}

- (void)setSocialQuestions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("socialQuestions"), (uint64_t)a3);
}

@end
