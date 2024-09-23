@implementation RoutePlanningElevationPopoverViewController

- (void)viewDidLoad
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  DirectionsElevationGraphConfiguration *v9;
  void *v10;
  DirectionsElevationGraphView *v11;
  DirectionsElevationGraphView *elevationGraphView;
  DirectionsElevationGraphView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  DirectionsElevationLabelView *v17;
  DirectionsElevationLabelView *ascentLabelView;
  DirectionsElevationLabelView *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  DirectionsElevationLabelView *v33;
  DirectionsElevationLabelView *descentLabelView;
  DirectionsElevationLabelView *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
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
  DirectionsElevationGraphConfiguration *v96;
  id v97;
  objc_super v98;
  _QWORD v99[12];
  _QWORD v100[2];
  _QWORD v101[2];

  v98.receiver = self;
  v98.super_class = (Class)RoutePlanningElevationPopoverViewController;
  -[RoutePlanningElevationPopoverViewController viewDidLoad](&v98, "viewDidLoad");
  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v7);

  v9 = [DirectionsElevationGraphConfiguration alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController traitCollection](self, "traitCollection"));
  v96 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v9, "initWithUseType:userInterfaceIdiom:", 0, objc_msgSend(v10, "userInterfaceIdiom"));

  v11 = -[DirectionsElevationGraphView initWithConfiguration:]([DirectionsElevationGraphView alloc], "initWithConfiguration:", v96);
  elevationGraphView = self->_elevationGraphView;
  self->_elevationGraphView = v11;

  -[DirectionsElevationGraphView setTranslatesAutoresizingMaskIntoConstraints:](self->_elevationGraphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_elevationGraphView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
  -[GEOComposedRoute distance](self->_route, "distance");
  -[DirectionsElevationGraphView setElevationProfile:routeLength:](v13, "setElevationProfile:routeLength:", v14);

  objc_msgSend(v7, "addSubview:", self->_elevationGraphView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2));

  v16 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v95, 0.0));
  v17 = -[DirectionsElevationLabelView initWithStyle:]([DirectionsElevationLabelView alloc], "initWithStyle:", 0);
  ascentLabelView = self->_ascentLabelView;
  self->_ascentLabelView = v17;

  v19 = self->_ascentLabelView;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v93 = (void *)v16;
  -[DirectionsElevationLabelView setFont:color:](v19, "setFont:color:", v16, v20);

  v21 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v21, "setNumberOfLines:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v21, "setFont:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Total Ascent [Elevation, Detail, Mac]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v21, "setText:", v24);

  v94 = v21;
  LODWORD(v25) = 1148829696;
  objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 0, v25);
  v26 = objc_alloc((Class)UIStackView);
  v101[0] = self->_ascentLabelView;
  v101[1] = v21;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 2));
  v28 = objc_msgSend(v26, "initWithArrangedSubviews:", v27);

  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v28, "setAxis:", 1);
  objc_msgSend(v28, "setDistribution:", 0);
  objc_msgSend(v28, "setAlignment:", 0);
  objc_msgSend(v28, "setSpacing:", 4.0);
  LODWORD(v29) = 1148846080;
  objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 0, v29);
  LODWORD(v30) = 1148846080;
  objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 1, v30);
  LODWORD(v31) = 1148846080;
  objc_msgSend(v28, "setContentCompressionResistancePriority:forAxis:", 1, v31);
  v32 = v28;
  objc_msgSend(v7, "addSubview:", v28);
  v33 = -[DirectionsElevationLabelView initWithStyle:]([DirectionsElevationLabelView alloc], "initWithStyle:", 1);
  descentLabelView = self->_descentLabelView;
  self->_descentLabelView = v33;

  v35 = self->_descentLabelView;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[DirectionsElevationLabelView setFont:color:](v35, "setFont:color:", v16, v36);

  v37 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v37, "setNumberOfLines:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v92 = v37;
  objc_msgSend(v37, "setFont:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Total Descent [Elevation, Detail, Mac]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v37, "setText:", v40);

  LODWORD(v41) = 1148829696;
  objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 0, v41);
  v42 = objc_alloc((Class)UIStackView);
  v100[0] = self->_descentLabelView;
  v100[1] = v37;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 2));
  v44 = objc_msgSend(v42, "initWithArrangedSubviews:", v43);

  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v44, "setAxis:", 1);
  objc_msgSend(v44, "setDistribution:", 0);
  objc_msgSend(v44, "setAlignment:", 0);
  objc_msgSend(v44, "setSpacing:", 4.0);
  LODWORD(v45) = 1148846080;
  objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 0, v45);
  LODWORD(v46) = 1148846080;
  objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 1, v46);
  LODWORD(v47) = 1148846080;
  objc_msgSend(v44, "setContentCompressionResistancePriority:forAxis:", 1, v47);
  objc_msgSend(v7, "addSubview:", v44);
  -[RoutePlanningElevationPopoverViewController _updateLabels](self, "_updateLabels");
  v97 = objc_alloc_init((Class)NSMutableArray);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController view](self, "view"));
  LODWORD(v49) = 1148846080;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v48, 40.0, 40.0, 40.0, 30.0, v49));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allConstraints"));
  objc_msgSend(v97, "addObjectsFromArray:", v51);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView topAnchor](self->_elevationGraphView, "topAnchor"));
  v52 = v7;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
  v99[0] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView leadingAnchor](self->_elevationGraphView, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v99[1] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView trailingAnchor](self->_elevationGraphView, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v99[2] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView widthAnchor](self->_elevationGraphView, "widthAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:", 320.0));
  v99[3] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView heightAnchor](self->_elevationGraphView, "heightAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToConstant:", 120.0));
  v99[4] = v78;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView bottomAnchor](self->_elevationGraphView, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 20.0));
  v99[5] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v99[6] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 35.0));
  v99[7] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v66));
  v99[8] = v65;
  v79 = v7;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v53 = v32;
  v77 = v32;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:", v63));
  v99[9] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
  v99[10] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:", v59));
  v99[11] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 12));
  objc_msgSend(v97, "addObjectsFromArray:", v61);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v97);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController view](self, "view"));
  objc_msgSend(v62, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[RoutePlanningElevationPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setRoute:(id)a3
{
  DirectionsElevationGraphView *elevationGraphView;
  void *v6;
  GEOComposedRoute *v7;

  v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    -[RoutePlanningElevationPopoverViewController _updateLabels](self, "_updateLabels");
    elevationGraphView = self->_elevationGraphView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](v7, "elevationProfile"));
    -[GEOComposedRoute distance](v7, "distance");
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](elevationGraphView, "setElevationProfile:routeLength:", v6);

  }
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;
  NSObject *v9;
  RoutePlanningElevationPopoverViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DirectionsElevationLabelView *ascentLabelView;
  id v18;
  void *v19;
  id v20;
  DirectionsElevationLabelView *descentLabelView;
  id v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v5 = (double)objc_msgSend(v4, "sumElevationGainCm") / 100.0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v7 = (double)objc_msgSend(v6, "sumElevationLossCm") / 100.0;

  }
  else
  {
    v7 = 0.0;
    v5 = 0.0;
  }
  v8 = sub_100432CAC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningElevationPopoverViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_10;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ | Will update labels for gain/loss", buf, 0xCu);

  }
  ascentLabelView = self->_ascentLabelView;
  v18 = objc_alloc((Class)NSMeasurement);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v20 = objc_msgSend(v18, "initWithDoubleValue:unit:", v19, v5);
  -[DirectionsElevationLabelView setElevation:](ascentLabelView, "setElevation:", v20);

  descentLabelView = self->_descentLabelView;
  v22 = objc_alloc((Class)NSMeasurement);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v24 = objc_msgSend(v22, "initWithDoubleValue:unit:", v23, v7);
  -[DirectionsElevationLabelView setElevation:](descentLabelView, "setElevation:", v24);

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_descentLabelView, 0);
  objc_storeStrong((id *)&self->_ascentLabelView, 0);
  objc_storeStrong((id *)&self->_elevationGraphView, 0);
}

@end
