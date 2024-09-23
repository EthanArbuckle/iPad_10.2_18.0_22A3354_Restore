@implementation RCPlatterStopButtonCAPackageManager

+ (id)stopButtonPackageManager
{
  RCPlatterStopButtonCAPackageManager *v2;
  void *v3;
  RCPlatterStopButtonCAPackageManager *v4;

  v2 = [RCPlatterStopButtonCAPackageManager alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = -[RCPlatterStopButtonCAPackageManager initWithPackageName:inBundle:](v2, "initWithPackageName:inBundle:", CFSTR("PlatterStopButton"), v3);

  return v4;
}

- (RCPlatterStopButtonCAPackageManager)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  RCPlatterStopButtonCAPackageManager *v8;
  RCPlatterStopButtonCAPackageManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCPlatterStopButtonCAPackageManager;
  v8 = -[RCPlatterStopButtonCAPackageManager init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[RCPlatterStopButtonCAPackageManager setPackageName:](v8, "setPackageName:", v6);
    -[RCPlatterStopButtonCAPackageManager setBundle:](v9, "setBundle:", v7);
  }

  return v9;
}

- (void)setMicaState:(unint64_t)a3
{
  if (self->_micaState != a3)
  {
    self->_micaState = a3;
    -[RCPlatterStopButtonCAPackageManager _setMicaState:animated:](self, "_setMicaState:animated:");
  }
}

- (UIView)view
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager packageView](self, "packageView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)BSUICAPackageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager packageName](self, "packageName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager bundle](self, "bundle"));
    v7 = objc_msgSend(v4, "initWithPackageName:inBundle:", v5, v6);
    -[RCPlatterStopButtonCAPackageManager setPackageView:](self, "setPackageView:", v7);

    -[RCPlatterStopButtonCAPackageManager _setMicaState:animated:](self, "_setMicaState:animated:", self->_micaState, 1);
  }
  return (UIView *)-[RCPlatterStopButtonCAPackageManager packageView](self, "packageView");
}

- (void)pauseAnimations
{
  -[RCPlatterStopButtonCAPackageManager _setMicaState:animated:](self, "_setMicaState:animated:", self->_micaState, 0);
}

- (void)resumeAnimations
{
  -[RCPlatterStopButtonCAPackageManager _setMicaState:animated:](self, "_setMicaState:animated:", self->_micaState, 1);
}

- (void)_setMicaState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v4 = a4;
  v7 = (float)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager packageView](self, "packageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  *(float *)&v10 = v7;
  objc_msgSend(v9, "setSpeed:", v10);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager _stringForMicaState:](self, "_stringForMicaState:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v11, "platterStopButtonStateTransitionDuration");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButtonCAPackageManager packageView](self, "packageView"));
  v15 = v14;
  v16 = 0.0;
  if (v4)
    v16 = v13;
  objc_msgSend(v14, "setState:animated:transitionSpeed:completion:", v17, v4, 0, v16);

}

- (id)_stringForMicaState:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1001AB648[a3];
}

- (unint64_t)micaState
{
  return self->_micaState;
}

- (BSUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (NSString)packageName
{
  return self->_packageName;
}

- (void)setPackageName:(id)a3
{
  objc_storeStrong((id *)&self->_packageName, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end
