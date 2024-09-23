@implementation UIColor(TelephonyUI)

+ (uint64_t)dynamicSecondaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (uint64_t)dynamicLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (uint64_t)dynamicTertiaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_tertiaryLabelColor");
}

+ (uint64_t)dynamicBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
}

+ (id)_tp_greenPillColor
{
  double v0;
  double v1;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v0 = 0.411764706;
    v1 = 0.137254902;
  }
  else
  {
    v0 = 0.8;
    v1 = 0.278431373;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, v0, v1, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_tp_bluePillColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)dynamicQuaternaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_quaternaryLabelColor");
}

+ (uint64_t)dynamicCarPrimaryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemPrimaryColor");
}

+ (uint64_t)dynamicCarSecondaryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemSecondaryColor");
}

+ (uint64_t)dynamicCarTertiaryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemTertiaryColor");
}

+ (uint64_t)dynamicCarQuaternaryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (uint64_t)dynamicCarFocusedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
}

+ (uint64_t)dynamicCarFocusedLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (uint64_t)dynamicCarFocusedPrimaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusPrimaryColor");
}

+ (uint64_t)dynamicCarFocusedSecondaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusSecondaryColor");
}

@end
