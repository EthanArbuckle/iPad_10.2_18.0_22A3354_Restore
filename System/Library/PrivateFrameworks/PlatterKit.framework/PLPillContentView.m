@implementation PLPillContentView

- (PLPillContentView)init
{
  return -[PLPillContentView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, 0);
}

- (PLPillContentView)initWithLeadingAccessoryView:(id)a3
{
  return -[PLPillContentView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", a3, 0);
}

- (PLPillContentView)initWithTrailingAccessoryView:(id)a3
{
  return -[PLPillContentView initWithLeadingAccessoryView:trailingAccessoryView:](self, "initWithLeadingAccessoryView:trailingAccessoryView:", 0, a3);
}

- (PLPillContentView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  _PLPillAccessoryWrapperView *v6;
  _PLPillAccessoryWrapperView *v7;
  PLPillContentView *v8;
  PLPillContentView *v9;
  void *v10;
  uint64_t v11;
  NSString *preferredContentSizeCategory;
  int v13;
  _PLPillAccessoryWrapperView *v14;
  int v15;
  _PLPillAccessoryWrapperView *v16;
  objc_super v18;

  v6 = (_PLPillAccessoryWrapperView *)a3;
  v7 = (_PLPillAccessoryWrapperView *)a4;
  v18.receiver = self;
  v18.super_class = (Class)PLPillContentView;
  v8 = -[PLPillContentView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[PLPillContentView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PLPillContentView traitCollection](v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    preferredContentSizeCategory = v9->_preferredContentSizeCategory;
    v9->_preferredContentSizeCategory = (NSString *)v11;

    v13 = -[_PLPillAccessoryWrapperView translatesAutoresizingMaskIntoConstraints](v6, "translatesAutoresizingMaskIntoConstraints");
    v14 = v6;
    if (v13)
      v14 = -[_PLPillAccessoryWrapperView initWithManagedSubview:]([_PLPillAccessoryWrapperView alloc], "initWithManagedSubview:", v6);
    objc_storeStrong((id *)&v9->_leadingAccessoryView, v14);
    if (v13)

    if (v9->_leadingAccessoryView)
      -[PLPillContentView addSubview:](v9, "addSubview:");
    v15 = -[_PLPillAccessoryWrapperView translatesAutoresizingMaskIntoConstraints](v7, "translatesAutoresizingMaskIntoConstraints");
    v16 = v7;
    if (v15)
      v16 = -[_PLPillAccessoryWrapperView initWithManagedSubview:]([_PLPillAccessoryWrapperView alloc], "initWithManagedSubview:", v7);
    objc_storeStrong((id *)&v9->_trailingAccessoryView, v16);
    if (v15)

    if (v9->_trailingAccessoryView)
      -[PLPillContentView addSubview:](v9, "addSubview:");
  }

  return v9;
}

- (BOOL)isWrappingRequiredForCenterContentItem:(id)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  BOOL v10;

  if (!a3)
    return 0;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PLPillContentView _arrangedSubviewForContentItem:](self, "_arrangedSubviewForContentItem:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[PLPillContentView _isWrappingRequiredForCenterContentItemView:inBounds:](self, "_isWrappingRequiredForCenterContentItemView:inBounds:", v9, x, y, width, height);
  else
    v10 = 0;

  return v10;
}

- (void)setCenterContentItems:(id)a3
{
  -[PLPillContentView setCenterContentItems:animated:](self, "setCenterContentItems:animated:", a3, 1);
}

- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4
{
  id v7;
  NSArray **p_centerContentItems;
  NSArray *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  NSArray *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  PLPillContentView *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "count") >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 153, CFSTR("PLPillView view can only reason about 2 center content items."));

  }
  p_centerContentItems = &self->_centerContentItems;
  if ((objc_msgSend(v7, "isEqualToArray:", self->_centerContentItems) & 1) == 0)
  {
    -[PLPillContentView _configureCenterStackViewIfNecessary](self, "_configureCenterStackViewIfNecessary");
    v9 = *p_centerContentItems;
    objc_storeStrong((id *)&self->_centerContentItems, a3);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSArray firstObject](*p_centerContentItems, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v7;
    if (-[NSArray count](*p_centerContentItems, "count") == 2
      && (-[NSArray lastObject](*p_centerContentItems, "lastObject"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
    }
    else
    {
      objc_msgSend(v11, "soloItem");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v11 = (void *)v14;
    }
    v47 = 0;
    v48[0] = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, v13, 0);
    -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    -[PLPillContentView _incomingTopWrapperView:incomingBottomWrapperView:outgoingWrapperViews:forOutgoingContentItems:incomingContentItems:existingWrapperViews:](self, "_incomingTopWrapperView:incomingBottomWrapperView:outgoingWrapperViews:forOutgoingContentItems:incomingContentItems:existingWrapperViews:", v48, &v47, v10, v9, v15, v16);
    v17 = v48[0];
    v18 = v47;

    objc_msgSend(v10, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTopConstraintBreakable:", 1);

    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v20 = 1;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTopConstraintBreakable:", 0);

        ++v20;
      }
      while (v20 < objc_msgSend(v10, "count"));
    }
    objc_msgSend(v17, "setTopConstraintBreakable:", v18 != 0);
    objc_msgSend(v18, "setTopConstraintBreakable:", 0);
    v22 = objc_alloc_init(MEMORY[0x1E0CEAF60]);
    objc_msgSend(v22, "_setContainerView:", self);
    objc_msgSend(v22, "_setIsAnimated:", 1);
    v23 = (void *)MEMORY[0x1E0CEABB0];
    v24 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke;
    v40[3] = &unk_1E91D3740;
    v41 = v22;
    v42 = v10;
    v43 = v17;
    v44 = v11;
    v45 = v18;
    v46 = v13;
    v34[0] = v24;
    v34[1] = 3221225472;
    v34[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_5;
    v34[3] = &unk_1E91D3768;
    v35 = v43;
    v36 = v45;
    v37 = v42;
    v38 = self;
    v39 = v41;
    v25 = v41;
    v26 = v42;
    v27 = v45;
    v28 = v43;
    v29 = v13;
    v30 = v11;
    objc_msgSend(v23, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 4100, v40, v34, 0.0, 0.0);
    -[PLPillContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PLPillContentView needsUpdateConstraints](self, "needsUpdateConstraints");
    -[PLPillContentView setNeedsLayout](self, "setNeedsLayout");

    v7 = v33;
  }

}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_3;
  v12[3] = &unk_1E91D3718;
  v13 = *(id *)(a1 + 32);
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5ED8](v12);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        __52__PLPillContentView_setCenterContentItems_animated___block_invoke_2(v4, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
      v5 = v4;
    }
    while (v4);
  }

  v2[2](v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2[2](v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations", (_QWORD)v8);

}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    objc_msgSend(v2, "setHidden:", 1);
    objc_msgSend(v2, "setAlpha:", 0.0);
    objc_msgSend(v2, "beginAppearanceTransition:", 0);

  }
}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v11[1] = 3221225472;
    v11[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_4;
    v11[3] = &unk_1E91D3160;
    v10 = v5;
    v11[0] = MEMORY[0x1E0C809B0];
    v7 = v5;
    v12 = v7;
    v8 = a3;
    objc_msgSend(v6, "performWithoutAnimation:", v11);
    objc_msgSend(*(id *)(a1 + 32), "_transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentItem:transitionCoordinator:", v8, v9);

    objc_msgSend(v7, "setHidden:", 0);
    objc_msgSend(v7, "setAlpha:", 1.0);
    objc_msgSend(v7, "beginAppearanceTransition:", 1);

    v5 = v10;
  }

}

uint64_t __52__PLPillContentView_setCenterContentItems_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginAppearanceTransition:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition:", 0);
}

uint64_t __52__PLPillContentView_setCenterContentItems_animated___block_invoke_5(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "endAppearanceTransition:", 1);
  objc_msgSend(a1[5], "endAppearanceTransition:", 1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = a1[6];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "endAppearanceTransition:", 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[7], "_cleanupStackView");
  return objc_msgSend(a1[8], "completeTransition:", 1);
}

- (CGSize)sizeThatFitsContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  -[PLPillContentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIViewForPLPillContentItem(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPillContentView _intrinsicContentSizeWithReferenceView:](self, "_intrinsicContentSizeWithReferenceView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3
{
  UIView *referenceContentItemView;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_referenceContentItemForIntrinsicContentSize, a3);
    referenceContentItemView = self->_referenceContentItemView;
    self->_referenceContentItemView = 0;

  }
}

- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!-[NSArray containsObject:](self->_centerContentItems, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_centerContentItems containsObject:referenceContentItem]"));

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    objc_msgSend(v9, "updateWithContentItem:", v7);
LABEL_4:

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PLPillContentView _referenceContentItemView](self, "_referenceContentItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPillContentView _intrinsicContentSizeWithReferenceView:](self, "_intrinsicContentSizeWithReferenceView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PLPillContentView;
  -[PLPillContentView updateConstraints](&v17, sel_updateConstraints);
  -[PLPillContentView _updateConstraintsForAccessoryView:](self, "_updateConstraintsForAccessoryView:", self->_leadingAccessoryView);
  -[PLPillContentView _updateConstraintsForAccessoryView:](self, "_updateConstraintsForAccessoryView:", self->_trailingAccessoryView);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = objc_opt_class();
        v10 = v8;
        if (v9)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;

        -[PLPillContentView _updateConstraintsForWrapperView:](self, "_updateConstraintsForWrapperView:", v12);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PLPillContentView *v5;
  PLPillContentView *v6;
  PLPillContentView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPillContentView;
  -[PLPillContentView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PLPillContentView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_adjustsFontForContentSizeCategory)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v6, "adjustsFontForContentSizeCategory") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[PLPillContentView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
  {
    -[PLPillContentView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((BSEqualObjects() & 1) == 0)
      objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (objc_msgSend(v11, "adjustForContentSizeCategoryChange") | v8) & 1;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);

      if ((v8 & 1) != 0)
      {
        -[PLPillContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
        -[PLPillContentView _invalidateVerticalCenterConstraintsForAccessoryView:](self, "_invalidateVerticalCenterConstraintsForAccessoryView:", self->_leadingAccessoryView);
        -[PLPillContentView _invalidateVerticalCenterConstraintsForAccessoryView:](self, "_invalidateVerticalCenterConstraintsForAccessoryView:", self->_trailingAccessoryView);
        -[PLPillContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
        -[PLPillContentView setNeedsLayout](self, "setNeedsLayout");
        v12 = 1;
LABEL_18:

        return v12;
      }
    }
    else
    {

    }
    v12 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)_referenceContentItemView
{
  UIView *referenceContentItemView;
  PLPillContentItem *referenceContentItemForIntrinsicContentSize;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;

  referenceContentItemView = self->_referenceContentItemView;
  if (!referenceContentItemView)
  {
    referenceContentItemForIntrinsicContentSize = self->_referenceContentItemForIntrinsicContentSize;
    if (referenceContentItemForIntrinsicContentSize)
    {
      -[PLPillContentView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContentSizeCategory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIViewForPLPillContentItem(referenceContentItemForIntrinsicContentSize, v6);
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      v8 = self->_referenceContentItemView;
      self->_referenceContentItemView = v7;

      referenceContentItemView = self->_referenceContentItemView;
    }
    else
    {
      referenceContentItemView = 0;
    }
  }
  return referenceContentItemView;
}

- (BOOL)_isAccessoryPinnedToTopLine
{
  void *v3;
  BOOL v4;

  -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") >= 2
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3D8], self->_preferredContentSizeCategory) == NSOrderedAscending;

  return v4;
}

- (BOOL)_isWrappingRequiredForCenterContentItemView:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *leadingAccessoryView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  leadingAccessoryView = self->_leadingAccessoryView;
  v10 = a3;
  -[PLPillContentView _capWidthWithAccessoryView:](self, "_capWidthWithAccessoryView:", leadingAccessoryView);
  v12 = v11;
  -[PLPillContentView _capWidthWithAccessoryView:](self, "_capWidthWithAccessoryView:", self->_trailingAccessoryView);
  v14 = v13;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  objc_msgSend(v10, "sizeThatFits:", CGRectGetWidth(v18) - v12 - v14, 1.79769313e308);
  v16 = v15;

  return v16 + 24.0 > PLContentViewHeightForContentSizeCategory(self->_preferredContentSizeCategory, 1uLL, 0.0);
}

- (CGSize)_intrinsicContentSizeWithReferenceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSString *v30;
  double v31;
  NSString *v32;
  NSComparisonResult v33;
  NSString *v34;
  NSComparisonResult v35;
  NSComparisonResult v36;
  unint64_t v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CGSize result;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "arrayByAddingObject:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v48;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "sizeThatFits:", 1.79769313e308, 1.79769313e308, (_QWORD)v47);
        if (v14 >= v12)
          v12 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  -[PLPillContentView _capWidthWithAccessoryView:](self, "_capWidthWithAccessoryView:", self->_leadingAccessoryView);
  v16 = v15;
  -[PLPillContentView _capWidthWithAccessoryView:](self, "_capWidthWithAccessoryView:", self->_trailingAccessoryView);
  v18 = v17;
  v19 = (void *)MEMORY[0x1E0CEA950];
  v20 = self->_preferredContentSizeCategory;
  objc_msgSend(v19, "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;

  if (v23 >= v26)
    v27 = v26;
  else
    v27 = v23;
  v28 = v27 + -40.0;
  v29 = fmin(v27 + -40.0, 556.0);
  v30 = (NSString *)*MEMORY[0x1E0CEB420];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB420], v20) == NSOrderedAscending)
  {
    v31 = fmax(v29, 300.0);
    if (v31 >= v28 + -100.0)
      v29 = v31;
    else
      v29 = v28 + -100.0;
  }
  v32 = (NSString *)*MEMORY[0x1E0CEB3F8];
  v33 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3F8], v20);

  v34 = self->_preferredContentSizeCategory;
  v35 = UIContentSizeCategoryCompareToCategory(v30, v34);
  v36 = UIContentSizeCategoryCompareToCategory(v32, v34);

  v37 = -[NSArray count](self->_centerContentItems, "count");
  v38 = 0.0;
  if (v37 <= 1)
  {
    -[NSArray lastObject](self->_centerContentItems, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentView _arrangedSubviewForContentItem:](self, "_arrangedSubviewForContentItem:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentView bounds](self, "bounds");
    v38 = (double)-[PLPillContentView _isWrappingRequiredForCenterContentItemView:inBounds:](self, "_isWrappingRequiredForCenterContentItemView:inBounds:", v40);

  }
  v41 = fmax(v29, 400.0);
  if (v41 < v28)
    v41 = v28;
  if (v33 != NSOrderedAscending)
    v41 = v29;
  v42 = 200.0;
  if (v35 == NSOrderedAscending)
    v42 = 250.0;
  if (v36 == NSOrderedAscending)
    v42 = 300.0;
  if (v42 < v12 + v16 + v18)
    v42 = v12 + v16 + v18;
  if (v41 <= v42)
    v43 = v41;
  else
    v43 = v42;
  v44 = PLContentViewHeightForContentSizeCategory(self->_preferredContentSizeCategory, v37, v38);

  v45 = v43;
  v46 = v44;
  result.height = v46;
  result.width = v45;
  return result;
}

- (id)_arrangedSubviewForContentItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "contentItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isLikePillContentItem:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_configureCenterStackViewIfNecessary
{
  UIStackView *v3;
  UIStackView *centerStackView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (!self->_centerStackView)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    centerStackView = self->_centerStackView;
    self->_centerStackView = v3;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_centerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_centerStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_centerStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_centerStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](self->_centerStackView, "setSpacing:", 2.0);
    -[PLPillContentView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_centerStackView, 0);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView leadingAnchor](self->_centerStackView, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentView leadingAnchor](self, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    -[UIStackView trailingAnchor](self->_centerStackView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentView trailingAnchor](self, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    -[UIStackView centerYAnchor](self->_centerStackView, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentView centerYAnchor](self, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v14);

  }
}

- (void)_cleanupStackView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "isHidden", (_QWORD)v10))
          objc_msgSend(v9, "removeFromSuperview");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (double)_capInsetForAccessoryView:(id)a3
{
  UIView *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSString *v9;
  NSComparisonResult v10;
  double v11;
  double v12;

  v4 = (UIView *)a3;
  -[PLPillContentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB440]);
  v8 = (void *)*MEMORY[0x1E0CEB420];
  if (!v7)
    v8 = v6;
  v9 = v8;
  v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3F8], v9);

  if (v10 == NSOrderedAscending)
    v11 = 10.0;
  else
    v11 = 30.0;

  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    -[UIView intrinsicContentSize](v4, "intrinsicContentSize");
    if (v12 + 15.0 + 10.0 <= 45.0)
      v11 = 15.0;
    else
      v11 = 8.0;
  }

  return v11;
}

- (double)_capWidthWithAccessoryView:(id)a3
{
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (UIView *)a3;
  -[PLPillContentView _capInsetForAccessoryView:](self, "_capInsetForAccessoryView:", v4);
  v6 = v5;
  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    -[UIView intrinsicContentSize](v4, "intrinsicContentSize");
    v8 = v6 + v7;
    v9 = 8.0;
    if (v6 > 8.0)
      v9 = 10.0;
    v6 = v9 + v8;
  }

  return v6;
}

- (void)_updateConstraintsForAccessoryView:(id)a3
{
  UIView *v4;
  UIView *v5;
  NSMapTable *accessoryViewsToConstraints;
  NSMapTable *v7;
  NSMapTable *v8;
  id v9;
  double v10;
  double v11;
  UIView *leadingAccessoryView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;

  v4 = (UIView *)a3;
  v5 = v4;
  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    accessoryViewsToConstraints = self->_accessoryViewsToConstraints;
    v24 = v5;
    if (!accessoryViewsToConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_accessoryViewsToConstraints;
      self->_accessoryViewsToConstraints = v7;

      v5 = v24;
      accessoryViewsToConstraints = self->_accessoryViewsToConstraints;
    }
    -[NSMapTable objectForKey:](accessoryViewsToConstraints, "objectForKey:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMapTable setObject:forKey:](self->_accessoryViewsToConstraints, "setObject:forKey:", v9, v24);
    }
    -[PLPillContentView _capInsetForAccessoryView:](self, "_capInsetForAccessoryView:", v24);
    v11 = v10;
    leadingAccessoryView = self->_leadingAccessoryView;
    if (leadingAccessoryView == v24)
      v13 = &unk_1E91E2E10;
    else
      v13 = &unk_1E91E2E28;
    objc_msgSend(v9, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (leadingAccessoryView == v24)
      {
        -[UIView leadingAnchor](v24, "leadingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPillContentView leadingAnchor](self, "leadingAnchor");
      }
      else
      {
        -[UIView trailingAnchor](v24, "trailingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPillContentView trailingAnchor](self, "trailingAnchor");
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKey:", v14, v13);
      objc_msgSend(v14, "setActive:", 1);
    }
    v17 = -v11;
    if (leadingAccessoryView == v24)
      v17 = v11;
    objc_msgSend(v14, "setConstant:", v17);
    objc_msgSend(v9, "objectForKey:", &unk_1E91E2E40);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v19 = -[PLPillContentView _isAccessoryPinnedToTopLine](self, "_isAccessoryPinnedToTopLine");
      -[UIView centerYAnchor](v24, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) != 0)
      {
        -[UIStackView arrangedSubviews](self->_centerStackView, "arrangedSubviews");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerYAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToAnchor:", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PLPillContentView centerYAnchor](self, "centerYAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToAnchor:", v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v9, "setObject:forKey:", v18, &unk_1E91E2E40);
      objc_msgSend(v18, "setActive:", 1);
    }

    v5 = v24;
  }

}

- (void)_invalidateVerticalCenterConstraintsForAccessoryView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    -[NSMapTable objectForKey:](self->_accessoryViewsToConstraints, "objectForKey:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", &unk_1E91E2E40);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "setActive:", 0);
      objc_msgSend(v5, "removeObjectForKey:", &unk_1E91E2E40);
    }

  }
}

- (void)_updateConstraintsForWrapperView:(id)a3
{
  NSMapTable *wrapperViewsToConstraints;
  NSMapTable *v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSString *v17;
  NSComparisonResult v18;
  double v19;
  void *v20;
  int *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  NSString *lhs;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  if (v32)
  {
    wrapperViewsToConstraints = self->_wrapperViewsToConstraints;
    if (!wrapperViewsToConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_wrapperViewsToConstraints;
      self->_wrapperViewsToConstraints = v5;

      wrapperViewsToConstraints = self->_wrapperViewsToConstraints;
    }
    -[NSMapTable objectForKey:](wrapperViewsToConstraints, "objectForKey:", v32);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMapTable setObject:forKey:](self->_wrapperViewsToConstraints, "setObject:forKey:", v7, v32);
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = objc_msgSend(&unk_1E91E2F10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v8)
    {
      v9 = v8;
      v36 = *(_QWORD *)v38;
      v35 = *MEMORY[0x1E0CEB440];
      v34 = (void *)*MEMORY[0x1E0CEB420];
      lhs = (NSString *)*MEMORY[0x1E0CEB3F8];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v36)
            objc_enumerationMutation(&unk_1E91E2F10);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "unsignedIntegerValue");
          -[PLPillContentView traitCollection](self, "traitCollection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "preferredContentSizeCategory");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v35);
          v16 = v34;
          if (!v15)
            v16 = v14;
          v17 = v16;
          v18 = UIContentSizeCategoryCompareToCategory(lhs, v17);

          if (v18 == NSOrderedAscending)
            v19 = 10.0;
          else
            v19 = 30.0;

          objc_msgSend(v7, "objectForKey:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = &OBJC_IVAR___PLPillContentView__trailingAccessoryView;
          if (v12 == 2)
            v21 = &OBJC_IVAR___PLPillContentView__leadingAccessoryView;
          v22 = *(id *)((char *)&self->super.super.super.isa + *v21);
          if (v22
            && (!-[PLPillContentView _isAccessoryPinnedToTopLine](self, "_isAccessoryPinnedToTopLine")
             || (objc_msgSend(v32, "contentItem"),
                 v23 = (void *)objc_claimAutoreleasedReturnValue(),
                 -[NSArray firstObject](self->_centerContentItems, "firstObject"),
                 v24 = (void *)objc_claimAutoreleasedReturnValue(),
                 v24,
                 v23,
                 v23 == v24)))
          {
            if (!v20)
            {
              if (v12 == 2)
              {
                objc_msgSend(v32, "leadingAnchor");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "trailingAnchor");
              }
              else
              {
                objc_msgSend(v32, "trailingAnchor");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "leadingAnchor");
              }
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "constraintEqualToAnchor:", v28);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

            }
            -[NSMapTable objectForKey:](self->_accessoryViewsToConstraints, "objectForKey:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v11);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "constant");
            if (v30 < 0.0)
              v30 = -v30;
            if (v30 <= 8.0)
              v19 = 8.0;
            else
              v19 = 10.0;
          }
          else
          {
            if (v20)
              goto LABEL_37;
            if (v12 == 2)
            {
              objc_msgSend(v32, "leadingAnchor");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPillContentView leadingAnchor](self, "leadingAnchor");
            }
            else
            {
              objc_msgSend(v32, "trailingAnchor");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPillContentView trailingAnchor](self, "trailingAnchor");
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "constraintEqualToAnchor:", v27);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
LABEL_37:
          objc_msgSend(v7, "setObject:forKey:", v20, v11);
          objc_msgSend(v20, "setActive:", 1);
          v31 = -v19;
          if (v12 == 2)
            v31 = v19;
          objc_msgSend(v20, "setConstant:", v31);

        }
        v9 = objc_msgSend(&unk_1E91E2F10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v9);
    }

  }
}

- (void)_incomingTopWrapperView:(id *)a3 incomingBottomWrapperView:(id *)a4 outgoingWrapperViews:(id)a5 forOutgoingContentItems:(id)a6 incomingContentItems:(id)a7 existingWrapperViews:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PLPillContentWrapperView *v28;
  void *v29;
  void *v30;
  id v31;
  PLPillContentWrapperView *v32;
  id v33;
  id v34;
  id *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD);
  PLPillContentWrapperView *v42;
  PLPillContentWrapperView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[5];
  PLPillContentWrapperView *v57;
  _QWORD v58[5];
  PLPillContentWrapperView *v59;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("incomingBottomWrapperViewPtr"));

    if (v14)
      goto LABEL_4;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("incomingTopWrapperViewPtr"));

  if (!a4)
    goto LABEL_35;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outgoingWrapperViews"));

LABEL_4:
  v18 = objc_msgSend(v15, "count");
  v19 = objc_msgSend(v16, "count");
  objc_msgSend(v16, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") == 2)
  {
    objc_msgSend(v16, "lastObject");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v51 = v20;
  v53 = (void *)v21;
  if (v18 != 2 || v19 != 2)
  {
    v31 = (id)objc_msgSend(v17, "mutableCopy");
    if (!v19)
    {
      v28 = 0;
      v32 = 0;
LABEL_25:
      objc_msgSend(v14, "addObjectsFromArray:", v31);
      goto LABEL_26;
    }
    v49 = a3;
    v33 = v15;
    v34 = v14;
    v35 = a4;
LABEL_20:
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_3;
    v54[3] = &unk_1E91D3790;
    v31 = v31;
    v55 = v31;
    v41 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5ED8](v54);
    ((void (**)(_QWORD, void *))v41)[2](v41, v20);
    v28 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v28)
      -[UIStackView insertArrangedSubview:atIndex:](self->_centerStackView, "insertArrangedSubview:atIndex:", v28, 0);
    ((void (**)(_QWORD, void *))v41)[2](v41, v53);
    v32 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v32)
      -[UIStackView addArrangedSubview:](self->_centerStackView, "addArrangedSubview:", v32);

    a4 = v35;
    v14 = v34;
    v15 = v33;
    a3 = v49;
    goto LABEL_25;
  }
  objc_msgSend(v15, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isLikePillContentItem:", v20);

  if (v23)
  {
    objc_msgSend(v15, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wrapperView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v25);

    objc_msgSend(v15, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "wrapperView");
    v27 = v20;
    v28 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setWrapperView:", v28);
    -[PLPillContentView _arrangedSubviewForContentItem:](self, "_arrangedSubviewForContentItem:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v21;
    v31 = v29;
    if (v29)
    {
      v32 = v29;
    }
    else
    {
      v42 = objc_alloc_init(PLPillContentWrapperView);
      objc_msgSend(v30, "setWrapperView:", v42);
      -[PLPillContentWrapperView setAdjustsFontForContentSizeCategory:](v42, "setAdjustsFontForContentSizeCategory:", 1);
      v50 = (void *)MEMORY[0x1E0CEABB0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke;
      v58[3] = &unk_1E91D3568;
      v58[4] = self;
      v32 = v42;
      v59 = v32;
      objc_msgSend(v50, "performWithoutAnimation:", v58);

    }
    goto LABEL_26;
  }
  if (!v21
    || (objc_msgSend(v15, "firstObject"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        v37 = objc_msgSend(v36, "isLikePillContentItem:", v21),
        v36,
        !v37))
  {
    v49 = a3;
    v33 = v15;
    v34 = v14;
    v35 = a4;
    v31 = (id)objc_msgSend(v17, "mutableCopy");
    goto LABEL_20;
  }
  objc_msgSend(v15, "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "wrapperView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v39);

  -[PLPillContentView _arrangedSubviewForContentItem:](self, "_arrangedSubviewForContentItem:", v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v40;
  if (v40)
  {
    v28 = v40;
  }
  else
  {
    v43 = objc_alloc_init(PLPillContentWrapperView);
    objc_msgSend(v20, "setWrapperView:", v43);
    -[PLPillContentWrapperView setAdjustsFontForContentSizeCategory:](v43, "setAdjustsFontForContentSizeCategory:", 1);
    v44 = (void *)MEMORY[0x1E0CEABB0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_2;
    v56[3] = &unk_1E91D3568;
    v56[4] = self;
    v28 = v43;
    v57 = v28;
    objc_msgSend(v44, "performWithoutAnimation:", v56);

  }
  objc_msgSend(v15, "firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "wrapperView");
  v32 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "setWrapperView:", v32);
LABEL_26:

  if (a3)
    *a3 = objc_retainAutorelease(v28);
  if (a4)
    *a4 = objc_retainAutorelease(v32);

}

uint64_t __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addArrangedSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "insertArrangedSubview:atIndex:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

PLPillContentWrapperView *__158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  PLPillContentWrapperView *v5;

  v3 = a2;
  objc_msgSend(v3, "wrapperView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (PLPillContentWrapperView *)v4;
  if (v3)
  {
    if (v4
      || objc_msgSend(*(id *)(a1 + 32), "count")
      && (objc_msgSend(*(id *)(a1 + 32), "firstObject"),
          (v5 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
    }
    else
    {
      v5 = objc_alloc_init(PLPillContentWrapperView);
      -[PLPillContentWrapperView setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    }
    objc_msgSend(v3, "setWrapperView:", v5);
  }

  return v5;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (NSArray)centerContentItems
{
  return self->_centerContentItems;
}

- (PLPillContentItem)referenceContentItemForIntrinsicContentSize
{
  return self->_referenceContentItemForIntrinsicContentSize;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceContentItemForIntrinsicContentSize, 0);
  objc_storeStrong((id *)&self->_centerContentItems, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryViewsToConstraints, 0);
  objc_storeStrong((id *)&self->_wrapperViewsToConstraints, 0);
  objc_storeStrong((id *)&self->_referenceContentItemView, 0);
  objc_storeStrong((id *)&self->_centerStackView, 0);
}

@end
