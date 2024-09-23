@implementation TransitScheduleNetworkActivityTableViewCell

- (TransitScheduleNetworkActivityTableViewCell)initWithFrame:(CGRect)a3
{
  TransitScheduleNetworkActivityTableViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitScheduleNetworkActivityTableViewCell;
  v3 = -[TransitScheduleNetworkActivityTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitScheduleNetworkActivityTableViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)configureLoadingView
{
  LoadingModeView *v3;
  void *v4;
  void *v5;
  LoadingModeView *v6;
  LoadingModeView *loadingView;
  LoadingModeView *v8;
  void *v9;
  LoadingModeView *v10;
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
  _QWORD v30[4];

  if (!self->_loadingView)
  {
    v3 = [LoadingModeView alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Transit Schedule] Loading ..."), CFSTR("localized string not found"), 0));
    v6 = -[LoadingModeView initWithTitle:axis:](v3, "initWithTitle:axis:", v5, 0);
    loadingView = self->_loadingView;
    self->_loadingView = v6;

    -[LoadingModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_loadingView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell labelColor](self, "labelColor"));
    -[LoadingModeView setTitleColor:](v8, "setTitleColor:", v9);

    v10 = self->_loadingView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell labelFont](self, "labelFont"));
    -[LoadingModeView setTitleFont:](v10, "setTitleFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    objc_msgSend(v12, "addSubview:", self->_loadingView);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView topAnchor](self->_loadingView, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v30[0] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView bottomAnchor](self->_loadingView, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v30[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView leadingAnchor](self->_loadingView, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v30[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView trailingAnchor](self->_loadingView, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    v30[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
}

- (void)configureErrorView
{
  UILabel *v3;
  UILabel *errorLabel;
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
  _QWORD v29[4];

  if (!self->_errorLabel)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    errorLabel = self->_errorLabel;
    self->_errorLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_errorLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_errorLabel, "setNumberOfLines:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell labelFont](self, "labelFont"));
    -[UILabel setFont:](self->_errorLabel, "setFont:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell labelColor](self, "labelColor"));
    -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v6);

    if (self->_state == 3 && -[NSString length](self->_serverErrorString, "length"))
    {
      -[UILabel setText:](self->_errorLabel, "setText:", self->_serverErrorString);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Transit Schedule] Offline error message"), CFSTR("localized string not found"), 0));
      -[UILabel setText:](self->_errorLabel, "setText:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    objc_msgSend(v9, "addSubview:", self->_errorLabel);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_errorLabel, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0));
    v29[0] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_errorLabel, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v22, 1.0));
    v29[1] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_errorLabel, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v11));
    v29[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_errorLabel, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleNetworkActivityTableViewCell contentView](self, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v29[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
  if (self->_state == 3 && -[NSString length](self->_serverErrorString, "length"))
  {
    -[UILabel setText:](self->_errorLabel, "setText:", self->_serverErrorString);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Transit Schedule] Offline error message"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_errorLabel, "setText:", v19);

  }
}

- (void)setState:(unint64_t)a3 withErrorString:(id)a4
{
  NSString *v5;
  NSString *serverErrorString;
  UIView **p_currentView;
  unint64_t state;
  id *p_errorLabel;

  self->_state = a3;
  v5 = (NSString *)objc_msgSend(a4, "copy");
  serverErrorString = self->_serverErrorString;
  self->_serverErrorString = v5;

  p_currentView = &self->_currentView;
  -[UIView setHidden:](self->_currentView, "setHidden:", 1);
  state = self->_state;
  if (state - 3 < 2)
  {
    -[TransitScheduleNetworkActivityTableViewCell configureErrorView](self, "configureErrorView");
    p_errorLabel = (id *)&self->_errorLabel;
LABEL_5:
    objc_storeStrong((id *)p_currentView, *p_errorLabel);
    goto LABEL_6;
  }
  if (state == 2)
  {
    -[TransitScheduleNetworkActivityTableViewCell configureLoadingView](self, "configureLoadingView");
    p_errorLabel = (id *)&self->_loadingView;
    objc_msgSend(*p_errorLabel, "startAnimating");
    goto LABEL_5;
  }
LABEL_6:
  -[UIView setHidden:](*p_currentView, "setHidden:", 0);
}

- (void)setState:(unint64_t)a3
{
  -[TransitScheduleNetworkActivityTableViewCell setState:withErrorString:](self, "setState:withErrorString:", a3, 0);
}

- (void)setErrorStateWithString:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_state != 3
    || (v5 = objc_msgSend(v4, "isEqualToString:", self->_serverErrorString), v6 = v7, (v5 & 1) == 0))
  {
    -[TransitScheduleNetworkActivityTableViewCell setState:withErrorString:](self, "setState:withErrorString:", 3, v7);
    v6 = v7;
  }

}

- (id)labelColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (id)labelFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_serverErrorString, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
