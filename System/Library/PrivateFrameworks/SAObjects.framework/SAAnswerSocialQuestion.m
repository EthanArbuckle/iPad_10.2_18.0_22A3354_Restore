@implementation SAAnswerSocialQuestion

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SocialQuestion");
}

+ (id)socialQuestion
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)socialAnswers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("socialAnswers"), v3);
}

- (void)setSocialAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("socialAnswers"), (uint64_t)a3);
}

@end
