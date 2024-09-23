@implementation SKUINavigationBarSectionController

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_viewLayoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUINavigationBarSectionController;
  -[SKUINavigationBarSectionController dealloc](&v3, sel_dealloc);
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUINavigationBarSectionController barButtonItemForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v3)
      -[SKUINavigationBarSectionController reloadAfterDocumentUpdateWithNavigationItem:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (UIView)view
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUINavigationBarSectionController view].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUINavigationBarSectionController viewForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (SKUIViewElementLayoutContext)viewLayoutContext
{
  SKUIViewElementLayoutContext *viewLayoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  SKUIViewElementLayoutContext *v6;
  void *v7;
  SKUIViewElementLayoutContext *v8;
  void *v9;
  SKUIViewElementLayoutContext *v10;
  void *v11;
  SKUIViewElementTextLayoutCache *v12;
  void *v13;
  SKUIViewElementTextLayoutCache *v14;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINavigationBarSectionController viewLayoutContext].cold.1();
  }
  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_viewLayoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_viewLayoutContext;
    -[SKUINavigationBarContext clientContext](self->_navigationBarContext, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    v8 = self->_viewLayoutContext;
    -[SKUINavigationBarContext parentViewController](self->_navigationBarContext, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setParentViewController:](v8, "setParentViewController:", v9);

    v10 = self->_viewLayoutContext;
    -[SKUINavigationBarContext resourceLoader](self->_navigationBarContext, "resourceLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setResourceLoader:](v10, "setResourceLoader:", v11);

    v12 = [SKUIViewElementTextLayoutCache alloc];
    -[SKUINavigationBarContext textLayoutCache](self->_navigationBarContext, "textLayoutCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v12, "initWithLayoutCache:", v13);

    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_viewLayoutContext, "setLabelLayoutCache:", v14);
    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
      -[SKUINavigationBarSectionController artworkRequest:didLoadImage:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (SKUINavigationBarContext)context
{
  return self->_navigationBarContext;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
}

- (void)barButtonItemForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)view
{
  OUTLINED_FUNCTION_1();
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)viewLayoutContext
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationBarSectionController viewLayoutContext]";
  OUTLINED_FUNCTION_1();
}

- (void)artworkRequest:(uint64_t)a3 didLoadImage:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
