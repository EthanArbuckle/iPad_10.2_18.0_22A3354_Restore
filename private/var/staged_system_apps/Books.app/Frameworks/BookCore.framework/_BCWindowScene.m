@implementation _BCWindowScene

- (BAAnalyticsController)ba_analyticsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BCWindowScene controller](self, "controller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ba_analyticsController"));

  return (BAAnalyticsController *)v3;
}

- (void)attemptRotateToPortraitWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  char *v6;
  void (**v7)(id, _QWORD);
  id rotateCompletion;
  id v9;
  double v10;
  NSTimer *v11;
  NSTimer *rotateTimeoutTimer;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id location;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BCWindowScene effectiveGeometry](self, "effectiveGeometry"));
  v6 = (char *)objc_msgSend(v5, "interfaceOrientation") - 3;

  if ((unint64_t)v6 > 1)
  {
    v4[2](v4, 0);
  }
  else
  {
    v7 = objc_retainBlock(v4);
    rotateCompletion = self->_rotateCompletion;
    self->_rotateCompletion = v7;

    -[_BCWindowScene addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("effectiveGeometry"), 1, off_309CF0);
    v9 = objc_msgSend(objc_alloc((Class)UIWindowSceneGeometryPreferencesIOS), "initWithInterfaceOrientations:", 2);
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1066F8;
    v14[3] = &unk_291388;
    objc_copyWeak(&v15, &location);
    -[_BCWindowScene requestGeometryUpdateWithPreferences:errorHandler:](self, "requestGeometryUpdateWithPreferences:errorHandler:", v9, v14);
    objc_msgSend(UIApp, "windowRotationDuration");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1068A0;
    v13[3] = &unk_2913B0;
    v13[4] = self;
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, v10 + 0.3));
    rotateTimeoutTimer = self->_rotateTimeoutTimer;
    self->_rotateTimeoutTimer = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  char *v8;
  NSTimer *rotateTimeoutTimer;
  id rotateCompletion;
  void (**v11)(id, _QWORD);

  if (off_309CF0 == a6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BCWindowScene effectiveGeometry](self, "effectiveGeometry", a3, a4, a5));
    v8 = (char *)objc_msgSend(v7, "interfaceOrientation") - 1;

    if ((unint64_t)v8 <= 1)
    {
      -[NSTimer invalidate](self->_rotateTimeoutTimer, "invalidate");
      rotateTimeoutTimer = self->_rotateTimeoutTimer;
      self->_rotateTimeoutTimer = 0;

      v11 = (void (**)(id, _QWORD))objc_retainBlock(self->_rotateCompletion);
      if (v11)
        v11[2](v11, 0);
      rotateCompletion = self->_rotateCompletion;
      self->_rotateCompletion = 0;

    }
  }
}

- (BCSceneControlling)controller
{
  return (BCSceneControlling *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rotateTimeoutTimer, 0);
  objc_storeStrong(&self->_rotateCompletion, 0);
}

@end
