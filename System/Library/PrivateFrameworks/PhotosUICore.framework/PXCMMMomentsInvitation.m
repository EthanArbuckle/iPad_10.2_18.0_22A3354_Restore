@implementation PXCMMMomentsInvitation

- (PXCMMMomentsInvitation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentsInvitation.m"), 93, CFSTR("%s is not available as initializer"), "-[PXCMMMomentsInvitation init]");

  abort();
}

- (PXCMMMomentsInvitation)initWithAssetCollection:(id)a3
{
  id v5;
  PXCMMMomentsInvitation *v6;
  PXCMMMomentsInvitation *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subtitle;
  id v15;
  id v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXCMMMomentsInvitation;
  v6 = -[PXCMMMomentsInvitation init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_shareType = 1;
    v15 = 0;
    v16 = 0;
    PXCMMTitleAndSubtitleForAssetCollection(v5, &v16, &v15);
    v8 = v16;
    v9 = v15;
    v10 = objc_msgSend(v8, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v10;

    v12 = objc_msgSend(v9, "copy");
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v12;

  }
  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, asset collection: \"%@\">"), objc_opt_class(), self, self->_assetCollection);
}

- (PXCMMMomentsInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetCollection:", self->_assetCollection);
  objc_storeStrong((id *)(v5 + 72), self->_participantsFetchResult);
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;
  v7 = v4;

  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  return (PXCMMMomentsInvitation *)(id)v5;
}

- (PXCMMMomentsInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetCollection:", self->_assetCollection);
  objc_storeStrong((id *)(v5 + 64), self->_previewAssetsFetchResult);
  objc_storeStrong((id *)(v5 + 40), self->_posterAsset);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;
  v7 = v4;

  _GetOwner(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  return (PXCMMMomentsInvitation *)(id)v5;
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

  -[PXCMMMomentsInvitation contextForActivityType:](self, "contextForActivityType:", a3);
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

- (PHFetchResult)participantsFetchResult
{
  return self->_participantsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFetchResult, 0);
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
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentsInvitation.m"), 97, CFSTR("%s is not available as initializer"), "+[PXCMMMomentsInvitation new]");

  abort();
}

+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4 participantsFetchResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  PXPhotoKitUIMediaProvider *v20;
  void *v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetCollection:", v10);

  v12 = (void *)v11[8];
  v11[8] = v8;
  v13 = v8;

  _GetOwner(v9);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v11[4];
  v11[4] = v14;

  v16 = (void *)v11[9];
  v11[9] = v9;
  v17 = v9;

  objc_msgSend(v13, "firstObject");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v11[5];
  v11[5] = v18;

  v20 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  v21 = (void *)v11[6];
  v11[6] = v20;

  return v11;
}

+ (id)invitationWithAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchLimit:", 5);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalSortDescriptors:", v8);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invitationWithAssetCollection:previewAssetsFetchResult:participantsFetchResult:", v4, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)menuItemTitleForDeletingInvitations:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("Remove %lu iCloud Links (Moments Mock)"), objc_msgSend(a3, "count"));
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
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentsInvitation.m"), 273, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (int64_t)aggregateMediaType
{
  void *v2;
  int64_t v3;

  -[PXCMMMomentsInvitation assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aggregateMediaType");

  return v3;
}

@end
