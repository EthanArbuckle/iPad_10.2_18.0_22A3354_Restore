@implementation PUReviewAsset

- (id)inputForAdjustmentWithMediaProvider:(id)a3 canHandleAdjustments:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *);
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  PUReviewAdjustmentInput *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int (**v25)(id, void *);
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  v8 = -[PUReviewAsset isAdjusted](self, "isAdjusted");
  -[PUReviewAsset assetAdjustments](self, "assetAdjustments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  if (v8)
  {
    if (v7[2](v7, v9))
    {
      v10 = objc_msgSend(v9, "adjustmentBaseVersion", v7);
      v11 = 1;
    }
    else
    {
      v11 = 0;
      v10 = 2;
    }
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(v12, "_referenceBounds");
  -[PUReviewAsset pixelWidth](self, "pixelWidth");
  -[PUReviewAsset pixelHeight](self, "pixelHeight");
  PLScaledSizeToFitSize();
  v14 = rint(v13 * 0.5);
  v16 = rint(v15 * 0.5);
  v17 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v17, "setVersion:", 0);
  objc_msgSend(v17, "setSynchronous:", 1);
  objc_msgSend(v17, "setDeliveryMode:", 1);
  objc_msgSend(v17, "setNetworkAccessAllowed:", 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__77761;
  v32 = __Block_byref_object_dispose__77762;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __91__PUReviewAsset_AdjustmentInput__inputForAdjustmentWithMediaProvider_canHandleAdjustments___block_invoke;
  v27[3] = &unk_1E58A70F0;
  v27[4] = &v28;
  v18 = v6;
  objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", self, 0, v17, v27, v14, v16);
  v19 = v10 != 2;
  v20 = objc_alloc_init(PUReviewAdjustmentInput);
  if (v11)
  {
    objc_msgSend(v9, "adjustmentData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  -[PUReviewAdjustmentInput _setKnownAdjustmentData:](v20, "_setKnownAdjustmentData:", v21);
  if (v11)

  -[PUReviewAdjustmentInput _setBaseImageVersion:](v20, "_setBaseImageVersion:", v10);
  -[PUReviewAdjustmentInput _setCurrentPreviewImage:](v20, "_setCurrentPreviewImage:", v29[5]);
  -[PUReviewAsset providedImageURLForImageVersion:](self, "providedImageURLForImageVersion:", v10 != 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAdjustmentInput _setBaseImageFileURL:](v20, "_setBaseImageFileURL:", v22);

  -[PUReviewAsset providedVideoURLForImageVersion:](self, "providedVideoURLForImageVersion:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAdjustmentInput _setBaseVideoFileURL:](v20, "_setBaseVideoFileURL:", v23);

  _Block_object_dispose(&v28, 8);
  return v20;
}

- (id)adjustmentOutputForInputBaseVersion:(int64_t)a3 withLivePhotoSupport:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  char v24;
  id v25;
  NSObject *v26;
  PUReviewAdjustmentOutput *v27;
  BOOL v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[PUReviewAsset identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:](PUReviewAsset, "createUniqueMediaDirectoryForAssetWithIdentifier:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset providedImageURLForImageVersion:](self, "providedImageURLForImageVersion:", a3 != 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset providedVideoURLForImageVersion:](self, "providedVideoURLForImageVersion:", a3 != 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a3;
  v31 = (void *)v7;
  v33 = v9;
  v29 = a4;
  if (-[PUReviewAsset mediaType](self, "mediaType") == 1 && v9)
  {
    objc_msgSend(v9, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUReviewAsset fileURLForFullsizeImageInDirectory:extension:](PUReviewAsset, "fileURLForFullsizeImageInDirectory:extension:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUReviewAsset fileURLForFullsizeRenderImageInDirectory:extension:](PUReviewAsset, "fileURLForFullsizeRenderImageInDirectory:extension:", v8, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (-[PUReviewAsset isLivePhoto](self, "isLivePhoto") && v10)
    {
      +[PUReviewAsset fileURLForFullsizeVideoComplementInDirectory:](PUReviewAsset, "fileURLForFullsizeVideoComplementInDirectory:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUReviewAsset fileURLForFullsizeRenderVideoComplementInDirectory:](PUReviewAsset, "fileURLForFullsizeRenderVideoComplementInDirectory:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  v13 = 0;
  if (-[PUReviewAsset mediaType](self, "mediaType") == 2)
  {
    v32 = 0;
    v14 = 0;
    v12 = 0;
    if (!v10)
      goto LABEL_11;
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUReviewAsset fileURLForFullsizeVideoInDirectory:extension:](PUReviewAsset, "fileURLForFullsizeVideoInDirectory:extension:", v8, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUReviewAsset fileURLForFullsizeRenderVideoInDirectory:](PUReviewAsset, "fileURLForFullsizeRenderVideoInDirectory:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v32 = 0;
  v14 = 0;
  v12 = 0;
LABEL_11:
  v15 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12)
  {
    v36 = 0;
    v18 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v33, v12, &v36);
    v19 = v36;
    if ((v18 & 1) == 0)
    {
      PLAssetExplorerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v38 = v33;
        v39 = 2114;
        v40 = v12;
        v41 = 2114;
        v42 = v19;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }

    }
    if (v14)
    {
LABEL_17:
      v35 = v19;
      v21 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v10, v14, &v35);
      v22 = v35;

      if ((v21 & 1) == 0)
      {
        PLAssetExplorerGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v38 = v10;
          v39 = 2114;
          v40 = v14;
          v41 = 2114;
          v42 = v22;
          _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        }

      }
      if (!v13)
        goto LABEL_31;
      goto LABEL_25;
    }
  }
  else
  {
    v19 = 0;
    if (v14)
      goto LABEL_17;
  }
  v22 = v19;
  if (!v13)
  {
LABEL_31:
    v25 = v22;
    goto LABEL_32;
  }
LABEL_25:
  if (!-[PUReviewAsset isLivePhoto](self, "isLivePhoto") || v29)
    goto LABEL_31;
  v34 = v22;
  v24 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v10, v13, &v34);
  v25 = v34;

  if ((v24 & 1) == 0)
  {
    PLAssetExplorerGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v38 = v10;
      v39 = 2114;
      v40 = v13;
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }

  }
LABEL_32:
  v27 = objc_alloc_init(PUReviewAdjustmentOutput);
  -[PUReviewAdjustmentOutput _setAdjustmentInputBaseVersion:](v27, "_setAdjustmentInputBaseVersion:", v30);
  -[PUReviewAdjustmentOutput _setRenderedImageFileURL:](v27, "_setRenderedImageFileURL:", v32);
  -[PUReviewAdjustmentOutput _setRenderedVideoFileURL:](v27, "_setRenderedVideoFileURL:", v13);
  -[PUReviewAdjustmentOutput _setBaseImageURL:](v27, "_setBaseImageURL:", v12);
  -[PUReviewAdjustmentOutput _setBaseVideoURL:](v27, "_setBaseVideoURL:", v14);

  return v27;
}

- (PUReviewAsset)reviewAssetWithAdjustmentOutput:(id)a3 adjustmentData:(id)a4 formatIdentifier:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  PUReviewAsset *v21;
  unint64_t v22;
  unint64_t v23;
  PUReviewAsset *v24;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "_baseVideoURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_baseImageURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderedImageFileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderedVideoFileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "_adjustmentInputBaseVersion");

  if (v18 == 1)
  {
    PLAssetExplorerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Attempted to write adjustments with Penultimate base version", buf, 2u);
    }

  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v11, v10, v12, 0, 0, 0);

  v21 = [PUReviewAsset alloc];
  v22 = -[PUReviewAsset pixelWidth](self, "pixelWidth");
  v23 = -[PUReviewAsset pixelHeight](self, "pixelHeight");
  -[PUReviewAsset duration](self, "duration");
  v24 = -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:](v21, "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:", self, v15, v16, v14, v17, v22, v23, v20);

  return v24;
}

- (id)reviewAssetRevertingAdjustments
{
  void *v3;
  void *v4;
  void *v5;
  PUReviewAsset *v6;
  unint64_t v7;
  unint64_t v8;
  PUReviewAsset *v9;

  -[PUReviewAsset adjustmentOutputForInputBaseVersion:withLivePhotoSupport:](self, "adjustmentOutputForInputBaseVersion:withLivePhotoSupport:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_baseVideoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_baseImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PUReviewAsset alloc];
  v7 = -[PUReviewAsset pixelWidth](self, "pixelWidth");
  v8 = -[PUReviewAsset pixelHeight](self, "pixelHeight");
  -[PUReviewAsset duration](self, "duration");
  v9 = -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:](v6, "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:pixelWidth:pixelHeight:assetAdjustments:duration:", self, v5, 0, v4, 0, v7, v8, 0);

  return v9;
}

- (id)primaryRenderedMediaURL
{
  unint64_t v3;
  void *v4;

  v3 = -[PUReviewAsset mediaType](self, "mediaType");
  if (v3 == 2)
  {
    -[PUReviewAsset providedFullsizeRenderVideoURL](self, "providedFullsizeRenderVideoURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[PUReviewAsset providedFullsizeRenderImageURL](self, "providedFullsizeRenderImageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __91__PUReviewAsset_AdjustmentInput__inputForAdjustmentWithMediaProvider_canHandleAdjustments___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)providedImageURLForImageVersion:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset providedFullsizeRenderImageURL](self, "providedFullsizeRenderImageURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_8;
    }
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
  }
  v9 = v8;
LABEL_8:
  v10 = v9;

  return v10;
}

- (int)exifOrientationForImageVersion:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int v7;

  -[PUReviewAsset providedFullsizeRenderImageURL](self, "providedFullsizeRenderImageURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((unint64_t)(a3 - 1) >= 2 && (a3 || v5))
    v7 = 1;
  else
    v7 = -[PUReviewAsset originalEXIFOrientation](self, "originalEXIFOrientation");

  return v7;
}

- (id)providedVideoURLForImageVersion:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset providedFullsizeRenderVideoURL](self, "providedFullsizeRenderVideoURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_8;
    }
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
  }
  v9 = v8;
LABEL_8:
  v10 = v9;

  return v10;
}

- (id)providedVideoURLForVideoVersion:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset providedFullsizeRenderVideoURL](self, "providedFullsizeRenderVideoURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v5;
  if (a3 != 1)
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_8;
    }
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
  }
  v9 = v8;
LABEL_8:
  v10 = v9;

  return v10;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  __int128 v34;
  uint64_t v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PUReviewAsset;
  v5 = -[PUReviewAsset init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    *((_QWORD *)v5 + 6) = objc_msgSend(v4, "mediaType");
    *((_QWORD *)v5 + 7) = objc_msgSend(v4, "mediaSubtypes");
    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "playbackStyle");
    *((_WORD *)v5 + 7) = objc_msgSend(v4, "playbackVariation");
    *((_QWORD *)v5 + 9) = objc_msgSend(v4, "pixelWidth");
    *((_QWORD *)v5 + 10) = objc_msgSend(v4, "pixelHeight");
    objc_msgSend(v4, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v8;

    objc_msgSend(v4, "creationDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v10;

    objc_msgSend(v4, "modificationDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v12;

    v5[9] = objc_msgSend(v4, "isHDR");
    objc_msgSend(v4, "duration");
    *((_QWORD *)v5 + 15) = v14;
    v5[10] = objc_msgSend(v4, "isLivePhoto");
    v5[12] = objc_msgSend(v4, "canPlayPhotoIris");
    v5[11] = objc_msgSend(v4, "isLivePhotoPlaceholder");
    v15 = v5 + 200;
    if (v4)
    {
      objc_msgSend(v4, "livePhotoSynchronizedDisplayTime");
      *v15 = v34;
      *((_QWORD *)v5 + 27) = v35;
      objc_msgSend(v4, "livePhotoDuration");
    }
    else
    {
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v5 + 26) = 0;
      *((_QWORD *)v5 + 27) = 0;
      v34 = 0uLL;
      v35 = 0;
    }
    *((_OWORD *)v5 + 14) = v34;
    *((_QWORD *)v5 + 30) = v35;
    v5[13] = objc_msgSend(v4, "representsBurst");
    objc_msgSend(v4, "burstIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v16;

    *((_QWORD *)v5 + 17) = objc_msgSend(v4, "numberOfRepresentedAssets");
    objc_msgSend(v4, "providedPreviewImage");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v18;

    objc_msgSend(v4, "providedImageMetadata");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v20;

    objc_msgSend(v4, "assetAdjustments");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v22;

    objc_msgSend(v4, "providedFullsizeImageURL");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v24;

    objc_msgSend(v4, "providedFullsizeRenderImageURL");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v26;

    objc_msgSend(v4, "providedVideoURL");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v5 + 22);
    *((_QWORD *)v5 + 22) = v28;

    objc_msgSend(v4, "providedFullsizeRenderVideoURL");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v30;

    v5[8] = objc_msgSend(v4, "requiresConfidentiality");
    v32 = v5;
  }

  return (PUReviewAsset *)v5;
}

- (PUReviewAsset)initWithConformingAsset:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char *v35;
  __int128 v37;
  uint64_t v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PUReviewAsset;
  v5 = -[PUReviewAsset init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    *((_QWORD *)v5 + 6) = objc_msgSend(v4, "mediaType");
    *((_QWORD *)v5 + 7) = objc_msgSend(v4, "mediaSubtypes");
    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "playbackStyle");
    *((_WORD *)v5 + 7) = objc_msgSend(v4, "playbackVariation");
    *((_QWORD *)v5 + 9) = objc_msgSend(v4, "pixelWidth");
    *((_QWORD *)v5 + 10) = objc_msgSend(v4, "pixelHeight");
    objc_msgSend(v4, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v8;

    objc_msgSend(v4, "creationDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v10;

    objc_msgSend(v4, "modificationDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v12;

    v5[9] = objc_msgSend(v4, "isHDR");
    objc_msgSend(v4, "duration");
    *((_QWORD *)v5 + 15) = v14;
    v5[10] = objc_msgSend(v4, "isLivePhoto");
    v5[12] = objc_msgSend(v4, "canPlayPhotoIris");
    v5[11] = objc_msgSend(v4, "isLivePhotoPlaceholder");
    v15 = v5 + 200;
    if (v4)
    {
      objc_msgSend(v4, "livePhotoSynchronizedDisplayTime");
      *v15 = v37;
      *((_QWORD *)v5 + 27) = v38;
      objc_msgSend(v4, "livePhotoDuration");
    }
    else
    {
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v5 + 26) = 0;
      *((_QWORD *)v5 + 27) = 0;
      v37 = 0uLL;
      v38 = 0;
    }
    *((_OWORD *)v5 + 14) = v37;
    *((_QWORD *)v5 + 30) = v38;
    v5[13] = objc_msgSend(v4, "representsBurst");
    objc_msgSend(v4, "burstIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v16;

    *((_QWORD *)v5 + 17) = objc_msgSend(v4, "numberOfRepresentedAssets");
    objc_msgSend(v4, "providedPreviewImage");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v18;

    objc_msgSend(v4, "providedImageMetadata");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v20;

    objc_msgSend(v4, "assetAdjustments");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v22;

    if (objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForAdjustments:", *((_QWORD *)v5 + 24)))
    {
      v5[8] = 1;
    }
    else
    {
      v24 = (void *)objc_opt_class();
      objc_msgSend(v5, "providedImageMetadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5[8] = objc_msgSend(v24, "_shouldShowConfidentialityWarningForMetadata:creationDate:", v25, v26);

    }
    objc_msgSend(v4, "providedFullsizeImageURL");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v27;

    objc_msgSend(v4, "providedFullsizeRenderImageURL");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v29;

    objc_msgSend(v4, "providedVideoURL");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 22);
    *((_QWORD *)v5 + 22) = v31;

    objc_msgSend(v4, "providedFullsizeRenderVideoURL");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v33;

    v35 = v5;
  }

  return (PUReviewAsset *)v5;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4
{
  id v6;
  id v7;
  PUReviewAsset *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PUReviewAsset initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:](self, "initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:", v7, v6, objc_msgSend(v7, "canPlayPhotoIris"));

  return v8;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 linkFileURLsToUniquePathsInDirectory:(id)a4 canPlayPhotoIris:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PUReviewAsset *v10;
  PUReviewAsset *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *providedFullsizeImageURL;
  int v16;
  PUReviewAsset *v17;
  void *v18;
  uint64_t v19;
  NSURL *providedFullsizeRenderImageURL;
  void *v21;
  uint64_t v22;
  NSURL *providedVideoURL;
  void *v24;
  uint64_t v25;
  NSURL *providedFullsizeRenderVideoURL;
  BOOL v27;
  PUReviewAsset *v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[PUReviewAsset initWithConformingAsset:](self, "initWithConformingAsset:", v8);
  v11 = v10;
  if (v10)
  {
    v10->_canPlayPhotoIris = v5;
    if (v5)
      v10->_playbackStyle = 3;
    -[PUReviewAsset _ensureLinkDestinationDirectoryFromBaseDirectory:](v10, "_ensureLinkDestinationDirectoryFromBaseDirectory:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providedFullsizeImageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PUReviewAsset _uniqueDestinationURLForFileURL:inDirectory:](v11, "_uniqueDestinationURLForFileURL:inDirectory:", v13, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      providedFullsizeImageURL = v11->_providedFullsizeImageURL;
      v11->_providedFullsizeImageURL = (NSURL *)v14;

      v16 = -[PUReviewAsset _linkFileAtURL:toURL:](v11, "_linkFileAtURL:toURL:", v13, v11->_providedFullsizeImageURL);
    }
    else
    {
      v16 = 1;
    }
    objc_msgSend(v8, "providedFullsizeRenderImageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[PUReviewAsset _uniqueDestinationURLForFileURL:inDirectory:](v11, "_uniqueDestinationURLForFileURL:inDirectory:", v18, v12);
      v19 = objc_claimAutoreleasedReturnValue();
      providedFullsizeRenderImageURL = v11->_providedFullsizeRenderImageURL;
      v11->_providedFullsizeRenderImageURL = (NSURL *)v19;

      if (v16)
        v16 = -[PUReviewAsset _linkFileAtURL:toURL:](v11, "_linkFileAtURL:toURL:", v18, v11->_providedFullsizeRenderImageURL);
    }
    objc_msgSend(v8, "providedVideoURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[PUReviewAsset _uniqueDestinationURLForFileURL:inDirectory:](v11, "_uniqueDestinationURLForFileURL:inDirectory:", v21, v12);
      v22 = objc_claimAutoreleasedReturnValue();
      providedVideoURL = v11->_providedVideoURL;
      v11->_providedVideoURL = (NSURL *)v22;

      if (v16)
        v16 = -[PUReviewAsset _linkFileAtURL:toURL:](v11, "_linkFileAtURL:toURL:", v21, v11->_providedVideoURL);
    }
    objc_msgSend(v8, "providedFullsizeRenderVideoURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[PUReviewAsset _uniqueDestinationURLForFileURL:inDirectory:](v11, "_uniqueDestinationURLForFileURL:inDirectory:", v24, v12);
      v25 = objc_claimAutoreleasedReturnValue();
      providedFullsizeRenderVideoURL = v11->_providedFullsizeRenderVideoURL;
      v11->_providedFullsizeRenderVideoURL = (NSURL *)v25;

      if (v16)
      {
        v27 = -[PUReviewAsset _linkFileAtURL:toURL:](v11, "_linkFileAtURL:toURL:", v24, v11->_providedFullsizeRenderVideoURL);
        v28 = v11;
        if (v27)
          goto LABEL_18;
      }
    }
    else
    {
      v28 = v11;
      if ((v16 & 1) != 0)
        goto LABEL_18;
    }
    -[PUReviewAsset removeAllFilesAtReferencedURLs](v11, "removeAllFilesAtReferencedURLs");
    v28 = 0;
LABEL_18:
    v17 = v28;

    goto LABEL_19;
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 primaryResourceURL:(id)a4
{
  id v6;
  id v7;
  PUReviewAsset *v8;
  uint64_t v9;
  uint64_t v10;
  NSURL *providedVideoURL;
  uint64_t v12;
  PUReviewAsset *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[PUReviewAsset initWithReviewAsset:](self, "initWithReviewAsset:", v6);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mediaType");
    if (v9 == 2)
    {
      v12 = objc_msgSend(v7, "copy");
      providedVideoURL = v8->_providedVideoURL;
      v8->_providedVideoURL = (NSURL *)v12;
    }
    else
    {
      if (v9 != 1)
      {
LABEL_7:
        v13 = v8;
        goto LABEL_8;
      }
      v10 = objc_msgSend(v7, "copy");
      providedVideoURL = v8->_providedFullsizeImageURL;
      v8->_providedFullsizeImageURL = (NSURL *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 pixelWidth:(unint64_t)a8 pixelHeight:(unint64_t)a9 assetAdjustments:(id)a10 duration:(double)a11
{
  return -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:previewImage:pixelWidth:pixelHeight:assetAdjustments:duration:](self, "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:previewImage:pixelWidth:pixelHeight:assetAdjustments:duration:", a3, a4, a5, a6, a7, 0, a11, a8, a9, a10);
}

- (PUReviewAsset)initWithReviewAsset:(id)a3 baseImageURL:(id)a4 renderedImageURL:(id)a5 baseVideoURL:(id)a6 renderedVideoURL:(id)a7 previewImage:(id)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 assetAdjustments:(id)a11 duration:(double)a12
{
  id v19;
  id v20;
  id v21;
  UIImage *v22;
  id v23;
  PUReviewAsset *v24;
  PUReviewAsset *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  UIImage *v37;
  void *v38;
  uint64_t v39;
  NSDictionary *providedImageMetadata;
  uint64_t v41;
  __int128 v42;
  int64_t v43;
  PUReviewAsset *v44;
  UIImage *providedPreviewImage;
  UIImage *v47;
  id v48;
  id obj;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v19 = a3;
  obj = a4;
  v54 = a4;
  v50 = a5;
  v53 = a5;
  v51 = a6;
  v20 = a6;
  v52 = a7;
  v21 = a7;
  v22 = (UIImage *)a8;
  v23 = a11;
  v24 = -[PUReviewAsset initWithReviewAsset:](self, "initWithReviewAsset:", v19);
  v25 = v24;
  if (!v24)
    goto LABEL_12;
  v24->_pixelWidth = a9;
  v24->_pixelHeight = a10;
  v24->_duration = a12;
  if (v23)
  {
    v26 = objc_msgSend(v23, "adjustmentBaseVersion") != 0;
    v27 = objc_alloc(MEMORY[0x1E0D750B0]);
    objc_msgSend(v23, "adjustmentFormatIdentifier");
    v47 = v22;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adjustmentFormatVersion");
    v48 = v20;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adjustmentData");
    v30 = v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "editorBundleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v27, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v28, v29, v31, 0, v32, 0);

    v21 = v30;
    v20 = v48;

    v22 = v47;
  }
  else
  {
    v26 = 0;
    v33 = 0;
  }
  objc_storeStrong((id *)&v25->_assetAdjustments, v33);
  v34 = objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForAdjustments:", v25->_assetAdjustments);
  v25->_requiresConfidentiality = v34 | objc_msgSend(v19, "requiresConfidentiality");
  if (v22)
  {
    if (!v26)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v26)
    providedPreviewImage = 0;
  else
    providedPreviewImage = v25->_providedPreviewImage;
  v22 = providedPreviewImage;
  if (v26)
  {
LABEL_7:
    -[PUReviewAsset providedImageMetadata](v25, "providedImageMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v33;
    v37 = v22;
    v38 = (void *)objc_msgSend(v35, "mutableCopy");

    objc_msgSend(v38, "setObject:forKeyedSubscript:", &unk_1E59BBE38, *MEMORY[0x1E0CBCFF0]);
    v39 = objc_msgSend(v38, "copy");
    providedImageMetadata = v25->_providedImageMetadata;
    v25->_providedImageMetadata = (NSDictionary *)v39;

    v22 = v37;
    v33 = v36;
  }
LABEL_8:
  objc_storeStrong((id *)&v25->_providedFullsizeImageURL, obj);
  objc_storeStrong((id *)&v25->_providedFullsizeRenderImageURL, v50);
  objc_storeStrong((id *)&v25->_providedVideoURL, v51);
  objc_storeStrong((id *)&v25->_providedFullsizeRenderVideoURL, v52);
  objc_storeStrong((id *)&v25->_providedPreviewImage, v22);
  if (-[PUReviewAsset isLivePhoto](v25, "isLivePhoto") && !v25->_providedVideoURL)
  {
    v25->_mediaSubtypes = -[PUReviewAsset mediaSubtypes](v25, "mediaSubtypes") & 0xFFFFFFFFFFFFFFF7;
    *(_WORD *)&v25->_livePhoto = 0;
    v25->_canPlayPhotoIris = 0;
    v41 = MEMORY[0x1E0CA2E18];
    v42 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v25->_livePhotoSynchronizedDisplayTime.value = *MEMORY[0x1E0CA2E18];
    v43 = *(_QWORD *)(v41 + 16);
    v25->_livePhotoSynchronizedDisplayTime.epoch = v43;
    *(_OWORD *)&v25->_livePhotoDuration.value = v42;
    v25->_livePhotoDuration.epoch = v43;
  }
  v44 = v25;

LABEL_12:
  return v25;
}

- (PUReviewAsset)initWithPhoto:(id)a3 mediaSubtypes:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 metadata:(id)a8 burstIdentifier:(id)a9 representedCount:(unint64_t)a10 fullsizeImageURL:(id)a11 fullsizeUnadjustedImageURL:(id)a12 assetAdjustments:(id)a13 identifier:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  char *v34;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v40 = a3;
  v42 = a7;
  v41 = a8;
  v18 = a9;
  v19 = a11;
  v20 = a12;
  v39 = a13;
  v21 = a14;
  v43.receiver = self;
  v43.super_class = (Class)PUReviewAsset;
  v22 = -[PUReviewAsset init](&v43, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v21, "copy");
    v24 = (void *)*((_QWORD *)v22 + 5);
    *((_QWORD *)v22 + 5) = v23;

    *((_QWORD *)v22 + 6) = 1;
    *((_QWORD *)v22 + 7) = a4;
    *((_WORD *)v22 + 7) = 0;
    *((_QWORD *)v22 + 8) = 1;
    *((_QWORD *)v22 + 9) = a5;
    *((_QWORD *)v22 + 10) = a6;
    objc_storeStrong((id *)v22 + 12, a7);
    objc_storeStrong((id *)v22 + 13, a7);
    objc_storeStrong((id *)v22 + 14, a7);
    *((_WORD *)v22 + 5) = 0;
    v25 = MEMORY[0x1E0CA2E18];
    v26 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v22 + 200) = *MEMORY[0x1E0CA2E18];
    v27 = *(_QWORD *)(v25 + 16);
    *((_QWORD *)v22 + 27) = v27;
    *((_OWORD *)v22 + 14) = v26;
    *((_QWORD *)v22 + 30) = v27;
    v22[13] = v18 != 0;
    v28 = objc_msgSend(v18, "copy");
    v29 = (void *)*((_QWORD *)v22 + 16);
    *((_QWORD *)v22 + 16) = v28;

    *((_QWORD *)v22 + 17) = a10;
    objc_storeStrong((id *)v22 + 18, a3);
    objc_storeStrong((id *)v22 + 19, a8);
    v30 = v19;
    if (v20)
    {
      v31 = (void *)*((_QWORD *)v22 + 21);
      *((_QWORD *)v22 + 21) = v30;

      v30 = v20;
    }
    v32 = (void *)*((_QWORD *)v22 + 20);
    *((_QWORD *)v22 + 20) = v30;

    objc_storeStrong((id *)v22 + 24, a13);
    if ((objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForAdjustments:", *((_QWORD *)v22 + 24)) & 1) != 0)
      v33 = 1;
    else
      v33 = objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForMetadata:creationDate:", v41, v42);
    v22[8] = v33;
    v34 = v22;
  }

  return (PUReviewAsset *)v22;
}

- (PUReviewAsset)initWithLivePhoto:(id)a3 fullsizeUnadjustedImageURL:(id)a4 fullsizeUnadjustedVideoURL:(id)a5 assetAdjustments:(id)a6 width:(unint64_t)a7 height:(unint64_t)a8 captureDate:(id)a9 metadata:(id)a10 duration:(double)a11 previewImage:(id)a12 identifier:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  char *v36;
  id obj;
  id v40;
  id v41;
  id v42;
  id v43;
  CMTime v44;
  objc_super v45;

  v19 = a3;
  obj = a4;
  v20 = a4;
  v21 = a5;
  v41 = a6;
  v43 = a9;
  v42 = a10;
  v40 = a12;
  v22 = a13;
  v45.receiver = self;
  v45.super_class = (Class)PUReviewAsset;
  v23 = v21;
  v24 = -[PUReviewAsset init](&v45, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v22, "copy");
    v26 = (void *)*((_QWORD *)v24 + 5);
    *((_QWORD *)v24 + 5) = v25;

    *((_OWORD *)v24 + 3) = xmmword_1AB0EF440;
    *((_WORD *)v24 + 7) = 0;
    *((_QWORD *)v24 + 8) = 3;
    *((_QWORD *)v24 + 9) = a7;
    *((_QWORD *)v24 + 10) = a8;
    objc_storeStrong((id *)v24 + 12, a9);
    objc_storeStrong((id *)v24 + 14, a9);
    v24[10] = v19 != 0;
    v24[12] = v19 != 0;
    v24[11] = v19 == 0;
    if (v19)
      objc_msgSend(v19, "photoTime", obj);
    else
      memset(&v44, 0, sizeof(v44));
    *(CMTime *)(v24 + 200) = v44;
    CMTimeMakeWithSeconds(&v44, a11, 600);
    *(CMTime *)(v24 + 224) = v44;
    v24[13] = 0;
    v27 = (void *)*((_QWORD *)v24 + 16);
    *((_QWORD *)v24 + 16) = 0;

    *((_QWORD *)v24 + 17) = 0;
    objc_storeStrong((id *)v24 + 18, a12);
    objc_msgSend(v19, "imageURL");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v20 && v23)
    {
      v29 = (void *)*((_QWORD *)v24 + 21);
      *((_QWORD *)v24 + 21) = v28;

      objc_msgSend(v19, "videoURL");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)*((_QWORD *)v24 + 23);
      *((_QWORD *)v24 + 23) = v30;

      objc_storeStrong((id *)v24 + 20, obj);
      v32 = v23;
    }
    else
    {
      v33 = (void *)*((_QWORD *)v24 + 20);
      *((_QWORD *)v24 + 20) = v28;

      objc_msgSend(v19, "videoURL");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)*((_QWORD *)v24 + 22);
    *((_QWORD *)v24 + 22) = v32;

    objc_storeStrong((id *)v24 + 19, a10);
    objc_storeStrong((id *)v24 + 24, a6);
    if ((objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForAdjustments:", *((_QWORD *)v24 + 24)) & 1) != 0)
      v35 = 1;
    else
      v35 = objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForMetadata:creationDate:", v42, v43);
    v24[8] = v35;
    v36 = v24;
  }

  return (PUReviewAsset *)v24;
}

- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 adjustments:(id)a11 identifier:(id)a12
{
  return -[PUReviewAsset initWithAVAsset:audioMix:width:height:captureDate:duration:previewImage:videoURL:unadjustedVideoURL:adjustments:identifier:](self, "initWithAVAsset:audioMix:width:height:captureDate:duration:previewImage:videoURL:unadjustedVideoURL:adjustments:identifier:", a3, a4, a5, a6, a7, a9, a8, a10, 0, a11, a12);
}

- (PUReviewAsset)initWithAVAsset:(id)a3 audioMix:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 captureDate:(id)a7 duration:(double)a8 previewImage:(id)a9 videoURL:(id)a10 unadjustedVideoURL:(id)a11 adjustments:(id)a12 identifier:(id)a13
{
  id v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  id *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a7;
  v37 = a9;
  v36 = a10;
  v18 = a11;
  v19 = a12;
  v20 = a13;
  v39.receiver = self;
  v39.super_class = (Class)PUReviewAsset;
  v21 = -[PUReviewAsset init](&v39, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v20, "copy");
    v23 = (void *)*((_QWORD *)v21 + 5);
    *((_QWORD *)v21 + 5) = v22;

    *((_QWORD *)v21 + 6) = 2;
    *((_WORD *)v21 + 7) = 0;
    *((_QWORD *)v21 + 8) = 4;
    *((_QWORD *)v21 + 9) = a5;
    *((_QWORD *)v21 + 10) = a6;
    *((double *)v21 + 15) = a8;
    objc_storeStrong((id *)v21 + 12, a7);
    objc_storeStrong((id *)v21 + 14, a7);
    *((_WORD *)v21 + 5) = 0;
    v24 = MEMORY[0x1E0CA2E18];
    v25 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v21 + 200) = *MEMORY[0x1E0CA2E18];
    v26 = *(_QWORD *)(v24 + 16);
    *((_QWORD *)v21 + 27) = v26;
    *((_OWORD *)v21 + 14) = v25;
    *((_QWORD *)v21 + 30) = v26;
    v21[13] = 0;
    v27 = (void *)*((_QWORD *)v21 + 16);
    *((_QWORD *)v21 + 16) = 0;

    *((_QWORD *)v21 + 17) = 0;
    objc_storeStrong((id *)v21 + 18, a9);
    v28 = (id *)(v21 + 176);
    v29 = v18;
    if (v18)
    {
      objc_storeStrong(v28, a11);
      v28 = (id *)(v21 + 184);
    }
    objc_storeStrong(v28, a10);
    objc_storeStrong((id *)v21 + 24, a12);
    v21[8] = objc_msgSend((id)objc_opt_class(), "_shouldShowConfidentialityWarningForAdjustments:", *((_QWORD *)v21 + 24));
    if (v19)
    {
      v30 = (void *)MEMORY[0x1E0D75308];
      objc_msgSend(v19, "adjustmentFormatIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "adjustmentFormatVersion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = objc_msgSend(v30, "isRecognizedSlowMotionFormatWithIdentifier:version:", v31, v32);

      if ((_DWORD)v30)
        *((_QWORD *)v21 + 7) = 0x20000;
    }
    v33 = v21;
    v18 = v29;
  }

  return (PUReviewAsset *)v21;
}

- (BOOL)isFavorite
{
  return 0;
}

- (double)aspectRatio
{
  double v3;

  if (!-[PUReviewAsset pixelHeight](self, "pixelHeight"))
    return 1.0;
  v3 = (double)-[PUReviewAsset pixelWidth](self, "pixelWidth");
  return v3 / (double)-[PUReviewAsset pixelHeight](self, "pixelHeight");
}

- (BOOL)isSpatialMedia
{
  return (-[PUReviewAsset mediaSubtypes](self, "mediaSubtypes") >> 10) & 1;
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithFilenameExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)canPlayLoopingVideo
{
  return -[PUReviewAsset playbackStyle](self, "playbackStyle") == 5;
}

- (BOOL)isAnimatedImage
{
  void *v2;
  void *v3;
  char v4;

  -[PUReviewAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4F8]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return 2 * (self == a3);
}

- (BOOL)needsDeferredProcessing
{
  return 0;
}

- (unsigned)deferredProcessingNeeded
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (BOOL)isHighFramerateVideo
{
  return (-[PUReviewAsset mediaSubtypes](self, "mediaSubtypes") >> 17) & 1;
}

- (BOOL)isAdjusted
{
  void *v2;
  BOOL v3;

  -[PUReviewAsset assetAdjustments](self, "assetAdjustments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isContentAdjustmentAllowed
{
  return 1;
}

- (BOOL)isLivePhotoVisibilityAdjustmentAllowed
{
  return 0;
}

- (BOOL)isInPlaceVideoTrimAllowed
{
  return 0;
}

- (unint64_t)originalResourceChoice
{
  return 0;
}

- (BOOL)isTrimmableType
{
  return 0;
}

- (unint64_t)livePhotoVisibilityState
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!-[PUReviewAsset isLivePhoto](self, "isLivePhoto"))
    return 0;
  v3 = -[PUReviewAsset isAdjusted](self, "isAdjusted");
  v4 = -[PUReviewAsset canPlayPhotoIris](self, "canPlayPhotoIris");
  v5 = 4;
  if (v4)
    v5 = 0;
  v6 = 2;
  if (!v3)
    v6 = 0;
  v7 = 8;
  if (!v4 || !v3)
    v7 = 0;
  return v6 | v5 | !v4 | v7;
}

- (PFVideoAVObjectBuilder)videoObjectBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C8B3C0];
  -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUReviewAsset isHighFramerateVideo](self, "isHighFramerateVideo"))
  {
    v6 = 0;
  }
  else
  {
    -[PUReviewAsset assetAdjustments](self, "assetAdjustments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D75308], "videoAdjustmentsFromAssetAdjustmentsIfRecognized:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v5, v7);

  return (PFVideoAVObjectBuilder *)v8;
}

- (unint64_t)requestContentEditingInputWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t (**v18)(_QWORD, _QWORD);
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v6 = a3;
  if (a4)
  {
    v7 = (void (**)(id, void *, _QWORD))a4;
    -[PUReviewAsset assetAdjustments](self, "assetAdjustments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phAdjustmentData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CD14F8]);
    -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)objc_msgSend(v10, "initWithAppropriateURL:", v11);
    }
    else
    {
      -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithAppropriateURL:", v13);

    }
    objc_msgSend(v12, "setMediaType:", -[PUReviewAsset mediaType](self, "mediaType"));
    objc_msgSend(v12, "setMediaSubtypes:", -[PUReviewAsset mediaSubtypes](self, "mediaSubtypes"));
    objc_msgSend(v12, "setPlaybackStyle:", -[PUReviewAsset playbackStyle](self, "playbackStyle"));
    -[PUReviewAsset creationDate](self, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCreationDate:", v14);

    -[PUReviewAsset location](self, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocation:", v15);

    if (!-[PUReviewAsset isAdjusted](self, "isAdjusted"))
      goto LABEL_8;
    objc_msgSend(v6, "canHandleAdjustmentData");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_9;
    v17 = (void *)v16;
    objc_msgSend(v6, "canHandleAdjustmentData");
    v18 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v19 = ((uint64_t (**)(_QWORD, void *))v18)[2](v18, v9);

    if (v19)
    {
LABEL_8:
      objc_msgSend(v12, "setBaseVersion:", 0);
      objc_msgSend(v12, "setAdjustmentData:", v9);
      -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFullSizeImageURL:", v20);

      -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setVideoURL:", v21);

      v22 = -[PUReviewAsset originalEXIFOrientation](self, "originalEXIFOrientation");
    }
    else
    {
LABEL_9:
      objc_msgSend(v12, "setBaseVersion:", 2);
      objc_msgSend(v12, "setAdjustmentData:", v9);
      -[PUReviewAsset providedFullsizeRenderImageURL](self, "providedFullsizeRenderImageURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFullSizeImageURL:", v23);

      -[PUReviewAsset providedFullsizeRenderVideoURL](self, "providedFullsizeRenderVideoURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setVideoURL:", v24);

      v22 = 1;
    }
    objc_msgSend(v12, "setFullSizeImageOrientation:", v22);
    v7[2](v7, v12, 0);

  }
  return 0;
}

- (int)originalEXIFOrientation
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[PUReviewAsset providedImageMetadata](self, "providedImageMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 1;

  return v5;
}

- (BOOL)containsAllMetadata
{
  return 0;
}

- (BOOL)isResourceDownloadPossible
{
  return 0;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return 0;
}

- (NSString)pathForOriginalImageFile
{
  void *v2;
  void *v3;

  -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)pathForOriginalVideoFile
{
  void *v2;
  void *v3;

  -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)pathForTrimmedVideoFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUReviewAsset pathForOriginalVideoFile](self, "pathForOriginalVideoFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("TRIM.MOV"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isOriginalRaw
{
  return 0;
}

- (NSString)accessibilityDescription
{
  return 0;
}

- (id)_ensureLinkDestinationDirectoryFromBaseDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUReviewAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ReviewLinkedFiles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v12);
  v9 = v12;

  if (v9)
  {
    PLAssetExplorerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (id)_uniqueDestinationURLForFileURL:(id)a3 inDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_linkFileAtURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
    {
      +[PUReviewFileManager defaultManager](PUReviewFileManager, "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v12 = objc_msgSend(v11, "removeItemAtURL:error:", v6, &v19);
      v13 = v19;

      if ((v12 & 1) == 0)
      {
        PLAssetExplorerGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v6;
          v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Failed to remove existing file at %{public}@: %{public}@", buf, 0x16u);
        }

      }
    }
    v18 = 0;
    v7 = objc_msgSend(v8, "copyItemAtURL:toURL:error:", v5, v6, &v18);
    v15 = v18;
    if ((v7 & 1) == 0)
    {
      PLAssetExplorerGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v21 = v5;
        v22 = 2114;
        v23 = v6;
        v24 = 2114;
        v25 = v15;
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }

  return v7;
}

- (void)removeAllFilesAtReferencedURLs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUReviewAsset providedFullsizeImageURL](self, "providedFullsizeImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset _removeFileAtURL:](self, "_removeFileAtURL:", v3);

  -[PUReviewAsset providedFullsizeRenderImageURL](self, "providedFullsizeRenderImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset _removeFileAtURL:](self, "_removeFileAtURL:", v4);

  -[PUReviewAsset providedVideoURL](self, "providedVideoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset _removeFileAtURL:](self, "_removeFileAtURL:", v5);

  -[PUReviewAsset providedFullsizeRenderVideoURL](self, "providedFullsizeRenderVideoURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewAsset _removeFileAtURL:](self, "_removeFileAtURL:", v6);

}

- (void)_removeFileAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      +[PUReviewFileManager defaultManager](PUReviewFileManager, "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __34__PUReviewAsset__removeFileAtURL___block_invoke;
      v8[3] = &unk_1E58AB060;
      v9 = v3;
      objc_msgSend(v7, "removeItemAtURL:completion:", v9, v8);

    }
  }

}

- (AVAsset)providedAVAsset
{
  return self->providedAVAsset;
}

- (AVAudioMix)providedAudioMix
{
  return self->providedAudioMix;
}

- (PHLivePhoto)providedLivePhoto
{
  return self->providedLivePhoto;
}

- (BOOL)requiresConfidentiality
{
  return self->_requiresConfidentiality;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)localCreationDate
{
  return self->_localCreationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)isHDR
{
  return self->_HDR;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isLivePhoto
{
  return self->_livePhoto;
}

- (BOOL)isLivePhotoPlaceholder
{
  return self->_livePhotoPlaceholder;
}

- (BOOL)canPlayPhotoIris
{
  return self->_canPlayPhotoIris;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoSynchronizedDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (BOOL)representsBurst
{
  return self->_representsBurst;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_numberOfRepresentedAssets;
}

- (UIImage)providedPreviewImage
{
  return self->_providedPreviewImage;
}

- (NSDictionary)providedImageMetadata
{
  return self->_providedImageMetadata;
}

- (NSURL)providedFullsizeImageURL
{
  return self->_providedFullsizeImageURL;
}

- (NSURL)providedFullsizeRenderImageURL
{
  return self->_providedFullsizeRenderImageURL;
}

- (NSURL)providedVideoURL
{
  return self->_providedVideoURL;
}

- (NSURL)providedFullsizeRenderVideoURL
{
  return self->_providedFullsizeRenderVideoURL;
}

- (PFAssetAdjustments)assetAdjustments
{
  return self->_assetAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAdjustments, 0);
  objc_storeStrong((id *)&self->_providedFullsizeRenderVideoURL, 0);
  objc_storeStrong((id *)&self->_providedVideoURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeRenderImageURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeImageURL, 0);
  objc_storeStrong((id *)&self->_providedImageMetadata, 0);
  objc_storeStrong((id *)&self->_providedPreviewImage, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->providedLivePhoto, 0);
  objc_storeStrong((id *)&self->providedAudioMix, 0);
  objc_storeStrong((id *)&self->providedAVAsset, 0);
}

void __34__PUReviewAsset__removeFileAtURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLAssetExplorerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

+ (unint64_t)_confidentialityWarningsVersionForAdjustments:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;

  objc_msgSend(a3, "adjustmentFormatIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == CFSTR("com.apple.FunEffects")
    || -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.FunEffects")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldShowConfidentialityWarningForAdjustments:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "_shouldCheckConfidentiality"))
  {
    v5 = objc_msgSend(a1, "_confidentialityWarningsVersionForAdjustments:", v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = v5 >= objc_msgSend(v6, "confidentialityWarningsVersion");

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)_shouldShowConfidentialityWarningForMetadata:(id)a3 creationDate:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a1, "_shouldCheckConfidentiality"))
    objc_msgSend(v5, "count");

  return 0;
}

+ (id)createUniqueMediaDirectoryForAssetWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ReviewData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v15);
  v11 = v15;

  if (v11)
  {
    PLAssetExplorerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fileURLForFullsizeImageInDirectory:(id)a3 extension:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(CFSTR("Image"), "stringByAppendingPathExtension:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fileURLForFullsizeRenderImageInDirectory:(id)a3 extension:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(CFSTR("RenderedImage"), "stringByAppendingPathExtension:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fileURLForFullsizeVideoInDirectory:(id)a3 extension:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(CFSTR("Video"), "stringByAppendingPathExtension:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fileURLForFullsizeRenderVideoInDirectory:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("RenderedVideo.mov"));
}

+ (id)fileURLForFullsizeVideoComplementInDirectory:(id)a3
{
  return (id)objc_msgSend(a1, "fileURLForFullsizeImageInDirectory:extension:", a3, CFSTR("mov"));
}

+ (id)fileURLForFullsizeRenderVideoComplementInDirectory:(id)a3
{
  return (id)objc_msgSend(a1, "fileURLForFullsizeRenderImageInDirectory:extension:", a3, CFSTR("mov"));
}

+ (id)fileURLForAdjustmentsInDirectory:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Adjustments.plist"));
}

@end
