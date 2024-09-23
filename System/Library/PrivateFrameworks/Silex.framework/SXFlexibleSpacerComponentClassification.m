@implementation SXFlexibleSpacerComponentClassification

+ (id)typeString
{
  return CFSTR("flexible_spacer");
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
