@implementation SiriTTSServiceAudioAnalytics

+ (void)reportAnalytics:(int64_t)a3 tailspin:(id)a4
{
  id v4;
  void **v5;
  CFIndex v6;
  void **v7;
  CFIndex v8;
  uint64_t i;
  void *v10;
  void **v11;
  void **v12;
  void **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void **v19;
  void *v20;
  void *v21;
  void **v22;
  void **v23;
  void **v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void **v30;
  void *v31;
  void **v32;
  void **v33;
  CFDictionaryRef v34;
  uint64_t j;
  const void *v36;
  const void *v37;
  void *exception;
  void *v39;
  void *v40;
  void *__p[2];
  unsigned __int8 v42;
  void *__dst[2];
  unsigned __int8 v44;
  void **values;
  void **v46;
  unint64_t v47;
  void **keys;
  void **v49;
  unint64_t v50;
  _BYTE v51[8];
  _QWORD v52[4];
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[8];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100](__dst, (void *)objc_msgSend(v4, "cStringUsingEncoding:", 4), objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4));
  std::string::basic_string[abi:ne180100](__p, (void *)objc_msgSend(CFSTR("DeviceSynthesisAction: low RTF is detected during synthesis."), "cStringUsingEncoding:", 4), objc_msgSend(CFSTR("DeviceSynthesisAction: low RTF is detected during synthesis."), "lengthOfBytesUsingEncoding:", 4));
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v51, "tailspin");
  if ((v44 & 0x80u) == 0)
    v5 = __dst;
  else
    v5 = (void **)__dst[0];
  if ((v44 & 0x80u) == 0)
    v6 = v44;
  else
    v6 = (CFIndex)__dst[1];
  v52[0] = CFStringCreateWithBytes(0, (const UInt8 *)v5, v6, 0x8000100u, 0);
  if (!v52[0])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19AED19F4](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v53, "issue_type");
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v54, "siritts");
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v55, "reason");
  if ((v42 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v42 & 0x80u) == 0)
    v8 = v42;
  else
    v8 = (CFIndex)__p[1];
  v56[0] = CFStringCreateWithBytes(0, (const UInt8 *)v7, v8, 0x8000100u, 0);
  if (!v56[0])
  {
    v39 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19AED19F4](v39, "Could not construct");
    __cxa_throw(v39, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  keys = 0;
  v49 = 0;
  v50 = 0;
  std::vector<void const*>::reserve((void **)&keys, 3uLL);
  values = 0;
  v46 = 0;
  v47 = 0;
  std::vector<void const*>::reserve((void **)&values, 3uLL);
  for (i = 0; i != 3; ++i)
  {
    v10 = *(void **)&v51[16 * i];
    v11 = v49;
    if ((unint64_t)v49 >= v50)
    {
      v13 = keys;
      v14 = v49 - keys;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61)
        std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
      v16 = v50 - (_QWORD)keys;
      if ((uint64_t)(v50 - (_QWORD)keys) >> 2 > v15)
        v15 = v16 >> 2;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
        v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v17);
      else
        v18 = 0;
      v19 = (void **)(v17 + 8 * v14);
      *v19 = v10;
      v12 = v19 + 1;
      if (v11 != v13)
      {
        do
        {
          v20 = *--v11;
          *--v19 = v20;
        }
        while (v11 != v13);
        v11 = keys;
      }
      keys = v19;
      v50 = v17 + 8 * v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *v49 = v10;
      v12 = v11 + 1;
    }
    v49 = v12;
    v21 = (void *)v52[2 * i];
    v22 = v46;
    if ((unint64_t)v46 >= v47)
    {
      v24 = values;
      v25 = v46 - values;
      v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 61)
        std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
      v27 = v47 - (_QWORD)values;
      if ((uint64_t)(v47 - (_QWORD)values) >> 2 > v26)
        v26 = v27 >> 2;
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
        v28 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v28 = v26;
      if (v28)
        v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v28);
      else
        v29 = 0;
      v30 = (void **)(v28 + 8 * v25);
      *v30 = v21;
      v23 = v30 + 1;
      if (v22 != v24)
      {
        do
        {
          v31 = *--v22;
          *--v30 = v31;
        }
        while (v22 != v24);
        v22 = values;
      }
      values = v30;
      v47 = v28 + 8 * v29;
      if (v22)
        operator delete(v22);
    }
    else
    {
      *v46 = v21;
      v23 = v22 + 1;
    }
    v46 = v23;
  }
  v32 = keys;
  v33 = values;
  v34 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v34)
  {
    v40 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19AED19F4](v40, "Could not construct");
    __cxa_throw(v40, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  if (v33)
    operator delete(v33);
  if (v32)
    operator delete(v32);
  for (j = 0; j != -6; j -= 2)
  {
    v36 = (const void *)v56[j];
    if (v36)
      CFRelease(v36);
    v37 = *(const void **)&v55[j * 8];
    if (v37)
      CFRelease(v37);
  }
  CAReportingClientSendMessage();
  CFRelease(v34);
  if ((char)v42 < 0)
    operator delete(__p[0]);
  if ((char)v44 < 0)
    operator delete(__dst[0]);

}

@end
