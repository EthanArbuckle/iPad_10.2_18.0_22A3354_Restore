@implementation CarSmallWidgetRouteGeniusModeController

- (CarSmallWidgetRouteGeniusModeController)initWithSuggestion:(id)a3
{
  id v5;
  CarSmallWidgetRouteGeniusModeController *v6;
  CarSmallWidgetRouteGeniusModeController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarSmallWidgetRouteGeniusModeController;
  v6 = -[CarSmallWidgetRouteGeniusModeController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentSuggestion, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    objc_msgSend(v8, "registerObserver:", v7);

  }
  return v7;
}

- (void)_setupRouteGeniusCardIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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
  _QWORD v113[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));

      if (v7)
        return;
    }
    else
    {

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetRouteGeniusView"));

  v9 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CarSmallWidgetRouteGeniusModeController setImageView:](self, "setImageView:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("ImageView"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  objc_msgSend(v16, "addSubview:", v17);

  v18 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CarSmallWidgetRouteGeniusModeController setTitleLabel:](self, "setTitleLabel:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v21, "setTextColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleCallout, 1280));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v23, "setFont:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v24, "setAdjustsFontForContentSizeCategory:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CarSmallWidgetRouteGeniusModeController setSubtitleLabel:](self, "setSubtitleLabel:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v31, "setTextColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleCaption1, 256));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v33, "setFont:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v35, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v36, "addSubview:", v37);

  v38 = objc_alloc_init((Class)UILayoutGuide);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  objc_msgSend(v39, "addLayoutGuide:", v38);

  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "safeAreaLayoutGuide"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v109));
  v113[0] = v108;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "safeAreaLayoutGuide"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintGreaterThanOrEqualToAnchor:", v104));
  v113[1] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "safeAreaLayoutGuide"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v113[2] = v98;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "safeAreaLayoutGuide"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "bottomAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintGreaterThanOrEqualToAnchor:", v94));
  v113[3] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "heightAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToConstant:", 65.0));
  v113[4] = v91;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerYAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "safeAreaLayoutGuide"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerYAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v87));
  v113[5] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 13.0));
  v113[6] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "centerYAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerYAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v113[7] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "widthAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToConstant:", 40.0));
  v113[8] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "heightAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "widthAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v113[9] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "firstBaselineAnchor"));
  v82 = v38;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 30.0));
  v113[10] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController imageView](self, "imageView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 8.0));
  v113[11] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 8.0));
  v113[12] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstBaselineAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lastBaselineAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 17.0));
  v113[13] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  v113[14] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v47));
  v113[15] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v49);

}

- (void)_updateRouteGeniusCardContents
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __CFString *v12;
  void *v13;
  _QWORD v14[5];

  -[CarSmallWidgetRouteGeniusModeController _setupRouteGeniusCardIfNeeded](self, "_setupRouteGeniusCardIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCarCache](MapsUIImageCache, "sharedCarCache"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10088990C;
  v14[3] = &unk_1011BAA70;
  v14[4] = self;
  objc_msgSend(v4, "getImageForCarSmallWidget:completion:", v3, v14);

  -[MapsSuggestionsRouteGeniusEntry etaInSeconds](self->_currentSuggestion, "etaInSeconds");
  LODWORD(v6) = vcvtpd_u64_f64(v5 / 60.0);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithMinutes:andAbbreviationType:](NSString, "_navigation_stringWithMinutes:andAbbreviationType:", v6, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "setText:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController _car_smallWidgetName](self, "_car_smallWidgetName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v10, "setText:", v9);
LABEL_8:

    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController _car_smallWidgetName](self, "_car_smallWidgetName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setText:", v9);

  v11 = -[CarSmallWidgetRouteGeniusModeController _isHomeOrWorkSuggestion:](self, "_isHomeOrWorkSuggestion:", self->_currentSuggestion);
  if ((v11 & 1) != 0)
  {
    v12 = &stru_1011EB268;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortAddress"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetRouteGeniusModeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v13, "setText:", v12);

  if ((v11 & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)_isHomeOrWorkSuggestion:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry", a3));
  v4 = (unint64_t)objc_msgSend(v3, "type");

  return (v4 < 7) & (0x46u >> v4);
}

- (id)_car_smallWidgetName
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v3, "geoMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  LOBYTE(v3) = -[CarSmallWidgetRouteGeniusModeController _isHomeOrWorkSuggestion:](self, "_isHomeOrWorkSuggestion:", self->_currentSuggestion);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v7 = v6;
  if ((v3 & 1) != 0 || !v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoMapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  }
  return v9;
}

- (BOOL)showsMapView
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100889AD4;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService", a3, a4));
  objc_msgSend(v5, "unregisterObserver:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeGeniusManager"));
  objc_msgSend(v6, "deactivateForAllChromes");

}

- (void)setCurrentSuggestion:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
  if (self->_currentSuggestion)
  {
    -[CarSmallWidgetRouteGeniusModeController _updateRouteGeniusCardContents](self, "_updateRouteGeniusCardContents");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v5, "endRouteGenius");

  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
