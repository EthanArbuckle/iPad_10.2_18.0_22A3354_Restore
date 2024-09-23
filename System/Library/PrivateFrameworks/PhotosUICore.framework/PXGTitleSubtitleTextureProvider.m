@implementation PXGTitleSubtitleTextureProvider

void __104__PXGTitleSubtitleTextureProvider__drawWithTitle_subtitle_spec_targetSize_context_viewport_screenScale___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRendersAsynchronously:", 0);
  objc_msgSend(v3, "setTypesettingMode:", 1);
  objc_msgSend(v3, "setTitleText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setSubtitleText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setSpec:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  char v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(double *)(a1 + 96);
  v6 = *(unsigned int *)(a1 + 112);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
  v10[3] = &unk_1E5118030;
  v7 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v15 = *(_BYTE *)(a1 + 120);
  v14 = *(_DWORD *)(a1 + 116);
  v9 = *(_QWORD *)(a1 + 104);
  v12 = v8;
  v13 = v9;
  objc_msgSend(WeakRetained, "_requestTextureForTitle:subtitle:spec:targetSize:screenScale:requestID:renderCompletionHandler:", v3, v4, v7, v6, v10, *(double *)(a1 + 80), *(double *)(a1 + 88), v5);

}

- (void)_requestTextureForTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 requestID:(int)a8 renderCompletionHandler:(id)a9
{
  uint64_t v10;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  int v34;
  char v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42[4];
  id location;
  _QWORD v44[6];

  v10 = *(_QWORD *)&a8;
  height = a6.height;
  width = a6.width;
  v44[4] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v10))
  {
    if (PXPixelSizeAreaIsZero())
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v10);
    }
    else
    {
      v30 = objc_alloc((Class)off_1E50B5CD8);
      v21 = (uint64_t)v17;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v21;
      v44[0] = v21;
      v22 = (uint64_t)v18;
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v28 = (void *)v22;
      v44[1] = v22;
      v23 = v19;
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null", v22, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v44[2] = v23;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "initWithObjects:", v25);

      if (!v19)
      if (!v18)

      if (!v17)
      objc_initWeak(&location, self);
      v26 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke;
      v36[3] = &unk_1E51180A8;
      v42[1] = *(id *)&width;
      v42[2] = *(id *)&height;
      v37 = v17;
      v38 = v18;
      v39 = v19;
      v42[3] = *(id *)&a7;
      objc_copyWeak(v42, &location);
      v27 = v31;
      v40 = v27;
      v41 = v20;
      v32[0] = v26;
      v32[1] = 3221225472;
      v32[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_3;
      v32[3] = &unk_1E51180D0;
      v32[4] = self;
      v35 = 0;
      v34 = v10;
      v33 = v41;
      -[PXGCGImageTextureProvider requestCGImageAndAdditionalInfoWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageAndAdditionalInfoWithCacheKey:imageProvider:resultHandler:", v27, v36, v32);

      objc_destroyWeak(v42);
      objc_destroyWeak(&location);

    }
  }

}

void __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_4(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  char v7;
  __int16 v8;
  char v9;
  int v10;
  char v11;
  _BYTE v12[7];

  v9 = 0;
  v8 = 0;
  memset(v12, 0, sizeof(v12));
  v2 = *(_BYTE *)(a1 + 52);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned int *)(a1 + 48);
  v6 = *(_OWORD *)off_1E50B83E0;
  v7 = v2;
  v10 = 1065353216;
  v11 = 0;
  objc_msgSend(v3, "provideCGImage:options:forRequestID:", v4, &v6, v5);
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

void __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_3(uint64_t a1, CGImage *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD block[6];
  int v10;
  char v11;

  v5 = a3;
  CGImageRetain(a2);
  objc_msgSend(*(id *)(a1 + 32), "requestQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_4;
  block[3] = &unk_1E5128720;
  v11 = *(_BYTE *)(a1 + 52);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  v10 = *(_DWORD *)(a1 + 48);
  dispatch_async(v6, block);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXGTitleSubtitleTextureProviderLastBaselineKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "doubleValue");
  (*(void (**)(uint64_t))(v8 + 16))(v8);

}

uint64_t __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5118080;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 96);
  objc_copyWeak(&v10, (id *)(a1 + 72));
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v2 = MEMORY[0x1A85CCE98](0, 0, v4, *(double *)(a1 + 80), *(double *)(a1 + 88));

  objc_destroyWeak(&v10);
  return v2;
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  uint64_t length;
  id v13;
  id v14;
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  float32x2_t v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  char v34;
  uint64_t v35;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  float64x2_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  char v50;
  id location;
  objc_super v52;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v52.receiver = self;
  v52.super_class = (Class)PXGTitleSubtitleTextureProvider;
  v36 = a6;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v52, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v32 = v15;
  v33 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v18 = v17;
  v19 = objc_opt_respondsToSelector();
  v37 = v13;
  v35 = objc_msgSend(v13, "version");
  if (length)
  {
    v34 = v19 & 1;
    v20 = v33;
    do
    {
      objc_msgSend(v16, "titleForSpriteAtIndex:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subtitleForSpriteAtIndex:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "titleSubtitleSpecForSpriteAtIndex:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (float32x2_t)*(&v36->var3 + 5 * v10.location);
      objc_initWeak(&location, self);
      -[PXGTitleSubtitleTextureProvider workQueue](self, "workQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5118058;
      objc_copyWeak(&v44, &location);
      v39 = v21;
      v40 = v22;
      v41 = v23;
      v45 = vcvtq_f64_f32(v24);
      v46 = v18;
      v48 = v20;
      v42 = v37;
      v26 = v16;
      v50 = v34;
      v49 = v10.location;
      v43 = v26;
      v47 = v35;
      v27 = v23;
      v28 = v22;
      v29 = v21;
      dispatch_async(v25, block);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      ++v20;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v31 = v32;
  v30 = v33;
  result.length = v31;
  result.location = v30;
  return result;
}

uint64_t __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[PXGTitleSubtitleTextureProvider _drawWithTitle:subtitle:spec:targetSize:context:viewport:screenScale:](PXGTitleSubtitleTextureProvider, "_drawWithTitle:subtitle:spec:targetSize:context:viewport:screenScale:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(double *)(a1 + 80), *(double *)(a1 + 88), a3, a4, a5, a6, *(double *)(a1 + 96));
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v13 = CFSTR("PXGTitleSubtitleTextureProviderLastBaselineKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cacheAdditionalInfo:withKey:", v11, *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 64) + 16))(v8);
}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1, double a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  int v12;
  char v13;

  objc_msgSend(*(id *)(a1 + 32), "layoutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3;
  block[3] = &unk_1E5118008;
  v8 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 60);
  v12 = *(_DWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = a2;
  dispatch_async(v4, block);

}

+ (double)_drawWithTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  PXTitleSubtitleCALayerPromise *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  CGAffineTransform v50;
  CGRect v51;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v15 = a6.height;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  UIGraphicsPushContext(a7);
  CGContextTranslateCTM(a7, 0.0, v15);
  CGContextScaleCTM(a7, 1.0, -1.0);
  if (PXGShouldDisplayTextTextureBoundaries())
  {
    CGContextSetRGBFillColor(a7, 1.0, 0.5, 1.0, 0.5);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    CGContextFillRect(a7, v51);
  }
  CGContextScaleCTM(a7, a9, a9);
  PXRectScale();
  objc_msgSend(v20, "padding");
  v22 = v21;
  v24 = v23;
  PXEdgeInsetsInsetRect();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  CGContextGetCTM(&v50, a7);
  if (v50.d >= 0.0)
    v33 = v28 - (v22 - v24);
  else
    v33 = -v28;
  v34 = objc_alloc_init(PXTitleSubtitleCALayerPromise);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __104__PXGTitleSubtitleTextureProvider__drawWithTitle_subtitle_spec_targetSize_context_viewport_screenScale___block_invoke;
  v42[3] = &unk_1E51180F8;
  v43 = v18;
  v44 = v19;
  v45 = v20;
  v46 = v26;
  v47 = v33;
  v48 = v30;
  v49 = v32;
  v35 = v20;
  v36 = v19;
  v37 = v18;
  -[PXTitleSubtitleCALayerPromise performChanges:](v34, "performChanges:", v42);
  -[PXCALayerPromise startLayerRealization](v34, "startLayerRealization");
  -[PXCALayerPromise layer](v34, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "drawInContext:", a7);

  UIGraphicsPopContext();
  -[PXTitleSubtitleCALayerPromise layerLastBaseline](v34, "layerLastBaseline");
  v40 = v39;

  return v40;
}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "contentSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == *(void **)(a1 + 40) && *(_BYTE *)(a1 + 68))
  {

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "contentSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "didRenderTitleAndSubtitleSpriteAtIndex:layoutVersion:withLastBaseline:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

@end
