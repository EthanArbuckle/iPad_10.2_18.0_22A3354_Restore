@implementation PLPillView

- (PLPillView)init
{
  return -[PLPillView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, 0);
}

- (PLPillView)initWithLeadingAccessoryView:(id)a3
{
  return -[PLPillView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", a3, 0);
}

- (PLPillView)initWithTrailingAccessoryView:(id)a3
{
  return -[PLPillView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, a3);
}

- (PLPillView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  PLPillView *v6;
  PLPillView *v7;
  void *v8;
  uint64_t v9;
  NSString *preferredContentSizeCategory;
  uint64_t v11;
  MTMaterialView *materialView;
  PLPillContentView *v13;
  PLPillContentView *contentView;
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
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  void *v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PLPillView;
  v6 = -[PLPillView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_adjustsFontForContentSizeCategory = 1;
    -[PLPillView traitCollection](v6, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    preferredContentSizeCategory = v7->_preferredContentSizeCategory;
    v7->_preferredContentSizeCategory = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:", 53, 8);
    v11 = objc_claimAutoreleasedReturnValue();
    materialView = v7->_materialView;
    v7->_materialView = (MTMaterialView *)v11;

    -[PLPillView addSubview:](v7, "addSubview:", v7->_materialView);
    v13 = -[PLPillContentView initWithLeadingAccessoryView:trailingAccessoryView:]([PLPillContentView alloc], "initWithLeadingAccessoryView:trailingAccessoryView:", v32, v33);
    contentView = v7->_contentView;
    v7->_contentView = v13;

    -[PLPillContentView setAdjustsFontForContentSizeCategory:](v7->_contentView, "setAdjustsFontForContentSizeCategory:", v7->_adjustsFontForContentSizeCategory);
    -[PLPillView addSubview:](v7, "addSubview:", v7->_contentView);
    -[PLPillContentView leadingAnchor](v7->_contentView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView leadingAnchor](v7, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    -[PLPillContentView trailingAnchor](v7->_contentView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView trailingAnchor](v7, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v17;
    -[PLPillContentView topAnchor](v7->_contentView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView topAnchor](v7, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v20;
    -[PLPillContentView bottomAnchor](v7->_contentView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView bottomAnchor](v7, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
    objc_initWeak(&location, v7);
    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __65__PLPillView_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke;
    v34[3] = &unk_1E91D3658;
    objc_copyWeak(&v35, &location);
    v26 = (id)-[PLPillView registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v25, v34);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __65__PLPillView_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[440])
    {
      objc_msgSend(WeakRetained, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v5[56];
      v5[56] = v7;

      objc_msgSend(v5, "adjustForContentSizeCategoryChange");
    }
    objc_msgSend(MEMORY[0x1E0CEABB8], "bs_nextViewControllerForView:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v10, v5);

  }
}

- (UIView)leadingAccessoryView
{
  return -[PLPillContentView leadingAccessoryView](self->_contentView, "leadingAccessoryView");
}

- (UIView)trailingAccessoryView
{
  return -[PLPillContentView trailingAccessoryView](self->_contentView, "trailingAccessoryView");
}

- (NSArray)centerContentItems
{
  return -[PLPillContentView centerContentItems](self->_contentView, "centerContentItems");
}

- (void)setCenterContentItems:(id)a3
{
  -[PLPillContentView setCenterContentItems:](self->_contentView, "setCenterContentItems:", a3);
}

- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4
{
  -[PLPillContentView setCenterContentItems:animated:](self->_contentView, "setCenterContentItems:animated:", a3, a4);
}

- (CGSize)sizeThatFitsContentItem:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PLPillContentView sizeThatFitsContentItem:](self->_contentView, "sizeThatFitsContentItem:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PLPillContentItem)referenceContentItemForIntrinsicContentSize
{
  return -[PLPillContentView referenceContentItemForIntrinsicContentSize](self->_contentView, "referenceContentItemForIntrinsicContentSize");
}

- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3
{
  -[PLPillContentView setReferenceContentItemForIntrinsicContentSize:](self->_contentView, "setReferenceContentItemForIntrinsicContentSize:", a3);
}

- (UIEdgeInsets)shadowOutsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[PLPillView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[MTShadowView shadowOutsets](self->_shadowView, "shadowOutsets");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4
{
  -[PLPillContentView updateCenterContentItem:withContentItem:](self->_contentView, "updateCenterContentItem:withContentItem:", a3, a4);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PLPillContentView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
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
  double v11;
  double v12;
  double v13;
  MTShadowView *shadowView;
  MTShadowView *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PLPillView;
  -[PLPillView layoutSubviews](&v16, sel_layoutSubviews);
  -[PLPillView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PLPillView _effectiveCornerRadius](self, "_effectiveCornerRadius");
  v12 = v11;
  -[MTMaterialView _continuousCornerRadius](self->_materialView, "_continuousCornerRadius");
  if (v13 != v12)
  {
    -[MTShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    -[PLPillView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
    -[MTMaterialView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:", v12);
  }
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v4, v6, v8, v10);
  v15 = self->_shadowView;
  -[MTShadowView frameWithContentWithFrame:](v15, "frameWithContentWithFrame:", v4, v6, v8, v10);
  -[MTShadowView setFrame:](v15, "setFrame:");
  -[PLPillContentView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  -[MTMaterialView setGroupNameBase:](self->_materialView, "setGroupNameBase:", a3);
}

- (NSString)materialGroupNameBase
{
  return (NSString *)-[MTMaterialView groupNameBase](self->_materialView, "groupNameBase");
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return (id)-[MTMaterialView visualStylingProviderForCategory:](self->_materialView, "visualStylingProviderForCategory:", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory
      && -[PLPillContentView adjustsFontForContentSizeCategory](self->_contentView, "adjustsFontForContentSizeCategory");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[PLPillView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v3 = -[PLPillContentView adjustForContentSizeCategoryChange](self->_contentView, "adjustForContentSizeCategoryChange");
    if (v3)
    {
      -[PLPillView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[PLPillView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PLPillView setNeedsLayout](self, "setNeedsLayout");
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (double)_effectiveCornerRadius
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  NSString *preferredContentSizeCategory;
  PLPillContentView *contentView;
  double v8;
  uint64_t v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *v12;
  NSString *v13;
  double v14;

  v3 = 432;
  -[PLPillContentView centerContentItems](self->_contentView, "centerContentItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (v5 > 1)
  {
    v8 = 1.0;
  }
  else
  {
    contentView = self->_contentView;
    objc_msgSend(v4, "lastObject");
    v3 = objc_claimAutoreleasedReturnValue();
    -[PLPillView bounds](self, "bounds");
    v8 = (double)-[PLPillContentView isWrappingRequiredForCenterContentItem:inBounds:](contentView, "isWrappingRequiredForCenterContentItem:inBounds:", v3);
  }
  v9 = *MEMORY[0x1E0CEB440];
  v10 = preferredContentSizeCategory;
  v11 = -[NSString isEqualToString:](v10, "isEqualToString:", v9);
  v12 = (NSString *)*MEMORY[0x1E0CEB420];
  if (!v11)
    v12 = v10;
  v13 = v12;

  if ((v5 > 1 || v8 != 0.0)
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3F8], v13) == NSOrderedAscending)
  {
    v14 = 20.0;
  }
  else
  {
    v14 = floor(PLContentViewHeightForContentSizeCategory(v13, v5, v8) * 0.5);
  }

  if (v5 <= 1)
  return v14;
}

- (void)_configureShadowViewIfNecessary
{
  id v3;
  MTShadowView *v4;
  MTShadowView *shadowView;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (!self->_shadowView)
  {
    v3 = objc_alloc(MEMORY[0x1E0D474A0]);
    -[PLPillView _effectiveCornerRadius](self, "_effectiveCornerRadius");
    v6 = 1065353216;
    v7 = xmmword_1D12ABCD0;
    v8 = 0x4039000000000000;
    v4 = (MTShadowView *)objc_msgSend(v3, "initWithShadowAttributes:maskCornerRadius:", &v6);
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    -[PLPillView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
