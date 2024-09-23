@implementation LocationRefinementViewController

- (LocationRefinementViewController)initWithCamera:(id)a3 showCrosshair:(BOOL)a4
{
  if (a4)
    return -[LocationRefinementViewController initWithCamera:crosshairType:](self, "initWithCamera:crosshairType:", a3, 0);
  else
    return -[LocationRefinementViewController initWithCamera:crosshairType:](self, "initWithCamera:crosshairType:", a3, 4);
}

- (LocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4
{
  id v6;
  LocationRefinementViewController *v7;
  MKMapCamera *v8;
  MKMapCamera *initialCamera;
  objc_super v11;
  CLLocationCoordinate2D v12;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LocationRefinementViewController;
  v7 = -[LocationRefinementViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "centerCoordinate");
      if (CLLocationCoordinate2DIsValid(v12))
      {
        v8 = (MKMapCamera *)objc_msgSend(v6, "copy");
        initialCamera = v7->_initialCamera;
        v7->_initialCamera = v8;

        -[MKMapCamera setPitch:](v7->_initialCamera, "setPitch:", 0.0);
      }
    }
    v7->_needsInitialCameraPosition = v7->_initialCamera != 0;
    v7->_initialMapViewZoomLevel = -1.0;
    v7->_crosshairType = a4;
  }

  return v7;
}

- (LocationRefinementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[LocationRefinementViewController initWithCamera:crosshairType:](self, "initWithCamera:crosshairType:", 0, 0);
}

- (LocationRefinementViewController)initWithCoder:(id)a3
{
  return -[LocationRefinementViewController initWithCamera:crosshairType:](self, "initWithCamera:crosshairType:", 0, 0);
}

- (void)viewDidLoad
{
  MKMapView *v3;
  MKMapView *mapView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *instructionsContainer;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  UILabel *v26;
  UILabel *instructionsLabel;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *instructionsContainerBottomConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSLayoutConstraint *v44;
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
  id v65;
  void *v66;
  UIImageView *v67;
  UIImageView *crosshairImageView;
  void *v69;
  void *v70;
  void *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *crosshairXConstraint;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *crosshairYConstraint;
  NSLayoutConstraint *v78;
  void *v79;
  UIVisualEffectView *v80;
  UIVisualEffectView *buttonContainerView;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSLayoutConstraint *v88;
  NSLayoutConstraint *userLocationButtonBottomConstraint;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSLayoutConstraint *v94;
  void *v95;
  UIButton *v96;
  UIButton *snapToUserLocationButton;
  UIButton *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
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
  id v158;
  void *v159;
  id v160;
  objc_super v161;
  _QWORD v162[6];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[4];
  _QWORD v166[4];
  _QWORD v167[4];
  _QWORD v168[3];

  v161.receiver = self;
  v161.super_class = (Class)LocationRefinementViewController;
  -[LocationRefinementViewController viewDidLoad](&v161, "viewDidLoad");
  v3 = (MKMapView *)objc_alloc_init((Class)MKMapView);
  mapView = self->_mapView;
  self->_mapView = v3;

  -[MKMapView _setEdgeInsets:](self->_mapView, "_setEdgeInsets:", 44.0, 0.0, 0.0, 0.0);
  -[MKMapView setShowsAttribution:](self->_mapView, "setShowsAttribution:", 0);
  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 1);
  -[MKMapView setPitchEnabled:](self->_mapView, "setPitchEnabled:", 0);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _panningGestureRecognizer](self->_mapView, "_panningGestureRecognizer"));
  objc_msgSend(v5, "setMaximumNumberOfTouches:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v6, "setStaysCenteredDuringPinch:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v7, "setStaysCenteredDuringRotation:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_mapView);

  v9 = (UIView *)objc_alloc_init((Class)UIView);
  instructionsContainer = self->_instructionsContainer;
  self->_instructionsContainer = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc((Class)UIVisualEffectView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6));
  v158 = objc_msgSend(v14, "initWithEffect:", v15);

  objc_msgSend(v158, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  objc_msgSend(v16, "addSubview:", v158);

  v160 = objc_alloc_init((Class)NSMutableArray);
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "topAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "safeAreaLayoutGuide"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "topAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:", v133));
  v168[0] = v128;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v18));
  v168[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v168[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v168, 3));
  objc_msgSend(v160, "addObjectsFromArray:", v25);

  v26 = (UILabel *)objc_alloc_init((Class)UILabel);
  instructionsLabel = self->_instructionsLabel;
  self->_instructionsLabel = v26;

  -[UILabel setTextAlignment:](self->_instructionsLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsText](self, "instructionsText"));
  -[UILabel setText:](self->_instructionsLabel, "setText:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
  -[UILabel setFont:](self->_instructionsLabel, "setFont:", v29);

  -[UILabel setLineBreakMode:](self->_instructionsLabel, "setLineBreakMode:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_instructionsLabel, "setTextColor:", v30);

  -[UILabel setNumberOfLines:](self->_instructionsLabel, "setNumberOfLines:", 0);
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_instructionsLabel, "font"));
  objc_msgSend(v157, "_scaledValueForValue:", 27.0);
  v32 = (v31 + -27.0) * 0.5;
  if (v31 <= 27.0)
    v32 = 0.0;
  v33 = v31 - v32;
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_instructionsLabel, "setAdjustsFontSizeToFitWidth:", 0);
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_instructionsLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setMinimumScaleFactor:](self->_instructionsLabel, "setMinimumScaleFactor:", 0.5);
  -[UIView addSubview:](self->_instructionsContainer, "addSubview:", self->_instructionsLabel);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_instructionsContainer, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 16.0));
  instructionsContainerBottomConstraint = self->_instructionsContainerBottomConstraint;
  self->_instructionsContainerBottomConstraint = v36;

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_instructionsContainer, "safeAreaLayoutGuide"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "leadingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v139));
  v167[0] = v134;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_instructionsLabel, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_instructionsContainer, "safeAreaLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v39));
  v167[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_instructionsContainer, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, v33));
  v44 = self->_instructionsContainerBottomConstraint;
  v167[2] = v43;
  v167[3] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v167, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v45);

  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "topAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "topAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v145));
  v166[0] = v140;
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "leadingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "leadingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v125));
  v166[1] = v121;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));
  v166[2] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
  v166[3] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v166, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v54);

  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView leadingAnchor](self->_mapView, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v146));
  v165[0] = v141;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView trailingAnchor](self->_mapView, "trailingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "trailingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v126));
  v165[1] = v122;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView topAnchor](self->_mapView, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v57));
  v165[2] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView bottomAnchor](self->_mapView, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v61));
  v165[3] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v165, 4));
  -[LocationRefinementViewController setMapViewConstraints:](self, "setMapViewConstraints:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewConstraints](self, "mapViewConstraints"));
  objc_msgSend(v160, "addObjectsFromArray:", v64);

  if (self->_crosshairType != 4)
  {
    v65 = objc_alloc((Class)UIImageView);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController crosshairImage](self, "crosshairImage"));
    v67 = (UIImageView *)objc_msgSend(v65, "initWithImage:", v66);
    crosshairImageView = self->_crosshairImageView;
    self->_crosshairImageView = v67;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_crosshairImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](self->_crosshairImageView, "setHidden:", 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v69, "addSubview:", self->_crosshairImageView);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_crosshairImageView, "centerXAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView centerXAnchor](self->_mapView, "centerXAnchor"));
    v72 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
    crosshairXConstraint = self->_crosshairXConstraint;
    self->_crosshairXConstraint = v72;

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_crosshairImageView, "centerYAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView centerYAnchor](self->_mapView, "centerYAnchor"));
    v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
    crosshairYConstraint = self->_crosshairYConstraint;
    self->_crosshairYConstraint = v76;

    -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
    v78 = self->_crosshairYConstraint;
    v164[0] = self->_crosshairXConstraint;
    v164[1] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 2));
    objc_msgSend(v160, "addObjectsFromArray:", v79);

  }
  v80 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  buttonContainerView = self->_buttonContainerView;
  self->_buttonContainerView = v80;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView setClipsToBounds:](self->_buttonContainerView, "setClipsToBounds:", 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_buttonContainerView, "layer"));
  objc_msgSend(v82, "setCornerRadius:", 10.0);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_buttonContainerView, "layer"));
  objc_msgSend(v83, "setMaskedCorners:", 15);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController view](self, "view"));
  objc_msgSend(v84, "addSubview:", self->_buttonContainerView);

  objc_storeStrong((id *)&self->_snapToUserLocationContainerView, self->_buttonContainerView);
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_buttonContainerView, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView safeAreaLayoutGuide](self->_mapView, "safeAreaLayoutGuide"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "bottomAnchor"));
  v88 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, -12.0));
  userLocationButtonBottomConstraint = self->_userLocationButtonBottomConstraint;
  self->_userLocationButtonBottomConstraint = v88;

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_buttonContainerView, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView safeAreaLayoutGuide](self->_mapView, "safeAreaLayoutGuide"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v92, 12.0));
  v94 = self->_userLocationButtonBottomConstraint;
  v163[0] = v93;
  v163[1] = v94;
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v163, 2));
  objc_msgSend(v160, "addObjectsFromArray:", v95);

  v96 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  snapToUserLocationButton = self->_snapToUserLocationButton;
  self->_snapToUserLocationButton = v96;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_snapToUserLocationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v98 = self->_snapToUserLocationButton;
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme locationImage](MapsTheme, "locationImage"));
  -[UIButton setImage:forState:](v98, "setImage:forState:", v99, 0);

  -[UIButton _setContinuousCornerRadius:](self->_snapToUserLocationButton, "_setContinuousCornerRadius:", 10.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v100, "nativeScale");
  v102 = 1.0 / v101;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_snapToUserLocationButton, "layer"));
  objc_msgSend(v103, "setBorderWidth:", v102);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton theme](self->_snapToUserLocationButton, "theme"));
  v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "hairlineColor")));
  v106 = objc_msgSend(v105, "CGColor");
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_snapToUserLocationButton, "layer"));
  objc_msgSend(v107, "setBorderColor:", v106);

  -[UIButton addTarget:action:forControlEvents:](self->_snapToUserLocationButton, "addTarget:action:forControlEvents:", self, "recenterMapView", 64);
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_buttonContainerView, "contentView"));
  objc_msgSend(v108, "addSubview:", self->_snapToUserLocationButton);

  v159 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_snapToUserLocationButton, "leadingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_buttonContainerView, "leadingAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v155));
  v162[0] = v152;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_snapToUserLocationButton, "trailingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_buttonContainerView, "trailingAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v142));
  v162[1] = v137;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_snapToUserLocationButton, "topAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_buttonContainerView, "topAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v127));
  v162[2] = v123;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_snapToUserLocationButton, "bottomAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_buttonContainerView, "bottomAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
  v162[3] = v109;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_snapToUserLocationButton, "heightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToConstant:", 50.0));
  v162[4] = v111;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_snapToUserLocationButton, "widthAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_snapToUserLocationButton, "heightAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v113));
  v162[5] = v114;
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 6));
  objc_msgSend(v160, "addObjectsFromArray:", v115);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v160);
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v116, "addObserver:selector:name:object:", self, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  -[LocationRefinementViewController updateLocateMeButtonState](self, "updateLocateMeButtonState");
  -[LocationRefinementViewController setViewDidLoadComplete:](self, "setViewDidLoadComplete:", 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v117, "addObserver:selector:name:object:", self, "_contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_contentSizeChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
  -[UILabel setFont:](self->_instructionsLabel, "setFont:", v3);

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LocationRefinementViewController;
  -[MapsThemeViewController updateTheme](&v7, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "controlBackgroundColor"));
  -[UIVisualEffectView setBackgroundColor:](self->_snapToUserLocationContainerView, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController theme](self, "theme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controlTintColor"));
  -[UIVisualEffectView setTintColor:](self->_snapToUserLocationContainerView, "setTintColor:", v6);

}

- (id)crosshairImage
{
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = -[LocationRefinementViewController crosshairType](self, "crosshairType");
  v3 = CFSTR("crosshair_marker");
  if (v2 == 2)
    v3 = CFSTR("crosshair_work");
  if (v2 == 1)
    v4 = CFSTR("crosshair_home");
  else
    v4 = v3;
  return +[UIImage imageNamed:](UIImage, "imageNamed:", v4);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double MaxY;
  void *v5;
  double v6;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  if (-[LocationRefinementViewController needsInitialCameraPosition](self, "needsInitialCameraPosition"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
    objc_msgSend(v3, "frame");
    MaxY = CGRectGetMaxY(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v5, "frame");
    v6 = MaxY - CGRectGetMinY(v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v7, "_setEdgeInsets:", v6, 0.0, 0.0, 0.0);

  }
  -[LocationRefinementViewController applyInitialCameraPosition](self, "applyInitialCameraPosition");
  -[LocationRefinementViewController applyInitialZoomLevel](self, "applyInitialZoomLevel");
  v8.receiver = self;
  v8.super_class = (Class)LocationRefinementViewController;
  -[LocationRefinementViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
}

- (void)applyInitialCameraPosition
{
  MKMapCamera *initialCamera;
  id v4;

  if (-[LocationRefinementViewController needsInitialCameraPosition](self, "needsInitialCameraPosition"))
  {
    -[LocationRefinementViewController setNeedsInitialCameraPosition:](self, "setNeedsInitialCameraPosition:", 0);
    initialCamera = self->_initialCamera;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v4, "setCamera:", initialCamera);

  }
}

- (void)applyInitialZoomLevel
{
  double v3;
  MKMapCamera *initialCamera;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  -[LocationRefinementViewController initialMapViewZoomLevel](self, "initialMapViewZoomLevel");
  if (v3 != -1.0)
  {
    initialCamera = self->_initialCamera;
    if (initialCamera)
    {
      -[MKMapCamera centerCoordinate](initialCamera, "centerCoordinate");
      v6 = v5;
      v8 = v7;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
      objc_msgSend(v9, "centerCoordinate");
      v6 = v10;
      v8 = v11;

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    -[LocationRefinementViewController initialMapViewZoomLevel](self, "initialMapViewZoomLevel");
    objc_msgSend(v12, "setCenterCoordinate:zoomLevel:animated:", 0, v6, v8, v13);

    -[LocationRefinementViewController setInitialMapViewZoomLevel:](self, "setInitialMapViewZoomLevel:", -1.0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LocationRefinementViewController;
  -[LocationRefinementViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[LocationRefinementViewController updateLocateMeButtonState](self, "updateLocateMeButtonState");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[LocationRefinementViewController setVisible:](self, "setVisible:", 1);
  -[LocationRefinementViewController applyInitialCameraPosition](self, "applyInitialCameraPosition");
  -[LocationRefinementViewController applyInitialZoomLevel](self, "applyInitialZoomLevel");
  v5.receiver = self;
  v5.super_class = (Class)LocationRefinementViewController;
  -[LocationRefinementViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LocationRefinementViewController;
  -[LocationRefinementViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[LocationRefinementViewController setVisible:](self, "setVisible:", 0);
}

- (void)updateLocateMeButtonState
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  UIButton *snapToUserLocationButton;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = objc_msgSend(v3, "isLocationServicesEnabled");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation");

  -[UIVisualEffectView setHidden:](self->_buttonContainerView, "setHidden:", v4 & v6 ^ 1);
  snapToUserLocationButton = self->_snapToUserLocationButton;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  -[UIButton setEnabled:](snapToUserLocationButton, "setEnabled:", objc_msgSend(v8, "hasUserLocation"));

}

- (void)setInstructionsText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_instructionsText, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsLabel](self, "instructionsLabel"));
  objc_msgSend(v6, "setText:", v5);

}

- (CLLocationCoordinate2D)selectedCoordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  objc_msgSend(v2, "centerCoordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3
{
  -[LocationRefinementViewController setSelectedCoordinate:animated:](self, "setSelectedCoordinate:animated:", 1, a3.latitude, a3.longitude);
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double longitude;
  double latitude;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[LocationRefinementViewController visible](self, "visible"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v10, "setCenterCoordinate:animated:", v4, latitude, longitude);
  }
  else if (-[LocationRefinementViewController needsInitialCameraPosition](self, "needsInitialCameraPosition"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController initialCamera](self, "initialCamera"));
    objc_msgSend(v10, "setCenterCoordinate:", latitude, longitude);
  }
  else
  {
    v10 = objc_alloc_init((Class)MKMapCamera);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController initialCamera](self, "initialCamera"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController initialCamera](self, "initialCamera"));
      objc_msgSend(v9, "altitude");
      objc_msgSend(v10, "setAltitude:");

    }
    else
    {
      objc_msgSend(v10, "setAltitude:", 1000.0);
    }

    -[LocationRefinementViewController setInitialCamera:](self, "setInitialCamera:", v10);
    -[LocationRefinementViewController setNeedsInitialCameraPosition:](self, "setNeedsInitialCameraPosition:", 1);
    objc_msgSend(v10, "setCenterCoordinate:", latitude, longitude);
  }

}

- (void)updateCrosshairConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController crosshairImageView](self, "crosshairImageView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v5, "centerCoordinate");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v4, "convertCoordinate:toPointToView:", v10, v7, v9);
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v16, "center");
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
    objc_msgSend(v15, "convertPoint:fromView:", v22, v18, v20);
    v24 = v23;
    v26 = v25;

    if (vabdd_f64(v12, v24) != INFINITY && vabdd_f64(v14, v26) != INFINITY)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController crosshairXConstraint](self, "crosshairXConstraint"));
      objc_msgSend(v27, "setConstant:", v12 - v24);

      v28 = (id)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController crosshairYConstraint](self, "crosshairYConstraint"));
      objc_msgSend(v28, "setConstant:", v14 - v26);

    }
  }
}

- (void)recenterMapView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 4001, 623, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView userLocation](self->_mapView, "userLocation"));
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;

  v9.latitude = v6;
  v9.longitude = v8;
  if (CLLocationCoordinate2DIsValid(v9))
    -[MKMapView setCenterCoordinate:animated:](self->_mapView, "setCenterCoordinate:animated:", 1, v6, v8);
}

- (void)setInitialMapViewZoomLevel:(double)a3
{
  self->_initialMapViewZoomLevel = a3;
}

- (LocationRefinementViewControllerDelegate)delegate
{
  return (LocationRefinementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (MKMapViewDelegate)mapViewDelegate
{
  return (MKMapViewDelegate *)objc_loadWeakRetained((id *)&self->_mapViewDelegate);
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewDelegate, a3);
}

- (BOOL)needsInitialCameraPosition
{
  return self->_needsInitialCameraPosition;
}

- (void)setNeedsInitialCameraPosition:(BOOL)a3
{
  self->_needsInitialCameraPosition = a3;
}

- (UIView)instructionsContainer
{
  return self->_instructionsContainer;
}

- (NSLayoutConstraint)instructionsContainerBottomConstraint
{
  return self->_instructionsContainerBottomConstraint;
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (NSArray)mapViewConstraints
{
  return self->_mapViewConstraints;
}

- (void)setMapViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewConstraints, a3);
}

- (NSString)instructionsText
{
  return self->_instructionsText;
}

- (NSLayoutConstraint)userLocationButtonBottomConstraint
{
  return self->_userLocationButtonBottomConstraint;
}

- (UIVisualEffectView)snapToUserLocationContainerView
{
  return self->_snapToUserLocationContainerView;
}

- (MKMapCamera)initialCamera
{
  return self->_initialCamera;
}

- (void)setInitialCamera:(id)a3
{
  objc_storeStrong((id *)&self->_initialCamera, a3);
}

- (UIVisualEffectView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (void)setButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainerView, a3);
}

- (UIButton)snapToUserLocationButton
{
  return self->_snapToUserLocationButton;
}

- (void)setSnapToUserLocationButton:(id)a3
{
  objc_storeStrong((id *)&self->_snapToUserLocationButton, a3);
}

- (BOOL)viewDidLoadComplete
{
  return self->_viewDidLoadComplete;
}

- (void)setViewDidLoadComplete:(BOOL)a3
{
  self->_viewDidLoadComplete = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (unint64_t)crosshairType
{
  return self->_crosshairType;
}

- (UIImageView)crosshairImageView
{
  return self->_crosshairImageView;
}

- (void)setCrosshairImageView:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairImageView, a3);
}

- (NSLayoutConstraint)crosshairXConstraint
{
  return self->_crosshairXConstraint;
}

- (void)setCrosshairXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairXConstraint, a3);
}

- (NSLayoutConstraint)crosshairYConstraint
{
  return self->_crosshairYConstraint;
}

- (void)setCrosshairYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairYConstraint, a3);
}

- (double)initialMapViewZoomLevel
{
  return self->_initialMapViewZoomLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crosshairYConstraint, 0);
  objc_storeStrong((id *)&self->_crosshairXConstraint, 0);
  objc_storeStrong((id *)&self->_crosshairImageView, 0);
  objc_storeStrong((id *)&self->_snapToUserLocationButton, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_initialCamera, 0);
  objc_storeStrong((id *)&self->_snapToUserLocationContainerView, 0);
  objc_storeStrong((id *)&self->_userLocationButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_instructionsText, 0);
  objc_storeStrong((id *)&self->_mapViewConstraints, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_instructionsContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_instructionsContainer, 0);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)protocol:(id)a3 hasInstanceMethod:(SEL)a4
{
  Protocol *v5;
  BOOL v6;

  v5 = (Protocol *)a3;
  v6 = 1;
  if (!(unint64_t)protocol_getMethodDescription(v5, a4, 1, 1).name)
    v6 = (unint64_t)protocol_getMethodDescription(v5, a4, 0, 1).name != 0;

  return v6;
}

- (BOOL)delegateProtocolHasInstanceMethod:(SEL)a3
{
  if (-[LocationRefinementViewController protocol:hasInstanceMethod:](self, "protocol:hasInstanceMethod:", &OBJC_PROTOCOL___MKMapViewDelegate, a3))
  {
    return 1;
  }
  else
  {
    return -[LocationRefinementViewController protocol:hasInstanceMethod:](self, "protocol:hasInstanceMethod:", &OBJC_PROTOCOL___MKMapViewDelegatePrivate, a3);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LocationRefinementViewController;
  if (-[LocationRefinementViewController respondsToSelector:](&v8, "respondsToSelector:"))
  {
    v5 = 1;
  }
  else if (-[LocationRefinementViewController delegateProtocolHasInstanceMethod:](self, "delegateProtocolHasInstanceMethod:", a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
    v5 = objc_opt_respondsToSelector(v6, a3);

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  objc_super v10;

  if (-[LocationRefinementViewController delegateProtocolHasInstanceMethod:](self, "delegateProtocolHasInstanceMethod:")&& (v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate")), v6 = objc_opt_respondsToSelector(v5, a3), v5, (v6 & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LocationRefinementViewController;
    v8 = -[LocationRefinementViewController forwardingTargetForSelector:](&v10, "forwardingTargetForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  return v7;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v7, a2);

  if ((a2 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
    objc_msgSend(v8, "mapView:regionDidChangeAnimated:", v9, v4);

  }
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
    objc_msgSend(v6, "mapViewDidFinishLoadingMap:", v7);

  }
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController crosshairImageView](self, "crosshairImageView"));
  objc_msgSend(v7, "setHidden:", 0);

  -[LocationRefinementViewController updateCrosshairConstraints](self, "updateCrosshairConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewDelegate](self, "mapViewDelegate"));
    objc_msgSend(v9, "mapViewDidFinishRenderingMap:fullyRendered:", v10, v4);

  }
}

- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  double v18;
  CGPoint result;

  if (a5 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView", a3, a4.x, a4.y));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v7, "centerCoordinate");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v6, "convertCoordinate:toPointToView:", v12, v9, v11);
    x = v13;
    y = v15;

  }
  else
  {
    y = a4.y;
    x = a4.x;
  }
  v17 = x;
  v18 = y;
  result.y = v18;
  result.x = v17;
  return result;
}

@end
