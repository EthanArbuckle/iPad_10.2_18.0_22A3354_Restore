@implementation PXGStringTextureProvider

- (PXGStringTextureProvider)init
{
  PXGStringTextureProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGStringTextureProvider;
  result = -[PXGCGImageTextureProvider init](&v3, sel_init);
  if (result)
    result->_requestBlockLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)viewEnvironmentDidChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  os_unfair_lock_s *p_requestBlockLock;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStringTextureProvider;
  v4 = a3;
  -[PXGTextureProvider viewEnvironmentDidChange:](&v8, sel_viewEnvironmentDidChange_, v4);
  v5 = -[PXGStringTextureProvider _shouldRedrawForViewEnvironmentChange:](self, "_shouldRedrawForViewEnvironmentChange:", v4, v8.receiver, v8.super_class);

  if (v5)
  {
    -[PXGCGImageTextureProvider invalidateCache](self, "invalidateCache");
    p_requestBlockLock = &self->_requestBlockLock;
    os_unfair_lock_lock(&self->_requestBlockLock);
    v7 = (void *)-[NSMutableDictionary copy](self->_requestBlockLock_requestIDsToProviderBlock, "copy");
    os_unfair_lock_unlock(p_requestBlockLock);
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_259729);

  }
}

- (BOOL)_shouldRedrawForViewEnvironmentChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  return v6 != v7;
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  uint64_t length;
  id v13;
  id v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float32x2_t v36;
  id v37;
  void (**v38)(_QWORD);
  NSMutableDictionary *v39;
  NSMutableDictionary *requestBlockLock_requestIDsToProviderBlock;
  void *v41;
  void *v42;
  NSMutableDictionary *v43;
  void *v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  PXGStringTextureProvider *val;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69[3];
  float64x2_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  id location;
  objc_super v81;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  val = self;
  v81.receiver = self;
  v81.super_class = (Class)PXGStringTextureProvider;
  v57 = a6;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v81, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v47 = v15;
  v48 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v13, "userInterfaceDirection");
  objc_msgSend(v13, "displayScale");
  v55 = v16;
  if (length)
  {
    v53 = *((_QWORD *)off_1E50B8020 + 1);
    v54 = *(_QWORD *)off_1E50B8020;
    v51 = *((_QWORD *)off_1E50B8020 + 3);
    v52 = *((_QWORD *)off_1E50B8020 + 2);
    v49 = *(void **)(MEMORY[0x1E0CB3440] + 8);
    v50 = (void *)*MEMORY[0x1E0CB3440];
    v17 = v48;
    do
    {
      objc_msgSend(v58, "attributedStringForSpriteAtIndex:inLayout:", v10, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = length;
      if (v18)
      {
        v19 = 0;
        v20 = 0;
      }
      else
      {
        objc_msgSend(v58, "stringAtIndex:inLayout:", v10, v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringAttributesAtIndex:inLayout:", v10, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v58, "verticalAlignmentForStringAtIndex:inLayout:", v10, v13);
      if ((objc_msgSend(v13, "stringSourceRespondsTo") & 1) != 0)
        v22 = objc_msgSend(v58, "stringDrawingOptionsForSpriteAtIndex:inLayout:", v10, v13);
      else
        v22 = 1;
      v24 = v51;
      v23 = v52;
      v25 = v53;
      v26 = v54;
      if ((objc_msgSend(v13, "stringSourceRespondsTo") & 0x100) != 0)
      {
        objc_msgSend(v58, "paddingForSpriteAtIndex:inLayout:", v10, v13);
        v26 = v27;
        v25 = v28;
        v23 = v29;
        v24 = v30;
      }
      if ((objc_msgSend(v13, "stringSourceRespondsTo") & 0x10000) != 0)
      {
        objc_msgSend(v58, "drawingContextForSpriteAtIndex:inLayout:", v10, v13);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      v33 = v49;
      v32 = v50;
      if ((objc_msgSend(v13, "stringSourceRespondsTo") & 0x1000000) != 0)
      {
        objc_msgSend(v58, "attributedStringBoundingSizeForSpriteAtIndex:inLayout:", v10, v13);
        v32 = v34;
        v33 = v35;
      }
      v36 = (float32x2_t)*(&v57->var3 + 5 * v10.location);
      objc_initWeak(&location, val);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      aBlock[3] = &unk_1E5140EF8;
      objc_copyWeak(v69, &location);
      v60 = v19;
      v65 = v60;
      v61 = v18;
      v66 = v61;
      v69[1] = v32;
      v69[2] = v33;
      v59 = v20;
      v67 = v59;
      v70 = vcvtq_f64_f32(v36);
      v71 = v22;
      v37 = v31;
      v68 = v37;
      v72 = v56;
      v73 = v21;
      v79 = v17;
      v74 = v55;
      v75 = v26;
      v76 = v25;
      v77 = v23;
      v78 = v24;
      v38 = (void (**)(_QWORD))_Block_copy(aBlock);
      os_unfair_lock_lock(&val->_requestBlockLock);
      if (!val->_requestBlockLock_requestIDsToProviderBlock)
      {
        v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        requestBlockLock_requestIDsToProviderBlock = val->_requestBlockLock_requestIDsToProviderBlock;
        val->_requestBlockLock_requestIDsToProviderBlock = v39;

      }
      v41 = (void *)objc_msgSend(v38, "copy");
      v42 = _Block_copy(v41);
      v43 = val->_requestBlockLock_requestIDsToProviderBlock;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v42, v44);

      os_unfair_lock_unlock(&val->_requestBlockLock);
      v38[2](v38);

      objc_destroyWeak(v69);
      objc_destroyWeak(&location);

      v17 = (v17 + 1);
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      length = v62 - 1;
    }
    while (v62 != 1);
  }

  v46 = v47;
  v45 = v48;
  result.length = v46;
  result.location = v45;
  return result;
}

- (void)cancelTextureRequests:(id)a3
{
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGStringTextureProvider;
  v4 = a3;
  -[PXGTextureProvider cancelTextureRequests:](&v6, sel_cancelTextureRequests_, v4);
  os_unfair_lock_lock(&self->_requestBlockLock);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PXGStringTextureProvider_cancelTextureRequests___block_invoke;
  v5[3] = &unk_1E5148928;
  v5[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);

  os_unfair_lock_unlock(&self->_requestBlockLock);
}

- (void)_requestTextureForAttributedString:(id)a3 attributedStringBoundingSize:(CGSize)a4 string:(id)a5 withAttributes:(id)a6 targetSize:(CGSize)a7 drawingOptions:(int64_t)a8 drawingContext:(id)a9 userInterfaceDirection:(unint64_t)a10 verticalAlignment:(int64_t)a11 screenScale:(double)a12 textureRequestID:(int)a13 padding:(UIEdgeInsets)a14
{
  CGFloat height;
  CGFloat width;
  CGFloat v22;
  CGFloat v23;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int64_t v48;
  _QWORD v49[5];
  int v50;
  char v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  int64_t v61;
  int64_t v62;
  UIEdgeInsets v63;
  double v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[4];
  _QWORD v70[5];

  height = a7.height;
  width = a7.width;
  v22 = a4.height;
  v23 = a4.width;
  v70[3] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a5;
  v27 = a6;
  v28 = a9;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", a13))
  {
    if (PXPixelSizeAreaIsZero())
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", a13);
      goto LABEL_21;
    }
    v48 = a8;
    if (a10 == 1)
    {
      v29 = *MEMORY[0x1E0DC1178];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");
      v32 = v31;
      if (v31)
        v33 = v31;
      else
        v33 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      v34 = v33;

      v35 = objc_msgSend(v34, "alignment");
      if (v35 == 2)
        v36 = 0;
      else
        v36 = v35;
      if (v35)
        v37 = v36;
      else
        v37 = 2;
      objc_msgSend(v34, "setAlignment:", v37);
      v38 = (void *)objc_msgSend(v27, "mutableCopy");
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v34, v29);

      v27 = v38;
      a8 = v48;
    }
    if (v25)
    {
      v39 = objc_alloc((Class)off_1E50B5CD8);
      v70[0] = v25;
      *(CGFloat *)v67 = width;
      *(CGFloat *)&v67[1] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v67, "{CGSize=dd}");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v70[2] = v41;
      v42 = (void *)MEMORY[0x1E0C99D20];
      v43 = v70;
    }
    else
    {
      v39 = objc_alloc((Class)off_1E50B5CD8);
      if (v27)
      {
        v69[0] = v26;
        v69[1] = v27;
        *(CGFloat *)v66 = width;
        *(CGFloat *)&v66[1] = height;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v66, "{CGSize=dd}");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v41;
        v42 = (void *)MEMORY[0x1E0C99D20];
        v43 = v69;
        v44 = 4;
        goto LABEL_20;
      }
      v68[0] = v26;
      *(CGFloat *)v65 = width;
      *(CGFloat *)&v65[1] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v65, "{CGSize=dd}");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v41;
      v42 = (void *)MEMORY[0x1E0C99D20];
      v43 = v68;
    }
    v44 = 3;
LABEL_20:
    objc_msgSend(v42, "arrayWithObjects:count:", v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v39, "initWithObjects:", v45);

    v47 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke;
    v52[3] = &unk_1E5140F88;
    v57 = width;
    v58 = height;
    v53 = v25;
    v54 = v26;
    v27 = v27;
    v55 = v27;
    v59 = v23;
    v60 = v22;
    v61 = v48;
    v56 = v28;
    v62 = a11;
    v63 = a14;
    v64 = a12;
    v49[0] = v47;
    v49[1] = 3221225472;
    v49[2] = __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_3;
    v49[3] = &unk_1E5140FB0;
    v51 = 0;
    v49[4] = self;
    v50 = a13;
    -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v46, v52, v49);

  }
LABEL_21:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestBlockLock_requestIDsToProviderBlock, 0);
}

uint64_t __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_2;
  v7[3] = &unk_1E5140F60;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 96);
  v2 = *(id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 104);
  v11 = v2;
  v14 = v3;
  v4 = *(_OWORD *)(a1 + 128);
  v15 = *(_OWORD *)(a1 + 112);
  v16 = v4;
  v17 = *(_QWORD *)(a1 + 144);
  v5 = MEMORY[0x1A85CCE98](0, 0, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

  return v5;
}

uint64_t __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_3(uint64_t a1, uint64_t a2)
{
  char v2;
  void *v3;
  uint64_t v4;
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
  v2 = *(_BYTE *)(a1 + 44);
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 40);
  v6 = *(_OWORD *)off_1E50B83E0;
  v7 = v2;
  v10 = 1065353216;
  v11 = 0;
  return objc_msgSend(v3, "provideCGImage:options:forRequestID:", a2, &v6, v4);
}

void __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, CGFloat a5, CGFloat a6)
{
  void *v12;
  id v13;
  double v14;
  id v15;

  v12 = *(void **)(a1 + 32);
  if (v12)
    v13 = v12;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v15 = v13;
  PXGDrawAttributedString(v13, *(_QWORD *)(a1 + 80), *(void **)(a1 + 56), *(_QWORD *)(a1 + 88), a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), v14, a3, a4, a5, a6, *(CGFloat *)(a1 + 128));

}

uint64_t __53__PXGStringTextureProvider_viewEnvironmentDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void __50__PXGStringTextureProvider_cancelTextureRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "removeObjectForKey:", v3);

}

void __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  int v26;
  _QWORD v27[4];
  id v28;
  id v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "viewEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    v8 = v7;
    v9 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      if (v7)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = ___PXGResolvedAttributesWithViewEnvironment_block_invoke;
        v27[3] = &unk_1E5140FF8;
        v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v29 = v8;
        v10 = v28;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);
        v11 = (id)objc_msgSend(v10, "copy");

      }
      else
      {
        v11 = v6;
      }
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(v3, "requestQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
    v14[3] = &unk_1E5140ED0;
    v14[4] = v3;
    v15 = *(id *)(a1 + 40);
    v19 = *(_OWORD *)(a1 + 72);
    v16 = *(id *)(a1 + 48);
    v17 = v11;
    v20 = *(_OWORD *)(a1 + 88);
    v21 = *(_QWORD *)(a1 + 104);
    v18 = *(id *)(a1 + 56);
    v22 = *(_OWORD *)(a1 + 112);
    v23 = *(_QWORD *)(a1 + 128);
    v26 = *(_DWORD *)(a1 + 168);
    v24 = *(_OWORD *)(a1 + 136);
    v25 = *(_OWORD *)(a1 + 152);
    v13 = v11;
    dispatch_async(v12, v14);

  }
}

uint64_t __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  LODWORD(v2) = *(_DWORD *)(a1 + 168);
  return objc_msgSend(*(id *)(a1 + 32), "_requestTextureForAttributedString:attributedStringBoundingSize:string:withAttributes:targetSize:drawingOptions:drawingContext:userInterfaceDirection:verticalAlignment:screenScale:textureRequestID:padding:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 112), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 128), *(_QWORD *)(a1 + 120), v2, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152),
           *(_QWORD *)(a1 + 160));
}

@end
