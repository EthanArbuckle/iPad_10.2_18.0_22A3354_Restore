@implementation PKMerchantTokenLoadingCell

- (PKMerchantTokenLoadingCell)initWithFrame:(CGRect)a3
{
  PKMerchantTokenLoadingCell *v3;
  PKMerchantTokenLoadingCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenLoadingCell;
  v3 = -[PKMerchantTokenLoadingCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKMerchantTokenLoadingCell _computeLoadingCellHeights](v3, "_computeLoadingCellHeights");
    -[PKMerchantTokenLoadingCell _setUpViews](v4, "_setUpViews");
    -[PKMerchantTokenLoadingCell _setUpConstraints](v4, "_setUpConstraints");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokenLoadingCell;
  -[PKMerchantTokenLoadingCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)useSmallHeight
{
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", self->_loadingCellHeight);
}

- (void)_setUpViews
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;
  id v5;

  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  -[PKMerchantTokenLoadingCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_activityIndicator);

}

- (void)_setUpConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *heightConstraint;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokenLoadingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", self->_loadingCellHeightWithIcon);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  -[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_heightConstraint;
  v18[1] = v14;
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)_computeLoadingCellHeights
{
  id v3;
  CGRect v4;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("loading"));
  objc_msgSend(v3, "frame");
  self->_loadingCellHeight = CGRectGetHeight(v4);
  self->_loadingCellHeightWithIcon = 76.0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
