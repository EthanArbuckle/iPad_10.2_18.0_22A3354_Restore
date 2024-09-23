@implementation UIColor(MTAdditions)

+ (id)appTintColor
{
  if ((objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV") & 1) != 0)
    return 0;
  if (appTintColor_onceToken != -1)
    dispatch_once(&appTintColor_onceToken, &__block_literal_global_16);
  objc_msgSend(MEMORY[0x1E0DC3658], "_dynamicColorWithColorsByTraitCollection:", appTintColor_colorsByTraitCollection);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)backgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)unplayedBlueColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.160784314, 0.635294118, 1.0, 1.0);
}

+ (uint64_t)cellSelectedBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
}

+ (id)cellEmpahsisBackgroundColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIColor_MTAdditions__cellEmpahsisBackgroundColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellEmpahsisBackgroundColor_onceToken != -1)
    dispatch_once(&cellEmpahsisBackgroundColor_onceToken, block);
  return (id)cellEmpahsisBackgroundColor_color;
}

+ (id)cellEmpahsisSwitchBorderColor
{
  if (cellEmpahsisSwitchBorderColor_onceToken != -1)
    dispatch_once(&cellEmpahsisSwitchBorderColor_onceToken, &__block_literal_global_7);
  return (id)cellEmpahsisSwitchBorderColor_color;
}

+ (uint64_t)cellSeparatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (uint64_t)cellDetailTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
}

+ (uint64_t)cellTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)cellSecondaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)artworkBorderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.18);
}

+ (uint64_t)goneDarkColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
}

+ (uint64_t)dividerColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
}

+ (uint64_t)cellHighlightedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.91372549, 0.941176471, 0.980392157, 1.0);
}

+ (uint64_t)viewLightBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.959999979, 1.0);
}

+ (uint64_t)viewDarkBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.157000005, 1.0);
}

+ (uint64_t)blueTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.156862751, 0.274509817, 0.450980395, 1.0);
}

+ (uint64_t)markUnplayedBlueColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.137254902, 0.588235294, 0.941176471, 1.0);
}

+ (uint64_t)markPlayedGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.501960784, 0.501960784, 0.501960784, 1.0);
}

- (uint64_t)isBlackColor
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", a1);

  return v3;
}

+ (uint64_t)newEpisodeBackgroundColor
{
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.964705882, 1.0, 1.0);
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newEpisodeBorderColor
{
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.843137255, 0.933333333, 1.0, 1.0);
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)tvGutterDark
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
}

+ (uint64_t)tvGutterLight
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
}

+ (uint64_t)refreshControlTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
}

+ (id)primaryTextColorForDarkBackground:()MTAdditions
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)secondaryTextColorForDarkBackground:()MTAdditions
{
  double v3;
  double v4;

  if ((a3 & 1) != 0)
  {
    v3 = 0.3;
    v4 = 1.0;
  }
  else
  {
    v3 = 0.4;
    v4 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)artworkBorderColorForDarkBackground:()MTAdditions
{
  double v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, 0.18);
}

+ (uint64_t)separatorColorForDarkBackground:()MTAdditions
{
  double v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, 0.2);
}

+ (uint64_t)buttonBackgroundColorForDarkBackground:()MTAdditions
{
  double v3;

  v3 = 0.74;
  if (a3)
    v3 = 0.2;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, 1.0);
}

@end
