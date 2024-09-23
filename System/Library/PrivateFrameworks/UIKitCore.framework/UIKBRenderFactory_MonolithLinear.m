@implementation UIKBRenderFactory_MonolithLinear

- (double)pillControlKeyFontSize
{
  return 20.0;
}

- (double)pillControlKeyHeight
{
  return 64.0;
}

- (id)pillControlKeyPillBackgroundColor
{
  void *v2;
  void *v3;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _labelColorSecondary(objc_msgSend(v2, "lightKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)pillControlKeyFocusIncreaseSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIKBRenderFactory_Monolith letterKeyFocusIncreaseSize](self, "letterKeyFocusIncreaseSize");
  v3 = 15.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)forceVariantsInsideKeyplane
{
  return 1;
}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(a4, "interactionType") == 15)
  {
    objc_msgSend(v12, "displayFrame");
    v7 = v6;
    -[UIKBRenderFactory_MonolithLinear pillControlKeyHeight](self, "pillControlKeyHeight");
    v9 = (v7 - v8) * 0.5;
    objc_msgSend(v12, "displayFrame");
    objc_msgSend(v12, "setDisplayFrame:", v10 + 0.0, v11 + v9);
  }

}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  v7 = a4;
  -[UIKBRenderFactory_Monolith configureSymbolStyle:forControlKey:](&v9, sel_configureSymbolStyle_forControlKey_, v6, v7);
  v8 = objc_msgSend(v7, "interactionType", v9.receiver, v9.super_class);

  if (v8 == 15)
  {
    -[UIKBRenderFactory_MonolithLinear pillControlKeyFontSize](self, "pillControlKeyFontSize");
    objc_msgSend(v6, "setFontSize:");
  }

}

- (id)_enabledTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  v4 = a3;
  -[UIKBRenderFactory_Monolith _enabledTraitsForControlKey:](&v14, sel__enabledTraitsForControlKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if ((v6 - 9) >= 2)
  {
    if (v6 == 15)
    {
      -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
      v8 = v7;
      objc_msgSend(v5, "geometry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRoundRectRadius:", v8);

      -[UIKBRenderFactory_MonolithLinear pillControlKeyPillBackgroundColor](self, "pillControlKeyPillBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundGradient:", v11);

      objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B18);
      objc_msgSend(v5, "symbolStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", CFSTR("UIKBColorBlack"));

      objc_msgSend(v5, "setBlendForm:", 4);
    }
  }
  else
  {
    objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B00);
  }
  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  v4 = a3;
  -[UIKBRenderFactory_Monolith _highlightedTraitsForControlKey:](&v14, sel__highlightedTraitsForControlKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 15)
  {
    -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
    v8 = v7;
    objc_msgSend(v5, "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRoundRectRadius:", v8);

    -[UIKBRenderFactory_Monolith highlightedTextColor](self, "highlightedTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundGradient:", v11);

    objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B30);
    objc_msgSend(v5, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", CFSTR("UIKBColorBlack"));

    objc_msgSend(v5, "setBlendForm:", 4);
    -[UIKBRenderFactory_MonolithLinear pillControlKeyFocusIncreaseSize](self, "pillControlKeyFocusIncreaseSize");
    objc_msgSend(v5, "setFloatingContentViewFocusedIncreaseSize:");
  }
  return v5;
}

@end
