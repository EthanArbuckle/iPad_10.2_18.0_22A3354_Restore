@implementation PHContactTableViewCell

+ (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  return 16.0;
}

+ (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  double result;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  result = 45.0;
  if (IsAccessibilityCategory)
    return 0.0;
  return result;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  double result;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  result = 10.0;
  if (IsAccessibilityCategory)
    return 0.0;
  return result;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v4 = a3;
  v5 = objc_alloc_init((Class)TUFeatureFlags);
  v6 = 0.0;
  if ((objc_msgSend(v5, "phoneRecentsAvatarsEnabled") & 1) == 0)
  {
    objc_msgSend(a1, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v4);
    v6 = v7 + 0.0;
  }
  objc_msgSend(a1, "avatarLayoutGuideWidthAnchorLayoutConstraintConstant:", v4);
  v9 = v8;
  objc_msgSend(a1, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v4);
  v11 = v6 + v9 + v10;

  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v15 = v11;
  result.right = v14;
  result.bottom = v13;
  result.left = v15;
  result.top = v12;
  return result;
}

+ (UIEdgeInsets)tableViewContentInset
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = objc_alloc_init((Class)TUFeatureFlags);
  if (objc_msgSend(v2, "phoneRecentsAvatarsEnabled"))
    v3 = -12.0;
  else
    v3 = 0.0;

  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v7;
  return result;
}

+ (id)imageForActionType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(CNActionTypeAudioCall, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesAudioGlyphImage](UIImage, "favoritesAudioGlyphImage"));
  }
  else if (objc_msgSend(CNActionTypeMail, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesMailGlyphImage](UIImage, "favoritesMailGlyphImage"));
  }
  else if (objc_msgSend(CNActionTypeMessage, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesMessageGlyphImage](UIImage, "favoritesMessageGlyphImage"));
  }
  else if (objc_msgSend(CNActionTypeTTYCall, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesTTYDirectGlyphImage](UIImage, "favoritesTTYDirectGlyphImage"));
  }
  else if (objc_msgSend(CNActionTypeTTYRelayCall, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesTTYRelayGlyphImage](UIImage, "favoritesTTYRelayGlyphImage"));
  }
  else
  {
    if (!objc_msgSend(CNActionTypeVideoCall, "isEqualToString:", v3))
    {
      v5 = 0;
      goto LABEL_14;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage favoritesVideoGlyphImage](UIImage, "favoritesVideoGlyphImage"));
  }
  v5 = (void *)v4;
LABEL_14:

  return v5;
}

+ (id)actionButtonImageForActionType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(CNActionTypeAudioCall, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage recentsAudioCallImage](UIImage, "recentsAudioCallImage"));
  }
  else if (objc_msgSend(CNActionTypeMail, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage mailActionImage](UIImage, "mailActionImage"));
  }
  else if (objc_msgSend(CNActionTypeMessage, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage messagesActionImage](UIImage, "messagesActionImage"));
  }
  else if (objc_msgSend(CNActionTypeTTYCall, "isEqualToString:", v3)
         || objc_msgSend(CNActionTypeTTYRelayCall, "isEqualToString:", v3))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage TTYActionImage](UIImage, "TTYActionImage"));
  }
  else
  {
    if (!objc_msgSend(CNActionTypeVideoCall, "isEqualToString:", v3))
    {
      v5 = 0;
      goto LABEL_11;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage recentsVideoCallImage](UIImage, "recentsVideoCallImage"));
  }
  v5 = (void *)v4;
LABEL_11:

  return v5;
}

- (TUFeatureFlags)featureFlags
{
  TUFeatureFlags *featureFlags;
  TUFeatureFlags *v4;
  TUFeatureFlags *v5;

  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }
  return featureFlags;
}

- (void)commonInit
{
  NSString *actionType;
  void *v4;
  objc_super v5;

  actionType = self->_actionType;
  self->_actionType = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell featureFlags](self, "featureFlags"));
  self->_tapTargets = objc_msgSend(v4, "recentsCallTapTargetsEnabled");

  v5.receiver = self;
  v5.super_class = (Class)PHContactTableViewCell;
  -[PHTableViewCell commonInit](&v5, "commonInit");
}

- (id)loadRootViewAndContentViews
{
  id v3;
  UIImageView *v4;
  UIImageView *subtitleImageView;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NUIContainerStackView *v11;
  NUIContainerStackView *subtitleStackView;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NUIContainerGridView *v18;
  NUIContainerGridView *gridView;
  id v20;
  void *v21;
  objc_super v23;
  NUIContainerStackView *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v23.receiver = self;
  v23.super_class = (Class)PHContactTableViewCell;
  v3 = -[PHDoubleLineTableViewCell loadRootViewAndContentViews](&v23, "loadRootViewAndContentViews");
  -[PHContactTableViewCell setAccessoryType:](self, "setAccessoryType:", 4);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  subtitleImageView = self->_subtitleImageView;
  self->_subtitleImageView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
  -[UIImageView setTintColor:](self->_subtitleImageView, "setTintColor:", v6);

  -[UIImageView setUserInteractionEnabled:](self->_subtitleImageView, "setUserInteractionEnabled:", 0);
  -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_subtitleImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  v7 = objc_alloc((Class)NUIContainerStackView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell subtitleImageView](self, "subtitleImageView"));
  v27[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v27[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v11 = (NUIContainerStackView *)objc_msgSend(v7, "initWithArrangedSubviews:", v10);
  subtitleStackView = self->_subtitleStackView;
  self->_subtitleStackView = v11;

  -[NUIContainerStackView setAlignment:](self->_subtitleStackView, "setAlignment:", 3);
  v13 = objc_alloc((Class)NUIContainerGridView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v25 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v26[0] = v15;
  v24 = self->_subtitleStackView;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v26[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v18 = (NUIContainerGridView *)objc_msgSend(v13, "initWithArrangedSubviewRows:", v17);
  gridView = self->_gridView;
  self->_gridView = v18;

  -[NUIContainerGridView setVerticalAlignment:](self->_gridView, "setVerticalAlignment:", 3);
  -[NUIContainerGridView setLayoutMarginsRelativeArrangement:](self->_gridView, "setLayoutMarginsRelativeArrangement:", 1);
  -[NUIContainerGridView setBaselineRelativeArrangement:](self->_gridView, "setBaselineRelativeArrangement:", 1);
  if (-[PHContactTableViewCell tapTargets](self, "tapTargets"))
  {
    v20 = objc_alloc_init((Class)TPAccessoryButton);
    -[PHContactTableViewCell setActionButton:](self, "setActionButton:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButton](self, "actionButton"));
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "actionButtonTapped:", 64);

  }
  return self->_gridView;
}

- (void)updateRootView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  NUIContainerGridView *gridView;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[2];

  if (self->_hasAvatarView)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerGridView arrangedSubviewInColumnAtIndex:rowAtIndex:](self->_gridView, "arrangedSubviewInColumnAtIndex:rowAtIndex:", 0, 0));
  else
    v3 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](self->_avatarViewController, "view"));
  v6 = v4;
  if (v4)
  {
    LODWORD(v5) = 1148846080;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v9);
    gridView = self->_gridView;
    if (v3)
    {
      -[NUIContainerGridView replaceArrangedSubview:inColumnAtIndex:rowAtIndex:](self->_gridView, "replaceArrangedSubview:inColumnAtIndex:rowAtIndex:", v6, 0, 0);
    }
    else
    {
      v15[0] = v6;
      v15[1] = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      v13 = -[NUIContainerGridView insertColumnAtIndex:withArrangedSubviews:](gridView, "insertColumnAtIndex:withArrangedSubviews:", 0, v12);

    }
    v11 = 1;
    -[NUIContainerGridView setAlignment:forView:inAxis:](self->_gridView, "setAlignment:forView:inAxis:", 1, v6, 0);
    -[NUIContainerGridView setAlignment:forView:inAxis:](self->_gridView, "setAlignment:forView:inAxis:", 3, v6, 1);
    goto LABEL_11;
  }
  if (v3)
  {
    -[NUIContainerGridView removeColumnAtIndex:](self->_gridView, "removeColumnAtIndex:", 0);
    v11 = 0;
LABEL_11:
    self->_hasAvatarView = v11;
  }
  objc_msgSend(v3, "removeFromSuperview");
  -[PHContactTableViewCell setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell gridView](self, "gridView"));
  objc_msgSend(v14, "setPreservesSuperviewLayoutMargins:", 1);

}

- (void)actionButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButtonTappedHandler](self, "actionButtonTappedHandler", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButtonTappedHandler](self, "actionButtonTappedHandler"));
    v5[2]();

  }
}

- (void)setActionButtonTappedHandler:(id)a3
{
  id v4;
  id actionButtonTappedHandler;

  v4 = objc_retainBlock(a3);
  actionButtonTappedHandler = self->_actionButtonTappedHandler;
  self->_actionButtonTappedHandler = v4;

}

- (void)updateFontsAndLayoutMetrics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHContactTableViewCell;
  -[PHTableViewCell updateFontsAndLayoutMetrics](&v3, "updateFontsAndLayoutMetrics");
  -[PHContactTableViewCell _updateLayout](self, "_updateLayout");
}

- (void)_updateLayout
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v3, "effectiveFirstBaselineOffsetFromTop");
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_subtitleStackView, "setCustomFirstBaselineOffsetFromTop:");

  -[PHDoubleLineTableViewCell subtitleLabelFirstBaselineLayoutConstraintConstant](self, "subtitleLabelFirstBaselineLayoutConstraintConstant");
  -[NUIContainerGridView setRowSpacing:](self->_gridView, "setRowSpacing:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell featureFlags](self, "featureFlags"));
  v5 = objc_msgSend(v4, "phoneRecentsAvatarsEnabled");

  v6 = 10.0;
  if ((v5 & 1) == 0)
    -[PHTableViewCell titleLabelLeadingLayoutConstraintConstant](self, "titleLabelLeadingLayoutConstraintConstant", 10.0);
  -[NUIContainerGridView setColumnSpacing:](self->_gridView, "setColumnSpacing:", v6);
  -[PHContactTableViewCell subtitleLabelLeadingLayoutConstraintConstant](self, "subtitleLabelLeadingLayoutConstraintConstant");
  -[NUIContainerStackView setSpacing:](self->_subtitleStackView, "setSpacing:");
  if ((uint64_t)-[NUIContainerGridView numberOfColumns](self->_gridView, "numberOfColumns") >= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](self->_avatarViewController, "view"));
    objc_msgSend(v7, "setMinimumLayoutSize:", 45.0, 45.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](self->_avatarViewController, "view"));
    objc_msgSend(v8, "setMaximumLayoutSize:", 45.0, 45.0);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v11, "isPreferredContentSizeCategoryAccessible");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerGridView columnAtIndex:](self->_gridView, "columnAtIndex:", 0));
    objc_msgSend(v10, "setHidden:", v9);

  }
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  NSDirectionalEdgeInsets result;

  v20.receiver = self;
  v20.super_class = (Class)PHContactTableViewCell;
  -[PHDoubleLineTableViewCell rootViewLayoutMargins](&v20, "rootViewLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[PHContactTableViewCell avatarLayoutGuideLeadingAnchorLayoutConstraintConstant](self, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstant");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell featureFlags](self, "featureFlags"));
  v12 = objc_msgSend(v11, "phoneRecentsAvatarsEnabled");

  if (v12)
  {
    -[PHContactTableViewCell avatarLayoutGuideLeadingAnchorLayoutConstraintConstant](self, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstant");
    v14 = v13;
    v6 = 12.0;
    v4 = 12.0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
    v16 = objc_msgSend(v15, "isPreferredContentSizeCategoryAccessible");

    if (v16)
      v14 = 0.0;
    else
      v14 = v8;
  }
  v17 = v4;
  v18 = v10;
  v19 = v6;
  result.trailing = v14;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (void)setActionType:(id)a3
{
  id v4;
  NSString *actionType;
  unsigned __int8 v6;
  NSString *v7;
  NSString *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  actionType = self->_actionType;
  v19 = v4;
  if (v4)
  {
    v6 = -[NSString isEqualToString:](actionType, "isEqualToString:", v4);
    v4 = v19;
    if ((v6 & 1) != 0)
      goto LABEL_7;
  }
  else if (!actionType)
  {
    goto LABEL_7;
  }
  v7 = (NSString *)objc_msgSend(v4, "copy");
  v8 = self->_actionType;
  self->_actionType = v7;

  v9 = objc_msgSend((id)objc_opt_class(self), "imageForActionType:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell subtitleImageView](self, "subtitleImageView"));
  objc_msgSend(v11, "setImage:", v10);

  v12 = -[PHContactTableViewCell tapTargets](self, "tapTargets");
  v4 = v19;
  if (v12)
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "actionButtonImageForActionType:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[PHContactTableViewCell setActionButtonImage:](self, "setActionButtonImage:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButton](self, "actionButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButtonImage](self, "actionButtonImage"));
    objc_msgSend(v15, "configureForImage:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButton](self, "actionButton"));
    objc_msgSend(v17, "sizeToFit");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell actionButton](self, "actionButton"));
    -[PHContactTableViewCell setAccessoryView:](self, "setAccessoryView:", v18);

    v4 = v19;
  }
LABEL_7:

}

- (void)setAvatarViewController:(id)a3
{
  CNAvatarViewController *v5;
  CNAvatarViewController *v6;

  v5 = (CNAvatarViewController *)a3;
  if (self->_avatarViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_avatarViewController, a3);
    -[PHContactTableViewCell updateRootView](self, "updateRootView");
    -[PHContactTableViewCell updateFontsAndLayoutMetrics](self, "updateFontsAndLayoutMetrics");
    v5 = v6;
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHContactTableViewCell;
  -[PHContactTableViewCell setEditing:animated:](&v7, "setEditing:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell avatarViewController](self, "avatarViewController"));
  objc_msgSend(v6, "setThreeDTouchEnabled:", !v4);

}

- (double)avatarLayoutGuideHeightAnchorLayoutConstraintConstant
{
  return 45.0;
}

- (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v5);
  v7 = v6;

  return v7;
}

- (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "avatarLayoutGuideWidthAnchorLayoutConstraintConstant:", v5);
  v7 = v6;

  return v7;
}

- (double)subtitleLabelLeadingLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v5));
    objc_msgSend(v6, "scaledValueForValue:", 4.0);
    v8 = v7;

  }
  else
  {
    v8 = 4.0;
  }

  return v8;
}

- (id)actionButtonTappedHandler
{
  return self->_actionButtonTappedHandler;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (BOOL)tapTargets
{
  return self->_tapTargets;
}

- (void)setTapTargets:(BOOL)a3
{
  self->_tapTargets = a3;
}

- (UIImageView)subtitleImageView
{
  return self->_subtitleImageView;
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStackView, a3);
}

- (UILayoutGuide)avatarLayoutGuide
{
  return self->_avatarLayoutGuide;
}

- (BOOL)hasAvatarView
{
  return self->_hasAvatarView;
}

- (void)setHasAvatarView:(BOOL)a3
{
  self->_hasAvatarView = a3;
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
  objc_storeStrong((id *)&self->_gridView, a3);
}

- (TPAccessoryButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIImage)actionButtonImage
{
  return self->_actionButtonImage;
}

- (void)setActionButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonImage, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_avatarLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong(&self->_actionButtonTappedHandler, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
