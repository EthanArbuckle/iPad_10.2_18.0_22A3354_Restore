@implementation RouteStepListTableCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(RouteStepListView);
}

- (RouteStepListTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RouteStepListTableCell *v4;
  RouteStepListTableCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  UIView *v9;
  UIView *backgroundView;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  RouteStepListView *v18;
  RouteStepListView *stepView;
  void *v20;
  RouteStepListView *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)RouteStepListTableCell;
  v4 = -[RouteStepListTableCell initWithStyle:reuseIdentifier:](&v27, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RouteStepListTableCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = objc_opt_new(UIView);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = objc_msgSend((id)objc_opt_class(v5), "_fallbackBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[UIView setBackgroundColor:](v5->_backgroundView, "setBackgroundColor:", v12);

    -[RouteStepListTableCell addSubview:](v5, "addSubview:", v5->_backgroundView);
    LODWORD(v13) = 1148846080;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](v5->_backgroundView, "_maps_constraintsEqualToEdgesOfView:priority:", v5, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    v16 = objc_msgSend(objc_msgSend((id)objc_opt_class(v5), "stepViewClass"), "alloc");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListTableCell contentView](v5, "contentView"));
    objc_msgSend(v17, "bounds");
    v18 = (RouteStepListView *)objc_msgSend(v16, "initWithFrame:");
    stepView = v5->_stepView;
    v5->_stepView = v18;

    -[RouteStepListView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stepView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListTableCell contentView](v5, "contentView"));
    objc_msgSend(v20, "addSubview:", v5->_stepView);

    v21 = v5->_stepView;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListTableCell contentView](v5, "contentView"));
    LODWORD(v23) = 1148846080;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView _maps_constraintsEqualToEdgesOfView:priority:](v21, "_maps_constraintsEqualToEdgesOfView:priority:", v22, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
  return v5;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  -[RouteStepListView setShouldUseTextToBottomConstraint:](self->_stepView, "setShouldUseTextToBottomConstraint:", a3);
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return -[RouteStepListView shouldUseTextToBottomConstraint](self->_stepView, "shouldUseTextToBottomConstraint");
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a3;
  objc_msgSend(objc_msgSend((id)objc_opt_class(a1), "stepViewClass"), "heightForItem:width:maximumHeight:", v8, a4, a5);
  v10 = v9;

  return v10;
}

- (void)setItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  -[RouteStepListView setItem:](self->_stepView, "setItem:", v4);
  v14 = v4;
  v5 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
    v6 = v14;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "_fallbackBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RouteStepListView setBackgroundColor:](self->_stepView, "setBackgroundColor:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  if (v9)
  {
LABEL_8:
    v12 = (void *)v9;
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v9);
    goto LABEL_9;
  }
  v10 = objc_msgSend((id)objc_opt_class(self), "_fallbackBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v11);

  v12 = 0;
LABEL_9:

}

- (RouteStepItem)item
{
  return -[RouteStepListView item](self->_stepView, "item");
}

+ (id)_fallbackBackgroundColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
