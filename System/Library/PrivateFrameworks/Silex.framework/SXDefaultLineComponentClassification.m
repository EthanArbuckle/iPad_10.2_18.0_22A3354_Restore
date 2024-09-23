@implementation SXDefaultLineComponentClassification

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

+ (id)typeString
{
  return CFSTR("line");
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

+ (int)role
{
  return 0;
}

@end
