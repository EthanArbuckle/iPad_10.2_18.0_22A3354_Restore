@implementation MCDNowPlayingContentManager

- (MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCDNowPlayingContentManager *v11;
  MCDNowPlayingContentManager *v12;
  void *v13;
  objc_class *v14;
  _MCDNowPlayingContentManager *v15;
  _MCDNowPlayingContentManager *impl;
  MCDLibraryAddObserver *v17;
  MCDLibraryAddObserver *libraryAddObserver;
  CARSessionStatus *v19;
  CARSessionStatus *carSessionStatus;
  SiriDirectActionSource *v21;
  SiriDirectActionSource *siriDirectActionSource;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  objc_super v29;
  id location[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MCDNowPlayingContentManager;
  v11 = -[MCDNowPlayingContentManager init](&v29, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_contentManagerDelegate, v8);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v13 = (void *)qword_1011ECD80;
    v34 = qword_1011ECD80;
    if (!qword_1011ECD80)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_10002E6EC;
      location[3] = &unk_1010A89D8;
      location[4] = &v31;
      sub_10002E6EC((uint64_t)location);
      v13 = (void *)v32[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v31, 8);
    v15 = (_MCDNowPlayingContentManager *)objc_msgSend([v14 alloc], "initWithDelegate:dataSource:bundleID:", v12, v9, v10);
    impl = v12->_impl;
    v12->_impl = v15;

    v17 = objc_alloc_init(MCDLibraryAddObserver);
    libraryAddObserver = v12->_libraryAddObserver;
    v12->_libraryAddObserver = v17;

    v19 = (CARSessionStatus *)objc_msgSend(objc_alloc((Class)CARSessionStatus), "initAndWaitUntilSessionUpdated");
    carSessionStatus = v12->_carSessionStatus;
    v12->_carSessionStatus = v19;

    -[MCDNowPlayingContentManager setTableCellClass:](v12, "setTableCellClass:", objc_opt_class(MCDTableViewCell));
    v21 = (SiriDirectActionSource *)objc_msgSend(objc_alloc((Class)SiriDirectActionSource), "initWithDelegate:", 0);
    siriDirectActionSource = v12->_siriDirectActionSource;
    v12->_siriDirectActionSource = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v12, "_subscriptionCapabilitiesChanged:", CFSTR("MusicCarPlayApplicationCapabilitiesControllerSubscriptionCapabilitiesDidChangeNotification"), 0);

    if (_os_feature_enabled_impl("MediaRemote", "wrangler"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCDSharePlayTogetherViewModel notificationName](_TtC5Music29MCDSharePlayTogetherViewModel, "notificationName"));
      objc_msgSend(v24, "addObserver:selector:name:object:", v12, "updateSharePlayTogetherState", v25, 0);

      -[MCDNowPlayingContentManager updateSharePlayTogetherState](v12, "updateSharePlayTogetherState");
    }
    objc_initWeak(location, v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100028A30;
    v27[3] = &unk_1010A8B00;
    objc_copyWeak(&v28, location);
    -[MCDLibraryAddObserver setUpdateBlock:](v12->_libraryAddObserver, "setUpdateBlock:", v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager siriDirectActionSource](self, "siriDirectActionSource"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingContentManager;
  -[MCDNowPlayingContentManager dealloc](&v4, "dealloc");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  UITableView *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  UITableView *v9;

  v5 = (UITableView *)a3;
  if (self->_tableView != v5)
  {
    v9 = v5;
    -[_MCDNowPlayingContentManager setTableView:](self->_impl, "setTableView:", v5);
    objc_storeStrong((id *)&self->_tableView, a3);
    v6 = -[MCDNowPlayingContentManager tableCellClass](self, "tableCellClass");
    v7 = NSStringFromClass(-[MCDNowPlayingContentManager tableCellClass](self, "tableCellClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UITableView registerClass:forCellReuseIdentifier:](v9, "registerClass:forCellReuseIdentifier:", v6, v8);

    -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](v9, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView), CFSTR("autoplay"));
    -[UITableView setDelegate:](v9, "setDelegate:", self);
    -[UITableView setDataSource:](v9, "setDataSource:", self);
    -[UITableView setRowHeight:](v9, "setRowHeight:", UITableViewAutomaticDimension);
    -[UITableView setEstimatedRowHeight:](v9, "setEstimatedRowHeight:", UITableViewAutomaticDimension);
    -[UITableView _setHeaderAndFooterViewsFloat:](v9, "_setHeaderAndFooterViewsFloat:", 0);
    -[UITableView reloadData](v9, "reloadData");
    -[MCDNowPlayingContentManager updateNoContentView](self, "updateNoContentView");
    v5 = v9;
  }

}

- (void)beginRequestObservation
{
  -[_MCDNowPlayingContentManager beginRequestObservation](self->_impl, "beginRequestObservation");
}

- (void)endRequestObservation
{
  -[_MCDNowPlayingContentManager endRequestObservation](self->_impl, "endRequestObservation");
}

- (void)viewWillDisappear
{
  -[_MCDNowPlayingContentManager viewWillDisappear](self->_impl, "viewWillDisappear");
}

- (void)_processResponse:(id)a3 error:(id)a4
{
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _MCDNowPlayingContentManager *impl;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[3];
  __int128 buf;
  uint64_t v48;
  uint64_t v49;

  v6 = a3;
  v45 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracklist"));
  -[MCDNowPlayingContentManager setTracklist:](self, "setTracklist:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayItems"));
  v46[0] = MPCPlayerResponseTracklistDisplaySectionUpNextItems;
  v46[1] = MPCPlayerResponseTracklistDisplaySectionNextItems;
  v46[2] = MPCPlayerResponseTracklistDisplaySectionAutoPlayItems;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredWithSections:", v10));
  -[MCDNowPlayingContentManager setFilteredItems:](self, "setFilteredItems:", v11);

  -[MCDNowPlayingContentManager requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum](self, "requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager libraryAddObserver](self, "libraryAddObserver"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  objc_msgSend(v12, "updateRequestForTracklist:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playingItemIndexPath"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemAtIndexPath:", v15));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributionMetadataFor:", v18));
    -[MCDNowPlayingContentManager setCurrentAttributionMetadata:](self, "setCurrentAttributionMetadata:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "items"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sectionAtIndex:", objc_msgSend(v15, "section")));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "metadataObject"));
    if (objc_msgSend(v23, "type") == (id)13)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "radioStation"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
      v28 = objc_msgSend(v25, "isEqualToString:", v27);

      if ((v28 & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
        v30 = objc_opt_respondsToSelector(v29, "contentManager:sectionName:");

        if ((v30 & 1) != 0)
        {
          v31 = sub_1000290CC();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "radioStation"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Setting radio station: %{public}@", (uint8_t *)&buf, 0xCu);

          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
          impl = self->_impl;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "radioStation"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
          objc_msgSend(v35, "contentManager:sectionName:", impl, v38);

        }
      }
    }

  }
  else
  {
    -[MCDNowPlayingContentManager setCurrentAttributionMetadata:](self, "setCurrentAttributionMetadata:", 0);
  }
  v39 = objc_msgSend(v6, "state");
  if (v39 != (id)-[MCDNowPlayingContentManager playerState](self, "playerState"))
  {
    self->_playerState = (int64_t)v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x2020000000;
    v41 = (_QWORD *)qword_1011ECD98;
    v49 = qword_1011ECD98;
    if (!qword_1011ECD98)
    {
      v42 = (void *)sub_10002E740();
      v41 = dlsym(v42, "MCDPlaybackStateChangedNotification");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v41;
      qword_1011ECD98 = (uint64_t)v41;
    }
    _Block_object_dispose(&buf, 8);
    if (!v41)
    {
      sub_100DE9368();
      __break(1u);
    }
    objc_msgSend(v40, "postNotificationName:object:", *v41, 0);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
    objc_msgSend(v44, "reloadData");

    -[MCDNowPlayingContentManager updateNoContentView](self, "updateNoContentView");
  }

}

- (void)updateNoContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC5Music20CarPlayNoContentView *v7;
  void *v8;
  void *v9;
  _TtC5Music20CarPlayNoContentView *v10;
  void *v11;
  id v12;

  if (_os_feature_enabled_impl("MediaPlayer", "QueueFA"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
    if (objc_msgSend(v3, "totalItemCount"))
    {

LABEL_5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
      objc_msgSend(v5, "setBackgroundView:", 0);

      -[MCDNowPlayingContentManager setNoContentView:](self, "setNoContentView:", 0);
      return;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingRadioStation](self, "currentPlayingRadioStation"));

    if (v4)
      goto LABEL_5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager noContentView](self, "noContentView"));

    if (!v6)
    {
      v7 = [_TtC5Music20CarPlayNoContentView alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("There’s no music in the queue."), &stru_101122068, 0));
      v10 = -[CarPlayNoContentView initWithTitle:subtitle:buttonTitle:buttonHandler:](v7, "initWithTitle:subtitle:buttonTitle:buttonHandler:", v9, 0, 0, 0);
      -[MCDNowPlayingContentManager setNoContentView:](self, "setNoContentView:", v10);

      v12 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager noContentView](self, "noContentView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
      objc_msgSend(v11, "setBackgroundView:", v12);

    }
  }
}

- (void)setCurrentAttributionMetadata:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_currentAttributionMetadata, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artworkCatalog"));

  -[MCDNowPlayingContentManager setCurrentAttributionCatalog:](self, "setCurrentAttributionCatalog:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager impl](self, "impl"));
  objc_msgSend(v8, "contentManagerReloadData:", v7);

}

- (void)setCurrentAttributionCatalog:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;

  v5 = a3;
  if ((objc_msgSend(v5, "isArtworkVisuallyIdenticalToCatalog:", self->_currentAttributionCatalog) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentAttributionCatalog, a3);
    -[MCDNowPlayingContentManager setCurrentAttributionImage:](self, "setCurrentAttributionImage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
    objc_msgSend(v6, "displayScale");
    objc_msgSend(v5, "setDestinationScale:");

    objc_msgSend(v5, "setFittingSize:", 30.0, 30.0);
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "setCacheIdentifier:forCacheReference:", v9, self);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v5);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000295BC;
    v14[3] = &unk_1010A9338;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSVTimer timerWithInterval:repeats:block:](MSVTimer, "timerWithInterval:repeats:block:", 0, v14, 2.0));
    -[MCDNowPlayingContentManager setArtworkTimer:](self, "setArtworkTimer:", v10);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100029650;
    v11[3] = &unk_1010A9388;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v5, "setDestination:configurationBlock:", self, v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)_subscriptionCapabilitiesChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate", a3));
  objc_msgSend(v4, "contentManagerReloadData:", self->_impl);

}

- (BOOL)isAutoplaySectionAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v6 = objc_msgSend(v5, "numberOfSections");

  if ((uint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", a3));
  v9 = objc_msgSend(v8, "isEqualToString:", MPCPlayerResponseTracklistDisplaySectionAutoPlayItems);

  return v9;
}

- (id)sectionTypeAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v6 = objc_msgSend(v5, "numberOfSections");

  if ((uint64_t)v6 <= a3)
  {
    v8 = MPCPlayerResponseTracklistDisplaySectionNextItems;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", a3));

  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v5;
  id v6;

  if (-[MCDNowPlayingContentManager limitedUI](self, "limitedUI", a3))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v6 = objc_msgSend(v5, "numberOfSections");

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  int64_t v9;
  unsigned int v10;
  int64_t v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems", a3));
  v7 = objc_msgSend(v6, "numberOfSections");

  if ((uint64_t)v7 <= a4)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v9 = (int64_t)objc_msgSend(v8, "numberOfItemsInSection:", a4);

  v10 = -[MCDNowPlayingContentManager limitedUI](self, "limitedUI");
  v11 = 12;
  if (v9 < 12)
    v11 = v9;
  if (v10)
    return v11;
  else
    return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class cellForTableView:indexPath:](-[MCDNowPlayingContentManager tableCellClass](self, "tableCellClass"), "cellForTableView:indexPath:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemAtIndexPath:", v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));
  if (v11)
  {
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadataObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributionMetadataFor:", v10));
    ((void (**)(_QWORD, void *, void *, id, void *))v12)[2](v12, v8, v13, v6, v15);

  }
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;
  unsigned int v7;

  if (_os_feature_enabled_impl("MediaPlayer", "QueueFA"))
    return UITableViewAutomaticDimension;
  v7 = -[MCDNowPlayingContentManager isAutoplaySectionAtIndex:](self, "isAutoplaySectionAtIndex:", a4);
  result = UITableViewAutomaticDimension;
  if (!v7)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4));
  if (v7)
  {
    v8 = objc_alloc((Class)NSAttributedString);
    v16[0] = NSFontAttributeName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleCaption1, 1024));
    v17[0] = v9;
    v16[1] = NSForegroundColorAttributeName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    v17[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    v12 = objc_msgSend(v8, "initWithString:attributes:", v7, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("autoplay")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration plainHeaderConfiguration](UIListContentConfiguration, "plainHeaderConfiguration"));
    objc_msgSend(v14, "setAttributedText:", v12);
    objc_msgSend(v13, "setContentConfiguration:", v14);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;

  if (_os_feature_enabled_impl("MediaPlayer", "QueueFA"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sectionTypeAtIndex:](self, "sectionTypeAtIndex:", a4));
    if (objc_msgSend(v6, "isEqualToString:", MPCPlayerResponseTracklistDisplaySectionNextItems))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Continue Playing");
    }
    else if (objc_msgSend(v6, "isEqualToString:", MPCPlayerResponseTracklistDisplaySectionUpNextItems))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Queue");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", MPCPlayerResponseTracklistDisplaySectionAutoPlayItems))
      {
        v11 = 0;
        goto LABEL_9;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      if (a4)
        v9 = CFSTR("Autoplaying");
      else
        v9 = CFSTR("Autoplaying similar music");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_101122068, 0));

  }
  else
  {
    if (!-[MCDNowPlayingContentManager isAutoplaySectionAtIndex:](self, "isAutoplaySectionAtIndex:", a4))
    {
      v11 = 0;
      return v11;
    }
    v10 = sub_100029ED4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTOPLAY_SECTION_TITLE"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  }
LABEL_9:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v14));

  if ((objc_msgSend(v6, "isContentUnavailable") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager playbackManager](self, "playbackManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changeItemCommand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager filteredItems](self, "filteredItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemAtIndexPath:", v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "changeToItem:", v11));
    objc_msgSend(v7, "performPlaybackRequestWithCommand:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v14, 1);

}

- (void)playbackManager:(id)a3 shouldShowError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = sub_100029ED4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_STATION_FAILED_ALERT_TITLE"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  v8 = sub_100029ED4();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_STATION_FAILED_ALERT_MESSAGE"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1));

  v11 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_101122068, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));

  objc_msgSend(v16, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
  LOBYTE(v11) = objc_opt_respondsToSelector(v14, "contentManager:presentViewController:");

  if ((v11 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
    objc_msgSend(v15, "contentManager:presentViewController:", self->_impl, v16);

  }
}

- (double)preferredJumpIntervalForDirection:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if ((unint64_t)(a3 - 1) < 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seekCommand"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredForwardJumpIntervals"));
    goto LABEL_5;
  }
  if ((unint64_t)(a3 + 2) <= 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seekCommand"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredBackwardJumpIntervals"));
LABEL_5:
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    return v9;
  }
  return 0.0;
}

- (id)skipIntervalButtonImageForInterval:(double)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = CFSTR("gobackward");
  if (a3 > 0.0)
    v4 = CFSTR("goforward");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(a3)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
  v11 = v10;

  return v11;
}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  id v4;
  void *v5;
  CPUIModernButton *v6;
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CPUIModernButton *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v87[5];
  _QWORD v88[2];
  _QWORD v89[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));

  if (!v5)
  {
    v6 = objc_opt_new(CPUIModernButton);
    -[MCDNowPlayingContentManager setAutoplayButton:](self, "setAutoplayButton:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("infinity")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 12.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithSymbolConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
    objc_msgSend(v10, "setImage:forState:", v9, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorWithAlphaComponent:", 0.2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithTintColor:", v13));
    objc_msgSend(v11, "setImage:forState:", v14, 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageView"));
    objc_msgSend(v16, "setContentMode:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
    objc_msgSend(v17, "setShouldStaySelected:", 1);

    v18 = sub_100029ED4();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_AUTOPLAY"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v89[0] = v20;
    v21 = sub_100029ED4();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_INFINITY"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v89[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
    objc_msgSend(v25, "setAccessibilityUserInputLabels:", v24);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "actionAtQueueEndCommand"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "supportedActions"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v30 = objc_msgSend(v28, "containsObject:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
  v32 = v31;
  if (v30)
  {
    objc_msgSend(v31, "setHidden:", 0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v34 = objc_msgSend(v33, "actionAtQueueEnd");

    if ((id)-[MCDNowPlayingContentManager previousActionAtQueueEnd](self, "previousActionAtQueueEnd") != v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
      objc_msgSend(v35, "setSelected:", v34 == (id)3);

      -[MCDNowPlayingContentManager setPreviousActionAtQueueEnd:](self, "setPreviousActionAtQueueEnd:", v34);
    }
  }
  else
  {
    objc_msgSend(v31, "setHidden:", 1);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));

  if (!v36)
  {
    v37 = objc_opt_new(CPUIModernButton);
    -[MCDNowPlayingContentManager setFavoriteButton:](self, "setFavoriteButton:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("star")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 12.0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageWithSymbolConfiguration:", v39));

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    objc_msgSend(v41, "setImage:forState:", v40, 0);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "colorWithAlphaComponent:", 0.2));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "imageWithTintColor:", v44));
    objc_msgSend(v42, "setImage:forState:", v45, 1);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "colorWithAlphaComponent:", 0.2));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "imageWithTintColor:", v48));
    objc_msgSend(v46, "setImage:forState:", v49, 8);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("star.fill")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 12.0));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "imageWithSymbolConfiguration:", v51));

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    objc_msgSend(v53, "setImage:forState:", v52, 4);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "colorWithAlphaComponent:", 0.2));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "imageWithTintColor:", v56));
    objc_msgSend(v54, "setImage:forState:", v57, 5);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "colorWithAlphaComponent:", 0.2));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "imageWithTintColor:", v60));
    objc_msgSend(v58, "setImage:forState:", v61, 12);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "imageView"));
    objc_msgSend(v63, "setContentMode:", 1);

    v64 = sub_100029ED4();
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_FAVORITE"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v88[0] = v66;
    v67 = sub_100029ED4();
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_STAR"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v88[1] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    objc_msgSend(v71, "setAccessibilityUserInputLabels:", v70);

  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "playingItem"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "likeCommand"));

  LODWORD(v73) = -[MCDLibraryAddObserver shouldShowFavoriteSong](self->_libraryAddObserver, "shouldShowFavoriteSong");
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
  v76 = v75;
  if ((_DWORD)v73 && v74)
  {
    objc_msgSend(v75, "setHidden:", 0);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    objc_msgSend(v76, "setSelected:", objc_msgSend(v74, "value"));
  }
  else
  {
    objc_msgSend(v75, "setHidden:", 1);
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playModeControlView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "shuffleButton"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playModeControlView", v78));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "repeatButton"));
  v87[1] = v80;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));
  v87[2] = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
  v87[3] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playModeControlView"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "moreButton"));
  v87[4] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 5));

  return v85;
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager autoplayButton](self, "autoplayButton"));

  if (v5 == v18)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    if (objc_msgSend(v6, "actionAtQueueEnd") == (id)3)
      v7 = 2;
    else
      v7 = 3;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionAtQueueEndCommand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "setQueueEndAction:", v7));

    +[MPCPlayerChangeRequest performRequest:options:completion:](MPCPlayerChangeRequest, "performRequest:options:completion:", v10, 0x10000, 0);
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));

  v12 = v18;
  if (v11 == v18)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playingItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "likeCommand"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "changeValue:", objc_msgSend(v15, "value") ^ 1));
    +[MPCPlayerChangeRequest performRequest:options:completion:](MPCPlayerChangeRequest, "performRequest:options:completion:", v16, 0x10000, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager favoriteButton](self, "favoriteButton"));
    objc_msgSend(v17, "setSelected:", objc_msgSend(v15, "value") ^ 1);

    v12 = v18;
  }

}

- (BOOL)_showStopForCenterTransportCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stop"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "duration");
      v7 = v9 != 0;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changeItemCommand"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playingItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seekCommand"));

  if (a4 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextItem"));
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextChapter"));
      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextSection"));
        if (!v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferredForwardJumpIntervals"));
          goto LABEL_15;
        }
LABEL_13:
        v15 = 1;
LABEL_16:

        goto LABEL_17;
      }
LABEL_11:
      v15 = 1;
LABEL_17:

      goto LABEL_18;
    }
LABEL_8:
    v15 = 1;
LABEL_18:

    goto LABEL_19;
  }
  if (!a4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousItem"));
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousChapter"));
      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousSection"));
        if (!v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferredBackwardJumpIntervals"));
LABEL_15:
          v16 = v14;
          v15 = objc_msgSend(v14, "count") != 0;

          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v15 = 1;
LABEL_19:

  return v15;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v11;
  id v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  MCDNowPlayingContentManager *v20;
  uint64_t v21;
  double v22;
  id v23;
  NSObject *v24;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  v11 = a3;
  v12 = a6;
  if (a4)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        if (-[_MCDNowPlayingContentManager nowPlayingViewControllerIsPlaying:](self->_impl, "nowPlayingViewControllerIsPlaying:", v11))
        {
          v13 = -[MCDNowPlayingContentManager _showStopForCenterTransportCommand](self, "_showStopForCenterTransportCommand");
          v14 = sub_1000290CC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v16)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Showing stop button", buf, 2u);
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transportControlView"));
            v18 = v17;
            v19 = CFSTR("square.fill");
          }
          else
          {
            if (v16)
            {
              *(_WORD *)v27 = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Showing pause button", v27, 2u);
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transportControlView"));
            v18 = v17;
            v19 = CFSTR("pause.fill");
          }
          objc_msgSend(v17, "setPauseButtonImageName:", v19);
        }
        else
        {
          v23 = sub_1000290CC();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Showing play button", v26, 2u);
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transportControlView"));
          objc_msgSend(v18, "setPlayButtonImageName:", CFSTR("play.fill"));
        }

      }
      goto LABEL_21;
    }
    v20 = self;
    v21 = 2;
  }
  else
  {
    v20 = self;
    v21 = -2;
  }
  -[MCDNowPlayingContentManager preferredJumpIntervalForDirection:](v20, "preferredJumpIntervalForDirection:", v21);
  if (v22 != 0.0)
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager skipIntervalButtonImageForInterval:](self, "skipIntervalButtonImageForInterval:"));
LABEL_21:

  return 1;
}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  void *v4;
  unsigned __int16 v5;
  id v6;
  NSObject *v7;
  void *v9;
  unsigned __int8 v10;
  uint8_t v11[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController", a3));
  v5 = (unsigned __int16)objc_msgSend(v4, "subscriptionCapabilities");

  if ((v5 & 0x200) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager libraryAddObserver](self, "libraryAddObserver"));
    v10 = objc_msgSend(v9, "isSongAddable");

    return v10;
  }
  else
  {
    v6 = sub_1000290CC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Subscriber cannot add catalog content to their Cloud Library, hiding Add Library button from Now Playing", v11, 2u);
    }

    return 0;
  }
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager libraryAddObserver](self, "libraryAddObserver", a3));
  objc_msgSend(v3, "addSongToLibrary");

}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;

  v4 = -[MCDNowPlayingContentManager _itemCanCreateRadioStation](self, "_itemCanCreateRadioStation", a3);
  v5 = -[MCDNowPlayingContentManager _showAddToLibraryOptions](self, "_showAddToLibraryOptions");
  v6 = -[MCDLibraryAddObserver shouldShowFavoriteSong](self->_libraryAddObserver, "shouldShowFavoriteSong");
  v7 = sub_1000290CC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109632;
    v10[1] = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Show CTA: Create Station: %d, Add to Library: %d, allowsTasteActions: %d", (uint8_t *)v10, 0x14u);
  }

  return v4 | v5 | v6;
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager carSessionStatus](self, "carSessionStatus", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = objc_msgSend(v5, "rightHandDrive");

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerShouldHideBackButton:](self->_impl, "nowPlayingViewControllerShouldHideBackButton:", a3);
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerCanShowAlbumArt:](self->_impl, "nowPlayingViewControllerCanShowAlbumArt:", a3);
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerCanShowUpNext:](self->_impl, "nowPlayingViewControllerCanShowUpNext:", a3);
}

- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3
{
  -[_MCDNowPlayingContentManager nowPlayingViewControllerUpNextButtonTapped:](self->_impl, "nowPlayingViewControllerUpNextButtonTapped:", a3);
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "album"));
  if (v5)
  {
    if (-[MCDNowPlayingContentManager isCurrentPlayingAlbumInLibrary](self, "isCurrentPlayingAlbumInLibrary")
      && !-[MCDLibraryAddObserver isSongAddable](self->_libraryAddObserver, "isSongAddable"))
    {
      v11 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
      v8 = objc_msgSend(v7, "adamID");

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
        v8 = objc_msgSend(v9, "subscriptionAdamID");

        if (!v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
          v8 = objc_msgSend(v10, "purchasedAdamID");

        }
      }
      v11 = v8 != 0;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  id v13;
  void *v14;
  __int16 v15;
  uint8_t buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));

  v7 = -[MCDNowPlayingContentManager limitedUI](self, "limitedUI");
  if (v6 && !-[MCDNowPlayingContentManager isCurrentPlayingAlbumInLibrary](self, "isCurrentPlayingAlbumInLibrary"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlbumTracksTableViewController albumTracksViewControllerForStoreItem:limitedUI:showLocalContent:](MCDAlbumTracksTableViewController, "albumTracksViewControllerForStoreItem:limitedUI:showLocalContent:", v6, v7, 0));
    v13 = sub_1000290CC();
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Album/Artist button tapped for remote album, pushing to album view from Now Playing";
      v12 = buf;
      goto LABEL_7;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:limitedUI:showLocalContent:](MCDAlbumTracksTableViewController, "albumTracksViewControllerForContentItem:limitedUI:showLocalContent:", v6, v7, 0));
    v9 = sub_1000290CC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v11 = "Album/Artist button tapped for local album, pushing to album view from Now Playing";
      v12 = (uint8_t *)&v15;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }

  objc_msgSend(v8, "setAlwaysHideNowPlayingButton:", 1);
  objc_msgSend(v8, "setPlayActivityFeatureNameSourceViewController:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));

  objc_msgSend(v14, "pushViewController:animated:", v8, 1);
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (BOOL)_itemCanCreateRadioStation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  if ((objc_msgSend(v3, "subscriptionCapabilities") & 1) != 0
    && -[MCDNowPlayingContentManager _nowPlayingViewControllerIsFuseSubscriber](self, "_nowPlayingViewControllerIsFuseSubscriber"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
    if (objc_msgSend(v4, "allowsRadioContent"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "DSIDForUserIdentity:outError:", v6, 0));
      if (objc_msgSend(v7, "unsignedLongLongValue"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
        if ((objc_msgSend(v8, "hasVideo") & 1) != 0)
        {
          v9 = 0;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifiers"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
          if (objc_msgSend(v12, "adamID"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager _radioCommandRequestWithCurrentPlayingSongWithViewController:](self, "_radioCommandRequestWithCurrentPlayingSongWithViewController:", 0));
            v9 = v13 != 0;

          }
          else
          {
            v9 = 0;
          }

        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_radioCommandRequestWithCurrentPlayingSongWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCPlaybackIntent radioPlaybackIntentFromSong:](MPCPlaybackIntent, "radioPlaybackIntentFromSong:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "combinedPlayActivityFeatureName"));
  objc_msgSend(v6, "setPlayActivityFeatureName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingRadioStation](self, "currentPlayingRadioStation"));
  v9 = objc_msgSend(v8, "type");

  if (v9 == (id)4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
    v11 = objc_msgSend(v10, "isLibraryAddEligible");

    if (!v11)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resetCommand"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replaceWithPlaybackIntent:", v6));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "insertCommand"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "insertAfterPlayingItemWithPlaybackIntent:", v6));
  }
  v15 = (void *)v14;

LABEL_7:
  return v15;
}

- (void)_addItemsToLibrary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  v3 = objc_msgSend(sub_10002BD44(), "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", 2);
  objc_initWeak(&location, self);
  if (-[MCDLibraryAddObserver isSongAddable](self->_libraryAddObserver, "isSongAddable")
    || -[MCDLibraryAddObserver isSongAdded](self->_libraryAddObserver, "isSongAdded"))
  {
    v5 = sub_100029ED4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (-[MCDLibraryAddObserver isSongAdded](self->_libraryAddObserver, "isSongAdded"))
      v7 = CFSTR("LIBRARY_SONG_ADDED");
    else
      v7 = CFSTR("LIBRARY_ADD_SONG");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002BDFC;
    v32[3] = &unk_1010A93B0;
    objc_copyWeak(&v33, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v32));

    objc_msgSend(v9, "setEnabled:", -[MCDLibraryAddObserver isSongAdded](self->_libraryAddObserver, "isSongAdded") ^ 1);
    objc_msgSend(v4, "addAction:", v9);

    objc_destroyWeak(&v33);
  }
  if (-[MCDLibraryAddObserver isAlbumAddable](self->_libraryAddObserver, "isAlbumAddable")
    || -[MCDLibraryAddObserver isAlbumAdded](self->_libraryAddObserver, "isAlbumAdded"))
  {
    v10 = sub_100029ED4();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (-[MCDLibraryAddObserver isAlbumAdded](self->_libraryAddObserver, "isAlbumAdded"))
      v12 = CFSTR("LIBRARY_ALBUM_ADDED");
    else
      v12 = CFSTR("LIBRARY_ADD_ALBUM");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10002BE40;
    v30[3] = &unk_1010A93B0;
    objc_copyWeak(&v31, &location);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v30));

    objc_msgSend(v14, "setEnabled:", -[MCDLibraryAddObserver isAlbumAdded](self->_libraryAddObserver, "isAlbumAdded") ^ 1);
    objc_msgSend(v4, "addAction:", v14);

    objc_destroyWeak(&v31);
  }
  if (-[MCDLibraryAddObserver isPlaylistAddable](self->_libraryAddObserver, "isPlaylistAddable")
    || -[MCDLibraryAddObserver isPlaylistAdded](self->_libraryAddObserver, "isPlaylistAdded"))
  {
    v15 = sub_100029ED4();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (-[MCDLibraryAddObserver isPlaylistAdded](self->_libraryAddObserver, "isPlaylistAdded"))
      v17 = CFSTR("LIBRARY_PLAYLIST_ADDED");
    else
      v17 = CFSTR("LIBRARY_ADD_PLAYLIST");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_101122068, CFSTR("MusicCarDisplayUI")));
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_10002BE84;
    v28 = &unk_1010A93B0;
    objc_copyWeak(&v29, &location);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, &v25));

    objc_msgSend(v19, "setEnabled:", -[MCDLibraryAddObserver isPlaylistAdded](self->_libraryAddObserver, "isPlaylistAdded", v25, v26, v27, v28) ^ 1);
    objc_msgSend(v4, "addAction:", v19);

    objc_destroyWeak(&v29);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_101122068, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, 0));
  objc_msgSend(v4, "addAction:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
  LOBYTE(v21) = objc_opt_respondsToSelector(v23, "contentManager:presentViewController:");

  if ((v21 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
    objc_msgSend(v24, "contentManager:presentViewController:", self->_impl, v4);

  }
  objc_destroyWeak(&location);

}

- (BOOL)_showAddToLibraryOptions
{
  void *v3;
  unsigned __int16 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  v4 = (unsigned __int16)objc_msgSend(v3, "subscriptionCapabilities");

  if ((v4 & 0x200) == 0)
    return 0;
  if (-[MCDLibraryAddObserver isSongAddable](self->_libraryAddObserver, "isSongAddable")
    || -[MCDLibraryAddObserver isAlbumAddable](self->_libraryAddObserver, "isAlbumAddable"))
  {
    return 1;
  }
  return -[MCDLibraryAddObserver isPlaylistAddable](self->_libraryAddObserver, "isPlaylistAddable");
}

- (BOOL)_allowsTasteActionsForGenericObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingRadioStation](self, "currentPlayingRadioStation"));
    v7 = objc_msgSend(v6, "type");

    if (v7 == (id)4 && !objc_msgSend(v5, "isLibraryAddEligible"))
    {
      v8 = 0;
    }
    else if (-[MCDNowPlayingContentManager _showAddToLibraryOptions](self, "_showAddToLibraryOptions")
           || -[MCDNowPlayingContentManager _itemCanCreateRadioStation](self, "_itemCanCreateRadioStation"))
    {
      v8 = 1;
    }
    else
    {
      v8 = -[MCDLibraryAddObserver shouldShowFavoriteSong](self->_libraryAddObserver, "shouldShowFavoriteSong");
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MCDPlaybackManager *v18;
  void *v19;
  void *v20;
  void *v21;
  MCDPlaybackManager *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  id *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[6];
  _QWORD v49[4];
  MCDPlaybackManager *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id location[2];

  v4 = a3;
  v5 = objc_msgSend(sub_10002BD44(), "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", 2);
  objc_initWeak(location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentAttributionMetadata](self, "currentAttributionMetadata"));
  if (v7)
  {
    v8 = -[MCDNowPlayingContentManager nowPlayingViewControllerCanShowAlbumLink:](self, "nowPlayingViewControllerCanShowAlbumLink:", v4);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.square")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Go to Album"), &stru_101122068, 0));
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10002C768;
      v54[3] = &unk_1010A93D8;
      objc_copyWeak(&v56, location);
      v55 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v11, v9, v54));

      objc_msgSend(v6, "addAction:", v12);
      objc_destroyWeak(&v56);

    }
  }
  if (-[MCDNowPlayingContentManager _showAddToLibraryOptions](self, "_showAddToLibraryOptions"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add to Library"), &stru_101122068, 0));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10002C7A4;
    v52[3] = &unk_1010A93B0;
    objc_copyWeak(&v53, location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v15, v13, v52));

    objc_msgSend(v6, "addAction:", v16);
    objc_destroyWeak(&v53);

  }
  if (-[MCDNowPlayingContentManager _itemCanCreateRadioStation](self, "_itemCanCreateRadioStation"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager _radioCommandRequestWithCurrentPlayingSongWithViewController:](self, "_radioCommandRequestWithCurrentPlayingSongWithViewController:", v4));
    v18 = -[MCDPlaybackManager initWithDelegate:]([MCDPlaybackManager alloc], "initWithDelegate:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("badge.plus.radiowaves.right")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Create Station"), &stru_101122068, 0));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10002C7D0;
    v49[3] = &unk_1010A9400;
    v22 = v18;
    v50 = v22;
    v23 = v17;
    v51 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v21, v19, v49));

    objc_msgSend(v6, "addAction:", v24);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metadataObject"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "flattenedGenericObject"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "song"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "playingItem"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dislikeCommand"));

  v32 = -[MCDLibraryAddObserver shouldShowFavoriteSong](self->_libraryAddObserver, "shouldShowFavoriteSong");
  if (v31)
    v33 = v32;
  else
    v33 = 0;
  if (v33 == 1)
  {
    if (objc_msgSend(v28, "isFavorite") && objc_msgSend(v28, "isDisliked"))
    {
      +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Corrupted Library! Please file a Radar under 'AMP MediaFrameworks | Library'."));
    }
    else if ((objc_msgSend(v28, "isFavorite") & 1) == 0)
    {
      if (objc_msgSend(v28, "isDisliked"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hand.thumbsdown")));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Undo Suggest Less"), &stru_101122068, 0));
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10002C7DC;
        v48[3] = &unk_1010A9400;
        v48[4] = self;
        v48[5] = v28;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v36, v34, v48));

        objc_msgSend(v6, "addAction:", v37);
        v38 = v48;
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hand.thumbsdown")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Suggest Less"), &stru_101122068, 0));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10002C7EC;
        v47[3] = &unk_1010A9400;
        v47[4] = self;
        v47[5] = v28;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v40, v34, v47));

        objc_msgSend(v6, "addAction:", v37);
        v38 = v47;
      }
      v41 = (id *)(v38 + 5);

    }
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_101122068, 0));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v43, 1, 0));
  objc_msgSend(v6, "addAction:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
  LOBYTE(v43) = objc_opt_respondsToSelector(v45, "contentManager:presentViewController:");

  if ((v43 & 1) != 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager delegate](self, "delegate"));
    objc_msgSend(v46, "contentManager:presentViewController:", self->_impl, v6);

  }
  objc_destroyWeak(location);

}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repeatCommand"));
  v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repeatCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advance"));
  -[MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v5);

}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shuffleCommand"));
  v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shuffleCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advance"));
  -[MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v5);

}

- (BOOL)_nowPlayingViewControllerIsFuseSubscriber
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  v3 = objc_msgSend(v2, "userSubscriptionState") == (id)2;

  return v3;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  MCDNowPlayingContentManager *v18;
  uint64_t v19;
  MCDNowPlayingContentManager *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  id v32;

  v8 = a3;
  v32 = v8;
  switch(a4)
  {
    case 0:
      if (a5 == 2)
      {
        if (-[MCDNowPlayingContentManager seeking](self, "seeking"))
          goto LABEL_19;
      }
      else if (a5 == 1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "seekCommand"));
        v15 = v14;
        v16 = -1;
LABEL_13:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "beginSeekWithDirection:", v16));
        -[MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v17);

        v18 = self;
        v19 = 1;
LABEL_20:
        -[MCDNowPlayingContentManager setSeeking:](v18, "setSeeking:", v19);
        break;
      }
      -[MCDNowPlayingContentManager preferredJumpIntervalForDirection:](self, "preferredJumpIntervalForDirection:", -2);
      v20 = self;
      if (v21 == 0.0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "changeItemCommand"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "previousItem"));
        goto LABEL_29;
      }
      v22 = -2;
LABEL_24:
      -[MCDNowPlayingContentManager preferredJumpIntervalForDirection:](v20, "preferredJumpIntervalForDirection:", v22);
      v29 = v28;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "seekCommand"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "jumpByInterval:", v29));
LABEL_29:
      v26 = (void *)v31;

LABEL_30:
      goto LABEL_31;
    case 1:
      if (a5 != 2)
      {
        if (a5 == 1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "seekCommand"));
          v15 = v14;
          v16 = 1;
          goto LABEL_13;
        }
        goto LABEL_22;
      }
      if (!-[MCDNowPlayingContentManager seeking](self, "seeking"))
      {
LABEL_22:
        -[MCDNowPlayingContentManager preferredJumpIntervalForDirection:](self, "preferredJumpIntervalForDirection:", 2);
        v20 = self;
        if (v27 == 0.0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "changeItemCommand"));
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nextItem"));
          goto LABEL_29;
        }
        v22 = 2;
        goto LABEL_24;
      }
LABEL_19:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "seekCommand"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endSeek"));
      -[MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v25);

      v18 = self;
      v19 = 0;
      goto LABEL_20;
    case 2:
      if (-[_MCDNowPlayingContentManager nowPlayingViewControllerIsPlaying:](self->_impl, "nowPlayingViewControllerIsPlaying:", v8))
      {
        v9 = -[MCDNowPlayingContentManager _showStopForCenterTransportCommand](self, "_showStopForCenterTransportCommand");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager lastReceivedResponse](self, "lastReceivedResponse"));
        v11 = v10;
        if ((v9 & 1) != 0)
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stop"));
        else
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pause"));
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager lastReceivedResponse](self, "lastReceivedResponse"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "play"));
      }
      v26 = (void *)v12;
      goto LABEL_30;
  }
  v26 = 0;
LABEL_31:
  -[MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v26);

}

- (void)nowPlayingViewControllerAttributionButtonTapped:(id)a3
{
  void *v4;
  unsigned int v5;
  _TtC5Music41MCDSharePlayTogetherSessionViewController *v6;
  void *v7;
  _TtC5Music41MCDSharePlayTogetherSessionViewController *v8;
  MCDPlaylistTracksTableViewController *v9;
  void *v10;
  _TtC5Music41MCDSharePlayTogetherSessionViewController *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel", a3));
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    v6 = [_TtC5Music41MCDSharePlayTogetherSessionViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel"));
    v8 = -[MCDSharePlayTogetherSessionViewController initWithViewModel:](v6, "initWithViewModel:", v7);
  }
  else
  {
    v9 = [MCDPlaylistTracksTableViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingPlaylist](self, "currentPlayingPlaylist"));
    v8 = -[MCDPlaylistTracksTableViewController initWithPlaylist:limitedUI:showLocalContent:](v9, "initWithPlaylist:limitedUI:showLocalContent:", v7, -[MCDNowPlayingContentManager limitedUI](self, "limitedUI"), 0);
  }
  v11 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager contentManagerDelegate](self, "contentManagerDelegate"));
  objc_msgSend(v10, "contentManager:pushViewController:", self->_impl, v11);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentManagerDelegate, a3);
}

- (id)lastReceivedResponse
{
  return -[_MCDNowPlayingContentManager lastReceivedResponse](self->_impl, "lastReceivedResponse");
}

- (void)setLastReceivedResponse:(id)a3
{
  -[_MCDNowPlayingContentManager setLastReceivedResponse:](self->_impl, "setLastReceivedResponse:", a3);
}

- (id)nowPlayingItem
{
  return -[_MCDNowPlayingContentManager nowPlayingItem](self->_impl, "nowPlayingItem");
}

- (void)setNowPlayingItem:(id)a3
{
  -[_MCDNowPlayingContentManager setNowPlayingItem:](self->_impl, "setNowPlayingItem:", a3);
}

- (void)processArtworkForCurrentlyPlayingSong
{
  -[_MCDNowPlayingContentManager processArtworkForCurrentlyPlayingSong](self->_impl, "processArtworkForCurrentlyPlayingSong");
}

- (void)_performChangeRequest:(id)a3
{
  -[_MCDNowPlayingContentManager _performChangeRequest:](self->_impl, "_performChangeRequest:", a3);
}

- (MPModelPlaylist)currentPlayingPlaylist
{
  return (MPModelPlaylist *)-[_MCDNowPlayingContentManager currentPlayingPlaylist](self->_impl, "currentPlayingPlaylist");
}

- (MPModelPlaylistEntry)currentPlayingPlaylistEntry
{
  return (MPModelPlaylistEntry *)-[_MCDNowPlayingContentManager currentPlayingPlaylistEntry](self->_impl, "currentPlayingPlaylistEntry");
}

- (MPModelRadioStation)currentPlayingRadioStation
{
  return (MPModelRadioStation *)-[_MCDNowPlayingContentManager currentPlayingRadioStation](self->_impl, "currentPlayingRadioStation");
}

- (MPModelSong)currentPlayingSong
{
  return (MPModelSong *)-[_MCDNowPlayingContentManager currentPlayingSong](self->_impl, "currentPlayingSong");
}

- (BOOL)limitedUI
{
  return -[_MCDNowPlayingContentManager limitedUI](self->_impl, "limitedUI");
}

- (void)setLimitedUI:(BOOL)a3
{
  -[_MCDNowPlayingContentManager setLimitedUI:](self->_impl, "setLimitedUI:", a3);
}

- (Class)tableCellClass
{
  return (Class)-[_MCDNowPlayingContentManager tableCellClass](self->_impl, "tableCellClass");
}

- (void)setTableCellClass:(Class)a3
{
  -[_MCDNowPlayingContentManager setTableCellClass:](self->_impl, "setTableCellClass:", a3);
}

- (NSString)nowPlayingBundleID
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDNowPlayingContentManager nowPlayingBundleID](self->_impl, "nowPlayingBundleID"));
  v3 = objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (BOOL)shouldHideBackButton
{
  return -[_MCDNowPlayingContentManager shouldHideBackButton](self->_impl, "shouldHideBackButton");
}

- (void)setShouldHideBackButton:(BOOL)a3
{
  -[_MCDNowPlayingContentManager setShouldHideBackButton:](self->_impl, "setShouldHideBackButton:", a3);
}

- (id)artistTextForNowPlayingController:(id)a3
{
  return -[_MCDNowPlayingContentManager artistTextForNowPlayingController:](self->_impl, "artistTextForNowPlayingController:", a3);
}

- (id)albumTextForNowPlayingController:(id)a3
{
  return -[_MCDNowPlayingContentManager albumTextForNowPlayingController:](self->_impl, "albumTextForNowPlayingController:", a3);
}

- (id)titleForNowPlayingController:(id)a3
{
  return -[_MCDNowPlayingContentManager titleForNowPlayingController:](self->_impl, "titleForNowPlayingController:", a3);
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  return -[_MCDNowPlayingContentManager backgroundArtForNowPlayingController:](self->_impl, "backgroundArtForNowPlayingController:", a3);
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerIsShowingExplicitTrack:](self->_impl, "nowPlayingViewControllerIsShowingExplicitTrack:", a3);
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  return -[_MCDNowPlayingContentManager progressBarLocalizedDurationStringForNowPlayingViewController:](self->_impl, "progressBarLocalizedDurationStringForNowPlayingViewController:", a3);
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  $04B05C73ED6AEEF31C5815932084562D *result;

  result = ($04B05C73ED6AEEF31C5815932084562D *)self->_impl;
  if (result)
    return ($04B05C73ED6AEEF31C5815932084562D *)-[$04B05C73ED6AEEF31C5815932084562D durationSnapshotForNowPlayingViewController:](result, "durationSnapshotForNowPlayingViewController:", a4);
  *(_QWORD *)&retstr->var7 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return result;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerIsPlaying:](self->_impl, "nowPlayingViewControllerIsPlaying:", a3);
}

- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3
{
  return -[_MCDNowPlayingContentManager nowPlayingViewControllerShouldUseMusicExplicitGlyph:](self->_impl, "nowPlayingViewControllerShouldUseMusicExplicitGlyph:", a3);
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = objc_msgSend(v3, "shuffleType");

  return (int64_t)v4;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist", a3));
  v4 = objc_msgSend(v3, "repeatType");

  return (int64_t)v4;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;
  char v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "duration");
    v5 = 4 * (v7 != 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)attributionTitleForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentAttributionMetadata](self, "currentAttributionMetadata", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  return v4;
}

- (id)attributionArtworkForNowPlayingViewController:(id)a3
{
  return -[MCDNowPlayingContentManager currentAttributionImage](self, "currentAttributionImage", a3);
}

- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
    objc_msgSend(v12, "contentManager:processResponse:error:", v13, v9, v10);

  }
  -[MCDNowPlayingContentManager _processResponse:error:](self, "_processResponse:error:", v9, v10);

}

- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4
{
  _BOOL8 v4;
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v9, "contentManager:shouldShowPlaybackQueue:", v10, v4);

  }
}

- (void)contentManagerReloadData:(id)a3
{
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v7, "contentManagerReloadData:", v8);

  }
}

- (void)contentManager:(id)a3 presentViewController:(id)a4
{
  id v7;
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v10, "contentManager:presentViewController:", v11, v7);

  }
}

- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4
{
  _BOOL8 v4;
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v9, "contentManager:bufferingItem:", v10, v4);

  }
}

- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3
{
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v7, "contentManagerInitiatedPlaybackFromPlaybackQueue:", v8);

  }
}

- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5
{
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v11;
  id v12;

  v12 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v11, "contentManager:displayItemIndex:totalItemCount:", v12, a4, a5);

  }
}

- (void)contentManagerCompletedAllPlayback:(id)a3
{
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v7, "contentManagerCompletedAllPlayback:", v8);

  }
}

- (void)contentManager:(id)a3 sectionName:(id)a4
{
  id v7;
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v10, "contentManager:sectionName:", v11, v7);

  }
}

- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5
{
  id v9;
  id v10;
  MCDNowPlayingContentManagerDelegate **p_contentManagerDelegate;
  id WeakRetained;
  id v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    objc_msgSend(v13, "contentManager:itemDidChange:response:", v14, v9, v10);

  }
}

- (BOOL)currentPlayingSongFoundIn:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D578;
  v6[3] = &unk_1010A9428;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateItemIdentifiersUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (void)requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  MCDAlbumTracksDataSource *v9;
  MCDLibraryContentManager *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "album"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager currentPlayingAlbum](self, "currentPlayingAlbum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
  v8 = objc_msgSend(v6, "intersectsSet:", v7);

  if ((v8 & 1) == 0)
  {
    -[MCDNowPlayingContentManager setCurrentPlayingAlbum:](self, "setCurrentPlayingAlbum:", v4);
    -[MCDNowPlayingContentManager setIsCurrentPlayingAlbumInLibrary:](self, "setIsCurrentPlayingAlbumInLibrary:", 0);
    if (v3)
    {
      if (v4)
      {
        v9 = -[MCDAlbumTracksDataSource initWithLimitedUI:album:storeContent:]([MCDAlbumTracksDataSource alloc], "initWithLimitedUI:album:storeContent:", 0, v4, 0);
        v10 = -[_MCDContentManager initWithDataSource:delegate:]([MCDLibraryContentManager alloc], "initWithDataSource:delegate:", v9, 0);
        objc_initWeak(&location, self);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10002D7A4;
        v11[3] = &unk_1010A9450;
        objc_copyWeak(&v13, &location);
        v11[4] = self;
        v12 = v4;
        -[_MCDContentManager performRequest:](v10, "performRequest:", v11);

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);

      }
    }
  }

}

- (void)performFavoriteChangeRequestFor:(id)a3 action:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v5 = a3;
  v6 = objc_alloc_init((Class)MPModelLibraryFavoriteEntityChangeRequest);
  objc_msgSend(v6, "setModelObject:", v5);

  v7 = objc_msgSend(objc_alloc((Class)MPModelLibraryFavoriteEntityRequestAction), "initWithChangeAction:", a4);
  objc_msgSend(v6, "setRequestAction:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D960;
  v9[3] = &unk_1010A9470;
  v9[4] = a4;
  objc_msgSend(v8, "performFavoriteStateChangeRequest:withRelatedModelObjects:completion:", v6, 0, v9);

}

- (void)updateSharePlayTogetherState
{
  void *v3;
  CPUIModernButton *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  UIView *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double MinX;
  void *v44;
  double v45;
  void *v46;
  double Width;
  void *v48;
  double Height;
  void *v50;
  void *v51;
  double MaxX;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v66 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel"));
  if (v66)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));

    if (v3)
    {
      v4 = (CPUIModernButton *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIModernButton configuration](v4, "configuration"));
    }
    else
    {
      v4 = objc_opt_new(CPUIModernButton);
      -[CPUIModernButton setFrame:](v4, "setFrame:", 0.0, 0.0, 48.0, 26.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "background"));
      objc_msgSend(v8, "setBackgroundColor:", v7);

      objc_msgSend(v5, "setImagePadding:", 3.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      objc_msgSend(v5, "setBaseForegroundColor:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("shareplay")));
      objc_msgSend(v5, "setImage:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 2));
      objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v11);

      objc_msgSend(v5, "setTitleTextAttributesTransformer:", &stru_1010A94B0);
      -[CPUIModernButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "sharePlayTogetherButtonTapped", 64);
      -[MCDNowPlayingContentManager setSharePlayTogetherButton:](self, "setSharePlayTogetherButton:", v4);
    }

    if ((uint64_t)objc_msgSend(v66, "connectedParticipantsCount") < 1)
    {
      objc_msgSend(v5, "setContentInsets:", 3.0, 4.0, 3.0, 4.0);
      objc_msgSend(v5, "setTitle:", 0);
    }
    else
    {
      objc_msgSend(v5, "setContentInsets:", 3.0, 4.0, 3.0, 6.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v12, "connectedParticipantsCount")));
      objc_msgSend(v5, "setTitle:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "titleLabel"));
    objc_msgSend(v16, "setHidden:", v14 == 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    objc_msgSend(v17, "setConfiguration:", v5);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    objc_msgSend(v18, "sizeToFit");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    objc_msgSend(v19, "sizeThatFits:", INFINITY, 26.0);
    v21 = v20;
    v23 = v22;

    if (v21 < 48.0)
      v21 = 48.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    objc_msgSend(v24, "setFrame:", 0.0, 0.0, v21, v23);

    v25 = objc_alloc((Class)UIBarButtonItem);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherButton](self, "sharePlayTogetherButton"));
    v27 = objc_msgSend(v25, "initWithCustomView:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v27));

    if ((uint64_t)objc_msgSend(v66, "pendingParticipantsCount") >= 1)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsView](self, "sharePlayTogetherPendingParticipantsView"));

      if (!v29)
      {
        v30 = objc_opt_new(UIView);
        v31 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 10.5, 5.0, 5.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
        objc_msgSend(v32, "setCornerRadius:", 2.5);

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemCyanColor](UIColor, "systemCyanColor"));
        objc_msgSend(v31, "setBackgroundColor:", v33);

        -[UIView addSubview:](v30, "addSubview:", v31);
        v34 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 8.0, 0.0, 0.0, 26.0);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightMedium));
        objc_msgSend(v34, "setFont:", v35);

        -[UIView addSubview:](v30, "addSubview:", v34);
        -[MCDNowPlayingContentManager setSharePlayTogetherPendingParticipantsView:](self, "setSharePlayTogetherPendingParticipantsView:", v30);
        -[MCDNowPlayingContentManager setSharePlayTogetherPendingParticipantsLabel:](self, "setSharePlayTogetherPendingParticipantsLabel:", v34);

      }
      v36 = sub_100029ED4();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("%ld Pending"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, objc_msgSend(v66, "pendingParticipantsCount")));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v40, "setText:", v39);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v41, "sizeToFit");

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v42, "frame");
      MinX = CGRectGetMinX(v67);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v44, "frame");
      v45 = (26.0 - CGRectGetHeight(v68)) * 0.5;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v46, "frame");
      Width = CGRectGetWidth(v69);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v48, "frame");
      Height = CGRectGetHeight(v70);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v50, "setFrame:", MinX, v45, Width, Height);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsLabel](self, "sharePlayTogetherPendingParticipantsLabel"));
      objc_msgSend(v51, "frame");
      MaxX = CGRectGetMaxX(v71);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsView](self, "sharePlayTogetherPendingParticipantsView"));
      objc_msgSend(v53, "setFrame:", 0.0, 0.0, MaxX, 26.0);

      v54 = objc_alloc((Class)UIBarButtonItem);
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager sharePlayTogetherPendingParticipantsView](self, "sharePlayTogetherPendingParticipantsView"));
      v56 = objc_msgSend(v54, "initWithCustomView:", v55);

      objc_msgSend(v28, "addObject:", v56);
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager contentManagerDelegate](self, "contentManagerDelegate"));
    objc_msgSend(v57, "contentManager:setAdditionalBarButtonItems:", self->_impl, v28);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self, "tableView"));
    objc_msgSend(v58, "reloadData");

  }
  else
  {
    -[MCDNowPlayingContentManager setSharePlayTogetherButton:](self, "setSharePlayTogetherButton:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager contentManagerDelegate](self, "contentManagerDelegate"));
    objc_msgSend(v6, "contentManager:setAdditionalBarButtonItems:", self->_impl, &__NSArray0__struct);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager contentManagerDelegate](self, "contentManagerDelegate"));
    objc_msgSend(v5, "contentManagerReloadData:", self->_impl);
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "playingItemIndexPath"));

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tracklist](self, "tracklist"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "items"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "itemAtIndexPath:", v60));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "attributionMetadataFor:", v64));
    -[MCDNowPlayingContentManager setCurrentAttributionMetadata:](self, "setCurrentAttributionMetadata:", v65);

  }
  else
  {
    -[MCDNowPlayingContentManager setCurrentAttributionMetadata:](self, "setCurrentAttributionMetadata:", 0);
  }

}

- (void)sharePlayTogetherButtonTapped
{
  _TtC5Music41MCDSharePlayTogetherSessionViewController *v3;
  void *v4;
  void *v5;
  _TtC5Music41MCDSharePlayTogetherSessionViewController *v6;

  v3 = [_TtC5Music41MCDSharePlayTogetherSessionViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharePlayTogetherObjCViewModel](UIApplication, "sharePlayTogetherObjCViewModel"));
  v6 = -[MCDSharePlayTogetherSessionViewController initWithViewModel:](v3, "initWithViewModel:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager contentManagerDelegate](self, "contentManagerDelegate"));
  objc_msgSend(v5, "contentManager:pushViewController:", self->_impl, v6);

}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MCDPlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
  objc_storeStrong((id *)&self->_playbackManager, a3);
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (_MCDNowPlayingContentManager)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (MCDLibraryAddObserver)libraryAddObserver
{
  return self->_libraryAddObserver;
}

- (void)setLibraryAddObserver:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAddObserver, a3);
}

- (MCDNowPlayingContentManagerDelegate)contentManagerDelegate
{
  return (MCDNowPlayingContentManagerDelegate *)objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
}

- (void)setContentManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentManagerDelegate, a3);
}

- (MPModelAlbum)currentPlayingAlbum
{
  return self->_currentPlayingAlbum;
}

- (void)setCurrentPlayingAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlayingAlbum, a3);
}

- (BOOL)isCurrentPlayingAlbumInLibrary
{
  return self->_isCurrentPlayingAlbumInLibrary;
}

- (void)setIsCurrentPlayingAlbumInLibrary:(BOOL)a3
{
  self->_isCurrentPlayingAlbumInLibrary = a3;
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carSessionStatus, a3);
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriDirectActionSource, a3);
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (void)setTracklist:(id)a3
{
  objc_storeStrong((id *)&self->_tracklist, a3);
}

- (MPSectionedCollection)filteredItems
{
  return self->_filteredItems;
}

- (void)setFilteredItems:(id)a3
{
  objc_storeStrong((id *)&self->_filteredItems, a3);
}

- (MusicAttributionMetadata)currentAttributionMetadata
{
  return self->_currentAttributionMetadata;
}

- (MPArtworkCatalog)currentAttributionCatalog
{
  return self->_currentAttributionCatalog;
}

- (UIImage)currentAttributionImage
{
  return self->_currentAttributionImage;
}

- (void)setCurrentAttributionImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentAttributionImage, a3);
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTimer, a3);
}

- (BOOL)seeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (CPUIModernButton)autoplayButton
{
  return self->_autoplayButton;
}

- (void)setAutoplayButton:(id)a3
{
  objc_storeStrong((id *)&self->_autoplayButton, a3);
}

- (CPUIModernButton)favoriteButton
{
  return self->_favoriteButton;
}

- (void)setFavoriteButton:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteButton, a3);
}

- (CPUIModernButton)sharePlayTogetherButton
{
  return self->_sharePlayTogetherButton;
}

- (void)setSharePlayTogetherButton:(id)a3
{
  objc_storeStrong((id *)&self->_sharePlayTogetherButton, a3);
}

- (UIView)sharePlayTogetherPendingParticipantsView
{
  return self->_sharePlayTogetherPendingParticipantsView;
}

- (void)setSharePlayTogetherPendingParticipantsView:(id)a3
{
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsView, a3);
}

- (UILabel)sharePlayTogetherPendingParticipantsLabel
{
  return self->_sharePlayTogetherPendingParticipantsLabel;
}

- (void)setSharePlayTogetherPendingParticipantsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsLabel, a3);
}

- (int64_t)previousActionAtQueueEnd
{
  return self->_previousActionAtQueueEnd;
}

- (void)setPreviousActionAtQueueEnd:(int64_t)a3
{
  self->_previousActionAtQueueEnd = a3;
}

- (_TtC5Music20CarPlayNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsLabel, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsView, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherButton, 0);
  objc_storeStrong((id *)&self->_favoriteButton, 0);
  objc_storeStrong((id *)&self->_autoplayButton, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_currentAttributionImage, 0);
  objc_storeStrong((id *)&self->_currentAttributionCatalog, 0);
  objc_storeStrong((id *)&self->_currentAttributionMetadata, 0);
  objc_storeStrong((id *)&self->_filteredItems, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_currentPlayingAlbum, 0);
  objc_destroyWeak((id *)&self->_contentManagerDelegate);
  objc_storeStrong((id *)&self->_libraryAddObserver, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
