@implementation _UINavigationBarContentView

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarContentView;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[_UINavigationBarContentView _updateLayoutMarginsForLayout:](self, "_updateLayoutMarginsForLayout:", self->_layout);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarContentView;
  -[UIView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_presentationSemanticContext");
  if (v6 != objc_msgSend(v4, "_presentationSemanticContext"))
    -[_UINavigationBarContentViewLayout setRequestedContentSize:](self->_layout, "setRequestedContentSize:", -[_UINavigationBarContentView _currentContentSize](self, "_currentContentSize"));
  v7 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v7 != objc_msgSend(v4, "userInterfaceIdiom"))
    -[_UINavigationBarContentViewLayout updateOverflowItemImage](self->_layout, "updateOverflowItemImage");
  v8 = objc_msgSend(v5, "horizontalSizeClass");
  if (v8 != objc_msgSend(v4, "horizontalSizeClass"))
    -[_UINavigationBarContentViewLayout updateRenameForHorizontalSizeClassChangeIfNecessary](self->_layout, "updateRenameForHorizontalSizeClassChangeIfNecessary");

}

- (UILayoutGuide)navItemContentLayoutGuide
{
  UILayoutGuide *navItemContentLayoutGuide;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  navItemContentLayoutGuide = self->_navItemContentLayoutGuide;
  if (!navItemContentLayoutGuide)
  {
    v4 = objc_alloc_init(UILayoutGuide);
    v5 = self->_navItemContentLayoutGuide;
    self->_navItemContentLayoutGuide = v4;

    -[UILayoutGuide setIdentifier:](self->_navItemContentLayoutGuide, "setIdentifier:", CFSTR("UINavigationBarItemContentLayoutGuide"));
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_navItemContentLayoutGuide);
    -[UILayoutGuide topAnchor](self->_navItemContentLayoutGuide, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[UILayoutGuide bottomAnchor](self->_navItemContentLayoutGuide, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[_UINavigationBarContentView _updateNavItemContentLayoutGuideEdgeConstraints](self, "_updateNavItemContentLayoutGuideEdgeConstraints");
    navItemContentLayoutGuide = self->_navItemContentLayoutGuide;
  }
  return navItemContentLayoutGuide;
}

- (void)_updateNavItemContentLayoutGuideEdgeConstraints
{
  void *v3;
  void *v4;
  __int16 navigationBarContentViewFlags;
  UIBarButtonItem *staticNavBarButtonItem;
  _BOOL4 v7;
  NSLayoutConstraint *navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
  uint64_t v9;
  NSLayoutConstraint *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSArray *v22;
  NSArray *navItemContentLayoutGuideHorizEdgeConstraints;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *v26;
  void *v27;
  id v28;
  _UINavigationBarContentView *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  _QWORD v37[5];
  BOOL v38;
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (self->_navItemContentLayoutGuide)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "_navItemContentLayoutGuideLeadingConstraint not updated because of missing layout guide", buf, 2u);
    }

  }
  else
  {
    v34 = _updateNavItemContentLayoutGuideEdgeConstraints___s_category;
    if (!_updateNavItemContentLayoutGuideEdgeConstraints___s_category)
    {
      v34 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v34, (unint64_t *)&_updateNavItemContentLayoutGuideEdgeConstraints___s_category);
    }
    v35 = *(NSObject **)(v34 + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "_navItemContentLayoutGuideLeadingConstraint not updated because of missing layout guide", buf, 2u);
    }
  }
  if (self->_navItemContentLayoutGuide)
  {
LABEL_2:
    -[NSArray firstObject](self->_navItemContentLayoutGuideHorizEdgeConstraints, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray lastObject](self->_navItemContentLayoutGuideHorizEdgeConstraints, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 0x10) != 0)
    {
      if ((navigationBarContentViewFlags & 0x20) != 0)
      {
        navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
        if (!navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint)
          goto LABEL_59;
        if (self->_staticNavBarButtonTrailing)
          v9 = 6;
        else
          v9 = 5;
        if (v9 != -[NSLayoutConstraint firstAttribute](navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "firstAttribute"))
        {
          -[NSLayoutConstraint setActive:](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "setActive:", 0);
          v10 = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
          self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = 0;

        }
        if (!self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint)
        {
LABEL_59:
          if (self->_staticNavBarButtonTrailing)
          {
            -[UIView trailingAnchor](self, "trailingAnchor");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_navItemContentLayoutGuide, "trailingAnchor");
          }
          else
          {
            -[UILayoutGuide leadingAnchor](self->_navItemContentLayoutGuide, "leadingAnchor");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView leadingAnchor](self, "leadingAnchor");
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "constraintEqualToAnchor:", v24);
          v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
          v26 = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
          self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = v25;

        }
        if (self->_staticNavBarButtonTrailing)
          v27 = v4;
        else
          v27 = v3;
        v28 = v27;
        objc_msgSend(v28, "secondItem");
        v29 = (_UINavigationBarContentView *)objc_claimAutoreleasedReturnValue();

        if (v29 == self)
        {
          v33 = 0.0;
        }
        else
        {
          -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton");
          v31 = v30;
          -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton");
          v33 = v31 - v32;
        }
        objc_msgSend(v28, "setActive:", 0);
        -[_UINavigationBarContentView updateNavItemContentLayoutGuideAnimationConstraintConstant:](self, "updateNavItemContentLayoutGuideAnimationConstraintConstant:", v33);
        -[NSLayoutConstraint setActive:](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "setActive:", 1);

        *(_WORD *)&self->_navigationBarContentViewFlags &= ~0x20u;
      }
      goto LABEL_46;
    }
    -[NSLayoutConstraint setActive:](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "setActive:", 0);
    staticNavBarButtonItem = self->_staticNavBarButtonItem;
    v7 = staticNavBarButtonItem && !-[UIBarButtonItem isHidden](staticNavBarButtonItem, "isHidden")
      || -[_UINavigationBarContentView _effectiveStaticNavBarButtonLingers](self, "_effectiveStaticNavBarButtonLingers");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke;
    v37[3] = &unk_1E16B6210;
    v37[4] = self;
    v38 = v7;
    v12 = __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke((uint64_t)v37, v3, 1);
    if (v12)
    {
      objc_msgSend(v3, "setActive:", 0);
      v13 = !self->_staticNavBarButtonTrailing && v7;
      -[UILayoutGuide leadingAnchor](self->_navItemContentLayoutGuide, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[UIView trailingAnchor](self->_staticNavBarButton, "trailingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self, "buttonBarMinimumInterGroupSpace");
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
      }
      else
      {
        -[UIView leadingAnchor](self, "leadingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setIdentifier:", CFSTR("UINavItemContentGuide-leading"));
      v3 = v16;
    }
    else
    {
      objc_msgSend(v3, "setActive:", 1);
    }
    if (__78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke((uint64_t)v37, v4, 0))
    {
      objc_msgSend(v4, "setActive:", 0);
      v17 = self->_staticNavBarButtonTrailing && v7;
      -[UILayoutGuide trailingAnchor](self->_navItemContentLayoutGuide, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[UIView leadingAnchor](self->_staticNavBarButton, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self, "buttonBarMinimumInterGroupSpace");
        objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v20);
      }
      else
      {
        -[UIView trailingAnchor](self, "trailingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIdentifier:", CFSTR("UINavItemContentGuide-trailing"));
      v4 = v21;
    }
    else
    {
      objc_msgSend(v4, "setActive:", 1);
      if (!v12)
        goto LABEL_46;
    }
    v40[0] = v3;
    v40[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    navItemContentLayoutGuideHorizEdgeConstraints = self->_navItemContentLayoutGuideHorizEdgeConstraints;
    self->_navItemContentLayoutGuideHorizEdgeConstraints = v22;

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_navItemContentLayoutGuideHorizEdgeConstraints);
    -[_UINavigationBarContentViewLayout _updateMarginConstraints](self->_layout, "_updateMarginConstraints");
LABEL_46:

  }
}

- (BOOL)_effectiveStaticNavBarButtonLingers
{
  BOOL v2;
  void *v4;

  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x80) == 0)
    return 0;
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v2 = 0;
  else
    v2 = self->_staticNavBarButton != 0;

  return v2;
}

- (_UINavigationBarContentViewVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)_setupTitleView
{
  void *v3;
  void *v4;
  double v5;
  NSUInteger v6;
  _UINavigationBarContentViewLayout *layout;
  void *v8;
  double v9;
  _UINavigationBarContentViewLayout *v10;
  _UINavigationBarContentViewLayout *v11;
  double v12;
  _OWORD *v13;
  _BYTE v14[64];
  _BYTE v15[64];

  _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (self->_titleView)
    {
      -[_UINavigationBarContentViewLayout setAugmentedTitleView:](self->_layout, "setAugmentedTitleView:", 0);
      LODWORD(v5) = 1142292480;
      -[_UINavigationBarContentViewLayout configureWithTitleView:compressionResistancePriority:](self->_layout, "configureWithTitleView:compressionResistancePriority:", self->_titleView, v5);
LABEL_20:
      -[_UINavigationBarContentViewLayout setTitlePositionAdjustment:](self->_layout, "setTitlePositionAdjustment:", self->_titlePositionAdjustment.horizontal, self->_titlePositionAdjustment.vertical);
      goto LABEL_21;
    }
    v6 = -[NSString length](self->_title, "length");
    layout = self->_layout;
    v8 = 0;
LABEL_8:
    -[_UINavigationBarContentViewLayout setAugmentedTitleView:](layout, "setAugmentedTitleView:", v8);
    if (!v6)
      goto LABEL_14;
    LODWORD(v9) = 1143930880;
    -[_UINavigationBarContentViewLayout configureWithTitle:attributes:compressionResistancePriority:](self->_layout, "configureWithTitle:attributes:compressionResistancePriority:", self->_title, self->_titleAttributes, v9);
    v10 = self->_layout;
    if (v10)
    {
      -[_UINavigationBarContentViewLayout currentButtonBarLayoutInfo](v10, "currentButtonBarLayoutInfo");
      if (!v15[58])
        goto LABEL_18;
      v11 = self->_layout;
      if (v11)
      {
        -[_UINavigationBarContentViewLayout currentButtonBarLayoutInfo](v11, "currentButtonBarLayoutInfo");
        v12 = 0.0;
        if (v14[57])
        {
LABEL_19:
          -[_UINavigationBarContentViewLayout setInlineTitleViewAlpha:](self->_layout, "setInlineTitleViewAlpha:", v12);
          goto LABEL_20;
        }
LABEL_18:
        -[_UINavigationBarContentView _resolvedInlineTitleViewAlpha](self, "_resolvedInlineTitleViewAlpha");
        goto LABEL_19;
      }
      v13 = v14;
    }
    else
    {
      v13 = v15;
    }
    v13[2] = 0u;
    v13[3] = 0u;
    *v13 = 0u;
    v13[1] = 0u;
    goto LABEL_18;
  }
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (!objc_msgSend(v4, "_hideNavigationBarStandardTitle"))
  {
    v6 = -[NSString length](self->_title, "length");
    layout = self->_layout;
    v8 = v4;
    goto LABEL_8;
  }
  -[_UINavigationBarContentViewLayout setAugmentedTitleView:](self->_layout, "setAugmentedTitleView:", v4);
LABEL_14:
  -[_UINavigationBarContentViewLayout configureWithoutTitle](self->_layout, "configureWithoutTitle");
LABEL_21:
  -[_UINavigationBarContentViewLayout setTitleMenuProvider:](self->_layout, "setTitleMenuProvider:", self->_titleMenuProvider);
  -[_UINavigationBarContentViewLayout setDocumentProperties:](self->_layout, "setDocumentProperties:", self->_documentProperties);
  -[_UINavigationBarContentViewLayout setRenameHandler:](self->_layout, "setRenameHandler:", self->_dci_renameHandler);

}

- (void)setInlineTitleViewAlpha:(double)a3
{
  _UINavigationBarContentViewLayout *layout;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  self->_inlineTitleViewAlpha = a3;
  -[_UINavigationBarContentView _resolvedInlineTitleViewAlpha](self, "_resolvedInlineTitleViewAlpha");
  -[_UINavigationBarContentViewLayout setInlineTitleViewAlpha:](self->_layout, "setInlineTitleViewAlpha:");
  layout = self->_layout;
  if (layout)
  {
    -[_UINavigationBarContentViewLayout currentButtonBarLayoutInfo](layout, "currentButtonBarLayoutInfo");
    layout = self->_layout;
    if (BYTE10(v12))
    {
      if (layout)
      {
        -[_UINavigationBarContentViewLayout currentButtonBarLayoutInfo](layout, "currentButtonBarLayoutInfo");
        if (BYTE9(v8))
          return;
        layout = self->_layout;
      }
      else
      {
        v7 = 0u;
        v8 = 0u;
        v5 = 0u;
        v6 = 0u;
      }
    }
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }
  -[_UINavigationBarContentViewLayout _applyInlineTitleViewAlphaImmediately](layout, "_applyInlineTitleViewAlphaImmediately", v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)_setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarContentView;
  -[UIView setDirectionalLayoutMargins:](&v3, sel_setDirectionalLayoutMargins_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_toolbarStyle = a3;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  self->_titlePositionAdjustment = a3;
}

- (void)setTitleMenuProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (void)setTitleAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3
{
  self->_placeInlineSearchBarInCenter = a3;
}

- (void)setOverrideSize:(double)a3
{
  self->_overrideSize = a3;
}

- (void)setLeadingItemsSupplementBackItem:(BOOL)a3
{
  self->_leadingItemsSupplementBackItem = a3;
}

- (void)setInlineSearchBarGroup:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSearchBarGroup, a3);
}

- (void)setFixedTrailingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fixedTrailingGroup, a3);
}

- (void)setEnableAlternatePopItem:(BOOL)a3
{
  self->_enableAlternatePopItem = a3;
}

- (void)setDocumentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_documentProperties, a3);
}

- (void)setCustomizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void)setCenterBarGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void)setBarMetrics:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = 1;
  if (a3 == 101)
    v4 = 0;
  else
    v4 = a3;
  if (a3 != 102)
    v3 = v4;
  if (self->_barMetrics != v3)
  {
    self->_barMetrics = v3;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_leadingBarButtonItems;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10++), "_updateView");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_trailingBarButtonItems;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "_updateView", (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

    -[_UINavigationBarContentViewLayout setRequestedContentSize:](self->_layout, "setRequestedContentSize:", -[_UINavigationBarContentView _currentContentSize](self, "_currentContentSize"));
  }
}

- (void)setBackButtonItem:(id)a3
{
  UIBarButtonItem *v5;
  UIBarButtonItem **p_backButtonItem;
  UIBarButtonItem *v7;

  v5 = (UIBarButtonItem *)a3;
  p_backButtonItem = &self->_backButtonItem;
  if (*p_backButtonItem != v5)
  {
    v7 = v5;
    -[UIBarButtonItem _setViewOwner:](*p_backButtonItem, "_setViewOwner:", 0);
    objc_storeStrong((id *)p_backButtonItem, a3);
    v5 = v7;
  }

}

- (void)setBackButtonHidden:(BOOL)a3
{
  self->_backButtonHidden = a3;
}

- (void)setBackAction:(id)a3
{
  objc_storeStrong((id *)&self->_backAction, a3);
}

- (void)setAllowLeadingAlignedLargeTitle:(BOOL)a3
{
  self->_allowLeadingAlignedLargeTitle = a3;
}

- (void)setAdditionalItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalItems, a3);
}

- (void)dci_setRenameHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dci_renameHandler, a3);
}

- (void)_setBackButtonMaximumWidth:(double)a3
{
  -[_UINavigationBarContentViewLayout setMaximumBackButtonWidth:](self->_layout, "setMaximumBackButtonWidth:", a3);
}

- (void)setLeadingBarGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (void)setLeadingBarButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setTrailingBarGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (void)setTrailingBarButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (NSArray)trailingBarGroups
{
  return self->_trailingBarGroups;
}

- (void)setPlainItemAppearance:(id)a3
{
  -[_UINavigationBarContentViewLayout setPlainItemAppearance:](self->_layout, "setPlainItemAppearance:", a3);
}

- (void)setDoneItemAppearance:(id)a3
{
  -[_UINavigationBarContentViewLayout setDoneItemAppearance:](self->_layout, "setDoneItemAppearance:", a3);
}

- (void)setBackButtonAppearance:(id)a3
{
  -[_UINavigationBarContentViewLayout setBackButtonAppearance:](self->_layout, "setBackButtonAppearance:", a3);
}

- (NSArray)leadingBarGroups
{
  return self->_leadingBarGroups;
}

- (int64_t)barType
{
  return 1;
}

- (double)backButtonMargin
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIView _contentMargin](self, "_contentMargin");
  v4 = v3;
  result = 0.0;
  if (v4 > 0.0)
  {
    v6 = 0.0;
    if (!self->_hasLeadingInsetFromTideBar
      && (!-[UIBarButtonItem _isFloatable](self->_staticNavBarButtonItem, "_isFloatable", 0.0)
       || -[UIBarButtonItem isHidden](self->_staticNavBarButtonItem, "isHidden")))
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v6 = v7;
      v9 = v8;
      if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
        v6 = v9;
    }
    return v4 + -8.0 + v6;
  }
  return result;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  id v4;
  _UINavigationBarContentViewVisualProvider *visualProvider;
  unint64_t v6;
  _UINavigationBarContentViewLayout *v7;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    v6 = -[_UINavigationBarContentViewVisualProvider edgesPaddingBarButtonItem:](visualProvider, "edgesPaddingBarButtonItem:", v4);
  }
  else
  {
    v7 = self->_layout;
    if (!v7)
    {
      transitionContext = self->_transitionContext;
      if (transitionContext)
      {
        -[_UINavigationBarTransitionContext toLayout](transitionContext, "toLayout");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = *(void **)(v9 + 160);
        else
          v11 = 0;
        v7 = v11;

      }
      else
      {
        v7 = 0;
      }
    }
    -[_UINavigationBarContentViewLayout leadingVisibleItem](v7, "leadingVisibleItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v4)
      v13 = 13;
    else
      v13 = 15;
    -[_UINavigationBarContentViewLayout trailingVisibleItem](v7, "trailingVisibleItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v4)
      v6 = v13 & 7;
    else
      v6 = v13;

  }
  return v6;
}

- (void)_updateLayoutMarginsForLayout:(id)a3
{
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
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UINavigationBarContentView defaultEdgeSpacing](self, "defaultEdgeSpacing");
  v13 = v12;
  objc_msgSend(v32, "leadingVisibleItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingVisibleItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isCustomViewItem");
  v17 = objc_msgSend(v15, "isCustomViewItem");
  v18 = v17;
  v19 = 0.0;
  if (v16)
    v20 = 0.0;
  else
    v20 = v13;
  v21 = v7 - v20;
  if (!v17)
    v19 = v13;
  v22 = v11 - v19;
  objc_msgSend(v32, "layoutMargins");
  v29 = v21 == v26 && v5 == v23 && v22 == v25 && v9 == v24;
  if (!v29 || objc_msgSend(v32, "hasFakedBackButton"))
  {
    objc_msgSend(v32, "setLayoutMargins:", v5, v21, v9, v22);
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v14, "_viewOwner");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_itemStandardViewNeedsUpdate:", v14);

    }
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v15, "_viewOwner");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_itemStandardViewNeedsUpdate:", v15);

    }
  }

}

- (double)defaultEdgeSpacing
{
  void *v2;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return 8.0;
}

- (BOOL)compactMetrics
{
  unint64_t v2;

  v2 = self->_requestedContentSize - 1;
  if (v2 >= 3)
    return self->_barMetrics == 1;
  else
    return (v2 & 7) == 0;
}

- (void)tintColorDidChange
{
  id v3;

  -[_UINavigationBarContentView _appearanceChanged](self, "_appearanceChanged");
  -[_UINavigationBarContentView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarContentViewDidChangeTintColor:", self);

}

- (void)_appearanceChanged
{
  _UINavigationBarContentViewLayout *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v9;
  void *v10;
  void *v11;
  _UINavigationBarContentViewLayout *v12;
  _UINavigationBarContentViewLayout *v13;

  v3 = self->_layout;
  if (v3)
    goto LABEL_2;
  transitionContext = self->_transitionContext;
  if (!transitionContext)
    goto LABEL_9;
  -[_UINavigationBarTransitionContext toLayout](transitionContext, "toLayout");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v9 ? *(void **)(v9 + 160) : 0;
  v13 = v11;

  v3 = v13;
  if (v13)
  {
LABEL_2:
    v12 = v3;
    -[_UINavigationBarContentViewLayout backButton](v3, "backButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[_UINavigationBarContentView _configureBackButton:](self, "_configureBackButton:", v4);
    -[_UINavigationBarContentViewLayout leadingBar](v12, "leadingBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_appearanceChanged");

    -[_UINavigationBarContentViewLayout trailingBar](v12, "trailingBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_appearanceChanged");

    -[_UINavigationBarContentViewLayout centerBar](v12, "centerBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_appearanceChanged");

  }
  else
  {
LABEL_9:
    v12 = 0;
  }
  *(_WORD *)&self->_navigationBarContentViewFlags |= 4u;
  -[_UINavigationBarContentView _setupStaticNavBarButtonAnimated:](self, "_setupStaticNavBarButtonAnimated:", 0);

}

- (void)setStaticNavBarButtonTrailing:(BOOL)a3
{
  self->_staticNavBarButtonTrailing = a3;
}

- (void)setStaticNavBarButtonItem:(id)a3
{
  id v5;
  UIBarButtonItem *staticNavBarButtonItem;
  id v7;

  v5 = a3;
  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  v7 = v5;
  if (!v5)
  {
    if (!staticNavBarButtonItem)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((objc_msgSend(v5, "isEqual:", staticNavBarButtonItem) & 1) == 0)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_staticNavBarButtonItem, a3);
    -[_UINavigationBarContentView setNeedsStaticNavBarButtonUpdate](self, "setNeedsStaticNavBarButtonUpdate");
  }
LABEL_4:

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAssistant:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    -[_UINavigationBarContentView _clearAssistants](self, "_clearAssistants");
    objc_storeWeak((id *)&self->_assistant, obj);
    -[_UINavigationBarContentView _setAssistants](self, "_setAssistants");
  }

}

- (_UINavigationBarContentView)initWithFrame:(CGRect)a3 visualProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _UINavigationBarContentView *v11;
  _UINavigationBarContentView *v12;
  uint64_t v13;
  _UINavigationBarContentViewLayout *layout;
  uint64_t v15;
  NSMutableArray *currentAnimations;
  uint64_t v17;
  NSMutableArray *currentCompletions;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UINavigationBarContentView;
  v11 = -[_UIBarContentView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_visualProvider, a4);
    v13 = -[_UINavigationBarContentView _newLayout](v12, "_newLayout");
    layout = v12->_layout;
    v12->_layout = (_UINavigationBarContentViewLayout *)v13;

    -[_UINavigationBarContentViewLayout setActive:contentView:](v12->_layout, "setActive:contentView:", 1, v12);
    -[UIView _setHostsLayoutEngine:](v12, "_setHostsLayoutEngine:", 1);
    v15 = objc_opt_new();
    currentAnimations = v12->_currentAnimations;
    v12->_currentAnimations = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    currentCompletions = v12->_currentCompletions;
    v12->_currentCompletions = (NSMutableArray *)v17;

  }
  return v12;
}

- (_UINavigationBarContentViewLayout)layout
{
  return self->_layout;
}

- (_UIPointerInteractionAssistant)assistant
{
  return (_UIPointerInteractionAssistant *)objc_loadWeakRetained((id *)&self->_assistant);
}

- (id)_newLayout
{
  _UINavigationBarContentViewLayout *v3;

  v3 = -[_UINavigationBarContentViewLayout initWithContentView:]([_UINavigationBarContentViewLayout alloc], "initWithContentView:", self);
  -[_UINavigationBarContentViewLayout setMinimumBackButtonWidth:](v3, "setMinimumBackButtonWidth:", _minimumBackButtonWidth((id *)&self->super.super.super.super.isa));
  -[_UINavigationBarContentViewLayout setRequestedContentSize:](v3, "setRequestedContentSize:", -[_UINavigationBarContentView _currentContentSize](self, "_currentContentSize"));
  -[_UINavigationBarContentView _updateLayoutMarginsForLayout:](self, "_updateLayoutMarginsForLayout:", v3);
  return v3;
}

- (void)_clearAssistants
{
  _UIPointerInteractionAssistant **p_assistant;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  p_assistant = &self->_assistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  objc_msgSend(WeakRetained, "setAssistedView:identifier:", 0, CFSTR("ContentView.staticButton"));

  v5 = objc_loadWeakRetained((id *)p_assistant);
  objc_msgSend(v5, "setAssistedView:identifier:", 0, CFSTR("ContentView.backButton"));

  -[_UINavigationBarContentViewLayout leadingBar](self->_layout, "leadingBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssistant:", 0);

  v7 = objc_loadWeakRetained((id *)p_assistant);
  objc_msgSend(v7, "setAssistedView:identifier:", 0, CFSTR("ContentView.leadingBar"));

  -[_UINavigationBarContentViewLayout centerBar](self->_layout, "centerBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssistant:", 0);

  v9 = objc_loadWeakRetained((id *)p_assistant);
  objc_msgSend(v9, "setAssistedView:identifier:", 0, CFSTR("ContentView.centerBar"));

  -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssistant:", 0);

  v11 = objc_loadWeakRetained((id *)p_assistant);
  objc_msgSend(v11, "setAssistedView:identifier:", 0, CFSTR("ContentView.trailingBar"));

  v12 = objc_loadWeakRetained((id *)p_assistant);
  objc_msgSend(v12, "setAssistedView:identifier:", 0, CFSTR("ContentView.title"));

}

- (void)_setAssistants
{
  _UIPointerInteractionAssistant **p_assistant;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  p_assistant = &self->_assistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  objc_msgSend(WeakRetained, "setAssistedView:identifier:", self->_staticNavBarButton, CFSTR("ContentView.staticButton"));

  v5 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssistedView:identifier:", v6, CFSTR("ContentView.backButton"));

  v7 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout leadingBar](self->_layout, "leadingBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssistant:", v7);

  v9 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout leadingBar](self->_layout, "leadingBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assistantView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssistedView:identifier:", v11, CFSTR("ContentView.leadingBar"));

  v12 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout centerBar](self->_layout, "centerBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAssistant:", v12);

  v14 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout centerBar](self->_layout, "centerBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assistantView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAssistedView:identifier:", v16, CFSTR("ContentView.centerBar"));

  v17 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAssistant:", v17);

  v19 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assistantView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAssistedView:identifier:", v21, CFSTR("ContentView.trailingBar"));

  v23 = objc_loadWeakRetained((id *)p_assistant);
  -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAssistedView:identifier:", v22, CFSTR("ContentView.title"));

}

- (_UINavigationBarContentViewDelegate)delegate
{
  return (_UINavigationBarContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setupTrailingButtonBarAnimated:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray **p_trailingBarGroups;
  NSArray *v11;
  UIBarButtonItemGroup *v12;
  void *v13;
  void *v14;
  UIBarButtonItemGroup *v15;
  void *v16;
  UIDeferredMenuElement *additionalItems;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSArray count](self->_trailingBarButtonItems, "count", a3)
    || -[NSArray count](self->_trailingBarGroups, "count")
    || self->_fixedTrailingGroup != 0;
  -[_UINavigationBarContentViewLayout trailingSearchBarGroup](self->_layout, "trailingSearchBarGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = !-[UIBarButtonItemGroup isHidden](self->_inlineSearchBarGroup, "isHidden");
  else
    v6 = 0;
  if (((v4 | v6) & 1) != 0 || self->_additionalItems || _UIBarsDesktopNavigationBarEnabled())
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "_hideNavigationBarTrailingBarButtons") ^ 1;
    else
      v9 = 1;

  }
  else
  {
    v9 = 0;
  }
  -[_UINavigationBarContentViewLayout setTrailingGroupsEnabled:](self->_layout, "setTrailingGroupsEnabled:", v9);
  p_trailingBarGroups = &self->_trailingBarGroups;
  if (-[NSArray count](self->_trailingBarGroups, "count"))
  {
    v11 = *p_trailingBarGroups;
  }
  else if (-[NSArray count](self->_trailingBarButtonItems, "count"))
  {
    v12 = [UIBarButtonItemGroup alloc];
    -[NSArray reverseObjectEnumerator](self->_trailingBarButtonItems, "reverseObjectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v12, "initWithBarButtonItems:representativeItem:", v14, 0);
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_trailingBarGroups, v11);
  }
  else
  {
    v11 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  -[_UINavigationBarContentViewLayout setTrailingGroups:](self->_layout, "setTrailingGroups:", v11);
  -[_UINavigationBarContentViewLayout setFixedTrailingGroup:](self->_layout, "setFixedTrailingGroup:", self->_fixedTrailingGroup);
  -[_UINavigationBarContentViewLayout additionalOverflowItems](self->_layout, "additionalOverflowItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  additionalItems = self->_additionalItems;
  -[_UINavigationBarContentViewLayout setAdditionalOverflowItems:](self->_layout, "setAdditionalOverflowItems:", additionalItems);
  if ((_DWORD)v9)
  {
    -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_confirmOwnershipOfFixedGroups");

  }
  if ((v16 == 0) == (additionalItems != 0))
    -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateContentAnimated:(BOOL)a3
{
  _UINavigationBarContentViewLayout *layout;
  _BOOL8 v5;
  UILayoutGuide *hostedTabBarGuide;
  _BOOL8 v7;
  void *v8;

  layout = self->_layout;
  if (layout)
  {
    v5 = a3;
    -[_UINavigationBarContentViewLayout setOverrideHeight:](layout, "setOverrideHeight:", self->_overrideSize);
    -[_UINavigationBarContentViewLayout setShowTitleWithTabBar:](self->_layout, "setShowTitleWithTabBar:", -[_UINavigationBarContentView _showTitleWithTabBar](self, "_showTitleWithTabBar"));
    -[_UINavigationBarContentViewLayout setUseInlineLargeTitleMetrics:](self->_layout, "setUseInlineLargeTitleMetrics:", self->_useInlineLargeTitleMetrics);
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0)
      hostedTabBarGuide = self->_hostedTabBarGuide;
    else
      hostedTabBarGuide = 0;
    -[_UINavigationBarContentViewLayout setTabBarContentGuide:](self->_layout, "setTabBarContentGuide:", hostedTabBarGuide);
    -[_UINavigationBarContentView _updateTitleAlignment](self, "_updateTitleAlignment");
    -[_UINavigationBarContentViewLayout setInlineSearchBarGroup:](self->_layout, "setInlineSearchBarGroup:", self->_inlineSearchBarGroup);
    v7 = self->_placeInlineSearchBarInCenter
      && -[_UINavigationBarContentViewLayout titleAlignment](self->_layout, "titleAlignment") == 1;
    -[_UINavigationBarContentViewLayout setPlaceInlineSearchBarInCenter:](self->_layout, "setPlaceInlineSearchBarInCenter:", v7);
    -[_UINavigationBarContentView _setupTitleView](self, "_setupTitleView");
    -[_UINavigationBarContentView _setupStaticNavBarButtonAnimated:](self, "_setupStaticNavBarButtonAnimated:", v5);
    -[_UINavigationBarContentView _setupBackButton](self, "_setupBackButton");
    -[_UINavigationBarContentView _setupLeadingButtonBarAnimated:](self, "_setupLeadingButtonBarAnimated:", 0);
    -[_UINavigationBarContentView _setupCenterButtonBar](self, "_setupCenterButtonBar");
    -[_UINavigationBarContentView _setupTrailingButtonBarAnimated:](self, "_setupTrailingButtonBarAnimated:", 0);
    -[_UINavigationBarContentViewLayout setCustomizationIdentifier:](self->_layout, "setCustomizationIdentifier:", self->_customizationIdentifier);
    -[_UINavigationBarContentViewLayout updateAlphas](self->_layout, "updateAlphas");
    -[_UINavigationBarContentView _updateLayoutMarginsForLayout:](self, "_updateLayoutMarginsForLayout:", self->_layout);
    -[_UINavigationBarContentViewLayout updateSpacingConstraints](self->_layout, "updateSpacingConstraints");
    -[_UINavigationBarContentViewLayout updateBackButtonGeometry](self->_layout, "updateBackButtonGeometry");
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_contentDidChange");

    -[_UINavigationBarContentView _runAllScheduledAnimations:](self, "_runAllScheduledAnimations:", v5);
    -[_UINavigationBarContentView _setAssistants](self, "_setAssistants");
  }
}

- (BOOL)isNavItemContentLayoutGuideFlushTrailing
{
  void *v3;
  _UINavigationBarContentView *v4;
  BOOL v5;
  BOOL v6;

  -[NSArray lastObject](self->_navItemContentLayoutGuideHorizEdgeConstraints, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_UINavigationBarContentView *)(id)objc_msgSend(v3, "secondItem");
  if (v3)
    v5 = v4 == self;
  else
    v5 = 1;
  v6 = v5;

  return v6;
}

- (BOOL)isNavItemContentLayoutGuideFlushLeading
{
  void *v3;
  _UINavigationBarContentView *v4;
  BOOL v5;
  BOOL v6;

  -[NSArray firstObject](self->_navItemContentLayoutGuideHorizEdgeConstraints, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_UINavigationBarContentView *)(id)objc_msgSend(v3, "secondItem");
  if (v3)
    v5 = v4 == self;
  else
    v5 = 1;
  v6 = v5;

  return v6;
}

- (void)_setupStaticNavBarButtonAnimated:(BOOL)a3
{
  UIBarButtonItem *staticNavBarButtonItem;
  _UIButtonBarButton *v5;
  char v6;
  _UIButtonBarButton *staticNavBarButton;
  _UIButtonBarButton *v8;
  NSArray *staticNavBarButtonVerticalAlignmentConstraints;
  _UIButtonBarButton *v10;
  _UIButtonBarButton *v11;
  void *v12;
  void *v13;
  _UIButtonBarButton *v14;
  _UIButtonBarButton *v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _UIButtonBarButton *v20;
  UIBarButtonItem *v21;
  __int16 v22;
  _BOOL4 staticNavBarButtonTrailing;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *staticNavBarButtonXPositionConstraint;
  void *v29;
  NSLayoutAttribute v30;
  void *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *v34;
  _BOOL4 v35;
  UIBarButtonItem *v36;
  UIBarButtonItem *v37;
  void *v38;
  _UIButtonBarButton *v39;
  void *v40;
  void *v41;
  _UIButtonBarButton *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _UIButtonBarButton *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id location;

  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  if (staticNavBarButtonItem && !-[UIBarButtonItem isHidden](staticNavBarButtonItem, "isHidden", a3))
  {
    if (-[UIBarButtonItem _actsAsFakeBackButton](self->_staticNavBarButtonItem, "_actsAsFakeBackButton"))
    {
      staticNavBarButton = self->_staticNavBarButton;
      if (staticNavBarButton)
      {
        if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x100) == 0)
        {
          -[UIView removeFromSuperview](staticNavBarButton, "removeFromSuperview");
          v8 = self->_staticNavBarButton;
          self->_staticNavBarButton = 0;

          staticNavBarButtonVerticalAlignmentConstraints = self->_staticNavBarButtonVerticalAlignmentConstraints;
          self->_staticNavBarButtonVerticalAlignmentConstraints = 0;

        }
      }
    }
    v10 = self->_staticNavBarButton;
    if (!v10)
    {
      v11 = [_UIButtonBarButton alloc];
      -[UIView traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", objc_msgSend(v12, "userInterfaceIdiom"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UIButtonBarButton initWithVisualProvider:](v11, "initWithVisualProvider:", v13);
      v15 = self->_staticNavBarButton;
      self->_staticNavBarButton = v14;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_staticNavBarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v16) = 1145569280;
      -[UIView setContentCompressionResistancePriority:forAxis:](self->_staticNavBarButton, "setContentCompressionResistancePriority:forAxis:", 0, v16);
      v10 = self->_staticNavBarButton;
    }
    -[UIView addSubview:](self, "addSubview:", v10);
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 4) == 0)
    {
      -[_UIButtonBarButton visualProvider](self->_staticNavBarButton, "visualProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_40;
    }
    v19 = -[UIBarButtonItem _actsAsFakeBackButton](self->_staticNavBarButtonItem, "_actsAsFakeBackButton");
    v20 = self->_staticNavBarButton;
    v21 = self->_staticNavBarButtonItem;
    if (v19)
    {
      -[_UIButtonBarButton configureBackButtonFromBarItem:withAppearanceDelegate:](v20, "configureBackButtonFromBarItem:withAppearanceDelegate:", v21, self);
      v22 = *(_WORD *)&self->_navigationBarContentViewFlags | 0x100;
    }
    else
    {
      -[_UIButtonBarButton configureFromBarItem:withAppearanceDelegate:](v20, "configureFromBarItem:withAppearanceDelegate:", v21, self);
      v22 = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFEFF;
    }
    *(_WORD *)&self->_navigationBarContentViewFlags = v22;
    staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
    -[_UIButtonBarButton visualProvider](self->_staticNavBarButton, "visualProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (staticNavBarButtonTrailing)
      objc_msgSend(v24, "alignmentViewForStaticNavBarButtonTrailing");
    else
      objc_msgSend(v24, "alignmentViewForStaticNavBarButtonLeading");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_staticNavBarButtonTrailing)
      v27 = 6;
    else
      v27 = 5;
    staticNavBarButtonXPositionConstraint = self->_staticNavBarButtonXPositionConstraint;
    if (v26)
    {
      if (!staticNavBarButtonXPositionConstraint
        || !-[NSLayoutConstraint isActive](staticNavBarButtonXPositionConstraint, "isActive"))
      {
        goto LABEL_30;
      }
      -[NSLayoutConstraint firstItem](self->_staticNavBarButtonXPositionConstraint, "firstItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 != v26)
      {

LABEL_30:
        -[NSLayoutConstraint setActive:](self->_staticNavBarButtonXPositionConstraint, "setActive:", 0);
        v31 = (void *)MEMORY[0x1E0D156E0];
        -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, v27, 0, v32, v27, 1.0, 0.0);
        v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

        -[NSLayoutConstraint setIdentifier:](v33, "setIdentifier:", CFSTR("UINav_static_button_horiz_position"));
        -[NSLayoutConstraint setActive:](v33, "setActive:", 1);
        v34 = self->_staticNavBarButtonXPositionConstraint;
        self->_staticNavBarButtonXPositionConstraint = v33;

        goto LABEL_31;
      }
      v30 = -[NSLayoutConstraint firstAttribute](self->_staticNavBarButtonXPositionConstraint, "firstAttribute");

      if (v27 != v30)
        goto LABEL_30;
    }
    else
    {
      -[NSLayoutConstraint setActive:](staticNavBarButtonXPositionConstraint, "setActive:", 0);
    }
LABEL_31:
    objc_initWeak(&location, self->_staticNavBarButtonItem);
    v35 = -[UIBarButtonItem _isFloating](self->_staticNavBarButtonItem, "_isFloating");
    v36 = self->_staticNavBarButtonItem;
    if (v35)
    {
      v37 = v36;
      -[UIBarButtonItem _configuredFloatableView](v37, "_configuredFloatableView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        v39 = [_UIButtonBarButton alloc];
        -[UIView traitCollection](self, "traitCollection");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", objc_msgSend(v40, "userInterfaceIdiom"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[_UIButtonBarButton initWithVisualProvider:](v39, "initWithVisualProvider:", v41);

        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke;
        v61[3] = &unk_1E16B58D0;
        objc_copyWeak(&v62, &location);
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, 0, CFSTR("com.apple.UIKit.NavigationBar.StaticNavBarButton"), v61);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIControl addAction:forControlEvents:](v42, "addAction:forControlEvents:", v43, 0x2000);

        -[UIBarButtonItem _setConfiguredFloatableView:](v37, "_setConfiguredFloatableView:", v42);
        objc_destroyWeak(&v62);

      }
      -[UIBarButtonItem _setReferenceView:](v37, "_setReferenceView:", self->_staticNavBarButton);
      -[UIBarButtonItem _configuredFloatableView](v37, "_configuredFloatableView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "configureFromBarItem:withAppearanceDelegate:", v37, self);
      -[UIView setUserInteractionEnabled:](self->_staticNavBarButton, "setUserInteractionEnabled:", 0);
      -[UIBarButtonItem _configuredFloatableView](self->_staticNavBarButtonItem, "_configuredFloatableView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAlpha:", 1.0);

    }
    else
    {
      -[UIBarButtonItem _configuredFloatableView](v36, "_configuredFloatableView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setAlpha:", 0.0);

      v47 = self->_staticNavBarButton;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke_2;
      v59[3] = &unk_1E16B58D0;
      objc_copyWeak(&v60, &location);
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, 0, CFSTR("com.apple.UIKit.NavigationBar.StaticNavBarButton"), v59);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl addAction:forControlEvents:](v47, "addAction:forControlEvents:", v48, 0x2000);

      if (-[UIBarButtonItem _isFloatable](self->_staticNavBarButtonItem, "_isFloatable"))
      {
        -[UIBarButtonItem _referenceView](self->_staticNavBarButtonItem, "_referenceView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v49)
          -[UIBarButtonItem _setReferenceView:](self->_staticNavBarButtonItem, "_setReferenceView:", self->_staticNavBarButton);
      }
      objc_destroyWeak(&v60);
    }
    objc_destroyWeak(&location);

LABEL_40:
    v6 = 1;
    goto LABEL_41;
  }
  v5 = self->_staticNavBarButton;
  if (v5)
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
  v6 = 0;
LABEL_41:
  if (-[UIBarButtonItem _isFloating](self->_staticNavBarButtonItem, "_isFloating"))
  {
    -[UIView setAlpha:](self->_staticNavBarButton, "setAlpha:", 0.0);
  }
  else
  {
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x40) != 0)
    {
      -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton");
      v52 = v51;
      -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton");
      v54 = v53;
      -[NSLayoutConstraint constant](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "constant");
      v56 = v55;
      if (-[_UINavigationBarContentView _backButtonLayoutGuideIncludesFullyHiddenConstant](self, "_backButtonLayoutGuideIncludesFullyHiddenConstant"))
      {
        v57 = 0.0;
      }
      else
      {
        v57 = v52;
      }
      v58 = fmax(fmin((v56 - v57) / (v54 - v52), 1.0), 0.0);
      v50 = v58 * (v58 * (v58 * v58));
    }
    else
    {
      v50 = 1.0;
      if ((v6 & 1) == 0)
      {
        if (-[_UINavigationBarContentView _effectiveStaticNavBarButtonLingers](self, "_effectiveStaticNavBarButtonLingers"))
        {
          v50 = 1.0;
        }
        else
        {
          v50 = 0.0;
        }
      }
    }
    -[UIView setAlpha:](self->_staticNavBarButton, "setAlpha:", v50);
    -[UIView setUserInteractionEnabled:](self->_staticNavBarButton, "setUserInteractionEnabled:", v50 == 1.0);
  }
  -[_UINavigationBarContentView _updateNavItemContentLayoutGuideEdgeConstraints](self, "_updateNavItemContentLayoutGuideEdgeConstraints");
  -[_UINavigationBarContentView _updateStaticNavBarButtonVerticalAlignmentConstraints](self, "_updateStaticNavBarButtonVerticalAlignmentConstraints");
  -[UIBarButtonItem setView:](self->_staticNavBarButtonItem, "setView:", self->_staticNavBarButton);
  *(_WORD *)&self->_navigationBarContentViewFlags &= ~4u;
}

- (void)_updateStaticNavBarButtonVerticalAlignmentConstraints
{
  void *v3;
  uint64_t v4;
  _UINavigationBarContentViewLayout *layout;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *staticNavBarButtonVerticalAlignmentConstraints;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (self->_staticNavBarButton && -[_UINavigationBarContentViewLayout active](self->_layout, "active"))
  {
    -[NSArray firstObject](self->_staticNavBarButtonVerticalAlignmentConstraints, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIBarButtonItem _actsAsFakeBackButton](self->_staticNavBarButtonItem, "_actsAsFakeBackButton"))
    {
      -[_UINavigationBarContentViewLayout backButtonGuide](self->_layout, "backButtonGuide");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      layout = self->_layout;
      if (self->_staticNavBarButtonTrailing)
        -[_UINavigationBarContentViewLayout trailingBarGuide](layout, "trailingBarGuide");
      else
        -[_UINavigationBarContentViewLayout leadingBarGuide](layout, "leadingBarGuide");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v4;
    if (v4
      && (!v3
       || !objc_msgSend(v3, "isActive")
       || v6 != (id)objc_msgSend(v3, "secondItem")))
    {
      if (self->_staticNavBarButtonVerticalAlignmentConstraints)
        objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      -[UIView topAnchor](self->_staticNavBarButton, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UINav-static-button-top"));
      -[UIView bottomAnchor](self->_staticNavBarButton, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setIdentifier:", CFSTR("UINav-static-button-bottom"));
      v15[0] = v9;
      v15[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      staticNavBarButtonVerticalAlignmentConstraints = self->_staticNavBarButtonVerticalAlignmentConstraints;
      self->_staticNavBarButtonVerticalAlignmentConstraints = v13;

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_staticNavBarButtonVerticalAlignmentConstraints);
    }

  }
}

- (void)_setupLeadingButtonBarAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  NSArray **p_leadingBarGroups;
  NSArray *v8;
  UIBarButtonItemGroup *v9;
  _UINavigationBarContentViewLayout *layout;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_leadingBarButtonItems, "count", a3)
    || -[NSArray count](self->_leadingBarGroups, "count")
    || self->_enableAlternatePopItem)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "_hideNavigationBarLeadingBarButtons") ^ 1;
    else
      v6 = 1;

  }
  else
  {
    v6 = 0;
  }
  -[_UINavigationBarContentViewLayout setLeadingGroupsMode:](self->_layout, "setLeadingGroupsMode:", v6);
  p_leadingBarGroups = &self->_leadingBarGroups;
  if (-[NSArray count](self->_leadingBarGroups, "count"))
  {
    v8 = *p_leadingBarGroups;
  }
  else if (-[NSArray count](self->_leadingBarButtonItems, "count"))
  {
    v9 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", self->_leadingBarButtonItems, 0);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_leadingBarGroups, v8);
  }
  else
  {
    v8 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  -[_UINavigationBarContentViewLayout setLeadingGroups:](self->_layout, "setLeadingGroups:", v8);
  -[_UINavigationBarContentViewLayout setEnableAlternatePopItem:](self->_layout, "setEnableAlternatePopItem:", self->_enableAlternatePopItem);
  layout = self->_layout;
  if (v6)
  {
    -[_UINavigationBarContentViewLayout leadingBar](layout, "leadingBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingVisibleItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_showsChevron");

    if ((_DWORD)v13)
      v14 = 8.0;
    else
      v14 = 0.0;
    -[_UINavigationBarContentViewLayout leadingBar](self->_layout, "leadingBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, v14);

    layout = self->_layout;
    v17 = v13;
  }
  else
  {
    v17 = 0;
  }
  -[_UINavigationBarContentViewLayout setHasFakedBackButton:](layout, "setHasFakedBackButton:", v17);

}

- (void)_setupCenterButtonBar
{
  int64_t v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSArray *centerBarGroups;
  id v11;

  v3 = -[_UINavigationBarContentView _effectiveToolbarStyle](self, "_effectiveToolbarStyle");
  -[_UINavigationBarContentViewLayout centerSearchBarGroup](self->_layout, "centerSearchBarGroup");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    v4 = !-[UIBarButtonItemGroup isHidden](self->_inlineSearchBarGroup, "isHidden");
  else
    v4 = 0;
  if (-[NSArray count](self->_centerBarGroups, "count"))
    v5 = 0;
  else
    v5 = v4 == 0;
  if (v5
    || (-[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = v6, v8 = objc_msgSend(v6, "_hideNavigationBarCenterBarButtons"), v7, (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else if (v3)
  {
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0)
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v9 = 2;
  }
  -[_UINavigationBarContentViewLayout setCenterGroupsMode:](self->_layout, "setCenterGroupsMode:", v9);
  if (self->_centerBarGroups)
    centerBarGroups = self->_centerBarGroups;
  else
    centerBarGroups = (NSArray *)MEMORY[0x1E0C9AA60];
  -[_UINavigationBarContentViewLayout setCenterBarGroups:](self->_layout, "setCenterBarGroups:", centerBarGroups);

}

- (BOOL)_useLeadingAlignedTitle
{
  int64_t v3;
  _UINavigationBarContentViewVisualProvider *visualProvider;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v3 = -[_UINavigationBarContentView _effectiveToolbarStyle](self, "_effectiveToolbarStyle");
  visualProvider = self->_visualProvider;
  v5 = v3 - 1;
  if (visualProvider)
    v6 = 0;
  else
    v6 = v5 >= 2;
  v7 = !v6;
  if (visualProvider)
    v8 = v5 >= 2;
  else
    v8 = 0;
  if (v8)
    return -[_UINavigationBarContentViewVisualProvider useLeadingAlignedLargeTitle:toolbarStyle:](visualProvider, "useLeadingAlignedLargeTitle:toolbarStyle:", self->_allowLeadingAlignedLargeTitle, self->_toolbarStyle);
  else
    return v7;
}

- (int64_t)effectiveStyleForStyle:(int64_t)a3
{
  int64_t v3;
  void *v5;
  uint64_t v6;

  if (a3 == -1)
    v3 = 0;
  else
    v3 = a3;
  if ((unint64_t)(v3 - 1) <= 1)
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "horizontalSizeClass");

    if (v6 == 1)
      return 0;
    else
      return a3;
  }
  return v3;
}

- (int64_t)_effectiveToolbarStyle
{
  return -[_UINavigationBarContentView effectiveStyleForStyle:](self, "effectiveStyleForStyle:", self->_toolbarStyle);
}

- (void)_setupBackButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  UIBarButtonItem *backActionItem;
  _BOOL4 v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 leadingItemsSupplementBackItem;
  id v13;
  id v14;

  if (!self->_backAction)
  {
    backActionItem = self->_backActionItem;
    self->_backActionItem = 0;

    if (-[NSArray count](self->_leadingBarButtonItems, "count"))
      v8 = 0;
    else
      v8 = -[NSArray count](self->_leadingBarGroups, "count") == 0;
    if (self->_backButtonItem && !self->_backButtonHidden)
    {
      -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_hideNavigationBarBackButton");
      if (((v10 | v8) & 1) != 0)
      {
        v11 = v10;

        if (!v11)
          goto LABEL_2;
      }
      else
      {
        leadingItemsSupplementBackItem = self->_leadingItemsSupplementBackItem;

        if (leadingItemsSupplementBackItem)
          goto LABEL_2;
      }
    }
    -[_UINavigationBarContentViewLayout setBackButton:](self->_layout, "setBackButton:", 0);
    return;
  }
LABEL_2:
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "buttonBarButtonClass")), "initWithVisualProvider:", v5);
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel___backButtonAction_, 0x2000);
    LODWORD(v6) = 1143111680;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    objc_msgSend(v13, "setSpringLoaded:", +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault"));
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UINavigationBarContentViewLayout setBackButton:](self->_layout, "setBackButton:", v13);

    v3 = (uint64_t)v13;
  }
  v14 = (id)v3;
  -[_UINavigationBarContentView _configureBackButton:](self, "_configureBackButton:", v3);
  -[_UINavigationBarContentViewLayout setMinimumBackButtonWidth:](self->_layout, "setMinimumBackButtonWidth:", _minimumBackButtonWidth((id *)&self->super.super.super.super.isa));
  -[UIBarButtonItem _setViewOwner:](self->_backButtonItem, "_setViewOwner:", self);

}

- (void)_runAllScheduledAnimations:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void (**v7)(void *, uint64_t);
  _QWORD v8[5];
  _QWORD aBlock[5];

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke_2;
  v8[3] = &unk_1E16B3FD8;
  v8[4] = self;
  v7 = (void (**)(void *, uint64_t))_Block_copy(v8);
  if (v3)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v7, 0.2);
  }
  else
  {
    v6[2](v6);
    v7[2](v7, 1);
  }

}

- (double)buttonBarMinimumInterGroupSpace
{
  void *v2;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return 6.0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  _UINavigationBarContentViewLayout *layout;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  _UIButtonBarButton *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UIButtonBarButton *staticNavBarButton;
  _UIButtonBarButton *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 staticNavBarButtonTrailing;
  _UIButtonBarButton *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  _UIButtonBarButton *v40;
  double v41;
  double v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  char v59;
  uint64_t v60;
  double v61;
  double v62;
  _UIButtonBarButton *v63;
  void *v64;
  int v65;
  _UIButtonBarButton *v66;
  void *v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigationBarContentOverlayRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v68.receiver = self;
  v68.super_class = (Class)_UINavigationBarContentView;
  -[UIView layoutSubviews](&v68, sel_layoutSubviews);
  if (!self->_transitionContext)
  {
    layout = self->_layout;
    if (layout)
    {
      -[_UINavigationBarContentViewLayout layoutSubviews](layout, "layoutSubviews");
      -[UIView bounds](self, "bounds");
      x = v69.origin.x;
      y = v69.origin.y;
      width = v69.size.width;
      height = v69.size.height;
      MinX = CGRectGetMinX(v69);
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = height;
      CGRectGetMaxX(v70);
      -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
      v11 = (_UIButtonBarButton *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentViewLayout leadingBar](self->_layout, "leadingBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 472;
      staticNavBarButton = self->_staticNavBarButton;
      v67 = v13;
      if (staticNavBarButton && !-[UIView isHidden](staticNavBarButton, "isHidden"))
      {
        staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
        v17 = self->_staticNavBarButton;
        if (!staticNavBarButtonTrailing)
        {
          v65 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
          if (v17)
          {
            if (v11)
            {
              v15 = 0;
              v30 = v11;
            }
            else
            {
              objc_msgSend(v13, "view");
              v60 = objc_claimAutoreleasedReturnValue();
              if (v60)
              {
                v13 = (void *)v60;
                v15 = 0;
                v30 = (void *)v60;
              }
              else if (v12)
              {
                v15 = 0;
                v13 = 0;
                v30 = v12;
              }
              else
              {
                objc_msgSend(v14, "view");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = 0;
                v15 = 1;
              }
            }
            v61 = _hitTestInsets(v17, 0, v30, v65, MinX);
            -[UIView setHitTestInsets:](v17, "setHitTestInsets:", 0.0, v61, 0.0, v62);
            if ((_DWORD)v15)

            v26 = 0;
            if (!v11)
            {
              v66 = v17;
              v28 = 1;
LABEL_25:

              v13 = v67;
LABEL_26:
              v63 = v11;
              if (v13)
              {
                objc_msgSend(v67, "view");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if ((_DWORD)v28)
                  v11 = v66;
                v34 = v12;
                if (!v12)
                {
                  objc_msgSend(v14, "view");
                  v35 = objc_claimAutoreleasedReturnValue();
                  v15 = v35;
                  if (v35)
                    v34 = (void *)v35;
                  else
                    v34 = v26;
                }
                v36 = _hitTestInsets(v13, v11, v34, v65, MinX);
                objc_msgSend(v67, "setHitTestInsets:", 0.0, v36, 0.0, v37);
                if (!v12)

                v11 = v63;
              }
              if (v14)
              {
                objc_msgSend(v14, "view");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v12;
                if (!v12)
                {
                  objc_msgSend(v67, "view");
                  v39 = objc_claimAutoreleasedReturnValue();
                  v15 = v39;
                  if ((_DWORD)v28)
                    v40 = v66;
                  else
                    v40 = v11;
                  if (v39)
                    v38 = (void *)v39;
                  else
                    v38 = v40;
                }
                v41 = _hitTestInsets(v13, v38, v26, v65, MinX);
                objc_msgSend(v14, "setHitTestInsets:", 0.0, v41, 0.0, v42);
                if (!v12)

              }
              if (v26)
              {
                if (v12)
                {
                  v43 = 0;
                  v44 = v12;
                }
                else
                {
                  objc_msgSend(v67, "view");
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (v45)
                  {
                    v13 = (void *)v45;
                    v43 = 0;
                    v44 = (void *)v45;
                  }
                  else if ((_DWORD)v28)
                  {
                    objc_msgSend(v14, "view");
                    v46 = objc_claimAutoreleasedReturnValue();
                    v28 = v46;
                    v13 = 0;
                    if (v46)
                      v44 = (void *)v46;
                    else
                      v44 = v66;
                    v43 = 1;
                  }
                  else
                  {
                    v13 = 0;
                    v43 = 0;
                    v44 = v11;
                  }
                }
                v47 = _hitTestInsets(v26, v44, 0, v65, MinX);
                -[UIView setHitTestInsets:](v26, "setHitTestInsets:", 0.0, v47, 0.0, v48);
                if (v43)

                if (!v12)
              }
              objc_msgSend(v14, "view", v63);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v49;
              if (v3)
              {
                objc_msgSend(v49, "subviews");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "count") != 0;
                objc_msgSend(v14, "view");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setUserInteractionEnabled:", v52);

                v54 = v67;
                if (v4)
                {
                  objc_msgSend(v3, "_navigationBarContentOverlayRects");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = v4;
                  v57 = v55;
                  if (v56 == v57)
                  {

                  }
                  else
                  {
                    v58 = v57;
                    if (v57)
                    {
                      v59 = objc_msgSend(v56, "isEqual:", v57);

                      if ((v59 & 1) != 0)
                        goto LABEL_73;
                    }
                    else
                    {

                    }
                    objc_msgSend(v3, "setNeedsLayout");
                  }
                }
              }
              else
              {
                objc_msgSend(v49, "setUserInteractionEnabled:", 1);

                v54 = v67;
              }
LABEL_73:

              goto LABEL_74;
            }
            v13 = v67;
LABEL_11:
            objc_msgSend(v13, "view");
            v27 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v27;
            if (v27)
            {
              v28 = 0;
              v29 = (void *)v27;
            }
            else if (v12)
            {
              v28 = 0;
              v29 = v12;
            }
            else
            {
              objc_msgSend(v14, "view");
              v31 = objc_claimAutoreleasedReturnValue();
              v15 = v31;
              if (v31)
                v29 = (void *)v31;
              else
                v29 = v26;
              v28 = 1;
            }
            v66 = v17;
            v32 = _hitTestInsets(v11, v17, v29, v65, MinX);
            -[UIView setHitTestInsets:](v11, "setHitTestInsets:", 0.0, v32, 0.0, v33);
            if ((_DWORD)v28)
            {

              v28 = 0;
            }
            goto LABEL_25;
          }
          v26 = 0;
LABEL_10:
          v17 = 0;
          if (!v11)
          {
            v66 = 0;
            v28 = 1;
            goto LABEL_26;
          }
          goto LABEL_11;
        }
      }
      else
      {
        v17 = 0;
      }
      v65 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v26 = v17;
      goto LABEL_10;
    }
    if (self->_staticNavBarButton)
    {
      -[UIView bounds](self, "bounds");
      v18 = v71.origin.x;
      v19 = v71.origin.y;
      v20 = v71.size.width;
      v21 = v71.size.height;
      v22 = CGRectGetMinX(v71);
      v72.origin.x = v18;
      v72.origin.y = v19;
      v72.size.width = v20;
      v72.size.height = v21;
      CGRectGetMaxX(v72);
      v23 = _hitTestInsets(self->_staticNavBarButton, 0, 0, -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"), v22);
      -[UIView setHitTestInsets:](self->_staticNavBarButton, "setHitTestInsets:", 0.0, v23, 0.0, v24);
    }
  }
LABEL_74:

}

- (double)buttonBarMinimumInterItemSpace
{
  void *v2;
  double v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 5)
    v3 = 6.0;
  else
    v3 = 8.0;

  return v3;
}

- (id)backIndicatorImage
{
  return self->_backIndicatorImage;
}

- (int64_t)_currentContentSize
{
  int64_t requestedContentSize;
  void *v3;
  uint64_t v4;

  requestedContentSize = self->_requestedContentSize;
  if (!requestedContentSize)
  {
    requestedContentSize = self->_barMetrics;
    if (requestedContentSize != 1)
    {
      -[UIView traitCollection](self, "traitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_presentationSemanticContext");

      requestedContentSize = 2;
      if (v4 == 2)
        return 3;
    }
  }
  return requestedContentSize;
}

- (void)setStaticNavBarButtonLingers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_navigationBarContentViewFlags = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFF7F | v3;
}

- (double)backButtonMaximumWidth
{
  double result;

  -[_UINavigationBarContentViewLayout maximumBackButtonWidth](self->_layout, "maximumBackButtonWidth");
  return result;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  void *v5;
  _UINavigationBarContentViewLayout *layout;
  id v7;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UINavigationBarContentView;
  -[UIView _traitCollectionForChildEnvironment:](&v23, sel__traitCollectionForChildEnvironment_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  layout = self->_layout;
  if (layout)
  {
    -[_UINavigationBarContentViewLayout traitOverridesForChild:](layout, "traitOverridesForChild:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (!transitionContext)
    {
      v15 = v5;
      goto LABEL_15;
    }
    -[_UINavigationBarTransitionContext toLayout](transitionContext, "toLayout");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = *(void **)(v9 + 160);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v12, "traitOverridesForChild:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v7 = v13;
    }
    else
    {
      -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = *(void **)(v16 + 160);
      else
        v18 = 0;
      v19 = v18;
      objc_msgSend(v19, "traitOverridesForChild:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v20 = v5;
  v15 = v20;
  if (v7)
  {
    -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v20, (uint64_t)v7, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v21;
  }
LABEL_15:

  return v15;
}

- (void)setRequestedContentSize:(int64_t)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[_UINavigationBarContentView barMetrics](self, "barMetrics");
  if (self->_requestedContentSize != a3)
  {
    v6 = v5;
    self->_requestedContentSize = a3;
    -[_UINavigationBarContentViewLayout setRequestedContentSize:](self->_layout, "setRequestedContentSize:", -[_UINavigationBarContentView _currentContentSize](self, "_currentContentSize"));
    if (v6 != -[_UINavigationBarContentView barMetrics](self, "barMetrics"))
      -[_UINavigationBarContentView _appearanceChanged](self, "_appearanceChanged");
  }
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)titleView:(id)a3 needsUpdatedContentOverlayRects:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIBarButtonItem *staticNavBarButtonItem;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "backButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", v9, v31);
    objc_msgSend(v6, "setBackButtonRect:");

    objc_msgSend(v8, "leadingBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_viewForOverlayRects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", v11, v31);
    objc_msgSend(v6, "setLeadingItemsRect:");

    objc_msgSend(v8, "titleControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", v12, v31);
    objc_msgSend(v6, "setTitleRect:");

    objc_msgSend(v8, "centerBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_viewForOverlayRects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", v14, v31);
    objc_msgSend(v6, "setCenterItemsRect:");

    objc_msgSend(v8, "trailingBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_viewForOverlayRects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", v16, v31);
    objc_msgSend(v6, "setTrailingItemsRect:");

    objc_msgSend(v8, "tabBarContentGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView _overlayRectForGuide:inTargetView:](self, "_overlayRectForGuide:inTargetView:", v17, v31);
    objc_msgSend(v6, "setFloatingTabBarRect:");

    staticNavBarButtonItem = self->_staticNavBarButtonItem;
    v19 = (double *)MEMORY[0x1E0C9D628];
    if (staticNavBarButtonItem && !-[UIBarButtonItem _isFloating](staticNavBarButtonItem, "_isFloating"))
    {
      -[_UINavigationBarContentView _overlayRectForView:inTargetView:](self, "_overlayRectForView:inTargetView:", self->_staticNavBarButton, v31);
      v20 = v24;
      v21 = v25;
      v22 = v26;
      v23 = v27;
    }
    else
    {
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
    }
    if (self->_staticNavBarButtonTrailing)
    {
      objc_msgSend(v6, "setLeadingStaticItemRect:", *v19, v19[1], v19[2], v19[3]);
    }
    else
    {
      objc_msgSend(v6, "setLeadingStaticItemRect:", v20, v21, v22, v23);
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
    }
    objc_msgSend(v6, "setTrailingStaticItemRect:", v20, v21, v22, v23);
    v28 = objc_msgSend(v8, "titleAlignment");
    switch(v28)
    {
      case 2:
        if (objc_msgSend(v8, "showTitleWithTabBar"))
        {
          objc_msgSend(v8, "tabBarContentGuide");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
            v29 = 3;
          else
            v29 = 0;
          goto LABEL_19;
        }
        break;
      case 1:
        v29 = 2;
        goto LABEL_19;
      case 0:
        v29 = 1;
LABEL_19:
        objc_msgSend(v6, "setTitleLocation:", v29);
        goto LABEL_20;
    }
    v29 = 0;
    goto LABEL_19;
  }
LABEL_20:

}

- (CGRect)_overlayRectForView:(id)a3 inTargetView:(id)a4
{
  id v6;
  id v7;
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
  double v19;
  CGRect result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  -[_UINavigationBarContentView _overlayRectForFrame:inView:inTargetView:](self, "_overlayRectForFrame:inView:inTargetView:", v7, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_layoutForAugmentedTitleView:(id)a3
{
  id v4;
  _UINavigationBarContentViewLayout *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = self->_layout;
  if (!v5)
  {
    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 160);
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "augmentedTitleView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    transitionContext = self->_transitionContext;
    if (v10 == v4)
    {
      -[_UINavigationBarTransitionContext toLayout](transitionContext, "toLayout");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UINavigationBarTransitionContext fromLayout](transitionContext, "fromLayout");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = *(void **)(v12 + 160);
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v15, "augmentedTitleView");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v4)
      {
        v5 = 0;
        goto LABEL_14;
      }
      -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    if (v17)
      v19 = *(void **)(v17 + 160);
    else
      v19 = 0;
    v5 = v19;

  }
LABEL_14:

  return v5;
}

- (void)_configureBackButton:(id)a3
{
  UIBarButtonItem *backButtonItem;
  UIBarButtonItem *v5;
  UIBarButtonItem *backActionItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  id v11;

  v11 = a3;
  backButtonItem = self->_backButtonItem;
  if (backButtonItem || self->_backAction)
  {
    v5 = backButtonItem;
    if (self->_backButtonItem || !self->_backAction)
    {
      backActionItem = self->_backActionItem;
      self->_backActionItem = 0;
    }
    else
    {
      v7 = self->_backActionItem;
      if (v7)
      {
        -[UIBarButtonItem setPrimaryAction:](v7, "setPrimaryAction:");
      }
      else
      {
        v8 = -[UIBarButtonItem initWithPrimaryAction:]([UIBarButtonItem alloc], "initWithPrimaryAction:", self->_backAction);
        v9 = self->_backActionItem;
        self->_backActionItem = v8;

      }
      v10 = self->_backActionItem;
      backActionItem = v5;
      v5 = v10;
    }

    if (self->_toolbarStyle == 2)
      objc_msgSend(v11, "configureBreadcrumbBackButtonFromBarItem:withAppearanceDelegate:", v5, self);
    else
      objc_msgSend(v11, "configureBackButtonFromBarItem:withAppearanceDelegate:", v5, self);

  }
}

- (void)updateAugmentedTitleViewNavigationBarTraitsTo:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[_UINavigationBarContentViewLayout setAugmentedTitleNavigationBarTraits:](self->_layout, "setAugmentedTitleNavigationBarTraits:", v9);
  -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "_navigationBarTraitCollectionDidChangeTo:from:", v9, v6);

}

- (void)titleViewChangedHeight:(id)a3
{
  -[_UINavigationBarContentViewLayout updateAugmentedTitleViewHeight](self->_layout, "updateAugmentedTitleViewHeight", a3);
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right;
  double left;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  right = a3.right;
  left = a3.left;
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarContentView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v12, sel__safeAreaInsetsDidChangeFromOldInsets_, a3.top, a3.left, a3.bottom);
  -[_UINavigationBarContentView _updateLayoutMarginsForLayout:](self, "_updateLayoutMarginsForLayout:", self->_layout);
  if (-[_UINavigationBarContentView isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self, "isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange")&& !-[_UINavigationBarContentView _backButtonLayoutGuideIncludesFullyHiddenConstant](self, "_backButtonLayoutGuideIncludesFullyHiddenConstant"))
  {
    v6 = -[_UINavigationBarContentView _isStaticNavBarButtonOnRight](self, "_isStaticNavBarButtonOnRight");
    -[UIView safeAreaInsets](self, "safeAreaInsets");
    v9 = v8 - left;
    if (v6)
      v10 = v7 - right;
    else
      v10 = v9;
    -[NSLayoutConstraint constant](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "constant");
    -[NSLayoutConstraint setConstant:](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "setConstant:", v10 + v11);
  }
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 4) & 1;
}

- (void)titleViewChangedDisplayItemAlpha:(id)a3
{
  -[_UINavigationBarContentViewLayout updateAlphas](self->_layout, "updateAlphas", a3);
}

- (void)resolvedHeightDidChange
{
  __int16 navigationBarContentViewFlags;
  id WeakRetained;
  _QWORD block[5];

  if (self->_layout)
  {
    navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 2) == 0)
    {
      if ((navigationBarContentViewFlags & 1) != 0)
      {
        *(_WORD *)&self->_navigationBarContentViewFlags = navigationBarContentViewFlags | 2;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54___UINavigationBarContentView_resolvedHeightDidChange__block_invoke;
        block[3] = &unk_1E16B1B28;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "navigationBarContentViewDidChangeDesiredHeight:", self);

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTitleAttributes, 0);
  objc_storeStrong((id *)&self->_additionalItems, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_dci_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarGroup, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_trailingBarGroups, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_centerBarGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonItem, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentCompletions, 0);
  objc_storeStrong((id *)&self->_currentAnimations, 0);
  objc_storeStrong((id *)&self->_hostedTabBarConstraints, 0);
  objc_storeStrong((id *)&self->_hostedTabBarGuide, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuideHorizEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonVerticalAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonXPositionConstraint, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_staticNavBarButton, 0);
  objc_storeStrong((id *)&self->_backActionItem, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
}

- (void)setNeedsStaticNavBarButtonUpdate
{
  *(_WORD *)&self->_navigationBarContentViewFlags |= 4u;
  -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (int64_t)currentContentSize
{
  if (self->_layout)
    return -[_UINavigationBarContentViewLayout requestedContentSize](self->_layout, "requestedContentSize");
  else
    return self->_requestedContentSize;
}

- (void)_ensureHostedTabBarConstraintsWithUpdateBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  int *v5;
  UILayoutGuide *v6;
  UILayoutGuide *hostedTabBarGuide;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *hostedTabBarConstraints;
  UILayoutGuide *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
  if (!self->_hostedTabBarGuide)
  {
    v6 = objc_alloc_init(UILayoutGuide);
    hostedTabBarGuide = self->_hostedTabBarGuide;
    self->_hostedTabBarGuide = v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TabBarGuide(%p)"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide setIdentifier:](self->_hostedTabBarGuide, "setIdentifier:", v8);

    -[UILayoutGuide leftAnchor](self->_hostedTabBarGuide, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    -[UILayoutGuide topAnchor](self->_hostedTabBarGuide, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    -[UILayoutGuide widthAnchor](self->_hostedTabBarGuide, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v13;
    -[UILayoutGuide heightAnchor](self->_hostedTabBarGuide, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    hostedTabBarConstraints = self->_hostedTabBarConstraints;
    self->_hostedTabBarConstraints = v16;

    v5 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
  }
  if (v4)
    v4[2](v4, *(Class *)((char *)&self->super.super.super.super.isa + v5[123]));
  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0)
  {
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_hostedTabBarGuide);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + v5[123]));
    v18 = self->_hostedTabBarGuide;
  }
  else
  {
    v18 = 0;
  }
  -[_UINavigationBarContentViewLayout setTabBarContentGuide:](self->_layout, "setTabBarContentGuide:", v18);

}

- (BOOL)hostedTabBarEnabled
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 9) & 1;
}

- (void)setHostedTabBarEnabled:(BOOL)a3
{
  __int16 navigationBarContentViewFlags;
  __int16 v4;

  navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
  if (((((navigationBarContentViewFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 512;
    else
      v4 = 0;
    *(_WORD *)&self->_navigationBarContentViewFlags = navigationBarContentViewFlags & 0xFDFF | v4;
    -[_UINavigationBarContentView _ensureHostedTabBarConstraintsWithUpdateBlock:](self, "_ensureHostedTabBarConstraintsWithUpdateBlock:", 0);
  }
}

- (CGRect)hostedTabBarFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[_UINavigationBarContentView _ensureHostedTabBarConstraintsWithUpdateBlock:](self, "_ensureHostedTabBarConstraintsWithUpdateBlock:", 0);
  -[NSArray objectAtIndexedSubscript:](self->_hostedTabBarConstraints, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constant");
  v5 = v4;
  -[NSArray objectAtIndexedSubscript:](self->_hostedTabBarConstraints, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;
  -[NSArray objectAtIndexedSubscript:](self->_hostedTabBarConstraints, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constant");
  v11 = v10;
  -[NSArray objectAtIndexedSubscript:](self->_hostedTabBarConstraints, "objectAtIndexedSubscript:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  v14 = v13;

  v15 = v5;
  v16 = v8;
  v17 = v11;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setHostedTabBarFrame:(CGRect)a3
{
  _QWORD v3[4];
  CGRect v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52___UINavigationBarContentView_setHostedTabBarFrame___block_invoke;
  v3[3] = &__block_descriptor_64_e17_v16__0__NSArray_8l;
  v4 = a3;
  -[_UINavigationBarContentView _ensureHostedTabBarConstraintsWithUpdateBlock:](self, "_ensureHostedTabBarConstraintsWithUpdateBlock:", v3);
}

- (BOOL)wantsHostedTabBarMetrics
{
  return -[_UINavigationBarContentViewLayout wantsHostedTabBarMetrics](self->_layout, "wantsHostedTabBarMetrics");
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
  -[_UINavigationBarContentViewLayout setWantsHostedTabBarMetrics:](self->_layout, "setWantsHostedTabBarMetrics:", a3);
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_navigationBarContentViewFlags = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFFBF | v3;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 6) & 1;
}

- (BOOL)staticNavBarButtonLingers
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 7) & 1;
}

- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  __int16 navigationBarContentViewFlags;

  if (self->_staticNavBarButton)
  {
    navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 0x10) == 0)
    {
      *(_WORD *)&self->_navigationBarContentViewFlags = navigationBarContentViewFlags | 0x30;
      -[_UINavigationBarContentView _updateNavItemContentLayoutGuideEdgeConstraints](self, "_updateNavItemContentLayoutGuideEdgeConstraints");
    }
  }
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  double v3;
  double v4;
  double v5;

  -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton");
  v4 = v3;
  -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton");
  return v4 - v5;
}

- (BOOL)_backButtonLayoutGuideIncludesFullyHiddenConstant
{
  void *v2;
  BOOL v3;
  CGRect v5;

  -[_UINavigationBarContentViewLayout backButtonGuide](self->_layout, "backButtonGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutFrame");
  v3 = CGRectGetWidth(v5) != 0.0;

  return v3;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  double v5;
  double v6;
  double v7;
  void *v10;

  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x10) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentView.m"), 384, CFSTR("Must send -beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange first"));

  }
  if (!-[_UINavigationBarContentView _backButtonLayoutGuideIncludesFullyHiddenConstant](self, "_backButtonLayoutGuideIncludesFullyHiddenConstant"))
  {
    -[_UINavigationBarContentView _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton](self, "_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton");
    a3 = v5 + a3;
  }
  -[NSLayoutConstraint constant](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "constant");
  v7 = v6;
  -[NSLayoutConstraint setConstant:](self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, "setConstant:", a3);
  return v7 != a3;
}

- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  __int16 navigationBarContentViewFlags;

  navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
  if ((navigationBarContentViewFlags & 0x10) != 0)
  {
    *(_WORD *)&self->_navigationBarContentViewFlags = navigationBarContentViewFlags & 0xFFEF;
    -[_UINavigationBarContentView _updateNavItemContentLayoutGuideEdgeConstraints](self, "_updateNavItemContentLayoutGuideEdgeConstraints");
  }
}

- (BOOL)_isStaticNavBarButtonOnRight
{
  return -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ self->_staticNavBarButtonTrailing;
}

- (double)_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton
{
  double MaxX;
  CGRect v5;
  CGRect v6;
  CGRect v7;

  if (-[_UINavigationBarContentView _isStaticNavBarButtonOnRight](self, "_isStaticNavBarButtonOnRight"))
  {
    -[UIView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v5);
    -[UIView frame](self->_staticNavBarButton, "frame");
    return MaxX - CGRectGetMinX(v6);
  }
  else
  {
    -[UIView frame](self->_staticNavBarButton, "frame");
    return CGRectGetMaxX(v7);
  }
}

- (double)_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton
{
  void *v3;
  double result;
  _BOOL4 staticNavBarButtonTrailing;
  double v6;
  double v7;

  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0.0;
  if (!v3)
  {
    staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
    -[_UINavigationBarContentViewLayout layoutMargins](self->_layout, "layoutMargins", 0.0);
    if (staticNavBarButtonTrailing)
      return v7;
    else
      return v6;
  }
  return result;
}

- (void)__backButtonAction:(id)a3
{
  UIAction *backAction;
  id WeakRetained;

  backAction = self->_backAction;
  if (backAction)
  {
    -[UIAction performWithSender:target:](backAction, "performWithSender:target:", 0, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationBarContentViewDidTriggerBackAction:fromBackButtonItem:", self, self->_backButtonItem);

  }
}

- (double)_resolvedInlineTitleViewAlpha
{
  double v3;

  v3 = 1.0;
  if (-[_UINavigationBarContentView hostedTabBarEnabled](self, "hostedTabBarEnabled")
    && -[_UINavigationBarContentView isHostedTabBarVisible](self, "isHostedTabBarVisible"))
  {
    if (-[_UINavigationBarContentView showTitleWithTabBar](self, "showTitleWithTabBar"))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  return v3 * self->_inlineTitleViewAlpha;
}

- (void)_updateTitleAlignment
{
  uint64_t v3;

  if (-[_UINavigationBarContentView _useLeadingAlignedTitle](self, "_useLeadingAlignedTitle"))
    v3 = 1;
  else
    v3 = *((_BYTE *)&self->_navigationBarContentViewFlags + 1) & 2;
  -[_UINavigationBarContentViewLayout setTitleAlignment:](self->_layout, "setTitleAlignment:", v3);
}

- (BOOL)_showTitleWithTabBar
{
  BOOL v2;
  UIView *titleView;
  void *v5;

  if (self->_showTitleWithTabBar)
  {
    if (self->_hostedTabBarVisibilityAffectsTitle)
      return self->_isHostedTabBarVisible;
    return 1;
  }
  if (self->_titleMenuProvider)
    return 1;
  titleView = self->_titleView;
  if (!titleView)
    return 0;
  _UINavigationBarCastToAugmentedTitleView(titleView);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5 == 0;

  return v2;
}

- (double)_intrinsicHeight
{
  _UINavigationBarContentViewLayout *layout;
  double result;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v19;

  layout = self->_layout;
  if (layout)
  {
    -[_UINavigationBarContentViewLayout preferredHeight](layout, "preferredHeight");
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (transitionContext)
    {
      -[_UINavigationBarTransitionContext fromLayout](transitionContext, "fromLayout");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = *(void **)(v6 + 160);
      else
        v8 = 0;
      v9 = v8;
      objc_msgSend(v9, "preferredHeight");
      v11 = v10;

      -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = *(void **)(v12 + 160);
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v15, "preferredHeight");
      v17 = v16;

      if (v11 >= v17)
        return v11;
      else
        return v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentView.m"), 1041, CFSTR("Cannot determine content view height"));

      return 0.0;
    }
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[_UINavigationBarContentView _intrinsicHeight](self, "_intrinsicHeight");
  v3 = v2;
  v4 = -1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[_UINavigationBarContentView _intrinsicHeight](self, "_intrinsicHeight", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  _UINavigationBarContentViewLayout *layout;
  id v5;
  id v6;

  layout = self->_layout;
  v5 = a3;
  -[_UINavigationBarContentViewLayout augmentedTitleView](layout, "augmentedTitleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    *(_WORD *)&self->_navigationBarContentViewFlags |= 1u;
    -[_UINavigationBarContentViewLayout updateAugmentedTitleViewHeight](self->_layout, "updateAugmentedTitleViewHeight");
    *(_WORD *)&self->_navigationBarContentViewFlags &= ~1u;
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  unint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentView.m"), 1093, CFSTR("Client error attempting to change layout margins of a private view"));

  }
  else
  {
    v5 = setLayoutMargins____s_category;
    if (!setLayoutMargins____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setLayoutMargins____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Client error attempting to change layout margins of a private view", buf, 2u);
    }
  }
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  unint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentView.m"), 1098, CFSTR("Client error attempting to change layout margins of a private view"));

  }
  else
  {
    v5 = setDirectionalLayoutMargins____s_category;
    if (!setDirectionalLayoutMargins____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setDirectionalLayoutMargins____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Client error attempting to change layout margins of a private view", buf, 2u);
    }
  }
}

- (void)updateAccessibilityContents:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAugmentedTitleView:", v7);

  }
  -[_UINavigationBarContentViewLayout tabBarContentGuide](self->_layout, "tabBarContentGuide");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        v10 = -[_UINavigationBarContentViewLayout showTitleWithTabBar](self->_layout, "showTitleWithTabBar"),
        v9,
        v10))
  {
    -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleView:", v11);

  }
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewsRepresentingBackButton:", v14);

  }
}

- (UIView)_effectiveTitleView
{
  void *v3;
  char isKindOfClass;
  _UINavigationBarContentViewLayout *layout;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;

  -[_UINavigationBarContentViewLayout augmentedTitleView](self->_layout, "augmentedTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  layout = self->_layout;
  if ((isKindOfClass & 1) != 0)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](layout, "augmentedTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UINavigationBarContentViewLayout tabBarContentGuide](layout, "tabBarContentGuide");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          v9 = -[_UINavigationBarContentViewLayout showTitleWithTabBar](self->_layout, "showTitleWithTabBar"),
          v8,
          !v9))
    {
      v6 = 0;
    }
    else
    {
      -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (UIView *)v6;
}

- (void)_addCoordinatedAnimation:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableArray *currentAnimations;
  void *v8;
  NSMutableArray *currentCompletions;
  void *v10;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (aBlock)
  {
    currentAnimations = self->_currentAnimations;
    v8 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](currentAnimations, "addObject:", v8);

  }
  if (v6)
  {
    currentCompletions = self->_currentCompletions;
    v10 = _Block_copy(v6);
    -[NSMutableArray addObject:](currentCompletions, "addObject:", v10);

  }
}

- (void)_clearAllAnimations
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_currentAnimations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v6 = (void (**)(_QWORD))_Block_copy(*(const void **)(*((_QWORD *)&v21 + 1) + 8 * v8));

        v6[2](v6);
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_currentCompletions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v10);
        v13 = _Block_copy(*(const void **)(*((_QWORD *)&v17 + 1) + 8 * v15));

        (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);

  }
  -[_UINavigationBarContentViewLayout setKeepsSnapshotsInHierarchy:](self->_layout, "setKeepsSnapshotsInHierarchy:", 0, (_QWORD)v17);
  -[_UINavigationBarContentViewLayout removeAllSnapshots](self->_layout, "removeAllSnapshots");
  -[NSMutableArray removeAllObjects](self->_currentAnimations, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_currentCompletions, "removeAllObjects");
}

- (void)recordFromStateForTransition:(id)a3
{
  _UINavigationBarContentViewLayout *layout;
  _UINavigationBarTransitionContext *v5;
  id *v6;
  _UINavigationBarContentViewLayout *v7;

  layout = self->_layout;
  v5 = (_UINavigationBarTransitionContext *)a3;
  -[_UINavigationBarTransitionContext fromLayout](v5, "fromLayout");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout setContentViewLayout:](v6, layout);

  -[_UINavigationBarContentViewLayout setKeepsSnapshotsInHierarchy:](self->_layout, "setKeepsSnapshotsInHierarchy:", 0);
  -[_UINavigationBarContentViewLayout removeAllSnapshots](self->_layout, "removeAllSnapshots");
  -[_UINavigationBarContentView _clearAssistants](self, "_clearAssistants");
  v7 = self->_layout;
  self->_layout = 0;

  self->_transitionContext = v5;
}

- (void)prepareToRecordToState:(id)a3
{
  _UINavigationBarContentViewLayout *v4;
  _UINavigationBarContentViewLayout *layout;
  _UINavigationBarTransitionContext *v6;

  v6 = (_UINavigationBarTransitionContext *)a3;
  v4 = -[_UINavigationBarContentView _newLayout](self, "_newLayout");
  if (!self->_transitionContext)
    -[_UINavigationBarContentViewLayout removeContent](self->_layout, "removeContent");
  self->_transitionContext = v6;
  layout = self->_layout;
  self->_layout = v4;

}

- (void)recordToStateForTransition:(id)a3
{
  _UINavigationBarContentViewLayout *layout;
  id *v5;
  _UINavigationBarContentViewLayout *v6;
  _UINavigationBarTransitionContext *v7;

  v7 = (_UINavigationBarTransitionContext *)a3;
  -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
  layout = self->_layout;
  -[_UINavigationBarTransitionContext toLayout](v7, "toLayout");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout setContentViewLayout:](v5, layout);

  self->_transitionContext = v7;
  -[_UINavigationBarContentViewLayout setKeepsSnapshotsInHierarchy:](self->_layout, "setKeepsSnapshotsInHierarchy:", 0);
  -[_UINavigationBarContentViewLayout removeAllSnapshots](self->_layout, "removeAllSnapshots");
  v6 = self->_layout;
  self->_layout = 0;

}

- (void)ensureBackButtonTruncationOccursWithContext:(id)a3
{
  _UINavigationBarContentViewLayout **p_layout;
  _UINavigationBarContentViewLayout *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  _UINavigationBarContentViewLayout *v18;
  id v19;

  p_layout = &self->_layout;
  v6 = self->_layout;
  objc_msgSend(a3, "toLayout");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 160);
  else
    v9 = 0;
  objc_storeStrong((id *)p_layout, v9);

  -[_UINavigationBarContentViewLayout backButton](*p_layout, "backButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "currentTitle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[_UINavigationBarContentViewLayout backButton](*p_layout, "backButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v16 = v15;
      v17 = _minimumBackButtonWidth((id *)&self->super.super.super.super.isa);

      if (v16 > v17)
        -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
    }
  }
  v18 = *p_layout;
  *p_layout = v6;

}

- (void)clearTransitionContext
{
  _UINavigationBarContentViewLayout *v3;
  _UINavigationBarContentViewLayout *layout;

  if (self->_transitionContext)
  {
    if (!self->_layout)
    {
      v3 = -[_UINavigationBarContentViewLayout initWithContentView:]([_UINavigationBarContentViewLayout alloc], "initWithContentView:", self);
      layout = self->_layout;
      self->_layout = v3;

    }
    self->_transitionContext = 0;
  }
}

- (void)adoptLayout:(id)a3
{
  _UINavigationBarContentViewLayout *v6;
  _UINavigationBarContentViewLayout *layout;
  void *v8;
  _UINavigationBarContentViewLayout *v9;

  v6 = (_UINavigationBarContentViewLayout *)a3;
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentView.m"), 1490, CFSTR("Cannot adopt a nil layout!"));

    v6 = 0;
  }
  self->_transitionContext = 0;
  layout = v6;
  if (self->_layout != v6)
  {
    -[_UINavigationBarContentViewLayout removeContent](self->_layout, "removeContent");
    objc_storeStrong((id *)&self->_layout, a3);
    layout = self->_layout;
  }
  -[_UINavigationBarContentViewLayout setActive:contentView:](layout, "setActive:contentView:", 1, self);
  -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);

}

- (void)adoptNewLayout
{
  _UINavigationBarContentViewLayout *v3;
  _UINavigationBarContentViewLayout *layout;

  if (!self->_layout)
  {
    v3 = -[_UINavigationBarContentView _newLayout](self, "_newLayout");
    layout = self->_layout;
    self->_layout = v3;

    -[_UINavigationBarContentViewLayout setActive:contentView:](self->_layout, "setActive:contentView:", 1, self);
    -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
  }
}

- (void)relinquishLayout
{
  _UINavigationBarContentViewLayout *layout;

  -[_UINavigationBarContentViewLayout removeContent](self->_layout, "removeContent");
  layout = self->_layout;
  self->_layout = 0;

}

- (BOOL)isRTL
{
  uint64_t v3;
  void *v4;
  _UINavigationBarContentView *v5;
  _UINavigationBarContentView *v6;
  uint64_t v7;

  -[UIView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (_UINavigationBarContentView *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = -[UIView effectiveUserInterfaceLayoutDirection](v6, "effectiveUserInterfaceLayoutDirection");
  return v7 == 1;
}

- (void)setBackIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_backIndicatorImage, a3);
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return -[_UINavigationBarContentViewLayout plainItemAppearance](self->_layout, "plainItemAppearance");
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return -[_UINavigationBarContentViewLayout doneItemAppearance](self->_layout, "doneItemAppearance");
}

- (_UIBarButtonItemData)backButtonAppearance
{
  return -[_UINavigationBarContentViewLayout backButtonAppearance](self->_layout, "backButtonAppearance");
}

- (CGRect)_overlayRectForFrame:(CGRect)a3 inView:(id)a4 inTargetView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  double v12;
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
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = a5;
  if (v10
    && (v24.origin.x = x, v24.origin.y = y, v24.size.width = width, v24.size.height = height, !CGRectIsEmpty(v24)))
  {
    objc_msgSend(v10, "convertRect:toView:", v11, x, y, width, height);
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_overlayRectForGuide:(id)a3 inTargetView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  double v27;
  double v28;
  CGRect result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "owningView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UINavigationBarContentView _overlayRectForFrame:inView:inTargetView:](self, "_overlayRectForFrame:inView:inTargetView:", v16, v6, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)titleViewLargeTitleHeight:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "largeTitleHeight");
  v5 = v4;

  return v5;
}

- (double)titleViewFloatingTabBarHeight:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarExtension");
  v5 = v4;

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)titleViewLargeTitleHeightRange:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "largeTitleHeightRange");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)titleViewContentBaselineOffsetFromTop:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baselineOffsetFromTop");
  v7 = v6;

  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v4, 0.0, v7);
  v9 = v8;

  return v9;
}

- (double)titleViewContentBaseHeight:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseHeight");
  v5 = v4;

  return v5;
}

- (void)titleViewChangedTabBarSizingDisposition:(id)a3
{
  -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
}

- (void)titleViewChangedLayout:(id)a3
{
  -[_UINavigationBarContentViewLayout updateAugmentedTitleViewLayout](self->_layout, "updateAugmentedTitleViewLayout", a3);
}

- (void)titleViewChangedStandardDisplayItems:(id)a3
{
  -[_UINavigationBarContentView updateContentAnimated:](self, "updateContentAnimated:", 0);
  -[_UINavigationBarContentViewLayout updateAugmentedTitleViewHeight](self->_layout, "updateAugmentedTitleViewHeight");
}

- (void)titleViewChangedPreferredDisplaySize:(id)a3
{
  -[_UINavigationBarContentViewLayout setRequestedContentSize:](self->_layout, "setRequestedContentSize:", -[_UINavigationBarContentView _currentContentSize](self, "_currentContentSize", a3));
}

- (void)titleViewChangedMaximumBackButtonWidth:(id)a3
{
  -[_UINavigationBarContentViewLayout updateAugmentedTitleViewBackButtonConstraints](self->_layout, "updateAugmentedTitleViewBackButtonConstraints", a3);
}

- (id)titleViewBackButtonMenu:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[_UINavigationBarContentView _layoutForAugmentedTitleView:](self, "_layoutForAugmentedTitleView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "backButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonContextMenuInteractionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "actionProvider");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, MEMORY[0x1E0C9AA60]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  if (self->_backButtonItem == a3)
  {
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v12 = v13 == 0;
    if (v13)
      objc_msgSend(v13, "addSymbolEffect:options:animated:", v10, v11, v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  if (self->_backButtonItem == a3)
  {
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v12 = v13 == 0;
    if (v13)
      objc_msgSend(v13, "removeSymbolEffectOfType:options:animated:", v10, v11, v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  if (self->_backButtonItem == a3)
  {
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = v10 == 0;
    if (v10)
      objc_msgSend(v10, "removeAllSymbolEffectsWithOptions:animated:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (self->_backButtonItem == a3)
  {
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "applyContentTransition:options:", v11, v8);

  }
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int v8;
  UIAccessibilityHUDItem *v9;
  void *v10;
  void *v11;
  int v12;
  UIBarButtonItem *v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  if (self->_inlineTitleViewAlpha <= 0.0)
    goto LABEL_15;
  if (!-[NSString length](self->_title, "length"))
    goto LABEL_15;
  -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarContentViewLayout titleControl](self->_layout, "titleControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v8 = objc_msgSend(v6, "pointInside:withEvent:", 0);

  if (!v8)
  {
LABEL_15:
    if (self->_backButtonHidden)
      goto LABEL_9;
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
    v12 = objc_msgSend(v10, "pointInside:withEvent:", 0);

    if (!v12)
    {
LABEL_9:
      -[_UINavigationBarContentView _accessibility_barButtonItemAtPoint:](self, "_accessibility_barButtonItemAtPoint:", x, y);
      v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      v14 = -[UIBarButtonItem _showsChevron](v13, "_showsChevron");
      if (!v13)
        goto LABEL_8;
    }
    else
    {
      v13 = self->_backButtonItem;
      v14 = 1;
      if (!v13)
      {
LABEL_8:
        v9 = 0;
LABEL_11:

        return v9;
      }
    }
    +[UIAccessibilityHUDItem HUDItemForBarButtonItem:atPoint:inView:isBackButton:](UIAccessibilityHUDItem, "HUDItemForBarButtonItem:atPoint:inView:isBackButton:", v13, self, v14, x, y);
    v9 = (UIAccessibilityHUDItem *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_title, 0, 0.0, 0.0, 0.0, 0.0);
  return v9;
}

- (id)_accessibility_barButtonItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  UIBarButtonItem *staticNavBarButtonItem;
  _UIButtonBarButton *staticNavBarButton;
  UIBarButtonItem *v8;
  _UINavigationBarContentViewLayout *layout;
  void *v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  if (staticNavBarButtonItem
    && !-[UIBarButtonItem isHidden](staticNavBarButtonItem, "isHidden")
    && (staticNavBarButton = self->_staticNavBarButton,
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", staticNavBarButton, x, y),
        -[UIView pointInside:withEvent:](staticNavBarButton, "pointInside:withEvent:", 0)))
  {
    v8 = self->_staticNavBarButtonItem;
  }
  else
  {
    layout = self->_layout;
    if (layout)
    {
      -[_UINavigationBarContentViewLayout leadingBar](layout, "leadingBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemAtPoint:inView:", self, x, y);
      v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[_UINavigationBarContentViewLayout centerBar](self->_layout, "centerBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemAtPoint:inView:", self, x, y);
        v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          -[_UINavigationBarContentViewLayout trailingBar](self->_layout, "trailingBar");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "itemAtPoint:inView:", self, x, y);
          v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  y = a3.y;
  x = a3.x;
  if (self->_backButtonHidden)
  {
LABEL_6:
    -[_UINavigationBarContentView _accessibility_barButtonItemAtPoint:](self, "_accessibility_barButtonItemAtPoint:", x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_accessibilityShouldActivateOnHUDLift");

      if (v14)
      {
        objc_msgSend(v11, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        return v10;
      }
    }
    else
    {

    }
    v10 = 0;
    goto LABEL_11;
  }
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  if ((objc_msgSend(v6, "pointInside:withEvent:", 0) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_accessibilityShouldActivateOnHUDLift");

  if (!v9)
    goto LABEL_6;
  -[_UINavigationBarContentViewLayout backButton](self->_layout, "backButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarContentView;
  -[UIView description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    -[_UINavigationBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 160);
    else
      v8 = 0;
    v9 = v8;
    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(void **)(v10 + 160);
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v4, "appendFormat:", CFSTR(" transitionContext=%p fromLayout=%p toLayout=%p"), transitionContext, v9, v13);

  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" layout=%p"), self->_layout);
  }
  return (NSString *)v4;
}

- (UIBarButtonItem)backButtonItem
{
  return self->_backButtonItem;
}

- (BOOL)backButtonHidden
{
  return self->_backButtonHidden;
}

- (UIBarButtonItem)staticNavBarButtonItem
{
  return self->_staticNavBarButtonItem;
}

- (BOOL)isStaticNavBarButtonTrailing
{
  return self->_staticNavBarButtonTrailing;
}

- (NSArray)leadingBarButtonItems
{
  return self->_leadingBarButtonItems;
}

- (BOOL)leadingItemsSupplementBackItem
{
  return self->_leadingItemsSupplementBackItem;
}

- (NSArray)centerBarGroups
{
  return self->_centerBarGroups;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (NSArray)trailingBarButtonItems
{
  return self->_trailingBarButtonItems;
}

- (UIBarButtonItemGroup)fixedTrailingGroup
{
  return self->_fixedTrailingGroup;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup
{
  return self->_inlineSearchBarGroup;
}

- (BOOL)placeInlineSearchBarInCenter
{
  return self->_placeInlineSearchBarInCenter;
}

- (double)inlineTitleViewAlpha
{
  return self->_inlineTitleViewAlpha;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (UIOffset)titlePositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_titlePositionAdjustment.horizontal;
  vertical = self->_titlePositionAdjustment.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (double)overrideSize
{
  return self->_overrideSize;
}

- (BOOL)allowLeadingAlignedLargeTitle
{
  return self->_allowLeadingAlignedLargeTitle;
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (_UINavigationItemRenameHandler)dci_renameHandler
{
  return self->_dci_renameHandler;
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (BOOL)enableAlternatePopItem
{
  return self->_enableAlternatePopItem;
}

- (UIDeferredMenuElement)additionalItems
{
  return self->_additionalItems;
}

- (BOOL)isHostedTabBarVisible
{
  return self->_isHostedTabBarVisible;
}

- (void)setIsHostedTabBarVisible:(BOOL)a3
{
  self->_isHostedTabBarVisible = a3;
}

- (BOOL)hostedTabBarVisibilityAffectsTitle
{
  return self->_hostedTabBarVisibilityAffectsTitle;
}

- (void)setHostedTabBarVisibilityAffectsTitle:(BOOL)a3
{
  self->_hostedTabBarVisibilityAffectsTitle = a3;
}

- (BOOL)showTitleWithTabBar
{
  return self->_showTitleWithTabBar;
}

- (void)setShowTitleWithTabBar:(BOOL)a3
{
  self->_showTitleWithTabBar = a3;
}

- (BOOL)useInlineLargeTitleMetrics
{
  return self->_useInlineLargeTitleMetrics;
}

- (void)setUseInlineLargeTitleMetrics:(BOOL)a3
{
  self->_useInlineLargeTitleMetrics = a3;
}

- (BOOL)hasLeadingInsetFromTideBar
{
  return self->_hasLeadingInsetFromTideBar;
}

- (void)setHasLeadingInsetFromTideBar:(BOOL)a3
{
  self->_hasLeadingInsetFromTideBar = a3;
}

- (NSDictionary)effectiveTitleAttributes
{
  return self->_effectiveTitleAttributes;
}

@end
