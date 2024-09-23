@implementation PKDiscoveryCallToActionShelfView

- (PKDiscoveryCallToActionShelfView)initWithShelf:(id)a3
{
  id v5;
  PKDiscoveryCallToActionShelfView *v6;
  PKDiscoveryCallToActionShelfView *v7;
  uint64_t v8;
  PKDiscoveryCallToAction *callToAction;
  uint64_t v10;
  PKDiscoveryMedia *icon;
  uint64_t v12;
  PKDiscoveryMedia *wordmarkAsset;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  double *v18;
  void *v19;
  uint64_t v20;
  UILabel *titleLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UILabel *subtitleLabel;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  uint64_t v33;
  UIImageView *iconImageView;
  UIImageView *v35;
  void *v36;
  void *v37;
  void *v38;
  UIImageView *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  UIImageView *wordmarkImageView;
  UIImageView *v44;
  void *v45;
  void *v46;
  void *v47;
  UIImageView *v48;
  void *v49;
  void *v50;
  PKContinuousButton *v51;
  PKContinuousButton *button;
  PKContinuousButton *v53;
  void *v54;
  PKContinuousButton *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PKLinkedApplication *v60;
  void *v61;
  uint64_t v62;
  PKLinkedApplication *linkedApplication;
  void *v65;
  void *v66;
  uint64_t v67;
  int64x2_t v68;
  int64x2_t v69;
  objc_super v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PKDiscoveryCallToActionShelfView;
  v6 = -[PKDiscoveryCallToActionShelfView init](&v70, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_24;
  objc_storeStrong((id *)&v6->_ctaShelf, a3);
  objc_msgSend(v5, "callToAction");
  v8 = objc_claimAutoreleasedReturnValue();
  callToAction = v7->_callToAction;
  v7->_callToAction = (PKDiscoveryCallToAction *)v8;

  -[PKDiscoveryCallToAction icon](v7->_callToAction, "icon");
  v10 = objc_claimAutoreleasedReturnValue();
  icon = v7->_icon;
  v7->_icon = (PKDiscoveryMedia *)v10;

  -[PKDiscoveryCallToAction wordmarkAsset](v7->_callToAction, "wordmarkAsset");
  v12 = objc_claimAutoreleasedReturnValue();
  wordmarkAsset = v7->_wordmarkAsset;
  v7->_wordmarkAsset = (PKDiscoveryMedia *)v12;

  v7->_hasIcon = v7->_icon != 0;
  -[PKDiscoveryCallToAction localizedButtonText](v7->_callToAction, "localizedButtonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = -[PKDiscoveryCallToAction action](v7->_callToAction, "action") != 0;
  else
    v15 = 0;
  v7->_hasButton = v15;

  v7->_hasWordmarkAsset = v7->_wordmarkAsset != 0;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryCallToActionShelfView setBackgroundColor:](v7, "setBackgroundColor:", v16);

  -[PKDiscoveryCallToAction localizedTitle](v7->_callToAction, "localizedTitle");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (double *)MEMORY[0x1E0C9D648];
  v66 = (void *)v17;
  if (v17)
  {
    v7->_hasTitle = 1;
  }
  else
  {
    objc_msgSend(0, "pk_stringIfNotEmpty");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hasTitle = v19 != 0;

    if (!v7->_hasTitle)
      goto LABEL_9;
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
  titleLabel = v7->_titleLabel;
  v7->_titleLabel = (UILabel *)v20;

  -[UILabel setText:](v7->_titleLabel, "setText:", v66);
  v22 = v7->_titleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B58], 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v22, "setFont:", v23);

  v24 = v7->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 1);
  -[PKDiscoveryCallToActionShelfView addSubview:](v7, "addSubview:", v7->_titleLabel);
LABEL_9:
  -[PKDiscoveryCallToAction localizedSubtitle](v7->_callToAction, "localizedSubtitle");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v7->_hasSubtitle = 1;
LABEL_12:
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    subtitleLabel = v7->_subtitleLabel;
    v7->_subtitleLabel = (UILabel *)v27;

    -[UILabel setText:](v7->_subtitleLabel, "setText:", v65);
    v29 = v7->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v29, "setFont:", v30);

    v31 = v7->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v31, "setTextColor:", v32);

    -[UILabel setNumberOfLines:](v7->_subtitleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v7->_subtitleLabel, "setTextAlignment:", 1);
    -[PKDiscoveryCallToActionShelfView addSubview:](v7, "addSubview:", v7->_subtitleLabel);
    goto LABEL_13;
  }
  objc_msgSend(0, "pk_stringIfNotEmpty");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_hasSubtitle = v26 != 0;

  if (v7->_hasSubtitle)
    goto LABEL_12;
LABEL_13:
  if (v7->_hasIcon)
  {
    v7->_iconSize = (CGSize)vdupq_n_s64(0x4056000000000000uLL);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    iconImageView = v7->_iconImageView;
    v7->_iconImageView = (UIImageView *)v33;

    v35 = v7->_iconImageView;
    v36 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryMedia backgroundColor](v7->_icon, "backgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pkui_colorWithPKColor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v35, "setBackgroundColor:", v38);

    -[UIImageView setContentMode:](v7->_iconImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v7->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1);
    v39 = v7->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v39, "setTintColor:", v40);

    -[UIImageView layer](v7->_iconImageView, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCornerRadius:", 14.0);
    objc_msgSend(v41, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v41, "setMasksToBounds:", 1);
    -[PKDiscoveryCallToActionShelfView addSubview:](v7, "addSubview:", v7->_iconImageView);

  }
  if (v7->_hasWordmarkAsset)
  {
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    wordmarkImageView = v7->_wordmarkImageView;
    v7->_wordmarkImageView = (UIImageView *)v42;

    v44 = v7->_wordmarkImageView;
    v45 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryMedia backgroundColor](v7->_wordmarkAsset, "backgroundColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "pkui_colorWithPKColor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v44, "setBackgroundColor:", v47);

    -[UIImageView setContentMode:](v7->_wordmarkImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v7->_wordmarkImageView, "setAccessibilityIgnoresInvertColors:", 1);
    v48 = v7->_wordmarkImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v48, "setTintColor:", v49);

    -[UIImageView layer](v7->_wordmarkImageView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setMasksToBounds:", 1);

    -[PKDiscoveryCallToActionShelfView addSubview:](v7, "addSubview:", v7->_wordmarkImageView);
  }
  if (v7->_hasButton)
  {
    v67 = 0;
    v68 = vdupq_n_s64(2uLL);
    v69 = v68;
    v51 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v67);
    button = v7->_button;
    v7->_button = v51;

    v53 = v7->_button;
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTintColor:](v53, "setTintColor:", v54);

    -[PKContinuousButton setContentEdgeInsets:](v7->_button, "setContentEdgeInsets:", 6.0, 18.0, 6.0, 18.0);
    v55 = v7->_button;
    -[PKDiscoveryCallToAction localizedButtonText](v7->_callToAction, "localizedButtonText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTitle:forState:](v55, "setTitle:forState:", v56, 0);

    -[PKContinuousButton titleLabel](v7->_button, "titleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4930], 2, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFont:", v58);

    -[PKContinuousButton addTarget:action:forControlEvents:](v7->_button, "addTarget:action:forControlEvents:", v7, sel__buttonPressed_, 64);
    -[PKContinuousButton _setTouchInsets:](v7->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[PKDiscoveryCallToActionShelfView addSubview:](v7, "addSubview:", v7->_button);
  }
  if (-[PKDiscoveryCallToAction action](v7->_callToAction, "action") == 8)
  {
    -[PKDiscoveryCallToAction appStoreAppIdentifier](v7->_callToAction, "appStoreAppIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = [PKLinkedApplication alloc];
      v71[0] = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:](v60, "initWithStoreIDs:defaultLaunchURL:", v61, 0);
      linkedApplication = v7->_linkedApplication;
      v7->_linkedApplication = (PKLinkedApplication *)v62;

      -[PKLinkedApplication addObserver:](v7->_linkedApplication, "addObserver:", v7);
      -[PKDiscoveryCallToActionShelfView setShowActivityIndicator:](v7, "setShowActivityIndicator:", 1);
      -[PKLinkedApplication reloadApplicationStateIfNecessary](v7->_linkedApplication, "reloadApplicationStateIfNecessary");
    }

  }
LABEL_24:

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[PKDiscoveryCallToActionShelfView _isFooterWordmarkOnly](self, "_isFooterWordmarkOnly"))
  {
    -[PKDiscoveryCallToActionShelfView _wordmarkAssetSize](self, "_wordmarkAssetSize");
  }
  else
  {
    if (self->_hasWordmarkAsset)
      -[PKDiscoveryCallToActionShelfView _wordmarkAssetSize](self, "_wordmarkAssetSize");
    if (self->_hasTitle)
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
    if (self->_hasSubtitle)
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
    if (self->_hasButton)
      -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
  }
  PKSizeRoundToPixel();
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double width;
  double height;
  UIImageView *wordmarkImageView;
  double v6;
  double v7;
  double v8;
  PKContinuousButton *button;
  CGRect v10;

  -[PKDiscoveryCallToActionShelfView bounds](self, "bounds");
  width = v10.size.width;
  height = v10.size.height;
  CGRectGetMidX(v10);
  if (self->_hasIcon)
  {
    PKRectRoundToPixel();
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  }
  if (self->_hasWordmarkAsset)
  {
    -[PKDiscoveryCallToActionShelfView _isFooterWordmarkOnly](self, "_isFooterWordmarkOnly");
    -[PKDiscoveryCallToActionShelfView _wordmarkAssetSize](self, "_wordmarkAssetSize");
    -[PKDiscoveryCallToActionShelfView _wordmarkAssetSize](self, "_wordmarkAssetSize");
    PKRectRoundToPixel();
    -[UIImageView setFrame:](self->_wordmarkImageView, "setFrame:");
    wordmarkImageView = self->_wordmarkImageView;
    -[PKDiscoveryMedia height](self->_wordmarkAsset, "height");
    v7 = v6;
    -[PKDiscoveryCallToActionShelfView _desiredWordmarkAssetHeight](self, "_desiredWordmarkAssetHeight");
    -[UIImageView setContentScaleFactor:](wordmarkImageView, "setContentScaleFactor:", v7 / v8);
  }
  if (self->_hasTitle)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
    PKSizeRoundToPixel();
    PKRectRoundToPixel();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
  if (self->_hasSubtitle)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width + -40.0, height);
    PKSizeRoundToPixel();
    PKRectRoundToPixel();
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  }
  if (self->_hasButton)
  {
    -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
    PKSizeRoundToPixel();
    button = self->_button;
    PKRectRoundToPixel();
    -[PKContinuousButton setFrame:](button, "setFrame:");
  }
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;

  if (((!self->_showActivityIndicator ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_showActivityIndicator = a3;
    -[PKContinuousButton setEnabled:](self->_button, "setEnabled:", !a3);
    -[PKContinuousButton setShowSpinner:](self->_button, "setShowSpinner:", v3);
  }
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PKDiscoveryCallToActionShelf *ctaShelf;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  ctaShelf = self->_ctaShelf;
  v7 = a3;
  if (-[PKDiscoveryCallToActionShelf useImageAsTitle](ctaShelf, "useImageAsTitle"))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v7, "imageWithRenderingMode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PKDiscoveryCallToActionShelfView_setImage_animated___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v9;
    objc_msgSend(v10, "pkui_animateUsingOptions:animations:completion:", 4, v11, 0);

  }
  else
  {
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v9);
  }

}

uint64_t __54__PKDiscoveryCallToActionShelfView_setImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)setWordmarkAsset:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PKDiscoveryCallToActionShelf *ctaShelf;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  ctaShelf = self->_ctaShelf;
  v7 = a3;
  if (-[PKDiscoveryCallToActionShelf useImageAsTitle](ctaShelf, "useImageAsTitle"))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v7, "imageWithRenderingMode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PKDiscoveryCallToActionShelfView_setWordmarkAsset_animated___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v9;
    objc_msgSend(v10, "pkui_animateUsingOptions:animations:completion:", 4, v11, 0);

  }
  else
  {
    -[UIImageView setImage:](self->_wordmarkImageView, "setImage:", v9);
  }

}

uint64_t __62__PKDiscoveryCallToActionShelfView_setWordmarkAsset_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4;
  char v5;
  PKContinuousButton *button;
  void *v7;
  void *v8;

  v4 = a3;
  -[PKDiscoveryCallToActionShelfView setShowActivityIndicator:](self, "setShowActivityIndicator:", 0);
  v5 = objc_msgSend(v4, "isInstalled");

  button = self->_button;
  if ((v5 & 1) != 0)
  {
    -[PKDiscoveryCallToAction localizedButtonText](self->_callToAction, "localizedButtonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTitle:forState:](button, "setTitle:forState:", v7, 0);
  }
  else
  {
    PKLocalizedString(CFSTR("VIEW_BUTTON"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTitle:forState:](button, "setTitle:forState:", v8, 0);

  }
  -[PKDiscoveryCallToActionShelfView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_buttonPressed:(id)a3
{
  PKDiscoveryCallToAction *callToAction;
  void *v5;
  id WeakRetained;

  if (-[PKDiscoveryCallToAction action](self->_callToAction, "action", a3) == 8
    && -[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled"))
  {
    -[PKLinkedApplication openApplication:](self->_linkedApplication, "openApplication:", 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    callToAction = self->_callToAction;
    -[PKDiscoveryShelfView itemIdentifier](self, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "discoveryCardViewCTATapped:callToAction:itemIdentifier:", self, callToAction, v5);

  }
}

- (BOOL)_isFooterWordmarkOnly
{
  return self->_hasWordmarkAsset && !self->_hasButton && !self->_hasTitle && !self->_hasSubtitle && !self->_hasIcon;
}

- (double)_desiredWordmarkAssetHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[PKDiscoveryCallToActionShelfView _isFooterWordmarkOnly](self, "_isFooterWordmarkOnly");
  result = 40.0;
  if (!v2)
    return 30.0;
  return result;
}

- (CGSize)_wordmarkAssetSize
{
  CGSize *p_wordmarkAssetSize;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double height;
  double v10;
  CGSize result;

  p_wordmarkAssetSize = &self->_wordmarkAssetSize;
  if (self->_hasWordmarkAsset)
  {
    width = p_wordmarkAssetSize->width;
    if (p_wordmarkAssetSize->width == 0.0 && self->_wordmarkAssetSize.height == 0.0)
    {
      -[PKDiscoveryMedia width](self->_wordmarkAsset, "width");
      width = v5;
      -[PKDiscoveryMedia height](self->_wordmarkAsset, "height");
      v7 = v6;
      -[PKDiscoveryCallToActionShelfView _desiredWordmarkAssetHeight](self, "_desiredWordmarkAssetHeight");
      if (v7 > 0.0 && width > 0.0)
        width = width * (v8 / v7);
      p_wordmarkAssetSize->width = width;
      p_wordmarkAssetSize->height = v8;
    }
  }
  else
  {
    *p_wordmarkAssetSize = *(CGSize *)MEMORY[0x1E0C9D820];
    width = p_wordmarkAssetSize->width;
  }
  height = p_wordmarkAssetSize->height;
  v10 = width;
  result.height = height;
  result.width = v10;
  return result;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  return (PKDiscoveryCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_wordmarkImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_wordmarkAsset, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);
  objc_storeStrong((id *)&self->_ctaShelf, 0);
}

@end
