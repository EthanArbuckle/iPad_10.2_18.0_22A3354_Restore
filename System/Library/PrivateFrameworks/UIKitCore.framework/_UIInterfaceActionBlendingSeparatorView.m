@implementation _UIInterfaceActionBlendingSeparatorView

- (_UIInterfaceActionBlendingSeparatorView)initWithTopLevelFilters:(id)a3 compositingColors:(id)a4 compositingFilterModes:(id)a5
{
  _UIInterfaceActionBlendingSeparatorView *v5;
  _UIInterfaceActionSeparatorConstraintController *v6;
  _UIInterfaceActionSeparatorConstraintController *separatorViewConstraints;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceActionBlendingSeparatorView;
  v5 = -[_UIBlendingHighlightView initWithTopLevelFilters:compositingColors:compositingFilterModes:](&v9, sel_initWithTopLevelFilters_compositingColors_compositingFilterModes_, a3, a4, a5);
  if (v5)
  {
    v6 = -[_UIInterfaceActionSeparatorConstraintController initWithSeparatorView:]([_UIInterfaceActionSeparatorConstraintController alloc], "initWithSeparatorView:", v5);
    separatorViewConstraints = v5->_separatorViewConstraints;
    v5->_separatorViewConstraints = v6;

  }
  return v5;
}

- (_UIInterfaceActionBlendingSeparatorView)init
{
  void *v3;
  void *v4;
  _UIInterfaceActionBlendingSeparatorView *v5;
  objc_super v7;

  +[UIColor _vibrantLightDividerBurnColor](UIColor, "_vibrantLightDividerBurnColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _vibrantLightDividerDarkeningColor](UIColor, "_vibrantLightDividerDarkeningColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_UIInterfaceActionBlendingSeparatorView;
  v5 = -[_UIBlendingHighlightView initWithCompositingBurnColor:plusDColor:](&v7, sel_initWithCompositingBurnColor_plusDColor_, v3, v4);

  return v5;
}

- (void)setConstantAxisDimension:(double)a3
{
  -[_UIInterfaceActionSeparatorConstraintController setConstantAxisDimension:](self->_separatorViewConstraints, "setConstantAxisDimension:", a3);
}

- (double)constantAxisDimension
{
  double result;

  -[_UIInterfaceActionSeparatorConstraintController constantAxisDimension](self->_separatorViewConstraints, "constantAxisDimension");
  return result;
}

- (void)setHorizontalLineLeadingInset:(double)a3
{
  if (self->_horizontalLineLeadingInset != a3)
  {
    self->_horizontalLineLeadingInset = a3;
    -[_UIInterfaceActionBlendingSeparatorView _updateContentDirectionalInsets](self, "_updateContentDirectionalInsets");
  }
}

- (void)setConstantSizedAxis:(int64_t)a3
{
  -[_UIInterfaceActionSeparatorConstraintController setConstantSizedAxis:](self->_separatorViewConstraints, "setConstantSizedAxis:", a3);
  -[_UIInterfaceActionBlendingSeparatorView _updateContentDirectionalInsets](self, "_updateContentDirectionalInsets");
}

- (int64_t)constantSizedAxis
{
  return -[_UIInterfaceActionSeparatorConstraintController constantSizedAxis](self->_separatorViewConstraints, "constantSizedAxis");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionBlendingSeparatorView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionSeparatorConstraintController separatorViewDidUpdateConstraints](self->_separatorViewConstraints, "separatorViewDidUpdateConstraints");
}

- (void)_updateContentDirectionalInsets
{
  int64_t v3;
  double v4;
  double v5;

  v3 = -[_UIInterfaceActionBlendingSeparatorView constantSizedAxis](self, "constantSizedAxis");
  v4 = 0.0;
  if (v3 == 1)
  {
    -[_UIInterfaceActionBlendingSeparatorView horizontalLineLeadingInset](self, "horizontalLineLeadingInset");
    v4 = v5 + 0.0;
  }
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, v4, 0.0, 0.0);
}

- (double)horizontalLineLeadingInset
{
  return self->_horizontalLineLeadingInset;
}

- (_UIInterfaceActionSeparatorConstraintController)separatorViewConstraints
{
  return self->_separatorViewConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViewConstraints, 0);
}

@end
