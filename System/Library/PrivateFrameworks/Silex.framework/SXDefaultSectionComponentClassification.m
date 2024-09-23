@implementation SXDefaultSectionComponentClassification

+ (id)typeString
{
  return CFSTR("section");
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

+ (int)role
{
  return 0;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules fullWidthLayoutRules](SXComponentLayoutRules, "fullWidthLayoutRules");
}

@end
