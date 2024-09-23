_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B6F6F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B6F704](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1BCFA743C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCFA82F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFA89A4(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("lock"));
  _Unwind_Resume(a1);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

BOOL TPNumberPadKeyResetLocale()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0D3EFB0];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberingSystemForLocaleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  useIndicDigits = objc_msgSend(v3, "isEqualToString:", CFSTR("latn")) ^ 1;

  return TPNumberPadKeyInitializeMetrics();
}

BOOL TPNumberPadKeyInitializeMetrics()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _BOOL8 result;

  if (thinFont)
    CFRelease((CFTypeRef)thinFont);
  if (lightFont)
    CFRelease((CFTypeRef)lightFont);
  if (regularFont)
    CFRelease((CFTypeRef)regularFont);
  if (semiBoldFont)
    CFRelease((CFTypeRef)semiBoldFont);
  if (boldFont)
    CFRelease((CFTypeRef)boldFont);
  thinFont = CTFontDescriptorCreateWithTextStyle();
  lightFont = CTFontDescriptorCreateWithTextStyle();
  regularFont = CTFontDescriptorCreateWithTextStyle();
  semiBoldFont = CTFontDescriptorCreateWithTextStyle();
  boldFont = CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)whiteColor;
  whiteColor = v0;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)blackColor;
  blackColor = v2;

  result = UIAccessibilityIsBoldTextEnabled();
  isBold = result;
  return result;
}

id TPDefaultLog()
{
  if (TPDefaultLog_onceToken != -1)
    dispatch_once(&TPDefaultLog_onceToken, &__block_literal_global_5);
  return (id)TPDefaultLog_TPDefaultLog;
}

void sub_1BCFAB660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFAB87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFAB95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFABA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFABB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *_TPInComingCallUISnapshotOverlayAttachmentIdentifierStringForStyle(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("TPUI_MobileLabel");
  if (a1 != 2)
    v1 = 0;
  if (a1 == 3)
    return CFSTR("TPUI_MobileLabelAndBottomBarAndInfoLabel");
  else
    return v1;
}

void sub_1BCFAE86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFAEC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFAFA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr;
  v6 = getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr;
  if (!getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr)
  {
    v1 = (void *)PosterBoardUIServicesLibrary();
    v0 = (id *)dlsym(v1, "PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel");
    v4[3] = (uint64_t)v0;
    getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel_cold_1();
  return *v0;
}

void sub_1BCFAFC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFB01F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCFB0BE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterLabelClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E75FD068;
    v5 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary)
    __getPRPosterLabelClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PRPosterLabel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRPosterLabelClass_block_invoke_cold_2();
  getPRPosterLabelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNImageDerivedColorGeneratorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E75FD080;
    v5 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsUILibraryCore_frameworkLibrary)
    __getCNImageDerivedColorGeneratorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CNImageDerivedColorGenerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNImageDerivedColorGeneratorClass_block_invoke_cold_2();
  getCNImageDerivedColorGeneratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterBoardUIServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E75FD098;
    v3 = 0;
    PosterBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
    PosterBoardUIServicesLibrary_cold_1(&v1);
  return PosterBoardUIServicesLibraryCore_frameworkLibrary;
}

Class __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISPosterAppearanceObservingAttachmentProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke_cold_1();
  getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

Class __getPRUISIncomingCallPosterContextClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISIncomingCallPosterContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISIncomingCallPosterContextClass_block_invoke_cold_1();
  getPRUISIncomingCallPosterContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISIncomingCallSnapshotDefinition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke_cold_1();
  getPRUISIncomingCallSnapshotDefinitionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISMutablePosterSnapshotRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISMutablePosterSnapshotRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISMutablePosterSnapshotRequestClass_block_invoke_cold_1();
  getPRUISMutablePosterSnapshotRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISPosterAttachmentConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISPosterAttachmentConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISPosterAttachmentConfigurationClass_block_invoke_cold_1();
  getPRUISPosterAttachmentConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISPosterSnapshotControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterBoardUIServicesLibrary();
  result = objc_getClass("PRUISPosterSnapshotController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1();
  getPRUISPosterSnapshotControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

id TPCreateImageWithDrawing(void *a1, double a2, double a3, double a4)
{
  void (**v7)(id, CGContext *, double, double, double, double);
  void *v8;
  double v9;
  CGContext *CGContext;
  size_t Width;
  size_t Height;
  CGImage *Image;
  void *v14;

  v7 = a1;
  if (fabs(a4) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    a4 = v9;

  }
  CGContext = TPImageDrawingCreateCGContext(a2, a3, a4);
  Width = CGBitmapContextGetWidth(CGContext);
  Height = CGBitmapContextGetHeight(CGContext);
  if (v7)
    v7[2](v7, CGContext, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), (double)Width, (double)Height);
  Image = CGBitmapContextCreateImage(CGContext);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGContextRelease(CGContext);

  return v14;
}

CGContext *TPImageDrawingCreateCGContext(double a1, double a2, double a3)
{
  double v3;
  void *v6;
  double v7;
  CGColorSpace *DeviceRGB;
  CGContext *v9;

  v3 = a3;
  if (fabs(a3) < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v3 = v7;

  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(0, vcvtpd_u64_f64(a1 * v3), vcvtpd_u64_f64(a2 * v3), 8uLL, 0, DeviceRGB, 0x2002u);
  CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
  CGContextSetFillColorSpace(v9, DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

uint64_t _MKBGetDeviceLockState()
{
  uint64_t (*v0)(_QWORD);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v6 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v2[3] = &unk_1E75FD048;
    v2[4] = &v3;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(_QWORD))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    _MKBGetDeviceLockState_cold_1();
  return v0(0);
}

void sub_1BCFB992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E75FD2C8;
    v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MobileKeyBagLibraryCore_frameworkLibrary, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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

void sub_1BCFBB924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TelephonyUIBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__TelephonyUIBundle;
  if (!__TelephonyUIBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__TelephonyUIBundle;
    __TelephonyUIBundle = v1;

    v0 = (void *)__TelephonyUIBundle;
  }
  return v0;
}

uint64_t TPIsUnknown()
{
  if (TPIsUnknown_onceToken != -1)
    dispatch_once(&TPIsUnknown_onceToken, &__block_literal_global_2);
  return TPIsUnknown_isUnknown;
}

double TPMainScreenScale()
{
  if (TPMainScreenScale_once != -1)
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_12);
  return *(double *)&TPMainScreenScale_sMainScreenScale;
}

double TPPixelCGCeiling(double a1)
{
  if (TPMainScreenScale_once != -1)
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_12);
  return ceil(*(double *)&TPMainScreenScale_sMainScreenScale * a1) / *(double *)&TPMainScreenScale_sMainScreenScale;
}

double TPPixelCGFloor(double a1)
{
  if (TPMainScreenScale_once != -1)
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_12);
  return floor(*(double *)&TPMainScreenScale_sMainScreenScale * a1) / *(double *)&TPMainScreenScale_sMainScreenScale;
}

CGFloat TPRectIntegral(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  void *v8;
  double v9;
  CGRect v11;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  if (v9 == 1.0)
  {
    v11.origin.x = a1;
    v11.origin.y = a2;
    v11.size.width = a3;
    v11.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectIntegral(v11);
  }

  return a1;
}

uint64_t _SoundCompletedPlaying(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_notifySoundCompletionIfNecessary:", a1);
}

uint64_t __TPStopSoundForKeyCallback(int a1, void *a2)
{
  return objc_msgSend(a2, "_stopSoundForKey:", a1);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id __imageForRoundedRectProperties(uint64_t a1)
{
  BOOL v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[7];

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIImage *__imageForRoundedRectProperties(_TPRoundedRectImageProperties *)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("TPRevealingRingView.m"), 78, CFSTR("Properties cannot be nil"));

  }
  v2 = *MEMORY[0x1E0C9D820] == *(double *)a1 && *(double *)(MEMORY[0x1E0C9D820] + 8) == *(double *)(a1 + 8);
  if (v2 || !__TPRoundedRectPathIsValid((CGRect *)(a1 + 16)))
  {
    v15 = 0;
  }
  else
  {
    if (__imageForRoundedRectProperties___once != -1)
      dispatch_once(&__imageForRoundedRectProperties___once, &__block_literal_global_10);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    BSSizeCeilForScale();
    v5 = v4;
    v7 = v6;

    v8 = (void *)__imageForRoundedRectProperties___imageCache;
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(double *)a1;
    v11 = *(_QWORD *)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__path{rect=[{%.2f,%.2f}{%.2f,%.2f}],radius:%.2f}"), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__path{rect=[{%.2f,%.2f}{%.2f,%.2f}],radius:%.2f}"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("__key{size={%.2f,%.2f},op=%@,ip=%@,circle:%d,drawsOutside:%d}"), *(_QWORD *)&v10, v11, v12, v13, *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ____imageForRoundedRectProperties_block_invoke_2;
    v19[3] = &__block_descriptor_56_e18___UIImage_16__0_Q8l;
    v19[4] = v5;
    v19[5] = v7;
    v19[6] = a1;
    objc_msgSend(v8, "imageForKey:generatingIfNecessaryWithBlock:", v14, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void ____imageForRoundedRectProperties_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D01930]);
  +[TPRevealingRingView classIdentifier](TPRevealingRingView, "classIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithUniqueIdentifier:", v3);
  v2 = (void *)__imageForRoundedRectProperties___imageCache;
  __imageForRoundedRectProperties___imageCache = v1;

}

id ____imageForRoundedRectProperties_block_invoke_2(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 32), 0, v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  v5 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v5 + 97))
  {
    v10.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v10.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v10.size.width = *(CGFloat *)(a1 + 32);
    v10.size.height = *(CGFloat *)(a1 + 40);
    UIRectFill(v10);
    __bezierPathFromInfo(*(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 96), (double *)(*(_QWORD *)(a1 + 48) + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillWithBlendMode:alpha:", 16, 1.0);
  }
  else
  {
    __bezierPathFromInfo(*(unsigned __int8 *)(v5 + 96), (double *)(v5 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (__TPRoundedRectPathIsValid((CGRect *)(*(_QWORD *)(a1 + 48) + 56)))
    {
      __bezierPathFromInfo(*(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 96), (double *)(*(_QWORD *)(a1 + 48) + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendPath:", v7);

      objc_msgSend(v6, "setUsesEvenOddFillRule:", 1);
    }
    objc_msgSend(v6, "fill");
  }

  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

id __bezierPathFromInfo(int a1, double *a2)
{
  if (a1)
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *a2, a2[1], a2[2], a2[3]);
  else
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *a2, a2[1], a2[2], a2[3], a2[4]);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __TPRoundedRectPathIsValid(CGRect *a1)
{
  if (CGRectEqualToRect(*a1, *MEMORY[0x1E0C9D628]))
    return 0;
  if (a1->size.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return a1->size.width != *MEMORY[0x1E0C9D820];
  return 1;
}

id getPRIncomingCallTextViewAdapterWrapperClass()
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
  v0 = (void *)getPRIncomingCallTextViewAdapterWrapperClass_softClass;
  v7 = getPRIncomingCallTextViewAdapterWrapperClass_softClass;
  if (!getPRIncomingCallTextViewAdapterWrapperClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke;
    v3[3] = &unk_1E75FD048;
    v3[4] = &v4;
    __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BCFC7260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPRIncomingCallMetricsProviderClass()
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
  v0 = (void *)getPRIncomingCallMetricsProviderClass_softClass;
  v7 = getPRIncomingCallMetricsProviderClass_softClass;
  if (!getPRIncomingCallMetricsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallMetricsProviderClass_block_invoke;
    v3[3] = &unk_1E75FD048;
    v3[4] = &v4;
    __getPRIncomingCallMetricsProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BCFC7544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterKitLibrary();
  result = objc_getClass("PRIncomingCallTextViewAdapterWrapper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1();
  getPRIncomingCallTextViewAdapterWrapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PosterKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!PosterKitLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_1E75FD620;
    v2 = 0;
    PosterKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary_0)
    PosterKitLibrary_cold_1(&v0);
}

Class __getPRIncomingCallMetricsProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterKitLibrary();
  result = objc_getClass("PRIncomingCallMetricsProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
  getPRIncomingCallMetricsProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _userNotificationHandler(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_msgSend((id)pendingAlerts, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "userNotification") == a1)
        {
          switch(a2)
          {
            case 0:
              objc_msgSend(v9, "defaultResponse");
              v10 = 1;
              break;
            case 1:
              objc_msgSend(v9, "alternateResponse");
              v10 = 2;
              break;
            case 2:
              objc_msgSend(v9, "otherResponse");
              v10 = 3;
              break;
            case 3:
              v10 = 4;
              break;
            default:
              v10 = 0;
              break;
          }
          objc_msgSend((id)pendingAlerts, "removeObject:", v9);
          objc_msgSend(v9, "completion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v9, "completion");
            v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v12[2](v12, v10);

          }
          goto LABEL_18;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

}

uint64_t _SoundCompletedPlaying_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "soundCompletedPlaying:", a1);
}

uint64_t __TPStopSoundForKeyCallback_0(int a1, void *a2)
{
  return objc_msgSend(a2, "stopSoundForDialerCharacter:", a1);
}

id TPStringForNumberPadCharacter(int a1)
{
  void *v2;

  if (TPStringForNumberPadCharacter_onceToken[0] != -1)
    dispatch_once(TPStringForNumberPadCharacter_onceToken, &__block_literal_global_13);
  if (a1 >= (unint64_t)objc_msgSend((id)TPStringForNumberPadCharacter_numberPadStrings, "count"))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend((id)TPStringForNumberPadCharacter_numberPadStrings, "objectAtIndexedSubscript:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

BOOL static RecentsCallItemStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RecentsCallItemStyle.hash(into:)()
{
  return sub_1BCFE2C50();
}

uint64_t RecentsCallItemStyle.hashValue.getter()
{
  sub_1BCFE2C44();
  sub_1BCFE2C50();
  return sub_1BCFE2C5C();
}

BOOL sub_1BCFCC2BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BCFCC2D0()
{
  sub_1BCFE2C44();
  sub_1BCFE2C50();
  return sub_1BCFE2C5C();
}

uint64_t sub_1BCFCC314()
{
  return sub_1BCFE2C50();
}

uint64_t sub_1BCFCC33C()
{
  sub_1BCFE2C44();
  sub_1BCFE2C50();
  return sub_1BCFE2C5C();
}

unint64_t sub_1BCFCC380()
{
  unint64_t result;

  result = qword_1EF4A52D8;
  if (!qword_1EF4A52D8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsCallItemStyle, &type metadata for RecentsCallItemStyle);
    atomic_store(result, (unint64_t *)&qword_1EF4A52D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RecentsCallItemStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecentsCallItemStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1BCFCC4A0 + 4 * byte_1BCFE7525[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BCFCC4D4 + 4 * byte_1BCFE7520[v4]))();
}

uint64_t sub_1BCFCC4D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFCC4DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCFCC4E4);
  return result;
}

uint64_t sub_1BCFCC4F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCFCC4F8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BCFCC4FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFCC504(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFCC510(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1BCFCC51C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecentsCallItemStyle()
{
  return &type metadata for RecentsCallItemStyle;
}

uint64_t dispatch thunk of RecentsCallItemProviding.applicationIcon.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.itemStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.subtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.senderIdentity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.occurrenceCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.titleColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.callStatus.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = (*(uint64_t (**)(void))(a2 + 64))();
  return v2 | ((HIDWORD(v2) & 1) << 32);
}

uint64_t dispatch thunk of RecentsCallItemProviding.mediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.ttyType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.verificationStatus.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.shouldShowDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.extraSubtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.extraSubtitleWithDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.messageIndicatorViewModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_1BCFCC62C()
{
  id v0;
  uint64_t v1;

  sub_1BCFCC6BC();
  v0 = sub_1BCFDC98C();
  v1 = sub_1BCFE26EC();

  return v1;
}

unint64_t sub_1BCFCC6BC()
{
  unint64_t result;

  result = qword_1EF4A57D0;
  if (!qword_1EF4A57D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4A57D0);
  }
  return result;
}

uint64_t dispatch thunk of AvatarViewController.contacts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1BCFCC700()
{
  uint64_t v0;

  v0 = sub_1BCFE27B8();
  __swift_allocate_value_buffer(v0, qword_1EF4A64B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A64B8);
  return sub_1BCFE27A0();
}

BOOL static TPTipsHelper.Entry.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TPTipsHelper.Entry.Kind.hash(into:)()
{
  return sub_1BCFE2C50();
}

uint64_t TPTipsHelper.Entry.Kind.hashValue.getter()
{
  sub_1BCFE2C44();
  sub_1BCFE2C50();
  return sub_1BCFE2C5C();
}

void TPTipsHelper.Entry.kind.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t TPTipsHelper.Entry.tip.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCFCC810(v1 + 8, a1);
}

uint64_t sub_1BCFCC810(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TPTipsHelper.Entry.observationTask.getter()
{
  return swift_retain();
}

uint64_t TPTipsHelper.Entry.init(_:tip:observationTask:)@<X0>(_BYTE *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;

  *(_BYTE *)a4 = *a1;
  result = sub_1BCFCC898(a2, a4 + 8);
  *(_QWORD *)(a4 + 48) = a3;
  return result;
}

uint64_t sub_1BCFCC898(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t static TPTipsHelper.shared.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B0);
  v0[2] = swift_task_alloc();
  v1 = sub_1BCFE2B90();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v0[6] = sub_1BCFE2AAC();
  v0[7] = sub_1BCFE2AA0();
  v0[8] = sub_1BCFE2A70();
  v0[9] = v2;
  return swift_task_switch();
}

uint64_t sub_1BCFCC968()
{
  uint64_t v0;
  id v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  if (qword_1EF4A64F0)
  {
    v1 = (id)qword_1EF4A64F0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v1);
  }
  else
  {
    if (qword_1EF4A64D0 != -1)
      swift_once();
    v3 = sub_1BCFE27B8();
    __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A64B8);
    v4 = sub_1BCFE2794();
    v5 = sub_1BCFE2B3C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BCFA3000, v4, v5, "TipKit is initializing", v6, 2u);
      MEMORY[0x1C3B6F770](v6, -1, -1);
    }

    sub_1BCFE2B84();
    v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EF4A57E0 + dword_1EF4A57E0);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v7;
    *v7 = v0;
    v7[1] = sub_1BCFCCAF0;
    return v8(1000000000000000000, 0, 0, 0, 1);
  }
}

uint64_t sub_1BCFCCAF0()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v4 = v2[4];
  v3 = v2[5];
  v5 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[5], v2[3]);
  }
  return swift_task_switch();
}

uint64_t sub_1BCFCCB90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  sub_1BCFE2AB8();
  v2 = sub_1BCFE2ADC();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
  v3 = sub_1BCFE2AA0();
  v4 = swift_allocObject();
  v5 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v5;
  sub_1BCFCD298(v1, (uint64_t)&unk_1EF4A57F0, v4);
  swift_release();
  v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPTipsHelper()), sel_init);
  v7 = (void *)qword_1EF4A64F0;
  qword_1EF4A64F0 = (uint64_t)v6;
  v8 = v6;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v8);
}

uint64_t sub_1BCFCCC74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_1BCFE2B78();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_1BCFCCD18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_1BCFE2B90();
  sub_1BCFD2580(&qword_1EF4A4F18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0BA0], MEMORY[0x1E0DF0BB0]);
  sub_1BCFE2C20();
  sub_1BCFD2580(&qword_1EF4A4F10, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0B60], MEMORY[0x1E0DF0B90]);
  sub_1BCFE2B9C();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_1BCFCCE30;
  return sub_1BCFE2C2C();
}

uint64_t sub_1BCFCCE30()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1BCFCCEDC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFCCF18()
{
  uint64_t v0;

  sub_1BCFE2AAC();
  *(_QWORD *)(v0 + 16) = sub_1BCFE2AA0();
  sub_1BCFE2A70();
  return swift_task_switch();
}

uint64_t sub_1BCFCCF80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F40);
  sub_1BCFE292C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7630;
  v0 = sub_1BCFE28CC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = swift_task_alloc();
  sub_1BCFE28C0();
  sub_1BCFE28D8();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  swift_task_dealloc();
  v3 = sub_1BCFE28F0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = swift_task_alloc();
  sub_1BCFE28E4();
  sub_1BCFE28FC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  swift_task_dealloc();
  v6 = sub_1BCFE2914();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = swift_task_alloc();
  sub_1BCFE2908();
  sub_1BCFE2920();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  swift_task_dealloc();
  sub_1BCFE29E0();
  swift_bridgeObjectRelease();
  if (qword_1EF4A64D0 != -1)
    swift_once();
  v9 = sub_1BCFE27B8();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EF4A64B8);
  v10 = sub_1BCFE2794();
  v11 = sub_1BCFE2B3C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1BCFA3000, v10, v11, "TipKit has been initialized", v12, 2u);
    MEMORY[0x1C3B6F770](v12, -1, -1);
  }

  return (*(uint64_t (**)(void))(v14 + 8))();
}

uint64_t sub_1BCFCD230()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BCFCD254()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1BCFD25D8;
  return sub_1BCFCCF18();
}

uint64_t sub_1BCFCD298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1BCFE2ADC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1BCFE2AD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1BCFD248C(a1, &qword_1EF4A53B0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BCFE2A70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1BCFCD3E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1BCFE2ADC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1BCFE2AD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1BCFD248C(a1, &qword_1EF4A53B0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BCFE2A70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A5888);
  return swift_task_create();
}

id TPTipsHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t type metadata accessor for TPTipsHelper()
{
  return objc_opt_self();
}

uint64_t sub_1BCFCD578()
{
  uint64_t result;

  result = sub_1BCFCD594();
  qword_1EF4A5B10 = result;
  return result;
}

uint64_t sub_1BCFCD594()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_1BCFE2ADC();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TaskQueue();
  sub_1BCFE2AC4();
  v3 = TaskQueue.__allocating_init(priority:)((uint64_t)v2);
  if (qword_1EF4A64D0 != -1)
    swift_once();
  v4 = sub_1BCFE27B8();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EF4A64B8);
  v5 = sub_1BCFE2794();
  v6 = sub_1BCFE2B3C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCFA3000, v5, v6, "Starting TipKitHelper taskQueue with delayed start.", v7, 2u);
    MEMORY[0x1C3B6F770](v7, -1, -1);
  }

  (*(void (**)(void *, _QWORD))(*(_QWORD *)v3 + 128))(&unk_1EF4A58A8, 0);
  return v3;
}

uint64_t sub_1BCFCD6D8()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_1BCFE2B90();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1BCFCD734()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_1BCFE2B84();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EF4A57E0 + dword_1EF4A57E0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1BCFCD7B4;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_1BCFCD7B4()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  swift_task_dealloc();
  v4 = *(_QWORD *)(v2 + 24);
  v3 = *(_QWORD *)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 16);
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 16));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_1BCFCD86C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t *sub_1BCFCD8A0()
{
  if (qword_1EF4A5B18 != -1)
    swift_once();
  return &qword_1EF4A5B10;
}

uint64_t static TPTipsHelper.taskQueue.getter()
{
  if (qword_1EF4A5B18 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_1BCFCD920()
{
  return 0;
}

void *sub_1BCFCD970()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1BCFCDA18(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t sub_1BCFCDA68@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x68))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFCDAA8(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x70);
  v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1BCFCDAF4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_1BCFCDB38()
{
  return sub_1BCFD14A4(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1BCFCDB44@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFCDB84(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x88);
  v3 = sub_1BCFE2818();
  return v2(v3);
}

uint64_t sub_1BCFCDBC4()
{
  return sub_1BCFCDCB8();
}

uint64_t sub_1BCFCDBD0(uint64_t a1)
{
  return sub_1BCFCDD08(a1, &OBJC_IVAR___TPTipsHelper_Swift_entries);
}

uint64_t (*sub_1BCFCDBDC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_1BCFCDC20()
{
  return sub_1BCFD15A4(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1BCFCDC2C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x98))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFCDC6C(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA0);
  v3 = sub_1BCFE2818();
  return v2(v3);
}

uint64_t sub_1BCFCDCAC()
{
  return sub_1BCFCDCB8();
}

uint64_t sub_1BCFCDCB8()
{
  swift_beginAccess();
  return sub_1BCFE2818();
}

uint64_t sub_1BCFCDCFC(uint64_t a1)
{
  return sub_1BCFCDD08(a1, &OBJC_IVAR___TPTipsHelper_Swift_currentTip);
}

uint64_t sub_1BCFCDD08(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCFCDD54())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BCFCDDA0(unsigned __int8 *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  unsigned __int8 v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  _QWORD *v9;
  void (*v10)(_OWORD *, _QWORD);
  uint64_t *v11;
  uint64_t *v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v4 = *a1;
  v5 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v6 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x80))();
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_1BCFD03AC(v4), (v8 & 1) != 0))
  {
    v9 = *(_QWORD **)(*(_QWORD *)(v6 + 56) + 8 * v7);
    sub_1BCFE2818();
    swift_bridgeObjectRelease();
    if (!v9)
      return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = (void (*)(_OWORD *, _QWORD))(*(uint64_t (**)(_OWORD *))((*v5 & *v2) + 0x90))(v21);
    v12 = v11;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v12;
    *v12 = 0x8000000000000000;
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    sub_1BCFD0DD4(MEMORY[0x1E0DEE9D8], v4, isUniquelyReferenced_nonNull_native);
    *v12 = v23;
    swift_bridgeObjectRelease();
    v10(v21, 0);
  }
  sub_1BCFD169C((uint64_t)a1, (uint64_t)v21);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = sub_1BCFD0284(0, v9[2] + 1, 1, v9);
  v15 = v9[2];
  v14 = v9[3];
  if (v15 >= v14 >> 1)
    v9 = sub_1BCFD0284((_QWORD *)(v14 > 1), v15 + 1, 1, v9);
  v9[2] = v15 + 1;
  v16 = &v9[7 * v15];
  v17 = v21[0];
  v18 = v21[1];
  v19 = v21[2];
  v16[10] = v22;
  *((_OWORD *)v16 + 3) = v18;
  *((_OWORD *)v16 + 4) = v19;
  *((_OWORD *)v16 + 2) = v17;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCFCDF40(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14[2];
  uint64_t v15;

  v3 = v2;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_1BCFCC898((__int128 *)a1, (uint64_t)v14);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v2;
    *v2 = 0x8000000000000000;
    sub_1BCFD0F08(v14, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BCFD248C(a1, &qword_1EF4A4EC8);
    v7 = sub_1BCFD03AC(a2);
    if ((v8 & 1) != 0)
    {
      v9 = v7;
      v10 = swift_isUniquelyReferenced_nonNull_native();
      v11 = *v2;
      v13 = *v3;
      *v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_1BCFD122C();
        v11 = v13;
      }
      sub_1BCFCC898((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v9), (uint64_t)v14);
      sub_1BCFD0C08(v9, v11);
      *v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = 0;
      memset(v14, 0, sizeof(v14));
    }
    return sub_1BCFD248C((uint64_t)v14, &qword_1EF4A4EC8);
  }
}

uint64_t sub_1BCFCE058(char *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  char v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_OWORD *, _QWORD);
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t (*v18)(uint64_t *, _QWORD);
  uint64_t v20[4];
  _OWORD v21[2];
  uint64_t v22;

  v2 = v1;
  v3 = *a1;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x80))();
  if (!*(_QWORD *)(v5 + 16))
    return swift_bridgeObjectRelease();
  v6 = sub_1BCFD03AC(v3);
  if ((v7 & 1) == 0)
    return swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v10 = v8 + 32;
    do
    {
      sub_1BCFD169C(v10, (uint64_t)v21);
      swift_retain();
      sub_1BCFD16F4((uint64_t)v21);
      sub_1BCFE2B24();
      swift_release();
      v10 += 56;
      --v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  v11 = (void (*)(_OWORD *, _QWORD))(*(uint64_t (**)(_OWORD *))((*v4 & *v2) + 0x90))(v21);
  v13 = v12;
  v14 = sub_1BCFD03AC(v3);
  if ((v15 & 1) != 0)
  {
    v16 = v14;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20[0] = *v13;
    *v13 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      sub_1BCFD108C();
    sub_1BCFD0A50(v16, v20[0]);
    *v13 = v20[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v11(v21, 0);
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  v18 = (uint64_t (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))((*v4 & *v2) + 0xA8))(v20);
  sub_1BCFCDF40((uint64_t)v21, v3);
  return v18(v20, 0);
}

uint64_t sub_1BCFCE274()
{
  return sub_1BCFCE4F8(sub_1BCFD4620);
}

uint64_t sub_1BCFCE28C()
{
  return sub_1BCFCE4F8(sub_1BCFD4674);
}

uint64_t sub_1BCFCE2A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  RecentsSaveAsContactTip.init()();
  v0 = sub_1BCFE28B4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CE9618], v0);
  sub_1BCFD1974();
  sub_1BCFE27C4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v4 = sub_1BCFD3AD0();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4, v5);
  sub_1BCFE2974();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1BCFCE4D4()
{
  return sub_1BCFCE4F8(sub_1BCFD3FE8);
}

uint64_t sub_1BCFCE4EC()
{
  return sub_1BCFCE4F8(sub_1BCFD3A7C);
}

uint64_t sub_1BCFCE4F8(uint64_t (*a1)(void))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v1 = a1();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_1BCFE2974();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1BCFCE59C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v3 = a3();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  sub_1BCFE2974();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1BCFCE634()
{
  return sub_1BCFCE86C((uint64_t)&unk_1E75FD848, (uint64_t)&unk_1EF4A5820, (void (*)(char *, uint64_t, uint64_t))sub_1BCFCD3E4);
}

uint64_t sub_1BCFCE650(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  sub_1BCFE2AAC();
  v1[3] = sub_1BCFE2AA0();
  v1[4] = sub_1BCFE2A70();
  v1[5] = v2;
  return swift_task_switch();
}

uint64_t sub_1BCFCE6BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_1BCFE2788();
  sub_1BCFE2A40();
  v0[6] = v1;
  sub_1BCFE2A40();
  v0[7] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v0[8] = v3;
  *v3 = v0;
  v3[1] = sub_1BCFCE76C;
  return sub_1BCFE277C();
}

uint64_t sub_1BCFCE76C()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_1BCFCE7F4()
{
  uint64_t v0;
  uint64_t v1;
  BOOL *v2;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(BOOL **)(v0 + 16);
  swift_release();
  *v2 = v1 != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFCE850()
{
  return sub_1BCFCE86C((uint64_t)&unk_1E75FD870, (uint64_t)&unk_1EF4A5830, (void (*)(char *, uint64_t, uint64_t))sub_1BCFCD298);
}

uint64_t sub_1BCFCE86C(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BCFE2ADC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1BCFE2AAC();
  v9 = sub_1BCFE2AA0();
  v10 = swift_allocObject();
  v11 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v11;
  a3(v7, a2, v10);
  return swift_release();
}

uint64_t sub_1BCFCE944()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1BCFE2AAC();
  v0[2] = sub_1BCFE2AA0();
  v0[3] = sub_1BCFE2A70();
  v0[4] = v1;
  return swift_task_switch();
}

uint64_t sub_1BCFCE9AC()
{
  _QWORD *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  sub_1BCFE2A40();
  v4 = v3;
  if (v2)

  v0[5] = v4;
  sub_1BCFE2788();
  sub_1BCFE2A40();
  v0[6] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = v6;
  *v6 = v0;
  v6[1] = sub_1BCFCEABC;
  return sub_1BCFE277C();
}

uint64_t sub_1BCFCEABC()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1BCFCEB50()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFCEB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BCFE2ADC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_1BCFE2AAC();
  v11 = sub_1BCFE2AA0();
  v12 = swift_allocObject();
  v13 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v13;
  a5(v9, a4, v12);
  return swift_release();
}

uint64_t sub_1BCFCEC74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  sub_1BCFD7254(0);
  v0 = sub_1BCFD6D44();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  sub_1BCFE2974();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1BCFCEDC0()
{
  return sub_1BCFD6F8C(1);
}

id TPTipsHelper.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  *(_QWORD *)&v0[OBJC_IVAR___TPTipsHelper_Swift_popoverController] = 0;
  v1 = OBJC_IVAR___TPTipsHelper_Swift_entries;
  v2 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[v1] = sub_1BCFD14A4(MEMORY[0x1E0DEE9D8]);
  v3 = OBJC_IVAR___TPTipsHelper_Swift_currentTip;
  *(_QWORD *)&v0[v3] = sub_1BCFD15A4(v2);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TPTipsHelper();
  return objc_msgSendSuper2(&v5, sel_init);
}

id TPTipsHelper.__deallocating_deinit()
{
  return sub_1BCFD016C(type metadata accessor for TPTipsHelper);
}

double sub_1BCFCEF20()
{
  return 16.0;
}

double sub_1BCFCEF34()
{
  return *MEMORY[0x1E0DC49E8];
}

double sub_1BCFCEF48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1BCFCEF90(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  double *v9;
  uint64_t v10;

  v9 = (double *)((char *)v4 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  v10 = swift_beginAccess();
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v4) + 0xC0))(v10);
}

uint64_t (*sub_1BCFCF014(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1BCFCF05C;
}

uint64_t sub_1BCFCF060()
{
  return 0;
}

uint64_t TPTipHeaderView.displaysBottomSeparator.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1BCFCF0AC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1BCFCF0FC(char *a1, _QWORD **a2)
{
  char v2;
  _QWORD *v3;
  _BYTE *v4;
  uint64_t v5;

  v2 = *a1;
  v3 = *a2;
  v4 = (char *)*a2 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  v5 = swift_beginAccess();
  *v4 = v2;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xC0))(v5);
}

uint64_t TPTipHeaderView.displaysBottomSeparator.setter(char a1)
{
  _QWORD *v1;
  _BYTE *v3;
  uint64_t v4;

  v3 = (char *)v1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  v4 = swift_beginAccess();
  *v3 = a1;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xC0))(v4);
}

uint64_t (*TPTipHeaderView.displaysBottomSeparator.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1BCFCF05C;
}

uint64_t sub_1BCFCF220(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(a1 + 24)) + 0xC0))(result);
  return result;
}

uint64_t sub_1BCFCF268@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFCF2A8(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA8);
  v4 = *a1;
  return v3(v2);
}

void *sub_1BCFCF2F4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1BCFCF340(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_1BCFCFDB8();
}

void (*sub_1BCFCF3A8(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1BCFCF3F0;
}

void sub_1BCFCF3F0(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1BCFCFDB8();
}

double static TPTipHeaderView.verticalInsetTotal.getter()
{
  return 32.0;
}

_QWORD *TPTipHeaderView.__allocating_init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  return TPTipHeaderView.init(frame:separatorInset:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

_QWORD *TPTipHeaderView.init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BYTE *v8;
  _OWORD *v17;
  __int128 v18;
  _QWORD *v19;
  double *v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  objc_super v27;

  v17 = &v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset];
  v18 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v17 = *MEMORY[0x1E0DC49E8];
  v17[1] = v18;
  *(_QWORD *)&v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView] = 0;
  v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView] = 0;
  v27.receiver = v8;
  v27.super_class = (Class)type metadata accessor for TPTipHeaderView();
  v19 = objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v19, sel_setLayoutMargins_, 16.0, 16.0, 16.0, 16.0);
  v20 = (double *)((char *)v19 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  swift_beginAccess();
  *v20 = a5;
  v20[1] = a6;
  v20[2] = a7;
  v20[3] = a8;
  v21 = (void **)((char *)v19 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  v22 = *v21;
  if (*v21)
  {
    v23 = (void *)objc_opt_self();
    v24 = v22;
    v25 = objc_msgSend(v23, sel_tertiarySystemFillColor);
    objc_msgSend(v24, sel_setBackgroundColor_, v25);

  }
  sub_1BCFCFDB8();
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v19) + 0xC8))();

  return v19;
}

id sub_1BCFCF668(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1BCFCF6A8()
{
  _BYTE *v0;
  _OWORD *v1;
  __int128 v2;

  v1 = &v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset];
  v2 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v1 = *MEMORY[0x1E0DC49E8];
  v1[1] = v2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView] = 0;
  v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView] = 0;

  sub_1BCFE2BA8();
  __break(1u);
}

void sub_1BCFCF7EC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;

  v1 = v0;
  v2 = OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView;
  v3 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView);
  if (v3)
  {
    objc_msgSend(v3, sel_removeFromSuperview);
    v4 = *(void **)((char *)v0 + v2);
    *(_QWORD *)((char *)v0 + v2) = 0;

    v5 = *(void **)((char *)v0 + v2);
    if (v5)
    {
LABEL_8:
      v14 = v5;
      objc_msgSend(v1, sel_addSubview_, v14);
      v15 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v15, sel_scale);
      v17 = v16;

      __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A5300);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1BCFE7640;
      v19 = objc_msgSend(v14, sel_leadingAnchor);
      v20 = objc_msgSend(v1, sel_leadingAnchor);
      (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x70))();
      v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, v21);

      *(_QWORD *)(v18 + 32) = v22;
      v23 = objc_msgSend(v14, sel_heightAnchor);
      v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, 1.0 / v17);

      *(_QWORD *)(v18 + 40) = v24;
      v25 = objc_msgSend(v14, sel_widthAnchor);
      v26 = objc_msgSend(v1, sel_widthAnchor);
      v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

      *(_QWORD *)(v18 + 48) = v27;
      v28 = objc_msgSend(v1, sel_bottomAnchor);
      v29 = objc_msgSend(v14, sel_bottomAnchor);
      v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

      *(_QWORD *)(v18 + 56) = v30;
      sub_1BCFE2A64();
      sub_1BCFD1A6C();
      v31 = (void *)sub_1BCFE2A4C();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v31);

      return;
    }
  }
  v6 = (char *)v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  if (*v6 != 1)
  {
LABEL_7:
    v5 = *(void **)((char *)v1 + v2);
    if (!v5)
      return;
    goto LABEL_8;
  }
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v8 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = v7;

  v9 = *(void **)((char *)v1 + v2);
  if (v9)
  {
    objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v10 = *(void **)((char *)v1 + v2);
    if (v10)
    {
      v11 = (void *)objc_opt_self();
      v12 = v10;
      v13 = objc_msgSend(v11, sel_separatorColor);
      objc_msgSend(v12, sel_setBackgroundColor_, v13);

      goto LABEL_7;
    }
  }
}

void sub_1BCFCFB74()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = *MEMORY[0x1E0DC48E8];
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5[4] = sub_1BCFD1ACC;
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1BCFCFC7C;
  v5[3] = &block_descriptor;
  v3 = _Block_copy(v5);
  swift_release();
  v4 = objc_msgSend(v0, sel_addObserverForName_object_queue_usingBlock_, v1, 0, 0, v3);
  _Block_release(v3);
  swift_unknownObjectRelease();

}

uint64_t sub_1BCFCFC7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_1BCFE26E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_1BCFE26D4();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1BCFCFD20()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

void sub_1BCFCFD3C()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  void *v2;
  id v3;
  void *v4;

  v1 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0);
  v2 = (void *)v1();
  v3 = objc_msgSend(v2, sel_superview);

  if (v3)
  {
    v4 = (void *)v1();
    objc_msgSend(v4, sel_removeFromSuperview);

  }
  sub_1BCFCFDB8();
}

void sub_1BCFCFDB8()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v1 = v0;
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
  if (v2)
  {
    v23 = v2;
    v3 = objc_msgSend(v2, sel_superview);

    v4 = v23;
    if (!v3)
    {
      objc_msgSend(v1, sel_addSubview_, v23);
      __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A5300);
      v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_1BCFE7640;
      v6 = objc_msgSend(v23, sel_leadingAnchor);
      v7 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v8 = objc_msgSend(v7, sel_leadingAnchor);

      v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v8);
      *(_QWORD *)(v5 + 32) = v9;
      v10 = objc_msgSend(v23, sel_topAnchor);
      v11 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v12 = objc_msgSend(v11, sel_topAnchor);

      v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
      *(_QWORD *)(v5 + 40) = v13;
      v14 = objc_msgSend(v23, sel_trailingAnchor);
      v15 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v16 = objc_msgSend(v15, sel_trailingAnchor);

      v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
      *(_QWORD *)(v5 + 48) = v17;
      v18 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v19 = objc_msgSend(v18, sel_bottomAnchor);

      v20 = objc_msgSend(v23, sel_bottomAnchor);
      v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

      *(_QWORD *)(v5 + 56) = v21;
      sub_1BCFE2A64();
      sub_1BCFD1A6C();
      v22 = sub_1BCFE2A4C();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v22);

      v4 = (void *)v22;
    }

  }
}

id TPTipHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void TPTipHeaderView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPTipHeaderView.__deallocating_deinit()
{
  return sub_1BCFD016C(type metadata accessor for TPTipHeaderView);
}

id sub_1BCFD016C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1BCFD01D4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1BCFD0238;
  return v6(a1);
}

uint64_t sub_1BCFD0238()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_1BCFD0284(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F28);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4])
          memmove(v12, a4 + 4, 56 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1BCFD1724(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1BCFD03AC(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1BCFE2C44();
  sub_1BCFE2C50();
  v2 = sub_1BCFE2C5C();
  return sub_1BCFD0404(a1, v2);
}

unint64_t sub_1BCFD0404(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1BCFD04A4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F20);
  result = sub_1BCFE2BCC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v30 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v29 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v19 >= v29)
          goto LABEL_33;
        v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v29)
            goto LABEL_33;
          v20 = v30[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v30 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_42;
                if (v8 >= v29)
                  goto LABEL_33;
                v20 = v30[v8];
                ++v21;
                if (v20)
                  goto LABEL_30;
              }
            }
            v8 = v21;
          }
        }
LABEL_30:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v26 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v18);
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0)
        sub_1BCFE2818();
      sub_1BCFE2C44();
      sub_1BCFE2C50();
      result = sub_1BCFE2C5C();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v24 = v15 == v23;
          if (v15 == v23)
            v15 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v26;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v16) = v27;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1BCFD0774(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  __int128 *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;
  __int128 v31[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A5898);
  result = sub_1BCFE2BCC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v30 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v29 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v15 = v14 | (v8 << 6);
      }
      else
      {
        v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v16 >= v29)
          goto LABEL_34;
        v17 = v30[v16];
        ++v8;
        if (!v17)
        {
          v8 = v16 + 1;
          if (v16 + 1 >= v29)
            goto LABEL_34;
          v17 = v30[v8];
          if (!v17)
          {
            v18 = v16 + 2;
            if (v18 >= v29)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_41;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v30 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v17 = v30[v18];
            if (!v17)
            {
              while (1)
              {
                v8 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_43;
                if (v8 >= v29)
                  goto LABEL_34;
                v17 = v30[v8];
                ++v18;
                if (v17)
                  goto LABEL_21;
              }
            }
            v8 = v18;
          }
        }
LABEL_21:
        v11 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      v19 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v15);
      v20 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v15);
      if ((a2 & 1) != 0)
        sub_1BCFCC898(v20, (uint64_t)v31);
      else
        sub_1BCFCC810((uint64_t)v20, (uint64_t)v31);
      sub_1BCFE2C44();
      sub_1BCFE2C50();
      result = sub_1BCFE2C5C();
      v21 = -1 << *(_BYTE *)(v7 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v23);
        }
        while (v27 == -1);
        v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v13) = v19;
      result = sub_1BCFCC898(v31, *(_QWORD *)(v7 + 56) + 40 * v13);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v7;
  return result;
}

unint64_t sub_1BCFD0A50(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BCFE2B60();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BCFE2C44();
        sub_1BCFE2C50();
        result = sub_1BCFE2C5C();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_BYTE *)(v10 + v3);
          v12 = (_BYTE *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BCFD0C08(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BCFE2B60();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BCFE2C44();
        sub_1BCFE2C50();
        result = sub_1BCFE2C5C();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_BYTE *)(v12 + v3);
          v14 = (_BYTE *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = v15 + 40 * v3;
          v17 = (__int128 *)(v15 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            v9 = *v17;
            v10 = v17[1];
            *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
            *(_OWORD *)v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1BCFD0DD4(uint64_t a1, unsigned __int8 a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1BCFD03AC(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_1BCFD108C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_1BCFD04A4(result, a3 & 1);
  result = sub_1BCFD03AC(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1BCFE2C14();
  __break(1u);
  return result;
}

uint64_t sub_1BCFD0F08(__int128 *a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1BCFD03AC(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7] + 40 * v10;
        __swift_destroy_boxed_opaque_existential_1(v17);
        return sub_1BCFCC898(a1, v17);
      }
      return sub_1BCFD1024(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1BCFD122C();
      goto LABEL_7;
    }
    sub_1BCFD0774(v13, a3 & 1);
    v19 = sub_1BCFD03AC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_1BCFD1024(v10, a2, a1, v16);
    }
  }
  result = sub_1BCFE2C14();
  __break(1u);
  return result;
}

uint64_t sub_1BCFD1024(unint64_t a1, char a2, __int128 *a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  result = sub_1BCFCC898(a3, a4[7] + 40 * a1);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

void *sub_1BCFD108C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F20);
  v2 = *v0;
  v3 = sub_1BCFE2BC0();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v13 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v16);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v16) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v16) = v17;
    result = (void *)sub_1BCFE2818();
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BCFD122C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  __int128 v21[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A5898);
  v2 = *v0;
  v3 = sub_1BCFE2BC0();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v13 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    v17 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v16);
    sub_1BCFCC810(*(_QWORD *)(v2 + 56) + 40 * v16, (uint64_t)v21);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = (void *)sub_1BCFCC898(v21, *(_QWORD *)(v4 + 56) + 40 * v16);
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BCFD13EC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_1BCFD1454;
  return v5(v2 + 32);
}

uint64_t sub_1BCFD1454()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

unint64_t sub_1BCFD14A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F20);
  v3 = (_QWORD *)sub_1BCFE2BD8();
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  result = sub_1BCFD03AC(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    sub_1BCFE2818();
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = v8 + 2;
    v4 = *((_BYTE *)v8 - 8);
    v13 = *v8;
    sub_1BCFE2818();
    result = sub_1BCFD03AC(v4);
    v8 = v12;
    v5 = v13;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_1BCFD15A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t i;
  unsigned __int8 v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned __int8 v11[8];
  __int128 v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A5898);
    v3 = (_QWORD *)sub_1BCFE2BD8();
    for (i = a1 + 32; ; i += 48)
    {
      sub_1BCFD24C8(i, (uint64_t)v11);
      v5 = v11[0];
      result = sub_1BCFD03AC(v11[0]);
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      result = sub_1BCFCC898(&v12, v3[7] + 40 * result);
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

uint64_t sub_1BCFD169C(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a2 = *(_BYTE *)a1;
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2 + 8, a1 + 8);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 48);
  swift_retain();
  return a2;
}

uint64_t sub_1BCFD16F4(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  swift_release();
  return a1;
}

uint64_t sub_1BCFD1724(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1BCFE2BE4();
  __break(1u);
  return result;
}

unint64_t sub_1BCFD1974()
{
  unint64_t result;

  result = qword_1EF4A5810;
  if (!qword_1EF4A5810)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsSaveAsContactTip, &type metadata for RecentsSaveAsContactTip);
    atomic_store(result, &qword_1EF4A5810);
  }
  return result;
}

uint64_t sub_1BCFD19B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1BCFD25D8;
  return sub_1BCFCE650(a1);
}

uint64_t sub_1BCFD1A08()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1BCFD25D8;
  return sub_1BCFCE944();
}

uint64_t type metadata accessor for TPTipHeaderView()
{
  return objc_opt_self();
}

unint64_t sub_1BCFD1A6C()
{
  unint64_t result;

  result = qword_1EF4A5858;
  if (!qword_1EF4A5858)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4A5858);
  }
  return result;
}

uint64_t sub_1BCFD1AA8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1BCFD1ACC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;

  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x1C3B6F7DC](v1 + 16);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xD0))(a1);

  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1BCFD1B58()
{
  unint64_t result;

  result = qword_1EF4A4E98;
  if (!qword_1EF4A4E98)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for TPTipsHelper.Entry.Kind, &type metadata for TPTipsHelper.Entry.Kind);
    atomic_store(result, (unint64_t *)&qword_1EF4A4E98);
  }
  return result;
}

uint64_t method lookup function for TPTipsHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPTipsHelper.setup()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPTipsHelper.addEntry(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TPTipsHelper.removeEntries(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSpeakerUsed()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventKnownStoryLaunched()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventKnownCallersDone()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSavedNumber()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCalledNonFavContact()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCalledNonContact()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventOriginatedCallWithSiri()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCreatedFacetimeLink()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSearchedCallHistory()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static TPTipsHelper.updateCanDisplayCallHistorySearchTip(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of static TPTipsHelper.didDisplayCallHistorySearchTip()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t initializeBufferWithCopyOfBuffer for TPTipsHelper.Entry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TPTipsHelper.Entry(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_release();
}

uint64_t initializeWithCopy for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TPTipsHelper.Entry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TPTipsHelper.Entry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TPTipsHelper.Entry()
{
  return &type metadata for TPTipsHelper.Entry;
}

uint64_t getEnumTagSinglePayload for TPTipsHelper.Entry.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TPTipsHelper.Entry.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1BCFD2194 + 4 * byte_1BCFE765D[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1BCFD21C8 + 4 * byte_1BCFE7658[v4]))();
}

uint64_t sub_1BCFD21C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFD21D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCFD21D8);
  return result;
}

uint64_t sub_1BCFD21E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCFD21ECLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1BCFD21F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFD21F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TPTipsHelper.Entry.Kind()
{
  return &type metadata for TPTipsHelper.Entry.Kind;
}

uint64_t method lookup function for TPTipHeaderView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPTipHeaderView.__allocating_init(frame:separatorInset:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BCFD2288(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BCFD22A8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF4A5860)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF4A5860);
  }
}

uint64_t sub_1BCFD2328()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1BCFD236C;
  return sub_1BCFCE944();
}

uint64_t sub_1BCFD236C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BCFD23B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFD23D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BCFD236C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF4A5878 + dword_1EF4A5878))(a1, v4);
}

unint64_t sub_1BCFD2448()
{
  unint64_t result;

  result = qword_1EF4A5890;
  if (!qword_1EF4A5890)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for SpeakerphoneTip, &type metadata for SpeakerphoneTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A5890);
  }
  return result;
}

uint64_t sub_1BCFD248C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BCFD24C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCFD2510(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BCFD25D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF4A58B0 + dword_1EF4A58B0))(a1, v4);
}

uint64_t sub_1BCFD2580(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3B6F710](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BCFD25C0()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1BCFD25F8(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A5CD8);
}

uint64_t sub_1BCFD260C()
{
  return sub_1BCFD2714(qword_1EF4A5CF0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A5CD8);
}

uint64_t static FavoritesTip.favoriteAddedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A5CF0, (uint64_t)qword_1EF4A5CD8, a1);
}

uint64_t sub_1BCFD264C()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_allocate_value_buffer(v0, qword_1EF4A7200);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  return sub_1BCFE29D4();
}

uint64_t sub_1BCFD26F0()
{
  return sub_1BCFD2714(&qword_1EF4A5CD0, &qword_1EF4A4F08, (uint64_t)qword_1EF4A7200);
}

uint64_t sub_1BCFD2714(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t sub_1BCFD2758@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(&qword_1EF4A5CD0, &qword_1EF4A4F08, (uint64_t)qword_1EF4A7200, a1);
}

uint64_t sub_1BCFD277C(uint64_t a1)
{
  return sub_1BCFD3444(a1, &qword_1EF4A5CD0, &qword_1EF4A4F08, (uint64_t)qword_1EF4A7200);
}

uint64_t (*sub_1BCFD27A0())()
{
  uint64_t v0;

  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BCFD281C()
{
  uint64_t v0;
  uint64_t v2;

  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29BC();
  swift_endAccess();
  return v2;
}

uint64_t sub_1BCFD28B0()
{
  uint64_t v0;

  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29C8();
  return swift_endAccess();
}

void (*sub_1BCFD2950(_QWORD *a1))(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  v2[5] = v3;
  v2[6] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = v2[4];
  swift_endAccess();
  v2[3] = v4;
  return sub_1BCFD2A20;
}

void sub_1BCFD2A20(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)a1 + 32) = *(_QWORD *)(*(_QWORD *)a1 + 24);
  swift_beginAccess();
  sub_1BCFE29C8();
  swift_endAccess();
  free(v1);
}

unint64_t FavoritesTip.id.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t FavoritesTip.asset.getter()
{
  return sub_1BCFE2A1C();
}

uint64_t FavoritesTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  sub_1BCFE2950();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7770;
  if (qword_1EF4A5CF0[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A5CD8);
  MEMORY[0x1E0C80A78](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EF4A7200);
  v6 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1BCFE2968();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v9 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1BCFD2D40@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD59D0(1, MEMORY[0x1E0CAF810], a1);
}

uint64_t sub_1BCFD2D50(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1BCFE2830();
    result = MEMORY[0x1C3B6F710](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BCFD2D90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  result = sub_1BCFE298C();
  *a1 = result;
  return result;
}

uint64_t sub_1BCFD2DC4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

uint64_t sub_1BCFD2DD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v15[1] = a1;
  v3 = sub_1BCFE271C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E10);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E88);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCFD8510(&qword_1EF4A4E80, &qword_1EF4A4E88, MEMORY[0x1E0CAF898]);
  sub_1BCFE2734();
  v17 = 1;
  sub_1BCFE2728();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF810], v3);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4DB8);
  a2[4] = sub_1BCFD87E8();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_1BCFD8510(&qword_1EF4A4E08, &qword_1EF4A4E10, MEMORY[0x1E0CAF850]);
  sub_1BCFE2710();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t static FavoritesTip.favoritesCount.getter()
{
  uint64_t v0;
  uint64_t v2;

  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29BC();
  swift_endAccess();
  return v2;
}

uint64_t static FavoritesTip.favoritesCount.setter()
{
  uint64_t v0;

  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29C8();
  return swift_endAccess();
}

void (*static FavoritesTip.favoritesCount.modify(_QWORD *a1))(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  if (qword_1EF4A5CD0 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F08);
  v2[5] = v3;
  v2[6] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7200);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = v2[4];
  swift_endAccess();
  v2[3] = v4;
  return sub_1BCFD2A20;
}

unint64_t sub_1BCFD31E0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1BCFD3200()
{
  return sub_1BCFE27D0();
}

uint64_t sub_1BCFD3214()
{
  return sub_1BCFE27DC();
}

uint64_t sub_1BCFD3228()
{
  return FavoritesTip.rules.getter();
}

void sub_1BCFD3240(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x80000001BCFEA470;
}

uint64_t sub_1BCFD3260(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6A80);
}

uint64_t sub_1BCFD3274()
{
  return sub_1BCFD2714(&qword_1EF4A6A78, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6A80);
}

uint64_t static SpeakerphoneTip.speakerUsedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A6A78, (uint64_t)qword_1EF4A6A80, a1);
}

uint64_t sub_1BCFD32B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1BCFD3320(uint64_t a1)
{
  return sub_1BCFD70A8(a1, qword_1EF4A7260);
}

uint64_t sub_1BCFD334C()
{
  return sub_1BCFD2714(&qword_1EF4A6A98, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7260);
}

uint64_t sub_1BCFD3370@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(&qword_1EF4A6A98, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7260, a1);
}

uint64_t sub_1BCFD3394@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_1BCFD3420(uint64_t a1)
{
  return sub_1BCFD3444(a1, &qword_1EF4A6A98, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7260);
}

uint64_t sub_1BCFD3444(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*a2 != -1)
    swift_once();
  v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*sub_1BCFD34EC())()
{
  uint64_t v0;

  if (qword_1EF4A6A98 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7260);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFD3568()
{
  return sub_1BCFD50E4(&qword_1EF4A6A98, (uint64_t)qword_1EF4A7260);
}

uint64_t sub_1BCFD3584(uint64_t a1)
{
  return sub_1BCFD5188(a1, &qword_1EF4A6A98, (uint64_t)qword_1EF4A7260);
}

uint64_t (*sub_1BCFD35A0(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A6A98 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7260);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

unint64_t SpeakerphoneTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t SpeakerphoneTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  sub_1BCFE2950();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7770;
  if (qword_1EF4A6A78 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A6A80);
  MEMORY[0x1E0C80A78](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  if (qword_1EF4A6A98 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EF4A7260);
  v6 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1BCFE2968();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v9 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1BCFD3908@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD5838(1, a1);
}

uint64_t static SpeakerphoneTip.isAwayFromFace.getter()
{
  return sub_1BCFD50E4(&qword_1EF4A6A98, (uint64_t)qword_1EF4A7260);
}

uint64_t static SpeakerphoneTip.isAwayFromFace.setter(uint64_t a1)
{
  return sub_1BCFD5188(a1, &qword_1EF4A6A98, (uint64_t)qword_1EF4A7260);
}

uint64_t (*static SpeakerphoneTip.isAwayFromFace.modify(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A6A98 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7260);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

unint64_t sub_1BCFD3A18()
{
  return 0xD000000000000019;
}

uint64_t sub_1BCFD3A34()
{
  return SpeakerphoneTip.rules.getter();
}

void sub_1BCFD3A48(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001BCFEA490;
}

uint64_t sub_1BCFD3A68(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6AA8);
}

uint64_t sub_1BCFD3A7C()
{
  return sub_1BCFD2714(qword_1EF4A64E0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6AA8);
}

uint64_t static RecentsSaveAsContactTip.calledNonContactEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A64E0, (uint64_t)qword_1EF4A6AA8, a1);
}

uint64_t sub_1BCFD3ABC(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6078);
}

uint64_t sub_1BCFD3AD0()
{
  return sub_1BCFD2714(qword_1EF4A6090, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6078);
}

uint64_t static RecentsSaveAsContactTip.savedNumberEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A6090, (uint64_t)qword_1EF4A6078, a1);
}

unint64_t RecentsSaveAsContactTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t RecentsSaveAsContactTip.asset.getter()
{
  return sub_1BCFE2A1C();
}

uint64_t RecentsSaveAsContactTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v4)(char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  v11 = *(_QWORD *)(*(_QWORD *)(sub_1BCFE2950() - 8) + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7770;
  if (qword_1EF4A6090[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v9 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A6078);
  v10 = &v8;
  v1 = *(_QWORD *)(*(_QWORD *)(v0 - 8) + 64);
  MEMORY[0x1E0C80A78](v9);
  v2 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = *(void (**)(char *))(v3 + 16);
  v4((char *)&v8 - v2);
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  v5 = sub_1BCFE295C();
  MEMORY[0x1E0C80A78](v5);
  ((void (*)(char *, uint64_t, uint64_t))v4)((char *)&v8 - v2, v9, v0);
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v6 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1BCFD3D74@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD59D0(3, MEMORY[0x1E0CAF808], a1);
}

unint64_t sub_1BCFD3D84()
{
  return 0xD000000000000019;
}

uint64_t sub_1BCFD3DA0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v4)(char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  v11 = *(_QWORD *)(*(_QWORD *)(sub_1BCFE2950() - 8) + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7770;
  if (qword_1EF4A6090[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v9 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A6078);
  v10 = &v8;
  v1 = *(_QWORD *)(*(_QWORD *)(v0 - 8) + 64);
  MEMORY[0x1E0C80A78](v9);
  v2 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = *(void (**)(char *))(v3 + 16);
  v4((char *)&v8 - v2);
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  v5 = sub_1BCFE295C();
  MEMORY[0x1E0C80A78](v5);
  ((void (*)(char *, uint64_t, uint64_t))v4)((char *)&v8 - v2, v9, v0);
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v6 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1BCFD3FB4(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001BCFEA4B0;
}

uint64_t sub_1BCFD3FD4(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6408);
}

uint64_t sub_1BCFD3FE8()
{
  return sub_1BCFD2714(qword_1EF4A6420, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6408);
}

uint64_t static RecentsSaveAsFavoritesTip.calledNonFavContactEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A6420, (uint64_t)qword_1EF4A6408, a1);
}

unint64_t RecentsSaveAsFavoritesTip.id.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t RecentsSaveAsFavoritesTip.asset.getter()
{
  return sub_1BCFE2A1C();
}

uint64_t RecentsSaveAsFavoritesTip.rules.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void (*v8)(char *);
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  v0 = *(_QWORD *)(sub_1BCFE2950() - 8);
  v1 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v12[0] = *(_QWORD *)(v0 + 72);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BCFE7770;
  v12[1] = v2 + v1;
  if (qword_1EF4A5CF0[0] != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A5CD8);
  v5 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x1E0C80A78](v4);
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = *(void (**)(char *))(v7 + 16);
  v8((char *)v12 - v6);
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  if (qword_1EF4A6420[0] != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A6408);
  MEMORY[0x1E0C80A78](v9);
  v8((char *)v12 - v6);
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v10 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BCFD42C0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD59D0(5, MEMORY[0x1E0CAF800], a1);
}

unint64_t sub_1BCFD42D0()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1BCFD42EC()
{
  return RecentsSaveAsFavoritesTip.rules.getter();
}

void sub_1BCFD4300(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000001BCFEA500;
}

uint64_t sub_1BCFD4320(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A61A8);
}

uint64_t sub_1BCFD4334()
{
  return sub_1BCFD2714(qword_1EF4A61C0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A61A8);
}

uint64_t static RecentsBrandedCallingTip.brandedCallReceivedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A61C0, (uint64_t)qword_1EF4A61A8, a1);
}

void *sub_1BCFD4374()
{
  return &unk_1BCFE77A0;
}

uint64_t static RecentsBrandedCallingTip.ContentPersonalizationTypeCarrierStrings.getter()
{
  return 1;
}

unint64_t RecentsBrandedCallingTip.id.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t RecentsBrandedCallingTip.asset.getter()
{
  return sub_1BCFE2A1C();
}

uint64_t sub_1BCFD43DC()
{
  return sub_1BCFE2818();
}

uint64_t sub_1BCFD43E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*sub_1BCFD440C())()
{
  return nullsub_1;
}

TelephonyUI::RecentsBrandedCallingTip __swiftcall RecentsBrandedCallingTip.init(_:)(TelephonyUI::RecentsBrandedCallingTip result)
{
  TelephonyUI::RecentsBrandedCallingTip *v1;

  v1->personalizationInfo._rawValue = result.personalizationInfo._rawValue;
  return result;
}

uint64_t RecentsBrandedCallingTip.personalizedText(for:)(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 16) && (sub_1BCFD7A9C(a1), (v2 & 1) != 0))
  {
    sub_1BCFD7ACC();
    sub_1BCFE2818();
    return sub_1BCFE2A04();
  }
  else
  {
    sub_1BCFE29EC();
    return sub_1BCFE29F8();
  }
}

uint64_t RecentsBrandedCallingTip.rules.getter()
{
  return sub_1BCFD47EC(qword_1EF4A61C0, (uint64_t)qword_1EF4A61A8);
}

uint64_t sub_1BCFD44E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD7678(1, a1);
}

unint64_t sub_1BCFD44F0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1BCFD450C()
{
  return sub_1BCFE27E8();
}

uint64_t sub_1BCFD452C()
{
  return sub_1BCFE2800();
}

uint64_t sub_1BCFD4540(uint64_t a1, uint64_t a2)
{
  return sub_1BCFD49DC(a1, a2, qword_1EF4A61C0, (uint64_t)qword_1EF4A61A8);
}

uint64_t sub_1BCFD4564()
{
  return sub_1BCFE280C();
}

uint64_t sub_1BCFD4578(uint64_t a1)
{
  return RecentsBrandedCallingTip.personalizedText(for:)(a1);
}

void sub_1BCFD4598(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x80000001BCFEA520;
}

uint64_t sub_1BCFD45B8(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A62D8);
}

uint64_t sub_1BCFD45CC()
{
  return sub_1BCFD2714(qword_1EF4A62F0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A62D8);
}

uint64_t static RecentsUnknownCallersTip.unknownShortCallEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A62F0, (uint64_t)qword_1EF4A62D8, a1);
}

uint64_t sub_1BCFD460C(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6AC8);
}

uint64_t sub_1BCFD4620()
{
  return sub_1BCFD2714(&qword_1EF4A6AC0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6AC8);
}

uint64_t static RecentsUnknownCallersTip.knownStoryLaunchedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A6AC0, (uint64_t)qword_1EF4A6AC8, a1);
}

uint64_t sub_1BCFD4660(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6AE8);
}

uint64_t sub_1BCFD4674()
{
  return sub_1BCFD2714(&qword_1EF4A6AE0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6AE8);
}

uint64_t static RecentsUnknownCallersTip.knownCallersDoneEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A6AE0, (uint64_t)qword_1EF4A6AE8, a1);
}

unint64_t RecentsUnknownCallersTip.id.getter()
{
  return 0xD000000000000029;
}

uint64_t RecentsUnknownCallersTip.asset.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1BCFE2A34();
  v1 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_, v0);

  if (v1)
    return sub_1BCFE2A10();
  else
    return sub_1BCFE2A1C();
}

void *sub_1BCFD4774()
{
  return &unk_1E75FD9D8;
}

unint64_t static RecentsUnknownCallersTip.spamBlockingAppsEditorialURLString.getter()
{
  return 0xD000000000000022;
}

uint64_t RecentsUnknownCallersTip.actions.getter()
{
  return sub_1BCFD68C8();
}

uint64_t RecentsUnknownCallersTip.rules.getter()
{
  return sub_1BCFD47EC(qword_1EF4A62F0, (uint64_t)qword_1EF4A62D8);
}

uint64_t sub_1BCFD47EC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  sub_1BCFE2950();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7780;
  if (*a1 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v5 = __swift_project_value_buffer(v4, a2);
  MEMORY[0x1E0C80A78](v5);
  (*(void (**)(char *))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v8 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1BCFD4980@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD7678(10, a1);
}

unint64_t sub_1BCFD4988()
{
  return 0xD000000000000029;
}

uint64_t sub_1BCFD49A4()
{
  return RecentsUnknownCallersTip.actions.getter();
}

uint64_t sub_1BCFD49B8(uint64_t a1, uint64_t a2)
{
  return sub_1BCFD49DC(a1, a2, qword_1EF4A62F0, (uint64_t)qword_1EF4A62D8);
}

uint64_t sub_1BCFD49DC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  sub_1BCFE2950();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7780;
  if (*a3 != -1)
    swift_once();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v7 = __swift_project_value_buffer(v6, a4);
  MEMORY[0x1E0C80A78](v7);
  (*(void (**)(char *))(v9 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v10 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1BCFD4B70(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000029;
  a1[1] = 0x80000001BCFEA540;
}

uint64_t sub_1BCFD4B90(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A5F38);
}

uint64_t sub_1BCFD4BA4()
{
  return sub_1BCFD2714(&qword_1EF4A5F50, &qword_1EF4A4F00, (uint64_t)qword_1EF4A5F38);
}

uint64_t static LiveVoicemailTip.callScreenedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A5F50, (uint64_t)qword_1EF4A5F38, a1);
}

uint64_t sub_1BCFD4BE4(uint64_t a1)
{
  return sub_1BCFD6CE4(a1, qword_1EF4A5E88);
}

uint64_t sub_1BCFD4C08()
{
  return sub_1BCFD2714(qword_1EF4A5EA0, &qword_1EF4A4F00, (uint64_t)qword_1EF4A5E88);
}

uint64_t static LiveVoicemailTip.hasOpenedTip.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A5EA0, (uint64_t)qword_1EF4A5E88, a1);
}

uint64_t sub_1BCFD4C48(uint64_t a1)
{
  return sub_1BCFD6CE4(a1, qword_1EF4A64F8);
}

uint64_t sub_1BCFD4C6C(uint64_t a1)
{
  return sub_1BCFD4C80(a1, qword_1EF4A6518);
}

uint64_t sub_1BCFD4C80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_1BCFE2A40();
  return sub_1BCFE2980();
}

uint64_t sub_1BCFD4CE0()
{
  return sub_1BCFD2714(&qword_1EF4A6530, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6518);
}

uint64_t static LiveVoicemailTip.onboardingViewedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A6530, (uint64_t)qword_1EF4A6518, a1);
}

unint64_t LiveVoicemailTip.id.getter()
{
  return 0xD000000000000025;
}

uint64_t LiveVoicemailTip.options.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  _QWORD v16[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EF0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F30);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BCFE7770;
  v9 = sub_1BCFE2938();
  v10 = MEMORY[0x1E0CE9708];
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = v10;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  sub_1BCFE28A8();
  v11 = sub_1BCFE286C();
  v12 = MEMORY[0x1E0CE9548];
  *(_QWORD *)(v8 + 96) = v11;
  *(_QWORD *)(v8 + 104) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 72));
  sub_1BCFE2878();
  sub_1BCFE283C();
  swift_bridgeObjectRelease();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C3B6E87C](v7, v4, OpaqueTypeConformance2);
  v16[0] = v4;
  v16[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v14 = sub_1BCFE2854();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t LiveVoicemailTip.title.getter()
{
  return sub_1BCFD6A70();
}

uint64_t LiveVoicemailTip.message.getter()
{
  return sub_1BCFD6AC8();
}

uint64_t sub_1BCFD4F30()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_allocate_value_buffer(v0, qword_1EF4A7218);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7218);
  TUCallScreeningDisabledUserDefault();
  return sub_1BCFE29D4();
}

uint64_t sub_1BCFD4FE0()
{
  return sub_1BCFD2714(qword_1EF4A5F60, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7218);
}

uint64_t sub_1BCFD5004@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(qword_1EF4A5F60, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7218, a1);
}

uint64_t sub_1BCFD5028(uint64_t a1)
{
  return sub_1BCFD3444(a1, qword_1EF4A5F60, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7218);
}

uint64_t (*sub_1BCFD504C())()
{
  uint64_t v0;

  if (qword_1EF4A5F60[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7218);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFD50C8()
{
  return sub_1BCFD50E4(qword_1EF4A5F60, (uint64_t)qword_1EF4A7218);
}

uint64_t sub_1BCFD50E4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v5;

  if (*a1 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v3, a2);
  swift_beginAccess();
  sub_1BCFE29BC();
  swift_endAccess();
  return v5;
}

uint64_t sub_1BCFD516C(uint64_t a1)
{
  return sub_1BCFD5188(a1, qword_1EF4A5F60, (uint64_t)qword_1EF4A7218);
}

uint64_t sub_1BCFD5188(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  if (*a2 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v4, a3);
  swift_beginAccess();
  sub_1BCFE29C8();
  return swift_endAccess();
}

uint64_t (*sub_1BCFD521C(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A5F60[0] != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7218);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

void __swiftcall LiveVoicemailTip.init()()
{
  uint64_t v0;

  TUCallScreeningDisabledUserDefault();
  if (qword_1EF4A5F60[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7218);
  swift_beginAccess();
  sub_1BCFE29C8();
  swift_endAccess();
}

uint64_t LiveVoicemailTip.rules.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void (*v7)(char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  void (*v22)(char *);
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  v0 = *(_QWORD **)(*(_QWORD *)(sub_1BCFE2950() - 8) + 72);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BCFE7790;
  v24 = v1;
  if (qword_1EF4A5F50 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF4A5F38);
  v23 = v21;
  v4 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x1E0C80A78](v3);
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = *(void (**)(char *))(v6 + 16);
  v7((char *)v21 - v5);
  v8 = sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  v9 = sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  v25 = v8;
  sub_1BCFE295C();
  if (qword_1EF4A6510 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF4A64F8);
  MEMORY[0x1E0C80A78](v10);
  v7((char *)v21 - v5);
  sub_1BCFE295C();
  if (qword_1EF4A5EA0[0] != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF4A5E88);
  MEMORY[0x1E0C80A78](v11);
  v21[1] = v4;
  v22 = v7;
  v7((char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21[2] = v9;
  sub_1BCFE295C();
  v23 = v0;
  if (qword_1EF4A5F60[0] != -1)
    swift_once();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF4A7218);
  v14 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v12);
  sub_1BCFE2968();
  if (qword_1EF4A6530 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF4A6518);
  MEMORY[0x1E0C80A78](v17);
  v22((char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE295C();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v19 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_1BCFD5818@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD59D0(0, MEMORY[0x1E0CAF800], a1);
}

uint64_t sub_1BCFD5828@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD59D0(3, MEMORY[0x1E0CAF810], a1);
}

uint64_t sub_1BCFD5838@<X0>(char a1@<W1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v13[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4DF0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E70);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BCFD8510(&qword_1EF4A4E68, &qword_1EF4A4E70, MEMORY[0x1E0CAF898]);
  sub_1BCFE2734();
  v13[15] = a1;
  sub_1BCFE2728();
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4DD8);
  a2[4] = sub_1BCFD8344();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_1BCFD8510(&qword_1EF4A4DE8, &qword_1EF4A4DF0, MEMORY[0x1E0CAF850]);
  sub_1BCFE26F8();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1BCFD59D0@<X0>(uint64_t a1@<X1>, unsigned int *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v30 = a2;
  v28 = a1;
  v32 = a3;
  v29 = sub_1BCFE271C();
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v26 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E10);
  v35 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E40);
  v34 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E28);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E58);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCFD8510(&qword_1EF4A4E48, &qword_1EF4A4E58, MEMORY[0x1E0CAF898]);
  sub_1BCFE2734();
  swift_getKeyPath();
  sub_1BCFE2704();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_getKeyPath();
  v16 = MEMORY[0x1E0CAF868];
  sub_1BCFD8510(&qword_1EF4A4E18, &qword_1EF4A4E28, MEMORY[0x1E0CAF868]);
  sub_1BCFE2704();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v36 = v28;
  sub_1BCFE2728();
  v17 = v29;
  v19 = v26;
  v18 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v26, *v30, v29);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4DA8);
  v21 = v32;
  v32[3] = v20;
  v21[4] = sub_1BCFD8550(&qword_1EF4A4DA0, &qword_1EF4A4DA8, MEMORY[0x1E0CE9208]);
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_1BCFD8510(&qword_1EF4A4E30, &qword_1EF4A4E40, v16);
  sub_1BCFD8510(&qword_1EF4A4E08, &qword_1EF4A4E10, MEMORY[0x1E0CAF850]);
  v22 = v31;
  v23 = v33;
  sub_1BCFE2710();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v22);
}

uint64_t LiveVoicemailTip.actions.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58C8);
  sub_1BCFE29B0();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BCFE7780;
  sub_1BCFE2A40();
  sub_1BCFCC62C();
  sub_1BCFD7ACC();
  sub_1BCFE2998();
  v1 = sub_1BCFD7BAC(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v1;
}

unint64_t sub_1BCFD5E74()
{
  return 0xD000000000000025;
}

uint64_t sub_1BCFD5E90()
{
  return sub_1BCFD79B0();
}

uint64_t sub_1BCFD5EAC()
{
  return sub_1BCFD7A10();
}

uint64_t sub_1BCFD5EC8()
{
  return LiveVoicemailTip.actions.getter();
}

uint64_t sub_1BCFD5EDC()
{
  return LiveVoicemailTip.rules.getter();
}

uint64_t sub_1BCFD5EF0()
{
  return LiveVoicemailTip.options.getter();
}

void sub_1BCFD5F04(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000001BCFEA5B0;
}

unint64_t FaceTimeLinkTip.id.getter()
{
  return 0xD000000000000019;
}

unint64_t sub_1BCFD5F48()
{
  return 0xD000000000000019;
}

uint64_t sub_1BCFD5F64()
{
  return sub_1BCFE27DC();
}

void sub_1BCFD5F78(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001BCFEA640;
}

unint64_t FaceInFrameTip.id.getter()
{
  return 0xD000000000000025;
}

unint64_t sub_1BCFD5FBC()
{
  return 0xD000000000000025;
}

void sub_1BCFD5FD8(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000001BCFEA660;
}

uint64_t sub_1BCFD5FF8(uint64_t a1)
{
  return sub_1BCFD6CE4(a1, qword_1EF4A6B10);
}

uint64_t sub_1BCFD601C()
{
  return sub_1BCFD2714(&qword_1EF4A6B08, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6B10);
}

uint64_t static VideoReactionPickerTip.hasOpenedReactionPicker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(&qword_1EF4A6B08, (uint64_t)qword_1EF4A6B10, a1);
}

unint64_t VideoReactionPickerTip.id.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1BCFD607C(uint64_t a1)
{
  return sub_1BCFD70A8(a1, qword_1EF4A7278);
}

uint64_t sub_1BCFD60AC()
{
  return sub_1BCFD2714(qword_1EF4A6B28, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7278);
}

uint64_t sub_1BCFD60D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(qword_1EF4A6B28, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7278, a1);
}

uint64_t sub_1BCFD60F4(uint64_t a1)
{
  return sub_1BCFD3444(a1, qword_1EF4A6B28, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7278);
}

uint64_t (*sub_1BCFD6118())()
{
  uint64_t v0;

  if (qword_1EF4A6B28[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7278);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFD6194()
{
  return sub_1BCFD50E4(qword_1EF4A6B28, (uint64_t)qword_1EF4A7278);
}

uint64_t sub_1BCFD61B0(uint64_t a1)
{
  return sub_1BCFD5188(a1, qword_1EF4A6B28, (uint64_t)qword_1EF4A7278);
}

uint64_t (*sub_1BCFD61CC(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A6B28[0] != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7278);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

uint64_t VideoReactionPickerTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  sub_1BCFE2950();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7770;
  if (qword_1EF4A6B08 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A6B10);
  MEMORY[0x1E0C80A78](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  if (qword_1EF4A6B28[0] != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EF4A7278);
  v6 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1BCFE2968();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v9 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1BCFD650C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD7678(0, a1);
}

uint64_t static VideoReactionPickerTip.shouldShow.getter()
{
  return sub_1BCFD50E4(qword_1EF4A6B28, (uint64_t)qword_1EF4A7278);
}

uint64_t static VideoReactionPickerTip.shouldShow.setter(uint64_t a1)
{
  return sub_1BCFD5188(a1, qword_1EF4A6B28, (uint64_t)qword_1EF4A7278);
}

uint64_t (*static VideoReactionPickerTip.shouldShow.modify(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A6B28[0] != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7278);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

void sub_1BCFD6620(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_BYTE *)(*(_QWORD *)a1 + 41) = *(_BYTE *)(*(_QWORD *)a1 + 40);
  swift_beginAccess();
  sub_1BCFE29C8();
  swift_endAccess();
  free(v1);
}

unint64_t sub_1BCFD6680()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1BCFD669C()
{
  return VideoReactionPickerTip.rules.getter();
}

void sub_1BCFD66B0(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000001BCFEA690;
}

unint64_t SOSMiniTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t _s11TelephonyUI12FavoritesTipV7optionsSay0D3Kit0D6Option_pGvg_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t OpaqueTypeConformance2;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EE8);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F38);
  v4 = sub_1BCFE289C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7780;
  sub_1BCFE28A8();
  v5 = MEMORY[0x1E0CE95B8];
  sub_1BCFE2848();
  swift_bridgeObjectRelease();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EF8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v4;
  v14 = v5;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C3B6E87C](v3, v0, OpaqueTypeConformance2);
  v13 = v0;
  v14 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v11 = sub_1BCFE2854();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v11;
}

uint64_t SOSMiniTip.actions.getter()
{
  return sub_1BCFD68C8();
}

uint64_t sub_1BCFD68C8()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58C8);
  sub_1BCFE29B0();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BCFE7780;
  sub_1BCFE2A40();
  sub_1BCFD7ACC();
  sub_1BCFE2998();
  v1 = sub_1BCFD7BAC(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v1;
}

unint64_t sub_1BCFD69E4()
{
  return 0xD000000000000019;
}

uint64_t sub_1BCFD6A00()
{
  return SOSMiniTip.actions.getter();
}

void sub_1BCFD6A14(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001BCFEA6B0;
}

unint64_t CallHistorySearchTip.id.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t CallHistorySearchTip.title.getter()
{
  return sub_1BCFD6A70();
}

uint64_t sub_1BCFD6A70()
{
  sub_1BCFCC62C();
  sub_1BCFD7ACC();
  return sub_1BCFE2A04();
}

uint64_t CallHistorySearchTip.message.getter()
{
  return sub_1BCFD6AC8();
}

uint64_t sub_1BCFD6AC8()
{
  sub_1BCFCC62C();
  sub_1BCFD7ACC();
  return sub_1BCFE2A04();
}

uint64_t CallHistorySearchTip.options.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  _QWORD v16[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EF0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4EE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F30);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BCFE7770;
  v9 = sub_1BCFE286C();
  v10 = MEMORY[0x1E0CE9548];
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = v10;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  sub_1BCFE2878();
  v11 = sub_1BCFE289C();
  v12 = MEMORY[0x1E0CE95B8];
  *(_QWORD *)(v8 + 96) = v11;
  *(_QWORD *)(v8 + 104) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 72));
  sub_1BCFE28A8();
  sub_1BCFE283C();
  swift_bridgeObjectRelease();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C3B6E87C](v7, v4, OpaqueTypeConformance2);
  v16[0] = v4;
  v16[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v14 = sub_1BCFE2854();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1BCFD6CC0(uint64_t a1)
{
  return sub_1BCFD6CE4(a1, qword_1EF4A6538);
}

uint64_t sub_1BCFD6CE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1BCFE2980();
}

uint64_t sub_1BCFD6D44()
{
  return sub_1BCFD2714(qword_1EF4A6550, &qword_1EF4A4F00, (uint64_t)qword_1EF4A6538);
}

uint64_t static CallHistorySearchTip.hasSearchedCallHistory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD32B4(qword_1EF4A6550, (uint64_t)qword_1EF4A6538, a1);
}

uint64_t sub_1BCFD6D84()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_allocate_value_buffer(v0, qword_1EF4A7248);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52C8);
  sub_1BCFE2890();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7780;
  sub_1BCFE2884();
  return sub_1BCFE29D4();
}

uint64_t sub_1BCFD6E88()
{
  return sub_1BCFD2714(qword_1EF4A65F0, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7248);
}

uint64_t sub_1BCFD6EAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(qword_1EF4A65F0, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7248, a1);
}

uint64_t sub_1BCFD6ED0(uint64_t a1)
{
  return sub_1BCFD3444(a1, qword_1EF4A65F0, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7248);
}

uint64_t (*sub_1BCFD6EF4())()
{
  uint64_t v0;

  if (qword_1EF4A65F0[0] != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7248);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFD6F70()
{
  return sub_1BCFD50E4(qword_1EF4A65F0, (uint64_t)qword_1EF4A7248);
}

uint64_t sub_1BCFD6F8C(uint64_t a1)
{
  return sub_1BCFD5188(a1, qword_1EF4A65F0, (uint64_t)qword_1EF4A7248);
}

uint64_t (*sub_1BCFD6FA8(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A65F0[0] != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7248);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

uint64_t sub_1BCFD7078(uint64_t a1)
{
  return sub_1BCFD70A8(a1, qword_1EF4A7230);
}

uint64_t sub_1BCFD70A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1BCFE29D4();
}

uint64_t sub_1BCFD7150()
{
  return sub_1BCFD2714(&qword_1EF4A65E8, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7230);
}

uint64_t sub_1BCFD7174@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCFD3394(&qword_1EF4A65E8, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7230, a1);
}

uint64_t sub_1BCFD7198(uint64_t a1)
{
  return sub_1BCFD3444(a1, &qword_1EF4A65E8, &qword_1EF4A4D88, (uint64_t)qword_1EF4A7230);
}

uint64_t (*sub_1BCFD71BC())()
{
  uint64_t v0;

  if (qword_1EF4A65E8 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF4A7230);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFD7238()
{
  return sub_1BCFD50E4(&qword_1EF4A65E8, (uint64_t)qword_1EF4A7230);
}

uint64_t sub_1BCFD7254(uint64_t a1)
{
  return sub_1BCFD5188(a1, &qword_1EF4A65E8, (uint64_t)qword_1EF4A7230);
}

uint64_t (*sub_1BCFD7270(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EF4A65E8 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EF4A7230);
  swift_beginAccess();
  sub_1BCFE29BC();
  v4 = *((_BYTE *)v2 + 41);
  swift_endAccess();
  *((_BYTE *)v2 + 40) = v4;
  return sub_1BCFD3670;
}

uint64_t CallHistorySearchTip.rules.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A4F48);
  v0 = *(_QWORD *)(*(_QWORD *)(sub_1BCFE2950() - 8) + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BCFE7630;
  if (qword_1EF4A6550[0] != -1)
    swift_once();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_1EF4A6538);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *))(v4 + 16))((char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BCFE2830();
  sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
  sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
  sub_1BCFE295C();
  v16[1] = v0;
  if (qword_1EF4A65F0[0] != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4D88);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF4A7248);
  v7 = swift_beginAccess();
  v8 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  MEMORY[0x1E0C80A78](v7);
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v11((char *)v16 - v9, v6, v5);
  sub_1BCFE2968();
  if (qword_1EF4A65E8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF4A7230);
  v13 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v13);
  v11((char *)v16 - v9, v12, v5);
  sub_1BCFE2968();
  sub_1BCFE2818();
  swift_bridgeObjectRelease();
  v14 = sub_1BCFE2818();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1BCFD7678@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v25 = a1;
  v26 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E10);
  v3 = *(_QWORD *)(v2 - 8);
  v29 = v2;
  v30 = v3;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E40);
  v7 = *(_QWORD *)(v6 - 8);
  v27 = v6;
  v28 = v7;
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E28);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4E58);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCFD8510(&qword_1EF4A4E48, &qword_1EF4A4E58, MEMORY[0x1E0CAF898]);
  sub_1BCFE2734();
  swift_getKeyPath();
  sub_1BCFE2704();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  swift_getKeyPath();
  v18 = MEMORY[0x1E0CAF868];
  sub_1BCFD8510(&qword_1EF4A4E18, &qword_1EF4A4E28, MEMORY[0x1E0CAF868]);
  sub_1BCFE2704();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v31 = v25;
  sub_1BCFE2728();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4DC8);
  v20 = v26;
  v26[3] = v19;
  v20[4] = sub_1BCFD8550(&qword_1EF4A4DC0, &qword_1EF4A4DC8, MEMORY[0x1E0CE9218]);
  __swift_allocate_boxed_opaque_existential_1(v20);
  sub_1BCFD8510(&qword_1EF4A4E30, &qword_1EF4A4E40, v18);
  sub_1BCFD8510(&qword_1EF4A4E08, &qword_1EF4A4E10, MEMORY[0x1E0CAF850]);
  v21 = v27;
  v22 = v29;
  sub_1BCFE26F8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v9, v21);
}

uint64_t sub_1BCFD7970@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BCFD5838(0, a1);
}

unint64_t sub_1BCFD7978()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1BCFD7994()
{
  return sub_1BCFD79B0();
}

uint64_t sub_1BCFD79B0()
{
  sub_1BCFCC62C();
  sub_1BCFD7ACC();
  return sub_1BCFE2A04();
}

uint64_t sub_1BCFD79F4()
{
  return sub_1BCFD7A10();
}

uint64_t sub_1BCFD7A10()
{
  sub_1BCFCC62C();
  sub_1BCFD7ACC();
  return sub_1BCFE2A04();
}

uint64_t sub_1BCFD7A54()
{
  return CallHistorySearchTip.rules.getter();
}

uint64_t sub_1BCFD7A68()
{
  return CallHistorySearchTip.options.getter();
}

void sub_1BCFD7A7C(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x80000001BCFEA6D0;
}

unint64_t sub_1BCFD7A9C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BCFE2C38();
  return sub_1BCFD7B10(a1, v2);
}

unint64_t sub_1BCFD7ACC()
{
  unint64_t result;

  result = qword_1EF4A58C0;
  if (!qword_1EF4A58C0)
  {
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF4A58C0);
  }
  return result;
}

unint64_t sub_1BCFD7B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1BCFD7BAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void (*v27)(char *);
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = MEMORY[0x1E0DEE9D8];
  sub_1BCFD85D0(0, 0, 0);
  v2 = v37;
  v3 = *(_QWORD *)(a1 + 16);
  sub_1BCFE2818();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58F8);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v6 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = &v26;
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - v8;
  v32 = v3;
  v26 = a1;
  if (v3)
  {
    v10 = sub_1BCFE29B0();
    v11 = v10;
    v12 = *(_QWORD *)(v10 - 8);
    v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v28 = *(_QWORD *)(v12 + 72);
    v29 = v13;
    v14 = 0;
    v30 = v12;
    v31 = v10;
    v27 = *(void (**)(char *))(v12 + 16);
    do
    {
      v36 = &v26;
      MEMORY[0x1E0C80A78](v10);
      v15 = (char *)&v26 + *(int *)(v4 + 48) - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      v35 = v16;
      v27(v15);
      v17 = &v9[*(int *)(v4 + 48)];
      *(_QWORD *)v9 = v14;
      v33 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
      v33(v17, v15, v11);
      v18 = sub_1BCFD85EC((uint64_t)v9, (uint64_t)v7);
      MEMORY[0x1E0C80A78](v18);
      v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1BCFE29A4();
      sub_1BCFD8634((uint64_t)v7);
      v2 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BCFD85D0(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v37;
      }
      v22 = *(_QWORD *)(v2 + 16);
      v21 = *(_QWORD *)(v2 + 24);
      v11 = v31;
      if (v22 >= v21 >> 1)
      {
        sub_1BCFD85D0(v21 > 1, v22 + 1, 1);
        v11 = v31;
        v2 = v37;
      }
      v34 = v14 + 1;
      *(_QWORD *)(v2 + 16) = v22 + 1;
      v33((char *)(v2 + v29 + v22 * v28), v20, v11);
      v37 = v2;
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58F8);
      v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
      v23 = MEMORY[0x1E0C80A78](v4);
      v7 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = MEMORY[0x1E0C80A78](v23);
      v9 = (char *)&v26 - v24;
      v14 = v34;
    }
    while (v32 != v34);
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1BCFD7F10()
{
  unint64_t result;

  result = qword_1EF4A4E90;
  if (!qword_1EF4A4E90)
  {
    result = MEMORY[0x1C3B6F710](")ba*(L", &type metadata for FavoritesTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4E90);
  }
  return result;
}

uint64_t sub_1BCFD7F54()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1BCFD7F64()
{
  unint64_t result;

  result = qword_1EF4A58D0;
  if (!qword_1EF4A58D0)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for SpeakerphoneTip, &type metadata for SpeakerphoneTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A58D0);
  }
  return result;
}

unint64_t sub_1BCFD7FAC()
{
  unint64_t result;

  result = qword_1EF4A4EA8;
  if (!qword_1EF4A4EA8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsSaveAsContactTip, &type metadata for RecentsSaveAsContactTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4EA8);
  }
  return result;
}

unint64_t sub_1BCFD7FF4()
{
  unint64_t result;

  result = qword_1EF4A4EC0;
  if (!qword_1EF4A4EC0)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsSaveAsFavoritesTip, &type metadata for RecentsSaveAsFavoritesTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4EC0);
  }
  return result;
}

unint64_t sub_1BCFD803C()
{
  unint64_t result;

  result = qword_1EF4A4EB0;
  if (!qword_1EF4A4EB0)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsBrandedCallingTip, &type metadata for RecentsBrandedCallingTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4EB0);
  }
  return result;
}

uint64_t sub_1BCFD8080()
{
  return MEMORY[0x1E0CE0408];
}

unint64_t sub_1BCFD8090()
{
  unint64_t result;

  result = qword_1EF4A4EB8;
  if (!qword_1EF4A4EB8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsUnknownCallersTip, &type metadata for RecentsUnknownCallersTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4EB8);
  }
  return result;
}

unint64_t sub_1BCFD80D8()
{
  unint64_t result;

  result = qword_1EF4A4EA0;
  if (!qword_1EF4A4EA0)
  {
    result = MEMORY[0x1C3B6F710]("Y^a*", &type metadata for LiveVoicemailTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A4EA0);
  }
  return result;
}

unint64_t sub_1BCFD8120()
{
  unint64_t result;

  result = qword_1EF4A58D8;
  if (!qword_1EF4A58D8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for FaceTimeLinkTip, &type metadata for FaceTimeLinkTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A58D8);
  }
  return result;
}

unint64_t sub_1BCFD8168()
{
  unint64_t result;

  result = qword_1EF4A58E0;
  if (!qword_1EF4A58E0)
  {
    result = MEMORY[0x1C3B6F710](")]a*\bH", &type metadata for FaceInFrameTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A58E0);
  }
  return result;
}

unint64_t sub_1BCFD81B0()
{
  unint64_t result;

  result = qword_1EF4A58E8;
  if (!qword_1EF4A58E8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for VideoReactionPickerTip, &type metadata for VideoReactionPickerTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A58E8);
  }
  return result;
}

unint64_t sub_1BCFD81F8()
{
  unint64_t result;

  result = qword_1EF4A58F0;
  if (!qword_1EF4A58F0)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for SOSMiniTip, &type metadata for SOSMiniTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A58F0);
  }
  return result;
}

unint64_t sub_1BCFD8240()
{
  unint64_t result;

  result = qword_1EF4A52C0;
  if (!qword_1EF4A52C0)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for CallHistorySearchTip, &type metadata for CallHistorySearchTip);
    atomic_store(result, (unint64_t *)&qword_1EF4A52C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoritesTip()
{
  return &type metadata for FavoritesTip;
}

ValueMetadata *type metadata accessor for SpeakerphoneTip()
{
  return &type metadata for SpeakerphoneTip;
}

ValueMetadata *type metadata accessor for RecentsSaveAsContactTip()
{
  return &type metadata for RecentsSaveAsContactTip;
}

ValueMetadata *type metadata accessor for RecentsSaveAsFavoritesTip()
{
  return &type metadata for RecentsSaveAsFavoritesTip;
}

ValueMetadata *type metadata accessor for RecentsBrandedCallingTip()
{
  return &type metadata for RecentsBrandedCallingTip;
}

ValueMetadata *type metadata accessor for RecentsUnknownCallersTip()
{
  return &type metadata for RecentsUnknownCallersTip;
}

ValueMetadata *type metadata accessor for LiveVoicemailTip()
{
  return &type metadata for LiveVoicemailTip;
}

ValueMetadata *type metadata accessor for FaceTimeLinkTip()
{
  return &type metadata for FaceTimeLinkTip;
}

ValueMetadata *type metadata accessor for FaceInFrameTip()
{
  return &type metadata for FaceInFrameTip;
}

ValueMetadata *type metadata accessor for VideoReactionPickerTip()
{
  return &type metadata for VideoReactionPickerTip;
}

ValueMetadata *type metadata accessor for SOSMiniTip()
{
  return &type metadata for SOSMiniTip;
}

ValueMetadata *type metadata accessor for CallHistorySearchTip()
{
  return &type metadata for CallHistorySearchTip;
}

unint64_t sub_1BCFD8344()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EF4A4DD0;
  if (!qword_1EF4A4DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4DD8);
    v2[0] = sub_1BCFD8510(&qword_1EF4A4E60, &qword_1EF4A4E70, MEMORY[0x1E0CAF890]);
    v2[1] = sub_1BCFD888C(&qword_1EF4A4DE0, &qword_1EF4A4DF0, MEMORY[0x1E0DEAFC0], MEMORY[0x1E0DEAFA8]);
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0CAF830], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EF4A4DD0);
  }
  return result;
}

uint64_t sub_1BCFD83E8()
{
  return sub_1BCFD2D50(&qword_1EF4A4ED8, MEMORY[0x1E0CE9480]);
}

uint64_t sub_1BCFD840C()
{
  return sub_1BCFD2D50(&qword_1EF4A4ED0, MEMORY[0x1E0CE9470]);
}

unint64_t sub_1BCFD8430()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EF4A4E38;
  if (!qword_1EF4A4E38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4E40);
    v2 = sub_1BCFD8494();
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0CE9230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EF4A4E38);
  }
  return result;
}

unint64_t sub_1BCFD8494()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EF4A4E20;
  if (!qword_1EF4A4E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4E28);
    v2 = sub_1BCFD8510(&qword_1EF4A4E50, &qword_1EF4A4E58, MEMORY[0x1E0CE9240]);
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0CE9230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EF4A4E20);
  }
  return result;
}

uint64_t sub_1BCFD8510(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3B6F710](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BCFD8550(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = sub_1BCFD8430();
    v7[1] = sub_1BCFD8510(&qword_1EF4A4DF8, &qword_1EF4A4E10, MEMORY[0x1E0CE9220]);
    result = MEMORY[0x1C3B6F710](a3, v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

size_t sub_1BCFD85D0(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_1BCFD8674(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BCFD85EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCFD8634(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t sub_1BCFD8674(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A58C8);
  v10 = *(_QWORD *)(sub_1BCFE29B0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_1BCFE29B0() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_1BCFD87E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EF4A4DB0;
  if (!qword_1EF4A4DB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4DB8);
    v2[0] = sub_1BCFD8510(&qword_1EF4A4E78, &qword_1EF4A4E88, MEMORY[0x1E0CAF890]);
    v2[1] = sub_1BCFD888C(&qword_1EF4A4E00, &qword_1EF4A4E10, MEMORY[0x1E0DEB448], MEMORY[0x1E0DEB420]);
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0CAF7D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EF4A4DB0);
  }
  return result;
}

uint64_t sub_1BCFD888C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x1C3B6F710](MEMORY[0x1E0CAF848], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t TaskQueue.__allocating_init(priority:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TaskQueue.init(priority:)(a1);
  return v2;
}

uint64_t TaskQueue.init(priority:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;

  v38 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B0);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v37 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C0);
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53E8);
  v34 = *(_QWORD *)(v36 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[1] = v8;
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v33 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53D8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v33 - v16;
  v39 = v1;
  swift_defaultActor_initialize();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  v40 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53A8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DF07B8], v3);
  sub_1BCFE2B18();
  v35 = v17;
  sub_1BCFD8CE4((uint64_t)v17, (uint64_t)v15);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v15, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v21 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v39 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation, v15, v18);
    v22 = sub_1BCFE2ADC();
    v23 = *(_QWORD *)(v22 - 8);
    v25 = (uint64_t)v37;
    v24 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v37, v38, v22);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v22);
    v26 = v34;
    v27 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
    v28 = v11;
    v33[0] = v11;
    v29 = v36;
    v27(v9, v28, v36);
    v30 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = 0;
    *(_QWORD *)(v31 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v31 + v30, v9, v29);
    v32 = sub_1BCFCD298(v25, (uint64_t)&unk_1EF4A5908, v31);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v22);
    (*(void (**)(_QWORD, uint64_t))(v26 + 8))(v33[0], v29);
    *(_QWORD *)(v21 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle) = v32;
    sub_1BCFD248C((uint64_t)v35, &qword_1EF4A53D8);
    return v21;
  }
  return result;
}

uint64_t sub_1BCFD8C70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  sub_1BCFD248C(v3, &qword_1EF4A53D8);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
}

uint64_t sub_1BCFD8CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCFD8D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53E0);
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1BCFD8D90()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53E8);
  sub_1BCFE2B00();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_1BCFD8E18;
  return sub_1BCFE2B0C();
}

uint64_t sub_1BCFD8E18()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BCFD8E6C()
{
  uint64_t v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = *(int **)(v0 + 16);
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
  {
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 24);
    v4 = (uint64_t (*)(void))((char *)v1 + *v1);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v2;
    *v2 = v0;
    v2[1] = sub_1BCFD8F04;
    return v4();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1BCFD8F04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  v3 = *v0;
  swift_task_dealloc();
  sub_1BCFDA32C(v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 64) = v4;
  *v4 = v3;
  v4[1] = sub_1BCFD8E18;
  return sub_1BCFE2B0C();
}

uint64_t sub_1BCFD8FA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53E8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1BCFD9018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53E8) - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1BCFD25D8;
  return sub_1BCFD8D2C((uint64_t)v4, v5, v6, v3);
}

uint64_t sub_1BCFD9080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1BCFD90A0()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1BCFD9138;
  return sub_1BCFE2BF0();
}

uint64_t sub_1BCFD9138()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BCFD9188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v23 = a3;
  v24 = a4;
  v8 = sub_1BCFE2A94();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v22 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = a2 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  v17 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, v8);
  v19 = (_QWORD *)(v18 + ((v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  v20 = v24;
  *v19 = v23;
  v19[1] = v20;
  v25 = &unk_1EF4A5960;
  v26 = v18;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  sub_1BCFE2AE8();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1BCFD9318(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BCFD9188(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1BCFD9324(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v5[2] = a2;
  v5[3] = a5;
  v7 = swift_task_alloc();
  v5[4] = v7;
  v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v8 = (_QWORD *)swift_task_alloc();
  v5[5] = v8;
  *v8 = v5;
  v8[1] = sub_1BCFD93AC;
  return v10(v7);
}

uint64_t sub_1BCFD93AC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BCFD9400()
{
  uint64_t v0;

  sub_1BCFE2A94();
  sub_1BCFE2A88();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFD945C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1BCFD947C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1BCFD9518;
  return sub_1BCFE2C08();
}

uint64_t sub_1BCFD9518()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BCFD958C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFD95C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v23 = a3;
  v24 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4D98);
  v8 = sub_1BCFE2A94();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v22 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = a2 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  v17 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, v8);
  v19 = (_QWORD *)(v18 + ((v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  v20 = v24;
  *v19 = v23;
  v19[1] = v20;
  v25 = &unk_1EF4A5950;
  v26 = v18;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  sub_1BCFE2AE8();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1BCFD9758(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BCFD95C0(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1BCFD9764(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v5[3] = a2;
  v5[4] = a5;
  v7 = swift_task_alloc();
  v5[5] = v7;
  v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v8 = (_QWORD *)swift_task_alloc();
  v5[6] = v8;
  *v8 = v5;
  v8[1] = sub_1BCFD97EC;
  return v10(v7);
}

uint64_t sub_1BCFD97EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BCFD9850()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4D98);
  sub_1BCFE2A94();
  sub_1BCFE2A88();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFD98C0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4D98);
  sub_1BCFE2A94();
  sub_1BCFE2A7C();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFD9938(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53B8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v10[0] = &unk_1EF4A5928;
  v10[1] = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  sub_1BCFE2AE8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1BCFD9A10(uint64_t a1, int *a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v4 = sub_1BCFE27B8();
  v2[3] = v4;
  v2[4] = *(_QWORD *)(v4 - 8);
  v2[5] = swift_task_alloc();
  v7 = (uint64_t (*)(void))((char *)a2 + *a2);
  v5 = (_QWORD *)swift_task_alloc();
  v2[6] = v5;
  *v5 = v2;
  v5[1] = sub_1BCFD9A94;
  return v7();
}

uint64_t sub_1BCFD9A94()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BCFD9B08()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = *(void **)(v0 + 56);
  sub_1BCFE27AC();
  v2 = v1;
  v3 = v1;
  v4 = sub_1BCFE2794();
  v5 = sub_1BCFE2B30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 56);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v10;
    sub_1BCFE2B54();
    *v8 = v10;

    _os_log_impl(&dword_1BCFA3000, v4, v5, "Task failed with error: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A5940);
    swift_arrayDestroy();
    MEMORY[0x1C3B6F770](v8, -1, -1);
    MEMORY[0x1C3B6F770](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 56);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BCFD9CB0()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1BCFD25D8;
  return sub_1BCFD9A10((uint64_t)v3, v2);
}

uint64_t TaskQueue.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle))
    sub_1BCFE2B24();
  v1 = v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TaskQueue.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle))
    sub_1BCFE2B24();
  v1 = v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A53C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t TaskQueue.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1BCFD9E2C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1BCFD9E38()
{
  return type metadata accessor for TaskQueue();
}

uint64_t type metadata accessor for TaskQueue()
{
  uint64_t result;

  result = qword_1EF4A6750;
  if (!qword_1EF4A6750)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BCFD9E7C()
{
  unint64_t v0;

  sub_1BCFDA034();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for TaskQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskQueue.__allocating_init(priority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TaskQueue.sync<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 112)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 112));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1BCFD25D8;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of TaskQueue.throwingSync<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 120)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 120));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1BCFD236C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of TaskQueue.async(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_1BCFDA034()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF4A53D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A53A8);
    v0 = sub_1BCFE2AF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF4A53D0);
  }
}

uint64_t sub_1BCFDA08C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4D98);
  v1 = sub_1BCFE2A94();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFDA124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF4A4D98);
  v3 = *(_QWORD *)(sub_1BCFE2A94() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v0 + v4;
  v6 = v0 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  v7 = *(int **)v6;
  v8 = *(_QWORD *)(v6 + 8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_1BCFD236C;
  return sub_1BCFD9764((uint64_t)v9, v5, v7, v8, v2);
}

uint64_t sub_1BCFDA1D4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BCFE2A94();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFDA260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(sub_1BCFE2A94() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v0 + v4;
  v6 = v0 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  v7 = *(int **)v6;
  v8 = *(_QWORD *)(v6 + 8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_1BCFD25D8;
  return sub_1BCFD9324((uint64_t)v9, v5, v7, v8, v2);
}

uint64_t sub_1BCFDA308()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFDA32C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

double sub_1BCFDA340()
{
  return 13.0;
}

id sub_1BCFDA348()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DBD2F0]), sel_init);
  qword_1EF4A70C8 = (uint64_t)result;
  return result;
}

id sub_1BCFDA378()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
}

id sub_1BCFDA39C()
{
  id v0;
  id v1;
  id v2;
  id v3;

  v0 = objc_msgSend((id)objc_opt_self(), sel_videoMessageRecordGlyphImage);
  v1 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v2 = objc_msgSend(v0, sel_imageWithTintColor_, v1);

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v2);
  objc_msgSend(v3, sel_setContentMode_, 1);
  return v3;
}

id sub_1BCFDA468()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView);
  }
  else
  {
    if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location) & 1) != 0)
    {
      v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
      v5 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
      objc_msgSend(v4, sel_setBackgroundColor_, v5);
    }
    else
    {
      v6 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 18);
      v7 = objc_msgSend((id)objc_opt_self(), sel_effectForBlurEffect_style_, v6, 5);

      v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v7);
      v8 = objc_msgSend(v4, sel_contentView);
      v5 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
      objc_msgSend(v8, sel_setBackgroundColor_, v5);

    }
    v9 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_1BCFDA608()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3570]), sel_init);
  objc_msgSend(v0, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v0, sel_setAllowedUnits_, 192);
  result = objc_msgSend(v0, sel_setUnitsStyle_, 0);
  qword_1EF4A70D8 = (uint64_t)v0;
  return result;
}

id sub_1BCFDA67C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel);
  swift_beginAccess();
  return *v1;
}

void sub_1BCFDA6C0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1BCFDA710())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFDA754()
{
  return 0;
}

uint64_t sub_1BCFDA760@<X0>(_QWORD **a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xD0))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = sub_1BCFDC938;
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1BCFDA7DC(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (*v7)(uint64_t (*)(), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1BCFDC938;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xD8);
  sub_1BCFDA8CC(v3);
  return v7(v6, v5);
}

uint64_t sub_1BCFDA874()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_1BCFDA8CC(*v1);
  return v2;
}

uint64_t sub_1BCFDA8CC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1BCFDA8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_1BCFDA32C(v6);
}

uint64_t (*sub_1BCFDA938())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *sub_1BCFDA97C(char *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1BCFDA9BC(a1, a2);
}

_QWORD *sub_1BCFDA9BC(char *a1, void *a2)
{
  char *v2;
  char v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned int v18;
  double v19;
  unsigned int v20;
  double v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t (*v24)(id);
  _QWORD *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  id v29;
  objc_super v31;

  v4 = *a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding] = 0x402A000000000000;
  v5 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel;
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v9 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView;
  v10 = objc_msgSend((id)objc_opt_self(), sel_videoMessageRecordGlyphImage);
  v11 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v12 = objc_msgSend(v10, sel_imageWithTintColor_, v11);

  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v12);
  objc_msgSend(v13, sel_setContentMode_, 1);
  *(_QWORD *)&v7[v9] = v13;
  *(_QWORD *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView] = 0;
  v14 = &v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location] = v4;
  *(_QWORD *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel] = a2;
  v15 = qword_1EF4A70C0;
  v16 = a2;
  if (v15 != -1)
    swift_once();
  v17 = (void *)qword_1EF4A70C8;
  v18 = objc_msgSend((id)qword_1EF4A70C8, sel_videoMessagingEnabledM3);
  v19 = 20.0;
  if (v18)
    v19 = 15.0;
  *(double *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding] = v19;
  v20 = objc_msgSend(v17, sel_videoMessagingEnabledM3);
  v21 = 10.0;
  if (!v20)
    v21 = 15.0;
  *(double *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_cornerRadius] = v21;

  v31.receiver = v7;
  v31.super_class = (Class)type metadata accessor for MessageIndicatorView();
  v22 = objc_msgSendSuper2(&v31, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v23 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v24 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v22) + 0xF0);
  v25 = v22;
  v26 = v24(v16);
  (*(void (**)(uint64_t))((*v23 & *v25) + 0xF8))(v26);
  sub_1BCFDB660();
  (*(void (**)(void))((*v23 & *v25) + 0x108))();
  v27 = objc_allocWithZone(MEMORY[0x1E0DC3D80]);
  v28 = v25;
  v29 = objc_msgSend(v27, sel_initWithTarget_action_, v28, sel_handleTapGesture);
  objc_msgSend(v28, sel_addGestureRecognizer_, v29);

  return v28;
}

uint64_t type metadata accessor for MessageIndicatorView()
{
  return objc_opt_self();
}

void sub_1BCFDAD00()
{
  _QWORD *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t (*v7)(void);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  id v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double MaxX;
  double v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for MessageIndicatorView();
  objc_msgSendSuper2(&v55, sel_layoutSubviews);
  v1 = sub_1BCFDA468();
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);

  v2 = sub_1BCFDA468();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  v3 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  objc_msgSend(v3, sel_sizeToFit);
  v4 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  objc_msgSend(v4, sel_sizeToFit);
  v5 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView);
  v6 = objc_msgSend(v5, sel_sizeToFit);
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8);
  v8 = (void *)((uint64_t (*)(id))v7)(v6);
  objc_msgSend(v8, sel_indicatorImageSize);
  v10 = v9;
  v12 = v11;

  if (v10 != 0.0 || v12 != 0.0)
  {
    v13 = (void *)v7();
    objc_msgSend(v13, sel_indicatorImageSize);

    objc_msgSend(v5, sel_frame);
    objc_msgSend(v5, sel_setFrame_);
  }
  v14 = sub_1BCFDA468();
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_);

  v15 = sub_1BCFDA468();
  objc_msgSend(v15, sel_frame);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v56.origin.x = v17;
  v56.origin.y = v19;
  v56.size.width = v21;
  v56.size.height = v23;
  CGRectGetMidY(v56);
  objc_msgSend(v5, sel_center);
  objc_msgSend(v5, sel_setCenter_);
  v24 = sub_1BCFDA468();
  objc_msgSend(v24, sel_frame);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v57.origin.x = v26;
  v57.origin.y = v28;
  v57.size.width = v30;
  v57.size.height = v32;
  CGRectGetMidY(v57);
  objc_msgSend(v3, sel_center);
  objc_msgSend(v3, sel_setCenter_);
  v33 = sub_1BCFDA468();
  objc_msgSend(v33, sel_frame);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v58.origin.x = v35;
  v58.origin.y = v37;
  v58.size.width = v39;
  v58.size.height = v41;
  CGRectGetMidY(v58);
  objc_msgSend(v4, sel_center);
  objc_msgSend(v4, sel_setCenter_);
  v42 = *(double *)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding);
  objc_msgSend(v5, sel_frame);
  objc_msgSend(v5, sel_setFrame_, v42);
  objc_msgSend(v5, sel_frame);
  v43 = CGRectGetMaxX(v59) + 10.0;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v43);
  v44 = sub_1BCFDA468();
  objc_msgSend(v44, sel_frame);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v60.origin.x = v46;
  v60.origin.y = v48;
  v60.size.width = v50;
  v60.size.height = v52;
  MaxX = CGRectGetMaxX(v60);
  objc_msgSend(v4, sel_frame);
  v54 = MaxX - CGRectGetWidth(v61) - v42;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v4, sel_setFrame_, v54);
  sub_1BCFDB8A0();
}

double sub_1BCFDB0E8(double a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel), sel_sizeThatFits_);
  return a1;
}

uint64_t sub_1BCFDB1B0(id a1)
{
  _QWORD *v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t result;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for MessageIndicatorView();
  objc_msgSendSuper2(&v12, sel_traitCollectionDidChange_, a1);
  if (a1)
    a1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!a1)
  {

    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x108))(result);
  }
  v5 = sub_1BCFE2A40();
  v7 = v6;
  if (v5 == sub_1BCFE2A40() && v7 == v8)
  {

    return swift_bridgeObjectRelease_n();
  }
  v10 = sub_1BCFE2BFC();

  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x108))(result);
  return result;
}

void sub_1BCFDB34C(void *a1)
{
  _QWORD *v1;
  void (*v2)(void);
  id v3;
  void *v4;
  char **v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v2 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xC0);
  v3 = a1;
  v2();
  v19 = *((_BYTE *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location);
  v18 = 0;
  LOBYTE(v2) = static RecentsListItemLocation.== infix(_:_:)(&v19, &v18);
  v4 = (void *)objc_opt_self();
  v5 = &selRef_systemGreenColor;
  if ((v2 & 1) == 0)
    v5 = &selRef_systemBlueColor;
  v6 = objc_msgSend(v4, *v5);
  v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView);
  v17 = v6;
  v8 = objc_msgSend(v3, sel_indicatorImageWithDefaultTintColor_);
  objc_msgSend(v7, sel_setImage_, v8);

  if (objc_msgSend(v3, sel_isRead))
    v9 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  else
    v9 = v17;
  v10 = v9;
  objc_msgSend(v7, sel_setTintColor_, v9);

  v11 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  objc_msgSend(v3, sel_isVideo);
  sub_1BCFCC62C();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1BCFE2A34();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setText_, v12);

  objc_msgSend(v3, sel_duration);
  v13 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  if (v14 <= 0.0)
  {
    objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel), sel_setText_, 0);
  }
  else
  {
    if (qword_1EF4A70D0 != -1)
      swift_once();
    v15 = (void *)qword_1EF4A70D8;
    objc_msgSend(v3, sel_duration);
    v16 = objc_msgSend(v15, sel_stringFromTimeInterval_);
    objc_msgSend(v13, sel_setText_, v16);

  }
  objc_msgSend(v1, sel_setNeedsLayout);

}

id sub_1BCFDB5DC()
{
  char *v0;
  id v1;

  v1 = sub_1BCFDA468();
  objc_msgSend(v0, sel_addSubview_, v1);

  objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView]);
  objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel]);
  return objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel]);
}

void sub_1BCFDB660()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = sub_1BCFDA468();
  v2 = objc_msgSend(v1, sel_layer);

  objc_msgSend(v2, sel_setCornerCurve_, *MEMORY[0x1E0CD2A68]);
  v3 = sub_1BCFDA468();
  v4 = objc_msgSend(v3, sel_layer);

  objc_msgSend(v4, sel_setCornerRadius_, *(double *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_cornerRadius));
  v5 = sub_1BCFDA468();
  v6 = objc_msgSend(v5, sel_layer);

  objc_msgSend(v6, sel_setMasksToBounds_, 1);
}

void sub_1BCFDB744()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = (void *)objc_opt_self();
  sub_1BCFE2A40();
  v2 = (void *)sub_1BCFE2A34();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v2, 0x8000, 1);

  if (!v3)
    v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E0DC4A88]);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v4, sel_setFont_, v6);

  v7 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  v8 = objc_msgSend(v5, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v7, sel_setFont_, v8);

}

void sub_1BCFDB8A0()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  double Width;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    v1 = *(void **)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel];
    v2 = *(void **)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel];
    v3 = *(id *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView];
    v4 = v1;
    v5 = v2;
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v20);
    objc_msgSend(v3, sel_frame);
    v8 = Width - v7;
    objc_msgSend(v3, sel_frame);
    v9 = v8 - CGRectGetMinX(v21);
    objc_msgSend(v3, sel_frame);
    objc_msgSend(v3, sel_setFrame_, v9);

    v10 = v4;
    objc_msgSend(v0, sel_bounds);
    v11 = CGRectGetWidth(v22);
    objc_msgSend(v10, sel_frame);
    v13 = v11 - v12;
    objc_msgSend(v10, sel_frame);
    v14 = v13 - CGRectGetMinX(v23);
    objc_msgSend(v10, sel_frame);
    objc_msgSend(v10, sel_setFrame_, v14);

    v19 = v5;
    objc_msgSend(v0, sel_bounds);
    v15 = CGRectGetWidth(v24);
    objc_msgSend(v19, sel_frame);
    v17 = v15 - v16;
    objc_msgSend(v19, sel_frame);
    v18 = v17 - CGRectGetMinX(v25);
    objc_msgSend(v19, sel_frame);
    objc_msgSend(v19, sel_setFrame_, v18);

  }
}

uint64_t sub_1BCFDBA8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t result;
  void (*v14)(char *);
  void *v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A59C8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BCFE274C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v18 - v10;
  v12 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  result = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))(v9);
  if (result)
  {
    v14 = (void (*)(char *))result;
    v15 = (void *)(*(uint64_t (**)(void))((*v12 & *v0) + 0xB8))();
    v16 = objc_msgSend(v15, sel_mediaURL);

    if (v16)
    {
      sub_1BCFE2740();

      v17 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v17(v3, v8, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
      {
        v17(v11, v3, v4);
        v14(v11);
        sub_1BCFDA32C((uint64_t)v14);
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    }
    sub_1BCFDA32C((uint64_t)v14);
    return sub_1BCFDC8D4((uint64_t)v3);
  }
  return result;
}

id MessageIndicatorView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void MessageIndicatorView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MessageIndicatorView.__deallocating_deinit()
{
  return sub_1BCFD016C(type metadata accessor for MessageIndicatorView);
}

void sub_1BCFDBDD8(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  sub_1BCFDB34C(a1);
  v2 = *(id *)(v1 + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel);
  sub_1BCFCC62C();
  v3 = (id)sub_1BCFE2A34();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setText_, v3);

}

id sub_1BCFDBE5C()
{
  char *v0;
  id v1;

  v1 = sub_1BCFDA468();
  objc_msgSend(v0, sel_addSubview_, v1);

  objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView]);
  objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel]);
  objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel]);
  return objc_msgSend(v0, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel]);
}

void sub_1BCFDBEF8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v1 = (void *)objc_opt_self();
  sub_1BCFE2A40();
  v2 = (void *)sub_1BCFE2A34();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v2, 0x8000, 1);

  v4 = *MEMORY[0x1E0DC4A88];
  if (!v3)
    v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E0DC4A88]);
  v5 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v5, sel_setFont_, v7);

  v8 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  v9 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v8, sel_setFont_, v9);

  sub_1BCFE2A40();
  v10 = (void *)sub_1BCFE2A34();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v10, 0, 1);

  if (!v11)
    v11 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, v4);
  v12 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  v13 = *(id *)(v0 + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel);
  v14 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v11, 0.0);
  objc_msgSend(v13, sel_setFont_, v14);

  v15 = *(void **)(v0 + v12);
  v16 = (void *)objc_opt_self();
  v17 = v15;
  v18 = objc_msgSend(v16, sel_secondaryLabelColor);
  objc_msgSend(v17, sel_setTextColor_, v18);

}

void sub_1BCFDC16C()
{
  char *v0;
  uint64_t v1;
  double v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  objc_msgSendSuper2(&v7, sel_layoutSubviews);
  v1 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel], sel_sizeToFit);
  v2 = *(double *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding];
  v3 = *(id *)&v0[v1];
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v2);

  v4 = *(id *)&v0[v1];
  objc_msgSend(v0, sel_frame);
  objc_msgSend(*(id *)&v0[v1], sel_frame);
  v5 = objc_msgSend(*(id *)&v0[v1], sel_font);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_descender);

    objc_msgSend(v4, sel_frame);
    objc_msgSend(v4, sel_setFrame_);

  }
  else
  {
    __break(1u);
  }
}

void sub_1BCFDC2D0(double a1, double a2)
{
  char *v2;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  objc_msgSendSuper2(&v8, sel_sizeThatFits_, a1, a2);
  v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel], sel_sizeThatFits_, a1, a2);
  v6 = objc_msgSend(*(id *)&v2[v5], sel_font);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_descender);

  }
  else
  {
    __break(1u);
  }
}

_QWORD *sub_1BCFDC3F4(char *a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char v6;
  uint64_t v7;
  id v8;
  char *v9;
  char v11;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = *a1;
  v7 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  v8 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v9 = v5;
  *(_QWORD *)&v5[v7] = objc_msgSend(v8, sel_init);

  v11 = v6;
  return sub_1BCFDA9BC(&v11, a2);
}

_QWORD *sub_1BCFDC488(char *a1, void *a2)
{
  char *v2;
  char v4;
  uint64_t v5;
  id v6;
  char *v7;
  char v9;

  v4 = *a1;
  v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);

  v9 = v4;
  return sub_1BCFDA9BC(&v9, a2);
}

id sub_1BCFDC50C(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  v4 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

void sub_1BCFDC640()
{
  uint64_t v0;

}

id SensitiveMessageIndicatorView.__deallocating_deinit()
{
  return sub_1BCFD016C(type metadata accessor for SensitiveMessageIndicatorView);
}

uint64_t sub_1BCFDC66C()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t sub_1BCFDC688()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

void sub_1BCFDC6A4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char *v8;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding] = 0x402A000000000000;
  v1 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v2 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v3 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView;
  v4 = objc_msgSend((id)objc_opt_self(), sel_videoMessageRecordGlyphImage);
  v5 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v6 = objc_msgSend(v4, sel_imageWithTintColor_, v5);

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v6);
  objc_msgSend(v7, sel_setContentMode_, 1);
  *(_QWORD *)&v0[v3] = v7;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView] = 0;
  v8 = &v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;

  sub_1BCFE2BA8();
  __break(1u);
}

uint64_t type metadata accessor for SensitiveMessageIndicatorView()
{
  return objc_opt_self();
}

uint64_t method lookup function for MessageIndicatorView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MessageIndicatorView.update(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t method lookup function for SensitiveMessageIndicatorView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BCFDC8D4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A59C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BCFDC914()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFDC938()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BCFDC964()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1BCFDC96C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1BCFDC97C()
{
  return swift_allocObject();
}

id sub_1BCFDC98C()
{
  uint64_t ObjCClassFromMetadata;

  type metadata accessor for BundleFinder();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
}

uint64_t type metadata accessor for BundleFinder()
{
  return objc_opt_self();
}

BOOL static RecentsListItemLocation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecentsListItemLocation.hash(into:)()
{
  return sub_1BCFE2C50();
}

uint64_t RecentsListItemLocation.hashValue.getter()
{
  sub_1BCFE2C44();
  sub_1BCFE2C50();
  return sub_1BCFE2C5C();
}

BOOL sub_1BCFDCA70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1BCFDCA88()
{
  qword_1EF4A70E8 = 0x4030000000000000;
}

id sub_1BCFDCAA0()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id sub_1BCFDCAB0()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

id sub_1BCFDCAC0()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

id sub_1BCFDCAC8()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36E8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

id sub_1BCFDCB04()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

id sub_1BCFDCB14()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

id sub_1BCFDCB1C()
{
  uint64_t v0;

  return *(id *)(v0 + 56);
}

id sub_1BCFDCB24()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
}

id sub_1BCFDCB48()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 64);
}

void sub_1BCFDCB78(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = a1;

}

uint64_t (*sub_1BCFDCBBC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_1BCFDCBF8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 72);
  v2 = v1;
  return v1;
}

void sub_1BCFDCC38(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = a1;

}

uint64_t (*sub_1BCFDCC7C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1BCFDCCB8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 80);
  v2 = v1;
  return v1;
}

void sub_1BCFDCCF8(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = a1;

}

uint64_t (*sub_1BCFDCD3C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1BCFDCD78()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 88);
  v2 = v1;
  return v1;
}

void sub_1BCFDCDB8(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 88);
  *(_QWORD *)(v1 + 88) = a1;

}

uint64_t (*sub_1BCFDCDFC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFDCE38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 376))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1BCFDCE68(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t (*v4)(id, uint64_t);
  id v5;

  v2 = *(id *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(uint64_t (**)(id, uint64_t))(**(_QWORD **)a2 + 384);
  v5 = *(id *)a1;
  return v4(v2, v3);
}

void *sub_1BCFDCEA8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 96);
  v2 = v1;
  return v1;
}

void sub_1BCFDCEEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  swift_beginAccess();
  v5 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;

}

uint64_t (*sub_1BCFDCF3C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1BCFDCF78()
{
  return 45.0;
}

uint64_t sub_1BCFDCF8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 424))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFDCFBC(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 432))(*a1);
}

id sub_1BCFDCFEC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  double v4;
  double Height;
  double Width;
  id v7;
  void *v8;
  id v9;
  CGRect v11;
  CGRect v12;

  v1 = *(void **)(v0 + 136);
  if (v1)
  {
    v2 = *(id *)(v0 + 136);
  }
  else
  {
    if (qword_1EF4A6728 != -1)
      swift_once();
    if (objc_msgSend((id)qword_1EF4A6710, sel_recentsCallTapTargetsEnabled))
    {
      v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_init);
      LODWORD(v4) = 1148846080;
      objc_msgSend(v3, sel_tp_setCHCRPriority_, v4);
    }
    else
    {
      v3 = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 4);
      objc_msgSend(v3, sel_bounds);
      Height = CGRectGetHeight(v11);
      objc_msgSend(v3, sel_bounds);
      Width = CGRectGetWidth(v12);
      if (Height <= Width)
        Height = Width;
      v7 = objc_msgSend(v3, sel_layer);

      objc_msgSend(v7, sel_setCornerRadius_, Height);
    }
    v8 = *(void **)(v0 + 136);
    *(_QWORD *)(v0 + 136) = v3;
    v2 = v3;

    v1 = 0;
  }
  v9 = v1;
  return v2;
}

void sub_1BCFDD144(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = a1;

}

void (*sub_1BCFDD150(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1BCFDCFEC();
  return sub_1BCFDD184;
}

void sub_1BCFDD184(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = v2;

}

uint64_t sub_1BCFDD194@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 448))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFDD1C4(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 456))(*a1);
}

id sub_1BCFDD1F4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  double Height;
  double Width;
  id v7;
  void *v8;
  id v9;
  CGRect v11;
  CGRect v12;

  v1 = *(void **)(v0 + 144);
  if (v1)
  {
    v2 = *(id *)(v0 + 144);
  }
  else
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);
    v4 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
    objc_msgSend(v3, sel_setTintColor_, v4);

    objc_msgSend(v3, sel_bounds);
    Height = CGRectGetHeight(v11);
    objc_msgSend(v3, sel_bounds);
    Width = CGRectGetWidth(v12);
    if (Height <= Width)
      Height = Width;
    v7 = objc_msgSend(v3, sel_layer);
    objc_msgSend(v7, sel_setCornerRadius_, Height);

    v8 = *(void **)(v0 + 144);
    *(_QWORD *)(v0 + 144) = v3;
    v2 = v3;

    v1 = 0;
  }
  v9 = v1;
  return v2;
}

void sub_1BCFDD310(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = a1;

}

void (*sub_1BCFDD31C(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1BCFDD1F4();
  return sub_1BCFDD350;
}

void sub_1BCFDD350(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = v2;

}

id sub_1BCFDD360()
{
  uint64_t v0;

  return *(id *)(v0 + 152);
}

id sub_1BCFDD368()
{
  uint64_t v0;

  return *(id *)(v0 + 160);
}

id sub_1BCFDD370()
{
  uint64_t v0;

  return *(id *)(v0 + 168);
}

id RecentsListItemViewHelper.rootStackView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 176);
}

uint64_t sub_1BCFDD380@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 480))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = sub_1BCFE1644;
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1BCFDD3EC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (*v7)(uint64_t (*)(), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1BCFE1644;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(_QWORD **)a2 + 488);
  sub_1BCFDA8CC(v3);
  return v7(v6, v5);
}

uint64_t sub_1BCFDD474()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 184);
  sub_1BCFDA8CC(v1);
  return v1;
}

uint64_t sub_1BCFDD4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 184);
  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = a2;
  return sub_1BCFDA32C(v5);
}

uint64_t (*sub_1BCFDD510())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFDD54C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 504))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = sub_1BCFDC938;
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1BCFDD5B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (*v7)(uint64_t (*)(), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1BCFDC938;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(_QWORD **)a2 + 512);
  sub_1BCFDA8CC(v3);
  return v7(v6, v5);
}

uint64_t sub_1BCFDD640()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 200);
  sub_1BCFDA8CC(v1);
  return v1;
}

uint64_t sub_1BCFDD68C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 200) = a1;
  *(_QWORD *)(v2 + 208) = a2;
  return sub_1BCFDA32C(v5);
}

uint64_t (*sub_1BCFDD6DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BCFDD718@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 528))();
  *a2 = result;
  return result;
}

uint64_t sub_1BCFDD748(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 536);
  v4 = *a1;
  return v3(v2);
}

void *sub_1BCFDD784()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 216);
  v2 = v1;
  return v1;
}

void sub_1BCFDD7C4(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 216);
  *(_QWORD *)(v1 + 216) = a1;

}

uint64_t (*sub_1BCFDD808())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1BCFDD844(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_1BCFDD850()
{
  swift_beginAccess();
  __asm { BR              X10 }
}

void sub_1BCFDD89C()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;

  v1 = sub_1BCFDFFD0();
  v2 = objc_msgSend(v1, sel_superview);

  if (!v2)
    sub_1BCFDFE24(v1);
  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
  sub_1BCFDDB0C(v1, v3);

}

void sub_1BCFDDB0C(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v3 = v2;
  v4 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 280);
  if (!a2)
  {
    v21 = (id)v4();
    objc_msgSend(v21, sel_removeFromSuperview);
LABEL_8:
    v20 = v21;
    goto LABEL_9;
  }
  v21 = a2;
  v6 = (void *)v4();
  objc_msgSend(v6, sel_setImage_, v21);

  v7 = (void *)v4();
  v8 = objc_msgSend(v7, sel_superview);

  if (!v8
    || (sub_1BCFE160C(0, &qword_1EF4A52F0),
        v9 = a1,
        v10 = v8,
        v11 = sub_1BCFE2B48(),
        v10,
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = (void *)v4();
    objc_msgSend(v12, sel_removeFromSuperview);

  }
  v13 = (void *)v4();
  v14 = objc_msgSend(v13, sel_superview);

  if (v14)
    goto LABEL_8;
  v15 = (void *)v4();
  objc_msgSend(a1, sel_addSubview_, v15);

  v16 = *(double *)(v3 + 112);
  v17 = v16 * 0.4;
  v18 = v16 - v16 * 0.4;
  v19 = (void *)v4();
  objc_msgSend(v19, sel_setFrame_, v18, v18, v17, v17);

  v20 = v19;
LABEL_9:

}

uint64_t sub_1BCFDDCD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 224);
  return result;
}

void sub_1BCFDDD14(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  swift_beginAccess();
  *(_BYTE *)(v1 + 224) = v2;
  sub_1BCFDD850();
}

char *sub_1BCFDDD54()
{
  return &byte_1EF4A70F0;
}

uint64_t static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.getter()
{
  swift_beginAccess();
  return byte_1EF4A70F0;
}

uint64_t static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EF4A70F0 = a1;
  return result;
}

uint64_t (*static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1BCFDDE24()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DBD2F0]), sel_init);
  qword_1EF4A6710 = (uint64_t)result;
  return result;
}

char *RecentsListItemViewHelper.__allocating_init(parentView:location:)(void *a1, char *a2)
{
  char *v4;

  swift_allocObject();
  v4 = sub_1BCFE0450(a1, a2);

  return v4;
}

char *RecentsListItemViewHelper.init(parentView:location:)(void *a1, char *a2)
{
  char *v3;

  v3 = sub_1BCFE0450(a1, a2);

  return v3;
}

void sub_1BCFDDED8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  unsigned int v15;
  double v16;
  double v17;
  unsigned int v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  double v32;
  id v33;
  unsigned int v34;
  void *v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  unsigned int v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_telephonyUIBodyShortEmphasizedFont);
  v3 = objc_msgSend(v2, sel__fontAdjustedForCurrentContentSizeCategory);

  v4 = objc_msgSend(v1, sel_telephonyUISubheadlineShortFont);
  v5 = objc_msgSend(v4, sel__fontAdjustedForCurrentContentSizeCategory);

  objc_msgSend(*(id *)(v0 + 16), sel_setFont_, v3);
  objc_msgSend(*(id *)(v0 + 48), sel_setFont_, v3);
  objc_msgSend(*(id *)(v0 + 24), sel_setFont_, v5);
  objc_msgSend(*(id *)(v0 + 32), sel_setFont_, v5);
  objc_msgSend(*(id *)(v0 + 40), sel_setFont_, v5);

  objc_msgSend(*(id *)(v0 + 152), sel_setSpacing_, 4.0);
  v6 = *(void **)(v0 + 160);
  v7 = *(void **)(v0 + 24);
  objc_msgSend(v7, sel_effectiveFirstBaselineOffsetFromTop);
  objc_msgSend(v6, sel_setCustomFirstBaselineOffsetFromTop_);
  v8 = *(void **)(v0 + 168);
  v9 = objc_msgSend(v7, sel_font);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 19.0);
    v12 = v11;

  }
  else
  {
    v12 = 19.0;
  }
  objc_msgSend(v8, sel_setRowSpacing_, v12);
  v13 = *(void **)(v0 + 232);
  v14 = objc_msgSend(v13, sel_traitCollection);
  v15 = objc_msgSend(v14, sel_isPreferredContentSizeCategoryAccessible);

  v16 = 10.0;
  v17 = 0.0;
  if (v15)
    v16 = 0.0;
  (*(void (**)(uint64_t *__return_ptr, id))(*(_QWORD *)v0 + 552))(&v45, objc_msgSend(v8, sel_setColumnSpacing_, v16));
  v18 = v45;
  if (v45 == 3)
  {
    v19 = objc_msgSend(*(id *)(v0 + 24), sel_font);
    if (!v19)
      goto LABEL_15;
    v20 = v19;
LABEL_13:
    objc_msgSend(v20, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 0.0);
    goto LABEL_14;
  }
  v21 = objc_msgSend(*(id *)(v0 + 24), sel_font);
  v20 = v21;
  if (v18 > 1)
  {
    if (!v21)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v21)
  {
    objc_msgSend(v21, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 4.0);
LABEL_14:
    v17 = v22;

    goto LABEL_15;
  }
  v17 = 4.0;
LABEL_15:
  objc_msgSend(v6, sel_setSpacing_, v17);
  sub_1BCFE01D0();
  v23 = *(void **)(v0 + 176);
  v24 = objc_msgSend(v23, sel_arrangedSubviews);
  if (!v24)
    goto LABEL_25;
  v25 = v24;
  sub_1BCFE160C(0, &qword_1EF4A52F0);
  v26 = sub_1BCFE2A58();

  if (v26 >> 62)
  {
    sub_1BCFE2818();
    v29 = sub_1BCFE2BB4();
    swift_bridgeObjectRelease();
    if (v29)
      goto LABEL_18;
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_24;
LABEL_18:
  if ((v26 & 0xC000000000000001) != 0)
  {
    v27 = (id)MEMORY[0x1C3B6EB88](0, v26);
  }
  else
  {
    if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v27 = *(id *)(v26 + 32);
  }
  v28 = v27;
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_setLayoutMargins_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

LABEL_25:
  v30 = objc_msgSend(v13, sel_traitCollection);
  v31 = objc_msgSend(v30, sel_isPreferredContentSizeCategoryAccessible);

  if (v31)
    v32 = 0.0;
  else
    v32 = 16.0;
  objc_msgSend(v23, sel_setDirectionalLayoutMargins_, 12.0, 16.0, 12.0, v32);
  v33 = objc_msgSend(v13, sel_traitCollection);
  v34 = objc_msgSend(v33, sel_isPreferredContentSizeCategoryAccessible);

  v35 = *(void **)(v0 + 40);
  if (v34)
  {
    objc_msgSend(*(id *)(v0 + 40), sel_setTextAlignment_, 4);
    objc_msgSend(v23, sel_setAxis_, 1);
    v36 = objc_msgSend(v35, sel_font);
    if (v36)
    {
      v37 = v36;
      objc_msgSend(v36, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 20.0);
      v39 = v38;

    }
    else
    {
      v39 = 20.0;
    }
    objc_msgSend(v7, sel_effectiveBaselineOffsetFromContentBottom);
    v42 = v39 - v43;
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 40), sel_setTextAlignment_, 2);
    objc_msgSend(v23, sel_setAxis_, 0);
    v40 = objc_msgSend(v13, sel_traitCollection);
    v41 = objc_msgSend(v40, sel_isPreferredContentSizeCategoryAccessible);

    v42 = 6.0;
    if (v41)
      v42 = 0.0;
  }
  v44 = (id)(*(uint64_t (**)(id))(*(_QWORD *)v0 + 448))(objc_msgSend(v23, sel_setSpacing_, v42));
  objc_msgSend(v44, sel_setNeedsUpdateConfiguration);

}

uint64_t sub_1BCFDE41C(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t (*v56)(void);
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  _BYTE *v82;
  int v83;
  _BOOL8 v84;
  _BOOL8 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  unint64_t v100;
  id v101;
  char v102;
  uint64_t v103;
  id v104;
  double v105;
  void *v106;
  id v107;
  void *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  void *v121;
  unint64_t v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  unint64_t v131;
  id v132;
  char v133;
  double v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  _QWORD *v139;
  _QWORD *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  unsigned int v149;
  _QWORD *v150;
  void *v151;
  void (*v152)(void *);
  _QWORD *v154;
  id v155;
  _BYTE v156[4];
  int v157;
  _BYTE *v158;
  _BYTE *v159;
  _BYTE *v160;
  _BYTE *v161;
  uint64_t v162;
  id v163;
  char v164;
  unsigned __int8 v165;
  unsigned __int8 v166[24];

  v2 = v1;
  v4 = sub_1BCFE2770();
  v162 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v158 = &v156[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52D0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v161 = &v156[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = MEMORY[0x1E0C80A78](v7);
  v160 = &v156[-v10];
  v11 = MEMORY[0x1E0C80A78](v9);
  v159 = &v156[-v12];
  MEMORY[0x1E0C80A78](v11);
  v14 = &v156[-v13];
  v15 = a1[3];
  v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v15);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  (*(void (**)(uint64_t))(*v1 + 360))(v17);
  v18 = (void *)v1[2];
  v19 = a1[3];
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  (*(void (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
  if (v21)
  {
    v22 = (void *)sub_1BCFE2A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v18, sel_setText_, v22);

  v23 = a1[3];
  v24 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v23);
  v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 56))(v23, v24);
  objc_msgSend(v18, sel_setTextColor_, v25);

  v26 = (void *)v2[6];
  v27 = a1[3];
  v28 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v27);
  (*(void (**)(uint64_t, uint64_t))(v28 + 48))(v27, v28);
  if (v29)
  {
    v30 = (void *)sub_1BCFE2A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v26, sel_setText_, v30);

  v31 = objc_msgSend(v18, sel_textColor);
  objc_msgSend(v26, sel_setTextColor_, v31);

  v163 = (id)v2[3];
  v32 = a1[3];
  v33 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v32);
  (*(void (**)(uint64_t, uint64_t))(v33 + 32))(v32, v33);
  if (v34)
  {
    v35 = (void *)sub_1BCFE2A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = 0;
  }
  v36 = (uint64_t)v14;
  objc_msgSend(v163, sel_setText_, v35);

  v37 = (void *)v2[7];
  sub_1BCFE0D34(a1);
  v39 = v38;
  objc_msgSend(v37, sel_setImage_, v38);

  v40 = objc_msgSend(v37, sel_image);
  v41 = v40;
  if (v40)

  objc_msgSend(v37, sel_setHidden_, v41 == 0);
  v42 = a1[3];
  v43 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v42);
  (*(void (**)(unsigned __int8 *__return_ptr, uint64_t, uint64_t))(v43 + 16))(v166, v42, v43);
  v44 = v166[0];
  swift_beginAccess();
  *((_BYTE *)v2 + 224) = v44;
  sub_1BCFDD850();
  v157 = *((unsigned __int8 *)v2 + 240);
  objc_msgSend(v26, sel_setHidden_, v157 ^ 1u);
  if (qword_1EF4A6728 != -1)
    swift_once();
  if (objc_msgSend((id)qword_1EF4A6710, sel_recentsCallTapTargetsEnabled))
  {
    v45 = (void *)objc_opt_self();
    v46 = objc_msgSend(v45, sel_configurationWithPointSize_weight_, 9, 33.0);
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A5300);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_1BCFE81D0;
    v48 = (void *)objc_opt_self();
    *(_QWORD *)(v47 + 32) = objc_msgSend(v48, sel_systemGreenColor);
    *(_QWORD *)(v47 + 40) = objc_msgSend(v48, sel_quaternarySystemFillColor);
    *(_QWORD *)v166 = v47;
    sub_1BCFE2A64();
    sub_1BCFE160C(0, &qword_1EF4A59D0);
    v49 = (void *)sub_1BCFE2A4C();
    swift_bridgeObjectRelease();
    v50 = objc_msgSend(v45, sel_configurationWithPaletteColors_, v49);

    v51 = objc_msgSend(v46, sel_configurationByApplyingConfiguration_, v50);
    v52 = a1[3];
    v53 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v52);
    v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 72))(v52, v53);
    if ((v55 & 1) != 0 || v54 != 2)
    {
      (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(*v2 + 552))(v166, v54);
      if (v166[0] != 3)
      {
        v165 = v166[0];
        v164 = 0;
        sub_1BCFCC380();
        sub_1BCFE2A28();
      }
    }
    v56 = *(uint64_t (**)(void))(*v2 + 424);
    v57 = (void *)v56();
    v58 = v51;
    v59 = (void *)sub_1BCFE2A34();
    swift_bridgeObjectRelease();
    v60 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v59, v58);

    objc_msgSend(v57, sel_setImage_forState_, v60, 0);
    v61 = (void *)v56();
    objc_msgSend(v61, sel_sizeToFit);

  }
  v62 = a1[3];
  v63 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v62);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v63 + 96))(v62, v63) & 1) != 0)
  {
    v64 = a1[3];
    v65 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v64);
    (*(void (**)(uint64_t, uint64_t))(v65 + 104))(v64, v65);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v162 + 56))(v14, 1, 1, v4);
  }
  swift_beginAccess();
  v66 = byte_1EF4A70F0;
  v67 = (void *)v2[4];
  v68 = a1[3];
  v69 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v68);
  if (v66 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v69 + 112))(v68, v69);
    if (v70)
    {
      v71 = (void *)sub_1BCFE2A34();
      swift_bridgeObjectRelease();
    }
    else
    {
      v71 = 0;
    }
    v74 = (uint64_t)v161;
    v75 = (uint64_t)v159;
    objc_msgSend(v67, sel_setText_, v71);

    v76 = (void *)v2[5];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v69 + 120))(v68, v69);
    if (v72)
    {
      v73 = (void *)sub_1BCFE2A34();
      swift_bridgeObjectRelease();
    }
    else
    {
      v73 = 0;
    }
    v75 = (uint64_t)v160;
    v74 = (uint64_t)v161;
    objc_msgSend(v67, sel_setText_, v73);

    v76 = (void *)v2[5];
    v77 = objc_msgSend(v67, sel_text);
    if (v77)
    {

      v78 = v162;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v162 + 56))(v75, 1, 1, v4);
      v79 = 0;
      goto LABEL_36;
    }
  }
  sub_1BCFE11D8(v36, v75);
  v78 = v162;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v162 + 48))(v75, 1, v4) == 1)
  {
    v79 = 0;
  }
  else
  {
    v79 = (void *)sub_1BCFE2758();
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v75, v4);
  }
LABEL_36:
  objc_msgSend(v76, sel_setDate_, v79);

  if (byte_1EF4A70F0 == 1)
  {
    v80 = objc_msgSend(v76, sel_date);
    if (v80)
    {
      v81 = v80;
      v82 = v158;
      sub_1BCFE2764();

      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v78 + 32))(v74, v82, v4);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v78 + 56))(v74, 0, 1, v4);
      v83 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v74, 1, v4);
      v84 = v83 == 1;
      v85 = v83 != 1;
    }
    else
    {
      v84 = 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v74, 1, 1, v4);
      v85 = 0;
    }
    sub_1BCFE1220(v74);
  }
  else
  {
    v84 = 0;
    v85 = 0;
  }
  objc_msgSend(v76, sel_setHidden_, v84);
  objc_msgSend(v163, sel_setHidden_, v85);
  v86 = a1[3];
  v87 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v86);
  v88 = (*(uint64_t (**)(uint64_t, uint64_t))(v87 + 88))(v86, v87);
  v90 = v89;
  v91 = (*(uint64_t (**)(void))(*v2 + 304))();
  v92 = (id)v91;
  if ((v90 & 1) != 0 || v88 != 1)
  {
    if (!v91)
      goto LABEL_55;
    v106 = (void *)v2[20];
    v107 = objc_msgSend(v106, sel_arrangedSubviews);
    if (v107)
    {
      v108 = v107;
      sub_1BCFE160C(0, &qword_1EF4A52F0);
      v109 = sub_1BCFE2A58();

      LOBYTE(v108) = sub_1BCFDFCA0((uint64_t)v92, v109);
      swift_bridgeObjectRelease();
      if ((v108 & 1) != 0)
        objc_msgSend(v106, sel_removeArrangedSubview_, v92);
    }
    objc_msgSend(v92, sel_removeFromSuperview);
    (*(void (**)(_QWORD))(*v2 + 312))(0);
  }
  else
  {
    if (!v91)
    {
      v93 = objc_msgSend((id)objc_opt_self(), sel_recentsVerifiedCheckmarkImage);
      v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v93);

      v95 = (void *)objc_opt_self();
      v92 = v94;
      v96 = objc_msgSend(v95, sel_dynamicTertiaryLabelColor);
      objc_msgSend(v92, sel_setTintColor_, v96);

      (*(void (**)(id))(*v2 + 312))(v92);
    }
    v97 = (void *)v2[20];
    v98 = objc_msgSend(v97, sel_arrangedSubviews);
    if (v98)
    {
      v99 = v98;
      sub_1BCFE160C(0, &qword_1EF4A52F0);
      v100 = sub_1BCFE2A58();

      v101 = v92;
      v102 = sub_1BCFDFCA0((uint64_t)v101, v100);

      swift_bridgeObjectRelease();
      if ((v102 & 1) == 0)
      {
        v103 = v2[3];
        v104 = v101;
        objc_msgSend(v97, sel_insertArrangedSubview_atIndex_, v104, objc_msgSend(v97, sel_indexOfArrangedSubview_, v103));

        LODWORD(v105) = 1148846080;
        objc_msgSend(v104, sel_tp_setCHCRPriority_, v105);
      }
    }
  }

LABEL_55:
  v110 = a1[3];
  v111 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v110);
  v112 = (*(uint64_t (**)(uint64_t, uint64_t))(v111 + 40))(v110, v111);
  if (v113)
  {
    v114 = HIBYTE(v113) & 0xF;
    if ((v113 & 0x2000000000000000) == 0)
      v114 = v112 & 0xFFFFFFFFFFFFLL;
    if (v114)
    {
      v115 = (void *)(*(uint64_t (**)(void))(*v2 + 328))();
      if (v115)
      {
        v116 = v115;
        v117 = (void *)sub_1BCFE2A34();
        objc_msgSend(v116, sel_setTitle_, v117);

      }
      else
      {
        v123 = objc_allocWithZone((Class)TPBadgeView);
        sub_1BCFE2818();
        v124 = (void *)sub_1BCFE2A34();
        swift_bridgeObjectRelease();
        v125 = objc_msgSend(v123, sel_initWithTitle_, v124);

        v126 = (void *)objc_opt_self();
        v116 = v125;
        v127 = objc_msgSend(v126, sel_dynamicTertiaryLabelColor);
        objc_msgSend(v116, sel_setTintColor_, v127);

        (*(void (**)(id))(*v2 + 336))(v116);
      }
      v128 = (void *)v2[20];
      v129 = objc_msgSend(v128, sel_arrangedSubviews);
      if (v129)
      {
        v130 = v129;
        sub_1BCFE160C(0, &qword_1EF4A52F0);
        v131 = sub_1BCFE2A58();

        v132 = v116;
        v133 = sub_1BCFDFCA0((uint64_t)v132, v131);

        swift_bridgeObjectRelease();
        if ((v133 & 1) == 0)
        {
          objc_msgSend(v128, sel_insertArrangedSubview_atIndex_, v132, 1);
          objc_msgSend(v128, sel_setAlignment_forView_inAxis_, 3, v132, 0);
          LODWORD(v134) = 1148846080;
          objc_msgSend(v132, sel_tp_setCHCRPriority_, v134);
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_72;
    }
    v112 = swift_bridgeObjectRelease();
  }
  v118 = (*(uint64_t (**)(uint64_t))(*v2 + 328))(v112);
  if (!v118)
    goto LABEL_73;
  v116 = (id)v118;
  v119 = (void *)v2[20];
  v120 = objc_msgSend(v119, sel_arrangedSubviews);
  if (v120)
  {
    v121 = v120;
    sub_1BCFE160C(0, &qword_1EF4A52F0);
    v122 = sub_1BCFE2A58();

    LOBYTE(v121) = sub_1BCFDFCA0((uint64_t)v116, v122);
    swift_bridgeObjectRelease();
    if ((v121 & 1) != 0)
      objc_msgSend(v119, sel_removeArrangedSubview_, v116);
  }
  objc_msgSend(v116, sel_removeFromSuperview);
  (*(void (**)(_QWORD))(*v2 + 336))(0);
LABEL_72:

LABEL_73:
  if (objc_msgSend((id)qword_1EF4A6710, sel_videoMessagingEnabled))
  {
    v135 = a1[3];
    v136 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v135);
    v137 = (*(uint64_t (**)(uint64_t, uint64_t))(v136 + 128))(v135, v136);
    if (v137)
    {
      v138 = (void *)v137;
      v139 = (_QWORD *)(*(uint64_t (**)(void))(*v2 + 528))();
      if (v139)
      {
        v140 = v139;
        v141 = objc_msgSend(v139, sel_superview);

        if (v141)
        {
          (*(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v140) + 0xF0))(v138);
          goto LABEL_86;
        }

        v138 = v140;
      }

    }
    v142 = a1[3];
    v143 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v142);
    v144 = (*(uint64_t (**)(uint64_t, uint64_t))(v143 + 128))(v142, v143);
    if (!v144)
    {
      v154 = (_QWORD *)(*(uint64_t (**)(void))(*v2 + 528))();
      if (!v154)
        goto LABEL_88;
      v140 = v154;
      v155 = objc_msgSend(v154, sel_superview);

      if (v155)
      {
        objc_msgSend(v140, sel_removeFromSuperview);
        (*(void (**)(_QWORD))(*v2 + 536))(0);
      }
      goto LABEL_87;
    }
    v138 = (void *)v144;
    v145 = a1[3];
    v146 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v145);
    v147 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v146 + 128))(v145, v146);
    if (v147 && (v148 = v147, v149 = objc_msgSend(v147, sel_isSensitive), v148, v149))
    {
      type metadata accessor for SensitiveMessageIndicatorView();
      v165 = v157;
      v150 = sub_1BCFDC3F4((char *)&v165, v138);
    }
    else
    {
      type metadata accessor for MessageIndicatorView();
      v165 = v157;
      v150 = sub_1BCFDA97C((char *)&v165, v138);
    }
    v151 = v150;
    objc_msgSend((id)v2[29], sel_addSubview_, v150);
    v152 = *(void (**)(void *))(*v2 + 536);
    v140 = v151;
    v152(v151);
LABEL_86:

LABEL_87:
  }
LABEL_88:
  sub_1BCFDDED8();
  return sub_1BCFE1220(v36);
}

void sub_1BCFDF4E0(char a1, void *a2)
{
  _QWORD *v2;
  void *v5;
  double v6;
  double v7;
  double Width;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  double v24;
  CGFloat v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v5 = (void *)v2[29];
  objc_msgSend(v5, sel_bounds);
  v7 = v6;
  objc_msgSend(v5, sel_bounds);
  Width = CGRectGetWidth(v38);
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v5, sel_directionalLayoutMargins);
    v10 = Width - v9;
    objc_msgSend(a2, sel_bounds);
    Width = v10 - CGRectGetWidth(v39);
  }
  v11 = (void *)v2[22];
  objc_msgSend(v11, sel_sizeThatFits_, Width, v7);
  v13 = v12;
  if (qword_1EF4A6728 != -1)
    swift_once();
  v14 = (void *)qword_1EF4A6710;
  objc_msgSend((id)qword_1EF4A6710, sel_videoMessagingEnabledM3);
  objc_msgSend(v11, sel_setFrame_, 0.0, 0.0, Width, v13);
  objc_msgSend(v11, sel_center);
  objc_msgSend(a2, sel_center);
  objc_msgSend(a2, sel_setCenter_);
  if (objc_msgSend(v14, sel_recentsCallTapTargetsEnabled))
  {
    objc_msgSend(a2, sel_center);
    objc_msgSend(a2, sel_setCenter_);
  }
  objc_msgSend(a2, sel_frame);
  objc_msgSend(a2, (SEL)&selRef_setStatusLabel_, Width);
  v15 = 1.0;
  if ((a1 & 1) != 0)
    v15 = 0.0;
  v16 = (*(uint64_t (**)(id))(*v2 + 528))(objc_msgSend(a2, sel_setAlpha_, v15));
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v17, sel_sizeThatFits_, v18, v19);
    v21 = v20;
    v22 = qword_1EF4A70E0;
    v23 = v17;
    if (v22 != -1)
      swift_once();
    v24 = *(double *)&qword_1EF4A70E8;
    objc_msgSend(v11, sel_frame);
    v25 = CGRectGetMaxY(v40) + -2.0;
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v23, (SEL)&selRef_setStatusLabel_, v24, v25, CGRectGetWidth(v41) - (*(double *)&qword_1EF4A70E8 + *(double *)&qword_1EF4A70E8), v21);

  }
  if (objc_msgSend(v5, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    v26 = a2;
    v27 = v11;
    objc_msgSend(v5, sel_bounds);
    v28 = CGRectGetWidth(v42);
    objc_msgSend(v26, sel_frame);
    v30 = v28 - v29;
    objc_msgSend(v26, sel_frame);
    v31 = v30 - CGRectGetMinX(v43);
    objc_msgSend(v26, sel_frame);
    objc_msgSend(v26, (SEL)&selRef_setStatusLabel_, v31);
    v32 = v27;
    objc_msgSend(v5, sel_bounds);
    v33 = CGRectGetWidth(v44);
    objc_msgSend(v32, sel_frame);
    v35 = v33 - v34;
    objc_msgSend(v32, sel_frame);
    v36 = v35 - CGRectGetMinX(v45);
    objc_msgSend(v32, sel_frame);
    objc_msgSend(v32, (SEL)&selRef_setStatusLabel_, v36);

    v37 = (id)(*(uint64_t (**)(void))(*v2 + 448))();
    objc_msgSend(v37, sel_setNeedsUpdateConfiguration);

  }
}

double sub_1BCFDF8B4(char a1, void *a2, double a3, double a4)
{
  uint64_t v4;
  void *v8;
  double Width;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v8 = *(void **)(v4 + 232);
  objc_msgSend(v8, sel_bounds);
  Width = CGRectGetWidth(v20);
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v8, sel_directionalLayoutMargins);
    v11 = Width - v10;
    objc_msgSend(a2, sel_bounds);
    Width = v11 - CGRectGetWidth(v21);
  }
  objc_msgSend(v8, sel_bounds);
  if (v12 >= Width)
    v13 = Width;
  else
    v13 = v12;
  v14 = objc_msgSend(*(id *)(v4 + 176), sel_sizeThatFits_, v13, 0.0);
  v16 = v15;
  v17 = (void *)(*(uint64_t (**)(id))(*(_QWORD *)v4 + 528))(v14);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, sel_sizeThatFits_, Width, a4);

  }
  return v16;
}

uint64_t RecentsListItemViewHelper.deinit()
{
  uint64_t v0;

  sub_1BCFDA32C(*(_QWORD *)(v0 + 184));
  sub_1BCFDA32C(*(_QWORD *)(v0 + 200));

  return v0;
}

uint64_t RecentsListItemViewHelper.__deallocating_deinit()
{
  RecentsListItemViewHelper.deinit();
  return swift_deallocClassInstance();
}

id sub_1BCFDFA94(void *a1, double a2)
{
  double v3;

  LODWORD(a2) = 1148846080;
  objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 1, a2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, sel_setContentHuggingPriority_forAxis_, 1, v3);
  objc_msgSend(a1, sel_setNumberOfLines_, 1);
  return objc_msgSend(a1, sel_setLineBreakMode_, 4);
}

void sub_1BCFDFB10(void *a1, double a2)
{
  double v3;
  id v4;

  LODWORD(a2) = 1148846080;
  objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 1, a2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, sel_setContentHuggingPriority_forAxis_, 1, v3);
  objc_msgSend(a1, sel_setNumberOfLines_, 2);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(a1, sel_setTextColor_, v4);

}

id sub_1BCFDFBC8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 40);
  if (*(_BYTE *)(v0 + 240) == 1)
  {
    objc_msgSend(*(id *)(v0 + 40), sel__setDrawsAsBackdropOverlayWithBlendMode_, 0);
    objc_msgSend(*(id *)(v0 + 24), sel__setDrawsAsBackdropOverlayWithBlendMode_, 0);
    v2 = *(void **)(v0 + 32);
LABEL_10:
    v3 = 0;
    return objc_msgSend(v2, sel__setDrawsAsBackdropOverlayWithBlendMode_, v3);
  }
  v3 = 3;
  if (UIAccessibilityIsReduceTransparencyEnabled())
    v4 = 0;
  else
    v4 = 3;
  objc_msgSend(v1, sel__setDrawsAsBackdropOverlayWithBlendMode_, v4);
  v5 = *(void **)(v0 + 24);
  if (UIAccessibilityIsReduceTransparencyEnabled())
    v6 = 0;
  else
    v6 = 3;
  objc_msgSend(v5, sel__setDrawsAsBackdropOverlayWithBlendMode_, v6);
  v2 = *(void **)(v0 + 32);
  if (UIAccessibilityIsReduceTransparencyEnabled())
    goto LABEL_10;
  return objc_msgSend(v2, sel__setDrawsAsBackdropOverlayWithBlendMode_, v3);
}

uint64_t sub_1BCFDFCA0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1BCFE2818();
  for (; v3; v3 = sub_1BCFE2BB4())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1C3B6EB88](0, a2);
LABEL_5:
      v6 = v5;
      sub_1BCFE160C(0, &qword_1EF4A52F0);
      v7 = sub_1BCFE2B48();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1BCFE2B48();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1C3B6EB88](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1BCFE2B48();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    sub_1BCFE2818();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_1BCFDFE24(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  double v10;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_superview);

  if (!v4)
  {
    v5 = *(void **)(v2 + 168);
    if (objc_msgSend(v5, sel_numberOfColumns) == (id)2)
    {
      v6 = objc_msgSend(v5, sel_arrangedSubviewInColumnAtIndex_rowAtIndex_, 0, 0);
      objc_msgSend(v5, sel_replaceArrangedSubview_inColumnAtIndex_rowAtIndex_, a1, 0, 0);
      objc_msgSend(v6, sel_removeFromSuperview);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A5300);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_1BCFE81E0;
      *(_QWORD *)(v7 + 32) = a1;
      sub_1BCFE2A64();
      sub_1BCFE160C(0, &qword_1EF4A52F0);
      v8 = a1;
      v6 = (id)sub_1BCFE2A4C();
      swift_bridgeObjectRelease();
      v9 = objc_msgSend(v5, sel_insertColumnAtIndex_withArrangedSubviews_, 0, v6);
      swift_unknownObjectRelease();
    }

    LODWORD(v10) = 1148846080;
    objc_msgSend(a1, sel_tp_setCHCRPriority_, v10);
    objc_msgSend(v5, sel_setAlignment_forView_inAxis_, 3, a1, 1);
    sub_1BCFE01D0();
  }
}

id sub_1BCFDFFD0()
{
  uint64_t v0;
  void *v1;
  id v2;
  double v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v1 = *(void **)(v0 + 128);
  if (v1)
  {
    v2 = *(id *)(v0 + 128);
  }
  else
  {
    v3 = *(double *)(v0 + 120);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, *(double *)(v0 + 112), v3);
    v5 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v5, sel_setCornerRadius_, v3 * 0.5);

    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v6, sel_lightGrayColor);
    v8 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.4);

    objc_msgSend(v4, sel_setBackgroundColor_, v8);
    v9 = (void *)sub_1BCFE2A34();
    v10 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v9);

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v10);
    v12 = v11;
    objc_msgSend(v4, sel_center);
    objc_msgSend(v12, sel_setCenter_);

    v13 = objc_msgSend(v6, sel_whiteColor);
    objc_msgSend(v12, sel_setTintColor_, v13);

    objc_msgSend(v4, sel_addSubview_, v12);
    v14 = *(void **)(v0 + 128);
    *(_QWORD *)(v0 + 128) = v4;
    v2 = v4;

    v1 = 0;
  }
  v15 = v1;
  return v2;
}

void sub_1BCFE01D0()
{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v1 = *(void **)(v0 + 168);
  if ((uint64_t)objc_msgSend(v1, sel_numberOfColumns) < 2)
    return;
  v2 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 376);
  v3 = (void *)v2();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_view);

    if (!v5)
    {
      __break(1u);
      goto LABEL_14;
    }
    objc_msgSend(v5, sel_setMinimumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));

  }
  v6 = (void *)v2();
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_view);

    if (v8)
    {
      objc_msgSend(v8, sel_setMaximumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));

      goto LABEL_8;
    }
LABEL_14:
    __break(1u);
    return;
  }
LABEL_8:
  v9 = *(void **)(v0 + 128);
  if (v9)
  {
    objc_msgSend(v9, sel_setMinimumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));
    v10 = *(void **)(v0 + 128);
    if (v10)
      objc_msgSend(v10, sel_setMaximumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));
  }
  v11 = objc_msgSend(v1, sel_columnAtIndex_, 0);
  v12 = objc_msgSend(*(id *)(v0 + 232), sel_traitCollection);
  v13 = objc_msgSend(v12, sel_isPreferredContentSizeCategoryAccessible);

  objc_msgSend(v11, sel_setHidden_, v13);
  swift_unknownObjectRelease();
}

BOOL sub_1BCFE0428(int a1)
{
  return *MEMORY[0x1E0D0CE90] == a1 || *MEMORY[0x1E0D0CE80] == a1;
}

char *sub_1BCFE0450(void *a1, char *a2)
{
  char *v2;
  char *v3;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void **p_weak_ivar_lyt;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  id v66;
  void *v67;
  double v68;
  double v69;
  id v70;
  void *v71;
  id v72;
  double v73;
  void *v74;
  void *v75;
  id v76;
  double v77;
  void *v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v3 = v2;
  v5 = *a2;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  *((_QWORD *)v3 + 2) = v6;
  *((_QWORD *)v3 + 3) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  *((_QWORD *)v3 + 4) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  *((_QWORD *)v3 + 5) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36E8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  *((_QWORD *)v3 + 6) = v7;
  *((_QWORD *)v3 + 7) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  *((_QWORD *)v3 + 8) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  *(_OWORD *)(v3 + 72) = 0u;
  *(_OWORD *)(v3 + 88) = 0u;
  *((_QWORD *)v3 + 13) = 0;
  *((int64x2_t *)v3 + 7) = vdupq_n_s64(0x4046800000000000uLL);
  *((_QWORD *)v3 + 17) = 0;
  *((_QWORD *)v3 + 18) = 0;
  *((_QWORD *)v3 + 16) = 0;
  *(_OWORD *)(v3 + 184) = 0u;
  *(_OWORD *)(v3 + 200) = 0u;
  *((_QWORD *)v3 + 27) = 0;
  v3[224] = 3;
  *((_QWORD *)v3 + 29) = a1;
  v3[240] = v5;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF4A5300);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BCFE81D0;
  *(_QWORD *)(v8 + 32) = v6;
  *(_QWORD *)(v8 + 40) = v7;
  sub_1BCFE2A64();
  v9 = objc_allocWithZone(MEMORY[0x1E0CFAAB0]);
  sub_1BCFE160C(0, &qword_1EF4A52F0);
  v10 = a1;
  v11 = v6;
  v12 = v7;
  v13 = (void *)sub_1BCFE2A4C();
  swift_bridgeObjectRelease();
  p_weak_ivar_lyt = &RecentsListItemViewHelper.weak_ivar_lyt;
  v15 = objc_msgSend(v9, sel_initWithArrangedSubviews_, v13);

  *((_QWORD *)v3 + 19) = v15;
  swift_beginAccess();
  if (byte_1EF4A70F0 == 1)
  {
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1BCFE81F0;
    v17 = (void *)*((_QWORD *)v3 + 7);
    v18 = (void *)*((_QWORD *)v3 + 3);
    *(_QWORD *)(v16 + 32) = v17;
    *(_QWORD *)(v16 + 40) = v18;
    v19 = (void *)*((_QWORD *)v3 + 5);
    *(_QWORD *)(v16 + 48) = v19;
    sub_1BCFE2A64();
    v20 = objc_allocWithZone(MEMORY[0x1E0CFAAB0]);
    v21 = v17;
    v22 = v18;
    v23 = v19;
    p_weak_ivar_lyt = (void **)(&RecentsListItemViewHelper + 56);
  }
  else
  {
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1BCFE81D0;
    v25 = (void *)*((_QWORD *)v3 + 7);
    v26 = (void *)*((_QWORD *)v3 + 3);
    *(_QWORD *)(v24 + 32) = v25;
    *(_QWORD *)(v24 + 40) = v26;
    sub_1BCFE2A64();
    v20 = objc_allocWithZone(MEMORY[0x1E0CFAAB0]);
    v27 = v25;
    v28 = v26;
  }
  v29 = (void *)sub_1BCFE2A4C();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v20, (SEL)p_weak_ivar_lyt[424], v29);

  *((_QWORD *)v3 + 20) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52F8);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1BCFE7630;
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1BCFE81E0;
  v33 = (void *)*((_QWORD *)v3 + 19);
  *(_QWORD *)(v32 + 32) = v33;
  v80 = v32;
  sub_1BCFE2A64();
  *(_QWORD *)(v31 + 32) = v80;
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1BCFE81E0;
  v35 = (void *)*((_QWORD *)v3 + 4);
  *(_QWORD *)(v34 + 32) = v35;
  v81 = v34;
  sub_1BCFE2A64();
  *(_QWORD *)(v31 + 40) = v81;
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1BCFE81E0;
  *(_QWORD *)(v36 + 32) = v30;
  v82 = v36;
  sub_1BCFE2A64();
  *(_QWORD *)(v31 + 48) = v82;
  v37 = objc_allocWithZone(MEMORY[0x1E0CFAAA8]);
  v38 = v33;
  v39 = v35;
  v40 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52E0);
  v41 = (void *)sub_1BCFE2A4C();
  swift_bridgeObjectRelease();
  v42 = objc_msgSend(v37, sel_initWithArrangedSubviewRows_, v41);

  *((_QWORD *)v3 + 21) = v42;
  if (byte_1EF4A70F0 == 1)
  {
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_1BCFE81E0;
    *(_QWORD *)(v43 + 32) = v42;
    sub_1BCFE2A64();
    v44 = objc_allocWithZone(MEMORY[0x1E0CFAAB0]);
    v45 = v42;
  }
  else
  {
    v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_1BCFE81D0;
    v47 = (void *)*((_QWORD *)v3 + 5);
    *(_QWORD *)(v46 + 32) = v42;
    *(_QWORD *)(v46 + 40) = v47;
    sub_1BCFE2A64();
    v44 = objc_allocWithZone(MEMORY[0x1E0CFAAB0]);
    v48 = v42;
    v49 = v47;
  }
  v50 = (void *)sub_1BCFE2A4C();
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(v44, (SEL)p_weak_ivar_lyt[424], v50);

  *((_QWORD *)v3 + 22) = v51;
  v52 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v52, sel_addObserver_selector_name_object_, v3, sel_updateForReducedTransparancy, *MEMORY[0x1E0DC45B8], 0);

  v53 = (void *)*((_QWORD *)v3 + 22);
  objc_msgSend(v53, sel_setAutoresizingMask_, 18);
  objc_msgSend(*((id *)v3 + 29), sel_addSubview_, v53);
  v54 = (void *)*((_QWORD *)v3 + 2);
  LODWORD(v55) = 1148846080;
  objc_msgSend(v54, sel_setContentCompressionResistancePriority_forAxis_, 1, v55);
  LODWORD(v56) = 1148846080;
  objc_msgSend(v54, sel_setContentHuggingPriority_forAxis_, 1, v56);
  objc_msgSend(v54, sel_setNumberOfLines_, 1);
  objc_msgSend(v54, sel_setLineBreakMode_, 4);
  v57 = (void *)*((_QWORD *)v3 + 6);
  LODWORD(v58) = 1148846080;
  objc_msgSend(v57, sel_setContentCompressionResistancePriority_forAxis_, 1, v58);
  LODWORD(v59) = 1148846080;
  objc_msgSend(v57, sel_setContentHuggingPriority_forAxis_, 1, v59);
  objc_msgSend(v57, sel_setNumberOfLines_, 1);
  objc_msgSend(v57, sel_setLineBreakMode_, 4);
  LODWORD(v60) = 1148846080;
  objc_msgSend(v57, sel_setContentCompressionResistancePriority_forAxis_, 0, v60);
  LODWORD(v61) = 1148846080;
  objc_msgSend(v57, sel_setContentHuggingPriority_forAxis_, 0, v61);
  v62 = (void *)*((_QWORD *)v3 + 19);
  objc_msgSend(v62, sel_setAlignment_, 1);
  objc_msgSend(v62, sel_setAlignment_forView_inAxis_, 4, v57, 0);
  v63 = (void *)*((_QWORD *)v3 + 3);
  LODWORD(v64) = 1148846080;
  objc_msgSend(v63, sel_setContentCompressionResistancePriority_forAxis_, 1, v64);
  LODWORD(v65) = 1148846080;
  objc_msgSend(v63, sel_setContentHuggingPriority_forAxis_, 1, v65);
  objc_msgSend(v63, sel_setNumberOfLines_, 2);
  v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v63, sel_setTextColor_, v66);

  v67 = (void *)*((_QWORD *)v3 + 4);
  LODWORD(v68) = 1148846080;
  objc_msgSend(v67, sel_setContentCompressionResistancePriority_forAxis_, 1, v68);
  LODWORD(v69) = 1148846080;
  objc_msgSend(v67, sel_setContentHuggingPriority_forAxis_, 1, v69);
  objc_msgSend(v67, sel_setNumberOfLines_, 2);
  v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v67, sel_setTextColor_, v70);

  v71 = (void *)*((_QWORD *)v3 + 7);
  v72 = objc_msgSend((id)objc_opt_self(), sel_dynamicTertiaryLabelColor);
  objc_msgSend(v71, sel_setTintColor_, v72);

  objc_msgSend(v71, sel_setUserInteractionEnabled_, 0);
  LODWORD(v73) = 1148846080;
  objc_msgSend(v71, sel_tp_setCHCRPriority_, v73);
  objc_msgSend(v71, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  objc_msgSend(*((id *)v3 + 20), sel_setAlignment_, 3);
  v74 = (void *)*((_QWORD *)v3 + 21);
  objc_msgSend(v74, sel_setLayoutMarginsRelativeArrangement_, 1);
  objc_msgSend(v74, sel_setBaselineRelativeArrangement_, 1);
  v75 = (void *)*((_QWORD *)v3 + 5);
  v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v75, sel_setTextColor_, v76);

  LODWORD(v77) = 1148846080;
  v78 = (void *)(*(uint64_t (**)(id))(*(_QWORD *)v3 + 424))(objc_msgSend(v75, sel_tp_setCHCRPriority_, v77));
  objc_msgSend(v78, sel_addTarget_action_forControlEvents_, v3, sel_didTapDetailAccessoryButtonWithSender_, 64);

  objc_msgSend(v53, sel_setLayoutMarginsRelativeArrangement_, 1);
  objc_msgSend(v53, sel_setBaselineRelativeArrangement_, 1);
  objc_msgSend(v53, sel_setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview_, 1);
  sub_1BCFDDED8();
  objc_msgSend(v3, sel_updateForReducedTransparancy);
  return v3;
}

void sub_1BCFE0D34(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  unsigned __int8 v30;
  uint64_t v31;

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v2, v3);
  if ((v5 & 1) == 0)
  {
    if (v4 == 2)
    {
      v6 = objc_msgSend((id)objc_opt_self(), sel_recentsTTYRelayGlyphImage);
      goto LABEL_36;
    }
    if (v4 == 1)
    {
      v6 = objc_msgSend((id)objc_opt_self(), sel_recentsTTYDirectGlyphImage);
LABEL_36:
      v6;
      return;
    }
  }
  if (qword_1EF4A6728 != -1)
    swift_once();
  v7 = (void *)qword_1EF4A6710;
  v8 = objc_msgSend((id)qword_1EF4A6710, sel_recentsCallTapTargetsEnabled);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  if (v8)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 64))(v9, v10) & 0x100000000) == 0)
    {
      v11 = objc_msgSend((id)objc_opt_self(), sel_telephonyUISubheadlineShortFont);
      v12 = objc_msgSend(v11, sel__fontAdjustedForCurrentContentSizeCategory);

      if (v12)
      {
        v13 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v12, 1);
        v24 = (void *)sub_1BCFE2A34();
        objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v24, v13);

      }
      else
      {
        __break(1u);
      }
    }
    return;
  }
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10);
  if ((v15 & 1) == 0)
  {
    v16 = v14;
    if (objc_msgSend(v7, sel_videoMessagingEnabledM3))
    {
      v17 = a1[3];
      v18 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v17);
      v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 128))(v17, v18);
      if (v19)
      {

        v20 = (void *)objc_opt_self();
        if (v16 == 2)
        {
LABEL_15:
          v6 = objc_msgSend(v20, sel_recentsIncomingVideoCallGlyphImage);
          goto LABEL_36;
        }
LABEL_35:
        v6 = objc_msgSend(v20, sel_recentsIncomingAudioCallGlyphImage);
        goto LABEL_36;
      }
      v25 = a1[3];
      v26 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v25);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 64))(v25, v26);
      if ((v27 & 0x100000000) == 0)
      {
        v28 = v27;
        v29 = *MEMORY[0x1E0D0CE90];
        v20 = (void *)objc_opt_self();
        if (v29 == v28 || *MEMORY[0x1E0D0CE80] == v28)
        {
          if (v16 == 2)
            v6 = objc_msgSend(v20, sel_recentsOutgoingVideoCallGlyphImage);
          else
            v6 = objc_msgSend(v20, sel_recentsOutgoingAudioCallGlyphImage);
          goto LABEL_36;
        }
        if (v16 == 2)
          goto LABEL_15;
        goto LABEL_35;
      }
      v23 = (void *)objc_opt_self();
      if (v16 == 2)
      {
LABEL_21:
        v6 = objc_msgSend(v23, sel_favoritesVideoGlyphImage);
        goto LABEL_36;
      }
    }
    else
    {
      v23 = (void *)objc_opt_self();
      if (v16 == 2)
        goto LABEL_21;
    }
    v6 = objc_msgSend(v23, sel_favoritesAudioGlyphImage);
    goto LABEL_36;
  }
  v21 = a1[3];
  v22 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v21);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 16))(&v31, v21, v22);
  v30 = 0;
  if (static RecentsCallItemStyle.== infix(_:_:)((unsigned __int8 *)&v31, &v30))
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_favoritesVideoGlyphImage);
    goto LABEL_36;
  }
}

uint64_t sub_1BCFE11D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCFE1220(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A52D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BCFE1264()
{
  unint64_t result;

  result = qword_1EF4A59D8;
  if (!qword_1EF4A59D8)
  {
    result = MEMORY[0x1C3B6F710](&protocol conformance descriptor for RecentsListItemLocation, &type metadata for RecentsListItemLocation);
    atomic_store(result, (unint64_t *)&qword_1EF4A59D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RecentsListItemLocation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecentsListItemLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BCFE1384 + 4 * byte_1BCFE8205[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BCFE13B8 + 4 * byte_1BCFE8200[v4]))();
}

uint64_t sub_1BCFE13B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFE13C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCFE13C8);
  return result;
}

uint64_t sub_1BCFE13D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCFE13DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BCFE13E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCFE13E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1BCFE13F4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecentsListItemLocation()
{
  return &type metadata for RecentsListItemLocation;
}

uint64_t type metadata accessor for RecentsListItemViewHelper()
{
  return objc_opt_self();
}

uint64_t method lookup function for RecentsListItemViewHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.__allocating_init(parentView:location:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.updateForParentTraitCollectionDidChange()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.configure(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.layout(shouldHideTrailingAccessoryView:trailingAccessoryView:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.sizeThatFits(_:shouldHideTrailingAccessoryView:trailingAccessoryView:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t sub_1BCFE154C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BCFE156C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF4A52E8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF4A52E8);
  }
}

uint64_t sub_1BCFE15E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BCFE160C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PRUISIncomingCallPosterAttachmentTypeIdentifier getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TPInComingCallUISnapshotViewController.m"), 69, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __getPRPosterLabelClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TPInComingCallUISnapshotViewController.m"), 45, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRPosterLabelClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRPosterLabelClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 48, CFSTR("Unable to find class %s"), "PRPosterLabel");

  __break(1u);
}

void __getCNImageDerivedColorGeneratorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ContactsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TPInComingCallUISnapshotViewController.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNImageDerivedColorGeneratorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNImageDerivedColorGeneratorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 32, CFSTR("Unable to find class %s"), "CNImageDerivedColorGenerator");

  __break(1u);
}

void PosterBoardUIServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterBoardUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TPInComingCallUISnapshotViewController.m"), 57, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISPosterAppearanceObservingAttachmentProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 65, CFSTR("Unable to find class %s"), "PRUISPosterAppearanceObservingAttachmentProvider");

  __break(1u);
}

void __getPRUISIncomingCallPosterContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISIncomingCallPosterContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 58, CFSTR("Unable to find class %s"), "PRUISIncomingCallPosterContext");

  __break(1u);
}

void __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISIncomingCallSnapshotDefinitionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 59, CFSTR("Unable to find class %s"), "PRUISIncomingCallSnapshotDefinition");

  __break(1u);
}

void __getPRUISMutablePosterSnapshotRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISMutablePosterSnapshotRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 61, CFSTR("Unable to find class %s"), "PRUISMutablePosterSnapshotRequest");

  __break(1u);
}

void __getPRUISPosterAttachmentConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISPosterAttachmentConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 64, CFSTR("Unable to find class %s"), "PRUISPosterAttachmentConfiguration");

  __break(1u);
}

void __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRUISPosterSnapshotControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPInComingCallUISnapshotViewController.m"), 63, CFSTR("Unable to find class %s"), "PRUISPosterSnapshotController");

  __break(1u);
}

void _MKBGetDeviceLockState_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _MKBGetDeviceLockState(CFDictionaryRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPDialPromptAlert.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileKeyBagLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TPDialPromptAlert.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRIncomingCallTextViewAdapterWrapperClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPIncomingCallMetricsProvider.m"), 39, CFSTR("Unable to find class %s"), "PRIncomingCallTextViewAdapterWrapper");

  __break(1u);
}

void PosterKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TPIncomingCallMetricsProvider.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRIncomingCallMetricsProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TPIncomingCallMetricsProvider.m"), 41, CFSTR("Unable to find class %s"), "PRIncomingCallMetricsProvider");

  __break(1u);
}

uint64_t sub_1BCFE26D4()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1BCFE26E0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1BCFE26EC()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BCFE26F8()
{
  return MEMORY[0x1E0CAF7E0]();
}

uint64_t sub_1BCFE2704()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_1BCFE2710()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_1BCFE271C()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_1BCFE2728()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_1BCFE2734()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_1BCFE2740()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BCFE274C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BCFE2758()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BCFE2764()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BCFE2770()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BCFE277C()
{
  return MEMORY[0x1E0DBF158]();
}

uint64_t sub_1BCFE2788()
{
  return MEMORY[0x1E0DBF170]();
}

uint64_t sub_1BCFE2794()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BCFE27A0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BCFE27AC()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1BCFE27B8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BCFE27C4()
{
  return MEMORY[0x1E0CE9290]();
}

uint64_t sub_1BCFE27D0()
{
  return MEMORY[0x1E0CE92D0]();
}

uint64_t sub_1BCFE27DC()
{
  return MEMORY[0x1E0CE92D8]();
}

uint64_t sub_1BCFE27E8()
{
  return MEMORY[0x1E0CE92F0]();
}

uint64_t sub_1BCFE27F4()
{
  return MEMORY[0x1E0CE9308]();
}

uint64_t sub_1BCFE2800()
{
  return MEMORY[0x1E0CE9310]();
}

uint64_t sub_1BCFE280C()
{
  return MEMORY[0x1E0CE93E8]();
}

uint64_t sub_1BCFE2818()
{
  return MEMORY[0x1E0CE9408]();
}

uint64_t sub_1BCFE2824()
{
  return MEMORY[0x1E0CE9428]();
}

uint64_t sub_1BCFE2830()
{
  return MEMORY[0x1E0CE9450]();
}

uint64_t sub_1BCFE283C()
{
  return MEMORY[0x1E0CE9498]();
}

uint64_t sub_1BCFE2848()
{
  return MEMORY[0x1E0CE94B8]();
}

uint64_t sub_1BCFE2854()
{
  return MEMORY[0x1E0CE94F0]();
}

uint64_t sub_1BCFE2860()
{
  return MEMORY[0x1E0CE9518]();
}

uint64_t sub_1BCFE286C()
{
  return MEMORY[0x1E0CE9550]();
}

uint64_t sub_1BCFE2878()
{
  return MEMORY[0x1E0CE9568]();
}

uint64_t sub_1BCFE2884()
{
  return MEMORY[0x1E0CE9580]();
}

uint64_t sub_1BCFE2890()
{
  return MEMORY[0x1E0CE9590]();
}

uint64_t sub_1BCFE289C()
{
  return MEMORY[0x1E0CE95D0]();
}

uint64_t sub_1BCFE28A8()
{
  return MEMORY[0x1E0CE95E8]();
}

uint64_t sub_1BCFE28B4()
{
  return MEMORY[0x1E0CE9628]();
}

uint64_t sub_1BCFE28C0()
{
  return MEMORY[0x1E0CE9648]();
}

uint64_t sub_1BCFE28CC()
{
  return MEMORY[0x1E0CE9660]();
}

uint64_t sub_1BCFE28D8()
{
  return MEMORY[0x1E0CE9668]();
}

uint64_t sub_1BCFE28E4()
{
  return MEMORY[0x1E0CE9678]();
}

uint64_t sub_1BCFE28F0()
{
  return MEMORY[0x1E0CE9690]();
}

uint64_t sub_1BCFE28FC()
{
  return MEMORY[0x1E0CE96A8]();
}

uint64_t sub_1BCFE2908()
{
  return MEMORY[0x1E0CE96B8]();
}

uint64_t sub_1BCFE2914()
{
  return MEMORY[0x1E0CE96D0]();
}

uint64_t sub_1BCFE2920()
{
  return MEMORY[0x1E0CE96D8]();
}

uint64_t sub_1BCFE292C()
{
  return MEMORY[0x1E0CE96F0]();
}

uint64_t sub_1BCFE2938()
{
  return MEMORY[0x1E0CE9720]();
}

uint64_t sub_1BCFE2944()
{
  return MEMORY[0x1E0CE9730]();
}

uint64_t sub_1BCFE2950()
{
  return MEMORY[0x1E0CE9748]();
}

uint64_t sub_1BCFE295C()
{
  return MEMORY[0x1E0CE9768]();
}

uint64_t sub_1BCFE2968()
{
  return MEMORY[0x1E0CE9770]();
}

uint64_t sub_1BCFE2974()
{
  return MEMORY[0x1E0CE9788]();
}

uint64_t sub_1BCFE2980()
{
  return MEMORY[0x1E0CE9790]();
}

uint64_t sub_1BCFE298C()
{
  return MEMORY[0x1E0CE97D0]();
}

uint64_t sub_1BCFE2998()
{
  return MEMORY[0x1E0CE97F8]();
}

uint64_t sub_1BCFE29A4()
{
  return MEMORY[0x1E0CE9808]();
}

uint64_t sub_1BCFE29B0()
{
  return MEMORY[0x1E0CE9820]();
}

uint64_t sub_1BCFE29BC()
{
  return MEMORY[0x1E0CE98B0]();
}

uint64_t sub_1BCFE29C8()
{
  return MEMORY[0x1E0CE98B8]();
}

uint64_t sub_1BCFE29D4()
{
  return MEMORY[0x1E0CE98E0]();
}

uint64_t sub_1BCFE29E0()
{
  return MEMORY[0x1E0CE98F8]();
}

uint64_t sub_1BCFE29EC()
{
  return MEMORY[0x1E0CDAFF0]();
}

uint64_t sub_1BCFE29F8()
{
  return MEMORY[0x1E0CDDDA8]();
}

uint64_t sub_1BCFE2A04()
{
  return MEMORY[0x1E0CDDDD8]();
}

uint64_t sub_1BCFE2A10()
{
  return MEMORY[0x1E0CDF6A0]();
}

uint64_t sub_1BCFE2A1C()
{
  return MEMORY[0x1E0CDF6D0]();
}

uint64_t sub_1BCFE2A28()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BCFE2A34()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BCFE2A40()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BCFE2A4C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BCFE2A58()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BCFE2A64()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BCFE2A70()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BCFE2A7C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1BCFE2A88()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1BCFE2A94()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1BCFE2AA0()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1BCFE2AAC()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1BCFE2AB8()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1BCFE2AC4()
{
  return MEMORY[0x1E0DF0738]();
}

uint64_t sub_1BCFE2AD0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BCFE2ADC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BCFE2AE8()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1BCFE2AF4()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1BCFE2B00()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1BCFE2B0C()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1BCFE2B18()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1BCFE2B24()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1BCFE2B30()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BCFE2B3C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BCFE2B48()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BCFE2B54()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BCFE2B60()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BCFE2B6C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BCFE2B78()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1BCFE2B84()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1BCFE2B90()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1BCFE2B9C()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1BCFE2BA8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BCFE2BB4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BCFE2BC0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BCFE2BCC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BCFE2BD8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BCFE2BE4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BCFE2BF0()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1BCFE2BFC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BCFE2C08()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1BCFE2C14()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BCFE2C20()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1BCFE2C2C()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1BCFE2C38()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BCFE2C44()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BCFE2C50()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BCFE2C5C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1E0C8A6A8]();
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x1E0C92120](*(_QWORD *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

void AudioServicesRemoveSystemSoundCompletion(SystemSoundID inSystemSoundID)
{
  MEMORY[0x1E0C92170](*(_QWORD *)&inSystemSoundID);
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0C92178](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x1E0C92180]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1E0C92188]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1E0D015B8]();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C400](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D578]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D590]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D598]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

  MEMORY[0x1E0C9D5B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1E0CA7B18]();
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x1E0CA7CA8](font);
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1E0D17878]();
}

uint64_t TUCallScreeningDisabledUserDefault()
{
  return MEMORY[0x1E0DBD550]();
}

uint64_t TUCurrentProcessHasEntitlement()
{
  return MEMORY[0x1E0DBD5F0]();
}

uint64_t TUDialAssistedDialRequest()
{
  return MEMORY[0x1E0DBD610]();
}

uint64_t TUHomeCountryCode()
{
  return MEMORY[0x1E0DBD640]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x1E0DBD680]();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return MEMORY[0x1E0DBD6B0]();
}

uint64_t TUStringKeyForNetwork()
{
  return MEMORY[0x1E0DBD6D8]();
}

uint64_t TUStringsAreEqualOrNil()
{
  return MEMORY[0x1E0DBD6E8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x1E0DC4C48]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1E0DC4CE0](fontWeight);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1E0DDDAD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _TUAssertShouldCrashApplication()
{
  return MEMORY[0x1E0DBD828]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

