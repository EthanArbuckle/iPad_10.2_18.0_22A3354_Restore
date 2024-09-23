@implementation PKExplanationView

- (void)pk_applyAppearance:(id)a3
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
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationView setBackgroundColor:](self, "setBackgroundColor:", v5);

  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationView setTintColor:](self, "setTintColor:", v6);

  LODWORD(v6) = objc_msgSend(v4, "hasDarkAppearance");
  if ((_DWORD)v6)
  {
    -[PKExplanationView logoImageView](self, "logoImageView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v12, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_flatImageWithColor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithRenderingMode:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setImage:", v11);

    }
  }
}

- (PKExplanationView)init
{
  return -[PKExplanationView initWithDelegate:](self, "initWithDelegate:", 0);
}

- (PKExplanationView)initWithDelegate:(id)a3
{
  return -[PKExplanationView initWithContext:](self, "initWithContext:", 0);
}

- (PKExplanationView)initWithContext:(int64_t)a3
{
  return -[PKExplanationView initWithContext:delegate:](self, "initWithContext:delegate:", a3, 0);
}

- (PKExplanationView)initWithContext:(int64_t)a3 delegate:(id)a4
{
  id v6;
  PKExplanationView *v7;
  PKExplanationView *v8;
  CGSize v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKExplanationView;
  v7 = -[PKExplanationView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_context = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_showPrivacyView = 1;
    v8->_topMargin = 0.0;
    v8->_horizontalMargin = 0;
    v8->_bodyTextAlignment = 1;
    v8->_titleTextAlignment = 1;
    v8->_bodyDataDetectorTypes = 2;
    v8->_bodyButtonNumberOfLines = 1;
    v8->_bodyViewPadding = 10.0;
    v8->_topLogoPadding = 25.0;
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v8->_lastSeenValidBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v8->_lastSeenValidBounds.size = v9;
    v8->_imageIgnoresTopSafeArea = 0;
    -[PKExplanationView _createSubviews](v8, "_createSubviews");
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKExplanationView;
  -[PKExplanationView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  UIImageView *v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double topMargin;
  void *v35;
  uint64_t v36;
  double v37;
  double maxImageHeight;
  double v39;
  double *v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  UIImageView *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double MaxY;
  uint64_t *v69;
  double v70;
  UITextView *v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  void (**v87)(_QWORD);
  void (**v88)(_QWORD);
  void (**v89)(_QWORD);
  void (**v90)(_QWORD);
  double v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  void *v103;
  void *v104;
  CGFloat v105;
  double v106;
  PKPaymentSetupDockView *v107;
  PKPaymentSetupDockView *dockView;
  OBPrivacyLinkController *v109;
  OBPrivacyLinkController *privacyLink;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  UIView *topBackgroundView;
  double v120;
  double v121;
  double v122;
  id WeakRetained;
  double v124;
  double v125;
  uint64_t v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  _QWORD v132[5];
  id v133;
  uint64_t *v134;
  double v135;
  uint64_t v136;
  double v137;
  double v138;
  _QWORD aBlock[14];
  uint64_t v140;
  CGFloat *v141;
  uint64_t v142;
  uint64_t v143;
  objc_super v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  v144.receiver = self;
  v144.super_class = (Class)PKExplanationView;
  -[PKExplanationView layoutSubviews](&v144, sel_layoutSubviews);
  v3 = PKUIGetMinScreenWidthType();
  if (-[UIScrollView isDragging](self->_scrollView, "isDragging"))
  {
    if (CGRectIsNull(self->_lastSeenValidBounds))
    {
      -[PKExplanationView bounds](self, "bounds");
      x = v4;
      y = v6;
      width = v8;
      height = v10;
    }
    else
    {
      x = self->_lastSeenValidBounds.origin.x;
      y = self->_lastSeenValidBounds.origin.y;
      width = self->_lastSeenValidBounds.size.width;
      height = self->_lastSeenValidBounds.size.height;
    }
  }
  else
  {
    -[PKExplanationView bounds](self, "bounds");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
    self->_lastSeenValidBounds.origin.x = v12;
    self->_lastSeenValidBounds.origin.y = v13;
    self->_lastSeenValidBounds.size.width = v14;
    self->_lastSeenValidBounds.size.height = v15;
  }
  -[PKExplanationView safeAreaInsets](self, "safeAreaInsets");
  v17 = v16;
  v124 = v18;
  -[UIScrollView frame](self->_scrollView, "frame");
  v155.origin.x = v19;
  v155.origin.y = v20;
  v155.size.width = v21;
  v155.size.height = v22;
  v145.origin.x = x;
  v145.origin.y = y;
  v145.size.width = width;
  v131 = height;
  v145.size.height = height;
  if (!CGRectEqualToRect(v145, v155))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, width, height);
  v130 = y;
  if (self->_maxImageHeight == 0.0)
    self->_maxImageHeight = dbl_19DF158F0[PKUIGetMinScreenWidthType() == 0];
  -[PKExplanationView _resolvedHorizontalMargin](self, "_resolvedHorizontalMargin");
  if (PKIsPad())
    PKPaymentSetupContextIsSetupAssistant();
  if (width >= 768.0)
  {
    -[PKExplanationView readableContentGuide](self, "readableContentGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutFrame");

  }
  PKSizeAlignedInRect();
  v128 = v24;
  v129 = v25;
  v126 = v26;
  v127 = v27;
  v140 = 0;
  v141 = (CGFloat *)&v140;
  v142 = 0x2020000000;
  v143 = 0;
  -[UIImageView superview](self->_imageView, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = self->_imageView;
    -[UIImageView frame](v29, "frame");
    UIRectCenteredXInRect();
    v33 = v30;
    if (self->_imageIgnoresTopSafeArea)
      topMargin = -v17;
    else
      topMargin = self->_topMargin;
    if (self->_image)
    {
      if (v32 >= self->_maxImageHeight)
        maxImageHeight = self->_maxImageHeight;
      else
        maxImageHeight = v32;
      if (v31 >= width)
        v39 = width;
      else
        v39 = v31;
    }
    else
    {
      maxImageHeight = 0.0;
      v39 = 0.0;
    }
    -[UIImageView setFrame:](v29, "setFrame:", v30, topMargin, v39, maxImageHeight);
    v146.origin.x = v33;
    v146.origin.y = topMargin;
    v146.size.width = v39;
    v146.size.height = maxImageHeight;
    v141[3] = CGRectGetMaxY(v146);

  }
  else
  {
    -[UIView superview](self->_heroView, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      if (self->_imageIgnoresTopSafeArea)
        v37 = -v17;
      else
        v37 = self->_topMargin;
      v147.origin.x = __35__PKExplanationView_layoutSubviews__block_invoke(x, v37, width, 1.79769313e308, v36, self->_heroView, self->_heroViewSizeThatFitsOverride, self->_heroViewContentMode, self->_heroViewPrefersSizeTransform);
      v141[3] = CGRectGetMaxY(v147);
    }
  }
  v40 = (double *)MEMORY[0x1E0C9D820];
  if (self->_hideTitleText)
  {
    v41 = *MEMORY[0x1E0C9D648];
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    if (-[PKExplanationView _showTitleLogoImageView](self, "_showTitleLogoImageView"))
    {
      v45 = self->_logoImageView;
      -[UIImageView image](v45, "image");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "size");
      v48 = v47;

      -[UIImageView frame](v45, "frame");
      v49 = self->_logoImageViewTargetSize.height;
      v50 = v40[1];
      v51 = self->_logoImageViewTargetSize.width == *v40;
      if (v49 != v50)
        v51 = 0;
      if (v3)
        v51 = 0;
      v52 = v48 > 20.0;
      if (v51 && v52)
        v49 = 20.0;
      v53 = 1.79769313e308;
      if (!v51 || !v52)
        v53 = self->_logoImageViewTargetSize.width;
      if (v53 != *v40 || v49 != v50)
        PKSizeAspectFit();
      UIRectCenteredXInRect();
      v41 = v54;
      v44 = v55;
      v43 = v56;
      v42 = v141[3] + self->_topLogoPadding;
      -[UIImageView setFrame:](v45, "setFrame:", v54, v42);
    }
    else
    {
      v45 = self->_titleLabel;
      v57 = fmax(width - v129, 0.0) * 0.5;
      -[UIImageView setContentInsets:](v45, "setContentInsets:", 0.0, v57, 0.0, v57);
      -[UIImageView sizeThatFits:](v45, "sizeThatFits:", width, 1.79769313e308);
      v43 = v58;
      v42 = v141[3] + self->_topLogoPadding;
      -[UIImageView setFrame:](v45, "setFrame:", x, v42, width, v58);
      v141[3] = v43 + v141[3];
      v44 = width;
      v41 = x;
    }

  }
  -[UIImageView superview](self->_bodyImageView, "superview");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = x;
  if (v59)
  {
    -[UIImageView frame](self->_bodyImageView, "frame");
    UIRectCenteredXInRect();
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v148.origin.x = v41;
    v148.origin.y = v42;
    v148.size.width = v44;
    v148.size.height = v43;
    v66 = CGRectGetMaxY(v148) + 44.0;
    if (self->_bodyImage)
    {
      if (v65 >= self->_maxImageHeight)
        v67 = self->_maxImageHeight;
      else
        v67 = v65;
      if (v63 >= width)
        v63 = width;
    }
    else
    {
      v63 = 0.0;
      v67 = 0.0;
    }
    -[UIImageView setFrame:](self->_bodyImageView, "setFrame:", v61, v66, v63, v67);
    v150.origin.x = v61;
    v150.origin.y = v66;
    v150.size.width = v63;
    v150.size.height = v67;
    MaxY = CGRectGetMaxY(v150);
    v69 = &PKSetupViewConstantsBodyImageBottomPadding;
  }
  else
  {
    v149.origin.x = v41;
    v149.origin.y = v42;
    v149.size.width = v44;
    v149.size.height = v43;
    MaxY = CGRectGetMaxY(v149);
    v69 = &PKSetupViewConstantsBodyTextPadding;
  }
  v141[3] = MaxY;
  v70 = *(double *)v69;
  v71 = self->_bodyTextView;
  -[UITextView frame](v71, "frame");
  -[UITextView sizeThatFits:](v71, "sizeThatFits:", v129, 1.79769313e308);
  UIRectCenteredXInRect();
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v78 = v70 + v141[3];
  -[UITextView setFrame:](v71, "setFrame:", v72, v78);
  v151.origin.x = v73;
  v151.origin.y = v78;
  v151.size.width = v75;
  v151.size.height = v77;
  v141[3] = CGRectGetMaxY(v151);
  if (self->_attributedSecondaryBodyText)
  {
    -[UITextView frame](self->_secondaryBodyTextView, "frame");
    -[UITextView sizeThatFits:](self->_secondaryBodyTextView, "sizeThatFits:", v129, 1.79769313e308);
    UIRectCenteredXInRect();
    v80 = v79;
    v82 = v81;
    v84 = v83;
    v85 = v70 + v141[3];
    -[UITextView setFrame:](self->_secondaryBodyTextView, "setFrame:", v79, v85);
    v152.origin.x = v80;
    v152.origin.y = v85;
    v152.size.width = v82;
    v152.size.height = v84;
    v141[3] = CGRectGetMaxY(v152);
  }
  v86 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PKExplanationView_layoutSubviews__block_invoke_2;
  aBlock[3] = &unk_1E3E6F6E0;
  *(double *)&aBlock[6] = v128;
  aBlock[7] = v126;
  *(double *)&aBlock[8] = v129;
  *(double *)&aBlock[9] = v127;
  *(double *)&aBlock[10] = v125;
  *(double *)&aBlock[11] = v130;
  *(double *)&aBlock[12] = width;
  *(double *)&aBlock[13] = v131;
  aBlock[4] = self;
  aBlock[5] = &v140;
  v87 = (void (**)(_QWORD))_Block_copy(aBlock);
  v132[0] = v86;
  v132[1] = 3221225472;
  v132[2] = __35__PKExplanationView_layoutSubviews__block_invoke_3;
  v132[3] = &unk_1E3E6F708;
  v135 = v128;
  v136 = v126;
  v137 = v129;
  v138 = v127;
  v132[4] = self;
  v133 = &__block_literal_global_122;
  v134 = &v140;
  v88 = (void (**)(_QWORD))_Block_copy(v132);
  v89 = v88;
  if (self->_reverseBodyViewAndBodyButtonOrder)
  {
    v88[2](v88);
    v90 = v87;
  }
  else
  {
    v87[2](v87);
    v90 = v89;
  }
  ((void (*)(void))v90[2])();
  v91 = width;
  if (width >= 768.0)
  {
    -[PKExplanationView readableContentGuide](self, "readableContentGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "layoutFrame");
    v91 = v93;

  }
  -[OBPrivacyLinkController view](self->_privacyLink, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if (v94 && self->_showPrivacyView)
  {
    v96 = self->_cachedPrivacyViewSize.width;
    v97 = self->_cachedPrivacyViewSize.height;
    if (v96 == *v40 && v97 == v40[1])
    {
      objc_msgSend(v94, "setFrame:", 0.0, 0.0, v129, 0.0);
      objc_msgSend(v95, "setNeedsLayout");
      objc_msgSend(v95, "layoutIfNeeded");
      LODWORD(v98) = 1148846080;
      LODWORD(v99) = 1112014848;
      objc_msgSend(v95, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v129, v127, v98, v99);
      v96 = v100;
      v97 = v101;
      self->_cachedPrivacyViewSize.width = v100;
      self->_cachedPrivacyViewSize.height = v101;
    }
  }
  else
  {
    v96 = *v40;
    v97 = v40[1];
  }
  if (self->_showPrivacyView)
  {
    -[PKPaymentSetupDockView sizeThatFitsWithoutPrivacyLink:](self->_dockView, "sizeThatFitsWithoutPrivacyLink:", v91, 1.79769313e308);
    if (v131 - (v124 + v97 + 11.0 + v102) >= v141[3])
    {
      objc_msgSend(v95, "superview");
      v107 = (PKPaymentSetupDockView *)objc_claimAutoreleasedReturnValue();
      dockView = self->_dockView;

      if (v107 != dockView)
        objc_msgSend(v95, "removeFromSuperview");
      -[PKPaymentSetupDockView privacyLink](self->_dockView, "privacyLink");
      v109 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();
      privacyLink = self->_privacyLink;

      if (v109 != privacyLink)
        -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", self->_privacyLink);
      v106 = v141[3];
    }
    else
    {
      -[PKPaymentSetupDockView privacyLink](self->_dockView, "privacyLink");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v103)
        -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
      objc_msgSend(v95, "superview");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v104)
        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v95);
      v105 = v141[3] + 16.0;
      objc_msgSend(v95, "setFrame:", v128, v105, v96, v97);
      v153.origin.x = v128;
      v153.origin.y = v105;
      v153.size.width = v96;
      v153.size.height = v97;
      v106 = CGRectGetMaxY(v153);
    }
  }
  else
  {
    v106 = v141[3];
  }
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v91, 1.79769313e308);
  v112 = v111;
  v154.origin.x = v125;
  v154.origin.y = v130;
  v154.size.height = v131;
  v154.size.width = width;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", 0.0, CGRectGetMaxY(v154) - (v124 + v112), width);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  PKFloatRoundToPixel();
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", width, v106);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v114 = v113;
  v116 = v115;
  v118 = v117;
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v114, v116, v112, v118);
  topBackgroundView = self->_topBackgroundView;
  if (topBackgroundView)
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v121 = 0.0;
    if (self->_topMargin - v120 >= 0.0)
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v121 = self->_topMargin - v122;
    }
    -[UIView setFrame:](topBackgroundView, "setFrame:", v125, v130, width, v121);
  }
  -[PKExplanationView _calculateBlur](self, "_calculateBlur");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewDidUpdateLayout:", self);

  _Block_object_dispose(&v140, 8);
}

double __35__PKExplanationView_layoutSubviews__block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, void *a6, void *a7, uint64_t a8, int a9)
{
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CATransform3D *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  CATransform3D v44;
  CATransform3D v45;

  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v15)
    (*((void (**)(id, id, double, double))v15 + 2))(v15, v14, a3, a4);
  else
    objc_msgSend(v14, "sizeThatFits:", a3, a4);
  v19 = v17;
  v20 = v18;
  switch(a8)
  {
    case 1:
      PKSizeScaleAspectFit();
      goto LABEL_10;
    case 2:
      PKSizeAspectFill();
      goto LABEL_10;
    case 3:
      PKSizeAspectFit();
      goto LABEL_10;
    case 4:
      PKSizeAspectFitToCover();
LABEL_10:
      v24 = v21;
      v23 = v22;
      break;
    default:
      v23 = v18;
      v24 = v17;
      break;
  }
  if (a9)
    v25 = v20;
  else
    v25 = v23;
  if (a9)
    v26 = v19;
  else
    v26 = v24;
  objc_msgSend(v14, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v26, v25);
  if (a9)
  {
    memset(&v45, 0, sizeof(v45));
    CATransform3DMakeScale(&v45, v24 / v19, v23 / v20, 1.0);
    v44 = v45;
    v27 = &v44;
  }
  else
  {
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v45.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v45.m33 = v28;
    v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v45.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v45.m43 = v29;
    v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v45.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v45.m13 = v30;
    v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v45.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v45.m23 = v31;
    v27 = &v45;
  }
  objc_msgSend(v14, "setTransform3D:", v27, *(_OWORD *)&v44.m11, *(_OWORD *)&v44.m13, *(_OWORD *)&v44.m21, *(_OWORD *)&v44.m23, *(_OWORD *)&v44.m31, *(_OWORD *)&v44.m33, *(_OWORD *)&v44.m41, *(_OWORD *)&v44.m43, *(_QWORD *)&v45.m11, *(_QWORD *)&v45.m12, *(_QWORD *)&v45.m13, *(_QWORD *)&v45.m14, *(_QWORD *)&v45.m21, *(_QWORD *)&v45.m22, *(_QWORD *)&v45.m23, *(_QWORD *)&v45.m24,
    *(_QWORD *)&v45.m31,
    *(_QWORD *)&v45.m32,
    *(_QWORD *)&v45.m33,
    *(_QWORD *)&v45.m34,
    *(_QWORD *)&v45.m41,
    *(_QWORD *)&v45.m42,
    *(_QWORD *)&v45.m43,
    *(_QWORD *)&v45.m44);
  PKSizeAlignedInRect();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  objc_msgSend(v14, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "anchorPoint");
  objc_msgSend(v14, "setCenter:", v33 + v41 * v37, v35 + v42 * v39);

  return v33;
}

void __35__PKExplanationView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 560);
  if (v2)
  {
    objc_msgSend(v2, "sizeThatFits:", *(double *)(a1 + 64), 1.79769313e308);
    UIRectCenteredXInRect();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 10.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "pkui_setBoundsAndPositionFromFrame:", v3, v9);
    v10.origin.x = v4;
    v10.origin.y = v9;
    v10.size.width = v6;
    v10.size.height = v8;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v10);
  }
}

void __35__PKExplanationView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  CGRect v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 768))
  {
    v3.origin.x = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + *(double *)(v1 + 792), *(double *)(a1 + 72), 1.79769313e308);
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v3);
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)bodyImageView
{
  return self->_bodyImageView;
}

- (void)setShowPrivacyView:(BOOL)a3
{
  OBPrivacyLinkController *privacyLink;
  void *v5;
  void *v6;

  if (self->_showPrivacyView != a3)
  {
    self->_showPrivacyView = a3;
    privacyLink = self->_privacyLink;
    if (privacyLink)
    {
      -[OBPrivacyLinkController view](privacyLink, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!self->_showPrivacyView)
      {
        objc_msgSend(v5, "removeFromSuperview");
        -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
      }

    }
    self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrivacyLink:(id)a3
{
  OBPrivacyLinkController **p_privacyLink;
  void *v6;
  id v7;

  p_privacyLink = &self->_privacyLink;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    -[OBPrivacyLinkController view](*p_privacyLink, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
    objc_storeStrong((id *)&self->_privacyLink, a3);
    self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setHideTitleText:(BOOL)a3
{
  if (self->_hideTitleText != a3)
  {
    self->_hideTitleText = a3;
    -[PKExplanationView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)setForceShowSetupLaterButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_forceShowSetupLaterButton != a3)
  {
    self->_forceShowSetupLaterButton = a3;
    -[PKExplanationView dockView](self, "dockView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setForceShowSetupLaterButton:", self->_forceShowSetupLaterButton);
    objc_msgSend(v7, "setupLaterButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v7, "setupLaterButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__setupLater, 0x2000);

    }
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v7 = v5;
    -[UIImageView superview](self->_imageView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_image, a3);
    -[PKExplanationView _updateImage](self, "_updateImage");
    v5 = v7;
  }

}

- (void)setImageStyle:(unint64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    -[PKExplanationView _updateImage](self, "_updateImage");
  }
}

- (void)setHeroView:(id)a3
{
  UIView *v5;
  UIView **p_heroView;
  UIView *heroView;
  void *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_heroView = &self->_heroView;
  heroView = self->_heroView;
  if (heroView != v5)
  {
    v10 = v5;
    -[UIView superview](heroView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[UIView removeFromSuperview](*p_heroView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_heroView, a3);
    -[UIView superview](*p_heroView, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", *p_heroView);
    -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setHeroViewSizeThatFitsOverride:(id)a3
{
  void *v4;
  id heroViewSizeThatFitsOverride;

  v4 = _Block_copy(a3);
  heroViewSizeThatFitsOverride = self->_heroViewSizeThatFitsOverride;
  self->_heroViewSizeThatFitsOverride = v4;

  -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHeroViewContentMode:(unint64_t)a3
{
  if (self->_heroViewContentMode != a3)
  {
    self->_heroViewContentMode = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHeroViewPrefersSizeTransform:(BOOL)a3
{
  if (((!self->_heroViewPrefersSizeTransform ^ a3) & 1) == 0)
  {
    self->_heroViewPrefersSizeTransform = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopBackgroundColor:(id)a3
{
  id v4;
  UIView *topBackgroundView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  id v9;

  v4 = a3;
  topBackgroundView = self->_topBackgroundView;
  v9 = v4;
  if (v4)
  {
    if (!topBackgroundView)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v7 = self->_topBackgroundView;
      self->_topBackgroundView = v6;

      -[PKExplanationView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_topBackgroundView, self->_scrollView);
      topBackgroundView = self->_topBackgroundView;
    }
    -[UIView setBackgroundColor:](topBackgroundView, "setBackgroundColor:", v9);
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIView removeFromSuperview](topBackgroundView, "removeFromSuperview");
    v8 = self->_topBackgroundView;
    self->_topBackgroundView = 0;

  }
}

- (void)setTitleText:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_titleText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKExplanationView _updateTitleLabel](self, "_updateTitleLabel");
  }

}

- (void)setTitleFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[PKExplanationView setTitleLabelText](self, "setTitleLabelText");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setTitleTextNumberOfLines:(int64_t)a3
{
  PKTrailingAccessoryLabel *titleLabel;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[PKTrailingAccessoryLabel setMaximumNumberOfLines:](titleLabel, "setMaximumNumberOfLines:", a3);
    -[PKExplanationView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)setTitleLineBreakStrategy:(unint64_t)a3
{
  if (self->_titleLineBreakStrategy != a3)
  {
    self->_titleLineBreakStrategy = a3;
    -[PKExplanationView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;

  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      -[UIActivityIndicatorView setHidden:](activityIndicator, "setHidden:", 0);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
    }
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
  -[PKExplanationView showCheckmark:animated:](self, "showCheckmark:animated:", a3, 1);
}

- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showCheckmark ^ a3) & 1) == 0)
  {
    self->_showCheckmark = a3;
    -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:");
  }
}

- (void)setBodyImage:(id)a3
{
  UIImage *v5;
  UIImage **p_bodyImage;
  void *v7;
  UIImageView *bodyImageView;
  void *v9;
  UIImage *v10;

  v5 = (UIImage *)a3;
  p_bodyImage = &self->_bodyImage;
  if (self->_bodyImage != v5)
  {
    v10 = v5;
    -[UIImageView superview](self->_bodyImageView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bodyImage, a3);
    -[UIImageView setImage:](self->_bodyImageView, "setImage:", *p_bodyImage);
    -[UIImageView sizeToFit](self->_bodyImageView, "sizeToFit");
    bodyImageView = self->_bodyImageView;
    if (*p_bodyImage)
    {
      -[UIImageView superview](bodyImageView, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_bodyImageView);
      bodyImageView = (UIImageView *)self->_heroView;
    }
    -[UIImageView removeFromSuperview](bodyImageView, "removeFromSuperview");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setBodyTextAlignment:(int64_t)a3
{
  if (self->_bodyTextAlignment != a3)
  {
    self->_bodyTextAlignment = a3;
    -[UITextView setTextAlignment:](self->_bodyTextView, "setTextAlignment:");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleTextAlignment:(int64_t)a3
{
  if (self->_titleTextAlignment != a3)
  {
    self->_titleTextAlignment = a3;
    -[PKExplanationView setTitleLabelText](self, "setTitleLabelText");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIFont)bodyTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (void)setBodyText:(id)a3
{
  NSString **p_bodyText;
  NSAttributedString *attributedBodyText;
  UITextView *bodyTextView;
  UITextView *v8;
  UITextView *v9;
  UITextView *v10;
  id v11;

  p_bodyText = &self->_bodyText;
  v11 = a3;
  if ((objc_msgSend(v11, "isEqualToString:", *p_bodyText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bodyText, a3);
    attributedBodyText = self->_attributedBodyText;
    self->_attributedBodyText = 0;

    bodyTextView = self->_bodyTextView;
    if (*p_bodyText)
    {
      if (!bodyTextView)
      {
        -[PKExplanationView _createBodyTextView](self, "_createBodyTextView");
        v8 = (UITextView *)objc_claimAutoreleasedReturnValue();
        v9 = self->_bodyTextView;
        self->_bodyTextView = v8;

        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_bodyTextView);
        bodyTextView = self->_bodyTextView;
      }
      -[UITextView setText:](bodyTextView, "setText:");
    }
    else
    {
      -[UITextView removeFromSuperview](bodyTextView, "removeFromSuperview");
      v10 = self->_bodyTextView;
      self->_bodyTextView = 0;

    }
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAttributedSecondaryBodyText:(id)a3
{
  id *p_attributedSecondaryBodyText;
  UITextView *secondaryBodyTextView;
  UITextView *v7;
  UITextView *v8;
  UITextView *v9;
  id v10;

  p_attributedSecondaryBodyText = (id *)&self->_attributedSecondaryBodyText;
  v10 = a3;
  if ((objc_msgSend(*p_attributedSecondaryBodyText, "isEqualToAttributedString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedSecondaryBodyText, a3);
    secondaryBodyTextView = self->_secondaryBodyTextView;
    if (*p_attributedSecondaryBodyText)
    {
      if (!secondaryBodyTextView)
      {
        -[PKExplanationView _createBodyTextView](self, "_createBodyTextView");
        v7 = (UITextView *)objc_claimAutoreleasedReturnValue();
        v8 = self->_secondaryBodyTextView;
        self->_secondaryBodyTextView = v7;

        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_secondaryBodyTextView);
        secondaryBodyTextView = self->_secondaryBodyTextView;
      }
      -[UITextView setAttributedText:](secondaryBodyTextView, "setAttributedText:");
    }
    else
    {
      -[UITextView removeFromSuperview](secondaryBodyTextView, "removeFromSuperview");
      v9 = self->_secondaryBodyTextView;
      self->_secondaryBodyTextView = 0;

    }
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAttributedBodyText:(id)a3
{
  char v4;
  void *v5;
  NSAttributedString *v6;
  NSAttributedString *attributedBodyText;
  NSString *bodyText;
  NSAttributedString *v9;
  UITextView *bodyTextView;
  UITextView *v11;
  UITextView *v12;
  UITextView *v13;
  void *v14;
  UITextView *v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "isEqualToAttributedString:", self->_attributedBodyText);
  v5 = v16;
  if ((v4 & 1) == 0)
  {
    v6 = (NSAttributedString *)objc_msgSend(v16, "copy");
    attributedBodyText = self->_attributedBodyText;
    self->_attributedBodyText = v6;

    bodyText = self->_bodyText;
    self->_bodyText = 0;

    v9 = self->_attributedBodyText;
    bodyTextView = self->_bodyTextView;
    if (v9)
    {
      if (!bodyTextView)
      {
        -[PKExplanationView _createBodyTextView](self, "_createBodyTextView");
        v11 = (UITextView *)objc_claimAutoreleasedReturnValue();
        v12 = self->_bodyTextView;
        self->_bodyTextView = v11;

        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_bodyTextView);
        bodyTextView = self->_bodyTextView;
        v9 = self->_attributedBodyText;
      }
      -[UITextView setAttributedText:](bodyTextView, "setAttributedText:", v9);
      v13 = self->_bodyTextView;
      -[PKExplanationView bodyTextFont](self, "bodyTextFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setFont:](v13, "setFont:", v14);

      -[UITextView setTextAlignment:](self->_bodyTextView, "setTextAlignment:", self->_bodyTextAlignment);
    }
    else
    {
      -[UITextView removeFromSuperview](bodyTextView, "removeFromSuperview");
      v15 = self->_bodyTextView;
      self->_bodyTextView = 0;

    }
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v16;
  }

}

- (void)setBodyView:(id)a3
{
  UIView *v5;
  UIView *bodyView;
  UIView *v7;

  v5 = (UIView *)a3;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bodyView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bodyView, a3);
    if (self->_bodyView)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBodyButtonText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *v19;
  UIButton *bodyButton;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  v4 = a3;
  -[UIButton configuration](self->_bodyButton, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9 = v7;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (v8 && v9)
    {
      v11 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      if (!v8)
      {
        -[UIButton removeFromSuperview](self->_bodyButton, "removeFromSuperview");
        bodyButton = self->_bodyButton;
        self->_bodyButton = 0;

        goto LABEL_13;
      }
    }
    v12 = self->_bodyButton;
    if (v12)
    {
      -[UIButton pkui_updateConfigurationWithTitle:](v12, "pkui_updateConfigurationWithTitle:", v8);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3520];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v8, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v16 = (void *)MEMORY[0x1E0DC3428];
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __39__PKExplanationView_setBodyButtonText___block_invoke;
      v24 = &unk_1E3E62BD0;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v16, "actionWithHandler:", &v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, v17, v21, v22, v23, v24);
      v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v19 = self->_bodyButton;
      self->_bodyButton = v18;

      -[UIButton setConfigurationUpdateHandler:](self->_bodyButton, "setConfigurationUpdateHandler:", &__block_literal_global_52);
      -[UIButton setAccessibilityIdentifier:](self->_bodyButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67980]);
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_bodyButton);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

    }
    -[UIButton sizeToFit](self->_bodyButton, "sizeToFit");
  }
LABEL_13:

}

void __39__PKExplanationView_setBodyButtonText___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_bodyButtonTapped");

}

void __39__PKExplanationView_setBodyButtonText___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  objc_msgSend(v2, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNumberOfLines:", 2);
}

- (void)setBodyButtonNumberOfLines:(int64_t)a3
{
  UIButton *bodyButton;
  void *v5;

  if (self->_bodyButtonNumberOfLines != a3)
  {
    self->_bodyButtonNumberOfLines = a3;
    bodyButton = self->_bodyButton;
    if (bodyButton)
    {
      -[UIButton titleLabel](bodyButton, "titleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNumberOfLines:", self->_bodyButtonNumberOfLines);

      -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setHorizontalMargin:(unint64_t)a3
{
  if (self->_horizontalMargin != a3)
  {
    self->_horizontalMargin = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopMargin:(double)a3
{
  if (self->_topMargin != a3)
  {
    self->_topMargin = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleHyphenationFactor:(double)a3
{
  if (self->_titleHyphenationFactor != a3)
  {
    self->_titleHyphenationFactor = a3;
    -[PKExplanationView setTitleLabelText](self, "setTitleLabelText");
  }
}

- (void)setTitleImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_titleImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleImage, a3);
    -[UIImageView setImage:](self->_logoImageView, "setImage:", self->_titleImage);
    -[UIImageView sizeToFit](self->_logoImageView, "sizeToFit");
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setTitleAccessoriesEnabled:(BOOL)a3
{
  PKTrailingAccessoryLabel *titleLabel;
  LAUICheckmarkLayer *checkmarkLayer;
  PKTrailingAccessoryLabel *v6;
  UIActivityIndicatorView *activityIndicator;

  if (((!self->_titleAccessoriesEnabled ^ a3) & 1) == 0)
  {
    self->_titleAccessoriesEnabled = a3;
    titleLabel = self->_titleLabel;
    if (a3)
    {
      checkmarkLayer = self->_checkmarkLayer;
      -[LAUICheckmarkLayer aspectSize](checkmarkLayer, "aspectSize");
      PKSizeScaleAspectFit();
      -[PKTrailingAccessoryLabel registerAccessoryWithLayer:withSize:for:](titleLabel, "registerAccessoryWithLayer:withSize:for:", checkmarkLayer, CFSTR("checkmark"));
      v6 = self->_titleLabel;
      activityIndicator = self->_activityIndicator;
      -[UIActivityIndicatorView intrinsicContentSize](activityIndicator, "intrinsicContentSize");
      -[PKTrailingAccessoryLabel registerAccessoryWithView:withSize:for:](v6, "registerAccessoryWithView:withSize:for:", activityIndicator, CFSTR("activityIndicator"));
    }
    else
    {
      -[PKTrailingAccessoryLabel unregisterAccessories](self->_titleLabel, "unregisterAccessories");
    }
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLogoImageViewTargetSize:(CGSize)a3
{
  if (self->_logoImageViewTargetSize.width != a3.width || self->_logoImageViewTargetSize.height != a3.height)
  {
    self->_logoImageViewTargetSize = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBodyDataDetectorTypes:(unint64_t)a3
{
  if (self->_bodyDataDetectorTypes != a3)
  {
    self->_bodyDataDetectorTypes = a3;
    -[UITextView setDataDetectorTypes:](self->_bodyTextView, "setDataDetectorTypes:");
    -[UITextView setDataDetectorTypes:](self->_secondaryBodyTextView, "setDataDetectorTypes:", self->_bodyDataDetectorTypes);
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBodyViewPadding:(double)a3
{
  if (self->_bodyViewPadding != a3)
  {
    self->_bodyViewPadding = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBodyViewThatFitsOverride:(id)a3
{
  void *v4;
  id bodyViewThatFitsOverride;

  v4 = _Block_copy(a3);
  bodyViewThatFitsOverride = self->_bodyViewThatFitsOverride;
  self->_bodyViewThatFitsOverride = v4;

  -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBodyViewContentMode:(unint64_t)a3
{
  if (self->_bodyViewContentMode != a3)
  {
    self->_bodyViewContentMode = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setReverseBodyViewAndBodyButtonOrder:(BOOL)a3
{
  if (self->_reverseBodyViewAndBodyButtonOrder != a3)
  {
    self->_reverseBodyViewAndBodyButtonOrder = a3;
    -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_continue
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewDidSelectContinue:", self);

}

- (void)_setupLater
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewDidSelectSetupLater:", self);

}

- (void)_bodyButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewDidSelectBodyButton:", self);

}

- (void)_calculateBlur
{
  UIScrollView *scrollView;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;

  scrollView = self->_scrollView;
  -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_blurringView);
  v5 = v4;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v15.size.height = fmin(v13, v14 - v9);
  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, fmin(fmax(CGRectGetMaxY(v15) - v5, 0.0), 30.0) / 30.0);
}

- (void)setTitleLabelText
{
  UIFont *titleFont;
  UIFont *v4;
  void *v5;
  UIFont *v6;
  id v7;
  double titleHyphenationFactor;
  id v9;
  NSString *titleText;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (self->_titleText)
  {
    titleFont = self->_titleFont;
    if (titleFont)
    {
      v4 = titleFont;
    }
    else
    {
      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
      v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v7, "setAlignment:", self->_titleTextAlignment);
    objc_msgSend(v7, "setLineBreakMode:", 0);
    objc_msgSend(v7, "setLineBreakStrategy:", self->_titleLineBreakStrategy);
    titleHyphenationFactor = self->_titleHyphenationFactor;
    *(float *)&titleHyphenationFactor = titleHyphenationFactor;
    objc_msgSend(v7, "setHyphenationFactor:", titleHyphenationFactor);
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    titleText = self->_titleText;
    v11 = *MEMORY[0x1E0DC1138];
    v14[0] = *MEMORY[0x1E0DC1178];
    v14[1] = v11;
    v15[0] = v7;
    v15[1] = v6;
    v14[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v9, "initWithString:attributes:", titleText, v13);

  }
  else
  {
    v5 = 0;
  }
  -[PKTrailingAccessoryLabel setAttributedText:](self->_titleLabel, "setAttributedText:", v5);

}

- (void)_createSubviews
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  UIImageView *v5;
  UIImageView *imageView;
  PKTrailingAccessoryLabel *v7;
  PKTrailingAccessoryLabel *titleLabel;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *activityIndicator;
  LAUICheckmarkLayer *v11;
  LAUICheckmarkLayer *checkmarkLayer;
  __CFString *v13;
  void *v14;
  UIImage *v15;
  UIImage *titleImage;
  UIImageView *v17;
  UIImageView *logoImageView;
  UIImageView *v19;
  void *v20;
  UIImageView *v21;
  UIImageView *bodyImageView;
  PKPaymentSetupDockView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PKPaymentSetupDockView *v28;
  PKPaymentSetupDockView *dockView;
  void *v30;
  void *v31;
  void *v32;
  int IsSetupAssistant;
  PKPaymentSetupDockView *v34;
  void *v35;
  void *v36;
  _PKVisibilityBackdropView *v37;
  _PKVisibilityBackdropView *blurringView;
  void *v39;
  _QWORD *p_logoImageView;

  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  imageView = self->_imageView;
  self->_imageView = v5;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  v7 = objc_alloc_init(PKTrailingAccessoryLabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  -[PKExplanationView setTitleLabelText](self, "setTitleLabelText");
  v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView sizeToFit](self->_activityIndicator, "sizeToFit");
  -[UIActivityIndicatorView setHidden:](self->_activityIndicator, "setHidden:", 1);
  v11 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
  checkmarkLayer = self->_checkmarkLayer;
  self->_checkmarkLayer = v11;

  -[LAUICheckmarkLayer setLineWidthScale:](self->_checkmarkLayer, "setLineWidthScale:", 1.4);
  -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:", 0, 0);
  -[PKExplanationView _updateCheckmarkColor](self, "_updateCheckmarkColor");
  if (-[PKExplanationView _isBuddyiPad](self, "_isBuddyiPad"))
    v13 = CFSTR("Payment_SetupLogoBuddyPad");
  else
    v13 = CFSTR("Payment_SetupLogo");
  PKUIImageNamed(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_titleImage, v14);

  -[UIImage imageWithRenderingMode:](self->_titleImage, "imageWithRenderingMode:", 2);
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
  titleImage = self->_titleImage;
  self->_titleImage = v15;

  v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", self->_titleImage);
  logoImageView = self->_logoImageView;
  self->_logoImageView = v17;

  v19 = self->_logoImageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v19, "setTintColor:", v20);

  v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  bodyImageView = self->_bodyImageView;
  self->_bodyImageView = v21;

  -[UIImageView setContentMode:](self->_bodyImageView, "setContentMode:", 1);
  v23 = [PKPaymentSetupDockView alloc];
  v24 = *MEMORY[0x1E0C9D648];
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v28 = -[PKPaymentSetupDockView initWithFrame:context:](v23, "initWithFrame:context:", self->_context, *MEMORY[0x1E0C9D648], v25, v26, v27);
  dockView = self->_dockView;
  self->_dockView = v28;

  -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitle:forState:", v31, 0);

  -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel__continue, 0x2000);

  -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  v34 = self->_dockView;
  if (IsSetupAssistant)
  {
    -[PKPaymentSetupDockView footerView](v34, "footerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setupLaterButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addTarget:action:forControlEvents:", self, sel__setupLater, 0x2000);

  }
  else
  {
    -[PKPaymentSetupDockView setFooterView:](v34, "setFooterView:", 0);
  }
  v37 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v24, v25, v26, v27);
  blurringView = self->_blurringView;
  self->_blurringView = v37;

  -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
  -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, self->_backdropWeight);
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", self->_dockView);

  -[PKExplanationView addSubview:](self, "addSubview:", self->_scrollView);
  -[PKExplanationView addSubview:](self, "addSubview:", self->_blurringView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_imageView);
  if (-[PKExplanationView _showTitleLogoImageView](self, "_showTitleLogoImageView"))
    p_logoImageView = &self->_logoImageView;
  else
    p_logoImageView = &self->_titleLabel;
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", *p_logoImageView);
  -[PKExplanationView setTitleAccessoriesEnabled:](self, "setTitleAccessoriesEnabled:", 1);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKExplanationView;
  -[PKExplanationView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PKExplanationView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKExplanationView;
  -[PKExplanationView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKExplanationView _updateCheckmarkColor](self, "_updateCheckmarkColor");
  -[PKExplanationView _updateIconBorderColor](self, "_updateIconBorderColor");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKExplanationView;
  -[PKExplanationView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCheckmarkColor
{
  void *v3;
  _QWORD v4[5];

  -[PKExplanationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PKExplanationView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __42__PKExplanationView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[58];
  objc_msgSend(v1, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);

}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;

  if (self->_hideTitleText)
  {
    -[UIImageView removeFromSuperview](self->_logoImageView, "removeFromSuperview");
LABEL_6:
    -[PKTrailingAccessoryLabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    goto LABEL_7;
  }
  if (-[PKExplanationView _showTitleLogoImageView](self, "_showTitleLogoImageView"))
  {
    -[UIImageView superview](self->_logoImageView, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_logoImageView);
    goto LABEL_6;
  }
  -[PKTrailingAccessoryLabel superview](self->_titleLabel, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  -[UIImageView removeFromSuperview](self->_logoImageView, "removeFromSuperview");
  -[PKExplanationView setTitleLabelText](self, "setTitleLabelText");
LABEL_7:
  -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_showTitleLogoImageView
{
  return -[NSString length](self->_titleText, "length") == 0;
}

- (BOOL)_isBuddyiPad
{
  void *v2;
  uint64_t v3;
  BOOL result;

  -[PKExplanationView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = PKPaymentSetupContextIsSetupAssistant();
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  return result;
}

- (id)_createBodyTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataDetectorTypes:", self->_bodyDataDetectorTypes);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setSelectable:", 1);
  objc_msgSend(v3, "setScrollingEnabled:", 0);
  objc_msgSend(v3, "_setInteractiveTextSelectionDisabled:", 1);
  v8 = *MEMORY[0x1E0DC1140];
  if (PKPaymentSetupContextIsBridge())
    BPSBridgeTintColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLinkTextAttributes:", v5);

  -[PKExplanationView bodyTextFont](self, "bodyTextFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  objc_msgSend(v3, "setTextAlignment:", self->_bodyTextAlignment);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  return v3;
}

- (double)_resolvedHorizontalMargin
{
  double result;

  if (self->_horizontalMargin)
    return 24.0;
  -[PKExplanationView _automaticHorizontalMargin](self, "_automaticHorizontalMargin");
  return result;
}

- (double)_automaticHorizontalMargin
{
  double result;
  uint64_t v3;

  if (-[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    return 44.0;
  v3 = PKUIGetMinScreenWidthType();
  result = 24.0;
  if (!v3)
    return 16.0;
  return result;
}

- (void)_updateImage
{
  id *p_imageView;
  unint64_t imageStyle;
  void *v5;
  void *v6;
  void *v7;

  p_imageView = (id *)&self->_imageView;
  -[UIImageView setImage:](self->_imageView, "setImage:", self->_image);
  if (self->_image)
  {
    imageStyle = self->_imageStyle;
    if (imageStyle == 1)
    {
      objc_msgSend(*p_imageView, "setFrame:", 0.0, 0.0, 80.0, 80.0);
      objc_msgSend(*p_imageView, "setClipsToBounds:", 1);
      objc_msgSend(*p_imageView, "_setContinuousCornerRadius:", 14.0);
      objc_msgSend(*p_imageView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBorderWidth:", 0.5);

      -[PKExplanationView _updateIconBorderColor](self, "_updateIconBorderColor");
    }
    else if (!imageStyle)
    {
      objc_msgSend(*p_imageView, "sizeToFit");
      objc_msgSend(*p_imageView, "setClipsToBounds:", 0);
      objc_msgSend(*p_imageView, "_setContinuousCornerRadius:", 0.0);
      objc_msgSend(*p_imageView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBorderColor:", 0);
      objc_msgSend(v5, "setBorderWidth:", 0.0);

    }
    objc_msgSend(*p_imageView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", *p_imageView);
    p_imageView = (id *)&self->_heroView;
  }
  objc_msgSend(*p_imageView, "removeFromSuperview");
  -[PKExplanationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateIconBorderColor
{
  void *v3;
  _QWORD v4[5];

  if (self->_imageStyle == 1)
  {
    -[PKExplanationView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__PKExplanationView__updateIconBorderColor__block_invoke;
    v4[3] = &unk_1E3E612E8;
    v4[4] = self;
    PKUIPerformWithEffectiveTraitCollection(v3, v4);

  }
}

void __43__PKExplanationView__updateIconBorderColor__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return PKPaymentSetupContextIsSetupAssistant() ^ 1;
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v4;
  int64_t v5;

  v4 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0 || (PKPaymentSetupContextIsBridge() & 1) != 0)
  {
    v5 = 2030;
  }
  else if (objc_msgSend(v4, "userInterfaceStyle") == 2)
  {
    v5 = 2030;
  }
  else
  {
    v5 = 2010;
  }

  return v5;
}

- (PKExplanationViewDelegate)delegate
{
  return (PKExplanationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showPrivacyView
{
  return self->_showPrivacyView;
}

- (BOOL)forceShowSetupLaterButton
{
  return self->_forceShowSetupLaterButton;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (unint64_t)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)titleHyphenationFactor
{
  return self->_titleHyphenationFactor;
}

- (double)topLogoPadding
{
  return self->_topLogoPadding;
}

- (void)setTopLogoPadding:(double)a3
{
  self->_topLogoPadding = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (BOOL)imageIgnoresTopSafeArea
{
  return self->_imageIgnoresTopSafeArea;
}

- (void)setImageIgnoresTopSafeArea:(BOOL)a3
{
  self->_imageIgnoresTopSafeArea = a3;
}

- (UIView)heroView
{
  return self->_heroView;
}

- (id)heroViewSizeThatFitsOverride
{
  return self->_heroViewSizeThatFitsOverride;
}

- (unint64_t)heroViewContentMode
{
  return self->_heroViewContentMode;
}

- (BOOL)heroViewPrefersSizeTransform
{
  return self->_heroViewPrefersSizeTransform;
}

- (UIColor)topBackgroundColor
{
  return self->_topBackgroundColor;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitleText
{
  return self->_hideTitleText;
}

- (int64_t)titleTextAlignment
{
  return self->_titleTextAlignment;
}

- (int64_t)titleTextNumberOfLines
{
  return self->_titleTextNumberOfLines;
}

- (unint64_t)titleLineBreakStrategy
{
  return self->_titleLineBreakStrategy;
}

- (UIImage)bodyImage
{
  return self->_bodyImage;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSAttributedString)attributedBodyText
{
  return self->_attributedBodyText;
}

- (NSAttributedString)attributedSecondaryBodyText
{
  return self->_attributedSecondaryBodyText;
}

- (NSString)bodyButtonText
{
  return self->_bodyButtonText;
}

- (int64_t)bodyButtonNumberOfLines
{
  return self->_bodyButtonNumberOfLines;
}

- (UIView)bodyView
{
  return self->_bodyView;
}

- (id)bodyViewThatFitsOverride
{
  return self->_bodyViewThatFitsOverride;
}

- (unint64_t)bodyViewContentMode
{
  return self->_bodyViewContentMode;
}

- (BOOL)bodyViewPrefersSizeTransform
{
  return self->_bodyViewPrefersSizeTransform;
}

- (BOOL)reverseBodyViewAndBodyButtonOrder
{
  return self->_reverseBodyViewAndBodyButtonOrder;
}

- (double)bodyViewPadding
{
  return self->_bodyViewPadding;
}

- (int64_t)bodyTextAlignment
{
  return self->_bodyTextAlignment;
}

- (unint64_t)bodyDataDetectorTypes
{
  return self->_bodyDataDetectorTypes;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (PKPaymentSetupDockView)dockView
{
  return self->_dockView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)titleAccessoriesEnabled
{
  return self->_titleAccessoriesEnabled;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (UIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageView, a3);
}

- (CGSize)logoImageViewTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_logoImageViewTargetSize.width;
  height = self->_logoImageViewTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTextView, a3);
}

- (double)maxImageHeight
{
  return self->_maxImageHeight;
}

- (void)setMaxImageHeight:(double)a3
{
  self->_maxImageHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong(&self->_bodyViewThatFitsOverride, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_bodyButtonText, 0);
  objc_storeStrong((id *)&self->_attributedSecondaryBodyText, 0);
  objc_storeStrong((id *)&self->_attributedBodyText, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_topBackgroundColor, 0);
  objc_storeStrong(&self->_heroViewSizeThatFitsOverride, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_storeStrong((id *)&self->_secondaryBodyTextView, 0);
  objc_storeStrong((id *)&self->_bodyButton, 0);
  objc_storeStrong((id *)&self->_bodyImageView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
