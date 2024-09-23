@implementation SASettingSetMusicInfluence

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetMusicInfluence");
}

+ (id)setMusicInfluence
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
