@implementation UGCPhotoCreditSectionHeaderView

- (UGCPhotoCreditSectionHeaderView)initWithFrame:(CGRect)a3
{
  UGCPhotoCreditSectionHeaderView *v3;
  UGCPhotoCreditSectionHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCPhotoCreditSectionHeaderView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UGCPhotoCreditSectionHeaderView _setupView](v3, "_setupView");
  return v4;
}

- (void)_setupView
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *subtitleButton;
  UIButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MapsThemeButton *v20;
  MapsThemeButton *accessoryActionButton;
  double v22;
  double v23;
  void *v24;
  void *v25;
  MapsThemeButton *v26;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id location;
  _QWORD v75[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("UGCPhotoCreditSectionHeaderView"));

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Semibold](UIFont, "system15Semibold"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v11);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_titleLabel);

  v13 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  subtitleButton = self->_subtitleButton;
  self->_subtitleButton = v13;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = self->_subtitleButton;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTitleColor:forState:](v15, "setTitleColor:forState:", v16, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_subtitleButton, "titleLabel"));
  objc_msgSend(v18, "setFont:", v17);

  -[UIButton addTarget:action:forControlEvents:](self->_subtitleButton, "addTarget:action:forControlEvents:", self, "_didTapSubtitleActionButton", 0x2000);
  -[UIButton setAccessibilityIdentifier:](self->_subtitleButton, "setAccessibilityIdentifier:", CFSTR("SubtitleButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v19, "addSubview:", self->_subtitleButton);

  v20 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
  accessoryActionButton = self->_accessoryActionButton;
  self->_accessoryActionButton = v20;

  LODWORD(v22) = 1144750080;
  -[MapsThemeButton setContentHuggingPriority:forAxis:](self->_accessoryActionButton, "setContentHuggingPriority:forAxis:", 0, v22);
  -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryActionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeButton setPreferredMenuElementOrder:](self->_accessoryActionButton, "setPreferredMenuElementOrder:", 2);
  -[MapsThemeButton setShowsMenuAsPrimaryAction:](self->_accessoryActionButton, "setShowsMenuAsPrimaryAction:", 1);
  LODWORD(v23) = 1144750080;
  -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](self->_accessoryActionButton, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  -[MapsThemeButton setContentVerticalAlignment:](self->_accessoryActionButton, "setContentVerticalAlignment:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_accessoryActionButton, "titleLabel"));
  objc_msgSend(v25, "setFont:", v24);

  v26 = self->_accessoryActionButton;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[MapsThemeButton setTitleColor:forState:](v26, "setTitleColor:forState:", v27, 0);

  -[MapsThemeButton addTarget:action:forControlEvents:](self->_accessoryActionButton, "addTarget:action:forControlEvents:", self, "_didTapAccessoryActionButton", 0x2000);
  -[MapsThemeButton setAccessibilityIdentifier:](self->_accessoryActionButton, "setAccessibilityIdentifier:", CFSTR("AccessoryActionButton"));
  objc_initWeak(&location, self);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10047A6F0;
  v72[3] = &unk_1011AD260;
  objc_copyWeak(&v73, &location);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10047A724;
  v70[3] = &unk_1011AD260;
  objc_copyWeak(&v71, &location);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v72, v70));
  -[MapsThemeButton setMenu:](self->_accessoryActionButton, "setMenu:", v28);

  -[MapsThemeButton addTarget:action:forControlEvents:](self->_accessoryActionButton, "addTarget:action:forControlEvents:", self, "_captureAccessoryButtonTapEvent", 0x4000);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v29, "addSubview:", self->_accessoryActionButton);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "layoutMarginsGuide"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v75[0] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](self->_accessoryActionButton, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v63, -8.0));
  v75[1] = v62;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v75[2] = v58;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_subtitleButton, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "layoutMarginsGuide"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v75[3] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_subtitleButton, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](self->_accessoryActionButton, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:constant:", v51, -8.0));
  v75[4] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_subtitleButton, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v75[5] = v47;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_subtitleButton, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v75[6] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](self->_accessoryActionButton, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v75[7] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](self->_accessoryActionButton, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v34));
  v75[8] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton firstBaselineAnchor](self->_subtitleButton, "firstBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton firstBaselineAnchor](self->_accessoryActionButton, "firstBaselineAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  v75[9] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&location);
}

- (void)_didTapSubtitleActionButton
{
  void *v3;
  void (**v4)(void);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 340, 666, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCreditSectionHeaderView subtitleActionHandler](self, "subtitleActionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UGCPhotoCreditSectionHeaderView subtitleActionHandler](self, "subtitleActionHandler"));
    v4[2]();

  }
}

- (void)_didTapAccessoryActionButton
{
  -[UGCPhotoCreditSectionHeaderView _invokeSelectionWithSourceType:](self, "_invokeSelectionWithSourceType:", 2);
}

- (void)_captureAccessoryButtonTapEvent
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6102, 666, 0);
}

- (void)_invokeSelectionWithSourceType:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCreditSectionHeaderView photoSelectionHandler](self, "photoSelectionHandler"));

  if (v5)
  {
    v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue(-[UGCPhotoCreditSectionHeaderView photoSelectionHandler](self, "photoSelectionHandler"));
    v6[2](v6, a3);

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *title;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  v9 = v4;
  if (self->_title != v4 || (v6 = -[NSString isEqualToString:](v4, "isEqualToString:", v4), v5 = v9, (v6 & 1) == 0))
  {
    v7 = (NSString *)-[NSString copy](v5, "copy");
    title = self->_title;
    self->_title = v7;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    v5 = v9;
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *subtitle;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_subtitle != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v7;

      -[UIButton setTitle:forState:](self->_subtitleButton, "setTitle:forState:", self->_subtitle, 0);
      v5 = v9;
    }
  }

}

- (void)setSubtitleActionTitle:(id)a3 completionHandler:(id)a4
{
  UIButton *subtitleButton;
  id v7;

  subtitleButton = self->_subtitleButton;
  v7 = a4;
  -[UIButton setTitle:forState:](subtitleButton, "setTitle:forState:", a3, 0);
  -[UGCPhotoCreditSectionHeaderView setSubtitleActionHandler:](self, "setSubtitleActionHandler:", v7);

}

- (void)setAccessoryActionTitle:(id)a3 selectionHandler:(id)a4
{
  MapsThemeButton *accessoryActionButton;
  id v7;

  accessoryActionButton = self->_accessoryActionButton;
  v7 = a4;
  -[MapsThemeButton setTitle:forState:](accessoryActionButton, "setTitle:forState:", a3, 0);
  -[UGCPhotoCreditSectionHeaderView setPhotoSelectionHandler:](self, "setPhotoSelectionHandler:", v7);

}

- (BOOL)accessoryActionButtonEnabled
{
  return -[MapsThemeButton isEnabled](self->_accessoryActionButton, "isEnabled");
}

- (void)setAccessoryActionButtonEnabled:(BOOL)a3
{
  -[MapsThemeButton setEnabled:](self->_accessoryActionButton, "setEnabled:", a3);
}

+ (NSString)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(UGCPhotoCreditSectionHeaderView, a2);
  return NSStringFromClass(v2);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (id)subtitleActionHandler
{
  return self->_subtitleActionHandler;
}

- (void)setSubtitleActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)photoSelectionHandler
{
  return self->_photoSelectionHandler;
}

- (void)setPhotoSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_photoSelectionHandler, 0);
  objc_storeStrong(&self->_subtitleActionHandler, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessoryActionButton, 0);
  objc_storeStrong((id *)&self->_subtitleButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
