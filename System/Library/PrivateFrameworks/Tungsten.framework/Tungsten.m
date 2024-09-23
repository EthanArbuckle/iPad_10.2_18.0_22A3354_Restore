unint64_t PXGSpriteIndexRangeIntersection(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;

  v2 = 0;
  if (HIDWORD(a1))
  {
    v3 = 0;
    if (HIDWORD(a2))
    {
      v4 = HIDWORD(a1) + a1;
      v5 = HIDWORD(a2) + a2;
      if (a1 <= a2)
        v6 = a2;
      else
        v6 = a1;
      if (v4 >= v5)
        v7 = HIDWORD(a2) + a2;
      else
        v7 = HIDWORD(a1) + a1;
      v8 = (unint64_t)(v7 - v6) << 32;
      v9 = v5 > a1;
      if (v5 > a1)
        v10 = v8;
      else
        v10 = 0;
      if (!v9)
        v6 = 0;
      v11 = v4 > a2;
      if (v4 > a2)
        v2 = v10;
      else
        v2 = 0;
      if (v11)
        v3 = v6;
      else
        v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3 | v2;
}

uint64_t PXGMediaKindGetSupportedResize(unsigned int a1)
{
  if (a1 > 0xC)
    return 3;
  else
    return qword_24945FA78[a1];
}

void _PXGArrayZeroRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  bzero((void *)(a1 + a3 * a2), a4 * a2);
}

BOOL _PXGArrayCapacityResizeToCount(void **a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v6;

  v5 = *a3;
  if (*a3 < a4)
  {
    v6 = a4;
    if (v5)
    {
      v6 = *a3;
      do
        v6 *= 2;
      while (v6 < a4);
    }
    *a3 = v6;
    *a1 = malloc_type_realloc(*a1, v6 * a2, 0xFA539D40uLL);
  }
  return v5 < a4;
}

void sub_24943F6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *_PXGArrayRemoveRange(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;

  v8 = a5 + a4;
  v9 = a3 - (a5 + a4);
  if (a3 < a5 + a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _PXGArrayRemoveRange(void * _Nonnull, size_t, size_t, size_t, size_t)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGArrayUtilities.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location + length <= count"));

  }
  return memmove((void *)(a1 + a4 * a2), (const void *)(a1 + v8 * a2), v9 * a2);
}

__n128 PXGSpriteTextureInfoOrientationFromCGOrientation(int a1)
{
  if (PXGSpriteTextureInfoOrientationFromCGOrientation_onceToken != -1)
    dispatch_once(&PXGSpriteTextureInfoOrientationFromCGOrientation_onceToken, &__block_literal_global_1374);
  return (__n128)PXGSpriteTextureInfoOrientationFromCGOrientation_transforms[a1];
}

id PXGTungstenGetLog()
{
  if (PXGTungstenGetLog_predicate != -1)
    dispatch_once(&PXGTungstenGetLog_predicate, &__block_literal_global_339);
  return (id)PXGTungstenGetLog_log;
}

void *_PXGArrayResize(void **a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = malloc_type_realloc(*a1, a3 * a2, 0xFA539D40uLL);
  *a1 = result;
  return result;
}

void sub_249440ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PXGSpriteTextureInfoOrientationFromCGAffineTransform(float64x2_t *a1)
{
  double result;

  *(_QWORD *)&result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*a1), a1[1]).u64[0];
  return result;
}

float64x2_t PXGSpriteTextureInfoOrientationToCGAffineTransform@<Q0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>)
{
  float64x2_t v2;
  float64x2_t result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  result = vcvt_hight_f64_f32(a2);
  *(float64x2_t *)a1 = v2;
  *(float64x2_t *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

float64_t PXGCameraForVisibleRect(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4)
{
  a3.f64[1] = a4;
  __asm { FMOV            V3.2D, #0.5 }
  a1.f64[1] = a2;
  *(float32x2_t *)&a1.f64[0] = vcvt_f32_f64(vaddq_f64(a1, vmulq_f64(a3, _Q3)));
  return a1.f64[0];
}

void *_PXGArrayInsertRange(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;

  v8 = a5 + a4;
  v9 = a3 - (a5 + a4);
  if (a3 < a5 + a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _PXGArrayInsertRange(void * _Nonnull, size_t, size_t, size_t, size_t)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGArrayUtilities.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location + length <= count"));

  }
  return memmove((void *)(a1 + v8 * a2), (const void *)(a1 + a4 * a2), v9 * a2);
}

void PXGAssertErrValidSize(double a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("width"), *(_QWORD *)&a1);

  }
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("height"), *(_QWORD *)&a2);

  }
}

uint64_t dispatch thunk of CarouselDataSource.numberOfPages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CarouselViewModel.dataSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_249442704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *_PXGArrayCopyRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return memmove((void *)(a1 + a5 * a2), (const void *)(a1 + a3 * a2), a4 * a2);
}

void *_PXGArrayCopyRangeToArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return memmove((void *)(a5 + a6 * a2), (const void *)(a1 + a3 * a2), a4 * a2);
}

void sub_249444428(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_249444880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_249445760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

float factorize(int a1, int a2, _WORD *a3, float a4)
{
  int v4;
  int v7;
  float v8;
  uint64_t v9;
  char *v10;
  int v11;
  size_t v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a4 <= 0.0)
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 22, "value > 0.0f");
  if (a1 <= 0)
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 23, "n > 0");
  v4 = a2;
  if (a2 <= 2)
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 24, "pMin <= pMax");
  if (!a3)
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 25, "products != NULL");
  if (a1 == 1)
  {
    v7 = llroundf(a4);
    if (v7 >= a2)
      v7 = a2;
    if (v7 <= 3)
      LOWORD(v7) = 3;
    *a3 = v7;
    return (float)(__int16)v7;
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    v10 = (char *)v19 - v9;
    v12 = 2 * v11;
    v8 = 0.0;
    v13 = 3.4028e38;
    v14 = (__int16)v11;
    do
    {
      v15 = factorize(v14, (__int16)v4, v10, a4 / (float)v4) * (float)v4;
      v16 = vabds_f32(a4, v15);
      if (v16 < v13)
      {
        *a3 = v4;
        memcpy(a3 + 1, v10, v12);
        v8 = v15;
        v13 = v16;
      }
    }
    while (v4-- > 3);
  }
  return v8;
}

double PXGResizeRect(unsigned int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v18;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  switch(a1 & 7)
  {
    case 1u:
      v18 = a10 + a12 - a6 - a8;
      goto LABEL_6;
    case 2u:
      v18 = a10 - a6;
      a4 = a4 + a12 - a8;
      goto LABEL_6;
    case 4u:
      v18 = a10 - a6;
      goto LABEL_6;
    case 5u:
      v18 = a10 - a6 + (a12 - a8) * 0.5;
LABEL_6:
      switch(((unint64_t)(a1 & 0x38) - 8) >> 3)
      {
        case 0uLL:
        case 1uLL:
        case 3uLL:
        case 4uLL:
          return a2 + v18;
        default:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a2, a3, a4, a5, v18, a7, a11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _PXGLinearResize(CGFloat *, CGFloat *, CGFloat, CGFloat, CGFloat, CGFloat, BOOL, BOOL, BOOL)");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (a1 >> 3) & 1;
          v24 = (a1 >> 4) & 1;
          v25 = (a1 >> 5) & 1;
          break;
      }
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _PXGLinearResize(CGFloat *, CGFloat *, CGFloat, CGFloat, CGFloat, CGFloat, BOOL, BOOL, BOOL)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = a1 & 1;
      v24 = (a1 >> 1) & 1;
      v25 = (a1 >> 2) & 1;
      break;
  }
  objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXGGeometry.m"), 26, CFSTR("resizing options (%i %i %i) not implemented yet"), v23, v24, v25);

  abort();
}

uint64_t PXGColorSpaceNameFromCFStringRef(uint64_t a1)
{
  if (*MEMORY[0x24BDBF320] == a1)
    return 1;
  if (*MEMORY[0x24BDBF328] == a1)
    return 2;
  if (*MEMORY[0x24BDBF290] == a1)
    return 3;
  if (*MEMORY[0x24BDBF280] == a1)
    return 4;
  if (*MEMORY[0x24BDBF228] == a1)
    return 5;
  if (*MEMORY[0x24BDBF220] == a1)
    return 6;
  if (*MEMORY[0x24BDBF2D8] == a1)
    return 7;
  if (*MEMORY[0x24BDBF2B8] == a1)
    return 8;
  if (*MEMORY[0x24BDBF258] == a1)
    return 9;
  if (*MEMORY[0x24BDBF270] == a1)
    return 10;
  if (*MEMORY[0x24BDBF278] == a1)
    return 11;
  if (*MEMORY[0x24BDBF318] == a1)
    return 12;
  return 0;
}

uint64_t PXGDeviceIsKnownToHaveExtendedColorDisplay()
{
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1)
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_472);
  return PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay;
}

CGColorSpace *PXGGetReconciledColorSpace(CGColorSpace *a1)
{
  CGColorSpace *v1;
  uint64_t AlternateColorSpace;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGColorSpaceRef  _Nullable PXGGetReconciledColorSpace(CGColorSpaceRef _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGTextureUtilities.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("space != nil"));

  }
  switch(CGColorSpaceGetType())
  {
    case 0u:
    case 1u:
    case 2u:
      AlternateColorSpace = PXGetColorSpace();
      goto LABEL_6;
    case 8u:
      AlternateColorSpace = CGColorSpaceGetAlternateColorSpace();
LABEL_6:
      v1 = (CGColorSpace *)AlternateColorSpace;
      break;
    default:
      break;
  }
  if (!CGColorSpaceSupportsOutput(v1))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGColorSpaceRef  _Nullable PXGGetReconciledColorSpace(CGColorSpaceRef _Nonnull)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGTextureUtilities.m"), 174, CFSTR("Color space not supported as output:%@"), v1);

  }
  return v1;
}

uint64_t PXGRequiresColorMatching(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 0;
  if (a2 && a1 && a1 != a2)
  {
    if ((CGColorSpaceIsUncalibrated() & 1) != 0)
      return 0;
    PXGetColorSpace();
    if (CGColorSpaceEqualToColorSpaceIgnoringRange()
      && ((PXGetColorSpace(), (CGColorSpaceEqualToColorSpaceIgnoringRange() & 1) != 0)
       || CGColorSpaceGetType() < 2))
    {
      return 0;
    }
    else
    {
      return CGColorSpaceEqualToColorSpaceIgnoringRange() ^ 1;
    }
  }
  return result;
}

CGColorRef PXGCreateDebugColorForMediaKind(CGColorRef result)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;

  switch((int)result)
  {
    case 0:
      v1 = 1.0;
      v2 = 0.0;
      v3 = 0.0;
      goto LABEL_24;
    case 1:
      v3 = 0.6;
      v4 = 0.7;
      v1 = 0.0;
      v2 = 0.0;
      goto LABEL_4;
    case 2:
      v4 = 0.4;
      goto LABEL_13;
    case 3:
      return CGColorCreateSRGB(0.5, 0.0, 0.5, 0.7);
    case 4:
      v2 = 0.8;
      v4 = 0.7;
      v1 = 0.0;
      goto LABEL_19;
    case 5:
      v2 = 0.4;
      goto LABEL_11;
    case 6:
      v2 = 0.6;
LABEL_11:
      v4 = 0.7;
      v1 = 0.0;
      goto LABEL_16;
    case 7:
      v4 = 0.2;
LABEL_13:
      v1 = 0.0;
      goto LABEL_18;
    case 8:
      v4 = 0.7;
      v1 = 0.5;
      v2 = 0.5;
      goto LABEL_19;
    case 9:
      v2 = 0.2;
      v4 = 0.7;
      v1 = 0.5;
LABEL_16:
      v3 = v2;
      goto LABEL_4;
    case 10:
      v4 = 0.7;
      v1 = 0.5;
LABEL_18:
      v2 = 0.0;
LABEL_19:
      v3 = 0.0;
      goto LABEL_4;
    case 11:
      return CGColorCreateSRGB(1.0, 0.7, 0.8, 0.7);
    case 12:
      v1 = 0.0;
      goto LABEL_23;
    case 13:
      v1 = 0.5;
LABEL_23:
      v2 = 0.0;
      v3 = 1.0;
LABEL_24:
      v4 = 1.0;
LABEL_4:
      result = CGColorCreateSRGB(v1, v2, v3, v4);
      break;
    default:
      return result;
  }
  return result;
}

id PXGStringForOSType(unsigned int a1)
{
  _WORD v2[4];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v2, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PXGCreateMetalTextureFromIOSurface(__IOSurface *a1, void *a2, _DWORD *a3)
{
  id v5;
  uint64_t PixelFormat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  v7 = PXGMetalPixelFormatForOSType(PixelFormat);
  if (v7)
  {
    v8 = v7;
    _createMetalTextureFromIOSurface(a1, 0, v7, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a3 && v9)
      *a3 = 4 * (v8 == 10);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t PXGMetalPixelFormatForOSType(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  BOOL v5;
  int v6;
  int v7;
  int v8;

  v2 = 80;
  while (1)
  {
    if ((int)a1 <= 875836467)
    {
      if ((int)a1 <= 875704437)
      {
        if ((int)a1 <= 843264309)
        {
          if ((int)a1 <= 645424687)
          {
            if ((_DWORD)a1 == 641230384 || (_DWORD)a1 == 641234480)
              return 500;
          }
          else
          {
            if ((_DWORD)a1 == 645424688 || (_DWORD)a1 == 645428784)
              return 508;
            if ((_DWORD)a1 == 843264104)
              return 65;
          }
          goto LABEL_20;
        }
        switch((_DWORD)a1)
        {
          case 0x34323066:
            goto LABEL_17;
          case 0x32433136:
            return 60;
          case 0x32767579:
            return 562;
        }
        goto LABEL_20;
      }
      if ((_DWORD)a1 != 875704438 && (_DWORD)a1 != 875704934 && (_DWORD)a1 != 875704950)
        goto LABEL_20;
LABEL_17:
      v3 = a1 & 0xFFFFFFEF;
      if ((a1 & 0xFFFFFFEF) == 0x34323066)
        return 500;
      if (v3 == 875704934)
        return 502;
      if (v3 == 875836518)
        return 503;
      goto LABEL_20;
    }
    if ((int)a1 <= 1093677111)
    {
      if ((_DWORD)a1 != 875836518 && (_DWORD)a1 != 875836534)
      {
        if ((_DWORD)a1 == 875836468)
          return 42;
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if ((int)a1 > 1885745713)
    {
      if ((int)a1 <= 2019963439)
      {
        if ((int)a1 <= 1886860339)
        {
          if ((int)a1 > 1886859823)
          {
            if ((_DWORD)a1 == 1886859824)
              return 508;
            if ((_DWORD)a1 == 1886859826)
              return 509;
          }
          else
          {
            if ((_DWORD)a1 == 1885745714)
              return 509;
            if ((_DWORD)a1 == 1885746228)
              return 510;
          }
          goto LABEL_20;
        }
        if ((int)a1 > 2016686641)
        {
          switch((_DWORD)a1)
          {
            case 0x78343232:
              return 506;
            case 0x78343434:
              return 507;
            case 0x78343470:
              return 504;
          }
          goto LABEL_20;
        }
        if ((_DWORD)a1 == 1886860340)
          return 510;
        v7 = 2016686640;
      }
      else
      {
        if ((int)a1 > 2021077553)
        {
          if ((int)a1 <= 2021078127)
          {
            if ((_DWORD)a1 == 2021077554)
              return 506;
            if ((_DWORD)a1 == 2021078068)
              return 507;
          }
          else
          {
            if ((_DWORD)a1 == 2021078128)
              return 504;
            if ((_DWORD)a1 == 2037741158 || (_DWORD)a1 == 2037741171)
              return 501;
          }
          goto LABEL_20;
        }
        if ((int)a1 <= 2019963955)
        {
          if ((_DWORD)a1 == 2019963440)
            return 505;
          if ((_DWORD)a1 == 2019963442)
            return 506;
          goto LABEL_20;
        }
        if ((_DWORD)a1 == 2019963956)
          return 507;
        if ((_DWORD)a1 == 2019964016)
          return 504;
        v7 = 2021077552;
      }
      if ((_DWORD)a1 == v7)
        return 505;
      goto LABEL_20;
    }
    if ((int)a1 > 1380401728)
      break;
    if ((int)a1 <= 1278555444)
    {
      if ((int)a1 <= 1278226487)
      {
        if ((_DWORD)a1 == 1093677112)
          return 1;
        v6 = 1111970369;
        goto LABEL_68;
      }
      if ((_DWORD)a1 == 1278226488)
        return 10;
      if ((_DWORD)a1 == 1278226742)
        return 20;
    }
    else if ((int)a1 <= 1279340599)
    {
      if ((_DWORD)a1 == 1278555445)
        return 43;
      if ((_DWORD)a1 == 1278555701)
        return 40;
    }
    else
    {
      if ((_DWORD)a1 == 1279340600 || (_DWORD)a1 == 1279342648)
        return 30;
      if ((_DWORD)a1 == 1378955371)
        return 90;
    }
LABEL_20:
    v4 = fourcc_compressed_of_type(a1);
    v5 = (_DWORD)v4 == (_DWORD)a1;
    a1 = v4;
    if (v5)
      return 0;
  }
  if ((int)a1 > 1815491697)
  {
    if ((int)a1 <= 1882468913)
    {
      if ((_DWORD)a1 == 1815491698)
        return 110;
      v8 = 1882468912;
    }
    else
    {
      if ((_DWORD)a1 == 1882468914)
        return 509;
      if ((_DWORD)a1 == 1882469428)
        return 510;
      v8 = 1885745712;
    }
    if ((_DWORD)a1 == v8)
      return 508;
    goto LABEL_20;
  }
  if ((int)a1 > 1380411456)
  {
    if ((_DWORD)a1 == 1380411457)
      return 115;
    if ((_DWORD)a1 == 1599554369)
      return v2;
    v6 = 1599554371;
LABEL_68:
    if ((_DWORD)a1 == v6)
      return v2;
    goto LABEL_20;
  }
  if ((_DWORD)a1 == 1380401729)
    return 70;
  if ((_DWORD)a1 != 1380410945)
    goto LABEL_20;
  return 125;
}

id _createMetalTextureFromIOSurface(__IOSurface *a1, size_t a2, uint64_t a3, void *a4)
{
  id v7;
  size_t WidthOfPlane;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  WidthOfPlane = IOSurfaceGetWidthOfPlane(a1, a2);
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3, WidthOfPlane, IOSurfaceGetHeightOfPlane(a1, a2), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsage:", 1);
  objc_msgSend(v7, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "newTextureWithDescriptor:iosurface:plane:", v9, a1, a2);
  return v11;
}

uint64_t fourcc_compressed_of_type(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned __int16 v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v1 = 1111970369;
  if ((int)a1 > 792225327)
  {
    if ((int)a1 > 1534359087)
    {
      if ((int)a1 <= 1534621233)
      {
        if ((int)a1 <= 1534617135)
        {
          if ((_DWORD)a1 == 1534359088)
            return 1953903152;
          if ((_DWORD)a1 == 1534359090)
            return 1953903154;
          if ((_DWORD)a1 != 1534359092)
            return a1;
          v5 = 1953903154;
        }
        else
        {
          if ((int)a1 <= 1534617139)
          {
            if ((_DWORD)a1 != 1534617136)
            {
              if ((_DWORD)a1 != 1534617138)
                return a1;
              return 2019963442;
            }
            v10 = 2016686640;
            return (v10 + 3276800);
          }
          if ((_DWORD)a1 != 1534617140)
          {
            if ((_DWORD)a1 == 1534621232)
              return 2016686640;
            return a1;
          }
          v5 = 2019963442;
        }
        return (v5 + 514);
      }
      if ((int)a1 <= 2084075055)
      {
        if ((_DWORD)a1 == 1534621234)
        {
          v11 = 2016686640;
          return v11 | 2u;
        }
        if ((_DWORD)a1 != 1534621236)
        {
          v8 = 2084070960;
LABEL_75:
          if ((_DWORD)a1 != v8)
            return a1;
          return 875704422;
        }
        v9 = 2016686640;
        return (v9 + 516);
      }
      if ((int)a1 > 2088265263)
      {
        if ((_DWORD)a1 != 2088265264)
        {
          v3 = 2088269360;
LABEL_101:
          if ((_DWORD)a1 == v3)
            return 1882468912;
          return a1;
        }
LABEL_103:
        v10 = 1882468912;
        return (v10 + 3276800);
      }
      if ((_DWORD)a1 != 2084075056)
      {
        v4 = 2084718401;
        goto LABEL_79;
      }
    }
    else
    {
      if ((int)a1 > 1530422835)
      {
        if ((int)a1 <= 1530426931)
        {
          if ((_DWORD)a1 != 1530422836)
          {
            if ((_DWORD)a1 != 1530426928)
            {
              v2 = 1530426930;
LABEL_66:
              if ((_DWORD)a1 == v2)
                return 875704950;
              return a1;
            }
            goto LABEL_68;
          }
          return 875836518;
        }
        if ((int)a1 <= 1534354993)
        {
          if ((_DWORD)a1 == 1530426932)
            goto LABEL_105;
          if ((_DWORD)a1 != 1534354992)
            return a1;
          return 1952854576;
        }
        if ((_DWORD)a1 == 1534354994)
        {
          v11 = 1952854576;
          return v11 | 2u;
        }
        if ((_DWORD)a1 != 1534354996)
          return a1;
        v9 = 1952854576;
        return (v9 + 516);
      }
      if ((int)a1 > 796419631)
      {
        if ((int)a1 > 1530422831)
        {
          if ((_DWORD)a1 != 1530422832)
          {
            if ((_DWORD)a1 != 1530422834)
              return a1;
            return 875704934;
          }
          return 875704422;
        }
        if ((_DWORD)a1 != 796419632)
        {
          v3 = 796423728;
          goto LABEL_101;
        }
        goto LABEL_103;
      }
      if ((_DWORD)a1 == 792225328)
        return 875704422;
      if ((_DWORD)a1 != 792229424)
      {
        v4 = 792872769;
        goto LABEL_79;
      }
    }
LABEL_68:
    v7 = 875704422;
    return v7 | 0x10u;
  }
  if ((int)a1 <= 645166643)
  {
    if ((int)a1 <= 642934848)
    {
      if ((int)a1 > 641234479)
      {
        if ((int)a1 <= 641234483)
        {
          if ((_DWORD)a1 != 641234480)
          {
            v2 = 641234482;
            goto LABEL_66;
          }
          goto LABEL_68;
        }
        if ((_DWORD)a1 != 641234484)
        {
          v4 = 641877825;
LABEL_79:
          if ((_DWORD)a1 == v4)
            return v1;
          return a1;
        }
LABEL_105:
        v7 = 875836518;
        return v7 | 0x10u;
      }
      if ((_DWORD)a1 != 641230384)
      {
        if ((_DWORD)a1 != 641230386)
        {
          if ((_DWORD)a1 != 641230388)
            return a1;
          return 875836518;
        }
        return 875704934;
      }
      return 875704422;
    }
    if ((int)a1 <= 645162545)
    {
      if ((_DWORD)a1 == 642934849)
        return 1380411457;
      if ((_DWORD)a1 == 643969848)
        return 1647534392;
      if ((_DWORD)a1 != 645162544)
        return a1;
      v6 = 26160;
    }
    else
    {
      if ((int)a1 <= 645166639)
      {
        if ((_DWORD)a1 != 645162546)
        {
          if ((_DWORD)a1 != 645162548)
            return a1;
          return 1886676532;
        }
        v11 = 1886676528;
        return v11 | 2u;
      }
      if ((_DWORD)a1 == 645166640)
        return 1886680624;
      if ((_DWORD)a1 != 645166642)
        return a1;
      v6 = 30258;
    }
    return v6 | 0x70740000u;
  }
  if ((int)a1 > 645428785)
  {
    if ((int)a1 > 758674991)
    {
      if ((int)a1 <= 762865199)
      {
        if ((_DWORD)a1 != 758674992)
        {
          v4 = 759318337;
          goto LABEL_79;
        }
        goto LABEL_68;
      }
      if ((_DWORD)a1 != 762865200)
      {
        v3 = 762869296;
        goto LABEL_101;
      }
      goto LABEL_103;
    }
    if ((_DWORD)a1 == 645428786)
    {
      v11 = 1882468912;
      return v11 | 2u;
    }
    if ((_DWORD)a1 != 645428788)
    {
      v8 = 758670896;
      goto LABEL_75;
    }
    v9 = 1882468912;
    return (v9 + 516);
  }
  if ((int)a1 > 645424687)
  {
    if ((int)a1 <= 645424691)
    {
      if ((_DWORD)a1 != 645424688)
      {
        if ((_DWORD)a1 != 645424690)
          return a1;
        return 1885745714;
      }
      goto LABEL_103;
    }
    if ((_DWORD)a1 != 645424692)
    {
      v3 = 645428784;
      goto LABEL_101;
    }
    v5 = 1885745714;
    return (v5 + 514);
  }
  if ((_DWORD)a1 == 645166644)
    return 1886680628;
  if ((_DWORD)a1 == 645346162)
    return 1999843442;
  if ((_DWORD)a1 != 645346401)
    return a1;
  return 1999908961;
}

uint64_t PXGCreateMetalTexturesFromIOSurface(__IOSurface *a1, void *a2, NSObject **a3, _QWORD *a4, int *a5)
{
  id v9;
  double Width;
  double Height;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  signed int PixelFormat;
  int v27;
  uint64_t v28;
  int is_video_range;
  NSObject *v30;
  BOOL v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  OSType v44;
  int v45;
  uint64_t v46;
  uint8_t buf[32];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  uint64_t v54;
  CGSize v55;
  CGSize v56;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v45 = 0;
  Width = (double)IOSurfaceGetWidth(a1);
  Height = (double)IOSurfaceGetHeight(a1);
  objc_msgSend(v9, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "limits");
  LODWORD(v14) = *(_DWORD *)(v13 + 132);
  LODWORD(v15) = *(_DWORD *)(v13 + 136);
  v16 = (double)v14;
  v17 = (double)v15;

  if (MEMORY[0x2495B088C](Width, Height, v16, v17))
  {
    PXGTungstenGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v55.width = Width;
      v55.height = Height;
      NSStringFromCGSize(v55);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v56.width = v16;
      v56.height = v17;
      NSStringFromCGSize(v56);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v20;
      LOWORD(v48) = 2114;
      *(_QWORD *)((char *)&v48 + 2) = v21;
      _os_log_impl(&dword_24943D000, v18, OS_LOG_TYPE_ERROR, "Surface %{public}@ is too large %{public}@ > %{public}@ for device:%{public}@", buf, 0x2Au);

    }
LABEL_29:
    v25 = 0;
    goto LABEL_30;
  }
  PXGCreateMetalTextureFromIOSurface(a1, v9, &v45);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v18 = v22;
    v23 = 0;
LABEL_6:
    v18 = objc_retainAutorelease(v18);
    *a3 = v18;
    v24 = objc_retainAutorelease(v23);
    *a4 = v24;
    *a5 = v45;

    v25 = 1;
LABEL_30:

    goto LABEL_31;
  }
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  v25 = 0;
  if (PixelFormat > 875704437)
  {
    if (PixelFormat > 2016686641)
    {
      if (PixelFormat == 2016686642 || PixelFormat == 2019963442)
        goto LABEL_23;
      v27 = 2019963440;
    }
    else
    {
      if (PixelFormat == 875704438 || PixelFormat == 875704934)
        goto LABEL_23;
      v27 = 2016686640;
    }
  }
  else
  {
    if (PixelFormat <= 645424687)
    {
      if (PixelFormat != 32 && PixelFormat != 641230384)
      {
        v27 = 641234480;
        goto LABEL_22;
      }
LABEL_23:
      if (IOSurfaceGetPlaneCount(a1) != 2)
      {
        v25 = 0;
        goto LABEL_31;
      }
      v28 = IOSurfaceGetPixelFormat(a1);
      is_video_range = ycbcr_fourcc_is_video_range(v28);
      v53 = 0;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      memset(buf, 0, sizeof(buf));
      v46 = 116;
      if (IOSurfaceGetBulkAttachments())
      {
        v18 = 0;
        v23 = 0;
        v45 = 0;
        goto LABEL_26;
      }
      if (BYTE10(v49) == 9)
      {
        v32 = is_video_range == 0;
        v33 = 1536;
        v34 = 1280;
      }
      else if (BYTE10(v49) == 7)
      {
        v32 = is_video_range == 0;
        v33 = 2048;
        v34 = 1792;
      }
      else
      {
        v32 = is_video_range == 0;
        if (BYTE10(v49) == 1)
        {
          v33 = 1024;
          v34 = 768;
        }
        else
        {
          v33 = 512;
          v34 = 256;
        }
      }
      if (v32)
        v35 = v33;
      else
        v35 = v34;
      if (ycbcr_fourcc_bits_per_component(v28) == 10)
        v36 = 0x2000;
      else
        v36 = 4096;
      v45 = v36 | v35;
      v37 = v36 >> 12;
      if (v37 != 1)
      {
        if (v37 != 2)
        {
          v18 = 0;
          v23 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v9, "device");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v49 = 0;
        v48 = 0u;
        memset(buf, 0, sizeof(buf));
        MTLPixelFormatGetInfoForDevice();
        if ((~*(_DWORD *)&buf[8] & 5) != 0)
        {

        }
        else
        {
          objc_msgSend(v9, "device");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v49 = 0;
          v48 = 0u;
          memset(buf, 0, sizeof(buf));
          v40 = 578;
          MTLPixelFormatGetInfoForDevice();
          v41 = ~*(_DWORD *)&buf[8] & 5;

          if (!v41)
          {
            v42 = 576;
LABEL_55:
            _createMetalTextureFromIOSurface(a1, 0, v42, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            _createMetalTextureFromIOSurface(a1, 1uLL, v40, v9);
            v43 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v43;
            if (v18 && v43)
              goto LABEL_6;
LABEL_26:
            PXAssertGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v44 = IOSurfaceGetPixelFormat(a1);
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v44;
              _os_log_error_impl(&dword_24943D000, v30, OS_LOG_TYPE_ERROR, "Unable to create texture for surface %@ with format:%u", buf, 0x12u);
            }

            goto LABEL_29;
          }
        }
        v40 = 60;
        v42 = 20;
        goto LABEL_55;
      }
      v40 = 30;
      v42 = 10;
      goto LABEL_55;
    }
    if (PixelFormat == 645424688 || PixelFormat == 645428784)
      goto LABEL_23;
    v27 = 875704422;
  }
LABEL_22:
  if (PixelFormat == v27)
    goto LABEL_23;
LABEL_31:

  return v25;
}

uint64_t ycbcr_fourcc_is_video_range(int a1)
{
  uint64_t result;
  unsigned __int16 v3;
  unsigned __int16 v4;
  unsigned __int16 v5;
  int v6;

  result = 1;
  if (a1 <= 1953903153)
  {
    if (a1 <= 1882468913)
    {
      if (a1 <= 875704949)
      {
        if (a1 == 846624121)
          return result;
        v6 = 875704438;
        goto LABEL_32;
      }
      if (a1 == 875704950 || a1 == 875836534)
        return result;
      v5 = 12848;
    }
    else
    {
      if (a1 > 1886680623)
      {
        if ((a1 - 1886680624) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
        {
          v3 = 12848;
LABEL_28:
          v6 = v3 | 0x74760000;
          goto LABEL_32;
        }
        return result;
      }
      if (a1 == 1882468914)
        return result;
      v5 = 13364;
    }
    v6 = v5 | 0x70340000;
LABEL_32:
    if (a1 != v6)
      return 0;
    return result;
  }
  if (a1 > 2016686641)
  {
    if (a1 > 2033463605)
    {
      if (a1 != 2033463606 && a1 != 2033463856)
      {
        v6 = 2037741171;
        goto LABEL_32;
      }
      return result;
    }
    if (a1 == 2016686642 || a1 == 2016687156)
      return result;
    v4 = 13424;
LABEL_20:
    v6 = v4 | 0x78340000;
    goto LABEL_32;
  }
  if (a1 <= 1982882103)
  {
    if (a1 == 1953903154)
      return result;
    v3 = 13364;
    goto LABEL_28;
  }
  if (a1 != 1982882104 && a1 != 1983000886)
  {
    v4 = 12848;
    goto LABEL_20;
  }
  return result;
}

uint64_t ycbcr_fourcc_bits_per_component(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned __int16 v3;
  int v4;
  unsigned __int16 v5;
  int v6;
  unsigned __int16 v7;
  int v8;

  v1 = fourcc_compressed_of_type(a1);
  v2 = 8;
  if (v1 > 1952854575)
  {
    if (v1 > 2016687155)
    {
      if (v1 <= 2019964015)
      {
        if (v1 > 2019963439)
        {
          if (v1 == 2019963440 || v1 == 2019963442)
            return 10;
          v6 = 2019963956;
LABEL_52:
          if (v1 == v6)
            return 10;
          return 0;
        }
        if (v1 == 2016687156)
          return 10;
        v7 = 13424;
LABEL_51:
        v6 = v7 | 0x78340000;
        goto LABEL_52;
      }
      if (v1 > 2033463855)
      {
        if (v1 == 2033463856 || v1 == 2037741158)
          return v2;
        v8 = 2037741171;
        goto LABEL_58;
      }
      if (v1 == 2019964016)
        return 10;
      if (v1 != 2033463606)
        return 0;
    }
    else
    {
      if (v1 <= 1953903667)
      {
        if (v1 <= 1952855091)
        {
          if (v1 == 1952854576)
            return 12;
          v4 = 1952854578;
        }
        else
        {
          if (v1 == 1952855092 || v1 == 1953903152)
            return 12;
          v4 = 1953903154;
        }
        if (v1 != v4)
          return 0;
        return 12;
      }
      if (v1 <= 1983000885)
      {
        if (v1 != 1953903668)
        {
          v8 = 1982882104;
          goto LABEL_58;
        }
        return 12;
      }
      if (v1 != 1983000886)
      {
        if (v1 == 2016686640)
          return 10;
        v7 = 12850;
        goto LABEL_51;
      }
    }
    return 16;
  }
  if (v1 > 1882469427)
  {
    if (v1 <= 1885746227)
    {
      if (v1 == 1882469428 || v1 == 1885745712)
        return 10;
      v5 = 12850;
      goto LABEL_39;
    }
    if (((v1 - 1886676528) > 4 || ((1 << (v1 - 48)) & 0x15) == 0)
      && ((v1 - 1886680624) > 4 || ((1 << (v1 - 48)) & 0x15) == 0))
    {
      v5 = 13364;
LABEL_39:
      v6 = v5 | 0x70660000;
      goto LABEL_52;
    }
    return 12;
  }
  if (v1 <= 875836517)
  {
    if (v1 <= 875704437)
    {
      if (v1 == 846624121)
        return v2;
      v3 = 12390;
    }
    else
    {
      if (v1 == 875704438 || v1 == 875704934)
        return v2;
      v3 = 12918;
    }
    v8 = v3 | 0x34320000;
    goto LABEL_58;
  }
  if (v1 > 1714696751)
  {
    if (v1 == 1714696752)
      return v2;
    if (v1 != 1882468912)
    {
      v6 = 1882468914;
      goto LABEL_52;
    }
    return 10;
  }
  if (v1 == 875836518)
    return v2;
  v8 = 875836534;
LABEL_58:
  if (v1 != v8)
    return 0;
  return v2;
}

double PXGMaxTextureSize(void *a1)
{
  unint64_t v1;

  LODWORD(v1) = *(_DWORD *)(objc_msgSend(a1, "limits") + 132);
  return (double)v1;
}

uint64_t PXGCGImageHasExtendedRange(CGImage *a1)
{
  CGColorSpace *ColorSpace;
  void *v2;
  uint64_t v3;

  ColorSpace = CGImageGetColorSpace(a1);
  CGColorSpaceGetName(ColorSpace);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDBF318]) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDBF290]) ^ 1;

  return v3;
}

CGImageRef PXGMetalCompatibleImageByRedrawingCGImage(CGImageRef image, double a2, double a3)
{
  double Width;
  double Height;
  uint64_t AspectRatio;
  double v10;
  CGContext *v11;
  void *v12;
  int v13;
  CGColorSpace *v14;
  CGColor *v15;
  CGImageRef v16;
  void *v18;
  void *v19;
  CGFloat components[2];
  __int128 v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!image)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageRef  _Nullable PXGMetalCompatibleImageByRedrawingCGImage(CGImageRef _Nonnull, CGSize, PXGColorSpaceName, BOOL)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGTextureUtilities.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageRef != nil"));

  }
  Width = (double)CGImageGetWidth(image);
  Height = (double)CGImageGetHeight(image);
  if (a2 <= Width || a3 <= Height)
  {
    PXSizeMin();
    AspectRatio = PXSizeGetAspectRatio();
    Width = MEMORY[0x2495B08B0](AspectRatio);
    Height = v10;
  }
  CGImageGetAlphaInfo(image);
  v11 = (CGContext *)PXCreateContext();
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = Width;
  v23.size.height = Height;
  CGContextClearRect(v11, v23);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = Width;
  v24.size.height = Height;
  CGContextDrawImage(v11, v24, image);
  +[PXTungstenSettings sharedInstance](PXTungstenSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "colorCopiedImages");

  if (v13)
  {
    *(_OWORD *)components = xmmword_24945F828;
    v21 = unk_24945F838;
    v14 = (CGColorSpace *)PXGetColorSpace();
    v15 = CGColorCreate(v14, components);
    CGContextSetFillColorWithColor(v11, v15);
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = Width;
    v25.size.height = Height;
    CGContextFillRect(v11, v25);
    CGColorRelease(v15);
  }
  v16 = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (v16)
    CFAutorelease(v16);
  return v16;
}

uint64_t PXGCGImageGetOpaque(CGImage *a1)
{
  CGImageAlphaInfo AlphaInfo;

  AlphaInfo = CGImageGetAlphaInfo(a1);
  return (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
}

id PXGCreateMetalTextureFromBytesInCGImage(CGImage *a1, void *a2, int *a3)
{
  unint64_t v3;
  unint64_t v4;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t PixelFormat;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  size_t Width;
  size_t Height;
  double v28;
  double v29;
  NSObject *v30;
  id v31;
  void *v32;
  const char *v33;
  id v34;
  unsigned int BytesPerRow;
  CGDataProvider *DataProvider;
  uint64_t BytePtr;
  const __CFData *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const __CFData *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[32];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  CGSize v59;
  CGSize v60;
  CGSize v61;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__481;
  v53 = __Block_byref_object_dispose__482;
  v54 = 0;
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "limits");
  LODWORD(v3) = *(_DWORD *)(v9 + 132);
  LODWORD(v4) = *(_DWORD *)(v9 + 136);

  v10 = (double)v3;
  v11 = (double)v4;
  if (CGImageGetImageProvider())
  {
    v12 = CGImageProviderCopyImageTextureData();
    if (v12)
    {
      PixelFormat = CGImageTextureDataGetPixelFormat();
      CGImageTextureDataGetSize();
      v16 = v15;
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 1;
      if (PixelFormat)
      {
        v17 = v14;
        objc_msgSend(v7, "device");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v56 = 0u;
        memset(buf, 0, sizeof(buf));
        MTLPixelFormatGetInfoForDevice();
        v19 = (~*(_DWORD *)&buf[8] & 5) == 0;

        if (v19)
        {
          if (MEMORY[0x2495B088C](v16, v17, v10, v11))
          {
            PXGTungstenGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v59.width = v16;
              v59.height = v17;
              NSStringFromCGSize(v59);
              v21 = (id)objc_claimAutoreleasedReturnValue();
              v60.width = v10;
              v60.height = v11;
              NSStringFromCGSize(v60);
              v22 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "device");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v21;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v22;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v23;
              _os_log_impl(&dword_24943D000, v20, OS_LOG_TYPE_ERROR, "Texture Data is too large %{public}@ > %{public}@ for device:%{public}@", buf, 0x20u);

            }
          }
          else
          {
            CGImageTextureDataSupportsTiledLayout();
            v44 = v7;
            CGImageTextureDataGetDataWithBlock();
            v20 = v44;
          }
        }
        else
        {
          PXGTungstenGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "device");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = PixelFormat;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v24;
            _os_log_impl(&dword_24943D000, v20, OS_LOG_TYPE_DEFAULT, "Texture Data pixelFormat:%lu not supported for device:%{public}@", buf, 0x16u);

          }
        }
      }
      else
      {
        PXGTungstenGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v12;
          _os_log_impl(&dword_24943D000, v20, OS_LOG_TYPE_ERROR, "Texture Data has no valid pixelFormat:%@", buf, 0xCu);
        }
      }

      if (*((_BYTE *)v46 + 24))
        CGImageTextureDataRelease();
      _Block_object_dispose(&v45, 8);
    }
  }
  if (!v50[5])
  {
    v25 = PXGMetalPixelFormatForCGImage(a1, a3);
    Width = CGImageGetWidth(a1);
    Height = CGImageGetHeight(a1);
    if (!v25)
    {
      PXGTungstenGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        v33 = "Image has no valid metal pixel format:%@";
LABEL_26:
        _os_log_impl(&dword_24943D000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
      }
LABEL_27:

      goto LABEL_28;
    }
    v28 = (double)Width;
    v29 = (double)Height;
    if (MEMORY[0x2495B088C]((double)Width, (double)Height, v10, v11))
    {
      PXGTungstenGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v61.width = v10;
        v61.height = v11;
        NSStringFromCGSize(v61);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "device");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v32;
        _os_log_impl(&dword_24943D000, v30, OS_LOG_TYPE_ERROR, "Too large image %{public}@ > %{public}@ for device:%{public}@", buf, 0x20u);

      }
      goto LABEL_27;
    }
    if (CGImageGetAlphaInfo(a1) - 3 <= 1)
    {
      PXGTungstenGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = a1;
        v33 = "Image has straight alpha %{public}@";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    BytesPerRow = CGImageGetBytesPerRow(a1);
    DataProvider = CGImageGetDataProvider(a1);
    BytePtr = CGDataProviderRetainBytePtr();
    if (BytePtr)
    {
      v39 = 0;
    }
    else
    {
      v43 = CGDataProviderCopyData(DataProvider);
      v39 = v43;
      if (!v43)
        goto LABEL_28;
      if (CFDataGetLength(v43) < 1)
        goto LABEL_34;
      BytePtr = (uint64_t)CFDataGetBytePtr(v39);
      if (!BytePtr)
        goto LABEL_34;
    }
    _createMetal2DTextureWithPixelFormat(v25, v7, 0, v28, v29);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v50[5];
    v50[5] = v40;

    v42 = v50[5];
    if (v42)
    {
      memset(buf, 0, 24);
      *(_QWORD *)&buf[24] = (unint64_t)v28;
      *(_QWORD *)&v56 = (unint64_t)v29;
      *((_QWORD *)&v56 + 1) = 1;
      objc_msgSend(v7, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", BytePtr, v42, buf, (unint64_t)(v29 * (double)BytesPerRow));
    }
    if (!v39)
    {
      CGDataProviderReleaseBytePtr();
      goto LABEL_28;
    }
LABEL_34:
    CFRelease(v39);
  }
LABEL_28:
  v34 = (id)v50[5];
  _Block_object_dispose(&v49, 8);

  return v34;
}

void sub_24944AF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__481(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__482(uint64_t a1)
{

}

uint64_t PXGMetalPixelFormatForCGImage(CGImage *a1, int *a2)
{
  __int16 BitmapInfo;
  size_t BitsPerPixel;
  size_t BitsPerComponent;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  _BOOL4 v13;
  _BOOL4 v14;
  unint64_t v15;
  _BOOL4 v16;
  char v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  int v21;
  char v22;
  NSObject *v23;
  int v25;
  CGImage *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  BitmapInfo = CGImageGetBitmapInfo(a1);
  BitsPerPixel = CGImageGetBitsPerPixel(a1);
  BitsPerComponent = CGImageGetBitsPerComponent(a1);
  v7 = BitmapInfo & 0x1B;
  v8 = (BitmapInfo & 0x1F) == 7 && (BitmapInfo & 0x1B) != 1;
  v9 = v7 != 2 && (BitmapInfo & 0x1B) == 1;
  if (v7 == 2)
    v8 = 0;
  v10 = v7 == 2;
  v11 = (BitmapInfo & 0x3000) != 0 && v10;
  v12 = (BitmapInfo & 0x3000) == 0 && v10;
  v13 = (BitmapInfo & 0x3000) != 0 && v9;
  v14 = (BitmapInfo & 0x3000) == 0 && v9;
  v15 = (BitsPerPixel + BitsPerComponent - 1) / BitsPerComponent;
  if ((BitmapInfo & 0x100) != 0)
  {
    if (v15 == 4)
    {
      v19 = 0;
      if (BitsPerComponent == 16)
      {
        v18 = 115;
        goto LABEL_70;
      }
      if (BitsPerComponent == 32)
      {
        v19 = 0;
        v18 = 125;
        goto LABEL_70;
      }
      goto LABEL_66;
    }
LABEL_46:
    v18 = 0;
    v19 = 0;
LABEL_67:
    PXGTungstenGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v25 = 138412290;
      v26 = a1;
      _os_log_impl(&dword_24943D000, v23, OS_LOG_TYPE_DEBUG, "No matching MTLPixelFormat for image:%@", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_70;
  }
  if (BitsPerComponent != 8)
  {
    if (BitsPerComponent == 5)
    {
      v16 = v15 != 4;
      v17 = v15 != 4 || v11;
      if (v15 == 4)
        v18 = 43;
      else
        v18 = 0;
      v19 = 0;
      if ((v17 & 1) == 0)
      {
        if (v13)
        {
          v18 = 41;
          goto LABEL_70;
        }
LABEL_66:
        v18 = 0;
        goto LABEL_67;
      }
    }
    else
    {
      v20 = BitsPerComponent == 16 && v15 == 4;
      v16 = !v20;
      v21 = !v20 || v14;
      v22 = v21 | v12;
      if (v20)
        v18 = 110;
      else
        v18 = 0;
      if ((v22 & 1) == 0)
      {
        v19 = 0;
        if (v13)
        {
          v18 = 110;
          goto LABEL_70;
        }
        goto LABEL_66;
      }
      v19 = v21 ^ 1;
    }
    if (!v16)
      goto LABEL_70;
    goto LABEL_67;
  }
  if (v15 != 4)
  {
    if (v15 == 2)
    {
      v19 = 8;
      v18 = 30;
      goto LABEL_70;
    }
    if (v15 == 1)
    {
      if (v8)
        v19 = 0;
      else
        v19 = 4;
      if (v8)
        v18 = 1;
      else
        v18 = 10;
      goto LABEL_70;
    }
    goto LABEL_46;
  }
  if (v11)
    v18 = 80;
  else
    v18 = 70;
  if (v11 || v14)
  {
    v19 = 0;
    goto LABEL_70;
  }
  if (v13)
    v19 = 2;
  else
    v19 = 0;
  if (v13)
    v18 = 80;
  else
    v18 = 0;
  if (!v13 && v12)
  {
    v19 = 1;
    v18 = 70;
    goto LABEL_70;
  }
  if (!v13)
    goto LABEL_67;
LABEL_70:
  if (a2)
    *a2 = v19;
  return v18;
}

id _createMetal2DTextureWithPixelFormat(uint64_t a1, void *a2, int a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _createMetal2DTextureDescriptorWithPixelFormat(a1, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "newTextureWithDescriptor:", v11);
  if (!v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v9, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v15;
      v18 = 2048;
      v19 = a1;
      v20 = 2112;
      v21 = v11;
      _os_log_fault_impl(&dword_24943D000, v13, OS_LOG_TYPE_FAULT, "Device:%@ failed to create pixelFormat:%lu texture:%@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v12;
}

id _createMetal2DTextureDescriptorWithPixelFormat(uint64_t a1, int a2, double a3, double a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a1, (unint64_t)a3, (unint64_t)a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceOptions:", 0);
  if (a2)
    v6 = 3;
  else
    v6 = 1;
  objc_msgSend(v5, "setUsage:", v6);
  return v5;
}

uint64_t PXGMetalPixelFormatStrippingSRGB(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 204)
    v1 = 204;
  else
    v1 = a1;
  if (a1 == 186)
    return 204;
  else
    return v1;
}

BOOL PXGCGImageHasStraightAlpha(CGImage *a1)
{
  return CGImageGetAlphaInfo(a1) - 3 < 2;
}

uint64_t PXGMetalPixelFormatForCIImage()
{
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1)
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_472);
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay)
    return 554;
  else
    return 80;
}

id PXGCreateMetalTextureToRenderCIImage(void *a1, void *a2)
{
  unint64_t v2;
  unint64_t v3;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  double v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  CGSize v29;
  CGSize v30;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "limits");
  LODWORD(v2) = *(_DWORD *)(v8 + 132);
  LODWORD(v3) = *(_DWORD *)(v8 + 136);

  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1)
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_472);
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay)
    v9 = 554;
  else
    v9 = 80;
  objc_msgSend(v5, "extent");
  v11 = v10;
  v13 = v12;
  if (PXSizeIsEmpty())
  {
    PXGTungstenGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v29.width = v11;
      v29.height = v13;
      NSStringFromCGSize(v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v5;
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = v16;
      v17 = "Empty image %{public}@ with size %{public}@ for device:%{public}@";
LABEL_12:
      _os_log_impl(&dword_24943D000, v14, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, 0x20u);

    }
  }
  else
  {
    v18 = (double)v2;
    v19 = (double)v3;
    if (!MEMORY[0x2495B088C](v11, v13, v18, v19))
    {
      _createMetal2DTextureWithPixelFormat(v9, v6, 1, v11, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    PXGTungstenGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v30.width = v18;
      v30.height = v19;
      NSStringFromCGSize(v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v5;
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = v16;
      v17 = "Too large image %{public}@ > %{public}@ for device:%{public}@";
      goto LABEL_12;
    }
  }

  v20 = 0;
LABEL_15:

  return v20;
}

id PXGSupportedPixelBufferFormats()
{
  if (PXGSupportedPixelBufferFormats_onceToken != -1)
    dispatch_once(&PXGSupportedPixelBufferFormats_onceToken, &__block_literal_global_43);
  return (id)PXGSupportedPixelBufferFormats_supported;
}

uint64_t PXGCreateMetalTexturesFromPixelBuffer(__CVBuffer *a1, void *a2, __CVMetalTextureCache *a3, NSObject **a4, _QWORD *a5, int *a6)
{
  id v11;
  __IOSurface *IOSurface;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  signed int PixelFormatType;
  int v19;
  size_t PlaneCount;
  signed int v21;
  signed int v22;
  unsigned __int16 v23;
  MTLPixelFormat v24;
  MTLPixelFormat v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  uint8_t buf[4];
  __CVBuffer *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v29 = 0;
  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    PXGCreateMetalTextureFromIOSurface(IOSurface, v11, &v29);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v17 = 0;
  if (PixelFormatType <= 875704421)
  {
    if (PixelFormatType == 32)
      goto LABEL_12;
    v19 = 846624121;
  }
  else
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 2016686640)
      goto LABEL_12;
    v19 = 875704438;
  }
  if (PixelFormatType != v19)
    goto LABEL_41;
LABEL_12:
  PlaneCount = CVPixelBufferGetPlaneCount(a1);
  v21 = CVPixelBufferGetPixelFormatType(a1);
  v22 = v21;
  if (PlaneCount != 2)
  {
    if (PlaneCount || v21 != 32)
    {
      v17 = 0;
      if (PlaneCount || v21 != 846624121)
        goto LABEL_41;
      CVMetalTextureCacheFlush(a3, 0);
      v29 = _PXGShaderFlagsForYCbCrPixelBuffer(a1) | 0x10;
      _createMetalTextureForPixelBufferPlane(a1, MTLPixelFormatBGRG422, 0, a3);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        PXAssertGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        *(_DWORD *)buf = 138412290;
        v31 = a1;
        goto LABEL_32;
      }
    }
    else
    {
      CVMetalTextureCacheFlush(a3, 0);
      v29 = 1;
      _createMetalTextureForPixelBufferPlane(a1, MTLPixelFormatRGBA8Unorm, 0, a3);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        PXAssertGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        *(_DWORD *)buf = 138412290;
        v31 = a1;
LABEL_32:
        _os_log_error_impl(&dword_24943D000, v14, OS_LOG_TYPE_ERROR, "Unable to create texture for video pixelBuffer %@", buf, 0xCu);
        goto LABEL_39;
      }
    }
LABEL_3:
    v14 = v13;
    v15 = 0;
LABEL_4:
    v14 = objc_retainAutorelease(v14);
    *a4 = v14;
    v16 = objc_retainAutorelease(v15);
    *a5 = v16;
    *a6 = v29;

    v17 = 1;
LABEL_40:

    goto LABEL_41;
  }
  v17 = 0;
  if (v21 > 875704437)
  {
    if (v21 == 2016686640)
      goto LABEL_24;
    v23 = 12406;
  }
  else
  {
    if (v21 == 32)
      goto LABEL_24;
    v23 = 12390;
  }
  if (v21 == (v23 | 0x34320000))
  {
LABEL_24:
    CVMetalTextureCacheFlush(a3, 0);
    v29 = _PXGShaderFlagsForYCbCrPixelBuffer(a1);
    if (v22 == 2016686640 || v22 == 32)
    {
      v24 = MTLPixelFormatRG16Unorm;
      v25 = MTLPixelFormatR16Unorm;
    }
    else
    {
      v24 = MTLPixelFormatRG8Unorm;
      v25 = MTLPixelFormatR8Unorm;
    }
    _createMetalTextureForPixelBufferPlane(a1, v25, 0, a3);
    v14 = objc_claimAutoreleasedReturnValue();
    _createMetalTextureForPixelBufferPlane(a1, v24, 1uLL, a3);
    v26 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v26;
    if (v14 && v26)
      goto LABEL_4;
    PXAssertGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = a1;
      _os_log_error_impl(&dword_24943D000, v27, OS_LOG_TYPE_ERROR, "Unable to create texture for video pixelBuffer %@", buf, 0xCu);
    }

LABEL_39:
    v17 = 0;
    goto LABEL_40;
  }
LABEL_41:

  return v17;
}

uint64_t _PXGShaderFlagsForYCbCrPixelBuffer(__CVBuffer *a1)
{
  uint64_t PixelFormatType;
  int v3;
  uint64_t v4;
  int is_video_range;
  unsigned __int8 v6;
  const __CFDictionary *Attributes;
  const __CFDictionary *Value;
  const __CFDictionary *v9;
  const void *v10;
  void *v11;
  void *v12;
  CFTypeRef v13;
  const void *v14;
  BOOL v15;
  char v16;
  int v17;
  int v19;
  char v20;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v3 = PixelFormatType;
  v4 = ycbcr_fourcc_bits_per_component(PixelFormatType);
  is_video_range = ycbcr_fourcc_is_video_range(v3);
  if (is_video_range)
    v6 = 1;
  else
    v6 = 2;
  Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
  if (Attributes)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x24BDC56A8]);
    if (Value)
    {
      v9 = Value;
      v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BDC5730]);
      if (v10)
        is_video_range = CFEqual(v10, (CFTypeRef)*MEMORY[0x24BDC5738]) != 0;
      CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BDC5720]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        v4 = (int)objc_msgSend(v11, "intValue");

    }
  }
  v13 = CVBufferCopyAttachment(a1, (CFStringRef)*MEMORY[0x24BDC5570], 0);
  if (v13)
  {
    v14 = v13;
    if (CFEqual(v13, (CFTypeRef)*MEMORY[0x24BDC5590]))
    {
      v15 = is_video_range == 0;
      v16 = 1;
    }
    else if (CFEqual(v14, (CFTypeRef)*MEMORY[0x24BDC55A8]))
    {
      v15 = is_video_range == 0;
      v16 = 3;
    }
    else
    {
      if (!CFEqual(v14, (CFTypeRef)*MEMORY[0x24BDC5580]))
      {
        v19 = CFEqual(v14, (CFTypeRef)*MEMORY[0x24BDC55B8]);
        if (is_video_range)
          v20 = 7;
        else
          v20 = 8;
        if (v19)
          v6 = v20;
        goto LABEL_21;
      }
      v15 = is_video_range == 0;
      v16 = 5;
    }
    if (v15)
      v6 = v16 + 1;
    else
      v6 = v16;
LABEL_21:
    CFRelease(v14);
  }
  if (v4 == 10)
    v17 = 0x2000;
  else
    v17 = 4096;
  return v17 | (v6 << 8);
}

id _createMetalTextureForPixelBufferPlane(__CVBuffer *a1, MTLPixelFormat a2, size_t planeIndex, __CVMetalTextureCache *a4)
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  CVReturn v10;
  void *v11;
  CVMetalTextureRef image;

  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, planeIndex);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, planeIndex);
  image = 0;
  v10 = CVMetalTextureCacheCreateTextureFromImage(0, a4, a1, 0, a2, WidthOfPlane, HeightOfPlane, planeIndex, &image);
  v11 = 0;
  if (!v10)
  {
    CVMetalTextureGetTexture(image);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CVBufferRelease(image);
  return v11;
}

uint64_t PXGPlaceholderImageWithColor()
{
  return PXCreateCGImageWithDrawBlock();
}

uint64_t PXGLightPlaceholderImage()
{
  return PXCreateCGImageWithDrawBlock();
}

uint64_t PXGDarkPlaceholderImage()
{
  return PXCreateCGImageWithDrawBlock();
}

uint64_t PXGOffscreenMetalPixelFormatForDrawableFormat(uint64_t result, int a2)
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  if (result <= 114)
  {
    if (result == 80)
      return result;
    if (result == 90)
    {
      v2 = a2 == 0;
      v3 = 115;
      v4 = 90;
LABEL_9:
      if (v2)
        return v3;
      else
        return v4;
    }
    return 80;
  }
  if (result != 115 && result != 552)
  {
    if (result == 554)
    {
      v2 = a2 == 0;
      v3 = 552;
      v4 = 554;
      goto LABEL_9;
    }
    return 80;
  }
  return result;
}

uint64_t PXGBytesPerPixelForMetalPixelFormat(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a1 - 1;
  result = 1;
  switch(v2)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
      goto LABEL_6;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 39:
    case 40:
    case 41:
    case 42:
      return 2;
    case 52:
    case 53:
    case 54:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      return 4;
    case 102:
    case 103:
    case 104:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      return 8;
    case 122:
    case 123:
    case 124:
      return 16;
    default:
      if ((unint64_t)(a1 - 552) < 2)
        return 8;
      if ((unint64_t)(a1 - 554) >= 2)
      {
LABEL_6:
        v4 = a1;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSUInteger PXGBytesPerPixelForMetalPixelFormat(MTLPixelFormat)");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTextureUtilities.m"), 1857, CFSTR("Unsupported pixel format:%lu"), v4);

        abort();
      }
      return 4;
  }
}

id PXGCreateIOSurface2DTexture(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  IOSurfaceRef v29;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[7];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v4, "pixelFormat");
  v6 = v5;
  v7 = 0;
  v31 = v3;
  if (v5 > 69)
  {
    if (v5 > 114)
    {
      if ((unint64_t)(v5 - 554) < 2)
      {
        v8 = 1999843442;
        goto LABEL_42;
      }
      if (v5 == 115)
      {
        v8 = 1380411457;
        goto LABEL_42;
      }
      if (v5 != 125)
        goto LABEL_50;
      v9 = 26177;
    }
    else
    {
      if (v5 > 89)
      {
        switch(v5)
        {
          case 'Z':
            v8 = 1378955371;
            break;
          case '^':
            v8 = 1815162994;
            break;
          case 'n':
            v8 = 1815491698;
            break;
          default:
            goto LABEL_50;
        }
        goto LABEL_42;
      }
      if (v5 != 70)
      {
        if (v5 != 80)
          goto LABEL_50;
        v8 = 1111970369;
        goto LABEL_42;
      }
      v9 = 16961;
    }
    v8 = v9 | 0x52470000u;
  }
  else if (v5 <= 39)
  {
    if (v5 > 19)
    {
      if (v5 == 20)
      {
        v8 = 1278226742;
      }
      else
      {
        if (v5 != 30)
          goto LABEL_50;
        v8 = 1279340600;
      }
    }
    else if (v5 == 1)
    {
      v8 = 1093677112;
    }
    else
    {
      if (v5 != 10)
        goto LABEL_50;
      v8 = 1278226488;
    }
  }
  else if (v5 <= 42)
  {
    if (v5 == 40)
    {
      v8 = 1278555701;
    }
    else
    {
      if (v5 != 42)
        goto LABEL_50;
      v8 = 875836468;
    }
  }
  else
  {
    switch(v5)
    {
      case '+':
        v8 = 1278555445;
        break;
      case '<':
        v8 = 843264310;
        break;
      case 'A':
        v8 = 843264104;
        break;
      default:
        goto LABEL_50;
    }
  }
LABEL_42:
  v10 = *MEMORY[0x24BDD8FD0];
  v11 = MEMORY[0x2495B06A0](*MEMORY[0x24BDD8FD0], objc_msgSend(v4, "width"));
  v12 = *MEMORY[0x24BDD8EB0];
  v13 = MEMORY[0x2495B06A0](*MEMORY[0x24BDD8EB0], objc_msgSend(v4, "height"));
  v14 = PXGBytesPerPixelForMetalPixelFormat(v6);
  v15 = *MEMORY[0x24BDD8E38];
  v16 = MEMORY[0x2495B06A0](*MEMORY[0x24BDD8E38], v14 * v11);
  v17 = MEMORY[0x2495B06F4](v10);
  v18 = MEMORY[0x2495B06F4](v12);
  v19 = MEMORY[0x2495B06F4](v15);
  v20 = v19;
  if (v11 > v17 || v13 > v18 || v16 > v19)
  {
    PXGTungstenGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      v35 = v11;
      v36 = 1024;
      v37 = v13;
      v38 = 1024;
      v39 = v17;
      v40 = 1024;
      v41 = v18;
      v42 = 1024;
      v43 = v16;
      v44 = 1024;
      v45 = v20;
      _os_log_impl(&dword_24943D000, v28, OS_LOG_TYPE_DEFAULT, "Texture creation failed: exceeded IOSurface limits. size:(%u, %u) maxSize:(%u, %u) bytesPerRow:%u maxBytesPerRow:%u", buf, 0x26u);
    }
    v7 = 0;
    v3 = v31;
  }
  else
  {
    v21 = v16 * v13;
    v32[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    v32[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    v32[2] = *MEMORY[0x24BDD8D38];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v24;
    v32[3] = *MEMORY[0x24BDD8D40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v25;
    v32[4] = *MEMORY[0x24BDD8D30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v26;
    v32[5] = *MEMORY[0x24BDD8D60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = CFSTR("kIOSurfaceName");
    v33[5] = v27;
    v33[6] = CFSTR("PXGIOSurface");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = IOSurfaceCreate((CFDictionaryRef)v28);
    v3 = v31;
    v7 = (void *)objc_msgSend(v31, "newTextureWithDescriptor:iosurface:plane:", v4, v29, 0);
    CFRelease(v29);
  }

LABEL_50:
  return v7;
}

uint64_t PXGCreateBurstImageStackFromImage()
{
  return PXCreateCGImageWithDrawBlock();
}

double PXGCreateTextureInfo@<D0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8, double a9, double a10, double a11, float32x4_t a12, int a13)
{
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double result;
  uint64_t v35;
  float v36;
  uint64_t v37;
  float v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64_t v49;
  double v50;
  double v56;
  CGAffineTransform v61;
  CGAffineTransform v62;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17.f64[0] = a3;
  v19 = vcvt_hight_f64_f32(a12);
  v20 = vcvtq_f64_f32(*(float32x2_t *)a12.f32);
  v21 = 0.0;
  v22 = 0.0;
  switch(a1)
  {
    case 1:
      *(float64x2_t *)&v61.a = v20;
      *(float64x2_t *)&v61.c = v19;
      v61.tx = 0.0;
      v61.ty = 0.0;
      v23 = 1.57079633;
      goto LABEL_4;
    case 2:
      *(float64x2_t *)&v61.a = v20;
      *(float64x2_t *)&v61.c = v19;
      v61.tx = 0.0;
      v61.ty = 0.0;
      v23 = 3.14159265;
LABEL_4:
      v49 = v17.f64[0];
      CGAffineTransformRotate(&v62, &v61, v23);
      v17.f64[0] = v49;
      v16 = a4;
      v20 = *(float64x2_t *)&v62.a;
      v19 = *(float64x2_t *)&v62.c;
      break;
    case 3:
      break;
    case 4:
      v50 = a3;
      v56 = a4;
      v39 = v20;
      v44 = v19;
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFillingRect();
      goto LABEL_7;
    case 5:
      v50 = a3;
      v56 = a4;
      v39 = v20;
      v44 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
LABEL_7:
      v20 = v39;
      v19 = v44;
      v17.f64[0] = v50;
      v16 = v56;
      v22 = v24;
      goto LABEL_12;
    case 6:
      v40 = v20;
      v45 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v20 = v40;
      v19 = v45;
      v17.f64[0] = a3;
      v16 = a4;
      v22 = v28;
      goto LABEL_13;
    case 7:
      v41 = v20;
      v46 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v20 = v41;
      v19 = v46;
      v17.f64[0] = a3;
      v16 = a4;
      v21 = v29;
      v14 = v30;
      v22 = v15 - a10;
      v15 = v31;
      break;
    case 8:
      v42 = v20;
      v47 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v20 = v42;
      v19 = v47;
      v17.f64[0] = a3;
      v16 = a4;
      v22 = v32;
      v15 = v33;
      v21 = v14 - a11;
      goto LABEL_14;
    case 9:
      v43 = v20;
      v48 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v20 = v43;
      v19 = v48;
      v17.f64[0] = a3;
      v16 = a4;
LABEL_12:
      v21 = v25;
LABEL_13:
      v15 = v26;
LABEL_14:
      v14 = v27;
      break;
    case 10:
      v14 = a11;
      v15 = a10;
      v21 = a9;
      goto LABEL_19;
    case 11:
      v22 = a5 - a10;
      v14 = a11;
      v15 = a10;
      v21 = a9;
      break;
    case 12:
      v22 = a5 - a10;
      v21 = a6 - a11;
      v14 = a11;
      v15 = a10;
      break;
    case 13:
      v21 = a6 - a11;
      v14 = a11;
      v15 = a10;
LABEL_19:
      v22 = a8;
      break;
    default:
      v22 = 0.0;
      break;
  }
  result = 0.0;
  *(float *)&v35 = v22 * a7;
  v36 = v21 * a7;
  *((float *)&v35 + 1) = v36;
  *(float *)&v37 = v15 * a7;
  v38 = v14 * a7;
  *((float *)&v37 + 1) = v38;
  *(_QWORD *)a2 = v35;
  *(_QWORD *)(a2 + 8) = v37;
  v17.f64[1] = v16;
  *(_OWORD *)(a2 + 16) = 0u;
  *(float32x2_t *)(a2 + 16) = vcvt_f32_f64(v17);
  *(float32x4_t *)(a2 + 32) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v19);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 48) = a13;
  return result;
}

double PXGAbsoluteTime()
{
  if (!dword_25786598C)
    mach_timebase_info((mach_timebase_info_t)&PXGAbsoluteTime_sTimebase);
  return (double)(mach_absolute_time() * PXGAbsoluteTime_sTimebase / dword_25786598C)
       / 1000000000.0;
}

double PXGClearColorFromColor(void *a1, CGColorSpace *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  size_t NumberOfComponents;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MTLClearColor PXGClearColorFromColor(UIColor *__strong _Nonnull, CGColorSpaceRef _Nonnull)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXGTextureUtilities.m"), 2095, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("color != nil"));

  }
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  if ((objc_msgSend(v3, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17) & 1) == 0)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_fault_impl(&dword_24943D000, v4, OS_LOG_TYPE_FAULT, "Unable to retrieve color components from backgroundColor:%@", buf, 0xCu);
    }

    v17 = 0x3FF0000000000000;
    v18 = 0x3FF0000000000000;
    v19 = 0x3FF0000000000000;
    v20 = 0x3FF0000000000000;
  }
  v5 = objc_retainAutorelease(v3);
  CGColorGetColorSpace((CGColorRef)objc_msgSend(v5, "CGColor"));
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(a2, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(objc_retainAutorelease(v5), "CGColor"), 0);
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
    if (NumberOfComponents != 3)
    {
      if (NumberOfComponents == 2)
      {
        v10 = *((_QWORD *)Components + 1);
        v18 = *(_QWORD *)Components;
        v19 = v18;
        v20 = v18;
      }
      else
      {
        if (NumberOfComponents == 1)
        {
          v18 = *(_QWORD *)Components;
          v19 = v18;
          v20 = v18;
LABEL_13:
          v17 = 0x3FF0000000000000;
LABEL_18:
          CGColorRelease(CopyByMatchingToColorSpace);
          goto LABEL_19;
        }
        if (NumberOfComponents < 4)
          goto LABEL_18;
        v11 = *(_QWORD *)Components;
        v19 = *((_QWORD *)Components + 1);
        v20 = v11;
        v10 = *((_QWORD *)Components + 3);
        v18 = *((_QWORD *)Components + 2);
      }
      v17 = v10;
      goto LABEL_18;
    }
    v9 = *(_QWORD *)Components;
    v19 = *((_QWORD *)Components + 1);
    v20 = v9;
    v18 = *((_QWORD *)Components + 2);
    goto LABEL_13;
  }
LABEL_19:
  v12 = *(double *)&v20;
  v13 = *(double *)&v17;

  return v12 * v13;
}

void sub_24944E650(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PXGEntityDescription(unsigned int a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{id=%ld}"), a1);
}

uint64_t PXGSpriteIndexesEnumerateRanges(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v4 = a2;
    v5 = result;
    v6 = 0;
    do
    {
      v7 = (unsigned int *)(v5 + 4 * v6);
      v8 = *v7;
      v9 = 1;
      if (v4 >= 2)
      {
        while ((_DWORD)v8 + (_DWORD)v9 == v7[v9])
        {
          if (v4 == ++v9)
          {
            v9 = v4;
            break;
          }
        }
      }
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v8 | (v9 << 32), v6);
      v6 += v9;
      v4 -= v9;
    }
    while (v4);
  }
  return result;
}

void PXGSpriteIndexesEnumerateRangesForPositions(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke;
  v7[3] = &unk_251A6E4A8;
  v8 = v5;
  v9 = a1;
  v6 = v5;
  objc_msgSend(a2, "enumerateRangesUsingBlock:", v7);

}

void sub_24944F8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24944FF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2494511AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__985(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__986(uint64_t a1)
{

}

BOOL PXGSpriteGeometryIsNull(uint64_t a1)
{
  _BOOL8 result;
  uint64_t v3;

  result = 0;
  v3 = *(_QWORD *)(a1 + 24);
  if (*(float *)&v3 == 0.0 && *((float *)&v3 + 1) == 0.0)
  {
    result = 0;
    if (*(double *)a1 == 0.0 && *(double *)(a1 + 8) == 0.0)
      return *(double *)(a1 + 16) == 0.0;
  }
  return result;
}

BOOL PXGCornerRadiusIsNull(float a1, float a2, float a3, float a4)
{
  return a1 == -1.0 && a2 == -1.0 && a3 == -1.0 && a4 == -1.0;
}

uint64_t PXGCornerRadiusDescription(float a1, float a2, float a3, float a4)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{⌜:%.1f ⌝:%.1f ⌞:%.1f ⌟:%.1f}"), a1, a2, a3, a4);
}

uint64_t PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect()
{
  uint64_t i;
  uint64_t result;
  char v2;

  for (i = 0; i != 4; ++i)
  {
    PXRectEdgeValue();
    PXRectEdgeValue();
    result = PXFloatApproximatelyEqualToFloat();
    *(&v2 + i) = result;
  }
  return result;
}

float PXGCornerRadiusByLinearlyInterpolatingCornerRadii()
{
  uint64_t v0;
  double v1;
  _QWORD v3[2];

  v0 = 0;
  v3[0] = 0;
  v3[1] = 0;
  do
  {
    PXFloatByLinearlyInterpolatingFloats();
    *(float *)&v1 = v1;
    *(_DWORD *)((char *)v3 + v0) = LODWORD(v1);
    v0 += 4;
  }
  while (v0 != 16);
  return *(float *)v3;
}

id PXGSpriteGeometryTransformDescription(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  CGAffineTransform transform;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&transform.a = *(_OWORD *)a1;
  *(_OWORD *)&transform.c = v3;
  *(_OWORD *)&transform.tx = *(_OWORD *)(a1 + 32);
  NSStringFromCGAffineTransform(&transform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{affineTransform:%@, tz:%.3f}"), v4, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void PXGAssertErrValidSprites(unsigned int *a1)
{
  PXGAssertErrValidGeometries(*a1, *((uint64_t **)a1 + 2));
  PXGAssertErrValidInfos(*a1, *((unsigned __int8 **)a1 + 4));
  PXGAssertErrValidStyles(*a1, *((_QWORD *)a1 + 3));
}

void PXGAssertErrValidGeometries(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
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
  float v20;

  if (a1 >= 1)
  {
    v3 = a1;
    v4 = 0x24BDD1000uLL;
    v5 = 0x24BDD1000uLL;
    do
    {
      v6 = *a2;
      if ((*a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("center.x"), v6);

      }
      v7 = a2[1];
      if ((v7 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("center.y"), v7);

        v4 = 0x24BDD1000;
      }
      v8 = a2[2];
      if ((v8 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("center.z"), v8);

        v5 = 0x24BDD1000;
      }
      if (((_DWORD)a2[3] & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v20 = COERCE_FLOAT(a2[3]);
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("size.x"), v20);

        v9 = *((float *)a2 + 7);
      }
      else
      {
        LODWORD(v9) = HIDWORD(a2[3]);
      }
      if ((LODWORD(v9) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("size.y"), v9);

      }
      a2 += 4;
      --v3;
    }
    while (v3);
  }
}

void PXGAssertErrValidInfos(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  float v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1 >= 1)
  {
    v3 = a1;
    do
    {
      if (*a2 >= 3u)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXGAssertErrValidInfos(NSInteger, PXGSpriteInfo * _Nonnull)");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGTypes.m"), 166, CFSTR("Invalid value: presentationType=%d"), *a2);

      }
      if ((*((_DWORD *)a2 + 2) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v7 = COERCE_FLOAT(*((_QWORD *)a2 + 1));
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("mediaTargetSize.x"), v7);

        v4 = *((float *)a2 + 3);
      }
      else
      {
        LODWORD(v4) = HIDWORD(*((_QWORD *)a2 + 1));
      }
      if ((LODWORD(v4) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("mediaTargetSize.y"), v4);

      }
      v5 = *((float *)a2 + 4);
      if ((LODWORD(v5) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("mediaAspectRatio"), v5);

      }
      a2 += 40;
      --v3;
    }
    while (v3);
  }
}

void PXGAssertErrValidStyles(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  float *v3;
  unint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  float v15;
  float v16;
  __int128 v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  __int128 v66;

  if (a1 >= 1)
  {
    v2 = a1;
    v3 = (float *)(a2 + 8);
    v4 = 0x24BDD1000uLL;
    v5 = 0x24BDD1000uLL;
    v6 = CFSTR("alpha");
    v7 = CFSTR("contentsRect.x");
    v8 = CFSTR("contentsRect.y");
    v9 = CFSTR("contentsRect.z");
    v10 = CFSTR("contentsRect.w");
    v11 = CFSTR("cornerRadius.topLeft");
    v12 = CFSTR("cornerRadius.topRight");
    v13 = CFSTR("cornerRadius.bottomLeft");
    v14 = CFSTR("cornerRadius.bottomRight");
    do
    {
      v15 = *(v3 - 2);
      if ((LODWORD(v15) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v25 = *(void **)(v4 + 1096);
        v26 = v6;
        v27 = v14;
        objc_msgSend(v25, "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v29 = v5;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v26, v15);

        v5 = v29;
        v14 = v27;
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = v26;
        v4 = 0x24BDD1000;
      }
      v16 = v3[11];
      if ((LODWORD(v16) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v32 = v5;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), CFSTR("zSortOffset"), v16);

        v5 = v32;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v17 = *(_OWORD *)(v3 - 1);
      if ((v17 & 0x7FFFFFFF) >= 0x7F800000)
      {
        v34 = v7;
        v66 = *(_OWORD *)(v3 - 1);
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v36 = v5;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v34, *(float *)&v66);

        v5 = v36;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = v34;
        v6 = CFSTR("alpha");
        v18 = *v3;
      }
      else
      {
        v18 = *((float *)&v17 + 1);
      }
      if ((LODWORD(v18) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v38 = v8;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v40 = v5;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v38, v18);

        v5 = v40;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = v38;
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v19 = v3[1];
      if ((LODWORD(v19) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v42 = v9;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v44 = v5;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v42, v19);

        v5 = v44;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = v42;
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v20 = v3[2];
      if ((LODWORD(v20) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v46 = v10;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v48 = v5;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v46, v20);

        v5 = v48;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = v46;
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v21 = v3[7];
      if ((LODWORD(v21) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v50 = v11;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v52 = v5;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v50, v21);

        v5 = v52;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = v50;
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v22 = v3[8];
      if ((LODWORD(v22) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v54 = v12;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v56 = v5;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v54, v22);

        v5 = v56;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = v54;
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v23 = v3[9];
      if ((LODWORD(v23) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v58 = v13;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v60 = v5;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v58, v23);

        v5 = v60;
        v14 = CFSTR("cornerRadius.bottomRight");
        v13 = v58;
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v24 = v3[10];
      if ((LODWORD(v24) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        v62 = v14;
        objc_msgSend(*(id *)(v4 + 1096), "currentHandler");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v64 = v5;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v65, CFSTR("PXGTypes.m"), 115, CFSTR("Invalid value: %@ = %.3f"), v62, v24);

        v5 = v64;
        v14 = v62;
        v13 = CFSTR("cornerRadius.bottomLeft");
        v12 = CFSTR("cornerRadius.topRight");
        v11 = CFSTR("cornerRadius.topLeft");
        v10 = CFSTR("contentsRect.w");
        v9 = CFSTR("contentsRect.z");
        v8 = CFSTR("contentsRect.y");
        v7 = CFSTR("contentsRect.x");
        v6 = CFSTR("alpha");
      }
      v3 += 40;
      --v2;
    }
    while (v2);
  }
}

void PXGAssertErrValidFloat(double a1)
{
  void *v2;
  id v3;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("float"), *(_QWORD *)&a1);

  }
}

void PXGAssertErrValidPoint(double a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("x"), *(_QWORD *)&a1);

  }
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("y"), *(_QWORD *)&a2);

  }
}

void PXGAssertErrValidRect(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("origin.x"), *(_QWORD *)&a1);

  }
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("origin.y"), *(_QWORD *)&a2);

  }
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("size.width"), *(_QWORD *)&a3);

  }
  if ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("size.height"), *(_QWORD *)&a4);

  }
}

void PXGAssertErrValidAffineTransform(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  id v19;

  v2 = *a1;
  if ((*a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("a"), v2);

  }
  v3 = a1[1];
  if ((v3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("b"), v3);

  }
  v4 = a1[2];
  if ((v4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("c"), v4);

  }
  v5 = a1[3];
  if ((v5 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("d"), v5);

  }
  v6 = a1[4];
  if ((v6 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("tx"), v6);

  }
  v7 = a1[5];
  if ((v7 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXGTypes.m"), 119, CFSTR("Invalid value: %@ = %.3f"), CFSTR("ty"), v7);

  }
}

uint64_t PXGSpriteTextureInfoOrientationToCGOrientation(__n128 a1)
{
  int v1;
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;

  if (a1.n128_f32[2] >= 0.0)
    v1 = 5;
  else
    v1 = 8;
  if (a1.n128_f32[1] > 0.0)
    v2 = v1;
  else
    v2 = 1;
  if (a1.n128_f32[2] >= 0.0)
    v3 = 6;
  else
    v3 = 7;
  if (a1.n128_f32[1] < 0.0)
    v2 = v3;
  if (a1.n128_f32[3] >= 0.0)
    v4 = 1;
  else
    v4 = 4;
  if (a1.n128_f32[0] > 0.0)
    v2 = v4;
  if (a1.n128_f32[3] >= 0.0)
    v5 = 2;
  else
    v5 = 3;
  if (a1.n128_f32[0] < 0.0)
    return v5;
  else
    return v2;
}

uint64_t PXGImageDataSpecDescription(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{pixelFormat:%lu, width:%d, height:%d}"), *(_QWORD *)a1, *(unsigned __int16 *)(a1 + 16), *(unsigned __int16 *)(a1 + 18));
}

unint64_t PXGSpriteIndexRangeUnion(NSRange a1)
{
  NSUInteger location_high;
  NSRange v2;
  NSRange v4;

  location_high = HIDWORD(a1.location);
  a1.location = LODWORD(a1.location);
  v4.length = HIDWORD(a1.length);
  v4.location = LODWORD(a1.length);
  a1.length = location_high;
  v2 = NSUnionRange(a1, v4);
  return LODWORD(v2.location) | ((unint64_t)LODWORD(v2.length) << 32);
}

uint64_t NSStringFromPXGSpriteIndexRange(unint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%li, %li}"), a1, HIDWORD(a1));
}

uint64_t PXGVectorFloat2Description(double a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), *(float *)&a1, *((float *)&a1 + 1));
}

uint64_t PXGVectorFloat3Description(__n128 a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.2f}"), a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2]);
}

uint64_t PXGVectorFloat4Description(__n128 a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.2f, %.2f}"), a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]);
}

uint64_t PXGPositionDescription(double a1, double a2, double a3)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.5f}"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

id PXGSpriteGeometryDescription(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.5f}"), *a1, a1[1], a1[2]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), COERCE_FLOAT(a1[3]), COERCE_FLOAT(HIDWORD(a1[3])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{center=%@, size=%@}"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

float PXSpriteGeometryScaleWithTransform(uint64_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float64x2_t a6, float64_t a7, __n128 a8)
{
  float32x2_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  char v24;
  float result;
  float32x2_t v26;
  float32x2_t v27;
  int8x8_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float64x2_t v35;
  float64x2_t v41;

  v8 = *(float32x2_t *)(a1 + 24);
  v9 = *(double *)(a1 + 16);
  v10 = v9 - a8.n128_f32[2];
  v11 = vmuls_lane_f32(0.5, v8, 1);
  v12 = *(double *)a1;
  v13 = (float)(v12 - (float)(0.5 * v8.f32[0])) - a8.n128_f32[0];
  v14 = *(double *)(a1 + 8);
  v15 = (float)(v11 + v14) - a8.n128_f32[1];
  v16 = (float)(v14 - v11) - a8.n128_f32[1];
  v17 = (float)((float)(0.5 * v8.f32[0]) + v12) - a8.n128_f32[0];
  v18 = vmulq_n_f32(a2, v13);
  v19 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v18, a3, v15), a4, v10));
  v20 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v18, a3, v16), a4, v10));
  v21 = vmulq_n_f32(a2, v17);
  v22 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v21, a3, v16), a4, v10));
  v23 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v21, a3, v15), a4, v10));
  v21.i64[0] = vuzp2q_s32(vuzp2q_s32(v20, v19), v20).u64[0];
  v21.i64[1] = __PAIR64__(v23.u32[3], v22.u32[3]);
  v24 = vmaxv_u16((uint16x4_t)vmovn_s32(vclezq_f32(v21)));
  result = 0.0;
  if ((v24 & 1) == 0)
  {
    v26 = vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 3));
    v27 = vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 3));
    v28 = (int8x8_t)vcgt_f32(v27, v26);
    v29 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v26, (int8x8_t)v27);
    v30 = vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 3));
    v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v29, v30), (int8x8_t)v30, (int8x8_t)v29);
    v32 = vdiv_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 3));
    v33 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v27, (int8x8_t)v26);
    v34 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v33, v30), (int8x8_t)v33, (int8x8_t)v30);
    a6.f64[1] = a7;
    v35 = vmulq_f64(a6, vabdq_f64(vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v32), (int8x8_t)v34, (int8x8_t)v32)), vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v32), (int8x8_t)v32, (int8x8_t)v31))));
    __asm { FMOV            V1.2D, #0.5 }
    v41 = vdivq_f64(vmulq_f64(v35, _Q1), vcvtq_f64_f32(v8));
    if (v41.f64[0] < v41.f64[1])
      v41.f64[0] = v41.f64[1];
    return v41.f64[0];
  }
  return result;
}

id PXGSpriteStyleDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  float32x4_t v4;
  void *v5;
  __int128 v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{"));
  v3 = v2;
  if (*(float *)a1 != 1.0)
    objc_msgSend(v2, "appendFormat:", CFSTR("alpha=%.2f, "), *(float *)a1);
  v4 = *(float32x4_t *)(a1 + 4);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v4, (float32x4_t)xmmword_24945F690)))) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.2f, %.2f}"), v4.f32[0], v4.f32[1], v4.f32[2], v4.f32[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("contentsRect=%@, "), v5);

  }
  v6 = *(_OWORD *)(a1 + 20);
  v7 = COERCE_FLOAT(*(_QWORD *)(a1 + 28));
  if (v7 != 1000000000.0 || *((float *)&v6 + 3) != 1000000000.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f, %.2f, %.2f}"), *(float *)&v6, *((float *)&v6 + 1), v7, *((float *)&v6 + 3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("clippingRect=%@, "), v8);

  }
  v9 = *(float *)(a1 + 36);
  v10 = *(float *)(a1 + 40);
  v11 = *(float *)(a1 + 44);
  v12 = *(float *)(a1 + 48);
  if (v9 != 0.0 || v10 != 0.0 || v11 != 0.0 || v12 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{⌜:%.1f ⌝:%.1f ⌞:%.1f ⌟:%.1f}"), v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("cornerRadius=%@, "), v13);

  }
  v14 = *(float *)(a1 + 52);
  if (v14 != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR("zSortOffset=%.5f, "), v14);
  if (*(_WORD *)(a1 + 68))
    objc_msgSend(v3, "appendFormat:", CFSTR("resizableCapInsetsIndex=%u, "), *(unsigned __int16 *)(a1 + 68));
  v15 = *(unsigned __int8 *)(a1 + 70);
  if (*(_BYTE *)(a1 + 70))
  {
    if (v15 > 0xD)
      v16 = CFSTR("unexpected");
    else
      v16 = off_251A6E848[v15];
    v17 = v16;
    objc_msgSend(v3, "appendFormat:", CFSTR("contentsGravity=%@, "), v17);

  }
  objc_msgSend(v3, "px_removeSuffix:", CFSTR(", "));
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

const __CFString *PXGContentsGravityDescription(unsigned int a1)
{
  if (a1 > 0xD)
    return CFSTR("unexpected");
  else
    return off_251A6E848[a1];
}

const __CFString *PXGPresentationTypeDescription(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("unexpected");
  else
    return off_251A6E8B8[a1];
}

const __CFString *PXGMediaKindDescription(unsigned int a1)
{
  if (a1 > 0xD)
    return CFSTR("unexpected");
  else
    return off_251A6E8D0[a1];
}

id PXGSpriteInfoFlagsDescription(char a1)
{
  id v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, int, void *);
  void *v10;
  id v11;
  char v12;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __PXGSpriteInfoFlagsDescription_block_invoke;
  v10 = &unk_251A6E780;
  v12 = a1;
  v3 = v2;
  v11 = v3;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495B0BB0](&v7);
  ((void (**)(_QWORD, uint64_t, const __CFString *))v4)[2](v4, 1, CFSTR("alwaysLoad"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v4)[2](v4, 2, CFSTR("excludeFromHitTesting"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v4)[2](v4, 4, CFSTR("focusItemProxy"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v4)[2](v4, 16, CFSTR("excludeFromRemoteEffects"));
  objc_msgSend(v3, "insertString:atIndex:", CFSTR("["), 0, v7, v8, v9, v10);
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  v5 = v3;

  return v5;
}

id PXGSpriteTextureInfoDescription(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), COERCE_FLOAT(*a1), COERCE_FLOAT(HIDWORD(*a1)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), COERCE_FLOAT(a1[1]), COERCE_FLOAT(HIDWORD(a1[1])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), COERCE_FLOAT(a1[2]), COERCE_FLOAT(HIDWORD(a1[2])));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{contentsOrigin:%@, contentsSize:%@, textureSize:%@}"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *PXGColorOpcodeDescription(unsigned int a1)
{
  if (a1 > 0x10)
    return CFSTR("Unknown");
  else
    return off_251A6E940[a1];
}

void PXGSpriteApplyTransform(double *a1, uint64_t a2, uint64_t a3, double *a4)
{
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float32x4_t v18;
  __int128 v19;
  CGFloat height;
  CGFloat y;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGRect v24;
  CGRect v25;

  v7 = *((_OWORD *)a4 + 1);
  *(_OWORD *)&t1.a = *(_OWORD *)a4;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = *((_OWORD *)a4 + 2);
  v8 = a4[6];
  v22 = *(CGAffineTransform *)PXGSpriteGeometryTransformIdentity;
  if (!CGAffineTransformEqualToTransform(&t1, &v22) || v8 != 0.0)
  {
    v9 = *a4;
    v10 = a4[1];
    v11 = a4[2];
    v12 = a4[3];
    v13 = a4[4];
    v14 = a4[5];
    v15 = v11 * *(float *)(a2 + 60) + *a4 * *(float *)(a2 + 60);
    *(float *)(a2 + 60) = v15;
    v16 = a1[1];
    v17 = v13 + v11 * v16 + v9 * *a1;
    *a1 = v17;
    a1[1] = v14 + v12 * v16 + v10 * v17;
    *(float *)&v17 = v8;
    a1[2] = a1[2] + *(float *)&v17;
    v18 = *(float32x4_t *)(a2 + 20);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v18, (float32x4_t)xmmword_24945F6A0)))) & 1) != 0)
    {
      v24.origin.x = v18.f32[0];
      v24.origin.y = v18.f32[1];
      v24.size.width = v18.f32[2];
      v24.size.height = v18.f32[3];
      v19 = *((_OWORD *)a4 + 1);
      *(_OWORD *)&t1.a = *(_OWORD *)a4;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = *((_OWORD *)a4 + 2);
      v25 = CGRectApplyAffineTransform(v24, &t1);
      height = v25.size.height;
      y = v25.origin.y;
      *(float32x4_t *)(a2 + 20) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v25.origin), (float64x2_t)v25.size);
    }
  }
}

float32x4_t PXGSpriteStyleUnionClippingRect(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6;
  float32x4_t v7;
  float32x4_t result;
  CGFloat height;
  CGFloat y;
  CGRect v14;
  CGRect v15;

  v6 = a2;
  v7 = *(float32x4_t *)(a1 + 20);
  *(int16x4_t *)result.f32 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v7, (float32x4_t)xmmword_24945F6A0)));
  result.i16[0] = vmaxv_u16(*(uint16x4_t *)result.f32);
  if ((result.i8[0] & 1) != 0)
  {
    v14.origin.x = v7.f32[0];
    v14.origin.y = v7.f32[1];
    v14.size.width = v7.f32[2];
    v14.size.height = v7.f32[3];
    v15 = CGRectUnion(v14, *(CGRect *)&v6);
    height = v15.size.height;
    y = v15.origin.y;
    result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v15.origin), (float64x2_t)v15.size);
    *(float32x4_t *)(a1 + 20) = result;
  }
  return result;
}

id PXGShaderFlagsDescription(int a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  int v11;

  if (PXGShaderFlagsDescription_onceToken != -1)
    dispatch_once(&PXGShaderFlagsDescription_onceToken, &__block_literal_global_223);
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)PXGShaderFlagsDescription_descriptionByBit;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __PXGShaderFlagsDescription_block_invoke_278;
  v9[3] = &unk_251A6E828;
  v11 = a1;
  v10 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *PXGYCbCrBitDepthDescription(unsigned int a1)
{
  if (a1 < 4)
    return off_251A6EA18[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PXGYCbCr_Bit_Depth_Unknown(%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *PXGYCbCrMatrixDescription(unsigned int a1)
{
  if (a1 < 0xA)
    return off_251A6E9C8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PXGYCbCrMatrix_Unknown(%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL PXGShaderOpcodesIsOpaque(uint64_t a1, int a2)
{
  return a2 == 0;
}

unint64_t PXGShaderOpcodesAppending(unint64_t a1, unsigned int a2, unint64_t a3, unsigned int a4)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int appended;
  uint64_t v9;

  v6 = HIDWORD(a1);
  v7 = HIDWORD(a3);
  appended = _appendOpcodes(a1, a3);
  v9 = _appendOpcodes(v6, v7);
  _appendOpcodes(a2, a4);
  return appended | (unint64_t)(v9 << 32);
}

uint64_t _appendOpcodes(unsigned int a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = _opcodesCount(a1);
  v5 = _opcodesCount(a2) + v4;
  if (v5 >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "uint32_t _appendOpcodes(const uint32_t, const uint32_t)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGTypes.m"), 646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedOpcodesCount <= PXGOpcodeMax"));

  }
  v6 = (a2 << (4 * v4)) | a1;
  if (v5 != _opcodesCount(v6))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "uint32_t _appendOpcodes(const uint32_t, const uint32_t)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGTypes.m"), 648, CFSTR("Unexpected opcodes count %ld != %ld"), v5, _opcodesCount(v6));

  }
  return v6;
}

uint64_t _opcodesCount(unsigned int a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if (((a1 >> v2) & 0xF) != 0)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSInteger _opcodesCount(uint32_t)");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGTypes.m"), 630, CFSTR("Opcodes cannot have holes"));

      }
      ++v3;
    }
    else
    {
      v4 = v3 > 0;
    }
    v2 += 4;
  }
  while (v2 != 28);
  return v3;
}

id PXGShaderOpcodesDescription(unint64_t a1, unsigned int a2)
{
  unsigned int v3;
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v3 = a1;
  v4 = HIDWORD(a1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = 0;
  while (2)
  {
    v9 = 0;
    switch((v3 >> v8) & 0xF)
    {
      case 0u:
        goto LABEL_5;
      case 1u:
        v9 = CFSTR("EdgeStretch");
        goto LABEL_5;
      case 2u:
        v9 = CFSTR("Pinch");
LABEL_5:
        objc_msgSend(v5, "px_addObjectIfNotNil:", v9);
        v10 = 0;
        switch((v4 >> v8) & 0xF)
        {
          case 0u:
            goto LABEL_11;
          case 1u:
            v10 = CFSTR("ColorGrading");
            goto LABEL_11;
          case 2u:
            v10 = CFSTR("ColorTint");
            goto LABEL_11;
          case 3u:
            v10 = CFSTR("TextLegibilityNormal");
            goto LABEL_11;
          case 4u:
            v10 = CFSTR("TextLegibilityDarkenSourceOver");
            goto LABEL_11;
          case 5u:
            v10 = CFSTR("TextLegibilityColorMatrix");
LABEL_11:
            objc_msgSend(v6, "px_addObjectIfNotNil:", v10);
            v11 = 0;
            switch((a2 >> v8) & 0xF)
            {
              case 0u:
                goto LABEL_14;
              case 1u:
                v11 = CFSTR("RegionMask");
                goto LABEL_14;
              case 2u:
                v11 = CFSTR("EdgeFade");
LABEL_14:
                objc_msgSend(v7, "px_addObjectIfNotNil:", v11);
                v8 += 4;
                if (v8 != 28)
                  continue;
                v12 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "stringWithFormat:", CFSTR("{ .textureCoordinate = [%@], .color = [%@], .alpha = [%@] }"), v13, v14, v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                return v16;
              case 3u:
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGFragmentAlphaOpcodeDescription(enum PXGFragmentAlphaOpcode)");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v18;
                v21 = v19;
                v22 = 703;
                goto LABEL_22;
              default:
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGFragmentAlphaOpcodeDescription(enum PXGFragmentAlphaOpcode)");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v18;
                v21 = v19;
                v22 = 705;
                goto LABEL_22;
            }
          case 6u:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGFragmentColorOpcodeDescription(enum PXGFragmentColorOpcode)");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v18;
            v21 = v19;
            v22 = 689;
            break;
          default:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGFragmentColorOpcodeDescription(enum PXGFragmentColorOpcode)");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v18;
            v21 = v19;
            v22 = 691;
            break;
        }
        break;
      case 3u:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGTextureCoordinateOpcodeDescription(enum PXGTextureCoordinateOpcode)");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = v19;
        v22 = 669;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *PXGTextureCoordinateOpcodeDescription(enum PXGTextureCoordinateOpcode)");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = v19;
        v22 = 671;
        break;
    }
    break;
  }
LABEL_22:
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXGTypes.m"), v22, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

uint64_t PXGYCbCrMatrixIsVideoRange(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (a1 > 9)
    return 0;
  v3 = a1;
  result = 1;
  if (((1 << v3) & 0x155) != 0)
    return 0;
  if (((1 << v3) & 0xAA) == 0)
  {
    v7 = v1;
    v8 = v2;
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_24943D000, v5, OS_LOG_TYPE_ERROR, "Invalid to ask for IsVideoRange for PXGYCbCr_Count", v6, 2u);
    }

    return 0;
  }
  return result;
}

void sub_249455E68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24945661C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249458694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PXGSpriteInfoDescription(unsigned __int8 *a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  float v11;
  void *v12;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{"));
  v3 = *a1;
  if (*a1)
  {
    if (v3 > 2)
      v4 = CFSTR("unexpected");
    else
      v4 = off_251A6E8B8[v3];
    v5 = v4;
    objc_msgSend(v2, "appendFormat:", CFSTR("presentationType=%@, "), v5);

  }
  v6 = a1[1];
  if (a1[1])
  {
    if (v6 > 0xD)
      v7 = CFSTR("unexpected");
    else
      v7 = off_251A6E8D0[v6];
    v8 = v7;
    objc_msgSend(v2, "appendFormat:", CFSTR("mediaKind=%@, "), v8);

  }
  v9 = *((_QWORD *)a1 + 1);
  if (*(float *)&v9 != 0.0 || *((float *)&v9 + 1) != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.2f, %.2f}"), *(float *)&v9, *((float *)&v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("mediaTargetSize=%@, "), v10);

  }
  v11 = *((float *)a1 + 4);
  if (v11 != 0.0)
    objc_msgSend(v2, "appendFormat:", CFSTR("mediaAspectRatio=%.2f, "), v11);
  if (*((_QWORD *)a1 + 3))
    objc_msgSend(v2, "appendFormat:", CFSTR("tag:0x%llx (%d, %d, %d, %d), "), *((_QWORD *)a1 + 3), BYTE1(*((_QWORD *)a1 + 3)), *((_QWORD *)a1 + 3), WORD1(*((_QWORD *)a1 + 3)), HIDWORD(*((_QWORD *)a1 + 3)));
  if (*((_WORD *)a1 + 16))
    objc_msgSend(v2, "appendFormat:", CFSTR("mediaVersion=%d, "), *((unsigned __int16 *)a1 + 16));
  if (a1[34])
  {
    PXGSpriteInfoFlagsDescription(a1[34]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("flags=%@, "), v12);

  }
  objc_msgSend(v2, "px_removeSuffix:", CFSTR(", "));
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

void sub_249459BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24945A05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;

  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 216), 8);
  _Block_object_dispose((const void *)(v42 - 168), 8);
  _Block_object_dispose((const void *)(v42 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2176(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2177(uint64_t a1)
{

}

unint64_t PXGSectionedSpriteTagMake(unsigned int a1, _DWORD *a2)
{
  return (*a2 << 8) | (a2[2] << 16) | a1 | 0xFFFFFFFF00000000;
}

unint64_t PXGSectionedSpriteTagDecompose(unint64_t result, unsigned __int8 a2, _BYTE *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = HIDWORD(result);
  if (HIDWORD(result) == 0xFFFFFFFF)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 == BYTE1(result))
    v6 = WORD1(result);
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 != BYTE1(result))
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
    *a3 = result;
  if (a4)
    *a4 = v6;
  if (a5)
    *a5 = v5;
  return result;
}

uint64_t PXGSectionedSpriteTagGetDataSourceIdentifierHash(__int16 a1)
{
  return HIBYTE(a1);
}

__n128 PXGSectionedSpriteTagGetIndexPath@<Q0>(unint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  if (a2 == BYTE1(a1))
  {
    *a3 = a2;
    a3[1] = WORD1(a1);
    if (HIDWORD(a1) == 0xFFFFFFFF)
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v3 = HIDWORD(a1);
    a3[2] = v3;
    a3[3] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    result = *(__n128 *)MEMORY[0x24BE72CC0];
    v5 = *(_OWORD *)(MEMORY[0x24BE72CC0] + 16);
    *(_OWORD *)a3 = *MEMORY[0x24BE72CC0];
    *((_OWORD *)a3 + 1) = v5;
  }
  return result;
}

uint64_t PXUpdateSectionedSpriteInfoTagsForItemsInRange(uint64_t result, char a2, __int16 a3, int a4, uint64_t a5)
{
  _DWORD *v5;

  if (a5)
  {
    v5 = (_DWORD *)(result + 28);
    do
    {
      *((_BYTE *)v5 - 3) = a2;
      *v5 = a4++;
      *((_WORD *)v5 - 1) = a3;
      v5 += 10;
      --a5;
    }
    while (a5);
  }
  return result;
}

uint64_t PXGSectionedSpriteTagDescription(unint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%llx (%d, %d, %d, %d)"), a1, BYTE1(a1), a1, WORD1(a1), HIDWORD(a1));
}

void sub_24945BF2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x24BDBDBD0]();
}

uint64_t CGColorSpaceGetAlternateColorSpace()
{
  return MEMORY[0x24BDBDBD8]();
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x24BDBDC28]();
}

uint64_t CGColorSpaceIsUncalibrated()
{
  return MEMORY[0x24BDBDC50]();
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC70](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextResetClip(CGContextRef c)
{
  MEMORY[0x24BDBDF48](c);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

uint64_t CGDataProviderReleaseBytePtr()
{
  return MEMORY[0x24BDBE1D0]();
}

uint64_t CGDataProviderRetainBytePtr()
{
  return MEMORY[0x24BDBE1D8]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x24BDBE718]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CGImageTextureDataGetDataWithBlock()
{
  return MEMORY[0x24BDBE790]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x24BDBE7A0]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x24BDBE7A8]();
}

uint64_t CGImageTextureDataRelease()
{
  return MEMORY[0x24BDBE7B0]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x24BDBE7C0]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x24BDBEEB8](path1, path2);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5138](buffer, key, attachmentMode);
}

void CVBufferRelease(CVBufferRef buffer)
{
  MEMORY[0x24BDC5168](buffer);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x24BDC5200](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
  MEMORY[0x24BDC5208](textureCache, options);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x24BDC5210](image);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x24BDC5270]();
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x24BDD8B28](property, value);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x24BDD8BB0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x24BDD8C98](property);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x24BEBD2B0](transform);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFMap()
{
  return MEMORY[0x24BE71BB8]();
}

uint64_t PXAssertGetLog()
{
  return MEMORY[0x24BE72BB8]();
}

uint64_t PXColorSpaceIsGrayscale()
{
  return MEMORY[0x24BE72BC0]();
}

uint64_t PXColorSpaceSupportsExtendedRange()
{
  return MEMORY[0x24BE72BC8]();
}

uint64_t PXCreateCGImageWithDrawBlock()
{
  return MEMORY[0x24BE72BD0]();
}

uint64_t PXCreateContext()
{
  return MEMORY[0x24BE72BD8]();
}

uint64_t PXCreateContextWithAutomaticFormat()
{
  return MEMORY[0x24BE72BE0]();
}

uint64_t PXCreateMutableIntegerArrayRef()
{
  return MEMORY[0x24BE72BE8]();
}

uint64_t PXFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x24BE72BF8]();
}

uint64_t PXFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x24BE72C08]();
}

uint64_t PXFloatRoundToPixel()
{
  return MEMORY[0x24BE72C10]();
}

uint64_t PXGetColorSpace()
{
  return MEMORY[0x24BE72C28]();
}

uint64_t PXGetColorSpaceName()
{
  return MEMORY[0x24BE72C30]();
}

uint64_t PXMap()
{
  return MEMORY[0x24BE72C48]();
}

uint64_t PXRectEdgeValue()
{
  return MEMORY[0x24BE72C68]();
}

uint64_t PXRectGetCenter()
{
  return MEMORY[0x24BE72C70]();
}

uint64_t PXRectRoundToPixel()
{
  return MEMORY[0x24BE72C88]();
}

uint64_t PXRectWithAspectRatioFillingRect()
{
  return MEMORY[0x24BE72C98]();
}

uint64_t PXRectWithCenterAndSize()
{
  return MEMORY[0x24BE72CA8]();
}

uint64_t PXRectWithEdges()
{
  return MEMORY[0x24BE72CB0]();
}

uint64_t PXSizeGetAspectRatio()
{
  return MEMORY[0x24BE72CC8]();
}

uint64_t PXSizeGetAspectRatioWithDefault()
{
  return MEMORY[0x24BE72CD0]();
}

uint64_t PXSizeIsEmpty()
{
  return MEMORY[0x24BE72CD8]();
}

uint64_t PXSizeLargerThanSize()
{
  return MEMORY[0x24BE72CE0]();
}

uint64_t PXSizeMin()
{
  return MEMORY[0x24BE72CE8]();
}

uint64_t PXSizeScale()
{
  return MEMORY[0x24BE72CF0]();
}

uint64_t PXSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x24BE72D00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

