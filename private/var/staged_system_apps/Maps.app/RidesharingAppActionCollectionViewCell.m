@implementation RidesharingAppActionCollectionViewCell

- (RidesharingAppActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  RidesharingAppActionCollectionViewCell *v3;
  RidesharingAppActionCollectionViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RidesharingAppActionCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RidesharingAppActionCollectionViewCell _setupViews](v3, "_setupViews");
    -[RidesharingAppActionCollectionViewCell _setupConstraints](v4, "_setupConstraints");
    -[RidesharingAppActionCollectionViewCell _updateContentSizeCategoryDependentFontsAndConstraints](v4, "_updateContentSizeCategoryDependentFontsAndConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_updateContentSizeCategoryDependentFontsAndConstraints", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppActionCollectionViewCell;
  -[RidesharingAppActionCollectionViewCell dealloc](&v4, "dealloc");
}

- (void)_setupViews
{
  UIButton *v3;
  UIButton *actionButton;
  void *v5;

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "_openAppPressed:", 0x2000);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_actionButton);

  -[RidesharingAppActionCollectionViewCell updateTheme](self, "updateTheme");
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
  v9.super_class = (Class)RidesharingAppActionCollectionViewCell;
  -[MapsThemeCollectionViewCell updateTheme](&v9, "updateTheme");
  actionButton = self->_actionButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
  -[UIButton setTitleColor:forState:](actionButton, "setTitleColor:forState:", v5, 0);

  v6 = self->_actionButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell theme](self, "theme"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  buttonBaselineToTopConstraint = self->_buttonBaselineToTopConstraint;
  self->_buttonBaselineToTopConstraint = v6;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_actionButton, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 16.0));
  v22[0] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_actionButton, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v10, -16.0));
  v12 = self->_buttonBaselineToTopConstraint;
  v22[1] = v11;
  v22[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_actionButton, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v22[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_openAppPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAppActionCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "ridesharingAppActionCollectionViewCellDidPerformAction:", self);

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
  -[RidesharingAppActionCollectionViewCell setApplicationName:titleType:](self, "setApplicationName:titleType:", v8, a4);

}

- (void)setApplicationName:(id)a3 titleType:(unint64_t)a4
{
  UIButton *actionButton;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  id v13;

  v13 = a3;
  self->_titleType = a4;
  switch(a4)
  {
    case 0uLL:
      actionButton = self->_actionButton;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Open App %@ [Ridesharing]");
      goto LABEL_5;
    case 1uLL:
      actionButton = self->_actionButton;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("View App %@ [Ridesharing]");
      goto LABEL_5;
    case 2uLL:
      actionButton = self->_actionButton;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("More from App %@ [Ridesharing]");
LABEL_5:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v13));
      -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v11, 0);

      goto LABEL_7;
    case 3uLL:
      v12 = self->_actionButton;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("More from the App Store [Ridesharing]"), CFSTR("localized string not found"), 0));
      -[UIButton setTitle:forState:](v12, "setTitle:forState:", v10, 0);
LABEL_7:

      break;
    default:
      break;
  }

}

- (RidesharingAppActionCollectionViewCellDelegate)delegate
{
  return (RidesharingAppActionCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
