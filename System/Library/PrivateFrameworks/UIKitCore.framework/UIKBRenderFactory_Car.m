@implementation UIKBRenderFactory_Car

- (int64_t)assetIdiom
{
  return 3;
}

- (double)carScale
{
  double v3;
  double v4;
  double result;
  double v6;

  -[UIKBRenderFactory scale](self, "scale");
  v4 = v3;
  result = 2.0;
  if (v4 != 3.0)
  {
    -[UIKBRenderFactory scale](self, "scale", 2.0);
    return fmax(v6, 1.0);
  }
  return result;
}

- (id)dividerColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorCarLightDivider;
  if (!v3)
    v4 = UIKBColorCarDarkDivider;
  v5 = *v4;

  return v5;
}

- (id)enabledKeyColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack_Alpha18;
  if (!v3)
    v4 = UIKBColorWhite_Alpha15;
  v5 = *v4;

  return v5;
}

- (id)activeKeyColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorKeyBlueKeyBackground;
  if (!v3)
    v4 = UIKBColorCarTeal;
  v5 = *v4;

  return v5;
}

- (id)highlightedKeyColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorWhite;
  if (!v3)
    v4 = UIKBColorBlack;
  v5 = *v4;

  return v5;
}

- (double)defaultKeyFontSize
{
  double v2;

  -[UIKBRenderFactory_Car carScale](self, "carScale");
  return 32.0 / v2;
}

- (id)globalKeyImageName
{
  return CFSTR("global.png");
}

- (id)deleteKeyImageName
{
  return CFSTR("delete.png");
}

- (id)deleteOnKeyImageName
{
  return CFSTR("delete-on.png");
}

- (id)shiftKeyImageName
{
  return CFSTR("shift.png");
}

- (id)shiftOnKeyImageName
{
  return CFSTR("shift-on.png");
}

- (id)shiftLockImageName
{
  return CFSTR("shift-lock.png");
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (id)displayContentsForKey:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactory_Car;
  -[UIKBRenderFactory displayContentsForKey:](&v10, sel_displayContentsForKey_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayStringImage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UIKBRenderFactory scale](self, "scale");
    v8 = v7;

    if (v8 == 1.0)
      objc_msgSend(v4, "setForce1xImages:", 1);
  }
  return v4;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBRenderFactory_Car;
  -[UIKBRenderFactory backgroundTraitsForKeyplane:](&v8, sel_backgroundTraitsForKeyplane_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Car dividerColor](self, "dividerColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundGradient:", v6);

  return v4;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "symbolFrame");
  objc_msgSend(v10, "setSymbolFrame:", v6 + 2.0, v8 + 3.0, v7 + -4.0, v9 + -6.0);

}

- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIKBRenderFactory_Car enabledKeyColor](self, "enabledKeyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundGradient:", v5);

  -[UIKBRenderFactory_Car dividerColor](self, "dividerColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayeredBackgroundGradient:", v7);

  objc_msgSend(v8, "setBlurBlending:", 1);
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  __CFString **v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  int v23;
  __CFString **v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  UIKBRenderFactory_Car *v43;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "state") & 0xC;
  v12 = objc_msgSend(v6, "state") & 0x60;
  if (v11)
    -[UIKBRenderFactory_Car activeKeyColor](self, "activeKeyColor");
  else
    -[UIKBRenderFactory_Car enabledKeyColor](self, "enabledKeyColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "lightKeyboard");
    v16 = UIKBColorCarLightShift;
    if (!v15)
      v16 = UIKBColorCarDarkShift;
    v17 = *v16;

    v13 = v17;
  }
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundGradient:", v18);

  -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v6))
  {
    -[UIKBRenderFactory_Car activeKeyColor](self, "activeKeyColor");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_15;
LABEL_14:
    -[UIKBRenderFactory_Car highlightedKeyColor](self, "highlightedKeyColor");
    v25 = objc_claimAutoreleasedReturnValue();

    v21 = (__CFString *)v25;
    goto LABEL_15;
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "lightKeyboard");
  v24 = UIKBColorBlack;
  if (!v23)
    v24 = UIKBColorWhite;
  v21 = *v24;

  if (v11)
    goto LABEL_14;
LABEL_15:
  if (v12)
  {
    -[UIKBRenderFactory_Car dividerColor](self, "dividerColor");
    v26 = objc_claimAutoreleasedReturnValue();

    v21 = (__CFString *)v26;
  }
  -[UIKBRenderFactory_Car displayContentsForKey:](self, "displayContentsForKey:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "displayType"))
    goto LABEL_19;
  objc_msgSend(v27, "displayString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v43 = self;
  v29 = v21;
  v30 = v27;
  v31 = v6;
  v32 = v20;
  v33 = v10;
  v34 = v13;
  v35 = v7;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rangeOfCharacterFromSet:", v36);
  v38 = v37;

  v7 = v35;
  v13 = v34;
  v10 = v33;
  v20 = v32;
  v6 = v31;
  v27 = v30;
  v21 = v29;
  self = v43;

  if (!v38)
  {
LABEL_19:
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFontName:", v39);

  }
  objc_msgSend(v20, "setTextColor:", v21);
  objc_msgSend(v10, "setSymbolStyle:", v20);
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v10, "symbolStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTextOpacity:", 0.35);

  }
  objc_msgSend(v10, "geometry");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Car _customizeGeometry:forKey:contents:onKeyplane:](self, "_customizeGeometry:forKey:contents:onKeyplane:", v41, v6, v27, v7);

  return v10;
}

@end
