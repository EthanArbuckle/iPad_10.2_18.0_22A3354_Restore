@implementation PKMessageExtensionMessageBubbleView

- (PKMessageExtensionMessageBubbleView)init
{
  PKMessageExtensionMessageBubbleView *v2;
  PKMessageExtensionMessageBubbleView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMessageExtensionMessageBubbleView;
  v2 = -[PKMessageExtensionMessageBubbleView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKMessageExtensionMessageBubbleView _setupBubbleView](v2, "_setupBubbleView");
  return v3;
}

- (void)beginValidateMessage
{
  _QWORD v2[5];

  if (!self->_isValidatingMessage)
  {
    self->_isValidatingMessage = 1;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __59__PKMessageExtensionMessageBubbleView_beginValidateMessage__block_invoke;
    v2[3] = &unk_1E3E612E8;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0x10000, v2, 0);
  }
}

uint64_t __59__PKMessageExtensionMessageBubbleView_beginValidateMessage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "startAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

- (void)completeValidateMessage
{
  _QWORD v2[5];

  if (self->_isValidatingMessage)
  {
    self->_isValidatingMessage = 0;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __62__PKMessageExtensionMessageBubbleView_completeValidateMessage__block_invoke;
    v2[3] = &unk_1E3E612E8;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0x10000, v2, 0);
  }
}

uint64_t __62__PKMessageExtensionMessageBubbleView_completeValidateMessage__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "stopAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 497);

    if (!v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKMessageExtensionMessageBubbleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, 10000.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMessageExtensionMessageBubbleView;
  -[PKMessageExtensionMessageBubbleView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKMessageExtensionMessageBubbleView bounds](self, "bounds");
  -[PKMessageExtensionMessageBubbleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  int v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  char v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGRectEdge v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  double v28;
  UIImageView *buttonIconView;
  UILabel *buttonLabel;
  CGFloat v31;
  UIActivityIndicatorView *spinner;
  void *v33;
  UIImageView *cardArtImageView;
  double v35;
  CGFloat v36;
  UILabel *leftTitleLabel;
  UILabel *rightTitleLabel;
  double v39;
  double v40;
  CGSize v41;
  CGSize v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[PKMessageExtensionMessageBubbleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  v11 = self->_contentInset.left + 12.0;
  v12 = x + v11;
  v13 = 0.0;
  v14 = width - (v11 + self->_contentInset.right + 12.0);
  remainder.origin.x = v12;
  remainder.origin.y = y + 0.0;
  remainder.size.width = v14;
  remainder.size.height = height;
  v15 = -[UILabel isHidden](self->_buttonLabel, "isHidden");
  v51.origin.x = v12;
  v51.origin.y = y + 0.0;
  v51.size.width = v14;
  v51.size.height = height;
  CGRectDivide(v51, &slice, &remainder, 13.0, CGRectMaxYEdge);
  -[UILabel sizeThatFits:](self->_buttonLabel, "sizeThatFits:", width, height);
  v17 = v16;
  PKFloatRoundToPixel();
  v19 = v18;
  v47.origin.x = 0.0;
  v47.origin.y = 0.0;
  v47.size.width = v18;
  v47.size.height = v17 + v17;
  v41 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v43 = (CGPoint)*MEMORY[0x1E0C9D648];
  v46.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v46.size = v41;
  if ((v15 & 1) != 0)
  {
    v46 = remainder;
  }
  else
  {
    if (v10)
      v20 = CGRectMinXEdge;
    else
      v20 = CGRectMaxXEdge;
    CGRectDivide(remainder, &slice, &v46, v18, v20);
    v13 = slice.origin.x;
    v47.origin.x = slice.origin.x;
    CGRectDivide(v46, &slice, &v46, 5.0, v20);
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v46.size.width, v46.size.height, v41);
  if (v21 == 0.0)
  {
    -[UILabel font](self->_subtitleLabel, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lineHeight");
    v24 = v23;

  }
  else
  {
    v24 = v21;
  }
  CGRectDivide(v46, &slice, &v46, v24, CGRectMaxYEdge);
  if (!a4)
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v46.size.width, v46.size.height);
  v45.origin = v43;
  v45.size = v42;
  CGRectDivide(v46, &v45, &v46, v25, CGRectMaxYEdge);
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
    if ((v15 & 1) == 0)
    {
      v26 = v45.origin.y;
      v47.origin.y = v45.origin.y;
      -[UIView setFrame:](self->_buttonBackgroundView, "setFrame:", v13, v45.origin.y, v19, v17 + v17);
      -[UIView layer](self->_buttonBackgroundView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      PKFloatRoundToPixel();
      objc_msgSend(v27, "setCornerRadius:", fmin(v28, 20.0));

      v52.origin.x = v13;
      v52.origin.y = v26;
      v52.size.width = v19;
      v52.size.height = v17 + v17;
      CGRectDivide(v52, &slice, &v47, 8.0, CGRectMinXEdge);
      CGRectDivide(v47, &slice, &v47, 14.0, CGRectMinXEdge);
      buttonIconView = self->_buttonIconView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](buttonIconView, "setFrame:");
      CGRectDivide(v47, &slice, &v47, 4.0, CGRectMinXEdge);
      CGRectDivide(v47, &slice, &v47, 8.0, CGRectMaxXEdge);
      buttonLabel = self->_buttonLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](buttonLabel, "setFrame:");
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
  v44.origin = v43;
  v44.size = v42;
  v31 = CGRectGetMinY(v45) + -12.0 + -13.0;
  CGRectDivide(remainder, &v44, &remainder, v31, CGRectMinYEdge);
  if (!a4)
  {
    -[UIView setFrame:](self->_cardView, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    spinner = self->_spinner;
    -[UIView center](self->_cardView, "center");
    -[UIActivityIndicatorView setCenter:](spinner, "setCenter:");
  }
  if (!self->_isUsingFallbackImage)
  {
    PKSizeScaleAspectFit();
    if (a4)
      goto LABEL_20;
    goto LABEL_19;
  }
  -[UIImageView image](self->_cardArtImageView, "image");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "size");

  if (!a4)
  {
LABEL_19:
    cardArtImageView = self->_cardArtImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](cardArtImageView, "setFrame:");
    v53 = CGRectInset(v44, 5.0, 5.0);
    v35 = v53.size.height;
    v36 = v53.size.width * 0.5;
    -[UILabel sizeThatFits:](self->_leftTitleLabel, "sizeThatFits:", v53.size.width * 0.5, v53.size.height);
    leftTitleLabel = self->_leftTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leftTitleLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_rightTitleLabel, "sizeThatFits:", v36, v35);
    rightTitleLabel = self->_rightTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](rightTitleLabel, "setFrame:");
  }
LABEL_20:
  v39 = height - CGRectGetMinY(v45) + 13.0 + v44.size.width * 0.6 + 12.0;
  v40 = width;
  result.height = v39;
  result.width = v40;
  return result;
}

- (void)_setupBubbleView
{
  int v3;
  void *v4;
  UIView *v5;
  UIView *cardView;
  UIView *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *cardArtImageView;
  UILabel *v12;
  UILabel *leftTitleLabel;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *rightTitleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UIView *v24;
  UIView *buttonBackgroundView;
  UIView *v26;
  void *v27;
  UILabel *v28;
  UILabel *buttonLabel;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIImageView *v37;
  UIImageView *buttonIconView;
  UILabel *v39;
  UILabel *titleLabel;
  UILabel *v41;
  void *v42;
  uint64_t v43;
  double v44;
  UILabel *v45;
  void *v46;
  UILabel *v47;
  UILabel *subtitleLabel;
  UILabel *v49;
  void *v50;
  double v51;
  UILabel *v52;
  void *v53;
  UIActivityIndicatorView *v54;
  UIActivityIndicatorView *spinner;
  id v56;

  v3 = -[PKMessageExtensionMessageBubbleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKMessageExtensionMessageBubbleView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  -[PKMessageExtensionMessageBubbleView setAutoresizingMask:](self, "setAutoresizingMask:", 18);
  +[PKSharingMessageExtensionInvitationTheme messageBubbleBackgroundColor](PKSharingMessageExtensionInvitationTheme, "messageBubbleBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMessageExtensionMessageBubbleView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  cardView = self->_cardView;
  self->_cardView = v5;

  v7 = self->_cardView;
  +[PKSharingMessageExtensionInvitationTheme carKeyImageBackgroundColor](PKSharingMessageExtensionInvitationTheme, "carKeyImageBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UIView layer](self->_cardView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 8.0);

  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_cardView);
  v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  cardArtImageView = self->_cardArtImageView;
  self->_cardArtImageView = v10;

  -[UIImageView layer](self->_cardArtImageView, "layer");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setCornerRadius:", 8.0);
  objc_msgSend(v56, "setMasksToBounds:", 1);
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_cardArtImageView);
  v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  leftTitleLabel = self->_leftTitleLabel;
  self->_leftTitleLabel = v12;

  v14 = self->_leftTitleLabel;
  +[PKSharingMessageExtensionInvitationTheme messageDefaultFont](PKSharingMessageExtensionInvitationTheme, "messageDefaultFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v15);

  -[UILabel setTextAlignment:](self->_leftTitleLabel, "setTextAlignment:", 0);
  -[UILabel setNumberOfLines:](self->_leftTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setMinimumScaleFactor:](self->_leftTitleLabel, "setMinimumScaleFactor:", 0.5);
  v16 = self->_leftTitleLabel;
  +[PKSharingMessageExtensionInvitationTheme primaryTextColor](PKSharingMessageExtensionInvitationTheme, "primaryTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v16, "setTextColor:", v17);

  -[UILabel setBaselineAdjustment:](self->_leftTitleLabel, "setBaselineAdjustment:", 1);
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_leftTitleLabel);
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  rightTitleLabel = self->_rightTitleLabel;
  self->_rightTitleLabel = v18;

  v20 = self->_rightTitleLabel;
  +[PKSharingMessageExtensionInvitationTheme messageDefaultFont](PKSharingMessageExtensionInvitationTheme, "messageDefaultFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v20, "setFont:", v21);

  -[UILabel setTextAlignment:](self->_rightTitleLabel, "setTextAlignment:", 2);
  -[UILabel setNumberOfLines:](self->_rightTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setMinimumScaleFactor:](self->_rightTitleLabel, "setMinimumScaleFactor:", 0.5);
  v22 = self->_rightTitleLabel;
  +[PKSharingMessageExtensionInvitationTheme primaryTextColor](PKSharingMessageExtensionInvitationTheme, "primaryTextColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v22, "setTextColor:", v23);

  -[UILabel setBaselineAdjustment:](self->_rightTitleLabel, "setBaselineAdjustment:", 1);
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_rightTitleLabel);
  v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  buttonBackgroundView = self->_buttonBackgroundView;
  self->_buttonBackgroundView = v24;

  v26 = self->_buttonBackgroundView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_buttonBackgroundView);
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  buttonLabel = self->_buttonLabel;
  self->_buttonLabel = v28;

  v30 = self->_buttonLabel;
  +[PKSharingMessageExtensionInvitationTheme messageDefaultFont](PKSharingMessageExtensionInvitationTheme, "messageDefaultFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v30, "setFont:", v31);

  -[UILabel setTextAlignment:](self->_buttonLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_buttonLabel, "setNumberOfLines:", 1);
  -[UILabel setMinimumScaleFactor:](self->_buttonLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setBaselineAdjustment:](self->_buttonLabel, "setBaselineAdjustment:", 1);
  v32 = self->_buttonLabel;
  +[PKSharingMessageExtensionInvitationTheme primaryTextColor](PKSharingMessageExtensionInvitationTheme, "primaryTextColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v32, "setTextColor:", v33);

  -[UILabel setHidden:](self->_buttonLabel, "setHidden:", 1);
  -[UILabel setClipsToBounds:](self->_buttonLabel, "setClipsToBounds:", 1);
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_buttonLabel);
  v34 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "imageNamed:inBundle:", CFSTR("AddPass_Icon"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v36);
  buttonIconView = self->_buttonIconView;
  self->_buttonIconView = v37;

  -[UIImageView setContentMode:](self->_buttonIconView, "setContentMode:", 1);
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_buttonIconView);
  v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v39;

  v41 = self->_titleLabel;
  +[PKSharingMessageExtensionInvitationTheme messageTitleFont](PKSharingMessageExtensionInvitationTheme, "messageTitleFont");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v41, "setFont:", v42);

  if (v3)
    v43 = 2;
  else
    v43 = 0;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v43);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  LODWORD(v44) = 0.5;
  -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v44);
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.5);
  v45 = self->_titleLabel;
  +[PKSharingMessageExtensionInvitationTheme captionTextColor](PKSharingMessageExtensionInvitationTheme, "captionTextColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v45, "setTextColor:", v46);

  -[UILabel setBaselineAdjustment:](self->_titleLabel, "setBaselineAdjustment:", 1);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_titleLabel);
  v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v47;

  v49 = self->_subtitleLabel;
  +[PKSharingMessageExtensionInvitationTheme messageDefaultFont](PKSharingMessageExtensionInvitationTheme, "messageDefaultFont");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v49, "setFont:", v50);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v43);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
  LODWORD(v51) = 0.5;
  -[UILabel _setHyphenationFactor:](self->_subtitleLabel, "_setHyphenationFactor:", v51);
  -[UILabel setMinimumScaleFactor:](self->_subtitleLabel, "setMinimumScaleFactor:", 0.5);
  v52 = self->_subtitleLabel;
  +[PKSharingMessageExtensionInvitationTheme subcaptionTextColor](PKSharingMessageExtensionInvitationTheme, "subcaptionTextColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v52, "setTextColor:", v53);

  -[UILabel setBaselineAdjustment:](self->_subtitleLabel, "setBaselineAdjustment:", 1);
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_subtitleLabel);
  v54 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v54;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[PKMessageExtensionMessageBubbleView addSubview:](self, "addSubview:", self->_spinner);

}

- (void)setProperties:(id)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  int v9;
  UILabel *leftTitleLabel;
  void *v11;
  UILabel *rightTitleLabel;
  void *v13;
  void *v14;
  UILabel *titleLabel;
  void *v16;
  UILabel *subtitleLabel;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  if ((PKEqualObjects() & 1) != 0)
    goto LABEL_10;
  objc_storeStrong((id *)&self->_properties, a3);
  objc_msgSend(v25, "cardImage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    self->_isUsingFallbackImage = 0;
  }
  else
  {
    objc_msgSend(v25, "fallbackCardImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
    if (!v6)
      goto LABEL_5;
    -[UIImageView image](self->_cardArtImageView, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 54.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v22);
    v24 = objc_claimAutoreleasedReturnValue();

    self->_isUsingFallbackImage = 1;
    if (!v24)
      goto LABEL_6;
    v6 = (void *)v24;
  }
  -[UIImageView setImage:](self->_cardArtImageView, "setImage:", v6);
  LOBYTE(v7) = self->_isUsingFallbackImage;
  v8 = (double)v7;
LABEL_5:

LABEL_6:
  -[UIView setAlpha:](self->_cardView, "setAlpha:", v8);
  v9 = -[PKMessageExtensionMessageBubbleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  leftTitleLabel = self->_leftTitleLabel;
  if (v9)
  {
    objc_msgSend(v25, "rightTitleText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](leftTitleLabel, "setText:", v11);

    rightTitleLabel = self->_rightTitleLabel;
    objc_msgSend(v25, "leftTitleText");
  }
  else
  {
    objc_msgSend(v25, "leftTitleText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](leftTitleLabel, "setText:", v13);

    rightTitleLabel = self->_rightTitleLabel;
    objc_msgSend(v25, "rightTitleText");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](rightTitleLabel, "setText:", v14);

  titleLabel = self->_titleLabel;
  objc_msgSend(v25, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v16);

  subtitleLabel = self->_subtitleLabel;
  objc_msgSend(v25, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](subtitleLabel, "setText:", v18);

  objc_msgSend(v25, "buttonText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;
  -[UILabel setHidden:](self->_buttonLabel, "setHidden:", v20);
  -[UIImageView setHidden:](self->_buttonIconView, "setHidden:", v20);
  -[UIView setHidden:](self->_buttonBackgroundView, "setHidden:", v20);
  -[UILabel setText:](self->_buttonLabel, "setText:", v19);
  -[PKMessageExtensionMessageBubbleView setNeedsLayout](self, "setNeedsLayout");

LABEL_10:
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[PKMessageExtensionMessageBubbleView setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PKSharingMessageExtensionViewProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundView, 0);
  objc_storeStrong((id *)&self->_buttonIconView, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_leftTitleLabel, 0);
  objc_storeStrong((id *)&self->_cardArtImageView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
