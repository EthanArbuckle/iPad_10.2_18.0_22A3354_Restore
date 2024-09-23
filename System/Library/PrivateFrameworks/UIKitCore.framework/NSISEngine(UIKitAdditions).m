@implementation NSISEngine(UIKitAdditions)

- (_DWORD)debugQuickLookObject
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  int8x8_t v5;
  int8x8_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIGraphicsImageRendererFormat *v17;
  UIGraphicsImageRenderer *v18;
  id v19;
  id v20;
  __int32 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  _DWORD *v31;
  _QWORD v32[4];
  __int32 v33;
  _QWORD aBlock[4];
  __int32 v35;

  v1 = objc_msgSend(objc_retainAutorelease(a1), "traceState");
  v2 = (_DWORD *)v1;
  if (v1)
  {
    v3 = *(unsigned int *)(v1 + 24);
    if ((_DWORD)v3)
    {
      v4 = *(_QWORD **)(v1 + 28);
      v5 = 0;
      do
      {
        v6 = *(int8x8_t *)v4;
        v4 = (_QWORD *)((char *)v4 + 9);
        v5 = vbsl_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x4000000040000000)), (int8x8_t)vmax_u32((uint32x2_t)v5, (uint32x2_t)v6), v5);
        --v3;
      }
      while (v3);
    }
    else
    {
      v5 = 0;
    }
    v22 = v5.i32[0];
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke;
    aBlock[3] = &__block_descriptor_36_e8_I12__0I8l;
    v35 = v5.i32[1];
    v8 = _Block_copy(aBlock);
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_2;
    v32[3] = &__block_descriptor_36_e8_I12__0I8l;
    v33 = v22;
    v9 = _Block_copy(v32);
    v11 = v2[4];
    v10 = v2[5];
    if (v10 <= 1)
      v10 = 1;
    if (v11 <= 1)
      v11 = 1;
    v12 = (double)v10;
    v13 = 1024.0 / (double)v11;
    if (1024.0 / (double)v10 < v13)
      v13 = 1024.0 / v12;
    v14 = fmax(v13, 1.0);
    v15 = v14 * v12;
    v16 = v14 * (double)v11;
    v17 = objc_alloc_init(UIGraphicsImageRendererFormat);
    -[UIGraphicsImageRendererFormat setScale:](v17, "setScale:", 1.0);
    -[UIGraphicsImageRendererFormat setOpaque:](v17, "setOpaque:", 1);
    -[UIGraphicsImageRendererFormat setPreferredRange:](v17, "setPreferredRange:", 2);
    v18 = -[UIGraphicsImageRenderer initWithBounds:format:]([UIGraphicsImageRenderer alloc], "initWithBounds:format:", v17, 0.0, 0.0, v15, v16);
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_3;
    v23[3] = &unk_1E16E9850;
    v26 = 0;
    v27 = 0;
    v28 = v15;
    v29 = v16;
    v30 = v14;
    v31 = v2;
    v24 = v8;
    v25 = v9;
    v19 = v9;
    v20 = v8;
    -[UIGraphicsImageRenderer imageWithActions:](v18, "imageWithActions:", v23);
    v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
