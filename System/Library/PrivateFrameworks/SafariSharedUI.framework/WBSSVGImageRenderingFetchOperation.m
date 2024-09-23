@implementation WBSSVGImageRenderingFetchOperation

- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3
{

  return 0;
}

- (WBSSVGImageRenderingFetchOperation)initWithRequest:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v7;
  id v8;
  WBSSVGImageRenderingFetchOperation *v9;
  uint64_t v10;
  id completionHandler;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSSVGImageRenderingFetchOperation *v17;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  v8 = a4;
  v9 = -[WBSSiteMetadataFetchOperation initWithRequest:](&v19, sel_initWithRequest_, v7);
  if (v9)
  {
    v10 = MEMORY[0x1A85D45E4](v8);

    completionHandler = v9->_completionHandler;
    v9->_completionHandler = (id)v10;

    objc_msgSend(v7, "svgContent", v19.receiver, v19.super_class);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v7, "urls");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = v14;
      if (!v14)
      {
        v16 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v7, "url");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayWithObject:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v9->_remainingURLs, v15);
      if (!v14)
      {

      }
    }
    v17 = v9;
  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

  }
  return v9;
}

- (id)_htmlStringWithURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<img class=\"image\" src=\"%@\" onerror=\"this.error = true\">"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSVGImageRenderingFetchOperation _htmlStringWithImageElementString:](self, "_htmlStringWithImageElementString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_htmlStringWithSVGContent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<div class=\"image\">%@</div>"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSVGImageRenderingFetchOperation _htmlStringWithImageElementString:](self, "_htmlStringWithImageElementString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_htmlStringWithImageElementString:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WBSSiteMetadataFetchOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<style>body { margin: 0 } .image { width: %zdpx;height: %zdpx;}</style>"),
    (uint64_t)v6,
    (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<html><head>%@%@</head><body>%@</body></html>"), CFSTR("<script>window.didEncounterRenderingError = function() {    let elem = document.querySelector(\".image\");    return !elem || elem.error;}</script>"),
    v8,
    v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_loadSVGFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke;
  block[3] = &unk_1E5446110;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:usedEncoding:error:", *(_QWORD *)(a1 + 32), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke_2;
  v4[3] = &unk_1E5442448;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v6);
}

void __54__WBSSVGImageRenderingFetchOperation__loadSVGFileURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "webView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_htmlStringWithSVGContent:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v3, "loadHTMLString:baseURL:", v4, 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "_didRenderImage:", 0);
    }
    WeakRetained = v6;
  }

}

- (void)_renderNextImage
{
  NSTimer *v3;
  NSTimer *loadingTimeoutTimer;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (!self->_remainingURLs)
  {
    -[WBSWebViewMetadataFetchOperation webView](self, "webView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WBSSiteMetadataFetchOperation request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "svgContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSVGImageRenderingFetchOperation _htmlStringWithSVGContent:](self, "_htmlStringWithSVGContent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v11, "loadHTMLString:baseURL:", v9, 0);

    goto LABEL_5;
  }
  -[NSTimer invalidate](self->_loadingTimeoutTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__loadingTimerDidTimeout_, 0, 0, 30.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v3;

  -[NSMutableArray firstObject](self->_remainingURLs, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_remainingURLs, "removeObjectAtIndex:", 0);
  if (objc_msgSend(v11, "safari_isHTTPFamilyURL"))
  {
    -[WBSWebViewMetadataFetchOperation webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSVGImageRenderingFetchOperation _htmlStringWithURL:](self, "_htmlStringWithURL:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "loadHTMLString:baseURL:", v6, v11);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "isFileURL"))
    -[WBSSVGImageRenderingFetchOperation _loadSVGFileURL:](self, "_loadSVGFileURL:", v11);
  else
    -[WBSSVGImageRenderingFetchOperation _didRenderImage:](self, "_didRenderImage:", 0);
LABEL_6:

}

- (void)_takeSnapshotAndFinish
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0CEF600]);
  -[WBSSVGImageRenderingFetchOperation webViewSize](self, "webViewSize");
  objc_msgSend(v3, "setRect:", 0.0, 0.0, v4, v5);
  objc_msgSend(v3, "setSnapshotWidth:", &unk_1E547A098);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setUsesTransparentBackground:", 1);
  objc_initWeak(&location, self);
  -[WBSWebViewMetadataFetchOperation webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke;
  v8[3] = &unk_1E5446800;
  objc_copyWeak(&v10, &location);
  v7 = v3;
  v9 = v7;
  objc_msgSend(v6, "evaluateJavaScript:completionHandler:", CFSTR("window.didEncounterRenderingError()"), v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_2(v8, v6);
      objc_msgSend(WeakRetained, "didFailFetchWithError:", v6);
    }
    else
    {
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11 && objc_msgSend(v11, "safari_isNSBoolean") && !objc_msgSend(v11, "BOOLValue"))
      {
        objc_msgSend(WeakRetained, "webView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 32);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_21;
        v16[3] = &unk_1E54467D8;
        objc_copyWeak(&v17, (id *)(a1 + 40));
        objc_msgSend(v14, "takeSnapshotWithConfiguration:completionHandler:", v15, v16);

        objc_destroyWeak(&v17);
      }
      else
      {
        v12 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_1((uint64_t)v9, v12, v13);
        objc_msgSend(WeakRetained, "didFailFetchWithError:", 0);
      }

    }
  }

}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_21_cold_1(v9, v6);
      objc_msgSend(v8, "didFailFetchWithError:", v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "_didRenderImage:", v5);
    }
  }

}

- (void)_didCompleteWithImage:(id)a3
{
  NSTimer *loadingTimeoutTimer;
  id v5;
  void (**completionHandler)(id, void *);
  WBSSVGImageRenderingResponse *v7;
  void *v8;
  void *v9;
  WBSSVGImageRenderingResponse *v10;

  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  v5 = a3;
  -[NSTimer invalidate](loadingTimeoutTimer, "invalidate");
  completionHandler = (void (**)(id, void *))self->_completionHandler;
  v7 = [WBSSVGImageRenderingResponse alloc];
  -[WBSSiteMetadataFetchOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSSVGImageRenderingResponse initWithURL:image:](v7, "initWithURL:image:", v9, v5);

  completionHandler[2](completionHandler, v10);
  -[WBSWebViewMetadataFetchOperation clearWebView](self, "clearWebView");
  -[WBSSiteMetadataFetchOperation _setStatus:](self, "_setStatus:", 2);
}

- (void)_loadingTimerDidTimeout:(id)a3
{
  NSTimer *loadingTimeoutTimer;
  void *v5;

  if (self->_loadingTimeoutTimer == a3)
  {
    if (objc_msgSend(a3, "isValid"))
    {
      loadingTimeoutTimer = self->_loadingTimeoutTimer;
      self->_loadingTimeoutTimer = 0;

      -[WBSWebViewMetadataFetchOperation webView](self, "webView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopLoading");

      -[WBSSVGImageRenderingFetchOperation _didRenderImage:](self, "_didRenderImage:", 0);
    }
  }
}

- (void)_didRenderImage:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4 || (v5 = -[NSMutableArray count](self->_remainingURLs, "count"), v4 = 0, !v5))
    -[WBSSVGImageRenderingFetchOperation _didCompleteWithImage:](self, "_didCompleteWithImage:", v4);
  else
    -[WBSSVGImageRenderingFetchOperation _renderNextImage](self, "_renderNextImage");

}

- (id)webViewConfiguration
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  -[WBSWebViewMetadataFetchOperation webViewConfiguration](&v4, sel_webViewConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAllowsJavaScriptMarkup:", 1);
  objc_msgSend(v2, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  return v2;
}

- (CGSize)webViewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[WBSSiteMetadataFetchOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)willClearWebView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  -[WBSWebViewMetadataFetchOperation willClearWebView](&v2, sel_willClearWebView);
}

- (void)didFailFetchWithError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  -[WBSWebViewMetadataFetchOperation didFailFetchWithError:](&v4, sel_didFailFetchWithError_, a3);
  -[WBSSVGImageRenderingFetchOperation _didCompleteWithImage:](self, "_didCompleteWithImage:", 0);
}

- (void)didFinishNavigation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSSVGImageRenderingFetchOperation;
  -[WBSWebViewMetadataFetchOperation didFinishNavigation](&v3, sel_didFinishNavigation);
  -[WBSSVGImageRenderingFetchOperation _takeSnapshotAndFinish](self, "_takeSnapshotAndFinish");
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_remainingURLs, 0);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a2, a3, "SVG rendering failed with unexpected result: %{public}@", (uint8_t *)&v3);
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, v3, v5, "Check for successful SVG rendering failed with error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_1();
}

void __60__WBSSVGImageRenderingFetchOperation__takeSnapshotAndFinish__block_invoke_21_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, v3, v5, "Snapshotting SVG content failed with error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_1();
}

@end
