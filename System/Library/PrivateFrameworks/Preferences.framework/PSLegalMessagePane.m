@implementation PSLegalMessagePane

- (PSLegalMessagePane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PSLegalMessagePane *v7;
  PSLegalMessagePane *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  UIWebView *webView;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  UIWebView *v18;
  void *v19;
  id v21;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PSLegalMessagePane;
  v7 = -[PSEditingPane initWithFrame:](&v23, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[PSLegalMessagePane markupString](v7, "markupString");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = &stru_1E4A69238;
    }
    else
    {
      -[PSLegalMessagePane htmlFileLocation](v8, "htmlFileLocation");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v11, 4, &v22);
      v21 = v22;
      if (v21)
      {
        v15 = v21;
        _PSLoggingFacility();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          v25 = 36;
          v26 = 2080;
          v27 = "-[PSLegalMessagePane initWithFrame:]";
          v28 = 2112;
          v29 = v15;
          _os_log_impl(&dword_1A3819000, v16, OS_LOG_TYPE_DEFAULT, "%d %s %@", buf, 0x1Cu);
        }
        goto LABEL_5;
      }
    }
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC10]), "initWithFrame:", x, y, width, height);
    webView = v8->_webView;
    v8->_webView = (UIWebView *)v12;

    -[UIWebView setAutoresizingMask:](v8->_webView, "setAutoresizingMask:", 18);
    -[UIWebView setDelegate:](v8->_webView, "setDelegate:", v8);
    -[UIWebView setDataDetectorTypes:](v8->_webView, "setDataDetectorTypes:", 0);
    -[UIWebView _setDrawsCheckeredPattern:](v8->_webView, "_setDrawsCheckeredPattern:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebView setBackgroundColor:](v8->_webView, "setBackgroundColor:", v14);

    -[PSLegalMessagePane addSubview:](v8, "addSubview:", v8->_webView);
    -[UIWebView _browserView](v8->_webView, "_browserView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTilesOpaque:", 0);
    objc_msgSend(v15, "setLoadsSynchronously:", 1);
    objc_msgSend(v15, "setDetectsPhoneNumbers:", 0);
    -[UIWebView _scrollView](v8->_webView, "_scrollView");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[NSObject _setShowsBackgroundShadow:](v16, "_setShowsBackgroundShadow:", 0);
    -[NSObject setDecelerationRate:](v16, "setDecelerationRate:", 0.998);
    v18 = v8->_webView;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebView loadHTMLString:baseURL:](v18, "loadHTMLString:baseURL:", v10, v19);

LABEL_5:
  }
  return v8;
}

- (BOOL)shouldInsetContent
{
  return 0;
}

- (BOOL)handlesDoneButton
{
  return 0;
}

- (id)markupString
{
  return 0;
}

- (id)htmlFileLocation
{
  NSLog(CFSTR("########### %s should be overridden by subclasses"), a2, "-[PSLegalMessagePane htmlFileLocation]");
  return 0;
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

- (void)webViewDidFinishLoad:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  float v7;
  void *v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  int v13;
  void *v14;
  void *v15;
  double v18;
  id v19;

  v19 = a3;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  if (v5 != v6)
  {
    v7 = v5 / v6 * 100.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='%f%%'"), floorf(v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v19, "stringByEvaluatingJavaScriptFromString:", v8);
    objc_msgSend(v19, "stringByEvaluatingJavaScriptFromString:", CFSTR("document.body.offsetHeight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;
    v13 = LODWORD(v11);

    objc_msgSend(v19, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 >= 0 && ((v13 & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E || (v13 - 1) <= 0x7FFFFE)
    {
      objc_msgSend(v14, "contentSize");
      if (v18 != v12)
      {
        objc_msgSend(v15, "contentSize");
        objc_msgSend(v15, "setContentSize:");
      }
    }

  }
}

- (void)viewDidBecomeVisible
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[UIWebView scrollView](self->_webView, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[UIWebView _browserView](self->_webView, "_browserView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  if (v6 != v5)
    objc_msgSend(v8, "setFrame:");
  -[UIWebView _scrollView](self->_webView, "_scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flashScrollIndicators");

}

- (void)dealloc
{
  objc_super v3;

  -[UIWebView setDelegate:](self->_webView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSLegalMessagePane;
  -[PSLegalMessagePane dealloc](&v3, sel_dealloc);
}

- (id)scrollViewToBeInsetted
{
  return -[UIWebView scrollView](self->_webView, "scrollView");
}

- (void)layoutInsetContent:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIWebView *webView;
  double v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  webView = self->_webView;
  v8 = PSTableViewSideInset();
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  v10 = CGRectInset(v9, v8, 0.0);
  -[UIWebView setFrame:](webView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
