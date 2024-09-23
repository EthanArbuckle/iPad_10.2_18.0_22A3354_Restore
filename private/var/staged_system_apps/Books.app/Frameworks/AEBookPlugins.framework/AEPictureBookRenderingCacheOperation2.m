@implementation AEPictureBookRenderingCacheOperation2

+ (id)renderCacheWithOptions:(unint64_t)a3
{
  return -[AEPictureBookRenderingCacheOperation2 initWithOptions:]([AEPictureBookRenderingCacheOperation2 alloc], "initWithOptions:", a3);
}

- (AEPictureBookRenderingCacheOperation2)initWithOptions:(int64_t)a3
{
  AEPictureBookRenderingCacheOperation2 *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEPictureBookRenderingCacheOperation2;
  result = -[AEPictureBookRenderingCacheOperation2 initWithOptions:](&v4, "initWithOptions:", a3);
  if (result)
    result->_extraCompletionsAccessLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)callbackInvocationWithImage:(id)a3
{
  return -[AEPictureBookRenderingCacheOperation2 renderingCacheCallbackInvocationWithImage:pageNumber:](self, "renderingCacheCallbackInvocationWithImage:pageNumber:", a3, self->_pageNumber);
}

- (void)setupWebView
{
  unint64_t v3;
  double v4;
  double width;
  double v6;
  double height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  void *v14;
  WKWebView *v15;
  WKWebView *webView;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39[2];
  id location;
  CGRect v41;
  CGRect v42;

  if (-[AEPictureBookRenderingCacheOperation2 isCancelled](self, "isCancelled"))
  {
    v35 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore"));
    dispatch_semaphore_signal(v35);

  }
  else
  {
    v3 = -[AEPictureBookRenderingCacheOperation2 pageNumber](self, "pageNumber");
    if (!self->_webView)
    {
      -[AEPictureBookRenderingCacheOperation2 desiredSize](self, "desiredSize");
      width = v4;
      height = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 bookInfoSnapshot](self, "bookInfoSnapshot"));
      objc_msgSend(v8, "fixedLayoutSize");
      v10 = v9;
      v12 = v11;

      if (width / v10 < BEWebViewMinimumZoomScale)
      {
        v41.size.width = v10 * BEWebViewMinimumZoomScale;
        v41.size.height = v12 * BEWebViewMinimumZoomScale;
        v41.origin.x = 0.0;
        v41.origin.y = 0.0;
        v42 = CGRectIntegral(v41);
        width = v42.size.width;
        height = v42.size.height;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 bookInfoSnapshot](self, "bookInfoSnapshot"));
      v15 = (WKWebView *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "webViewForSnapshotting:size:", v14, width, height));
      webView = self->_webView;
      self->_webView = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
      objc_msgSend(v17, "setDelegate:", self);

    }
    v18 = objc_loadWeakRetained((id *)&self->_piggyBack);

    if (v18)
    {
      v19 = (void *)(v3 - 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 bookInfoSnapshot](self, "bookInfoSnapshot"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "spineIndexInPackage"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJS textNodeCharacterCountsScriptForSpineIndex:documentOrdinal:](BECFIUtilitiesJS, "textNodeCharacterCountsScriptForSpineIndex:documentOrdinal:", objc_msgSend(v21, "integerValue"), v19));

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 piggyBack](self, "piggyBack"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationInfoHrefsForOrdinal:", v19));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJS cfisForHrefsScript:](BECFIUtilitiesJS, "cfisForHrefsScript:", v24));

      objc_initWeak(&location, self);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView, "be_navigationHandler"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_D5434;
      v36[3] = &unk_1C1840;
      objc_copyWeak(v39, &location);
      v39[1] = v19;
      v27 = v25;
      v37 = v27;
      v28 = v22;
      v38 = v28;
      objc_msgSend(v26, "performAfterLoadCompleteOrFailure:", v36);

      objc_destroyWeak(v39);
      objc_destroyWeak(&location);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 webView](self, "webView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 url](self, "url"));
    v31 = BEURLHandleriBooksImgUrlFromiBooksURL(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v32));
    v34 = objc_msgSend(v29, "loadRequest:", v33);

  }
}

- (void)_snapshotPathForKey:(id *)a3 name:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[16];

  if (a3 && a4)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 storageKey](self, "storageKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(";")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("snap_%@"), v8));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView URL](self->_webView, "URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingPathExtension"));

    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/dump_%@_%@_%p"), *a3, v11, v14, self->_webView));
  }
  else
  {
    v12 = _AELog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Must supply pointers for folder and name", buf, 2u);
    }

    BUAssertionFailed();
  }
}

- (id)generateImage:(CGSize)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  unsigned __int8 v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  AEPictureBookRenderingCacheOperation2 *v14;
  id v15;
  _QWORD v16[5];
  _QWORD block[5];

  if ((-[AEPictureBookRenderingCacheOperation2 isCancelled](self, "isCancelled", a3.width, a3.height) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 url](self, "url"));

    if (v4)
    {
      v5 = dispatch_semaphore_create(0);
      -[AEPictureBookRenderingCacheOperation2 setDispatchSemaphore:](self, "setDispatchSemaphore:", v5);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_D5A68;
      block[3] = &unk_1BEA38;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v6 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore"));
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_D5A70;
      v16[3] = &unk_1BEA38;
      v16[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

      v7 = -[AEPictureBookRenderingCacheOperation2 isCancelled](self, "isCancelled");
      v8 = 0;
      if ((v7 & 1) == 0)
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 image](self, "image"));
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_D5A78;
      v13 = &unk_1BFDB8;
      v14 = self;
      v4 = v8;
      v15 = v4;
      os_unfair_lock_lock(&self->_extraCompletionsAccessLock);
      sub_D5A78((uint64_t)&v10);
      os_unfair_lock_unlock(&self->_extraCompletionsAccessLock);
      -[AEPictureBookRenderingCacheOperation2 setImage:](self, "setImage:", 0, v10, v11);

    }
  }
  return v4;
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  NSObject *v4;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_timeoutWaitingForFirstPaint", 0);
  if ((-[AEPictureBookRenderingCacheOperation2 isCancelled](self, "isCancelled") & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore"));
    dispatch_semaphore_signal(v4);

  }
  else
  {
    -[AEPictureBookRenderingCacheOperation2 setDidFinishRendering:](self, "setDidFinishRendering:", 1);
    if (-[AEPictureBookRenderingCacheOperation2 didFinishLoading](self, "didFinishLoading"))
      -[AEPictureBookRenderingCacheOperation2 _takeSnapshotWhenReady](self, "_takeSnapshotWhenReady");
  }
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  if ((-[AEPictureBookRenderingCacheOperation2 isCancelled](self, "isCancelled", a3, a4) & 1) != 0)
  {
    -[AEPictureBookRenderingCacheOperation2 _updateSignal](self, "_updateSignal");
  }
  else
  {
    -[AEPictureBookRenderingCacheOperation2 setDidFinishLoading:](self, "setDidFinishLoading:", 1);
    if (-[AEPictureBookRenderingCacheOperation2 didFinishRendering](self, "didFinishRendering"))
      -[AEPictureBookRenderingCacheOperation2 _takeSnapshotWhenReady](self, "_takeSnapshotWhenReady");
    else
      -[AEPictureBookRenderingCacheOperation2 performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_timeoutWaitingForFirstPaint", 0, 5.0);
  }
}

- (void)_timeoutWaitingForFirstPaint
{
  uint64_t v3;
  NSObject *v4;

  v3 = BCIMLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_11D2FC(self, v4);

  -[AEPictureBookRenderingCacheOperation2 _updateSignal](self, "_updateSignal");
}

- (void)_takeSnapshotWhenReady
{
  WKWebView *webView;
  _QWORD v3[5];

  webView = self->_webView;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D5DF0;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  -[WKWebView _doAfterNextPresentationUpdate:](webView, "_doAfterNextPresentationUpdate:", v3);
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  NSObject *v5;

  v5 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore", a3, a4, a5));
  dispatch_semaphore_signal(v5);

}

- (void)_takeSnapshot
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 storageKey](self, "storageKey"));

  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore"));
    v5 = objc_alloc_init((Class)WKSnapshotConfiguration);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 bookInfoSnapshot](self, "bookInfoSnapshot"));
    v7 = objc_msgSend(v6, "isFixedLayout");

    if (v7)
    {
      -[AEPictureBookRenderingCacheOperation2 desiredSize](self, "desiredSize");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v5, "setSnapshotWidth:", v8);

    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_D5FAC;
    v10[3] = &unk_1C1868;
    objc_copyWeak(&v12, &location);
    v9 = v4;
    v11 = v9;
    -[AEPictureBookRenderingCacheOperation2 _takeSnapshotWithConfiguration:retryOnBlank:completionHandler:](self, "_takeSnapshotWithConfiguration:retryOnBlank:completionHandler:", v5, 1, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AEPictureBookRenderingCacheOperation2 _updateSignal](self, "_updateSignal");
  }
}

- (void)_takeSnapshotWithConfiguration:(id)a3 retryOnBlank:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 webView](self, "webView"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_D6134;
  v13[3] = &unk_1C18E0;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "takeSnapshotWithConfiguration:completionHandler:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_releaseWebView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 webView](self, "webView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 webView](self, "webView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "be_navigationHandler"));
    objc_msgSend(v5, "setDelegate:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 webView](self, "webView"));
    objc_msgSend(v6, "stopLoading");

    -[AEPictureBookRenderingCacheOperation2 setWebView:](self, "setWebView:", 0);
  }
}

- (void)_updateSignal
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 piggyBack](self, "piggyBack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 textNodeCharacterCounts](self, "textNodeCharacterCounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 cfisForHrefs](self, "cfisForHrefs"));
  objc_msgSend(v3, "renderingCacheOperationCompleted:textNodeCharacterCounts:cfisForHrefs:", self, v4, v5);

  v6 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCacheOperation2 dispatchSemaphore](self, "dispatchSemaphore"));
  dispatch_semaphore_signal(v6);

}

- (void)addExtraCompletion:(id)a3
{
  os_unfair_lock_s *p_extraCompletionsAccessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D6548;
  v5[3] = &unk_1BFDB8;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_extraCompletionsAccessLock);
  sub_D6548((uint64_t)v5);
  os_unfair_lock_unlock(p_extraCompletionsAccessLock);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (AEPictureBookRenderingPiggyBack)piggyBack
{
  return (AEPictureBookRenderingPiggyBack *)objc_loadWeakRetained((id *)&self->_piggyBack);
}

- (void)setPiggyBack:(id)a3
{
  objc_storeWeak((id *)&self->_piggyBack, a3);
}

- (AEBookInfoSnapshot)bookInfoSnapshot
{
  return self->_bookInfoSnapshot;
}

- (void)setBookInfoSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_bookInfoSnapshot, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder
{
  return (AEPaginatedBookSnapshotWebViewBuilder *)objc_loadWeakRetained((id *)&self->_webViewBuilder);
}

- (void)setWebViewBuilder:(id)a3
{
  objc_storeWeak((id *)&self->_webViewBuilder, a3);
}

- (CGSize)snapshotSize
{
  double width;
  double height;
  CGSize result;

  width = self->_snapshotSize.width;
  height = self->_snapshotSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->_snapshotSize = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (OS_dispatch_semaphore)dispatchSemaphore
{
  return self->_dispatchSemaphore;
}

- (void)setDispatchSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSemaphore, a3);
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

- (unint64_t)snapshotRetryCount
{
  return self->_snapshotRetryCount;
}

- (void)setSnapshotRetryCount:(unint64_t)a3
{
  self->_snapshotRetryCount = a3;
}

- (AEPictureBookRenderingCacheOperation2)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelf, a3);
}

- (NSDictionary)textNodeCharacterCounts
{
  return self->_textNodeCharacterCounts;
}

- (void)setTextNodeCharacterCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)cfisForHrefs
{
  return self->_cfisForHrefs;
}

- (void)setCfisForHrefs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableSet)extraCompletions
{
  return self->_extraCompletions;
}

- (void)setExtraCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_extraCompletions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraCompletions, 0);
  objc_storeStrong((id *)&self->_cfisForHrefs, 0);
  objc_storeStrong((id *)&self->_textNodeCharacterCounts, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_dispatchSemaphore, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_webViewBuilder);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_bookInfoSnapshot, 0);
  objc_destroyWeak((id *)&self->_piggyBack);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
