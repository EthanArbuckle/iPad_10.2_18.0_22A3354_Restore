@implementation SATrueCondition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("TrueCondition");
}

+ (id)trueCondition
{
  return objc_alloc_init((Class)a1);
}

@end
