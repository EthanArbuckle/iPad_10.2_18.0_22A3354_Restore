@implementation CreateBarImage

void __CreateBarImage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  int v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[4];
  id v32;
  double v33;
  double v34;
  int v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  int v42;
  _QWORD aBlock[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfSegments");
  if (v2)
  {
    v3 = v2;
    v4 = PKUIPixelLength();
    v5 = *(_DWORD *)(a1 + 64);
    if (v5)
      v6 = *(double *)(a1 + 48);
    else
      v6 = v4;
    if (v5)
      v7 = v4;
    else
      v7 = *(double *)(a1 + 48);
    v8 = PKUIScreenScale();
    v9 = v8 > 0.0;
    v10 = v8 != 1.0;
    v11 = v9 && v10;
    v12 = ceil(v8 * v7);
    if (!v9 || !v10)
      v12 = v7;
    v13 = (unint64_t)v12;
    v14 = ceil(v8 * v6);
    if (!v9 || !v10)
      v14 = v6;
    v15 = (unint64_t)v14;
    v16 = (void *)objc_msgSend(MEMORY[0x1E0D66BF8], "create16FloatExtendedWithSize:configuration:", v13, (unint64_t)v14, 65794);
    if (v16)
    {
      v17 = v16;
      v18 = MEMORY[0x1E0C809B0];
      if (v11)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __CreateBarImage_block_invoke_2;
        v47[3] = &__block_descriptor_40_e20_v16__0__CGContext__8l;
        *(double *)&v47[4] = v8;
        objc_msgSend(v16, "accessContext:", v47);
      }
      objc_msgSend(*(id *)(a1 + 32), "totalValue");
      v20 = v19;
      v21 = *(double *)(a1 + 56);
      if (v21 <= 0.0)
        v21 = *(double *)(a1 + 48);
      aBlock[0] = v18;
      aBlock[1] = 3221225472;
      aBlock[2] = __CreateBarImage_block_invoke_3;
      aBlock[3] = &unk_1E3E78C48;
      v44 = *(id *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 48);
      v45 = v20;
      v46 = v22;
      v36[0] = v18;
      v36[1] = 3221225472;
      v36[2] = __CreateBarImage_block_invoke_4;
      v36[3] = &unk_1E3E78C70;
      v39 = v3;
      v23 = _Block_copy(aBlock);
      v38 = v23;
      v37 = *(id *)(a1 + 32);
      v42 = *(_DWORD *)(a1 + 64);
      v24 = *(_QWORD *)(a1 + 48);
      v40 = v4;
      v41 = v24;
      objc_msgSend(v17, "accessContext:", v36);
      if (*(_BYTE *)(a1 + 68))
      {
        v25 = (void *)objc_msgSend(MEMORY[0x1E0D66BF8], "create16FloatExtendedWithSize:configuration:", v13, v15, 65794);
        v26 = v25;
        if (v25)
        {
          v31[0] = v18;
          v31[1] = 3221225472;
          v31[2] = __CreateBarImage_block_invoke_5;
          v31[3] = &unk_1E3E78CB8;
          v27 = v25;
          v32 = v27;
          v33 = v8;
          v34 = v21;
          v35 = *(_DWORD *)(a1 + 64);
          objc_msgSend(v17, "accessData:", v31);
          v28 = v27;

          v17 = v28;
        }

      }
      v29 = (void *)objc_msgSend(MEMORY[0x1E0D66C00], "create8Uint");
      objc_msgSend(v29, "setColorSpace:withPolicy:", PKColorSpaceStandardRGB(), &__block_literal_global_88);
      objc_msgSend(v29, "convertContext:", v17);
      v30[0] = v18;
      v30[1] = 3221225472;
      v30[2] = __CreateBarImage_block_invoke_8;
      v30[3] = &unk_1E3E78D20;
      v30[4] = *(_QWORD *)(a1 + 40);
      *(double *)&v30[5] = v8;
      objc_msgSend(v17, "accessContext:", v30);

    }
  }
}

uint64_t __CreateBarImage_block_invoke_2(uint64_t a1, CGContextRef c)
{
  CGAffineTransform v4;

  CGContextScaleCTM(c, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  CGContextGetCTM(&v4, c);
  return CGContextSetBaseCTM();
}

double __CreateBarImage_block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v2;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "valueForSegmentAtIndex:", a2);
  if (v2 <= 0.0)
    return 0.0;
  PKFloatRoundToPixel();
  return result;
}

void __CreateBarImage_block_invoke_4(uint64_t a1, CGContext *a2)
{
  char v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  id v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if (*(_QWORD *)(a1 + 48))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0.0;
    do
    {
      v7 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (v7 <= 0.0)
      {
        if ((v4 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "colorForSegmentAtIndex:", v5);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v15, "CGColor"));

        }
      }
      else
      {
        v8 = v7;
        objc_msgSend(*(id *)(a1 + 32), "colorForSegmentAtIndex:", v5);
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v9, "CGColor"));

        v10 = *(_DWORD *)(a1 + 72);
        if (v10)
          v11 = 0.0;
        else
          v11 = v6;
        if (v10)
          v12 = v6;
        else
          v12 = 0.0;
        v13 = *(double *)(a1 + 56);
        if (v10)
          v14 = *(double *)(a1 + 56);
        else
          v14 = v8;
        if (v10)
          v13 = v8;
        CGContextFillRect(a2, *(CGRect *)&v11);
        v6 = v6 + v8;
      }
      ++v5;
      v4 = 1;
    }
    while (v5 < *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = 0.0;
  }
  v16 = *(double *)(a1 + 64);
  if (v6 < v16)
  {
    v17 = *(_DWORD *)(a1 + 72);
    v18 = 0.0;
    if (v17)
      v19 = 0.0;
    else
      v19 = v6;
    if (v17)
      v18 = v6;
    v20 = v16 - v6;
    if (v17)
      v21 = *(double *)(a1 + 56);
    else
      v21 = v16 - v6;
    if (!v17)
      v20 = *(double *)(a1 + 56);
    CGContextFillRect(a2, *(CGRect *)(&v18 - 1));
  }
}

uint64_t __CreateBarImage_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  int v8;

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CreateBarImage_block_invoke_6;
  v5[3] = &__block_descriptor_60_e79_v24__0r__vImage_CGImageFormat_II__CGColorSpace_II_di_8r__vImage_Buffer__vQQQ_16l;
  v6 = *(_OWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 56);
  v7 = a3;
  return objc_msgSend(v3, "accessData:", v5);
}

vImage_Error __CreateBarImage_block_invoke_6(uint64_t a1, uint64_t a2, const vImage_Buffer *a3)
{
  float v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  float v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  float v15;
  double v16;
  long double v17;
  float v18;
  float *v19;
  unint64_t v20;
  float v21;
  uint32_t v22;
  uint32_t v23;
  uint16_t backgroundColor[4];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = fmin(fabs(*(double *)(a1 + 32) * 0.05 * *(double *)(a1 + 40)), 1000.0);
  v6 = (2 * (unint64_t)fmax(ceilf(v5 * 3.0), 1.0)) | 1;
  v7 = *(_DWORD *)(a1 + 56);
  LODWORD(v9) = MEMORY[0x1E0C80A78](a1, a2).n128_u32[0];
  v11 = (float *)((char *)backgroundColor - v10);
  if (v12)
  {
    v13 = 0;
    v14 = (float)((float)(v9 * v9) + (float)(v9 * v9));
    v15 = (float)v8;
    v16 = 0.0;
    do
    {
      v17 = exp((float)-(float)((float)((float)v13 - v15) * (float)((float)v13 - v15)) / v14);
      v18 = v17;
      v11[v13] = v18;
      v16 = v16 + v17;
      ++v13;
    }
    while (v6 != v13);
    v19 = v11;
    v20 = v6;
    do
    {
      v21 = *v19 / v16;
      *v19++ = v21;
      --v20;
    }
    while (v20);
  }
  else
  {
    *v11 = 1.0;
  }
  *(_QWORD *)backgroundColor = 0;
  if (v7)
    v22 = v6;
  else
    v22 = 1;
  if (v7)
    v23 = 1;
  else
    v23 = v6;
  return vImageConvolve_ARGB16F(*(const vImage_Buffer **)(a1 + 48), a3, 0, 0, 0, v11, v22, v23, backgroundColor, 0x1018u);
}

uint64_t __CreateBarImage_block_invoke_7()
{
  return 1;
}

void __CreateBarImage_block_invoke_8(uint64_t a1, CGContextRef context)
{
  CGImageRef Image;
  CGImageRef v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  Image = CGBitmapContextCreateImage(context);
  if (Image)
  {
    v4 = Image;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, *(double *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    CFRelease(v4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

@end
