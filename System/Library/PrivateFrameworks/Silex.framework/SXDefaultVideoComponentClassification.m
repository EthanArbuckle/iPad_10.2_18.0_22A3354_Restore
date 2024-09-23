@implementation SXDefaultVideoComponentClassification

+ (id)typeString
{
  return CFSTR("video");
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules](SXComponentLayoutRules, "twoColumnLayoutRules");
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
