@implementation AirQualityConditionsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AirQualityConditionsViewController)initWithWeatherLocationDataProvider:(id)a3
{
  id v5;
  AirQualityConditionsViewController *v6;
  AirQualityConditionsViewController *v7;
  _TtC4Maps32AirQualityConditionsDataProvider *v8;
  _TtC4Maps32AirQualityConditionsDataProvider *airQualityConditionsDataProvider;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AirQualityConditionsViewController;
  v6 = -[AirQualityConditionsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    v8 = objc_alloc_init(_TtC4Maps32AirQualityConditionsDataProvider);
    airQualityConditionsDataProvider = v7->_airQualityConditionsDataProvider;
    v7->_airQualityConditionsDataProvider = v8;

    -[AirQualityConditionsDataProvider addObserver:](v7->_airQualityConditionsDataProvider, "addObserver:", v7);
    -[WeatherLocationDataProvider addObserver:](v7->_weatherLocationDataProvider, "addObserver:", v7->_airQualityConditionsDataProvider);
  }

  return v7;
}

- (BOOL)isEnabled
{
  return -[AirQualityConditionsDataProvider enabled](self->_airQualityConditionsDataProvider, "enabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[AirQualityConditionsDataProvider setEnabled:](self->_airQualityConditionsDataProvider, "setEnabled:", a3);
}

- (BOOL)isVisible
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  -[AirQualityConditionsViewController setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController delegate](self, "delegate"));
  objc_msgSend(v7, "airQualityConditionsViewController:makeVisible:animated:", self, v5, v4);

}

- (void)setAirQualityConditions:(id)a3
{
  AirQualityConditions *v5;
  AirQualityConditions *v6;

  v5 = (AirQualityConditions *)a3;
  if (self->_airQualityConditions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_airQualityConditions, a3);
    -[AirQualityConditionsViewController _updateSubviews](self, "_updateSubviews");
    -[AirQualityConditionsViewController setVisible:animated:](self, "setVisible:animated:", -[AirQualityConditionsViewController _shouldShowAirQualityConditions](self, "_shouldShowAirQualityConditions"), 1);
    v5 = v6;
  }

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[AirQualityConditionsViewController setView:](self, "setView:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("AirQualityConditionsView"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AirQualityConditionsViewController;
  -[AirQualityConditionsViewController viewDidLoad](&v6, "viewDidLoad");
  -[AirQualityConditionsViewController _createSubviews](self, "_createSubviews");
  -[AirQualityConditionsViewController _updateSubviews](self, "_updateSubviews");
  -[AirQualityConditionsViewController _setupConstraints](self, "_setupConstraints");
  -[AirQualityConditionsViewController setVisible:animated:](self, "setVisible:animated:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager settingsUpdatedNotification](WeatherSettingsManager, "settingsUpdatedNotification"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_toggleAirQualityConditionsVisibility", v5, 0);

}

- (void)clearSavedLocation
{
  -[AirQualityConditionsDataProvider weatherLocationDataProvider:didChangeLocation:](self->_airQualityConditionsDataProvider, "weatherLocationDataProvider:didChangeLocation:", self->_weatherLocationDataProvider, 0);
  -[AirQualityConditionsViewController setAirQualityConditions:](self, "setAirQualityConditions:", 0);
}

- (void)_toggleAirQualityConditionsVisibility
{
  -[AirQualityConditionsViewController setVisible:animated:](self, "setVisible:animated:", -[AirQualityConditionsViewController _shouldShowAirQualityConditions](self, "_shouldShowAirQualityConditions"), 1);
}

- (void)airQualityConditionsDataProviderDidChangeAirQualityConditions:(id)a3
{
  -[AirQualityConditionsViewController setAirQualityConditions:](self, "setAirQualityConditions:", a3);
}

- (BOOL)_shouldShowAirQualityConditions
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  v4 = objc_msgSend(v3, "shouldShowAirQualityConditions");

  if (self->_airQualityConditions)
    return v4;
  else
    return 0;
}

- (id)_airQualityIndex
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  __CFString *v7;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  _QWORD block[4];
  __CFString *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityConditions](self, "airQualityConditions"));

  if (!v3)
    return &stru_1011EB268;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityConditions](self, "airQualityConditions"));
  v5 = objc_msgSend(v4, "hasNumericalAirQualityIndex");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityConditions](self, "airQualityConditions"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%ld"), objc_msgSend(v6, "airQualityIndex")));

  }
  else
  {
    v7 = &stru_1011EB268;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AQI"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10));

  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v11, v7));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10069EB2C;
  block[3] = &unk_1011AC860;
  v13 = v11;
  v14 = v13;
  v20 = v13;
  if (qword_1014D2DD8 == -1)
  {
    v15 = v13;
  }
  else
  {
    dispatch_once(&qword_1014D2DD8, block);
    v15 = v20;
  }
  if (v5)
    v16 = v12;
  else
    v16 = v14;
  if (byte_1014D2DD0)
    v17 = v7;
  else
    v17 = v16;
  v18 = v17;

  return v18;
}

- (void)_createSubviews
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[AirQualityConditionsViewController setContentView:](self, "setContentView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setCornerRadius:", 5.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("AirQualityConditionsContent"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[AirQualityConditionsViewController setAqiCircleView:](self, "setAqiCircleView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("AirQualityConditionsCircleView"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  objc_msgSend(v17, "addSubview:", v18);

  v19 = objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[AirQualityConditionsViewController setAirQualityLabel:](self, "setAirQualityLabel:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v22 = objc_msgSend(v21, "CGColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v24, "setBackgroundColor:", v22);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v25, "setTextAlignment:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController _airQualityIndex](self, "_airQualityIndex"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v27, "setText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("AirQualityConditionsTitleLabel"));

  v30 = (id)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v30, "addSubview:", v29);

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
  NSLayoutConstraint *aqiCircleViewHeightConstraint;
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
  _QWORD v70[5];
  _QWORD v71[8];

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 0.0));
  -[AirQualityConditionsViewController setAqiCircleViewHeightConstraint:](self, "setAqiCircleViewHeightConstraint:", v5);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v61));
  v71[0] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
  v71[1] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v41));
  v71[2] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 4.0));
  v71[3] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v71[4] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v7));
  v71[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  aqiCircleViewHeightConstraint = self->_aqiCircleViewHeightConstraint;
  v71[6] = v13;
  v71[7] = aqiCircleViewHeightConstraint;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 8));
  objc_msgSend(v69, "addObjectsFromArray:", v15);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerXAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "centerXAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v62));
  v70[0] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v52));
  v70[1] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
  v70[2] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v18));
  v70[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v23));
  v70[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 5));
  objc_msgSend(v69, "addObjectsFromArray:", v25);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v69);
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController _font](self, "_font"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v3, "setFont:", v19);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme weatherWidgetTextColor](MapsTheme, "weatherWidgetTextColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = sub_1002A8AA0(self);
  v7 = 7.5;
  if (v6 == 5)
    v7 = 8.5;
  objc_msgSend(v19, "_mapkit_scaledValueForValue:", v7);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleViewHeightConstraint](self, "aqiCircleViewHeightConstraint"));
  objc_msgSend(v10, "setConstant:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "setCornerRadius:", v9 * 0.5);

  if (-[AirQualityConditionsViewController _shouldShowAirQualityConditions](self, "_shouldShowAirQualityConditions"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController _airQualityIndex](self, "_airQualityIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController airQualityLabel](self, "airQualityLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[AirQualityConditions color](self->_airQualityConditions, "color")));
    v16 = objc_msgSend(v15, "CGColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AirQualityConditionsViewController aqiCircleView](self, "aqiCircleView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v18, "setBackgroundColor:", v16);

  }
}

- (id)_font
{
  uint64_t v2;
  double v3;
  void *v4;
  void *v5;

  v2 = sub_1002A8AA0(self);
  v3 = 10.0;
  if (v2 == 5)
    v3 = 12.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:weight:grade:](UIFont, "_maps_systemFontWithSize:weight:grade:", 3, v3, UIFontWeightMedium));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_cappedFont:withMaxPoint:](UIFont, "_maps_cappedFont:withMaxPoint:", v4, 18.0));

  return v5;
}

- (AirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (AirQualityConditionsViewControllerDelegate)delegate
{
  return (AirQualityConditionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)aqiCircleView
{
  return self->_aqiCircleView;
}

- (void)setAqiCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_aqiCircleView, a3);
}

- (_MKUILabel)airQualityLabel
{
  return self->_airQualityLabel;
}

- (void)setAirQualityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityLabel, a3);
}

- (NSLayoutConstraint)aqiCircleViewHeightConstraint
{
  return self->_aqiCircleViewHeightConstraint;
}

- (void)setAqiCircleViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_aqiCircleViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aqiCircleViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_airQualityLabel, 0);
  objc_storeStrong((id *)&self->_aqiCircleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_airQualityConditionsDataProvider, 0);
}

@end
