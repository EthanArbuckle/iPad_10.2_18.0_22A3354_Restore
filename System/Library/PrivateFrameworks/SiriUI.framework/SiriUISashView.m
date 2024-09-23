@implementation SiriUISashView

- (SiriUISashView)initWithFrame:(CGRect)a3
{
  SiriUISashView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *contentView;
  void *v11;
  uint64_t v12;
  UIImageView *imageView;
  SiriUITextContainerView *v14;
  SiriUITextContainerView *textContainerView;
  SiriUITextContainerView *v16;
  void *v17;
  SiriUITextContainerView *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIVisualEffectView *vibrantTextBackgroundView;
  void *v24;
  UIView *v25;
  UIImageView *v26;
  SiriUITextContainerView *v27;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SiriUISashView;
  v3 = -[SiriUISashView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v9;

    -[SiriUISashView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v12;

    v14 = -[SiriUITextContainerView initWithText:]([SiriUITextContainerView alloc], "initWithText:", 0);
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v14;

    v16 = v3->_textContainerView;
    objc_msgSend((id)objc_opt_class(), "_font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUITextContainerView setFont:](v16, "setFont:", v17);

    v18 = v3->_textContainerView;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_semiTransparentTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUITextContainerView setTextColor:](v18, "setTextColor:", v19);

    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F88], "effectForBlurEffect:style:", v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v21);
    vibrantTextBackgroundView = v3->_vibrantTextBackgroundView;
    v3->_vibrantTextBackgroundView = (UIVisualEffectView *)v22;

    -[UIVisualEffectView contentView](v3->_vibrantTextBackgroundView, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v3->_textContainerView);

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_imageView);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_vibrantTextBackgroundView);
    -[SiriUISashView addSubview:](v3, "addSubview:", v3->_contentView);
    if (SiriLanguageIsRTL())
    {
      v25 = v3->_contentView;
      CGAffineTransformMakeScale(&v31, -1.0, 1.0);
      -[UIView setTransform:](v25, "setTransform:", &v31);
      v26 = v3->_imageView;
      CGAffineTransformMakeScale(&v30, -1.0, 1.0);
      -[UIImageView setTransform:](v26, "setTransform:", &v30);
      v27 = v3->_textContainerView;
      CGAffineTransformMakeScale(&v29, -1.0, 1.0);
      -[SiriUITextContainerView setTransform:](v27, "setTransform:", &v29);
    }

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double MaxX;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double y;
  double MidY;
  UIButton *backNavigationButton;
  double x;
  double v20;
  SiriUITextContainerView *textContainerView;
  double v22;
  double v23;
  double v24;
  double v25;
  double rect;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v30.receiver = self;
  v30.super_class = (Class)SiriUISashView;
  -[SiriUISashView layoutSubviews](&v30, sel_layoutSubviews);
  -[SiriUISashView bounds](self, "bounds");
  v4 = v3;
  v28 = v6;
  v29 = v5;
  v27 = v7;
  v8 = 16.0;
  -[SiriSharedUISashItem image](self->_sashItem, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MaxX = 0.0;
  if (v9)
  {
    v31.origin.x = 16.0;
    v31.origin.y = 16.0;
    v31.size.width = 20.0;
    v31.size.height = 20.0;
    MaxX = CGRectGetMaxX(v31);
  }

  v32.origin.x = v4;
  v32.origin.y = v29;
  v32.size.width = v28;
  v32.size.height = v27;
  v25 = v4;
  rect = CGRectGetWidth(v32) - MaxX;
  v33.origin.x = v4;
  v33.origin.y = v29;
  v33.size.width = v28;
  v33.size.height = v27;
  width = 20.0;
  height = 20.0;
  v13 = CGRectGetHeight(v33) - 16.0;
  v14 = 0.0;
  if (self->_requestsExtraPadding)
    v14 = 16.0;
  v15 = v13 - v14;
  y = 16.0;
  if (v13 - v14 > 20.0)
  {
    v34.origin.x = MaxX;
    v34.origin.y = 16.0;
    v34.size.width = rect;
    v34.size.height = v15;
    MidY = CGRectGetMidY(v34);
    v35.origin.x = 16.0;
    v35.origin.y = 16.0;
    v35.size.width = 20.0;
    v35.size.height = 20.0;
    y = MidY + CGRectGetHeight(v35) * -0.5;
  }
  -[UIVisualEffectView setHidden:](self->_vibrantButtonBackgroundView, "setHidden:", -[SiriUISashView isNavigating](self, "isNavigating", 0x4034000000000000, 0x4035000000000000, 0x4030000000000000) ^ 1);
  -[UIVisualEffectView setFrame:](self->_vibrantButtonBackgroundView, "setFrame:", v24, v24, v23, v22);
  backNavigationButton = self->_backNavigationButton;
  -[UIVisualEffectView bounds](self->_vibrantButtonBackgroundView, "bounds");
  -[UIButton setFrame:](backNavigationButton, "setFrame:");
  if (-[SiriUISashView isNavigating](self, "isNavigating"))
  {
    v36.origin.x = 16.0;
    v36.origin.y = y;
    v36.size.width = 20.0;
    v36.size.height = 20.0;
    v37 = CGRectOffset(v36, 20.0 + 10.0, 0.0);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v37.origin.x = MaxX;
    v37.origin.y = 16.0;
    v37.size.width = rect;
    v37.size.height = v15;
    v38 = CGRectOffset(v37, 20.0 + 10.0, 0.0);
    MaxX = v38.origin.x;
    v8 = v38.origin.y;
    v20 = v38.size.width;
    v15 = v38.size.height;
  }
  else
  {
    x = 16.0;
    v20 = rect;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v25, v29, v28, v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", x, y, width, height);
  -[UIVisualEffectView setFrame:](self->_vibrantTextBackgroundView, "setFrame:", MaxX, v8, v20, v15);
  textContainerView = self->_textContainerView;
  -[UIVisualEffectView bounds](self->_vibrantTextBackgroundView, "bounds");
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  SiriUISashItem *sashItem;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  sashItem = self->_sashItem;
  v6 = 0.0;
  if (sashItem && !-[SiriSharedUISashItem isHidden](sashItem, "isHidden", a3.width, a3.height))
  {
    -[SiriSharedUISashItem image](self->_sashItem, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 20.0 + 16.0;
    else
      v8 = 0.0;

    -[SiriUITextContainerView sizeThatFits:](self->_textContainerView, "sizeThatFits:", width - v8, 1.79769313e308);
    v10 = 20.0 + 16.0;
    if (20.0 + 16.0 < v9)
      v10 = v9;
    v11 = -0.0;
    if (self->_requestsExtraPadding)
      v11 = 16.0;
    v6 = v10 + v11;
  }
  v12 = width;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setSashItem:(id)a3 locale:(id)a4
{
  id v6;
  SiriUISashItem **p_sashItem;
  uint64_t v8;
  UIImageView *imageView;
  void *v10;
  SiriUITextContainerView *textContainerView;
  void *v12;
  SiriUITextContainerView *v13;
  void *v14;
  void *v15;
  UIView *contentView;
  void *v17;
  void *v18;
  SiriUITextContainerView *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v6 = a3;
  p_sashItem = &self->_sashItem;
  if (!-[SiriSharedUISashItem isEqual:](self->_sashItem, "isEqual:", v6))
  {
    objc_storeStrong((id *)&self->_sashItem, a3);
    if (*p_sashItem)
      v8 = -[SiriSharedUISashItem isHidden](*p_sashItem, "isHidden");
    else
      v8 = 1;
    imageView = self->_imageView;
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](imageView, "setImage:", v10);

    textContainerView = self->_textContainerView;
    objc_msgSend(v6, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUITextContainerView setText:](textContainerView, "setText:", v12);

    v13 = self->_textContainerView;
    v14 = (void *)objc_opt_class();
    if (v14)
    {
      objc_msgSend(v14, "_textContainerStyleForSashItem:", v6);
    }
    else
    {
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
    }
    -[SiriUITextContainerView setTextContainerStyle:](v13, "setTextContainerStyle:", &v21);
    -[UIImageView setHidden:](self->_imageView, "setHidden:", v8);
    -[SiriUITextContainerView setHidden:](self->_textContainerView, "setHidden:", v8);
    objc_msgSend(v6, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      contentView = self->_contentView;
      objc_msgSend(v6, "backgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](contentView, "setBackgroundColor:", v17);

    }
    objc_msgSend(v6, "textColor", v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = self->_textContainerView;
      objc_msgSend(v6, "textColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUITextContainerView setTextColor:](v19, "setTextColor:", v20);

      -[UIVisualEffectView setEffect:](self->_vibrantTextBackgroundView, "setEffect:", 0);
    }
    self->_requestsExtraPadding = objc_msgSend(v6, "requestsExtraPadding");
    -[SiriUISashView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setNavigating:(BOOL)a3
{
  if (self->_navigating != a3)
  {
    self->_navigating = a3;
    if (a3)
      -[SiriUISashView _setupBackNavigationButton](self, "_setupBackNavigationButton");
    -[SiriUISashView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIButton)backNavigationButton
{
  UIButton *backNavigationButton;

  backNavigationButton = self->_backNavigationButton;
  if (!backNavigationButton)
  {
    -[SiriUISashView _setupBackNavigationButton](self, "_setupBackNavigationButton");
    backNavigationButton = self->_backNavigationButton;
  }
  return backNavigationButton;
}

- (void)_setupBackNavigationButton
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *backNavigationButton;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  UIVisualEffectView *v12;
  UIVisualEffectView *vibrantButtonBackgroundView;
  void *v14;
  id v15;

  if (!self->_backNavigationButton)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithWeight:", 7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.left.circle.fill"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithConfiguration:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    backNavigationButton = self->_backNavigationButton;
    self->_backNavigationButton = v5;

    -[UIButton setBackgroundImage:forState:](self->_backNavigationButton, "setBackgroundImage:forState:", v4, 0);
    -[UIButton setBackgroundImage:forState:](self->_backNavigationButton, "setBackgroundImage:forState:", v4, 1);
    v7 = self->_backNavigationButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v7, "setTintColor:", v8);

    v9 = self->_backNavigationButton;
    UIEdgeInsetsMakeWithEdges();
    -[UIButton _setTouchInsets:](v9, "_setTouchInsets:");
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F88], "effectForBlurEffect:style:", v10, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v11);
    vibrantButtonBackgroundView = self->_vibrantButtonBackgroundView;
    self->_vibrantButtonBackgroundView = v12;

    -[UIVisualEffectView contentView](self->_vibrantButtonBackgroundView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_backNavigationButton);

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_vibrantButtonBackgroundView);
  }
}

+ (id)_font
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BDF78A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BDF7810];
  v5 = *MEMORY[0x24BDF7770];
  v14[0] = *MEMORY[0x24BDF7768];
  v14[1] = v5;
  v15[0] = v4;
  v15[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A78]), "initWithFontAttributes:", v6);
  v8 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaledValueForValue:", 15.0);
  v11 = round(v10);

  objc_msgSend(v8, "fontWithDescriptor:size:", v7, fmax(v11, 15.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ ($131113AABFBD927EF350151908AA1243)_textContainerStyleForSashItem:(SEL)a3
{
  void *v5;
  $131113AABFBD927EF350151908AA1243 *result;
  uint64_t v7;

  *(_OWORD *)&retstr->var0 = unk_217698040;
  *(_OWORD *)&retstr->var2 = unk_217698050;
  *(_OWORD *)&retstr->var3.left = unk_217698060;
  retstr->var3.right = 16.0;
  objc_msgSend(a4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    result = ($131113AABFBD927EF350151908AA1243 *)SiriLanguageIsRTL();
    v7 = 32;
    if ((_DWORD)result)
      v7 = 48;
    *(double *)((char *)&retstr->var0 + v7) = *(double *)((char *)&retstr->var0 + v7) + -8.0;
  }
  return result;
}

- (SiriUISashItem)sashItem
{
  return self->_sashItem;
}

- (BOOL)isNavigating
{
  return self->_navigating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backNavigationButton, 0);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->_vibrantTextBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
