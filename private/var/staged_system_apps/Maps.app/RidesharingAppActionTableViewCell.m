@implementation RidesharingAppActionTableViewCell

- (RidesharingAppActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RidesharingAppActionTableViewCell *v4;
  RidesharingAppActionTableViewCell *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RidesharingAppActionTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RidesharingAppActionTableViewCell _setupViews](v4, "_setupViews");
    -[RidesharingAppActionTableViewCell _setupConstraints](v5, "_setupConstraints");
    -[RidesharingAppActionTableViewCell _updateContentSizeCategoryDependentFontsAndConstraints](v5, "_updateContentSizeCategoryDependentFontsAndConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_updateContentSizeCategoryDependentFontsAndConstraints", UIContentSizeCategoryDidChangeNotification, 0);

    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[RidesharingAppActionTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v9);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppActionTableViewCell;
  -[RidesharingAppActionTableViewCell dealloc](&v4, "dealloc");
}

- (void)_setupViews
{
  UIButton *v3;
  UIButton *actionButton;
  void *v5;

  -[RidesharingAppActionTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "_openAppPressed:", 0x2000);
  -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", CFSTR("ActionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_actionButton);

  -[RidesharingAppActionTableViewCell updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  UIButton *actionButton;
  void *v4;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RidesharingAppActionTableViewCell;
  -[MapsThemeTableViewCell updateTheme](&v9, "updateTheme");
  actionButton = self->_actionButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
  -[UIButton setTitleColor:forState:](actionButton, "setTitleColor:forState:", v5, 0);

  v6 = self->_actionButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "darkKeyColor"));
  -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v8, 1);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *buttonBaselineToTopConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton firstBaselineAnchor](self->_actionButton, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  buttonBaselineToTopConstraint = self->_buttonBaselineToTopConstraint;
  self->_buttonBaselineToTopConstraint = v6;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_actionButton, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 16.0));
  v22[0] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_actionButton, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v10, -16.0));
  v12 = self->_buttonBaselineToTopConstraint;
  v22[1] = v11;
  v22[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](self->_actionButton, "lastBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -41.0));
  v22[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_openAppPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "ridesharingAppActionTableViewCellDidPerformAction:", self);

}

- (void)_updateContentSizeCategoryDependentFontsAndConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubheadline, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  objc_msgSend(v5, "_mapkit_scaledValueForValue:", 25.0);
  -[NSLayoutConstraint setConstant:](self->_buttonBaselineToTopConstraint, "setConstant:");

}

- (void)configureWithRideBookingRideOptionStatus:(id)a3 titleType:(unint64_t)a4
{
  id v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_status, a3);
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  -[RidesharingAppActionTableViewCell setApplicationName:titleType:](self, "setApplicationName:titleType:", v8, a4);

}

- (void)setApplicationName:(id)a3 titleType:(unint64_t)a4
{
  id v6;
  UIButton *actionButton;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  self->_titleType = a4;
  v18 = v6;
  switch(a4)
  {
    case 0uLL:
      actionButton = self->_actionButton;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("Open App %@ [Ridesharing]");
      goto LABEL_5;
    case 1uLL:
      actionButton = self->_actionButton;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("View App %@ [Ridesharing]");
      goto LABEL_5;
    case 2uLL:
      actionButton = self->_actionButton;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("More from App %@ [Ridesharing]");
LABEL_5:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v18));
      -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v12, 0);

      break;
    case 3uLL:
      v13 = self->_actionButton;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("More from the App Store [Ridesharing]"), CFSTR("localized string not found"), 0));
      -[UIButton setTitle:forState:](v13, "setTitle:forState:", v15, 0);

      break;
    default:
      break;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  objc_msgSend(v16, "setLineBreakMode:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  objc_msgSend(v17, "setNumberOfLines:", 0);

}

- (RidesharingAppActionTableViewCellDelegate)delegate
{
  return (RidesharingAppActionTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(unint64_t)a3
{
  self->_titleType = a3;
}

- (RideBookingRideOptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (NSLayoutConstraint)buttonBaselineToTopConstraint
{
  return self->_buttonBaselineToTopConstraint;
}

- (void)setButtonBaselineToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBaselineToTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
