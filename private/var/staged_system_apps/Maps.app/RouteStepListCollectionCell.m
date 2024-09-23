@implementation RouteStepListCollectionCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(RouteStepListView);
}

- (RouteStepListCollectionCell)initWithFrame:(CGRect)a3
{
  RouteStepListCollectionCell *v3;
  RouteStepListCollectionCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  RouteStepListView *v10;
  RouteStepListView *stepView;
  void *v12;
  RouteStepListView *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *heightConstraint;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RouteStepListCollectionCell;
  v3 = -[RouteStepListCollectionCell initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RouteStepListCollectionCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_msgSend(objc_msgSend((id)objc_opt_class(v4), "stepViewClass"), "alloc");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListCollectionCell contentView](v4, "contentView"));
    objc_msgSend(v9, "bounds");
    v10 = (RouteStepListView *)objc_msgSend(v8, "initWithFrame:");
    stepView = v4->_stepView;
    v4->_stepView = v10;

    -[RouteStepListView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stepView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListCollectionCell contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v4->_stepView);

    v13 = v4->_stepView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListCollectionCell contentView](v4, "contentView"));
    LODWORD(v15) = 1148846080;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView _maps_constraintsEqualToEdgesOfView:priority:](v13, "_maps_constraintsEqualToEdgesOfView:priority:", v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView heightAnchor](v4->_stepView, "heightAnchor"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v19;

  }
  return v4;
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
  -[RouteStepListView setItem:](self->_stepView, "setItem:", a3);
}

- (RouteStepItem)item
{
  return -[RouteStepListView item](self->_stepView, "item");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
