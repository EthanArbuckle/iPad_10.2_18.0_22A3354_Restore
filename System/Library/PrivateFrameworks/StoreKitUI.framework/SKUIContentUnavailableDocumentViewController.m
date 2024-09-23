@implementation SKUIContentUnavailableDocumentViewController

- (SKUIContentUnavailableDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SKUIContentUnavailableDocumentViewController *v6;
  SKUIContentUnavailableDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentUnavailableDocumentViewController initWithTemplateElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  v6 = -[SKUIContentUnavailableDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateElement, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  -[SKUIViewController dealloc](&v3, sel_dealloc);
}

- (void)documentDidUpdate:(id)a3
{
  SKUIContentUnavailableTemplateElement *v4;
  SKUIContentUnavailableTemplateElement *templateElement;
  void *v6;
  void *v7;
  SKUIContentUnavailableView *contentUnavailableView;
  void *v9;
  SKUIContentUnavailableView *v10;
  double v11;
  id v12;

  objc_msgSend(a3, "templateElement");
  v4 = (SKUIContentUnavailableTemplateElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_contentUnavailableView)
  {
    -[SKUIContentUnavailableTemplateElement style](self->_templateElement, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ikBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "color");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    contentUnavailableView = self->_contentUnavailableView;
    if (v12)
    {
      -[SKUIViewReuseView setBackgroundColor:](self->_contentUnavailableView, "setBackgroundColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v9);

    }
    v10 = self->_contentUnavailableView;
    -[SKUIContentUnavailableView bounds](v10, "bounds");
    -[SKUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", v10, v11);

  }
}

- (void)viewDidLoad
{
  SKUIContentUnavailableView *contentUnavailableView;
  void *v4;
  void *v5;
  void *v6;
  SKUIContentUnavailableView *v7;
  void *v8;
  SKUIContentUnavailableView *v9;
  SKUIContentUnavailableView *v10;
  SKUIContentUnavailableView *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  -[SKUIContentUnavailableDocumentViewController viewDidLoad](&v14, sel_viewDidLoad);
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    -[SKUIContentUnavailableTemplateElement style](self->_templateElement, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ikBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [SKUIContentUnavailableView alloc];
    -[SKUIContentUnavailableDocumentViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = -[SKUIViewReuseView initWithFrame:](v7, "initWithFrame:");
    v10 = self->_contentUnavailableView;
    self->_contentUnavailableView = v9;

    v11 = self->_contentUnavailableView;
    if (v6)
    {
      -[SKUIViewReuseView setBackgroundColor:](self->_contentUnavailableView, "setBackgroundColor:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewReuseView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    }
    contentUnavailableView = self->_contentUnavailableView;
  }
  -[SKUIContentUnavailableView setAutoresizingMask:](contentUnavailableView, "setAutoresizingMask:", 18);
  -[SKUIContentUnavailableDocumentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_contentUnavailableView);

}

- (void)viewWillLayoutSubviews
{
  SKUIContentUnavailableView *contentUnavailableView;
  SKUIContentUnavailableView *v4;
  double v5;
  objc_super v6;

  contentUnavailableView = self->_contentUnavailableView;
  -[SKUIContentUnavailableDocumentViewController _contentInsets](self, "_contentInsets");
  -[SKUIContentUnavailableView setContentInset:](contentUnavailableView, "setContentInset:");
  v4 = self->_contentUnavailableView;
  if (v4)
  {
    -[SKUIContentUnavailableView bounds](self->_contentUnavailableView, "bounds");
    -[SKUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", v4, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  -[SKUIContentUnavailableDocumentViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUIContentUnavailableView *contentUnavailableView;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  contentUnavailableView = self->_contentUnavailableView;
  v8 = a4;
  -[SKUIContentUnavailableDocumentViewController _reloadContentUnavailableView:width:](self, "_reloadContentUnavailableView:width:", contentUnavailableView, width);
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentUnavailableDocumentViewController;
  -[SKUIContentUnavailableDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  SKUIContentUnavailableView *contentUnavailableView;
  id v7;
  id v8;
  id v9;

  contentUnavailableView = self->_contentUnavailableView;
  v7 = a4;
  v8 = a3;
  -[SKUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIContentUnavailableView setImage:forArtworkRequest:context:](contentUnavailableView, "setImage:forArtworkRequest:context:", v7, v8, v9);

}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  SKUIContentUnavailableView *contentUnavailableView;
  SKUIContentUnavailableTemplateElement *templateElement;
  double v6;
  double v7;
  id v8;

  contentUnavailableView = self->_contentUnavailableView;
  templateElement = self->_templateElement;
  -[SKUIContentUnavailableView bounds](contentUnavailableView, "bounds", a3);
  v7 = v6;
  -[SKUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIContentUnavailableView reloadWithViewElement:width:context:](contentUnavailableView, "reloadWithViewElement:width:context:", templateElement, v8, v7);

}

- (UIEdgeInsets)_contentInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[SKUIContentUnavailableDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;
  -[SKUIContentUnavailableDocumentViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;

  v9 = 15.0;
  v10 = 15.0;
  v11 = v5;
  v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
}

- (id)_layoutContext
{
  SKUIViewElementLayoutContext *layoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  SKUIViewElementLayoutContext *v6;
  void *v7;
  SKUILayoutCache *v8;
  SKUILayoutCache *textLayoutCache;
  SKUIViewElementTextLayoutCache *v10;
  SKUIResourceLoader *v11;
  void *v12;
  void *v13;
  SKUIResourceLoader *v14;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_layoutContext;
    -[SKUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SKUIContentUnavailableTemplateElement elementType](self->_templateElement, "elementType"));
    -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    v8 = objc_alloc_init(SKUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    v10 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:]([SKUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", self->_textLayoutCache);
    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v10);
    v11 = [SKUIResourceLoader alloc];
    -[SKUIViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](v11, "initWithOperationQueue:clientContext:", v12, v13);

    -[SKUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v14);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_reloadContentUnavailableView:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  float v8;
  double v9;
  id v10;

  if (a4 > 0.00000011920929)
  {
    v6 = a3;
    -[SKUIContentUnavailableDocumentViewController _layoutContext](self, "_layoutContext");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v7);

    objc_msgSend((id)objc_opt_class(), "prefetchResourcesForViewElement:reason:context:", self->_templateElement, 1, v10);
    v8 = a4 + -30.0;
    v9 = floorf(v8);
    objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", self->_templateElement, v10, v9);
    -[SKUILayoutCache commitLayoutRequests](self->_textLayoutCache, "commitLayoutRequests");
    objc_msgSend(v6, "reloadWithViewElement:width:context:", self->_templateElement, v10, v9);
    -[SKUIContentUnavailableDocumentViewController _contentInsets](self, "_contentInsets");
    objc_msgSend(v6, "setContentInset:");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContentUnavailableDocumentViewController initWithTemplateElement:]";
}

@end
