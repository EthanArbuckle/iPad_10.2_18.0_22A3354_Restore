@implementation RUIWebView

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (id)webView
{
  WKWebView *webView;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  WKWebView *v12;
  WKWebView *v13;
  void *v14;
  NSString *html;
  id v16;

  webView = self->_webView;
  if (!webView)
  {
    v4 = (void *)objc_opt_new();
    -[RUIWebView scriptForDisableMagnification](self, "scriptForDisableMagnification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUserScript:", v5);

    v6 = objc_alloc(MEMORY[0x24BDFA9B8]);
    -[RUIWebView userStyleSheet](self, "userStyleSheet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithSource:forMainFrameOnly:", v7, 0);

    objc_msgSend(v4, "_addUserStyleSheet:", v8);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setUserContentController:", v4);
    objc_msgSend(v9, "setDataDetectorTypes:", 0);
    objc_msgSend(v9, "setAllowsInlineMediaPlayback:", 1);
    objc_msgSend(v9, "setMediaTypesRequiringUserActionForPlayback:", 1);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "_setTextAutosizingEnabled:", 0);
    objc_msgSend(v9, "setPreferences:", v10);
    +[RUIPlatform assertWebkitAllowed](RUIPlatform, "assertWebkitAllowed");
    v11 = objc_alloc(MEMORY[0x24BDFA918]);
    v12 = (WKWebView *)objc_msgSend(v11, "initWithFrame:configuration:", v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v13 = self->_webView;
    self->_webView = v12;

    -[WKWebView setOpaque:](self->_webView, "setOpaque:", 0);
    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    -[WKWebView scrollView](self->_webView, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setShowsBackgroundShadow:", 0);

    html = self->_html;
    if (html)
      v16 = -[WKWebView loadHTMLString:baseURL:](self->_webView, "loadHTMLString:baseURL:", html, self->_baseURL);

    webView = self->_webView;
  }
  return webView;
}

- (BOOL)_isScrollEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("scrollEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setHtml:(id)a3
{
  NSString *v4;
  NSString *html;
  NSURL *baseURL;
  NSURL *v7;
  NSURL *v8;
  id v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", self->_html) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v10, "copy");
    html = self->_html;
    self->_html = v4;

    baseURL = self->_baseURL;
    if (!baseURL)
    {
      +[RUIHTTPRequest safeBaseURL](RUIHTTPRequest, "safeBaseURL");
      v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v8 = self->_baseURL;
      self->_baseURL = v7;

      baseURL = self->_baseURL;
    }
    v9 = -[WKWebView loadHTMLString:baseURL:](self->_webView, "loadHTMLString:baseURL:", v10, baseURL);
  }

}

- (id)sourceURL
{
  return self->_baseURL;
}

- (id)scriptForDisableMagnification
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("var meta = document.createElement('meta');     meta.name = 'viewport';     meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';     var head = document.getElementsByTagName('head')[0];    head.appendChild(meta);"),
                                           1,
                                           0));
}

- (id)userStyleSheet
{
  return CFSTR(":root {color-scheme: light dark;} body {word-break: break-word; font-family: -apple-system-font;} .label, .description { color: -apple-system-label; font-family: -apple-system-font; } .label-bold { color: -apple-system-label; font-family: -apple-system-font; font-weight: 600; }");
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id *p_delegate;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD);

  p_delegate = &self->_delegate;
  v12 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "navigationType");

  LODWORD(v8) = objc_msgSend(WeakRetained, "webViewOM:shouldStartLoadWithRequest:navigationType:", self, v10, v11);
  v12[2](v12, v8);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", RUIWebViewDidFinishLoadNotification, 0);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", RUIWebViewDidFinishLoadNotification, 0);

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", RUIWebViewDidFinishLoadNotification, 0);

}

- (void)dealloc
{
  objc_super v3;

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RUIWebView;
  -[RUIElement dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (NSString)html
{
  return self->_html;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
