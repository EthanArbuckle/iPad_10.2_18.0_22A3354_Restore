@implementation SKUIMediaComponent

- (SKUIMediaComponent)initWithArtwork:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIMediaComponent *v13;
  SKUIMediaComponent *v14;
  SKUIArtworkList *v15;
  SKUIArtworkProviding *thumbnailArtworkProvider;
  SKUIArtworkProviding *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMediaComponent initWithArtwork:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaComponent;
  v13 = -[SKUIMediaComponent init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_mediaType = 0;
    v15 = objc_alloc_init(SKUIArtworkList);
    thumbnailArtworkProvider = v14->_thumbnailArtworkProvider;
    v14->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v15;

    v17 = v14->_thumbnailArtworkProvider;
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkProviding setArtworks:](v17, "setArtworks:", v18);

  }
  return v14;
}

- (SKUIMediaComponent)initWithArtworkProvider:(id)a3
{
  return -[SKUIMediaComponent initWithArtworkProvider:appearance:](self, "initWithArtworkProvider:appearance:", a3, 0);
}

- (SKUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIMediaComponent *v15;
  SKUIMediaComponent *v16;
  uint64_t v17;
  SKUIArtworkProviding *thumbnailArtworkProvider;
  objc_super v20;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMediaComponent initWithArtworkProvider:appearance:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaComponent;
  v15 = -[SKUIMediaComponent init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_mediaAppearance = a4;
    v15->_mediaType = 0;
    v17 = objc_msgSend(v6, "copy");
    thumbnailArtworkProvider = v16->_thumbnailArtworkProvider;
    v16->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v17;

  }
  return v16;
}

- (SKUIMediaComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIMediaComponent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *accessibilityLabel;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  SKUILink *v23;
  SKUILink *link;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSString *mediaURLString;
  void *v31;
  uint64_t v32;
  SKUIArtworkProviding *thumbnailArtworkProvider;
  void *v34;
  uint64_t v35;
  NSString *title;
  void *v37;
  double v38;
  char v39;
  void *v40;
  objc_super v42;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMediaComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)SKUIMediaComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v42, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      accessibilityLabel = v13->_accessibilityLabel;
      v13->_accessibilityLabel = (NSString *)v16;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("align"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13->_alignment = SKUIPageComponentAlignmentForString(v18);
    objc_msgSend(v14, "objectForKey:", CFSTR("duration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      v13->_duration = v20;
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("link"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v22, "setComponentDictionary:", v21);
      v23 = -[SKUILink initWithComponentContext:]([SKUILink alloc], "initWithComponentContext:", v22);
      link = v13->_link;
      v13->_link = v23;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("adamId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13->_mediaIdentifier = objc_msgSend(v25, "longLongValue");
    objc_msgSend(v14, "objectForKey:", CFSTR("subType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("audio")) & 1) != 0)
    {
      v27 = 1;
    }
    else
    {
      if (!objc_msgSend(v26, "isEqualToString:", CFSTR("video")))
        goto LABEL_22;
      v27 = 2;
    }
    v13->_mediaType = v27;
LABEL_22:
    objc_msgSend(v14, "objectForKey:", CFSTR("url"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("audioUrl"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("videoUrl"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v28, "copy");
      mediaURLString = v13->_mediaURLString;
      v13->_mediaURLString = (NSString *)v29;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("artwork"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    thumbnailArtworkProvider = v13->_thumbnailArtworkProvider;
    v13->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v32;

    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_msgSend(v34, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v35;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("titleSize"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(float *)&v38 = SKUIEditorialTitleSizeForString(v37);
    }
    else
    {
      v39 = objc_opt_respondsToSelector();
      LODWORD(v38) = 17.0;
      if ((v39 & 1) != 0)
        objc_msgSend(v37, "floatValue", v38);
    }
    v13->_titleFontSize = *(float *)&v38;
    objc_msgSend(v14, "objectForKey:", CFSTR("titleWeight"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13->_titleFontWeight = SKUIPageComponentFontWeightForString(v40);

  }
  return v13;
}

- (SKUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIMediaComponent *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SKUIArtworkProviding *thumbnailArtworkProvider;
  objc_super v21;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMediaComponent initWithFeaturedContentContext:kind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIMediaComponent;
  v15 = -[SKUIPageComponent initWithFeaturedContentContext:kind:](&v21, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v15)
  {
    objc_msgSend(v6, "componentDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("artwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    thumbnailArtworkProvider = v15->_thumbnailArtworkProvider;
    v15->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v18;

    v15->_mediaType = 0;
  }

  return v15;
}

- (id)bestThumbnailArtwork
{
  void *v3;
  double v4;
  double v5;
  SKUIArtworkProviding *thumbnailArtworkProvider;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  thumbnailArtworkProvider = self->_thumbnailArtworkProvider;
  if (v5 == 2.0)
    -[SKUIArtworkProviding largestArtwork](thumbnailArtworkProvider, "largestArtwork");
  else
    -[SKUIArtworkProviding smallestArtwork](thumbnailArtworkProvider, "smallestArtwork");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestThumbnailForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6 * a3;

  -[SKUIArtworkProviding artworkForSize:](self->_thumbnailArtworkProvider, "artworkForSize:", (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SKUIMediaComponent bestThumbnailArtwork](self, "bestThumbnailArtwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (int64_t)componentType
{
  return 10;
}

- (id)metricsElementName
{
  return CFSTR("media");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC50]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_mediaIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC60]) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC68]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[SKUIMediaComponent title](self, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)duration
{
  return self->_duration;
}

- (SKUILink)link
{
  return self->_link;
}

- (int64_t)mediaAppearance
{
  return self->_mediaAppearance;
}

- (int64_t)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (NSString)title
{
  return self->_title;
}

- (float)titleFontSize
{
  return self->_titleFontSize;
}

- (int64_t)titleFontWeight
{
  return self->_titleFontWeight;
}

- (SKUIArtworkProviding)thumbnailArtworkProvider
{
  return self->_thumbnailArtworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailArtworkProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)initWithArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithArtworkProvider:(uint64_t)a3 appearance:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
