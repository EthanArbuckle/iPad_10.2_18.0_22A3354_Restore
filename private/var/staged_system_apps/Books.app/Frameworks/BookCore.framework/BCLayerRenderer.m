@implementation BCLayerRenderer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6218;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D498 != -1)
    dispatch_once(&qword_30D498, block);
  return (id)qword_30D490;
}

- (BCLayerRenderer)init
{
  unsigned __int8 v3;
  _BOOL8 v4;
  void *v5;
  BCLayerRenderer *v6;
  void *v7;
  objc_super v9;

  v3 = -[BCLayerRenderer _isAppExtension](self, "_isAppExtension");
  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
    v4 = objc_msgSend(v5, "applicationState") == (char *)&dword_0 + 2;

  }
  v9.receiver = self;
  v9.super_class = (Class)BCLayerRenderer;
  v6 = -[BCLayerRenderer initWithSuspended:](&v9, "initWithSuspended:", v4);
  if ((v3 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

  }
  return v6;
}

- (BOOL)_isAppExtension
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundlePath"));
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".appex"));

  return v4;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[BCLayerRenderer suspend](self, "suspend", a3);
}

@end
