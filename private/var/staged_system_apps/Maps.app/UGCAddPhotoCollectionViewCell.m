@implementation UGCAddPhotoCollectionViewCell

- (UGCAddPhotoCollectionViewCell)initWithFrame:(CGRect)a3
{
  UGCAddPhotoCollectionViewCell *v3;
  UGCAddPhotoCollectionViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCAddPhotoCollectionViewCell;
  v3 = -[UGCAddPhotoCollectionViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCAddPhotoCollectionViewCell _setupSubviews](v3, "_setupSubviews");
    -[UGCAddPhotoCollectionViewCell _setupConstraints](v4, "_setupConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *cameraGlyphView;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  UILabel *v13;
  UILabel *cameraLabel;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *v21;
  UIView *containerView;
  UIView *v23;
  UIView *maskView;
  void *v25;
  void *v26;
  MUPhotoOptionsMenuButton *v27;
  MUPhotoOptionsMenuButton *menuButton;
  void *v29;
  void *v30;
  id v31;

  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.fill")));
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  cameraGlyphView = self->_cameraGlyphView;
  self->_cameraGlyphView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 21.0));
  -[UIImageView setPreferredSymbolConfiguration:](self->_cameraGlyphView, "setPreferredSymbolConfiguration:", v7);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_cameraGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_cameraGlyphView, "setContentMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor](MapsTheme, "ugcGlyphButtonViewUnselectedGlyphColor"));
  -[UIImageView setTintColor:](self->_cameraGlyphView, "setTintColor:", v8);

  v9 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = (UILabel *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  cameraLabel = self->_cameraLabel;
  self->_cameraLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_cameraLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_cameraLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_cameraLabel, "setNumberOfLines:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotoCollectionViewCell traitCollection](self, "traitCollection"));
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != (id)5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Add Photo [Report an Issue]"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_cameraLabel, "setText:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  -[UILabel setFont:](self->_cameraLabel, "setFont:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor](MapsTheme, "ugcGlyphButtonViewUnselectedGlyphColor"));
  -[UILabel setTextColor:](self->_cameraLabel, "setTextColor:", v20);

  v21 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerView = self->_containerView;
  self->_containerView = v21;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  maskView = self->_maskView;
  self->_maskView = v23;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_maskView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorWithAlphaComponent:", 0.5));
  -[UIView setBackgroundColor:](self->_maskView, "setBackgroundColor:", v26);

  -[UIView setHidden:](self->_maskView, "setHidden:", 1);
  v27 = (MUPhotoOptionsMenuButton *)objc_claimAutoreleasedReturnValue(+[MUPhotoOptionsMenuButton buttonWithDelegate:](MUPhotoOptionsMenuButton, "buttonWithDelegate:", self));
  menuButton = self->_menuButton;
  self->_menuButton = v27;

  -[MUPhotoOptionsMenuButton setTranslatesAutoresizingMaskIntoConstraints:](self->_menuButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPhotoOptionsMenuButton setUserInteractionEnabled:](self->_menuButton, "setUserInteractionEnabled:", self->_prefersMenu);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v29, "addSubview:", self->_containerView);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_cameraLabel);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_cameraGlyphView);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v30, "addSubview:", self->_maskView);

  v31 = (id)objc_claimAutoreleasedReturnValue(-[UGCAddPhotoCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v31, "addSubview:", self->_menuButton);

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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[23];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotoCollectionViewCell contentView](self, "contentView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_cameraLabel, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v75[0] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_cameraLabel, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v75[1] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_cameraGlyphView, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintGreaterThanOrEqualToAnchor:", v67));
  v75[2] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_cameraGlyphView, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v64));
  v75[3] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_cameraGlyphView, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v75[4] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_cameraGlyphView, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_cameraLabel, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -5.0));
  v75[5] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_cameraGlyphView, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v75[6] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_cameraLabel, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v75[7] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_cameraLabel, "lastBaselineAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v75[8] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v75[9] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_containerView, "centerYAnchor"));
  v4 = v3;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v75[10] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v75[11] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v75[12] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:", v34));
  v75[13] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v31));
  v75[14] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_maskView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v75[15] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_maskView, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v75[16] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_maskView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v75[17] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_maskView, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v75[18] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MUPhotoOptionsMenuButton leadingAnchor](self->_menuButton, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v75[19] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MUPhotoOptionsMenuButton trailingAnchor](self->_menuButton, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v5));
  v75[20] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MUPhotoOptionsMenuButton topAnchor](self->_menuButton, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v75[21] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MUPhotoOptionsMenuButton bottomAnchor](self->_menuButton, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v75[22] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 23));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)_contentSizeDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  -[UILabel setFont:](self->_cameraLabel, "setFont:", v3);

}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[UIView setHidden:](self->_maskView, "setHidden:", !a3);
    -[MUPhotoOptionsMenuButton setHidden:](self->_menuButton, "setHidden:", self->_dimmed);
  }
}

- (void)setPrefersMenu:(BOOL)a3
{
  if (self->_prefersMenu != a3)
  {
    self->_prefersMenu = a3;
    -[MUPhotoOptionsMenuButton setUserInteractionEnabled:](self->_menuButton, "setUserInteractionEnabled:");
  }
}

+ (id)reuseIdentifier
{
  return CFSTR("AddPhotosCollectionViewCell");
}

- (void)photoOptionsMenuButtonDidSelectTakePhoto
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoOptionsMenuButtonDidSelectTakePhoto");

}

- (void)photoOptionsMenuButtonDidSelectAddFromLibrary
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoOptionsMenuButtonDidSelectAddFromLibrary");

}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)prefersMenu
{
  return self->_prefersMenu;
}

- (MUPhotoOptionsMenuButtonDelegate)delegate
{
  return (MUPhotoOptionsMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_cameraLabel, 0);
  objc_storeStrong((id *)&self->_cameraGlyphView, 0);
}

@end
