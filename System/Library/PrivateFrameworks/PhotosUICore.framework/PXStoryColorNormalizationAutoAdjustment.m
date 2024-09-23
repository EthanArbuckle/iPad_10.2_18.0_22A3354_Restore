@implementation PXStoryColorNormalizationAutoAdjustment

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[5];

  height = a4.height;
  width = a4.width;
  v20[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXStoryColorNormalizationAdjustment filter](self, "filter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend(v8, "inputNormalization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "setInputImage:", v7);
    objc_msgSend(v8, "outputNormalization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInputNormalization:", v9);
  }

  objc_sync_exit(v8);
  v18.receiver = self;
  v18.super_class = (Class)PXStoryColorNormalizationAutoAdjustment;
  -[PXStoryColorNormalizationAdjustment applyToImage:targetSize:](&v18, sel_applyToImage_targetSize_, v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXStoryColorNormalizationAdjustment useFalseColor](self, "useFalseColor"))
  {
    v19[0] = CFSTR("inputRVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = CFSTR("inputGVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = CFSTR("inputBVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    v19[3] = CFSTR("inputBiasVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
  }

  return v10;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryColorNormalizationAutoAdjustment;
  if (-[PXStoryColorNormalizationAdjustment isEqualToDisplayAssetAdjustment:](&v14, sel_isEqualToDisplayAssetAdjustment_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      -[PXStoryColorNormalizationAutoAdjustment asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v5 = 1;
      }
      else
      {
        v5 = 0;
        if (v9 && v10)
        {
          v12 = objc_msgSend(v9, "isContentEqualTo:", v10);
          if (!v12)
            v12 = objc_msgSend(v11, "isContentEqualTo:", v9);
          v5 = v12 == 2;
        }
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)adjustmentSummary
{
  return CFSTR("on-demand");
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
