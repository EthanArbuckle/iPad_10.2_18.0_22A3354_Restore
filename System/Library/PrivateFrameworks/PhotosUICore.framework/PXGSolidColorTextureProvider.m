@implementation PXGSolidColorTextureProvider

- (void)viewEnvironmentDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {

LABEL_6:
      -[PXGCGImageTextureProvider invalidateCache](self, "invalidateCache");
      goto LABEL_7;
    }
  }
  -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");
  v10 = objc_msgSend(v11, "userInterfaceStyle");

  if (v9 != v10)
    goto LABEL_6;
LABEL_7:

}

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
  NSObject *v22;
  id v23;
  id v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  float64x2_t v34;
  int v35;
  id location;
  objc_super v37;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PXGSolidColorTextureProvider;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v37, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v27 = v15;
  v28 = (NSUInteger)v14;
  v29 = v13;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v17 = v28;
    do
    {
      v18 = (float32x2_t)*(&a6->var3 + 5 * v10.location);
      if (v16)
        objc_msgSend(v16, "colorAtIndex:inLayout:", v10, v29);
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      -[PXGTextureProvider requestQueue](self, "requestQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __98__PXGSolidColorTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5124C98;
      objc_copyWeak(&v33, &location);
      v34 = vcvtq_f64_f32(v18);
      v31 = v19;
      v32 = v21;
      v35 = v17;
      v23 = v21;
      v24 = v19;
      dispatch_async(v22, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      ++v17;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v26 = v27;
  v25 = v28;
  result.length = v26;
  result.location = v25;
  return result;
}

- (void)_requestTextureForColor:(id)a3 targetSize:(CGSize)a4 traitCollection:(id)a5 requestID:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  int v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v10 = a5;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v6))
  {
    if (PXPixelSizeAreaIsZero())
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v6);
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke;
      v14[3] = &unk_1E5124CC0;
      v15 = v9;
      v16 = v10;
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_3;
      v12[3] = &unk_1E5133FF8;
      v12[4] = self;
      v13 = v6;
      -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v15, v14, v12);

    }
  }

}

uint64_t __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  v2 = ((objc_msgSend(v1, "getWhite:alpha:", 0, &v8) & 1) != 0
     || objc_msgSend(v1, "getRed:green:blue:alpha:", 0, 0, 0, &v8))
    && v8 == 1.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_2;
  v6[3] = &unk_1E5133FA8;
  v7 = v1;
  v3 = v1;
  v4 = MEMORY[0x1A85CCE98](v2, 0, v6, 1.0, 1.0);

  return v4;
}

uint64_t __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCGImage:forRequestID:", a2, *(unsigned int *)(a1 + 40));
}

void __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_2(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGRect v11;

  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v11.origin.x = a3;
  v11.origin.y = a4;
  v11.size.width = a5;
  v11.size.height = a6;
  CGContextFillRect(a2, v11);
}

void __98__PXGSolidColorTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_requestTextureForColor:targetSize:traitCollection:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

@end
