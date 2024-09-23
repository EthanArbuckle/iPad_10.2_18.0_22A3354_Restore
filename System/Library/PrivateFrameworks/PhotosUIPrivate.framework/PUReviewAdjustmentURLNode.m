@implementation PUReviewAdjustmentURLNode

- (PUReviewAdjustmentURLNode)initWithReviewAsset:(id)a3 directory:(id)a4 contentEditingOutput:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUReviewAdjustmentURLNode *v13;
  PUReviewAdjustmentURLNode *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAdjustmentURLNode.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reviewAsset && directory"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PUReviewAdjustmentURLNode;
  v13 = -[PXRunNode init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_reviewAsset, a3);
    objc_storeStrong((id *)&v14->_contentEditingOutput, a5);
    objc_storeStrong((id *)&v14->_directory, a4);
  }

  return v14;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *adjustmentURL;
  id v9;

  -[PUReviewAdjustmentURLNode contentEditingOutput](self, "contentEditingOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetAdjustmentsWithEditorBundleID:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (-[PUReviewAsset isHighFramerateVideo](self->_reviewAsset, "isHighFramerateVideo"))
    {
      -[PUReviewAsset providedVideoURL](self->_reviewAsset, "providedVideoURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionAdjustmentsForAsset:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  -[PUReviewAdjustmentURLNode directory](self, "directory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUReviewAsset fileURLForAdjustmentsInDirectory:](PUReviewAsset, "fileURLForAdjustmentsInDirectory:", v6);
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "writeToURL:atomically:", v7, 0);
  adjustmentURL = self->_adjustmentURL;
  self->_adjustmentURL = v7;

  -[PXRunNode complete](self, "complete");
}

- (NSURL)adjustmentURL
{
  return self->_adjustmentURL;
}

- (NSURL)directory
{
  return self->_directory;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_adjustmentURL, 0);
}

@end
