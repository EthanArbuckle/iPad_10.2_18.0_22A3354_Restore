@implementation RestaurantReservationTableViewCell

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeObserver:forKeyPath:context:](self->_errorButton, "removeObserver:forKeyPath:context:", self, CFSTR("highlighted"), off_1014BA0A0);
  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationTableViewCell;
  -[RestaurantReservationTableViewCell dealloc](&v3, "dealloc");
}

- (RestaurantReservationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RestaurantReservationTableViewCell *v4;
  RestaurantReservationTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RestaurantReservationTableViewCell;
  v4 = -[RestaurantReservationTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "setClipsToBounds:", 1);

    -[RestaurantReservationTableViewCell _initDateAndPartySizeContainerView](v5, "_initDateAndPartySizeContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v7, "addSubview:", v5->_dateAndPartySizeContainerView);

    -[RestaurantReservationTableViewCell _initLoadingIndicatorContainerView](v5, "_initLoadingIndicatorContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v8, "addSubview:", v5->_loadingIndicatorContainerView);

    -[RestaurantReservationTableViewCell _initErrorContainerView](v5, "_initErrorContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v9, "addSubview:", v5->_errorContainerView);

    -[RestaurantReservationTableViewCell _initTimeSelectionCollectionView](v5, "_initTimeSelectionCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v5->_timeSelectionCollectionView);

    -[RestaurantReservationTableViewCell _setupContentViewConstraints](v5, "_setupContentViewConstraints");
  }
  return v5;
}

- (void)_initDateAndPartySizeContainerView
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *dateAndPartySizeContainerView;
  UILabel *v9;
  void *v10;
  UILabel *dateAndPartySizeLabel;
  UILabel *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  UIButton *dateAndPartySizeButton;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  dateAndPartySizeContainerView = self->_dateAndPartySizeContainerView;
  self->_dateAndPartySizeContainerView = v7;

  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
  -[UILabel setFont:](v9, "setFont:", v10);

  -[UIView addSubview:](self->_dateAndPartySizeContainerView, "addSubview:", v9);
  dateAndPartySizeLabel = self->_dateAndPartySizeLabel;
  self->_dateAndPartySizeLabel = v9;
  v12 = v9;

  v13 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v12, "font"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v13, "titleLabel"));
  objc_msgSend(v15, "setFont:", v14);

  if (MKApplicationLayoutDirectionIsRightToLeft(v16))
    v17 = 0;
  else
    v17 = 2;
  -[UIButton setContentHorizontalAlignment:](v13, "setContentHorizontalAlignment:", v17);
  -[UIView addSubview:](self->_dateAndPartySizeContainerView, "addSubview:", v13);
  dateAndPartySizeButton = self->_dateAndPartySizeButton;
  self->_dateAndPartySizeButton = v13;

  self->_dateAndPartySizeHidden = 0;
  -[RestaurantReservationTableViewCell _setupDateAndPartySizeContainerViewConstraints](self, "_setupDateAndPartySizeContainerViewConstraints");
}

- (void)_setupDateAndPartySizeContainerViewConstraints
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
  _QWORD v25[7];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateAndPartySizeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dateAndPartySizeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_dateAndPartySizeLabel, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_dateAndPartySizeContainerView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_dateAndPartySizeButton, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_dateAndPartySizeLabel, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 20.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_dateAndPartySizeButton, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_dateAndPartySizeContainerView, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_dateAndPartySizeLabel, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_dateAndPartySizeContainerView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_dateAndPartySizeLabel, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_dateAndPartySizeContainerView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_dateAndPartySizeButton, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_dateAndPartySizeLabel, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_dateAndPartySizeButton, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_dateAndPartySizeLabel, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));

  v25[0] = v24;
  v25[1] = v7;
  v25[2] = v10;
  v25[3] = v13;
  v25[4] = v16;
  v25[5] = v19;
  v25[6] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

}

- (void)_initLoadingIndicatorContainerView
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *loadingIndicatorContainerView;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *loadingIndicator;
  UIActivityIndicatorView *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *loadingIndicatorLabel;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  loadingIndicatorContainerView = self->_loadingIndicatorContainerView;
  self->_loadingIndicatorContainerView = v7;

  v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[UIView addSubview:](self->_loadingIndicatorContainerView, "addSubview:", v9);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v9;
  v11 = v9;

  v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  -[UILabel setFont:](v12, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v12, "setTextColor:", v14);

  -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_loadingIndicatorContainerView, "addSubview:", v12);
  loadingIndicatorLabel = self->_loadingIndicatorLabel;
  self->_loadingIndicatorLabel = v12;

  self->_loadingIndicatorHidden = 1;
  -[RestaurantReservationTableViewCell _setupLoadingIndicatorContainerViewConstraints](self, "_setupLoadingIndicatorContainerViewConstraints");
}

- (void)_setupLoadingIndicatorContainerViewConstraints
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
  _QWORD v23[6];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingIndicatorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_loadingIndicator, "centerXAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_loadingIndicatorContainerView, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_loadingIndicator, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_loadingIndicatorContainerView, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_loadingIndicatorLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_loadingIndicatorContainerView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_loadingIndicatorLabel, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_loadingIndicatorContainerView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_loadingIndicatorLabel, "firstBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_loadingIndicator, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_loadingIndicatorLabel, "font"));
  objc_msgSend(v16, "_mapkit_scaledValueForValue:", 15.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_loadingIndicatorLabel, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_loadingIndicatorContainerView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));

  v23[0] = v22;
  v23[1] = v7;
  v23[2] = v10;
  v23[3] = v13;
  v23[4] = v17;
  v23[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)_initErrorContainerView
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *errorContainerView;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *errorLabel;
  UILabel *v13;
  UIButton *v14;
  UIButton *errorButton;
  UIButton *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *errorButtonTitleLabel;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  errorContainerView = self->_errorContainerView;
  self->_errorContainerView = v7;

  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  -[UILabel setFont:](v9, "setFont:", v10);

  -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](v9, "setTextColor:", v11);

  -[UIView addSubview:](self->_errorContainerView, "addSubview:", v9);
  errorLabel = self->_errorLabel;
  self->_errorLabel = v9;
  v13 = v9;

  v14 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  -[UIButton addObserver:forKeyPath:options:context:](v14, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 0, off_1014BA0A0);
  -[UIView addSubview:](self->_errorContainerView, "addSubview:", v14);
  errorButton = self->_errorButton;
  self->_errorButton = v14;
  v16 = v14;

  v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleColorForState:](v16, "titleColorForState:", 0));
  -[UILabel setTextColor:](v17, "setTextColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v13, "font"));
  -[UILabel setFont:](v17, "setFont:", v19);

  -[UILabel setTextAlignment:](v17, "setTextAlignment:", -[UILabel textAlignment](v13, "textAlignment"));
  -[UILabel setNumberOfLines:](v17, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_errorContainerView, "addSubview:", v17);
  errorButtonTitleLabel = self->_errorButtonTitleLabel;
  self->_errorButtonTitleLabel = v17;

  self->_errorHidden = 1;
  -[RestaurantReservationTableViewCell _setupErrorContainerViewConstraints](self, "_setupErrorContainerViewConstraints");
}

- (void)_setupErrorContainerViewConstraints
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
  _QWORD v38[11];

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorButtonTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_errorButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_errorLabel, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_errorContainerView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_errorLabel, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_errorContainerView, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_errorLabel, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_errorContainerView, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_errorButtonTitleLabel, "firstBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_errorLabel, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_errorButtonTitleLabel, "font"));
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", 19.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_errorButtonTitleLabel, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_errorContainerView, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_errorButtonTitleLabel, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_errorContainerView, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_errorButtonTitleLabel, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_errorContainerView, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_errorButton, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_errorButtonTitleLabel, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_errorButton, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_errorButtonTitleLabel, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_errorButton, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_errorButtonTitleLabel, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_errorButton, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_errorContainerView, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));

  v38[0] = v37;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v34;
  v38[4] = v33;
  v38[5] = v32;
  v38[6] = v31;
  v38[7] = v30;
  v38[8] = v22;
  v38[9] = v29;
  v38[10] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v6;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  if (off_1014BA0A0 == a6)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButton](self, "errorButton", a3, a4, a5));
    v8 = objc_msgSend(v13, "isHighlighted");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButton](self, "errorButton"));
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleColorForState:", 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.200000003));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleColorForState:", 0));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButtonTitleLabel](self, "errorButtonTitleLabel"));
    objc_msgSend(v12, "setTextColor:", v11);

    if (v8)
    {

      v11 = v6;
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)RestaurantReservationTableViewCell;
    -[RestaurantReservationTableViewCell observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_initTimeSelectionCollectionView
{
  UICollectionView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  UICollectionView *timeSelectionCollectionView;
  RestaurantReservationCollectionViewFlowLayout *v14;

  v14 = objc_alloc_init(RestaurantReservationCollectionViewFlowLayout);
  -[RestaurantReservationCollectionViewFlowLayout setScrollDirection:](v14, "setScrollDirection:", 1);
  -[RestaurantReservationCollectionViewFlowLayout setItemSize:](v14, "setItemSize:", 90.0, 80.0);
  -[RestaurantReservationCollectionViewFlowLayout setEstimatedItemSize:](v14, "setEstimatedItemSize:", 90.0, 80.0);
  -[RestaurantReservationCollectionViewFlowLayout setSectionHeadersPinToVisibleBounds:](v14, "setSectionHeadersPinToVisibleBounds:", 1);
  -[RestaurantReservationCollectionViewFlowLayout setHeaderReferenceSize:](v14, "setHeaderReferenceSize:", 100.0, 40.0);
  -[RestaurantReservationCollectionViewFlowLayout setMinimumLineSpacing:](v14, "setMinimumLineSpacing:", 15.0);
  -[RestaurantReservationCollectionViewFlowLayout setMinimumInteritemSpacing:](v14, "setMinimumInteritemSpacing:", 15.0);
  v3 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v14, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UICollectionView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UICollectionView setContentInset:](v3, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
  v5 = objc_opt_class(ReservationAvailabilityCollectionViewCell);
  v6 = (void *)objc_opt_class(self);
  v7 = objc_msgSend(v6, "reuseIdentifierForClass:", objc_opt_class(ReservationAvailabilityCollectionViewCell));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v3, "registerClass:forCellWithReuseIdentifier:", v5, v8);

  v9 = objc_opt_class(ReservationLabelReusableView);
  v10 = (void *)objc_opt_class(self);
  v11 = objc_msgSend(v10, "reuseIdentifierForClass:", objc_opt_class(ReservationLabelReusableView));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v9, UICollectionElementKindSectionHeader, v12);

  timeSelectionCollectionView = self->_timeSelectionCollectionView;
  self->_timeSelectionCollectionView = v3;

}

- (void)_setupContentViewConstraints
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSLayoutConstraint *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSLayoutConstraint *contentBottomByError;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *contentBottomByTimeSelection;
  void *v68;
  void *v69;
  void *v70;
  NSLayoutConstraint *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[18];

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dateAndPartySizeContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_dateAndPartySizeContainerView, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_dateAndPartySizeContainerView, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutMarginsGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_dateAndPartySizeContainerView, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutMarginsGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v14));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_dateAndPartySizeContainerView, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v17));

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingIndicatorContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_loadingIndicatorContainerView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutMarginsGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_loadingIndicatorContainerView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_loadingIndicatorContainerView, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_loadingIndicatorContainerView, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_errorContainerView, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layoutMarginsGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_errorContainerView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layoutMarginsGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v39));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_errorContainerView, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerYAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layoutMarginsGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_errorContainerView, "bottomAnchor"));
  v71 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v46));

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_timeSelectionCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leftAnchor](self->_timeSelectionCollectionView, "leftAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leftAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView rightAnchor](self->_timeSelectionCollectionView, "rightAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "rightAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView heightAnchor](self->_timeSelectionCollectionView, "heightAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 115.0));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_timeSelectionCollectionView, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_dateAndPartySizeContainerView, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_loadingIndicatorLabel, "font"));
  objc_msgSend(v56, "_mapkit_scaledValueForValue:", 12.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v55));

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_timeSelectionCollectionView, "bottomAnchor"));
  v60 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, -22.0));

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentView](self, "contentView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "heightAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintGreaterThanOrEqualToConstant:", 149.0));

  v84[0] = v83;
  v84[1] = v82;
  v84[2] = v81;
  v84[3] = v80;
  v84[4] = v79;
  v84[5] = v78;
  v84[6] = v77;
  v84[7] = v76;
  v84[8] = v75;
  v84[9] = v74;
  v84[10] = v72;
  v84[11] = v71;
  v84[12] = v70;
  v84[13] = v73;
  v84[14] = v68;
  v84[15] = v69;
  v84[16] = v60;
  v84[17] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 18));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v64);

  contentBottomByError = self->_contentBottomByError;
  self->_contentBottomByError = v71;
  v66 = v71;

  contentBottomByTimeSelection = self->_contentBottomByTimeSelection;
  self->_contentBottomByTimeSelection = v60;

}

- (void)addDateAndPartySizeButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeButton](self, "dateAndPartySizeButton"));
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (void)setDateAndPartySizeText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeLabel](self, "dateAndPartySizeLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)dateAndPartySizeText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeLabel](self, "dateAndPartySizeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setDateAndPartySizeButtonText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeButton](self, "dateAndPartySizeButton"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (NSString)dateAndPartySizeButtonText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeButton](self, "dateAndPartySizeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (void)setHideDateAndPartySize:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _QWORD v7[5];

  v4 = a4;
  v5 = a3;
  if (-[RestaurantReservationTableViewCell dateAndPartySizeHidden](self, "dateAndPartySizeHidden") != a3)
  {
    if (v4)
    {
      -[RestaurantReservationTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
      -[RestaurantReservationTableViewCell setDateAndPartySizeHidden:](self, "setDateAndPartySizeHidden:", v5);
      -[RestaurantReservationTableViewCell setNeedsLayout](self, "setNeedsLayout");
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100B075AC;
      v7[3] = &unk_1011AC860;
      v7[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, 0);
    }
    else
    {
      -[RestaurantReservationTableViewCell setDateAndPartySizeHidden:](self, "setDateAndPartySizeHidden:", v5);
      -[RestaurantReservationTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setLoading:(BOOL)a3
{
  -[RestaurantReservationTableViewCell setLoading:animated:](self, "setLoading:animated:", a3, 0);
}

- (BOOL)loading
{
  return !-[RestaurantReservationTableViewCell loadingIndicatorHidden](self, "loadingIndicatorHidden");
}

- (void)setLoading:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  id v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];

  v4 = a4;
  v5 = a3;
  if (-[RestaurantReservationTableViewCell loading](self, "loading") != a3)
  {
    -[RestaurantReservationTableViewCell setLoadingIndicatorHidden:](self, "setLoadingIndicatorHidden:", !v5);
    -[RestaurantReservationTableViewCell setNeedsLayout](self, "setNeedsLayout");
    if (!v5)
    {
      if (!v4)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell loadingIndicator](self, "loadingIndicator"));
        objc_msgSend(v8, "stopAnimating");

        return;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell loadingIndicator](self, "loadingIndicator"));
      objc_msgSend(v7, "startAnimating");

      if (!v4)
        return;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B076EC;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B076F4;
    v9[3] = &unk_1011AF4D8;
    v10 = v5;
    v9[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v11, v9);
  }
}

- (void)setLoadingText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell loadingIndicatorLabel](self, "loadingIndicatorLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)loadingText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell loadingIndicatorLabel](self, "loadingIndicatorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setErrorText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorLabel](self, "errorLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)errorText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorLabel](self, "errorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setErrorButtonText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButtonTitleLabel](self, "errorButtonTitleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)errorButtonText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButtonTitleLabel](self, "errorButtonTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setDisplayError:(BOOL)a3
{
  -[RestaurantReservationTableViewCell setDisplayError:animated:](self, "setDisplayError:animated:", a3, 0);
}

- (BOOL)displayError
{
  return !-[RestaurantReservationTableViewCell errorHidden](self, "errorHidden");
}

- (void)setDisplayError:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _QWORD v7[5];

  v4 = a4;
  v5 = a3;
  if (-[RestaurantReservationTableViewCell displayError](self, "displayError") != a3)
  {
    if (v4)
    {
      -[RestaurantReservationTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
      -[RestaurantReservationTableViewCell setErrorHidden:](self, "setErrorHidden:", !v5);
      -[RestaurantReservationTableViewCell setNeedsLayout](self, "setNeedsLayout");
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100B079B4;
      v7[3] = &unk_1011AC860;
      v7[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, 0);
    }
    else
    {
      -[RestaurantReservationTableViewCell setErrorHidden:](self, "setErrorHidden:", !v5);
      -[RestaurantReservationTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)addErrorButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorButton](self, "errorButton"));
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (RestaurantReservationCollectionViewFlowLayout)timeSelectionCollectionViewLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell timeSelectionCollectionView](self, "timeSelectionCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionViewLayout"));

  return (RestaurantReservationCollectionViewFlowLayout *)v3;
}

- (BOOL)timeSelectionHidden
{
  if (-[RestaurantReservationTableViewCell loadingIndicatorHidden](self, "loadingIndicatorHidden"))
    return !-[RestaurantReservationTableViewCell errorHidden](self, "errorHidden");
  else
    return 1;
}

- (void)setDisplayOffers:(BOOL)a3
{
  if (self->_displayOffers != a3)
  {
    self->_displayOffers = a3;
    -[RestaurantReservationTableViewCell _updateContentViewBottomConstraint](self, "_updateContentViewBottomConstraint");
  }
}

+ (id)reuseIdentifierForClass:(Class)a3
{
  return NSStringFromClass(a3);
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RestaurantReservationTableViewCell;
  -[RestaurantReservationTableViewCell layoutSubviews](&v11, "layoutSubviews");
  if (-[RestaurantReservationTableViewCell dateAndPartySizeHidden](self, "dateAndPartySizeHidden"))
    v3 = 0.0;
  else
    v3 = 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell dateAndPartySizeContainerView](self, "dateAndPartySizeContainerView"));
  objc_msgSend(v4, "setAlpha:", v3);

  if (-[RestaurantReservationTableViewCell loadingIndicatorHidden](self, "loadingIndicatorHidden"))
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell loadingIndicatorContainerView](self, "loadingIndicatorContainerView"));
  objc_msgSend(v6, "setAlpha:", v5);

  if (-[RestaurantReservationTableViewCell errorHidden](self, "errorHidden"))
    v7 = 0.0;
  else
    v7 = 1.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell errorContainerView](self, "errorContainerView"));
  objc_msgSend(v8, "setAlpha:", v7);

  if (-[RestaurantReservationTableViewCell timeSelectionHidden](self, "timeSelectionHidden"))
    v9 = 0.0;
  else
    v9 = 1.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell timeSelectionCollectionView](self, "timeSelectionCollectionView"));
  objc_msgSend(v10, "setAlpha:", v9);

}

- (void)updateConstraints
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentBottomByError](self, "contentBottomByError"));

  if (v3)
  {
    v4 = -[RestaurantReservationTableViewCell errorHidden](self, "errorHidden");
    v5 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentBottomByError](self, "contentBottomByError"));
    v6 = (void *)v5;
    if (v4)
    {
      v10 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);
    }
    else
    {
      v9 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);
    }

  }
  -[RestaurantReservationTableViewCell _updateContentViewBottomConstraint](self, "_updateContentViewBottomConstraint");
  v8.receiver = self;
  v8.super_class = (Class)RestaurantReservationTableViewCell;
  -[RestaurantReservationTableViewCell updateConstraints](&v8, "updateConstraints");
}

- (void)_updateContentViewBottomConstraint
{
  double v3;
  id v4;

  if (-[RestaurantReservationTableViewCell displayOffers](self, "displayOffers"))
    v3 = -4.0;
  else
    v3 = -22.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationTableViewCell contentBottomByTimeSelection](self, "contentBottomByTimeSelection"));
  objc_msgSend(v4, "setConstant:", v3);

}

- (UIView)dateAndPartySizeContainerView
{
  return self->_dateAndPartySizeContainerView;
}

- (void)setDateAndPartySizeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_dateAndPartySizeContainerView, a3);
}

- (UILabel)dateAndPartySizeLabel
{
  return self->_dateAndPartySizeLabel;
}

- (void)setDateAndPartySizeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateAndPartySizeLabel, a3);
}

- (UIButton)dateAndPartySizeButton
{
  return self->_dateAndPartySizeButton;
}

- (void)setDateAndPartySizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_dateAndPartySizeButton, a3);
}

- (BOOL)dateAndPartySizeHidden
{
  return self->_dateAndPartySizeHidden;
}

- (void)setDateAndPartySizeHidden:(BOOL)a3
{
  self->_dateAndPartySizeHidden = a3;
}

- (UIView)loadingIndicatorContainerView
{
  return self->_loadingIndicatorContainerView;
}

- (void)setLoadingIndicatorContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorContainerView, a3);
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (UILabel)loadingIndicatorLabel
{
  return self->_loadingIndicatorLabel;
}

- (void)setLoadingIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorLabel, a3);
}

- (BOOL)loadingIndicatorHidden
{
  return self->_loadingIndicatorHidden;
}

- (void)setLoadingIndicatorHidden:(BOOL)a3
{
  self->_loadingIndicatorHidden = a3;
}

- (UIView)errorContainerView
{
  return self->_errorContainerView;
}

- (void)setErrorContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_errorContainerView, a3);
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void)setErrorButton:(id)a3
{
  objc_storeStrong((id *)&self->_errorButton, a3);
}

- (UILabel)errorButtonTitleLabel
{
  return self->_errorButtonTitleLabel;
}

- (void)setErrorButtonTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorButtonTitleLabel, a3);
}

- (BOOL)errorHidden
{
  return self->_errorHidden;
}

- (void)setErrorHidden:(BOOL)a3
{
  self->_errorHidden = a3;
}

- (UICollectionView)timeSelectionCollectionView
{
  return self->_timeSelectionCollectionView;
}

- (void)setTimeSelectionCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_timeSelectionCollectionView, a3);
}

- (BOOL)displayOffers
{
  return self->_displayOffers;
}

- (NSLayoutConstraint)contentBottomByTimeSelection
{
  return self->_contentBottomByTimeSelection;
}

- (void)setContentBottomByTimeSelection:(id)a3
{
  objc_storeStrong((id *)&self->_contentBottomByTimeSelection, a3);
}

- (NSLayoutConstraint)contentBottomByError
{
  return self->_contentBottomByError;
}

- (void)setContentBottomByError:(id)a3
{
  objc_storeStrong((id *)&self->_contentBottomByError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBottomByError, 0);
  objc_storeStrong((id *)&self->_contentBottomByTimeSelection, 0);
  objc_storeStrong((id *)&self->_timeSelectionCollectionView, 0);
  objc_storeStrong((id *)&self->_errorButtonTitleLabel, 0);
  objc_storeStrong((id *)&self->_errorButton, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_errorContainerView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_dateAndPartySizeButton, 0);
  objc_storeStrong((id *)&self->_dateAndPartySizeLabel, 0);
  objc_storeStrong((id *)&self->_dateAndPartySizeContainerView, 0);
}

@end
