@implementation MapsRecordAnIssueDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Record an Issue");
}

- (void)prepareContent
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100290AB4;
  v4[3] = &unk_1011AEAC8;
  objc_copyWeak(&v5, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Record"), v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)beginRecordingAndCreatePanView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssueDebugController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  v5 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  objc_msgSend(v5, "setColor:", v6);

  objc_msgSend(v4, "frame");
  v8 = v7 * 0.5;
  objc_msgSend(v4, "frame");
  objc_msgSend(v5, "setCenter:", v8, v9 * 0.5);
  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v5, "startAnimating");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEventRecorder initializeDefaultRecorderWithTapToRadar:window:](MapsEventRecorder, "initializeDefaultRecorderWithTapToRadar:window:", -[MapsRecordAnIssueDebugController tapToRadarEnabled](self, "tapToRadarEnabled"), v4));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002910D0;
  v13[3] = &unk_1011AD238;
  v13[4] = self;
  v14 = v4;
  v15 = v5;
  v11 = v5;
  v12 = v4;
  objc_msgSend(v10, "beginRecordingWithCompletion:", v13);

}

- (BOOL)tapToRadarEnabled
{
  return self->_tapToRadarEnabled;
}

- (void)setTapToRadarEnabled:(BOOL)a3
{
  self->_tapToRadarEnabled = a3;
}

@end
