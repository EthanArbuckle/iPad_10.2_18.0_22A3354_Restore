void ComputeHash::ComputeHash(ComputeHash *this)
{
  *(_QWORD *)this = &off_24D1DD888;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 2) = 2;
}

{
  *(_QWORD *)this = &off_24D1DD888;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 2) = 2;
}

_QWORD *ComputeHash::setDigestGenerator(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<DigestGenerator>::operator=[abi:ne180100]((_QWORD *)(a1 + 16), a2);
}

_QWORD *std::shared_ptr<DigestGenerator>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

uint64_t ComputeHash::init(ComputeHash *this)
{
  if (*((_DWORD *)this + 2) != 2
    || ((***((uint64_t (****)(_QWORD))this + 2))(*((_QWORD *)this + 2)) & 0x80000000) != 0)
  {
    return 0;
  }
  *((_DWORD *)this + 2) = 0;
  return 1;
}

const UInt8 *ComputeHash::digest_file(ComputeHash *this, FileSystemManager *a2)
{
  const UInt8 *v2;
  CFTypeRef v5;
  CFTypeRef cf;

  if (*((_DWORD *)this + 2))
    return 0;
  FileSystemManager::fileContentsAtPath((uint64_t)a2, &cf);
  v5 = cf;
  if (cf)
    CFRetain(cf);
  v2 = ComputeHash::digest_data((uint64_t)this, (CFDataRef *)&v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  return v2;
}

void sub_214665354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a9);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

const UInt8 *ComputeHash::digest_data(uint64_t a1, CFDataRef *a2)
{
  const UInt8 *result;
  uint64_t (*v5)(uint64_t);
  CFIndex Length;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!*a2)
    v5 = 0;
  if (!v5)
    return 0;
  Length = CFDataGetLength(*a2);
  result = CFDataGetBytePtr(*a2);
  if (result)
    return (const UInt8 *)((*(int (**)(_QWORD, const UInt8 *, CFIndex))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), result, Length) >= 0);
  return result;
}

BOOL ComputeHash::digest_length(ComputeHash *this, unsigned int a2)
{
  unsigned int v3;

  v3 = bswap32(a2);
  return !*((_DWORD *)this + 2)
      && (*(int (**)(_QWORD, unsigned int *, uint64_t))(**((_QWORD **)this + 2) + 8))(*((_QWORD *)this + 2), &v3, 4) >= 0;
}

BOOL ComputeHash::digest_string(uint64_t a1, CFStringRef *a2)
{
  _BOOL8 v2;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  UInt8 *v7;
  UInt8 *v8;
  CFIndex Bytes;
  CFIndex usedBufLen;
  unsigned int v12;
  CFRange v13;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  Length = CFStringGetLength(*a2);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v7 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0x180DA719uLL);
  if (!v7)
    return 0;
  v8 = v7;
  usedBufLen = 0;
  v13.location = 0;
  v13.length = Length;
  Bytes = CFStringGetBytes(*a2, v13, 0x8000100u, 0, 0, v7, MaximumSizeForEncoding, &usedBufLen);
  v2 = 0;
  if (Bytes == Length)
  {
    v12 = bswap32(usedBufLen);
    v2 = !*(_DWORD *)(a1 + 8)
      && ((*(uint64_t (**)(_QWORD, unsigned int *, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), &v12, 4) & 0x80000000) == 0&& (*(int (**)(_QWORD, UInt8 *, _QWORD))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), v8, usedBufLen) >= 0;
  }
  free(v8);
  return v2;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const UInt8 *ComputeHash::digest_data_xml(uint64_t a1, CFDataRef *a2)
{
  const UInt8 *result;
  uint64_t (*v5)(uint64_t);
  CFIndex Length;
  unsigned int v7;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!*a2)
    v5 = 0;
  if (!v5)
    return 0;
  Length = CFDataGetLength(*a2);
  v7 = bswap32(Length);
  if (!*(_DWORD *)(a1 + 8))
    (*(void (**)(_QWORD, unsigned int *, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), &v7, 4);
  result = CFDataGetBytePtr(*a2);
  if (result)
    return (const UInt8 *)((*(int (**)(_QWORD, const UInt8 *, CFIndex))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), result, Length) >= 0);
  return result;
}

const UInt8 *ComputeHash::digest_plist_file(ComputeHash *this, char *a2)
{
  const UInt8 *v2;
  CFDataRef v4;
  uint64_t (*v5)(uint64_t);
  CFDataRef v7;
  void *__p[2];
  char v9;
  CFDataRef v10;

  if (*((_DWORD *)this + 2))
    return 0;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v4 = FileSystemManager::copyBinaryPlistAsXML((uint64_t)__p);
  v10 = v4;
  if (v9 < 0)
    operator delete(__p[0]);
  v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v4)
    v5 = 0;
  if (v5)
  {
    v7 = v4;
    if (v4)
      CFRetain(v4);
    v2 = ComputeHash::digest_data((uint64_t)this, &v7);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v7);
  }
  else
  {
    v2 = 0;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v10);
  return v2;
}

void sub_2146656CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v16 - 24));
  _Unwind_Resume(a1);
}

uint64_t ComputeHash::digest_files(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;

  if (*(_DWORD *)(a1 + 8))
  {
    v2 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 != a2)
      FileSystemManager::getFileExtension((uint64_t *)(v3 + 16));
    v2 = 1;
  }
  return v2 & 1;
}

void sub_2146657F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL ComputeHash::digest_BOOL(uint64_t a1, const void **a2)
{
  uint64_t (*v5)(uint64_t);
  const void *v6;
  CFTypeID v7;
  Boolean Value;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  v5 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get;
  v6 = *a2;
  if (!*a2)
    v5 = 0;
  if (v5)
  {
    v7 = CFGetTypeID(v6);
    if (v7 != CFBooleanGetTypeID())
      return 0;
    v6 = *a2;
  }
  Value = CFBooleanGetValue((CFBooleanRef)v6);
  return (*(unsigned int (**)(_QWORD, Boolean *, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), &Value, 1) != 0;
}

uint64_t ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ComputeHash::digest_number(uint64_t a1, CFNumberRef *a2)
{
  CFIndex ByteSize;
  CFNumberType Type;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a1 + 8) && !CFNumberIsFloatType(*a2))
  {
    ByteSize = CFNumberGetByteSize(*a2);
    if (ByteSize >= 9)
    {
      v7 = bswap32(ByteSize);
      if (!*(_DWORD *)(a1 + 8))
        (*(void (**)(_QWORD, unsigned int *, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), &v7, 4);
      Type = CFNumberGetType(*a2);
      CFNumberGetValue(*a2, Type, &v7);
    }
  }
  return 0;
}

const UInt8 *ComputeHash::digest_date(uint64_t a1, const void **a2)
{
  const UInt8 *v2;
  const void *v5;
  uint64_t (*v6)(uint64_t);
  CFTypeID v7;
  CFDataRef Data;
  CFTypeRef v9;
  uint64_t (*v10)(uint64_t);
  CFTypeRef v12;
  CFTypeRef cf;
  const void *v14;

  if (!*(_DWORD *)(a1 + 8))
  {
    cf = 0;
    v5 = *a2;
    v6 = ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::get;
    if (!v5)
      v6 = 0;
    if (!v6)
    {
      v7 = CFGetTypeID(v5);
      if (v7 != CFDateGetTypeID())
        goto LABEL_14;
      v5 = *a2;
    }
    Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, kCFPropertyListXMLFormat_v1_0, 0, 0);
    v9 = cf;
    cf = Data;
    v14 = v9;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
    v10 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    if (!cf)
      v10 = 0;
    if (v10)
    {
      v12 = cf;
      if (cf)
        CFRetain(cf);
      v2 = ComputeHash::digest_data(a1, (CFDataRef *)&v12);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v12);
      goto LABEL_15;
    }
LABEL_14:
    v2 = 0;
LABEL_15:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
    return v2;
  }
  return 0;
}

void sub_214665A70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL ComputeHash::digest_array(uint64_t a1, CFArrayRef *a2)
{
  BOOL v2;
  CFIndex Count;
  __CFArray *MutableCopy;
  uint64_t (*v7)(uint64_t);
  BOOL v8;
  CFTypeID v9;
  CFTypeID TypeID;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFComparisonResult (__cdecl *v14)(const void *, const void *, void *);
  CFIndex v15;
  unsigned __int8 v16;
  const void *v17;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *ValueAtIndex;
  CFMutableArrayRef theArray;
  const void *v31;
  CFRange v32;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  v31 = 0;
  Count = CFArrayGetCount(*a2);
  MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, *a2);
  theArray = MutableCopy;
  v7 = ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::get;
  if (!MutableCopy)
    v7 = 0;
  if (v7)
    v8 = Count < 1;
  else
    v8 = 1;
  if (v8)
  {
    v2 = 0;
    goto LABEL_38;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, 0);
  ctu::cf::CFSharedRef<void const>::operator=(&v31, &ValueAtIndex);
  v9 = CFGetTypeID(v31);
  TypeID = CFStringGetTypeID();
  v11 = CFDictionaryGetTypeID();
  v12 = CFNumberGetTypeID();
  v13 = CFBooleanGetTypeID();
  v21 = CFDataGetTypeID();
  v20 = CFDateGetTypeID();
  v19 = CFArrayGetTypeID();
  if (v9 == TypeID)
  {
    v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x24BDBC4D0];
LABEL_17:
    v32.location = 0;
    v32.length = Count;
    CFArraySortValues(theArray, v32, v14, 0);
    goto LABEL_18;
  }
  if (v9 == v12)
  {
    v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x24BDBC098];
    goto LABEL_17;
  }
  if (v9 == v20)
  {
    v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x24BDBBD28];
    goto LABEL_17;
  }
LABEL_18:
  v2 = 0;
  v15 = 0;
  v16 = 0;
  while (1)
  {
    v17 = CFArrayGetValueAtIndex(theArray, v15);
    ValueAtIndex = v17;
    if (v17)
      CFRetain(v17);
    if (v9 == TypeID)
    {
      ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v28, &ValueAtIndex);
      v16 = ComputeHash::digest_string(a1, (CFStringRef *)&v28);
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
      goto LABEL_34;
    }
    if (v9 != v11)
      break;
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v27, &ValueAtIndex);
    v16 = ComputeHash::digest_dictionary(a1, &v27);
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v27);
LABEL_34:
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&ValueAtIndex);
    if ((v16 & 1) != 0)
    {
      v2 = ++v15 >= Count;
      v16 = 1;
      if (Count != v15)
        continue;
    }
    goto LABEL_38;
  }
  if (v9 != v12)
  {
    if (v9 == v13)
    {
      ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v25, &ValueAtIndex);
      v16 = ComputeHash::digest_BOOL(a1, &v25);
      ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v25);
    }
    else if (v9 == v21)
    {
      ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v24, &ValueAtIndex);
      v16 = ComputeHash::digest_data_xml(a1, (CFDataRef *)&v24);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    else if (v9 == v20)
    {
      ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(&v23, &ValueAtIndex);
      v16 = ComputeHash::digest_date(a1, &v23);
      ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(&v23);
    }
    else if (v9 == v19)
    {
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v22, &ValueAtIndex);
      v16 = ComputeHash::digest_array(a1, &v22);
      ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v22);
    }
    goto LABEL_34;
  }
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&v26, &ValueAtIndex);
  ComputeHash::digest_number(a1, (CFNumberRef *)&v26);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v26);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&ValueAtIndex);
LABEL_38:
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&theArray);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v31);
  return v2;
}

void sub_214665DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  const void *v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  va_list va1;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, const void *);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, const void *);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)va2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v9 - 88));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const void **ctu::cf::CFSharedRef<void const>::operator=(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  const void *v4;
  const void *v6;

  v3 = *a2;
  if (*a2)
    CFRetain(*a2);
  v4 = *a1;
  *a1 = v3;
  v6 = v4;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v6);
  return a1;
}

BOOL ComputeHash::digest_dictionary(uint64_t a1, CFDictionaryRef *a2)
{
  BOOL v2;
  uint64_t (*v5)(uint64_t);
  CFIndex Count;
  uint64_t v7;
  CFIndex v8;
  const void *ValueAtIndex;
  BOOL v10;
  const void *Value;
  CFTypeID v12;
  BOOL v13;
  char v14;
  BOOL v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  BOOL v18;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  CFTypeRef cf;
  const void *v28;
  const void *v29;
  CFMutableArrayRef Mutable;
  CFRange v31;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  v5 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!*a2)
    v5 = 0;
  if (!v5)
  {
    return 0;
  }
  else
  {
    Count = CFDictionaryGetCount(*a2);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
    CFDictionaryApplyFunction(*a2, (CFDictionaryApplierFunction)add_key, Mutable);
    v7 = CFArrayGetCount(Mutable);
    v31.location = 0;
    v31.length = v7;
    CFArraySortValues(Mutable, v31, MEMORY[0x24BDBC4D0], 0);
    if (v7 < 1)
    {
      v2 = 1;
    }
    else
    {
      v2 = 0;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v8);
        v29 = ValueAtIndex;
        if (ValueAtIndex)
        {
          CFRetain(ValueAtIndex);
          v28 = v29;
          if (v29)
            CFRetain(v29);
        }
        else
        {
          v28 = 0;
        }
        v10 = ComputeHash::digest_string(a1, (CFStringRef *)&v28);
        ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
        if (!v10)
          break;
        Value = CFDictionaryGetValue(*a2, v29);
        cf = Value;
        if (Value)
        {
          CFRetain(Value);
          Value = cf;
        }
        v12 = CFGetTypeID(Value);
        if (v12 == CFStringGetTypeID())
        {
          ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v26, &cf);
          v13 = ComputeHash::digest_string(a1, (CFStringRef *)&v26);
          ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v26);
          if (!v13)
            goto LABEL_37;
        }
        else if (v12 == CFDictionaryGetTypeID())
        {
          ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v25, &cf);
          v14 = ComputeHash::digest_dictionary(a1, &v25);
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v25);
          if ((v14 & 1) == 0)
            goto LABEL_37;
        }
        else
        {
          if (v12 == CFNumberGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&v24, &cf);
            ComputeHash::digest_number(a1, (CFNumberRef *)&v24);
            ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v24);
LABEL_37:
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
            break;
          }
          if (v12 == CFBooleanGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v23, &cf);
            v15 = ComputeHash::digest_BOOL(a1, &v23);
            ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v23);
            if (!v15)
              goto LABEL_37;
          }
          else if (v12 == CFDataGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v22, &cf);
            v16 = ComputeHash::digest_data_xml(a1, (CFDataRef *)&v22);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v22);
            if ((v16 & 1) == 0)
              goto LABEL_37;
          }
          else if (v12 == CFDateGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(&v21, &cf);
            v17 = ComputeHash::digest_date(a1, &v21);
            ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(&v21);
            if ((v17 & 1) == 0)
              goto LABEL_37;
          }
          else if (v12 == CFArrayGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v20, &cf);
            v18 = ComputeHash::digest_array(a1, (CFArrayRef *)&v20);
            ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v20);
            if (!v18)
              goto LABEL_37;
          }
        }
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
        v2 = ++v8 >= v7;
        if (v7 == v8)
          goto LABEL_39;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
    }
LABEL_39:
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&Mutable);
  }
  return v2;
}

void sub_2146661C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  const void *v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v8 = va_arg(va1, const void *);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(v6 - 64));
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)(v6 - 56));
  _Unwind_Resume(a1);
}

void add_key(const void *a1, const void *a2, __CFArray *a3)
{
  if (!CFEqual(a1, CFSTR("signature")))
    CFArrayAppendValue(a3, a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ComputeHash::finalize@<X0>(ComputeHash *this@<X0>, CFDataRef *a2@<X8>)
{
  size_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  const void *v8[2];

  v8[1] = *(const void **)MEMORY[0x24BDAC8D0];
  *a2 = 0;
  v4 = (*(unsigned __int8 (**)(_QWORD))(**((_QWORD **)this + 2) + 24))(*((_QWORD *)this + 2));
  result = MEMORY[0x24BDAC7A8]();
  v7 = (char *)v8 - v6;
  if (!*((_DWORD *)this + 2))
  {
    bzero(v7, v4);
    result = (*(uint64_t (**)(_QWORD, char *))(**((_QWORD **)this + 2) + 16))(*((_QWORD *)this + 2), v7);
    if ((result & 0x80000000) == 0)
    {
      *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v7, v4);
      v8[0] = 0;
      result = (uint64_t)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v8);
      *((_DWORD *)this + 2) = 1;
    }
  }
  return result;
}

void sub_2146663C8(_Unwind_Exception *a1)
{
  const void **v1;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t ComputeHash::reset_state(uint64_t this)
{
  *(_DWORD *)(this + 8) = 2;
  return this;
}

uint64_t ComputeHash::get_digest_size(ComputeHash *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 2) + 24))(*((_QWORD *)this + 2));
}

void ComputeHash::~ComputeHash(ComputeHash *this)
{
  *(_QWORD *)this = &off_24D1DD888;
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

{
  *(_QWORD *)this = &off_24D1DD888;
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D1DD758, MEMORY[0x24BEDAAF0]);
}

void sub_21466671C(_Unwind_Exception *a1)
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

uint64_t std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

_QWORD *ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFStringGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFDictionaryGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFNumberGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFBooleanGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFDataGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a1, v5);
}

_QWORD *ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFDateGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFArrayGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(a1, v5);
}

_QWORD *ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

uint64_t defaultLogFunction(const char *a1)
{
  return printf("%s", a1);
}

void CBSignUtilityLogger::CBSignUtilityLogger(CBSignUtilityLogger *this)
{
  *(_QWORD *)this = defaultLogFunction;
}

{
  *(_QWORD *)this = defaultLogFunction;
}

_QWORD *CBSignUtilityLogger::setLogFunction(_QWORD *this, void (*a2)(const char *))
{
  *this = a2;
  return this;
}

uint64_t CBSignUtilityLogger::getLogFunction(CBSignUtilityLogger *this)
{
  return *(_QWORD *)this;
}

_QWORD *CBSignUtilityLogger::getMyInstance(CBSignUtilityLogger *this)
{
  _QWORD *result;

  result = (_QWORD *)CBSignUtilityLogger::myInstance;
  if (!CBSignUtilityLogger::myInstance)
  {
    result = (_QWORD *)operator new();
    *result = defaultLogFunction;
    CBSignUtilityLogger::myInstance = (uint64_t)result;
  }
  return result;
}

void CBSignUtilityLogger::destroyMyInstance(CBSignUtilityLogger *this)
{
  if (!CBSignUtilityLogger::myInstance)
    CBSignUtilityLogger::myInstance = 0;
}

uint64_t writeLog(const char *__format, ...)
{
  _QWORD *v2;
  char __str[1024];
  uint64_t v4;
  va_list va;

  va_start(va, __format);
  v4 = *MEMORY[0x24BDAC8D0];
  vsnprintf(__str, 0x400uLL, __format, va);
  if (CBSignUtilityLogger::myInstance)
    return (*(uint64_t (**)(char *))CBSignUtilityLogger::myInstance)(__str);
  v2 = (_QWORD *)operator new();
  *v2 = defaultLogFunction;
  CBSignUtilityLogger::myInstance = (uint64_t)v2;
  return defaultLogFunction(__str);
}

void *PublicKeys::get_sha1_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha1_development_publickey;
}

void *PublicKeys::get_sha1_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha1_production_publickey;
}

void *PublicKeys::get_sha2_256_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_256_development_publickey;
}

void *PublicKeys::get_sha2_256_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_256_production_publickey;
}

void *PublicKeys::get_sha2_384_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_384_development_publickey;
}

void *PublicKeys::get_sha2_384_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_384_production_publickey;
}

uint64_t PublicKeys::get_sha1_development_keysize(PublicKeys *this)
{
  return 140;
}

uint64_t PublicKeys::get_sha1_production_keysize(PublicKeys *this)
{
  return 140;
}

uint64_t PublicKeys::get_sha2_256_development_keysize(PublicKeys *this)
{
  return 270;
}

uint64_t PublicKeys::get_sha2_256_production_keysize(PublicKeys *this)
{
  return 270;
}

uint64_t PublicKeys::get_sha2_384_development_keysize(PublicKeys *this)
{
  return 97;
}

uint64_t PublicKeys::get_sha2_384_production_keysize(PublicKeys *this)
{
  return 97;
}

void *PublicKeys::get_public_key(uint64_t a1, int a2, int a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = &PublicKeys::pkcs1_sha2_384_production_publickey;
  if (a3 != 1)
    v3 = 0;
  if (!a3)
    v3 = &PublicKeys::pkcs1_sha2_384_development_publickey;
  v4 = &PublicKeys::pkcs1_sha2_256_production_publickey;
  if (a3 != 1)
    v4 = 0;
  if (!a3)
    v4 = &PublicKeys::pkcs1_sha2_256_development_publickey;
  v5 = &PublicKeys::pkcs1_sha1_production_publickey;
  if (a3 != 1)
    v5 = 0;
  if (!a3)
    v5 = &PublicKeys::pkcs1_sha1_development_publickey;
  if (a2)
    v5 = 0;
  if (a2 != 1)
    v4 = v5;
  if (a2 == 2)
    return v3;
  else
    return v4;
}

uint64_t PublicKeys::get_public_key_size(uint64_t a1, int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;

  if (a3 >= 2)
    v3 = -1;
  else
    v3 = 97;
  if (a3 >= 2)
    v4 = -1;
  else
    v4 = 270;
  if (a3 >= 2)
    v5 = -1;
  else
    v5 = 140;
  if (a2)
    v6 = -1;
  else
    v6 = v5;
  if (a2 == 1)
    v6 = v4;
  if (a2 == 2)
    return v3;
  else
    return v6;
}

_QWORD *CarrierBundle::CarrierBundle(_QWORD *result, uint64_t a2)
{
  result[2] = 0;
  *result = a2;
  result[1] = result + 2;
  result[5] = 0;
  result[3] = 0;
  result[4] = result + 5;
  result[8] = 0;
  result[6] = 0;
  result[7] = result + 8;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

{
  result[2] = 0;
  *result = a2;
  result[1] = result + 2;
  result[5] = 0;
  result[3] = 0;
  result[4] = result + 5;
  result[8] = 0;
  result[6] = 0;
  result[7] = result + 8;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

void CarrierBundle::~CarrierBundle(CarrierBundle *this)
{
  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy((uint64_t)this + 80, *((_QWORD **)this + 11));
  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy((uint64_t)this + 56, *((_QWORD **)this + 8));
  std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy((uint64_t)this + 32, *((_QWORD **)this + 5));
  std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy((uint64_t)this + 8, *((_QWORD **)this + 2));
}

uint64_t CarrierBundle::print(CarrierBundle *this)
{
  uint64_t v2;

  v2 = CarrierBundle::printDeviceModelFileMap((uint64_t)this, (_QWORD *)this + 1);
  CarrierBundle::printDeviceModelFileMap(v2, (_QWORD *)this + 4);
  return CarrierBundle::printDeviceModelFileDataMap((uint64_t)this);
}

uint64_t CarrierBundle::printDeviceModelFileMap(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  const char *v4;
  uint64_t result;
  uint64_t i;
  const char *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  v2 = a2 + 1;
  v3 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0)
        v4 = *(const char **)v4;
      writeLog("Class name: %s\n", v4);
      result = writeLog("---------- List of files in the class ---------------------\n");
      for (i = v3[8]; (_QWORD *)i != v3 + 7; i = *(_QWORD *)(i + 8))
      {
        v7 = (const char *)(i + 16);
        if (*(char *)(i + 39) < 0)
          v7 = *(const char **)v7;
        result = writeLog("%s\n", v7);
      }
      v8 = (_QWORD *)v3[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v3[2];
          v10 = *v9 == (_QWORD)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != v2);
  }
  return result;
}

uint64_t CarrierBundle::printDeviceModelFileDataMap(uint64_t this)
{
  _QWORD *v1;
  _QWORD *v2;
  const char *v3;
  _QWORD *v4;
  void **v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD *v10;
  void *__p[2];
  char v12;

  v1 = *(_QWORD **)(this + 56);
  v2 = (_QWORD *)(this + 64);
  if (v1 != (_QWORD *)(this + 64))
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      v3 = (const char *)(v1 + 4);
      if (*((char *)v1 + 55) < 0)
        v3 = *(const char **)v3;
      this = writeLog("Device Class = %s\n", v3);
      v4 = (_QWORD *)v1[7];
      if (v4 != v1 + 8)
      {
        do
        {
          FileSystemManager::basename((uint64_t)(v4 + 4), __p);
          if (v12 >= 0)
            v5 = __p;
          else
            v5 = (void **)__p[0];
          writeLog("\t\t FileName = %s\t", (const char *)v5);
          if (v12 < 0)
            operator delete(__p[0]);
          if (CFDataGetBytePtr((CFDataRef)v4[7]))
          {
            CFDataGetLength((CFDataRef)v4[7]);
            this = writeLog("fileDataLength = %ld \n");
          }
          else
          {
            this = writeLog("FileData is NULL\n");
          }
          v6 = (_QWORD *)v4[1];
          if (v6)
          {
            do
            {
              v7 = v6;
              v6 = (_QWORD *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              v7 = (_QWORD *)v4[2];
              v8 = *v7 == (_QWORD)v4;
              v4 = v7;
            }
            while (!v8);
          }
          v4 = v7;
        }
        while (v7 != v1 + 8);
      }
      v9 = (_QWORD *)v1[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v1[2];
          v8 = *v10 == (_QWORD)v1;
          v1 = v10;
        }
        while (!v8);
      }
      v1 = v10;
    }
    while (v10 != v2);
  }
  return this;
}

void sub_214667164(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t CarrierBundle::classifyFiles(uint64_t a1, char *a2)
{
  uint64_t v2;
  std::string v4;
  std::string v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;

  v6 = (uint64_t)&v6;
  v7 = &v6;
  v8 = 0;
  if (FileSystemManager::directoryContentsAtPath(a2, &v6, 1))
  {
    std::list<std::string>::__sort<std::__less<void,void>>((uint64_t)v7, (uint64_t)&v6, v8, (uint64_t)&v4);
    if (v7 != &v6)
    {
      memset(&v5, 0, sizeof(v5));
      FileSystemManager::getFileExtension(v7 + 2);
    }
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  std::__list_imp<std::string>::clear(&v6);
  return v2;
}

void sub_2146674E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  uint64_t v38;

  std::pair<std::string,std::list<std::string>>::~pair((uint64_t)&a18);
  std::__list_imp<std::string>::clear(&a12);
  if (a32 < 0)
    operator delete(__p);
  if (a38 < 0)
    operator delete(a33);
  std::__list_imp<std::string>::clear((_QWORD *)(v38 - 112));
  _Unwind_Resume(a1);
}

void CarrierBundle::getDeviceModelName(uint64_t a1@<X1>, std::string *a2@<X8>)
{
  uint64_t v3;
  unint64_t v5;
  std::string *v6;
  std::string::size_type v7;
  int v8;
  std::string::size_type size;
  std::string *p_str;
  std::string::size_type v12;
  int v13;
  std::string::size_type v14;
  std::string::size_type v15;
  std::string *v16;
  std::string::size_type v17;
  int v18;
  std::string v19;
  std::string __str;
  std::string v21;
  std::string __p;
  std::string v23;
  char v24;

  memset(&v23, 0, sizeof(v23));
  memset(&__p, 0, sizeof(__p));
  v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    goto LABEL_7;
  MEMORY[0x2199D3130](&v23, "common");
  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  if (v5 <= 8)
  {
LABEL_7:
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
    goto LABEL_21;
  }
  std::string::basic_string(&v21, (const std::string *)a1, 0, 9uLL, (std::allocator<char> *)&__str);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v21.__r_.__value_.__l.__size_ != 9)
      goto LABEL_18;
    v6 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) != 9)
      goto LABEL_18;
    v6 = &v21;
  }
  v7 = v6->__r_.__value_.__r.__words[0];
  v8 = v6->__r_.__value_.__s.__data_[8];
  if (v7 == 0x656469727265766FLL && v8 == 115)
  {
    std::string::basic_string(&__str, (const std::string *)a1, 9uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v19);
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __str.__r_.__value_.__l.__size_;
    if (size && *std::string::at(&__str, 0) == 42)
    {
      p_str = &__str;
      std::string::erase(&__str, 0, 1uLL);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v12 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v12 = __str.__r_.__value_.__l.__size_;
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      for (; v12; --v12)
      {
        v13 = p_str->__r_.__value_.__s.__data_[0];
        if (v13 == 46)
          break;
        if (v13 == 95)
          break;
        std::string::push_back(&__p, v13);
        p_str = (std::string *)((char *)p_str + 1);
      }
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v14 = __p.__r_.__value_.__l.__size_;
    std::string::basic_string(&v19, &__str, v14, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v24);
    v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v15 = __str.__r_.__value_.__l.__size_;
    if (v15 && *std::string::at(&v19, 0) == 95)
    {
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      {
        *v23.__r_.__value_.__l.__data_ = 0;
        v23.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v23.__r_.__value_.__s.__data_[0] = 0;
        *((_BYTE *)&v23.__r_.__value_.__s + 23) = 0;
      }
      v16 = &v19;
      std::string::erase(&v19, 0, 1uLL);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v17 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v17 = v19.__r_.__value_.__l.__size_;
        v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      for (; v17; --v17)
      {
        v18 = v16->__r_.__value_.__s.__data_[0];
        if (v18 == 46)
          break;
        std::string::push_back(&v23, v18);
        v16 = (std::string *)((char *)v16 + 1);
      }
    }
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    goto LABEL_19;
  }
LABEL_18:
  std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
LABEL_19:
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
LABEL_21:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
}

void sub_214667874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a32 < 0)
    operator delete(a27);
  if (*(char *)(v32 - 41) < 0)
    operator delete(*(void **)(v32 - 64));
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string,std::list<std::string>>::~pair(uint64_t a1)
{
  std::__list_imp<std::string>::clear((_QWORD *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t CarrierBundle::readBundle(CarrierBundle *this)
{
  std::string *v2;
  uint64_t v3;
  std::string *v4;
  CarrierBundle *v5;
  uint64_t v6;
  CarrierBundle *v7;
  CarrierBundle *v8;
  BOOL v9;
  __int128 *v10;
  char *v11;
  uint64_t i;
  uint64_t (*v13)(uint64_t);
  std::string::size_type v14;
  std::string *v15;
  __int128 *v16;
  __int128 *v17;
  uint64_t **v19;
  void *v20[2];
  std::string::size_type v21;
  const void *v22;
  char v23[8];
  std::string __p;
  const void *v25;
  _QWORD *v26;
  std::string v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  std::string v31;

  if (!CarrierBundle::classifyFiles((uint64_t)this, *(char **)this))
    return 0;
  CarrierBundle::getSignatureDirPath((const std::string **)this, &v31);
  if (FileSystemManager::isRegularFile((const char *)&v31))
  {
    v2 = &v31;
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v2 = (std::string *)v31.__r_.__value_.__r.__words[0];
    writeLog("signatures at path %s should be a directory, not a regular file : \n", (const char *)v2);
LABEL_60:
    v3 = 0;
  }
  else
  {
    if ((CarrierBundle::classifyFiles((uint64_t)this, (char *)&v31) & 1) == 0)
    {
      v4 = &v31;
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v4 = (std::string *)v31.__r_.__value_.__r.__words[0];
      writeLog("Unable to read and classify the signatures fies : %s\n", (const char *)v4);
    }
    v5 = (CarrierBundle *)*((_QWORD *)this + 1);
    if (v5 != (CarrierBundle *)((char *)this + 16))
    {
      do
      {
        v29 = 0;
        v30 = 0;
        v28 = (uint64_t *)&v29;
        v6 = *((_QWORD *)v5 + 8);
        if ((CarrierBundle *)v6 != (CarrierBundle *)((char *)v5 + 56))
        {
          if (*(char *)(v6 + 39) < 0)
            std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(v6 + 16), *(_QWORD *)(v6 + 24));
          else
            v27 = *(std::string *)(v6 + 16);
          CarrierBundle::readFile((uint64_t *)&v27, v20);
        }
        std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(&__p, (__int128 *)v5 + 2, (const void ***)&v28);
        std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t **)this + 7, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v25, v26);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v28, v29);
        v7 = (CarrierBundle *)*((_QWORD *)v5 + 1);
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = *(CarrierBundle **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (CarrierBundle *)*((_QWORD *)v5 + 2);
            v9 = *(_QWORD *)v8 == (_QWORD)v5;
            v5 = v8;
          }
          while (!v9);
        }
        v5 = v8;
      }
      while (v8 != (CarrierBundle *)((char *)this + 16));
    }
    v10 = (__int128 *)*((_QWORD *)this + 4);
    v11 = (char *)this + 40;
    if (v10 == (__int128 *)((char *)this + 40))
    {
      v3 = 1;
    }
    else
    {
      v19 = (uint64_t **)((char *)this + 80);
      do
      {
        v29 = 0;
        v30 = 0;
        v28 = (uint64_t *)&v29;
        for (i = *((_QWORD *)v10 + 8); (__int128 *)i != (__int128 *)((char *)v10 + 56); i = *(_QWORD *)(i + 8))
        {
          if (*(char *)(i + 39) < 0)
            std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(i + 16), *(_QWORD *)(i + 24));
          else
            v27 = *(std::string *)(i + 16);
          ctu::ns::AutoPool::AutoPool((ctu::ns::AutoPool *)v23);
          FileSystemManager::dictionaryFromPath((uint64_t *)&v27, &v22);
          if (v22)
            v13 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
          else
            v13 = 0;
          if (v13)
          {
            FileSystemManager::basename((uint64_t)&v27, v20);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v20;
            v14 = v21;
            v20[1] = 0;
            v21 = 0;
            v20[0] = 0;
            __p.__r_.__value_.__r.__words[2] = v14;
            v25 = v22;
            if (v22)
              CFRetain(v22);
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>(&v28, (const void **)&__p.__r_.__value_.__l.__data_, (__int128 *)&__p);
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v25);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v21) < 0)
              operator delete(v20[0]);
          }
          else
          {
            if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = &v27;
            else
              v15 = (std::string *)v27.__r_.__value_.__r.__words[0];
            writeLog("Error in readBundle : Failed to load signature file at path: %s\n", (const char *)v15);
          }
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v22);
          MEMORY[0x2199D30B8](v23);
          if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v27.__r_.__value_.__l.__data_);
          if (!v13)
          {
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v28, v29);
            goto LABEL_60;
          }
        }
        std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>&,0>(&__p, v10 + 2, (const void ***)&v28);
        std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>(v19, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v25, v26);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v28, v29);
        v16 = (__int128 *)*((_QWORD *)v10 + 1);
        if (v16)
        {
          do
          {
            v17 = v16;
            v16 = *(__int128 **)v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (__int128 *)*((_QWORD *)v10 + 2);
            v9 = *(_QWORD *)v17 == (_QWORD)v10;
            v10 = v17;
          }
          while (!v9);
        }
        v3 = 1;
        v10 = v17;
      }
      while (v17 != (__int128 *)v11);
    }
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  return v3;
}

void sub_214667DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38,_QWORD *a39)
{
  uint64_t v39;

  std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::~pair((uint64_t)&a24);
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&a38, a39);
  if (*(char *)(v39 - 89) < 0)
    operator delete(*(void **)(v39 - 112));
  _Unwind_Resume(a1);
}

std::string *CarrierBundle::getSignatureDirPath@<X0>(const std::string **this@<X0>, std::string *a2@<X8>)
{
  const std::string *v4;
  std::string::size_type size;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(a2, *this);
  v4 = *this;
  if (SHIBYTE((*this)->__r_.__value_.__r.__words[2]) < 0)
    size = v4->__r_.__value_.__l.__size_;
  else
    size = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
  if (*std::string::at(v4, size - 1) != 47)
    std::string::append(a2, "/");
  return std::string::append(a2, "signatures");
}

void sub_214667F4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void CarrierBundle::readFile(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  FileSystemManager::getFileExtension(a1);
}

void sub_214667F98(uint64_t a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, std::string *a8, uint64_t a9, void *__pa, uint64_t a11, uint64_t a12, uint64_t a13)
{
  CFDataRef *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  CFDataRef v18;
  CFDataRef v19;
  const void *v20[2];
  char v21;
  std::string v22;

  if (!std::string::compare(&v22, "plist"))
  {
    if (v14[23] >= 0)
      v17 = v14;
    else
      v17 = *(char **)v14;
    std::string::basic_string[abi:ne180100]<0>(v20, v17);
    v18 = FileSystemManager::copyBinaryPlistAsXML((uint64_t)v20);
    v19 = *v13;
    *v13 = v18;
    *(_QWORD *)(v15 - 24) = v19;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v15 - 24));
    if (v21 < 0)
      operator delete((void *)v20[0]);
  }
  else
  {
    if (v14[23] >= 0)
      v16 = (uint64_t)v14;
    else
      v16 = *(_QWORD *)v14;
    FileSystemManager::fileContentsAtPath(v16, (_QWORD *)(v15 - 24));
    if ((CFDataRef *)(v15 - 24) != v13)
    {
      v20[0] = *v13;
      *v13 = *(CFDataRef *)(v15 - 24);
      *(_QWORD *)(v15 - 24) = 0;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v20);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v15 - 24));
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
}

void sub_21466805C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  const void **v21;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v21);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::~pair(uint64_t a1)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::~pair(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::~pair(uint64_t a1)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::~pair(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t CarrierBundle::verifySignatures(uint64_t a1, int a2, uint64_t a3, _BOOL8 a4, int a5)
{
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  void *__p[2];
  char v17;

  if (!CarrierBundle::verifySignaturesOfGroup(a1, a2, a3, a4))
  {
    writeLog("Unable to verify the signatures of the some of the groups\n");
    return 0;
  }
  if (!a5)
    return 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "pri");
  v10 = CarrierBundle::verifySignaturesOfFiles(a1, a2, v9, a4, (uint64_t)__p);
  v11 = v10;
  if (v17 < 0)
  {
    operator delete(__p[0]);
    if (v11)
      goto LABEL_5;
LABEL_12:
    writeLog("Unable to verify the signatures of the %s files \n");
    return 0;
  }
  if (!v10)
    goto LABEL_12;
LABEL_5:
  std::string::basic_string[abi:ne180100]<0>(__p, "gri");
  v13 = CarrierBundle::verifySignaturesOfFiles(a1, a2, v12, a4, (uint64_t)__p);
  v14 = v13;
  if (v17 < 0)
  {
    operator delete(__p[0]);
    if (v14)
      return 1;
  }
  else if (v13)
  {
    return 1;
  }
  writeLog("Unable to verify the signatures of the %s files s\n");
  return 0;
}

void sub_214668294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL CarrierBundle::verifySignaturesOfGroup(uint64_t a1, int a2, uint64_t a3, _BOOL8 a4)
{
  char *DigestForCBSignatureType;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  CFStringRef v16;
  uint64_t (*v17)(uint64_t);
  uint64_t (*v18)(uint64_t);
  BOOL v19;
  int v20;
  std::string *v21;
  void **v22;
  _BOOL8 v23;
  uint64_t *v24;
  uint64_t *v25;
  BOOL v26;
  CFTypeRef v28;
  const void *v29;
  void *__p[2];
  uint64_t v31;
  CFTypeRef cf;
  CFStringRef v33;
  void *v34;
  char v35;
  void *v36[2];
  unsigned __int8 v37;
  CFDictionaryRef theDict;
  std::string v39;
  uint64_t *v40;
  _QWORD *v41[2];
  __int128 v42;
  uint64_t v43;

  DigestForCBSignatureType = (char *)getDigestForCBSignatureType(a2);
  v41[0] = 0;
  v41[1] = 0;
  v40 = (uint64_t *)v41;
  if ((CarrierBundle::computeHash(a1, DigestForCBSignatureType, &v40) & 1) == 0)
  {
    writeLog("Unable to compute hash for digestType %d", (_DWORD)DigestForCBSignatureType);
    goto LABEL_50;
  }
  v7 = v40;
  if (v40 == (uint64_t *)v41)
  {
    v23 = 1;
    goto LABEL_52;
  }
  v8 = a1 + 80;
  v9 = a1 + 88;
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    v11 = (const char *)(v7 + 4);
    v12 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v8, (const void **)v7 + 4);
    if (v9 == v12)
      break;
    getSignatureFileName((std::string *)(v7 + 4), &v39);
    v13 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v12 + 56, (const void **)&v39.__r_.__value_.__l.__data_);
    if (v12 + 64 == v13)
    {
      v21 = &v39;
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v21 = (std::string *)v39.__r_.__value_.__r.__words[0];
      writeLog("Unable to find the signature dictionary for the file %s\n", (const char *)v21);
      v20 = 1;
      goto LABEL_39;
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&theDict, (const void **)(v13 + 56));
    getPrefixForDigestType(DigestForCBSignatureType, v36);
    v14 = v37;
    if ((v37 & 0x80u) != 0)
      v14 = (unint64_t)v36[1];
    if (v14)
    {
      std::operator+<char>();
      if (v35 >= 0)
        v15 = (const char *)&v34;
      else
        v15 = (const char *)v34;
      v16 = CFStringCreateWithCString(v10, v15, 0x8000100u);
      v33 = v16;
      v17 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      if (!v16)
        v17 = 0;
      if (v17)
      {
        *(_QWORD *)&v42 = CFDictionaryGetValue(theDict, v16);
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v42);
        v18 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        if (!cf)
          v18 = 0;
        if (v18)
        {
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v29, (const void **)v7 + 7);
          v28 = cf;
          if (cf)
            CFRetain(cf);
          v19 = VerifyDigest(&v29, &v28, a4, (int)DigestForCBSignatureType);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v29);
          if (v19)
          {
            v20 = 0;
            goto LABEL_33;
          }
          writeLog("Verification of the signed digest failed\n");
        }
        else
        {
          v42 = 0uLL;
          v43 = 0;
          ctu::cf::assign();
          *(_OWORD *)__p = v42;
          v31 = v43;
          v22 = (void **)v42;
          if (v43 >= 0)
            v22 = __p;
          writeLog("Error: Failed to lookup for signature key %s in signing plist\n", (const char *)v22);
          if (SHIBYTE(v31) < 0)
            operator delete(__p[0]);
        }
        v20 = 1;
LABEL_33:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
      }
      else
      {
        v20 = 1;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v33);
      if (v35 < 0)
        operator delete(v34);
      goto LABEL_36;
    }
    writeLog("Error: Failed to get the prefix for digest type: %d\n", (_DWORD)DigestForCBSignatureType);
    v20 = 1;
LABEL_36:
    if ((char)v37 < 0)
      operator delete(v36[0]);
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
LABEL_39:
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    v23 = v20 == 0;
    if (!v20)
    {
      v24 = (uint64_t *)v7[1];
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = (uint64_t *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (uint64_t *)v7[2];
          v26 = *v25 == (_QWORD)v7;
          v7 = v25;
        }
        while (!v26);
      }
      v7 = v25;
      if (v25 != (uint64_t *)v41)
        continue;
    }
    goto LABEL_52;
  }
  if (*((char *)v7 + 55) < 0)
    v11 = *(const char **)v11;
  writeLog("Unable to find the signatures for the device model %s\n", v11);
LABEL_50:
  v23 = 0;
LABEL_52:
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v40, v41[0]);
  return v23;
}

void sub_214668624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  uint64_t v48;

  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(v48 - 136, *(_QWORD **)(v48 - 128));
  _Unwind_Resume(a1);
}

BOOL CarrierBundle::verifySignaturesOfFiles(uint64_t a1, int a2, uint64_t a3, _BOOL8 a4, uint64_t a5)
{
  char *DigestForCBSignatureType;
  uint64_t *v9;
  const __CFAllocator *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  void **v16;
  CFStringRef v17;
  uint64_t (*v18)(uint64_t);
  uint64_t (*v19)(uint64_t);
  BOOL v20;
  int v21;
  void **v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  int v26;
  std::string *v27;
  _BOOL8 v28;
  uint64_t *v29;
  uint64_t *v30;
  const char *v31;
  uint64_t v33;
  uint64_t v34;
  CFTypeRef v35;
  const void *v36;
  void *__p[2];
  uint64_t v38;
  CFTypeRef cf;
  CFStringRef v40;
  void *v41[2];
  char v42;
  void *v43[2];
  unsigned __int8 v44;
  CFDictionaryRef theDict;
  std::string v46;
  uint64_t *v47;
  _QWORD *v48[2];
  __int128 v49;
  uint64_t v50;

  DigestForCBSignatureType = (char *)getDigestForCBSignatureType(a2);
  v48[0] = 0;
  v48[1] = 0;
  v47 = (uint64_t *)v48;
  if ((CarrierBundle::computeHashForFiles(a1, DigestForCBSignatureType, &v47) & 1) != 0)
  {
    v9 = v47;
    if (v47 == (uint64_t *)v48)
    {
      v28 = 1;
      goto LABEL_66;
    }
    v33 = a1 + 88;
    v34 = a1 + 80;
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      v11 = (const char *)(v9 + 4);
      v12 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v34, (const void **)v9 + 4);
      if (v33 == v12)
        break;
      getSignatureFileName((std::string *)(v9 + 4), &v46);
      v13 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v12 + 56, (const void **)&v46.__r_.__value_.__l.__data_);
      if (v12 + 64 == v13)
      {
        v27 = &v46;
        if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v27 = (std::string *)v46.__r_.__value_.__r.__words[0];
        writeLog("Unable to find the signature dictionary for the file %s\n", (const char *)v27);
        v26 = 1;
      }
      else
      {
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&theDict, (const void **)(v13 + 56));
        getPrefixForDigestType(DigestForCBSignatureType, v43);
        v14 = v44;
        if ((v44 & 0x80u) != 0)
          v14 = (unint64_t)v43[1];
        if (v14)
        {
          v15 = (uint64_t *)v9[7];
          if (v15 != v9 + 8)
          {
            while (1)
            {
              std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v15 + 4, (const void **)v43, (uint64_t)v41);
              if (v42 >= 0)
                v16 = v41;
              else
                v16 = (void **)v41[0];
              v17 = CFStringCreateWithCString(v10, (const char *)v16, 0x8000100u);
              v40 = v17;
              if (v17)
                v18 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
              else
                v18 = 0;
              if (!v18)
              {
                v21 = 1;
                goto LABEL_32;
              }
              *(_QWORD *)&v49 = CFDictionaryGetValue(theDict, v17);
              ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v49);
              v19 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
              if (!cf)
                v19 = 0;
              if (!v19)
                break;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v36, (const void **)v15 + 7);
              v35 = cf;
              if (cf)
                CFRetain(cf);
              v20 = VerifyDigest(&v36, &v35, a4, (int)DigestForCBSignatureType);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v35);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
              if (!v20)
              {
                writeLog("Verification of the signed digest failed\n");
LABEL_30:
                v21 = 1;
                goto LABEL_31;
              }
              v21 = 0;
LABEL_31:
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
LABEL_32:
              ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v40);
              if (v42 < 0)
                operator delete(v41[0]);
              if (v21)
                goto LABEL_46;
              v23 = (uint64_t *)v15[1];
              if (v23)
              {
                do
                {
                  v24 = v23;
                  v23 = (uint64_t *)*v23;
                }
                while (v23);
              }
              else
              {
                do
                {
                  v24 = (uint64_t *)v15[2];
                  v25 = *v24 == (_QWORD)v15;
                  v15 = v24;
                }
                while (!v25);
              }
              v15 = v24;
              if (v24 == v9 + 8)
                goto LABEL_41;
            }
            v49 = 0uLL;
            v50 = 0;
            ctu::cf::assign();
            *(_OWORD *)__p = v49;
            v38 = v50;
            v22 = (void **)v49;
            if (v50 >= 0)
              v22 = __p;
            writeLog("Error: Failed to lookup for signature key %s in signing plist\n", (const char *)v22);
            if (SHIBYTE(v38) < 0)
              operator delete(__p[0]);
            goto LABEL_30;
          }
LABEL_41:
          v26 = 0;
        }
        else
        {
          writeLog("Error: Failed to get the prefix for digest type: %d\n", (_DWORD)DigestForCBSignatureType);
LABEL_46:
          v26 = 1;
        }
        if ((char)v44 < 0)
          operator delete(v43[0]);
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
      }
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v46.__r_.__value_.__l.__data_);
      v28 = v26 == 0;
      if (!v26)
      {
        v29 = (uint64_t *)v9[1];
        if (v29)
        {
          do
          {
            v30 = v29;
            v29 = (uint64_t *)*v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            v30 = (uint64_t *)v9[2];
            v25 = *v30 == (_QWORD)v9;
            v9 = v30;
          }
          while (!v25);
        }
        v9 = v30;
        if (v30 != (uint64_t *)v48)
          continue;
      }
      goto LABEL_66;
    }
    if (*((char *)v9 + 55) < 0)
      v11 = *(const char **)v11;
    writeLog("Unable to find the signatures for the device model %s\n", v11);
  }
  else
  {
    if (*(char *)(a5 + 23) >= 0)
      v31 = (const char *)a5;
    else
      v31 = *(const char **)a5;
    writeLog("Unable to compute the hash for the file types : %s \n", v31);
  }
  v28 = 0;
LABEL_66:
  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy((uint64_t)&v47, v48[0]);
  return v28;
}

void sub_214668AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,char a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  uint64_t v50;

  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(v50 - 136, *(_QWORD **)(v50 - 128));
  _Unwind_Resume(a1);
}

uint64_t CarrierBundle::computeHash(uint64_t a1, char *a2, uint64_t **a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  uint64_t (*v19)(uint64_t);
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const void *v28;
  CFTypeRef v29;
  std::string v30;
  const void *v31;
  CFTypeRef cf;
  uint64_t v33;
  std::__shared_weak_count *v34;
  void *__p[2];
  char v36;
  uint64_t v37;
  std::__shared_weak_count *v38;

  v6 = (_QWORD *)(a1 + 56);
  std::string::basic_string[abi:ne180100]<0>(__p, "common");
  v7 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>((uint64_t)v6, (const void **)__p);
  if (v36 < 0)
    operator delete(__p[0]);
  v8 = (_QWORD *)(a1 + 64);
  if (a1 + 64 == v7)
  {
    writeLog("Error : No set of common files found. Bundle may be missing something\n");
    return 0;
  }
  DigestGenerator::getDigestGenerator(a2, &v37);
  ComputeHash::ComputeHash((ComputeHash *)__p);
  v33 = v37;
  v34 = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  ComputeHash::setDigestGenerator((uint64_t)__p, &v33);
  v11 = v34;
  if (v34)
  {
    v12 = (unint64_t *)&v34->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = ComputeHash::init((ComputeHash *)__p);
  if ((v14 & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
LABEL_40:
    v23 = 0;
    goto LABEL_50;
  }
  if ((CarrierBundle::computeDigestForFileDataMap(v14, (_QWORD *)(v7 + 56), (uint64_t)__p) & 1) == 0)
  {
    writeLog("Error : Unable to compute digest for FileDataMap\n");
    goto LABEL_40;
  }
  ComputeHash::finalize((ComputeHash *)__p, (CFDataRef *)&cf);
  std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&v30, (__int128 *)(v7 + 32), &cf);
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(a3, (const void **)&v30.__r_.__value_.__l.__data_, (__int128 *)&v30);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  v15 = (_QWORD *)*v6;
  if ((_QWORD *)*v6 == v8)
  {
LABEL_36:
    v23 = 1;
    goto LABEL_49;
  }
  while (1)
  {
    ComputeHash::reset_state((uint64_t)__p);
    v16 = (const char *)(v15 + 4);
    if (!std::string::compare((const std::string *)(v15 + 4), "common"))
      goto LABEL_30;
    if (!ComputeHash::init((ComputeHash *)__p))
      goto LABEL_42;
    v29 = cf;
    if (cf)
      CFRetain(cf);
    v17 = (uint64_t)ComputeHash::digest_data((uint64_t)__p, (CFDataRef *)&v29);
    if ((v17 & 1) == 0)
      break;
    v18 = CarrierBundle::computeDigestForFileDataMap(v17, v15 + 7, (uint64_t)__p);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v29);
    if ((v18 & 1) == 0)
      goto LABEL_42;
    ComputeHash::finalize((ComputeHash *)__p, (CFDataRef *)&v28);
    if (v28)
      v19 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    else
      v19 = 0;
    if (!v19)
    {
      if (*((char *)v15 + 55) < 0)
        v16 = *(const char **)v16;
      writeLog("Error : Unable to compute the digest for FileDigestMap associated with %s\n", v16);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
      goto LABEL_48;
    }
    std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&v30, (__int128 *)v15 + 2, &v28);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(a3, (const void **)&v30.__r_.__value_.__l.__data_, (__int128 *)&v30);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30.__r_.__value_.__l.__data_);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
LABEL_30:
    v20 = (_QWORD *)v15[1];
    if (v20)
    {
      do
      {
        v21 = v20;
        v20 = (_QWORD *)*v20;
      }
      while (v20);
    }
    else
    {
      do
      {
        v21 = (_QWORD *)v15[2];
        v22 = *v21 == (_QWORD)v15;
        v15 = v21;
      }
      while (!v22);
    }
    v15 = v21;
    if (v21 == v8)
      goto LABEL_36;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v29);
LABEL_42:
  if (*((char *)v15 + 55) < 0)
    v16 = *(const char **)v16;
  writeLog("Error : Unable to compute the digest for FileDigestMap associated with %s\n", v16);
LABEL_48:
  v23 = 0;
LABEL_49:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
LABEL_50:
  ComputeHash::~ComputeHash((ComputeHash *)__p);
  v24 = v38;
  if (v38)
  {
    v25 = (unint64_t *)&v38->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  return v23;
}

void sub_214668F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, __int16 a11, char a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,const void *a21,__int16 a22,char a23,char a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a21);
  ComputeHash::~ComputeHash((ComputeHash *)&__p);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100](v31 - 80);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t CarrierBundle::computeHashForFiles(uint64_t a1, char *a2, uint64_t **a3)
{
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  BOOL v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::string __p;
  _QWORD *v21[8];
  void *v22[2];
  const void **v23;
  _QWORD *v24[2];
  uint64_t v25;
  std::__shared_weak_count *v26;
  _BYTE v27[32];
  uint64_t v28;
  std::__shared_weak_count *v29;

  DigestGenerator::getDigestGenerator(a2, &v28);
  ComputeHash::ComputeHash((ComputeHash *)v27);
  v25 = v28;
  v26 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  ComputeHash::setDigestGenerator((uint64_t)v27, &v25);
  v6 = v26;
  if (v26)
  {
    v7 = (unint64_t *)&v26->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if ((ComputeHash::init((ComputeHash *)v27) & 1) != 0)
  {
    v9 = *(__int128 **)(a1 + 56);
    if (v9 != (__int128 *)(a1 + 64))
    {
      do
      {
        ComputeHash::reset_state((uint64_t)v27);
        v24[0] = 0;
        v24[1] = 0;
        v23 = (const void **)v24;
        v10 = (__int128 *)*((_QWORD *)v9 + 7);
        if (v10 != v9 + 4)
        {
          FileSystemManager::basename((uint64_t)(v10 + 2), v22);
          memset(&v21[5], 0, 24);
          FileSystemManager::getFileExtension((uint64_t *)v22);
        }
        std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(&__p, v9 + 2, &v23);
        std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>(a3, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)v21, v21[1]);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v23, v24[0]);
        v11 = (__int128 *)*((_QWORD *)v9 + 1);
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = *(__int128 **)v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (__int128 *)*((_QWORD *)v9 + 2);
            v13 = *(_QWORD *)v12 == (_QWORD)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != (__int128 *)(a1 + 64));
    }
    v14 = 1;
  }
  else
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    v14 = 0;
  }
  ComputeHash::~ComputeHash((ComputeHash *)v27);
  v15 = v29;
  if (v29)
  {
    v16 = (unint64_t *)&v29->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

void sub_214669350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,_QWORD *a35,uint64_t a36,char a37)
{
  uint64_t v37;

  std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::~pair((uint64_t)&a11);
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&a34, a35);
  ComputeHash::~ComputeHash((ComputeHash *)(v37 - 136));
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100](v37 - 104);
  _Unwind_Resume(a1);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t CarrierBundle::removeSignaturesDir(uint64_t **this)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *__p[2];
  char v8;

  v2 = *this;
  std::string::basic_string[abi:ne180100]<0>(__p, "signatures");
  v3 = FileSystemManager::removeItem(v2, (uint64_t *)__p);
  v4 = v3;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if ((v4 & 1) != 0)
      return v4;
  }
  else if ((v3 & 1) != 0)
  {
    return v4;
  }
  v5 = (const char *)*this;
  if (*((char *)*this + 23) < 0)
    v5 = *(const char **)v5;
  writeLog("Error: Unable remove signatures directory from bundle at path: %s\n", v5);
  return v4;
}

void sub_21466955C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t CarrierBundle::computeDigestForFileDataMap(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  unsigned __int8 v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  const __CFAllocator *v11;
  void **v12;
  const void *v13;
  BOOL v14;
  _QWORD *v15;
  _QWORD *v16;
  const char *v18;
  void **v19;
  void *v20[2];
  uint64_t v21;
  const void *v22;
  CFTypeRef cf;
  const void *v24;
  void *__p[2];
  uint64_t v26;

  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 == a2 + 1)
  {
LABEL_10:
    if (v5 == v4)
      return 1;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      FileSystemManager::basename((uint64_t)(v5 + 4), __p);
      if (v26 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      v13 = CFStringCreateWithCString(v11, (const char *)v12, 0x8000100u);
      cf = v13;
      if (SHIBYTE(v26) < 0)
      {
        operator delete(__p[0]);
        v13 = cf;
      }
      v22 = v13;
      if (v13)
        CFRetain(v13);
      v14 = ComputeHash::digest_string(a3, (CFStringRef *)&v22);
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v22);
      if (!v14)
        break;
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&cf);
      v15 = (_QWORD *)v5[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v5[2];
          v10 = *v16 == (_QWORD)v5;
          v5 = v16;
        }
        while (!v10);
      }
      v5 = v16;
      if (v16 == v4)
        return 1;
    }
    __p[0] = 0;
    __p[1] = 0;
    v26 = 0;
    ctu::cf::assign();
    *(_OWORD *)v20 = *(_OWORD *)__p;
    v21 = v26;
    v19 = v20;
    if (v26 < 0)
      v19 = (void **)__p[0];
    writeLog("Error: Failed to compute digest for basename of file at path: %s\n", (const char *)v19);
    if (SHIBYTE(v21) < 0)
      operator delete(v20[0]);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&cf);
  }
  else
  {
    while (1)
    {
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v24, (const void **)v5 + 7);
      v7 = ComputeHash::digest_data(a3, (CFDataRef *)&v24);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
      if ((v7 & 1) == 0)
        break;
      v8 = (_QWORD *)v5[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v5[2];
          v10 = *v9 == (_QWORD)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
      if (v9 == v4)
      {
        v5 = (_QWORD *)*a2;
        goto LABEL_10;
      }
    }
    v18 = (const char *)(v5 + 4);
    if (*((char *)v5 + 55) < 0)
      v18 = *(const char **)v18;
    writeLog("Error: Failed to compute digest of the fileData associated with the file : %s\n", v18);
  }
  return 0;
}

void sub_214669778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, int a19, const void *a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a16 < 0)
    operator delete(a11);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a20);
  _Unwind_Resume(a1);
}

void CarrierBundle::printDeviceModelDigestMap(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  const char *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v7;
  unsigned int v8;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;

  v2 = a2 + 1;
  v3 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0)
        v4 = *(const char **)v4;
      writeLog("Class name : %s, ", v4);
      BytePtr = CFDataGetBytePtr((CFDataRef)v3[7]);
      Length = CFDataGetLength((CFDataRef)v3[7]);
      if (!BytePtr)
        writeLog("dataBytes array returns a NULL pointer");
      writeLog("Digest length = %ld, ", Length);
      writeLog("Digest : ");
      if (Length >= 1)
      {
        v7 = 0;
        v8 = 1;
        do
        {
          writeLog("%02x", BytePtr[v7]);
          v7 = v8;
        }
        while (Length > v8++);
      }
      writeLog("\n");
      v10 = (_QWORD *)v3[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v3[2];
          v12 = *v11 == (_QWORD)v3;
          v3 = v11;
        }
        while (!v12);
      }
      v3 = v11;
    }
    while (v11 != v2);
  }
}

void CarrierBundle::printDeviceFilesDigestMap(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  const char *v4;
  _QWORD *v5;
  void **v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  void *__p[2];
  char v13;

  v2 = a2 + 1;
  v3 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0)
        v4 = *(const char **)v4;
      writeLog("Device Class = %s\n", v4);
      v5 = (_QWORD *)v3[7];
      if (v5 != v3 + 8)
      {
        do
        {
          FileSystemManager::basename((uint64_t)(v5 + 4), __p);
          if (v13 >= 0)
            v6 = __p;
          else
            v6 = (void **)__p[0];
          writeLog("\t\t FileName = %s\t", (const char *)v6);
          if (v13 < 0)
            operator delete(__p[0]);
          if (CFDataGetBytePtr((CFDataRef)v5[7]))
          {
            CFDataGetLength((CFDataRef)v5[7]);
            writeLog("fileDataLength = %ld \n");
          }
          else
          {
            writeLog("FileData is NULL\n");
          }
          v7 = (_QWORD *)v5[1];
          if (v7)
          {
            do
            {
              v8 = v7;
              v7 = (_QWORD *)*v7;
            }
            while (v7);
          }
          else
          {
            do
            {
              v8 = (_QWORD *)v5[2];
              v9 = *v8 == (_QWORD)v5;
              v5 = v8;
            }
            while (!v9);
          }
          v5 = v8;
        }
        while (v8 != v3 + 8);
      }
      v10 = (_QWORD *)v3[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v3[2];
          v9 = *v11 == (_QWORD)v3;
          v3 = v11;
        }
        while (!v9);
      }
      v3 = v11;
    }
    while (v11 != v2);
  }
}

void sub_214669ABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__list_imp<std::string>::clear(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  if (a1[2])
  {
    v3 = *a1;
    v2 = a1[1];
    v4 = *(_QWORD **)v2;
    v4[1] = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v3 + 8) = v4;
    a1[2] = 0;
    while ((_QWORD *)v2 != a1)
    {
      v5 = *(_QWORD *)(v2 + 8);
      std::__list_imp<std::string>::__delete_node[abi:ne180100]<>((int)a1, (void **)v2);
      v2 = v5;
    }
  }
}

void std::__list_imp<std::string>::__delete_node[abi:ne180100]<>(int a1, void **__p)
{
  if (*((char *)__p + 39) < 0)
    operator delete(__p[2]);
  operator delete(__p);
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

void std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>(uint64_t a1)
{
  std::__list_imp<std::string>::clear((_QWORD *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t *std::list<std::string>::__sort<std::__less<void,void>>(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;

  v4 = a1;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      v7 = *(uint64_t **)a2;
      if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(*(_QWORD *)a2 + 16), (const void **)(a1 + 16)))
      {
        v8 = *v7;
        *(_QWORD *)(v8 + 8) = v7[1];
        *(_QWORD *)v7[1] = v8;
        v9 = *(_QWORD *)v4;
        *(_QWORD *)(v9 + 8) = v7;
        *v7 = v9;
        *(_QWORD *)v4 = v7;
        v7[1] = v4;
        return v7;
      }
    }
    else
    {
      v11 = a3 >> 1;
      v12 = (a3 >> 1) + 1;
      v13 = a1;
      do
      {
        v13 = *(_QWORD *)(v13 + 8);
        --v12;
      }
      while (v12 > 1);
      v14 = std::list<std::string>::__sort<std::__less<void,void>>(a1, v13, a3 >> 1, a4);
      v4 = std::list<std::string>::__sort<std::__less<void,void>>(v13, a2, a3 - v11, a4);
      if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(v4 + 16), (const void **)(v14 + 16)))
      {
        for (i = *(_QWORD *)(v4 + 8); i != a2; i = *(_QWORD *)(i + 8))
        {
          if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(i + 16), (const void **)(v14 + 16)))goto LABEL_14;
        }
        i = a2;
LABEL_14:
        v17 = *(_QWORD *)i;
        v18 = *(_QWORD *)v4;
        *(_QWORD *)(v18 + 8) = *(_QWORD *)(*(_QWORD *)i + 8);
        **(_QWORD **)(v17 + 8) = v18;
        v19 = *(_QWORD *)v14;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v19 + 8) = v4;
        *(_QWORD *)v4 = v19;
        *(_QWORD *)v14 = v17;
        *(_QWORD *)(v17 + 8) = v14;
      }
      else
      {
        v16 = *(uint64_t **)(v14 + 8);
        i = v4;
        v4 = v14;
      }
      if (v16 != (uint64_t *)i && i != a2)
      {
        v20 = i;
        do
        {
          if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(i + 16), (const void **)v16 + 2))
          {
            for (j = *(_QWORD *)(i + 8); j != a2; j = *(_QWORD *)(j + 8))
            {
              if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(j + 16), (const void **)v16 + 2))goto LABEL_25;
            }
            j = a2;
LABEL_25:
            v22 = *(_QWORD *)j;
            v23 = *(_QWORD *)i;
            *(_QWORD *)(v23 + 8) = *(_QWORD *)(*(_QWORD *)j + 8);
            **(_QWORD **)(v22 + 8) = v23;
            if (v20 == i)
              v20 = j;
            v25 = (_QWORD *)*v16;
            v24 = (uint64_t *)v16[1];
            v25[1] = i;
            *(_QWORD *)i = v25;
            *v16 = v22;
            *(_QWORD *)(v22 + 8) = v16;
            v16 = v24;
            i = j;
          }
          else
          {
            v16 = (uint64_t *)v16[1];
          }
        }
        while (v16 != (uint64_t *)v20 && i != a2);
      }
    }
  }
  return (uint64_t *)v4;
}

BOOL std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v5, a2, (const void **)(v6 + 32)))
  {
    return v2;
  }
  return v6;
}

_QWORD *std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  std::string *v8;

  v7 = operator new(0x28uLL);
  *v7 = a2;
  v7[1] = a3;
  v8 = (std::string *)(v7 + 2);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v7[4] = *(_QWORD *)(a4 + 16);
  }
  return v7;
}

void sub_21466A0C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

std::string *std::pair<std::string,std::list<std::string>>::pair[abi:ne180100]<std::string&,std::list<std::string>&,0>(std::string *this, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::list<std::string>::list((uint64_t *)&this[1], a3);
  return this;
}

void sub_21466A1C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::list<std::string>::list(uint64_t *a1, uint64_t a2)
{
  uint64_t i;
  _QWORD *v5;
  uint64_t v6;

  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  for (i = *(_QWORD *)(a2 + 8); i != a2; i = *(_QWORD *)(i + 8))
  {
    v5 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a1, 0, 0, i + 16);
    v6 = *a1;
    *v5 = *a1;
    v5[1] = a1;
    *(_QWORD *)(v6 + 8) = v5;
    *a1 = (uint64_t)v5;
    ++a1[2];
  }
  return a1;
}

void sub_21466A25C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::__list_imp<std::string>::clear(v1);
  _Unwind_Resume(a1);
}

char *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::list<std::string>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  void **v5;
  char *v6;
  uint64_t **v7;
  uint64_t v8;
  _QWORD v10[2];
  char v11;
  uint64_t v12;

  v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  v6 = (char *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (char *)operator new(0x50uLL);
    v10[1] = a1 + 1;
    *((_OWORD *)v6 + 2) = *(_OWORD *)a3;
    v8 = *(_QWORD *)(a3 + 16);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *((_QWORD *)v6 + 6) = v8;
    *((_QWORD *)v6 + 7) = v6 + 56;
    *((_QWORD *)v6 + 8) = v6 + 56;
    *((_QWORD *)v6 + 9) = 0;
    std::list<std::string>::splice((uint64_t)(v6 + 56), (uint64_t *)v6 + 7, (_QWORD *)(a3 + 24));
    v11 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v12, v7, (uint64_t *)v6);
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v6;
}

_QWORD *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v7, a3, (const void **)(v4 + 32)))break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

uint64_t std::list<std::string>::splice(uint64_t result, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3[2];
  if (v3)
  {
    v5 = *a3;
    v4 = (uint64_t *)a3[1];
    v6 = *v4;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(*a3 + 8);
    **(_QWORD **)(v5 + 8) = v6;
    v7 = *a2;
    *(_QWORD *)(v7 + 8) = v4;
    *v4 = v7;
    *a2 = v5;
    *(_QWORD *)(v5 + 8) = a2;
    *(_QWORD *)(result + 16) += v3;
    a3[2] = 0;
  }
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>(uint64_t a1)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

std::string *std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(std::string *this, __int128 *a2, const void **a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, a3);
  return this;
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(uint64_t **a1, const void **a2, __int128 *a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x40uLL);
    v12[1] = a1 + 1;
    v8 = *a3;
    *(_QWORD *)a3 = 0;
    *((_QWORD *)a3 + 1) = 0;
    v9 = *((_QWORD *)a3 + 2);
    v10 = *((_QWORD *)a3 + 3);
    *((_QWORD *)a3 + 2) = 0;
    *((_QWORD *)a3 + 3) = 0;
    v6[2] = v8;
    *((_QWORD *)v6 + 6) = v9;
    *((_QWORD *)v6 + 7) = v10;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v14, v7, (uint64_t *)v6);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

std::string *std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(std::string *this, __int128 *a2, const void ***a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::map[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_21466A888(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_21466A8E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  const void **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;
  const void **v12;

  v6 = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

const void **std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2
    || std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), v12 + 4, a5))
      goto LABEL_16;
    return (const void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), a5, v15 + 4))
        return (const void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

std::string *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_21466ABF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, (const void **)a2 + 3);
  return this;
}

uint64_t *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t *v9[3];
  uint64_t v10;

  v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = v5;
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t)a1, a3, (uint64_t)v9);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v10, v7, v9[0]);
    v6 = v9[0];
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  }
  return v6;
}

_OWORD *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _OWORD *result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v5 = a1 + 8;
  result = operator new(0x50uLL);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  result[2] = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  v9 = (_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 32);
  *((_QWORD *)result + 6) = v7;
  *((_QWORD *)result + 7) = v8;
  *((_QWORD *)result + 8) = v10;
  v11 = (char *)(result + 4);
  v12 = *(_QWORD *)(a2 + 40);
  *((_QWORD *)result + 9) = v12;
  if (v12)
  {
    *(_QWORD *)(v10 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v9;
    *v9 = 0;
    *(_QWORD *)(a2 + 40) = 0;
  }
  else
  {
    *((_QWORD *)result + 7) = v11;
  }
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>(uint64_t a1)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>(uint64_t **a1, const void **a2, __int128 *a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x40uLL);
    v12[1] = a1 + 1;
    v8 = *a3;
    *(_QWORD *)a3 = 0;
    *((_QWORD *)a3 + 1) = 0;
    v9 = *((_QWORD *)a3 + 2);
    v10 = *((_QWORD *)a3 + 3);
    *((_QWORD *)a3 + 2) = 0;
    *((_QWORD *)a3 + 3) = 0;
    v6[2] = v8;
    *((_QWORD *)v6 + 6) = v9;
    *((_QWORD *)v6 + 7) = v10;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v14, v7, (uint64_t *)v6);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

std::string *std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>&,0>(std::string *this, __int128 *a2, const void ***a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::map[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_21466AFA0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_21466AFF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  const void **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;
  const void **v12;

  v6 = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

std::string *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_21466B178(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, (const void **)a2 + 3);
  return this;
}

uint64_t *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t *v9[3];
  uint64_t v10;

  v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = v5;
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t)a1, a3, (uint64_t)v9);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v10, v7, v9[0]);
    v6 = v9[0];
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

std::string *std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(std::string *this, __int128 *a2, __int128 *a3)
{
  __int128 v5;
  std::string *v6;
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_21466B3B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void getSignatureFileName(std::string *a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  void *v5;
  char v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  std::string __p;
  void *v11;
  __int128 v12;
  std::string v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = 0uLL;
  if (std::string::compare(a1, "common"))
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "overrides");
    v4 = std::string::append(&__p, "_");
    v5 = (void *)v4->__r_.__value_.__r.__words[0];
    v13.__r_.__value_.__r.__words[0] = v4->__r_.__value_.__l.__size_;
    *(std::string::size_type *)((char *)v13.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v4->__r_.__value_.__r.__words[1] + 7);
    v6 = HIBYTE(v4->__r_.__value_.__r.__words[2]);
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    *(_QWORD *)((char *)&v12 + 7) = *(std::string::size_type *)((char *)v13.__r_.__value_.__r.__words + 7);
    v11 = v5;
    *(_QWORD *)&v12 = v13.__r_.__value_.__r.__words[0];
    HIBYTE(v12) = v6;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&v11, (const void **)&a1->__r_.__value_.__l.__data_, (uint64_t)&v13);
  v7 = std::string::append(&v13, ".");
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  v9 = std::string::append(&__p, "plist");
  *a2 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12) < 0)
    operator delete(v11);
}

void sub_21466B530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *getSignatureDirPath@<X0>(std::string *__str@<X0>, std::string *a2@<X8>)
{
  std::string::size_type size;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(a2, __str);
  size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = __str->__r_.__value_.__l.__size_;
  if (*std::string::at(__str, size - 1) != 47)
    std::string::append(a2, "/");
  return std::string::append(a2, "signatures");
}

void sub_21466B618(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void FileSystemManager::FileSystemManager(FileSystemManager *this)
{
  *(_QWORD *)this = objc_alloc_init(MEMORY[0x24BDD1460]);
}

{
  *(_QWORD *)this = objc_alloc_init(MEMORY[0x24BDD1460]);
}

void FileSystemManager::~FileSystemManager(id *this)
{

}

{

}

_QWORD *FileSystemManager::basename@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  char *v4;
  char __dst[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 23) >= 0)
    v3 = (const char *)a1;
  else
    v3 = *(const char **)a1;
  strlcpy(__dst, v3, 0x400uLL);
  v4 = basename(__dst);
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

_QWORD *FileSystemManager::dirname@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  char *v4;
  char __dst[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 23) >= 0)
    v3 = (const char *)a1;
  else
    v3 = *(const char **)a1;
  strlcpy(__dst, v3, 0x400uLL);
  v4 = dirname(__dst);
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

BOOL FileSystemManager::directoryContentsAtPath(char *a1, _QWORD *a2, int a3)
{
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  size_t v12;
  std::string *v13;
  char *v14;
  void **v15;
  std::string::size_type v16;
  std::string *v17;
  void *v18;
  char v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  id obj;
  void *v25[2];
  unsigned __int8 v26;
  std::string v27;
  void *__p;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if (a1[23] >= 0)
    v7 = a1;
  else
    v7 = *(char **)a1;
  obj = (id)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7), &v34);
  if (obj)
  {
    std::__list_imp<std::string>::clear(a2);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          __p = 0;
          v29 = 0uLL;
          if (a3)
          {
            if (a1[23] >= 0)
              v12 = a1[23];
            else
              v12 = *((_QWORD *)a1 + 1);
            std::string::basic_string[abi:ne180100]((uint64_t)&v27, v12 + 1);
            if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v13 = &v27;
            else
              v13 = (std::string *)v27.__r_.__value_.__r.__words[0];
            if (v12)
            {
              if (a1[23] >= 0)
                v14 = a1;
              else
                v14 = *(char **)a1;
              memmove(v13, v14, v12);
            }
            *(_WORD *)((char *)&v13->__r_.__value_.__l.__data_ + v12) = 47;
            std::string::basic_string[abi:ne180100]<0>(v25, (char *)objc_msgSend(v11, "UTF8String", obj));
            if ((v26 & 0x80u) == 0)
              v15 = v25;
            else
              v15 = (void **)v25[0];
            if ((v26 & 0x80u) == 0)
              v16 = v26;
            else
              v16 = (std::string::size_type)v25[1];
            v17 = std::string::append(&v27, (const std::string::value_type *)v15, v16);
            v18 = (void *)v17->__r_.__value_.__r.__words[0];
            v35[0] = v17->__r_.__value_.__l.__size_;
            *(_QWORD *)((char *)v35 + 7) = *(std::string::size_type *)((char *)&v17->__r_.__value_.__r.__words[1] + 7);
            v19 = HIBYTE(v17->__r_.__value_.__r.__words[2]);
            v17->__r_.__value_.__l.__size_ = 0;
            v17->__r_.__value_.__r.__words[2] = 0;
            v17->__r_.__value_.__r.__words[0] = 0;
            if (SHIBYTE(v29) < 0)
              operator delete(__p);
            __p = v18;
            *(_QWORD *)&v29 = v35[0];
            *(_QWORD *)((char *)&v29 + 7) = *(_QWORD *)((char *)v35 + 7);
            HIBYTE(v29) = v19;
            if ((char)v26 < 0)
              operator delete(v25[0]);
            if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v27.__r_.__value_.__l.__data_);
          }
          else
          {
            MEMORY[0x2199D3130](&__p, objc_msgSend(v11, "UTF8String"));
          }
          v20 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a2, 0, 0, (uint64_t)&__p);
          *v20 = a2;
          v21 = (_QWORD *)a2[1];
          v20[1] = v21;
          *v21 = v20;
          v22 = a2[2] + 1;
          a2[1] = v20;
          a2[2] = v22;
          if (SHIBYTE(v29) < 0)
            operator delete(__p);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v8);
    }
  }
  return !v34 || objc_msgSend(v34, "code") == 0;
}

void sub_21466BABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

BOOL FileSystemManager::isRegularFile(const char *a1)
{
  stat v2;

  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0x8000;
}

BOOL FileSystemManager::isDirectory(const char *a1)
{
  stat v2;

  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0x4000;
}

BOOL FileSystemManager::isSymlink(const char *a1)
{
  stat v2;

  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0xA000;
}

CFDataRef FileSystemManager::copyBinaryPlistAsXML(uint64_t a1)
{
  const __CFAllocator *v1;
  const char *v2;
  CFStringRef v3;
  uint64_t (*v4)(uint64_t);
  CFURLRef v5;
  uint64_t (*v6)(uint64_t);
  __CFReadStream *v7;
  uint64_t (*v8)(uint64_t);
  CFPropertyListRef v9;
  uint64_t (*v10)(uint64_t);
  CFDataRef Data;
  const void *v13;
  CFReadStreamRef stream;
  CFURLRef v15;
  CFStringRef v16;

  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (*(char *)(a1 + 23) >= 0)
    v2 = (const char *)a1;
  else
    v2 = *(const char **)a1;
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0x8000100u);
  v16 = v3;
  v4 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v3)
    v4 = 0;
  if (v4)
  {
    v5 = CFURLCreateWithFileSystemPath(v1, v3, kCFURLPOSIXPathStyle, 0);
    v15 = v5;
    v6 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get;
    if (!v5)
      v6 = 0;
    if (v6)
    {
      v7 = CFReadStreamCreateWithFile(v1, v5);
      stream = v7;
      v8 = ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get;
      if (!v7)
        v8 = 0;
      if (v8 && CFReadStreamOpen(v7))
      {
        v9 = CFPropertyListCreateWithStream(v1, stream, 0, 0, 0, 0);
        v13 = v9;
        v10 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
        if (!v9)
          v10 = 0;
        if (v10)
        {
          Data = CFPropertyListCreateData(v1, v9, kCFPropertyListXMLFormat_v1_0, 0, 0);
          CFReadStreamClose(stream);
        }
        else
        {
          Data = 0;
        }
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v13);
      }
      else
      {
        Data = 0;
      }
      ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef((const void **)&stream);
    }
    else
    {
      Data = 0;
    }
    ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v15);
  }
  else
  {
    Data = 0;
  }
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v16);
  return Data;
}

void sub_21466BDA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  const void *v5;
  va_list va1;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v5 = va_arg(va2, const void *);
  ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL FileSystemManager::isHiddenFile(uint64_t a1)
{
  int v1;
  std::string v3;

  FileSystemManager::basename(a1, &v3);
  v1 = *std::string::at(&v3, 0);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__r_.__value_.__l.__data_);
  return v1 == 46;
}

void sub_21466BE54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void FileSystemManager::getFileExtension(uint64_t *a1)
{
  uint64_t *v1;

  if (*((char *)a1 + 23) >= 0)
    v1 = a1;
  else
    v1 = (uint64_t *)*a1;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v1, 4), "pathExtension"), "cStringUsingEncoding:", 4);
  JUMPOUT(0x2199D3130);
}

void FileSystemManager::getFileNameWithExtensionRemoved(uint64_t *a1)
{
  uint64_t *v1;

  if (*((char *)a1 + 23) >= 0)
    v1 = a1;
  else
    v1 = (uint64_t *)*a1;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v1, 4), "stringByDeletingPathExtension"), "cStringUsingEncoding:", 4);
  JUMPOUT(0x2199D3130);
}

ssize_t FileSystemManager::readLink@<X0>(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  ssize_t result;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = readlink(a1, v4, 0x3FFuLL);
  if (result != -1)
  {
    v4[result] = 0;
    return MEMORY[0x2199D3130](a2, v4);
  }
  return result;
}

void sub_21466BFB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t FileSystemManager::copyItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = a1[1];
  if (!v2)
    return 0;
  if (*((char *)a2 + 23) < 0)
  {
    if (!a2[1])
      return 0;
    a2 = (uint64_t *)*a2;
  }
  else if (!*((_BYTE *)a2 + 23))
  {
    return 0;
  }
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v4)
    && !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", v4, 0))
  {
    return 0;
  }
  if (*((char *)a1 + 23) >= 0)
    v5 = a1;
  else
    v5 = (uint64_t *)*a1;
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "copyItemAtPath:toPath:error:", v6, v4, 0);
}

uint64_t FileSystemManager::removeItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;

  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3, 4);
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = objc_msgSend(v4, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4));
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v6))
    return 1;
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", v6, 0);
  if ((_DWORD)result)
    return 1;
  return result;
}

_QWORD *FileSystemManager::dictionaryFromPath@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  if (*((char *)a1 + 23) >= 0)
    v2 = a1;
  else
    v2 = (uint64_t *)*a1;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a2, (CFTypeRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2, 1)));
}

uint64_t FileSystemManager::fileContentsAtPath@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  id v5;

  if (this)
  {
    v4 = this;
    v5 = objc_alloc(MEMORY[0x24BDBCE50]);
    this = objc_msgSend(v5, "initWithContentsOfFile:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4));
  }
  *a2 = this;
  return this;
}

uint64_t FileSystemManager::writeDictionaryToPath(uint64_t *a1, void *a2)
{
  uint64_t *v2;

  if (!a2)
    return 0;
  if (*((char *)a1 + 23) >= 0)
    v2 = a1;
  else
    v2 = (uint64_t *)*a1;
  return objc_msgSend(a2, "writeToFile:atomically:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2), 1);
}

const void **ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void ComputeHashForCarrierBundle::getDeviceModelName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3;
  unint64_t v5;
  std::string *v6;
  std::string::size_type v7;
  int v8;
  std::string::size_type size;
  std::string *p_str;
  std::string::size_type v12;
  int v13;
  std::string::size_type v14;
  std::string::size_type v15;
  std::string *v16;
  std::string::size_type v17;
  int v18;
  std::string v19;
  std::string __str;
  std::string v21;
  std::string __p;
  std::string v23;
  char v24;

  memset(&v23, 0, sizeof(v23));
  memset(&__p, 0, sizeof(__p));
  v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    goto LABEL_7;
  MEMORY[0x2199D3130](&v23, "common");
  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  if (v5 <= 8)
  {
LABEL_7:
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
    goto LABEL_21;
  }
  std::string::basic_string(&v21, (const std::string *)a1, 0, 9uLL, (std::allocator<char> *)&__str);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v21.__r_.__value_.__l.__size_ != 9)
      goto LABEL_18;
    v6 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) != 9)
      goto LABEL_18;
    v6 = &v21;
  }
  v7 = v6->__r_.__value_.__r.__words[0];
  v8 = v6->__r_.__value_.__s.__data_[8];
  if (v7 == 0x656469727265766FLL && v8 == 115)
  {
    std::string::basic_string(&__str, (const std::string *)a1, 9uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v19);
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __str.__r_.__value_.__l.__size_;
    if (size && *std::string::at(&__str, 0) == 42)
    {
      p_str = &__str;
      std::string::erase(&__str, 0, 1uLL);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v12 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v12 = __str.__r_.__value_.__l.__size_;
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      for (; v12; --v12)
      {
        v13 = p_str->__r_.__value_.__s.__data_[0];
        if (v13 == 46)
          break;
        if (v13 == 95)
          break;
        std::string::push_back(&__p, v13);
        p_str = (std::string *)((char *)p_str + 1);
      }
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v14 = __p.__r_.__value_.__l.__size_;
    std::string::basic_string(&v19, &__str, v14, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v24);
    v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v15 = __str.__r_.__value_.__l.__size_;
    if (v15 && *std::string::at(&v19, 0) == 95)
    {
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      {
        *v23.__r_.__value_.__l.__data_ = 0;
        v23.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v23.__r_.__value_.__s.__data_[0] = 0;
        *((_BYTE *)&v23.__r_.__value_.__s + 23) = 0;
      }
      v16 = &v19;
      std::string::erase(&v19, 0, 1uLL);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v17 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v17 = v19.__r_.__value_.__l.__size_;
        v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      for (; v17; --v17)
      {
        v18 = v16->__r_.__value_.__s.__data_[0];
        if (v18 == 46)
          break;
        std::string::push_back(&v23, v18);
        v16 = (std::string *)((char *)v16 + 1);
      }
    }
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    goto LABEL_19;
  }
LABEL_18:
  std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (__int128 *)&v23, (__int128 *)&__p);
LABEL_19:
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
LABEL_21:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
}

void sub_21466C5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a32 < 0)
    operator delete(a27);
  if (*(char *)(v32 - 41) < 0)
    operator delete(*(void **)(v32 - 64));
  _Unwind_Resume(exception_object);
}

uint64_t ComputeHashForCarrierBundle::computeIpccDigest(char *a1, ComputeHash *this, const void **a3)
{
  FileSystemManager *v6;
  const void *v7;
  const void *v9;
  const void *v10;

  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  if (a1[23] >= 0)
    v6 = (FileSystemManager *)a1;
  else
    v6 = *(FileSystemManager **)a1;
  if ((ComputeHash::digest_file(this, v6) & 1) == 0)
  {
    writeLog("Error: Failed to compute digest for %s\n");
    return 0;
  }
  ComputeHash::finalize(this, (CFDataRef *)&v9);
  if (&v9 != a3)
  {
    v7 = *a3;
    *a3 = v9;
    v9 = 0;
    v10 = v7;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v10);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  return 1;
}

BOOL ComputeHashForCarrierBundle::computeVersionXmlDigestLegacy(uint64_t a1, ComputeHash *this, CFDictionaryRef *a3)
{
  uint64_t v6;
  const __CFAllocator *v7;
  uint64_t (*v8)(uint64_t);
  const __CFDictionary *Value;
  const __CFDictionary *v10;
  uint64_t (*v11)(uint64_t);
  _BOOL8 v12;
  const __CFDictionary *v14;
  const void *v15;
  __CFDictionary *v16;
  const __CFDictionary *v17;
  CFDictionaryRef MutableCopy;
  CFDictionaryRef theDict;

  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
  {
    writeLog("Error: Invalid version.xml file");
    return 0;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  FileSystemManager::dictionaryFromPath((uint64_t *)a1, &theDict);
  MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, theDict);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  v8 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!MutableCopy)
    v8 = 0;
  if (v8)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, CFSTR("MobileDeviceCarrierBundlesByProductVersion"));
    v10 = Value;
    v17 = Value;
    if (Value)
    {
      CFRetain(Value);
      v11 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
    }
    else
    {
      v11 = 0;
    }
    if (v11)
    {
      v16 = CFDictionaryCreateMutableCopy(v7, 0, v10);
      CFDictionaryRemoveValue(v16, CFSTR("signature"));
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v15, (CFTypeRef *)&v16);
      v12 = ComputeHash::digest_dictionary((uint64_t)this, (CFDictionaryRef *)&v15);
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v15);
      if (v12)
      {
        ComputeHash::finalize(this, &v14);
        if (&v14 != a3)
        {
          theDict = *a3;
          *a3 = v14;
          v14 = 0;
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&theDict);
        }
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v14);
      }
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v16);
    }
    else
    {
      writeLog("Error: Missing MobileDeviceCarrierBundlesByProductVersion from version.xml");
      v12 = 0;
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v17);
  }
  else
  {
    writeLog("Error: Invalid version.xml file");
    v12 = 0;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
  return v12;
}

void sub_21466C8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  const void *v4;
  va_list va;
  const void *v6;
  va_list va1;
  va_list va2;

  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v6 = va_arg(va2, const void *);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ComputeHashForCarrierBundle::computeVersionXmlDigest(const void **a1, ComputeHash *this, const void **a3)
{
  uint64_t (*v6)(uint64_t);
  BOOL v7;
  const void *v9;
  const void *v10;
  const void *v11;

  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  if (*a1)
    v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v6 = 0;
  if (!v6)
    return 0;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v10, a1);
  v7 = ComputeHash::digest_dictionary((uint64_t)this, (CFDictionaryRef *)&v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v10);
  if (!v7)
    return 0;
  ComputeHash::finalize(this, (CFDataRef *)&v9);
  if (&v9 != a3)
  {
    v11 = *a3;
    *a3 = v9;
    v9 = 0;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v11);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  return 1;
}

void sub_21466CA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

char *DigestGenerator::getDigestGenerator@<X0>(char *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t (**v4)(DigestGenerator160 *__hidden);

  switch((_DWORD)result)
  {
    case 2:
      v3 = operator new(0xF8uLL);
      v3[2] = 0;
      *v3 = &unk_24D1DDA80;
      v3[1] = 0;
      v4 = &off_24D1DD910;
      *((_BYTE *)v3 + 240) = 48;
      goto LABEL_7;
    case 1:
      v3 = operator new(0x90uLL);
      v3[2] = 0;
      *v3 = &unk_24D1DDA30;
      v3[1] = 0;
      v4 = &off_24D1DD8E0;
      *((_BYTE *)v3 + 136) = 32;
      goto LABEL_7;
    case 0:
      v3 = operator new(0x88uLL);
      v3[2] = 0;
      *v3 = &unk_24D1DD9E0;
      v3[1] = 0;
      v4 = &off_24D1DD8B0;
      *((_BYTE *)v3 + 128) = 20;
LABEL_7:
      a2[1] = v3;
      v3[3] = v4;
      result = (char *)(v3 + 3);
      *a2 = result;
      return result;
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void DigestGenerator160::DigestGenerator160(DigestGenerator160 *this)
{
  *(_QWORD *)this = &off_24D1DD8B0;
  *((_BYTE *)this + 104) = 20;
}

{
  *(_QWORD *)this = &off_24D1DD8B0;
  *((_BYTE *)this + 104) = 20;
}

uint64_t DigestGenerator160::get_digest_size(DigestGenerator160 *this)
{
  return *((unsigned __int8 *)this + 104);
}

uint64_t DigestGenerator160::sha_init(DigestGenerator160 *this)
{
  return CC_SHA1_Init((CC_SHA1_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator160::sha_update(DigestGenerator160 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator160::sha_final(DigestGenerator160 *this, unsigned __int8 *md)
{
  return CC_SHA1_Final(md, (CC_SHA1_CTX *)((char *)this + 8));
}

void DigestGenerator256::DigestGenerator256(DigestGenerator256 *this)
{
  *(_QWORD *)this = &off_24D1DD8E0;
  *((_BYTE *)this + 112) = 32;
}

{
  *(_QWORD *)this = &off_24D1DD8E0;
  *((_BYTE *)this + 112) = 32;
}

uint64_t DigestGenerator256::get_digest_size(DigestGenerator256 *this)
{
  return *((unsigned __int8 *)this + 112);
}

uint64_t DigestGenerator256::sha_init(DigestGenerator256 *this)
{
  return CC_SHA256_Init((CC_SHA256_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator256::sha_update(DigestGenerator256 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator256::sha_final(DigestGenerator256 *this, unsigned __int8 *md)
{
  return CC_SHA256_Final(md, (CC_SHA256_CTX *)((char *)this + 8));
}

void DigestGenerator384::DigestGenerator384(DigestGenerator384 *this)
{
  *(_QWORD *)this = &off_24D1DD910;
  *((_BYTE *)this + 216) = 48;
}

{
  *(_QWORD *)this = &off_24D1DD910;
  *((_BYTE *)this + 216) = 48;
}

uint64_t DigestGenerator384::sha_init(DigestGenerator384 *this)
{
  return CC_SHA384_Init((CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator384::sha_update(DigestGenerator384 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA384_Update((CC_SHA512_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator384::sha_final(DigestGenerator384 *this, unsigned __int8 *md)
{
  return CC_SHA384_Final(md, (CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator384::get_digest_size(DigestGenerator384 *this)
{
  return *((unsigned __int8 *)this + 216);
}

void DigestGenerator512::DigestGenerator512(DigestGenerator512 *this)
{
  *(_QWORD *)this = &off_24D1DD940;
  *((_BYTE *)this + 216) = 64;
}

{
  *(_QWORD *)this = &off_24D1DD940;
  *((_BYTE *)this + 216) = 64;
}

uint64_t DigestGenerator512::sha_init(DigestGenerator512 *this)
{
  return CC_SHA512_Init((CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator512::sha_update(DigestGenerator512 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA512_Update((CC_SHA512_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator512::sha_final(DigestGenerator512 *this, unsigned __int8 *md)
{
  return CC_SHA512_Final(md, (CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator512::get_digest_size(DigestGenerator512 *this)
{
  return *((unsigned __int8 *)this + 216);
}

void std::__shared_ptr_emplace<DigestGenerator160>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DD9E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator160>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DD9E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D319CLL);
}

void std::__shared_ptr_emplace<DigestGenerator256>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDA30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator256>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDA30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D319CLL);
}

void std::__shared_ptr_emplace<DigestGenerator384>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDA80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator384>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDA80;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D319CLL);
}

_QWORD *getDigestGeneratorFor@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;

  switch((_DWORD)result)
  {
    case 2:
      result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator384NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
      goto LABEL_7;
    case 1:
      result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator256NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
      goto LABEL_7;
    case 0:
      result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator160NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
LABEL_7:
      *(_OWORD *)a2 = v3;
      return result;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t getDigestForCBSignatureType(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

_QWORD *getPrefixForDigestType@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  char *v2;

  switch((_DWORD)result)
  {
    case 2:
      v2 = "3";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    case 1:
      v2 = "2";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    case 0:
      v2 = "1";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return result;
}

char *asString(unsigned int a1)
{
  if (a1 > 2)
    return (char *)&unk_21467255F;
  else
    return (&off_24D1DDB60)[a1];
}

const char *asString(int a1)
{
  const char *v1;

  v1 = "Unknown Format";
  if (a1 == 1)
    v1 = "Format2";
  if (a1)
    return v1;
  else
    return "Format1";
}

{
  const char *v1;

  v1 = "Unknown";
  if (a1 == 1)
    v1 = "production";
  if (a1)
    return v1;
  else
    return "development";
}

{
  if (a1)
    return "Unknown Format";
  else
    return "Format1";
}

BOOL doSecVerify_iOS(const void **a1, const void **a2, _BOOL8 a3, int a4)
{
  _BOOL8 v4;
  SecPadding v7;
  const UInt8 *BytePtr;
  size_t Length;
  const UInt8 *v10;
  size_t v11;
  const void *v13;
  const void *v14;

  v4 = a3;
  if (a3)
  {
    if (a4 == 2)
    {
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v14, a1);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v13, a2);
      v4 = SecKeyVerifySignature_OSX_iOS((__SecKey *)v4, (const __CFData **)&v14, (const __CFData **)&v13);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v13);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
    }
    else
    {
      if (a4 == 1)
        v7 = 32772;
      else
        v7 = 32770;
      BytePtr = CFDataGetBytePtr((CFDataRef)*a1);
      Length = CFDataGetLength((CFDataRef)*a1);
      v10 = CFDataGetBytePtr((CFDataRef)*a2);
      v11 = CFDataGetLength((CFDataRef)*a2);
      return SecKeyRawVerify((SecKeyRef)v4, v7, BytePtr, Length, v10, v11) == 0;
    }
  }
  else
  {
    writeLog("signKeyRef is NULL");
  }
  return v4;
}

void sub_21466CFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a9);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

BOOL SecKeyVerifySignature_OSX_iOS(__SecKey *a1, const __CFData **a2, const __CFData **a3)
{
  const __CFString *v6;
  const __CFData *v7;
  const __CFData *v8;
  _BOOL8 v9;
  CFErrorRef error[2];
  const void *v12;

  v6 = (const __CFString *)*MEMORY[0x24BDE92A0];
  if (!SecKeyIsAlgorithmSupported(a1, kSecKeyOperationTypeVerify, (SecKeyAlgorithm)*MEMORY[0x24BDE92A0]))
    writeLog("kSecKeyAlgorithmECDSASignatureDigestX962SHA384 algorithm is not supported\n");
  v7 = *a2;
  v8 = *a3;
  error[0] = 0;
  error[1] = (CFErrorRef)&v12;
  v12 = 0;
  v9 = SecKeyVerifySignature(a1, v6, v7, v8, error) != 0;
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v12);
  return v9;
}

void sub_21466D0AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  v5 = va_arg(va1, _QWORD);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t createSecKeyRef(const unsigned __int8 *a1)
{
  uint64_t RSAPublicKey;

  RSAPublicKey = SecKeyCreateRSAPublicKey();
  if (!RSAPublicKey)
    writeLog("Unable to create the RSA Public SecKey Ref\n");
  return RSAPublicKey;
}

uint64_t createECDSASecKeyRef(const unsigned __int8 *a1)
{
  uint64_t v1;

  v1 = SecKeyCreateFromPublicBytes();
  if (!v1)
    writeLog("Unable to create the ECDSA SecKey Ref\n");
  return v1;
}

uint64_t getSecKeyRef(const unsigned __int8 *a1, uint64_t a2, int a3)
{
  if (a3 == 2)
    return createECDSASecKeyRef(a1);
  else
    return createSecKeyRef(a1);
}

BOOL VerifyDigest(const void **a1, const void **a2, _BOOL8 a3, int a4)
{
  _BOOL8 v7;
  const void *v9;
  const void *v10;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v10, a1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v9, a2);
  v7 = doSecVerify_iOS(&v10, &v9, a3, a4);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v10);
  return v7;
}

void sub_21466D1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a9);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleSignature(uint64_t a1, int a2, uint64_t a3)
{
  const unsigned __int8 *public_key;
  uint64_t ECDSASecKeyRef;
  uint64_t v7;
  const void *v8;
  int v9;
  const char *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  CarrierBundle *v20;
  std::__shared_weak_count *v21;

  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v20);
  if ((CarrierBundle::readBundle(v20) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    v7 = 0;
    goto LABEL_22;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v18);
  if (v18)
  {
    public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v18, a2, a3);
    PublicKeys::get_public_key_size(v18, a2, a3);
    if (a2 == 2)
      ECDSASecKeyRef = createECDSASecKeyRef(public_key);
    else
      ECDSASecKeyRef = createSecKeyRef(public_key);
    v8 = (const void *)ECDSASecKeyRef;
    if (ECDSASecKeyRef)
    {
      v9 = CarrierBundle::verifySignatures((uint64_t)v20, a2, a3, ECDSASecKeyRef, 0);
      CFRelease(v8);
      if (v9)
      {
        v10 = "Unknown";
        if ((_DWORD)a3 == 1)
          v10 = "production";
        if (!(_DWORD)a3)
          v10 = "development";
        writeLog("Signature verification has passed with the %s keys\n", v10);
        v7 = 1;
        goto LABEL_17;
      }
    }
    else
    {
      writeLog("Unable to create the SecKeyRef\n");
    }
  }
  else
  {
    writeLog("Unable to create the public keys\n");
  }
  v7 = 0;
LABEL_17:
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
LABEL_22:
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v7;
}

void sub_21466D3B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleSignatureForType(uint64_t a1, int a2)
{
  const unsigned __int8 *public_key;
  uint64_t ECDSASecKeyRef;
  uint64_t v5;
  const void *v6;
  char v7;
  const unsigned __int8 *v8;
  uint64_t v9;
  const void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  CarrierBundle *v20;
  std::__shared_weak_count *v21;

  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v20);
  if ((CarrierBundle::readBundle(v20) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    v5 = 0;
    goto LABEL_26;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v18);
  if (!v18)
  {
    writeLog("Unable to create the public keys\n");
LABEL_20:
    v5 = 0;
    goto LABEL_21;
  }
  public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v18, a2, 1);
  PublicKeys::get_public_key_size(v18, a2, 1u);
  if (a2 == 2)
    ECDSASecKeyRef = createECDSASecKeyRef(public_key);
  else
    ECDSASecKeyRef = createSecKeyRef(public_key);
  v6 = (const void *)ECDSASecKeyRef;
  if (!ECDSASecKeyRef)
    goto LABEL_19;
  v7 = CarrierBundle::verifySignatures((uint64_t)v20, a2, 1, ECDSASecKeyRef, 0);
  CFRelease(v6);
  if ((v7 & 1) != 0)
  {
    writeLog("Signature verification has passed the production signing\n");
LABEL_18:
    v5 = 1;
    goto LABEL_21;
  }
  writeLog("Fallback to the dev signing verification\n");
  v8 = (const unsigned __int8 *)PublicKeys::get_public_key(v18, a2, 0);
  PublicKeys::get_public_key_size(v18, a2, 0);
  v9 = a2 == 2 ? createECDSASecKeyRef(v8) : createSecKeyRef(v8);
  v10 = (const void *)v9;
  if (!v9)
  {
LABEL_19:
    writeLog("Unable to create the SecKeyRef\n");
    goto LABEL_20;
  }
  v5 = CarrierBundle::verifySignatures((uint64_t)v20, a2, 0, v9, 0);
  CFRelease(v10);
  if ((_DWORD)v5)
  {
    writeLog("Signature verification has passed the dev signing\n");
    goto LABEL_18;
  }
LABEL_21:
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
LABEL_26:
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v5;
}

void sub_21466D60C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleVersionsXMLSignature(const __CFDictionary *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  if (a3 != 2)
  {
    writeLog("Error : Unsupported signature type for version xml verification.\n", v3, v4);
    return 0;
  }
  if ((_DWORD)a2 != 1)
  {
    if (!(_DWORD)a2)
      return VerifyCarrierBundleVersionsXMLFormat1(a1, a2, 1);
    return 0;
  }
  return VerifyCarrierBundleVersionsXMLFormat2(a1, a2, 1);
}

uint64_t VerifyCarrierBundleVersionsXMLFormat1(const __CFDictionary *a1, uint64_t a2, int a3)
{
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  const char *v16;
  CFTypeRef v18;
  const void *v19;
  __CFDictionary *MutableCopy;
  CFTypeRef cf;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("MobileDeviceCarrierBundlesByProductVersion"));
  if (!Value || (v6 = Value, v7 = CFGetTypeID(Value), v7 != CFDictionaryGetTypeID()))
  {
    writeLog("MobileDeviceCarrierBundlesByProductVersion is not found in version.xml");
    return 0;
  }
  v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("CarrierBundleSignatures"));
  if (!v8 || (v9 = v8, v10 = CFGetTypeID(v8), v10 != CFDictionaryGetTypeID()))
  {
    writeLog("CarrierBundleSignatures is not found in version.xml");
    return 0;
  }
  v11 = (const __CFDictionary *)CFDictionaryGetValue(v9, CFSTR("Format1"));
  if (!v11 || (v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDictionaryGetTypeID()))
  {
    writeLog("Format1 is not found in the CarrierBundleSignatures of version.xml");
    return 0;
  }
  MutableCopy = (__CFDictionary *)CFDictionaryGetValue(v12, CFSTR("signature3"));
  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&MutableCopy);
  if (cf)
    v14 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v14 = 0;
  if (v14)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v6);
    CFDictionaryRemoveValue(MutableCopy, CFSTR("signature"));
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v19, (CFTypeRef *)&MutableCopy);
    v18 = cf;
    if (cf)
      CFRetain(cf);
    v15 = VerifyXMLDigestForType(&v19, &v18, (_QWORD *)2, a3);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v18);
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v19);
    v16 = "Unknown";
    if (a3 == 1)
      v16 = "production";
    if (!a3)
      v16 = "development";
    if ((v15 & 1) != 0)
      writeLog("version XML CarrierBundle signatures verification of %s passed using the %s key\n", "Format1", v16);
    else
      writeLog("Error : Version XML CarrierBundle signatures verification failed on Format1 using %skeys\n", v16);
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
  }
  else
  {
    writeLog("Error: signature3 key is not present in the Format1 signatures dictionary of the version xml");
    v15 = 0;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  return v15;
}

void sub_21466D884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleVersionsXMLFormat2(const __CFDictionary *a1, uint64_t a2, int a3)
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  uint64_t (*v11)(uint64_t);
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  CFTypeID v14;
  const __CFAllocator *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  const char *v22;
  const void *v23;
  const void *v24;
  void *value;
  const __CFDictionary *v26;
  CFMutableDictionaryRef v27;
  CFDictionaryRef theDict;
  const __CFDictionary *MutableCopy;
  const void *v30;

  v5 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("CarrierBundleSignatures"));
  if (v5 && (v6 = v5, v7 = CFGetTypeID(v5), v7 == CFDictionaryGetTypeID()))
  {
    v8 = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("Format2"));
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFDictionaryGetTypeID())
      {
        MutableCopy = (const __CFDictionary *)CFDictionaryGetValue(v9, CFSTR("signature3"));
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v30, (CFTypeRef *)&MutableCopy);
        if (v30)
          v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        else
          v11 = 0;
        if (v11)
        {
          v12 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("CarrierBundles"));
          v13 = v12;
          if (v12)
          {
            v14 = CFGetTypeID(v12);
            if (v14 == CFDictionaryGetTypeID())
            {
              v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
              MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v13);
              v16 = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, CFSTR("Watch"));
              theDict = v16;
              if (v16)
              {
                CFRetain(v16);
                v17 = theDict;
              }
              else
              {
                v17 = 0;
              }
              v27 = CFDictionaryCreateMutableCopy(v15, 0, v17);
              v20 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Bundles"));
              v21 = v20;
              v26 = v20;
              if (v20)
                CFRetain(v20);
              value = CFDictionaryCreateMutableCopy(v15, 0, v21);
              CFDictionaryRemoveValue((CFMutableDictionaryRef)value, CFSTR("signature"));
              CFDictionarySetValue(v27, CFSTR("Bundles"), value);
              CFDictionarySetValue(MutableCopy, CFSTR("Watch"), v27);
              ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v24, (CFTypeRef *)&MutableCopy);
              v23 = v30;
              if (v30)
                CFRetain(v30);
              v18 = VerifyXMLDigestForType(&v24, &v23, (_QWORD *)2, a3);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v24);
              v22 = "Unknown";
              if (a3 == 1)
                v22 = "production";
              if (!a3)
                v22 = "development";
              if ((v18 & 1) != 0)
                writeLog("version XML CarrierBundle signatures verification of %s passed using the %s key\n", "Format2", v22);
              else
                writeLog("Error : Version XML CarrierBundle signatures verification failed on Format2 using %s keys\n", v22);
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&value);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v26);
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v27);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
              goto LABEL_20;
            }
          }
          writeLog("CarrierBundles key is not found in version.xml");
        }
        else
        {
          writeLog("Error: signature3 key is not present in the Format2 signatures dictionary of the version xml");
        }
        v18 = 0;
LABEL_20:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v30);
        return v18;
      }
    }
    writeLog("Format2 is not found in the CarrierBundleSignatures of version.xml");
  }
  else
  {
    writeLog("CarrierBundleSignatures is not found in version.xml");
  }
  return 0;
}

void sub_21466DB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  const void *v5;
  va_list va;
  const void *v7;
  va_list va1;
  const void *v9;
  va_list va2;
  const void *v11;
  va_list va3;
  const void *v13;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v7 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v9 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v11 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v13 = va_arg(va5, const void *);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va3);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va4);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va5);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v3 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v3 - 40));
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleVersionsXMLSignatureWithKeyType(const __CFDictionary *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  if (a3 != 2)
  {
    writeLog("Error : Unsupported signature type for version xml verification.\n", v4, v5);
    return 0;
  }
  if ((_DWORD)a2 != 1)
  {
    if (!(_DWORD)a2)
      return VerifyCarrierBundleVersionsXMLFormat1(a1, a2, a4);
    return 0;
  }
  return VerifyCarrierBundleVersionsXMLFormat2(a1, a2, a4);
}

uint64_t VerifyXMLDigestForType(const void **a1, const void **a2, _QWORD *a3, int a4)
{
  int v5;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  BOOL v14;
  const unsigned __int8 *sha2_384_production_publickey;
  uint64_t ECDSASecKeyRef;
  uint64_t v17;
  const unsigned __int8 *sha2_384_development_publickey;
  const void *v19;
  BOOL v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const void *v28;
  CFTypeRef v29;
  PublicKeys *v30;
  std::__shared_weak_count *v31;
  CFTypeRef cf;
  const void *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  _BYTE v36[32];
  uint64_t v37;
  std::__shared_weak_count *v38;

  v5 = (int)a3;
  getDigestGeneratorFor(a3, (uint64_t)&v37);
  v8 = v37;
  if (v37)
  {
    ComputeHash::ComputeHash((ComputeHash *)v36);
    v34 = v8;
    v35 = v38;
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    ComputeHash::setDigestGenerator((uint64_t)v36, &v34);
    v11 = v35;
    if (v35)
    {
      v12 = (unint64_t *)&v35->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    if ((ComputeHash::init((ComputeHash *)v36) & 1) != 0)
    {
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v33, a1);
      v14 = ComputeHash::digest_dictionary((uint64_t)v36, (CFDictionaryRef *)&v33);
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v33);
      if (v14)
      {
        ComputeHash::finalize((ComputeHash *)v36, (CFDataRef *)&cf);
        _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v30);
        if (v30)
        {
          if (a4)
          {
            if (a4 != 1)
            {
              writeLog("Error : Unknown signature key type\n");
              goto LABEL_29;
            }
            sha2_384_production_publickey = (const unsigned __int8 *)PublicKeys::get_sha2_384_production_publickey(v30);
            PublicKeys::get_sha2_384_production_keysize(v30);
            ECDSASecKeyRef = createECDSASecKeyRef(sha2_384_production_publickey);
          }
          else
          {
            sha2_384_development_publickey = (const unsigned __int8 *)PublicKeys::get_sha2_384_development_publickey(v30);
            PublicKeys::get_sha2_384_development_keysize(v30);
            ECDSASecKeyRef = createECDSASecKeyRef(sha2_384_development_publickey);
          }
          v19 = (const void *)ECDSASecKeyRef;
          if (ECDSASecKeyRef)
          {
            v29 = cf;
            if (cf)
              CFRetain(cf);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v28, a2);
            v20 = VerifyDigest(&v29, &v28, (_BOOL8)v19, v5);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v29);
            CFRelease(v19);
            if (v20)
            {
              v17 = 1;
              goto LABEL_30;
            }
            writeLog("Verification of the digest failed\n");
          }
        }
        else
        {
          writeLog("Error : Unable to get the public keys\n");
        }
LABEL_29:
        v17 = 0;
LABEL_30:
        v21 = v31;
        if (v31)
        {
          v22 = (unint64_t *)&v31->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
        goto LABEL_36;
      }
      writeLog("Error Failed to generate digest for the dictionary");
    }
    else
    {
      writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    }
    v17 = 0;
LABEL_36:
    ComputeHash::~ComputeHash((ComputeHash *)v36);
    goto LABEL_37;
  }
  writeLog("Error: Failed to get digest generator for digest type: %d\n", v5);
  v17 = 0;
LABEL_37:
  v24 = v38;
  if (v38)
  {
    v25 = (unint64_t *)&v38->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  return v17;
}

void sub_21466DF04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  const void *v4;
  va_list va;
  const void *v6;
  va_list va1;
  uint64_t v8;
  va_list va2;
  uint64_t v10;
  const void *v11;
  va_list va3;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va4;

  va_start(va4, a2);
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v6 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v8 = va_arg(va3, _QWORD);
  v10 = va_arg(va3, _QWORD);
  va_copy(va4, va3);
  v11 = va_arg(va4, const void *);
  v13 = va_arg(va4, _QWORD);
  v14 = va_arg(va4, _QWORD);
  v15 = va_arg(va4, _QWORD);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va3);
  ComputeHash::~ComputeHash((ComputeHash *)va4);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100](v2 - 72);
  _Unwind_Resume(a1);
}

uint64_t VerifyCountryBundleVersionsXMLSignatureWithKeyType(const __CFDictionary *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if (a3 == 2)
    {
      if (!(_DWORD)a2)
        return VerifyCountryBundleVersionsXMLFormat1(a1, a2, a4);
    }
    else
    {
      writeLog("Error : Unsupported signature type for version xml verification.\n", v4, v5);
    }
  }
  return 0;
}

uint64_t VerifyCountryBundleVersionsXMLFormat1(const __CFDictionary *a1, uint64_t a2, int a3)
{
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  uint64_t (*v11)(uint64_t);
  uint64_t (*v12)(uint64_t);
  char v13;
  const char *v14;
  uint64_t v15;
  const void *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef cf[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("CountryBundleSignatures"));
  if (Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFDictionaryGetTypeID()))
  {
    v8 = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("Format1"));
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFDictionaryGetTypeID())
      {
        cf[0] = CFDictionaryGetValue(v9, CFSTR("signature3"));
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v22, cf);
        if ((_QWORD)v22)
          v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        else
          v11 = 0;
        if (!v11)
        {
          writeLog("Error: signature3 key is not present in the Format1 signatures dictionary of the version xml");
          v15 = 0;
LABEL_32:
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v22);
          return v15;
        }
        v19 = CFDictionaryGetValue(a1, CFSTR("CountryBundles"));
        ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(cf, &v19);
        v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        if (!cf[0])
          v12 = 0;
        if (v12)
        {
          v18 = cf[0];
          if (cf[0])
            CFRetain(cf[0]);
          v17 = (const void *)v22;
          if ((_QWORD)v22)
            CFRetain((CFTypeRef)v22);
          v13 = VerifyXMLDigestForType(&v18, &v17, (_QWORD *)2, a3);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v17);
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v18);
          v14 = "Unknown";
          if (a3 == 1)
            v14 = "production";
          if (!a3)
            v14 = "development";
          if ((v13 & 1) != 0)
          {
            writeLog("version XML CountryBundle signatures verification of %s passed using the %s key\n", "Format1", v14);
            v15 = 1;
LABEL_31:
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(cf);
            goto LABEL_32;
          }
          writeLog("Error : Version XML CountryBundle signatures verification failed on %s using %s keys\n", "Format1", v14);
        }
        else
        {
          writeLog("CountryBundles key is not found in version.xml");
        }
        v15 = 0;
        goto LABEL_31;
      }
    }
    writeLog("Format1 is not found in the CountryBundleSignatures of version.xml");
  }
  else
  {
    v22 = 0uLL;
    v23 = 0;
    ctu::cf::assign();
    *(_OWORD *)cf = 0uLL;
    v21 = 0;
    writeLog("%s is not found in version.xml", (const char *)cf);
    if (SHIBYTE(v21) < 0)
      operator delete((void *)cf[0]);
  }
  return 0;
}

void sub_21466E214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v23 - 56));
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleSignature_OSX(uint64_t a1, uint64_t a2, int **a3)
{
  int *v5;
  int *v6;
  unsigned int v7;
  const unsigned __int8 *public_key;
  uint64_t ECDSASecKeyRef;
  const void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v23;
  std::__shared_weak_count *v24;
  CarrierBundle *v25;
  std::__shared_weak_count *v26;

  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v25);
  if ((CarrierBundle::readBundle(v25) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    v14 = 0;
    goto LABEL_28;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v23);
  if (!v23)
  {
    writeLog("Unable to create the public keys\n");
LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  v5 = *a3;
  v6 = a3[1];
  if (*a3 != v6)
  {
    while (1)
    {
      v7 = *v5;
      public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v23, *v5, a2);
      PublicKeys::get_public_key_size(v23, v7, a2);
      if (v7 == 2)
        ECDSASecKeyRef = createECDSASecKeyRef(public_key);
      else
        ECDSASecKeyRef = createSecKeyRef(public_key);
      v10 = (const void *)ECDSASecKeyRef;
      if (!ECDSASecKeyRef)
      {
        writeLog("Unable to create the SecKeyRef\n");
        goto LABEL_22;
      }
      v11 = (const char *)&unk_21467255F;
      if (v7 <= 2)
        v11 = (&off_24D1DDB60)[v7];
      writeLog("Verifying %s \n", v11);
      v12 = CarrierBundle::verifySignatures((uint64_t)v25, v7, a2, (_BOOL8)v10, 1);
      CFRelease(v10);
      if (!v12)
        break;
      v13 = (const char *)&unk_21467255F;
      if (v7 <= 2)
        v13 = (&off_24D1DDB60)[v7];
      writeLog("%s Verification succeeded\n", v13);
      if (++v5 == v6)
        goto LABEL_14;
    }
    if (v7 > 2)
      v15 = (const char *)&unk_21467255F;
    else
      v15 = (&off_24D1DDB60)[v7];
    writeLog("%s Verifications failed\n", v15);
    goto LABEL_22;
  }
LABEL_14:
  v14 = 1;
LABEL_23:
  v16 = v24;
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_28:
  v19 = v26;
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  return v14;
}

void sub_21466E4C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void findMatchingFile_Internal(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char **v13;
  char *v14[3];

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v14[0] = 0;
  v14[1] = 0;
  v13 = v14;
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 != a1)
    FileSystemManager::getFileExtension((uint64_t *)(v3 + 16));
  v4 = a2[1];
  v5 = *a2;
  v6 = v4 - 24;
  if (*a2 != v4 && v6 > v5)
  {
    v8 = v5 + 24;
    do
    {
      v9 = *(_OWORD *)(v8 - 24);
      v10 = *(_QWORD *)(v8 - 8);
      v11 = *(_QWORD *)(v6 + 16);
      *(_OWORD *)(v8 - 24) = *(_OWORD *)v6;
      *(_QWORD *)(v8 - 8) = v11;
      *(_QWORD *)(v6 + 16) = v10;
      *(_OWORD *)v6 = v9;
      v6 -= 24;
      v12 = v8 >= v6;
      v8 += 24;
    }
    while (!v12);
  }
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&v13, v14[0]);
}

void sub_21466E960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;

  a19 = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a34 < 0)
    operator delete(__p);
  if (a40 < 0)
    operator delete(a35);
  if (*(char *)(v40 - 113) < 0)
    operator delete(*(void **)(v40 - 136));
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(v40 - 112, *(char **)(v40 - 104));
  a19 = a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  _Unwind_Resume(a1);
}

_QWORD *std::tuple<std::string &,std::string &>::operator=[abi:ne180100]<std::string,std::string,0>(_QWORD *a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;

  v4 = *a1;
  if (*(char *)(*a1 + 23) < 0)
    operator delete(*(void **)v4);
  v5 = *a2;
  *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)v4 = v5;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
  v6 = a1[1];
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  v7 = *(__int128 *)((char *)a2 + 24);
  *(_QWORD *)(v6 + 16) = *((_QWORD *)a2 + 5);
  *(_OWORD *)v6 = v7;
  *((_BYTE *)a2 + 47) = 0;
  *((_BYTE *)a2 + 24) = 0;
  return a1;
}

void findMatchingFile(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  _QWORD v11[3];
  id v12;
  char **v13;
  char *v14[2];
  __int128 v15;
  unint64_t v16;

  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  if (!v5)
    goto LABEL_15;
  v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a2 + 8);
  if (!v7)
    goto LABEL_15;
  v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a3 + 8);
  if (v8)
  {
    v15 = 0uLL;
    v16 = 0;
    v14[0] = 0;
    v14[1] = 0;
    v13 = v14;
    FileSystemManager::FileSystemManager((FileSystemManager *)&v12);
    v11[0] = v11;
    v11[1] = v11;
    v11[2] = 0;
    if (FileSystemManager::directoryContentsAtPath((char *)a1, v11, 0))
    {
      if (*(char *)(a2 + 23) >= 0)
        v10 = (const char *)a2;
      else
        v10 = *(const char **)a2;
      writeLog("Going through the contents in the directory searching for pattern '%s', and extension: '%s'\n", "overrides", v10);
      findMatchingFile_Internal((uint64_t)v11, a4);
    }
    else
    {
      *(_OWORD *)a4 = v15;
      a4[2] = v16;
      v16 = 0;
      v15 = 0uLL;
    }
    std::__list_imp<std::string>::clear(v11);
    FileSystemManager::~FileSystemManager(&v12);
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&v13, v14[0]);
    v13 = (char **)&v15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  }
  else
  {
LABEL_15:
    writeLog("None of the arguments to this function can be empty\n");
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
}

void sub_21466EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16, char *a17)
{
  uint64_t v17;

  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&a16, a17);
  a16 = (void **)(v17 - 64);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void dictAfterMergingPlistsAtPath(const void **a1@<X0>, uint64_t *a2@<X1>, const __CFDictionary **a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  size_t v7;
  std::string *v8;
  const void *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  uint64_t (*v15)(uint64_t);
  uint64_t (*v16)(uint64_t);
  void **v17;
  const __CFDictionary *v18;
  __CFDictionary *v19;
  std::string v20;
  void *__p[2];
  int64_t v22;

  *a3 = 0;
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      if (*((char *)a1 + 23) >= 0)
        v7 = *((unsigned __int8 *)a1 + 23);
      else
        v7 = (size_t)a1[1];
      std::string::basic_string[abi:ne180100]((uint64_t)&v20, v7 + 1);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v8 = &v20;
      else
        v8 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if (v7)
      {
        if (*((char *)a1 + 23) >= 0)
          v9 = a1;
        else
          v9 = *a1;
        memmove(v8, v9, v7);
      }
      *(_WORD *)((char *)&v8->__r_.__value_.__l.__data_ + v7) = 47;
      v10 = *(char *)(v3 + 23);
      if (v10 >= 0)
        v11 = (const std::string::value_type *)v3;
      else
        v11 = *(const std::string::value_type **)v3;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(v3 + 23);
      else
        v12 = *(_QWORD *)(v3 + 8);
      v13 = std::string::append(&v20, v11, v12);
      v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      v22 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v20.__r_.__value_.__l.__data_);
      FileSystemManager::dictionaryFromPath((uint64_t *)__p, &v19);
      if (v19)
        v15 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      else
        v15 = 0;
      if (v15)
      {
        if (*a3)
          v16 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        else
          v16 = 0;
        if (v16)
        {
          copyMergedDictionaries(*a3, v19, &v18);
          if (&v18 != a3)
          {
            v20.__r_.__value_.__r.__words[0] = (std::string::size_type)*a3;
            *a3 = v18;
            v18 = 0;
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v20.__r_.__value_.__l.__data_);
          }
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v18);
        }
        else
        {
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::operator=((const void **)a3, (const void **)&v19);
        }
      }
      else
      {
        v17 = __p;
        if (v22 < 0)
          v17 = (void **)__p[0];
        writeLog("Signature dict for file at path %s is nil\n", (const char *)v17);
      }
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v19);
      if (SHIBYTE(v22) < 0)
        operator delete(__p[0]);
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_21466EDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  const void **v23;

  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a11);
  if (a23 < 0)
    operator delete(__p);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v23);
  _Unwind_Resume(a1);
}

const void **copyMergedDictionaries@<X0>(const __CFDictionary *a1@<X0>, const __CFDictionary *a2@<X1>, _QWORD *a3@<X8>)
{
  CFIndex Count;
  uint64_t i;
  const void *v8;
  const void *v9;
  const void *v10;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  const __CFDictionary *v14;
  void *value;
  void **values[3];
  void **keys[3];
  CFMutableDictionaryRef theDict;

  theDict = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a1);
  Count = CFDictionaryGetCount(a2);
  std::vector<void const*>::vector(keys, Count);
  std::vector<void const*>::vector(values, Count);
  CFDictionaryGetKeysAndValues(a2, (const void **)keys[0], (const void **)values[0]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      v8 = CFDictionaryGetValue(a1, keys[0][i]);
      v9 = CFDictionaryGetValue(a2, keys[0][i]);
      v10 = v9;
      if (v8 && (v11 = CFGetTypeID(v9), v11 == CFDictionaryGetTypeID()))
      {
        v12 = CFGetTypeID(v8);
        if (v12 != CFDictionaryGetTypeID())
          v8 = 0;
        if (v10)
        {
          v13 = CFGetTypeID(v10);
          if (v13 == CFDictionaryGetTypeID())
            v14 = (const __CFDictionary *)v10;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        copyMergedDictionaries((uint64_t *)&value, (const __CFDictionary *)v8, v14);
        CFDictionarySetValue(theDict, keys[0][i], value);
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&value);
      }
      else
      {
        CFDictionarySetValue(theDict, keys[0][i], v10);
      }
    }
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(a3, (CFTypeRef *)&theDict);
  if (values[0])
  {
    values[1] = values[0];
    operator delete(values[0]);
  }
  if (keys[0])
  {
    keys[1] = keys[0];
    operator delete(keys[0]);
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
}

void sub_21466EFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, const void *a16)
{
  if (__p)
    operator delete(__p);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a16);
  _Unwind_Resume(a1);
}

void copyPRISignatureForDeviceNameOnSHA(const void **a1@<X0>, uint64_t a2@<X1>, const void **a3@<X2>, int a4@<W3>, _QWORD *a5@<X8>)
{
  size_t v10;
  std::string *v11;
  const void *v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  std::string::value_type *v19;
  std::string::size_type size;
  int v21;
  const char *v22;
  uint64_t (*v23)(uint64_t);
  const char *v24;
  const void **v25;
  CFTypeRef Value;
  CFStringRef v27;
  char *cStr[2];
  char v29;
  CFDictionaryRef theDict;
  void *__p;
  uint64_t v32;
  uint64_t v33;
  _DWORD v34[2];
  std::string v35;
  void *v36[2];
  std::string::size_type v37;
  uint64_t v38;
  std::string v39;
  __int128 v40;

  *(_QWORD *)&v40 = *MEMORY[0x24BDAC8D0];
  writeLog("-------------------------------------copyPRISignatureForDeviceName begins-------------------------------------------\n");
  *a5 = 0;
  if (*((char *)a1 + 23) >= 0)
    v10 = *((unsigned __int8 *)a1 + 23);
  else
    v10 = (size_t)a1[1];
  v11 = &v35;
  std::string::basic_string[abi:ne180100]((uint64_t)&v35, v10 + 1);
  if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v11 = (std::string *)v35.__r_.__value_.__r.__words[0];
  if (v10)
  {
    if (*((char *)a1 + 23) >= 0)
      v12 = a1;
    else
      v12 = *a1;
    memmove(v11, v12, v10);
  }
  *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
  v13 = std::string::append(&v35, "signatures");
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v37 = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)v36 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  v15 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v39, "common");
  v16 = std::string::append(v15, ".");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v35.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v35, "plist");
  v19 = (std::string::value_type *)v18->__r_.__value_.__r.__words[0];
  size = v18->__r_.__value_.__l.__size_;
  v34[0] = v18->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v34 + 3) = *(_DWORD *)((char *)&v18->__r_.__value_.__r.__words[2] + 3);
  v21 = SHIBYTE(v18->__r_.__value_.__r.__words[2]);
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v39.__r_.__value_.__l.__data_);
    if ((v21 & 0x80000000) == 0)
      goto LABEL_17;
  }
  else if ((v21 & 0x80000000) == 0)
  {
LABEL_17:
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
    v39.__r_.__value_.__l.__size_ = size;
    LODWORD(v39.__r_.__value_.__r.__words[2]) = v34[0];
    *(_DWORD *)((char *)&v39.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v34 + 3);
    *((_BYTE *)&v39.__r_.__value_.__s + 23) = v21;
    goto LABEL_20;
  }
  std::string::__init_copy_ctor_external(&v39, v19, size);
LABEL_20:
  memset(&v35, 0, sizeof(v35));
  __p = &v35;
  LOBYTE(v32) = 0;
  v35.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x18uLL);
  v35.__r_.__value_.__l.__size_ = v35.__r_.__value_.__r.__words[0];
  v35.__r_.__value_.__r.__words[2] = v35.__r_.__value_.__r.__words[0] + 24;
  v35.__r_.__value_.__l.__size_ = (std::string::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v35.__r_.__value_.__r.__words[2], (__int128 *)&v39, &v40, (std::string *)v35.__r_.__value_.__l.__data_);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  std::string::basic_string[abi:ne180100]<0>(&__p, "plist");
  findMatchingFile((uint64_t)v36, (uint64_t)&__p, a2, (unint64_t *)&v39);
  if (SHIBYTE(v33) < 0)
    operator delete(__p);
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>((std::vector<std::string> *)&v35, (std::string *)v35.__r_.__value_.__l.__size_, (std::string *)v39.__r_.__value_.__l.__data_, (__int128 *)v39.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39.__r_.__value_.__l.__size_ - v39.__r_.__value_.__r.__words[0]) >> 3));
  dictAfterMergingPlistsAtPath((const void **)v36, (uint64_t *)&v35, &theDict);
  __p = 0;
  v32 = 0;
  v33 = 0;
  if (a4 == 1)
  {
    v22 = "2";
  }
  else
  {
    if (a4 != 2)
      goto LABEL_39;
    v22 = "3";
  }
  MEMORY[0x2199D3130](&__p, v22);
  if (theDict)
    v23 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v23 = 0;
  if (v23)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (const void **)&__p, (uint64_t)cStr);
    if (v29 < 0)
    {
      if (!cStr[1])
      {
LABEL_38:
        operator delete(cStr[0]);
        goto LABEL_39;
      }
      v24 = cStr[0];
    }
    else
    {
      if (!v29)
        goto LABEL_39;
      v24 = (const char *)cStr;
    }
    v27 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v24, 0x8000100u);
    Value = CFDictionaryGetValue(theDict, v27);
    v25 = (const void **)ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v38, &Value);
    *a5 = v38;
    v38 = 0;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v25);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v27);
    if ((v29 & 0x80000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_39:
  writeLog("-------------------------------------copyPRISignatureForDeviceName ends----------------------------------------------\n");
  if (SHIBYTE(v33) < 0)
    operator delete(__p);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  __p = &v39;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
  if (v21 < 0)
    operator delete(v19);
  if (SHIBYTE(v37) < 0)
    operator delete(v36[0]);
}

void sub_21466F424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, const void *a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  const void **v37;
  void *v38;
  int v39;
  uint64_t v40;

  if (a16 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a17);
  a18 = (void *)(v40 - 112);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  *(_QWORD *)(v40 - 112) = &a25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v40 - 112));
  if (v39 < 0)
    operator delete(v38);
  if (a37 < 0)
    operator delete(a32);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v37);
  _Unwind_Resume(a1);
}

void getDigestForIpcc(char *a1@<X0>, _QWORD *a2@<X1>, CFDataRef *a3@<X8>)
{
  int v3;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  FileSystemManager *v12;
  const char *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  _BYTE v19[32];
  uint64_t v20;
  std::__shared_weak_count *v21;

  v3 = (int)a2;
  getDigestGeneratorFor(a2, (uint64_t)&v20);
  v6 = v20;
  if (!v20)
  {
    writeLog("Error: Failed to get digest generator for digest type: %d\n", v3);
    *a3 = 0;
    goto LABEL_24;
  }
  ComputeHash::ComputeHash((ComputeHash *)v19);
  v17 = v6;
  v18 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ComputeHash::setDigestGenerator((uint64_t)v19, &v17);
  v9 = v18;
  if (v18)
  {
    v10 = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if ((ComputeHash::init((ComputeHash *)v19) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
LABEL_22:
    *a3 = 0;
    goto LABEL_23;
  }
  if (a1[23] >= 0)
    v12 = (FileSystemManager *)a1;
  else
    v12 = *(FileSystemManager **)a1;
  if ((ComputeHash::digest_file((ComputeHash *)v19, v12) & 1) == 0)
  {
    if (a1[23] >= 0)
      v13 = a1;
    else
      v13 = *(const char **)a1;
    writeLog("Error: Failed to compute digest for %s\n", v13);
    goto LABEL_22;
  }
  ComputeHash::finalize((ComputeHash *)v19, a3);
LABEL_23:
  ComputeHash::~ComputeHash((ComputeHash *)v19);
LABEL_24:
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void sub_21466F6E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<DigestGenerator>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::operator=(const void **a1, const void **a2)
{
  const void *v3;
  const void *v5;

  if (a1 != a2)
  {
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v5, a2);
    v3 = *a1;
    *a1 = v5;
    v5 = v3;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v5);
  }
  return a1;
}

_QWORD *std::vector<void const*>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21466F7F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<void const*>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator160NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x88uLL);
  result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator160NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21466F8F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator160NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(_QWORD *a1)
{
  a1[2] = 0;
  *a1 = &unk_24D1DD9E0;
  a1[1] = 0;
  DigestGenerator160::DigestGenerator160((DigestGenerator160 *)(a1 + 3));
  return a1;
}

void sub_21466F93C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator256NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x90uLL);
  result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator256NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21466F984(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator256NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(_QWORD *a1)
{
  a1[2] = 0;
  *a1 = &unk_24D1DDA30;
  a1[1] = 0;
  DigestGenerator256::DigestGenerator256((DigestGenerator256 *)(a1 + 3));
  return a1;
}

void sub_21466F9D0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator384NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0xF8uLL);
  result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator384NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21466FA18(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator384NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(_QWORD *a1)
{
  a1[2] = 0;
  *a1 = &unk_24D1DDA80;
  a1[1] = 0;
  DigestGenerator384::DigestGenerator384((DigestGenerator384 *)(a1 + 3));
  return a1;
}

void sub_21466FA64(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  const void **v2;
  const void *v3;
  const void *v4;
  const void *v6;

  v2 = (const void **)a1[1];
  if (*a1)
  {
    v3 = *v2;
    *v2 = *a1;
    v6 = v3;
  }
  else
  {
    v4 = *v2;
    *v2 = 0;
    v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

_QWORD *std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x80uLL);
  result = std::__shared_ptr_emplace<CarrierBundle>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<CarrierBundle>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_21466FB10(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<CarrierBundle>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<CarrierBundle>,0>(_QWORD *a1, uint64_t a2)
{
  a1[2] = 0;
  *a1 = &unk_24D1DDAD0;
  a1[1] = 0;
  CarrierBundle::CarrierBundle(a1 + 3, a2);
  return a1;
}

void sub_21466FB5C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<CarrierBundle>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDAD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CarrierBundle>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDAD0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D319CLL);
}

void std::__shared_ptr_emplace<CarrierBundle>::__on_zero_shared(uint64_t a1)
{
  CarrierBundle::~CarrierBundle((CarrierBundle *)(a1 + 24));
}

_QWORD *_ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x20uLL);
  result = _ZNSt3__120__shared_ptr_emplaceI10PublicKeysNS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21466FBF8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__120__shared_ptr_emplaceI10PublicKeysNS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(_QWORD *a1)
{
  a1[2] = 0;
  *a1 = &unk_24D1DDB20;
  a1[1] = 0;
  PublicKeys::PublicKeys((PublicKeys *)(a1 + 3));
  return a1;
}

void sub_21466FC44(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<PublicKeys>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDB20;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<PublicKeys>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D1DDB20;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D319CLL);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[63] < 0)
      operator delete(*((void **)a2 + 5));
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int,std::string>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  char *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((_QWORD *)v10 + 7) = *(_QWORD *)(a3 + 24);
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_21466FEA8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_21466FFBC(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2146702CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

std::string *std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>(std::vector<std::string> *a1, std::string *a2, std::string *a3, __int128 *a4, uint64_t a5)
{
  std::string *v5;
  std::allocator<std::string> *p_end_cap;
  std::string *v10;
  std::string *value;
  std::string *v12;
  std::vector<std::string>::pointer begin;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  std::string *v19;
  uint64_t v20;
  __int128 *v21;
  std::__split_buffer<std::string> __v;

  v5 = a2;
  if (a5 >= 1)
  {
    value = a1->__end_cap_.__value_;
    p_end_cap = (std::allocator<std::string> *)&a1->__end_cap_;
    v10 = value;
    v12 = (std::string *)*((_QWORD *)p_end_cap - 1);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v12) >> 3)) >= a5)
    {
      v20 = (char *)v12 - (char *)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)a2) >> 3)) >= a5)
      {
        v21 = (__int128 *)&a3[a5];
      }
      else
      {
        v21 = (__int128 *)(&a3->__r_.__value_.__l.__data_ + (((char *)v12 - (char *)a2) >> 3));
        a1->__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, v21, a4, *((std::string **)p_end_cap - 1));
        if (v20 < 1)
          return v5;
      }
      std::vector<std::string>::__move_range(a1, v5, v12, &v5[a5]);
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::string *>,std::__wrap_iter<std::string *>,std::string *,0>(a3, (std::string *)v21, v5);
    }
    else
    {
      begin = a1->__begin_;
      v14 = a5 - 0x5555555555555555 * (((char *)v12 - (char *)a1->__begin_) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL)
        std::vector<void const*>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)begin) >> 3);
      v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)begin) >> 3);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x555555555555555)
        v18 = 0xAAAAAAAAAAAAAAALL;
      else
        v18 = v17;
      __v.__end_cap_.__value_ = p_end_cap;
      if (v18)
        v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v18);
      else
        v19 = 0;
      __v.__first_ = v19;
      __v.__begin_ = v19 + v15;
      __v.__end_ = __v.__begin_;
      __v.__end_cap_.__value_ = &v19[v18];
      std::__split_buffer<std::string>::__construct_at_end_with_size<std::__wrap_iter<std::string*>>((uint64_t)&__v, (__int128 *)a3, a5);
      v5 = std::vector<std::string>::__swap_out_circular_buffer(a1, &__v, v5);
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
  }
  return v5;
}

void sub_2146704F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__split_buffer<std::string> *a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__move_range(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, std::vector<std::string>::pointer __from_e, std::vector<std::string>::pointer __to)
{
  std::vector<std::string>::pointer end;
  char *v7;
  std::vector<std::string>::pointer v8;
  unint64_t v9;
  __int128 v10;
  char v11;

  end = this->__end_;
  v7 = (char *)__from_s + (char *)end - (char *)__to;
  v8 = end;
  if (v7 < (char *)__from_e)
  {
    v9 = (unint64_t)v7;
    v8 = this->__end_;
    do
    {
      v10 = *(_OWORD *)v9;
      v8->__r_.__value_.__r.__words[2] = *(_QWORD *)(v9 + 16);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      ++v8;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)v9 = 0;
      v9 += 24;
    }
    while (v9 < (unint64_t)__from_e);
  }
  this->__end_ = v8;
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v11, (uint64_t)__from_s, (uint64_t)v7, (uint64_t)end);
}

void std::__split_buffer<std::string>::__construct_at_end_with_size<std::__wrap_iter<std::string*>>(uint64_t a1, __int128 *a2, uint64_t a3)
{
  std::string *v4;
  std::string *v6;
  uint64_t v7;
  __int128 v8;

  v4 = *(std::string **)(a1 + 16);
  if (a3)
  {
    v6 = &v4[a3];
    v7 = 24 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
      }
      else
      {
        v8 = *a2;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v8;
      }
      ++v4;
      a2 = (__int128 *)((char *)a2 + 24);
      v7 -= 24;
    }
    while (v7);
    v4 = v6;
  }
  *(_QWORD *)(a1 + 16) = v4;
}

void sub_21467060C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

std::vector<std::string>::pointer std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v, std::vector<std::string>::pointer __p)
{
  std::string *begin;
  std::__compressed_pair<std::string *> *p_end_cap;
  std::string *v8;
  std::string *v9;
  std::string *end;
  std::string *value;

  begin = __v->__begin_;
  p_end_cap = &this->__end_cap_;
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)__p, (uint64_t)__p, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)begin, (uint64_t)begin);
  __v->__begin_ = v8;
  __v->__end_ = (std::__split_buffer<std::string>::pointer)std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, (__int128 *)__p, (__int128 *)this->__end_, (uint64_t)__v->__end_);
  v9 = this->__begin_;
  this->__begin_ = __v->__begin_;
  __v->__begin_ = v9;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_21467076C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  if (a3 != a2)
  {
    v6 = a3;
    do
    {
      v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0)
        operator delete(*(void **)v7);
      v8 = *(_OWORD *)(v6 - 24);
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(v6 - 8);
      *(_OWORD *)v7 = v8;
      *(_BYTE *)(v6 - 1) = 0;
      *(_BYTE *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

std::string *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::string *>,std::__wrap_iter<std::string *>,std::string *,0>(std::string *__str, std::string *a2, std::string *this)
{
  const std::string *v4;

  v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v10 = a4;
  v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      v5 = *a2;
      *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v4 = v5;
      v4 += 24;
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      *(_QWORD *)a2 = 0;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    while (a2 != a3);
    v10 = v4;
  }
  v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
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

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x24BDBB8A0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x24BDBC108](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

uint64_t SecKeyCreateFromPublicBytes()
{
  return MEMORY[0x24BDE8B10]();
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x24BDE8B28]();
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x24BDE8B88](key, operation, algorithm);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x24BDE8B98](key, *(_QWORD *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

uint64_t ctu::ns::AutoPool::AutoPool(ctu::ns::AutoPool *this)
{
  return MEMORY[0x24BED9B98](this);
}

void ctu::ns::AutoPool::~AutoPool(ctu::ns::AutoPool *this)
{
  MEMORY[0x24BED9BA0](this);
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x24BED9C98]();
}

std::string::const_reference std::string::at(const std::string *this, std::string::size_type __n)
{
  return (std::string::const_reference)MEMORY[0x24BEDA9A0](this, __n);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x24BEDAC10](this, __n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D1DD770(__p);
}

uint64_t operator delete()
{
  return off_24D1DD778();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D1DD780(__sz);
}

uint64_t operator new()
{
  return off_24D1DD788();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x24BDAD2B0](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x24BDADC40](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

