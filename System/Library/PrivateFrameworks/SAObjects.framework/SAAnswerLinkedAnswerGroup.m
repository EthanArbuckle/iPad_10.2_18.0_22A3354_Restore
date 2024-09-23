@implementation SAAnswerLinkedAnswerGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("LinkedAnswerGroup");
}

+ (id)linkedAnswerGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)linkedAnswers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("linkedAnswers"), v3);
}

- (void)setLinkedAnswers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("linkedAnswers"), (uint64_t)a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
