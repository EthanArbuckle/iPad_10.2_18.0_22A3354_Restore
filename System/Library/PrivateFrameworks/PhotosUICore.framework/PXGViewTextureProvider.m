@implementation PXGViewTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  id v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSUInteger v26;
  NSUInteger v27;
  void *v28;
  NSUInteger v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33[2];
  int v34;
  id location;
  objc_super v36;
  _NSRange result;

  v12 = a7;
  v36.receiver = self;
  v36.super_class = (Class)PXGViewTextureProvider;
  v13 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v36, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, a3, a4, a5, a6, v12);
  v15 = v14;
  objc_msgSend(v12, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = v16;
    if (v17)
    {
      v18 = HIDWORD(*(unint64_t *)&a3);
      if (a3.length)
      {
        v28 = v16;
        v29 = v15;
        v30 = v13;
        v19 = (int)v13;
        do
        {
          v20 = objc_msgSend(v17, "viewClassForSpriteAtIndex:inLayout:", a3, v12, v28, v29, v30);
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v17, "viewUserDataForSpriteAtIndex:inLayout:", a3, v12);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "copyWithZone:", 0);

            objc_initWeak(&location, self);
            -[PXGTextureProvider requestQueue](self, "requestQueue");
            v24 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __92__PXGViewTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
            block[3] = &unk_1E5118368;
            v32 = v23;
            v25 = v23;
            objc_copyWeak(v33, &location);
            v33[1] = v21;
            v34 = v19;
            dispatch_async(v24, block);

            objc_destroyWeak(v33);
            objc_destroyWeak(&location);
          }
          ++v19;
          a3 = (_PXGSpriteIndexRange)(a3.location + 1);
          LODWORD(v18) = v18 - 1;
        }
        while ((_DWORD)v18);
        v15 = v29;
        v13 = v30;
        v16 = v28;
      }
    }
  }
  else
  {
    v17 = 0;
  }

  v26 = (NSUInteger)v13;
  v27 = v15;
  result.length = v27;
  result.location = v26;
  return result;
}

void __92__PXGViewTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "prepareForRender");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForViewClass:userData:requestID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56));

}

- (void)_requestTextureForViewClass:(Class)a3 userData:(id)a4 requestID:(int)a5
{
  uint64_t v5;
  id v8;
  PXGViewPayload *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = -[PXGViewPayload initWithViewClass:userData:]([PXGViewPayload alloc], "initWithViewClass:userData:", a3, v8);

  -[PXGTextureProvider providePayload:forRequestID:](self, "providePayload:forRequestID:", v9, v5);
}

@end
