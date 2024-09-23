@implementation _TVStackBackdropMaskingView

- (_TVStackBackdropMaskingView)initWithFrame:(CGRect)a3
{
  _TVStackBackdropMaskingView *v3;
  _TVStackBackdropMaskingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVStackBackdropMaskingView;
  v3 = -[_TVStackBackdropMaskingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_gradientStop = 1.0;
    -[_TVStackBackdropMaskingView setClipsSubviews:](v3, "setClipsSubviews:", 1);
  }
  return v4;
}

- (void)setBackdropView:(id)a3
{
  _TVStackBackdropView *v5;
  _TVStackBackdropView **p_backdropView;
  _TVStackBackdropView *backdropView;
  void *v8;
  _TVStackBackdropView *v9;

  v5 = (_TVStackBackdropView *)a3;
  p_backdropView = &self->_backdropView;
  backdropView = self->_backdropView;
  if (backdropView != v5)
  {
    v9 = v5;
    -[_TVStackBackdropView layer](backdropView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", 0);

    -[_TVStackBackdropView removeFromSuperview](*p_backdropView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backdropView, a3);
    if (*p_backdropView)
      -[_TVStackBackdropMaskingView addSubview:](self, "addSubview:");
    -[_TVStackBackdropMaskingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setGradientScale:(double)a3
{
  if (self->_gradientScale != a3)
  {
    self->_gradientScale = a3;
    -[_TVStackBackdropMaskingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGradientStop:(double)a3
{
  if (self->_gradientStop != a3)
  {
    self->_gradientStop = a3;
    -[_TVStackBackdropMaskingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CAGradientLayer *v10;
  CAGradientLayer *v11;
  CAGradientLayer *v12;
  void *v13;
  CAGradientLayer *v14;
  id v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  CAGradientLayer *v24;
  void *v25;
  double v26;
  void *gradientLayer;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)_TVStackBackdropMaskingView;
  -[_TVStackBackdropMaskingView layoutSubviews](&v32, sel_layoutSubviews);
  -[_TVStackBackdropMaskingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_TVStackBackdropView bounds](self->_backdropView, "bounds");
  v8 = v7;
  -[_TVStackBackdropView setFrame:](self->_backdropView, "setFrame:", 0.0, v6 - v7, v4);
  -[_TVStackBackdropMaskingView gradientScale](self, "gradientScale");
  if (v9 <= 0.0)
  {
    -[_TVStackBackdropView layer](self->_backdropView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMask:", 0);

    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = 0;
  }
  else
  {
    v10 = self->_gradientLayer;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDE56B8], "layer");
      v11 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      v12 = self->_gradientLayer;
      self->_gradientLayer = v11;

      -[_TVStackBackdropView layer](self->_backdropView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMask:", self->_gradientLayer);

      v10 = self->_gradientLayer;
    }
    -[CAGradientLayer setFrame:](v10, "setFrame:", 0.0, v8 - v6, v4, v6);
    v14 = self->_gradientLayer;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34[0] = objc_msgSend(v15, "CGColor");
    v16 = (void *)MEMORY[0x24BDF6950];
    -[_TVStackBackdropMaskingView gradientStop](self, "gradientStop");
    objc_msgSend(v16, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, v17 * 0.3);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34[1] = objc_msgSend(v18, "CGColor");
    v19 = (void *)MEMORY[0x24BDF6950];
    -[_TVStackBackdropMaskingView gradientStop](self, "gradientStop");
    objc_msgSend(v19, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, v20);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34[2] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34[3] = objc_msgSend(v22, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v14, "setColors:", v23);

    v24 = self->_gradientLayer;
    v33[0] = &unk_24EBCD578;
    v25 = (void *)MEMORY[0x24BDD16E0];
    -[_TVStackBackdropMaskingView gradientScale](self, "gradientScale");
    objc_msgSend(v25, "numberWithDouble:", v26 * 0.5);
    gradientLayer = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = gradientLayer;
    v28 = (void *)MEMORY[0x24BDD16E0];
    -[_TVStackBackdropMaskingView gradientScale](self, "gradientScale");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v29;
    v33[3] = &unk_24EBCD588;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setLocations:](v24, "setLocations:", v30);

  }
}

- (_TVStackBackdropView)backdropView
{
  return self->_backdropView;
}

- (double)gradientScale
{
  return self->_gradientScale;
}

- (double)gradientStop
{
  return self->_gradientStop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
