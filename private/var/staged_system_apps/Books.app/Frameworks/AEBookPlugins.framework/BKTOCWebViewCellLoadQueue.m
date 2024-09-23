@implementation BKTOCWebViewCellLoadQueue

- (BKTOCWebViewCellLoadQueue)init
{
  BKTOCWebViewCellLoadQueue *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *requests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewCellLoadQueue;
  v2 = -[BKTOCWebViewCellLoadQueue init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    requests = v2->_requests;
    v2->_requests = v3;

  }
  return v2;
}

- (NSArray)queue
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_requests, "array");
}

- (void)enqueueRequest:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_requests, "addObject:", a3);
  -[BKTOCWebViewCellLoadQueue _sendNextRequest](self, "_sendNextRequest");
}

- (id)dequeueRequest
{
  void *v3;

  if (-[NSMutableOrderedSet count](self->_requests, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](self->_requests, "lastObject"));
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", (char *)-[NSMutableOrderedSet count](self->_requests, "count") - 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isEmpty
{
  return -[NSMutableOrderedSet count](self->_requests, "count") == 0;
}

- (void)setWebView:(id)a3
{
  WKWebView **p_webView;
  id v5;
  id v6;

  p_webView = &self->_webView;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_webView, v6);
  objc_msgSend(v6, "setNavigationDelegate:", self);

  -[BKTOCWebViewCellLoadQueue _sendNextRequest](self, "_sendNextRequest");
}

- (void)setFrameAndPositionWebView:(CGRect)a3
{
  double height;
  double width;
  double y;
  CGFloat v7;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v7 = -CGRectGetWidth(a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "setFrame:", v7, y, width, height);

}

- (void)setDefaultFrameAndPositionWebView
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[BKTOCWebViewCellLoadQueue setFrameAndPositionWebView:](self, "setFrameAndPositionWebView:", v5, v7, v9, 54.0);
}

- (void)_sendNextRequest
{
  WKWebView **p_webView;
  id WeakRetained;
  void *v5;
  unsigned __int8 v6;
  BKTOCWebViewCellLoadRequest *v7;
  BKTOCWebViewCellLoadRequest *currentRequest;
  BKTOCWebViewCellLoadRequest *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  if (!self->_currentRequest)
  {
    p_webView = &self->_webView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = -[BKTOCWebViewCellLoadQueue isEmpty](self, "isEmpty");

      if ((v6 & 1) == 0)
      {
        v7 = (BKTOCWebViewCellLoadRequest *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadQueue dequeueRequest](self, "dequeueRequest"));
        currentRequest = self->_currentRequest;
        self->_currentRequest = v7;

        v9 = self->_currentRequest;
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest htmlContentString](v9, "htmlContentString"));
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest baseURL](self->_currentRequest, "baseURL"));
          v12 = objc_loadWeakRetained((id *)p_webView);
          v13 = objc_msgSend(v12, "loadData:MIMEType:characterEncodingName:baseURL:", v15, BEXBEHTMLContentType, BEUTF8StringEncodingName, v11);

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest requester](self->_currentRequest, "requester"));
          objc_msgSend(v14, "contentBeganLoadingForRequest:", self->_currentRequest);

        }
      }
    }
  }
}

- (void)_measureContentAndSetFrame
{
  void ***v3;
  id WeakRetained;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_2CD18;
  v8 = &unk_1BF510;
  objc_copyWeak(&v9, &location);
  v3 = objc_retainBlock(&v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "evaluateJavaScript:completionHandler:", CFSTR("let container = document.getElementById('content_container');if (!container) {    container = document.body;}const rect = container.getBoundingClientRect();JSON.stringify({width: rect.width, height: rect.height});"),
    v3,
    v5,
    v6,
    v7,
    v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_snapshotCurrentContent
{
  void ***v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_2D1F8;
  v8 = &unk_1BF538;
  objc_copyWeak(&v9, &location);
  v3 = objc_retainBlock(&v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadQueue webView](self, "webView", v5, v6, v7, v8));
  objc_msgSend(v4, "be_takeSnapshotWithDefaultConfigurationCompletion:", v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyRequesterAndSendNextRequestOfPreferredHeight:(double)a3 error:(id)a4
{
  BKTOCWebViewCellLoadRequest *currentRequest;
  id v7;
  void *v8;
  BKTOCWebViewCellLoadRequest *v9;

  currentRequest = self->_currentRequest;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest requester](currentRequest, "requester"));
  objc_msgSend(v8, "contentFinishedLoadingForRequest:preferredHeight:error:", self->_currentRequest, v7, a3);

  v9 = self->_currentRequest;
  self->_currentRequest = 0;

  -[BKTOCWebViewCellLoadQueue _sendNextRequest](self, "_sendNextRequest");
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  -[BKTOCWebViewCellLoadQueue setDefaultFrameAndPositionWebView](self, "setDefaultFrameAndPositionWebView", a3, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[BKTOCWebViewCellLoadQueue _notifyRequesterAndSendNextRequestOfPreferredHeight:error:](self, "_notifyRequesterAndSendNextRequestOfPreferredHeight:error:", a5, a4, 0.0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[BKTOCWebViewCellLoadQueue _measureContentAndSetFrame](self, "_measureContentAndSetFrame", a3, a4);
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (BKTOCImageCache2)imageCache
{
  return (BKTOCImageCache2 *)objc_loadWeakRetained((id *)&self->_imageCache);
}

- (void)setImageCache:(id)a3
{
  objc_storeWeak((id *)&self->_imageCache, a3);
}

- (NSMutableOrderedSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (BKTOCWebViewCellLoadRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_imageCache);
  objc_destroyWeak((id *)&self->_webView);
}

@end
