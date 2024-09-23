@implementation PKDiscoveryCallToActionFooterView

- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4 itemIdentifier:(id)a5
{
  id v9;
  id v10;
  PKDiscoveryCallToActionFooterView *v11;
  PKDiscoveryCallToActionFooterView *v12;
  void *v13;
  NSString *v14;
  id *p_callToAction;
  uint64_t v16;
  PKDiscoveryMedia *media;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UILabel *titleLabel;
  uint64_t v24;
  UILabel *expandedTitleLabel;
  void *v26;
  uint64_t v27;
  UILabel *editorialDescriptionLabel;
  uint64_t v29;
  UILabel *expandedEditorialDescriptionLabel;
  void *v31;
  id v32;
  uint64_t v33;
  UIImageView *iconImageView;
  UIImageView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  PKContinuousButton *v42;
  PKContinuousButton *button;
  PKContinuousButton *v44;
  void *v45;
  PKContinuousButton *v46;
  void *v47;
  PKContinuousButton *v48;
  void *v49;
  PKContinuousButton *v50;
  void *v51;
  void *v52;
  PKLinkedApplication *v53;
  void *v54;
  uint64_t v55;
  PKLinkedApplication *linkedApplication;
  id v58;
  uint64_t v59;
  int64x2_t v60;
  int64x2_t v61;
  objc_super v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKDiscoveryCallToActionFooterView;
  v11 = -[PKDiscoveryCallToActionFooterView init](&v62, sel_init);
  v12 = v11;
  if (v11)
  {
    v58 = v10;
    -[PKDiscoveryCallToActionFooterView traitCollection](v11, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v14);

    p_callToAction = (id *)&v12->_callToAction;
    objc_storeStrong((id *)&v12->_callToAction, a3);
    -[PKDiscoveryCallToAction icon](v12->_callToAction, "icon");
    v16 = objc_claimAutoreleasedReturnValue();
    media = v12->_media;
    v12->_media = (PKDiscoveryMedia *)v16;

    v12->_displayType = a4;
    objc_storeStrong((id *)&v12->_itemIdentifier, a5);
    v18 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryCallToAction backgroundColor](v12->_callToAction, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pkui_colorWithPKColor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDiscoveryCallToActionFooterView setBackgroundColor:](v12, "setBackgroundColor:", v20);
    -[PKDiscoveryCallToAction localizedTitle](v12->_callToAction, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[PKDiscoveryCallToActionFooterView _titleLabelWithLocalizedTitle:](v12, "_titleLabelWithLocalizedTitle:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      titleLabel = v12->_titleLabel;
      v12->_titleLabel = (UILabel *)v22;

      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_titleLabel);
      -[PKDiscoveryCallToActionFooterView _titleLabelWithLocalizedTitle:](v12, "_titleLabelWithLocalizedTitle:", v21);
      v24 = objc_claimAutoreleasedReturnValue();
      expandedTitleLabel = v12->_expandedTitleLabel;
      v12->_expandedTitleLabel = (UILabel *)v24;

      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_expandedTitleLabel);
    }
    objc_msgSend(*p_callToAction, "localizedSubtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[PKDiscoveryCallToActionFooterView _descriptionLabelWithLocalizedDescription:](v12, "_descriptionLabelWithLocalizedDescription:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      editorialDescriptionLabel = v12->_editorialDescriptionLabel;
      v12->_editorialDescriptionLabel = (UILabel *)v27;

      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_editorialDescriptionLabel);
      -[PKDiscoveryCallToActionFooterView _descriptionLabelWithLocalizedDescription:](v12, "_descriptionLabelWithLocalizedDescription:", v26);
      v29 = objc_claimAutoreleasedReturnValue();
      expandedEditorialDescriptionLabel = v12->_expandedEditorialDescriptionLabel;
      v12->_expandedEditorialDescriptionLabel = (UILabel *)v29;

      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_expandedEditorialDescriptionLabel);
    }
    objc_msgSend(v9, "icon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_hasIcon = v31 != 0;

    if (v12->_hasIcon)
    {
      v32 = objc_alloc(MEMORY[0x1E0DC3890]);
      v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      iconImageView = v12->_iconImageView;
      v12->_iconImageView = (UIImageView *)v33;

      v35 = v12->_iconImageView;
      v36 = (void *)MEMORY[0x1E0DC3658];
      -[PKDiscoveryMedia backgroundColor](v12->_media, "backgroundColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pkui_colorWithPKColor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v35, "setBackgroundColor:", v38);

      -[UIImageView setContentMode:](v12->_iconImageView, "setContentMode:", 1);
      -[UIImageView setAccessibilityIgnoresInvertColors:](v12->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1);
      if (objc_msgSend(*p_callToAction, "shouldRoundIcon"))
      {
        -[UIImageView layer](v12->_iconImageView, "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCornerRadius:", 10.0);
        objc_msgSend(v39, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
        objc_msgSend(v39, "setMasksToBounds:", 1);

      }
      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_iconImageView);
    }
    objc_msgSend(v9, "localizedButtonText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = 1;
    else
      v41 = objc_msgSend(*p_callToAction, "action") == 8;
    v12->_hasButton = v41;

    if (v12->_hasButton)
    {
      v59 = 0;
      v60 = vdupq_n_s64(2uLL);
      v61 = v60;
      v42 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v59);
      button = v12->_button;
      v12->_button = v42;

      v44 = v12->_button;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.945098039, 0.941176471, 0.968627451, 1.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTintColor:](v44, "setTintColor:", v45);

      v46 = v12->_button;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton updateTitleColorWithColor:](v46, "updateTitleColorWithColor:", v47);

      v48 = v12->_button;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton updateActivityIndicatorColorWithColor:](v48, "updateActivityIndicatorColorWithColor:", v49);

      v50 = v12->_button;
      objc_msgSend(*p_callToAction, "localizedButtonText");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTitle:forState:](v50, "setTitle:forState:", v51, 0);

      -[PKContinuousButton addTarget:action:forControlEvents:](v12->_button, "addTarget:action:forControlEvents:", v12, sel__buttonPressed_, 64);
      -[PKContinuousButton _setTouchInsets:](v12->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
      -[PKContinuousButton setAccessibilityIdentifier:](v12->_button, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
      -[PKDiscoveryCallToActionFooterView addSubview:](v12, "addSubview:", v12->_button);
    }
    if (objc_msgSend(*p_callToAction, "action") == 8)
    {
      objc_msgSend(*p_callToAction, "appStoreAppIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = [PKLinkedApplication alloc];
        v63[0] = v52;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:](v53, "initWithStoreIDs:defaultLaunchURL:", v54, 0);
        linkedApplication = v12->_linkedApplication;
        v12->_linkedApplication = (PKLinkedApplication *)v55;

        -[PKLinkedApplication addObserver:](v12->_linkedApplication, "addObserver:", v12);
        -[PKDiscoveryCallToActionFooterView setShowActivityIndicator:](v12, "setShowActivityIndicator:", 1);
        -[PKLinkedApplication reloadApplicationStateIfNecessary](v12->_linkedApplication, "reloadApplicationStateIfNecessary");
      }

    }
    if (v12->_hasIcon)
      -[PKDiscoveryCallToActionFooterView _loadImageData](v12, "_loadImageData");
    -[PKDiscoveryCallToActionFooterView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679A8]);

    v10 = v58;
  }

  return v12;
}

- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4
{
  return -[PKDiscoveryCallToActionFooterView initWithCallToAction:displayType:itemIdentifier:](self, "initWithCallToAction:displayType:itemIdentifier:", a3, a4, 0);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  CGRectEdge v12;
  CGRectEdge v13;
  double x;
  double y;
  double width;
  double height;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int64_t displayType;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UILabel *titleLabel;
  double v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UILabel *editorialDescriptionLabel;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  UILabel *expandedTitleLabel;
  double v46;
  double v47;
  _BOOL4 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  UILabel *v59;
  UILabel *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGRect remainder;
  CGRect slice;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[PKDiscoveryCallToActionFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PKDiscoveryCallToActionFooterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v11)
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  if (v11)
    v13 = CGRectMinXEdge;
  else
    v13 = CGRectMaxXEdge;
  v69.origin.x = v4;
  v69.origin.y = v6;
  v69.size.width = v8;
  v69.size.height = v10;
  v70 = CGRectInset(v69, 20.0, 0.0);
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  height = v70.size.height;
  memset(&slice, 0, sizeof(slice));
  remainder = v70;
  if (self->_hasIcon)
  {
    -[PKDiscoveryCallToActionFooterView _iconSize](self, "_iconSize");
    v19 = v18 + 20.0;
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    CGRectDivide(v71, &slice, &remainder, v19, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  }
  if (self->_hasButton)
  {
    -[PKDiscoveryCallToActionFooterView _buttonSizeForBounds:](self, "_buttonSizeForBounds:", x, y, width, height);
    CGRectDivide(remainder, &slice, &remainder, v20 + 20.0, v13);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](self->_button, "setFrame:");
  }
  +[PKDiscoveryCardView expandedWidth](PKDiscoveryCardView, "expandedWidth");
  v22 = v21;
  +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
  v24 = v22 - v23;
  displayType = self->_displayType;
  v72 = CGRectInset(remainder, 0.0, 4.0);
  v26 = v72.size.height;
  if (displayType == 1)
    v27 = -0.0;
  else
    v27 = v24;
  if (displayType == 1)
    v28 = v24;
  else
    v28 = 0.0;
  v65 = v72.size.width;
  v29 = v72.size.width - v28;
  v30 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v72.size.width - v28, 1.79769313e308);
    if (v32 <= v26)
    {
      v35 = v32;
      v33 = 0;
    }
    else
    {
      v33 = 1;
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, v26);
      v35 = v34;
    }
  }
  else
  {
    v33 = 0;
    v35 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v36 = v26;
  v37 = v26 - v35;
  editorialDescriptionLabel = self->_editorialDescriptionLabel;
  v66 = v30;
  if (editorialDescriptionLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, 1.79769313e308);
    v30 = v39;
  }
  if (v30 > v37)
  {
    v33 = 1;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, v37);
  }
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  v40 = v27 + v65;
  PKSizeAlignedInRect();
  v63 = v42;
  v64 = v41;
  v61 = v44;
  v62 = v43;
  expandedTitleLabel = self->_expandedTitleLabel;
  v46 = v66;
  if (expandedTitleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](expandedTitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v40, v36);
    v46 = v47;
  }
  if (self->_expandedEditorialDescriptionLabel)
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v40, v36 - v46);
  v48 = displayType == 1;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  if ((v48 & v33) != 0)
    v57 = 0.0;
  else
    v57 = 1.0;
  if ((v48 & v33) != 0)
    v58 = 1.0;
  else
    v58 = 0.0;
  v59 = self->_titleLabel;
  PKRectRoundToPixel();
  -[UILabel setFrame:](v59, "setFrame:");
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v57);
  -[UILabel setFrame:](self->_editorialDescriptionLabel, "setFrame:", v64, v63, v62, v61);
  -[UILabel setAlpha:](self->_editorialDescriptionLabel, "setAlpha:", v57);
  v60 = self->_expandedTitleLabel;
  PKRectRoundToPixel();
  -[UILabel setFrame:](v60, "setFrame:");
  -[UILabel setAlpha:](self->_expandedTitleLabel, "setAlpha:", v58);
  -[UILabel setFrame:](self->_expandedEditorialDescriptionLabel, "setFrame:", v50, v52, v54, v56);
  -[UILabel setAlpha:](self->_expandedEditorialDescriptionLabel, "setAlpha:", v58);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 78.0;
  result.height = v3;
  return result;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4;
  char v5;
  PKContinuousButton *button;
  void *v7;
  void *v8;

  v4 = a3;
  -[PKDiscoveryCallToActionFooterView setShowActivityIndicator:](self, "setShowActivityIndicator:", 0);
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
  -[PKDiscoveryCallToActionFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  _BOOL8 v4;

  if (((!self->_showActivityIndicator ^ a3) & 1) == 0)
  {
    v4 = !a3;
    self->_showActivityIndicator = a3;
    -[PKContinuousButton setShowSpinner:](self->_button, "setShowSpinner:");
    -[PKContinuousButton setEnabled:](self->_button, "setEnabled:", v4);
  }
}

- (void)setCallToActionTappedOverride:(id)a3
{
  void *v4;
  id callToActionTappedOverride;

  v4 = _Block_copy(a3);
  callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_callToActionTappedOverride = v4;

}

- (void)setDisplayType:(int64_t)a3
{
  if (self->_displayType != a3)
  {
    self->_displayType = a3;
    -[PKDiscoveryCallToActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_titleLabelColor
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKDiscoveryCallToAction foregroundContentMode](self->_callToAction, "foregroundContentMode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_descriptionLabelColor
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKDiscoveryCallToAction foregroundContentMode](self->_callToAction, "foregroundContentMode") == 2)
  {
    if (self->_titleLabel)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  UILabel *titleLabel;
  void *v13;
  UILabel *editorialDescriptionLabel;
  void *v15;
  UILabel *expandedTitleLabel;
  void *v17;
  UILabel *expandedEditorialDescriptionLabel;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryCallToActionFooterView;
  v4 = a3;
  -[PKDiscoveryCallToActionFooterView traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[PKDiscoveryCallToActionFooterView traitCollection](self, "traitCollection", v20.receiver, v20.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (v8 && v9)
    {
      v11 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    titleLabel = self->_titleLabel;
    -[PKDiscoveryCallToActionFooterView _titleLabelFont](self, "_titleLabelFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v13);

    editorialDescriptionLabel = self->_editorialDescriptionLabel;
    -[PKDiscoveryCallToActionFooterView _editorialDescriptionLabelFont](self, "_editorialDescriptionLabelFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](editorialDescriptionLabel, "setFont:", v15);

    expandedTitleLabel = self->_expandedTitleLabel;
    -[PKDiscoveryCallToActionFooterView _titleLabelFont](self, "_titleLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](expandedTitleLabel, "setFont:", v17);

    expandedEditorialDescriptionLabel = self->_expandedEditorialDescriptionLabel;
    -[PKDiscoveryCallToActionFooterView _editorialDescriptionLabelFont](self, "_editorialDescriptionLabelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](expandedEditorialDescriptionLabel, "setFont:", v19);

    self->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8);
    -[PKDiscoveryCallToActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)_buttonPressed:(id)a3
{
  void (**callToActionTappedOverride)(id, id);
  id WeakRetained;

  callToActionTappedOverride = (void (**)(id, id))self->_callToActionTappedOverride;
  if (callToActionTappedOverride)
  {
    callToActionTappedOverride[2](callToActionTappedOverride, a3);
  }
  else if (-[PKDiscoveryCallToAction action](self->_callToAction, "action", a3) == 8
         && -[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled"))
  {
    -[PKLinkedApplication openApplication:](self->_linkedApplication, "openApplication:", 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "discoveryCardViewCTATapped:callToAction:itemIdentifier:", self, self->_callToAction, self->_itemIdentifier);

  }
}

- (id)_titleLabelWithLocalizedTitle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "setText:", v5);

  -[PKDiscoveryCallToActionFooterView _titleLabelFont](self, "_titleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[PKDiscoveryCallToActionFooterView _titleLabelColor](self, "_titleLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  return v7;
}

- (id)_descriptionLabelWithLocalizedDescription:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "setText:", v5);

  -[PKDiscoveryCallToActionFooterView _editorialDescriptionLabelFont](self, "_editorialDescriptionLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[PKDiscoveryCallToActionFooterView _descriptionLabelColor](self, "_descriptionLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D58]);
  return v7;
}

- (id)_titleLabelFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], 2, 0);
}

- (id)_editorialDescriptionLabelFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F0], *MEMORY[0x1E0DC1440]);
}

- (CGSize)_buttonSizeForBounds:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  -[PKContinuousButton titleLabel](self->_button, "titleLabel", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0DC4B10];
  v8 = (void *)*MEMORY[0x1E0DC48F8];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v9);

  objc_msgSend(v6, "setNumberOfLines:", 1);
  objc_msgSend(v6, "setTextAlignment:", 1);
  -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  -[PKDiscoveryCallToActionFooterView _buttonWidthForLabelWidth:](self, "_buttonWidthForLabelWidth:", 36.0);
  v11 = v10;
  +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
  PKFloatRoundToPixel();
  v13 = v12;
  -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
  if (v14 >= v11)
  {
    v11 = v14;
    if (v14 > v13)
    {
      -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 0.0, 8.0, 0.0, 8.0);
      -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
      v11 = v15;
    }
  }
  if (v11 > v13)
  {
    if (self->_useAccessibilityLayout)
      v16 = 13.0;
    else
      v16 = 9.0;
    PKFontForDefaultDesign(v7, v8, 2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontWithSize:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 4.0, 16.0, 4.0, 16.0);
    objc_msgSend(v6, "setNumberOfLines:", 2);
    objc_msgSend(v6, "setFont:", v18);
    objc_msgSend(v6, "setLineBreakMode:", 4);
    objc_msgSend(v6, "sizeThatFits:", v13 + -32.0, height);
    -[PKDiscoveryCallToActionFooterView _buttonWidthForLabelWidth:](self, "_buttonWidthForLabelWidth:");
    v11 = v19;

  }
  if (self->_useAccessibilityLayout)
    v20 = 34.0;
  else
    v20 = 28.0;

  v21 = v11;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (double)_buttonWidthForLabelWidth:(double)a3
{
  return a3 + 32.0;
}

- (CGSize)_iconSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  CGSize result;

  if ((-[PKDiscoveryCallToAction shouldRoundIcon](self->_callToAction, "shouldRoundIcon") & 1) != 0)
  {
    *(double *)&v3 = 48.0;
    *(double *)&v4 = 48.0;
  }
  else
  {
    -[PKDiscoveryMedia width](self->_media, "width");
    v6 = v5;
    -[PKDiscoveryMedia height](self->_media, "height");
    if (v6 <= v7)
    {
      *(double *)&v4 = 48.0;
      PKFloatRoundToPixel();
      v3 = v9;
    }
    else
    {
      *(double *)&v3 = 48.0;
      PKFloatRoundToPixel();
      v4 = v8;
    }
  }
  v10 = *(double *)&v3;
  v11 = *(double *)&v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_loadImageData
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  UIImageView *iconImageView;
  void *v21;
  PKDiscoveryMedia *media;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v3 = -[PKDiscoveryMedia type](self->_media, "type");
  if (v3 == 4)
  {
    -[PKDiscoveryMedia localAssetURL](self->_media, "localAssetURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithContentsOfFile:", v17);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_iconImageView, "setImage:", v23);
LABEL_12:

      return;
    }
    v23 = 0;
LABEL_11:
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v23);
    goto LABEL_12;
  }
  if (v3 == 3)
  {
    -[PKDiscoveryMedia passKitUIImageName](self->_media, "passKitUIImageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("pdf"));

    if (v6)
    {
      objc_msgSend(v4, "stringByDeletingPathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKPassKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLForResource:withExtension:", v7, CFSTR("pdf"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDiscoveryMedia width](self->_media, "width");
      v11 = v10;
      -[PKDiscoveryMedia height](self->_media, "height");
      v13 = v12;
      v14 = PKUIScreenScale();
      PKUIImageFromPDF(v9, v11, v13, v14);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKUIImageNamed(v4);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  v18 = PKUIScreenScale();
  -[PKDiscoveryMedia imageDataFromCacheWithScale:](self->_media, "imageDataFromCacheWithScale:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    iconImageView = self->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](iconImageView, "setImage:", v21);

  }
  else
  {
    objc_initWeak(&location, self);
    media = self->_media;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke;
    v24[3] = &unk_1E3E67BA8;
    objc_copyWeak(&v25, &location);
    -[PKDiscoveryMedia downloadImageDataWithScale:shouldWriteData:completion:](media, "downloadImageDataWithScale:shouldWriteData:completion:", 0, v24, v18);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5 = WeakRetained[54];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_3;
    v7[3] = &unk_1E3E61388;
    v7[4] = WeakRetained;
    v8 = v3;
    v6 = v3;
    objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v5, 5242880, v7, 0, 0.300000012);

  }
}

uint64_t __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setImage:", *(_QWORD *)(a1 + 40));
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  return (PKDiscoveryCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_expandedEditorialDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_editorialDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);
}

@end
