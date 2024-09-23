@implementation _UIInterfaceActionSeparatorConstraintController

- (_UIInterfaceActionSeparatorConstraintController)initWithSeparatorView:(id)a3
{
  id v4;
  _UIInterfaceActionSeparatorConstraintController *v5;
  _UIInterfaceActionSeparatorConstraintController *v6;
  void *v7;
  uint64_t v8;
  NSLayoutConstraint *fixedWidthConstraint;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *fixedHeightConstraint;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIInterfaceActionSeparatorConstraintController;
  v5 = -[_UIInterfaceActionSeparatorConstraintController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_separatorView, v4);
    objc_msgSend(v4, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
    v8 = objc_claimAutoreleasedReturnValue();
    fixedWidthConstraint = v6->_fixedWidthConstraint;
    v6->_fixedWidthConstraint = (NSLayoutConstraint *)v8;

    -[NSLayoutConstraint setIdentifier:](v6->_fixedWidthConstraint, "setIdentifier:", CFSTR("verticalSeparatorWidth"));
    objc_msgSend(v4, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
    v11 = objc_claimAutoreleasedReturnValue();
    fixedHeightConstraint = v6->_fixedHeightConstraint;
    v6->_fixedHeightConstraint = (NSLayoutConstraint *)v11;

    -[NSLayoutConstraint setIdentifier:](v6->_fixedHeightConstraint, "setIdentifier:", CFSTR("horizontalSeparatorHeight"));
    LODWORD(v13) = 1148829696;
    -[NSLayoutConstraint setPriority:](v6->_fixedHeightConstraint, "setPriority:", v13);
    v6->_constantSizedAxis = 1;
    v6->_constantAxisDimension = -1.0;
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setNeedsUpdateConstraints");
    -[_UIInterfaceActionSeparatorConstraintController _updateConstantSizedConstraints](v6, "_updateConstantSizedConstraints");
  }

  return v6;
}

- (void)setConstantSizedAxis:(int64_t)a3
{
  const __CFString *v4;
  id WeakRetained;

  if (self->_constantSizedAxis != a3)
  {
    self->_constantSizedAxis = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    if (-[_UIInterfaceActionSeparatorConstraintController _isFixedWidth](self, "_isFixedWidth"))
      v4 = CFSTR("separator|");
    else
      v4 = CFSTR("separator__");
    objc_msgSend(WeakRetained, "_setLayoutDebuggingIdentifier:", v4);
    objc_msgSend(WeakRetained, "setNeedsUpdateConstraints");
    objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

  }
}

- (void)setConstantAxisDimension:(double)a3
{
  id WeakRetained;

  if (self->_constantAxisDimension != a3)
  {
    self->_constantAxisDimension = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    objc_msgSend(WeakRetained, "setNeedsUpdateConstraints");

  }
}

- (double)constantAxisDimension
{
  double result;
  id WeakRetained;
  void *v4;
  NSString *v5;
  double v6;
  double v7;

  result = self->_constantAxisDimension;
  if (result < 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    objc_msgSend(WeakRetained, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!UIContentSizeCategoryIsAccessibilityCategory(v5))
      objc_msgSend(WeakRetained, "_currentScreenScale", 1.0);
    UIRoundToViewScale(WeakRetained);
    v7 = v6;

    return v7;
  }
  return result;
}

- (void)_updateConstantSizedConstraints
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  if (-[_UIInterfaceActionSeparatorConstraintController _isFixedWidth](self, "_isFixedWidth"))
    v3 = 32;
  else
    v3 = 24;
  v6 = *(id *)((char *)&self->super.isa + v3);
  if (-[_UIInterfaceActionSeparatorConstraintController _isFixedWidth](self, "_isFixedWidth"))
    v4 = 24;
  else
    v4 = 32;
  v5 = *(id *)((char *)&self->super.isa + v4);
  objc_msgSend(v5, "setActive:", 0);
  -[_UIInterfaceActionSeparatorConstraintController constantAxisDimension](self, "constantAxisDimension");
  objc_msgSend(v6, "setConstant:");
  objc_msgSend(v6, "setActive:", 1);

}

- (BOOL)_isFixedWidth
{
  return self->_constantSizedAxis == 0;
}

- (UIInterfaceActionVisualSeparatorDisplaying)separatorView
{
  return (UIInterfaceActionVisualSeparatorDisplaying *)objc_loadWeakRetained((id *)&self->_separatorView);
}

- (NSLayoutConstraint)fixedHeightConstraint
{
  return self->_fixedHeightConstraint;
}

- (NSLayoutConstraint)fixedWidthConstraint
{
  return self->_fixedWidthConstraint;
}

- (int64_t)constantSizedAxis
{
  return self->_constantSizedAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedWidthConstraint, 0);
  objc_storeStrong((id *)&self->_fixedHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_separatorView);
}

@end
