@implementation PUReviewAssetsMediaDestination

- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PUSaveReviewAssetRequest *v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingOutput"));

  }
  -[PUReviewAssetsMediaDestination _mediaProvider](self, "_mediaProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaDestination _desiredOutputDirectory](self, "_desiredOutputDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUSaveReviewAssetRequest initWithAsset:mediaProvider:directory:contentEditingOutput:workImageVersion:]([PUSaveReviewAssetRequest alloc], "initWithAsset:mediaProvider:directory:contentEditingOutput:workImageVersion:", v10, v13, v14, v11, -[PUReviewAssetsMediaDestination _workImageVersionForContentEditingOutput:](self, "_workImageVersionForContentEditingOutput:", v11));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__PUReviewAssetsMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke;
  v20[3] = &unk_1E58A7120;
  v21 = v12;
  v16 = v12;
  -[PUReviewAssetsMediaDestination _saveEditsWithRequest:completionHandler:](self, "_saveEditsWithRequest:completionHandler:", v15, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = objc_msgSend(v17, "identifier");
  return (int)v15;
}

- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  PUSaveReviewAssetRequest *v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

  }
  PLPhotoEditGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_INFO, "PUReviewAssetsMediaDestination save edits for asset...", buf, 2u);
  }

  -[PUReviewAssetsMediaDestination _mediaProvider](self, "_mediaProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaDestination _desiredOutputDirectory](self, "_desiredOutputDirectory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PUSaveReviewAssetRequest initWithAsset:mediaProvider:directory:compositionController:workImageVersion:]([PUSaveReviewAssetRequest alloc], "initWithAsset:mediaProvider:directory:compositionController:workImageVersion:", v14, v19, v20, v15, a6);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __149__PUReviewAssetsMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke;
  v26[3] = &unk_1E58A7120;
  v27 = v17;
  v22 = v17;
  -[PUReviewAssetsMediaDestination _saveEditsWithRequest:completionHandler:](self, "_saveEditsWithRequest:completionHandler:", v21, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = objc_msgSend(v23, "identifier");
  return (int)v21;
}

- (int)revertEditsForAsset:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PUSaveReviewAssetRequest *v11;
  id v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PUReviewAssetsMediaDestination _mediaProvider](self, "_mediaProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaDestination _desiredOutputDirectory](self, "_desiredOutputDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUSaveReviewAssetRequest initWithAssetForRevertToOriginal:mediaProvider:directory:]([PUSaveReviewAssetRequest alloc], "initWithAssetForRevertToOriginal:mediaProvider:directory:", v7, v9, v10);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PUReviewAssetsMediaDestination_revertEditsForAsset_completionHandler___block_invoke;
  v16[3] = &unk_1E58A7120;
  v17 = v8;
  v12 = v8;
  -[PUReviewAssetsMediaDestination _saveEditsWithRequest:completionHandler:](self, "_saveEditsWithRequest:completionHandler:", v11, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = objc_msgSend(v13, "identifier");
  return (int)v11;
}

- (void)cancelRequestWithIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[PUReviewAssetsMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cancelSaveOperation");
}

- (BOOL)supportsProgressForRequestWithIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[PUReviewAssetsMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "supportsProgress");
  return (char)v5;
}

- (double)progressForRequestWithIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = *(_QWORD *)&a3;
  -[PUReviewAssetsMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (objc_msgSend(v6, "supportsProgress"))
  {
    objc_msgSend(v6, "progress");
    v7 = v8;
  }

  return v7;
}

- (id)_saveEditsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("saveRequest"));

  }
  v9 = objc_msgSend(v7, "identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 119, CFSTR("Cannot begin a new request if there is a pending one for this photo"));

    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "setObject:forKey:", v7, v10);
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__PUReviewAssetsMediaDestination__saveEditsWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E58A7148;
    objc_copyWeak(&v21, &location);
    v13 = v7;
    v19 = v13;
    v20 = v8;
    objc_msgSend(v13, "beginSaveOperationWithCompletionHandler:", v18);
    v14 = v13;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)_requestDidFinish:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaDestination.m"), 146, CFSTR("The pending request doesn't match the expected request"));

  }
  objc_msgSend(v7, "removeObjectForKey:", v10);

}

- (int64_t)_workImageVersionForContentEditingOutput:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "baseVersion");
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

- (PUReviewAssetsMediaDestination)initWithOutputDirectory:(id)a3 mediaProvider:(id)a4
{
  id v6;
  id v7;
  PUReviewAssetsMediaDestination *v8;
  uint64_t v9;
  NSURL *desiredOutputDirectory;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingRequestsByRequestIdentifier;
  PUReviewAssetsMediaDestination *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUReviewAssetsMediaDestination;
  v8 = -[PUReviewAssetsMediaDestination init](&v15, sel_init);
  if (v8 && objc_msgSend(v6, "hasDirectoryPath"))
  {
    v9 = objc_msgSend(v6, "copy");
    desiredOutputDirectory = v8->__desiredOutputDirectory;
    v8->__desiredOutputDirectory = (NSURL *)v9;

    objc_storeStrong((id *)&v8->__mediaProvider, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequestsByRequestIdentifier = v8->_pendingRequestsByRequestIdentifier;
    v8->_pendingRequestsByRequestIdentifier = v11;

    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSURL)_desiredOutputDirectory
{
  return self->__desiredOutputDirectory;
}

- (PUEditableMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (NSMutableDictionary)_pendingRequestsByRequestIdentifier
{
  return self->_pendingRequestsByRequestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__desiredOutputDirectory, 0);
}

void __74__PUReviewAssetsMediaDestination__saveEditsWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_requestDidFinish:", *(_QWORD *)(a1 + 32));

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

uint64_t __72__PUReviewAssetsMediaDestination_revertEditsForAsset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __149__PUReviewAssetsMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __111__PUReviewAssetsMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
