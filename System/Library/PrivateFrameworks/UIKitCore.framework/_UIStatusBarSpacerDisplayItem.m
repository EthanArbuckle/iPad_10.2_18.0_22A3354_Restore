@implementation _UIStatusBarSpacerDisplayItem

- (_UIStatusBarSpacerDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  _UIStatusBarSpacerDisplayItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarSpacerDisplayItem;
  result = -[_UIStatusBarDisplayItem initWithIdentifier:item:](&v5, sel_initWithIdentifier_item_, a3, a4);
  result->_size = (CGSize)vdupq_n_s64(0x7FF0000000000000uLL);
  return result;
}

- (void)applyUpdate:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *constraints;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "placementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "CGSizeValue");
    v8 = v6;
    v9 = v7;
    if (v6 != self->_size.width || v7 != self->_size.height)
    {
      self->_size.width = v6;
      self->_size.height = v7;
      if (self->_constraints)
        objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      -[UILayoutGuide widthAnchor](self->_layoutGuide, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      -[UILayoutGuide heightAnchor](self->_layoutGuide, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      constraints = self->_constraints;
      self->_constraints = v15;

      -[_UIStatusBarSpacerDisplayItem _applyConstraintsIfNeeded](self, "_applyConstraintsIfNeeded");
    }
  }

}

- (void)setContainerView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[_UIStatusBarDisplayItem containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[_UIStatusBarDisplayItem containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_constraints);
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarSpacerDisplayItem;
    -[_UIStatusBarDisplayItem setContainerView:](&v7, sel_setContainerView_, v4);
    -[_UIStatusBarSpacerDisplayItem _applyConstraintsIfNeeded](self, "_applyConstraintsIfNeeded");
  }

}

- (void)_applyConstraintsIfNeeded
{
  void *v3;

  if (self->_constraints)
  {
    -[_UIStatusBarDisplayItem containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_constraints);
  }
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
}

@end
