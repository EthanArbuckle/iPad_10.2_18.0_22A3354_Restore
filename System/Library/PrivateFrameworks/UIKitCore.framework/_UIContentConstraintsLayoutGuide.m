@implementation _UIContentConstraintsLayoutGuide

- (_UIContentConstraintsLayoutGuide)init
{
  _UIContentConstraintsLayoutGuide *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContentConstraintsLayoutGuide;
  result = -[UILayoutGuide init](&v3, sel_init);
  if (result)
  {
    result->_maximumSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    result->_minimumSize = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return result;
}

- (void)setOwningView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *leadingConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *trailingConstraint;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *topConstraint;
  double v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *bottomConstraint;
  double v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *maximumWidthConstraint;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *maximumHeightConstraint;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *minimumWidthConstraint;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *minimumHeightConstraint;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;

  v4 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[_UIContentConstraintsLayoutGuide _clearConstraints](self, "_clearConstraints");
    v40.receiver = self;
    v40.super_class = (Class)_UIContentConstraintsLayoutGuide;
    -[UILayoutGuide setOwningView:](&v40, sel_setOwningView_, v4);
    if (v4)
    {
      -[UILayoutGuide leadingAnchor](self, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leadingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 0.0);
      v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      leadingConstraint = self->_leadingConstraint;
      self->_leadingConstraint = v8;

      -[UILayoutGuide trailingAnchor](self, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0);
      v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      trailingConstraint = self->_trailingConstraint;
      self->_trailingConstraint = v12;

      -[UILayoutGuide topAnchor](self, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
      v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      topConstraint = self->_topConstraint;
      self->_topConstraint = v16;

      LODWORD(v18) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_topConstraint, "setPriority:", v18);
      -[UILayoutGuide bottomAnchor](self, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v21;

      LODWORD(v23) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_bottomConstraint, "setPriority:", v23);
      -[UILayoutGuide widthAnchor](self, "widthAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintLessThanOrEqualToConstant:", 0.0);
      v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      maximumWidthConstraint = self->_maximumWidthConstraint;
      self->_maximumWidthConstraint = v25;

      -[UILayoutGuide heightAnchor](self, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintLessThanOrEqualToConstant:", 0.0);
      v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      maximumHeightConstraint = self->_maximumHeightConstraint;
      self->_maximumHeightConstraint = v28;

      -[UILayoutGuide widthAnchor](self, "widthAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:", 0.0);
      v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      minimumWidthConstraint = self->_minimumWidthConstraint;
      self->_minimumWidthConstraint = v31;

      -[UILayoutGuide heightAnchor](self, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintGreaterThanOrEqualToConstant:", 0.0);
      v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      minimumHeightConstraint = self->_minimumHeightConstraint;
      self->_minimumHeightConstraint = v34;

      LODWORD(v36) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_maximumWidthConstraint, "setPriority:", v36);
      LODWORD(v37) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_maximumHeightConstraint, "setPriority:", v37);
      LODWORD(v38) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_minimumWidthConstraint, "setPriority:", v38);
      LODWORD(v39) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_minimumHeightConstraint, "setPriority:", v39);
      -[_UIContentConstraintsLayoutGuide _updateAllMarginConstraintConstants](self, "_updateAllMarginConstraintConstants");
      -[_UIContentConstraintsLayoutGuide _setAllMarginConstraintsActive:](self, "_setAllMarginConstraintsActive:", 1);
      -[_UIContentConstraintsLayoutGuide _updateAllSizeConstraints](self, "_updateAllSizeConstraints");
      -[_UIContentConstraintsLayoutGuide _setAllSizeConstraintsActive:](self, "_setAllSizeConstraintsActive:", 1);
    }
  }

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[_UIContentConstraintsLayoutGuide _updateAllMarginConstraintConstants](self, "_updateAllMarginConstraintConstants");
  }
}

- (void)setMaximumSize:(CGSize)a3
{
  double width;
  double height;
  double v6;
  double v7;

  if (fabs(a3.width) >= 0.5)
    width = a3.width;
  else
    width = 1.79769313e308;
  if (fabs(a3.height) >= 0.5)
    height = a3.height;
  else
    height = 1.79769313e308;
  -[_UIContentConstraintsLayoutGuide maximumSize](self, "maximumSize");
  if (width != v7 || height != v6)
  {
    self->_maximumSize.width = width;
    self->_maximumSize.height = height;
    -[_UIContentConstraintsLayoutGuide _updateAllSizeConstraints](self, "_updateAllSizeConstraints");
  }
}

- (void)setMinimumSize:(CGSize)a3
{
  double width;
  double height;
  double v6;
  double v7;

  if (fabs(a3.width) >= 0.5)
    width = a3.width;
  else
    width = 0.0;
  if (fabs(a3.height) >= 0.5)
    height = a3.height;
  else
    height = 0.0;
  -[_UIContentConstraintsLayoutGuide minimumSize](self, "minimumSize");
  if (width != v7 || height != v6)
  {
    self->_minimumSize.width = width;
    self->_minimumSize.height = height;
    -[_UIContentConstraintsLayoutGuide _updateAllSizeConstraints](self, "_updateAllSizeConstraints");
  }
}

- (id)_allMarginConstraints
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_leadingConstraint, self->_trailingConstraint, self->_topConstraint, self->_bottomConstraint, 0);
}

- (id)_allSizeConstraints
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_maximumWidthConstraint, self->_maximumHeightConstraint, self->_minimumWidthConstraint, self->_minimumHeightConstraint, 0);
}

- (void)_setAllMarginConstraintsActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContentConstraintsLayoutGuide _allMarginConstraints](self, "_allMarginConstraints");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "activateConstraints:", v5);
  else
    objc_msgSend(v4, "deactivateConstraints:", v5);

}

- (void)_setAllSizeConstraintsActive:(BOOL)a3
{
  self->_wantsMaximumSizeConstraintsActive = a3;
  self->_wantsMinimumSizeConstraintsActive = a3;
  -[_UIContentConstraintsLayoutGuide _updateAllSizeConstraints](self, "_updateAllSizeConstraints");
}

- (void)_updateAllMarginConstraintConstants
{
  UIEdgeInsets *p_edgeInsets;

  p_edgeInsets = &self->_edgeInsets;
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", self->_edgeInsets.left);
  -[NSLayoutConstraint setConstant:](self->_trailingConstraint, "setConstant:", -p_edgeInsets->right);
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", p_edgeInsets->top);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -p_edgeInsets->bottom);
}

- (void)_updateAllSizeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_maximumSize.width < 1.79769313e308)
  {
    -[NSLayoutConstraint setConstant:](self->_maximumWidthConstraint, "setConstant:");
    if (self->_wantsMaximumSizeConstraintsActive)
      objc_msgSend(v8, "addObject:", self->_maximumWidthConstraint);
  }
  if (self->_maximumSize.height < 1.79769313e308)
  {
    -[NSLayoutConstraint setConstant:](self->_maximumHeightConstraint, "setConstant:");
    if (self->_wantsMaximumSizeConstraintsActive)
      objc_msgSend(v8, "addObject:", self->_maximumHeightConstraint);
  }
  if (self->_minimumSize.width > 0.00000011920929)
  {
    -[NSLayoutConstraint setConstant:](self->_minimumWidthConstraint, "setConstant:");
    if (self->_wantsMinimumSizeConstraintsActive)
      objc_msgSend(v8, "addObject:", self->_minimumWidthConstraint);
  }
  if (self->_minimumSize.height > 0.00000011920929)
  {
    -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:");
    if (self->_wantsMinimumSizeConstraintsActive)
      objc_msgSend(v8, "addObject:", self->_minimumHeightConstraint);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", self->_maximumWidthConstraint, self->_maximumHeightConstraint, self->_minimumWidthConstraint, self->_minimumHeightConstraint, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v8);
  v4 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v8, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v5);

  v6 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

}

- (void)_clearConstraints
{
  NSLayoutConstraint *leadingConstraint;
  NSLayoutConstraint *trailingConstraint;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *maximumWidthConstraint;
  NSLayoutConstraint *maximumHeightConstraint;
  NSLayoutConstraint *minimumWidthConstraint;
  NSLayoutConstraint *minimumHeightConstraint;

  -[_UIContentConstraintsLayoutGuide _setAllMarginConstraintsActive:](self, "_setAllMarginConstraintsActive:", 0);
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = 0;

  trailingConstraint = self->_trailingConstraint;
  self->_trailingConstraint = 0;

  topConstraint = self->_topConstraint;
  self->_topConstraint = 0;

  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = 0;

  -[_UIContentConstraintsLayoutGuide _setAllSizeConstraintsActive:](self, "_setAllSizeConstraintsActive:", 0);
  maximumWidthConstraint = self->_maximumWidthConstraint;
  self->_maximumWidthConstraint = 0;

  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = 0;

  minimumWidthConstraint = self->_minimumWidthConstraint;
  self->_minimumWidthConstraint = 0;

  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = 0;

}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (BOOL)wantsMaximumSizeConstraintsActive
{
  return self->_wantsMaximumSizeConstraintsActive;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (NSLayoutConstraint)maximumHeightConstraint
{
  return self->_maximumHeightConstraint;
}

- (BOOL)wantsMinimumSizeConstraintsActive
{
  return self->_wantsMinimumSizeConstraintsActive;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
}

@end
