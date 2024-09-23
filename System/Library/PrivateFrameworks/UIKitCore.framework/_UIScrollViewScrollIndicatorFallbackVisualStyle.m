@implementation _UIScrollViewScrollIndicatorFallbackVisualStyle

- (id)fillView
{
  return (id)objc_opt_new();
}

- (double)staticDimensionSize
{
  return 3.0;
}

- (double)staticDimensionExpandedSize
{
  return 3.0;
}

- (double)fillViewCornerRadiusForStaticDimensionSize:(double)a3
{
  return 1.5;
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
  -[_UIScrollViewScrollIndicatorFallbackVisualStyle cursorHitTestingInsets](self, "cursorHitTestingInsets");
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

- (UIEdgeInsets)cursorHitTestingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
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

- (BOOL)doesExpand
{
  return 1;
}

- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4
{
  return +[UIColor systemFillColor](UIColor, "systemFillColor", a3, a4);
}

- ($600A803A2DA5524344F8C742CF1B11BB)valuesForLayoutSizeAnimationWhenExpanding:(SEL)a3
{
  retstr->var4 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
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
