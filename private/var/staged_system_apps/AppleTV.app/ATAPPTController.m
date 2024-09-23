@implementation ATAPPTController

+ (id)sharedInstance
{
  if (qword_10001A518 != -1)
    dispatch_once(&qword_10001A518, &stru_100014720);
  return (id)qword_10001A510;
}

- (ATAPPTController)init
{

  return 0;
}

- (id)_init
{
  ATAPPTController *v2;
  ATAPPTController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATAPPTController;
  v2 = -[ATAPPTController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_appLoadedLock._os_unfair_lock_opaque = 0;
    -[ATAPPTController _registerTests](v2, "_registerTests");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "waitForApplicationToLoadNotification:", _VUITVAppNavigationDidDisplayViewControllerNotification, 0);

  }
  return v3;
}

- (void)runTest:(id)a3 app:(id)a4
{
  -[ATAPPTController _runTest:app:](self, "_runTest:app:", a3, a4);
}

- (OS_dispatch_queue)workQueue
{
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  workQueue = self->_workQueue;
  if (!workQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.tv.ppt", 0);
    v5 = self->_workQueue;
    self->_workQueue = v4;

    workQueue = self->_workQueue;
  }
  return workQueue;
}

- (void)_waitForSearchShelfsToLoadInTabBarController:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKeyPath:", CFSTR("tabBar.items.title")));
  v4 = objc_msgSend(v3, "indexOfObject:", VUITabBarItemIdentifierKeySearch);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v5));

    v8 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "childViewControllers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "childViewControllers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    while (1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "childViewControllers"));
      v17 = objc_msgSend(v16, "count");

      if (v17)
        break;
      usleep(0xC350u);
    }

  }
}

- (void)_scrollHalfTheScreenHeightIn:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  _QWORD block[4];
  id v15;
  double v16;
  double v17;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities topMostController](ATAPPTUtilities, "topMostController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v4 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:](ATAPPTUtilities, "findScrollViewInView:desiredScrollViewClass:", v3, NSClassFromString(CFSTR("VideosUI.StackCollectionView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "keyWindow"));
  objc_msgSend(v10, "frame");
  v12 = v9 + v11 * 0.5;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    objc_msgSend(v5, "setContentOffset:animated:", 0, v7, v12);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005030;
    block[3] = &unk_100014748;
    v15 = v5;
    v16 = v7;
    v17 = v12;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
  sleep(2u);

}

- (BOOL)_canHandleTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ATAPPTController testsManifest](self, "testsManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005138;
  v9[3] = &unk_100014770;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (void)_registerTests
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  NSDictionary *v7;
  NSDictionary *testsManifest;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[13];
  _QWORD v12[13];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000059EC;
  v10[3] = &unk_1000149B8;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005AEC;
  v9[3] = &unk_1000149B8;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  v11[0] = CFSTR("ScrollPage");
  v11[1] = CFSTR("ScrollWhatToWatch");
  v12[0] = &stru_100014810;
  v12[1] = &stru_100014950;
  v11[2] = CFSTR("ScrollSwoosh");
  v5 = objc_retainBlock(v3);
  v12[2] = v5;
  v11[3] = CFSTR("ScrollBricks");
  v6 = objc_retainBlock(v4);
  v12[3] = v6;
  v12[4] = &stru_100014830;
  v11[4] = CFSTR("ScrollUpNext");
  v11[5] = CFSTR("ScrollSportsPage");
  v12[5] = &stru_1000149F8;
  v12[6] = &stru_100014A18;
  v11[6] = CFSTR("ScrollShowProductPage");
  v11[7] = CFSTR("ScrollLibrary");
  v12[7] = &stru_100014890;
  v12[8] = &stru_1000148D0;
  v11[8] = CFSTR("ScrollLibraryCategories");
  v11[9] = CFSTR("ScrollLibraryCategoryGrid");
  v12[9] = &stru_100014910;
  v12[10] = &stru_1000147B0;
  v11[10] = CFSTR("LaunchToWatchNow");
  v11[11] = CFSTR("LaunchToLibrary");
  v11[12] = CFSTR("LaunchToSearch");
  v12[11] = &stru_1000147D0;
  v12[12] = &stru_1000147F0;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 13));
  testsManifest = self->_testsManifest;
  self->_testsManifest = v7;

}

- (void)waitForApplicationToLoadNotification:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, _VUITVAppNavigationDidDisplayViewControllerNotification, 0);

  os_unfair_lock_lock(&self->_appLoadedLock);
  self->_appLoaded = 1;
  os_unfair_lock_unlock(&self->_appLoadedLock);
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ATAPPTController applicationLoadCompletion](self, "applicationLoadCompletion"));
  if (v5)
  {
    -[ATAPPTController setApplicationLoadCompletion:](self, "setApplicationLoadCompletion:", 0);
    v5[2]();
  }

}

- (void)_runTest:(id)a3 app:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  ATAPPTController *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[ATAPPTController _canHandleTest:](self, "_canHandleTest:", v6))
  {
    objc_initWeak(&location, self);
    v8 = objc_claimAutoreleasedReturnValue(-[ATAPPTController workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005EE0;
    block[3] = &unk_100014B08;
    v10 = v6;
    v11 = v7;
    v12 = self;
    objc_copyWeak(&v13, &location);
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSDictionary)testsManifest
{
  return self->_testsManifest;
}

- (void)setTestsManifest:(id)a3
{
  objc_storeStrong((id *)&self->_testsManifest, a3);
}

- (id)applicationLoadCompletion
{
  return self->_applicationLoadCompletion;
}

- (void)setApplicationLoadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_applicationLoadCompletion, 0);
  objc_storeStrong((id *)&self->_testsManifest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
