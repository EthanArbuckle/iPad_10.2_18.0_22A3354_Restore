@implementation PUPhotoEditSnapshotFinishingNode

- (PUPhotoEditSnapshotFinishingNode)initWithAdjustmentNode:(id)a3 baseMediaNode:(id)a4 currentImageNode:(id)a5 currentVideoNode:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  PUPhotoEditSnapshotFinishingNode *v18;
  uint64_t v19;
  id completionHandler;
  id v22;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v22 = a6;
  v16 = a7;
  v24[0] = v13;
  v24[1] = v14;
  v24[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PUPhotoEditSnapshotFinishingNode;
  v18 = -[PXRunNode initWithDependencies:](&v23, sel_initWithDependencies_, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_adjustmentNode, a3);
    objc_storeStrong((id *)&v18->_baseMediaNode, a4);
    objc_storeStrong((id *)&v18->_currentImageNode, a5);
    objc_storeStrong((id *)&v18->_currentVideoNode, a6);
    v19 = objc_msgSend(v16, "copy");
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = (id)v19;

  }
  return v18;
}

- (void)run
{
  PUPhotoEditSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (**v16)(void *, void *);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PUPhotoEditSnapshot *v27;
  uint64_t v28;
  void *v29;
  _QWORD block[5];
  PUPhotoEditSnapshot *v31;
  _QWORD aBlock[6];

  v4 = objc_alloc_init(PUPhotoEditSnapshot);
  -[PUPhotoEditSnapshotFinishingNode baseMediaNode](self, "baseMediaNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditSnapshotFinishingNode currentImageNode](self, "currentImageNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditSnapshotFinishingNode currentImageNode](self, "currentImageNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageDataUTI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditSnapshotFinishingNode adjustmentNode](self, "adjustmentNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustmentData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "baseVersion");
  -[PUPhotoEditSnapshotFinishingNode currentVideoNode](self, "currentVideoNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke;
    aBlock[3] = &unk_1E58A43A0;
    aBlock[4] = self;
    aBlock[5] = a2;
    v16 = (void (**)(void *, void *))_Block_copy(aBlock);
    -[PUPhotoEditSnapshotFinishingNode currentVideoNode](self, "currentVideoNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "videoAsset");
    v29 = v12;
    v18 = v10;
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v20);
    v28 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditSnapshotFinishingNode baseMediaNode](self, "baseMediaNode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "videoAsset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v23);
    v24 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v19;
    v10 = v18;
    v12 = v29;

    -[PUPhotoEditSnapshot _setVideoComplement:](v4, "_setVideoComplement:", v21);
    -[PUPhotoEditSnapshot _setBaseVideoComplement:](v4, "_setBaseVideoComplement:", v25);

    v8 = v24;
    v15 = MEMORY[0x1E0C809B0];

    v13 = v28;
  }
  if (v13)
    v26 = 2;
  else
    v26 = 1;
  -[PUPhotoEditSnapshot _setImageData:](v4, "_setImageData:", v8, v28);
  -[PUPhotoEditSnapshot _setImageUTI:](v4, "_setImageUTI:", v10);
  -[PUPhotoEditSnapshot _setBaseImageData:](v4, "_setBaseImageData:", v6);
  -[PUPhotoEditSnapshot _setAdjustmentData:](v4, "_setAdjustmentData:", v12);
  -[PUPhotoEditSnapshot _setWorkImageVersion:](v4, "_setWorkImageVersion:", v26);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke_2;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v31 = v4;
  v27 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode
{
  return self->_adjustmentNode;
}

- (PUPhotoEditBaseMediaNode)baseMediaNode
{
  return self->_baseMediaNode;
}

- (PUEditableMediaProviderImageDataNode)currentImageNode
{
  return self->_currentImageNode;
}

- (PUEditableMediaProviderVideoAssetNode)currentVideoNode
{
  return self->_currentVideoNode;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentVideoNode, 0);
  objc_storeStrong((id *)&self->_currentImageNode, 0);
  objc_storeStrong((id *)&self->_baseMediaNode, 0);
  objc_storeStrong((id *)&self->_adjustmentNode, 0);
}

id __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v6;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PUPhotoEditSnapshot.m"), 264, CFSTR("No video URL for video asset: %@"), v3);

    }
    v4 = v3;
  }

  return v3;
}

uint64_t __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

@end
