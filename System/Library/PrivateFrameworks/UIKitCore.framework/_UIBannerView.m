@implementation _UIBannerView

- (_UIBannerView)initWithFrame:(CGRect)a3
{
  _UIBannerView *v3;
  uint64_t v4;
  CALayer *backgroundLayer;
  uint64_t v6;
  id v7;
  double v8;
  void *v9;
  UILabel *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UILabel *titleLabel;
  void *v17;
  UILabel *v18;
  UILabel *bodyLabel;
  void *v20;
  void *v21;
  UIImageView *v22;
  UIImageView *imageView;
  double v24;
  double v25;
  double v26;
  double v27;
  UIView *v28;
  UIView *highlightView;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)_UIBannerView;
  v3 = -[UIView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = (CALayer *)v4;

    v6 = *MEMORY[0x1E0CD2A68];
    -[CALayer setCornerCurve:](v3->_backgroundLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[CALayer setCornerRadius:](v3->_backgroundLayer, "setCornerRadius:", 13.0);
    +[UIColor blackColor](UIColor, "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setShadowColor:](v3->_backgroundLayer, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    -[CALayer setShadowRadius:](v3->_backgroundLayer, "setShadowRadius:", 10.0);
    -[CALayer setShadowOffset:](v3->_backgroundLayer, "setShadowOffset:", 0.0, 5.0);
    LODWORD(v8) = 1045220557;
    -[CALayer setShadowOpacity:](v3->_backgroundLayer, "setShadowOpacity:", v8);
    -[UIView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v3->_backgroundLayer);

    v10 = [UILabel alloc];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = -[UILabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(off_1E167A828, "defaultFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedSubhead"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v17);

    -[UIView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v18 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v11, v12, v13, v14);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 0);
    objc_msgSend(off_1E167A830, "defaultFontDescriptorWithTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v20, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_bodyLabel, "setFont:", v21);

    -[UIView addSubview:](v3, "addSubview:", v3->_bodyLabel);
    v22 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v11, v12, v13, v14);
    imageView = v3->_imageView;
    v3->_imageView = v22;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1148829696;
    -[UIView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148829696;
    -[UIView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148829696;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148829696;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    -[UIView addSubview:](v3, "addSubview:", v3->_imageView);
    v28 = objc_alloc_init(UIView);
    highlightView = v3->_highlightView;
    v3->_highlightView = v28;

    +[UIColor blackColor](UIColor, "blackColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_highlightView, "setBackgroundColor:", v30);

    -[UIView setAlpha:](v3->_highlightView, "setAlpha:", 0.0);
    -[UIView layer](v3->_highlightView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerCurve:", v6);

    -[CALayer cornerRadius](v3->_backgroundLayer, "cornerRadius");
    v33 = v32;
    -[UIView layer](v3->_highlightView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", v33);

    -[UIView addSubview:](v3, "addSubview:", v3->_highlightView);
    -[UIView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
  }
  return v3;
}

- (void)updateConstraints
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_UIBannerView;
  -[UIView updateConstraints](&v34, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_imageView, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[UIView leadingAnchor](self->_imageView, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[UIView bottomAnchor](self->_imageView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v11, -16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[UIView firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 28.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[UIView leadingAnchor](self->_titleLabel, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_imageView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[UIView trailingAnchor](self->_titleLabel, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[UIView firstBaselineAnchor](self->_bodyLabel, "firstBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[UIView leadingAnchor](self->_bodyLabel, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_titleLabel, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[UIView trailingAnchor](self->_bodyLabel, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_titleLabel, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  -[UIView lastBaselineAnchor](self->_bodyLabel, "lastBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, -16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIBannerView;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v5, v7, v9, v11);
}

- (void)setContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  objc_msgSend(v4, "contentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  objc_msgSend(v4, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_bodyLabel, "setText:", v7);

  objc_msgSend(v4, "contentColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_bodyLabel, "setTextColor:", v8);

  objc_msgSend(v4, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  objc_msgSend(v4, "contentColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_imageView, "setTintColor:", v10);

  objc_msgSend(v4, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[UIColor grayColor](UIColor, "grayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_retainAutorelease(v11);
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

}

- (void)setHighlighted:(BOOL)a3 initialPress:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_highlighted != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_highlighted = a3;
    v10[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45___UIBannerView_setHighlighted_initialPress___block_invoke;
    v8[3] = &unk_1E16DFC90;
    v9 = v5;
    v8[4] = self;
    +[UIButton _setVisuallyHighlighted:forViews:initialPress:highlightBlock:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v5, v7, v4, v8);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[_UIBannerView setHighlighted:initialPress:](self, "setHighlighted:initialPress:", a3, 0);
}

- (_UIBannerContent)content
{
  return self->_content;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
