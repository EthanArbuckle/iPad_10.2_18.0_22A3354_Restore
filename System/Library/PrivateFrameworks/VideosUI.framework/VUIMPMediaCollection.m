@implementation VUIMPMediaCollection

- (id)_valueForPropertyDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "sourcePropertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaCollection mediaItemCollection](self, "mediaItemCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representativeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForProperty:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MPMediaItemCollection)mediaItemCollection
{
  return self->_mediaItemCollection;
}

- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  VUIMPMediaCollection *v17;
  VUIMPMediaCollection *v18;
  void *v19;
  uint64_t v20;
  NSString *coverArtImageIdentifier;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaItemCollection"));
  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
    if (v16)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifier"));
  if (!v15)
    goto LABEL_12;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("kind"));
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)VUIMPMediaCollection;
  v17 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v23, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v12, v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mediaItemCollection, a4);
    -[MPMediaItemCollection representativeItem](v18->_mediaItemCollection, "representativeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "vui_coverArtImageIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    coverArtImageIdentifier = v18->_coverArtImageIdentifier;
    v18->_coverArtImageIdentifier = (NSString *)v20;

    -[VUIMediaEntity setCachesPropertiesOnFirstAccess:](v18, "setCachesPropertiesOnFirstAccess:", 1);
  }

  return v18;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[VUIMPMediaCollection mediaItemCollection](self, "mediaItemCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representativeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_imageLoadParamsWithImageType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemCollection, 0);
  objc_storeStrong((id *)&self->_coverArtImageIdentifier, 0);
}

- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
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
  v3[2] = __31__VUIMPMediaCollection_isLocal__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("isLocal"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__VUIMPMediaCollection_isLocal__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "vui_isLocalCheckingSidebandLibrary:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "BOOLValue");

        if ((v7 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resolution
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__VUIMPMediaCollection_resolution__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("resolution"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__VUIMPMediaCollection_resolution__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_resolution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)colorCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VUIMPMediaCollection_colorCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("colorCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__VUIMPMediaCollection_colorCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_colorCapability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)audioCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VUIMPMediaCollection_audioCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("audioCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__VUIMPMediaCollection_audioCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_audioCapability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HLSResolution
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__VUIMPMediaCollection_HLSResolution__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSResolution"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__VUIMPMediaCollection_HLSResolution__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_HLSResolution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HLSColorCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VUIMPMediaCollection_HLSColorCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSColorCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__VUIMPMediaCollection_HLSColorCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_HLSColorCapability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HLSAudioCapability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VUIMPMediaCollection_HLSAudioCapability__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("HLSAudioCapability"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__VUIMPMediaCollection_HLSAudioCapability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_HLSAudioCapability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentRating
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__VUIMPMediaCollection_contentRating__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("contentRating"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__VUIMPMediaCollection_contentRating__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_contentRating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)coverArtImageIdentifier
{
  return self->_coverArtImageIdentifier;
}

- (id)playedState
{
  return -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", &__block_literal_global_112, CFSTR("playedState"));
}

void *__35__VUIMPMediaCollection_playedState__block_invoke()
{
  return &unk_1EA0B9D00;
}

- (id)showIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VUIMPMediaCollection_showIdentifier__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("showIdentifier"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__VUIMPMediaCollection_showIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representativeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_showIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetController
{
  void *v3;
  uint64_t v4;
  VUIUniversalCollectionAssetController *v5;
  VUIUniversalCollectionAssetController *v6;
  void *v7;

  -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [VUIUniversalCollectionAssetController alloc];
    -[VUIMPMediaCollection mediaItemCollection](self, "mediaItemCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VUIUniversalCollectionAssetController initWithMediaItemCollection:](v6, "initWithMediaItemCollection:", v7);

  }
  return v5;
}

- (void)setMediaItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemCollection, a3);
}

@end
