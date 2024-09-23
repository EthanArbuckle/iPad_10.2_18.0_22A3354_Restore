@implementation _UICalloutBarMetrics

- (_UICalloutBarMetrics)init
{
  _UICalloutBarMetrics *v2;
  _UICalloutBarMetrics *v3;
  UIColor *backgroundColor;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *blurViewBackgroundEffects;
  uint64_t v9;
  UIColor *separatorColor;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UICalloutBarMetrics;
  v2 = -[_UICalloutBarMetrics init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isVerticallyAligned = 0;
    backgroundColor = v2->_backgroundColor;
    v2->_cornerRadius = 8.0;
    v2->_backgroundColor = 0;

    +[UIBlurEffect _effectWithInfiniteRadius](UIBlurEffect, "_effectWithInfiniteRadius");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    +[UIColorEffect colorEffectLuminanceCurveMap:blendingAmount:](UIColorEffect, "colorEffectLuminanceCurveMap:blendingAmount:", &unk_1E1A934A0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    blurViewBackgroundEffects = v3->_blurViewBackgroundEffects;
    v3->_blurViewBackgroundEffects = (NSArray *)v7;

    v3->_interitemPadding = 0.0;
    v3->_verticalPadding = 0.0;
    v3->_horizontalPadding = 0.0;
    v3->_displaySeparators = 1;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
    separatorColor = v3->_separatorColor;
    v3->_separatorColor = (UIColor *)v9;

  }
  return v3;
}

- (BOOL)isVerticallyAligned
{
  return self->_isVerticallyAligned;
}

- (void)setIsVerticallyAligned:(BOOL)a3
{
  self->_isVerticallyAligned = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)blurViewBackgroundEffects
{
  return self->_blurViewBackgroundEffects;
}

- (double)interitemPadding
{
  return self->_interitemPadding;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)displaySeparators
{
  return self->_displaySeparators;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_blurViewBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
