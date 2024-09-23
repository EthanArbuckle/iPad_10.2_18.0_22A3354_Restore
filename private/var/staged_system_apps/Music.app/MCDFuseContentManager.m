@implementation MCDFuseContentManager

- (id)prefixSections
{
  return &__NSArray0__struct;
}

- (id)transformedResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager prefixSections](self, "prefixSections", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "insertSection:atIndex:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), (char *)v12 + v10);
        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 += (uint64_t)v12;
    }
    while (v9);
  }

  v13 = objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setResults:", v13);

  return v4;
}

- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7
{
  return -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](self, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", a3, a4, a5, a6, a7, 0);
}

- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MCDFuseContentManager *v20;
  NSOperationQueue *v21;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v23;
  void *v24;
  SiriDirectActionSource *v25;
  SiriDirectActionSource *siriDirectActionSource;
  void *v27;
  id v28;
  id v30;
  id v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)MCDFuseContentManager;
  v20 = -[MCDFuseContentManager init](&v32, "init");
  if (v20)
  {
    v30 = v18;
    v31 = v15;
    v21 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v20->_operationQueue;
    v20->_operationQueue = v21;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    -[NSOperationQueue setQualityOfService:](v20->_operationQueue, "setQualityOfService:", 25);
    v23 = v20->_operationQueue;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager _queueName](v20, "_queueName"));
    -[NSOperationQueue setName:](v23, "setName:", v24);

    objc_storeStrong((id *)&v20->_dataSource, a3);
    objc_storeWeak((id *)&v20->_delegate, v16);
    objc_storeWeak((id *)&v20->_viewController, v17);
    objc_storeStrong((id *)&v20->_playbackManager, a6);
    v20->_limitedUI = a7;
    objc_storeStrong((id *)&v20->_contentResults, a8);
    v25 = (SiriDirectActionSource *)objc_msgSend(objc_alloc((Class)SiriDirectActionSource), "initWithDelegate:", 0);
    siriDirectActionSource = v20->_siriDirectActionSource;
    v20->_siriDirectActionSource = v25;

    if (v20->_contentResults)
    {
      v27 = (void *)objc_opt_new(MPModelStoreBrowseRequest);
      objc_msgSend(v27, "setLoadAdditionalContentURL:", 0);
      v28 = objc_msgSend(objc_alloc((Class)MPModelStoreBrowseResponse), "initWithRequest:", v27);
      objc_msgSend(v28, "setResults:", v20->_contentResults);
      -[MCDFuseContentManager _processResponse:error:](v20, "_processResponse:error:", v28, 0);

    }
    else
    {
      -[MCDFuseContentManager performRequest](v20, "performRequest");
    }
    v18 = v30;
    v15 = v31;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager siriDirectActionSource](self, "siriDirectActionSource"));
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)MCDFuseContentManager;
  -[MCDFuseContentManager dealloc](&v5, "dealloc");
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  return 1;
}

- (void)decorateRequest:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientVersion"));

  if (!v4)
    objc_msgSend(v16, "setClientVersion:", CFSTR("2.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v6 = objc_opt_respondsToSelector(v5, "timeoutInterval");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    objc_msgSend(v7, "timeoutInterval");
    objc_msgSend(v16, "setTimeoutInterval:");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "itemProperties");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemProperties"));
    objc_msgSend(v16, "setItemProperties:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v13 = objc_opt_respondsToSelector(v12, "sectionProperties");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionProperties"));
    objc_msgSend(v16, "setSectionProperties:", v15);

  }
}

- (void)performRequest
{
  void *v3;
  void *v4;
  NSOperationQueue *operationQueue;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  MCDFuseContentManager *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager _modelRequest](self, "_modelRequest"));
    -[MCDFuseContentManager decorateRequest:](self, "decorateRequest:", v4);
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = sub_10001DEA0;
    v8[4] = sub_10001DEB0;
    v9 = self;
    operationQueue = v9->_operationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001DEB8;
    v7[3] = &unk_1010A8FE8;
    v7[4] = v8;
    v6 = objc_msgSend(v4, "newOperationWithResponseHandler:", v7);
    -[NSOperationQueue addOperation:](operationQueue, "addOperation:", v6);

    _Block_object_dispose(v8, 8);
  }
}

- (id)_queueName
{
  -[MCDFuseContentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &stru_101122068;
}

- (id)_modelRequest
{
  -[MCDFuseContentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  -[MCDFuseContentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = objc_msgSend(v4, "section");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionAtIndex:", v7));
  return v8;
}

- (id)childrenOfItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  return &__NSArray0__struct;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)wantsTallCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)maximumNumberOfItemsForDisplay
{
  if (-[MCDFuseContentManager limitedUI](self, "limitedUI"))
    return 12;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  MCDFuseContentManager *v13;
  _QWORD *v14;
  _QWORD v15[5];
  MCDFuseContentManager *v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_10001DEA0;
  v15[4] = sub_10001DEB0;
  v16 = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E0D0;
  v10[3] = &unk_1010A90A0;
  v11 = v6;
  v12 = v7;
  v13 = v16;
  v14 = v15;
  v8 = v7;
  v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  _Block_object_dispose(v15, 8);
}

- (void)clearActivityIndicatorForSelectedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager selectedIndexPath](self, "selectedIndexPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager selectedIndexPath](self, "selectedIndexPath"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForRowAtIndexPath:", v5));

    v6 = objc_opt_class(MCDTableViewCell);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      objc_msgSend(v7, "setLoading:", 0);

  }
}

- (void)setLimitedUI:(BOOL)a3
{
  id v3;

  if (self->_limitedUI != a3)
  {
    self->_limitedUI = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)modelResponseDidInvalidate:(id)a3
{
  id v3;
  void ***v4;
  void **v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  MCDFuseContentManager *v9;
  id v10;

  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_10001E498;
  v8 = &unk_1010A90C8;
  v9 = self;
  v3 = a3;
  v10 = v3;
  v4 = objc_retainBlock(&v5);
  if (+[NSThread isMainThread](NSThread, "isMainThread", v5, v6, v7, v8, v9))
    ((void (*)(void ***))v4[2])(v4);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  int64_t v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", a4));

  if (v8 == CFSTR("siri_action_section"))
  {
    v10 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v10 = -[MCDFuseContentManager allowedNumberOfItemsForDisplayWithResponse:inSection:](self, "allowedNumberOfItemsForDisplayWithResponse:inSection:", v9, a4);

  }
  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
    v8 = objc_msgSend(v7, "numberOfSections");

  }
  else
  {
    v8 = 0;
  }

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  __objc2_class **v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __CFString *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id location;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v38 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionAtIndex:", objc_msgSend(v6, "section")));

  if (v39 == CFSTR("siri_action_section"))
  {
    v37 = (id)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell cellForTableView:indexPath:](MCDSiriActionCell, "cellForTableView:indexPath:", v38, v6));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "showRankedList");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v12 = objc_msgSend(v11, "showRankedList");

    }
    else
    {
      v12 = 0;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", v6));
    if (-[MCDFuseContentManager wantsGridCellAtIndexPath:](self, "wantsGridCellAtIndexPath:", v6))
    {
      v37 = (id)objc_claimAutoreleasedReturnValue(+[CPUIImageRowCell cellForTableView:](CPUIImageRowCell, "cellForTableView:", v38));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager childrenOfItemAtIndexPath:](self, "childrenOfItemAtIndexPath:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager artworksWithTitlesAtIndexPath:](self, "artworksWithTitlesAtIndexPath:", v6));
      v14 = objc_opt_new(NSMutableArray);
      v15 = objc_opt_new(NSMutableArray);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "first"));
            -[NSMutableArray addObject:](v14, "addObject:", v21);

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "second"));
            -[NSMutableArray addObject:](v15, "addObject:", v22);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v17);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager cellTitleAtIndexPath:](self, "cellTitleAtIndexPath:", v6));
      objc_initWeak(&location, self);
      v23 = -[NSMutableArray copy](v14, "copy");
      v24 = -[NSMutableArray copy](v15, "copy");
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10001EB68;
      v43[3] = &unk_1010A90F0;
      objc_copyWeak(&v45, &location);
      v34 = v33;
      v44 = v34;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10001EBC4;
      v40[3] = &unk_1010A8E28;
      objc_copyWeak(&v42, &location);
      v41 = v6;
      LOBYTE(v32) = 1;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CPUIImageRowCellConfiguration configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:](CPUIImageRowCellConfiguration, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", v35, v23, v24, v43, v40, 0, v32));

      objc_msgSend(v37, "applyConfiguration:", v25);
      objc_destroyWeak(&v42);

      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);

    }
    else
    {
      if ((v12 & 1) != 0)
      {
        v26 = off_1010A6EC0;
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
        if ((objc_msgSend((id)objc_opt_class(v27), "wantsTallCells") & 1) != 0)
        {

          v26 = &off_1010A6ED0;
        }
        else
        {
          v28 = -[MCDFuseContentManager wantsTallCellAtIndexPath:](self, "wantsTallCellAtIndexPath:", v6);

          v26 = off_1010A6EC8;
          if (v28)
            v26 = &off_1010A6ED0;
        }
      }
      v37 = (id)objc_claimAutoreleasedReturnValue(-[__objc2_class cellForTableView:indexPath:](*v26, "cellForTableView:indexPath:", v38, v6));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));

      if (v29)
      {
        v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableCellConfigurationBlock](self, "tableCellConfigurationBlock"));
        ((void (**)(_QWORD, id, __CFString *, void *, id, id))v30)[2](v30, v37, v39, v36, v38, v6);

      }
    }

  }
  return v37;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  __CFString *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionAtIndex:", a4));

  if (v7 == CFSTR("siri_action_section"))
    return CFSTR(" ");
  else
    return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  _Unwind_Exception *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionAtIndex:", objc_msgSend(v7, "section")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
  v12 = v11;
  if (v10 == CFSTR("siri_action_section"))
  {
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v7, 1);

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v20 = (_QWORD *)qword_1011ECC68;
    v31 = qword_1011ECC68;
    if (!qword_1011ECC68)
    {
      v21 = (void *)sub_1000204A4();
      v20 = dlsym(v21, "MCDMusicBundleIdentifier");
      v29[3] = (uint64_t)v20;
      qword_1011ECC68 = (uint64_t)v20;
    }
    _Block_object_dispose(&v28, 8);
    if (!v20)
    {
      v27 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v28, 8);
      _Unwind_Resume(v27);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SiriDirectActionContext musicSearchDirectActionWithAppBundleId:](SiriDirectActionContext, "musicSearchDirectActionWithAppBundleId:", *v20, v28));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager siriDirectActionSource](self, "siriDirectActionSource"));
    objc_msgSend(v22, "activateWithContext:completion:", v13, &stru_1010A9130);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v7));

    v14 = objc_opt_class(MCDTableViewCell);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      objc_msgSend(v13, "setLoading:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", v7));
    -[MCDFuseContentManager setSelectedIndexPath:](self, "setSelectedIndexPath:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
    v17 = objc_opt_respondsToSelector(v16, "contentManager:viewControllerForItem:indexPath:");

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentManager:viewControllerForItem:indexPath:", self, v15, v7));

    }
    else
    {
      v19 = 0;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    objc_msgSend(v19, "setPlayActivityFeatureNameSourceViewController:", v23);

    if (v19)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v25 = objc_opt_respondsToSelector(v24, "contentManager:shouldDisplayViewController:");

      if ((v25 & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
        objc_msgSend(v26, "contentManager:shouldDisplayViewController:", self, v19);

      }
    }
    else
    {
      -[MCDFuseContentManager _initiatePlaybackForItem:](self, "_initiatePlaybackForItem:", v15);
    }

  }
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;

  v5 = a4;
  if (-[MCDFuseContentManager offlineMode](self, "offlineMode"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextFocusedItem"));
    v7 = objc_opt_class(UITableViewCell);
    v8 = objc_opt_isKindOfClass(v6, v7) ^ 1;

  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

- (void)setTableView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  MPWeakTimer *v20;
  MPWeakTimer *loadingTimer;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_tableView, v4);
  if (v4)
  {
    v5 = objc_opt_class(MCDTableViewCell);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDTableViewCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    v7 = objc_opt_class(MCDTallCell);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDTallCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v7, v8);

    v9 = objc_opt_class(MCDRankedContentCell);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDRankedContentCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v9, v10);

    v11 = objc_opt_class(MCDSiriActionCell);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDSiriActionCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v11, v12);

    objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);
    objc_msgSend(v4, "setEstimatedRowHeight:", UITableViewAutomaticDimension);
    objc_msgSend(v4, "setDataSource:", self);
    objc_msgSend(v4, "setDelegate:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v14 = MPNetworkObserverIsMusicCellularStreamingAllowedDidChangeNotification;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPNetworkObserver sharedNetworkObserver](MPNetworkObserver, "sharedNetworkObserver"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "_networkConditionsDidChange:", v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor"));
    objc_msgSend(v16, "registerObserver:", self);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v17, "hasLoadedStoreContent") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v19 = objc_msgSend(v18, "hasLoadedStoreContent");

      if ((v19 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001F3A8;
    v22[3] = &unk_1010A8B00;
    objc_copyWeak(&v23, &location);
    v20 = (MPWeakTimer *)objc_claimAutoreleasedReturnValue(+[MPWeakTimer timerWithInterval:repeats:block:](MPWeakTimer, "timerWithInterval:repeats:block:", 0, v22, 2.0));
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
LABEL_7:

  }
}

- (void)showLoadingScreen
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (!v3)
  {
    v4 = sub_10001E254();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing loading view", (uint8_t *)v9, 2u);
    }

    -[MCDFuseContentManager _invalidateLoadingTimer](self, "_invalidateLoadingTimer");
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v6 = (void *)qword_1011ECC70;
    v13 = qword_1011ECC70;
    if (!qword_1011ECC70)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100020554;
      v9[3] = &unk_1010A89D8;
      v9[4] = &v10;
      sub_100020554((uint64_t)v9);
      v6 = (void *)v11[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v10, 8);
    v8 = objc_alloc_init(v7);
    -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v8);

  }
}

- (void)showErrorScreen
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[16];

  -[MCDFuseContentManager _invalidateLoadingTimer](self, "_invalidateLoadingTimer");
  if (-[MCDFuseContentManager offlineMode](self, "offlineMode"))
  {
    -[MCDFuseContentManager _updateViewForNetwork](self, "_updateViewForNetwork");
  }
  else
  {
    v3 = sub_10001E254();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing error view", v7, 2u);
    }

    v5 = objc_msgSend(objc_alloc((Class)sub_10001F5DC()), "initWithTitle:buttonText:", 0, 0);
    -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)showContentScreen
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[MCDFuseContentManager _invalidateLoadingTimer](self, "_invalidateLoadingTimer");
  if (-[MCDFuseContentManager offlineMode](self, "offlineMode"))
  {
    -[MCDFuseContentManager _updateViewForNetwork](self, "_updateViewForNetwork");
  }
  else
  {
    v3 = sub_10001E254();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing content view", v6, 2u);
    }

    -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (void)displayPlaceholderViewIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
    -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v4);

  }
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
    objc_msgSend(v7, "removeFromSuperview");

  }
  -[MCDFuseContentManager setPlaceholderView:](self, "setPlaceholderView:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
  objc_msgSend(v9, "setScrollEnabled:", v8 == 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
  objc_msgSend(v11, "setHidden:", v10 != 0);

  v12 = objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      objc_msgSend(v17, "addSubview:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
      objc_msgSend(v21, "setBackgroundColor:", v19);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "safeAreaLayoutGuide"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "heightAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
      v47[0] = v41;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
      v47[1] = v36;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leftAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "safeAreaLayoutGuide"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leftAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v23));
      v47[2] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "rightAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager tableView](self, "tableView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "safeAreaLayoutGuide"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v29));
      v47[3] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    }
  }

}

- (void)_invalidateLoadingTimer
{
  MPWeakTimer *loadingTimer;

  -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

}

- (void)errorViewDidTapButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "shouldEnableNetwork"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v5 = off_1011ECC80;
    v11 = off_1011ECC80;
    if (!off_1011ECC80)
    {
      v6 = (void *)sub_1000204A4();
      v5 = dlsym(v6, "MCDSetAllowsCellularData");
      v9[3] = (uint64_t)v5;
      off_1011ECC80 = v5;
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
    {
      v7 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v8, 8);
      _Unwind_Resume(v7);
    }
    ((void (*)(uint64_t))v5)(1);
  }
  -[MCDFuseContentManager showLoadingScreen](self, "showLoadingScreen", v8);
  -[MCDFuseContentManager performRequest](self, "performRequest");

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  -[MCDFuseContentManager _networkConditionsDidChange:](self, "_networkConditionsDidChange:", 0);
}

- (void)_networkConditionsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FD60;
  block[3] = &unk_1010A8DD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)offlineMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "networkType");

  if (sub_10001FDC0((uint64_t)v3))
    return sub_10001FE68((uint64_t)v3);
  else
    return 1;
}

- (void)_updateViewForNetwork
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  NSObject *v24;
  void *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _Unwind_Exception *v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  if (-[MCDFuseContentManager offlineMode](self, "offlineMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor"));
    v4 = objc_msgSend(v3, "networkType");

    if ((sub_10001FDC0((uint64_t)v4) & 1) != 0)
    {
      if (!sub_10001FE68((uint64_t)v4))
        return;
      v5 = objc_alloc((Class)sub_10001F5DC());
      v32 = 0;
      v33 = (uint64_t)&v32;
      v34 = 0x2020000000;
      v6 = off_1011ECCA0;
      v35 = off_1011ECCA0;
      if (!off_1011ECCA0)
      {
        v7 = (void *)sub_1000204A4();
        v6 = dlsym(v7, "MCDCarDisplayBundle");
        *(_QWORD *)(v33 + 24) = v6;
        off_1011ECCA0 = v6;
      }
      _Block_object_dispose(&v32, 8);
      if (!v6)
      {
        v31 = (_Unwind_Exception *)sub_100DE9368();
        _Block_object_dispose(&v32, 8);
        _Unwind_Resume(v31);
      }
      v9 = ((uint64_t (*)(uint64_t))v6)(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FUSE_CELLULAR_DATA_RESTRICTED_TITLE"), &stru_101122068, CFSTR("MusicCarDisplayUI"), v32));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Turn On"), &stru_101122068, 0));
      v14 = objc_msgSend(v5, "initWithTitle:buttonText:", v11, v13);

      objc_msgSend(v14, "setShouldEnableNetwork:", 1);
      v15 = sub_10001E254();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing cellular data restricted view", (uint8_t *)&v32, 2u);
      }

      -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));
      objc_msgSend(v17, "setDelegate:", self);

    }
    else
    {
      v19 = +[DeviceCapabilities hasWAPICapability](DeviceCapabilities, "hasWAPICapability");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = v20;
      if (v19)
        v22 = CFSTR("Turn off Airplane Mode or connect to WLAN.");
      else
        v22 = CFSTR("Turn off Airplane Mode or connect to Wi-Fi.");
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_101122068, 0));

      v23 = sub_10001E254();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Showing offline view", (uint8_t *)&v32, 2u);
      }

      v37 = 0;
      v38 = &v37;
      v39 = 0x2050000000;
      v25 = (void *)qword_1011ECC98;
      v40 = qword_1011ECC98;
      if (!qword_1011ECC98)
      {
        v32 = _NSConcreteStackBlock;
        v33 = 3221225472;
        v34 = (uint64_t)sub_1000205FC;
        v35 = &unk_1010A89D8;
        v36 = &v37;
        sub_1000205FC((uint64_t)&v32);
        v25 = (void *)v38[3];
      }
      v26 = objc_retainAutorelease(v25);
      _Block_object_dispose(&v37, 8);
      v27 = [v26 alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("You’re Offline"), &stru_101122068, 0));
      v30 = objc_msgSend(v27, "initWithTitle:subtitle:", v29, v14);
      -[MCDFuseContentManager _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v30);

    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager placeholderView](self, "placeholderView"));

    if (v18)
      -[MCDFuseContentManager showLoadingScreen](self, "showLoadingScreen");
    -[MCDFuseContentManager performRequest](self, "performRequest");
  }
}

- (MPModelResponse)lastReceivedResponse
{
  return self->_lastReceivedResponse;
}

- (void)setLastReceivedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedResponse, a3);
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (MCDFuseContentManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MCDFuseContentManagerDelegate)delegate
{
  return (MCDFuseContentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingTimer, a3);
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriDirectActionSource, a3);
}

- (MCDStorePlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
  objc_storeStrong((id *)&self->_playbackManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_contentResults, 0);
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
}

@end
