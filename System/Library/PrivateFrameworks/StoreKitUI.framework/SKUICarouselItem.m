@implementation SKUICarouselItem

- (SKUICarouselItem)initWithComponentContext:(id)a3
{
  id v4;
  SKUICarouselItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKUILink *v10;
  SKUILink *link;
  uint64_t v12;
  NSString *accessibilityLabel;
  void *v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  SKUIArtworkProviding *artworkProvider;
  objc_super v24;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselItem initWithComponentContext:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICarouselItem;
  v5 = -[SKUICarouselItem init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_carouselItemIdentifier = objc_msgSend(v7, "longLongValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("link"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v9, "setComponentDictionary:", v8);
      v10 = -[SKUILink initWithComponentContext:]([SKUILink alloc], "initWithComponentContext:", v9);
      link = v5->_link;
      v5->_link = v10;

      -[SKUILink title](v5->_link, "title");
      v12 = objc_claimAutoreleasedReturnValue();
      accessibilityLabel = v5->_accessibilityLabel;
      v5->_accessibilityLabel = (NSString *)v12;

      if (!v5->_accessibilityLabel)
      {
        -[SKUILink item](v5->_link, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v15;

      }
    }
    if (v5->_accessibilityLabel)
    {
      v17 = v7;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("designLabel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v17, "copy");
        v19 = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v18;

      }
    }
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAFAD0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SKUIArtworkProviding *)v21;

  }
  return v5;
}

- (id)artworkForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  uint64_t v8;

  height = a3.height;
  width = a3.width;
  v6 = *(double *)&artworkForSize__sScreenScale;
  if (*(double *)&artworkForSize__sScreenScale < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(double *)&artworkForSize__sScreenScale);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    artworkForSize__sScreenScale = v8;

    v6 = *(double *)&artworkForSize__sScreenScale;
  }
  return (id)-[SKUIArtworkProviding preferredExactArtworkForSize:](self->_artworkProvider, "preferredExactArtworkForSize:", width * v6, height * v6);
}

- (void)_setLinkItem:(id)a3
{
  -[SKUILink _setItem:](self->_link, "_setItem:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUICarouselItem;
  -[SKUICarouselItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: \"%@\", %@"), v4, self->_accessibilityLabel, self->_link);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int64_t)carouselItemIdentifier
{
  return self->_carouselItemIdentifier;
}

- (SKUILink)link
{
  return self->_link;
}

- (SKUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_artworkProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)initWithComponentContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICarouselItem initWithComponentContext:]";
}

@end
