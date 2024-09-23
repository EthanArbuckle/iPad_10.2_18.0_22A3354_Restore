@implementation BKPictureBookContentViewController

- (void)viewDidLoad
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  WKWebView *v29;
  WKWebView *webView2;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WKWebView *v35;
  void *v36;
  void *v37;
  void *v38;
  WKWebView *v39;
  void *v40;
  void *v41;
  BKWK2WebViewLoader *v42;
  void *v43;
  void *v44;
  WKWebView *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  objc_msgSend(v49, "fixedLayoutSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v49, "estimatedFixedLayoutViewFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookContentViewController view](self, "view"));
  objc_msgSend(v48, "setFrame:", v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v48, "setBackgroundColor:", v16);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v3, -[BKContentViewController ordinal](self, "ordinal")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookLanguage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:](BEContentCleanupJSOptions, "fixedLayoutOptionsWithLanguage:", v17));

  v19 = objc_alloc((Class)BECFIUtilitiesJSOptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "manifestId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
  v23 = -[BKContentViewController ordinal](self, "ordinal");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "spineIndexInPackage"));
  v25 = objc_msgSend(v19, "initWithManifestId:assetId:chapterIndex:spineIndex:", v21, v22, v23, objc_msgSend(v24, "unsignedIntegerValue"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v47, 0, v5, v7));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheItem"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookContentViewController stylesheetSet](self, "stylesheetSet"));
  v29 = (WKWebView *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:", v27, v26, v18, v25, v28, v9, v11, v13, v15, v5, v7));
  webView2 = self->super._webView2;
  self->super._webView2 = v29;

  -[WKWebView setAutoresizingMask:](self->super._webView2, "setAutoresizingMask:", 18);
  -[WKWebView setOpaque:](self->super._webView2, "setOpaque:", 0);
  -[WKWebView setFrame:](self->super._webView2, "setFrame:", v9, v11, v13, v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->super._webView2, "be_navigationHandler"));
  objc_msgSend(v31, "setDelegate:", self);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_uiHandler](self->super._webView2, "be_uiHandler"));
  objc_msgSend(v32, "setDelegate:", self);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView configuration](self->super._webView2, "configuration"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "userContentController"));
  -[BKHTMLContentViewController registerScriptMessageHandlersWithUserContentController:](self, "registerScriptMessageHandlersWithUserContentController:", v34);

  v35 = self->super._webView2;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v36, "isFixedLayout")));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_updateAXValueForMessage:](v35, "be_updateAXValueForMessage:", v37));
  -[WKWebView be_updateAXCurrentReadingStateWithMessage:forValue:](v35, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginBookLayoutParameterKey"), v38);

  v39 = self->super._webView2;
  if (-[BKContentViewController pageProgressionDirection](self, "pageProgressionDirection") == 1)
    v40 = &__kCFBooleanTrue;
  else
    v40 = &__kCFBooleanFalse;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_updateAXValueForMessage:](v39, "be_updateAXValueForMessage:", v40));
  -[WKWebView be_updateAXCurrentReadingStateWithMessage:forValue:](v39, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginRTLParameterKey"), v41);

  objc_msgSend(v48, "addSubview:", self->super._webView2);
  v42 = -[BKWK2WebViewLoader initWithPaginationOptions:ordinal:]([BKWK2WebViewLoader alloc], "initWithPaginationOptions:ordinal:", v26, -[BKContentViewController ordinal](self, "ordinal"));
  -[BKHTMLContentViewController setLoader:](self, "setLoader:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webViewProxy](self, "webViewProxy"));
  objc_msgSend(v44, "setLoader:", v43);

  v45 = self->super._webView2;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  objc_msgSend(v46, "setWebView:", v45);

  v50.receiver = self;
  v50.super_class = (Class)BKPictureBookContentViewController;
  -[BKHTMLContentViewController viewDidLoad](&v50, "viewDidLoad");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookContentViewController;
  -[BKHTMLContentViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  objc_msgSend(v4, "cancelPreloadForContent:", self);

}

- (int64_t)totalPages
{
  return 1;
}

- (id)URLForLoadingDocument
{
  AEBookInfo *book;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  book = self->super.super._book;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo urlForDocument:](book, "urlForDocument:", v3));

  v5 = BEURLHandleriBooksImgUrlFromiBooksURL(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookContentViewController;
  v7 = a4;
  -[BKHTMLContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5304;
  v8[3] = &unk_1BE8C8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (id)predicateForOverlayCache
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationType == %d"), 2);
}

- (id)highlightViewContainerWK2
{
  return -[WKWebView _viewForFindUI](self->super._webView2, "_viewForFindUI");
}

- (id)stylesheetSet
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", objc_msgSend(v2, "shouldDisableOptimizeSpeed") ^ 1));

  if (!objc_msgSend(v3, "length"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/EPub/PictureBook/Controllers/BKPictureBookContentViewController.m", 156, "-[BKPictureBookContentViewController stylesheetSet]", "stylesheet.length", CFSTR("Could not generate a stylesheet!"));
  v4 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  v8 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = objc_msgSend(v4, "initWithAllFrameStylesheets:", v5);

  return v6;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  LOBYTE(self) = -[BKHTMLContentViewController isLocationOnCurrentPage:](self, "isLocationOnCurrentPage:", v4);

  return (char)self;
}

- (void)_readyToShow
{
  if (!-[BKPictureBookContentViewController alreadyRevealed](self, "alreadyRevealed"))
  {
    -[BKPictureBookContentViewController setAlreadyRevealed:](self, "setAlreadyRevealed:", 1);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_revealImmediateTimeout", 0);
    -[BKHTMLContentViewController contentReady](self, "contentReady");
  }
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookContentViewController;
  -[BKHTMLContentViewController navigationHandlerFirstSignificantPaintCompleted:](&v4, "navigationHandlerFirstSignificantPaintCompleted:", a3);
  -[BKPictureBookContentViewController setDidFinishRendering:](self, "setDidFinishRendering:", 1);
  if (-[BKPictureBookContentViewController didFinishLoading](self, "didFinishLoading"))
    -[BKPictureBookContentViewController _readyToShow](self, "_readyToShow");
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v6;
  id v7;
  WKWebView *v8;
  WKWebView *v9;
  _QWORD v10[4];
  WKWebView *v11;
  id v12;
  id location;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookContentViewController;
  -[BKHTMLContentViewController navigationHandler:didFinishLoadOfURL:](&v14, "navigationHandler:didFinishLoadOfURL:", v6, v7);
  -[BKPictureBookContentViewController setDidFinishLoading:](self, "setDidFinishLoading:", 1);
  objc_initWeak(&location, self);
  -[BKPictureBookContentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_revealImmediateTimeout", 0, 2.0);
  v8 = self->super._webView2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_56A4;
  v10[3] = &unk_1BE930;
  v9 = v8;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  -[WKWebView _doAfterNextStablePresentationUpdate:](v9, "_doAfterNextStablePresentationUpdate:", v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_revealImmediateTimeout
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!-[BKPictureBookContentViewController alreadyRevealed](self, "alreadyRevealed"))
  {
    -[BKPictureBookContentViewController setAlreadyRevealed:](self, "setAlreadyRevealed:", 1);
    v3 = _AEWKPictureBookLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Revealing even though we never got navigationHandlerFirstSignificantPaintCompleted", v5, 2u);
    }

    -[BKHTMLContentViewController contentReady](self, "contentReady");
  }
}

- (void)_sendContentInfoRequestToLoadMediaFrames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookContentViewController stylesheetSet](self, "stylesheetSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", self->super.super._book, -[BKContentViewController ordinal](self, "ordinal")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKWK2LoaderContentInfoRequest contentInfoRequestWithLocation:bookSnapshot:ordinal:configuration:stylesheetSet:completion:](BKWK2LoaderContentInfoRequest, "contentInfoRequestWithLocation:bookSnapshot:ordinal:configuration:stylesheetSet:completion:", 0, v3, -[BKContentViewController ordinal](self, "ordinal"), self->super.super._configuration, v6, &stru_1BE970));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  objc_msgSend(v5, "enqueueContentInfoRequest:", v4);

}

- (BOOL)didFinishLoading
{
  return self->_didFinishLoading;
}

- (void)setDidFinishLoading:(BOOL)a3
{
  self->_didFinishLoading = a3;
}

- (BOOL)didFinishRendering
{
  return self->_didFinishRendering;
}

- (void)setDidFinishRendering:(BOOL)a3
{
  self->_didFinishRendering = a3;
}

- (BOOL)alreadyRevealed
{
  return self->_alreadyRevealed;
}

- (void)setAlreadyRevealed:(BOOL)a3
{
  self->_alreadyRevealed = a3;
}

@end
