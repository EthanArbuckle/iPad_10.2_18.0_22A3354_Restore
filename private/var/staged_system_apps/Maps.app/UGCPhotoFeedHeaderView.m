@implementation UGCPhotoFeedHeaderView

- (UGCPhotoFeedHeaderView)initWithOptions:(unint64_t)a3
{
  UGCPhotoFeedHeaderView *v4;
  UGCPhotoFeedHeaderView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCPhotoFeedHeaderView;
  v4 = -[UGCPhotoFeedHeaderView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    -[UGCPhotoFeedHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("PhotoFeedHeader"));
    -[UGCPhotoFeedHeaderView _setupSubviews](v5, "_setupSubviews");
    -[UGCPhotoFeedHeaderView _setupConstraints](v5, "_setupConstraints");
    -[UGCPhotoFeedHeaderView _updateForOptionsChange](v5, "_updateForOptionsChange");
  }
  return v5;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *placeNameLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *attributionLabel;
  void *v13;
  void *v14;
  UILayoutGuide *v15;
  UILayoutGuide *photoViewerDescriptionLayoutGuide;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  UIButton *floatingDoneButton;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  UIButton *v32;
  UIButton *floatingAddButton;
  void *v34;
  double v35;
  double v36;
  UIStackView *v37;
  UIStackView *floatingButtonsStackView;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id location[2];

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  placeNameLabel = self->_placeNameLabel;
  self->_placeNameLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_placeNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapkit_fontWithWeight:", UIFontWeightBold));
  -[UILabel setFont:](self->_placeNameLabel, "setFont:", v10);

  -[UILabel setNumberOfLines:](self->_placeNameLabel, "setNumberOfLines:", 0);
  -[UILabel setUserInteractionEnabled:](self->_placeNameLabel, "setUserInteractionEnabled:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_placeNameLabel, "setAccessibilityIdentifier:", CFSTR("PlaceNameLabel"));
  -[UILabel setOverrideUserInterfaceStyle:](self->_placeNameLabel, "setOverrideUserInterfaceStyle:", 2);
  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_mapkit_fontWithWeight:", UIFontWeightSemibold));
  -[UILabel setFont:](self->_attributionLabel, "setFont:", v14);

  -[UILabel setNumberOfLines:](self->_attributionLabel, "setNumberOfLines:", 0);
  -[UILabel setUserInteractionEnabled:](self->_attributionLabel, "setUserInteractionEnabled:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_attributionLabel, "setAccessibilityIdentifier:", CFSTR("AttributionLabel"));
  -[UILabel setOverrideUserInterfaceStyle:](self->_attributionLabel, "setOverrideUserInterfaceStyle:", 2);
  v15 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  photoViewerDescriptionLayoutGuide = self->_photoViewerDescriptionLayoutGuide;
  self->_photoViewerDescriptionLayoutGuide = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "background"));
  objc_msgSend(v19, "setVisualEffect:", v18);

  objc_msgSend(v17, "setCornerStyle:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v17, "setBaseForegroundColor:", v20);

  v21 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
  floatingDoneButton = self->_floatingDoneButton;
  self->_floatingDoneButton = v21;

  v39 = v17;
  -[UIButton setConfiguration:](self->_floatingDoneButton, "setConfiguration:", v17);
  -[UIButton setAccessibilityIdentifier:](self->_floatingDoneButton, "setAccessibilityIdentifier:", CFSTR("DoneButton"));
  -[UIButton _setTouchInsets:](self->_floatingDoneButton, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_floatingDoneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_floatingDoneButton, "addTarget:action:forControlEvents:", self, "_doneButtonPressed", 64);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "background"));
  objc_msgSend(v25, "setVisualEffect:", v24);

  objc_msgSend(v23, "setCornerStyle:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v23, "setBaseForegroundColor:", v26);

  objc_msgSend(v23, "setImagePadding:", 4.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView traitCollection](self, "traitCollection"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Add Photo [UGC]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v23, "setTitle:", v30);

  objc_initWeak(location, self);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100A3E6E8;
  v44[3] = &unk_1011E07A0;
  objc_copyWeak(&v46, location);
  v31 = v28;
  v45 = v31;
  objc_msgSend(v23, "setTitleTextAttributesTransformer:", v44);
  v32 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  floatingAddButton = self->_floatingAddButton;
  self->_floatingAddButton = v32;

  -[UIButton setConfiguration:](self->_floatingAddButton, "setConfiguration:", v23);
  -[UIButton addTarget:action:forControlEvents:](self->_floatingAddButton, "addTarget:action:forControlEvents:", self, "_addButtonPressed", 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_floatingAddButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_floatingAddButton, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setPreferredMenuElementOrder:](self->_floatingAddButton, "setPreferredMenuElementOrder:", 2);
  -[UIButton setAccessibilityIdentifier:](self->_floatingAddButton, "setAccessibilityIdentifier:", CFSTR("AddButton"));
  -[UIButton _setTouchInsets:](self->_floatingAddButton, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100A3E7EC;
  v42[3] = &unk_1011AD260;
  objc_copyWeak(&v43, location);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100A3E820;
  v40[3] = &unk_1011AD260;
  objc_copyWeak(&v41, location);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v42, v40));
  -[UIButton setMenu:](self->_floatingAddButton, "setMenu:", v34);

  -[UIButton addTarget:action:forControlEvents:](self->_floatingAddButton, "addTarget:action:forControlEvents:", self, "_addPhoto", 0x4000);
  LODWORD(v35) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_floatingAddButton, "setContentCompressionResistancePriority:forAxis:", 0, v35);
  LODWORD(v36) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_floatingAddButton, "setContentHuggingPriority:forAxis:", 0, v36);
  v37 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  floatingButtonsStackView = self->_floatingButtonsStackView;
  self->_floatingButtonsStackView = v37;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_floatingButtonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_floatingButtonsStackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_floatingButtonsStackView, "setSpacing:", 12.0);
  -[UIStackView _setTouchInsets:](self->_floatingButtonsStackView, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  -[UIStackView addArrangedSubview:](self->_floatingButtonsStackView, "addArrangedSubview:", self->_floatingAddButton);
  -[UIStackView addArrangedSubview:](self->_floatingButtonsStackView, "addArrangedSubview:", self->_floatingDoneButton);
  -[UGCPhotoFeedHeaderView addSubview:](self, "addSubview:", self->_floatingButtonsStackView);
  -[UGCPhotoFeedHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_photoViewerDescriptionLayoutGuide);
  -[UGCPhotoFeedHeaderView addSubview:](self, "addSubview:", self->_placeNameLabel);
  -[UGCPhotoFeedHeaderView addSubview:](self, "addSubview:", self->_attributionLabel);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);

}

- (void)_doneButtonPressed
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)MUPresentationOptions);
  objc_msgSend(v4, "setSourceView:", self->_floatingDoneButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView delegate](self, "delegate"));
  objc_msgSend(v3, "photoFeedHeaderView:selectedDoneWithPresentationOptions:", self, v4);

}

- (void)_addButtonPressed
{
  -[UGCPhotoFeedHeaderView _addPhotosWithEntryPoint:](self, "_addPhotosWithEntryPoint:", 2);
}

- (void)_addPhotosWithEntryPoint:(int64_t)a3
{
  void *v5;
  id v6;

  v6 = objc_alloc_init((Class)MUPresentationOptions);
  objc_msgSend(v6, "setSourceView:", self->_floatingAddButton);
  objc_msgSend(v6, "setProgressObserver:", self->_floatingAddButton);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView delegate](self, "delegate"));
  objc_msgSend(v5, "photoFeedHeaderView:selectedAddPhotoWithEntryPoint:usingPresentationOptions:", self, a3, v6);

}

- (void)_addPhoto
{
  id v3;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2147, 612, 0);
  v3 = +[MUPhotoOptionsMenuButton preferredEntryPoint](MUPhotoOptionsMenuButton, "preferredEntryPoint");
  if (v3)
    -[UGCPhotoFeedHeaderView _addPhotosWithEntryPoint:](self, "_addPhotosWithEntryPoint:", v3);
}

- (BOOL)shouldShowAddPhotoButton
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)shouldShowDoneButton
{
  return self->_options & 1;
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
  id v13;
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
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[18];

  v63 = objc_alloc_init((Class)NSMutableArray);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_placeNameLabel, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_photoViewerDescriptionLayoutGuide, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v64[0] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_placeNameLabel, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_photoViewerDescriptionLayoutGuide, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v58));
  v64[1] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_placeNameLabel, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_photoViewerDescriptionLayoutGuide, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v64[2] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_placeNameLabel, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_attributionLabel, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -4.0));
  v64[3] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_attributionLabel, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_photoViewerDescriptionLayoutGuide, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v64[4] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_attributionLabel, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_photoViewerDescriptionLayoutGuide, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v46));
  v64[5] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_attributionLabel, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_photoViewerDescriptionLayoutGuide, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v64[6] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_photoViewerDescriptionLayoutGuide, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v64[7] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_photoViewerDescriptionLayoutGuide, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v64[8] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_photoViewerDescriptionLayoutGuide, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView bottomAnchor](self, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", v32, -16.0));
  v64[9] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_floatingDoneButton, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v64[10] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_floatingDoneButton, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v64[11] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_floatingDoneButton, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 30.0));
  v64[12] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_floatingDoneButton, "heightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 30.0));
  v64[13] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_floatingButtonsStackView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_photoViewerDescriptionLayoutGuide, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 8.0));
  v64[14] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_floatingButtonsStackView, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v3));
  v64[15] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_floatingButtonsStackView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v64[16] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_floatingAddButton, "heightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_floatingDoneButton, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v64[17] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 18));
  objc_msgSend(v63, "addObjectsFromArray:", v12);

  v13 = objc_msgSend(v63, "copy");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)setTitleModel:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UGCPhotoFeedHeaderTitleModel isEqual:](self->_titleModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_titleModel, a3);
    -[UGCPhotoFeedHeaderView _updateTitleText](self, "_updateTitleText");
  }

}

- (void)_updateTitleText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderTitleModel titleText](self->_titleModel, "titleText"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v27[0] = NSFontAttributeName;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapkit_fontWithWeight:", UIFontWeightBold));
    v28[0] = v6;
    v27[1] = NSForegroundColorAttributeName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v28[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

    if (-[UGCPhotoFeedHeaderTitleModel showPunchoutSymbol](self->_titleModel, "showPunchoutSymbol"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@ %@ [Badge format]"), CFSTR("localized string not found"), 0));

      v25 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v10);
      v11 = objc_alloc_init((Class)NSTextAttachment);
      v26 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.right.square.fill")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_mapkit_fontWithWeight:", UIFontWeightBold));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v14, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithRenderingMode:", 2));
      objc_msgSend(v11, "setImage:", v17);

      v8 = v26;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v11));
      v19 = objc_alloc((Class)NSAttributedString);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderTitleModel titleText](self->_titleModel, "titleText"));
      v21 = objc_msgSend(v19, "initWithString:", v20);

      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v25, v21, v18));
    }
    else
    {
      v23 = objc_alloc((Class)NSMutableAttributedString);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderTitleModel titleText](self->_titleModel, "titleText"));
      v22 = objc_msgSend(v23, "initWithString:attributes:", v10, v8);
    }

    objc_msgSend(v22, "addAttributes:range:", v8, 0, objc_msgSend(v22, "length"));
    v24 = objc_msgSend(v22, "copy");
    -[UILabel setAttributedText:](self->_placeNameLabel, "setAttributedText:", v24);

  }
  else
  {
    -[UILabel setAttributedText:](self->_placeNameLabel, "setAttributedText:", 0);
  }
}

- (id)titleText
{
  return -[UILabel text](self->_placeNameLabel, "text");
}

- (void)setSubtitleText:(id)a3
{
  -[UILabel setText:](self->_attributionLabel, "setText:", a3);
}

- (NSString)subtitleText
{
  return -[UILabel text](self->_attributionLabel, "text");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView subviews](self, "subviews", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "isUserInteractionEnabled"))
        {
          if ((objc_msgSend(v14, "isHidden") & 1) == 0)
          {
            objc_msgSend(v14, "alpha");
            if (v15 >= 0.01)
            {
              objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
              v17 = v16;
              v19 = v18;
              if (objc_msgSend(v14, "pointInside:withEvent:", v7))
              {
                v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hitTest:withEvent:", v7, v17, v19));
                if (v20)
                {
                  v21 = (void *)v20;
                  goto LABEL_15;
                }
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
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
  v9.super_class = (Class)UGCPhotoFeedHeaderView;
  v4 = a3;
  -[UGCPhotoFeedHeaderView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[UGCPhotoFeedHeaderView _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView traitCollection](self, "traitCollection"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapkit_fontWithWeight:", UIFontWeightBold));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v10));
  -[UILabel setFont:](self->_placeNameLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapkit_fontWithWeight:", UIFontWeightSemibold));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v10));
  -[UILabel setFont:](self->_attributionLabel, "setFont:", v9);

}

- (double)heightForUnscaledHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapkit_fontWithWeight:", UIFontWeightBold));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5));

  objc_msgSend(v8, "_scaledValueForValue:", a3);
  v10 = v9;

  return v10;
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[UGCPhotoFeedHeaderView _updateForOptionsChange](self, "_updateForOptionsChange");
  }
}

- (void)_updateForOptionsChange
{
  -[UIButton setHidden:](self->_floatingDoneButton, "setHidden:", -[UGCPhotoFeedHeaderView shouldShowDoneButton](self, "shouldShowDoneButton") ^ 1);
  -[UIButton setHidden:](self->_floatingAddButton, "setHidden:", -[UGCPhotoFeedHeaderView shouldShowAddPhotoButton](self, "shouldShowAddPhotoButton") ^ 1);
}

- (UGCPhotoFeedHeaderTitleModel)titleModel
{
  return self->_titleModel;
}

- (unint64_t)options
{
  return self->_options;
}

- (UGCPhotoFeedHeaderViewDelegate)delegate
{
  return (UGCPhotoFeedHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleModel, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_placeNameLabel, 0);
  objc_storeStrong((id *)&self->_photoViewerDescriptionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_floatingButtonsStackView, 0);
  objc_storeStrong((id *)&self->_floatingAddButton, 0);
  objc_storeStrong((id *)&self->_floatingDoneButton, 0);
}

@end
