@implementation NotesBackgroundView

- (void)setHasBarBlur:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_hasBarBlur = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    -[NotesBarBackgroundView setHasBlur:](self->_topBarView, "setHasBlur:", v3);
}

- (void)setElementForAccessibilityReparenting:(id)a3
{
  objc_storeWeak((id *)&self->_elementForAccessibilityReparenting, a3);
}

- (void)setContentView:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0DC3708];
  v5 = a3;
  -[NotesBackgroundView setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:](self, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v5, objc_msgSend(v4, "ic_isVision"), -[UIView ic_hasCompactWidth](self, "ic_hasCompactWidth"), 1, 0, 0);

}

- (void)setAxChildReparentingController:(id)a3
{
  objc_storeWeak((id *)&self->_axChildReparentingController, a3);
}

- (void)scrollView:(id)a3 didChangeContentOffset:(CGPoint)a4
{
  double y;
  void *v6;
  double v7;
  _BOOL8 v8;
  id v9;

  y = a4.y;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[NotesBackgroundView topBarView](self, "topBarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7 + -15.0 > -y;

    -[NotesBackgroundView topBarView](self, "topBarView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

  }
}

- (NotesBackgroundView)initWithCoder:(id)a3
{
  NotesBackgroundView *v3;
  NotesBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  v3 = -[NotesBackgroundView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[NotesBackgroundView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  NotesBarBackgroundView *v3;
  NotesBarBackgroundView *v4;
  NotesBarBackgroundView *topBarView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0 && (ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v3 = [NotesBarBackgroundView alloc];
    v4 = -[NotesBarBackgroundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    topBarView = self->_topBarView;
    self->_topBarView = v4;

    -[NotesBarBackgroundView setClipsToBounds:](self->_topBarView, "setClipsToBounds:", 1);
    -[NotesBarBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](self->_topBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBarBackgroundView setColor:](self->_topBarView, "setColor:", v6);

    -[NotesBackgroundView addSubview:](self, "addSubview:", self->_topBarView);
    _NSDictionaryOfVariableBindings(CFSTR("_topBarView"), self->_topBarView, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_topBarView]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView addConstraints:](self, "addConstraints:", v8);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 3, 0, self->_topBarView, 3, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView addConstraint:](self, "addConstraint:", v9);

  }
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NotesBackgroundView setContentView:](self, "setContentView:", v11);

  }
}

- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 toContainer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[NotesBackgroundView topBarView](self, "topBarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setActive:", 1);
  }

}

- (NotesBackgroundView)initWithFrame:(CGRect)a3
{
  NotesBackgroundView *v3;
  NotesBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  v3 = -[NotesBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NotesBackgroundView commonInit](v3, "commonInit");
  return v4;
}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  -[NotesBackgroundView contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NotesBackgroundView setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:](self, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v11, 1, v9, v8, v7, v6);

}

- (void)applyContentViewBezelsStandalone:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    if (v3)
      v5 = 34.0;
    else
      v5 = 16.0;
    -[NotesBackgroundView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_applyRoundedCornersWithTopLeadingRadius:topTrailingRadius:bottomLeadingRadius:bottomTrailingRadius:", 16.0, 16.0, v5, 34.0);

    -[NotesBackgroundView contentView](self, "contentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

  }
}

- (void)_setOverrideUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView _setOverrideUserInterfaceStyle:](&v6, sel__setOverrideUserInterfaceStyle_);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[NotesBackgroundView topBarView](self, "topBarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setOverrideUserInterfaceStyle:", a3);

  }
}

- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 bottomToolbar:(id)a4 toContainer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a5;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[NotesBackgroundView topBarView](self, "topBarView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraint:", v11);

  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView _dynamicUserInterfaceTraitDidChange](&v7, sel__dynamicUserInterfaceTraitDidChange);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[UIView ic_appearanceInfo](self, "ic_appearanceInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBarAlpha");
    v5 = v4;
    -[NotesBackgroundView topBarView](self, "topBarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

  }
}

- (id)scrollViewDescendantOfView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[NotesBackgroundView scrollViewDescendantOfView:](self, "scrollViewDescendantOfView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)setContentViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  self->_contentViewVisible = a3;
  -[NotesBackgroundView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 standalone:(BOOL)a5 needsAdditionalBottomMargin:(BOOL)a6 needsAdditionalLeadingMargin:(BOOL)a7 force:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = (void *)MEMORY[0x1E0DC3708];
  v19 = a3;
  v15 = objc_msgSend(v14, "ic_isVision");
  if ((v11 || v9) & objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v16 = 12.0;
  else
    v16 = 0.0;
  if ((v15 & v10) != 0)
    v17 = 12.0;
  else
    v17 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v18 = 12.0;
  else
    v18 = 0.0;
  -[NotesBackgroundView setContentView:useSafeAreaLayoutGuide:topMargin:bottomMargin:leadingMargin:trailingMargin:standalone:force:](self, "setContentView:useSafeAreaLayoutGuide:topMargin:bottomMargin:leadingMargin:trailingMargin:standalone:force:", v19, v12, v11, v8, 0.0, v17, v16, v18);

}

- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 topMargin:(double)a5 bottomMargin:(double)a6 leadingMargin:(double)a7 trailingMargin:(double)a8 standalone:(BOOL)a9 force:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  UIView *v19;
  UIView **p_contentView;
  UIView *contentView;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  UIView *v46;

  v10 = a10;
  v11 = a9;
  v19 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v19 || v10)
  {
    v46 = v19;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_contentView)
      -[NotesBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_contentView, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      -[NotesBackgroundView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v25 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NotesBackgroundView leadingAnchor](self, "leadingAnchor");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    -[UIView leadingAnchor](*p_contentView, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, a7);
    v27 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v27;
    objc_msgSend(v23, "addObject:", v27);
    if (a4)
    {
      -[NotesBackgroundView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "widthAnchor");
      v29 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NotesBackgroundView widthAnchor](self, "widthAnchor");
      v29 = objc_claimAutoreleasedReturnValue();
    }
    -[UIView widthAnchor](*p_contentView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -a7 - a8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v31);
    v43 = v11;
    if (a4)
    {
      -[NotesBackgroundView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NotesBackgroundView topAnchor](self, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = (void *)v29;
    -[UIView topAnchor](*p_contentView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v35);
    v36 = (void *)v25;
    if (a4)
    {
      -[NotesBackgroundView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NotesBackgroundView bottomAnchor](self, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView bottomAnchor](*p_contentView, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, a6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v40);
    v41 = (void *)MEMORY[0x1E0CB3718];
    v42 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v41, "activateConstraints:", v42);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision")
      && !-[NotesBackgroundView isPreviewing](self, "isPreviewing"))
    {
      -[NotesBackgroundView applyContentViewBezelsStandalone:](self, "applyContentViewBezelsStandalone:", v43);
    }

    v19 = v46;
  }

}

- (void)addSubview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[NotesBackgroundView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NotesBackgroundView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v4, v6);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NotesBackgroundView;
    -[NotesBackgroundView addSubview:](&v7, sel_addSubview_, v4);
  }

}

- (void)addSubviewAboveAllViews:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView addSubview:](&v3, sel_addSubview_, a3);
}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  Class v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  -[NotesBackgroundView axChildReparentingController](self, "axChildReparentingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsAccessibilityChildReparenting");

  if (v4)
  {
    -[NotesBackgroundView elementForAccessibilityReparenting](self, "elementForAccessibilityReparenting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childElementsForAccessibilityReparenting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = NSClassFromString(CFSTR("ICNoteEditorDateView"));
    v8 = NSClassFromString(CFSTR("ICNoteEditorUserTitleView"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView _accessibleSubviews](self, "_accessibleSubviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    objc_msgSend(v9, "addObjectsFromArray:", v6);
    -[NotesBackgroundView _findDescendantAXElementOfClass:](self, "_findDescendantAXElementOfClass:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView _findDescendantAXElementOfClass:](self, "_findDescendantAXElementOfClass:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "removeObject:", v11);
      objc_msgSend(v9, "insertObject:atIndex:", v11, 0);
    }
    if (v12)
    {
      objc_msgSend(v9, "removeObject:", v12);
      objc_msgSend(v9, "insertObject:atIndex:", v12, 0);
    }
    v13 = (void *)objc_msgSend(v9, "copy");

    return v13;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NotesBackgroundView;
    -[NotesBackgroundView accessibilityElements](&v15, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[NotesBackgroundView _miniPlayerView](self, "_miniPlayerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NotesBackgroundView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBackgroundView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    v11 = v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0DC1048], "defaultVoiceOverOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_accessibilityLeafDescendantsWithOptions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
LABEL_4:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
        objc_msgSend(v21, "accessibilityFrame");
        v31.x = v11;
        v31.y = v13;
        if (CGRectContainsPoint(v32, v31))
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v18)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v22 = v21;

      if (v22)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
  }
  v24.receiver = self;
  v24.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView _accessibilityHitTest:withEvent:](&v24, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v22;
}

- (id)_findDescendantAXElementOfClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotesBackgroundView _accessibleSubviews](self, "_accessibleSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObjectsFromArray:", v5);
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v6, "_accessibleSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 0;
}

- (id)_miniPlayerView
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
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
  -[NotesBackgroundView subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "accessibilityIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICMiniPlayerViewController accessibilityIdentifierForPlayerView](ICMiniPlayerViewController, "accessibilityIdentifierForPlayerView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if (v9)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentViewVisible
{
  return self->_contentViewVisible;
}

- (ICAccessibilityChildReparentingController)axChildReparentingController
{
  return (ICAccessibilityChildReparentingController *)objc_loadWeakRetained((id *)&self->_axChildReparentingController);
}

- (BOOL)hasBarBlur
{
  return self->_hasBarBlur;
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void)setPreviewing:(BOOL)a3
{
  self->_previewing = a3;
}

- (NotesBarBackgroundView)topBarView
{
  return self->_topBarView;
}

- (void)setTopBarView:(id)a3
{
  objc_storeStrong((id *)&self->_topBarView, a3);
}

- (ICAccessibilityChildReparentingProvider)elementForAccessibilityReparenting
{
  return (ICAccessibilityChildReparentingProvider *)objc_loadWeakRetained((id *)&self->_elementForAccessibilityReparenting);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementForAccessibilityReparenting);
  objc_storeStrong((id *)&self->_topBarView, 0);
  objc_destroyWeak((id *)&self->_axChildReparentingController);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
