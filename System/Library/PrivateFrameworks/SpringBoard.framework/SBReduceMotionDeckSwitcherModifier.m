@implementation SBReduceMotionDeckSwitcherModifier

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (id)scrollViewAttributes
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBReduceMotionDeckSwitcherModifier;
  -[SBDeckSwitcherModifier scrollViewAttributes](&v6, sel_scrollViewAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setScrollViewPagingEnabled:", 1);
  -[SBReduceMotionDeckSwitcherModifier _interpageSpacingForPaging](self, "_interpageSpacingForPaging");
  objc_msgSend(v4, "setInterpageSpacingForPaging:");
  -[SBReduceMotionDeckSwitcherModifier _pagingOrigin](self, "_pagingOrigin");
  objc_msgSend(v4, "setPagingOrigin:");
  return v4;
}

- (CGSize)_interpageSpacingForPaging
{
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[SBReduceMotionDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  CGRectGetWidth(v6);
  -[SBReduceMotionDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  SBFloatRoundForMainScreenScale();
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)_pagingOrigin
{
  double v3;
  double v4;
  CGPoint result;

  if (-[SBReduceMotionDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
  {
    -[SBDeckSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", 0, 2);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:");
  v8 = v7;
  v9 = 1.0;
  if (a3 && v8 > a4)
  {
    -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", a3 - 1, 1.0);
    v9 = (a4 - v10) / (v8 - v10) + 0.0;
  }
  return fmin(fmax(v9, 0.0), 1.0);
}

- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v5;
  BOOL v6;
  unint64_t v7;
  double v9;
  double v10;
  unint64_t v11;

  v5 = 1.0;
  v6 = a3 >= 2;
  v7 = a3 - 2;
  if (v6)
  {
    -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", v7, 1.0);
    v10 = v9;
    v11 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
    v5 = (a4 - (v10 + -1.0 / (double)v11)) / (v10 - (v10 + -1.0 / (double)v11)) + 0.0;
  }
  return fmin(fmax(v5, 0.0), 1.0);
}

- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  return 0.0;
}

- (double)scrollProgressForIndex:(unint64_t)a3
{
  unint64_t v5;
  double result;

  v5 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
  -[SBDeckSwitcherModifier desiredXOriginForQuantizedTopPage](self, "desiredXOriginForQuantizedTopPage");
  -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", a3, v5);
  return result;
}

- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  double v8;
  double v9;
  double v10;

  -[SBReduceMotionDeckSwitcherModifier _cardWidth](self, "_cardWidth", a5);
  v9 = v8;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  return 1.0 - (v9 + v9 * -0.2) * (double)(~a3 + a4) / v10;
}

- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;

  -[SBReduceMotionDeckSwitcherModifier appLayouts](self, "appLayouts", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    return 0;
  -[SBReduceMotionDeckSwitcherModifier _cardWidth](self, "_cardWidth");
  v11 = v10;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  v13 = v12;
  v14 = v11 + v11 * -0.2;
  if ((BSFloatIsZero() & 1) != 0)
    v15 = 0;
  else
    v15 = (unint64_t)((double)a4 - (1.0 - a3) * v13 / v14 + 1.0);
  if (v9 - 1 >= v15)
    return v15;
  else
    return v9 - 1;
}

- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  CGRect v19;
  CGRect v20;

  -[SBReduceMotionDeckSwitcherModifier _cardWidth](self, "_cardWidth");
  v10 = v9;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  v12 = (v10 + v10 * -0.2) * (double)(~a3 + a4) - (1.0 - a5) * v11;
  -[SBReduceMotionDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v17 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  return fmax(v12, CGRectGetMinX(v20) + v17 * -0.08);
}

- (double)_cardWidth
{
  double Width;
  double v4;
  CGRect v6;

  -[SBReduceMotionDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v6);
  -[SBReduceMotionDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  return Width * v4;
}

- (double)_switcherCardScale
{
  void *v2;
  double v3;
  double v4;

  -[SBReduceMotionDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deckSwitcherPageScale");
  v4 = v3;

  return v4;
}

@end
