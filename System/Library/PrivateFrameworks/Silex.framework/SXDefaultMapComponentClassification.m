@implementation SXDefaultMapComponentClassification

+ (id)typeString
{
  return CFSTR("map");
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
