@implementation BKLibraryBookshelfInfoCell

- (BKLibraryBookshelfInfoCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfInfoCell *v3;
  BKLibraryBookshelfInfoCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfInfoCell;
  v3 = -[BKLibraryBookshelfInfoCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKLibraryBookshelfInfoCell setOpaque:](v3, "setOpaque:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "reachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), v6);

    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_downloadStatusNotification:", BKLibraryDownloadStatusNotification, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell traitCollection](v4, "traitCollection"));
    v4->_currentUserInterfaceStyle = (int64_t)objc_msgSend(v7, "userInterfaceStyle");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v8, "addObserver:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v10 = -[BKLibraryBookshelfInfoCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v9, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kNetworkReachabilityChangedNotification"), v4);

  objc_msgSend(v3, "removeObserver:name:object:", self, BKLibraryDownloadStatusNotification, 0);
  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CB760);
  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CB768);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CB770);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("isNew"), off_1009CB778);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("readingProgress"), off_1009CB780);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_seriesBooks;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), off_1009CB788);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CB790);
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackTimeRemaining"), off_1009CB798);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfInfoCell;
  -[BKLibraryBookshelfInfoCell dealloc](&v11, "dealloc");
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  -[BKLibraryBookshelfInfoCell updateConfiguration:](self, "updateConfiguration:", 1);
}

- (void)_downloadStatusNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD block[4];
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = objc_opt_class(NSSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BKLibraryDownloadStatusKey));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "assetID"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100147378;
        v20[3] = &unk_1008E7338;
        v20[4] = self;
        v16 = v15;
        v21 = v16;
        v17 = objc_retainBlock(v20);
        if (v17)
        {
          if (+[NSThread isMainThread](NSThread, "isMainThread"))
          {
            ((void (*)(_QWORD *))v17[2])(v17);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100147420;
            block[3] = &unk_1008E7818;
            v19 = v17;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((-[BKLibraryBookshelfInfoCell isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0)
  {
    -[BKLibraryBookshelfInfoCell alpha](self, "alpha");
    if (v8 == 1.0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell subviews](self, "subviews"));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
            v16 = v15;
            v18 = v17;
            if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hitTest:withEvent:", v7, v16, v18));

              goto LABEL_13;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
  }
  v22.receiver = self;
  v22.super_class = (Class)BKLibraryBookshelfInfoCell;
  v19 = -[BKLibraryBookshelfInfoCell hitTest:withEvent:](&v22, "hitTest:withEvent:", v7, x, y);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
LABEL_13:

  return v20;
}

- (id)cellMetrics
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell metrics](self, "metrics"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)setLibraryAsset:(id)a3
{
  BKLibraryAsset *v5;
  BKLibraryAsset **p_libraryAsset;
  BKLibraryAsset *libraryAsset;
  NSSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSSet *v14;
  NSSet *seriesBooks;
  NSSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  BFMAsset *v24;
  NSSet *v25;
  BFMAsset *asset;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  BFMAsset *v30;
  id WeakRetained;
  _QWORD *v32;
  BKLibraryAsset *v33;
  _QWORD block[4];
  _QWORD *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    v33 = v5;
    -[BKLibraryAsset removeObserver:forKeyPath:context:](libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CB770);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("isNew"), off_1009CB778);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("readingProgress"), off_1009CB780);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = self->_seriesBooks;
    v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), off_1009CB788);
        }
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_libraryAsset, a3);
    if (*p_libraryAsset)
    {
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("combinedState"), 0, off_1009CB770);
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("isNew"), 0, off_1009CB778);
      -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("readingProgress"), 0, off_1009CB780);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset seriesBooks](*p_libraryAsset, "seriesBooks"));
      v14 = (NSSet *)objc_msgSend(v13, "copy");
      seriesBooks = self->_seriesBooks;
      self->_seriesBooks = v14;

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = self->_seriesBooks;
      v17 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      v5 = v33;
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 0, off_1009CB788);
          }
          v18 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v18);
      }

      if (*p_libraryAsset)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](*p_libraryAsset, "permanentOrTemporaryAssetID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "statusForAssetID:", v22));
        -[BKLibraryBookshelfInfoCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", v23);

      }
      else
      {
        -[BKLibraryBookshelfInfoCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
      }
      asset = self->_asset;
      if (asset)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset id](asset, "id"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset assetID](*p_libraryAsset, "assetID"));
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if ((v29 & 1) == 0)
        {
          v30 = self->_asset;
          self->_asset = 0;

        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

      if (WeakRetained)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100147AC8;
        v36[3] = &unk_1008E72C0;
        v36[4] = self;
        v32 = objc_retainBlock(v36);
        if (v32)
        {
          if (+[NSThread isMainThread](NSThread, "isMainThread"))
          {
            ((void (*)(_QWORD *))v32[2])(v32);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100147AD4;
            block[3] = &unk_1008E7818;
            v35 = v32;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          }
        }

      }
    }
    else
    {
      -[BKLibraryBookshelfInfoCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
      v24 = self->_asset;
      self->_asset = 0;

      v25 = self->_seriesBooks;
      self->_seriesBooks = 0;

      v5 = v33;
    }
  }

}

- (void)setupMenu
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell moreButton](self, "moreButton"));
  sub_100147B60(self, v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cloudButton](self, "cloudButton"));
  sub_100147B60(self, v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell downloadProgressButton](self, "downloadProgressButton"));
  sub_100147B60(self, v5);

}

- (void)setLibraryDownloadStatus:(id)a3
{
  BKLibraryDownloadStatus *v5;
  id *p_libraryDownloadStatus;
  BKLibraryDownloadStatus *libraryDownloadStatus;
  BCInsetsFittingButton *cloudButton;
  id WeakRetained;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];

  v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = (id *)&self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    if (!v5)
    {
      -[BCInsetsFittingButton removeFromSuperview](self->_cloudButton, "removeFromSuperview");
      cloudButton = self->_cloudButton;
      self->_cloudButton = 0;

      libraryDownloadStatus = (BKLibraryDownloadStatus *)*p_libraryDownloadStatus;
    }
    -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CB760);
    objc_msgSend(*p_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CB768);
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    if (*p_libraryDownloadStatus)
    {
      objc_msgSend(*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("combinedState"), 0, off_1009CB760);
      objc_msgSend(*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("progressValue"), 0, off_1009CB768);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

    if (WeakRetained)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100147E68;
      v13[3] = &unk_1008E72C0;
      v13[4] = self;
      v10 = objc_retainBlock(v13);
      if (v10)
      {
        if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          ((void (*)(_QWORD *))v10[2])(v10);
        }
        else
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_100147E74;
          v11[3] = &unk_1008E7818;
          v12 = v10;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

        }
      }

    }
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    v5 = obj;
    if (self->_libraryAsset)
    {
      -[BKLibraryBookshelfInfoCell updateConfiguration:](self, "updateConfiguration:", 1);
      v5 = obj;
    }
  }

}

- (void)setMetrics:(id)a3
{
  BKLibraryBookshelfCellMetrics *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  BKLibraryBookshelfCellMetrics *v39;

  v5 = (BKLibraryBookshelfCellMetrics *)a3;
  if (self->_metrics != v5)
  {
    v39 = v5;
    v6 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
    v7 = BUDynamicCast(v6, self->_metrics);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
    v10 = BUDynamicCast(v9, v39);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v8, "infoBarHeight");
    v13 = v12;
    objc_msgSend(v11, "infoBarHeight");
    if (v13 != v14)
      goto LABEL_6;
    objc_msgSend(v8, "dotsSpacing");
    v16 = v15;
    objc_msgSend(v11, "dotsSpacing");
    if (v16 != v17)
      goto LABEL_6;
    objc_msgSend(v8, "cloudSpacing");
    v19 = v18;
    objc_msgSend(v11, "cloudSpacing");
    if (v19 == v20
      && (objc_msgSend(v8, "infoBarDateSpacing"), v22 = v21, objc_msgSend(v11, "infoBarDateSpacing"), v22 == v23))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "priceColor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "priceColor"));
      if (objc_msgSend(v26, "isEqual:", v27))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "infoBadgeFontAttributes"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infoBadgeFontAttributes"));
        if (objc_msgSend(v28, "isEqual:", v29))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expectedDateFontAttributes"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "expectedDateFontAttributes"));
          v38 = v30;
          if (objc_msgSend(v30, "isEqual:")
            && (objc_msgSend(v8, "audioBadgeSpacing"), v32 = v31, objc_msgSend(v11, "audioBadgeSpacing"), v32 == v33))
          {
            objc_msgSend(v8, "badgeEndCapWidth");
            v35 = v34;
            objc_msgSend(v11, "badgeEndCapWidth");
            v24 = v35 != v36;
          }
          else
          {
            v24 = 1;
          }

        }
        else
        {
          v24 = 1;
        }

      }
      else
      {
        v24 = 1;
      }

    }
    else
    {
LABEL_6:
      v24 = 1;
    }
    objc_storeStrong((id *)&self->_metrics, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

    if (WeakRetained && v24)
      -[BKLibraryBookshelfInfoCell updateConfiguration:](self, "updateConfiguration:", 1);

    v5 = v39;
  }

}

- (void)layoutAudioViews:(CGRect *)a3 bounds:(CGRect)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  MPUNowPlayingIndicatorView *nowPlayingIndicator;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CALayer *audiobookBadge;
  uint64_t v19;
  double v20;
  void *v21;
  CGFloat v22;
  CGRect v23;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  nowPlayingIndicator = self->_nowPlayingIndicator;
  memset(&v23, 0, sizeof(v23));
  if (nowPlayingIndicator)
  {
    -[MPUNowPlayingIndicatorView bk_width](nowPlayingIndicator, "bk_width");
    CGRectDivide(*a3, &v23, a3, v13, CGRectMinXEdge);
    -[MPUNowPlayingIndicatorView maximumLevelHeight](self->_nowPlayingIndicator, "maximumLevelHeight");
    v15 = v14;
    v23.origin.y = v23.origin.y + (CGRectGetHeight(v23) - v14) * 0.5;
    v23.size.height = v15;
    -[MPUNowPlayingIndicatorView setFrame:](self->_nowPlayingIndicator, "setFrame:", IMRectFlippedForRTL(v5, v23.origin.x, v23.origin.y, v23.size.width, v15, x, y, width, height));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v16, "audioBadgeSpacing");
    CGRectDivide(*a3, &v23, a3, v17, CGRectMinXEdge);

    audiobookBadge = self->_audiobookBadge;
    v19 = 1;
  }
  else
  {
    CGRectDivide(*a3, &v23, a3, self->_audiobookBadgeSize.width, CGRectMinXEdge);
    v20 = self->_audiobookBadgeSize.height;
    v23.origin.y = v23.origin.y + (CGRectGetHeight(v23) - v20) * 0.5;
    v23.size.height = v20;
    -[CALayer setFrame:](self->_audiobookBadge, "setFrame:", IMRectFlippedForRTL(v5, v23.origin.x, v23.origin.y, v23.size.width, v20, x, y, width, height));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v21, "audioBadgeSpacing");
    CGRectDivide(*a3, &v23, a3, v22, CGRectMinXEdge);

    audiobookBadge = self->_audiobookBadge;
    v19 = 0;
  }
  -[CALayer setHidden:](audiobookBadge, "setHidden:", v19);
}

- (BOOL)showsDateBadge
{
  return self->_dateBadge != 0;
}

- (BOOL)showsPlaybackProgress
{
  return self->_audiobookStatus != 0;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell traitCollection](self, "traitCollection", a3, a4));
  -[BKLibraryBookshelfInfoCell setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  CGFloat Width;
  void *v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  CGFloat v29;
  void *v30;
  CGFloat v31;
  void *v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  BKLibraryBookshelfInfoBadge *badge;
  CGSize size;
  char v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  void *v46;
  CGFloat v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  char v56;
  UILabel *dateBadge;
  double Height;
  CGFloat MaxY;
  void *v60;
  CGRect v61;
  CGRect slice;
  CGRect remainder;
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v64.receiver = self;
  v64.super_class = (Class)BKLibraryBookshelfInfoCell;
  -[BKLibraryBookshelfInfoCell layoutSubviews](&v64, "layoutSubviews");
  -[BKLibraryBookshelfInfoCell bounds](self, "bounds");
  if (v5 > 0.0)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

    remainder.origin.x = v7;
    remainder.origin.y = v8;
    remainder.size.width = v9;
    remainder.size.height = v10;
    memset(&slice, 0, sizeof(slice));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v13, "infoBarExpectedDateHeight");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v16, "infoBarDateSpacing");
    v18 = v17;

    v65.origin.x = v7;
    v65.origin.y = v8;
    v65.size.width = v9;
    v65.size.height = v10;
    CGRectDivide(v65, &slice, &remainder, v15, CGRectMaxYEdge);
    remainder.size.height = remainder.size.height - v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton superview](self->_moreButton, "superview"));

    if (v19)
    {
      memset(&v61, 0, sizeof(v61));
      -[BCInsetsFittingButton bounds](self->_moreButton, "bounds");
      Width = CGRectGetWidth(v66);
      CGRectDivide(remainder, &v61, &remainder, Width, CGRectMaxXEdge);
      -[BCInsetsFittingButton setFrame:](self->_moreButton, "setFrame:", IMRectFlippedForRTL(v12 == (id)1, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height, v7, v8, v9, v10));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v21, "dotsSpacing");
      CGRectDivide(remainder, &v61, &remainder, v22, CGRectMaxXEdge);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "collection"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionID"));
    LODWORD(v26) = objc_msgSend(v25, "isEqualToString:", kBKCollectionDefaultIDFinished);

    if (self->_audiobookBadge)
    {
      v27 = -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") == 10 ? 1 : (int)v26;
      if (v27 == 1)
        -[BKLibraryBookshelfInfoCell layoutAudioViews:bounds:isRTL:](self, "layoutAudioViews:bounds:isRTL:", &remainder, v12 == (id)1, v7, v8, v9, v10);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton superview](self->_cloudButton, "superview"));

    if (v28)
    {
      memset(&v61, 0, sizeof(v61));
      -[BCInsetsFittingButton bounds](self->_cloudButton, "bounds");
      v29 = CGRectGetWidth(v67);
      CGRectDivide(remainder, &v61, &remainder, v29, CGRectMaxXEdge);
      -[BCInsetsFittingButton setFrame:](self->_cloudButton, "setFrame:", IMRectFlippedForRTL(v12 == (id)1, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height, v7, v8, v9, v10));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v30, "cloudSpacing");
      CGRectDivide(remainder, &v61, &remainder, v31, CGRectMaxXEdge);

    }
    if (self->_downloadProgressButton)
    {
      memset(&v61, 0, sizeof(v61));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v32, "infoBarHeight");
      CGRectDivide(remainder, &v61, &remainder, v33, CGRectMaxXEdge);

      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      -[IMRadialProgressButton setFrame:](self->_downloadProgressButton, "setFrame:", IMRectFlippedForRTL(v12 == (id)1, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height, v7, v8, v9, v10));
      +[CATransaction commit](CATransaction, "commit");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v34, "cloudSpacing");
      CGRectDivide(remainder, &v61, &remainder, v35, CGRectMaxXEdge);

    }
    badge = self->_badge;
    if (badge)
    {
      v60 = v24;
      size = CGRectZero.size;
      v61.origin = CGRectZero.origin;
      v61.size = size;
      v38 = (char)v26;
      if (self->_badgeBackgroundColor)
      {
        -[BKLibraryBookshelfInfoBadge sizeThatFits:](badge, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
        v40 = v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v41, "badgeEndCapWidth");
        v43 = v40 + v42 * 2.0;

        CGRectDivide(remainder, &v61, &remainder, v43, CGRectMinXEdge);
      }
      else
      {
        v61 = remainder;
      }
      -[BKLibraryBookshelfInfoBadge setFrame:](self->_badge, "setFrame:", IMRectFlippedForRTL(v12 == (id)1, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height, v7, v8, v9, v10));
      v44 = CGRectGetHeight(v61) * 0.5;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
      objc_msgSend(v45, "setCornerRadius:", v44);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v46, "cloudSpacing");
      CGRectDivide(remainder, &v61, &remainder, v47, CGRectMinXEdge);

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", -[BKLibraryBookshelfInfoCell currentUserInterfaceStyle](self, "currentUserInterfaceStyle")));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell badgeFrameColor](self, "badgeFrameColor"));
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "resolvedColorWithTraitCollection:", v48)));
      v51 = objc_msgSend(v50, "CGColor");
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
      objc_msgSend(v52, "setBorderColor:", v51);

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell badgeBackgroundColor](self, "badgeBackgroundColor"));
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "resolvedColorWithTraitCollection:", v48)));
      v54 = objc_msgSend(v26, "CGColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
      objc_msgSend(v55, "setBackgroundColor:", v54);

      LOBYTE(v26) = v38;
      v24 = v60;
    }
    if (self->_audiobookBadge)
    {
      v56 = -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") == 10 ? 1 : (char)v26;
      if ((v56 & 1) == 0)
        -[BKLibraryBookshelfInfoCell layoutAudioViews:bounds:isRTL:](self, "layoutAudioViews:bounds:isRTL:", &remainder, v12 == (id)1, v7, v8, v9, v10);
    }
    dateBadge = self->_dateBadge;
    if (dateBadge)
    {
      -[UILabel bounds](dateBadge, "bounds");
      Height = CGRectGetHeight(v68);
      MaxY = CGRectGetMaxY(slice);
      slice.origin.y = MaxY - Height;
      slice.size.height = Height;
      -[UILabel setFrame:](self->_dateBadge, "setFrame:", IMRectFlippedForRTL(v12 == (id)1, slice.origin.x, MaxY - Height, slice.size.width, Height, v7, v8, v9, v10));
    }

  }
}

- (void)setAsset:(id)a3
{
  BFMAsset *v5;
  BFMAsset *v6;

  v5 = (BFMAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[BKLibraryBookshelfInfoCell updateConfiguration:](self, "updateConfiguration:", 1);
    v5 = v6;
  }

}

- (void)updateInfoKind
{
  uint64_t v3;
  unsigned int v4;
  BKLibraryAsset *libraryAsset;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;
  BKLibraryAsset *v9;
  unsigned int v10;
  void *v11;

  if (-[BKLibraryAsset isNew](self->_libraryAsset, "isNew"))
    v3 = 1;
  else
    v3 = 2;
  if ((-[BKLibraryAsset isContainer](self->_libraryAsset, "isContainer") & 1) != 0)
  {
    v3 = 9;
    goto LABEL_19;
  }
  if ((-[BKLibraryAsset isProof](self->_libraryAsset, "isProof") & 1) != 0)
  {
    v3 = 4;
    goto LABEL_19;
  }
  if ((-[BKLibraryAsset isPreorderBook](self->_libraryAsset, "isPreorderBook") & 1) != 0)
  {
    v3 = 6;
    goto LABEL_19;
  }
  if ((-[BFMAsset isPreorder](self->_asset, "isPreorder") & 1) != 0)
  {
    v3 = 5;
    goto LABEL_19;
  }
  v4 = -[BKLibraryAsset state](self->_libraryAsset, "state");
  libraryAsset = self->_libraryAsset;
  if (v4 == 5)
  {
    v6 = -[BKLibraryAsset seriesNextFlag](libraryAsset, "seriesNextFlag") == 0;
    v7 = 3;
    goto LABEL_16;
  }
  v8 = -[BKLibraryAsset isAudiobook](libraryAsset, "isAudiobook");
  v9 = self->_libraryAsset;
  if (v8)
  {
    v6 = -[BKLibraryAsset isOwned](v9, "isOwned") == 0;
    v7 = 10;
LABEL_16:
    if (v6)
      v3 = 8;
    else
      v3 = v7;
    goto LABEL_19;
  }
  if ((-[BKLibraryAsset isSample](v9, "isSample") & 1) != 0
    || (-[BKLibraryAsset isOwned](self->_libraryAsset, "isOwned") & 1) == 0
    && (-[BKLibraryAsset isInSamples](self->_libraryAsset, "isInSamples") & 1) != 0)
  {
    v3 = 7;
  }
  else if (-[BKLibraryAsset state](self->_libraryAsset, "state") != 1)
  {
    if (-[BKLibraryAsset state](self->_libraryAsset, "state") == 6)
      v3 = 8;
    else
      v3 = v3;
  }
LABEL_19:
  v10 = -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind");
  if ((_DWORD)v3 == 2 || v10 != (_DWORD)v3)
  {
    -[BKLibraryBookshelfInfoCell setInfoKind:](self, "setInfoKind:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell badge](self, "badge"));
    objc_msgSend(v11, "removeFromSuperview");

    -[BKLibraryBookshelfInfoCell setBadge:](self, "setBadge:", 0);
  }
}

- (BOOL)isAssetDownloading
{
  void *v3;
  BOOL v4;

  if ((-[BKLibraryAsset isDownloading](self->_libraryAsset, "isDownloading") & 1) == 0
    && !-[BKLibraryAsset isDownloadingSupplementalContent](self->_libraryAsset, "isDownloadingSupplementalContent"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell libraryDownloadStatus](self, "libraryDownloadStatus"));
  v4 = objc_msgSend(v3, "combinedState") == (id)4;

  return v4;
}

- (void)updateConfiguration:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100148D40;
  v3[3] = &unk_1008E83C0;
  v3[4] = self;
  v4 = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (BOOL)_shouldRemovePriceBadge
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collection"));

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionID"));
  v5 = objc_msgSend((id)v4, "isEqualToString:", kBKCollectionDefaultIDFinished);

  LOBYTE(v4) = +[BKReachability isOffline](BKReachability, "isOffline");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v7 = objc_msgSend(v6, "isBookStoreAllowed");

  return v4 | v7 ^ 1 | v5;
}

- (void)createOrUpdateFinishedLabelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collection"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
  v6 = objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDFinished);

  if (-[BKLibraryAsset isFinished](self->_libraryAsset, "isFinished"))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Finished_Infobar"), CFSTR("Finished"), &stru_10091C438));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10014A154;
    v12[3] = &unk_1008EC0B8;
    v13 = v9;
    v11 = v9;
    -[BKLibraryBookshelfInfoCell createOrUpdateBadgeWithBadgeBackgroundColor:badgeFrameColor:textConfigurationBlock:](self, "createOrUpdateBadgeWithBadgeBackgroundColor:badgeFrameColor:textConfigurationBlock:", 0, v10, v12);

  }
}

- (void)createOrUpdateDateBadge
{
  UILabel *v3;
  UILabel *dateBadge;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  CGRect v23;

  if (!self->_dateBadge)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    dateBadge = self->_dateBadge;
    self->_dateBadge = v3;

    -[UILabel setUserInteractionEnabled:](self->_dateBadge, "setUserInteractionEnabled:", 0);
    -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_dateBadge);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell libraryAsset](self, "libraryAsset"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expectedDate"));

  v6 = v20;
  if (!v20)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell asset](self, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "expectedReleaseDate"));
    v9 = v8;
    if (v8)
    {
      v21 = v8;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell asset](self, "asset"));
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "releaseDate"));

    }
    v6 = v21;
  }
  v22 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[JSADateFormatter stringFromDate:dateStyle:timeStyle:](JSADateFormatter, "stringFromDate:dateStyle:timeStyle:", v6, 1, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "infoExpectedDateString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expectedDateFontAttributes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v14, v16));
  -[UILabel setAttributedText:](self->_dateBadge, "setAttributedText:", v17);

  -[UILabel setTextAlignment:](self->_dateBadge, "setTextAlignment:", 4);
  -[UILabel sizeThatFits:](self->_dateBadge, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v19 = v18;
  -[BKLibraryBookshelfInfoCell bounds](self, "bounds");
  -[UILabel setBounds:](self->_dateBadge, "setBounds:", 0.0, 0.0, CGRectGetWidth(v23), v19);

}

- (void)createOrUpdateAudiobookBadge
{
  void *v3;
  CALayer *v4;
  void *v5;
  MPUNowPlayingIndicatorView *v6;
  CALayer *v7;
  CALayer *audiobookBadge;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  AEAssetAudiobookStatus *audiobookStatus;
  MPUNowPlayingIndicatorView *v16;
  MPUNowPlayingIndicatorView *nowPlayingIndicator;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  MPUNowPlayingIndicatorView *v26;
  MPUNowPlayingIndicatorView *v27;
  uint64_t v28;
  MPUNowPlayingIndicatorView *v29;
  id v30;

  if (-[BKLibraryAsset isAudiobook](self->_libraryAsset, "isAudiobook")
    && -[BKLibraryAsset contentType](self->_libraryAsset, "contentType") != 5)
  {
    if (!self->_audiobookBadge)
    {
      v7 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      audiobookBadge = self->_audiobookBadge;
      self->_audiobookBadge = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell layer](self, "layer"));
      objc_msgSend(v9, "addSublayer:", self->_audiobookBadge);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infoBarAudiobookImageWithTintColor:", v11));

    objc_msgSend(v12, "size");
    self->_audiobookBadgeSize.width = v13;
    self->_audiobookBadgeSize.height = v14;
    -[CALayer setBounds:](self->_audiobookBadge, "setBounds:", 0.0, 0.0, v13, v14);
    v30 = objc_retainAutorelease(v12);
    -[CALayer setContents:](self->_audiobookBadge, "setContents:", objc_msgSend(v30, "CGImage"));
    audiobookStatus = self->_audiobookStatus;
    if (audiobookStatus)
    {
      if (!self->_nowPlayingIndicator)
      {
        v16 = (MPUNowPlayingIndicatorView *)objc_msgSend(objc_alloc((Class)MPUNowPlayingIndicatorView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        nowPlayingIndicator = self->_nowPlayingIndicator;
        self->_nowPlayingIndicator = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
        -[MPUNowPlayingIndicatorView setLevelGuttersColor:](self->_nowPlayingIndicator, "setLevelGuttersColor:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v19, "nowPlayingInterLevelSpacing");
        -[MPUNowPlayingIndicatorView setInterLevelSpacing:](self->_nowPlayingIndicator, "setInterLevelSpacing:");

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v20, "nowPlayingLevelCornerRadius");
        -[MPUNowPlayingIndicatorView setLevelCornerRadius:](self->_nowPlayingIndicator, "setLevelCornerRadius:");

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v21, "nowPlayingLevelWidth");
        -[MPUNowPlayingIndicatorView setLevelWidth:](self->_nowPlayingIndicator, "setLevelWidth:");

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v22, "nowPlayingMaximumLevelHeight");
        -[MPUNowPlayingIndicatorView setMaximumLevelHeight:](self->_nowPlayingIndicator, "setMaximumLevelHeight:");

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        objc_msgSend(v23, "nowPlayingMinimumLevelHeight");
        -[MPUNowPlayingIndicatorView setMinimumLevelHeight:](self->_nowPlayingIndicator, "setMinimumLevelHeight:");

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
        -[MPUNowPlayingIndicatorView setNumberOfLevels:](self->_nowPlayingIndicator, "setNumberOfLevels:", objc_msgSend(v24, "nowPlayingNumberOfLevels"));

        -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_nowPlayingIndicator);
        audiobookStatus = self->_audiobookStatus;
      }
      v25 = -[AEAssetAudiobookStatus assetAudiobookStatusIsPlaying](audiobookStatus, "assetAudiobookStatusIsPlaying");
      v26 = self->_nowPlayingIndicator;
      if (v25)
      {
        -[MPUNowPlayingIndicatorView setAlpha:](v26, "setAlpha:", 1.0);
        v27 = self->_nowPlayingIndicator;
        v28 = 1;
      }
      else
      {
        -[MPUNowPlayingIndicatorView setAlpha:](v26, "setAlpha:", 0.6);
        v27 = self->_nowPlayingIndicator;
        v28 = 2;
      }
      -[MPUNowPlayingIndicatorView setPlaybackState:](v27, "setPlaybackState:", v28);
    }
    else
    {
      -[MPUNowPlayingIndicatorView removeFromSuperview](self->_nowPlayingIndicator, "removeFromSuperview");
      v29 = self->_nowPlayingIndicator;
      self->_nowPlayingIndicator = 0;

    }
    -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell audiobookBadge](self, "audiobookBadge"));

    if (v3)
    {
      -[CALayer removeFromSuperlayer](self->_audiobookBadge, "removeFromSuperlayer");
      v4 = self->_audiobookBadge;
      self->_audiobookBadge = 0;

      -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell nowPlayingIndicator](self, "nowPlayingIndicator"));

    if (v5)
    {
      -[MPUNowPlayingIndicatorView removeFromSuperview](self->_nowPlayingIndicator, "removeFromSuperview");
      v6 = self->_nowPlayingIndicator;
      self->_nowPlayingIndicator = 0;

      -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)createOrUpdateMoreButton
{
  BCInsetsFittingButton *moreButton;
  void *v4;
  void *v5;
  void *v6;
  BCInsetsFittingButton *v7;
  BCInsetsFittingButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  moreButton = self->_moreButton;
  if (!moreButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionMenuImageWithTintColor:", v5));

    v7 = (BCInsetsFittingButton *)objc_claimAutoreleasedReturnValue(+[BCInsetsFittingButton buttonWithType:](BCInsetsFittingButton, "buttonWithType:", 0));
    v8 = self->_moreButton;
    self->_moreButton = v7;

    objc_msgSend(v6, "size");
    v10 = v9;
    objc_msgSend(v6, "size");
    v11 = 0.0;
    -[BCInsetsFittingButton setBounds:](self->_moreButton, "setBounds:", 0.0, 0.0, v10, v12);
    objc_msgSend(v6, "size");
    v14 = 0.0;
    if ((44.0 - v13) * 0.5 >= 0.0)
    {
      objc_msgSend(v6, "size");
      v14 = (44.0 - v15) * 0.5;
    }
    objc_msgSend(v6, "size");
    if ((44.0 - v16) * 0.5 >= 0.0)
    {
      objc_msgSend(v6, "size");
      v11 = (44.0 - v17) * 0.5;
    }
    -[BCInsetsFittingButton setTouchInsets:](self->_moreButton, "setTouchInsets:", -v11, -v14, -v11, -v14);
    -[BCInsetsFittingButton setImage:forState:](self->_moreButton, "setImage:forState:", v6, 0);

    moreButton = self->_moreButton;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton superview](moreButton, "superview"));

  if (!v18)
    -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_moreButton);
}

- (void)createOrUpdateCloudButton
{
  int64_t v3;
  int64_t v4;
  void *v5;
  BCInsetsFittingButton *v6;
  BCInsetsFittingButton *cloudButton;
  void *v8;
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
  double v19;
  void *v20;
  id v21;

  v3 = -[BKLibraryBookshelfInfoCell _bookshelfCloudState](self, "_bookshelfCloudState");
  if (v3 && (v4 = v3, -[BKLibraryAsset contentType](self->_libraryAsset, "contentType") != 5))
  {
    if (!self->_cloudButton)
    {
      v6 = (BCInsetsFittingButton *)objc_claimAutoreleasedReturnValue(+[BCInsetsFittingButton buttonWithType:](BCInsetsFittingButton, "buttonWithType:", 0));
      cloudButton = self->_cloudButton;
      self->_cloudButton = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton layer](self->_cloudButton, "layer"));
      objc_msgSend(v8, "setMasksToBounds:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
      -[BCInsetsFittingButton setTintColor:](self->_cloudButton, "setTintColor:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell dataSource](self, "dataSource"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "templateCloudImageForCloudState:", v4));

    objc_msgSend(v21, "size");
    v12 = v11;
    objc_msgSend(v21, "size");
    v13 = 0.0;
    -[BCInsetsFittingButton setBounds:](self->_cloudButton, "setBounds:", 0.0, 0.0, v12, v14);
    objc_msgSend(v21, "size");
    v16 = 0.0;
    if ((44.0 - v15) * 0.5 >= 0.0)
    {
      objc_msgSend(v21, "size");
      v16 = (44.0 - v17) * 0.5;
    }
    objc_msgSend(v21, "size");
    if ((44.0 - v18) * 0.5 >= 0.0)
    {
      objc_msgSend(v21, "size");
      v13 = (44.0 - v19) * 0.5;
    }
    -[BCInsetsFittingButton setTouchInsets:](self->_cloudButton, "setTouchInsets:", -v13, -v16, -v13, -v16);
    -[BCInsetsFittingButton setImage:forState:](self->_cloudButton, "setImage:forState:", v21, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton superview](self->_cloudButton, "superview"));

    if (!v20)
    {
      -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_cloudButton);
      -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton superview](self->_cloudButton, "superview"));

    if (v5)
    {
      -[BCInsetsFittingButton removeFromSuperview](self->_cloudButton, "removeFromSuperview");
      -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)createOrUpdateDownloadProgressButton
{
  void *v3;
  IMRadialProgressButton *v4;
  IMRadialProgressButton *v5;
  IMRadialProgressButton *downloadProgressButton;
  void *v7;
  void *v8;
  double v9;

  if (-[BKLibraryBookshelfInfoCell isAssetDownloading](self, "isAssetDownloading")
    && -[BKLibraryAsset contentType](self->_libraryAsset, "contentType") != 5)
  {
    if (-[BKLibraryBookshelfInfoCell isAssetDownloading](self, "isAssetDownloading"))
    {
      if (!self->_downloadProgressButton)
      {
        v5 = (IMRadialProgressButton *)objc_msgSend(objc_alloc((Class)IMRadialProgressButton), "initWithFrame:", 0.0, 0.0, 17.0, 17.0);
        downloadProgressButton = self->_downloadProgressButton;
        self->_downloadProgressButton = v5;

        -[IMRadialProgressButton setCenterImageNormal:](self->_downloadProgressButton, "setCenterImageNormal:", 0);
        -[IMRadialProgressButton setCenterImageSelected:](self->_downloadProgressButton, "setCenterImageSelected:", 0);
        -[IMRadialProgressButton setInscribeProgress:](self->_downloadProgressButton, "setInscribeProgress:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
        -[IMRadialProgressButton setProgressColor:](self->_downloadProgressButton, "setProgressColor:", v7);

        -[IMRadialProgressButton setProgressLineCap:](self->_downloadProgressButton, "setProgressLineCap:", 1);
        -[IMRadialProgressButton setProgressThickness:](self->_downloadProgressButton, "setProgressThickness:", 2.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
        -[IMRadialProgressButton setTrackColor:](self->_downloadProgressButton, "setTrackColor:", v8);

        -[IMRadialProgressButton setTrackDiameter:](self->_downloadProgressButton, "setTrackDiameter:", 17.0);
        -[IMRadialProgressButton setTrackThickness:](self->_downloadProgressButton, "setTrackThickness:", 2.0);
        -[IMRadialProgressButton setTouchInsets:](self->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
        sub_100147B60(self, self->_downloadProgressButton);
        -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_downloadProgressButton);
      }
      -[BKLibraryDownloadStatus progressValue](self->_libraryDownloadStatus, "progressValue");
      *(float *)&v9 = v9;
      -[IMRadialProgressButton setProgress:](self->_downloadProgressButton, "setProgress:", v9);
    }
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton superview](self->_downloadProgressButton, "superview"));

    if (v3)
    {
      -[IMRadialProgressButton removeFromSuperview](self->_downloadProgressButton, "removeFromSuperview");
      v4 = self->_downloadProgressButton;
      self->_downloadProgressButton = 0;

    }
  }
  -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)createOrUpdatePriceBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  if (-[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") != 5
    && -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") != 6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "priceManager"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell libraryAsset](self, "libraryAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10014ADE4;
    v8[3] = &unk_1008EC158;
    objc_copyWeak(&v10, &location);
    v7 = v6;
    v9 = v7;
    objc_msgSend(v4, "fetchPriceForAssetID:completion:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (void)createOrUpdateBadgeWithBadgeBackgroundColor:(id)a3 badgeFrameColor:(id)a4 textConfigurationBlock:(id)a5
{
  id v8;
  void (**v9)(id, BKLibraryBookshelfInfoBadge *);
  BKLibraryBookshelfInfoBadge *v10;
  BKLibraryBookshelfInfoBadge *badge;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = (void (**)(id, BKLibraryBookshelfInfoBadge *))a5;
  if (!self->_badge)
  {
    v10 = objc_alloc_init(BKLibraryBookshelfInfoBadge);
    badge = self->_badge;
    self->_badge = v10;

    -[BKLibraryBookshelfInfoBadge setUserInteractionEnabled:](self->_badge, "setUserInteractionEnabled:", 0);
    -[BKLibraryBookshelfInfoCell addSubview:](self, "addSubview:", self->_badge);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell cellMetrics](self, "cellMetrics"));
  objc_msgSend(v12, "infoBarHeight");
  v14 = v13;

  v9[2](v9, self->_badge);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
  objc_msgSend(v15, "setBorderWidth:", 0.0);

  if (v22)
  {
    -[BKLibraryBookshelfInfoBadge setTextAlignment:](self->_badge, "setTextAlignment:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
    objc_msgSend(v16, "setCornerRadius:", v14 * 0.5);

    -[BKLibraryBookshelfInfoCell setBadgeBackgroundColor:](self, "setBadgeBackgroundColor:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v18 = objc_msgSend(v22, "isEqual:", v17);

    if (v18)
    {
      -[BKLibraryBookshelfInfoCell setBadgeFrameColor:](self, "setBadgeFrameColor:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoBadge layer](self->_badge, "layer"));
      objc_msgSend(v19, "setBorderWidth:", 1.0);

    }
    else
    {
      -[BKLibraryBookshelfInfoCell setBadgeFrameColor:](self, "setBadgeFrameColor:", 0);
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection") == (id)1;

    -[BKLibraryBookshelfInfoBadge setTextAlignment:](self->_badge, "setTextAlignment:", 2 * v21);
    -[BKLibraryBookshelfInfoCell setBadgeFrameColor:](self, "setBadgeFrameColor:", 0);
    -[BKLibraryBookshelfInfoCell setBadgeBackgroundColor:](self, "setBadgeBackgroundColor:", 0);
  }
  -[BKLibraryBookshelfInfoCell setNeedsLayout](self, "setNeedsLayout");

}

- (int64_t)_bookshelfCloudState
{
  int64_t v3;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;

  if (-[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") == 9
    || -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind") == 6
    || -[BKLibraryBookshelfInfoCell isAssetDownloading](self, "isAssetDownloading"))
  {
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell libraryDownloadStatus](self, "libraryDownloadStatus"));
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "state");
  else
    v7 = 0;
  v8 = -[BKLibraryAsset isCloud](self->_libraryAsset, "isCloud");
  v9 = 3;
  if (v7 != (id)10)
    v9 = 0;
  if (v7 == (id)9)
    v9 = 2;
  if (((v7 != (id)5) & v8) != 0)
    v3 = 1;
  else
    v3 = v9;

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v15;
  objc_super v16;
  _QWORD block[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009CB778 == a6 || off_1009CB780 == a6 || off_1009CB788 == a6)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10014B618;
    v22[3] = &unk_1008E72C0;
    v22[4] = self;
    v15 = v22;
LABEL_21:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    goto LABEL_22;
  }
  if (off_1009CB760 == a6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10014B660;
    v21[3] = &unk_1008E72C0;
    v21[4] = self;
    v15 = v21;
    goto LABEL_21;
  }
  if (off_1009CB768 == a6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10014B66C;
    v20[3] = &unk_1008E72C0;
    v20[4] = self;
    v15 = v20;
    goto LABEL_21;
  }
  if (off_1009CB770 == a6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10014B678;
    v19[3] = &unk_1008E72C0;
    v19[4] = self;
    v15 = v19;
    goto LABEL_21;
  }
  if (off_1009CB790 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10014B684;
    v18[3] = &unk_1008E72C0;
    v18[4] = self;
    v15 = v18;
    goto LABEL_21;
  }
  if (off_1009CB798 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014B690;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    v15 = block;
    goto LABEL_21;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfInfoCell;
  -[BKLibraryBookshelfInfoCell observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_22:

}

- (void)reachabilityChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014B6F4;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setAudiobookStatus:(id)a3
{
  AEAssetAudiobookStatus *v5;
  AEAssetAudiobookStatus **p_audiobookStatus;
  unsigned int v7;
  AEAssetAudiobookStatus *v8;

  v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  if (self->_audiobookStatus != v5)
  {
    v8 = v5;
    v7 = -[BKLibraryBookshelfInfoCell infoKind](self, "infoKind");
    v5 = v8;
    if (!v8 || v7 == 10)
    {
      if (*p_audiobookStatus)
      {
        -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](*p_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CB790);
        -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](*p_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackTimeRemaining"), off_1009CB798);
      }
      objc_storeStrong((id *)&self->_audiobookStatus, a3);
      if (*p_audiobookStatus)
      {
        -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), 0, off_1009CB790);
        -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusTrackTimeRemaining"), 0, off_1009CB798);
      }
      -[BKLibraryBookshelfInfoCell updateConfiguration:](self, "updateConfiguration:", 1);
      v5 = v8;
    }
  }

}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryBookshelfInfoCellDelegate)delegate
{
  return (BKLibraryBookshelfInfoCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)leftAlignedCloudIcon
{
  return self->_leftAlignedCloudIcon;
}

- (void)setLeftAlignedCloudIcon:(BOOL)a3
{
  self->_leftAlignedCloudIcon = a3;
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (NSNumber)bkaxAudiobookReadPercentage
{
  return self->_bkaxAudiobookReadPercentage;
}

- (void)setBkaxAudiobookReadPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_bkaxAudiobookReadPercentage, a3);
}

- (BCInsetsFittingButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (int)infoKind
{
  return self->_infoKind;
}

- (void)setInfoKind:(int)a3
{
  self->_infoKind = a3;
}

- (BKLibraryBookshelfInfoBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (UILabel)dateBadge
{
  return self->_dateBadge;
}

- (void)setDateBadge:(id)a3
{
  objc_storeStrong((id *)&self->_dateBadge, a3);
}

- (CALayer)audiobookBadge
{
  return self->_audiobookBadge;
}

- (void)setAudiobookBadge:(id)a3
{
  objc_storeStrong((id *)&self->_audiobookBadge, a3);
}

- (CGSize)audiobookBadgeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_audiobookBadgeSize.width;
  height = self->_audiobookBadgeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAudiobookBadgeSize:(CGSize)a3
{
  self->_audiobookBadgeSize = a3;
}

- (BCInsetsFittingButton)cloudButton
{
  return self->_cloudButton;
}

- (void)setCloudButton:(id)a3
{
  objc_storeStrong((id *)&self->_cloudButton, a3);
}

- (IMRadialProgressButton)downloadProgressButton
{
  return self->_downloadProgressButton;
}

- (void)setDownloadProgressButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressButton, a3);
}

- (BKLibraryDownloadStatus)libraryDownloadStatus
{
  return self->_libraryDownloadStatus;
}

- (MPUNowPlayingIndicatorView)nowPlayingIndicator
{
  return self->_nowPlayingIndicator;
}

- (void)setNowPlayingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingIndicator, a3);
}

- (UIColor)badgeFrameColor
{
  return self->_badgeFrameColor;
}

- (void)setBadgeFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeFrameColor, a3);
}

- (UIColor)badgeBackgroundColor
{
  return self->_badgeBackgroundColor;
}

- (void)setBadgeBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeBackgroundColor, a3);
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (NSSet)seriesBooks
{
  return self->_seriesBooks;
}

- (void)setSeriesBooks:(id)a3
{
  objc_storeStrong((id *)&self->_seriesBooks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesBooks, 0);
  objc_storeStrong((id *)&self->_badgeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_badgeFrameColor, 0);
  objc_storeStrong((id *)&self->_nowPlayingIndicator, 0);
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_cloudButton, 0);
  objc_storeStrong((id *)&self->_audiobookBadge, 0);
  objc_storeStrong((id *)&self->_dateBadge, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_bkaxAudiobookReadPercentage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
}

@end
