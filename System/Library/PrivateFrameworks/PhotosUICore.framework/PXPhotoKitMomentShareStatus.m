@implementation PXPhotoKitMomentShareStatus

- (PXPhotoKitMomentShareStatus)initWithPhotoKitMomentShare:(id)a3
{
  id v5;
  PXPhotoKitMomentShareStatus *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatus.m"), 131, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("momentShare"), v11, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatus.m"), 131, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("momentShare"), v11);
  }

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitMomentShareStatus;
  v6 = -[PXMomentShareStatus initWithMomentShare:](&v14, sel_initWithMomentShare_, v5);
  if (v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_registerChangeObserver:", v6);
    -[PXPhotoKitMomentShareStatus _prepareFetchResultsForPhotoLibrary:](v6, "_prepareFetchResultsForPhotoLibrary:", v7);

  }
  return v6;
}

- (id)invitation
{
  PXCMMMomentShareInvitation *invitation;
  void *v4;
  PXCMMMomentShareInvitation *v5;
  PXCMMMomentShareInvitation *v6;

  invitation = self->_invitation;
  if (!invitation)
  {
    -[PXMomentShareStatus momentShare](self, "momentShare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCMMMomentShareInvitation invitationWithMomentShare:](PXCMMMomentShareInvitation, "invitationWithMomentShare:", v4);
    v5 = (PXCMMMomentShareInvitation *)objc_claimAutoreleasedReturnValue();
    v6 = self->_invitation;
    self->_invitation = v5;

    invitation = self->_invitation;
  }
  return invitation;
}

- (id)_createStatusProvider
{
  void *v2;
  void *v3;
  PXPhotoKitCPLActionManager *v4;
  PXCPLUIStatusProvider *v5;

  -[PXMomentShareStatus momentShare](self, "momentShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v3);
  v5 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v3, v4);

  return v5;
}

- (void)_prepareFetchResultsForPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMomentShareStatus momentShare](self, "momentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.destinationAssetCopyState == %d"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.destinationAssetCopyState == %d"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__PXPhotoKitMomentShareStatus__prepareFetchResultsForPhotoLibrary___block_invoke;
  v15[3] = &unk_1E5143418;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v7;
  -[PXMomentShareStatus performChanges:](self, "performChanges:", v15);

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v4 = a3;
  -[PXMomentShareStatus copyingAssetsFetchResult](self, "copyingAssetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[PXMomentShareStatus copiedAssetsFetchResult](self, "copiedAssetsFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "fetchResultAfterChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[PXMomentShareStatus allAssetsFetchResult](self, "allAssetsFetchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "fetchResultAfterChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[PXMomentShareStatus momentShare](self, "momentShare");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "objectAfterChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__PXPhotoKitMomentShareStatus_photoLibraryDidChangeOnMainQueue___block_invoke;
    v18[3] = &unk_1E5143440;
    v19 = v7;
    v20 = v10;
    v23 = v15 != 0;
    v21 = v13;
    v22 = v16;
    v17 = v16;
    -[PXMomentShareStatus performChanges:](self, "performChanges:", v18);

    goto LABEL_13;
  }
  v16 = 0;
  if (v7 || v10 || v13)
    goto LABEL_12;
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
}

void __64__PXPhotoKitMomentShareStatus_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setCopyingAssetsFetchResult:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "setCopiedAssetsFetchResult:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v4, "setAllAssetsFetchResult:");
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v4, "setMomentShare:", *(_QWORD *)(a1 + 56));
    v3 = v4;
  }

}

void __67__PXPhotoKitMomentShareStatus__prepareFetchResultsForPhotoLibrary___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setCopyingAssetsFetchResult:", v3);
  objc_msgSend(v4, "setCopiedAssetsFetchResult:", a1[5]);
  objc_msgSend(v4, "setAllAssetsFetchResult:", a1[6]);

}

@end
