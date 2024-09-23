@implementation POXSNullDefinition

+ (id)definition
{
  return (id)objc_opt_new();
}

- (Class)typeForName:(id)a3
{
  return (Class)objc_opt_class();
}

@end
