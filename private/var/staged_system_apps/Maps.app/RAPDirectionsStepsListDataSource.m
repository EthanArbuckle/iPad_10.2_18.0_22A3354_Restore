@implementation RAPDirectionsStepsListDataSource

- (RAPDirectionsStepsListDataSource)init
{
  RAPDirectionsStepsListDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsStepsListDataSource;
  result = -[DirectionsStepsListDataSource init](&v3, "init");
  if (result)
    result->_dummyTrailingViewWidth = 1.79769313e308;
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[RAP] Nav step list - Route Steps"), CFSTR("localized string not found"), 0));

  return v5;
}

- (void)setOptions:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsStepsListDataSource;
  -[DirectionsStepsListDataSource setOptions:](&v3, "setOptions:", a3 & 3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPDirectionsStepsListDataSource;
  v7 = -[DirectionsStepsListDataSource tableView:cellForRowAtIndexPath:](&v16, "tableView:cellForRowAtIndexPath:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  objc_msgSend(v8, "setBackgroundColor:", v11);

  v12 = objc_opt_class(DirectionsStepTableViewCell);
  LOBYTE(v11) = objc_opt_isKindOfClass(v8, v12);
  v13 = v8;
  if ((v11 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource routeStepForIndexPath:](self, "routeStepForIndexPath:", v6));
    -[RAPDirectionsStepsListDataSource _attachDisclosureViewToCell:routeStep:](self, "_attachDisclosureViewToCell:routeStep:", v13, v14);

  }
  return v13;
}

- (unint64_t)routeStepIndexForRowIndex:(unint64_t)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPDirectionsStepsListDataSource;
  v4 = -[DirectionsStepsListDataSource routeStepIndexForRowIndex:](&v6, "routeStepIndexForRowIndex:", a3);
  return v4 - (_BYTE *)-[DirectionsStepsListDataSource indexOfFirstDisplayedStep](self, "indexOfFirstDisplayedStep");
}

- (void)_attachDisclosureViewToCell:(id)a3 routeStep:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsListDataSource _rapDisclosureViewForCell:routeStep:](self, "_rapDisclosureViewForCell:routeStep:", v13, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsListDataSource trailingViewForInstructionIncorrectView:](self, "trailingViewForInstructionIncorrectView:", v6));
  objc_msgSend(v13, "setTrailingView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingView"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    objc_msgSend(v12, "setActive:", 1);

  }
}

- (id)trailingViewForInstructionIncorrectView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  if (!a3)
    return 0;
  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v13[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  return v4;
}

- (id)_rapDisclosureViewForCell:(id)a3 routeStep:(id)a4
{
  id v5;
  RAPInstructionIncorrectView *v6;
  double v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = -[RAPInstructionIncorrectView initWithFrame:]([RAPInstructionIncorrectView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RAPInstructionIncorrectView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  -[RAPInstructionIncorrectView setContentCompressionResistancePriority:forAxis:](v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsListDataSource rapDelegate](self, "rapDelegate"));
  LODWORD(self) = objc_msgSend(v8, "RAPDirectionsStepsList:shouldShowFlagForStep:listItem:", self, v5, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionIncorrectView flagView](v6, "flagView"));
  objc_msgSend(v9, "setHidden:", self ^ 1);

  -[RAPInstructionIncorrectView setDisplayMode:](v6, "setDisplayMode:", 0);
  return v6;
}

- (double)_trailingViewWidth
{
  double result;
  void *v4;
  void *v5;
  double v6;

  result = self->_dummyTrailingViewWidth;
  if (result == 1.79769313e308)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsListDataSource _rapDisclosureViewForCell:routeStep:](self, "_rapDisclosureViewForCell:routeStep:", 0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsListDataSource trailingViewForInstructionIncorrectView:](self, "trailingViewForInstructionIncorrectView:", v4));
    objc_msgSend(v5, "_mapkit_fittingSize");
    self->_dummyTrailingViewWidth = v6;

    return self->_dummyTrailingViewWidth;
  }
  return result;
}

- (RAPDirectionsStepsListDelegate)rapDelegate
{
  return (RAPDirectionsStepsListDelegate *)objc_loadWeakRetained((id *)&self->_rapDelegate);
}

- (void)setRapDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rapDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rapDelegate);
}

@end
