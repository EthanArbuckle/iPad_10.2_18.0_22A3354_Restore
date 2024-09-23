@implementation PLPillControl

- (PLPillControl)init
{
  return -[PLPillControl initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, 0);
}

- (PLPillControl)initWithLeadingAccessoryView:(id)a3
{
  return -[PLPillControl initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", a3, 0);
}

- (PLPillControl)initWithTrailingAccessoryView:(id)a3
{
  return -[PLPillControl initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, a3);
}

- (PLPillControl)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  PLPillControl *v6;
  PLPillControl *v7;
  void *v8;
  uint64_t v9;
  NSString *preferredContentSizeCategory;
  void *v11;
  PLPillContentView *v12;
  PLPillContentView *contentView;
  void *v14;
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
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;
  void *v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PLPillControl;
  v6 = -[PLPillControl initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_adjustsFontForContentSizeCategory = 1;
    -[PLPillControl traitCollection](v6, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    preferredContentSizeCategory = v7->_preferredContentSizeCategory;
    v7->_preferredContentSizeCategory = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillControl setBackgroundColor:](v7, "setBackgroundColor:", v11);

    -[PLPillControl _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:", 8.0);
    v12 = -[PLPillContentView initWithLeadingAccessoryView:trailingAccessoryView:]([PLPillContentView alloc], "initWithLeadingAccessoryView:trailingAccessoryView:", v33, v34);
    contentView = v7->_contentView;
    v7->_contentView = v12;

    -[PLPillContentView setUserInteractionEnabled:](v7->_contentView, "setUserInteractionEnabled:", 0);
    -[PLPillContentView setAdjustsFontForContentSizeCategory:](v7->_contentView, "setAdjustsFontForContentSizeCategory:", v7->_adjustsFontForContentSizeCategory);
    -[PLPillControl addSubview:](v7, "addSubview:", v7->_contentView);
    -[PLPillContentView leadingAnchor](v7->_contentView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillControl leadingAnchor](v7, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v30;
    -[PLPillContentView trailingAnchor](v7->_contentView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillControl trailingAnchor](v7, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v16;
    -[PLPillContentView topAnchor](v7->_contentView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillControl topAnchor](v7, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v19;
    -[PLPillContentView bottomAnchor](v7->_contentView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillControl bottomAnchor](v7, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v23, "userInterfaceIdiom") == 1;

    if ((_DWORD)v18)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v7);
      -[PLPillControl addInteraction:](v7, "addInteraction:", v24);

    }
    objc_initWeak(&location, v7);
    objc_opt_self();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __68__PLPillControl_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke;
    v35[3] = &unk_1E91D3658;
    objc_copyWeak(&v36, &location);
    v27 = (id)-[PLPillControl registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v26, v35);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __68__PLPillControl_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    if (WeakRetained[472])
    {
      objc_msgSend(WeakRetained, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v5[60];
      v5[60] = v7;

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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPillControl;
  -[PLPillControl layoutSubviews](&v3, sel_layoutSubviews);
  -[PLPillControl _configureShadowNecessary](self, "_configureShadowNecessary");
  -[PLPillContentView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v3 = a3;
  if (-[PLPillControl isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLPillControl;
    -[PLPillControl setHighlighted:](&v7, sel_setHighlighted_, v3);
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled")
      && (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock") & 1) == 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__PLPillControl_setHighlighted___block_invoke;
      v5[3] = &unk_1E91D3188;
      v5[4] = self;
      v6 = v3;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 6, v5, 0, 0.0, 0.0);
    }
    else
    {
      -[PLPillControl _performHighlight:](self, "_performHighlight:", v3);
    }
  }
}

uint64_t __32__PLPillControl_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performHighlight:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory
      && -[PLPillContentView adjustsFontForContentSizeCategory](self->_contentView, "adjustsFontForContentSizeCategory");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[PLPillControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v3 = -[PLPillContentView adjustForContentSizeCategoryChange](self->_contentView, "adjustForContentSizeCategoryChange");
    if (v3)
    {
      -[PLPillControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[PLPillControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PLPillControl setNeedsLayout](self, "setNeedsLayout");
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = (objc_class *)MEMORY[0x1E0CEA8B8];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  v8 = (void *)MEMORY[0x1E0CEA390];
  objc_msgSend(v6, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, 8.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisiblePath:", v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v7);
  objc_msgSend(MEMORY[0x1E0CEA848], "effectWithPreview:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_configureShadowNecessary
{
  float v2;
  id v3;
  double v4;
  id v5;

  -[PLPillControl layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowOpacity");
  if (fabsf(v2) < 2.2204e-16)
  {
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v3, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
    objc_msgSend(v5, "setShadowRadius:", 20.0);
    LODWORD(v4) = 1036831949;
    objc_msgSend(v5, "setShadowOpacity:", v4);
  }

}

- (void)_performHighlight:(BOOL)a3
{
  id v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.94);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPillControl setBackgroundColor:](self, "setBackgroundColor:", v4);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
