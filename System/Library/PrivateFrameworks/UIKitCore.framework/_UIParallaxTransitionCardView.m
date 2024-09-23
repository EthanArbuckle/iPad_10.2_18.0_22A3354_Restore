@implementation _UIParallaxTransitionCardView

- (_UIParallaxTransitionCardView)initWithFrame:(CGRect)a3
{
  _UIParallaxTransitionCardView *v3;
  UIView *v4;
  uint64_t v5;
  UIView *contentView;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)_UIParallaxTransitionCardView;
  v3 = -[UIView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    +[_UIFluidNavigationTransitionsDomain parallaxSettings](_UIFluidNavigationTransitionsDomain, "parallaxSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "roundedCorners");

    if (v8)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_displayCornerRadius");
      v11 = v10;
      -[UIView layer](v3->_contentView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCornerRadius:", v11);

      v13 = *MEMORY[0x1E0CD2A68];
      -[UIView layer](v3->_contentView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerCurve:", v13);

      -[UIView layer](v3->_contentView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMasksToBounds:", 1);

      -[UIView layer](v3->_contentView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cornerRadius");
      v18 = v17;
      -[UIView layer](v3, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCornerRadius:", v18);

      -[UIView layer](v3->_contentView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cornerCurve");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v3, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerCurve:", v21);

      +[UIColor blackColor](UIColor, "blackColor");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = objc_msgSend(v23, "CGColor");
      -[UIView layer](v3, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setShadowColor:", v24);

      -[UIView layer](v3, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = 1039516303;
      objc_msgSend(v26, "setShadowOpacity:", v27);

      -[UIView layer](v3, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShadowRadius:", 12.0);

    }
    -[UIView bounds](v3, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[_UIParallaxTransitionCardView contentView](v3, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

    -[UIView addSubview:](v3, "addSubview:", v3->_contentView);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  UIView *contentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIParallaxTransitionCardView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  contentView = self->_contentView;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  UIView *contentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIParallaxTransitionCardView;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  contentView = self->_contentView;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
