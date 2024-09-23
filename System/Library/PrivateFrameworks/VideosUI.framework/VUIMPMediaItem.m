@implementation VUIMPMediaItem

- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 mediaItem:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  VUIMPMediaItem *v13;
  VUIMPMediaItem *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaItem"));
    if (v10)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  if (!v9)
    goto LABEL_9;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
LABEL_4:
  +[VUIMPMediaEntityIdentifier mediaItemIdentifierWithMediaItem:](VUIMPMediaEntityIdentifier, "mediaItemIdentifierWithMediaItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    VUIMPMediaItemKind();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)VUIMPMediaItem;
    v13 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v16, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v8, v11, v10, v12);

    if (v13)
    {
      objc_storeStrong((id *)&v13->_mediaItem, a4);
      -[VUIMediaEntity setCachesPropertiesOnFirstAccess:](v13, "setCachesPropertiesOnFirstAccess:", 1);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The %@ initializer is not available."), v9);

  return 0;
}

- (id)isLocal
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__VUIMPMediaItem_isLocal__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("isLocal"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __25__VUIMPMediaItem_isLocal__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_isLocalCheckingSidebandLibrary:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)resolution
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VUIMPMediaItem_resolution__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("resolution"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __28__VUIMPMediaItem_resolution__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_resolution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)colorCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VUIMPMediaItem_colorCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("colorCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__VUIMPMediaItem_colorCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_colorCapability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)audioCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VUIMPMediaItem_audioCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("audioCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__VUIMPMediaItem_audioCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_audioCapability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)HLSResolution
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__VUIMPMediaItem_HLSResolution__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSResolution"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__VUIMPMediaItem_HLSResolution__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_HLSResolution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)HLSColorCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VUIMPMediaItem_HLSColorCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSColorCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__VUIMPMediaItem_HLSColorCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_HLSColorCapability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)HLSAudioCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VUIMPMediaItem_HLSAudioCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSAudioCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__VUIMPMediaItem_HLSAudioCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_HLSAudioCapability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)contentRating
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__VUIMPMediaItem_contentRating__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("contentRating"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__VUIMPMediaItem_contentRating__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_contentRating");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)coverArtImageIdentifier
{
  NSString *coverArtImageIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  coverArtImageIdentifier = self->_coverArtImageIdentifier;
  if (!coverArtImageIdentifier)
  {
    -[VUIMPMediaItem mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_coverArtImageIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_coverArtImageIdentifier;
    self->_coverArtImageIdentifier = v5;

    coverArtImageIdentifier = self->_coverArtImageIdentifier;
  }
  return coverArtImageIdentifier;
}

- (id)playedState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__VUIMPMediaItem_playedState__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("playedState"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __29__VUIMPMediaItem_playedState__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_playedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)showIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__VUIMPMediaItem_showIdentifier__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("showIdentifier"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __32__VUIMPMediaItem_showIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_showIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (VUIMediaEntityAssetController)assetController
{
  void *v3;
  uint64_t v4;
  VUIUniversalAssetController *v5;
  void *v6;
  VUIMediaEntityAssetController *v7;
  VUIMediaEntityAssetController *assetController;

  -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (!v4 && !self->_assetController)
  {
    v5 = [VUIUniversalAssetController alloc];
    -[VUIMPMediaItem mediaItem](self, "mediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VUIUniversalAssetController initWithMPMediaItem:](v5, "initWithMPMediaItem:", v6);
    assetController = self->_assetController;
    self->_assetController = v7;

  }
  return self->_assetController;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "sourcePropertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaItem mediaItem](self, "mediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForProperty:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)assetType
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__VUIMPMediaItem_assetType__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("assetType"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__VUIMPMediaItem_assetType__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_assetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)isPlayable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VUIMPMediaItem_isPlayable__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("isPlayable"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __28__VUIMPMediaItem_isPlayable__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_isPlayable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)previewFrameImageIdentifier
{
  NSString *previewFrameImageIdentifier;
  NSString *v4;
  NSString *v5;

  previewFrameImageIdentifier = self->_previewFrameImageIdentifier;
  if (!previewFrameImageIdentifier)
  {
    -[MPMediaItem vui_previewFrameImageIdentifier](self->_mediaItem, "vui_previewFrameImageIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_previewFrameImageIdentifier;
    self->_previewFrameImageIdentifier = v4;

    previewFrameImageIdentifier = self->_previewFrameImageIdentifier;
  }
  return previewFrameImageIdentifier;
}

- (id)extrasURL
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__VUIMPMediaItem_extrasURL__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("extrasURL"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__VUIMPMediaItem_extrasURL__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_extrasURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)seasonIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__VUIMPMediaItem_seasonIdentifier__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("seasonIdentifier"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__VUIMPMediaItem_seasonIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_seasonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)seasonCanonicalID
{
  return &stru_1E9FF3598;
}

- (id)showCanonicalID
{
  return &stru_1E9FF3598;
}

- (id)studio
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__VUIMPMediaItem_studio__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("studio"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __24__VUIMPMediaItem_studio__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_studio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)credits
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__VUIMPMediaItem_credits__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("credits"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __25__VUIMPMediaItem_credits__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_credits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)rentalExpirationDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VUIMPMediaItem_rentalExpirationDate__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("rentalExpirationDate"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__VUIMPMediaItem_rentalExpirationDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_rentalExpirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[VUIMPMediaItem mediaItem](self, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_imageLoadParamsWithImageType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_previewFrameImageIdentifier, 0);
  objc_storeStrong((id *)&self->_coverArtImageIdentifier, 0);
}

@end
