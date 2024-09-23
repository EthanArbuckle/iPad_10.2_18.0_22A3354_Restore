@implementation _UITextFieldPasscodeCutoutBackground

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  _UITextFieldPasscodeCutoutBackground *v4;
  _UITextFieldPasscodeCutoutBackground *v5;
  void *v6;
  CAShapeLayer *v7;
  CAShapeLayer *lighteningOutline;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  v4 = -[UITextFieldBackgroundView initWithFrame:active:](&v14, sel_initWithFrame_active_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v5->_cornerRadius = 5.0;
    -[_UITextFieldPasscodeCutoutBackground setLineWidth:](v5, "setLineWidth:", 1.0);
    -[_UITextFieldPasscodeCutoutBackground _shapeLayer](v5, "_shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillRule:", *MEMORY[0x1E0CD2B70]);

    -[UIView setOpaque:](v5, "setOpaque:", 0);
    v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    lighteningOutline = v5->_lighteningOutline;
    v5->_lighteningOutline = v7;

    +[UIColor clearColor](UIColor, "clearColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v5->_lighteningOutline, "setFillColor:", objc_msgSend(v9, "CGColor"));

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v5->_lighteningOutline, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setCompositingFilter:](v5->_lighteningOutline, "setCompositingFilter:", v11);

    -[CAShapeLayer setLineWidth:](v5->_lighteningOutline, "setLineWidth:", 1.0);
    -[UIView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v5->_lighteningOutline);

  }
  return v5;
}

- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3
{
  return -[_UITextFieldPasscodeCutoutBackground initWithFrame:active:](self, "initWithFrame:active:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)_pathInset
{
  void *v2;
  double v3;
  double v4;

  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4 * 0.5;
}

- (void)setOutlineAlpha:(double)a3
{
  id v4;

  self->_outlineAlpha = a3;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_lighteningOutline, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

+ (id)_strokeColor:(BOOL)a3
{
  return +[UIColor clearColor](UIColor, "clearColor", a3);
}

+ (id)_fillColor:(BOOL)a3
{
  return 0;
}

- (void)setStrokeColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  self->_hasCustomStrokeColor = v4 != 0;
  if (!v4)
  {
    -[_UITextFieldPasscodeCutoutBackground _strokeColor:](self, "_strokeColor:", self->super._enabled);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_retainAutorelease(v4);
  v5 = objc_msgSend(v7, "CGColor");
  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v5);

}

- (id)strokeColor
{
  void *v2;
  void *v3;

  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "strokeColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFillColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  self->_hasCustomFillColor = v4 != 0;
  if (!v4)
  {
    -[_UITextFieldPasscodeCutoutBackground _fillColor:](self, "_fillColor:", self->super._enabled);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_retainAutorelease(v4);
  v5 = objc_msgSend(v7, "CGColor");
  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFillColor:", v5);

}

- (id)fillColor
{
  void *v2;
  void *v3;

  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "fillColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLineWidth:(double)a3 updatePath:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;

  v4 = a4;
  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineWidth:", a3);

  if (v4)
    -[_UITextFieldPasscodeCutoutBackground _updatePath](self, "_updatePath");
}

- (void)setLineWidth:(double)a3
{
  -[_UITextFieldPasscodeCutoutBackground setLineWidth:updatePath:](self, "setLineWidth:updatePath:", 1, a3);
}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITextFieldPasscodeCutoutBackground _updatePath](self, "_updatePath");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITextFieldPasscodeCutoutBackground _updatePath](self, "_updatePath");
}

- (UIBezierPath)customPath
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[_UITextFieldPasscodeCutoutBackground cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[_UITextFieldPasscodeCutoutBackground _pathInset](self, "_pathInset");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v22 = CGRectInset(v21, v6, v6);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  if (CGRectIsNull(v22))
  {
    v11 = 0;
  }
  else
  {
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextFieldPasscodeCutoutBackground lineWidth](self, "lineWidth");
    v13 = v12;
    v14 = v12 * 0.5;
    -[UIView bounds](self, "bounds");
    v15 = -(v13 * 0.5);
    v24 = CGRectInset(v23, v15, v15);
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendPath:", v16);

    v17 = v13 * 0.25;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectInset(v25, v15, v15);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height, v4 + v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendPath:", v18);

    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, v14, v14);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, v4 - v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendPath:", v19);

  }
  return (UIBezierPath *)v11;
}

- (void)_updateLightingOutlinePath
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  uint64_t v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[_UITextFieldPasscodeCutoutBackground _pathInset](self, "_pathInset");
  v4 = v3;
  -[_UITextFieldPasscodeCutoutBackground cornerRadius](self, "cornerRadius");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v15 = CGRectInset(v14, v4, v4);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectIsNull(v16))
  {
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = objc_retainAutorelease(v11);
  -[CAShapeLayer setPath:](self->_lighteningOutline, "setPath:", objc_msgSend(v13, "CGPath"));

}

- (void)_updatePath
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CGRect v19;
  CGRect v20;

  -[_UITextFieldPasscodeCutoutBackground _updateLightingOutlinePath](self, "_updateLightingOutlinePath");
  -[_UITextFieldPasscodeCutoutBackground _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextFieldPasscodeCutoutBackground customPath](self, "customPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UITextFieldPasscodeCutoutBackground customPath](self, "customPath");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStrokeColor:", 0);
    v5 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock", v15);
  }
  else
  {
    -[_UITextFieldPasscodeCutoutBackground _pathInset](self, "_pathInset");
    v7 = v6;
    -[UIView bounds](self, "bounds");
    v20 = CGRectInset(v19, v7, v7);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    if (CGRectIsNull(v20))
    {
      v5 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock", 0);
    }
    else
    {
      -[_UITextFieldPasscodeCutoutBackground cornerRadius](self, "cornerRadius");
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v12);
      v5 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock", objc_claimAutoreleasedReturnValue());
    }
  }
  if (v5)
  {
    objc_msgSend(v3, "animationForKey:", CFSTR("path"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51___UITextFieldPasscodeCutoutBackground__updatePath__block_invoke;
      v17[3] = &unk_1E16B1B28;
      v18 = v3;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);

    }
  }
  objc_msgSend(v3, "animationForKey:", CFSTR("path"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    objc_msgSend(v3, "setPath:", objc_msgSend(objc_retainAutorelease(v16), "CGPath"));
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setEnabled:animated:](&v11, sel_setEnabled_animated_);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60___UITextFieldPasscodeCutoutBackground_setEnabled_animated___block_invoke;
  v9[3] = &unk_1E16B1B78;
  v9[4] = self;
  v10 = a3;
  v7 = _Block_copy(v9);
  v8 = v7;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.35);
  else
    (*((void (**)(void *))v7 + 2))(v7);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)_shouldAnimatePropertyWithKey__properties;
  if (!_shouldAnimatePropertyWithKey__properties)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("path"), CFSTR("fillColor"), CFSTR("lineWidth"), CFSTR("strokeColor"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_shouldAnimatePropertyWithKey__properties;
    _shouldAnimatePropertyWithKey__properties = v6;

    v5 = (void *)_shouldAnimatePropertyWithKey__properties;
  }
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
    v8 = -[UIView _shouldAnimatePropertyWithKey:](&v10, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v8;
}

- (id)_strokeColor:(BOOL)a3
{
  if (a3)
    +[UIColor _textFieldBorderColor](UIColor, "_textFieldBorderColor");
  else
    +[UIColor _textFieldDisabledBorderColor](UIColor, "_textFieldDisabledBorderColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fillColor:(BOOL)a3
{
  if (a3)
    +[UIColor _textFieldBackgroundColor](UIColor, "_textFieldBackgroundColor");
  else
    +[UIColor _textFieldDisabledBackgroundColor](UIColor, "_textFieldDisabledBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lighteningOutline, 0);
}

@end
