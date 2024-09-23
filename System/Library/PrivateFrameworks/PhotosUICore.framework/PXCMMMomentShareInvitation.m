@implementation PXCMMMomentShareInvitation

- (BOOL)px_isEmpty
{
  return 0;
}

- (BOOL)px_isFavorite
{
  return 0;
}

- (BOOL)px_canPerformFavoriteAction
{
  return 0;
}

- (int64_t)aggregateMediaType
{
  void *v2;
  int64_t v3;

  -[PXCMMMomentShareInvitation momentShare](self, "momentShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aggregateMediaType");

  return v3;
}

- (PXCMMMomentShareInvitation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitation.m"), 48, CFSTR("%s is not available as initializer"), "-[PXCMMMomentShareInvitation init]");

  abort();
}

- (PXCMMMomentShareInvitation)initWithMomentShare:(id)a3
{
  id v6;
  PXCMMMomentShareInvitation *v7;
  PXCMMMomentShareInvitation *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *subtitle;
  void *v16;
  id v17;
  id v18;
  objc_super v19;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitation.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentShareInvitation;
  v7 = -[PXCMMMomentShareInvitation init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_momentShare, a3);
    v8->_shareType = -[PHMomentShare px_momentShareType](v8->_momentShare, "px_momentShareType");
    v17 = 0;
    v18 = 0;
    PXCMMTitleAndSubtitleForAssetCollection(v6, &v18, &v17);
    v9 = v18;
    v10 = v17;
    v11 = objc_msgSend(v9, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

    v13 = objc_msgSend(v10, "copy");
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v13;

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  PHMomentShare *momentShare;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  momentShare = self->_momentShare;
  -[PHMomentShare uuid](momentShare, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, <%@: %p, %@>>"), v4, self, v5, momentShare, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (PXCMMMomentShareInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (self->_shareType != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitation.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_shareType == PXDisplayMomentShareTypeReceiver"));

  }
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMomentShare:", self->_momentShare);
  objc_storeStrong((id *)(v6 + 72), self->_previewAssetsFetchResult);
  objc_storeStrong((id *)(v6 + 40), self->_posterAsset);
  objc_storeStrong((id *)(v6 + 48), self->_posterMediaProvider);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;
  v8 = v5;

  PXOwnerForMomentShareParticipantFetchResult(v8, self->_momentShare);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  return (PXCMMMomentShareInvitation *)(id)v6;
}

- (PXCMMMomentShareInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  PHMomentShare *momentShare;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMomentShare:", self->_momentShare);
  objc_storeStrong((id *)(v5 + 64), self->_participantsFetchResult);
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;
  v7 = v4;

  momentShare = self->_momentShare;
  v15 = 0;
  v16 = 0;
  _GetPreviewAsset(v7, momentShare, &v16, &v15);
  v9 = v16;
  v10 = v15;
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;
  v12 = v9;

  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  return (PXCMMMomentShareInvitation *)(id)v5;
}

- (NSURL)shareURL
{
  return (NSURL *)-[PHMomentShare shareURL](self->_momentShare, "shareURL");
}

- (NSString)identifier
{
  return (NSString *)-[PHMomentShare uuid](self->_momentShare, "uuid");
}

- (NSDate)creationDate
{
  return (NSDate *)-[PHMomentShare creationDate](self->_momentShare, "creationDate");
}

- (NSDate)expiryDate
{
  return (NSDate *)-[PHMomentShare expiryDate](self->_momentShare, "expiryDate");
}

- (unint64_t)count
{
  return -[PHMomentShare assetCount](self->_momentShare, "assetCount");
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return (PXAssetCollectionActionManager *)-[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", self->_momentShare, 0);
}

- (PXPhotosViewConfiguration)assetViewConfiguration
{
  PHMomentShare *momentShare;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXPhotosViewConfiguration *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  momentShare = self->_momentShare;
  v11[0] = *MEMORY[0x1E0CD1988];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = 1;
  +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:", momentShare, 0, 0, v4, 0, 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHMomentShare photoLibrary](self->_momentShare, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:]([PXPhotosViewConfiguration alloc], "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v5, v7, 0, 0, 0);
  return v8;
}

- (PXMomentShareStatusPresentation)statusPresentation
{
  void *v2;
  PXMomentShareStatusPresentation *v3;

  -[PXCMMMomentShareInvitation momentShareStatus](self, "momentShareStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXMomentShareStatusPresentation initWithMomentShareStatus:presentationStyle:]([PXMomentShareStatusPresentation alloc], "initWithMomentShareStatus:presentationStyle:", v2, 0);

  return v3;
}

- (id)contextForActivityType:(unint64_t)a3
{
  return -[PXCMMPhotoKitContext initWithMomentShare:activityType:sourceType:]([PXCMMPhotoKitContext alloc], "initWithMomentShare:activityType:sourceType:", self->_momentShare, a3, 0);
}

- (id)sessionForActivityType:(unint64_t)a3
{
  void *v3;
  PXCMMPhotoKitSession *v4;

  -[PXCMMMomentShareInvitation contextForActivityType:](self, "contextForActivityType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXCMMPhotoKitSession initWithPhotoKitContext:]([PXCMMPhotoKitSession alloc], "initWithPhotoKitContext:", v3);

  return v4;
}

- (void)acceptWithCompletionHandler:(id)a3
{
  PXMomentShareAcceptIfNeeded(self->_momentShare, a3);
}

- (id)momentShareStatus
{
  PXPhotoKitMomentShareStatus *v3;
  void *v4;
  PXPhotoKitMomentShareStatus *v5;

  v3 = [PXPhotoKitMomentShareStatus alloc];
  -[PXCMMMomentShareInvitation momentShare](self, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotoKitMomentShareStatus initWithPhotoKitMomentShare:](v3, "initWithPhotoKitMomentShare:", v4);

  return v5;
}

- (void)requestNotificationOnUploadCompletion
{
  PXMomentShareRequestNotificationOnUploadCompletion(self->_momentShare, 0xFFFFFFFFFFFFFFFFLL, 0);
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

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (PHFetchResult)participantsFetchResult
{
  return self->_participantsFetchResult;
}

- (PHFetchResult)previewAssetsFetchResult
{
  return self->_previewAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_participantsFetchResult, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
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
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentShareInvitation.m"), 52, CFSTR("%s is not available as initializer"), "+[PXCMMMomentShareInvitation new]");

  abort();
}

+ (id)invitationWithMomentShare:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  id v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentShareInvitation.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v6 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithMomentShare:", v5);
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXParticipantFetchResultForMomentShare(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    PXOwnerForMomentShareParticipantFetchResult(v8, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)v6[8];
  v6[8] = v9;
  v12 = v9;

  v13 = (void *)v6[4];
  v6[4] = v10;
  v14 = v10;

  objc_msgSend(v7, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFetchLimit:", 1);
  objc_msgSend(v15, "setIncludeAssetSourceTypes:", 8);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v6[9];
  v6[9] = v16;
  v18 = v16;

  v26 = 0;
  v27 = 0;
  _GetPreviewAsset(v18, v5, &v27, &v26);
  v19 = v27;
  v20 = v26;
  v21 = (void *)v6[5];
  v6[5] = v19;
  v22 = v19;

  v23 = (void *)v6[6];
  v6[6] = v20;

  return v6;
}

+ (id)menuItemTitleForDeletingInvitations:(id)a3
{
  void *v3;
  void *v4;

  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMenuItemTitleForTrashingMomentShares(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  PXMap();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  PXTrashMomentShares(v8, v7, v6);

}

+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5
{
  void *v7;

  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = PXMomentSharesSupportsSavingAssetsToLibrary(v7, (uint64_t *)a4, a5);

  return (char)a5;
}

+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  PXMap();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  PXMomentShareSaveAllAssetsToLibrary(v8, v7, v6);

}

@end
