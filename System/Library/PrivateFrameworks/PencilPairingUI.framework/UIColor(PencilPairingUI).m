@implementation UIColor(PencilPairingUI)

+ (uint64_t)defaultBottomLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
}

+ (uint64_t)defaultButtonColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

+ (uint64_t)defaultButtonPressedColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
}

+ (id)scratchpadBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6950];
  PencilPairingUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("scratchpad_background_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)toolBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "scratchpadBackgroundColor");
}

+ (id)toastLabelTextColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6950];
  PencilPairingUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("toast_label_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)tuckViewColorTransparencyEnabled:()PencilPairingUI
{
  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)headlineColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (uint64_t)iconTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

+ (uint64_t)coloredButtonTitleColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
}

+ (id)platterContainerColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6950];
  PencilPairingUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("platter_background_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)platterStrokeColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6950];
  PencilPairingUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("platter_stroke_color"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)dimmingViewColorWithAlpha:()PencilPairingUI
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.015625, 0.015625, 0.05859375, a1);
}

+ (id)batteryTextColorLowPower:()PencilPairingUI
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fingerDrawingInkColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)scratchpadFrameColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "platterContainerColor");
}

+ (uint64_t)platterShadowColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

+ (id)batteryBodyColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
