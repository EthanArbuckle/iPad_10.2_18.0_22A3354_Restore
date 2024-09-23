@implementation SBSUIWallpaperProgressHUD

- (SBSUIWallpaperProgressHUD)initWithFrame:(CGRect)a3
{
  SBSUIWallpaperProgressHUD *v3;
  SBSUIWallpaperProgressHUD *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _UIBackdropView *backdropView;
  UILabel *v11;
  UILabel *label;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UIActivityIndicatorView *activityIndicatorView;
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
  objc_super v58;
  _QWORD v59[13];

  v59[11] = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)SBSUIWallpaperProgressHUD;
  v3 = -[SBSUIWallpaperProgressHUD initWithFrame:](&v58, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[SBSUIWallpaperProgressHUD setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBSUIWallpaperProgressHUD traitCollection](v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    v7 = objc_alloc(MEMORY[0x1E0CEAC68]);
    if (v6 == 2)
      v8 = 2030;
    else
      v8 = 2020;
    v9 = objc_msgSend(v7, "initWithPrivateStyle:", v8);
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v9;

    -[_UIBackdropView _setContinuousCornerRadius:](v4->_backdropView, "_setContinuousCornerRadius:", 7.0);
    -[_UIBackdropView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBSUIWallpaperProgressHUD addSubview:](v4, "addSubview:", v4->_backdropView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    label = v4->_label;
    v4->_label = v11;

    v13 = v4->_label;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = v4->_label;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = v4->_label;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[SBSUIWallpaperProgressHUD addSubview:](v4, "addSubview:", v4->_label);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v4->_activityIndicatorView;
    v4->_activityIndicatorView = (UIActivityIndicatorView *)v19;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBSUIWallpaperProgressHUD addSubview:](v4, "addSubview:", v4->_activityIndicatorView);
    v44 = (void *)MEMORY[0x1E0CB3718];
    -[_UIBackdropView trailingAnchor](v4->_backdropView, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD trailingAnchor](v4, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v55;
    -[_UIBackdropView leadingAnchor](v4->_backdropView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD leadingAnchor](v4, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v52;
    -[_UIBackdropView topAnchor](v4->_backdropView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD topAnchor](v4, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v49;
    -[_UIBackdropView bottomAnchor](v4->_backdropView, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD bottomAnchor](v4, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v46;
    -[UIActivityIndicatorView leadingAnchor](v4->_activityIndicatorView, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD leadingAnchor](v4, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v43, 15.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v42;
    -[UIActivityIndicatorView centerYAnchor](v4->_activityIndicatorView, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD centerYAnchor](v4, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v59[5] = v39;
    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView trailingAnchor](v4->_activityIndicatorView, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 5.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v59[6] = v36;
    -[UILabel trailingAnchor](v4->_label, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD trailingAnchor](v4, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -15.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59[7] = v33;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD centerYAnchor](v4, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59[8] = v22;
    -[UILabel topAnchor](v4->_label, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD topAnchor](v4, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 15.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59[9] = v25;
    -[UILabel bottomAnchor](v4->_label, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperProgressHUD bottomAnchor](v4, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -15.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[10] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v29);

    -[SBSUIWallpaperProgressHUD setOpaque:](v4, "setOpaque:", 0);
    -[SBSUIWallpaperProgressHUD layer](v4, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)showMessage:(id)a3 inView:(id)a4
{
  UILabel *label;
  id v7;
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  label = self->_label;
  v7 = a4;
  -[UILabel setText:](label, "setText:", a3);
  objc_msgSend(v7, "addSubview:", self);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
  v18 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperProgressHUD centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperProgressHUD centerYAnchor](self, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  -[SBSUIWallpaperProgressHUD leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v12, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(v7, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSUIWallpaperProgressHUD trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v15, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)hide
{
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  -[SBSUIWallpaperProgressHUD removeFromSuperview](self, "removeFromSuperview");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
