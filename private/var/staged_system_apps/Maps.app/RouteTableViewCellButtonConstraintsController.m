@implementation RouteTableViewCellButtonConstraintsController

- (RouteTableViewCellButtonConstraintsController)initWithLeadingAnchor:(id)a3 trailingAnchor:(id)a4 firstBaselineAnchor:(id)a5 leadingDistance:(double)a6 firstBaselineDistance:(double)a7
{
  id v13;
  id v14;
  id v15;
  RouteTableViewCellButtonConstraintsController *v16;
  RouteTableViewCellButtonConstraintsController *v17;
  RouteTableViewCellButtonConstraintsController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RouteTableViewCellButtonConstraintsController;
  v16 = -[RouteTableViewCellButtonConstraintsController init](&v20, "init");
  v17 = v16;
  v18 = 0;
  if (v16 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_leadingAnchor, a3);
    objc_storeStrong((id *)&v17->_trailingAnchor, a4);
    objc_storeStrong((id *)&v17->_firstBaselineAnchor, a5);
    v17->_leadingDistance = a6;
    v17->_firstBaselineDistance = a7;
    v18 = v17;
  }

  return v18;
}

- (void)setButton:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  double v7;
  id v8;
  double v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  if (WeakRetained != obj)
  {
    -[RouteTableViewCellButtonConstraintsController _invalidateButtonConstraints](self, "_invalidateButtonConstraints");
    v5 = objc_storeWeak((id *)&self->_button, obj);
    objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = objc_loadWeakRetained((id *)&self->_button);
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v7);

    v8 = objc_loadWeakRetained((id *)&self->_button);
    LODWORD(v9) = 1148846080;
    objc_msgSend(v8, "_mapkit_setContentHuggingPriority:forAxis:", 0, v9);

    -[RouteTableViewCellButtonConstraintsController _updateActiveConstraintsToSetButtonVisible:](self, "_updateActiveConstraintsToSetButtonVisible:", -[RouteTableViewCellButtonConstraintsController isButtonVisible](self, "isButtonVisible"));
  }

}

- (void)setButtonVisible:(BOOL)a3
{
  if (self->_buttonVisible != a3)
  {
    self->_buttonVisible = a3;
    -[RouteTableViewCellButtonConstraintsController _updateActiveConstraintsToSetButtonVisible:](self, "_updateActiveConstraintsToSetButtonVisible:");
  }
}

- (void)setFirstBaselineDistance:(double)a3
{
  if (self->_firstBaselineDistance != a3)
  {
    self->_firstBaselineDistance = a3;
    -[NSLayoutConstraint setConstant:](self->_firstBaselineConstraintShown, "setConstant:");
  }
}

- (NSArray)constraintsWhenButtonHidden
{
  void *v3;
  NSArray *v4;
  NSArray *constraintsWhenButtonHidden;
  void *v7;

  if (!self->_leadingAnchor || !self->_trailingAnchor)
    return (NSArray *)0;
  if (!-[NSArray count](self->_constraintsWhenButtonHidden, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutAnchor constraintLessThanOrEqualToAnchor:](self->_leadingAnchor, "constraintLessThanOrEqualToAnchor:", self->_trailingAnchor));
    v7 = v3;
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    constraintsWhenButtonHidden = self->_constraintsWhenButtonHidden;
    self->_constraintsWhenButtonHidden = v4;

  }
  return self->_constraintsWhenButtonHidden;
}

- (NSArray)constraintsWhenButtonShown
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
  NSLayoutConstraint *v12;
  NSLayoutConstraint *firstBaselineConstraintShown;
  double v14;
  NSArray *v15;
  NSArray *constraintsWhenButtonShown;
  _QWORD v18[3];

  if (!self->_leadingAnchor || !self->_trailingAnchor || !self->_firstBaselineAnchor)
    return (NSArray *)0;
  if (!-[NSArray count](self->_constraintsWhenButtonShown, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController button](self, "button"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController button](self, "button"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", self->_leadingAnchor, self->_leadingDistance));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController button](self, "button"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", self->_trailingAnchor));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController button](self, "button"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstBaselineAnchor"));
      v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", self->_firstBaselineAnchor, self->_firstBaselineDistance));
      firstBaselineConstraintShown = self->_firstBaselineConstraintShown;
      self->_firstBaselineConstraintShown = v12;

      LODWORD(v14) = 1148829696;
      objc_msgSend(v6, "setPriority:", v14);
      v18[0] = v6;
      v18[1] = v9;
      v18[2] = self->_firstBaselineConstraintShown;
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
      constraintsWhenButtonShown = self->_constraintsWhenButtonShown;
      self->_constraintsWhenButtonShown = v15;

    }
  }
  return self->_constraintsWhenButtonShown;
}

- (void)_updateActiveConstraintsToSetButtonVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController constraintsWhenButtonShown](self, "constraintsWhenButtonShown"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController constraintsWhenButtonHidden](self, "constraintsWhenButtonHidden"));
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController constraintsWhenButtonHidden](self, "constraintsWhenButtonHidden"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTableViewCellButtonConstraintsController constraintsWhenButtonShown](self, "constraintsWhenButtonShown"));
  }
  v5 = v4;
  if (objc_msgSend(v4, "count"))
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);
  if (objc_msgSend(v6, "count"))
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

}

- (void)_invalidateButtonConstraints
{
  NSArray *constraintsWhenButtonShown;
  NSLayoutConstraint *firstBaselineConstraintShown;

  if (-[NSArray count](self->_constraintsWhenButtonShown, "count"))
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraintsWhenButtonShown);
  constraintsWhenButtonShown = self->_constraintsWhenButtonShown;
  self->_constraintsWhenButtonShown = 0;

  firstBaselineConstraintShown = self->_firstBaselineConstraintShown;
  self->_firstBaselineConstraintShown = 0;

}

- (NSLayoutAnchor)leadingAnchor
{
  return self->_leadingAnchor;
}

- (NSLayoutAnchor)trailingAnchor
{
  return self->_trailingAnchor;
}

- (NSLayoutAnchor)firstBaselineAnchor
{
  return self->_firstBaselineAnchor;
}

- (double)leadingDistance
{
  return self->_leadingDistance;
}

- (double)firstBaselineDistance
{
  return self->_firstBaselineDistance;
}

- (NSLayoutConstraint)firstBaselineConstraintShown
{
  return self->_firstBaselineConstraintShown;
}

- (void)setConstraintsWhenButtonHidden:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsWhenButtonHidden, a3);
}

- (void)setConstraintsWhenButtonShown:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsWhenButtonShown, a3);
}

- (UIButton)button
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_button);
}

- (BOOL)isButtonVisible
{
  return self->_buttonVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_constraintsWhenButtonShown, 0);
  objc_storeStrong((id *)&self->_constraintsWhenButtonHidden, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraintShown, 0);
  objc_storeStrong((id *)&self->_firstBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_trailingAnchor, 0);
  objc_storeStrong((id *)&self->_leadingAnchor, 0);
}

@end
