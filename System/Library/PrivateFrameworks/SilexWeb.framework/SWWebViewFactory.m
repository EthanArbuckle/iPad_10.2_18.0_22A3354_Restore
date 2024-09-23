@implementation SWWebViewFactory

- (SWWebViewFactory)init
{
  SWWebViewFactory *v2;
  uint64_t v3;
  NSPointerArray *webViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SWWebViewFactory;
  v2 = -[SWWebViewFactory init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    webViews = v2->_webViews;
    v2->_webViews = (NSPointerArray *)v3;

  }
  return v2;
}

- (id)createWebViewWithWebViewConfiguration:(id)a3 scrollSettings:(id)a4
{
  id v6;
  id v7;
  SWWebView *v8;
  SWWebView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  -[SWWebViewFactory assignRelatedWebViewToConfiguration:](self, "assignRelatedWebViewToConfiguration:", v7);
  v8 = [SWWebView alloc];
  v9 = -[SWWebView initWithFrame:configuration:](v8, "initWithFrame:configuration:", v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  -[SWWebView scrollView](v9, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScrollsToTop:", objc_msgSend(v6, "scrollsToTop"));

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWWebView setBackgroundColor:](v9, "setBackgroundColor:", v11);

  -[SWWebView setOpaque:](v9, "setOpaque:", 0);
  -[SWWebView scrollView](v9, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  -[SWWebView scrollView](v9, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScrollEnabled:", objc_msgSend(v6, "scrollEnabled"));

  -[SWWebView scrollView](v9, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "showsVerticalScrollIndicator");

  objc_msgSend(v15, "setShowsVerticalScrollIndicator:", v16);
  -[SWWebView scrollView](v9, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowsHorizontalScrollIndicator:", 0);

  -[SWWebView scrollView](v9, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentInsetAdjustmentBehavior:", 2);

  -[SWWebViewFactory webViews](self, "webViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addPointer:", v9);

  return v9;
}

- (void)assignRelatedWebViewToConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SWWebViewFactory webViews](self, "webViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setRelatedWebView:", v7);
}

- (NSPointerArray)webViews
{
  return self->_webViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViews, 0);
}

@end
