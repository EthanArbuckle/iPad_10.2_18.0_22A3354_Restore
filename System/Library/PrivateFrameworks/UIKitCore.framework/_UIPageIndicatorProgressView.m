@implementation _UIPageIndicatorProgressView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double Width;
  double Height;
  double MaxY;
  double MaxX;
  double v45;
  double v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v48.receiver = self;
  v48.super_class = (Class)_UIPageIndicatorProgressView;
  -[UIView layoutSubviews](&v48, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  -[UIView bounds](self, "bounds");
  v6 = fmin(v4, v5) * 0.5;
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v6);
  -[_UIPageIndicatorProgressView filledView](self, "filledView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_UIPageIndicatorProgressView backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "direction");

  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_transitionDirection");

  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentProgress");
  v23 = v22;

  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_adjustedDefaultModeSize");
  v26 = v25;
  v28 = v27;

  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_adjustedExpandedModeSize");
  v31 = v30;
  v33 = v32;

  v35 = *MEMORY[0x1E0C9D538];
  v34 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIPageIndicatorProgressView indicatorView](self, "indicatorView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "direction");

  v38 = (1.0 - v23) * v26 + v31 * v23;
  if (v37 <= 1)
    v39 = v33;
  else
    v39 = (1.0 - v23) * v28 + v33 * v23;
  if (v37 <= 1)
    v40 = v38;
  else
    v40 = v31;
  switch(v18)
  {
    case 0:
      if (v20 == 1)
      {
        -[UIView bounds](self, "bounds");
        Width = CGRectGetWidth(v49);
        v50.origin.x = v35;
        v50.origin.y = v34;
        v50.size.width = v31;
        v50.size.height = v33;
        v35 = Width - CGRectGetWidth(v50);
      }
      break;
    case 1:
      if (v20 == 1)
      {
        v54.origin.x = v35;
        v54.origin.y = v34;
        v54.size.width = v31;
        v54.size.height = v33;
        MaxX = CGRectGetWidth(v54);
      }
      else
      {
        -[UIView bounds](self, "bounds");
        MaxX = CGRectGetMaxX(v57);
      }
      v46 = MaxX;
      v58.origin.x = v35;
      v58.origin.y = v34;
      v58.size.width = v40;
      v58.size.height = v39;
      v35 = v46 - CGRectGetWidth(v58);
      break;
    case 2:
      if (v20 == 1)
      {
        -[UIView bounds](self, "bounds");
        Height = CGRectGetHeight(v51);
        v52.origin.x = v35;
        v52.origin.y = v34;
        v52.size.width = v31;
        v52.size.height = v33;
        v34 = Height - CGRectGetHeight(v52);
      }
      break;
    case 3:
      if (v20 == 1)
      {
        v53.origin.x = v35;
        v53.origin.y = v34;
        v53.size.width = v31;
        v53.size.height = v33;
        MaxY = CGRectGetHeight(v53);
      }
      else
      {
        -[UIView bounds](self, "bounds");
        MaxY = CGRectGetMaxY(v55);
      }
      v45 = MaxY;
      v56.origin.x = v35;
      v56.origin.y = v34;
      v56.size.width = v40;
      v56.size.height = v39;
      v34 = v45 - CGRectGetHeight(v56);
      break;
    default:
      break;
  }
  -[_UIPageIndicatorProgressView filledView](self, "filledView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v35, v34, v40, v39);

}

- (_UIPageIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (UIView)filledView
{
  return self->_filledView;
}

- (void)setIndicatorView:(id)a3
{
  self->_indicatorView = (_UIPageIndicatorView *)a3;
}

- (void)prepare
{
  void *v3;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *backgroundView;
  UIView *v11;
  UIView *filledView;
  void *v13;

  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsEdgeAntialiasing:", 1);

  v4 = [UIView alloc];
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v9;

  -[UIView addSubview:](self, "addSubview:", self->_backgroundView);
  v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
  filledView = self->_filledView;
  self->_filledView = v11;

  -[UIView layer](self->_filledView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](self, "addSubview:", self->_filledView);
}

- (_UIPageIndicatorProgressView)initWithFrame:(CGRect)a3
{
  _UIPageIndicatorProgressView *v3;
  _UIPageIndicatorProgressView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorProgressView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorProgressView prepare](v3, "prepare");
  return v4;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIPageIndicatorProgressView)initWithCoder:(id)a3
{
  _UIPageIndicatorProgressView *v3;
  _UIPageIndicatorProgressView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorProgressView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorProgressView prepare](v3, "prepare");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
