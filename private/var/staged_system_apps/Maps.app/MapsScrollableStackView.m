@implementation MapsScrollableStackView

- (MapsScrollableStackView)initWithArrangedSubviews:(id)a3
{
  id v4;
  MapsScrollableStackView *v5;
  MapsScrollableStackView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MapsScrollableStackView;
  v5 = -[MapsScrollableStackView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
    -[MapsScrollableStackView _setupViewsWithSubviews:](v5, "_setupViewsWithSubviews:", v4);

  return v6;
}

- (void)_setupViewsWithSubviews:(id)a3
{
  id v4;
  double leading;
  double bottom;
  double trailing;
  UIStackView *v8;
  UIStackView *stackView;
  id v10;

  v4 = a3;
  -[MapsScrollableStackView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  leading = NSDirectionalEdgeInsetsZero.leading;
  bottom = NSDirectionalEdgeInsetsZero.bottom;
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  -[MapsScrollableStackView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);
  -[MapsScrollableStackView setScrollEnabled:](self, "setScrollEnabled:", 1);
  v8 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v4);

  stackView = self->_stackView;
  self->_stackView = v8;

  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 0.0);
  -[UIStackView setDirectionalLayoutMargins:](self->_stackView, "setDirectionalLayoutMargins:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);
  -[UIStackView setPreservesSuperviewLayoutMargins:](self->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MapsScrollableStackView addSubview:](self, "addSubview:", self->_stackView);
  v10 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", self->_stackView, self);
  objc_msgSend(v10, "activate");

  -[MapsScrollableStackView _updateOrientationWithNewAxis:](self, "_updateOrientationWithNewAxis:", 1);
}

- (int64_t)alignment
{
  return -[UIStackView alignment](self->_stackView, "alignment");
}

- (void)setAlignment:(int64_t)a3
{
  if (-[UIStackView alignment](self->_stackView, "alignment") != a3)
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", a3);
}

- (int64_t)distribution
{
  return -[UIStackView distribution](self->_stackView, "distribution");
}

- (void)setDistribution:(int64_t)a3
{
  if (-[UIStackView distribution](self->_stackView, "distribution") != a3)
    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", a3);
}

- (int64_t)axis
{
  return -[UIStackView axis](self->_stackView, "axis");
}

- (void)setAxis:(int64_t)a3
{
  if (-[MapsScrollableStackView axis](self, "axis") != a3)
    -[MapsScrollableStackView _updateOrientationWithNewAxis:](self, "_updateOrientationWithNewAxis:", a3);
}

- (void)setSpacing:(double)a3
{
  double v5;

  -[MapsScrollableStackView spacing](self, "spacing");
  if (v5 != a3)
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", a3);
}

- (double)spacing
{
  double result;

  -[UIStackView spacing](self->_stackView, "spacing");
  return result;
}

- (void)addArrangedSubview:(id)a3
{
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", a3);
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", a4, a3);
}

- (void)removeArrangedSubview:(id)a3
{
  -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", a3);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", a3, a4);
}

- (NSArray)arrangedSubviews
{
  return -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
}

- (void)setFittingSizePriority:(float)a3
{
  if (self->_fittingSizePriority != a3)
  {
    self->_fittingSizePriority = a3;
    -[MapsScrollableStackView _updateOrientationWithNewAxis:](self, "_updateOrientationWithNewAxis:", -[MapsScrollableStackView axis](self, "axis"));
  }
}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsScrollableStackView;
  -[MapsScrollableStackView adjustedContentInsetDidChange](&v3, "adjustedContentInsetDidChange");
  -[MapsScrollableStackView _updateConstraintConstants](self, "_updateConstraintConstants");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateOrientationWithNewAxis:(int64_t)a3
{
  void *v5;
  NSLayoutConstraint *distributionConstraint;
  NSLayoutConstraint *alignmentConstraint;
  int64_t v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *v19;
  double v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  id v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView _constraints](self, "_constraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  distributionConstraint = self->_distributionConstraint;
  self->_distributionConstraint = 0;

  alignmentConstraint = self->_alignmentConstraint;
  self->_alignmentConstraint = 0;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", a3);
  v8 = -[MapsScrollableStackView axis](self, "axis");
  if (v8 == 1)
  {
    if (self->_fittingSizePriority > 0.0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_stackView, "heightAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView heightAnchor](self, "heightAnchor"));
      v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
      v19 = self->_distributionConstraint;
      self->_distributionConstraint = v18;

      *(float *)&v20 = self->_fittingSizePriority;
      -[NSLayoutConstraint setPriority:](self->_distributionConstraint, "setPriority:", v20);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_stackView, "widthAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView widthAnchor](self, "widthAnchor"));
    goto LABEL_9;
  }
  if (!v8)
  {
    if (self->_fittingSizePriority > 0.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_stackView, "widthAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView widthAnchor](self, "widthAnchor"));
      v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
      v12 = self->_distributionConstraint;
      self->_distributionConstraint = v11;

      *(float *)&v13 = self->_fittingSizePriority;
      -[NSLayoutConstraint setPriority:](self->_distributionConstraint, "setPriority:", v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_stackView, "heightAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView heightAnchor](self, "heightAnchor"));
LABEL_9:
    v21 = (void *)v15;
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v23 = self->_alignmentConstraint;
    self->_alignmentConstraint = v22;

  }
  -[MapsScrollableStackView _updateConstraintConstants](self, "_updateConstraintConstants");
  v24 = (id)objc_claimAutoreleasedReturnValue(-[MapsScrollableStackView _constraints](self, "_constraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (id)_constraints
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_distributionConstraint)
    objc_msgSend(v3, "addObject:");
  if (self->_alignmentConstraint)
    objc_msgSend(v4, "addObject:");
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (void)_updateConstraintConstants
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[MapsScrollableStackView adjustedContentInset](self, "adjustedContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[MapsScrollableStackView axis](self, "axis");
  v12 = 0.0;
  v13 = v4 + v8;
  if (v11)
    v14 = 0.0;
  else
    v14 = v6 + v10;
  if (!v11)
    v12 = v4 + v8;
  if (v11 == 1)
  {
    v15 = v6 + v10;
  }
  else
  {
    v13 = v14;
    v15 = v12;
  }
  -[NSLayoutConstraint setConstant:](self->_distributionConstraint, "setConstant:", -v13);
  -[NSLayoutConstraint setConstant:](self->_alignmentConstraint, "setConstant:", -v15);
}

- (float)fittingSizePriority
{
  return self->_fittingSizePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentConstraint, 0);
  objc_storeStrong((id *)&self->_distributionConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
