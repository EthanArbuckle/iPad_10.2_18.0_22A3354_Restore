@implementation PEResourceLoadResult

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (void)_setEditSource:(id)a3
{
  objc_storeStrong((id *)&self->_editSource, a3);
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)_setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (PICompositionController)adjustedSourceCompositionController
{
  return self->_adjustedSourceCompositionController;
}

- (void)setAdjustedSourceCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedSourceCompositionController, a3);
}

- (NUComposition)originalComposition
{
  return self->_originalComposition;
}

- (void)_setOriginalComposition:(id)a3
{
  objc_storeStrong((id *)&self->_originalComposition, a3);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)_setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSURL)videoComplementURL
{
  return self->_videoComplementURL;
}

- (void)_setVideoComplementURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoComplementURL, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementOriginalStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (void)setVideoComplementOriginalStillImageTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_videoComplementOriginalStillImageTime.epoch = a3->var3;
  *(_OWORD *)&self->_videoComplementOriginalStillImageTime.value = v3;
}

- (int64_t)retrievedVersion
{
  return self->_retrievedVersion;
}

- (void)_setRetrievedVersion:(int64_t)a3
{
  self->_retrievedVersion = a3;
}

- (int64_t)penultimateAvailability
{
  return self->_penultimateAvailability;
}

- (void)_setPenultimateAvailability:(int64_t)a3
{
  self->_penultimateAvailability = a3;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)_setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)assetLoadingAsRaw
{
  return self->_assetLoadingAsRaw;
}

- (void)_setAssetLoadingAsRaw:(BOOL)a3
{
  self->_assetLoadingAsRaw = a3;
}

- (PHContentEditingInput)contentEditingInput
{
  return self->_contentEditingInput;
}

- (void)_setContentEditingInput:(id)a3
{
  objc_storeStrong((id *)&self->_contentEditingInput, a3);
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)_setAdjustmentIdentifierAndVersion:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_contentEditingInput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_originalComposition, 0);
  objc_storeStrong((id *)&self->_adjustedSourceCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

+ (id)_resultWithContentEditingInput:(id)a3 asset:(id)a4 assetLoadingAsRaw:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  PEResourceLoadResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(PEResourceLoadResult);
  -[PEResourceLoadResult _setContentEditingInput:](v9, "_setContentEditingInput:", v7);
  objc_msgSend(v7, "fullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEResourceLoadResult _setImageURL:](v9, "_setImageURL:", v10);

  -[PEResourceLoadResult _setAssetLoadingAsRaw:](v9, "_setAssetLoadingAsRaw:", v5);
  v24 = 0;
  +[PESerializationUtility editSourceForContentEditingInput:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useEmbeddedPreview:error:", v7, v5 ^ 1, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEResourceLoadResult _setEditSource:](v9, "_setEditSource:", v11);
  -[PEResourceLoadResult _setAsset:](v9, "_setAsset:", v8);

  objc_msgSend(v7, "videoURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePhoto");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "livePhoto");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoComplement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "videoPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v7, "livePhoto");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "videoComplement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "videoPath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLWithPath:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }
  }
  -[PEResourceLoadResult _setVideoComplementURL:](v9, "_setVideoComplementURL:", v12);
  if (objc_msgSend(v7, "baseVersion") == 1)
    v22 = 1;
  else
    v22 = 2;
  -[PEResourceLoadResult _setPenultimateAvailability:](v9, "_setPenultimateAvailability:", v22);

  return v9;
}

@end
