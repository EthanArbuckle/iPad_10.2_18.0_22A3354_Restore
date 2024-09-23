@implementation MapsDebugActivityIndicatorRow

- (void)configureCell:(id)a3
{
  id v4;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
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
  objc_super v18;
  _QWORD v19[2];

  v18.receiver = self;
  v18.super_class = (Class)MapsDebugActivityIndicatorRow;
  v4 = a3;
  -[MapsDebugTableRow configureCell:](&v18, "configureCell:", v4);
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v7 = self->_activityIndicator;
    self->_activityIndicator = v6;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    activityIndicator = self->_activityIndicator;
  }
  -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v8, "addSubview:", self->_activityIndicator);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v10));
  v19[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v19[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
