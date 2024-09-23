@implementation TransitDestinationBannerView

- (TransitDestinationBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  _BOOL4 v5;
  TransitDestinationBannerView *v6;
  TransitDestinationBannerView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  EmptyApertureView *v11;
  double y;
  double width;
  double height;
  EmptyApertureView *v15;
  EmptyApertureView *trailingView;
  UIImageView *v17;
  UIImageView *leadingImageView;
  void *v19;
  void *v20;
  TransitApertureElementWrapperView *v21;
  TransitApertureElementWrapperView *leadingView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  double v34;
  id v35;
  uint64_t v36;
  void *i;
  UIImageView *v38;
  UIImageView *minimalImageView;
  void *v40;
  void *v41;
  TransitApertureElementWrapperView *v42;
  TransitApertureElementWrapperView *minimalView;
  UIImageView *v44;
  UIImageView *detachedMinimalImageView;
  void *v46;
  void *v47;
  TransitApertureElementWrapperView *v48;
  TransitApertureElementWrapperView *detachedMinimalView;
  id v50;
  double v51;
  double v52;
  double v53;
  UILabel *v54;
  UILabel *primaryLabel;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  UIImageView *v60;
  UIImageView *primaryImageView;
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
  UIView *v73;
  UIView *controlsView;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSLayoutConstraint *topConstraint;
  _UNKNOWN **v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  MapsBannerContent *v89;
  void *v90;
  void *v92;
  void *v93;
  UIView *v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  UIView *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;
  _QWORD v105[2];
  _BYTE v106[128];
  _QWORD v107[4];

  v5 = a5;
  v104.receiver = self;
  v104.super_class = (Class)TransitDestinationBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v104, "initWithTarget:item:aperturePresentation:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[TransitDestinationBannerView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v10);

    v97 = v5;
    if (v5)
    {
      v11 = [EmptyApertureView alloc];
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v15 = -[EmptyApertureView initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      trailingView = v7->_trailingView;
      v7->_trailingView = v15;

      -[EmptyApertureView setTranslatesAutoresizingMaskIntoConstraints:](v7->_trailingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TransitDestinationBannerView addSubview:](v7, "addSubview:", v7->_trailingView);
      v17 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      leadingImageView = v7->_leadingImageView;
      v7->_leadingImageView = v17;

      -[UIImageView setAccessibilityIdentifier:](v7->_leadingImageView, "setAccessibilityIdentifier:", CFSTR("LeadingImageView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tram.fill")));
      -[UIImageView setImage:](v7->_leadingImageView, "setImage:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
      -[UIImageView setTintColor:](v7->_leadingImageView, "setTintColor:", v20);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_leadingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentMode:](v7->_leadingImageView, "setContentMode:", 1);
      v21 = -[TransitApertureElementWrapperView initWithWrappedView:isDetached:]([TransitApertureElementWrapperView alloc], "initWithWrappedView:isDetached:", v7->_leadingImageView, 0);
      leadingView = v7->_leadingView;
      v7->_leadingView = v21;

      -[TransitApertureElementWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v7->_leadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TransitDestinationBannerView addSubview:](v7, "addSubview:", v7->_leadingView);
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[TransitApertureElementWrapperView widthAnchor](v7->_leadingView, "widthAnchor"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToConstant:", 20.0));
      v107[0] = v95;
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[TransitApertureElementWrapperView heightAnchor](v7->_leadingView, "heightAnchor"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToConstant:", 20.0));
      v107[1] = v92;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitApertureElementWrapperView leadingAnchor](v7->_leadingView, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView SBUISA_systemApertureLeadingConcentricContentLayoutGuide](v7, "SBUISA_systemApertureLeadingConcentricContentLayoutGuide"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
      -[MapsBannerView bannerAccessoryViewLeadingInset](v7, "bannerAccessoryViewLeadingInset");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25));
      v107[2] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyApertureView trailingAnchor](v7->_trailingView, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView SBUISA_systemApertureTrailingConcentricContentLayoutGuide](v7, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
      v107[3] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 4));

      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
      if (v33)
      {
        v35 = v33;
        v36 = *(_QWORD *)v101;
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(_QWORD *)v101 != v36)
              objc_enumerationMutation(v32);
            LODWORD(v34) = 1144750080;
            objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i), "setPriority:", v34);
          }
          v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
        }
        while (v35);
      }

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
      v38 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      minimalImageView = v7->_minimalImageView;
      v7->_minimalImageView = v38;

      -[UIImageView setAccessibilityIdentifier:](v7->_minimalImageView, "setAccessibilityIdentifier:", CFSTR("MinimalImageView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tram.fill")));
      -[UIImageView setImage:](v7->_minimalImageView, "setImage:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
      -[UIImageView setTintColor:](v7->_minimalImageView, "setTintColor:", v41);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_minimalImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentMode:](v7->_minimalImageView, "setContentMode:", 1);
      v42 = -[TransitApertureElementWrapperView initWithWrappedView:isDetached:]([TransitApertureElementWrapperView alloc], "initWithWrappedView:isDetached:", v7->_minimalImageView, 0);
      minimalView = v7->_minimalView;
      v7->_minimalView = v42;

      -[TransitApertureElementWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v7->_minimalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TransitDestinationBannerView addSubview:](v7, "addSubview:", v7->_minimalView);
      v44 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      detachedMinimalImageView = v7->_detachedMinimalImageView;
      v7->_detachedMinimalImageView = v44;

      -[UIImageView setAccessibilityIdentifier:](v7->_detachedMinimalImageView, "setAccessibilityIdentifier:", CFSTR("DetachedMinimalImageView"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tram.fill")));
      -[UIImageView setImage:](v7->_detachedMinimalImageView, "setImage:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
      -[UIImageView setTintColor:](v7->_detachedMinimalImageView, "setTintColor:", v47);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_detachedMinimalImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentMode:](v7->_detachedMinimalImageView, "setContentMode:", 1);
      v48 = -[TransitApertureElementWrapperView initWithWrappedView:isDetached:]([TransitApertureElementWrapperView alloc], "initWithWrappedView:isDetached:", v7->_detachedMinimalImageView, 1);
      detachedMinimalView = v7->_detachedMinimalView;
      v7->_detachedMinimalView = v48;

      -[TransitApertureElementWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v7->_detachedMinimalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TransitDestinationBannerView addSubview:](v7, "addSubview:", v7->_detachedMinimalView);

    }
    v50 = objc_alloc((Class)UILabel);
    v51 = CGRectZero.origin.y;
    v52 = CGRectZero.size.width;
    v53 = CGRectZero.size.height;
    v54 = (UILabel *)objc_msgSend(v50, "initWithFrame:", CGRectZero.origin.x, v51, v52, v53);
    primaryLabel = v7->_primaryLabel;
    v7->_primaryLabel = v54;

    -[UILabel setAccessibilityIdentifier:](v7->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "resolvedColorWithTraitCollection:", v57));
    -[UILabel setTextColor:](v7->_primaryLabel, "setTextColor:", v58);

    -[UILabel setNumberOfLines:](v7->_primaryLabel, "setNumberOfLines:", 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightBold));
    -[UILabel setFont:](v7->_primaryLabel, "setFont:", v59);

    v60 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, v51, v52, v53);
    primaryImageView = v7->_primaryImageView;
    v7->_primaryImageView = v60;

    -[UIImageView setAccessibilityIdentifier:](v7->_primaryImageView, "setAccessibilityIdentifier:", CFSTR("PrimaryImageView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightBold));
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v62));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("tram.fill")));
    -[UIImageView setImage:](v7->_primaryImageView, "setImage:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "resolvedColorWithTraitCollection:", v65));
    -[UIImageView setTintColor:](v7->_primaryImageView, "setTintColor:", v66);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_primaryImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v7->_primaryImageView, "setContentMode:", 4);
    if (v97)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("[Nav Banner] End Route"), CFSTR("localized string not found"), 0));
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v68, 0, 0, &stru_1011E7D80));

      objc_msgSend(v69, "setAttributes:", (unint64_t)objc_msgSend(v69, "attributes") | 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration sbui_systemApertureTextButtonConfiguration](UIButtonConfiguration, "sbui_systemApertureTextButtonConfiguration"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      objc_msgSend(v70, "setBaseBackgroundColor:", v71);

      v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      objc_msgSend(v70, "setBaseForegroundColor:", v72);

      v73 = (UIView *)objc_claimAutoreleasedReturnValue(+[SBUISystemApertureButton buttonWithConfiguration:primaryAction:](SBUISystemApertureButton, "buttonWithConfiguration:primaryAction:", v70, v69));
      -[UIView setAccessibilityIdentifier:](v73, "setAccessibilityIdentifier:", CFSTR("EndButton"));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setHidden:](v73, "setHidden:", 1);
      controlsView = v7->_controlsView;
      v7->_controlsView = v73;
      v94 = v73;

      v98 = v7->_controlsView;
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _tightBoundingBoxLayoutGuide](v7->_primaryLabel, "_tightBoundingBoxLayoutGuide"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
      v77 = v62;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v7, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
      v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v79));
      topConstraint = v7->_topConstraint;
      v7->_topConstraint = (NSLayoutConstraint *)v80;

      v62 = v77;
      v82 = MKPlaceCollectionsLogicController_ptr;

      LODWORD(v83) = 1144750080;
      -[NSLayoutConstraint setPriority:](v7->_topConstraint, "setPriority:", v83);

    }
    else
    {
      v98 = 0;
      v82 = MKPlaceCollectionsLogicController_ptr;
    }
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v7->_primaryImageView, "heightAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToConstant:", 36.0));
    v105[0] = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v7->_primaryImageView, "widthAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToConstant:", 36.0));
    v105[1] = v87;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82[304], "arrayWithObjects:count:", v105, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v88);

    v89 = -[MapsBannerContent initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:]([MapsBannerContent alloc], "initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:", 0, v7->_primaryImageView, v7->_primaryLabel, 0, 0, v98);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v7, "contentView"));
    objc_msgSend(v90, "setContent:", v89);

    -[TransitDestinationBannerView updateFromBannerItem](v7, "updateFromBannerItem");
    v7->_cachedHeight = -1.0;
    v7->_calculatedWidth = -1.0;

  }
  return v7;
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v4, "setText:", v3);

  self->_cachedHeight = -1.0;
}

- (unint64_t)bannerType
{
  return 3;
}

- (void)setShowsControls:(BOOL)a3
{
  unsigned int v4;

  v4 = -[MapsBannerView aperturePresentation](self, "aperturePresentation") && a3;
  if (self->_showsControls != v4)
  {
    self->_showsControls = v4;
    -[UIView setHidden:](self->_controlsView, "setHidden:", v4 ^ 1);
    self->_cachedHeight = -1.0;
  }
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  self->_expanded = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView leadingView](self, "leadingView"));
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView trailingView](self, "trailingView"));
    objc_msgSend(v7, "setAlpha:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView minimalView](self, "minimalView"));
    objc_msgSend(v8, "setAlpha:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView detachedMinimalView](self, "detachedMinimalView"));
    objc_msgSend(v9, "setAlpha:", 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    v11 = v10;
    v12 = 1.0;
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView trailingView](self, "trailingView"));
    objc_msgSend(v13, "setAlpha:", 1.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView minimalView](self, "minimalView"));
    objc_msgSend(v14, "setAlpha:", 1.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView detachedMinimalView](self, "detachedMinimalView"));
    objc_msgSend(v15, "setAlpha:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
    v11 = v10;
    v12 = 0.0;
  }
  objc_msgSend(v10, "setAlpha:", v12);

  -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", v3);
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)self->_leadingView;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)self->_trailingView;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)self->_minimalView;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  return (SBUISystemApertureAccessoryView *)self->_detachedMinimalView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double cachedHeight;
  double v7;
  double v8;
  void *v9;
  double MaxY;
  void *v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  double v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  CGSize v25;
  CGSize result;
  CGRect v27;

  height = a3.height;
  width = a3.width;
  cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    -[TransitDestinationBannerView _maps_compressedSizeForWidth:withBlock:](self, "_maps_compressedSizeForWidth:withBlock:", 0, a3.width);
    v8 = v7;
    if (-[MapsBannerView aperturePresentation](self, "aperturePresentation"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDestinationBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      objc_msgSend(v9, "layoutFrame");
      MaxY = CGRectGetMaxY(v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
      objc_msgSend(v11, "_maps_compressedSizeForWidth:withBlock:", 0, width);
      v8 = MaxY + v12 + 17.0;

    }
    if (v8 <= height)
    {
      self->_cachedHeight = v8;
      self->_calculatedWidth = width;
      cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_100431C7C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
        v25.width = width;
        v25.height = height;
        v16 = NSStringFromCGSize(v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v19 = 138412802;
        v20 = v15;
        v21 = 2112;
        v22 = v17;
        v23 = 2048;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v19, 0x20u);

      }
      cachedHeight = height;
    }
  }
  v18 = width;
  result.height = cachedHeight;
  result.width = v18;
  return result;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UIImageView)primaryImageView
{
  return self->_primaryImageView;
}

- (void)setPrimaryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryImageView, a3);
}

- (UIView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalImageView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalImageView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end
