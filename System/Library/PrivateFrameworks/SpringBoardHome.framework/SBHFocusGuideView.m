@implementation SBHFocusGuideView

- (SBHFocusGuideView)initWithFrame:(CGRect)a3
{
  SBHFocusGuideView *v3;
  UIFocusGuide *v4;
  UIFocusGuide *focusGuide;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SBHFocusGuideView;
  v3 = -[SBHFocusGuideView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v4;

    -[SBHFocusGuideView addLayoutGuide:](v3, "addLayoutGuide:", v3->_focusGuide);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UIFocusGuide topAnchor](v3->_focusGuide, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHFocusGuideView topAnchor](v3, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    -[UIFocusGuide bottomAnchor](v3->_focusGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHFocusGuideView bottomAnchor](v3, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v7;
    -[UIFocusGuide leadingAnchor](v3->_focusGuide, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHFocusGuideView leadingAnchor](v3, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v10;
    -[UIFocusGuide trailingAnchor](v3->_focusGuide, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHFocusGuideView trailingAnchor](v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v14);

    -[SBHFocusGuideView _updateTargetedView](v3, "_updateTargetedView");
  }
  return v3;
}

- (void)setTargetView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_targetView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_targetView, a3);
    -[SBHFocusGuideView _updateTargetedView](self, "_updateTargetedView");
    v5 = v6;
  }

}

- (void)_updateTargetedView
{
  UIFocusGuide *focusGuide;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  focusGuide = self->_focusGuide;
  if (self->_targetView)
  {
    v4[0] = self->_targetView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setPreferredFocusEnvironments:](focusGuide, "setPreferredFocusEnvironments:", v3);

  }
  else
  {
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_focusGuide, "setPreferredFocusEnvironments:", 0);
  }
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

@end
