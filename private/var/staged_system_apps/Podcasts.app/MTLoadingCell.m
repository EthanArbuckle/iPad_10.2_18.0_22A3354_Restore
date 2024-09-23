@implementation MTLoadingCell

- (void)setupCell
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLoadingCell;
  -[MTTableViewCell setupCell](&v7, "setupCell");
  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[MTLoadingCell setActivityIndicator:](self, "setActivityIndicator:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v6, "startAnimating");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)MTLoadingCell;
  -[MTTableViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  objc_msgSend(v8, "frame");
  v9 = CGRectGetMidX(v14) - v5 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  objc_msgSend(v10, "frame");
  v11 = CGRectGetMidY(v15) - v7 * 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v12, "setFrame:", v9, v11, v5, v7);

}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
