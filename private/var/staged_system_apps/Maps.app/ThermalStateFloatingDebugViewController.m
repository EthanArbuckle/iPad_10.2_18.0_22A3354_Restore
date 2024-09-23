@implementation ThermalStateFloatingDebugViewController

+ (ThermalStateFloatingDebugViewController)sharedInstance
{
  if (qword_1014D30C8 != -1)
    dispatch_once(&qword_1014D30C8, &stru_1011C5858);
  return (ThermalStateFloatingDebugViewController *)(id)qword_1014D30C0;
}

- (ThermalStateFloatingDebugViewController)init
{
  ThermalStateFloatingDebugViewController *v2;
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v11;
  __int16 v12;
  unsigned int v13;

  v9.receiver = self;
  v9.super_class = (Class)ThermalStateFloatingDebugViewController;
  v2 = -[MapsFloatingDebugViewController init](&v9, "init");
  if (v2)
  {
    v3 = sub_100757F44();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
      v6 = objc_msgSend(v5, "currentThermalPressureLevel");
      *(_DWORD *)buf = 134349312;
      v11 = v2;
      v12 = 1024;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with thermal level: %d", buf, 0x12u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v7, "addThermalPressureObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v8;

  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  objc_msgSend(v5, "removeThermalPressureObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ThermalStateFloatingDebugViewController;
  -[ThermalStateFloatingDebugViewController dealloc](&v6, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *debugLabel;
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
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)ThermalStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("flame"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v6, "setImage:", v5);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", 9.0, UIFontWeightRegular));
  -[UILabel setFont:](v7, "setFont:", v8);

  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  debugLabel = self->_debugLabel;
  self->_debugLabel = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_debugLabel);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_debugLabel, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 5.0));
  v30[0] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -5.0));
  v30[1] = v20;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 5.0));
  v30[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_debugLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -5.0));
  v30[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  objc_msgSend(v28, "addObjectsFromArray:", v19);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);
}

+ (BOOL)shouldAttachOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kThermalStateFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)attach
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v8;

  v6.receiver = self;
  v6.super_class = (Class)ThermalStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v6, "attach");
  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Attaching", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("kThermalStateFloatingDebugViewControllerAttachedKey"));

}

- (void)detach
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v8;

  v6.receiver = self;
  v6.super_class = (Class)ThermalStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v6, "detach");
  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Detaching", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("kThermalStateFloatingDebugViewControllerAttachedKey"));

}

- (id)tintColor
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v3 = objc_msgSend(v2, "currentThermalPressureLevel");

  if (v3 < 0x1E)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    v6 = objc_msgSend(v5, "currentThermalPressureLevel");

    if (v6 < 0x14)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
      v8 = objc_msgSend(v7, "currentThermalPressureLevel");

      if (v8 < 0xA)
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
      else
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  }
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.699999988));

  return v10;
}

- (id)iconText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Thermal: %d"), objc_msgSend(v2, "currentThermalPressureLevel")));

  return v3;
}

- (id)debugText
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  __objc2_class **v25;
  void *i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  void *v43;
  id v44;
  id v45;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];

  if (qword_1014D30D0 != -1)
    dispatch_once(&qword_1014D30D0, &stru_1011C5878);
  v60[0] = NSForegroundColorAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v61[0] = v2;
  v60[1] = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v61[1] = v3;
  v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_1011EB268, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D30D8, "stringFromDate:", v6));
  v47 = (void *)v4;
  v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v4);
  objc_msgSend(v5, "appendAttributedString:", v9);

  v58[0] = NSForegroundColorAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v58[1] = NSFontAttributeName;
  v59[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v59[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));

  v13 = objc_alloc((Class)NSAttributedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nThermal state: %d"), objc_msgSend(v14, "currentThermalPressureLevel")));
  v16 = objc_msgSend(v13, "initWithString:attributes:", v15, v12);
  v50 = v5;
  objc_msgSend(v5, "appendAttributedString:", v16);

  v56[0] = NSForegroundColorAttributeName;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v56[1] = NSFontAttributeName;
  v57[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v57[1] = v18;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedScenes"));

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v52;
    v25 = off_101198000;
    v48 = v21;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v28 = objc_opt_class(v25[144]);
        if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
        {
          v29 = v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "delegate"));
          v31 = objc_opt_class(MapsSceneDelegate);
          isKindOfClass = objc_opt_isKindOfClass(v30, v31);

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "delegate"));
          v34 = v33;
          if ((isKindOfClass & 1) != 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "chromeViewController"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mapView"));

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_mapLayer"));
              v38 = objc_alloc((Class)NSAttributedString);
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\n📱VKMapView[%p]\nNavigation display rate: %ld\nRegular display rate: %ld"), v37, objc_msgSend(v37, "navigationDisplayRate"), objc_msgSend(v37, "displayRate")));
              v40 = v38;
              goto LABEL_15;
            }
            goto LABEL_16;
          }
          v41 = objc_opt_class(CarSceneDelegate);
          v42 = objc_opt_isKindOfClass(v34, v41);

          if ((v42 & 1) != 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "delegate"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "carChromeViewController"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "mapView"));

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_mapLayer"));
              v44 = objc_alloc((Class)NSAttributedString);
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\n🚗VKMapView[%p]\nNavigation display rate: %ld\nRegular display rate: %ld"), v37, objc_msgSend(v37, "navigationDisplayRate"), objc_msgSend(v37, "displayRate")));
              v40 = v44;
LABEL_15:
              v45 = objc_msgSend(v40, "initWithString:attributes:", v39, v49);
              objc_msgSend(v50, "appendAttributedString:", v45);

              v21 = v48;
              v25 = off_101198000;
            }
LABEL_16:

          }
          continue;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v23);
  }

  return v50;
}

- (void)updateViewForCurrentState
{
  id v3;
  NSObject *v4;
  int64_t v5;
  int64_t v6;
  objc_super v7;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v9;
  __int16 v10;
  int64_t v11;

  v7.receiver = self;
  v7.super_class = (Class)ThermalStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v7, "updateViewForCurrentState");
  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[MapsFloatingDebugViewController viewState](self, "viewState");
    *(_DWORD *)buf = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating view for state: %ld", buf, 0x16u);
  }

  v6 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v6 == 1)
  {
    -[ThermalStateFloatingDebugViewController updateDebugText](self, "updateDebugText");
    -[ThermalStateFloatingDebugViewController startDebugInfoRefreshTimer](self, "startDebugInfoRefreshTimer");
  }
  else if (!v6)
  {
    -[ThermalStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", 0);
  }
}

- (void)updateDebugText
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ThermalStateFloatingDebugViewController view](self, "view"));
  objc_msgSend(v3, "setHidden:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ThermalStateFloatingDebugViewController debugText](self, "debugText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ThermalStateFloatingDebugViewController debugLabel](self, "debugLabel"));
  objc_msgSend(v4, "setAttributedText:", v5);

}

- (void)startDebugInfoRefreshTimer
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v10;

  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Starting periodic refresh timer", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100759020;
  v7[3] = &unk_1011AE190;
  objc_copyWeak(&v8, (id *)buf);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v7, 0.5));
  -[ThermalStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (id)additionalLongPressActions
{
  void *v2;
  void *v3;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  void *v11;

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100759190;
  v8 = &unk_1011AFA88;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("File a radar"), 0, &v5));
  v11 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v5, v6, v7, v8));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (void)composeTTR
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MapsRadarDraft *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v14;

  v3 = sub_100757F44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Launching TTR", buf, 0xCu);
  }

  v5 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSZZZ"));
  v6 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v5, "setLocale:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timestamp: %@\n\nSummary:\n\nSteps to Reproduce:\n\nResults:\n"), v8));

  v10 = objc_opt_new(MapsRadarDraft);
  -[MapsRadarDraft setTitle:](v10, "setTitle:", CFSTR("[Thermal]: "));
  -[MapsRadarDraft setDescriptionText:](v10, "setDescriptionText:", v9);
  -[MapsRadarDraft setClassification:](v10, "setClassification:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarComponent mapsClientComponent](MapsRadarComponent, "mapsClientComponent"));
  -[MapsRadarDraft setComponent:](v10, "setComponent:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v12, "launchTTRWithRadar:", v10);

}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  ThermalStateFloatingDebugViewController *v10;
  __int16 v11;
  uint64_t v12;

  v5 = sub_100757F44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v10 = self;
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Thermal state changed: %llu", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007594AC;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
}

- (GCDTimer)debugInfoRefreshTimer
{
  return self->_debugInfoRefreshTimer;
}

- (void)setDebugInfoRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end
