@implementation SXTextSourceDefaults

+ (id)defaults
{
  return objc_alloc_init((Class)objc_opt_self());
}

- (SXTextSourceDefaults)init
{
  SXTextSourceDefaults *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXTextSourceDefaults;
  result = -[SXTextSourceDefaults init](&v3, sel_init);
  if (result)
    result->_fontSize = 18.0;
  return result;
}

@end
