@implementation BKAudiobookMinifiedController

- (BKAudiobookMinifiedController)initWithHelper:(id)a3
{
  id v5;
  BKAudiobookMinifiedController *v6;
  BKAudiobookMinifiedController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookMinifiedController;
  v6 = -[BKAudiobookMinifiedController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_helper, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)minifiedControllerDidLoadAsset
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BKAudiobookNowPlayingTouchViewController *v6;
  BKAudiobookNowPlayingTouchViewController *nowPlayingViewController;

  v3 = objc_opt_class(BKAudiobookNowPlayingTouchViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (BKAudiobookNowPlayingTouchViewController *)objc_claimAutoreleasedReturnValue(v5);
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = v6;

  -[BKAudiobookNowPlayingTouchViewController setDelegate:](self->_nowPlayingViewController, "setDelegate:", self);
}

- (void)minifiedControllerWillUnloadAsset
{
  BKAudiobookNowPlayingTouchViewController *nowPlayingViewController;

  if ((objc_opt_respondsToSelector(self->_nowPlayingViewController, "assetViewControllerWillUnload") & 1) != 0)
    -[BKAudiobookNowPlayingTouchViewController assetViewControllerWillUnload](self->_nowPlayingViewController, "assetViewControllerWillUnload");
  -[BKAudiobookNowPlayingTouchViewController setDelegate:](self->_nowPlayingViewController, "setDelegate:", 0);
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = 0;

}

- (BOOL)minifiedControllerShouldPreloadAssetViewController
{
  return 1;
}

- (BOOL)minifiedControllerShouldUnloadAssetViewController
{
  return 0;
}

- (AEAssetMinibarViewController)minifiedControllerMinibarViewController
{
  return 0;
}

- (BOOL)minifiedControllerAnimateFromMinibarIfPossible
{
  return 0;
}

- (id)minifiedControllerStateConforminigToProtocol:(id)a3
{
  return (id)BUProtocolCast(a3, self);
}

- (void)minifiedControllerSaveState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController minifiedControllerLoadedAssetViewController](self, "minifiedControllerLoadedAssetViewController"));
  objc_msgSend(v2, "saveStateClosing:", 0);

}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v2, "pause");

}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentChapter", a4, a6));
  objc_msgSend(v8, "duration");
  v10 = v9;

  v11 = a4 / v10;
  if (a4 <= 0.0)
    v11 = 1.0;
  -[BKAudiobookMinifiedController setAssetAudiobookStatusTrackProgress:](self, "setAssetAudiobookStatusTrackProgress:", v11);
  v12 = v10 - a4;
  if (v10 - a4 < 0.0)
    v12 = 0.0;
  -[BKAudiobookMinifiedController setAssetAudiobookStatusTrackTimeRemaining:](self, "setAssetAudiobookStatusTrackTimeRemaining:", v12);
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  -[BKAudiobookMinifiedController setAssetAudiobookStatusPlaying:](self, "setAssetAudiobookStatusPlaying:", objc_msgSend(a3, "isPlaying"));
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  -[BKAudiobookMinifiedController setAssetAudiobookStatusPlaying:](self, "setAssetAudiobookStatusPlaying:", 0, a4);
  -[BKAudiobookMinifiedController setAssetAudiobookStatusTrackProgress:](self, "setAssetAudiobookStatusTrackProgress:", 1.0);
  -[BKAudiobookMinifiedController setAssetAudiobookStatusTrackTimeRemaining:](self, "setAssetAudiobookStatusTrackTimeRemaining:", 0.0);
}

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v5;
  NSError *v6;

  v5 = a4;
  v6 = objc_opt_new(NSError);
  (*((void (**)(id, uint64_t, NSError *))a4 + 2))(v5, 1, v6);

}

- (void)requestCloseWithPresenter:(id)a3 animated:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (BOOL)audiobookNowPlayingViewControllerShouldPauseOnClose:(id)a3
{
  return 0;
}

- (void)audiobookNowPlayingViewControllerRequestHide:(id)a3
{
  objc_msgSend(a3, "im_dismissAnimated:", 1);
}

- (void)audiobookNowPlayingViewControllerRequestCloseMinified:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController minifiedControllerDelegate](self, "minifiedControllerDelegate"));
  objc_msgSend(v6, "minifiedControllerRequestClose:error:", self, v5);

}

- (void)audiobookNowPlayingViewControllerWillDisappear:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController nowPlayingViewController](self, "nowPlayingViewController", a3));
  -[BKAudiobookMinifiedController setAssetAudiobookStatusPlaying:](self, "setAssetAudiobookStatusPlaying:", objc_msgSend(v4, "isPlaying"));

}

- (void)audiobookNowPlayingViewController:(id)a3 shouldStream:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BKMLAudiobookHelper *v14;
  void *v15;
  void *v16;
  void *v17;
  AEAudioHelper *v18;
  AEAudioHelper *helper;
  AEAudioHelper *v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  _BOOL4 v24;

  v4 = a4;
  v6 = a3;
  v7 = -[AEAudioHelper isStreaming](self->_helper, "isStreaming");
  if ((_DWORD)v7 != v4)
  {
    v8 = (int)v7;
    v9 = _AEBookPluginsAudiobookLog(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v22[0] = 67109376;
      v22[1] = v8;
      v23 = 1024;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Minified controller switching from streaming=%d to streaming=%d", (uint8_t *)v22, 0xEu);
    }

    v11 = objc_opt_class(BKMLAudiobookHelper);
    v12 = BUDynamicCast(v11, self->_helper);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = [BKMLAudiobookHelper alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "albumTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaItem bk_audioBookAssetURLWithAlbumTitle:isCloudItem:](MPMediaItem, "bk_audioBookAssetURLWithAlbumTitle:isCloudItem:", v15, v4));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "options"));
    v18 = -[BKMLAudiobookHelper initWithAssetUrl:options:](v14, "initWithAssetUrl:options:", v16, v17);

    helper = self->_helper;
    self->_helper = v18;
    v20 = v18;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController minifiedControllerDelegate](self, "minifiedControllerDelegate"));
    objc_msgSend(v21, "minifiedController:updatedHelper:", self, v20);

    objc_msgSend(v6, "setHelper:completion:", v20, &stru_1008EBF20);
  }

}

- (void)audiobookNowPlayingViewControllerRequestBuy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  NSMutableDictionary *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(BKAudiobookPreviewHelper);
  v9 = BUDynamicCast(v8, self->_helper);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mAsset"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buyParams"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "offer"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type")));

    v14 = objc_opt_class(NSString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookMinifiedController helper](self, "helper"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataAssetIDKey, 0));
    v17 = BUDynamicCast(v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ba_effectiveAnalyticsTracker"));
    v20 = objc_opt_new(NSMutableDictionary);
    v39 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chainWithName:", CFSTR("AudiobookMiniPlayer")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, CFSTR("BATracker"));

    if (_os_feature_enabled_impl("Books", "unifiedProductPage"))
    {
      v35 = v7;
      v36 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppAnalyticsAdditionalData supportsUnifiedProductPageKey](BAAppAnalyticsAdditionalData, "supportsUnifiedProductPageKey"));
      v48[0] = v34;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "supportsUnifiedProductPage")));
      v49[0] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppAnalyticsAdditionalData editionKindKey](BAAppAnalyticsAdditionalData, "editionKindKey"));
      v48[1] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editionKind"));
      if (v24)
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editionKind"));
      else
        v25 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v28 = (void *)v25;
      v49[1] = v25;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v29, BAAppAnalyticsAdditionalDataKey);

      v7 = v35;
      v6 = v36;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100140588;
    block[3] = &unk_1008EBF48;
    block[4] = self;
    v41 = v18;
    v42 = v38;
    v43 = v37;
    v44 = v20;
    v45 = v6;
    v46 = v11;
    v47 = v7;
    v30 = v20;
    v31 = v37;
    v32 = v38;
    v33 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v26 = objc_retainBlock(v7);
    v27 = v26;
    if (v26)
      (*((void (**)(id, _QWORD, _QWORD))v26 + 2))(v26, 0, 0);

  }
}

- (void)_recordMetricsForBuyButtonWithAssetID:(id)a3 actionDetails:(id)a4 offerType:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", JSARecordEventTypeClick, JSARecordKeyEventType);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("AudiobookPreview"), JSARecordKeyActionContext);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("buy"), JSARecordKeyActionType);
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, JSARecordKeyActionDetails);
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, JSARecordKeyOfferType);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, JSARecordKeyTargetId);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", JSARecordTargetTypeButton, JSARecordKeyTargetType);
  +[JSAApplication recordNativeEvent:](JSAApplication, "recordNativeEvent:", v9);

}

- (void)assetAudiobookStatusTogglePlayPause
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v2, "togglePlayPause");

}

- (AEAssetViewController)minifiedControllerLoadedAssetViewController
{
  return self->_minifiedControllerLoadedAssetViewController;
}

- (void)setMinifiedControllerLoadedAssetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, a3);
}

- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate
{
  return (AEAssetMinifiedControllerDelegate *)objc_loadWeakRetained((id *)&self->_minifiedControllerDelegate);
}

- (void)setMinifiedControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_minifiedControllerDelegate, a3);
}

- (AEAudioHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (BKAudiobookNowPlayingTouchViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (BOOL)assetAudiobookStatusIsPlaying
{
  return self->_assetAudiobookStatusPlaying;
}

- (void)setAssetAudiobookStatusPlaying:(BOOL)a3
{
  self->_assetAudiobookStatusPlaying = a3;
}

- (double)assetAudiobookStatusTrackProgress
{
  return self->_assetAudiobookStatusTrackProgress;
}

- (void)setAssetAudiobookStatusTrackProgress:(double)a3
{
  self->_assetAudiobookStatusTrackProgress = a3;
}

- (double)assetAudiobookStatusTrackDuration
{
  return self->_assetAudiobookStatusTrackDuration;
}

- (void)setAssetAudiobookStatusTrackDuration:(double)a3
{
  self->_assetAudiobookStatusTrackDuration = a3;
}

- (double)assetAudiobookStatusTrackTimeRemaining
{
  return self->_assetAudiobookStatusTrackTimeRemaining;
}

- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3
{
  self->_assetAudiobookStatusTrackTimeRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_minifiedControllerDelegate);
  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, 0);
}

@end
