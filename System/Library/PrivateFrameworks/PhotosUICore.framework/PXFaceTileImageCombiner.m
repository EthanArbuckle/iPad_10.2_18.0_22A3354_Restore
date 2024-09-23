@implementation PXFaceTileImageCombiner

- (void)requestCombinedImageForItems:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30[3];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 78, CFSTR("%s must be called on the main thread"), "-[PXFaceTileImageCombiner requestCombinedImageForItems:context:resultHandler:]");

  }
  v12 = (void *)objc_msgSend(v9, "count");
  if (v12)
  {
    if (v10)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v11)
      goto LABEL_6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfItems > 0"));

  if (!v10)
    goto LABEL_10;
LABEL_5:
  if (v11)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

LABEL_6:
  v13 = (void *)(self->_currentGeneration + 1);
  self->_currentGeneration = (unint64_t)v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v14;
    v33 = 2048;
    v34 = v12;
    v35 = 2048;
    v36 = v13;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "%@ Requested a combined image for:%lu, generation:%lu", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v16 = _serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke;
  block[3] = &unk_1E5130A80;
  v26 = v10;
  v27 = v9;
  v30[1] = v12;
  v30[2] = v13;
  v28 = v14;
  v17 = v14;
  v18 = v9;
  v19 = v10;
  objc_copyWeak(v30, (id *)buf);
  v29 = v11;
  v20 = v11;
  dispatch_async(v16, block);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
}

- (void)_returnCombinedImage:(id)a3 generation:(unint64_t)a4 resultHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  unint64_t currentGeneration;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  PXFaceTileImageCombiner *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  currentGeneration = self->_currentGeneration;
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (currentGeneration == a4)
  {
    if (v12)
    {
      v15 = 138412802;
      v16 = (id)objc_opt_class();
      v17 = 2048;
      v18 = self;
      v19 = 2048;
      v20 = a4;
      v13 = v16;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "<%@:%p> Returning a combined image for generation:%lu", (uint8_t *)&v15, 0x20u);

    }
    v9[2](v9, v8);
  }
  else
  {
    if (v12)
    {
      v15 = 138412802;
      v16 = (id)objc_opt_class();
      v17 = 2048;
      v18 = self;
      v19 = 2048;
      v20 = a4;
      v14 = v16;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "<%@:%p> Dropping request for out of date generation:%lu", (uint8_t *)&v15, 0x20u);

    }
  }

}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[5];
  char v18;

  objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCount:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "imageSize");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isRTL");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2;
  v12[3] = &unk_1E5130A58;
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(void **)(a1 + 80);
  v13 = v9;
  v17[1] = v10;
  v17[2] = v4;
  v17[3] = v4;
  v17[4] = v6;
  v18 = v7;
  v11 = v2;
  v14 = v11;
  v15 = *(id *)(a1 + 32);
  objc_copyWeak(v17, (id *)(a1 + 64));
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  objc_destroyWeak(v17);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[3];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%@ Request image for item:%@, generation:%lu", buf, 0x20u);
  }

  v9 = *(double *)(a1 + 96);
  v10 = *(_BYTE *)(a1 + 104) != 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_73;
  v13[3] = &unk_1E5130A30;
  v14 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = *(void **)(a1 + 72);
  v15 = v11;
  v19[1] = v12;
  v16 = *(id *)(a1 + 40);
  v19[2] = a3;
  v17 = *(id *)(a1 + 48);
  objc_copyWeak(v19, (id *)(a1 + 64));
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v11, "px_requestImageWithTargetSize:displayScale:isRTL:resultHandler:", v10, v13, *(double *)(a1 + 80), *(double *)(a1 + 88), v9);

  objc_destroyWeak(v19);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[3];

  v5 = a2;
  v6 = a3;
  v7 = _serialQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2_74;
  v15[3] = &unk_1E51429E0;
  v16 = v5;
  v17 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(void **)(a1 + 80);
  v18 = v8;
  v23[1] = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(void **)(a1 + 88);
  v19 = v10;
  v23[2] = v11;
  v20 = *(id *)(a1 + 56);
  v12 = v5;
  objc_copyWeak(v23, (id *)(a1 + 72));
  v13 = *(id *)(a1 + 64);
  v21 = v6;
  v22 = v13;
  v14 = v6;
  dispatch_async(v7, v15);

  objc_destroyWeak(v23);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2_74(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 138412802;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      v26 = 2048;
      v27 = v7;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%@ Received image for item:%@, generation:%lu", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 56), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32));
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%@ Generating a combined image for generation:%lu", buf, 0x16u);
    }

    +[PXFaceTileImageCombiner _generateCombinedImageFromImages:context:](PXFaceTileImageCombiner, "_generateCombinedImageFromImages:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_75;
    v18[3] = &unk_1E513C468;
    objc_copyWeak(v21, (id *)(a1 + 88));
    v12 = *(void **)(a1 + 96);
    v19 = v11;
    v21[1] = v12;
    v20 = *(id *)(a1 + 80);
    v13 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v18);

    objc_destroyWeak(v21);
  }
  else
  {
    if (v4)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 96);
      v17 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%@ No image for item:%@, generation:%lu, error:%@", buf, 0x2Au);
    }

  }
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_75(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_returnCombinedImage:generation:resultHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.mobileslideshow.PXFaceTileImageCombiner", v4);
    v3 = (void *)_serialQueue;
    _serialQueue = (uint64_t)v2;

  }
}

+ (id)placeholderImageForNumberOfItems:(unint64_t)a3 context:(id)a4
{
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = a4;
  if ((objc_msgSend(v7, "isMainThread") & 1) != 0)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFaceTileImageCombiner.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfItems > 0"));

    if (v8)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFaceTileImageCombiner.m"), 65, CFSTR("%s must be called on the main thread"), "+[PXFaceTileImageCombiner placeholderImageForNumberOfItems:context:]");

  if (!a3)
    goto LABEL_8;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFaceTileImageCombiner.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_4:
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v18 = (id)objc_opt_class();
    v19 = 2048;
    v20 = a3;
    v10 = v18;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "<%@> Generating a placeholder image for:%lu", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", a3);
  objc_msgSend(a1, "_generateCombinedImageFromImages:context:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_generateCombinedImageFromImages:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  char v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  double v26;
  CGColorSpace *DeviceRGB;
  CGContext *v28;
  id v29;
  uint64_t v30;
  id v31;
  CGImage *Image;
  void *v33;
  void *v35;
  _QWORD v36[4];
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGContext *v42;
  double v43;
  double v44;
  double v45;
  char v46;
  char v47;
  CGRect v48;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFaceTileImageCombiner.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imagesCount > 0"));

  }
  objc_msgSend(v7, "displayScale");
  v11 = v10;
  v12 = objc_msgSend(v7, "isRTL");
  v13 = objc_msgSend(v7, "isAscending");
  objc_msgSend(v7, "imageSize");
  v15 = v14;
  objc_msgSend(v7, "imageOffset");
  v17 = v16;
  objc_msgSend(v7, "backgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "borderColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "borderWidth");
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "isEqual:", v22);

  v24 = v11 * v15;
  v25 = v11 * v21;
  v26 = v11 * (v15 + (double)(unint64_t)(v9 - 1) * v17);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v28 = CGBitmapContextCreate(0, (unint64_t)v26, (unint64_t)v24, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v29 = objc_retainAutorelease(v18);
  CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(v29, "CGColor"));
  v48.origin.x = 0.0;
  v48.origin.y = 0.0;
  v48.size.width = v26;
  v48.size.height = v24;
  CGContextFillRect(v28, v48);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __68__PXFaceTileImageCombiner__generateCombinedImageFromImages_context___block_invoke;
  v36[3] = &unk_1E5130AA8;
  if (v13)
    v30 = 0;
  else
    v30 = 2;
  v46 = v12;
  v38 = v11 * v17;
  v39 = v26;
  v40 = v24;
  v41 = v24;
  v47 = v23;
  v42 = v28;
  v37 = v19;
  v43 = v25;
  v44 = v24 + v25 * -2.0;
  v45 = v44 * 0.5;
  v31 = v19;
  objc_msgSend(v8, "px_enumeratePointersWithOptions:usingBlock:", v30, v36);

  Image = CGBitmapContextCreateImage(v28);
  CGContextRelease(v28);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v33;
}

void __68__PXFaceTileImageCombiner__generateCombinedImageFromImages_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  CGContext *v6;
  id v7;
  CGFloat v8;
  double v9;
  double v10;
  const CGPath *v11;
  CGContext *v12;
  CGImage *v13;
  CGContext *v14;
  id v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v5 = *(double *)(a1 + 40) * (double)a3;
  if (*(_BYTE *)(a1 + 104))
    v5 = *(double *)(a1 + 48) - *(double *)(a1 + 64) - v5;
  v6 = *(CGContext **)(a1 + 72);
  if (*(_BYTE *)(a1 + 105))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v6, (CGColorRef)objc_msgSend(v7, "CGColor"));

    CGContextSetBlendMode(*(CGContextRef *)(a1 + 72), kCGBlendModeDestinationOut);
  }
  else
  {
    CGContextSetFillColorWithColor(v6, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  }
  v17.size.width = *(CGFloat *)(a1 + 64);
  v17.origin.y = 0.0;
  v17.origin.x = v5;
  v17.size.height = v17.size.width;
  CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 72), v17);
  if (*(_BYTE *)(a1 + 105))
    CGContextSetBlendMode(*(CGContextRef *)(a1 + 72), kCGBlendModeNormal);
  v9 = *(double *)(a1 + 80);
  v8 = *(double *)(a1 + 88);
  v10 = v5 + v9;
  v16 = a2;
  if (v16)
  {
    v18.origin.x = v10;
    v18.origin.y = v9;
    v18.size.width = v8;
    v18.size.height = v8;
    v11 = CGPathCreateWithRoundedRect(v18, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 96), 0);
    CGContextAddPath(*(CGContextRef *)(a1 + 72), v11);
    CGContextClip(*(CGContextRef *)(a1 + 72));
    CGContextBeginPath(*(CGContextRef *)(a1 + 72));
    CGPathRelease(v11);
    v12 = *(CGContext **)(a1 + 72);
    v13 = (CGImage *)objc_msgSend(objc_retainAutorelease(v16), "CGImage");
    v19.origin.x = v10;
    v19.origin.y = v9;
    v19.size.width = v8;
    v19.size.height = v8;
    CGContextDrawImage(v12, v19, v13);
    CGContextResetClip(*(CGContextRef *)(a1 + 72));
  }
  else
  {
    v14 = *(CGContext **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0DC3658], "px_assetPlaceholderGray");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v14, (CGColorRef)objc_msgSend(v15, "CGColor"));

    v20.origin.x = v10;
    v20.origin.y = v9;
    v20.size.width = v8;
    v20.size.height = v8;
    CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 72), v20);
  }

}

@end
