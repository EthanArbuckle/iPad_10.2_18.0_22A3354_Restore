@implementation WeatherConditionsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WeatherConditionsViewController)initWithWeatherLocationDataProvider:(id)a3
{
  id v5;
  WeatherConditionsViewController *v6;
  WeatherConditionsViewController *v7;
  _TtC4Maps29WeatherConditionsDataProvider *v8;
  _TtC4Maps29WeatherConditionsDataProvider *weatherConditionsDataProvider;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WeatherConditionsViewController;
  v6 = -[WeatherConditionsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    v8 = -[WeatherConditionsDataProvider initWithTraitEnvironment:]([_TtC4Maps29WeatherConditionsDataProvider alloc], "initWithTraitEnvironment:", v7);
    weatherConditionsDataProvider = v7->_weatherConditionsDataProvider;
    v7->_weatherConditionsDataProvider = v8;

    -[WeatherConditionsDataProvider addObserver:](v7->_weatherConditionsDataProvider, "addObserver:", v7);
    -[WeatherLocationDataProvider addObserver:](v7->_weatherLocationDataProvider, "addObserver:", v7->_weatherConditionsDataProvider);
  }

  return v7;
}

- (BOOL)isVisible
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  -[WeatherConditionsViewController setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController delegate](self, "delegate"));
  objc_msgSend(v7, "weatherConditionsViewController:makeVisible:animated:", self, v5, v4);

}

- (BOOL)isEnabled
{
  return -[WeatherConditionsDataProvider enabled](self->_weatherConditionsDataProvider, "enabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[WeatherConditionsDataProvider setEnabled:](self->_weatherConditionsDataProvider, "setEnabled:", a3);
}

- (void)setWeatherConditions:(id)a3
{
  WeatherConditions *v5;
  WeatherConditions *v6;

  v5 = (WeatherConditions *)a3;
  if (self->_weatherConditions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_weatherConditions, a3);
    -[WeatherConditionsViewController _updateSubviews](self, "_updateSubviews");
    -[WeatherConditionsViewController setVisible:animated:](self, "setVisible:animated:", -[WeatherConditionsViewController _shouldShowWeatherConditions](self, "_shouldShowWeatherConditions"), 1);
    v5 = v6;
  }

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[WeatherConditionsViewController setView:](self, "setView:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("WeatherConditionsView"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WeatherConditionsViewController;
  -[WeatherConditionsViewController viewDidLoad](&v6, "viewDidLoad");
  -[WeatherConditionsViewController _createSubviews](self, "_createSubviews");
  -[WeatherConditionsViewController _updateSubviews](self, "_updateSubviews");
  -[WeatherConditionsViewController _setupConstraints](self, "_setupConstraints");
  -[WeatherConditionsViewController setVisible:animated:](self, "setVisible:animated:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager settingsUpdatedNotification](WeatherSettingsManager, "settingsUpdatedNotification"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_toggleWeatherConditionsVisibility", v5, 0);

}

- (void)clearSavedLocation
{
  -[WeatherConditionsDataProvider weatherLocationDataProvider:didChangeLocation:](self->_weatherConditionsDataProvider, "weatherLocationDataProvider:didChangeLocation:", self->_weatherLocationDataProvider, 0);
  -[WeatherConditionsViewController setWeatherConditions:](self, "setWeatherConditions:", 0);
}

- (void)_toggleWeatherConditionsVisibility
{
  -[WeatherConditionsViewController setVisible:animated:](self, "setVisible:animated:", -[WeatherConditionsViewController _shouldShowWeatherConditions](self, "_shouldShowWeatherConditions"), 1);
}

- (void)weatherConditionsDataProviderDidChangeWeatherConditions:(id)a3
{
  -[WeatherConditionsViewController setWeatherConditions:](self, "setWeatherConditions:", a3);
}

- (BOOL)_shouldShowWeatherConditions
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  v4 = objc_msgSend(v3, "shouldShowWeatherConditions");

  if (self->_weatherConditions)
    return v4;
  else
    return 0;
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
  MapsThemeImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MapsThemeLabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id location;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[WeatherConditionsViewController setContentView:](self, "setContentView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("WeatherConditionsContent"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = -[MapsThemeImageView initWithFrame:]([MapsThemeImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[WeatherConditionsViewController setImageView:](self, "setImageView:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  objc_msgSend(v13, "setContentMode:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("WeatherConditionsImageView"));

  if (sub_1002A8AA0(self) == 5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme weatherWidgetTextColor](MapsTheme, "weatherWidgetTextColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
    objc_msgSend(v17, "setTintColor:", v16);

  }
  v18 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[WeatherConditionsViewController setTitleLabel:](self, "setTitleLabel:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme weatherWidgetTextColor](MapsTheme, "weatherWidgetTextColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v21, "setTextColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("WeatherConditionsTitleLabel"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  LODWORD(v24) = 1148846080;
  objc_msgSend(v23, "setContentHuggingPriority:forAxis:", 1, v24);

  objc_initWeak(&location, self);
  objc_copyWeak(&v31, &location);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView", _NSConcreteStackBlock, 3221225472, sub_100888154, &unk_1011D9EC8));
  objc_msgSend(v25, "setImageProvider:", &v30);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v28, "addSubview:", v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
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
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[5];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  v3 = _NSDictionaryOfVariableBindings(CFSTR("imageView, titleLabel"), v53, v54, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v45));
  v59[0] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:", v40));
  v59[1] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerXAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v59[2] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v5));
  v59[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v59[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 5));
  objc_msgSend(v56, "addObjectsFromArray:", v12);

  if (sub_1002A8AA0(self) == 5)
    v13 = CFSTR("H:|[imageView]-(3)-[titleLabel]|");
  else
    v13 = CFSTR("H:|[imageView][titleLabel]|");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v13, 0, 0, v55));
  objc_msgSend(v56, "addObjectsFromArray:", v14);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v48));
  v58[0] = v46;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  v58[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "heightAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v20, 1.0));
  v58[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 3));
  objc_msgSend(v56, "addObjectsFromArray:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  v57[0] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v57[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
  objc_msgSend(v56, "addObjectsFromArray:", v31);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController _titleFont](self, "_titleFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController imageView](self, "imageView"));
  objc_msgSend(v5, "updateTheme");

  if (-[WeatherConditionsViewController _shouldShowWeatherConditions](self, "_shouldShowWeatherConditions"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController weatherConditions](self, "weatherConditions"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "temperature"));
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1011EB268;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherConditionsViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v9, "setText:", v8);

  }
}

- (id)_titleFont
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (sub_1002A8AA0(self) == 5)
    v2 = objc_claimAutoreleasedReturnValue(+[UIFont system20Light](UIFont, "system20Light"));
  else
    v2 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 18.0, UIFontWeightRegular));
  v3 = (void *)v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_cappedFont:withMaxPoint:](UIFont, "_maps_cappedFont:withMaxPoint:", v2, 27.0));

  return v4;
}

- (WeatherConditionsViewControllerDelegate)delegate
{
  return (WeatherConditionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WeatherConditions)weatherConditions
{
  return self->_weatherConditions;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (MapsThemeImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (MapsThemeLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_weatherConditions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_weatherConditionsDataProvider, 0);
}

@end
