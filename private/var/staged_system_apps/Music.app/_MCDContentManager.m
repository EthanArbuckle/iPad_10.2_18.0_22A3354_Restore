@implementation _MCDContentManager

- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 viewController:(id)a7 playbackManager:(id)a8 shouldPerformRequestImmediately:(BOOL)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  _MCDContentManager *v19;
  _MCDContentManager *v20;
  void *v21;
  SiriDirectActionSource *v22;
  SiriDirectActionSource *siriDirectActionSource;
  objc_super v25;

  v12 = a5;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_MCDContentManager;
  v19 = -[_MCDContentManager init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_dataSource, v15);
    objc_storeWeak((id *)&v20->_delegate, v16);
    v21 = (void *)objc_opt_class(MCDTableViewCell);
    objc_storeWeak((id *)&v20->_tableCellClass, v21);
    v20->_limitedUI = a4;
    v20->_showLocalContent = v12;
    v20->_showFavoriteContent = 0;
    objc_storeStrong((id *)&v20->_playbackManager, a8);
    -[MCDPlayableProvider setLocalContentOnly:](v20->_playbackManager, "setLocalContentOnly:", v12);
    -[MCDPlayableProvider setFavoriteContentOnly:](v20->_playbackManager, "setFavoriteContentOnly:", 0);
    *(_WORD *)&v20->_showSiriCellInLimitedUI = 0;
    v20->_showsMediaCell = 0;
    objc_storeWeak((id *)&v20->_viewController, v17);
    v22 = (SiriDirectActionSource *)objc_msgSend(objc_alloc((Class)SiriDirectActionSource), "initWithDelegate:", 0);
    siriDirectActionSource = v20->_siriDirectActionSource;
    v20->_siriDirectActionSource = v22;

    -[_MCDContentManager _setupOperationQueue](v20, "_setupOperationQueue");
    if (a9)
      -[_MCDContentManager _performRequest](v20, "_performRequest");
  }

  return v20;
}

- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 playbackManager:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[_MCDContentManager initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:](self, "initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:", a3, a4, a5, a6, 0, a7, v8);
}

- (_MCDContentManager)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _MCDContentManager *v8;
  _MCDContentManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MCDContentManager;
  v8 = -[_MCDContentManager init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    -[_MCDContentManager _setupOperationQueue](v9, "_setupOperationQueue");
    -[_MCDContentManager _performRequest](v9, "_performRequest");
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager siriDirectActionSource](self, "siriDirectActionSource"));
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)_MCDContentManager;
  -[_MCDContentManager dealloc](&v5, "dealloc");
}

- (void)_setupOperationQueue
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;

  v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v3;

  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 4);
  -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", 25);
  -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.MusicCarDisplayUI.MCDContentManager.operationQueue"));
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemAtIndexPath:", v4));

  return v7;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsInSectionAtIndex:", a3));

  return v6;
}

- (BOOL)itemIsPlayable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_opt_class(MPModelPlaylistEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "song"));

    v4 = (id)v6;
  }
  if (-[_MCDContentManager limitedUI](self, "limitedUI"))
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "contentManager:canDrillIntoItem:") & 1) == 0)
  {

    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "contentManager:canDrillIntoItem:", self, v4);

  if ((v9 & 1) == 0)
  {
LABEL_8:
    v10 = +[CarPlayPlayabilityStatusService isModelObjectPlayable:](_TtC5Music31CarPlayPlayabilityStatusService, "isModelObjectPlayable:", v4);
    goto LABEL_9;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (void)setLimitedUI:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_limitedUI != a3)
  {
    v3 = a3;
    self->_limitedUI = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    objc_msgSend(v5, "setLimitedUI:", v3);

    -[_MCDContentManager setLastReceivedResponse:](self, "setLastReceivedResponse:", 0);
    -[_MCDContentManager _performRequest](self, "_performRequest");
  }
}

- (void)setShowSiriCellInLimitedUI:(BOOL)a3
{
  id v3;

  if (self->_showSiriCellInLimitedUI != a3)
  {
    self->_showSiriCellInLimitedUI = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)setShowShuffleAll:(BOOL)a3
{
  id v3;

  if (self->_showShuffleAll != a3)
  {
    self->_showShuffleAll = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)setShowsMediaCell:(BOOL)a3
{
  id v3;

  if (self->_showsMediaCell != a3)
  {
    self->_showsMediaCell = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)modelResponseDidInvalidate:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v5 = objc_msgSend(v7, "isEqual:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, MPModelResponseDidInvalidateNotification, 0);

    -[_MCDContentManager _performRequest](self, "_performRequest");
  }

}

- (void)setTableView:(id)a3
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeWeak((id *)&self->_tableView, v11);
  if (v11)
  {
    v4 = -[_MCDContentManager tableCellClass](self, "tableCellClass");
    v5 = NSStringFromClass(-[_MCDContentManager tableCellClass](self, "tableCellClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v4, v6);

    v7 = objc_opt_class(MCDShuffleActionCell);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDShuffleActionCell, "reuseIdentifier"));
    objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v7, v8);

    v9 = objc_opt_class(MCDSiriActionCell);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDSiriActionCell, "reuseIdentifier"));
    objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v9, v10);

    objc_msgSend(v11, "setRowHeight:", UITableViewAutomaticDimension);
    objc_msgSend(v11, "setEstimatedRowHeight:", UITableViewAutomaticDimension);
    objc_msgSend(v11, "setDataSource:", self);
    objc_msgSend(v11, "setDelegate:", self);
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
  v5 = objc_msgSend(v4, "numberOfSections");

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int64_t v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v8 = objc_msgSend(v7, "numberOfSections");

  if ((uint64_t)v8 <= a4)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
  v11 = (int64_t)objc_msgSend(v10, "numberOfItemsInSection:", a4);

  if (!a4)
  {
    v12 = -[_MCDContentManager showShuffleAll](self, "showShuffleAll");
    if (v11 > 0)
      v13 = v12;
    else
      v13 = 0;
    v11 += v13;
  }
  v14 = -[_MCDContentManager limitedUI](self, "limitedUI");
  v15 = 12;
  if (v11 < 12)
    v15 = v11;
  if (v14)
    return v15;
  else
    return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class cellForTableView:indexPath:](-[_MCDContentManager tableCellClass](self, "tableCellClass"), "cellForTableView:indexPath:", v6, v7));
  if (-[_MCDContentManager showSiriCellInLimitedUI](self, "showSiriCellInLimitedUI")
    && -[_MCDContentManager limitedUI](self, "limitedUI")
    && objc_msgSend(v7, "row") == (id)11)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell cellForTableView:indexPath:](MCDSiriActionCell, "cellForTableView:indexPath:", v6, v7));
    goto LABEL_17;
  }
  if (!-[_MCDContentManager showShuffleAll](self, "showShuffleAll") || objc_msgSend(v7, "section"))
    goto LABEL_9;
  if (objc_msgSend(v7, "row"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section")));

    v7 = (id)v10;
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager itemAtIndexPath:](self, "itemAtIndexPath:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));

    if (v12)
    {
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));
      ((void (**)(_QWORD, void *, _QWORD, void *, id, id))v13)[2](v13, v8, 0, v11, v6, v7);

    }
    objc_msgSend(v8, "setAccessoryType:", 0);
    if (!-[_MCDContentManager limitedUI](self, "limitedUI"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
      if ((objc_opt_respondsToSelector(v14, "contentManager:canDrillIntoItem:") & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
        v16 = objc_msgSend(v15, "contentManager:canDrillIntoItem:", self, v11);

        if (v16)
          objc_msgSend(v8, "setAccessoryType:", 1);
      }
      else
      {

      }
    }
    v9 = v8;

    goto LABEL_17;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell cellForTableView:indexPath:](MCDShuffleActionCell, "cellForTableView:indexPath:", v6, v7));
  v18 = objc_opt_class(_MCDReusableCell);
  if ((objc_opt_isKindOfClass(v8, v18) & 1) != 0)
  {
    objc_msgSend(v8, "sizeForArtwork");
    objc_msgSend(v9, "setSizeForArtwork:");
  }
LABEL_17:

  return v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "sectionIndexTitlesForContentManager:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIndexTitlesForContentManager:", self));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "sectionForSectionIndexTitle:atIndex:contentManager:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
    a5 = (int64_t)objc_msgSend(v10, "sectionForSectionIndexTitle:atIndex:contentManager:", v7, a5, self);

  }
  return a5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  _MCDContentManager *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  _Unwind_Exception *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "copy");
  if (-[_MCDContentManager showSiriCellInLimitedUI](self, "showSiriCellInLimitedUI")
    && -[_MCDContentManager limitedUI](self, "limitedUI")
    && objc_msgSend(v7, "row") == (id)11)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v7, 1);

    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v10 = (_QWORD *)qword_1011ECD48;
    v33 = qword_1011ECD48;
    if (!qword_1011ECD48)
    {
      v11 = (void *)sub_1000268DC();
      v10 = dlsym(v11, "MCDMusicBundleIdentifier");
      v31[3] = (uint64_t)v10;
      qword_1011ECD48 = (uint64_t)v10;
    }
    _Block_object_dispose(&v30, 8);
    if (!v10)
    {
      v29 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v30, 8);
      _Unwind_Resume(v29);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SiriDirectActionContext musicSearchDirectActionWithAppBundleId:](SiriDirectActionContext, "musicSearchDirectActionWithAppBundleId:", *v10, v30));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager siriDirectActionSource](self, "siriDirectActionSource"));
    objc_msgSend(v13, "activateWithContext:completion:", v12, &stru_1010A9228);
    goto LABEL_18;
  }
  if (-[_MCDContentManager showShuffleAll](self, "showShuffleAll") && !objc_msgSend(v7, "section"))
  {
    if (!objc_msgSend(v7, "row"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
      v28 = objc_opt_respondsToSelector(v27, "shuffleContainerForContentManager:");

      if ((v28 & 1) == 0)
      {
        -[_MCDContentManager _initiatePlaybackForItem:shuffled:](self, "_initiatePlaybackForItem:shuffled:", 0, 1);
        goto LABEL_31;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shuffleContainerForContentManager:", self));
      v23 = self;
      v24 = v18;
      v25 = 1;
      goto LABEL_28;
    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section")));

    v8 = (id)v14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager itemAtIndexPath:](self, "itemAtIndexPath:", v8));
  if (!-[_MCDContentManager limitedUI](self, "limitedUI"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
    v16 = objc_opt_respondsToSelector(v15, "contentManager:viewControllerForItem:");

    if ((v16 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentManager:viewControllerForItem:", self, v12));

    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    objc_msgSend(v18, "setPlayActivityFeatureNameSourceViewController:", v19);

    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
      v21 = objc_opt_respondsToSelector(v20, "contentManager:shouldDisplayViewController:");

      if ((v21 & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
        objc_msgSend(v22, "contentManager:shouldDisplayViewController:", self, v18);

      }
      goto LABEL_29;
    }
    if (!-[_MCDContentManager itemIsPlayable:](self, "itemIsPlayable:", v12))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
      objc_msgSend(v26, "deselectRowAtIndexPath:animated:", v7, 1);

LABEL_29:
      goto LABEL_30;
    }
    v23 = self;
    v24 = v12;
    v25 = 0;
LABEL_28:
    -[_MCDContentManager _initiatePlaybackForItem:shuffled:](v23, "_initiatePlaybackForItem:shuffled:", v24, v25);
    goto LABEL_29;
  }
  if (!-[_MCDContentManager itemIsPlayable:](self, "itemIsPlayable:", v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_18:

    goto LABEL_30;
  }
  -[_MCDContentManager _initiatePlaybackForItem:shuffled:](self, "_initiatePlaybackForItem:shuffled:", v12, 0);
LABEL_30:

LABEL_31:
}

- (double)_tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;
  double result;

  if (-[_MCDContentManager limitedUI](self, "limitedUI", a3, a4)
    || -[_MCDContentManager showLocalContent](self, "showLocalContent"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager _textForHeaderView](self, "_textForHeaderView"));
    v6 = 27.0;
    if (!v5)
    {
      -[_MCDContentManager _heightForHeaderView](self, "_heightForHeaderView");
      v6 = v7;
    }

    return v6;
  }
  else
  {
    -[_MCDContentManager _heightForHeaderView](self, "_heightForHeaderView");
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double result;

  -[_MCDContentManager _tableView:heightForHeaderInSection:](self, "_tableView:heightForHeaderInSection:", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  -[_MCDContentManager _tableView:heightForHeaderInSection:](self, "_tableView:heightForHeaderInSection:", a3, a4);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate", a3, a4));
  v6 = objc_opt_respondsToSelector(v5, "viewForHeaderViewInContentManager:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewForHeaderViewInContentManager:", self));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _Unwind_Exception *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "viewForHeaderViewInContentManager:");

  if ((v10 & 1) == 0
    && (uint64_t)objc_msgSend(v7, "numberOfSections") <= 1
    && (-[_MCDContentManager limitedUI](self, "limitedUI")
     || -[_MCDContentManager showLocalContent](self, "showLocalContent")))
  {
    v11 = objc_opt_class(UITableViewHeaderFooterView);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      v12 = v8;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v13 = off_1011ECD60;
      v21 = off_1011ECD60;
      if (!off_1011ECD60)
      {
        v14 = (void *)sub_1000268DC();
        v13 = dlsym(v14, "MCDSetupTableHeaderView");
        v19[3] = (uint64_t)v13;
        off_1011ECD60 = v13;
      }
      _Block_object_dispose(&v18, 8);
      if (!v13)
      {
        v17 = (_Unwind_Exception *)sub_100DE9368();
        _Block_object_dispose(&v18, 8);
        _Unwind_Resume(v17);
      }
      ((void (*)(id))v13)(v12);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager _textForHeaderView](self, "_textForHeaderView", v18));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
      objc_msgSend(v16, "setText:", v15);

    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  MCDContentManagerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "scrollViewDidScroll:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "scrollViewDidScroll:", v8);

  }
}

- (void)_initiatePlaybackForItem:(id)a3 shuffled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _Unwind_Exception *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_class(MPModelGenericObject);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v9 = off_1011ECD68;
    v31 = off_1011ECD68;
    if (!off_1011ECD68)
    {
      v10 = (void *)sub_1000268DC();
      v9 = dlsym(v10, "MCDMPModelObjectForGenericObject");
      v29[3] = (uint64_t)v9;
      off_1011ECD68 = v9;
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      v27 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v28, 8);
      _Unwind_Resume(v27);
    }
    v11 = ((uint64_t (*)(id))v9)(v8);
    v6 = (id)objc_claimAutoreleasedReturnValue(v11);

  }
  if (!v6
    || (v12 = objc_opt_class(MPModelSong), (objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    || (v13 = objc_opt_class(MPModelPlaylistEntry), (objc_opt_isKindOfClass(v6, v13) & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource", v28));
    v15 = objc_opt_respondsToSelector(v14, "forceScopingToResponseResults");

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
      v17 = objc_msgSend(v16, "forceScopingToResponseResults");

      if (!v6)
        goto LABEL_14;
    }
    else
    {
      v17 = 0;
      if (!v6)
        goto LABEL_14;
    }
    v18 = objc_opt_class(MPModelSong);
    if ((objc_opt_isKindOfClass(v6, v18) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
      objc_msgSend(v19, "initiatePlaybackForPlaylistEntry:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v6, v20, v4, v17, v22);
      goto LABEL_24;
    }
LABEL_14:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
    objc_msgSend(v19, "initiatePlaybackForSong:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v6, v20, v4, v17, v22);
LABEL_24:

    goto LABEL_25;
  }
  v23 = objc_opt_class(MPModelPlaylist);
  if ((objc_opt_isKindOfClass(v6, v23) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
    objc_msgSend(v19, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v6, v20, v4, v22);
    goto LABEL_24;
  }
  v24 = objc_opt_class(MPModelGenre);
  if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
    objc_msgSend(v19, "initiatePlaybackForGenre:lastResponse:shuffled:playActivityFeatureName:", v6, v20, v4, v22);
    goto LABEL_24;
  }
  v25 = objc_opt_class(MPModelAlbum);
  if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
    objc_msgSend(v19, "initiatePlaybackForAlbum:lastResponse:shuffled:playActivityFeatureName:", v6, v20, v4, v22);
    goto LABEL_24;
  }
  v26 = objc_opt_class(MPModelPerson);
  if ((objc_opt_isKindOfClass(v6, v26) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager playbackManager](self, "playbackManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager viewController](self, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "combinedPlayActivityFeatureName"));
    objc_msgSend(v19, "initiatePlaybackForPerson:lastResponse:shuffled:playActivityFeatureName:", v6, v20, v4, v22);
    goto LABEL_24;
  }
LABEL_25:

}

- (double)_heightForHeaderView
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "heightForHeaderViewInContentManager:");

  if ((v4 & 1) == 0)
    return 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  objc_msgSend(v5, "heightForHeaderViewInContentManager:", self);
  v7 = v6;

  return v7;
}

- (id)_textForHeaderView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "textForHeaderViewInContentManager:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager tableView](self, "tableView"));
    v5 = objc_msgSend(v4, "numberOfSections");

    if (v5 != (id)1)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textForHeaderViewInContentManager:", self));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_modelRequest
{
  -[_MCDContentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_performRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  _MCDContentManager *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager _modelRequest](self, "_modelRequest"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager _operationForRequest:](self, "_operationForRequest:", v5));
  v7 = sub_100024F0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    if (v6)
      v9 = 89;
    else
      v9 = 78;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    v17 = 1024;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Performing request: %@, as operation: %c", buf, 0x1Cu);
  }

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager operationQueue](self, "operationQueue"));
    objc_msgSend(v10, "addOperation:", v6);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000259EC;
    v11[3] = &unk_1010A9250;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v5, "performWithResponseHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

- (void)performRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[_MCDContentManager _modelRequest](self, "_modelRequest"));
  }
  objc_msgSend(v7, "performWithResponseHandler:", v4);

}

- (id)_operationForRequest:(id)a3
{
  return 0;
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  _MCDContentManager *v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v9 = sub_100024F0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Processing response of request: %@", buf, 0x16u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100025CF8;
    v16[3] = &unk_1010A90C8;
    v16[4] = self;
    v14 = (id *)v16;
    v15 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100DE9784((uint64_t)self, (uint64_t)v8, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "contentManager:didFailWithError:");

  if ((v13 & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100025CB8;
    v17[3] = &unk_1010A90C8;
    v17[4] = self;
    v14 = (id *)v17;
    v15 = v7;
LABEL_9:
    v14[5] = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

  }
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (MCDContentManagerDataSource)dataSource
{
  return (MCDContentManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (MCDContentManagerDelegate)delegate
{
  return (MCDContentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCDPlayableProvider)playbackManager
{
  return self->_playbackManager;
}

- (MPModelResponse)lastReceivedResponse
{
  return (MPModelResponse *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastReceivedResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (Class)tableCellClass
{
  return (Class)objc_loadWeakRetained((id *)&self->_tableCellClass);
}

- (void)setTableCellClass:(Class)a3
{
  objc_storeWeak((id *)&self->_tableCellClass, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (BOOL)showSiriCellInLimitedUI
{
  return self->_showSiriCellInLimitedUI;
}

- (BOOL)showShuffleAll
{
  return self->_showShuffleAll;
}

- (BOOL)showsMediaCell
{
  return self->_showsMediaCell;
}

- (BOOL)showFavoriteContent
{
  return self->_showFavoriteContent;
}

- (void)setShowFavoriteContent:(BOOL)a3
{
  self->_showFavoriteContent = a3;
}

- (BOOL)showLocalContent
{
  return self->_showLocalContent;
}

- (void)setShowLocalContent:(BOOL)a3
{
  self->_showLocalContent = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriDirectActionSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_tableCellClass);
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
