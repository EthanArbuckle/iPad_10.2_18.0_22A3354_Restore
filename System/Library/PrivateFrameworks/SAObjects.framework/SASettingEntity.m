@implementation SASettingEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("Entity");
}

+ (id)entity
{
  return objc_alloc_init((Class)a1);
}

@end
