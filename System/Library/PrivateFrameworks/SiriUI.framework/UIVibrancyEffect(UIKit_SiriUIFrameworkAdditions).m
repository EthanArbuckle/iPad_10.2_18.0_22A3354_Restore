@implementation UIVibrancyEffect(UIKit_SiriUIFrameworkAdditions)

+ (id)siriui_platterVibrancyEffect
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.7, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.8, 0.85, 0.95, 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lightVibrantEffectWithBurnColor:darkenColor:compositingColor:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)siriui_userUtteranceEditModeVibrancyEffect
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.3, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.3, 0.3, 0.3, 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lightVibrantEffectWithBurnColor:darkenColor:compositingColor:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
