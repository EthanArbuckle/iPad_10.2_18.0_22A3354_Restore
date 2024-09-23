@implementation _UIBarBackgroundLayoutModern

- (id)bg1Color
{
  return -[_UIBarBackgroundAppearanceData backgroundColor](self->_backgroundData1, "backgroundColor");
}

- (BOOL)bg2Enabled
{
  return !self->_backgroundsAreSame && self->_backgroundData2 != 0;
}

- (id)bg1Image
{
  return -[_UIBarBackgroundAppearanceData backgroundImage](self->_backgroundData1, "backgroundImage");
}

- (id)bg1Effects
{
  return -[_UIBarBackgroundAppearanceData backgroundEffects](self->_backgroundData1, "backgroundEffects");
}

- (id)bg2Color
{
  return -[_UIBarBackgroundAppearanceData backgroundColor](self->_backgroundData2, "backgroundColor");
}

- (id)bg2Image
{
  return -[_UIBarBackgroundAppearanceData backgroundImage](self->_backgroundData2, "backgroundImage");
}

- (id)bg2Effects
{
  return -[_UIBarBackgroundAppearanceData backgroundEffects](self->_backgroundData2, "backgroundEffects");
}

- (id)bg1ShadowEffect
{
  return -[_UIBarBackgroundAppearanceData shadowViewEffect](self->_backgroundData1, "shadowViewEffect");
}

- (double)bg1ShadowAlpha
{
  if (self->_backgroundsAreSame || !self->super._useExplicitGeometry)
    return self->super._shadowAlpha;
  else
    return self->super._shadowAlpha * (1.0 - self->super._backgroundTransitionProgress);
}

- (int64_t)bg1ImageMode
{
  return -[_UIBarBackgroundAppearanceData backgroundImageContentMode](self->_backgroundData1, "backgroundImageContentMode");
}

- (double)bg1Alpha
{
  double v2;

  v2 = 1.0;
  if (!self->_backgroundsAreSame
    && !-[_UIBarBackgroundAppearanceData hasBackground](self->_backgroundData2, "hasBackground"))
  {
    return 1.0 - self->super._backgroundTransitionProgress;
  }
  return v2;
}

- (id)bg2ShadowEffect
{
  return -[_UIBarBackgroundAppearanceData shadowViewEffect](self->_backgroundData2, "shadowViewEffect");
}

- (double)bg2ShadowAlpha
{
  double result;

  result = self->super._shadowAlpha;
  if (self->super._useExplicitGeometry)
    return result * self->super._backgroundTransitionProgress;
  return result;
}

- (int64_t)bg2ImageMode
{
  return -[_UIBarBackgroundAppearanceData backgroundImageContentMode](self->_backgroundData2, "backgroundImageContentMode");
}

- (double)bg2Alpha
{
  return self->super._backgroundTransitionProgress;
}

- (id)bg1ShadowImage
{
  return -[_UIBarBackgroundAppearanceData shadowImage](self->_backgroundData1, "shadowImage");
}

- (id)bg2ShadowImage
{
  return -[_UIBarBackgroundAppearanceData shadowImage](self->_backgroundData2, "shadowImage");
}

- (id)bg2ShadowColor
{
  void *v3;
  void *v4;
  void *v5;

  if (self->super._useExplicitGeometry || self->super._backgroundTransitionProgress >= 1.0)
  {
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData2, "shadowViewBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData1, "shadowViewBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData2, "shadowViewBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _interpolateColors(v3, v4, self->super._backgroundTransitionProgress);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)bg1ShadowColor
{
  void *v3;
  void *v5;
  void *v6;

  if (self->_backgroundsAreSame || self->super._useExplicitGeometry || self->super._backgroundTransitionProgress <= 0.0)
  {
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData1, "shadowViewBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIBarBackgroundAppearanceData hasShadow](self->_backgroundData2, "hasShadow"))
  {
    v3 = 0;
  }
  else
  {
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData1, "shadowViewBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundAppearanceData shadowViewBackgroundColor](self->_backgroundData2, "shadowViewBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _interpolateColors(v5, v6, self->super._backgroundTransitionProgress);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)bg2ShadowTint
{
  void *v3;
  void *v4;
  void *v5;

  if (self->super._useExplicitGeometry)
  {
    -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData2, "shadowViewTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData1, "shadowViewTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData2, "shadowViewTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _interpolateColors(v4, v5, self->super._backgroundTransitionProgress);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)bg1ShadowTint
{
  uint64_t v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_backgroundsAreSame || self->super._useExplicitGeometry)
  {
    -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData1, "shadowViewTintColor");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v4 = (void *)v3;
    return v4;
  }
  if (-[_UIBarBackgroundAppearanceData hasShadow](self->_backgroundData2, "hasShadow"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData1, "shadowViewTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundAppearanceData shadowViewTintColor](self->_backgroundData2, "shadowViewTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _interpolateColors(v6, v7, self->super._backgroundTransitionProgress);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v10;

  return v4;
}

- (BOOL)bg2HasShadow
{
  _BOOL4 v3;

  v3 = -[_UIBarBackgroundAppearanceData hasShadow](self->_backgroundData2, "hasShadow");
  if (v3)
    LOBYTE(v3) = !self->super._shadowHidden;
  return v3;
}

- (BOOL)bg1HasShadow
{
  _BOOL4 v3;

  v3 = -[_UIBarBackgroundAppearanceData hasShadow](self->_backgroundData1, "hasShadow");
  if (v3)
    LOBYTE(v3) = !self->super._shadowHidden;
  return v3;
}

- (BOOL)shouldUseExplicitGeometry
{
  return self->super._useExplicitGeometry && !self->_backgroundsAreSame;
}

- (void)setBackgroundData2:(id)a3
{
  _UIBarBackgroundAppearanceData *backgroundData2;
  _UIBarBackgroundAppearanceData *v6;
  _UIBarBackgroundAppearanceData *v7;
  _UIBarBackgroundAppearanceData *v8;
  BOOL v9;
  char v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_backgroundData2, a3);
  backgroundData2 = self->_backgroundData2;
  v6 = self->_backgroundData1;
  v7 = backgroundData2;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);
  }

  self->_backgroundsAreSame = v10;
}

- (void)setBackgroundData1:(id)a3
{
  _UIBarBackgroundAppearanceData *backgroundData2;
  _UIBarBackgroundAppearanceData *v6;
  _UIBarBackgroundAppearanceData *v7;
  _UIBarBackgroundAppearanceData *v8;
  BOOL v9;
  char v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_backgroundData1, a3);
  backgroundData2 = self->_backgroundData2;
  v6 = self->_backgroundData1;
  v7 = backgroundData2;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);
  }

  self->_backgroundsAreSame = v10;
}

- (_UIBarBackgroundLayoutModern)initWithLayout:(id)a3
{
  id *v4;
  _UIBarBackgroundLayoutModern *v5;
  id *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarBackgroundLayoutModern;
  v5 = -[_UIBarBackgroundLayout initWithLayout:](&v8, sel_initWithLayout_, v4);
  if (v5 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_storeStrong((id *)&v5->_backgroundData1, v4[12]);
    v6 = v4;
    objc_storeStrong((id *)&v5->_backgroundData2, v6[13]);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundData2, 0);
  objc_storeStrong((id *)&self->_backgroundData1, 0);
}

- (void)describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutModern;
  -[_UIBarBackgroundLayout describeInto:](&v5, sel_describeInto_, v4);
  if (self->_backgroundData1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" background1=%@"), self->_backgroundData1);
    if (self->_backgroundData2)
      objc_msgSend(v4, "appendFormat:", CFSTR(" background2=%@"), self->_backgroundData2);
  }

}

- (_UIBarBackgroundAppearanceData)backgroundData1
{
  return self->_backgroundData1;
}

- (_UIBarBackgroundAppearanceData)backgroundData2
{
  return self->_backgroundData2;
}

@end
