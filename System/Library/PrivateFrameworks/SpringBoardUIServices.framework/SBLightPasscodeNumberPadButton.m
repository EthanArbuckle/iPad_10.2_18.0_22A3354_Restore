@implementation SBLightPasscodeNumberPadButton

- (id)initForCharacter:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBLightPasscodeNumberPadButton;
  v3 = -[TPNumberPadButton initForCharacter:](&v15, sel_initForCharacter_, a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "revealingRingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColorInsideRing:", v6);

    objc_msgSend(v4, "revealingRingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColorOutsideRing:", v8);

    objc_msgSend(v4, "revealingRingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRevealAnimationDuration:", 0.0);

    objc_msgSend(v4, "revealingRingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnrevealAnimationDuration:", 0.392500013);

    objc_msgSend(v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v11, "disableUpdateMask");

    v12 = v8 | 0x10;
    objc_msgSend(v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDisableUpdateMask:", v12);

  }
  return v4;
}

- (int)characterType
{
  return +[SBPasscodeNumberPadButton _characterTypeForCharacter:](SBPasscodeNumberPadButton, "_characterTypeForCharacter:", -[TPNumberPadButton character](self, "character"));
}

- (id)stringCharacter
{
  return +[SBPasscodeNumberPadButton _stringCharacterForCharacter:](SBPasscodeNumberPadButton, "_stringCharacterForCharacter:", -[TPNumberPadButton character](self, "character"));
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  +[SBPasscodeNumberPadButton defaultSize](SBPasscodeNumberPadButton, "defaultSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)paddingOutsideRing
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  +[SBPasscodeNumberPadButton paddingOutsideRing](SBPasscodeNumberPadButton, "paddingOutsideRing");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)_numberPadButtonOuterCircleDiameter
{
  double result;

  +[SBPasscodeNumberPadButton _numberPadButtonOuterCircleDiameter](SBPasscodeNumberPadButton, "_numberPadButtonOuterCircleDiameter");
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 0;
}

- (void)setReduceTransparencyButtonColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_reduceTransparencyButtonColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, a3);
    -[TPNumberPadButton setColor:](self, "setColor:", self->_reduceTransparencyButtonColor);
    v5 = v6;
  }

}

+ (double)unhighlightedCircleViewAlpha
{
  int v2;
  double result;

  v2 = objc_msgSend(a1, "_shouldUseAlternativeCirlceViewAlphas");
  result = 0.1;
  if (v2)
    return 0.47;
  return result;
}

+ (double)highlightedCircleViewAlpha
{
  int v2;
  double result;

  v2 = objc_msgSend(a1, "_shouldUseAlternativeCirlceViewAlphas");
  result = 0.3;
  if (v2)
    return 0.9;
  return result;
}

- (UIColor)reduceTransparencyButtonColor
{
  return self->_reduceTransparencyButtonColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, 0);
}

@end
