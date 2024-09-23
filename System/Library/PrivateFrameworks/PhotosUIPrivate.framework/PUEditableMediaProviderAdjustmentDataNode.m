@implementation PUEditableMediaProviderAdjustmentDataNode

- (PUEditableMediaProviderAdjustmentDataNode)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  PUEditableMediaProviderAdjustmentDataNode *v9;
  PUEditableMediaProviderAdjustmentDataNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUEditableMediaProviderAdjustmentDataNode;
  v9 = -[PXRunNode initWithDependencies:](&v12, sel_initWithDependencies_, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

- (void)didCancel
{
  id v3;

  -[PUEditableMediaProviderAdjustmentDataNode mediaProvider](self, "mediaProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", self->_requestID);

}

- (void)run
{
  PHAdjustmentData *adjustmentData;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = 0;

  v4 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v4, "setVersion:", 16);
  -[PUEditableMediaProviderAdjustmentDataNode asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditableMediaProviderAdjustmentDataNode mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PUEditableMediaProviderAdjustmentDataNode_run__block_invoke;
  v7[3] = &unk_1E589E738;
  objc_copyWeak(&v8, &location);
  self->_requestID = objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 0, v4, v7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_handleDidLoadAdjustmentData:(id)a3 error:(id)a4
{
  PHAdjustmentData *v6;
  id v7;
  NSObject *v8;
  PHAdjustmentData *adjustmentData;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (PHAdjustmentData *)a3;
  v7 = a4;
  if (!v6)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Error fetching adjustment data: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = v6;

  -[PXRunNode completeWithError:](self, "completeWithError:", v7);
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __48__PUEditableMediaProviderAdjustmentDataNode_run__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  v4 = *MEMORY[0x1E0CD1820];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidLoadAdjustmentData:error:", v8, v6);

}

@end
