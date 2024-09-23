uint64_t UISIndexForFontWeight(double a1)
{
  uint64_t result;

  for (result = 0; result != 9; ++result)
  {
    if (*(double *)(MEMORY[0x1E0CA8240] + 8 * result) > a1)
      break;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

BOOL isEqual(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

id _UISStateServiceLogger()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[4] = &_UISStateServiceLogger_logging;
  v1[5] = "stateService";
  if (_UISStateServiceLogger_logging != -1)
    dispatch_once(&_UISStateServiceLogger_logging, v1);
  return (id)qword_1EE1E5058;
}

void sub_1908789B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *UISCreateCachedColorTransform(__CFString *key)
{
  CGColorSpace *v2;
  void *v3;
  void *v4;
  void *value_out;

  if (UISCreateCachedColorTransform_onceToken != -1)
    dispatch_once(&UISCreateCachedColorTransform_onceToken, &__block_literal_global_2);
  value_out = 0;
  if (cache_get_and_retain((cache_t *)UISCreateCachedColorTransform_colorTransformCache, key, &value_out))
  {
    v2 = CGColorSpaceCreateWithName(key);
    v3 = (void *)MEMORY[0x19401058C](v2, 0);
    value_out = v3;
    if (v3)
      cache_set_and_retain((cache_t *)UISCreateCachedColorTransform_colorTransformCache, key, v3, 0);
    CGColorSpaceRelease(v2);
    v4 = value_out;
    if (value_out)
      goto LABEL_7;
  }
  else
  {
    v4 = (void *)CGColorTransformRetain();
    value_out = v4;
    if (v4)
    {
LABEL_7:
      cache_release_value((cache_t *)UISCreateCachedColorTransform_colorTransformCache, v4);
      return value_out;
    }
  }
  return 0;
}

void sub_190879B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19087A068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_19087A36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t _UISVisibilityEnvironmentForUIHostedWindowContextID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIHostedWindow:%x"), a1);
}

uint64_t _UISVisibilityEnvironmentForSceneIdentityTokenString(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIScene:%@"), a1);
}

CFTypeRef retain1(const void *a1, _QWORD *a2)
{
  CFTypeRef result;

  result = CFRetain(a1);
  *a2 = result;
  return result;
}

void _UISSetSystemReferenceAngleDataSource(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UISSetSystemReferenceAngleDataSource(id<_UISSystemReferenceAngleDataSource>  _Nonnull __strong)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISSystemReferenceAngle.m"), 53, CFSTR("Must be called from the main thread."));

  }
  v2 = (void *)__datasource;
  __datasource = (uint64_t)v1;

}

double UISColorLuminance(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CFStringRef Name;
  const CGFloat *Components;
  double v5;
  double v6;
  double v7;
  int8x16_t v9;
  uint64_t v10;
  float64x2_t v11;
  int8x16_t v12;
  double v13;
  int8x16_t v14;
  int8x16_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ColorSpace = CGColorGetColorSpace(a1);
  Name = CGColorSpaceGetName(ColorSpace);
  Components = CGColorGetComponents(a1);
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA00]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D958]))
  {
    v5 = *Components * 0.222495198 + Components[1] * 0.716895044;
    v6 = Components[2];
LABEL_4:
    v7 = v5 + v6 * 0.0606097579;
    return fmin(fmax(v7, 0.0), 1.0);
  }
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA10]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D960]))
  {
    v10 = 0;
    v11.f64[0] = NAN;
    v11.f64[1] = NAN;
    v12 = (int8x16_t)vnegq_f64(v11);
    v14 = v12;
    do
    {
      *(CGFloat *)v9.i64 = Components[v10];
      v13 = fabs(*(double *)v9.i64);
      if (v13 >= 0.04045)
      {
        v15 = v9;
        v11.f64[0] = pow(v13 * 0.947867 + 0.0521327, 2.4);
        v12 = v14;
        v9 = v15;
      }
      else
      {
        v11.f64[0] = v13 * 0.0773994;
      }
      v11 = (float64x2_t)vbslq_s8(v12, (int8x16_t)v11, v9);
      *(double *)((char *)&v16 + v10 * 8) = v11.f64[0];
      ++v10;
    }
    while (v10 != 3);
    v5 = v16 * 0.222495198 + v17 * 0.716895044;
    v6 = v18;
    goto LABEL_4;
  }
  UISCreateCachedColorTransform((__CFString *)*MEMORY[0x1E0C9D998]);
  if (CGColorTransformConvertColorComponents())
    v7 = v17;
  else
    v7 = 0.0;
  CGColorTransformRelease();
  return fmin(fmax(v7, 0.0), 1.0);
}

void sub_19087B3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19087BB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19087BCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UISSecureControlServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1EF140);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1EF1A0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_getSizeToolWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1E9780);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_getSlotMachineWithReply_, 0, 1);

  return v0;
}

id UISSecureControlServiceSharedRemoteInterface()
{
  if (_MergedGlobals_3 != -1)
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_1);
  return (id)qword_1ECDA5858;
}

void UISCalloutBarFontSize(unint64_t a1)
{
  uint64_t v2;
  const __CTFontDescriptor *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >= 4)
  {
    if (_MergedGlobals_4 != -1)
      dispatch_once(&_MergedGlobals_4, &__block_literal_global_2);
    if (qword_1ECDA5870 != a1)
    {
      if (a1 >= 8)
        v2 = 8;
      else
        v2 = a1;
      UISGetFontContentSizeCategory(v2);
      v3 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
      v4 = (void *)CTFontDescriptorCopyAttribute(v3, (CFStringRef)*MEMORY[0x1E0CA83D8]);
      objc_msgSend(v4, "doubleValue");
      v6 = v5;

      CFRelease(v3);
      UISCalloutBarFontSize_lastSizeCategoryFontSize = v6;
      qword_1ECDA5870 = a1;
    }
  }
}

uint64_t UISSlotMachineInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1E9780);
}

BOOL UISUserInterfaceStyleModeValueIsAutomatic(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 100;
}

BOOL UISUserInterfaceStyleModeOverridesEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL UISUserInterfaceStyleModeSchedulesEqual(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

id _UISUserInterfaceStyleModeUserDefaults()
{
  if (qword_1ECDA5880 != -1)
    dispatch_once(&qword_1ECDA5880, &__block_literal_global_3);
  return (id)_MergedGlobals_5;
}

void sub_1908809FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECDA5890)
    qword_1ECDA5890 = _sl_dlopen();
  v2 = (void *)qword_1ECDA5890;
  if (!qword_1ECDA5890)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UserNotificationsLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("UISNotificationResponseAction.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "UNNotificationDefaultActionIdentifier");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_6 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_1908815A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAPSConnectionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ApplePushServiceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("APSConnection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAPSConnectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UISApplicationStateService.m"), 25, CFSTR("Unable to find class %s"), "APSConnection");

    __break(1u);
  }
}

void *ApplePushServiceLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!ApplePushServiceLibraryCore_frameworkLibrary)
    ApplePushServiceLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ApplePushServiceLibraryCore_frameworkLibrary;
  if (!ApplePushServiceLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ApplePushServiceLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("UISApplicationStateService.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_190883584(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id getCKShareMetadataClass()
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
  v0 = (void *)_MergedGlobals_9;
  v7 = _MergedGlobals_9;
  if (!_MergedGlobals_9)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKShareMetadataClass_block_invoke;
    v3[3] = &unk_1E2CAF658;
    v3[4] = &v4;
    __getCKShareMetadataClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1908836A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKShareMetadataClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA58D0)
    qword_1ECDA58D0 = _sl_dlopen();
  if (!qword_1ECDA58D0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISHandleCloudKitShareAction.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CKShareMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKShareMetadataClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISHandleCloudKitShareAction.m"), 20, CFSTR("Unable to find class %s"), "CKShareMetadata");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UISGetFontContentSizeCategory(uint64_t result)
{
  uint64_t *v1;

  switch(result)
  {
    case 0:
      v1 = (uint64_t *)MEMORY[0x1E0CA8228];
      goto LABEL_14;
    case 1:
      v1 = (uint64_t *)MEMORY[0x1E0CA8218];
      goto LABEL_14;
    case 2:
      v1 = (uint64_t *)MEMORY[0x1E0CA8210];
      goto LABEL_14;
    case 3:
      v1 = (uint64_t *)MEMORY[0x1E0CA8208];
      goto LABEL_14;
    case 4:
      v1 = (uint64_t *)MEMORY[0x1E0CA8220];
      goto LABEL_14;
    case 5:
      v1 = (uint64_t *)MEMORY[0x1E0CA8230];
      goto LABEL_14;
    case 6:
      v1 = (uint64_t *)MEMORY[0x1E0CA8238];
      goto LABEL_14;
    case 7:
      v1 = (uint64_t *)MEMORY[0x1E0CA81E8];
      goto LABEL_14;
    case 8:
      v1 = (uint64_t *)MEMORY[0x1E0CA81E0];
      goto LABEL_14;
    case 9:
      v1 = (uint64_t *)MEMORY[0x1E0CA81F0];
      goto LABEL_14;
    case 10:
      v1 = (uint64_t *)MEMORY[0x1E0CA81F8];
      goto LABEL_14;
    case 11:
      v1 = (uint64_t *)MEMORY[0x1E0CA8200];
LABEL_14:
      result = *v1;
      break;
    default:
      return result;
  }
  return result;
}

double UISFontWeightForIndex(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1E0CA8240] + 8 * a1 - 8;
  if (a1 > 9 || a1 == 0)
    v1 = MEMORY[0x1E0CA84D0];
  return *(double *)v1;
}

void sub_190886824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  uint64_t v14;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 152));
  _Unwind_Resume(a1);
}

void sub_190886E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UISTouchAuthenticationTelemetryReportRecord(void *a1)
{
  _UISTouchAuthenticationTelemetryReportRecordWithDuration(a1, 0);
}

void _UISTouchAuthenticationTelemetryReportRecordWithDuration(void *a1, int a2)
{
  _BYTE *v3;
  id v4;
  const char *v5;
  CC_LONG v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int data;
  tm v16;
  timeval v17;
  CC_SHA256_CTX c;
  unsigned __int8 md[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UISTouchAuthenticationTelemetryReportRecordWithDuration(_UISTouchAuthenticationRecord * _Nonnull __strong, BOOL)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_UISTouchAuthenticationTelemetry.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  objc_msgSend(v3, "hostBundleId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {

LABEL_9:
    -[_UISTouchAuthenticationRecord analyticsPayloadWithDuration:]((uint64_t)v3, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    AnalyticsSendEventLazy();

    goto LABEL_10;
  }
  if (qword_1ECDA5900 != -1)
    dispatch_once(&qword_1ECDA5900, &__block_literal_global_9);
  v17.tv_sec = 0;
  *(_QWORD *)&v17.tv_usec = 0;
  memset(&v16, 0, sizeof(v16));
  gettimeofday(&v17, 0);
  localtime_r(&v17.tv_sec, &v16);
  data = v16.tm_yday + 366 * v16.tm_year;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &unk_1ECDA5910, 0x10u);
  CC_SHA256_Update(&c, &data, 4u);
  if (v4)
  {
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v6 = strlen(v5);
    CC_SHA256_Update(&c, v5, v6);
  }
  CC_SHA256_Final(md, &c);
  v7 = *(unsigned __int16 *)md >> 1;

  if (v7 <= 0xCCC)
    goto LABEL_9;
LABEL_10:
  if (qword_1ECDA5908 != -1)
    dispatch_once(&qword_1ECDA5908, &__block_literal_global_16);
  if (_MergedGlobals_12)
  {
    _UISViewServiceTouchAuthenticationTelemetry();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (v3 && v3[65])
        v10 = CFSTR("YES");
      -[_UISTouchAuthenticationRecord sysdiagnosePayload]((uint64_t)v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      c.count[0] = 138543618;
      *(_QWORD *)&c.count[1] = v10;
      LOWORD(c.hash[1]) = 2114;
      *(_QWORD *)((char *)&c.hash[1] + 2) = v11;
      _os_log_impl(&dword_190875000, v9, OS_LOG_TYPE_DEFAULT, "Dispatching record (authentic = %{public}@) to analytics with payload: %{public}@", (uint8_t *)&c, 0x16u);

    }
  }

}

CGImageRef UISCreateImageFromDrawing(void *a1, unint64_t a2, CGFloat a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  size_t v10;
  size_t v11;
  CFStringRef *v12;
  size_t v13;
  uint32_t v14;
  CGColorSpace *v15;
  size_t AlignedBytesPerRow;
  CGContext *v17;
  CGImageRef Image;
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
  CGAffineTransform v30;

  v5 = a1;
  objc_msgSend(v5, "drawingSize");
  v8 = v7;
  v9 = v6;
  if (v7 <= 0.0 || v6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("UISDrawing.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size.width > 0.0 && size.height > 0.0"));

  }
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("UISDrawing.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale > 0.0"));

  }
  if (a2 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("UISDrawing.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range <= UISDisplayRangeLast"));

  }
  v10 = vcvtpd_u64_f64(v8 * a3);
  v11 = vcvtpd_u64_f64(v9 * a3);
  if (a2 > 2)
  {
    v15 = 0;
    v13 = 0;
    v14 = 0;
  }
  else
  {
    v12 = (CFStringRef *)qword_1E2CAF9A0[a2];
    v13 = qword_190895908[a2];
    v14 = dword_190895938[a2];
    v15 = CGColorSpaceCreateWithName(*v12);
  }
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v17 = CGBitmapContextCreate(0, v10, v11, v13, AlignedBytesPerRow, v15, v14);
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("UISDrawing.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageContext"));

  }
  CGColorSpaceRelease(v15);
  CGContextTranslateCTM(v17, 0.0, (double)v11);
  CGContextScaleCTM(v17, a3, -a3);
  CGContextGetCTM(&v30, v17);
  CGContextSetBaseCTM();
  objc_msgSend(v5, "drawInContext:atPoint:", v17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  Image = CGBitmapContextCreateImage(v17);
  if (!Image)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("UISDrawing.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  CGContextRelease(v17);
  return Image;
}

void sub_190888C78(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id v12;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    v12 = objc_begin_catch(a1);
    NSLog(CFSTR("%s: Exception decoding INIntent during property access: %@"));

    objc_end_catch();
    JUMPOUT(0x190888C18);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x190888C1CLL);
}

void sub_190888CF8()
{
  int v0;

  if (v0)
    JUMPOUT(0x190888D00);
  JUMPOUT(0x190888D04);
}

void sub_190888EBC(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id v12;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    v12 = objc_begin_catch(a1);
    NSLog(CFSTR("%s: Exception decoding INIntent during property access: %@"));

    objc_end_catch();
    JUMPOUT(0x190888E58);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x190888E5CLL);
}

void sub_190888F3C()
{
  int v0;

  if (v0)
    JUMPOUT(0x190888F44);
  JUMPOUT(0x190888F48);
}

void sub_1908893E4(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id v12;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    v12 = objc_begin_catch(a1);
    NSLog(CFSTR("%s: Exception decoding INIntentResponse during property access: %@"));

    objc_end_catch();
    JUMPOUT(0x190889384);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x190889388);
}

void sub_1908895F0(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id v12;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    v12 = objc_begin_catch(a1);
    NSLog(CFSTR("%s: Exception decoding INIntentForwardingActionResponse during property access: %@"));

    objc_end_catch();
    JUMPOUT(0x190889590);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x190889594);
}

void __getINIntentClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  IntentsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("INIntent");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getINIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINIntentClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UISIntentForwardingAction.m"), 22, CFSTR("Unable to find class %s"), "INIntent");

    __break(1u);
  }
}

void IntentsLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!IntentsLibraryCore_frameworkLibrary)
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntentsLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UISIntentForwardingAction.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getINIntentForwardingActionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  IntentsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentForwardingAction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getINIntentForwardingActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINIntentForwardingActionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UISIntentForwardingAction.m"), 24, CFSTR("Unable to find class %s"), "INIntentForwardingAction");

    __break(1u);
  }
}

void __getINIntentResponseClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  IntentsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentResponse");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getINIntentResponseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINIntentResponseClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UISIntentForwardingAction.m"), 23, CFSTR("Unable to find class %s"), "INIntentResponse");

    __break(1u);
  }
}

void __getINIntentForwardingActionResponseClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  IntentsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentForwardingActionResponse");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getINIntentForwardingActionResponseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINIntentForwardingActionResponseClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UISIntentForwardingAction.m"), 25, CFSTR("Unable to find class %s"), "INIntentForwardingActionResponse");

    __break(1u);
  }
}

uint64_t UISSystemReferenceAngleModeForContextID(uint64_t a1)
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UISSystemReferenceAngleMode UISSystemReferenceAngleModeForContextID(uint32_t)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISSystemReferenceAngle.m"), 43, CFSTR("Must be called from the main thread."));

  }
  return objc_msgSend((id)__datasource, "_systemReferenceAngleModeForContextID:", a1);
}

uint64_t UISSystemReferenceAngleForContextID(uint64_t a1)
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat UISSystemReferenceAngleForContextID(uint32_t)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISSystemReferenceAngle.m"), 48, CFSTR("Must be called from the main thread."));

  }
  return objc_msgSend((id)__datasource, "_systemReferenceAngleForContextID:", a1);
}

const __CFString *_UISStringForSystemReferenceAngleMode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 2)
    v1 = CFSTR("Defined");
  if (a1 == 1)
    return CFSTR("Undefined");
  else
    return v1;
}

id getSBSApplicationShortcutItemClass()
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
  v0 = (void *)_MergedGlobals_13;
  v7 = _MergedGlobals_13;
  if (!_MergedGlobals_13)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSApplicationShortcutItemClass_block_invoke;
    v3[3] = &unk_1E2CAF658;
    v3[4] = &v4;
    __getSBSApplicationShortcutItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19088BFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19088C130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBSApplicationShortcutItemClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA5928)
    qword_1ECDA5928 = _sl_dlopen();
  if (!qword_1ECDA5928)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISHandleApplicationShortcutAction.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SBSApplicationShortcutItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSApplicationShortcutItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISHandleApplicationShortcutAction.m"), 23, CFSTR("Unable to find class %s"), "SBSApplicationShortcutItem");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIApplicationShortcutItemClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA5938)
    qword_1ECDA5938 = _sl_dlopen();
  if (!qword_1ECDA5938)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UIKitCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISHandleApplicationShortcutAction.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("UIApplicationShortcutItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getUIApplicationShortcutItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISHandleApplicationShortcutAction.m"), 18, CFSTR("Unable to find class %s"), "UIApplicationShortcutItem");

LABEL_8:
    __break(1u);
  }
  qword_1ECDA5930 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *UISLocalizedStringForSecureName(unsigned int a1, void *a2)
{
  id v3;
  unsigned int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v3 = a2;
  v4 = HIWORD(a1);
  if (HIWORD(a1))
  {
    v5 = CFSTR("System/Library/PrivateFrameworks/UIKitServices.framework");
    if (v4 != 1)
      v5 = 0;
    if (v4 == 2)
      v6 = CFSTR("System/Library/Frameworks/CoreLocationUI.framework");
    else
      v6 = v5;
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/", 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:relativeToURL:", v6, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E2CBB5D0, "objectAtIndexedSubscript:", HIWORD(a1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", (unsigned __int16)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedStringForKey:value:table:localization:", v12, v12, 0, v3);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_1E2CB0240;
  }

  return v13;
}

const __CFString *NSStringForUISScenePlacementType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("<none>");
  else
    return off_1E2CAFAF0[a1 - 1];
}

uint64_t UISGetColorSRGBComponents(CGColor *a1, uint64_t a2)
{
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CFStringRef Name;
  uint64_t result;
  __CFString *v8;
  uint64_t i;

  Components = CGColorGetComponents(a1);
  ColorSpace = CGColorGetColorSpace(a1);
  Name = CGColorSpaceGetName(ColorSpace);
  result = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA10]);
  if ((_DWORD)result
    || (v8 = (__CFString *)*MEMORY[0x1E0C9D960], result = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D960]), (_DWORD)result))
  {
    for (i = 0; i != 3; ++i)
      *(CGFloat *)(a2 + i * 8) = Components[i];
    *(CGFloat *)(a2 + 24) = Components[3];
  }
  else
  {
    UISCreateCachedColorTransform(v8);
    if (CGColorTransformConvertColorComponents())
    {
      *(CGFloat *)(a2 + 24) = Components[CGColorGetNumberOfComponents(a1) - 1];
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
    }
    return CGColorTransformRelease();
  }
  return result;
}

uint64_t UISIsColorInDisplayP3Gamut(CGColor *a1)
{
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CFStringRef Name;
  unint64_t v5;
  unint64_t v6;
  double v7;
  _BOOL8 v8;
  __CFString *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  Components = CGColorGetComponents(a1);
  ColorSpace = CGColorGetColorSpace(a1);
  Name = CGColorSpaceGetName(ColorSpace);
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA10]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA00]))
    return 1;
  if ((CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D960]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D958]))
    && *Components >= 0.0
    && *Components <= 1.001)
  {
    v5 = 0;
    while (v5 != 2)
    {
      v6 = v5;
      v7 = Components[v5 + 1];
      if (v7 >= 0.0)
      {
        ++v5;
        if (v7 <= 1.001)
          continue;
      }
      if (v6 > 1)
        return 1;
      goto LABEL_12;
    }
    return 1;
  }
LABEL_12:
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D908]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D9E8]))
    return 1;
  v10 = (__CFString *)*MEMORY[0x1E0C9D928];
  if ((CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D928]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D940]))
    && *Components >= 0.0
    && *Components <= 1.001)
  {
    v11 = 0;
    while (v11 != 2)
    {
      v12 = v11;
      v13 = Components[v11 + 1];
      if (v13 >= 0.0)
      {
        ++v11;
        if (v13 <= 1.001)
          continue;
      }
      if (v12 > 1)
        return 1;
      goto LABEL_25;
    }
    return 1;
  }
LABEL_25:
  UISCreateCachedColorTransform(v10);
  v8 = 0;
  if (CGColorTransformConvertColorComponents())
  {
    v8 = 0;
    if (v17 >= 0.0 && v17 <= 1.001)
    {
      v14 = 0;
      do
      {
        v15 = v14;
        if (v14 == 2)
          break;
        v16 = *(double *)&v18[v14];
        if (v16 < 0.0)
          break;
        ++v14;
      }
      while (v16 <= 1.001);
      v8 = v15 > 1;
    }
  }
  CGColorTransformRelease();
  return v8;
}

CGColorRef UISCreateColorWithLuminance(CGColor *a1, double a2, CGFloat a3)
{
  CGColorSpace *ColorSpace;
  size_t NumberOfComponents;
  const CGFloat *v8;
  CFStringRef Name;
  const void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t i;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double *v20;
  __CFString *v21;
  const __CFString *v22;
  CGColorRef v23;
  int8x16_t v25;
  uint64_t v26;
  float64x2_t v27;
  int8x16_t v28;
  double v29;
  int8x16_t v30;
  uint64_t v31;
  float64x2_t v32;
  int8x16_t v33;
  double v34;
  CGColorSpace *v35;
  int v36;
  CGColorSpace *v37;
  int8x16_t v38;
  int8x16_t v39;
  CGFloat components[2];
  double v41;
  CGFloat v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  ColorSpace = CGColorGetColorSpace(a1);
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  v8 = CGColorGetComponents(a1);
  Name = CGColorSpaceGetName(ColorSpace);
  v10 = (const void *)*MEMORY[0x1E0C9DA00];
  v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA00]);
  if ((_DWORD)v11
    || (v12 = (__CFString *)*MEMORY[0x1E0C9D958], v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D958]), (_DWORD)v11))
  {
    for (i = 0; i != 3; ++i)
      components[i] = v8[i];
  }
  else
  {
    v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9DA10]);
    if ((_DWORD)v11 || (v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E0C9D960]), (_DWORD)v11))
    {
      v26 = 0;
      v27.f64[0] = NAN;
      v27.f64[1] = NAN;
      v28 = (int8x16_t)vnegq_f64(v27);
      v38 = v28;
      do
      {
        *(CGFloat *)v25.i64 = v8[v26];
        v29 = fabs(*(double *)v25.i64);
        if (v29 >= 0.04045)
        {
          v39 = v25;
          v27.f64[0] = pow(v29 * 0.947867 + 0.0521327, 2.4);
          v28 = v38;
          v25 = v39;
        }
        else
        {
          v27.f64[0] = v29 * 0.0773994;
        }
        v27 = (float64x2_t)vbslq_s8(v28, (int8x16_t)v27, v25);
        components[v26++] = v27.f64[0];
      }
      while (v26 != 3);
    }
    else
    {
      UISCreateCachedColorTransform(v12);
      CGColorTransformConvertColorComponents();
      v11 = CGColorTransformRelease();
    }
  }
  v14 = fmin(fmax(components[0] * 0.222495198 + components[1] * 0.716895044 + v41 * 0.0606097579, 0.0), 1.0);
  if (v14 <= a2)
  {
    if (v14 >= a2)
      return CGColorCreateCopyWithAlpha(a1, a3);
    v17 = 0;
    v18 = (a2 + -1.0) / (v14 + -1.0);
    do
    {
      components[v17] = 1.0 - v18 + v18 * components[v17];
      ++v17;
    }
    while (v17 != 3);
  }
  else
  {
    v15 = 0;
    v16 = a2 / v14;
    do
    {
      components[v15] = v16 * components[v15];
      ++v15;
    }
    while (v15 != 3);
  }
  MEMORY[0x1E0C80A78](v11);
  v20 = (double *)((char *)v38.i64 - ((v19 + 23) & 0xFFFFFFFFFFFFFFF0));
  v21 = (__CFString *)CGColorSpaceGetName(ColorSpace);
  if (CFEqual(v21, v10)
    || (v22 = (const __CFString *)*MEMORY[0x1E0C9D958], CFEqual(v21, (CFTypeRef)*MEMORY[0x1E0C9D958])))
  {
    *(_OWORD *)v20 = *(_OWORD *)components;
    v20[2] = v41;
  }
  else if (CFEqual(v21, (CFTypeRef)*MEMORY[0x1E0C9DA10]) || CFEqual(v21, (CFTypeRef)*MEMORY[0x1E0C9D960]))
  {
    v31 = 0;
    v32.f64[0] = NAN;
    v32.f64[1] = NAN;
    v33 = (int8x16_t)vnegq_f64(v32);
    v38 = v33;
    do
    {
      *(CGFloat *)v30.i64 = components[v31];
      v34 = fabs(*(double *)v30.i64);
      if (v34 >= 0.0031308)
      {
        v39 = v30;
        v32.f64[0] = pow(v34 * 1.13712, 0.416667);
        v33 = v38;
        v30 = v39;
        v32.f64[0] = v32.f64[0] + -0.055;
      }
      else
      {
        v32.f64[0] = v34 * 12.92;
      }
      v32 = (float64x2_t)vbslq_s8(v33, (int8x16_t)v32, v30);
      v20[v31++] = v32.f64[0];
    }
    while (v31 != 3);
  }
  else
  {
    if (v21)
      UISCreateCachedColorTransform(v21);
    else
      MEMORY[0x19401058C](ColorSpace, 0);
    v35 = CGColorSpaceCreateWithName(v22);
    v36 = CGColorTransformConvertColorComponents();
    CGColorTransformRelease();
    CGColorSpaceRelease(v35);
    if (!v36)
    {
      v42 = a3;
      v37 = CGColorSpaceCreateWithName(v22);
      v23 = CGColorCreate(v37, components);
      CGColorSpaceRelease(v37);
      return v23;
    }
  }
  v20[NumberOfComponents] = a3;
  return CGColorCreate(ColorSpace, v20);
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA5978)
    qword_1ECDA5978 = _sl_dlopen();
  if (!qword_1ECDA5978)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISDisplayContext.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CADisplay");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCADisplayClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISDisplayContext.m"), 21, CFSTR("Unable to find class %s"), "CADisplay");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19088F710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFBProcessManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA5998)
    qword_1ECDA5998 = _sl_dlopen();
  if (!qword_1ECDA5998)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISApplicationSupportService.m"), 31, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("FBProcessManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBProcessManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISApplicationSupportService.m"), 32, CFSTR("Unable to find class %s"), "FBProcessManager");

LABEL_8:
    __break(1u);
  }
  qword_1ECDA5990 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id _UISSlotMachineServiceLogger()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[4] = &_UISSlotMachineServiceLogger_logging;
  v1[5] = "slotMachineService";
  if (_UISSlotMachineServiceLogger_logging != -1)
    dispatch_once(&_UISSlotMachineServiceLogger_logging, v1);
  return (id)qword_1EE1E5080;
}

id _UISUserInterfaceStyleModeServiceLogger()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[4] = &_UISUserInterfaceStyleModeServiceLogger_logging;
  v1[5] = "userInterfaceStyleModeService";
  if (_UISUserInterfaceStyleModeServiceLogger_logging != -1)
    dispatch_once(&_UISUserInterfaceStyleModeServiceLogger_logging, v1);
  return (id)qword_1EE1E5090;
}

id _UISViewServiceHitTestLogger()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[4] = &_UISViewServiceHitTestLogger_logging;
  v1[5] = "viewServiceHitTest";
  if (_UISViewServiceHitTestLogger_logging != -1)
    dispatch_once(&_UISViewServiceHitTestLogger_logging, v1);
  return (id)qword_1EE1E5040;
}

id _UISViewServiceTouchAuthenticationTelemetry()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[4] = &_UISViewServiceTouchAuthenticationTelemetry_logging;
  v1[5] = "viewServiceTouchAuthenticationTelemetry";
  if (_UISViewServiceTouchAuthenticationTelemetry_logging != -1)
    dispatch_once(&_UISViewServiceTouchAuthenticationTelemetry_logging, v1);
  return (id)qword_1EE1E50A0;
}

void sub_190891508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _UISNearlyEqual(double a1, double a2)
{
  _BOOL4 v2;

  v2 = ((*(uint64_t *)&a1 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(_QWORD *)&a1)
     - ((*(uint64_t *)&a2 >> 63) & 0x7FFFFFFFFFFFFFFFuLL ^ *(_QWORD *)&a2) < 0xB;
  if (a1 <= a2)
    v2 = ((*(uint64_t *)&a2 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(_QWORD *)&a2)
       - ((*(uint64_t *)&a1 >> 63) & 0x7FFFFFFFFFFFFFFFuLL ^ *(_QWORD *)&a1) < 0xB;
  return a1 == a2 || v2;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22A08]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22A18]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22A20]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D22A48]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1E0D22A58]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D22A60]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D22A88]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D22AA8]();
}

uint64_t BSHashPurifyNS()
{
  return MEMORY[0x1E0D22AB8]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1E0D22AE8]();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return MEMORY[0x1E0D22B20]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B28]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B38]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D22B40]();
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0CD2600](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1E0CD2620](t);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring(CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97E10](alloc, aStr, range.location, range.length);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1E0C97E48](aStr);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1E0C9BA98](retstr, transform);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1E0C9BD10](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1E0C9BF80]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1E0C9BFA0]();
}

uint64_t CGColorTransformRetain()
{
  return MEMORY[0x1E0C9BFA8]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x1E0C9C010](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
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

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1E0C9C430]();
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1E0C9D3E0]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1E0CA7B20]();
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1E0CA7B40]();
}

uint64_t CTFontGetAscentForSystemFontOfSize()
{
  return MEMORY[0x1E0CA7BA8]();
}

uint64_t CTFontGetDescentForSystemFontOfSize()
{
  return MEMORY[0x1E0CA7BE0]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
  MEMORY[0x1E0CA7DA0](frame, context);
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x1E0CA7DA8](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

uint64_t CTLineCreateFromLineWithOffset()
{
  return MEMORY[0x1E0CA7E50]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1E0CA7E60](line, justificationFactor, justificationWidth);
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1E0CA7E80]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1E0CA7E98]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

uint64_t CTLineGetDefaultBounds()
{
  return MEMORY[0x1E0CA7EC8]();
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x1E0CA7EF0](line, flushFactor, flushWidth);
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA7F08](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

uint64_t CTLineIsRightToLeft()
{
  return MEMORY[0x1E0CA7F30]();
}

uint64_t CTLineSuggestClusterBreakWithOffset()
{
  return MEMORY[0x1E0CA7F38]();
}

uint64_t CTLineSuggestLineBreakWithOffset()
{
  return MEMORY[0x1E0CA7F48]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void operator delete(void *__p)
{
  off_1E2CAEC90(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E2CAEC98(__sz);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1E0C81770](name, attrs, cache_out);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1E0C81788](cache, key, value_out);
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1E0C817D8](cache, value);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1E0C817F8](cache, key, value, cost);
}

uint64_t cache_set_count_hint()
{
  return MEMORY[0x1E0C81808]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

