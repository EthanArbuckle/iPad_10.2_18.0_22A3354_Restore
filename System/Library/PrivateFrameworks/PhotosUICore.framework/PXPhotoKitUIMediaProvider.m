@implementation PXPhotoKitUIMediaProvider

uint64_t __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E512B740;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v17 = *(_BYTE *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v32;
  int v33;
  PXPhotoKitUIMediaProvider *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  PXPhotoKitUIMediaProvider *v39;
  objc_class *v40;
  void *v41;
  id v42;
  void *v43;
  PXPhotoKitUIMediaProvider *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD *v49;
  char v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t);
  void *v58;
  id v59;
  id v60;
  _QWORD *v61;
  _QWORD v62[5];
  id v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id location[2];

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = v13;
  v45 = self;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = self;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_descriptionForAssertionMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v39, CFSTR("PXPhotoKitUIMediaProvider.m"), 179, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v38, v41);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = self;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v35, CFSTR("PXPhotoKitUIMediaProvider.m"), 179, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v38);
  }

  self = v45;
LABEL_3:

  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  v43 = v14;
  objc_msgSend(v14, "photoKitRequestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E512B6F0;
  objc_copyWeak(&v66, location);
  v42 = v15;
  v65 = v42;
  v19 = _Block_copy(aBlock);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__133058;
    v62[4] = __Block_byref_object_dispose__133059;
    v63 = 0;
    v55 = v18;
    v56 = 3221225472;
    v57 = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_187;
    v58 = &unk_1E513FD98;
    v61 = v62;
    v59 = v20;
    v60 = v16;
    px_dispatch_on_main_queue();
    objc_msgSend(v17, "progressHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _Block_copy(v19);
    v24 = objc_msgSend(v17, "isNetworkAccessAllowed");
    v25 = (void *)objc_msgSend(v17, "copy");

    v51[0] = v18;
    v51[1] = 3221225472;
    v51[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v51[3] = &unk_1E512B718;
    v26 = v22;
    v53 = v26;
    v27 = v59;
    v52 = v27;
    v54 = v62;
    objc_msgSend(v25, "setProgressHandler:", v51);
    v46[0] = v18;
    v46[1] = 3221225472;
    v46[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    v46[3] = &unk_1E512B768;
    v48 = v23;
    v47 = v27;
    v49 = v62;
    v50 = v24;
    v28 = v23;
    v29 = _Block_copy(v46);

    _Block_object_dispose(v62, 8);
    v19 = v29;
  }
  else
  {
    v25 = v17;
  }
  if (objc_msgSend(v16, "isCloudPlaceholder"))
  {
    objc_msgSend(v25, "progressHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      LOBYTE(v62[0]) = 0;
      objc_msgSend(v25, "progressHandler");
      v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD *, _QWORD, double))v31)[2](v31, 0, v62, 0, 0.0);

    }
  }
  -[PXPhotoKitUIMediaProvider imageManager](v45, "imageManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v16, a5, v25, v19, width, height);

  objc_destroyWeak(&v66);
  objc_destroyWeak(location);

  return v33;
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = v7 - 9997;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v19 && (v10 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_noteActivity");

  }
  v12 = v5;
  v13 = v12;
  if (v8 < 4)
    v14 = 1;
  else
    v14 = v10;
  v15 = v12;
  if (v14 == 1)
  {
    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 < 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *(_QWORD *)off_1E50B84E0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *(_QWORD *)off_1E50B84E8);

  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v19, v15);

}

- (void)_noteActivity
{
  atomic_store(mach_absolute_time(), (unint64_t *)&self->_lastActivity);
}

- (PHImageManager)imageManager
{
  return self->_imageManager;
}

- (CGSize)masterThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_masterThumbnailSize.width;
  height = self->_masterThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  _BOOL8 v9;
  BOOL v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C18]);
      v12 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48) | v12;
      v9 = v8 != 0;
      if (v8)
        v10 = 1;
      else
        v10 = v7 == 0;
      if (!v10)
        v9 = *(_BYTE *)(a1 + 64) == 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9, v11);

    }
  }
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v16;
  id v17;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  if (!v7)
    -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  v16 = 0;
  v17 = 0;
  -[PXPhotoKitUIMediaProvider _getQualityClass:cache:qualityClassIndex:forTargetSize:](self, "_getQualityClass:cache:qualityClassIndex:forTargetSize:", &v17, &v16, 0, width, height);
  v12 = v17;
  v13 = v16;
  -[PXPhotoKitUIMediaProvider _thumbnailDataForAsset:qualityClass:cache:onlyFromCache:outDataSpec:](self, "_thumbnailDataForAsset:qualityClass:cache:onlyFromCache:outDataSpec:", v11, v12, v13, v7, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __68__PXPhotoKitUIMediaProvider_enumerateAvailableThumbnailDataFormats___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  __int16 v7;
  char v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD *);
  _QWORD v11[2];
  __int16 v12;
  __int16 v13;
  char v14;
  __int16 v15;
  char v16;

  v3 = a2;
  if (objc_msgSend(v3, "isTable") && objc_msgSend(v3, "metalPixelFormat"))
  {
    v4 = objc_msgSend(v3, "metalPixelFormat");
    v5 = objc_msgSend(v3, "colorSpaceName");
    v6 = objc_msgSend(v3, "maxSideLengthIfSquare");
    v7 = objc_msgSend(v3, "maxSideLengthIfSquare");
    v8 = objc_msgSend(v3, "isCroppedToSquare");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD *))(v9 + 16);
    v11[0] = v4;
    v11[1] = v5;
    v12 = v6;
    v13 = v7;
    v14 = v8;
    v15 = 0;
    v16 = 0;
    v10(v9, v11);
  }

}

- (id)_thumbnailDataForAsset:(id)a3 qualityClass:(id)a4 cache:(id)a5 onlyFromCache:(BOOL)a6 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  unint64_t v17;
  __CFString *v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  char v21;
  unsigned __int16 v22;
  int v23;
  int v24;
  int32x4_t v25;
  uint64_t v26;
  int v28;
  _OWORD v29[2];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = 0;
  if (v11 && v12)
  {
    v15 = v11;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v13, "tableThumbnailDataForAsset:dataSpecification:", v15, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 && !a6)
    {
      objc_msgSend(v12, "tableThumbnailDataForAsset:dataSpecification:", v15, v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v13, "cacheThumbnailData:specification:forAsset:", v14, v29, v15);
    }
    if (a7 && v14)
    {
      v16 = SDWORD2(v29[0]) / SHIDWORD(v29[0]);
      if (SDWORD2(v29[0]) / SHIDWORD(v29[0]) <= 1)
        v16 = 1;
      v28 = v16;
      v17 = objc_msgSend(v12, "metalPixelFormat");
      v18 = (__CFString *)objc_msgSend(v12, "colorSpaceName");
      v19 = objc_msgSend(v12, "maxSideLengthIfSquare");
      v20 = objc_msgSend(v12, "maxSideLengthIfSquare");
      v21 = objc_msgSend(v12, "isCroppedToSquare");
      v22 = WORD4(v29[0]);
      v23 = SDWORD1(v29[1]) / SDWORD2(v29[0]);
      v24 = SDWORD1(v29[1]) % SDWORD2(v29[0]) / v28;
      v25.i64[0] = *(_QWORD *)&v29[0];
      v26 = *(_QWORD *)((char *)v29 + 12);
      a7->var0.var0 = v17;
      a7->var0.var1 = v18;
      a7->var0.var2 = v19;
      a7->var0.var3 = v20;
      a7->var0.var4 = v21;
      *(_WORD *)(&a7->var0.var4 + 1) = 0;
      *(&a7->var0.var4 + 3) = 0;
      a7->var1 = v24;
      a7->var2 = v23;
      v25.i64[1] = v26;
      *(int16x4_t *)&a7->var3 = vmovn_s32(v25);
      *(_DWORD *)&a7->var7 = v22;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (void)_getQualityClass:(id *)a3 cache:(id *)a4 qualityClassIndex:(int64_t *)a5 forTargetSize:(CGSize)a6
{
  double height;
  double width;
  os_unfair_lock_s *p_lock;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PXPhotoKitThumbnailCache *v18;
  int64_t lock_lastQualityClassIndex;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  double v25;
  id v26;
  PXPhotoKitThumbnailCache *v27;
  PHAssetResourceQualityClass *v28;
  PXPhotoKitThumbnailCache *v29;
  PXPhotoKitThumbnailCache *v30;
  id *v31;
  int64_t *v32;
  os_unfair_lock_s *v33;
  id *v34;
  NSArray *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  height = a6.height;
  width = a6.width;
  v41 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_lastTargetSize.width == width && self->_lock_lastTargetSize.height == height)
  {
    v28 = self->_lock_lastResourceQualityClass;
    v29 = self->_lock_lastThumbnailCache;
    lock_lastQualityClassIndex = self->_lock_lastQualityClassIndex;
  }
  else
  {
    v33 = p_lock;
    v34 = a3;
    v31 = a4;
    v32 = a5;
    if (width >= height)
      v14 = width;
    else
      v14 = height;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = self->_thumbnailQualityClasses;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      lock_lastQualityClassIndex = 0;
      v20 = 0;
      v21 = *(_QWORD *)v37;
LABEL_10:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v22);
        if (objc_msgSend(v23, "isCroppedToSquare", v31, v32))
          v24 = width == height;
        else
          v24 = 0;
        if (v24 || (objc_msgSend(v23, "isCroppedToSquare") & 1) == 0)
        {
          lock_lastQualityClassIndex = v20 + v22;
          v25 = (double)objc_msgSend(v23, "maxSideLengthIfSquare");
          v26 = v23;

          -[NSArray objectAtIndexedSubscript:](self->_thumbnailCaches, "objectAtIndexedSubscript:", v20 + v22);
          v27 = (PXPhotoKitThumbnailCache *)objc_claimAutoreleasedReturnValue();

          if (v14 <= v25)
          {
            v28 = (PHAssetResourceQualityClass *)v26;
            v29 = v27;

            if (v28)
            {
              a4 = v31;
              a5 = v32;
              goto LABEL_30;
            }
            v17 = 0;
            v18 = v29;
            goto LABEL_29;
          }
          v17 = v26;
          v18 = v27;
        }
        if (v16 == ++v22)
        {
          v20 += v22;
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v16)
            goto LABEL_10;
          goto LABEL_27;
        }
      }
    }
    lock_lastQualityClassIndex = 0;
    v18 = 0;
    v17 = 0;
LABEL_27:

    v29 = 0;
LABEL_29:
    a4 = v31;
    a5 = v32;
    v28 = v17;
    v30 = v18;

    v29 = v30;
LABEL_30:
    self->_lock_lastTargetSize.width = width;
    self->_lock_lastTargetSize.height = height;
    objc_storeStrong((id *)&self->_lock_lastResourceQualityClass, v28);
    objc_storeStrong((id *)&self->_lock_lastThumbnailCache, v29);
    self->_lock_lastQualityClassIndex = lock_lastQualityClassIndex;

    p_lock = v33;
    a3 = v34;
  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v28);
  if (a4)
    *a4 = objc_retainAutorelease(v29);
  if (a5)
    *a5 = lock_lastQualityClassIndex;

}

void __57__PXPhotoKitUIMediaProvider__defaultLoadingStatusManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)off_1E50B32C0);
  v1 = (void *)_defaultLoadingStatusManager_defaultLoadingStatusManager;
  _defaultLoadingStatusManager_defaultLoadingStatusManager = (uint64_t)v0;

}

- (void)enumerateAvailableThumbnailDataFormats:(id)a3
{
  id v4;
  NSArray *thumbnailQualityClasses;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitUIMediaProvider;
  -[PXMediaProvider enumerateAvailableThumbnailDataFormats:](&v9, sel_enumerateAvailableThumbnailDataFormats_, v4);
  thumbnailQualityClasses = self->_thumbnailQualityClasses;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PXPhotoKitUIMediaProvider_enumerateAvailableThumbnailDataFormats___block_invoke;
  v7[3] = &unk_1E512B8F8;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](thumbnailQualityClasses, "enumerateObjectsUsingBlock:", v7);

}

void __49__PXPhotoKitUIMediaProvider__defaultImageManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CD1488]);
  v1 = (void *)_defaultImageManager_defaultImageManager;
  _defaultImageManager_defaultImageManager = (uint64_t)v0;

}

+ (PXPhotoKitUIMediaProvider)mediaProviderWithLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultImageManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageManager:library:", v5, v4);

  objc_msgSend(a1, "_defaultLoadingStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLoadingStatusManager:", v7);

  return (PXPhotoKitUIMediaProvider *)v6;
}

+ (id)_defaultLoadingStatusManager
{
  if (_defaultLoadingStatusManager_onceToken != -1)
    dispatch_once(&_defaultLoadingStatusManager_onceToken, &__block_literal_global_160_133095);
  return (id)_defaultLoadingStatusManager_defaultLoadingStatusManager;
}

+ (id)_defaultImageManager
{
  if (_defaultImageManager_onceToken != -1)
    dispatch_once(&_defaultImageManager_onceToken, &__block_literal_global_133097);
  return (id)_defaultImageManager_defaultImageManager;
}

- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  PXPhotoKitUIMediaProvider *v9;
  PXPhotoKitUIMediaProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *thumbnailQualityClasses;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  PXPhotoKitThumbnailCache *v28;
  void *v29;
  PXPreheatInfo *v30;
  uint64_t v31;
  NSArray *thumbnailCaches;
  NSMutableArray *preheatLock_preheatStates;
  uint64_t v34;
  OS_dispatch_queue *preheatQueue;
  void *v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  void *v41;
  PXPhotoKitUIMediaProvider *v42;
  NSArray *obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)PXPhotoKitUIMediaProvider;
  v9 = -[PXPhotoKitUIMediaProvider init](&v48, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_storeStrong((id *)&v10->_imageManager, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v7;
    else
      v11 = 0;
    objc_storeStrong((id *)&v10->_cachingImageManager, v11);
    v12 = (void *)MEMORY[0x1E0CD1460];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isTable = YES"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allQualityClassesMatchingPredicate:inLibrary:", v13, v8);
    v14 = objc_claimAutoreleasedReturnValue();
    thumbnailQualityClasses = v10->_thumbnailQualityClasses;
    v10->_thumbnailQualityClasses = (NSArray *)v14;

    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "thumbnailCacheSize");
    if (v17)
    {
      v18 = v17;
      v41 = v16;
      v19 = v8;
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v42 = v10;
      obj = v10->_thumbnailQualityClasses;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v22)
      {
        v23 = v22;
        v24 = v18 << 20;
        v25 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v45 != v25)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v28 = -[PXPhotoKitThumbnailCache initWithSizeLimit:photoLibrary:]([PXPhotoKitThumbnailCache alloc], "initWithSizeLimit:photoLibrary:", v24, v19);
            objc_msgSend(v27, "description");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXPhotoKitThumbnailCache setLabel:](v28, "setLabel:", v29);

            objc_msgSend(v20, "addObject:", v28);
            v30 = -[PXPreheatInfo initWithFetchResult:origin:]([PXPreheatInfo alloc], "initWithFetchResult:origin:", 0, 0);
            -[NSMutableArray addObject:](v21, "addObject:", v30);

          }
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v23);
      }

      v31 = objc_msgSend(v20, "copy");
      v10 = v42;
      thumbnailCaches = v42->_thumbnailCaches;
      v42->_thumbnailCaches = (NSArray *)v31;

      preheatLock_preheatStates = v42->_preheatLock_preheatStates;
      v42->_preheatLock_preheatStates = v21;

      v8 = v19;
      v16 = v41;
    }
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_preheatlock._os_unfair_lock_opaque = 0;
    objc_msgSend(off_1E50B3340, "preheatQueue", v41);
    v34 = objc_claimAutoreleasedReturnValue();
    preheatQueue = v10->_preheatQueue;
    v10->_preheatQueue = (OS_dispatch_queue *)v34;

    atomic_store(0, (unint64_t *)&v10->_lastActivity);
    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "masterThumbnailFormat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "sizeWithFallBackSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v10->_masterThumbnailSize.width = v38;
    v10->_masterThumbnailSize.height = v39;

  }
  return v10;
}

- (PXPhotoKitUIMediaProvider)initWithImageManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PXPhotoKitUIMediaProvider *v7;

  v4 = (void *)MEMORY[0x1E0CD16F8];
  v5 = a3;
  objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:](self, "initWithImageManager:library:", v5, v6);

  return v7;
}

- (PXPhotoKitUIMediaProvider)init
{
  void *v3;
  PXPhotoKitUIMediaProvider *v4;

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotoKitUIMediaProvider initWithImageManager:](self, "initWithImageManager:", v3);

  return v4;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  _QWORD *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  v31 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__133058;
    v50[4] = __Block_byref_object_dispose__133059;
    v51 = 0;
    v43 = MEMORY[0x1E0C809B0];
    v44 = 3221225472;
    v45 = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
    v46 = &unk_1E513FD98;
    v49 = v50;
    v47 = v14;
    v48 = v31;
    px_dispatch_on_main_queue();
    v30 = v10;
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v19 = objc_msgSend(v12, "isNetworkAccessAllowed");
    v20 = (void *)objc_msgSend(v12, "copy");

    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2;
    v39[3] = &unk_1E512B718;
    v21 = v17;
    v41 = v21;
    v22 = v47;
    v40 = v22;
    v42 = v50;
    objc_msgSend(v20, "setProgressHandler:", v39);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B790;
    v36 = v18;
    v35 = v22;
    v37 = v50;
    v38 = v19;
    v23 = v18;
    v24 = _Block_copy(aBlock);

    _Block_object_dispose(v50, 8);
    v13 = v24;
    v10 = v30;
  }
  else
  {
    v20 = v12;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_6;
  v32[3] = &unk_1E512B7B8;
  v33 = v13;
  v26 = v13;
  v27 = objc_msgSend(v25, "requestImageDataAndOrientationForAsset:options:resultHandler:", v31, v20, v32);

  return v27;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  int v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:PHAsset.class]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLoadingMode:", 0x10000);
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__133058;
    v48[4] = __Block_byref_object_dispose__133059;
    v49 = 0;
    v41 = MEMORY[0x1E0C809B0];
    v42 = 3221225472;
    v43 = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
    v44 = &unk_1E513FD98;
    v47 = v48;
    v45 = v14;
    v46 = v9;
    px_dispatch_on_main_queue();
    v30 = v10;
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v37[0] = v16;
    v37[1] = 3221225472;
    v37[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2;
    v37[3] = &unk_1E512B718;
    v19 = v17;
    v39 = v19;
    v20 = v45;
    v38 = v20;
    v40 = v48;
    objc_msgSend(v12, "setProgressHandler:", v37);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B7E0;
    v35 = v18;
    v34 = v20;
    v36 = v48;
    v21 = v18;
    v22 = _Block_copy(aBlock);

    _Block_object_dispose(v48, 8);
    v13 = v22;
    v10 = v30;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6;
  v31[3] = &unk_1E5147AB8;
  v32 = v13;
  v24 = *MEMORY[0x1E0CD1C28];
  v25 = *(double *)(MEMORY[0x1E0CD1C28] + 8);
  v26 = v13;
  v27 = objc_msgSend(v23, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v31, v24, v25);

  return v27;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  _QWORD *v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__133058;
    v45[4] = __Block_byref_object_dispose__133059;
    v46 = 0;
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
    v41 = &unk_1E513FD98;
    v44 = v45;
    v42 = v14;
    v43 = v9;
    px_dispatch_on_main_queue();
    v28 = v10;
    objc_msgSend(v12, "progressHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _Block_copy(v13);
    v18 = objc_msgSend(v12, "isNetworkAccessAllowed");
    v19 = (void *)objc_msgSend(v12, "copy");

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
    v34[3] = &unk_1E512B718;
    v20 = v16;
    v36 = v20;
    v21 = v42;
    v35 = v21;
    v37 = v45;
    objc_msgSend(v19, "setProgressHandler:", v34);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B808;
    v31 = v17;
    v30 = v21;
    v32 = v45;
    v33 = v18;
    v22 = v17;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(v45, 8);
    v13 = v23;
    v10 = v28;
  }
  else
  {
    v19 = v12;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "requestPlayerItemForVideo:options:resultHandler:", v9, v19, v13);

  return v25;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v35;
  id v36;
  _QWORD *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v14, "photoKitRequestOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v15);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__133058;
    v50[4] = __Block_byref_object_dispose__133059;
    v51 = 0;
    v43 = MEMORY[0x1E0C809B0];
    v44 = 3221225472;
    v45 = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v46 = &unk_1E513FD98;
    v49 = v50;
    v47 = v18;
    v48 = v13;
    px_dispatch_on_main_queue();
    v32 = v14;
    objc_msgSend(v16, "progressHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _Block_copy(v17);
    v22 = objc_msgSend(v16, "isNetworkAccessAllowed");
    v23 = (void *)objc_msgSend(v16, "copy");

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v39[3] = &unk_1E512B718;
    v24 = v20;
    v41 = v24;
    v25 = v47;
    v40 = v25;
    v42 = v50;
    objc_msgSend(v23, "setProgressHandler:", v39);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B830;
    v36 = v21;
    v35 = v25;
    v37 = v50;
    v38 = v22;
    v26 = v21;
    v27 = _Block_copy(aBlock);

    _Block_object_dispose(v50, 8);
    v17 = v27;
    v14 = v32;
  }
  else
  {
    v23 = v16;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v23, v17, width, height);

  return v29;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  PXPhotoKitUIMediaProvider *v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  _QWORD *v33;
  char v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__133058;
    v46[4] = __Block_byref_object_dispose__133059;
    v16 = MEMORY[0x1E0C809B0];
    v47 = 0;
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
    v42 = &unk_1E513FD98;
    v45 = v46;
    v43 = v14;
    v44 = v9;
    px_dispatch_on_main_queue();
    v28 = self;
    v17 = v16;
    v29 = v10;
    objc_msgSend(v12, "progressHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _Block_copy(v13);
    LOBYTE(v16) = objc_msgSend(v12, "isNetworkAccessAllowed");
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2;
    v35[3] = &unk_1E512B718;
    v20 = v18;
    v37 = v20;
    v21 = v43;
    v36 = v21;
    v38 = v46;
    objc_msgSend(v12, "setProgressHandler:", v35);
    aBlock[0] = v17;
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B858;
    v32 = v19;
    v31 = v21;
    v33 = v46;
    v34 = v16;
    v22 = v19;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(v46, 8);
    v13 = v23;
    v10 = v29;
    self = v28;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "requestAnimatedImageForAsset:options:resultHandler:", v9, v12, v13);

  return v25;
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  _QWORD *v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__133058;
    v45[4] = __Block_byref_object_dispose__133059;
    v46 = 0;
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke;
    v41 = &unk_1E513FD98;
    v44 = v45;
    v42 = v14;
    v43 = v9;
    px_dispatch_on_main_queue();
    v28 = v10;
    objc_msgSend(v12, "progressHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _Block_copy(v13);
    v18 = objc_msgSend(v12, "isNetworkAccessAllowed");
    v19 = (void *)objc_msgSend(v12, "copy");

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_2;
    v34[3] = &unk_1E512B718;
    v20 = v16;
    v36 = v20;
    v21 = v42;
    v35 = v21;
    v37 = v45;
    objc_msgSend(v19, "setProgressHandler:", v34);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B880;
    v31 = v17;
    v30 = v21;
    v32 = v45;
    v33 = v18;
    v22 = v17;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(v45, 8);
    v13 = v23;
    v10 = v28;
  }
  else
  {
    v19 = v12;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "requestURLForVideo:options:resultHandler:", v9, v19, v13);

  return v25;
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 602, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  -[PXPhotoKitUIMediaProvider _noteActivity](self, "_noteActivity");
  objc_msgSend(v10, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v11);
  -[PXMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v29 = v11;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__133058;
    v45[4] = __Block_byref_object_dispose__133059;
    v16 = MEMORY[0x1E0C809B0];
    v46 = 0;
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke;
    v41 = &unk_1E513FD98;
    v44 = v45;
    v42 = v14;
    v43 = v9;
    px_dispatch_on_main_queue();
    v28 = v10;
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v19 = (void *)objc_msgSend(v12, "copy");

    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_2;
    v34[3] = &unk_1E512B718;
    v20 = v17;
    v36 = v20;
    v21 = v42;
    v35 = v21;
    v37 = v45;
    objc_msgSend(v19, "setProgressHandler:", v34);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E512B8D0;
    v32 = v18;
    v31 = v21;
    v33 = v45;
    v22 = v18;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(v45, 8);
    v13 = v23;
    v10 = v28;
    v11 = v29;
  }
  else
  {
    v19 = v12;
  }
  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "requestStreamForVideo:options:resultHandler:", v9, v19, v13);

  return v25;
}

- (void)preheatThumbnailDataForAssets:(id)a3 origin:(int64_t)a4 targetSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;
  PXPreheatInfo *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  -[PXPhotoKitUIMediaProvider _getQualityClass:cache:qualityClassIndex:forTargetSize:](self, "_getQualityClass:cache:qualityClassIndex:forTargetSize:", &v20, &v19, &v21, width, height);
  v10 = v20;
  v11 = v19;
  if (v11)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      a4 = 0;
    v12 = -[PXPreheatInfo initWithFetchResult:origin:]([PXPreheatInfo alloc], "initWithFetchResult:origin:", v9, a4);
    -[PXPhotoKitUIMediaProvider _setPreheatInfo:forQualityClassIndex:](self, "_setPreheatInfo:forQualityClassIndex:", v12, v21);
  }
  else
  {
    v12 = (PXPreheatInfo *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v13 = objc_msgSend(v9, "count");
    if (v13 >= 1)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(v9, "thumbnailAssetAtIndex:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "thumbnailIndex");
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          -[PXPreheatInfo addIndex:](v12, "addIndex:", v17);

      }
    }
    -[PXPhotoKitUIMediaProvider photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preheatDataForThumbnailIndexes:inLibrary:", v12, v18);

  }
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4;

  -[PXPhotoKitUIMediaProvider imageManager](self, "imageManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", a3);

}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  height = a4.height;
  width = a4.width;
  v19 = a3;
  v12 = a6;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 835, CFSTR("%@ expected PHAssets"), v16);

    }
  }
  -[PXPhotoKitUIMediaProvider cachingImageManager](self, "cachingImageManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoKitRequestOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "startCachingImagesForAssets:targetSize:contentMode:options:", v19, a5, v18, width, height);
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  height = a4.height;
  width = a4.width;
  v19 = a3;
  v12 = a6;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitUIMediaProvider.m"), 840, CFSTR("%@ expected PHAssets"), v16);

    }
  }
  -[PXPhotoKitUIMediaProvider cachingImageManager](self, "cachingImageManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoKitRequestOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stopCachingImagesForAssets:targetSize:contentMode:options:", v19, a5, v18, width, height);
}

- (void)stopCachingImagesForAllAssets
{
  id v2;

  -[PXPhotoKitUIMediaProvider cachingImageManager](self, "cachingImageManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopCachingImagesForAllAssets");

}

- (void)_preheatQueue_update
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  unint64_t preheatQueue_state;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;
  id *v21;
  int64_t v22;
  int64_t v23;
  PXPhotoKitUIMediaProvider *v24;
  int64_t v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void **v32;
  void *v33;
  BOOL v34;
  uint64_t i;
  int v36;
  void *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *context;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  int64_t v47;
  void *v48;
  int64_t v49;
  void *v50;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE __base[16];
  _QWORD v56[192];

  v56[190] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_preheatQueue);
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = mach_absolute_time();
  objc_msgSend(v37, "opportunisticPreheatRequiredIdleTime");
  v4 = v3;
  PXTimebaseConversionFactor();
  v47 = v2 - (uint64_t)(v4 / v5);
  preheatQueue_state = self->_preheatQueue_state;
  if (preheatQueue_state != 1)
  {
LABEL_5:
    if (preheatQueue_state != 2)
      goto LABEL_51;
    goto LABEL_6;
  }
  v7 = atomic_load((unint64_t *)&self->_lastActivity);
  if (v7 >= v47)
  {
    preheatQueue_state = self->_preheatQueue_state;
    goto LABEL_5;
  }
  self->_preheatQueue_state = 2;
LABEL_6:
  if (-[NSArray count](self->_thumbnailQualityClasses, "count"))
  {
    v38 = 0;
    v46 = 0;
    do
    {
      if (self->_preheatQueue_state != 2)
        break;
      -[NSArray objectAtIndexedSubscript:](self->_thumbnailQualityClasses, "objectAtIndexedSubscript:", v46);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_thumbnailCaches, "objectAtIndexedSubscript:", v46);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitUIMediaProvider _preheatInfoForQualityClassIndex:](self, "_preheatInfoForQualityClassIndex:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45 || (objc_msgSend(v48, "finished") & 1) != 0)
      {
        if ((objc_msgSend(v48, "finished") & 1) == 0)
        {
          objc_msgSend(v48, "fetchResult");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "preheatedIndexes");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v50, "count");
          v8 = objc_msgSend(v48, "preheatOrigin");
          if (v8 >= v53)
            v9 = v53;
          else
            v9 = v8;
          v43 = objc_msgSend(v48, "cachedBytes");
          v10 = v9 & ~(v9 >> 63);
          v11 = v10 - 64;
          v49 = (unint64_t)(3 * objc_msgSend(v45, "sizeLimit")) >> 2;
          v12 = v53 - v10;
          if (v10 > v53 - v10)
            v12 = v10;
          v13 = v12 + 1;
          bzero(__base, 0x600uLL);
          v54 = 0;
          v39 = v13 >> 6;
          v40 = (v13 >> 6) + 1;
          v41 = 0;
          while (1)
          {
            context = (void *)MEMORY[0x1A85CE17C]();
            v14 = 0;
            v15 = 64;
            do
            {
              if (v54)
                v16 = v10;
              else
                v16 = v11;
              if ((v16 & 0x8000000000000000) == 0 && v16 < v53 && (objc_msgSend(v52, "containsIndex:", v16) & 1) == 0)
              {
                objc_msgSend(v50, "thumbnailAssetAtIndex:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&__base[24 * v14] = v16;
                v18 = objc_msgSend(v17, "thumbnailIndex");
                v19 = &__base[24 * v14];
                v20 = (void *)*((_QWORD *)v19 + 2);
                *((_QWORD *)v19 + 1) = v18;
                *((_QWORD *)v19 + 2) = v17;

                ++v14;
              }
              v10 += v54 != 0;
              v11 += v54 == 0;
              --v15;
            }
            while (v15);
            qsort_b(__base, v14, 0x18uLL, &__block_literal_global_208);
            v21 = (id *)v56;
            v22 = v14;
            v23 = v43;
            if (v14 >= 1)
            {
              while (v23 < v49)
              {
                v24 = self;
                v25 = atomic_load((unint64_t *)&self->_lastActivity);
                if (v25 > v47
                  || (-[PXPhotoKitUIMediaProvider _preheatInfoForQualityClassIndex:](self, "_preheatInfoForQualityClassIndex:", v46), v26 = (void *)objc_claimAutoreleasedReturnValue(), v27 = v26 == v48, v26, v24 = self, !v27))
                {
                  v24->_preheatQueue_state = 1;
                  goto LABEL_35;
                }
                v28 = (uint64_t)*(v21 - 2);
                v29 = *v21;
                -[PXPhotoKitUIMediaProvider _thumbnailDataForAsset:qualityClass:cache:onlyFromCache:outDataSpec:](self, "_thumbnailDataForAsset:qualityClass:cache:onlyFromCache:outDataSpec:", v29, v44, v45, 0, 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "length");

                objc_msgSend(v52, "addIndex:", v28);
                v23 += v31;
                v21 += 3;
                if (!--v22)
                  goto LABEL_36;
              }
              objc_msgSend(v48, "markAsFinished");
LABEL_35:
              v41 = v40;
              v54 = 2;
LABEL_36:
              v32 = (void **)v56;
              do
              {
                v33 = *v32;
                *v32 = 0;

                v32 += 3;
                --v14;
              }
              while (v14);
            }
            objc_autoreleasePoolPop(context);
            v43 = v23;
            v34 = v54++ < 1;
            if (!v34)
            {
              v54 = 0;
              v11 -= 128;
              v34 = v41++ < v39;
              if (!v34)
                break;
            }
          }
          objc_msgSend(v48, "setCachedBytes:", v23);
          for (i = 1528; i != -8; i -= 24)

        }
      }
      else
      {
        objc_msgSend(v48, "markAsFinished");
      }
      if ((v38 & 1) != 0)
        LOBYTE(v36) = 1;
      else
        v36 = objc_msgSend(v48, "finished") ^ 1;
      v38 = v36;

      ++v46;
    }
    while (v46 < -[NSArray count](self->_thumbnailQualityClasses, "count"));
  }
  else
  {
    v38 = 0;
  }
  preheatQueue_state = v38 & 1;
  self->_preheatQueue_state = preheatQueue_state;
LABEL_51:
  if (preheatQueue_state)
    -[PXPhotoKitUIMediaProvider _preheatQueue_scheduleUpdateAfterDelay](self, "_preheatQueue_scheduleUpdateAfterDelay");

}

- (id)_preheatInfoForQualityClassIndex:(int64_t)a3
{
  os_unfair_lock_s *p_preheatlock;
  void *v6;

  p_preheatlock = &self->_preheatlock;
  os_unfair_lock_lock(&self->_preheatlock);
  -[NSMutableArray objectAtIndexedSubscript:](self->_preheatLock_preheatStates, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_preheatlock);
  return v6;
}

- (void)_setPreheatInfo:(id)a3 forQualityClassIndex:(int64_t)a4
{
  os_unfair_lock_s *p_preheatlock;
  id v7;

  p_preheatlock = &self->_preheatlock;
  v7 = a3;
  os_unfair_lock_lock(p_preheatlock);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_preheatLock_preheatStates, "replaceObjectAtIndex:withObject:", a4, v7);
  os_unfair_lock_unlock(p_preheatlock);
  LOBYTE(a4) = objc_msgSend(v7, "finished");

  if ((a4 & 1) == 0)
    -[PXPhotoKitUIMediaProvider _schedulePreheat](self, "_schedulePreheat");
}

- (void)_schedulePreheat
{
  NSObject *preheatQueue;
  dispatch_block_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  preheatQueue = self->_preheatQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXPhotoKitUIMediaProvider__schedulePreheat__block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  v4 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v5);
  dispatch_async(preheatQueue, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_preheatQueue_schedulePreheat
{
  if (!self->_preheatQueue_state)
  {
    self->_preheatQueue_state = 1;
    -[PXPhotoKitUIMediaProvider _preheatQueue_update](self, "_preheatQueue_update");
  }
}

- (void)_preheatQueue_scheduleUpdateAfterDelay
{
  dispatch_time_t v3;
  NSObject *preheatQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 250000000);
  preheatQueue = self->_preheatQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXPhotoKitUIMediaProvider__preheatQueue_scheduleUpdateAfterDelay__block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, preheatQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_lastThumbnailCache, 0);
  objc_storeStrong((id *)&self->_lock_lastResourceQualityClass, 0);
  objc_storeStrong((id *)&self->_preheatQueue, 0);
  objc_storeStrong((id *)&self->_preheatLock_preheatStates, 0);
  objc_storeStrong((id *)&self->_thumbnailCaches, 0);
  objc_storeStrong((id *)&self->_thumbnailQualityClasses, 0);
}

void __67__PXPhotoKitUIMediaProvider__preheatQueue_scheduleUpdateAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_preheatQueue_update");

}

void __45__PXPhotoKitUIMediaProvider__schedulePreheat__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_preheatQueue_schedulePreheat");

}

uint64_t __49__PXPhotoKitUIMediaProvider__preheatQueue_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(_DWORD *)(a2 + 8) - *(_DWORD *)(a3 + 8));
}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(__n128))(v3 + 16))(a2);
  v4 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
  v14 = v9;
  v15 = *(id *)(a1 + 32);
  v16 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  px_dispatch_on_main_queue();

}

void __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL8 v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
      v4 = 1;
    else
      v4 = *(_QWORD *)(a1 + 56) != 0;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v4, v5);

  }
}

uint64_t __73__PXPhotoKitUIMediaProvider_requestStreamForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(__n128))(v3 + 16))(a2);
  v4 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v11 = v5;
  v10 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  px_dispatch_on_main_queue();

}

void __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = *(_QWORD *)(a1 + 48);
    v7 = v6 != 0;
    if (!v6)
    {
      if (v5)
        v7 = *(_BYTE *)(a1 + 64) == 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7, v8);

  }
}

uint64_t __70__PXPhotoKitUIMediaProvider_requestURLForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E512B740;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v17 = *(_BYTE *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  _BOOL8 v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      v8 = *(_QWORD *)(a1 + 48);
      v9 = v8 != 0;
      if (!v8)
      {
        if (v7)
          v9 = *(_BYTE *)(a1 + 64) == 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9, v10);

    }
  }
}

uint64_t __80__PXPhotoKitUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E512B740;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v17 = *(_BYTE *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = *(_QWORD *)(a1 + 48);
    v7 = v6 != 0;
    if (!v6)
    {
      if (v5)
        v7 = *(_BYTE *)(a1 + 64) == 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7, v8);

  }
}

uint64_t __99__PXPhotoKitUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E512B740;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v17 = *(_BYTE *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = *(_QWORD *)(a1 + 48);
    v7 = v6 != 0;
    if (!v6)
    {
      if (v5)
        v7 = *(_BYTE *)(a1 + 64) == 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7, v8);

  }
}

uint64_t __77__PXPhotoKitUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E513D0D8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *MEMORY[0x1E0CD1C18];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __75__PXPhotoKitUIMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5141AE0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v9 = a2;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v11 + 16))(v11, v9, a3, a4, v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5;
  block[3] = &unk_1E512B740;
  v17 = v10;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v9;
  v20 = v13;
  v18 = v12;
  v21 = *(_BYTE *)(a1 + 56);
  v14 = v9;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v8 = a5;
    v9 = a3;
    v11 = a2;
    v10 = PLImageOrientationFromExifOrientation();
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v5 + 16))(v5, v11, v9, v10, v8);

  }
}

void __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = *(_QWORD *)(a1 + 48);
    v7 = v6 != 0;
    if (!v6)
    {
      if (v5)
        v7 = *(_BYTE *)(a1 + 64) == 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7, v8);

  }
}

uint64_t __76__PXPhotoKitUIMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __95__PXPhotoKitUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_187(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
