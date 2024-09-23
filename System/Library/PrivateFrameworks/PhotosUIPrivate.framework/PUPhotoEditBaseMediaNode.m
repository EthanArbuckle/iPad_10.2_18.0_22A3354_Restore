@implementation PUPhotoEditBaseMediaNode

- (PUPhotoEditBaseMediaNode)initWithAdjustmentNode:(id)a3
{
  id v5;
  void *v6;
  PUPhotoEditBaseMediaNode *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditBaseMediaNode;
  v7 = -[PXRunNode initWithDependencies:](&v9, sel_initWithDependencies_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_adjustmentNode, a3);

  return v7;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUEditableMediaProviderImageDataNode *v7;
  PUEditableMediaProviderImageDataNode *imageDataNode;
  PUEditableMediaProviderVideoAssetNode *v9;
  PUEditableMediaProviderVideoAssetNode *videoAssetNode;
  id v11;
  PUEditableMediaProviderVideoAssetNode *v12;
  void *v13;
  PXRunNode *v14;
  PXRunNode *gatheringNode;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditBaseMediaNode adjustmentNode](self, "adjustmentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "baseVersion"))
  {
    v7 = -[PUEditableMediaProviderImageDataNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderImageDataNode alloc], "initWithAsset:mediaProvider:version:", v5, v6, 8);
    imageDataNode = self->_imageDataNode;
    self->_imageDataNode = v7;

    if (objc_msgSend(v5, "isLivePhoto"))
    {
      v9 = -[PUEditableMediaProviderVideoAssetNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderVideoAssetNode alloc], "initWithAsset:mediaProvider:version:", v5, v6, 8);
      videoAssetNode = self->_videoAssetNode;
      self->_videoAssetNode = v9;

      v11 = objc_alloc(MEMORY[0x1E0D7B8C0]);
      v12 = self->_videoAssetNode;
      v16[0] = self->_imageDataNode;
      v16[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (PXRunNode *)objc_msgSend(v11, "initWithDependencies:", v13);
      gatheringNode = self->_gatheringNode;
      self->_gatheringNode = v14;

    }
    else
    {
      objc_storeStrong((id *)&self->_gatheringNode, self->_imageDataNode);
    }
    -[PXRunNode setDelegate:](self->_imageDataNode, "setDelegate:", self);
    -[PXRunNode setDelegate:](self->_videoAssetNode, "setDelegate:", self);
    -[PXRunNode setDelegate:](self->_gatheringNode, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0D7B8C0], "processGraphForRunNode:", self->_gatheringNode);
  }
  else
  {
    -[PXRunNode complete](self, "complete");
  }

}

- (void)runNode:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  PXRunNode *p_super;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  PUEditableMediaProviderVideoAssetNode *v11;

  v11 = (PUEditableMediaProviderVideoAssetNode *)a3;
  v6 = a4;
  p_super = &v11->super;
  if ((PUEditableMediaProviderVideoAssetNode *)self->_imageDataNode == v11)
  {
    -[PUEditableMediaProviderVideoAssetNode imageData](v11, "imageData");
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 72;
  }
  else
  {
    if (self->_videoAssetNode != v11)
      goto LABEL_6;
    -[PUEditableMediaProviderVideoAssetNode videoAsset](v11, "videoAsset");
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 80;
  }
  v10 = *(Class *)((char *)&self->super.super.isa + v9);
  *(Class *)((char *)&self->super.super.isa + v9) = v8;

  p_super = &v11->super;
LABEL_6:
  if (self->_gatheringNode == p_super)
    -[PXRunNode completeWithError:](self, "completeWithError:", v6);

}

- (NSData)imageData
{
  return self->_imageData;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode
{
  return self->_adjustmentNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentNode, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_gatheringNode, 0);
  objc_storeStrong((id *)&self->_videoAssetNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
}

@end
