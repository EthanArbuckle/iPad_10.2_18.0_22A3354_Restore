@implementation PLPlaceholderThumbnailManager

- (PLPlaceholderThumbnailManager)init
{
  PLPlaceholderThumbnailManager *v2;
  NSCache *v3;
  NSCache *placeholderDataCache;
  NSCache *v5;
  NSCache *placeholderImageCache;
  dispatch_queue_t v7;
  OS_dispatch_queue *isolation;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLPlaceholderThumbnailManager;
  v2 = -[PLPlaceholderThumbnailManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    placeholderDataCache = v2->_placeholderDataCache;
    v2->_placeholderDataCache = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    placeholderImageCache = v2->_placeholderImageCache;
    v2->_placeholderImageCache = v5;

    v7 = dispatch_queue_create("PLPlaceholderThumbnailManager", 0);
    isolation = v2->_isolation;
    v2->_isolation = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)_cacheKeyForFormat:(id)a3 photoImageSize:(CGSize)a4 photoImageColor:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  int v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "isCropped");
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v10)
  {
    v12 = objc_msgSend(v9, "formatID");

    v13 = objc_msgSend(v8, "hash");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%d~%lu"), v12, v13, v17);
  }
  else
  {
    v14 = objc_msgSend(v9, "formatID");

    v15 = objc_msgSend(v8, "hash");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%d~%lu_%.4f"), v14, v15, width / height);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10
{
  void *v10;
  void *v11;
  id v12;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isThumbnail"))
  {
    DCIM_resolvedPlaceholderImageColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__96015;
    v20 = __Block_byref_object_dispose__96016;
    v21 = 0;
    v14 = v10;
    v15 = v11;
    pl_dispatch_sync();
    v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)newPlaceholderImageForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v9;
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  height = a4.height;
  width = a4.width;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__96015;
  v18 = __Block_byref_object_dispose__96016;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(v6, "size");
  DCIM_resolvedPlaceholderImageColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = v9;
  pl_dispatch_sync();
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (id)_placeholderImageWithColor:(id)a3
{
  return (id)DCIM_imageWithColor();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_placeholderImageCache, 0);
  objc_storeStrong((id *)&self->_placeholderDataCache, 0);
}

void __77__PLPlaceholderThumbnailManager_newPlaceholderImageForFormat_photoImageSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  CGImage *v20;
  CGImage *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  CGRect v27;

  if (objc_msgSend(*(id *)(a1 + 32), "isThumbnail"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cacheKeyForFormat:photoImageSize:photoImageColor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v26);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = v26;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
LABEL_34:

      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "_placeholderImageWithColor:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DCIM_sizeFromPLImage();
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "size");
    v13 = v12 <= 0.0;
    if (v11 <= 0.0)
      v13 = 1;
    if (v12 > v10)
      v13 = 1;
    if (v11 > v8)
      v13 = 1;
    if (v13)
      v14 = v10;
    else
      v14 = v12;
    if (v13)
      v15 = v8;
    else
      v15 = v11;
    v16 = *(double *)(a1 + 64) / *(double *)(a1 + 72);
    v18 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = objc_msgSend(*(id *)(a1 + 32), "isCropped");
    if (v16 >= 1.0)
    {
      if (!v19)
      {
        if (v15 >= *(double *)(a1 + 64))
          v15 = *(double *)(a1 + 64);
        v14 = round(v15 / v16);
        goto LABEL_31;
      }
      if (v14 >= *(double *)(a1 + 72))
        v14 = *(double *)(a1 + 72);
    }
    else
    {
      if (!v19)
      {
        if (v14 >= *(double *)(a1 + 72))
          v14 = *(double *)(a1 + 72);
        v15 = round(v16 * v14);
        goto LABEL_31;
      }
      if (v15 >= *(double *)(a1 + 64))
        v14 = *(double *)(a1 + 64);
      else
        v14 = v15;
    }
    v17 = 0.0;
    v15 = v14;
    v18 = 0.0;
LABEL_31:
    v20 = (CGImage *)DCIM_CGImageRefFromPLImage();
    v27.origin.x = v18;
    v27.origin.y = v17;
    v27.size.width = v15;
    v27.size.height = v14;
    v21 = CGImageCreateWithImageInRect(v20, v27);
    DCIM_scaleFromMainScreen();
    v22 = DCIM_newPLImageWithCGImage();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    CGImageRelease(v21);
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v25)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v25, v26);

    v5 = v26;
    goto LABEL_34;
  }
}

void __135__PLPlaceholderThumbnailManager_placeholderDataForFormat_photoImageSize_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v10;
  id v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  int v16;
  int v17;
  int height;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  _DWORD *v23;
  _DWORD *v24;
  unsigned int *v25;
  _DWORD *v26;
  int *v27;
  int *v28;
  _PLPlaceholderThumbnailCachedData *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t Width;
  CGFloat v34;
  uint64_t v35;
  _PLPlaceholderThumbnailCachedData *v36;
  uint64_t v37;
  id v38;
  id v39;
  unsigned int v40;
  CGRect v41;

  objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForFormat:photoImageSize:photoImageColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "imageDataWithWidth:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_placeholderImageWithColor:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "thumbnailSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v41.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v41.size = v10;
    v40 = 0;
    v39 = 0;
    +[PLThumbnailUtilities performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:](PLThumbnailUtilities, "performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:", DCIM_CGImageRefFromPLImage(), v9, &v39, &v41, &v40);
    v11 = v39;
    v12 = v39;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v14 = (int)v13;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v16 = (int)v15;
    v17 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "isCropped") & 1) == 0)
    {
      height = (int)v41.size.height;
      v19 = v14 - (int)v41.size.width;
      if ((int)v14 < (int)v41.size.width)
        ++v19;
      v20 = v19 & 0xFFFFFFFE;
      if ((int)v14 > (int)v41.size.width)
        v17 = v20;
      else
        v17 = 0;
      if (height < v16)
      {
        v21 = v16 - height;
        if (v21 + 1 >= 0)
          v22 = v21 + 1;
        else
          v22 = v21 + 2;
        v17 = v40 * (v22 >> 1);
      }
    }
    v23 = *(_DWORD **)(a1 + 80);
    if (v23)
      *v23 = (int)v41.size.width;
    v24 = *(_DWORD **)(a1 + 88);
    if (v24)
      *v24 = (int)v41.size.height;
    v25 = *(unsigned int **)(a1 + 96);
    if (v25)
      *v25 = v40;
    v26 = *(_DWORD **)(a1 + 120);
    if (v26)
      *v26 = v14;
    v27 = *(int **)(a1 + 104);
    if (v27)
      *v27 = v16;
    v28 = *(int **)(a1 + 112);
    if (v28)
      *v28 = v17;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length"))
    {
      v29 = [_PLPlaceholderThumbnailCachedData alloc];
      HIDWORD(v37) = v16;
      v30 = v9;
      v31 = v8;
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v38 = v12;
      Width = (int)CGRectGetWidth(v41);
      v34 = CGRectGetHeight(v41);
      LODWORD(v37) = v17;
      v35 = v32;
      v8 = v31;
      v9 = v30;
      v36 = -[_PLPlaceholderThumbnailCachedData initWithImageData:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:](v29, "initWithImageData:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v35, Width, (int)v34, v40, v14, HIDWORD(v37), v37);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v36, v2);

      v12 = v38;
    }

  }
}

+ (id)sharedManager
{
  pl_dispatch_once();
  return (id)sharedManager_sharedManager;
}

void __46__PLPlaceholderThumbnailManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

@end
