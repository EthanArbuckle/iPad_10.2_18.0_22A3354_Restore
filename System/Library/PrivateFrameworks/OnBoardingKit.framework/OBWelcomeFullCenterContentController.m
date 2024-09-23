@implementation OBWelcomeFullCenterContentController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeFullCenterContentController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[OBWelcomeFullCenterContentController insertCenterContentView](self, "insertCenterContentView");
}

- (void)setCenteredContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v9)
  {
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[OBWelcomeFullCenterContentController setCenterContentView:](self, "setCenterContentView:", v9);
  }
  if (-[OBWelcomeFullCenterContentController isViewLoaded](self, "isViewLoaded"))
    -[OBWelcomeFullCenterContentController insertCenterContentView](self, "insertCenterContentView");

}

- (void)insertCenterContentView
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[OBWelcomeController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v41;
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v36;
    -[OBWelcomeController contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v11;
    -[OBWelcomeController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController setFloatingConstraintGroup:](self, "setFloatingConstraintGroup:", v17);

    -[OBWelcomeController contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController _availablePreScrollContentHeight](self, "_availablePreScrollContentHeight");
    objc_msgSend(v19, "constraintEqualToConstant:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController setContentViewOptionalHeightAnchor:](self, "setContentViewOptionalHeightAnchor:", v20);

    -[OBWelcomeFullCenterContentController contentViewOptionalHeightAnchor](self, "contentViewOptionalHeightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[OBWelcomeFullCenterContentController contentViewOptionalHeightAnchor](self, "contentViewOptionalHeightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1132068864;
    objc_msgSend(v22, "setPriority:", v23);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeFullCenterContentController floatingConstraintGroup](self, "floatingConstraintGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v25);

    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ob_pinToEdgesConstraints:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeFullCenterContentController setPinnedConstraintGroup:](self, "setPinnedConstraintGroup:", v33);

  }
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  -[OBWelcomeFullCenterContentController _availablePreScrollContentHeight](self, "_availablePreScrollContentHeight");
  v4 = v3;
  -[OBWelcomeFullCenterContentController contentViewOptionalHeightAnchor](self, "contentViewOptionalHeightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  v14.receiver = self;
  v14.super_class = (Class)OBWelcomeFullCenterContentController;
  -[OBWelcomeController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[OBWelcomeFullCenterContentController recalculateLayoutForTraitCollectionChange](self, "recalculateLayoutForTraitCollectionChange");
  -[OBWelcomeController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  if (v7 == 0.0)
  {
    -[OBWelcomeController headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      -[OBWelcomeController headerView](self, "headerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        return;
    }
    -[OBWelcomeFullCenterContentController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");
  }

}

- (double)_availablePreScrollContentHeight
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

  -[OBWelcomeController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[OBWelcomeController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v5 - v7;

  -[OBWelcomeController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v8 - v10;

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeFullCenterContentController;
  -[OBWelcomeController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBWelcomeFullCenterContentController recalculateLayoutForTraitCollectionChange](self, "recalculateLayoutForTraitCollectionChange");
}

- (void)recalculateLayoutForTraitCollectionChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;

  -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[OBWelcomeFullCenterContentController _availablePreScrollContentHeight](self, "_availablePreScrollContentHeight");
  if (v5 <= v6)
  {

  }
  else
  {
    -[OBWelcomeFullCenterContentController floatingConstraintGroup](self, "floatingConstraintGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isActive");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeFullCenterContentController floatingConstraintGroup](self, "floatingConstraintGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivateConstraints:", v11);

      v12 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeFullCenterContentController pinnedConstraintGroup](self, "pinnedConstraintGroup");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v22 = (id)v13;
      objc_msgSend(v12, "activateConstraints:", v13);
      goto LABEL_9;
    }
  }
  -[OBWelcomeFullCenterContentController centerContentView](self, "centerContentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v15 = v14;
  -[OBWelcomeFullCenterContentController _availablePreScrollContentHeight](self, "_availablePreScrollContentHeight");
  if (v15 < v16)
  {
    -[OBWelcomeFullCenterContentController pinnedConstraintGroup](self, "pinnedConstraintGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isActive");

    if (!v19)
      return;
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeFullCenterContentController pinnedConstraintGroup](self, "pinnedConstraintGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deactivateConstraints:", v21);

    v12 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeFullCenterContentController floatingConstraintGroup](self, "floatingConstraintGroup");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
  objc_storeStrong((id *)&self->_centerContentView, a3);
}

- (NSLayoutConstraint)contentViewOptionalHeightAnchor
{
  return self->_contentViewOptionalHeightAnchor;
}

- (void)setContentViewOptionalHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, a3);
}

- (double)contentViewMaxHeight
{
  return self->_contentViewMaxHeight;
}

- (void)setContentViewMaxHeight:(double)a3
{
  self->_contentViewMaxHeight = a3;
}

- (NSArray)floatingConstraintGroup
{
  return self->_floatingConstraintGroup;
}

- (void)setFloatingConstraintGroup:(id)a3
{
  objc_storeStrong((id *)&self->_floatingConstraintGroup, a3);
}

- (NSArray)pinnedConstraintGroup
{
  return self->_pinnedConstraintGroup;
}

- (void)setPinnedConstraintGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, 0);
  objc_storeStrong((id *)&self->_floatingConstraintGroup, 0);
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, 0);
  objc_storeStrong((id *)&self->_centerContentView, 0);
}

@end
