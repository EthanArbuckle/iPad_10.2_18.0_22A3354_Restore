@implementation OfflineMapSnapshotRowView

- (OfflineMapSnapshotRowView)initWithFrame:(CGRect)a3
{
  OfflineMapSnapshotRowView *v3;
  OfflineMapSnapshotRowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineMapSnapshotRowView;
  v3 = -[OfflineMapSnapshotRowView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[OfflineMapSnapshotRowView _setupViews](v3, "_setupViews");
    -[OfflineMapSnapshotRowView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
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
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineMapSnapshotRowView setSnapshotShadow:](self, "setSnapshotShadow:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  objc_msgSend(v9, "_setContinuousCornerRadius:", 12.0);

  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v11 = objc_msgSend(v10, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v13, "setShadowColor:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  LODWORD(v16) = 1041865114;
  objc_msgSend(v15, "setShadowOpacity:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v18, "setShadowRadius:", 12.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v20, "setShadowOffset:", 0.0, 8.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
  objc_msgSend(v22, "setShadowPathIsBounds:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v24, "setPunchoutShadow:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  -[OfflineMapSnapshotRowView addSubview:](self, "addSubview:", v25);

  v26 = objc_msgSend(objc_alloc((Class)_MKStaticMapView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[OfflineMapSnapshotRowView setSnapshotView:](self, "setSnapshotView:", v26);

  v27 = objc_msgSend(objc_alloc((Class)MKStandardMapConfiguration), "initWithElevationStyle:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  objc_msgSend(v28, "setPreferredConfiguration:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  objc_msgSend(v30, "_setContinuousCornerRadius:", 12.0);

  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  v32 = objc_msgSend(v31, "CGColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  objc_msgSend(v34, "setBorderColor:", v32);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "layer"));
  objc_msgSend(v36, "setBorderWidth:", 2.0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  objc_msgSend(v37, "setClipsToBounds:", 1);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  -[OfflineMapSnapshotRowView addSubview:](self, "addSubview:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v39, "setImagePadding:", 4.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "background"));
  objc_msgSend(v40, "setCornerRadius:", 8.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v39, "setBaseBackgroundColor:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "background"));
  objc_msgSend(v43, "setBackgroundColor:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v39, "setBaseForegroundColor:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 17));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "background"));
  objc_msgSend(v46, "setVisualEffect:", v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.left.and.arrow.down.right")));
  objc_msgSend(v39, "setImage:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Resize [button title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  objc_msgSend(v39, "setTitle:", v49);

  objc_msgSend(v39, "setContentInsets:", 8.0, 8.0, 8.0, 8.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, 0, UIFontWeightSemibold));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v50, 1));
  objc_msgSend(v39, "setPreferredSymbolConfigurationForImage:", v51);

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1002BB3F0;
  v61[3] = &unk_1011AFCC0;
  v62 = v50;
  v52 = v50;
  objc_msgSend(v39, "setTitleTextAttributesTransformer:", v61);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v39, 0));
  -[OfflineMapSnapshotRowView setResizeButton:](self, "setResizeButton:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  objc_msgSend(v55, "setAccessibilityIdentifier:", CFSTR("ResizeOfflineRegion"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "currentTitle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  objc_msgSend(v58, "setAccessibilityLabel:", v57);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  objc_msgSend(v59, "addTarget:action:forControlEvents:", self, "_buttonAction", 0x2000);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  -[OfflineMapSnapshotRowView addSubview:](self, "addSubview:", v60);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *snapshotWidthConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *snapshotHeightConstraint;
  double v11;
  double v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  _QWORD v73[15];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 256.0));
  snapshotWidthConstraint = self->_snapshotWidthConstraint;
  self->_snapshotWidthConstraint = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 256.0));
  snapshotHeightConstraint = self->_snapshotHeightConstraint;
  self->_snapshotHeightConstraint = v9;

  LODWORD(v11) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_snapshotWidthConstraint, "setPriority:", v11);
  LODWORD(v12) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_snapshotHeightConstraint, "setPriority:", v12);
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v73[0] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v73[1] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v73[2] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotShadow](self, "snapshotShadow"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v13 = self->_snapshotWidthConstraint;
  v73[3] = v53;
  v73[4] = v13;
  v73[5] = self->_snapshotHeightConstraint;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView leadingAnchor](self, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 16.0));
  v73[6] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView trailingAnchor](self, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:constant:", v46, -16.0));
  v73[7] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintLessThanOrEqualToConstant:", 256.0));
  v73[8] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView centerXAnchor](self, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v73[9] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView centerYAnchor](self, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v73[10] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView topAnchor](self, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v73[11] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView bottomAnchor](self, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v73[12] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = -kMUPlaceSystemSpacing;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -kMUPlaceSystemSpacing));
  v73[13] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView resizeButton](self, "resizeButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView snapshotView](self, "snapshotView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v17));
  v73[14] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)_buttonAction
{
  void *v3;
  void (**v4)(id, OfflineMapSnapshotRowView *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView actionBlock](self, "actionBlock"));

  if (v3)
  {
    v4 = (void (**)(id, OfflineMapSnapshotRowView *))objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView actionBlock](self, "actionBlock"));
    v4[2](v4, self);

  }
}

- (void)setSubscriptionInfo:(id)a3
{
  MapDataSubscriptionInfo *v5;
  NSLayoutConstraint *snapshotWidthAspectRatioConstraint;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MapDataSubscriptionInfo *v22;

  v5 = (MapDataSubscriptionInfo *)a3;
  if (self->_subscriptionInfo != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    if (self->_snapshotWidthAspectRatioConstraint)
    {
      -[_MKStaticMapView removeConstraint:](self->_snapshotView, "removeConstraint:");
      snapshotWidthAspectRatioConstraint = self->_snapshotWidthAspectRatioConstraint;
      self->_snapshotWidthAspectRatioConstraint = 0;

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](v22, "subscription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "region"));
    v9 = +[MapsOfflineUIHelper idealDisplayAspectRatio:](MapsOfflineUIHelper, "idealDisplayAspectRatio:", v8);

    if (v9 <= 2)
    {
      v10 = dbl_100E34DF0[v9];
      -[NSLayoutConstraint setConstant:](self->_snapshotWidthConstraint, "setConstant:", dbl_100E34DD8[v9]);
      -[NSLayoutConstraint setConstant:](self->_snapshotHeightConstraint, "setConstant:", v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MKStaticMapView widthAnchor](self->_snapshotView, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MKStaticMapView heightAnchor](self->_snapshotView, "heightAnchor"));
    -[NSLayoutConstraint constant](self->_snapshotWidthConstraint, "constant");
    v14 = v13;
    -[NSLayoutConstraint constant](self->_snapshotHeightConstraint, "constant");
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v12, v14 / v15));
    v17 = self->_snapshotWidthAspectRatioConstraint;
    self->_snapshotWidthAspectRatioConstraint = v16;

    -[NSLayoutConstraint setActive:](self->_snapshotWidthAspectRatioConstraint, "setActive:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSnapshotRowView subscriptionInfo](self, "subscriptionInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subscription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "region"));
    -[_MKStaticMapView setVisibleMapRect:](self->_snapshotView, "setVisibleMapRect:", GEOMapRectForMapRegion(v20, v21));

    v5 = v22;
  }

}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)snapshotShadow
{
  return self->_snapshotShadow;
}

- (void)setSnapshotShadow:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotShadow, a3);
}

- (_MKStaticMapView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (UIButton)resizeButton
{
  return self->_resizeButton;
}

- (void)setResizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_resizeButton, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_resizeButton, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_snapshotShadow, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_snapshotWidthAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_snapshotHeightConstraint, 0);
  objc_storeStrong((id *)&self->_snapshotWidthConstraint, 0);
}

@end
