@implementation UIColor(Battery)

+ (id)hkshui_batteryColorForFillFraction:()Battery
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if (v5)
  {
    objc_msgSend(a1, "hkshui_lowPowerModeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 <= 0.200000003)
      objc_msgSend(a1, "hkshui_lowBatteryColor");
    else
      objc_msgSend(a1, "hkshui_normalBatteryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (uint64_t)hkshui_normalBatteryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

+ (uint64_t)hkshui_lowBatteryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (uint64_t)hkshui_lowPowerModeColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

@end
