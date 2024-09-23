@implementation _UISystemBackgroundStrokeView

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)updateLayerOrRedraw
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a1)
  {
    objc_msgSend((id)a1, "setOpaque:", 0);
    objc_msgSend((id)a1, "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v2;
    if (*(_QWORD *)(a1 + 448) == 15)
    {
      objc_msgSend(v2, "setMasksToBounds:", 1);
      objc_msgSend(v7, "setBorderWidth:", *(double *)(a1 + 424));
      objc_msgSend(v7, "setMaskedCorners:", *(_QWORD *)(a1 + 448));
      if (*(_BYTE *)(a1 + 416))
        v3 = (_QWORD *)MEMORY[0x1E0CD2A68];
      else
        v3 = (_QWORD *)MEMORY[0x1E0CD2A60];
      objc_msgSend(v7, "setCornerCurve:", *v3);
      objc_msgSend(v7, "setCornerRadius:", *(double *)(a1 + 432));
      v4 = *(void **)(a1 + 440);
      objc_msgSend((id)a1, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    }
    else
    {
      objc_msgSend(v2, "setMasksToBounds:", 0);
      objc_msgSend(v7, "setBorderWidth:", 0.0);
      objc_msgSend(v7, "setMaskedCorners:", 0);
      objc_msgSend(v7, "setCornerRadius:", 0.0);
      objc_msgSend((id)a1, "setNeedsDisplay");
    }

  }
}

- (void)setStrokeCornerRadius:(double)a3
{
  if (self->_strokeCornerRadius != a3)
  {
    self->_strokeCornerRadius = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)setUseContinuousCurve:(BOOL)a3
{
  if (self->_useContinuousCurve != a3)
  {
    self->_useContinuousCurve = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundStrokeView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  if (!self || self->_maskedCorners == 15)
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t maskedCorners;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  CGFloat v20;
  CGFloat MidY;
  CGFloat MidX;
  CGFloat v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (self && self->_maskedCorners != 15)
  {
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v8 = self->_strokeWidth * 0.5;
    maskedCorners = self->_maskedCorners;
    v10 = 0.0;
    if (maskedCorners == 3)
      v11 = 0.0;
    else
      v11 = self->_strokeWidth * 0.5;
    if (maskedCorners == 12)
      v12 = 0.0;
    else
      v12 = self->_strokeWidth * 0.5;
    if (maskedCorners == 12)
      v11 = self->_strokeWidth * 0.5;
    if (maskedCorners)
      v10 = v11;
    else
      v12 = 0.0;
    v13 = v4 + v8;
    v14 = v5 + v12;
    v15 = v6 - (v8 + v8);
    v16 = v7 - (v12 + v10);
    v17 = self->_strokeCornerRadius - v8;
    v18 = !self->_useContinuousCurve;
    if (maskedCorners)
    {
      +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", 3, 13, v18, v13, v5 + v12, v15, v7 - (v12 + v10), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_maskedCorners == 12)
      {
        v27.origin.x = v13;
        v27.origin.y = v14;
        v27.size.width = v15;
        v27.size.height = v16;
        v20 = -CGRectGetMidX(v27);
        v28.origin.x = v13;
        v28.origin.y = v14;
        v28.size.width = v15;
        v28.size.height = v16;
        MidY = CGRectGetMidY(v28);
        CGAffineTransformMakeTranslation(&v26, v20, -MidY);
        objc_msgSend(v19, "applyTransform:", &v26);
        CGAffineTransformMakeScale(&v25, 1.0, -1.0);
        objc_msgSend(v19, "applyTransform:", &v25);
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        MidX = CGRectGetMidX(v29);
        v30.origin.x = v13;
        v30.origin.y = v14;
        v30.size.width = v15;
        v30.size.height = v16;
        v23 = CGRectGetMidY(v30);
        CGAffineTransformMakeTranslation(&v24, MidX, v23);
        objc_msgSend(v19, "applyTransform:", &v24);
      }
    }
    else
    {
      +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", 0, 12, v18, v13, v5 + v12, v15, v7 - (v12 + v10), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "setLineWidth:", self->_strokeWidth);
    -[UIColor set](self->_strokeColor, "set");
    objc_msgSend(v19, "stroke");

  }
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (double)strokeCornerRadius
{
  return self->_strokeCornerRadius;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)useContinuousCurve
{
  return self->_useContinuousCurve;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
