@implementation BKDisplayAnnotationColorVariationStyle

- (BKDisplayAnnotationColorVariationStyle)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  BKDisplayAnnotationColorVariationStyle *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKDisplayAnnotationColorVariationStyle;
  result = -[BKDisplayAnnotationColorVariationStyle init](&v9, "init");
  if (result)
  {
    result->_r = a3;
    result->_g = a4;
    result->_b = a5;
  }
  return result;
}

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
    -[BKDisplayAnnotationColorVariationStyle applyAppearanceToShapeLayer:](self, "applyAppearanceToShapeLayer:", v9);
  v8 = objc_opt_class(CATextLayer, v7);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    -[BKDisplayAnnotationColorVariationStyle applyAppearanceToTextLayer:](self, "applyAppearanceToTextLayer:", v9);

}

- (void)applyAppearanceToShapeLayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setLineWidth:", 3.0);
  objc_msgSend(v4, "bk_setForegroundColorRed:green:blue:alpha:", self->_r, self->_g, self->_b, 0.9);
  objc_msgSend(v4, "bk_setBackgroundColorRed:green:blue:alpha:", self->_r, self->_g, self->_b, 0.2);

}

- (void)applyAppearanceToTextLayer:(id)a3
{
  CTFontRef v4;
  id v5;

  v5 = a3;
  v4 = CTFontCreateWithName(CFSTR("Helvetica"), 0.0, 0);
  if (v4)
    objc_msgSend(v5, "setFont:", v4);
  CFRelease(v4);
  objc_msgSend(v5, "setFontSize:", 14.0);
  objc_msgSend(v5, "bk_setForegroundColorRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.9);
  objc_msgSend(v5, "bk_setBackgroundColorRed:green:blue:alpha:", fmin(self->_r, 0.5), fmin(self->_g, 0.5), fmin(self->_b, 0.5), 0.8);

}

+ (id)colorVariationWithIndex:(int64_t)a3
{
  double *v3;

  v3 = (double *)((char *)&unk_1000B3C58 + 24 * (a3 % 6));
  return -[BKDisplayAnnotationColorVariationStyle initWithRed:green:blue:]([BKDisplayAnnotationColorVariationStyle alloc], "initWithRed:green:blue:", *v3, v3[1], v3[2]);
}

@end
