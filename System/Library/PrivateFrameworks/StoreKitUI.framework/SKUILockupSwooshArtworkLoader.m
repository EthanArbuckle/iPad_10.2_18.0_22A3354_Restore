@implementation SKUILockupSwooshArtworkLoader

- (SKUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6;
  id v7;
  SKUILockupSwooshArtworkLoader *v8;
  uint64_t v9;
  SKUIItemArtworkContext *context;
  uint64_t v11;
  SKUIVideoImageDataConsumer *videoImageConsumer;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUILockupSwooshArtworkLoader;
  v8 = -[SKUISwooshArtworkLoader initWithArtworkLoader:swoosh:](&v14, sel_initWithArtworkLoader_swoosh_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "artworkContext");
    v9 = objc_claimAutoreleasedReturnValue();
    context = v8->_context;
    v8->_context = (SKUIItemArtworkContext *)v9;

    objc_msgSend(v7, "videoImageConsumer");
    v11 = objc_claimAutoreleasedReturnValue();
    videoImageConsumer = v8->_videoImageConsumer;
    v8->_videoImageConsumer = (SKUIVideoImageDataConsumer *)v11;

  }
  return v8;
}

- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  SKUIArtworkRequest *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[SKUIItemArtworkContext URLForItem:](self->_context, "URLForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIItemArtworkContext dataConsumerForItem:](self->_context, "dataConsumerForItem:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkRequest setDataConsumer:](v8, "setDataConsumer:", v9);

    -[SKUIArtworkRequest setURL:](v8, "setURL:", v7);
    v10 = -[SKUISwooshArtworkLoader loadImageForObject:artworkRequest:reason:](self, "loadImageForObject:artworkRequest:reason:", v6, v8, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)loadImageForVideo:(id)a3 reason:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  SKUIArtworkRequest *v14;
  BOOL v15;

  v6 = a3;
  -[SKUIVideoImageDataConsumer landscapeSize](self->_videoImageConsumer, "landscapeSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "artworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bestArtworkForScaledSize:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", self->_videoImageConsumer);
    -[SKUIArtworkRequest setURL:](v14, "setURL:", v13);
    v15 = -[SKUISwooshArtworkLoader loadImageForObject:artworkRequest:reason:](self, "loadImageForObject:artworkRequest:reason:", v6, v14, a4);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SKUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderImageForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)placeholderImageForVideo:(id)a3
{
  UIImage *videoPlaceholderImage;
  UIImage *v5;
  UIImage *v6;

  videoPlaceholderImage = self->_videoPlaceholderImage;
  if (!videoPlaceholderImage)
  {
    -[SKUIVideoImageDataConsumer imageForColor:orientation:](self->_videoImageConsumer, "imageForColor:orientation:", 0, 2);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_videoPlaceholderImage;
    self->_videoPlaceholderImage = v5;

    videoPlaceholderImage = self->_videoPlaceholderImage;
  }
  return videoPlaceholderImage;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;

  -[SKUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockups");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v15, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SKUILockupSwooshArtworkLoader loadImageForItem:reason:](self, "loadImageForItem:reason:", v11, a3);
        objc_msgSend(v11, "videos");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[SKUILockupSwooshArtworkLoader loadImageForVideo:reason:](self, "loadImageForVideo:reason:", v14, a3);
        v8 += v12;

      }
      if (v9 >= v7)
        break;
      ++v9;
    }
    while (v8 < 7);
  }

}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  v7 = objc_msgSend(v20, "requestIdentifier");
  -[SKUISwooshArtworkLoader swooshViewController](self, "swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockups");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    v18 = v8;
    v19 = v6;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v13, "item"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "item");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (-[SKUISwooshArtworkLoader artworkRequestIdentifierForObject:](self, "artworkRequestIdentifierForObject:", v15) == v7)
          {
            v8 = v18;
            v6 = v19;
            objc_msgSend(v18, "setImage:forItemAtIndex:", v19, objc_msgSend(v13, "item"));
LABEL_16:

            goto LABEL_17;
          }
          objc_msgSend(v15, "videos");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17
            && -[SKUISwooshArtworkLoader artworkRequestIdentifierForObject:](self, "artworkRequestIdentifierForObject:", v17) == v7)
          {
            v8 = v18;
            v6 = v19;
            objc_msgSend(v18, "setVideoThumbnail:forItemAtIndex:", v19, objc_msgSend(v13, "item"));

            goto LABEL_16;
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v8 = v18;
      v6 = v19;
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  v23.receiver = self;
  v23.super_class = (Class)SKUILockupSwooshArtworkLoader;
  -[SKUISwooshArtworkLoader setImage:forRequest:](&v23, sel_setImage_forRequest_, v6, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithArtworkLoader:swoosh:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:]";
}

@end
