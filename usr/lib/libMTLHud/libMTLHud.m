BOOL IsDrawableDetached(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t DetachModeCode;
  int v5;
  _BOOL8 v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v1, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iosurface");

  v12 = v3;
  if (v10[3])
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___Z18IsDrawableDetachedPU26objcproto15CAMetalDrawable11objc_object_block_invoke;
    v8[3] = &unk_24EE470B8;
    v8[4] = &v9;
    objc_msgSend(v1, "addPresentScheduledHandler:", v8);
    DetachModeCode = IOSurfaceGetDetachModeCode();
    v5 = WORD2(DetachModeCode);
    if (WORD2(DetachModeCode) == 0xFFFF)
      v5 = (unsigned __int16)word_25589572C;
    IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sPrevDetachCode = DetachModeCode;
    v6 = (IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonCA | IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonServer | v5) == 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_2269407BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

uint64_t ___Z18IsDrawableDetachedPU26objcproto15CAMetalDrawable11objc_object_block_invoke()
{
  uint64_t result;

  result = IOSurfaceGetDetachModeCode();
  IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonCA = (unsigned __int16)result;
  IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonServer = WORD1(result);
  return result;
}

CTFontRef esfm_FindCTFont(const char *cStr, unsigned int a2)
{
  const __CFString *v3;
  double v4;
  const __CTFontDescriptor *v5;
  const __CTFontDescriptor *MatchingFontDescriptor;
  const __CTFontDescriptor *v7;
  CTFontRef v8;

  v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v4 = (double)a2;
  v5 = CTFontDescriptorCreateWithNameAndSize(v3, (double)a2);
  CFRelease(v3);
  MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v5, 0);
  if (!MatchingFontDescriptor)
  {
    v8 = CTFontCreateWithFontDescriptor(v5, v4, 0);
    if (!v5)
      return v8;
    goto LABEL_3;
  }
  v7 = MatchingFontDescriptor;
  v8 = CTFontCreateWithFontDescriptor(MatchingFontDescriptor, v4, 0);
  CFRelease(v7);
  if (v5)
LABEL_3:
    CFRelease(v5);
  return v8;
}

CGContext *esfm_PrepareCGContext(uint64_t a1, BOOL a2)
{
  CGColorSpace *DeviceGray;
  CGContext *v5;
  unint64_t v6;
  unint64_t v7;
  CGColor *v8;
  _OWORD v10[2];
  uint64_t v11;
  CGRect v12;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 16) != 1)
    esfm_PrepareCGContext();
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v5 = CGBitmapContextCreate(*(void **)a1, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12), 8uLL, *(unsigned __int8 *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 8), DeviceGray, *(unsigned __int8 *)(a1 + 16) != 1);
  CGContextSetRenderingIntent(v5, kCGRenderingIntentPerceptual);
  CGContextSetAllowsAntialiasing(v5, a2);
  CGContextSetShouldAntialias(v5, a2);
  CGContextSetInterpolationQuality(v5, kCGInterpolationHigh);
  CGContextSetAllowsFontSmoothing(v5, 1);
  CGContextSetShouldSmoothFonts(v5, 1);
  CGContextSetAllowsFontSubpixelPositioning(v5, 1);
  CGContextSetShouldSubpixelPositionFonts(v5, 1);
  CGContextSetAllowsFontSubpixelQuantization(v5, 1);
  CGContextSetShouldSubpixelQuantizeFonts(v5, 1);
  LODWORD(v6) = *(_DWORD *)(a1 + 8);
  LODWORD(v7) = *(_DWORD *)(a1 + 12);
  v12.size.width = (double)v6;
  v12.size.height = (double)v7;
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextClearRect(v5, v12);
  v10[0] = xmmword_226949E80;
  v10[1] = unk_226949E90;
  v8 = CGColorCreate(DeviceGray, (const CGFloat *)v10);
  CGContextSetFillColorWithColor(v5, v8);
  CFRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v5;
}

float esfm_DistanceFromPixel_simd(uint64_t a1, int a2, int a3, int a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, int8x16_t a13)
{
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  signed int v18;
  int32x4_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  signed int v24;
  int v25;
  int32x4_t v26;
  int32x4_t v27;
  int v28;
  int v29;
  int32x4_t v30;
  int32x4_t v31;
  int8x16_t v32;
  int32x4_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  int v40;

  v13 = a3 - a4;
  v14 = a4 - 1 + a2;
  if (a3 < a4)
    v13 = -1;
  if (a2 - a4 < 0)
    v15 = -1;
  else
    v15 = a2 - a4;
  v16 = *(_DWORD *)(a1 + 8);
  v17 = *(_DWORD *)(a1 + 12) - 1;
  if (a4 - 1 + a3 < v17)
    v17 = a4 - 1 + a3;
  if (v14 >= v16 - 1)
    v14 = v16 - 1;
  v18 = a4 * a4;
  if (v13 < v17)
  {
    v19 = vdupq_n_s32(a5 << 31 >> 31);
    v20 = v14 - 4;
    v21 = 1 - a2;
    v22 = v16 + v16 * v13;
    v23 = -a2;
    do
    {
      ++v13;
      v24 = (v13 - a3) * (v13 - a3);
      if (v24 >= v18)
        break;
      v25 = *(unsigned __int8 *)(a1 + 16);
      v26 = vdupq_n_s32(v18);
      if (v15 >= v20)
      {
        v36 = v15 + 1;
      }
      else
      {
        v27 = vdupq_n_s32(v24);
        v28 = v22 * v25;
        v29 = v15;
        do
        {
          v30 = vaddq_s32(vdupq_n_s32(v21 + v29), (int32x4_t)xmmword_226949E40);
          v31 = vmlaq_s32(v27, v30, v30);
          v32 = (int8x16_t)vcgtq_s32(v26, v31);
          a13.i32[0] = vmaxvq_u32((uint32x4_t)v32);
          if (a13.i32[0] < 0)
          {
            a13.i8[0] = *(_BYTE *)(*(_QWORD *)a1 + (v28 + v29 + 3));
            a13.i8[4] = *(_BYTE *)(*(_QWORD *)a1 + (v28 + v29 + 4));
            v33.i32[0] = *(unsigned __int8 *)(*(_QWORD *)a1 + (v28 + v29 + 1));
            v33.i32[1] = *(unsigned __int8 *)(*(_QWORD *)a1 + (v28 + v29 + 2));
            v33.u64[1] = (unint64_t)vand_s8(*(int8x8_t *)a13.i8, (int8x8_t)0xFF000000FFLL);
            a13 = (int8x16_t)vceqq_s32(v19, vtstq_s32(v33, v33));
            v26 = (int32x4_t)vbslq_s8(vbicq_s8(v32, a13), (int8x16_t)v31, (int8x16_t)v26);
          }
          v34 = v29 + 4;
          v35 = v29 + 5;
          v29 += 4;
        }
        while (v35 <= v20);
        v36 = v34 + 1;
      }
      v37 = vminvq_s32(v26);
      if (v37 < v18)
        v18 = v37;
      if (v36 <= (int)v14)
      {
        v38 = v14 + 1 - v36;
        v39 = v36 + v22 * v25;
        v40 = v23 + v36;
        do
        {
          if (v24 + v40 * v40 < v18 && (*(_BYTE *)(*(_QWORD *)a1 + v39) == 0) == a5)
            v18 = v24 + v40 * v40;
          ++v39;
          ++v40;
          --v38;
        }
        while (v38);
      }
      v22 += v16;
    }
    while (v13 != v17);
  }
  return sqrtf((float)v18) / (float)a4;
}

uint64_t esfm_BakeFontIntoBitmapGrayscale(const char *a1, unsigned int a2, __int16 a3, unsigned int a4, void *a5, unsigned int a6, int a7, uint64_t a8, uint64_t a9)
{
  __int16 v16;
  uint64_t v17;
  double *v18;
  size_t v19;
  char *v20;
  size_t v21;
  uint64_t v22;
  const __CTFont *v23;
  CGRect *v24;
  CGFloat height;
  CGSize *p_size;
  uint64_t v27;
  const __CTFont *v29;
  const __CTFont *v30;
  double Ascent;
  double Descent;
  double Leading;
  unsigned int v34;
  float v35;
  float v36;
  float v37;
  float v38;
  unsigned int y_high;
  CGRect *v40;
  unsigned int v41;
  uint64_t v42;
  double *p_width;
  int v44;
  int v45;
  double v46;
  int v47;
  int width_low;
  int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  float v54;
  float v55;
  float v56;
  CGRect v57;
  unsigned int v58;
  const __CTFont *CTFont;
  CGPoint positions;
  CGFloat width;
  unsigned int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  HIDWORD(v57.origin.y) = a7;
  bzero(a5, a7 * a6);
  CTFont = esfm_FindCTFont(a1, a2);
  if (!CTFont)
    return 0xFFFFFFFFLL;
  v16 = a3;
  v58 = a6;
  *(_QWORD *)&v57.size.width = a5;
  *(_QWORD *)&v57.size.height = a9;
  v17 = a4;
  MEMORY[0x24BDAC7A8]();
  v18 = &v57.origin.x - 2 * a4;
  bzero(v18, v19);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v57 - ((2 * a4 + 15) & 0x3FFFFFFF0);
  bzero(v20, 2 * a4);
  MEMORY[0x24BDAC7A8]();
  bzero(&v57 - a4, v21);
  MEMORY[0x24BDAC7A8]();
  bzero(v20, 2 * a4);
  *(_QWORD *)&v57.origin.x = a8;
  if (a4)
  {
    v22 = 0;
    do
    {
      *(_WORD *)&v20[2 * v22] = v16 + v22;
      ++v22;
    }
    while (a4 != v22);
    v23 = CTFont;
    CTFontGetGlyphsForCharacters(CTFont, (const UniChar *)v20, (CGGlyph *)v20, a4);
    CTFontGetAdvancesForGlyphs(v23, kCTFontOrientationDefault, (const CGGlyph *)v20, (CGSize *)&v57 - a4, a4);
    v24 = &v57 - a4;
    CTFontGetBoundingRectsForGlyphs(v23, kCTFontOrientationDefault, (const CGGlyph *)v20, v24, a4);
    height = v57.size.height;
    p_size = &v24->size;
    v27 = a4;
    do
    {
      *(CGRect *)&p_size[-1].width = CGRectIntegral(*(CGRect *)&p_size[-1].width);
      p_size += 2;
      --v27;
    }
    while (v27);
  }
  else
  {
    v29 = CTFont;
    CTFontGetGlyphsForCharacters(CTFont, (const UniChar *)v20, (CGGlyph *)v20, 0);
    CTFontGetAdvancesForGlyphs(v29, kCTFontOrientationDefault, (const CGGlyph *)v20, (CGSize *)&v57, 0);
    CTFontGetBoundingRectsForGlyphs(v29, kCTFontOrientationDefault, (const CGGlyph *)v20, &v57, 0);
    height = v57.size.height;
    v24 = &v57;
  }
  v30 = CTFont;
  Ascent = CTFontGetAscent(CTFont);
  Descent = CTFontGetDescent(v30);
  Leading = CTFontGetLeading(v30);
  v34 = v58;
  if (height == 0.0)
    esfm_BakeFontIntoBitmapGrayscale_cold_1();
  v35 = Ascent;
  v36 = Descent;
  v37 = Leading;
  v38 = (float)(v35 + v36) + v37;
  **(float **)&height = v38;
  v64 = 1;
  width = v57.size.width;
  y_high = HIDWORD(v57.origin.y);
  v62 = v34;
  v63 = HIDWORD(v57.origin.y);
  *(_QWORD *)&v57.size.height = esfm_PrepareCGContext((uint64_t)&width, 1);
  if (a4)
  {
    v40 = v24;
    v41 = vcvtps_u32_f32(v38);
    LODWORD(v57.size.width) = v41 + 4;
    v42 = *(_QWORD *)&v57.origin.x + 12;
    p_width = &v40->size.width;
    v44 = 4;
    v45 = 4;
    do
    {
      v46 = *p_width;
      v47 = (int)(*p_width + 4.0);
      width_low = LODWORD(v57.size.width);
      if (v45 + v47 < v34)
        width_low = 0;
      v44 += width_low;
      if (v44 + v41 >= y_high)
        esfm_BakeFontIntoBitmapGrayscale_cold_2();
      if (v45 + v47 >= v34)
        v49 = 0;
      else
        v49 = v45;
      v50 = p_width[1];
      v52 = *(p_width - 2);
      v51 = *(p_width - 1);
      positions.x = (double)(v49 + 4) - v52;
      positions.y = (double)(int)(y_high - v44) - v51 - v50;
      CTFontDrawGlyphs(CTFont, (const CGGlyph *)v20, &positions, 1uLL, *(CGContextRef *)&v57.size.height);
      *(_DWORD *)(v42 - 12) = v49 + 3;
      *(_DWORD *)(v42 - 8) = v44 - 1;
      *(_DWORD *)(v42 - 4) = (v46 + 1.0);
      *(_DWORD *)v42 = (v50 + 1.0);
      v53 = *v18;
      v18 += 2;
      v54 = v53;
      v55 = v52;
      *(float *)(v42 + 4) = v54;
      *(float *)(v42 + 8) = v55;
      v45 = v49 + v47;
      v34 = v58;
      v56 = v50 + v51;
      *(float *)(v42 + 12) = v56;
      v42 += 28;
      p_width += 4;
      v20 += 2;
      --v17;
    }
    while (v17);
  }
  CFRelease(CTFont);
  return 0;
}

uint64_t esfm_BakeFontIntoBitmapGrayscaleSDF(const char *a1, int a2, int a3, unsigned int a4, _BYTE *a5, unsigned int a6, unsigned int a7, uint64_t a8, float *a9)
{
  CTFontRef CTFont;
  const __CTFont *v14;
  uint64_t v15;
  uint64_t *v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  _WORD *v22;
  double Ascent;
  double Descent;
  double Leading;
  float v26;
  float v27;
  float v28;
  float v29;
  unsigned int v30;
  double *p_width;
  double v32;
  uint64_t v33;
  double v34;
  unsigned int v35;
  unint64_t v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  double *p_x;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  int8x16_t v52;
  unsigned int v53;
  int v55;
  int v56;
  int v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  float v62;
  float64x2_t v63;
  double v64;
  int v65;
  int v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  unsigned int v70;
  _BYTE *v71;
  _BOOL4 v72;
  _BOOL4 v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t *v78;
  uint64_t v79;
  const __CTFont *v80;
  float64x2_t v81;
  int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  size_t v86;
  CGContextRef v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  CGRect *v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  int v99;
  uint64_t v100;
  _BYTE *v101;
  void *v102;
  CGPoint positions;
  void *v104;
  unsigned int v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;

  v88 = a8;
  v108 = *MEMORY[0x24BDAC8D0];
  v89 = a7;
  v97 = a6;
  v101 = a5;
  bzero(a5, a7 * a6);
  CTFont = esfm_FindCTFont(a1, 16 * a2);
  if (!CTFont)
    return 0xFFFFFFFFLL;
  v14 = CTFont;
  v15 = a4;
  MEMORY[0x24BDAC7A8]();
  v16 = &v75 - 2 * a4;
  bzero(v16, v17);
  MEMORY[0x24BDAC7A8]();
  v18 = (2 * a4 + 15) & 0x3FFFFFFF0;
  v19 = (char *)&v75 - v18;
  bzero((char *)&v75 - v18, 2 * a4);
  MEMORY[0x24BDAC7A8]();
  v91 = (CGRect *)(&v75 - 4 * a4);
  bzero(v91, v20);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v75 - v18, 2 * a4);
  if (a4)
  {
    v21 = a4;
    v22 = (_WORD *)((char *)&v75 - v18);
    do
    {
      *v22++ = a3++;
      --v21;
    }
    while (v21);
  }
  CTFontGetGlyphsForCharacters(v14, (const UniChar *)((char *)&v75 - v18), (CGGlyph *)((char *)&v75 - v18), a4);
  CTFontGetAdvancesForGlyphs(v14, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v75 - v18), (CGSize *)&v75 - a4, a4);
  CTFontGetBoundingRectsForGlyphs(v14, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v75 - v18), v91, a4);
  Ascent = CTFontGetAscent(v14);
  Descent = CTFontGetDescent(v14);
  Leading = CTFontGetLeading(v14);
  if (!a9)
    esfm_BakeFontIntoBitmapGrayscaleSDF_cold_1();
  v26 = Ascent;
  v27 = Descent;
  v28 = Leading;
  v29 = (float)(v26 + v27) + v28;
  v30 = vcvtps_u32_f32(v29);
  *a9 = v29 * 0.0625;
  if ((int)a4 < 1)
  {
    v35 = -9857;
  }
  else
  {
    p_width = &v91->size.width;
    v32 = -10000.0;
    v33 = a4;
    do
    {
      v34 = *p_width;
      p_width += 4;
      v32 = fmax(v32, v34);
      --v33;
    }
    while (v33);
    v35 = (int)v32 + 143;
  }
  v107 = 0;
  v37 = v35 & 0xFFFFFFF0;
  v38 = (v30 + 143) & 0xFFFFFFF0;
  v86 = v37 * v38;
  v102 = malloc_type_malloc(v86, 0x9A9D91CAuLL);
  v104 = v102;
  v105 = v35 & 0xFFFFFFF0;
  v106 = v38;
  LOBYTE(v107) = 1;
  v87 = esfm_PrepareCGContext((uint64_t)&v104, 0);
  if (a4)
  {
    v39 = 0;
    v93 = 0;
    v84 = (v30 + 143) >> 4;
    v83 = (v30 >> 4) + 4;
    v82 = (v30 >> 4) + 8;
    v76 = v35 >> 4 << 7;
    v94 = v35 >> 4 << 8;
    v85 = v35 >> 4;
    v40 = 0;
    v75 = 144 * (v35 >> 4);
    __asm { FMOV            V0.2D, #-0.25 }
    v81 = _Q0;
    v80 = v14;
    v79 = v15;
    v78 = v16;
    v77 = v19;
    while (1)
    {
      bzero(v102, v86);
      p_x = &v91[v40].origin.x;
      v46 = *p_x;
      v47 = p_x[1];
      v48 = p_x[2];
      v49 = p_x[3];
      positions.x = 64.0 - *p_x;
      positions.y = (double)(int)(v38 - 64) - v47 - v49;
      CTFontDrawGlyphs(v14, (const CGGlyph *)&v19[2 * v40], &positions, 1uLL, v87);
      v53 = ((v48 + 128.0) * 0.0625);
      v96 = ((v49 + 128.0) * 0.0625);
      if (v85 < v53 || v84 < ((v49 + 128.0) * 0.0625))
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_5();
      v55 = v83;
      if (v39 + v53 < v97)
        v55 = 0;
      v56 = v55 + v93;
      if (v39 + v53 >= v97)
        v57 = 0;
      else
        v57 = v39;
      if (v82 + v56 >= v89)
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_4();
      v63.f64[0] = v46 * 0.0625;
      v58 = v47 * 0.0625;
      v59 = v49 * 0.0625;
      v60 = v88 + 28 * v40;
      v92 = v57;
      v93 = v56;
      *(_DWORD *)v60 = v57 + 3;
      *(_DWORD *)(v60 + 4) = v56 + 3;
      *(_DWORD *)(v60 + 8) = (v48 * 0.0625 + 2.0);
      *(_DWORD *)(v60 + 12) = (v49 * 0.0625 + 2.0);
      v90 = v40;
      v61 = *(double *)&v16[2 * v40];
      v62 = v61 * 0.0625;
      *(float *)(v60 + 16) = v62;
      v63.f64[1] = v47 * 0.0625 + v49 * 0.0625;
      v64 = COERCE_DOUBLE(vcvt_f32_f64(vaddq_f64(v63, v81)));
      *(double *)(v60 + 20) = v64;
      if (v96)
        break;
LABEL_48:
      v39 = v92 + v53;
      v40 = v90 + 1;
      v14 = v80;
      v16 = v78;
      v19 = v77;
      if (v90 + 1 == v79)
        goto LABEL_49;
    }
    v98 = v92 + v97 * v93;
    v99 = 0;
    v100 = 16 * ((v48 + 128.0) * 0.0625);
    v65 = v75;
    v66 = v76;
    v95 = ((v48 + 128.0) * 0.0625);
    while (!v53)
    {
LABEL_47:
      v53 = v95;
      v66 += v94;
      v65 += v94;
      v98 += v97;
      if (++v99 == v96)
        goto LABEL_48;
    }
    v67 = 0;
    v68 = v98;
    v69 = (16 * v99) | 8;
    v70 = (16 * v99) | 9;
    while (1)
    {
      if (v37 == v67)
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_2();
      if (v69 >= v38)
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_3();
      if (v67 + 9 >= v37)
      {
        v72 = 0;
        v71 = v102;
      }
      else
      {
        v71 = v102;
        v72 = *((_BYTE *)v102 + (v66 + v67 + 9)) != 0;
      }
      if (v38 <= v70)
        break;
      if (!v71[(v66 + v67 + 8)])
        v72 = 0;
      if (v71[(v65 + v67 + 8)])
        v73 = v72;
      else
        v73 = 0;
      if (v67 + 9 >= v37)
        goto LABEL_43;
      v74 = v71[(v65 + v67 + 9)] != 0;
LABEL_44:
      *(float *)&v64 = esfm_DistanceFromPixel_simd((uint64_t)&v104, v67 + 8, v69, 64, v73 && v74, v64, v63.f64[0], v58, v61, v59, v50, v51, v52);
      if (!v73 || !v74)
        *(float *)&v64 = -*(float *)&v64;
      LODWORD(v63.f64[0]) = 1123942400;
      *(float *)&v64 = (float)(*(float *)&v64 * 127.0) + 127.0;
      v101[v68] = (int)*(float *)&v64;
      v67 += 16;
      ++v68;
      if (v100 == v67)
        goto LABEL_47;
    }
    v73 = 0;
LABEL_43:
    v74 = 0;
    goto LABEL_44;
  }
LABEL_49:
  CGContextRelease(v87);
  free(v102);
  CFRelease(v14);
  return 1;
}

id esfm_BakeFontIntoTextureR8Unorm(void *a1, const char *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, int a7, int a8, uint64_t a9, float *a10, float32x2_t *a11)
{
  id v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  float32x2_t v26;
  uint64_t v27;
  float32x2_t *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *context;
  id v36;
  void *v37;
  void *v38;
  int v39;
  _QWORD v40[3];
  _QWORD v41[3];

  v18 = a1;
  context = (void *)MEMORY[0x22769FE38]();
  v38 = v18;
  objc_msgSend(v18, "device");
  v39 = a7;
  v19 = a7 * a6;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_retainAutorelease((id)objc_msgSend(v37, "newBufferWithLength:options:", v19, 0));
  v20 = (unsigned __int8 *)objc_msgSend(v36, "contents");
  if (!a8)
  {
    if (esfm_BakeFontIntoBitmapGrayscale(a2, a3, a4, a5, v20, a6, v39, a9, (uint64_t)a10))
    {
      v25 = 0;
      v23 = v36;
      v22 = v37;
      goto LABEL_15;
    }
    v26 = (float32x2_t)0xBF000000BF000000;
    if ((_DWORD)v19)
    {
      v27 = 0;
      v28 = a11;
      while (v20[v27] != 255)
      {
        if (v19 == ++v27)
          goto LABEL_13;
      }
      v26 = vadd_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v27 / a6, v27 % a6)), (float32x2_t)0x3F0000003F000000);
    }
    else
    {
      v28 = a11;
    }
LABEL_13:
    v24 = v39;
    *v28 = vdiv_f32(v26, vcvt_f32_u32((uint32x2_t)__PAIR64__(v39, a6)));
    v23 = v36;
    v22 = v37;
LABEL_14:
    objc_msgSend(v38, "commandBuffer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a6;
    v31 = v24;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, a6, v24, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setStorageMode:", 2);
    v25 = (void *)objc_msgSend(v22, "newTextureWithDescriptor:", v32);
    objc_msgSend(v29, "blitCommandEncoder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v30;
    v41[1] = v31;
    v41[2] = 1;
    memset(v40, 0, sizeof(v40));
    objc_msgSend(v33, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v23, 0, v30, 0, v41, v25, 0, 0, v40, 0);
    objc_msgSend(v33, "endEncoding");
    objc_msgSend(v29, "commit");
    objc_msgSend(v29, "waitUntilCompleted");

    goto LABEL_15;
  }
  v21 = esfm_BakeFontIntoBitmapGrayscaleSDF(a2, a3, a4, a5, v20, a6, v39, a9, a10);
  v23 = v36;
  v22 = v37;
  v24 = v39;
  if (v21 != -1)
    goto LABEL_14;
  v25 = 0;
LABEL_15:

  objc_autoreleasePoolPop(context);
  return v25;
}

void sub_226941940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

uint64_t esfm_CreateFont(void *a1, const char *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8)
{
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v15 = a1;
  if (a8)
  {
    v16 = malloc_type_malloc(28 * a5, 0x100004027586B93uLL);
    *(_QWORD *)(a8 + 8) = v16;
    bzero(v16, 28 * a5);
    esfm_BakeFontIntoTextureR8Unorm(v15, a2, a3, a4, a5, a6, a7, 0, *(_QWORD *)(a8 + 8), (float *)(a8 + 24), (float32x2_t *)(a8 + 32));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)a8;
    *(_QWORD *)a8 = v17;

    *(_DWORD *)(a8 + 16) = a4;
    *(_DWORD *)(a8 + 20) = a3;
    if (*(_QWORD *)a8)
      v19 = 0;
    else
      v19 = 0xFFFFFFFFLL;
  }
  else
  {
    v19 = 0xFFFFFFFFLL;
  }

  return v19;
}

void sub_226941AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id esfm_vertex_CreateMTLVertexDescriptor()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDDD770], "vertexDescriptor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOffset:", 0);

  objc_msgSend(v0, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormat:", 29);

  objc_msgSend(v0, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBufferIndex:", 0);

  objc_msgSend(v0, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOffset:", 8);

  objc_msgSend(v0, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFormat:", 29);

  objc_msgSend(v0, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBufferIndex:", 0);

  objc_msgSend(v0, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOffset:", 16);

  objc_msgSend(v0, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFormat:", 36);

  objc_msgSend(v0, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBufferIndex:", 0);

  objc_msgSend(v0, "layouts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStepRate:", 1);

  objc_msgSend(v0, "layouts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStepFunction:", 1);

  objc_msgSend(v0, "layouts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStride:", 20);

  return v0;
}

void sub_226941D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t esfm_GenerateTriangesForString(uint64_t a1, float *a2, float *a3, int a4, void *a5, uint64_t a6, int a7, uint64_t a8, float a9, _WORD *a10, unsigned __int16 a11)
{
  id v19;
  unint64_t v20;
  unint64_t v21;
  float v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  float v28;
  float v29;
  int v30;
  uint64_t v31;
  float v32;
  int v33;
  float v34;
  int v35;
  int v36;
  int v37;
  float v38;
  float v39;
  unsigned int v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;

  v19 = a5;
  v20 = objc_msgSend(v19, "width");
  v21 = objc_msgSend(v19, "height");
  v23 = 1.0 / (float)v20;
  v24 = *a2;
  v25 = *a3;
  v26 = 1.0 / (float)v21;
  v27 = a8;
LABEL_2:
  v28 = floorf(v25 + 0.5);
  v29 = v24;
  while (1)
  {
    ++a1;
    while (1)
    {
      v30 = *(unsigned __int8 *)(a1 - 1);
      if (v30 != 32)
        break;
      ++a1;
      v29 = v29 + *(float *)(a6 + 28 * (32 - a7) + 16);
    }
    if (!*(_BYTE *)(a1 - 1))
      break;
    if (v30 == 10)
    {
      v25 = v25 + a9;
      goto LABEL_2;
    }
    v31 = a6 + 28 * ((char)v30 - a7);
    v32 = *(float *)(v31 + 16);
    v33 = (int)(float)(floorf(v29 + 0.5) + *(float *)(v31 + 20));
    v34 = (float)v33;
    v35 = (int)(float)(v28 - *(float *)(v31 + 24));
    v37 = *(_DWORD *)(v31 + 8);
    v36 = *(_DWORD *)(v31 + 12);
    v38 = (float)(v37 + v33);
    v39 = (float)(v36 + v35);
    v40 = *(_DWORD *)v31;
    LODWORD(v31) = *(_DWORD *)(v31 + 4);
    v41 = (float)v35;
    v42 = v23 * (float)v40;
    v43 = v26 * (float)v31;
    v44 = v23 * (float)(v40 + v37);
    v45 = v26 * (float)(v31 + v36);
    v29 = v29 + v32;
    LODWORD(v31) = a11 - 13107 * ((v27 - a8) >> 2);
    *(float *)v27 = v34;
    *(float *)(v27 + 4) = v41;
    *(float *)(v27 + 8) = v42;
    *(float *)(v27 + 12) = v43;
    *(_DWORD *)(v27 + 16) = a4;
    *(float *)(v27 + 20) = v38;
    *(float *)(v27 + 24) = v41;
    *(float *)(v27 + 28) = v44;
    *(float *)(v27 + 32) = v43;
    *(_DWORD *)(v27 + 36) = a4;
    *(float *)(v27 + 40) = v34;
    *(float *)(v27 + 44) = v39;
    *(float *)(v27 + 48) = v42;
    *(float *)(v27 + 52) = v45;
    *(_DWORD *)(v27 + 56) = a4;
    *(float *)(v27 + 60) = v38;
    *(float *)(v27 + 64) = v39;
    *(float *)(v27 + 68) = v44;
    *(float *)(v27 + 72) = v45;
    *(_DWORD *)(v27 + 76) = a4;
    v27 += 80;
    *a10 = v31;
    a10[1] = v31 + 1;
    a10[2] = v31 + 2;
    a10[3] = v31 + 1;
    a10[4] = v31 + 3;
    a10[5] = v31 + 2;
    a10 += 6;
  }
  *a2 = v29;
  *a3 = v25;
  v46 = ((int)(-858993459 * ((unint64_t)(v27 - a8) >> 2)) / 4);

  return v46;
}

void sub_226941FD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t Renderer::Init(Renderer *this, CAMetalLayer *a2)
{
  CAMetalLayer *v3;
  objc_object *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  -[CAMetalLayer device](v3, "device");
  v4 = (objc_object *)objc_claimAutoreleasedReturnValue();
  MTLHud_objc_unwrap(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "newCommandQueue");
  objc_storeStrong((id *)this, v6);
  -[CAMetalLayer contentsScale](v3, "contentsScale");
  *(float *)&v7 = v7;
  *((_DWORD *)this + 56) = LODWORD(v7);
  if (esfm_CreateFont(v6, "Menlo", 0x1Cu, 32, 0x5Fu, 0x140u, 256, (uint64_t)this + 24))
    __assert_rtn("Init", "Renderer.mm", 98, "result == 0");
  v8 = objc_alloc_init(MEMORY[0x24BDDD590]);
  objc_msgSend(v8, "setDepthCompareFunction:", 7);
  objc_msgSend(v8, "setDepthWriteEnabled:", 0);
  objc_msgSend(*(id *)this, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "newDepthStencilStateWithDescriptor:", v8);
  v11 = (void *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v10;

  std::vector<Renderer::SDrawCommand>::reserve((char **)this + 20, 4uLL);
  objc_msgSend(v6, "device");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)this + 23);
  *((_QWORD *)this + 23) = v12;

  return 1;
}

void sub_226942134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t std::vector<Renderer::SDrawCommand>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int64x2_t v14;
  char *v15;
  uint64_t v16;
  int64x2_t v17;
  char *v18;
  uint64_t v19;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v19 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>(result, a2);
    v9 = *a1;
    v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      v14 = vdupq_n_s64(v8);
      v10 = &v6[v5];
    }
    else
    {
      v10 = &v6[v5];
      do
      {
        v11 = *(_QWORD *)(v8 - 24);
        v8 -= 24;
        v12 = *(_DWORD *)(v8 + 8);
        *((_QWORD *)v10 - 3) = v11;
        v10 -= 24;
        *((_DWORD *)v10 + 2) = v12;
        v13 = *(_QWORD *)(v8 + 16);
        *(_QWORD *)(v8 + 16) = 0;
        *((_QWORD *)v10 + 2) = v13;
      }
      while ((char *)v8 != v9);
      v14 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5];
    v17 = v14;
    v15 = a1[2];
    a1[2] = &v6[24 * v7];
    v18 = v15;
    v16 = v14.i64[0];
    return std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v16);
  }
  return result;
}

void Renderer::BeginFrame(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *RenderPipelines;
  _QWORD v6[2];

  v6[1] = objc_msgSend(*(id *)(a2 + 8), "pixelFormat", objc_msgSend(*(id *)(a2 + 8), "sampleCount"));
  objc_msgSend(*(id *)a1, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  RenderPipelines = Renderer::getOrCreateRenderPipelines(a1, v4, v6);

  if (RenderPipelines)
  {
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 16) = RenderPipelines;
  }
  *(_DWORD *)(a1 + 192) = 0;
}

void sub_2269422F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *Renderer::getOrCreateRenderPipelines(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD *v36;
  char v37;
  char v38;
  __int128 v40;
  id v41;
  id v42;
  id v43;

  v5 = a2;
  v6 = a1 + 72;
  v7 = std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::find<Renderer::SPiplelinesDescriptor>((_QWORD *)(a1 + 72), a3);
  if (v7)
  {
    v8 = v7 + 4;
  }
  else
  {
    esfm_vertex_CreateMTLVertexDescriptor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDDD528]);
    objc_msgSend(v10, "setFastMathEnabled:", 1);
    objc_msgSend(v10, "setLanguageVersion:", 0x20000);
    objc_msgSend(*(id *)a1, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v12 = (void *)objc_msgSend(v11, "newLibraryWithSource:options:error:", CFSTR("#include <metal_stdlib>\nusing namespace metal;\ntypedef struct\n{\n    float2 position [[attribute(0)]];\n    float2 texCoord [[attribute(1)]];\n    uint color      [[attribute(2)]];\n} libMTLHud_vertexIn;\ntypedef struct\n{\n    float4 position [[position]];\n    float2 texCoord;\n    float4 vertexColor;\n} libMTLHud_vertexOut;\nvertex libMTLHud_vertexOut libMTLHud_vertexShader(libMTLHud_vertexIn in [[stage_in]],\n                                                 const constant float4x4& projection [[ buffer(1) ]])\n{\n    libMTLHud_vertexOut out;\n    out.position = projection * float4(in.position, 0, 1);\n    out.texCoord = in.texCoord;\n    out.vertexColor = unpack_unorm4x8_to_float(in.color);\n\n    return out;\n}\nfragment float4 libMTLHud_fragmentShader(libMTLHud_vertexOut in [[stage_in]],\n                                         texture2d<float, access::sample> tex [[texture(0)]])\n{\n    constexpr sampler sam(mip_filter::linear, mag_filter::linear, min_filter::linear, address::clamp_to_edge);\n    float sample = tex.sample(sam, in.texCoord).r;\n    float4 res = (float4)sample * in.vertexColor;\n    return res;}\n"),
                    v10,
                    &v43);
    v13 = v43;

    if (v12)
    {

      v10 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
      objc_msgSend(v10, "setLabel:", CFSTR("libMTLHUD:pipelineState"));
      objc_msgSend(v10, "setRasterSampleCount:", *a3);
      v14 = (void *)objc_msgSend(v12, "newFunctionWithName:", CFSTR("libMTLHud_vertexShader"));
      objc_msgSend(v10, "setVertexFunction:", v14);

      v15 = (void *)objc_msgSend(v12, "newFunctionWithName:", CFSTR("libMTLHud_fragmentShader"));
      objc_msgSend(v10, "setFragmentFunction:", v15);

      objc_msgSend(v10, "setVertexDescriptor:", v9);
      v16 = a3[1];
      objc_msgSend(v10, "colorAttachments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPixelFormat:", v16);

      objc_msgSend(v10, "colorAttachments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBlendingEnabled:", 1);

      objc_msgSend(v10, "colorAttachments");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRgbBlendOperation:", 0);

      objc_msgSend(v10, "colorAttachments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAlphaBlendOperation:", 0);

      objc_msgSend(v10, "colorAttachments");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSourceRGBBlendFactor:", 4);

      objc_msgSend(v10, "colorAttachments");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSourceAlphaBlendFactor:", 1);

      objc_msgSend(v10, "colorAttachments");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDestinationRGBBlendFactor:", 5);

      objc_msgSend(v10, "colorAttachments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setDestinationAlphaBlendFactor:", 5);

      v42 = v13;
      v33 = (void *)objc_msgSend(v5, "newRenderPipelineStateWithDescriptor:error:", v10, &v42);
      v34 = v42;

      if (v33)
      {
        v35 = v33;
        v40 = *(_OWORD *)a3;
        v41 = v35;
        v36 = std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__emplace_unique_key_args<Renderer::SPiplelinesDescriptor,std::pair<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>(v6, &v40, (uint64_t)&v40);
        v38 = v37;

        if (v38)
          v8 = v36 + 4;
        else
          v8 = 0;
      }
      else
      {
        NSLog(CFSTR("Overlay: Failed to create pipeline states, error %@"), v34);
        v8 = 0;
      }

    }
    else
    {
      NSLog(CFSTR("Overlay: Failed to create MTLLibrary, error %@"), v13);
      v8 = 0;
      v34 = v13;
    }

  }
  return v8;
}

void sub_2269426A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void Renderer::EndFrame(uint64_t a1, uint64_t a2)
{
  int v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  float v22;
  unint64_t v23;
  unint64_t v24;
  float v25;
  void *v26;
  id v27;
  unsigned int *v28;
  unsigned int *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  __int128 v37;
  _OWORD v38[4];

  if (*(_QWORD *)(a1 + 168) != *(_QWORD *)(a1 + 160))
  {
    v3 = *(_DWORD *)(a1 + 8);
    if ((v3 & 0x80000000) == 0 && v3 == *(_DWORD *)(a2 + 16))
    {
      v5 = *(id *)a2;
      if (!v5)
      {
        objc_msgSend(*(id *)a1, "commandBuffer");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLabel:", CFSTR("libMTLHud"));
      }
      v6 = (void *)objc_opt_new();
      v7 = *(_QWORD *)(a2 + 8);
      objc_msgSend(v6, "colorAttachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTexture:", v7);

      objc_msgSend(v6, "colorAttachments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLoadAction:", 1);

      objc_msgSend(v6, "colorAttachments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setStoreAction:", 1);

      objc_msgSend(v5, "pushDebugGroup:", CFSTR("libMTLHud"));
      v14 = objc_msgSend(*(id *)(a2 + 8), "width");
      v15 = objc_msgSend(*(id *)(a2 + 8), "height");
      v16 = *(void **)(a2 + 8);
      if (*(float *)(a1 + 224) <= 1.0)
      {
        v23 = objc_msgSend(v16, "width");
        v24 = objc_msgSend(*(id *)(a2 + 8), "height");
        *(float *)&v21 = (float)v23;
        v25 = (float)((float)v24 * 2.0) + 0.0;
        LODWORD(v20) = 0;
        *((_QWORD *)&v20 + 1) = 0;
        DWORD1(v19) = 0;
        *((_QWORD *)&v19 + 1) = 0;
        *(float *)&v19 = 2.0 / (float)(*(float *)&v21 + *(float *)&v21);
        *((float *)&v20 + 1) = 2.0 / (float)(0.0 - v25);
        *(float *)&v21 = (float)(*(float *)&v21 - *(float *)&v21) / (float)((float)-(float)v23 - (float)v23);
        v22 = (float)(v25 + 0.0) / v25;
      }
      else
      {
        v17 = objc_msgSend(v16, "width");
        v18 = objc_msgSend(*(id *)(a2 + 8), "height");
        LODWORD(v20) = 0;
        *((_QWORD *)&v20 + 1) = 0;
        DWORD1(v19) = 0;
        *((_QWORD *)&v19 + 1) = 0;
        *(float *)&v19 = 2.0 / (float)v17;
        *((float *)&v20 + 1) = 2.0 / (float)(0.0 - (float)v18);
        *(float *)&v21 = (float)v17 / (float)(0.0 - (float)v17);
        v22 = (float)v18 / (float)v18;
      }
      *((float *)&v21 + 1) = v22;
      DWORD2(v21) = 0x80000000;
      HIDWORD(v21) = 1.0;
      v38[0] = v19;
      v38[1] = v20;
      v38[2] = xmmword_226949E50;
      v38[3] = v21;
      objc_msgSend(v5, "renderCommandEncoderWithDescriptor:", v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = 0;
      v36[1] = 0;
      *(double *)&v36[2] = (double)v14;
      *(double *)&v36[3] = (double)v15;
      v37 = xmmword_226949E60;
      objc_msgSend(v26, "setViewport:", v36);
      objc_msgSend(v26, "setDepthStencilState:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v26, "setVertexBytes:length:atIndex:", v38, 64, 1);
      v27 = *(id *)(a1 + 8 * *(unsigned int *)(a2 + 16) + 200);
      objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", v27, 0, 0);
      objc_msgSend(v26, "setFragmentTexture:atIndex:", *(_QWORD *)(a1 + 24), 0);
      v28 = *(unsigned int **)(a1 + 160);
      v29 = *(unsigned int **)(a1 + 168);
      if (v28 == v29)
      {
        v30 = 0;
      }
      else
      {
        v30 = 0;
        do
        {
          if (v28[2])
          {
            v31 = (void *)*((_QWORD *)v28 + 2);
            if (v30 != v31)
            {
              v32 = v31;

              v30 = v32;
              objc_msgSend(v26, "setRenderPipelineState:", v32);
            }
            objc_msgSend(v26, "setVertexBufferOffset:atIndex:", *v28, 0);
            objc_msgSend(v26, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v28[2], 0, v27, v28[1]);
          }
          v28 += 6;
        }
        while (v28 != v29);
      }
      objc_msgSend(v26, "endEncoding");

      v34 = *(_QWORD *)(a1 + 160);
      v33 = *(_QWORD *)(a1 + 168);
      if (v33 != v34)
      {
        do
        {
          v35 = v33 - 24;

          v33 = v35;
        }
        while (v35 != v34);
      }
      *(_QWORD *)(a1 + 168) = v34;
      objc_msgSend(v5, "popDebugGroup");
      if ((objc_msgSend(v5, "commitAndWaitUntilSubmitted") & 1) == 0)
        objc_msgSend(v5, "waitUntilScheduled");
      *(_DWORD *)(a1 + 8) = -1;
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

void sub_226942B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t Renderer::getDynamicVertexIndexBuffers(uint64_t a1, unsigned int a2, int a3, int a4, uint64_t *a5, _QWORD *a6, _DWORD *a7, _DWORD *a8)
{
  uint64_t v12;
  uint64_t result;

  *a7 = *(_DWORD *)(a1 + 192);
  v12 = (20 * a3 + 255) & 0xFFFFFF00;
  result = CDynamicBuffer::GetPtr((CDynamicBuffer *)(a1 + 184), a2, (20 * a3 + 2 * a4 + 511) & 0xFFFFFF00);
  *a5 = result;
  *a6 = result + v12;
  *a8 = *a7 + v12;
  return result;
}

double Renderer::DrawText(Renderer *this, const char *a2, int a3, int a4, double result)
{
  unsigned int v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t Ptr;
  int v15;
  int v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int64x2_t v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  int64x2_t v41;
  uint64_t v42;
  char *v43;

  if (a3 >= 1)
  {
    v7 = *((_DWORD *)this + 2);
    if ((v7 & 0x80000000) == 0)
    {
      result = *((double *)this + 19);
      if (*(float *)&result >= 0.0 && *((float *)&result + 1) >= 0.0)
      {
        v38 = HIDWORD(*((_QWORD *)this + 19));
        v39 = LODWORD(result);
        v9 = *((_QWORD *)this + 14);
        if (v9)
        {
          v10 = *((_DWORD *)this + 34);
          if ((v10 + 4 * a3) >= *((_DWORD *)this + 32)
            || (v11 = *((int *)this + 35), (v11 + 6 * a3) >= *((_DWORD *)this + 33)))
          {
            Renderer::DrawText();
          }
          *((int32x2_t *)this + 17) = vmla_s32(*(int32x2_t *)((char *)this + 136), vdup_n_s32(esfm_GenerateTriangesForString((uint64_t)a2, (float *)&v39, (float *)&v38, a4, *((void **)this + 3), *((_QWORD *)this + 4), *((_DWORD *)this + 10), v9 + 20 * v10, *((float *)this + 12), (_WORD *)(*((_QWORD *)this + 15) + 2 * v11), *((_DWORD *)this + 34))), (int32x2_t)0x600000004);
        }
        else
        {
          v12 = *((_DWORD *)this + 48);
          v13 = (80 * a3 + 255) & 0xFFFFFF00;
          Ptr = CDynamicBuffer::GetPtr((Renderer *)((char *)this + 184), v7, (92 * a3 + 511) & 0xFFFFFF00);
          v15 = v12 + v13;
          v16 = 6
              * esfm_GenerateTriangesForString((uint64_t)a2, (float *)&v39, (float *)&v38, a4, *((void **)this + 3), *((_QWORD *)this + 4), *((_DWORD *)this + 10), Ptr, *((float *)this + 12), (_WORD *)(Ptr + v13), 0);
          v17 = **((id **)this + 2);
          v18 = *((_QWORD *)this + 22);
          v19 = *((_QWORD *)this + 21);
          if (v19 >= v18)
          {
            v21 = *((_QWORD *)this + 20);
            v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - v21) >> 3);
            if (v22 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
            v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - v21) >> 3);
            v24 = 2 * v23;
            if (2 * v23 <= v22 + 1)
              v24 = v22 + 1;
            if (v23 >= 0x555555555555555)
              v25 = 0xAAAAAAAAAAAAAAALL;
            else
              v25 = v24;
            v43 = (char *)this + 176;
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v25);
              v28 = v27;
            }
            else
            {
              v26 = 0;
              v28 = 0;
            }
            v29 = &v26[24 * v22];
            *(_DWORD *)v29 = v12;
            *((_DWORD *)v29 + 1) = v15;
            *((_DWORD *)v29 + 2) = v16;
            *((_QWORD *)v29 + 2) = v17;
            v31 = *((_QWORD *)this + 20);
            v30 = *((_QWORD *)this + 21);
            if (v30 == v31)
            {
              v36 = vdupq_n_s64(v30);
              v32 = v29;
            }
            else
            {
              v32 = v29;
              do
              {
                v33 = *(_QWORD *)(v30 - 24);
                v30 -= 24;
                v34 = *(_DWORD *)(v30 + 8);
                *((_QWORD *)v32 - 3) = v33;
                v32 -= 24;
                *((_DWORD *)v32 + 2) = v34;
                v35 = *(_QWORD *)(v30 + 16);
                *(_QWORD *)(v30 + 16) = 0;
                *((_QWORD *)v32 + 2) = v35;
              }
              while (v30 != v31);
              v36 = *((int64x2_t *)this + 10);
            }
            v20 = v29 + 24;
            *((_QWORD *)this + 20) = v32;
            *((_QWORD *)this + 21) = v29 + 24;
            v41 = v36;
            v37 = *((_QWORD *)this + 22);
            *((_QWORD *)this + 22) = &v26[24 * v28];
            v42 = v37;
            v40 = v36.i64[0];
            std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v40);
          }
          else
          {
            *(_DWORD *)v19 = v12;
            *(_DWORD *)(v19 + 4) = v15;
            *(_DWORD *)(v19 + 8) = v16;
            *(_QWORD *)(v19 + 16) = v17;
            v20 = (char *)(v19 + 24);
          }
          *((_QWORD *)this + 21) = v20;

        }
        result = COERCE_DOUBLE(__PAIR64__(v38, v39));
        *((_QWORD *)this + 19) = __PAIR64__(v38, v39);
      }
    }
  }
  return result;
}

void sub_226942F1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n64 Renderer::DrawLine(uint64_t a1, int a2, __n64 result, float32x2_t a4, float a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  uint64_t v13;
  float32x2_t v14;
  float32x2_t v15;
  int32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  uint64_t v19;
  _WORD *v20;

  v5 = *(_QWORD *)(a1 + 112);
  if (v5)
  {
    v6 = *(_DWORD *)(a1 + 136);
    v7 = *(int *)(a1 + 140);
    v8 = v5 + 20 * v6;
    v9 = vadd_f32((float32x2_t)result.n64_u64[0], (float32x2_t)0x3F0000003F000000);
    v10 = vadd_f32(a4, (float32x2_t)0x3F0000003F000000);
    v11 = vsub_f32(v10, v9);
    v12 = vmul_f32(v11, v11);
    v12.i32[0] = vadd_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 1)).u32[0];
    v13 = *(_QWORD *)(a1 + 120);
    v14 = vrsqrte_f32((float32x2_t)v12.u32[0]);
    v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14)));
    v16 = (int32x2_t)vmul_n_f32(vmul_n_f32(v11, vmul_f32(v15, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v15, v15))).f32[0]), a5 * 0.5);
    v17 = (float32x2_t)vrev64_s32(v16);
    v18 = vadd_f32(v9, v17);
    result.n64_u64[0] = (unint64_t)vsub_f32(v9, v17);
    v19 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)v8 = __PAIR64__(result.n64_u32[1], v18.u32[0]);
    *(_QWORD *)(v8 + 8) = v19;
    *(_DWORD *)(v8 + 16) = a2;
    *(_DWORD *)(v8 + 20) = vadd_f32(v10, v17).u32[0];
    *(float *)(v8 + 24) = v10.f32[1] - *(float *)v16.i32;
    *(_QWORD *)(v8 + 28) = v19;
    *(_DWORD *)(v8 + 36) = a2;
    *(_DWORD *)(v8 + 40) = vsub_f32(v10, v17).u32[0];
    *(float *)(v8 + 44) = v10.f32[1] + *(float *)v16.i32;
    *(_QWORD *)(v8 + 48) = v19;
    result.n64_u32[1] = v18.u32[1];
    *(_DWORD *)(v8 + 56) = a2;
    v20 = (_WORD *)(v13 + 2 * v7);
    *(__n64 *)(v8 + 60) = result;
    *(_QWORD *)(v8 + 68) = v19;
    *(_DWORD *)(v8 + 76) = a2;
    *v20 = v6;
    v20[1] = v6 + 1;
    v20[2] = v6 + 2;
    v20[3] = v6;
    v20[4] = v6 + 2;
    v20[5] = v6 + 3;
    *(_DWORD *)(a1 + 136) = v6 + 4;
    *(_DWORD *)(a1 + 140) = v7 + 6;
  }
  return result;
}

void Renderer::DrawLines(uint64_t a1, int8x16_t *a2, int a3, int a4, float a5)
{
  uint64_t v10;
  int8x16_t v11;

  if (*(_QWORD *)(a1 + 112)
    && *(_DWORD *)(a1 + 136) + 4 * a3 < *(_DWORD *)(a1 + 128)
    && *(_DWORD *)(a1 + 140) + 6 * a3 < *(_DWORD *)(a1 + 132)
    && a3 >= 1)
  {
    v10 = a3;
    do
    {
      v11 = *a2++;
      Renderer::DrawLine(a1, a4, *(__n64 *)v11.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL), a5);
      --v10;
    }
    while (v10);
  }
}

void Renderer::DrawGraph(uint64_t a1, uint64_t a2, int a3, int a4, int a5, float a6, float a7, float a8, float32x2_t a9, __n128 a10)
{
  int v14;
  int v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float32x2_t v25;
  float v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float32x2_t v31;
  unint64_t v32;
  __n128 v33;

  if (a3 >= 1 && *(_QWORD *)(a1 + 112))
  {
    v31 = vsub_f32((float32x2_t)a10.n128_u64[0], a9);
    v14 = (int)v31.f32[0];
    if ((int)v31.f32[0] >= a3)
      v14 = a3;
    if (v14 >= 2)
    {
      v19 = v14 - 1;
      v20 = 1.0 / (float)(v14 - 1);
      v21 = 1.0 / (float)(a7 - a6);
      v22 = v21 * (float)(*(float *)(a2 + 4 * ((a4 + 1) % a3)) - a6);
      v23 = 1.0 - v22;
      if (v22 > 1.0)
        v23 = 0.0;
      if (v22 >= 0.0)
        v24 = v23;
      else
        v24 = 1.0;
      v25.i32[0] = 0;
      v25.f32[1] = v24;
      v26 = (float)(a3 - 1);
      a10.n128_u32[0] = 0;
      do
      {
        a10.n128_f32[0] = v20 + a10.n128_f32[0];
        v27 = (int)(float)((float)(a10.n128_f32[0] * v26) + 0.5);
        if (v27 < 0 || v27 >= a3)
          Renderer::DrawGraph();
        v28 = v21 * (float)(*(float *)(a2 + 4 * ((v27 + a4) % a3)) - a6);
        v29 = 1.0 - v28;
        if (v28 > 1.0)
          v29 = 0.0;
        if (v28 >= 0.0)
          v30 = v29;
        else
          v30 = 1.0;
        v32 = __PAIR64__(LODWORD(v30), a10.n128_u32[0]);
        v33 = a10;
        Renderer::DrawLine(a1, a5, (__n64)vmla_f32(a9, v31, v25), vmla_f32(a9, v31, (float32x2_t)__PAIR64__(LODWORD(v30), a10.n128_u32[0])), a8);
        v25 = (float32x2_t)v32;
        a10 = v33;
        --v19;
      }
      while (v19);
    }
  }
}

void Renderer::DrawRoundedRect(Renderer *this, float a2, float a3, float32x2_t a4, float32_t a5, double a6, int a7)
{
  uint64_t v11;
  float32x2_t v12;
  float32x2_t v13;
  uint64_t v14;
  float32x2_t v15;
  float32x2_t v16;
  uint64_t i;
  uint64_t j;
  int v19;
  uint64_t Ptr;
  uint64_t v21;
  _WORD *v22;
  float32x2_t v23;
  float32x2_t *v24;
  int v25;
  int k;
  id v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int64x2_t v46;
  uint64_t v47;
  float v48;
  __int32 v49;
  double v50;
  uint64_t v51;
  int64x2_t v52;
  uint64_t v53;
  char *v54;
  float32x2_t v55[20];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if ((*((_DWORD *)this + 2) & 0x80000000) == 0)
  {
    if (Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::onceToken != -1)
    {
      v49 = a4.i32[0];
      v50 = a6;
      v48 = a5;
      dispatch_once(&Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::onceToken, &__block_literal_global);
      a5 = v48;
      a4.i32[0] = v49;
      a6 = v50;
    }
    v11 = 0;
    a4.f32[1] = a5;
    v12 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    v13 = vsub_f32(a4, v12);
    do
    {
      v55[v11] = vmla_f32(v13, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[v11]);
      ++v11;
    }
    while (v11 != 5);
    v14 = 0;
    v16.i32[1] = v13.i32[1];
    do
    {
      v16.f32[0] = a2 + *(float *)&a6;
      v55[v14 + 5] = vmla_f32(v16, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[v14 + 4]);
      ++v14;
    }
    while (v14 != 5);
    for (i = 0; i != 5; ++i)
    {
      v15.f32[0] = a2 + *(float *)&a6;
      v15.f32[1] = a3 + *(float *)&a6;
      v55[i + 10] = vmla_f32(v15, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[i + 8]);
    }
    for (j = 15; j != 20; ++j)
    {
      v13.f32[1] = a3 + *(float *)&a6;
      v55[j] = vmla_f32(v13, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[((_BYTE)j - 3) & 0xF]);
    }
    v19 = *((_DWORD *)this + 48);
    Ptr = CDynamicBuffer::GetPtr((Renderer *)((char *)this + 184), *((_DWORD *)this + 2), 768);
    v21 = 0;
    v22 = (_WORD *)(Ptr + 512);
    v23 = *(float32x2_t *)((char *)this + 56);
    v24 = (float32x2_t *)(Ptr + 16);
    do
    {
      v24[-2] = v55[v21];
      v24[-1] = v23;
      v24->i32[0] = a7;
      v24 = (float32x2_t *)((char *)v24 + 20);
      ++v21;
    }
    while (v21 != 20);
    v25 = v19 + 512;
    for (k = 2; k != 20; ++k)
    {
      *v22 = 0;
      v22[1] = k - 1;
      v22[2] = k;
      v22 += 3;
    }
    v27 = **((id **)this + 2);
    v28 = *((_QWORD *)this + 22);
    v29 = *((_QWORD *)this + 21);
    if (v29 >= v28)
    {
      v31 = *((_QWORD *)this + 20);
      v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - v31) >> 3);
      if (v32 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
      v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v31) >> 3);
      v34 = 2 * v33;
      if (2 * v33 <= v32 + 1)
        v34 = v32 + 1;
      if (v33 >= 0x555555555555555)
        v35 = 0xAAAAAAAAAAAAAAALL;
      else
        v35 = v34;
      v54 = (char *)this + 176;
      if (v35)
      {
        v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v35);
        v38 = v37;
      }
      else
      {
        v36 = 0;
        v38 = 0;
      }
      v39 = &v36[24 * v32];
      *(_DWORD *)v39 = v19;
      *((_DWORD *)v39 + 1) = v25;
      *((_DWORD *)v39 + 2) = 54;
      *((_QWORD *)v39 + 2) = v27;
      v41 = *((_QWORD *)this + 20);
      v40 = *((_QWORD *)this + 21);
      if (v40 == v41)
      {
        v46 = vdupq_n_s64(v40);
        v42 = v39;
      }
      else
      {
        v42 = v39;
        do
        {
          v43 = *(_QWORD *)(v40 - 24);
          v40 -= 24;
          v44 = *(_DWORD *)(v40 + 8);
          *((_QWORD *)v42 - 3) = v43;
          v42 -= 24;
          *((_DWORD *)v42 + 2) = v44;
          v45 = *(_QWORD *)(v40 + 16);
          *(_QWORD *)(v40 + 16) = 0;
          *((_QWORD *)v42 + 2) = v45;
        }
        while (v40 != v41);
        v46 = *((int64x2_t *)this + 10);
      }
      v30 = v39 + 24;
      *((_QWORD *)this + 20) = v42;
      *((_QWORD *)this + 21) = v39 + 24;
      v52 = v46;
      v47 = *((_QWORD *)this + 22);
      *((_QWORD *)this + 22) = &v36[24 * v38];
      v53 = v47;
      v51 = v46.i64[0];
      std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v51);
    }
    else
    {
      *(_DWORD *)v29 = v19;
      *(_DWORD *)(v29 + 4) = v25;
      *(_DWORD *)(v29 + 8) = 54;
      *(_QWORD *)(v29 + 16) = v27;
      v30 = (char *)(v29 + 24);
    }
    *((_QWORD *)this + 21) = v30;

  }
}

void sub_226943594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float ___ZN8Renderer15DrawRoundedRectEfffffj_block_invoke()
{
  uint64_t i;
  float result;
  __float2 v2;

  for (i = 0; i != 16; ++i)
  {
    v2 = __sincospif_stret((float)((float)(int)i * 0.0625) + (float)((float)(int)i * 0.0625));
    result = v2.__sinval;
    Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[i] = __PAIR64__(LODWORD(v2.__sinval), LODWORD(v2.__cosval));
  }
  return result;
}

__n64 Renderer::MeasureStringSize(Renderer *this, const char *a2)
{
  float v2;
  __n64 result;
  float v4;
  float v5;
  int v6;
  int v7;

  v2 = 0.0;
  result.n64_u32[0] = -8388609;
  v4 = *((float *)this + 12);
  v5 = -3.4028e38;
  while (1)
  {
    v7 = *(unsigned __int8 *)a2++;
    v6 = v7;
    if (v7 != 10)
      break;
    v4 = *((float *)this + 12) + v4;
    v2 = 0.0;
LABEL_6:
    if (result.n64_f32[0] <= v2)
      result.n64_f32[0] = v2;
    if (v5 <= v4)
      v5 = v4;
  }
  if (v6)
  {
    v2 = v2 + *(float *)(*((_QWORD *)this + 4) + 28 * ((char)v6 - *((_DWORD *)this + 10)) + 16);
    goto LABEL_6;
  }
  result.n64_f32[1] = v5;
  return result;
}

uint64_t CDynamicBuffer::GetPtr(CDynamicBuffer *this, unsigned int a2, int a3)
{
  char *v5;
  void **v6;
  void *v7;
  id v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  size_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (char *)this + 8 * a2;
  v7 = (void *)*((_QWORD *)v5 + 2);
  v6 = (void **)(v5 + 16);
  v8 = v7;
  v9 = objc_msgSend(v8, "length");
  v10 = (a3 + 255) & 0xFFFFFF00;
  v11 = *((_DWORD *)this + 2) + v10;
  if (v8)
    v12 = v9 >= v11;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = (void *)MEMORY[0x22769FE38](v9);
    v14 = (void *)objc_msgSend(*(id *)this, "newBufferWithLength:options:", v11, 0);
    v15 = objc_msgSend(v8, "length");
    if (v15 && *((_DWORD *)this + 2))
      memcpy((void *)objc_msgSend(objc_retainAutorelease(v14), "contents"), (const void *)objc_msgSend(objc_retainAutorelease(v8), "contents"), v15);
    v16 = v14;

    v17 = *v6;
    *v6 = v16;

    objc_autoreleasePoolPop(v13);
    v8 = v16;
  }
  v18 = objc_retainAutorelease(v8);
  v19 = objc_msgSend(v18, "contents");
  v20 = *((unsigned int *)this + 2);
  v21 = v19 + v20;
  *((_DWORD *)this + 2) = v20 + v10;

  return v21;
}

void sub_226943784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EE46DE0, MEMORY[0x24BEDAAF0]);
}

void sub_22694380C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::find<Renderer::SPiplelinesDescriptor>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = v3 & (*(_QWORD *)&v2 + 4095);
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1])
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__emplace_unique_key_args<Renderer::SPiplelinesDescriptor,std::pair<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  _QWORD *v13;
  uint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v6 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = v6 & (v7 + 4095);
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == *a2 && i[3] == a2[1])
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  v14 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 16) = 0;
  i[4] = v14;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__rehash<true>(a1, v20);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *i = *v22;
LABEL_42:
    *v22 = i;
    goto LABEL_43;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v21 + 8 * v3) = v13;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7)
        v23 %= v7;
    }
    else
    {
      v23 &= v7 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_226943C0C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

objc_object *MTLHud_objc_unwrap(objc_object *a1)
{
  objc_object *v1;
  SEL v2;
  uint64_t v3;

  v1 = a1;
  v2 = NSSelectorFromString(CFSTR("baseObject"));
  while ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(objc_object *, SEL))-[objc_object methodForSelector:](v1, "methodForSelector:", v2))(v1, v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (objc_object *)v3;
  }
  return v1;
}

void sub_226943F1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MTLHudIsInternalInstall(void)
{
  if (MTLHudIsInternalInstall(void)::__onceToken != -1)
    dispatch_once(&MTLHudIsInternalInstall(void)::__onceToken, &__block_literal_global_0);
  return MTLHudIsInternalInstall(void)::__internalInstall;
}

uint64_t ___Z23MTLHudIsInternalInstallv_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  MTLHudIsInternalInstall(void)::__internalInstall = result;
  return result;
}

uint64_t MTLHudIsSideLoadedApp(void)
{
  if (MTLHudIsSideLoadedApp(void)::__onceToken != -1)
    dispatch_once(&MTLHudIsSideLoadedApp(void)::__onceToken, &__block_literal_global_4);
  return MTLHudIsSideLoadedApp(void)::__isSideloaded;
}

void ___Z21MTLHudIsSideLoadedAppv_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appStoreReceiptURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "containsString:", CFSTR("sandboxReceipt")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v3, "containsString:", CFSTR("CoreSimulator"));
  MTLHudIsSideLoadedApp(void)::__isSideloaded = v2;

}

void sub_226944060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t MTLHudIsProcessTranslated(void)
{
  return 0;
}

uint64_t MTLHudIsBlastDoor(void)
{
  if (MTLHudIsBlastDoor(void)::onceToken != -1)
    dispatch_once(&MTLHudIsBlastDoor(void)::onceToken, &__block_literal_global_9);
  return MTLHudIsBlastDoor(void)::isBlastDoor;
}

void nextDrawableCommon(CAMetalLayer *a1)
{
  CAMetalLayer *v1;
  CAMetalLayer *v2;
  CAMetalLayer *v3;

  v1 = a1;
  v3 = v1;
  if (nextDrawableCommon(CAMetalLayer *)::callCount < 4)
    ++nextDrawableCommon(CAMetalLayer *)::callCount;
  else
    Overlay::Init((Overlay *)v1, v2);

}

void sub_2269441AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void InitInterpose(void)
{
  dispatch_time_t v0;

  if ((MTLHudIsBlastDoor() & 1) == 0)
  {
    v0 = dispatch_time(0, 0);
    dispatch_after(v0, MEMORY[0x24BDAC9B8], &__block_literal_global_1);
  }
}

void ___Z13InitInterposev_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_method *InstanceMethod;
  objc_method *v10;
  IMP Implementation;
  void *v12;
  void (*v13)(void);
  const char *TypeEncoding;
  objc_class *v15;
  objc_class *Class;
  void *v17;
  _QWORD v18[7];

  v0 = (void *)MEMORY[0x22769FE38]();
  v1 = MTLCreateSystemDefaultDevice();
  v2 = (void *)objc_msgSend(v1, "newCommandQueue");
  objc_msgSend(v2, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commit");
  v4 = (objc_class *)objc_opt_class();
  replaceMethod<void>(v4, sel_commit, (uint64_t)MTLCommandBuffer_commit);
  v5 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v5, sel_nextDrawable, (uint64_t)CAMetalLayer_nextDrawable);
  v6 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v6, sel_drawable, (uint64_t)CAMetalDisplayLinkUpdate_drawable);
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_shimDrawable_))
  {
    v7 = (objc_class *)objc_opt_class();
    if (sel_shimDrawable_)
    {
      v8 = v7;
      if (v7)
      {
        InstanceMethod = class_getInstanceMethod(v7, sel_shimDrawable_);
        v10 = InstanceMethod;
        if (InstanceMethod)
        {
          Implementation = method_getImplementation(InstanceMethod);
          v17 = v0;
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = ___ZL13replaceMethodIU8__strongP11objc_objectJU8__strongPU26objcproto15CAMetalDrawable11objc_objectEEvP10objc_classP13objc_selectorPFT_PFvvES1_S9_DpT0_E_block_invoke;
          v18[3] = &__block_descriptor_56_e30__24__0_8___CAMetalDrawable__16l;
          v18[4] = CAMetalLayer_shimDrawable;
          v18[5] = Implementation;
          v18[6] = sel_shimDrawable_;
          v12 = (void *)MEMORY[0x22769FF94](v18);
          v13 = imp_implementationWithBlock(v12);

          TypeEncoding = method_getTypeEncoding(v10);
          v0 = v17;
          class_replaceMethod(v8, sel_shimDrawable_, v13, TypeEncoding);
        }
      }
    }
  }
  v15 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v15, sel_nextDrawable, (uint64_t)CAMetalLayer_nextDrawable);
  Class = objc_getClass("CAMetalDrawable");
  replaceMethod<void>(Class, sel_present, (uint64_t)CAMetalDrawable_present);
  replaceMethod<void,double>(sel_presentAtTime_, (uint64_t)CAMetalDrawable_presentAtTime);
  replaceMethod<void,double>(sel_presentAfterMinimumDuration_, (uint64_t)CAMetalDrawable_presentAfterMinimumDuration);

  objc_autoreleasePoolPop(v0);
}

void sub_2269443FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

objc_class *replaceMethod<void>(objc_class *result, SEL name, uint64_t a3)
{
  objc_class *v5;
  objc_method *v6;
  IMP Implementation;
  void *v8;
  void (*v9)(void);
  const char *TypeEncoding;
  _QWORD v11[7];

  if (result && name)
  {
    v5 = result;
    result = class_getInstanceMethod(result, name);
    if (result)
    {
      v6 = result;
      Implementation = method_getImplementation(result);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = ___ZL13replaceMethodIvJEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke;
      v11[3] = &__block_descriptor_56_e8_v16__0_8l;
      v11[4] = a3;
      v11[5] = Implementation;
      v11[6] = name;
      v8 = (void *)MEMORY[0x22769FF94](v11);
      v9 = imp_implementationWithBlock(v8);

      TypeEncoding = method_getTypeEncoding(v6);
      return (objc_class *)class_replaceMethod(v5, name, v9, TypeEncoding);
    }
  }
  return result;
}

void sub_2269444F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MTLCommandBuffer_commit(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  Overlay *v5;
  unint64_t v6;
  objc_object *v7;

  v7 = a2;
  v5 = (Overlay *)objc_msgSend((id)_sharedCaptureManager, "isCapturing");
  if ((v5 & 1) == 0)
  {
    v6 = Overlay::Instance(v5);
    if (v6)
      Overlay::onCommandBufferCommit(v6, v7);
  }
  a1(v7, a3);

}

void sub_226944564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

objc_class *replaceMethod<objc_object * {__strong}>(objc_class *result, SEL name, uint64_t a3)
{
  objc_class *v5;
  objc_method *v6;
  IMP Implementation;
  void *v8;
  void (*v9)(void);
  const char *TypeEncoding;
  _QWORD v11[7];

  if (result && name)
  {
    v5 = result;
    result = class_getInstanceMethod(result, name);
    if (result)
    {
      v6 = result;
      Implementation = method_getImplementation(result);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = ___ZL13replaceMethodIU8__strongP11objc_objectJEEvP10objc_classP13objc_selectorPFT_PFvvES1_S6_DpT0_E_block_invoke;
      v11[3] = &__block_descriptor_56_e8__16__0_8l;
      v11[4] = a3;
      v11[5] = Implementation;
      v11[6] = name;
      v8 = (void *)MEMORY[0x22769FF94](v11);
      v9 = imp_implementationWithBlock(v8);

      TypeEncoding = method_getTypeEncoding(v6);
      return (objc_class *)class_replaceMethod(v5, name, v9, TypeEncoding);
    }
  }
  return result;
}

void sub_22694463C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CAMetalLayer_nextDrawable(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  objc_object *v5;
  void *v6;

  v5 = a2;
  nextDrawableCommon((CAMetalLayer *)v5);
  a1(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_22694469C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CAMetalDisplayLinkUpdate_drawable(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  objc_object *v5;
  void *v6;

  v5 = a2;
  nextDrawableCommon((CAMetalLayer *)v5);
  a1(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_226944700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CAMetalLayer_shimDrawable(void (*a1)(CAMetalLayer *, uint64_t, id), void *a2, uint64_t a3, void *a4)
{
  CAMetalLayer *v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a4;
  nextDrawableCommon(v7);
  a1(v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_22694477C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CAMetalDrawable_present(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  Overlay *v5;
  unint64_t v6;
  objc_object *v7;

  v7 = a2;
  v5 = (Overlay *)objc_msgSend((id)_sharedCaptureManager, "isCapturing");
  if ((v5 & 1) == 0)
  {
    v6 = Overlay::Instance(v5);
    if (v6)
      Overlay::onPresent(v6, v7);
  }
  a1(v7, a3);

}

void sub_2269447F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

objc_class *replaceMethod<void,double>(const char *a1, uint64_t a2)
{
  objc_class *result;
  objc_class *v5;
  objc_method *v6;
  IMP Implementation;
  void *v8;
  void (*v9)(void);
  const char *TypeEncoding;
  _QWORD v11[7];

  result = objc_getClass("CAMetalDrawable");
  if (a1)
  {
    v5 = result;
    if (result)
    {
      result = class_getInstanceMethod(result, a1);
      if (result)
      {
        v6 = result;
        Implementation = method_getImplementation(result);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = ___ZL13replaceMethodIvJdEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke;
        v11[3] = &__block_descriptor_56_e11_v24__0_8d16l;
        v11[4] = a2;
        v11[5] = Implementation;
        v11[6] = a1;
        v8 = (void *)MEMORY[0x22769FF94](v11);
        v9 = imp_implementationWithBlock(v8);

        TypeEncoding = method_getTypeEncoding(v6);
        return (objc_class *)class_replaceMethod(v5, a1, v9, TypeEncoding);
      }
    }
  }
  return result;
}

void sub_2269448E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CAMetalDrawable_presentAtTime(void (*a1)(objc_object *, objc_selector *, double), objc_object *a2, objc_selector *a3, double a4)
{
  Overlay *v7;
  unint64_t v8;
  objc_object *v9;

  v9 = a2;
  v7 = (Overlay *)objc_msgSend((id)_sharedCaptureManager, "isCapturing");
  if ((v7 & 1) == 0)
  {
    v8 = Overlay::Instance(v7);
    if (v8)
      Overlay::onPresent(v8, v9);
  }
  a1(v9, a3, a4);

}

void sub_226944964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CAMetalDrawable_presentAfterMinimumDuration(void (*a1)(objc_object *, objc_selector *, double), objc_object *a2, objc_selector *a3, double a4)
{
  Overlay *v7;
  unint64_t v8;
  objc_object *v9;

  v9 = a2;
  v7 = (Overlay *)objc_msgSend((id)_sharedCaptureManager, "isCapturing");
  if ((v7 & 1) == 0)
  {
    v8 = Overlay::Instance(v7);
    if (v8)
      Overlay::onPresent(v8, v9);
  }
  a1(v9, a3, a4);

}

void sub_2269449F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL13replaceMethodIvJEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x22769FE38]();
  (*(void (**)(_QWORD, id, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v3);

}

void sub_226944A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ___ZL13replaceMethodIU8__strongP11objc_objectJEEvP10objc_classP13objc_selectorPFT_PFvvES1_S6_DpT0_E_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x22769FE38]();
  (*(void (**)(_QWORD, id, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

void sub_226944AC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZL13replaceMethodIU8__strongP11objc_objectJU8__strongPU26objcproto15CAMetalDrawable11objc_objectEEvP10objc_classP13objc_selectorPFT_PFvvES1_S9_DpT0_E_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x22769FE38]();
  (*(void (**)(_QWORD, id, _QWORD, id))(a1 + 32))(*(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);

  return v8;
}

void sub_226944B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL13replaceMethodIvJdEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)MEMORY[0x22769FE38]();
  (*(void (**)(_QWORD, id, _QWORD, double))(a1 + 32))(*(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48), a3);
  objc_autoreleasePoolPop(v5);

}

void sub_226944BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_226944C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226944DE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226944FCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22694547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2269455F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22694564C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2269457AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_22694586C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2269459B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_226945A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_226945C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_226945D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226945DA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22694600C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id obj)
{
  void *v12;
  void *v13;
  void *v14;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

CHistoryRecord *CHistoryRecord::UpdateMinMax(CHistoryRecord *this)
{
  int v1;
  float v2;
  float v3;
  uint64_t i;
  float v5;
  float v6;
  float v7;

  v1 = 0;
  v2 = 0.0;
  v3 = 999.99;
  for (i = 20; i != 500; i += 4)
  {
    v5 = *(float *)((char *)&this->m_currentTime + i);
    v6 = fminf(v3, v5);
    v7 = fmaxf(v2, v5);
    if (v5 > 0.0)
    {
      v3 = v6;
      v2 = v7;
      ++v1;
    }
  }
  if (!v1)
  {
    v2 = 0.0;
    v3 = 0.0;
  }
  this->m_maxValue = v2;
  this->m_minValue = v3;
  return this;
}

unint64_t Overlay::Instance(Overlay *this)
{
  return atomic_load(&Overlay::sharedInstance);
}

void Overlay::Init(Overlay *this, CAMetalLayer *a2)
{
  Overlay *v2;
  uint64_t v3;
  Overlay *v4;
  _QWORD block[4];
  Overlay *v6;

  v2 = this;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN7Overlay4InitEP12CAMetalLayer_block_invoke;
  block[3] = &unk_24EE47268;
  v6 = v2;
  v3 = Overlay::Init(CAMetalLayer *)::onceToken;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&Overlay::Init(CAMetalLayer *)::onceToken, block);

}

void ___ZN7Overlay4InitEP12CAMetalLayer_block_invoke(uint64_t a1)
{
  void *v2;
  Overlay *v3;

  v2 = (void *)MEMORY[0x22769FE38]();
  v3 = (Overlay *)operator new();
  Overlay::Overlay(v3, *(CAMetalLayer **)(a1 + 32));
  atomic_store((unint64_t)v3, &Overlay::sharedInstance);
  objc_autoreleasePoolPop(v2);
}

void sub_2269462B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22769FCB8](v1, 0x10F0C40CF4011C9);
  _Unwind_Resume(a1);
}

void Overlay::Overlay(Overlay *this, CAMetalLayer *a2)
{
  CAMetalLayer *v3;
  uint64_t v4;
  id *v5;
  char *v6;
  void **v7;
  uint64_t v8;
  char *v9;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  _BOOL8 v30;
  char *v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  char *v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  void *v41;
  void *v42;
  char *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  float v50;
  _LayerHUDPropertiesListener *v51;
  void *v52;
  char v53[32];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = 0;
  *((_QWORD *)this + 1) = 0;
  v5 = (id *)((char *)this + 8);
  *(_WORD *)this = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 4) = 1;
  *((_DWORD *)this + 10) = 0;
  do
  {
    v6 = (char *)this + v4;
    *((_QWORD *)v6 + 11) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *(_QWORD *)((char *)this + v4 + 80) = (char *)this + v4 + 88;
    v4 += 56;
  }
  while (v4 != 168);
  v7 = (void **)((char *)this + 408);
  v8 = 216;
  do
  {
    v9 = (char *)this + v8;
    *(_QWORD *)v9 = 850045863;
    *(_OWORD *)(v9 + 8) = 0uLL;
    *(_OWORD *)(v9 + 24) = 0uLL;
    *(_OWORD *)(v9 + 40) = 0uLL;
    *((_QWORD *)v9 + 7) = 0;
    v8 += 64;
  }
  while (v9 + 64 != (char *)v7);
  *((_QWORD *)this + 243) = 0;
  bzero((char *)this + 408, 0x5FCuLL);
  *((_DWORD *)this + 488) = -1;
  *((_QWORD *)this + 246) = 0;
  *((_QWORD *)this + 245) = 0;
  *(_OWORD *)((char *)this + 2008) = 0u;
  *(_OWORD *)((char *)this + 2024) = 0u;
  *((_QWORD *)this + 255) = 0;
  *((_DWORD *)this + 512) = 1065353216;
  *(_OWORD *)((char *)this + 2056) = 0u;
  *(_OWORD *)((char *)this + 2072) = 0u;
  *((_QWORD *)this + 261) = 0;
  __asm { FMOV            V1.2S, #-1.0 }
  *((_QWORD *)this + 262) = _D1;
  *((_QWORD *)this + 268) = 0;
  *((_QWORD *)this + 270) = 0;
  *((_QWORD *)this + 269) = 0;
  *(_OWORD *)((char *)this + 2104) = 0u;
  *(_OWORD *)((char *)this + 2120) = 0u;
  *((_DWORD *)this + 534) = 0;
  *((_DWORD *)this + 542) = 1065353216;
  *((_QWORD *)this + 288) = 0;
  *((_OWORD *)this + 143) = 0u;
  *((_OWORD *)this + 142) = 0u;
  *((_OWORD *)this + 141) = 0u;
  *((_OWORD *)this + 140) = 0u;
  *((_OWORD *)this + 139) = 0u;
  *((_OWORD *)this + 138) = 0u;
  *((_OWORD *)this + 137) = 0u;
  *((_OWORD *)this + 136) = 0u;
  +[_CADeveloperHUDProperties instance](_CADeveloperHUDProperties, "instance");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *v5;
  *v5 = (id)v15;

  v17 = objc_opt_new();
  v18 = *v7;
  *v7 = (void *)v17;

  for (i = 0; i != 168; i += 56)
  {
    std::__tree<std::pair<double,double>>::destroy((uint64_t)this + i + 80, *(_QWORD **)((char *)this + i + 88));
    *(_QWORD *)((char *)this + i + 80) = (char *)this + i + 88;
    *(_QWORD *)((char *)this + i + 88) = 0;
    *(_QWORD *)((char *)this + i + 96) = 0;
  }
  mach_timebase_info((mach_timebase_info_t)this + 3);
  objc_msgSend(MEMORY[0x24BDDD500], "sharedCaptureManager");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)_sharedCaptureManager;
  _sharedCaptureManager = v20;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "processName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_retainAutorelease(v23);
  strncpy((char *)this + 2184, (const char *)objc_msgSend(v24, "UTF8String"), 0x40uLL);
  -[CAMetalLayer device](v3, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy((char *)this + 2248, (const char *)objc_msgSend(v26, "UTF8String"), 0x40uLL);

  if (Renderer::Init((Overlay *)((char *)this + 1944), v3))
  {
    memset(v53, 88, 27);
    *((__n64 *)this + 272) = Renderer::MeasureStringSize((Overlay *)((char *)this + 1944), v53);
    NSSelectorFromString(CFSTR("developerHUDProperties"));
    *(_BYTE *)this = objc_opt_respondsToSelector() & 1;
    if ((MTLHudIsInternalInstall() & 1) != 0 || MTLHudIsSideLoadedApp())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("MetalForceHudEnabled"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = objc_msgSend(v28, "BOOLValue");
      else
        v29 = 0;
      *((_BYTE *)this + 1) = v29;

    }
    if (*((_BYTE *)this + 1))
    {
      v30 = 1;
    }
    else
    {
      v31 = getenv("MTL_HUD_ENABLED");
      if (!v31)
        v31 = "";
      v30 = atoi(v31) != 0;
    }
    objc_msgSend(*v5, "setEnabled:", v30);
    if (*(_BYTE *)this)
    {
      v32 = *v5;
      -[CAMetalLayer developerHUDProperties](v3, "developerHUDProperties");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("mode"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setEnabled:", objc_msgSend(v34, "isEqualToString:", CFSTR("default")) | objc_msgSend(v32, "enabled"));

    }
    if (*((_BYTE *)this + 1))
    {
      v35 = 1;
    }
    else
    {
      v36 = getenv("MTL_HUD_LOG_ENABLED");
      if (!v36)
        v36 = "";
      v35 = atoi(v36) != 0;
    }
    objc_msgSend(*v5, "setLoggingEnabled:", v35);
    if (*(_BYTE *)this)
    {
      -[CAMetalLayer developerHUDProperties](v3, "developerHUDProperties");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("logging"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = *v5;
      objc_opt_class();
      v40 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v38, "isEqualToString:", CFSTR("default")) : 0;
      objc_msgSend(v39, "setLoggingEnabled:", v40 | objc_msgSend(v39, "loggingEnabled"));

      if (*(_BYTE *)this)
      {
        if (!objc_msgSend(*v5, "alignment"))
        {
          -[CAMetalLayer developerHUDProperties](v3, "developerHUDProperties");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("alignment"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(*v5, "setAlignment:", objc_msgSend(v42, "integerValue") & 0x1F);
          }
          else
          {
            v43 = getenv("MTL_HUD_ALIGNMENT");
            if (v43)
              objc_msgSend(*v5, "setAlignment:", atoi(v43) & 0x1F);
          }

        }
        -[CAMetalLayer developerHUDProperties](v3, "developerHUDProperties");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("positionX"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAMetalLayer developerHUDProperties](v3, "developerHUDProperties");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("positionY"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & (v47 != 0)) == 1)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*v5, "setAlignment:", 1);
              objc_msgSend(v45, "floatValue");
              v49 = v48;
              objc_msgSend(v47, "floatValue");
              objc_msgSend(*v5, "setPosition:", v49, v50);
            }
          }
        }

      }
    }
    v51 = -[_LayerHUDPropertiesListener initWithLayer:andOverlay:]([_LayerHUDPropertiesListener alloc], "initWithLayer:andOverlay:", v3, this);
    v52 = (void *)*((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v51;

  }
}

void sub_22694692C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t i;
  uint64_t j;

  Renderer::~Renderer(v4);
  for (i = 344; i != 152; i -= 64)
    std::mutex::~mutex((std::mutex *)(v1 + i));
  for (j = 0; j != -168; j -= 56)
    std::__tree<std::pair<double,double>>::destroy(v1 + j + 192, *(_QWORD **)(v1 + j + 200));

  _Unwind_Resume(a1);
}

void Renderer::~Renderer(id *this)
{
  uint64_t i;
  void **v3;

  for (i = 27; i != 24; --i)

  v3 = this + 20;
  std::vector<Renderer::SDrawCommand>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::~__hash_table((uint64_t)(this + 9));

}

void Overlay::onPresent(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  objc_object *v6;
  void *v7;
  int v8;
  float v9;
  uint64_t v10;
  double v11;
  __n128 v12;
  __n128 v13;
  int v14;
  float v15;
  uint64_t v16;
  double v17;
  double v18;
  __n128 v19;
  double v20;
  unint64_t v21;
  float v22;
  float32x2_t v23;
  double v24;
  float v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  kern_return_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  __CFString *v42;
  __n128 v43;
  __n128 v44;
  char *v45;
  int v46;
  double v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  int v51;
  int v52;
  double v53;
  double v54;
  int v55;
  double v56;
  const char *v57;
  int v58;
  double v59;
  int v60;
  double v61;
  uint64_t (*v62)(uint64_t, char *);
  int v63;
  double v64;
  float v65;
  float v66;
  double v67;
  int v68;
  double v69;
  double v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  double v76;
  int v77;
  double v78;
  BOOL v79;
  int v80;
  double v81;
  int v82;
  double v83;
  int v84;
  float v85;
  float v86;
  float v87;
  double v88;
  int v89;
  double v90;
  double v91;
  double v92;
  int v93;
  double v94;
  int v95;
  double v96;
  int v97;
  double v98;
  int v99;
  float v100;
  float v101;
  float v102;
  double v103;
  int v104;
  double v105;
  double v106;
  double v107;
  int v108;
  double v109;
  int v110;
  double v111;
  int v112;
  double v113;
  int v114;
  int v115;
  double v116;
  uint64_t v117;
  __n128 v118;
  float v119;
  __int128 v120;
  __n128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  int v125;
  int v126;
  int v127;
  double v128;
  uint64_t v129;
  int v130;
  id v131;
  float v132;
  int v133;
  int v134;
  float v135;
  __n128 v136;
  unsigned int v137;
  float32x2_t v138;
  double v139;
  float v140;
  __n128 v141;
  __n128 v142;
  __n128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  id v148;
  id v149;
  int v150;
  int v151;
  _QWORD v152[5];
  int v153;
  _QWORD block[4];
  id v155;
  uint64_t v156;
  mach_msg_type_number_t task_info_outCnt;
  char v158[128];
  char v159[28];
  char __str[28];
  integer_t task_info_out[4];
  __int128 v162;
  __int128 v163;
  unint64_t v164;
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke;
  block[3] = &unk_24EE47290;
  v156 = a1;
  v131 = v3;
  v155 = v131;
  if (Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::onceToken != -1)
    dispatch_once(&Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::onceToken, block);
  if ((objc_msgSend(*(id *)(a1 + 8), "loggingEnabled") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 8), "enabled"))
  {
    Overlay::Update((Overlay *)a1, Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber);
  }
  if ((objc_msgSend(*(id *)(a1 + 8), "enabled") & 1) == 0)
  {
    ++Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;
    goto LABEL_118;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 32);
    v152[0] = v4;
    v152[1] = 3221225472;
    v152[2] = ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke_2;
    v152[3] = &__block_descriptor_44_e23_v16__0___MTLDrawable__8l;
    v152[4] = a1;
    v153 = v5;
    objc_msgSend(v131, "addPresentedHandler:", v152);
  }
  if ((-1857283155 * Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber) <= 0x6EB3E45)
    isDrawableDetached = IsDrawableDetached(v131);
  v148 = 0;
  objc_msgSend(v131, "texture");
  v6 = (objc_object *)objc_claimAutoreleasedReturnValue();
  MTLHud_objc_unwrap(v6);
  v149 = (id)objc_claimAutoreleasedReturnValue();
  v150 = *(_DWORD *)(a1 + 32);
  v151 = Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;

  Renderer::BeginFrame(a1 + 1944, (uint64_t)&v148);
  objc_msgSend(*(id *)(a1 + 8), "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = *(float *)(a1 + 2180);
  v10 = objc_msgSend(*(id *)(a1 + 8), "alignment");
  v14 = v8 - 1;
  v15 = (float)((float)((float)((float)v14 * v9) + 12.0) + 100.0) + 12.0;
  if (v10)
    v16 = v10;
  else
    v16 = 12;
  if (v16 != 1)
  {
    LODWORD(v11) = 20.0;
    if ((v16 & 4) == 0
      || (v21 = objc_msgSend(v149, "width", v11),
          v12.n128_u64[0] = *(_QWORD *)(a1 + 2176),
          *(float *)&v11 = (float)v21 - (float)((float)(v12.n128_f32[0] + 24.0) + 20.0),
          (~(_DWORD)v16 & 6) != 0))
    {
      v13.n128_f32[0] = fmaxf(*(float *)&v11, 0.0);
    }
    else
    {
      v13.n128_f32[0] = *(float *)&v11 * 0.5;
    }
    LODWORD(v11) = 20.0;
    v142 = v13;
    if ((v16 & 0x10) != 0)
    {
      *(float *)&v11 = (float)(unint64_t)objc_msgSend(v149, "height", v11) - (float)(v15 + 24.0);
      if ((~(_DWORD)v16 & 0x18) == 0)
      {
        v12.n128_f32[0] = *(float *)&v11 * 0.5;
        v13.n128_u32[0] = v142.n128_u32[0];
LABEL_26:
        v143 = v12;
        objc_msgSend(*(id *)(a1 + 8), "setPosition:", v13.n128_f32[0], v12.n128_f32[0]);
        goto LABEL_27;
      }
      v13.n128_u32[0] = v142.n128_u32[0];
    }
    v12.n128_f32[0] = fmaxf(*(float *)&v11, 0.0);
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 8), "position");
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 8), "position");
  v19.n128_f32[0] = v18;
  v142 = v19;
  v19.n128_f32[0] = v20;
  v143 = v19;
LABEL_27:
  objc_msgSend(*(id *)(a1 + 8), "setSize:", (float)((float)(COERCE_FLOAT(*(_QWORD *)(a1 + 2176)) + 24.0) + 20.0), v15);
  v22 = v142.n128_f32[0] + COERCE_FLOAT(*(_QWORD *)(a1 + 2176));
  v23.f32[0] = v22 + 12.0;
  LODWORD(v24) = 15.0;
  Renderer::DrawRoundedRect((Renderer *)(a1 + 1944), v142.n128_f32[0] + -12.0, v143.n128_f32[0], v23, v15 + v143.n128_f32[0], v24, -1291845632);
  v135 = v142.n128_f32[0] + 6.0;
  v25 = (float)(v22 + -6.0) - (float)(v142.n128_f32[0] + 6.0);
  v133 = *(_DWORD *)(a1 + 928);
  v134 = *(_DWORD *)(a1 + 1436);
  v26 = (int)v25;
  if ((int)v25 >= 120)
    v26 = 120;
  Renderer::BeginMergedDraw(a1 + 1944, 4 * (30 * v14 + 2 * v26 + 18), 6 * (30 * v14 + 2 * v26 + 18));
  objc_msgSend(v131, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentsScale");
  v29 = v28;

  if ((1736263375 * Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber) <= 0x572620A)
  {
    task_info_outCnt = 93;
    v30 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
    v31 = (double)v164 * 0.000000953674316;
    if (v30)
      v31 = -1.0;
    processMemoryUsedMB = *(_QWORD *)&v31;
    objc_msgSend(v131, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&gpuMemoryUsedMB = (double)((unint64_t)objc_msgSend(v33, "currentAllocatedSize") >> 20);

  }
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(*(id *)(a1 + 8), "elements");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v144, v158, 16);
  if (v35)
  {
    v36 = v29;
    v37 = *(_QWORD *)v145;
    v38 = v25 / 10.0;
    v39 = 2.0;
    if (v36 > 1.0)
      v39 = 1.0;
    v132 = v39;
    v139 = v36;
    v40 = 0.3;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v145 != v37)
          objc_enumerationMutation(v34);
        v42 = *(__CFString **)(*((_QWORD *)&v144 + 1) + 8 * v41);
        v43 = v143;
        v43.n128_f32[0] = v143.n128_f32[0] + *(float *)(a1 + 2180);
        v44 = v142;
        v143 = v43;
        v44.n128_u32[1] = v43.n128_u32[0];
        *(_QWORD *)(a1 + 2096) = v44.n128_u64[0];
        if (v42 == CFSTR("com.apple.hud-label.gpu-and-resolution"))
        {
          v49 = objc_msgSend(v149, "width");
          v50 = objc_msgSend(v149, "height");
          if (v49 >= 0x3E8)
            v51 = 1;
          else
            v51 = 2;
          if (v50 < 0x3E8)
            ++v51;
          v52 = snprintf(__str, 0x1CuLL, "%-15.15s%*c[%dx%d]", (const char *)(a1 + 2248), v51, 32, v49, v50);
          v54 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v52, -1, v53);
        }
        else if (v42 == CFSTR("com.apple.hud-label.compositing-and-refresh-rate"))
        {
          v55 = snprintf(__str, 0x1CuLL, "%2.1fx ", v139);
          Renderer::DrawText((Renderer *)(a1 + 1944), __str, v55, -1, v56);
          v57 = "Direct";
          if (!isDrawableDetached)
            v57 = "Composited";
          v58 = snprintf(__str, 0x1CuLL, "%s ", v57);
          if (isDrawableDetached)
            v60 = -1;
          else
            v60 = -11969794;
          v61 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v58, v60, v59);
          if (Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen
            && (v62 = (uint64_t (*)(uint64_t, char *))objc_msgSend((id)Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen, "methodForSelector:", sel_maximumFramesPerSecond, v61), v62(Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen, sel_maximumFramesPerSecond)))
          {
            v63 = snprintf(__str, 0x1CuLL, "%*dHz");
          }
          else
          {
            v63 = snprintf(__str, 0x1CuLL, "%*c--Hz");
          }
          v54 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v63, -1, v64);
        }
        else
        {
          if (v42 == CFSTR("com.apple.hud-stat.fps"))
          {
            v65 = 1000.0 / *(float *)(a1 + 1448);
            v66 = *(float *)(a1 + 1936);
            v140 = *(float *)(a1 + 1932);
            v67 = v65;
            if (v65 >= 1000.0)
              v67 = 999.99;
            v68 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "FPS", v67);
            v70 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v68, -1, v69);
            Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -1, v70);
            v71 = 1000.0 / v66;
            v72 = v65 * v40;
            v73 = v38;
            v74 = v40;
            v75 = v65 - (float)(v65 * v40);
            v76 = v71;
            if (v71 >= 1000.0)
              v76 = 999.99;
            v77 = snprintf(__str, 0x1CuLL, "%6.2f ", v76);
            v79 = v75 <= v71;
            v40 = v74;
            v38 = v73;
            if (v79)
              v80 = -1;
            else
              v80 = -11969794;
            Renderer::DrawText((Renderer *)(a1 + 1944), __str, v77, v80, v78);
            v81 = (float)(1000.0 / v140);
            if ((float)(1000.0 / v140) >= 1000.0)
              v81 = 999.99;
            v82 = snprintf(__str, 0x1CuLL, "%6.2f", v81);
            if ((float)(v65 + v72) >= (float)(1000.0 / v140))
              v84 = -1;
            else
              v84 = -11969794;
            v47 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v82, v84, v83);
            v48 = -1;
            v46 = 1;
            v45 = "]";
            goto LABEL_103;
          }
          if (v42 == CFSTR("com.apple.hud-stat.present-interval"))
          {
            v85 = *(float *)(a1 + 1448);
            v86 = *(float *)(a1 + 1932);
            v87 = *(float *)(a1 + 1936);
            v88 = v85;
            if (v85 >= 1000.0)
              v88 = 999.99;
            v89 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "Pre", v88);
            v91 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v89, -354547, v90);
            Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -354547, v91);
            v92 = v86;
            if (v86 >= 1000.0)
              v92 = 999.99;
            v93 = snprintf(__str, 0x1CuLL, "%6.2f ", v92);
            if ((float)(v85 - (float)(v85 * v40)) <= v86)
              v95 = -354547;
            else
              v95 = -11969794;
            Renderer::DrawText((Renderer *)(a1 + 1944), __str, v93, v95, v94);
            v96 = v87;
            if (v87 >= 1000.0)
              v96 = 999.99;
            v97 = snprintf(__str, 0x1CuLL, "%6.2f", v96);
            if ((float)(v85 + (float)(v85 * v40)) >= v87)
              v99 = -354547;
            else
              v99 = -11969794;
            v47 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v97, v99, v98);
            v46 = 1;
            v45 = "]";
            v48 = -354547;
            goto LABEL_103;
          }
          if (v42 == CFSTR("com.apple.hud-stat.gpu-time"))
          {
            v100 = *(float *)(a1 + 940);
            v101 = *(float *)(a1 + 1424);
            v102 = *(float *)(a1 + 1428);
            v103 = v100;
            if (v100 >= 1000.0)
              v103 = 999.99;
            v104 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "GPU", v103);
            v106 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v104, -12463527, v105);
            Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -12463527, v106);
            v107 = v101;
            if (v101 >= 1000.0)
              v107 = 999.99;
            v108 = snprintf(__str, 0x1CuLL, "%6.2f ", v107);
            if ((float)(v100 - (float)(v100 * v40)) <= v101)
              v110 = -12463527;
            else
              v110 = -11969794;
            Renderer::DrawText((Renderer *)(a1 + 1944), __str, v108, v110, v109);
            v111 = v102;
            if (v102 >= 1000.0)
              v111 = 999.99;
            v112 = snprintf(__str, 0x1CuLL, "%6.2f", v111);
            if ((float)(v100 + (float)(v100 * v40)) >= v102)
              v114 = -12463527;
            else
              v114 = -11969794;
            v47 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v112, v114, v113);
            v46 = 1;
            v45 = "]";
            v48 = -12463527;
            goto LABEL_103;
          }
          if (v42 == CFSTR("com.apple.hud-label.memory"))
          {
            if (*(double *)&processMemoryUsedMB >= 1000.0)
              v115 = snprintf(v159, 0x1CuLL, "Mem: %6.2fGB", *(double *)&processMemoryUsedMB * 0.0009765625);
            else
              v115 = snprintf(v159, 0x1CuLL, "Mem: %6.2fMB", *(double *)&processMemoryUsedMB);
            v125 = v115;
            Renderer::DrawText((Renderer *)(a1 + 1944), v159, v115, -1, v116);
            if (*(double *)&gpuMemoryUsedMB >= 1000.0)
              v126 = snprintf(v159, 0x1CuLL, "[%.2fGB]", *(double *)&gpuMemoryUsedMB * 0.0009765625);
            else
              v126 = snprintf(v159, 0x1CuLL, "[%.2fMB]", *(double *)&gpuMemoryUsedMB);
            v127 = snprintf(__str, 0x1CuLL, "%*s %s", (26 - v125 - v126) & ~((26 - v125 - v126) >> 31), " ", v159);
            v54 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v127, -12463527, v128);
          }
          else
          {
            if (v42 != CFSTR("com.apple.hud-graph.default"))
            {
              v45 = __str;
              v46 = snprintf(__str, 0x1CuLL, "%s", (const char *)objc_msgSend(*(id *)(a1 + 8), "UTF8StringForName:"));
              v48 = -1;
LABEL_103:
              v54 = Renderer::DrawText((Renderer *)(a1 + 1944), v45, v46, v48, v47);
              goto LABEL_104;
            }
            v117 = 0;
            v44.n128_u64[0] = *(_QWORD *)(a1 + 2176);
            v118 = v43;
            v118.n128_f32[0] = v43.n128_f32[0] + (float)((float)(100.0 - v44.n128_f32[1]) + 12.0);
            v44.n128_f32[0] = (float)(v142.n128_f32[0] + v44.n128_f32[0]) + -6.0;
            v141 = v44;
            v119 = v142.n128_f32[0] + 6.0;
            do
            {
              v119 = v38 + v119;
              *(float *)&v120 = v119;
              *((float *)&v120 + 1) = v118.n128_f32[0] + -100.0;
              *((_QWORD *)&v120 + 1) = __PAIR64__(v118.n128_u32[0], LODWORD(v119));
              *(_OWORD *)&task_info_out[v117] = v120;
              v117 += 4;
            }
            while (v117 != 36);
            *(float *)&v137 = v118.n128_f32[0] + -100.0;
            v143 = v118;
            Renderer::DrawLines(a1 + 1944, (int8x16_t *)task_info_out, 9, -8355712, v132);
            v121 = v141;
            v121.n128_u32[1] = v143.n128_u32[0];
            v136 = v121;
            v138 = (float32x2_t)__PAIR64__(v137, LODWORD(v135));
            Renderer::DrawGraph(a1 + 1944, a1 + 1452, 120, v134, -1275422963, 0.0, 40.0, 3.0, v138, v121);
            Renderer::DrawGraph(a1 + 1944, a1 + 944, 120, v133, -1287531943, 0.0, 40.0, 3.0, v138, v136);
            *(float *)&v122 = v135 + -1.0;
            DWORD1(v122) = v143.n128_u32[0];
            *((float *)&v122 + 2) = v141.n128_f32[0] + 1.0;
            HIDWORD(v122) = v143.n128_u32[0];
            *(float32x2_t *)&v123 = v138;
            *((_QWORD *)&v123 + 1) = __PAIR64__(v136.n128_u32[1], v138.u32[0]);
            *(_OWORD *)task_info_out = v122;
            v162 = v123;
            *(_QWORD *)&v124 = __PAIR64__(v138.u32[1], v136.n128_u32[0]);
            *((_QWORD *)&v124 + 1) = v136.n128_u64[0];
            v163 = v124;
            Renderer::DrawLines(a1 + 1944, (int8x16_t *)task_info_out, 3, -4144960, 2.0);
          }
        }
LABEL_104:
        ++v41;
      }
      while (v41 != v35);
      v129 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v144, v158, 16, v54);
      v35 = v129;
    }
    while (v129);
  }

  Renderer::EndMergedDraw((Renderer *)(a1 + 1944));
  Renderer::EndFrame(a1 + 1944, (uint64_t)&v148);
  v130 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = (v130 + 1) % 3u;
  *(_DWORD *)(a1 + 36) = v130;
  ++Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;

LABEL_118:
}

void sub_22694795C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,void *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59)
{
  void *v59;
  void *v60;

  _Unwind_Resume(a1);
}

uint64_t ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke(uint64_t a1)
{
  uint64_t v2;
  kern_return_t v3;
  double v4;
  void *v5;
  void *v6;
  Class v7;
  void (*v8)(uint64_t, char *);
  uint64_t v9;
  void *v10;
  uint64_t result;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[36];
  unint64_t v14;

  v2 = *(_QWORD *)(a1 + 40);
  isDrawableDetached = IsDrawableDetached(*(void **)(a1 + 32));
  task_info_outCnt = 93;
  v3 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
  v4 = (double)v14 * 0.000000953674316;
  if (v3)
    v4 = -1.0;
  processMemoryUsedMB = *(_QWORD *)&v4;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&gpuMemoryUsedMB = (double)((unint64_t)objc_msgSend(v6, "currentAllocatedSize") >> 20);

  v7 = NSClassFromString(CFSTR("UIScreen"));
  Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_uiscreenClass = (uint64_t)v7;
  if (v7)
  {
    v8 = (void (*)(uint64_t, char *))-[objc_class methodForSelector:](v7, "methodForSelector:", sel_mainScreen);
    v8(Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_uiscreenClass, sel_mainScreen);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen;
    Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen = v9;

  }
  result = MTLHudIsProcessTranslated();
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(v2 + 8), "addLabel:after:", CFSTR("com.apple.hud-label.rosetta"), CFSTR("com.apple.hud-label.memory"));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v2 + 8), "updateLabel:value:", CFSTR("com.apple.hud-label.rosetta"), CFSTR("Rosetta x86_64          ---"));
  }
  return result;
}

void sub_226947B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void Overlay::Update(Overlay *this, unsigned int a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float v11;
  CHistoryRecord *v12;
  float v13;
  BOOL v14;
  uint64_t v15;
  float *v16;
  float v17;
  std::mutex *v18;
  unsigned int v19;
  char *v20;
  __int128 v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t *v31;
  uint64_t *v32;
  BOOL v33;
  double v34;
  CHistoryRecord *v35;
  float v36;
  float *v38;
  float v39;
  float v40;
  float v41;
  float *v43;
  float v44;
  float *v45;
  size_t v46;
  void (**v47)(_QWORD, float);
  int v48;
  size_t v49;
  int v50;
  const char *v51;
  int v52;
  _QWORD v53[5];
  unsigned int v54;
  __int128 v55;
  __int128 v56;
  uint64_t *v57;
  _QWORD *v58[3];

  {
    Overlay::Update(int)::prevTime = mach_absolute_time();
  }
  v5 = mach_absolute_time();
  v6 = v5;
  if (!a2)
  {
    Overlay::Update(int)::prevTime = v5;
    return;
  }
  v7 = mach_absolute_time();
  v8 = Overlay::Update(int)::prevTime;
  v10 = *((unsigned int *)this + 6);
  v9 = *((unsigned int *)this + 7);
  Overlay::Update(int)::prevTime = v6;
  if (a2 >= 3)
  {
    v11 = (double)((v7 - v8) * v10 / v9) * 0.000001;
    v12 = (CHistoryRecord *)((char *)this + 416);
    v13 = 0.0;
    v14 = v11 > 999.99 || v11 < 0.0;
    if (!v14)
      v13 = v11;
    v15 = a2 % 0x78;
    *((_DWORD *)this + 105) = v15;
    *((_DWORD *)this + 106) = v15;
    v16 = &v12->m_currentTime + v15;
    v17 = *((float *)this + 107) + (float)(v13 - v16[5]);
    *((float *)this + 107) = v17;
    v16[5] = v13;
    *((float *)this + 108) = v17 / 120.0;
    CHistoryRecord::UpdateMinMax(v12);
    v58[0] = 0;
    v58[1] = 0;
    v57 = (uint64_t *)v58;
    v18 = (std::mutex *)((char *)this + 64 * (unint64_t)*((unsigned int *)this + 8) + 216);
    std::mutex::lock(v18);
    v19 = *((_DWORD *)this + 8);
    v20 = (char *)this + 56 * v19;
    v21 = *((_OWORD *)v20 + 4);
    v55 = *((_OWORD *)v20 + 3);
    v56 = v21;
    if (&v55 != (__int128 *)(v20 + 48))
    {
      std::__tree<std::pair<double,double>>::__assign_multi<std::__tree_const_iterator<std::pair<double,double>,std::__tree_node<std::pair<double,double>,void *> *,long>>(&v57, *((_QWORD **)this + 7 * v19 + 10), (_QWORD *)this + 7 * v19 + 11);
      v19 = *((_DWORD *)this + 8);
    }
    v22 = (_QWORD *)((char *)this + 56 * v19);
    v23 = (_QWORD *)v22[11];
    v22 += 11;
    std::__tree<std::pair<double,double>>::destroy((uint64_t)(v22 - 1), v23);
    *(v22 - 1) = v22;
    *v22 = 0;
    v22[1] = 0;
    std::mutex::unlock(v18);
    v24 = v57;
    if (v57 == (uint64_t *)v58)
    {
      v34 = 0.0;
    }
    else
    {
      v25 = 0.0;
      v26 = 0.0;
      do
      {
        v27 = *((double *)v24 + 4);
        v28 = *((double *)v24 + 5);
        if (v27 < v26)
          v27 = v26;
        v29 = v28 - v27;
        v14 = v27 < v28;
        v30 = -0.0;
        if (v14)
          v30 = v29;
        if (v28 >= v26)
          v26 = *((double *)v24 + 5);
        v31 = (uint64_t *)v24[1];
        if (v31)
        {
          do
          {
            v32 = v31;
            v31 = (uint64_t *)*v31;
          }
          while (v31);
        }
        else
        {
          do
          {
            v32 = (uint64_t *)v24[2];
            v33 = *v32 == (_QWORD)v24;
            v24 = v32;
          }
          while (!v33);
        }
        v25 = v25 + v30;
        v24 = v32;
      }
      while (v32 != (uint64_t *)v58);
      v34 = v25 * 1000.0;
    }
    v35 = (CHistoryRecord *)((char *)this + 924);
    v36 = v34;
    if (v36 > 999.99 || v36 < 0.0)
      v36 = 0.0;
    *((_DWORD *)this + 232) = v15;
    *((_DWORD *)this + 233) = v15;
    v38 = &v35->m_currentTime + v15;
    v39 = *((float *)this + 234) + (float)(v36 - v38[5]);
    *((float *)this + 234) = v39;
    v38[5] = v36;
    *((float *)this + 235) = v39 / 120.0;
    CHistoryRecord::UpdateMinMax(v35);
    if (*((double *)&v55 + 1) < 0.0 || *((double *)&v56 + 1) <= 0.0)
    {
      v45 = (float *)((char *)this + 4 * v15);
      *((_DWORD *)this + 359) = v15;
      *((_DWORD *)this + 360) = v15;
      v44 = *((float *)this + 361) + (float)(0.0 - v45[363]);
      *((float *)this + 361) = v44;
      v45[363] = 0.0;
    }
    else
    {
      v40 = 0.0;
      v41 = *((double *)&v56 + 1) * 1000.0;
      if (v41 <= 999.99 && v41 >= 0.0)
        v40 = *((double *)&v56 + 1) * 1000.0;
      v43 = (float *)((char *)this + 4 * v15);
      *((_DWORD *)this + 359) = v15;
      *((_DWORD *)this + 360) = v15;
      v44 = *((float *)this + 361) + (float)(v40 - v43[363]);
      *((float *)this + 361) = v44;
      v43[363] = v40;
    }
    *((float *)this + 362) = v44 / 120.0;
    CHistoryRecord::UpdateMinMax((CHistoryRecord *)((char *)this + 1432));
    if (!objc_msgSend(*((id *)this + 1), "loggingEnabled"))
      goto LABEL_52;
    v46 = &Overlay::Update(int)::logBuffer - Overlay::Update(int)::logBufferPos + 986;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = ___ZN7Overlay6UpdateEi_block_invoke;
    v53[3] = &__block_descriptor_44_e5_v8__0l;
    v53[4] = this;
    v54 = a2;
    v47 = (void (**)(_QWORD, float))MEMORY[0x22769FF94](v53);
    v48 = snprintf(Overlay::Update(int)::logBufferPos, v46, ",%.2f,%.2f", v11, v34);
    if (v48 >= 1 && v46 > v48)
    {
      Overlay::Update(int)::logBufferPos += v48;
      if (*(float *)&Overlay::Update(int)::logTime > 1000.0)
        v47[2](v47, *(float *)&Overlay::Update(int)::logTime);
      goto LABEL_51;
    }
    if (Overlay::Update(int)::logBufferPos >= byte_255895C42)
    {
      v51 = "logBufferPos < logBuffer + maxLogBufferLength";
      v52 = 804;
    }
    else
    {
      *Overlay::Update(int)::logBufferPos = 0;
      ((void (*)(void (**)(_QWORD, float)))v47[2])(v47);
      v49 = &Overlay::Update(int)::logBuffer - Overlay::Update(int)::logBufferPos + 986;
      v50 = snprintf(Overlay::Update(int)::logBufferPos, v49, ",%.2f,%.2f", v11, v34);
      v51 = "nCharsWritten > 0 && nCharsWritten < nSpaceRemaining";
      v52 = 809;
      if (v50 >= 1 && v49 > v50)
      {
        Overlay::Update(int)::logBufferPos += v50;
LABEL_51:
        *(float *)&Overlay::Update(int)::logTime = *(float *)&Overlay::Update(int)::logTime + v11;

LABEL_52:
        std::__tree<std::pair<double,double>>::destroy((uint64_t)&v57, v58[0]);
        return;
      }
    }
    __assert_rtn("Update", "Overlay.mm", v52, v51);
  }
}

void sub_22694804C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  CFTimeInterval v6;
  std::mutex *v7;
  unsigned int v8;
  double *v9;
  CFTimeInterval v10;
  uint64_t v11;
  double v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "presentedTime");
  v6 = v5;
  if (v5 <= 0.0)
    v6 = CACurrentMediaTime();
  v7 = (std::mutex *)(v4 + ((unint64_t)*(unsigned int *)(a1 + 40) << 6) + 216);
  std::mutex::lock(v7);
  v8 = *(_DWORD *)(a1 + 40);
  v9 = (double *)(v4 + 56 * v8);
  v9[7] = v6;
  v9 += 7;
  v10 = CACurrentMediaTime();
  v11 = v4 + 56 * v8;
  *(CFTimeInterval *)(v11 + 64) = v10;
  v12 = *v9;
  *(double *)(v11 + 72) = *v9
                        - *(double *)&Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::prevPresentedTime;
  if (v12 > 0.0)
    Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::prevPresentedTime = *(_QWORD *)&v12;
  std::mutex::unlock(v7);

}

void sub_226948150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::mutex *v10;

  std::mutex::unlock(v10);

  _Unwind_Resume(a1);
}

uint64_t Renderer::BeginMergedDraw(uint64_t this, int a2, int a3)
{
  unsigned int v4;
  uint64_t v6;

  v4 = *(_DWORD *)(this + 8);
  if ((v4 & 0x80000000) == 0)
  {
    v6 = this;
    this = Renderer::getDynamicVertexIndexBuffers(this, v4, a2, a3, (uint64_t *)(this + 112), (_QWORD *)(this + 120), (_DWORD *)(this + 144), (_DWORD *)(this + 148));
    *(_DWORD *)(v6 + 128) = a2;
    *(_DWORD *)(v6 + 132) = a3;
    *(_QWORD *)(v6 + 136) = 0;
  }
  return this;
}

void Renderer::EndMergedDraw(Renderer *this)
{
  int v2;
  int v3;
  int v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int64x2_t v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  char *v29;

  v3 = *((_DWORD *)this + 36);
  v2 = *((_DWORD *)this + 37);
  v4 = *((_DWORD *)this + 35);
  v5 = **((id **)this + 2);
  v6 = *((_QWORD *)this + 22);
  v7 = *((_QWORD *)this + 21);
  if (v7 >= v6)
  {
    v9 = *((_QWORD *)this + 20);
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v9) >> 3);
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v9) >> 3);
    v12 = 2 * v11;
    if (2 * v11 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v12;
    v29 = (char *)this + 176;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v13);
      v16 = v15;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v17 = &v14[24 * v10];
    *(_DWORD *)v17 = v3;
    *((_DWORD *)v17 + 1) = v2;
    *((_DWORD *)v17 + 2) = v4;
    *((_QWORD *)v17 + 2) = v5;
    v19 = *((_QWORD *)this + 20);
    v18 = *((_QWORD *)this + 21);
    if (v18 == v19)
    {
      v24 = vdupq_n_s64(v18);
      v20 = v17;
    }
    else
    {
      v20 = v17;
      do
      {
        v21 = *(_QWORD *)(v18 - 24);
        v18 -= 24;
        v22 = *(_DWORD *)(v18 + 8);
        *((_QWORD *)v20 - 3) = v21;
        v20 -= 24;
        *((_DWORD *)v20 + 2) = v22;
        v23 = *(_QWORD *)(v18 + 16);
        *(_QWORD *)(v18 + 16) = 0;
        *((_QWORD *)v20 + 2) = v23;
      }
      while (v18 != v19);
      v24 = *((int64x2_t *)this + 10);
    }
    v8 = v17 + 24;
    *((_QWORD *)this + 20) = v20;
    *((_QWORD *)this + 21) = v17 + 24;
    v27 = v24;
    v25 = *((_QWORD *)this + 22);
    *((_QWORD *)this + 22) = &v14[24 * v16];
    v28 = v25;
    v26 = v24.i64[0];
    std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v26);
  }
  else
  {
    *(_DWORD *)v7 = v3;
    *(_DWORD *)(v7 + 4) = v2;
    *(_DWORD *)(v7 + 8) = v4;
    *(_QWORD *)(v7 + 16) = v5;
    v8 = (char *)(v7 + 24);
  }
  *((_QWORD *)this + 21) = v8;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_QWORD *)this + 18) = 0;

}

void sub_226948378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void Overlay::onCommandBufferCommit(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = *(unsigned int *)(a1 + 32);
  v5 = *(id *)(a1 + 408);
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 408), "objectForKey:", v6);
  if (objc_claimAutoreleasedReturnValue())
    __assert_rtn("onCommandBufferCommit", "Overlay.mm", 675, "![m_commandBufferFrameIds objectForKey:key]");
  v7 = *(void **)(a1 + 408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

  objc_sync_exit(v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN7Overlay21onCommandBufferCommitEPU27objcproto16MTLCommandBuffer11objc_object_block_invoke;
  v9[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v9[4] = a1;
  objc_msgSend(v3, "addCompletedHandler:", v9);

}

void sub_2269484BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN7Overlay21onCommandBufferCommitEPU27objcproto16MTLCommandBuffer11objc_object_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(v4 + 408);
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v4 + 408), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "intValue");
    objc_msgSend(*(id *)(v4 + 408), "removeObjectForKey:", v6);
  }
  else
  {
    v9 = -1;
  }

  objc_sync_exit(v5);
  if (v9 > 2)
    __assert_rtn("onCommandBufferCommit_block_invoke", "Overlay.mm", 701, "false");
  std::mutex::lock((std::mutex *)(v4 + ((unint64_t)v9 << 6) + 216));
  objc_msgSend(v3, "GPUStartTime");
  v11 = v10;
  objc_msgSend(v3, "GPUEndTime");
  *(_QWORD *)&v13 = v11;
  *((_QWORD *)&v13 + 1) = v12;
  std::__tree<std::pair<double,double>>::__emplace_unique_key_args<std::pair<double,double>,std::pair<double,double>>((uint64_t **)(v4 + 56 * v9 + 80), (double *)&v13, &v13);
  std::mutex::unlock((std::mutex *)(v4 + ((unint64_t)v9 << 6) + 216));

}

void sub_226948648(_Unwind_Exception *a1)
{
  void *v1;
  std::mutex *v2;

  std::mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void ___ZN7Overlay6UpdateEi_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  NSLog(CFSTR("metal-HUD: %d,%.2f,%.2f%s"), Overlay::Update(int)::frameNumberPrev, gpuMemoryUsedMB, processMemoryUsedMB, &Overlay::Update(int)::logBuffer);
  Overlay::Update(int)::logTime = 0;
  *(_DWORD *)(v2 + 40) = 0;
  Overlay::Update(int)::frameNumberPrev = *(_DWORD *)(a1 + 40) + 1;
  Overlay::Update(int)::logBufferPos = &Overlay::Update(int)::logBuffer;
}

void sub_2269487D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_226948854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_LayerHUDPropertiesListener;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_226948BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__tree<std::pair<double,double>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::pair<double,double>>::destroy(a1, *a2);
    std::__tree<std::pair<double,double>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void std::vector<Renderer::SDrawCommand>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;
  id *v6;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 3;

        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t **std::__tree<std::pair<double,double>>::__assign_multi<std::__tree_const_iterator<std::pair<double,double>,std::__tree_node<std::pair<double,double>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t **leaf_high;
  _QWORD *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v15 = result;
    v16 = v8;
    v17 = v8;
    if (v8)
    {
      v16 = std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
          leaf_high = (uint64_t **)std::__tree<std::pair<double,double>>::__find_leaf_high((uint64_t)v5, &v18, (double *)v8 + 4);
          std::__tree<std::pair<double,double>>::__insert_node_at(v5, v18, leaf_high, v8);
          v17 = v16;
          if (v16)
            v16 = std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next((uint64_t)v16);
          v11 = (_QWORD *)v9[1];
          if (v11)
          {
            do
            {
              a2 = v11;
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v12 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v12);
          }
          v8 = v17;
          if (v17)
            v12 = a2 == a3;
          else
            v12 = 1;
          v9 = a2;
        }
        while (!v12);
      }
    }
    result = (uint64_t **)std::__tree<std::pair<double,double>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<std::pair<double,double>>::__emplace_multi<std::pair<double,double> const&>(v5, (_OWORD *)a2 + 2);
      v13 = (_QWORD *)a2[1];
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (_QWORD *)a2[2];
          v12 = *v14 == (_QWORD)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_226948F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__tree<std::pair<double,double>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::pair<double,double>>::__find_leaf_high(uint64_t a1, _QWORD *a2, double *a3)
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
  double v6;
  double v7;
  _QWORD *v8;

  v5 = *(uint64_t **)(a1 + 8);
  v3 = (_QWORD *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = *a3;
    do
    {
      while (1)
      {
        v3 = v4;
        v7 = *((double *)v4 + 4);
        if (v6 >= v7 && (v7 < v6 || a3[1] >= *((double *)v4 + 5)))
          break;
        v4 = (uint64_t *)*v4;
        v8 = v3;
        if (!*v3)
          goto LABEL_11;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v8 = v3 + 1;
  }
  else
  {
    v8 = v3;
  }
LABEL_11:
  *a2 = v3;
  return v8;
}

uint64_t *std::__tree<std::pair<double,double>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

_QWORD *std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::pair<double,double>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::pair<double,double>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::pair<double,double>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

void *std::__tree<std::pair<double,double>>::__emplace_multi<std::pair<double,double> const&>(uint64_t **a1, _OWORD *a2)
{
  void *v4;
  uint64_t **leaf_high;
  uint64_t v7;

  v4 = operator new(0x30uLL);
  *((_OWORD *)v4 + 2) = *a2;
  leaf_high = (uint64_t **)std::__tree<std::pair<double,double>>::__find_leaf_high((uint64_t)a1, &v7, (double *)v4 + 4);
  std::__tree<std::pair<double,double>>::__insert_node_at(a1, v7, leaf_high, (uint64_t *)v4);
  return v4;
}

void sub_22694927C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::pair<double,double>>::__emplace_unique_key_args<std::pair<double,double>,std::pair<double,double>>(uint64_t **a1, double *a2, _OWORD *a3)
{
  void **v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9;

  v5 = (void **)std::__tree<std::pair<double,double>>::__find_equal<std::pair<double,double>>((uint64_t)a1, &v9, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<std::pair<double,double>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

_QWORD *std::__tree<std::pair<double,double>>::__find_equal<std::pair<double,double>>(uint64_t a1, _QWORD *a2, double *a3)
{
  _QWORD *result;
  uint64_t *v4;
  uint64_t *v5;
  double v6;
  double v7;
  _QWORD *v8;
  double v9;
  double v10;

  v5 = *(uint64_t **)(a1 + 8);
  result = (_QWORD *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = *a3;
    v7 = a3[1];
    while (1)
    {
      while (1)
      {
        v8 = v4;
        v9 = *((double *)v4 + 4);
        if (v6 >= v9)
          break;
LABEL_4:
        v4 = (uint64_t *)*v4;
        result = v8;
        if (!*v8)
          goto LABEL_12;
      }
      if (v9 >= v6)
      {
        v10 = *((double *)v4 + 5);
        if (v7 < v10)
          goto LABEL_4;
        if (v10 >= v7)
          goto LABEL_12;
      }
      result = v4 + 1;
      v4 = (uint64_t *)v4[1];
      if (!v4)
        goto LABEL_12;
    }
  }
  v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

void esfm_PrepareCGContext()
{
  __assert_rtn("esfm_PrepareCGContext", "easysystemfont_metal.h", 351, "canvas->bpp==1");
}

void esfm_BakeFontIntoBitmapGrayscale_cold_1()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscale", "easysystemfont_metal.h", 508, "pFontHeight");
}

void esfm_BakeFontIntoBitmapGrayscale_cold_2()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscale", "easysystemfont_metal.h", 533, "false");
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_1()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 615, "pFontHeight");
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_2()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 732, "hiX < hiResCanvas.width");
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_3()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 733, "hiY < hiResCanvas.height");
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_4()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 690, "false");
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_5()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 674, "lowResWidth <= hiResCanvas.width/sSDFScaleFactor && lowResHeight <= hiResCanvas.height/sSDFScaleFactor");
}

void Renderer::DrawText()
{
  __assert_rtn("DrawText", "Renderer.mm", 322, "false");
}

void Renderer::DrawGraph()
{
  __assert_rtn("DrawGraph", "Renderer.mm", 428, "v1_index >= 0 && v1_index < numPoints");
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x24BDBDF80](c, allowsAntialiasing);
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
  MEMORY[0x24BDBDF88](c, allowsFontSmoothing);
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
  MEMORY[0x24BDBDF90](c, allowsFontSubpixelPositioning);
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
  MEMORY[0x24BDBDF98](c, allowsFontSubpixelQuantization);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetRenderingIntent(CGContextRef c, CGColorRenderingIntent intent)
{
  MEMORY[0x24BDBE070](c, *(_QWORD *)&intent);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x24BDBE098](c, shouldSmoothFonts);
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
  MEMORY[0x24BDBE0A0](c, shouldSubpixelPositionFonts);
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
  MEMORY[0x24BDBE0A8](c, shouldSubpixelQuantizeFonts);
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4818](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4840](name, size);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
  MEMORY[0x24BDC48A0](font, glyphs, positions, count, context);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x24BDC48B0](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48B8](font);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x24BDC48C8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48E0](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4900](font);
  return result;
}

uint64_t IOSurfaceGetDetachModeCode()
{
  return MEMORY[0x24BDD8C10]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EE46DF8(__p);
}

uint64_t operator delete()
{
  return off_24EE46E00();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EE46E08(__sz);
}

uint64_t operator new()
{
  return off_24EE46E10();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

__float2 __sincospif_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC8A0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x24BEDCEE8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x24BEDCF00](block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

