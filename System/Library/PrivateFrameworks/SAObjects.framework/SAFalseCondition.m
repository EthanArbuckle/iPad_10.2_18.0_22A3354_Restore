@implementation SAFalseCondition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("FalseCondition");
}

+ (id)falseCondition
{
  return objc_alloc_init((Class)a1);
}

@end
