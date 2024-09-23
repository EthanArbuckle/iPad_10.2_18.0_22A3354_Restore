@implementation TPInComingCallBottomBarSupplementalButton

- (TPInComingCallBottomBarSupplementalButton)initWithFrame:(CGRect)a3
{
  TPInComingCallBottomBarSupplementalButton *v3;
  TPInComingCallBottomBarSupplementalButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
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
  UIView *backdropEffectView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[4];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  v3 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TPInComingCallBottomBarSupplementalButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", 1);

    +[TPUIConfiguration defaultFont](TPUIConfiguration, "defaultFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarSupplementalButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[TPInComingCallBottomBarSupplementalButton titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarSupplementalButton setTintColor:](v4, "setTintColor:", v9);

    -[TPInComingCallBottomBarSupplementalButton titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 2);

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 40.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v35);
    v38[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundEffects:](v11, "setBackgroundEffects:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v14);

    -[UIView layer](v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    -[UIView layer](v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", 22.0);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPInComingCallBottomBarSupplementalButton imageView](v4, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarSupplementalButton insertSubview:belowSubview:](v4, "insertSubview:belowSubview:", v11, v17);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIView centerXAnchor](v11, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarSupplementalButton imageView](v4, "imageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    -[UIView centerYAnchor](v11, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarSupplementalButton imageView](v4, "imageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v19;
    -[UIView widthAnchor](v11, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 44.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v21;
    -[UIView heightAnchor](v11, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v11, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v25);

    backdropEffectView = v4->_backdropEffectView;
    v4->_backdropEffectView = v11;

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
  v4 = v3;
  -[TPInComingCallBottomBarSupplementalButton image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  -[TPInComingCallBottomBarSupplementalButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;

  if (v7 >= v10)
    v11 = v7;
  else
    v11 = v10;
  if (v4 >= v11)
    v11 = v4;
  v12 = ceil(v11);
  if (v12 <= 100.0)
    v13 = v12;
  else
    v13 = 100.0;
  +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
  v15 = v14;
  v16 = v13;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  -[TPInComingCallBottomBarSupplementalButton imageRectForContentRect:](&v8, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width * 0.5 - v4 * 0.5;
  v7 = 2.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];
  CGRect result;

  width = a3.size.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  -[TPInComingCallBottomBarSupplementalButton titleRectForContentRect:](&v19, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TPInComingCallBottomBarSupplementalButton imageForState:](self, "imageForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6 + 20.0;

  +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
  v9 = v8 - v7;
  -[TPInComingCallBottomBarSupplementalButton currentTitle](self, "currentTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0DC1138];
  +[TPUIConfiguration defaultFont](TPUIConfiguration, "defaultFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, width, 3.40282347e38);
  v14 = v13;

  if (v9 >= v14)
    v15 = v14;
  else
    v15 = v9;
  v16 = 0.0;
  v17 = v7;
  v18 = width;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (UIView)backdropEffectView
{
  return (UIView *)objc_getProperty(self, a2, 752, 1);
}

- (void)setBackdropEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
}

@end
