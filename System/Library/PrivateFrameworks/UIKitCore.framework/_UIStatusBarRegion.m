@implementation _UIStatusBarRegion

- (_UIStatusBarRegion)initWithIdentifier:(id)a3
{
  NSString *v4;
  _UIStatusBarRegion *v5;
  NSString *identifier;
  NSString *v7;
  UILayoutGuide *v8;
  UILayoutGuide *layoutGuide;
  NSOrderedSet *v10;
  NSOrderedSet *displayItems;
  uint64_t v12;
  NSMutableIndexSet *disablingTokens;
  objc_super v15;

  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarRegion;
  v5 = -[_UIStatusBarRegion init](&v15, sel_init);
  identifier = v5->_identifier;
  v5->_identifier = v4;
  v7 = v4;

  v8 = objc_alloc_init(UILayoutGuide);
  layoutGuide = v5->_layoutGuide;
  v5->_layoutGuide = v8;

  v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  displayItems = v5->_displayItems;
  v5->_displayItems = v10;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = objc_claimAutoreleasedReturnValue();
  disablingTokens = v5->_disablingTokens;
  v5->_disablingTokens = (NSMutableIndexSet *)v12;

  *(int64x2_t *)&v5->_style = vdupq_n_s64(4uLL);
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  NSStringFromSelector(sel_enabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel_displayItems);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (UIView)hoverView
{
  UIView *contentView;

  contentView = self->_contentView;
  if (!contentView)
    contentView = self->_backgroundView;
  return contentView;
}

- (BOOL)hoverHighlightsAsRegion
{
  return 1;
}

- (CGRect)absoluteHoverFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v35 = *MEMORY[0x1E0C80C00];
  -[_UIStatusBarRegion layoutItem](self, "layoutItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_ui_superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v11 = 1.79769313e308;
    v12 = 2.22507386e-308;
    v13 = 2.22507386e-308;
    v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "absoluteFrame", (_QWORD)v30);
        x = v36.origin.x;
        y = v36.origin.y;
        width = v36.size.width;
        height = v36.size.height;
        MinX = CGRectGetMinX(v36);
        if (v14 >= MinX)
          v14 = MinX;
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        MinY = CGRectGetMinY(v37);
        if (v11 >= MinY)
          v11 = MinY;
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        MaxX = CGRectGetMaxX(v38);
        if (v13 < MaxX)
          v13 = MaxX;
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        MaxY = CGRectGetMaxY(v39);
        if (v12 < MaxY)
          v12 = MaxY;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1.79769313e308;
    v12 = 2.22507386e-308;
    v13 = 2.22507386e-308;
    v14 = 1.79769313e308;
  }

  if (objc_msgSend(v7, "count"))
  {
    v24 = v13 - v14;
    v25 = v12 - v11;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v26 = v14;
  v27 = v11;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (UILayoutItem)layoutItem
{
  void *contentView;

  contentView = self->_contentView;
  if (!contentView)
    contentView = self->_layoutGuide;
  return (UILayoutItem *)contentView;
}

- (UILayoutItem)containerItem
{
  void *layoutGuide;

  if (self->_offsetable || (layoutGuide = self->_contentView) == 0)
    layoutGuide = self->_layoutGuide;
  return (UILayoutItem *)layoutGuide;
}

- (void)setIdentifier:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_identifier != v6)
  {
    objc_storeStrong((id *)&self->_identifier, a3);
    -[_UIStatusBarRegion layoutGuide](self, "layoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

  }
}

- (void)setLayout:(id)a3
{
  _UIStatusBarRegionLayout *v5;
  _UIStatusBarRegionLayout *layout;
  _UIStatusBarRegionLayout **p_layout;
  void *v8;
  _UIStatusBarRegionLayout *v9;

  v5 = (_UIStatusBarRegionLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  v9 = v5;
  if (layout != v5)
  {
    if (layout)
    {
      -[_UIStatusBarRegionLayout setRegion:](layout, "setRegion:", 0);
      -[_UIStatusBarRegionLayout setDisplayItems:](*p_layout, "setDisplayItems:", MEMORY[0x1E0C9AA60]);
    }
    objc_storeStrong((id *)&self->_layout, a3);
    if (*p_layout)
    {
      -[_UIStatusBarRegionLayout setRegion:](*p_layout, "setRegion:", self);
      -[_UIStatusBarRegion currentEnabledDisplayItems](self, "currentEnabledDisplayItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarRegionLayout setDisplayItems:](self->_layout, "setDisplayItems:", v8);

    }
  }

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  void **p_contentView;
  void *v7;
  UILayoutGuide *v8;
  UILayoutGuide *layoutGuide;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_contentView = (void **)&self->_contentView;
  if (self->_contentView != v5)
  {
    v11 = v5;
    -[_UIStatusBarRegion layoutItem](self, "layoutItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ui_removeFromParentLayoutItem");

    if (v11)
    {
      objc_storeStrong((id *)&self->_contentView, a3);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      p_contentView = (void **)&self->_layoutGuide;
    }
    else
    {
      v8 = objc_alloc_init(UILayoutGuide);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v8;

    }
    v10 = *p_contentView;
    *p_contentView = 0;

    v5 = v11;
  }

}

- (void)setOffsetable:(BOOL)a3
{
  UIView *v4;
  UILayoutGuide *v5;
  UILayoutGuide *layoutGuide;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *centerXConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *centerYConstraint;
  void *v15;
  NSLayoutConstraint *v16;
  UILayoutGuide *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (self->_offsetable != a3)
  {
    self->_offsetable = a3;
    if (a3)
    {
      if (!self->_contentView)
      {
        v4 = objc_alloc_init(UIView);
        -[_UIStatusBarRegion setContentView:](self, "setContentView:", v4);

      }
      v5 = objc_alloc_init(UILayoutGuide);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v5;

      -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_layoutGuide);
      -[UILayoutGuide centerXAnchor](self->_layoutGuide, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerXConstraint = self->_centerXConstraint;
      self->_centerXConstraint = v9;

      -[UILayoutGuide centerYAnchor](self->_layoutGuide, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerYConstraint = self->_centerYConstraint;
      self->_centerYConstraint = v13;

      v15 = (void *)MEMORY[0x1E0D156E0];
      v16 = self->_centerYConstraint;
      v17 = self->_layoutGuide;
      v25[0] = self->_centerXConstraint;
      v25[1] = v16;
      -[UILayoutGuide widthAnchor](v17, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_contentView, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v20;
      -[UILayoutGuide heightAnchor](self->_layoutGuide, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](self->_contentView, "heightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activateConstraints:", v24);

    }
  }
}

- (void)setOffset:(UIOffset)a3
{
  double vertical;

  if (self->_offsetable)
  {
    vertical = a3.vertical;
    if (a3.horizontal != self->_offset.horizontal || a3.vertical != self->_offset.vertical)
    {
      self->_offset = a3;
      -[NSLayoutConstraint setConstant:](self->_centerXConstraint, "setConstant:");
      -[NSLayoutConstraint setConstant:](self->_centerYConstraint, "setConstant:", vertical);
    }
  }
}

- (void)_addSubview:(id)a3 atBack:(BOOL)a4
{
  _BOOL4 v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v4 = a4;
  v23[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIStatusBarRegion layoutItem](self, "layoutItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ui_superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  if (v4)
  {
    objc_msgSend(v8, "insertSubview:atIndex:", v6, 0);
  }
  else if (self->_contentView)
  {
    objc_msgSend(v8, "insertSubview:aboveSubview:", v6);
  }
  else
  {
    objc_msgSend(v8, "addSubview:", v6);
  }
  objc_msgSend(v6, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(v6, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(v6, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v16);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v7 = v5;
    if (v5)
    {
      -[_UIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", v5, 1);
      backgroundView = self->_backgroundView;
    }
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v7;
  }

}

- (void)setHighlightView:(id)a3
{
  UIView *v5;
  UIView *highlightView;
  UIView *v7;

  v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    v7 = v5;
    if (v5)
    {
      -[_UIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", v5, 0);
      highlightView = self->_highlightView;
    }
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_highlightView, a3);
    v5 = v7;
  }

}

- (BOOL)isEnabled
{
  _UIStatusBarRegion **p_enabilityRegion;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  BOOL result;

  p_enabilityRegion = &self->_enabilityRegion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  result = (!WeakRetained
         || (v5 = WeakRetained,
             v6 = objc_loadWeakRetained((id *)p_enabilityRegion),
             v7 = objc_msgSend(v6, "isEnabled"),
             v6,
             v5,
             v7))
        && -[NSMutableIndexSet count](self->_disablingTokens, "count") == 0;
  return result;
}

- (void)disableWithToken:(unint64_t)a3
{
  -[NSMutableIndexSet addIndex:](self->_disablingTokens, "addIndex:", a3);
}

- (void)enableWithToken:(unint64_t)a3
{
  -[NSMutableIndexSet removeIndex:](self->_disablingTokens, "removeIndex:", a3);
}

- (void)setFrozen:(BOOL)a3
{
  _BOOL4 v3;
  UIView *contentView;
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
  UISnapshotView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  CGRect v28;
  CGRect v29;

  v3 = a3;
  v27[2] = *MEMORY[0x1E0C80C00];
  if (-[_UIStatusBarRegion isFrozen](self, "isFrozen") != a3)
  {
    if (v3)
    {
      contentView = self->_contentView;
      if (!contentView)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegion.m"), 269, CFSTR("Setting frozen requires a content view"));

        contentView = self->_contentView;
      }
      -[UIView bounds](contentView, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[UIView alpha](self->_contentView, "alpha");
      v16 = v15;
      -[UIView setAlpha:](self->_contentView, "setAlpha:", 1.0);
      v17 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", v8, v10, v12, v14);
      -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](v17, "captureSnapshotRect:fromView:withSnapshotType:", self->_contentView, 0, v8, v10, v12, v14);
      -[_UIStatusBarRegion setFrozenView:](self, "setFrozenView:", v17);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_frozenView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setAlpha:](self->_frozenView, "setAlpha:", v16);
      -[_UIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", self->_frozenView, 1);
      -[UIView widthAnchor](self->_frozenView, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28.origin.x = v8;
      v28.origin.y = v10;
      v28.size.width = v12;
      v28.size.height = v14;
      objc_msgSend(v18, "constraintEqualToConstant:", CGRectGetWidth(v28));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v19;
      -[UIView heightAnchor](self->_frozenView, "heightAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29.origin.x = v8;
      v29.origin.y = v10;
      v29.size.width = v12;
      v29.size.height = v14;
      objc_msgSend(v20, "constraintEqualToConstant:", CGRectGetHeight(v29));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);
      -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);

    }
    else
    {
      -[UIView alpha](self->_frozenView, "alpha");
      v24 = v23;
      -[_UIStatusBarRegion containerView](self, "containerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlpha:", v24);

      -[UIView removeFromSuperview](self->_frozenView, "removeFromSuperview");
      -[_UIStatusBarRegion setFrozenView:](self, "setFrozenView:", 0);
    }
  }
}

- (BOOL)isFrozen
{
  return self->_frozenView != 0;
}

- (void)setAlpha:(double)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v8;

  if (!self->_contentView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegion.m"), 305, CFSTR("Setting alpha requires a content view"));

  }
  v5 = -[_UIStatusBarRegion isFrozen](self, "isFrozen");
  v6 = 104;
  if (v5)
    v6 = 176;
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "setAlpha:", a3);
}

- (void)_overriddenStyleAttributesChanged
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIStatusBarRegion currentEnabledDisplayItems](self, "currentEnabledDisplayItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "item");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsUpdate");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (int64_t)effectiveStyle
{
  int64_t result;

  result = self->_overriddenStyle;
  if (result == 4)
    return self->_style;
  return result;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (self->_overriddenStyle == 4)
      -[_UIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }
}

- (void)setOverriddenStyle:(int64_t)a3
{
  if (self->_overriddenStyle != a3)
  {
    self->_overriddenStyle = a3;
    -[_UIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  id v5;
  _UIStatusBarStyleAttributes *overriddenStyleAttributes;
  _UIStatusBarStyleAttributes *v7;
  BOOL v8;
  _UIStatusBarStyleAttributes *v9;

  v5 = a3;
  overriddenStyleAttributes = self->_overriddenStyleAttributes;
  v9 = (_UIStatusBarStyleAttributes *)v5;
  v7 = overriddenStyleAttributes;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[_UIStatusBarStyleAttributes isEqual:](v9, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
    -[_UIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }
LABEL_9:

}

- (void)setDisplayItems:(id)a3
{
  NSOrderedSet *v5;
  NSOrderedSet *displayItems;
  _BOOL4 needsReLayout;
  NSOrderedSet *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSOrderedSet *v15;
  uint64_t v16;
  NSOrderedSet *v17;
  NSOrderedSet *v18;
  NSOrderedSet *v19;
  void *v20;
  _UIStatusBarRegionLayout *v21;
  void *v22;
  void *v23;
  NSOrderedSet *v24;
  uint64_t v25;
  void *v26;
  _UIStatusBarRegionLayout *layout;
  void *v28;
  NSOrderedSet *v29;
  UIView *contentView;
  UIView *v31;
  UIView *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  UIView *v36;
  _UIStatusBarRegion *v37;
  _QWORD v38[4];
  NSOrderedSet *v39;
  _UIStatusBarRegion *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (NSOrderedSet *)a3;
  displayItems = self->_displayItems;
  if (displayItems != v5 && (-[NSOrderedSet isEqual:](displayItems, "isEqual:", v5) & 1) == 0)
  {
    self->_needsReLayout = 0;
    goto LABEL_16;
  }
  needsReLayout = self->_needsReLayout;
  self->_needsReLayout = 0;
  if (needsReLayout)
    goto LABEL_16;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v5;
  v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v9)
  {
LABEL_29:

    goto LABEL_30;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      if (objc_msgSend(v14, "needsAddingToLayout"))
      {
        objc_msgSend(v14, "setNeedsAddingToLayout:", 0);
        v11 = 1;
      }
    }
    v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
LABEL_16:
    if (!self->_layout)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegion.m"), 371, CFSTR("%@ has no layout"), self);

    }
    v15 = self->_displayItems;
    v16 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __38___UIStatusBarRegion_setDisplayItems___block_invoke;
    v38[3] = &unk_1E16E2368;
    v17 = v5;
    v39 = v17;
    v40 = self;
    -[NSOrderedSet enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v38);
    v18 = (NSOrderedSet *)-[NSOrderedSet copy](v17, "copy");
    v19 = self->_displayItems;
    self->_displayItems = v18;

    -[_UIStatusBarRegion enabledDisplayItems](self, "enabledDisplayItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v21 = self->_layout,
          -[_UIStatusBarRegion containerItem](self, "containerItem"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v21) = -[_UIStatusBarRegionLayout mayFitDisplayItems:inContainerItem:](v21, "mayFitDisplayItems:inContainerItem:", v20, v22), v22, (v21 & 1) == 0))
    {
      v24 = (NSOrderedSet *)-[NSOrderedSet mutableCopy](self->_displayItems, "mutableCopy");
      v23 = (void *)objc_msgSend(v20, "mutableCopy");
      do
      {
        _UIStatusBarGetLowestPrioritizedItem(v23);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          break;
        v26 = (void *)v25;
        objc_msgSend(v23, "removeObject:", v25);
        -[NSOrderedSet removeObject:](v24, "removeObject:", v26);
        objc_msgSend(v26, "setContainerView:", 0);
        objc_msgSend(v26, "setRegion:", 0);

        layout = self->_layout;
        -[_UIStatusBarRegion containerItem](self, "containerItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(layout) = -[_UIStatusBarRegionLayout mayFitDisplayItems:inContainerItem:](layout, "mayFitDisplayItems:inContainerItem:", v23, v28);

      }
      while (!(_DWORD)layout);
      v29 = self->_displayItems;
      self->_displayItems = v24;

    }
    else
    {
      v23 = v20;
    }
    contentView = self->_contentView;
    if (contentView)
    {
      v31 = contentView;
    }
    else
    {
      -[UILayoutGuide owningView](self->_layoutGuide, "owningView");
      v31 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    v35[0] = v16;
    v35[1] = 3221225472;
    v35[2] = __38___UIStatusBarRegion_setDisplayItems___block_invoke_2;
    v35[3] = &unk_1E16E2368;
    v36 = v31;
    v37 = self;
    v32 = v31;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v35);
    -[_UIStatusBarRegion enabledDisplayItems](self, "enabledDisplayItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarRegionLayout setDisplayItems:](self->_layout, "setDisplayItems:", v33);

    v8 = v39;
    goto LABEL_29;
  }
LABEL_30:

}

- (NSArray)enabledDisplayItems
{
  NSOrderedSet *displayItems;
  void *v3;
  void *v4;

  displayItems = self->_displayItems;
  -[NSOrderedSet indexesOfObjectsPassingTest:](displayItems, "indexesOfObjectsPassingTest:", &__block_literal_global_495);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet objectsAtIndexes:](displayItems, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)currentEnabledDisplayItems
{
  NSOrderedSet *displayItems;
  void *v3;
  void *v4;
  _QWORD v6[5];

  displayItems = self->_displayItems;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___UIStatusBarRegion_currentEnabledDisplayItems__block_invoke;
  v6[3] = &unk_1E16E2920;
  v6[4] = self;
  -[NSOrderedSet indexesOfObjectsPassingTest:](displayItems, "indexesOfObjectsPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet objectsAtIndexes:](displayItems, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (_UIStatusBarDisplayItem)overflowedDisplayItem
{
  void *v3;

  if ((-[_UIStatusBarRegionLayout fitsAllItems](self->_layout, "fitsAllItems") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    _UIStatusBarGetLowestPrioritizedItem(self->_displayItems);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (_UIStatusBarDisplayItem *)v3;
}

- (NSDictionary)displayItemAbsoluteFrames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarRegion layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___UIStatusBarRegion_displayItemAbsoluteFrames__block_invoke;
  v8[3] = &unk_1E16E05E0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return (NSDictionary *)v6;
}

- (id)displayItemForHUDAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double MinX;
  uint64_t v20;
  double v24;
  id v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[_UIStatusBarRegion layout](self, "layout", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    v12 = 1.79769313e308;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      if (CGRectIsEmpty(v35))
        goto LABEL_18;
      -[_UIStatusBarRegion statusBar](self, "statusBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertPoint:toView:", v15, x, y);
      v18 = v17;

      objc_msgSend(v15, "bounds");
      if ((objc_msgSend(v15, "pointInside:withEvent:", 0, v18, CGRectGetMidY(v36)) & 1) != 0)
      {
        v27 = v14;

        goto LABEL_24;
      }
      objc_msgSend(v15, "bounds");
      MinX = CGRectGetMinX(v37);
      objc_msgSend(v15, "bounds");
      if (v18 <= MinX)
        break;
      if (v18 >= CGRectGetMaxX(*(CGRect *)&v20))
      {
        objc_msgSend(v15, "bounds");
        v24 = v18 - CGRectGetMaxX(v38);
LABEL_12:
        if (v24 < 6.0 && v24 < v12)
        {
          v26 = v14;

          v10 = v26;
          v12 = v24;
        }
      }
LABEL_18:

      if (v9 == ++v13)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
    v24 = CGRectGetMinX(*(CGRect *)&v20) - v18;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_23:

  v10 = v10;
  v27 = v10;
LABEL_24:

  return v27;
}

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (UIEdgeInsets)actionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_actionInsets.top;
  left = self->_actionInsets.left;
  bottom = self->_actionInsets.bottom;
  right = self->_actionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (_UIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
  objc_storeStrong((id *)&self->_hoverAction, a3);
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_extendedHoverInsets.top;
  leading = self->_extendedHoverInsets.leading;
  bottom = self->_extendedHoverInsets.bottom;
  trailing = self->_extendedHoverInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_UIStatusBar)statusBar
{
  return (_UIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (_UIStatusBarRegionLayout)layout
{
  return self->_layout;
}

- (NSSet)dependentRegionIdentifiers
{
  return self->_dependentRegionIdentifiers;
}

- (void)setDependentRegionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, a3);
}

- (_UIStatusBarRegion)enabilityRegion
{
  return (_UIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_enabilityRegion);
}

- (void)setEnabilityRegion:(id)a3
{
  objc_storeWeak((id *)&self->_enabilityRegion, a3);
}

- (BOOL)offsetable
{
  return self->_offsetable;
}

- (UIOffset)offset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_offset.horizontal;
  vertical = self->_offset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)overriddenStyle
{
  return self->_overriddenStyle;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (NSOrderedSet)displayItems
{
  return self->_displayItems;
}

- (BOOL)needsReLayout
{
  return self->_needsReLayout;
}

- (void)setNeedsReLayout:(BOOL)a3
{
  self->_needsReLayout = a3;
}

- (BOOL)disableItemFrameBasedOverflow
{
  return self->_disableItemFrameBasedOverflow;
}

- (void)setDisableItemFrameBasedOverflow:(BOOL)a3
{
  self->_disableItemFrameBasedOverflow = a3;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
  objc_storeStrong((id *)&self->_disablingTokens, a3);
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerXConstraint, a3);
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerYConstraint, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)frozenView
{
  return self->_frozenView;
}

- (void)setFrozenView:(id)a3
{
  objc_storeStrong((id *)&self->_frozenView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_destroyWeak((id *)&self->_enabilityRegion);
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
