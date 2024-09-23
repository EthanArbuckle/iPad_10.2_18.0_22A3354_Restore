@implementation UGCPhotoCollectionViewCell

- (UGCPhotoCollectionViewCell)initWithFrame:(CGRect)a3
{
  UGCPhotoCollectionViewCell *v3;
  id v4;
  double y;
  double width;
  double height;
  UIImageView *v8;
  UIImageView *contentImageView;
  uint64_t v10;
  UIButton *closeButton;
  UIButton *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  void *v16;
  UIView *v17;
  UIView *closeButtonBlurView;
  void *v19;
  uint64_t v20;
  UIButton *v21;
  id v22;
  UIView *v23;
  UIView *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)UGCPhotoCollectionViewCell;
  v3 = -[UGCPhotoCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = v8;

    if (sub_1002A8AA0(v3) == 5)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      closeButton = v3->_closeButton;
      v3->_closeButton = (UIButton *)v10;

      v12 = v3->_closeButton;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("minus.circle")));
      -[UIButton setImage:forState:](v12, "setImage:forState:", v13, 0);

      v14 = v3->_closeButton;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 26.0));
      -[UIButton setPreferredSymbolConfiguration:forImageInState:](v14, "setPreferredSymbolConfiguration:forImageInState:", v15, 0);

      -[UIButton setContentEdgeInsets:](v3->_closeButton, "setContentEdgeInsets:", -2.0, -2.0, -2.0, -2.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UIButton setTintColor:](v3->_closeButton, "setTintColor:", v16);

      v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      closeButtonBlurView = v3->_closeButtonBlurView;
      v3->_closeButtonBlurView = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.55));
      -[UIView setBackgroundColor:](v3->_closeButtonBlurView, "setBackgroundColor:", v19);
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
      v21 = v3->_closeButton;
      v3->_closeButton = (UIButton *)v20;

      v22 = objc_alloc((Class)UIVisualEffectView);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 17));
      v23 = (UIView *)objc_msgSend(v22, "initWithEffect:", v19);
      v24 = v3->_closeButtonBlurView;
      v3->_closeButtonBlurView = v23;

    }
    -[UGCPhotoCollectionViewCell _setupSubviews](v3, "_setupSubviews");
    -[UGCPhotoCollectionViewCell _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)_setupSubviews
{
  void *v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *spinner;
  UIView *closeButtonBlurView;
  uint64_t v7;
  char isKindOfClass;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  UIHoverGestureRecognizer *v13;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  id v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_contentImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIImageView setContentMode:](self->_contentImageView, "setContentMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "addSubview:", self->_contentImageView);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setOverrideUserInterfaceStyle:](self->_closeButton, "setOverrideUserInterfaceStyle:", 2);
  if (sub_1002A8AA0(self) != 5)
    -[UIButton setImageEdgeInsets:](self->_closeButton, "setImageEdgeInsets:", 6.0, 6.0, 6.0, 6.0);
  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, "_cancelButtonPressed", 64);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButtonBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _setCornerRadius:](self->_closeButtonBlurView, "_setCornerRadius:", 12.0);
  v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  spinner = self->_spinner;
  self->_spinner = v4;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  closeButtonBlurView = self->_closeButtonBlurView;
  v7 = objc_opt_class(UIVisualEffectView);
  isKindOfClass = objc_opt_isKindOfClass(closeButtonBlurView, v7);
  v9 = self->_closeButtonBlurView;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contentView](v9, "contentView"));
    objc_msgSend(v10, "addSubview:", self->_closeButton);

  }
  else
  {
    -[UIView addSubview:](v9, "addSubview:", self->_closeButton);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_closeButtonBlurView);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_spinner);

  if (sub_1002A8AA0(self) == 5)
  {
    -[UIView setHidden:](self->_closeButtonBlurView, "setHidden:", 1);
    v13 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", self, "_handleHover:");
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v13;

    v15 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v15, "addGestureRecognizer:", self->_hoverGestureRecognizer);

  }
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[14];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_contentImageView, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v48[0] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_contentImageView, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v48[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_contentImageView, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v48[2] = v39;
  v4 = v3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_contentImageView, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v48[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_closeButton, "widthAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 24.0));
  v48[4] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_closeButton, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_closeButton, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v48[5] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_closeButton, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_closeButtonBlurView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v48[6] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_closeButton, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_closeButtonBlurView, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v48[7] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_closeButton, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_closeButtonBlurView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v48[8] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_closeButton, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_closeButtonBlurView, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v48[9] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_closeButtonBlurView, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_contentImageView, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 4.0));
  v48[10] = v15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_closeButtonBlurView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_contentImageView, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -4.0));
  v48[11] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor"));
  v24 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v48[12] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v48[13] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)_handleHover:(id)a3
{
  -[UGCPhotoCollectionViewCell setHoverActive:](self, "setHoverActive:", objc_msgSend(a3, "_maps_isHovering"));
}

- (void)setHoverActive:(BOOL)a3
{
  _BOOL4 v3;
  uint8_t v5[16];

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    if (self->_hoverActive != v3)
    {
      self->_hoverActive = v3;
      -[UIView setHidden:](self->_closeButtonBlurView, "setHidden:", !v3);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: MapsIdiomIsMac(self)", v5, 2u);
  }
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_contentImageView, "setImage:", a3);
}

- (UIImage)image
{
  return -[UIImageView image](self->_contentImageView, "image");
}

- (id)imageView
{
  return self->_contentImageView;
}

- (void)_cancelButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCollectionViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "photoCellDidCancel:", self);

}

+ (id)reuseIdentifier
{
  return CFSTR("PhotosCollectionViewCell");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UGCPhotoCollectionViewCell;
  -[UGCPhotoCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UGCPhotoCollectionViewCell setIdentifier:](self, "setIdentifier:", 0);
  -[UGCPhotoCollectionViewCell setImage:](self, "setImage:", 0);
  -[UGCPhotoCollectionViewCell endAnimatingActivityIndicatorWithError:](self, "endAnimatingActivityIndicatorWithError:", 0);
}

- (void)beginAnimatingActivityIndicator
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating", a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UGCPhotoCollectionViewCellDelegate)delegate
{
  return (UGCPhotoCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_contentImageView, a3);
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_closeButtonBlurView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
}

@end
