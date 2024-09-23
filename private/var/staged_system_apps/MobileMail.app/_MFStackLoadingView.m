@implementation _MFStackLoadingView

- (_MFStackLoadingView)initWithFrame:(CGRect)a3
{
  _MFStackLoadingView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v16.receiver = self;
  v16.super_class = (Class)_MFStackLoadingView;
  v3 = -[_MFStackLoadingView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailTransferConversationViewBackgroundColor](UIColor, "mailTransferConversationViewBackgroundColor"));
    -[_MFStackLoadingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MFStackLoadingView addSubview:](v3, "addSubview:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackLoadingView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v7));
    v17[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackLoadingView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v17[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);
    -[_MFStackLoadingView setActivityIndicatorView:](v3, "setActivityIndicatorView:", v5);

  }
  return v3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
