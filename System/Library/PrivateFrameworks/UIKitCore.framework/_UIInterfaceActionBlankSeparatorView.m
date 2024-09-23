@implementation _UIInterfaceActionBlankSeparatorView

- (_UIInterfaceActionBlankSeparatorView)init
{
  _UIInterfaceActionBlankSeparatorView *v2;
  _UIInterfaceActionSeparatorConstraintController *v3;
  _UIInterfaceActionSeparatorConstraintController *separatorViewConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIInterfaceActionBlankSeparatorView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = -[_UIInterfaceActionSeparatorConstraintController initWithSeparatorView:]([_UIInterfaceActionSeparatorConstraintController alloc], "initWithSeparatorView:", v2);
    separatorViewConstraints = v2->_separatorViewConstraints;
    v2->_separatorViewConstraints = v3;

  }
  return v2;
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

- (void)setConstantSizedAxis:(int64_t)a3
{
  -[_UIInterfaceActionSeparatorConstraintController setConstantSizedAxis:](self->_separatorViewConstraints, "setConstantSizedAxis:", a3);
}

- (void)setHorizontalLineLeadingInset:(double)a3
{
  self->_horizontalLineLeadingInset = a3;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionBlankSeparatorView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionSeparatorConstraintController separatorViewDidUpdateConstraints](self->_separatorViewConstraints, "separatorViewDidUpdateConstraints");
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
