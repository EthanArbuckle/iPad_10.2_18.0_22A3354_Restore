@implementation WBSScribbleStyleSheet

- (WBSScribbleStyleSheet)initWithSource:(id)a3 webView:(id)a4 host:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WBSScribbleStyleSheet *v18;
  WBSScribbleStyleSheet *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("http://%@/*"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/*"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEF5E0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("safari-scribble-%@"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "worldWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)WBSScribbleStyleSheet;
  v18 = -[_WKUserStyleSheet initWithSource:forWKWebView:forMainFrameOnly:includeMatchPatternStrings:excludeMatchPatternStrings:baseURL:level:contentWorld:](&v21, sel_initWithSource_forWKWebView_forMainFrameOnly_includeMatchPatternStrings_excludeMatchPatternStrings_baseURL_level_contentWorld_, v11, v8, 1, v14, 0, 0, 0, v17);

  if (v18)
  {
    objc_storeWeak((id *)&v18->_webView, v8);
    v19 = v18;
  }

  return v18;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
}

@end
