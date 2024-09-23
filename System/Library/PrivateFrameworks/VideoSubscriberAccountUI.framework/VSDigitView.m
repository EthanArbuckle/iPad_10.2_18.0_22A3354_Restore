@implementation VSDigitView

- (VSDigitView)initWithFrame:(CGRect)a3
{
  VSDigitView *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VSDigitView;
  v3 = -[VSDigitView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDigitView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[VSDigitView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    -[VSDigitView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 5.0);

    v8 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v10);

    objc_msgSend(v8, "setTextAlignment:", 1);
    -[VSDigitView setLabel:](v3, "setLabel:", v8);
    -[VSDigitView addSubview:](v3, "addSubview:", v8);
    -[VSDigitView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(v8, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDigitView topAnchor](v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v8, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDigitView bottomAnchor](v3, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(v8, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDigitView leftAnchor](v3, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v8, "rightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDigitView rightAnchor](v3, "rightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
