@implementation SKUIViewElementLayoutContext

- (id)_initSKUIViewElementLayoutContext
{
  SKUIViewElementLayoutContext *v3;
  uint64_t v4;
  NSMapTable *editorialLayouts;
  NSMutableSet *v6;
  NSMutableSet *observedArtworkRequestIDs;
  uint64_t v8;
  UIColor *placeholderColor;
  uint64_t v10;
  NSMapTable *blurColors;
  SKUIItemOfferButton *v12;
  SKUIItemOfferButton *itemOfferButton;
  NSMutableDictionary *v14;
  NSMutableDictionary *itemOfferButtonSizes;
  void *v16;
  objc_super v18;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewElementLayoutContext _initSKUIViewElementLayoutContext].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIViewElementLayoutContext;
  v3 = -[SKUIViewElementLayoutContext init](&v18, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    editorialLayouts = v3->_editorialLayouts;
    v3->_editorialLayouts = (NSMapTable *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observedArtworkRequestIDs = v3->_observedArtworkRequestIDs;
    v3->_observedArtworkRequestIDs = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();
    placeholderColor = v3->_placeholderColor;
    v3->_placeholderColor = (UIColor *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    blurColors = v3->_blurColors;
    v3->_blurColors = (NSMapTable *)v10;

    v12 = objc_alloc_init(SKUIItemOfferButton);
    itemOfferButton = v3->_itemOfferButton;
    v3->_itemOfferButton = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemOfferButtonSizes = v3->_itemOfferButtonSizes;
    v3->_itemOfferButtonSizes = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v3, sel__artworkRequestDidLoadImageNotification_, CFSTR("SKUIArtworkRequestDidLoadImageNotification"), 0);

  }
  return v3;
}

- (SKUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3
{
  return -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:](self, "initWithStorePageSectionContext:previousLayoutContext:", a3, 0);
}

- (SKUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3 previousLayoutContext:(id)a4
{
  id v6;
  _QWORD *v7;
  SKUIViewElementLayoutContext *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSMutableSet *observedArtworkRequestIDs;
  void *v15;
  void *v16;
  void *v17;
  SKUIViewElementTextLayoutCache *v18;
  void *v19;
  uint64_t v20;
  SKUIViewElementTextLayoutCache *labelLayoutCache;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  v8 = -[SKUIViewElementLayoutContext _initSKUIViewElementLayoutContext](self, "_initSKUIViewElementLayoutContext");
  if (v8)
  {
    objc_msgSend(v6, "resourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "resourceLoader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v9)
      {
        v11 = (void *)v7[12];
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(v12, "mutableCopy");
          observedArtworkRequestIDs = v8->_observedArtworkRequestIDs;
          v8->_observedArtworkRequestIDs = (NSMutableSet *)v13;

        }
      }
    }
    objc_msgSend(v7, "labelLayoutCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLayoutCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v16)
    {
      objc_storeStrong((id *)&v8->_labelLayoutCache, v15);
      -[SKUIViewElementTextLayoutCache invalidateLayoutsForUpdatedElements](v8->_labelLayoutCache, "invalidateLayoutsForUpdatedElements");
    }
    else
    {
      v18 = [SKUIViewElementTextLayoutCache alloc];
      objc_msgSend(v6, "textLayoutCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v18, "initWithLayoutCache:", v19);
      labelLayoutCache = v8->_labelLayoutCache;
      v8->_labelLayoutCache = (SKUIViewElementTextLayoutCache *)v20;

    }
    objc_msgSend(v6, "activePageWidth");
    -[SKUIViewElementLayoutContext setActivePageWidth:](v8, "setActivePageWidth:");
    objc_msgSend(v6, "clientContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v8, "setClientContext:", v22);

    objc_msgSend(v6, "parentViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setParentViewController:](v8, "setParentViewController:", v23);
    objc_msgSend(v6, "placeholderColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setPlaceholderColor:](v8, "setPlaceholderColor:", v24);

    -[SKUIViewElementLayoutContext setResourceLoader:](v8, "setResourceLoader:", v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v23, "navigationController");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;
    objc_msgSend(v25, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_backdropViewLayerGroupName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setBackdropGroupName:](v8, "setBackdropGroupName:", v28);

    objc_msgSend(v6, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tintColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setTintColor:](v8, "setTintColor:", v30);

    objc_msgSend(v29, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "displayScale");
    -[SKUIViewElementLayoutContext setDisplayScale:](v8, "setDisplayScale:");
    -[SKUIViewElementLayoutContext setLargeScreenElementPaddingFromContext:](v8, "setLargeScreenElementPaddingFromContext:", v6);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SKUIArtworkRequestDidLoadImageNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIViewElementLayoutContext;
  -[SKUIViewElementLayoutContext dealloc](&v4, sel_dealloc);
}

- (NSCache)placeholderImageCache
{
  return -[SKUIClientContext placeholderImageCache](self->_clientContext, "placeholderImageCache");
}

+ (double)itemWidthForElement:(id)a3 withDefaultWidth:(double)a4 fitWidth:(double)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWidth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_calculateValueFromString:withDefault:coefficent:", v9, a4, a5);
  v11 = v10;

  return v11;
}

- (id)aggregateValueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_aggregateValues, "objectForKey:", a3);
}

- (SKUIBadgeTextAttachmentLoader)badgeImageLoader
{
  SKUIBadgeTextAttachmentLoader *badgeImageLoader;
  SKUIBadgeTextAttachmentLoader *v4;
  SKUIBadgeTextAttachmentLoader *v5;

  badgeImageLoader = self->_badgeImageLoader;
  if (!badgeImageLoader)
  {
    v4 = -[SKUIBadgeTextAttachmentLoader initWithResourceLoader:]([SKUIBadgeTextAttachmentLoader alloc], "initWithResourceLoader:", self->_resourceLoader);
    v5 = self->_badgeImageLoader;
    self->_badgeImageLoader = v4;

    badgeImageLoader = self->_badgeImageLoader;
  }
  return badgeImageLoader;
}

- (id)blurColorForCacheKey:(id)a3
{
  if (!a3)
    return 0;
  -[NSMapTable objectForKey:](self->_blurColors, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  MPUBorderDrawingCache *borderDrawingCache;
  uint64_t v4;
  MPUBorderDrawingCache *v5;
  MPUBorderDrawingCache *v6;

  borderDrawingCache = self->_borderDrawingCache;
  if (!borderDrawingCache)
  {
    v4 = SKUIMPUFoundationFramework();
    v5 = (MPUBorderDrawingCache *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("MPUBorderDrawingCache"), v4));
    v6 = self->_borderDrawingCache;
    self->_borderDrawingCache = v5;

    borderDrawingCache = self->_borderDrawingCache;
  }
  return borderDrawingCache;
}

- (double)defaultItemWidthForViewElement:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "floatValue"), v6 >= 0.00000011921))
  {
    v7 = v6;
  }
  else if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    v7 = 335.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    if (v10 == 3.0)
    {
      v7 = 270.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12 > 320.0;

      v7 = dbl_1BBED20F0[v13];
    }
  }

  return v7;
}

- (double)displayScale
{
  double result;
  void *v3;
  double v4;
  double v5;

  result = self->_displayScale;
  if (result <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    return v5;
  }
  return result;
}

- (id)editorialLayoutForLabelElement:(id)a3 width:(double)a4
{
  id v6;
  SKUIEditorialLayout *v7;
  SKUIEditorialComponent *v8;
  SKUIEditorialLayout *v9;
  void *v10;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v6);
  v7 = (SKUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[SKUIEditorialComponent initWithViewElement:]([SKUIEditorialComponent alloc], "initWithViewElement:", v6);
    v9 = [SKUIEditorialLayout alloc];
    -[SKUIViewElementTextLayoutCache layoutCache](self->_labelLayoutCache, "layoutCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIEditorialLayout initWithEditorial:layoutCache:](v9, "initWithEditorial:layoutCache:", v8, v10);

    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v7, "setLayoutWidth:forOrientation:", 0, a4);
    -[NSMapTable setObject:forKey:](self->_editorialLayouts, "setObject:forKey:", v7, v6);

  }
  return v7;
}

- (void)expandEditorialForLabelElement:(id)a3
{
  void *v4;
  NSHashTable *expandedEditorialLayouts;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;

  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    expandedEditorialLayouts = self->_expandedEditorialLayouts;
    v8 = v4;
    if (!expandedEditorialLayouts)
    {
      v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 1);
      v7 = self->_expandedEditorialLayouts;
      self->_expandedEditorialLayouts = v6;

      expandedEditorialLayouts = self->_expandedEditorialLayouts;
    }
    -[NSHashTable addObject:](expandedEditorialLayouts, "addObject:", v8);
    v4 = v8;
  }

}

- (id)imageResourceCacheKeyForArtwork:(id)a3
{
  return (id)objc_msgSend(a3, "URL");
}

- (id)imageResourceCacheKeyForViewElement:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "elementType");
  v5 = 0;
  if (v4 <= 48)
  {
    if (v4 == 7)
    {
      objc_msgSend(v3, "firstChildForElementType:", 49);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v4 != 8)
      goto LABEL_14;
    objc_msgSend(v3, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v5 = (void *)v7;
    goto LABEL_14;
  }
  switch(v4)
  {
    case 49:
      objc_msgSend(v3, "resourceCacheKey");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 50:
      objc_msgSend(v3, "buttonImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 152:
      objc_msgSend(v3, "thumbnailImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v8 = v6;
      objc_msgSend(v6, "resourceCacheKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
LABEL_14:

  return v5;
}

- (void)invalidateAllEditorialLayouts
{
  -[NSMapTable removeAllObjects](self->_editorialLayouts, "removeAllObjects");
}

- (BOOL)isEditorialLayoutExpanded:(id)a3
{
  return -[NSHashTable containsObject:](self->_expandedEditorialLayouts, "containsObject:", a3);
}

- (BOOL)loadImageForArtwork:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SKUIViewElementLayoutContext loadImageForArtwork:dataConsumer:reason:](self, "loadImageForArtwork:dataConsumer:reason:", v6, v7, a4);

  return a4;
}

- (BOOL)loadImageForArtwork:(id)a3 dataConsumer:(id)a4 reason:(int64_t)a5
{
  id v8;
  void *v9;
  BOOL v10;

  v8 = a4;
  objc_msgSend(a3, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[SKUIViewElementLayoutContext _loadImageForURL:cacheKey:dataConsumer:reason:](self, "_loadImageForURL:cacheKey:dataConsumer:reason:", v9, v9, v8, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)loadImageForBadgeElement:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageMaskColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[SKUIViewElementLayoutContext loadTemplatedImageForBadgeElement:reason:](self, "loadTemplatedImageForBadgeElement:reason:", v6, a4);
  }
  else if (v7)
  {
    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIViewElementLayoutContext _loadImageForURL:cacheKey:dataConsumer:reason:](self, "_loadImageForURL:cacheKey:dataConsumer:reason:", v7, v7, v11, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)loadTemplatedImageForBadgeElement:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[SSVURLDataConsumer consumer](SKUITemplatedBadgeImageConsumer, "consumer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageMaskColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "color");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "colorType") == 1 || !v11)
      {
        -[SKUIViewElementLayoutContext tintColor](self, "tintColor");
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }
      objc_msgSend(v8, "setTemplateColor:", v11);
      v13 = (uint64_t)v8;
    }
    else
    {
      +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v13;
    }
    v14 = -[SKUIViewElementLayoutContext _loadImageForURL:cacheKey:dataConsumer:reason:](self, "_loadImageForURL:cacheKey:dataConsumer:reason:", v7, v7, v13, a4);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SKUIViewElementLayoutContext dataConsumerForImageElement:](self, "dataConsumerForImageElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SKUIViewElementLayoutContext loadImageForImageElement:reason:dataConsumer:](self, "loadImageForImageElement:reason:dataConsumer:", v6, a4, v7);

  return a4;
}

- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4 dataConsumer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceCacheKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SKUIViewElementLayoutContext _loadImageForURL:cacheKey:dataConsumer:reason:](self, "_loadImageForURL:cacheKey:dataConsumer:reason:", v11, v12, v9, a4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dataConsumerForImageElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKUIStyledImageDataConsumer *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageMaskColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SSVURLDataConsumer consumer](SKUITemplatedBadgeImageConsumer, "consumer");
    v7 = (SKUIStyledImageDataConsumer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "colorType") == 1 || !v8)
    {
      -[SKUIViewElementLayoutContext tintColor](self, "tintColor");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    -[SKUIStyledImageDataConsumer setTemplateColor:](v7, "setTemplateColor:", v8);

  }
  else
  {
    v7 = -[SKUIStyledImageDataConsumer initWithViewElement:]([SKUIStyledImageDataConsumer alloc], "initWithViewElement:", v4);
    -[SKUIViewElementLayoutContext _sizeForImageElement:applyTransform:](self, "_sizeForImageElement:applyTransform:", v4, 0);
    -[SKUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:");
  }

  return v7;
}

- (id)placeholderImageForImageElement:(id)a3 dataConsumer:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  SKUIPlaceholderImageKey *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  -[SKUIViewElementLayoutContext _sizeForImageElement:applyTransform:](self, "_sizeForImageElement:applyTransform:", v7, 0);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageTreatment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SKUIImageTreatmentForString(v13);

  objc_msgSend(v7, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imagePlaceholderBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "colorType") != 4)
  {
    v18 = -[SKUIPlaceholderImageKey initWithSize:imageTreatment:placeholderBackgroundColor:]([SKUIPlaceholderImageKey alloc], "initWithSize:imageTreatment:placeholderBackgroundColor:", v14, v16, v9, v11);
    -[SKUIViewElementLayoutContext placeholderImageCache](self, "placeholderImageCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v16, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v6, "imageForColor:", self->_placeholderColor);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_7;
        goto LABEL_6;
      }
      objc_msgSend(v16, "color");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageForColor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageWithRenderingMode:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
LABEL_6:
        -[SKUIViewElementLayoutContext placeholderImageCache](self, "placeholderImageCache");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v17, v18);

      }
    }
LABEL_7:

    goto LABEL_8;
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (int64_t)maxWidthForElement:(id)a3 withDefaultWidth:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  int64_t v8;

  objc_msgSend(a3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_calculateValueFromString:withDefault:coefficent:", v6, (double)a4, (double)a4);
  if (v7 < 0.0)
    v7 = -v7;
  v8 = (uint64_t)v7;

  return v8;
}

- (id)placeholderImageForSize:(CGSize)a3
{
  double height;
  double width;
  SKUIPlaceholderImageKey *v6;
  void *v7;
  void *v8;
  SKUIStyledImageDataConsumer *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  v6 = -[SKUIPlaceholderImageKey initWithSize:imageTreatment:placeholderBackgroundColor:]([SKUIPlaceholderImageKey alloc], "initWithSize:imageTreatment:placeholderBackgroundColor:", 0, 0, a3.width, a3.height);
  -[SKUIViewElementLayoutContext placeholderImageCache](self, "placeholderImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(SKUIStyledImageDataConsumer);
    -[SKUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:", width, height);
    -[SKUIStyledImageDataConsumer setImageTreatment:](v9, "setImageTreatment:", 0);
    -[SKUIStyledImageDataConsumer imageForColor:](v9, "imageForColor:", self->_placeholderColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SKUIViewElementLayoutContext placeholderImageCache](self, "placeholderImageCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v8, v6);

    }
  }

  return v8;
}

- (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  __objc2_class *v9;
  uint64_t v10;
  char v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  v8 = 0;
  if (v7 <= 61)
  {
    switch(v7)
    {
      case '(':
        v9 = SKUIFilterBarView;
        goto LABEL_17;
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
        goto LABEL_19;
      case '0':
        v9 = SKUISectionHeaderView;
        goto LABEL_17;
      case '1':
        v11 = -[SKUIViewElementLayoutContext loadImageForImageElement:reason:](self, "loadImageForImageElement:reason:", v6, a4);
        goto LABEL_18;
      case '2':
        objc_msgSend(v6, "buttonImage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case '3':
        v9 = SKUIImageDeckView;
        goto LABEL_17;
      default:
        if (v7 != 8)
          goto LABEL_19;
        v11 = -[SKUIViewElementLayoutContext loadImageForBadgeElement:reason:](self, "loadImageForBadgeElement:reason:", v6, a4);
        break;
    }
    goto LABEL_18;
  }
  switch(v7)
  {
    case 62:
      v9 = SKUIHorizontalListView;
LABEL_17:
      v11 = -[__objc2_class prefetchResourcesForViewElement:reason:context:](v9, "prefetchResourcesForViewElement:reason:context:", v6, a4, self);
LABEL_18:
      v8 = v11;
      break;
    case 77:
      v9 = SKUIOfferView;
      goto LABEL_17;
    case 152:
      objc_msgSend(v6, "thumbnailImage");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v12 = (void *)v10;
      v8 = -[SKUIViewElementLayoutContext loadImageForImageElement:reason:](self, "loadImageForImageElement:reason:", v10, a4);

      break;
  }
LABEL_19:

  return v8;
}

- (id)requestIdentifierForArtwork:(id)a3
{
  void *v4;
  void *v5;

  -[SKUIViewElementLayoutContext imageResourceCacheKeyForArtwork:](self, "imageResourceCacheKeyForArtwork:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext requestIdentifierForResourceCacheKey:](self, "requestIdentifierForResourceCacheKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestIdentifierForResourceCacheKey:(id)a3
{
  if (!a3)
    return 0;
  -[SKUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestIdentifierForViewElement:(id)a3
{
  void *v4;
  void *v5;

  -[SKUIViewElementLayoutContext imageResourceCacheKeyForViewElement:](self, "imageResourceCacheKeyForViewElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext requestIdentifierForResourceCacheKey:](self, "requestIdentifierForResourceCacheKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAggregateValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *aggregateValues;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  aggregateValues = self->_aggregateValues;
  if (v12)
  {
    if (!aggregateValues)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_aggregateValues;
      self->_aggregateValues = v10;

      v7 = v12;
      aggregateValues = self->_aggregateValues;
    }
    -[NSMutableDictionary setObject:forKey:](aggregateValues, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](aggregateValues, "removeObjectForKey:", v8);
  }

}

- (void)setBlurColor:(id)a3 cacheKey:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMapTable setObject:forKey:](self->_blurColors, "setObject:forKey:");
  }
}

- (void)setLargeScreenElementPaddingFromContext:(id)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a3;
  v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&self->_largeScreenElementPadding.top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&self->_largeScreenElementPadding.bottom = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.Music"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v24, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v25.origin.x = v10;
    v25.origin.y = v12;
    v25.size.width = v14;
    v25.size.height = v16;
    if (CGRectGetHeight(v25) >= 1024.0)
    {
      v26.origin.x = v10;
      v26.origin.y = v12;
      v26.size.width = v14;
      v26.size.height = v16;
      if (CGRectGetWidth(v26) >= 1024.0)
      {
        __asm { FMOV            V0.2D, #20.0 }
        *(_OWORD *)&self->_largeScreenElementPadding.top = _Q0;
        *(_OWORD *)&self->_largeScreenElementPadding.bottom = _Q0;
      }
    }
    objc_msgSend(v24, "activePageWidth");
    if (v22 == 455.0 || (objc_msgSend(v24, "activePageWidth"), v23 == 341.0))
    {
      *(_OWORD *)&self->_largeScreenElementPadding.top = xmmword_1BBED2100;
      *(_OWORD *)&self->_largeScreenElementPadding.bottom = xmmword_1BBED2110;
    }
  }

}

- (CGSize)sizeForBadgeElement:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "size");
  v6 = v5;
  v7 = v4;
  if (v5 == *MEMORY[0x1E0C9D820] && v4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v3, "resourceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (SKUIImageWithResourceName(v9), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v3, "fallbackImage"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v11, "size");
      v6 = v12;
      v7 = v13;

    }
  }

  v14 = v6;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeForImageElement:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SKUIViewElementLayoutContext _sizeForImageElement:applyTransform:](self, "_sizeForImageElement:applyTransform:", a3, 1);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeForItemOfferButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  SKUISizeValue *v18;
  SKUISizeValue *v19;
  double v20;
  double v21;
  void *v22;
  SKUISizeValue *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "buttonText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "itemIdentifier");
  if (v7)
  {
    v8 = v7;
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stateForItemWithIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "state") & 3) != 0)
    {

      v11 = 26.0;
      v12 = 26.0;
      goto LABEL_18;
    }
    if (objc_msgSend(v10, "state"))
    {
      objc_msgSend(v4, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("supportsPlayButton"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if ((v16 & 1) == 0)
      {
        +[SKUIItemOfferButton localizedTitleForItemState:clientContext:](SKUIItemOfferButton, "localizedTitleForItemState:clientContext:", v10, self->_clientContext);
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v17;
      }
    }

  }
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_itemOfferButtonSizes, "objectForKey:", v6);
    v18 = (SKUISizeValue *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v18;
      -[SKUISizeValue size](v18, "size");
      v12 = v20;
      v11 = v21;
    }
    else
    {
      -[SKUIItemOfferButton setImage:](self->_itemOfferButton, "setImage:", 0);
      -[SKUIItemOfferButton setTitle:](self->_itemOfferButton, "setTitle:", v6);
      -[SKUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v12 = v28;
      v11 = v29;
      v19 = -[SKUISizeValue initWithSize:]([SKUISizeValue alloc], "initWithSize:", v28, v29);
      -[NSMutableDictionary setObject:forKey:](self->_itemOfferButtonSizes, "setObject:forKey:", v19, v6);
    }

  }
  else if (objc_msgSend(v4, "buttonViewType") == 3)
  {
    v22 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
    if (!sizeForItemOfferButton__sDownloadButtonSize)
    {
      -[SKUIItemOfferButton setTitle:](self->_itemOfferButton, "setTitle:", 0);
      -[SKUIItemOfferButton showCloudImage](self->_itemOfferButton, "showCloudImage");
      v23 = [SKUISizeValue alloc];
      -[SKUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v24 = -[SKUISizeValue initWithSize:](v23, "initWithSize:");
      v25 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
      sizeForItemOfferButton__sDownloadButtonSize = v24;

      v22 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
    }
    objc_msgSend(v22, "size");
    v12 = v26;
    v11 = v27;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
LABEL_18:

  v30 = v12;
  v31 = v11;
  result.height = v31;
  result.width = v30;
  return result;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  __objc2_class *v10;
  double v11;
  double v12;
  SKUIButtonBorderStyle *v13;
  void *v14;
  SKUIButtonBorderStyle *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  SKUIButtonBorderStyle *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGSize result;

  v6 = a3;
  v8 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v9 = objc_msgSend(v6, "elementType");
  if (v9 <= 76)
  {
    if (v9 > 39)
    {
      switch(v9)
      {
        case '(':
          v10 = SKUIFilterBarView;
          goto LABEL_49;
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
          goto LABEL_68;
        case '0':
          v10 = SKUISectionHeaderView;
          goto LABEL_49;
        case '1':
          -[SKUIViewElementLayoutContext _sizeForImageElement:applyTransform:](self, "_sizeForImageElement:applyTransform:", v6, 1);
          goto LABEL_50;
        case '2':
          objc_msgSend(v6, "buttonImage");
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_52;
        case '3':
          v10 = SKUIImageDeckView;
          goto LABEL_49;
        default:
          if (v9 == 62)
          {
            v10 = SKUIHorizontalListView;
            goto LABEL_49;
          }
          if (v9 != 69)
            goto LABEL_68;
          objc_msgSend(v6, "titleItem");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[SKUIViewElementTextLayoutCache sizeForViewElement:width:](self->_labelLayoutCache, "sizeForViewElement:width:", v20, a4);
          break;
      }
      goto LABEL_54;
    }
    if (v9 <= 12)
    {
      if (v9 == 8)
      {
        v20 = v6;
        if (objc_msgSend(v20, "badgeType") == 1)
        {
          -[SKUIViewElementTextLayoutCache layoutForWidth:viewElement:](self->_labelLayoutCache, "layoutForWidth:viewElement:", (uint64_t)a4, v20);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            +[SKUIAttributedStringView sizeWithLayout:treatment:](SKUIAttributedStringView, "sizeWithLayout:treatment:", v33, 1);
            v8 = v34;
            v7 = v35;
          }

          goto LABEL_67;
        }
        -[SKUIViewElementLayoutContext sizeForBadgeElement:](self, "sizeForBadgeElement:", v20);
LABEL_54:
        v8 = v21;
        v7 = v22;
LABEL_67:

        goto LABEL_68;
      }
      if (v9 == 12)
      {
        -[SKUIViewElementTextLayoutCache sizeForButton:width:](self->_labelLayoutCache, "sizeForButton:width:", v6, a4);
        v8 = v11;
        v7 = v12;
        switch(objc_msgSend(v6, "buttonViewType"))
        {
          case 0:
          case 8:
          case 10:
          case 11:
          case 13:
            v13 = [SKUIButtonBorderStyle alloc];
            objc_msgSend(v6, "style");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[SKUIButtonBorderStyle initWithElementStyle:](v13, "initWithElementStyle:", v14);

            +[SKUIStyledButton sizeForTextSize:buttonType:borderStyle:](SKUIStyledButton, "sizeForTextSize:buttonType:borderStyle:", 0, v15, v8, v7);
            v8 = v16;
            v7 = v17;
            goto LABEL_76;
          case 1:
            v45 = v8;
            v46 = v7;
            v47 = 3;
            goto LABEL_72;
          case 6:
            v48 = [SKUIButtonBorderStyle alloc];
            objc_msgSend(v6, "style");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[SKUIButtonBorderStyle initWithElementStyle:](v48, "initWithElementStyle:", v49);

            +[SKUIStyledButton sizeForTextSize:buttonType:borderStyle:](SKUIStyledButton, "sizeForTextSize:buttonType:borderStyle:", +[SKUIStyledButton buttonTypeForElement:](SKUIStyledButton, "buttonTypeForElement:", v6), v15, v8, v7);
            v51 = v50;
            v53 = v52;
            objc_msgSend(v6, "style");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "elementPadding");
            v56 = v55;
            v58 = v57;
            v60 = v59;
            v62 = v61;

            v8 = v51 + v58 + v62;
            v7 = v53 + v56 + v60;
            goto LABEL_76;
          case 7:
            v45 = v8;
            v46 = v7;
            v47 = 4;
LABEL_72:
            +[SKUIStyledButton sizeForTextSize:buttonType:](SKUIStyledButton, "sizeForTextSize:buttonType:", v47, v45, v46);
            goto LABEL_50;
          case 12:
            v10 = SKUIPlayButton;
            goto LABEL_49;
          default:
            goto LABEL_68;
        }
      }
      goto LABEL_68;
    }
    if (v9 != 13)
    {
      if (v9 == 32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (SKUIButtonBorderStyle *)v6;
          if (-[SKUIButtonBorderStyle dividerType](v15, "dividerType") == 3)
          {
            -[SKUIButtonBorderStyle style](v15, "style");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "itemHeight");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v24, "floatValue");
              v7 = v25;
            }
            else
            {
              v7 = 10.0;
            }

            v8 = 0.0;
          }
LABEL_76:

        }
      }
      goto LABEL_68;
    }
    -[SKUIViewElementLayoutContext sizeForItemOfferButton:](self, "sizeForItemOfferButton:", v6);
LABEL_50:
    v8 = v18;
    v7 = v19;
    goto LABEL_68;
  }
  if (v9 > 134)
  {
    switch(v9)
    {
      case 135:
        v10 = SKUIStarRatingViewElementView;
        goto LABEL_49;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_68;
      case 138:
        -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v26, "layoutHeightForOrientation:expanded:", 0, -[SKUIViewElementLayoutContext isEditorialLayoutExpanded:](self, "isEditorialLayoutExpanded:", v26));
          v7 = v27;
        }
        else
        {
          -[SKUIViewElementTextLayoutCache estimatedSizeForLabel:width:](self->_labelLayoutCache, "estimatedSizeForLabel:width:", v6, a4);
          a4 = v36;
          v7 = v37;
        }

        v8 = a4;
        goto LABEL_68;
      case 141:
        v20 = v6;
        v28 = objc_msgSend(v20, "itemIdentifier");
        if (v28)
        {
          v29 = v28;
          +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stateForItemWithIdentifier:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v20, "storeIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
            goto LABEL_60;
          +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "storeIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stateForItemWithStoreIdentifier:", v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
LABEL_60:
        if (+[SKUIStyledButton usesItemOfferAppearanceForButtonType:itemState:](SKUIStyledButton, "usesItemOfferAppearanceForButtonType:itemState:", 1, v31))
        {
          -[SKUIViewElementLayoutContext sizeForItemOfferButton:](self, "sizeForItemOfferButton:", v20);
        }
        else
        {
          if (a4 < 0.00000011920929)
          {
            -[SKUIViewElementLayoutContext sizeForItemOfferButton:](self, "sizeForItemOfferButton:", v20);
            v7 = v41;
            v8 = v42 + -20.0;
            goto LABEL_66;
          }
          -[SKUIViewElementTextLayoutCache sizeForButton:width:](self->_labelLayoutCache, "sizeForButton:width:", v20, a4);
          +[SKUIStyledButton sizeForTextSize:buttonType:](SKUIStyledButton, "sizeForTextSize:buttonType:", 1);
        }
        v8 = v39;
        v7 = v40;
LABEL_66:

        goto LABEL_67;
      case 144:
        v10 = SKUITomatoRatingView;
        goto LABEL_49;
      default:
        if (v9 == 152)
        {
          objc_msgSend(v6, "thumbnailImage");
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_52:
          v20 = (id)v32;
          -[SKUIViewElementLayoutContext _sizeForImageElement:applyTransform:](self, "_sizeForImageElement:applyTransform:", v32, 1);
          goto LABEL_54;
        }
        if (v9 != 154)
          goto LABEL_68;
        v10 = SKUIImageGridView;
        break;
    }
    goto LABEL_49;
  }
  if (v9 <= 108)
  {
    if (v9 != 77)
    {
      if (v9 != 80)
        goto LABEL_68;
      -[SKUIViewElementTextLayoutCache estimatedSizeForOrdinal:width:](self->_labelLayoutCache, "estimatedSizeForOrdinal:width:", v6, a4);
      goto LABEL_50;
    }
    v10 = SKUIOfferView;
LABEL_49:
    -[__objc2_class sizeThatFitsWidth:viewElement:context:](v10, "sizeThatFitsWidth:viewElement:context:", v6, self, a4);
    goto LABEL_50;
  }
  if (v9 == 109)
  {
    v8 = 0.0;
    v7 = 29.0;
    goto LABEL_68;
  }
  if (v9 == 131)
  {
    v10 = SKUIStackListCollectionViewCell;
    goto LABEL_49;
  }
LABEL_68:

  v43 = v8;
  v44 = v7;
  result.height = v44;
  result.width = v43;
  return result;
}

- (id)textPropertiesForViewElement:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKUIViewTextProperties *v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  if (v7 == 138)
  {
    -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "bodyTextLayoutForOrientation:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SKUIViewTextProperties initWithTextLayout:isExpanded:]([SKUIViewTextProperties alloc], "initWithTextLayout:isExpanded:", v11, -[SKUIViewElementLayoutContext isEditorialLayoutExpanded:](self, "isEditorialLayoutExpanded:", v10));
LABEL_10:
        v8 = v12;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      -[SKUIViewElementTextLayoutCache layoutForWidth:viewElement:](self->_labelLayoutCache, "layoutForWidth:viewElement:", (uint64_t)a4, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SKUIViewTextProperties initWithStringLayout:]([SKUIViewTextProperties alloc], "initWithStringLayout:", v11);
        goto LABEL_10;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  if (v7 == 135)
  {
    +[SKUIStarRatingViewElementView textPropertiesForViewElement:width:context:](SKUIStarRatingViewElementView, "textPropertiesForViewElement:width:context:", v6, self, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)transientRequestIdentifierForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  switch(v5)
  {
    case 152:
      objc_msgSend(v4, "thumbnailImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 50:
      objc_msgSend(v4, "buttonImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 49:
      objc_msgSend(v4, "transientResourceCacheKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_5;
LABEL_9:
      -[SKUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    default:
      goto LABEL_5;
  }
  v9 = v8;
  objc_msgSend(v8, "transientResourceCacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_9;
LABEL_5:
  v7 = 0;
LABEL_10:

  return v7;
}

- (void)_artworkRequestDidLoadImageNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v4, "requestIdentifier"));
  if (-[NSMutableSet containsObject:](self->_observedArtworkRequestIDs, "containsObject:", v5))
  {
    objc_msgSend(v9, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SKUIArtworkRequestImageKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_artworkRequestDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "artworkRequest:didLoadImage:", v4, v7);

    }
    -[NSMutableSet removeObject:](self->_observedArtworkRequestIDs, "removeObject:", v5);

  }
}

+ (double)_calculateValueFromString:(id)a3 withDefault:(double)a4 coefficent:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v14;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v9);
    v14 = 0.0;
    a4 = 0.0;
    if (objc_msgSend(v10, "scanDouble:", &v14))
    {
      v11 = objc_msgSend(v10, "scanString:intoString:", CFSTR("%"), 0);
      a4 = v14;
      if (v14 > 0.0 && v11 != 0)
        a4 = floor(v14 * a5 / 100.0);
    }

  }
  return a4;
}

- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  SKUIArtworkRequest *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SKUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13
    && -[SKUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", a6, objc_msgSend(v13, "unsignedIntegerValue")))
  {
    -[NSMutableSet addObject:](self->_observedArtworkRequestIDs, "addObject:", v14);
    v15 = 0;
  }
  else
  {
    v16 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIResourceRequest setCacheKey:](v16, "setCacheKey:", v11);
    -[SKUIArtworkRequest setDataConsumer:](v16, "setDataConsumer:", v12);
    -[SKUIArtworkRequest setURL:](v16, "setURL:", v10);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v16, "requestIdentifier"));
    -[NSMutableSet addObject:](self->_observedArtworkRequestIDs, "addObject:", v17);
    v15 = -[SKUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v16, a6);

  }
  return v15;
}

- (CGSize)_sizeForImageElement:(id)a3 applyTransform:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "size");
  v8 = v7;
  v9 = v6;
  if (v7 == *MEMORY[0x1E0C9D820] && v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v5, "resourceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      SKUIImageWithResourceName(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v13, "size");
        v8 = v15;
        v9 = v16;

      }
    }

  }
  objc_msgSend(v5, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v4 && v17)
  {
    objc_msgSend(v17, "transform");
    v19 = v9 * v24 + v22 * v8;
    v9 = fabs(floor(v9 * v25 + v23 * v8));
    v8 = fabs(floor(v19));
  }

  v20 = v8;
  v21 = v9;
  result.height = v21;
  result.width = v20;
  return result;
}

- (double)activePageWidth
{
  return self->_activePageWidth;
}

- (void)setActivePageWidth:(double)a3
{
  self->_activePageWidth = a3;
}

- (SKUIArtworkRequestDelegate)artworkRequestDelegate
{
  return (SKUIArtworkRequestDelegate *)objc_loadWeakRetained((id *)&self->_artworkRequestDelegate);
}

- (void)setArtworkRequestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_artworkRequestDelegate, a3);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (unint64_t)containerViewElementType
{
  return self->_containerViewElementType;
}

- (void)setContainerViewElementType:(unint64_t)a3
{
  self->_containerViewElementType = a3;
}

- (SKUIViewElementTextLayoutCache)labelLayoutCache
{
  return self->_labelLayoutCache;
}

- (void)setLabelLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_labelLayoutCache, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void)setPlaceholderColor:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIEdgeInsets)largeScreenElementPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_largeScreenElementPadding.top;
  left = self->_largeScreenElementPadding.left;
  bottom = self->_largeScreenElementPadding.bottom;
  right = self->_largeScreenElementPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_artworkRequestDelegate);
  objc_storeStrong((id *)&self->_blurColors, 0);
  objc_storeStrong((id *)&self->_observedArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonSizes, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_expandedEditorialLayouts, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_badgeImageLoader, 0);
  objc_storeStrong((id *)&self->_aggregateValues, 0);
}

- (void)_initSKUIViewElementLayoutContext
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewElementLayoutContext _initSKUIViewElementLayoutContext]";
}

@end
