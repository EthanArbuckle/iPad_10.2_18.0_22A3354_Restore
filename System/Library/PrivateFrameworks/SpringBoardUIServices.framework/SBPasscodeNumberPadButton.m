@implementation SBPasscodeNumberPadButton

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
  v15.super_class = (Class)SBPasscodeNumberPadButton;
  v3 = -[TPNumberPadButton initForCharacter:](&v15, sel_initForCharacter_, a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "revealingRingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColorInsideRing:", v6);

    objc_msgSend(v4, "revealingRingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
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

+ (int)_characterTypeForCharacter:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC)
    return 0;
  else
    return dword_1A47AF0B0[a3];
}

- (int)characterType
{
  return objc_msgSend((id)objc_opt_class(), "_characterTypeForCharacter:", -[TPNumberPadButton character](self, "character"));
}

+ (id)_stringCharacterForCharacter:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_stringCharacterForCharacter____onceToken != -1)
    dispatch_once(&_stringCharacterForCharacter____onceToken, &__block_literal_global_17);
  v4 = (void *)_stringCharacterForCharacter____map;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __58__SBPasscodeNumberPadButton__stringCharacterForCharacter___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[12];

  v13[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  v13[1] = CFSTR("2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  v13[2] = CFSTR("3");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v3;
  v13[3] = CFSTR("4");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v4;
  v13[4] = CFSTR("5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v5;
  v13[5] = CFSTR("6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v6;
  v13[6] = CFSTR("7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v7;
  v13[7] = CFSTR("8");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v8;
  v13[8] = CFSTR("9");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[9] = v9;
  v13[9] = CFSTR("0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_stringCharacterForCharacter____map;
  _stringCharacterForCharacter____map = v10;

}

- (id)stringCharacter
{
  return (id)objc_msgSend((id)objc_opt_class(), "_stringCharacterForCharacter:", -[TPNumberPadButton character](self, "character"));
}

+ (BOOL)_isPortrait
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Height;
  CGRect v13;
  CGRect v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  Height = CGRectGetHeight(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  return Height >= CGRectGetWidth(v14);
}

+ (CGSize)defaultSize
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = objc_msgSend(a1, "_isPortrait");
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonOuterCircleDiameter:", v2);
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonPaddingHeight:", v2);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonPaddingWidth");
  v8 = v4 + v7 * 2.0;
  v9 = v4 + v6 * 2.0;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (double)outerCircleDiameter
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(a1, "_isPortrait");
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonOuterCircleDiameter:", v2);
  return result;
}

+ (UIEdgeInsets)paddingOutsideRing
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v2 = objc_msgSend(a1, "_isPortrait");
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonPaddingHeight:", v2);
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonPaddingWidth");
  v6 = v5;
  v7 = v4;
  v8 = v4;
  v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v6;
  result.top = v7;
  return result;
}

+ (double)_numberPadButtonOuterCircleDiameter
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(a1, "_isPortrait");
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonOuterCircleDiameter:", v2);
  return result;
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
  result = 0.15;
  if (v2)
    return 0.47;
  return result;
}

+ (double)highlightedCircleViewAlpha
{
  int v2;
  double result;

  v2 = objc_msgSend(a1, "_shouldUseAlternativeCirlceViewAlphas");
  result = 0.65;
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
