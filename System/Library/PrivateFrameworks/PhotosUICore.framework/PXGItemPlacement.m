@implementation PXGItemPlacement

- (PXGItemPlacement)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacement.m"), 47, CFSTR("%s is not available as initializer"), "-[PXGItemPlacement init]");

  abort();
}

- (PXGItemPlacement)initWithContext:(id)a3 configuration:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  PXGItemPlacement *v8;
  PXGItemPlacement *v9;
  NSUUID *v10;
  NSUUID *uuid;
  CGPoint *v12;
  CGPoint v13;
  CGSize v14;
  CGPoint v15;
  CGSize v16;
  __int128 v17;
  __int128 v18;
  CGPoint v19;
  id WeakRetained;
  NSMutableArray *registeredSourceIdentifiers;
  objc_super v28;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v28.receiver = self;
  v28.super_class = (Class)PXGItemPlacement;
  v8 = -[PXGItemPlacement init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v9->_uuid;
    v9->_uuid = v10;

    v12 = (CGPoint *)MEMORY[0x1E0C9D628];
    v13 = (CGPoint)*MEMORY[0x1E0C9D628];
    v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v15 = (CGPoint)*MEMORY[0x1E0C9D628];
    v9->_rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v9->_rect.size = v14;
    v16 = (CGSize)*((_OWORD *)off_1E50B8610 + 1);
    v9->_rectVelocity.origin = *(CGPoint *)off_1E50B8610;
    v9->_rectVelocity.size = v16;
    v9->_alpha = 1.0;
    v17 = *(_OWORD *)off_1E50B88F0;
    v18 = *((_OWORD *)off_1E50B88F0 + 2);
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.c = *((_OWORD *)off_1E50B88F0 + 1);
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.tx = v18;
    v9->_cornerRadius = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8240;
    v9->_normalizedDisplayedAssetRect.origin = v13;
    v19 = *v12;
    v9->_normalizedDisplayedAssetRect.size = (CGSize)v12[1];
    v9->_normalizedTitleRect.origin = v19;
    v9->_normalizedSubtitleRect.size = (CGSize)v12[1];
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.a = v17;
    v9->_normalizedTitleRect.size = (CGSize)v12[1];
    v9->_normalizedSubtitleRect.origin = v15;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_chromeAlpha = _Q0;
    v9->_legibilityOverlayAlpha = 1.0;
    v9->_soundVolume = 1.0;
    ((void (**)(id, PXGItemPlacement *))v7)[2](v7, v9);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_context);
    objc_msgSend(WeakRetained, "_registerOriginalPlacement:forSourceIdentifiers:", v9, v9->_registeredSourceIdentifiers);

    registeredSourceIdentifiers = v9->_registeredSourceIdentifiers;
    v9->_registeredSourceIdentifiers = 0;

  }
  return v9;
}

- (BOOL)hasGeometry
{
  return self->_rectReference != 0;
}

- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inCoordinateSpace:(id)a5
{
  self->_rect = a3;
  self->_rectVelocity = a4;
  objc_storeWeak((id *)&self->_coordinateSpace, a5);
  self->_rectReference = 1;
}

- (CGRect)rectInCoordinateSpace:(id)a3 velocity:(CGRect *)a4
{
  id v6;
  int64_t rectReference;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize size;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  PXGItemPlacement *v23;
  uint64_t v24;
  CGRect result;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  rectReference = self->_rectReference;
  if (rectReference == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    -[NSObject _convertRect:fromLayout:toCoordinateSpace:](WeakRetained, "_convertRect:fromLayout:toCoordinateSpace:", self->_layout, v6, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
LABEL_8:
    v8 = v13;
    v9 = v14;
    v10 = v15;
    v11 = v16;
    goto LABEL_9;
  }
  if (rectReference == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    goto LABEL_8;
  }
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (rectReference)
    goto LABEL_10;
  PXAssertGetLog();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    v22 = 138412290;
    v23 = self;
    _os_log_error_impl(&dword_1A6789000, WeakRetained, OS_LOG_TYPE_ERROR, "undefined rect reference in %@", (uint8_t *)&v22, 0xCu);
  }
LABEL_9:

LABEL_10:
  if (a4)
  {
    size = self->_rectVelocity.size;
    a4->origin = self->_rectVelocity.origin;
    a4->size = size;
  }

  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inLayout:(id)a5
{
  self->_rect = a3;
  self->_rectVelocity = a4;
  objc_storeStrong((id *)&self->_layout, a5);
  self->_rectReference = 2;
}

- (CGRect)rectInLayout:(id)a3 velocity:(CGRect *)a4
{
  id v6;
  void *v7;
  int64_t rectReference;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;
  NSObject *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize size;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  PXGItemPlacement *v31;
  uint64_t v32;
  CGRect result;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  rectReference = self->_rectReference;
  if (rectReference == 2)
  {
    objc_msgSend(v6, "convertRect:fromLayout:", self->_layout, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v17;
  }
  else
  {
    if (rectReference == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_context);

      if (!WeakRetained)
      {
        PXAssertGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v30 = 138412290;
          v31 = self;
          _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "missing context in %@", (uint8_t *)&v30, 0xCu);
        }

      }
      v13 = objc_loadWeakRetained((id *)&self->_context);
      v20 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
      -[NSObject _convertRect:fromCoordinateSpace:toLayout:](v13, "_convertRect:fromCoordinateSpace:toLayout:", v20, v7, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
      v9 = v21;
      v10 = v22;
      v11 = v23;
      v12 = v24;

    }
    else
    {
      v9 = *MEMORY[0x1E0C9D628];
      v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      if (rectReference)
        goto LABEL_13;
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v30 = 138412290;
        v31 = self;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "undefined rect reference in %@", (uint8_t *)&v30, 0xCu);
      }
    }

  }
LABEL_13:
  if (a4)
  {
    size = self->_rectVelocity.size;
    a4->origin = self->_rectVelocity.origin;
    a4->size = size;
  }

  v26 = v9;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void)setDisplayedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_displayedAsset, a3);
}

- (void)setDisplayedAssetContentsRect:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.a;
  v4 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.c = *(_OWORD *)&a3->var0.c;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.tx = v4;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.a = v3;
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (void)setNormalizedDisplayedAssetRect:(CGRect)a3
{
  self->_normalizedDisplayedAssetRect = a3;
}

- (void)setNormalizedTitleRect:(CGRect)a3
{
  self->_normalizedTitleRect = a3;
}

- (void)setNormalizedSubtitleRect:(CGRect)a3
{
  self->_normalizedSubtitleRect = a3;
}

- (void)setChromeAlpha:(double)a3
{
  self->_chromeAlpha = a3;
}

- (void)setScrubberAlpha:(double)a3
{
  self->_scrubberAlpha = a3;
}

- (void)setLegibilityOverlayAlpha:(double)a3
{
  self->_legibilityOverlayAlpha = a3;
}

- (void)setSoundVolume:(float)a3
{
  self->_soundVolume = a3;
}

- (void)setOtherItemsPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_otherItemsPlacement, a3);
}

- (void)registerSourceIdentifier:(id)a3
{
  id v4;
  NSMutableArray *registeredSourceIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  registeredSourceIdentifiers = self->_registeredSourceIdentifiers;
  v8 = v4;
  if (!registeredSourceIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_registeredSourceIdentifiers;
    self->_registeredSourceIdentifiers = v6;

    v4 = v8;
    registeredSourceIdentifiers = self->_registeredSourceIdentifiers;
  }
  -[NSMutableArray addObject:](registeredSourceIdentifiers, "addObject:", v4);

}

- (id)copyWithConfiguration:(id)a3
{
  void (**v4)(id, uint64_t);
  id v5;
  id WeakRetained;
  uint64_t v7;
  CGSize size;
  CGSize v9;
  id v10;
  __int128 v11;
  __int128 v12;
  CGSize v13;
  CGSize v14;
  CGSize v15;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v7 = objc_msgSend(v5, "initWithContext:configuration:", WeakRetained, &__block_literal_global_18971);

  size = self->_rect.size;
  *(CGPoint *)(v7 + 16) = self->_rect.origin;
  *(CGSize *)(v7 + 32) = size;
  v9 = self->_rectVelocity.size;
  *(CGPoint *)(v7 + 48) = self->_rectVelocity.origin;
  *(CGSize *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 80) = self->_rectReference;
  v10 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  objc_storeWeak((id *)(v7 + 88), v10);

  objc_storeStrong((id *)(v7 + 96), self->_layout);
  *(double *)(v7 + 120) = self->_alpha;
  objc_storeStrong((id *)(v7 + 128), self->_displayedAsset);
  v11 = *(_OWORD *)&self->_displayedAssetContentsRect.t.a;
  v12 = *(_OWORD *)&self->_displayedAssetContentsRect.t.tx;
  *(_OWORD *)(v7 + 304) = *(_OWORD *)&self->_displayedAssetContentsRect.t.c;
  *(_OWORD *)(v7 + 320) = v12;
  *(_OWORD *)(v7 + 288) = v11;
  *($1A92715FA36BAB2AB993A583878CDF5D *)(v7 + 176) = self->_cornerRadius;
  v13 = self->_normalizedDisplayedAssetRect.size;
  *(CGPoint *)(v7 + 192) = self->_normalizedDisplayedAssetRect.origin;
  *(CGSize *)(v7 + 208) = v13;
  v14 = self->_normalizedTitleRect.size;
  *(CGPoint *)(v7 + 224) = self->_normalizedTitleRect.origin;
  *(CGSize *)(v7 + 240) = v14;
  v15 = self->_normalizedSubtitleRect.size;
  *(CGPoint *)(v7 + 256) = self->_normalizedSubtitleRect.origin;
  *(CGSize *)(v7 + 272) = v15;
  *(double *)(v7 + 136) = self->_chromeAlpha;
  *(double *)(v7 + 144) = self->_scrubberAlpha;
  *(double *)(v7 + 152) = self->_legibilityOverlayAlpha;
  *(float *)(v7 + 112) = self->_soundVolume;
  objc_storeStrong((id *)(v7 + 160), self->_otherItemsPlacement);
  v4[2](v4, v7);

  return (id)v7;
}

- (PXRegionOfInterest)regionOfInterest
{
  int64_t rectReference;
  void *WeakRetained;
  void *v5;
  NSObject *v6;
  PXGLayout *layout;
  id v8;
  void *v9;
  void *v12;
  int v13;
  PXGLayout *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  rectReference = self->_rectReference;
  switch(rectReference)
  {
    case 1:
      goto LABEL_9;
    case 2:
      -[PXGLayout rootLayout](self->_layout, "rootLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinateSpace");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      if (WeakRetained)
        goto LABEL_10;
      PXGTungstenGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        layout = self->_layout;
        v13 = 138412290;
        v14 = layout;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "missing coordinate space for item placement from %@", (uint8_t *)&v13, 0xCu);
      }

LABEL_9:
      WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
      goto LABEL_10;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacement.m"), 215, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  WeakRetained = 0;
LABEL_10:
  v8 = objc_alloc((Class)off_1E50B4620);
  -[PXGItemPlacement rectInCoordinateSpace:velocity:](self, "rectInCoordinateSpace:velocity:", WeakRetained, 0);
  v9 = (void *)objc_msgSend(v8, "initWithRect:inCoordinateSpace:", WeakRetained);

  return (PXRegionOfInterest *)v9;
}

- (id)copyWithRegionOfInterest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PXGItemPlacement_copyWithRegionOfInterest___block_invoke;
  v8[3] = &unk_1E5119330;
  v9 = v4;
  v5 = v4;
  v6 = -[PXGItemPlacement copyWithConfiguration:](self, "copyWithConfiguration:", v8);

  return v6;
}

- (void)adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4
{
  PXGItemPlacementContext **p_context;
  id v6;
  id v7;
  id WeakRetained;

  p_context = &self->_context;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "_adjustPreferredPlacementInSourceWithIdentifier:configuration:", v7, v6);

}

- (PXGItemPlacement)adjustedPreferredPlacement
{
  id WeakRetained;
  void *v4;
  void *v5;
  PXGItemPlacement *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "_adjustedPreferredPlacementForPlacement:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  v6 = v4;

  return v6;
}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "diagnosticDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, context=%@, rect=%@, coordinateSpace=%@, layout=%@, rectReference=%li>"), v5, self, v7, v8, v9, self->_layout, self->_rectReference);

  return (NSString *)v10;
}

- (double)alpha
{
  return self->_alpha;
}

- (PXDisplayAsset)displayedAsset
{
  return self->_displayedAsset;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)displayedAssetContentsRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].var0.c;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[6].var0.a;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[6].var0.tx;
  return self;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)normalizedDisplayedAssetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedDisplayedAssetRect.origin.x;
  y = self->_normalizedDisplayedAssetRect.origin.y;
  width = self->_normalizedDisplayedAssetRect.size.width;
  height = self->_normalizedDisplayedAssetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedTitleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedTitleRect.origin.x;
  y = self->_normalizedTitleRect.origin.y;
  width = self->_normalizedTitleRect.size.width;
  height = self->_normalizedTitleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedSubtitleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedSubtitleRect.origin.x;
  y = self->_normalizedSubtitleRect.origin.y;
  width = self->_normalizedSubtitleRect.size.width;
  height = self->_normalizedSubtitleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)chromeAlpha
{
  return self->_chromeAlpha;
}

- (double)scrubberAlpha
{
  return self->_scrubberAlpha;
}

- (double)legibilityOverlayAlpha
{
  return self->_legibilityOverlayAlpha;
}

- (float)soundVolume
{
  return self->_soundVolume;
}

- (PXGItemPlacement)otherItemsPlacement
{
  return self->_otherItemsPlacement;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_otherItemsPlacement, 0);
  objc_storeStrong((id *)&self->_displayedAsset, 0);
  objc_storeStrong((id *)&self->_registeredSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_context);
}

void __45__PXGItemPlacement_copyWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "coordinateSpace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rectInCoordinateSpace:", v5);
  objc_msgSend(v4, "setRect:velocity:inCoordinateSpace:", v5);

}

@end
