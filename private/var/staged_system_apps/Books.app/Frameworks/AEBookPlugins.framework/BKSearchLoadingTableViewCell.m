@implementation BKSearchLoadingTableViewCell

- (id)activityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  void *v6;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_activityIndicator);

    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double MidY;
  float v34;
  CGFloat v35;
  float v36;
  double v37;
  CGFloat v38;
  float v39;
  CGFloat v40;
  float v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v47.receiver = self;
  v47.super_class = (Class)BKSearchLoadingTableViewCell;
  -[BKSearchLoadingTableViewCell layoutSubviews](&v47, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v48);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v10, "setFrame:", 0.0, v5, Width, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
  objc_msgSend(v16, "bounds");
  v17 = CGRectGetWidth(v49);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v18, "setFrame:", 0.0, v13, v17, v15);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell activityIndicator](self, "activityIndicator"));
  if (objc_msgSend(v19, "isAnimating"))
  {
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell textLabel](self, "textLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
    objc_msgSend(v29, "bounds");
    objc_msgSend(v28, "sizeThatFits:", v30, v31);
    v45 = v32;

    v50.origin.x = 0.0;
    v50.origin.y = v5;
    v50.size.width = Width;
    v50.size.height = v7;
    v46 = v7;
    MidY = CGRectGetMidY(v50);
    v51.origin.x = v21;
    v51.origin.y = v23;
    v51.size.width = v25;
    v51.size.height = v27;
    v34 = MidY - CGRectGetHeight(v51) * 0.5;
    v35 = floorf(v34) + 1.0;
    v52.origin.x = 0.0;
    v52.origin.y = v5;
    v52.size.width = Width;
    v52.size.height = v7;
    v36 = CGRectGetMidX(v52) - v45 * 0.5;
    v37 = floorf(v36);
    v53.origin.x = v21;
    v53.origin.y = v35;
    v53.size.width = v25;
    v53.size.height = v27;
    v38 = v37 - CGRectGetWidth(v53) + -5.0;
    v54.origin.x = v38;
    v54.origin.y = v35;
    v54.size.width = v25;
    v54.size.height = v27;
    v39 = (CGRectGetWidth(v54) + 5.0) * 0.5;
    v40 = v38 + floorf(v39);
    v55.origin.x = v40;
    v55.origin.y = v35;
    v55.size.width = v25;
    v55.size.height = v27;
    v41 = (CGRectGetWidth(v55) + 5.0) * 0.5;
    v42 = floorf(v41) + 0.0;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v43, "setFrame:", v42, v5, Width, v46);

    objc_msgSend(v19, "setFrame:", v40, v35, v25, v27);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
    objc_msgSend(v44, "bringSubviewToFront:", v19);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchLoadingTableViewCell contentView](self, "contentView"));
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
