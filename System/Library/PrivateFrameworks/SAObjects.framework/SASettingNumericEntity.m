@implementation SASettingNumericEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("NumericEntity");
}

+ (id)numericEntity
{
  return objc_alloc_init((Class)a1);
}

@end
