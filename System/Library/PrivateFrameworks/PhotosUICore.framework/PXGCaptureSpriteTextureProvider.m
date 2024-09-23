@implementation PXGCaptureSpriteTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  uint64_t length;
  id v13;
  id v14;
  NSUInteger v15;
  void *v16;
  int v17;
  void *v18;
  char *v19;
  float32x2_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v28;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v29;
  _QWORD block[4];
  id v31;
  id v32[2];
  int v33;
  id location;
  float64x2_t v35;
  float64x2_t v36;
  objc_super v37;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PXGCaptureSpriteTextureProvider;
  v28 = a4;
  v29 = a6;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v37, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v26 = v15;
  v27 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v17 = v27;
    do
    {
      v18 = (void *)objc_msgSend(v16, "behaviorForCaptureSpriteAtIndex:inLayout:", v10, v13);
      if (v18 == (void *)2)
      {
        HIDWORD(location) = 0;
        *(_DWORD *)((char *)&location + 1) = 0;
        v19 = (char *)v28 + 32 * v10.location;
        v20 = *(float32x2_t *)(v19 + 24);
        LOBYTE(location) = *(&v29->var0 + 40 * v10.location);
        v35 = vaddq_f64(*(float64x2_t *)v19, vcvtq_f64_f32(vmul_f32(v20, (float32x2_t)0xBF000000BF000000)));
        v36 = vcvtq_f64_f32(v20);
        -[PXGTextureProvider requestRenderSnapshot:](self, "requestRenderSnapshot:", &location);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      objc_initWeak(&location, self);
      -[PXGTextureProvider requestQueue](self, "requestQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__PXGCaptureSpriteTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E512CB28;
      objc_copyWeak(v32, &location);
      v32[1] = v18;
      v31 = v21;
      v33 = v17;
      v23 = v21;
      dispatch_async(v22, block);

      objc_destroyWeak(v32);
      objc_destroyWeak(&location);
      ++v17;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  v25 = v26;
  v24 = v27;
  result.length = v25;
  result.location = v24;
  return result;
}

- (void)_requestWithBehavior:(unint64_t)a3 renderSnapshot:(id)a4 requestID:(int)a5
{
  uint64_t v5;
  id v8;
  PXGCaptureSpritePayload *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = -[PXGCaptureSpritePayload initWithBehavior:renderSnapshot:]([PXGCaptureSpritePayload alloc], "initWithBehavior:renderSnapshot:", a3, v8);

  -[PXGTextureProvider providePayload:forRequestID:](self, "providePayload:forRequestID:", v9, v5);
}

void __101__PXGCaptureSpriteTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestWithBehavior:renderSnapshot:requestID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56));

}

@end
