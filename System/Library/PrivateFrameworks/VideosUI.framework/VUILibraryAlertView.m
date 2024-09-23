@implementation VUILibraryAlertView

- (VUILibraryAlertView)initWithFrame:(CGRect)a3
{
  VUILibraryAlertView *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  UIView *v6;
  UIView *containerView;
  VUITextLayout *v8;
  uint64_t v9;
  VUILabel *titleLabel;
  VUITextLayout *v11;
  uint64_t v12;
  VUILabel *subtitleLabel;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VUILibraryAlertView;
  v3 = -[VUILibraryAlertView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    -[UIScrollView setAutoresizingMask:](v3->_scrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setDirectionalLockEnabled:](v3->_scrollView, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setShowsVerticalScrollIndicator:](v3->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[VUILibraryAlertView addSubview:](v3, "addSubview:", v3->_scrollView);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v3->_containerView;
    v3->_containerView = v6;

    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_containerView);
    v8 = objc_alloc_init(VUITextLayout);
    -[VUILibraryAlertView configureTitleTextLayout:](v3, "configureTitleTextLayout:", v8);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v9;

    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_titleLabel);
    v11 = objc_alloc_init(VUITextLayout);
    -[VUILibraryAlertView configureSubtitleTextLayout:](v3, "configureSubtitleTextLayout:", v11);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (VUILabel *)v12;

    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_subtitleLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryAlertView setBackgroundColor:](v3, "setBackgroundColor:", v14);

    -[UIScrollView setContentInsetAdjustmentBehavior:](v3->_scrollView, "setContentInsetAdjustmentBehavior:", 3);
  }
  return v3;
}

- (void)configureTitleTextLayout:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTextStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v3);

  objc_msgSend(v4, "setFontWeight:", 10);
  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setNumberOfLines:", 0);

}

- (void)configureSubtitleTextLayout:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTextStyle:", 14);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v3);

  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setNumberOfLines:", 0);

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
  UIScrollView *scrollView;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL8 v26;
  double v27;
  UIScrollView *v28;
  VUILabel *subtitleLabel;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[VUILibraryAlertView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  scrollView = self->_scrollView;
  -[VUILibraryAlertView bounds](self, "bounds");
  -[UIScrollView setFrame:](scrollView, "setFrame:");
  -[VUILibraryAlertView bounds](self, "bounds");
  Width = CGRectGetWidth(v34);
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v14 = v13;
  v16 = Width - (v13 + v15);
  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    if (-[VUILibraryAlertView vuiIsRTL](self, "vuiIsRTL"))
      v17 = v10;
    else
      v17 = v6;
    v16 = v16 - v17;
  }
  -[VUILibraryAlertView bounds](self, "bounds");
  v18 = CGRectGetHeight(v35) - v4 - v8;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v16, 1.79769313e308);
  v20 = v19;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v16, 1.79769313e308);
  v22 = v21;
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 35.0);
  v24 = v23;
  v25 = v20 + v22 + v23;
  v26 = v25 > v18;
  if (v25 <= v18)
    v27 = (v18 - v25) * 0.5;
  else
    v27 = 0.0;
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v26);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", -[UIScrollView isScrollEnabled](self->_scrollView, "isScrollEnabled"));
  v28 = self->_scrollView;
  -[VUILibraryAlertView bounds](self, "bounds");
  -[UIScrollView setContentSize:](v28, "setContentSize:", v16, fmax(v25, CGRectGetHeight(v36)));
  -[UIView setFrame:](self->_containerView, "setFrame:", v14, v27, v16, v20 + v22 + v24);
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v16, v20);
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[VUILabel text](subtitleLabel, "text");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      -[VUILabel text](self->_subtitleLabel, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", &stru_1E9FF3598);

      if ((v33 & 1) == 0)
        -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, v20 + v24, v16, v22);
    }
  }
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
