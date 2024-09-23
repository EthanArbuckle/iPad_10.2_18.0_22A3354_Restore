@implementation PXStoryBaseDisplayAssetCroppingContext

- (PXStoryBaseDisplayAssetCroppingContext)init
{
  PXStoryBaseDisplayAssetCroppingContext *v2;
  const char *v3;
  objc_class *v4;
  id v5;
  os_log_t v6;
  OS_os_log *log;
  PHFetchOptions *v8;
  PHFetchOptions *fetchOptions;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PXStoryBaseDisplayAssetCroppingContext;
  v2 = -[PXStoryBaseDisplayAssetCroppingContext init](&v14, sel_init);
  if (v2)
  {
    v3 = (const char *)*MEMORY[0x1E0D744D8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = os_log_create(v3, (const char *)objc_msgSend(v5, "UTF8String"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    v8 = (PHFetchOptions *)objc_alloc_init(MEMORY[0x1E0CD1570]);
    fetchOptions = v2->_fetchOptions;
    v2->_fetchOptions = v8;

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("size"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("quality"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setSortDescriptors:](v2->_fetchOptions, "setSortDescriptors:", v12);

  }
  return v2;
}

- (id)orderedFacesForAsset:(id)a3 featuredFaceCount:(int64_t *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CD1528];
  v7 = a3;
  -[PXStoryBaseDisplayAssetCroppingContext fetchOptions](self, "fetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchFacesInAsset:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryBaseDisplayAssetCroppingContext adjustOrderedFaces:featuredFaceCount:](self, "adjustOrderedFaces:featuredFaceCount:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4
{
  return a3;
}

- (void)requestIndividualFaceRectsInAsset:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, os_signpost_id_t *, _QWORD, void *);
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  os_signpost_id_t *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  os_signpost_id_t v33[2];
  uint8_t v34[16];
  uint8_t buf[16];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, os_signpost_id_t *, _QWORD, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXStoryBaseDisplayAssetCroppingContext log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, self);
    v11 = v9;
    v12 = v11;
    v13 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      objc_msgSend(v7, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StoryIndividualFaceRectsRequest", "uuid=%{signpost.description:attribute}@", buf, 0xCu);

    }
    v33[0] = v10;

    *(_QWORD *)buf = 0;
    -[PXStoryBaseDisplayAssetCroppingContext orderedFacesForAsset:featuredFaceCount:](self, "orderedFacesForAsset:featuredFaceCount:", v7, buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v33[1] = (os_signpost_id_t)v33;
    v17 = MEMORY[0x1E0C80A78](v16);
    v19 = &v33[-4 * v18];
    if (v18 >= 1)
    {
      v20 = 0;
      v21 = v19 + 2;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v20, v17, v33[0]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerX");
        objc_msgSend(v22, "centerY");
        objc_msgSend(v22, "size");
        v24 = v23;
        objc_msgSend(v22, "size");
        objc_msgSend(v22, "px_faceTileSizeAdjustingForImageAspectRatio:", v24, v25);
        PXRectWithCenterAndSize();
        *(v21 - 2) = v26;
        *(v21 - 1) = v27;
        *v21 = v28;
        v21[1] = v29;
        v21 += 4;

        ++v20;
      }
      while (v16 != v20);
    }
    v30 = v12;
    v31 = v30;
    if (v13 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v31, OS_SIGNPOST_INTERVAL_END, v33[0], "StoryIndividualFaceRectsRequest", ", v34, 2u);
    }

    v8[2](v8, v16, v19, *(_QWORD *)buf, v15);
  }
  else
  {
    v32 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)buf = *MEMORY[0x1E0C9D628];
    v36 = v32;
    v8[2](v8, 0, (os_signpost_id_t *)buf, 0, 0);
  }

}

- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;

  MEMORY[0x1A85CD660](self, a2, a3);
  PXSizeValueForAxis();
  v6 = floor(1.0 / v5);
  +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumNumberOfParts");

  v9 = (double)v8;
  if (v6 < (double)v8)
    v9 = v6;
  v10 = (uint64_t)v9;
  if ((uint64_t)v9 < 1)
  {
    v14 = 0;
  }
  else
  {
    v16 = *(_OWORD *)off_1E50B86D0;
    v17 = *((_OWORD *)off_1E50B86D0 + 1);
    PXSizeSetValueForAxis();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10, v16, v17);
    v12 = 0;
    do
    {
      PXRectGetLengthForAxis();
      PXPointSetValueForAxis();
      PXRectWithAspectRatioFittingRect();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      ++v12;
    }
    while (v10 != v12);
    v14 = (void *)objc_msgSend(v11, "copy");

  }
  return v14;
}

- (OS_os_log)log
{
  return self->_log;
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
