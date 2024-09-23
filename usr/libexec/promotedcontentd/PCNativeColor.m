@implementation PCNativeColor

- (id)initWithColor:(id)a3
{
  id v4;
  PCNativeColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PCNativeColor *v10;

  v4 = a3;
  if (v4)
  {
    v5 = -[PCNativeColor init](self, "init");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colors"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APPBColor stringsToColorArray:](APPBColor, "stringsToColorArray:", v6));
      -[PCNativeColor setLightModeColors:](v5, "setLightModeColors:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "darkModeColors"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APPBColor stringsToColorArray:](APPBColor, "stringsToColorArray:", v8));
      -[PCNativeColor setDarkModeColors:](v5, "setDarkModeColors:", v9);

      -[PCNativeColor setGradientOrientation:](v5, "setGradientOrientation:", +[APLegacyTypeTranslator directionToGradientOrientation:](APLegacyTypeTranslator, "directionToGradientOrientation:", objc_msgSend(v4, "direction")));
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
