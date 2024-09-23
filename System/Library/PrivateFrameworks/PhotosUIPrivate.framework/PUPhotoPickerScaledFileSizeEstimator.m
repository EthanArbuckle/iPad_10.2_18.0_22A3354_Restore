@implementation PUPhotoPickerScaledFileSizeEstimator

- (PUPhotoPickerScaledFileSizeEstimator)initWithAsset:(id)a3
{
  id v5;
  PUPhotoPickerScaledFileSizeEstimator *v6;
  PUPhotoPickerScaledFileSizeEstimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoPickerScaledFileSizeEstimator;
  v6 = -[PUPhotoPickerScaledFileSizeEstimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_asset, a3);

  return v7;
}

- (void)dealloc
{
  CMPhotoDecompressionContainer *figContainer;
  objc_super v4;

  figContainer = self->_figContainer;
  if (figContainer)
    CFRelease(figContainer);
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerScaledFileSizeEstimator;
  -[PUPhotoPickerScaledFileSizeEstimator dealloc](&v4, sel_dealloc);
}

- (unint64_t)estimatedSizeForResizeDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D752F0];
  -[PUPhotoPickerScaledFileSizeEstimator _assetUTI](self, "_assetUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)objc_opt_class(), "isAssetResizable:", self->_asset) & 1) != 0
    && ((objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC510]) & 1) != 0
     || objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC508])
     || -[PUPhotoPickerScaledFileSizeEstimator wouldResizeAssetUsingResizeDescriptor:](self, "wouldResizeAssetUsingResizeDescriptor:", v4)))
  {
    v8 = -[PUPhotoPickerScaledFileSizeEstimator _estimatedSizeForResizeDescriptor:](self, "_estimatedSizeForResizeDescriptor:", v4);
  }
  else
  {
    v8 = -[PUPhotoPickerScaledFileSizeEstimator _assetOriginalSize](self, "_assetOriginalSize");
  }
  v9 = v8;

  return v9;
}

- (BOOL)wouldResizeAssetUsingResizeDescriptor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PUPhotoPickerScaledFileSizeEstimator _targetSizeForResizeDescriptor:](self, "_targetSizeForResizeDescriptor:", a3);
  v5 = v4;
  v7 = v6;
  v8 = (double)-[PHAsset pixelWidth](self->_asset, "pixelWidth");
  return v7 < (double)-[PHAsset pixelHeight](self->_asset, "pixelHeight") || v5 < v8;
}

- (id)_assetUTI
{
  -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
  return (id)-[PHAsset uniformTypeIdentifier](self->_asset, "uniformTypeIdentifier");
}

- (unint64_t)_assetOriginalSize
{
  void *v3;
  unint64_t v4;

  -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
  -[PHAsset originalMetadataProperties](self->_asset, "originalMetadataProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "originalFilesize");

  return v4;
}

- (id)_assetURL
{
  -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
  return (id)-[PHAsset mainFileURL](self->_asset, "mainFileURL");
}

- (CGSize)_targetSizeForResizeDescriptor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v8;
  CGSize result;

  objc_msgSend(a3, "targetSize");
  v6 = v5;
  if (v5 == *MEMORY[0x1E0CD1C28] && v4 == *(double *)(MEMORY[0x1E0CD1C28] + 8))
  {
    v6 = (double)-[PHAsset pixelWidth](self->_asset, "pixelWidth");
    v4 = (double)-[PHAsset pixelHeight](self->_asset, "pixelHeight");
  }
  v8 = v6;
  result.height = v4;
  result.width = v8;
  return result;
}

- (CMPhotoDecompressionContainer)_figContainer
{
  CMPhotoDecompressionContainer *result;
  int Container;

  result = self->_figContainer;
  if (!result)
  {
    if (!CMPhotoDecompressionSessionCreate())
    {
      -[PUPhotoPickerScaledFileSizeEstimator _assetURL](self, "_assetURL");
      Container = CMPhotoDecompressionSessionCreateContainer();
      CFRelease(0);
      if (!Container)
        self->_figContainer = 0;
    }
    return self->_figContainer;
  }
  return result;
}

- (unint64_t)_estimatedSizeForResizeDescriptor:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  if (-[PUPhotoPickerScaledFileSizeEstimator _figContainer](self, "_figContainer"))
  {
    -[PUPhotoPickerScaledFileSizeEstimator _targetSizeForResizeDescriptor:](self, "_targetSizeForResizeDescriptor:", v4);
    if (v5 <= v6)
      v5 = v6;
    v18[0] = *MEMORY[0x1E0D09568];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v18[1] = *MEMORY[0x1E0D09378];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1785750887);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D09418];
    v19[1] = v8;
    v19[2] = &unk_1E59BBE08;
    v10 = *MEMORY[0x1E0D09410];
    v18[2] = v9;
    v18[3] = v10;
    v16 = *MEMORY[0x1E0D09618];
    v17 = &unk_1E59BBE20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (CMPhotoDecompressionContainerPredictTranscodedSize())
      v15 = -[PUPhotoPickerScaledFileSizeEstimator _assetOriginalSize](self, "_assetOriginalSize");

    v13 = v15;
  }
  else
  {
    v13 = -[PUPhotoPickerScaledFileSizeEstimator _assetOriginalSize](self, "_assetOriginalSize");
  }

  return v13;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (BOOL)isAssetResizable:(id)a3
{
  return objc_msgSend(a3, "isVideo") ^ 1;
}

@end
