@implementation PXGPathTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  uint64_t length;
  id v13;
  id v14;
  NSUInteger v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  int v19;
  float32x2_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSUInteger v26;
  NSUInteger v27;
  _QWORD block[4];
  id v29;
  id v30;
  float64x2_t v31;
  int v32;
  id location;
  objc_super v34;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PXGPathTextureProvider;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v34, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v26 = v15;
  v27 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v19 = v27;
    do
    {
      v20 = (float32x2_t)*(&a6->var3 + 5 * v10.location);
      objc_msgSend(v16, "pathForSpriteAtIndex:inLayout:", v10, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPathTextureProvider.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path != nil"));

      }
      objc_initWeak(&location, self);
      -[PXGTextureProvider requestQueue](self, "requestQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__PXGPathTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5133F80;
      objc_copyWeak(&v30, &location);
      v29 = v21;
      v31 = vcvtq_f64_f32(v20);
      v32 = v19;
      v23 = v21;
      dispatch_async(v22, block);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      ++v19;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v18 = v26;
  v17 = v27;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)_requestTextureForPath:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v9;
  int IsZero;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  int v17;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  _QWORD v22[3];

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v22[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v5))
  {
    IsZero = PXPixelSizeAreaIsZero();
    if (!v9 || IsZero)
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v5);
    }
    else
    {
      v11 = objc_alloc((Class)off_1E50B5CD8);
      v22[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithObjects:", v13);

      v15 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke;
      v18[3] = &unk_1E5133FD0;
      v20 = width;
      v21 = height;
      v19 = v9;
      v16[0] = v15;
      v16[1] = 3221225472;
      v16[2] = __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_3;
      v16[3] = &unk_1E5133FF8;
      v16[4] = self;
      v17 = v5;
      -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v14, v18, v16);

    }
  }

}

uint64_t __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_2;
  v4[3] = &unk_1E5133FA8;
  v5 = *(id *)(a1 + 32);
  v2 = MEMORY[0x1A85CCE98](0, 0, v4, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v2;
}

uint64_t __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCGImage:forRequestID:", a2, *(unsigned int *)(a1 + 40));
}

void __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_2(uint64_t a1, CGContext *a2)
{
  CGFloat v4;
  id v5;
  id v6;

  CGContextAddPath(a2, (CGPathRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGPath"));
  objc_msgSend(*(id *)(a1 + 32), "lineWidth");
  CGContextSetLineWidth(a2, v4);
  objc_msgSend(*(id *)(a1 + 32), "strokeColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)objc_msgSend(v5, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "fillColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v6, "CGColor"));

  CGContextDrawPath(a2, (CGPathDrawingMode)objc_msgSend(*(id *)(a1 + 32), "drawingMode"));
}

void __92__PXGPathTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForPath:targetSize:requestID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

@end
