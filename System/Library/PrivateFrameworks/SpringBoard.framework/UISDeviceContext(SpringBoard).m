@implementation UISDeviceContext(SpringBoard)

+ (id)sb_defaultContext
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC5BD0], "defaultContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  SBHScreenTypeForCurrentDevice();
  SBHDisplayCornerRadiusForScreenType();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDeviceInfoValue:forKey:", v1, *MEMORY[0x1E0DC5CC0]);

  return v0;
}

@end
