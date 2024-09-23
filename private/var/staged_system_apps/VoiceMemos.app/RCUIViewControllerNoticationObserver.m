@implementation RCUIViewControllerNoticationObserver

- (RCUIViewControllerNoticationObserver)init
{
  RCUIViewControllerNoticationObserver *v2;
  uint64_t v3;
  NSMutableArray *observations;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RCUIViewControllerNoticationObserver;
  v2 = -[RCUIViewControllerNoticationObserver init](&v18, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    observations = v2->_observations;
    v2->_observations = (NSMutableArray *)v3;

    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = v2->_observations;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004C364;
    v15[3] = &unk_1001AC2C0;
    objc_copyWeak(&v16, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", UIApplicationWillEnterForegroundNotification, 0, v7, v15));
    -[NSMutableArray addObject:](v6, "addObject:", v8);

    v9 = v2->_observations;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004C3A8;
    v13[3] = &unk_1001AC2C0;
    objc_copyWeak(&v14, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", UIApplicationDidEnterBackgroundNotification, 0, v10, v13));
    -[NSMutableArray addObject:](v9, "addObject:", v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
