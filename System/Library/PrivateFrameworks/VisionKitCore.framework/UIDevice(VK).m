@implementation UIDevice(VK)

+ (BOOL)vk_isiPad
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

+ (uint64_t)vk_isSmalliPhone
{
  unsigned int v0;

  v0 = MGGetSInt32Answer();
  return (v0 < 6) & (0x26u >> v0);
}

+ (BOOL)vk_isiPhone
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

+ (BOOL)vk_isPlusiPhone
{
  return MGGetSInt32Answer() == 9;
}

+ (BOOL)vk_isLargeiPad
{
  return MGGetSInt32Answer() == 11;
}

+ (uint64_t)vk_isCatalyst
{
  return 0;
}

@end
