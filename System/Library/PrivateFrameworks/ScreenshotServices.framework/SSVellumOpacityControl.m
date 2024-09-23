@implementation SSVellumOpacityControl

- (SSVellumOpacityControl)initWithFrame:(CGRect)a3
{
  SSVellumOpacityControl *v3;
  UISlider *v4;
  UISlider *slider;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  UISlider *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImageView *leadingImageView;
  uint64_t v26;
  UIImageView *trailingImageView;
  UIImageView *v28;
  void *v29;
  UIImageView *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SSVellumOpacityControl;
  v3 = -[SSVellumOpacityControl initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UISlider *)objc_alloc_init(MEMORY[0x24BDF6DA8]);
  slider = v3->_slider;
  v3->_slider = v4;

  LODWORD(v6) = 0;
  -[UISlider setMinimumValue:](v3->_slider, "setMinimumValue:", v6);
  LODWORD(v7) = *(_DWORD *)"fff?";
  -[UISlider setMaximumValue:](v3->_slider, "setMaximumValue:", v7);
  LODWORD(v8) = 0;
  -[UISlider setValue:](v3->_slider, "setValue:", v8);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISlider setMinimumTrackTintColor:](v3->_slider, "setMinimumTrackTintColor:", v10);
  -[UISlider setMaximumTrackTintColor:](v3->_slider, "setMaximumTrackTintColor:", v10);
  v11 = v3->_slider;
  if (SSVellumOpacityControlKnobImage_onceToken != -1)
    dispatch_once(&SSVellumOpacityControlKnobImage_onceToken, &__block_literal_global_4);
  -[UISlider setThumbImage:forState:](v11, "setThumbImage:forState:", __SSVellumOpacityControlKnobImage, 0);
  +[SSMaterial vellumOpacitySliderTrack](SSMaterial, "vellumOpacitySliderTrack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISlider _minTrackView](v3->_slider, "_minTrackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyToView:", v13);

  -[UISlider _maxTrackView](v3->_slider, "_maxTrackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyToView:", v14);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("app"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF77B0], 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithSymbolConfiguration:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "imageWithRenderingMode:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("app.fill"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", v16, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageWithSymbolConfiguration:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "imageWithRenderingMode:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v19);
  leadingImageView = v3->_leadingImageView;
  v3->_leadingImageView = (UIImageView *)v24;

  v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v23);
  trailingImageView = v3->_trailingImageView;
  v3->_trailingImageView = (UIImageView *)v26;

  -[UIImageView _setOverrideUserInterfaceStyle:](v3->_leadingImageView, "_setOverrideUserInterfaceStyle:", 2);
  -[UIImageView _setOverrideUserInterfaceStyle:](v3->_trailingImageView, "_setOverrideUserInterfaceStyle:", 2);
  v28 = v3->_leadingImageView;
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v28, "setTintColor:", v29);

  v30 = v3->_trailingImageView;
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v30, "setTintColor:", v31);

  -[UIImageView setShowsLargeContentViewer:](v3->_leadingImageView, "setShowsLargeContentViewer:", 1);
  -[UIImageView setShowsLargeContentViewer:](v3->_trailingImageView, "setShowsLargeContentViewer:", 1);
  +[SSMaterial vellumOpacitySliderValueImage](SSMaterial, "vellumOpacitySliderValueImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "applyToView:", v3->_leadingImageView);
  -[SSVellumOpacityControl addSubview:](v3, "addSubview:", v3->_slider);
  -[SSVellumOpacityControl addSubview:](v3, "addSubview:", v3->_leadingImageView);
  -[SSVellumOpacityControl addSubview:](v3, "addSubview:", v3->_trailingImageView);

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[SSVellumOpacityControl intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

+ (double)preferredWidth
{
  return 233.0;
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
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  -[SSVellumOpacityControl bounds](self, "bounds");
  v4 = v3;
  UIRectCenteredYInRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SSVellumOpacityControl _leftImageView](self, "_leftImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[SSVellumOpacityControl _rightImageView](self, "_rightImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4 - v10, v8, v10, v12);

  UIRectCenteredIntegralRect();
  -[UISlider setFrame:](self->_slider, "setFrame:");
}

- (id)_leftImageView
{
  uint64_t v3;
  int *v4;

  v3 = -[SSVellumOpacityControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &OBJC_IVAR___SSVellumOpacityControl__trailingImageView;
  if (!v3)
    v4 = &OBJC_IVAR___SSVellumOpacityControl__leadingImageView;
  return *(id *)((char *)&self->super.super.super.super.isa + *v4);
}

- (id)_rightImageView
{
  uint64_t v3;
  int *v4;

  v3 = -[SSVellumOpacityControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v4 = &OBJC_IVAR___SSVellumOpacityControl__leadingImageView;
  if (!v3)
    v4 = &OBJC_IVAR___SSVellumOpacityControl__trailingImageView;
  return *(id *)((char *)&self->super.super.super.super.isa + *v4);
}

- (void)setValue:(double)a3
{
  *(float *)&a3 = a3;
  -[UISlider setValue:](self->_slider, "setValue:", a3);
  -[SSVellumOpacityControl setNeedsLayout](self, "setNeedsLayout");
}

- (double)value
{
  float v2;

  -[UISlider value](self->_slider, "value");
  return v2;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  -[UISlider addTarget:action:forControlEvents:](self->_slider, "addTarget:action:forControlEvents:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
