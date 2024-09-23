@implementation WFColor(Trigger)

+ (id)batteryOutlineColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0DC79F8];
  v1 = (void *)MEMORY[0x1E0CB34D0];
  NSClassFromString(CFSTR("WFTrigger"));
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:", CFSTR("BatteryTriggerIconOutlineColor"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
