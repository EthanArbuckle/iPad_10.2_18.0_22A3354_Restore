@implementation TUISpinnerView

+ (id)renderModelWithIdentifier:(id)a3
{
  id v3;
  TUIRenderModelSpinner *v4;

  v3 = a3;
  v4 = -[TUIRenderModelSpinner initWithReuseIdentifier:identifier:]([TUIRenderModelSpinner alloc], "initWithReuseIdentifier:identifier:", CFSTR("TUIReuseIdentifierSpinnerView"), v3);

  return v4;
}

- (TUISpinnerView)initWithFrame:(CGRect)a3
{
  TUISpinnerView *v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *activityView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v14.receiver = self;
  v14.super_class = (Class)TUISpinnerView;
  v3 = -[TUISpinnerView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityView = v3->_activityView;
    v3->_activityView = v4;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_activityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUISpinnerView addSubview:](v3, "addSubview:", v3->_activityView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](v3->_activityView, "centerXAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUISpinnerView centerXAnchor](v3, "centerXAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    v15[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v3->_activityView, "centerYAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUISpinnerView centerYAnchor](v3, "centerYAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v15[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    -[UIActivityIndicatorView startAnimating](v3->_activityView, "startAnimating");
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISpinnerView;
  -[TUIReusableBaseView prepareForReuse](&v3, "prepareForReuse");
  -[UIActivityIndicatorView startAnimating](self->_activityView, "startAnimating");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  UIActivityIndicatorView *activityView;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TUISpinnerView;
  -[TUISpinnerView setHidden:](&v6, "setHidden:");
  activityView = self->_activityView;
  if (v3)
    -[UIActivityIndicatorView stopAnimating](activityView, "stopAnimating");
  else
    -[UIActivityIndicatorView startAnimating](activityView, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
