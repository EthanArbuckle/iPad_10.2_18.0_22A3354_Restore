@implementation BKDisplayAnnotationCanceledStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = objc_opt_class(CAShapeLayer, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    -[BKDisplayAnnotationCanceledStyle applyAppearanceToShapeLayer:](self, "applyAppearanceToShapeLayer:", v9);
  v8 = objc_opt_class(CATextLayer, v7);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    -[BKDisplayAnnotationCanceledStyle applyAppearanceToTextLayer:](self, "applyAppearanceToTextLayer:", v9);

}

- (void)applyAppearanceToShapeLayer:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "bk_setBackgroundColorRed:green:blue:alpha:", 1.0, 0.3, 0.3, 0.8);
  objc_msgSend(v3, "bk_setForegroundColorRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.8);
  objc_msgSend(v3, "setLineDashPattern:", &off_1000F7670);
  objc_msgSend(v3, "setLineWidth:", 20.0);

}

- (void)applyAppearanceToTextLayer:(id)a3
{
  id v3;
  id v4;
  CGRect v5;

  v3 = a3;
  objc_msgSend(v3, "bk_setForegroundColorRed:green:blue:alpha:", 0.9, 1.0, 1.0, 0.8);
  objc_msgSend(v3, "bk_setBackgroundColorRed:green:blue:alpha:", 1.0, 0.1, 0.1, 0.8);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:", v5.origin.x, CGRectGetMidY(v5), v5.size.width, 2.0);
  objc_msgSend(v4, "bk_setBackgroundColorRed:green:blue:alpha:", 0.9, 1.0, 1.0, 0.8);
  objc_msgSend(v3, "addSublayer:", v4);

  objc_msgSend(v4, "setNeedsDisplay");
}

@end
