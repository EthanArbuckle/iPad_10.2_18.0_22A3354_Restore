@implementation RUIWebContainerView

- (RUIWebContainerView)initWithContent:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  RUIWebContainerView *v12;
  RUIWebContainerView *v13;
  uint64_t v14;
  UIWebView *webView;
  UIWebView *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)RUIWebContainerView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[RUIWebContainerView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseURL, a4);
    +[RUIPlatform assertWebkitAllowed](RUIPlatform, "assertWebkitAllowed");
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB50]), "initWithFrame:", v8, v9, v10, v11);
    webView = v13->_webView;
    v13->_webView = (UIWebView *)v14;

    v16 = v13->_webView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIWebView setOpaque:](v13->_webView, "setOpaque:", 0);
    -[UIWebView setDelegate:](v13->_webView, "setDelegate:", v13);
    WebThreadLock();
    -[UIWebView _browserView](v13->_webView, "_browserView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizes:", 0);
    LODWORD(v19) = 1.0;
    objc_msgSend(v18, "setInitialScale:forDocumentTypes:", 0xFFFFFFLL, v19);
    LODWORD(v20) = 1.0;
    objc_msgSend(v18, "setMinimumScale:forDocumentTypes:", 0xFFFFFFLL, v20);
    LODWORD(v21) = 1.0;
    objc_msgSend(v18, "setMaximumScale:forDocumentTypes:", 0xFFFFFFLL, v21);
    objc_msgSend(v18, "setLoadsSynchronously:", 1);
    objc_msgSend(v18, "setDoubleTapEnabled:", 0);
    objc_msgSend(v18, "resetSelectionAssistant");
    objc_msgSend(v18, "setAllowsImageSheet:", 0);
    objc_msgSend(v18, "setAllowsLinkSheet:", 0);
    objc_msgSend(v18, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setUseSystemAppearance:", 1);

    -[RUIWebContainerView setUserStyleSheet:](v13, "setUserStyleSheet:", &stru_24C29B280);
    -[UIWebView loadData:MIMEType:textEncodingName:baseURL:](v13->_webView, "loadData:MIMEType:textEncodingName:baseURL:", v6, CFSTR("text/html"), CFSTR("utf-8"), v7);
    objc_msgSend(v18, "resetSelectionAssistant");
    -[UIWebView setDataDetectorTypes:](v13->_webView, "setDataDetectorTypes:", 0);
    -[UIWebView _scrollView](v13->_webView, "_scrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setShowsBackgroundShadow:", 0);

    -[UIWebView _scrollView](v13->_webView, "_scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounces:", 0);

    -[UIWebView _scrollView](v13->_webView, "_scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setScrollEnabled:", 0);

    -[RUIWebContainerView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
    -[RUIWebContainerView addSubview:](v13, "addSubview:", v13->_webView);

  }
  return v13;
}

- (void)updateContent:(id)a3
{
  -[RUIWebContainerView updateContent:baseURL:](self, "updateContent:baseURL:", a3, self->_baseURL);
}

- (void)updateContent:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_baseURL, a4);
  v7 = a4;
  v8 = a3;
  -[UIWebView loadData:MIMEType:textEncodingName:baseURL:](self->_webView, "loadData:MIMEType:textEncodingName:baseURL:", v8, CFSTR("text/html"), CFSTR("utf-8"), v7);

  -[RUIWebContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[RUIWebContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUserStyleSheet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  WebThreadLock();
  -[UIWebView _browserView](self->_webView, "_browserView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markupDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("body { margin:0; padding:0; %@; word-break: break-word; } a { text-decoration:none; color: %@; }"),
                  v7,
                  v9);

  objc_msgSend(v10, "appendString:", v4);
  objc_msgSend(v11, "setUserStyleSheet:", v10);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  -[RUIWebContainerView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = v3;
  if (v6 != self->_size.width || v3 != self->_size.height)
    -[RUIWebContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  self->_size.width = v7;
  self->_size.height = v8;
  -[UIWebView setFrame:](self->_webView, "setFrame:", v5, 0.0, v7, v8);
  WebThreadLock();
  -[UIWebView _browserView](self->_webView, "_browserView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v7, v8);
  objc_msgSend(v23, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v23, "setFrame:");
  -[UIWebView _browserView](self->_webView, "_browserView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "webView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mainFrame");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "forceLayoutAdjustingViewSize:", 1);

  objc_msgSend(v23, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mainFrame");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frameView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "documentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;

  objc_msgSend(v23, "setFrame:", v11, v13, v7, v22);
}

- (void)_setHighlightedNow
{
  _BOOL4 highlighted;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  highlighted = self->_highlighted;
  if (self->_reallyHighlighted != highlighted)
  {
    self->_reallyHighlighted = highlighted;
    WebThreadLock();
    -[UIWebView _browserView](self->_webView, "_browserView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "windowScriptObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reallyHighlighted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "callWebScriptMethod:withArguments:", CFSTR("setHighlighted"), v8);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
    {
      -[RUIWebContainerView _setHighlightedNow](self, "_setHighlightedNow");
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_unhighlight, 0);
    }
    else
    {
      -[RUIWebContainerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__setHighlightedNow, 0, 0.0);
    }
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (double)heightForWidth:(double)a3
{
  double v3;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;

  v3 = 0.0;
  if (a3 != 0.0)
  {
    WebThreadLock();
    -[UIWebView _browserView](self->_webView, "_browserView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "setFrame:", 0.0, 0.0, a3, 0.0);
    objc_msgSend(v6, "webView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mainFrame");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "forceLayoutAdjustingViewSize:", 1);

    objc_msgSend(v6, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mainFrame");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frameView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "documentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v3 = v21;

    objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
    objc_msgSend(v6, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mainFrame");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "forceLayoutAdjustingViewSize:", 1);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = *MEMORY[0x24BEBE9C8];
  -[RUIWebContainerView bounds](self, "bounds");
  -[RUIWebContainerView heightForWidth:](self, "heightForWidth:", v4);
  v6 = v5;
  v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)_jsBridgeURLWithPath:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("remoteui"));
  objc_msgSend(v5, "setPath:", v4);

  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_addContentChangeObservingScript
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[RUIWebContainerView _jsBridgeURLWithPath:](self, "_jsBridgeURLWithPath:", CFSTR("/contentDidChange"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("         (function(){             function loadURLInFrame(src){                 var rootElement = document.documentElement;                 var frame = document.createElement('IFRAME');                 frame.style.width = 0;                 frame.style.height = 0;                 frame.setAttribute('src', src);                 rootElement.appendChild(frame);                 frame.parentNode.removeChild(frame);             }                         var mutationObserver = new MutationObserver(function() {                 loadURLInFrame('%@');             });                         var elementToObserve = document.body;             mutationObserver.observe(elementToObserve, {subtree: true, childList: true});         })();     "),
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UIWebView stringByEvaluatingJavaScriptFromString:](self->_webView, "stringByEvaluatingJavaScriptFromString:", v5);
}

- (void)webViewDidFinishLoad:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "stringByEvaluatingJavaScriptFromString:", CFSTR("document.getElementsByTagName('html')[0].getAttribute('dir')"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    v5 = (id)objc_msgSend(v6, "stringByEvaluatingJavaScriptFromString:", CFSTR("document.getElementsByTagName('html')[0].setAttribute('dir', 'auto')"));
  -[RUIWebContainerView _addContentChangeObservingScript](self, "_addContentChangeObservingScript");

}

- (BOOL)_handleJavascriptBridgeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id WeakRetained;
  char v15;
  id v16;
  BOOL v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("remoteui"));

  if (!v7)
    goto LABEL_14;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "handling webview javascript bridge request with url: %@", (uint8_t *)&v19, 0xCu);

    }
  }
  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/contentDidChange"));

  if (v12)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "webview content did change, notifying delegate", (uint8_t *)&v19, 2u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "webContainerViewContentDidChange:", self);

    }
    v17 = 1;
  }
  else
  {
LABEL_14:
    v17 = 0;
  }

  return v17;
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  BOOL v10;

  v7 = a4;
  if (!-[RUIWebContainerView _handleJavascriptBridgeRequest:](self, "_handleJavascriptBridgeRequest:", v7))
  {
    if (a5 == 5)
    {
      v10 = 1;
      goto LABEL_6;
    }
    if (!a5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "webContainerView:didClickLinkWithURL:", self, v9);

    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  return 0;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (RUIWebContainerViewDelegate)delegate
{
  return (RUIWebContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
