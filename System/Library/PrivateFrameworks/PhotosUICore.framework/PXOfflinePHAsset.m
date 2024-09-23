@implementation PXOfflinePHAsset

- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAssetUUID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXOfflinePHAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PHAsset *asset;
  PXOfflinePHAsset *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOfflinePHAsset.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:](PXFileBackedAssetDescription, "simpleImageDescriptionWithURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PXOfflinePHAsset;
  v10 = -[PXFileBackedAsset initWithDescription:](&v19, sel_initWithDescription_, v9);

  if (!v10)
    goto LABEL_5;
  v11 = (void *)MEMORY[0x1E0CD1390];
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAssetsWithUUIDs:options:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  asset = v10->_asset;
  v10->_asset = (PHAsset *)v14;

  if (!v10->_asset)
    v16 = 0;
  else
LABEL_5:
    v16 = v10;

  return v16;
}

- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXOfflinePHAsset *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOfflinePHAsset.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:](PXFileBackedAssetDescription, "simpleImageDescriptionWithURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXFileBackedAsset initWithDescription:](self, "initWithDescription:", v9);

  if (v10)
    objc_storeStrong((id *)&v10->_asset, a4);

  return v10;
}

- (PHPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (unint64_t)pixelWidth
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "pixelWidth");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    v5 = -[PXFileBackedAsset pixelWidth](&v7, sel_pixelWidth);
  }

  return (unint64_t)v5;
}

- (unint64_t)pixelHeight
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "pixelHeight");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    v5 = -[PXFileBackedAsset pixelHeight](&v7, sel_pixelHeight);
  }

  return (unint64_t)v5;
}

- (id)uuid
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    -[PXFileBackedAsset uuid](&v7, sel_uuid);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGRect)preferredCropRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredCropRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    -[PXFileBackedAsset preferredCropRect](&v21, sel_preferredCropRect);
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)acceptableCropRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acceptableCropRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    -[PXFileBackedAsset acceptableCropRect](&v21, sel_acceptableCropRect);
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)faceAreaRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceAreaRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    -[PXFileBackedAsset faceAreaRect](&v21, sel_faceAreaRect);
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }

  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  -[PXOfflinePHAsset asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestCropRectForAspectRatio:", a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)PXOfflinePHAsset;
    -[PXFileBackedAsset bestCropRectForAspectRatio:](&v23, sel_bestCropRectForAspectRatio_, a3);
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;
  }
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[PXOfflinePHAsset asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedCropForTargetSize:", width, height);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  -[PXOfflinePHAsset asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suggestedCropForTargetSize:withFocusRegion:", v9, v8, x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PXOfflinePHAsset;
    -[PXOfflinePHAsset suggestedCropForTargetSize:withFocusRegion:](&v29, sel_suggestedCropForTargetSize_withFocusRegion_, v9, v8, x, y, width, height);
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
  }
  v25 = v14;
  v26 = v16;
  v27 = v18;
  v28 = v20;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  -[PXOfflinePHAsset asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suggestedCropForTargetSize:withOcclusionRegion:andOutputCropScore:", a5, v11, v10, x, y, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PXOfflinePHAsset;
    -[PXOfflinePHAsset suggestedCropForTargetSize:withOcclusionRegion:andOutputCropScore:](&v31, sel_suggestedCropForTargetSize_withOcclusionRegion_andOutputCropScore_, a5, v11, v10, x, y, width, height);
    v16 = v23;
    v18 = v24;
    v20 = v25;
    v22 = v26;
  }
  v27 = v16;
  v28 = v18;
  v29 = v20;
  v30 = v22;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  -[PXOfflinePHAsset asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", a5, v11, v10, x, y, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D628];
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)localizedGeoDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[PXOfflinePHAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXOfflinePHAsset asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedGeoDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    -[PXOfflinePHAsset localizedGeoDescription](&v7, sel_localizedGeoDescription);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (PFVideoAdjustments)px_storyResourceFetchVideoAdjustments
{
  void *v2;
  void *v3;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceFetchVideoAdjustments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFVideoAdjustments *)v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)px_storyResourceFetchBestPlaybackRange
{
  void *v4;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v6;

  -[PXOfflinePHAsset asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "px_storyResourceFetchBestPlaybackRange");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGRect)px_storyResourceFetchBestPlaybackRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceFetchBestPlaybackRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSData)px_storyResourceFetchNormalizationData
{
  void *v2;
  void *v3;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceFetchNormalizationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSSet)px_storyResourceFetchSceneClassifications
{
  void *v2;
  void *v3;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceFetchSceneClassifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (double)px_storyResourceFetchCurationScore
{
  void *v2;
  double v3;
  double v4;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceFetchCurationScore");
  v4 = v3;

  return v4;
}

- (int64_t)px_storyResourceFetchFaceCount
{
  void *v2;
  int64_t v3;

  -[PXOfflinePHAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_storyResourceFetchFaceCount");

  return v3;
}

- (int64_t)px_storyResourceKind
{
  return 1;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)createOfflinePHAssetUsingOfflineAssets:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke;
  v21[3] = &unk_1E51284A8;
  v22 = v5;
  v8 = v6;
  v23 = v8;
  v9 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v21);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  v16 = 3221225472;
  v17 = __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke_2;
  v18 = &unk_1E51314D8;
  v19 = v8;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v20;
  v12 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v15);
  v13 = (void *)objc_msgSend(v11, "copy", v15, v16, v17, v18);

  return v13;
}

void __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(v4, "localAssetURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

void __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PXOfflinePHAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  PXOfflinePHAsset *v8;

  v3 = a2;
  v4 = [PXOfflinePHAsset alloc];
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXOfflinePHAsset initWithURL:matchingPHAsset:](v4, "initWithURL:matchingPHAsset:", v7, v3);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

@end
