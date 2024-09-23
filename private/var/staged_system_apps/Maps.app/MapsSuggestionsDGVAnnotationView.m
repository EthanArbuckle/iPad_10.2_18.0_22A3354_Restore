@implementation MapsSuggestionsDGVAnnotationView

- (MapsSuggestionsDGVAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  MapsSuggestionsDGVAnnotationView *v4;
  MapsSuggestionsDGVAnnotationView *v5;
  UIView *calloutView;
  UITableView *tableView;
  MapsSuggestionsDGVAnnotationView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsDGVAnnotationView;
  v4 = -[MapsSuggestionsDGVAnnotationView initWithAnnotation:reuseIdentifier:](&v10, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    calloutView = v4->_calloutView;
    v4->_calloutView = 0;

    tableView = v5->_tableView;
    v5->_tableView = 0;

    -[MapsSuggestionsDGVAnnotationView setIsSelected:](v5, "setIsSelected:", 0);
    v8 = v5;
  }

  return v5;
}

- (void)showCalloutView
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *calloutView;
  UITableView *v9;
  UITableView *tableView;
  void *v11;

  if (!self->_calloutView)
  {
    v3 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    calloutView = self->_calloutView;
    self->_calloutView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_calloutView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    tableView = self->_tableView;
    self->_tableView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView layer](self->_tableView, "layer"));
    objc_msgSend(v11, "setCornerRadius:", 5.0);

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_calloutView, "addSubview:", self->_tableView);
  }
  -[MapsSuggestionsDGVAnnotationView setIsSelected:](self, "setIsSelected:", 1);
  -[MapsSuggestionsDGVAnnotationView addSubview:](self, "addSubview:", self->_calloutView);
  -[MapsSuggestionsDGVAnnotationView _setCalloutConstraints](self, "_setCalloutConstraints");
}

- (void)hideCalloutView
{
  -[UIView removeFromSuperview](self->_calloutView, "removeFromSuperview");
  -[MapsSuggestionsDGVAnnotationView setIsSelected:](self, "setIsSelected:", 0);
}

- (void)setCalloutTableViewDataSource:(id)a3
{
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", a3);
}

- (void)setCalloutTableViewDelegate:(id)a3
{
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", a3);
}

- (void)reloadCalloutTableView
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_setCalloutConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[MapsSuggestionsDGVAnnotationView _tableViewHeight](self, "_tableViewHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_calloutView, "heightAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", v4));
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_calloutView, "widthAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 200.0));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_calloutView, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVAnnotationView centerXAnchor](self, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_calloutView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVAnnotationView centerYAnchor](self, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 30.0));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_calloutView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_calloutView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leftAnchor](self->_tableView, "leftAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_calloutView, "leftAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  v26 = (id)objc_claimAutoreleasedReturnValue(-[UITableView rightAnchor](self->_tableView, "rightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_calloutView, "rightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v24));
  objc_msgSend(v25, "setActive:", 1);

}

- (double)_tableViewHeight
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVAnnotationView annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entriesDictionaries"));
  v4 = objc_msgSend(v3, "count");

  return (double)(unint64_t)v4 * 35.0 + 25.0;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_calloutView, 0);
}

@end
