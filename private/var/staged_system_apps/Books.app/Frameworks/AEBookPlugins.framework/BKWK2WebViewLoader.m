@implementation BKWK2WebViewLoader

- (BKWK2WebViewLoader)initWithPaginationOptions:(id)a3 ordinal:(unint64_t)a4
{
  id v7;
  BKWK2WebViewLoader *v8;
  BKWK2WebViewLoader *v9;
  NSString *tocIdCssRules;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKWK2WebViewLoader;
  v8 = -[BKWK2WebViewLoader init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_paginationOptions, a3);
    v9->_ordinal = a4;
    tocIdCssRules = v9->_tocIdCssRules;
    v9->_tocIdCssRules = (NSString *)&stru_1C3088;

    v9->_pageCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_contentInfo = 501;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKWK2WebViewLoader;
  -[BKWK2WebViewLoader dealloc](&v2, "dealloc");
}

- (void)setWebView:(id)a3
{
  WKWebView *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  id v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  unint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v5 = (WKWebView *)a3;
  if (self->_webView != v5)
  {
    if (-[BKWK2WebViewLoader calculatingPageLocations](self, "calculatingPageLocations"))
    {
      v6 = _AEWKLoaderLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Setting webView while it is calculating page locations -- this should not happen", buf, 2u);
      }

    }
    -[BKWK2WebViewLoader unregisterForVisibleCFIUpdates](self, "unregisterForVisibleCFIUpdates");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](v5, "configuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userContentController"));

    objc_msgSend(v9, "removeScriptMessageHandlerForName:", CFSTR("cfiUpdate"));
    objc_msgSend(v9, "removeScriptMessageHandlerForName:", CFSTR("selectionChange"));
    objc_storeStrong((id *)&self->_webView, a3);
    -[BKWK2WebViewLoader desiredWebViewFrame](self, "desiredWebViewFrame");
    v35.origin.x = CGRectZero.origin.x;
    v35.origin.y = CGRectZero.origin.y;
    v35.size.width = CGRectZero.size.width;
    v35.size.height = CGRectZero.size.height;
    v10 = CGRectEqualToRect(v33, v35);
    -[WKWebView frame](v5, "frame");
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    if (v10)
    {
      -[BKWK2WebViewLoader setDesiredWebViewFrame:](self, "setDesiredWebViewFrame:", v11, v12, v13, v14);
    }
    else
    {
      -[BKWK2WebViewLoader desiredWebViewFrame](self, "desiredWebViewFrame");
      v36.origin.x = v19;
      v36.origin.y = v20;
      v36.size.width = v21;
      v36.size.height = v22;
      v34.origin.x = v15;
      v34.origin.y = v16;
      v34.size.width = v17;
      v34.size.height = v18;
      if (!CGRectEqualToRect(v34, v36))
      {
        v23 = _AEWKLoaderLog();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
          *(_DWORD *)buf = 134217984;
          v32 = v25;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "wkWebView frame mismatch ordinal:%lu", buf, 0xCu);
        }

        -[BKWK2WebViewLoader desiredWebViewFrame](self, "desiredWebViewFrame");
        -[WKWebView setFrame:](self->_webView, "setFrame:");
      }
    }
    -[BKWK2WebViewLoader registerForVisibleCFIUpdates](self, "registerForVisibleCFIUpdates");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->_webView, "configuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userContentController"));

    objc_msgSend(v27, "be_addScriptMessageHandler:name:", self, CFSTR("selectionChange"));
    objc_initWeak((id *)buf, self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_64170;
    v29[3] = &unk_1C03D8;
    objc_copyWeak(&v30, (id *)buf);
    objc_msgSend(v28, "performAfterLoadCompleteOrFailure:", v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
}

- (void)registerForVisibleCFIUpdates
{
  void *v3;
  _BOOL4 listeningForCFIUpdates;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->_webView, "configuration"));
  if (v3)
  {
    listeningForCFIUpdates = self->_listeningForCFIUpdates;

    if (!listeningForCFIUpdates)
    {
      self->_listeningForCFIUpdates = 1;
      v6 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->_webView, "configuration"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userContentController"));
      objc_msgSend(v5, "be_addScriptMessageHandler:name:", self, CFSTR("cfiUpdate"));

    }
  }
}

- (void)unregisterForVisibleCFIUpdates
{
  void *v2;
  id v3;

  self->_listeningForCFIUpdates = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->_webView, "configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userContentController"));
  objc_msgSend(v2, "removeScriptMessageHandlerForName:", CFSTR("cfiUpdate"));

}

- (void)_postLoadComplete:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  unint64_t pageCount;
  WKWebView *webView;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  BKWK2WebViewLoader *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;

  v4 = a3;
  -[BKWK2WebViewLoader setWebViewLoaded:](self, "setWebViewLoaded:", 1);
  -[BKWK2WebViewLoader setPageCount:](self, "setPageCount:", -[WKWebView _pageCount](self->_webView, "_pageCount"));
  v5 = _AEWKLoaderLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    v8 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    pageCount = self->_pageCount;
    *(_DWORD *)buf = 138413058;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = pageCount;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Loader %@ webView %@ didFinishLoadOfURL for ordinal %lu captured pageCount:%lu", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  webView = self->_webView;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_645A8;
  v12[3] = &unk_1C0440;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v4;
  v13 = v11;
  -[WKWebView be_evaluateJavaScript:completion:](webView, "be_evaluateJavaScript:completion:", &stru_1C0418, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)setDesiredWebViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKWK2WebViewLoader desiredWebViewFrame](self, "desiredWebViewFrame");
  v24.origin.x = v8;
  v24.origin.y = v9;
  v24.size.width = v10;
  v24.size.height = v11;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectEqualToRect(v22, v24))
  {
    self->_desiredWebViewFrame.origin.x = x;
    self->_desiredWebViewFrame.origin.y = y;
    self->_desiredWebViewFrame.size.width = width;
    self->_desiredWebViewFrame.size.height = height;
    v12 = _AEWKLoaderLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = NSStringFromCGRect(v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = 134218242;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "setDesiredWebViewFrame setting webView frame ordinal: %ld to:%@", (uint8_t *)&v18, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    objc_msgSend(v17, "setFrame:", x, y, width, height);

  }
}

- (void)updatePaginationOptions:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  unint64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  v7 = _AEWKLoaderLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v13 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "updatePaginationOptions equal pagination options for ordinal %lu", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v13 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "updatePaginationOptions for ordinal %lu", buf, 0xCu);
    }

    -[BKWK2WebViewLoader setPaginationOptions:](self, "setPaginationOptions:", v4);
    -[BKWK2WebViewLoader setPageCount:](self, "setPageCount:", 0x7FFFFFFFFFFFFFFFLL);
    -[BKWK2WebViewLoader clearPaginationResults](self, "clearPaginationResults");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_64B38;
    v10[3] = &unk_1BFDB8;
    v10[4] = self;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    v8 = v11;
    -[NSObject _doAfterNextStablePresentationUpdate:](v8, "_doAfterNextStablePresentationUpdate:", v10);

  }
}

- (void)setPageTextDirectionIsRTL:(BOOL)a3 isVerticalDocument:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[BKWK2WebViewLoader setTextDirectionDetermined:](self, "setTextDirectionDetermined:", 1);
  -[BKWK2WebViewLoader setPageTextDirectionIsRTL:](self, "setPageTextDirectionIsRTL:", v5);
  -[BKWK2WebViewLoader setIsVerticalDocument:](self, "setIsVerticalDocument:", v4);
}

- (void)clearPaginationResults
{
  id v3;
  NSObject *v4;
  NSDictionary *anchorLocations;
  int v6;
  unint64_t v7;

  v3 = _AEWKLoaderLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "clearPaginationResults for ordinal %lu", (uint8_t *)&v6, 0xCu);
  }

  anchorLocations = self->_anchorLocations;
  self->_anchorLocations = 0;

}

- (unint64_t)pageCount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  unint64_t pageCount;
  int v21;
  unint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));

  if (!v3)
    return self->_pageCount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  v5 = objc_msgSend(v4, "_pageCount");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  v7 = objc_msgSend(v6, "_paginationMode");

  if (!v7)
    v5 = -[BKWK2WebViewLoader _scrollPageCountFromCurrentPageSize](self, "_scrollPageCountFromCurrentPageSize");
  if (self->_pageCount == 0x7FFFFFFFFFFFFFFFLL && -[BKWK2WebViewLoader webViewLoaded](self, "webViewLoaded"))
  {
    v8 = _AEWKLoaderLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134218240;
      v22 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      v23 = 2048;
      v24 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Unknown page count. Ordinal: %lu capturing pageCount: %lu", (uint8_t *)&v21, 0x16u);
    }

    self->_pageCount = (unint64_t)v5;
  }
  if (!-[BKWK2WebViewLoader webViewLoaded](self, "webViewLoaded"))
  {
    v10 = _AEWKLoaderLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKWK2WebViewLoader ordinal](self, "ordinal")));
      v21 = 138412546;
      v22 = (unint64_t)v13;
      v23 = 2112;
      v24 = v14;

    }
  }
  if (v5 != (id)self->_pageCount)
  {
    v15 = _AEWKLoaderLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
      pageCount = self->_pageCount;
      v21 = 134349826;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2050;
      v26 = v5;
      v27 = 2050;
      v28 = pageCount;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Loader Asking PageCount for ordinal %{public}lu webView %@ webViewPageCount:%{public}lu captured pageCount:%{public}lu", (uint8_t *)&v21, 0x2Au);

    }
    self->_pageCount = (unint64_t)v5;
  }
  return (unint64_t)v5;
}

- (void)parseTOCIdCssRulesForMap:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  id v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));

  v9 = v8 == 0;
  v10 = _AEWKLoaderLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader url](self, "url"));
      *(_DWORD *)buf = 138412290;
      v23 = (unint64_t)v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Loader parseTOCIdCssRules %@", buf, 0xCu);

    }
    if (objc_msgSend(v6, "count"))
    {
      v21 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 1, &v21));
      v15 = v21;
      if (!v15)
      {
        if (v14)
        {
          v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4);
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_cleanup.tocIdCssRules(%@);"),
                              v15));
            objc_initWeak((id *)buf, self);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_65278;
            v18[3] = &unk_1C0468;
            objc_copyWeak(&v20, (id *)buf);
            v18[4] = self;
            v19 = v7;
            objc_msgSend(v17, "evaluateJavaScript:completionHandler:", v16, v18);

            objc_destroyWeak(&v20);
            objc_destroyWeak((id *)buf);

            v15 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    v7[2](v7);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v23 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Attempting to parseTOCIdCssRulesForMap with no web view ordinal: %lu", buf, 0xCu);
  }

  v7[2](v7);
LABEL_15:

}

- (void)_updateContentInformationWithRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BKWK2WebViewLoader *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  BKWK2WebViewLoader *v42;
  id v43;
  uint8_t buf[4];
  BKWK2WebViewLoader *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));

    v6 = v5 == 0;
    v7 = _AEWKLoaderLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
        *(_DWORD *)buf = 138412802;
        v45 = self;
        v46 = 2112;
        v47 = v18;
        v48 = 2112;
        v49 = v4;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "loader: %@ webview: %@ processing request: %@", buf, 0x20u);

      }
      -[BKWK2WebViewLoader setCurrentInfoRequest:](self, "setCurrentInfoRequest:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stylesheetSet"));
      objc_msgSend(v20, "applyToWebView:", v19);
      objc_msgSend(v4, "fontSize");
      objc_msgSend(v19, "_setTextZoomFactor:");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paginationOptions"));
      objc_msgSend(v21, "applyToWebView:", v19);
      -[BKWK2WebViewLoader updatePaginationOptions:](self, "updatePaginationOptions:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentLayoutInfo updateScriptWithOptions:](BEContentLayoutInfo, "updateScriptWithOptions:", v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfiOptions"));
      objc_msgSend(v21, "gapBetweenPages");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJS updateScriptWithOptions:gapBetweenPages:paginatedTopToBottom:](BECFIUtilitiesJS, "updateScriptWithOptions:gapBetweenPages:paginatedTopToBottom:", v23, objc_msgSend(v21, "mode") == &dword_4, v24));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cleanupOptions"));
      objc_msgSend(v21, "pageLength");
      v28 = v27;
      objc_msgSend(v21, "gapBetweenPages");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJS updateScriptWithOptions:pageLength:gapBetweenPages:](BEContentCleanupJS, "updateScriptWithOptions:pageLength:gapBetweenPages:", v26, v28, v29));

      objc_initWeak((id *)buf, self);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_6584C;
      v38[3] = &unk_1C0490;
      v31 = v22;
      v39 = v31;
      v32 = v25;
      v40 = v32;
      v33 = v30;
      v41 = v33;
      v42 = self;
      v34 = v4;
      v43 = v34;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_659A8;
      v35[3] = &unk_1C04B8;
      objc_copyWeak(&v37, (id *)buf);
      v35[4] = self;
      v36 = v34;
      objc_msgSend(v19, "be_evaluateJavaScript:completion:", v38, v35);

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = (BKWK2WebViewLoader *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));
        *(_DWORD *)buf = 138412546;
        v45 = v10;
        v46 = 2112;
        v47 = v4;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Currently handling request %@ when received request %@", buf, 0x16u);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));

      if (v11)
      {
        v12 = _AEWKLoaderLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
          *(_DWORD *)buf = 138412802;
          v45 = self;
          v46 = 2112;
          v47 = v14;
          v48 = 2112;
          v49 = v4;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "loader: %@ enqueueContentInfoRequest replacing pendingRequest: %@ with request %@", buf, 0x20u);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "completion"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
          ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v17, 0);

        }
      }
      -[BKWK2WebViewLoader setPendingInfoRequest:](self, "setPendingInfoRequest:", v4);
    }
  }

}

- (void)generatePaginationDataCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSDictionary *anchorLocations;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  BKWK2WebViewLoader *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));
  objc_msgSend(v5, "setState:", 1);

  v6 = _AEWKLoaderLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    *(_DWORD *)buf = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    v20 = 2048;
    v21 = -[BKWK2WebViewLoader pageCount](self, "pageCount");
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Loader: %@ webView: %@ generatePaginationData for ordinal %lu using pageCount:%lu", buf, 0x2Au);

  }
  anchorLocations = self->_anchorLocations;
  self->_anchorLocations = 0;

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_65DB0;
  v11[3] = &unk_1BFE78;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v4;
  v12 = v10;
  -[BKWK2WebViewLoader updateAnchorInformation:](self, "updateAnchorInformation:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)updateAnchorInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));
  objc_msgSend(v5, "setState:", 3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest")),
        v8 = objc_msgSend(v7, "isRequestValid"),
        v7,
        (v8 & 1) != 0))
  {
    objc_initWeak(location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_66044;
    v16[3] = &unk_1C04E0;
    objc_copyWeak(&v17, location);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_66158;
    v13[3] = &unk_1C0440;
    objc_copyWeak(&v15, location);
    v14 = v4;
    objc_msgSend(v6, "be_evaluateJavaScript:completion:", v16, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  else
  {
    v9 = _AEWKLoaderLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)-[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "No webview when trying to get anchor locations for ordinal:%lu !", (uint8_t *)location, 0xCu);
    }

    v11 = objc_retainBlock(v4);
    v12 = v11;
    if (v11)
      (*((void (**)(id))v11 + 2))(v11);

  }
}

- (void)updateMediaFrames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_66420;
  v10[3] = &unk_1C04E0;
  objc_copyWeak(&v11, &location);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_664CC;
  v7[3] = &unk_1C0440;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "be_evaluateJavaScript:completion:", v10, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  double v31;
  uint64_t v32;
  void (**v33)(void);
  void (**v34)(void);
  void (*v35)(void);
  id v36;
  NSObject *v37;
  Class v38;
  NSString *v39;
  void *v40;
  void (**v41)(void);
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  unint64_t v51;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class(BKEpubCFILocation);
    v9 = BUDynamicCast(v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_opt_class(BKEpubLocation);
    v12 = BUDynamicCast(v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v10)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_66A58;
      v45[3] = &unk_1C0508;
      v45[4] = self;
      v46 = v10;
      v47 = v7;
      -[BKWK2WebViewLoader clientRectsForLocation:completion:](self, "clientRectsForLocation:completion:", v46, v45);

      v14 = v46;
LABEL_4:

LABEL_26:
      goto LABEL_27;
    }
    objc_opt_class(BKPageLocation);
    if ((objc_opt_isKindOfClass(v6, v18) & 1) != 0)
    {
      v19 = objc_msgSend(v6, "pageOffset");
      v20 = _AEWKLoaderLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v49 = (unint64_t)v19;
        v50 = 2112;
        v51 = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Determined pageOffset: %lu for page location: %@", buf, 0x16u);
      }

      v22 = objc_retainBlock(v7);
      v23 = v22;
      if (v22)
        (*((void (**)(id, id, uint64_t))v22 + 2))(v22, v19, 1);
LABEL_25:

      goto LABEL_26;
    }
    objc_opt_class(BKAnchorLocation);
    if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
    {
      v23 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "anchor"));
      if (objc_msgSend(v25, "length"))
        v26 = -[BKWK2WebViewLoader pageOffsetForAnchor:](self, "pageOffsetForAnchor:", v25);
      else
        v26 = 0;
      v27 = _AEWKLoaderLog();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v49 = v26;
        v50 = 2112;
        v51 = (unint64_t)v23;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Determined pageOffset: %lu for anchor location: %@", buf, 0x16u);
      }

      v29 = objc_retainBlock(v7);
      v30 = v29;
      if (v29)
        (*((void (**)(id, unint64_t, uint64_t))v29 + 2))(v29, v26, 1);

      goto LABEL_25;
    }
    if (v13)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_66BF4;
      v42[3] = &unk_1C0530;
      v42[4] = self;
      v43 = v13;
      v44 = v7;
      -[BKWK2WebViewLoader clientRectForEpubLocation:completion:](self, "clientRectForEpubLocation:completion:", v43, v42);

      v14 = v43;
      goto LABEL_4;
    }
    *(_QWORD *)&v31 = objc_opt_class(BKLocation).n128_u64[0];
    if (objc_msgSend(v6, "isMemberOfClass:", v32, v31))
    {
      v33 = (void (**)(void))objc_retainBlock(v7);
      v34 = v33;
      if (!v33)
      {
LABEL_36:

        goto LABEL_26;
      }
      v35 = v33[2];
    }
    else
    {
      v36 = _AEWKLoaderLog();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class(v6);
        v39 = NSStringFromClass(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        *(_DWORD *)buf = 138412546;
        v49 = (unint64_t)v40;
        v50 = 2048;
        v51 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_ERROR, "pageOffsetRangeForLocation unsupported location type (%@) for ordinal:%lu", buf, 0x16u);

      }
      v41 = (void (**)(void))objc_retainBlock(v7);
      v34 = v41;
      if (!v41)
        goto LABEL_36;
      v35 = v41[2];
    }
    v35();
    goto LABEL_36;
  }
  v15 = _AEWKLoaderLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v49 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "pageOffsetRangeForLocation missing location for ordinal:%lu", buf, 0xCu);
  }

  v17 = objc_retainBlock(v7);
  v10 = v17;
  if (v17)
    (*((void (**)(id, uint64_t, _QWORD))v17 + 2))(v17, 0x7FFFFFFFFFFFFFFFLL, 0);
LABEL_27:

}

- (void)clientRectsForLocations:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  Class v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];

  v5 = a3;
  v33 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_opt_class(BKEpubCFILocation);
        v13 = BUDynamicCast(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v14;
        if (v14)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cfiString"));
          objc_msgSend(v6, "addObject:", v16);
        }
        else
        {
          v17 = _AEWKLoaderLog();
          v16 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_opt_class(v11);
            v19 = NSStringFromClass(v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            *(_DWORD *)buf = 138412290;
            v45 = v20;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "We should not get any type other than a BKEpubCFILocation here but we got a %@", buf, 0xCu);

          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v8);
  }

  v37 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 0, &v37));
  v22 = v37;
  if (!objc_msgSend(v21, "length") || v22)
  {
    if (!v22)
    {
      *(_QWORD *)&v25 = objc_opt_class(self).n128_u64[0];
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description", v25));
      v42 = NSLocalizedDescriptionKey;
      v43 = CFSTR("no JSON data");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v27, 1, v28));

    }
    v29 = _AEWKLoaderLog();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v22;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "Failed to get JSON Data from cfi strings - %@", buf, 0xCu);
    }

    v31 = objc_retainBlock(v33);
    v23 = v31;
    if (v31)
      (*((void (**)(id, _QWORD, id))v31 + 2))(v31, 0, v22);
  }
  else
  {
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v21, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.getClientRects(%@);"),
                      v22));
    objc_initWeak((id *)buf, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_671B0;
    v34[3] = &unk_1C0468;
    objc_copyWeak(&v36, (id *)buf);
    v34[4] = self;
    v35 = v33;
    objc_msgSend(v24, "evaluateJavaScript:completionHandler:", v23, v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

}

- (void)clientRectsForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_674EC;
  v11[3] = &unk_1C0558;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[BKWK2WebViewLoader clientRectsForLocations:completion:](self, "clientRectsForLocations:completion:", v8, v11);

}

- (void)clientRectForEpubLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void (**v17)(id, void *, void *);
  CGSize size;
  void *v19;
  _QWORD v20[4];
  id v21;
  BKWK2WebViewLoader *v22;
  id v23;
  _OWORD v24[2];
  const __CFString *v25;
  uint64_t v26;
  NSErrorUserInfoKey v27;
  void *v28;
  uint8_t buf[4];
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsonObject"));
  v9 = (void *)v8;
  if (v8)
  {
    v25 = CFSTR("_id");
    v26 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJS upgradeAnnotationsScript:](BECFIUtilitiesJS, "upgradeAnnotationsScript:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_67814;
    v20[3] = &unk_1C0580;
    v21 = v6;
    v22 = self;
    v23 = v7;
    objc_msgSend(v12, "evaluateJavaScript:completionHandler:", v11, v20);

    v13 = v21;
  }
  else
  {
    v14 = _AEAnnotationLocationLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to get json object from location: %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get json object from location: %@"), v6));
    v27 = NSDebugDescriptionErrorKey;
    v28 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BookEPUBError"), 4, v16));

    v17 = (void (**)(id, void *, void *))objc_retainBlock(v7);
    if (v17)
    {
      size = CGRectZero.size;
      v24[0] = CGRectZero.origin;
      v24[1] = size;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v24, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
      v17[2](v17, v19, v13);

    }
  }

}

- (BOOL)pageTextDirectionIsRTL
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!-[BKWK2WebViewLoader textDirectionDetermined](self, "textDirectionDetermined"))
  {
    v3 = _AEWKLoaderLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Attempting to use pageTextDirectionIsRTL before it has been determined.", v6, 2u);
    }

  }
  return self->_pageTextDirectionIsRTL;
}

- (BOOL)isVerticalDocument
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!-[BKWK2WebViewLoader textDirectionDetermined](self, "textDirectionDetermined"))
  {
    v3 = _AEWKLoaderLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Attempting to use isVerticalDocument before it has been determined.", v6, 2u);
    }

  }
  return self->_isVerticalDocument;
}

- (void)cancelCurrentRequest
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));
  objc_msgSend(v2, "invalidateRequest");

}

- (void)enqueueContentInfoRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  BKWK2WebViewLoader *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));

  if (v5)
  {
    v6 = _AEWKLoaderLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
      v12 = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "loader: %@ enqueueContentInfoRequest replacing pendingRequest: %@ with request %@", (uint8_t *)&v12, 0x20u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completion"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
      ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v11, 0);

    }
  }
  -[BKWK2WebViewLoader setPendingInfoRequest:](self, "setPendingInfoRequest:", v4);
  -[BKWK2WebViewLoader _sendNextInfoRequest](self, "_sendNextInfoRequest");

}

- (void)_sendNextInfoRequest
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentInfoRequest](self, "currentInfoRequest"));

  if (!v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader pendingInfoRequest](self, "pendingInfoRequest"));
    if (v4)
    {
      -[BKWK2WebViewLoader setPendingInfoRequest:](self, "setPendingInfoRequest:", 0);
      -[BKWK2WebViewLoader _updateContentInformationWithRequest:](self, "_updateContentInformationWithRequest:", v4);
    }

  }
}

- (int64_t)_scrollPageCountFromCurrentPageSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  objc_msgSend(v3, "scrollPageLength");
  v5 = v4;

  if (v5 <= 1.0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_estimatedContentSizeValue"));

  if (!v7
    || ((objc_msgSend(v7, "CGSizeValue"), CGSizeZero.width == v9) ? (v10 = CGSizeZero.height == v8) : (v10 = 0), v10))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scrollView"));
    objc_msgSend(v17, "contentSize");
    v12 = v18;
    v14 = v19;

  }
  else
  {
    objc_msgSend(v7, "CGSizeValue");
    v12 = v11;
    v14 = v13;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  if (!objc_msgSend(v20, "isHorizontalScroll"))
    v12 = v14;

  return vcvtmd_s64_f64(v12 / v5) + 1;
}

- (id)_pageOffsetsForFrames:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_67F38;
  v10[3] = &unk_1C05A8;
  v10[4] = self;
  v12 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (unint64_t)_pageOffsetForXOffset:(double)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char *v19;
  unint64_t v20;
  void *v21;
  double Width;
  double v23;
  double v24;
  id v25;
  NSObject *v26;
  BKWK2WebViewLoader *v27;
  void *v28;
  void *v29;
  double v30;
  id v31;
  NSObject *v32;
  double v33;
  unint64_t v34;
  unint64_t v36;
  int v38;
  BKWK2WebViewLoader *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  CGRect v44;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));

  if (!v5)
  {
    v6 = _AEWKLoaderLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v38 = 138412290;
      v39 = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Invalid Pagination Options in Loader %@ when trying to determine pageOffsetForXOffset", (uint8_t *)&v38, 0xCu);
    }

  }
  if (-[BKWK2WebViewLoader pageCount](self, "pageCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = _AEWKLoaderLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v38 = 138412290;
      v39 = self;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Page count not initialied in Loader %@ when trying to determine pageOffsetForXOffset", (uint8_t *)&v38, 0xCu);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  v12 = objc_msgSend(v11, "mode");

  if (v12)
  {
    objc_msgSend(v10, "pageLength");
    v14 = v13;
    objc_msgSend(v10, "gapBetweenPages");
    v16 = v14 + v15;
  }
  else
  {
    objc_msgSend(v10, "scrollPageLength");
    v16 = v17;
  }
  if (v16 <= 0.0)
    goto LABEL_25;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  v19 = (char *)objc_msgSend(v18, "mode");

  if (v19 == (_BYTE *)&dword_0 + 2)
  {
    v20 = vcvtmd_u64_f64(fmax(a3, 0.0) / v16);
    goto LABEL_31;
  }
  if ((objc_msgSend(v10, "isHorizontalScroll") & 1) == 0
    && objc_msgSend(v10, "mode") != (char *)&dword_0 + 3)
  {
    v31 = _AEWKLoaderLog();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "We don't handle calculating the page offset for this document.", (uint8_t *)&v38, 2u);
    }

LABEL_25:
    v20 = 0;
    goto LABEL_31;
  }
  if (-[BKWK2WebViewLoader pageTextDirectionIsRTL](self, "pageTextDirectionIsRTL"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
    objc_msgSend(v21, "frame");
    Width = CGRectGetWidth(v44);
    objc_msgSend(v10, "pageLength");
    v24 = v23 + v23;

    if (Width > v24)
    {
      v25 = _AEBookPluginsRTLLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (BKWK2WebViewLoader *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
        a3 = a3 - v16;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
        v38 = 134218498;
        v39 = v27;
        v40 = 2112;
        v41 = v28;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "[#RTL] WebView: %p is possibly 2up. Changing xOffset from %@ to %@ to get page Offset", (uint8_t *)&v38, 0x20u);

      }
      else
      {
        a3 = a3 - v16;
      }

    }
    v30 = ceil(-a3 / v16);
    v33 = floor(a3 / v16);
    if (a3 > 0.0)
      v30 = v33;
  }
  else
  {
    v30 = fabs(floor(a3 / v16));
  }
  v20 = (unint64_t)v30;
LABEL_31:
  v34 = -[BKWK2WebViewLoader pageCount](self, "pageCount");
  if (v20 < v34 || (uint64_t)v34 < 1)
    v36 = v20;
  else
    v36 = v34 - 1;

  return v36;
}

- (_NSRange)pageOffsetRangeForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSUInteger v13;
  NSUInteger v14;
  int v15;
  BKWK2WebViewLoader *v16;
  _NSRange result;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));

  if (!v8)
  {
    v9 = _AEWKLoaderLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Invalid pagination options in loader %@", (uint8_t *)&v15, 0xCu);
    }

  }
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (CGRectIsNull(v18))
  {
    v11 = _AEWKLoaderLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Invalid rect when getting pageOffsetForRect in loader %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v14 = (NSUInteger)-[BKWK2WebViewLoader _uncheckedPageOffsetRangeForRect:](self, "_uncheckedPageOffsetRangeForRect:", x, y, width, height);
  }
  result.length = v13;
  result.location = v14;
  return result;
}

- (_NSRange)_uncheckedPageOffsetRangeForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  unsigned int v10;
  double MinX;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  uint8_t *v16;
  NSUInteger v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  double MinY;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  unint64_t v29;
  __int16 v30;
  uint8_t buf[2];
  _NSRange result;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
  if (objc_msgSend(v8, "mode"))
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    v10 = objc_msgSend(v9, "isHorizontalScroll");

    if (!v10)
    {
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      MinY = CGRectGetMinY(v35);
      if (MinY <= 3.40282347e38)
        v23 = MinY;
      else
        v23 = 3.40282347e38;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v24 = fmax(CGRectGetMaxY(v36), -3.40282347e38);
      if (v23 > v24)
      {
        v25 = _AEWKLoaderLog();
        v15 = objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v30 = 0;
        v16 = (uint8_t *)&v30;
        goto LABEL_10;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
      objc_msgSend(v26, "contentLayoutSize");
      v28 = v27;

      v20 = vcvtmd_u64_f64(v23 / v28);
      v29 = vcvtmd_u64_f64(v24 / v28);
      if (v20 >= v29)
        v18 = v29;
      else
        v18 = v20;
      if (v20 <= v29)
        v20 = v29;
LABEL_16:
      v17 = v20 - v18 + 1;
      goto LABEL_29;
    }
  }
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinX = CGRectGetMinX(v33);
  if (MinX <= 3.40282347e38)
    v12 = MinX;
  else
    v12 = 3.40282347e38;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v13 = fmax(CGRectGetMaxX(v34), -3.40282347e38);
  if (v12 <= v13)
  {
    v19 = -[BKWK2WebViewLoader _pageOffsetForXOffset:](self, "_pageOffsetForXOffset:", v12);
    v18 = -[BKWK2WebViewLoader _pageOffsetForXOffset:](self, "_pageOffsetForXOffset:", v13);
    v20 = v18;
    v21 = v19 > v18;
    if (v19 < v18)
      v18 = v19;
    if (v21)
      v20 = v19;
    goto LABEL_16;
  }
  v14 = _AEWKLoaderLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = buf;
LABEL_10:
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Bogus rect checking _uncheckedPageOffsetRangeForRect", v16, 2u);
  }
LABEL_11:

  v17 = 0;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
  result.length = v17;
  result.location = v18;
  return result;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  int v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;

  v4 = a3;
  objc_opt_class(BKEpubCFILocation);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v7)
  {
    objc_opt_class(BKPageLocation);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      v9 = (unint64_t)objc_msgSend(v4, "pageOffset");
      v11 = _AEWKLoaderLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 134218242;
        v22 = v9;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Determined Page Offset %lu for page location %@", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      objc_opt_class(BKAnchorLocation);
      if ((objc_opt_isKindOfClass(v4, v15) & 1) == 0)
      {
        *(_QWORD *)&v16 = objc_opt_class(BKLocation).n128_u64[0];
        if (objc_msgSend(v4, "isMemberOfClass:", v17, v16))
          v9 = 0;
        else
          v9 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_21;
      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchor"));
      if (v12)
        v9 = -[BKWK2WebViewLoader pageOffsetForAnchor:](self, "pageOffsetForAnchor:", v12);
      else
        v9 = 0;
      v18 = _AEWKLoaderLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 134218242;
        v22 = v9;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Determined Page Offset %lu for anchor location %@", (uint8_t *)&v21, 0x16u);
      }

    }
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "isPageLocation"))
  {
    v9 = (unint64_t)objc_msgSend(v8, "pageOffset");
  }
  else
  {
    v13 = _AEWKLoaderLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "CFI Location is not a pageLocation - unable to get pageOffset for this location", (uint8_t *)&v21, 2u);
    }

    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_21:

  return v9;
}

- (id)locationForPageOffset:(unint64_t)a3
{
  return -[BKWK2WebViewLoader locationForPageOffset:contentOffset:](self, "locationForPageOffset:contentOffset:", a3, CGPointZero.x, CGPointZero.y);
}

- (id)locationForPageOffset:(unint64_t)a3 contentOffset:(CGPoint)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation unknownLocation](BKEpubCFILocation, "unknownLocation", a3, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentFirstVisbleCFILocation](self, "currentFirstVisbleCFILocation"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentFirstVisbleCFILocation](self, "currentFirstVisbleCFILocation"));

    v5 = (void *)v7;
  }
  return v5;
}

- (id)locationForAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader anchorLocations](self, "anchorLocations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (id)anchorFrameForAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader anchorFrames](self, "anchorFrames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (unint64_t)pageOffsetForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  unint64_t v11;
  int v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v10 = _AEWKLoaderLog();
    v5 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Request to find page offset from an empty anchor ordinal:%lu", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_12;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader locationForAnchor:](self, "locationForAnchor:", v4));
  v6 = _AEWKLoaderLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = (unint64_t)v4;
      v15 = 2048;
      v16 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Unknown location for anchor %@ ordinal:%lu", (uint8_t *)&v13, 0x16u);
    }

LABEL_12:
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = (unint64_t)v5;
    v15 = 2112;
    v16 = (unint64_t)v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found location %@ for anchor %@", (uint8_t *)&v13, 0x16u);
  }

  if (-[NSObject pageOffset](v5, "pageOffset") == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = -[BKWK2WebViewLoader pageOffsetForLocation:](self, "pageOffsetForLocation:", v5);
  else
    v9 = -[NSObject pageOffset](v5, "pageOffset");
  v11 = (unint64_t)v9;
LABEL_15:

  return v11;
}

- (CGRect)rectForPageOffset:(unint64_t)a3
{
  void *v3;
  void *v6;
  double v7;
  double v8;
  double v9;
  double height;
  id v11;
  NSObject *v12;
  double y;
  double x;
  id v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  int *v25;
  char v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double Width;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  unint64_t v46;
  CGRect v47;
  CGRect result;

  if (-[BKWK2WebViewLoader pageCount](self, "pageCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    objc_msgSend(v6, "contentLayoutSize");
    v8 = v7;
    height = v9;

    v11 = _AEWKLoaderLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v45 = 134217984;
      v46 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "rectForPageOffset invalid page count ordinal: %lu", (uint8_t *)&v45, 0xCu);
    }

    y = 0.0;
    goto LABEL_5;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    objc_msgSend(v17, "contentLayoutSize");
    v8 = v18;
    height = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    v21 = objc_msgSend(v20, "mode");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    if (objc_msgSend(v22, "mode") == (char *)&dword_0 + 3)
    {
      v23 = 1;
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
      v23 = objc_msgSend(v3, "isHorizontalScroll");

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
    v25 = (int *)objc_msgSend(v24, "mode");
    if (v25 == &dword_4
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions")),
          !objc_msgSend(v3, "mode")))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
      v26 = objc_msgSend(v27, "isHorizontalScroll") ^ 1;

      if (v25 == &dword_4)
        goto LABEL_18;
    }
    else
    {
      v26 = 0;
    }

LABEL_18:
    if (v21)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
      objc_msgSend(v30, "gapBetweenPages");
      v32 = v31;

      if (a3)
        goto LABEL_20;
    }
    else
    {
      v32 = 0.0;
      if (a3)
      {
LABEL_20:
        v28 = v32 * 0.5;
        v29 = (double)(a3 - 1);
        if ((v26 & 1) != 0)
        {
          y = v28 + height + v28 + v29 * (height + v32);
          x = 0.0;
          if ((v23 & 1) == 0)
            goto LABEL_34;
          goto LABEL_26;
        }
        v33 = v8 + v32;
        if ((v23 & 1) == 0)
        {
          x = v28 + v8 + v28 + v29 * v33;
LABEL_33:
          y = 0.0;
          goto LABEL_34;
        }
LABEL_30:
        v34 = (double)a3;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView", v28, v29));
        objc_msgSend(v35, "frame");
        Width = CGRectGetWidth(v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader paginationOptions](self, "paginationOptions"));
        objc_msgSend(v37, "pageLength");
        v39 = v38 + v38;

        v40 = -0.0;
        if (Width > v39)
          v40 = v33;
        x = v40 - v33 * v34;
        goto LABEL_33;
      }
    }
    y = 0.0;
    if ((v23 & 1) == 0)
    {
LABEL_5:
      x = 0.0;
      goto LABEL_34;
    }
    if ((v26 & 1) != 0)
    {
LABEL_26:
      x = -0.0;
      goto LABEL_34;
    }
    v33 = v8 + v32;
    goto LABEL_30;
  }
  v15 = _AEWKLoaderLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v45 = 134217984;
    v46 = -[BKWK2WebViewLoader ordinal](self, "ordinal");
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "rectForPageOffset invalid pageOffset request in ordinal: %lu", (uint8_t *)&v45, 0xCu);
  }
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  v8 = CGRectNull.size.width;
  height = CGRectNull.size.height;

LABEL_34:
  v41 = x;
  v42 = y;
  v43 = v8;
  v44 = height;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGRect)contentRectForVisibleContent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double x;
  double y;
  double width;
  double height;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  -[BKWK2WebViewLoader contentRectForVisiblePage](self, "contentRectForVisiblePage");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (v12)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v12, "convertRect:fromView:", v3);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "bounds");
    v41.origin.x = v21;
    v41.origin.y = v22;
    v41.size.width = v23;
    v41.size.height = v24;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    v39 = CGRectIntersection(v38, v41);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_contentView"));
    objc_msgSend(v12, "convertRect:toView:", v29, x, y, width, height);
    v5 = v30;
    v7 = v31;
    v9 = v32;
    v11 = v33;

  }
  v34 = v5;
  v35 = v7;
  v36 = v9;
  v37 = v11;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)contentRectForVisiblePage
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader webView](self, "webView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "be_contentView"));
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", v2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  unsigned int v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("cfiUpdate"));

  if (v7)
  {
    *(_QWORD *)&v8 = objc_opt_class(NSDictionary).n128_u64[0];
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body", v8));
    v12 = BUDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    *(_QWORD *)&v14 = objc_opt_class(NSDictionary).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("visibleCFIs"), v14));
    v18 = BUDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    *(_QWORD *)&v20 = objc_opt_class(NSString).n128_u64[0];
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("start"), v20));
    v24 = BUDynamicCast(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    *(_QWORD *)&v26 = objc_opt_class(NSString).n128_u64[0];
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("end"), v26));
    v30 = BUDynamicCast(v28, v29);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);

    v85 = v19;
    if (!v19 || !v25 || !v31)
    {
      v32 = _AEWKLoaderLog();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body"));
        *(_DWORD *)buf = 138412546;
        v91 = v34;
        v92 = 2112;
        v93 = v35;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "Failed to get cfi string from message %@ %@", buf, 0x16u);

      }
    }
    v36 = _AECaptureLocationLog();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKWK2WebViewLoader ordinal](self, "ordinal")));
      *(_DWORD *)buf = 138412802;
      v91 = v38;
      v92 = 2112;
      v93 = v25;
      v94 = 2112;
      v95 = v31;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "ordinal: %@ BKWK2WebViewLoaderCFIUpdateJSMessage received start: %@  end: %@ ", buf, 0x20u);

    }
    if (v25)
    {
      v89 = 0;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v25, &v89));
      v40 = v89;
    }
    else
    {
      v39 = 0;
      v40 = 0;
    }
    v86 = v13;
    if (v31)
    {
      v88 = 0;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v31, &v88));
      v67 = v88;

      v40 = v67;
    }
    else
    {
      v66 = 0;
    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "cfi"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "cfi"));
    v70 = objc_msgSend(v68, "compare:", v69);

    if (v70 == (id)-1)
      v71 = v39;
    else
      v71 = v66;
    if (v70 == (id)-1)
      v39 = v66;
    if (v39 && v71)
    {
      v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "unionWithCFI:", v71));
    }
    else if (v39)
    {
      v72 = v39;
    }
    else
    {
      v72 = v71;
    }
    v73 = v72;
    v74 = _AECaptureLocationLog();
    v75 = objc_claimAutoreleasedReturnValue(v74);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKWK2WebViewLoader ordinal](self, "ordinal")));
      *(_DWORD *)buf = 138412546;
      v91 = v76;
      v92 = 2112;
      v93 = v39;
      _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "ordinal: %@ BKWK2WebViewLoaderCFIUpdateJSMessage capturing startLocation location: %@ ", buf, 0x16u);

    }
    -[BKWK2WebViewLoader setCurrentFirstVisbleCFILocation:](self, "setCurrentFirstVisbleCFILocation:", v39);
    -[BKWK2WebViewLoader setCurrentLastVisbleCFILocation:](self, "setCurrentLastVisbleCFILocation:", v71);
    -[BKWK2WebViewLoader setCurrentVisbleCFILocation:](self, "setCurrentVisbleCFILocation:", v73);
    v77 = objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader delegate](self, "delegate"));
    v78 = (void *)v77;
    if (v77 && (objc_opt_respondsToSelector(v77, "webViewLoader:didUpdateCurrentVisibleCFILocation:") & 1) != 0)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader currentVisbleCFILocation](self, "currentVisbleCFILocation"));
      objc_msgSend(v78, "webViewLoader:didUpdateCurrentVisibleCFILocation:", self, v79);

    }
    v54 = v85;
    v48 = v86;
    goto LABEL_43;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("selectionChange"));

  if (v42)
  {
    *(_QWORD *)&v43 = objc_opt_class(NSDictionary).n128_u64[0];
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body", v43));
    v47 = BUDynamicCast(v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    if (!v48)
    {
LABEL_44:

      goto LABEL_45;
    }
    *(_QWORD *)&v49 = objc_opt_class(NSString).n128_u64[0];
    v51 = v50;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("cfi"), v49));
    v53 = BUDynamicCast(v51, v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v53);

    if (objc_msgSend(v25, "length"))
    {
      v87 = 0;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v25, &v87));
      v31 = v87;
      if (v31)
      {
        v55 = _AEWKLoaderLog();
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
          *(_DWORD *)buf = 138412546;
          v91 = v57;
          v92 = 2112;
          v93 = v31;
          _os_log_impl(&dword_0, v56, OS_LOG_TYPE_ERROR, "Failed to get cfi string from message %@ %@", buf, 0x16u);

        }
      }
      if (v54)
      {
        -[BKWK2WebViewLoader setCurrentSelectionCFI:](self, "setCurrentSelectionCFI:", v54);
        *(_QWORD *)&v58 = objc_opt_class(NSNumber).n128_u64[0];
        v60 = v59;
        v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("containsAnchor"), v58));
        v62 = BUDynamicCast(v60, v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        -[BKWK2WebViewLoader setCurrentSelectionContainsAnchor:](self, "setCurrentSelectionContainsAnchor:", objc_msgSend(v63, "BOOLValue"));

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader delegate](self, "delegate"));
        LOBYTE(v61) = objc_opt_respondsToSelector(v64, "webViewLoader:didChangeSelection:");

        if ((v61 & 1) != 0)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKWK2WebViewLoader delegate](self, "delegate"));
          objc_msgSend(v65, "webViewLoader:didChangeSelection:", self, v54);

        }
      }
    }
    else
    {
      v54 = 0;
      v31 = 0;
    }
    *(_QWORD *)&v80 = objc_opt_class(NSString).n128_u64[0];
    v82 = v81;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectionText"), v80));
    v84 = BUDynamicCast(v82, v83);
    v40 = (id)objc_claimAutoreleasedReturnValue(v84);

    if (v40)
      -[BKWK2WebViewLoader setCurrentTextSelection:](self, "setCurrentTextSelection:", v40);
LABEL_43:

    goto LABEL_44;
  }
LABEL_45:

}

- (WKWebView)webView
{
  return self->_webView;
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unint64_t)a3
{
  self->_ordinal = a3;
}

- (CGRect)desiredWebViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_desiredWebViewFrame.origin.x;
  y = self->_desiredWebViewFrame.origin.y;
  width = self->_desiredWebViewFrame.size.width;
  height = self->_desiredWebViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BKWK2WebViewLoaderDelegate)delegate
{
  return (BKWK2WebViewLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKEpubCFILocation)currentFirstVisbleCFILocation
{
  return self->_currentFirstVisbleCFILocation;
}

- (void)setCurrentFirstVisbleCFILocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentFirstVisbleCFILocation, a3);
}

- (BKEpubCFILocation)currentLastVisbleCFILocation
{
  return self->_currentLastVisbleCFILocation;
}

- (void)setCurrentLastVisbleCFILocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLastVisbleCFILocation, a3);
}

- (BKEpubCFILocation)currentVisbleCFILocation
{
  return self->_currentVisbleCFILocation;
}

- (void)setCurrentVisbleCFILocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentVisbleCFILocation, a3);
}

- (BKEpubCFILocation)currentSelectionCFI
{
  return self->_currentSelectionCFI;
}

- (void)setCurrentSelectionCFI:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectionCFI, a3);
}

- (NSString)currentTextSelection
{
  return self->_currentTextSelection;
}

- (void)setCurrentTextSelection:(id)a3
{
  objc_storeStrong((id *)&self->_currentTextSelection, a3);
}

- (BOOL)currentSelectionContainsAnchor
{
  return self->_currentSelectionContainsAnchor;
}

- (void)setCurrentSelectionContainsAnchor:(BOOL)a3
{
  self->_currentSelectionContainsAnchor = a3;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (NSString)tocIdCssRules
{
  return self->_tocIdCssRules;
}

- (void)setTocIdCssRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPageTextDirectionIsRTL:(BOOL)a3
{
  self->_pageTextDirectionIsRTL = a3;
}

- (void)setIsVerticalDocument:(BOOL)a3
{
  self->_isVerticalDocument = a3;
}

- (NSDictionary)anchorLocations
{
  return self->_anchorLocations;
}

- (void)setAnchorLocations:(id)a3
{
  objc_storeStrong((id *)&self->_anchorLocations, a3);
}

- (NSDictionary)anchorFrames
{
  return self->_anchorFrames;
}

- (void)setAnchorFrames:(id)a3
{
  objc_storeStrong((id *)&self->_anchorFrames, a3);
}

- (NSDictionary)mediaLocations
{
  return self->_mediaLocations;
}

- (void)setMediaLocations:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLocations, a3);
}

- (NSDictionary)mediaFrames
{
  return self->_mediaFrames;
}

- (void)setMediaFrames:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFrames, a3);
}

- (BOOL)currentlyUpdatingPaginationInformation
{
  return self->_currentlyUpdatingPaginationInformation;
}

- (BKWK2LoaderContentInfoRequest)currentInfoRequest
{
  return self->_currentInfoRequest;
}

- (void)setCurrentInfoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentInfoRequest, a3);
}

- (BKWK2LoaderContentInfoRequest)pendingInfoRequest
{
  return self->_pendingInfoRequest;
}

- (void)setPendingInfoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInfoRequest, a3);
}

- (unint64_t)contentInfo
{
  return self->_contentInfo;
}

- (void)setContentInfo:(unint64_t)a3
{
  self->_contentInfo = a3;
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return self->_paginationOptions;
}

- (void)setPaginationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_paginationOptions, a3);
}

- (BOOL)textDirectionDetermined
{
  return self->_textDirectionDetermined;
}

- (void)setTextDirectionDetermined:(BOOL)a3
{
  self->_textDirectionDetermined = a3;
}

- (BOOL)calculatingPageLocations
{
  return self->_calculatingPageLocations;
}

- (void)setCalculatingPageLocations:(BOOL)a3
{
  self->_calculatingPageLocations = a3;
}

- (BOOL)webViewLoaded
{
  return self->_webViewLoaded;
}

- (void)setWebViewLoaded:(BOOL)a3
{
  self->_webViewLoaded = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)listeningForCFIUpdates
{
  return self->_listeningForCFIUpdates;
}

- (void)setListeningForCFIUpdates:(BOOL)a3
{
  self->_listeningForCFIUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationOptions, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_pendingInfoRequest, 0);
  objc_storeStrong((id *)&self->_currentInfoRequest, 0);
  objc_storeStrong((id *)&self->_mediaFrames, 0);
  objc_storeStrong((id *)&self->_mediaLocations, 0);
  objc_storeStrong((id *)&self->_anchorFrames, 0);
  objc_storeStrong((id *)&self->_anchorLocations, 0);
  objc_storeStrong((id *)&self->_tocIdCssRules, 0);
  objc_storeStrong((id *)&self->_currentTextSelection, 0);
  objc_storeStrong((id *)&self->_currentSelectionCFI, 0);
  objc_storeStrong((id *)&self->_currentVisbleCFILocation, 0);
  objc_storeStrong((id *)&self->_currentLastVisbleCFILocation, 0);
  objc_storeStrong((id *)&self->_currentFirstVisbleCFILocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
