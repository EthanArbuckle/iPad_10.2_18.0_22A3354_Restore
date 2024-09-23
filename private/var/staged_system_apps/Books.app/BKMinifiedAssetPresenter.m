@implementation BKMinifiedAssetPresenter

- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BCMutableFutureValue *v8;
  BCMutableFutureValue *v9;
  id v10;
  void *v11;
  BCMutableFutureValue *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  BCMutableFutureValue *v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(BCMutableFutureValue);
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015CEBC;
  v16[3] = &unk_1008EC5B0;
  objc_copyWeak(&v18, &location);
  v9 = v8;
  v17 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015CF6C;
  v14[3] = &unk_1008E7F00;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BKAssetLookup assetLookupWithID:options:completion:](BKAssetLookup, "assetLookupWithID:options:completion:", v6, v7, v16));
  v15 = v10;
  -[BCMutableFutureValue get:](v9, "get:", v14);
  v11 = v15;
  v12 = v9;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

- (id)_futureViewControllerWithAssetViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)BCMutableFutureValue), "initWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v6, "setMinifiedControllerLoadedAssetViewController:", v4);

  return v5;
}

- (BKMinifiedAssetPresenter)initWithAssetID:(id)a3 helper:(id)a4 minifiedController:(id)a5 options:(id)a6 presenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BKMinifiedAssetPresenter *v17;
  void *v18;
  NSString *v19;
  NSString *minifiedAssetPresenterAssetID;
  NSDictionary *v21;
  NSDictionary *options;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSString *v30;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  BKMinifiedAssetPresenter *v36;
  __int16 v37;
  NSString *v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)BKMinifiedAssetPresenter;
  v17 = -[BKMinifiedAssetPresenter init](&v32, "init");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "minifiedControllerMinibarViewController"));
    objc_storeStrong((id *)&v17->_helper, a4);
    v19 = (NSString *)objc_msgSend(v12, "copy");
    minifiedAssetPresenterAssetID = v17->_minifiedAssetPresenterAssetID;
    v17->_minifiedAssetPresenterAssetID = v19;

    v21 = (NSDictionary *)objc_msgSend(v15, "copy");
    options = v17->_options;
    v17->_options = v21;

    objc_storeStrong((id *)&v17->_minifiedController, a5);
    -[AEAssetMinifiedController setMinifiedControllerDelegate:](v17->_minifiedController, "setMinifiedControllerDelegate:", v17);
    objc_storeStrong((id *)&v17->_minibarViewController, v18);
    objc_storeWeak((id *)&v17->_minifiedPresenter, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](v17, "minibarViewController"));
    objc_msgSend(v23, "setMinibarViewControllerDelegate:", v17);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](v17, "minifiedController"));
    v25 = objc_msgSend(v24, "minifiedControllerShouldPreloadAssetViewController");

    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter _futureViewControllerWithAssetID:options:](v17, "_futureViewControllerWithAssetID:options:", v12, v15));
      -[BKMinifiedAssetPresenter setAssetViewControllerFuture:](v17, "setAssetViewControllerFuture:", v27);

    }
    v28 = BCSceneLog(v26);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = v17->_minifiedAssetPresenterAssetID;
      *(_DWORD *)buf = 136446722;
      v34 = "-[BKMinifiedAssetPresenter initWithAssetID:helper:minifiedController:options:presenter:]";
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}s:[%@] assetID=%@", buf, 0x20u);
    }

  }
  return v17;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  BKMinifiedAssetPresenter *v10;
  __int16 v11;
  void *v12;

  v3 = BCSceneLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedAssetPresenterAssetID](self, "minifiedAssetPresenterAssetID"));
    *(_DWORD *)buf = 136446722;
    v8 = "-[BKMinifiedAssetPresenter dealloc]";
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}s:[%@] assetID=%@", buf, 0x20u);

  }
  -[BKMinifiedAssetPresenter _unloadAssetViewController](self, "_unloadAssetViewController");
  v6.receiver = self;
  v6.super_class = (Class)BKMinifiedAssetPresenter;
  -[BKMinifiedAssetPresenter dealloc](&v6, "dealloc");
}

+ (void)minimizedPresenterWithLibraryAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  unsigned __int8 v31;
  BOOL v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  BOOL v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetLogID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSourceIdentifier"));
  if (objc_msgSend(v16, "isEqual:", CFSTR("com.apple.ibooks.datasource.ubiquity")))
    v17 = objc_msgSend(v10, "state") == 3;
  else
    v17 = 0;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "libraryAssetProvider"));

  if (v19)
  {
    v32 = v17;
    v33 = v12;
    v34 = v13;
    v20 = v11;
    v31 = objc_msgSend(v10, "isAudiobook");
    v21 = objc_msgSend(v10, "streamable");
    v22 = objc_msgSend(v10, "isSupplementalContent");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "supplementalContentAssets"));
    v24 = objc_msgSend(v23, "count");

    v25 = sub_10015CCE4();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v48 = v15;
      v49 = 2048;
      v50 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "minimizedPresenterWithLibraryAsset logID:%{public}@ supplemental content count=%lu", buf, 0x16u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10015D6A0;
    v35[3] = &unk_1008EC600;
    v36 = v15;
    v43 = v21;
    v11 = v20;
    v37 = v20;
    v38 = v14;
    v42 = a1;
    v39 = v10;
    v12 = v33;
    v40 = v33;
    v44 = v31;
    v45 = v22;
    v46 = v32;
    v13 = v34;
    v41 = v34;
    objc_msgSend(v19, "assetForLibraryAsset:completion:", v39, v35);

    v27 = v36;
  }
  else
  {
    v28 = _AEBookPluginsLifeCycleLog();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "minimizedPresenterWithLibraryAsset no libraryAssetProvider for logID:%{public}@", buf, 0xCu);
    }

    v30 = objc_retainBlock(v13);
    v27 = v30;
    if (v30)
      (*((void (**)(id, _QWORD))v30 + 2))(v30, 0);
  }

}

- (BCFutureValue)minifiedAssetPresenterAssetViewControllerFuture
{
  BCMutableFutureValue *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BCMutableFutureValue *v9;
  _QWORD v11[4];
  BCMutableFutureValue *v12;

  v3 = objc_opt_new(BCMutableFutureValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedAssetPresenterAssetID](self, "minifiedAssetPresenterAssetID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter options](self, "options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter _futureViewControllerWithAssetID:options:](self, "_futureViewControllerWithAssetID:options:", v5, v6));
    -[BKMinifiedAssetPresenter setAssetViewControllerFuture:](self, "setAssetViewControllerFuture:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015DD3C;
  v11[3] = &unk_1008EC4E0;
  v9 = v3;
  v12 = v9;
  objc_msgSend(v8, "get:", v11);

  return v9;
}

- (void)minifiedAssetPresenterDidReloadAssetViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedAssetPresenterAssetID](self, "minifiedAssetPresenterAssetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKMinifiedAssetPresenter.m", 219, "-[BKMinifiedAssetPresenter minifiedAssetPresenterDidReloadAssetViewController:]", "[self.minifiedAssetPresenterAssetID isEqualToString:assetViewController.asset.assetID]", CFSTR("Attempting to swap out an asset view controller for a different one!"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));

  v9 = v11;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter _futureViewControllerWithAssetViewController:](self, "_futureViewControllerWithAssetViewController:", v11));
    -[BKMinifiedAssetPresenter setAssetViewControllerFuture:](self, "setAssetViewControllerFuture:", v10);

    v9 = v11;
  }

}

- (id)minifiedAssetPresenterLoadAssetBlock
{
  id v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10015DEEC;
  v4[3] = &unk_1008EC530;
  objc_copyWeak(&v5, &location);
  v2 = objc_msgSend(v4, "copy");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (double)minifiedAssetPresenterMinibarHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](self, "minibarViewController"));
  objc_msgSend(v2, "minifiedViewControllerMinibarHeight");
  v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarMaxWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](self, "minibarViewController"));
  objc_msgSend(v2, "minifiedViewControllerMinibarMaxWidth");
  v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](self, "minibarViewController"));
  objc_msgSend(v2, "minifiedViewControllerMinibarFloatingHorizontalOffset");
  v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](self, "minibarViewController"));
  objc_msgSend(v2, "minifiedViewControllerMinibarFloatingVerticalOffset");
  v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarCornerRadius
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minibarViewController](self, "minibarViewController"));
  objc_msgSend(v2, "minifiedViewControllerMinibarCornerRadius");
  v4 = v3;

  return v4;
}

- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab
{
  return 1;
}

- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose
{
  return 0;
}

- (AEAssetAudiobookStatus)minifiedAssetStatus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedAssetPresenterMinifiedController](self, "minifiedAssetPresenterMinifiedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "minifiedControllerStateConforminigToProtocol:", &OBJC_PROTOCOL___AEAssetAudiobookStatus));

  return (AEAssetAudiobookStatus *)v3;
}

- (void)minifiedAssetPresenterWillOpenAssetMinified
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v2, "minifiedControllerWillOpenAsset");

}

- (void)minifiedAssetPresenterDidCloseAssetMinified
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v2, "minifiedControllerDidCloseAsset");

}

- (void)minifiedAssetPresenterDidOpenAssetFully
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v2, "minifiedControllerDidOpenAssetFully");

}

- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  v3 = objc_msgSend(v2, "minifiedControllerAnimateFromMinibarIfPossible");

  return v3;
}

- (void)minifiedAssetPresenterDidCloseAssetFully
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v3, "minifiedControllerDidCloseAssetFully");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  v5 = objc_msgSend(v4, "minifiedControllerShouldUnloadAssetViewController");

  if (v5)
    -[BKMinifiedAssetPresenter _unloadAssetViewController](self, "_unloadAssetViewController");
}

- (void)_unloadAssetViewController
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));
  objc_msgSend(v3, "cancel");

  -[BKMinifiedAssetPresenter setAssetViewControllerFuture:](self, "setAssetViewControllerFuture:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedControllerLoadedAssetViewController"));

  if (v4)
  {
    objc_msgSend(v5, "minifiedControllerWillUnloadAsset");
    objc_msgSend(v5, "setMinifiedControllerLoadedAssetViewController:", 0);
  }

}

- (void)minifiedAssetPresenterSaveStateClosing:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController", a3));
  objc_msgSend(v3, "minifiedControllerSaveState");

}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedController](self, "minifiedController"));
  objc_msgSend(v2, "minifiedAssetPresenterPausePlayback");

}

- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter minifiedPresenter](self, "minifiedPresenter"));
  v6 = objc_opt_class(NSNumber);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedAssetPresenter options](self, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKAudiobookOptionsIsRetryKey")));
  v9 = BUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v11, "minifiedPresenterClose:error:isRetry:", self, v5, objc_msgSend(v10, "BOOLValue"));

}

- (void)minifiedController:(id)a3 updatedHelper:(id)a4
{
  objc_storeStrong((id *)&self->_helper, a4);
}

- (BKMinifiedPresenting)minifiedPresenter
{
  return (BKMinifiedPresenting *)objc_loadWeakRetained((id *)&self->_minifiedPresenter);
}

- (BOOL)minifiedAssetPresenterIsAudiobook
{
  return self->_minifiedAssetPresenterIsAudiobook;
}

- (void)setMinifiedAssetPresenterIsAudiobook:(BOOL)a3
{
  self->_minifiedAssetPresenterIsAudiobook = a3;
}

- (BOOL)minifiedAssetPresenterIsSupplementalContent
{
  return self->_minifiedAssetPresenterIsSupplementalContent;
}

- (void)setMinifiedAssetPresenterIsSupplementalContent:(BOOL)a3
{
  self->_minifiedAssetPresenterIsSupplementalContent = a3;
}

- (BOOL)minifiedAssetPresenterCanStayOpenInBackground
{
  return self->_minifiedAssetPresenterCanStayOpenInBackground;
}

- (void)setMinifiedAssetPresenterCanStayOpenInBackground:(BOOL)a3
{
  self->_minifiedAssetPresenterCanStayOpenInBackground = a3;
}

- (NSString)minifiedAssetPresenterAssetID
{
  return self->_minifiedAssetPresenterAssetID;
}

- (BCFutureValue)assetViewControllerFuture
{
  return self->_assetViewControllerFuture;
}

- (void)setAssetViewControllerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_assetViewControllerFuture, a3);
}

- (AEAssetMinibarViewController)minibarViewController
{
  return self->_minibarViewController;
}

- (AEHelper)helper
{
  return self->_helper;
}

- (NSDictionary)options
{
  return self->_options;
}

- (AEAssetMinifiedController)minifiedController
{
  return self->_minifiedController;
}

- (BOOL)minifiedAssetPresenterWorkaround36067646
{
  return self->_minifiedAssetPresenterWorkaround36067646;
}

- (void)setMinifiedAssetPresenterWorkaround36067646:(BOOL)a3
{
  self->_minifiedAssetPresenterWorkaround36067646 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minifiedController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_minibarViewController, 0);
  objc_storeStrong((id *)&self->_assetViewControllerFuture, 0);
  objc_storeStrong((id *)&self->_minifiedAssetPresenterAssetID, 0);
  objc_destroyWeak((id *)&self->_minifiedPresenter);
}

@end
