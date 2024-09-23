@implementation MapsARSessionIndoorOutdoorFloatingDebugViewController

+ (MapsARSessionIndoorOutdoorFloatingDebugViewController)sharedInstance
{
  if (qword_1014D38C0 != -1)
    dispatch_once(&qword_1014D38C0, &stru_1011DB518);
  return (MapsARSessionIndoorOutdoorFloatingDebugViewController *)(id)qword_1014D38B8;
}

- (MapsARSessionIndoorOutdoorFloatingDebugViewController)init
{
  MapsARSessionIndoorOutdoorFloatingDebugViewController *v2;
  MapsRingBuffer *v3;
  MapsRingBuffer *confidenceRingBuffer;
  NSDate *lastUIUpdate;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  v2 = -[MapsFloatingDebugViewController init](&v9, "init");
  if (v2)
  {
    v3 = -[MapsRingBuffer initWithLength:]([MapsRingBuffer alloc], "initWithLength:", 10);
    confidenceRingBuffer = v2->_confidenceRingBuffer;
    v2->_confidenceRingBuffer = v3;

    lastUIUpdate = v2->_lastUIUpdate;
    v2->_lastUIUpdate = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
    -[MapsARSessionIndoorOutdoorFloatingDebugViewController setSession:](v2, "setSession:", v7);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  -[MapsARSessionIndoorOutdoorFloatingDebugViewController dealloc](&v3, "dealloc");
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
  v29.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("camera.metering.unknown"), v3));
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)tintColor
{
  MapsARSessionIndoorOutdoorFloatingDebugViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController confidenceRingBuffer](v2, "confidenceRingBuffer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("indoor")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("outdoor")));
  objc_msgSend(v5, "floatValue");
  if (v7 >= 0.9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor brownColor](UIColor, "brownColor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.699999988));
  }
  else
  {
    objc_msgSend(v6, "floatValue");
    if (v8 >= 0.9)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](UIColor, "systemDarkGreenColor"));
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.699999988));
  }
  v11 = (void *)v10;

  objc_sync_exit(v2);
  return v11;
}

- (id)iconText
{
  return CFSTR("Indoor/outdoor");
}

+ (BOOL)shouldAttachOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)attach
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v4, "attach");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"));

  -[ARSession _addObserver:](self->_session, "_addObserver:", self);
  -[MapsARSessionIndoorOutdoorFloatingDebugViewController updateDebugText](self, "updateDebugText");
}

- (void)detach
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v4, "detach");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"));

  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
}

- (void)updateViewForCurrentState
{
  int64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v5, "updateViewForCurrentState");
  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3)
  {
    if (v3 != 1)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    objc_msgSend(v4, "requestSessionWithOwner:", self);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    objc_msgSend(v4, "resignSessionWithOwner:", self);
  }

}

- (void)setSession:(id)a3
{
  ARSession *v5;
  ARSession *session;
  unsigned int v7;
  ARSession *v8;

  v5 = (ARSession *)a3;
  session = self->_session;
  if (session != v5)
  {
    v8 = v5;
    -[ARSession _removeObserver:](session, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_session, a3);
    v7 = -[MapsFloatingDebugViewController isAttached](self, "isAttached");
    v5 = v8;
    if (v7)
    {
      -[ARSession _addObserver:](self->_session, "_addObserver:", self);
      v5 = v8;
    }
  }

}

- (void)updateDebugText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  MapsARSessionIndoorOutdoorFloatingDebugViewController *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  MapsARSessionIndoorOutdoorFloatingDebugViewController *obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[2];

  if (qword_1014D38C8 != -1)
    dispatch_once(&qword_1014D38C8, &stru_1011DB538);
  v32[0] = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](UIColor, "cyanColor"));
  v33[0] = v3;
  v32[1] = NSFontAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v33[1] = v4;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_1011EB268, v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D38D0, "stringFromDate:", v6));
  v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v26);
  objc_msgSend(v5, "appendAttributedString:", v9);

  v10 = self;
  objc_sync_enter(v10);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController confidenceRingBuffer](v10, "confidenceRingBuffer"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v16 = objc_alloc((Class)NSAttributedString);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("indoor")));
        objc_msgSend(v17, "doubleValue");
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("outdoor")));
        objc_msgSend(v20, "doubleValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\nIndoor: %f\nOutdoor: %f"), v19, v21));
        v23 = objc_msgSend(v16, "initWithString:attributes:", v22, v26);
        objc_msgSend(v5, "appendAttributedString:", v23);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  objc_sync_exit(obj);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController debugLabel](obj, "debugLabel"));
  objc_msgSend(v24, "setAttributedText:", v5);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  MapsARSessionIndoorOutdoorFloatingDebugViewController *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id location;
  _QWORD v24[2];
  _QWORD v25[2];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "doubleForKey:", CFSTR("PedestrianARIndoorOutdoorDetectionInterval"));
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController lastUIUpdate](v8, "lastUIUpdate"));
  if (!v13
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController lastUIUpdate](v8, "lastUIUpdate")),
        objc_msgSend(v9, "timeIntervalSinceDate:", v14),
        v16 = v15,
        v14,
        v13,
        v16 >= v12))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionIndoorOutdoorFloatingDebugViewController confidenceRingBuffer](v8, "confidenceRingBuffer"));
    v24[0] = CFSTR("indoor");
    objc_msgSend(v7, "indoorConfidence");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v24[1] = CFSTR("outdoor");
    v25[0] = v18;
    objc_msgSend(v7, "outdoorConfidence");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v25[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    objc_msgSend(v17, "push:", v20);

    -[MapsARSessionIndoorOutdoorFloatingDebugViewController setLastUIUpdate:](v8, "setLastUIUpdate:", v9);
    objc_initWeak(&location, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008E81A4;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v22, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v8);
}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  ARGeoTrackingConfiguration *v4;
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "state") != (id)1)
  {
    v4 = objc_opt_new(ARGeoTrackingConfiguration);
    objc_msgSend(v5, "runWithConfiguration:", v4);

  }
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
}

- (ARSession)session
{
  return self->_session;
}

- (MapsRingBuffer)confidenceRingBuffer
{
  return self->_confidenceRingBuffer;
}

- (void)setConfidenceRingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceRingBuffer, a3);
}

- (NSDate)lastUIUpdate
{
  return self->_lastUIUpdate;
}

- (void)setLastUIUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUIUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUIUpdate, 0);
  objc_storeStrong((id *)&self->_confidenceRingBuffer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end
