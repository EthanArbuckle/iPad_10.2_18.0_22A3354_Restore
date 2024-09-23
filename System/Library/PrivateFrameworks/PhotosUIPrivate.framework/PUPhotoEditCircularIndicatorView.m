@implementation PUPhotoEditCircularIndicatorView

- (PUPhotoEditCircularIndicatorView)initWithFrame:(CGRect)a3
{
  PUPhotoEditCircularIndicatorView *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditCircularIndicatorView;
  v3 = -[PUPhotoEditCircularIndicatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditCircularIndicatorView _setupLayers](v3, "_setupLayers");
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "strokeWidth");
    -[PUPhotoEditCircularIndicatorView setThickness:](v3, "setThickness:");

    v3->_minValue = -1.0;
    v3->_maxValue = 1.0;
    v3->_currentValue = 0.0;
    objc_msgSend(v4, "photoEditingCircularIndicatorBackgroundStrokeColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_backgroundLayer, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v4, "photoEditingCircularIndicatorProgressStrokeColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_progressLayer, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  }
  return v3;
}

- (void)_setupLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCircularIndicatorView setBackgroundLayer:](self, "setBackgroundLayer:", v3);

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", 0);

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeEnd:", 1.0);

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineWidth:", 2.5);

  -[PUPhotoEditCircularIndicatorView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", v8);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCircularIndicatorView setProgressLayer:](self, "setProgressLayer:", v9);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFillColor:", 0);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineWidth:", 2.0);

  v12 = *MEMORY[0x1E0CD3010];
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineCap:", v12);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStrokeEnd:", 0.0);

  -[PUPhotoEditCircularIndicatorView layer](self, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", v15);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditCircularIndicatorView;
  -[PUPhotoEditCircularIndicatorView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUPhotoEditCircularIndicatorView _layoutSubLayers](self, "_layoutSubLayers");
}

- (void)_layoutSubLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  -[PUPhotoEditCircularIndicatorView bounds](self, "bounds");
  v4 = v3 + -2.5;
  -[PUPhotoEditCircularIndicatorView bounds](self, "bounds");
  v6 = v5 + -2.5;
  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", 0.0, 0.0, v4, v5 + -2.5, v4 * 0.5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGPath");

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v4, v6);

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", v8);

  -[PUPhotoEditCircularIndicatorView bounds](self, "bounds");
  PXRectGetCenter();
  v12 = v11;
  v14 = v13;
  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPosition:", v12, v14);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v4, v6);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPath:", v8);

  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "position");
  v19 = v18;
  v21 = v20;
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPosition:", v19, v21);

}

- (void)setThickness:(double)a3
{
  void *v5;
  void *v6;

  if (self->_thickness != a3)
  {
    -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineWidth:", a3);

    -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineWidth:", a3 + -0.5);

    -[PUPhotoEditCircularIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRingColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[PUPhotoEditCircularIndicatorView backgroundLayer](self, "backgroundLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

  v8 = objc_retainAutorelease(v4);
  v9 = objc_msgSend(v8, "CGColor");

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStrokeColor:", v9);

}

- (UIColor)ringColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "strokeColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)_updateProgressLayer
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t *v18;
  double v19;
  uint64_t v20;
  void *v21;

  v3 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PUPhotoEditCircularIndicatorView currentValue](self, "currentValue");
  if (v4 == 0.0)
  {
    -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrokeEnd:", 0.0);

    -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
LABEL_5:
    objc_msgSend(v6, "setStrokeStart:", v8);
    goto LABEL_9;
  }
  -[PUPhotoEditCircularIndicatorView currentValue](self, "currentValue");
  v10 = v9;
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 < 0.0)
  {
    objc_msgSend(v11, "setStrokeEnd:", 1.0);

    -[PUPhotoEditCircularIndicatorView currentValue](self, "currentValue");
    v14 = v13 + 1.0;
    -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v14;
    goto LABEL_5;
  }
  objc_msgSend(v11, "setStrokeStart:", 0.0);

  -[PUPhotoEditCircularIndicatorView currentValue](self, "currentValue");
  v16 = v15;
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setStrokeEnd:", v16);

  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "strokeEnd");
  v18 = (uint64_t *)MEMORY[0x1E0CD3008];
  if (v19 != 1.0)
    v18 = (uint64_t *)MEMORY[0x1E0CD3010];
  v20 = *v18;
  -[PUPhotoEditCircularIndicatorView progressLayer](self, "progressLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLineCap:", v20);

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v3);
}

- (void)setCurrentValue:(double)a3
{
  -[PUPhotoEditCircularIndicatorView minValue](self, "minValue");
  -[PUPhotoEditCircularIndicatorView maxValue](self, "maxValue");
  PXClamp();
  if (self->_currentValue != a3)
  {
    self->_currentValue = a3;
    -[PUPhotoEditCircularIndicatorView _updateProgressLayer](self, "_updateProgressLayer");
  }
}

- (void)resetToDefaults
{
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_currentValue = 0.0;
  -[PUPhotoEditCircularIndicatorView _updateProgressLayer](self, "_updateProgressLayer");
}

- (double)thickness
{
  return self->_thickness;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end
