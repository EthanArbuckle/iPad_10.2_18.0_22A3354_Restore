@implementation PXMomentShareStatusMock

- (PXMomentShareStatusMock)initWithMomentShare:(id)a3
{
  id v5;
  PXMomentShareStatusMock *v6;
  PXMomentShareStatusMock *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXMomentShareStatusMock;
  v6 = -[PXMomentShareStatus initWithMomentShare:](&v10, sel_initWithMomentShare_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalMomentShare, a3);
    -[PXMomentShareStatusMock _updateStatus](v7, "_updateStatus");
    PXSharedUserDefaults();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v7, CFSTR("MomentShareStatusMock"), 0, &_MockMomentShareStatusUserDefaultsContext);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PXSharedUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("MomentShareStatusMock"), &_MockMomentShareStatusUserDefaultsContext);

  v4.receiver = self;
  v4.super_class = (Class)PXMomentShareStatusMock;
  -[PXMomentShareStatusMock dealloc](&v4, sel_dealloc);
}

- (id)_createStatusProvider
{
  void *v2;
  PXPhotoKitCPLActionManager *v3;
  PXCPLUIStatusProvider *v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v2);
  v4 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v2, v3);

  return v4;
}

- (void)_updateStatus
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  int64x2_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SEL v28;
  PXMomentShareStatusMock *v29;
  uint64_t v30;
  void *v31;
  PXMomentShareStatusMock *v32;
  __int128 v33;
  _QWORD v34[4];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int16 v43;
  _QWORD v44[6];

  PXSharedUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MomentShareStatusMock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = a2;
      v29 = self;
      v30 = 216;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self;
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("sender")))
      {
        v33 = 0u;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("uploading"), v7) & 1) != 0)
        {
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 1;
          v14 = 26;
          v15 = 49;
LABEL_48:

          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __40__PXMomentShareStatusMock__updateStatus__block_invoke_2;
          v34[3] = &__block_descriptor_114_e38_v16__0___PXMutableMomentShareStatus__8l;
          v43 = v13;
          v35 = xmmword_1A7C0C6E0;
          v36 = v15;
          v37 = v14;
          v38 = v9;
          v39 = v10;
          v40 = v11;
          v41 = v33;
          v42 = v12;
          -[PXMomentShareStatus performChanges:](v32, "performChanges:", v34);

          goto LABEL_49;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("downloading")) & 1) != 0)
        {
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v33 = xmmword_1A7C0C6D0;
          v13 = 1;
LABEL_29:
          v12 = 26;
          v14 = 40;
          v15 = 60;
          goto LABEL_48;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("idle")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 161, CFSTR("MockMomentShareStatus only supports uploading/downloading/idle for sender"));

          v15 = 0;
          v14 = 0;
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 1;
          goto LABEL_48;
        }
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v33 = xmmword_1A7C0C6B0;
        v13 = 1;
        goto LABEL_44;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("receiver"), v7))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("downloading")))
        {
          v33 = xmmword_1A7C0C6D0;
          if ((unint64_t)objc_msgSend(v6, "count") < 3)
          {
            v9 = 0;
            v10 = 0;
            v11 = 0;
            v13 = 3;
            goto LABEL_29;
          }
          objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("waitingforupload"));

          v9 = 0;
          v10 = 0;
          v11 = 0;
          if (v17)
            v15 = 49;
          else
            v15 = 60;
          v12 = 26;
          if (v17)
            v14 = 26;
          else
            v14 = 40;
LABEL_47:
          v13 = 3;
          goto LABEL_48;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("saving")))
        {
          v33 = xmmword_1A7C0C6B0;
          if ((unint64_t)objc_msgSend(v6, "count") >= 3)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("savingall"));

            v11 = 0;
            v15 = 60;
            if (v19)
              v9 = 60;
            else
              v9 = 49;
            v14 = 40;
            if (v19)
              v10 = 40;
            else
              v10 = 26;
LABEL_38:
            v13 = 3;
LABEL_45:
            v12 = 40;
            goto LABEL_48;
          }
          v11 = 0;
          v13 = 3;
          v10 = 26;
          v9 = 49;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("saved")))
        {
          if ((unint64_t)objc_msgSend(v6, "count") >= 3)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("savedall"));

            v9 = 0;
            v10 = 0;
            v15 = 60;
            if (v21)
              v11 = 60;
            else
              v11 = 49;
            v22 = 26;
            v14 = 40;
            if (v21)
              v22 = 40;
            v23 = vdupq_n_s64(0x3CuLL);
            v23.i64[0] = v22;
            v33 = (__int128)v23;
            goto LABEL_38;
          }
          v9 = 0;
          v10 = 0;
          v33 = xmmword_1A7C0C6C0;
          v13 = 3;
          v11 = 49;
        }
        else
        {
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("idle")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 209, CFSTR("MockMomentShareStatus only supports downloading/saving/saved/idle for receiver"));

            v15 = 0;
            v14 = 0;
            v9 = 0;
            v10 = 0;
            v11 = 0;
            v12 = 0;
            v33 = 0u;
            goto LABEL_47;
          }
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v33 = xmmword_1A7C0C6B0;
          v13 = 3;
        }
LABEL_44:
        v14 = 40;
        v15 = 60;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = a2;
      v29 = self;
      v30 = 213;
    }
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("PXMomentShareStatusMock.m"), v30, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __40__PXMomentShareStatusMock__updateStatus__block_invoke;
  v44[3] = &unk_1E5131BB8;
  v44[4] = self;
  -[PXMomentShareStatus performChanges:](self, "performChanges:", v44);
LABEL_49:

}

- (id)owner
{
  _PXMomentShareMockParticipant *v2;

  v2 = objc_alloc_init(_PXMomentShareMockParticipant);
  -[_PXMomentShareMockParticipant setLocalizedName:](v2, "setLocalizedName:", CFSTR("Jane"));
  -[_PXMomentShareMockParticipant setFirstName:](v2, "setFirstName:", CFSTR("Jane"));
  -[_PXMomentShareMockParticipant setLastName:](v2, "setLastName:", CFSTR("Doe"));
  return v2;
}

- (id)_actionManager
{
  PXDisplayMomentShare *v4;
  void *v5;
  PXPhotoKitCPLActionManager *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v4 = self->_originalMomentShare;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_originalMomentShare"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayMomentShare px_descriptionForAssertionMessage](v4, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_originalMomentShare"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  -[PXDisplayMomentShare photoLibrary](v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v5);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (a6 == &_MockMomentShareStatusUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXMomentShareStatusMock_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXMomentShareStatusMock;
    -[PXMomentShareStatusMock observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockMomentShare, 0);
  objc_storeStrong((id *)&self->_originalMomentShare, 0);
}

uint64_t __74__PXMomentShareStatusMock_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatus");
}

void __40__PXMomentShareStatusMock__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  _PXMomentShareMockFetchResult *v4;
  _PXMomentShareMockFetchResult *v5;
  _PXMomentShareMockFetchResult *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v3 = a2;
  objc_msgSend(v3, "setMomentShare:", v2);
  v4 = objc_alloc_init(_PXMomentShareMockFetchResult);
  objc_msgSend(v3, "setCopyingAssetsFetchResult:", v4);

  v5 = objc_alloc_init(_PXMomentShareMockFetchResult);
  objc_msgSend(v3, "setCopiedAssetsFetchResult:", v5);

  v6 = objc_alloc_init(_PXMomentShareMockFetchResult);
  objc_msgSend(v3, "setAllAssetsFetchResult:", v6);

}

void __40__PXMomentShareStatusMock__updateStatus__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(unsigned __int16 *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = a2;
  +[_PXMomentShareMockMomentShare momentShareWithStatus:photosCount:videosCount:uploadedPhotosCount:uploadedVideosCount:](_PXMomentShareMockMomentShare, "momentShareWithStatus:photosCount:videosCount:uploadedPhotosCount:uploadedVideosCount:", v3, v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMomentShare:", v9);

  +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:videosCount:](_PXMomentShareMockFetchResult, "momentShareMockFetchResultWithPhotosCount:videosCount:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCopyingAssetsFetchResult:", v10);

  +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:videosCount:](_PXMomentShareMockFetchResult, "momentShareMockFetchResultWithPhotosCount:videosCount:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCopiedAssetsFetchResult:", v11);

  +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:videosCount:](_PXMomentShareMockFetchResult, "momentShareMockFetchResultWithPhotosCount:videosCount:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllAssetsFetchResult:", v12);

}

+ (BOOL)shouldUseMockStatus
{
  void *v2;
  void *v3;
  BOOL v4;

  PXSharedUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MomentShareStatusMock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
