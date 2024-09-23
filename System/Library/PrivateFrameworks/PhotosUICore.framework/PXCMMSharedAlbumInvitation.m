@implementation PXCMMSharedAlbumInvitation

- (PXCMMSharedAlbumInvitation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSharedAlbumInvitation.m"), 55, CFSTR("%s is not available as initializer"), "-[PXCMMSharedAlbumInvitation init]");

  abort();
}

- (PXCMMSharedAlbumInvitation)initWithAssetCollection:(id)a3
{
  id v5;
  PXCMMSharedAlbumInvitation *v6;
  PXCMMSharedAlbumInvitation *v7;
  id *p_assetCollection;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  NSString *title;
  uint64_t v21;
  NSString *subtitle;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXCMMSharedAlbumInvitation;
  v6 = -[PXCMMSharedAlbumInvitation init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    p_assetCollection = (id *)&v6->_assetCollection;
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_shareType = 1;
    -[PHAssetCollection localizedTitle](v7->_assetCollection, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (unint64_t)objc_msgSend(v9, "length") >= 0xE)
    {
      objc_msgSend(v10, "substringFromIndex:", 13);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_msgSend(*p_assetCollection, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(*p_assetCollection, "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[PHAssetCollection endDate](v7->_assetCollection, "endDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v12;
    v16 = v15;

    PLCMMTitleAndSubtitleForTitleAndFallbackDates();
    v17 = 0;
    v18 = 0;
    v19 = objc_msgSend(v17, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v19;

    v21 = objc_msgSend(v18, "copy");
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v21;

  }
  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, asset collection: \"%@\">"), objc_opt_class(), self, self->_assetCollection);
}

- (PXCMMSharedAlbumInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetCollection:", self->_assetCollection);
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;
  v7 = v4;

  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  return (PXCMMSharedAlbumInvitation *)(id)v5;
}

- (NSURL)shareURL
{
  return (NSURL *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://share.icloud.com/photos/123"));
}

- (NSString)identifier
{
  return (NSString *)-[PHAssetCollection uuid](self->_assetCollection, "uuid");
}

- (NSDate)creationDate
{
  return (NSDate *)-[PHAssetCollection creationDate](self->_assetCollection, "creationDate");
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2592000.0);
}

- (unint64_t)count
{
  return -[PHAssetCollection estimatedAssetCount](self->_assetCollection, "estimatedAssetCount");
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return (PXAssetCollectionActionManager *)-[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", self->_assetCollection, 0);
}

- (PXPhotosViewConfiguration)assetViewConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  PXPhotosViewConfiguration *v6;

  +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:", self->_assetCollection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection photoLibrary](self->_assetCollection, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:]([PXPhotosViewConfiguration alloc], "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v3, v5, 0, 0, 0);
  return v6;
}

- (PXMomentShareStatusPresentation)statusPresentation
{
  return 0;
}

- (id)contextForActivityType:(unint64_t)a3
{
  return -[PXCMMPhotoKitContext initWithAssetCollection:activityType:sourceType:]([PXCMMPhotoKitContext alloc], "initWithAssetCollection:activityType:sourceType:", self->_assetCollection, a3, 0);
}

- (id)sessionForActivityType:(unint64_t)a3
{
  void *v3;
  PXCMMPhotoKitSession *v4;

  -[PXCMMSharedAlbumInvitation contextForActivityType:](self, "contextForActivityType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXCMMPhotoKitSession initWithPhotoKitContext:]([PXCMMPhotoKitSession alloc], "initWithPhotoKitContext:", v3);

  return v4;
}

- (void)acceptWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PXCMMInvitationParticipant)owner
{
  return self->_owner;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHFetchResult)previewAssetsFetchResult
{
  return self->_previewAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharedAlbumInvitation.m"), 59, CFSTR("%s is not available as initializer"), "+[PXCMMSharedAlbumInvitation new]");

  abort();
}

+ (id)_participantsForAssetCollection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__53578;
  v12 = __Block_byref_object_dispose__53579;
  v13 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v4 = v3;
  px_dispatch_on_main_queue_sync();
  if (objc_msgSend((id)v9[5], "count", v7, 3221225472, __62__PXCMMSharedAlbumInvitation__participantsForAssetCollection___block_invoke, &unk_1E5148AA8))
  {
    v5 = (void *)objc_msgSend((id)v9[5], "copy");
  }
  else
  {
    v5 = 0;
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PXPhotoKitUIMediaProvider *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetCollection:", v7);
  v9 = (void *)v8[8];
  v8[8] = v6;
  v10 = v6;

  objc_msgSend(a1, "_participantsForAssetCollection:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v8[4];
  v8[4] = v12;

  objc_msgSend(v10, "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8[5];
  v8[5] = v14;

  v16 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  v17 = (void *)v8[6];
  v8[6] = v16;

  return v8;
}

+ (id)invitationWithAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchLimit:", 5);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invitationWithAssetCollection:previewAssetsFetchResult:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)menuItemTitleForDeletingInvitations:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("Remove %lu iCloud Links (Shared Albums Mock)"), objc_msgSend(a3, "count"));
}

+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5
{
  return 0;
}

+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharedAlbumInvitation.m"), 234, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

void __62__PXCMMSharedAlbumInvitation__participantsForAssetCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PXCMMSharedAlbumParticipant *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "cloudAlbumSubscriberRecords");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "inviteeFirstName", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = -[PXCMMSharedAlbumParticipant initWithRecord:]([PXCMMSharedAlbumParticipant alloc], "initWithRecord:", v12);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (int64_t)aggregateMediaType
{
  void *v2;
  int64_t v3;

  -[PXCMMSharedAlbumInvitation assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aggregateMediaType");

  return v3;
}

@end
