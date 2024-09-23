uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D825250C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

int *OUTLINED_FUNCTION_2_0()
{
  return __error();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sUnescapeParamValue_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardParameterDecoder decodeParameterValue:](CNVCardParameterDecoder, "decodeParameterValue:", a2);
}

uint64_t sIsPrefParameter_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_357);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_359);
  return v4;
}

uint64_t sIsPrefParameter_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

uint64_t sIsPrefParameter_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("pref"));
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

uint64_t sIsURIValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_caseInsensitiveIsEqual:", CFSTR("URI"));
}

__CFString *sAPIKeyToSerializedKey_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", CFSTR("sound")) & 1) != 0)
  {
    v3 = CFSTR("snd");
  }
  else if ((objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", CFSTR("vibration")) & 1) != 0)
  {
    v3 = CFSTR("vib");
  }
  else
  {
    v3 = (__CFString *)v2;
  }

  return v3;
}

__CFString *sSerializedKeyToAPIKey_block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = a2;
  if (-[__CFString _cn_caseInsensitiveIsEqual:](v2, "_cn_caseInsensitiveIsEqual:", CFSTR("snd")))
  {
    v3 = CFSTR("sound");
  }
  else if (-[__CFString _cn_caseInsensitiveIsEqual:](v2, "_cn_caseInsensitiveIsEqual:", CFSTR("vib")))
  {
    v3 = CFSTR("vibration");
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

__CFString *sAPITypeToSerializedType_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", CFSTR("com.apple.activityalert.call")) & 1) != 0)
  {
    v3 = CFSTR("call");
  }
  else if ((objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", CFSTR("com.apple.activityalert.text")) & 1) != 0)
  {
    v3 = CFSTR("text");
  }
  else
  {
    v3 = (__CFString *)v2;
  }

  return v3;
}

__CFString *sSerializedTypeToAPIType_block_invoke_4(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = a2;
  if (-[__CFString _cn_caseInsensitiveIsEqual:](v2, "_cn_caseInsensitiveIsEqual:", CFSTR("call")))
  {
    v3 = CFSTR("com.apple.activityalert.call");
  }
  else if (-[__CFString _cn_caseInsensitiveIsEqual:](v2, "_cn_caseInsensitiveIsEqual:", CFSTR("text")))
  {
    v3 = CFSTR("com.apple.activityalert.text");
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

uint64_t sKeyComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(&unk_1E957CF48, "indexOfObject:", v4);
  v7 = objc_msgSend(&unk_1E957CF48, "indexOfObject:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_msgSend(v4, "caseInsensitiveCompare:", v5);
  }
  else
  {
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 1;
    else
      v9 = -1;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -1;
      if (v6 >= v7)
        v10 = v7 < v6;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        v9 = v10;
    }
  }

  return v9;
}

id buildTokenTable(int a1)
{
  id v2;
  CFMutableArrayRef v3;
  _QWORD *Token;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  CFMutableArrayRef v13;
  _QWORD *v14;
  CFMutableArrayRef v15;
  _QWORD *v16;
  _QWORD *v17;
  CFMutableArrayRef v18;
  _QWORD *v19;
  CFArrayCallBacks callBacks;

  memset(&callBacks, 0, 24);
  callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)copyDescriptionCallBack;
  callBacks.equal = (CFArrayEqualCallBack)equalCallBack;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = CFArrayCreateMutable(0, 9, &callBacks);
  objc_msgSend(v2, "addObject:", v3);

  Token = createToken(CFSTR(";"), 4097, a1);
  CFArrayAppendValue(v3, Token);
  v5 = createToken(CFSTR(":"), 8193, a1);
  CFArrayAppendValue(v3, v5);
  v6 = createToken(CFSTR(" "), 16385, a1);
  CFArrayAppendValue(v3, v6);
  v7 = createToken(CFSTR("="), 1025, a1);
  CFArrayAppendValue(v3, v7);
  v8 = createToken(CFSTR("\r"), 32770, a1);
  CFArrayAppendValue(v3, v8);
  v9 = createToken(CFSTR("\n"), 32769, a1);
  CFArrayAppendValue(v3, v9);
  v10 = createToken(CFSTR("\\"), 513, a1);
  CFArrayAppendValue(v3, v10);
  v11 = createToken(CFSTR("."), 257, a1);
  CFArrayAppendValue(v3, v11);
  v12 = createToken(CFSTR(","), 129, a1);
  CFArrayAppendValue(v3, v12);
  v13 = CFArrayCreateMutable(0, 1, &callBacks);
  objc_msgSend(v2, "addObject:", v13);

  v14 = createToken(CFSTR("END"), 7, a1);
  CFArrayAppendValue(v13, v14);
  v15 = CFArrayCreateMutable(0, 2, &callBacks);
  objc_msgSend(v2, "addObject:", v15);

  v16 = createToken(CFSTR("BEGIN"), 5, a1);
  CFArrayAppendValue(v15, v16);
  v17 = createToken(CFSTR("VCARD"), 6, a1);
  CFArrayAppendValue(v15, v17);
  v18 = CFArrayCreateMutable(0, 1, &callBacks);
  objc_msgSend(v2, "addObject:", v18);

  v19 = createToken(CFSTR("VERSION"), 2049, a1);
  CFArrayAppendValue(v18, v19);
  return v2;
}

const __CFString *copyDescriptionCallBack()
{
  return CFSTR("token");
}

BOOL equalCallBack(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *createToken(void *a1, int a2, int a3)
{
  __CFString *v5;
  _QWORD *v6;
  uint64_t v7;
  UInt8 *v8;
  CFIndex v9;
  uint64_t v10;
  CFRange v12;

  v5 = a1;
  v6 = malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
  *(_DWORD *)v6 = a2;
  v7 = -[__CFString length](v5, "length");
  if (a3)
  {
    v8 = (UInt8 *)malloc_type_malloc(2 * v7 + 2, 0x1000040BDFB0063uLL);
    -[__CFString getCharacters:](v5, "getCharacters:", v8);
  }
  else
  {
    v8 = (UInt8 *)malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
    v9 = -[__CFString length](v5, "length");
    v10 = -[__CFString length](v5, "length");
    v12.location = 0;
    v12.length = v9;
    CFStringGetBytes(v5, v12, 0x600u, 0, 0, v8, v10 + 1, 0);
  }

  v6[1] = v8;
  return v6;
}

uint64_t sItemIsMaidenName_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("MaidenName"));
}

uint64_t sItemIsBirthday_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("BirthdayComponents"));
}

uint64_t sItemIsAlternateBirthday_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("AlternateBirthdayComponents"));
}

void sub_1D3C19CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id sFilterIMPPsForService_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sFilterIMPPsForService_block_invoke_2;
  v6[3] = &unk_1E956FBB8;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

uint64_t sFilterIMPPsForService_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

void sub_1D3C1D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D3C1D378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3C1D488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3C1D5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3C1D844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3C1DA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initUTTypeConformsTo(uint64_t a1, uint64_t a2)
{
  if (LoadCoreServices_loadPredicate != -1)
    dispatch_once(&LoadCoreServices_loadPredicate, &__block_literal_global_8);
  softLinkUTTypeConformsTo = (uint64_t (*)())dlsym((void *)LoadCoreServices_frameworkLibrary, "UTTypeConformsTo");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo)(a1, a2);
}

uint64_t initkUTTypeJPEG()
{
  uint64_t result;

  if (LoadCoreServices_loadPredicate != -1)
    dispatch_once(&LoadCoreServices_loadPredicate, &__block_literal_global_8);
  result = *(_QWORD *)dlsym((void *)LoadCoreServices_frameworkLibrary, "kUTTypeJPEG");
  constantkUTTypeJPEG = result;
  getkUTTypeJPEG = kUTTypeJPEGFunction;
  return result;
}

uint64_t kUTTypeJPEGFunction()
{
  return constantkUTTypeJPEG;
}

uint64_t initCGImageGetAlphaInfo(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageGetAlphaInfo = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetAlphaInfo");
  return ((uint64_t (*)(uint64_t))softLinkCGImageGetAlphaInfo)(a1);
}

uint64_t initCGImageGetWidth(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageGetWidth = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetWidth");
  return ((uint64_t (*)(uint64_t))softLinkCGImageGetWidth)(a1);
}

uint64_t initCGImageGetHeight(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageGetHeight = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetHeight");
  return ((uint64_t (*)(uint64_t))softLinkCGImageGetHeight)(a1);
}

uint64_t initCGImageSourceCreateWithData(uint64_t a1, uint64_t a2)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageSourceCreateWithData = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceCreateWithData");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkCGImageSourceCreateWithData)(a1, a2);
}

uint64_t initkCGImageSourceCreateThumbnailFromImageAlways()
{
  uint64_t result;

  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  result = *(_QWORD *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageSourceCreateThumbnailFromImageAlways");
  constantkCGImageSourceCreateThumbnailFromImageAlways = result;
  getkCGImageSourceCreateThumbnailFromImageAlways = kCGImageSourceCreateThumbnailFromImageAlwaysFunction;
  return result;
}

uint64_t kCGImageSourceCreateThumbnailFromImageAlwaysFunction()
{
  return constantkCGImageSourceCreateThumbnailFromImageAlways;
}

uint64_t initkCGImageSourceThumbnailMaxPixelSize()
{
  uint64_t result;

  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  result = *(_QWORD *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageSourceThumbnailMaxPixelSize");
  constantkCGImageSourceThumbnailMaxPixelSize = result;
  getkCGImageSourceThumbnailMaxPixelSize = kCGImageSourceThumbnailMaxPixelSizeFunction;
  return result;
}

uint64_t kCGImageSourceThumbnailMaxPixelSizeFunction()
{
  return constantkCGImageSourceThumbnailMaxPixelSize;
}

uint64_t initCGImageSourceCreateThumbnailAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageSourceCreateThumbnailAtIndex = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceCreateThumbnailAtIndex");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCGImageSourceCreateThumbnailAtIndex)(a1, a2, a3);
}

uint64_t initCGImageSourceGetType(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  softLinkCGImageSourceGetType = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceGetType");
  return ((uint64_t (*)(uint64_t))softLinkCGImageSourceGetType)(a1);
}

Class initCIImage()
{
  Class result;

  if (LoadCoreImage_loadPredicate != -1)
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_123);
  result = objc_getClass("CIImage");
  classCIImage = (uint64_t)result;
  getCIImageClass = (uint64_t (*)())CIImageFunction;
  return result;
}

id CIImageFunction()
{
  return (id)classCIImage;
}

Class initCIContext()
{
  Class result;

  if (LoadCoreImage_loadPredicate != -1)
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_123);
  result = objc_getClass("CIContext");
  classCIContext = (uint64_t)result;
  getCIContextClass = (uint64_t (*)())CIContextFunction;
  return result;
}

id CIContextFunction()
{
  return (id)classCIContext;
}

uint64_t initkCIFormatRGBA8()
{
  uint64_t result;

  if (LoadCoreImage_loadPredicate != -1)
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_123);
  result = *(unsigned int *)dlsym((void *)LoadCoreImage_frameworkLibrary, "kCIFormatRGBA8");
  constantkCIFormatRGBA8 = result;
  getkCIFormatRGBA8 = kCIFormatRGBA8Function;
  return result;
}

uint64_t kCIFormatRGBA8Function()
{
  return constantkCIFormatRGBA8;
}

uint64_t initkCGImageDestinationLossyCompressionQuality()
{
  uint64_t result;

  if (LoadImageIO_loadPredicate != -1)
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_113);
  result = *(_QWORD *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageDestinationLossyCompressionQuality");
  constantkCGImageDestinationLossyCompressionQuality = result;
  getkCGImageDestinationLossyCompressionQuality = kCGImageDestinationLossyCompressionQualityFunction;
  return result;
}

uint64_t kCGImageDestinationLossyCompressionQualityFunction()
{
  return constantkCGImageDestinationLossyCompressionQuality;
}

uint64_t sRangeValueByConsolidatingAdjacentRangeValues_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeValue");

  objc_msgSend(v2, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, v8 - v4 + v6);
}

__CFString *sUnknownLabel_block_invoke()
{
  return &stru_1E95708D8;
}

uint64_t sNo_block_invoke_2()
{
  return MEMORY[0x1E0C9AAA0];
}

uint64_t initCGImageSourceCreateWithData_0(uint64_t a1, uint64_t a2)
{
  if (LoadImageIO_loadPredicate_0 != -1)
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  softLinkCGImageSourceCreateWithData_0 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary_0, "CGImageSourceCreateWithData");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkCGImageSourceCreateWithData_0)(a1, a2);
}

uint64_t initCGImageSourceCopyPropertiesAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadImageIO_loadPredicate_0 != -1)
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  softLinkCGImageSourceCopyPropertiesAtIndex = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary_0, "CGImageSourceCopyPropertiesAtIndex");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCGImageSourceCopyPropertiesAtIndex)(a1, a2, a3);
}

uint64_t initkCGImagePropertyPixelWidth()
{
  uint64_t result;

  if (LoadImageIO_loadPredicate_0 != -1)
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  result = *(_QWORD *)dlsym((void *)LoadImageIO_frameworkLibrary_0, "kCGImagePropertyPixelWidth");
  constantkCGImagePropertyPixelWidth = result;
  getkCGImagePropertyPixelWidth = kCGImagePropertyPixelWidthFunction;
  return result;
}

uint64_t kCGImagePropertyPixelWidthFunction()
{
  return constantkCGImagePropertyPixelWidth;
}

uint64_t initkCGImagePropertyPixelHeight()
{
  uint64_t result;

  if (LoadImageIO_loadPredicate_0 != -1)
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  result = *(_QWORD *)dlsym((void *)LoadImageIO_frameworkLibrary_0, "kCGImagePropertyPixelHeight");
  constantkCGImagePropertyPixelHeight = result;
  getkCGImagePropertyPixelHeight = kCGImagePropertyPixelHeightFunction;
  return result;
}

uint64_t kCGImagePropertyPixelHeightFunction()
{
  return constantkCGImagePropertyPixelHeight;
}

_QWORD *byteBufferWithCapacity(NSUInteger a1)
{
  _QWORD *v2;
  void *v3;

  v2 = NSZoneMalloc(0, 0x18uLL);
  if (a1 <= 1)
    a1 = 1;
  v3 = NSZoneMalloc(0, a1);
  v2[1] = 0;
  v2[2] = a1;
  *v2 = v3;
  return v2;
}

uint64_t appendToBufferWithLineFolding(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  void *v25;
  uint64_t v26;
  _BYTE *v27;

  v3 = a3;
  if (a3 >= 75)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(_QWORD *)(a1 + 16);
    if (v6 == v7 && v7 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v7 = 2 * v6;
      v9 = NSZoneRealloc(0, *(void **)a1, 2 * v6);
      if (v9)
      {
        *(_QWORD *)a1 = v9;
        *(_QWORD *)(a1 + 16) = v7;
      }
      else
      {
        v7 = *(_QWORD *)(a1 + 16);
      }
    }
    v10 = *(_QWORD *)(a1 + 8);
    if (v10 == v7)
    {
      NSLog(CFSTR("ABDataAdditions: Cannot append any more bytes to buffer at %p."), a1);
    }
    else
    {
      v11 = *(_BYTE **)a1;
      *(_QWORD *)(a1 + 8) = v10 + 1;
      v11[v10] = 13;
    }
    v12 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    if (v12 == v13 && v13 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v13 = 2 * v12;
      v14 = NSZoneRealloc(0, *(void **)a1, 2 * v12);
      if (v14)
      {
        *(_QWORD *)a1 = v14;
        *(_QWORD *)(a1 + 16) = v13;
      }
      else
      {
        v13 = *(_QWORD *)(a1 + 16);
      }
    }
    v15 = *(_QWORD *)(a1 + 8);
    if (v15 == v13)
    {
      NSLog(CFSTR("ABDataAdditions: Cannot append any more bytes to buffer at %p."), a1);
    }
    else
    {
      v16 = *(_BYTE **)a1;
      *(_QWORD *)(a1 + 8) = v15 + 1;
      v16[v15] = 10;
    }
    v17 = *(_QWORD *)(a1 + 8);
    v18 = *(_QWORD *)(a1 + 16);
    if (v17 == v18 && v18 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v18 = 2 * v17;
      v19 = NSZoneRealloc(0, *(void **)a1, 2 * v17);
      if (v19)
      {
        *(_QWORD *)a1 = v19;
        *(_QWORD *)(a1 + 16) = v18;
      }
      else
      {
        v18 = *(_QWORD *)(a1 + 16);
      }
    }
    v20 = *(_QWORD *)(a1 + 8);
    if (v20 == v18)
    {
      NSLog(CFSTR("ABDataAdditions: Cannot append any more bytes to buffer at %p."), a1);
    }
    else
    {
      v21 = *(_BYTE **)a1;
      *(_QWORD *)(a1 + 8) = v20 + 1;
      v21[v20] = 32;
    }
    v3 = 1;
  }
  v22 = *(_QWORD *)(a1 + 8);
  v23 = *(_QWORD *)(a1 + 16);
  if (v22 == v23 && v23 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v23 = 2 * v22;
    v25 = NSZoneRealloc(0, *(void **)a1, 2 * v22);
    if (v25)
    {
      *(_QWORD *)a1 = v25;
      *(_QWORD *)(a1 + 16) = v23;
    }
    else
    {
      v23 = *(_QWORD *)(a1 + 16);
    }
  }
  v26 = *(_QWORD *)(a1 + 8);
  if (v26 == v23)
  {
    NSLog(CFSTR("ABDataAdditions: Cannot append any more bytes to buffer at %p."), a1);
  }
  else
  {
    v27 = *(_BYTE **)a1;
    *(_QWORD *)(a1 + 8) = v26 + 1;
    v27[v26] = a2;
  }
  return v3 + 1;
}

id sub_1D3C27AA8(void *a1)
{
  sub_1D3C27BB8(a1);
  return sub_1D3C27FD8(a1);
}

id CNVCardNameComponentPostProcessor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNVCardNameComponentPostProcessor.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardNameComponentPostProcessor();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNVCardNameComponentPostProcessor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardNameComponentPostProcessor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D3C27BB8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;

  v2 = sub_1D3C29AE0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_formattedName);
  if (v6)
  {
    v59 = v6;
    v7 = sub_1D3C29AF8();
    v9 = v8;
    swift_bridgeObjectRelease();
    v10 = HIBYTE(v9) & 0xF;
    if ((v9 & 0x2000000000000000) == 0)
      v10 = v7 & 0xFFFFFFFFFFFFLL;
    if (!v10)
      goto LABEL_17;
    v11 = objc_msgSend(a1, sel_firstName);
    if (v11)
    {
      v12 = v11;
      v13 = sub_1D3C29AF8();
      v15 = v14;

      swift_bridgeObjectRelease();
      v16 = HIBYTE(v15) & 0xF;
      if ((v15 & 0x2000000000000000) == 0)
        v16 = v13 & 0xFFFFFFFFFFFFLL;
      if (v16)
        goto LABEL_17;
    }
    v17 = objc_msgSend(a1, sel_lastName);
    if (v17)
    {
      v18 = v17;
      v19 = sub_1D3C29AF8();
      v21 = v20;

      swift_bridgeObjectRelease();
      v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000) == 0)
        v22 = v19 & 0xFFFFFFFFFFFFLL;
      if (v22)
        goto LABEL_17;
    }
    v23 = objc_msgSend(a1, sel_companyName);
    if (!v23)
      goto LABEL_18;
    v24 = v23;
    v25 = sub_1D3C29AF8();
    v27 = v26;

    swift_bridgeObjectRelease();
    v28 = HIBYTE(v27) & 0xF;
    if ((v27 & 0x2000000000000000) == 0)
      v28 = v25 & 0xFFFFFFFFFFFFLL;
    if (v28)
    {
LABEL_17:

    }
    else
    {
LABEL_18:
      v29 = objc_msgSend((id)objc_opt_self(), sel_componentsFromString_, v59);

      sub_1D3C29AD4();
      sub_1D3C29AA4();
      if (v30)
      {
        v31 = (void *)sub_1D3C29AEC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(a1, sel_setLastName_, v31);

      sub_1D3C29A98();
      if (v32)
      {
        v33 = (void *)sub_1D3C29AEC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v33 = 0;
      }
      objc_msgSend(a1, sel_setFirstName_, v33);

      v34 = objc_msgSend(a1, sel_middleName);
      if (!v34)
        goto LABEL_28;
      v35 = v34;
      v36 = sub_1D3C29AF8();
      v38 = v37;

      swift_bridgeObjectRelease();
      v39 = HIBYTE(v38) & 0xF;
      if ((v38 & 0x2000000000000000) == 0)
        v39 = v36 & 0xFFFFFFFFFFFFLL;
      if (!v39)
      {
LABEL_28:
        sub_1D3C29AB0();
        if (v40)
        {
          v41 = (void *)sub_1D3C29AEC();
          swift_bridgeObjectRelease();
        }
        else
        {
          v41 = 0;
        }
        objc_msgSend(a1, sel_setMiddleName_, v41);

      }
      v42 = objc_msgSend(a1, sel_title);
      if (!v42)
        goto LABEL_36;
      v43 = v42;
      v44 = sub_1D3C29AF8();
      v46 = v45;

      swift_bridgeObjectRelease();
      v47 = HIBYTE(v46) & 0xF;
      if ((v46 & 0x2000000000000000) == 0)
        v47 = v44 & 0xFFFFFFFFFFFFLL;
      if (!v47)
      {
LABEL_36:
        sub_1D3C29ABC();
        if (v48)
        {
          v49 = (void *)sub_1D3C29AEC();
          swift_bridgeObjectRelease();
        }
        else
        {
          v49 = 0;
        }
        objc_msgSend(a1, sel_setTitle_, v49);

      }
      v50 = objc_msgSend(a1, sel_suffix);
      if (!v50)
        goto LABEL_44;
      v51 = v50;
      v52 = sub_1D3C29AF8();
      v54 = v53;

      swift_bridgeObjectRelease();
      v55 = HIBYTE(v54) & 0xF;
      if ((v54 & 0x2000000000000000) == 0)
        v55 = v52 & 0xFFFFFFFFFFFFLL;
      if (!v55)
      {
LABEL_44:
        sub_1D3C29AC8();
        if (v56)
        {
          v57 = (void *)sub_1D3C29AEC();
          swift_bridgeObjectRelease();
        }
        else
        {
          v57 = 0;
        }
        objc_msgSend(a1, sel_setSuffix_, v57);

      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
}

id sub_1D3C27FD8(void *a1)
{
  id result;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;

  result = objc_msgSend(a1, sel_formattedName);
  if (result)
  {
    v3 = result;
    sub_1D3C29AF8();

    v4 = objc_msgSend(a1, sel_firstName);
    if (v4)
    {
      v5 = v4;
      sub_1D3C29AF8();
      v6 = CNIsChineseString();

      if ((v6 & 1) != 0)
      {
        v7 = objc_msgSend(a1, sel_middleName);
        if (v7)
        {
          v8 = v7;
          sub_1D3C29AF8();
          v9 = CNIsChineseString();

          if ((v9 & 1) != 0)
          {
            v10 = objc_msgSend(a1, sel_lastName);
            if (v10)
            {
              v11 = v10;
              sub_1D3C29AF8();
              v12 = CNIsChineseString();

              if ((v12 & 1) != 0)
              {
                swift_bridgeObjectRetain();
                sub_1D3C29B10();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                sub_1D3C29B10();
                swift_bridgeObjectRelease();
                sub_1D3C28298();
                v13 = sub_1D3C29B34();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v13 & 1) != 0)
                {
                  swift_bridgeObjectRetain();
                  sub_1D3C29B10();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v14 = (void *)sub_1D3C29AEC();
                  swift_bridgeObjectRelease();
                  objc_msgSend(a1, sel_setFirstName_, v14);

                  return objc_msgSend(a1, sel_setMiddleName_, 0);
                }
                else
                {
                  swift_bridgeObjectRelease();
                  return (id)swift_bridgeObjectRelease();
                }
              }
              swift_bridgeObjectRelease();
            }
          }
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
    }
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for CNVCardNameComponentPostProcessor()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNVCardNameComponentPostProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CNVCardNameComponentPostProcessor.postProcess(components:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_1D3C28298()
{
  unint64_t result;

  result = qword_1EFE30038;
  if (!qword_1EFE30038)
  {
    result = MEMORY[0x1D8252518](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFE30038);
  }
  return result;
}

id sub_1D3C282DC(uint64_t a1)
{
  id v1;
  uint64_t v2;

  if (!a1)
    return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy()), sel_init);
  v1 = objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy());
  v2 = swift_bridgeObjectRetain();
  return sub_1D3C28504(v2);
}

uint64_t type metadata accessor for CNVCardTagInclusionPermissivePolicy()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CNVCardTagInclusionRestrictedPolicy()
{
  return objc_opt_self();
}

id CNVCardTagInclusion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNVCardTagInclusion.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardTagInclusion();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNVCardTagInclusion.__deallocating_deinit()
{
  return sub_1D3C2889C(type metadata accessor for CNVCardTagInclusion);
}

id sub_1D3C284F8()
{
  return sub_1D3C2889C(type metadata accessor for CNVCardTagInclusionPermissivePolicy);
}

id sub_1D3C28504(uint64_t a1)
{
  _BYTE *v1;
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  v1[OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags] = 0;
  v3 = v1;
  swift_bridgeObjectRetain();
  v4 = (char *)a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_1D3C29358(0, *(_QWORD *)(a1 + 16) + 1, 1, (char *)a1);
  v6 = *((_QWORD *)v4 + 2);
  v5 = *((_QWORD *)v4 + 3);
  if (v6 >= v5 >> 1)
    v4 = sub_1D3C29358((char *)(v5 > 1), v6 + 1, 1, v4);
  *((_QWORD *)v4 + 2) = v6 + 1;
  v7 = &v4[16 * v6];
  *((_QWORD *)v7 + 4) = 0x4E4F4953524556;
  *((_QWORD *)v7 + 5) = 0xE700000000000000;
  swift_bridgeObjectRelease();
  v8 = sub_1D3C29458((uint64_t)v4);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v3[OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_tags] = v8;

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for CNVCardTagInclusion()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNVCardTagInclusion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CNVCardTagInclusion.policy(tags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_1D3C28648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1D3C29B70();
    sub_1D3C29B04();
    v6 = sub_1D3C29B7C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1D3C29B58() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1D3C29B58() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_1D3C28890()
{
  return sub_1D3C2889C(type metadata accessor for CNVCardTagInclusionRestrictedPolicy);
}

id sub_1D3C2889C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1D3C288DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1D3C29B70();
  swift_bridgeObjectRetain();
  sub_1D3C29B04();
  v8 = sub_1D3C29B7C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1D3C29B58() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1D3C29B58() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1D3C28D64(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1D3C28A88()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE30058);
  v3 = sub_1D3C29B4C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1D3C29B70();
      sub_1D3C29B04();
      result = sub_1D3C29B7C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1D3C28D64(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1D3C28A88();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1D3C28EFC();
      goto LABEL_22;
    }
    sub_1D3C290AC();
  }
  v11 = *v4;
  sub_1D3C29B70();
  sub_1D3C29B04();
  result = sub_1D3C29B7C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1D3C29B58(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1D3C29B64();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1D3C29B58();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_1D3C28EFC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE30058);
  v2 = *v0;
  v3 = sub_1D3C29B40();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1D3C290AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE30058);
  v3 = sub_1D3C29B4C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1D3C29B70();
    swift_bridgeObjectRetain();
    sub_1D3C29B04();
    result = sub_1D3C29B7C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_1D3C29358(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE30060);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D3C29458(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1D3C29B28();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1D3C288DC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1D3C29A98()
{
  return MEMORY[0x1E0CAF6F0]();
}

uint64_t sub_1D3C29AA4()
{
  return MEMORY[0x1E0CAF700]();
}

uint64_t sub_1D3C29AB0()
{
  return MEMORY[0x1E0CAF710]();
}

uint64_t sub_1D3C29ABC()
{
  return MEMORY[0x1E0CAF728]();
}

uint64_t sub_1D3C29AC8()
{
  return MEMORY[0x1E0CAF738]();
}

uint64_t sub_1D3C29AD4()
{
  return MEMORY[0x1E0CAF768]();
}

uint64_t sub_1D3C29AE0()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1D3C29AEC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D3C29AF8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D3C29B04()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D3C29B10()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D3C29B1C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D3C29B28()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1D3C29B34()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1D3C29B40()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D3C29B4C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D3C29B58()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D3C29B64()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D3C29B70()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D3C29B7C()
{
  return MEMORY[0x1E0DEDF40]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

uint64_t CNInitializerUnavailableException()
{
  return MEMORY[0x1E0D137E8]();
}

uint64_t CNIsChineseString()
{
  return MEMORY[0x1E0D13810]();
}

uint64_t CNResultWithAutoreleasePool()
{
  return MEMORY[0x1E0D138F8]();
}

uint64_t CNSocialProfileIsStandardServiceName()
{
  return MEMORY[0x1E0D13918]();
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB29C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1E0CB29C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSIntegralRect(NSRect aRect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB2C48]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3470](zone, ptr, size);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cn_runWithObjectLock()
{
  return MEMORY[0x1E0D13BF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
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

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

