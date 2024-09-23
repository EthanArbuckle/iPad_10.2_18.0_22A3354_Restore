@implementation RUIHTMLHeaderView

- (RUIHTMLHeaderView)initWithAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RUIHTMLHeaderView;
  return -[RUIHTMLHeaderView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
{
  RUIWebContainerView *webContainerView;
  RUIWebContainerView *v6;
  void *v7;
  void *v8;
  RUIWebContainerView *v9;
  RUIWebContainerView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[RUIWebContainerView removeFromSuperview](self->_webContainerView, "removeFromSuperview");
  webContainerView = self->_webContainerView;
  self->_webContainerView = 0;

  if (v14)
  {
    v6 = [RUIWebContainerView alloc];
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHTMLHeaderView baseURL](self, "baseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RUIWebContainerView initWithContent:baseURL:](v6, "initWithContent:baseURL:", v7, v8);
    v10 = self->_webContainerView;
    self->_webContainerView = v9;

    -[RUIWebContainerView setDelegate:](self->_webContainerView, "setDelegate:", self);
    v11 = (void *)MEMORY[0x24BDD17C8];
    RemoteUIHeaderCSSTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("body { color: %@; font: -apple-system-footnote; line-height: 1.2em; } html { -webkit-text-size-adjust: none; }"),
      v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIWebContainerView setUserStyleSheet:](self->_webContainerView, "setUserStyleSheet:", v13);
    -[RUIHTMLHeaderView addSubview:](self, "addSubview:", self->_webContainerView);

  }
}

- (void)setFooterStyleText:(id)a3 attributes:(id)a4
{
  id v6;
  RUIWebContainerView *webContainerView;
  void *v8;
  RUIWebContainerView *v9;
  void *v10;
  void *v11;
  RUIWebContainerView *v12;
  RUIWebContainerView *v13;
  RUIWebContainerView *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v18)
  {
    webContainerView = self->_webContainerView;
    if (webContainerView)
    {
      objc_msgSend(v18, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIWebContainerView updateContent:](webContainerView, "updateContent:", v8);

    }
    else
    {
      v9 = [RUIWebContainerView alloc];
      objc_msgSend(v18, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIHTMLHeaderView baseURL](self, "baseURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[RUIWebContainerView initWithContent:baseURL:](v9, "initWithContent:baseURL:", v10, v11);
      v13 = self->_webContainerView;
      self->_webContainerView = v12;

      -[RUIWebContainerView setDelegate:](self->_webContainerView, "setDelegate:", self);
      v14 = self->_webContainerView;
      v15 = (void *)MEMORY[0x24BDD17C8];
      RemoteUIFooterCSSTextColor();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("body { color: %@; font: -apple-system-footnote; } html { -webkit-text-size-adjust: none; }"),
        v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIWebContainerView setUserStyleSheet:](v14, "setUserStyleSheet:", v17);

      -[RUIHTMLHeaderView addSubview:](self, "addSubview:", self->_webContainerView);
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[RUIHTMLHeaderView headerHeightForWidth:inView:](self, "headerHeightForWidth:inView:", 0, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  RUIWebContainerView *webContainerView;
  double v6;
  double v7;
  double v8;

  webContainerView = self->_webContainerView;
  -[RUIHTMLHeaderView webViewWidthForWidth:](self, "webViewWidthForWidth:", a4, a3);
  -[RUIWebContainerView heightForWidth:](webContainerView, "heightForWidth:");
  v7 = v6;
  -[RUIHTMLHeaderView _topPadding](self, "_topPadding");
  return v7 + v8 + 6.0;
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3)
  {
    self->_isFirstSection = a3;
    -[RUIHTMLHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RUIHTMLHeaderView;
  -[RUIHTMLHeaderView layoutSubviews](&v8, sel_layoutSubviews);
  -[RUIWebContainerView frame](self->_webContainerView, "frame");
  -[RUIHTMLHeaderView webViewWidth](self, "webViewWidth");
  v4 = v3;
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:");
  v6 = v5;
  -[RUIHTMLHeaderView _topPadding](self, "_topPadding");
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", 10.0, v7, v4, v6);
}

- (double)_topPadding
{
  double result;

  result = 22.0;
  if (!self->_isFirstSection)
    return 16.0;
  return result;
}

- (id)quoteEncodedStringWithString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD1608];
    v12[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("[] "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setHTMLContent:(id)a3 toElementsMatchingQuery:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  -[RUIHTMLHeaderView quoteEncodedStringWithString:](self, "quoteEncodedStringWithString:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[RUIHTMLHeaderView quoteEncodedStringWithString:](self, "quoteEncodedStringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(function(){ document.querySelectorAll(%@).forEach(function(element) {element.innerHTML = %@}); })()"),
    v7,
    v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIWebContainerView webView](self->_webContainerView, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "stringByEvaluatingJavaScriptFromString:", v8);

  -[RUIHTMLHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (double)webViewWidthForWidth:(double)a3
{
  return a3 + -20.0;
}

- (double)webViewWidth
{
  double v3;
  double result;

  -[RUIHTMLHeaderView bounds](self, "bounds");
  -[RUIHTMLHeaderView webViewWidthForWidth:](self, "webViewWidthForWidth:", v3);
  return result;
}

- (void)webContainerViewContentDidChange:(id)a3
{
  RUIHeaderDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "headerViewDidChange:", self);

  }
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  RUIHeaderDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "headerView:activatedLinkWithURL:", self, v6);

}

- (RUIHeaderDelegate)delegate
{
  return (RUIHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webContainerView, 0);
}

@end
