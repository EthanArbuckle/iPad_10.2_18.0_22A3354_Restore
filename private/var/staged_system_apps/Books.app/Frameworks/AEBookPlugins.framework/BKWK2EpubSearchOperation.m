@implementation BKWK2EpubSearchOperation

- (BOOL)requiresMainThread
{
  return 0;
}

- (id)webView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loader](self, "loader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "webView"));

  return v3;
}

- (BOOL)_loadWebView
{
  id v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  BOOL v6;
  _QWORD block[4];
  id v9;
  id buf[2];

  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_doSearch loading web view", (uint8_t *)buf, 2u);
  }

  v5 = dispatch_semaphore_create(0);
  -[BKWK2EpubSearchOperation setLoadSemaphore:](self, "setLoadSemaphore:", v5);

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D6A34;
  block[3] = &unk_1C0788;
  objc_copyWeak(&v9, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v6 = -[BKWK2EpubSearchOperation _waitForLoadSemaphore](self, "_waitForLoadSemaphore");
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
  return v6;
}

- (void)_loadWebViewFromMainThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  ContentViewStyleManagerBookInfo *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id location;
  void *v65;
  const __CFString *v66;
  void *v67;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
    return;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchBook](self, "searchBook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v56, -[BKSearchOperation ordinal](self, "ordinal")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  -[BKWK2EpubSearchOperation setUrl:](self, "setUrl:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "searchConfiguration") & 1) == 0)
  {

LABEL_6:
    if (objc_msgSend(v3, "isFixedLayout"))
    {
      objc_msgSend(v3, "fixedLayoutSize");
      v13 = v16;
      v15 = v17;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v3, 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookLanguage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:](BEContentCleanupJSOptions, "fixedLayoutOptionsWithLanguage:", v18));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", objc_msgSend(v56, "shouldDisableOptimizeSpeed") ^ 1));
      v20 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
      v67 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
      v11 = objc_msgSend(v20, "initWithAllFrameStylesheets:", v21);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "configuration"));

      objc_msgSend(v23, "contentLayoutSize");
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v3, v23));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions cleanupJSOptionsForBookInfoSnapshot:withConfiguration:](BEContentCleanupJSOptions, "cleanupJSOptionsForBookInfoSnapshot:withConfiguration:", v3, v23));
      objc_msgSend(v23, "contentLayoutSize");
      v25 = v24;
      v15 = v26;
      objc_msgSend(v23, "gutterWidth");
      v28 = v27;
      v29 = objc_alloc_init(ContentViewStyleManagerBookInfo);
      -[ContentViewStyleManagerBookInfo setRespectImageSizeClassIsPrefix:](v29, "setRespectImageSizeClassIsPrefix:", objc_msgSend(v3, "respectImageSizeClassIsPrefix"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "respectImageSizeClass"));
      -[ContentViewStyleManagerBookInfo setRespectImageSizeClass:](v29, "setRespectImageSizeClass:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookLanguage"));
      -[ContentViewStyleManagerBookInfo setLanguage:](v29, "setLanguage:", v31);

      objc_msgSend(v23, "contentLayoutSize");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager getInlineStyleSheetForConfiguration:bookInfo:contentLayoutSize:webkit2:](ContentViewStyleManager, "getInlineStyleSheetForConfiguration:bookInfo:contentLayoutSize:webkit2:", v23, v29, 1));
      v33 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
      v66 = CFSTR("html { width: auto !important; height: auto !important; } body { overflow: hidden; } video { max-height: 95% !important; } div { max-width: 100%; }");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
      if (v32)
      {
        v65 = v32;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
        v11 = objc_msgSend(v33, "initWithMainframeOnlyStylesheets:allFrameStylesheets:", v34, v35);

      }
      else
      {
        v11 = objc_msgSend(v33, "initWithMainframeOnlyStylesheets:allFrameStylesheets:", v34, &__NSArray0__struct);
      }

      v13 = v25 + v28;
    }
    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchConfiguration"));

  if (!v7)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchConfiguration"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "paginationOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cleanupOptions"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stylesheetSet"));
  objc_msgSend(v9, "contentLayoutSize");
  v13 = v12;
  v15 = v14;

LABEL_12:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:](BECFIUtilitiesJSOptions, "cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:", v3, -[BKSearchOperation ordinal](self, "ordinal")));
  v37 = objc_msgSend(v3, "isFixedLayout");
  v38 = 4;
  if (!v37)
    v38 = 1;
  v54 = v38;
  objc_initWeak(&location, self);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation delegate](self, "delegate"));
  v40 = CGRectMakeWithSize(v39, v13, v15);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheItem"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "styleManager"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_D7060;
  v57[3] = &unk_1C1908;
  objc_copyWeak(&v63, &location);
  v49 = v3;
  v58 = v49;
  v50 = v55;
  v59 = v50;
  v51 = v11;
  v60 = v51;
  v52 = v10;
  v61 = v52;
  v53 = v36;
  v62 = v53;
  objc_msgSend(v39, "provideWebView:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:completion:", v47, v50, v52, v53, v51, v48, v40, v42, v44, v46, v54, v57);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);

}

- (void)_loadWebView:(id)a3 bookSnapshot:(id)a4 paginationOptions:(id)a5 stylesheetSet:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 isConfigured:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  BKWK2WebViewLoader *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "be_navigationHandler"));
    objc_msgSend(v21, "setDelegate:", self);

    objc_msgSend(v15, "_setFindDelegate:", self);
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "setOpaque:", 0);
    objc_msgSend(v17, "fontSize");
    objc_msgSend(v15, "_setTextZoomFactor:");
    v22 = -[BKWK2WebViewLoader initWithPaginationOptions:ordinal:]([BKWK2WebViewLoader alloc], "initWithPaginationOptions:ordinal:", v17, -[BKSearchOperation ordinal](self, "ordinal"));
    -[BKWK2EpubSearchOperation setLoader:](self, "setLoader:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loader](self, "loader"));
    objc_msgSend(v23, "setWebView:", v15);

    if (a9)
    {
      -[BKWK2EpubSearchOperation setConfigureRequest:](self, "setConfigureRequest:", 0);
    }
    else
    {
      objc_initWeak(&location, self);
      v24 = -[BKSearchOperation ordinal](self, "ordinal");
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472;
      v34 = sub_D7380;
      v35 = &unk_1C1930;
      objc_copyWeak(&v36, &location);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKWK2LoaderContentInfoRequest contentInfoRequestWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:completion:](BKWK2LoaderContentInfoRequest, "contentInfoRequestWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:completion:", v17, v19, v20, v24, v18, &v32));
      -[BKWK2EpubSearchOperation setConfigureRequest:](self, "setConfigureRequest:", v25, v32, v33, v34, v35);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation configureRequest](self, "configureRequest"));
      objc_msgSend(v26, "setRestoreFrame:", 0);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    v27 = objc_alloc((Class)NSURLRequest);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "url"));
    v29 = objc_msgSend(v27, "initWithURL:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));
    v31 = objc_msgSend(v30, "loadRequest:", v29);

  }
}

- (void)_configureWebView
{
  void *v3;
  id v4;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation configureRequest](self, "configureRequest"));
    if (v4)
    {
      -[BKWK2EpubSearchOperation setConfigureRequest:](self, "setConfigureRequest:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loader](self, "loader"));
      objc_msgSend(v3, "enqueueContentInfoRequest:", v4);

    }
    else
    {
      -[BKWK2EpubSearchOperation _didFinishConfiguringWebView](self, "_didFinishConfiguringWebView");
    }

  }
}

- (BOOL)_waitForLoadSemaphore
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  intptr_t v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  unsigned int v15;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 0;
  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "START _waitForLoadSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));
  v6 = dispatch_semaphore_wait(v5, -[BKWK2EpubSearchOperation _semaphoreWaitTime](self, "_semaphoreWaitTime"));

  v7 = _AESearchLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[BKSearchOperation ordinal](self, "ordinal");
    *(_DWORD *)buf = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "FINISH _waitForLoadSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  if (v6 < 1)
    return 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D75DC;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (unint64_t)_semaphoreWaitTime
{
  return dispatch_time(0, 10000000000);
}

- (void)cancel
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  unsigned int v13;

  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v11 = (int)self;
    v12 = 1024;
    v13 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "cancel %x for ordinal: %d", buf, 0xEu);
  }

  v9.receiver = self;
  v9.super_class = (Class)BKWK2EpubSearchOperation;
  -[BKSearchOperation cancel](&v9, "cancel");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));
    dispatch_semaphore_signal(v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));
    dispatch_semaphore_signal(v8);

  }
}

- (void)_postSearch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BKWK2EpubSearchOperation *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "be_navigationHandler"));

  v7 = (BKWK2EpubSearchOperation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  if (v7 == self)
    objc_msgSend(v6, "setDelegate:", 0);
  -[BKWK2EpubSearchOperation setLoader:](self, "setLoader:", 0);
  v8.receiver = self;
  v8.super_class = (Class)BKWK2EpubSearchOperation;
  -[BKSearchOperation _postSearch:](&v8, "_postSearch:", v4);

}

- (BOOL)_startFindPerformIndexing:(BOOL)a3
{
  dispatch_semaphore_t v5;
  BOOL v6;
  _QWORD block[4];
  id v9;
  BOOL v10;
  id location;

  v5 = dispatch_semaphore_create(0);
  -[BKWK2EpubSearchOperation setFindSemaphore:](self, "setFindSemaphore:", v5);

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D79AC;
  block[3] = &unk_1C1958;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v6 = -[BKWK2EpubSearchOperation _waitForFindSemaphore](self, "_waitForFindSemaphore");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_startFindPerformIndexingFromMainThread:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  int64_t v11;

  v3 = a3;
  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v3)
    {
      v5 = _AESearchLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = -[BKSearchOperation ordinal](self, "ordinal");
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_doSearch index does not contain text unit for ordinal %lu", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_D7B78;
      v8[3] = &unk_1C1980;
      objc_copyWeak(&v9, (id *)buf);
      objc_msgSend(v7, "_getContentsAsStringWithCompletionHandler:", v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[BKWK2EpubSearchOperation _startFind](self, "_startFind");
    }
  }
}

- (BOOL)_indexTextContent:(id)a3
{
  id v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  int64_t v17;
  char v19;
  uint8_t buf[4];
  int64_t v21;

  v4 = a3;
  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v5 = 0;
  }
  else if (objc_msgSend(v4, "length"))
  {
    v6 = _AESearchLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = -[BKSearchOperation ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_doSearch indexing textContent for ordinal %lu", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation baseURL](self, "baseURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v10));

    if (v11)
    {
      v5 = 1;
      objc_msgSend(v11, "indexTextUnit:withOrdinal:indexSynchronously:", v4, -[BKSearchOperation ordinal](self, "ordinal"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queryForString:maxOrdinal:", v12, -1));

      if (v13)
      {
        v19 = 0;
        v14 = objc_msgSend(v13, "isCandidateOrdinal:isMissing:", -[BKSearchOperation ordinal](self, "ordinal"), &v19);
        v5 = v19 ? 1 : v14;
        if ((v5 & 1) == 0)
        {
          v15 = _AESearchLog();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = -[BKSearchOperation ordinal](self, "ordinal");
            *(_DWORD *)buf = 134217984;
            v21 = v17;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "_doSearch contains a hit for ordinal %lu", buf, 0xCu);
          }

        }
      }

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_waitForFindSemaphore
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  intptr_t v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  unsigned int v15;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 0;
  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "START _waitForFindSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));
  v6 = dispatch_semaphore_wait(v5, -[BKWK2EpubSearchOperation _semaphoreWaitTime](self, "_semaphoreWaitTime"));

  v7 = _AESearchLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[BKSearchOperation ordinal](self, "ordinal");
    *(_DWORD *)buf = 67109376;
    v13 = (int)self;
    v14 = 1024;
    v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "FINISH _waitForFindSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  if (v6 < 1)
    return 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D7FD4;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)_startFind
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation lastSavedSearchResult](self, "lastSavedSearchResult"));

    if (v3)
    {
      *(_QWORD *)&v4 = objc_opt_class(BKSearchResult).n128_u64[0];
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation lastSavedSearchResult](self, "lastSavedSearchResult", v4));
      v8 = BUDynamicCast(v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      *(_QWORD *)&v10 = objc_opt_class(BKEpubCFILocation).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location", v10));
      v14 = BUDynamicCast(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      if (v15)
      {
        v16 = _AESearchLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cfiString"));
          *(_DWORD *)buf = 138412290;
          v25 = v18;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Resuming previous search at location: %@", buf, 0xCu);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cfiString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.setSelectedRange('%@');"),
                          v19));

        objc_initWeak((id *)buf, self);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_D8344;
        v22[3] = &unk_1BF510;
        objc_copyWeak(&v23, (id *)buf);
        objc_msgSend(v21, "evaluateJavaScript:completionHandler:", v20, v22);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);

      }
    }
    else
    {
      -[BKWK2EpubSearchOperation _startWebKitFind](self, "_startWebKitFind");
    }
  }
}

- (void)_startWebKitFind
{
  void *v3;
  id v4;

  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
    objc_msgSend(v4, "_findString:options:maxCount:", v3, 513, 1000);

  }
}

- (BOOL)_doSearch
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int64_t v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  int64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v28;
  unsigned __int8 v29;
  char v30;
  uint8_t buf[4];
  int64_t v32;

  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_doSearch for ordinal %lu", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation baseURL](self, "baseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKTextIndex bookIndexWithName:](BKTextIndex, "bookIndexWithName:", v7));

  v9 = objc_msgSend(v8, "containsTextUnitWithOrdinal:", -[BKSearchOperation ordinal](self, "ordinal"));
  v10 = v9;
  if (!v8 || !v9)
  {
LABEL_15:
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation webView](self, "webView"));

    if (v23)
    {
      v24 = _AESearchLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[BKSearchOperation startSearchFromIndex](self, "startSearchFromIndex");
        *(_DWORD *)buf = 134217984;
        v32 = v26;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "_doSearch already have a web view.  Continuing search from index %lu", buf, 0xCu);
      }

    }
    else if (-[BKWK2EpubSearchOperation _loadWebView](self, "_loadWebView"))
    {
      v19 = 1;
      self->super._isDone = 1;
      goto LABEL_26;
    }
    if (-[BKWK2EpubSearchOperation contentProcessDidTerminate](self, "contentProcessDidTerminate")
      || !-[BKWK2EpubSearchOperation successfulLoad](self, "successfulLoad")
      || -[BKWK2EpubSearchOperation isCancelled](self, "isCancelled"))
    {
      self->super._isDone = 1;
    }
    else
    {
      if (v8)
        v28 = v10 ^ 1;
      else
        v28 = 0;
      v29 = -[BKWK2EpubSearchOperation _startFindPerformIndexing:](self, "_startFindPerformIndexing:", v28);
      v19 = 1;
      self->super._isDone = 1;
      if ((v29 & 1) != 0)
        goto LABEL_26;
    }
    v19 = -[BKWK2EpubSearchOperation contentProcessDidTerminate](self, "contentProcessDidTerminate");
    goto LABEL_26;
  }
  v11 = _AESearchLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = -[BKSearchOperation ordinal](self, "ordinal");
    *(_DWORD *)buf = 134217984;
    v32 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_doSearch index contains text unit for ordinal %lu", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queryForString:maxOrdinal:", v14, -1));

  v30 = 0;
  if ((objc_msgSend(v15, "isCandidateOrdinal:isMissing:", -[BKSearchOperation ordinal](self, "ordinal"), &v30) & 1) != 0|| v30)
  {
    v20 = _AESearchLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[BKSearchOperation ordinal](self, "ordinal");
      *(_DWORD *)buf = 134217984;
      v32 = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "_doSearch index query does not contain search string for ordinal %lu", buf, 0xCu);
    }

    goto LABEL_15;
  }
  self->super._isDone = 1;
  v16 = _AESearchLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[BKSearchOperation ordinal](self, "ordinal");
    *(_DWORD *)buf = 134217984;
    v32 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "_doSearch index query contains search string.  Search done for ordinal %lu", buf, 0xCu);
  }

  v19 = 0;
LABEL_26:

  return v19;
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation url](self, "url"));
  v7 = objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v6, 1);

  v8 = _AESearchLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = -[BKSearchOperation ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "didFinishLoadOfURL for ordinal %lu", (uint8_t *)&v11, 0xCu);
    }

    -[BKWK2EpubSearchOperation _configureWebView](self, "_configureWebView");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = (int64_t)v5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "loaded non main url - didFinishLoadOfURL: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)_didFinishConfiguringWebView
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _DWORD v6[2];

  v3 = _AESearchLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_didFinishConfiguringWebView for ordinal %d", (uint8_t *)v6, 8u);
  }

  -[BKWK2EpubSearchOperation setSuccessfulLoad:](self, "setSuccessfulLoad:", 1);
  v5 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));
  dispatch_semaphore_signal(v5);

}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation url](self, "url"));
  v8 = objc_msgSend(v6, "be_isEquivalentToURL:ignoringFragment:", v7, 1);

  v9 = _AESearchLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "failedToLoadURL: %@", (uint8_t *)&v12, 0xCu);
    }

    -[BKWK2EpubSearchOperation setSuccessfulLoad:](self, "setSuccessfulLoad:", 0);
    v11 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));
    dispatch_semaphore_signal(v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "loaded non main url - failedToLoadURL: %@", (uint8_t *)&v12, 0xCu);
  }

}

- (void)navigationHandlerWebContentLoadFailed:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int64_t v9;

  v4 = _AESearchLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "navigationHandlerWebContentLoadFailed for ordinal %lu", (uint8_t *)&v8, 0xCu);
  }

  -[BKWK2EpubSearchOperation setContentProcessDidTerminate:](self, "setContentProcessDidTerminate:", 1);
  v6 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loadSemaphore](self, "loadSemaphore"));
  dispatch_semaphore_signal(v6);

  v7 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));
  dispatch_semaphore_signal(v7);

}

- (void)_webView:(id)a3 didCountMatches:(unint64_t)a4 forString:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int64_t v15;

  v7 = a5;
  v8 = _AESearchLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218498;
    v11 = a4;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "didCountMatches: %lu forString:%@ for ordinal %lu", (uint8_t *)&v10, 0x20u);
  }

}

- (void)_webView:(id)a3 didFindMatches:(unint64_t)a4 forString:(id)a5 withMatchIndex:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  int64_t v32;

  v10 = a3;
  v11 = a5;
  if ((-[BKWK2EpubSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_14;
  v12 = _AESearchLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v26 = a4;
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = a6;
    v31 = 2048;
    v32 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "didFindMatches: %lu forString:%@ withMatchIndex: %lu for ordinal %lu", buf, 0x2Au);
  }

  if (-[BKSearchOperation startSearchFromIndex](self, "startSearchFromIndex") <= a6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchBook](self, "searchBook"));
    if (objc_msgSend(v16, "hasPhysicalPages"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation physicalPageMap](self, "physicalPageMap"));
      v18 = objc_msgSend(v17, "count") == 0;

      if (v18)
      {
        v19 = 0;
        goto LABEL_13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation physicalPageMap](self, "physicalPageMap"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("href")));
    }
    else
    {
      v19 = 0;
    }

LABEL_13:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJS getSelectedRangeScript:](BECFIUtilitiesJS, "getSelectedRangeScript:", v19));
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D9004;
    v22[3] = &unk_1C19A8;
    objc_copyWeak(&v24, (id *)buf);
    v21 = v19;
    v23 = v21;
    objc_msgSend(v10, "evaluateJavaScript:completionHandler:", v20, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

    goto LABEL_14;
  }
  v14 = _AESearchLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a6;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Skipping previously found result index %lu.", buf, 0xCu);
  }

  -[BKWK2EpubSearchOperation _startWebKitFind](self, "_startWebKitFind");
LABEL_14:

}

- (void)_addResultsWithPhysicalPageHrefs:(id)a3 selectedRangeResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  void *v49;
  BKEpubCFILocation *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  _QWORD v71[5];
  __int128 buf;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  NSMutableArray *v76;

  v69 = a3;
  v6 = a4;
  v7 = _AESearchLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "getSelectedRange result: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v10 = v9 == v6;

    if (!v10)
    {
      v11 = sub_D9698(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKSearchResult mutableSearchResult](BKSearchResult, "mutableSearchResult"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
      objc_msgSend(v13, "setSearchString:", v14);

      objc_msgSend(v13, "setOrdinal:", -[BKSearchOperation ordinal](self, "ordinal"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("contextText")));
      if (v68)
      {
        v15 = sub_D9698(v68);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_QWORD *)&v17 = objc_opt_class(NSString).n128_u64[0];
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("context"), v17));
        v21 = BUDynamicCast(v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        objc_msgSend(v13, "setText:", v22);

        *(_QWORD *)&v23 = objc_opt_class(NSNumber).n128_u64[0];
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("offset"), v23));
        v27 = BUDynamicCast(v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = objc_msgSend(v28, "integerValue");

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchString](self, "searchString"));
        objc_msgSend(v13, "setSearchStringRange:", v29, objc_msgSend(v30, "length"));

      }
      *(_QWORD *)&v31 = objc_opt_class(NSArray).n128_u64[0];
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("rects"), v31));
      v35 = BUDynamicCast(v33, v34);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v35);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v73 = 0x3032000000;
      v74 = sub_D96F4;
      v75 = sub_D9704;
      v76 = objc_opt_new(NSMutableArray);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_D970C;
      v71[3] = &unk_1C19D0;
      v71[4] = &buf;
      objc_msgSend(v67, "enumerateObjectsUsingBlock:", v71);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchOperation searchBook](self, "searchBook"));
      if ((objc_msgSend(v36, "isFixedLayout") & 1) != 0)
      {

      }
      else
      {
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") == 0;

        if (!v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "firstObject"));
          objc_msgSend(v38, "rectValue");
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v46 = v45;

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation loader](self, "loader"));
          v48 = objc_msgSend(v47, "pageOffsetRangeForRect:", v40, v42, v44, v46);

          objc_msgSend(v13, "setPageOffset:", v48);
        }
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("cfi")));
      v70 = 0;
      v50 = -[BKEpubCFILocation initWithCFI:error:]([BKEpubCFILocation alloc], "initWithCFI:error:", v49, &v70);
      v51 = v70;
      objc_msgSend(v13, "setLocation:", v50);

      v52 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "location"));
      objc_msgSend(v53, "setSelectionRects:", v52);

      if (objc_msgSend(v69, "count"))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("physicalPageHref")));
        if (objc_msgSend(v54, "length"))
        {
          v55 = objc_msgSend(v69, "indexOfObject:", v54);
          if (v55 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation physicalPageMap](self, "physicalPageMap"));
            v57 = v55 < objc_msgSend(v56, "count");

            if (v57)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation physicalPageMap](self, "physicalPageMap"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v55));

              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "valueForKey:", CFSTR("name")));
              objc_msgSend(v13, "setPageTitle:", v60);

            }
          }
        }

      }
      -[NSMutableArray addObject:](self->super._results, "addObject:", v13);
      -[BKSearchOperation setStartSearchFromIndex:](self, "setStartSearchFromIndex:", -[NSMutableArray count](self->super._results, "count"));
      objc_opt_class(BKSearchResult);
      v62 = BUDynamicCast(v61, v13);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      -[BKSearchOperation setLastSavedSearchResult:](self, "setLastSavedSearchResult:", v63);

      _Block_object_dispose(&buf, 8);
    }
  }
  if ((unint64_t)-[NSMutableArray count](self->super._results, "count") < 0x64)
  {
    -[BKWK2EpubSearchOperation _startWebKitFind](self, "_startWebKitFind");
  }
  else
  {
    v64 = _AESearchLog();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "Found more than the max search results.  Stop for this operation.", (uint8_t *)&buf, 2u);
    }

    v66 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));
    dispatch_semaphore_signal(v66);

  }
}

- (void)_webView:(id)a3 didFailToFindString:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;

  v5 = a4;
  v6 = _AESearchLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2048;
    v12 = -[BKSearchOperation ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "didFailToFindString: %@ for ordinal %lu", (uint8_t *)&v9, 0x16u);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[BKWK2EpubSearchOperation findSemaphore](self, "findSemaphore"));
  dispatch_semaphore_signal(v8);

}

- (NSArray)physicalPageMap
{
  return self->_physicalPageMap;
}

- (void)setPhysicalPageMap:(id)a3
{
  objc_storeStrong((id *)&self->_physicalPageMap, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BKWK2LoaderContentInfoRequest)configureRequest
{
  return self->_configureRequest;
}

- (void)setConfigureRequest:(id)a3
{
  objc_storeStrong((id *)&self->_configureRequest, a3);
}

- (OS_dispatch_semaphore)loadSemaphore
{
  return self->_loadSemaphore;
}

- (void)setLoadSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_loadSemaphore, a3);
}

- (OS_dispatch_semaphore)findSemaphore
{
  return self->_findSemaphore;
}

- (void)setFindSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_findSemaphore, a3);
}

- (BOOL)successfulLoad
{
  return self->_successfulLoad;
}

- (void)setSuccessfulLoad:(BOOL)a3
{
  self->_successfulLoad = a3;
}

- (BOOL)contentProcessDidTerminate
{
  return self->_contentProcessDidTerminate;
}

- (void)setContentProcessDidTerminate:(BOOL)a3
{
  self->_contentProcessDidTerminate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findSemaphore, 0);
  objc_storeStrong((id *)&self->_loadSemaphore, 0);
  objc_storeStrong((id *)&self->_configureRequest, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_physicalPageMap, 0);
}

@end
