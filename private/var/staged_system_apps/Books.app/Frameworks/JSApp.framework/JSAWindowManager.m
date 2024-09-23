@implementation JSAWindowManager

- (JSAWindowManager)initWithWindowProvider:(id)a3
{
  id v5;
  JSAWindowManager *v6;
  JSAWindowManager *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JSAWindowManager;
  v6 = -[JSAWindowManager init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_windowProvider, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_keyWindowDidChange:", UIWindowDidBecomeKeyNotification, 0);

    -[JSAWindowManager _keyWindowDidChange:]_0((uint64_t)v7);
  }

  return v7;
}

- (void)_keyWindowDidChange:(uint64_t)a1
{
  _QWORD *v1;
  _QWORD v2[4];
  _QWORD *v3;
  _QWORD v4[5];

  if (a1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_4A64;
    v4[3] = &unk_9DCA8;
    v4[4] = a1;
    v1 = objc_retainBlock(v4);
    if (v1)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v1[2])(v1);
      }
      else
      {
        v2[0] = _NSConcreteStackBlock;
        v2[1] = 3221225472;
        v2[2] = sub_4BB0;
        v2[3] = &unk_9DCD0;
        v3 = v1;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

      }
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)JSAWindowManager;
  -[JSAWindowManager dealloc](&v4, "dealloc");
}

- (id)windowFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindowManager windowProvider](self, "windowProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowFromOptions:", v4));

  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindowManager keyWindow](self, "keyWindow"));
  return v6;
}

- (void)updateWindowSizeIfNeeded:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  JSAWindowManager *v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4CA8;
  v8[3] = &unk_9DCF8;
  v4 = a3;
  v9 = v4;
  v10 = self;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4DCC;
      block[3] = &unk_9DCD0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (BOOL)downloadQueue:(id)a3 shouldShowAuthenticateForRequest:(id)a4
{
  return 1;
}

- (BOOL)downloadQueue:(id)a3 shouldShowDialogForRequest:(id)a4
{
  return 1;
}

- (void)downloadQueue:(id)a3 shouldShowEngagementForRequest:(id)a4 engagementRequest:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (id)downloadQueue:(id)a3 viewControllerToPresentAuthenticateUIForRequest:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindowManager keyWindow](self, "keyWindow", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", v4));

  return v5;
}

- (id)downloadQueue:(id)a3 viewControllerToPresentDialogUIForRequest:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindowManager keyWindow](self, "keyWindow", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", v4));

  return v5;
}

- (id)downloadQueue:(id)a3 viewControllerToPresentEngagementUIForRequest:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindowManager keyWindow](self, "keyWindow", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", v4));

  return v5;
}

- (JSAWindowProviding)windowProvider
{
  return (JSAWindowProviding *)objc_getProperty(self, a2, 8, 1);
}

- (UIWindow)keyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_keyWindow);
}

- (void)setKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_keyWindow, a3);
}

- (CGSize)keyWindowSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_keyWindowSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setKeyWindowSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_keyWindowSize, &v3, 16, 1, 0);
}

- (NSString)keyWindowSceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyWindowSceneIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyWindowSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_keyWindow);
  objc_storeStrong((id *)&self->_windowProvider, 0);
}

@end
