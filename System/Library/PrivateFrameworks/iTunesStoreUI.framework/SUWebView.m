@implementation SUWebView

- (SUWebView)initWithFrame:(CGRect)a3
{
  SUWebView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUWebView;
  result = -[SUWebView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_originalShowsBackgroundShadow = -1;
  return result;
}

- (void)beginSynchronousLayout
{
  int64_t synchronousLayoutCount;
  void *v4;

  synchronousLayoutCount = self->_synchronousLayoutCount;
  if (!synchronousLayoutCount)
  {
    -[SUWebView _setDrawInWebThread:](self, "_setDrawInWebThread:", 0);
    -[SUWebView _browserView](self, "_browserView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaused:", 1);

    synchronousLayoutCount = self->_synchronousLayoutCount;
  }
  self->_synchronousLayoutCount = synchronousLayoutCount + 1;
}

- (void)endSynchronousLayout
{
  int64_t synchronousLayoutCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;
  void *v7;
  void *v8;

  synchronousLayoutCount = self->_synchronousLayoutCount;
  v3 = synchronousLayoutCount == 1;
  v4 = synchronousLayoutCount < 1;
  v5 = synchronousLayoutCount - 1;
  if (!v4)
  {
    self->_synchronousLayoutCount = v5;
    if (v3)
    {
      -[SUWebView _browserView](self, "_browserView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPaused:", 0);

      -[SUWebView _browserView](self, "_browserView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "forceLayout");

      -[SUWebView forceDisplayIfNeeded](self, "forceDisplayIfNeeded");
      -[SUWebView _setDrawInWebThread:](self, "_setDrawInWebThread:", 1);
    }
  }
}

- (BOOL)getStatusBarStyle:(int64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  int64_t v16;

  WebThreadLock();
  -[SUWebView _browserView](self, "_browserView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DOMDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "getElementsByTagName:", CFSTR("meta"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
LABEL_6:

LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  while (1)
  {
    objc_msgSend(v9, "item:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAttribute:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("apple-mobile-web-app-status-bar-style"));

    if (!v13)
      break;

    v10 = (v10 + 1);
    if (v10 >= objc_msgSend(v9, "length"))
      goto LABEL_6;
  }
  v16 = objc_msgSend(MEMORY[0x24BDF6FD0], "webClipStatusBarStyleForWebDocumentView:", v5);

  if (a3)
    *a3 = v16;
  v14 = 1;
LABEL_8:

  return v14;
}

- (void)loadArchive:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  WebThreadRun();

}

void __25__SUWebView_loadArchive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_browserView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadArchive:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isScrollingEnabled
{
  return (*((_BYTE *)self + 464) & 1) == 0;
}

- (void)setScrollingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SUWebView _scrollView](self, "_scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self + 464) = *((_BYTE *)self + 464) & 0xFE | !v3;
  objc_msgSend(v5, "setScrollsToTop:", v3);
  objc_msgSend(v5, "setScrollEnabled:", v3);

}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[SUWebView _browserView](self, "_browserView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrameTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)windowScriptObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  SUScriptDictionary *v13;

  -[SUWebView _browserView](self, "_browserView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScriptObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[SUWebView isLoading](self, "isLoading") & 1) != 0)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("document"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("body"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[SUWebView _browserView](self, "_browserView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "loadsSynchronously");
      objc_msgSend(v8, "setLoadsSynchronously:", 1);
      -[SUWebView loadHTMLString:baseURL:](self, "loadHTMLString:baseURL:", CFSTR("<html><head></head><body></body></html>"), 0);
      objc_msgSend(v8, "setLoadsSynchronously:", v9);

    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "valueForKey:", CFSTR("document"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("document"));

    objc_msgSend(v5, "valueForKey:", CFSTR("iTunes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("iTunes"));

    v13 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v10);
  }
  else
  {
    v13 = v5;
  }

  return v13;
}

- (void)_setPinnedHeaderView:(id)a3 withTopInsetAdjustment:(double)a4
{
  UIView *v7;
  UIView **p_pinnedHeaderView;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;

  v7 = (UIView *)a3;
  p_pinnedHeaderView = &self->_pinnedHeaderView;
  if (self->_pinnedHeaderView != v7)
  {
    v14 = v7;
    -[SUWebView _scrollView](self, "_scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeFromSuperview](*p_pinnedHeaderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_pinnedHeaderView, a3);
    if (*p_pinnedHeaderView)
    {
      objc_msgSend(v9, "bounds");
      v11 = v10;
      -[UIView frame](v14, "frame");
      v13 = v12;
      -[UIView setAutoresizingMask:](*p_pinnedHeaderView, "setAutoresizingMask:", 2);
      -[UIView setFrame:](*p_pinnedHeaderView, "setFrame:", 0.0, a4, v11, v13);
      objc_msgSend(v9, "_addContentSubview:atBack:", *p_pinnedHeaderView, 0);
    }
    self->_pinnedHeaderInsetAdjustment = a4;

    v7 = v14;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIColor *originalBackgroundColor;
  double v12;
  UIColor *v13;
  UIColor *v14;
  UIView *pinnedHeaderView;
  UIColor *v16;
  int originalShowsBackgroundShadow;
  objc_super v18;

  v5 = a3;
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  objc_msgSend(v5, "contentOffset");
  v10 = v9;
  originalBackgroundColor = self->_originalBackgroundColor;
  if (v8 >= -v7)
  {
    if (originalBackgroundColor)
    {
      -[SUWebView setBackgroundColor:](self, "setBackgroundColor:");
      v16 = self->_originalBackgroundColor;
      self->_originalBackgroundColor = 0;

    }
    originalShowsBackgroundShadow = self->_originalShowsBackgroundShadow;
    if (originalShowsBackgroundShadow != 255)
    {
      objc_msgSend(v5, "_setShowsBackgroundShadow:", originalShowsBackgroundShadow != 0);
      self->_originalShowsBackgroundShadow = -1;
    }
    if (self->_isPinned)
    {
      -[UIView frame](self->_pinnedHeaderView, "frame");
      -[UIView setFrame:](self->_pinnedHeaderView, "setFrame:");
      self->_isPinned = 0;
    }
  }
  else
  {
    v12 = v8;
    if (!originalBackgroundColor && self->_topBackgroundColor)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v14 = self->_originalBackgroundColor;
      self->_originalBackgroundColor = v13;

      -[SUWebView setBackgroundColor:](self, "setBackgroundColor:", self->_topBackgroundColor);
    }
    if (self->_showsTopBackgroundShadow && self->_originalShowsBackgroundShadow == 255)
    {
      self->_originalShowsBackgroundShadow = objc_msgSend(v5, "_showsBackgroundShadow");
      objc_msgSend(v5, "_setShowsBackgroundShadow:", self->_showsTopBackgroundShadow);
    }
    pinnedHeaderView = self->_pinnedHeaderView;
    if (pinnedHeaderView)
    {
      -[UIView frame](pinnedHeaderView, "frame");
      -[UIView setFrame:](self->_pinnedHeaderView, "setFrame:", v10, v12 + v7 + self->_pinnedHeaderInsetAdjustment);
      self->_isPinned = 1;
    }
  }
  if (objc_msgSend(MEMORY[0x24BDF6FE0], "instancesRespondToSelector:", a2))
  {
    v18.receiver = self;
    v18.super_class = (Class)SUWebView;
    -[SUWebView scrollViewDidScroll:](&v18, sel_scrollViewDidScroll_, v5);
  }

}

- (void)view:(id)a3 didSetFrame:(CGRect)a4 oldFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  void *v15;
  objc_super v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  -[SUWebView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "webView:documentViewDidSetFrame:", self, v12, v11, v10, v9);
  v16.receiver = self;
  v16.super_class = (Class)SUWebView;
  -[SUWebView view:didSetFrame:oldFrame:](&v16, sel_view_didSetFrame_oldFrame_, v14, v12, v11, v10, v9, x, y, width, height);

}

- (BOOL)showsTopBackgroundShadow
{
  return self->_showsTopBackgroundShadow;
}

- (void)setShowsTopBackgroundShadow:(BOOL)a3
{
  self->_showsTopBackgroundShadow = a3;
}

- (UIColor)topBackgroundColor
{
  return self->_topBackgroundColor;
}

- (void)setTopBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_topBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pinnedHeaderView, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
}

@end
