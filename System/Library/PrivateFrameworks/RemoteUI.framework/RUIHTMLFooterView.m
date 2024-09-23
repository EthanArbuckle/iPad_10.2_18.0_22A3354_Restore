@implementation RUIHTMLFooterView

- (RUIHTMLFooterView)initWithAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RUIHTMLFooterView;
  return -[RUIHTMLFooterView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
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
      -[RUIHTMLFooterView baseURL](self, "baseURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[RUIWebContainerView initWithContent:baseURL:](v9, "initWithContent:baseURL:", v10, v11);
      v13 = self->_webContainerView;
      self->_webContainerView = v12;

      -[RUIWebContainerView setDelegate:](self->_webContainerView, "setDelegate:", self);
      v14 = self->_webContainerView;
      v15 = (void *)MEMORY[0x24BDD17C8];
      RemoteUIFooterCSSTextColor();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("body { color: %@; font: -apple-system-footnote; line-height: 1.2em; } * { -webkit-text-size-adjust: none; } "),
        v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIWebContainerView setUserStyleSheet:](v14, "setUserStyleSheet:", v17);

      -[RUIHTMLFooterView addSubview:](self, "addSubview:", self->_webContainerView);
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
  -[RUIHTMLFooterView footerHeightForWidth:inView:](self, "footerHeightForWidth:inView:", self, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
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
  v8.super_class = (Class)RUIHTMLFooterView;
  -[RUIHTMLFooterView layoutSubviews](&v8, sel_layoutSubviews);
  -[RUIWebContainerView frame](self->_webContainerView, "frame");
  v4 = v3;
  -[RUIHTMLFooterView bounds](self, "bounds");
  v6 = v5;
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:", v5);
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", v4, 8.0, v6, v7);
}

- (double)footerHeightForWidth:(double)a3 inView:(id)a4
{
  double v4;

  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:", a4, a3);
  return v4 + 10.0;
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  RUITableFooterDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "footerView:activatedLinkWithURL:", self, v6);

}

- (RUITableFooterDelegate)delegate
{
  return (RUITableFooterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
