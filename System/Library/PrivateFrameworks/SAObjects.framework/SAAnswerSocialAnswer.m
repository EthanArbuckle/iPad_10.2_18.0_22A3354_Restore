@implementation SAAnswerSocialAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SocialAnswer");
}

+ (id)socialAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)selectedAnswer
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedAnswer"));
}

- (void)setSelectedAnswer:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedAnswer"), a3);
}

@end
