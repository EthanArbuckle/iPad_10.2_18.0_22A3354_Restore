@implementation PXFavoriteAssetsAction

- (PXFavoriteAssetsAction)initWithAssets:(id)a3 favorite:(BOOL)a4
{
  void *v6;
  PXFavoriteAssetsAction *v7;
  PXFavoriteAssetsAction *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, void *);
  void *v14;
  BOOL v15;

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __50__PXFavoriteAssetsAction_initWithAssets_favorite___block_invoke;
  v14 = &__block_descriptor_33_e17_B16__0__PHAsset_8l;
  v15 = a4;
  PXFilter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXFavoriteAssetsAction;
  v7 = -[PXAssetsAction initWithAssets:](&v10, sel_initWithAssets_, v6);
  v8 = v7;
  if (v7)
    v7->_favorite = a4;

  return v8;
}

- (PXFavoriteAssetsAction)initWithAssets:(id)a3
{
  id v4;
  PXFavoriteAssetsAction *v5;

  v4 = a3;
  v5 = -[PXFavoriteAssetsAction initWithAssets:favorite:](self, "initWithAssets:favorite:", v4, objc_msgSend((id)objc_opt_class(), "toggledValueForAssets:", v4));

  return v5;
}

- (id)actionIdentifier
{
  return CFSTR("FavoriteAssets");
}

- (id)actionNameLocalizationKey
{
  if (-[PXFavoriteAssetsAction isFavorite](self, "isFavorite"))
    return CFSTR("PXAddToFavoritesActionName");
  else
    return CFSTR("PXRemoveFromFavoritesActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXFavoriteAssetsAction isFavorite](self, "isFavorite");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXFavoriteAssetsAction_performAction___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  v7 = v5;
  -[PXAssetsAction performAssetChanges:completionHandler:](self, "performAssetChanges:completionHandler:", v6, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXFavoriteAssetsAction isFavorite](self, "isFavorite");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PXFavoriteAssetsAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  v7 = !v5;
  -[PXAssetsAction performAssetChanges:completionHandler:](self, "performAssetChanges:completionHandler:", v6, v4);

}

- (BOOL)isFavorite
{
  return self->_favorite;
}

uint64_t __38__PXFavoriteAssetsAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFavorite:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __40__PXFavoriteAssetsAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFavorite:", *(unsigned __int8 *)(a1 + 32));
}

BOOL __50__PXFavoriteAssetsAction_initWithAssets_favorite___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) != objc_msgSend(a2, "isFavorite");
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
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  if (v5
    && objc_msgSend(v5, "canPerformEditOperation:", 3)
    && (objc_msgSend(v5, "isTrashed") & 1) == 0
    && !objc_msgSend(v5, "isRecoveredAsset"))
  {
    LOBYTE(v7) = 1;
  }
  else if (objc_msgSend(v5, "px_isUnsavedSyndicatedAsset"))
  {
    v7 = objc_msgSend(v5, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

uint64_t __48__PXFavoriteAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFavorite") ^ 1;
}

@end
