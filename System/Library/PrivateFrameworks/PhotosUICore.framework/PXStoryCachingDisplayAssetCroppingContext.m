@implementation PXStoryCachingDisplayAssetCroppingContext

- (PXStoryCachingDisplayAssetCroppingContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryCachingDisplayAssetCroppingContext.m"), 33, CFSTR("%s is not available as initializer"), "-[PXStoryCachingDisplayAssetCroppingContext init]");

  abort();
}

- (PXStoryCachingDisplayAssetCroppingContext)initWithCroppingContext:(id)a3
{
  id v5;
  PXStoryCachingDisplayAssetCroppingContext *v6;
  PXStoryCachingDisplayAssetCroppingContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryCachingDisplayAssetCroppingContext;
  v6 = -[PXStoryCachingDisplayAssetCroppingContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_croppingContext, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_cachedNormalizedFaceRects);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryCachingDisplayAssetCroppingContext;
  -[PXStoryCachingDisplayAssetCroppingContext dealloc](&v3, sel_dealloc);
}

- (void)requestIndividualFaceRectsInAsset:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v9;
  void (**v10)(id, int64_t, CGRect *, int64_t, _QWORD);
  NSObject *v11;
  PXStoryCachingDisplayAssetCroppingContext *v12;
  PXStoryDisplayAssetCroppingContext *croppingContext;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, int64_t, CGRect *, int64_t, _QWORD))a5;
  if ((a4 & 1) != 0)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      v19 = 2048;
      v20 = a4;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "%@ doesn't support options %li", buf, 0x16u);

    }
  }
  v12 = self;
  objc_sync_enter(v12);
  if (-[PXDisplayAsset isContentEqualTo:](v12->_cachedAsset, "isContentEqualTo:", v9) != 2 || v12->_cachedOptions != a4)
  {
    objc_storeStrong((id *)&v12->_cachedAsset, a3);
    v12->_cachedOptions = a4;
    v12->_cachedFaceCount = 0;
    croppingContext = v12->_croppingContext;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __101__PXStoryCachingDisplayAssetCroppingContext_requestIndividualFaceRectsInAsset_options_resultHandler___block_invoke;
    v16[3] = &unk_1E5121300;
    v16[4] = v12;
    -[PXStoryDisplayAssetCroppingContext requestIndividualFaceRectsInAsset:options:resultHandler:](croppingContext, "requestIndividualFaceRectsInAsset:options:resultHandler:", v9, a4, v16);
  }
  v10[2](v10, v12->_cachedFaceCount, v12->_cachedNormalizedFaceRects, v12->_cachedFeaturedFaceCount, 0);
  objc_sync_exit(v12);

}

- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5
{
  id v9;
  PXStoryCachingDisplayAssetCroppingContext *v10;
  uint64_t v11;
  NSArray *cachedPanoramaCropContentRects;
  NSArray *v13;

  v9 = a3;
  v10 = self;
  objc_sync_enter(v10);
  if (-[PXDisplayAsset isContentEqualTo:](v10->_cachedPanoramaAsset, "isContentEqualTo:", v9)
    || v10->_cachedPanoramaAxis != a4
    || v10->_cachedPanoramaCropContentsRectsApectRatio != a5)
  {
    objc_storeStrong((id *)&v10->_cachedPanoramaAsset, a3);
    v10->_cachedPanoramaAxis = a4;
    v10->_cachedPanoramaCropContentsRectsApectRatio = a5;
    -[PXStoryDisplayAssetCroppingContext cropContentRectsForMultipartPanoramaAsset:axis:cropContentsRectsApectRatio:](v10->_croppingContext, "cropContentRectsForMultipartPanoramaAsset:axis:cropContentsRectsApectRatio:", v9, a4, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    cachedPanoramaCropContentRects = v10->_cachedPanoramaCropContentRects;
    v10->_cachedPanoramaCropContentRects = (NSArray *)v11;

  }
  v13 = v10->_cachedPanoramaCropContentRects;
  objc_sync_exit(v10);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPanoramaCropContentRects, 0);
  objc_storeStrong((id *)&self->_cachedPanoramaAsset, 0);
  objc_storeStrong((id *)&self->_cachedAsset, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
}

__n128 __101__PXStoryCachingDisplayAssetCroppingContext_requestIndividualFaceRectsInAsset_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = a4;
  if (a2 >= 1)
  {
    v5 = a2;
    _PXGArrayResize();
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + v7;
      result = *(__n128 *)(a3 + v7);
      v10 = *(_OWORD *)(a3 + v7 + 16);
      *(__n128 *)v8 = result;
      *(_OWORD *)(v8 + 16) = v10;
      v7 += 32;
      --v5;
    }
    while (v5);
  }
  return result;
}

@end
