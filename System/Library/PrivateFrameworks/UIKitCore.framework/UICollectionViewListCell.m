@implementation UICollectionViewListCell

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  double right;
  double left;
  double v6;
  double v7;
  objc_super v9;

  right = a3.right;
  left = a3.left;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v9, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom);
  -[UIView layoutMargins](self, "layoutMargins");
  if (left != v7 || right != v6)
    -[UICellAccessoryManager setNeedsLayout](self->_accessoryManager, "setNeedsLayout");
}

uint64_t __108__UICollectionViewListCell__createSystemTypeAccessoryViewWithCellAccessory_orConfiguration_updatedForState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSystemTypeAccessoryView:withCellAccessory:orConfiguration:usingState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)configurationState
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell configurationState](&v5, sel_configurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpanded:", (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 7) & 1);
  return v3;
}

- (double)_minimumCellAccessoryMargin
{
  return 0.0;
}

- (void)_setLayoutAttributes:(id)a3
{
  id *v4;
  uint64_t v5;
  int64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  __int16 v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  objc_super v15;

  v4 = (id *)a3;
  v5 = *(_WORD *)(&self->_listCellFlags + 1) & 7;
  v6 = -[UICollectionReusableView _styleFromLayoutAttributes:](self, "_styleFromLayoutAttributes:", v4);
  v7 = *(_WORD *)(&self->_listCellFlags + 1) & 8;
  v8 = -[UICollectionReusableView _isStyledAsHeaderOrFooterFromLayoutAttributes:](self, "_isStyledAsHeaderOrFooterFromLayoutAttributes:", v4);
  v9 = v8;
  if (v6 != v5 || v8 != v7 >> 3)
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
  if (v9)
    v10 = 8;
  else
    v10 = 0;
  v11 = v10 & 0xFFF8 | v6 & 7 | *(_WORD *)(&self->_listCellFlags + 1) & 0xFFF0;
  *((_WORD *)&self->_listCellFlags + 2) = v11;
  if (v4 && ((_WORD)v4[36] & 3) == 0)
  {
    -[UIBarButtonItemGroup _items](v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
      v13 = 16;
    else
      v13 = 0;
    *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xFFEF | v13;

  }
  else
  {
    *((_WORD *)&self->_listCellFlags + 2) = v11 & 0xFFEF;
  }
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell _setLayoutAttributes:](&v15, sel__setLayoutAttributes_, v4);
  if (v6 == v5)
  {
    v14 = v7 >> 3;
    if (v7 >> 3 == v9)
    {
      if (!-[UICollectionViewCell _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration"))
        -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
      goto LABEL_21;
    }
  }
  else
  {
    -[UICollectionViewListCell _updateDefaultIndentationWidth](self, "_updateDefaultIndentationWidth");
    -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v14 = v7 >> 3;
  }
  -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  if (v14 != v9)
  {
    -[UICollectionViewListCell _updateCellSelectionTogglesExpansionState](self, "_updateCellSelectionTogglesExpansionState");
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
LABEL_21:

}

- (NSDirectionalEdgeInsets)_separatorInsetsFromLayoutGuide
{
  UICollectionViewListCell *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MinX;
  double v22;
  double MaxX;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  NSDirectionalEdgeInsets result;

  if (!self->_separatorLayoutGuide)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2359, CFSTR("Cannot get insets with a nil _separatorLayoutGuide"));

  }
  -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
  v4 = (UICollectionViewListCell *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2361, CFSTR("The separatorLayoutGuide is expected to be added directly to the cell"));

  }
  -[UILayoutGuide layoutFrame](self->_separatorLayoutGuide, "layoutFrame");
  v6 = v5;
  v32 = v7;
  v33 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  MinX = CGRectGetMinX(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v22 = MinX - CGRectGetMinX(v35);
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.y = v32;
  v37.origin.x = v33;
  v37.size.width = v10;
  v37.size.height = v12;
  v24 = MaxX - CGRectGetMaxX(v37);
  v25 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v25)
    v26 = v24;
  else
    v26 = v22;
  if (v25)
    v27 = v22;
  else
    v27 = v24;
  v28 = 0.0;
  v29 = 0.0;
  result.trailing = v27;
  result.bottom = v29;
  result.leading = v26;
  result.top = v28;
  return result;
}

- (UILayoutGuide)separatorLayoutGuide
{
  UILayoutGuide *separatorLayoutGuide;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *separatorLayoutGuideHeightConstraint;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *separatorLayoutGuideLeadingConstraint;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  double v25;
  NSLayoutConstraint *separatorLayoutGuideTrailingConstraint;
  NSLayoutConstraint *v27;
  UILayoutGuide *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  separatorLayoutGuide = self->_separatorLayoutGuide;
  if (!separatorLayoutGuide)
  {
    v4 = objc_alloc_init(UILayoutGuide);
    v5 = self->_separatorLayoutGuide;
    self->_separatorLayoutGuide = v4;

    -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addLayoutGuide:", self->_separatorLayoutGuide);

    -[UILayoutGuide _setLockedToOwningView:](self->_separatorLayoutGuide, "_setLockedToOwningView:", 1);
    -[UILayoutGuide _setShouldBeArchived:](self->_separatorLayoutGuide, "_setShouldBeArchived:", 1);
    -[UILayoutGuide setIdentifier:](self->_separatorLayoutGuide, "setIdentifier:", CFSTR("UICollectionViewListCellSeparatorLayoutGuide"));
    -[UILayoutGuide heightAnchor](self->_separatorLayoutGuide, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", _ListCellSeparatorLayoutGuideHeightForCell(self));
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[NSLayoutConstraint setShouldBeArchived:](v8, "setShouldBeArchived:", 1);
    -[NSLayoutConstraint setIdentifier:](v8, "setIdentifier:", CFSTR("UICollectionViewListCell-height-separatorLayoutGuide-constraint"));
    separatorLayoutGuideHeightConstraint = self->_separatorLayoutGuideHeightConstraint;
    self->_separatorLayoutGuideHeightConstraint = v8;
    v10 = v8;

    -[UILayoutGuide bottomAnchor](self->_separatorLayoutGuide, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setShouldBeArchived:", 1);
    objc_msgSend(v14, "setIdentifier:", CFSTR("UICollectionViewListCell-bottom-separatorLayoutGuide-constraint"));
    -[UILayoutGuide leadingAnchor](self->_separatorLayoutGuide, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v15, v17, CFSTR("UICollectionViewListCell-leading-separatorLayoutGuide-constraint"));
    v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    separatorLayoutGuideLeadingConstraint = self->_separatorLayoutGuideLeadingConstraint;
    self->_separatorLayoutGuideLeadingConstraint = v18;
    v20 = v18;

    -[UILayoutGuide trailingAnchor](self->_separatorLayoutGuide, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[NSLayoutConstraint setShouldBeArchived:](v24, "setShouldBeArchived:", 1);
    LODWORD(v25) = 1132068864;
    -[NSLayoutConstraint setPriority:](v24, "setPriority:", v25);
    -[NSLayoutConstraint setIdentifier:](v24, "setIdentifier:", CFSTR("UICollectionViewListCell-trailing-separatorLayoutGuide-constraint"));
    separatorLayoutGuideTrailingConstraint = self->_separatorLayoutGuideTrailingConstraint;
    self->_separatorLayoutGuideTrailingConstraint = v24;
    v27 = v24;

    v28 = self->_separatorLayoutGuide;
    v33[0] = v10;
    v33[1] = v20;
    v33[2] = v14;
    v33[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v28, "_setSystemConstraints:", v29);

    v30 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](self->_separatorLayoutGuide, "_systemConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v31);

    -[UICollectionViewListCell _updateSeparatorLayoutGuideForSectionSeparatorInsets:](self, "_updateSeparatorLayoutGuideForSectionSeparatorInsets:", self->_sectionSeparatorInsets.top, self->_sectionSeparatorInsets.leading, self->_sectionSeparatorInsets.bottom, self->_sectionSeparatorInsets.trailing);
    -[UICollectionViewListCell _updateContentViewConstraintsIfNeeded](self, "_updateContentViewConstraintsIfNeeded");

    separatorLayoutGuide = self->_separatorLayoutGuide;
  }
  return separatorLayoutGuide;
}

- (UICollectionViewListCell)initWithFrame:(CGRect)a3
{
  UICollectionViewListCell *v3;
  UICollectionViewListCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewListCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    UICollectionViewListCellCommonInit(v3);
  return v4;
}

- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSArray *contentViewConstraints;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  if (self->_contentViewConstraints)
  {
    -[UICollectionViewCell contentView](self, "contentView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_contentViewConstraints);
      contentViewConstraints = self->_contentViewConstraints;
      self->_contentViewConstraints = 0;

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell _setContentView:addToHierarchy:](&v9, sel__setContentView_addToHierarchy_, v6, v4);
  if (v6)
    -[UICollectionViewListCell _updateContentViewConstraintsIfNeeded](self, "_updateContentViewConstraintsIfNeeded");

}

- (void)layoutSubviews
{
  objc_super v3;

  -[UICollectionViewListCell _layoutAccessoriesAndContentView](self, "_layoutAccessoriesAndContentView");
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
}

- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4
{
  _BOOL8 v4;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  NSDirectionalEdgeInsets *p_sectionSeparatorInsets;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  char v18;
  _QWORD *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[5];

  v4 = a4;
  v6 = (id *)a3;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__UICollectionViewListCell__preferredLayoutAttributesFittingAttributes_isAnimatingExistingView___block_invoke;
  v23[3] = &unk_1E16B1B28;
  v23[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
  -[UICollectionViewLayoutAttributes _existingListAttributes](v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 32);
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
  {
    p_sectionSeparatorInsets = &self->_sectionSeparatorInsets;
    goto LABEL_8;
  }
  v11 = v10[1];
  p_sectionSeparatorInsets = &self->_sectionSeparatorInsets;
  if (!v11)
  {
LABEL_8:
    v13 = 0;
    *(_OWORD *)&p_sectionSeparatorInsets->top = 0u;
    *(_OWORD *)&p_sectionSeparatorInsets->bottom = 0u;
    v18 = 1;
    goto LABEL_9;
  }
  v13 = v11;
  objc_msgSend(v11, "bottomSeparatorInsets");
  p_sectionSeparatorInsets->top = v14;
  self->_sectionSeparatorInsets.leading = v15;
  self->_sectionSeparatorInsets.bottom = v16;
  self->_sectionSeparatorInsets.trailing = v17;
  -[UICollectionViewListCell _updateSeparatorLayoutGuideForSectionSeparatorInsets:](self, "_updateSeparatorLayoutGuideForSectionSeparatorInsets:");
  v18 = 0;
LABEL_9:
  v22.receiver = self;
  v22.super_class = (Class)UICollectionViewListCell;
  -[UICollectionReusableView _preferredLayoutAttributesFittingAttributes:isAnimatingExistingView:](&v22, sel__preferredLayoutAttributesFittingAttributes_isAnimatingExistingView_, v6, v4);
  v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if ((v18 & 1) == 0 && (objc_msgSend(v13, "_ignoreBottomSeparatorInsetsFromCell") & 1) == 0)
  {
    objc_msgSend(v19, "bounds");
    -[UICollectionViewListCell _updateSeparatorConfigurationForPreferredAttributes:bounds:isAnimatingExistingView:](self, "_updateSeparatorConfigurationForPreferredAttributes:bounds:isAnimatingExistingView:", v13, v4);
    -[UIViewAnimationContext setViewAnimations:]((uint64_t)v10, v13);
    -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, v10);

  }
  return v19;
}

- (void)_updateContentViewConstraintsIfNeeded
{
  NSArray *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSArray *contentViewConstraints;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  NSArray *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  if (self->_separatorLayoutGuide
    && !-[UICollectionViewCell _usingContentViewConfiguration](self, "_usingContentViewConfiguration"))
  {
    -[UICollectionViewListCell _contentViewInset](self, "_contentViewInset");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    contentViewConstraints = self->_contentViewConstraints;
    if (contentViewConstraints)
    {
      if (-[NSArray count](contentViewConstraints, "count") != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 386, CFSTR("The _contentViewConstraints should hold exactly 4 constraints, in order: top, left, bottom, right"));

      }
      -[NSArray objectAtIndexedSubscript:](self->_contentViewConstraints, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setConstant:", v7);

      -[NSArray objectAtIndexedSubscript:](self->_contentViewConstraints, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", v9);

      -[NSArray objectAtIndexedSubscript:](self->_contentViewConstraints, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConstant:", v11);

      -[NSArray objectAtIndexedSubscript:](self->_contentViewConstraints, "objectAtIndexedSubscript:", 3);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setConstant:", v13);

    }
    else
    {
      -[UICollectionViewCell contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v18, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIdentifier:", CFSTR("UICollectionViewListCell-top-contentView-constraint"));
      objc_msgSend(v18, "leftAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](self, "leftAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setIdentifier:", CFSTR("UICollectionViewListCell-left-contentView-constraint"));
      -[UIView bottomAnchor](self, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setIdentifier:", CFSTR("UICollectionViewListCell-bottom-contentView-constraint"));
      -[UIView rightAnchor](self, "rightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rightAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "setIdentifier:", CFSTR("UICollectionViewListCell-right-contentView-constraint"));
      v40 = v21;
      v46[0] = v21;
      v46[1] = v24;
      v46[2] = v27;
      v46[3] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
      v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v32 = self->_contentViewConstraints;
      self->_contentViewConstraints = v31;

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v33 = self->_contentViewConstraints;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v42;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v42 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v37++), "setShouldBeArchived:", 1);
          }
          while (v35 != v37);
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v35);
      }

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_contentViewConstraints);
    }
  }
  else if (self->_contentViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    v4 = self->_contentViewConstraints;
    self->_contentViewConstraints = 0;

    -[UICollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateLeadingLayoutMarginForIndentation
{
  double extraLeadingLayoutMarginForIndentation;
  _BOOL4 v4;
  double v5;
  objc_super v6;

  extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
  v4 = -[UICollectionViewListCell _shouldIncreaseCellLeadingLayoutMarginForIndentation](self, "_shouldIncreaseCellLeadingLayoutMarginForIndentation");
  v5 = 0.0;
  if (v4)
    -[UICollectionViewListCell _leadingIndentation](self, "_leadingIndentation", 0.0);
  self->_extraLeadingLayoutMarginForIndentation = v5;
  if (v5 - extraLeadingLayoutMarginForIndentation != 0.0)
  {
    -[UIView _rawLayoutMargins](self, "_rawLayoutMargins");
    -[UICollectionViewListCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:");
    v6.receiver = self;
    v6.super_class = (Class)UICollectionViewListCell;
    -[UIView _setRawLayoutMargins:](&v6, sel__setRawLayoutMargins_);
  }
}

- (UIEdgeInsets)_contentViewInset
{
  double v3;
  double v4;
  double v5;
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
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIEdgeInsets result;

  -[UICellAccessoryManager contentInset](self->_accessoryManager, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v12 = UIEdgeInsetsMax(10, v4, v6, v8, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (-[UICollectionViewListCell _contentViewShouldBeIndented](self, "_contentViewShouldBeIndented"))
  {
    v19 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UICollectionViewListCell _leadingIndentation](self, "_leadingIndentation");
    v21 = v14 + v20;
    v22 = v18 + v20;
    if (v19)
      v18 = v22;
    else
      v14 = v21;
  }
  v23 = v12;
  v24 = v14;
  v25 = v16;
  v26 = v18;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (double)_leadingIndentation
{
  return self->_indentationWidth * (double)self->_indentationLevel;
}

- (BOOL)_shouldIncreaseCellLeadingLayoutMarginForIndentation
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[UICollectionViewListCell indentsAccessories](self, "indentsAccessories"))
    return 1;
  -[UICellAccessoryManager currentConfiguration](self->_accessoryManager, "currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count") == 0;

  return v3;
}

- (BOOL)_contentViewShouldBeIndented
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[UICollectionViewListCell indentsAccessories](self, "indentsAccessories"))
    return 1;
  -[UICellAccessoryManager currentConfiguration](self->_accessoryManager, "currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (BOOL)indentsAccessories
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 12) & 1;
}

- (void)_layoutAccessoriesAndContentView
{
  -[UICollectionViewListCell _updateLeadingLayoutMarginForIndentation](self, "_updateLeadingLayoutMarginForIndentation");
  -[UICollectionViewCell _layoutFocusedFloatingContentView](self, "_layoutFocusedFloatingContentView");
  -[UICollectionViewListCell _updateAccessoriesIfNeeded](self, "_updateAccessoriesIfNeeded");
  -[UICellAccessoryManager layoutIfNeeded](self->_accessoryManager, "layoutIfNeeded");
  -[UICollectionViewListCell _updateContentViewConstraintsIfNeeded](self, "_updateContentViewConstraintsIfNeeded");
  -[UICollectionViewCell _layoutContentView](self, "_layoutContentView");
}

- (void)_updateAccessoriesIfNeeded
{
  UICellAccessoryConfiguration *v3;
  UICellAccessoryConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x100) != 0)
  {
    *((_WORD *)&self->_listCellFlags + 2) &= ~0x100u;
    -[UICollectionViewListCell _updateCellSelectionTogglesExpansionState](self, "_updateCellSelectionTogglesExpansionState");
    v3 = objc_alloc_init(UICellAccessoryConfiguration);
    v4 = objc_alloc_init(UICellAccessoryConfiguration);
    if (-[NSArray count](self->_accessories, "count"))
    {
      -[UICollectionViewListCell _applyCellAccessoriesToNormalConfiguration:editingConfiguration:](self, "_applyCellAccessoriesToNormalConfiguration:editingConfiguration:", v3, v4);
    }
    else
    {
      -[UICollectionViewListCell _cellAccessoriesForConfigurations:isLeadingEdge:](self, "_cellAccessoriesForConfigurations:isLeadingEdge:", self->_leadingAccessoryConfigurations, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICellAccessoryConfiguration setLeadingAccessories:](v3, "setLeadingAccessories:", v5);

      -[UICollectionViewListCell _cellAccessoriesForConfigurations:isLeadingEdge:](self, "_cellAccessoriesForConfigurations:isLeadingEdge:", self->_trailingAccessoryConfigurations, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICellAccessoryConfiguration setTrailingAccessories:](v3, "setTrailingAccessories:", v6);

      -[UICollectionViewListCell _cellAccessoriesForConfigurations:isLeadingEdge:](self, "_cellAccessoriesForConfigurations:isLeadingEdge:", self->_leadingEditingAccessoryConfigurations, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICellAccessoryConfiguration setLeadingAccessories:](v4, "setLeadingAccessories:", v7);

      -[UICollectionViewListCell _cellAccessoriesForConfigurations:isLeadingEdge:](self, "_cellAccessoriesForConfigurations:isLeadingEdge:", self->_trailingEditingAccessoryConfigurations, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICellAccessoryConfiguration setTrailingAccessories:](v4, "setTrailingAccessories:", v8);

    }
    v10[0] = 0x1E170DE80;
    v10[1] = 0x1E1772080;
    v11[0] = v3;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessoryManager setConfigurations:](self->_accessoryManager, "setConfigurations:", v9);

  }
}

- (BOOL)_removesHighlightedAndSelectedStatesForBackground
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 6) & 1;
}

- (id)_cellAccessoriesForConfigurations:(id)a3 isLeadingEdge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[UICollectionViewListCell configurationState](self, "configurationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          -[UICollectionViewListCell _cellAccessoryForConfiguration:isLeadingEdge:usingState:](self, "_cellAccessoryForConfiguration:isLeadingEdge:usingState:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v4, v7, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)_updateSeparatorLayoutGuideForSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  char v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSLayoutConstraint *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *separatorLayoutGuideLeadingConstraint;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  UICollectionViewListCell *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v28;

  if (!self->_separatorLayoutGuide)
    return;
  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[UICollectionViewCell _existingContentView](self, "_existingContentView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v28, "_primaryTextLayoutRect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UICollectionViewListCell separatorLayoutGuide](self, "separatorLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSLayoutConstraint isActive](self->_separatorLayoutGuideLeadingConstraint, "isActive");
  if (v9)
  {
    if (!v11 || (*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) == 0)
    {
      v12 = self->_separatorLayoutGuideLeadingConstraint;
      -[NSLayoutConstraint setActive:](v12, "setActive:", 0);
      objc_msgSend(v10, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v13, v14, CFSTR("UICollectionViewListCell-primaryText-leading-separatorLayoutGuide-constraint"));
      v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      _ListCellReplaceSystemConstraintInLayoutGuide(v10, v12, v15);
      -[NSLayoutConstraint setActive:](v15, "setActive:", 1);
      separatorLayoutGuideLeadingConstraint = self->_separatorLayoutGuideLeadingConstraint;
      self->_separatorLayoutGuideLeadingConstraint = v15;

      *((_WORD *)&self->_listCellFlags + 2) |= 0x2000u;
LABEL_14:

    }
  }
  else if (!v11 || (*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) != 0)
  {
    v12 = self->_separatorLayoutGuideLeadingConstraint;
    -[NSLayoutConstraint setActive:](v12, "setActive:", 0);
    objc_msgSend(v10, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v17, v19, CFSTR("UICollectionViewListCell-leading-separatorLayoutGuide-constraint"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    _ListCellReplaceSystemConstraintInLayoutGuide(v10, v12, v20);
    -[NSLayoutConstraint setActive:](v20, "setActive:", 1);
    v21 = self->_separatorLayoutGuideLeadingConstraint;
    self->_separatorLayoutGuideLeadingConstraint = v20;

    *((_WORD *)&self->_listCellFlags + 2) &= ~0x2000u;
    goto LABEL_14;
  }
  -[UICollectionViewListCell _owningViewForSeparatorLayoutGuide](self, "_owningViewForSeparatorLayoutGuide");
  v22 = (UICollectionViewListCell *)objc_claimAutoreleasedReturnValue();

  if (v22 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2335, CFSTR("The separatorLayoutGuide is expected to be added directly to the cell"));

    if ((v8 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  if ((v8 & 1) != 0)
  {
LABEL_17:
    -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", top, leading, bottom, trailing);
    leading = v23;
    trailing = v24;
  }
LABEL_18:
  v25 = 0.0;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) == 0)
    v25 = leading;
  -[NSLayoutConstraint setConstant:](self->_separatorLayoutGuideLeadingConstraint, "setConstant:", v25);
  -[NSLayoutConstraint setConstant:](self->_separatorLayoutGuideTrailingConstraint, "setConstant:", -trailing);

}

- (void)_updateSeparatorConfigurationForPreferredAttributes:(id)a3 bounds:(CGRect)a4 isAnimatingExistingView:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double top;
  double leading;
  double bottom;
  double trailing;
  uint64_t v16;
  __int16 v17;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[9];
  _QWORD v38[11];
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  top = self->_sectionSeparatorInsets.top;
  leading = self->_sectionSeparatorInsets.leading;
  bottom = self->_sectionSeparatorInsets.bottom;
  trailing = self->_sectionSeparatorInsets.trailing;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke;
  v39[3] = &unk_1E16BC3A0;
  v39[4] = self;
  v39[5] = &v40;
  __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke((uint64_t)v39);
  v17 = *((_WORD *)&self->_listCellFlags + 2);
  v19 = (v17 & 0x4000) == 0 && v41[3] == 0;
  -[UIView bounds](self, "bounds");
  v35 = v21;
  v36 = v20;
  v33 = v23;
  v34 = v22;
  if (!v19)
  {
    v38[0] = v16;
    v38[1] = 3221225472;
    v38[2] = __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_2;
    v38[3] = &unk_1E16BC3C8;
    *(CGFloat *)&v38[6] = x;
    *(CGFloat *)&v38[7] = y;
    *(CGFloat *)&v38[8] = width;
    *(CGFloat *)&v38[9] = height;
    v38[4] = self;
    v38[5] = &v40;
    v38[10] = v39;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v38);
  }
  v24 = v41[3];
  switch(v24)
  {
    case 3:
      -[UICollectionViewListCell _separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:](self, "_separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:", top, leading, bottom, trailing);
      break;
    case 2:
      -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", top, leading, bottom, trailing);
      break;
    case 1:
      -[UICollectionViewListCell _separatorInsetsFromLayoutGuide](self, "_separatorInsetsFromLayoutGuide");
      break;
    default:
      goto LABEL_16;
  }
  top = v25;
  leading = v26;
  bottom = v27;
  trailing = v28;
LABEL_16:
  if ((v17 & 0x4000) != 0)
  {
    -[UICollectionViewListCell _preferredSeparatorInsetsForProposedInsets:](self, "_preferredSeparatorInsetsForProposedInsets:", top, leading, bottom, trailing);
    top = v29;
    leading = v30;
    bottom = v31;
    trailing = v32;
  }
  objc_msgSend(v11, "setBottomSeparatorInsets:", top, leading, bottom, trailing);
  if ((objc_msgSend(v11, "_ignoreTopSeparatorInsetsFromCell") & 1) == 0)
    objc_msgSend(v11, "setTopSeparatorInsets:", top, leading, bottom, trailing);
  if (!v19 && v5)
  {
    -[UIView bounds](self, "bounds");
    v45.origin.y = v35;
    v45.origin.x = v36;
    v45.size.height = v33;
    v45.size.width = v34;
    if (!CGRectEqualToRect(v44, v45))
    {
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_3;
      v37[3] = &unk_1E16B20D8;
      v37[4] = self;
      *(CGFloat *)&v37[5] = v36;
      *(CGFloat *)&v37[6] = v35;
      *(CGFloat *)&v37[7] = v34;
      *(CGFloat *)&v37[8] = v33;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37);
    }
  }
  _Block_object_dispose(&v40, 8);

}

- (void)_updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewListCell;
  v4 = a3;
  -[UICollectionViewCell _updateConfigurationUsingState:](&v6, sel__updateConfigurationUsingState_, v4);
  -[UICollectionViewListCell _updateCurrentSystemTypeAccessoryViewsUsingState:](self, "_updateCurrentSystemTypeAccessoryViewsUsingState:", v4, v6.receiver, v6.super_class);

  -[UICollectionViewCell _existingContentView](self, "_existingContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_defaultListContentConfigurationMayHaveChanged");

}

void __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[89])
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  objc_msgSend(v2, "_existingContentView");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 2;
    v4 = (void *)v6;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
    goto LABEL_8;
  }
  v5 = objc_opt_respondsToSelector();
  v4 = (void *)v6;
  if ((v5 & 1) != 0)
  {
    v3 = 3;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *leadingAccessoryConfigurations;
  void *v17;
  void *v18;
  NSArray *trailingAccessoryConfigurations;
  void *v20;
  void *v21;
  NSArray *leadingEditingAccessoryConfigurations;
  void *v23;
  void *v24;
  NSArray *trailingEditingAccessoryConfigurations;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  UICollectionViewListCell *v30;
  id v31;
  _QWORD aBlock[5];
  id v33;

  v4 = a3;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x100) == 0)
  {
    -[UICellAccessoryManager configurations](self->_accessoryManager, "configurations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_accessories, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke;
      aBlock[3] = &unk_1E16BC3F0;
      aBlock[4] = self;
      v6 = &v33;
      v33 = v4;
      v7 = (void (**)(void *, void *))_Block_copy(aBlock);
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E170DE80);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAccessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9);

      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E170DE80);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAccessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v11);

      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E1772080);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leadingAccessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13);

      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E1772080);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAccessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15);
    }
    else
    {
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke_2;
      v29 = &unk_1E16BC418;
      v30 = self;
      v6 = &v31;
      v31 = v4;
      v7 = (void (**)(void *, void *))_Block_copy(&v26);
      leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E170DE80, v26, v27, v28, v29, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAccessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, leadingAccessoryConfigurations, v18);

      trailingAccessoryConfigurations = self->_trailingAccessoryConfigurations;
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E170DE80);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trailingAccessories");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, trailingAccessoryConfigurations, v21);

      leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E1772080);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leadingAccessories");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, leadingEditingAccessoryConfigurations, v24);

      trailingEditingAccessoryConfigurations = self->_trailingEditingAccessoryConfigurations;
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E1772080);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAccessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, trailingEditingAccessoryConfigurations, v15);
    }

  }
}

void __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int has_internal_diagnostics;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(v6, "count");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    if (v10)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "_isSystemType"))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v13, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_updateSystemTypeAccessoryView:withCellAccessory:orConfiguration:usingState:", v15, 0, v12, *(_QWORD *)(a1 + 40));

        }
        ++v11;
        v16 = objc_msgSend(v5, "count");
        v17 = objc_msgSend(v6, "count");
        if (v16 >= v17)
          v18 = v17;
        else
          v18 = v16;
      }
      while (v11 < v18);
    }
  }
  else
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v20 = objc_msgSend(v5, "count");
    v21 = objc_msgSend(v6, "count");
    if (has_internal_diagnostics)
    {
      if (v20 != v21)
      {
        __UIFaultDebugAssertLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v25 = 138412546;
          v26 = v5;
          v27 = 2112;
          v28 = v6;
          _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Configurations are out of sync with accessories! Configurations: %@; Accessories: %@",
            (uint8_t *)&v25,
            0x16u);
        }

      }
    }
    else if (v20 != v21)
    {
      v23 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category;
      if (!_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = 138412546;
        v26 = v5;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Configurations are out of sync with accessories! Configurations: %@; Accessories: %@",
          (uint8_t *)&v25,
          0x16u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateAccessories");
  }

}

+ (id)_createDefaultContentViewWithFrame:(CGRect)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UICollectionViewListCell;
  objc_msgSendSuper2(&v5, sel__createDefaultContentViewWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEdgesPreservingSuperviewLayoutMargins:", 15);
  return v3;
}

- (NSDirectionalEdgeInsets)_separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  double leading;
  CGFloat top;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MaxX;
  double MinX;
  void *v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  if (v10 != 6)
  {
    if (self->_separatorLayoutGuide)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0.0, 0.0, 0.0, 0.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_separatorLayoutGuide == nil"));

    }
    -[UICollectionViewCell _existingContentView](self, "_existingContentView", v14, v13, v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "_primaryTextLayoutFrame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
    }
    else
    {
      v18 = *MEMORY[0x1E0C9D628];
      v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    v36.origin.x = v18;
    v36.origin.y = v20;
    v36.size.width = v22;
    v36.size.height = v24;
    if (!CGRectIsNull(v36))
    {
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v16, v18, v20, v22, v24);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        -[UIView bounds](self, "bounds");
        MaxX = CGRectGetMaxX(v37);
        v38.origin.x = v26;
        v38.origin.y = v28;
        v38.size.width = v30;
        v38.size.height = v32;
        leading = MaxX - CGRectGetMaxX(v38);
      }
      else
      {
        v39.origin.x = v26;
        v39.origin.y = v28;
        v39.size.width = v30;
        v39.size.height = v32;
        MinX = CGRectGetMinX(v39);
        -[UIView bounds](self, "bounds");
        leading = MinX - CGRectGetMinX(v40);
      }
    }

    v11 = trailing;
    v12 = bottom;
    v13 = leading;
    v14 = top;
  }
  result.trailing = v11;
  result.bottom = v12;
  result.leading = v13;
  result.top = v14;
  return result;
}

double __51__UICollectionViewListCell__createAccessoryManager__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_constants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interspaceBetweenInnerAccessoryIdentifier:outerAccessoryIdentifier:forCell:trailingAccessoryGroup:", v6, v5, WeakRetained, 1);
  v10 = v9;

  return v10;
}

double __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke(uint64_t a1)
{
  double result;
  _BOOL4 v3;
  uint64_t v4;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (result == -1.79769313e308)
  {
    v3 = _UITableCellSupportsHorizontalCenteringBehaviorForTraitCollection(*(void **)(a1 + 32));
    v4 = 0;
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), 0.0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[UICollectionViewListCell _updateConstants](self, "_updateConstants");
  -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
  -[UICollectionViewListCell _updateSeparatorLayoutGuideHeight](self, "_updateSeparatorLayoutGuideHeight");
  -[UIView traitCollection](self, "traitCollection");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v6 != objc_msgSend(v4, "userInterfaceIdiom")
    || (v7 = objc_msgSend(v5, "layoutDirection"), v7 != objc_msgSend(v4, "layoutDirection"))
    || v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15]))
  {
    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
  -[UICollectionViewListCell _updateCellSelectionTogglesExpansionState](self, "_updateCellSelectionTogglesExpansionState");

}

- (void)_updateSeparatorLayoutGuideHeight
{
  if (self->_separatorLayoutGuideHeightConstraint)
    -[NSLayoutConstraint setConstant:](self->_separatorLayoutGuideHeightConstraint, "setConstant:", _ListCellSeparatorLayoutGuideHeightForCell(self));
}

- (void)_updateDefaultIndentationWidth
{
  void *v3;
  double v4;
  double v5;

  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x400) == 0)
  {
    -[UICollectionViewListCell _constants](self, "_constants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultIndentationWidthForSidebarStyle:", (*(_WORD *)(&self->_listCellFlags + 1) & 7) == 3);
    v5 = v4;

    -[UICollectionViewListCell _setIndentationWidth:](self, "_setIndentationWidth:", v5);
  }
}

- (void)_setIndentationWidth:(double)a3
{
  if (self->_indentationWidth != a3)
  {
    self->_indentationWidth = a3;
    -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateConstants
{
  void *v3;
  UITableConstants *v4;
  UITableConstants *obj;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v3);
  obj = (UITableConstants *)objc_claimAutoreleasedReturnValue();

  v4 = obj;
  if (obj != self->_constants)
  {
    objc_storeStrong((id *)&self->_constants, obj);
    -[UICollectionViewListCell _constantsDidChange](self, "_constantsDidChange");
    v4 = obj;
  }

}

- (void)setAccessories:(NSArray *)accessories
{
  NSArray *v4;
  NSUInteger v5;
  BOOL v6;
  BOOL *v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  char v23;
  void *v24;
  NSDictionary *accessoriesByIdentifier;
  NSDictionary *v26;
  NSDictionary *v27;
  NSDictionary *v28;
  NSArray *v29;
  NSArray *v30;
  NSDictionary *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  NSDictionary *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;

  v4 = accessories;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if ((*((_BYTE *)&self->_listCellFlags + 5) & 1) != 0)
  {
    v7 = &v40;
    v6 = 1;
  }
  else
  {
    v5 = -[NSArray count](self->_accessories, "count");
    v6 = v5 != -[NSArray count](v4, "count");
    v7 = (BOOL *)(v38 + 3);
  }
  v40 = v6;
  if (!*v7)
  {
    v20 = self->_accessories;
    v21 = v4;
    v22 = v21;
    if (v20 == v21)
    {

      goto LABEL_31;
    }
    if (v21 && v20)
    {
      v23 = -[NSArray isEqual:](v20, "isEqual:", v21);

      if ((v23 & 1) != 0)
        goto LABEL_31;
    }
    else
    {

    }
  }
  if (*((_BYTE *)v38 + 24))
    goto LABEL_27;
  -[NSArray sortedArrayUsingSelector:](self->_accessories, "sortedArrayUsingSelector:", sel__compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortedArrayUsingSelector:](v4, "sortedArrayUsingSelector:", sel__compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v8, "count"); ++i)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
      goto LABEL_23;
    v16 = v11;
    v17 = v12;
    v18 = v17;
    if (v16 == v17)
    {

      goto LABEL_17;
    }
    if (v16 && v17)
    {
      v19 = objc_msgSend(v16, "isEqual:", v17);

      if ((v19 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    if (!objc_msgSend(v18, "_canDirectlyUpdateExistingAccessoryViewFrom:", v16))
    {
LABEL_23:
      *((_BYTE *)v38 + 24) = 1;

      break;
    }
LABEL_17:

  }
  if (!*((_BYTE *)v38 + 24))
  {
    v24 = (void *)-[NSDictionary mutableCopy](self->_accessoriesByIdentifier, "mutableCopy");
    accessoriesByIdentifier = self->_accessoriesByIdentifier;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __43__UICollectionViewListCell_setAccessories___block_invoke;
    v32[3] = &unk_1E16BC4D8;
    v33 = v8;
    v34 = v9;
    v26 = v24;
    v35 = v26;
    v36 = &v37;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](accessoriesByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v32);
    v27 = self->_accessoriesByIdentifier;
    self->_accessoriesByIdentifier = v26;
    v28 = v26;

  }
LABEL_27:
  v29 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
  v30 = self->_accessories;
  self->_accessories = v29;

  if (*((_BYTE *)v38 + 24))
  {
    v31 = self->_accessoriesByIdentifier;
    self->_accessoriesByIdentifier = 0;

    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
  else
  {
    -[UICollectionViewListCell _systemAccessoriesChanged](self, "_systemAccessoriesChanged");
  }
LABEL_31:
  _Block_object_dispose(&v37, 8);

}

- (void)_setNeedsUpdateAccessories
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x100u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (int64_t)_defaultFocusStyle
{
  return -[_UICollectionViewListCellVisualProvider defaultFocusStyle](self->_visualProvider, "defaultFocusStyle");
}

+ (id)_createVisualProviderForCell:(id)a3
{
  id v3;
  _UICollectionViewListCellVisualProvider_iOS *v4;

  v3 = a3;
  v4 = -[_UICollectionViewListCellVisualProvider initWithListCell:]([_UICollectionViewListCellVisualProvider_iOS alloc], "initWithListCell:", v3);

  return v4;
}

- (void)_constantsDidChange
{
  -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
}

- (id)_defaultBackgroundConfiguration
{
  __int16 v2;
  void *v3;

  v2 = *((_WORD *)&self->_listCellFlags + 2);
  switch(v2 & 7)
  {
    case 1:
      if ((v2 & 0x28) != 0)
        goto LABEL_3;
      +[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      if ((v2 & 0x28) != 0)
        +[UIBackgroundConfiguration _listInsetGroupedHeaderFooterConfiguration](UIBackgroundConfiguration, "_listInsetGroupedHeaderFooterConfiguration");
      else
        +[UIBackgroundConfiguration _listInsetGroupedCellConfiguration](UIBackgroundConfiguration, "_listInsetGroupedCellConfiguration");
      goto LABEL_8;
    case 3:
      if ((v2 & 0x28) != 0)
      {
        if (dyld_program_sdk_at_least() && (v2 & 0x10) != 0)
        {
LABEL_3:
          +[UIBackgroundConfiguration listGroupedHeaderFooterConfiguration](UIBackgroundConfiguration, "listGroupedHeaderFooterConfiguration");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[UIBackgroundConfiguration listSidebarHeaderConfiguration](UIBackgroundConfiguration, "listSidebarHeaderConfiguration");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (-[UICollectionViewListCell _isAccompaniedSidebar](self, "_isAccompaniedSidebar"))
          +[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration](UIBackgroundConfiguration, "listAccompaniedSidebarCellConfiguration");
        else
          +[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration");
LABEL_8:
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v3;
    case 4:
      if ((v2 & 0x28) != 0)
        goto LABEL_14;
      +[UIBackgroundConfiguration _sidebarPlainCellConfiguration]();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if ((v2 & 0x28) != 0)
      {
LABEL_14:
        +[UIBackgroundConfiguration listPlainHeaderFooterConfiguration](UIBackgroundConfiguration, "listPlainHeaderFooterConfiguration");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[UIBackgroundConfiguration listPlainCellConfiguration](UIBackgroundConfiguration, "listPlainCellConfiguration");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v3;
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell _setupChangeHandlersForNewContentView:](&v10, sel__setupChangeHandlersForNewContentView_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_lastPreferredLeadingSeparatorInsetFromContentView = 1.79769313e308;
    self->_lastPreferredTrailingSeparatorInsetFromContentView = 1.79769313e308;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "_setPreferredSeparatorInsetsDidChangeHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v5[3] = &unk_1E16BC328;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "_setDefaultListContentConfigurationProvider:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell _clearChangeHandlersForOldContentView:](&v5, sel__clearChangeHandlersForOldContentView_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_setPreferredSeparatorInsetsDidChangeHandler:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_setDefaultListContentConfigurationProvider:", 0);

}

- (void)_createAccessoryManager
{
  UICellAccessoryManager *v3;
  void *v4;
  UICellAccessoryManager *v5;
  UITableCellAccessoryLayout *v6;
  uint64_t v7;
  UITableCellAccessoryLayout *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = [UICellAccessoryManager alloc];
  -[_UICollectionViewListCellVisualProvider accessoryManagerContainerView](self->_visualProvider, "accessoryManagerContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UICellAccessoryManager initWithContainerView:](v3, "initWithContainerView:", v4);

  -[UICellAccessoryManager setCurrentConfigurationIdentifier:](v5, "setCurrentConfigurationIdentifier:", 0x1E170DE80);
  objc_initWeak(&location, self);
  v6 = objc_alloc_init(UITableCellAccessoryLayout);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__UICollectionViewListCell__createAccessoryManager__block_invoke;
  v11[3] = &unk_1E16BC300;
  objc_copyWeak(&v12, &location);
  -[UITableCellAccessoryLayout setSpacingBlock:](v6, "setSpacingBlock:", v11);
  -[UICellAccessoryManager setLeadingLayout:](v5, "setLeadingLayout:", v6);
  v8 = objc_alloc_init(UITableCellAccessoryLayout);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __51__UICollectionViewListCell__createAccessoryManager__block_invoke_2;
  v9[3] = &unk_1E16BC300;
  objc_copyWeak(&v10, &location);
  -[UITableCellAccessoryLayout setSpacingBlock:](v8, "setSpacingBlock:", v9);
  -[UICellAccessoryManager setTrailingLayout:](v5, "setTrailingLayout:", v8);
  objc_storeStrong((id *)&self->_accessoryManager, v5);
  -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_updateAccessoryLayoutMetrics
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  BOOL v22;
  _QWORD v23[4];
  id location;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewListCell _constants](self, "_constants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(_WORD *)(&self->_listCellFlags + 1) & 7u) - 3 < 2;
  objc_initWeak(&location, self);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v23[3] = 0xFFEFFFFFFFFFFFFFLL;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke;
  v18[3] = &unk_1E16BC350;
  v21 = v23;
  v7 = v3;
  v19 = v7;
  v8 = v4;
  v20 = v8;
  v22 = v5;
  -[UICellAccessoryManager setStandardLayoutWidthProvider:](self->_accessoryManager, "setStandardLayoutWidthProvider:", v18);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0xFFEFFFFFFFFFFFFFLL;
  v10 = v6;
  v11 = 3221225472;
  v12 = __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke_2;
  v13 = &unk_1E16BC378;
  v15 = v17;
  v9 = v8;
  v14 = v9;
  objc_copyWeak(&v16, &location);
  -[UICellAccessoryManager setDisclosureLayoutWidthProvider:](self->_accessoryManager, "setDisclosureLayoutWidthProvider:", &v10);
  -[UICellAccessoryManager setNeedsLayout](self->_accessoryManager, "setNeedsLayout", v10, v11, v12, v13);
  objc_destroyWeak(&v16);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&location);

}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)_defaultBackgroundView
{
  _UICollectionViewListCellBackgroundView *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = objc_alloc_init(_UICollectionViewListCellBackgroundView);
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UICollectionViewListCell _constants](self, "_constants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UICollectionViewListCell _tableStyle](self, "_tableStyle");
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", v5, v6, v7);
  }
  else
  {
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }

  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", *((_QWORD *)&v9 + 1));
  __destructor_8_s8_s16_s24_s80((id *)&v9);
  return v3;
}

- (int64_t)_tableStyle
{
  unint64_t v2;

  v2 = (*(_WORD *)(&self->_listCellFlags + 1) & 7) - 1;
  if (v2 > 2)
    return 0;
  else
    return qword_186679D88[v2];
}

- (void)_setParentFocusItem:(id)a3
{
  objc_storeWeak((id *)&self->__parentFocusItem, a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UICollectionViewListCell _setItemIdentifier:](self, "_setItemIdentifier:", 0);
  -[UICollectionViewListCell _setDefaultIndentationLevel:](self, "_setDefaultIndentationLevel:", 0);
  -[UICollectionViewListCell _setDisclosureActionHandler:](self, "_setDisclosureActionHandler:", 0);
  -[UICollectionViewListCell _setExpanded:](self, "_setExpanded:", 0);
  -[UICollectionViewListCell _resetRawLayoutMargins](self, "_resetRawLayoutMargins");
}

- (void)_setItemIdentifier:(id)a3
{
  objc_storeStrong(&self->_itemIdentifier, a3);
}

- (void)_setIndentationLevel:(int64_t)a3
{
  if (self->_indentationLevel != a3)
  {
    self->_indentationLevel = a3;
    -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  if (((((*(_WORD *)(&self->_listCellFlags + 1) & 0x80) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UICollectionViewCell _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 128;
    else
      v5 = 0;
    *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xFF7F | v5;
    -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_setDisclosureActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (void)_setDefaultIndentationLevel:(int64_t)a3
{
  self->_defaultIndentationLevel = a3;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x200) == 0)
    -[UICollectionViewListCell _setIndentationLevel:](self, "_setIndentationLevel:");
}

- (void)_resetRawLayoutMargins
{
  objc_super v2;

  self->_extraLeadingLayoutMarginForIndentation = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewListCell;
  -[UIView _setRawLayoutMargins:](&v2, sel__setRawLayoutMargins_, -1.79769313e308, -1.79769313e308, -1.79769313e308, -1.79769313e308);
}

void __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 652) & 0x100) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 664);
          objc_msgSend(v10, "identifier", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateAccessories");
            goto LABEL_14;
          }
          if (objc_msgSend(v13, "_isSystemType"))
          {
            v14 = *(void **)(a1 + 32);
            objc_msgSend(v10, "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_updateSystemTypeAccessoryView:withCellAccessory:orConfiguration:usingState:", v15, v13, 0, *(_QWORD *)(a1 + 40));

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)_updateCellSelectionTogglesExpansionState
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  v3 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if (-[UICollectionViewListCell _cellSelectionTogglesExpansionState](self, "_cellSelectionTogglesExpansionState"))
    v4 = 2048;
  else
    v4 = 0;
  v5 = *(_WORD *)(&self->_listCellFlags + 1) & 0xF7FF | v4;
  *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xF7FF | v4;
  if (((v3 >> 11) & 1) != v4 >> 11)
  {
    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
    v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  if (((v5 ^ v3) & 0x20) != 0)
    -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
}

- (BOOL)_cellSelectionTogglesExpansionState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_accessories;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isHidden", (_QWORD)v11) & 1) == 0
          && objc_msgSend(v7, "_isSystemType")
          && objc_msgSend(v7, "_systemType") == 6
          && _UICellAccessoryOutlineDisclosureBehavesAsDisplayedForCurrentState(v7, -[UICollectionViewCell isEditing](self, "isEditing")))
        {
          v8 = (objc_class *)objc_opt_class();
          _accessoryAsClass(v7, v8);
          v9 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "style");
          if (v9)
          {
            if (v9 == 1)
              goto LABEL_18;
          }
          else if ((*(_WORD *)(&self->_listCellFlags + 1) & 8) != 0)
          {
LABEL_18:

            LOBYTE(v4) = 1;
            goto LABEL_19;
          }

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_19:

  if ((__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_leadingAccessoryConfigurations) & 1) != 0
    || (__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_trailingAccessoryConfigurations) & 1) != 0
    || (__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_leadingEditingAccessoryConfigurations) & 1) != 0
    || __63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_trailingEditingAccessoryConfigurations))
  {
    *((_WORD *)&self->_listCellFlags + 2) |= 0x20u;
    LOBYTE(v4) = 1;
  }
  else
  {
    *((_WORD *)&self->_listCellFlags + 2) &= ~0x20u;
  }
  return v4;
}

uint64_t __63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  objc_class *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v5, "_isSystemType", (_QWORD)v9))
        {
          if (objc_msgSend(v5, "_systemType") == 6)
          {
            v6 = (objc_class *)objc_opt_class();
            _accessoryConfigurationAsClass(v5, v6);
            v7 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "cellSelectionTogglesExpansionState");

            if ((v7 & 1) != 0)
            {
              v2 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_13:

  return v2;
}

- (void)_applyCellAccessoriesToNormalConfiguration:(id)a3 editingConfiguration:(id)a4
{
  unsigned int v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  void (**v22)(void *, void *, id);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSDictionary *v33;
  void (**v34)(void *, id, void *);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSDictionary *accessoriesByIdentifier;
  NSDictionary *v40;
  void *v41;
  void (**v43)(void *, id);
  UICollectionViewListCell *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  NSDictionary *v54;
  _QWORD v55[5];
  _QWORD v56[6];
  _QWORD aBlock[6];
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(_WORD *)(&self->_listCellFlags + 1) & 8;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v44 = self;
  v7 = self->_accessories;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v51 = 0;
    v11 = 0;
    v49 = 0;
    v12 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v60 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "displayedState");
        v16 = objc_msgSend(v14, "_defaultPlacementForHeader:", v6 != 0);
        if ((v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
        {
          v17 = objc_msgSend(v14, "_isSystemType");
          if (v16)
          {
            if ((v17 & 1) != 0)
            {
              v18 = v50;
            }
            else if (v11)
            {
              v18 = v11;
            }
            else
            {
              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v11 = v18;
            }
          }
          else if ((v17 & 1) != 0)
          {
            v18 = v47;
          }
          else
          {
            v18 = v49;
            if (!v49)
            {
              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v49 = v18;
            }
          }
          objc_msgSend(v18, "addObject:", v14);
        }
        if (v15 <= 1)
        {
          v19 = objc_msgSend(v14, "_isSystemType");
          if (v16)
          {
            if ((v19 & 1) != 0)
            {
              v20 = v52;
            }
            else if (v10)
            {
              v20 = v10;
            }
            else
            {
              v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v10 = v20;
            }
          }
          else if ((v19 & 1) != 0)
          {
            v20 = v48;
          }
          else
          {
            v20 = v51;
            if (!v51)
            {
              v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v51 = v20;
            }
          }
          objc_msgSend(v20, "addObject:", v14);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v51 = 0;
    v11 = 0;
    v49 = 0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke;
  aBlock[3] = &unk_1E16BC440;
  v58 = v6 >> 3;
  aBlock[4] = v44;
  aBlock[5] = a2;
  v41 = _Block_copy(aBlock);
  objc_msgSend(v47, "sortUsingComparator:", v41);
  objc_msgSend(v50, "sortUsingComparator:", v41);
  objc_msgSend(v48, "sortUsingComparator:", v41);
  objc_msgSend(v52, "sortUsingComparator:", v41);
  v56[0] = v21;
  v56[1] = 3221225472;
  v56[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_2;
  v56[3] = &unk_1E16BC468;
  v56[4] = v44;
  v56[5] = a2;
  v22 = (void (**)(void *, void *, id))_Block_copy(v56);
  objc_msgSend(v49, "objectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2](v22, v23, v47);

  objc_msgSend(v11, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2](v22, v24, v50);

  objc_msgSend(v51, "objectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2](v22, v25, v48);

  objc_msgSend(v10, "reverseObjectEnumerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2](v22, v26, v52);

  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_3;
  v55[3] = &unk_1E16B2408;
  v55[4] = v44;
  v43 = (void (**)(void *, id))_Block_copy(v55);
  v43[2](v43, v50);
  v43[2](v43, v52);
  -[UICollectionViewListCell configurationState](v44, "configurationState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewListCell _internalAccessoriesForCellAccessories:usingState:](v44, "_internalAccessoriesForCellAccessories:usingState:", v47, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setLeadingAccessories:", v28);

  -[UICollectionViewListCell _internalAccessoriesForCellAccessories:usingState:](v44, "_internalAccessoriesForCellAccessories:usingState:", v50, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTrailingAccessories:", v29);

  -[UICollectionViewListCell _internalAccessoriesForCellAccessories:usingState:](v44, "_internalAccessoriesForCellAccessories:usingState:", v48, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setLeadingAccessories:", v30);

  -[UICollectionViewListCell _internalAccessoriesForCellAccessories:usingState:](v44, "_internalAccessoriesForCellAccessories:usingState:", v52, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTrailingAccessories:", v31);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v44->_accessories, "count"));
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_5;
  v53[3] = &unk_1E16BC4B0;
  v33 = v32;
  v54 = v33;
  v34 = (void (**)(void *, id, void *))_Block_copy(v53);
  objc_msgSend(v46, "leadingAccessories");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, v47, v35);

  objc_msgSend(v46, "trailingAccessories");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, v50, v36);

  objc_msgSend(v45, "leadingAccessories");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, v48, v37);

  objc_msgSend(v45, "trailingAccessories");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, v52, v38);

  accessoriesByIdentifier = v44->_accessoriesByIdentifier;
  v44->_accessoriesByIdentifier = v33;
  v40 = v33;

}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v8 = objc_msgSend(v5, "count");
  v9 = objc_msgSend(v6, "count");
  if (has_internal_diagnostics)
  {
    if (v8 != v9)
    {
      __UIFaultDebugAssertLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v24 = 138412546;
        v25 = v5;
        v26 = 2112;
        v27 = v6;
        _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Cell and internal accessory counts do not match! Cell accessories: %@; Internal accessories: %@",
          (uint8_t *)&v24,
          0x16u);
      }

    }
  }
  else if (v8 != v9)
  {
    v22 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke_2___s_category;
    if (!_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke_2___s_category)
    {
      v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke_2___s_category);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412546;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Cell and internal accessory counts do not match! Cell accessories: %@; Internal accessories: %@",
        (uint8_t *)&v24,
        0x16u);
    }
  }
  v10 = objc_msgSend(v5, "count");
  v11 = objc_msgSend(v6, "count");
  if (v10 >= v11)
    v12 = v11;
  else
    v12 = v10;
  if (v12)
  {
    v13 = 0;
    do
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, v17);

      ++v13;
      v18 = objc_msgSend(v5, "count");
      v19 = objc_msgSend(v6, "count");
      if (v18 >= v19)
        v20 = v19;
      else
        v20 = v18;
    }
    while (v13 < v20);
  }

}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  unint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "position");
        v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v13 = ((uint64_t (**)(_QWORD, id))v12)[2](v12, v6);

        if (v13 > objc_msgSend(v6, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UICollectionViewListCell.m"), 1192, CFSTR("Position returned an invalid index (%llu) to insert accessory: %@ into accessories array: %@"), v13, v11, v6);

        }
        objc_msgSend(v6, "insertObject:atIndex:", v11, v13);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (id)_internalAccessoriesForCellAccessories:(id)a3 usingState:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v12, "_isSystemType"))
          {
            objc_msgSend(v12, "_systemType");
            -[UICollectionViewListCell _createSystemTypeAccessoryViewWithCellAccessory:orConfiguration:updatedForState:](self, "_createSystemTypeAccessoryViewWithCellAccessory:orConfiguration:updatedForState:", v12, 0, v28);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 1;
          }
          else
          {
            v15 = (objc_class *)objc_opt_class();
            _accessoryAsClass(v12, v15);
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "customView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "tintColor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v12, "tintColor");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setTintColor:", v17);

            }
            if (objc_msgSend(v12, "maintainsFixedSize"))
              v14 = 12;
            else
              v14 = 14;

          }
          objc_msgSend(v13, "setHidden:", objc_msgSend(v12, "isHidden"));
          objc_msgSend(v12, "reservedLayoutWidth");
          v18 = -1.79769313e308;
          if (v19 != -1.79769313e308)
          {
            objc_msgSend(v12, "reservedLayoutWidth");
            v18 = -1000.0;
            if (v20 != -1000.0)
            {
              objc_msgSend(v12, "reservedLayoutWidth");
              if (v21 == 0.0)
              {
                v18 = 1.79769313e308;
              }
              else
              {
                objc_msgSend(v12, "reservedLayoutWidth");
                v18 = v22;
              }
            }
          }
          objc_msgSend(v12, "_identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UICellViewAccessory accessoryWithIdentifier:view:options:reservedLayoutWidth:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", v23, v13, v14, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v24);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }

    v5 = v26;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  objc_class *v42;
  objc_class *v43;
  id v44;
  void *v45;
  objc_class *v46;
  objc_class *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  _BOOL4 v53;
  objc_class *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  objc_class *v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  void *v67;
  objc_class *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  objc_class *v75;
  void *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  SEL v99;
  void *v100;
  id v101;
  id v102;

  v102 = a3;
  v11 = a4;
  v12 = a5;
  v101 = a6;
  if ((objc_msgSend(v11, "_isSystemType") & 1) == 0 && (objc_msgSend(v12, "_isSystemType") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 1443, CFSTR("%@ can only be called for system type accessories"), v96);

  }
  v99 = a2;
  if (v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = objc_msgSend(v13, "_systemType");
  v15 = *((_WORD *)&self->_listCellFlags + 2);
  -[UIView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_splitViewControllerContext");

  v18 = *(_WORD *)(&self->_listCellFlags + 1) & 7;
  if (v18 == 4)
  {
    v19 = 3;
  }
  else if (v18 == 3)
  {
    if (v17 == 2)
      v19 = 2;
    else
      v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  if (v11)
    v20 = v11;
  else
    v20 = v12;
  objc_msgSend(v20, "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15 & 0x28;
  if (v21)
  {
    if (v11)
    {
LABEL_19:
      v23 = v11;
      goto LABEL_22;
    }
  }
  else
  {
    -[UICollectionViewListCell _constants](self, "_constants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColor](self, "tintColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultAccessoryTintColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:inheritedTintColor:", v14, v22 != 0, v19, v101, v26, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v25;
    if (v11)
      goto LABEL_19;
  }
  v23 = v12;
LABEL_22:
  objc_msgSend(v23, "_backgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    v29 = v22 != 0;
    -[UICollectionViewListCell _constants](self, "_constants");
    v30 = v12;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "defaultAccessoryBackgroundColorForAccessorySystemType:header:sidebarStyle:cellConfigurationState:traitCollection:", v14, v29, v19, v101, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v30;
  }
  switch(v14)
  {
    case 0:
      -[UICollectionViewListCell _constants](self, "_constants");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "defaultDisclosureImageForCell:withAccessoryBaseColor:", self, v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v35);
      objc_claimAutoreleasedReturnValue();
      -[UICollectionViewListCell _constants](self, "_constants");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstants:", v36);

      objc_msgSend(v102, "setImage:", v34);
      break;
    case 1:
      -[UICollectionViewListCell _constants](self, "_constants");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "defaultCheckmarkImageForCell:", self);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v39, "imageWithTintColor:renderingMode:", v21, 1);
        v40 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v40;
      }
      v41 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v41);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setImage:", v39);

      break;
    case 2:
      v42 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v42);
      objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v43);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v43);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v12;
      }

      if (v44)
        objc_msgSend(v102, "removeTarget:action:forControlEvents:", self, sel__deleteAccessoryTriggered, 0x2000);
      else
        objc_msgSend(v102, "addTarget:action:forControlEvents:", self, sel__deleteAccessoryTriggered, 0x2000);
      objc_msgSend(v102, "setActionHandler:", v44);
      goto LABEL_68;
    case 3:
      v46 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v46);
      objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v47);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v48 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v47);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v48 = v12;
      }

      objc_msgSend(v102, "setActionHandler:", v44);
      objc_msgSend(v102, "setUserInteractionEnabled:", v44 != 0);
LABEL_68:
      -[UICollectionViewListCell _constants](self, "_constants");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstants:", v87);

      v59 = v102;
      v60 = v21;
      goto LABEL_69;
    case 4:
      v49 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v49);
      objc_claimAutoreleasedReturnValue();
      -[UICollectionViewListCell _constants](self, "_constants");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstants:", v50);

      objc_msgSend(v102, "setAccessoryTintColor:", v21);
      goto LABEL_71;
    case 5:
      v51 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v51);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSelected:", -[UICollectionViewCell isSelected](self, "isSelected"));
      -[UICollectionViewListCell _constants](self, "_constants");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstants:", v52);

      v44 = v21;
      v53 = -[UICollectionViewCell isSelected](self, "isSelected");
      if (v12 && v53)
      {
        v54 = (objc_class *)objc_opt_class();
        _accessoryConfigurationAsClass(v12, v54);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "selectedTintColor");
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v55;
        if (v55)
          v57 = (void *)v55;
        else
          v57 = v44;
        v58 = v57;

        v44 = v58;
      }
      v59 = v102;
      v60 = v44;
LABEL_69:
      objc_msgSend(v59, "setAccessoryTintColor:", v60);
      objc_msgSend(v102, "setAccessoryBackgroundColor:", v28);
      goto LABEL_70;
    case 6:
      v61 = v102;
      v62 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v62);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_customImage");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rotationAngle");
        v65 = v64;
        objc_msgSend(v11, "actionHandler");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        v67 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v62);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_customImage");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "selectedTintColor");
        v66 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rotationAngle");
        v65 = v81;
        v97 = 0;
        v67 = v12;
      }

      -[UICollectionViewListCell _constants](self, "_constants");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v63)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v82, "defaultOutlineDisclosureImageForView:", self);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v63 = 0;
        }
      }
      v100 = v82;
      v88 = v21;
      v98 = v12;
      if (-[UICollectionViewCell isSelected](self, "isSelected"))
      {
        v89 = (void *)v66;
        if (v66)
          v90 = (void *)v66;
        else
          v90 = v88;
        v91 = v90;

        v88 = v91;
      }
      else
      {
        v89 = (void *)v66;
      }
      objc_msgSend(v61, "setAccessoryTintColor:", v88);
      -[UICollectionViewListCell _constants](self, "_constants");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setConstants:", v92);

      objc_msgSend(v61, "setImage:", v63);
      objc_msgSend(v61, "setRotationAngle:", v65);
      objc_msgSend(v61, "setRotated:", objc_msgSend(v101, "isExpanded"));
      objc_msgSend(v61, "control");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v93;
      if (v97)
        objc_msgSend(v93, "removeTarget:action:forControlEvents:", self, sel__toggleExpansionState, 0x2000);
      else
        objc_msgSend(v93, "addTarget:action:forControlEvents:", self, sel__toggleExpansionState, 0x2000);

      objc_msgSend(v61, "setActionHandler:", v97);
      v12 = v98;
      break;
    case 7:
      v68 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v68);
      objc_claimAutoreleasedReturnValue();
      v69 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v69);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "text");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "font");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v11, "adjustsFontForContentSizeCategory");
        v73 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v69);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "text");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "font");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v12, "adjustsFontForContentSizeCategory");
        v73 = v12;
      }

      objc_msgSend(v102, "setFont:", v71);
      objc_msgSend(v102, "setAdjustsFontForContentSizeCategory:", v72);
      objc_msgSend(v102, "setText:", v70);
      objc_msgSend(v102, "setTextColor:", v21);

      goto LABEL_71;
    case 8:
      objc_msgSend(v102, "setBackgroundColor:", v21);
      break;
    case 9:
      v74 = v102;
      v75 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v11, v75);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setActionHandler:", v76);
      objc_msgSend(v74, "setUserInteractionEnabled:", v76 != 0);
      -[UICollectionViewListCell _constants](self, "_constants");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setConstants:", v77);

      objc_msgSend(v74, "setAccessoryTintColor:", v21);
      objc_msgSend(v74, "setAccessoryBackgroundColor:", v28);

      break;
    case 10:
      v78 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v78);
      objc_claimAutoreleasedReturnValue();
      -[UICollectionViewListCell _constants](self, "_constants");
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstants:", v44);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIView traitCollection](self, "traitCollection");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "defaultPopUpMenuIndicatorImageForTraitCollection:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v80 = 0;
      }
      objc_msgSend(v102, "setImage:", v80);
      if (v21)
      {
        objc_msgSend(v102, "setAccessoryTintColor:", v21);
      }
      else
      {
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setAccessoryTintColor:", v83);

      }
      v84 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v11, v84);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "selectedElementDidChangeHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSelectedElementDidChangeHandler:", v85);

      objc_msgSend(v11, "_internalMenu");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setMenu:", v86);

LABEL_70:
LABEL_71:

      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v99, self, CFSTR("UICollectionViewListCell.m"), 1618, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), v14);

      break;
  }

}

- (UITableConstants)_constants
{
  return self->_constants;
}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  UICellAccessorySeparator *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_109);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = objc_alloc_init(UICellAccessorySeparator);
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 6)
    {
      -[UICellAccessory setHidden:](v5, "setHidden:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_constants");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultVerticalAccessorySeparatorReplacementPaddingWidth");
      v10 = v9;

      -[UICellAccessory setReservedLayoutWidth:](v5, "setReservedLayoutWidth:", v10);
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessory setTintColor:](v5, "setTintColor:", v12);

    objc_msgSend(v13, "insertObject:atIndex:", v5, v4);
  }

}

- (id)_createSystemTypeAccessoryViewWithCellAccessory:(id)a3 orConfiguration:(id)a4 updatedForState:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UICollectionViewListAccessoryDisclosure *v16;
  void *v17;
  uint64_t v18;
  __objc2_class *v19;
  _UICollectionViewListAccessoryControl *v20;
  void *v21;
  _UICollectionViewListAccessoryControl *v22;
  uint64_t v23;
  _UICollectionViewListAccessoryControl *v24;
  _UICollectionViewListCellReorderControl *v25;
  uint64_t v26;
  _UICollectionViewListAccessoryControl *v27;
  _UICollectionViewListAccessoryDisclosure *v28;
  _UICollectionViewListAccessoryDisclosure *v29;
  _UICollectionViewListAccessoryControl *v30;
  _UICollectionViewListAccessoryDisclosure *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _UICollectionViewListAccessoryDisclosure *v36;
  _UICollectionViewListAccessoryDisclosure *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _UICollectionViewListAccessoryDisclosure *v42;
  id v43;
  id v44;
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "_isSystemType") & 1) == 0 && (objc_msgSend(v10, "_isSystemType") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 1351, CFSTR("%@ can only be called for system type accessories"), v14);

    if (v9)
      goto LABEL_4;
LABEL_6:
    v12 = v10;
    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_6;
LABEL_4:
  v12 = v9;
LABEL_7:
  v15 = objc_msgSend(v12, "_systemType");
  switch(v15)
  {
    case 0:
      v16 = [_UICollectionViewListAccessoryDisclosure alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_UICollectionViewListAccessoryDisclosure initWithConstants:handlesOwnAction:](v16, "initWithConstants:handlesOwnAction:", v17, 0);
      goto LABEL_14;
    case 1:
      v19 = _UICollectionViewListAccessoryCheckmark;
      goto LABEL_19;
    case 2:
      v20 = [_UICollectionViewListAccessoryControl alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      v23 = 0;
      goto LABEL_22;
    case 3:
      v24 = [_UICollectionViewListAccessoryControl alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v24;
      v23 = 1;
      goto LABEL_22;
    case 4:
      v25 = [_UICollectionViewListCellReorderControl alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[_UICollectionViewListCellReorderControl initWithDelegate:constants:](v25, "initWithDelegate:constants:", self, v21);
      goto LABEL_23;
    case 5:
      v27 = [_UICollectionViewListAccessoryControl alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_UICollectionViewListAccessoryControl initWithType:constants:](v27, "initWithType:constants:", 2, v17);
LABEL_14:
      v28 = (_UICollectionViewListAccessoryDisclosure *)v18;

      -[UIView setUserInteractionEnabled:](v28, "setUserInteractionEnabled:", 0);
      if (!v28)
        goto LABEL_26;
      goto LABEL_24;
    case 6:
      v29 = [_UICollectionViewListAccessoryDisclosure alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[_UICollectionViewListAccessoryDisclosure initWithConstants:handlesOwnAction:](v29, "initWithConstants:handlesOwnAction:", v21, (*(_WORD *)(&self->_listCellFlags + 1) & 0x800) == 0);
      goto LABEL_23;
    case 7:
      v19 = UILabel;
      goto LABEL_19;
    case 8:
      v19 = _UICollectionViewListAccessoryVerticalSeparator;
LABEL_19:
      v28 = (_UICollectionViewListAccessoryDisclosure *)objc_alloc_init(v19);
      if (!v28)
        goto LABEL_26;
      goto LABEL_24;
    case 9:
      v30 = [_UICollectionViewListAccessoryControl alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v30;
      v23 = 3;
LABEL_22:
      v26 = -[_UICollectionViewListAccessoryControl initWithType:constants:](v22, "initWithType:constants:", v23, v21);
LABEL_23:
      v28 = (_UICollectionViewListAccessoryDisclosure *)v26;

      if (v28)
        goto LABEL_24;
      goto LABEL_26;
    case 10:
      v38 = [_UICollectionViewListAccessoryDisclosure alloc];
      -[UICollectionViewListCell _constants](self, "_constants");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[_UICollectionViewListAccessoryDisclosure initWithConstants:handlesOwnAction:](v38, "initWithConstants:handlesOwnAction:", v39, 0);

      -[UIView setUserInteractionEnabled:](v28, "setUserInteractionEnabled:", 0);
      -[UIControl setShowsMenuAsPrimaryAction:](v28, "setShowsMenuAsPrimaryAction:", 1);
      if (!v28)
        goto LABEL_26;
      goto LABEL_24;
    default:
LABEL_26:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 1426, CFSTR("Unable to create cell accessory for _UICellAccessorySystemType: %ld"), v15);

      v28 = 0;
LABEL_24:
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __108__UICollectionViewListCell__createSystemTypeAccessoryViewWithCellAccessory_orConfiguration_updatedForState___block_invoke;
      v41[3] = &unk_1E16B6F18;
      v41[4] = self;
      v31 = v28;
      v42 = v31;
      v43 = v9;
      v44 = v10;
      v45 = v11;
      v32 = v11;
      v33 = v10;
      v34 = v9;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v41);
      v35 = v45;
      v36 = v31;

      return v36;
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UICollectionViewCell isSelected](self, "isSelected");
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell setSelected:](&v5, sel_setSelected_, v3);
}

- (BOOL)_canFocusProgrammatically
{
  return -[_UICollectionViewListCellVisualProvider canFocusProgrammatically](self->_visualProvider, "canFocusProgrammatically");
}

- (void)_setRawLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  if (self->_extraLeadingLayoutMarginForIndentation > 0.0)
    -[UICollectionViewListCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:", a3.top, a3.left, a3.bottom, a3.right);
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCell;
  -[UIView _setRawLayoutMargins:](&v4, sel__setRawLayoutMargins_);
}

- (NSArray)accessories
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_accessories, 1);
}

- (void)setLeadingEditingAccessoryConfigurations:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *leadingEditingAccessoryConfigurations;
  NSArray *v10;

  v4 = a3;
  v5 = self->_leadingEditingAccessoryConfigurations;
  v6 = (NSArray *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
    leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
    self->_leadingEditingAccessoryConfigurations = v8;

    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
LABEL_9:

}

- (void)setTrailingEditingAccessoryConfigurations:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *trailingEditingAccessoryConfigurations;
  NSArray *v10;

  v4 = a3;
  v5 = self->_trailingEditingAccessoryConfigurations;
  v6 = (NSArray *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
    trailingEditingAccessoryConfigurations = self->_trailingEditingAccessoryConfigurations;
    self->_trailingEditingAccessoryConfigurations = v8;

    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
LABEL_9:

}

uint64_t __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  objc_class *v6;

  v4 = a2;
  v5 = v4;
  if (a3)
  {
    if (objc_msgSend(v4, "_isSystemType") && objc_msgSend(v5, "_systemType") == 4)
    {
      v6 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v5, v6);
      a3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "showsVerticalSeparator");

    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t *v6;
  void *v7;
  int v8;
  objc_super v9;

  v3 = a3;
  v5 = -[UICollectionViewCell isEditing](self, "isEditing");
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell setEditing:](&v9, sel_setEditing_, v3);
  if (v5 != -[UICollectionViewCell isEditing](self, "isEditing"))
  {
    v6 = &_UITableCellAccessoryConfigurationIdentifierEditing;
    if (!v3)
      v6 = &_UITableCellAccessoryConfigurationIdentifierNormal;
    -[UICellAccessoryManager setCurrentConfigurationIdentifier:](self->_accessoryManager, "setCurrentConfigurationIdentifier:", *v6);
    -[UICollectionViewListCell _updateCellSelectionTogglesExpansionState](self, "_updateCellSelectionTogglesExpansionState");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UICollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "translatesAutoresizingMaskIntoConstraints");

      if (v8)
        -[UICollectionViewListCell _layoutAccessoriesAndContentView](self, "_layoutAccessoriesAndContentView");
      else
        -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (BOOL)canBeEdited
{
  return 1;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  __int16 v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *((_WORD *)&self->_listCellFlags + 2);
  v4 = v3 & 7;
  if ((v4 - 1) < 2)
  {
    if ((v3 & 8) == 0)
    {
      -[UICollectionViewListCell _popUpMenuAccessory](self, "_popUpMenuAccessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_15;
      if ((*(_WORD *)(&self->_listCellFlags + 1) & 7) == 2)
      {
        +[UIListContentConfiguration _defaultInsetGroupedCellConfiguration](UIListContentConfiguration, "_defaultInsetGroupedCellConfiguration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return (UIListContentConfiguration *)v5;
      }
      goto LABEL_28;
    }
    if ((v3 & 0x10) == 0)
    {
      +[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIListContentConfiguration *)v5;
    }
LABEL_23:
    +[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (UIListContentConfiguration *)v5;
  }
  if (v4 != 3)
  {
    if (v4 == 4)
    {
      if ((v3 & 8) == 0)
      {
        +[UIListContentConfiguration _sidebarPlainCellConfiguration]();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return (UIListContentConfiguration *)v5;
      }
      if ((v3 & 0x10) != 0)
      {
LABEL_19:
        +[UIListContentConfiguration plainFooterConfiguration](UIListContentConfiguration, "plainFooterConfiguration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return (UIListContentConfiguration *)v5;
      }
LABEL_25:
      +[UIListContentConfiguration plainHeaderConfiguration](UIListContentConfiguration, "plainHeaderConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIListContentConfiguration *)v5;
    }
    if ((v3 & 8) != 0)
    {
      if ((v3 & 0x10) != 0)
        goto LABEL_19;
      goto LABEL_25;
    }
    -[UICollectionViewListCell _popUpMenuAccessory](self, "_popUpMenuAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_15:
      +[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIListContentConfiguration *)v5;
    }
LABEL_28:
    +[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (UIListContentConfiguration *)v5;
  }
  if ((v3 & 8) != 0)
  {
    if (!dyld_program_sdk_at_least() || (v3 & 0x10) == 0)
    {
      +[UIListContentConfiguration sidebarHeaderConfiguration](UIListContentConfiguration, "sidebarHeaderConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIListContentConfiguration *)v5;
    }
    goto LABEL_23;
  }
  if (-[UICollectionViewListCell _isAccompaniedSidebar](self, "_isAccompaniedSidebar"))
    +[UIListContentConfiguration accompaniedSidebarCellConfiguration](UIListContentConfiguration, "accompaniedSidebarCellConfiguration");
  else
    +[UIListContentConfiguration sidebarCellConfiguration](UIListContentConfiguration, "sidebarCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIListContentConfiguration *)v5;
}

- (id)_popUpMenuAccessory
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  objc_class *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_accessories;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isHidden", (_QWORD)v10) & 1) == 0
          && objc_msgSend(v7, "_isSystemType")
          && objc_msgSend(v7, "_systemType") == 10)
        {
          v8 = (objc_class *)objc_opt_class();
          _accessoryAsClass(v7, v8);
          objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_13:

  return v7;
}

void __43__UICollectionViewListCell_setAccessories___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_destroyWeak((id *)&self->__parentFocusItem);
  objc_storeStrong(&self->__disclosureActionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_trailingEditingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_leadingEditingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewConstraints, 0);
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

uint64_t __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "_systemTypePlacementForHeader:", *(unsigned __int8 *)(a1 + 48));
  v8 = objc_msgSend(v6, "_systemTypePlacementForHeader:", *(unsigned __int8 *)(a1 + 48));
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      if (v7 == v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UICollectionViewListCell.m"), 1177, CFSTR("Accessories array contains more than one system accessory of the same type. Duplicate accessories: %@ %@"), v5, v6);

      }
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)_systemAccessoriesChanged
{
  void *v3;

  -[UICellAccessoryManager setNeedsLayout](self->_accessoryManager, "setNeedsLayout");
  -[UICollectionViewListCell configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewListCell _updateCurrentSystemTypeAccessoryViewsUsingState:](self, "_updateCurrentSystemTypeAccessoryViewsUsingState:", v3);

  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (UICollectionViewListCell)initWithCoder:(id)a3
{
  id v4;
  UICollectionViewListCell *v5;
  UICollectionViewListCell *v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  NSArray *contentViewConstraints;
  uint64_t v15;
  UILayoutGuide *separatorLayoutGuide;
  __int16 v17;
  uint64_t v18;
  NSLayoutConstraint *separatorLayoutGuideHeightConstraint;
  uint64_t v20;
  NSLayoutConstraint *separatorLayoutGuideLeadingConstraint;
  uint64_t v22;
  NSLayoutConstraint *separatorLayoutGuideTrailingConstraint;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UICollectionViewListCell;
  v5 = -[UICollectionViewCell initWithCoder:](&v25, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    UICollectionViewListCellCommonInit(v5);
    v7 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UIIndentationLevel"));
    if (v7)
      v8 = 512;
    else
      v8 = 0;
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xFDFF | v8;
    if (v7)
      v6->_indentationLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIIndentationLevel"));
    v9 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UIIndentationWidth"));
    if (v9)
      v10 = 1024;
    else
      v10 = 0;
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xFBFF | v10;
    if (v9)
      v6->_indentationWidth = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIIndentationWidth"));
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIndentsAccessories")))
      v11 = 4096;
    else
      v11 = 0;
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xEFFF | v11;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessories"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      -[UICollectionViewListCell setAccessories:](v6, "setAccessories:", v12);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContentViewConstraints"));
    v13 = objc_claimAutoreleasedReturnValue();
    contentViewConstraints = v6->_contentViewConstraints;
    v6->_contentViewConstraints = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISeparatorLayoutGuide"));
    v15 = objc_claimAutoreleasedReturnValue();
    separatorLayoutGuide = v6->_separatorLayoutGuide;
    v6->_separatorLayoutGuide = (UILayoutGuide *)v15;

    if (v6->_separatorLayoutGuide)
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISeparatorLayoutGuideLeadingReferencesPrimaryText")))v17 = 0x2000;
      else
        v17 = 0;
      *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xDFFF | v17;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISeparatorLayoutGuideHeightConstraint"));
      v18 = objc_claimAutoreleasedReturnValue();
      separatorLayoutGuideHeightConstraint = v6->_separatorLayoutGuideHeightConstraint;
      v6->_separatorLayoutGuideHeightConstraint = (NSLayoutConstraint *)v18;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISeparatorLayoutGuideLeadingConstraint"));
      v20 = objc_claimAutoreleasedReturnValue();
      separatorLayoutGuideLeadingConstraint = v6->_separatorLayoutGuideLeadingConstraint;
      v6->_separatorLayoutGuideLeadingConstraint = (NSLayoutConstraint *)v20;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISeparatorLayoutGuideTrailingConstraint"));
      v22 = objc_claimAutoreleasedReturnValue();
      separatorLayoutGuideTrailingConstraint = v6->_separatorLayoutGuideTrailingConstraint;
      v6->_separatorLayoutGuideTrailingConstraint = (NSLayoutConstraint *)v22;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  UILayoutGuide *separatorLayoutGuide;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewListCell;
  -[UICollectionViewCell encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if ((v5 & 0x200) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", self->_indentationLevel, CFSTR("UIIndentationLevel"));
    v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)self->_indentationWidth, CFSTR("UIIndentationWidth"));
    v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  objc_msgSend(v4, "encodeBool:forKey:", (v5 >> 12) & 1, CFSTR("UIIndentsAccessories"));
  if (-[NSArray count](self->_accessories, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_accessories, CFSTR("UIAccessories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentViewConstraints, CFSTR("UIContentViewConstraints"));
  separatorLayoutGuide = self->_separatorLayoutGuide;
  if (separatorLayoutGuide)
  {
    objc_msgSend(v4, "encodeObject:forKey:", separatorLayoutGuide, CFSTR("UISeparatorLayoutGuide"));
    objc_msgSend(v4, "encodeBool:forKey:", (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 13) & 1, CFSTR("UISeparatorLayoutGuideLeadingReferencesPrimaryText"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_separatorLayoutGuideHeightConstraint, CFSTR("UISeparatorLayoutGuideHeightConstraint"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_separatorLayoutGuideLeadingConstraint, CFSTR("UISeparatorLayoutGuideLeadingConstraint"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_separatorLayoutGuideTrailingConstraint, CFSTR("UISeparatorLayoutGuideTrailingConstraint"));
  }

}

double __51__UICollectionViewListCell__createAccessoryManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_constants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interspaceBetweenInnerAccessoryIdentifier:outerAccessoryIdentifier:forCell:trailingAccessoryGroup:", v6, v5, WeakRetained, 0);
  v10 = v9;

  return v10;
}

void __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidatePreferredSeparatorInsetsFromContentView");

}

id __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "defaultContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedConfigurationForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke_2(uint64_t a1)
{
  double result;
  void *v3;
  id WeakRetained;
  uint64_t v5;

  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result == -1.79769313e308)
  {
    v3 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v3, "defaultDisclosureLayoutWidthForView:", WeakRetained);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

    return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCell;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v4, sel__safeAreaInsetsDidChangeFromOldInsets_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  -[UICellAccessoryManager setSafeAreaInsets:](self->_accessoryManager, "setSafeAreaInsets:");
}

uint64_t __96__UICollectionViewListCell__preferredLayoutAttributesFittingAttributes_isAnimatingExistingView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutAccessoriesAndContentView");
}

uint64_t __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  return result;
}

uint64_t __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setSelectionStyle:(int64_t)a3
{
  unint64_t v3;

  v3 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if (((v3 >> 6) & 1) != a3)
  {
    *((_WORD *)&self->_listCellFlags + 2) = v3 & 0xFFBF | ((a3 & 1) << 6);
    -[UICollectionViewCell _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  }
}

- (int64_t)selectionStyle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_listCellFlags + 2) >> 6) & 1;
}

- (BOOL)_isAccompaniedSidebar
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_splitViewControllerContext") == 2;

  return v3;
}

- (id)_defaultSelectedBackgroundView
{
  _UICollectionViewListCellSelectedBackgroundView *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x40) != 0)
    return 0;
  v3 = objc_alloc_init(_UICollectionViewListCellSelectedBackgroundView);
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  if (-[UICollectionViewCell isFocused](self, "isFocused"))
    v4 = 12;
  else
    v4 = 4;
  v14 = 0uLL;
  v15 = 0uLL;
  v12 = 0uLL;
  v13 = 0uLL;
  *((_QWORD *)&v10 + 1) = 0;
  v11 = 0uLL;
  -[UICollectionViewListCell _constants](self, "_constants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UICollectionViewListCell _tableStyle](self, "_tableStyle");
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", v6, v7, v8);
  }
  else
  {
    v18 = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
  }

  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", *((_QWORD *)&v10 + 1));
  __destructor_8_s8_s16_s24_s80((id *)&v10);
  return v3;
}

- (BOOL)_isFocusableWhenStyledAsHeader
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 11) & 1;
}

- (void)_configureFocusedFloatingContentView:(id)a3
{
  -[_UICollectionViewListCellVisualProvider configureFocusedFloatingContentView:](self->_visualProvider, "configureFocusedFloatingContentView:", a3);
}

- (id)_cellAccessoryForConfiguration:(id)a3 isLeadingEdge:(BOOL)a4 usingState:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "_isSystemType"))
  {
    objc_msgSend(v8, "_systemType");
    -[UICollectionViewListCell _createSystemTypeAccessoryViewWithCellAccessory:orConfiguration:updatedForState:](self, "_createSystemTypeAccessoryViewWithCellAccessory:orConfiguration:updatedForState:", 0, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    _accessoryConfigurationAsClass(v8, v12);
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v14);

    }
    if (objc_msgSend(v8, "maintainsFixedSize"))
      v11 = 12;
    else
      v11 = 14;

  }
  if (objc_msgSend(v8, "usesDefaultLayoutWidth"))
    v15 = -1.79769313e308;
  else
    v15 = 1.79769313e308;
  v16 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
    v17 = CFSTR("L");
  else
    v17 = CFSTR("T");
  objc_msgSend(v8, "_identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UICellViewAccessory accessoryWithIdentifier:view:options:reservedLayoutWidth:](_UICellViewAccessory, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", v19, v10, v11, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setLeadingAccessoryConfigurations:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *leadingAccessoryConfigurations;
  NSArray *v10;

  v4 = a3;
  v5 = self->_leadingAccessoryConfigurations;
  v6 = (NSArray *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
    leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
    self->_leadingAccessoryConfigurations = v8;

    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
LABEL_9:

}

- (NSArray)leadingAccessoryConfigurations
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_leadingAccessoryConfigurations, 1);
}

- (void)setTrailingAccessoryConfigurations:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *trailingAccessoryConfigurations;
  NSArray *v10;

  v4 = a3;
  v5 = self->_trailingAccessoryConfigurations;
  v6 = (NSArray *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v10, 1);
    trailingAccessoryConfigurations = self->_trailingAccessoryConfigurations;
    self->_trailingAccessoryConfigurations = v8;

    -[UICollectionViewListCell _setNeedsUpdateAccessories](self, "_setNeedsUpdateAccessories");
  }
LABEL_9:

}

- (NSArray)trailingAccessoryConfigurations
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_trailingAccessoryConfigurations, 1);
}

- (NSArray)leadingEditingAccessoryConfigurations
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_leadingEditingAccessoryConfigurations, 1);
}

- (NSArray)trailingEditingAccessoryConfigurations
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_trailingEditingAccessoryConfigurations, 1);
}

- (BOOL)_expanded
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 7) & 1;
}

- (BOOL)_hasCustomSelectionAction
{
  void *v3;
  objc_super v5;

  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x800) != 0)
    return 1;
  -[UICollectionViewListCell _popUpMenuAccessoryForCustomSelectionAction](self, "_popUpMenuAccessoryForCustomSelectionAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  return -[UICollectionViewCell _hasCustomSelectionAction](&v5, sel__hasCustomSelectionAction);
}

- (void)_performCustomSelectionAction
{
  void *v3;
  objc_super v4;

  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x800) != 0)
  {
    -[UICollectionViewListCell _toggleExpansionState](self, "_toggleExpansionState");
  }
  else
  {
    -[UICollectionViewListCell _popUpMenuAccessoryForCustomSelectionAction](self, "_popUpMenuAccessoryForCustomSelectionAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UICollectionViewListCell _presentPopUpMenuForAccessory:](self, "_presentPopUpMenuForAccessory:", v3);
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)UICollectionViewListCell;
      -[UICollectionViewCell _performCustomSelectionAction](&v4, sel__performCustomSelectionAction);
    }

  }
}

- (id)_popUpMenuAccessoryForCustomSelectionAction
{
  void *v3;
  id v4;

  -[UICollectionViewListCell _popUpMenuAccessory](self, "_popUpMenuAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && objc_msgSend(v3, "_isDisplayedForEditingState:", -[UICollectionViewCell isEditing](self, "isEditing")))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_presentPopUpMenuForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_class *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  UICollectionViewListCell *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  UICollectionViewListCell *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = self;
  -[UICellAccessoryManager currentConfiguration](self->_accessoryManager, "currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(v13, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          _accessoryViewAsClass(v10, v17);
          objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Unable to obtain popup menu accessory view in cell: %@", buf, 0xCu);
      }

    }
  }
  else if (!v10)
  {
    v19 = _presentPopUpMenuForAccessory____s_category;
    if (!_presentPopUpMenuForAccessory____s_category)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&_presentPopUpMenuForAccessory____s_category);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Unable to obtain popup menu accessory view in cell: %@", buf, 0xCu);
    }
  }
  objc_msgSend(v10, "performPrimaryAction");

}

- (unint64_t)_validatedDisclosureActionForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  id disclosureActionHandler;
  unint64_t v9;
  UIUserInterfaceLayoutDirection v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayoutAttributes _existingListAttributes](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[UICollectionViewListCell _itemIdentifier](self, "_itemIdentifier"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (disclosureActionHandler = self->__disclosureActionHandler, v7, disclosureActionHandler)
    && (objc_msgSend(v4, "modifierFlags") & 0xFFFFFFFFFFDFFFFFLL) == 0)
  {
    v11 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (objc_msgSend(v4, "keyCode") == 80)
    {
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
        v9 = 2;
      else
        v9 = 3;
    }
    else
    {
      v12 = objc_msgSend(v4, "keyCode");
      v13 = 2;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
        v13 = 3;
      if (v12 == 79)
        v9 = v13;
      else
        v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_canPerformActionForKey:(id)a3
{
  UICollectionViewListCell *v3;
  unint64_t v4;
  void *v5;

  v3 = self;
  v4 = -[UICollectionViewListCell _validatedDisclosureActionForKey:](self, "_validatedDisclosureActionForKey:", a3);
  if (v4 == 3)
  {
    if (-[UICollectionViewListCell _expanded](v3, "_expanded"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[UICollectionViewListCell _parentFocusItem](v3, "_parentFocusItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = v5 != 0;

    }
  }
  else if (v4 == 2)
  {
    LODWORD(v3) = !-[UICollectionViewListCell _expanded](v3, "_expanded");
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)_performActionForKey:(id)a3
{
  unint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  uint64_t (**disclosureActionHandler)(id, unint64_t, void *);

  v4 = -[UICollectionViewListCell _validatedDisclosureActionForKey:](self, "_validatedDisclosureActionForKey:", a3);
  if (v4)
  {
    -[UICollectionViewListCell _parentFocusItem](self, "_parentFocusItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UICollectionViewListCell _expanded](self, "_expanded");
    if (v4 == 3 && !v6 && v5)
    {
      -[UIView _focusSystem](self, "_focusSystem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_updateFocusImmediatelyToEnvironment:", v5);
    }
    else
    {
      disclosureActionHandler = (uint64_t (**)(id, unint64_t, void *))self->__disclosureActionHandler;
      -[UICollectionViewListCell _itemIdentifier](self, "_itemIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = disclosureActionHandler[2](disclosureActionHandler, v4, v7);
    }
    LOBYTE(v4) = v8;

  }
  return v4;
}

- (void)_toggleExpansionState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_class *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  void (**disclosureActionHandler)(id, uint64_t, void *);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_accessories;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {

LABEL_18:
    -[UICollectionViewListCell _itemIdentifier](self, "_itemIdentifier", (_QWORD)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      disclosureActionHandler = (void (**)(id, uint64_t, void *))self->__disclosureActionHandler;
      if (disclosureActionHandler)
        disclosureActionHandler[2](disclosureActionHandler, 1, v13);
    }

    return;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if ((objc_msgSend(v9, "isHidden", (_QWORD)v15) & 1) == 0
        && objc_msgSend(v9, "_isSystemType")
        && objc_msgSend(v9, "_systemType") == 6
        && _UICellAccessoryOutlineDisclosureBehavesAsDisplayedForCurrentState(v9, -[UICollectionViewCell isEditing](self, "isEditing")))
      {
        v10 = (objc_class *)objc_opt_class();
        _accessoryAsClass(v9, v10);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "actionHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v9, "actionHandler");
          v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v12[2]();

          v6 = 1;
        }

      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if ((v6 & 1) == 0)
    goto LABEL_18;
}

- (void)setIndentsAccessories:(BOOL)indentsAccessories
{
  __int16 v3;
  __int16 v5;

  v3 = *((_WORD *)&self->_listCellFlags + 2);
  if (((((v3 & 0x1000) == 0) ^ indentsAccessories) & 1) == 0)
  {
    if (indentsAccessories)
      v5 = 4096;
    else
      v5 = 0;
    *((_WORD *)&self->_listCellFlags + 2) = v3 & 0xEFFF | v5;
    -[UICollectionViewListCell _updateAccessoryLayoutMetrics](self, "_updateAccessoryLayoutMetrics");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIndentationLevel:(NSInteger)indentationLevel
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x200u;
  -[UICollectionViewListCell _setIndentationLevel:](self, "_setIndentationLevel:", indentationLevel);
}

- (void)setIndentationWidth:(CGFloat)indentationWidth
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x400u;
  -[UICollectionViewListCell _setIndentationWidth:](self, "_setIndentationWidth:", indentationWidth);
}

- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    if (right == -1.79769313e308)
    {
      -[UICollectionReusableView _concreteDefaultLayoutMargins](self, "_concreteDefaultLayoutMargins", -1.79769313e308);
      right = v10 + a4;
    }
    else
    {
      right = right + a4;
    }
  }
  else if (left == -1.79769313e308)
  {
    -[UICollectionReusableView _concreteDefaultLayoutMargins](self, "_concreteDefaultLayoutMargins", -1.79769313e308);
    left = v11 + a4;
  }
  else
  {
    left = left + a4;
  }
  v12 = top;
  v13 = left;
  v14 = bottom;
  v15 = right;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)_viewForMultiSelectAccessory
{
  void *v3;
  void (**v4)(void *, void *);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  int v11;
  NSArray *leadingEditingAccessoryConfigurations;
  void *v13;
  uint64_t v14;
  NSArray *leadingAccessoryConfigurations;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[5];

  -[UICellAccessoryManager currentConfiguration](self->_accessoryManager, "currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray count](self->_accessories, "count"))
  {
    -[UICellAccessoryManager currentConfigurationIdentifier](self->_accessoryManager, "currentConfigurationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", 0x1E1772080);

    if (v11)
    {
      leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
      objc_msgSend(v3, "leadingAccessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(leadingEditingAccessoryConfigurations, v13);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_6;
      v14 = 800;
    }
    else
    {
      leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
      objc_msgSend(v3, "leadingAccessories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(leadingAccessoryConfigurations, v16);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_6;
      v14 = 784;
    }
    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v14);
    objc_msgSend(v3, "trailingAccessories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(v17, v18);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_6;
    goto LABEL_15;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke;
  aBlock[3] = &unk_1E16BC500;
  aBlock[4] = self;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v3, "leadingAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "trailingAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v6 = v8;

      goto LABEL_5;
    }

LABEL_15:
    v6 = 0;
    goto LABEL_6;
  }
LABEL_5:

LABEL_6:
  return v6;
}

id __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 664);
        objc_msgSend(v8, "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isHidden") & 1) == 0
          && objc_msgSend(v11, "_isSystemType")
          && objc_msgSend(v11, "_systemType") == 5)
        {
          objc_msgSend(v8, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

id __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v16;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count")
    && ((v6 = objc_msgSend(v3, "count"), v7 = objc_msgSend(v4, "count"), v6 >= v7) ? (v8 = v7) : (v8 = v6), v8))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "_isSystemType"))
      {
        if (objc_msgSend(v10, "_systemType") == 5)
          break;
      }

      ++v9;
      v11 = objc_msgSend(v3, "count");
      v12 = objc_msgSend(v4, "count");
      if (v11 >= v12)
        v13 = v12;
      else
        v13 = v11;
      if (v9 >= v13)
        goto LABEL_13;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_13:
    v14 = 0;
  }

  return v14;
}

- (int64_t)_cellStyle
{
  return 0;
}

- (id)_editingControlTintColorForStyle:(int64_t)a3
{
  return 0;
}

- (void)_deleteAccessoryTriggered
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v6, "collectionViewLayout");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      objc_msgSend(*(id *)(v4 + 136), "revealTrailingSwipeActionsForIndexPath:", v3);

  }
}

- (void)_reorderControl:(id)a3 didReceiveTouchesBegan:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "anyObject", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touch != nil"));

  }
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_immediatelyBeginDruidBasedReorderIfPossibleWithTouch:", v8);

}

- (BOOL)_reorderControlShouldBeginReordering:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[UICollectionReusableView _collectionView](self, "_collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_canBeginReorderingItem"))
  {
    objc_msgSend(v5, "indexPathForCell:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_reorderControlDidBeginReordering:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2146, CFSTR("List cell cannot reorder without a collection view"));

  }
  objc_msgSend(v5, "indexPathForCell:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "beginInteractiveMovementForItemAtIndexPath:", v6);
  else
    objc_msgSend(v8, "cancelReorderingGesture");

}

- (void)_reorderControl:(id)a3 didUpdateWithOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  y = a4.y;
  x = a4.x;
  v19 = a3;
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2161, CFSTR("List cell cannot reorder without a collection view"));

  }
  if ((objc_msgSend(v8, "_isReordering") & 1) != 0)
  {
    -[UIView center](self, "center");
    v10 = v9;
    v12 = v11;
    -[UIView superview](self, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v13, v10, v12);
    v15 = v14;
    v17 = v16;

    objc_msgSend(v8, "updateInteractiveMovementTargetPosition:", x + v15, y + v17);
  }
  else
  {
    objc_msgSend(v19, "cancelReorderingGesture");
  }

}

- (void)_reorderControlDidEndReordering:(id)a3 cancelled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  -[UICollectionReusableView _collectionView](self, "_collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2183, CFSTR("List cell cannot reorder without a collection view"));

    v7 = 0;
    if (v4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v7, "endInteractiveMovement");
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "cancelInteractiveMovement");
LABEL_6:

}

- (double)_contentView:(id)a3 inset:(double)a4 convertedToCellInsetOnEdge:(unint64_t)a5
{
  id v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MaxX;
  double v31;
  double MinX;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v9 = a3;
  if (a5 != 2 && a5 != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewListCell.m"), 2377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edge == NSDirectionalRectEdgeLeading || edge == NSDirectionalRectEdgeTrailing"));

  }
  if (a5 == 2)
    v11 = 0.0;
  else
    v11 = a4;
  if (a5 != 2)
    a4 = 0.0;
  v12 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(v9, "bounds");
  if (v12)
    v16 = v11;
  else
    v16 = a4;
  if (v12)
    v17 = a4;
  else
    v17 = v11;
  v18 = v16 + v13;
  v19 = v14 + 0.0;
  v20 = v15 - (v16 + v17);
  if (v12)
    v21 = 2;
  else
    v21 = 8;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v9, v18, v19, v20);
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  if (v21 == a5)
  {
    -[UIView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v26;
    v35.origin.y = v27;
    v35.size.width = v28;
    v35.size.height = v29;
    v31 = MaxX - CGRectGetMaxX(v35);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v22);
    -[UIView bounds](self, "bounds");
    v31 = MinX - CGRectGetMinX(v36);
  }

  return v31;
}

- (void)_invalidatePreferredSeparatorInsetsFromContentView
{
  double lastPreferredLeadingSeparatorInsetFromContentView;
  double lastPreferredTrailingSeparatorInsetFromContentView;
  double v5;
  double v6;
  id v8;

  lastPreferredLeadingSeparatorInsetFromContentView = self->_lastPreferredLeadingSeparatorInsetFromContentView;
  lastPreferredTrailingSeparatorInsetFromContentView = self->_lastPreferredTrailingSeparatorInsetFromContentView;
  -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", self->_sectionSeparatorInsets.top, self->_sectionSeparatorInsets.leading, self->_sectionSeparatorInsets.bottom, self->_sectionSeparatorInsets.trailing);
  if (v6 != lastPreferredLeadingSeparatorInsetFromContentView
    || v5 != lastPreferredTrailingSeparatorInsetFromContentView)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cellPreferredSeparatorInsetsChanged:", self);

  }
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsFromContentViewWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  if (v9 != 6)
  {
    -[UICollectionViewCell _existingContentView](self, "_existingContentView", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "_preferredLeadingSeparatorInset");
      v12 = leading;
      if (v15 != 1.79769313e308)
      {
        -[UICollectionViewListCell _contentView:inset:convertedToCellInsetOnEdge:](self, "_contentView:inset:convertedToCellInsetOnEdge:", v14, 2);
        v12 = v16;
      }
    }
    else
    {
      v12 = leading;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "_preferredTrailingSeparatorInset");
      if (v17 != 1.79769313e308)
      {
        -[UICollectionViewListCell _contentView:inset:convertedToCellInsetOnEdge:](self, "_contentView:inset:convertedToCellInsetOnEdge:", v14, 8);
        trailing = v18;
      }
    }
    self->_lastPreferredLeadingSeparatorInsetFromContentView = v12;
    self->_lastPreferredTrailingSeparatorInsetFromContentView = trailing;

    v10 = trailing;
    v11 = bottom;
    v13 = top;
  }
  v19 = v12;
  result.trailing = v10;
  result.bottom = v11;
  result.leading = v19;
  result.top = v13;
  return result;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

- (CGFloat)indentationWidth
{
  return self->_indentationWidth;
}

- (id)_disclosureActionHandler
{
  return self->__disclosureActionHandler;
}

- (UIFocusItem)_parentFocusItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->__parentFocusItem);
}

- (UICellAccessoryManager)_accessoryManager
{
  return self->_accessoryManager;
}

- (int64_t)_defaultIndentationLevel
{
  return self->_defaultIndentationLevel;
}

- (id)_itemIdentifier
{
  return self->_itemIdentifier;
}

@end
