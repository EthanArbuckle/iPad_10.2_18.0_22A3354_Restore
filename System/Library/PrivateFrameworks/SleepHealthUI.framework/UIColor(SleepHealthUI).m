@implementation UIColor(SleepHealthUI)

+ (id)hkshui_sleepModeButtonSelectedColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  HKSHUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("sleep_control_center_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
