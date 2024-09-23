@implementation PXEditMemoryAction

- (PXEditMemoryAction)initWithMemory:(id)a3 photosGraphData:(id)a4 storyColorGradeKind:(int64_t)a5 keyAsset:(id)a6 userCuratedAssets:(id)a7 customUserAssetsEdit:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  PXEditMemoryAction *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSData *undoPhotosGraphData;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PXMemoryCustomUserAssetsEdit *undoCustomUserAssetsEdit;
  uint64_t v36;
  PXMemoryCustomUserAssetsEdit *v37;
  PXMemoryCustomUserAssetsEdit *redoCustomUserAssetsEdit;
  PXMemoryCustomUserAssetsEdit *v39;
  PXMemoryCustomUserAssetsEdit *v40;
  id obj;
  id obja;
  id v44;
  objc_super v45;

  v15 = a3;
  v44 = a4;
  v16 = a6;
  v17 = a7;
  obj = a8;
  v18 = a8;
  objc_msgSend(v15, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45.receiver = self;
  v45.super_class = (Class)PXEditMemoryAction;
  v20 = -[PXPhotosAction initWithPhotoLibrary:](&v45, sel_initWithPhotoLibrary_, v19);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_memory, a3);
    objc_storeStrong((id *)&v20->_redoPhotosGraphData, a4);
    v21 = (void *)MEMORY[0x1E0CD1630];
    objc_msgSend(v15, "photosGraphProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_photosGraphDataFromProperties:error:", v22, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    undoPhotosGraphData = v20->_undoPhotosGraphData;
    v20->_undoPhotosGraphData = (NSData *)v23;

    v20->_redoStoryColorGradeKind = a5;
    if (a5)
      v25 = objc_msgSend(v15, "storyColorGradeKind", obj, v44);
    else
      v25 = 0;
    v20->_undoStoryColorGradeKind = v25;
    objc_storeStrong((id *)&v20->_redoKeyAsset, a6);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v15, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    objc_storeStrong((id *)&v20->_undoKeyAsset, v26);
    if (v16)
    {

    }
    if (v17)
    {
      PXDisplayAssetFetchResultFastEnumeration();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    objc_storeStrong((id *)&v20->_redoUserCuratedAssets, v27);
    if (v17)
    {

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchUserCuratedAssetsInMemory:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_storeStrong((id *)&v20->_undoUserCuratedAssets, v28);
    if (v17)

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", obj);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "allowCustomUserAssets");

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v15, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "librarySpecificFetchOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fetchCustomUserAssetsInMemory:options:", v15, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
LABEL_20:
        objc_storeStrong((id *)&v20->_redoCustomUserAssetsEdit, obja);
        undoCustomUserAssetsEdit = -[PXMemoryCustomUserAssetsEdit initWithAssets:]([PXMemoryCustomUserAssetsEdit alloc], "initWithAssets:", v34);
        goto LABEL_26;
      }
    }
    else
    {
      v34 = 0;
      if (v18)
        goto LABEL_20;
    }
    v36 = objc_msgSend(v34, "count");
    if (v17 && v36)
    {
      v37 = -[PXMemoryCustomUserAssetsEdit initWithAssets:]([PXMemoryCustomUserAssetsEdit alloc], "initWithAssets:", v17);
      redoCustomUserAssetsEdit = v20->_redoCustomUserAssetsEdit;
      v20->_redoCustomUserAssetsEdit = v37;

      v39 = -[PXMemoryCustomUserAssetsEdit initWithAssets:]([PXMemoryCustomUserAssetsEdit alloc], "initWithAssets:", v34);
      undoCustomUserAssetsEdit = v20->_undoCustomUserAssetsEdit;
      v20->_undoCustomUserAssetsEdit = v39;
      goto LABEL_27;
    }
    v40 = v20->_redoCustomUserAssetsEdit;
    v20->_redoCustomUserAssetsEdit = 0;

    undoCustomUserAssetsEdit = 0;
LABEL_26:
    objc_storeStrong((id *)&v20->_undoCustomUserAssetsEdit, undoCustomUserAssetsEdit);
    if (!v18)
    {
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:

  return v20;
}

- (void)_changePhotosGraphData:(id)a3 storyColorGradeKind:(int64_t)a4 keyAsset:(id)a5 userCuratedAssets:(id)a6 customUserAssetsEdit:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[PXEditMemoryAction memory](self, "memory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __131__PXEditMemoryAction__changePhotosGraphData_storyColorGradeKind_keyAsset_userCuratedAssets_customUserAssetsEdit_completionHandler___block_invoke;
  v25[3] = &unk_1E511BC80;
  v26 = v19;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = a4;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = v19;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v25, v18);

}

- (id)actionIdentifier
{
  return CFSTR("EditMemory");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXEditMemoryActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXEditMemoryAction redoPhotosGraphData](self, "redoPhotosGraphData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXEditMemoryAction redoStoryColorGradeKind](self, "redoStoryColorGradeKind");
  -[PXEditMemoryAction redoKeyAsset](self, "redoKeyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction redoUserCuratedAssets](self, "redoUserCuratedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction redoCustomUserAssetsEdit](self, "redoCustomUserAssetsEdit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction _changePhotosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:completionHandler:](self, "_changePhotosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:completionHandler:", v9, v5, v6, v7, v8, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXEditMemoryAction undoPhotosGraphData](self, "undoPhotosGraphData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXEditMemoryAction undoStoryColorGradeKind](self, "undoStoryColorGradeKind");
  -[PXEditMemoryAction undoKeyAsset](self, "undoKeyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction undoUserCuratedAssets](self, "undoUserCuratedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction undoCustomUserAssetsEdit](self, "undoCustomUserAssetsEdit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditMemoryAction _changePhotosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:completionHandler:](self, "_changePhotosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:completionHandler:", v9, v5, v6, v7, v8, v4);

}

- (PHMemory)memory
{
  return self->_memory;
}

- (NSData)redoPhotosGraphData
{
  return self->_redoPhotosGraphData;
}

- (NSData)undoPhotosGraphData
{
  return self->_undoPhotosGraphData;
}

- (int64_t)undoStoryColorGradeKind
{
  return self->_undoStoryColorGradeKind;
}

- (int64_t)redoStoryColorGradeKind
{
  return self->_redoStoryColorGradeKind;
}

- (PHAsset)undoKeyAsset
{
  return self->_undoKeyAsset;
}

- (PHAsset)redoKeyAsset
{
  return self->_redoKeyAsset;
}

- (NSFastEnumeration)undoUserCuratedAssets
{
  return self->_undoUserCuratedAssets;
}

- (NSFastEnumeration)redoUserCuratedAssets
{
  return self->_redoUserCuratedAssets;
}

- (PXMemoryCustomUserAssetsEdit)undoCustomUserAssetsEdit
{
  return self->_undoCustomUserAssetsEdit;
}

- (PXMemoryCustomUserAssetsEdit)redoCustomUserAssetsEdit
{
  return self->_redoCustomUserAssetsEdit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoCustomUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_undoCustomUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_redoUserCuratedAssets, 0);
  objc_storeStrong((id *)&self->_undoUserCuratedAssets, 0);
  objc_storeStrong((id *)&self->_redoKeyAsset, 0);
  objc_storeStrong((id *)&self->_undoKeyAsset, 0);
  objc_storeStrong((id *)&self->_undoPhotosGraphData, 0);
  objc_storeStrong((id *)&self->_redoPhotosGraphData, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

void __131__PXEditMemoryAction__changePhotosGraphData_storyColorGradeKind_keyAsset_userCuratedAssets_customUserAssetsEdit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhotosGraphData:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v6, "setStoryColorGradeKind:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v6, "setKeyAsset:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v6, "setUserCuratedAssets:");
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    objc_msgSend(v2, "assets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 64), "assets");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultFastEnumeration();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(v6, "setCustomUserAssets:", v5);
  }

}

@end
