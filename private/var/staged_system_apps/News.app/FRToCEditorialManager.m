@implementation FRToCEditorialManager

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004D6C4;
  v5[3] = &unk_1000D9AA8;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v5);

}

- (FRToCEditorialManager)initWithCloudContext:(id)a3 activityMonitor:(id)a4 editorialItemEntryManager:(id)a5 articleEditorialItemDownloader:(id)a6 tagEditorialItemDownloader:(id)a7 editorialConfigurationProvider:(id)a8 thumbnailCreator:(id)a9 ANFHelper:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FRToCEditorialManager *v22;
  FRToCEditorialManager *v23;
  uint64_t v24;
  NSMutableArray *interestTokens;
  FCOperationThrottler *v26;
  FCOperationThrottler *refreshThrottler;
  id obj;
  id obja;
  id v31;
  id v33;
  void *v34;
  id v35;
  objc_super v36;

  v16 = a3;
  v33 = a4;
  v17 = a5;
  obj = a6;
  v35 = a6;
  v31 = a7;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v34 = v16;
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007F104();
    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F04C();
LABEL_6:
  if (!v35 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007EF94();
    if (v18)
      goto LABEL_11;
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007EEDC();
LABEL_11:
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007EE24();
    if (v20)
      goto LABEL_16;
  }
  else if (v20)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007ED6C();
LABEL_16:
  if (!v21 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007ECB4();
  v36.receiver = self;
  v36.super_class = (Class)FRToCEditorialManager;
  v22 = -[FRToCEditorialManager init](&v36, "init", obj);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_cloudContext, a3);
    objc_storeStrong((id *)&v23->_activityMonitor, a4);
    -[FRAppActivityMonitor addObserver:](v23->_activityMonitor, "addObserver:", v23);
    objc_storeStrong((id *)&v23->_editorialConfigurationProvider, a8);
    objc_storeStrong((id *)&v23->_editorialItemEntryManager, a5);
    objc_storeStrong((id *)&v23->_articleEditorialItemDownloader, obja);
    objc_storeStrong((id *)&v23->_tagEditorialItemDownloader, v31);
    objc_storeStrong((id *)&v23->_thumbnailCreator, a9);
    objc_storeStrong((id *)&v23->_ANFHelper, a10);
    v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    interestTokens = v23->_interestTokens;
    v23->_interestTokens = (NSMutableArray *)v24;

    v26 = (FCOperationThrottler *)objc_msgSend(objc_alloc((Class)FCOperationThrottler), "initWithDelegate:", v23);
    refreshThrottler = v23->_refreshThrottler;
    v23->_refreshThrottler = v26;

  }
  return v23;
}

- (void)setItemChangeDelegate:(id)a3
{
  objc_storeStrong((id *)&self->itemChangeDelegate, a3);
}

- (FCOperationThrottler)refreshThrottler
{
  return self->_refreshThrottler;
}

- (void)refreshEditorialItems
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager refreshThrottler](self, "refreshThrottler"));
  objc_msgSend(v2, "tickle");

}

- (FRToCEditorialManager)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRToCEditorialManager init]";
    v7 = 2080;
    v8 = "FRToCEditorialManager.m";
    v9 = 1024;
    v10 = 66;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRToCEditorialManager init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)processOverrideEditorialItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD block[4];
  id v24;
  FRToCEditorialManager *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v13 = objc_msgSend(v12, "fc_isValidTagID");

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v15 = v14;
        if (v13)
        {
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          v16 = objc_msgSend(v14, "fc_isValidArticleID");

          if (!v16)
            continue;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          objc_msgSend(v5, "addObject:", v15);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_100018614;
  v33[4] = sub_10001852C;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager articleEditorialItemDownloader](self, "articleEditorialItemDownloader"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10004AA78;
  v30[3] = &unk_1000DC3A8;
  v32 = v33;
  v19 = v17;
  v31 = v19;
  objc_msgSend(v18, "downloadEditorialItemWithIDs:completion:", v5, v30);

  dispatch_group_enter(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager tagEditorialItemDownloader](self, "tagEditorialItemDownloader"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004AAF4;
  v27[3] = &unk_1000DC3A8;
  v29 = v33;
  v21 = v19;
  v28 = v21;
  objc_msgSend(v20, "downloadEditorialItemWithIDs:completion:", v6, v27);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AB70;
  block[3] = &unk_1000DC470;
  v25 = self;
  v26 = v33;
  v24 = v7;
  v22 = v7;
  dispatch_group_notify(v21, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v33, 8);
}

- (BOOL)_editorialItemHasBadge:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributes"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004B3A8;
  v6[3] = &unk_1000DC498;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

- (id)cachedEditorialItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedEditorialItemIDs"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004B510;
  v10[3] = &unk_1000DC4C0;
  v10[4] = self;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v14 + 24))
    -[FRToCEditorialManager _fetchTagsAndRefreshEditorialItems](self, "_fetchTagsAndRefreshEditorialItems");
  v7 = v11;
  v8 = v6;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_fetchTagsAndRefreshEditorialItems
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[4];
  NSMutableDictionary *v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  NSMutableDictionary *v30;
  id v31;
  id v32;
  id location;
  _QWORD v34[5];
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "orderedEditorialItemIDs"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10004BD04;
  v34[3] = &unk_1000DC4E8;
  v34[4] = self;
  v8 = v5;
  v35 = v8;
  v9 = v4;
  v36 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v34);

  v10 = dispatch_group_create();
  if (-[NSMutableDictionary count](v8, "count"))
  {
    dispatch_group_enter(v10);
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager cloudContext](self, "cloudContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "articleController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headlinesFetchOperationForArticleIDs:", v13));

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10004BDE8;
    v28[3] = &unk_1000DC560;
    objc_copyWeak(&v32, &location);
    v29 = v10;
    v30 = v8;
    v31 = v3;
    objc_msgSend(v14, "setFetchCompletionBlock:", v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
    objc_msgSend(v15, "addOperation:", v14);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  if (-[NSMutableDictionary count](v9, "count"))
  {
    dispatch_group_enter(v10);
    objc_initWeak(&location, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager cloudContext](self, "cloudContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tagController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v9, "allKeys"));
    v19 = &_dispatch_main_q;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004C244;
    v23[3] = &unk_1000DC5B0;
    objc_copyWeak(&v27, &location);
    v24 = v9;
    v25 = v3;
    v26 = v10;
    objc_msgSend(v17, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v18, 9, &_dispatch_main_q, v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C598;
  block[3] = &unk_1000D97A8;
  block[4] = self;
  v22 = v3;
  v20 = v3;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_refreshEditorialItemsOrderedWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "orderedEditorialItemIDs"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C698;
  v11[3] = &unk_1000DC5D8;
  v12 = v4;
  v13 = v5;
  v8 = v5;
  v10 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager itemChangeDelegate](self, "itemChangeDelegate"));
  objc_msgSend(v9, "refreshEditorialItemsWithItems:", v8);

}

- (void)removeBadgeForArticleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedEditorialItemIDs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C790;
  v8[3] = &unk_1000DC3F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

- (void)tappedEditorialItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  FREditorialItemEntry *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FREditorialItemEntry *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  FRToCEditorialManager *val;
  void *v39;
  id v40;
  _QWORD v41[4];
  FREditorialItemEntry *v42;
  id v43;
  _QWORD v44[4];
  FREditorialItemEntry *v45;
  id v46;
  id v47;
  id location;
  void *v49;

  v40 = a3;
  val = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorialItemsByID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v40));

  v7 = objc_msgSend(v6, "showBadge");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentVersion"));
  v8 = [FREditorialItemEntry alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorialItemID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitleColorString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionUrlString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastModifiedDate"));
  LOBYTE(v37) = 0;
  v16 = -[FREditorialItemEntry initWithEditorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:](v8, "initWithEditorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:", v9, v10, v11, v12, v13, v14, v15, v39, v39, v37);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](val, "editorialItemEntryManager"));
  objc_msgSend(v17, "addEditorialItem:", v16);

  if (v16)
    v18 = v7;
  else
    v18 = 0;
  if (v18 == 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry editorialItemID](v16, "editorialItemID"));
    v20 = objc_msgSend(v19, "fc_isValidArticleID");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry image](v16, "image"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager thumbnailCreator](val, "thumbnailCreator"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry image](v16, "image"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editorialThumbnailImageWith:", v23));

      }
      else
      {
        v24 = 0;
      }
      objc_initWeak(&location, val);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager cloudContext](val, "cloudContext"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "articleController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry editorialItemID](v16, "editorialItemID"));
      v49 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "headlinesFetchOperationForArticleIDs:", v33));

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10004CD10;
      v44[3] = &unk_1000DC600;
      objc_copyWeak(&v47, &location);
      v45 = v16;
      v35 = v24;
      v46 = v35;
      objc_msgSend(v34, "setFetchCompletionBlock:", v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
      objc_msgSend(v36, "addOperation:", v34);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry editorialItemID](v16, "editorialItemID"));
      v26 = objc_msgSend(v25, "fc_isValidTagID");

      if (v26)
      {
        objc_initWeak(&location, val);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager cloudContext](val, "cloudContext"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tagController"));
        v29 = &_dispatch_main_q;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10004CFC8;
        v41[3] = &unk_1000DC650;
        objc_copyWeak(&v43, &location);
        v42 = v16;
        objc_msgSend(v28, "fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:", v40, 25, &_dispatch_main_q, v41);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)prewarmWithCompletion:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void);
  void *v12;
  _QWORD block[4];
  void (**v14)(void);
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  _BYTE v23[128];

  v11 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager editorialItemEntryManager](self, "editorialItemEntryManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedArticleIDs"));

  if (objc_msgSend(v12, "count"))
  {
    objc_initWeak(&location, self);
    v5 = dispatch_group_create();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v12;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
          dispatch_group_enter(v5);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10004D44C;
          v15[3] = &unk_1000DC678;
          objc_copyWeak(&v17, &location);
          v16 = v5;
          -[FRToCEditorialManager _fetchInterestTokenForArticleID:completion:](self, "_fetchInterestTokenForArticleID:completion:", v10, v15);

          objc_destroyWeak(&v17);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D538;
    block[3] = &unk_1000DAF28;
    v14 = v11;
    dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&location);
  }
  else if (v11)
  {
    v11[2]();
  }

}

- (void)_fetchInterestTokenForArticleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007F300();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007F248();
LABEL_6:
  v8 = objc_alloc((Class)FCOfflineArticleFetchOperation);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager cloudContext](self, "cloudContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRToCEditorialManager ANFHelper](self, "ANFHelper"));
  v11 = objc_msgSend(v8, "initWithContext:ANFHelper:articleID:", v9, v10, v6);

  objc_msgSend(v11, "setQualityOfService:", 9);
  objc_msgSend(v11, "setRelativePriority:", -1);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004D6A8;
  v13[3] = &unk_1000DC6A0;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "setFetchCompletionHandler:", v13);
  +[FCTaskScheduler scheduleLowPriorityOperation:](FCTaskScheduler, "scheduleLowPriorityOperation:", v11);

}

- (TSEditorialItemChangeDelegate)itemChangeDelegate
{
  return self->itemChangeDelegate;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRAppActivityMonitor)activityMonitor
{
  return self->_activityMonitor;
}

- (FREditorialConfigurationProvider)editorialConfigurationProvider
{
  return self->_editorialConfigurationProvider;
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (NSMutableArray)interestTokens
{
  return self->_interestTokens;
}

- (void)setInterestTokens:(id)a3
{
  objc_storeStrong((id *)&self->_interestTokens, a3);
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FREditorialItemDownloader)articleEditorialItemDownloader
{
  return self->_articleEditorialItemDownloader;
}

- (FREditorialItemDownloader)tagEditorialItemDownloader
{
  return self->_tagEditorialItemDownloader;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshThrottler, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
  objc_storeStrong((id *)&self->_tagEditorialItemDownloader, 0);
  objc_storeStrong((id *)&self->_articleEditorialItemDownloader, 0);
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
  objc_storeStrong((id *)&self->_interestTokens, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_editorialConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->itemChangeDelegate, 0);
}

@end
