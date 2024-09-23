@implementation SearchUIMediaArtworkImage

- (SearchUIMediaArtworkImage)initWithSFImage:(id)a3
{
  id v4;
  SearchUIMediaArtworkImage *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIMediaArtworkImage;
  v5 = -[SearchUIImage initWithSFImage:](&v10, sel_initWithSFImage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "persistentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMediaArtworkImage setPersistentID:](v5, "setPersistentID:", v6);

    objc_msgSend(v4, "universalLibraryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMediaArtworkImage setUniversalLibraryID:](v5, "setUniversalLibraryID:", v7);

    objc_msgSend(v4, "spotlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMediaArtworkImage setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v8);

    -[SearchUIMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", +[SearchUIMediaPlayerUtilities MPMediaEntityTypeForSFMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaEntityTypeForSFMediaEntityType:", objc_msgSend(v4, "mediaEntityType")));
    -[SearchUIImage setSupportsFastPathShadow:](v5, "setSupportsFastPathShadow:", 1);
  }

  return v5;
}

- (SearchUIMediaArtworkImage)initWithSpotlightIdentifier:(id)a3
{
  id v4;
  SearchUIMediaArtworkImage *v5;
  SearchUIMediaArtworkImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIMediaArtworkImage;
  v5 = -[SearchUIMediaArtworkImage init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SearchUIMediaArtworkImage setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v4);
    -[SearchUIImage setSupportsFastPathShadow:](v6, "setSupportsFastPathShadow:", 1);
  }

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  double v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
  v10[3] = &unk_1EA1F8138;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v10);

}

void __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  uint64_t v36;
  char v37;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1EA1F80E8;
  v36 = *(_QWORD *)(a1 + 48);
  v37 = *(_BYTE *)(a1 + 56);
  v35 = *(id *)(a1 + 40);
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "universalLibraryID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "universalLibraryID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaGroupingForMPMediaEntityType:", objc_msgSend(*(id *)(a1 + 32), "mediaEntityType"));
      objc_msgSend(MEMORY[0x1E0CC23F0], "ULIDPropertyForGroupingType:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      v11 = (void *)MEMORY[0x1E0CC2430];
      objc_msgSend(*(id *)(a1 + 32), "universalLibraryID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateWithValue:forProperty:", v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setGroupingType:", v8);
      objc_msgSend(v10, "addFilterPredicate:", v13);
      objc_msgSend(v10, "collections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(*(id *)(a1 + 32), "persistentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v19 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaGroupingForMPMediaEntityType:", objc_msgSend(*(id *)(a1 + 32), "mediaEntityType"));
      +[SearchUIMediaPlayerUtilities filterPropertyForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "filterPropertyForMPMediaEntityType:", objc_msgSend(*(id *)(a1 + 32), "mediaEntityType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      v20 = (void *)MEMORY[0x1E0CC2430];
      v21 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberFromString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predicateWithValue:forProperty:", v23, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setGroupingType:", v19);
      objc_msgSend(v10, "addFilterPredicate:", v13);
      if (objc_msgSend(*(id *)(a1 + 32), "mediaEntityType"))
        objc_msgSend(v10, "collections");
      else
        objc_msgSend(v10, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = MEMORY[0x1E0C809B0];
LABEL_10:
      objc_msgSend(v14, "firstObject");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
        goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "spotlightIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "entityWithSpotlightIdentifier:", v26);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_21:
    (*((void (**)(void *, _QWORD, _QWORD))v3 + 2))(v3, 0, *(_QWORD *)(a1 + 40));
    goto LABEL_22;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_13:
    objc_msgSend(v24, "artworkCatalog");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_20:
      (*((void (**)(void *, id, _QWORD))v3 + 2))(v3, v24, *(_QWORD *)(a1 + 40));
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  objc_msgSend(v24, "artworkCatalog");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    goto LABEL_18;
  objc_msgSend(v24, "tiledArtworkCatalogWithRows:columns:", 2, 2);
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v28 = (void *)v27;
  if (!v27)
    goto LABEL_20;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSize");
  objc_msgSend(v28, "setFittingSize:", v29, v29);
  objc_msgSend(v28, "setDestinationScale:", *(double *)(a1 + 48));
  v30[0] = v2;
  v30[1] = 3221225472;
  v30[2] = __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3;
  v30[3] = &unk_1EA1F8110;
  v32 = *(id *)(a1 + 40);
  v33 = v3;
  v24 = v24;
  v31 = v24;
  objc_msgSend(v28, "requestImageWithCompletion:", v30);

LABEL_22:
}

void __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v5)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v12;
      }
      else
      {
        objc_msgSend(v12, "representativeItem");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;
      if ((objc_msgSend(v6, "mediaType") & 0xFF00) != 0)
      {
        v7 = CFSTR("com.apple.Music");
        if ((objc_msgSend(v8, "mediaType") & 0x800) == 0)
        {
          objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0CC1E88]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLValue");

          if (!v10)
            v7 = CFSTR("com.apple.tv");
        }
      }
      else
      {
        v7 = CFSTR("com.apple.Music");
      }

    }
    else
    {
      v7 = CFSTR("com.apple.Music");
    }
    +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v7, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadImageWithScale:isDarkStyle:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  }
}

uint64_t __78__SearchUIMediaArtworkImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  else
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)persistentID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)universalLibraryID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUniversalLibraryID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)spotlightIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpotlightIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (int64_t)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(int64_t)a3
{
  self->_mediaEntityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
