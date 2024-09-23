@implementation PEPhotoKitMediaDestination

- (PEPhotoKitMediaDestination)init
{
  PEPhotoKitMediaDestination *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingRequestsByRequestIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PEPhotoKitMediaDestination;
  v2 = -[PEPhotoKitMediaDestination init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingRequestsByRequestIdentifier = v2->_pendingRequestsByRequestIdentifier;
    v2->_pendingRequestsByRequestIdentifier = v3;

  }
  return v2;
}

- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  PESaveRequest *v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  PEPhotoKitMediaDestination *v25;
  id v26;
  uint8_t buf[16];

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingOutput"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 40, CFSTR("PEPhotoKitMediaDestination can only support PHAsset!"));

  }
  PLPhotoEditGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_INFO, "PEPhotoKitMediaDestination save edits by using content editing output...", buf, 2u);
  }

  v15 = v11;
  v16 = -[PESaveRequest initWithPhoto:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:]([PESaveRequest alloc], "initWithPhoto:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:", v15, v12, v7, -[PEPhotoKitMediaDestination applyVideoOrientationAsMetadata](self, "applyVideoOrientationAsMetadata"));
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __107__PEPhotoKitMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke;
  v23[3] = &unk_24C617FF8;
  v25 = self;
  v26 = v13;
  v24 = v15;
  v17 = v15;
  v18 = v13;
  -[PEPhotoKitMediaDestination _saveEditsForPhoto:saveRequest:completionHandler:](self, "_saveEditsForPhoto:saveRequest:completionHandler:", v17, v16, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = objc_msgSend(v19, "identifier");
  return (int)v16;
}

- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  PESaveRequest *v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  PEPhotoKitMediaDestination *v29;
  id v30;
  uint8_t buf[16];

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 67, CFSTR("PEPhotoKitMediaDestination can only support PHAsset!"));

  }
  PLPhotoEditGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v18, OS_LOG_TYPE_INFO, "PEPhotoKitMediaDestination save edits for asset...", buf, 2u);
  }

  v19 = v14;
  v20 = -[PESaveRequest initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:]([PESaveRequest alloc], "initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:", v19, v15, v16, v9, -[PEPhotoKitMediaDestination applyVideoOrientationAsMetadata](self, "applyVideoOrientationAsMetadata"));
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke;
  v27[3] = &unk_24C617FF8;
  v29 = self;
  v30 = v17;
  v28 = v19;
  v21 = v19;
  v22 = v17;
  -[PEPhotoKitMediaDestination _saveEditsForPhoto:saveRequest:completionHandler:](self, "_saveEditsForPhoto:saveRequest:completionHandler:", v21, v20, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = objc_msgSend(v23, "identifier");
  return (int)v19;
}

- (int)revertEditsForAsset:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  PESaveRequest *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 97, CFSTR("PEPhotoKitMediaDestination can only support PHAsset!"));

  }
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_INFO, "PEPhotoKitMediaDestination revert edits...", buf, 2u);
  }

  v10 = v7;
  v11 = -[PESaveRequest initWithPhotoToRevertToOriginal:applyVideoOrientationAsMetadata:]([PESaveRequest alloc], "initWithPhotoToRevertToOriginal:applyVideoOrientationAsMetadata:", v10, -[PEPhotoKitMediaDestination applyVideoOrientationAsMetadata](self, "applyVideoOrientationAsMetadata"));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__PEPhotoKitMediaDestination_revertEditsForAsset_completionHandler___block_invoke;
  v18[3] = &unk_24C617FF8;
  v19 = v10;
  v20 = v8;
  v18[4] = self;
  v12 = v10;
  v13 = v8;
  -[PEPhotoKitMediaDestination _saveEditsForPhoto:saveRequest:completionHandler:](self, "_saveEditsForPhoto:saveRequest:completionHandler:", v12, v11, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = objc_msgSend(v14, "identifier");
  return (int)v11;
}

- (void)cancelRequestWithIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[PEPhotoKitMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
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
  -[PEPhotoKitMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
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
  -[PEPhotoKitMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
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

- (id)_saveEditsForPhoto:(id)a3 saveRequest:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  PEPhotoKitMediaDestination *v25;
  id v26;
  id v27;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photo"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("saveRequest"));

LABEL_3:
  v12 = objc_msgSend(v10, "identifier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEPhotoKitMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 148, CFSTR("Cannot begin a new request if there is a pending one for this photo"));

    v18 = 0;
  }
  else
  {
    objc_msgSend(v14, "setObject:forKey:", v10, v13);
    -[PEPhotoKitMediaDestination delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mediaDestination:willBeginSaveRequest:", self, v10);

    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __79__PEPhotoKitMediaDestination__saveEditsForPhoto_saveRequest_completionHandler___block_invoke;
    v23[3] = &unk_24C618020;
    objc_copyWeak(&v27, &location);
    v17 = v10;
    v24 = v17;
    v25 = self;
    v26 = v11;
    objc_msgSend(v17, "beginSaveOperationWithCompletionHandler:", v23);
    v18 = v17;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v18;
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PEPhotoKitMediaDestination _pendingRequestsByRequestIdentifier](self, "_pendingRequestsByRequestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEPhotoKitMediaDestination.m"), 181, CFSTR("The pending request doesn't match the expected request"));

  }
  objc_msgSend(v7, "removeObjectForKey:", v10);

}

- (id)_fetchUpdatedAssetWithLocalIdentifier:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDE3570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDE3488];
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_ERROR, "Error fetching photo with local identifier: %{public}@", (uint8_t *)&v13, 0xCu);
    }

  }
  return v10;
}

- (PEPhotoKitMediaDestinationDelegate)delegate
{
  return (PEPhotoKitMediaDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (NSMutableDictionary)_pendingRequestsByRequestIdentifier
{
  return self->_pendingRequestsByRequestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsByRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __79__PEPhotoKitMediaDestination__saveEditsForPhoto_saveRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PLPhotoEditGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_20D13D000, v6, OS_LOG_TYPE_INFO, "PEPhotoKitMediaDestination saved edits successfully: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_requestDidFinish:", *(_QWORD *)(a1 + 32));

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaDestination:didCompleteSaveRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __68__PEPhotoKitMediaDestination_revertEditsForAsset_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v11 = v5;
    if (a2)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_fetchUpdatedAssetWithLocalIdentifier:photoLibrary:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v10 = 0;
    }
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v11);

    v5 = v11;
  }

}

void __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_fetchUpdatedAssetWithLocalIdentifier:photoLibrary:", v6, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v5 | v9)
      {
LABEL_6:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke_2;
        block[3] = &unk_24C619258;
        v18 = *(id *)(a1 + 48);
        v16 = (id)v9;
        v5 = (uint64_t)(id)v5;
        v17 = (id)v5;
        v14 = (id)v9;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        goto LABEL_7;
      }
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDE3870];
      v19 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PEPhotoKitMediaDestination saveInternalEditsForAsset: Missing asset with local identifier: %@"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", v11, 3303, v13);
      v5 = objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__PEPhotoKitMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_fetchUpdatedAssetWithLocalIdentifier:photoLibrary:", v6, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v5 | v9)
      {
LABEL_6:
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        goto LABEL_7;
      }
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDE3870];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PEPhotoKitMediaDestination saveEditsForAsset: Missing asset with local identifier: %@"), v6, *MEMORY[0x24BDD0FC8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", v11, 3303, v13);
      v5 = objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
    goto LABEL_6;
  }
LABEL_7:

}

@end
