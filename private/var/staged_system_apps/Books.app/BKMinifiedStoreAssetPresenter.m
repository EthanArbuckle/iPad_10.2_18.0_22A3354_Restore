@implementation BKMinifiedStoreAssetPresenter

- (id)touchVC
{
  uint64_t v3;

  v3 = objc_opt_class(BKAudiobookNowPlayingMiniTouchViewController);
  return (id)BUDynamicCast(v3, self->_playerViewController);
}

- (BKMinifiedStoreAssetPresenter)initWithAsset:(id)a3 libraryAsset:(id)a4 options:(id)a5 presenter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BKMinifiedStoreAssetPresenter *v15;
  void *v16;
  NSString *v17;
  NSString *minifiedAssetPresenterAssetID;
  NSDictionary *v19;
  NSDictionary *options;
  uint64_t v21;
  UIViewController *playerViewController;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BKMinifiedStoreAssetPresenter;
  v15 = -[BKMinifiedStoreAssetPresenter init](&v24, "init");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "id"));
    v17 = (NSString *)objc_msgSend(v16, "copy");
    minifiedAssetPresenterAssetID = v15->_minifiedAssetPresenterAssetID;
    v15->_minifiedAssetPresenterAssetID = v17;

    v19 = (NSDictionary *)objc_msgSend(v13, "copy");
    options = v15->_options;
    v15->_options = v19;

    objc_storeStrong((id *)&v15->_asset, a3);
    objc_storeStrong((id *)&v15->_libraryAsset, a4);
    v21 = objc_claimAutoreleasedReturnValue(+[BKAudiobookNowPlayingModuleFactory fetchOrCreateMiniPlayer](BKAudiobookNowPlayingModuleFactory, "fetchOrCreateMiniPlayer"));
    playerViewController = v15->_playerViewController;
    v15->_playerViewController = (UIViewController *)v21;

    objc_storeWeak((id *)&v15->_minifiedPresenter, v14);
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));
  objc_msgSend(v3, "cancel");

  -[BKMinifiedStoreAssetPresenter _unloadAssetViewController](self, "_unloadAssetViewController");
  v4.receiver = self;
  v4.super_class = (Class)BKMinifiedStoreAssetPresenter;
  -[BKMinifiedStoreAssetPresenter dealloc](&v4, "dealloc");
}

+ (void)minimizedPresenterWithAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "libraryAssetProvider"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "libraryAssetOnMainQueueWithAssetID:", v16));

  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithAsset:libraryAsset:options:presenter:", v10, v17, v11, v13);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "id"));
  v20 = v19;
  if (v18 && objc_msgSend(v19, "length"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
    v31 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100153A08;
    v25[3] = &unk_1008EC478;
    v26 = v20;
    v27 = v10;
    v28 = v18;
    v30 = v12;
    v29 = v11;
    objc_msgSend(v21, "lockupProfilesForStoreIDs:completion:", v22, v25);

  }
  else
  {
    v23 = objc_retainBlock(v12);
    v24 = v23;
    if (v23)
      (*((void (**)(id, id))v23 + 2))(v23, v18);

  }
}

- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4
{
  BCMutableFutureValue *v4;
  void *v5;

  v4 = objc_opt_new(BCMutableFutureValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iBooks"), 0, &off_10092F520));
  -[BCMutableFutureValue set:error:](v4, "set:error:", 0, v5);
  -[BCMutableFutureValue get:](v4, "get:", &stru_1008EC4B8);

  return v4;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter minifiedAssetPresenterAssetID](self, "minifiedAssetPresenterAssetID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter options](self, "options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter _futureViewControllerWithAssetID:options:](self, "_futureViewControllerWithAssetID:options:", v5, v6));
    -[BKMinifiedStoreAssetPresenter setAssetViewControllerFuture:](self, "setAssetViewControllerFuture:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100153FCC;
  v11[3] = &unk_1008EC4E0;
  v9 = v3;
  v12 = v9;
  objc_msgSend(v8, "get:", v11);

  return v9;
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
  v4[2] = sub_100154084;
  v4[3] = &unk_1008EC530;
  objc_copyWeak(&v5, &location);
  v2 = objc_msgSend(v4, "copy");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)minifiedAssetPresenterIsAudiobook
{
  return 1;
}

- (BOOL)minifiedAssetPresenterIsSupplementalContent
{
  return 0;
}

- (BOOL)minifiedAssetPresenterCanStayOpenInBackground
{
  return 1;
}

- (double)minifiedAssetPresenterMinibarHeight
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarMaxWidth
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarCornerRadius
{
  return 0.0;
}

- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab
{
  return 1;
}

- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose
{
  return 1;
}

- (AEAssetAudiobookStatus)minifiedAssetStatus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter minifiedAssetPresenterMinifiedController](self, "minifiedAssetPresenterMinifiedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "minifiedControllerStateConforminigToProtocol:", &OBJC_PROTOCOL___AEAssetAudiobookStatus));

  return (AEAssetAudiobookStatus *)v3;
}

- (void)minifiedAssetPresenterDidOpenAssetMinified
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter touchVC](self, "touchVC"));
  objc_msgSend(v2, "play");

}

- (void)minifiedAssetPresenterWillCloseAssetMinified
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter touchVC](self, "touchVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter minifiedAssetPresenterAssetID](self, "minifiedAssetPresenterAssetID"));
  objc_msgSend(v4, "ensureAudiobookNotPlayingWithAssetID:", v3);

}

- (AEHelper)minifiedAssetPresenterAssetHelper
{
  return 0;
}

- (AEAssetMinifiedController)minifiedAssetPresenterMinifiedController
{
  return 0;
}

- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar
{
  return 0;
}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter touchVC](self, "touchVC"));
  objc_msgSend(v2, "pause");

}

- (void)minifiedAssetPresenterTogglePlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter touchVC](self, "touchVC"));
  objc_msgSend(v2, "togglePlayPause");

}

- (Class)assetPresentingViewControllerClass
{
  return (Class)objc_opt_class(BKAudiobookPreviewPresentingViewController);
}

- (void)_unloadAssetViewController
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter assetViewControllerFuture](self, "assetViewControllerFuture"));
  objc_msgSend(v3, "cancel");

  -[BKMinifiedStoreAssetPresenter setAssetViewControllerFuture:](self, "setAssetViewControllerFuture:", 0);
}

- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKMinifiedStoreAssetPresenter minifiedPresenter](self, "minifiedPresenter"));
  objc_msgSend(v6, "minifiedPresenterClose:error:isRetry:", self, v5, 0);

}

- (BKMinifiedPresenting)minifiedPresenter
{
  return (BKMinifiedPresenting *)objc_loadWeakRetained((id *)&self->_minifiedPresenter);
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

- (NSDictionary)options
{
  return self->_options;
}

- (UIViewController)playerViewController
{
  return self->_playerViewController;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAsset, a3);
}

- (AEAssetMinifiedController)minifiedController
{
  return self->_minifiedController;
}

- (void)setMinifiedController:(id)a3
{
  objc_storeStrong((id *)&self->_minifiedController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minifiedController, 0);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetViewControllerFuture, 0);
  objc_storeStrong((id *)&self->_minifiedAssetPresenterAssetID, 0);
  objc_destroyWeak((id *)&self->_minifiedPresenter);
}

@end
