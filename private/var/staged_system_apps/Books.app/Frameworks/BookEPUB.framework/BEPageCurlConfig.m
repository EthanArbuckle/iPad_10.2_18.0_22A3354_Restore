@implementation BEPageCurlConfig

- (void)setBaseColor:(id)a3
{
  void *v10;
  UIColor *v11;
  UIColor *backColor0;
  UIColor *v13;
  UIColor *backColor1;
  UIColor *v15;
  UIColor *shadowColor;
  id v17;

  v17 = a3;
  objc_storeStrong((id *)&self->_baseColor, a3);
  if ((objc_msgSend(v17, "getRed:green:blue:alpha:", &self->_red, &self->_green, &self->_blue, &self->_alpha) & 1) == 0)
  {
    NSLog(CFSTR("Cannot use this color."));
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->_red = _Q0;
    *(_OWORD *)&self->_blue = _Q0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue(-[BEPageCurlConfig defaults:colorForStrengthKey:opacityKey:](self, "defaults:colorForStrengthKey:opacityKey:", v10, CFSTR("kCurlInputBack0Strength"), CFSTR("kCurlInputBack0Opacity")));
  backColor0 = self->backColor0;
  self->backColor0 = v11;

  v13 = (UIColor *)objc_claimAutoreleasedReturnValue(-[BEPageCurlConfig defaults:colorForStrengthKey:opacityKey:](self, "defaults:colorForStrengthKey:opacityKey:", v10, CFSTR("kCurlInputBack1Strength"), CFSTR("kCurlInputBack1Opacity")));
  backColor1 = self->backColor1;
  self->backColor1 = v13;

  v15 = (UIColor *)objc_claimAutoreleasedReturnValue(-[BEPageCurlConfig defaults:colorForStrengthKey:opacityKey:](self, "defaults:colorForStrengthKey:opacityKey:", v10, CFSTR("kCurlInputShadowStrength"), CFSTR("kCurlInputShadowOpacity")));
  shadowColor = self->shadowColor;
  self->shadowColor = v15;

}

+ (id)shared
{
  if (qword_3C1A28 != -1)
    dispatch_once(&qword_3C1A28, &stru_377B00);
  return (id)qword_3C1A20;
}

- (id)defaults:(id)a3 colorForStrengthKey:(id)a4 opacityKey:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "doubleForKey:", a4);
  v11 = v10;
  objc_msgSend(v9, "doubleForKey:", v8);
  v13 = v12;

  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v11 * self->_red, v11 * self->_green, v11 * self->_blue, v13 * self->_alpha);
}

- (void)applyToFilter:(id)a3
{
  UIColor *backColor0;
  id v5;

  backColor0 = self->backColor0;
  v5 = a3;
  -[BEPageCurlConfig apply:forKeyPath:toFilter:](self, "apply:forKeyPath:toFilter:", backColor0, CFSTR("inputBackColor0"), v5);
  -[BEPageCurlConfig apply:forKeyPath:toFilter:](self, "apply:forKeyPath:toFilter:", self->backColor1, CFSTR("inputBackColor1"), v5);
  -[BEPageCurlConfig apply:forKeyPath:toFilter:](self, "apply:forKeyPath:toFilter:", self->shadowColor, CFSTR("inputShadowColor"), v5);

}

- (void)apply:(id)a3 forKeyPath:(id)a4 toFilter:(id)a5
{
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    v7 = objc_retainAutorelease(a3);
    v8 = a5;
    v9 = a4;
    objc_msgSend(v8, "setValue:forKeyPath:", objc_msgSend(v7, "CGColor"), v9);

  }
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (double)tapAnimationDuration
{
  return self->_tapAnimationDuration;
}

- (void)setTapAnimationDuration:(double)a3
{
  self->_tapAnimationDuration = a3;
}

- (BEPageCurlDelegate)pageCurlDelegate
{
  return (BEPageCurlDelegate *)objc_loadWeakRetained((id *)&self->_pageCurlDelegate);
}

- (void)setPageCurlDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageCurlDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageCurlDelegate);
  objc_storeStrong((id *)&self->shadowColor, 0);
  objc_storeStrong((id *)&self->backColor1, 0);
  objc_storeStrong((id *)&self->backColor0, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end
