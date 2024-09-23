@implementation PUReviewAssetsMediaProvider

- (PUReviewAssetsMediaProvider)init
{
  PUReviewAssetsMediaProvider *v2;
  PUReviewAssetsMediaProvider *v3;
  void *v4;
  double v5;
  uint64_t v6;
  PHConcurrentMapTable *mediaRequests;
  PUReviewAssetsMediaProvider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUReviewAssetsMediaProvider;
  v2 = -[PUReviewAssetsMediaProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned int *)&v2->_nextRequestIdentifier);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3->__screenScale = v5;

    objc_msgSend(MEMORY[0x1E0CD14F0], "mapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaRequests = v3->__mediaRequests;
    v3->__mediaRequests = (PHConcurrentMapTable *)v6;

    v8 = v3;
  }

  return v3;
}

- (int)_incrementRequestIdentifier
{
  int *p_nextRequestIdentifier;
  unsigned int v3;
  int result;

  p_nextRequestIdentifier = &self->_nextRequestIdentifier;
  do
  {
    v3 = __ldaxr((unsigned int *)p_nextRequestIdentifier);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, (unsigned int *)p_nextRequestIdentifier));
  return result;
}

- (int)_requestAdjustmentDataForAsset:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  v7 = a3;
  v8 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  objc_msgSend(v7, "assetAdjustments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "phAdjustmentData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *MEMORY[0x1E0CD1C68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = *MEMORY[0x1E0CD1820];
    v15[0] = v11;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v12);

    v6 = (void (**)(id, _QWORD, uint64_t))v12;
  }
  else
  {
    v16 = *MEMORY[0x1E0CD1C68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, (uint64_t)v11);
  }

  return v8;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  BOOL v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PUCAMReviewAssetsFigDecodeItem *v38;
  void *v39;
  unint64_t v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  PUCAMReviewAssetsFigDecodeItem *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  dispatch_block_t v54;
  NSObject *v55;
  int v56;
  void *v57;
  void *v59;
  void *v60;
  PUCAMReviewAssetsFigDecodeItem *v61;
  PUCAMReviewAssetsFigDecodeItem *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  unsigned int v66;
  void *v67;
  _QWORD block[5];
  id v69;
  id v70;
  id v71;
  id v72;
  double v73;
  double v74;
  BOOL v75;
  char v76;
  _QWORD v77[4];
  id v78;
  id v79;
  unsigned int v80;
  _QWORD aBlock[4];
  id v82;
  void (**v83)(id, void *, _QWORD);
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[3];

  height = a4.height;
  width = a4.width;
  v88[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 173, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v16 = v13;
  v17 = objc_msgSend(v14, "version");
  if (v17 != 16)
  {
    v19 = v17;
    v66 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
    v64 = objc_msgSend(v14, "deliveryMode");
    v20 = objc_msgSend(v14, "isSynchronous");
    objc_msgSend(v16, "providedImageURLForImageVersion:", v19);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "providedVideoURLForImageVersion:", v19);
    v21 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "playbackStyle") & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (v21)
        v22 = v20 ^ 1;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v65 = (void *)v21;
    objc_msgSend(v16, "providedPreviewImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    v25 = v24;
    objc_msgSend(v23, "size");
    v28 = height <= v25 * v27 && width <= v25 * v26;
    if (v23)
    {
      objc_msgSend(v16, "assetAdjustments");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v30 = 1;
      else
        v30 = v29 == 0;
      v31 = v30;

    }
    else
    {
      v31 = 0;
    }
    if (v67)
      v32 = 1;
    else
      v32 = v22;
    if ((v28 & v31 & 1) != 0 || !v32)
    {
      v15[2](v15, v23, 0);
      v18 = v66;
      v39 = v65;
LABEL_54:

      goto LABEL_55;
    }
    v87 = *MEMORY[0x1E0CD1C68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v67, "pathExtension");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "typeWithFilenameExtension:conformingToType:", v35, *MEMORY[0x1E0CEC520]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v36;
    if ((objc_msgSend(v36, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
      || objc_msgSend(v36, "conformsToType:", *MEMORY[0x1E0CEC508]))
    {
      v38 = -[PUCAMReviewAssetsFigDecodeItem initWithImageURL:targetSize:]([PUCAMReviewAssetsFigDecodeItem alloc], "initWithImageURL:targetSize:", v67, width, height);
    }
    else
    {
      v38 = 0;
    }
    v40 = v64;
    if (v20)
    {
      if (v64 == 2)
        v41 = v31;
      else
        v41 = 0;
      if ((v41 & 1) == 0)
      {
        v61 = v38;
        if (v38)
        {
          -[PLFigPreheatItem cachedImage:](v38, "cachedImage:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v63, "mutableCopy");
          v44 = 0;
          v18 = v66;
          v39 = v65;
        }
        else
        {
          objc_msgSend(v36, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = 0;
          -[PUReviewAssetsMediaProvider _resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:](self, "_resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:", v67, v52, 1, &v84, width, height);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v84;

          v53 = (void *)objc_msgSend(v63, "mutableCopy");
          v43 = v53;
          v18 = v66;
          v39 = v65;
          if (v44)
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0CD1BE8]);
        }
        ((void (**)(id, void *, void *))v15)[2](v15, v42, v43);

        goto LABEL_52;
      }
    }
    else if (v64 <= 1)
    {
      v60 = v36;
      v45 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
      aBlock[3] = &unk_1E58A7170;
      v46 = v38;
      v83 = v15;
      v82 = v63;
      v47 = _Block_copy(aBlock);
      v62 = v46;
      if (v46)
      {
        -[PUReviewAssetsMediaProvider _mediaRequests](self, "_mediaRequests");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKey:", v46, v49);

        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
        v77[3] = &unk_1E58A7198;
        v80 = v66;
        v78 = v48;
        v79 = v47;
        v50 = v47;
        v51 = v48;
        -[PLFigPreheatItem startPreheatRequestWithCompletionHandler:](v46, "startPreheatRequestWithCompletionHandler:", v77);

        v37 = v60;
      }
      else
      {
        block[0] = v45;
        block[1] = 3221225472;
        block[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
        block[3] = &unk_1E58A71C0;
        v75 = objc_msgSend(v14, "resizeMode") == 2;
        block[4] = self;
        v69 = v67;
        v37 = v60;
        v73 = width;
        v74 = height;
        v70 = v60;
        v72 = v47;
        v76 = v22;
        v71 = v65;
        v51 = v47;
        v54 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_get_global_queue(21, 0);
        v55 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v55, v54);

      }
      v40 = v64;
      v38 = v62;
    }
    if ((v40 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v56 = 0;
    else
      v56 = v31;
    v18 = v66;
    v39 = v65;
    if (v56 != 1)
      goto LABEL_53;
    v61 = v38;
    v42 = (void *)objc_msgSend(v63, "mutableCopy");
    v85 = *MEMORY[0x1E0CD1C48];
    v86 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEntriesFromDictionary:", v57);

    ((void (**)(id, void *, void *))v15)[2](v15, v23, v42);
LABEL_52:

    v38 = v61;
LABEL_53:

    goto LABEL_54;
  }
  v18 = -[PUReviewAssetsMediaProvider _requestAdjustmentDataForAsset:resultHandler:](self, "_requestAdjustmentDataForAsset:resultHandler:", v16, v15);
LABEL_55:

  return v18;
}

- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 bakeInOrientation:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  double height;
  double width;
  const __CFURL *v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  CGImageSourceRef v16;
  CGImageSource *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  CGImageRef ThumbnailAtIndex;
  CGImage *v28;
  void *v29;
  uint64_t v31;
  _QWORD v32[2];

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = (const __CFURL *)a3;
  v13 = a4;
  v14 = v13;
  if (v13)
  {
    v31 = *MEMORY[0x1E0CBD2A8];
    v32[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = CGImageSourceCreateWithURL(v12, v15);
  if (!v16)
  {
    v29 = 0;
    if (!a7)
      goto LABEL_19;
    goto LABEL_17;
  }
  v17 = v16;
  if (width <= height)
    v18 = height;
  else
    v18 = width;
  v19 = (int)v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CBD2A0]);

  v22 = *MEMORY[0x1E0C9AE50];
  v23 = *MEMORY[0x1E0CBD178];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBD178]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CBD190]);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", *MEMORY[0x1E0CEC570]);

    if (v26)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E59BBE50, *MEMORY[0x1E0CBD1F8]);
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v23);
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, (CFDictionaryRef)v20);
  if (ThumbnailAtIndex)
  {
    v28 = ThumbnailAtIndex;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", ThumbnailAtIndex);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v28);
  }
  else
  {
    v29 = 0;
  }
  CFRelease(v17);

  if (a7)
  {
LABEL_17:
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUReviewAssetsMediaProviderErrorDomain"), -100, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_19:

  return v29;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  void *v21;
  NSObject *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 415, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v13 = (objc_msgSend(v10, "isSynchronous") & 1) != 0 || objc_msgSend(v10, "deliveryMode") == 0;
  v14 = v9;
  v15 = objc_msgSend(v10, "version");
  objc_msgSend(v14, "providedImageURLForImageVersion:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v14, "exifOrientationForImageVersion:", v15);
  v17 = objc_msgSend(v10, "loadingMode");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__PUReviewAssetsMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  v25[3] = &unk_1E58A71E8;
  v27 = v11;
  v28 = v17;
  v29 = v12;
  v30 = v15;
  v26 = v16;
  v18 = v11;
  v19 = v16;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v25);
  v21 = v20;
  if (v13)
  {
    (*((void (**)(dispatch_block_t))v20 + 2))(v20);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v22, v21);

  }
  return v12;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  void *v21;
  NSObject *v22;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  int v28;
  int v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 472, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v13 = (objc_msgSend(v10, "isSynchronous") & 1) != 0 || objc_msgSend(v10, "deliveryMode") == 0;
  v14 = v9;
  v15 = objc_msgSend(v10, "version");
  objc_msgSend(v14, "providedImageURLForImageVersion:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "exifOrientationForImageVersion:", v15);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUReviewAssetsMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E58A7210;
  v28 = v12;
  v29 = v17;
  v26 = v16;
  v27 = v11;
  v18 = v11;
  v19 = v16;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v21 = v20;
  if (v13)
  {
    (*((void (**)(dispatch_block_t))v20 + 2))(v20);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v22, v21);

  }
  return v12;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  NSObject *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 519, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v34 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  v16 = objc_msgSend(v11, "version");

  objc_msgSend(v15, "providedVideoURLForVideoVersion:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D75308];
  objc_msgSend(v15, "assetAdjustments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "videoAdjustmentsFromAssetAdjustmentsIfRecognized:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v18, v21);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v30[3] = &unk_1E58ABAF0;
  v31 = v22;
  v32 = v14;
  v33 = v10;
  v23 = v10;
  v24 = v14;
  v25 = v22;
  v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v30);
  dispatch_get_global_queue(21, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v27, v26);

  return v12;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  NSObject *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 561, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v34 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  v16 = objc_msgSend(v11, "version");

  objc_msgSend(v15, "providedVideoURLForVideoVersion:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D75308];
  objc_msgSend(v15, "assetAdjustments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "videoAdjustmentsFromAssetAdjustmentsIfRecognized:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v18, v21);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
  v30[3] = &unk_1E58ABAF0;
  v31 = v22;
  v32 = v14;
  v33 = v10;
  v23 = v10;
  v24 = v14;
  v25 = v22;
  v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v30);
  dispatch_get_global_queue(21, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v27, v26);

  return v12;
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  void (**v10)(id, void *, void *);
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, void *))a5;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 599, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v20 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  v16 = objc_msgSend(v11, "version");

  objc_msgSend(v15, "providedVideoURLForVideoVersion:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v10[2](v10, v17, v14);

  return v12;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  int v36;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  v16 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 618, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v17 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v18 = v14;
  objc_msgSend(v18, "providedPreviewImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "providedImageURLForImageVersion:", objc_msgSend(v16, "version"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v16, "version");

  objc_msgSend(v18, "providedVideoURLForImageVersion:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v23;
  if (v20)
    objc_msgSend(v23, "addObject:", v20);
  if (v22)
    objc_msgSend(v24, "addObject:", v22);
  -[PUReviewAssetsMediaProvider _mediaRequests](self, "_mediaRequests");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CD1608];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __101__PUReviewAssetsMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v33[3] = &unk_1E58A7260;
  v36 = v17;
  v34 = v25;
  v35 = v15;
  v27 = v15;
  v28 = v25;
  v29 = -[PUReviewAssetLivePhotoMediaRequest initLivePhotoRequestID:]([PUReviewAssetLivePhotoMediaRequest alloc], "initLivePhotoRequestID:", objc_msgSend(v26, "requestLivePhotoWithResourceFileURLs:placeholderImage:targetSize:contentMode:resultHandler:", v24, v19, a5, v33, width, height));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v29, v30);

  return v17;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  PUReviewAssetAnimatedImageMediaRequest *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsMediaProvider.m"), 666, CFSTR("PUReviewAssetsMediaProvider only accepts PUReviewAssets"));

  }
  v12 = -[PUReviewAssetsMediaProvider _incrementRequestIdentifier](self, "_incrementRequestIdentifier");
  v32 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  objc_msgSend(v15, "providedImageURLForImageVersion:", objc_msgSend(v10, "version"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsMediaProvider _mediaRequests](self, "_mediaRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v10;
  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CD1388]);
    objc_msgSend(v18, "setAllowPreCaching:", 0);
  }
  objc_msgSend(v18, "setUseSharedImageDecoding:", 0);
  v19 = (void *)MEMORY[0x1E0CD1380];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__PUReviewAssetsMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v27[3] = &unk_1E58A7288;
  v31 = v12;
  v29 = v14;
  v30 = v11;
  v28 = v17;
  v20 = v14;
  v21 = v11;
  v22 = v17;
  v23 = -[PUReviewAssetAnimatedImageMediaRequest initWithAnimatedImageRequestID:]([PUReviewAssetAnimatedImageMediaRequest alloc], "initWithAnimatedImageRequestID:", objc_msgSend(v19, "requestAnimatedImageWithURL:completion:", v16, v27));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v23, v24);

  return v12;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[PUReviewAssetsMediaProvider _mediaRequests](self, "_mediaRequests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "cancelRequest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v6);

  }
}

- (double)_screenScale
{
  return self->__screenScale;
}

- (PHConcurrentMapTable)_mediaRequests
{
  return self->__mediaRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mediaRequests, 0);
}

void __82__PUReviewAssetsMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, *(_QWORD *)(a1 + 40));

}

void __101__PUReviewAssetsMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = *MEMORY[0x1E0CD1C68];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(unsigned int *)(a1 + 48);
  v8 = a3;
  objc_msgSend(v6, "numberWithInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1CA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CD1BE8];
  objc_msgSend(v11, "setValue:forKey:", v12, *MEMORY[0x1E0CD1BE8]);

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1CB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0CD1C48];
  objc_msgSend(v11, "setValue:forKey:", v14, *MEMORY[0x1E0CD1C48]);

  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_5;
    objc_msgSend(v11, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_6;
  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v18);
LABEL_5:

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
  v3[3] = &unk_1E58A7238;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestAVAssetWithResultHandler:", v3);

}

void __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a5;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v10 = *MEMORY[0x1E0CD1BE8];
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
    v8 = 0;
  }

}

void __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
  v3[3] = &unk_1E58A7238;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestAVAssetWithResultHandler:", v3);

}

void __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = a5;
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    v13 = *MEMORY[0x1E0CD1BE8];
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAudioMix:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __77__PUReviewAssetsMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, *MEMORY[0x1E0CD1C68], 0);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v11, "setObject:forKey:", v4, *MEMORY[0x1E0CD1C18]);
    v5 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(*(id *)(a1 + 32), "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeWithFilenameExtension:conformingToType:", v6, *MEMORY[0x1E0CEC520]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v8, *MEMORY[0x1E0CD1C20]);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromExifOrientation());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, *MEMORY[0x1E0CD1C08]);

  }
  v10 = (void *)objc_msgSend(v11, "copy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__PUReviewAssetsMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 0, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (v4)
  {
    v19[0] = *MEMORY[0x1E0CD1C68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = *MEMORY[0x1E0CD1BE8];
    v20[0] = v5;
    v20[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E0CD1C68], 0);

    if (*(_QWORD *)(a1 + 48) == 0x10000)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        objc_msgSend(v5, "setObject:forKey:", v9, *MEMORY[0x1E0CD1C18]);
    }
    v6 = objc_msgSend(v5, "copy");
  }
  v10 = (void *)v6;

  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v11, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typeWithFilenameExtension:conformingToType:", v13, *MEMORY[0x1E0CEC520]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = PLImageOrientationFromExifOrientation();
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, uint64_t, void *))(v16 + 16))(v16, v3, v17, v15, v10);

}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    block[3] = &unk_1E58ABAF0;
    v19 = *(id *)(a1 + 40);
    v17 = v7;
    v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v9 = v19;
LABEL_7:

    goto LABEL_8;
  }
  if ((a3 & 1) == 0)
  {
    v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    if (v8)
    {
      v20 = *MEMORY[0x1E0CD1BE8];
      v21[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v11);

    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
    v13[3] = &unk_1E58AB968;
    v12 = *(id *)(a1 + 40);
    v14 = v10;
    v15 = v12;
    v9 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

    goto LABEL_7;
  }
LABEL_8:

}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = 0;
  v8 = a2;
  if (!v8 && (a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUReviewAssetsMediaProviderErrorDomain"), -99, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  CGImage *v11;
  id v12;
  void *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  id v18;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v2, "_resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:", v3, v4, 1, &v18, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_3:

    return;
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithContentsOfFile:", v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    if (*(_BYTE *)(a1 + 89))
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAppliesPreferredTrackTransform:", 1);
      v17 = 0;
      v15 = *MEMORY[0x1E0CA2E68];
      v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v11 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v6, &v15, 0, &v17);
      v12 = v17;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        CGImageRelease(v11);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }

      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUReviewAssetsMediaProviderErrorDomain"), -102, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v10();

}

uint64_t __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

@end
