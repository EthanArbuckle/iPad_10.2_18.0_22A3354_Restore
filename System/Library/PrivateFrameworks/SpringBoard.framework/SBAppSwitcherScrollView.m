@implementation SBAppSwitcherScrollView

- (void)setContentOffset:(CGPoint)a3
{
  double v4;
  double x;
  double v6;
  double v7;
  BOOL v8;
  double y;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CFTimeInterval v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v21;

  v4 = fabs(a3.x);
  if (v4 >= INFINITY)
    x = 0.0;
  else
    x = a3.x;
  if (v4 <= INFINITY)
    v6 = x;
  else
    v6 = a3.x;
  v7 = fabs(a3.y);
  v8 = v7 <= INFINITY;
  if (v7 >= INFINITY)
    y = 0.0;
  else
    y = a3.y;
  if (v8)
    v10 = y;
  else
    v10 = a3.y;
  -[SBAppSwitcherScrollView contentOffset](self, "contentOffset", y);
  v12 = v11;
  v14 = v13;
  v21.receiver = self;
  v21.super_class = (Class)SBAppSwitcherScrollView;
  -[BSUIScrollView setContentOffset:](&v21, sel_setContentOffset_, v6, v10);
  if (v6 != v12 || v10 != v14)
  {
    v16 = CACurrentMediaTime();
    v17 = v16 - self->_previousScrollTime;
    if (v17 > 0.009)
    {
      v18 = v17 * 1000.0;
      v19 = (v6 - self->_previousContentOffset.x) / v18;
      v20 = (v10 - self->_previousContentOffset.y) / v18;
      self->_rawContentOffsetVelocity.x = v19;
      self->_rawContentOffsetVelocity.y = v20;
      self->_previousContentOffset.x = v6;
      self->_previousContentOffset.y = v10;
      self->_previousScrollTime = v16;
    }
  }
}

- (CGPoint)contentOffsetVelocity
{
  CGPoint *p_rawContentOffsetVelocity;
  double x;
  double y;
  CGPoint result;

  if (1.0 / (CACurrentMediaTime() - self->_previousScrollTime) >= 5.0)
    p_rawContentOffsetVelocity = &self->_rawContentOffsetVelocity;
  else
    p_rawContentOffsetVelocity = (CGPoint *)MEMORY[0x1E0C9D538];
  x = p_rawContentOffsetVelocity->x;
  y = p_rawContentOffsetVelocity->y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)contentOffsetVelocityConsideringNextContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[SBAppSwitcherScrollView contentOffsetVelocity](self, "contentOffsetVelocity");
  v7 = v6;
  v9 = v8;
  v10 = CACurrentMediaTime() - self->_previousScrollTime;
  if (v10 > 0.009 && v10 < 5.0)
  {
    v12 = v10 * 1000.0;
    v7 = (x - self->_previousContentOffset.x) / v12;
    v9 = (y - self->_previousContentOffset.y) / v12;
  }
  v13 = v7;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

@end
