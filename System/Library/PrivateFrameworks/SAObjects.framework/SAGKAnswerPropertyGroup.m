@implementation SAGKAnswerPropertyGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("AnswerPropertyGroup");
}

+ (id)answerPropertyGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)answerProperties
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("answerProperties"), v3);
}

- (void)setAnswerProperties:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("answerProperties"), (uint64_t)a3);
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
