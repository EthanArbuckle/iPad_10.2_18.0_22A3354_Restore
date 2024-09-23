@implementation UIKBDivotedEffect

- (BOOL)isValid
{
  double v2;

  -[UIKBDivotedEffect weight](self, "weight");
  return v2 > 0.0;
}

- (CGColor)CGColor
{
  CGColor *v2;

  v2 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha8"));
  return CGColorRetain(v2);
}

- (BOOL)usesRGBColors
{
  return 1;
}

- (UIKBGradient)gradient
{
  return 0;
}

- (BOOL)renderUnder
{
  return 0;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
  objc_msgSend(a3, "renderDivotEffect:withTraits:", self, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIKBDivotedEffect init](+[UIKBDivotedEffect allocWithZone:](UIKBDivotedEffect, "allocWithZone:", a3), "init");
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

@end
