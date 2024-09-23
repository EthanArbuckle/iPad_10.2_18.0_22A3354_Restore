@implementation PLAssetAdjustmentOptions

- (PLAssetAdjustmentOptions)init
{
  PLAssetAdjustmentOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAssetAdjustmentOptions;
  result = -[PLAssetAdjustmentOptions init](&v3, sel_init);
  if (result)
  {
    result->_fileIngestionType = 4;
    result->_fullSizeRenderSize = (CGSize)*MEMORY[0x1E0C9D820];
    result->_fullSizeRenderDuration = 0.0;
  }
  return result;
}

- (BOOL)shouldOverwriteFullSizeRenderSize
{
  _BOOL4 v3;
  double v4;
  double v5;

  if (-[PLAssetAdjustmentOptions isSubstandardRender](self, "isSubstandardRender")
    || (v3 = -[PLAssetAdjustmentOptions isDeferred](self, "isDeferred")))
  {
    -[PLAssetAdjustmentOptions fullSizeRenderSize](self, "fullSizeRenderSize");
    if (v4 <= 0.0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[PLAssetAdjustmentOptions fullSizeRenderSize](self, "fullSizeRenderSize");
      LOBYTE(v3) = v5 > 0.0;
    }
  }
  return v3;
}

- (void)_setPropertiesOnCopy:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  v4[8] = -[PLAssetAdjustmentOptions isSubstandardRender](self, "isSubstandardRender");
  v4[9] = -[PLAssetAdjustmentOptions isDeferred](self, "isDeferred");
  v4[10] = -[PLAssetAdjustmentOptions shouldUpdateAttributes](self, "shouldUpdateAttributes");
  v4[11] = -[PLAssetAdjustmentOptions shouldGenerateThumbnails](self, "shouldGenerateThumbnails");
  v4[12] = -[PLAssetAdjustmentOptions shouldCheckForLegacyCameraAutoAdjustment](self, "shouldCheckForLegacyCameraAutoAdjustment");
  v4[13] = -[PLAssetAdjustmentOptions skipCheckCameraAutoAdjustment](self, "skipCheckCameraAutoAdjustment");
  *((_QWORD *)v4 + 2) = -[PLAssetAdjustmentOptions fileIngestionType](self, "fileIngestionType");
  -[PLAssetAdjustmentOptions fullSizeRenderSize](self, "fullSizeRenderSize");
  *((_QWORD *)v4 + 3) = v5;
  *((_QWORD *)v4 + 4) = v6;
  -[PLAssetAdjustmentOptions fullSizeRenderDuration](self, "fullSizeRenderDuration");
  *((_QWORD *)v4 + 5) = v7;
  -[PLAssetAdjustmentOptions mainFileMetadata](self, "mainFileMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v8;

  -[PLAssetAdjustmentOptions renderedContentURL](self, "renderedContentURL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v10;

  -[PLAssetAdjustmentOptions penultimateRenderedJPEGData](self, "penultimateRenderedJPEGData");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v12;

  -[PLAssetAdjustmentOptions penultimateRenderedVideoContentURL](self, "penultimateRenderedVideoContentURL");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v14;

  -[PLAssetAdjustmentOptions renderedVideoComplementContentURL](self, "renderedVideoComplementContentURL");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v16;

  -[PLAssetAdjustmentOptions penultimateRenderedVideoComplementContentURL](self, "penultimateRenderedVideoComplementContentURL");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v18;

  -[PLAssetAdjustmentOptions renderedVideoPosterContentURL](self, "renderedVideoPosterContentURL");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v20;

  -[PLAssetAdjustmentOptions adjustmentSecondaryDataURL](self, "adjustmentSecondaryDataURL");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (id)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = v22;

}

- (id)copyWithZone:(_NSZone *)a3
{
  PLAssetAdjustmentOptions *v4;

  v4 = objc_alloc_init(PLAssetAdjustmentOptions);
  -[PLAssetAdjustmentOptions _setPropertiesOnCopy:](self, "_setPropertiesOnCopy:", v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PLMutableAssetAdjustmentOptions *v4;

  v4 = objc_alloc_init(PLMutableAssetAdjustmentOptions);
  -[PLAssetAdjustmentOptions _setPropertiesOnCopy:](self, "_setPropertiesOnCopy:", v4);
  return v4;
}

- (BOOL)isSubstandardRender
{
  return self->_substandardRender;
}

- (BOOL)isDeferred
{
  return self->_deferred;
}

- (BOOL)shouldUpdateAttributes
{
  return self->_shouldUpdateAttributes;
}

- (BOOL)shouldGenerateThumbnails
{
  return self->_shouldGenerateThumbnails;
}

- (BOOL)shouldCheckForLegacyCameraAutoAdjustment
{
  return self->_shouldCheckForLegacyCameraAutoAdjustment;
}

- (BOOL)skipCheckCameraAutoAdjustment
{
  return self->_skipCheckCameraAutoAdjustment;
}

- (int64_t)fileIngestionType
{
  return self->_fileIngestionType;
}

- (CGSize)fullSizeRenderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullSizeRenderSize.width;
  height = self->_fullSizeRenderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)fullSizeRenderDuration
{
  return self->_fullSizeRenderDuration;
}

- (PFMetadata)mainFileMetadata
{
  return self->_mainFileMetadata;
}

- (NSURL)renderedContentURL
{
  return self->_renderedContentURL;
}

- (NSData)penultimateRenderedJPEGData
{
  return self->_penultimateRenderedJPEGData;
}

- (NSURL)penultimateRenderedVideoContentURL
{
  return self->_penultimateRenderedVideoContentURL;
}

- (NSURL)renderedVideoComplementContentURL
{
  return self->_renderedVideoComplementContentURL;
}

- (NSURL)penultimateRenderedVideoComplementContentURL
{
  return self->_penultimateRenderedVideoComplementContentURL;
}

- (NSURL)renderedVideoPosterContentURL
{
  return self->_renderedVideoPosterContentURL;
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoPosterContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedJPEGData, 0);
  objc_storeStrong((id *)&self->_renderedContentURL, 0);
  objc_storeStrong((id *)&self->_mainFileMetadata, 0);
}

+ (id)assetAdjustmentOptionsForRevertingToOriginal
{
  _WORD *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[5] = 257;
  return v2;
}

+ (id)assetAdjustmentOptionsForSLMAdjustmentsWithMainFileMetadata:(id)a3
{
  id v4;
  _WORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v5[5] = 257;
  *((_BYTE *)v5 + 12) = 1;
  v6 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v4;

  return v5;
}

+ (id)assetAdjustmentOptionsForImageWriterWithEditedRenderURL:(id)a3 async:(BOOL)a4 fullSizeRenderSize:(CGSize)a5 mainFileMetadata:(id)a6
{
  CGFloat height;
  CGFloat width;
  _BOOL4 v9;
  id v11;
  id v12;
  CGFloat *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v11 = a3;
  v12 = a6;
  v13 = (CGFloat *)objc_alloc_init((Class)a1);
  v14 = (void *)*((_QWORD *)v13 + 7);
  *((_QWORD *)v13 + 7) = v11;
  v15 = v11;

  v13[3] = width;
  v13[4] = height;
  v16 = (void *)*((_QWORD *)v13 + 6);
  *((_QWORD *)v13 + 6) = v12;

  *((_BYTE *)v13 + 11) = 1;
  if (v9)
  {
    *((_BYTE *)v13 + 8) = 1;
    v17 = 9;
  }
  else
  {
    v17 = 10;
  }
  *((_BYTE *)v13 + v17) = 1;
  return v13;
}

+ (id)assetAdjustmentOptionsForPortraitImportWithMainFileMetadata:(id)a3
{
  id v4;
  _BYTE *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v5[9] = 1;
  v6 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v4;

  v5[10] = 1;
  *((_QWORD *)v5 + 2) = 1;
  return v5;
}

+ (id)assetAdjustmentOptionsForApplyingResourcesFromCPL
{
  char *v2;

  v2 = (char *)objc_alloc_init((Class)a1);
  *(_WORD *)(v2 + 11) = 257;
  return v2;
}

@end
