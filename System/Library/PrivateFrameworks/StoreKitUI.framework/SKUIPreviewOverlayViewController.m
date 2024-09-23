@implementation SKUIPreviewOverlayViewController

- (SKUIPreviewOverlayViewController)initWithDocument:(id)a3
{
  id v5;
  SKUIPreviewOverlayViewController *v6;
  SKUIPreviewOverlayViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewOverlayViewController initWithDocument:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewOverlayViewController;
  v6 = -[SKUIPreviewOverlayViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SKUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", 0);
  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer view](self->_tapGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_tapGestureRecognizer);

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SKUIPreviewOverlayViewController;
  -[SKUIViewController dealloc](&v5, sel_dealloc);
}

- (void)prepareOverlayView
{
  SKUIViewElementLayoutContext *v3;
  SKUIViewElementLayoutContext *layoutContext;
  SKUIViewElementLayoutContext *v5;
  void *v6;
  void *v7;
  SKUIResourceLoader *v8;
  void *v9;
  SKUIResourceLoader *v10;
  SKUIViewElementTextLayoutCache *v11;
  void *v12;
  SKUIViewElementTextLayoutCache *v13;
  void *v14;
  void *v15;
  id v16;

  if (!self->_layoutContext)
  {
    v3 = objc_alloc_init(SKUIViewElementLayoutContext);
    layoutContext = self->_layoutContext;
    self->_layoutContext = v3;

    v5 = self->_layoutContext;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_backgroundStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setAggregateValue:forKey:](v5, "setAggregateValue:forKey:", v6, 0x1E73B4C30);

    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    -[SKUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](self->_layoutContext, "setClientContext:", v7);
    v8 = [SKUIResourceLoader alloc];
    -[SKUIViewController operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](v8, "initWithOperationQueue:clientContext:", v9, v7);

    -[SKUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v10);
    v11 = [SKUIViewElementTextLayoutCache alloc];
    -[SKUIPreviewOverlayViewController _layoutCache](self, "_layoutCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v11, "initWithLayoutCache:", v12);

    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v13);
  }
  -[IKAppDocument templateElement](self->_document, "templateElement");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "previewLockup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPreviewOverlayViewController _overlayWidth](self, "_overlayWidth");
  +[SKUIHorizontalLockupView requestLayoutForViewElement:width:context:](SKUIHorizontalLockupView, "requestLayoutForViewElement:width:context:", v14, self->_layoutContext);
  +[SKUIHorizontalLockupView prefetchResourcesForViewElement:reason:context:](SKUIHorizontalLockupView, "prefetchResourcesForViewElement:reason:context:", v14, 0, self->_layoutContext);
  -[SKUIPreviewOverlayViewController _layoutCache](self, "_layoutCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commitLayoutRequests");

}

- (void)reloadOverlayView
{
  void *v3;
  SKUIHorizontalLockupView *lockupView;
  id v5;

  -[IKAppDocument templateElement](self->_document, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewLockup");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  lockupView = self->_lockupView;
  -[SKUIPreviewOverlayViewController _overlayWidth](self, "_overlayWidth");
  -[SKUIHorizontalLockupView reloadWithViewElement:width:context:](lockupView, "reloadWithViewElement:width:context:", v5, self->_layoutContext);

}

- (void)setBackgroundStyle:(int64_t)a3
{
  SKUIViewElementLayoutContext *layoutContext;
  id v4;

  self->_backgroundStyle = a3;
  layoutContext = self->_layoutContext;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](layoutContext, "setAggregateValue:forKey:", v4, 0x1E73B4C30);

}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_storeStrong((id *)&self->_previewStatus, a3);
  v7 = a3;
  -[SKUIHorizontalLockupView showPreviewProgressWithStatus:animated:](self->_lockupView, "showPreviewProgressWithStatus:animated:", v7, v4);

}

- (void)loadView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SKUIHorizontalLockupView *v11;
  SKUIHorizontalLockupView *lockupView;
  SKUIHorizontalLockupView *v13;
  void *v14;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *tapGestureRecognizer;
  id v17;

  -[SKUIPreviewOverlayViewController _overlayWidth](self, "_overlayWidth");
  v4 = v3;
  -[IKAppDocument templateElement](self->_document, "templateElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewLockup");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_lockupView)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    +[SKUIHorizontalLockupView sizeThatFitsWidth:viewElement:context:](SKUIHorizontalLockupView, "sizeThatFitsWidth:viewElement:context:", v17, self->_layoutContext, v4);
    if (v9 >= 44.0)
      v10 = v9;
    else
      v10 = 44.0;
    v11 = -[SKUIHorizontalLockupView initWithFrame:]([SKUIHorizontalLockupView alloc], "initWithFrame:", v6, v7, v8, v10);
    lockupView = self->_lockupView;
    self->_lockupView = v11;

    v13 = self->_lockupView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIHorizontalLockupView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SKUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    -[SKUIHorizontalLockupView reloadWithViewElement:width:context:](self->_lockupView, "reloadWithViewElement:width:context:", v17, self->_layoutContext, v4);
    -[SKUIHorizontalLockupView showPreviewProgressWithStatus:animated:](self->_lockupView, "showPreviewProgressWithStatus:animated:", self->_previewStatus, 0);
    -[SKUIHorizontalLockupView setUpdateLayoutOnButtonConfirmation:](self->_lockupView, "setUpdateLayoutOnButtonConfirmation:", 1);
  }
  if (!self->_tapGestureRecognizer)
  {
    v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapAction_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v15;

    -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
    -[SKUIHorizontalLockupView addGestureRecognizer:](self->_lockupView, "addGestureRecognizer:", self->_tapGestureRecognizer);
  }
  -[SKUIPreviewOverlayViewController setView:](self, "setView:", self->_lockupView);

}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  SKUIPreviewOverlayViewController *v9;

  v5 = a4;
  v6 = v5;
  if (self->_lockupView)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__SKUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke;
    v7[3] = &unk_1E739FD10;
    v8 = v5;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __70__SKUIPreviewOverlayViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "updateWithItemState:context:animated:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064), 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  -[SKUIHorizontalLockupView setImage:forArtworkRequest:context:](self->_lockupView, "setImage:forArtworkRequest:context:", a4, a3, self->_layoutContext);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_tapAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[IKAppDocument templateElement](self->_document, "templateElement");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewURLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
      objc_msgSend(MEMORY[0x1E0DDC1E8], "sessionManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endSessionForURL:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stop");
    }

  }
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

    -[SKUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", self);
    layoutCache = self->_layoutCache;
  }
  return layoutCache;
}

- (double)_overlayWidth
{
  void *v2;
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  -[SKUIViewController clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SKUIUserInterfaceIdiom(v2);

  if (v3 == 1)
    return 290.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  return v7 + -30.0;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewStatus, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (void)initWithDocument:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPreviewOverlayViewController initWithDocument:]";
}

@end
