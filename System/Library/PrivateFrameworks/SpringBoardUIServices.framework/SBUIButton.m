@implementation SBUIButton

- (SBUIButton)initWithFrame:(CGRect)a3
{
  SBUIButton *result;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIButton;
  result = -[SBUIButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&result->_hitAreaAdjustments.top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&result->_hitAreaAdjustments.bottom = v4;
  }
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double top;
  double left;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBUIButton bounds](self, "bounds");
  top = self->_hitAreaAdjustments.top;
  left = self->_hitAreaAdjustments.left;
  v18.origin.x = v10 + left;
  v18.origin.y = v11 + top;
  v18.size.width = v12 - (left + self->_hitAreaAdjustments.right);
  v18.size.height = v13 - (top + self->_hitAreaAdjustments.bottom);
  v17.x = x;
  v17.y = y;
  if (CGRectContainsPoint(v18, v17))
  {
    v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBUIButton;
    v14 = -[SBUIButton pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (UIEdgeInsets)hitAreaAdjustments
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitAreaAdjustments.top;
  left = self->_hitAreaAdjustments.left;
  bottom = self->_hitAreaAdjustments.bottom;
  right = self->_hitAreaAdjustments.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitAreaAdjustments:(UIEdgeInsets)a3
{
  self->_hitAreaAdjustments = a3;
}

@end
