@implementation SASettingEnumEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("EnumEntity");
}

+ (id)enumEntity
{
  return objc_alloc_init((Class)a1);
}

@end
