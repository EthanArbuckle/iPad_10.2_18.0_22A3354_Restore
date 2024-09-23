@implementation SKUIMediaPageSection

- (SKUIMediaPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIMediaPageSection *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  SKUIArtwork *artwork;
  double v16;
  float v17;
  SKUIEmbeddedMediaView *v18;
  SKUIEmbeddedMediaView *mediaView;
  SKUIEmbeddedMediaView *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaPageSection initWithPageComponent:].cold.1();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIMediaPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v23, sel_initWithPageComponent_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v8 < v10 && v12 == 1)
      v8 = v10;
    objc_msgSend(v4, "bestThumbnailForWidth:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (SKUIArtwork *)v14;

    v16 = (double)-[SKUIArtwork height](v5->_artwork, "height");
    v17 = v8 / (double)-[SKUIArtwork width](v5->_artwork, "width") * v16;
    v5->_imageSize.width = v8;
    v5->_imageSize.height = floorf(v17);
    v18 = objc_alloc_init(SKUIEmbeddedMediaView);
    mediaView = v5->_mediaView;
    v5->_mediaView = v18;

    v20 = v5->_mediaView;
    objc_msgSend(v4, "accessibilityLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEmbeddedMediaView setAccessibilityLabel:](v20, "setAccessibilityLabel:", v21);

    -[SKUIEmbeddedMediaView setDelegate:](v5->_mediaView, "setDelegate:", v5);
    -[SKUIEmbeddedMediaView setThumbnailContentMode:](v5->_mediaView, "setThumbnailContentMode:", 5);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIEmbeddedMediaView setDelegate:](self->_mediaView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIMediaPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemIdentifier:", objc_msgSend(v6, "mediaIdentifier"));

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v7);

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SKUIMediaPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v5, "resourceLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!self->_artworkRequestID)
    goto LABEL_4;
  objc_msgSend(v8, "cachedResourceForRequestIdentifier:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if ((objc_msgSend(v9, "trySetReason:forRequestWithIdentifier:", 1, self->_artworkRequestID) & 1) != 0)
    {
LABEL_5:
      v10 = 0;
      goto LABEL_6;
    }
LABEL_4:
    -[SKUIMediaPageSection _loadImageWithReason:](self, "_loadImageWithReason:", 1);
    goto LABEL_5;
  }
LABEL_6:
  -[SKUIEmbeddedMediaView setThumbnailImage:](self->_mediaView, "setThumbnailImage:", v10);
  objc_msgSend(v7, "setContentChildView:", self->_mediaView);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double height;
  double v9;
  double v10;
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  height = self->_imageSize.height;
  if (-[SKUIEmbeddedMediaView showsThumbnailReflection](self->_mediaView, "showsThumbnailReflection"))
    height = height + self->_imageSize.height;
  v9 = v7;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIMediaPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  if (self->_artworkRequestID)
  {
    -[SKUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "trySetReason:forRequestWithIdentifier:", 0, self->_artworkRequestID);

    if ((v7 & 1) == 0)
      self->_artworkRequestID = 0;
  }
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeMetricsImpressionSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endActiveImpressionForViewElement:", v9);

  v12.receiver = self;
  v12.super_class = (Class)SKUIMediaPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v12, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordEvent:", v4);

  }
  if (objc_msgSend(v8, "mediaType"))
  {
    -[SKUIEmbeddedMediaView beginPlaybackAnimated:](self->_mediaView, "beginPlaybackAnimated:", 1);
  }
  else
  {
    objc_msgSend(v8, "link");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v7);

  }
}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  _BOOL4 v4;
  double result;

  v4 = -[SKUIEmbeddedMediaView showsThumbnailReflection](self->_mediaView, "showsThumbnailReflection", a3);
  result = 0.0;
  if (v4)
    return -self->_imageSize.height;
  return result;
}

- (int64_t)defaultItemPinningStyle
{
  return 3;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  if (!self->_artworkRequestID)
    -[SKUIMediaPageSection _loadImageWithReason:](self, "_loadImageWithReason:", a3);
}

- (void)setSectionIndex:(int64_t)a3
{
  objc_super v5;

  -[SKUIEmbeddedMediaView setShowsThumbnailReflection:](self->_mediaView, "setShowsThumbnailReflection:", a3 == 0);
  v5.receiver = self;
  v5.super_class = (Class)SKUIMediaPageSection;
  -[SKUIStorePageSection setSectionIndex:](&v5, sel_setSectionIndex_, a3);
}

- (void)willAppearInContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SKUIMediaPageSectionReuseIdentifier"));

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  -[SKUIEmbeddedMediaView setThumbnailImage:](self->_mediaView, "setThumbnailImage:", a4);
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "canRecordEventWithType:", *MEMORY[0x1E0DAFC48]))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DAF5A0]);
    SKUIMetricsMediaEventTypeForPlaybackState(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMediaEventType:", v9);

    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mediaIdentifier");
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setItemIdentifier:", v12);

    }
    objc_msgSend(v10, "mediaURLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMediaURL:", v13);

    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationWithPageComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "locationWithPageComponent:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15 && v16)
    {
      v19[0] = v16;
      v19[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocationWithEventLocations:", v18);

    }
    objc_msgSend(v7, "recordEvent:", v8);

  }
}

- (void)_loadImageWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIArtworkRequest *v13;

  v13 = objc_alloc_init(SKUIArtworkRequest);
  -[SKUIArtworkRequest setDelegate:](v13, "setDelegate:", self);
  -[SKUIArtwork URL](self->_artwork, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkRequest setURL:](v13, "setURL:", v4);

  +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](SKUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", self->_imageSize.width, self->_imageSize.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mediaAppearance");

  if (v7 == 1)
  {
    -[SKUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGradientEndColor:", v10);

    objc_msgSend(v5, "setGradientHeight:", 63.0);
  }
  -[SKUIArtworkRequest setDataConsumer:](v13, "setDataConsumer:", v5);
  self->_artworkRequestID = -[SKUIResourceRequest requestIdentifier](v13, "requestIdentifier");
  -[SKUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadResourceWithRequest:reason:", v13, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaPageSection initWithPageComponent:]";
}

@end
