@implementation BKMinifiedFlowController

- (void)visibleViewControllersUpdatedPreTranstionAnimated:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  if (-[BKMinifiedFlowController _shouldHideMinibar](self, "_shouldHideMinibar", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    v5 = objc_msgSend(v4, "isHidden");

    if ((v5 & 1) == 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
      objc_msgSend(v6, "setHidden:", 1);

    }
  }
}

- (BOOL)shouldIgnoreCurrentBookNotifications
{
  return self->_shouldIgnoreCurrentBookNotifications;
}

- (void)setShouldIgnoreCurrentBookNotifications:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  self->_shouldIgnoreCurrentBookNotifications = a3;
  v5 = BCCurrentBookLog(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin ignoring current book update notifications.", buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "End ignoring current book update notifications.", v10, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController ignoredCurrentBookNotification](self, "ignoredCurrentBookNotification"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController ignoredCurrentBookNotification](self, "ignoredCurrentBookNotification"));
      -[BKMinifiedFlowController _recentBooksProviderChanged:](self, "_recentBooksProviderChanged:", v9);

      -[BKMinifiedFlowController setIgnoredCurrentBookNotification:](self, "setIgnoredCurrentBookNotification:", 0);
    }
  }
}

- (void)setSceneHosting:(id)a3
{
  objc_storeWeak((id *)&self->_sceneHosting, a3);
}

- (void)setIgnoredCurrentBookNotification:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredCurrentBookNotification, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)minibarContainerView
{
  return self->_minibarContainerView;
}

- (BKMinifiedFlowController)init
{
  BKMinifiedFlowController *v2;
  UIView *v3;
  UIView *minibarContainerView;
  void *v5;
  BKCurrentBookProvider *v6;
  BKCurrentBookProvider *currentBookProvider;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKMinifiedFlowController;
  v2 = -[BKMinifiedFlowController init](&v11, "init");
  if (v2)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 100.0, 0.0);
    minibarContainerView = v2->_minibarContainerView;
    v2->_minibarContainerView = v3;

    -[UIView setClipsToBounds:](v2->_minibarContainerView, "setClipsToBounds:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v2->_isRTL = objc_msgSend(v5, "userInterfaceLayoutDirection") == (id)1;

    v6 = objc_alloc_init(BKCurrentBookProvider);
    currentBookProvider = v2->_currentBookProvider;
    v2->_currentBookProvider = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_recentBooksProviderChanged:", CFSTR("BKRecentBooksProviderDidChangeNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    v2->_shouldIgnoreCurrentBookNotifications = 1;
  }
  return v2;
}

- (NSNotification)ignoredCurrentBookNotification
{
  return self->_ignoredCurrentBookNotification;
}

- (BKMinifiedFlowControllerDelegate)delegate
{
  return (BKMinifiedFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BKCurrentBookProvider)currentBookProvider
{
  return self->_currentBookProvider;
}

- (BOOL)_shouldHideMinibar
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "minifiedFlowControllerMinibarContainingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedBarVisibilityStyling));

  LOBYTE(v2) = objc_msgSend(v4, "minifiedBarVisibilityStyleIsHidden");
  return (char)v2;
}

- (BOOL)_shouldHandleCurrentBookNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  BOOL v15;
  __int16 v17;
  uint8_t buf[2];
  __int16 v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedFlowControllerPresentedAssetID:", self));

  v7 = -[BKMinifiedFlowController shouldIgnoreCurrentBookNotifications](self, "shouldIgnoreCurrentBookNotifications");
  if (v7)
  {
    v8 = BCCurrentBookLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v19 = 0;
      v10 = "Ignoring recent books provider notification during book open.";
      v11 = (uint8_t *)&v19;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "length") || !objc_msgSend(v4, "length"))
  {
    v12 = objc_msgSend(v4, "length");
    v13 = BCCurrentBookLog(v12);
    v9 = objc_claimAutoreleasedReturnValue(v13);
    v14 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v17 = 0;
        v10 = "We currently have a presented asset, skipping current book logic.";
        v11 = (uint8_t *)&v17;
        goto LABEL_12;
      }
    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      v10 = "No asset provided so no current book set up.";
      v11 = buf;
      goto LABEL_12;
    }
LABEL_13:

    v15 = 0;
    goto LABEL_14;
  }
  v15 = 1;
LABEL_14:

  return v15;
}

- (void)_recentBooksProviderChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKRecentBooksProviderAssetsKey")));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012D3C;
  v12[3] = &unk_1008E7518;
  objc_copyWeak(&v15, &location);
  v13 = v9;
  v14 = v4;
  v10 = v4;
  v11 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_cleanLastKnownCurrentBookIfNecessary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  _QWORD block[4];
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenBookID"));
  if (objc_msgSend(v4, "length"))
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000961C4;
    v12[3] = &unk_1008E8370;
    v5 = v4;
    v13 = v5;
    v14 = v15;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100096224;
    v9[3] = &unk_1008E76D0;
    v10 = v5;
    v11 = v15;
    v6 = objc_retainBlock(v9);
    if (v6)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v6[2])(v6);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000962E8;
        block[3] = &unk_1008E7818;
        v8 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    _Block_object_dispose(v15, 8);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("BKRecentBooksProviderDidChangeNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)BKMinifiedFlowController;
  -[BKMinifiedFlowController dealloc](&v5, "dealloc");
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "libraryAssetProvider"));

  return (BKLibraryAssetProvider *)v3;
}

- (void)minifiedPresenterAssetPresenterForStoreAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void (**v23)(id, void *);
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minifiedAssetPresenterAssetID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "id"));
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v15 = BUProtocolCast(&OBJC_PROTOCOL___BKMinifiedAssetPresenting, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
      goto LABEL_5;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "minifiedAssetPresenterAssetID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "id"));
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!v20)
    goto LABEL_8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v22 = BUProtocolCast(&OBJC_PROTOCOL___BKMinifiedAssetPresenting, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v16)
  {
LABEL_5:
    v23 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
      v23[2](v23, v24);

    }
  }
  else
  {
LABEL_8:
    -[objc_class minimizedPresenterWithAsset:options:presenter:completion:](-[BKMinifiedFlowController _storeAssetPresenterClass](self, "_storeAssetPresenterClass"), "minimizedPresenterWithAsset:options:presenter:completion:", v25, v8, self, v9);
  }

}

- (Class)_audiobookMinifiedAssetPresenterClass
{
  return (Class)objc_opt_class(BKMinifiedAssetPresenter);
}

- (void)minifiedPresenterAssetPresenterForAssetIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  objc_class *v33;
  id v34;
  objc_class *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BCCurrentBookLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412290;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@", (uint8_t *)&v38, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "minifiedAssetPresenterAssetID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "permanentOrTemporaryAssetID"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v18 = BUProtocolCast(&OBJC_PROTOCOL___BKMinifiedAssetPresenting, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
      goto LABEL_7;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "minifiedAssetPresenterAssetID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "permanentOrTemporaryAssetID"));
  v23 = objc_msgSend(v21, "isEqualToString:", v22);

  if (!v23)
    goto LABEL_10;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v25 = BUProtocolCast(&OBJC_PROTOCOL___BKMinifiedAssetPresenting, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if (v19)
  {
LABEL_7:
    v26 = objc_retainBlock(v10);
    v27 = v26;
    if (v26)
      (*((void (**)(id, void *))v26 + 2))(v26, v19);

  }
  else
  {
LABEL_10:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController libraryAssetProvider](self, "libraryAssetProvider"));

    if (v28)
    {
      v30 = BCCurrentBookLog(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 138412290;
        v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@ requesting for libraryAsset", (uint8_t *)&v38, 0xCu);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController libraryAssetProvider](self, "libraryAssetProvider"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "libraryAssetOnMainQueueWithAssetIdentifier:", v8));

      if (objc_msgSend(v19, "isAudiobook"))
        v33 = -[BKMinifiedFlowController _audiobookMinifiedAssetPresenterClass](self, "_audiobookMinifiedAssetPresenterClass");
      else
        v33 = (objc_class *)objc_opt_class(BKMinifiedAssetPresenter);
      v35 = v33;
      v36 = BCCurrentBookLog(v33);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 138412290;
        v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@ requesting minified asset presenter for libraryAsset", (uint8_t *)&v38, 0xCu);
      }

      -[objc_class minimizedPresenterWithLibraryAsset:options:presenter:completion:](v35, "minimizedPresenterWithLibraryAsset:options:presenter:completion:", v19, v9, self, v10);
    }
    else
    {
      v34 = objc_retainBlock(v10);
      v19 = v34;
      if (v34)
        (*((void (**)(id, _QWORD))v34 + 2))(v34, 0);
    }
  }

}

- (id)minifiedPresenterAssetCurrentPresenterForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedAssetPresenterAssetID"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "minifiedAssetPresenterAssetID"));
    v11 = objc_msgSend(v10, "isEqualToString:", v4);

    if (!v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v8 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  }
  v12 = (void *)v8;
LABEL_7:

  return v12;
}

- (id)minifiedPresenterAssetCurrentPresentersForAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
    v10 = objc_msgSend(v4, "containsObject:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
      objc_msgSend(v5, "addObject:", v11);

    }
  }
  v12 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "minifiedAssetPresenterAssetID"));
    v16 = objc_msgSend(v4, "containsObject:", v15);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
      objc_msgSend(v5, "addObject:", v17);

    }
  }
  v18 = objc_msgSend(v5, "copy");

  return v18;
}

- (id)minifiedPresenterAssetCurrentPresenters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (void)minifiedPresenterPrepareToOpen:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  _BOOL4 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minifiedAssetPresenters](self, "minifiedAssetPresenters"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "minifiedAssetPresenterIsAudiobook") & 1) == 0)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  if (-[BKMinifiedFlowController _presenterIsAudiobookPreview:](self, "_presenterIsAudiobookPreview:", v8))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = objc_msgSend(v8, "minifiedAssetPresenterIsAudiobook");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "minifiedAssetPresenterAssetID"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primarySceneController"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rootBarCoordinator"));

          objc_msgSend(v24, "presentFullPlayerWithCompletion:", 0);
        }
        else
        {
          v38 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

          if (v38 == v8)
            goto LABEL_19;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
          objc_msgSend(v24, "minifiedAssetPresenterPausePlayback");
        }

LABEL_19:
        v27 = objc_retainBlock(v9);
        v28 = v27;
        if (v27)
          (*((void (**)(id))v27 + 2))(v27);
        goto LABEL_21;
      }
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "minifiedAssetPresenterAssetID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
  if (!objc_msgSend(v25, "isEqualToString:", v26)
    || (objc_msgSend(v11, "minifiedAssetPresenterCanStayOpenInBackground") & 1) != 0)
  {

    goto LABEL_19;
  }
  v29 = objc_msgSend(v8, "minifiedAssetPresenterIsAudiobook");

  if ((v29 & 1) != 0)
    goto LABEL_19;
  v39 = v6;
  v40 = v9;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minifiedAssetPresenters](self, "minifiedAssetPresenters"));
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v42;
    while (2)
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "minifiedAssetPresenterAssetID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if ((v37 & 1) != 0)
        {

          v9 = v40;
          goto LABEL_19;
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v32)
        continue;
      break;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v9 = v40;
  -[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:](self, "_closeMinifiedPresenter:animated:completion:", v28, v39, v40);
LABEL_21:

}

- (Class)_storeAssetPresenterClass
{
  return (Class)objc_opt_class(BKMinifiedStoreAssetPresenter);
}

- (BOOL)_presenterIsAudiobookPreview:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_opt_isKindOfClass(v4, -[BKMinifiedFlowController _storeAssetPresenterClass](self, "_storeAssetPresenterClass"));

  return self & 1;
}

- (void)minifiedPresenterOpenMinified:(id)a3
{
  id v4;

  v4 = a3;
  -[BKMinifiedFlowController setMinibarVisible:](self, "setMinibarVisible:", objc_msgSend(v4, "minifiedAssetPresenterShouldAnimateOpenClose") ^ 1);
  -[BKMinifiedFlowController minifiedPresenterOpen:](self, "minifiedPresenterOpen:", v4);

}

- (void)minifiedPresenterAddPresenter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  BKMinifiedFlowController *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSSet *v75;
  NSSet *minifiedAssetPresenters;
  _BYTE v77[24];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  if (v5 != v4 && objc_msgSend(v4, "minifiedAssetPresenterIsAudiobook"))
  {
    -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
    v7 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = v9;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

    if (v16 == v17)
      -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", 0);
    -[BKMinifiedFlowController setAudioBookAssetPresenter:](self, "setAudioBookAssetPresenter:", v4);
    if (v5)
    {
      v18 = BCCurrentBookLog(objc_msgSend(v10, "removeObject:", v5));
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v77 = 136446466;
        *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v77[12] = 2112;
        *(_QWORD *)&v77[14] = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", v77, 0x16u);
      }

      objc_msgSend(v5, "minifiedAssetPresenterWillCloseAssetMinified");
      if (-[BKMinifiedFlowController _legacyMinibarBehavior](self, "_legacyMinibarBehavior"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedAssetPresenterMinibar"));
        objc_msgSend(v20, "willMoveToParentViewController:", 0);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedAssetPresenterMinibar"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
        objc_msgSend(v22, "removeFromSuperview");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedAssetPresenterMinibar"));
        objc_msgSend(v23, "removeFromParentViewController");

      }
      objc_msgSend(v5, "minifiedAssetPresenterDidCloseAssetMinified");
    }
    v24 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    if (v24)
    {
      v25 = (void *)v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
      v27 = objc_msgSend(v26, "minifiedAssetPresenterCanStayOpenInBackground");

      if ((v27 & 1) == 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        objc_msgSend(v10, "removeObject:", v28);

        v30 = BCCurrentBookLog(v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
          *(_DWORD *)v77 = 136446466;
          *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
          *(_WORD *)&v77[12] = 2112;
          *(_QWORD *)&v77[14] = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", v77, 0x16u);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        objc_msgSend(v33, "minifiedAssetPresenterWillCloseAssetMinified");

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "minifiedAssetPresenterMinibar"));
        objc_msgSend(v35, "willMoveToParentViewController:", 0);

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "minifiedAssetPresenterMinibar"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "view"));
        objc_msgSend(v38, "removeFromSuperview");

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "minifiedAssetPresenterMinibar"));
        objc_msgSend(v40, "removeFromParentViewController");

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        objc_msgSend(v41, "minifiedAssetPresenterDidCloseAssetMinified");

      }
    }
    -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    objc_msgSend(v42, "setHidden:", 0);

    if (!v4)
      goto LABEL_55;
    v43 = BCCurrentBookLog(objc_msgSend(v10, "addObject:", v4));
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 136446466;
      *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s: Adding minified asset presenter %@", v77, 0x16u);
    }

    objc_msgSend(v4, "minifiedAssetPresenterWillOpenAssetMinified");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minifiedAssetPresenterMinibar"));
    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "primarySceneController"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "rootBarCoordinator"));

      v49 = objc_opt_class(BKAudiobookNowPlayingMiniTouchViewController);
      v50 = BUDynamicCast(v49, v45);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      v52 = (void *)v51;
      if (v48)
      {
        if (v51)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "miniPlayerViewController"));

          if (!v53)
            objc_msgSend(v48, "dockMiniPlayer:", v52);
        }
      }

    }
    v54 = objc_msgSend(v4, "minifiedAssetPresenterShouldAnimateOpenClose");
    if ((objc_opt_respondsToSelector(v4, "minifiedAssetPresenterToolbar") & 1) != 0)
    {
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minifiedAssetPresenterToolbar"));
      if (v55)
      {
        v56 = (void *)v55;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
        objc_msgSend(v57, "minifiedFlowControllerDock:", v56);

LABEL_54:
        objc_msgSend(v4, "minifiedAssetPresenterDidOpenAssetMinified");

        goto LABEL_55;
      }
    }
    v58 = self;
    if (v54)
    {
      -[BKMinifiedFlowController _setMinibarVisible:animated:completion:](self, "_setMinibarVisible:animated:completion:", 1, 1, 0);
      goto LABEL_54;
    }
LABEL_53:
    -[BKMinifiedFlowController _layoutPresenterMinibar:](v58, "_layoutPresenterMinibar:", v4);
    goto LABEL_54;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minifiedAssetPresenterAssetID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minifiedAssetPresenterAssetID"));
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
  {
LABEL_58:

    goto LABEL_59;
  }
  v12 = objc_msgSend(v4, "minifiedAssetPresenterIsAudiobook");

  if ((v12 & 1) == 0)
  {
    -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
    v13 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = v15;

    if (!v6 || (objc_msgSend(v6, "minifiedAssetPresenterCanStayOpenInBackground") & 1) != 0)
      goto LABEL_47;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

    if (v6 == v59)
    {
      v64 = BCCurrentBookLog(v60);
      v62 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v77 = 136446466;
        *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v77[12] = 2112;
        *(_QWORD *)&v77[14] = v6;
        v63 = "%{public}s: Keeping minified audio book asset presenter %@";
        goto LABEL_45;
      }
    }
    else
    {
      v61 = BCCurrentBookLog(objc_msgSend(v10, "removeObject:", v6));
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v77 = 136446466;
        *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v77[12] = 2112;
        *(_QWORD *)&v77[14] = v6;
        v63 = "%{public}s: Removing minified asset presenter %@";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v63, v77, 0x16u);
      }
    }

    objc_msgSend(v6, "minifiedAssetPresenterWillCloseAssetMinified");
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minifiedAssetPresenterMinibar"));
    objc_msgSend(v65, "removeFromParentViewController");

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minifiedAssetPresenterMinibar"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "view"));
    objc_msgSend(v67, "removeFromSuperview");

    objc_msgSend(v6, "minifiedAssetPresenterDidCloseAssetMinified");
LABEL_47:
    -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", v4, *(_OWORD *)v77, *(_QWORD *)&v77[16]);
    if (!v4)
    {
LABEL_55:
      v75 = (NSSet *)objc_msgSend(v10, "count");
      if (v75)
        v75 = (NSSet *)objc_msgSend(v10, "copy");
      minifiedAssetPresenters = self->_minifiedAssetPresenters;
      self->_minifiedAssetPresenters = v75;

      -[BKMinifiedFlowController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("BKMnifiedPresentersUpdatedNotification"), self);
      goto LABEL_58;
    }
    v68 = BCCurrentBookLog(objc_msgSend(v10, "addObject:", v4));
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 136446466;
      *(_QWORD *)&v77[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}s: Adding minified asset presenter %@", v77, 0x16u);
    }

    objc_msgSend(v4, "minifiedAssetPresenterWillOpenAssetMinified");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minifiedAssetPresenterMinibar"));
    if (v45)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "minifiedFlowControllerMinibarContainingViewController"));
      objc_msgSend(v71, "addChildViewController:", v45);

      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
      objc_msgSend(v72, "setAutoresizingMask:", 0);

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
      objc_msgSend(v73, "addSubview:", v74);

    }
    v58 = self;
    goto LABEL_53;
  }
LABEL_59:

}

- (void)minifiedPresenter:(id)a3 openStorePageForStoreID:(id)a4 fromViewController:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
  objc_msgSend(v9, "minifiedFlowControllerRequestShowStoreForStoreID:fromViewController:", v8, v7);

}

- (void)minifiedPresenterClose:(id)a3 error:(id)a4 isRetry:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100094220;
  v13[3] = &unk_1008E8240;
  objc_copyWeak(&v16, &location);
  v11 = v9;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  v17 = a5;
  -[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:](self, "_closeMinifiedPresenter:animated:completion:", v8, 1, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)minifiedPresenterClose:(id)a3
{
  -[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:](self, "_closeMinifiedPresenter:animated:completion:", a3, 1, 0);
}

- (void)minifiedPresenterClose:(id)a3 completion:(id)a4
{
  -[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:](self, "_closeMinifiedPresenter:animated:completion:", a3, 1, a4);
}

- (void)minifiedPresenterPause:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter", a3));
  objc_msgSend(v3, "minifiedAssetPresenterPausePlayback");

}

- (void)_closeMinifiedPresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  unsigned int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  BOOL v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _BOOL4 v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSSet *v43;
  NSSet *minifiedAssetPresenters;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  NSSet *v49;
  NSSet *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  BKMinifiedFlowController *v54;
  id v55;
  id v56;
  id location;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minifiedAssetPresenterMinibar"));
  objc_initWeak(&location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10009486C;
  v52[3] = &unk_1008E8268;
  v10 = v7;
  v53 = v10;
  v54 = self;
  v11 = v9;
  v55 = v11;
  objc_copyWeak(&v56, &location);
  v12 = objc_retainBlock(v52);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "minifiedAssetPresenterAssetID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minifiedAssetPresenterAssetID"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v18 = -[BKMinifiedFlowController _presenterIsAudiobookPreview:](self, "_presenterIsAudiobookPreview:", v10);
  if (v17 == v10)
    v19 = 1;
  else
    v19 = v18;
  if ((v16 & v19) == 1)
  {
    if ((objc_opt_respondsToSelector(v10, "minifiedAssetPresenterToolbar") & 1) != 0)
    {
      -[BKMinifiedFlowController _hideToolbarAnimated:completion:](self, "_hideToolbarAnimated:completion:", 0, v8);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primarySceneController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rootBarCoordinator"));
      objc_msgSend(v31, "undockMiniPlayer");

      v32 = objc_retainBlock(v8);
      v33 = v32;
      if (v32)
        (*((void (**)(id))v32 + 2))(v32);

    }
    -[BKMinifiedFlowController setAudioBookAssetPresenter:](self, "setAudioBookAssetPresenter:", 0);
    v34 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v35 = v34 == v10;

    if (v35)
      -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", 0);
    -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
    v36 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
    v37 = v36;
    if (v36)
      v38 = v36;
    else
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v40 = v38;

    v41 = BCCurrentBookLog(objc_msgSend(v40, "removeObject:", v10));
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:]";
      v60 = 2112;
      v61 = v10;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
    }

    v43 = (NSSet *)objc_msgSend(v40, "count");
    if (v43)
      v43 = (NSSet *)objc_msgSend(v40, "copy");
    minifiedAssetPresenters = self->_minifiedAssetPresenters;
    self->_minifiedAssetPresenters = v43;

    -[BKMinifiedFlowController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v45, "postNotificationName:object:", CFSTR("BKMnifiedPresentersUpdatedNotification"), self);

    goto LABEL_34;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "minifiedAssetPresenterAssetID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minifiedAssetPresenterAssetID"));
  v23 = objc_msgSend(v21, "isEqualToString:", v22);

  if (!v23)
  {
    -[BKMinifiedFlowController _notifyToolbars](self, "_notifyToolbars");
    ((void (*)(_QWORD *))v12[2])(v12);
    v39 = objc_retainBlock(v8);
    v40 = v39;
    if (!v39)
      goto LABEL_34;
LABEL_33:
    (*((void (**)(id))v39 + 2))(v39);
    goto LABEL_34;
  }
  -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", 0);
  v24 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v25 = v24 == v10;

  if (!v25)
  {
    -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
    v26 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v46 = v28;

    v47 = BCCurrentBookLog(objc_msgSend(v46, "removeObject:", v10));
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:]";
      v60 = 2112;
      v61 = v10;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
    }

    v49 = (NSSet *)objc_msgSend(v46, "count");
    if (v49)
      v49 = (NSSet *)objc_msgSend(v46, "copy");
    v50 = self->_minifiedAssetPresenters;
    self->_minifiedAssetPresenters = v49;

    -[BKMinifiedFlowController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
  }
  ((void (*)(_QWORD *))v12[2])(v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v51, "postNotificationName:object:", CFSTR("BKMnifiedPresentersUpdatedNotification"), self);

  v39 = objc_retainBlock(v8);
  v40 = v39;
  if (v39)
    goto LABEL_33;
LABEL_34:

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);

}

- (void)minifiedPresenterDidOpenAssetID:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minifiedAssetPresenterAssetID"));
  v6 = objc_msgSend(v5, "isEqualToString:", v12);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    objc_msgSend(v7, "minifiedAssetPresenterDidOpenAssetFully");

    -[BKMinifiedFlowController _setMinibarVisible:animated:completion:](self, "_setMinibarVisible:animated:completion:", 0, 1, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
    v10 = objc_msgSend(v9, "isEqualToString:", v12);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
      objc_msgSend(v11, "minifiedAssetPresenterDidOpenAssetFully");

    }
  }

}

- (void)minifiedPresenterDidReloadAssetViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minifiedAssetPresenters](self, "minifiedAssetPresenters"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100094AC4;
  v10[3] = &unk_1008E8290;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

- (BOOL)_assetIsPresentedOnAuxiliaryCanvas:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController sceneHosting](self, "sceneHosting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneInfoPresentingAssetID:", v4));

  v7 = objc_opt_class(BKSceneController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sceneController"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10 && objc_msgSend(v10, "sceneType") != (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootBarCoordinator"));
    v11 = v12 == 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)minifiedPresenterUpdateCurrentBookWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", 0);
  v6 = objc_retainBlock(v4);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)minifiedPresenterDidCloseAssetID:(id)a3 finishedConsuming:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BKMinifiedFlowController *v32;
  char *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSSet *v42;
  NSSet *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  NSSet *v51;
  NSSet *minifiedAssetPresenters;
  uint64_t v53;
  NSObject *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  id v64;

  v6 = a3;
  if (!self->_removingHostedVC)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minifiedAssetPresenterAssetID"));
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
      objc_msgSend(v10, "minifiedAssetPresenterDidCloseAssetFully");

      if (!a4)
        -[BKMinifiedFlowController _setMinibarVisible:animated:completion:](self, "_setMinibarVisible:animated:completion:", 1, 1, 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "minifiedAssetPresenterAssetID"));
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));

      if (v14 == v15)
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenBookID"));
      }
      else
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenedCurrentBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenedCurrentBookID"));
        if (!v16)
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownOpenedCurrentBookID](BKAssetPresentingViewController, "lastKnownOpenedCurrentBookID"));
          v17 = BCCurrentBookLog(v16);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v62) = v16 != 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Last opened current books was not successful, Has it been opened recently?: %d", buf, 8u);
          }

        }
      }
      v44 = objc_msgSend(v6, "isEqualToString:", v16);
      if ((_DWORD)v44
        && (v44 = (id)+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"),
            (v44 & 1) == 0))
      {
        v53 = BCCurrentBookLog(v44);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Closing current books presented VC. Keeping minified.", buf, 2u);
        }

        v37 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        objc_msgSend(v37, "minifiedAssetPresenterDidCloseAssetFully");
      }
      else
      {
        v45 = BCCurrentBookLog(v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v16;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Closing non-current book presented VC. Show previous current book %@.", buf, 0xCu);
        }

        v37 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
        -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", 0);
        v47 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

        if (v37 != v47)
        {
          -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
          v48 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
          v49 = BCCurrentBookLog(objc_msgSend(v48, "removeObject:", v37));
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v62 = "-[BKMinifiedFlowController minifiedPresenterDidCloseAssetID:finishedConsuming:]";
            v63 = 2112;
            v64 = v37;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
          }

          v51 = (NSSet *)objc_msgSend(v48, "count");
          if (v51)
            v51 = (NSSet *)objc_msgSend(v48, "copy");
          minifiedAssetPresenters = self->_minifiedAssetPresenters;
          self->_minifiedAssetPresenters = v51;

          -[BKMinifiedFlowController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
        }
      }
LABEL_50:

      goto LABEL_51;
    }
    v19 = objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController currentBookAssetPresenter](self, "currentBookAssetPresenter"));
    if (!v19
      || (v20 = (void *)v19,
          v21 = +[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"),
          v20,
          v21))
    {
      v22 = BCCurrentBookLog(v19);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = (const char *)v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Closing book but we have no current presenter. Removing presenter with matching assetID (%@).", buf, 0xCu);
      }

      -[BKMinifiedFlowController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
      v24 = -[NSSet mutableCopy](self->_minifiedAssetPresenters, "mutableCopy");
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v16 = (char *)v24;
      v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v57;
        v55 = v6;
LABEL_17:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(v16);
          v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "minifiedAssetPresenterAssetID"));
          if ((objc_msgSend(v30, "isEqualToString:", v6) & 1) != 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
            v32 = self;
            v33 = v16;
            v34 = v31;
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "minifiedAssetPresenterAssetID"));
            v36 = objc_msgSend(v35, "isEqualToString:", v6);

            v16 = v33;
            self = v32;

            if (!v36)
            {
              v37 = v29;

              v6 = v55;
              if (!v37)
                goto LABEL_30;
              v39 = BCCurrentBookLog(objc_msgSend(v16, "removeObject:", v37));
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                v62 = "-[BKMinifiedFlowController minifiedPresenterDidCloseAssetID:finishedConsuming:]";
                v63 = 2112;
                v64 = v37;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
              }
              goto LABEL_33;
            }
          }
          else
          {

          }
          v28 = (char *)v28 + 1;
          v6 = v55;
          if (v26 == v28)
          {
            v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
            if (v26)
              goto LABEL_17;
            break;
          }
        }
      }

LABEL_30:
      v41 = BCCurrentBookLog(v38);
      v40 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_10069D21C((uint64_t)v6, v40);
      v37 = 0;
LABEL_33:

      v42 = (NSSet *)objc_msgSend(v16, "count");
      if (v42)
        v42 = (NSSet *)objc_msgSend(v16, "copy");
      v43 = self->_minifiedAssetPresenters;
      self->_minifiedAssetPresenters = v42;

      -[BKMinifiedFlowController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("minifiedAssetPresenters"));
      goto LABEL_50;
    }
  }
LABEL_51:

}

- (BOOL)minifiedPresenterCanOpenPresenter:(id)a3 overCurrentPresenter:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    v8 = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController libraryAssetProvider](self, "libraryAssetProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetPresenterAssetID"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:", v10));
    if ((!objc_msgSend(v6, "minifiedAssetPresenterIsAudiobook")
       || objc_msgSend(v11, "isAudiobook"))
      && objc_msgSend(v6, "minifiedAssetPresenterIsSupplementalContent"))
    {
      v7 = objc_msgSend(v11, "isAudiobook");
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)minifiedPresenterBarButtonItem
{
  return 0;
}

- (BOOL)_legacyMinibarBehavior
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v3 = v2 == 0;

  return v3;
}

- (void)_setMinibarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;
  _QWORD v30[9];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (-[BKMinifiedFlowController minibarVisible](self, "minibarVisible") != v6)
  {
    if (v5)
    {
      if (-[BKMinifiedFlowController _legacyMinibarBehavior](self, "_legacyMinibarBehavior"))
      {
        if (v6)
        {
          -[BKMinifiedFlowController setMinibarVisible:](self, "setMinibarVisible:", 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
          -[BKMinifiedFlowController _layoutPresenterMinibar:](self, "_layoutPresenterMinibar:", v9);

        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
        objc_msgSend(v10, "frame");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
        objc_msgSend(v19, "minifiedFlowControllerMinibarBottomGuideWithViewController:", 0);
        v21 = v20;

        v22 = v14 + v21 - v14;
        if (v6)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
          objc_msgSend(v23, "setFrame:", v12, v22, v16, v18);

          v22 = v14;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100095598;
        v30[3] = &unk_1008E82B8;
        v30[4] = self;
        *(double *)&v30[5] = v12;
        *(double *)&v30[6] = v22;
        *(double *)&v30[7] = v16;
        *(double *)&v30[8] = v18;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000955F0;
        v27[3] = &unk_1008E82E0;
        v27[4] = self;
        v29 = v6;
        v28 = v8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v30, v27, 0.2);

      }
      goto LABEL_13;
    }
    -[BKMinifiedFlowController setMinibarVisible:](self, "setMinibarVisible:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    -[BKMinifiedFlowController _layoutPresenterMinibar:](self, "_layoutPresenterMinibar:", v24);

  }
  -[BKMinifiedFlowController _notifyToolbars](self, "_notifyToolbars");
  v25 = objc_retainBlock(v8);
  v26 = v25;
  if (v25)
    (*((void (**)(id))v25 + 2))(v25);

LABEL_13:
}

- (void)_hideToolbarAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  if ((objc_opt_respondsToSelector(v5, "minifiedAssetPresenterToolbar") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minifiedAssetPresenterToolbar"));

    if (!v7)
      goto LABEL_5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
    objc_msgSend(v8, "minifiedFlowControllerUndock:", v7);

    v5 = (void *)v7;
  }

LABEL_5:
  v9 = objc_retainBlock(v11);
  v10 = v9;
  if (v9)
    (*((void (**)(id))v9 + 2))(v9);

}

- (void)_layoutPresenterMinibar:(id)a3
{
  id v4;

  v4 = a3;
  -[BKMinifiedFlowController _layoutPresenterMinibar:visible:viewController:](self, "_layoutPresenterMinibar:visible:viewController:", v4, -[BKMinifiedFlowController minibarVisible](self, "minibarVisible"), 0);

}

- (void)_layoutPresenterMinibar:(id)a3 visible:(BOOL)a4 viewController:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double Width;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = a4;
  v50 = a3;
  v8 = a5;
  if (-[BKMinifiedFlowController _legacyMinibarBehavior](self, "_legacyMinibarBehavior"))
  {
    objc_msgSend(v50, "minifiedAssetPresenterWillLayoutAssetMinified");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "minifiedFlowControllerMinibarContainingViewController"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
    v12 = objc_msgSend(v11, "horizontalSizeClass");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
    objc_msgSend(v13, "minifiedFlowControllerMinibarBottomGuideWithViewController:", v8);
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v50, "minifiedAssetPresenterMinibarHeight");
    v27 = v26;
    objc_msgSend(v50, "minifiedAssetPresenterMinibarMaxWidth");
    v29 = v28;
    objc_msgSend(v50, "minifiedAssetPresenterMinibarFloatingHorizontalOffset");
    v31 = v30;
    objc_msgSend(v50, "minifiedAssetPresenterMinibarFloatingVerticalOffset");
    v48 = v32;
    objc_msgSend(v50, "minifiedAssetPresenterMinibarCornerRadius");
    v49 = v33;
    if (v12 == (id)1)
    {
      v51.origin.x = v19;
      v51.origin.y = v21;
      v51.size.width = v23;
      v51.size.height = v25;
      v34 = CGRectGetWidth(v51) + v31 * -2.0;
      if (v34 >= v29)
        v35 = v29;
      else
        v35 = v34;
      if (v29 == 0.0)
        v36 = v34;
      else
        v36 = v35;
      v52.origin.x = v19;
      v52.origin.y = v21;
      v52.size.width = v23;
      v52.size.height = v25;
      v31 = floor((CGRectGetWidth(v52) - v36) * 0.5);
    }
    else
    {
      v47 = v15;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v37, "bounds");
      v38 = CGRectGetWidth(v53) + v31 * -2.0;

      if (v38 >= v29)
        v39 = v29;
      else
        v39 = v38;
      if (v29 == 0.0)
        v36 = v38;
      else
        v36 = v39;
      if (!-[BKMinifiedFlowController isRTL](self, "isRTL"))
      {
        v54.origin.x = v19;
        v54.origin.y = v21;
        v54.size.width = v23;
        v54.size.height = v25;
        Width = CGRectGetWidth(v54);
        v55.origin.x = 0.0;
        v55.origin.y = 0.0;
        v55.size.width = v36;
        v55.size.height = v27;
        v31 = Width - CGRectGetWidth(v55) - v31;
      }
      v15 = v47;
    }
    v41 = v15 - v27 - v48;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layer"));
    objc_msgSend(v43, "setCornerRadius:", v49);

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "minifiedAssetPresenterMinibar"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "view"));
    objc_msgSend(v45, "setFrame:", 0.0, 0.0, v36, v27);

    if (!v6)
      v27 = 0.0;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    objc_msgSend(v46, "setFrame:", v31, v41, v36, v27);

    objc_msgSend(v50, "minifiedAssetPresenterDidLayoutAssetMinified");
  }

}

- (void)visibleViewControllersUpdatedPostTranstionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v3 = a3;
  if (!-[BKMinifiedFlowController _shouldHideMinibar](self, "_shouldHideMinibar"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
    v6 = objc_msgSend(v5, "isHidden");

    if (v6)
    {
      v7 = -[BKMinifiedFlowController minibarVisible](self, "minibarVisible");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100095B88;
      v11[3] = &unk_1008E72C0;
      v11[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
      objc_msgSend(v8, "setHidden:", 0);

      -[BKMinifiedFlowController _setMinibarVisible:animated:completion:](self, "_setMinibarVisible:animated:completion:", v7, v3, 0);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));

  if (v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    -[BKMinifiedFlowController _layoutPresenterMinibar:](self, "_layoutPresenterMinibar:", v10);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100095BFC;
  v4[3] = &unk_1008E8308;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, &stru_1008E8348);
}

- (void)activeRootBarKindDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:](self, "_layoutPresenterMinibar:", v3);

}

- (void)contentSizeCategoryDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:](self, "_layoutPresenterMinibar:", v3);

}

- (id)minifiedBarAnimatorMinibarView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "minifiedAssetPresenterMinibar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  return v4;
}

- (id)minifiedBarAnimatorTabBarView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "minifiedFlowControllerTabBarView"));

  return v3;
}

- (void)minifiedBarAnimatePrepareTransitionToViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  -[BKMinifiedFlowController setMinibarVisible:](self, "setMinibarVisible:", v4 == 0);

}

- (void)minifiedBarAnimatorAnimateHideIfNeededFromViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:visible:viewController:](self, "_layoutPresenterMinibar:visible:viewController:", v6, 0, v4);

}

- (void)minifiedBarAnimatorFinalizeHideIfNeededToViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:visible:viewController:](self, "_layoutPresenterMinibar:visible:viewController:", v5, 0, v4);

}

- (void)minifiedBarAnimatorPrepareShowIfNeededToViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController minibarContainerView](self, "minibarContainerView"));
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:visible:viewController:](self, "_layoutPresenterMinibar:visible:viewController:", v6, 0, v4);

}

- (void)minifiedBarAnimatorAnimateShowIfNeededToViewController:(id)a3 force:(BOOL)a4
{
  uint64_t v4;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  v7 = -[BKMinifiedFlowController minibarVisible](self, "minibarVisible");
  if ((v4 & 1) == 0 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenterAssetID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetPresenterAssetID"));
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v4 = v11 ^ 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  -[BKMinifiedFlowController _layoutPresenterMinibar:visible:viewController:](self, "_layoutPresenterMinibar:visible:viewController:", v12, v4, v6);

}

- (void)toggleMinibarVisibility:(id)a3
{
  -[BKMinifiedFlowController _setMinibarVisible:animated:completion:](self, "_setMinibarVisible:animated:completion:", -[BKMinifiedFlowController minibarVisible](self, "minibarVisible", a3) ^ 1, 1, 0);
}

- (id)_currentAssetPresenters
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController sceneHosting](self, "sceneHosting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneHostingAllViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  return v3;
}

- (void)_notifyToolbars
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController _currentAssetPresenters](self, "_currentAssetPresenters", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "assetPresenterUpdateToolbars");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)shouldAnimateAssetWithAssetIDFromMinibar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedAssetPresenterAssetID"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedFlowController audioBookAssetPresenter](self, "audioBookAssetPresenter"));
    v9 = objc_msgSend(v8, "minifiedAssetPresenterShouldAnimateFromMinibar");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)minifiedAssetPresenters
{
  return self->_minifiedAssetPresenters;
}

- (BKSceneHosting)sceneHosting
{
  return (BKSceneHosting *)objc_loadWeakRetained((id *)&self->_sceneHosting);
}

- (void)setMinibarContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_minibarContainerView, a3);
}

- (void)setCurrentBookProvider:(id)a3
{
  objc_storeStrong((id *)&self->_currentBookProvider, a3);
}

- (BKMinifiedAssetPresenting)audioBookAssetPresenter
{
  return self->_audioBookAssetPresenter;
}

- (void)setAudioBookAssetPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_audioBookAssetPresenter, a3);
}

- (BKMinifiedAssetPresenting)currentBookAssetPresenter
{
  return self->_currentBookAssetPresenter;
}

- (void)setCurrentBookAssetPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_currentBookAssetPresenter, a3);
}

- (BOOL)minibarVisible
{
  return self->_minibarVisible;
}

- (void)setMinibarVisible:(BOOL)a3
{
  self->_minibarVisible = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)removingHostedVC
{
  return self->_removingHostedVC;
}

- (void)setRemovingHostedVC:(BOOL)a3
{
  self->_removingHostedVC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredCurrentBookNotification, 0);
  objc_storeStrong((id *)&self->_currentBookAssetPresenter, 0);
  objc_storeStrong((id *)&self->_audioBookAssetPresenter, 0);
  objc_storeStrong((id *)&self->_currentBookProvider, 0);
  objc_storeStrong((id *)&self->_minibarContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneHosting);
  objc_storeStrong((id *)&self->_minifiedAssetPresenters, 0);
}

@end
