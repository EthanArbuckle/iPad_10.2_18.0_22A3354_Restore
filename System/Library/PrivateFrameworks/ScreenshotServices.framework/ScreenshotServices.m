void sub_213895800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVKCImageAnalyzerClass()
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
  v0 = (void *)getVKCImageAnalyzerClass_softClass;
  v7 = getVKCImageAnalyzerClass_softClass;
  if (!getVKCImageAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getVKCImageAnalyzerClass_block_invoke;
    v3[3] = &unk_24D06B990;
    v3[4] = &v4;
    __getVKCImageAnalyzerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2138958C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVKSelectableBarButtonItemClass_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VKSelectableBarButtonItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKSelectableBarButtonItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVKSelectableBarButtonItemClass_block_invoke_cold_1();
    VisionKitCoreLibrary();
  }
}

void VisionKitCoreLibrary()
{
  void *v0;

  if (!VisionKitCoreLibraryCore_frameworkLibrary)
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

double __getVKImageAnalysisBarButtonItemClass_block_invoke(uint64_t a1)
{
  double result;
  uint64_t v3;

  VisionKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VKImageAnalysisBarButtonItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalysisBarButtonItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1();
    return __getVKCImageAnalyzerClass_block_invoke(v3);
  }
  return result;
}

double __getVKCImageAnalyzerClass_block_invoke(uint64_t a1)
{
  double result;
  double v3;
  double v4;
  double v5;

  VisionKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VKCImageAnalyzer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVKCImageAnalyzerClass_block_invoke_cold_1();
    return SSLargestSizeWithinSizeWithAspectRatio(v3, v4, v5);
  }
  return result;
}

double SSLargestSizeWithinSizeWithAspectRatio(double result, double a2, double a3)
{
  double v3;
  double v4;

  v3 = result / a3;
  v4 = a2 * a3;
  if (v3 > a2 && v4 <= result)
    return v4;
  return result;
}

double SSizeToFitSizeInAspectRatioOfSize(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  double result;

  v4 = a1 / a2;
  v5 = a3 / v4;
  result = a4 * v4;
  if (v5 <= a4 || result > a3)
    return a3;
  return result;
}

double SSAspectRatioFromSize(double a1, double a2)
{
  return a1 / a2;
}

BOOL SSFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL SSPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.001;
  return vabdd_f64(a2, a4) < 0.001 && v4;
}

BOOL SSSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.001;
  return vabdd_f64(a2, a4) < 0.001 && v4;
}

BOOL SSRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL8 result;
  _BOOL4 v9;

  result = 0;
  if (vabdd_f64(a1, a5) < 0.001 && vabdd_f64(a2, a6) < 0.001)
  {
    v9 = vabdd_f64(a3, a7) < 0.001;
    return vabdd_f64(a4, a8) < 0.001 && v9;
  }
  return result;
}

BOOL SSEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.001
      && vabdd_f64(a2, a6) < 0.001
      && vabdd_f64(a4, a8) < 0.001
      && vabdd_f64(a3, a7) < 0.001;
}

CGFloat SSInsetsOfRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18 = a2 - a6;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxY(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxY(v22);
  return v18;
}

double SSRoundSizeToScale()
{
  double v0;
  double v1;

  UIRoundToScale();
  v1 = v0;
  UIRoundToScale();
  return v1;
}

double SSRoundRectToScale()
{
  double v0;
  double v1;

  UIRoundToScale();
  v1 = v0;
  UIRoundToScale();
  UIRoundToScale();
  UIRoundToScale();
  return v1;
}

BOOL SSRectEdgeIsHorizontal(uint64_t a1)
{
  return a1 == 1 || a1 == 4;
}

BOOL SSRectEdgeIsVertical(uint64_t a1)
{
  return a1 == 2 || a1 == 8;
}

double SSSubRectForRectWithUnitRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a3 * a5;
}

double SSFloorPoint(double a1)
{
  return floor(a1);
}

double SSFloorSize(double a1)
{
  return floor(a1);
}

double SSFloorRect(double a1)
{
  return floor(a1);
}

double SSRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRectEdge v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  double MinX;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double MinY;
  double v33;
  double MaxY;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGRect slice;
  CGRect remainder;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v11 = a1;
  v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MaxY = CGRectGetMaxY(v43);
    v44.origin.x = v11;
    v44.origin.y = a2;
    v44.size.width = a3;
    v44.size.height = a4;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = v11;
    v45.origin.y = a2;
    v45.size.width = a3;
    v45.size.height = a4;
    v37 = CGRectGetMaxY(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.x = v11;
    v47.origin.y = a2;
    v47.size.width = a3;
    v47.size.height = a4;
    v33 = v38 * CGRectGetWidth(v47);
    v36 = height;
    v39 = x;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v16 = CGRectGetMinY(v48);
    v49.origin.x = v11;
    v49.origin.y = a2;
    v49.size.width = a3;
    v49.size.height = a4;
    v17 = v16 - CGRectGetMinY(v49);
    v50.origin.x = v11;
    v50.origin.y = a2;
    v50.size.width = a3;
    v50.size.height = a4;
    v18 = v17 * CGRectGetWidth(v50);
    v19 = v33;
    if (v18 <= v33)
    {
      v35 = MaxY - MinY;
      v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.x = v11;
      v51.origin.y = a2;
      v51.size.width = a3;
      v51.size.height = a4;
      v20 = CGRectGetMaxY(v51);
      v52.size.height = v36;
      v52.origin.x = v39;
      v52.origin.y = y;
      v52.size.width = width;
      v35 = v20 - CGRectGetMinY(v52);
      v21 = CGRectMaxYEdge;
      v19 = v18;
    }
    v53.origin.x = v11;
    v53.origin.y = a2;
    v53.size.width = a3;
    v53.size.height = a4;
    MaxX = CGRectGetMaxX(v53);
    v54.size.height = v36;
    v54.origin.x = v39;
    v54.origin.y = y;
    v54.size.width = width;
    v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.x = v11;
    v55.origin.y = a2;
    v55.size.width = a3;
    v55.size.height = a4;
    v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.height = v36;
      v56.origin.x = v39;
      v56.origin.y = y;
      v56.size.width = width;
      v25 = CGRectGetMaxX(v56);
      v57.origin.x = v11;
      v57.origin.y = a2;
      v57.size.width = a3;
      v57.size.height = a4;
      v21 = CGRectMinXEdge;
      v35 = v25 - CGRectGetMinX(v57);
      v19 = v24;
    }
    v58.size.height = v36;
    v58.origin.x = v39;
    v58.origin.y = y;
    v58.size.width = width;
    MinX = CGRectGetMinX(v58);
    v59.origin.x = v11;
    v59.origin.y = a2;
    v59.size.width = a3;
    v59.size.height = a4;
    v27 = MinX - CGRectGetMinX(v59);
    v60.origin.x = v11;
    v60.origin.y = a2;
    v60.size.width = a3;
    v60.size.height = a4;
    v28 = CGRectGetHeight(v60);
    v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.x = v11;
      v61.origin.y = a2;
      v61.size.width = a3;
      v61.size.height = a4;
      v30 = CGRectGetMaxX(v61);
      v62.size.height = v36;
      v62.origin.x = v39;
      v62.origin.y = y;
      v62.size.width = width;
      v29 = v30 - CGRectGetMinX(v62);
      v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.x = v11;
    v63.origin.y = a2;
    v63.size.width = a3;
    v63.size.height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

BOOL SSRectIsValid(double a1, double a2, double a3, double a4)
{
  _BOOL8 result;
  double v5;

  result = 0;
  if (fabs(a1) != INFINITY)
  {
    v5 = fabs(a3);
    if (fabs(a2) != INFINITY && v5 != INFINITY)
      return fabs(a4) != INFINITY;
  }
  return result;
}

void sub_213896AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRCPMovieClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RecapLibraryCore_frameworkLibrary)
  {
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RecapLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RCPMovie");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRCPMovieClass_block_invoke_cold_1();
    free(v3);
  }
  getRCPMovieClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21389778C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_213897B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213898160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

id _SSSignpostLog()
{
  if (_SSSignpostLog_onceToken != -1)
    dispatch_once(&_SSSignpostLog_onceToken, &__block_literal_global_0);
  return (id)_SSSignpostLog____SSSignpostLog;
}

void sub_213898D90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213899418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void *__getMAImageCaptioningSetCaptionSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
  }
  else
  {
    MediaAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
    if (!MediaAccessibilityLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MAImageCaptioningSetCaption");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningSetCaptionSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  return a2;
}

id getUMUserManagerClass()
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
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_24D06B990;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21389ADE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UMUserManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (!SetupAssistantLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21389C054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21389C1DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SSCGImageFromSSImageSurface(void *a1)
{
  objc_msgSend(a1, "backingSurface");
  return _UICreateCGImageFromIOSurfaceWithOptions();
}

id SSCGImageBackedImageFromImage(void *a1)
{
  id v1;
  const void *v2;
  id v3;
  double v4;
  id v5;

  v1 = a1;
  if (objc_msgSend(v1, "ioSurface"))
  {
    v2 = (const void *)_UICreateCGImageFromIOSurfaceWithOptions();
    v3 = objc_alloc(MEMORY[0x24BDF6AC8]);
    objc_msgSend(v1, "scale");
    v5 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);
    CFRelease(v2);
  }
  else
  {
    v5 = v1;
  }

  return v5;
}

void sub_21389EE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCARSessionStatusClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CarKitLibraryCore_frameworkLibrary)
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("CARSessionStatus");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCARSessionStatusClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2138A0D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2138A3158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2138A4F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_2138A50A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2138A53CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRCPRecorderConfigClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RCPRecorderConfig");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPRecorderConfigClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRCPRecorderConfigClass_block_invoke_cold_1();
    RecapLibrary();
  }
}

void RecapLibrary()
{
  void *v0;

  if (!RecapLibraryCore_frameworkLibrary_0)
    RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!RecapLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRCPEventStreamRecorderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPEventStreamRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPEventStreamRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPEventStreamRecorderClass_block_invoke_cold_1();
    return (Class)__getRCPScreenRecorderClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPScreenRecorderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPScreenRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPScreenRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPScreenRecorderClass_block_invoke_cold_1();
    return (Class)__getRCPMovieClass_block_invoke_0(v3);
  }
  return result;
}

Class __getRCPMovieClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPMovie");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPMovieClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPMovieClass_block_invoke_cold_1();
    return (Class)__getTFBetaApplicationProxyClass_block_invoke(v3);
  }
  return result;
}

Class __getTFBetaApplicationProxyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!TestFlightCoreLibraryCore_frameworkLibrary)
  {
    TestFlightCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TestFlightCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("TFBetaApplicationProxy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getTFBetaApplicationProxyClass_block_invoke_cold_1();
    free(v3);
  }
  getTFBetaApplicationProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAudioServicesPlaySystemSoundSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AudioToolboxLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AudioToolboxLibraryCore_frameworkLibrary;
  }
  else
  {
    AudioToolboxLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AudioToolboxLibraryCore_frameworkLibrary;
    if (!AudioToolboxLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AudioServicesPlaySystemSound");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAudioServicesPlaySystemSoundSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
    if (!SpringBoardUILibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBUIGetUserAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SSApplyDebuggingCustomizationsToViewIfAppropriate(void *a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  id v12;

  v12 = a1;
  v5 = a2;
  if (_SSIsRemoteViewControllerDebuggingEnabled())
  {
    objc_msgSend(v12, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", a3);

    objc_msgSend(v12, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v5);
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    v9 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    v10 = a3 * 4.0;
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v10, v10);
    objc_msgSend(v9, "setCenter:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", v10 * 0.5);

    objc_msgSend(v9, "setBackgroundColor:", v8);
    objc_msgSend(v12, "addSubview:", v9);

  }
}

id _SSUserDefaults()
{
  if (_SSUserDefaults_onceToken != -1)
    dispatch_once(&_SSUserDefaults_onceToken, &__block_literal_global_9);
  return (id)_SSUserDefaults_result;
}

uint64_t _SSUserDefaultsBooleanForKeyWithNODefault(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  _SSUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", v1);

  return v3;
}

double _SSUserDefaultsCGFloatForKeyWith0Default(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  float v4;
  double v5;

  v1 = a1;
  _SSUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

uint64_t _SSUserDefaultsNSIntegerForKeyWith0Default(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  _SSUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

uint64_t _SSIsRemoteViewControllerDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSDebugRemoteViewControllers"));
}

uint64_t _SSIsViewSnapshotDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSDebugViewSnapshotting"));
}

uint64_t _SSShouldHomeButtonDismiss()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSShouldHomeButtonDismiss"));
}

uint64_t _SSIsScreenshotManagerDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSDebugScreenshotManager"));
}

uint64_t _SSEnableVellumExport()
{
  if (_SSEnableVellumExport_onceToken != -1)
    dispatch_once(&_SSEnableVellumExport_onceToken, &__block_literal_global_12);
  return _SSEnableVellumExport___SSEnableVellumExport;
}

uint64_t _SSShouldIgnoreAbilityCheck()
{
  if (_SSShouldIgnoreAbilityCheck_onceToken != -1)
    dispatch_once(&_SSShouldIgnoreAbilityCheck_onceToken, &__block_literal_global_17);
  return _SSShouldIgnoreAbilityCheck___SSShouldIgnoreAbilityCheck;
}

uint64_t _SSEnableContinuousScreenCaptureForBugFiling()
{
  if (_SSEnableContinuousScreenCaptureForBugFiling_onceToken != -1)
    dispatch_once(&_SSEnableContinuousScreenCaptureForBugFiling_onceToken, &__block_literal_global_20);
  return _SSEnableContinuousScreenCaptureForBugFiling___SSEnableContinuousScreenCaptureForBugFiling;
}

uint64_t _SSScreenshotsInQuickNoteEnabled()
{
  if (_SSScreenshotsInQuickNoteEnabled_onceToken != -1)
    dispatch_once(&_SSScreenshotsInQuickNoteEnabled_onceToken, &__block_literal_global_21);
  return _SSScreenshotsInQuickNoteEnabled___SSScreenshotsInQuickNoteEnabled;
}

uint64_t _SSGetLastUsedFullPageScreenshotShareAsOption()
{
  return _SSUserDefaultsNSIntegerForKeyWith0Default(CFSTR("SSLastUsedFullPageScreenshotShareAsOption"));
}

void _SSSetLastUsedFullPageScreenshotShareAsOption(uint64_t a1)
{
  id v2;

  _SSUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", a1, CFSTR("SSLastUsedFullPageScreenshotShareAsOption"));

}

uint64_t _SSGetAnnotationModePreference()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSAnnotationModePreference"));
}

void _SSSetAnnotationModePreference(uint64_t a1)
{
  id v2;

  _SSUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", a1, CFSTR("SSAnnotationModePreference"));

}

uint64_t _SSLinksInPhotosEnabled()
{
  if (_SSLinksInPhotosEnabled_onceToken != -1)
    dispatch_once(&_SSLinksInPhotosEnabled_onceToken, &__block_literal_global_28);
  return _SSLinksInPhotosEnabled___SSLinksInPhotosEnabled;
}

uint64_t _SSQuickActionsEnabled()
{
  if (_SSQuickActionsEnabled_onceToken != -1)
    dispatch_once(&_SSQuickActionsEnabled_onceToken, &__block_literal_global_30);
  return _SSQuickActionsEnabled_sQuickActionsEnabled;
}

uint64_t _SSRemoveBackgroundEnabled()
{
  if (_SSRemoveBackgroundEnabled_onceToken != -1)
    dispatch_once(&_SSRemoveBackgroundEnabled_onceToken, &__block_literal_global_33);
  return _SSRemoveBackgroundEnabled_sRemoveBackgroundEnabled;
}

uint64_t __getVKSelectableBarButtonItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1(v0);
}

uint64_t __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getVKCImageAnalyzerClass_block_invoke_cold_1();
}

uint64_t __getVKCImageAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRCPMovieClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPMovieClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:].cold.1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getUMUserManagerClass_block_invoke_cold_1();
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(v0);
}

uint64_t __getRCPRecorderConfigClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRCPEventStreamRecorderClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPEventStreamRecorderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRCPScreenRecorderClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPScreenRecorderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getTFBetaApplicationProxyClass_block_invoke_cold_1(v0);
}

uint64_t __getTFBetaApplicationProxyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SSRemoteAlertHandleProvider remoteAlertHandle:didInvalidateWithError:].cold.1(v0);
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAE8]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCD8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE0BD30]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
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

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x24BDD8DA0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PHImageDataFromImageAsScreenshot()
{
  return MEMORY[0x24BDE37F0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BDF7CF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x24BDF8100]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x24BDF8170]();
}

uint64_t _UIRenderingBufferCreate()
{
  return MEMORY[0x24BDF8178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

