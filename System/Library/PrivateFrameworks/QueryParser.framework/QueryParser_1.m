void sub_218E8356C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,const void *a26)
{
  const void ***v26;

  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  nlp::CFScopedPtr<__CFString const*>::reset(&a26, 0);
  std::unique_ptr<QP::DatePeriod>::reset[abi:ne180100](v26, 0);
  _Unwind_Resume(a1);
}

const void ***QP::DateConverter::resolve@<X0>(QP::HolidayReference **a1@<X0>, const __CFString ***a2@<X1>, int a3@<W2>, BOOL *a4@<X3>, const void ***a5@<X8>)
{
  const __CFString **v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  const void **v11;
  const __CFString **v13[2];
  const void **v14;

  v6 = a2[1];
  v13[0] = *a2;
  v13[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 1);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  QP::DateConverter::resolveDate(a1, v13, a3, a4, &v14);
  if (v6)
  {
    v9 = (unint64_t *)(v6 + 1);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(const __CFString **))(*v6)->data)(v6);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  v11 = v14;
  if (v14)
    v14 = 0;
  *a5 = v11;
  return std::unique_ptr<QP::DatePeriod>::reset[abi:ne180100](&v14, 0);
}

void sub_218E83670(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<QP::HolidayReference>::shared_ptr[abi:ne180100]<QP::HolidayReference,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_24DA26788;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_218E836E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<QP::HolidayReference>::reset[abi:ne180100]((QP::HolidayReference **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<QP::HolidayReference *,std::shared_ptr<QP::HolidayReference>::__shared_ptr_default_delete<QP::HolidayReference,QP::HolidayReference>,std::allocator<QP::HolidayReference>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x219A24D0CLL);
}

QP::HolidayReference *std::__shared_ptr_pointer<QP::HolidayReference *,std::shared_ptr<QP::HolidayReference>::__shared_ptr_default_delete<QP::HolidayReference,QP::HolidayReference>,std::allocator<QP::HolidayReference>>::__on_zero_shared(uint64_t a1)
{
  QP::HolidayReference *result;

  result = *(QP::HolidayReference **)(a1 + 24);
  if (result)
  {
    QP::HolidayReference::~HolidayReference(result);
    JUMPOUT(0x219A24D0CLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<QP::HolidayReference *,std::shared_ptr<QP::HolidayReference>::__shared_ptr_default_delete<QP::HolidayReference,QP::HolidayReference>,std::allocator<QP::HolidayReference>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

QP::HolidayReference *std::unique_ptr<QP::HolidayReference>::reset[abi:ne180100](QP::HolidayReference **a1, QP::HolidayReference *a2)
{
  QP::HolidayReference *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    QP::HolidayReference::~HolidayReference(result);
    JUMPOUT(0x219A24D0CLL);
  }
  return result;
}

void __entityResolutionPrefixCacheLogger_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _nlpLoggingSubsystem();
  v1 = os_log_create(v0, "QPEntityResolutionPrefixCache");
  v2 = (void *)entityResolutionPrefixCacheLogger_log;
  entityResolutionPrefixCacheLogger_log = (uint64_t)v1;

}

void sub_218E84CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __ecrClientLogger_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _nlpLoggingSubsystem();
  v1 = os_log_create(v0, "QPECRClient");
  v2 = (void *)ecrClientLogger_log;
  ecrClientLogger_log = (uint64_t)v1;

}

id OUTLINED_FUNCTION_3(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

void sub_218E850E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_218E85194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_218E85240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_218E852EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_218E85398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_218E854AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_218E856E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_218E857DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)QPQueryParserManager;
  -[_Unwind_Exception dealloc](&a10, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_218E858B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_218E85AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E85D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E860A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
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

  _Unwind_Resume(a1);
}

id dateComponentsForDate(NSDictionary *a1)
{
  NSDictionary *v1;
  id v2;
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

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("d"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("d"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDay:", (int)objc_msgSend(v4, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("M"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("M"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMonth:", (int)objc_msgSend(v6, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("y"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setYear:", (int)objc_msgSend(v8, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("E"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("E"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWeekday:", (int)objc_msgSend(v10, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("F"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("F"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWeekdayOrdinal:", (int)objc_msgSend(v12, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("W"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("W"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWeekOfMonth:", (int)objc_msgSend(v14, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("w"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("w"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWeekOfYear:", (int)objc_msgSend(v16, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("Y"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("Y"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setYearForWeekOfYear:", (int)objc_msgSend(v18, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("H"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("H"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHour:", (int)objc_msgSend(v20, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("m"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("m"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMinute:", (int)objc_msgSend(v22, "intValue"));

  }
  -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("s"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", CFSTR("s"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSecond:", (int)objc_msgSend(v24, "intValue"));

  }
  return v2;
}

void sub_218E864B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_218E8661C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_218E86730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E8699C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  _Block_object_dispose((const void *)(v5 - 144), 8);

  _Unwind_Resume(a1);
}

void sub_218E86B58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_218E86CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_218E86E5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E86FA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E870EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218E87404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  _Block_object_dispose((const void *)(v15 - 152), 8);

  _Unwind_Resume(a1);
}

void sub_218E875BC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_218E87734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_218E878C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_218E87978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL24queryParserManagerLoggerv_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _nlpLoggingSubsystem();
  v1 = os_log_create(v0, "QPQueryParserManager");
  v2 = (void *)queryParserManagerLogger(void)::log;
  queryParserManagerLogger(void)::log = (uint64_t)v1;

}

__CFString *QPAnnotationsCopyNormalizedString(const __CFLocale *a1, const __CFString *a2, CFIndex a3, CFIndex length)
{
  __CFString *MutableCopy;
  CFIndex MaximumSizeForEncoding;
  CFIndex v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const UInt8 *v14;
  CFIndex v15;
  const __CFAllocator *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v20;
  CFIndex v21;
  uint64_t v22;
  uint64_t v23;
  CFRange v24;

  MutableCopy = 0;
  v23 = *MEMORY[0x24BDAC8D0];
  if (a2 && length)
  {
    v22 = 0;
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(length, 0x8000100u);
    v10 = MaximumSizeForEncoding + 1;
    MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
    v24.location = a3;
    v24.length = length;
    CFStringGetCharacters(a2, v24, (UniChar *)((char *)&v20 - v11));
    v21 = 0;
    MEMORY[0x24BDAC7A8](v12);
    v14 = (const UInt8 *)&v20 - v13;
    if (CFStringEncodingUnicodeToBytes())
      return 0;
    v15 = v21;
    v14[v21] = 0;
    v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v17 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v14, v15, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (!v17)
    {
      return 0;
    }
    else
    {
      v18 = v17;
      MutableCopy = CFStringCreateMutableCopy(v16, v10, v17);
      CFStringFold(MutableCopy, 0x181uLL, a1);
      CFRelease(v18);
    }
  }
  return MutableCopy;
}

uint64_t QPAnnotationsGetPayloadWithTokens(int a1, uint64_t a2, __CFLocale *a3, CFStringRef theString, CFRange *a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  id v9;
  unsigned int v10;
  uint64_t v11;

  hashTokens(a3, theString, a2, a5, a6, a7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "bytes");
  v10 = SIDataMapGetWithKey();
  v11 = kPayloadMask & v10;
  if ((kPayloadMask & v10) == 0)
    *a8 = 0;

  return v11;
}

void sub_218E87C80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id hashTokens(const __CFLocale *a1, CFStringRef theString, uint64_t a3, const CFRange *a4, uint64_t a5, uint64_t a6)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  CFIndex v17;
  uint64_t v18;
  CFIndex *p_length;
  __CFString *v20;
  const __CFString *v21;
  CFIndex v22;
  uint64_t OutputSize;
  char *v24;
  uint64_t v26;
  uint64_t v27;
  CFIndex v28[2];
  CFRange v29;

  v27 = a3;
  v28[1] = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(theString);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v26 = (uint64_t)&v26;
  v13 = a6 + MaximumSizeForEncoding + 1;
  MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
  v15 = (char *)&v26 - v14;
  if (a6 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = a6 + a5;
    p_length = &a4[a5].length;
    do
    {
      v28[0] = 0;
      v20 = QPAnnotationsCopyNormalizedString(a1, theString, *(p_length - 1), *p_length);
      if (v20)
      {
        v21 = v20;
        v29.length = CFStringGetLength(v20);
        v29.location = 0;
        CFStringGetBytes(v21, v29, 0x8000100u, 0x2Du, 0, (UInt8 *)&v15[v17], v13 - v17, v28);
        CFRelease(v21);
        v22 = v28[0] + v17;
        v15[v22] = v16;
        v17 = v22 + 1;
      }
      p_length += 2;
      ++v16;
    }
    while (a5 + v16 < v18);
  }
  OutputSize = CCDigestGetOutputSize();
  v24 = (char *)&v26 - ((MEMORY[0x24BDAC7A8](OutputSize) + 15) & 0xFFFFFFFFFFFFFFF0);
  CCDigest();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v24, v27);
  return (id)objc_claimAutoreleasedReturnValue();
}

_QWORD *QPDataDetectorCreate()
{
  _QWORD *result;

  result = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  if (result)
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
    *((_DWORD *)result + 6) = 1;
  }
  return result;
}

uint64_t QPDataDetectorLoadResources(const void **a1, CFURLRef anURL)
{
  uint64_t v2;
  const __CFString *v4;
  const void *v5;
  const void *v6;
  NSObject *v8;
  const void *v9;
  uint8_t v10[8];
  CFTypeRef cf;

  v2 = 0;
  if (!a1 || !anURL)
    return v2;
  v4 = CFURLGetString(anURL);
  if (CFStringHasSuffix(v4, CFSTR("root.cache")))
  {
    if (!*a1)
    {
      cf = 0;
      v5 = (const void *)DDScannerCreateWithCacheFile();
      *a1 = v5;
      if (cf || !v5)
      {
        if (cf)
        {
          CFRelease(cf);
          v5 = *a1;
        }
        if (v5)
          CFRelease(v5);
        v2 = 0;
        *a1 = 0;
        return v2;
      }
      goto LABEL_16;
    }
    return 1;
  }
  if (CFStringHasSuffix(v4, CFSTR("dates.cache")))
  {
    if (a1[1])
      return 1;
    cf = 0;
    v6 = (const void *)DDScannerCreateWithCacheFile();
    a1[1] = v6;
    if (!cf && v6)
    {
LABEL_16:
      DDScannerSetOptions();
      return 1;
    }
    if (cf)
    {
      CFRelease(cf);
      v6 = a1[1];
    }
    if (v6)
      CFRelease(v6);
    v2 = 0;
    a1[1] = 0;
  }
  else
  {
    if (!CFStringHasSuffix(v4, CFSTR("lexicon.cache")) || a1[2])
      return 1;
    cf = 0;
    if (dataDetectorLogger_token != -1)
      dispatch_once(&dataDetectorLogger_token, &__block_literal_global_15);
    v8 = dataDetectorLogger_log;
    if (os_log_type_enabled((os_log_t)dataDetectorLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_218E10000, v8, OS_LOG_TYPE_DEFAULT, "QueryParserDataDetectors: Creating lexicon scanner", v10, 2u);
    }
    v9 = (const void *)DDScannerCreateWithCacheFile();
    a1[2] = v9;
    if (cf || !v9)
    {
      if (cf)
      {
        CFRelease(cf);
        v9 = a1[2];
      }
      if (v9)
        CFRelease(v9);
      v2 = 0;
      a1[2] = 0;
    }
    else
    {
      DDScannerSetOptions();
      v2 = 1;
      DDScannerEnableOptionalSource();
    }
  }
  return v2;
}

void QPDataDetectorClearResources(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;
  uint8_t v5[16];

  if (a1)
  {
    if (dataDetectorLogger_token != -1)
      dispatch_once(&dataDetectorLogger_token, &__block_literal_global_15);
    v2 = dataDetectorLogger_log;
    if (os_log_type_enabled((os_log_t)dataDetectorLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_218E10000, v2, OS_LOG_TYPE_DEFAULT, "QueryParserDataDetectors: releasing data detectors", v5, 2u);
    }
    if (*(_QWORD *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
      *(_QWORD *)a1 = 0;
    }
    v3 = *(const void **)(a1 + 8);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 8) = 0;
    }
    v4 = *(const void **)(a1 + 16);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

uint64_t QPDataDetectorSetDynamicSources(uint64_t result)
{
  NSObject *v1;
  uint8_t buf[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    if (*(_QWORD *)(result + 16))
    {
      MEMORY[0x24BDAC7A8](result);
      if (dataDetectorLogger_token != -1)
        dispatch_once(&dataDetectorLogger_token, &__block_literal_global_15);
      v1 = dataDetectorLogger_log;
      if (os_log_type_enabled((os_log_t)dataDetectorLogger_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218E10000, v1, OS_LOG_TYPE_DEFAULT, "QueryParserDataDetectors: setting dynamic sources on lexicon scanner", buf, 2u);
      }
      DDScannerSetClientTables();
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void QPDataDetectorEnumerateResults(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v6;
  uint64_t v7;
  const __CFArray *v8;
  CFIndex Count;
  const __CFArray *MutableCopy;
  __CFArray *v11;
  const CFSetCallBacks *v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  uint64_t v16;
  uint64_t v17;
  const void *ValueAtIndex;
  uint64_t Range;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  BOOL v27;
  const void *Type;
  const void *SubResults;
  const __CFString *MatchedString;
  __CFSet *v31;
  __CFSet *theSet;
  _QWORD v33[2];
  void (*v34)(uint64_t, uint64_t, char *);
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD block[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  CFMutableArrayRef Mutable;
  char v45[9];
  CFRange v46;

  if (a2 && *a1 && a1[1] && a1[2])
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2000000000;
    Mutable = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (v42[3])
    {
      if (getDataDetectorsQueue_onceToken != -1)
        dispatch_once(&getDataDetectorsQueue_onceToken, &__block_literal_global_11);
      v7 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __QPDataDetectorEnumerateResults_block_invoke;
      block[3] = &unk_24DA26B70;
      block[5] = a1;
      block[6] = a2;
      block[4] = &v41;
      dispatch_sync((dispatch_queue_t)getDataDetectorsQueue_dataDetectorsQueue, block);
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x2000000000;
      v39 = 0;
      v8 = (const __CFArray *)v42[3];
      v33[0] = v7;
      v33[1] = 0x40000000;
      v34 = __QPDataDetectorEnumerateResults_block_invoke_2;
      v35 = &unk_24DA26B98;
      v36 = a3;
      v37 = v38;
      if (v8)
      {
        if (CFArrayGetCount(v8))
        {
          Count = CFArrayGetCount(v8);
          MutableCopy = CFArrayCreateMutableCopy(v6, Count, v8);
          if (MutableCopy)
          {
            v11 = MutableCopy;
            v46.length = CFArrayGetCount(MutableCopy);
            v46.location = 0;
            CFArraySortValues(v11, v46, (CFComparatorFunction)ResultCompare, 0);
            v12 = (const CFSetCallBacks *)MEMORY[0x24BDBD6B8];
            v31 = CFSetCreateMutable(v6, 0, MEMORY[0x24BDBD6B8]);
            theSet = CFSetCreateMutable(v6, 0, v12);
            v45[0] = 0;
            v13 = CFArrayGetCount(v11);
            if (v13 >= 1)
            {
              v14 = v13;
              v15 = 0;
              v16 = 0;
              v17 = -1;
              do
              {
                ValueAtIndex = CFArrayGetValueAtIndex(v11, v15);
                Range = DDResultGetRange();
                v21 = Range;
                v22 = v20;
                if (v17 == -1
                  || ((v23 = v17 + v16, v24 = Range + v20, v17 >= Range) || v23 < v24)
                  && (v17 < Range ? (v25 = Range < v23) : (v25 = 0),
                      !v25 ? (v26 = 0) : (v26 = 1),
                      v23 > v24 ? (v27 = v17 <= Range) : (v27 = 0),
                      !v27 && (v26 & 1) == 0))
                {
                  Type = (const void *)DDResultGetType();
                  SubResults = (const void *)DDResultGetSubResults();
                  if (v21 != v17 || v22 != v16)
                  {
                    CFSetRemoveAllValues(theSet);
                    CFSetRemoveAllValues(v31);
LABEL_34:
                    MatchedString = (const __CFString *)DDResultGetMatchedString();
                    if (!CFStringHasSuffix(MatchedString, CFSTR(" ")))
                    {
                      v34((uint64_t)v33, (uint64_t)ValueAtIndex, v45);
                      if (v45[0])
                        break;
                      CFSetAddValue(theSet, Type);
                      if (SubResults)
                        CFSetAddValue(v31, SubResults);
                      v17 = v21;
                      v16 = v22;
                    }
                    goto LABEL_39;
                  }
                  if (!CFSetContainsValue(theSet, Type) || !SubResults || !CFSetContainsValue(v31, SubResults))
                    goto LABEL_34;
                }
LABEL_39:
                ++v15;
              }
              while (v14 != v15);
            }
            CFRelease(v11);
            CFRelease(theSet);
            CFRelease(v31);
          }
        }
      }
      CFRelease((CFTypeRef)v42[3]);
      _Block_object_dispose(v38, 8);
    }
    _Block_object_dispose(&v41, 8);
  }
}

void QPDataDetectorRelease(_DWORD *a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;

  if (a1)
  {
    v2 = a1[6] - 1;
    a1[6] = v2;
    if (!v2)
    {
      v3 = *(const void **)a1;
      if (*(_QWORD *)a1)
        CFRelease(v3);
      v4 = (const void *)*((_QWORD *)a1 + 1);
      if (v4)
        CFRelease(v4);
      v5 = (const void *)*((_QWORD *)a1 + 2);
      if (v5)
        CFRelease(v5);
      free(a1);
    }
  }
}

os_log_t __dataDetectorLogger_block_invoke()
{
  const char *v0;
  os_log_t result;

  v0 = _nlpLoggingSubsystem();
  result = os_log_create(v0, "QPDataDetector");
  dataDetectorLogger_log = (uint64_t)result;
  return result;
}

dispatch_queue_t __getDataDetectorsQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.QP.DataDetectors", 0);
  getDataDetectorsQueue_dataDetectorsQueue = (uint64_t)result;
  return result;
}

uint64_t ResultCompare()
{
  uint64_t Range;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  const __CFArray *SubResults;
  uint64_t v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v11;

  Range = DDResultGetRange();
  v2 = v1;
  v3 = DDResultGetRange();
  if (Range == v3)
  {
    v5 = v2 <= v4;
    if (v2 != v4)
    {
LABEL_14:
      if (v5)
        return 1;
      else
        return -1;
    }
    SubResults = (const __CFArray *)DDResultGetSubResults();
    v7 = DDResultGetSubResults();
    if (SubResults)
    {
      v8 = (const __CFArray *)v7;
      if (v7)
      {
        Count = CFArrayGetCount(SubResults);
        if (Count == CFArrayGetCount(v8))
          return 0;
        v11 = CFArrayGetCount(SubResults);
        v5 = v11 <= CFArrayGetCount(v8);
        goto LABEL_14;
      }
    }
    if (SubResults)
      return -1;
    else
      return 1;
  }
  else if (Range < v3)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

_QWORD *QPSpotlightKnowledgeSourceCreate(const void *a1, void *a2, const void *a3)
{
  _QWORD *v6;
  char *v7;
  CFTypeRef v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSArray *v29;
  uint64_t QueryString;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFAbsoluteTime Current;
  CFTypeRef v35;
  NSObject *v36;
  CFTypeRef cf;
  _QWORD v39[7];
  _QWORD v40[4];
  _BYTE block[24];
  void *v42;
  uint64_t v43;
  char *v44;
  CFTypeRef v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_malloc(0x40uLL, 0x80040A284212CuLL);
  if (v6)
  {
    v7 = 0;
    if (!a1 || !a2 || (v7 = (char *)malloc_type_calloc(1uLL, 0x98uLL, 0x10E0040CDD9FE59uLL)) == 0)
    {
LABEL_46:
      v6[2] = hasAnnotations;
      v6[3] = enumerateTypesAndAnnotationsForString;
      *v6 = v7;
      v6[1] = copyPossibleTypesForString;
      v6[4] = enumeratePossibleStringsWithType;
      v6[5] = hasUpdatesForParser;
      v6[6] = willUpdateParser;
      v6[7] = didUpdateParser;
      return v6;
    }
    if (a3)
      v8 = CFRetain(a3);
    else
      v8 = 0;
    *(_QWORD *)v7 = v8;
    *((_QWORD *)v7 + 9) = 0;
    *(_WORD *)(v7 + 65) = 0;
    *((_QWORD *)v7 + 16) = 0;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *((_QWORD *)v7 + 7) = 0;
    v7[64] = QPAnnotationsEnabled;
    if (a3)
    {
      v9 = CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("forTesting")) != 0;
      v10 = CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("waitForLoad")) != 0;
      cf = CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("customFieldSpecifications"));
    }
    else
    {
      v10 = 0;
      v9 = 0;
      cf = 0;
    }
    *((_DWORD *)v7 + 34) = 1000;
    *((_QWORD *)v7 + 5) = QPStringCacheCreateWithOptions(0, (const __CFDictionary *)&unk_24DA34B18);
    *((_QWORD *)v7 + 6) = QPStringCacheCreateWithOptions(0, 0);
    if (_os_feature_enabled_impl())
    {
      v11 = *MEMORY[0x24BDD0CD8];
      v40[0] = *MEMORY[0x24BDD0CD0];
      v40[1] = v11;
      v12 = *MEMORY[0x24BDD0CE0];
      v40[2] = *MEMORY[0x24BDD0CE8];
      v40[3] = v12;
      v13 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
      *((_QWORD *)v7 + 16) = v13;
      *((_QWORD *)v7 + 7) = QPSpotlightCacheCreate(objc_msgSend(v13, "count"));
    }
    if (v9)
    {
      addValue(*((_QWORD *)v7 + 5), CFSTR("Apple Directory"), 100, 8);
      addValue(*((_QWORD *)v7 + 5), CFSTR("六本木"), 100, 5);
      addValue(*((_QWORD *)v7 + 5), CFSTR("San Francisco"), 100, 5);
      addValue(*((_QWORD *)v7 + 5), CFSTR("San Jose"), 100, 5);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Oakland"), 100, 5);
      addValue(*((_QWORD *)v7 + 5), CFSTR("United Airlines"), 100, 6);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Holiday Inn"), 100, 11);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Honolulu"), 100, 5);
      addValue(*((_QWORD *)v7 + 5), CFSTR("San Francisco Airport"), 100, 7);
      addValue(*((_QWORD *)v7 + 5), CFSTR("John Smith"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Anna"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Mary Miller"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Gilles"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Julie"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Giulia"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Richard"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Christian"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Julia"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("April"), 100, 3);
      addValue(*((_QWORD *)v7 + 5), CFSTR("eBay"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("バラクオバマ"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("Max Heller"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("高橋"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("高橋真帆"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("ジョニー"), 100, 2);
      addValue(*((_QWORD *)v7 + 5), CFSTR("ジュリア"), 100, 2);
      v7[65] = 1;
    }
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    if (v9)
      v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = v15;
    *((_QWORD *)v7 + 12) = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.Knowledge", v15);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v7 + 13) = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.Queries", v17);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v7 + 11) = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.Context", v18);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v7 + 10) = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.Context", v19);
    v20 = _os_feature_enabled_impl();
    v21 = MEMORY[0x24BDAC760];
    if (v20)
    {
      v22 = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.DynamicQueries", v16);
      *((_QWORD *)v7 + 14) = v22;
      v23 = *((_QWORD *)v7 + 16);
      if (v10)
      {
        v24 = v21;
        *(_QWORD *)block = v21;
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke;
        v42 = &unk_24DA26CA8;
        v44 = v7;
        v45 = a1;
        v43 = v23;
        dispatch_sync(v22, block);
      }
      else
      {
        Current = CFAbsoluteTimeGetCurrent();
        v24 = v21;
        v39[0] = v21;
        v39[1] = 3221225472;
        v39[2] = ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke_2;
        v39[3] = &unk_24DA26CA8;
        v39[5] = v7;
        v39[6] = a1;
        v39[4] = v23;
        *((_QWORD *)v7 + 15) = createDispatchTimer((unint64_t)Current, v39);
      }
      goto LABEL_40;
    }
    v24 = MEMORY[0x24BDAC760];
    v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", a1);
    v26 = v10;
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v27 = sourceLogger(void)::log;
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)block = 138412546;
      *(_QWORD *)&block[4] = a2;
      *(_WORD *)&block[12] = 2112;
      *(_QWORD *)&block[14] = a1;
      _os_log_impl(&dword_218E10000, v27, OS_LOG_TYPE_DEFAULT, "loading content for context: %@, bundleID: %@", block, 0x16u);
    }
    v28 = v26;
    if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.spotlight"), cf) & 1) != 0)
    {
      v25 = 0;
      v29 = (NSArray *)&unk_24DA34CE0;
    }
    else
    {
      if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.mail")) & 1) != 0)
      {
        objc_msgSend(v25, "addObject:", CFSTR("com.apple.mobilemail"));
        objc_msgSend(v25, "addObject:", CFSTR("com.apple.spotlight.events"));
        v29 = (NSArray *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(&unk_24DA34CE0, "arrayByAddingObjectsFromArray:", &unk_24DA34D70), "arrayByAddingObjectsFromArray:", &unk_24DA34D88), "arrayByAddingObjectsFromArray:", &unk_24DA34DA0), "arrayByAddingObjectsFromArray:", &unk_24DA34DB8), "arrayByAddingObject:", CFSTR("kMDItemEventHotelReservationForName"));
        if (!v29)
          goto LABEL_40;
LABEL_29:
        *((_QWORD *)v7 + 14) = dispatch_queue_create("com.apple.QueryParser.SpotlightKnowledgeSource.DynamicQueries", v16);
        if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.spotlight")) & 1) != 0
          || objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.photos")))
        {
          QueryString = createQueryString((NSArray *)&unk_24DA34D58);
          v31 = objc_msgSend(v25, "allObjects");
          v32 = QueryString;
          v28 = v26;
          extractSpotlightTermsWithContext((uint64_t)v7, v32, v31, &unk_24DA34D58, (uint64_t)&unk_24DA34D40, (uint64_t)&unk_24DA34D28, v26);
        }
        if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.photos")) & 1) == 0)
        {
          v33 = createQueryString(v29);
          extractSpotlightTermsWithContext((uint64_t)v7, v33, objc_msgSend(v25, "allObjects"), v29, (uint64_t)&unk_24DA34CF8, (uint64_t)&unk_24DA34CE0, v28);
        }
        goto LABEL_40;
      }
      if (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.reminders")))
      {
        objc_msgSend(v25, "addObject:", CFSTR("com.apple.reminders"));
        goto LABEL_40;
      }
      if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.reminders.parser")) & 1) != 0
        || !objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.photos")))
      {
LABEL_40:
        if (cf)
          v35 = CFRetain(cf);
        else
          v35 = 0;
        *((_QWORD *)v7 + 1) = v35;
        v36 = *((_QWORD *)v7 + 12);
        *(_QWORD *)block = v24;
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = ___ZL30extractCustomFieldsWithContextP26_SpotlightKnowledgeContextPK14__CFDictionaryS3__block_invoke;
        v42 = &__block_descriptor_56_e5_v8__0l;
        v43 = 0;
        v44 = v7;
        v45 = cf;
        dispatch_sync(v36, block);
        if (v7[64] && loadSafetyResources((uint64_t)v7, 1))
        {
          systemListenerGetLocale();
          *((_QWORD *)v7 + 4) = SILexiconCacheCreateWithOptions();
          SILexiconCacheLoad();
        }
        goto LABEL_46;
      }
      objc_msgSend(v25, "addObject:", CFSTR("com.apple.mobileslideshow"));
      v29 = (NSArray *)&unk_24DA34D10;
    }
    *((_DWORD *)v7 + 34) = 5000;
    goto LABEL_29;
  }
  return v6;
}

void enumerateTypesAndAnnotationsForString(uint64_t a1, const __CFString *a2, CFRange *a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForString(a1, a2, a3, a4, a6);
}

void enumeratePossibleStringsWithType(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[8];
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;

  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v4 = sourceLogger(void)::log;
  v5 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218E10000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "enumerate all cache items", "", buf, 2u);
    }
  }
  if (a1 && a2)
  {
    v7 = *(NSObject **)(a1 + 96);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke;
    v15 = &unk_24DA26F10;
    v16 = a2;
    v17 = a1;
    dispatch_sync(v7, buf);
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v8 = sourceLogger(void)::log;
    v9 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_218E10000, v8, OS_SIGNPOST_INTERVAL_END, v10, "enumerate all cache items", "", v11, 2u);
      }
    }
  }
}

__CFArray *copyPossibleTypesForString(_QWORD *a1, __CFString *a2, int a3)
{
  const __CFAllocator *v6;
  __CFArray *Mutable;
  CFIndex Length;
  void *Locale;
  CFTypeRef v10;
  void *PreferredLanguages;
  CFTypeRef v12;
  void *v13;
  __CFString *v14;
  const void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  void *v31;
  CFTypeRef cf;
  CFRange v33;

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (a1)
  {
    if (a2)
    {
      Length = CFStringGetLength(a2);
      if (a3)
      {
        if (Length)
        {
          Locale = systemListenerGetLocale();
          v10 = CFRetain(Locale);
          PreferredLanguages = systemListenerGetPreferredLanguages();
          v12 = CFRetain(PreferredLanguages);
          v13 = (void *)-[__CFString stringByFoldingWithOptions:locale:](a2, "stringByFoldingWithOptions:locale:", 385, 0);
          v14 = (__CFString *)objc_msgSend((id)objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet")), "componentsJoinedByString:", CFSTR(" "));
          v33.length = -[__CFString length](v14, "length");
          v33.location = 0;
          v15 = (const void *)copyStringInsertingSpacesBetweenIdeographCharacters(v14, v33);
          v16 = (id)CFMakeCollectable(v15);
          if (v10)
            v17 = (const __CFString *)objc_msgSend(v16, "lowercaseStringWithLocale:", v10);
          else
            v17 = (const __CFString *)objc_msgSend(v16, "lowercaseString");
          v26 = 0;
          v27 = &v26;
          v28 = 0x3812000000;
          v29 = __Block_byref_object_copy__275;
          v30 = __Block_byref_object_dispose__276;
          v31 = &unk_218EB5CA1;
          cf = CFStringCreateMutableCopy(v6, 0, v17);
          v18 = (const __CFString *)v27[6];
          if (v18 && CFStringGetLength(v18) && v10 && v12)
          {
            v22 = 0;
            v23 = &v22;
            v24 = 0x2020000000;
            v25 = 0;
            v19 = a1[13];
            v21[0] = MEMORY[0x24BDAC760];
            v21[1] = 3221225472;
            v21[2] = ___ZL36QPSpotlightKnowledgeContextCopyTypesP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke;
            v21[3] = &unk_24DA26F38;
            v21[4] = &v22;
            v21[5] = &v26;
            v21[6] = a1;
            dispatch_sync(v19, v21);
            if (Mutable && *((_BYTE *)v23 + 24))
              CFArrayAppendValue(Mutable, CFSTR("Person"));
            _Block_object_dispose(&v22, 8);
          }
          _Block_object_dispose(&v26, 8);
          if (cf)
            CFRelease(cf);
          if (v12)
            CFRelease(v12);
          if (v10)
            CFRelease(v10);
        }
      }
    }
  }
  return Mutable;
}

void sub_218E897F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,CFTypeRef cf)
{
  const void *v26;
  const void *v27;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  if (cf)
    CFRelease(cf);
  if (v27)
    CFRelease(v27);
  if (v26)
    CFRelease(v26);
  _Unwind_Resume(a1);
}

BOOL hasUpdatesForParser(_QWORD *a1)
{
  NSObject *v1;
  _BOOL8 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = a1[11];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZL19hasUpdatesForParserPv_block_invoke;
  v4[3] = &unk_24DA26F60;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t willUpdateParser(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = mach_absolute_time();
    *(_QWORD *)(v1 + 144) = result;
  }
  return result;
}

void didUpdateParser(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a1[11];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL15didUpdateParserPv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync(v2, block);
    v3 = a1[18];
    v4 = mach_absolute_time();
    if (QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::onceToken != -1)
      dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::onceToken, &__block_literal_global_222);
    v6 = QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::sTimebaseInfo;
    v5 = *(unsigned int *)algn_253D1B614;
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v7 = sourceLogger(void)::log;
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = (float)((float)((v4 - v3) * v6 / v5) / 1000000.0);
      _os_log_impl(&dword_218E10000, v7, OS_LOG_TYPE_DEFAULT, "updated parser in %.1fms", buf, 0xCu);
    }
  }
}

_QWORD *QPSpotlightKnowledgeSourceUpdateOptions(_QWORD *result, uint64_t a2)
{
  if (result && a2)
  {
    result = (_QWORD *)*result;
    if (result)
      return (_QWORD *)QPSpotlightKnowledgeContextUpdateResources((uint64_t)result, 0);
  }
  return result;
}

void QPSpotlightKnowledgeSourceSetCustomFields(uint64_t *a1, const __CFDictionary *a2)
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  const void *v6;
  _QWORD block[7];

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v4 = *(_QWORD *)(v2 + 8);
      v5 = *(NSObject **)(v2 + 96);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___ZL30extractCustomFieldsWithContextP26_SpotlightKnowledgeContextPK14__CFDictionaryS3__block_invoke;
      block[3] = &__block_descriptor_56_e5_v8__0l;
      block[4] = v4;
      block[5] = v2;
      block[6] = a2;
      dispatch_sync(v5, block);
      v6 = *(const void **)(v2 + 8);
      if (v6)
      {
        CFRelease(v6);
        *(_QWORD *)(v2 + 8) = 0;
      }
      if (a2)
        *(_QWORD *)(v2 + 8) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2);
    }
  }
}

_QWORD *QPSpotlightKnowledgeSourceLoadResources(_QWORD *result)
{
  if (result)
  {
    result = (_QWORD *)*result;
    if (result)
      return (_QWORD *)QPSpotlightKnowledgeContextUpdateResources((uint64_t)result, 0);
  }
  return result;
}

uint64_t QPSpotlightKnowledgeContextUpdateResources(uint64_t a1, int a2)
{
  uint64_t result;

  result = loadSafetyResources(a1, a2 != 0);
  if ((_DWORD)result)
  {
    if (!*(_QWORD *)(a1 + 32))
      *(_QWORD *)(a1 + 32) = SILexiconCacheCreateWithOptions();
    systemListenerGetPreferredLanguages();
    return SILexiconCacheRefresh();
  }
  return result;
}

void QPSpotlightKnowledgeSourceRelease(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  NSObject *v5;
  _DWORD *v6;
  _DWORD *v7;
  CFArrayRef *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (*(_QWORD *)v2)
      {
        CFRelease(*(CFTypeRef *)v2);
        *(_QWORD *)v2 = 0;
      }
      unloadSafetyResources(v2);
      if (*(_QWORD *)(v2 + 32))
      {
        SILexiconCacheRelease();
        *(_QWORD *)(v2 + 32) = 0;
      }
      v3 = *(const void **)(v2 + 8);
      if (v3)
      {
        CFRelease(v3);
        *(_QWORD *)(v2 + 8) = 0;
      }
      v4 = *(NSObject **)(v2 + 112);
      if (v4)
      {
        *(_BYTE *)(v2 + 66) = 1;
        dispatch_sync(v4, &__block_literal_global_279);
        dispatch_sync(*(dispatch_queue_t *)(v2 + 96), &__block_literal_global_280);
        dispatch_sync(*(dispatch_queue_t *)(v2 + 104), &__block_literal_global_281);
        dispatch_sync(*(dispatch_queue_t *)(v2 + 88), &__block_literal_global_282);
        dispatch_sync(*(dispatch_queue_t *)(v2 + 80), &__block_literal_global_283);
        v5 = *(NSObject **)(v2 + 120);
        if (v5)
        {
          dispatch_source_cancel(*(dispatch_source_t *)(v2 + 120));
          dispatch_release(v5);
        }
      }
      dispatch_sync(*(dispatch_queue_t *)(v2 + 96), &__block_literal_global_284);
      dispatch_sync(*(dispatch_queue_t *)(v2 + 104), &__block_literal_global_285);
      dispatch_sync(*(dispatch_queue_t *)(v2 + 88), &__block_literal_global_286);
      dispatch_sync(*(dispatch_queue_t *)(v2 + 80), &__block_literal_global_287);
      v6 = *(_DWORD **)(v2 + 40);
      if (v6)
      {
        QPStringCacheRelease(v6);
        *(_QWORD *)(v2 + 40) = 0;
      }
      v7 = *(_DWORD **)(v2 + 48);
      if (v7)
      {
        QPStringCacheRelease(v7);
        *(_QWORD *)(v2 + 48) = 0;
      }
      v8 = *(CFArrayRef **)(v2 + 56);
      if (v8)
      {
        QPSpotlightCacheRelease(v8);
        *(_QWORD *)(v2 + 56) = 0;
      }
      v9 = *(NSObject **)(v2 + 96);
      if (v9)
      {
        dispatch_release(v9);
        *(_QWORD *)(v2 + 96) = 0;
      }
      v10 = *(NSObject **)(v2 + 104);
      if (v10)
      {
        dispatch_release(v10);
        *(_QWORD *)(v2 + 104) = 0;
      }
      v11 = *(NSObject **)(v2 + 88);
      if (v11)
      {
        dispatch_release(v11);
        *(_QWORD *)(v2 + 88) = 0;
      }
      v12 = *(NSObject **)(v2 + 80);
      if (v12)
      {
        dispatch_release(v12);
        *(_QWORD *)(v2 + 80) = 0;
      }
      v13 = *(NSObject **)(v2 + 112);
      if (v13)
        dispatch_release(v13);
      free((void *)v2);
      if (sourceLogger(void)::token != -1)
        dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
      v14 = sourceLogger(void)::log;
      if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218E10000, v14, OS_LOG_TYPE_DEFAULT, "released QPSpotlightKnowledgeContext", buf, 2u);
      }
    }
    free(a1);
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v15 = sourceLogger(void)::log;
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_218E10000, v15, OS_LOG_TYPE_DEFAULT, "released QPSpotlightKnowledgeSource", v16, 2u);
    }
  }
}

BOOL addValue(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  const void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __CFString *v15;
  const void *v16;
  const __CFString *v17;
  BOOL v18;
  const void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(__n128 *, __n128 *);
  uint64_t (*v28)();
  void *v29;
  __int128 v30;
  CFRange v31;
  CFRange v32;
  CFRange v33;

  if (!a2 || !-[__CFString length](a2, "length") || (unint64_t)-[__CFString length](a2, "length") > 0x28)
    return 0;
  if ((a4 & 0xFFFFFFFE) != 2)
  {
    v33.length = -[__CFString length](a2, "length");
    v33.location = 0;
    v19 = (const void *)copyStringInsertingSpacesBetweenIdeographCharacters(a2, v33);
    v20 = (const __CFString *)objc_msgSend((id)(id)CFMakeCollectable(v19), "lowercaseString");
    v21 = a1;
    v22 = a4;
    return QPStringCacheAddWithCount(v21, v20, v22, a3) != 0;
  }
  if ((-[__CFString containsString:](a2, "containsString:", CFSTR("@")) & 1) != 0
    || (-[__CFString containsString:](a2, "containsString:", CFSTR("+")) & 1) != 0)
  {
    return 0;
  }
  v31.length = -[__CFString length](a2, "length");
  v31.location = 0;
  v10 = (const void *)copyStringInsertingSpacesBetweenIdeographCharacters(a2, v31);
  v11 = (__CFString *)objc_msgSend((id)(id)CFMakeCollectable(v10), "lowercaseString");
  if ((-[__CFString isEqualToString:](v11, "isEqualToString:", -[__CFString lowercaseString](a2, "lowercaseString")) & 1) == 0)
  {
    v21 = a1;
    v20 = v11;
    v22 = 3;
    return QPStringCacheAddWithCount(v21, v20, v22, a3) != 0;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x4012000000;
  v27 = __Block_byref_object_copy__13;
  v28 = __Block_byref_object_dispose__13;
  v29 = &unk_218EB5CA1;
  v30 = xmmword_218EA0260;
  v12 = -[__CFString length](a2, "length");
  v13 = *MEMORY[0x24BDD0F88];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = ___ZL8addValueP14_QPStringCacheP8NSStringm18SpotlightInputType_block_invoke;
  v23[3] = &unk_24DA26C80;
  v23[4] = &v24;
  -[__CFString enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:](a2, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v12, v13, 4, 0, v23);
  if (v25[6] == 0x7FFFFFFFFFFFFFFFLL || (v14 = v25[7], v14 >= -[__CFString length](a2, "length")))
  {
    v18 = QPStringCacheAddWithCount(a1, v11, 3, a3) == 0;
  }
  else
  {
    v15 = (__CFString *)-[__CFString substringWithRange:](a2, "substringWithRange:", v25[6], v25[7]);
    v32.length = -[__CFString length](v15, "length");
    v32.location = 0;
    v16 = (const void *)copyStringInsertingSpacesBetweenIdeographCharacters(v15, v32);
    v17 = (const __CFString *)objc_msgSend((id)(id)CFMakeCollectable(v16), "lowercaseString");
    LODWORD(v15) = QPStringCacheAddWithCount(a1, v17, 3, a3);
    v18 = (QPStringCacheAddWithCount(a1, v11, a4, a3) | v15) == 0;
  }
  v8 = !v18;
  _Block_object_dispose(&v24, 8);
  return v8;
}

void sub_218E8A0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t createQueryString(NSArray *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](a1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = v2;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(a1);
        v5 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"*\""), v5));
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = objc_msgSend(&unk_24DA34DD0, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v15 != v9)
                objc_enumerationMutation(&unk_24DA34DD0);
              objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@!=\"%@\""), v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j)));
            }
            v8 = objc_msgSend(&unk_24DA34DD0, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v8);
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" && "))));
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](a1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" || ")));
}

void extractSpotlightTermsWithContext(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7)
{
  NSObject *v13;
  NSObject *v14;
  CFAbsoluteTime Current;
  _QWORD v16[10];
  char v17;
  _QWORD v18[10];
  char v19;
  _QWORD block[10];
  char v21;

  if (a7)
  {
    v13 = *(NSObject **)(a1 + 112);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke;
    block[3] = &unk_24DA26D20;
    block[4] = a2;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a1;
    v21 = 1;
    dispatch_sync(v13, block);
  }
  else if (objc_msgSend(a4, "containsObject:", CFSTR("kMDItemPhotosLocationKeywords")))
  {
    v14 = *(NSObject **)(a1 + 112);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_2;
    v18[3] = &unk_24DA26D20;
    v18[4] = a2;
    v18[5] = a3;
    v18[6] = a4;
    v18[7] = a5;
    v18[8] = a6;
    v18[9] = a1;
    v19 = 0;
    dispatch_async(v14, v18);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_3;
    v16[3] = &unk_24DA26D20;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    v16[7] = a5;
    v16[8] = a6;
    v16[9] = a1;
    v17 = 0;
    *(_QWORD *)(a1 + 120) = createDispatchTimer((unint64_t)Current, v16);
  }
}

uint64_t loadSafetyResources(uint64_t a1, char a2)
{
  _BOOL8 v3;
  NSObject *v4;
  __CFError **v5;
  __CFError **v6;
  nlp *v7;
  uint64_t v8;
  const __CFDictionary *DictionaryWithContentsOfURL;
  NSObject *v10;
  const void *Value;
  const void *v12;
  NSObject *v13;
  const __CFURL *PathComponent;
  CFStringRef v15;
  const __CFString *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t Count;
  NSObject *v20;
  int v22;
  CFTypeRef cf;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  void *v30;
  CFTypeRef v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  void *v37;
  CFTypeRef v38;
  uint8_t v39[4];
  uint64_t v40;
  __int16 v41;
  const void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0 && *(_QWORD *)(a1 + 16) && *(_QWORD *)(a1 + 24))
    return 1;
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v4 = sourceLogger(void)::log;
  if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218E10000, v4, OS_LOG_TYPE_DEFAULT, "safety: load resources", buf, 2u);
  }
  unloadSafetyResources(a1);
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3812000000;
  v35 = __Block_byref_object_copy__224;
  v36 = __Block_byref_object_dispose__225;
  v37 = &unk_218EB5CA1;
  v38 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3812000000;
  v28 = __Block_byref_object_copy__224;
  v29 = __Block_byref_object_dispose__225;
  v30 = &unk_218EB5CA1;
  v31 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = ___ZL19loadSafetyResourcesP26_SpotlightKnowledgeContextb_block_invoke;
  v24[3] = &unk_24DA26E50;
  v24[4] = buf;
  v24[5] = &v25;
  systemListenerEnumerateResourcesWithContentType((uint64_t)CFSTR("Safety"), v24);
  v7 = (nlp *)*((_QWORD *)v33 + 6);
  v8 = v26[6];
  if (v7)
  {
    if (v8)
    {
      cf = 0;
      DictionaryWithContentsOfURL = (const __CFDictionary *)nlp::createDictionaryWithContentsOfURL(v7, (CFErrorRef *)&cf, v5, v6);
      *(_QWORD *)(a1 + 16) = DictionaryWithContentsOfURL;
      if (cf)
      {
        if (sourceLogger(void)::token != -1)
          dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
        v10 = sourceLogger(void)::log;
        if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
          loadSafetyResources((uint64_t *)&cf, v10);
        CFRelease(cf);
      }
      else
      {
        Value = CFDictionaryGetValue(DictionaryWithContentsOfURL, CFSTR("compilationDate"));
        v12 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("safetyTypes"));
        if (sourceLogger(void)::token != -1)
          dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
        v13 = sourceLogger(void)::log;
        if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138412546;
          v40 = (uint64_t)Value;
          v41 = 2112;
          v42 = v12;
          _os_log_impl(&dword_218E10000, v13, OS_LOG_TYPE_DEFAULT, "safety: loading resource created at %@ with types %@", v39, 0x16u);
        }
        v22 = 0;
        QPCFDictionaryGetInt32ValueIfPresent(*(_QWORD *)(a1 + 16), CFSTR("majorVersion"), &v22);
        if (v22 == 2)
        {
          PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFURLRef)v26[6]);
          v15 = CFURLCopyPath(PathComponent);
          v16 = CFURLCopyLastPathComponent((CFURLRef)v26[6]);
          v17 = CFStringsAreEqual(v16, CFSTR("safety_resources.map"));
          v3 = v17;
          if (v17)
          {
            *(_QWORD *)(a1 + 24) = SIDataMapCreateMutable();
            if (sourceLogger(void)::token != -1)
              dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
            v18 = sourceLogger(void)::log;
            if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
            {
              Count = SIDataMapGetCount();
              *(_DWORD *)v39 = 134217984;
              v40 = Count;
              _os_log_impl(&dword_218E10000, v18, OS_LOG_TYPE_DEFAULT, "safety: loaded resource: %ld", v39, 0xCu);
            }
          }
          if (v16)
            CFRelease(v16);
          if (v15)
            CFRelease(v15);
          if (PathComponent)
            CFRelease(PathComponent);
          goto LABEL_47;
        }
        if (sourceLogger(void)::token != -1)
          dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
        v20 = sourceLogger(void)::log;
        if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
          loadSafetyResources(&v22, 2, v20);
      }
    }
    else
    {
      if (sourceLogger(void)::token != -1)
        dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
      if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
        loadSafetyResources();
    }
  }
  else if (v8)
  {
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
      loadSafetyResources();
  }
  v3 = 0;
LABEL_47:
  _Block_object_dispose(&v25, 8);
  if (v31)
    CFRelease(v31);
  _Block_object_dispose(buf, 8);
  if (v38)
    CFRelease(v38);
  return v3;
}

void sub_218E8A9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;
  uint64_t v28;

  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  nlp::CFScopedPtr<__CFURL const*>::reset(&a11, 0);
  _Block_object_dispose(&a20, 8);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v28 + 48), 0);
  _Block_object_dispose(&a27, 8);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v27 + 48), 0);
  _Unwind_Resume(a1);
}

void ___ZL33QPSpotlightKnowledgeContextCreatePK10__CFStringS1_PK14__CFDictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
      ___ZL33QPSpotlightKnowledgeContextCreatePK10__CFStringS1_PK14__CFDictionary_block_invoke_cold_1();
  }
}

__n128 __Block_byref_object_copy__13(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL8addValueP14_QPStringCacheP8NSStringm18SpotlightInputType_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v7 + 48) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(v7 + 48) = a3;
    *(_QWORD *)(v7 + 56) = a4;
  }
  else
  {
    *a7 = 1;
  }
  return result;
}

void ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke(uint64_t *a1)
{
  refreshSpotlightCache(a1[5], a1[6], a1[4]);
}

void refreshSpotlightCache(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  _QWORD block[9];
  uint8_t buf[16];

  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v6 = sourceLogger(void)::log;
  v7 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218E10000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "query QPSpotlightCache", "", buf, 2u);
    }
  }
  if (!*(_BYTE *)(a1 + 66))
  {
    v9 = objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex");
    if (v9)
    {
      v10 = v9;
      v11 = dispatch_group_create();
      v12 = *(NSObject **)(a1 + 96);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke;
      block[3] = &unk_24DA26CF8;
      block[4] = a3;
      block[5] = v11;
      block[6] = v10;
      block[7] = a2;
      block[8] = a1;
      dispatch_sync(v12, block);
      dispatch_release(v11);
      if (sourceLogger(void)::token != -1)
        dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
      v13 = sourceLogger(void)::log;
      if (!os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218E10000, v13, OS_LOG_TYPE_DEFAULT, "finished SpotlightCache query", buf, 2u);
    }
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
LABEL_14:
    v14 = sourceLogger(void)::log;
    v15 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_218E10000, v14, OS_SIGNPOST_INTERVAL_END, v16, "query QPSpotlightCache", "", buf, 2u);
      }
    }
  }
}

NSObject *createDispatchTimer(dispatch_time_t a1, void *a2)
{
  NSObject *v4;
  NSObject *v5;

  v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v5 = v4;
  if (v4)
  {
    dispatch_source_set_timer(v4, a1, 0x34630B8A000uLL, 0x68C61714000uLL);
    dispatch_source_set_event_handler(v5, a2);
    dispatch_resume(v5);
  }
  return v5;
}

void ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];
  __int128 v3;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke_3;
  block[3] = &unk_24DA26CA8;
  v3 = *(_OWORD *)(a1 + 40);
  v1 = *(NSObject **)(v3 + 112);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v1, block);
}

void ___ZL25extractFromSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke_3(uint64_t *a1)
{
  refreshSpotlightCache(a1[5], a1[6], a1[4]);
}

void ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t buf[16];
  _QWORD block[5];
  _QWORD v16[6];
  int v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fileDescriptor:%@:%@"), v5, *(_QWORD *)(a1 + 56));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke_2;
      v16[3] = &unk_24DA26CD0;
      v7 = *(_QWORD *)(a1 + 64);
      v17 = v4;
      v8 = *(void **)(a1 + 48);
      v16[4] = *(_QWORD *)(a1 + 40);
      v16[5] = v7;
      objc_msgSend(v8, "issueCacheCommand:completionHandler:", v6, v16);
      dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
      ++v4;
    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v4);
  }
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(NSObject **)(v9 + 88);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v9;
  dispatch_sync(v10, block);
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v11 = sourceLogger(void)::log;
  v12 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
  if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218E10000, v11, OS_SIGNPOST_EVENT, v13, "QPSpotlightCache updates", "", buf, 2u);
    }
  }
}

void ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke_2(uint64_t a1, int a2, xpc_object_t xdict, uint64_t a4)
{
  xpc_object_t value;
  int v7;
  xpc_object_t v8;
  int v9;
  xpc_object_t v10;
  int v11;

  if (xdict && !a4)
  {
    value = xpc_dictionary_get_value(xdict, "cache-node-fd");
    if (value)
      v7 = xpc_fd_dup(value);
    else
      v7 = -1;
    v8 = xpc_dictionary_get_value(xdict, "cache-container-fd");
    if (v8)
      v9 = xpc_fd_dup(v8);
    else
      v9 = -1;
    v10 = xpc_dictionary_get_value(xdict, "cache-payload-fd");
    if (v10)
    {
      v11 = xpc_fd_dup(v10);
      if ((v7 & 0x80000000) == 0 && (v9 & 0x80000000) == 0 && (v11 & 0x80000000) == 0)
        QPSpotlightCacheUpdate(*(CFArrayRef **)(*(_QWORD *)(a1 + 40) + 56), *(_DWORD *)(a1 + 48));
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t ___ZL21refreshSpotlightCacheP26_SpotlightKnowledgeContextPK10__CFStringP7NSArray_block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 1;
  return result;
}

void ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke(uint64_t a1)
{
  queryForAttributes(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 80) != 0);
}

void queryForAttributes(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7)
{
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  double v17;
  double Current;
  double v19;
  int v20;
  uint64_t v21;
  CFStringRef v22;
  const __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  os_signpost_id_t v32;
  uint8_t v33[16];
  _QWORD v34[5];
  id v35[3];
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39[2];
  id buf;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x24BDAC8D0];
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v14 = sourceLogger(void)::log;
  v15 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_218E10000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "query backend", "", (uint8_t *)&buf, 2u);
    }
  }
  if (!*(_BYTE *)(a1 + 66))
  {
    v17 = *(double *)(a1 + 72);
    Current = CFAbsoluteTimeGetCurrent();
    if ((a7 | (v17 == 0.0)) == 1)
      v19 = Current + -31536000.0;
    else
      v19 = *(double *)(a1 + 72);
    if (v17 == 0.0)
      v20 = 1;
    else
      v20 = a7;
    if (v20)
      v21 = 1000;
    else
      v21 = 100;
    *(double *)(a1 + 72) = Current;
    v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("(InRange(kMDItemContentCreationDate, %f, %f)) || (_kMDItemContentCreationDateYear!=* && InRange(kMDItemAttributeChangeDate, %f, %f))"), *(_QWORD *)&v19, *(_QWORD *)&Current, *(_QWORD *)&v19, *(_QWORD *)&Current);
    v23 = (id)CFMakeCollectable(v22);
    v24 = objc_alloc_init(MEMORY[0x24BDC2468]);
    v41[0] = a2;
    objc_msgSend(v24, "setFilterQueries:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1));
    objc_msgSend(v24, "setFetchAttributes:", a4);
    objc_msgSend(v24, "setRankingQueries:", a5);
    objc_msgSend(v24, "setBundleIDs:", a3);
    objc_msgSend(v24, "setLowPriority:", 1);
    objc_msgSend(v24, "setAttribute:", 1);
    objc_msgSend(v24, "setMaxCount:", v21);
    objc_msgSend(v24, "setMaximumBatchSize:", (6554 * v21) >> 16);
    objc_msgSend(v24, "setDisableResultStreaming:", 1);
    if (objc_msgSend(a4, "containsObject:", CFSTR("kMDItemPhotosLocationKeywords")))
    {
      objc_msgSend(v24, "setMaxCount:", *(int *)(a1 + 136));
      objc_msgSend(v24, "setMaximumBatchSize:", 500);
      v23 = &stru_24DA27910;
    }
    v25 = (void *)mach_absolute_time();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2460]), "initWithQueryString:queryContext:", v23, v24);
    objc_initWeak(&buf, v26);
    v27 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke;
    v38[3] = &unk_24DA26D70;
    v39[1] = (id)a1;
    objc_copyWeak(v39, &buf);
    v38[4] = a6;
    objc_msgSend(v26, "setFoundAttributesHandler:", v38);
    objc_msgSend(v26, "setChangedAttributesHandler:", v38);
    v28 = dispatch_group_create();
    v36[0] = v27;
    v36[1] = 3221225472;
    v36[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_213;
    v36[3] = &unk_24DA26D98;
    objc_copyWeak(&v37, &buf);
    objc_msgSend(v26, "setGatherEndedHandler:", v36);
    v34[0] = v27;
    v34[1] = 3221225472;
    v34[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_2_214;
    v34[3] = &unk_24DA26DE8;
    v35[1] = v25;
    v35[2] = (id)a1;
    v34[4] = v28;
    objc_copyWeak(v35, &buf);
    objc_msgSend(v26, "setCompletionHandler:", v34);
    dispatch_group_enter(v28);
    objc_msgSend(v26, "start");
    objc_msgSend(v26, "poll");
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v29 = sourceLogger(void)::log;
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_218E10000, v29, OS_LOG_TYPE_DEFAULT, "queryForAttributes: finished attribute query", v33, 2u);
    }

    dispatch_release(v28);
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v30 = sourceLogger(void)::log;
    v31 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v32 = v31;
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_218E10000, v30, OS_SIGNPOST_INTERVAL_END, v32, "query backend", "", v33, 2u);
      }
    }
    objc_destroyWeak(v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(v39);
    objc_destroyWeak(&buf);
  }
}

void sub_218E8B5B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

void ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_2(uint64_t a1)
{
  queryForAttributes(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 80) != 0);
}

void ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_4;
  block[3] = &unk_24DA26D20;
  v2 = *(_QWORD *)(a1 + 64);
  v1 = *(_QWORD *)(a1 + 72);
  v3 = *(NSObject **)(v1 + 112);
  block[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v4;
  v8 = v2;
  v9 = v1;
  v10 = *(_BYTE *)(a1 + 80);
  dispatch_async(v3, block);
}

void ___ZL32extractSpotlightTermsWithContextP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_h_block_invoke_4(uint64_t a1)
{
  queryForAttributes(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 80) != 0);
}

void ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id Weak;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD block[7];
  id v12[2];

  v4 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v4 + 66))
  {
    Weak = objc_loadWeak((id *)(a1 + 40));
    objc_msgSend(Weak, "cancel");
    objc_msgSend(Weak, "poll");
  }
  else
  {
    v8 = *(NSObject **)(v4 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_2;
    block[3] = &unk_24DA26D48;
    objc_copyWeak(v12, (id *)(a1 + 40));
    v9 = *(void **)(a1 + 48);
    block[4] = a2;
    block[5] = a3;
    v10 = *(_QWORD *)(a1 + 32);
    v12[1] = v9;
    block[6] = v10;
    dispatch_async(v8, block);
    objc_destroyWeak(v12);
  }
}

void ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_2(uint64_t a1)
{
  id Weak;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  char v10;
  uint64_t LiveCount;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  int v17;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCSEndOfBatchMarker")))
  {
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v3 = sourceLogger(void)::log;
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = Weak != 0;
      _os_log_impl(&dword_218E10000, v3, OS_LOG_TYPE_DEFAULT, "queryForAttributes: polling %d", buf, 8u);
    }
    objc_msgSend(Weak, "poll");
    return;
  }
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v4 = sourceLogger(void)::log;
  if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_218E10000, v4, OS_LOG_TYPE_DEFAULT, "queryForAttributes: attributes: %@", buf, 0xCu);
  }
  v6 = (void *)MEMORY[0x219A25054]();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMDItemPhotosLocationKeywords"))
    || (objc_msgSend(&unk_24DA34DA0, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(&unk_24DA34DB8, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 5;
    goto LABEL_15;
  }
  if (objc_msgSend(&unk_24DA34D70, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 7;
    goto LABEL_15;
  }
  if (objc_msgSend(&unk_24DA34D88, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 6;
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMDItemEventHotelReservationForName")))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 11;
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMDItemVendorName")))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 9;
    goto LABEL_15;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMDItemDisplayName")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMDItemAlternateNames")))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
    v8 = *(void **)(a1 + 40);
    v9 = 8;
LABEL_15:
    v10 = updateWithValues(v7, v8, v9);
    objc_autoreleasePoolPop(v6);
    if ((v10 & 1) == 0)
      return;
    goto LABEL_16;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_autoreleasePoolPop(v6);
    return;
  }
  v17 = updateWithValues(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), *(void **)(a1 + 40), 2u);
  objc_autoreleasePoolPop(v6);
  if (v17)
  {
LABEL_16:
    LiveCount = QPStringCacheGetLiveCount(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 40));
    v12 = *(_QWORD *)(a1 + 64);
    if (LiveCount > *(int *)(v12 + 136))
    {
      QPStringCachePrune(*(_QWORD *)(v12 + 40));
      v12 = *(_QWORD *)(a1 + 64);
    }
    v13 = *(NSObject **)(v12 + 88);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_211;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v12;
    dispatch_sync(v13, block);
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    v14 = sourceLogger(void)::log;
    v15 = os_signpost_id_generate((os_log_t)sourceLogger(void)::log);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_218E10000, v14, OS_SIGNPOST_EVENT, v16, "QPStringCache updates", "", buf, 2u);
      }
    }
  }
}

uint64_t updateWithValues(uint64_t a1, void *a2, unsigned int a3)
{
  int v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  unsigned int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v21)
  {
    v18 = a3;
    v5 = 0;
    v20 = *(_QWORD *)v34;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(a2);
        v7 = *(__CFString **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        objc_opt_class();
        v22 = v6;
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[__CFString length](v7, "length")
          && objc_msgSend((id)-[__CFString stringByTrimmingCharactersInSet:](v7, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet")), "length"))
        {
          if (v18 == 2)
          {
            v8 = (void *)-[__CFString componentsSeparatedByString:](v7, "componentsSeparatedByString:", CFSTR(";"));
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v23 = v8;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
            if (v9)
            {
              v10 = v9;
              v24 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v30 != v24)
                    objc_enumerationMutation(v23);
                  v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("/"));
                  v25 = 0u;
                  v26 = 0u;
                  v27 = 0u;
                  v28 = 0u;
                  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
                  if (v13)
                  {
                    v14 = v13;
                    v15 = *(_QWORD *)v26;
                    do
                    {
                      for (j = 0; j != v14; ++j)
                      {
                        if (*(_QWORD *)v26 != v15)
                          objc_enumerationMutation(v12);
                        v5 |= addValue(a1, (__CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet")), 1, 2);
                      }
                      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
                    }
                    while (v14);
                  }
                }
                v10 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
              }
              while (v10);
            }
          }
          else
          {
            v5 |= addValue(a1, v7, 1, v18);
          }
        }
        v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v21);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

uint64_t ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_211(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 1;
  return result;
}

uint64_t ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_213(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend(Weak, "poll");
  return objc_msgSend(Weak, "setGatherEndedHandler:", 0);
}

uint64_t ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_2_214(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id Weak;
  _QWORD block[5];
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = mach_absolute_time();
  if (QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::onceToken != -1)
    dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::onceToken, &__block_literal_global_222);
  v5 = QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::sTimebaseInfo;
  v4 = *(unsigned int *)algn_253D1B614;
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v6 = sourceLogger(void)::log;
  if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = (float)((float)((v3 - v2) * v5 / v4) / 1000000.0);
    _os_log_impl(&dword_218E10000, v6, OS_LOG_TYPE_DEFAULT, "queryForAttributes: query complete in %.1fms", buf, 0xCu);
  }
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_215;
  block[3] = &unk_24DA26DC0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, block);
  Weak = objc_loadWeak((id *)(a1 + 40));
  objc_msgSend(Weak, "setFoundAttributesHandler:", 0);
  objc_msgSend(Weak, "setChangedAttributesHandler:", 0);
  objc_msgSend(Weak, "setGatherEndedHandler:", 0);
  return objc_msgSend(Weak, "setCompletionHandler:", 0);
}

void ___ZL18queryForAttributesP26_SpotlightKnowledgeContextP8NSStringP7NSArrayS4_S4_S4_b_block_invoke_215(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t ___Z36QPTimingNanosecondsSinceAbsoluteTimey_block_invoke_2()
{
  return mach_timebase_info((mach_timebase_info_t)&QPTimingNanosecondsSinceAbsoluteTime(unsigned long long)::sTimebaseInfo);
}

void ___ZL30extractCustomFieldsWithContextP26_SpotlightKnowledgeContextPK14__CFDictionaryS3__block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex v3;
  unint64_t v4;
  const void **v5;
  size_t v6;
  BOOL v7;
  CFIndex v8;
  const __CFString *v9;
  uint64_t v10;
  BOOL v11;
  const void *v12;
  const __CFString *v13;
  const __CFDictionary *v14;
  CFDictionaryRef *v15;
  CFIndex Count;
  unint64_t v17;
  const void **v18;
  size_t v19;
  __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD block[6];
  CFRange v24;

  block[5] = *MEMORY[0x24BDAC8D0];
  v2 = *(const __CFDictionary **)(a1 + 32);
  if (!v2)
  {
    v15 = (CFDictionaryRef *)(a1 + 48);
    v14 = *(const __CFDictionary **)(a1 + 48);
    if (!v14)
      return;
    v7 = 0;
LABEL_18:
    Count = CFDictionaryGetCount(v14);
    MEMORY[0x24BDAC7A8](Count);
    v18 = (const void **)((char *)block - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v17 >= 0x200)
      v19 = 512;
    else
      v19 = v17;
    bzero((char *)block - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v19);
    CFDictionaryGetKeysAndValues(*v15, v18, 0);
    if (Count < 1)
    {
      if (!v7)
        return;
    }
    else
    {
      do
      {
        v20 = (__CFString *)*v18++;
        addValue(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v20, 1, 10);
        --Count;
      }
      while (Count);
    }
    goto LABEL_25;
  }
  v3 = CFDictionaryGetCount(v2);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (const void **)((char *)block - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v4 >= 0x200)
    v6 = 512;
  else
    v6 = v4;
  bzero((char *)block - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 32), v5, 0);
  v7 = v3 > 0;
  if (v3 >= 1)
  {
    v8 = v3;
    do
    {
      v9 = (const __CFString *)*v5;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      if (*v5)
        v11 = v10 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        v24.length = objc_msgSend((id)*v5, "length");
        v24.location = 0;
        v12 = (const void *)copyStringInsertingSpacesBetweenIdeographCharacters(v9, v24);
        v13 = (const __CFString *)objc_msgSend((id)(id)CFMakeCollectable(v12), "lowercaseString");
        QPStringCacheRemove(v10, v13, 0xAu);
      }
      ++v5;
      --v8;
    }
    while (v8);
  }
  v15 = (CFDictionaryRef *)(a1 + 48);
  v14 = *(const __CFDictionary **)(a1 + 48);
  if (v14)
    goto LABEL_18;
  if (v3 > 0)
  {
LABEL_25:
    QPStringCachePrune(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(NSObject **)(v21 + 88);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL30extractCustomFieldsWithContextP26_SpotlightKnowledgeContextPK14__CFDictionaryS3__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v21;
    dispatch_sync(v22, block);
  }
}

uint64_t ___ZL30extractCustomFieldsWithContextP26_SpotlightKnowledgeContextPK14__CFDictionaryS3__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 1;
  return result;
}

uint64_t unloadSafetyResources(uint64_t a1)
{
  const void *v2;
  uint64_t result;

  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    result = SIDataMapRelease();
    *(_QWORD *)(a1 + 24) = 0;
  }
  return result;
}

uint64_t __Block_byref_object_copy__224(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__225(uint64_t a1)
{
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(a1 + 48), 0);
}

void ___ZL19loadSafetyResourcesP26_SpotlightKnowledgeContextb_block_invoke(uint64_t a1, CFURLRef url)
{
  const __CFString *PathComponent;
  uint64_t v5;
  CFTypeRef v6;

  PathComponent = CFURLCopyLastPathComponent(url);
  if (CFStringsAreEqual(PathComponent, CFSTR("config.plist")))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = CFRetain(url);
  }
  else
  {
    if (!CFStringsAreEqual(PathComponent, CFSTR("safety_resources.map")))
      goto LABEL_6;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = CFRetain(url);
  }
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v5 + 48), v6);
LABEL_6:
  if (PathComponent)
    CFRelease(PathComponent);
}

void sub_218E8C38C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL QPSpotlightKnowledgeContextAnnotationsAvailable(uint64_t a1)
{
  systemListenerGetLocale();
  return *(_BYTE *)(a1 + 64) && *(_QWORD *)(a1 + 24) && SILexiconCacheIsAvailable() != 0;
}

void QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForString(uint64_t a1, CFStringRef theString, CFRange *a3, uint64_t a4, _QWORD *a5)
{
  const __CFString *v7;
  CFIndex Length;
  CFIndex v10;
  const __CFLocale *Locale;
  CFIndex MaximumSizeForEncoding;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  CFIndex *p_location;
  CFIndex v17;
  __CFString *v18;
  UInt8 *v19;
  const __CFString *v20;
  CFIndex *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int PayloadWithTokens;
  int v25;
  uint64_t v26;
  uint64_t v27;
  CFIndex v28;
  const __CFString *Identifier;
  CFIndex v30;
  NSObject *v31;
  CFIndex v32;
  const __CFString *v33;
  int v34;
  uint64_t v35;
  CFIndex *p_length;
  CFIndex v37;
  UInt8 *v38;
  __int128 v39;
  const __CFString *v40;
  const __CFLocale *v41;
  CFIndex v42;
  _QWORD *v43;
  CFIndex v44;
  unsigned __int8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void *v49;
  uint64_t *v50;
  CFIndex v51;
  CFIndex v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, CFStringRef);
  void *v57;
  uint64_t *v58;
  _QWORD *v59;
  CFIndex v60;
  CFIndex v61;
  _QWORD *v62;
  _QWORD v63[3];
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  int v69;
  int v70;
  CFIndex v71;
  int buf;
  const __CFString *v73;
  __int16 v74;
  CFIndex v75;
  __int16 v76;
  CFIndex v77;
  uint64_t v78;
  CFRange v79;

  v43 = a5;
  v78 = *MEMORY[0x24BDAC8D0];
  if (theString)
  {
    v7 = theString;
    Length = CFStringGetLength(theString);
    if (v43)
    {
      v10 = Length;
      if (Length)
      {
        Locale = (const __CFLocale *)systemListenerGetLocale();
        if (systemListenerHasResourceUpdates())
        {
          QPSpotlightKnowledgeContextUpdateResources(a1, 1);
        }
        else if (QPSpotlightKnowledgeContextAnnotationsAvailable(a1))
        {
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u);
          v35 = (uint64_t)&v35;
          v37 = MaximumSizeForEncoding + 1;
          MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
          v38 = (UInt8 *)&v35 - v13;
          v71 = 0;
          v70 = 5;
          QPCFDictionaryGetInt32ValueIfPresent(*(_QWORD *)(a1 + 16), CFSTR("maxTokenCount"), &v70);
          v69 = 6;
          QPCFDictionaryGetInt32ValueIfPresent(*(_QWORD *)(a1 + 16), CFSTR("hashSize"), &v69);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2020000000;
          v68 = 0;
          if (a4 >= 1)
          {
            v15 = 0;
            p_length = &a3->length;
            *(_QWORD *)&v14 = 138412802;
            v39 = v14;
            v40 = v7;
            v41 = Locale;
            while (1)
            {
              p_location = &a3[v15].location;
              v17 = p_location[1];
              v42 = *p_location;
              v18 = QPAnnotationsCopyNormalizedString(Locale, v7, v42, v17);
              v19 = v38;
              v20 = v18;
              if (v18)
              {
                v79.length = CFStringGetLength(v18);
                v79.location = 0;
                CFStringGetBytes(v20, v79, 0x8000100u, 0x2Du, 0, v19, v37, &v71);
                v19[v71] = 0;
              }
              v63[1] = v63;
              v63[2] = 0x2020000000;
              v64 = 0;
              v54 = MEMORY[0x24BDAC760];
              v55 = 3221225472;
              v56 = ___ZL64QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForStringP26_SpotlightKnowledgeContextPK10__CFStringPK7CFRangelPU13block_pointerFvS4_S3_PbESA__block_invoke;
              v57 = &unk_24DA26E78;
              v60 = v42;
              v61 = v17;
              v62 = v43;
              v63[0] = 0;
              v58 = &v65;
              v59 = v63;
              if (!SILexiconCacheEnumerateAnnotations())
              {
                v46 = MEMORY[0x24BDAC760];
                v47 = 3221225472;
                v48 = ___ZL64QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForStringP26_SpotlightKnowledgeContextPK10__CFStringPK7CFRangelPU13block_pointerFvS4_S3_PbESA__block_invoke_252;
                v49 = &unk_24DA26EA0;
                v52 = v17;
                v53 = v43;
                v50 = &v65;
                v51 = v42;
                SILexiconCacheEnumerateOVSAnnotationsInString();
              }
              if (v20)
                CFRelease(v20);
              if (*((_BYTE *)v66 + 24))
                break;
              if (*(_QWORD *)(a1 + 24))
              {
                v45 = 0;
                v21 = &p_length[2 * v15];
                v22 = v15;
                do
                {
                  v23 = v22 + v70;
                  if (v23 >= a4)
                    v23 = a4;
                  if (v15 >= v23)
                    break;
                  PayloadWithTokens = QPAnnotationsGetPayloadWithTokens(*(_QWORD *)(a1 + 24), v69, Locale, v7, a3, v22, v15 - v22 + 1, &v45);
                  v25 = v45;
                  if (v45)
                  {
                    v26 = a1;
                    v27 = *(v21 - 1);
                    v28 = *v21;
                    Identifier = (const __CFString *)QPAnnotationsGetIdentifier(PayloadWithTokens);
                    v30 = v42;
                    if (sourceLogger(void)::token != -1)
                    {
                      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
                      v30 = v42;
                    }
                    v44 = v27 - v30 + v28;
                    v31 = sourceLogger(void)::log;
                    v32 = v30;
                    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
                    {
                      buf = v39;
                      v73 = Identifier;
                      v74 = 2048;
                      v75 = v32;
                      v76 = 2048;
                      v77 = v44;
                      _os_log_impl(&dword_218E10000, v31, OS_LOG_TYPE_DEFAULT, "safety: found annotation type:%@ range:{%ld, %ld}", (uint8_t *)&buf, 0x20u);
                    }
                    if (Identifier)
                      v33 = Identifier;
                    else
                      v33 = CFSTR("SENSITIVE");
                    (*(void (**)(_QWORD, CFIndex, CFIndex, const __CFString *, uint64_t *))(*v43 + 16))(*v43, v32, v44, v33, v66 + 3);
                    v25 = v45;
                    v22 = v15;
                    a1 = v26;
                    v7 = v40;
                    Locale = v41;
                  }
                  v21 += 2;
                  ++v15;
                }
                while (!v25);
                v34 = *((unsigned __int8 *)v66 + 24);
                _Block_object_dispose(v63, 8);
                v15 = v22;
                if (v34)
                  goto LABEL_37;
              }
              else
              {
                _Block_object_dispose(v63, 8);
              }
              if (++v15 >= a4)
                goto LABEL_37;
            }
            _Block_object_dispose(v63, 8);
          }
LABEL_37:
          _Block_object_dispose(&v65, 8);
        }
      }
    }
  }
}

void sub_218E8C8E8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL64QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForStringP26_SpotlightKnowledgeContextPK10__CFStringPK7CFRangelPU13block_pointerFvS4_S3_PbESA__block_invoke(uint64_t a1, CFStringRef theString1)
{
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  CFStringRef v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = CFStringsAreEqual(theString1, CFSTR("COMMON"));
  if (!(_DWORD)result)
  {
    result = CFStringsAreEqual(theString1, CFSTR("EMOJI"));
    if (!(_DWORD)result)
    {
      if (sourceLogger(void)::token != -1)
        dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
      v5 = sourceLogger(void)::log;
      if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 56);
        v8 = 138412802;
        v9 = theString1;
        v10 = 2048;
        v11 = v6;
        v12 = 2048;
        v13 = v7;
        _os_log_impl(&dword_218E10000, v5, OS_LOG_TYPE_DEFAULT, "safety: found annotation type:%@ range:{%ld, %ld}", (uint8_t *)&v8, 0x20u);
      }
      result = (*(uint64_t (**)(void))(**(_QWORD **)(a1 + 64) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t ___ZL64QPSpotlightKnowledgeContextEnumerateTypesAndAnnotationsForStringP26_SpotlightKnowledgeContextPK10__CFStringPK7CFRangelPU13block_pointerFvS4_S3_PbESA__block_invoke_252(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (sourceLogger(void)::token != -1)
    dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
  v4 = sourceLogger(void)::log;
  if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138412802;
    v9 = a2;
    v10 = 2048;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_218E10000, v4, OS_LOG_TYPE_DEFAULT, "safety: found annotation type:%@ range:{%ld, %ld}", (uint8_t *)&v8, 0x20u);
  }
  return (*(uint64_t (**)(void))(**(_QWORD **)(a1 + 56) + 16))();
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFArrayRef *v8;
  _QWORD v9[6];
  _QWORD v10[6];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v2 + 40);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_2;
  v10[3] = &unk_24DA26EE8;
  v10[4] = v3;
  v10[5] = v2;
  QPStringCacheEnumerateStrings(v4, (uint64_t)v10);
  if (_os_feature_enabled_impl())
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(CFArrayRef **)(v6 + 56);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_5;
    v9[3] = &unk_24DA26EE8;
    v9[4] = v7;
    v9[5] = v6;
    QPSpotlightCacheEnumerateStrings(v8, (uint64_t)v9);
  }
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_2(uint64_t a1, const void *a2, int a3)
{
  void (*v5)(void);
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];

  switch(a3)
  {
    case 2:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 3:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      CFRetain(a2);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(NSObject **)(v6 + 104);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_3;
      v11[3] = &__block_descriptor_48_e5_v8__0l;
      v11[4] = a2;
      v11[5] = v6;
      v8 = v11;
      goto LABEL_5;
    case 4:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      CFRetain(a2);
      v9 = *(_QWORD *)(a1 + 40);
      v7 = *(NSObject **)(v9 + 104);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_4;
      v10[3] = &__block_descriptor_48_e5_v8__0l;
      v10[4] = a2;
      v10[5] = v9;
      v8 = v10;
LABEL_5:
      dispatch_async(v7, v8);
      return;
    case 5:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 6:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 7:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 8:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 9:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 10:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_13;
    case 11:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_13:
      v5();
      break;
    default:
      return;
  }
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_3(uint64_t a1)
{
  QPStringCacheAdd(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "lowercaseString"), 3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_4(uint64_t a1)
{
  QPStringCacheAdd(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "lowercaseString"), 4);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_5(uint64_t a1, const void *a2, __int16 a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD block[6];

  if ((a3 & 2) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = MEMORY[0x24BDAC760];
  if ((a3 & 4) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRetain(a2);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(NSObject **)(v7 + 104);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_6;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = v7;
    dispatch_async(v8, block);
    if ((a3 & 8) == 0)
    {
LABEL_5:
      if ((a3 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRetain(a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v9 + 104);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_7;
  v11[3] = &__block_descriptor_48_e5_v8__0l;
  v11[4] = a2;
  v11[5] = v9;
  dispatch_async(v10, v11);
  if ((a3 & 0x20) == 0)
  {
LABEL_6:
    if ((a3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x40) == 0)
  {
LABEL_7:
    if ((a3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x10) == 0)
  {
LABEL_8:
    if ((a3 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x400) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x100) == 0)
  {
LABEL_11:
    if ((a3 & 0x200) == 0)
      return;
    goto LABEL_12;
  }
LABEL_21:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((a3 & 0x200) == 0)
    return;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_6(uint64_t a1)
{
  QPStringCacheAdd(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "lowercaseString"), 3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___ZL51QPSpotlightKnowledgeContextEnumerateStringsWithTypeP26_SpotlightKnowledgeContextU13block_pointerFvPK10__CFStringS3_PbE_block_invoke_7(uint64_t a1)
{
  QPStringCacheAdd(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "lowercaseString"), 4);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __Block_byref_object_copy__275(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__276(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString *>::reset((const void **)(a1 + 48), 0);
}

BOOL ___ZL36QPSpotlightKnowledgeContextCopyTypesP26_SpotlightKnowledgeContextPK10__CFStringh_block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  result = QPStringCacheHasPrefixWithValue(*(_QWORD *)(a1[6] + 48), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48), 3);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    result = QPStringCacheHasPrefixWithValue(*(_QWORD *)(a1[6] + 48), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48), 4);
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

uint64_t ___ZL19hasUpdatesForParserPv_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 40) + 65);
  return result;
}

uint64_t ___ZL15didUpdateParserPv_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 0;
  return result;
}

void ___ZL42QPSpotlightKnowledgeContextUpdateResourcesP26_SpotlightKnowledgeContexth_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (sourceLogger(void)::token != -1)
      dispatch_once(&sourceLogger(void)::token, &__block_literal_global_288);
    if (os_log_type_enabled((os_log_t)sourceLogger(void)::log, OS_LOG_TYPE_ERROR))
      ___ZL33QPSpotlightKnowledgeContextCreatePK10__CFStringS1_PK14__CFDictionary_block_invoke_cold_1();
  }
}

os_log_t ___ZL12sourceLoggerv_block_invoke()
{
  const char *v0;
  os_log_t result;

  v0 = _nlpLoggingSubsystem();
  result = os_log_create(v0, "QPSpotlightKnowledgeSource");
  sourceLogger(void)::log = (uint64_t)result;
  return result;
}

CFStringRef QP::copyActionComponentWithModifier(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  if ((unsigned __int16)(a3 - 5) > 3u)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("_%@%@=%d"), a1, a2, a4);
  else
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, off_24DA27208[(__int16)(a3 - 5)], a1, a2, a4);
}

void QP::enumerateQueryWithAction(__CFCalendar *a1, const __CFDate *a2, void *key, CFDictionaryRef theDict, int a5, unsigned int *a6, unsigned int *a7, uint64_t a8)
{
  const __CFString *v14;
  const __CFAllocator *v15;
  CFMutableArrayRef Mutable;
  int v17;
  CFMutableArrayRef v18;
  uint64_t v19;
  unsigned int v20;
  CFAbsoluteTime AbsoluteTime;
  CFRange RangeOfUnit;
  uint64_t v23;
  _BOOL4 v25;
  BOOL v26;
  CFStringRef v27;
  uint64_t v28;
  CFStringRef v29;
  uint64_t v30;
  CFStringRef v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  __CFString *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  CFStringRef v75;
  CFStringRef v76;
  CFAbsoluteTime v77;
  CFRange v78;
  uint64_t v79;
  _BOOL4 v81;
  BOOL v82;
  uint64_t v83;
  CFStringRef v84;
  uint64_t v85;
  CFStringRef v86;
  CFStringRef v87;
  CFStringRef v88;
  uint64_t v89;
  const __CFString *v91;
  CFStringRef v92;
  CFStringRef v93;
  CFStringRef v94;
  CFStringRef v96;
  CFStringRef v97;
  uint64_t v98;
  uint64_t v99;
  CFStringRef v101;
  CFStringRef v102;
  uint64_t v103;
  CFStringRef v104;
  CFStringRef v105;
  CFStringRef v106;
  CFTypeRef v107;
  CFStringRef v108;
  CFStringRef v109;
  uint64_t v110;
  CFStringRef v111;
  CFAbsoluteTime v112;
  CFRange v113;
  CFIndex v114;
  CFStringRef v115;
  CFStringRef v116;
  CFStringRef v117;
  CFStringRef v118;
  CFTypeRef v119;
  void *v121;
  CFStringRef v122;
  CFStringRef v123;
  void *v124;
  CFTypeRef cf;
  void *value;
  CFTypeRef v127;

  if ((unsigned __int16)(a5 - 5) > 3u)
  {
    v14 = CFSTR("=");
    if (theDict)
      goto LABEL_3;
LABEL_5:
    v121 = 0;
    goto LABEL_6;
  }
  v14 = off_24DA27228[(__int16)(a5 - 5)];
  if (!theDict)
    goto LABEL_5;
LABEL_3:
  v121 = (void *)CFDictionaryGetValue(theDict, key);
LABEL_6:
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  value = 0;
  v127 = Mutable;
  cf = 0;
  if ((QP::DateComponents::isEmpty((QP::DateComponents *)a6) & 1) == 0)
  {
    if (QP::DateComponents::isEmpty((QP::DateComponents *)a7))
    {
      v17 = a5 & 0xFFFE;
      if (a5 == 5 || a5 == 8 || v17 == 6)
      {
        v18 = CFArrayCreateMutable(v15, 0, MEMORY[0x24BDBD690]);
        v124 = v18;
        v19 = a6[12];
        v20 = a6[8];
        if ((a6[11] & 0x80000000) != 0
          && (a6[10] & 0x80000000) != 0
          && (a6[9] & 0x80000000) != 0
          && (v19 & 0x80000000) != 0
          && (v20 & 0x80000000) != 0)
        {
          if ((a6[3] & 0x80000000) != 0)
          {
            v99 = a6[4];
            v98 = a6[5];
            if ((v99 & 0x80000000) != 0)
            {
              if ((v98 & 0x80000000) == 0)
              {
                v109 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year%@%d"), key, v14, v98);
                nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v109);
                CFArrayAppendValue(Mutable, value);
              }
LABEL_236:
              if (v121)
                CFArrayAppendValue(Mutable, v121);
              v117 = CFStringCreateByCombiningStrings(v15, Mutable, CFSTR(" || "));
              v123 = v117;
              if (CFArrayGetCount(Mutable) < 2)
              {
                v118 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v117);
                v119 = cf;
                if (!cf)
                  goto LABEL_243;
              }
              else
              {
                v118 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v117);
                v119 = cf;
                if (!cf)
                  goto LABEL_243;
              }
              CFRelease(v119);
LABEL_243:
              cf = v118;
              (*(void (**)(uint64_t, CFStringRef))(a8 + 16))(a8, v118);
              if (v117)
                CFRelease(v117);
LABEL_245:
              if (v18)
                CFRelease(v18);
              goto LABEL_247;
            }
            if ((v98 & 0x80000000) == 0)
            {
              if (a5 == 5 || a5 == 8)
                v101 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year<%d"), key, v98);
              else
                v101 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year>%d"), key, v98);
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v101);
              CFArrayAppendValue(Mutable, value);
              v99 = a6[4];
            }
            v102 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Month%@%d"), key, v14, v99);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v102);
            CFArrayAppendValue(v18, value);
            v103 = a6[5];
            if ((v103 & 0x80000000) == 0)
            {
              v104 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year=%d"), key, v103);
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v104);
              CFArrayAppendValue(v18, value);
            }
            v123 = CFStringCreateByCombiningStrings(v15, v18, CFSTR(" && "));
            if (CFArrayGetCount(v18) > 1)
              goto LABEL_233;
            goto LABEL_234;
          }
          AbsoluteTime = QP::DateComponents::getAbsoluteTime((QP::DateComponents *)a6, a1, a2);
          RangeOfUnit = CFCalendarGetRangeOfUnit(a1, 0x10uLL, 8uLL, AbsoluteTime);
          v23 = (int)a6[3];
          v25 = a5 == 5 && RangeOfUnit.location == v23;
          v26 = RangeOfUnit.length == v23 && a5 == 6;
          if (v26 || v25)
          {
            v108 = CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@Day,%ld,%ld)"), key, RangeOfUnit.location, RangeOfUnit.length);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v108);
            CFArrayAppendValue(Mutable, value);
            goto LABEL_236;
          }
          v27 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Day%@%d"), key, v14, v23);
          nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v27);
          CFArrayAppendValue(v18, value);
          v28 = a6[5];
          if ((v28 & 0x80000000) == 0)
          {
            v29 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year=%d"), key, v28);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v29);
            CFArrayAppendValue(v18, value);
            v30 = a6[4];
            if ((v30 & 0x80000000) == 0)
            {
              v31 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Month=%d"), key, v30);
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v31);
              CFArrayAppendValue(v18, value);
            }
LABEL_232:
            v123 = CFStringCreateByCombiningStrings(v15, v18, CFSTR(" && "));
            if (CFArrayGetCount(v18) > 1)
            {
LABEL_233:
              v116 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v123);
LABEL_235:
              nlp::CFScopedPtr<__CFString const*>::reset(&cf, v116);
              CFArrayAppendValue(Mutable, cf);
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v123, 0);
              goto LABEL_236;
            }
LABEL_234:
            v116 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v123);
            goto LABEL_235;
          }
          v110 = a6[4];
          if ((v110 & 0x80000000) != 0)
            goto LABEL_232;
          v111 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Month=%d"), key, v110);
          nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v111);
          CFArrayAppendValue(v18, value);
          v112 = QP::DateComponents::getAbsoluteTime((QP::DateComponents *)a6, a1, a2);
          v113 = CFCalendarGetRangeOfUnit(a1, 8uLL, 4uLL, v112);
          if ((a5 == 8 || a5 == 5) && (v114 = (int)a6[4] - 1, v113.location <= v114))
          {
            if (v113.location != v114)
            {
              v115 = CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@Month,%ld,%d)"), key, v113.location, v114);
              goto LABEL_230;
            }
          }
          else
          {
            if (v17 != 6)
              goto LABEL_231;
            v114 = (int)a6[4] + 1;
            if (v113.length < v114)
              goto LABEL_231;
            if (v113.length != v114)
            {
              v115 = CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@Month,%d,%ld)"), key, (int)a6[4] + 1, v113.length);
LABEL_230:
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v115);
LABEL_231:
              CFArrayAppendValue(Mutable, value);
              goto LABEL_232;
            }
          }
          v115 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Month=%d"), key, v114);
          goto LABEL_230;
        }
        if ((v20 & 0x80000000) != 0)
        {
          if ((v19 & 0x80000000) == 0)
          {
            value = (void *)CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year%@%d"), key, v14, v19);
            CFArrayAppendValue(v18, value);
          }
          goto LABEL_245;
        }
        v77 = QP::DateComponents::getAbsoluteTime((QP::DateComponents *)a6, a1, a2);
        v78 = CFCalendarGetRangeOfUnit(a1, 0x200uLL, 0x2000uLL, v77);
        v79 = (int)a6[8];
        v81 = a5 == 5 && v78.location == v79;
        v82 = v78.length == v79 && a5 == 6;
        if (v82 || v81)
        {
          value = (void *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@Weekday,%ld,%ld)"), key, v78.location, v78.length);
          CFArrayAppendValue(Mutable, value);
        }
        else
        {
          value = (void *)CFStringCreateWithFormat(v15, 0, CFSTR("_%@Weekday%@%d"), key, v14, v79);
          CFArrayAppendValue(v18, value);
          v83 = a6[11];
          if ((v83 & 0x80000000) == 0)
          {
            v84 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@WeekOfYear=%d"), key, v83);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v84);
            CFArrayAppendValue(v18, value);
          }
          v85 = a6[12];
          if ((v85 & 0x80000000) == 0)
          {
            v86 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year=%d"), key, v85);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v86);
            CFArrayAppendValue(v18, value);
          }
          v87 = CFStringCreateByCombiningStrings(v15, v18, CFSTR(" && "));
          v123 = v87;
          if (CFArrayGetCount(v18) <= 1)
            v88 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v87);
          else
            v88 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v87);
          nlp::CFScopedPtr<__CFString const*>::reset(&cf, v88);
          CFArrayAppendValue(Mutable, cf);
          v89 = a6[11];
          if ((v89 & 0x80000000) == 0)
          {
            if (a5 == 5 || a5 == 8)
            {
              v91 = CFSTR("_%@Year<%d");
              v92 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year<%d"), key, v89);
            }
            else
            {
              v91 = CFSTR("_%@Year>%d");
              v92 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year>%d"), key, v89);
            }
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v92);
            CFArrayAppendValue(v18, value);
            if ((a6[12] & 0x80000000) == 0)
            {
              v93 = CFStringCreateWithFormat(v15, 0, v91, key, a6[11]);
              nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v93);
              CFArrayAppendValue(v18, value);
            }
            v122 = CFStringCreateByCombiningStrings(v15, v18, CFSTR(" && "));
            if (CFArrayGetCount(v18) <= 1)
              v94 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v122);
            else
              v94 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v122);
            nlp::CFScopedPtr<__CFString const*>::reset(&cf, v94);
            CFArrayAppendValue(Mutable, cf);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v122, 0);
          }
          if ((a6[12] & 0x80000000) == 0)
          {
            if (a5 == 5 || a5 == 8)
              v96 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year<%d"), key, a6[11]);
            else
              v96 = CFStringCreateWithFormat(v15, 0, CFSTR("_%@Year>%d"), key, a6[11]);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&value, v96);
            CFArrayAppendValue(v18, value);
            v122 = CFStringCreateByCombiningStrings(v15, v18, CFSTR(" && "));
            if (CFArrayGetCount(v18) <= 1)
              v97 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v122);
            else
              v97 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v122);
            nlp::CFScopedPtr<__CFString const*>::reset(&cf, v97);
            CFArrayAppendValue(Mutable, cf);
            nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v122, 0);
          }
          if (v87)
            CFRelease(v87);
        }
        if (v121)
          CFArrayAppendValue(Mutable, v121);
        v105 = CFStringCreateByCombiningStrings(v15, Mutable, CFSTR(" && "));
        v123 = v105;
        if (CFArrayGetCount(Mutable) < 2)
        {
          v106 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v105);
          v107 = cf;
          if (!cf)
            goto LABEL_214;
        }
        else
        {
          v106 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v105);
          v107 = cf;
          if (!cf)
            goto LABEL_214;
        }
        CFRelease(v107);
LABEL_214:
        cf = v106;
        (*(void (**)(uint64_t, CFStringRef))(a8 + 16))(a8, v106);
        if (v105)
          CFRelease(v105);
        goto LABEL_245;
      }
    }
  }
  v32 = *a6;
  v33 = *a7;
  if ((v32 & 0x80000000) != 0)
  {
    if ((v33 & 0x80000000) != 0)
      goto LABEL_38;
    v34 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Second"), a5, *a7);
  }
  else if ((v33 & 0x80000000) != 0)
  {
    v34 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Second"), a5, v32);
  }
  else
  {
    v34 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Second"), *a6, v33);
  }
  value = v34;
  CFArrayAppendValue(Mutable, v34);
LABEL_38:
  v35 = a6[1];
  v36 = a7[1];
  if ((v35 & 0x80000000) != 0)
  {
    if ((v36 & 0x80000000) != 0)
      goto LABEL_48;
    v37 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Minute"), a5, a7[1]);
    v38 = value;
    if (value)
      goto LABEL_46;
  }
  else if ((v36 & 0x80000000) != 0)
  {
    v37 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Minute"), a5, v35);
    v38 = value;
    if (value)
LABEL_46:
      CFRelease(v38);
  }
  else
  {
    v37 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Minute"), a6[1], v36);
    v38 = value;
    if (value)
      goto LABEL_46;
  }
  value = v37;
  CFArrayAppendValue(Mutable, v37);
LABEL_48:
  v39 = a6[2];
  v40 = a7[2];
  if ((v39 & 0x80000000) != 0)
  {
    if ((v40 & 0x80000000) != 0)
      goto LABEL_58;
    v41 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Hour"), a5, a7[2]);
    v42 = value;
    if (value)
      goto LABEL_56;
  }
  else if ((v40 & 0x80000000) != 0)
  {
    v41 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Hour"), a5, v39);
    v42 = value;
    if (value)
LABEL_56:
      CFRelease(v42);
  }
  else
  {
    v41 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Hour"), a6[2], v40);
    v42 = value;
    if (value)
      goto LABEL_56;
  }
  value = v41;
  CFArrayAppendValue(Mutable, v41);
LABEL_58:
  v43 = a6[3];
  v44 = a7[3];
  if ((v43 & 0x80000000) != 0)
  {
    if ((v44 & 0x80000000) != 0)
      goto LABEL_68;
    v45 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Day"), a5, a7[3]);
    v46 = value;
    if (value)
      goto LABEL_66;
  }
  else if ((v44 & 0x80000000) != 0)
  {
    v45 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Day"), a5, v43);
    v46 = value;
    if (value)
LABEL_66:
      CFRelease(v46);
  }
  else
  {
    v45 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Day"), a6[3], v44);
    v46 = value;
    if (value)
      goto LABEL_66;
  }
  value = v45;
  CFArrayAppendValue(Mutable, v45);
LABEL_68:
  v47 = a6[4];
  v48 = a7[4];
  if ((v47 & 0x80000000) != 0)
  {
    if ((v48 & 0x80000000) != 0)
      goto LABEL_78;
    v49 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Month"), a5, a7[4]);
    v50 = value;
    if (value)
      goto LABEL_76;
  }
  else if ((v48 & 0x80000000) != 0)
  {
    v49 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Month"), a5, v47);
    v50 = value;
    if (value)
LABEL_76:
      CFRelease(v50);
  }
  else
  {
    v49 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Month"), a6[4], v48);
    v50 = value;
    if (value)
      goto LABEL_76;
  }
  value = v49;
  CFArrayAppendValue(Mutable, v49);
LABEL_78:
  v51 = a6[5];
  v52 = a7[5];
  if ((v51 & 0x80000000) != 0)
  {
    if ((v52 & 0x80000000) != 0)
      goto LABEL_88;
    v53 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Year"), a5, a7[5]);
    v54 = value;
    if (value)
      goto LABEL_86;
  }
  else if ((v52 & 0x80000000) != 0)
  {
    v53 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Year"), a5, v51);
    v54 = value;
    if (value)
LABEL_86:
      CFRelease(v54);
  }
  else
  {
    v53 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Year"), a6[5], v52);
    v54 = value;
    if (value)
      goto LABEL_86;
  }
  value = v53;
  CFArrayAppendValue(Mutable, v53);
LABEL_88:
  v55 = a6[8];
  v56 = a7[8];
  if ((v55 & 0x80000000) != 0)
  {
    if ((v56 & 0x80000000) != 0)
      goto LABEL_98;
    v57 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Weekday"), a5, a7[8]);
    v58 = value;
    if (value)
      goto LABEL_96;
  }
  else if ((v56 & 0x80000000) != 0)
  {
    v57 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Weekday"), a5, v55);
    v58 = value;
    if (value)
LABEL_96:
      CFRelease(v58);
  }
  else
  {
    v57 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Weekday"), a6[8], v56);
    v58 = value;
    if (value)
      goto LABEL_96;
  }
  value = v57;
  CFArrayAppendValue(Mutable, v57);
LABEL_98:
  v59 = a6[10];
  v60 = a7[10];
  if ((v59 & 0x80000000) != 0)
  {
    if ((v60 & 0x80000000) != 0)
      goto LABEL_108;
    v61 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekOfMonth"), a5, a7[10]);
    v62 = value;
    if (value)
      goto LABEL_106;
  }
  else if ((v60 & 0x80000000) != 0)
  {
    v61 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekOfMonth"), a5, v59);
    v62 = value;
    if (value)
LABEL_106:
      CFRelease(v62);
  }
  else
  {
    v61 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("WeekOfMonth"), a6[10], v60);
    v62 = value;
    if (value)
      goto LABEL_106;
  }
  value = v61;
  CFArrayAppendValue(Mutable, v61);
LABEL_108:
  v63 = a6[11];
  v64 = a7[11];
  if ((v63 & 0x80000000) != 0)
  {
    if ((v64 & 0x80000000) != 0)
      goto LABEL_118;
    v65 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekOfYear"), a5, a7[11]);
    v66 = value;
    if (value)
      goto LABEL_116;
  }
  else if ((v64 & 0x80000000) != 0)
  {
    v65 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekOfYear"), a5, v63);
    v66 = value;
    if (value)
LABEL_116:
      CFRelease(v66);
  }
  else
  {
    v65 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("WeekOfYear"), a6[11], v64);
    v66 = value;
    if (value)
      goto LABEL_116;
  }
  value = v65;
  CFArrayAppendValue(Mutable, v65);
LABEL_118:
  v67 = a6[12];
  v68 = a7[12];
  if ((v67 & 0x80000000) != 0)
  {
    if ((v68 & 0x80000000) != 0)
      goto LABEL_128;
    v69 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Year"), a5, a7[12]);
    v70 = value;
    if (value)
      goto LABEL_126;
  }
  else if ((v68 & 0x80000000) != 0)
  {
    v69 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("Year"), a5, v67);
    v70 = value;
    if (value)
LABEL_126:
      CFRelease(v70);
  }
  else
  {
    v69 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("Year"), a6[12], v68);
    v70 = value;
    if (value)
      goto LABEL_126;
  }
  value = v69;
  CFArrayAppendValue(Mutable, v69);
LABEL_128:
  v71 = a6[9];
  v72 = a7[9];
  if ((v71 & 0x80000000) == 0)
  {
    if ((v72 & 0x80000000) != 0)
    {
      v73 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekdayOrdinal"), a5, v71);
      v74 = value;
      if (value)
LABEL_136:
        CFRelease(v74);
    }
    else
    {
      v73 = (__CFString *)CFStringCreateWithFormat(v15, 0, CFSTR("InRange(_%@%@, %d, %d)"), key, CFSTR("WeekdayOrdinal"), a6[9], v72);
      v74 = value;
      if (value)
        goto LABEL_136;
    }
LABEL_137:
    value = v73;
    CFArrayAppendValue(Mutable, v73);
    goto LABEL_138;
  }
  if ((v72 & 0x80000000) == 0)
  {
    v73 = (__CFString *)QP::copyActionComponentWithModifier((uint64_t)key, (uint64_t)CFSTR("WeekdayOrdinal"), a5, a7[9]);
    v74 = value;
    if (value)
      goto LABEL_136;
    goto LABEL_137;
  }
LABEL_138:
  if (v121)
    CFArrayAppendValue(Mutable, v121);
  v75 = CFStringCreateByCombiningStrings(v15, Mutable, CFSTR(" && "));
  v124 = (void *)v75;
  if (CFArrayGetCount(Mutable) < 2)
    v76 = CFStringCreateWithFormat(v15, 0, CFSTR("%@"), v75);
  else
    v76 = CFStringCreateWithFormat(v15, 0, CFSTR("(%@)"), v75);
  cf = v76;
  (*(void (**)(uint64_t, CFStringRef))(a8 + 16))(a8, v76);
  if (v75)
    CFRelease(v75);
LABEL_247:
  if (cf)
    CFRelease(cf);
  if (value)
    CFRelease(value);
  if (v127)
    CFRelease(v127);
}

void sub_218E8E570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  const void *v9;
  va_list va;
  const void *v11;
  va_list va1;
  const void *v13;
  va_list va2;
  const void *v15;
  va_list va3;
  va_list va4;

  va_start(va4, a8);
  va_start(va3, a8);
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v11 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v13 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v15 = va_arg(va4, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)va4, 0);
  _Unwind_Resume(a1);
}

BOOL QP::Formatter::loadFormatterResource(QP::DateFormatter **this, const __CFURL *a2)
{
  return QP::DateFormatter::loadDateFormatterResource(this[5], a2);
}

void QP::Formatter::clearResources(QP::Formatter *this)
{
  const void **v1;

  v1 = (const void **)*((_QWORD *)this + 5);
  if (v1)
    QP::DateFormatter::clearResources(v1);
}

void QP::Formatter::update(QP::Formatter *this)
{
  const void **v1;

  v1 = (const void **)*((_QWORD *)this + 5);
  if (v1)
    QP::DateFormatter::update(v1);
}

void QP::Formatter::clear(const void **this)
{
  const void **v2;
  const __CFAllocator *v3;
  const CFDictionaryKeyCallBacks *v4;
  const CFDictionaryValueCallBacks *v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  const void **v8;
  CFMutableAttributedStringRef v9;
  __CFDictionary *v10;

  v2 = this + 7;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  nlp::CFScopedPtr<__CFDictionary *>::reset(v2, Mutable);
  v7 = CFDictionaryCreateMutable(v3, 0, v4, v5);
  nlp::CFScopedPtr<__CFDictionary *>::reset(this + 8, v7);
  v8 = this + 9;
  v9 = CFAttributedStringCreateMutable(v3, 0);
  nlp::CFScopedPtr<__CFAttributedString *>::reset(this + 9, v9);
  v10 = (__CFDictionary *)this[7];
  if (v10 && *v8)
    CFDictionarySetValue(v10, kQPParseResultAttributedParseKey, *v8);
  this[10] = 0;
}

void QP::Formatter::setParseAttribute(QP::Formatter *this, CFStringRef attrName, CFTypeRef value, CFRange range)
{
  __CFAttributedString *v4;

  if (!*(_BYTE *)(*((_QWORD *)this + 1) + 22) && value && attrName)
  {
    v4 = (__CFAttributedString *)*((_QWORD *)this + 9);
    if (v4)
      CFAttributedStringSetAttribute(v4, range, attrName, value);
  }
}

void QP::Formatter::removeParseAttribute(QP::Formatter *this, CFStringRef attrName, CFRange range)
{
  __CFAttributedString *v3;

  if (attrName)
  {
    v3 = (__CFAttributedString *)*((_QWORD *)this + 9);
    if (v3)
      CFAttributedStringRemoveAttribute(v3, range, attrName);
  }
}

CFTypeRef QP::Formatter::getParseAttribute(QP::Formatter *this, CFStringRef attrName, CFRange a3)
{
  CFTypeRef result;
  const __CFAttributedString *v5;
  CFIndex length;
  CFIndex location;
  CFRange v9;

  result = 0;
  if (attrName)
  {
    v5 = (const __CFAttributedString *)*((_QWORD *)this + 9);
    if (v5)
    {
      length = a3.length;
      location = a3.location;
      result = CFAttributedStringGetAttribute(v5, a3.location, attrName, &v9);
      if (length != v9.length || location != v9.location)
        return 0;
    }
  }
  return result;
}

uint64_t QP::Formatter::isValid()
{
  return 1;
}

uint64_t QP::Formatter::setCompletion(const void **a1)
{
  QP::Formatter::clear(a1);
  return 1;
}

void QP::Formatter::setDefaultParse(uint64_t a1, const __CFString ***a2)
{
  const __CFString *v4;
  const __CFAttributedString *v5;
  const __CFString **v6;
  CFNumberRef v7;
  CFNumberRef v8;
  __CFDictionary *v9;
  const __CFString **valuePtr;
  CFRange v11;

  QP::Formatter::clear((const void **)a1);
  v4 = &stru_24DA27910;
  if (*a2 && **a2)
    v4 = **a2;
  v5 = *(const __CFAttributedString **)(a1 + 72);
  v11.length = CFAttributedStringGetLength(v5);
  v11.location = 0;
  CFAttributedStringReplaceString(v5, v11, v4);
  v6 = *a2;
  if (*a2)
    v6 = (const __CFString **)v6[6];
  valuePtr = v6;
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCFIndexType, &valuePtr);
  if (v7)
  {
    v8 = v7;
    if (kQPParseResultTokenCountKey)
    {
      v9 = *(__CFDictionary **)(a1 + 56);
      if (v9)
        CFDictionarySetValue(v9, kQPParseResultTokenCountKey, v8);
    }
    CFRelease(v8);
  }
}

void sub_218E8E990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  nlp::CFScopedPtr<__CFNumber const*>::reset(&a9, 0);
  _Unwind_Resume(a1);
}

void QP::Formatter::setResultValue(QP::Formatter *this, const __CFString *a2, const void *a3)
{
  __CFDictionary *v3;

  if (a2 && a3)
  {
    v3 = (__CFDictionary *)*((_QWORD *)this + 7);
    if (v3)
      CFDictionarySetValue(v3, a2, a3);
  }
}

void QP::Formatter::updateParseWithAnyAttribute(uint64_t a1, uint64_t a2, QP::ParseAttribute **a3)
{
  QP::ParseAttribute *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  QP::ParseAttribute *v17;
  std::__shared_weak_count *v18;
  QP::ParseAttribute *v19;
  std::__shared_weak_count *v20;

  v6 = *a3;
  if (*((_BYTE *)*a3 + 72))
  {
LABEL_2:
    v7 = (std::__shared_weak_count *)a3[1];
    v17 = v6;
    v18 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t, uint64_t, QP::ParseAttribute **))(*(_QWORD *)a1 + 72))(a1, a2, &v17);
    v10 = v18;
    if (v18)
    {
      v11 = (unint64_t *)&v18->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
LABEL_19:
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
    return;
  }
  if (QP::ParseAttribute::flag(v6) != 1
    && QP::ParseAttribute::flag(*a3) != 2
    && QP::ParseAttribute::flag(*a3) != 3
    && QP::ParseAttribute::flag(*a3) != 4)
  {
    v6 = *a3;
    goto LABEL_2;
  }
  v13 = (std::__shared_weak_count *)a3[1];
  v19 = *a3;
  v20 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  (*(void (**)(uint64_t, uint64_t, QP::ParseAttribute **))(*(_QWORD *)a1 + 64))(a1, a2, &v19);
  v10 = v20;
  if (v20)
  {
    v16 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v16);
    while (__stlxr(v12 - 1, v16));
    goto LABEL_19;
  }
}

void sub_218E8EB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t QP::Formatter::setParse(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  const __CFAttributedString *v5;
  uint64_t v6;
  CFNumberRef v7;
  CFNumberRef v8;
  __CFDictionary *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  const __CFString **v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v25[6];
  std::__shared_weak_count *v26;
  const __CFString **v27;
  std::__shared_weak_count *v28;
  CFNumberRef v29;
  uint64_t valuePtr;
  CFRange v31;

  QP::Formatter::clear((const void **)a1);
  v4 = &stru_24DA27910;
  if (*(_QWORD *)a2 && **(_QWORD **)a2)
    v4 = **(const __CFString ***)a2;
  v5 = *(const __CFAttributedString **)(a1 + 72);
  v31.length = CFAttributedStringGetLength(v5);
  v31.location = 0;
  CFAttributedStringReplaceString(v5, v31, v4);
  if (*(_BYTE *)(*(_QWORD *)a2 + 81))
    return 1;
  valuePtr = *(_QWORD *)(*(_QWORD *)a2 + 48);
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCFIndexType, &valuePtr);
  v29 = v7;
  if (v7)
  {
    if (kQPParseResultTokenCountKey)
    {
      v8 = v7;
      v9 = *(__CFDictionary **)(a1 + 56);
      if (v9)
        CFDictionarySetValue(v9, kQPParseResultTokenCountKey, v8);
    }
  }
  v10 = *(std::__shared_weak_count **)(a2 + 8);
  v27 = *(const __CFString ***)a2;
  v28 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = (*(uint64_t (**)(uint64_t, const __CFString ***, CFNumberRef))(*(_QWORD *)a1 + 16))(a1, &v27, v8);
  v6 = v13;
  v14 = v28;
  if (!v28)
    goto LABEL_17;
  v15 = (unint64_t *)&v28->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    if ((v6 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((v13 & 1) != 0)
    {
LABEL_18:
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 1174405120;
      v25[2] = ___ZN2QP9Formatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke;
      v25[3] = &__block_descriptor_tmp_15;
      v17 = *(const __CFString ***)a2;
      v18 = *(std::__shared_weak_count **)(a2 + 8);
      v25[4] = a1;
      v25[5] = v17;
      v26 = v18;
      if (v18)
      {
        v19 = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      QP::Parse::enumerateParseAttributes((uint64_t)v17, (uint64_t)v25);
      v21 = v26;
      if (v26)
      {
        v22 = (unint64_t *)&v26->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
    }
  }
  if (v29)
    CFRelease(v29);
  return v6;
}

void sub_218E8ED20(_Unwind_Exception *a1)
{
  uint64_t v1;

  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)(v1 - 48), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_QWORD **)(a1 + 40);
  v7 = *a2;
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = v7;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v4 + 56))(v4, v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_218E8EDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void QP::Formatter::setSuggestionValue(QP::Formatter *this, const __CFString *a2, const void *a3)
{
  __CFDictionary *v3;

  if (a2 && a3)
  {
    v3 = (__CFDictionary *)*((_QWORD *)this + 8);
    if (v3)
      CFDictionarySetValue(v3, a2, a3);
  }
}

void QP::Formatter::updateParseWithAttribute(uint64_t *a1, uint64_t a2, CFRange **a3)
{
  CFRange *v6;
  std::__shared_weak_count *location;
  uint64_t v8;
  CFRange *v9;
  CFRange *v10;
  uint64_t v11;
  unint64_t *p_length;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  CFIndex Count;
  const __CFString *CFStringFromString;
  const void *ValueAtIndex;
  _QWORD v23[9];
  std::__shared_weak_count *v24;
  const __CFString *v25;
  const __CFString **v26;
  uint64_t v27;
  __n128 (*v28)(uint64_t, uint64_t);
  uint64_t (*v29)(uint64_t);
  CFIndex length;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  CFMutableArrayRef Mutable;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3002000000;
  v35 = __Block_byref_object_copy__14;
  v36 = __Block_byref_object_dispose__14;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (QP::ParserGrammar::hasTranslations(a1[3], (uint64_t)&(*a3)[3]))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3802000000;
    v28 = __Block_byref_object_copy__78;
    v29 = __Block_byref_object_dispose__79;
    v6 = *a3;
    length = 0;
    v31 = 0;
    location = (std::__shared_weak_count *)v6[7].location;
    if (location)
    {
      v31 = std::__shared_weak_count::lock(location);
      if (v31)
        length = v6[6].length;
    }
    if (v26[5])
    {
      v8 = a1[3];
      v23[0] = MEMORY[0x24BDAC760];
      v23[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke;
      v23[3] = &unk_24DA27168;
      v23[4] = &v25;
      v23[5] = &v32;
      v10 = *a3;
      v9 = a3[1];
      v11 = (uint64_t)&(*a3)[3];
      v23[1] = 1174405120;
      v23[6] = a1;
      v23[7] = a2;
      v23[8] = v10;
      v24 = (std::__shared_weak_count *)v9;
      if (v9)
      {
        p_length = (unint64_t *)&v9->length;
        do
          v13 = __ldxr(p_length);
        while (__stxr(v13 + 1, p_length));
      }
      QP::ParserGrammar::translations(v8, v11, (uint64_t)v23);
      v14 = v24;
      if (v24)
      {
        p_shared_owners = (unint64_t *)&v24->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
    _Block_object_dispose(&v25, 8);
    v17 = v31;
    if (v31)
    {
      v18 = (unint64_t *)&v31->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  Count = CFArrayGetCount((CFArrayRef)v33[5]);
  if (Count)
  {
    CFStringFromString = QP::createCFStringFromString((uint64_t)&(*a3)[3]);
    v25 = CFStringFromString;
    if (Count == 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v33[5], 0);
      QP::Formatter::setParseAttribute((QP::Formatter *)a1, CFStringFromString, ValueAtIndex, (*a3)[1]);
    }
    else
    {
      QP::Formatter::setParseAttribute((QP::Formatter *)a1, CFStringFromString, (CFTypeRef)v33[5], (*a3)[1]);
    }
    if (CFStringFromString)
      CFRelease(CFStringFromString);
  }
  _Block_object_dispose(&v32, 8);
  if (Mutable)
    CFRelease(Mutable);
}

void sub_218E8F0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  uint64_t v13;
  va_list va;

  va_start(va, a12);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v12 + 40), 0);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(a1 + 40), 0);
}

__n128 __Block_byref_object_copy__78(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__79(uint64_t a1)
{
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke(_QWORD *a1, const __CFString *a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  const __CFString *v14;
  CFMutableStringRef MutableCopy;
  _QWORD v16[6];
  _QWORD v17[6];
  CFRange v18;

  v4 = a1[6];
  v5 = QP::ParserGrammar::symbolID(*(_QWORD *)(v4 + 24), *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));
  if (CFStringContainsString(a2, CFSTR("%@u")))
  {
    if (QP::ParserGrammar::hasUTIs(*(QP::ParserGrammar **)(v4 + 24), v5))
    {
      v6 = *(_QWORD *)(v4 + 24);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 0x40000000;
      v17[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2;
      v17[3] = &unk_24DA27118;
      v17[4] = a1[5];
      v17[5] = a2;
      QP::ParserGrammar::UTIs(v6, v5, (uint64_t)v17);
    }
  }
  else if (CFStringContainsString(a2, CFSTR("%@e")))
  {
    if (QP::ParserGrammar::hasFileExtensions(*(QP::ParserGrammar **)(v4 + 24), v5))
    {
      v7 = *(_QWORD *)(v4 + 24);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 0x40000000;
      v16[2] = ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3;
      v16[3] = &unk_24DA27140;
      v16[4] = a1[5];
      v16[5] = a2;
      QP::ParserGrammar::fileExtensions(v7, v5, (uint64_t)v16);
    }
  }
  else
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a2);
    v9 = (const __CFString *)a1[7];
    v10 = a1[8];
    v11 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v10 + 112));
    v14 = CFStringCreateWithSubstring(v8, v9, *(CFRange *)(*(_QWORD *)(v10 + 104) + 72));
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    v18.length = CFStringGetLength(MutableCopy);
    v18.location = 0;
    CFStringFindAndReplace(MutableCopy, CFSTR("%@v"), v14, v18, 0);
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[5] + 8) + 40), MutableCopy);
    if (v14)
      CFRelease(v14);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
}

void sub_218E8F358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const void *a12)
{
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  nlp::CFScopedPtr<__CFString *>::reset(&a12, 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFMutableStringRef MutableCopy;
  const __CFString *CFStringFromString;
  CFRange v6;

  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)(a1 + 40));
  CFStringFromString = QP::createCFStringFromString(a2);
  v6.length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR("%@u"), CFStringFromString, v6, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), MutableCopy);
  if (CFStringFromString)
    CFRelease(CFStringFromString);
  if (MutableCopy)
    CFRelease(MutableCopy);
}

void sub_218E8F448(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP9Formatter24updateParseWithAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFMutableStringRef MutableCopy;
  const __CFString *CFStringFromString;
  CFRange v6;

  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)(a1 + 40));
  CFStringFromString = QP::createCFStringFromString(a2);
  v6.length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR("%@e"), CFStringFromString, v6, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), MutableCopy);
  if (CFStringFromString)
    CFRelease(CFStringFromString);
  if (MutableCopy)
    CFRelease(MutableCopy);
}

void sub_218E8F530(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_64c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(result + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(result + 72) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_64c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE(uint64_t a1)
{
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 64);
}

void QP::Formatter::updateParseWithDateAttribute(QP::Formatter *a1, uint64_t a2, CFRange **a3)
{
  const __CFAllocator *v5;
  CFMutableDictionaryRef Mutable;
  CFRange *v7;
  std::__shared_weak_count *location;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  CFIndex length;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  CFNumberRef v16;
  unint64_t *v17;
  unint64_t v18;
  CFDateFormatterRef *v19;
  unint64_t *v20;
  unint64_t v21;
  __CFString *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  __CFDictionary *v38;
  __CFDictionary *v39;
  __CFDictionary *v40;
  __CFString **v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  __CFDictionary *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  CFNumberRef v50;
  CFNumberRef v51;
  __CFDictionary *v52;
  unint64_t *v53;
  unint64_t v54;
  int v55;
  CFNumberRef v56;
  int v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  __CFDictionary *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  CFTypeRef cf;
  uint64_t v64;
  std::__shared_weak_count *v65;
  __CFDictionary *valuePtr;
  uint64_t v67;
  std::__shared_weak_count *v68;
  __CFString *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  CFIndex v72;
  std::__shared_weak_count *v73;
  __CFDictionary *v74;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v74 = Mutable;
  v7 = *a3;
  location = (std::__shared_weak_count *)(*a3)[7].location;
  if (!location)
    goto LABEL_86;
  v9 = std::__shared_weak_count::lock(location);
  if (!v9)
    goto LABEL_86;
  v10 = v9;
  length = v7[6].length;
  v72 = length;
  v73 = v9;
  if (length)
  {
    v12 = *(_QWORD *)(length + 120);
    v13 = *(std::__shared_weak_count **)(length + 128);
    v70 = v12;
    v71 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    if (!v12)
    {
LABEL_13:
      if (!v13)
        goto LABEL_81;
      goto LABEL_14;
    }
    if (BYTE1((*a3)[4].length))
    {
      LODWORD(valuePtr) = 5;
      v16 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
      v69 = (__CFString *)v16;
      if (v16)
        CFDictionarySetValue(Mutable, kQPParseAttributeValueDateTypeKey, v16);
      QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateExtensionKey, Mutable, (*a3)[1]);
      ++*((_QWORD *)a1 + 10);
      if (v16)
        CFRelease(v16);
      goto LABEL_13;
    }
    v19 = (CFDateFormatterRef *)*((_QWORD *)a1 + 5);
    v67 = v12;
    v68 = v13;
    if (v13)
    {
      v20 = (unint64_t *)&v13->__shared_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v22 = QP::DateFormatter::copyDisplayForDate(v19, &v67, 0, 0);
    v69 = v22;
    v23 = v68;
    if (v68)
    {
      v24 = (unint64_t *)&v68->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      v22 = v69;
    }
    if (v22)
      CFDictionarySetValue(v74, kQPParseAttributeValueDateDisplayKey, v22);
    v26 = (_QWORD *)*((_QWORD *)a1 + 5);
    v64 = v70;
    v65 = v71;
    if (v71)
    {
      v27 = (unint64_t *)&v71->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    valuePtr = QP::DateFormatter::copyStartComponentsForDate(v26, &v64);
    v29 = v65;
    if (v65)
    {
      v30 = (unint64_t *)&v65->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = (_QWORD *)*((_QWORD *)a1 + 5);
    v61 = v70;
    v62 = v71;
    if (v71)
    {
      v33 = (unint64_t *)&v71->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    cf = QP::DateFormatter::copyEndComponentsForDate(v32, &v61);
    v35 = v62;
    if (v62)
    {
      v36 = (unint64_t *)&v62->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    v38 = valuePtr;
    v39 = (__CFDictionary *)cf;
    if (valuePtr)
    {
      v40 = v74;
      if (!cf)
      {
        v41 = &kQPParseAttributeValueDateComponentsKey;
        goto LABEL_52;
      }
      CFDictionarySetValue(v74, kQPParseAttributeValueDateStartComponentsKey, valuePtr);
      v41 = &kQPParseAttributeValueDateEndComponentsKey;
    }
    else
    {
      if (!cf)
        goto LABEL_53;
      v41 = &kQPParseAttributeValueDateComponentsKey;
      v40 = v74;
    }
    v38 = v39;
LABEL_52:
    CFDictionarySetValue(v40, *v41, v38);
LABEL_53:
    v42 = *((_QWORD *)a1 + 5);
    v58 = v70;
    v59 = v71;
    if (v71)
    {
      v43 = (unint64_t *)&v71->__shared_owners_;
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
    }
    v45 = QP::DateFormatter::copyFreqComponentsForDate(v42, (uint64_t)&v58);
    v60 = v45;
    v46 = v59;
    if (v59)
    {
      v47 = (unint64_t *)&v59->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
      v45 = v60;
    }
    if (v45)
      CFDictionarySetValue(v74, kQPParseAttributeValueDateFrequencyComponentsKey, v45);
    v49 = v70;
    v57 = *(_DWORD *)(v70 + 8);
    v50 = CFNumberCreate(v5, kCFNumberIntType, &v57);
    v56 = v50;
    if (v50)
      CFDictionarySetValue(v74, kQPParseAttributeValueDateTypeKey, v50);
    v55 = *(_DWORD *)(v49 + 16);
    v51 = CFNumberCreate(v5, kCFNumberIntType, &v55);
    v52 = v74;
    if (v51)
      CFDictionarySetValue(v74, kQPParseAttributeValueDateTemporalModifierKey, v51);
    QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateKey, v52, (*a3)[1]);
    ++*((_QWORD *)a1 + 10);
    if (v51)
      CFRelease(v51);
    if (v50)
      CFRelease(v50);
    if (v45)
      CFRelease(v45);
    if (cf)
      CFRelease(cf);
    if (valuePtr)
      CFRelease(valuePtr);
    if (v69)
      CFRelease(v69);
    v13 = v71;
    if (!v71)
    {
LABEL_81:
      v10 = v73;
      if (!v73)
        goto LABEL_86;
      goto LABEL_82;
    }
LABEL_14:
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    goto LABEL_81;
  }
LABEL_82:
  v53 = (unint64_t *)&v10->__shared_owners_;
  do
    v54 = __ldaxr(v53);
  while (__stlxr(v54 - 1, v53));
  if (!v54)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
LABEL_86:
  if (v74)
    CFRelease(v74);
}

void sub_218E8FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  const void *v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  va_list va1;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  va_list va2;
  uint64_t v17;
  uint64_t v18;
  va_list va3;

  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, const void *);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v11 = va_arg(va2, const void *);
  v13 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  va_copy(va3, va2);
  v15 = va_arg(va3, const void *);
  v17 = va_arg(va3, _QWORD);
  v18 = va_arg(va3, _QWORD);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v4 - 96), 0);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v4 - 88);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v4 - 72);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)(v4 - 56), 0);
  _Unwind_Resume(a1);
}

CFStringRef QP::Formatter::copyDisplayStringWithStartAndEndDateForRange(QP::DateFormatter **this, const __CFString *a2, const __CFDictionary *a3, const __CFString *a4, const __CFDictionary *a5)
{
  return QP::DateFormatter::copyDisplayStringWithStartAndEndDateForRange(this[5], a2, a3, a4, a5);
}

QP::ParserConfiguration *QP::ParserConfiguration::ParserConfiguration(QP::ParserConfiguration *this, const __CFDictionary *a2)
{
  _QWORD *v4;
  char *v5;
  BOOL *v6;
  _DWORD *v7;
  uint64_t *v8;
  const void **v9;
  const __CFLocale *Value;
  const __CFArray *v11;
  const __CFArray *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const __CFDate *v16;
  const __CFString *v17;
  const void *v18;
  CFTypeRef v19;
  const void *v20;
  CFTypeRef v21;
  const __CFNumber *v22;
  int v23;
  const void **v24;
  BOOL v25;
  const __CFURL *v26;
  const __CFURL *v27;
  const __CFString *v28;
  CFURLRef v29;
  const void *v30;
  CFTypeRef v31;
  const __CFDictionary *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  const void *v41;
  const void *v42;
  const void *v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const __CFNumber *v50;
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  const __CFString *v53;
  __CFDictionary *Mutable;
  const void *v55;
  CFTypeRef v56;
  CFStringRef v57;
  const __CFLocale *v58;
  const __CFArray *v59;
  const __CFString *v60;
  const __CFString *v61;
  const void **v63;
  const void **v64;
  const void **v65;
  const void **v66;
  const void **v67;
  uint64_t *v68;
  _QWORD *v69;
  const void **v70;

  *(_QWORD *)this = &unk_24DA27258;
  *((_QWORD *)this + 1) = 0;
  v4 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v5 = (char *)this + 16;
  *(_DWORD *)((char *)this + 26) = 0;
  v6 = (BOOL *)this + 26;
  *((_WORD *)this + 12) = 256;
  *((_BYTE *)this + 30) = 0;
  *(_DWORD *)((char *)this + 31) = 65537;
  *((_WORD *)this + 18) = 0;
  *((_QWORD *)this + 5) = 0;
  v7 = (_DWORD *)((char *)this + 40);
  *((_WORD *)this + 25) = 0;
  *(_WORD *)((char *)this + 53) = 0;
  *((_BYTE *)this + 63) = 0;
  *((_BYTE *)this + 48) = 0;
  *((_WORD *)this + 32) = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  v69 = (_QWORD *)((char *)this + 88);
  *(_OWORD *)((char *)this + 104) = 0u;
  v8 = (uint64_t *)((char *)this + 104);
  *(_OWORD *)((char *)this + 168) = 0u;
  v66 = (const void **)((char *)this + 168);
  v70 = (const void **)((char *)this + 176);
  *(_OWORD *)((char *)this + 184) = 0u;
  v9 = (const void **)((char *)this + 184);
  v67 = (const void **)((char *)this + 192);
  v68 = (uint64_t *)((char *)this + 160);
  *(_OWORD *)((char *)this + 216) = 0u;
  v63 = (const void **)((char *)this + 216);
  *((_QWORD *)this + 29) = 0;
  v64 = (const void **)((char *)this + 232);
  v65 = (const void **)((char *)this + 208);
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_QWORD *)this + 30) = (char *)this + 240;
  *((_QWORD *)this + 31) = (char *)this + 240;
  *((_QWORD *)this + 32) = 0;
  QP::ParserConfiguration::updateCalendar(this);
  if (a2)
  {
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionLocaleKey))
    {
      Value = (const __CFLocale *)CFDictionaryGetValue(a2, kQPQueryParserOptionLocaleKey);
      if (CFDictionaryContainsKey(a2, kQPQueryParserOptionPreferredLanguagesKey))
      {
        v11 = (const __CFArray *)CFDictionaryGetValue(a2, kQPQueryParserOptionPreferredLanguagesKey);
        QP::ParserConfiguration::setLocale(this, Value, v11);
      }
      else
      {
        v12 = CFLocaleCopyPreferredLanguages();
        QP::ParserConfiguration::setLocale(this, Value, v12);
        if (v12)
          CFRelease(v12);
      }
      *((_BYTE *)this + 32) = 0;
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceCalendarRegionKey))
    {
      v13 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceCalendarRegionKey);
      QP::ParserConfiguration::setCalendarRegion((const void **)this, v13);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceTimezoneKey))
    {
      v14 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceTimezoneKey);
      QP::ParserConfiguration::setCustomTimezone((const void **)this, v14);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceCalendarKey))
    {
      v15 = CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceCalendarKey);
      QP::ParserConfiguration::setCustomCalendar((const void **)this, v15);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionReferenceDateKey))
    {
      v16 = (const __CFDate *)CFDictionaryGetValue(a2, kQPQueryParserOptionReferenceDateKey);
      QP::ParserConfiguration::setDate(this, v16);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionContextIdentifierKey))
    {
      v17 = (const __CFString *)CFDictionaryGetValue(a2, kQPQueryParserOptionContextIdentifierKey);
      QP::ParserConfiguration::setAppContext(this, v17);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionBundleIdentifierKey))
    {
      v18 = CFDictionaryGetValue(a2, kQPQueryParserOptionBundleIdentifierKey);
      v19 = CFRetain(v18);
      nlp::CFScopedPtr<__CFString const*>::reset(v9, v19);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionInternalBundleIdentifierKey))
    {
      v20 = CFDictionaryGetValue(a2, kQPQueryParserOptionInternalBundleIdentifierKey);
      v21 = CFRetain(v20);
      nlp::CFScopedPtr<__CFString const*>::reset(v67, v21);
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionFormatKey))
    {
      v22 = (const __CFNumber *)CFDictionaryGetValue(a2, kQPQueryParserOptionFormatKey);
      CFNumberGetValue(v22, kCFNumberCFIndexType, v5);
    }
    v23 = CFDictionaryContainsKey(a2, kQPQueryParserOptionIncludeRankCategoriesKey);
    v24 = (const void **)MEMORY[0x24BDBD270];
    if (v23)
      *((_BYTE *)this + 21) = CFDictionaryGetValue(a2, kQPQueryParserOptionIncludeRankCategoriesKey) == *v24;
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreAttributedParsesKey))
      *((_BYTE *)this + 22) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreAttributedParsesKey);
    if (CFDictionaryContainsKey(a2, CFSTR("usePartOfSpeech")))
      *((_BYTE *)this + 29) = *v24 == CFDictionaryGetValue(a2, CFSTR("usePartOfSpeech"));
    if (CFDictionaryContainsKey(a2, CFSTR("waitForLoad")))
      *((_BYTE *)this + 34) = CFDictionaryGetValue(a2, CFSTR("waitForLoad")) == *v24;
    if (CFDictionaryContainsKey(a2, CFSTR("waitForGetUnderstanding")))
      *((_BYTE *)this + 35) = CFDictionaryGetValue(a2, CFSTR("waitForGetUnderstanding")) == *v24;
    if (CFDictionaryContainsKey(a2, CFSTR("forTesting")))
    {
      v25 = CFDictionaryGetValue(a2, CFSTR("forTesting")) == *v24;
      *((_BYTE *)this + 36) = v25;
      if (v25)
      {
        if (CFDictionaryContainsKey(a2, CFSTR("meContent")))
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (Mutable)
          {
            v55 = CFDictionaryGetValue(a2, CFSTR("meContent"));
            CFDictionarySetValue(Mutable, CFSTR("meContent"), v55);
            if (CFDictionaryGetCount(Mutable))
            {
              v56 = CFRetain(Mutable);
              nlp::CFScopedPtr<__CFDictionary const*>::reset(v63, v56);
            }
            CFRelease(Mutable);
          }
        }
      }
    }
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreFutureDatesKey))
      *((_BYTE *)this + 23) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreFutureDatesKey);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnorePastDatesKey))
      *((_BYTE *)this + 24) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnorePastDatesKey);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreRecurringDatesKey))
      *((_BYTE *)this + 25) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreRecurringDatesKey);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveDatesInFutureKey))
      *v6 = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveDatesInFutureKey);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveDatesInPastKey))
      *((_BYTE *)this + 27) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveDatesInPastKey);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionResolveConcreteDatesKey))
      *((_BYTE *)this + 28) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionResolveConcreteDatesKey);
    v26 = (const __CFURL *)CFDictionaryGetValue(a2, kQPQueryParserOptionCustomResourceDirectoryKey);
    if (v26)
    {
      v27 = CFURLCopyAbsoluteURL(v26);
      v28 = CFURLCopyFileSystemPath(v27, kCFURLPOSIXPathStyle);
      v29 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v28, kCFURLPOSIXPathStyle, 1u);
      nlp::CFScopedPtr<__CFURL const*>::reset(v66, v29);
      if (v28)
        CFRelease(v28);
      if (v27)
        CFRelease(v27);
    }
    v30 = CFDictionaryGetValue(a2, CFSTR("username"));
    if (v30)
    {
      v31 = CFRetain(v30);
      nlp::CFScopedPtr<__CFString const*>::reset(v65, v31);
    }
    v32 = (const __CFDictionary *)CFDictionaryGetValue(a2, kQPQueryParserOptionCustomFieldSpecifications);
    QP::ParserConfiguration::setCustomFieldSpecifications(this, v32, 0);
    if (CFDictionaryContainsKey(a2, kQPQueryParserOptionIgnoreSingleYearSuggestionKey))
      *((_BYTE *)this + 37) = *v24 == CFDictionaryGetValue(a2, kQPQueryParserOptionIgnoreSingleYearSuggestionKey);
    v33 = CFDictionaryGetValue(a2, kQPQueryParserOptionPrivateParsingKey);
    if (v33)
      *((_BYTE *)this + 49) = *v24 == v33;
    v34 = CFDictionaryGetValue(a2, kQPQueryParserOptionEmbeddingsEnabledKey);
    if (v34)
      *((_BYTE *)this + 50) = *v24 == v34;
    v35 = CFDictionaryGetValue(a2, CFSTR("loadAnnotations"));
    if (v35)
      *((_BYTE *)this + 52) = *v24 == v35;
    v36 = CFDictionaryGetValue(a2, kQPQueryParserOptionU2EnabledKey);
    if (v36)
      *((_BYTE *)this + 53) = *v24 == v36;
    v37 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseLLMParseKey);
    if (v37)
      *((_BYTE *)this + 54) = *v24 == v37;
    v38 = CFDictionaryGetValue(a2, CFSTR("forcePeopleSpans"));
    if (v38)
      nlp::CFScopedPtr<__CFArray const*>::acquire(v64, v38);
    v39 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseECRInProcessKey);
    if (v39)
      *((_BYTE *)this + 55) = *v24 == v39;
    v40 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseECRForSpansKey);
    if (v40)
      *((_BYTE *)this + 56) = *v24 == v40;
    v41 = CFDictionaryGetValue(a2, CFSTR("useECRForInferredNames"));
    if (v41)
      *((_BYTE *)this + 57) = *v24 == v41;
    v42 = CFDictionaryGetValue(a2, CFSTR("useECRForPets"));
    if (v42)
      *((_BYTE *)this + 58) = *v24 == v42;
    v43 = CFDictionaryGetValue(a2, CFSTR("useAggressiveECRPersonOverrides"));
    if (v43)
      *((_BYTE *)this + 59) = *v24 == v43;
    v44 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseU2InSpotlightResourcesKey);
    if (v44)
      *((_BYTE *)this + 64) = *v24 == v44;
    v45 = CFDictionaryGetValue(a2, kQPQueryParserOptionIsEntitySearchKey);
    v46 = CFDictionaryGetValue(a2, kQPQueryParserOptionEnableEntitySearchStemming);
    v47 = CFDictionaryGetValue(a2, kQPQueryParserOptionEnableEntitySearchSpellCorrect);
    if (v45)
    {
      v48 = *v24;
      *((_BYTE *)this + 60) = *v24 == v45;
      *((_BYTE *)this + 61) = v48 == v46;
      *((_BYTE *)this + 62) = v48 == v47;
    }
    v49 = CFDictionaryGetValue(a2, kQPQueryParserOptionUseLexemeSubEntitiesKey);
    if (v49)
      *((_BYTE *)this + 65) = *v24 == v49;
    v50 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("kMDQueryOptionEmbeddingGenerationTimeout"));
    if (v50)
      CFNumberGetValue(v50, kCFNumberIntType, (char *)this + 44);
  }
  if (!*v9)
  {
    MainBundle = CFBundleGetMainBundle();
    Identifier = CFBundleGetIdentifier(MainBundle);
    if (Identifier)
      v53 = (const __CFString *)CFRetain(Identifier);
    else
      v53 = CFSTR("com.apple.spotlight.QueryParser");
    nlp::CFScopedPtr<__CFString const*>::reset(v9, v53);
  }
  if (!*v70)
  {
    v57 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@"), CFSTR("com.apple.query.parser"));
    nlp::CFScopedPtr<__CFString const*>::reset(v70, v57);
  }
  systemListenerEnableForceLoadingAssets(*((unsigned __int8 *)this + 34));
  if (*v8)
  {
    systemListenerSetLocale(*v8, *v68);
  }
  else
  {
    *((_BYTE *)this + 32) = 1;
    v58 = copyCurrentLocale();
    v59 = copyCurrentPreferredLanguages();
    systemListenerEnableAutoUpdatingLocale(1);
    QP::ParserConfiguration::setLocale(this, v58, v59);
    if (v59)
      CFRelease(v59);
    if (v58)
      CFRelease(v58);
  }
  v60 = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v8, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  if (*v69)
    v61 = (const __CFString *)MEMORY[0x219A24388]();
  else
    v61 = 0;
  if (CFStringsAreEqual(v60, CFSTR("ja")) && v61 && CFStringsAreEqual(v61, CFSTR("japanese")))
    *((_BYTE *)this + 20) = 1;
  if (*v4 == 9)
    *v7 = 1;
  QP::ParserConfiguration::updateCalendar(this);
  return this;
}

void sub_218E906F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13, const void **a14, const void **a15, const void **a16, const void **a17, const void **a18, const void **a19, const void **a20,const void **a21,const void **a22)
{
  const void **v22;
  const void **v23;
  const void **v24;
  uint64_t v25;

  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)(v25 - 88), 0);
  std::__list_imp<QP::Subscriber *>::clear(a13);
  nlp::CFScopedPtr<__CFArray const*>::reset(a16, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(v23 + 28, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(a15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a17, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(v23 + 25, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v24, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(a22, 0);
  nlp::CFScopedPtr<__CFURL const*>::reset(a18, 0);
  nlp::CFScopedPtr<__CFArray const*>::reset(a20, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 18, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 17, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 16, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v23 + 14, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset(v22, 0);
  nlp::CFScopedPtr<__CFTimeZone const*>::reset(v23 + 12, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset(a21, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset(v23 + 10, 0);
  nlp::CFScopedPtr<__CFDate const*>::reset(a14, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::updateCalendar(QP::ParserConfiguration *this)
{
  const void **v2;
  __CFCalendar *v3;
  __CFCalendar *v4;
  const void **v5;
  __CFCalendar *v6;
  __CFCalendar *v7;
  const __CFString *v8;
  const __CFLocale *v9;
  __CFCalendar *v10;
  const __CFLocale *v11;

  v2 = (const void **)((char *)this + 80);
  if (!*((_QWORD *)this + 10))
  {
    v3 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFCalendarIdentifier)*MEMORY[0x24BDBD3B8]);
    if (v3)
    {
      v4 = v3;
      CFCalendarSetFirstWeekday(v3, 1);
      v5 = v2;
      v6 = v4;
    }
    else
    {
      v6 = copyCurrentCalendar(*((const __CFLocale **)this + 13), 0);
      v5 = v2;
    }
    nlp::CFScopedPtr<__CFCalendar *>::reset(v5, v6);
  }
  v7 = (__CFCalendar *)*((_QWORD *)this + 11);
  if (v7)
  {
    v8 = (const __CFString *)*((_QWORD *)this + 14);
    if (v8)
    {
      v9 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8);
      CFCalendarSetLocale(*((CFCalendarRef *)this + 11), v9);
      CFRelease(v9);
    }
    else
    {
      v11 = (const __CFLocale *)*((_QWORD *)this + 13);
      if (v11)
        CFCalendarSetLocale(v7, v11);
    }
  }
  else
  {
    v10 = copyCurrentCalendar(*((const __CFLocale **)this + 13), *((const __CFString **)this + 14));
    nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 11, v10);
  }
  QP::ParserConfiguration::setDate(this, *((CFDateRef *)this + 9));
}

uint64_t QP::ParserConfiguration::setLocale(QP::ParserConfiguration *this, const __CFLocale *a2, const __CFArray *a3)
{
  uint64_t v6;
  const void **v7;
  CFTypeRef v9;
  CFAllocatorRef *v10;
  const __CFAllocator *v11;
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v14;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFStringRef Copy;
  const __CFString *Value;
  CFTypeRef v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFLocale *v22;
  BOOL v23;
  const __CFAllocator *v24;
  CFStringRef v25;
  CFStringRef v26;
  const void **v27;
  const __CFAllocator *v28;
  CFStringRef v29;
  CFStringRef v30;
  CFStringRef v31;
  CFStringRef v32;

  v7 = (const void **)((char *)this + 104);
  v6 = *((_QWORD *)this + 13);
  if (a2 && v6)
  {
    if (CFLocalesAreEqual(v6, a2))
      return 0;
    nlp::CFScopedPtr<__CFLocale const*>::reset(v7, 0);
    goto LABEL_8;
  }
  nlp::CFScopedPtr<__CFLocale const*>::reset(v7, 0);
  if (a2)
  {
LABEL_8:
    v9 = CFRetain(a2);
    nlp::CFScopedPtr<__CFLocale const*>::reset(v7, v9);
    QP::ParserConfiguration::updateCalendar(this);
  }
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, 0);
  v10 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a3)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      v14 = Count;
      for (i = 0; i != v14; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, i);
        Copy = CFStringCreateCopy(v11, ValueAtIndex);
        CFArrayAppendValue(Mutable, Copy);
        if (Copy)
          CFRelease(Copy);
      }
    }
    nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, Mutable);
  }
  Value = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v19 = CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x24BDBD420]);
  v20 = (const __CFString *)*MEMORY[0x24BDBD3D8];
  v21 = (const __CFString *)CFLocaleGetValue((CFLocaleRef)*v7, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
  if (!v21)
  {
    v22 = CFLocaleCopyCurrent();
    v21 = (const __CFString *)CFLocaleGetValue(v22, v20);
    if (v22)
      CFRelease(v22);
  }
  if (Value)
    v23 = v19 == 0;
  else
    v23 = 1;
  if (!v23)
  {
    v28 = *v10;
    v29 = CFStringCreateWithFormat(*v10, 0, CFSTR("%@_%@"), Value, v19);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 18, v29);
    v30 = CFStringCreateWithFormat(v28, 0, CFSTR("%@-%@"), Value, v19);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, v30);
    if (!v21)
      return 1;
    v31 = CFStringCreateWithFormat(v28, 0, CFSTR("%@_%@_%@"), Value, v19, v21);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 19, v31);
    v26 = CFStringCreateWithFormat(v28, 0, CFSTR("%@-%@_%@"), Value, v19, v21);
    v27 = (const void **)((char *)this + 136);
    goto LABEL_29;
  }
  if (!Value)
  {
    if (!v21)
      return 1;
    goto LABEL_30;
  }
  v24 = *v10;
  v25 = CFStringCreateCopy(*v10, Value);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, v25);
  if (v21)
  {
    v26 = CFStringCreateWithFormat(v24, 0, CFSTR("%@_%@"), Value, v21);
    v27 = (const void **)((char *)this + 136);
LABEL_29:
    nlp::CFScopedPtr<__CFString const*>::reset(v27, v26);
LABEL_30:
    v32 = CFStringCreateCopy(*v10, v21);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 15, v32);
  }
  return 1;
}

void sub_218E90D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::setCalendarRegion(const void **this, CFTypeRef cf)
{
  if (cf)
    cf = CFRetain(cf);
  nlp::CFScopedPtr<__CFString const*>::reset(this + 14, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setCustomTimezone(const void **this, CFTypeRef cf)
{
  if (cf)
    cf = CFRetain(cf);
  nlp::CFScopedPtr<__CFTimeZone const*>::reset(this + 12, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setCustomCalendar(const void **this, CFTypeRef cf)
{
  if (cf)
    cf = CFRetain(cf);
  nlp::CFScopedPtr<__CFCalendar *>::reset(this + 11, cf);
  QP::ParserConfiguration::updateCalendar((QP::ParserConfiguration *)this);
}

void QP::ParserConfiguration::setDate(QP::ParserConfiguration *this, CFDateRef otherDate)
{
  const __CFDate *v4;
  const void **v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFAllocator *v8;
  __CFCalendar *v9;
  __CFCalendar *v10;
  const __CFTimeZone *v11;
  const __CFTimeZone *v12;
  CFDateRef v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  CFAbsoluteTime at[2];

  v5 = (const void **)((char *)this + 72);
  v4 = (const __CFDate *)*((_QWORD *)this + 9);
  if (!otherDate || !v4 || CFDateCompare(v4, otherDate, 0))
  {
    nlp::CFScopedPtr<__CFDate const*>::reset(v5, 0);
    v6 = *((_QWORD *)this + 11);
    if (v6)
    {
      if (!otherDate)
        return;
    }
    else
    {
      v6 = *((_QWORD *)this + 10);
      if (!otherDate)
        return;
    }
    if (v6)
    {
      v7 = (const __CFString *)MEMORY[0x219A24388]();
      v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v9 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
      v10 = v9;
      *(_QWORD *)&at[1] = v9;
      v11 = (const __CFTimeZone *)*((_QWORD *)this + 12);
      if (v11)
      {
        CFCalendarSetTimeZone(v9, v11);
      }
      else
      {
        v12 = CFTimeZoneCopyDefault();
        *(_QWORD *)&at[0] = v12;
        CFCalendarSetTimeZone(v10, v12);
        if (v12)
          CFRelease(v12);
      }
      at[0] = MEMORY[0x219A2446C](otherDate);
      v19 = -1;
      v17 = -1;
      v18 = -1;
      v15 = -1;
      v16 = -1;
      v14 = -1;
      CFCalendarDecomposeAbsoluteTime(v10, at[0], "dMyHms", &v19, &v18, &v17, &v16, &v15, &v14);
      CFCalendarComposeAbsoluteTime(*((CFCalendarRef *)this + 10), at, "dMyHms", v19, v18, v17, v16, v15, v14);
      v13 = CFDateCreate(v8, at[0]);
      nlp::CFScopedPtr<__CFDate const*>::reset(v5, v13);
      if (v10)
        CFRelease(v10);
    }
  }
}

void sub_218E90FB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  nlp::CFScopedPtr<__CFTimeZone const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

BOOL QP::ParserConfiguration::setAppContext(QP::ParserConfiguration *this, CFStringRef theString)
{
  CFMutableStringRef MutableCopy;
  _BOOL8 v4;
  uint64_t v5;
  const void **v6;
  const __CFString *v7;
  CFComparisonResult v9;
  uint64_t v10;

  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theString);
  CFStringLowercase(MutableCopy, 0);
  if (CFStringCompare(MutableCopy, CFSTR("com.apple.mail"), 1uLL)
    && CFStringCompare(MutableCopy, CFSTR("com.apple.mobilemail"), 1uLL))
  {
    if (CFStringCompare(MutableCopy, CFSTR("com.apple.notes"), 1uLL)
      && CFStringCompare(MutableCopy, CFSTR("com.apple.mobilenotes"), 1uLL))
    {
      if (CFStringCompare(MutableCopy, CFSTR("com.apple.calendar"), 1uLL)
        && CFStringCompare(MutableCopy, CFSTR("com.apple.calendarui"), 1uLL)
        && CFStringCompare(MutableCopy, CFSTR("com.apple.ical.calendarquerygenius"), 1uLL)
        && CFStringCompare(MutableCopy, CFSTR("com.apple.ical"), 1uLL)
        && CFStringCompare(MutableCopy, CFSTR("com.apple.mobilecal"), 1uLL))
      {
        if (CFStringCompare(MutableCopy, CFSTR("com.apple.finder"), 1uLL)
          && CFStringCompare(MutableCopy, CFSTR("com.apple.documentsapp"), 1uLL))
        {
          if (CFStringCompare(MutableCopy, CFSTR("com.apple.safari"), 1uLL))
          {
            if (CFStringCompare(MutableCopy, CFSTR("com.apple.spotlight"), 1uLL)
              && CFStringCompare(MutableCopy, CFSTR("com.apple.searchd"), 1uLL)
              && CFStringCompare(MutableCopy, CFSTR("com.apple.pommesctl"), 1uLL)
              && !CFStringHasPrefix(MutableCopy, CFSTR("com.apple.omniSearch"))
              && !CFStringHasPrefix(MutableCopy, CFSTR("com.apple.intelligenceflow"))
              && !CFStringHasPrefix(MutableCopy, CFSTR("com.apple.ondeviceeval")))
            {
              if (CFStringCompare(MutableCopy, CFSTR("com.apple.photos"), 1uLL)
                && CFStringCompare(MutableCopy, CFSTR("com.apple.mobileslideshow"), 1uLL))
              {
                if (CFStringCompare(MutableCopy, CFSTR("com.apple.reminders.parser"), 1uLL))
                {
                  if (CFStringCompare(MutableCopy, CFSTR("com.apple.reminders"), 1uLL))
                  {
                    if (CFStringCompare(MutableCopy, CFSTR("com.apple.queryparser"), 1uLL)
                      && CFStringCompare(MutableCopy, CFSTR("com.apple.query.parser"), 1uLL))
                    {
                      if (CFStringCompare(MutableCopy, CFSTR("com.apple.query.search"), 1uLL))
                      {
                        v9 = CFStringCompare(MutableCopy, CFSTR("com.apple.visual-generation"), 1uLL);
                        v10 = *((_QWORD *)this + 1);
                        v6 = (const void **)((char *)this + 176);
                        if (v9)
                        {
                          v4 = v10 != 0;
                          *((_QWORD *)this + 1) = 0;
                          v7 = CFSTR("com.apple.query.default");
                        }
                        else
                        {
                          v4 = v10 != 13;
                          *((_QWORD *)this + 1) = 13;
                          v7 = CFSTR("com.apple.visual-generation");
                        }
                      }
                      else
                      {
                        v4 = *((_QWORD *)this + 1) != 8;
                        *((_QWORD *)this + 1) = 8;
                        v6 = (const void **)((char *)this + 176);
                        v7 = CFSTR("com.apple.query.search");
                      }
                    }
                    else
                    {
                      v4 = *((_QWORD *)this + 1) != 0;
                      *((_QWORD *)this + 1) = 0;
                      v6 = (const void **)((char *)this + 176);
                      v7 = CFSTR("com.apple.query.parser");
                    }
                  }
                  else
                  {
                    v4 = *((_QWORD *)this + 1) != 11;
                    *((_QWORD *)this + 1) = 11;
                    v6 = (const void **)((char *)this + 176);
                    v7 = CFSTR("com.apple.reminders");
                  }
                }
                else
                {
                  v4 = *((_QWORD *)this + 1) != 12;
                  *((_QWORD *)this + 1) = 12;
                  v6 = (const void **)((char *)this + 176);
                  v7 = CFSTR("com.apple.reminders.parser");
                }
              }
              else
              {
                v4 = *((_QWORD *)this + 1) != 9;
                *((_QWORD *)this + 1) = 9;
                v6 = (const void **)((char *)this + 176);
                v7 = CFSTR("com.apple.photos");
              }
              goto LABEL_23;
            }
            v4 = *((_QWORD *)this + 1) != 7;
            v5 = 7;
          }
          else
          {
            v4 = *((_QWORD *)this + 1) != 5;
            v5 = 5;
          }
        }
        else
        {
          v4 = *((_QWORD *)this + 1) != 4;
          v5 = 4;
        }
        *((_QWORD *)this + 1) = v5;
        v6 = (const void **)((char *)this + 176);
        v7 = CFSTR("com.apple.spotlight");
      }
      else
      {
        v4 = *((_QWORD *)this + 1) != 6;
        *((_QWORD *)this + 1) = 6;
        v6 = (const void **)((char *)this + 176);
        v7 = CFSTR("com.apple.calendar");
      }
    }
    else
    {
      v4 = *((_QWORD *)this + 1) != 3;
      *((_QWORD *)this + 1) = 3;
      v6 = (const void **)((char *)this + 176);
      v7 = CFSTR("com.apple.notes");
    }
  }
  else
  {
    v4 = *((_QWORD *)this + 1) != 2;
    *((_QWORD *)this + 1) = 2;
    v6 = (const void **)((char *)this + 176);
    v7 = CFSTR("com.apple.mail");
  }
LABEL_23:
  nlp::CFScopedPtr<__CFString const*>::reset(v6, v7);
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v4;
}

void sub_218E91464(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t QP::ParserConfiguration::setIgnoreAttributedParses(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 22) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setUsePartOfSpeech(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 29) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnoreFutureDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 23) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnorePastDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 24) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setIgnoreRecurringDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 25) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolvePastDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 26) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolveFutureDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 27) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setResolveConcreteDates(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 28) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

BOOL QP::ParserConfiguration::setCustomFieldSpecifications(QP::ParserConfiguration *this, const __CFDictionary *a2, int a3)
{
  const __CFDictionary *v5;
  CFDictionaryRef *v6;
  CFIndex Count;
  CFIndex v9;
  unint64_t v10;
  CFTypeRef *v11;
  size_t v12;
  uint64_t v13;
  CFTypeRef *v14;
  uint64_t v15;
  CFTypeRef *v16;
  uint64_t v17;
  CFTypeRef *v18;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  CFTypeID v22;
  _BOOL8 v23;
  const __CFAllocator *v24;
  __CFDictionary *Mutable;
  CFIndex v26;
  unint64_t v27;
  const void **v28;
  size_t v29;
  CFMutableStringRef MutableCopy;
  const __CFDictionary *Value;
  __CFDictionary *v32;
  CFStringRef Copy;
  CFTypeRef v34;
  uint64_t v36;
  int v37;
  CFMutableStringRef v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (CFDictionaryRef *)((char *)this + 224);
  v5 = (const __CFDictionary *)*((_QWORD *)this + 28);
  if (a2)
  {
    if (v5)
    {
      Count = CFDictionaryGetCount(v5);
      v9 = CFDictionaryGetCount(a2);
      if (Count != v9)
        return 0;
      v37 = a3;
      v36 = (uint64_t)&v36;
      MEMORY[0x24BDAC7A8](v9);
      v10 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
      v11 = (CFTypeRef *)((char *)&v36 - v10);
      v12 = (unint64_t)(8 * Count) >= 0x200 ? 512 : 8 * Count;
      bzero((char *)&v36 - v10, v12);
      MEMORY[0x24BDAC7A8](v13);
      v14 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      CFDictionaryGetKeysAndValues(*v6, (const void **)((char *)&v36 - v10), (const void **)((char *)&v36 - v10));
      MEMORY[0x24BDAC7A8](v15);
      v16 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      MEMORY[0x24BDAC7A8](v17);
      v18 = (CFTypeRef *)((char *)&v36 - v10);
      bzero((char *)&v36 - v10, v12);
      CFDictionaryGetKeysAndValues(a2, (const void **)((char *)&v36 - v10), (const void **)((char *)&v36 - v10));
      if (Count < 1)
        return 0;
      while (1)
      {
        v19 = CFGetTypeID(*v11);
        if (v19 != CFStringGetTypeID())
          break;
        v20 = CFGetTypeID(*v16);
        if (v20 != CFStringGetTypeID())
          break;
        v21 = CFGetTypeID(*v14);
        if (v21 != CFDictionaryGetTypeID())
          break;
        v22 = CFGetTypeID(*v18);
        if (v22 != CFDictionaryGetTypeID()
          || !CFStringsAreEqual((CFStringRef)*v11, (const __CFString *)*v16)
          || CFEqual(*v18, *v14))
        {
          break;
        }
        ++v18;
        ++v14;
        ++v16;
        ++v11;
        if (!--Count)
          return 0;
      }
      a3 = v37;
    }
    v37 = a3;
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, 0);
    v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v26 = CFDictionaryGetCount(a2);
    v36 = (uint64_t)&v36;
    MEMORY[0x24BDAC7A8](v26);
    v28 = (const void **)((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v27 >= 0x200)
      v29 = 512;
    else
      v29 = v27;
    bzero((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
    CFDictionaryGetKeysAndValues(a2, v28, 0);
    if (v26 >= 1)
    {
      do
      {
        MutableCopy = CFStringCreateMutableCopy(v24, 0, (CFStringRef)*v28);
        v38 = MutableCopy;
        Value = (const __CFDictionary *)CFDictionaryGetValue(a2, MutableCopy);
        v32 = CFDictionaryCreateMutableCopy(v24, 0, Value);
        Copy = CFStringCreateCopy(v24, MutableCopy);
        CFDictionarySetValue(v32, CFSTR("ORIGINAL_TEXT"), Copy);
        CFStringLowercase(MutableCopy, *((CFLocaleRef *)this + 13));
        CFDictionarySetValue(Mutable, MutableCopy, v32);
        if (MutableCopy)
          CFRelease(MutableCopy);
        ++v28;
        --v26;
      }
      while (v26);
    }
    v34 = CFRetain(Mutable);
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, v34);
    if ((v37 & 1) != 0)
      (*(void (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
    return 1;
  }
  else
  {
    v23 = v5 != 0;
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)v6, 0);
    if (a3)
      (*(void (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
  }
  return v23;
}

void sub_218E91938(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t QP::ParserConfiguration::setPrivateParsing(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 49) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setEmbeddingsEnabled(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 50) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setAnnotationsEnabled(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 52) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setU2Enabled(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 53) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::setUseLLMParse(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 54) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

_BYTE *QP::ParserConfiguration::setIsEntitySearch(_BYTE *this, const __CFBoolean *a2, const __CFBoolean *a3, const __CFBoolean *a4)
{
  const __CFBoolean *v4;

  v4 = (const __CFBoolean *)*MEMORY[0x24BDBD270];
  this[60] = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  this[61] = v4 == a3;
  this[62] = v4 == a4;
  return this;
}

uint64_t QP::ParserConfiguration::update(QP::ParserConfiguration *this)
{
  return (*(uint64_t (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
}

void QP::ParserConfiguration::loadConfigurationResource(QP::ParserConfiguration *this, const __CFURL *a2, __CFError **a3, __CFError **a4)
{
  const __CFDictionary *DictionaryWithContentsOfURL;
  const __CFDictionary *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  int v13;
  CFAllocatorRef *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  NSObject *v17;
  NSObject *v18;
  const __CFDictionary *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  NSObject *v22;
  NSObject *v23;
  const __CFDictionary *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  NSObject *v27;
  NSObject *v28;
  const __CFDictionary *v29;
  const __CFNumber *v30;
  int v31;
  NSObject *v32;
  const __CFNumber *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  _QWORD v39[3];
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const __CFURL *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  *((_BYTE *)this + 33) = 0;
  if (!a2)
    return;
  cf = 0;
  DictionaryWithContentsOfURL = (const __CFDictionary *)nlp::createDictionaryWithContentsOfURL(a2, (CFErrorRef *)&cf, a3, a4);
  v7 = DictionaryWithContentsOfURL;
  v39[2] = DictionaryWithContentsOfURL;
  if (!cf)
  {
    if (!DictionaryWithContentsOfURL)
      return;
    if (*((_QWORD *)this + 13))
      v9 = MEMORY[0x219A24574]();
    else
      v9 = 0;
    if (configLogger(void)::token != -1)
      dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
    v10 = configLogger(void)::log;
    if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v9;
      v43 = 2112;
      v44 = a2;
      _os_log_impl(&dword_218E10000, v10, OS_LOG_TYPE_INFO, "QueryParser: loading %@ from %@", buf, 0x16u);
    }
    *((_BYTE *)this + 33) = 1;
    if (!CFDictionaryContainsKey(v7, CFSTR("Contents")))
      goto LABEL_60;
    Value = (const __CFArray *)CFDictionaryGetValue(v7, CFSTR("Contents"));
    if (CFArrayGetCount(Value) != 3)
      goto LABEL_60;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
    v13 = CFDictionaryContainsKey(ValueAtIndex, CFSTR("Version"));
    v14 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
    if (v13)
    {
      v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Version"));
      v16 = CFNumberCreate(*v14, kCFNumberCFIndexType, "\b");
      v39[0] = v16;
      if (configLogger(void)::token != -1)
        dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
      v17 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = (uint64_t)v15;
        _os_log_impl(&dword_218E10000, v17, OS_LOG_TYPE_INFO, "QueryParser: loading %@ dates version", buf, 0xCu);
      }
      if (CFNumberCompare(v15, v16, 0))
      {
        if (configLogger(void)::token != -1)
          dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
        v18 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (uint64_t)v16;
          _os_log_impl(&dword_218E10000, v18, OS_LOG_TYPE_INFO, "QueryParser: expected %@ dates version (error)", buf, 0xCu);
        }
        *((_BYTE *)this + 33) = 0;
      }
      if (v16)
        CFRelease(v16);
    }
    else
    {
      *((_BYTE *)this + 33) = 0;
    }
    v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 1);
    if (CFDictionaryContainsKey(v19, CFSTR("Version")))
    {
      v20 = (const __CFNumber *)CFDictionaryGetValue(v19, CFSTR("Version"));
      v21 = CFNumberCreate(*v14, kCFNumberCFIndexType, "\t");
      v39[0] = v21;
      if (configLogger(void)::token != -1)
        dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
      v22 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = (uint64_t)v20;
        _os_log_impl(&dword_218E10000, v22, OS_LOG_TYPE_INFO, "QueryParser: loading %@ lexicon version", buf, 0xCu);
      }
      if (CFNumberCompare(v20, v21, 0))
      {
        if (configLogger(void)::token != -1)
          dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
        v23 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (uint64_t)v21;
          _os_log_impl(&dword_218E10000, v23, OS_LOG_TYPE_INFO, "QueryParser: expected %@ lexicon version (error)", buf, 0xCu);
        }
        *((_BYTE *)this + 33) = 0;
      }
      if (v21)
        CFRelease(v21);
    }
    else
    {
      *((_BYTE *)this + 33) = 0;
    }
    v24 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 2);
    if (CFDictionaryContainsKey(v24, CFSTR("Version")))
    {
      v25 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("Version"));
      v26 = CFNumberCreate(*v14, kCFNumberCFIndexType, &QPPARSER_MIN_RULES_VERSION);
      v39[0] = v26;
      if (configLogger(void)::token != -1)
        dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
      v27 = configLogger(void)::log;
      if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = (uint64_t)v25;
        _os_log_impl(&dword_218E10000, v27, OS_LOG_TYPE_INFO, "QueryParser: loading %@ rules version", buf, 0xCu);
      }
      if (CFNumberCompare(v25, v26, 0))
      {
        if (configLogger(void)::token != -1)
          dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
        v28 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (uint64_t)v26;
          _os_log_impl(&dword_218E10000, v28, OS_LOG_TYPE_INFO, "QueryParser: expected %@ rules version (error)", buf, 0xCu);
        }
        *((_BYTE *)this + 33) = 0;
      }
      if (v26)
        CFRelease(v26);
    }
    else
    {
LABEL_60:
      *((_BYTE *)this + 33) = 0;
    }
    if (CFDictionaryContainsKey(v7, CFSTR("CanonicalRegions")))
    {
      v29 = (const __CFDictionary *)CFDictionaryGetValue(v7, CFSTR("CanonicalRegions"));
      QP::ParserConfiguration::setCanonicalRegions((const void **)this, v29);
    }
    if (CFDictionaryContainsKey(v7, CFSTR("EnableSuggestions")))
    {
      v30 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("EnableSuggestions"));
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v30, kCFNumberIntType, buf);
      v31 = *(_DWORD *)buf;
      *((_BYTE *)this + 63) = *(_DWORD *)buf != 0;
      if (v31)
      {
        if (configLogger(void)::token != -1)
          dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
        v32 = configLogger(void)::log;
        if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v39[0]) = 0;
          _os_log_impl(&dword_218E10000, v32, OS_LOG_TYPE_INFO, "QueryParser: suggestions enabled", (uint8_t *)v39, 2u);
        }
      }
    }
    if (!CFDictionaryContainsKey(v7, CFSTR("EnableParsing")))
      goto LABEL_81;
    v33 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("EnableParsing"));
    *(_DWORD *)buf = 0;
    CFNumberGetValue(v33, kCFNumberIntType, buf);
    v34 = *(_DWORD *)buf;
    *((_BYTE *)this + 48) = *(_DWORD *)buf != 0;
    if (!v34)
      goto LABEL_81;
    if (*((_BYTE *)this + 49))
    {
      if (configLogger(void)::token != -1)
        dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
      v35 = configLogger(void)::log;
      if (!os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        goto LABEL_81;
      LOWORD(v39[0]) = 0;
      v36 = "QueryParser: private parsing enabled";
    }
    else
    {
      if (configLogger(void)::token != -1)
        dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
      v35 = configLogger(void)::log;
      if (!os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_INFO))
        goto LABEL_81;
      LOWORD(v39[0]) = 0;
      v36 = "QueryParser: parsing enabled";
    }
    _os_log_impl(&dword_218E10000, v35, OS_LOG_TYPE_INFO, v36, (uint8_t *)v39, 2u);
LABEL_81:
    if (CFDictionaryContainsKey(v7, CFSTR("SpaceDelimited")))
    {
      v37 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("SpaceDelimited"));
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v37, kCFNumberIntType, buf);
      *((_BYTE *)this + 31) = *(_DWORD *)buf != 0;
    }
    if (CFDictionaryContainsKey(v7, CFSTR("ParserReversed")))
    {
      v38 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("ParserReversed"));
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v38, kCFNumberIntType, buf);
      *((_BYTE *)this + 30) = *(_DWORD *)buf != 0;
    }
    goto LABEL_85;
  }
  if (configLogger(void)::token != -1)
    dispatch_once(&configLogger(void)::token, &__block_literal_global_17);
  v8 = configLogger(void)::log;
  if (os_log_type_enabled((os_log_t)configLogger(void)::log, OS_LOG_TYPE_ERROR))
    QP::ParserConfiguration::loadConfigurationResource((uint64_t *)&cf, v8);
  CFRelease(cf);
  if (v7)
LABEL_85:
    CFRelease(v7);
}

void sub_218E9226C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t QP::ParserConfiguration::setCanonicalRegions(const void **this, const __CFDictionary *a2)
{
  const void **v3;
  CFTypeRef v4;

  v3 = this + 25;
  nlp::CFScopedPtr<__CFDictionary const*>::reset(this + 25, 0);
  if (a2)
  {
    v4 = CFRetain(a2);
    nlp::CFScopedPtr<__CFDictionary const*>::reset(v3, v4);
  }
  return 1;
}

BOOL QP::ParserConfiguration::setAppContext(QP::ParserConfiguration *this, const __CFString *a2, int a3)
{
  _BOOL8 v5;

  v5 = QP::ParserConfiguration::setAppContext(this, a2);
  if (v5 && a3)
    (*(void (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
  return v5;
}

uint64_t QP::ParserConfiguration::setCustomResourceDirectory(QP::ParserConfiguration *this, const __CFURL *a2, int a3)
{
  const __CFURL *v6;
  const void **v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFURL *v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  const __CFString *v16;
  CFURLRef v17;
  const __CFAllocator *v18;
  CFURLRef v19;

  if (!a2)
    return 0;
  v7 = (const void **)((char *)this + 168);
  v6 = (const __CFURL *)*((_QWORD *)this + 21);
  if (v6)
  {
    v8 = CFURLGetString(v6);
    v9 = CFURLGetString(a2);
    if (CFStringsAreEqual(v8, v9))
      return 0;
  }
  nlp::CFScopedPtr<__CFURL const*>::reset(v7, 0);
  v11 = CFURLGetBaseURL(a2);
  v12 = CFURLGetString(a2);
  v13 = v12;
  if (v11 && v12)
  {
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v15 = CFURLGetString(v11);
    v16 = CFStringCreateWithFormat(v14, 0, CFSTR("%@%@"), v15, v13);
    v17 = CFURLCreateWithString(v14, v16, 0);
    nlp::CFScopedPtr<__CFURL const*>::reset(v7, v17);
    if (v16)
LABEL_11:
      CFRelease(v16);
  }
  else if (v12)
  {
    v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v16 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@"), v12);
    v19 = CFURLCreateWithString(v18, v16, 0);
    nlp::CFScopedPtr<__CFURL const*>::reset(v7, v19);
    if (v16)
      goto LABEL_11;
  }
  if (a3)
    (*(void (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
  return 1;
}

void sub_218E92514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t QP::ParserConfiguration::setLocale(QP::ParserConfiguration *this, const __CFLocale *a2, const __CFArray *a3, int a4)
{
  uint64_t v6;

  v6 = QP::ParserConfiguration::setLocale(this, a2, a3);
  if ((_DWORD)v6)
  {
    *((_BYTE *)this + 32) = 0;
    if (a4)
      (*(void (**)(QP::ParserConfiguration *))(*(_QWORD *)this + 32))(this);
  }
  return v6;
}

BOOL QP::ParserConfiguration::setParserFormat(_DWORD *a1, int a2, int a3)
{
  int v4;

  v4 = a1[4];
  if (v4 != a2)
  {
    a1[4] = a2;
    if (a3)
      (*(void (**)(_DWORD *))(*(_QWORD *)a1 + 32))(a1);
  }
  return v4 != a2;
}

void nlp::CFScopedPtr<__CFTimeZone const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void QP::ParserConfiguration::setFirstWeekDay(QP::ParserConfiguration *this, CFIndex a2)
{
  __CFCalendar *v2;

  if (a2 >= 1)
  {
    v2 = (__CFCalendar *)*((_QWORD *)this + 11);
    if (v2)
      CFCalendarSetFirstWeekday(v2, a2);
  }
}

uint64_t QP::ParserConfiguration::setUseSystemLocale(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 32) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

void nlp::CFScopedPtr<__CFArray const*>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__CFArray const*>::reset(a1, cf);
  }
}

uint64_t QP::ParserConfiguration::setCanUseEmbeddings(uint64_t this, const __CFBoolean *a2)
{
  *(_BYTE *)(this + 51) = *MEMORY[0x24BDBD270] == (_QWORD)a2;
  return this;
}

uint64_t QP::ParserConfiguration::useEra(QP::ParserConfiguration *this)
{
  return *((unsigned __int8 *)this + 20);
}

BOOL QP::ParserConfiguration::regionValidForLanguage(QP::ParserConfiguration *this, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  const __CFAllocator *v7;
  CFStringRef v8;
  const __CFDictionary *Value;
  int v10;
  const __CFDictionary *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  char v14;
  CFRange v16;

  if (!a4 || !a2 || !*((_QWORD *)this + 25))
    return 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a3)
  {
    v8 = CFStringCreateWithFormat(v7, 0, CFSTR("%@-%@"), a2, a3);
    if (!CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8))
      goto LABEL_16;
    Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), v8);
  }
  else
  {
    v8 = CFStringCreateWithFormat(v7, 0, CFSTR("%@_%@"), a2, a4);
    v10 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8);
    v11 = (const __CFDictionary *)*((_QWORD *)this + 25);
    if (v10)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v11, v8);
    }
    else
    {
      if (!CFDictionaryContainsKey(v11, a2))
        goto LABEL_16;
      Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), a2);
    }
  }
  if (!Value
    || (v12 = (const __CFArray *)CFDictionaryGetValue(Value, CFSTR("ValidRegions")), (v13 = v12) == 0)
    || (v16.length = CFArrayGetCount(v12), v16.location = 0, !CFArrayContainsValue(v13, v16, a4)))
  {
LABEL_16:
    v14 = 1;
    if (!v8)
      return (v14 & 1) == 0;
    goto LABEL_17;
  }
  v14 = 0;
  if (v8)
LABEL_17:
    CFRelease(v8);
  return (v14 & 1) == 0;
}

void sub_218E92828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

const void *QP::ParserConfiguration::canonicalRegionForLanguage(QP::ParserConfiguration *this, const __CFString *key, const __CFString *a3, const __CFString *a4)
{
  const void *result;
  CFStringRef v8;
  const __CFDictionary *Value;
  const __CFDictionary *v10;

  result = 0;
  if (!key || !*((_QWORD *)this + 25))
    return result;
  if (a3)
  {
    v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@-%@"), key, a3);
    if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), v8))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), v8);
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      Value = 0;
      if (!v8)
        goto LABEL_11;
    }
    CFRelease(v8);
    goto LABEL_11;
  }
  if (!CFDictionaryContainsKey(*((CFDictionaryRef *)this + 25), key))
    return 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 25), key);
LABEL_11:
  if (!Value)
    return 0;
  v10 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("Mappings"));
  if (!v10)
    return CFDictionaryGetValue(Value, CFSTR("CanonicalRegion"));
  result = CFDictionaryGetValue(v10, a4);
  if (!result)
    return CFDictionaryGetValue(Value, CFSTR("CanonicalRegion"));
  return result;
}

void sub_218E9295C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void QP::ParserConfiguration::~ParserConfiguration(QP::ParserConfiguration *this)
{
  QP::ParserConfiguration::~ParserConfiguration(this);
  JUMPOUT(0x219A24D0CLL);
}

{
  const void **v2;

  *(_QWORD *)this = &unk_24DA27258;
  v2 = (const void **)((char *)this + 72);
  std::__list_imp<QP::Subscriber *>::clear((_QWORD *)this + 30);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 29, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 28, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 27, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 26, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 25, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 24, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 23, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 22, 0);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)this + 21, 0);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)this + 20, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 19, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 18, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 17, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 16, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 15, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)this + 14, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)this + 13, 0);
  nlp::CFScopedPtr<__CFTimeZone const*>::reset((const void **)this + 12, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 11, 0);
  nlp::CFScopedPtr<__CFCalendar *>::reset((const void **)this + 10, 0);
  nlp::CFScopedPtr<__CFDate const*>::reset(v2, 0);
}

_QWORD *QP::ParserConfiguration::Attach(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;

  result = operator new(0x18uLL);
  v5 = a1[30];
  a1 += 30;
  result[1] = a1;
  result[2] = a2;
  *result = v5;
  *(_QWORD *)(v5 + 8) = result;
  *a1 = result;
  ++a1[2];
  return result;
}

uint64_t QP::ParserConfiguration::Detach(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::list<QP::Subscriber *>::remove(a1 + 240, &v3);
}

uint64_t QP::ParserConfiguration::Notify(uint64_t this)
{
  uint64_t v1;
  uint64_t i;

  v1 = this + 240;
  for (i = *(_QWORD *)(this + 248); i != v1; i = *(_QWORD *)(i + 8))
    this = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(i + 16) + 16))(*(_QWORD *)(i + 16));
  return this;
}

_QWORD *std::__list_imp<QP::Subscriber *>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

os_log_t ___ZL12configLoggerv_block_invoke()
{
  const char *v0;
  os_log_t result;

  v0 = _nlpLoggingSubsystem();
  result = os_log_create(v0, "QueryParserConfiguration");
  configLogger(void)::log = (uint64_t)result;
  return result;
}

uint64_t std::list<QP::Subscriber *>::remove(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11[2];
  uint64_t v12;

  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  v12 = 0;
  v2 = *(_QWORD **)(a1 + 8);
  if (v2 == (_QWORD *)a1)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      v6 = (_QWORD *)v2[1];
      v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (_QWORD *)a1)
        {
          v8 = 1;
LABEL_8:
          v6 = (_QWORD *)a1;
        }
        else
        {
          while (1)
          {
            v7 = v6[2];
            v8 = v7 == v5;
            if (v7 != v5)
              break;
            v6 = (_QWORD *)v6[1];
            if (v6 == (_QWORD *)a1)
              goto LABEL_8;
          }
        }
        std::list<QP::Subscriber *>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8)
          v6 = (_QWORD *)v6[1];
      }
      v2 = v6;
    }
    while (v6 != (_QWORD *)a1);
    v9 = v12;
  }
  std::__list_imp<QP::Subscriber *>::clear(v11);
  return v9;
}

void sub_218E92CD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__list_imp<QP::Subscriber *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::list<QP::Subscriber *>::splice(uint64_t result, uint64_t *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (a4 != a5)
  {
    v5 = (_QWORD *)*a5;
    if (result != a3)
    {
      v6 = 1;
      if (v5 != a4)
      {
        v7 = a4;
        do
        {
          v7 = (_QWORD *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(_QWORD *)(a3 + 16) -= v6;
      *(_QWORD *)(result + 16) += v6;
    }
    v8 = *a4;
    *(_QWORD *)(v8 + 8) = v5[1];
    *(_QWORD *)v5[1] = v8;
    v9 = *a2;
    *(_QWORD *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

std::__shared_weak_count *QP::PhotosFormatter::setParse(QP::SpotlightFormatter *this, const __CFString ***a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  std::__shared_weak_count *v15;
  CFNumberRef v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const __CFString **v27;
  std::__shared_weak_count *v28;
  CFNumberRef v29;
  uint64_t valuePtr;
  _QWORD v31[7];
  std::__shared_weak_count *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  const __CFString **v37;
  std::__shared_weak_count *v38;

  if (*((_BYTE *)*a2 + 81))
  {
    QP::SpotlightFormatter::clear(this);
    QP::Formatter::clear((const void **)this);
    v4 = (std::__shared_weak_count *)a2[1];
    v37 = *a2;
    v38 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    QP::Formatter::setParse((uint64_t)this, (uint64_t)&v37);
    v7 = v38;
    if (v38)
    {
      v8 = (unint64_t *)&v38->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2000000000;
    v36 = 0;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 1174405120;
    v31[2] = ___ZN2QP15PhotosFormatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke;
    v31[3] = &unk_24DA272F0;
    v10 = (uint64_t)*a2;
    v11 = (std::__shared_weak_count *)a2[1];
    v31[5] = this;
    v31[6] = v10;
    v32 = v11;
    if (v11)
    {
      v12 = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v31[4] = &v33;
    QP::Parse::enumerateParseAttributes(v10, (uint64_t)v31);
    v14 = *((_DWORD *)v34 + 6);
    v15 = (std::__shared_weak_count *)(v14 > 0);
    if (v14 >= 1)
    {
      QP::Formatter::setResultValue(this, kQPParseResultIsEntitySearchKey, (const void *)*MEMORY[0x24BDBD270]);
      valuePtr = 3;
      v16 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
      v29 = v16;
      QP::Formatter::setResultValue(this, kQPParseResultConfidenceKey, v16);
      if (v16)
        CFRelease(v16);
    }
    v17 = v32;
    if (v32)
    {
      v18 = (unint64_t *)&v32->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v21 = (std::__shared_weak_count *)a2[1];
    v27 = *a2;
    v28 = v21;
    if (v21)
    {
      v22 = (unint64_t *)&v21->__shared_owners_;
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    v15 = QP::SpotlightFormatter::setParse((uint64_t)this, &v27);
    v24 = v28;
    if (v28)
    {
      v25 = (unint64_t *)&v28->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }
  return v15;
}

void sub_218E92FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter8setParseENSt3__110shared_ptrINS_5ParseEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  QP::Formatter *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20[2];
  QP::ParseAttribute *v21;
  std::__shared_weak_count *v22;

  v4 = *(QP::Formatter **)(a1 + 40);
  if (QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 1
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 2
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 3
    || QP::ParseAttribute::flag(*(QP::ParseAttribute **)a2) == 4)
  {
    v5 = **(_QWORD **)(a1 + 48);
    v6 = *(std::__shared_weak_count **)(a2 + 8);
    v21 = *(QP::ParseAttribute **)a2;
    v22 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    (*(void (**)(QP::Formatter *, uint64_t, QP::ParseAttribute **))(*(_QWORD *)v4 + 64))(v4, v5, &v21);
    v9 = v22;
    if (v22)
    {
      v10 = (unint64_t *)&v22->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        v12 = v9;
LABEL_13:
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    v13 = **(const __CFString ***)(a1 + 48);
    v14 = *(_QWORD *)a2;
    v15 = *(_QWORD *)(a2 + 8);
    v20[0] = v14;
    v20[1] = v15;
    if (v15)
    {
      v16 = (unint64_t *)(v15 + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    QP::PhotosFormatter::updateEntityParseWithAttribute(v4, v13, v20);
    if (v15)
    {
      v18 = (unint64_t *)(v15 + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
        v12 = (std::__shared_weak_count *)v15;
        goto LABEL_13;
      }
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void sub_218E93180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void QP::PhotosFormatter::updateEntityParseWithAttribute(QP::Formatter *a1, const __CFString *a2, uint64_t *a3)
{
  const __CFAllocator *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  const char *v13;
  unint64_t *v14;
  unint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  const char *v31;
  unint64_t *v32;
  unint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  QP::SpellCheckWrapper *v39;
  const void *v40;
  const __CFString *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  CFStringRef cf;
  CFStringRef v47;
  std::__shared_weak_count *v48;
  std::__shared_weak_count *v49;
  __CFString *v50;

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = *a3;
  v8 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  v50 = (__CFString *)CFStringCreateWithSubstring(v6, a2, *(CFRange *)(*(_QWORD *)(v7 + 104) + 72));
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  v11 = *a3;
  v12 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  v13 = *(const char **)(v11 + 104);
  v48 = v12;
  if (v13[23] < 0)
    v13 = *(const char **)v13;
  v47 = CFStringCreateWithCString(v6, v13, 0x8000100u);
  if (v48)
  {
    v14 = (unint64_t *)&v48->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  v16 = kQPParseResultAttributeTypeKey;
  v17 = *a3;
  v18 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  QP::Formatter::setParseAttribute(a1, v16, v47, *(CFRange *)(*(_QWORD *)(v17 + 104) + 72));
  v19 = (unint64_t *)&v18->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  v21 = *a3;
  v22 = *(std::__shared_weak_count **)(*a3 + 112);
  if (v22)
  {
    v23 = std::__shared_weak_count::lock(v22);
    if (v23)
      v24 = *(_QWORD *)(v21 + 104);
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  if (*(char *)(v24 + 119) < 0)
  {
    v25 = *(_QWORD *)(v24 + 104);
    if (!v23)
      goto LABEL_28;
  }
  else
  {
    v25 = *(unsigned __int8 *)(v24 + 119);
    if (!v23)
      goto LABEL_28;
  }
  v26 = (unint64_t *)&v23->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (v27)
  {
LABEL_28:
    if (!v25)
      goto LABEL_46;
    goto LABEL_29;
  }
  ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
  std::__shared_weak_count::__release_weak(v23);
  if (!v25)
    goto LABEL_46;
LABEL_29:
  v28 = *a3;
  v49 = 0;
  v29 = *(std::__shared_weak_count **)(*a3 + 112);
  if (v29 && (v49 = std::__shared_weak_count::lock(v29)) != 0)
    v30 = *(_QWORD *)(v28 + 104);
  else
    v30 = 0;
  v31 = (const char *)(v30 + 96);
  if (*(char *)(v30 + 119) < 0)
    v31 = *(const char **)v31;
  cf = CFStringCreateWithCString(v6, v31, 0x8000100u);
  if (v49)
  {
    v32 = (unint64_t *)&v49->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  v34 = kQPParseResultAttributeStemKey;
  v35 = *a3;
  v36 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
  QP::Formatter::setParseAttribute(a1, v34, cf, *(CFRange *)(*(_QWORD *)(v35 + 104) + 72));
  v37 = (unint64_t *)&v36->__shared_owners_;
  do
    v38 = __ldaxr(v37);
  while (__stlxr(v38 - 1, v37));
  if (!v38)
  {
    ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
    std::__shared_weak_count::__release_weak(v36);
  }
  if (cf)
    CFRelease(cf);
LABEL_46:
  v39 = (QP::SpellCheckWrapper *)*((_QWORD *)a1 + 25);
  if (v39)
  {
    if (*(_BYTE *)(*((_QWORD *)a1 + 1) + 62))
    {
      v40 = (const void *)QP::SpellCheckWrapper::spellCheck(v39, v50, 10);
      if (v40)
      {
        v41 = kQPParseResultAttributeSpellCorrectKey;
        v42 = *a3;
        v43 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(*a3 + 112));
        QP::Formatter::setParseAttribute(a1, v41, v40, *(CFRange *)(*(_QWORD *)(v42 + 104) + 72));
        v44 = (unint64_t *)&v43->__shared_owners_;
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }
  }
  if (v47)
    CFRelease(v47);
  if (v50)
    CFRelease(v50);
}

void sub_218E93568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  const void *v4;
  va_list va;
  uint64_t v6;
  va_list va1;
  uint64_t v8;
  va_list va2;

  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v6 = va_arg(va2, _QWORD);
  v8 = va_arg(va2, _QWORD);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va2, 0);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_48c37_ZTSNSt3__110shared_ptrIN2QP5ParseEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_48c37_ZTSNSt3__110shared_ptrIN2QP5ParseEEE(uint64_t a1)
{
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 48);
}

void QP::PhotosFormatter::update(QP::PhotosFormatter *this)
{
  uint64_t v2;
  const __CFLocale *v3;
  const __CFString *Value;
  QP::SpellCheckWrapper *v5;
  uint64_t v6;

  if (!*((_QWORD *)this + 25))
  {
    v2 = *((_QWORD *)this + 1);
    if (*(_BYTE *)(v2 + 62))
    {
      v3 = *(const __CFLocale **)(v2 + 104);
      if (v3)
        Value = (const __CFString *)CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x24BDBD418]);
      else
        Value = 0;
      v5 = (QP::SpellCheckWrapper *)operator new();
      QP::SpellCheckWrapper::SpellCheckWrapper(v5, Value);
      v6 = *((_QWORD *)this + 25);
      *((_QWORD *)this + 25) = v5;
      if (v6)
        MEMORY[0x219A24D0C](v6, 0xC400A2AC0F1);
    }
  }
  QP::Formatter::update(this);
}

void sub_218E936B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A24D0C](v1, 0xC400A2AC0F1);
  _Unwind_Resume(a1);
}

void QP::PhotosFormatter::updateParseWithDateAttribute(QP::Formatter *a1, const __CFString *a2, CFRange **a3)
{
  CFRange *v4;
  std::__shared_weak_count *location;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  CFIndex length;
  const __CFAllocator *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int isEmpty;
  int v20;
  int v21;
  _BOOL8 v22;
  CFRange *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  CFStringRef v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  CFRange *v49;
  CFRange *v50;
  uint64_t v51;
  unint64_t *p_length;
  unint64_t v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  CFIndex Count;
  const __CFString *v59;
  const void **v60;
  CFStringRef v61;
  CFDateFormatterRef *v62;
  unint64_t *v63;
  unint64_t v64;
  __CFString *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  CFRange *v69;
  uint64_t v70;
  const __CFString *v71;
  CFStringRef v72;
  CFStringRef Copy;
  uint64_t v74;
  CFStringRef v75;
  uint64_t v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  const __CFDictionary *v87;
  const __CFArray *v88;
  const __CFArray *v89;
  unint64_t *p_shared_owners;
  unint64_t v91;
  _QWORD v92[7];
  _QWORD v93[2];
  CFStringRef v94;
  _QWORD v95[6];
  const __CFString *v96;
  const __CFString **v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  CFTypeRef cf;
  uint64_t v102;
  std::__shared_weak_count *v103;
  __CFString *v104;
  CFTypeRef v105;
  _QWORD v106[11];
  std::__shared_weak_count *v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  int v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  int v117;
  BOOL v118;
  uint64_t v119;
  std::__shared_weak_count *v120;
  _QWORD v121[5];
  CFTypeRef v122;
  uint64_t v123;
  std::__shared_weak_count *v124;
  _QWORD v125[5];
  CFTypeRef started;
  _QWORD v127[5];
  CFTypeRef v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  CFTypeRef v134;
  uint64_t v135;
  std::__shared_weak_count *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  int v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  int v144;
  void *__p[2];
  __int128 v146;
  __int128 v147;
  int v148;
  uint64_t v149;
  std::__shared_weak_count *v150;
  CFTypeRef v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  const __CFString *v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  CFMutableArrayRef v161;
  const __CFDictionary *v162;
  const __CFArray *v163;
  const __CFArray *Mutable;
  uint64_t v165;
  const void **v166;
  uint64_t v167;
  uint64_t (*v168)(uint64_t, uint64_t);
  void (*v169)(uint64_t);
  CFTypeRef v170;
  const __CFString *v171;
  CFIndex v172;
  std::__shared_weak_count *v173;

  v4 = *a3;
  location = (std::__shared_weak_count *)(*a3)[7].location;
  if (!location)
    return;
  v8 = std::__shared_weak_count::lock(location);
  if (!v8)
    return;
  v9 = v8;
  length = v4[6].length;
  v172 = length;
  v173 = v8;
  if (!length)
  {
LABEL_135:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v91 = __ldaxr(p_shared_owners);
    while (__stlxr(v91 - 1, p_shared_owners));
    if (!v91)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    return;
  }
  v170 = 0;
  v171 = 0;
  v165 = 0;
  v166 = (const void **)&v165;
  v167 = 0x3002000000;
  v168 = __Block_byref_object_copy__15;
  v169 = __Block_byref_object_dispose__15;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v163 = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
  v162 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v156 = 0;
  v157 = &v156;
  v158 = 0x3002000000;
  v159 = __Block_byref_object_copy__1_1;
  v160 = __Block_byref_object_dispose__2_1;
  v161 = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
  v152 = 0;
  v153 = &v152;
  v154 = 0x2000000000;
  v155 = CFSTR("kQPDate");
  if (QP::ParserGrammar::hasTranslations(*((_QWORD *)a1 + 3), (uint64_t)&(*a3)[3]))
  {
    v151 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v13 = *(_QWORD *)(length + 120);
    v12 = *(std::__shared_weak_count **)(length + 128);
    v149 = v13;
    v150 = v12;
    if (v12)
    {
      v14 = (unint64_t *)&v12->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    if (v13 && !BYTE1((*a3)[4].length))
    {
      v16 = *(_OWORD *)(v13 + 140);
      *(_OWORD *)__p = *(_OWORD *)(v13 + 124);
      v146 = v16;
      v147 = *(_OWORD *)(v13 + 156);
      v148 = *(_DWORD *)(v13 + 172);
      v17 = *(_OWORD *)(v13 + 36);
      v141 = *(_OWORD *)(v13 + 20);
      v142 = v17;
      v143 = *(_OWORD *)(v13 + 52);
      v144 = *(_DWORD *)(v13 + 68);
      v18 = *(_OWORD *)(v13 + 88);
      v137 = *(_OWORD *)(v13 + 72);
      v138 = v18;
      v139 = *(_OWORD *)(v13 + 104);
      v140 = *(_DWORD *)(v13 + 120);
      isEmpty = QP::DateComponents::isEmpty((QP::DateComponents *)__p);
      v20 = *(_DWORD *)(v13 + 8);
      if (v20 > 5)
        v21 = isEmpty;
      else
        v21 = 0;
      if (v21 == 1)
        v22 = v20 < 0x5B;
      else
        v22 = v20 == 4
           && ((int)QP::DateComponents::componentsCount((int32x2_t *)&v141) > 1
            || (int)QP::DateComponents::componentsCount((int32x2_t *)&v137) >= 2);
      v27 = *(_DWORD *)(v13 + 8);
      if ((v27 - 1) <= 0x3F && ((1 << (v27 - 1)) & 0x8000000008008001) != 0
        || v27 == 102)
      {
        v22 = 1;
      }
      v28 = (std::__shared_weak_count *)*((_QWORD *)a1 + 2);
      v135 = *((_QWORD *)a1 + 1);
      v136 = v28;
      if (v28)
      {
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
        v27 = *(_DWORD *)(v13 + 8);
      }
      QP::DateConverter::resolveDateComponentsAsRange((uint64_t)&v135, *(unsigned __int16 *)(v13 + 12), v27, &v141, &v137, (uint64_t)__p, v22);
      v31 = v136;
      if (v136)
      {
        v32 = (unint64_t *)&v136->__shared_owners_;
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v129 = 0;
      v130 = &v129;
      v131 = 0x3002000000;
      v132 = __Block_byref_object_copy__1_1;
      v133 = __Block_byref_object_dispose__2_1;
      v134 = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
      v127[0] = 0;
      v127[1] = v127;
      v127[2] = 0x3002000000;
      v127[3] = __Block_byref_object_copy__1_1;
      v127[4] = __Block_byref_object_dispose__2_1;
      v128 = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
      v125[0] = 0;
      v125[1] = v125;
      v125[2] = 0x3002000000;
      v125[3] = __Block_byref_object_copy__15;
      v125[4] = __Block_byref_object_dispose__15;
      v34 = (uint64_t *)*((_QWORD *)a1 + 5);
      v35 = v149;
      v123 = v149;
      v124 = v150;
      if (v150)
      {
        v36 = (unint64_t *)&v150->__shared_owners_;
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      started = QP::DateFormatter::copyISODisplayForStartDate(v34, &v123, *(unsigned __int16 *)(v35 + 12), 0, 0, 0);
      v38 = v124;
      if (v124)
      {
        v39 = (unint64_t *)&v124->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
      v121[0] = 0;
      v121[1] = v121;
      v121[2] = 0x3002000000;
      v121[3] = __Block_byref_object_copy__15;
      v121[4] = __Block_byref_object_dispose__15;
      v41 = (uint64_t *)*((_QWORD *)a1 + 5);
      v42 = v149;
      v119 = v149;
      v120 = v150;
      if (v150)
      {
        v43 = (unint64_t *)&v150->__shared_owners_;
        do
          v44 = __ldxr(v43);
        while (__stxr(v44 + 1, v43));
      }
      v122 = QP::DateFormatter::copyISODisplayForEndDate(v41, &v119, *(unsigned __int16 *)(v42 + 12), 0, 0, 0);
      v45 = v120;
      if (v120)
      {
        v46 = (unint64_t *)&v120->__shared_owners_;
        do
          v47 = __ldaxr(v46);
        while (__stlxr(v47 - 1, v46));
        if (!v47)
        {
          ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
          std::__shared_weak_count::__release_weak(v45);
        }
      }
      v48 = *((_QWORD *)a1 + 3);
      v106[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke;
      v106[3] = &unk_24DA27420;
      v50 = *a3;
      v49 = a3[1];
      v51 = (uint64_t)&(*a3)[3];
      v106[0] = MEMORY[0x24BDAC760];
      v106[1] = 1174405120;
      v106[9] = a1;
      v106[10] = v50;
      v107 = (std::__shared_weak_count *)v49;
      if (v49)
      {
        p_length = (unint64_t *)&v49->length;
        do
          v53 = __ldxr(p_length);
        while (__stxr(v53 + 1, p_length));
      }
      v118 = v22;
      v106[4] = v125;
      v106[5] = v121;
      v54 = v149;
      v55 = v150;
      v106[6] = &v129;
      v108 = v149;
      v109 = v150;
      if (v150)
      {
        v56 = (unint64_t *)&v150->__shared_owners_;
        do
          v57 = __ldxr(v56);
        while (__stxr(v57 + 1, v56));
      }
      v110 = v141;
      v111 = v142;
      v112 = v143;
      v114 = v137;
      v115 = v138;
      v116 = v139;
      v113 = v144;
      v117 = v140;
      v106[7] = v127;
      v106[8] = &v152;
      QP::ParserGrammar::translations(v48, v51, (uint64_t)v106);
      v105 = CFStringCreateWithSubstring(v11, a2, *(CFRange *)(v172 + 72));
      QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateKey, v105, (*a3)[1]);
      Count = CFArrayGetCount((CFArrayRef)v130[5]);
      if (Count)
      {
        v59 = CFStringCreateByCombiningStrings(v11, (CFArrayRef)v130[5], CFSTR(" || "));
        v96 = v59;
        if (CFStringGetLength(v59))
        {
          v60 = v166;
          if (Count <= 1)
            v61 = CFStringCreateWithFormat(v11, 0, CFSTR("%@"), v59);
          else
            v61 = CFStringCreateWithFormat(v11, 0, CFSTR("(%@)"), v59);
          nlp::CFScopedPtr<__CFString const*>::reset(v60 + 5, v61);
          if (CFStringGetLength((CFStringRef)v166[5]))
            QP::Formatter::setParseAttribute(a1, kQPParseAttributeDescriptionKey, v166[5], (*a3)[1]);
          ++*((_QWORD *)a1 + 10);
        }
        if (v59)
          CFRelease(v59);
      }
      v62 = (CFDateFormatterRef *)*((_QWORD *)a1 + 5);
      v102 = v54;
      v103 = v55;
      if (v55)
      {
        v63 = (unint64_t *)&v55->__shared_owners_;
        do
          v64 = __ldxr(v63);
        while (__stxr(v64 + 1, v63));
      }
      v65 = QP::DateFormatter::copyDisplayForDate(v62, &v102, v22, 0);
      v104 = v65;
      v66 = v103;
      if (v103)
      {
        v67 = (unint64_t *)&v103->__shared_owners_;
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 - 1, v67));
        if (!v68)
        {
          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
          std::__shared_weak_count::__release_weak(v66);
        }
        v65 = v104;
      }
      if (v65)
      {
        v96 = 0;
        v97 = &v96;
        v98 = 0x3002000000;
        v99 = __Block_byref_object_copy__15;
        v100 = __Block_byref_object_dispose__15;
        cf = 0;
        v69 = *a3;
        v70 = MEMORY[0x24BDAC760];
        v95[0] = MEMORY[0x24BDAC760];
        v95[1] = 0x40000000;
        v95[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_27;
        v95[3] = &unk_24DA27458;
        v95[4] = &v96;
        v95[5] = a1;
        QP::ParseAttribute::actionsForRoot((uint64_t)v69, (uint64_t)v95);
        v71 = v97[5];
        if (v71)
        {
          v72 = CFStringCreateWithFormat(v11, 0, v71, v65);
          nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v171, v72);
          QP::SpotlightFormatter::addDisplay(a1, v171, (*a3)[1]);
          CFDictionarySetValue(v162, CFSTR("kQPDisplay"), v171);
          v153[3] = (uint64_t)CFSTR("kQPDateSpecial");
        }
        else
        {
          Copy = CFStringCreateCopy(v11, v65);
          nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v171, Copy);
          QP::SpotlightFormatter::addDisplay(a1, v65, (*a3)[1]);
          CFDictionarySetValue(v162, CFSTR("kQPDisplay"), v65);
          v74 = v149;
          v75 = CFStringCreateWithFormat(v11, 0, CFSTR("%d"), *(unsigned __int16 *)(v149 + 12));
          v94 = v75;
          v76 = *((_QWORD *)a1 + 3);
          v92[0] = v70;
          v92[1] = 1174405120;
          v92[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_35;
          v92[3] = &unk_24DA27480;
          v92[6] = a1;
          v93[0] = v74;
          v93[1] = v150;
          if (v150)
          {
            v77 = (unint64_t *)&v150->__shared_owners_;
            do
              v78 = __ldxr(v77);
            while (__stxr(v78 + 1, v77));
          }
          v92[4] = &v165;
          v92[5] = &v156;
          QP::ParserGrammar::tokens(v76, CFSTR("kQPDate"), v75, v65, (uint64_t)v92);
          std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)v93);
          nlp::CFScopedPtr<__CFString const*>::reset((const void **)&v94, 0);
        }
        _Block_object_dispose(&v96, 8);
        if (cf)
          CFRelease(cf);
        CFRelease(v65);
      }
      if (v105)
        CFRelease(v105);
      v79 = v109;
      if (v109)
      {
        v80 = (unint64_t *)&v109->__shared_owners_;
        do
          v81 = __ldaxr(v80);
        while (__stlxr(v81 - 1, v80));
        if (!v81)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
      v82 = v107;
      if (v107)
      {
        v83 = (unint64_t *)&v107->__shared_owners_;
        do
          v84 = __ldaxr(v83);
        while (__stlxr(v84 - 1, v83));
        if (!v84)
        {
          ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
          std::__shared_weak_count::__release_weak(v82);
        }
      }
      _Block_object_dispose(v121, 8);
      if (v122)
        CFRelease(v122);
      _Block_object_dispose(v125, 8);
      if (started)
        CFRelease(started);
      _Block_object_dispose(v127, 8);
      if (v128)
        CFRelease(v128);
      _Block_object_dispose(&v129, 8);
      if (v134)
        CFRelease(v134);
      v12 = v150;
    }
    if (v12)
    {
      v85 = (unint64_t *)&v12->__shared_owners_;
      do
        v86 = __ldaxr(v85);
      while (__stlxr(v86 - 1, v85));
      if (!v86)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (v151)
      CFRelease(v151);
  }
  else
  {
    v23 = *a3;
    std::string::basic_string[abi:ne180100]<0>(__p, "kQPDateExtension");
    v24 = QP::equals(&v23[3].location, __p);
    v25 = v24;
    if (SBYTE7(v146) < 0)
    {
      operator delete(__p[0]);
      if (!v25)
        goto LABEL_119;
    }
    else if (!v24)
    {
      goto LABEL_119;
    }
    v26 = CFStringCreateWithSubstring(v11, a2, *(CFRange *)(length + 72));
    __p[0] = (void *)v26;
    QP::Formatter::setParseAttribute(a1, kQPParseAttributeDateExtensionKey, v26, (*a3)[1]);
    ++*((_QWORD *)a1 + 10);
    v153[3] = (uint64_t)CFSTR("kQPDateExtension");
    if (v26)
      CFRelease(v26);
  }
LABEL_119:
  if (!*(_BYTE *)(*((_QWORD *)a1 + 1) + 37)
    || (QP::DatePeriod::isSingleYearPeriod(*(QP::DatePeriod **)(v172 + 120)) & 1) == 0)
  {
    QP::SpotlightFormatter::addTokens(a1, CFSTR("kQPTokenDate"), (const __CFArray *)v157[5]);
    QP::SpotlightFormatter::addSuggestion(a1, v171);
  }
  QP::SpotlightFormatter::addDescription(a1, (CFStringRef)v166[5]);
  v87 = v162;
  QP::SpotlightFormatter::addAttributes(a1, v162);
  v88 = Mutable;
  QP::SpotlightFormatter::addPrimaryCategories(a1, Mutable);
  v89 = v163;
  QP::SpotlightFormatter::addSecondaryCategory(a1, v163);
  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v156, 8);
  if (v161)
    CFRelease(v161);
  if (v87)
    CFRelease(v87);
  if (v89)
    CFRelease(v89);
  if (v88)
    CFRelease(v88);
  _Block_object_dispose(&v165, 8);
  if (v170)
    CFRelease(v170);
  if (v171)
    CFRelease(v171);
  v9 = v173;
  if (v173)
    goto LABEL_135;
}

void sub_218E9428C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, const void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,const void *a35,const void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;
  const void *a72;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v72);
  nlp::CFScopedPtr<__CFString const*>::reset(&a20, 0);
  _Block_object_dispose(&a27, 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v73 + 40), 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a35, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a36, 0);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a49);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&a47);
  _Block_object_dispose(&a67, 8);
  nlp::CFScopedPtr<__CFString const*>::reset(&a72, 0);
  _Block_object_dispose(&STACK[0x210], 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)&STACK[0x238], 0);
  _Block_object_dispose(&STACK[0x240], 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)&STACK[0x268], 0);
  _Block_object_dispose(&STACK[0x270], 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)&STACK[0x298], 0);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x368]);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)&STACK[0x378], 0);
  _Block_object_dispose(&STACK[0x380], 8);
  _Block_object_dispose((const void *)(v74 - 256), 8);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v74 - 216), 0);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)(v74 - 208), 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v74 - 200), 0);
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(v74 - 192), 0);
  _Block_object_dispose((const void *)(v74 - 184), 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v74 - 144), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v74 - 136), 0);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v74 - 128);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(a1 + 40), 0);
}

uint64_t __Block_byref_object_copy__1_1(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__2_1(uint64_t a1)
{
  nlp::CFScopedPtr<__CFArray *>::reset((const void **)(a1 + 40), 0);
}

uint64_t QP::DateComponents::componentsCount(int32x2_t *this)
{
  int v1;
  _BOOL4 v2;
  int v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;

  v1 = this[1].i32[1];
  v2 = v1 >= 0;
  if (v1 < 0)
    v3 = 1;
  else
    v3 = 2;
  if (this[2].i32[0] < 0)
    v3 = v2;
  v4.i32[0] = this[2].i32[1];
  v4.i32[1] = this[1].i32[0];
  v4.u64[1] = (unint64_t)vrev64_s32(*this);
  v5.i64[0] = -1;
  v5.i64[1] = -1;
  v6 = (int32x4_t)vandq_s8((int8x16_t)vcgtq_s32(v4, v5), (int8x16_t)xmmword_218EA02F0);
  v6.i32[0] = vaddvq_s32(v6) & 0xF;
  *(int8x8_t *)v6.i8 = vcnt_s8(*(int8x8_t *)v6.i8);
  v6.i16[0] = vaddlv_u8(*(uint8x8_t *)v6.i8);
  return v6.i32[0] + (this[4].i32[0] >= 0) + (this[5].i32[1] >= 0) + (this[6].i32[0] >= 0) + v3;
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  int v15;
  int v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  int v31;
  int v32;
  int v33;
  const __CFString *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD v38[4];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  char v54;
  _QWORD v55[4];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  int v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;

  v75 = 0;
  v76 = &v75;
  v77 = 0x2000000000;
  v78 = 0;
  v5 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v6 = MEMORY[0x24BDAC760];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 1174405120;
  v55[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2;
  v55[3] = &unk_24DA27388;
  v60 = v5;
  v61 = v4;
  v7 = *(std::__shared_weak_count **)(a1 + 88);
  v62 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v74 = *(_BYTE *)(a1 + 216);
  v56 = *(_OWORD *)(a1 + 32);
  v57 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 96);
  v10 = *(std::__shared_weak_count **)(a1 + 104);
  v63 = a2;
  v64 = v11;
  v65 = v10;
  if (v10)
  {
    v12 = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = *(_OWORD *)(a1 + 128);
  v66 = *(_OWORD *)(a1 + 112);
  v67 = v14;
  v68 = *(_OWORD *)(a1 + 144);
  v15 = *(_DWORD *)(a1 + 160);
  v70 = *(_OWORD *)(a1 + 164);
  v71 = *(_OWORD *)(a1 + 180);
  v72 = *(_OWORD *)(a1 + 196);
  v16 = *(_DWORD *)(a1 + 212);
  v69 = v15;
  v73 = v16;
  v58 = *(_QWORD *)(a1 + 56);
  v59 = &v75;
  QP::ParseAttribute::actionsForRoot(v4, (uint64_t)v55);
  if (!*((_BYTE *)v76 + 24))
  {
    v23 = *(_QWORD *)(v5 + 24);
    v24 = (void **)(*(_QWORD *)(a1 + 80) + 48);
    v38[0] = v6;
    v38[1] = 1174405120;
    v38[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_14;
    v38[3] = &unk_24DA273E8;
    v54 = *(_BYTE *)(a1 + 216);
    v39 = *(_OWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 48);
    v42 = v5;
    v43 = a2;
    v40 = v25;
    v26 = *(std::__shared_weak_count **)(a1 + 104);
    v44 = *(_QWORD *)(a1 + 96);
    v45 = v26;
    if (v26)
    {
      v27 = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    v29 = *(_OWORD *)(a1 + 128);
    v46 = *(_OWORD *)(a1 + 112);
    v47 = v29;
    v48 = *(_OWORD *)(a1 + 144);
    v30 = *(_OWORD *)(a1 + 180);
    v50 = *(_OWORD *)(a1 + 164);
    v31 = *(_DWORD *)(a1 + 160);
    v51 = v30;
    v52 = *(_OWORD *)(a1 + 196);
    v32 = *(_DWORD *)(a1 + 212);
    v49 = v31;
    v53 = v32;
    v41 = *(_QWORD *)(a1 + 56);
    QP::ParserGrammar::actions(v23, v24, (unsigned __int16)kQPSymbolIdDefault, (unsigned __int16)kQPSymbolIdActionDefault, (uint64_t)v38);
    v33 = *(_DWORD *)(*(_QWORD *)(a1 + 96) + 16);
    if (v33 == 1)
    {
      v34 = CFSTR("kQPDateDistantPast");
    }
    else
    {
      if (v33 != 2)
      {
LABEL_27:
        v35 = v45;
        if (v45)
        {
          v36 = (unint64_t *)&v45->__shared_owners_;
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        goto LABEL_8;
      }
      v34 = CFSTR("kQPDateDistantFuture");
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v34;
    goto LABEL_27;
  }
LABEL_8:
  v17 = v65;
  if (v65)
  {
    v18 = (unint64_t *)&v65->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v62;
  if (v62)
  {
    v21 = (unint64_t *)&v62->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  _Block_object_dispose(&v75, 8);
}

void sub_218E94914(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v1);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v2 + 104);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v2 + 80);
  _Block_object_dispose((const void *)(v3 - 96), 8);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 v14;
  int v15;
  int v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[4];
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  std::__shared_weak_count *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int v34;
  char v35;

  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(v6 + 24);
  v9 = (void **)(v7 + 48);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 1174405120;
  v20[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3;
  v20[3] = &unk_24DA27350;
  v35 = *(_BYTE *)(a1 + 224);
  v21 = *(_OWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v24 = v6;
  v22 = v10;
  v25 = *(_OWORD *)(a1 + 96);
  v11 = *(std::__shared_weak_count **)(a1 + 112);
  v26 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = *(_OWORD *)(a1 + 136);
  v27 = *(_OWORD *)(a1 + 120);
  v28 = v14;
  v29 = *(_OWORD *)(a1 + 152);
  v15 = *(_DWORD *)(a1 + 168);
  v31 = *(_OWORD *)(a1 + 172);
  v32 = *(_OWORD *)(a1 + 188);
  v33 = *(_OWORD *)(a1 + 204);
  v16 = *(_DWORD *)(a1 + 220);
  v30 = v15;
  v34 = v16;
  v23 = *(_OWORD *)(a1 + 56);
  QP::ParserGrammar::actions(v8, v9, a2, a3, (uint64_t)v20);
  v17 = v26;
  if (v26)
  {
    v18 = (unint64_t *)&v26->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

void sub_218E94A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __CFString *CFStringFromString;
  CFStringRef v5;
  const __CFArray *v6;
  uint64_t v7;
  __CFCalendar *v8;
  const __CFDate *v9;
  int v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFArray *v14;
  const __CFArray *v15;
  _QWORD v16[5];
  CFStringRef v17;
  __CFString *v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;

  v3 = *(_QWORD *)(a1 + 72);
  CFStringFromString = (__CFString *)QP::createCFStringFromString(a2);
  v18 = CFStringFromString;
  if (*(_BYTE *)(a1 + 208))
  {
    v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)(a1 + 80), CFStringFromString, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v17 = v5;
    v6 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v19.length = CFArrayGetCount(v6);
    v19.location = 0;
    if (!CFArrayContainsValue(v6, v19, v5))
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v7 = *(_QWORD *)(v3 + 8);
    v9 = *(const __CFDate **)(v7 + 72);
    v8 = *(__CFCalendar **)(v7 + 80);
    v10 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 88) + 12);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_4;
    v16[3] = &unk_24DA27328;
    v16[4] = *(_QWORD *)(a1 + 56);
    QP::enumerateQueryWithAction(v8, v9, CFStringFromString, 0, v10, (unsigned int *)(a1 + 104), (unsigned int *)(a1 + 156), (uint64_t)v16);
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR(" && "));
    v17 = v12;
    if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) < 2)
    {
      v15 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v21.length = CFArrayGetCount(v15);
      v21.location = 0;
      if (!CFArrayContainsValue(v15, v21, v12))
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
    }
    else
    {
      v13 = CFStringCreateWithFormat(v11, 0, CFSTR("(%@)"), v12);
      v14 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20.length = CFArrayGetCount(v14);
      v20.location = 0;
      if (!CFArrayContainsValue(v14, v20, v13))
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
      if (v13)
        CFRelease(v13);
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (v12)
      CFRelease(v12);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (CFStringFromString)
    CFRelease(CFStringFromString);
}

void sub_218E94D04(_Unwind_Exception *a1)
{
  uint64_t v1;

  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_4(uint64_t a1, const void *a2)
{
  const __CFArray *v4;
  CFRange v5;

  v4 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5.length = CFArrayGetCount(v4);
  v5.location = 0;
  if (!CFArrayContainsValue(v4, v5, a2))
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __copy_helper_block_e8_88c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE104156(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(result + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(result + 96) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_88c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE104c25_ZTSN2QP14DateComponentsE156c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 88);
}

_QWORD *__copy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE104c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE120172(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[11];
  result[10] = a2[10];
  result[11] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[14];
  result[13] = a2[13];
  result[14] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE104c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE120c25_ZTSN2QP14DateComponentsE172c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 80;
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 104);
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __CFString *CFStringFromString;
  CFStringRef v5;
  const __CFArray *v6;
  uint64_t v7;
  __CFCalendar *v8;
  const __CFDate *v9;
  int v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFArray *v14;
  const __CFArray *v15;
  _QWORD v16[5];
  CFStringRef v17;
  __CFString *v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;

  v3 = *(_QWORD *)(a1 + 64);
  CFStringFromString = (__CFString *)QP::createCFStringFromString(a2);
  v18 = CFStringFromString;
  if (*(_BYTE *)(a1 + 200))
  {
    v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)(a1 + 72), CFStringFromString, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v17 = v5;
    v6 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v19.length = CFArrayGetCount(v6);
    v19.location = 0;
    if (!CFArrayContainsValue(v6, v19, v5))
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v7 = *(_QWORD *)(v3 + 8);
    v9 = *(const __CFDate **)(v7 + 72);
    v8 = *(__CFCalendar **)(v7 + 80);
    v10 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 80) + 12);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_15;
    v16[3] = &unk_24DA273C0;
    v16[4] = *(_QWORD *)(a1 + 56);
    QP::enumerateQueryWithAction(v8, v9, CFStringFromString, 0, v10, (unsigned int *)(a1 + 96), (unsigned int *)(a1 + 148), (uint64_t)v16);
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR(" && "));
    v17 = v12;
    if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) < 2)
    {
      v15 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v21.length = CFArrayGetCount(v15);
      v21.location = 0;
      if (!CFArrayContainsValue(v15, v21, v12))
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
    }
    else
    {
      v13 = CFStringCreateWithFormat(v11, 0, CFSTR("(%@)"), v12);
      v14 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20.length = CFArrayGetCount(v14);
      v20.location = 0;
      if (!CFArrayContainsValue(v14, v20, v13))
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
      if (v13)
        CFRelease(v13);
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (v12)
      CFRelease(v12);
  }
  if (CFStringFromString)
    CFRelease(CFStringFromString);
}

void sub_218E950C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 64), 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_15(uint64_t a1, const void *a2)
{
  const __CFArray *v4;
  CFRange v5;

  v4 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5.length = CFArrayGetCount(v4);
  v5.location = 0;
  if (!CFArrayContainsValue(v4, v5, a2))
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __copy_helper_block_e8_80c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE96148(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(result + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(result + 88) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_80c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE96c25_ZTSN2QP14DateComponentsE148c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 80);
}

_QWORD *__copy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE96c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE112164(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[11];
  result[10] = a2[10];
  result[11] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[13];
  result[12] = a2[12];
  result[13] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_80c47_ZTSNSt3__110shared_ptrIN2QP14ParseAttributeEEE96c43_ZTSNSt3__110shared_ptrIN2QP10DatePeriodEEE112c25_ZTSN2QP14DateComponentsE164c25_ZTSN2QP14DateComponentsE(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 80;
  std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](a1 + 96);
  return std::shared_ptr<QP::ParserConfiguration>::~shared_ptr[abi:ne180100](v1);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_27(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  CFStringRef CFStringFromString;
  std::string __p;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (QP::ParserGrammar::hasSuggestion(*(QP::ParserGrammar **)(v6 + 24), kQPParseAttributeDateKey, a2, a3))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      QP::ParserGrammar::suggestion(*(QP::ParserGrammar **)(v6 + 24), kQPParseAttributeDateKey, a2, a3, &__p);
      CFStringFromString = QP::createCFStringFromString((uint64_t)&__p);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v7 + 40), CFStringFromString);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_218E952E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN2QP15PhotosFormatter28updateParseWithDateAttributeEPK10__CFStringNSt3__110shared_ptrINS_14ParseAttributeEEE_block_invoke_2_35(_QWORD *a1, const void *a2, int a3, CFStringRef str, const __CFString *a5)
{
  uint64_t v8;
  unsigned __int16 IntValue;
  CFDateFormatterRef *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  const __CFAllocator *v17;
  uint64_t *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  CFMutableStringRef MutableCopy;
  const __CFString *v33;
  const __CFString *v34;
  __CFDictionary *v35;
  const void *v36;
  __CFString *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  CFTypeRef cf;
  uint64_t v41;
  std::__shared_weak_count *v42;
  CFTypeRef started;
  CFMutableDictionaryRef theDict;
  uint64_t v45;
  std::__shared_weak_count *v46;
  __CFString *v47;
  CFRange v48;
  CFRange v49;

  v8 = a1[6];
  IntValue = CFStringGetIntValue(str);
  v10 = *(CFDateFormatterRef **)(v8 + 40);
  v11 = (std::__shared_weak_count *)a1[8];
  v45 = a1[7];
  v46 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v47 = QP::DateFormatter::copyDisplayForDate(v10, (uint64_t)&v45, IntValue, 1u, 0, 0);
  v14 = v46;
  if (v46)
  {
    v15 = (unint64_t *)&v46->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v18 = *(uint64_t **)(v8 + 40);
  v19 = (std::__shared_weak_count *)a1[8];
  v41 = a1[7];
  v42 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  started = QP::DateFormatter::copyISODisplayForStartDate(v18, &v41, IntValue, 0, 1, 0);
  v22 = v42;
  if (v42)
  {
    v23 = (unint64_t *)&v42->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = *(uint64_t **)(v8 + 40);
  v26 = (std::__shared_weak_count *)a1[8];
  v38 = a1[7];
  v39 = v26;
  if (v26)
  {
    v27 = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  cf = QP::DateFormatter::copyISODisplayForEndDate(v25, &v38, IntValue, 0, 1, 0);
  v29 = v39;
  if (!v39)
    goto LABEL_24;
  v30 = (unint64_t *)&v39->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    if (a5)
    {
LABEL_25:
      MutableCopy = CFStringCreateMutableCopy(v17, 0, a5);
      v33 = (const __CFString *)started;
      v48.length = CFStringGetLength(MutableCopy);
      v48.location = 0;
      CFStringFindAndReplace(MutableCopy, CFSTR("%1@"), v33, v48, 0);
      v34 = (const __CFString *)cf;
      v49.length = CFStringGetLength(MutableCopy);
      v49.location = 0;
      CFStringFindAndReplace(MutableCopy, CFSTR("%2@"), v34, v49, 0);
      v35 = theDict;
      CFDictionarySetValue(theDict, CFSTR("QUERY"), MutableCopy);
      if (MutableCopy)
        CFRelease(MutableCopy);
      goto LABEL_30;
    }
  }
  else
  {
LABEL_24:
    if (a5)
      goto LABEL_25;
  }
  v36 = *(const void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v35 = theDict;
  if (v36)
    CFDictionarySetValue(theDict, CFSTR("QUERY"), v36);
LABEL_30:
  CFDictionarySetValue(v35, CFSTR("TOKEN"), a2);
  v37 = v47;
  CFDictionarySetValue(v35, CFSTR("TEXT"), v47);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[5] + 8) + 40), v35);
  if (cf)
    CFRelease(cf);
  if (started)
    CFRelease(started);
  if (v35)
    CFRelease(v35);
  if (v37)
    CFRelease(v37);
}

void sub_218E9562C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  const void *v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  va_list va1;
  va_list va2;

  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  v7 = va_arg(va1, const void *);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v11 = va_arg(va2, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v5 - 72), 0);
  _Unwind_Resume(a1);
}

void QP::PhotosFormatter::~PhotosFormatter(QP::PhotosFormatter *this)
{
  QP::PhotosFormatter::~PhotosFormatter(this);
  JUMPOUT(0x219A24D0CLL);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_24DA274C0;
  v2 = *((_QWORD *)this + 25);
  *((_QWORD *)this + 25) = 0;
  if (v2)
    MEMORY[0x219A24D0C](v2, 0xC400A2AC0F1);
  QP::SpotlightFormatter::~SpotlightFormatter((const void **)this);
}

uint64_t QP::DatePeriod::isSingleYearPeriod(QP::DatePeriod *this)
{
  uint64_t result;
  int v3;

  result = QP::DateComponents::isYearOnly((QP::DatePeriod *)((char *)this + 20));
  if ((_DWORD)result)
  {
    result = QP::DateComponents::isEmpty((QP::DatePeriod *)((char *)this + 124));
    if ((_DWORD)result)
    {
      result = QP::DateComponents::isEmpty((QP::DatePeriod *)((char *)this + 72));
      if ((_DWORD)result)
      {
        v3 = *((_DWORD *)this + 4);
        return !v3 || v3 == 3;
      }
    }
  }
  return result;
}

uint64_t QP::DateComponents::isYearOnly(QP::DateComponents *this)
{
  if ((*((_DWORD *)this + 5) & 0x80000000) == 0
    && (*((_DWORD *)this + 3) & 0x80000000) != 0
    && (*((_DWORD *)this + 8) & 0x80000000) != 0
    && (*((_DWORD *)this + 4) & 0x80000000) != 0
    && (*((_DWORD *)this + 6) & 0x80000000) != 0
    && (*((_DWORD *)this + 2) & 0x80000000) != 0
    && (*((_DWORD *)this + 1) & 0x80000000) != 0
    && (*(_DWORD *)this & 0x80000000) != 0
    && (*((_DWORD *)this + 7) & 0x80000000) != 0
    && (*((_DWORD *)this + 11) & 0x80000000) != 0
    && (*((_DWORD *)this + 10) & 0x80000000) != 0
    && (*((_DWORD *)this + 9) & 0x80000000) != 0)
  {
    return *((_DWORD *)this + 12) >> 31;
  }
  else
  {
    return 0;
  }
}

const __CFString *copyLocalizedString(__CFBundle *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  return copyLocalizedStringForDomain((unint64_t)a1, 0, a2, a3, a4);
}

const __CFString *copyLocalizedStringForDomain(unint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  const __CFAllocator *v9;
  const __CFURL *v10;
  const __CFURL *v11;
  CFBundleRef v12;
  const void *v13;
  CFStringRef v14;
  const __CFString *v15;
  CFStringRef v16;
  uint64_t v17;
  const void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;

  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("/System/Library/PrivateFrameworks/QueryParser.framework"), 0);
  if (v10)
  {
    v11 = v10;
    v12 = CFBundleCreate(v9, v10);
    if (a1 | (unint64_t)v12)
    {
      v13 = v12;
      if (CFBundleGetLocalizationInfoForLocalization())
      {
        v14 = a2 ? CFStringCreateWithFormat(v9, 0, CFSTR("%@%@"), a2, a3, 0, 0) : (CFStringRef)CFRetain(a3);
        v16 = v14;
        if (v14)
        {
          v17 = CFBundleCopyLocalizationForLocalizationInfo();
          if (v17)
          {
            v18 = (const void *)v17;
            if (a1)
            {
              v19 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v19)
              {
                v15 = v19;
                if (!CFStringsAreEqual(v19, a4))
                  goto LABEL_30;
                CFRelease(v15);
              }
            }
            if (v13)
            {
              v20 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v20)
              {
                v15 = v20;
                if (!CFStringsAreEqual(v20, a4))
                  goto LABEL_30;
                CFRelease(v15);
              }
            }
            CFRelease(v18);
          }
          v18 = (const void *)CFBundleCopyLocalizationForLocalizationInfo();
          if (v18)
          {
            if (a1)
            {
              v21 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              if (v21)
              {
                v15 = v21;
                if (!CFStringsAreEqual(v21, a4))
                  goto LABEL_30;
                CFRelease(v15);
              }
            }
            if (v13)
            {
              v22 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
              v15 = v22;
              if (!v22 || !CFStringsAreEqual(v22, a4))
              {
LABEL_30:
                CFRelease(v18);
                CFRelease(v16);
                if (!v13)
                  goto LABEL_34;
                goto LABEL_33;
              }
              CFRelease(v15);
            }
          }
          v15 = 0;
          goto LABEL_30;
        }
      }
      v15 = 0;
      if (v13)
LABEL_33:
        CFRelease(v13);
    }
    else
    {
      v15 = 0;
    }
LABEL_34:
    CFRelease(v11);
    return v15;
  }
  return 0;
}

void sub_218E96C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

id createStringFromSet(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v22 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "componentsJoinedByString:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    objc_msgSend(v18, "stringWithFormat:", v22, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void *getContentsArray()
{
  void *v0;

  if (getContentsArray_onceToken != -1)
    dispatch_once(&getContentsArray_onceToken, &__block_literal_global_65);
  objc_msgSend((id)getContentsArray_instance, "contentsArray");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  return v0;
}

void __getContentsArray_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[QPAccountsManager sharedAccountsManager](QPAccountsManager, "sharedAccountsManager");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getContentsArray_instance;
  getContentsArray_instance = v0;

}

void __initEntitlements_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  BOOL v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  BOOL v13;
  CFErrorRef error;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.accounts.allaccounts"), &error);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      sPrivateAccountsEntitlement = v5;
      CFRelease(v3);
    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.private.contacts"), &error);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      sPrivateContactsEntitlement = v9;
      CFRelease(v7);
    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    if (!sPrivateContactsEntitlement)
    {
      v10 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.Contacts.database-allow"), &error);
      if (v10)
      {
        v11 = v10;
        v12 = CFGetTypeID(v10);
        v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
        sPrivateContactsEntitlement = v13;
        CFRelease(v11);
      }
      if (error)
      {
        CFRelease(error);
        error = 0;
      }
    }
    CFRelease(v1);
  }
}

void __accountsLogger_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _nlpLoggingSubsystem();
  v1 = os_log_create(v0, "QueryParserAccountsManager");
  v2 = (void *)accountsLogger_log;
  accountsLogger_log = (uint64_t)v1;

}

void QPDataDetectorsEnumerateDatesInString(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (QPDataDetectorsEnumerateDatesInString::dateDetectorsParserOnceToken != -1)
    dispatch_once(&QPDataDetectorsEnumerateDatesInString::dateDetectorsParserOnceToken, &__block_literal_global_19);
  v6 = (void *)QPDataDetectorsEnumerateDatesInString::ddParser;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __QPDataDetectorsEnumerateDatesInString_block_invoke_2;
  v8[3] = &unk_24DA275F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateDatesInString:options:withBlock:", a1, a2, v8);

}

void sub_218E973EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t getEnumValueFromIntentString(NSString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend((id)intentNameToEnumMapping, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

void sub_218E974C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t getEnumValueFromIntentArgString(NSString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend((id)argNameToEnumMapping, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

void sub_218E97524(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL nlp::BurstTrieAdd(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  const void *v18;
  unsigned int v19;
  size_t v20;
  unint64_t v21;
  int v22;
  unsigned __int16 *v23;

  if (*(_QWORD *)(a1 + 2080) || (*(_BYTE *)(a1 + 2064) & 1) != 0)
    return 0;
  v5 = 0;
  v22 = 0;
  v6 = a3 - 1;
  if ((a3 - 1) <= 0x3FE)
  {
    v7 = a4;
    if ((_DWORD)a4)
    {
      v9 = 0;
      v10 = (int *)a1;
      while (1)
      {
        v11 = *(_QWORD *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1];
        if ((v11 & 3) != 1)
          break;
        v10 = (int *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
        if (a3 == ++v9)
        {
          v12 = *v10;
          *v10 = a4;
          if (!v12)
            goto LABEL_17;
LABEL_18:
          v5 = 1;
          return v5 != 0;
        }
      }
      if ((v11 & 3) != 2)
      {
        v17 = (unsigned __int8 *)(a2 + v9);
        v18 = (const void *)(a2 + v9 + 1);
        v19 = v6 - v9;
        v20 = (v6 - v9);
        v21 = (unint64_t)malloc_type_calloc(1uLL, v20 + 15, 0xA9B8A391uLL);
        memcpy((void *)(v21 + 14), v18, v20);
        *(_BYTE *)(v21 + 14 + v19) = 0;
        *(_WORD *)(v21 + 12) = v19;
        *(_DWORD *)(v21 + 8) = v7;
        *(_QWORD *)v21 = 0;
        *(_QWORD *)&v10[2 * *v17 + 1] = v21 | 2;
        goto LABEL_17;
      }
      v23 = (unsigned __int16 *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
      v14 = nlp::addListNode(a1, &v23, a2, a3, (int)v9 + 1, a4, &v22);
      v15 = (unint64_t)v23;
      if (v14 >= *(_DWORD *)(a1 + 2088))
      {
        v15 = (unint64_t)nlp::burstLevel(a1, v23, &v22);
        v16 = 1;
      }
      else
      {
        v16 = 2;
      }
      v5 = v22;
      *(_QWORD *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1] = v16 | v15;
      if (v5 == 2)
      {
LABEL_17:
        ++*(_DWORD *)(a1 + 2060);
        goto LABEL_18;
      }
    }
  }
  return v5 != 0;
}

uint64_t nlp::TrieCompletionGetCompletion(uint64_t a1)
{
  if (a1)
    return a1 + 20;
  else
    return 0;
}

uint64_t nlp::TrieCompletionGetLength(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t nlp::TrieCompletionGetPayload(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

double nlp::BurstTrieCreateMutable(nlp *this)
{
  return nlp::BurstTrieCreateMutableWithOptions(64, 0);
}

double nlp::BurstTrieCreateMutableWithOptions(int a1, int a2)
{
  char *v4;
  double result;

  v4 = (char *)malloc_type_calloc(1uLL, 0x838uLL, 0x105004014637929uLL);
  if (v4)
  {
    result = 0.0;
    *(_OWORD *)(v4 + 2060) = 0u;
    *((_DWORD *)v4 + 519) = 1;
    *((_QWORD *)v4 + 260) = 0;
    *(_QWORD *)(v4 + 2092) = 0x200000000;
    *((_DWORD *)v4 + 516) = a2;
    *((_DWORD *)v4 + 522) = a1;
  }
  return result;
}

void nlp::BurstTrieRelease(char *a1)
{
  int v2;
  void *v3;

  if (a1)
  {
    v2 = *((_DWORD *)a1 + 519) - 1;
    *((_DWORD *)a1 + 519) = v2;
    if (!v2)
    {
      v3 = (void *)*((_QWORD *)a1 + 260);
      if (v3)
      {
        if (*((_DWORD *)a1 + 523))
          munmap(v3, *(_QWORD *)(a1 + 2068));
      }
      else if ((a1[2064] & 1) != 0)
      {
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>((uint64_t)a1);
      }
      else
      {
        nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>((uint64_t)a1);
      }
      free(a1);
    }
  }
}

void nlp::BurstTrieSearch(nlp *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  nlp *CursorWithBytes;
  nlp *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((a6 & 0x80000000) == 0)
  {
    CursorWithBytes = (nlp *)nlp::BurstTrieCreateCursorWithBytes((uint64_t)a1, a2, a3);
    if (!CursorWithBytes)
      return;
    v12 = CursorWithBytes;
    v13 = operator new(0x20uLL);
    *v13 = &off_24DA27780;
    v13[1] = a2;
    *((_DWORD *)v13 + 4) = a3;
    v13[3] = a5;
    v19 = v13;
    nlp::BurstTrieTraverseFromCursor(v12, 0, (uint64_t)v18, a6);
    v14 = v19;
    if (v19 == v18)
    {
      v15 = 4;
      v14 = v18;
    }
    else
    {
      if (!v19)
      {
LABEL_11:
        free(v12);
        return;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_11;
  }
  v20 = 0xFFFFFFFF00000003;
  v21 = 0;
  v22 = a4;
  v16 = v23;
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v23, a5);
  nlp::searchWithContext(a1, a2, a3, 0, (uint64_t)&v20);
  if (v24 == v23)
  {
    v17 = 4;
  }
  else
  {
    if (!v24)
      return;
    v17 = 5;
    v16 = v24;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v17))(v16);
}

void sub_218E97970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19)
{
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v22;
  uint64_t v23;

  v20 = v19;
  if (a19 == v20)
  {
    v22 = v20;
    v23 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v23 = 5;
    v22 = a19;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

nlp *nlp::searchWithContext(nlp *result, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  nlp *v16;
  _QWORD v17[3];
  nlp *v18;
  _QWORD v19[3];
  nlp *v20;
  _QWORD v21[3];
  nlp *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0x3FF)
  {
    v9 = (uint64_t)result;
    v10 = nlp::sharedBuffer(result);
    memcpy(v10, a2, a3);
    *((_BYTE *)v10 + a3) = 0;
    v11 = *(_QWORD *)(v9 + 2080);
    v12 = *(_DWORD *)(v9 + 2064);
    if (v11)
    {
      v13 = (*(_DWORD *)(v11 + 4) & 0xFFFFFFFC) + v11;
      if ((v12 & 1) != 0)
      {
        v21[0] = &off_24DA27668;
        v21[1] = nlp::containsKey;
        v22 = (nlp *)v21;
        nlp::searchDiskLevelRanked(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v21);
        result = v22;
        if (v22 == (nlp *)v21)
        {
          v14 = 4;
          result = (nlp *)v21;
          return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
        }
      }
      else
      {
        v19[0] = &off_24DA27668;
        v19[1] = nlp::containsKey;
        v20 = (nlp *)v19;
        nlp::searchDiskLevel(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v19);
        result = v20;
        if (v20 == (nlp *)v19)
        {
          v14 = 4;
          result = (nlp *)v19;
          return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
        }
      }
    }
    else if ((v12 & 1) != 0)
    {
      v17[0] = &off_24DA27668;
      v17[1] = nlp::containsKey;
      v18 = (nlp *)v17;
      nlp::searchLevelRanked(v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v17);
      result = v18;
      if (v18 == (nlp *)v17)
      {
        v14 = 4;
        result = (nlp *)v17;
        return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
    else
    {
      v15[0] = &off_24DA27668;
      v15[1] = nlp::containsKey;
      v16 = (nlp *)v15;
      nlp::searchLevel((int *)v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v15);
      result = v16;
      if (v16 == (nlp *)v15)
      {
        v14 = 4;
        result = (nlp *)v15;
        return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
    if (!result)
      return result;
    v14 = 5;
    return (nlp *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
  }
  return result;
}

void sub_218E97BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v21;
  char *v23;
  uint64_t v24;

  v23 = a17;
  if (a17 == v21)
  {
    v24 = 4;
    v23 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *nlp::BurstTrieCreateCursorWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  void *v6;
  int v7;

  v6 = malloc_type_calloc(0x28uLL, 1uLL, 0x82717553uLL);
  nlp::BurstTrieSetCursorWithBytes(a1, (uint64_t)v6, a2, a3);
  if (!v7 && v6)
  {
    free(v6);
    return 0;
  }
  return v6;
}

nlp *nlp::BurstTrieTraverseFromCursor(nlp *result, uint64_t a2, uint64_t a3, int a4)
{
  nlp *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  char v19;
  _BYTE v20[24];
  nlp *v21;
  _BYTE v22[24];
  nlp *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v7 = result;
    result = (nlp *)nlp::sharedBuffer(result);
    v8 = (uint64_t)result;
    v19 = 0;
    v9 = *((_DWORD *)v7 + 7);
    if (v9)
    {
      if (v9 != 1)
        return result;
      v16 = *(_OWORD *)v7;
      v17 = *((_QWORD *)v7 + 2);
      v10 = *((_QWORD *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v22, a3);
      nlp::traverseFromCompactMapCursor(v10, (uint64_t)&v16);
      result = v23;
      if (v23 == (nlp *)v22)
      {
        v14 = 4;
        result = (nlp *)v22;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
      }
    }
    else
    {
      v16 = *(_OWORD *)v7;
      v17 = *((_QWORD *)v7 + 2);
      v18 = *((_DWORD *)v7 + 6);
      v15 = (_QWORD *)*((_QWORD *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v20, a3);
      nlp::traverseFromMapCursor(v15, (uint64_t)&v16, v8, 0, &v19, a4, a2, (uint64_t)v20);
      result = v21;
      if (v21 == (nlp *)v20)
      {
        v14 = 4;
        result = (nlp *)v20;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
      }
    }
    if (!result)
      return result;
    v14 = 5;
    return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v14))(result, v11, v12, v13);
  }
  return result;
}

void sub_218E97E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v21;
  char *v23;
  uint64_t v24;

  v23 = a17;
  if (a17 == v21)
  {
    v24 = 4;
    v23 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float a7)
{
  uint64_t v7;
  uint64_t v9;
  float v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a3;
  v14 = a2;
  v12 = a4;
  v11 = a5;
  v10 = a7;
  v9 = a6;
  v7 = *(_QWORD *)(a1 + 24);
  if (!v7)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, int *, int *, float *, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v14, &v13, &v12, &v11, &v10, &v9);
}

void nlp::traverseFromCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_218E97F8C(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;

  if (a2 == *(_DWORD *)(*(_QWORD *)(v6 + 2080) + 4))
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v11, a1);
    nlp::traverseFromCompactMapCursorMappedLevel((_BYTE *)v6, v4, v3, v7, v5, v2, v10, (uint64_t)v11);
    v8 = v12;
    if (v12 == v11)
    {
      v9 = 4;
      v8 = v11;
    }
    else
    {
      if (!v12)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
}

void sub_218E986F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char *a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
  char *v28;
  uint64_t v29;

  v28 = a14;
  if (a14 == v26)
  {
    v29 = 4;
    v28 = &a11;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_BYTE *nlp::traverseFromCompactMapCursorMappedLevel(_BYTE *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, _BYTE *a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v24[24];
  _BYTE *v25;
  _BYTE v26[24];
  _BYTE *v27;
  uint64_t v28;

  v11 = result;
  v28 = *MEMORY[0x24BDAC8D0];
  v12 = (*(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *((_QWORD *)result + 260);
  if ((result[2064] & 1) == 0)
  {
    if (*(_DWORD *)(v12 + 1024))
    {
      *(_BYTE *)(a3 + a5) = 0;
      result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, 0.0);
      if (a5 >= a4 || *a6)
        return result;
    }
    else if (a5 >= a4)
    {
      return result;
    }
    v13 = 0;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v13;
      *(_QWORD *)a2 = *(unsigned int *)(v12 + 4 * v13);
      *(_QWORD *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 16) = 0;
      if (v13)
        v14 = a5 + 1;
      else
        v14 = a5;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v24, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v13 != 0), v14, a6, a7, v24);
      result = v25;
      if (v25 == v24)
      {
        result = v24;
        v15 = 4;
      }
      else
      {
        if (!v25)
          goto LABEL_20;
        v15 = 5;
      }
      result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v15))();
LABEL_20:
      if (!*a6)
      {
        v16 = v13++ == 255;
        if (!v16)
          continue;
      }
      return result;
    }
  }
  if (!*(_DWORD *)(v12 + 1024))
  {
    if (a5 >= a4)
      return result;
    goto LABEL_25;
  }
  *(_BYTE *)(a3 + a5) = 0;
  result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(a8, a7, a3, 0, *(_DWORD *)(v12 + 1024), (uint64_t)a6, *(float *)(v12 + 1032));
  if (a5 < a4 && !*a6)
  {
LABEL_25:
    v17 = 0;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v17;
      *(_QWORD *)a2 = *(unsigned int *)(v12 + 4 * v17);
      if (v17)
        v18 = a5 + 1;
      else
        v18 = a5;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v26, a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v17 != 0), v18, a6, a7, v26);
      result = v27;
      if (v27 == v26)
      {
        result = v26;
        v19 = 4;
      }
      else
      {
        if (!v27)
          goto LABEL_34;
        v19 = 5;
      }
      result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v19))();
LABEL_34:
      if (!*a6)
      {
        v16 = v17++ == 255;
        if (!v16)
          continue;
      }
      return result;
    }
  }
  return result;
}

void sub_218E98AAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  char *v20;
  uint64_t v21;

  v20 = a19;
  if (a19 == &a16)
  {
    v21 = 4;
    v20 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieSetCursorWithBytes(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  __n128 v7;

  if (a1 && a2)
  {
    if (nlp::burstTrieSetCursor(a1, a2))
      nlp::BurstTrieCursorAdvanceWithBytes(a2, a3, a4, v7);
  }
}

uint64_t nlp::burstTrieSetCursor(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t result;
  uint64_t v4;

  if (!a2)
    return 0;
  *(_QWORD *)(a2 + 32) = a1;
  v2 = *(_DWORD **)(a1 + 2080);
  if (v2)
  {
    if (*v2 == -900339842 || *v2 == 12648430 && v2[7] == 2)
    {
      result = 1;
      *(_DWORD *)(a2 + 28) = 1;
      v4 = v2[1];
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = v4;
      return result;
    }
    return 0;
  }
  *(_DWORD *)(a2 + 28) = 0;
  *(_QWORD *)(a2 + 8) = a1 | 1;
  *(_QWORD *)(a2 + 16) = 0;
  return 1;
}

void nlp::BurstTrieCursorAdvanceWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3, __n128 a4)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 28);
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = *(_QWORD *)a1;
        v7 = *(_QWORD *)(a1 + 8);
        v8 = *(_DWORD *)(a1 + 16);
        v9 = *(_DWORD *)(a1 + 20);
        nlp::advanceCompactMapCursor(*(_QWORD *)(a1 + 32), a1);
        if (!v10)
        {
          *(_QWORD *)a1 = v6;
          *(_QWORD *)(a1 + 8) = v7;
          *(_DWORD *)(a1 + 16) = v8;
          *(_DWORD *)(a1 + 20) = v9;
        }
      }
    }
    else
    {
      v12 = *(_QWORD *)a1;
      v11 = *(_QWORD *)(a1 + 8);
      v13 = *(_QWORD *)(a1 + 16);
      v14 = *(_DWORD *)(a1 + 24);
      if (!nlp::advanceMapCursor(*(_QWORD *)(a1 + 32), a1, a2, a3, a4))
      {
        *(_QWORD *)a1 = v12;
        *(_QWORD *)(a1 + 8) = v11;
        *(_QWORD *)(a1 + 16) = v13;
        *(_DWORD *)(a1 + 24) = v14;
      }
    }
  }
}

void nlp::advanceCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

BOOL sub_218E98CF0@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned __int8 *v3;
  uint64_t v4;

  return a1 == *(_DWORD *)(*(_QWORD *)(v4 + 2080) + 4)
      && nlp::advanceCompactMapCursorMappedLevel(v4, v1, v3, v2) != 0;
}

uint64_t nlp::advanceMapCursor(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v9;
  _DWORD *v10;
  uint64_t *v11;
  int v12;

  v9 = *(_QWORD *)(a2 + 8);
  if ((v9 & 3) == 2)
  {
    v12 = nlp::advanceMapCursorTrieList(a1, a2, a3, a4, a5);
    return v12 != 0;
  }
  if ((v9 & 3) != 1)
    return 0;
  v10 = (_DWORD *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (a4)
    {
      v11 = (uint64_t *)&v10[2 * *a3 + 3];
      goto LABEL_10;
    }
    *(_DWORD *)(a2 + 20) = v10[2];
    *(_DWORD *)(a2 + 24) = v10[1];
  }
  else
  {
    if (a4)
    {
      v11 = (uint64_t *)&v10[2 * *a3 + 1];
LABEL_10:
      nlp::updateMapCursorPointer(a1, a2, *v11);
      v12 = nlp::advanceMapCursor(a1, a2, a3 + 1, a4 - 1);
      return v12 != 0;
    }
    *(_DWORD *)(a2 + 20) = *v10;
  }
  return 1;
}

void *nlp::sharedBuffer(nlp *this)
{
  unsigned __int8 v1;
  void *v2;
  pthread_key_t v4;

  {
    v4 = 0;
    pthread_key_create(&v4, (void (__cdecl *)(void *))MEMORY[0x24BDAE450]);
    nlp::sharedBuffer(void)::key = v4;
  }
  v2 = pthread_getspecific(nlp::sharedBuffer(void)::key);
  if (!v2)
  {
    v2 = malloc_type_malloc(0x1000uLL, 0xCD357DB2uLL);
    pthread_setspecific(nlp::sharedBuffer(void)::key, v2);
  }
  return v2;
}

void sub_218E99318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_QWORD *nlp::traverseFromMapCursor(_QWORD *result, uint64_t a2, uint64_t a3, unsigned int a4, _BYTE *a5, int a6, uint64_t a7, uint64_t a8)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD v60[3];
  _QWORD *v61;
  _BYTE v62[24];
  _BYTE *v63;
  _QWORD v64[3];
  _QWORD *v65;
  _QWORD v66[3];
  _QWORD *v67;
  _BYTE v68[24];
  _BYTE *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v13 = *((_DWORD *)result + 516);
  v14 = *(_QWORD *)(a2 + 8) & 3;
  if (v14 != 2)
  {
    if (v14 != 1)
      return result;
    v15 = (uint64_t)result;
    if ((v13 & 1) == 0)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v64, a8);
      v16 = (int *)(*(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      if (*v16)
      {
        std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v64, a7, a3, a4, *v16, (uint64_t)a5, *(float *)(a2 + 24));
        if (!a6 || *a5)
          goto LABEL_85;
      }
      else if (!a6)
      {
        goto LABEL_85;
      }
      v48 = 0;
      v49 = (a6 - 1);
      while (1)
      {
        *(_BYTE *)(a3 + a4) = v48;
        nlp::updateMapCursorPointer(v15, a2, *(_QWORD *)&v16[2 * v48 + 1]);
        v50 = (uint64_t)v65;
        if (!v65)
          goto LABEL_59;
        if (v65 != v64)
          break;
        v69 = v68;
        (*(void (**)(_QWORD *, _BYTE *))(v64[0] + 24))(v64, v68);
LABEL_61:
        nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v49, a7, v68);
        v51 = v69;
        if (v69 == v68)
        {
          v51 = v68;
          v52 = 4;
        }
        else
        {
          if (!v69)
            goto LABEL_66;
          v52 = 5;
        }
        (*(void (**)(void))(*v51 + 8 * v52))();
LABEL_66:
        if (!*a5)
        {
          v53 = v48++ == 255;
          if (!v53)
            continue;
        }
        goto LABEL_85;
      }
      v50 = (*(uint64_t (**)(void))(*v65 + 16))();
LABEL_59:
      v69 = (_BYTE *)v50;
      goto LABEL_61;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v66, a8);
    v33 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    v34 = *(_DWORD *)(v33 + 8);
    if (v34)
    {
      std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v66, a7, a3, a4, v34, (uint64_t)a5, *(float *)(a2 + 24));
      if (!a6 || *a5)
      {
LABEL_85:
        if ((v13 & 1) != 0)
        {
          result = v67;
          if (v67 != v66)
            goto LABEL_89;
          v47 = 4;
          result = v66;
        }
        else
        {
          result = v65;
          if (v65 != v64)
            goto LABEL_89;
          v47 = 4;
          result = v64;
        }
        return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
      }
    }
    else if (!a6)
    {
      goto LABEL_85;
    }
    v54 = 0;
    v55 = (a6 - 1);
    while (1)
    {
      *(_BYTE *)(a3 + a4) = v54;
      nlp::updateMapCursorPointer(v15, a2, *(_QWORD *)(v33 + 12 + 8 * v54));
      v56 = (uint64_t)v67;
      if (!v67)
        goto LABEL_75;
      if (v67 != v66)
        break;
      v69 = v68;
      (*(void (**)(_QWORD *, _BYTE *))(v66[0] + 24))(v66, v68);
LABEL_77:
      nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v55, a7, v68);
      v57 = v69;
      if (v69 == v68)
      {
        v57 = v68;
        v58 = 4;
      }
      else
      {
        if (!v69)
          goto LABEL_82;
        v58 = 5;
      }
      (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_82:
      if (!*a5)
      {
        v53 = v54++ == 255;
        if (!v53)
          continue;
      }
      goto LABEL_85;
    }
    v56 = (*(uint64_t (**)(void))(*v67 + 16))();
LABEL_75:
    v69 = (_BYTE *)v56;
    goto LABEL_77;
  }
  if ((v13 & 1) != 0)
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v62, a8);
    v35 = *(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL;
    if (v35)
    {
      v36 = (unsigned __int8 *)(v35 + 22);
      v37 = *(unsigned int *)(a2 + 16);
      while (1)
      {
        v38 = *(unsigned __int16 *)(v35 + 20);
        if (v38 >= v37)
        {
          v39 = v38 - (int)v37;
          if (a6 < 0 || (int)v39 <= a6)
          {
            if ((_DWORD)v37)
            {
              v40 = (unsigned __int8 *)(v35 + 22);
              v41 = v36;
              v42 = v37;
              while (1)
              {
                v44 = *v40++;
                v43 = v44;
                v45 = *v41++;
                if (v43 != v45)
                  break;
                if (!--v42)
                  goto LABEL_47;
              }
            }
            else
            {
LABEL_47:
              v46 = v39 + a4;
              memcpy((void *)(a3 + a4), (const void *)(v35 + v37 + 22), v39);
              *(_BYTE *)(a3 + v46) = 0;
              std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v62, a7, a3, v46, *(_DWORD *)(v35 + 16), (uint64_t)a5, *(float *)(v35 + 12));
            }
          }
        }
        v35 = *(_QWORD *)v35;
        if (!v35)
          goto LABEL_49;
      }
    }
    goto LABEL_52;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
  v17 = v13;
  v18 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  v19 = *(unsigned int *)(a2 + 16);
  if (v19 > *(unsigned __int16 *)(v18 + 12))
    __assert_rtn("traverseFromMapCursorTrieList", "BurstTrie.cpp", 1956, "cursor.prfxlen <= head->restlen");
  if (!v18)
    goto LABEL_33;
  v20 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  while (1)
  {
    if (v20 == v18)
    {
      v21 = *(unsigned __int16 *)(v18 + 12);
      goto LABEL_20;
    }
    v21 = *(unsigned __int16 *)(v20 + 12);
    if (v21 <= (unsigned __int16)v19)
      goto LABEL_33;
    if ((_DWORD)v19)
      break;
LABEL_20:
    v28 = v21 - v19;
    if ((a6 & 0x80000000) == 0 && v28 > a6)
      goto LABEL_32;
    v29 = v28 + a4;
    memcpy((void *)(a3 + a4), (const void *)(v20 + v19 + 14), v28);
    *(_BYTE *)(a3 + v29) = 0;
    v30 = (uint64_t)v61;
    if (!v61)
      goto LABEL_25;
    if (v61 != v60)
    {
      v30 = (*(uint64_t (**)(void))(*v61 + 16))();
LABEL_25:
      v69 = (_BYTE *)v30;
      goto LABEL_27;
    }
    v69 = v68;
    (*(void (**)(_QWORD *, _BYTE *))(v60[0] + 24))(v60, v68);
LABEL_27:
    std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()((uint64_t)v68, a7, a3, v29, *(_DWORD *)(v20 + 8), (uint64_t)a5, 0.0);
    v31 = v69;
    if (v69 == v68)
    {
      v31 = v68;
      v32 = 4;
      goto LABEL_31;
    }
    if (v69)
    {
      v32 = 5;
LABEL_31:
      (*(void (**)(void))(*v31 + 8 * v32))();
    }
LABEL_32:
    v20 = *(_QWORD *)v20;
    if (!v20)
      goto LABEL_33;
  }
  v22 = (unsigned __int8 *)(v20 + 14);
  v23 = (unsigned __int8 *)(v18 + 14);
  v24 = v19;
  while (1)
  {
    v26 = *v22++;
    v25 = v26;
    v27 = *v23++;
    if (v25 != v27)
      break;
    if (!--v24)
      goto LABEL_20;
  }
LABEL_33:
  LOBYTE(v13) = v17;
LABEL_49:
  if ((v13 & 1) != 0)
  {
LABEL_52:
    result = v63;
    if (v63 != v62)
      goto LABEL_89;
    v47 = 4;
    result = v62;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
  result = v61;
  if (v61 == v60)
  {
    v47 = 4;
    result = v60;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
LABEL_89:
  if (result)
  {
    v47 = 5;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }
  return result;
}

void sub_218E998F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char *a28)
{
  char *v29;
  uint64_t v30;

  v29 = a28;
  if (a28 == &a25)
  {
    v30 = 4;
    v29 = &a25;
  }
  else
  {
    if (!a28)
      goto LABEL_6;
    v30 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v29 + 8 * v30))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  for (i = 0; i != 256; ++i)
  {
    v3 = a1 + 8 * i;
    v6 = *(_QWORD *)(v3 + 12);
    v5 = (_QWORD *)(v3 + 12);
    v4 = v6;
    v7 = v6 & 3;
    if (v7 == 2)
    {
      v8 = (_QWORD *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        v9 = (_QWORD *)*v8;
        free(v8);
        v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

void nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  for (i = 0; i != 256; ++i)
  {
    v3 = a1 + 8 * i;
    v6 = *(_QWORD *)(v3 + 4);
    v5 = (_QWORD *)(v3 + 4);
    v4 = v6;
    v7 = v6 & 3;
    if (v7 == 2)
    {
      v8 = (_QWORD *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        v9 = (_QWORD *)*v8;
        free(v8);
        v8 = v9;
      }
      while (v9);
    }
    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }
}

uint64_t nlp::addListNode(uint64_t a1, _QWORD *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int *a7)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  const void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  size_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  size_t v27;
  char *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v36;
  uint64_t v37;
  int *v38;

  v12 = a2;
  v13 = a1;
  v14 = (uint64_t *)*a2;
  v15 = malloc_type_calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1), 0x8E39A38EuLL);
  v16 = (const void *)(a3 + a5);
  if (v14)
  {
    v36 = v12;
    v37 = v13;
    v38 = a7;
    v17 = 0;
    v18 = 1;
LABEL_3:
    v19 = a6;
    v20 = 0;
    v21 = v17;
    v22 = &v15[v17];
    do
    {
      v23 = *((unsigned __int16 *)v14 + 6);
      if ((_DWORD)v23 + a5 == a4 && !memcmp(v16, (char *)v14 + 14, v23))
      {
        v18 = 0;
        a6 = v19;
        *((_DWORD *)v14 + 2) = v19;
        v17 = v21 + v20 + 1;
        v15[v21 + v20] = v14;
        v14 = (uint64_t *)*v14;
        if (v14)
          goto LABEL_3;
        v24 = (v21 + v20 + 1);
        v25 = 1;
        goto LABEL_15;
      }
      v22[v20] = v14;
      v14 = (uint64_t *)*v14;
      ++v20;
    }
    while (v14);
    v26 = v21 + v20;
    if ((v18 & 1) != 0)
    {
      v13 = v37;
      a7 = v38;
      LODWORD(a6) = v19;
      v12 = v36;
      goto LABEL_13;
    }
    v25 = 1;
    v24 = v26;
LABEL_15:
    v13 = v37;
    a7 = v38;
    v12 = v36;
  }
  else
  {
    LODWORD(v26) = 0;
LABEL_13:
    v27 = a4 - a5;
    v28 = (char *)malloc_type_calloc(1uLL, v27 + 15, 0xA9B8A391uLL);
    memcpy(v28 + 14, v16, v27);
    v28[v27 + 14] = 0;
    *((_WORD *)v28 + 6) = v27;
    *((_DWORD *)v28 + 2) = a6;
    v24 = (v26 + 1);
    v25 = 2;
    *(_QWORD *)v28 = 0;
    v15[v26] = v28;
  }
  qsort(v15, (int)v24, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
  v29 = (_QWORD *)*v15;
  v30 = (_QWORD *)*v15;
  if ((int)v24 >= 2)
  {
    v31 = v15 + 1;
    v32 = v24 - 1;
    v33 = (_QWORD *)*v15;
    do
    {
      v34 = (_QWORD *)*v31++;
      v30 = v34;
      *v33 = v34;
      v33 = v34;
      --v32;
    }
    while (v32);
  }
  *v30 = 0;
  *v12 = v29;
  free(v15);
  *a7 = v25;
  if (v24 > *(_DWORD *)(v13 + 2088))
    nlp::addListNode();
  return v24;
}

_DWORD *nlp::burstLevel(uint64_t a1, unsigned __int16 *a2, int *a3)
{
  _DWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unint64_t v19;

  v6 = malloc_type_calloc(1uLL, 0x804uLL, 0x10000406A7154B6uLL);
  if (a2)
  {
    do
    {
      v7 = a2[6];
      v8 = *((unsigned int *)a2 + 2);
      if (a2[6])
      {
        v9 = *(_QWORD *)&v6[2 * *((unsigned __int8 *)a2 + 14) + 1];
        if (v9)
        {
          v19 = v9 & 0xFFFFFFFFFFFFFFFCLL;
          v10 = nlp::addListNode(a1, &v19, (uint64_t)(a2 + 7), v7, 1u, v8, a3);
          v11 = v19;
          if (v10 >= *(_DWORD *)(a1 + 2088))
          {
            v11 = nlp::burstLevel(a1, v19, a3);
            v12 = 1;
          }
          else
          {
            v12 = 2;
          }
          v15 = v12 | v11;
          v16 = *((unsigned __int8 *)a2 + 14);
        }
        else
        {
          v13 = (v7 - 1);
          v14 = (unint64_t)malloc_type_calloc(1uLL, v13 + 15, 0xA9B8A391uLL);
          memcpy((void *)(v14 + 14), (char *)a2 + 15, v13);
          *(_BYTE *)(v14 + 14 + v13) = 0;
          *(_WORD *)(v14 + 12) = v13;
          *(_DWORD *)(v14 + 8) = v8;
          *(_QWORD *)v14 = 0;
          v15 = v14 | 2;
          v16 = *((unsigned __int8 *)a2 + 14);
        }
        *(_QWORD *)&v6[2 * v16 + 1] = v15;
      }
      else
      {
        *v6 = v8;
      }
      v17 = *(unsigned __int16 **)a2;
      free(a2);
      a2 = v17;
    }
    while (v17);
  }
  return v6;
}

uint64_t nlp::nodeStringCompare(nlp *this, _QWORD *a2, const void *a3)
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  size_t v10;
  uint64_t result;

  v3 = *(_QWORD *)this;
  v4 = *a2;
  v5 = (const void *)(*(_QWORD *)this + 14);
  v6 = (const void *)(*a2 + 14);
  v7 = *(unsigned __int16 *)(v3 + 12);
  v8 = *(unsigned __int16 *)(v4 + 12);
  v9 = v7 - v8;
  if ((int)v7 >= (int)v8)
    v10 = v8;
  else
    v10 = v7;
  LODWORD(result) = memcmp(v5, v6, v10);
  if ((_DWORD)result)
    return result;
  else
    return v9;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x219A24D0CLL);
}

uint64_t nlp::searchDiskLevelRanked(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  int v21;
  _DWORD *v22;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v38;
  _BYTE v39[24];
  _BYTE *v40;
  _BYTE v41[24];
  _BYTE *v42;
  _BYTE v43[24];
  _BYTE *v44;
  _BYTE v45[24];
  _BYTE *v46;
  _BYTE v47[24];
  _BYTE *v48;
  _BYTE v49[24];
  _BYTE *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  if (a5 >= a4)
  {
    v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      v21 = *(_DWORD *)(a2 + 1032);
      v22 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v22, 1, (uint64_t)&v38);
      if (v22[3]-- == 1)
        free(v22);
      if (v38)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v38 != 0;
    v25 = 0;
    v26 = (a4 + 1);
    while (1)
    {
      v27 = *(_DWORD *)(a2 + 4 * v25);
      a3[a5] = v25;
      v28 = v27 & 3;
      switch(v28)
      {
        case 3:
          v32 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v41, a8);
          v30 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v27 & 0xFFFFFFFC) + v32), a3, v26, a5 + 1, 0, a7, (uint64_t)v41);
          v38 = v30;
          v31 = v42;
          if (v42 == v41)
          {
            v31 = v41;
LABEL_26:
            v34 = 4;
            goto LABEL_27;
          }
          break;
        case 2:
          v33 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v39, a8);
          v30 = nlp::searchDiskPageRanked((unsigned int *)((v27 & 0xFFFFFFFC) + v33), a3, v26, a5 + 1, 0, a7, (uint64_t)v39);
          v38 = v30;
          v31 = v40;
          if (v40 == v39)
          {
            v31 = v39;
            goto LABEL_26;
          }
          break;
        case 1:
          v29 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v43, a8);
          v30 = nlp::searchDiskLevelRanked(a1, (v27 & 0xFFFFFFFC) + v29, a3, v26, a5 + 1, 0, a7, v43);
          v38 = v30;
          v31 = v44;
          if (v44 == v43)
          {
            v31 = v43;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_28;
      }
      if (v31)
      {
        v34 = 5;
LABEL_27:
        (*(void (**)(_BYTE *))(*(_QWORD *)v31 + 8 * v34))(v31);
LABEL_28:
        v30 = v38;
      }
      if (v30)
        return 1;
      if (++v25 == 256)
        return v38 != 0;
    }
  }
  v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
  v16 = v15 & 3;
  switch(v16)
  {
    case 3:
      v35 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v47, a8);
      v38 = nlp::searchCompactDiskLevelRanked(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v35), a3, a4, a5 + 1, a6, a7, (uint64_t)v47);
      v18 = v48;
      if (v48 == v47)
      {
        v19 = 4;
        v18 = v47;
        goto LABEL_38;
      }
      break;
    case 2:
      v36 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v45, a8);
      v38 = nlp::searchDiskPageRanked((unsigned int *)((v15 & 0xFFFFFFFC) + v36), a3, a4, a5 + 1, a6, a7, (uint64_t)v45);
      v18 = v46;
      if (v46 == v45)
      {
        v19 = 4;
        v18 = v45;
        goto LABEL_38;
      }
      break;
    case 1:
      v17 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v49, a8);
      v38 = nlp::searchDiskLevelRanked(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v49);
      v18 = v50;
      if (v50 == v49)
      {
        v19 = 4;
        v18 = v49;
LABEL_38:
        (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
        return v38 != 0;
      }
      break;
    default:
      return v38 != 0;
  }
  if (v18)
  {
    v19 = 5;
    goto LABEL_38;
  }
  return v38 != 0;
}

void sub_218E9A320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;

  v31 = *(_QWORD **)(v28 + 56);
  if (v31 == v27)
  {
    v32 = 4;
    v31 = (_QWORD *)(v29 - 144);
  }
  else
  {
    if (!v31)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::containsKey(uint64_t result, _DWORD *a2, int a3, _BYTE *a4)
{
  char v5;

  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
LABEL_5:
      *(_DWORD *)(result + 4) = a2[2];
      *(_DWORD *)(result + 8) = *a2;
LABEL_8:
      *a4 = 1;
      return result;
    }
    if (!*(_DWORD *)result)
    {
      if (!a3)
        return result;
      goto LABEL_5;
    }
    v5 = 0;
    if (*(_QWORD *)(result + 48))
    {
      result = std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(result + 24, *(_QWORD *)(result + 16), (uint64_t)a2, (uint64_t)&v5);
      if (v5)
        goto LABEL_8;
    }
  }
  return result;
}

uint64_t nlp::searchDiskLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  _DWORD *v21;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  _BYTE v48[24];
  _BYTE *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  if (a5 >= a4)
  {
    v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      v21 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *v21 = 0;
      v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v21, 1, (uint64_t)&v37);
      if (v21[3]-- == 1)
        free(v21);
      if (v37)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v37 != 0;
    v24 = 0;
    v25 = (a4 + 1);
    while (1)
    {
      v26 = *(_DWORD *)(a2 + 4 * v24);
      a3[a5] = v24;
      v27 = v26 & 3;
      switch(v27)
      {
        case 3:
          v31 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v40, a8);
          v29 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v26 & 0xFFFFFFFC) + v31), a3, v25, a5 + 1, 0, a7, (uint64_t)v40);
          v37 = v29;
          v30 = v41;
          if (v41 == v40)
          {
            v30 = v40;
LABEL_26:
            v33 = 4;
            goto LABEL_27;
          }
          break;
        case 2:
          v32 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v38, a8);
          v29 = nlp::searchDiskPage(a1, (unsigned int *)((v26 & 0xFFFFFFFC) + v32), (char *)a3, v25, a5 + 1, 0, a7, (uint64_t)v38);
          v37 = v29;
          v30 = v39;
          if (v39 == v38)
          {
            v30 = v38;
            goto LABEL_26;
          }
          break;
        case 1:
          v28 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v42, a8);
          v29 = nlp::searchDiskLevel(a1, (v26 & 0xFFFFFFFC) + v28, a3, v25, a5 + 1, 0, a7, v42);
          v37 = v29;
          v30 = v43;
          if (v43 == v42)
          {
            v30 = v42;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_28;
      }
      if (v30)
      {
        v33 = 5;
LABEL_27:
        (*(void (**)(void))(*(_QWORD *)v30 + 8 * v33))();
LABEL_28:
        v29 = v37;
      }
      if (v29)
        return 1;
      if (++v24 == 256)
        return v37 != 0;
    }
  }
  v15 = *(_DWORD *)(a2 + 4 * a3[a5]);
  v16 = v15 & 3;
  switch(v16)
  {
    case 3:
      v34 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v46, a8);
      v37 = nlp::searchCompactDiskLevel(a1, (int8x8_t *)((v15 & 0xFFFFFFFC) + v34), a3, a4, a5 + 1, a6, a7, (uint64_t)v46);
      v18 = v47;
      if (v47 == v46)
      {
        v19 = 4;
        v18 = v46;
        goto LABEL_38;
      }
      break;
    case 2:
      v35 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v44, a8);
      v37 = nlp::searchDiskPage(a1, (unsigned int *)((v15 & 0xFFFFFFFC) + v35), (char *)a3, a4, a5 + 1, a6, a7, (uint64_t)v44);
      v18 = v45;
      if (v45 == v44)
      {
        v19 = 4;
        v18 = v44;
        goto LABEL_38;
      }
      break;
    case 1:
      v17 = *(_QWORD *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v48, a8);
      v37 = nlp::searchDiskLevel(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v48);
      v18 = v49;
      if (v49 == v48)
      {
        v19 = 4;
        v18 = v48;
LABEL_38:
        (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
        return v37 != 0;
      }
      break;
    default:
      return v37 != 0;
  }
  if (v18)
  {
    v19 = 5;
    goto LABEL_38;
  }
  return v37 != 0;
}

void sub_218E9A864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;

  v31 = *(_QWORD **)(v28 + 56);
  if (v31 == v27)
  {
    v32 = 4;
    v31 = (_QWORD *)(v29 - 128);
  }
  else
  {
    if (!v31)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevelRanked(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  int v19;
  _DWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE *v27;
  uint64_t v28;
  unsigned __int8 v30;
  _BYTE v31[24];
  _BYTE *v32;
  _BYTE v33[24];
  _BYTE *v34;
  _BYTE v35[24];
  _BYTE *v36;
  _BYTE v37[24];
  _BYTE *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  if (a4 >= a3)
  {
    v18 = *(_DWORD *)(a1 + 8);
    if (v18)
    {
      v19 = *(_DWORD *)(a1 + 4);
      v20 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v20[4] = a4;
      *((_BYTE *)v20 + a4 + 20) = 0;
      memcpy(v20 + 5, a2, a4);
      v20[2] = v18;
      *v20 = v19;
      v20[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v20, 1, (uint64_t)&v30);
      v21 = v20[3]-- == 1;
      if (v21)
        free(v20);
      v15 = v30 != 0;
      if (v30 || (a5 & 1) != 0)
        return v15;
    }
    else if ((a5 & 1) != 0)
    {
      return 0;
    }
    v22 = 0;
    v23 = (a3 + 1);
    v24 = a1 + 12;
    while (1)
    {
      v25 = *(_QWORD *)(v24 + 8 * v22);
      a2[a4] = v22;
      if ((v25 & 3) == 2)
        break;
      if ((v25 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v33, a7);
        v26 = nlp::searchLevelRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0, a6, v33);
        v30 = v26;
        v27 = v34;
        if (v34 == v33)
        {
          v27 = v33;
          goto LABEL_24;
        }
LABEL_21:
        if (!v27)
          goto LABEL_27;
        v28 = 5;
        goto LABEL_25;
      }
LABEL_26:
      v26 = v30;
LABEL_27:
      v15 = v26 != 0;
      if (!v26)
      {
        v21 = v22++ == 255;
        if (!v21)
          continue;
      }
      return v15;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v31, a7);
    v26 = nlp::searchListRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0, a6, (uint64_t)v31);
    v30 = v26;
    v27 = v32;
    if (v32 != v31)
      goto LABEL_21;
    v27 = v31;
LABEL_24:
    v28 = 4;
LABEL_25:
    (*(void (**)(_BYTE *))(*(_QWORD *)v27 + 8 * v28))(v27);
    goto LABEL_26;
  }
  v14 = *(_QWORD *)(a1 + 8 * a2[a4] + 12);
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v37, a7);
      v15 = nlp::searchLevelRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v37);
      v16 = v38;
      if (v38 == v37)
      {
        v17 = 4;
        v16 = v37;
LABEL_35:
        (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
        return v15;
      }
      goto LABEL_32;
    }
    return 0;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v35, a7);
  v15 = nlp::searchListRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v35);
  v16 = v36;
  if (v36 == v35)
  {
    v17 = 4;
    v16 = v35;
    goto LABEL_35;
  }
LABEL_32:
  if (v16)
  {
    v17 = 5;
    goto LABEL_35;
  }
  return v15;
}

void sub_218E9AC4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
  char *v28;
  uint64_t v29;

  v28 = a22;
  if (a22 == v26)
  {
    v29 = 4;
    v28 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevel(int *a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  int v25;
  _BYTE *v26;
  uint64_t v27;
  unsigned __int8 v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  _BYTE v36[24];
  _BYTE *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  if (a4 >= a3)
  {
    v18 = *a1;
    if (*a1)
    {
      v19 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v19[4] = a4;
      *((_BYTE *)v19 + a4 + 20) = 0;
      memcpy(v19 + 5, a2, a4);
      v19[2] = v18;
      *v19 = 0;
      v19[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v19, 1, (uint64_t)&v29);
      v20 = v19[3]-- == 1;
      if (v20)
        free(v19);
      v15 = v29 != 0;
      if (v29 || (a5 & 1) != 0)
        return v15;
    }
    else if ((a5 & 1) != 0)
    {
      return 0;
    }
    v21 = 0;
    v22 = (a3 + 1);
    v23 = a1 + 1;
    while (1)
    {
      v24 = *(_QWORD *)&v23[2 * v21];
      a2[a4] = v21;
      if ((v24 & 3) == 2)
        break;
      if ((v24 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v32, a7);
        v25 = nlp::searchLevel(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0, a6, v32);
        v29 = v25;
        v26 = v33;
        if (v33 == v32)
        {
          v26 = v32;
          goto LABEL_24;
        }
LABEL_21:
        if (!v26)
          goto LABEL_27;
        v27 = 5;
        goto LABEL_25;
      }
LABEL_26:
      v25 = v29;
LABEL_27:
      v15 = v25 != 0;
      if (!v25)
      {
        v20 = v21++ == 255;
        if (!v20)
          continue;
      }
      return v15;
    }
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v30, a7);
    v25 = nlp::searchList(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0, a6, (uint64_t)v30);
    v29 = v25;
    v26 = v31;
    if (v31 != v30)
      goto LABEL_21;
    v26 = v30;
LABEL_24:
    v27 = 4;
LABEL_25:
    (*(void (**)(_BYTE *))(*(_QWORD *)v26 + 8 * v27))(v26);
    goto LABEL_26;
  }
  v14 = *(_QWORD *)&a1[2 * a2[a4] + 1];
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v36, a7);
      v15 = nlp::searchLevel(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v36);
      v16 = v37;
      if (v37 == v36)
      {
        v17 = 4;
        v16 = v36;
LABEL_35:
        (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
        return v15;
      }
      goto LABEL_32;
    }
    return 0;
  }
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v34, a7);
  v15 = nlp::searchList(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v34);
  v16 = v35;
  if (v35 == v34)
  {
    v17 = 4;
    v16 = v34;
    goto LABEL_35;
  }
LABEL_32:
  if (v16)
  {
    v17 = 5;
    goto LABEL_35;
  }
  return v15;
}

void sub_218E9AFEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char *a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  char *v25;
  char *v27;
  uint64_t v28;

  v27 = a21;
  if (a21 == v25)
  {
    v28 = 4;
    v27 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_6;
    v28 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchCompactDiskLevelRanked(uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  int v19;
  __int32 v20;
  __int32 v21;
  _DWORD *v22;
  unint64_t v25;
  uint64_t v26;
  int8x8_t v27;
  int v28;
  int8x8_t *v29;
  int8x8_t v30;
  uint8x8_t v31;
  uint8x8_t v32;
  __int32 v33;
  int v34;
  uint64_t v35;
  int v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int8x8_t *v41;
  int8x8_t v42;
  uint8x8_t v43;
  uint8x8_t v44;
  __int32 v45;
  int v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned __int8 v54;
  _BYTE v55[24];
  _BYTE *v56;
  _BYTE v57[24];
  _BYTE *v58;
  _BYTE v59[24];
  _BYTE *v60;
  _BYTE v61[24];
  _BYTE *v62;
  _BYTE v63[24];
  _BYTE *v64;
  _BYTE v65[24];
  _BYTE *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  if (a5 >= a4)
  {
    v20 = a2[5].i32[0];
    if (v20)
    {
      v21 = a2[4].i32[1];
      v22 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v22, 1, (uint64_t)&v54);
      if (v22[3]-- == 1)
        free(v22);
      if (v54)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v54 != 0;
    v25 = 0;
    v52 = a4 + 1;
    while (1)
    {
      if (v25 >> 6 <= 1)
        v26 = 1;
      else
        v26 = v25 >> 6;
      v27 = a2[v25 >> 6];
      if ((*(_QWORD *)&v27 & (1 << v25)) == 0)
        goto LABEL_34;
      if (v25 >= 0x40)
      {
        v28 = 0;
        v29 = a2;
        do
        {
          v30 = *v29++;
          v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v28 += v31.i32[0];
          --v26;
        }
        while (v26);
      }
      else
      {
        v28 = 0;
      }
      v32 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v27 & ((1 << v25) - 1)));
      v32.i16[0] = vaddlv_u8(v32);
      v33 = a2[5].i32[v28 + v32.i32[0] + 1];
      a3[a5] = v25;
      v34 = v33 & 3;
      switch(v34)
      {
        case 1:
          v38 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v59, a8);
          v36 = nlp::searchDiskLevelRanked(a1, v38 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0, a7, v59);
          v54 = v36;
          v37 = v60;
          if (v60 == v59)
          {
            v37 = v59;
LABEL_32:
            v40 = 4;
            goto LABEL_33;
          }
          break;
        case 2:
          v39 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v55, a8);
          v36 = nlp::searchDiskPageRanked((unsigned int *)(v39 + (v33 & 0xFFFFFFFC)), a3, v52, a5 + 1, 0, a7, (uint64_t)v55);
          v54 = v36;
          v37 = v56;
          if (v56 == v55)
          {
            v37 = v55;
            goto LABEL_32;
          }
          break;
        case 3:
          v35 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v57, a8);
          v36 = nlp::searchCompactDiskLevelRanked(a1, v35 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0, a7, v57);
          v54 = v36;
          v37 = v58;
          if (v58 == v57)
          {
            v37 = v57;
            goto LABEL_32;
          }
          break;
        default:
          goto LABEL_34;
      }
      if (v37)
      {
        v40 = 5;
LABEL_33:
        (*(void (**)(_BYTE *))(*(_QWORD *)v37 + 8 * v40))(v37);
LABEL_34:
        v36 = v54;
      }
      if (v36)
        return 1;
      if ((_DWORD)++v25 == 256)
        return v54 != 0;
    }
  }
  v15 = a3[a5];
  v16 = v15 >> 6;
  v17 = a2[v15 >> 6];
  v18 = 1 << v15;
  if (((1 << v15) & *(_QWORD *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      v19 = 0;
      if (v16 <= 1)
        v16 = 1;
      else
        v16 = v16;
      v41 = a2;
      do
      {
        v42 = *v41++;
        v43 = (uint8x8_t)vcnt_s8(v42);
        v43.i16[0] = vaddlv_u8(v43);
        v19 += v43.i32[0];
        --v16;
      }
      while (v16);
    }
    else
    {
      v19 = 0;
    }
    v44 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(_QWORD *)&v17));
    v44.i16[0] = vaddlv_u8(v44);
    v45 = a2[5].i32[v19 + v44.i32[0] + 1];
    v46 = v45 & 3;
    switch(v46)
    {
      case 1:
        v50 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v65, a8);
        v54 = nlp::searchDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v50, a3, a4, a5 + 1, a6, a7, v65);
        v48 = v66;
        if (v66 == v65)
        {
          v49 = 4;
          v48 = v65;
          goto LABEL_54;
        }
        break;
      case 2:
        v51 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v61, a8);
        v54 = nlp::searchDiskPageRanked((unsigned int *)((v45 & 0xFFFFFFFC) + v51), a3, a4, a5 + 1, a6, a7, (uint64_t)v61);
        v48 = v62;
        if (v62 == v61)
        {
          v49 = 4;
          v48 = v61;
          goto LABEL_54;
        }
        break;
      case 3:
        v47 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v63, a8);
        v54 = nlp::searchCompactDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v47, a3, a4, a5 + 1, a6, a7, v63);
        v48 = v64;
        if (v64 == v63)
        {
          v49 = 4;
          v48 = v63;
LABEL_54:
          (*(void (**)(void))(*(_QWORD *)v48 + 8 * v49))();
          return v54 != 0;
        }
        break;
      default:
        return v54 != 0;
    }
    if (v48)
    {
      v49 = 5;
      goto LABEL_54;
    }
  }
  return v54 != 0;
}

void sub_218E9B558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  char *v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;

  v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    v33 = 4;
    v32 = &a29;
  }
  else
  {
    if (!v32)
      goto LABEL_6;
    v33 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPageRanked(unsigned int *a1, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v11;
  char *v12;
  int v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char v18;
  size_t v19;
  size_t v20;
  size_t v21;
  int v22;
  int v23;
  _DWORD *v24;
  int v25;
  char *__dst;
  size_t v28;
  char *v29;
  size_t __n;
  char v37;

  v37 = 0;
  v7 = *a1;
  if (!*a1)
    return 0;
  v8 = a4;
  v9 = a3;
  v11 = 0;
  v12 = &a2[a4];
  v13 = a3 - a4;
  __n = (int)(a3 - a4);
  v29 = v12;
  __dst = &a2[a3];
  v28 = a3;
  while (1)
  {
    v14 = (char *)a1 + v11;
    v15 = *((unsigned __int16 *)v14 + 8);
    if (v13 > (int)v15)
      goto LABEL_14;
    v16 = v14 + 8;
    v17 = v14 + 18;
    if (memcmp(v14 + 18, v12, __n))
      goto LABEL_14;
    v18 = a5;
    if (v13 == (_DWORD)v15)
      v18 = 0;
    if ((v18 & 1) != 0)
      goto LABEL_14;
    v19 = (v15 + v8);
    v20 = (v19 - v9);
    v21 = v28;
    if ((int)v20 >= 1)
    {
      memcpy(__dst, &v17[v15 - (int)v20], v20);
      v21 = v19;
      v9 = v19;
    }
    a2[v21] = 0;
    v22 = *((_DWORD *)v16 + 1);
    v23 = *(_DWORD *)v16;
    v24 = malloc_type_malloc(v21 + 21, 0xF7573F27uLL);
    v24[4] = v9;
    *((_BYTE *)v24 + v21 + 20) = 0;
    memcpy(v24 + 5, a2, v21);
    *v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v24, v13 == (_DWORD)v15, (uint64_t)&v37);
    v25 = v24[3] - 1;
    v24[3] = v25;
    if (!v25)
      free(v24);
    v9 = a3;
    v8 = a4;
    v12 = v29;
    if (v37)
      return 1;
    LODWORD(v15) = *((unsigned __int16 *)v16 + 4);
LABEL_14:
    v11 += v15 + 10;
    if (v11 >= v7)
      return 0;
  }
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, char *, uint64_t *))(*(_QWORD *)v5 + 48))(v5, &v10, &v9, &v8, &v7);
}

uint64_t std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = a2;
  v6 = a4;
  v7 = a3;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *))(*(_QWORD *)v4 + 48))(v4, &v8, &v7, &v6);
}

void std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::~__func()
{
  JUMPOUT(0x219A24D0CLL);
}

_QWORD *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24DA27668;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24DA27668;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3, unsigned __int8 *a4, _QWORD *a5)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8))(*a2, *a3, *a4, *a5);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target_type()
{
}

uint64_t nlp::searchCompactDiskLevel(uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  int v19;
  __int32 v20;
  _DWORD *v21;
  unint64_t v24;
  uint64_t v25;
  int8x8_t v26;
  int v27;
  int8x8_t *v28;
  int8x8_t v29;
  uint8x8_t v30;
  uint8x8_t v31;
  __int32 v32;
  int v33;
  uint64_t v34;
  int v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int8x8_t *v40;
  int8x8_t v41;
  uint8x8_t v42;
  uint8x8_t v43;
  __int32 v44;
  int v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned __int8 v53;
  _BYTE v54[24];
  _BYTE *v55;
  _BYTE v56[24];
  _BYTE *v57;
  _BYTE v58[24];
  _BYTE *v59;
  _BYTE v60[24];
  _BYTE *v61;
  _BYTE v62[24];
  _BYTE *v63;
  _BYTE v64[24];
  _BYTE *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  if (a5 >= a4)
  {
    v20 = a2[4].i32[0];
    if (v20)
    {
      v21 = malloc_type_malloc(a4 + 21, 0xF7573F27uLL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *v21 = 0;
      v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v21, 1, (uint64_t)&v53);
      if (v21[3]-- == 1)
        free(v21);
      if (v53)
        return 1;
    }
    if ((a6 & 1) != 0)
      return v53 != 0;
    v24 = 0;
    v51 = a4 + 1;
    while (1)
    {
      if (v24 >> 6 <= 1)
        v25 = 1;
      else
        v25 = v24 >> 6;
      v26 = a2[v24 >> 6];
      if ((*(_QWORD *)&v26 & (1 << v24)) == 0)
        goto LABEL_34;
      if (v24 >= 0x40)
      {
        v27 = 0;
        v28 = a2;
        do
        {
          v29 = *v28++;
          v30 = (uint8x8_t)vcnt_s8(v29);
          v30.i16[0] = vaddlv_u8(v30);
          v27 += v30.i32[0];
          --v25;
        }
        while (v25);
      }
      else
      {
        v27 = 0;
      }
      v31 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v26 & ((1 << v24) - 1)));
      v31.i16[0] = vaddlv_u8(v31);
      v32 = a2[4].i32[v27 + v31.i32[0] + 1];
      a3[a5] = v24;
      v33 = v32 & 3;
      switch(v33)
      {
        case 1:
          v37 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v58, a8);
          v35 = nlp::searchDiskLevel(a1, v37 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0, a7, v58);
          v53 = v35;
          v36 = v59;
          if (v59 == v58)
          {
            v36 = v58;
LABEL_32:
            v39 = 4;
            goto LABEL_33;
          }
          break;
        case 2:
          v38 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v54, a8);
          v35 = nlp::searchDiskPage(a1, (unsigned int *)(v38 + (v32 & 0xFFFFFFFC)), (char *)a3, v51, a5 + 1, 0, a7, (uint64_t)v54);
          v53 = v35;
          v36 = v55;
          if (v55 == v54)
          {
            v36 = v54;
            goto LABEL_32;
          }
          break;
        case 3:
          v34 = *(_QWORD *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v56, a8);
          v35 = nlp::searchCompactDiskLevel(a1, v34 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0, a7, v56);
          v53 = v35;
          v36 = v57;
          if (v57 == v56)
          {
            v36 = v56;
            goto LABEL_32;
          }
          break;
        default:
          goto LABEL_34;
      }
      if (v36)
      {
        v39 = 5;
LABEL_33:
        (*(void (**)(void))(*(_QWORD *)v36 + 8 * v39))();
LABEL_34:
        v35 = v53;
      }
      if (v35)
        return 1;
      if ((_DWORD)++v24 == 256)
        return v53 != 0;
    }
  }
  v15 = a3[a5];
  v16 = v15 >> 6;
  v17 = a2[v15 >> 6];
  v18 = 1 << v15;
  if (((1 << v15) & *(_QWORD *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      v19 = 0;
      if (v16 <= 1)
        v16 = 1;
      else
        v16 = v16;
      v40 = a2;
      do
      {
        v41 = *v40++;
        v42 = (uint8x8_t)vcnt_s8(v41);
        v42.i16[0] = vaddlv_u8(v42);
        v19 += v42.i32[0];
        --v16;
      }
      while (v16);
    }
    else
    {
      v19 = 0;
    }
    v43 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(_QWORD *)&v17));
    v43.i16[0] = vaddlv_u8(v43);
    v44 = a2[4].i32[v19 + v43.i32[0] + 1];
    v45 = v44 & 3;
    switch(v45)
    {
      case 1:
        v49 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v64, a8);
        v53 = nlp::searchDiskLevel(a1, (v44 & 0xFFFFFFFC) + v49, a3, a4, a5 + 1, a6, a7, v64);
        v47 = v65;
        if (v65 == v64)
        {
          v48 = 4;
          v47 = v64;
          goto LABEL_54;
        }
        break;
      case 2:
        v50 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v60, a8);
        v53 = nlp::searchDiskPage(a1, (unsigned int *)((v44 & 0xFFFFFFFC) + v50), (char *)a3, a4, a5 + 1, a6, a7, (uint64_t)v60);
        v47 = v61;
        if (v61 == v60)
        {
          v48 = 4;
          v47 = v60;
          goto LABEL_54;
        }
        break;
      case 3:
        v46 = *(_QWORD *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]((uint64_t)v62, a8);
        v53 = nlp::searchCompactDiskLevel(a1, (v44 & 0xFFFFFFFC) + v46, a3, a4, a5 + 1, a6, a7, v62);
        v47 = v63;
        if (v63 == v62)
        {
          v48 = 4;
          v47 = v62;
LABEL_54:
          (*(void (**)(void))(*(_QWORD *)v47 + 8 * v48))();
          return v53 != 0;
        }
        break;
      default:
        return v53 != 0;
    }
    if (v47)
    {
      v48 = 5;
      goto LABEL_54;
    }
  }
  return v53 != 0;
}

void sub_218E9BE74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  char *v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;

  v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    v33 = 4;
    v32 = &a29;
  }
  else
  {
    if (!v32)
      goto LABEL_6;
    v33 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPage(uint64_t a1, unsigned int *a2, char *a3, unsigned int a4, int a5, char a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v9;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char v20;
  size_t v21;
  int v22;
  size_t v23;
  size_t v24;
  int v25;
  _DWORD *v26;
  int v27;
  char *v28;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  size_t v37;
  char v38;
  unsigned int v39;
  unsigned int v40;
  size_t v41;
  int v42;
  int v43;
  _BYTE *v44;
  int v45;
  _DWORD *v46;
  int v47;
  char *__dst;
  size_t v50;
  char *v51;
  int v52;
  char *v53;
  char v54;
  char *__s2a;
  char v64;
  _OWORD __s1[16];
  uint64_t v66;

  v8 = a5;
  v9 = a4;
  v66 = *MEMORY[0x24BDAC8D0];
  v64 = 0;
  v11 = a4 - a5;
  v12 = *a2;
  if ((*(_BYTE *)(a1 + 2064) & 4) != 0)
  {
    memset(__s1, 0, sizeof(__s1));
    if (v12)
    {
      v28 = 0;
      v29 = 0;
      v52 = a5 - a4;
      __s2a = &a3[a5];
      v51 = &a3[a4];
      do
      {
        v30 = (char *)a2 + v29;
        v31 = v30[10];
        if (v28)
        {
          v32 = v28[6];
          if (v31 > v32)
            memcpy((char *)__s1 + v32, v28 + 7, v31 - v32);
        }
        v28 = v30 + 4;
        v33 = *((unsigned __int16 *)v30 + 4);
        v34 = v33 + v31;
        if ((int)(v33 + v31) >= v11)
        {
          if (v9 == v8 || ((int)v31 >= v11 ? (v35 = v11) : (v35 = v31), !memcmp(__s1, __s2a, v35)))
          {
            v36 = v11 - v31;
            if (v11 - (int)v31 < 0
              || ((int)v33 >= (int)v36 ? (v37 = v36) : (v37 = v33), !memcmp(v28 + 7, &__s2a[v31], v37)))
            {
              v38 = a6;
              if (v11 == v34)
                v38 = 0;
              if ((v38 & 1) == 0)
              {
                v39 = v9;
                v40 = v31 + v8;
                v41 = (_DWORD)v31 + v8 - v39;
                if ((int)v41 < 1)
                {
                  v40 = v39;
                }
                else
                {
                  memcpy(v51, (char *)__s1 + v31 - (int)v41, v41);
                  v33 = *((unsigned __int16 *)v28 + 2);
                  LODWORD(v31) = v28[6];
                }
                v42 = v52 + v33 + v31;
                if (v42 < 1)
                {
                  v44 = a3;
                }
                else
                {
                  v43 = v42 - (v41 & ~((int)v41 >> 31));
                  v44 = a3;
                  memcpy(&a3[v40], &v28[v33 - v43 + 7], v43);
                  v40 += v43;
                }
                v54 = v11 == v34;
                v44[v40] = 0;
                v45 = *(_DWORD *)v28;
                v46 = malloc_type_malloc(v40 + 21, 0xF7573F27uLL);
                v46[4] = v40;
                *((_BYTE *)v46 + v40 + 20) = 0;
                memcpy(v46 + 5, v44, v40);
                *v46 = 0;
                v46[2] = v45;
                v46[3] = 1;
                std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v46, v54, (uint64_t)&v64);
                v47 = v46[3] - 1;
                v46[3] = v47;
                if (!v47)
                  free(v46);
                v9 = a4;
                if (v64)
                  return 1;
                v33 = *((unsigned __int16 *)v28 + 2);
                v8 = a5;
              }
            }
          }
        }
        v29 += v33 + 7;
      }
      while (v29 < v12);
    }
  }
  else if (v12)
  {
    v13 = 0;
    v14 = &a3[a5];
    v15 = v11;
    __dst = &a3[a4];
    v50 = a4;
    v53 = v14;
    do
    {
      v16 = (char *)a2 + v13;
      v17 = *((unsigned __int16 *)v16 + 4);
      if (v11 <= (int)v17)
      {
        v18 = v16 + 4;
        v19 = v16 + 10;
        if (!memcmp(v16 + 10, v14, v15))
        {
          v20 = a6;
          if (v11 == (_DWORD)v17)
            v20 = 0;
          if ((v20 & 1) == 0)
          {
            v21 = (v17 + v8);
            v22 = a4;
            v23 = v21 - a4;
            v24 = v50;
            if ((int)v23 >= 1)
            {
              memcpy(__dst, &v19[v17 - (int)v23], v23);
              v24 = v21;
              v22 = v21;
            }
            a3[v24] = 0;
            v25 = *(_DWORD *)v18;
            v26 = malloc_type_malloc(v24 + 21, 0xF7573F27uLL);
            v26[4] = v22;
            *((_BYTE *)v26 + v24 + 20) = 0;
            memcpy(v26 + 5, a3, v24);
            *v26 = 0;
            v26[2] = v25;
            v26[3] = 1;
            std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a8, a7, (uint64_t)v26, v11 == (_DWORD)v17, (uint64_t)&v64);
            v27 = v26[3] - 1;
            v26[3] = v27;
            if (!v27)
              free(v26);
            v8 = a5;
            v15 = v11;
            v14 = v53;
            if (v64)
              return 1;
            LODWORD(v17) = *((unsigned __int16 *)v18 + 2);
          }
        }
      }
      v13 += v17 + 6;
    }
    while (v13 < v12);
  }
  return 0;
}

uint64_t nlp::searchListRanked(uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v10;
  char *v11;
  size_t v12;
  char v13;
  uint64_t v14;
  char v15;
  size_t v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  int v21;
  _DWORD *v22;
  int v23;
  char *__dst;
  size_t v26;
  char v30;

  v30 = 0;
  if (result)
  {
    v7 = a4;
    v10 = result;
    v11 = &a2[a4];
    v12 = (int)(a3 - a4);
    v26 = a3;
    v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      v14 = *(unsigned __int16 *)(v10 + 20);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 22), v11, v12))
      {
        v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          v16 = (v14 + v7);
          v17 = v16 - a3;
          v18 = v26;
          v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 22 + v14 - (int)v17), v17);
            v18 = v16;
            v19 = v16;
          }
          a2[v18] = 0;
          v20 = *(_DWORD *)(v10 + 16);
          v21 = *(_DWORD *)(v10 + 12);
          v22 = malloc_type_malloc(v18 + 21, 0xF7573F27uLL);
          v22[4] = v19;
          *((_BYTE *)v22 + v18 + 20) = 0;
          memcpy(v22 + 5, a2, v18);
          *v22 = v21;
          v22[2] = v20;
          v22[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v22, (_DWORD)v12 == (_DWORD)v14, (uint64_t)&v30);
          v23 = v22[3] - 1;
          v22[3] = v23;
          if (!v23)
            free(v22);
          v7 = a4;
          v13 = a5;
          if (v30)
            break;
        }
      }
      v10 = *(_QWORD *)v10;
      if (!v10)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t nlp::searchList(uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v10;
  char *v11;
  size_t v12;
  char v13;
  uint64_t v14;
  char v15;
  size_t v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  _DWORD *v21;
  int v22;
  char *__dst;
  size_t v25;
  char v29;

  v29 = 0;
  if (result)
  {
    v7 = a4;
    v10 = result;
    v11 = &a2[a4];
    v12 = (int)(a3 - a4);
    v25 = a3;
    v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      v14 = *(unsigned __int16 *)(v10 + 12);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 14), v11, v12))
      {
        v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          v16 = (v14 + v7);
          v17 = v16 - a3;
          v18 = v25;
          v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 14 + v14 - (int)v17), v17);
            v18 = v16;
            v19 = v16;
          }
          a2[v18] = 0;
          v20 = *(_DWORD *)(v10 + 8);
          v21 = malloc_type_malloc(v18 + 21, 0xF7573F27uLL);
          v21[4] = v19;
          *((_BYTE *)v21 + v18 + 20) = 0;
          memcpy(v21 + 5, a2, v18);
          *v21 = 0;
          v21[2] = v20;
          v21[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()(a7, a6, (uint64_t)v21, (_DWORD)v12 == (_DWORD)v14, (uint64_t)&v29);
          v22 = v21[3] - 1;
          v21[3] = v22;
          if (!v22)
            free(v21);
          v7 = a4;
          v13 = a5;
          if (v29)
            break;
        }
      }
      v10 = *(_QWORD *)v10;
      if (!v10)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t nlp::advanceCompactMapCursorMappedLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  unint64_t v8;

  v8 = (*(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(_QWORD *)(a1 + 2080);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (!a4)
    {
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(v8 + 1032);
      return 1;
    }
LABEL_5:
    nlp::updateCompactMapCursorPointer(a1, (_QWORD *)a2, *(unsigned int *)(v8 + 4 * *a3));
    return nlp::advanceCompactMapCursor(a1, a2, a3 + 1, (a4 - 1));
  }
  if (a4)
    goto LABEL_5;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(v8 + 1024);
  return 1;
}

uint64_t nlp::updateCompactMapCursorPointer(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;

  if (*a2 != a3)
    return ((uint64_t (*)(void))((char *)&loc_218E9C71C + 4 * byte_218EA0328[a3 & 3]))();
  return result;
}

uint64_t nlp::advanceMapCursorTrieList(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  int v20;
  float v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  size_t v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  __n128 v30;
  double v31;
  int v32;
  int v34;
  _QWORD v35[2];
  size_t v36;
  int v37;
  __n128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 2064) & 1) == 0)
  {
    v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    v10 = *(unsigned int *)(a2 + 16);
    if (v10 > *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12))
      nlp::advanceMapCursorTrieList();
    if (!v9)
      return 0;
    v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    while (1)
    {
      v12 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v11 != v9)
      {
        v12 = *(unsigned __int16 *)(v11 + 12);
        if (v10 >= v12)
          goto LABEL_19;
        if ((_DWORD)v10)
        {
          v13 = (unsigned __int8 *)(v11 + 14);
          v14 = *(unsigned int *)(a2 + 16);
          v15 = (unsigned __int8 *)(v9 + 14);
          do
          {
            v17 = *v13++;
            v16 = v17;
            v18 = *v15++;
            if (v16 != v18)
              goto LABEL_19;
          }
          while (--v14);
        }
      }
      LODWORD(v19) = 0;
      v20 = *(_DWORD *)(a2 + 16);
      if (v10 < v12 && a4)
      {
        v19 = 0;
        do
        {
          if (*(unsigned __int8 *)(v11 + v10 + 14 + v19) != a3[v19])
            break;
          if (++v19 + v10 >= v12)
            break;
        }
        while (v19 < a4);
        v20 = v10 + v19;
      }
      if ((_DWORD)v19 == a4)
      {
        *(_QWORD *)(a2 + 8) = v11 | 2;
        if (v20 == v12)
        {
          *(_DWORD *)(a2 + 16) = v12;
          *(_DWORD *)(a2 + 20) = *(_DWORD *)(v11 + 8);
        }
        else
        {
          *(_QWORD *)(a2 + 16) = v10 + a4;
        }
        return 1;
      }
LABEL_19:
      v11 = *(_QWORD *)v11;
      if (!v11)
        return 0;
    }
  }
  v35[1] = v35;
  v35[0] = *(_QWORD *)a2;
  a5.n128_u64[0] = *(_QWORD *)(a2 + 16);
  v22 = *(float *)(a2 + 24);
  v38 = a5;
  MEMORY[0x24BDAC7A8](a1);
  v24 = (char *)v35 - v23;
  v26 = *(unsigned int *)(a2 + 16);
  memcpy((char *)v35 - v23, (const void *)(v25 + 22), v26);
  v27 = *(_QWORD *)a2 & 0xFFFFFFFFFFFFFFFCLL;
  if (v27)
  {
    v37 = 0;
    v28 = v26 + a4;
    v36 = a4;
    do
    {
      v29 = *(unsigned __int16 *)(v27 + 20);
      if (v28 <= v29 && !memcmp((const void *)(v27 + 22), v24, v26) && !memcmp((const void *)(v27 + 22 + v26), a3, v36))
      {
        if (v28 == v29)
        {
          *(_QWORD *)(a2 + 8) = v27 | 2;
          v34 = *(_DWORD *)(v27 + 16);
          *(_DWORD *)(a2 + 24) = *(_DWORD *)(v27 + 12);
          *(_DWORD *)(a2 + 16) = v28;
          *(_DWORD *)(a2 + 20) = v34;
          return 1;
        }
        v30 = v38;
        HIDWORD(v31) = 0;
        v32 = v37;
        if (!v37)
        {
          v8 = v27 | 2;
          v22 = 0.0;
        }
        v37 = 1;
        if (!v32)
        {
          LODWORD(v31) = v38.n128_u32[0] + a4;
          v30.n128_f64[0] = v31;
        }
        v38 = v30;
      }
      v27 = *(_QWORD *)v27;
    }
    while (v27);
  }
  else
  {
    v37 = 0;
  }
  *(_QWORD *)a2 = v35[0];
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = v38.n128_u64[0];
  *(float *)(a2 + 24) = v22;
  return v37;
}

uint64_t nlp::updateMapCursorPointer(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int *v4;
  int v5;
  unint64_t v6;

  if (*(_QWORD *)(a2 + 8) != a3)
  {
    v3 = a3 & 3;
    if ((a3 & 3) != 0)
    {
      if (v3 == 2)
      {
        v6 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          if (*(_WORD *)(v6 + 12))
            v5 = 0;
          else
            v5 = *(_DWORD *)(v6 + 8);
          goto LABEL_14;
        }
        *(_DWORD *)(a2 + 20) = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(v6 + 12);
        *(_QWORD *)a2 = a3;
      }
      else if (v3 == 1)
      {
        v4 = (int *)(a3 & 0xFFFFFFFFFFFFFFFCLL);
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          v5 = *v4;
LABEL_14:
          *(_DWORD *)(a2 + 20) = v5;
          goto LABEL_15;
        }
        *(_DWORD *)(a2 + 20) = v4[2];
        *(_DWORD *)(a2 + 24) = v4[1];
      }
    }
    else
    {
      *(_QWORD *)(a2 + 20) = 0;
    }
LABEL_15:
    *(_QWORD *)(a2 + 8) = a3;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::~__func()
{
  JUMPOUT(0x219A24D0CLL);
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24DA27780;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24DA27780;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()(uint64_t a1, uint64_t a2, const void **a3, unsigned int *a4, int *a5, int *a6, uint64_t *a7)
{
  const void *v8;
  size_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  char *v14;
  size_t v15;
  size_t v16;
  _DWORD *v17;
  int v18;

  v8 = *a3;
  v9 = *a4;
  v10 = *a5;
  v11 = *a6;
  v12 = *a7;
  v13 = *(_DWORD *)(a1 + 16) + v9;
  v14 = (char *)operator new[]();
  v15 = *(unsigned int *)(a1 + 16);
  memcpy(v14, *(const void **)(a1 + 8), v15);
  memcpy(&v14[v15], v8, v9);
  v14[v13] = 0;
  v16 = (v15 + v9);
  v17 = malloc_type_malloc(v16 + 21, 0xF7573F27uLL);
  v17[4] = v16;
  *((_BYTE *)v17 + v16 + 20) = 0;
  memcpy(v17 + 5, v14, v16);
  *v17 = v11;
  v17[2] = v10;
  v17[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(*(_QWORD *)(a1 + 24), 0, (uint64_t)v17, v12);
  v18 = v17[3] - 1;
  v17[3] = v18;
  if (!v18)
    free(v17);
  JUMPOUT(0x219A24CF4);
}

uint64_t std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(nlp *this, CFErrorRef *a2, __CFError **a3, __CFError **a4)
{
  return nlp::createDictionaryWithContentsOfURL(this, 0, a2, a4);
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(CFURLRef fileURL, const __CFURL *a2, CFErrorRef *a3, __CFError **a4)
{
  int v5;
  __CFReadStream *v7;
  const __CFURL *v8;
  __CFReadStream *v9;
  const __CFURL *v10;
  CFOptionFlags v11;
  CFPropertyListRef v12;
  CFTypeID v13;
  const __CFURL *v14;

  v5 = (int)a2;
  v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], fileURL);
  if (v7)
  {
    v9 = v7;
    if (CFReadStreamOpen(v7)
      && (!v5 ? (v11 = 0) : (v11 = 2),
          v12 = CFPropertyListCreateWithStream(0, v9, 0, v11, 0, 0),
          CFReadStreamClose(v9),
          v12))
    {
      v13 = CFGetTypeID(v12);
      if (v13 != CFDictionaryGetTypeID())
      {
        if (a3)
          *a3 = nlp::createErrorWithMessageAndURL((nlp *)CFSTR("Property list at URL is not a dictionary"), fileURL, v14);
        CFRelease(v12);
        goto LABEL_15;
      }
    }
    else
    {
      if (!a3)
      {
LABEL_15:
        v12 = 0;
        goto LABEL_16;
      }
      v12 = 0;
      *a3 = nlp::createErrorWithMessageAndURL((nlp *)CFSTR("File at URL is not a valid property list"), fileURL, v10);
    }
LABEL_16:
    CFRelease(v9);
    return v12;
  }
  v12 = 0;
  if (a3)
    *a3 = nlp::createErrorWithMessageAndURL((nlp *)CFSTR("File at URL is not readable"), fileURL, v8);
  return v12;
}

void sub_218E9CE58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFReadStream *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

CFErrorRef nlp::createErrorWithMessageAndURL(nlp *this, CFURLRef anURL, const __CFURL *a3)
{
  CFStringRef v4;
  const __CFAllocator *v5;
  CFStringRef v6;
  __CFDictionary *Mutable;
  CFErrorRef v8;

  v4 = CFURLCopyPath(anURL);
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@: %@"), this, v4);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v6);
  v8 = CFErrorCreate(v5, CFSTR("com.apple.NLPUtils.ErrorDomain"), 0, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  if (v6)
    CFRelease(v6);
  if (v4)
    CFRelease(v4);
  return v8;
}

void sub_218E9CF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  const void *v5;
  va_list va;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFReadStream *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void copyEmbeddingDataForAttributedQuery_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_218E10000, a2, a3, "qid=%lu - %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __embeddingGeneratorPreheatAsync_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_218E10000, a2, OS_LOG_TYPE_ERROR, "Embedding preheat failed (%@)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void embeddingGeneratorPreheatSync_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(double *)&v3[4] = *(double *)(*(_QWORD *)a1 + 24) * 1000.0;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0_0(&dword_218E10000, a2, a3, "Embedding preheat failed (time=%.2fms) (%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void QP::ParserGrammar::tokenCompletions(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_218E10000, a2, OS_LOG_TYPE_FAULT, "m_completion_keys is missing an entry for key %@", (uint8_t *)&v2, 0xCu);
}

void ___ZN2QP5LexerC2ENSt3__110shared_ptrINS_19ParserConfigurationEEENS2_INS_13ParserGrammarEEE_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218E10000, log, OS_LOG_TYPE_ERROR, "QueryParserLexer: unable to load loc tables", v1, 2u);
}

void QP::LLMParser::parseInternal(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_218E10000, a3, (uint64_t)a3, "[QPNLU] Successfully grounded person", a1);
}

void QP::LLMParser::parseInternal(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 25;
  _os_log_fault_impl(&dword_218E10000, log, OS_LOG_TYPE_FAULT, "[QPNLU] [Recurring Failure] ECR failed %d times", buf, 8u);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEv_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_218E10000, a1, a3, "[QPNLU][LLMParser] parsed groundTruth predictions to jsonObjects successfully", v3);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEv_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_218E10000, a1, a3, "[QPNLU][LLMParser] loaded non empty data predictions from groundTruth file", v3);
}

void ___ZN2QP9LLMParser21getGroundTruthDataRefEv_block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_218E10000, a2, OS_LOG_TYPE_DEBUG, "[QPNLU][LLMParser] started loading groundTruth predictions from filePath: %@", (uint8_t *)&v2, 0xCu);
}

void std::construct_at[abi:ne180100]<QP::LexemeValue,std::string &,std::string,CFRange &,QP::LexemeValue*>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t ___ZL21getUITextCheckerClassv_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return QP::U2Parser::lexemeForArgMediaTypeWithRange(v0, v1, v2);
}

void QP::U2Parser::lexemeForArgMediaTypeWithRange(uint64_t a1, uint64_t a2, os_log_t log)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)a1;
  if (*(char *)(*(_QWORD *)a1 + 23) < 0)
    v3 = (_QWORD *)*v3;
  v4 = 138412546;
  v5 = a2;
  v6 = 2080;
  v7 = v3;
  _os_log_debug_impl(&dword_218E10000, log, OS_LOG_TYPE_DEBUG, "Found matching Media lexeme for %@ with type %s", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void QP::U2Parser::parseInternal()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "[QPNLU] Unable to parse: no locale set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "[QPNLU] Empty U2 output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "[QPNLU] Unable to parse: token not found in user query", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "[QPNLU] Invalid U2 output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "[QPNLU] U2 parsing timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_218E10000, v0, v1, "[QPNLU] Starting U2 parse", v2);
  OUTLINED_FUNCTION_1_0();
}

void QP::U2Parser::parseInternal(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  _os_log_error_impl(&dword_218E10000, v2, OS_LOG_TYPE_ERROR, "[QPNLU] Unable to parse: unable to find range for ARG_TIME group", v3, 2u);
}

{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_218E10000, v2, (uint64_t)v2, "[QPNLU] Successfully grounded person", v3);
}

{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_218E10000, v2, (uint64_t)v2, "skipping token that was part of a previous token group", v3);
}

void QP::U2Parser::parseInternal(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 25;
  OUTLINED_FUNCTION_6(&dword_218E10000, a3, (uint64_t)a3, "[QPNLU] [Recurring Failure] ECR failed %d times", a1);
}

void QP::U2Parser::parseInternal(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 25;
  OUTLINED_FUNCTION_6(&dword_218E10000, a1, a3, "[QPNLU] [Recurring Failure] U2 parsing timed out %d times", (uint8_t *)v3);
  OUTLINED_FUNCTION_1_0();
}

void QP::U2Parser::parseInternal(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_218E10000, a2, a3, "[QPNLU] ECR request for all visual identifiers failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZN2QPL26u2UnderstandingWithTimeoutEPU31objcproto20QUUnderstandingModel11objc_objectPK10__CFStringP7QUSpansbjPU15__autoreleasingP7NSError_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_218E10000, a2, a3, "[QPNLU] Unable to use U2: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t QP::QueryParserEngine::QueryParserEngine(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void QP::QueryParserEngine::setString(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_218E10000, a2, OS_LOG_TYPE_DEBUG, "QPParser queryRef (%@)", (uint8_t *)&v2, 0xCu);
}

void loadSafetyResources()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "safety: missing config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "safety: missing resource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void loadSafetyResources(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_218E10000, log, OS_LOG_TYPE_ERROR, "safety: unsupported major version: %d != %d", (uint8_t *)v4, 0xEu);
}

void loadSafetyResources(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_218E10000, a2, OS_LOG_TYPE_ERROR, "safety: unable to load config %@", (uint8_t *)&v3, 0xCu);
}

void ___ZL33QPSpotlightKnowledgeContextCreatePK10__CFStringS1_PK14__CFDictionary_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_218E10000, v0, v1, "unable to load lexicon cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void QP::ParserConfiguration::loadConfigurationResource(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_218E10000, a2, OS_LOG_TYPE_ERROR, "QueryParser: %@ (error)", (uint8_t *)&v3, 0xCu);
}

void nlp::addListNode()
{
  __assert_rtn("addListNode", "BurstTrie.cpp", 577, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::advanceMapCursorTrieList()
{
  __assert_rtn("advanceMapCursorTrieList", "BurstTrie.cpp", 1854, "cursor->prfxlen <= head->restlen");
}

uint64_t CCDigest()
{
  return MEMORY[0x24BDAC1B8]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x24BDAC1D8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x24BDBB888](theArray, range.location, range.length, newValues, newCount);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x24BDBB8A0](theArray, range.location, range.length, comparator, context);
}

CFAttributedStringRef CFAttributedStringCreateCopy(CFAllocatorRef alloc, CFAttributedStringRef aStr)
{
  return (CFAttributedStringRef)MEMORY[0x24BDBB8B8](alloc, aStr);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x24BDBB8C0](alloc, maxLength);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x24BDBB8E0](aStr, loc, attrName, effectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x24BDBB8F0](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x24BDBB900](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x24BDBB908](aStr);
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
  MEMORY[0x24BDBB910](aStr, range.location, range.length, attrName);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
  MEMORY[0x24BDBB918](aStr, range.location, range.length, replacement);
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
  MEMORY[0x24BDBB920](aStr, range.location, range.length, attrName, value);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x24BDBB990](heap, value);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x24BDBB9B0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x24BDBB9B8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9D0](heap);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

uint64_t CFBundleCopyLocalizationForLocalizationInfo()
{
  return MEMORY[0x24BDBBA58]();
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

uint64_t CFBundleGetLocalizationInfoForLocalization()
{
  return MEMORY[0x24BDBBAD0]();
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x24BDBBB80](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x24BDBBB88](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB90]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar)
{
  return MEMORY[0x24BDBBBA8](calendar);
}

CFCalendarIdentifier CFCalendarGetIdentifier(CFCalendarRef calendar)
{
  return (CFCalendarIdentifier)MEMORY[0x24BDBBBB0](calendar);
}

CFRange CFCalendarGetMaximumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x24BDBBBB8](calendar, unit);
  result.length = v3;
  result.location = v2;
  return result;
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x24BDBBBC0](calendar, smallerUnit, biggerUnit, at);
  result.length = v5;
  result.location = v4;
  return result;
}

void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy)
{
  MEMORY[0x24BDBBBC8](calendar, wkdy);
}

void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale)
{
  MEMORY[0x24BDBBBD0](calendar, locale);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x24BDBBBD8](calendar, tz);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x24BDBBC08](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC18](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
  MEMORY[0x24BDBBC50](theSet, theOtherSet);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x24BDBBD28](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x24BDBBD48](allocator, tmplate, options, locale);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD58](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x24BDBBF40]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF68](allocator, locale);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF88]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x24BDBC418](theSet, values);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x24BDBC420](theSet);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC430](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x24BDBC518](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

uint64_t CFStringEncodingUnicodeToBytes()
{
  return MEMORY[0x24BDBC5C8]();
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x24BDBC5F0](theString, theFlags, theLocale);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x24BDBC680](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E8](theString, replacement);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC748](theString, locale);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC758]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC760]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x24BDBC790](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7C0](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x24BDBC880](anURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

uint64_t DDResultGetMatchedString()
{
  return MEMORY[0x24BE2B2B0]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x24BE2B2C8]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x24BE2B2D0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x24BE2B2E0]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x24BE2B2E8]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x24BE2B2F0]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x24BE2B328]();
}

uint64_t DDScannerCreateWithCacheFile()
{
  return MEMORY[0x24BE2B338]();
}

uint64_t DDScannerEnableOptionalSource()
{
  return MEMORY[0x24BE2B348]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x24BE2B350]();
}

uint64_t DDScannerSetClientTables()
{
  return MEMORY[0x24BE2B358]();
}

uint64_t DDScannerSetOptions()
{
  return MEMORY[0x24BE2B360]();
}

uint64_t NLDependencyParserCopyNounPhrasesFromSentence()
{
  return MEMORY[0x24BE1E4E8]();
}

uint64_t NLDependencyParserCreateWithOptions()
{
  return MEMORY[0x24BE1E4F0]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x24BE1E548]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x24BE1E550]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x24BE1E558]();
}

uint64_t NLTaggerSetLocaleForRange()
{
  return MEMORY[0x24BE1E560]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x24BE1E568]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t SIDataMapCreateMutable()
{
  return MEMORY[0x24BEB00E0]();
}

uint64_t SIDataMapGetCount()
{
  return MEMORY[0x24BEB00E8]();
}

uint64_t SIDataMapGetWithKey()
{
  return MEMORY[0x24BEB00F0]();
}

uint64_t SIDataMapRelease()
{
  return MEMORY[0x24BEB00F8]();
}

uint64_t SIGeneralTrieAddKeyWithScore()
{
  return MEMORY[0x24BEB0100]();
}

uint64_t SIGeneralTrieContainsKey()
{
  return MEMORY[0x24BEB0108]();
}

uint64_t SIGeneralTrieCreateMutableWithOptions()
{
  return MEMORY[0x24BEB0110]();
}

uint64_t SIGeneralTrieCreateWithFileDescriptors()
{
  return MEMORY[0x24BEB0118]();
}

uint64_t SIGeneralTrieGetCount()
{
  return MEMORY[0x24BEB0120]();
}

uint64_t SIGeneralTrieRelease()
{
  return MEMORY[0x24BEB0128]();
}

uint64_t SIGeneralTrieRetain()
{
  return MEMORY[0x24BEB0130]();
}

uint64_t SIGeneralTrieSearch()
{
  return MEMORY[0x24BEB0138]();
}

uint64_t SILanguagesGetLanguageIDForIdentifier()
{
  return MEMORY[0x24BEB0150]();
}

uint64_t SILexiconCacheCreateWithOptions()
{
  return MEMORY[0x24BEB0158]();
}

uint64_t SILexiconCacheEnumerateAnnotations()
{
  return MEMORY[0x24BEB0160]();
}

uint64_t SILexiconCacheEnumerateOVSAnnotationsInString()
{
  return MEMORY[0x24BEB0168]();
}

uint64_t SILexiconCacheIsAvailable()
{
  return MEMORY[0x24BEB0170]();
}

uint64_t SILexiconCacheLoad()
{
  return MEMORY[0x24BEB0178]();
}

uint64_t SILexiconCacheRefresh()
{
  return MEMORY[0x24BEB0180]();
}

uint64_t SILexiconCacheRelease()
{
  return MEMORY[0x24BEB0188]();
}

uint64_t SILocalizationCreateWithOptions()
{
  return MEMORY[0x24BEB0190]();
}

uint64_t SILocalizationGetTokenType()
{
  return MEMORY[0x24BEB0198]();
}

uint64_t SILocalizationLoad()
{
  return MEMORY[0x24BEB01A0]();
}

uint64_t SILocalizationRelease()
{
  return MEMORY[0x24BEB01A8]();
}

uint64_t SITrieCompletionGetCompletion()
{
  return MEMORY[0x24BEB01B0]();
}

uint64_t SITrieCompletionGetLength()
{
  return MEMORY[0x24BEB01B8]();
}

uint64_t SITrieCompletionGetPayload()
{
  return MEMORY[0x24BEB01C0]();
}

uint64_t SITrieCompletionGetScore()
{
  return MEMORY[0x24BEB01C8]();
}

uint64_t SITrieCompletionQueueCreate()
{
  return MEMORY[0x24BEB01D0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x24BE667A0]();
}

uint64_t _MDPlistContainerGetPlistObjectAtKeyPath()
{
  return MEMORY[0x24BE667D8]();
}

uint64_t _MDPlistDictionaryGetCount()
{
  return MEMORY[0x24BE667E8]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x24BE667F8]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x24BE66800]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x24BE66818]();
}

uint64_t _MDPlistStringGetValue()
{
  return MEMORY[0x24BE66820]();
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

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB618](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24DA236E8();
}

void operator delete(void *__p)
{
  off_24DA236F0(__p);
}

uint64_t operator delete()
{
  return off_24DA236F8();
}

uint64_t operator new[]()
{
  return off_24DA23700();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DA23708(__sz);
}

uint64_t operator new()
{
  return off_24DA23710();
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

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t intentArgLabel()
{
  return MEMORY[0x24BE7BEB8]();
}

uint64_t intentArgShortLabel()
{
  return MEMORY[0x24BE7BEC0]();
}

uint64_t intentLabel()
{
  return MEMORY[0x24BE7BEC8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

UBool u_isWhitespace(UChar32 c)
{
  return MEMORY[0x24BEDBF98](*(_QWORD *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x24BEDBFE8](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t unum_close()
{
  return MEMORY[0x24BEDC1B8]();
}

uint64_t unum_open()
{
  return MEMORY[0x24BEDC208]();
}

uint64_t unum_parseDouble()
{
  return MEMORY[0x24BEDC218]();
}

uint64_t uset_close()
{
  return MEMORY[0x24BEDC2E8]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x24BEDC2F8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x24BEDC310]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x24BDB0A48](xfd);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

