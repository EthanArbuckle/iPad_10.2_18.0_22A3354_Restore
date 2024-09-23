@implementation SharedTripNavBannerView

- (SharedTripNavBannerView)initWithFrame:(CGRect)a3
{
  SharedTripNavBannerView *v3;
  uint64_t v4;
  UIVisualEffectView *backgroundView;
  uint64_t v6;
  UIButton *shareETAButton;
  void *v8;
  UIVisualEffectView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *buttonHeightConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  objc_super v41;
  _QWORD v42[7];

  v41.receiver = self;
  v41.super_class = (Class)SharedTripNavBannerView;
  v3 = -[SharedTripNavBannerView initWithFrame:](&v41, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIVisualEffectView *)v4;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SharedTripNavBannerView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v6 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    shareETAButton = v3->_shareETAButton;
    v3->_shareETAButton = (UIButton *)v6;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_shareETAButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backgroundView, "contentView"));
    objc_msgSend(v8, "addSubview:", v3->_shareETAButton);

    v9 = v3->_backgroundView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView window](v9, "window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView window](v9, "window"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
      objc_msgSend(v13, "nativeScale");
      v15 = v14;

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v12, "nativeScale");
      v15 = v16;
    }

    if (v15 <= 0.0)
      v17 = 1.0;
    else
      v17 = 1.0 / v15;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v3->_shareETAButton, "heightAnchor"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
    buttonHeightConstraint = v3->_buttonHeightConstraint;
    v3->_buttonHeightConstraint = (NSLayoutConstraint *)v19;

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](v3->_backgroundView, "heightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView heightAnchor](v3, "heightAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -v17));
    v42[0] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](v3->_backgroundView, "widthAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView widthAnchor](v3, "widthAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v42[1] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v3->_backgroundView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView topAnchor](v3, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v17));
    v42[2] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v3->_shareETAButton, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView widthAnchor](v3, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v21));
    v42[3] = v22;
    v42[4] = v3->_buttonHeightConstraint;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v3->_shareETAButton, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView centerXAnchor](v3, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v42[5] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v3->_shareETAButton, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView topAnchor](v3, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v42[6] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    -[SharedTripNavBannerView _updateFonts](v3, "_updateFonts");
    -[SharedTripNavBannerView _updateButtonHeightConstraint](v3, "_updateButtonHeightConstraint");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SharedTripNavBannerView;
  -[SharedTripNavBannerView dealloc](&v4, "dealloc");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SharedTripNavBannerView;
  v4 = a3;
  -[MapsThemeView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
  {
    -[SharedTripNavBannerView _updateFonts](self, "_updateFonts");
    -[SharedTripNavBannerView _updateButtonHeightConstraint](self, "_updateButtonHeightConstraint");
  }
}

- (NSLayoutDimension)contentHeightAnchor
{
  return (NSLayoutDimension *)-[UIButton heightAnchor](self->_shareETAButton, "heightAnchor");
}

- (BOOL)bannerShouldShow
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivers"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)updateButtonTitle
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *shareETAButton;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receivers"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Share ETA] nav banner button"), CFSTR("localized string not found"), 0));

  shareETAButton = self->_shareETAButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, objc_msgSend(v8, "count")));
  -[UIButton setTitle:forState:](shareETAButton, "setTitle:forState:", v7, 0);

}

- (void)_updateButtonHeightConstraint
{
  -[SharedTripNavBannerView buttonHeightConstant](self, "buttonHeightConstant");
  -[NSLayoutConstraint setConstant:](self->_buttonHeightConstraint, "setConstant:");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryExtraExtraExtraLarge));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20CompatibleWithTraitCollection:](UIFont, "system20CompatibleWithTraitCollection:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareETAButton, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

}

- (double)buttonHeightConstant
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareETAButton, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 46.0);
  v5 = v4;

  return v5;
}

- (void)updateTheme
{
  UIButton *shareETAButton;
  void *v3;
  id v4;

  shareETAButton = self->_shareETAButton;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripNavBannerView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
  -[UIButton setTitleColor:forState:](shareETAButton, "setTitleColor:forState:", v3, 0);

}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  -[UIButton addTarget:action:forControlEvents:](self->_shareETAButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_shareETAButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
