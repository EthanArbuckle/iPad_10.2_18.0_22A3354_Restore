@implementation UIKBRenderFactory_Monolith

- (int64_t)assetIdiom
{
  return 2;
}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactory_Monolith;
  -[UIKBRenderFactory displayContentsForKey:](&v12, sel_displayContentsForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "interactionType") == 4)
  {
    objc_msgSend(v5, "setDisplayPathType:", 2);
    v6 = CFSTR("delete.left.fill");
LABEL_3:
    objc_msgSend(v5, "setDisplayStringImage:", v6);
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "interactionType") == 9
    && (objc_msgSend(v4, "localizationKey"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v5, "setDisplayStringImage:", 0);
    objc_msgSend(v4, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayString:", v8);

  }
  else if (objc_msgSend(v4, "interactionType") == 10
         && (objc_msgSend(v4, "displayString"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("shift-symbol")),
             v9,
             v10))
  {
    objc_msgSend(v5, "setDisplayPathType:", 1);
    objc_msgSend(v5, "setDisplayStringImage:", CFSTR("shift"));
    objc_msgSend(v5, "setDisplayString:", 0);
  }
  else if (objc_msgSend(v4, "interactionType") == 43)
  {
    objc_msgSend(v5, "setDisplayString:", 0);
    v6 = CFSTR("chevron.down");
    goto LABEL_3;
  }
LABEL_12:
  if (objc_msgSend(v4, "state") == 16)
    objc_msgSend(v5, "setDisplayString:", 0);

  return v5;
}

- (id)enabledTextColor
{
  void *v2;
  void *v3;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _labelColorSecondary(objc_msgSend(v2, "lightKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeTextColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack;
  if (!v3)
    v4 = UIKBColorWhite;
  v5 = *v4;

  return v5;
}

- (id)highlightedTextColor
{
  return CFSTR("UIKBColorBlack");
}

- (id)disabledTextColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack_Alpha30;
  if (!v3)
    v4 = UIKBColorWhite_Alpha30;
  v5 = *v4;

  return v5;
}

- (id)keyplaneSwitcherDividerColor
{
  void *v2;
  int v3;
  int v4;
  __CFString **v5;
  __CFString **v6;
  __CFString *v7;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = _AXDarkenSystemColors();
  v5 = UIKBColorBlack_Alpha60;
  if (!v4)
    v5 = UIKBColorBlack_Alpha40;
  v6 = UIKBColorWhite_Alpha75;
  if (!v4)
    v6 = UIKBColorWhite_Alpha30;
  if (!v3)
    v5 = v6;
  v7 = *v5;

  return v7;
}

- (id)keyplaneSwitcherBackgroundColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack_Alpha20;
  if (!v3)
    v4 = UIKBColorWhite_Alpha20;
  v5 = *v4;

  return v5;
}

- (id)variantPlatterBackgroundColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorKeyPopupSolidLightBackground;
  if (!v3)
    v4 = UIKBColorKeyPopupSolidDarkBackground;
  v5 = *v4;

  return v5;
}

- (id)highlightedVariantBackgroundColor
{
  return CFSTR("UIKBColorWhite_Alpha90");
}

- (double)letterKeyFontSize
{
  return 48.0;
}

- (double)letterKeySecondaryFontSize
{
  return 26.0;
}

- (double)letterKeyFontWeight
{
  _BOOL4 v2;
  double *v3;

  v2 = -[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled");
  v3 = (double *)off_1E167DC50;
  if (!v2)
    v3 = (double *)off_1E167DC70;
  return *v3;
}

- (double)letterKeyTwoLineFontSize
{
  return 24.0;
}

- (double)letterKeyTwoLineFontWeight
{
  _BOOL4 v2;
  double *v3;

  v2 = -[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled");
  v3 = (double *)off_1E167DC50;
  if (!v2)
    v3 = (double *)off_1E167DC78;
  return *v3;
}

- (double)controlKeyFontSize
{
  return 29.0;
}

- (double)controlKeyFontWeight
{
  _BOOL4 v2;
  double *v3;

  v2 = -[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled");
  v3 = (double *)off_1E167DC50;
  if (!v2)
    v3 = (double *)off_1E167DC68;
  return *v3;
}

- (double)controlKeyRectCornerRadius
{
  return 7.0;
}

- (double)tldKeyFontSize
{
  return 29.0;
}

- (double)tldKeyFontWeight
{
  _BOOL4 v2;
  double *v3;

  v2 = -[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled");
  v3 = (double *)off_1E167DC50;
  if (!v2)
    v3 = (double *)off_1E167DC68;
  return *v3;
}

- (CGSize)letterKeyFocusIncreaseSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 12.0;
  v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)keyRectCornerRadius
{
  return 12.0;
}

- (double)shadowVerticalOffset
{
  return 10.0;
}

- (double)shadowRadius
{
  return 10.0;
}

- (double)shadowOpacity
{
  return 0.15;
}

- (id)shadowColorString
{
  return CFSTR("UIKBColorBlack_Alpha15");
}

- (double)variantPlatterCornerRadius
{
  return 8.0;
}

- (double)variantKeyWidth
{
  return 54.0;
}

- (double)variantKeyHeight
{
  return 64.0;
}

- (double)variantKeyFocusIncrease
{
  return 1.0;
}

- (double)variantKeyFocusRectRadius
{
  return 8.0;
}

- (BOOL)forceVariantsInsideKeyplane
{
  return 0;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactory_Monolith;
  -[UIKBRenderFactory backgroundTraitsForKeyplane:](&v4, sel_backgroundTraitsForKeyplane_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGPoint)_textOffsetForKey:(id)a3
{
  id v3;
  int v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType");
  v5 = 0.0;
  if (v4 > 14)
  {
    v11 = 1.0;
    if (v4 == 15 || v4 == 23)
      goto LABEL_15;
  }
  else
  {
    if ((v4 - 1) < 2)
    {
      if (qword_1ECD7ED50 != -1)
        dispatch_once(&qword_1ECD7ED50, &__block_literal_global_324);
      objc_msgSend(v3, "displayString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeOfCharacterFromSet:", _MergedGlobals_1116);
      v8 = v7;

      objc_msgSend(v3, "displayString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v8 == v10)
        v11 = 1.0;
      else
        v11 = 4.0;
      goto LABEL_15;
    }
    if (v4 == 10)
    {
      v11 = 2.0;
      if (objc_msgSend(v3, "displayType") != 4)
        goto LABEL_15;
    }
  }
  v11 = 8.0;
  if (objc_msgSend(v3, "displayType") != 31)
  {
    v5 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
LABEL_15:

  v12 = v5;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_secondaryTextOffsetForKey:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") == 34)
  {
    v4 = 26.0;
    v5 = 15.0;
  }
  else if (objc_msgSend(v3, "displayType") == 31)
  {
    v4 = -7.0;
    v5 = 8.0;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v6 = v5;
  v7 = v4;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)_enabledTraitsForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith enabledTextColor](self, "enabledTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSymbolStyle:", v8);

  objc_msgSend(v6, "symbolStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFontName:", CFSTR("UIKBRenderFactorySystemFontName"));

  -[UIKBRenderFactory_Monolith enabledTextColor](self, "enabledTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "symbolStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[UIKBRenderFactory_Monolith keyRectCornerRadius](self, "keyRectCornerRadius");
  v13 = v12;
  objc_msgSend(v6, "geometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRoundRectRadius:", v13);

  objc_msgSend(v6, "geometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRoundRectCorners:", -1);

  return v6;
}

- (id)_highlightedTraitsForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKBRenderFactory_Monolith _enabledTraitsForKey:](self, "_enabledTraitsForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFontName:", CFSTR("UIKBRenderFactorySystemFontName"));

  -[UIKBRenderFactory_Monolith highlightedTextColor](self, "highlightedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(v4, "setBlurBlending:", 1);
  -[UIKBRenderFactory_Monolith keyRectCornerRadius](self, "keyRectCornerRadius");
  objc_msgSend(v4, "setFloatingContentViewCornerRadius:");
  -[UIKBRenderFactory_Monolith letterKeyFocusIncreaseSize](self, "letterKeyFocusIncreaseSize");
  objc_msgSend(v4, "setFloatingContentViewFocusedIncreaseSize:");
  -[UIKBRenderFactory_Monolith shadowVerticalOffset](self, "shadowVerticalOffset");
  objc_msgSend(v4, "setFloatingContentViewShadowVerticalOffset:");
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  objc_msgSend(v4, "setFloatingContentViewShadowRadius:");
  -[UIKBRenderFactory_Monolith shadowOpacity](self, "shadowOpacity");
  objc_msgSend(v4, "setFloatingContentViewShadowOpacity:");
  return v4;
}

- (id)_activeTraitsForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRenderFactory_Monolith _enabledTraitsForKey:](self, "_enabledTraitsForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith activeTextColor](self, "activeTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  return v4;
}

- (id)_disabledTraitsForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRenderFactory_Monolith _enabledTraitsForKey:](self, "_enabledTraitsForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith disabledTextColor](self, "disabledTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  return v4;
}

- (void)configureSymbolStyles:(id)a3 forLetterKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "symbolStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "displayType") == 34)
  {
    -[UIKBRenderFactory_Monolith letterKeyFontWeight](self, "letterKeyFontWeight");
    objc_msgSend(v8, "setFontWeight:");
    -[UIKBRenderFactory_Monolith letterKeyFontSize](self, "letterKeyFontSize");
    objc_msgSend(v8, "setFontSize:");
    -[UIKBRenderFactory_Monolith _textOffsetForKey:](self, "_textOffsetForKey:", v7);
    objc_msgSend(v8, "setTextOffset:");
    v9 = (void *)objc_msgSend(v8, "copy");
    -[UIKBRenderFactory_Monolith letterKeySecondaryFontSize](self, "letterKeySecondaryFontSize");
    objc_msgSend(v9, "setFontSize:");
    -[UIKBRenderFactory_Monolith _secondaryTextOffsetForKey:](self, "_secondaryTextOffsetForKey:", v7);
    objc_msgSend(v9, "setTextOffset:");
    v14[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = (void **)v14;
LABEL_5:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondarySymbolStyles:", v12);

    goto LABEL_10;
  }
  if (objc_msgSend(v7, "displayType") == 31)
  {
    -[UIKBRenderFactory_Monolith letterKeyTwoLineFontWeight](self, "letterKeyTwoLineFontWeight");
    objc_msgSend(v8, "setFontWeight:");
    -[UIKBRenderFactory_Monolith letterKeyTwoLineFontSize](self, "letterKeyTwoLineFontSize");
    objc_msgSend(v8, "setFontSize:");
    -[UIKBRenderFactory_Monolith _textOffsetForKey:](self, "_textOffsetForKey:", v7);
    objc_msgSend(v8, "setTextOffset:");
    v9 = (void *)objc_msgSend(v8, "copy");
    -[UIKBRenderFactory_Monolith letterKeyTwoLineFontSize](self, "letterKeyTwoLineFontSize");
    objc_msgSend(v9, "setFontSize:");
    -[UIKBRenderFactory_Monolith _secondaryTextOffsetForKey:](self, "_secondaryTextOffsetForKey:", v7);
    objc_msgSend(v9, "setTextOffset:");
    v13 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v13;
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "displayType") == 27)
  {
    -[UIKBRenderFactory_Monolith tldKeyFontWeight](self, "tldKeyFontWeight");
    objc_msgSend(v8, "setFontWeight:");
    -[UIKBRenderFactory_Monolith tldKeyFontSize](self, "tldKeyFontSize");
  }
  else
  {
    -[UIKBRenderFactory_Monolith letterKeyFontWeight](self, "letterKeyFontWeight");
    objc_msgSend(v8, "setFontWeight:");
    -[UIKBRenderFactory_Monolith letterKeyFontSize](self, "letterKeyFontSize");
  }
  objc_msgSend(v8, "setFontSize:");
  -[UIKBRenderFactory_Monolith _textOffsetForKey:](self, "_textOffsetForKey:", v7);
  objc_msgSend(v8, "setTextOffset:");
LABEL_10:

}

- (id)_enabledTraitsForLetterKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _enabledTraitsForKey:](self, "_enabledTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyles:forLetterKey:](self, "configureSymbolStyles:forLetterKey:", v5, v4);

  return v5;
}

- (id)_highlightedTraitsForLetterKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _highlightedTraitsForKey:](self, "_highlightedTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyles:forLetterKey:](self, "configureSymbolStyles:forLetterKey:", v5, v4);

  return v5;
}

- (id)_activeTraitsForLetterKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _activeTraitsForKey:](self, "_activeTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyles:forLetterKey:](self, "configureSymbolStyles:forLetterKey:", v5, v4);

  return v5;
}

- (id)_disabledTraitsForLetterKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _disabledTraitsForKey:](self, "_disabledTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyles:forLetterKey:](self, "configureSymbolStyles:forLetterKey:", v5, v4);

  return v5;
}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v6;
  int v7;
  void *v8;
  int v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "interactionType");
  if (v7 == 10)
  {
    objc_msgSend(v6, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("shift-symbol"));

    if (v9)
    {
      -[UIKBRenderFactory scale](self, "scale");
      v11 = v10 == 2.0;
      v12 = 0.0;
      if (!v11)
        v12 = *MEMORY[0x1E0C9D538];
      v13 = -0.5;
      if (!v11)
        v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v14, "setTextOffset:", v12, v13, *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
    goto LABEL_10;
  }
  if (v7 != 4)
  {
LABEL_10:
    -[UIKBRenderFactory_Monolith controlKeyFontWeight](self, "controlKeyFontWeight");
    objc_msgSend(v14, "setFontWeight:");
    -[UIKBRenderFactory_Monolith controlKeyFontSize](self, "controlKeyFontSize");
    objc_msgSend(v14, "setFontSize:");
    -[UIKBRenderFactory_Monolith _textOffsetForKey:](self, "_textOffsetForKey:", v6);
    objc_msgSend(v14, "setTextOffset:");
    objc_msgSend(v14, "setUsesSymbolImage:", 1);
    goto LABEL_11;
  }
  -[UIKBRenderFactory_Monolith controlKeyFontWeight](self, "controlKeyFontWeight");
  objc_msgSend(v14, "setFontWeight:");
  -[UIKBRenderFactory_Monolith deleteKeyFontSize](self, "deleteKeyFontSize");
  objc_msgSend(v14, "setFontSize:");
  -[UIKBRenderFactory_Monolith _textOffsetForKey:](self, "_textOffsetForKey:", v6);
  objc_msgSend(v14, "setTextOffset:");
  objc_msgSend(v14, "setUsesSymbolImage:", 1);
  objc_msgSend(v14, "setSymbolScale:", 1);
LABEL_11:

}

- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "intForProperty:", CFSTR("popup-bias"));
  switch(v7)
  {
    case 2:
      v8 = 0;
      goto LABEL_7;
    case 21:
      v8 = 5;
      goto LABEL_7;
    case 29:
      v8 = 10;
LABEL_7:
      objc_msgSend(v9, "setRoundRectCorners:", v8);
      break;
  }
  if (objc_msgSend(v6, "interactionType") == 10 || objc_msgSend(v6, "interactionType") == 9)
  {
    -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
    objc_msgSend(v9, "setRoundRectRadius:");
  }

}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "symbolFrame");
  objc_msgSend(v7, "setSymbolFrame:", v4 + 12.0, v6 + 0.0, v5 + -24.0);

}

- (id)_enabledTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _enabledTraitsForKey:](self, "_enabledTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureGeometry:forControlKey:](self, "configureGeometry:forControlKey:", v6, v4);

  -[UIKBRenderFactory_Monolith keyplaneSwitcherBackgroundColor](self, "keyplaneSwitcherBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundGradient:", v8);

  -[UIKBRenderFactory_Monolith enabledTextColor](self, "enabledTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "symbolStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  if (objc_msgSend(v4, "interactionType") - 9 >= 2)
    v11 = &unk_1E1A93AE8;
  else
    v11 = &unk_1E1A93AD0;
  objc_msgSend(v5, "setRenderFlags:", v11);
  v12 = objc_msgSend(v4, "intForProperty:", CFSTR("popup-bias"));
  if (v12 == 29 || v12 == 2)
  {
    -[UIKBRenderFactory_Monolith keyplaneSwitcherDividerColor](self, "keyplaneSwitcherDividerColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v14, 2, 0.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addRenderEffect:", v15);
  }
  objc_msgSend(v5, "geometry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureCornersOnGeometry:forKey:](self, "configureCornersOnGeometry:forKey:", v16, v4);

  objc_msgSend(v5, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyle:forControlKey:](self, "configureSymbolStyle:forControlKey:", v17, v4);

  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIKBRenderFactory_Monolith _highlightedTraitsForKey:](self, "_highlightedTraitsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureGeometry:forControlKey:](self, "configureGeometry:forControlKey:", v6, v4);

  objc_msgSend(v5, "symbolStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith configureSymbolStyle:forControlKey:](self, "configureSymbolStyle:forControlKey:", v7, v4);

  return v5;
}

- (id)_activeTraitsForControlKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRenderFactory_Monolith _enabledTraitsForControlKey:](self, "_enabledTraitsForControlKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith activeTextColor](self, "activeTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  return v4;
}

- (id)_disabledTraitsForControlKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRenderFactory_Monolith _enabledTraitsForControlKey:](self, "_enabledTraitsForControlKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith disabledTextColor](self, "disabledTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  return v4;
}

- (id)_variantTraitsForLetterKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double MinX;
  double v65;
  double v66;
  double MaxX;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t i;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  uint64_t v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v134 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "paddedFrame");
  v126 = v8;
  v121 = v10;
  v122 = v9;
  v12 = v11;
  objc_msgSend(v6, "subtrees");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentInputMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isDefaultRightToLeft");

  objc_msgSend(v6, "subtrees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObjectPassingTest:", &__block_literal_global_45_0);

  objc_msgSend(v6, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBRenderFactory_Monolith variantKeyWidth](self, "variantKeyWidth");
  v23 = v22;
  -[UIKBRenderFactory_Monolith variantKeyFocusIncrease](self, "variantKeyFocusIncrease");
  v25 = v23 + v24 + v24;
  -[UIKBRenderFactory_Monolith variantKeyHeight](self, "variantKeyHeight");
  v27 = v26;
  -[UIKBRenderFactory_Monolith variantKeyFocusIncrease](self, "variantKeyFocusIncrease");
  v29 = v27 + v28 + v28;
  objc_msgSend(v6, "paddedFrame");
  v31 = (v30 - v25) * 0.5;
  objc_msgSend(v6, "paddedFrame");
  v33 = (v32 - v29) * 0.5;
  objc_msgSend(v21, "paddedFrame");
  objc_msgSend(v21, "setPaddedFrame:", v34 + v31, v36 + v33, v35 - (v31 + v31), v37 - (v33 + v33));
  v38 = 0.0;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    v39 = 0;
  else
    v39 = -1;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIKBRenderFactory_Monolith variantKeyWidth](self, "variantKeyWidth");
    v38 = -v40;
  }
  -[UIKBRenderFactory_Monolith variantKeyWidth](self, "variantKeyWidth");
  v42 = -(v41 * (double)(v14 + v39 - 1));
  objc_msgSend(v21, "paddedFrame");
  if (v17)
    v46 = v42;
  else
    v46 = v38;
  objc_msgSend(v21, "setPaddedFrame:", v46 + v43, v44 + 0.0, v45 - (v38 + v42));
  objc_msgSend(v21, "paddedFrame");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  v56 = v55;
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  v58 = v57;
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  v60 = v59;
  -[UIKBRenderFactory_Monolith shadowVerticalOffset](self, "shadowVerticalOffset");
  v62 = -(v60 + v61);
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  objc_msgSend(v21, "setDisplayFrame:", v48 - v63, v50 - v56, v52 - (-v63 - v58), v54 - (v62 - v56));
  -[UIKBRenderFactory_Monolith variantPlatterCornerRadius](self, "variantPlatterCornerRadius");
  objc_msgSend(v21, "setRoundRectRadius:");
  objc_msgSend(v21, "setRoundRectCorners:", -1);
  if (-[UIKBRenderFactory_Monolith forceVariantsInsideKeyplane](self, "forceVariantsInsideKeyplane"))
  {
    if (v17)
    {
      objc_msgSend(v7, "frame");
      MinX = CGRectGetMinX(v135);
      objc_msgSend(v21, "displayFrame");
      v65 = MinX - CGRectGetMinX(v136);
      if (v65 <= 0.0)
        goto LABEL_16;
      v126 = v126 + v65;
      v66 = -v65;
    }
    else
    {
      objc_msgSend(v21, "displayFrame");
      MaxX = CGRectGetMaxX(v137);
      objc_msgSend(v7, "frame");
      v66 = MaxX - CGRectGetMaxX(v138);
      if (v66 <= 0.0)
        goto LABEL_16;
      v126 = v126 - v66;
      v65 = -v66;
    }
    objc_msgSend(v21, "applyInsets:", 0.0, v65, 0.0, v66);
  }
LABEL_16:
  v124 = v7;
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v21);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith variantPlatterBackgroundColor](self, "variantPlatterBackgroundColor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBackgroundGradient:", v70);

  -[UIKBRenderFactory_Monolith shadowVerticalOffset](self, "shadowVerticalOffset");
  v72 = v71;
  -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
  +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha25"), 0.0, v72, 0.0, 0.0, 0.0, 0.0, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v68;
  objc_msgSend(v68, "addRenderEffect:", v74);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith variantKeyWidth](self, "variantKeyWidth");
  if (v17)
    v76 = -v76;
  v128 = v76;
  -[UIKBRenderFactory_Monolith variantKeyWidth](self, "variantKeyWidth");
  v78 = v77;
  -[UIKBRenderFactory_Monolith variantKeyFocusIncrease](self, "variantKeyFocusIncrease");
  v80 = v79;
  -[UIKBRenderFactory_Monolith variantKeyHeight](self, "variantKeyHeight");
  v82 = v81;
  -[UIKBRenderFactory_Monolith variantKeyFocusIncrease](self, "variantKeyFocusIncrease");
  v84 = v83;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v125 = v6;
  objc_msgSend(v6, "subtrees");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
  if (v86)
  {
    v87 = v86;
    v88 = (v12 - v78 - v80) * 0.5;
    v89 = (v121 - v82 - v84) * 0.5;
    v127 = v12 - (v88 + v88);
    v90 = v122 + v89;
    v91 = v121 - (v89 + v89);
    v92 = v128;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      v92 = 0.0;
    v93 = v126 - v92 + v88;
    v94 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v130 != v94)
          objc_enumerationMutation(v85);
        v96 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v93, v90, v127, v91, v93, v90, v127, v91);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBRenderFactory_Monolith variantPlatterCornerRadius](self, "variantPlatterCornerRadius");
        objc_msgSend(v97, "setRoundRectRadius:");
        objc_msgSend(v97, "setRoundRectCorners:", -1);
        objc_msgSend(v97, "paddedFrame");
        v99 = v98;
        v101 = v100;
        v103 = v102;
        v105 = v104;
        -[UIKBRenderFactory_Monolith variantKeyFocusIncrease](self, "variantKeyFocusIncrease");
        v107 = v106 + v99;
        v108 = v103 - v106 - v106;
        v109 = v106 + v101;
        v110 = v105 - v106 - v106;
        if (objc_msgSend(v96, "interactionType") == 2)
          v111 = v109 + 3.0;
        else
          v111 = v109;
        objc_msgSend(v97, "setSymbolFrame:", v107, v111, v108, v110);
        objc_msgSend(v75, "addObject:", v97);
        v93 = v128 + v93;

      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
    }
    while (v87);
  }

  objc_msgSend(v123, "setVariantGeometries:", v75);
  -[UIKBRenderFactory_Monolith letterKeyFontSize](self, "letterKeyFontSize");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", CFSTR("UIKBRenderFactorySystemFontName"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith letterKeyFontWeight](self, "letterKeyFontWeight");
  objc_msgSend(v112, "setFontWeight:");
  -[UIKBRenderFactory_Monolith variantTextColor](self, "variantTextColor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setTextColor:", v113);

  objc_msgSend(v112, "setUsesSymbolImage:", 1);
  objc_msgSend(v112, "setSymbolScale:", 1);
  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v112);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setVariantTraits:", v114);

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v112);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory_Monolith highlightedVariantTextColor](self, "highlightedVariantTextColor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "symbolStyle");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setTextColor:", v116);

  -[UIKBRenderFactory_Monolith highlightedVariantBackgroundColor](self, "highlightedVariantBackgroundColor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setLayeredForegroundGradient:", v119);

  objc_msgSend(v123, "setHighlightedVariantTraits:", v115);
  return v123;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "interactionType") == 10
    || objc_msgSend(v6, "interactionType") == 9
    || objc_msgSend(v6, "interactionType") == 23
    || objc_msgSend(v6, "interactionType") == 15
    || objc_msgSend(v6, "interactionType") == 4
    || objc_msgSend(v6, "interactionType") == 43;
  v9 = objc_msgSend(v6, "state");
  v10 = 0;
  switch(v9)
  {
    case 1:
      if (v8)
        -[UIKBRenderFactory_Monolith _disabledTraitsForControlKey:](self, "_disabledTraitsForControlKey:", v6);
      else
        -[UIKBRenderFactory_Monolith _disabledTraitsForLetterKey:](self, "_disabledTraitsForLetterKey:", v6);
      goto LABEL_17;
    case 2:
      if (!v8)
        goto LABEL_20;
      -[UIKBRenderFactory_Monolith _enabledTraitsForControlKey:](self, "_enabledTraitsForControlKey:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_27;
    case 4:
      if (objc_msgSend(v6, "interactionType") != 10)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Only keyplane switcher keys can get active key state on tvOS.", buf, 2u);
          }

        }
        else
        {
          v13 = _traitsForKey_onKeyplane____s_category;
          if (!_traitsForKey_onKeyplane____s_category)
          {
            v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v13, (unint64_t *)&_traitsForKey_onKeyplane____s_category);
          }
          v14 = *(NSObject **)(v13 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Only keyplane switcher keys can get active key state on tvOS.", v16, 2u);
          }
        }
      }
      -[UIKBRenderFactory_Monolith _activeTraitsForControlKey:](self, "_activeTraitsForControlKey:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      if (v8)
        -[UIKBRenderFactory_Monolith _highlightedTraitsForControlKey:](self, "_highlightedTraitsForControlKey:", v6);
      else
        -[UIKBRenderFactory_Monolith _highlightedTraitsForLetterKey:](self, "_highlightedTraitsForLetterKey:", v6);
      goto LABEL_17;
    default:
      if (v9 != 20 && v9 != 16)
        goto LABEL_27;
      if (objc_msgSend(v6, "interactionType") == 3)
      {
LABEL_20:
        -[UIKBRenderFactory_Monolith _enabledTraitsForLetterKey:](self, "_enabledTraitsForLetterKey:", v6);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8)
          -[UIKBRenderFactory_Monolith _variantTraitsForControlKey:onKeyplane:](self, "_variantTraitsForControlKey:onKeyplane:", v6, v7);
        else
          -[UIKBRenderFactory_Monolith _variantTraitsForLetterKey:onKeyplane:](self, "_variantTraitsForLetterKey:onKeyplane:", v6, v7);
LABEL_17:
        v11 = objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v10 = (void *)v11;
LABEL_27:

  return v10;
}

@end
