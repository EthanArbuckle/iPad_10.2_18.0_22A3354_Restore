@implementation PXCMMPosterBannerView

- (PXCMMPosterBannerView)initWithFrame:(CGRect)a3
{
  PXCMMPosterBannerView *v3;
  PXCMMPosterBannerView *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *visualEffectView;
  void *v8;
  uint64_t v9;
  PXUpdater *updater;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXCMMPosterBannerView;
  v3 = -[PXCMMPosterBannerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_headlineBoldRange = (_NSRange)xmmword_1A7C0C330;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v6;

    -[PXCMMPosterBannerView addSubview:](v4, "addSubview:", v4->_visualEffectView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    v9 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v4);
    updater = v4->_updater;
    v4->_updater = (PXUpdater *)v9;

    -[PXUpdater setNeedsUpdateSelector:](v4->_updater, "setNeedsUpdateSelector:", sel_setNeedsLayout);
    -[PXUpdater addUpdateSelector:](v4->_updater, "addUpdateSelector:", sel__updateActionButton);
    -[PXUpdater addUpdateSelector:](v4->_updater, "addUpdateSelector:", sel__updateTitles);
    -[PXUpdater setNeedsUpdateOf:](v4->_updater, "setNeedsUpdateOf:", sel__updateActionButton);
    -[PXUpdater setNeedsUpdateOf:](v4->_updater, "setNeedsUpdateOf:", sel__updateTitles);

  }
  return v4;
}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    -[PXCMMPosterBannerView _updateLoadingPeopleSuggestions](self, "_updateLoadingPeopleSuggestions");
  }
}

- (void)setAddingPhotos:(BOOL)a3
{
  if (self->_addingPhotos != a3)
  {
    self->_addingPhotos = a3;
    -[PXCMMPosterBannerView _updateActionButton](self, "_updateActionButton");
  }
}

- (void)setHeadline:(id)a3
{
  -[PXCMMPosterBannerView setHeadline:boldRange:](self, "setHeadline:boldRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setHeadline:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  NSString *v11;
  NSString *headline;
  NSString *v13;

  length = a4.length;
  location = a4.location;
  v13 = (NSString *)a3;
  v7 = self->_headline;
  if (v7 == v13)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqualToString:](v7, "isEqualToString:", v13);

    if (!v9)
    {
LABEL_9:
      v11 = (NSString *)-[NSString copy](v13, "copy");
      headline = self->_headline;
      self->_headline = v11;

      self->_headlineBoldRange.location = location;
      self->_headlineBoldRange.length = length;
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateTitles);
      goto LABEL_10;
    }
  }
  if (self->_headlineBoldRange.location != location || self->_headlineBoldRange.length != length)
    goto LABEL_9;
LABEL_10:

}

- (void)setLocalizedNamesForHeadline:(id)a3
{
  NSArray *v4;
  NSArray *localizedNamesForHeadline;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_localizedNamesForHeadline) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    localizedNamesForHeadline = self->_localizedNamesForHeadline;
    self->_localizedNamesForHeadline = v4;

    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateTitles);
  }

}

- (void)setSubheadline:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subheadline;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subheadline;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subheadline = self->_subheadline;
      self->_subheadline = v6;

      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateTitles);
    }
  }

}

- (void)setActionButtonWithTitle:(id)a3 actionBlock:(id)a4
{
  id v6;
  NSString *v7;
  NSString *actionButtonTitle;
  NSString *v9;
  BOOL v10;
  NSString *v11;
  void *v12;
  id actionButtonAction;
  NSString *v14;

  v14 = (NSString *)a3;
  v6 = a4;
  v7 = self->_actionButtonTitle;
  actionButtonTitle = v14;
  if (v7 == v14)
    goto LABEL_4;
  v9 = v7;
  v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);

  if (!v10)
  {
    v11 = (NSString *)-[NSString copy](v14, "copy");
    actionButtonTitle = self->_actionButtonTitle;
    self->_actionButtonTitle = v11;
LABEL_4:

  }
  v12 = (void *)objc_msgSend(v6, "copy");
  actionButtonAction = self->_actionButtonAction;
  self->_actionButtonAction = v12;

  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateActionButton);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMPosterBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMPosterBannerView;
  -[PXCMMPosterBannerView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCMMPosterBannerView bounds](self, "bounds");
  -[PXCMMPosterBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterBannerView;
  -[PXCMMPosterBannerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateTitles);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateActionButton);
  }
}

- (void)tintColorDidChange
{
  PXCapsuleButton *actionButton;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterBannerView;
  -[PXCMMPosterBannerView tintColorDidChange](&v5, sel_tintColorDidChange);
  actionButton = self->_actionButton;
  -[PXCMMPosterBannerView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCapsuleButton setColor:forState:](actionButton, "setColor:forState:", v4, 0);

}

- (void)_updateLoadingPeopleSuggestions
{
  BOOL v3;
  PXCapsuleButton *actionButton;

  v3 = -[PXCMMPosterBannerView isLoadingPeopleSuggestions](self, "isLoadingPeopleSuggestions");
  actionButton = self->_actionButton;
  if (v3)
    -[PXCapsuleButton startLoadingAnimation](actionButton, "startLoadingAnimation");
  else
    -[PXCapsuleButton stopLoadingAnimation](actionButton, "stopLoadingAnimation");
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double MinX;
  double MaxX;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  _BOOL4 IsAccessibilityCategory;
  PXCapsuleButton *actionButton;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UILabel *headlineLabel;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  double MaxY;
  void *v47;
  double v48;
  double v49;
  UILabel **p_subheadlineLabel;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  void *v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  UILabel *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  char v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGSize result;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v4 = a4;
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  v103 = a3;
  v7 = a3 + -32.0;
  v106.origin.x = 16.0;
  v106.origin.y = 0.0;
  v106.size.width = v7;
  v106.size.height = 1.79769313e308;
  MinX = CGRectGetMinX(v106);
  v107.origin.x = 16.0;
  v107.origin.y = 0.0;
  v107.size.width = v7;
  v107.size.height = 1.79769313e308;
  MaxX = CGRectGetMaxX(v107);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCMMPosterBannerView semanticContentAttribute](self, "semanticContentAttribute"));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredContentSizeCategory");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  actionButton = self->_actionButton;
  v90 = v10;
  v91 = v13;
  v101 = v12;
  v104 = v11;
  if (actionButton)
  {
    -[PXCapsuleButton sizeThatFits:](actionButton, "sizeThatFits:", MaxX - MinX, 1.79769313e308);
    v13 = v19;
    v21 = v20;
    v22 = MinX;
    v23 = MinX;
    if ((v14 == 0) != IsAccessibilityCategory)
    {
      v108.origin.x = 16.0;
      v108.origin.y = 0.0;
      v108.size.width = v7;
      v108.size.height = 1.79769313e308;
      v23 = CGRectGetMaxX(v108) - v13;
    }
    v100 = (60.0 - v21) * 0.5;
    if (IsAccessibilityCategory)
    {
      v24 = v101;
    }
    else
    {
      v26 = v13 + 16.0;
      v24 = v101;
      if (v14)
        v22 = MinX + v26;
      else
        MaxX = MaxX - v26;
    }
  }
  else
  {
    v25 = v11;
    v21 = v12;
    v100 = v25;
    v23 = v10;
    v24 = v12;
    v22 = MinX;
  }
  v27 = v103;
  headlineLabel = self->_headlineLabel;
  v99 = v23;
  if (headlineLabel)
  {
    if (!self->_headline && self->_localizedNamesForHeadline)
    {
      -[PXCMMPosterBannerView _headlineStringAttributes](self, "_headlineStringAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_headlineLabelBoldFont");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCMMSharePromptStringGenerator sharePromptStringWithAttributes:boldFont:lines:width:names:containsUnverifiedPersons:](PXCMMSharePromptStringGenerator, "sharePromptStringWithAttributes:boldFont:lines:width:names:containsUnverifiedPersons:", v29, v30, 2, self->_localizedNamesForHeadline, self->_containsUnverifiedPersons, MaxX - v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_headlineLabel, "setAttributedText:", v31);

      headlineLabel = self->_headlineLabel;
    }
    v96 = v13;
    v97 = v21;
    v92 = MaxX - v22;
    v32 = -[UILabel px_isOneLineForWidth:](headlineLabel, "px_isOneLineForWidth:", MaxX - v22);
    v33 = 0.0;
    if (v32 && !self->_subheadlineLabel)
    {
      PXScaledValueForTextStyleWithSymbolicTraits();
      v33 = v34;
    }
    PXScaledValueForTextStyleWithSymbolicTraits();
    v36 = v35;
    -[UILabel sizeThatFits:](self->_headlineLabel, "sizeThatFits:", v92, 1.79769313e308);
    v38 = v37;
    v40 = v39;
    v86 = v22;
    v88 = MaxX;
    v41 = MaxX - v37;
    if (v14)
      v42 = v41;
    else
      v42 = v22;
    v98 = v33;
    -[UILabel font](self->_headlineLabel, "font");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "ascender");
    v45 = v33 + v36 + 0.0 - v44;

    v94 = v42;
    v95 = v40;
    v109.origin.x = v42;
    v109.origin.y = v45;
    v109.size.width = v38;
    v109.size.height = v40;
    MaxY = CGRectGetMaxY(v109);
    -[UILabel font](self->_headlineLabel, "font");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "descender");
    v49 = v48;

    p_subheadlineLabel = &self->_subheadlineLabel;
    v51 = v104;
    if (!self->_subheadlineLabel)
    {
      v62 = v90;
      v58 = v91;
      v66 = v101;
LABEL_29:
      v93 = v66;
      v87 = v51;
      v89 = v58;
      v85 = v62;
      PXScaledValueForTextStyleWithSymbolicTraits();
      v68 = v94;
      v24 = v95;
      v104 = v45;
      v69 = v38;
      v27 = v103;
      v13 = v96;
      v21 = v97;
      goto LABEL_30;
    }
    v52 = MaxY + v49;
    v53 = v86;
    MaxX = v88;
    v54 = v92;
LABEL_24:
    PXScaledValueForTextStyleWithSymbolicTraits();
    v56 = v55;
    -[UILabel sizeThatFits:](*p_subheadlineLabel, "sizeThatFits:", v54, 1.79769313e308);
    v58 = v57;
    v60 = v59;
    v61 = MaxX - v57;
    if (v14)
      v62 = v61;
    else
      v62 = v53;
    -[UILabel font](*p_subheadlineLabel, "font");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "ascender");
    v65 = v52 + v56 - v64;
    v66 = v60;
    v51 = v65;

    v110.origin.x = v62;
    v110.origin.y = v51;
    v110.size.width = v58;
    v110.size.height = v66;
    MaxY = CGRectGetMaxY(v110);
    goto LABEL_29;
  }
  p_subheadlineLabel = &self->_subheadlineLabel;
  if (self->_subheadlineLabel)
  {
    v96 = v13;
    v97 = v21;
    v54 = MaxX - v22;
    LOBYTE(v32) = 1;
    v53 = v22;
    v52 = 0.0;
    v98 = 0.0;
    v38 = v91;
    v94 = v10;
    v95 = v24;
    v45 = v104;
    goto LABEL_24;
  }
  v67 = 9.0;
  v98 = 0.0;
  LOBYTE(v32) = 1;
  v68 = v10;
  v69 = v91;
  v85 = v90;
  v87 = v104;
  v89 = v91;
  v93 = v24;
  MaxY = 0.0;
LABEL_30:
  v70 = v98 + MaxY + v67;
  if (!self->_actionButton)
  {
    v80 = v99;
    if (!v4)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (!IsAccessibilityCategory)
  {
    if (self->_headlineLabel)
      v83 = v32;
    else
      v83 = 1;
    v80 = v99;
    if ((v83 & 1) != 0)
      v84 = (v70 - v21) * 0.5;
    else
      v84 = v104 + (v24 - v21) * 0.5;
    v100 = v84;
    if (!v4)
      goto LABEL_41;
LABEL_40:
    -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, v27, v70);
    -[UILabel setFrame:](self->_headlineLabel, "setFrame:", v68, v104, v69, v24);
    -[UILabel setFrame:](*p_subheadlineLabel, "setFrame:", v85, v87, v89, v93);
    -[PXCapsuleButton setFrame:](self->_actionButton, "setFrame:", v80, v100, v13, v21);
    goto LABEL_41;
  }
  v102 = v24;
  v71 = v68;
  v72 = v69;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v74 = v73;
  v75 = *p_subheadlineLabel;
  if (!*p_subheadlineLabel)
    v75 = self->_headlineLabel;
  -[UILabel font](v75, "font");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "descender");
  if (v77 == 0.0)
    v78 = 0.0;
  else
    v78 = v77;

  v79 = v74 + MaxY + v78;
  v80 = v99;
  v111.origin.y = v100;
  v111.origin.x = v99;
  v111.size.width = v13;
  v111.size.height = v21;
  v70 = CGRectGetHeight(v111) + v79 + 32.0;
  v100 = v79;
  v69 = v72;
  v68 = v71;
  v24 = v102;
  if (v4)
    goto LABEL_40;
LABEL_41:
  v81 = v27;
  v82 = v70;
  result.height = v82;
  result.width = v81;
  return result;
}

- (void)_updateActionButton
{
  id actionButtonAction;
  NSString *actionButtonTitle;
  PXCapsuleButton *actionButton;
  PXCapsuleButton *v6;
  PXCapsuleButton *v7;
  void *v8;
  BOOL v9;
  PXCapsuleButton *v10;

  actionButtonAction = self->_actionButtonAction;
  actionButtonTitle = self->_actionButtonTitle;
  actionButton = self->_actionButton;
  if (actionButtonTitle)
  {
    if (actionButton)
      goto LABEL_6;
    -[PXCMMPosterBannerView _actionButtonWithTitle:action:enabled:](self, "_actionButtonWithTitle:action:enabled:");
    v6 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->_actionButton;
    self->_actionButton = v6;

    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_actionButton);
  }
  else
  {
    -[PXCapsuleButton removeFromSuperview](actionButton, "removeFromSuperview");
    v8 = self->_actionButton;
    self->_actionButton = 0;
  }

  actionButton = self->_actionButton;
LABEL_6:
  -[PXCapsuleButton setEnabled:](actionButton, "setEnabled:", actionButtonAction != 0);
  -[PXCapsuleButton setTitle:forState:](self->_actionButton, "setTitle:forState:", self->_actionButtonTitle, 0);
  -[PXCapsuleButton sizeToFit](self->_actionButton, "sizeToFit");
  v9 = -[PXCMMPosterBannerView isAddingPhotos](self, "isAddingPhotos");
  v10 = self->_actionButton;
  if (v9)
    -[PXCapsuleButton startLoadingAnimation](v10, "startLoadingAnimation");
  else
    -[PXCapsuleButton stopLoadingAnimation](v10, "stopLoadingAnimation");
}

- (void)_updateTitles
{
  NSString *headline;
  void *v4;
  id v5;
  UILabel *v6;
  UILabel *headlineLabel;
  void *v8;
  UILabel *v9;
  NSString *subheadline;
  UILabel *subheadlineLabel;
  id v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;

  headline = self->_headline;
  if (headline || self->_localizedNamesForHeadline)
  {
    if (self->_headlineLabel)
    {
      if (headline)
      {
LABEL_5:
        -[PXCMMPosterBannerView _attributedStringWithString:boldRange:](self, "_attributedStringWithString:boldRange:", headline, self->_headlineBoldRange.location, self->_headlineBoldRange.length);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](self->_headlineLabel, "setAttributedText:", v4);

        goto LABEL_9;
      }
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3990]);
      v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      headlineLabel = self->_headlineLabel;
      self->_headlineLabel = v6;

      -[UILabel setNumberOfLines:](self->_headlineLabel, "setNumberOfLines:", 0);
      -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_headlineLabel);

      headline = self->_headline;
      if (headline)
        goto LABEL_5;
    }
    -[UILabel setAttributedText:](self->_headlineLabel, "setAttributedText:");
  }
  else
  {
    -[UILabel removeFromSuperview](self->_headlineLabel, "removeFromSuperview");
    v9 = self->_headlineLabel;
    self->_headlineLabel = 0;

  }
LABEL_9:
  subheadline = self->_subheadline;
  subheadlineLabel = self->_subheadlineLabel;
  if (subheadline)
  {
    if (!subheadlineLabel)
    {
      v12 = objc_alloc(MEMORY[0x1E0DC3990]);
      v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v14 = self->_subheadlineLabel;
      self->_subheadlineLabel = v13;

      objc_msgSend((id)objc_opt_class(), "_subheadlineLabelFont");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_subheadlineLabel, "setFont:", v15);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_subheadlineLabel, "setTextColor:", v16);

      -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_subheadlineLabel);

      subheadline = self->_subheadline;
      subheadlineLabel = self->_subheadlineLabel;
    }
    -[UILabel setText:](subheadlineLabel, "setText:", subheadline);
  }
  else
  {
    -[UILabel removeFromSuperview](subheadlineLabel, "removeFromSuperview");
    v18 = self->_subheadlineLabel;
    self->_subheadlineLabel = 0;

  }
}

- (void)_actionButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  uint8_t v6[16];

  v4 = a3;
  if (self->_actionButtonAction && !-[PXCMMPosterBannerView isAddingPhotos](self, "isAddingPhotos"))
  {
    v5 = objc_msgSend(self->_actionButtonAction, "copy");
    (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6789000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Tap on action button, but no button action block.", v6, 2u);
    }
  }

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_subheadlineLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subheadlineLabel, "setFont:", v4);

  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateTitles);
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateActionButton);
}

- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 enabled:(BOOL)a5
{
  id v7;
  PXCapsuleButton *v8;
  void *v9;
  PXCapsuleButton *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = [PXCapsuleButton alloc];
  -[PXCMMPosterBannerView tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXCapsuleButton initWithColor:](v8, "initWithColor:", v9);

  -[PXCapsuleButton setMaxContentSizeCategory:](v10, "setMaxContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCapsuleButton setColor:forState:](v10, "setColor:forState:", v11, 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCapsuleButton setTitleColor:forState:](v10, "setTitleColor:forState:", v12, 0);

  -[PXCapsuleButton setTitle:forState:](v10, "setTitle:forState:", v7, 0);
  -[PXCapsuleButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", self, a4, 64);
  return v10;
}

- (id)_headlineStringAttributes
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v2, "setAlignment:", 0);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "_headlineLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = *MEMORY[0x1E0DC1178];
  v7[0] = v3;
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_attributedStringWithString:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  length = a4.length;
  location = a4.location;
  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXCMMPosterBannerView _headlineStringAttributes](self, "_headlineStringAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v7, v8);

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)objc_opt_class(), "_headlineLabelBoldFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC1138];
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:range:", v11, location, length);

  }
  return v9;
}

- (NSString)headline
{
  return self->_headline;
}

- (NSString)subheadline
{
  return self->_subheadline;
}

- (NSArray)localizedNamesForHeadline
{
  return self->_localizedNamesForHeadline;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (void)setContainsUnverifiedPersons:(BOOL)a3
{
  self->_containsUnverifiedPersons = a3;
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (BOOL)isAddingPhotos
{
  return self->_addingPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNamesForHeadline, 0);
  objc_storeStrong((id *)&self->_subheadline, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_subheadlineLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
  objc_storeStrong(&self->_actionButtonAction, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

+ (id)_headlineLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
}

+ (id)_headlineLabelBoldFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 0);
}

+ (id)_subheadlineLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
}

@end
