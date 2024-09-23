void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

double SBRectWithSize()
{
  return *MEMORY[0x1E0C9D538];
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

double SBUnintegralizedRectCenteredAboutPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a5 - a3 * 0.5;
}

void sub_1A4721564(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1A4721B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  id *v45;
  uint64_t v46;

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v46 - 248), 8);
  _Block_object_dispose((const void *)(v46 - 200), 8);
  _Block_object_dispose((const void *)(v46 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A47222FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t SBUILegibilityShadowCompositingFilterForCAFilterName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0CD2C30]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0CD2DE0]))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1)
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_2_1);
  return (id)SBLogLegibility___logObj;
}

double SBUILegibilityImageSizeForContentSizeAndSettings(void *a1, double a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a1;
  objc_msgSend(v3, "imageOutset");
  v5 = a2 + v4;
  objc_msgSend(v3, "imageOutset");

  return v5;
}

uint64_t SBUILegibilitySettingsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v8 = 1;
    goto LABEL_18;
  }
  if (!v3 && v4)
    goto LABEL_17;
  if (v3 && !v4)
    goto LABEL_17;
  v6 = objc_msgSend(v3, "style");
  if (v6 != objc_msgSend(v5, "style"))
    goto LABEL_17;
  objc_msgSend(v3, "minFillHeight");
  objc_msgSend(v5, "minFillHeight");
  if (BSCompareFloats())
    goto LABEL_17;
  v7 = 0uLL;
  if (v3)
  {
    objc_msgSend(v3, "shadowSettings");
    v7 = 0uLL;
  }
  v20 = v7;
  v21 = v7;
  if (v5)
    objc_msgSend(v5, "shadowSettings", v7, v7, (unsigned __int128)0, (unsigned __int128)0);
  if (BSCompareFloats() || BSCompareFloats() || BSCompareFloats() || BSCompareIntegers())
    goto LABEL_17;
  objc_msgSend(v3, "primaryColor");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryColor");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 == v11 || !(v10 | v11))
  {

  }
  else
  {
    v13 = objc_msgSend((id)v10, "_isSimilarToColor:withinPercentage:", v11, 0.01);

    if (!v13)
      goto LABEL_17;
  }
  objc_msgSend(v3, "secondaryColor", v20, v21);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryColor");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 == v15 || !(v14 | v15))
  {

    goto LABEL_29;
  }
  v17 = objc_msgSend((id)v14, "_isSimilarToColor:withinPercentage:", v15, 0.01);

  if (!v17)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
LABEL_29:
  objc_msgSend(v3, "shadowColor");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowColor");
  v19 = objc_claimAutoreleasedReturnValue();
  v8 = 1;
  if (v18 != v19 && v18 | v19)
    v8 = objc_msgSend((id)v18, "_isSimilarToColor:withinPercentage:", v19, 0.01);

LABEL_18:
  return v8;
}

double SBLayoutDefaultSideLayoutElementWidth(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v5;
  char v6;
  int v7;
  char v8;
  double result;
  uint64_t v10;
  double v11;
  double v12;
  _BOOL4 v13;
  int v14;
  char v15;
  int v16;
  char v17;
  double v18;
  uint64_t v19;
  void *v20;

  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "userInterfaceIdiom") != 1 || SBFEffectiveHomeButtonType() != 2)
    {

      goto LABEL_10;
    }
  }
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v10 = MEMORY[0x1E0DAB260];
  v11 = *(double *)(MEMORY[0x1E0DAB260] + 328);
  v13 = v12 >= v11;
  if (v12 >= v11)
  {
    v14 = __sb__runningInSpringBoard();
    v15 = v14;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
      {
        v13 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v13 = v18 < *(double *)(v10 + 264);
    if ((v17 & 1) == 0)

    if ((v15 & 1) == 0)
      goto LABEL_24;
  }
LABEL_25:
  if ((v8 & 1) == 0)

  if ((v6 & 1) != 0)
  {
    if (v13)
      goto LABEL_31;
LABEL_10:
    *(_QWORD *)&result = SBPhoneOnPadFallbackLaunchSize().n128_u64[0];
    return result;
  }

  if (!v13)
    goto LABEL_10;
LABEL_31:
  if ((unint64_t)(a1 - 1) >= 2)
    v19 = v10 + 32;
  else
    v19 = v10;
  return *(double *)v19;
}

__n128 SBPhoneOnPadFallbackLaunchSize()
{
  void *v0;
  void *v1;
  int v2;
  char v3;
  __n128 result;
  int v5;
  char v6;
  double v7;
  __n128 v8;
  __n128 v9;

  v2 = __sb__runningInSpringBoard();
  v3 = v2;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
      return *(__n128 *)MEMORY[0x1E0DAB260];
LABEL_5:
    v5 = __sb__runningInSpringBoard();
    v6 = v5;
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v7 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      result = *(__n128 *)(MEMORY[0x1E0DAB260] + 32);
      if ((v6 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      result = *(__n128 *)MEMORY[0x1E0DAB260];
      if ((v6 & 1) != 0)
      {
LABEL_14:
        if ((v3 & 1) != 0)
          return result;
        goto LABEL_15;
      }
    }
    v8 = result;

    result = v8;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "userInterfaceIdiom") == 1)
    goto LABEL_5;
  result = *(__n128 *)MEMORY[0x1E0DAB260];
LABEL_15:
  v9 = result;

  return v9;
}

BOOL SBFloatGreaterThanFloat(double a1, double a2)
{
  return a1 - a2 > 0.00000011920929;
}

void SBTransformedRectWithScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  v10 = a1 + CGRectGetWidth(*(CGRect *)&a1) * 0.5;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  v11 = a2 + CGRectGetHeight(v19) * 0.5;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -v10, -v11);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, v10, v11);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, a5, a5);
  t1 = v18;
  memset(&v15, 0, sizeof(v15));
  t2 = v16;
  CGAffineTransformConcat(&v15, &t1, &t2);
  t2 = v15;
  memset(&t1, 0, sizeof(t1));
  v12 = v17;
  CGAffineTransformConcat(&t1, &t2, &v12);
  t2 = t1;
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectApplyAffineTransform(v20, &t2);
}

void sub_1A47267F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void SBSAcquireWallpaperAnimationSuspensionAssertion(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  id v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v5, "isUsable")
    && (memset(v8, 0, 512), objc_msgSend(v3, "getCString:maxLength:encoding:", v8, 1024, 4))
    && (v6 = SBSSpringBoardServerPort(), !MEMORY[0x1A85A1018](v6, v8, objc_msgSend(v5, "port"))))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADE0]), "initWithAssertionName:reason:receiveRight:", CFSTR("SBSUIWallpaperAnimationSuspensionAssertionName"), v3, v5);
  }
  else
  {
    v7 = 0;
  }
  v4[2](v4, v7);

}

void sub_1A4727F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKGlyphViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4C3E478;
    v5 = 0;
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
    __getPKGlyphViewClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PKGlyphView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPKGlyphViewClass_block_invoke_cold_2();
  getPKGlyphViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SBGetPowerDownViewMetrics(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  int v6;
  char v7;
  _BOOL4 v8;
  int v9;
  char v10;
  double v11;
  int v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void SBGetPowerDownViewMetrics(SBUIPowerDownViewMetrics *, BOOL)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("SBUIPowerDownView.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metrics"));

  }
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
      v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v8 = v11 >= *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v10 & 1) == 0)

  if ((v7 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  if (__sb__runningInSpringBoard())
  {
    v12 = SBFEffectiveDeviceClass();
    *(_QWORD *)(a1 + 24) = 0x402A000000000000;
    *(_QWORD *)(a1 + 40) = 0x402A000000000000;
    if (v12 != 2)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    *(_QWORD *)(a1 + 24) = 0x402A000000000000;
    *(_QWORD *)(a1 + 40) = 0x402A000000000000;
    if (v15 != 1)
    {
LABEL_17:
      if (SBFEffectiveHomeButtonType() == 2)
        v13 = 64.0;
      else
        v13 = 28.0;
      goto LABEL_34;
    }
  }
  v16 = 70.0;
  if (a2)
    v16 = 62.0;
  if (v8)
    v13 = v16;
  else
    v13 = 40.0;
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom") != 1)
    {

      goto LABEL_34;
    }
    v18 = SBFEffectiveHomeButtonType();

    if (v18 != 2)
      goto LABEL_34;
LABEL_32:
    v13 = v13 + -4.0;
    goto LABEL_34;
  }
  if (SBFEffectiveDeviceClass() == 2 && SBFEffectiveHomeButtonType() == 2)
    goto LABEL_32;
LABEL_34:
  *(double *)a1 = v13;
  *(_QWORD *)(a1 + 8) = 0x4052000000000000;
  v19 = 120.0;
  if (v8)
    v19 = 54.0;
  v20 = 100.0;
  if (v8)
    v20 = 34.0;
  *(double *)(a1 + 16) = v19;
  *(double *)(a1 + 32) = v20;
}

void sub_1A472C0FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A472C278(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

objc_class *_SBUIEffectiveBiometricClassFromString(void *a1)
{
  NSString *v1;
  NSString *v2;
  Class v3;
  NSObject *v4;
  objc_class *v5;

  v1 = a1;
  if (!-[NSString hasPrefix:](v1, "hasPrefix:", CFSTR("BK")) || !_os_feature_enabled_impl())
  {
LABEL_7:
    v3 = NSClassFromString(v1);
    goto LABEL_8;
  }
  objc_msgSend(CFSTR("_LA"), "stringByAppendingString:", v1);
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = NSClassFromString(v2);

  if (!v3)
  {
    SBLogBiometricResource();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      _SBUIEffectiveBiometricClassFromString_cold_1((uint64_t)v1, v4);

    goto LABEL_7;
  }
LABEL_8:
  v5 = v3;

  return v5;
}

uint64_t NSStringFromBiometricKitStatus(unsigned int a1)
{
  if (a1 > 0x64)
    return 0;
  else
    return (uint64_t)*(&off_1E4C3E6E0 + (int)a1);
}

void sub_1A472D508(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void *____loadBiometricKitIfNecessary_block_invoke()
{
  NSObject *v0;
  void *result;

  __loadBiometricKitIfNecessary_biometricKit = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 1);
  if (_os_feature_enabled_impl())
  {
    SBLogBiometricResource();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      ____loadBiometricKitIfNecessary_block_invoke_cold_1(v0);

    result = dlopen("/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication", 1);
  }
  else
  {
    result = (void *)__loadBiometricKitIfNecessary_biometricKit;
  }
  __loadBiometricKitIfNecessary_localAuthentication = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

BOOL SBUIPasscodeScreenShouldNotWrapSubtitle(uint64_t a1)
{
  int v2;
  _BOOL8 IsEqualToCategory;
  void *v4;
  NSString *v5;

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
    {
      IsEqualToCategory = 0;
      goto LABEL_9;
    }

    if ((unint64_t)(a1 - 3) > 1)
      return 0;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsEqualToCategory = UIContentSizeCategoryIsEqualToCategory(v5, (NSString *)*MEMORY[0x1E0CEB3C0]);

LABEL_9:
    return IsEqualToCategory;
  }
  v2 = SBFEffectiveDeviceClass();
  IsEqualToCategory = 0;
  if ((unint64_t)(a1 - 3) <= 1 && v2 == 2)
    goto LABEL_7;
  return IsEqualToCategory;
}

id _SBUIAXAwareLocalizedStringForKey(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a1;
  if (SBUIPasscodeScreenShouldNotWrapSubtitle(a2))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("_LARGE"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _SBUIPasscodeLocalizeStringForMesaOrPearlKey(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(a3, "hasPearlSupport"))
    v9 = v8;
  else
    v9 = v7;
  _SBUIAXAwareLocalizedStringForKey(v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

const __CFString *NSStringFromSBUIPasscodeLockViewState(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("SBUIPasscodeLockViewStatePasscode");
  else
    return CFSTR("SBUIPasscodeLockViewStateBiometric");
}

uint64_t SBUIPasscodeLockViewTransitionContextMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

void sub_1A47346C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A4735EA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4736120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SBUISystemApertureMaximumContentSizeCategory()
{
  return (id)*MEMORY[0x1E0CEB3F8];
}

id SBUISystemApertureDefaultContentSizeCategory()
{
  return (id)*MEMORY[0x1E0CEB420];
}

double SBUISystemApertureHorizontalItemSpacing()
{
  return 20.0;
}

double SBUISystemApertureVerticalItemSpacing()
{
  return 23.0;
}

double SBUISystemApertureInterItemSpacing()
{
  return 11.0;
}

double SBUISystemApertureControlEdgeSpacing()
{
  return 19.0;
}

double SBUISystemApertureMinimumMicroNoticeHorizontalPaddingFromWindow()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "maximumExpandedSize");
  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "maximumMicroNoticeSize");
  UICeilToScale();
  v3 = v2;

  return v3;
}

double SBUISystemApertureMaximumMicroNoticeSize()
{
  void *v0;
  double v1;
  double v2;

  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "maximumMicroNoticeSize");
  v2 = v1;

  return v2;
}

id _SBUIColorInterpolatedColor(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  v3 = a2;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);

  if (!a1)
  {
    v4 = v18;
    v21 = v17;
    v22 = v18;
    v20 = v16;
    v19 = 0;
    if (v3)
      goto LABEL_3;
LABEL_5:
    v17 = v21;
    v18 = v4;
    v16 = v20;
    v15 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  v4 = v22;
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = v15;
LABEL_6:
  v6 = v19;
  BSIntervalValueForFraction();
  v8 = v7;
  BSIntervalValueForFraction();
  v10 = v9;
  BSIntervalValueForFraction();
  v12 = v11;
  BSIntervalValueForFraction();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v8, v10, v12, v13, v6, 1, v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _SBUIInterpolatedLegibilitySettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
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
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v17 = v4;
LABEL_6:
    v16 = v17;
    goto LABEL_7;
  }
  if (!v4)
  {
    v17 = v3;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "style");
  objc_msgSend(v3, "primaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUIColorInterpolatedColor(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "secondaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUIColorInterpolatedColor(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "shadowColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUIColorInterpolatedColor(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:primaryColor:secondaryColor:shadowColor:", v6, v9, v12, v15);
LABEL_7:

  return v16;
}

void sub_1A473B89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSceneExtensionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4C3ED68;
    v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary)
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AMUIAmbientPresentationSceneExtension");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2();
  getAMUIAmbientPresentationSceneExtensionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SBUIProudLockIconViewStateIsCoaching(unint64_t a1)
{
  if (a1 < 8)
    return 0;
  if (a1 == 22)
    return _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
  return 1;
}

uint64_t SBUIProudLockIconViewStateIsCameraCovered(unint64_t a1)
{
  return (a1 > 0x16) | (0x1C00u >> a1) & 1;
}

uint64_t SBUIProudLockIconViewStateIsUpsideDown(unint64_t a1)
{
  return (a1 > 0x16) | (0x60000u >> a1) & 1;
}

uint64_t SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPoseidonSupport");

  if ((v3 & 1) != 0)
    return 1;
  result = 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      return 1;
    case 8:
      result = 2;
      break;
    case 10:
    case 11:
    case 12:
      result = 4;
      break;
    case 13:
      result = 5;
      break;
    case 14:
      result = 6;
      break;
    case 15:
      result = 7;
      break;
    case 16:
      result = 8;
      break;
    case 17:
    case 18:
      result = 12;
      break;
    case 19:
      result = 9;
      break;
    case 20:
      result = 10;
      break;
    case 21:
      result = 11;
      break;
    case 22:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled())
        result = 14;
      else
        result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBUIProudLockIconViewStateShowsCoachingText(unint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;
  void *v5;
  uint64_t v6;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPoseidonSupport");

  if ((v3 & 1) != 0)
    return 0;
  result = 1;
  if (a1 > 0x16)
    return result;
  if (((1 << a1) & 0xE2FF) != 0)
    return 0;
  if (((1 << a1) & 0x61D00) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    return (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else if (a1 == 22)
  {
    return _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
  }
  return result;
}

void sub_1A473E068(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x420], 8);
  _Unwind_Resume(a1);
}

void sub_1A473F720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLAUIPearlGlyphViewClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLAUIPearlGlyphViewClass_softClass;
  v7 = getLAUIPearlGlyphViewClass_softClass;
  if (!getLAUIPearlGlyphViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLAUIPearlGlyphViewClass_block_invoke;
    v3[3] = &unk_1E4C3E458;
    v3[4] = &v4;
    __getLAUIPearlGlyphViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A473F7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAUIPearlGlyphStaticConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  LocalAuthenticationPrivateUILibrary();
  result = objc_getClass("LAUIPearlGlyphStaticConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLAUIPearlGlyphStaticConfigurationClass_block_invoke_cold_1();
  getLAUIPearlGlyphStaticConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void LocalAuthenticationPrivateUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4C3EF30;
    v2 = 0;
    LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
    LocalAuthenticationPrivateUILibrary_cold_1(&v0);
}

Class __getLAUIPearlGlyphViewClass_block_invoke(uint64_t a1)
{
  Class result;

  LocalAuthenticationPrivateUILibrary();
  result = objc_getClass("LAUIPearlGlyphView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLAUIPearlGlyphViewClass_block_invoke_cold_1();
  getLAUIPearlGlyphViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4740678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E4C3EF80;
    v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_0)
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("AMUIAmbientPresentationSceneExtension");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2_0();
  getAMUIAmbientPresentationSceneExtensionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SBSUIStarkNotificationsSceneClientSettingValueDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 2998744415) > 1)
    return 0;
  BSSettingFlagDescription();
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFString *SBUIServiceButtonEventDescription(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;
  __CFString *v3;

  if (!a1)
  {
    v3 = CFSTR("none");
    return v3;
  }
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    -[__CFString appendString:](v2, "appendString:", CFSTR(" lock"));
    v1 &= ~1uLL;
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  -[__CFString appendString:](v3, "appendString:", CFSTR(" volUp"));
  v1 &= ~2uLL;
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  -[__CFString appendString:](v3, "appendString:", CFSTR(" volDown"));
  v1 &= ~4uLL;
  if ((v1 & 0x10) == 0)
  {
LABEL_6:
    if ((v1 & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  -[__CFString appendString:](v3, "appendString:", CFSTR(" home"));
  v1 &= ~0x10uLL;
  if ((v1 & 8) == 0)
  {
LABEL_7:
    if ((v1 & 0x20) == 0)
      goto LABEL_8;
LABEL_18:
    -[__CFString appendString:](v3, "appendString:", CFSTR(" headset-long"));
    v1 &= ~0x20uLL;
    if (!v1)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  -[__CFString appendString:](v3, "appendString:", CFSTR(" headset"));
  v1 &= ~8uLL;
  if ((v1 & 0x20) != 0)
    goto LABEL_18;
LABEL_8:
  if (v1)
LABEL_9:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" %li"), v1);
LABEL_10:
  -[__CFString appendString:](v3, "appendString:", CFSTR(")"));
  return v3;
}

uint64_t __eventsFromObject(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v1 = a1;
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0;

  return v6;
}

uint64_t SBUICurrentPasscodeStyleForUser()
{
  uint64_t result;

  if (SBUICurrentPasscodeStyleForUser_onceToken != -1)
    dispatch_once(&SBUICurrentPasscodeStyleForUser_onceToken, &__block_literal_global_9);
  if (SBUICurrentPasscodeStyleForUser___unlockScreenType == 1)
    return 2;
  if (SBUICurrentPasscodeStyleForUser___unlockScreenType)
    return 3;
  result = SBUICurrentPasscodeStyleForUser___simplePasscodeType;
  if (!SBUICurrentPasscodeStyleForUser___simplePasscodeType)
    return result;
  if (SBUICurrentPasscodeStyleForUser___simplePasscodeType == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Cannot be simple and have a non-simple passcode type."), &stru_1E4C40DE8);
    return 3;
  }
  return 1;
}

void sub_1A4745088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E4C3F100;
    v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_1)
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AMUIAmbientPresentationSettingsExtension");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_2();
  getAMUIAmbientPresentationSettingsExtensionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A474644C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

__CFString *SBUIStringForPhoneUnlockWithWatchErrorCode(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  v1 = CFSTR("Internal only - AKSFailure");
  switch(a1)
  {
    case 101:
      return v1;
    case 102:
      v1 = CFSTR("Internal only - DeviceLocked");
      break;
    case 103:
      v1 = CFSTR("Internal only - MessageSendFailed");
      break;
    case 104:
      v1 = CFSTR("Internal only - BadDeviceIdentifier");
      break;
    case 105:
      v1 = CFSTR("Internal only - PairedDeviceNotNearby");
      break;
    case 106:
      v1 = CFSTR("Internal only - SendFailedToPairedDevice");
      break;
    case 107:
      v1 = CFSTR("Internal only - EnableRequestTimedOut");
      break;
    case 108:
      v1 = CFSTR("Internal only - KeyDeviceNoPasscode");
      break;
    case 109:
      v1 = CFSTR("Internal only - PairedUnlockDisabled");
      break;
    case 110:
      v1 = CFSTR("Internal only - StashRequestTimedOut");
      break;
    case 111:
      v1 = CFSTR("Internal only - NoPermission");
      break;
    case 112:
      v1 = CFSTR("Internal only - InvalidParameters");
      break;
    case 113:
      v1 = CFSTR("Internal only - StateRequestTimedOut");
      break;
    case 114:
      v1 = CFSTR("Internal only - WiFiFailure");
      break;
    case 115:
      v1 = CFSTR("Internal only - FeatureUnsupported");
      break;
    case 116:
      v1 = CFSTR("Internal only - ScanTimeout");
      break;
    case 117:
      v1 = CFSTR("Internal only - NoEnabledDevices");
      break;
    case 118:
      v1 = CFSTR("Internal only - Cancelled");
      break;
    case 119:
      v1 = CFSTR("Internal only - CodeWatchNotInState");
      break;
    case 120:
      v1 = CFSTR("Internal only - WiFiInterfaceDisabled");
      break;
    case 121:
      v1 = CFSTR("Internal only - ViewNotSyncing");
      break;
    case 122:
      v1 = CFSTR("Internal only - NoEntitlement");
      break;
    case 123:
      v1 = CFSTR("Internal only - BluetoothInterfaceDisabled");
      break;
    case 124:
      v1 = CFSTR("Internal only - BluetoothWiFiInterfaceDisabled");
      break;
    case 125:
      v1 = CFSTR("Internal only - WatchMissingLTK");
      break;
    case 126:
      v1 = CFSTR("Internal only - OldProtocol");
      break;
    case 127:
      v1 = CFSTR("Internal only - UnlockAttemptLimitReached");
      break;
    case 128:
      v1 = CFSTR("Internal only - PeerNotAvailable");
      break;
    case 129:
      v1 = CFSTR("Internal only - LTKHashesMismatch");
      break;
    case 130:
      v1 = CFSTR("Internal only - AppleWatchOutOfRange");
      break;
    case 131:
      v1 = CFSTR("Internal only - UnableToFindWatch");
      break;
    case 132:
      v1 = CFSTR("Internal only - UnableToFindWatchInProxy");
      break;
    case 133:
      v1 = CFSTR("Internal only - SetupFailed");
      break;
    case 134:
      v1 = CFSTR("Internal only - NotCloudPaired");
      break;
    case 135:
      v1 = CFSTR("Internal only - WatchLockedAndOnWrist");
      break;
    case 136:
      v1 = CFSTR("Internal only - CodeConfirmationFailure");
      break;
    case 137:
      v1 = CFSTR("Internal only - NoRangingResults");
      break;
    case 138:
      v1 = CFSTR("Internal only - UnableToFindRangingPeer");
      break;
    case 139:
      v1 = CFSTR("Internal only - RangingFailure");
      break;
    case 140:
      v1 = CFSTR("Internal only - ProxyFailedToConnect");
      break;
    case 141:
      v1 = CFSTR("Internal only - ProxyFailedToSend");
      break;
    case 142:
      v1 = CFSTR("Internal only - ProxyFailedToSendTimeout");
      break;
    case 143:
      v1 = CFSTR("Internal only - ProxyUnknownError");
      break;
    case 144:
      v1 = CFSTR("Internal only - ProxyNotAvailableForUnlock");
      break;
    case 145:
      v1 = CFSTR("Internal only - MachineClamshellWithNoDisplay");
      break;
    case 146:
      v1 = CFSTR("Internal only - MacInternetSharing");
      break;
    case 147:
      v1 = CFSTR("Internal only - IncorrectUserPassword");
      break;
    case 148:
      v1 = CFSTR("Internal only - MacMissingLTK");
      break;
    case 149:
      v1 = CFSTR("Internal only - MissingLocalLTK");
      break;
    case 150:
      v1 = CFSTR("Internal only - WatchNotSignedIn");
      break;
    case 151:
      v1 = CFSTR("Internal only - SetupRequestSendFailed");
      break;
    case 152:
      v1 = CFSTR("Internal only - SetupTokenExchangeSendFailed");
      break;
    case 153:
      v1 = CFSTR("Internal only - SetupInitialRequestTimeout");
      break;
    case 154:
      v1 = CFSTR("Internal only - SetupTokenExchangeTimeout");
      break;
    case 155:
      v1 = CFSTR("Internal only - SetupWatchFailedToSendToken");
      break;
    case 156:
      v1 = CFSTR("Internal only - SetupWatchFailedSendCompnID");
      break;
    case 157:
      v1 = CFSTR("Internal only - OverallAttemptTimeout");
      break;
    case 158:
      v1 = CFSTR("Internal only - WatchOffWrist");
      break;
    case 159:
      v1 = CFSTR("Internal only - WatchLockedAndOffWrist");
      break;
    case 160:
      v1 = CFSTR("Internal only - MessageMissingSetupToken");
      break;
    case 161:
      v1 = CFSTR("Internal only - AKSSessionSetupFailedWatch");
      break;
    case 163:
      v1 = CFSTR("Internal only - AKSSecretStepFailed");
      break;
    case 164:
      v1 = CFSTR("Internal only - AKSFinalStepFailed");
      break;
    case 165:
      v1 = CFSTR("Internal only - FailedCreateSessionTokenWatch");
      break;
    case 166:
      v1 = CFSTR("Internal only - FailedStoreSessionTokenWatch");
      break;
    case 169:
      v1 = CFSTR("Internal only - FailedToCreateEscrowSecret");
      break;
    case 170:
      v1 = CFSTR("Internal only - FailedToStoreEscrowSecret");
      break;
    case 171:
      v1 = CFSTR("Internal only - UnknownWatchFailure");
      break;
    case 172:
      v1 = CFSTR("Internal only - AKSPeerSetupFailed");
      break;
    case 173:
      v1 = CFSTR("Internal only - NewWatchVersion");
      break;
    case 174:
      v1 = CFSTR("Internal only - PasscodeKeychainMismatch");
      break;
    case 175:
      v1 = CFSTR("Internal only - MissingPasscode");
      break;
    case 176:
      v1 = CFSTR("Internal only - WaitingForLTKSync");
      break;
    case 177:
      v1 = CFSTR("Internal only - iPhoneNeedsUnlock");
      break;
    case 178:
      v1 = CFSTR("Internal only - MacNotIDSRegistered");
      break;
    case 179:
      v1 = CFSTR("Internal only - UserDeniedAuthRequest");
      break;
    case 180:
      v1 = CFSTR("Internal only - AuthRequestFailedToPost");
      break;
    case 181:
      v1 = CFSTR("Internal only - UnexpectedAuthMode");
      break;
    case 182:
      v1 = CFSTR("Internal only - TestMode");
      break;
    case 183:
      v1 = CFSTR("Internal only - UserSessionNotAvailable");
      break;
    case 184:
      v1 = CFSTR("Internal only - AuthPromptsDisabled");
      break;
    case 185:
      v1 = CFSTR("Internal only - AuthPromptsMissingToken");
      break;
    case 186:
      v1 = CFSTR("Internal only - WatchFailedToConnect");
      break;
    case 187:
      v1 = CFSTR("Internal only - LTKMissing");
      break;
    case 188:
      v1 = CFSTR("Internal only - IncorrectLocalLTK");
      break;
    case 189:
      v1 = CFSTR("Internal only - EncryptionFailed");
      break;
    case 190:
      v1 = CFSTR("Internal only - DecryptionFailed");
      break;
    case 191:
      v1 = CFSTR("Internal only - MissingSessionKey");
      break;
    case 192:
      v1 = CFSTR("Internal only - AWDLFailedToStart");
      break;
    case 193:
      v1 = CFSTR("Internal only - MacLTKHashMismatch");
      break;
    case 194:
      v1 = CFSTR("Internal only - MissingLocalIDSID");
      break;
    case 195:
      v1 = CFSTR("Internal only - ReceivedMsgBeforeFirstUnlock");
      break;
    case 196:
      v1 = CFSTR("Internal only - TimeoutLTKResponseFromPhone");
      break;
    case 197:
      v1 = CFSTR("Internal only - PairingWatchTimeout");
      break;
    case 198:
      v1 = CFSTR("Internal only - NoIDSDeviceForBluetoothID");
      break;
    case 199:
      v1 = CFSTR("Internal only - WatchWiFiInterfaceDisabled");
      break;
    case 200:
      v1 = CFSTR("Internal only - AuthPromptRequestFailed");
      break;
    case 201:
      v1 = CFSTR("Internal only - AuthPromptResponseFailed");
      break;
    case 202:
      v1 = CFSTR("Internal only - AuthPromptImageDataFailed");
      break;
    case 203:
      v1 = CFSTR("Internal only - AuthPromptCallerInfoMissing");
      break;
    case 204:
      v1 = CFSTR("Internal only - WatchInSleepMode");
      break;
    case 205:
      v1 = CFSTR("Internal only - FaceIDDisabled");
      break;
    case 206:
      v1 = CFSTR("Internal only - NoMask");
      break;
    case 207:
      v1 = CFSTR("Internal only - BioLockout");
      break;
    case 210:
      v1 = CFSTR("Internal only - WatchNoMotionDetected");
      break;
    case 211:
      v1 = CFSTR("Internal only - RegistrationTokenMissing");
      break;
    case 212:
      v1 = CFSTR("Internal only - RegistrationMalformedRequest");
      break;
    case 213:
      v1 = CFSTR("Internal only - UnlockAttemptTokenNotArmed");
      break;
    case 214:
      v1 = CFSTR("Internal only - UnlockAttemptNoRecentUnlock");
      break;
    case 215:
      v1 = CFSTR("Internal only - WatchUnlockedAfterPhone");
      break;
    case 216:
      v1 = CFSTR("Internal only - AttemptBlockedDueToRelock");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringValue");
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v1;
}

const __CFString *SBUISystemApertureCommandDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("unknown");
  else
    return off_1E4C3F248[a1 - 1];
}

uint64_t SBLayoutSupportsSideLayoutRole()
{
  if (SBLayoutSupportsSideLayoutRole_onceToken != -1)
    dispatch_once(&SBLayoutSupportsSideLayoutRole_onceToken, &__block_literal_global_12);
  return SBLayoutSupportsSideLayoutRole_sSBLayoutSupportsSideLayoutRole;
}

void sub_1A4749244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *SBSUIInCallWindowSceneSessionDestructionReasonDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("unknown");
  else
    return off_1E4C3F308[a1];
}

const __CFString *SBSUIHardwareButtonEventTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E4C3F350[a1 - 1];
}

__CFString *SBSUIHardwareButtonEventTypeMaskDescription(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  _QWORD *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t, int);
  void *v11;
  __CFString *v12;
  char v13;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __SBSUIHardwareButtonEventTypeMaskDescription_block_invoke;
    v11 = &unk_1E4C3F330;
    v3 = v2;
    v12 = v3;
    v4 = v9;
    v13 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(_QWORD *))v10)(v4);
          if (v13)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }

    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" %lu"), a1);
    -[__CFString appendString:](v3, "appendString:", CFSTR(")"));

  }
  else
  {
    v3 = CFSTR("none");
  }
  return v3;
}

BOOL SBSUIHardwareButtonEventTypeIsValid(unint64_t a1)
{
  return a1 < 5;
}

void sub_1A474A874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A474D3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A474D6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A474DC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A474E138(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A474E200(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A474E2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A474F27C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A474F458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPBItemMetadataKey()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getPBItemMetadataKeySymbolLoc_ptr;
  v6 = getPBItemMetadataKeySymbolLoc_ptr;
  if (!getPBItemMetadataKeySymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getPBItemMetadataKeySymbolLoc_block_invoke;
    v2[3] = &unk_1E4C3E458;
    v2[4] = &v3;
    __getPBItemMetadataKeySymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getPBItemMetadataKey_cold_1();
  return *v0;
}

void sub_1A4752EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPBItemMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PasteboardLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4C3F568;
    v5 = 0;
    PasteboardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PasteboardLibraryCore_frameworkLibrary)
    __getPBItemMetadataKeySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)PasteboardLibraryCore_frameworkLibrary, "PBItemMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPBItemMetadataKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SBUI_LegibilitySettingsShadowHasSameShapeAsLegibilitySettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "shadowSettings");
    v6 = v18;
    if (v5)
    {
LABEL_3:
      objc_msgSend(v5, "shadowSettings");
      v7 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0.0;
    if (v4)
      goto LABEL_3;
  }
  v7 = 0.0;
LABEL_6:
  if (vabdd_f64(v6, v7) > 2.22044605e-16)
    goto LABEL_14;
  if (!v3)
  {
    v8 = 0.0;
    if (v5)
      goto LABEL_9;
LABEL_11:
    v9 = 0.0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "shadowSettings");
  v8 = v16;
  if (!v5)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(v5, "shadowSettings");
  v9 = v15;
LABEL_12:
  if (vabdd_f64(v8, v9) <= 2.22044605e-16)
  {
    objc_msgSend(v3, "minFillHeight");
    v11 = v10;
    objc_msgSend(v5, "minFillHeight");
    if (vabdd_f64(v11, v12) <= 2.22044605e-16)
    {
      v13 = 1;
      goto LABEL_15;
    }
  }
LABEL_14:
  v13 = 0;
LABEL_15:

  return v13;
}

BOOL SBUI_LegibilityShadowSettingsAreEqual(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      && vabdd_f64(*(double *)(a1 + 8), *(double *)(a2 + 8)) < 2.22044605e-16
      && vabdd_f64(*(double *)a1, *(double *)a2) < 2.22044605e-16
      && vabdd_f64(*(double *)(a1 + 16), *(double *)(a2 + 16)) < 2.22044605e-16;
}

uint64_t SBUILegibilityShadowSettingsHash(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

id CAFilterForSBUILegibilityShadowCompositingFilter(uint64_t a1)
{
  id *v1;

  if (a1 == 1)
  {
    v1 = (id *)MEMORY[0x1E0CD2C30];
  }
  else
  {
    if (a1 != 2)
      return 0;
    v1 = (id *)MEMORY[0x1E0CD2DE0];
  }
  return *v1;
}

double SBUILegibilityImageSizeForContentSizeAndStyle(uint64_t a1, double a2)
{
  void *v3;
  double v4;

  +[SBUILegibilitySettings sharedInstanceForStyle:](SBUILegibilitySettings, "sharedInstanceForStyle:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SBUILegibilityImageSizeForContentSizeAndSettings(v3, a2);

  return v4;
}

__CFString *SBUISystemApertureSettingKeyValueDescription(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  unint64_t v46;
  id v47;
  uint64_t v48;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    switch(a2)
    {
      case 3213009:
      case 3213019:
      case 3213020:
      case 3213021:
      case 3213022:
        v5 = objc_opt_class();
        v6 = v4;
        if (v5)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v7 = v6;
          else
            v7 = 0;
        }
        else
        {
          v7 = 0;
        }
        v13 = v7;

        v14 = objc_msgSend(v13, "unsignedIntegerValue");
        SBUISystemApertureLayoutModeDescription(v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3213016:
        v19 = objc_msgSend(v3, "unsignedIntegerValue");
        if (v19 >= 4)
          v8 = CFSTR("invalid");
        else
          v8 = off_1E4C3F680[v19];
        break;
      case 3213017:
        v20 = objc_opt_class();
        v21 = v4;
        if (v20)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = v21;
          else
            v22 = 0;
        }
        else
        {
          v22 = 0;
        }
        v39 = v22;

        objc_msgSend(v39, "BOOLValue");
        NSStringFromBOOL();
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3213018:
        v23 = objc_opt_class();
        v24 = v4;
        if (v23)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
        }
        else
        {
          v25 = 0;
        }
        v40 = v25;

        v41 = objc_msgSend(v40, "unsignedIntegerValue");
        SBUISystemApertureContentRoleDescription(v41);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3213028:
        v26 = (void *)MEMORY[0x1E0CB3940];
        v27 = objc_opt_class();
        v28 = v4;
        if (v27)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
        }
        else
        {
          v29 = 0;
        }
        v42 = v29;

        v43 = objc_msgSend(v42, "unsignedIntValue");
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%u"), v43);
        goto LABEL_16;
      case 3213029:
      case 3213030:
      case 3213031:
      case 3213032:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = objc_opt_class();
        v11 = v4;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v16 = v12;

        v17 = objc_msgSend(v16, "unsignedLongLongValue");
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%llu"), v17);
LABEL_16:
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3213034:
        v30 = objc_opt_class();
        v31 = v4;
        if (v30)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v32 = v31;
          else
            v32 = 0;
        }
        else
        {
          v32 = 0;
        }
        v44 = v32;

        _SBUISafeBackgroundActivityIdentifiersDescription(v44);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 3213036:
        v33 = objc_opt_class();
        v34 = v4;
        if (v33)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v35 = v34;
          else
            v35 = 0;
        }
        else
        {
          v35 = 0;
        }
        v45 = v35;

        v46 = objc_msgSend(v45, "integerValue");
        SBUISystemApertureCustomLayoutDescription(v46);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3213039:
        v36 = objc_opt_class();
        v37 = v4;
        if (v36)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
        }
        else
        {
          v38 = 0;
        }
        v47 = v38;

        v48 = objc_msgSend(v47, "unsignedIntegerValue");
        SBUISystemAperturePresentationBehaviorsDescription(v48);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      default:
        objc_msgSend(v3, "description");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v8 = (__CFString *)v15;
        break;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

const __CFString *SBUISystemApertureSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 3213008) > 0x2C)
    return CFSTR("invalid");
  else
    return off_1E4C3F6A0[a1 - 3213008];
}

void sub_1A475C428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBUIProudLockIconViewStateForSBUIFaceIDCoachingCondition(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = 0;
  switch(a1)
  {
    case 2:
      result = 8;
      break;
    case 4:
      v7 = SBUIFaceIDCameraOrientationForDevice();
      result = 12;
      switch(a3)
      {
        case 0uLL:
          if (SBUIFaceIDCameraOrientationAlignsWithInterfaceOrientation(v7, a2))
            result = 10;
          else
            result = 12;
          break;
        case 1uLL:
          if (SBUIInterfaceOrientationForFaceIDCameraOrientation(v7) == a2)
            result = 10;
          else
            result = 12;
          break;
        case 2uLL:
          return result;
        case 3uLL:
          result = 10;
          break;
        default:
          goto LABEL_10;
      }
      break;
    case 5:
    case 6:
    case 7:
      result = 4;
      break;
    case 8:
      result = 16;
      break;
    case 9:
      result = 19;
      break;
    case 10:
      result = 20;
      break;
    case 11:
      result = 21;
      break;
    case 12:
      if (a3 >= 4)
        goto LABEL_10;
      result = qword_1A47AF168[a3];
      break;
    case 13:
LABEL_10:
      result = 0;
      break;
    case 14:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled())
        result = 22;
      else
        result = 0;
      break;
    default:
      return result;
  }
  return result;
}

__CFString *NSStringForSBUIProudLockIconViewState(unint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  __CFString *v4;

  if (SBUIProudLockIconViewStateIsCoaching(a1))
  {
    v2 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(a1);
    if (a1 - 10 >= 3)
    {
      DebugStringForSBUIFaceIDCoachingCondition(v2);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = off_1E4C3F880[a1 - 10];
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coaching: %@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (a1 > 0x13)
  {
    v4 = 0;
  }
  else
  {
    v4 = off_1E4C3F898[a1];
  }
  return v4;
}

id NSStringCoachingTextForSBUIProudLockIconViewState(unint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (SBUIProudLockIconViewStateIsCoaching(a1))
  {
    v2 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(a1);
    SBUICoachingTextForSBUIFaceIDCoachingCondition(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

BOOL SBUIUnlockSourceShowsScanningState(int a1)
{
  return a1 != 10;
}

id SBUIWindowForViewControllerTransition(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "containerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "window");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

void sub_1A475D8EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

const __CFString *SBSUIIdleTimerModeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (!a1)
    v1 = CFSTR("SBSUIIdleTimerModeUnlocked");
  if (a1 == 1)
    return CFSTR("SBSUIIdleTimerModeLocked");
  else
    return v1;
}

const __CFString *SBSUIRotationModeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("SBSUIRotationModeNotAllowed");
  if (a1)
    return v1;
  else
    return CFSTR("SBSUIRotationModeAllowed");
}

const __CFString *SBSUIWallpaperModeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("SBSUIWallpaperModeDark");
  if (a1)
    return v1;
  else
    return CFSTR("SBSUIWallpaperModeLight");
}

__CFString *SBSUILoginUISceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  uint64_t v9;
  __CFString *v10;

  v3 = a2;
  v4 = v3;
  if (a1 == 736840729)
  {
    v9 = objc_msgSend(v3, "unsignedIntegerValue");
    v6 = CFSTR("unknown");
    if (v9 == 1)
      v6 = CFSTR("SBSUIWallpaperModeDark");
    v7 = CFSTR("SBSUIWallpaperModeLight");
    goto LABEL_13;
  }
  if (a1 == 736840728)
  {
    v9 = objc_msgSend(v3, "integerValue");
    v6 = CFSTR("unknown");
    if (v9 == 1)
      v6 = CFSTR("SBSUIRotationModeNotAllowed");
    v7 = CFSTR("SBSUIRotationModeAllowed");
LABEL_13:
    v8 = v9 == 0;
    goto LABEL_14;
  }
  if (a1 != 736840726)
  {
    v10 = 0;
    goto LABEL_18;
  }
  v5 = objc_msgSend(v3, "integerValue");
  v6 = CFSTR("unknown");
  if (!v5)
    v6 = CFSTR("SBSUIIdleTimerModeUnlocked");
  v7 = CFSTR("SBSUIIdleTimerModeLocked");
  v8 = v5 == 1;
LABEL_14:
  if (v8)
    v6 = (__CFString *)v7;
  v10 = v6;
LABEL_18:

  return v10;
}

id NSDictionaryFromSBUILegibilityShadowSettings(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("kSBUIModernLegibilityShadowRadiusKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("kSBUIModernLegibilityShadowAlphaKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("kSBUIModernLegibilityImageOutsetKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("kSBUIModernLegibilityShadowCompositingFilterNameKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void SBUILegibilityShadowSettingsFromDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  id v10;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIModernLegibilityShadowRadiusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  *(double *)a2 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIModernLegibilityShadowAlphaKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  *(double *)(a2 + 8) = v7;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIModernLegibilityImageOutsetKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  *(double *)(a2 + 16) = v9;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIModernLegibilityShadowCompositingFilterNameKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(a2 + 24) = objc_msgSend(v10, "integerValue");
}

id ComputeLegibilityColorFromColor(void *a1)
{
  id v1;
  void *v2;
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v7;
  double v8;
  double v9;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(v1);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v3, "CGColor")) >= 3)
  {
    v8 = 0.0;
    v9 = 0.0;
    v7 = 0;
    if (objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, 0))
    {
      v4 = 0.0;
      if (v9 != 0.0)
        v4 = fmin(fmax(v8, 0.3), 0.5);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v9, v4, 0.3, 1.0);
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
  }

  return v2;
}

const __CFString *NSStringFromSBUIBiometricEvent(unint64_t a1)
{
  if (a1 > 0x21)
    return CFSTR("(unknown)");
  else
    return off_1E4C3FC40[a1];
}

const __CFString *NSStringFromSBUIBiometricLockoutState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return CFSTR("None");
  else
    return off_1E4C3FD50[a1 - 1];
}

const __CFString *NSStringFromSBUIBiometricMatchMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("None");
  else
    return off_1E4C3FDA0[a1 - 1];
}

uint64_t _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()
{
  return _os_feature_enabled_impl();
}

id SBSUIInCallSceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  UIEdgeInsets v32;

  v3 = a2;
  switch(a1)
  {
    case 2001:
      v11 = objc_opt_class();
      v12 = v3;
      if (v11)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v20 = v13;

      v21 = objc_msgSend(v20, "unsignedIntegerValue");
      SBSUIHardwareButtonEventTypeMaskDescription(v21);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2002:
      v14 = objc_opt_class();
      v15 = v3;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v22 = v16;

      _SBUISafeBackgroundActivityIdentifiersDescription(v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2003:
    case 2004:
    case 2005:
    case 2006:
    case 2008:
    case 2009:
    case 2010:
    case 2011:
      v4 = objc_opt_class();
      v5 = v3;
      if (v4)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v7 = v6;

      objc_msgSend(v7, "BOOLValue");
      NSStringFromBOOL();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2007:
      v17 = objc_opt_class();
      v18 = v3;
      if (v17)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
      }
      else
      {
        v19 = 0;
      }
      v23 = v19;

      objc_msgSend(v23, "UIEdgeInsetsValue");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      v32.top = v25;
      v32.left = v27;
      v32.bottom = v29;
      v32.right = v31;
      NSStringFromUIEdgeInsets(v32);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

double _SBMainScreenScale()
{
  if (_SBMainScreenScale_onceToken != -1)
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
  return *(double *)&_SBMainScreenScale___s;
}

BOOL SBFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t SBRectEqualsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v17;
  _BOOL4 v19;

  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5))
    return 1;
  v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 2.22044605e-16 || v17 >= 2.22044605e-16)
    return 0;
  v19 = vabdd_f64(a3, a7) < 2.22044605e-16;
  return vabdd_f64(a4, a8) < 2.22044605e-16 && v19;
}

BOOL SBPointEqualsPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

BOOL SBSizeEqualsSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

BOOL SBSizeLessThanSize(double a1, double a2, double a3, double a4)
{
  return a2 < a4 && a1 < a3;
}

uint64_t SBSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  double v4;
  _BOOL4 v6;

  v4 = vabdd_f64(a1, a3);
  if (a1 <= a3 && v4 >= 2.22044605e-16)
    return 0;
  v6 = vabdd_f64(a2, a4) < 2.22044605e-16;
  return a2 > a4 || v6;
}

BOOL SBPointEqualToPointAtScale(double a1, double a2, double a3, double a4, double a5)
{
  if (fabs(a5) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1)
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
    a5 = *(double *)&_SBMainScreenScale___s;
  }
  return vabdd_f64(a1 * a5, a3 * a5) < 2.22044605e-16 && vabdd_f64(a2 * a5, a4 * a5) < 2.22044605e-16;
}

double SBFloatRoundForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1)
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return round(a2 * a1) / a2;
}

double SBFloatRoundForMainScreenScale(double a1)
{
  if (_SBMainScreenScale_onceToken != -1)
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
  return round(*(double *)&_SBMainScreenScale___s * a1) / *(double *)&_SBMainScreenScale___s;
}

double SBFloatFloorForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1)
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return floor(a2 * a1) / a2;
}

double SBFloatCeilForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1)
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return ceil(a2 * a1) / a2;
}

double SBPointRoundForScale(double a1, double a2, double a3)
{
  double v5;

  v5 = SBFloatRoundForScale(a1, a3);
  SBFloatRoundForScale(a2, a3);
  return v5;
}

double SBPointRoundForMainScreenScale(double a1)
{
  if (_SBMainScreenScale_onceToken != -1)
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_25);
  return round(a1 * *(double *)&_SBMainScreenScale___s) / *(double *)&_SBMainScreenScale___s;
}

double SBRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9;

  v9 = SBFloatRoundForScale(a1, a5);
  SBFloatRoundForScale(a2, a5);
  SBFloatRoundForScale(a3, a5);
  SBFloatRoundForScale(a4, a5);
  return v9;
}

double SBRectRoundForMainScreenScale(double a1, double a2, double a3, double a4)
{
  return SBRectRoundForScale(a1, a2, a3, a4, 0.0);
}

double SBOffsetPointInReferenceSpaceAlongSceneSpaceDirectionForOrientation(unint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  double v7;
  double v8;
  uint64_t v9;

  v7 = -a5;
  if (a1 > 1)
  {
    if (a1 == 2)
      v8 = a5;
    else
      v8 = -a5;
    v9 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", v7);
    v7 = -v8;
    if (v9 != 1)
      v7 = v8;
    switch(a2)
    {
      case 0:
LABEL_11:
        a3 = *MEMORY[0x1E0C9D538];
        break;
      case 1:
LABEL_12:
        a3 = a3 - v7;
        break;
      case 2:
LABEL_13:
        a3 = a3 + v7;
        break;
      default:
        return a3;
    }
  }
  else
  {
    if (!a1)
      v7 = a5;
    switch(a2)
    {
      case 0:
        goto LABEL_11;
      case 3:
        goto LABEL_13;
      case 4:
        goto LABEL_12;
      default:
        return a3;
    }
  }
  return a3;
}

uint64_t SBRectContainsPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  return SBRectContainsPointIncludingEdges(15, a1, a2, a3, a4, a5, a6);
}

uint64_t SBRectContainsPointIncludingEdges(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (CGRectIsNull(*(CGRect *)&a2))
    return 0;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  if (CGRectIsEmpty(v15))
    return 0;
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  if (CGRectGetMinX(v16) > a6)
    return 0;
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  if (a6 > CGRectGetMaxX(v17))
    return 0;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  if (CGRectGetMinY(v18) > a7)
    return 0;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  if (a7 > CGRectGetMaxY(v19))
    return 0;
  if ((a1 & 1) == 0)
  {
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    if (a7 == CGRectGetMinY(v20))
      return 0;
  }
  if ((a1 & 2) == 0)
  {
    v21.origin.x = a2;
    v21.origin.y = a3;
    v21.size.width = a4;
    v21.size.height = a5;
    if (a6 == CGRectGetMinX(v21))
      return 0;
  }
  if ((a1 & 4) == 0)
  {
    v22.origin.x = a2;
    v22.origin.y = a3;
    v22.size.width = a4;
    v22.size.height = a5;
    if (a7 == CGRectGetMaxY(v22))
      return 0;
  }
  if ((a1 & 8) == 0
    && (v23.origin.x = a2, v23.origin.y = a3, v23.size.width = a4, v23.size.height = a5, a6 == CGRectGetMaxX(v23)))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

uint64_t SBStringFromRectCornerRadii(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topLeft:%f topRight:%f bottomLeft:%f bottomRight:%f"), *(_QWORD *)&a1, *(_QWORD *)&a4, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

__CFString *SBStringFromCornerMask(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __CFString *v3;

  if (!a1)
    return CFSTR("noCorners");
  if (a1 == 15)
  {
    v3 = CFSTR("allCorners");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("minXminY:%d maxXminY:%d minXmaxY:%d maxXmaxY:%d"), a1 & 1, (a1 >> 1) & 1, (a1 >> 2) & 1, (a1 >> 3) & 1, v1, v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

double SBTransformedSizeWithScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

void _SBUILegibilityMetalEngineCGDataProviderFreeDataCallback(uint64_t a1, void *a2)
{
  malloc_zone_t *v3;

  v3 = malloc_default_zone();
  malloc_zone_free(v3, a2);
}

void sub_1A476D94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  id *v47;
  uint64_t v48;

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v48 - 248), 8);
  _Block_object_dispose((const void *)(v48 - 200), 8);
  _Block_object_dispose((const void *)(v48 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A4770DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4773720(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A477397C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromSBUIContinuitySessionErrorCode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == -1000)
    v1 = CFSTR("Generic");
  if (a1 == -1001)
    v1 = CFSTR("Security");
  if (a1 == -2001)
    return CFSTR("InvalidSession");
  else
    return v1;
}

id SBUIContinuitySessionErrorCreate(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("None");
    if (a1 == (void *)-1000)
      v13 = CFSTR("Generic");
    if (a1 == (void *)-1001)
      v13 = CFSTR("Security");
    if (a1 == (void *)-2001)
      v14 = CFSTR("InvalidSession");
    else
      v14 = v13;
    objc_msgSend(v11, "bs_setSafeObject:forKey:", v14, *MEMORY[0x1E0D01298]);
    if (v10)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
      objc_msgSend(v12, "bs_setSafeObject:forKey:", v15, *MEMORY[0x1E0CB2D68]);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBUIContinuitySessionErrorDomain"), a1, v12);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

const __CFString *NSStringFromSBUIContinuityButtonEventType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("none");
  else
    return off_1E4C3FFA8[a1 - 1];
}

const __CFString *NSStringFromSBUIContinuitySessionStep(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_1E4C3FFC0[a1 - 1];
}

id SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(void *a1)
{
  __CFString *v1;
  const __CFString *v2;
  void *v3;

  objc_msgSend(a1, "hardwareIdentifier");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("<embedded>");
  if (v1)
    v2 = v1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SB-display-%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *SBSUIDeviceLockSourceTypeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 2)
    v1 = CFSTR("smartCover");
  if (a1 == 1)
    return CFSTR("lockButton");
  else
    return v1;
}

uint64_t SBUIBiometricEventIsProvidingFeedback(unint64_t a1)
{
  return (a1 < 0x20) & (0x808F0000 >> a1);
}

uint64_t SBUIFaceIDCoachingConditionForBiometricEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 16) > 0xF)
    return 0;
  else
    return qword_1A47AF258[a1 - 16];
}

id UIContentSizeCategoryOneSmallerThanSizeCategory(void *a1)
{
  NSString *v1;
  NSComparisonResult v2;
  void *v3;
  NSComparisonResult v4;
  NSComparisonResult v5;
  NSComparisonResult v6;
  NSComparisonResult v7;
  NSComparisonResult v8;
  NSComparisonResult v9;
  NSComparisonResult v10;
  NSComparisonResult v11;
  NSComparisonResult v12;
  NSComparisonResult v13;
  id v14;

  v1 = a1;
  v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3C0]);
  v3 = (void *)*MEMORY[0x1E0CEB3C8];
  if (v2)
  {
    v4 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3C8]);
    v3 = (void *)*MEMORY[0x1E0CEB3D0];
    if (v4)
    {
      v5 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D0]);
      v3 = (void *)*MEMORY[0x1E0CEB3D8];
      if (v5)
      {
        v6 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D8]);
        v3 = (void *)*MEMORY[0x1E0CEB3E0];
        if (v6)
        {
          v7 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3E0]);
          v3 = (void *)*MEMORY[0x1E0CEB3F8];
          if (v7)
          {
            v8 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]);
            v3 = (void *)*MEMORY[0x1E0CEB400];
            if (v8)
            {
              v9 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB400]);
              v3 = (void *)*MEMORY[0x1E0CEB408];
              if (v9)
              {
                v10 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB408]);
                v3 = (void *)*MEMORY[0x1E0CEB420];
                if (v10)
                {
                  v11 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB420]);
                  v3 = (void *)*MEMORY[0x1E0CEB428];
                  if (v11)
                  {
                    v12 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB428]);
                    v3 = (void *)*MEMORY[0x1E0CEB438];
                    if (v12)
                    {
                      v13 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB438]);
                      v3 = (void *)*MEMORY[0x1E0CEB410];
                      if (v13)
                      {
                        if (UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0CEB410]))
                          v3 = (void *)*MEMORY[0x1E0CEB440];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v14 = v3;

  return v14;
}

BOOL UIContentSizeCategoryIsEqualToCategory(NSString *a1, NSString *a2)
{
  return UIContentSizeCategoryCompareToCategory(a1, a2) == NSOrderedSame;
}

NSString *UIContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  NSString *v10;
  NSComparisonResult v11;
  NSString *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    v8 = (NSString *)v5;
    v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), v10 = v6, v11 == NSOrderedAscending))
    {
      v12 = v10;

      v8 = v12;
    }
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

BOOL UIContentSizeCategoryIsInRange(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  NSComparisonResult v7;

  v5 = a1;
  UIContentSizeCategoryClip(v5, a2, a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v5, v6);

  return v7 == NSOrderedSame;
}

uint64_t SBUIUIFontForCoachingTextForContentSizeCategory(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0CEB538], 12, a1);
}

id SBUICurrentPreferredFontForCoachingText()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0CEB538], 12, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t SBUICeilingCapHeightForCoachingTextForUIContentSizeCategory(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CEA950];
  v2 = a1;
  objc_msgSend(v1, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0CEB538], 12, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "capHeight");
  return BSFloatRoundForScale();
}

uint64_t SBUIBytesPerPixelForMetalPixelFormat(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 4;
  switch(v1)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
      result = 8;
      break;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      result = 16;
      break;
    case 39:
    case 40:
    case 42:
      result = 5;
      break;
    case 41:
      return result;
    case 52:
    case 53:
    case 54:
    case 102:
    case 103:
    case 104:
    case 122:
    case 123:
    case 124:
      result = 32;
      break;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      result = 10;
      break;
    default:
      SBUIBytesPerPixelForMetalPixelFormat_cold_1();
  }
  return result;
}

uint64_t SBUIBitsPerComponentForMTLPixelFormat(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 4;
  switch(v1)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
      result = 8;
      break;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      result = 16;
      break;
    case 39:
    case 40:
    case 42:
      result = 5;
      break;
    case 41:
      return result;
    case 52:
    case 53:
    case 54:
    case 102:
    case 103:
    case 104:
    case 122:
    case 123:
    case 124:
      result = 32;
      break;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      result = 10;
      break;
    default:
      SBUIBitsPerComponentForMTLPixelFormat_cold_1();
  }
  return result;
}

uint64_t UIImageCreateFromMTLPixelFormat(unint64_t a1, char a2, void *a3, void *a4, void *a5, double a6, double a7, double a8)
{
  id Data;
  void (**v15)(id);
  uint64_t v16;
  float v17;
  size_t v18;
  unint64_t v19;
  unsigned int v20;
  size_t v21;
  int v22;
  float v23;
  size_t v24;
  void (**v25)(id);
  void *v26;
  unint64_t v27;
  uint32_t v28;
  size_t v29;
  CGContext *v30;
  const __CFData *v31;
  CGDataProvider *v32;
  CGImageRef v33;
  CGImage *Image;
  void (**v35)(_QWORD, _QWORD, _QWORD, double);
  uint64_t v36;
  uint64_t v37;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  size_t bitsPerPixel;
  void *context;
  id v46;
  void (**v48)(id);
  uint64_t bytesPerRow;
  CGColorSpace *space;
  CGAffineTransform v51;
  CGFloat decode[2];
  uint64_t v53;
  CGSize v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  Data = a3;
  v15 = a4;
  v46 = a5;
  v16 = MEMORY[0x1A85A15D0]();
  v17 = a6 * a8;
  v18 = vcvtps_u32_f32(v17);
  v19 = UIImageBytesNeeded(a1, a6, a7, a8);
  v20 = SBUIBitsPerComponentForMTLPixelFormat(a1);
  v21 = SBUIBytesPerPixelForMetalPixelFormat(a1) * v20;
  bytesPerRow = CGBitmapGetAlignedBytesPerRow();
  space = SBUIColorSpaceFromPixelFormat(a1);
  v22 = 7;
  switch(a1)
  {
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      goto LABEL_9;
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
      goto LABEL_2;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x28uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
      v22 = 4096;
      goto LABEL_18;
    case 0x19uLL:
    case 0x41uLL:
      v22 = 4352;
      goto LABEL_18;
    case 0x29uLL:
    case 0x2AuLL:
      v22 = 4098;
      goto LABEL_18;
    case 0x2BuLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
      v22 = 4097;
      goto LABEL_18;
    case 0x35uLL:
    case 0x36uLL:
    case 0x67uLL:
    case 0x68uLL:
      goto LABEL_10;
    case 0x37uLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x69uLL:
    case 0x7BuLL:
    case 0x7CuLL:
      v22 = 8448;
      goto LABEL_18;
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
      v22 = 1;
      goto LABEL_18;
    case 0x50uLL:
    case 0x51uLL:
      v22 = 8194;
      goto LABEL_18;
    case 0x5AuLL:
    case 0x5BuLL:
      v22 = 204801;
      goto LABEL_18;
    case 0x5EuLL:
      v22 = 16385;
      goto LABEL_18;
    case 0x73uLL:
      v22 = 4353;
      goto LABEL_18;
    case 0x7DuLL:
      v22 = 8449;
      goto LABEL_18;
    default:
      if (a1 == 252)
      {
LABEL_10:
        v22 = 0x2000;
      }
      else
      {
        if (a1 != 253)
LABEL_9:
          UIImageCreateFromMTLPixelFormat_cold_1();
LABEL_2:
        v22 = 0;
      }
LABEL_18:
      bitsPerPixel = v21;
      context = (void *)v16;
      v23 = a7 * a8;
      v24 = vcvtps_u32_f32(v23);
      if (Data)
      {
        v25 = v15;
        v26 = Data;
        v27 = objc_msgSend(Data, "slotLength");
        if (v19 > v27)
        {
          v39 = v27;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage * _Nonnull UIImageCreateFromMTLPixelFormat(CGSize, CGFloat, MTLPixelFormat, CGImageAlphaInfo, CPMemoryPool *__strong _Nullable, __strong SBUIGraphicsDrawBlock _Nonnull, __strong SBUIGraphicsCreateImageBlock _Nullable)");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromMTLPixelFormat(a1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v54.width = a6;
          v54.height = a7;
          NSStringFromCGSize(v54);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("SBUIMetalHelpers.m"), 369, CFSTR("requested slot length (%zd) larger than maximum slotLength (%zd), not large enough for %@ context with dimensions %@ @%fx"), v19, v39, v40, v41, *(_QWORD *)&a8);

        }
        Data = (id)CGBitmapAllocateData();
        v15 = v25;
      }
      else
      {
        v26 = 0;
      }
      v28 = v22 | a2 & 0x1F;
      v29 = v20;
      v30 = CGBitmapContextCreate(Data, v18, v24, v20, bytesPerRow, space, v28);
      v55.size.width = (double)v18;
      v55.origin.x = 0.0;
      v55.origin.y = 0.0;
      v55.size.height = (double)v24;
      CGContextClearRect(v30, v55);
      if (v15)
      {
        CGContextTranslateCTM(v30, 0.0, (double)v24);
        CGContextScaleCTM(v30, a8, -a8);
        CGContextGetCTM(&v51, v30);
        CGContextSetBaseCTM();
        UIGraphicsPushContext(v30);
        v15[2](v15);
        UIGraphicsPopContext();
      }
      v48 = v15;
      if (Data)
      {
        objc_msgSend(v26, "nextSlotWithBytes:length:", Data, v19);
        v31 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v32 = CGDataProviderCreateWithCFData(v31);
        if (_MTLPixeLFormatIsSingleComponent(a1))
        {
          *(_OWORD *)decode = xmmword_1A47AF670;
          v33 = CGImageMaskCreate(v18, v24, v29, bitsPerPixel, bytesPerRow, v32, decode, 0);
        }
        else
        {
          v33 = CGImageCreate(v18, v24, v29, bitsPerPixel, bytesPerRow, space, v28, v32, 0, 0, kCGRenderingIntentDefault);
        }
        Image = v33;
        v35 = (void (**)(_QWORD, _QWORD, _QWORD, double))v46;
        CGDataProviderRelease(v32);
        CGBitmapFreeData();

        if (v46)
          goto LABEL_32;
LABEL_29:
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, a8);
        goto LABEL_33;
      }
      Image = CGBitmapContextCreateImage(v30);
      v35 = (void (**)(_QWORD, _QWORD, _QWORD, double))v46;
      if (!v46)
        goto LABEL_29;
LABEL_32:
      ((void (**)(_QWORD, CGImage *, _QWORD, double))v35)[2](v35, Image, 0, a8);
      v36 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v37 = v36;
      CGImageRelease(Image);
      CGColorSpaceRelease(space);
      CGContextRelease(v30);
      objc_autoreleasePoolPop(context);

      return v37;
  }
}

uint64_t UIImageBytesNeeded(uint64_t a1, double a2, double a3, double a4)
{
  float v5;
  unint64_t v6;

  v5 = a3 * a4;
  v6 = vcvtps_u32_f32(v5);
  SBUIBitsPerComponentForMTLPixelFormat(a1);
  SBUIBytesPerPixelForMetalPixelFormat(a1);
  return CGBitmapGetAlignedBytesPerRow() * v6;
}

CGColorSpaceRef SBUIColorSpaceFromPixelFormat(uint64_t a1)
{
  if ((unint64_t)(a1 - 10) <= 0x3D)
  {
    if (((1 << (a1 - 10)) & 0x200000008009) != 0)
      return CGColorSpaceCreateDeviceGray();
    if (a1 == 71)
      return CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  }
  if ((unint64_t)(a1 - 252) < 2)
    return CGColorSpaceCreateDeviceGray();
  if (a1 == 81)
    return CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  else
    return CGColorSpaceCreateDeviceRGB();
}

const __CFString *NSStringFromMTLPixelFormat(uint64_t a1)
{
  const __CFString *result;

  result = 0;
  switch(a1)
  {
    case 0:
      result = CFSTR("MTLPixelFormatInvalid");
      break;
    case 1:
      result = CFSTR("MTLPixelFormatA8Unorm");
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 21:
    case 26:
    case 27:
    case 28:
    case 29:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 56:
    case 57:
    case 58:
    case 59:
    case 61:
    case 66:
    case 67:
    case 68:
    case 69:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 106:
    case 107:
    case 108:
    case 109:
    case 111:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 168:
    case 169:
    case 171:
    case 173:
    case 175:
    case 177:
    case 184:
    case 185:
    case 191:
    case 201:
    case 202:
    case 203:
    case 209:
    case 219:
    case 220:
    case 221:
    case 227:
    case 237:
    case 238:
    case 239:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 249:
    case 251:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 259:
      return result;
    case 10:
      result = CFSTR("MTLPixelFormatR8Unorm");
      break;
    case 11:
      result = CFSTR("MTLPixelFormatR8Unorm_sRGB");
      break;
    case 12:
      result = CFSTR("MTLPixelFormatR8Snorm");
      break;
    case 13:
      result = CFSTR("MTLPixelFormatR8Uint");
      break;
    case 14:
      result = CFSTR("MTLPixelFormatR8Sint");
      break;
    case 20:
      result = CFSTR("MTLPixelFormatR16Unorm");
      break;
    case 22:
      result = CFSTR("MTLPixelFormatR16Snorm");
      break;
    case 23:
      result = CFSTR("MTLPixelFormatR16Uint");
      break;
    case 24:
      result = CFSTR("MTLPixelFormatR16Sint");
      break;
    case 25:
      result = CFSTR("MTLPixelFormatR16Float");
      break;
    case 30:
      result = CFSTR("MTLPixelFormatRG8Unorm");
      break;
    case 31:
      result = CFSTR("MTLPixelFormatRG8Unorm_sRGB");
      break;
    case 32:
      result = CFSTR("MTLPixelFormatRG8Snorm");
      break;
    case 33:
      result = CFSTR("MTLPixelFormatRG8Uint");
      break;
    case 34:
      result = CFSTR("MTLPixelFormatRG8Sint");
      break;
    case 40:
      result = CFSTR("MTLPixelFormatB5G6R5Unorm");
      break;
    case 41:
      result = CFSTR("MTLPixelFormatA1BGR5Unorm");
      break;
    case 42:
      result = CFSTR("MTLPixelFormatABGR4Unorm");
      break;
    case 43:
      result = CFSTR("MTLPixelFormatBGR5A1Unorm");
      break;
    case 53:
      result = CFSTR("MTLPixelFormatR32Uint");
      break;
    case 54:
      result = CFSTR("MTLPixelFormatR32Sint");
      break;
    case 55:
      result = CFSTR("MTLPixelFormatR32Float");
      break;
    case 60:
      result = CFSTR("MTLPixelFormatRG16Unorm");
      break;
    case 62:
      result = CFSTR("MTLPixelFormatRG16Snorm");
      break;
    case 63:
      result = CFSTR("MTLPixelFormatRG16Uint");
      break;
    case 64:
      result = CFSTR("MTLPixelFormatRG16Sint");
      break;
    case 65:
      result = CFSTR("MTLPixelFormatRG16Float");
      break;
    case 70:
      result = CFSTR("MTLPixelFormatRGBA8Unorm");
      break;
    case 71:
      result = CFSTR("MTLPixelFormatRGBA8Unorm_sRGB");
      break;
    case 72:
      result = CFSTR("MTLPixelFormatRGBA8Snorm");
      break;
    case 73:
      result = CFSTR("MTLPixelFormatRGBA8Uint");
      break;
    case 74:
      result = CFSTR("MTLPixelFormatRGBA8Sint");
      break;
    case 80:
      result = CFSTR("MTLPixelFormatBGRA8Unorm");
      break;
    case 81:
      result = CFSTR("MTLPixelFormatBGRA8Unorm_sRGB");
      break;
    case 90:
      result = CFSTR("MTLPixelFormatRGB10A2Unorm");
      break;
    case 91:
      result = CFSTR("MTLPixelFormatRGB10A2Uint");
      break;
    case 92:
      result = CFSTR("MTLPixelFormatRG11B10Float");
      break;
    case 93:
      result = CFSTR("MTLPixelFormatRGB9E5Float");
      break;
    case 94:
      result = CFSTR("MTLPixelFormatBGR10A2Unorm");
      break;
    case 103:
      result = CFSTR("MTLPixelFormatRG32Uint");
      break;
    case 104:
      result = CFSTR("MTLPixelFormatRG32Sint");
      break;
    case 105:
      result = CFSTR("MTLPixelFormatRG32Float");
      break;
    case 110:
      result = CFSTR("MTLPixelFormatRGBA16Unorm");
      break;
    case 112:
      result = CFSTR("MTLPixelFormatRGBA16Snorm");
      break;
    case 113:
      result = CFSTR("MTLPixelFormatRGBA16Uint");
      break;
    case 114:
      result = CFSTR("MTLPixelFormatRGBA16Sint");
      break;
    case 115:
      result = CFSTR("MTLPixelFormatRGBA16Float");
      break;
    case 123:
      result = CFSTR("MTLPixelFormatRGBA32Uint");
      break;
    case 124:
      result = CFSTR("MTLPixelFormatRGBA32Sint");
      break;
    case 125:
      result = CFSTR("MTLPixelFormatRGBA32Float");
      break;
    case 160:
      result = CFSTR("MTLPixelFormatPVRTC_RGB_2BPP");
      break;
    case 161:
      result = CFSTR("MTLPixelFormatPVRTC_RGB_2BPP_sRGB");
      break;
    case 162:
      result = CFSTR("MTLPixelFormatPVRTC_RGB_4BPP");
      break;
    case 163:
      result = CFSTR("MTLPixelFormatPVRTC_RGB_4BPP_sRGB");
      break;
    case 164:
      result = CFSTR("MTLPixelFormatPVRTC_RGBA_2BPP");
      break;
    case 165:
      result = CFSTR("MTLPixelFormatPVRTC_RGBA_2BPP_sRGB");
      break;
    case 166:
      result = CFSTR("MTLPixelFormatPVRTC_RGBA_4BPP");
      break;
    case 167:
      result = CFSTR("MTLPixelFormatPVRTC_RGBA_4BPP_sRGB");
      break;
    case 170:
      result = CFSTR("MTLPixelFormatEAC_R11Unorm");
      break;
    case 172:
      result = CFSTR("MTLPixelFormatEAC_R11Snorm");
      break;
    case 174:
      result = CFSTR("MTLPixelFormatEAC_RG11Unorm");
      break;
    case 176:
      result = CFSTR("MTLPixelFormatEAC_RG11Snorm");
      break;
    case 178:
      result = CFSTR("MTLPixelFormatEAC_RGBA8");
      break;
    case 179:
      result = CFSTR("MTLPixelFormatEAC_RGBA8_sRGB");
      break;
    case 180:
      result = CFSTR("MTLPixelFormatETC2_RGB8");
      break;
    case 181:
      result = CFSTR("MTLPixelFormatETC2_RGB8_sRGB");
      break;
    case 182:
      result = CFSTR("MTLPixelFormatETC2_RGB8A1");
      break;
    case 183:
      result = CFSTR("MTLPixelFormatETC2_RGB8A1_sRGB");
      break;
    case 186:
      result = CFSTR("MTLPixelFormatASTC_4x4_sRGB");
      break;
    case 187:
      result = CFSTR("MTLPixelFormatASTC_5x4_sRGB");
      break;
    case 188:
      result = CFSTR("MTLPixelFormatASTC_5x5_sRGB");
      break;
    case 189:
      result = CFSTR("MTLPixelFormatASTC_6x5_sRGB");
      break;
    case 190:
      result = CFSTR("MTLPixelFormatASTC_6x6_sRGB");
      break;
    case 192:
      result = CFSTR("MTLPixelFormatASTC_8x5_sRGB");
      break;
    case 193:
      result = CFSTR("MTLPixelFormatASTC_8x6_sRGB");
      break;
    case 194:
      result = CFSTR("MTLPixelFormatASTC_8x8_sRGB");
      break;
    case 195:
      result = CFSTR("MTLPixelFormatASTC_10x5_sRGB");
      break;
    case 196:
      result = CFSTR("MTLPixelFormatASTC_10x6_sRGB");
      break;
    case 197:
      result = CFSTR("MTLPixelFormatASTC_10x8_sRGB");
      break;
    case 198:
      result = CFSTR("MTLPixelFormatASTC_10x10_sRGB");
      break;
    case 199:
      result = CFSTR("MTLPixelFormatASTC_12x10_sRGB");
      break;
    case 200:
      result = CFSTR("MTLPixelFormatASTC_12x12_sRGB");
      break;
    case 204:
      result = CFSTR("MTLPixelFormatASTC_4x4_LDR");
      break;
    case 205:
      result = CFSTR("MTLPixelFormatASTC_5x4_LDR");
      break;
    case 206:
      result = CFSTR("MTLPixelFormatASTC_5x5_LDR");
      break;
    case 207:
      result = CFSTR("MTLPixelFormatASTC_6x5_LDR");
      break;
    case 208:
      result = CFSTR("MTLPixelFormatASTC_6x6_LDR");
      break;
    case 210:
      result = CFSTR("MTLPixelFormatASTC_8x5_LDR");
      break;
    case 211:
      result = CFSTR("MTLPixelFormatASTC_8x6_LDR");
      break;
    case 212:
      result = CFSTR("MTLPixelFormatASTC_8x8_LDR");
      break;
    case 213:
      result = CFSTR("MTLPixelFormatASTC_10x5_LDR");
      break;
    case 214:
      result = CFSTR("MTLPixelFormatASTC_10x6_LDR");
      break;
    case 215:
      result = CFSTR("MTLPixelFormatASTC_10x8_LDR");
      break;
    case 216:
      result = CFSTR("MTLPixelFormatASTC_10x10_LDR");
      break;
    case 217:
      result = CFSTR("MTLPixelFormatASTC_12x10_LDR");
      break;
    case 218:
      result = CFSTR("MTLPixelFormatASTC_12x12_LDR");
      break;
    case 222:
      result = CFSTR("MTLPixelFormatASTC_4x4_HDR");
      break;
    case 223:
      result = CFSTR("MTLPixelFormatASTC_5x4_HDR");
      break;
    case 224:
      result = CFSTR("MTLPixelFormatASTC_5x5_HDR");
      break;
    case 225:
      result = CFSTR("MTLPixelFormatASTC_6x5_HDR");
      break;
    case 226:
      result = CFSTR("MTLPixelFormatASTC_6x6_HDR");
      break;
    case 228:
      result = CFSTR("MTLPixelFormatASTC_8x5_HDR");
      break;
    case 229:
      result = CFSTR("MTLPixelFormatASTC_8x6_HDR");
      break;
    case 230:
      result = CFSTR("MTLPixelFormatASTC_8x8_HDR");
      break;
    case 231:
      result = CFSTR("MTLPixelFormatASTC_10x5_HDR");
      break;
    case 232:
      result = CFSTR("MTLPixelFormatASTC_10x6_HDR");
      break;
    case 233:
      result = CFSTR("MTLPixelFormatASTC_10x8_HDR");
      break;
    case 234:
      result = CFSTR("MTLPixelFormatASTC_10x10_HDR");
      break;
    case 235:
      result = CFSTR("MTLPixelFormatASTC_12x10_HDR");
      break;
    case 236:
      result = CFSTR("MTLPixelFormatASTC_12x12_HDR");
      break;
    case 240:
      result = CFSTR("MTLPixelFormatGBGR422");
      break;
    case 241:
      result = CFSTR("MTLPixelFormatBGRG422");
      break;
    case 250:
      result = CFSTR("MTLPixelFormatDepth16Unorm");
      break;
    case 252:
      result = CFSTR("MTLPixelFormatDepth32Float");
      break;
    case 253:
      result = CFSTR("MTLPixelFormatStencil8");
      break;
    case 260:
      result = CFSTR("MTLPixelFormatDepth32Float_Stencil8");
      break;
    case 261:
      result = CFSTR("MTLPixelFormatX32_Stencil8");
      break;
    default:
      switch(a1)
      {
        case 552:
          result = CFSTR("MTLPixelFormatBGRA10_XR");
          break;
        case 553:
          result = CFSTR("MTLPixelFormatBGRA10_XR_sRGB");
          break;
        case 554:
          result = CFSTR("MTLPixelFormatBGR10_XR");
          break;
        case 555:
          result = CFSTR("MTLPixelFormatBGR10_XR_sRGB");
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

BOOL _MTLPixeLFormatIsSingleComponent(unint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 > 0x37 || ((1 << a1) & 0x80000002002400) == 0)
    return a1 - 252 < 2;
  return result;
}

uint64_t SBUIMetalPixelFormatForCGImage(CGImage *a1, int *a2)
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
        goto LABEL_68;
      }
      if (BitsPerComponent == 32)
      {
        v19 = 0;
        v18 = 125;
        goto LABEL_68;
      }
      goto LABEL_66;
    }
LABEL_46:
    v18 = 0;
    v19 = 0;
    goto LABEL_67;
  }
  if (BitsPerComponent == 8)
  {
    switch(v15)
    {
      case 4uLL:
        if (v11)
          v18 = 80;
        else
          v18 = 70;
        if (v11 || v14)
        {
          v19 = 0;
        }
        else
        {
          if (v13)
            v19 = 2;
          else
            v19 = 0;
          if (v13)
            v18 = 80;
          else
            v18 = 0;
          if (v13 || !v12)
          {
            if (!v13)
              goto LABEL_67;
          }
          else
          {
            v19 = 1;
            v18 = 70;
          }
        }
        goto LABEL_68;
      case 2uLL:
        v19 = 8;
        v18 = 30;
        goto LABEL_68;
      case 1uLL:
        if (v8)
          v19 = 0;
        else
          v19 = 4;
        if (v8)
          v18 = 1;
        else
          v18 = 10;
        goto LABEL_68;
    }
    goto LABEL_46;
  }
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
        goto LABEL_68;
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
        goto LABEL_68;
      }
      goto LABEL_66;
    }
    v19 = v21 ^ 1;
  }
  if (v16)
LABEL_67:
    NSLog(CFSTR("No matching MTLPixelFormat for image:%@"), a1);
LABEL_68:
  if (a2)
    *a2 = v19;
  return v18;
}

BOOL SBLockOverlayStyleIsOpaque(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

void _SBUIApplyDisplayEdgeInfo(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = _SBUIApplyDisplayEdgeInfo_onceToken;
  v2 = a1;
  v4 = v2;
  if (v1 == -1)
  {
    v3 = v2;
  }
  else
  {
    dispatch_once(&_SBUIApplyDisplayEdgeInfo_onceToken, &__block_literal_global_30);
    v3 = v4;
  }
  objc_msgSend((id)_SBUIApplyDisplayEdgeInfo_displayEdgeInfo, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
  objc_msgSend(v4, "setCornerRadiusConfiguration:", _SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration);

}

void sub_1A477A210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SpringBoardHomeLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4C401D0;
    v3 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
    SpringBoardHomeLibrary_cold_1(&v1);
  return SpringBoardHomeLibraryCore_frameworkLibrary;
}

void _PowerChanged(int a1, int a2, uint64_t a3, intptr_t notificationID)
{
  id v5;

  if ((_DWORD)a3 == -536870288 || (_DWORD)a3 == -536870272)
  {
    IOAllowPowerChange(__SBUIBiometricEMRootDomainConnect, notificationID);
  }
  else if ((_DWORD)a3 == -536870112)
  {
    +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance", a3, notificationID);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_deviceWillWake");

  }
}

void sub_1A477C9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A477CD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A477CF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A477D0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
      && *((unsigned __int8 *)a1 + 1) == *((unsigned __int8 *)a2 + 1)
      && vabdd_f64(a1[1], a2[1]) < 2.22044605e-16
      && vabdd_f64(a1[3], a2[3]) < 2.22044605e-16
      && vabdd_f64(a1[4], a2[4]) < 2.22044605e-16
      && vabdd_f64(a1[6], a2[6]) < 2.22044605e-16
      && vabdd_f64(a1[7], a2[7]) < 2.22044605e-16
      && *((unsigned __int8 *)a1 + 64) == *((unsigned __int8 *)a2 + 64)
      && *((unsigned __int8 *)a1 + 65) == *((unsigned __int8 *)a2 + 65)
      && vabdd_f64(a1[5], a2[5]) < 2.22044605e-16
      && *((unsigned __int8 *)a1 + 66) == *((unsigned __int8 *)a2 + 66)
      && *((_QWORD *)a1 + 9) == *((_QWORD *)a2 + 9);
}

uint64_t SBUIProudLockContainerViewControllerConfigurationDefault@<X0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t result;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0x3FF3333333333333;
  *(_BYTE *)(a1 + 16) = 1;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)(a1 + 40) = xmmword_1A47AF750;
  *(_QWORD *)(a1 + 56) = 0x4008000000000000;
  v2 = 0;
  result = SBFEffectiveArtworkSubtype();
  if (result > 2795)
  {
    if (result != 2796 && result != 2868)
      goto LABEL_7;
  }
  else if (result != 2556 && result != 2622)
  {
LABEL_7:
    v2 = 1;
  }
  *(_BYTE *)(a1 + 64) = v2;
  *(_WORD *)(a1 + 65) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  return result;
}

uint64_t SBSUIWallpaperSetImageAsWallpaperForLocations(void *a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0DA9F78];
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v8 = a1;
  objc_msgSend(v3, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", 0, 1, 1, 0, 1.0, 1.0, v4, v5, v6, v7, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _SBSUIWallpaperSetImageWithoutCheckingMC(v8, v9, a2);

  return v10;
}

uint64_t _SBSUIWallpaperSetImageWithoutCheckingMC(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t v14[16];

  v5 = a1;
  v6 = a2;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    if (v9 <= 49)
    {
      SBLogWallpaper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(v6);

      SBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", v14, 2u);
      }

      __assert_rtn("_SBSUIWallpaperSetImageWithoutCheckingMC", "SBSUIWallpaperUtilities.m", 314, "0");
    }
  }
  else
  {

  }
  if (SBSUIWallpaperSetImageSurface(v5, v6, a3))
    v12 = 1;
  else
    v12 = SBSUIWallpaperSetImageArchive(v5, v6);

  return v12;
}

uint64_t SBSUIWallpaperSetImageArchive(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "setWallpaperStatus:", 1);
  v5 = SBSUIWallpaperSetImageArchiveWithWallpaperMode(v4, v3);

  return v5;
}

uint64_t SBSUIWallpaperSetImageArchiveWithWallpaperMode(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BYTE v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "bs_secureEncoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    objc_msgSend(v3, "cropRect");
    bzero(v12, 0x400uLL);
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getCString:maxLength:encoding:", v12, 1024, 4);

    objc_msgSend(v3, "wallpaperKitData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    SBSSpringBoardServerPort();
    objc_msgSend(v3, "parallaxFactor");
    objc_msgSend(v3, "zoomScale");
    objc_msgSend(v3, "supportsCropping");
    objc_msgSend(v3, "isPortrait");
    objc_msgSend(v3, "hasVideo");
    objc_msgSend(v3, "stillTimeInVideo");
    objc_msgSend(v3, "wallpaperMode");
    objc_msgSend(v3, "wallpaperStatus");
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    SBSetWallpaperImageForLocations();

  }
  return 0;
}

uint64_t SBSUIWallpaperSetImagesArchive(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  SBLogWallpaper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v3, "count");
    PBUIStringForWallpaperLocations();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240962;
    v30 = v6;
    v31 = 2114;
    v32 = v4;
    v33 = 2114;
    v34 = v7;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Setting %{public}d archive images with options: %{public}@ for variant: %{public}@ with current wallpaper mode: %{public}@", buf, 0x26u);

  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    PBUIStringForWallpaperMode();
    v9 = objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWallpaperStatus:", 2);
    v13 = SBSUIWallpaperSetImageArchiveWithWallpaperMode(v11, v12);
    objc_msgSend(v3, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWallpaperStatus:", 3);
    objc_msgSend(v14, "bs_secureEncoded");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v26 = v4;
      v18 = objc_retainAutorelease(v16);
      objc_msgSend(v18, "bytes");
      objc_msgSend(v18, "length");
      objc_msgSend(v15, "cropRect");
      bzero(buf, 0x400uLL);
      objc_msgSend(v15, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getCString:maxLength:encoding:", buf, 1024, 4);

      objc_msgSend(v15, "wallpaperKitData");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v20;
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v20, 200, 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      SBSSpringBoardServerPort();
      objc_msgSend(v15, "parallaxFactor");
      objc_msgSend(v15, "zoomScale");
      objc_msgSend(v15, "supportsCropping");
      objc_msgSend(v15, "isPortrait");
      objc_msgSend(v15, "hasVideo");
      objc_msgSend(v15, "stillTimeInVideo");
      objc_msgSend(v15, "wallpaperMode");
      objc_msgSend(v15, "wallpaperStatus");
      v23 = objc_retainAutorelease(v21);
      objc_msgSend(v23, "bytes");
      objc_msgSend(v23, "length");
      SBSetWallpaperImageForLocations();

      v4 = v26;
      v13 = v13;
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWallpaperMode:", 0);
    objc_msgSend(v14, "setWallpaperStatus:", 1);
    v13 = SBSUIWallpaperSetImageArchive(v12, v14);
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

BOOL SBSUIWallpaperSetImageSurface(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _BOOL8 v7;

  v5 = a2;
  v6 = a1;
  objc_msgSend(v5, "setWallpaperStatus:", 1);
  v7 = SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v6, v5, a3, 0);

  return v7;
}

BOOL SBSUIWallpaperSetImageSurfaceWithWallpaperMode(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  NSObject *v8;
  __IOSurface *v9;
  __IOSurface *v10;
  xpc_object_t XPCObject;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  __IOSurface *v26;
  __IOSurface *v27;
  void *v28;
  void *v29;
  UIImage *v30;
  __IOSurface *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  void *v48;
  __IOSurface *v49;
  __IOSurface *v50;
  void *v51;
  void *v52;
  UIImage *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  UIImage *v65;
  void *v66;
  void *v67;
  void *v68;
  UIImage *v69;
  void *v70;
  __IOSurface *v71;
  xpc_object_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  SBLogWallpaper();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    v80 = v7;
    v81 = 2048;
    v82 = a4;
    _os_signpost_emit_with_name_impl(&dword_1A471F000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
  }

  if (_os_feature_enabled_impl())
  {
    SBFCreateIOSurfaceForImage();
    v9 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v77 = a4;
      XPCObject = IOSurfaceCreateXPCObject(v9);
      v12 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      objc_msgSend(v12, "sbf_imageWithIOSurface:scale:orientation:", v10, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      v22 = v21;
      v23 = PBUICurrentParallaxDeviceType();
      objc_msgSend(v14, "scale");
      objc_msgSend(v7, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v23, v17, v19, v22, v24);

      objc_msgSend(v7, "cropRect");
      v75 = v14;
      objc_msgSend(v14, "sbf_cropImageWithRect:outputSize:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SBFCreateIOSurfaceForImage();
      v26 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        v72 = IOSurfaceCreateXPCObject(v26);
        v66 = v25;
        objc_msgSend(v25, "pbui_CGImageBackedImage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA638], "pbui_thumbnailImageForImage:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pbui_CGImageBackedImage");
        v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

        v69 = v30;
        if (v30)
        {
          UIImageJPEGRepresentation(v30, 0.8);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = 0;
        }
        v70 = v28;
        v74 = v6;
        objc_msgSend(v28, "sbf_imageHashData");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWallpaper();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v80 = v7;
          _os_log_impl(&dword_1A471F000, v56, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
        }

        PBUIStringForWallpaperLocations();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        PBUIStringForWallpaperMode();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = +[SBSUIWallpaperService setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forLocations:currentWallpaperMode:](SBSUIWallpaperService, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forLocations:currentWallpaperMode:", XPCObject, v72, v67, v55, v7, v57, v58);

        a4 = v77;
        v6 = v74;
        v25 = v66;
      }
      else
      {
        v34 = 0;
        a4 = v77;
      }

    }
    else
    {
      v34 = 0;
    }
    SBLogWallpaper();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v59))
    {
      *(_DWORD *)buf = 138543618;
      v80 = v7;
      v81 = 2048;
      v82 = a4;
      _os_signpost_emit_with_name_impl(&dword_1A471F000, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
    }

  }
  else
  {
    v78 = a4;
    SBFCreateIOSurfaceForImage();
    v31 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v7, "cropRect");
      bzero(buf, 0x400uLL);
      objc_msgSend(v7, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "getCString:maxLength:encoding:", buf, 1024, 4);

      objc_msgSend(v7, "wallpaperKitData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v33, 200, 0, 0);
        v76 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v76 = 0;
      }
      IOSurfaceCreateMachPort(v31);
      v35 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scale");
      objc_msgSend(v35, "sbf_imageWithIOSurface:scale:orientation:", v31, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bounds");
      v40 = v39;
      v42 = v41;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "scale");
      v45 = v44;
      v46 = PBUICurrentParallaxDeviceType();
      objc_msgSend(v37, "scale");
      objc_msgSend(v7, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v46, v40, v42, v45, v47);

      objc_msgSend(v7, "cropRect");
      v73 = v37;
      objc_msgSend(v37, "sbf_cropImageWithRect:outputSize:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      SBFCreateIOSurfaceForImage();
      v49 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v49)
      {
        IOSurfaceCreateMachPort(v49);
        v68 = v48;
        objc_msgSend(v48, "pbui_CGImageBackedImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA638], "pbui_thumbnailImageForImage:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "pbui_CGImageBackedImage");
        v53 = (UIImage *)objc_claimAutoreleasedReturnValue();

        v71 = v31;
        v65 = v53;
        if (v53)
        {
          UIImageJPEGRepresentation(v53, 0.8);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
        }
        v60 = objc_retainAutorelease(v54);
        objc_msgSend(v60, "bytes");
        objc_msgSend(v60, "length");
        objc_msgSend(v51, "sbf_imageHashData");
        v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v61, "bytes");
        objc_msgSend(v61, "length");
        SBSSpringBoardServerPort();
        objc_msgSend(v7, "parallaxFactor");
        objc_msgSend(v7, "zoomScale");
        objc_msgSend(v7, "supportsCropping");
        objc_msgSend(v7, "isPortrait");
        objc_msgSend(v7, "hasVideo");
        objc_msgSend(v7, "stillTimeInVideo");
        objc_msgSend(v7, "wallpaperMode");
        objc_msgSend(v7, "wallpaperStatus");
        v62 = objc_retainAutorelease(v76);
        objc_msgSend(v62, "bytes");
        objc_msgSend(v62, "length");
        SBSetWallpaperImageSurfaceForLocations();
        BSMachSendRightRelease();

        v31 = v71;
        v48 = v68;
      }
      BSMachSendRightRelease();

    }
    SBLogWallpaper();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v63))
    {
      *(_DWORD *)buf = 138543618;
      v80 = v7;
      v81 = 2048;
      v82 = v78;
      _os_signpost_emit_with_name_impl(&dword_1A471F000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
    }

    v34 = 0;
  }

  return v34;
}

BOOL SBSUIWallpaperSetImagesSurface(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  SBLogWallpaper();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "count");
    PBUIStringForWallpaperLocations();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240962;
    v27 = v10;
    v28 = 2114;
    v29 = v8;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_DEFAULT, "Setting %{public}d surface images with options: %{public}@ for variant: %{public}@ with current wallpaper mode: %{public}@", buf, 0x26u);

  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if (objc_msgSend(v7, "count") != 1)
    {
      v17 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "allKeys");
    v21 = v8;
    v22 = a3;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    objc_msgSend(v21, "objectForKeyedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWallpaperMode:", 0);
    objc_msgSend(v18, "setWallpaperStatus:", 1);
    v17 = SBSUIWallpaperSetImageSurface(v16, v18, v22);
  }
  else
  {
    PBUIStringForWallpaperMode();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWallpaperStatus:", 2);
    v17 = SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v15, v16, a3, a4);
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v19 = a3;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWallpaperStatus:", 3);
    SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v18, v20, v19, a4);

  }
  v8 = v25;
LABEL_9:

  return v17;
}

uint64_t _SBSUIWallpaperSetImagesWithoutCheckingMC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v18;
  NSObject *v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = a2;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length") && (int)objc_msgSend(v15, "intValue") <= 49)
        {
          SBLogWallpaper();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            _SBSUIWallpaperSetImagesWithoutCheckingMC_cold_1((uint64_t)v15, v13, v18);

          SBLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_1A471F000, v19, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", v20, 2u);
          }

          __assert_rtn("_SBSUIWallpaperSetImagesWithoutCheckingMC", "SBSUIWallpaperUtilities.m", 333, "0");
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (SBSUIWallpaperSetImagesSurface(v7, v8, a3, a4))
    v16 = 1;
  else
    v16 = SBSUIWallpaperSetImagesArchive(v7, v8);

  return v16;
}

uint64_t SBSUIWallpaperSetImage(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;

  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWallpaperModificationAllowed");

  if (v8)
    v9 = _SBSUIWallpaperSetImageWithoutCheckingMC(v5, v6, a3);
  else
    v9 = 0;

  return v9;
}

uint64_t SBSUIWallpaperSetImages(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;

  v7 = a1;
  v8 = a2;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWallpaperModificationAllowed");

  if (v10)
    v11 = _SBSUIWallpaperSetImagesWithoutCheckingMC(v7, v8, a3, a4);
  else
    v11 = 0;

  return v11;
}

uint64_t SBSUIWallpaperSetImagesAndVideos(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  int v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  char v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v61;
  char v62;
  uint64_t v63;
  int v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = v11;
  v14 = (void *)os_transaction_create();
  if (a5 == 1)
    v15 = 2;
  else
    v15 = 1;
  PBUIStringForWallpaperMode();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperMode();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWallpaperStatus:", 2);
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setWallpaperStatus:", 3);
  v19 = objc_msgSend(v10, "count");
  if ((v12 & 1) == 0 || v19 < 2)
  {
    v45 = objc_msgSend(v10, "count");
    if ((v12 & 1) == 0 || v45 != 1)
    {
      if ((v12 & 1) == 0)
      {
LABEL_20:
        v63 = SBSUIWallpaperSetImages(v9, v13, v12, a5);
        goto LABEL_22;
      }
LABEL_18:
      if (!objc_msgSend(v10, "count"))
        SBSUIWallpaperClearVideo();
      goto LABEL_20;
    }
    v70 = v14;
    SBSUIWallpaperClearVideo();
    objc_msgSend(v9, "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_21;
    objc_msgSend(v18, "cropRect");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    objc_msgSend(v20, "size");
    v55 = 1.0 / v54;
    objc_msgSend(v20, "size");
    CGAffineTransformMakeScale(&v72, v55, 1.0 / v56);
    v76.origin.x = v47;
    v76.origin.y = v49;
    v76.size.width = v51;
    v76.size.height = v53;
    v77 = CGRectApplyAffineTransform(v76, &v72);
    x = v77.origin.x;
    y = v77.origin.y;
    width = v77.size.width;
    height = v77.size.height;
    objc_msgSend(v10, "objectForKeyedSubscript:", v16);
    v68 = v12;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = SBSUIWallpaperSetVideoWithWallpaperMode(v61, objc_msgSend(v18, "supportsCropping"), 0, x, y, width, height);

    v12 = v68;
    if ((v62 & 1) == 0)
    {
LABEL_21:

      v63 = 0;
      v14 = v70;
      goto LABEL_22;
    }
LABEL_15:

    v14 = v70;
    goto LABEL_18;
  }
  v67 = v12;
  v70 = v14;
  objc_msgSend(v9, "objectForKeyedSubscript:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (v21)
    {
      v66 = v21;
      objc_msgSend(v18, "cropRect");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v20, "size");
      v31 = 1.0 / v30;
      objc_msgSend(v20, "size");
      CGAffineTransformMakeScale(&v73, v31, 1.0 / v32);
      v74.origin.x = v23;
      v74.origin.y = v25;
      v74.size.width = v27;
      v74.size.height = v29;
      v75 = CGRectApplyAffineTransform(v74, &v73);
      v33 = v75.origin.x;
      v34 = v75.origin.y;
      v35 = v75.size.width;
      v36 = v75.size.height;
      objc_msgSend(v10, "objectForKeyedSubscript:", v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = SBSUIWallpaperSetVideoWithWallpaperMode(v37, objc_msgSend(v18, "supportsCropping"), a5, v33, v34, v35, v36);

      v21 = v66;
      if (v38)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v71, "supportsCropping");
        objc_msgSend(v71, "cropRect");
        v44 = SBSUIWallpaperSetVideoWithWallpaperMode(v39, v65, v15, v40, v41, v42, v43);

        v21 = v66;
        if ((v44 & 1) != 0)
        {

          v12 = v67;
          v9 = v69;
          goto LABEL_15;
        }
      }
    }
  }

  v63 = 0;
  v9 = v69;
  v14 = v70;
LABEL_22:

  return v63;
}

uint64_t SBSUIWallpaperSetVideoWithWallpaperMode(void *a1, int a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char *v23;
  void *v24;
  CGRect v26;

  v13 = a1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isWallpaperModificationAllowed");

  if (v15)
  {
    if (_os_feature_enabled_impl())
    {
      if (a2)
      {
        v26.origin.x = a4;
        v26.origin.y = a5;
        v26.size.width = a6;
        v26.size.height = a7;
        NSStringFromCGRect(v26);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v13, "URL");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "fileSystemRepresentation");
      v23 = (char *)sandbox_extension_issue_file();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, strlen(v23));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v23);
      objc_msgSend(v13, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIStringForWallpaperMode();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[SBSUIWallpaperService setWallpaperWithVideo:sandboxToken:cropRect:wallpaperMode:](SBSUIWallpaperService, "setWallpaperWithVideo:sandboxToken:cropRect:wallpaperMode:", v21, v20, v16, v24);

    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0DAB078]);
      objc_msgSend(v13, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a2 & 1) == 0)
      {
        a4 = *MEMORY[0x1E0C9D628];
        a5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        a6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        a7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
      v17 = objc_msgSend(v16, "setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:", v19, a3, a4, a5, a6, a7);

      objc_msgSend(v16, "invalidate");
      if ((v17 & 1) != 0)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SBSUIWallpaperSetVideoWithWallpaperMode(AVURLAsset *__strong, BOOL, CGRect, SBFWallpaperMode)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SBSUIWallpaperUtilities.m"), 453, CFSTR("The iris wallpaper asset failed to be exported."));
    }

LABEL_13:
    goto LABEL_14;
  }
  v17 = 0;
LABEL_14:

  return v17;
}

uint64_t SBSUIWallpaperClearVideo()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isWallpaperModificationAllowed");

  if ((_DWORD)v1)
  {
    if (_os_feature_enabled_impl())
    {
      +[SBSUIWallpaperService removeWallpaperVideo](SBSUIWallpaperService, "removeWallpaperVideo");
    }
    else
    {
      v4 = 0;
      v2 = SBSSpringBoardServerPort();
      MEMORY[0x1A85A1024](v2, &v4);
      if (!v4)
        SBSUIWallpaperClearVideo_cold_1();
    }
  }
  return v1;
}

uint64_t SBSUIWallpaperSetVideo(void *a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  return SBSUIWallpaperSetVideoWithWallpaperMode(a1, a2, 0, a3, a4, a5, a6);
}

uint64_t SBSUIWallpaperSetColorName(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWallpaperModificationAllowed");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DAB078]);
    v7 = objc_msgSend(v6, "setWallpaperColorName:forVariants:", v3, a2);
    objc_msgSend(v6, "invalidate");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t SBSUIWallpaperSetColor(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWallpaperModificationAllowed");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolvedColorWithTraitCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolvedColorWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqual:", v9))
    {

      v9 = 0;
    }
    if (_os_feature_enabled_impl())
    {
      PBUIStringForWallpaperLocations();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = +[SBSUIWallpaperService setWallpaperColor:darkColor:forLocations:](SBSUIWallpaperService, "setWallpaperColor:darkColor:forLocations:", v7, v9, v10);
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DAB078]);
      v11 = objc_msgSend(v10, "setWallpaperColor:darkColor:forVariants:", v7, v9, a2);
      objc_msgSend(v10, "invalidate");
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t SBSUIWallpaperSetGradient(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWallpaperModificationAllowed");

  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      PBUIStringForWallpaperLocations();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = +[SBSUIWallpaperService setWallpaperGradient:forLocations:](SBSUIWallpaperService, "setWallpaperGradient:forLocations:", v3, v6);
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DAB078]);
      v7 = objc_msgSend(v6, "setWallpaperGradient:forVariants:", v3, a2);
      objc_msgSend(v6, "invalidate");
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t SBSUIWallpaperRestoreDefault()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isWallpaperModificationAllowed");

  if ((_DWORD)v1)
  {
    if (_os_feature_enabled_impl())
    {
      +[SBSUIWallpaperService restoreDefaultWallpaper](SBSUIWallpaperService, "restoreDefaultWallpaper");
    }
    else
    {
      v2 = objc_alloc_init(MEMORY[0x1E0DAB078]);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __SBSUIWallpaperRestoreDefault_block_invoke;
      v5[3] = &unk_1E4C3E408;
      v6 = v2;
      v3 = v2;
      objc_msgSend(v3, "restoreDefaultWallpaperWithCompletion:", v5);

    }
  }
  return v1;
}

uint64_t SBSUITriggerPosterSignificantEvent()
{
  id v0;
  id v1;
  _QWORD v3[4];
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0DAB078]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __SBSUITriggerPosterSignificantEvent_block_invoke;
  v3[3] = &unk_1E4C3E408;
  v4 = v0;
  v1 = v0;
  objc_msgSend(v1, "triggerPosterSignificantEventWithCompletion:", v3);

  return 1;
}

id SBSUIWallpaperGetCurrentHomeScreenImage(double a1)
{
  return SBSUIWallpaperGetPreviewWithImageUsingData(1u, 0, 0, a1);
}

id SBSUIWallpaperGetPreviewWithImageUsingData(unsigned __int8 a1, uint64_t a2, void *a3, double a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int *v14;
  unsigned int v16;
  uint64_t v17;

  v17 = 0;
  v16 = 0;
  objc_msgSend(a3, "bs_secureEncoded");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = SBSSpringBoardServerPort();
  v11 = MEMORY[0x1A85A10CC](v10, a1, a2, v8, v9, &v17, &v16, a4);
  v12 = 0;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "bs_secureDecodedFromData:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (v17)
    MEMORY[0x1A85A196C](*MEMORY[0x1E0C83DA0], v17, v16);
  if (v8)
    MEMORY[0x1A85A196C](*v14, v8, v9);

  return v12;
}

id SBSUIWallpaperGetHomeScreenPreviewWithImage(void *a1, double a2)
{
  return SBSUIWallpaperGetPreviewWithImage(1u, 0, a1, a2);
}

id SBSUIWallpaperGetPreviewWithImage(unsigned __int8 a1, uint64_t a2, void *a3, double a4)
{
  id v7;
  __IOSurface *v8;
  uint64_t MachPort;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int *v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unsigned int v21;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  MEMORY[0x1A85A1378]();
  v22 = 0;
  SBFCreateIOSurfaceForImage();
  v8 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  MachPort = IOSurfaceCreateMachPort(v8);
  v21 = 0;
  v10 = SBSSpringBoardServerPort();
  v11 = 0;
  if (!MEMORY[0x1A85A10D8](v10, a1, a2, MachPort, &v21, a4))
  {
    v12 = objc_alloc(MEMORY[0x1E0CBBEA0]);
    v13 = (void *)objc_msgSend(v12, "initWithMachPort:", v21);
    v14 = (int *)MEMORY[0x1E0C83DA0];
    if (IOSurfaceSetOwnership())
    {
      SBLogWallpaper();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v14;
        *(_DWORD *)buf = 67109120;
        v24 = v16;
        _os_log_impl(&dword_1A471F000, v15, OS_LOG_TYPE_DEFAULT, "Failed to assign surface ownership to task %d", buf, 8u);
      }

    }
    v17 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    objc_msgSend(v17, "sbf_imageWithIOSurface:scale:orientation:", v13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  BSMachSendRightRelease();
  BSMachSendRightRelease();
  if (v22)
    CGImageBlockSetRelease();
  if (!v11)
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v19, OS_LOG_TYPE_INFO, "Wallpaper preview failed to be sent by ioSurface.", buf, 2u);
    }

    SBSUIWallpaperGetPreviewWithImageUsingData(a1, a2, v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id SBSUIWallpaperGetCurrentLockScreenImage(double a1)
{
  return SBSUIWallpaperGetPreviewWithImageUsingData(0, 0, 0, a1);
}

id SBSUIWallpaperGetLockScreenPreviewWithImage(void *a1, double a2)
{
  return SBSUIWallpaperGetPreviewWithImage(0, 0, a1, a2);
}

id SBSUIWallpaperGetHomeScreenOverlayWithLightForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(1u, 2560, a1);
}

id SBSUIWallpaperGetOverlay(unsigned __int8 a1, uint64_t a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 1.0, 1.0);
  objc_msgSend(v6, "imageWithActions:", &__block_literal_global_34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSUIWallpaperGetPreviewWithImage(a1, a2, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id SBSUIWallpaperGetHomeScreenOverlayWithDarkForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(1u, 1536, a1);
}

id SBSUIWallpaperGetLockScreenOverlayWithLightForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(0, 2048, a1);
}

id SBSUIWallpaperGetLockScreenOverlayWithDarkForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(0, 1024, a1);
}

id SBSUIWallpaperGetPreview(unsigned __int8 a1, uint64_t a2, double a3)
{
  return SBSUIWallpaperGetPreviewWithImage(a1, a2, 0, a3);
}

id SBSUIWallpaperGetOptions()
{
  void *v0;
  uint64_t v1;
  void *v2;
  int v4;
  uint64_t v5;
  double v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;

  if (_os_feature_enabled_impl())
  {
    PBUIStringForWallpaperVariant();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSUIWallpaperService getWallpaperOptionsForVariant:](SBSUIWallpaperService, "getWallpaperOptionsForVariant:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 1.0;
    v13 = 1.0;
    v10 = 0;
    v11 = 0;
    v9 = 1;
    v8 = 1;
    v7 = 0;
    v6 = 0.0;
    v5 = 0;
    v4 = 0;
    SBSSpringBoardServerPort();
    SBGetWallpaperOptions();
    v0 = 0;
    MEMORY[0x1A85A196C](*MEMORY[0x1E0C83DA0]);
    objc_msgSend(MEMORY[0x1E0DA9F78], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperKitData:", 0, v9 != 0, v8 != 0, v7 != 0, 0, v13, v12, *((float *)&v11 + 1), *(float *)&v11, *((float *)&v10 + 1), *(float *)&v10, v6);
    v1 = objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)v1;

  return v2;
}

id SBSUIWallpaperGetLegibilitySettings(unsigned __int8 a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  if (_os_feature_enabled_impl())
  {
    PBUIStringForWallpaperVariant();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSUIWallpaperService getWallpaperLegibilitySettingsForVariant:](SBSUIWallpaperService, "getWallpaperLegibilitySettingsForVariant:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v5 = SBSSpringBoardServerPort();
    v6 = MEMORY[0x1A85A10B4](v5, a1, &v14, &v13);
    if (v14)
    {
      if (v6)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v13, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3710];
        objc_opt_self();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v8, &v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          SBLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            SBSUIWallpaperGetLegibilitySettings_cold_1(v11);

        }
      }
      MEMORY[0x1A85A196C](*MEMORY[0x1E0C83DA0]);
      return v7;
    }
    else
    {
      return 0;
    }
  }
}

void SBSUIMagicWallpaperSetWithOptions(void *a1, unsigned __int8 a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a1;
  v7 = _os_feature_enabled_impl();
  v8 = *MEMORY[0x1E0D653A8];
  if (!v7)
  {
    v13 = (void *)objc_msgSend(v6, "objectForKey:", v8);
    v14 = (void *)PBUIMagicWallpaperOptionsDictionary();

    if (v13)
    {
      v15 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      if (!v14)
      {
LABEL_8:
        v16 = SBSSpringBoardServerPort();
        v17 = objc_retainAutorelease(v14);
        MEMORY[0x1A85A11C8](v16, v15, a2, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));

        return;
      }
    }
    else
    {
      v15 = "com.apple.springboard.unset-procedural-wallpaper";
      if (!v14)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIMagicWallpaperOptionsDictionary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PBUIStringForWallpaperLocations();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSUIWallpaperService setProceduralWallpaperIdentifier:options:locations:](SBSUIWallpaperService, "setProceduralWallpaperIdentifier:options:locations:", v9, v10, v11);

  SBLogWallpaper();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_DEFAULT, "SETTING PROCEDURAL WALLPAPER %{public}@: %{public}@", buf, 0x16u);
  }

}

BOOL SBSUIWallpaperSetVariant(unsigned __int8 a1)
{
  uint64_t v2;
  char v4;

  v4 = 0;
  v2 = SBSSpringBoardServerPort();
  MEMORY[0x1A85A11F8](v2, a1, &v4);
  return v4 != 0;
}

BOOL SBSUIWallpaperSetOptionsForLocations(void *a1, unsigned __int8 a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  float v20;
  double v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  _BOOL8 v27;
  char v29;
  uint8_t buf[1032];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v29 = 0;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    if (v6 <= 49)
    {
      SBLogWallpaper();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(v3);

      SBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", buf, 2u);
      }

      __assert_rtn("SBSUIWallpaperSetOptionsForLocations", "SBSUIWallpaperUtilities.m", 796, "0");
    }
  }
  else
  {

  }
  objc_msgSend(v3, "cropRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  bzero(buf, 0x400uLL);
  objc_msgSend(v3, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getCString:maxLength:encoding:", buf, 1024, 4);

  v18 = SBSSpringBoardServerPort();
  objc_msgSend(v3, "parallaxFactor");
  v20 = v19;
  objc_msgSend(v3, "zoomScale");
  v22 = v21;
  v23 = objc_msgSend(v3, "supportsCropping");
  v24 = objc_msgSend(v3, "isPortrait");
  v25 = objc_msgSend(v3, "hasVideo");
  objc_msgSend(v3, "stillTimeInVideo");
  *(float *)&v10 = v10;
  *(float *)&v12 = v12;
  *(float *)&v14 = v14;
  *(float *)&v16 = v16;
  MEMORY[0x1A85A11EC](v18, v23, v24, v25, buf, a2, &v29, v20, v22, *(float *)&v10, *(float *)&v12, *(float *)&v14, *(float *)&v16, v26);
  v27 = v29 != 0;

  return v27;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A4785D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A478B664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A478B850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SBSUIStarkNotificationsSuspensionReasonsDescription(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;
  __CFString *v3;

  if (!a1)
  {
    v3 = CFSTR("none");
    return v3;
  }
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) == 0)
      goto LABEL_4;
LABEL_10:
    -[__CFString appendString:](v3, "appendString:", CFSTR(" other"));
    v1 &= ~2uLL;
    if (!v1)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[__CFString appendString:](v2, "appendString:", CFSTR(" assistant"));
  v1 &= ~1uLL;
  if ((v1 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if (v1)
LABEL_5:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" %li"), v1);
LABEL_6:
  -[__CFString appendString:](v3, "appendString:", CFSTR(")"));
  return v3;
}

id SBSUIStarkNotificationsSceneSettingValueDescription(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  switch(a1)
  {
    case 2998744415:
    case 2998744418:
      BSSettingFlagDescription();
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2998744416:
      v8 = objc_opt_class();
      v9 = v5;
      if (v8)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;

      v12 = objc_msgSend(v11, "unsignedIntegerValue");
      SBSUIStarkNotificationsSuspensionReasonsDescription(v12);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2998744417:
      objc_msgSend(v4, "description");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

void sub_1A478D808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _CentroidOfTouches(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v2)
    goto LABEL_10;
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v18;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v1);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", 0);
      objc_msgSend(v10, "_convertPointToSceneReferenceSpace:");
      v12 = v11;
      v14 = v13;

      v6 = v6 + v12;
      v7 = v7 + v14;
    }
    v4 += v3;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v3);
  if (v4)
    v15 = v6 / (double)v4;
  else
LABEL_10:
    v15 = *MEMORY[0x1E0C9D538];

  return v15;
}

uint64_t SBSUIHardwareButtonHintViewsSupported()
{
  if (SBSUIHardwareButtonHintViewsSupported_onceToken != -1)
    dispatch_once(&SBSUIHardwareButtonHintViewsSupported_onceToken, &__block_literal_global_37);
  return SBSUIHardwareButtonHintViewsSupported_hintViewsSupported;
}

void SBSUIHardwareButtonGetHintViewsSupportedAsync(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  dispatch_get_global_queue(33, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SBSUIHardwareButtonGetHintViewsSupportedAsync_block_invoke;
  block[3] = &unk_1E4C3E4C0;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

id SBSUIRegisterHardwareButtonHintView(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t RenderId;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0DAAE70]);
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogHardwareButtonService();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      SBSUIRegisterHardwareButtonHintView_cold_1((uint64_t)v3, v7, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  CALayerGetContext();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    SBLogHardwareButtonService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      SBSUIRegisterHardwareButtonHintView_cold_2((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v8 = -[NSObject contextId](v6, "contextId");
  RenderId = CALayerGetRenderId();
  objc_msgSend(v5, "size");
  objc_msgSend(v4, "registerAssociatedHintViewContextId:layerRenderId:layerSize:forButtonKind:", v8, RenderId, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");
LABEL_10:

  return v10;
}

void SBSUIRegisterHardwareButtonHintViewAsync(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a1;
  v6 = a3;
  dispatch_get_global_queue(33, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SBSUIRegisterHardwareButtonHintViewAsync_block_invoke;
  block[3] = &unk_1E4C3FB28;
  v12 = v6;
  v13 = a2;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void SBSUIRequestHardwareButtonSystemGlowEffectWithInitialStyle(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0DAAE70]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SBSUIRequestHardwareButtonSystemGlowEffectWithInitialStyle_block_invoke;
  v7[3] = &unk_1E4C407F0;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "requestSystemGlowEffectWithInitialStyle:completion:", a1, v7);

}

double SBUIFloatFloorForMainScreenScale(double a1)
{
  return SBUIFloatFloorForScale(a1, 0.0);
}

double SBUIFloatFloorForScale(double a1, double a2)
{
  double v2;
  void *v4;
  double v5;

  v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v2 = v5;

  }
  return floor(v2 * a1) / v2;
}

double SBUIScaledFontSizeWithMaxSizeCategory(void *a1, double a2)
{
  NSString *v3;
  NSString *v4;
  NSComparisonResult v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v3 = a1;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = UIContentSizeCategoryCompareToCategory(v4, v3);

  v6 = (void *)MEMORY[0x1E0CEA5E8];
  v7 = *MEMORY[0x1E0CEB538];
  if (v5 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_scaledValueForValue:", a2);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v12 = v11;

  return v12;
}

const __CFString *SBUISystemApertureLayoutModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5)
    return CFSTR("invalid mode");
  else
    return off_1E4C40930[a1 + 1];
}

const __CFString *SBUISystemApertureContentRoleDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("invalid role");
  else
    return off_1E4C40960[a1];
}

const __CFString *SBUISystemApertureCustomLayoutDescription(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("invalid layout");
  else
    return off_1E4C40978[a1];
}

__CFString *SBUISystemAperturePresentationBehaviorsDescription(uint64_t a1)
{
  _QWORD *v2;
  uint8x8_t v3;
  int v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  char v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __SBUISystemAperturePresentationBehaviorsDescription_block_invoke;
  v11 = &unk_1E4C40890;
  v12 = &v13;
  v2 = v9;
  if (a1)
  {
    v19 = 0;
    v3 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v3.i16[0] = vaddlv_u8(v3);
    v4 = v3.i32[0];
    if (v3.i32[0])
    {
      v5 = 0;
      do
      {
        if (((1 << v5) & a1) != 0)
        {
          ((void (*)(_QWORD *))v10)(v2);
          if (v19)
            break;
          --v4;
        }
        if (v5 > 0x3E)
          break;
        ++v5;
      }
      while (v4 > 0);
    }
  }

  v6 = (__CFString *)v14[5];
  if (!v6)
    v6 = CFSTR("default");
  v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1A47918D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4792600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBSUIInCallSceneClientSettingValueDescription_0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CGRect v8;

  v3 = a2;
  v4 = v3;
  switch(a1)
  {
    case 3001:
      objc_msgSend(v3, "integerValue");
      SBSInCallPresentationModeDescription();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3002:
    case 3004:
    case 3005:
    case 3006:
      objc_msgSend(v3, "BOOLValue");
      BSSettingFlagForBool();
      BSSettingFlagDescription();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3003:
      objc_msgSend(v3, "CGRectValue");
      NSStringFromCGRect(v8);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3007:
      objc_msgSend(v3, "UUIDString");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

uint64_t SystemStatusLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SystemStatusLibraryCore_frameworkLibrary;
  v6 = SystemStatusLibraryCore_frameworkLibrary;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E4C40C10;
    v8 = *(_OWORD *)&off_1E4C40C20;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SystemStatusLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A4798060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = SystemStatusLibraryCore();
  if (!result)
    SystemStatusLibrary_cold_1(&v1);
  return result;
}

void *getSTBackgroundActivityIdentifiersDescriptionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  v6 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusLibrary();
    v0 = dlsym(v1, "STBackgroundActivityIdentifiersDescription");
    v4[3] = (uint64_t)v0;
    getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A4798140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STBackgroundActivityIdentifiersDescription(uint64_t a1)
{
  uint64_t (*STBackgroundActivityIdentifiersDescriptionSymbolLoc)(uint64_t);

  STBackgroundActivityIdentifiersDescriptionSymbolLoc = (uint64_t (*)(uint64_t))getSTBackgroundActivityIdentifiersDescriptionSymbolLoc();
  if (!STBackgroundActivityIdentifiersDescriptionSymbolLoc)
    soft_STBackgroundActivityIdentifiersDescription_cold_1();
  return STBackgroundActivityIdentifiersDescriptionSymbolLoc(a1);
}

uint64_t SystemStatusUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SystemStatusUILibraryCore_frameworkLibrary;
  v6 = SystemStatusUILibraryCore_frameworkLibrary;
  if (!SystemStatusUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E4C40C30;
    v8 = *(_OWORD *)&off_1E4C40C40;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SystemStatusUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A4798238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusUILibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = SystemStatusUILibraryCore();
  if (!result)
    SystemStatusUILibrary_cold_1(&v1);
  return result;
}

void *getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  v6 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  if (!getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusUILibrary();
    v0 = dlsym(v1, "STUIBackgroundActivityIdentifiersForStyleOverrides");
    v4[3] = (uint64_t)v0;
    getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A4798318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  uint64_t (*STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc)(uint64_t);

  STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc = (uint64_t (*)(uint64_t))getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc();
  if (!STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc)
    soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1();
  return STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc(a1);
}

void *getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  v6 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  if (!getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr)
  {
    v1 = (void *)SystemStatusUILibrary();
    v0 = dlsym(v1, "STUIStyleOverridesForBackgroundActivityIdentifiers");
    v4[3] = (uint64_t)v0;
    getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A47983D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(uint64_t a1)
{
  uint64_t (*STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc)(uint64_t);

  STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc = (uint64_t (*)(uint64_t))getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc();
  if (!STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc)
    soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1();
  return STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc(a1);
}

id _SBUISafeBackgroundActivityIdentifiersDescription(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (SystemStatusLibraryCore() && getSTBackgroundActivityIdentifiersDescriptionSymbolLoc())
  {
    soft_STBackgroundActivityIdentifiersDescription((uint64_t)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

char *OUTLINED_FUNCTION_0_5()
{
  return dlerror();
}

void sub_1A479A1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogUIRemoteVC()
{
  if (SBLogUIRemoteVC_onceToken != -1)
    dispatch_once(&SBLogUIRemoteVC_onceToken, &__block_literal_global_43);
  return (id)SBLogUIRemoteVC___logObj;
}

id SBLogContinuitySessionService()
{
  if (SBLogContinuitySessionService_onceToken != -1)
    dispatch_once(&SBLogContinuitySessionService_onceToken, &__block_literal_global_4);
  return (id)SBLogContinuitySessionService___logObj;
}

__CFString *SBUICoachingTextForSBUIFaceIDCoachingCondition(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v6;
  uint64_t v7;

  v1 = &stru_1E4C40DE8;
  switch(a1)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_FACE_TOO_FAR");
      goto LABEL_14;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_FACE_TOO_CLOSE");
      goto LABEL_14;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_CAMERA_COVERED");
      goto LABEL_14;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_ATTENTION_REQUIRED");
      goto LABEL_14;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_SHOW_COMPLETE_FACE");
      goto LABEL_14;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_FACE_OUT_OF_VIEW");
      goto LABEL_14;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_DISABLED");
      goto LABEL_14;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_NOT_LOOKING");
      goto LABEL_14;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("GENERIC_WATCH_UNLOCK_ERROR");
      goto LABEL_14;
    case 11:
      +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "errorCode");

      SBUIStringForPhoneUnlockWithWatchErrorCode(v7);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v1;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_UPSIDE_DOWN");
      goto LABEL_14;
    case 14:
      if (!_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled())
        return v1;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("FACE_ID_POSE_OUT_OF_RANGE");
LABEL_14:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E4C40DE8, CFSTR("SpringBoardUIServices_Late_Fall_2018_iOS"));
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v1;
    default:
      return v1;
  }
}

const __CFString *DebugStringForSBUIFaceIDCoachingCondition(unint64_t a1)
{
  if (a1 > 0xE)
    return CFSTR("Face is too far");
  else
    return *(&off_1E4C40CC8 + a1);
}

uint64_t SBUIFaceIDCoachingConditionShouldBeVisible(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = 1;
  switch(a1)
  {
    case 0:
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
    case 13:
      result = 0;
      break;
    case 2:
    case 4:
    case 12:
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "userInterfaceIdiom");

      result = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      break;
    case 14:
      result = _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBUIFaceIDCameraOrientationForDevice()
{
  void *v0;
  int v1;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "hasPearlSupport");

  if (!v1)
    return 0;
  if (MGGetSInt32Answer())
    return 2;
  return 1;
}

uint64_t SBUIInterfaceOrientationForFaceIDCameraOrientation(uint64_t a1)
{
  uint64_t v1;

  v1 = 3;
  if (a1 != 2)
    v1 = 1;
  if (a1)
    return v1;
  else
    return 0;
}

BOOL SBUIFaceIDCameraOrientationAlignsWithInterfaceOrientation(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = (unint64_t)(a2 - 1) < 2;
  if (a1 != 1)
    v2 = 0;
  if (a1 == 2)
    return (unint64_t)(a2 - 3) < 2;
  else
    return v2;
}

const __CFString *SBUIStringFromPresentableButtonEvent(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("[INVALID]");
  if (a1 == 1)
    v1 = CFSTR("homeButtonPress");
  if (a1)
    return v1;
  else
    return CFSTR("noEvent");
}

id getACUISActivityMetricsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACUISActivityMetricsRequestClass_softClass;
  v7 = getACUISActivityMetricsRequestClass_softClass;
  if (!getACUISActivityMetricsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACUISActivityMetricsRequestClass_block_invoke;
    v3[3] = &unk_1E4C3E458;
    v3[4] = &v4;
    __getACUISActivityMetricsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A479B88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISSizeDimensionRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACUISSizeDimensionRequestClass_softClass;
  v7 = getACUISSizeDimensionRequestClass_softClass;
  if (!getACUISSizeDimensionRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACUISSizeDimensionRequestClass_block_invoke;
    v3[3] = &unk_1E4C3E458;
    v3[4] = &v4;
    __getACUISSizeDimensionRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A479BA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISEdgeInsetsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACUISEdgeInsetsClass_softClass;
  v7 = getACUISEdgeInsetsClass_softClass;
  if (!getACUISEdgeInsetsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACUISEdgeInsetsClass_block_invoke;
    v3[3] = &unk_1E4C3E458;
    v3[4] = &v4;
    __getACUISEdgeInsetsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A479BB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISActivityItemMetricsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACUISActivityItemMetricsRequestClass_softClass;
  v7 = getACUISActivityItemMetricsRequestClass_softClass;
  if (!getACUISActivityItemMetricsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACUISActivityItemMetricsRequestClass_block_invoke;
    v3[3] = &unk_1E4C3E458;
    v3[4] = &v4;
    __getACUISActivityItemMetricsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A479BC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A479C084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A479C24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACUISActivityMetricsRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ActivityUIServicesLibrary();
  result = objc_getClass("ACUISActivityMetricsRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACUISActivityMetricsRequestClass_block_invoke_cold_1();
  getACUISActivityMetricsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ActivityUIServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ActivityUIServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4C40D40;
    v2 = 0;
    ActivityUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ActivityUIServicesLibraryCore_frameworkLibrary)
    ActivityUIServicesLibrary_cold_1(&v0);
}

Class __getACUISSizeDimensionRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ActivityUIServicesLibrary();
  result = objc_getClass("ACUISSizeDimensionRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACUISSizeDimensionRequestClass_block_invoke_cold_1();
  getACUISSizeDimensionRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISEdgeInsetsClass_block_invoke(uint64_t a1)
{
  Class result;

  ActivityUIServicesLibrary();
  result = objc_getClass("ACUISEdgeInsets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACUISEdgeInsetsClass_block_invoke_cold_1();
  getACUISEdgeInsetsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISActivityItemMetricsRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ActivityUIServicesLibrary();
  result = objc_getClass("ACUISActivityItemMetricsRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACUISActivityItemMetricsRequestClass_block_invoke_cold_1();
  getACUISActivityItemMetricsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISSystemApertureMetricsRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ActivityUIServicesLibrary();
  result = objc_getClass("ACUISSystemApertureMetricsRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACUISSystemApertureMetricsRequestClass_block_invoke_cold_1();
  getACUISSystemApertureMetricsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!UserNotificationsUIKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4C40D58;
    v5 = 0;
    UserNotificationsUIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UserNotificationsUIKitLibraryCore_frameworkLibrary)
    __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)UserNotificationsUIKitLibraryCore_frameworkLibrary, "NCNotificationStructuredListViewControllerInsetMarginHorizontal");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

uint64_t SBUIIsSystemApertureEnabled()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (!v2)
    return SBSIsSystemApertureAvailable();
  v3 = 1;
  v4 = SBFEffectiveArtworkSubtype();
  if (v4 > 2795)
  {
    if (v4 == 2796 || v4 == 2868)
      return v3;
  }
  else if (v4 == 2556 || v4 == 2622)
  {
    return v3;
  }
  return 0;
}

id _SBUIWidgetBundlePaths()
{
  if (_SBUIWidgetBundlePaths_onceToken != -1)
    dispatch_once(&_SBUIWidgetBundlePaths_onceToken, &__block_literal_global_45);
  return (id)_SBUIWidgetBundlePaths___widgetBundlePaths;
}

void _enhanceContrastChanged()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  __graphicsQuality = objc_msgSend(v0, "_graphicsQuality");

}

void SBUICommonInitialize()
{
  if (SBUICommonInitialize_onceToken != -1)
    dispatch_once(&SBUICommonInitialize_onceToken, &__block_literal_global_46);
}

uint64_t SBUIGraphicsQuality()
{
  uint64_t result;
  void *v1;
  void *v2;

  result = __graphicsQuality;
  if (__graphicsQuality == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIDeviceGraphicsQuality SBUIGraphicsQuality(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("SBUICommon.m"), 26, CFSTR("Reading graphics quality static before it has been initialized"));

    return __graphicsQuality;
  }
  return result;
}

void __getPKGlyphViewClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PassKitUIFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUIPasscodeBiometricAuthenticationView.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPKGlyphViewClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPKGlyphViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIPasscodeBiometricAuthenticationView.m"), 22, CFSTR("Unable to find class %s"), "PKGlyphView");

  __break(1u);
}

void _SBUIEffectiveBiometricClassFromString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A471F000, a2, OS_LOG_TYPE_DEBUG, "_LABK: %@ is not wrapped, using original BiometricKit class", (uint8_t *)&v2, 0xCu);
}

void ____loadBiometricKitIfNecessary_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AmbientUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUIBannerSourceApplicationSceneSpecification.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAMUIAmbientPresentationSceneExtensionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIBannerSourceApplicationSceneSpecification.m"), 16, CFSTR("Unable to find class %s"), "AMUIAmbientPresentationSceneExtension");

  __break(1u);
}

void __getLAUIPearlGlyphStaticConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLAUIPearlGlyphStaticConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIProudLockIconView.m"), 37, CFSTR("Unable to find class %s"), "LAUIPearlGlyphStaticConfiguration");

  __break(1u);
}

void LocalAuthenticationPrivateUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LocalAuthenticationPrivateUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUIProudLockIconView.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLAUIPearlGlyphViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLAUIPearlGlyphViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIProudLockIconView.m"), 36, CFSTR("Unable to find class %s"), "LAUIPearlGlyphView");

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AmbientUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBSUIInCallSceneSpecification.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAMUIAmbientPresentationSceneExtensionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBSUIInCallSceneSpecification.m"), 21, CFSTR("Unable to find class %s"), "AMUIAmbientPresentationSceneExtension");

  __break(1u);
}

void __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AmbientUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBSUIInCallWindowScene.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAMUIAmbientPresentationSettingsExtensionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBSUIInCallWindowScene.m"), 31, CFSTR("Unable to find class %s"), "AMUIAmbientPresentationSettingsExtension");

  __break(1u);
}

void getPBItemMetadataKey_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPBItemMetadataKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUISystemDrag.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getPBItemMetadataKeySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PasteboardLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUISystemDrag.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void SBUIBytesPerPixelForMetalPixelFormat_cold_1()
{
  __assert_rtn("SBUIBytesPerPixelForMetalPixelFormat", "SBUIMetalHelpers.m", 122, "false");
}

void SBUIBitsPerComponentForMTLPixelFormat_cold_1()
{
  __assert_rtn("SBUIBitsPerComponentForMTLPixelFormat", "SBUIMetalHelpers.m", 223, "false");
}

void UIImageCreateFromMTLPixelFormat_cold_1()
{
  __assert_rtn("SBUIBitmapInfoForPixelFormat", "SBUIMetalHelpers.m", 348, "false");
}

void SpringBoardHomeLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardHomeLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUIContinuityHostProxySceneExtension.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1A471F000, v2, v3, "Asserting because wallpaper name is: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

void _SBSUIWallpaperSetImagesWithoutCheckingMC_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1A471F000, log, OS_LOG_TYPE_ERROR, "Asserting because wallpaper name is: %{public}@ for key: %{public}@", (uint8_t *)&v3, 0x16u);
}

void SBSUIWallpaperClearVideo_cold_1()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A471F000, v0, OS_LOG_TYPE_INFO, "The iris wallpaper asset failed to be exported.", v1, 2u);
  }

  __assert_rtn("SBSUIWallpaperClearVideo", "SBSUIWallpaperUtilities.m", 475, "0");
}

void SBSUIWallpaperGetLegibilitySettings_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_1A471F000, log, OS_LOG_TYPE_ERROR, "Error unarchive wallpaper legibility settings: %@", (uint8_t *)&v1, 0xCu);
}

void SBSUIRegisterHardwareButtonHintView_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A471F000, a2, a3, "no CALayer present for view %{public}@", a5, a6, a7, a8, 2u);
}

void SBSUIRegisterHardwareButtonHintView_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A471F000, a2, a3, "hint view layer %@ has no CAContext", a5, a6, a7, a8, 2u);
}

void SystemStatusLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SystemStatusLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_SBUISystemStatusSoftLinking.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_STBackgroundActivityIdentifiersDescription_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef soft_STBackgroundActivityIdentifiersDescription(CFSetRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBUISystemStatusSoftLinking.m"), 13, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void SystemStatusUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SystemStatusUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_SBUISystemStatusSoftLinking.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFSetRef soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBUISystemStatusSoftLinking.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(CFSetRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("_SBUISystemStatusSoftLinking.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_0_5());

  __break(1u);
}

void __getACUISActivityMetricsRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACUISActivityMetricsRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 23, CFSTR("Unable to find class %s"), "ACUISActivityMetricsRequest");

  __break(1u);
}

void ActivityUIServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ActivityUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUILiveActivityMetrics.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getACUISSizeDimensionRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACUISSizeDimensionRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 32, CFSTR("Unable to find class %s"), "ACUISSizeDimensionRequest");

  __break(1u);
}

void __getACUISEdgeInsetsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACUISEdgeInsetsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 35, CFSTR("Unable to find class %s"), "ACUISEdgeInsets");

  __break(1u);
}

void __getACUISActivityItemMetricsRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACUISActivityItemMetricsRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 26, CFSTR("Unable to find class %s"), "ACUISActivityItemMetricsRequest");

  __break(1u);
}

void __getACUISSystemApertureMetricsRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACUISSystemApertureMetricsRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUILiveActivityMetrics.m"), 29, CFSTR("Unable to find class %s"), "ACUISSystemApertureMetricsRequest");

  __break(1u);
}

void __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UserNotificationsUIKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUILiveActivityMetrics.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x1E0D00960]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1E0D00A20]();
}

uint64_t BSCompareFloats()
{
  return MEMORY[0x1E0D01130]();
}

uint64_t BSCompareIntegers()
{
  return MEMORY[0x1E0D01138]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0D012B8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D01340]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1E0D01368]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1E0D013B8]();
}

uint64_t BSMachSendRightRelease()
{
  return MEMORY[0x1E0D01410]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1E0D01588]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1E0D015C0]();
}

uint64_t BSSizeLessThanSize()
{
  return MEMORY[0x1E0D015D0]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSTimeUntilNextClockMinute()
{
  return MEMORY[0x1E0D01648]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetContext()
{
  return MEMORY[0x1E0CD24E8]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1E0CD24F8]();
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1E0CD2628](t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x1E0C9BB08]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1E0C9BB90]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB00](buffer);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD40](*(_QWORD *)&port);
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x1E0CBBE20]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0CEA128](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t PBUICurrentParallaxDeviceType()
{
  return MEMORY[0x1E0D652F8]();
}

uint64_t PBUIMagicWallpaperOptionsDictionary()
{
  return MEMORY[0x1E0D65320]();
}

uint64_t PBUIStringForWallpaperLocations()
{
  return MEMORY[0x1E0D65350]();
}

uint64_t PBUIStringForWallpaperMode()
{
  return MEMORY[0x1E0D65358]();
}

uint64_t PBUIStringForWallpaperType()
{
  return MEMORY[0x1E0D65360]();
}

uint64_t PBUIStringForWallpaperVariant()
{
  return MEMORY[0x1E0D65368]();
}

uint64_t SBAddWallpaperAnimationSuspensionAssertion()
{
  return MEMORY[0x1E0DAB0B0]();
}

uint64_t SBClearWallpaperAsset()
{
  return MEMORY[0x1E0DAB110]();
}

uint64_t SBFCreateIOSurfaceForImage()
{
  return MEMORY[0x1E0DAA040]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1E0DAA068]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1E0DAA070]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1E0DAA080]();
}

uint64_t SBFPreheatImageData()
{
  return MEMORY[0x1E0DAA198]();
}

uint64_t SBFStringForUIUserInterfaceStyle()
{
  return MEMORY[0x1E0DAA1F0]();
}

uint64_t SBFStringForWallpaperLocations()
{
  return MEMORY[0x1E0DAA1F8]();
}

uint64_t SBFStringForWallpaperMode()
{
  return MEMORY[0x1E0DAA200]();
}

uint64_t SBFStringForWallpaperVariant()
{
  return MEMORY[0x1E0DAA208]();
}

uint64_t SBFTransformFromOrientationToOrientation()
{
  return MEMORY[0x1E0DAA218]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1E0DAA258]();
}

uint64_t SBGetWallpaperLegibilitySettings()
{
  return MEMORY[0x1E0DAB280]();
}

uint64_t SBGetWallpaperOptions()
{
  return MEMORY[0x1E0DAB288]();
}

uint64_t SBGetWallpaperPreview()
{
  return MEMORY[0x1E0DAB290]();
}

uint64_t SBGetWallpaperPreviewSurface()
{
  return MEMORY[0x1E0DAB298]();
}

uint64_t SBLogBanners()
{
  return MEMORY[0x1E0DAB308]();
}

uint64_t SBLogBiometricResource()
{
  return MEMORY[0x1E0DAB310]();
}

uint64_t SBLogCFUserNotifications()
{
  return MEMORY[0x1E0DAB318]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1E0DAB330]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1E0DAB350]();
}

uint64_t SBLogDashBoardCallToActionLabel()
{
  return MEMORY[0x1E0DAB358]();
}

uint64_t SBLogHardwareButtonService()
{
  return MEMORY[0x1E0DAB3D0]();
}

uint64_t SBLogHearingTestMode()
{
  return MEMORY[0x1E0DAB3D8]();
}

uint64_t SBLogInCallPresentation()
{
  return MEMORY[0x1E0DAB3F8]();
}

uint64_t SBLogLockScreenBiometricFaceIDCoaching()
{
  return MEMORY[0x1E0DAB428]();
}

uint64_t SBLogPhoneUnlockWithWatch()
{
  return MEMORY[0x1E0DAB480]();
}

uint64_t SBLogSystemApertureHosting()
{
  return MEMORY[0x1E0DAB4B8]();
}

uint64_t SBLogSystemNotes()
{
  return MEMORY[0x1E0DAB4C0]();
}

uint64_t SBLogTransientOverlay()
{
  return MEMORY[0x1E0DAB4D8]();
}

uint64_t SBLogWallpaper()
{
  return MEMORY[0x1E0DAB4E8]();
}

uint64_t SBSHearingTestModeDescription()
{
  return MEMORY[0x1E0DAB750]();
}

uint64_t SBSInCallPresentationModeDescription()
{
  return MEMORY[0x1E0DAB770]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x1E0DAB778]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1E0DAB9A8]();
}

uint64_t SBSetProceduralWallpaper()
{
  return MEMORY[0x1E0DABAB8]();
}

uint64_t SBSetWallpaperImageForLocations()
{
  return MEMORY[0x1E0DABAC0]();
}

uint64_t SBSetWallpaperImageSurfaceForLocations()
{
  return MEMORY[0x1E0DABAC8]();
}

uint64_t SBSetWallpaperOptionsForLocations()
{
  return MEMORY[0x1E0DABAD0]();
}

uint64_t SBSetWallpaperVariant()
{
  return MEMORY[0x1E0DABAD8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0CEB3A0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0CEB4B8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x1E0CEB840]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x1E0CEB848]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0CEBA28]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0CEBA90]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0CEBAA0]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0CEBAB0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0CEBAE8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0CEBB20]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0CEBBC0]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1E0CEBBC8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1E0CEBC08]();
}

uint64_t UIViewControllerFromPresentable()
{
  return MEMORY[0x1E0D010B0]();
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  return MEMORY[0x1E0DDDA88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _SBFWallpaperRegisterForExternalChangeNotification()
{
  return MEMORY[0x1E0DAA2C0]();
}

uint64_t _SBF_Private_IsD93Like()
{
  return MEMORY[0x1E0DAA320]();
}

uint64_t _SBF_Private_IsD94Like()
{
  return MEMORY[0x1E0DAA328]();
}

uint64_t _UIAdaptLocalizedStringForView()
{
  return MEMORY[0x1E0CEBEB8]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1E0CEC160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1E0DABCE0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1E0DABCF0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t aks_drop_auxiliary_auth_by_handle()
{
  return MEMORY[0x1E0CFD398]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E88]();
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F38](zone, alignment, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

vImage_Error vImageTentConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D790](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageTentConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D798](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

