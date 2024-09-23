@implementation _UIImageCIImageRenderer

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
    CFRelease(surface);
  v4.receiver = self;
  v4.super_class = (Class)_UIImageCIImageRenderer;
  -[_UIImageCIImageRenderer dealloc](&v4, sel_dealloc);
}

- (uint64_t)_targetColorSpaceForHDR:(uint64_t)result
{
  uint64_t *v2;
  dispatch_once_t *v3;
  void *v4;

  if (result)
  {
    if (a2)
    {
      if (qword_1ECD79560 == -1)
      {
        v2 = &qword_1ECD79558;
        return *v2;
      }
      v2 = &qword_1ECD79558;
      v3 = &qword_1ECD79560;
      v4 = &__block_literal_global_267;
    }
    else
    {
      if (qword_1ECD79570 == -1)
      {
        v2 = &qword_1ECD79568;
        return *v2;
      }
      v2 = &qword_1ECD79568;
      v3 = &qword_1ECD79570;
      v4 = &__block_literal_global_269;
    }
    dispatch_once(v3, v4);
    return *v2;
  }
  return result;
}

- (void)_updateSurfaceForSize:(double)a3 usingHDR:(double)a4
{
  int v7;
  void *v8;
  float v9;
  unint64_t v10;
  float v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AlignedBytesPerRow;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFDictionary *v23;
  const void *v24;
  IOSurfaceRef v25;
  char v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a2 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "_supportsDeepColor");

    }
    v9 = a3;
    v10 = vcvtps_s32_f32(v9);
    v11 = a4;
    v12 = vcvtps_s32_f32(v11);
    if ((*(_BYTE *)(a1 + 32) & 1) == 0
      || v7 == ((*(_BYTE *)(a1 + 32) & 2) == 0)
      || *(_QWORD *)(a1 + 16) != v10
      || *(_QWORD *)(a1 + 24) != v12)
    {
      *(_QWORD *)(a1 + 16) = v10;
      *(_QWORD *)(a1 + 24) = v12;
      if (v7)
        v13 = 1380411457;
      else
        v13 = 1380401729;
      if (v7)
        v14 = 8;
      else
        v14 = 4;
      AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
      v16 = AlignedBytesPerRow * v12;
      v27[0] = *MEMORY[0x1E0CBC1E0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v27[1] = *MEMORY[0x1E0CBC008];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v18;
      v27[2] = *MEMORY[0x1E0CBBF08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AlignedBytesPerRow);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v19;
      v27[3] = *MEMORY[0x1E0CBBEE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v20;
      v27[4] = *MEMORY[0x1E0CBBF00];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[4] = v21;
      v27[5] = *MEMORY[0x1E0CBC070];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[5] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v24 = *(const void **)(a1 + 8);
      if (v24)
        CFRelease(v24);
      v25 = IOSurfaceCreate(v23);
      *(_QWORD *)(a1 + 8) = v25;
      if (v7)
        v26 = 2;
      else
        v26 = 0;
      *(_BYTE *)(a1 + 32) = v26 | *(_BYTE *)(a1 + 32) & 0xFC | (v25 != 0);

    }
  }
}

- (void)_updateContextForHDRRendering:(uint64_t)a1
{
  void *v3;
  int v4;
  unsigned int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a2 & 1) != 0
      || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "_supportsDeepColor"),
          v3,
          v4))
    {
      v5 = (unsigned int *)MEMORY[0x1E0C9E080];
    }
    else
    {
      v5 = (unsigned int *)MEMORY[0x1E0C9E070];
    }
    v6 = *v5;
    v7 = *(void **)(a1 + 40);
    if (!v7 || objc_msgSend(v7, "workingFormat") != (_DWORD)v6)
    {
      v8 = (void *)MEMORY[0x1E0C9DD90];
      v13 = *MEMORY[0x1E0C9DFC8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contextWithOptions:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v11;

    }
  }
}

- (void)renderContent:(int)a3 usingHDR:(void *)a4 withEffects:
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void (**v15)(void);

  v15 = a4;
  if (a1)
  {
    objc_msgSend(a2, "CIImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      if (v15
        && (v15[2](),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            objc_msgSend(v9, "extent"),
            objc_msgSend(v10, "imageByCroppingToRect:"),
            v9 = (id)objc_claimAutoreleasedReturnValue(),
            v10,
            !v9))
      {
        *(_BYTE *)(a1 + 32) &= ~1u;
      }
      else
      {
        objc_msgSend(v9, "extent");
        v12 = v11;
        v14 = v13;
        -[_UIImageCIImageRenderer _updateSurfaceForSize:usingHDR:](a1, a3, v11, v13);
        -[_UIImageCIImageRenderer _updateContextForHDRRendering:](a1, a3);
        if ((*(_BYTE *)(a1 + 32) & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "render:toIOSurface:bounds:colorSpace:", v9, *(_QWORD *)(a1 + 8), -[_UIImageCIImageRenderer _targetColorSpaceForHDR:](a1, a3), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v14);
      }

    }
    else
    {
      *(_BYTE *)(a1 + 32) &= ~1u;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
