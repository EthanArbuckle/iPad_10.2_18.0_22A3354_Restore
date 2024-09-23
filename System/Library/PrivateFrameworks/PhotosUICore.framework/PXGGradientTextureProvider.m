@implementation PXGGradientTextureProvider

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
  NSObject *v20;
  id v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  _QWORD block[4];
  id v27;
  id v28;
  float64x2_t v29;
  int v30;
  id location;
  objc_super v32;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXGGradientTextureProvider;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v32, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v24 = v15;
  v25 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v17 = v25;
    do
    {
      v18 = (float32x2_t)*(&a6->var3 + 5 * v10.location);
      objc_msgSend(v16, "gradientForSpriteAtIndex:inLayout:", v10, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      -[PXGTextureProvider requestQueue](self, "requestQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__PXGGradientTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5133F80;
      objc_copyWeak(&v28, &location);
      v27 = v19;
      v29 = vcvtq_f64_f32(v18);
      v30 = v17;
      v21 = v19;
      dispatch_async(v20, block);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      ++v17;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v23 = v24;
  v22 = v25;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)_requestTextureForGradient:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  int v16;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;
  _QWORD v21[3];

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v5))
  {
    if (PXPixelSizeAreaIsZero())
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v5);
    }
    else
    {
      v10 = objc_alloc((Class)off_1E50B5CD8);
      v21[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithObjects:", v12);

      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke;
      v17[3] = &unk_1E5133FD0;
      v18 = v9;
      v19 = width;
      v20 = height;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_3;
      v15[3] = &unk_1E5133FF8;
      v15[4] = self;
      v16 = v5;
      -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v13, v17, v15);

    }
  }

}

uint64_t __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "startingColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (CGColorGetAlpha((CGColorRef)objc_msgSend(v2, "CGColor")) == 1.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "endingColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = CGColorGetAlpha((CGColorRef)objc_msgSend(v3, "CGColor")) == 1.0;

  }
  else
  {
    v4 = 0;
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_2;
  v7[3] = &unk_1E5133FA8;
  v8 = *(id *)(a1 + 32);
  v5 = MEMORY[0x1A85CCE98](v4, 0, v7, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v5;
}

uint64_t __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCGImage:forRequestID:", a2, *(unsigned int *)(a1 + 40));
}

void __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_2(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGColorSpace *DeviceRGB;
  id v13;
  id v14;
  const __CFArray *v15;
  CGGradient *v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat MinY;
  CGFloat MaxY;
  CGFloat MidX;
  CGFloat v22;
  _QWORD v23[3];
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v23[2] = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(*(id *)(a1 + 32), "startingColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23[0] = objc_msgSend(v13, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "endingColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23[1] = objc_msgSend(v14, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v16 = CGGradientCreateWithColors(DeviceRGB, v15, 0);

  v17 = objc_msgSend(*(id *)(a1 + 32), "direction");
  v18 = 0.0;
  MinY = 0.0;
  MaxY = 0.0;
  MidX = 0.0;
  if (!v17)
  {
    v25.origin.x = a3;
    v25.origin.y = a4;
    v25.size.width = a5;
    v25.size.height = a6;
    MidX = CGRectGetMidX(v25);
    v26.origin.x = a3;
    v26.origin.y = a4;
    v26.size.width = a5;
    v26.size.height = a6;
    MaxY = CGRectGetMaxY(v26);
    v27.origin.x = a3;
    v27.origin.y = a4;
    v27.size.width = a5;
    v27.size.height = a6;
    v18 = CGRectGetMidX(v27);
    v28.origin.x = a3;
    v28.origin.y = a4;
    v28.size.width = a5;
    v28.size.height = a6;
    MinY = CGRectGetMinY(v28);
  }
  v24.x = MidX;
  v24.y = MaxY;
  v22 = v18;
  CGContextDrawLinearGradient(a2, v16, v24, *(CGPoint *)(&MinY - 1), 0);
  CGGradientRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
}

void __96__PXGGradientTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForGradient:targetSize:requestID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

@end
