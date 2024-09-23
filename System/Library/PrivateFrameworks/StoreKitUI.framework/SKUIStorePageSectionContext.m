@implementation SKUIStorePageSectionContext

- (SKUIStorePageSectionContext)init
{
  SKUIStorePageSectionContext *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStorePageSectionContext init].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIStorePageSectionContext;
  v3 = -[SKUIStorePageSectionContext init](&v10, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    v3->_portraitPageWidth = v6;
    v3->_activePageWidth = v6;
    v3->_landscapePageWidth = v8;
  }
  return v3;
}

- (SKUIClientContext)clientContext
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  objc_msgSend(WeakRetained, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKUIClientContext *)v3;
}

- (double)horizontalPadding
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double Height;
  double result;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SKUIStorePageSectionContext activePageWidth](self, "activePageWidth");
  v13 = v12;
  if (v12 < 1024.0
    || (v16.origin.x = v5,
        v16.origin.y = v7,
        v16.size.width = v9,
        v16.size.height = v11,
        Height = CGRectGetHeight(v16),
        result = 20.0,
        Height <= 768.0))
  {
    if (-[SKUIStorePageSectionContext layoutStyle](self, "layoutStyle") != 1)
      return 15.0;
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    if (CGRectGetHeight(v17) >= 1024.0)
    {
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      if (CGRectGetWidth(v18) >= 1024.0)
        return 35.0;
    }
    result = 20.0;
    if (v13 != 414.0)
      return 15.0;
  }
  return result;
}

- (SKUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  SKUIItemOfferButtonAppearance *itemOfferButtonAppearance;
  SKUIItemOfferButtonAppearance *v4;
  SKUIItemOfferButtonAppearance *v5;

  itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  if (!itemOfferButtonAppearance)
  {
    v4 = -[SKUIItemOfferButtonAppearance initWithColorScheme:]([SKUIItemOfferButtonAppearance alloc], "initWithColorScheme:", self->_colorScheme);
    v5 = self->_itemOfferButtonAppearance;
    self->_itemOfferButtonAppearance = v4;

    itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  }
  return itemOfferButtonAppearance;
}

- (UIColor)placeholderColor
{
  UIColor *placeholderColor;
  void *v4;
  void *v5;
  float v6;
  UIColor *v7;
  UIColor *v8;

  placeholderColor = self->_placeholderColor;
  if (!placeholderColor)
  {
    -[UICollectionView backgroundColor](self->_collectionView, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      switch(SKUIColorSchemeStyleForColor(v4))
      {
        case 0:
        case 2:
          v6 = -0.15;
          goto LABEL_7;
        case 1:
        case 3:
          v6 = 0.25;
LABEL_7:
          SKUIColorByAdjustingBrightness(v5, v6);
          v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        default:
          goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = self->_placeholderColor;
    self->_placeholderColor = v7;

LABEL_9:
    placeholderColor = self->_placeholderColor;
  }
  return placeholderColor;
}

- (void)_setActiveMetricsImpressionSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, a3);
}

- (void)_setActivePageWidth:(double)a3
{
  if (self->_activePageWidth != a3)
  {
    self->_portraitPageWidth = a3;
    self->_activePageWidth = a3;
  }
}

- (void)_setCollectionView:(id)a3
{
  UICollectionView *v5;
  UIColor *placeholderColor;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  if (self->_collectionView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_collectionView, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    v5 = v7;
  }

}

- (void)_setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  UIColor *placeholderColor;
  SKUIColorScheme *v7;

  v5 = (SKUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    v5 = v7;
  }

}

- (void)_setDefaultPinningTransitionStyle:(int64_t)a3
{
  self->_defaultPinningTransitionStyle = a3;
}

- (void)_setLandscapePageWidth:(double)a3
{
  self->_landscapePageWidth = a3;
}

- (void)_setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)_setMetricsController:(id)a3
{
  SKUIMetricsController *v5;
  SKUIMetricsController **p_metricsController;
  SKUIMetricsController *metricsController;
  SKUIMetricsController *v8;

  v5 = (SKUIMetricsController *)a3;
  metricsController = self->_metricsController;
  p_metricsController = &self->_metricsController;
  if (metricsController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_metricsController, a3);
    v5 = v8;
  }

}

- (void)_setParentViewController:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_parentViewController, v4);

}

- (void)_setPortraitPageWidth:(double)a3
{
  self->_portraitPageWidth = a3;
}

- (void)_setResourceLoader:(id)a3
{
  SKUIResourceLoader *v5;
  SKUIResourceLoader **p_resourceLoader;
  SKUIResourceLoader *resourceLoader;
  SKUIResourceLoader *v8;

  v5 = (SKUIResourceLoader *)a3;
  resourceLoader = self->_resourceLoader;
  p_resourceLoader = &self->_resourceLoader;
  if (resourceLoader != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_resourceLoader, a3);
    v5 = v8;
  }

}

- (void)_setTextLayoutCache:(id)a3
{
  SKUILayoutCache *v5;
  SKUILayoutCache **p_textLayoutCache;
  SKUILayoutCache *textLayoutCache;
  SKUILayoutCache *v8;

  v5 = (SKUILayoutCache *)a3;
  textLayoutCache = self->_textLayoutCache;
  p_textLayoutCache = &self->_textLayoutCache;
  if (textLayoutCache != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_textLayoutCache, a3);
    v5 = v8;
  }

}

- (SKUIMetricsImpressionSession)activeMetricsImpressionSession
{
  return self->_activeMetricsImpressionSession;
}

- (double)activePageWidth
{
  return self->_activePageWidth;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)defaultPinningTransitionStyle
{
  return self->_defaultPinningTransitionStyle;
}

- (double)landscapePageWidth
{
  return self->_landscapePageWidth;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SKUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (SKUIStorePageSectionsViewController)parentViewController
{
  return (SKUIStorePageSectionsViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (double)portraitPageWidth
{
  return self->_portraitPageWidth;
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (SKUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStorePageSectionContext init]";
}

@end
