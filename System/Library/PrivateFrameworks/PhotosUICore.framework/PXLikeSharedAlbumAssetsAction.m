@implementation PXLikeSharedAlbumAssetsAction

- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3 like:(BOOL)a4
{
  id v6;
  PXLikeSharedAlbumAssetsAction *v7;
  PXLikeSharedAlbumAssetsAction *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXLikeSharedAlbumAssetsAction;
  v7 = -[PXAssetsAction initWithAssets:](&v10, sel_initWithAssets_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_like = a4;
    v7->_mediaType = PXMediaTypeForAssets();
  }

  return v8;
}

- (PXLikeSharedAlbumAssetsAction)initWithAssets:(id)a3
{
  id v4;
  PXLikeSharedAlbumAssetsAction *v5;

  v4 = a3;
  v5 = -[PXLikeSharedAlbumAssetsAction initWithAssets:like:](self, "initWithAssets:like:", v4, objc_msgSend((id)objc_opt_class(), "toggledValueForAssets:", v4));

  return v5;
}

- (id)actionIdentifier
{
  return CFSTR("LikeAssetsInSharedAlbum");
}

- (id)actionNameLocalizationKey
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v3 = -[PXLikeSharedAlbumAssetsAction isLike](self, "isLike");
  -[PXAssetsAction assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[PXLikeSharedAlbumAssetsAction mediaType](self, "mediaType");
  if (!v3)
  {
    if (v5 != 1)
    {
      v7 = CFSTR("UNLIKE_ALL_PHOTOS_BUTTON_TITLE");
      v8 = CFSTR("UNLIKE_ALL_VIDEOS_BUTTON_TITLE");
      v9 = CFSTR("UNLIKE_ALL_ITEMS_BUTTON_TITLE");
      goto LABEL_9;
    }
    v8 = CFSTR("UNLIKE_VIDEO_BUTTON_TITLE");
    v7 = CFSTR("UNLIKE_PHOTO_BUTTON_TITLE");
LABEL_8:
    v9 = v7;
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    v8 = CFSTR("LIKE_VIDEO_BUTTON_TITLE");
    v7 = CFSTR("LIKE_PHOTO_BUTTON_TITLE");
    goto LABEL_8;
  }
  v7 = CFSTR("LIKE_ALL_PHOTOS_BUTTON_TITLE");
  v8 = CFSTR("LIKE_ALL_VIDEOS_BUTTON_TITLE");
  v9 = CFSTR("LIKE_ALL_ITEMS_BUTTON_TITLE");
LABEL_9:
  PXLocalizationKeyForMediaType(v6, v7, v8, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performAction:(id)a3
{
  id v4;

  v4 = a3;
  -[PXLikeSharedAlbumAssetsAction markAssetsAsLiked:completionHandler:](self, "markAssetsAsLiked:completionHandler:", -[PXLikeSharedAlbumAssetsAction isLike](self, "isLike"), v4);

}

- (void)performUndo:(id)a3
{
  id v4;

  v4 = a3;
  -[PXLikeSharedAlbumAssetsAction markAssetsAsLiked:completionHandler:](self, "markAssetsAsLiked:completionHandler:", -[PXLikeSharedAlbumAssetsAction isLike](self, "isLike") ^ 1, v4);

}

- (void)markAssetsAsLiked:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)MEMORY[0x1E0C99E20];
  -[PXAssetsAction assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXAssetsAction assets](self, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "pl_managedAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v23 = 0;
    v16 = objc_msgSend(MEMORY[0x1E0D719E0], "canSetUserCloudSharedLiked:forAssets:error:", v4, v9, &v23);
    v17 = v23;
    if (v16)
    {
      objc_msgSend(v9, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __69__PXLikeSharedAlbumAssetsAction_markAssetsAsLiked_completionHandler___block_invoke;
      v20[3] = &unk_1E5144398;
      v21 = v9;
      v22 = v4;
      objc_msgSend(v19, "performTransaction:", v20);
      v6[2](v6, 1, 0);

    }
    else
    {
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v17);
    }

  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

- (BOOL)isLike
{
  return self->_like;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

void __69__PXLikeSharedAlbumAssetsAction_markAssetsAsLiked_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setUserCloudSharedLiked:", *(unsigned __int8 *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (BOOL)toggledValueForAssets:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = PXExists();
  else
    v4 = 1;

  return v4;
}

+ (BOOL)currentValueForAssets:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = objc_msgSend(a1, "toggledValueForAssets:", v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "isCloudSharedAsset");
}

uint64_t __55__PXLikeSharedAlbumAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isCloudSharedAsset"))
  {
    objc_msgSend(v2, "pl_managedAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userCloudSharedLiked") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
