@implementation SKUIModernChartsDocumentViewController

- (SKUIModernChartsDocumentViewController)initWithTemplateElement:(id)a3
{
  id v4;
  SKUIModernChartsDocumentViewController *v5;
  SKUIModernChartsDocumentViewController *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIModernChartsDocumentViewController initWithTemplateElement:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIModernChartsDocumentViewController;
  v5 = -[SKUIModernChartsDocumentViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SKUIModernChartsDocumentViewController _reloadWithTemplateElement:](v5, "_reloadWithTemplateElement:", v4);

  return v6;
}

- (void)documentDidUpdate:(id)a3
{
  id v4;

  objc_msgSend(a3, "templateElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIModernChartsDocumentViewController _reloadWithTemplateElement:](self, "_reloadWithTemplateElement:");
  if (-[SKUIResourceLoader isIdleForReason:](self->_resourceLoader, "isIdleForReason:", 1))
    -[SKUIModernChartsDocumentViewController resourceLoader:didLoadAllForReason:](self, "resourceLoader:didLoadAllForReason:", self->_resourceLoader, 1);

}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_columnViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateAndReload", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSMutableArray *obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_columnViewControllers;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  v7 = 0;
  if (v25)
  {
    v24 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "sections", v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
            objc_msgSend(v15, "pageComponent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "viewElement");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "elementWithIdentifier:", v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              break;

            v7 = 0;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              v7 = 0;
              v19 = 0;
              if (v12)
                goto LABEL_8;
              goto LABEL_18;
            }
          }
          v20 = v15;

          if (!v20)
          {
            v7 = v18;
            continue;
          }

          v21 = v22;
          objc_msgSend(v20, "getModalSourceViewForViewElement:completionBlock:", v18, v22);

          goto LABEL_23;
        }
        v19 = v7;
LABEL_18:

        v7 = v19;
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v25)
        continue;
      break;
    }
  }

  v21 = v22;
  (*((void (**)(id, _QWORD))v22 + 2))(v22, 0);
  v18 = v7;
LABEL_23:

}

- (id)contentScrollView
{
  return 0;
}

- (void)loadView
{
  SKUIModernChartsView *v3;
  SKUIModernChartsView *chartsView;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v3 = objc_alloc_init(SKUIModernChartsView);
  chartsView = self->_chartsView;
  self->_chartsView = v3;

  -[SKUIModernChartsView setAutoresizingMask:](self->_chartsView, "setAutoresizingMask:", 18);
  -[SKUIModernChartsView setColumnViewControllers:](self->_chartsView, "setColumnViewControllers:", self->_columnViewControllers);
  objc_msgSend(v5, "addSubview:", self->_chartsView);
  -[SKUIModernChartsDocumentViewController setView:](self, "setView:", v5);

}

- (void)viewWillLayoutSubviews
{
  SKUIModernChartsView *chartsView;
  SKUIActivityIndicatorView *activityIndicatorView;
  objc_super v5;

  chartsView = self->_chartsView;
  -[SKUIModernChartsDocumentViewController _contentInset](self, "_contentInset");
  -[SKUIModernChartsView setContentInset:](chartsView, "setContentInset:");
  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[SKUIModernChartsDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
    -[SKUIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIModernChartsDocumentViewController;
  -[SKUIModernChartsDocumentViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SKUIModernChartsDocumentViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF439238) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "resourceLoaderDidBeginLoading:", v5);

}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4 == 1)
    -[SKUIChartsTemplateViewElement dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("visibleimagesloaded"), CFSTR("onvisibleimagesloaded"), 1, 1, 0, 0);
  -[SKUIModernChartsDocumentViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF439238) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "resourceLoader:didLoadAllForReason:", v7, a4);

}

- (UIEdgeInsets)_contentInset
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

  -[SKUIModernChartsDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;

  -[SKUIModernChartsDocumentViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;

  v9 = 0.0;
  v10 = 0.0;
  v11 = v5;
  v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
}

- (void)_hideActivityIndicator
{
  SKUIActivityIndicatorView *activityIndicatorView;

  -[SKUIActivityIndicatorView removeFromSuperview](self->_activityIndicatorView, "removeFromSuperview");
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = 0;

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

- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  SKUIModernChartsDocumentViewController *v20;
  SKUIStorePageSectionsViewController *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  SKUIMetricsImpressionSession *v25;
  void *v26;
  void *v28;
  id obj;
  SKUIModernChartsDocumentViewController *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SKUIViewController clientContext](self, "clientContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIChartsTemplateViewElement columns](self->_templateElement, "columns");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v41;
    v30 = self;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v6 = (void *)objc_msgSend(objc_alloc((Class)SKUIPageComponentClassForComponentType(objc_msgSend(v5, "pageComponentType"))), "initWithViewElement:", v5);
        if (v6)
        {
          objc_msgSend(v5, "headerElement");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "titleLabels");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "firstObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v9;
          objc_msgSend(v9, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "string");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v12 = v31;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v37;
LABEL_9:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v37 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
              objc_msgSend(v17, "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v11);

              if ((v19 & 1) != 0)
                break;
              if (v14 == ++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
                if (v14)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v21 = v17;

            v20 = v30;
            if (v21)
              goto LABEL_21;
          }
          else
          {
LABEL_15:

            v20 = v30;
          }
          v21 = -[SKUIStorePageSectionsViewController initWithLayoutStyle:]([SKUIStorePageSectionsViewController alloc], "initWithLayoutStyle:", 0);
          -[SKUIViewController setClientContext:](v21, "setClientContext:", v28);
          -[SKUIViewController operationQueue](v20, "operationQueue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIViewController setOperationQueue:](v21, "setOperationQueue:", v22);

          -[SKUIModernChartsDocumentViewController _resourceLoader](v20, "_resourceLoader");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIStorePageSectionsViewController setResourceLoader:](v21, "setResourceLoader:", v23);

          if (v11)
            v24 = v11;
          else
            v24 = &stru_1E73A9FB0;
          -[SKUIStorePageSectionsViewController setTitle:](v21, "setTitle:", v24);
          v25 = objc_alloc_init(SKUIMetricsImpressionSession);
          -[SKUIStorePageSectionsViewController setActiveMetricsImpressionSession:](v21, "setActiveMetricsImpressionSession:", v25);

LABEL_21:
          v44 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIStorePageSectionsViewController setSectionsWithPageComponents:](v21, "setSectionsWithPageComponents:", v26);

          -[SKUIModernChartsDocumentViewController addChildViewController:](v20, "addChildViewController:", v21);
          objc_msgSend(v32, "addObject:", v21);

        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v34);
  }

  return v32;
}

- (void)_reloadWithTemplateElement:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *columnViewControllers;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SKUIModernChartsView *chartsView;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_templateElement, a3);
  v6 = self->_columnViewControllers;
  v7 = -[SKUIModernChartsDocumentViewController _newColumnViewControllersWithReusableViewControllers:](self, "_newColumnViewControllersWithReusableViewControllers:", v6);
  columnViewControllers = self->_columnViewControllers;
  self->_columnViewControllers = v7;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_columnViewControllers, "containsObject:", v14, (_QWORD)v17) & 1) == 0)
          objc_msgSend(v14, "removeFromParentViewController");
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  chartsView = self->_chartsView;
  if (chartsView)
    -[SKUIModernChartsView setColumnViewControllers:](chartsView, "setColumnViewControllers:", self->_columnViewControllers);
  -[SKUIChartsTemplateViewElement activityIndicator](self->_templateElement, "activityIndicator", (_QWORD)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[SKUIModernChartsDocumentViewController _showActivityIndicator](self, "_showActivityIndicator");
  else
    -[SKUIModernChartsDocumentViewController _hideActivityIndicator](self, "_hideActivityIndicator");

}

- (void)_showActivityIndicator
{
  SKUIActivityIndicatorView *v3;
  SKUIActivityIndicatorView *activityIndicatorView;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  SKUIActivityIndicatorView *v11;
  void *v12;
  SKUIActivityIndicatorView *v13;
  id v14;

  -[SKUIModernChartsDocumentViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_activityIndicatorView)
  {
    v3 = objc_alloc_init(SKUIActivityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v3;

  }
  -[SKUIChartsTemplateViewElement activityIndicator](self->_templateElement, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIModernChartsDocumentViewController _viewLayoutContext](self, "_viewLayoutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", v5, v6, v9);
  -[SKUIModernChartsDocumentViewController _layoutCache](self, "_layoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commitLayoutRequests");

  -[SKUIActivityIndicatorView reloadWithViewElement:width:context:](self->_activityIndicatorView, "reloadWithViewElement:width:context:", v5, v6, v9);
  -[SKUIActivityIndicatorView setAutoresizingMask:](self->_activityIndicatorView, "setAutoresizingMask:", 45);
  v11 = self->_activityIndicatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  v13 = self->_activityIndicatorView;
  -[SKUIModernChartsDocumentViewController _computedFrameForActivityIndicatorView](self, "_computedFrameForActivityIndicatorView");
  -[SKUIActivityIndicatorView setFrame:](v13, "setFrame:");
  objc_msgSend(v14, "addSubview:", self->_activityIndicatorView);

}

- (CGRect)_computedFrameForActivityIndicatorView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[SKUIModernChartsDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SKUIActivityIndicatorView frame](self->_activityIndicatorView, "frame");
  -[SKUIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", v5, v7);
  v9 = v8;
  v11 = v10;
  *(float *)&v8 = (v5 - v8) * 0.5;
  v12 = floorf(*(float *)&v8);
  *(float *)&v10 = v7 * 0.5 - v10;
  v13 = floorf(*(float *)&v10);
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
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
    -[SKUIModernChartsDocumentViewController _layoutCache](self, "_layoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v7, "initWithLayoutCache:", v8);

    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_viewLayoutContext, "setLabelLayoutCache:", v9);
    v10 = -[SKUIResourceLoader initWithClientContext:]([SKUIResourceLoader alloc], "initWithClientContext:", v6);
    -[SKUIViewElementLayoutContext setResourceLoader:](self->_viewLayoutContext, "setResourceLoader:", v10);

    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (id)_resourceLoader
{
  SKUIResourceLoader *resourceLoader;
  SKUIResourceLoader *v4;
  void *v5;
  SKUIResourceLoader *v6;
  SKUIResourceLoader *v7;
  SKUIResourceLoader *v8;
  void *v9;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SKUIResourceLoader alloc];
    -[SKUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);
    v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    v8 = self->_resourceLoader;
    SKUIResourceLoaderGetNameForObject(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIResourceLoader setName:](v8, "setName:", v9);

    -[SKUIResourceLoader setDelegate:](self->_resourceLoader, "setDelegate:", self);
    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_columnViewControllers, 0);
  objc_storeStrong((id *)&self->_chartsView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIModernChartsDocumentViewController initWithTemplateElement:]";
}

@end
