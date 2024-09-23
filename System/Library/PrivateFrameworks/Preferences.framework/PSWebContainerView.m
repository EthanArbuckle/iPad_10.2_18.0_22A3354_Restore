@implementation PSWebContainerView

- (PSWebContainerView)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  PSWebContainerView *v6;
  uint64_t v7;
  UIWebView *webView;
  UIWebView *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PSWebContainerView;
  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v6 = -[PSWebContainerView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v3, v4, v5);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC10]), "initWithFrame:", v2, v3, v4, v5);
    webView = v6->_webView;
    v6->_webView = (UIWebView *)v7;

    -[UIWebView setDelegate:](v6->_webView, "setDelegate:", v6);
    v9 = v6->_webView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIWebView setOpaque:](v6->_webView, "setOpaque:", 0);
    -[UIWebView _browserView](v6->_webView, "_browserView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizes:", 0);
    LODWORD(v12) = 1.0;
    objc_msgSend(v11, "setInitialScale:forDocumentTypes:", 0xFFFFFFLL, v12);
    LODWORD(v13) = 1.0;
    objc_msgSend(v11, "setMinimumScale:forDocumentTypes:", 0xFFFFFFLL, v13);
    LODWORD(v14) = 1.0;
    objc_msgSend(v11, "setMaximumScale:forDocumentTypes:", 0xFFFFFFLL, v14);
    objc_msgSend(v11, "setLoadsSynchronously:", 1);
    objc_msgSend(v11, "setDoubleTapEnabled:", 0);
    objc_msgSend(v11, "resetSelectionAssistant");
    -[PSWebContainerView setUserStyleSheet:](v6, "setUserStyleSheet:", &stru_1E4A69238);
    -[UIWebView setDataDetectorTypes:](v6->_webView, "setDataDetectorTypes:", 0);
    -[UIWebView _scrollView](v6->_webView, "_scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setShowsBackgroundShadow:", 0);

    -[UIWebView _scrollView](v6->_webView, "_scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBounces:", 0);

    -[UIWebView _scrollView](v6->_webView, "_scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", 0);

    -[PSWebContainerView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[PSWebContainerView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[PSWebContainerView addSubview:](v6, "addSubview:", v6->_webView);

  }
  return v6;
}

- (void)setUserStyleSheet:(id)a3
{
  UIWebView *webView;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  webView = self->_webView;
  v4 = a3;
  -[UIWebView _browserView](webView, "_browserView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markupDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tableCellBlueTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("body { %@; } a { text-decoration:none; color:%@; }"), v7, v9);

  objc_msgSend(v10, "appendString:", v4);
  objc_msgSend(v11, "setUserStyleSheet:", v10);

}

- (void)setContent:(id)a3
{
  NSData **p_content;
  void *v6;
  uint64_t v7;
  UIWebView *webView;
  void *v9;
  NSData *v10;

  p_content = &self->_content;
  v10 = (NSData *)a3;
  if (*p_content != v10)
  {
    objc_storeStrong((id *)&self->_content, a3);
    if (*p_content)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *p_content, 4);
      v7 = -[PSWebContainerView semanticContentAttribute](self, "semanticContentAttribute");
      webView = self->_webView;
      if (v7 == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<div dir='rtl'>%@<div>"), v6, v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v9, 0);

      }
      else
      {
        -[UIWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v6, 0);
      }

    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  -[PSWebContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIWebView setFrame:](self->_webView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[UIWebView _browserView](self->_webView, "_browserView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v4, v6);
  objc_msgSend(v20, "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v20, "setFrame:");
  -[UIWebView _browserView](self->_webView, "_browserView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mainFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceLayoutAdjustingViewSize:", 1);

  objc_msgSend(v20, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mainFrame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frameView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "documentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;

  objc_msgSend(v20, "setFrame:", v8, v10, v4, v19);
}

- (double)heightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;

  -[UIWebView _browserView](self->_webView, "_browserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, a3, 0.0);
  objc_msgSend(v4, "webView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mainFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "forceLayoutAdjustingViewSize:", 1);

  objc_msgSend(v4, "webView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mainFrame");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frameView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "documentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);
  return v20;
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (!a5)
  {
    v6 = (void *)MEMORY[0x1E0CEA2F8];
    v7 = a4;
    objc_msgSend(v6, "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "openURL:options:completionHandler:", v9, MEMORY[0x1E0C9AA70], 0);
  }
  return a5 != 0;
}

- (BOOL)uiWebView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  return 0;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
