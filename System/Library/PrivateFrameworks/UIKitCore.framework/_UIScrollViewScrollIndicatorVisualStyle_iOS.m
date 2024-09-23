@implementation _UIScrollViewScrollIndicatorVisualStyle_iOS

- (double)staticDimensionSize
{
  return 3.0;
}

- (id)fillView
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v2, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerCurve:", v3);

  return v2;
}

- (UIEdgeInsets)cursorHitTestingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -5.0;
  v3 = -10.0;
  v4 = -5.0;
  v5 = -10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4
{
  double v4;
  double v5;
  void *v6;

  if (a3)
  {
    if (a3 == 2)
    {
      v4 = 1.0;
    }
    else
    {
      if (a3 != 1)
      {
        v6 = 0;
        return v6;
      }
      v4 = 0.0;
    }
    v5 = 0.5;
  }
  else
  {
    v5 = 0.35;
    v4 = 0.0;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (double)fillViewCornerRadiusForStaticDimensionSize:(double)a3
{
  return a3 * 0.5;
}

- (double)staticDimensionExpandedSize
{
  return 8.0;
}

- (BOOL)doesExpand
{
  return 1;
}

- (CGRect)hitTestingRectForIndicatorRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIScrollViewScrollIndicatorVisualStyle_iOS cursorHitTestingInsets](self, "cursorHitTestingInsets");
  v8 = y + v7;
  v11 = width - (v9 + v10);
  v13 = height - (v7 + v12);
  v14 = x + v9;
  v15 = v8;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- ($600A803A2DA5524344F8C742CF1B11BB)valuesForLayoutSizeAnimationWhenExpanding:(SEL)a3
{
  double v4;

  v4 = 0.3;
  if (a4)
    v4 = 0.2;
  retstr->var0 = v4;
  *(_OWORD *)&retstr->var1 = xmmword_18666F250;
  retstr->var3 = 0.0;
  retstr->var4 = 0;
  return self;
}

- (id)feedbackGeneratorWithView:(id)a3
{
  id v3;
  _UIClickFeedbackGenerator *v4;

  v3 = a3;
  v4 = -[_UIClickFeedbackGenerator initWithView:]([_UIClickFeedbackGenerator alloc], "initWithView:", v3);

  return v4;
}

@end
