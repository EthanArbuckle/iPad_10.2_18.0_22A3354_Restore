@implementation _UIBackdropViewSettingsLightEmojiKeyboard

- (BOOL)_shouldUseDarkeningTintLayer
{
  return 0;
}

- (id)_defaultColorTintColorWithOpacity:(double)a3
{
  double v5;
  double v6;
  double v7;

  if (-[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 40
    || -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality") == 10)
  {
    v5 = 0.901960784;
    v6 = 0.917647059;
    v7 = 0.937254902;
  }
  else
  {
    v5 = 0.949019608;
    v6 = 0.956862745;
    v7 = 0.968627451;
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
