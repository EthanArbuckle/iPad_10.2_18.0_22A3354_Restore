@implementation VectorKitFloatingDebugViewController

+ (VectorKitFloatingDebugViewController)sharedInstance
{
  if (qword_1014D3910 != -1)
    dispatch_once(&qword_1014D3910, &stru_1011DB838);
  return (VectorKitFloatingDebugViewController *)(id)qword_1014D3908;
}

- (VectorKitFloatingDebugViewController)init
{
  VectorKitFloatingDebugViewController *v2;
  void *v3;
  uint64_t v4;
  PlatformController *platformController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VectorKitFloatingDebugViewController;
  v2 = -[MapsFloatingDebugViewController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));
    platformController = v2->_platformController;
    v2->_platformController = (PlatformController *)v4;

  }
  return v2;
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
  v29.super_class = (Class)VectorKitFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("map.fill"), v3));
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
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kVectorKitFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)attach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VectorKitFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v3, "attach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("kVectorKitFloatingDebugViewControllerAttachedKey"));

}

- (void)detach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VectorKitFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v3, "detach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("kVectorKitFloatingDebugViewControllerAttachedKey"));

}

- (void)updateViewForCurrentState
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VectorKitFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v4, "updateViewForCurrentState");
  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3 == 1)
  {
    -[VectorKitFloatingDebugViewController updateDebugText](self, "updateDebugText");
    -[VectorKitFloatingDebugViewController startDebugInfoRefreshTimer](self, "startDebugInfoRefreshTimer");
  }
  else if (!v3)
  {
    -[VectorKitFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", 0);
  }
}

- (id)tintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor magentaColor](UIColor, "magentaColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.699999988));

  return v3;
}

- (id)iconText
{
  return CFSTR("VKMapView");
}

- (id)debugText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  if (qword_1014D3918 != -1)
    dispatch_once(&qword_1014D3918, &stru_1011DB858);
  v25[0] = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v26[0] = v3;
  v25[1] = NSFontAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v26[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));

  v6 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_1011EB268, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = objc_alloc((Class)NSAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3920, "stringFromDate:", v7));
  v10 = objc_msgSend(v8, "initWithString:attributes:", v9, v5);
  objc_msgSend(v6, "appendAttributedString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VectorKitFloatingDebugViewController platformController](self, "platformController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_mapLayer"));

  v23[0] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v23[1] = NSFontAttributeName;
  v24[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v24[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));

  v18 = objc_alloc((Class)NSAttributedString);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugLabelString:", 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nVKMapView:\n%@"), v19));
  v21 = objc_msgSend(v18, "initWithString:attributes:", v20, v17);
  objc_msgSend(v6, "appendAttributedString:", v21);

  return v6;
}

- (void)updateDebugText
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VectorKitFloatingDebugViewController view](self, "view"));
  objc_msgSend(v3, "setHidden:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[VectorKitFloatingDebugViewController debugText](self, "debugText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VectorKitFloatingDebugViewController debugLabel](self, "debugLabel"));
  objc_msgSend(v4, "setAttributedText:", v5);

}

- (void)startDebugInfoRefreshTimer
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1008F73B4;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 0.5));
  -[VectorKitFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
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
  objc_storeStrong((id *)&self->_platformController, 0);
}

@end
