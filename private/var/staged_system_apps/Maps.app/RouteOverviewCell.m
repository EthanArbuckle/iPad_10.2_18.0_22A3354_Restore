@implementation RouteOverviewCell

+ (double)minimumHeight
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (sub_1002A8AA0(v2) == 5)
    v3 = 48.0;
  else
    v3 = 120.0;

  return v3;
}

+ (double)minimumRidesharingHeight
{
  return 103.0;
}

+ (double)minimumVerticalPadding
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (sub_1002A8AA0(v2) == 5)
    v3 = 9.0;
  else
    v3 = 16.0;

  return v3;
}

+ (double)horizontalContentInset
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (sub_1002A8AA0(v2) == 5)
    v3 = 18.0;
  else
    v3 = 32.0;

  return v3;
}

+ (double)horizontalBackgroundInset
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (sub_1002A8AA0(v2) == 5)
    v3 = 10.0;
  else
    v3 = 16.0;

  return v3;
}

+ (id)primaryLabelFontProvider
{
  void *v2;
  Block_layout *v3;
  Block_layout *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)5)
    v3 = &stru_1011E7BD8;
  else
    v3 = &stru_1011E7B78;
  v4 = objc_retainBlock(v3);

  return v4;
}

+ (id)primaryLabelEnlargedFontProvider
{
  return objc_retainBlock(&stru_1011E7B38);
}

+ (id)secondaryLabelFontProvider
{
  void *v2;
  Block_layout *v3;
  Block_layout *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)5)
    v3 = &stru_1011E7A38;
  else
    v3 = &stru_1011E7A78;
  v4 = objc_retainBlock(v3);

  return v4;
}

+ (id)goButtonFontProvider
{
  return objc_retainBlock(&stru_1011E7BB8);
}

+ (id)tertiaryLabelBoldFont
{
  return sub_100BA54C4(&stru_1011E7C38);
}

- (RouteOverviewCell)initWithFrame:(CGRect)a3
{
  RouteOverviewCell *v3;
  RouteOverviewCell *v4;
  RouteOverviewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteOverviewCell;
  v3 = -[RouteOverviewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RouteOverviewCell customInit](v3, "customInit");
    v5 = v4;
  }

  return v4;
}

- (RouteOverviewCell)initWithCoder:(id)a3
{
  RouteOverviewCell *v3;
  RouteOverviewCell *v4;
  RouteOverviewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteOverviewCell;
  v3 = -[RouteOverviewCell initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[RouteOverviewCell customInit](v3, "customInit");
    v5 = v4;
  }

  return v4;
}

- (void)customInit
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id location;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_doubleTap:");
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v3;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_doubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:", self->_detailsButtonVisible);
    -[RouteOverviewCell addGestureRecognizer:](self, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  self->_buttonVisibility = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RouteOverviewCell setBackgroundColor:](self, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100C698EC;
  v15 = &unk_1011AF768;
  objc_copyWeak(&v16, &location);
  -[RouteOverviewCell _setBackgroundViewConfigurationProvider:](self, "_setBackgroundViewConfigurationProvider:", &v12);
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[RouteOverviewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v11, v12, v13, v14, v15);

  -[RouteOverviewCell _createSubviews](self, "_createSubviews");
  -[RouteOverviewCell _setupConstraints](self, "_setupConstraints");
  -[RouteOverviewCell _updateButtonVisibility](self, "_updateButtonVisibility");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_createSubviews
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AutolayoutImageView *v8;
  void *v9;
  MapsThemeMultiPartLabel *v10;
  id v11;
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
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
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
  AutolayoutImageView *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id location;
  NSAttributedStringKey v62;
  void *v63;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v57 = v3;
  objc_msgSend(v3, "setNumberOfLines:", 0);
  v4 = objc_msgSend((id)objc_opt_class(self), "primaryLabelFontProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3, v5);

  objc_storeStrong((id *)&self->_primaryLabel, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_primaryLabel);

  v8 = objc_alloc_init(AutolayoutImageView);
  -[AutolayoutImageView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AutolayoutImageView setHidden:](v8, "setHidden:", 1);
  v56 = v8;
  objc_storeStrong((id *)&self->_primaryLabelCompanionImageView, v8);
  -[UIImageView setAccessibilityIdentifier:](self->_primaryLabelCompanionImageView, "setAccessibilityIdentifier:", CFSTR("PrimaryLabelCompanionImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_primaryLabelCompanionImageView);

  v10 = objc_alloc_init(MapsThemeMultiPartLabel);
  -[MapsThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeMultiPartLabel setNumberOfLines:](v10, "setNumberOfLines:", 0);
  -[MapsThemeMultiPartLabel setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
  v11 = objc_msgSend((id)objc_opt_class(self), "secondaryLabelFontProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v10, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v13, "addSubview:", v10);

  objc_storeStrong((id *)&self->_secondaryLabel, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeMultiPartLabel setTextColor:](self->_secondaryLabel, "setTextColor:", v14);

  -[MapsThemeMultiPartLabel setTextInset:](self->_secondaryLabel, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[MapsThemeMultiPartLabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsProgressButton buttonWithType:](MapsProgressButton, "buttonWithType:", 0));
  objc_msgSend(v15, "setClipsToBounds:", 1);
  objc_msgSend(v15, "_setContinuousCornerRadius:", 12.0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
  objc_msgSend(v17, "setMinimumScaleFactor:", 0.474999994);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
  objc_msgSend(v18, "setAllowsDefaultTighteningForTruncation:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
  objc_msgSend(v19, "setLineBreakMode:", 2);

  objc_msgSend(v15, "setFillStyle:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("GO [Route Planning]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v15, "setTitle:forState:", v21, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
  v23 = objc_msgSend((id)objc_opt_class(self), "goButtonFontProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v22, v24);

  +[DynamicTypeWizard makeObject:performSelector:whenSizeCategoryChangesWithOrder:](DynamicTypeWizard, "makeObject:performSelector:whenSizeCategoryChangesWithOrder:", self, "_updateGoButtonWidthConstraint", 2);
  objc_msgSend(v15, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self);
  objc_msgSend(v15, "setHidden:", self->_buttonVisibility != 1);
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("GoButton"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v25, "addSubview:", v15);

  objc_storeStrong((id *)&self->_goButton, v15);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
  objc_msgSend(v58, "setBackgroundColor:", v26);

  objc_msgSend(v58, "setCornerRadius:", 10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v27, "setImagePlacement:", 1);
  objc_msgSend(v27, "setTitleLineBreakMode:", 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 2, 20.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.2"), v28));
  objc_msgSend(v27, "setImage:", v29);

  objc_msgSend(v27, "setContentInsets:", 8.0, 8.0, 8.0, 8.0);
  v30 = objc_alloc((Class)NSAttributedString);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Steps [Route Planning]"), CFSTR("localized string not found"), 0));
  v62 = NSFontAttributeName;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightBold));
  v63 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
  v35 = objc_msgSend(v30, "initWithString:attributes:", v32, v34);
  objc_msgSend(v27, "setAttributedTitle:", v35);

  objc_msgSend(v27, "setBackground:", v58);
  objc_initWeak(&location, self);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100C6A54C;
  v59[3] = &unk_1011AF8A0;
  objc_copyWeak(&v60, &location);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v59));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v27, v36));

  objc_msgSend(v37, "setMaximumContentSizeCategory:", UIContentSizeCategoryLarge);
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v37, "setHidden:", self->_buttonVisibility != 3);
  objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("StepsButton"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v38, "addSubview:", v37);

  objc_storeStrong((id *)&self->_stepsButton, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 0));
  objc_msgSend(v39, "setClipsToBounds:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v40, "setCornerRadius:", 8.0);

  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RouteOverviewCell _resetBookButtonTitle](self, "_resetBookButtonTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v41, &stru_1011E7C18);

  objc_msgSend(v39, "setContentEdgeInsets:", 0.0, 11.0, 0.0, 11.0);
  objc_msgSend(v39, "addTarget:action:forControlEvents:", self, "_didTapPrimaryActionButton:", 64);
  objc_msgSend(v39, "setHidden:", self->_buttonVisibility != 2);
  objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("BookButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v42, "addSubview:", v39);

  objc_storeStrong((id *)&self->_bookButton, v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  objc_msgSend(v43, "setAccessibilityIdentifier:", CFSTR("RouteOverviewCellContent"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesView](self, "advisoriesView"));
  objc_msgSend(v44, "addSubview:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkList](self, "artworkList"));
  objc_msgSend(v46, "addSubview:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
  objc_msgSend(v48, "addSubview:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v50, "addSubview:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
  objc_msgSend(v52, "addSubview:", v53);

  -[DirectionsElevationGraphView setHidden:](self->_elevationGraphView, "setHidden:", 1);
  -[UILabel setHidden:](self->_tertiaryLabel, "setHidden:", 1);
  -[UIButton setHidden:](self->_detailsButton, "setHidden:", 1);
  -[TransitArtworkListView setHidden:](self->_artworkList, "setHidden:", 1);
  -[RouteAdvisoriesView setHidden:](self->_advisoriesView, "setHidden:", 1);
  if (sub_1002A8AA0(self) == 5)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UILabel setHighlightedTextColor:](self->_primaryLabel, "setHighlightedTextColor:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[MapsThemeMultiPartLabel setHighlightedTextColor:](self->_secondaryLabel, "setHighlightedTextColor:", v55);

  }
  -[RouteOverviewCell _updateColorsForSelection](self, "_updateColorsForSelection");

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

}

- (UIImage)primaryLabelCompanionImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setPrimaryLabelCompanionImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  objc_msgSend(v5, "setImage:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v7 = v6;
  if (v4)
    v8 = 8.0;
  else
    v8 = 0.0;
  if (v4)
    v9 = 20.0;
  else
    v9 = 0.0;
  objc_msgSend(v6, "setHidden:", v4 == 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryCompanionImageToLabelPaddingConstraint](self, "primaryCompanionImageToLabelPaddingConstraint"));
  objc_msgSend(v10, "setConstant:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryCompanionImageWidthConstraint](self, "primaryCompanionImageWidthConstraint"));
  objc_msgSend(v11, "setConstant:", v9);

}

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 0;
}

- (void)updateTheme
{
  void *v3;
  MapsProgressButton *goButton;
  void *v5;
  MapsProgressButton *v6;
  void *v7;
  MapsProgressButton *v8;
  void *v9;
  MapsProgressButton *v10;
  void *v11;
  BackgroundColorButton *bookButton;
  void *v13;
  BackgroundColorButton *v14;
  void *v15;
  BackgroundColorButton *v16;
  void *v17;
  BackgroundColorButton *v18;
  void *v19;
  UIButton *detailsButton;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RouteOverviewCell;
  -[MapsThemeCollectionViewListCell updateTheme](&v22, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell theme](self, "theme"));
  goButton = self->_goButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "greenButtonBackgroundColor:", 0));
  -[BackgroundColorButton setBackgroundColor:forState:](goButton, "setBackgroundColor:forState:", v5, 0);

  v6 = self->_goButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "greenButtonBackgroundColor:", 1));
  -[BackgroundColorButton setBackgroundColor:forState:](v6, "setBackgroundColor:forState:", v7, 1);

  v8 = self->_goButton;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "greenButtonTitleColor:", 0));
  -[MapsProgressButton setTitleColor:forState:](v8, "setTitleColor:forState:", v9, 0);

  v10 = self->_goButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "greenButtonTitleColor:", 1));
  -[MapsProgressButton setTitleColor:forState:](v10, "setTitleColor:forState:", v11, 1);

  bookButton = self->_bookButton;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonBackgroundColor:", 0));
  -[BackgroundColorButton setBackgroundColor:forState:](bookButton, "setBackgroundColor:forState:", v13, 0);

  v14 = self->_bookButton;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonBackgroundColor:", 1));
  -[BackgroundColorButton setBackgroundColor:forState:](v14, "setBackgroundColor:forState:", v15, 1);

  v16 = self->_bookButton;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonTitleColor:", 0));
  -[BackgroundColorButton setTitleColor:forState:](v16, "setTitleColor:forState:", v17, 0);

  v18 = self->_bookButton;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blueButtonTitleColor:", 1));
  -[BackgroundColorButton setTitleColor:forState:](v18, "setTitleColor:forState:", v19, 1);

  detailsButton = self->_detailsButton;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
  -[UIButton setTitleColor:forState:](detailsButton, "setTitleColor:forState:", v21, 0);

}

- (void)_setupConstraints
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  NSLayoutConstraint *minimumHeightConstraint;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  _QWORD v205[29];

  v3 = objc_alloc_init((Class)UILayoutGuide);
  -[RouteOverviewCell setContentGuide:](self, "setContentGuide:", v3);

  v4 = objc_alloc_init((Class)UILayoutGuide);
  -[RouteOverviewCell setLabelTrailingToGoButtonLeadingLayoutGuide:](self, "setLabelTrailingToGoButtonLeadingLayoutGuide:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  objc_msgSend(v5, "addLayoutGuide:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  objc_msgSend(v7, "addLayoutGuide:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  LODWORD(v14) = 1148846080;
  objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 1, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 1, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  v22 = objc_msgSend((id)objc_opt_class(self), "secondaryLabelFontProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v21, v23, 0.0));
  -[RouteOverviewCell setPrimaryToSecondaryLabelConstraint:](self, "setPrimaryToSecondaryLabelConstraint:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  LODWORD(v26) = 1148846080;
  objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  LODWORD(v28) = 1148846080;
  objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));

  LODWORD(v33) = 1148829696;
  objc_msgSend(v204, "setPriority:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 0, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  LODWORD(v37) = 1148846080;
  objc_msgSend(v36, "setContentHuggingPriority:forAxis:", 0, v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));

  v43 = v42;
  v177 = v42;
  LODWORD(v44) = 1148829696;
  objc_msgSend(v42, "setPriority:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  LODWORD(v46) = 1148846080;
  objc_msgSend(v45, "setContentCompressionResistancePriority:forAxis:", 0, v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  LODWORD(v48) = 1148846080;
  objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 0, v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));

  v54 = v53;
  v176 = v53;
  LODWORD(v55) = 1148829696;
  objc_msgSend(v53, "setPriority:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
  objc_msgSend((id)objc_opt_class(self), "minimumHeight");
  v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:"));
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v58;

  LODWORD(v60) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_minimumHeightConstraint, "setPriority:", v60);
  objc_msgSend((id)objc_opt_class(self), "horizontalContentInset");
  v62 = v61;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, v62));

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
  v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, -v62));

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v74));
  -[RouteOverviewCell setContentTopConstraint:](self, "setContentTopConstraint:", v75);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bottomAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "lastBaselineAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v79));
  -[RouteOverviewCell setContentBottomConstraint:](self, "setContentBottomConstraint:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "widthAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:", 64.0));
  -[RouteOverviewCell setGoButtonWidthConstraint:](self, "setGoButtonWidthConstraint:", v83);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "heightAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToConstant:", 64.0));
  -[RouteOverviewCell setGoButtonHeightConstraint:](self, "setGoButtonHeightConstraint:", v86);

  -[RouteOverviewCell _updateGoButtonWidthConstraint](self, "_updateGoButtonWidthConstraint");
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "widthAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintGreaterThanOrEqualToConstant:", 64.0));
  -[RouteOverviewCell setStepsButtonMinWidthConstraint:](self, "setStepsButtonMinWidthConstraint:", v89);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "widthAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintLessThanOrEqualToConstant:", 80.0));
  -[RouteOverviewCell setStepsButtonMaxWidthConstraint:](self, "setStepsButtonMaxWidthConstraint:", v92);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "heightAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToConstant:", 64.0));
  -[RouteOverviewCell setStepsButtonHeightConstraint:](self, "setStepsButtonHeightConstraint:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "widthAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToConstant:", 15.0));
  -[RouteOverviewCell setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:](self, "setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:", v98);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "widthAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToConstant:", 0.0));
  -[RouteOverviewCell setPrimaryCompanionImageWidthConstraint:](self, "setPrimaryCompanionImageWidthConstraint:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "trailingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v105));
  -[RouteOverviewCell setPrimaryCompanionImageToLabelPaddingConstraint:](self, "setPrimaryCompanionImageToLabelPaddingConstraint:", v106);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "trailingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "trailingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v110));
  -[RouteOverviewCell setNoButtonLeadingConstraint:](self, "setNoButtonLeadingConstraint:", v111);

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "trailingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v115));
  -[RouteOverviewCell setGoButtonLeadingConstraint:](self, "setGoButtonLeadingConstraint:", v116);

  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "leadingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v120));
  -[RouteOverviewCell setStepsButtonLeadingConstraint:](self, "setStepsButtonLeadingConstraint:", v121);

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "trailingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v125));
  -[RouteOverviewCell setBookButtonLeadingConstraint:](self, "setBookButtonLeadingConstraint:", v126);

  objc_msgSend((id)objc_opt_class(self), "minimumVerticalPadding");
  v128 = v127;
  v203 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell minimumHeightConstraint](self, "minimumHeightConstraint"));
  v205[0] = v203;
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
  v201 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "topAnchor"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "constraintGreaterThanOrEqualToAnchor:constant:", v199, v128));
  v205[1] = v198;
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "bottomAnchor"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "bottomAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "constraintGreaterThanOrEqualToAnchor:constant:", v192, v128));
  v205[2] = v191;
  v190 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "centerYAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "centerYAnchor"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:", v187));
  v205[3] = v186;
  v205[4] = v196;
  v205[5] = v195;
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentTopConstraint](self, "contentTopConstraint"));
  v205[6] = v185;
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentBottomConstraint](self, "contentBottomConstraint"));
  v205[7] = v184;
  v183 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryCompanionImageWidthConstraint](self, "primaryCompanionImageWidthConstraint"));
  v205[8] = v183;
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "leadingAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "leadingAnchor"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "constraintEqualToAnchor:", v179));
  v205[9] = v178;
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryCompanionImageToLabelPaddingConstraint](self, "primaryCompanionImageToLabelPaddingConstraint"));
  v205[10] = v175;
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "trailingAnchor"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "leadingAnchor"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "constraintEqualToAnchor:", v171));
  v205[11] = v170;
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabelCompanionImageView](self, "primaryLabelCompanionImageView"));
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "centerYAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryLabel](self, "primaryLabel"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "centerYAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "constraintEqualToAnchor:", v166));
  v205[12] = v165;
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "leadingAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "leadingAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:", v161));
  v205[13] = v160;
  v159 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "trailingAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:", v155));
  v205[14] = v154;
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell primaryToSecondaryLabelConstraint](self, "primaryToSecondaryLabelConstraint"));
  v205[15] = v153;
  v205[16] = v204;
  v205[17] = v43;
  v205[18] = v54;
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "centerYAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "centerYAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v149));
  v205[19] = v148;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "centerYAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "centerYAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v144));
  v205[20] = v143;
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "centerYAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "centerYAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:", v139));
  v205[21] = v129;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonWidthConstraint](self, "goButtonWidthConstraint"));
  v205[22] = v130;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToPrimaryButtonLeadingPaddingConstraint](self, "labelTrailingToPrimaryButtonLeadingPaddingConstraint"));
  v205[23] = v131;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonHeightConstraint](self, "goButtonHeightConstraint"));
  v205[24] = v132;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonMinWidthConstraint](self, "stepsButtonMinWidthConstraint"));
  v205[25] = v133;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonMaxWidthConstraint](self, "stepsButtonMaxWidthConstraint"));
  v205[26] = v134;
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonHeightConstraint](self, "stepsButtonHeightConstraint"));
  v205[27] = v135;
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "heightAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintGreaterThanOrEqualToConstant:", 40.0));
  v205[28] = v138;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v205, 29));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v158);
}

- (void)_doubleTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "didTapDetailsButtonForRouteOverviewCell:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate"));
    objc_msgSend(v6, "didTapDetailsButtonForRouteOverviewCell:", self);

  }
}

- (int64_t)_resolvedGrouping
{
  if (self->_detailsButtonRotated)
    return 2;
  else
    return -[RouteOverviewCell overrideCellGrouping](self, "overrideCellGrouping");
}

- (UILabel)tertiaryLabel
{
  UILabel *tertiaryLabel;
  UILabel *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *v10;

  tertiaryLabel = self->_tertiaryLabel;
  if (!tertiaryLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    LODWORD(v5) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v5);
    LODWORD(v6) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    if (-[RouteOverviewCell isSelectionBackgroundVisible](self, "isSelectionBackgroundVisible"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UILabel setTextColor:](v4, "setTextColor:", v7);

    }
    if (sub_1002A8AA0(self) == 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UILabel setHighlightedTextColor:](v4, "setHighlightedTextColor:", v8);

    }
    v9 = self->_tertiaryLabel;
    self->_tertiaryLabel = v4;
    v10 = v4;

    -[UILabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));
    tertiaryLabel = self->_tertiaryLabel;
  }
  return tertiaryLabel;
}

- (TransitArtworkListView)artworkList
{
  TransitArtworkListView *artworkList;
  TransitArtworkListView *v4;
  double v5;
  double v6;
  TransitArtworkListView *v7;

  artworkList = self->_artworkList;
  if (!artworkList)
  {
    v4 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TransitArtworkListView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[TransitArtworkListView setVerticalContentHuggingPriority:](v4, "setVerticalContentHuggingPriority:", v5);
    LODWORD(v6) = 1148846080;
    -[TransitArtworkListView setVerticalContentCompressionResistancePriority:](v4, "setVerticalContentCompressionResistancePriority:", v6);
    v7 = self->_artworkList;
    self->_artworkList = v4;

    artworkList = self->_artworkList;
  }
  return artworkList;
}

- (DirectionsElevationGraphView)elevationGraphView
{
  DirectionsElevationGraphView *elevationGraphView;
  DirectionsElevationGraphConfiguration *v4;
  void *v5;
  DirectionsElevationGraphConfiguration *v6;
  DirectionsElevationGraphView *v7;
  double v8;
  DirectionsElevationGraphView *v9;

  elevationGraphView = self->_elevationGraphView;
  if (!elevationGraphView)
  {
    v4 = [DirectionsElevationGraphConfiguration alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
    v6 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v4, "initWithUseType:userInterfaceIdiom:", 1, objc_msgSend(v5, "userInterfaceIdiom"));

    v7 = -[DirectionsElevationGraphView initWithConfiguration:]([DirectionsElevationGraphView alloc], "initWithConfiguration:", v6);
    -[DirectionsElevationGraphView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[DirectionsElevationGraphView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    v9 = self->_elevationGraphView;
    self->_elevationGraphView = v7;

    elevationGraphView = self->_elevationGraphView;
  }
  return elevationGraphView;
}

- (RouteAdvisoriesView)advisoriesView
{
  RouteAdvisoriesView *advisoriesView;
  RouteAdvisoriesView *v4;
  double v5;
  double v6;
  void *v7;
  RouteAdvisoriesView *v8;

  advisoriesView = self->_advisoriesView;
  if (!advisoriesView)
  {
    v4 = objc_alloc_init(RouteAdvisoriesView);
    -[RouteAdvisoriesView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1144750080;
    -[RouteAdvisoriesView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v5);
    LODWORD(v6) = 1148846080;
    -[RouteAdvisoriesView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    if (-[RouteOverviewCell isSelectionBackgroundVisible](self, "isSelectionBackgroundVisible"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[RouteAdvisoriesView setOverrideTextColor:isSelected:](v4, "setOverrideTextColor:isSelected:", v7, 1);

    }
    v8 = self->_advisoriesView;
    self->_advisoriesView = v4;

    advisoriesView = self->_advisoriesView;
  }
  return advisoriesView;
}

- (UIButton)detailsButton
{
  UIButton *detailsButton;
  UIButton *v4;
  UIButton *v5;
  uint64_t v6;
  UIButton *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  detailsButton = self->_detailsButton;
  if (!detailsButton)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      v5 = self->_detailsButton;
      self->_detailsButton = v4;

      if (-[RouteOverviewCell isSelectionBackgroundVisible](self, "isSelectionBackgroundVisible"))
        v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      else
        v6 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      v16 = (void *)v6;
      -[UIButton setTintColor:](self->_detailsButton, "setTintColor:", v6);

      v17 = self->_detailsButton;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle.fill"), v19));
      -[UIButton setImage:forState:](v17, "setImage:forState:", v20, 0);

      LODWORD(v21) = 1148846080;
      -[UIButton setContentHuggingPriority:forAxis:](self->_detailsButton, "setContentHuggingPriority:forAxis:", 0, v21);
      LODWORD(v22) = 1148846080;
      -[UIButton setContentCompressionResistancePriority:forAxis:](self->_detailsButton, "setContentCompressionResistancePriority:forAxis:", 0, v22);
      -[RouteOverviewCell setDetailsButtonRotated:animated:](self, "setDetailsButtonRotated:animated:", self->_detailsButtonRotated, 0);
    }
    else
    {
      v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
      v8 = self->_detailsButton;
      self->_detailsButton = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_detailsButton, "titleLabel"));
      objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_detailsButton, "titleLabel"));
      objc_msgSend(v10, "setMinimumScaleFactor:", 0.600000024);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_detailsButton, "titleLabel"));
      objc_msgSend(v11, "setLineBreakMode:", 4);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_detailsButton, "titleLabel"));
      +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v12, &stru_1011E7A78);

      v13 = self->_detailsButton;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Details [RouteOverviewCell]"), CFSTR("localized string not found"), 0));
      -[UIButton setTitle:forState:](v13, "setTitle:forState:", v15, 0);

    }
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_detailsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v23) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](self->_detailsButton, "setContentHuggingPriority:forAxis:", 1, v23);
    LODWORD(v24) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](self->_detailsButton, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    -[UIButton addTarget:action:forControlEvents:](self->_detailsButton, "addTarget:action:forControlEvents:", self, "_didTapDetailsButton:", 64);
    -[UIButton setAccessibilityIdentifier:](self->_detailsButton, "setAccessibilityIdentifier:", CFSTR("DetailsButton"));
    detailsButton = self->_detailsButton;
  }
  return detailsButton;
}

- (void)setDetailsButtonRotated:(BOOL)a3
{
  -[RouteOverviewCell setDetailsButtonRotated:animated:](self, "setDetailsButtonRotated:animated:", a3, 0);
}

- (void)setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL8 v7;

  v4 = a4;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom") == (id)5;

  }
  else
  {
    v7 = 0;
  }
  if (self->_detailsButtonRotated != v7)
    -[RouteOverviewCell _setDetailsButtonRotated:animated:](self, "_setDetailsButtonRotated:animated:", v7, v4);
}

- (void)_setDetailsButtonRotated:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  _QWORD v13[5];
  CGAffineTransform v14;
  CGAffineTransform v15;

  v4 = a4;
  v5 = a3;
  self->_detailsButtonRotated = a3;
  -[RouteOverviewCell _setBackgroundViewConfigurationGrouping:](self, "_setBackgroundViewConfigurationGrouping:", -[RouteOverviewCell _resolvedGrouping](self, "_resolvedGrouping"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "layoutDirection");

  memset(&v15, 0, sizeof(v15));
  if (v5)
  {
    CGAffineTransformMakeRotation(&v15, dbl_100E3F5B0[v8 == 0]);
    if (!v4)
    {
LABEL_3:
      v12 = v15;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
      v11 = v12;
      objc_msgSend(v9, "setTransform:", &v11);

      return;
    }
  }
  else
  {
    v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v15.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (!v4)
      goto LABEL_3;
  }
  v13[1] = 3221225472;
  v14 = v15;
  v13[0] = _NSConcreteStackBlock;
  v13[2] = sub_100C6C2F8;
  v13[3] = &unk_1011EA5C8;
  v13[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.1);
}

- (void)setTertiaryLabelVisible:(BOOL)a3
{
  if (self->_tertiaryLabelVisible != a3)
  {
    self->_tertiaryLabelVisible = a3;
    -[UILabel setHidden:](self->_tertiaryLabel, "setHidden:", !a3);
    -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setArtworkListVisible:(BOOL)a3
{
  if (self->_artworkListVisible != a3)
  {
    self->_artworkListVisible = a3;
    -[TransitArtworkListView setHidden:](self->_artworkList, "setHidden:", !a3);
    -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setElevationGraphViewVisible:(BOOL)a3
{
  if (self->_elevationGraphViewVisible != a3)
  {
    self->_elevationGraphViewVisible = a3;
    -[DirectionsElevationGraphView setHidden:](self->_elevationGraphView, "setHidden:", !a3);
    -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setAdvisoriesViewVisible:(BOOL)a3
{
  if (self->_advisoriesViewVisible != a3)
  {
    self->_advisoriesViewVisible = a3;
    -[RouteAdvisoriesView setHidden:](self->_advisoriesView, "setHidden:", !a3);
    -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setButtonVisibility:(unint64_t)a3
{
  void *v5;
  id v6;
  unint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
    v7 = 0;
  else
    v7 = a3;
  if (self->_buttonVisibility != v7)
  {
    self->_buttonVisibility = v7;
    -[RouteOverviewCell _updateButtonVisibility](self, "_updateButtonVisibility");
  }
}

- (void)_updateButtonVisibility
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
  uint64_t v14;
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
  id v37;

  switch(self->_buttonVisibility)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
      objc_msgSend(v3, "setHidden:", 1);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
      objc_msgSend(v4, "setHidden:", 1);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
      objc_msgSend(v5, "setHidden:", 1);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell noButtonLeadingConstraint](self, "noButtonLeadingConstraint"));
      objc_msgSend(v6, "setActive:", 1);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonLeadingConstraint](self, "goButtonLeadingConstraint"));
      objc_msgSend(v7, "setActive:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonLeadingConstraint](self, "stepsButtonLeadingConstraint"));
      objc_msgSend(v8, "setActive:", 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButtonLeadingConstraint](self, "bookButtonLeadingConstraint"));
      objc_msgSend(v9, "setActive:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonWidthConstraint](self, "goButtonWidthConstraint"));
      objc_msgSend(v10, "setConstant:", 0.0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonMinWidthConstraint](self, "stepsButtonMinWidthConstraint"));
      objc_msgSend(v11, "setConstant:", 0.0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonMaxWidthConstraint](self, "stepsButtonMaxWidthConstraint"));
      objc_msgSend(v12, "setConstant:", 0.0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToPrimaryButtonLeadingPaddingConstraint](self, "labelTrailingToPrimaryButtonLeadingPaddingConstraint"));
      v37 = v13;
      v14 = 0;
      goto LABEL_7;
    case 1uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
      objc_msgSend(v15, "setHidden:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
      objc_msgSend(v16, "setHidden:", 1);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
      objc_msgSend(v17, "setHidden:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell noButtonLeadingConstraint](self, "noButtonLeadingConstraint"));
      objc_msgSend(v18, "setActive:", 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonLeadingConstraint](self, "goButtonLeadingConstraint"));
      objc_msgSend(v19, "setActive:", 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonLeadingConstraint](self, "stepsButtonLeadingConstraint"));
      objc_msgSend(v20, "setActive:", 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButtonLeadingConstraint](self, "bookButtonLeadingConstraint"));
      objc_msgSend(v21, "setActive:", 0);

      -[RouteOverviewCell _updateGoButtonWidthConstraint](self, "_updateGoButtonWidthConstraint");
      goto LABEL_6;
    case 2uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell noButtonLeadingConstraint](self, "noButtonLeadingConstraint"));
      objc_msgSend(v22, "setActive:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonLeadingConstraint](self, "goButtonLeadingConstraint"));
      objc_msgSend(v23, "setActive:", 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonLeadingConstraint](self, "stepsButtonLeadingConstraint"));
      objc_msgSend(v24, "setActive:", 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButtonLeadingConstraint](self, "bookButtonLeadingConstraint"));
      objc_msgSend(v25, "setActive:", 1);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonWidthConstraint](self, "goButtonWidthConstraint"));
      objc_msgSend(v26, "setConstant:", 0.0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
      objc_msgSend(v27, "setHidden:", 1);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
      objc_msgSend(v28, "setHidden:", 1);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
      objc_msgSend(v29, "setHidden:", 0);

      goto LABEL_6;
    case 3uLL:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
      objc_msgSend(v30, "setHidden:", 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButton](self, "stepsButton"));
      objc_msgSend(v31, "setHidden:", 0);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
      objc_msgSend(v32, "setHidden:", 1);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell noButtonLeadingConstraint](self, "noButtonLeadingConstraint"));
      objc_msgSend(v33, "setActive:", 0);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonLeadingConstraint](self, "goButtonLeadingConstraint"));
      objc_msgSend(v34, "setActive:", 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell stepsButtonLeadingConstraint](self, "stepsButtonLeadingConstraint"));
      objc_msgSend(v35, "setActive:", 1);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButtonLeadingConstraint](self, "bookButtonLeadingConstraint"));
      objc_msgSend(v36, "setActive:", 0);

      -[RouteOverviewCell _updateGoButtonWidthConstraint](self, "_updateGoButtonWidthConstraint");
      -[RouteOverviewCell _updateStepsButtonWidthConstraint](self, "_updateStepsButtonWidthConstraint");
LABEL_6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToPrimaryButtonLeadingPaddingConstraint](self, "labelTrailingToPrimaryButtonLeadingPaddingConstraint"));
      v37 = v13;
      v14 = 1;
LABEL_7:
      objc_msgSend(v13, "setActive:", v14);

      break;
    default:
      return;
  }
}

- (void)setBookButtonTitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedUppercaseString"));
    objc_msgSend(v4, "setTitle:forState:", v5, 0);

  }
  else
  {
    -[RouteOverviewCell _resetBookButtonTitle](self, "_resetBookButtonTitle");
  }

}

- (double)goButtonProgress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (BOOL)isGoButtonProgressVisible
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  v3 = objc_msgSend(v2, "progressBarHidden") ^ 1;

  return v3;
}

- (void)setGoButtonProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (void)setGoButtonProgressVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
  objc_msgSend(v4, "setProgressBarHidden:", v3);

}

- (void)_reloadElevationChart
{
  DirectionsElevationGraphView *elevationGraphView;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  -[DirectionsElevationGraphView removeFromSuperview](self->_elevationGraphView, "removeFromSuperview");
  elevationGraphView = self->_elevationGraphView;
  self->_elevationGraphView = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
  objc_msgSend(v4, "addSubview:", v5);

  v6 = !self->_elevationGraphViewVisible;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
  objc_msgSend(v7, "setHidden:", v6);

  -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_resetBookButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell bookButton](self, "bookButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Book [Route Planning]"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedUppercaseString"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (void)_updateGoButtonWidthConstraint
{
  void *v3;
  void *v4;
  id v5;
  uint64_t (**v6)(void);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  UIFont *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  NSAttributedStringKey v24;
  void *v25;

  if (self->_buttonVisibility == 1)
  {
    if (qword_1014D45B8 != -1)
      dispatch_once(&qword_1014D45B8, &stru_1011EA5E8);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressButton titleLabel](self->_goButton, "titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

    v5 = objc_msgSend((id)objc_opt_class(self), "goButtonFontProvider");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v5);
    v7 = v6[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    objc_msgSend(v8, "pointSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%f"), v4, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D45B0, "objectForKey:", v10));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v14 = v13;
    }
    else
    {
      v24 = NSFontAttributeName;
      v15 = sub_100BA5494(&stru_1011E7BB8);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v25 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      objc_msgSend(v4, "sizeWithAttributes:", v17);
      v19 = v18;

      v20 = v19 + 12.0;
      if (v19 + 12.0 > 72.0)
        v20 = 72.0;
      if (v20 >= 64.0)
        v14 = v20;
      else
        v14 = 64.0;
      v21 = (void *)qword_1014D45B0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
      objc_msgSend(v21, "setObject:forKey:", v22, v10);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButtonWidthConstraint](self, "goButtonWidthConstraint"));
    objc_msgSend(v23, "setConstant:", v14);

  }
}

- (void)_updateStepsButtonWidthConstraint
{
  if (self->_buttonVisibility == 3)
  {
    -[NSLayoutConstraint setConstant:](self->_stepsButtonMinWidthConstraint, "setConstant:", 64.0);
    -[NSLayoutConstraint setConstant:](self->_stepsButtonMaxWidthConstraint, "setConstant:", 80.0);
  }
}

- (void)setDetailsButtonVisible:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_detailsButtonVisible != a3)
  {
    v3 = a3;
    self->_detailsButtonVisible = a3;
    -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
    -[UIButton setHidden:](self->_detailsButton, "setHidden:", !v3);
    -[RouteOverviewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setHasSelectedStep:(BOOL)a3
{
  if (self->_hasSelectedStep != a3)
  {
    self->_hasSelectedStep = a3;
    -[RouteOverviewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)setSelectionBackgroundVisible:(BOOL)a3
{
  if (self->_selectionBackgroundVisible != a3)
  {
    self->_selectionBackgroundVisible = a3;
    -[RouteOverviewCell _updateColorsForSelection](self, "_updateColorsForSelection");
    -[RouteOverviewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)setOverrideCellGrouping:(int64_t)a3
{
  if (self->_overrideCellGrouping != a3)
  {
    self->_overrideCellGrouping = a3;
    -[RouteOverviewCell _setBackgroundViewConfigurationGrouping:](self, "_setBackgroundViewConfigurationGrouping:", -[RouteOverviewCell _resolvedGrouping](self, "_resolvedGrouping"));
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteOverviewCell;
  -[RouteOverviewCell setHighlighted:](&v4, "setHighlighted:", a3);
  -[RouteOverviewCell _updateColorsForSelection](self, "_updateColorsForSelection");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  RouteOverviewCell *v7;
  RouteOverviewCell *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteOverviewCell;
  -[RouteOverviewCell didUpdateFocusInContext:withAnimationCoordinator:](&v11, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (RouteOverviewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedView"));
  if (v7 == self
    || (v8 = (RouteOverviewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView")), v8 == self))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView"));

    if (v7 != self)
    if (v9 != v10)
      -[RouteOverviewCell _updateColorsForSelection](self, "_updateColorsForSelection");
  }
  else
  {

  }
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "_didTapPrimaryActionButton:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[RouteOverviewCell isArtworkListVisible](self, "isArtworkListVisible"))
  {
    -[RouteOverviewCell bounds](self, "bounds");
    -[RouteOverviewCell setBounds:](self, "setBounds:");
  }
  -[RouteOverviewCell layoutIfNeeded](self, "layoutIfNeeded");
  v14.receiver = self;
  v14.super_class = (Class)RouteOverviewCell;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[RouteOverviewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCell;
  -[RouteOverviewCell updateConstraints](&v3, "updateConstraints");
  -[RouteOverviewCell _updateConstraintsForArtworkListVisible:elevationGraphViewVisible:advisoriesViewVisible:tertiaryLabelVisible:detailsButtonVisible:](self, "_updateConstraintsForArtworkListVisible:elevationGraphViewVisible:advisoriesViewVisible:tertiaryLabelVisible:detailsButtonVisible:", -[RouteOverviewCell isArtworkListVisible](self, "isArtworkListVisible"), -[RouteOverviewCell isElevationGraphViewVisible](self, "isElevationGraphViewVisible"), -[RouteOverviewCell isAdvisoriesViewVisible](self, "isAdvisoriesViewVisible"), -[RouteOverviewCell isTertiaryLabelVisible](self, "isTertiaryLabelVisible"), -[RouteOverviewCell isDetailsButtonVisible](self, "isDetailsButtonVisible"));
}

- (void)_updateConstraintsForArtworkListVisible:(BOOL)a3 elevationGraphViewVisible:(BOOL)a4 advisoriesViewVisible:(BOOL)a5 tertiaryLabelVisible:(BOOL)a6 detailsButtonVisible:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  uint64_t v41;
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
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  unint64_t v142;
  int v143;
  _BOOL4 v144;
  int v145;
  id v146;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v13 = MKPlaceCollectionsLogicController_ptr;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabelConstraints](self, "tertiaryLabelConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkListConstraints](self, "artworkListConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphViewConstraints](self, "elevationGraphViewConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButtonConstraints](self, "detailsButtonConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesViewConstraints](self, "advisoriesViewConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentBottomConstraint](self, "contentBottomConstraint"));
  objc_msgSend(v19, "setActive:", 0);

  v146 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = sub_1002A8AA0(self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell secondaryLabel](self, "secondaryLabel"));
  v22 = v21;
  if (v20 == 5)
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastBaselineAnchor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v24 = (void *)v23;

  v142 = __PAIR64__(v7, v10);
  if (v8)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabel](self, "tertiaryLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    objc_msgSend(v25, "addObject:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabel](self, "tertiaryLabel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
    objc_msgSend(v25, "addObject:", v35);

    v13 = MKPlaceCollectionsLogicController_ptr;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabel](self, "tertiaryLabel"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v24));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v38, &stru_1011E7A78, 0.0));
    objc_msgSend(v25, "addObject:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabel](self, "tertiaryLabel"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));

    -[RouteOverviewCell setTertiaryLabelConstraints:](self, "setTertiaryLabelConstraints:", v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell tertiaryLabelConstraints](self, "tertiaryLabelConstraints"));
    objc_msgSend(v146, "addObjectsFromArray:", v42);

    v24 = (void *)v41;
    if (!v11)
    {
LABEL_6:
      -[RouteOverviewCell setArtworkListConstraints:](self, "setArtworkListConstraints:", 0, v142);
      goto LABEL_9;
    }
  }
  else
  {
    -[RouteOverviewCell setTertiaryLabelConstraints:](self, "setTertiaryLabelConstraints:", 0);
    if (!v11)
      goto LABEL_6;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v142));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkList](self, "artworkList"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v47));
  objc_msgSend(v43, "addObject:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkList](self, "artworkList"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
  objc_msgSend(v43, "addObject:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkList](self, "artworkList"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v24, 10.0));
  objc_msgSend(v43, "addObject:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkList](self, "artworkList"));
  v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));

  -[RouteOverviewCell setArtworkListConstraints:](self, "setArtworkListConstraints:", v43);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell artworkListConstraints](self, "artworkListConstraints"));
  objc_msgSend(v146, "addObjectsFromArray:", v59);

  v24 = (void *)v58;
LABEL_9:
  if (v143)
  {
    v144 = v9;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v64));
    objc_msgSend(v60, "addObject:", v65);

    v66 = sub_1002A8AA0(self);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
    v68 = v67;
    if (v66 == 5)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));
      objc_msgSend(v60, "addObject:", v72);

    }
    else
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "widthAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", 80.0));
      objc_msgSend(v60, "addObject:", v70);
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v24, 10.0));
    objc_msgSend(v60, "addObject:", v75);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "heightAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:", 25.0));
    objc_msgSend(v60, "addObject:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphView](self, "elevationGraphView"));
    v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "bottomAnchor"));

    -[RouteOverviewCell setElevationGraphViewConstraints:](self, "setElevationGraphViewConstraints:", v60);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell elevationGraphViewConstraints](self, "elevationGraphViewConstraints"));
    objc_msgSend(v146, "addObjectsFromArray:", v81);

    v24 = (void *)v80;
    if (v144)
    {
LABEL_17:
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesView](self, "advisoriesView"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v86));
      objc_msgSend(v82, "addObject:", v87);

      v88 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
      v89 = objc_msgSend(v88, "userInterfaceIdiom");

      v90 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesView](self, "advisoriesView"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "trailingAnchor"));
      if (v89 == (id)5)
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
        v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "trailingAnchor"));
      }
      else
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
        v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "leadingAnchor"));
      }
      v94 = (void *)v93;
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v93));
      objc_msgSend(v82, "addObject:", v95);

      if (sub_1002A8AA0(self) == 5)
        v96 = 10.0;
      else
        v96 = 6.0;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesView](self, "advisoriesView"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:constant:", v24, v96));
      objc_msgSend(v82, "addObject:", v99);

      v100 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesView](self, "advisoriesView"));
      v101 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "bottomAnchor"));

      -[RouteOverviewCell setAdvisoriesViewConstraints:](self, "setAdvisoriesViewConstraints:", v82);
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell advisoriesViewConstraints](self, "advisoriesViewConstraints"));
      objc_msgSend(v146, "addObjectsFromArray:", v102);

      v24 = (void *)v101;
      if (v145)
        goto LABEL_24;
LABEL_14:
      -[RouteOverviewCell setDetailsButtonConstraints:](self, "setDetailsButtonConstraints:", 0);
      goto LABEL_28;
    }
  }
  else
  {
    -[RouteOverviewCell setElevationGraphViewConstraints:](self, "setElevationGraphViewConstraints:", 0);
    if (v9)
      goto LABEL_17;
  }
  -[RouteOverviewCell setAdvisoriesViewConstraints:](self, "setAdvisoriesViewConstraints:", 0);
  if (!v145)
    goto LABEL_14;
LABEL_24:
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell traitCollection](self, "traitCollection"));
  v105 = objc_msgSend(v104, "userInterfaceIdiom");

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "leadingAnchor"));
  if (v105 == (id)5)
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell labelTrailingToGoButtonLeadingLayoutGuide](self, "labelTrailingToGoButtonLeadingLayoutGuide"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "leadingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintGreaterThanOrEqualToAnchor:", v109));
    objc_msgSend(v103, "addObject:", v110);

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "trailingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v114));
    objc_msgSend(v103, "addObject:", v115);

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "firstBaselineAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v118));
    objc_msgSend(v103, "addObject:", v119);

  }
  else
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "leadingAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v121));
    objc_msgSend(v103, "addObject:", v122);

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "trailingAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "trailingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintLessThanOrEqualToAnchor:", v126));
    objc_msgSend(v103, "addObject:", v127);

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "topAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell goButton](self, "goButton"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "bottomAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintGreaterThanOrEqualToAnchor:", v131));
    objc_msgSend(v103, "addObject:", v132);

    v133 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "firstBaselineAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintGreaterThanOrEqualToAnchor:", v24));
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v135, &stru_1011E7A78, 32.0));
    objc_msgSend(v103, "addObject:", v136);

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButton](self, "detailsButton"));
    v117 = v24;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "lastBaselineAnchor"));
  }

  -[RouteOverviewCell setDetailsButtonConstraints:](self, "setDetailsButtonConstraints:", v103);
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell detailsButtonConstraints](self, "detailsButtonConstraints"));
  objc_msgSend(v146, "addObjectsFromArray:", v137);

LABEL_28:
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentGuide](self, "contentGuide"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "bottomAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v24));
  -[RouteOverviewCell setContentBottomConstraint:](self, "setContentBottomConstraint:", v140);

  v141 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell contentBottomConstraint](self, "contentBottomConstraint"));
  objc_msgSend(v146, "addObject:", v141);

  objc_msgSend(v13[348], "activateConstraints:", v146);
}

- (void)_updateColorsForSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RouteAdvisoriesView *advisoriesView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (sub_1002A8AA0(self) == 5
    && (-[RouteOverviewCell isSelectionBackgroundVisible](self, "isSelectionBackgroundVisible")
     || (-[RouteOverviewCell isHighlighted](self, "isHighlighted") & 1) != 0
     || -[RouteOverviewCell isFocused](self, "isFocused")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UIButton setTintColor:](self->_detailsButton, "setTintColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[MapsThemeMultiPartLabel setTextColor:](self->_secondaryLabel, "setTextColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UILabel setTextColor:](self->_tertiaryLabel, "setTextColor:", v6);

    advisoriesView = self->_advisoriesView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[RouteAdvisoriesView setOverrideTextColor:isSelected:](advisoriesView, "setOverrideTextColor:isSelected:", v8, 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[TransitArtworkListView setOverrideTintColor:](self->_artworkList, "setOverrideTintColor:", v9);

    -[DirectionsElevationGraphView setSelected:](self->_elevationGraphView, "setSelected:", 1);
  }
  else
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      -[UIButton setTintColor:](self->_detailsButton, "setTintColor:", v10);

      -[TransitArtworkListView setOverrideTintColor:](self->_artworkList, "setOverrideTintColor:", 0);
      -[DirectionsElevationGraphView setSelected:](self->_elevationGraphView, "setSelected:", 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeMultiPartLabel setTextColor:](self->_secondaryLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_tertiaryLabel, "setTextColor:", v13);

    -[RouteAdvisoriesView setOverrideTextColor:isSelected:](self->_advisoriesView, "setOverrideTextColor:isSelected:", 0, 0);
  }
}

- (void)_didTapPrimaryActionButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "didTapGoButtonForRouteOverviewCell:", self);

}

- (void)_didTapDetailsButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "didTapDetailsButtonForRouteOverviewCell:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate"));
    objc_msgSend(v6, "didTapDetailsButtonForRouteOverviewCell:", self);

  }
}

- (void)_didTapAutomaticSharingButton
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "didTapAutomaticSharingButtonForRouteOverviewCell:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewCell delegate](self, "delegate"));
    objc_msgSend(v5, "didTapAutomaticSharingButtonForRouteOverviewCell:", self);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCell;
  -[RouteOverviewCell prepareForReuse](&v3, "prepareForReuse");
  -[RouteOverviewCell setSelectionBackgroundVisible:](self, "setSelectionBackgroundVisible:", 0);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (MapsThemeMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (BOOL)isTertiaryLabelVisible
{
  return self->_tertiaryLabelVisible;
}

- (BOOL)isArtworkListVisible
{
  return self->_artworkListVisible;
}

- (BOOL)isElevationGraphViewVisible
{
  return self->_elevationGraphViewVisible;
}

- (BOOL)isDetailsButtonVisible
{
  return self->_detailsButtonVisible;
}

- (BOOL)isSelectionBackgroundVisible
{
  return self->_selectionBackgroundVisible;
}

- (unint64_t)buttonVisibility
{
  return self->_buttonVisibility;
}

- (BOOL)isAdvisoriesViewVisible
{
  return self->_advisoriesViewVisible;
}

- (int64_t)overrideCellGrouping
{
  return self->_overrideCellGrouping;
}

- (BOOL)detailsButtonRotated
{
  return self->_detailsButtonRotated;
}

- (RouteOverviewCellDelegate)delegate
{
  return (RouteOverviewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasSelectedStep
{
  return self->_hasSelectedStep;
}

- (MapsProgressButton)goButton
{
  return self->_goButton;
}

- (UIButton)stepsButton
{
  return self->_stepsButton;
}

- (BackgroundColorButton)bookButton
{
  return self->_bookButton;
}

- (UIImageView)primaryLabelCompanionImageView
{
  return self->_primaryLabelCompanionImageView;
}

- (void)setDetailsButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailsButton, a3);
}

- (UILayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (void)setContentGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentGuide, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentTopConstraint, a3);
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentBottomConstraint, a3);
}

- (NSLayoutConstraint)goButtonWidthConstraint
{
  return self->_goButtonWidthConstraint;
}

- (void)setGoButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_goButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)goButtonHeightConstraint
{
  return self->_goButtonHeightConstraint;
}

- (void)setGoButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_goButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)stepsButtonMinWidthConstraint
{
  return self->_stepsButtonMinWidthConstraint;
}

- (void)setStepsButtonMinWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stepsButtonMinWidthConstraint, a3);
}

- (NSLayoutConstraint)stepsButtonMaxWidthConstraint
{
  return self->_stepsButtonMaxWidthConstraint;
}

- (void)setStepsButtonMaxWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stepsButtonMaxWidthConstraint, a3);
}

- (NSLayoutConstraint)stepsButtonHeightConstraint
{
  return self->_stepsButtonHeightConstraint;
}

- (void)setStepsButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stepsButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)labelTrailingToPrimaryButtonLeadingPaddingConstraint
{
  return self->_labelTrailingToPrimaryButtonLeadingPaddingConstraint;
}

- (void)setLabelTrailingToPrimaryButtonLeadingPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailingToPrimaryButtonLeadingPaddingConstraint, a3);
}

- (NSLayoutConstraint)primaryToSecondaryLabelConstraint
{
  return self->_primaryToSecondaryLabelConstraint;
}

- (void)setPrimaryToSecondaryLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelConstraint, a3);
}

- (NSLayoutConstraint)primaryCompanionImageToLabelPaddingConstraint
{
  return self->_primaryCompanionImageToLabelPaddingConstraint;
}

- (void)setPrimaryCompanionImageToLabelPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCompanionImageToLabelPaddingConstraint, a3);
}

- (NSLayoutConstraint)primaryCompanionImageWidthConstraint
{
  return self->_primaryCompanionImageWidthConstraint;
}

- (void)setPrimaryCompanionImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCompanionImageWidthConstraint, a3);
}

- (NSLayoutConstraint)noButtonLeadingConstraint
{
  return self->_noButtonLeadingConstraint;
}

- (void)setNoButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_noButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)goButtonLeadingConstraint
{
  return self->_goButtonLeadingConstraint;
}

- (void)setGoButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_goButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)stepsButtonLeadingConstraint
{
  return self->_stepsButtonLeadingConstraint;
}

- (void)setStepsButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stepsButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)bookButtonLeadingConstraint
{
  return self->_bookButtonLeadingConstraint;
}

- (void)setBookButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bookButtonLeadingConstraint, a3);
}

- (NSArray)tertiaryLabelConstraints
{
  return self->_tertiaryLabelConstraints;
}

- (void)setTertiaryLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabelConstraints, a3);
}

- (NSArray)artworkListConstraints
{
  return self->_artworkListConstraints;
}

- (void)setArtworkListConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_artworkListConstraints, a3);
}

- (NSArray)elevationGraphViewConstraints
{
  return self->_elevationGraphViewConstraints;
}

- (void)setElevationGraphViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_elevationGraphViewConstraints, a3);
}

- (NSArray)advisoriesViewConstraints
{
  return self->_advisoriesViewConstraints;
}

- (void)setAdvisoriesViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_advisoriesViewConstraints, a3);
}

- (NSArray)detailsButtonConstraints
{
  return self->_detailsButtonConstraints;
}

- (void)setDetailsButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_detailsButtonConstraints, a3);
}

- (UILayoutGuide)labelTrailingToGoButtonLeadingLayoutGuide
{
  return self->_labelTrailingToGoButtonLeadingLayoutGuide;
}

- (void)setLabelTrailingToGoButtonLeadingLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailingToGoButtonLeadingLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelTrailingToGoButtonLeadingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailsButtonConstraints, 0);
  objc_storeStrong((id *)&self->_advisoriesViewConstraints, 0);
  objc_storeStrong((id *)&self->_elevationGraphViewConstraints, 0);
  objc_storeStrong((id *)&self->_artworkListConstraints, 0);
  objc_storeStrong((id *)&self->_tertiaryLabelConstraints, 0);
  objc_storeStrong((id *)&self->_bookButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_noButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryCompanionImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_primaryCompanionImageToLabelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingToPrimaryButtonLeadingPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonMaxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stepsButtonMinWidthConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_goButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_primaryLabelCompanionImageView, 0);
  objc_storeStrong((id *)&self->_bookButton, 0);
  objc_storeStrong((id *)&self->_stepsButton, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_advisoriesView, 0);
  objc_storeStrong((id *)&self->_artworkList, 0);
  objc_storeStrong((id *)&self->_elevationGraphView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
}

@end
