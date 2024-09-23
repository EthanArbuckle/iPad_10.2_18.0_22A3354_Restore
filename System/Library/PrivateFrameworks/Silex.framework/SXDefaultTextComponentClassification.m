@implementation SXDefaultTextComponentClassification

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

+ (id)typeString
{
  return CFSTR("text");
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

+ (int)role
{
  return 0;
}

- (id)fontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

@end
