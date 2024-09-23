@implementation SKUILoadingDocumentViewController

- (SKUILoadingDocumentViewController)initWithActivityIndicatorElement:(id)a3
{
  id v5;
  SKUILoadingDocumentViewController *v6;
  SKUILoadingDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadingDocumentViewController initWithActivityIndicatorElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILoadingDocumentViewController;
  v6 = -[SKUILoadingDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activityIndicatorElement, a3);

  return v7;
}

- (SKUILoadingDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SKUILoadingDocumentViewController *v6;
  SKUILoadingDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadingDocumentViewController initWithTemplateElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILoadingDocumentViewController;
  v6 = -[SKUILoadingDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateElement, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *delayTimer;
  objc_super v4;

  delayTimer = self->_delayTimer;
  if (delayTimer)
    dispatch_source_cancel(delayTimer);
  -[SKUIViewElementLayoutContext setParentViewController:](self->_viewLayoutContext, "setParentViewController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUILoadingDocumentViewController;
  -[SKUIViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SKUIActivityIndicatorView *activityIndicatorView;
  SKUIActivityIndicatorView *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKUILoadingDocumentViewController setView:](self, "setView:");
  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[SKUIActivityIndicatorView frame](activityIndicatorView, "frame");
    objc_msgSend(v5, "setFrame:");
    v4 = self->_activityIndicatorView;
    objc_msgSend(v5, "bounds");
    -[SKUIActivityIndicatorView setFrame:](v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", self->_activityIndicatorView);
  }
  -[SKUILoadingDocumentViewController _reloadViewStyling](self, "_reloadViewStyling");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_source *v5;
  OS_dispatch_source *delayTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  objc_super v10;
  _QWORD handler[4];
  id v12;
  id location;

  v3 = a3;
  if (!self->_activityIndicatorView && !self->_delayTimer)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v5;

    v7 = self->_delayTimer;
    v8 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v9 = self->_delayTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51__SKUILoadingDocumentViewController_viewDidAppear___block_invoke;
    handler[3] = &unk_1E739FF68;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUILoadingDocumentViewController;
  -[SKUILoadingDocumentViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

void __51__SKUILoadingDocumentViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showActivityIndicator");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *delayTimer;
  OS_dispatch_source *v6;
  objc_super v7;

  v3 = a3;
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    dispatch_source_cancel(delayTimer);
    v6 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadingDocumentViewController;
  -[SKUILoadingDocumentViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  SKUIActivityIndicatorView *activityIndicatorView;
  objc_super v4;

  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[SKUILoadingDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
    -[SKUIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUILoadingDocumentViewController;
  -[SKUILoadingDocumentViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)documentDidUpdate:(id)a3
{
  SKUILoadingTemplateViewElement *v4;
  SKUILoadingTemplateViewElement *templateElement;

  objc_msgSend(a3, "templateElement");
  v4 = (SKUILoadingTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  -[SKUILoadingDocumentViewController _reloadViewStyling](self, "_reloadViewStyling");
}

- (id)_activityIndicator
{
  SKUIActivityIndicatorViewElement *v2;

  if (self->_templateElement)
  {
    -[SKUILoadingTemplateViewElement activityIndicator](self->_templateElement, "activityIndicator");
    v2 = (SKUIActivityIndicatorViewElement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_activityIndicatorElement;
  }
  return v2;
}

- (id)_layoutCache
{
  SKUILayoutCache *layoutCache;
  SKUILayoutCache *v4;
  SKUILayoutCache *v5;

  layoutCache = self->_layoutCache;
  if (!layoutCache)
  {
    v4 = objc_alloc_init(SKUILayoutCache);
    v5 = self->_layoutCache;
    self->_layoutCache = v4;

    layoutCache = self->_layoutCache;
  }
  return layoutCache;
}

- (void)_reloadViewStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SKUILoadingDocumentViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingTemplateViewElement style](self->_templateElement, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "setBackgroundColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  if (self->_activityIndicatorView)
    -[SKUILoadingDocumentViewController _showActivityIndicator](self, "_showActivityIndicator");

}

- (void)_showActivityIndicator
{
  NSObject *delayTimer;
  OS_dispatch_source *v4;
  SKUIActivityIndicatorView *v5;
  SKUIActivityIndicatorView *activityIndicatorView;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  SKUIActivityIndicatorView *v13;
  SKUIActivityIndicatorView *v14;
  void *v15;
  id v16;

  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    dispatch_source_cancel(delayTimer);
    v4 = self->_delayTimer;
    self->_delayTimer = 0;

  }
  -[SKUILoadingDocumentViewController view](self, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_activityIndicatorView)
  {
    v5 = objc_alloc_init(SKUIActivityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

  }
  -[SKUILoadingDocumentViewController _activityIndicator](self, "_activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingDocumentViewController _viewLayoutContext](self, "_viewLayoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", v7, v8, v11);
  -[SKUILoadingDocumentViewController _layoutCache](self, "_layoutCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commitLayoutRequests");

  -[SKUIActivityIndicatorView reloadWithViewElement:width:context:](self->_activityIndicatorView, "reloadWithViewElement:width:context:", v7, v8, v11);
  v13 = self->_activityIndicatorView;
  -[SKUILoadingDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
  -[SKUIActivityIndicatorView setFrame:](v13, "setFrame:");
  -[SKUIActivityIndicatorView setAutoresizingMask:](self->_activityIndicatorView, "setAutoresizingMask:", 45);
  v14 = self->_activityIndicatorView;
  objc_msgSend(v16, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  objc_msgSend(v16, "addSubview:", self->_activityIndicatorView);
}

- (CGRect)_computedFrameForActivityIndicatorView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SKUILoadingDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[SKUIActivityIndicatorView frame](self->_activityIndicatorView, "frame");
  -[SKUIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", 1.79769313e308, v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "frame");
  v12 = (v11 - v8) * 0.5;
  v13 = floorf(v12);
  v14 = v6 * 0.5 - v10;
  v15 = floorf(v14);

  v16 = v13;
  v17 = v15;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_viewLayoutContext
{
  SKUIViewElementLayoutContext *viewLayoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  void *v6;
  SKUIViewElementTextLayoutCache *v7;
  void *v8;
  SKUIViewElementTextLayoutCache *v9;
  SKUIResourceLoader *v10;
  void *v11;
  SKUIResourceLoader *v12;

  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    -[SKUIViewElementLayoutContext setParentViewController:](self->_viewLayoutContext, "setParentViewController:", self);
    -[SKUIViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](self->_viewLayoutContext, "setClientContext:", v6);
    v7 = [SKUIViewElementTextLayoutCache alloc];
    -[SKUILoadingDocumentViewController _layoutCache](self, "_layoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v7, "initWithLayoutCache:", v8);

    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_viewLayoutContext, "setLabelLayoutCache:", v9);
    v10 = [SKUIResourceLoader alloc];
    -[SKUIViewController operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](v10, "initWithOperationQueue:clientContext:", v11, v6);

    -[SKUIViewElementLayoutContext setResourceLoader:](self->_viewLayoutContext, "setResourceLoader:", v12);
    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorElement, 0);
}

- (void)initWithActivityIndicatorElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadingDocumentViewController initWithActivityIndicatorElement:]";
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadingDocumentViewController initWithTemplateElement:]";
}

@end
