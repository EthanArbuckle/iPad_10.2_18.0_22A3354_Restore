@implementation PXGShadowTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  uint64_t length;
  id v13;
  id v14;
  NSUInteger v15;
  void *v16;
  int v17;
  float32x2_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  _QWORD block[4];
  id v31;
  id v32[3];
  float64x2_t v33;
  int v34;
  id location;
  objc_super v36;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v36.receiver = self;
  v36.super_class = (Class)PXGShadowTextureProvider;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v36, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v28 = v15;
  v29 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v17 = v29;
    do
    {
      v18 = (float32x2_t)*(&a6->var3 + 5 * v10.location);
      objc_msgSend(v16, "shadowForSpriteAtIndex:inLayout:", v10, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cornerRadiusForShadowSpriteAtIndex:inLayout:", v10, v13);
      v21 = v20;
      objc_msgSend(v13, "displayScale");
      v23 = v22;
      objc_initWeak(&location, self);
      -[PXGTextureProvider requestQueue](self, "requestQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__PXGShadowTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5131D18;
      objc_copyWeak(v32, &location);
      v31 = v19;
      v32[1] = v21;
      v32[2] = v23;
      v33 = vcvtq_f64_f32(v18);
      v34 = v17;
      v25 = v19;
      dispatch_async(v24, block);

      objc_destroyWeak(v32);
      objc_destroyWeak(&location);
      ++v17;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v27 = v28;
  v26 = v29;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)_requestTextureForShadow:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5 targetSize:(CGSize)a6 requestID:(int)a7
{
  uint64_t v7;
  double height;
  double width;
  id v13;
  int IsZero;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  int v23;
  _QWORD v24[4];
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];

  v7 = *(_QWORD *)&a7;
  height = a6.height;
  width = a6.width;
  v30[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v7))
  {
    IsZero = PXPixelSizeAreaIsZero();
    if (!v13 || IsZero)
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v7);
    }
    else
    {
      v15 = objc_alloc((Class)off_1E50B5CD8);
      v30[0] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v17;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithObjects:", v19);

      v21 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke;
      v24[3] = &unk_1E5131D40;
      v25 = v13;
      v26 = a4;
      v27 = a5;
      v28 = width;
      v29 = height;
      v22[0] = v21;
      v22[1] = 3221225472;
      v22[2] = __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke_2;
      v22[3] = &unk_1E5133FF8;
      v22[4] = self;
      v23 = v7;
      -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v20, v24, v22);

    }
  }

}

uint64_t __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke(uint64_t a1)
{
  return _createResizableShadowImage(*(void **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCGImage:forRequestID:", a2, *(unsigned int *)(a1 + 40));
}

void __94__PXGShadowTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForShadow:cornerRadius:screenScale:targetSize:requestID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

@end
