double simd_matrix4x4(float32x4_t a1)
{
  float v10;
  double v11;

  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void *PKTextureLoaderResultCreateDefaultPrivate2DTexture(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[3];
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v9 = *(id *)a1;
      if (v9)
      {
        v10 = objc_alloc_init(MEMORY[0x24BDDD740]);
        objc_msgSend(v10, "setPixelFormat:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v10, "setStorageMode:", 2);
        objc_msgSend(v10, "setWidth:", *(_QWORD *)(a1 + 8));
        objc_msgSend(v10, "setHeight:", *(_QWORD *)(a1 + 16));
        v8 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v10);
        if (v8)
        {
          v11 = *(_QWORD *)(a1 + 24);
          v12 = objc_msgSend(v9, "length");
          memset(v15, 0, sizeof(v15));
          v16 = *(_OWORD *)(a1 + 8);
          v17 = 1;
          objc_msgSend(v7, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v9, 0, v11, v12, &v16, v8, 0, 0, v15);
          v13 = v8;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

void PKCategoryVisualizationRendererStateDestroy(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void sub_213A44274(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

double PKMakeFloat4FromCGColor(CGColor *a1)
{
  CGColorSpace *v2;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  float64x2_t *v5;
  size_t NumberOfComponents;
  unint64_t v7;
  double v9;

  v2 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, a1, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  if (!CopyByMatchingToColorSpace)
    return 0.0;
  v5 = (float64x2_t *)Components;
  NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  v7 = 0;
  if (NumberOfComponents == 4)
    v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v5), v5[1]).u64[0];
  v9 = *(double *)&v7;
  CGColorRelease(CopyByMatchingToColorSpace);
  return v9;
}

void sub_213A45958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213A46FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _LAPolicyContainerForPKPolicy(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      result = 1004;
      break;
    case 1:
      result = 2;
      break;
    case 2:
      result = 1005;
      break;
    case 3:
      result = 1006;
      break;
    case 4:
      result = 1005;
      break;
    case 5:
    case 6:
    case 7:
      result = 0;
      break;
    case 8:
      PKUserIntentIsAvailable();
      result = 1015;
      break;
    case 9:
      result = 0;
      break;
    case 10:
      result = 1004;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_213A47144(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A47988(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_213A4865C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213A48800(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A489E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A4902C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213A4BDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void _AccessPreflightContext(uint64_t a1, void *a2)
{
  _QWORD *v3;
  double v4;
  void *v5;
  double v6;
  int v7;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void (*v16)(_QWORD *, void *, _QWORD *);
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = a2;
    os_unfair_lock_lock(&_AccessPreflightContext_lock);
    v4 = CACurrentMediaTime();
    v5 = (void *)_AccessPreflightContext_context;
    if (!_AccessPreflightContext_context
      || (v6 = *(double *)&_AccessPreflightContext_lastCreatedTime,
          v7 = objc_msgSend((id)_AccessPreflightContext_context, "useLocationBasedAuthorization"),
          (v5 = (void *)_AccessPreflightContext_context) == 0)
      || ((v8 = v7 ^ a1, v4 - v6 < 5.0) ? (v9 = v8 == 0) : (v9 = 0), !v9))
    {
      objc_msgSend(v5, "invalidate");
      _AccessPreflightContext_lastCreatedTime = *(_QWORD *)&v4;
      v10 = -[PKAuthenticatorPreflightContext initForLocationBasedAuthorization:]([PKAuthenticatorPreflightContext alloc], "initForLocationBasedAuthorization:", a1);
      v11 = (void *)_AccessPreflightContext_context;
      _AccessPreflightContext_context = (uint64_t)v10;

      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v23 = _AccessPreflightContext_context;
        _os_log_impl(&dword_213A36000, v12, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): creating preflight context.", buf, 0xCu);
      }

      v5 = (void *)_AccessPreflightContext_context;
    }
    v13 = v5;
    objc_msgSend(v13, "incrementValidReferenceCount");
    os_unfair_lock_unlock(&_AccessPreflightContext_lock);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EAC0]), "initWithBlock:", &__block_literal_global_495);
    objc_msgSend(v13, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = ___AccessPreflightContext_block_invoke_2;
    v19[3] = &unk_24D0A0B08;
    v20 = v14;
    v21 = v13;
    v16 = (void (*)(_QWORD *, void *, _QWORD *))v3[2];
    v17 = v13;
    v18 = v14;
    v16(v3, v15, v19);

  }
}

void _AccessAuthenticatorStateCache(void *a1)
{
  void (**v1)(void);
  id v2;
  void *v3;
  void (**v4)(void);

  v1 = a1;
  if (v1)
  {
    v4 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&_AccessAuthenticatorStateCache_lock);
    if (!_AccessAuthenticatorStateCache_cache)
    {
      v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v3 = (void *)_AccessAuthenticatorStateCache_cache;
      _AccessAuthenticatorStateCache_cache = (uint64_t)v2;

    }
    v4[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&_AccessAuthenticatorStateCache_lock);
    v1 = v4;
  }

}

void sub_213A4C598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213A4C9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213A4D420(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213A4D814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213A4E1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MatchLayerGeometry(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    if (a2)
    {
      v3 = a2;
      v4 = a1;
      objc_msgSend(v3, "transform");
      objc_msgSend(v4, "setTransform:", &v6);
      objc_msgSend(v3, "anchorPoint");
      objc_msgSend(v4, "setAnchorPoint:");
      objc_msgSend(v3, "position");
      objc_msgSend(v4, "setPosition:");
      objc_msgSend(v3, "bounds");
      objc_msgSend(v4, "setBounds:");
      v5 = objc_msgSend(v3, "isGeometryFlipped");

      objc_msgSend(v4, "setGeometryFlipped:", v5);
    }
  }
}

id CloneShapeLayer(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (!a1)
    return 0;
  v1 = (objc_class *)MEMORY[0x24BDE5758];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setBounds:");
  objc_msgSend(v2, "position");
  objc_msgSend(v3, "setPosition:");
  objc_msgSend(v2, "anchorPoint");
  objc_msgSend(v3, "setAnchorPoint:");
  objc_msgSend(v2, "opacity");
  objc_msgSend(v3, "setOpacity:");
  objc_msgSend(v2, "transform");
  objc_msgSend(v3, "setTransform:", &v9);
  objc_msgSend(v3, "setGeometryFlipped:", objc_msgSend(v2, "isGeometryFlipped"));
  objc_msgSend(v3, "setPath:", objc_msgSend(v2, "path"));
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v2, "fillColor"));
  objc_msgSend(v2, "fillRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillRule:", v4);

  objc_msgSend(v2, "lineCap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineCap:", v5);

  objc_msgSend(v2, "lineJoin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineJoin:", v6);

  objc_msgSend(v2, "lineWidth");
  objc_msgSend(v3, "setLineWidth:");
  objc_msgSend(v2, "miterLimit");
  objc_msgSend(v3, "setMiterLimit:");
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v2, "strokeColor"));
  objc_msgSend(v2, "strokeStart");
  objc_msgSend(v3, "setStrokeStart:");
  objc_msgSend(v2, "strokeEnd");
  objc_msgSend(v3, "setStrokeEnd:");
  objc_msgSend(v2, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setActions:", v7);
  return v3;
}

void sub_213A5016C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_213A503B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A50564(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213A5065C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A50918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213A50E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_213A51AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id location)
{
  id *v47;

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213A52264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PKTextureLoaderResultGetSRGBMatchedFormat(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *Name;
  const __CFString *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;

  if (!result)
    return result;
  v1 = result;
  result = *(_QWORD *)(result + 40);
  if (!result)
    return result;
  v2 = *(_QWORD *)(v1 + 32);
  if (((unint64_t)(v2 - 30) > 0x32 || ((1 << (v2 - 30)) & 0x4010000000001) == 0)
    && v2 != 10)
  {
    return 0;
  }
  Name = CGColorSpaceGetName((CGColorSpaceRef)result);
  if (Name)
  {
    v6 = Name;
    if (CFStringCompare(Name, (CFStringRef)*MEMORY[0x24BDBF318], 0) == kCFCompareEqualTo)
      goto LABEL_15;
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x24BDBF308], 0) == kCFCompareEqualTo)
      return *(_QWORD *)(v1 + 32);
  }
  v7 = *(const void **)(v1 + 40);
  v8 = (const void *)PKColorSpaceStandardRGB();
  if (!CFEqual(v7, v8))
  {
    v10 = *(const void **)(v1 + 40);
    v11 = (const void *)PKColorSpaceStandardLinearRGB();
    if (!CFEqual(v10, v11))
      return 0;
    return *(_QWORD *)(v1 + 32);
  }
LABEL_15:
  v9 = *(_QWORD *)(v1 + 32);
  if (v9 > 69)
  {
    if (v9 != 70)
    {
      if (v9 == 80)
        return 81;
      return 0;
    }
    return 71;
  }
  else
  {
    if (v9 != 10)
    {
      if (v9 == 30)
        return 31;
      return 0;
    }
    return 11;
  }
}

__n128 PKCategoryVisualizationRendererStateCopy@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __n128 result;
  unint64_t v19;

  bzero((void *)(a2 + 16), 0x27C0uLL);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 8) = v4;
  v5 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 144) = v5;
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v6;
  v7 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v7;
  v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v8;
  *(_QWORD *)(a2 + 288) = *(_QWORD *)(a1 + 288);
  *(_QWORD *)(a2 + 10160) = *(_QWORD *)(a1 + 10160);
  *(_QWORD *)(a2 + 10168) = *(_QWORD *)(a1 + 10168);
  *(_DWORD *)(a2 + 10176) = *(_DWORD *)(a1 + 10176);
  *(_BYTE *)(a2 + 10180) = *(_BYTE *)(a1 + 10180);
  v9 = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 224) = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 240) = v9;
  v10 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 256) = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 272) = v10;
  v11 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 176) = v11;
  v12 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 208) = v12;
  __memcpy_chk();
  v13 = malloc_type_malloc(8 * v4, 0x19F71B0FuLL);
  *(_QWORD *)(a2 + 16) = v13;
  v14 = *(_QWORD *)(a1 + 8);
  if (v14)
  {
    v15 = *(uint64_t **)(a1 + 16);
    v16 = *(_QWORD *)(a1 + 8);
    do
    {
      v17 = *v15++;
      *v13++ = v17;
      --v16;
    }
    while (v16);
  }
  *(_QWORD *)(a2 + 24) = malloc_type_malloc(16 * v14, 0x1000040451B5BE8uLL);
  if (*(_QWORD *)(a1 + 8))
  {
    v19 = 0;
    do
    {
      result = *(__n128 *)(*(_QWORD *)(a1 + 24) + 16 * v19);
      *(__n128 *)(*(_QWORD *)(a2 + 24) + 16 * v19++) = result;
    }
    while (v19 < *(_QWORD *)(a1 + 8));
  }
  return result;
}

uint64_t PKCompareCircleDataByCreated(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  unsigned int v4;

  v2 = *(float *)(a1 + 28);
  v3 = *(float *)(a2 + 28);
  if (v2 < v3)
    v4 = 1;
  else
    v4 = -1;
  if (v2 == v3)
    return 0;
  else
    return v4;
}

void sub_213A56AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v10);
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_213A56C08(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A57350(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A578C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A579C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A57AE8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A57D54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213A594DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void LayerApplyColor(void *a1, void *a2, char a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a2;
  v8 = a1;
  objc_msgSend(v8, "presentationLayer");
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v9;
  if (v9)
    v10 = (void *)v9;
  else
    v10 = v8;
  LayerApplyColor(v8, v10, v7, a3, a4);

}

void ShapeLayerApplyColor(void *a1, void *a2, char a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  CGColor *v14;
  CGColor *v15;
  id v16;
  CGColor *v17;
  void *v18;
  CGColor *v19;
  CGColor *v20;
  id v21;
  CGColor *v22;
  id v23;

  v7 = a1;
  v8 = a2;
  objc_msgSend(v7, "presentationLayer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v7;
  v23 = v7;
  v12 = v11;
  v13 = v8;
  if (v13)
  {
    if ((a3 & 4) != 0)
    {
      v14 = CGColorRetain((CGColorRef)objc_msgSend(v23, "strokeColor"));
      v15 = CGColorRetain((CGColorRef)objc_msgSend(v12, "strokeColor"));
      objc_msgSend(v13, "colorWithAlphaComponent:", CGColorGetAlpha(v14));
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = CGColorRetain((CGColorRef)objc_msgSend(v16, "CGColor"));

      if (a4)
        LayerAnimateColor(v23, CFSTR("strokeColor"), (uint64_t)v15, (uint64_t)v17);
      objc_msgSend(v23, "setStrokeColor:", v17);
      CGColorRelease(v14);
      CGColorRelease(v15);
      CGColorRelease(v17);
    }
    v18 = v23;
    if ((a3 & 8) != 0)
    {
      v19 = CGColorRetain((CGColorRef)objc_msgSend(v23, "fillColor"));
      v20 = CGColorRetain((CGColorRef)objc_msgSend(v12, "fillColor"));
      objc_msgSend(v13, "colorWithAlphaComponent:", CGColorGetAlpha(v19));
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = CGColorRetain((CGColorRef)objc_msgSend(v21, "CGColor"));

      if (a4)
        LayerAnimateColor(v23, CFSTR("fillColor"), (uint64_t)v20, (uint64_t)v22);
      objc_msgSend(v23, "setFillColor:", v22);
      CGColorRelease(v19);
      CGColorRelease(v20);
      CGColorRelease(v22);
      v18 = v23;
    }
    LayerApplyColor(v18, v12, v13, a3, a4);
  }

}

void LayerApplyColor(void *a1, void *a2, void *a3, char a4, int a5)
{
  id v9;
  id v10;
  CGColor *v11;
  CGColor *v12;
  id v13;
  CGColor *v14;
  CGColor *v15;
  CGColor *v16;
  id v17;
  CGColor *v18;
  id v19;

  v19 = a1;
  v9 = a2;
  v10 = a3;
  if (v10)
  {
    if ((a4 & 1) != 0)
    {
      v11 = CGColorRetain((CGColorRef)objc_msgSend(v19, "backgroundColor"));
      v12 = CGColorRetain((CGColorRef)objc_msgSend(v9, "backgroundColor"));
      objc_msgSend(v10, "colorWithAlphaComponent:", CGColorGetAlpha(v11));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = CGColorRetain((CGColorRef)objc_msgSend(v13, "CGColor"));

      if (a5)
        LayerAnimateColor(v19, CFSTR("backgroundColor"), (uint64_t)v12, (uint64_t)v14);
      objc_msgSend(v19, "setBackgroundColor:", v14);
      CGColorRelease(v11);
      CGColorRelease(v12);
      CGColorRelease(v14);
    }
    if ((a4 & 2) != 0)
    {
      v15 = CGColorRetain((CGColorRef)objc_msgSend(v19, "borderColor"));
      v16 = CGColorRetain((CGColorRef)objc_msgSend(v9, "borderColor"));
      objc_msgSend(v10, "colorWithAlphaComponent:", CGColorGetAlpha(v15));
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = CGColorRetain((CGColorRef)objc_msgSend(v17, "CGColor"));

      if (a5)
        LayerAnimateColor(v19, CFSTR("borderColor"), (uint64_t)v16, (uint64_t)v18);
      objc_msgSend(v19, "setBorderColor:", v18);
      CGColorRelease(v15);
      CGColorRelease(v16);
      CGColorRelease(v18);
    }
  }

}

void LayerAnimateColor(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a2;
  v8 = a1;
  objc_msgSend(v8, "removeAnimationForKey:", v7);
  objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdditive:", 0);
  objc_msgSend(v9, "setFromValue:", a3);
  objc_msgSend(v9, "setToValue:", a4);
  objc_msgSend(v8, "addAnimation:forKey:", v9, v7);

}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x24BDE5438](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x24BDE5588](a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
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

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
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

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x24BDBE670](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x24BDBE6C0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC47F0](original, attributes);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x24BDC48B0](font, *(_QWORD *)&orientation, glyphs, advances, count);
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

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromURL(CFURLRef fileURL)
{
  return (CFArrayRef)MEMORY[0x24BDC4990](fileURL);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x24BDC4998](fontURL, *(_QWORD *)&scope, error);
}

void GLKQuaternionRotateVector3Array(GLKQuaternion quaternion, GLKVector3 *vectors, size_t vectorCount)
{
  MEMORY[0x24BDD19F8](*(_QWORD *)&quaternion.x, *(_QWORD *)&quaternion.q[2], vectors, vectorCount);
}

uint64_t LAUIPhysicalButtonNormalizedFrame()
{
  return MEMORY[0x24BE60850]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t PKAnalyticsSendEvent()
{
  return MEMORY[0x24BE6F150]();
}

uint64_t PKColorGetRelativeLuminance()
{
  return MEMORY[0x24BE6F1E0]();
}

uint64_t PKColorSpaceStandardLinearRGB()
{
  return MEMORY[0x24BE6F1E8]();
}

uint64_t PKColorSpaceStandardRGB()
{
  return MEMORY[0x24BE6F1F0]();
}

uint64_t PKEqualObjects()
{
  return MEMORY[0x24BE6F320]();
}

uint64_t PKFloatRoundToPixelWithScale()
{
  return MEMORY[0x24BE6F358]();
}

uint64_t PKFrontFaceCameraIsWithinScreen()
{
  return MEMORY[0x24BE6F370]();
}

uint64_t PKIsPad()
{
  return MEMORY[0x24BE6F3E0]();
}

uint64_t PKLayerNullActions()
{
  return MEMORY[0x24BE6F408]();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return MEMORY[0x24BE6F420]();
}

uint64_t PKMagicCurve()
{
  return MEMORY[0x24BE6F428]();
}

uint64_t PKPassFrontFaceContentSize()
{
  return MEMORY[0x24BE6F518]();
}

uint64_t PKPassKitUIFoundationBundle()
{
  return MEMORY[0x24BE6F570]();
}

uint64_t PKPaymentPassScaleFactor()
{
  return MEMORY[0x24BE6F6B0]();
}

uint64_t PKPearlIsAvailable()
{
  return MEMORY[0x24BE6F778]();
}

uint64_t PKRunningInViewService()
{
  return MEMORY[0x24BE6F7E8]();
}

uint64_t PKScreenScale()
{
  return MEMORY[0x24BE6F800]();
}

uint64_t PKSizeAlignedInRectWithScale()
{
  return MEMORY[0x24BE6F850]();
}

uint64_t PKSizeAspectFit()
{
  return MEMORY[0x24BE6F858]();
}

uint64_t PKSizeRoundToPixelWithScale()
{
  return MEMORY[0x24BE6F870]();
}

uint64_t PKSizeScaleAspectFit()
{
  return MEMORY[0x24BE6F878]();
}

uint64_t PKSystemApertureIsAvailable()
{
  return MEMORY[0x24BE6F8A8]();
}

uint64_t PKTimeProfileBegin()
{
  return MEMORY[0x24BE6F8C0]();
}

uint64_t PKTimeProfileEnd()
{
  return MEMORY[0x24BE6F8C8]();
}

uint64_t PKUserIntentIsAvailable()
{
  return MEMORY[0x24BE6F958]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t PKCreateCGImage(NSURL *a1)
{
  return MEMORY[0x24BE6FA00](a1);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
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

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x24BDB3630](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x24BDB3638](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB36F8](converter, srcs, dests, tempBuffer, *(_QWORD *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x24BDB3860](srcFormat, destFormat, backgroundColor, *(_QWORD *)&flags, error);
}

unint64_t vImageConverter_GetNumberOfDestinationBuffers(const vImageConverterRef converter)
{
  return MEMORY[0x24BDB3868](converter);
}

unint64_t vImageConverter_GetNumberOfSourceBuffers(const vImageConverterRef converter)
{
  return MEMORY[0x24BDB3870](converter);
}

vImage_Error vImageConverter_MustOperateOutOfPlace(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, vImage_Flags flags)
{
  return MEMORY[0x24BDB3878](converter, srcs, dests, *(_QWORD *)&flags);
}

void vImageConverter_Release(vImageConverterRef converter)
{
  MEMORY[0x24BDB3880](converter);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

