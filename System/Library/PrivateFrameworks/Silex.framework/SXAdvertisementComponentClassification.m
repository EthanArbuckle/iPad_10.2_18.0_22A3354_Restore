@implementation SXAdvertisementComponentClassification

+ (id)typeString
{
  return CFSTR("advertisement");
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
  return +[SXComponentLayoutRules fullWidthLayoutRules](SXComponentLayoutRules, "fullWidthLayoutRules");
}

- (BOOL)isCollapsible
{
  return 1;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
