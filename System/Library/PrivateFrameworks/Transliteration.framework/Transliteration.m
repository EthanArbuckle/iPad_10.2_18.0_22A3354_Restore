BOOL CFStringsAreEqual(const __CFString *a1, const __CFString *a2)
{
  return CFStringCompare(a1, a2, 0) == kCFCompareEqualTo;
}

CFStringRef createCFStringFromString(uint64_t a1)
{
  const UInt8 *v1;
  CFIndex v2;

  v1 = (const UInt8 *)a1;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(_BYTE *)(a1 + 23))
      return &stru_251A54338;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v2, 0x8000100u, 0);
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    v1 = *(const UInt8 **)a1;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v2, 0x8000100u, 0);
  }
  return &stru_251A54338;
}

_QWORD *getUTF8StringFromCFString@<X0>(const __CFString *a1@<X0>, _QWORD *a2@<X8>)
{
  CFIndex Length;
  CFIndex v5;
  char *v6;

  if (a1)
  {
    Length = CFStringGetLength(a1);
    v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v6 = (char *)operator new[]();
    CFStringGetCString(a1, v6, v5, 0x8000100u);
    std::string::basic_string[abi:ne180100]<0>(a2, v6);
    JUMPOUT(0x2495AFA30);
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, "");
}

void sub_2493D2958(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495AFA30](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void getFileSystemRepresentationFromCFURL(const __CFURL *a1@<X0>, _QWORD *a2@<X8>)
{
  UInt8 *v4;

  v4 = (UInt8 *)operator new[]();
  CFURLGetFileSystemRepresentation(a1, 1u, v4, 1024);
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)v4);
  JUMPOUT(0x2495AFA30);
}

void sub_2493D29F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495AFA30](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void splitWithChar(uint64_t *a1, unsigned __int8 a2, uint64_t a3)
{
  unint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  std::string *v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  std::string *v22;
  __int128 v23;
  uint64_t v24;
  int v25;
  std::string *v26;
  unint64_t v27;
  unint64_t v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  std::string *v34;
  std::string *v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  std::string __p;
  std::string v40;
  std::__split_buffer<std::string> __v;

  std::string::basic_string[abi:ne180100]<0>(&v40, "");
  for (i = 0; ; ++i)
  {
    v7 = *((unsigned __int8 *)a1 + 23);
    if (*((char *)a1 + 23) < 0)
      break;
    v8 = *((unsigned __int8 *)a1 + 23);
    if (i >= v7)
      goto LABEL_46;
LABEL_6:
    if (v8 <= i)
      goto LABEL_65;
    if ((v7 & 0x80u) == 0)
      v9 = a1;
    else
      v9 = (uint64_t *)*a1;
    v10 = *((unsigned __int8 *)v9 + i);
    if (v10 == a2)
    {
      if (i)
      {
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&__p, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
        else
          __p = v40;
        v12 = *(_QWORD *)(a3 + 8);
        v18 = *(_QWORD *)(a3 + 16);
        if (v12 < v18)
        {
LABEL_29:
          v19 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(_QWORD *)(v12 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)v12 = v19;
          *(_QWORD *)(a3 + 8) = v12 + 24;
LABEL_41:
          if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          {
            v40.__r_.__value_.__l.__size_ = 0;
            v26 = (std::string *)v40.__r_.__value_.__r.__words[0];
          }
          else
          {
            *((_BYTE *)&v40.__r_.__value_.__s + 23) = 0;
            v26 = &v40;
          }
          v26->__r_.__value_.__s.__data_[0] = 0;
          continue;
        }
        v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - *(_QWORD *)a3) >> 3);
        v20 = v13 + 1;
        if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - *(_QWORD *)a3) >> 3);
        if (2 * v21 > v20)
          v20 = 2 * v21;
        if (v21 >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v20;
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
        if (!v16)
        {
          v17 = 0;
          goto LABEL_39;
        }
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(&__p, "");
        v12 = *(_QWORD *)(a3 + 8);
        v11 = *(_QWORD *)(a3 + 16);
        if (v12 < v11)
          goto LABEL_29;
        v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - *(_QWORD *)a3) >> 3);
        v14 = v13 + 1;
        if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - *(_QWORD *)a3) >> 3);
        if (2 * v15 > v14)
          v14 = 2 * v15;
        if (v15 >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v14;
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
        if (!v16)
        {
          v17 = 0;
LABEL_39:
          v22 = v17 + v13;
          __v.__first_ = v17;
          __v.__begin_ = v22;
          __v.__end_cap_.__value_ = &v17[v16];
          v23 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v22->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
          memset(&__p, 0, sizeof(__p));
          __v.__end_ = v22 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a3, &__v);
          v24 = *(_QWORD *)(a3 + 8);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v25 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
          *(_QWORD *)(a3 + 8) = v24;
          if (v25 < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          goto LABEL_41;
        }
      }
      v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a3 + 16, v16);
      goto LABEL_39;
    }
    if ((v7 & 0x80u) != 0)
      v7 = a1[1];
    if (v7 <= i)
LABEL_65:
      std::string::__throw_out_of_range[abi:ne180100]();
    std::string::push_back(&v40, v10);
  }
  v8 = a1[1];
  if (v8 > i)
    goto LABEL_6;
LABEL_46:
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
  else
    __p = v40;
  v28 = *(_QWORD *)(a3 + 8);
  v27 = *(_QWORD *)(a3 + 16);
  if (v28 >= v27)
  {
    v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *(_QWORD *)a3) >> 3);
    v31 = v30 + 1;
    if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *(_QWORD *)a3) >> 3);
    if (2 * v32 > v31)
      v31 = 2 * v32;
    if (v32 >= 0x555555555555555)
      v33 = 0xAAAAAAAAAAAAAAALL;
    else
      v33 = v31;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
    if (v33)
      v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a3 + 16, v33);
    else
      v34 = 0;
    v35 = v34 + v30;
    __v.__first_ = v34;
    __v.__begin_ = v35;
    __v.__end_cap_.__value_ = &v34[v33];
    v36 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v35->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
    *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
    memset(&__p, 0, sizeof(__p));
    __v.__end_ = v35 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a3, &__v);
    v37 = *(_QWORD *)(a3 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v38 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    *(_QWORD *)(a3 + 8) = v37;
    if (v38 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v28 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v28 = v29;
    *(_QWORD *)(a3 + 8) = v28 + 24;
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
}

void sub_2493D2E2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,std::__split_buffer<std::string> *a22)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFStringRef TLCreateStringWithValidatedFormat(CFStringRef validFormatSpecifiers, CFStringRef format, ...)
{
  CFStringRef StringWithValidatedFormatAndArguments;
  CFStringRef v4;
  NSObject *v5;
  CFErrorRef errorPtr[2];
  va_list va;

  va_start(va, format);
  errorPtr[0] = 0;
  va_copy((va_list)&errorPtr[1], va);
  StringWithValidatedFormatAndArguments = CFStringCreateStringWithValidatedFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, validFormatSpecifiers, format, va, errorPtr);
  if (errorPtr[0])
  {
    v4 = CFErrorCopyDescription(errorPtr[0]);
    v5 = _nlpDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      TLCreateStringWithValidatedFormat((uint64_t)format, (uint64_t)v4, v5);
    CFRelease(errorPtr[0]);
    if (v4)
      CFRelease(v4);
  }
  return StringWithValidatedFormatAndArguments;
}

void sub_2493D2F4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
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
  __cxa_throw(exception, (struct type_info *)off_251A539F8, MEMORY[0x24BEDAAF0]);
}

void sub_2493D3068(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251A53A00, MEMORY[0x24BEDAB00]);
}

void sub_2493D3128(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
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

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
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

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void sub_2493D3658(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2493D3720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2493D382C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  MEMORY[0x2495AFA48](v5, 0x1060C409BD8606FLL);

  _Unwind_Resume(a1);
}

void sub_2493D3A18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2493D3D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, int a6, __int16 a7, char a8, char a9, uint64_t a10, void *a11, uint64_t *__pa, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,std::__split_buffer<std::string> *a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;

  __pa = &a26;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  __pa = (uint64_t *)&a23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);

  _Unwind_Resume(a1);
}

void std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 80;
        std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
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

TLCompositeTransliterator *std::unique_ptr<TLCompositeTransliterator>::reset[abi:ne180100](TLCompositeTransliterator **a1, TLCompositeTransliterator *a2)
{
  TLCompositeTransliterator *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliterator::~TLCompositeTransliterator(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

void TLDevanagariOrthographyChecker::TLDevanagariOrthographyChecker(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable;
  CFMutableStringRef v5;
  CFMutableStringRef v6;
  CFMutableStringRef v7;
  CFMutableStringRef v8;
  CFMutableStringRef v9;
  CFMutableStringRef v10;
  CFMutableStringRef v11;
  CFMutableStringRef v12;
  CFMutableStringRef v13;
  const __CFCharacterSet *v14;
  __CFCharacterSet *MutableCopy;

  *(_QWORD *)this = &off_251A53D30;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 2) = CFSTR("़");
  *((_QWORD *)this + 3) = CFSTR("्");
  *((_QWORD *)this + 4) = CFSTR("ः");
  *((_QWORD *)this + 5) = CFSTR("ं");
  *((_QWORD *)this + 6) = CFSTR("ँ");
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 2));
  CFStringAppend(Mutable, *((CFStringRef *)this + 3));
  CFStringAppend(Mutable, *((CFStringRef *)this + 4));
  CFStringAppend(Mutable, *((CFStringRef *)this + 5));
  CFStringAppend(Mutable, *((CFStringRef *)this + 6));
  CFStringAppend(Mutable, CFSTR("ा"));
  CFStringAppend(Mutable, CFSTR("ि"));
  CFStringAppend(Mutable, CFSTR("ी"));
  CFStringAppend(Mutable, CFSTR("ु"));
  CFStringAppend(Mutable, CFSTR("ू"));
  CFStringAppend(Mutable, CFSTR("ृ"));
  CFStringAppend(Mutable, CFSTR("ॄ"));
  CFStringAppend(Mutable, CFSTR("ॅ"));
  CFStringAppend(Mutable, CFSTR("े"));
  CFStringAppend(Mutable, CFSTR("ै"));
  CFStringAppend(Mutable, CFSTR("ॉ"));
  CFStringAppend(Mutable, CFSTR("ो"));
  CFStringAppend(Mutable, CFSTR("ौ"));
  *((_QWORD *)this + 7) = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFRelease(Mutable);
  v5 = CFStringCreateMutable(0, 0);
  CFStringAppend(v5, CFSTR("ऋ"));
  CFStringAppend(v5, CFSTR("क"));
  CFStringAppend(v5, CFSTR("ख"));
  CFStringAppend(v5, CFSTR("ग"));
  CFStringAppend(v5, CFSTR("घ"));
  CFStringAppend(v5, CFSTR("ङ"));
  CFStringAppend(v5, CFSTR("च"));
  CFStringAppend(v5, CFSTR("छ"));
  CFStringAppend(v5, CFSTR("ज"));
  CFStringAppend(v5, CFSTR("झ"));
  CFStringAppend(v5, CFSTR("ञ"));
  CFStringAppend(v5, CFSTR("ट"));
  CFStringAppend(v5, CFSTR("ठ"));
  CFStringAppend(v5, CFSTR("ड"));
  CFStringAppend(v5, CFSTR("ढ"));
  CFStringAppend(v5, CFSTR("ण"));
  CFStringAppend(v5, CFSTR("त"));
  CFStringAppend(v5, CFSTR("थ"));
  CFStringAppend(v5, CFSTR("द"));
  CFStringAppend(v5, CFSTR("ध"));
  CFStringAppend(v5, CFSTR("न"));
  CFStringAppend(v5, CFSTR("प"));
  CFStringAppend(v5, CFSTR("फ"));
  CFStringAppend(v5, CFSTR("ब"));
  CFStringAppend(v5, CFSTR("भ"));
  CFStringAppend(v5, CFSTR("म"));
  CFStringAppend(v5, CFSTR("य"));
  CFStringAppend(v5, CFSTR("र"));
  CFStringAppend(v5, CFSTR("ल"));
  CFStringAppend(v5, CFSTR("व"));
  CFStringAppend(v5, CFSTR("श"));
  CFStringAppend(v5, CFSTR("ष"));
  CFStringAppend(v5, CFSTR("स"));
  CFStringAppend(v5, CFSTR("ह"));
  CFStringAppend(v5, CFSTR("क़"));
  CFStringAppend(v5, CFSTR("ख़"));
  CFStringAppend(v5, CFSTR("ग़"));
  CFStringAppend(v5, CFSTR("ज़"));
  CFStringAppend(v5, CFSTR("ड़"));
  CFStringAppend(v5, CFSTR("ढ़"));
  CFStringAppend(v5, CFSTR("फ़"));
  CFStringAppend(v5, CFSTR("ॹ"));
  CFStringAppend(v5, CFSTR("ॐ"));
  if (CFStringCompare(a2, CFSTR("mr"), 0) == kCFCompareEqualTo)
  {
    CFStringAppend(v5, CFSTR("ऱ"));
    CFStringAppend(v5, CFSTR("ळ"));
  }
  *((_QWORD *)this + 8) = CFCharacterSetCreateWithCharactersInString(0, v5);
  CFRelease(v5);
  v6 = CFStringCreateMutable(0, 0);
  CFStringAppend(v6, CFSTR("ङ"));
  CFStringAppend(v6, CFSTR("ञ"));
  CFStringAppend(v6, CFSTR("ण"));
  CFStringAppend(v6, CFSTR("न"));
  CFStringAppend(v6, CFSTR("म"));
  *((_QWORD *)this + 9) = CFCharacterSetCreateWithCharactersInString(0, v6);
  CFRelease(v6);
  v7 = CFStringCreateMutable(0, 0);
  CFStringAppend(v7, CFSTR("क"));
  CFStringAppend(v7, CFSTR("ख"));
  CFStringAppend(v7, CFSTR("ग"));
  CFStringAppend(v7, CFSTR("घ"));
  CFStringAppend(v7, CFSTR("ङ"));
  *((_QWORD *)this + 10) = CFCharacterSetCreateWithCharactersInString(0, v7);
  CFRelease(v7);
  v8 = CFStringCreateMutable(0, 0);
  CFStringAppend(v8, CFSTR("च"));
  CFStringAppend(v8, CFSTR("छ"));
  CFStringAppend(v8, CFSTR("ज"));
  CFStringAppend(v8, CFSTR("झ"));
  CFStringAppend(v8, CFSTR("ञ"));
  *((_QWORD *)this + 11) = CFCharacterSetCreateWithCharactersInString(0, v8);
  CFRelease(v8);
  v9 = CFStringCreateMutable(0, 0);
  CFStringAppend(v9, CFSTR("ट"));
  CFStringAppend(v9, CFSTR("ठ"));
  CFStringAppend(v9, CFSTR("ड"));
  CFStringAppend(v9, CFSTR("ढ"));
  CFStringAppend(v9, CFSTR("ण"));
  *((_QWORD *)this + 12) = CFCharacterSetCreateWithCharactersInString(0, v9);
  CFRelease(v9);
  v10 = CFStringCreateMutable(0, 0);
  CFStringAppend(v10, CFSTR("ट"));
  CFStringAppend(v10, CFSTR("ठ"));
  CFStringAppend(v10, CFSTR("ड"));
  CFStringAppend(v10, CFSTR("ढ"));
  CFStringAppend(v10, CFSTR("ण"));
  CFStringAppend(v10, CFSTR("य"));
  CFStringAppend(v10, CFSTR("व"));
  CFStringAppend(v10, CFSTR("श"));
  CFStringAppend(v10, CFSTR("ष"));
  CFStringAppend(v10, CFSTR("स"));
  CFStringAppend(v10, CFSTR("ह"));
  *((_QWORD *)this + 13) = CFCharacterSetCreateWithCharactersInString(0, v10);
  CFRelease(v10);
  v11 = CFStringCreateMutable(0, 0);
  CFStringAppend(v11, CFSTR("क़"));
  CFStringAppend(v11, CFSTR("ख़"));
  CFStringAppend(v11, CFSTR("ग़"));
  CFStringAppend(v11, CFSTR("ज़"));
  CFStringAppend(v11, CFSTR("ड़"));
  CFStringAppend(v11, CFSTR("ढ़"));
  CFStringAppend(v11, CFSTR("फ़"));
  CFStringAppend(v11, CFSTR("ॹ"));
  *((_QWORD *)this + 14) = CFCharacterSetCreateWithCharactersInString(0, v11);
  CFRelease(v11);
  v12 = CFStringCreateMutable(0, 0);
  CFStringAppend(v12, CFSTR("अ"));
  CFStringAppend(v12, CFSTR("आ"));
  CFStringAppend(v12, CFSTR("इ"));
  CFStringAppend(v12, CFSTR("ई"));
  CFStringAppend(v12, CFSTR("उ"));
  CFStringAppend(v12, CFSTR("ऊ"));
  CFStringAppend(v12, CFSTR("ऋ"));
  CFStringAppend(v12, CFSTR("ऍ"));
  CFStringAppend(v12, CFSTR("ए"));
  CFStringAppend(v12, CFSTR("ऐ"));
  CFStringAppend(v12, CFSTR("ऑ"));
  CFStringAppend(v12, CFSTR("ओ"));
  CFStringAppend(v12, CFSTR("औ"));
  *((_QWORD *)this + 15) = CFCharacterSetCreateWithCharactersInString(0, v12);
  CFRelease(v12);
  v13 = CFStringCreateMutable(0, 0);
  CFStringAppend(v13, CFSTR("०"));
  CFStringAppend(v13, CFSTR("१"));
  CFStringAppend(v13, CFSTR("२"));
  CFStringAppend(v13, CFSTR("३"));
  CFStringAppend(v13, CFSTR("४"));
  CFStringAppend(v13, CFSTR("५"));
  CFStringAppend(v13, CFSTR("६"));
  CFStringAppend(v13, CFSTR("७"));
  CFStringAppend(v13, CFSTR("८"));
  CFStringAppend(v13, CFSTR("९"));
  CFStringAppend(v13, CFSTR("‍"));
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  CFRelease(v13);
  MutableCopy = CFCharacterSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *((CFCharacterSetRef *)this + 15));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 8));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 7));
  CFCharacterSetUnion(MutableCopy, v14);
  CFRelease(v14);
  *((_QWORD *)this + 16) = CFCharacterSetCreateInvertedSet(0, MutableCopy);
  CFRelease(MutableCopy);
}

void TLDevanagariOrthographyChecker::~TLDevanagariOrthographyChecker(CFTypeRef *this)
{
  *this = &off_251A53D30;
  CFRelease(this[7]);
  CFRelease(this[8]);
  CFRelease(this[9]);
  CFRelease(this[10]);
  CFRelease(this[11]);
  CFRelease(this[12]);
  CFRelease(this[13]);
  CFRelease(this[14]);
  CFRelease(this[15]);
  CFRelease(this[16]);
}

{
  TLDevanagariOrthographyChecker::~TLDevanagariOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLDevanagariOrthographyChecker::isVowelSign(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable;
  const __CFCharacterSet *v4;
  const __CFCharacterSet *InvertedSet;
  _BOOL8 v6;
  CFRange v8;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("ऽ"));
  CFStringAppend(Mutable, CFSTR("ा"));
  CFStringAppend(Mutable, CFSTR("ि"));
  CFStringAppend(Mutable, CFSTR("ी"));
  CFStringAppend(Mutable, CFSTR("ु"));
  CFStringAppend(Mutable, CFSTR("ू"));
  CFStringAppend(Mutable, CFSTR("ृ"));
  CFStringAppend(Mutable, CFSTR("ॄ"));
  CFStringAppend(Mutable, CFSTR("ॅ"));
  CFStringAppend(Mutable, CFSTR("े"));
  CFStringAppend(Mutable, CFSTR("ै"));
  CFStringAppend(Mutable, CFSTR("ॉ"));
  CFStringAppend(Mutable, CFSTR("ो"));
  CFStringAppend(Mutable, CFSTR("ौ"));
  v4 = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  CFRelease(Mutable);
  CFRelease(v4);
  v8.length = CFStringGetLength(a2);
  v8.location = 0;
  v6 = CFStringFindCharacterFromSet(a2, InvertedSet, v8, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v6;
}

BOOL TLDevanagariOrthographyChecker::canCandrabinduFollowVowelSign(TLDevanagariOrthographyChecker *this, CFStringRef theString1)
{
  return CFStringCompare(theString1, CFSTR("ा"), 0) == kCFCompareEqualTo
      || CFStringCompare(theString1, CFSTR("ु"), 0) == kCFCompareEqualTo
      || CFStringCompare(theString1, CFSTR("ू"), 0) == kCFCompareEqualTo;
}

BOOL TLDevanagariOrthographyChecker::canNuktaFollowLetter(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  const __CFCharacterSet *v3;
  const __CFCharacterSet *InvertedSet;
  _BOOL8 v5;
  CFRange v7;

  v3 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("कखगजडढफ"));
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v3);
  CFRelease(CFSTR("कखगजडढफ"));
  CFRelease(v3);
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  v5 = CFStringFindCharacterFromSet(a2, InvertedSet, v7, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v5;
}

BOOL TLDevanagariOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  if (CFStringCompare(theString1, this[2], 0) == kCFCompareEqualTo)
    return 1;
  v4 = (const __CFCharacterSet *)this[8];
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLDevanagariOrthographyChecker::canViramaPrecedeLetter(TLDevanagariOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  v4 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFStringCompare(theString, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo;
}

BOOL TLDevanagariOrthographyChecker::canZWJFollowSequence(TLDevanagariOrthographyChecker *this, CFStringRef theString)
{
  return CFStringHasSuffix(theString, CFSTR("र्")) != 0;
}

CFMutableStringRef TLDevanagariOrthographyChecker::stringByCorrectingIllegalVowelLetters(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  CFIndex Length;
  CFMutableStringRef MutableCopy;
  uint64_t *v5;
  const __CFString *v6;
  CFRange v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  const __CFString *v12;
  uint64_t *v13;
  _QWORD *v14[2];
  const __CFString **v15;

  v14[0] = 0;
  v14[1] = 0;
  v12 = CFSTR("अा");
  v13 = (uint64_t *)v14;
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("आ");
  v12 = CFSTR("अो");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ओ");
  v12 = CFSTR("अाे");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ओ");
  v12 = CFSTR("आे");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ओ");
  v12 = CFSTR("अौ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("औ");
  v12 = CFSTR("अाै");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("औ");
  v12 = CFSTR("आै");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("औ");
  v12 = CFSTR("एॅ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ऍ");
  v12 = CFSTR("अॉ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ऑ");
  v12 = CFSTR("अाॅ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ऑ");
  v12 = CFSTR("आॅ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ऑ");
  v12 = CFSTR("अॅ");
  v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)CFSTR("ॲ");
  Length = CFStringGetLength(a2);
  MutableCopy = CFStringCreateMutableCopy(0, Length, a2);
  v5 = v13;
  if (v13 != (uint64_t *)v14)
  {
    do
    {
      v6 = (const __CFString *)v5[5];
      v7 = CFStringFind(MutableCopy, (CFStringRef)v5[4], 0);
      if (v7.length >= 1)
        CFStringReplace(MutableCopy, v7, v6);
      v8 = (uint64_t *)v5[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (uint64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (uint64_t *)v5[2];
          v10 = *v9 == (_QWORD)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != (uint64_t *)v14);
  }
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy((uint64_t)&v13, v14[0]);
  return MutableCopy;
}

void sub_2493D515C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

BOOL TLDevanagariOrthographyChecker::checkSpelling(TLDevanagariOrthographyChecker *this, CFStringRef theString, __CFString **a3, const __CFString **a4)
{
  CFIndex Length;
  CFIndex v9;
  CFIndex location;
  CFStringRef v11;
  CFStringRef v12;
  const __CFString *v13;
  const __CFString *v14;
  CFRange v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  CFRange v19;
  CFStringRef v20;
  CFStringRef v21;
  char v22;
  const __CFArray *Mutable;
  _BOOL8 v24;
  CFStringRef v25;
  CFIndex v26;
  char v27;
  int CharacterAtIndex;
  UniChar v29;
  BOOL v30;
  const __CFCharacterSet *v31;
  CFNumberRef v32;
  CFNumberRef v33;
  const __CFString *v34;
  const __CFString **v35;
  CFDictionaryRef v36;
  CFDictionaryRef v37;
  CFStringRef v38;
  CFIndex Count;
  unint64_t v40;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *Value;
  const __CFNumber *v43;
  const __CFString *v44;
  CFRange v45;
  const __CFCharacterSet *Copy;
  const __CFCharacterSet *v47;
  const __CFCharacterSet *v48;
  CFIndex v49;
  const __CFString *v50;
  const __CFString **v51;
  UniChar v52;
  TLDevanagariOrthographyChecker *IsCharacterMember;
  int v54;
  const __CFString *v55;
  CFIndex v56;
  CFMutableStringRef MutableCopy;
  CFRange v58;
  CFComparisonResult v59;
  CFComparisonResult v60;
  const __CFString *v62;
  const __CFString *v63;
  int HasSuffix;
  int CharacterFromSet;
  CFStringRef v66;
  CFIndex v67;
  CFMutableStringRef v68;
  CFRange v69;
  char v70;
  const __CFString *v71;
  const __CFString **v72;
  __CFString *theStringa;
  __CFArray *theArray;
  CFIndex valuePtr;
  uint64_t v76;
  CFRange range;
  void *values[3];
  CFRange result;
  const __CFString *v80;
  uint64_t v81;
  CFRange v82;
  CFRange v83;
  CFRange v84;
  CFRange v85;
  CFRange v86;
  CFRange v87;
  CFRange v88;
  CFRange v89;
  CFRange v90;
  CFRange v91;
  CFRange v92;
  CFRange v93;
  CFRange v94;
  CFRange v95;

  v81 = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v82.location = 0;
  v82.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v82, 0, &result))
  {
    v9 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!result.location)
        goto LABEL_51;
      if (location != 0x7FFFFFFFFFFFFFFFLL && result.location == v9 + location)
      {
        v83.location = location;
        v83.length = v9;
        v11 = CFStringCreateWithSubstring(0, theString, v83);
        v12 = CFStringCreateWithSubstring(0, theString, result);
        if ((CFStringCompare(v11, *((CFStringRef *)this + 2), 0)
           || CFStringCompare(v12, *((CFStringRef *)this + 2), 0) == kCFCompareEqualTo)
          && (CFStringCompare(v12, *((CFStringRef *)this + 5), 0)
           || !TLDevanagariOrthographyChecker::isVowelSign(0, v11))
          && (CFStringCompare(v12, *((CFStringRef *)this + 6), 0)
           || !TLDevanagariOrthographyChecker::canCandrabinduFollowVowelSign(0, v11))
          && (CFStringCompare(v12, *((CFStringRef *)this + 4), 0)
           || !TLDevanagariOrthographyChecker::isVowelSign(0, v11)))
        {
          if (v11)
            CFRelease(v11);
          if (v12)
            CFRelease(v12);
LABEL_51:
          v24 = 0;
          v25 = CFSTR("illegal diacritic placement");
          goto LABEL_131;
        }
        if (v11)
          CFRelease(v11);
        if (v12)
          CFRelease(v12);
      }
      location = result.location;
      v9 = result.length;
      v84.location = result.length + result.location;
      v84.length = Length - (result.length + result.location);
    }
    while (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v84, 0, &result));
  }
  result = (CFRange)xmmword_2493E9370;
  v13 = (const __CFString *)*((_QWORD *)this + 2);
  v14 = theString;
  v15.location = 0;
  v15.length = Length;
  while (CFStringFindWithOptions(v14, v13, v15, 0, &result))
  {
    if (!result.location)
      goto LABEL_46;
    v85.location = result.location - 1;
    v85.length = 1;
    v16 = (__CFString *)CFStringCreateWithSubstring(0, theString, v85);
    if (!TLDevanagariOrthographyChecker::canNuktaFollowLetter((TLDevanagariOrthographyChecker *)v16, v16))
    {
      if (v16)
        CFRelease(v16);
LABEL_46:
      v24 = 0;
      v25 = CFSTR("illegal nukta placement");
      goto LABEL_131;
    }
    if (v16)
      CFRelease(v16);
    v15.location = result.length + result.location;
    v15.length = Length - (result.length + result.location);
    v13 = (const __CFString *)*((_QWORD *)this + 2);
    v14 = theString;
  }
  result = (CFRange)xmmword_2493E9370;
  v17 = (const __CFString *)*((_QWORD *)this + 3);
  v18 = theString;
  v19.location = 0;
  v19.length = Length;
  while (CFStringFindWithOptions(v18, v17, v19, 0, &result))
  {
    if (!result.location)
      goto LABEL_56;
    v86.location = result.location - 1;
    v86.length = 1;
    v20 = CFStringCreateWithSubstring(0, theString, v86);
    if (result.location + 1 >= Length)
    {
      v21 = 0;
      if (!TLDevanagariOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v20))
      {
LABEL_52:
        if (v20)
          CFRelease(v20);
        if (v21)
          CFRelease(v21);
LABEL_56:
        v24 = 0;
        v25 = CFSTR("illegal virama placement");
        goto LABEL_131;
      }
LABEL_37:
      v22 = 1;
      if (!v20)
        goto LABEL_39;
LABEL_38:
      CFRelease(v20);
      goto LABEL_39;
    }
    v87.length = 1;
    v87.location = result.location + 1;
    v21 = CFStringCreateWithSubstring(0, theString, v87);
    if (!TLDevanagariOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v20))
      goto LABEL_52;
    if (!v21)
      goto LABEL_37;
    if (!TLDevanagariOrthographyChecker::canViramaPrecedeLetter(this, v21))
      goto LABEL_52;
    v22 = 0;
    if (v20)
      goto LABEL_38;
LABEL_39:
    if ((v22 & 1) == 0)
      CFRelease(v21);
    v19.location = result.length + result.location;
    v19.length = Length - (result.length + result.location);
    v17 = (const __CFString *)*((_QWORD *)this + 3);
    v18 = theString;
  }
  if (a3)
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  else
    Mutable = 0;
  v26 = CFStringGetLength(theString);
  v88.location = 0;
  v88.length = v26;
  v72 = (const __CFString **)a3;
  theArray = Mutable;
  v25 = 0;
  if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v88, 0, &range))
  {
    if (!Mutable)
      goto LABEL_110;
    v27 = 1;
LABEL_100:
    if (CFArrayGetCount(Mutable) >= 1)
    {
      v70 = v27;
      v71 = v25;
      theStringa = CFStringCreateMutableCopy(0, 0, theString);
      Count = CFArrayGetCount(Mutable);
      if (Count >= 1)
      {
        v40 = Count + 1;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v40 - 2);
          Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("range.location"));
          v43 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("range.length"));
          result = (CFRange)xmmword_2493E9360;
          CFNumberGetValue(Value, kCFNumberCFIndexType, &result);
          CFNumberGetValue(v43, kCFNumberCFIndexType, &result.length);
          v44 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("replacement"));
          v45.location = result.location;
          if (result.location != -1)
          {
            v45.length = result.length;
            if (result.length >= 1)
            {
              if (v44)
                CFStringReplace(theStringa, v45, v44);
            }
          }
          --v40;
          Mutable = theArray;
        }
        while (v40 > 1);
      }
      *a3 = theStringa;
      v25 = v71;
      v27 = v70;
    }
    CFRelease(Mutable);
    if ((v27 & 1) != 0)
      goto LABEL_110;
LABEL_130:
    v24 = 0;
    goto LABEL_131;
  }
  v27 = 1;
  while (2)
  {
    if (range.location + 2 >= v26 || CFStringGetCharacterAtIndex(theString, range.location + 1) != 2381)
      goto LABEL_93;
    CharacterAtIndex = CFStringGetCharacterAtIndex(theString, range.location);
    v29 = CFStringGetCharacterAtIndex(theString, range.location + 2);
    if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 14), v29))
      v30 = 1;
    else
      v30 = range.location + 3 < v26 && CFStringGetCharacterAtIndex(theString, range.location + 3) == 2364;
    if (CharacterAtIndex > 2338)
    {
      if (CharacterAtIndex != 2339)
      {
        if (CharacterAtIndex == 2344
          && (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 10), v29)
           || CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 11), v29)
           || CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 12), v29))
          && (range.location < 1 || CFStringGetCharacterAtIndex(theString, range.location) != 2381))
        {
          if (Mutable)
          {
            result = (CFRange)xmmword_251A53D48;
            v80 = CFSTR("replacement");
            valuePtr = range.location;
            v76 = 2;
            v32 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
            v33 = CFNumberCreate(0, kCFNumberCFIndexType, &v76);
            values[0] = v32;
            values[1] = v33;
            values[2] = CFSTR("ं");
            v34 = v25;
            v35 = a4;
            v36 = CFDictionaryCreate(0, (const void **)&result, (const void **)values, 3, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
            CFRelease(v32);
            CFRelease(v33);
            CFArrayAppendValue(theArray, v36);
            v37 = v36;
            a4 = v35;
            v25 = v34;
            Mutable = theArray;
            CFRelease(v37);
          }
          goto LABEL_89;
        }
        goto LABEL_79;
      }
      if (v30)
        goto LABEL_89;
      v31 = (const __CFCharacterSet *)*((_QWORD *)this + 13);
LABEL_85:
      if (((CFCharacterSetIsCharacterMember(v31, v29) != 0) & v27) == 0)
        goto LABEL_89;
LABEL_86:
      v27 = 1;
      goto LABEL_93;
    }
    if (CharacterAtIndex == 2329)
    {
      if (v30)
        goto LABEL_89;
      v31 = (const __CFCharacterSet *)*((_QWORD *)this + 10);
      goto LABEL_85;
    }
    if (CharacterAtIndex != 2334)
    {
LABEL_79:
      if ((v27 & 1) == 0)
        goto LABEL_89;
      goto LABEL_86;
    }
    if (!v30)
    {
      v31 = (const __CFCharacterSet *)*((_QWORD *)this + 11);
      goto LABEL_85;
    }
LABEL_89:
    if (!v25)
    {
      v89.location = range.location;
      v89.length = 3;
      v38 = CFStringCreateWithSubstring(0, theString, v89);
      v25 = CFStringCreateWithFormat(0, 0, CFSTR("invalid nasal combination '%@'"), v38);
      CFRelease(v38);
    }
    if (!Mutable)
      goto LABEL_130;
    v27 = 0;
LABEL_93:
    if (v26 > range.location + 1)
    {
      v90.location = range.location + 1;
      v90.length = v26 - (range.location + 1);
      if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v90, 0, &range))
        continue;
    }
    break;
  }
  if (Mutable)
    goto LABEL_100;
  if ((v27 & 1) == 0)
    goto LABEL_130;
LABEL_110:
  Copy = CFCharacterSetCreateCopy(0, *((CFCharacterSetRef *)this + 15));
  v47 = CFCharacterSetCreateCopy(0, *((CFCharacterSetRef *)this + 7));
  v48 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ँं"));
  v49 = CFStringGetLength(theString);
  v91.location = 0;
  v91.length = v49;
  if (CFStringFindCharacterFromSet(theString, Copy, v91, 0, &result))
  {
    v50 = v25;
    v51 = a4;
    while (1)
    {
      if (result.location + 1 < v49)
      {
        v52 = CFStringGetCharacterAtIndex(theString, result.location + 1);
        if (CFCharacterSetIsCharacterMember(v47, v52))
        {
          IsCharacterMember = (TLDevanagariOrthographyChecker *)CFCharacterSetIsCharacterMember(v48, v52);
          if (!(_DWORD)IsCharacterMember)
            break;
        }
      }
      v92.location = result.length + result.location;
      v92.length = v49 - (result.length + result.location);
      if (!CFStringFindCharacterFromSet(theString, Copy, v92, 0, &result))
      {
        v54 = 1;
        a4 = v51;
        v25 = v50;
        goto LABEL_121;
      }
    }
    v54 = 0;
    if (v72)
      *v72 = TLDevanagariOrthographyChecker::stringByCorrectingIllegalVowelLetters(IsCharacterMember, theString);
    a4 = v51;
    v25 = CFSTR("illegal diacritic after vowel letter");
  }
  else
  {
    v54 = 1;
  }
LABEL_121:
  CFRelease(Copy);
  CFRelease(v47);
  CFRelease(v48);
  if (!v54)
    goto LABEL_130;
  v55 = v25;
  v56 = CFStringGetLength(theString);
  MutableCopy = CFStringCreateMutableCopy(0, v56, theString);
  v58 = CFStringFind(MutableCopy, CFSTR("‌"), 0);
  if (v58.length >= 1)
    CFStringReplace(MutableCopy, v58, &stru_251A54338);
  v59 = CFStringCompare(MutableCopy, theString, 0);
  v60 = v59;
  if (v72 && v59)
    *v72 = MutableCopy;
  if (!MutableCopy)
  {
    if (v59 == kCFCompareEqualTo)
      goto LABEL_139;
LABEL_129:
    v24 = 0;
    v25 = CFSTR("invalid: ZWNJ present");
    goto LABEL_131;
  }
  CFRelease(MutableCopy);
  if (v60)
    goto LABEL_129;
LABEL_139:
  v62 = (const __CFString *)*((_QWORD *)this + 1);
  v93.length = CFStringGetLength(theString);
  v93.location = 0;
  if (!CFStringFindWithOptions(theString, v62, v93, 0, &result))
  {
LABEL_146:
    v25 = v55;
    v95.length = CFStringGetLength(theString);
    v95.location = 0;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 16), v95, 0, &result);
    v24 = CharacterFromSet == 0;
    if (CharacterFromSet)
    {
      v66 = CFStringCreateWithSubstring(0, theString, result);
      v25 = CFStringCreateWithFormat(0, 0, CFSTR("invalid letter '%@'"), v66);
      CFRelease(v66);
    }
    goto LABEL_131;
  }
  if (!result.location)
  {
    if (!v72)
    {
      v24 = 0;
      v25 = CFSTR("invalid sequence with ZWJ");
      goto LABEL_131;
    }
    v55 = CFSTR("invalid sequence with ZWJ");
LABEL_150:
    v67 = CFStringGetLength(theString);
    v68 = CFStringCreateMutableCopy(0, v67, theString);
    v69 = CFStringFind(v68, (CFStringRef)*((_QWORD *)this + 1), 0);
    if (v69.length >= 1)
      CFStringReplace(v68, v69, &stru_251A54338);
    v24 = 0;
    *v72 = v68;
    goto LABEL_153;
  }
  v94.length = result.location - 1;
  v94.location = 0;
  v63 = CFStringCreateWithSubstring(0, theString, v94);
  HasSuffix = CFStringHasSuffix(v63, CFSTR("र्"));
  if (!HasSuffix)
    v55 = CFSTR("invalid sequence with ZWJ");
  CFRelease(v63);
  if (v72 && !HasSuffix)
    goto LABEL_150;
  if (HasSuffix)
    goto LABEL_146;
  v24 = 0;
LABEL_153:
  v25 = v55;
LABEL_131:
  if (!a4 || v24)
  {
    if (!a4 && v25)
      CFRelease(v25);
  }
  else
  {
    *a4 = v25;
  }
  return v24;
}

void std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void TLLanguageModelStr::TLLanguageModelStr(TLLanguageModelStr *this)
{
  language_modeling::v1::LanguageModel *v2;

  *(_QWORD *)this = &off_251A53D98;
  v2 = (language_modeling::v1::LanguageModel *)operator new();
  *((_QWORD *)this + 1) = language_modeling::v1::LanguageModel::LanguageModel(v2);
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
}

BOOL TLLanguageModelStr::load(TLLanguageModelStr *this, std::string *a2)
{
  _OWORD *v4;
  std::string::size_type size;
  _OWORD *v6;
  _OWORD *v7;
  _OWORD *v8;
  _OWORD *v9;
  int v10;
  language_modeling::v1::LanguageModelSession *v11;
  language_modeling::v1::LanguageModelSession *v12;
  uint64_t v13;
  void *__p[2];
  char v16;
  char v17;
  _OWORD *v18[3];
  char v19;
  char v20;
  uint64_t *v21;
  _QWORD *v22[2];

  std::string::operator=((std::string *)this + 1, a2);
  v22[0] = 0;
  v22[1] = 0;
  v21 = (uint64_t *)v22;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x24BE5ED68]);
  v18[0] = __p;
  v4 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>((uint64_t)v4 + 56, (std::string *)((char *)v4 + 56), a2);
  if (v16 < 0)
    operator delete(__p[0]);
  size = HIBYTE(a2[1].__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a2[1].__r_.__value_.__l.__size_;
  if (size)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x24BE5ED80]);
    v18[0] = __p;
    v6 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>((uint64_t)v6 + 56, (std::string *)((char *)v6 + 56), a2 + 1);
  }
  else
  {
    v20 = 1;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x24BE5ED70]);
    v18[0] = __p;
    v7 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
    std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>((uint64_t)v7 + 56, &v20);
  }
  if (v16 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x24BE5ED90]);
  v18[0] = __p;
  v8 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v8 + 56, (std::string *)((char *)v8 + 56), MEMORY[0x24BE5ED58]);
  if (v16 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x24BE5ED88]);
  v18[0] = __p;
  v9 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v9 + 56, (std::string *)((char *)v9 + 56), MEMORY[0x24BE5ED58]);
  if (v16 < 0)
    operator delete(__p[0]);
  LOBYTE(__p[0]) = 0;
  v17 = 0;
  language_modeling::v1::LanguageModel::init();
  std::__optional_destruct_base<LM::TrialParameters,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)__p);
  v10 = (int)v18[0];
  if (!LODWORD(v18[0]))
  {
    language_modeling::v1::LanguageModel::makeDefaultSession(*((language_modeling::v1::LanguageModel **)this + 1));
    v11 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)this + 2, v11);
    v12 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    if (v12)
    {
      language_modeling::v1::LanguageModelSession::~LanguageModelSession(v12);
      MEMORY[0x2495AFA48](v13);
    }
    language_modeling::v1::LanguageModel::wireMemory(*((language_modeling::v1::LanguageModel **)this + 1));
  }
  if (v19 < 0)
    operator delete(v18[1]);
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy((uint64_t)&v21, v22[0]);
  return v10 == 0;
}

void sub_2493D62B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(v14 - 64, *(_QWORD **)(v14 - 56));
  _Unwind_Resume(a1);
}

uint64_t std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>(uint64_t a1, _BYTE *a2)
{
  if (*(_DWORD *)(a1 + 24))
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(a1, a2);
  else
    *(_BYTE *)a1 = *a2;
  return a1;
}

void TLLanguageModelStr::~TLLanguageModelStr(TLLanguageModelStr *this)
{
  language_modeling::v1::LanguageModelSession **v2;

  *(_QWORD *)this = &off_251A53D98;
  v2 = (language_modeling::v1::LanguageModelSession **)((char *)this + 16);
  if (*((_QWORD *)this + 2))
    language_modeling::v1::LanguageModel::unwireMemory(*((language_modeling::v1::LanguageModel **)this + 1));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](v2, 0);
  std::unique_ptr<language_modeling::v1::LanguageModel>::reset[abi:ne180100]((language_modeling::v1::LanguageModel **)this + 1, 0);
}

{
  TLLanguageModelStr::~TLLanguageModelStr(this);
  JUMPOUT(0x2495AFA48);
}

double TLLanguageModelStr::logProbability(uint64_t a1, uint64_t a2, __int128 **a3)
{
  uint64_t v5;
  int v6;
  _WORD *v7;
  __int128 *v8;
  __int128 *v9;
  __int128 v10;
  double v11;
  double v12;
  uint64_t v14;
  _BYTE v15[8];
  std::string v16;
  int v17;

  v5 = *(unsigned __int8 *)(a1 + 47);
  v6 = (char)v5;
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 32);
  if (v5 != 2 || (v6 >= 0 ? (v7 = (_WORD *)(a1 + 24)) : (v7 = *(_WORD **)(a1 + 24)), *v7 != 29301))
  {
    if (!language_modeling::v1::LanguageModelSession::supportsFragmentsBasedConditionalProbability(*(language_modeling::v1::LanguageModelSession **)(a1 + 16)))
      return -15.6535598;
  }
  if (!language_modeling::v1::LanguageModelSession::canReasonAbout())
    return -15.6535598;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v15);
  v9 = *a3;
  v8 = a3[1];
  while (v9 != v8)
  {
    if (*((char *)v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
    }
    else
    {
      v10 = *v9;
      v16.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
      *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
    }
    v17 = 0;
    MEMORY[0x2495AF874](v15, &v16);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v16.__r_.__value_.__l.__data_);
    v9 = (__int128 *)((char *)v9 + 24);
  }
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v16 = *(std::string *)a2;
  v17 = 0;
  language_modeling::v1::LanguageModelSession::detailedConditionalProbability();
  language_modeling::v1::Probability::probability();
  v11 = v12;
  language_modeling::v1::Probability::~Probability((language_modeling::v1::Probability *)&v14);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v15);
  return v11;
}

void sub_2493D6550(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<LM::TrialParameters,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

language_modeling::v1::LanguageModel *std::unique_ptr<language_modeling::v1::LanguageModel>::reset[abi:ne180100](language_modeling::v1::LanguageModel **a1, language_modeling::v1::LanguageModel *a2)
{
  language_modeling::v1::LanguageModel *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModel::~LanguageModel(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

language_modeling::v1::LanguageModelSession *std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](language_modeling::v1::LanguageModelSession **a1, language_modeling::v1::LanguageModelSession *a2)
{
  language_modeling::v1::LanguageModelSession *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModelSession::~LanguageModelSession(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

void std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_251A53DD8[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSF_1EJbSD_EEEEEEDcSH_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((_BYTE *)v7 + 56) = 0;
    *((_DWORD *)v7 + 20) = 0;
    v13 = 1;
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(uint64_t a1, std::string *this, std::string *__str)
{
  uint64_t v3[2];

  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::operator=(this, __str);
  }
  else
  {
    v3[0] = a1;
    v3[1] = (uint64_t)__str;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(std::__variant_detail::__alt<1ul,std::string> &,std::string const&)::{unnamed type#1}::operator()[abi:ne180100](v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(std::__variant_detail::__alt<1ul,std::string> &,std::string const&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  std::string __p;

  v2 = *a1;
  v1 = a1[1];
  if (*(char *)(v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *(_QWORD *)(v1 + 8));
  }
  else
  {
    v3 = *(_OWORD *)v1;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v1 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v3;
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v2, (__int128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2493D6A38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))off_251A53DD8[v4])(&v7, a1);
  *(_DWORD *)(a1 + 24) = -1;
  v5 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  char v6;

  v4 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))off_251A53DD8[v4])(&v6, a1);
  *(_BYTE *)a1 = *a2;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  _QWORD v3[2];

  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::__assign_external(this, *a3);
  }
  else
  {
    v3[0] = a1;
    v3[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  void *__p[2];
  char v3;

  v1 = *(_QWORD *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (__int128 *)__p);
  if (v3 < 0)
    operator delete(__p[0]);
}

void sub_2493D6BC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

_QWORD *TL::SharedCFType::Wrapper::Wrapper(_QWORD *this, const void *a2)
{
  *this = a2;
  return this;
}

void TL::SharedCFType::Wrapper::~Wrapper(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t TL::SharedCFType::Wrapper::get(TL::SharedCFType::Wrapper *this)
{
  return *(_QWORD *)this;
}

_QWORD *TL::SharedCFType::SharedCFType(TL::SharedCFType *this, const void *a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)operator new();
  *v4 = a2;
  return std::shared_ptr<TL::SharedCFType::Wrapper>::shared_ptr[abi:ne180100]<TL::SharedCFType::Wrapper,void>(this, (uint64_t)v4);
}

_QWORD *TL::SharedCFType::SharedCFType(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t TL::SharedCFType::get(TL::SharedCFType *this)
{
  return **(_QWORD **)this;
}

_QWORD *std::shared_ptr<TL::SharedCFType::Wrapper>::shared_ptr[abi:ne180100]<TL::SharedCFType::Wrapper,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_251A53DF8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2493D6EA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<TL::SharedCFType::Wrapper>::reset[abi:ne180100]((const void ***)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2495AFA48);
}

const void **std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::__on_zero_shared(uint64_t a1)
{
  const void **result;

  result = *(const void ***)(a1 + 24);
  if (result)
  {
    TL::SharedCFType::Wrapper::~Wrapper(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

const void **std::unique_ptr<TL::SharedCFType::Wrapper>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  const void **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::SharedCFType::Wrapper::~Wrapper(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

void TLCompositeTransliteratorException::TLCompositeTransliteratorException(TLCompositeTransliteratorException *this, const __CFLocale *a2, const __CFURL *a3)
{
  uint64_t **ExceptionList;

  *(_QWORD *)this = 0;
  ExceptionList = TLCompositeTransliteratorException::loadExceptionList(this, a2, a3);
  std::unique_ptr<TL::StringMap>::reset[abi:ne180100]((TL::StringMap **)this, (TL::StringMap *)ExceptionList);
}

void sub_2493D7014(_Unwind_Exception *a1)
{
  TL::StringMap **v1;

  std::unique_ptr<TL::StringMap>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

TL::StringMap *std::unique_ptr<TL::StringMap>::reset[abi:ne180100](TL::StringMap **a1, TL::StringMap *a2)
{
  TL::StringMap *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::StringMap::~StringMap(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

uint64_t **TLCompositeTransliteratorException::loadExceptionList(TLCompositeTransliteratorException *this, CFLocaleRef locale, const __CFURL *a3)
{
  const __CFString *Value;
  const __CFAllocator *v6;
  __CFString *Mutable;
  __CFString *v8;
  const __CFString *v9;
  uint64_t **v10;
  CFTypeRef v11;
  NSObject *v12;
  CFTypeRef v13;
  NSObject *v14;
  std::string *p_p;
  std::string *v17;
  std::string v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, CFURLRef, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v22;
  uint64_t *v23;
  std::string __p;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  void *v30;
  CFTypeRef cf;
  _BYTE buf[12];
  char v33;
  uint8_t v34[4];
  std::string *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3812000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = &unk_2493ECF5D;
  cf = 0;
  if (a3)
  {
    Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v8 = Mutable;
    v18.__r_.__value_.__r.__words[0] = (std::string::size_type)Mutable;
    if (Mutable)
    {
      CFStringAppend(Mutable, Value);
      CFStringAppend(v8, CFSTR("_exceptions.dat"));
      *(_QWORD *)buf = CFURLCreateCopyAppendingPathComponent(v6, a3, v8, 0);
      getFileSystemRepresentationFromCFURL(*(const __CFURL **)buf, &__p);
    }
  }
  else
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = ___ZN34TLCompositeTransliteratorException17loadExceptionListEPK10__CFLocalePK7__CFURL_block_invoke;
    v22 = &unk_251A53E68;
    v23 = &v25;
    LDEnumerateAssetDataItems();
  }
  v9 = (const __CFString *)v26[6];
  if (v9)
  {
    getUTF8StringFromCFString(v9, &__p);
    v10 = TL::StringMap::createWithFile((char *)&__p);
    if (!v10)
    {
      v11 = CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x24BDBD418]);
      _nlpDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "");
        applesauce::CF::convert_or<std::string>((CFTypeID)v11, (uint64_t)buf, &v18);
        if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v17 = &v18;
        else
          v17 = (std::string *)v18.__r_.__value_.__r.__words[0];
        *(_DWORD *)v34 = 136315138;
        v35 = v17;
        _os_log_error_impl(&dword_2493D1000, v12, OS_LOG_TYPE_ERROR, "Failed to load exception list for: %s", v34, 0xCu);
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v18.__r_.__value_.__l.__data_);
        if (v33 < 0)
          operator delete(*(void **)buf);
      }

    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v13 = CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    _nlpDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v18, "");
      applesauce::CF::convert_or<std::string>((CFTypeID)v13, (uint64_t)&v18, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = p_p;
      _os_log_error_impl(&dword_2493D1000, v14, OS_LOG_TYPE_ERROR, "Failed to locate exception list for: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v18.__r_.__value_.__l.__data_);
    }

    v10 = 0;
  }
  _Block_object_dispose(&v25, 8);
  if (cf)
    CFRelease(cf);
  return v10;
}

void sub_2493D7408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  void *v23;
  uint64_t v24;
  void *v25;

  v25 = v23;

  if (a22 < 0)
    operator delete(__p);
  _Block_object_dispose(&a23, 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v24 + 48), 0);
  _Unwind_Resume(a1);
}

void sub_2493D74DC()
{
  JUMPOUT(0x2493D74D4);
}

void TLCompositeTransliteratorException::~TLCompositeTransliteratorException(TL::StringMap **this)
{
  std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(a1 + 48), 0);
}

void ___ZN34TLCompositeTransliteratorException17loadExceptionListEPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  const __CFString *PathComponent;
  const __CFString *v10;
  uint64_t v11;
  CFStringRef v12;

  PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    v10 = PathComponent;
    if (CFStringsAreEqual(PathComponent, CFSTR("exceptions.dat")))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = CFURLCopyPath(url);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v11 + 48), v12);
      *a6 = 1;
    }
    CFRelease(v10);
  }
}

void sub_2493D75B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_or<std::string>(CFTypeID a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  void *__p[2];
  std::string::size_type v6;
  char v7;

  applesauce::CF::convert_as<std::string,0>(a1, (uint64_t)__p);
  if (v7)
  {
    if (SHIBYTE(v6) < 0)
    {
      std::string::__init_copy_ctor_external(a3, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      if (v7)
      {
        if (SHIBYTE(v6) < 0)
          operator delete(__p[0]);
      }
    }
    else
    {
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      a3->__r_.__value_.__r.__words[2] = v6;
    }
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
  }
}

void TLCompositeTransliteratorException::exceptionCandidatesForInput(uint64_t **a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  uint64_t v6;
  std::string::size_type size;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::string __p;
  os_signpost_id_t v18;
  uint64_t v19;

  TLOSSignPostexceptionCandidatesForInput::TLOSSignPostexceptionCandidatesForInput((TLOSSignPostexceptionCandidatesForInput *)&v18);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (*a1)
  {
    v6 = *(unsigned __int8 *)(a2 + 23);
    if ((v6 & 0x80u) != 0)
      v6 = *(_QWORD *)(a2 + 8);
    if (v6)
    {
      TL::StringMap::get(*a1, (void **)a2, &__p);
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __p.__r_.__value_.__l.__size_;
      if (size)
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        splitWithChar((uint64_t *)&__p, 0x2Cu, (uint64_t)&v14);
        v9 = v14;
        v10 = v15;
        if (v14 != v15)
        {
          v11 = a3->u64[1];
          do
          {
            v13 = 0;
            v19 = 1;
            v12 = 0;
            if (v11 >= a3[1].i64[0])
            {
              v11 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string const&,float,float,TLTransliteratorCandidateType,BOOL>(a3, a2, v9, (float *)&v13 + 1, (float *)&v13, &v19, &v12);
            }
            else
            {
              TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v11, a2, v9, 1, 0, 0.0, 0.0);
              v11 += 80;
              a3->i64[1] = v11;
            }
            a3->i64[1] = v11;
            v9 += 24;
          }
          while (v9 != v10);
        }
        v19 = (uint64_t)&v14;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
        v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      if (v8 < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(&v18);
}

void sub_2493D77C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, os_signpost_id_t a20)
{
  uint64_t v20;

  *(_QWORD *)(v20 - 56) = &a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v20 - 56));
  if (a19 < 0)
    operator delete(__p);
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(&a20);
  _Unwind_Resume(a1);
}

void TLOSSignPostexceptionCandidatesForInput::TLOSSignPostexceptionCandidatesForInput(TLOSSignPostexceptionCandidatesForInput *this)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, this);

  *(_QWORD *)this = v3;
  _nlpSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)this;
  if ((unint64_t)(*(_QWORD *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "exceptionCandidatesForInput", (const char *)&unk_2493EB9EA, v7, 2u);
  }

}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string const&,float,float,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, uint64_t a3, float *a4, float *a5, _QWORD *a6, unsigned __int8 *a7)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i64;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64x2_t v28;
  uint64_t v29;
  char *v30;
  char *v32;
  int64x2_t v33;
  char *v34;
  int64x2_t *v35;

  v8 = a1->i64[0];
  v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  i64 = (uint64_t)a1[1].i64;
  v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10)
    v10 = 2 * v18;
  if (v18 >= 0x199999999999999)
    v19 = 0x333333333333333;
  else
    v19 = v10;
  v35 = a1 + 1;
  if (v19)
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  else
    v20 = 0;
  v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  v22 = a1->i64[0];
  v21 = a1->u64[1];
  v23 = v33.i64[0];
  v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      v25 = *(_OWORD *)(v21 - 80);
      *(_QWORD *)(v24 - 64) = *(_QWORD *)(v21 - 64);
      *(_OWORD *)(v24 - 80) = v25;
      *(_QWORD *)(v21 - 72) = 0;
      *(_QWORD *)(v21 - 64) = 0;
      *(_QWORD *)(v21 - 80) = 0;
      v26 = *(_OWORD *)(v21 - 56);
      *(_QWORD *)(v24 - 40) = *(_QWORD *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(_QWORD *)(v21 - 48) = 0;
      *(_QWORD *)(v21 - 40) = 0;
      *(_QWORD *)(v21 - 56) = 0;
      v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    v28 = *a1;
  }
  v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  v33 = v28;
  v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  v34 = v30;
  v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_2493D7A6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

uint64_t std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(i - 80);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(os_signpost_id_t *this)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v3, OS_SIGNPOST_INTERVAL_END, v4, "exceptionCandidatesForInput", (const char *)&unk_2493EB9EA, v5, 2u);
  }

}

void nlp::CFScopedPtr<__CFString *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFURL const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

CFTypeID applesauce::CF::convert_as<std::string,0>@<X0>(CFTypeID result@<X0>, uint64_t a2@<X8>)
{
  const __CFString *v3;
  CFTypeID TypeID;
  __int128 v5;
  uint64_t v6;

  if (result
    && (v3 = (const __CFString *)result, TypeID = CFStringGetTypeID(), result = CFGetTypeID(v3), TypeID == result))
  {
    result = (CFTypeID)applesauce::CF::details::CFString_get_value<false>(v3, (uint64_t)&v5);
    *(_OWORD *)a2 = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 24) = 0;
  }
  return result;
}

_QWORD *applesauce::CF::details::CFString_get_value<false>@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  char *CStringPtr;
  CFIndex Length;
  UInt8 *v7;
  CFIndex maxBufLen;
  CFRange v9;
  CFRange v10;

  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
    return std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, CStringPtr);
  Length = CFStringGetLength(a1);
  maxBufLen = 0;
  v9.location = 0;
  v9.length = Length;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  std::string::basic_string[abi:ne180100]((_QWORD *)a2, maxBufLen, 0);
  if (*(char *)(a2 + 23) >= 0)
    v7 = (UInt8 *)a2;
  else
    v7 = *(UInt8 **)a2;
  v10.location = 0;
  v10.length = Length;
  return (_QWORD *)CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

__CFString *TLTransliterationCandidateTypeAsString(unint64_t a1)
{
  if (a1 < 4)
    return off_251A53E88[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown type: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_2493D7FA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_2493D80F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2493D81D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2493D8368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2493D8550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void TLBengaliOrthographyChecker::TLBengaliOrthographyChecker(TLBengaliOrthographyChecker *this)
{
  CFMutableStringRef Mutable;
  CFMutableStringRef v3;
  CFMutableStringRef v4;
  __CFCharacterSet *MutableCopy;

  *(_QWORD *)this = &off_251A53EB8;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 2) = CFSTR("়");
  *((_QWORD *)this + 3) = CFSTR("্");
  *((_QWORD *)this + 4) = CFSTR("ঃ");
  *((_QWORD *)this + 5) = CFSTR("ং");
  *((_QWORD *)this + 6) = CFSTR("ঁ");
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 2));
  CFStringAppend(Mutable, *((CFStringRef *)this + 3));
  CFStringAppend(Mutable, *((CFStringRef *)this + 4));
  CFStringAppend(Mutable, *((CFStringRef *)this + 5));
  CFStringAppend(Mutable, *((CFStringRef *)this + 6));
  CFStringAppend(Mutable, CFSTR("া"));
  CFStringAppend(Mutable, CFSTR("ি"));
  CFStringAppend(Mutable, CFSTR("ী"));
  CFStringAppend(Mutable, CFSTR("ু"));
  CFStringAppend(Mutable, CFSTR("ূ"));
  CFStringAppend(Mutable, CFSTR("ৃ"));
  CFStringAppend(Mutable, CFSTR("ে"));
  CFStringAppend(Mutable, CFSTR("ৈ"));
  CFStringAppend(Mutable, CFSTR("ো"));
  CFStringAppend(Mutable, CFSTR("ৌ"));
  *((_QWORD *)this + 7) = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFRelease(Mutable);
  v3 = CFStringCreateMutable(0, 0);
  CFStringAppend(v3, CFSTR("ক"));
  CFStringAppend(v3, CFSTR("খ"));
  CFStringAppend(v3, CFSTR("গ"));
  CFStringAppend(v3, CFSTR("ঘ"));
  CFStringAppend(v3, CFSTR("ঙ"));
  CFStringAppend(v3, CFSTR("চ"));
  CFStringAppend(v3, CFSTR("ছ"));
  CFStringAppend(v3, CFSTR("জ"));
  CFStringAppend(v3, CFSTR("ঝ"));
  CFStringAppend(v3, CFSTR("ঞ"));
  CFStringAppend(v3, CFSTR("ট"));
  CFStringAppend(v3, CFSTR("ঠ"));
  CFStringAppend(v3, CFSTR("ড"));
  CFStringAppend(v3, CFSTR("ঢ"));
  CFStringAppend(v3, CFSTR("ণ"));
  CFStringAppend(v3, CFSTR("ত"));
  CFStringAppend(v3, CFSTR("থ"));
  CFStringAppend(v3, CFSTR("দ"));
  CFStringAppend(v3, CFSTR("ধ"));
  CFStringAppend(v3, CFSTR("ন"));
  CFStringAppend(v3, CFSTR("প"));
  CFStringAppend(v3, CFSTR("ফ"));
  CFStringAppend(v3, CFSTR("ব"));
  CFStringAppend(v3, CFSTR("ভ"));
  CFStringAppend(v3, CFSTR("ম"));
  CFStringAppend(v3, CFSTR("য"));
  CFStringAppend(v3, CFSTR("র"));
  CFStringAppend(v3, CFSTR("ল"));
  CFStringAppend(v3, CFSTR("শ"));
  CFStringAppend(v3, CFSTR("ষ"));
  CFStringAppend(v3, CFSTR("স"));
  CFStringAppend(v3, CFSTR("হ"));
  CFStringAppend(v3, CFSTR("ৎ"));
  CFStringAppend(v3, CFSTR("ড়"));
  CFStringAppend(v3, CFSTR("ঢ়"));
  CFStringAppend(v3, CFSTR("য়"));
  *((_QWORD *)this + 8) = CFCharacterSetCreateWithCharactersInString(0, v3);
  CFRelease(v3);
  v4 = CFStringCreateMutable(0, 0);
  CFStringAppend(v4, CFSTR("অ"));
  CFStringAppend(v4, CFSTR("আ"));
  CFStringAppend(v4, CFSTR("ই"));
  CFStringAppend(v4, CFSTR("ঈ"));
  CFStringAppend(v4, CFSTR("উ"));
  CFStringAppend(v4, CFSTR("ঊ"));
  CFStringAppend(v4, CFSTR("ঋ"));
  CFStringAppend(v4, CFSTR("এ"));
  CFStringAppend(v4, CFSTR("ঐ"));
  CFStringAppend(v4, CFSTR("ও"));
  CFStringAppend(v4, CFSTR("ঔ"));
  *((_QWORD *)this + 9) = CFCharacterSetCreateWithCharactersInString(0, v4);
  CFRelease(v4);
  MutableCopy = CFCharacterSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *((CFCharacterSetRef *)this + 9));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 8));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 7));
  *((_QWORD *)this + 10) = CFCharacterSetCreateInvertedSet(0, MutableCopy);
  CFRelease(MutableCopy);
}

void TLBengaliOrthographyChecker::~TLBengaliOrthographyChecker(CFTypeRef *this)
{
  *this = &off_251A53EB8;
  CFRelease(this[7]);
  CFRelease(this[8]);
  CFRelease(this[9]);
  CFRelease(this[10]);
}

{
  TLBengaliOrthographyChecker::~TLBengaliOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLBengaliOrthographyChecker::isVowelSign(TLBengaliOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable;
  const __CFCharacterSet *v4;
  const __CFCharacterSet *InvertedSet;
  _BOOL8 v6;
  CFRange v8;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("া"));
  CFStringAppend(Mutable, CFSTR("ি"));
  CFStringAppend(Mutable, CFSTR("ী"));
  CFStringAppend(Mutable, CFSTR("ু"));
  CFStringAppend(Mutable, CFSTR("ূ"));
  CFStringAppend(Mutable, CFSTR("ৃ"));
  CFStringAppend(Mutable, CFSTR("ে"));
  CFStringAppend(Mutable, CFSTR("ৈ"));
  CFStringAppend(Mutable, CFSTR("ো"));
  CFStringAppend(Mutable, CFSTR("ৌ"));
  v4 = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  CFRelease(Mutable);
  CFRelease(v4);
  v8.length = CFStringGetLength(a2);
  v8.location = 0;
  v6 = CFStringFindCharacterFromSet(a2, InvertedSet, v8, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v6;
}

BOOL TLBengaliOrthographyChecker::canNuktaFollowLetter(TLBengaliOrthographyChecker *this, const __CFString *a2)
{
  const __CFCharacterSet *v3;
  const __CFCharacterSet *InvertedSet;
  _BOOL8 v5;
  CFRange v7;

  v3 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ডঢয"));
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v3);
  CFRelease(CFSTR("ডঢয"));
  CFRelease(v3);
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  v5 = CFStringFindCharacterFromSet(a2, InvertedSet, v7, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v5;
}

BOOL TLBengaliOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  if (CFStringCompare(theString1, CFSTR("অ"), 0) == kCFCompareEqualTo
    || CFStringCompare(theString1, CFSTR("এ"), 0) == kCFCompareEqualTo
    || CFStringCompare(theString1, this[2], 0) == kCFCompareEqualTo)
  {
    return 1;
  }
  v4 = (const __CFCharacterSet *)this[8];
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLBengaliOrthographyChecker::checkSpelling(TLBengaliOrthographyChecker *this, CFStringRef theString, const __CFString **a3, const __CFString **a4)
{
  CFIndex Length;
  CFIndex v8;
  CFIndex location;
  CFStringRef v10;
  CFStringRef v11;
  const __CFString *v12;
  const __CFString *v13;
  CFRange v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  CFRange v18;
  CFStringRef v19;
  CFStringRef v20;
  char v21;
  CFCharacterSetRef v22;
  CFIndex v23;
  const __CFCharacterSet *v24;
  const __CFString *v25;
  CFRange v26;
  UniChar CharacterAtIndex;
  int CharacterFromSet;
  _BOOL8 v29;
  CFStringRef v30;
  const __CFString *v31;
  CFRange result;
  CFRange v34;
  CFRange v35;
  CFRange v36;
  CFRange v37;
  CFRange v38;
  CFRange v39;
  CFRange v40;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v34.location = 0;
  v34.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v34, 0, &result))
  {
    v8 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!result.location)
        goto LABEL_59;
      if (location != 0x7FFFFFFFFFFFFFFFLL && result.location == v8 + location)
      {
        v35.location = location;
        v35.length = v8;
        v10 = CFStringCreateWithSubstring(0, theString, v35);
        v11 = CFStringCreateWithSubstring(0, theString, result);
        if ((CFStringCompare(v10, *((CFStringRef *)this + 2), 0)
           || CFStringCompare(v11, *((CFStringRef *)this + 2), 0) == kCFCompareEqualTo)
          && (CFStringCompare(v11, *((CFStringRef *)this + 5), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10))
          && (CFStringCompare(v11, *((CFStringRef *)this + 6), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10))
          && (CFStringCompare(v11, *((CFStringRef *)this + 4), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10)))
        {
          if (v10)
            CFRelease(v10);
          if (v11)
            CFRelease(v11);
LABEL_59:
          v29 = 0;
          v31 = CFSTR("illegal diacritic placement");
          if (!a4)
            goto LABEL_72;
          goto LABEL_70;
        }
        if (v10)
          CFRelease(v10);
        if (v11)
          CFRelease(v11);
      }
      location = result.location;
      v8 = result.length;
      v36.location = result.length + result.location;
      v36.length = Length - (result.length + result.location);
    }
    while (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v36, 0, &result));
  }
  result = (CFRange)xmmword_2493E9370;
  v12 = (const __CFString *)*((_QWORD *)this + 2);
  v13 = theString;
  v14.location = 0;
  v14.length = Length;
  while (CFStringFindWithOptions(v13, v12, v14, 0, &result))
  {
    if (!result.location)
      goto LABEL_53;
    v37.location = result.location - 1;
    v37.length = 1;
    v15 = (__CFString *)CFStringCreateWithSubstring(0, theString, v37);
    if (!TLBengaliOrthographyChecker::canNuktaFollowLetter((TLBengaliOrthographyChecker *)v15, v15))
    {
      if (v15)
        CFRelease(v15);
LABEL_53:
      v29 = 0;
      v31 = CFSTR("illegal nukta placement");
      if (!a4)
        goto LABEL_72;
LABEL_70:
      if (v29)
        goto LABEL_72;
      *a4 = v31;
      return v29;
    }
    if (v15)
      CFRelease(v15);
    v14.location = result.length + result.location;
    v14.length = Length - (result.length + result.location);
    v12 = (const __CFString *)*((_QWORD *)this + 2);
    v13 = theString;
  }
  result = (CFRange)xmmword_2493E9370;
  v16 = (const __CFString *)*((_QWORD *)this + 3);
  v17 = theString;
  v18.location = 0;
  v18.length = Length;
  while (1)
  {
    if (!CFStringFindWithOptions(v17, v16, v18, 0, &result))
    {
      v22 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ঁং্"));
      v23 = CFStringGetLength(theString);
      v24 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
      v25 = theString;
      v26.location = 0;
      v26.length = v23;
      while (1)
      {
        if (!CFStringFindCharacterFromSet(v25, v24, v26, 0, &result))
        {
          CFRelease(v22);
          v40.length = CFStringGetLength(theString);
          v40.location = 0;
          CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v40, 0, &result);
          v29 = CharacterFromSet == 0;
          if (CharacterFromSet)
          {
            v30 = CFStringCreateWithSubstring(0, theString, result);
            v31 = CFStringCreateWithFormat(0, 0, CFSTR("invalid letter '%@'"), v30);
            CFRelease(v30);
            if (a4)
              goto LABEL_70;
          }
          else
          {
            v31 = 0;
            if (a4)
              goto LABEL_70;
          }
          goto LABEL_72;
        }
        if (result.location + 1 < v23)
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
          if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 7), CharacterAtIndex))
          {
            if (!CFCharacterSetIsCharacterMember(v22, CharacterAtIndex))
              break;
          }
        }
        v26.location = result.length + result.location;
        v24 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
        v26.length = v23 - (result.length + result.location);
        v25 = theString;
      }
      CFRelease(v22);
      v29 = 0;
      v31 = CFSTR("illegal diacritic after vowel letter");
      if (!a4)
        goto LABEL_72;
      goto LABEL_70;
    }
    if (!result.location)
      break;
    v38.location = result.location - 1;
    v38.length = 1;
    v19 = CFStringCreateWithSubstring(0, theString, v38);
    if (result.location + 1 >= Length)
    {
      v20 = 0;
      if (!TLBengaliOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v19))
      {
LABEL_61:
        if (v19)
          CFRelease(v19);
        if (v20)
          CFRelease(v20);
        break;
      }
LABEL_37:
      v21 = 1;
      if (!v19)
        goto LABEL_39;
LABEL_38:
      CFRelease(v19);
      goto LABEL_39;
    }
    v39.length = 1;
    v39.location = result.location + 1;
    v20 = CFStringCreateWithSubstring(0, theString, v39);
    if (!TLBengaliOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v19))
      goto LABEL_61;
    if (!v20)
      goto LABEL_37;
    if (!TLDevanagariOrthographyChecker::canViramaPrecedeLetter(this, v20))
      goto LABEL_61;
    v21 = 0;
    if (v19)
      goto LABEL_38;
LABEL_39:
    if ((v21 & 1) == 0)
      CFRelease(v20);
    v18.location = result.length + result.location;
    v18.length = Length - (result.length + result.location);
    v16 = (const __CFString *)*((_QWORD *)this + 3);
    v17 = theString;
  }
  v29 = 0;
  v31 = CFSTR("illegal virama placement");
  if (a4)
    goto LABEL_70;
LABEL_72:
  if (!a4 && v31)
    CFRelease(v31);
  return v29;
}

TL::StringMap *TL::StringMap::StringMap(TL::StringMap *this)
{
  _QWORD *v2;

  *(_QWORD *)this = 0;
  v2 = (_QWORD *)operator new();
  v2[2] = 0;
  v2[1] = 0;
  *v2 = v2 + 1;
  *((_QWORD *)this + 1) = v2;
  return this;
}

uint64_t **TL::StringMap::StringMap(uint64_t **a1, char *a2)
{
  uint64_t *v4;

  v4 = (uint64_t *)operator new();
  StringMapFile::StringMapFile(v4, a2);
  *a1 = v4;
  a1[1] = 0;
  return a1;
}

void sub_2493D9794(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495AFA48](v1, 0x70C40A8FA3B04);
  _Unwind_Resume(a1);
}

uint64_t **TL::StringMap::createWithFile(char *a1)
{
  uint64_t **v2;

  v2 = (uint64_t **)operator new();
  TL::StringMap::StringMap(v2, a1);
  return v2;
}

void sub_2493D9800(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2;
  MEMORY[0x2495AFA48](v4, 0x80C40803F642BLL);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x2493D97F0);
  }
  _Unwind_Resume(a1);
}

void TL::StringMap::~StringMap(TL::StringMap *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  if (v2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*((_QWORD *)this + 1), *(_QWORD **)(v2 + 8));
    MEMORY[0x2495AFA48](v2, 0x1020C4062D53EE8);
  }
  if (*(_QWORD *)this)
  {
    StringMapFile::~StringMapFile(*(StringMapFile **)this);
    MEMORY[0x2495AFA48]();
  }
}

uint64_t **TL::StringMap::add(uint64_t a1, __int128 *a2, const std::string *a3)
{
  uint64_t **result;
  uint64_t *v5;
  __int128 *v6;

  result = *(uint64_t ***)(a1 + 8);
  if (result)
  {
    v6 = a2;
    v5 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(result, (void **)a2, (uint64_t)&std::piecewise_construct, &v6);
    return (uint64_t **)std::string::operator=((std::string *)(v5 + 7), a3);
  }
  return result;
}

void TL::StringMap::get(uint64_t *a1@<X0>, void **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4;

  v4 = a1[1];
  if (v4)
    StringMapBuilder::get(v4, a2, a3);
  else
    StringMapFile::get(*a1, a3);
}

void StringMapBuilder::get(uint64_t a1@<X0>, void **a2@<X1>, std::string *a3@<X8>)
{
  void **v5;
  __int128 v6;

  v5 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(a1, a2);
  if ((void **)(a1 + 8) == v5)
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "");
  }
  else if (*((char *)v5 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(a3, (const std::string::value_type *)v5[7], (std::string::size_type)v5[8]);
  }
  else
  {
    v6 = *(_OWORD *)(v5 + 7);
    a3->__r_.__value_.__r.__words[2] = (std::string::size_type)v5[9];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v6;
  }
}

_QWORD *StringMapFile::get@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;

  if (CFBurstTrieFindUTF8String())
    v4 = *(char **)(a1 + 8);
  else
    v4 = "";
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

_QWORD *TL::StringMap::write(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 8);
  if (result)
    return (_QWORD *)StringMapBuilder::write(result, a2);
  return result;
}

uint64_t StringMapBuilder::write(_QWORD *a1, uint64_t a2)
{
  _BYTE *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  const char *v13;
  FILE *v14;
  int v15;
  int v16;
  uint64_t __buf;
  int v19;
  void *__p;
  _BYTE *v21;
  _BYTE *v22;
  char **v23;
  char *v24[2];

  CFBurstTrieCreate();
  v24[0] = 0;
  v24[1] = 0;
  v23 = v24;
  v4 = operator new(1uLL);
  *v4 = 0;
  v21 = v4 + 1;
  v22 = v4 + 1;
  __p = v4;
  v7 = (_QWORD *)*a1;
  v5 = a1 + 1;
  v6 = v7;
  if (v7 != v5)
  {
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)&v23, (void **)v6 + 4);
      CFBurstTrieAddUTF8String();
      if (*((char *)v6 + 79) < 0)
      {
        v8 = (char *)v6[7];
        v9 = v6[8];
      }
      else
      {
        v8 = (char *)(v6 + 7);
        v9 = *((unsigned __int8 *)v6 + 79);
      }
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>((uint64_t)&__buf, v8, &v8[v9 + 1], (unint64_t *)&__p);
      v10 = (_QWORD *)v6[1];
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
          v11 = (_QWORD *)v6[2];
          v12 = *v11 == (_QWORD)v6;
          v6 = v11;
        }
        while (!v12);
      }
      v6 = v11;
    }
    while (v11 != v5);
  }
  __buf = 0x1F710C3D2;
  if (*(char *)(a2 + 23) >= 0)
    v13 = (const char *)a2;
  else
    v13 = *(const char **)a2;
  v14 = fopen(v13, "wb");
  v15 = fileno(v14);
  write(v15, &__buf, 0x18uLL);
  v16 = lseek(v15, 0, 1);
  CFBurstTrieSerializeWithFileDescriptor();
  v19 = lseek(v15, 0, 1) - v16;
  write(v15, __p, v21 - (_BYTE *)__p);
  pwrite(v15, &__buf, 0x18uLL, 0);
  CFBurstTrieRelease();
  fclose(v14);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&v23, v24[0]);
  return 1;
}

void sub_2493D9C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16, char *a17)
{
  if (__p)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&a16, a17);
  _Unwind_Resume(a1);
}

uint64_t *StringMapFile::StringMapFile(uint64_t *a1, char *a2)
{
  _QWORD *v3;
  char *v4;
  _DWORD *v5;
  _QWORD *exception;
  _QWORD *v8;
  __int128 v9;

  *a1 = 0;
  v3 = a1 + 2;
  if (a2[23] >= 0)
    v4 = a2;
  else
    v4 = *(char **)a2;
  TL::ReadOnlyFile<char>::open(v4, (uint64_t)"r", 1, v3);
  v5 = *(_DWORD **)a1[2];
  if (*v5 != -149896238)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, "string map file is invalid");
    TL::ResourceCreationException::ResourceCreationException(exception, &v9);
  }
  if (v5[1] != 1)
  {
    v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, "string map file version is not supported");
    TL::ResourceCreationException::ResourceCreationException(v8, &v9);
  }
  a1[1] = (uint64_t)v5 + v5[2] + 24;
  *a1 = CFBurstTrieCreateFromMapBytes();
  return a1;
}

void sub_2493D9D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void *v16;
  int v17;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      std::shared_ptr<TL::ReadOnlyFile<char>>::~shared_ptr[abi:ne180100](v15);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

void TL::ReadOnlyFile<char>::open(char *__s@<X0>, uint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X8>)
{
  _QWORD *exception;
  _QWORD v9[7];
  char v10;
  void *__p[2];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v13 = 0;
  v14 = &v13;
  v15 = 0x4002000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, __s);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___ZN2TL12ReadOnlyFileIcE4openEPKcS3_b_block_invoke;
  v9[3] = &unk_251A53F20;
  v9[5] = __s;
  v9[6] = a2;
  v10 = a3;
  v9[4] = &v13;
  nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getResource((uint64_t)__p, (uint64_t)v9, a4);
  if (v12 < 0)
    operator delete(__p[0]);
  if ((*((char *)v14 + 63) & 0x80000000) == 0)
  {
    if (!*((_BYTE *)v14 + 63))
      goto LABEL_5;
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    TL::ResourceCreationException::ResourceCreationException(exception, (__int128 *)(v14 + 5));
  }
  if (v14[6])
    goto LABEL_9;
LABEL_5:
  _Block_object_dispose(&v13, 8);
  if (SHIBYTE(v20) < 0)
    operator delete(v18);
}

void sub_2493D9F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;

  std::shared_ptr<TL::ReadOnlyFile<char>>::~shared_ptr[abi:ne180100](v34);
  _Block_object_dispose(&a24, 8);
  if (a34 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getResource(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  NSObject *Queue;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  __n128 (*v17)(uint64_t, uint64_t);
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  std::__shared_weak_count *v20;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3802000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v20 = 0;
  Queue = nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = ___ZN3nlp24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN2TL12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPSA_vE_block_invoke;
  v13[3] = &unk_251A53F48;
  v13[5] = &v14;
  v13[6] = a1;
  v13[4] = a2;
  dispatch_sync(Queue, v13);
  v7 = v15[6];
  *a3 = v15[5];
  a3[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  _Block_object_dispose(&v14, 8);
  v10 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

uint64_t ___ZN2TL12ReadOnlyFileIcE4openEPKcS3_b_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = operator new();
  TL::ReadOnlyFile<char>::ReadOnlyFile(v2, *(char **)(a1 + 40), *(char **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return v2;
}

void sub_2493DA114(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v7;
  const std::string::value_type *v8;

  v5 = v3;
  MEMORY[0x2495AFA48](v5, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    v7 = __cxa_begin_catch(a1);
    v8 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(_QWORD *)v7 + 16))(v7);
    std::string::__assign_external((std::string *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 40), v8);
    __cxa_end_catch();
    JUMPOUT(0x2493DA100);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__5(uint64_t a1)
{
  return std::shared_ptr<TL::ReadOnlyFile<char>>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  unint64_t v2;
  int v4;

  if ((v0 & 1) == 0
  {
    nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::attributes = (uint64_t)dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  }
  v2 = 0x257863000uLL;
  if ((v1 & 1) == 0)
  {
    v2 = 0x257863000;
    if (v4)
    {
      nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::queue = (uint64_t)dispatch_queue_create("com.apple.NLPUtils.SingletonResourceManager", (dispatch_queue_attr_t)nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::attributes);
      v2 = 0x257863000;
    }
  }
  return *(_QWORD *)(v2 + 2000);
}

void ___ZN3nlp24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN2TL12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPSA_vE_block_invoke(uint64_t a1)
{
  __int128 *Cache;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unsigned __int8 *v18;
  std::__shared_weak_count *v19;
  __int128 v20;

  Cache = nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache();
  v3 = std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::find<std::string>(Cache, *(unsigned __int8 **)(a1 + 48));
  if (v3)
  {
    v4 = v3;
    v20 = 0uLL;
    v5 = (std::__shared_weak_count *)*((_QWORD *)v3 + 6);
    if (v5)
    {
      *((_QWORD *)&v20 + 1) = std::__shared_weak_count::lock(v5);
      if (*((_QWORD *)&v20 + 1))
        *(_QWORD *)&v20 = *((_QWORD *)v4 + 5);
    }
    std::shared_ptr<TL::ReadOnlyFile<char>>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40, &v20);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(_QWORD *)(v9 + 40);
  v10 = (_QWORD *)(v9 + 40);
  if (!v11)
  {
    v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    std::shared_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]<TL::ReadOnlyFile<char>,void>(v10, v12);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(_QWORD *)(v13 + 40);
    if (v14)
    {
      v15 = *(_QWORD *)(v13 + 48);
      if (v15)
      {
        v16 = (unint64_t *)(v15 + 16);
        do
          v17 = __ldxr(v16);
        while (__stxr(v17 + 1, v16));
      }
      *(_QWORD *)&v20 = *(_QWORD *)(a1 + 48);
      v18 = std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)Cache, (unsigned __int8 *)v20, (uint64_t)&std::piecewise_construct, (__int128 **)&v20);
      v19 = (std::__shared_weak_count *)*((_QWORD *)v18 + 6);
      *((_QWORD *)v18 + 5) = v14;
      *((_QWORD *)v18 + 6) = v15;
      if (v19)
        std::__shared_weak_count::__release_weak(v19);
    }
  }
}

void sub_2493DA39C(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(exception_object);
}

__int128 *nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache()
{
  unsigned __int8 v0;

  if ((v0 & 1) == 0
  {
    nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache(void)::cache = 0u;
    *(_OWORD *)algn_2578637F0 = 0u;
    dword_257863800 = 1065353216;
  }
  return &nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache(void)::cache;
}

uint64_t std::shared_ptr<TL::ReadOnlyFile<char>>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void std::shared_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]<TL::ReadOnlyFile<char>,void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;

  std::shared_ptr<TL::ReadOnlyFile<char>>::shared_ptr[abi:ne180100]<TL::ReadOnlyFile<char>,void>(&v7, a2);
  v3 = (std::__shared_weak_count *)a1[1];
  v4 = v7;
  *(_QWORD *)&v7 = *a1;
  *((_QWORD *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

_QWORD *std::shared_ptr<TL::ReadOnlyFile<char>>::shared_ptr[abi:ne180100]<TL::ReadOnlyFile<char>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_251A53F78;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2493DAB94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2495AFA48);
}

uint64_t std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    TL::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t TL::ReadOnlyFile<char>::~ReadOnlyFile(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  int v5;

  v2 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    if (*(_BYTE *)(a1 + 68))
    {
      munmap(*(void **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2)
        goto LABEL_10;
      v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0)
        v3 = *(const char **)v3;
      v4 = open(v3, 2);
      v5 = v4;
      v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(_QWORD *)(a1 + 8));
        close(v5);
        v2 = *(void **)a1;
      }
      if (v2)
LABEL_10:
        MEMORY[0x2495AFA30](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

uint64_t std::unique_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_2493DAFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x38uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_2493DB06C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::weak_ptr<TL::ReadOnlyFile<char>>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::weak_ptr<TL::ReadOnlyFile<char>>>,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t TL::ReadOnlyFile<char>::ReadOnlyFile(uint64_t a1, char *a2, char *a3, int a4)
{
  int v8;
  int v9;
  int st_size;
  size_t v11;
  void *v12;
  void *v13;
  _QWORD *exception;
  _QWORD *v16;
  stat v17;
  uint64_t v18;
  int v19;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 16), a2);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 40), a3);
  *(_DWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 68) = a4;
  if (!strcmp(a3, "r"))
  {
    *(_DWORD *)(a1 + 64) = 0;
    v8 = open(a2, 0);
  }
  else
  {
    if (strcmp(a3, "r+"))
      goto LABEL_13;
    *(_DWORD *)(a1 + 64) = 514;
    v8 = open(a2, 514, 384);
  }
  v9 = v8;
  if (v8 < 0)
  {
LABEL_13:
    exception = __cxa_allocate_exception(0x20uLL);
    TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
    goto LABEL_17;
  }
  if (fstat(v8, &v17) < 0)
  {
LABEL_16:
    close(v9);
    exception = __cxa_allocate_exception(0x20uLL);
    TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
LABEL_17:
  }
  st_size = v17.st_size;
  *(_QWORD *)(a1 + 8) = v17.st_size;
  v18 = 0;
  v19 = st_size;
  fcntl(v9, 44, &v18);
  v11 = *(_QWORD *)(a1 + 8);
  if (!a4)
  {
    v13 = (void *)operator new[]();
    *(_QWORD *)a1 = v13;
    if ((read(v9, v13, *(_QWORD *)(a1 + 8)) & 0x8000000000000000) == 0)
      goto LABEL_12;
    goto LABEL_16;
  }
  if (v11)
  {
    v12 = mmap(0, v11, *(_DWORD *)(a1 + 64) & 2 | 1u, 1, v9, 0);
    if (v12 == (void *)-1)
    {
      close(v9);
      v16 = __cxa_allocate_exception(0x20uLL);
      TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(v16);
    }
    *(_QWORD *)a1 = v12;
  }
LABEL_12:
  close(v9);
  return a1;
}

void sub_2493DB584(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;
  void **v3;
  void *v4;

  __cxa_free_exception(v4);
  if (*(char *)(v2 + 63) < 0)
    operator delete(*v3);
  if (*(char *)(v2 + 39) < 0)
    operator delete(*v1);
  _Unwind_Resume(a1);
}

_QWORD *TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(_QWORD *a1)
{
  __int128 __p;
  char v4;

  std::operator+<char>();
  TL::ResourceCreationException::ResourceCreationException(a1, &__p);
  if (v4 < 0)
    operator delete((void *)__p);
  *a1 = &off_251A53FF0;
  return a1;
}

void sub_2493DB660(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *TL::ResourceCreationException::ResourceCreationException(_QWORD *a1, __int128 *a2)
{
  std::string *v3;
  __int128 v4;

  *a1 = &off_251A54018;
  v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_2493DB6D0(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void TL::ReadOnlyFileCreationException::~ReadOnlyFileCreationException(std::exception *this)
{
  TL::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x2495AFA48);
}

uint64_t TL::ResourceCreationException::what(TL::ResourceCreationException *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

void TL::ResourceCreationException::~ResourceCreationException(std::exception *this)
{
  TL::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x2495AFA48);
}

{
  this->__vftable = (std::exception_vtbl *)&off_251A54018;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

uint64_t std::shared_ptr<TL::ReadOnlyFile<char>>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void StringMapFile::~StringMapFile(StringMapFile *this)
{
  if (*(_QWORD *)this)
    CFBurstTrieRelease();
  std::shared_ptr<TL::ReadOnlyFile<char>>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, v11, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;

  v5 = a1 + 8;
  v6 = operator new(0x50uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 4);
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    v6[6] = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  v6[7] = 0;
  v6[8] = 0;
  v6[9] = 0;
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_2493DB938(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(uint64_t a1, void **a2)
{
  void **v2;
  _QWORD *v3;
  void **v5;
  char v6;
  _QWORD *v7;

  v2 = (void **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (void **)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = (void **)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(uint64_t a1, char *a2, char *a3, unint64_t *a4)
{
  char *v4;
  char *v5;
  char v6;
  char v8;
  unint64_t *v9;

  v4 = a2;
  v9 = a4;
  if (a2 == a3)
    return a2;
  v5 = a3;
  do
  {
    v6 = *v4++;
    v8 = v6;
    std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](&v9, &v8);
  }
  while (v4 != v5);
  return v5;
}

unint64_t **std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](unint64_t **a1, _BYTE *a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;

  v4 = *a1;
  v6 = (_BYTE *)(*a1)[1];
  v5 = (*a1)[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = *a2;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = *a2;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  return a1;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void TLCompositeTransliteratorSeq2Seq::TLCompositeTransliteratorSeq2Seq(TLCompositeTransliteratorSeq2Seq *this, const __CFLocale *a2, const __CFURL *a3)
{
  const void **v6;
  const __CFAllocator *v7;
  CFLocaleRef v8;
  const __CFString *Value;
  __CFString *MutableCopy;
  const __CFString *v11;
  CFLocaleRef v12;
  uint64_t v13;
  void *v14;

  *((_QWORD *)this + 1) = 0;
  v6 = (const void **)((char *)this + 8);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 2) = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("en_US"));
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)this, v8);
  Value = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  MutableCopy = CFStringCreateMutableCopy(v7, 0, Value);
  v11 = MutableCopy;
  if (MutableCopy)
  {
    CFStringAppend(MutableCopy, CFSTR("_IN"));
    v12 = CFLocaleCreate(v7, v11);
    nlp::CFScopedPtr<__CFLocale const*>::reset(v6, v12);
  }
  TLCompositeTransliteratorSeq2Seq::loadSeq2SeqModel((TLCompositeTransliteratorSeq2Seq *)MutableCopy, a2, a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v13;

  if (v11)
    CFRelease(v11);
}

void sub_2493DBCC4(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void **v2;

  nlp::CFScopedPtr<__CFLocale const*>::reset(v2, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)v1, 0);
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

id TLCompositeTransliteratorSeq2Seq::loadSeq2SeqModel(TLCompositeTransliteratorSeq2Seq *this, CFLocaleRef locale, const __CFURL *a3)
{
  const __CFString *v5;
  const __CFString *Value;
  const __CFURL *v7;
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v9;
  const __CFString *v10;
  std::string *p_p;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  CFTypeRef v18;
  NSObject *v19;
  CFTypeRef v20;
  std::string *v22;
  std::string *v23;
  std::string v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, CFURLRef, uint64_t, uint64_t, const __CFString *, _BYTE *);
  void *v28;
  uint64_t *v29;
  const __CFString *v30;
  std::string __p;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  void *v37;
  CFTypeRef cf;
  void *v39;
  _BYTE buf[12];
  char v41;
  uint8_t v42[4];
  std::string *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFString *)*MEMORY[0x24BDBD418];
  Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3812000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = &unk_2493ECF5D;
  cf = 0;
  if (a3)
  {
    v24.__r_.__value_.__r.__words[0] = 0;
    if (CFStringsAreEqual(Value, CFSTR("ur")))
    {
      v7 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, CFSTR("ur_EMT_package"), 1u);
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
    }
    else
    {
      BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.TransliterationTests"));
      v9 = CFBundleCopyResourceURL(BundleWithIdentifier, CFSTR("mul.translit"), 0, 0);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
      v7 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, CFSTR("mul_EMT_package"), 1u);
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      if (v9)
        CFRelease(v9);
    }
    getFileSystemRepresentationFromCFURL(v7, &__p);
  }
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = ___ZN32TLCompositeTransliteratorSeq2Seq16loadSeq2SeqModelEPK10__CFLocalePK7__CFURL_block_invoke;
  v28 = &unk_251A54060;
  v29 = &v32;
  v30 = Value;
  LDEnumerateAssetDataItems();
  v10 = (const __CFString *)v33[6];
  if (v10)
  {
    getUTF8StringFromCFString(v10, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_p);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x24BE2E700]);
      v39 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithModelURLs:task:skipNonFinalToCatchup:", v15, CFSTR("siri"), 0);

      v17 = dispatch_queue_create("callbackQueue", 0);
      objc_msgSend(v16, "setCallbackQueue:", v17);
    }
    else
    {
      v20 = CFLocaleGetValue(locale, v5);
      _nlpDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "");
        applesauce::CF::convert_or<std::string>((CFTypeID)v20, (uint64_t)buf, &v24);
        if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v23 = &v24;
        else
          v23 = (std::string *)v24.__r_.__value_.__r.__words[0];
        *(_DWORD *)v42 = 136315138;
        v43 = v23;
        _os_log_error_impl(&dword_2493D1000, v17, OS_LOG_TYPE_ERROR, "Failed to load Seq2Seq EMT package for: %s", v42, 0xCu);
        if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v24.__r_.__value_.__l.__data_);
        if (v41 < 0)
          operator delete(*(void **)buf);
      }
      v16 = 0;
    }

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v18 = CFLocaleGetValue(locale, v5);
    _nlpDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v24, "");
      applesauce::CF::convert_or<std::string>((CFTypeID)v18, (uint64_t)&v24, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = &__p;
      else
        v22 = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_2493D1000, v19, OS_LOG_TYPE_ERROR, "Failed to load Seq2Seq EMT package for: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
    }

    v16 = 0;
  }
  _Block_object_dispose(&v32, 8);
  if (cf)
    CFRelease(cf);
  return v16;
}

void sub_2493DC1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(a1 + 48), 0);
}

void ___ZN32TLCompositeTransliteratorSeq2Seq16loadSeq2SeqModelEPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const __CFString *a5, _BYTE *a6)
{
  const __CFString *PathComponent;
  const __CFString *v11;
  uint64_t v12;
  CFStringRef v13;

  PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    v11 = PathComponent;
    if (CFStringsAreEqual(PathComponent, CFSTR("EMT_package"))
      && (CFStringsAreEqual(*(const __CFString **)(a1 + 40), CFSTR("ur"))
       && CFStringsAreEqual(a5, CFSTR("Transliteration"))
       || CFStringsAreEqual(a5, CFSTR("MultilingualTransliteration"))))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = CFURLCopyPath(url);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v12 + 48), v13);
      *a6 = 1;
    }
    CFRelease(v11);
  }
}

void sub_2493DC3DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(uint64_t *a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  unint64_t i;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  char *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __CFString *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[4];
  __CFString *v58;
  os_signpost_id_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  TLOSSignPostseq2SeqCandidatesForInput::TLOSSignPostseq2SeqCandidatesForInput((TLOSSignPostseq2SeqCandidatesForInput *)&v59);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (a1[2])
  {
    if (*(char *)(a2 + 23) < 0)
    {
      if (!*(_QWORD *)(a2 + 8))
        goto LABEL_27;
      v6 = *(_QWORD *)a2;
    }
    else
    {
      v6 = a2;
      if (!*(_BYTE *)(a2 + 23))
        goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v38, "length");
    v8 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke;
    v57[3] = &unk_251A54088;
    v9 = v37;
    v58 = v9;
    objc_msgSend(v38, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v57);
    CFStringTrimWhitespace(v9);
    v10 = dispatch_semaphore_create(0);
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__31;
    v55 = __Block_byref_object_dispose__32;
    v56 = 0;
    v11 = *a1;
    v14 = a1 + 1;
    v13 = a1[1];
    v12 = (void *)v14[1];
    v48[0] = v8;
    v48[1] = 3221225472;
    v48[2] = ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke_33;
    v48[3] = &unk_251A540B0;
    v50 = &v51;
    v51 = 0;
    v15 = v10;
    v49 = v15;
    v35 = v9;
    v36 = v15;
    objc_msgSend(v12, "translateString:from:to:completion:", v9, v11, v13, v48);
    v16 = dispatch_time(0, 60000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      _nlpDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput((char *)(a2 + 23), (_QWORD *)a2, v17);

    }
    for (i = 0; ; ++i)
    {
      v19 = objc_msgSend((id)v52[5], "count");
      v20 = 5;
      if (v19 < 5)
        v20 = v19;
      if (i >= v20)
        break;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v52[5], "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "tokens");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v45 != v26)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "text");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        }
        while (v25);
      }

      objc_msgSend(v21, "componentsJoinedByString:", &stru_251A54338);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = (char *)objc_msgSend(v29, "UTF8String");
      v42 = 0xFFF0000000000000;
      v43 = v30;
      objc_msgSend((id)v52[5], "objectAtIndexedSubscript:", i);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "score");
      v41 = v32;
      v40 = 2;
      v39 = 0;
      v33 = a3->u64[1];
      if (v33 >= a3[1].i64[0])
      {
        v34 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL>(a3, a2, &v43, (double *)&v42, (double *)&v41, &v40, &v39);
      }
      else
      {
        std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(a3->i64[1], a2, &v43, (double *)&v42, (double *)&v41, &v40, &v39);
        v34 = v33 + 80;
        a3->i64[1] = v33 + 80;
      }
      a3->i64[1] = v34;

    }
    _Block_object_dispose(&v51, 8);

  }
LABEL_27:
  TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput(&v59);
}

void sub_2493DC828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void **a34)
{
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  _Block_object_dispose(&a34, 8);
  *(_QWORD *)(v35 + 48) = v34;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](&a34);
  TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput((os_signpost_id_t *)(v36 - 256));
  _Unwind_Resume(a1);
}

void ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendString:");
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));

}

void sub_2493DC984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2493DCA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void TLOSSignPostseq2SeqCandidatesForInput::TLOSSignPostseq2SeqCandidatesForInput(TLOSSignPostseq2SeqCandidatesForInput *this)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, this);

  *(_QWORD *)this = v3;
  _nlpSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)this;
  if ((unint64_t)(*(_QWORD *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "seq2SeqCandidatesForInput", (const char *)&unk_2493EB9EA, v7, 2u);
  }

}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, char **a3, double *a4, double *a5, _QWORD *a6, unsigned __int8 *a7)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i64;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64x2_t v28;
  uint64_t v29;
  char *v30;
  char *v32;
  int64x2_t v33;
  char *v34;
  int64x2_t *v35;

  v8 = a1->i64[0];
  v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  i64 = (uint64_t)a1[1].i64;
  v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10)
    v10 = 2 * v18;
  if (v18 >= 0x199999999999999)
    v19 = 0x333333333333333;
  else
    v19 = v10;
  v35 = a1 + 1;
  if (v19)
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  else
    v20 = 0;
  v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  v34 = &v20[80 * v19];
  std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(v33.i64[0], a2, a3, a4, a5, a6, a7);
  v22 = a1->i64[0];
  v21 = a1->u64[1];
  v23 = v33.i64[0];
  v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      v25 = *(_OWORD *)(v21 - 80);
      *(_QWORD *)(v24 - 64) = *(_QWORD *)(v21 - 64);
      *(_OWORD *)(v24 - 80) = v25;
      *(_QWORD *)(v21 - 72) = 0;
      *(_QWORD *)(v21 - 64) = 0;
      *(_QWORD *)(v21 - 80) = 0;
      v26 = *(_OWORD *)(v21 - 56);
      *(_QWORD *)(v24 - 40) = *(_QWORD *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(_QWORD *)(v21 - 48) = 0;
      *(_QWORD *)(v21 - 40) = 0;
      *(_QWORD *)(v21 - 56) = 0;
      v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    v28 = *a1;
  }
  v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  v33 = v28;
  v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  v34 = v30;
  v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_2493DCC60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(uint64_t a1, uint64_t a2, char **a3, double *a4, double *a5, _QWORD *a6, unsigned __int8 *a7)
{
  void *__p[2];
  char v15;

  std::string::basic_string[abi:ne180100]<0>(__p, *a3);
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(a1, a2, __p, *a6, *a7, *a4, *a5);
  if (v15 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_2493DCCFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput(os_signpost_id_t *this)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v3, OS_SIGNPOST_INTERVAL_END, v4, "seq2SeqCandidatesForInput", (const char *)&unk_2493EB9EA, v5, 2u);
  }

}

void TLTamilOrthographyChecker::TLTamilOrthographyChecker(TLTamilOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  __CFString *Mutable;
  __CFString *v7;
  CFCharacterSetRef v8;
  __CFString *v9;
  __CFString *v10;
  CFCharacterSetRef v11;
  __CFString *v12;
  __CFString *v13;
  CFCharacterSetRef v14;
  __CFString *v15;
  __CFString *v16;
  CFCharacterSetRef v17;
  __CFString *v18;
  __CFString *v19;
  const __CFCharacterSet *v20;
  CFCharacterSetRef InvertedSet;
  const void **v22;

  *(_OWORD *)((char *)this + 40) = 0u;
  v2 = (const void **)((char *)this + 40);
  *(_OWORD *)((char *)this + 56) = 0u;
  v3 = (const void **)((char *)this + 56);
  v4 = (const void **)((char *)this + 48);
  *(_QWORD *)this = &off_251A540E0;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 3) = CFSTR("ஃ");
  *((_QWORD *)this + 4) = CFSTR("்");
  *((_QWORD *)this + 2) = CFSTR("ஂ");
  v22 = (const void **)((char *)this + 64);
  *((_QWORD *)this + 9) = 0;
  v5 = (const void **)((char *)this + 72);
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("அ"));
    CFStringAppend(v7, CFSTR("ஆ"));
    CFStringAppend(v7, CFSTR("இ"));
    CFStringAppend(v7, CFSTR("ஈ"));
    CFStringAppend(v7, CFSTR("உ"));
    CFStringAppend(v7, CFSTR("ஊ"));
    CFStringAppend(v7, CFSTR("எ"));
    CFStringAppend(v7, CFSTR("ஏ"));
    CFStringAppend(v7, CFSTR("ஐ"));
    CFStringAppend(v7, CFSTR("ஒ"));
    CFStringAppend(v7, CFSTR("ஓ"));
    CFStringAppend(v7, CFSTR("ஔ"));
  }
  v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  v9 = CFStringCreateMutable(0, 0);
  v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, CFSTR("ா"));
    CFStringAppend(v10, CFSTR("ி"));
    CFStringAppend(v10, CFSTR("ீ"));
    CFStringAppend(v10, CFSTR("ு"));
    CFStringAppend(v10, CFSTR("ூ"));
    CFStringAppend(v10, CFSTR("ெ"));
    CFStringAppend(v10, CFSTR("ே"));
    CFStringAppend(v10, CFSTR("ை"));
    CFStringAppend(v10, CFSTR("ொ"));
    CFStringAppend(v10, CFSTR("ோ"));
    CFStringAppend(v10, CFSTR("ௌ"));
  }
  v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v11);
  v12 = CFStringCreateMutable(0, 0);
  v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v14);
  v15 = CFStringCreateMutable(0, 0);
  v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, CFSTR("க"));
    CFStringAppend(v16, CFSTR("ங"));
    CFStringAppend(v16, CFSTR("ச"));
    CFStringAppend(v16, CFSTR("ஜ"));
    CFStringAppend(v16, CFSTR("ஞ"));
    CFStringAppend(v16, CFSTR("ட"));
    CFStringAppend(v16, CFSTR("ண"));
    CFStringAppend(v16, CFSTR("த"));
    CFStringAppend(v16, CFSTR("ந"));
    CFStringAppend(v16, CFSTR("ன"));
    CFStringAppend(v16, CFSTR("ப"));
    CFStringAppend(v16, CFSTR("ம"));
    CFStringAppend(v16, CFSTR("ய"));
    CFStringAppend(v16, CFSTR("ர"));
    CFStringAppend(v16, CFSTR("ற"));
    CFStringAppend(v16, CFSTR("ல"));
    CFStringAppend(v16, CFSTR("ள"));
    CFStringAppend(v16, CFSTR("ழ"));
    CFStringAppend(v16, CFSTR("வ"));
    CFStringAppend(v16, CFSTR("ஶ"));
    CFStringAppend(v16, CFSTR("ஷ"));
    CFStringAppend(v16, CFSTR("ஸ"));
    CFStringAppend(v16, CFSTR("ஹ"));
    CFStringAppend(v16, CFSTR("ௐ"));
  }
  v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  v18 = CFStringCreateMutable(0, 0);
  v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
}

void sub_2493DD2F8(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFCharacterSet const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void TLTamilOrthographyChecker::~TLTamilOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A540E0;
  v2 = this + 5;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 6, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLTamilOrthographyChecker::~TLTamilOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLTamilOrthographyChecker::isVowelSign(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v3;
  CFRange v5;

  v3 = (const __CFCharacterSet *)*((_QWORD *)this + 6);
  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLTamilOrthographyChecker::canViramaFollowLetter(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v2;
  UniChar CharacterAtIndex;

  v2 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v2, CharacterAtIndex) != 0;
}

BOOL TLTamilOrthographyChecker::canViramaPrecedeLetter(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  v4 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFStringCompare(theString, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo
      || CFStringCompare(theString, *((CFStringRef *)this + 3), 0) == kCFCompareEqualTo;
}

BOOL TLTamilOrthographyChecker::isInvalidConsecutiveDiacritics(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFIndex location;
  const __CFString *v8;
  CFStringRef v9;
  char v10;
  const __CFString *v11;
  CFComparisonResult v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  CFRange result;
  CFRange v17;
  CFRange v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v17.location = 0;
  v17.length = Length;
  if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v17, 0, &result))
  {
    v6 = 1;
    return (v6 & 1) == 0;
  }
  v5 = 0;
  v6 = 1;
  location = 0x7FFFFFFFFFFFFFFFLL;
  while (result.location)
  {
    if (location == 0x7FFFFFFFFFFFFFFFLL || result.location != v5 + location)
      goto LABEL_24;
    v18.location = location;
    v18.length = v5;
    v8 = CFStringCreateWithSubstring(0, theString, v18);
    v9 = CFStringCreateWithSubstring(0, theString, result);
    if (CFStringCompare(v9, *((CFStringRef *)this + 2), 0) == kCFCompareEqualTo
      && (v13 = (const __CFCharacterSet *)*((_QWORD *)this + 6),
          v20.length = CFStringGetLength(v8),
          v20.location = 0,
          CFStringFindCharacterFromSet(v8, v13, v20, 0, 0))
      || CFStringCompare(v9, *((CFStringRef *)this + 3), 0) == kCFCompareEqualTo
      && CFStringCompare(v8, *((CFStringRef *)this + 4), 0) == kCFCompareEqualTo
      || CFStringCompare(v9, *((CFStringRef *)this + 3), 0) == kCFCompareEqualTo
      && (v14 = (const __CFCharacterSet *)*((_QWORD *)this + 6),
          v21.length = CFStringGetLength(v8),
          v21.location = 0,
          CFStringFindCharacterFromSet(v8, v14, v21, 0, 0)))
    {
      v10 = 1;
      if (!v9)
        goto LABEL_21;
LABEL_20:
      CFRelease(v9);
      goto LABEL_21;
    }
    v10 = 0;
    v6 = 0;
    if (v9)
      goto LABEL_20;
LABEL_21:
    if (v8)
      CFRelease(v8);
    if ((v10 & 1) == 0)
      return (v6 & 1) == 0;
LABEL_24:
    location = result.location;
    v5 = result.length;
    v22.location = result.length + result.location;
    v22.length = Length - (result.length + result.location);
    if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v22, 0, &result))
      return (v6 & 1) == 0;
  }
  v19.length = result.length;
  v19.location = 0;
  v11 = CFStringCreateWithSubstring(0, theString, v19);
  v12 = CFStringCompare(v11, *((CFStringRef *)this + 3), 0);
  if (v11)
    CFRelease(v11);
  if (v12 == kCFCompareEqualTo)
    goto LABEL_24;
  v6 = 0;
  return (v6 & 1) == 0;
}

void sub_2493DD7E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTamilOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFCharacterSet *v8;
  UniChar CharacterAtIndex;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v13;
  CFRange v14;
  CFRange v15;
  CFRange v16;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v13.location = 0;
  v13.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 4), v13, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v14.location = result.location - 1;
      v14.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v14);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v15.length = 1;
        v15.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v15);
      }
      v8 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
      CharacterAtIndex = CFStringGetCharacterAtIndex(v6, 0);
      if (!CFCharacterSetIsCharacterMember(v8, CharacterAtIndex))
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLTamilOrthographyChecker::canViramaPrecedeLetter(this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v16.location = result.length + result.location;
        v16.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 4), v16, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493DD988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLTamilOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  int CharacterFromSet;
  UniChar CharacterAtIndex;
  CFRange result;
  const __CFCharacterSet *v11;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ஂஃ"));
  v6.location = 0;
  v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, this[5], v6, 0, &result);
    if (!CharacterFromSet)
      break;
    if (result.location + 1 < Length)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[7], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex))
          break;
      }
    }
    v6.location = result.length + result.location;
  }
  if (v5)
    CFRelease(v5);
  return CharacterFromSet != 0;
}

void sub_2493DDA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTamilOrthographyChecker::isInvalidTamilLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFRange v5;

  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, this[9], v5, 0, 0) != 0;
}

BOOL TLTamilOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLTamilOrthographyChecker::isInvalidConsecutiveDiacritics((TLTamilOrthographyChecker *)this, a2)
    || TLTamilOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((TLTamilOrthographyChecker *)this, a2)
    || TLTamilOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[9], v7, 0, 0) == 0;
}

_QWORD *operator<<(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  const char *v18;
  size_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  void **v23;
  uint64_t v24;
  void *__p[2];
  unsigned __int8 v27;

  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"Latin string: ", 14);
  v5 = *(char *)(a2 + 23);
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *(_QWORD *)a2;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a2 + 23);
  else
    v7 = *(_QWORD *)(a2 + 8);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v6, v7);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Transliterated string: ", 25);
  v10 = *(char *)(a2 + 47);
  if (v10 >= 0)
    v11 = a2 + 24;
  else
    v11 = *(_QWORD *)(a2 + 24);
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a2 + 47);
  else
    v12 = *(_QWORD *)(a2 + 32);
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", LM score: ", 12);
  v14 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)", Seq2Seq score: ", 17);
  v15 = (_QWORD *)std::ostream::operator<<();
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)", Type: ", 8);
  TLTransliterationCandidateTypeAsString(*(_QWORD *)(a2 + 64));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  v19 = strlen(v18);
  v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v18, v19);
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)", Is extension candidate: ", 26);
  if (*(_BYTE *)(a2 + 72))
    v22 = "true";
  else
    v22 = "false";
  std::string::basic_string[abi:ne180100]<0>(__p, v22);
  if ((v27 & 0x80u) == 0)
    v23 = __p;
  else
    v23 = (void **)__p[0];
  if ((v27 & 0x80u) == 0)
    v24 = v27;
  else
    v24 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v23, v24);
  if ((char)v27 < 0)
    operator delete(__p[0]);

  return a1;
}

void sub_2493DDCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(std::string *this, __int128 *a2, __int128 *a3, std::string::size_type a4, std::string::value_type a5, double a6, double a7)
{
  __int128 v13;
  std::string *v14;
  __int128 v15;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v13 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v13;
  }
  v14 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v14, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v15 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
  }
  *(double *)&this[2].__r_.__value_.__l.__data_ = a6;
  *(double *)&this[2].__r_.__value_.__l.__size_ = a7;
  this[2].__r_.__value_.__r.__words[2] = a4;
  this[3].__r_.__value_.__s.__data_[0] = a5;
}

void sub_2493DDDC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

double TLCompositeTransliteratorCandidate::getTotalScore(TLCompositeTransliteratorCandidate *this, double a2)
{
  return *((double *)this + 7) + a2 * *((double *)this + 6);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2495AF964](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2495AF970](v13);
  return a1;
}

void sub_2493DDEF4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2495AF970](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2493DDED4);
}

void sub_2493DDF3C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_2493DE070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TLCompositeTransliteratorLexicon::TLCompositeTransliteratorLexicon(TLCompositeTransliteratorLexicon *this, const __CFLocale *a2)
{
  const void *DirectLatinToNativesMap;

  *(_QWORD *)this = 0;
  DirectLatinToNativesMap = (const void *)TLCompositeTransliteratorLexicon::loadDirectLatinToNativesMap(this, a2);
  nlp::CFScopedPtr<_LXTransliteration const*>::reset((const void **)this, DirectLatinToNativesMap);
}

void sub_2493DE0C0(_Unwind_Exception *a1)
{
  const void **v1;

  nlp::CFScopedPtr<_LXTransliteration const*>::reset(v1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<_LXTransliteration const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t TLCompositeTransliteratorLexicon::loadDirectLatinToNativesMap(TLCompositeTransliteratorLexicon *this, const __CFLocale *a2)
{
  __CFDictionary *Mutable;
  uint64_t v4;
  CFTypeRef Value;
  NSObject *v6;
  std::string *p_p;
  void *v9[2];
  char v10;
  std::string __p;
  __CFDictionary *v12;
  uint8_t buf[4];
  std::string *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE5F198], a2);
  v4 = LXTransliterationCreate();
  if (!v4)
  {
    Value = CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    _nlpDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v9, "");
      applesauce::CF::convert_or<std::string>((CFTypeID)Value, (uint64_t)v9, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v14 = p_p;
      _os_log_error_impl(&dword_2493D1000, v6, OS_LOG_TYPE_ERROR, "Failed to load direct Latin to Native new lexicon for: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v10 < 0)
        operator delete(v9[0]);
    }

  }
  if (Mutable)
    CFRelease(Mutable);
  return v4;
}

void sub_2493DE290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  va_list va;

  va_start(va, a8);

  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorLexicon::~TLCompositeTransliteratorLexicon(const void **this)
{
  nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0);
}

void TLCompositeTransliteratorLexicon::lexiconCandidatesForInput(_QWORD *a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  int v6;
  CFIndex v7;
  const UInt8 *v8;
  CFStringRef v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *exception;
  unsigned __int8 v14;
  uint64_t v15;
  int v16;
  double v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  __n128 (*v21)(__n128 *, __n128 *);
  void (*v22)(uint64_t);
  void *v23;
  _QWORD v24[3];
  os_signpost_id_t v25;
  const __CFString *v26;

  TLOSSignPostlexiconCandidatesForInput::TLOSSignPostlexiconCandidatesForInput((TLOSSignPostlexiconCandidatesForInput *)&v25);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (*a1)
  {
    v6 = *(char *)(a2 + 23);
    v7 = v6 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(_QWORD *)(a2 + 8);
    if (v7)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x4812000000;
      v21 = __Block_byref_object_copy__2;
      v22 = __Block_byref_object_dispose__2;
      v23 = &unk_2493ECF5D;
      memset(v24, 0, sizeof(v24));
      if (v6 >= 0)
        v8 = (const UInt8 *)a2;
      else
        v8 = *(const UInt8 **)a2;
      v9 = CFStringCreateWithBytes(0, v8, v7, 0x8000100u, 0);
      v26 = v9;
      if (!v9)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x2495AF904](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      *(_QWORD *)&v17[1] = MEMORY[0x24BDAC760];
      *(_QWORD *)&v17[2] = 3221225472;
      *(_QWORD *)&v17[3] = ___ZNK32TLCompositeTransliteratorLexicon25lexiconCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke;
      *(_QWORD *)&v17[4] = &unk_251A54118;
      *(_QWORD *)&v17[5] = &v18;
      LXTransliterationEnumerateForTransliterated();
      v10 = v19[6];
      v11 = v19[7];
      if (v10 == v11)
        goto LABEL_17;
      v12 = a3->u64[1];
      do
      {
        v17[0] = -INFINITY;
        v16 = 0;
        v15 = 0;
        v14 = 0;
        if (v12 >= a3[1].i64[0])
        {
          v12 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string&,double,float,TLTransliteratorCandidateType,BOOL>(a3, a2, v10, v17, (float *)&v16, &v15, &v14);
        }
        else
        {
          TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v12, a2, v10, 0, 0, -INFINITY, 0.0);
          v12 += 80;
          a3->i64[1] = v12;
        }
        a3->i64[1] = v12;
        v10 += 24;
      }
      while (v10 != v11);
      v9 = v26;
      if (v26)
LABEL_17:
        CFRelease(v9);
      _Block_object_dispose(&v18, 8);
      v26 = (const __CFString *)v24;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
    }
  }
  TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput(&v25);
}

void sub_2493DE520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  *(_QWORD *)(v10 + 80) = v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v12 - 72));
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput((os_signpost_id_t *)(v12 - 80));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZNK32TLCompositeTransliteratorLexicon25lexiconCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  std::string *v12;
  std::string *v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  void *__p[2];
  std::string::size_type v18;
  const __CFString *v19;
  std::__split_buffer<std::string> __v;

  v2 = (const __CFString *)LXTransliterationEntryCopyNativeString();
  v19 = v2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  getUTF8StringFromCFString(v2, __p);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v3 + 56);
  if (v5 < v4)
  {
    v6 = *(_OWORD *)__p;
    *(_QWORD *)(v5 + 16) = v18;
    *(_OWORD *)v5 = v6;
    *(_QWORD *)(v3 + 56) = v5 + 24;
    if (!v2)
      return;
    goto LABEL_15;
  }
  v7 = *(_QWORD *)(v3 + 48);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - v7) >> 3);
  v9 = v8 + 1;
  if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v7) >> 3);
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x555555555555555)
    v11 = 0xAAAAAAAAAAAAAAALL;
  else
    v11 = v9;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v3 + 64);
  if (v11)
    v12 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v3 + 64, v11);
  else
    v12 = 0;
  v13 = v12 + v8;
  __v.__first_ = v12;
  __v.__begin_ = v13;
  __v.__end_cap_.__value_ = &v12[v11];
  v14 = *(_OWORD *)__p;
  v13->__r_.__value_.__r.__words[2] = v18;
  *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
  __p[1] = 0;
  v18 = 0;
  __p[0] = 0;
  __v.__end_ = v13 + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v3 + 48), &__v);
  v15 = *(_QWORD *)(v3 + 56);
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v16 = SHIBYTE(v18);
  *(_QWORD *)(v3 + 56) = v15;
  if ((v16 & 0x80000000) == 0)
  {
    if (!v2)
      return;
    goto LABEL_15;
  }
  operator delete(__p[0]);
  if (v2)
LABEL_15:
    CFRelease(v2);
}

void sub_2493DE748(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16, uint64_t a17)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a17);
  if (a15 < 0)
    operator delete(__pa);
  nlp::CFScopedPtr<__CFString const*>::reset(&a16, 0);
  _Unwind_Resume(a1);
}

uint64_t TLCompositeTransliteratorLexicon::isMemberOfTheNativeLexicon(uint64_t a1, uint64_t a2)
{
  createCFStringFromString(a2);
  return LXTransliterationHasNativeWord();
}

void TLOSSignPostlexiconCandidatesForInput::TLOSSignPostlexiconCandidatesForInput(TLOSSignPostlexiconCandidatesForInput *this)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, this);

  *(_QWORD *)this = v3;
  _nlpSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)this;
  if ((unint64_t)(*(_QWORD *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "lexiconCandidatesForInput", (const char *)&unk_2493EB9EA, v7, 2u);
  }

}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string&,double,float,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, uint64_t a3, double *a4, float *a5, _QWORD *a6, unsigned __int8 *a7)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i64;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64x2_t v28;
  uint64_t v29;
  char *v30;
  char *v32;
  int64x2_t v33;
  char *v34;
  int64x2_t *v35;

  v8 = a1->i64[0];
  v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  i64 = (uint64_t)a1[1].i64;
  v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10)
    v10 = 2 * v18;
  if (v18 >= 0x199999999999999)
    v19 = 0x333333333333333;
  else
    v19 = v10;
  v35 = a1 + 1;
  if (v19)
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  else
    v20 = 0;
  v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  v22 = a1->i64[0];
  v21 = a1->u64[1];
  v23 = v33.i64[0];
  v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      v25 = *(_OWORD *)(v21 - 80);
      *(_QWORD *)(v24 - 64) = *(_QWORD *)(v21 - 64);
      *(_OWORD *)(v24 - 80) = v25;
      *(_QWORD *)(v21 - 72) = 0;
      *(_QWORD *)(v21 - 64) = 0;
      *(_QWORD *)(v21 - 80) = 0;
      v26 = *(_OWORD *)(v21 - 56);
      *(_QWORD *)(v24 - 40) = *(_QWORD *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(_QWORD *)(v21 - 48) = 0;
      *(_QWORD *)(v21 - 40) = 0;
      *(_QWORD *)(v21 - 56) = 0;
      v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    v28 = *a1;
  }
  v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  v33 = v28;
  v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  v34 = v30;
  v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_2493DEA08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput(os_signpost_id_t *this)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v3, OS_SIGNPOST_INTERVAL_END, v4, "lexiconCandidatesForInput", (const char *)&unk_2493EB9EA, v5, 2u);
  }

}

void nlp::CFScopedPtr<__CFDictionary *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void TLGurmukhiOrthographyChecker::TLGurmukhiOrthographyChecker(TLGurmukhiOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  __CFString *Mutable;
  __CFString *v7;
  CFCharacterSetRef v8;
  __CFString *v9;
  __CFString *v10;
  CFCharacterSetRef v11;
  __CFString *v12;
  __CFString *v13;
  CFCharacterSetRef v14;
  __CFString *v15;
  __CFString *v16;
  CFCharacterSetRef v17;
  __CFString *v18;
  __CFString *v19;
  const __CFCharacterSet *v20;
  CFCharacterSetRef InvertedSet;
  const void **v22;

  *((_OWORD *)this + 3) = 0u;
  v2 = (const void **)((char *)this + 48);
  v3 = (const void **)((char *)this + 56);
  *((_OWORD *)this + 4) = 0u;
  v4 = (const void **)((char *)this + 64);
  *(_QWORD *)this = &off_251A54148;
  *((_QWORD *)this + 1) = CFSTR("਼");
  *((_QWORD *)this + 2) = CFSTR("੍");
  *((_QWORD *)this + 3) = CFSTR("ਂ");
  *((_QWORD *)this + 4) = CFSTR("ੰ");
  *((_QWORD *)this + 5) = CFSTR("ੱ");
  v22 = (const void **)((char *)this + 72);
  *((_QWORD *)this + 10) = 0;
  v5 = (const void **)((char *)this + 80);
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("ਅ"));
    CFStringAppend(v7, CFSTR("ਆ"));
    CFStringAppend(v7, CFSTR("ਇ"));
    CFStringAppend(v7, CFSTR("ਈ"));
    CFStringAppend(v7, CFSTR("ਉ"));
    CFStringAppend(v7, CFSTR("ਊ"));
    CFStringAppend(v7, CFSTR("ਏ"));
    CFStringAppend(v7, CFSTR("ਐ"));
    CFStringAppend(v7, CFSTR("ਓ"));
    CFStringAppend(v7, CFSTR("ਔ"));
  }
  v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  v9 = CFStringCreateMutable(0, 0);
  v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, CFSTR("ਾ"));
    CFStringAppend(v10, CFSTR("ਿ"));
    CFStringAppend(v10, CFSTR("ੀ"));
    CFStringAppend(v10, CFSTR("ੁ"));
    CFStringAppend(v10, CFSTR("ੂ"));
    CFStringAppend(v10, CFSTR("ੇ"));
    CFStringAppend(v10, CFSTR("ੈ"));
    CFStringAppend(v10, CFSTR("ੋ"));
    CFStringAppend(v10, CFSTR("ੌ"));
  }
  v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  v12 = CFStringCreateMutable(0, 0);
  v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 1));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, v10);
  }
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  v15 = CFStringCreateMutable(0, 0);
  v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, CFSTR("ਕ"));
    CFStringAppend(v16, CFSTR("ਖ"));
    CFStringAppend(v16, CFSTR("ਗ"));
    CFStringAppend(v16, CFSTR("ਘ"));
    CFStringAppend(v16, CFSTR("ਙ"));
    CFStringAppend(v16, CFSTR("ਚ"));
    CFStringAppend(v16, CFSTR("ਛ"));
    CFStringAppend(v16, CFSTR("ਜ"));
    CFStringAppend(v16, CFSTR("ਝ"));
    CFStringAppend(v16, CFSTR("ਞ"));
    CFStringAppend(v16, CFSTR("ਟ"));
    CFStringAppend(v16, CFSTR("ਠ"));
    CFStringAppend(v16, CFSTR("ਡ"));
    CFStringAppend(v16, CFSTR("ਢ"));
    CFStringAppend(v16, CFSTR("ਣ"));
    CFStringAppend(v16, CFSTR("ਤ"));
    CFStringAppend(v16, CFSTR("ਥ"));
    CFStringAppend(v16, CFSTR("ਦ"));
    CFStringAppend(v16, CFSTR("ਧ"));
    CFStringAppend(v16, CFSTR("ਨ"));
    CFStringAppend(v16, CFSTR("ਪ"));
    CFStringAppend(v16, CFSTR("ਫ"));
    CFStringAppend(v16, CFSTR("ਬ"));
    CFStringAppend(v16, CFSTR("ਭ"));
    CFStringAppend(v16, CFSTR("ਮ"));
    CFStringAppend(v16, CFSTR("ਯ"));
    CFStringAppend(v16, CFSTR("ਰ"));
    CFStringAppend(v16, CFSTR("ਲ"));
    CFStringAppend(v16, CFSTR("ਵ"));
    CFStringAppend(v16, CFSTR("ਸ"));
    CFStringAppend(v16, CFSTR("ਹ"));
    CFStringAppend(v16, CFSTR("ੜ"));
  }
  v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  v18 = CFStringCreateMutable(0, 0);
  v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
}

void sub_2493DF090(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLGurmukhiOrthographyChecker::~TLGurmukhiOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A54148;
  v2 = this + 6;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLGurmukhiOrthographyChecker::~TLGurmukhiOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLGurmukhiOrthographyChecker::isVowelSign(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v3;
  CFRange v5;

  v3 = (const __CFCharacterSet *)*((_QWORD *)this + 7);
  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  if (CFStringCompare(theString1, this[1], 0) == kCFCompareEqualTo)
    return 1;
  v4 = (const __CFCharacterSet *)this[9];
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canViramaPrecedeLetter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  const __CFCharacterSet *v3;
  UniChar CharacterAtIndex;
  int IsCharacterMember;

  v3 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ਰਹਵ"));
  CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  IsCharacterMember = CFCharacterSetIsCharacterMember(v3, CharacterAtIndex);
  if (v3)
    CFRelease(v3);
  return IsCharacterMember != 0;
}

void sub_2493DF318(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::canTippiFollowCharacter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  __CFString *Mutable;
  __CFString *v4;
  const __CFCharacterSet *v5;
  UniChar CharacterAtIndex;
  int IsCharacterMember;

  Mutable = CFStringCreateMutable(0, 0);
  v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("ਾ"));
    CFStringAppend(v4, CFSTR("ੀ"));
    CFStringAppend(v4, CFSTR("ੇ"));
    CFStringAppend(v4, CFSTR("ੈ"));
    CFStringAppend(v4, CFSTR("ੋ"));
    CFStringAppend(v4, CFSTR("ੌ"));
    CFStringAppend(v4, CFSTR("ਆ"));
    CFStringAppend(v4, CFSTR("ਉ"));
    CFStringAppend(v4, CFSTR("ਊ"));
    CFStringAppend(v4, CFSTR("ਈ"));
    CFStringAppend(v4, CFSTR("ਏ"));
    CFStringAppend(v4, CFSTR("ਐ"));
    CFStringAppend(v4, CFSTR("ਓ"));
    CFStringAppend(v4, CFSTR("ਔ"));
  }
  v5 = CFCharacterSetCreateWithCharactersInString(0, v4);
  CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  IsCharacterMember = CFCharacterSetIsCharacterMember(v5, CharacterAtIndex);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return IsCharacterMember == 0;
}

void sub_2493DF4AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::canAddakPrecedeLetter(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v2;
  UniChar CharacterAtIndex;

  v2 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v2, CharacterAtIndex) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canNuktaFollowLetter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  const __CFCharacterSet *v3;
  UniChar CharacterAtIndex;
  int IsCharacterMember;

  v3 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ਲਸਖਗਜਫਕ"));
  CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  IsCharacterMember = CFCharacterSetIsCharacterMember(v3, CharacterAtIndex);
  if (v3)
    CFRelease(v3);
  return IsCharacterMember != 0;
}

void sub_2493DF588(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidConsecutiveDiacritics(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFRange v7;
  CFIndex location;
  CFStringRef v9;
  const __CFString *v10;
  int v11;
  const __CFCharacterSet *v12;
  int CharacterFromSet;
  CFRange result;
  CFRange v16;
  CFRange v17;
  CFRange v18;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v16.location = 0;
  v16.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v16, 0, &result))
  {
    v5 = 0;
    v6 = 1;
    v7.location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      location = result.location;
      if (!result.location)
      {
        v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location)
        break;
LABEL_23:
      v5 = result.length;
      v18.location = result.length + location;
      v18.length = Length - (result.length + location);
      CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v18, 0, &result);
      v7.location = location;
      if (!CharacterFromSet)
        return (v6 & 1) == 0;
    }
    v7.length = v5;
    v9 = CFStringCreateWithSubstring(0, theString, v7);
    v10 = CFStringCreateWithSubstring(0, theString, result);
    if ((CFStringCompare(v9, *((CFStringRef *)this + 1), 0)
       || CFStringCompare(v10, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo)
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (v12 = (const __CFCharacterSet *)*((_QWORD *)this + 7),
           v17.length = CFStringGetLength(v9),
           v17.location = 0,
           !CFStringFindCharacterFromSet(v9, v12, v17, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v9))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || !TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v9)))
    {
      v6 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_19;
    }
    else
    {
      v11 = 1;
      if (!v10)
      {
LABEL_19:
        if (v9)
          CFRelease(v9);
        if (!v11)
          return (v6 & 1) == 0;
        location = result.location;
        goto LABEL_23;
      }
    }
    CFRelease(v10);
    goto LABEL_19;
  }
  v6 = 1;
  return (v6 & 1) == 0;
}

void sub_2493DF7A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL8 canViramaFollowLetter;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v12;
  CFRange v13;
  CFRange v14;
  CFRange v15;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v12.location = 0;
  v12.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, this[2], v12, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v13.location = result.location - 1;
      v13.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v13);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v14.length = 1;
        v14.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v14);
      }
      canViramaFollowLetter = TLGurmukhiOrthographyChecker::canViramaFollowLetter(this, v6);
      if (!canViramaFollowLetter)
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLGurmukhiOrthographyChecker::canViramaPrecedeLetter((TLGurmukhiOrthographyChecker *)canViramaFollowLetter, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v15.location = result.length + result.location;
        v15.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[2], v15, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493DF938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  char v7;
  CFIndex location;
  const __CFString *v9;
  CFStringRef v10;
  int v11;
  UniChar chars;
  const __CFString *v14;
  UniChar theChar;
  CFRange result;
  const __CFCharacterSet *v17;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ਂੰੱ"));
  v6.location = 0;
  v17 = v5;
  v7 = 1;
  while (1)
  {
    v6.length = Length - v6.location;
    if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 6), v6, 0, &result))
      break;
    location = result.location;
    if (result.location + 1 >= Length)
      goto LABEL_18;
    theChar = 0;
    theChar = CFStringGetCharacterAtIndex(theString, result.location + 1);
    if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 8), theChar)
      && !CFCharacterSetIsCharacterMember(v5, theChar))
    {
      v7 = 0;
      break;
    }
    v9 = CFStringCreateWithCharacters(0, &theChar, 1);
    v14 = v9;
    chars = 0;
    chars = CFStringGetCharacterAtIndex(theString, result.location);
    v10 = CFStringCreateWithCharacters(0, &chars, 1);
    if (CFStringCompare(v9, *((CFStringRef *)this + 4), 0) == kCFCompareEqualTo
      && !TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v10)
      || CFStringCompare(v9, *((CFStringRef *)this + 3), 0) == kCFCompareEqualTo
      && TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v10))
    {
      v7 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_14;
LABEL_13:
      CFRelease(v10);
      goto LABEL_14;
    }
    v11 = 1;
    if (v10)
      goto LABEL_13;
LABEL_14:
    if (v9)
      CFRelease(v9);
    if (!v11)
      break;
    location = result.location;
LABEL_18:
    v6.location = result.length + location;
  }
  if (v5)
    CFRelease(v5);
  return (v7 & 1) == 0;
}

void sub_2493DFB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  const void *v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, const void *);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

uint64_t TLGurmukhiOrthographyChecker::isInvalidAddakFollowingConsonant(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length;
  uint64_t v5;
  const __CFString *v7;
  const __CFCharacterSet *v8;
  UniChar CharacterAtIndex;
  int IsCharacterMember;
  CFRange result;
  CFRange v12;
  CFRange v13;
  CFRange v14;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v12.location = 0;
  v12.length = Length;
  v5 = CFStringFindWithOptions(theString, this[5], v12, 0, &result);
  if ((_DWORD)v5)
  {
    while (result.location && result.location != Length - 1)
    {
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      v8 = (const __CFCharacterSet *)this[9];
      CharacterAtIndex = CFStringGetCharacterAtIndex(v7, 0);
      IsCharacterMember = CFCharacterSetIsCharacterMember(v8, CharacterAtIndex);
      if (v7)
        CFRelease(v7);
      if (!IsCharacterMember)
        break;
      v14.location = result.length + result.location;
      v14.length = Length - (result.length + result.location);
      v5 = CFStringFindWithOptions(theString, this[5], v14, 0, &result);
      if (!(_DWORD)v5)
        return v5;
    }
    return 1;
  }
  return v5;
}

void sub_2493DFC6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t TLGurmukhiOrthographyChecker::isInvalidNuktaAfterConsonant(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFString *v5;
  const __CFString *v6;
  CFRange v7;
  uint64_t v8;
  TLGurmukhiOrthographyChecker *v9;
  BOOL canNuktaFollowLetter;
  CFRange result;
  CFRange v12;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v5 = (const __CFString *)*((_QWORD *)this + 1);
  v6 = theString;
  v7.location = 0;
  v7.length = Length;
  while (1)
  {
    v8 = CFStringFindWithOptions(v6, v5, v7, 0, &result);
    if (!(_DWORD)v8)
      break;
    if (!result.location)
      return 1;
    v12.location = result.location - 1;
    v12.length = 1;
    v9 = (TLGurmukhiOrthographyChecker *)CFStringCreateWithSubstring(0, theString, v12);
    canNuktaFollowLetter = TLGurmukhiOrthographyChecker::canNuktaFollowLetter(v9, (const __CFString *)v9);
    if (v9)
      CFRelease(v9);
    if (!canNuktaFollowLetter)
      return 1;
    v7.location = result.length + result.location;
    v7.length = Length - (result.length + result.location);
    v5 = (const __CFString *)*((_QWORD *)this + 1);
    v6 = theString;
  }
  return v8;
}

void sub_2493DFD5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidGurmukhiLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFRange v5;

  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, this[10], v5, 0, 0) != 0;
}

BOOL TLGurmukhiOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLGurmukhiOrthographyChecker::isInvalidConsecutiveDiacritics((TLGurmukhiOrthographyChecker *)this, a2)
    || TLGurmukhiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLGurmukhiOrthographyChecker::isInvalidDiacriticAfterVowelLetter((TLGurmukhiOrthographyChecker *)this, a2)
    || (TLGurmukhiOrthographyChecker::isInvalidAddakFollowingConsonant((CFStringRef *)this, a2) & 1) != 0
    || (TLGurmukhiOrthographyChecker::isInvalidNuktaAfterConsonant((TLGurmukhiOrthographyChecker *)this, a2) & 1) != 0)
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[10], v7, 0, 0) == 0;
}

void TLTeluguOrthographyChecker::TLTeluguOrthographyChecker(TLTeluguOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  __CFString *Mutable;
  __CFString *v7;
  CFCharacterSetRef v8;
  __CFString *v9;
  __CFString *v10;
  CFCharacterSetRef v11;
  __CFString *v12;
  __CFString *v13;
  CFCharacterSetRef v14;
  __CFString *v15;
  __CFString *v16;
  CFCharacterSetRef v17;
  __CFString *v18;
  __CFString *v19;
  const __CFCharacterSet *v20;
  CFCharacterSetRef InvertedSet;
  const void **v22;

  *((_OWORD *)this + 4) = 0u;
  v2 = (const void **)((char *)this + 64);
  v3 = (const void **)((char *)this + 72);
  *((_OWORD *)this + 5) = 0u;
  v4 = (const void **)((char *)this + 80);
  *(_QWORD *)this = &off_251A54188;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 6) = CFSTR("఼");
  *((_QWORD *)this + 7) = CFSTR("్");
  *((_QWORD *)this + 4) = CFSTR("ం");
  *((_QWORD *)this + 5) = CFSTR("ః");
  *((_QWORD *)this + 2) = CFSTR("ఀ");
  *((_QWORD *)this + 3) = CFSTR("ఁ");
  v22 = (const void **)((char *)this + 88);
  *((_QWORD *)this + 12) = 0;
  v5 = (const void **)((char *)this + 96);
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("అ"));
    CFStringAppend(v7, CFSTR("ఆ"));
    CFStringAppend(v7, CFSTR("ఇ"));
    CFStringAppend(v7, CFSTR("ఈ"));
    CFStringAppend(v7, CFSTR("ఉ"));
    CFStringAppend(v7, CFSTR("ఊ"));
    CFStringAppend(v7, CFSTR("ఋ"));
    CFStringAppend(v7, CFSTR("ఌ"));
    CFStringAppend(v7, CFSTR("ఎ"));
    CFStringAppend(v7, CFSTR("ఏ"));
    CFStringAppend(v7, CFSTR("ఐ"));
    CFStringAppend(v7, CFSTR("ఒ"));
    CFStringAppend(v7, CFSTR("ఓ"));
    CFStringAppend(v7, CFSTR("ఔ"));
  }
  v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  v9 = CFStringCreateMutable(0, 0);
  v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, CFSTR("ా"));
    CFStringAppend(v10, CFSTR("ి"));
    CFStringAppend(v10, CFSTR("ీ"));
    CFStringAppend(v10, CFSTR("ు"));
    CFStringAppend(v10, CFSTR("ూ"));
    CFStringAppend(v10, CFSTR("ృ"));
    CFStringAppend(v10, CFSTR("ౄ"));
    CFStringAppend(v10, CFSTR("ె"));
    CFStringAppend(v10, CFSTR("ే"));
    CFStringAppend(v10, CFSTR("ై"));
    CFStringAppend(v10, CFSTR("ొ"));
    CFStringAppend(v10, CFSTR("ో"));
    CFStringAppend(v10, CFSTR("ౌ"));
  }
  v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  v12 = CFStringCreateMutable(0, 0);
  v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 6));
    CFStringAppend(v13, *((CFStringRef *)this + 7));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  v15 = CFStringCreateMutable(0, 0);
  v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, CFSTR("క"));
    CFStringAppend(v16, CFSTR("ఖ"));
    CFStringAppend(v16, CFSTR("గ"));
    CFStringAppend(v16, CFSTR("ఘ"));
    CFStringAppend(v16, CFSTR("ఙ"));
    CFStringAppend(v16, CFSTR("చ"));
    CFStringAppend(v16, CFSTR("ఛ"));
    CFStringAppend(v16, CFSTR("జ"));
    CFStringAppend(v16, CFSTR("ఝ"));
    CFStringAppend(v16, CFSTR("ఞ"));
    CFStringAppend(v16, CFSTR("ట"));
    CFStringAppend(v16, CFSTR("ఠ"));
    CFStringAppend(v16, CFSTR("డ"));
    CFStringAppend(v16, CFSTR("ఢ"));
    CFStringAppend(v16, CFSTR("ణ"));
    CFStringAppend(v16, CFSTR("త"));
    CFStringAppend(v16, CFSTR("థ"));
    CFStringAppend(v16, CFSTR("ద"));
    CFStringAppend(v16, CFSTR("ధ"));
    CFStringAppend(v16, CFSTR("న"));
    CFStringAppend(v16, CFSTR("ప"));
    CFStringAppend(v16, CFSTR("ఫ"));
    CFStringAppend(v16, CFSTR("బ"));
    CFStringAppend(v16, CFSTR("భ"));
    CFStringAppend(v16, CFSTR("మ"));
    CFStringAppend(v16, CFSTR("య"));
    CFStringAppend(v16, CFSTR("ర"));
    CFStringAppend(v16, CFSTR("ఱ"));
    CFStringAppend(v16, CFSTR("ల"));
    CFStringAppend(v16, CFSTR("ళ"));
    CFStringAppend(v16, CFSTR("ఴ"));
    CFStringAppend(v16, CFSTR("వ"));
    CFStringAppend(v16, CFSTR("శ"));
    CFStringAppend(v16, CFSTR("ష"));
    CFStringAppend(v16, CFSTR("స"));
    CFStringAppend(v16, CFSTR("హ"));
    CFStringAppend(v16, CFSTR("ౝ"));
  }
  v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  v18 = CFStringCreateMutable(0, 0);
  v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
}

void sub_2493E04F8(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLTeluguOrthographyChecker::~TLTeluguOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A54188;
  v2 = this + 8;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 12, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLTeluguOrthographyChecker::~TLTeluguOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLTeluguOrthographyChecker::isVowelSign(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v3;
  CFRange v5;

  v3 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLTeluguOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  if (CFStringCompare(theString1, this[6], 0) == kCFCompareEqualTo)
    return 1;
  v4 = (const __CFCharacterSet *)this[11];
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLTeluguOrthographyChecker::canViramaPrecedeLetter(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  v4 = (const __CFCharacterSet *)*((_QWORD *)this + 11);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFStringCompare(theString, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo;
}

BOOL TLTeluguOrthographyChecker::isInvalidConsecutiveDiacritics(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFRange v7;
  CFIndex location;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFCharacterSet *v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  int CharacterFromSet;
  CFRange result;
  CFRange v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v18.location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v18, 0, &result))
  {
    v5 = 0;
    v6 = 1;
    v7.location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      location = result.location;
      if (!result.location)
      {
        v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location)
        break;
LABEL_25:
      v5 = result.length;
      v22.location = result.length + location;
      v22.length = Length - (result.length + location);
      CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v22, 0, &result);
      v7.location = location;
      if (!CharacterFromSet)
        return (v6 & 1) == 0;
    }
    v7.length = v5;
    v9 = CFStringCreateWithSubstring(0, theString, v7);
    v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFStringCompare(v9, *((CFStringRef *)this + 6), 0) == kCFCompareEqualTo
      && CFStringCompare(v10, *((CFStringRef *)this + 6), 0))
    {
      goto LABEL_19;
    }
    if (CFStringCompare(v10, *((CFStringRef *)this + 4), 0) == kCFCompareEqualTo)
    {
      v12 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
      v19.length = CFStringGetLength(v9);
      v19.location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0))
        goto LABEL_19;
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || (v13 = (const __CFCharacterSet *)*((_QWORD *)this + 9),
           v20.length = CFStringGetLength(v9),
           v20.location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (v14 = (const __CFCharacterSet *)*((_QWORD *)this + 9),
           v21.length = CFStringGetLength(v9),
           v21.location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      v6 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_21;
    }
    else
    {
LABEL_19:
      v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9)
          CFRelease(v9);
        if (!v11)
          return (v6 & 1) == 0;
        location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  v6 = 1;
  return (v6 & 1) == 0;
}

void sub_2493E09C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTeluguOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v11;
  CFRange v12;
  CFRange v13;
  CFRange v14;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v11.location = 0;
  v11.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, this[7], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.location = result.location - 1;
      v12.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v12);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLTeluguOrthographyChecker::canViramaFollowLetter(this, v6))
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLTeluguOrthographyChecker::canViramaPrecedeLetter((TLTeluguOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[7], v14, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493E0B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLTeluguOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  int CharacterFromSet;
  UniChar CharacterAtIndex;
  CFRange result;
  const __CFCharacterSet *v11;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ఁం"));
  v6.location = 0;
  v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, this[8], v6, 0, &result);
    if (!CharacterFromSet)
      break;
    if (result.location + 1 < Length)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[10], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex))
          break;
      }
    }
    v6.location = result.length + result.location;
  }
  if (v5)
    CFRelease(v5);
  return CharacterFromSet != 0;
}

void sub_2493E0C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTeluguOrthographyChecker::isInvalidTeluguLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFRange v5;

  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, this[12], v5, 0, 0) != 0;
}

BOOL TLTeluguOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLTeluguOrthographyChecker::isInvalidConsecutiveDiacritics((TLTeluguOrthographyChecker *)this, a2)
    || TLTeluguOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLTeluguOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[12], v7, 0, 0) == 0;
}

void TLGujaratiOrthographyChecker::TLGujaratiOrthographyChecker(TLGujaratiOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  const void **v6;
  __CFString *Mutable;
  __CFString *v8;
  CFCharacterSetRef v9;
  __CFString *v10;
  __CFString *v11;
  CFCharacterSetRef v12;
  __CFString *v13;
  __CFString *v14;
  CFCharacterSetRef v15;
  __CFString *v16;
  __CFString *v17;
  CFCharacterSetRef v18;
  __CFString *v19;
  __CFString *v20;
  const __CFCharacterSet *v21;
  CFCharacterSetRef InvertedSet;

  *(_OWORD *)((char *)this + 56) = 0u;
  v2 = (const void **)((char *)this + 56);
  *(_OWORD *)((char *)this + 72) = 0u;
  v3 = (const void **)((char *)this + 72);
  *(_QWORD *)this = &off_251A541C8;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 2) = CFSTR("઼");
  *((_QWORD *)this + 3) = CFSTR("્");
  *((_QWORD *)this + 4) = CFSTR("ઃ");
  *((_QWORD *)this + 5) = CFSTR("ં");
  v4 = (const void **)((char *)this + 64);
  *((_QWORD *)this + 6) = CFSTR("ઁ");
  v5 = (const void **)((char *)this + 80);
  *((_QWORD *)this + 11) = 0;
  v6 = (const void **)((char *)this + 88);
  Mutable = CFStringCreateMutable(0, 0);
  v8 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("ા"));
    CFStringAppend(v8, CFSTR("િ"));
    CFStringAppend(v8, CFSTR("ી"));
    CFStringAppend(v8, CFSTR("ુ"));
    CFStringAppend(v8, CFSTR("ૂ"));
    CFStringAppend(v8, CFSTR("ૃ"));
    CFStringAppend(v8, CFSTR("ૄ"));
    CFStringAppend(v8, CFSTR("ૅ"));
    CFStringAppend(v8, CFSTR("ે"));
    CFStringAppend(v8, CFSTR("ૈ"));
    CFStringAppend(v8, CFSTR("ૉ"));
    CFStringAppend(v8, CFSTR("ો"));
    CFStringAppend(v8, CFSTR("ૌ"));
  }
  v9 = CFCharacterSetCreateWithCharactersInString(0, v8);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v9);
  v10 = CFStringCreateMutable(0, 0);
  v11 = v10;
  if (v10)
  {
    CFStringAppend(v10, *((CFStringRef *)this + 2));
    CFStringAppend(v11, *((CFStringRef *)this + 3));
    CFStringAppend(v11, *((CFStringRef *)this + 4));
    CFStringAppend(v11, *((CFStringRef *)this + 5));
    CFStringAppend(v11, *((CFStringRef *)this + 6));
    CFStringAppend(v11, v8);
  }
  v12 = CFCharacterSetCreateWithCharactersInString(0, v11);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v12);
  v13 = CFStringCreateMutable(0, 0);
  v14 = v13;
  if (v13)
  {
    CFStringAppend(v13, CFSTR("ક"));
    CFStringAppend(v14, CFSTR("ખ"));
    CFStringAppend(v14, CFSTR("ગ"));
    CFStringAppend(v14, CFSTR("ઘ"));
    CFStringAppend(v14, CFSTR("ઙ"));
    CFStringAppend(v14, CFSTR("ચ"));
    CFStringAppend(v14, CFSTR("છ"));
    CFStringAppend(v14, CFSTR("જ"));
    CFStringAppend(v14, CFSTR("ઝ"));
    CFStringAppend(v14, CFSTR("ઞ"));
    CFStringAppend(v14, CFSTR("ટ"));
    CFStringAppend(v14, CFSTR("ઠ"));
    CFStringAppend(v14, CFSTR("ડ"));
    CFStringAppend(v14, CFSTR("ઢ"));
    CFStringAppend(v14, CFSTR("ણ"));
    CFStringAppend(v14, CFSTR("ત"));
    CFStringAppend(v14, CFSTR("થ"));
    CFStringAppend(v14, CFSTR("દ"));
    CFStringAppend(v14, CFSTR("ધ"));
    CFStringAppend(v14, CFSTR("ન"));
    CFStringAppend(v14, CFSTR("પ"));
    CFStringAppend(v14, CFSTR("ફ"));
    CFStringAppend(v14, CFSTR("બ"));
    CFStringAppend(v14, CFSTR("ભ"));
    CFStringAppend(v14, CFSTR("મ"));
    CFStringAppend(v14, CFSTR("ય"));
    CFStringAppend(v14, CFSTR("ર"));
    CFStringAppend(v14, CFSTR("લ"));
    CFStringAppend(v14, CFSTR("ળ"));
    CFStringAppend(v14, CFSTR("વ"));
    CFStringAppend(v14, CFSTR("શ"));
    CFStringAppend(v14, CFSTR("ષ"));
    CFStringAppend(v14, CFSTR("સ"));
    CFStringAppend(v14, CFSTR("હ"));
    CFStringAppend(v14, CFSTR("ૐ"));
  }
  v15 = CFCharacterSetCreateWithCharactersInString(0, v14);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, v15);
  v16 = CFStringCreateMutable(0, 0);
  v17 = v16;
  if (v16)
  {
    CFStringAppend(v16, CFSTR("અ"));
    CFStringAppend(v17, CFSTR("આ"));
    CFStringAppend(v17, CFSTR("ઇ"));
    CFStringAppend(v17, CFSTR("ઈ"));
    CFStringAppend(v17, CFSTR("ઉ"));
    CFStringAppend(v17, CFSTR("ઊ"));
    CFStringAppend(v17, CFSTR("ઋ"));
    CFStringAppend(v17, CFSTR("ઌ"));
    CFStringAppend(v17, CFSTR("ઍ"));
    CFStringAppend(v17, CFSTR("એ"));
    CFStringAppend(v17, CFSTR("ઐ"));
    CFStringAppend(v17, CFSTR("ઑ"));
    CFStringAppend(v17, CFSTR("ઓ"));
    CFStringAppend(v17, CFSTR("ઔ"));
  }
  v18 = CFCharacterSetCreateWithCharactersInString(0, v17);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v18);
  v19 = CFStringCreateMutable(0, 0);
  v20 = v19;
  if (v19)
  {
    CFStringAppend(v19, v11);
    CFStringAppend(v20, v17);
    CFStringAppend(v20, v14);
  }
  v21 = CFCharacterSetCreateWithCharactersInString(0, v20);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v21);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v6, InvertedSet);
  if (v21)
    CFRelease(v21);
  if (v20)
    CFRelease(v20);
  if (v17)
    CFRelease(v17);
  if (v14)
    CFRelease(v14);
  if (v11)
    CFRelease(v11);
  if (v8)
    CFRelease(v8);
}

void sub_2493E13AC(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLGujaratiOrthographyChecker::~TLGujaratiOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A541C8;
  v2 = this + 7;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLGujaratiOrthographyChecker::~TLGujaratiOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLGujaratiOrthographyChecker::isVowelSign(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v3;
  CFRange v5;

  v3 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLGujaratiOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  if (CFStringCompare(theString1, this[2], 0) == kCFCompareEqualTo)
    return 1;
  v4 = (const __CFCharacterSet *)this[10];
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLGujaratiOrthographyChecker::canViramaPrecedeLetter(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  v4 = (const __CFCharacterSet *)*((_QWORD *)this + 10);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFStringCompare(theString, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo;
}

BOOL TLGujaratiOrthographyChecker::isInvalidConsecutiveDiacritics(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFRange v7;
  CFIndex location;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFCharacterSet *v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  int CharacterFromSet;
  CFRange result;
  CFRange v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v18.location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v18, 0, &result))
  {
    v5 = 0;
    v6 = 1;
    v7.location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      location = result.location;
      if (!result.location)
      {
        v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location)
        break;
LABEL_25:
      v5 = result.length;
      v22.location = result.length + location;
      v22.length = Length - (result.length + location);
      CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v22, 0, &result);
      v7.location = location;
      if (!CharacterFromSet)
        return (v6 & 1) == 0;
    }
    v7.length = v5;
    v9 = CFStringCreateWithSubstring(0, theString, v7);
    v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFStringCompare(v9, *((CFStringRef *)this + 2), 0) == kCFCompareEqualTo
      && CFStringCompare(v10, *((CFStringRef *)this + 2), 0))
    {
      goto LABEL_19;
    }
    if (CFStringCompare(v10, *((CFStringRef *)this + 5), 0) == kCFCompareEqualTo)
    {
      v12 = (const __CFCharacterSet *)*((_QWORD *)this + 8);
      v19.length = CFStringGetLength(v9);
      v19.location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0))
        goto LABEL_19;
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 6), 0)
       || (v13 = (const __CFCharacterSet *)*((_QWORD *)this + 8),
           v20.length = CFStringGetLength(v9),
           v20.location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || (v14 = (const __CFCharacterSet *)*((_QWORD *)this + 8),
           v21.length = CFStringGetLength(v9),
           v21.location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      v6 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_21;
    }
    else
    {
LABEL_19:
      v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9)
          CFRelease(v9);
        if (!v11)
          return (v6 & 1) == 0;
        location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  v6 = 1;
  return (v6 & 1) == 0;
}

void sub_2493E187C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGujaratiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v11;
  CFRange v12;
  CFRange v13;
  CFRange v14;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v11.location = 0;
  v11.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, this[3], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.location = result.location - 1;
      v12.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v12);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLGujaratiOrthographyChecker::canViramaFollowLetter(this, v6))
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLGujaratiOrthographyChecker::canViramaPrecedeLetter((TLGujaratiOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[3], v14, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493E1A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLGujaratiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  int CharacterFromSet;
  UniChar CharacterAtIndex;
  CFRange result;
  const __CFCharacterSet *v11;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ઁં"));
  v6.location = 0;
  v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, this[7], v6, 0, &result);
    if (!CharacterFromSet)
      break;
    if (result.location + 1 < Length)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[9], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex))
          break;
      }
    }
    v6.location = result.length + result.location;
  }
  if (v5)
    CFRelease(v5);
  return CharacterFromSet != 0;
}

void sub_2493E1B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGujaratiOrthographyChecker::isInvalidGujaratiLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFRange v5;

  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, this[11], v5, 0, 0) != 0;
}

BOOL TLGujaratiOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLGujaratiOrthographyChecker::isInvalidConsecutiveDiacritics((TLGujaratiOrthographyChecker *)this, a2)
    || TLGujaratiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLGujaratiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[11], v7, 0, 0) == 0;
}

void TLUrduOrthographyChecker::TLUrduOrthographyChecker(TLUrduOrthographyChecker *this)
{
  const void **v1;
  __CFString *Mutable;
  __CFString *v3;
  const __CFCharacterSet *v4;
  CFCharacterSetRef InvertedSet;

  *(_QWORD *)this = &off_251A54208;
  *((_QWORD *)this + 1) = 0;
  v1 = (const void **)((char *)this + 8);
  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("ء"));
    CFStringAppend(v3, CFSTR("آ"));
    CFStringAppend(v3, CFSTR("ؤ"));
    CFStringAppend(v3, CFSTR("ئ"));
    CFStringAppend(v3, CFSTR("ا"));
    CFStringAppend(v3, CFSTR("ب"));
    CFStringAppend(v3, CFSTR("ت"));
    CFStringAppend(v3, CFSTR("ث"));
    CFStringAppend(v3, CFSTR("ج"));
    CFStringAppend(v3, CFSTR("ح"));
    CFStringAppend(v3, CFSTR("خ"));
    CFStringAppend(v3, CFSTR("د"));
    CFStringAppend(v3, CFSTR("ذ"));
    CFStringAppend(v3, CFSTR("ر"));
    CFStringAppend(v3, CFSTR("ز"));
    CFStringAppend(v3, CFSTR("س"));
    CFStringAppend(v3, CFSTR("ش"));
    CFStringAppend(v3, CFSTR("ص"));
    CFStringAppend(v3, CFSTR("ض"));
    CFStringAppend(v3, CFSTR("ط"));
    CFStringAppend(v3, CFSTR("ظ"));
    CFStringAppend(v3, CFSTR("ع"));
    CFStringAppend(v3, CFSTR("غ"));
    CFStringAppend(v3, CFSTR("ـ"));
    CFStringAppend(v3, CFSTR("ف"));
    CFStringAppend(v3, CFSTR("ق"));
    CFStringAppend(v3, CFSTR("ل"));
    CFStringAppend(v3, CFSTR("م"));
    CFStringAppend(v3, CFSTR("ن"));
    CFStringAppend(v3, CFSTR("و"));
    CFStringAppend(v3, CFSTR("ً"));
    CFStringAppend(v3, CFSTR("ٌ"));
    CFStringAppend(v3, CFSTR("ٍ"));
    CFStringAppend(v3, CFSTR("َ"));
    CFStringAppend(v3, CFSTR("ُ"));
    CFStringAppend(v3, CFSTR("ِ"));
    CFStringAppend(v3, CFSTR("ّ"));
    CFStringAppend(v3, CFSTR("ْ"));
    CFStringAppend(v3, CFSTR("ٖ"));
    CFStringAppend(v3, CFSTR("ٗ"));
    CFStringAppend(v3, CFSTR("٘"));
    CFStringAppend(v3, CFSTR("ٰ"));
    CFStringAppend(v3, CFSTR("ٹ"));
    CFStringAppend(v3, CFSTR("پ"));
    CFStringAppend(v3, CFSTR("چ"));
    CFStringAppend(v3, CFSTR("ڈ"));
    CFStringAppend(v3, CFSTR("ڑ"));
    CFStringAppend(v3, CFSTR("ژ"));
    CFStringAppend(v3, CFSTR("ک"));
    CFStringAppend(v3, CFSTR("گ"));
    CFStringAppend(v3, CFSTR("ں"));
    CFStringAppend(v3, CFSTR("ھ"));
    CFStringAppend(v3, CFSTR("ہ"));
    CFStringAppend(v3, CFSTR("ۂ"));
    CFStringAppend(v3, CFSTR("ۃ"));
    CFStringAppend(v3, CFSTR("ی"));
    CFStringAppend(v3, CFSTR("ے"));
    CFStringAppend(v3, CFSTR("ۓ"));
    CFStringAppend(v3, CFSTR("ࣿ"));
  }
  v4 = CFCharacterSetCreateWithCharactersInString(0, v3);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v1, InvertedSet);
  if (v4)
    CFRelease(v4);
  if (v3)
    CFRelease(v3);
}

void sub_2493E2050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  const void **v10;

  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString *>::reset(&a10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v10, 0);
  _Unwind_Resume(a1);
}

void TLUrduOrthographyChecker::~TLUrduOrthographyChecker(const void **this)
{
  *this = &off_251A54208;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
}

{
  *this = &off_251A54208;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
}

{
  *this = &off_251A54208;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
  JUMPOUT(0x2495AFA48);
}

BOOL TLUrduOrthographyChecker::allValidUrduLetters(CFCharacterSetRef *this, CFStringRef theString)
{
  CFRange v5;

  v5.length = CFStringGetLength(theString);
  v5.location = 0;
  return CFStringFindCharacterFromSet(theString, this[1], v5, 0, 0) == 0;
}

BOOL TLUrduOrthographyChecker::checkSpelling(CFCharacterSetRef *this, CFStringRef theString, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  v7.length = CFStringGetLength(theString);
  v7.location = 0;
  return CFStringFindCharacterFromSet(theString, this[1], v7, 0, 0) == 0;
}

const char *_nlpLoggingSubsystem()
{
  return "com.apple.Transliteration";
}

uint64_t _nlpDefaultLog()
{
  if (_nlpDefaultLog::token != -1)
    dispatch_once(&_nlpDefaultLog::token, &__block_literal_global);
  return _nlpDefaultLog::log;
}

os_log_t ___nlpDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Transliteration", "TransliterationDefaultLog");
  _nlpDefaultLog::log = (uint64_t)result;
  return result;
}

uint64_t _nlpSignpostLog()
{
  if (_nlpSignpostLog::token != -1)
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_2);
  return _nlpSignpostLog::log;
}

os_log_t ___nlpSignpostLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Transliteration", "TransliterationSignposts");
  _nlpSignpostLog::log = (uint64_t)result;
  return result;
}

void TLMalayalamOrthographyChecker::TLMalayalamOrthographyChecker(TLMalayalamOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  __CFString *Mutable;
  __CFString *v7;
  CFCharacterSetRef v8;
  __CFString *v9;
  __CFString *v10;
  CFCharacterSetRef v11;
  __CFString *v12;
  __CFString *v13;
  CFCharacterSetRef v14;
  __CFString *v15;
  __CFString *v16;
  CFCharacterSetRef v17;
  __CFString *v18;
  __CFString *v19;
  const __CFCharacterSet *v20;
  CFCharacterSetRef InvertedSet;
  const void **v22;

  *((_OWORD *)this + 3) = 0u;
  v2 = (const void **)((char *)this + 48);
  v3 = (const void **)((char *)this + 56);
  *((_OWORD *)this + 4) = 0u;
  v4 = (const void **)((char *)this + 64);
  *(_QWORD *)this = &off_251A542C8;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 4) = CFSTR("ഃ");
  *((_QWORD *)this + 5) = CFSTR("്");
  *((_QWORD *)this + 2) = CFSTR("ഁ");
  *((_QWORD *)this + 3) = CFSTR("ം");
  v22 = (const void **)((char *)this + 72);
  *((_QWORD *)this + 10) = 0;
  v5 = (const void **)((char *)this + 80);
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("അ"));
    CFStringAppend(v7, CFSTR("ആ"));
    CFStringAppend(v7, CFSTR("ഇ"));
    CFStringAppend(v7, CFSTR("ഈ"));
    CFStringAppend(v7, CFSTR("ഉ"));
    CFStringAppend(v7, CFSTR("ഊ"));
    CFStringAppend(v7, CFSTR("ഋ"));
    CFStringAppend(v7, CFSTR("ഌ"));
    CFStringAppend(v7, CFSTR("എ"));
    CFStringAppend(v7, CFSTR("ഏ"));
    CFStringAppend(v7, CFSTR("ഐ"));
    CFStringAppend(v7, CFSTR("ഒ"));
    CFStringAppend(v7, CFSTR("ഓ"));
    CFStringAppend(v7, CFSTR("ഔ"));
  }
  v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  v9 = CFStringCreateMutable(0, 0);
  v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, CFSTR("ാ"));
    CFStringAppend(v10, CFSTR("ി"));
    CFStringAppend(v10, CFSTR("ീ"));
    CFStringAppend(v10, CFSTR("ു"));
    CFStringAppend(v10, CFSTR("ൂ"));
    CFStringAppend(v10, CFSTR("ൃ"));
    CFStringAppend(v10, CFSTR("ൄ"));
    CFStringAppend(v10, CFSTR("െ"));
    CFStringAppend(v10, CFSTR("േ"));
    CFStringAppend(v10, CFSTR("ൈ"));
    CFStringAppend(v10, CFSTR("ൊ"));
    CFStringAppend(v10, CFSTR("ോ"));
    CFStringAppend(v10, CFSTR("ൌ"));
    CFStringAppend(v10, CFSTR("ൗ"));
  }
  v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  v12 = CFStringCreateMutable(0, 0);
  v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  v15 = CFStringCreateMutable(0, 0);
  v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, CFSTR("ക"));
    CFStringAppend(v16, CFSTR("ഖ"));
    CFStringAppend(v16, CFSTR("ഗ"));
    CFStringAppend(v16, CFSTR("ഘ"));
    CFStringAppend(v16, CFSTR("ങ"));
    CFStringAppend(v16, CFSTR("ച"));
    CFStringAppend(v16, CFSTR("ഛ"));
    CFStringAppend(v16, CFSTR("ജ"));
    CFStringAppend(v16, CFSTR("ഝ"));
    CFStringAppend(v16, CFSTR("ഞ"));
    CFStringAppend(v16, CFSTR("ട"));
    CFStringAppend(v16, CFSTR("ഠ"));
    CFStringAppend(v16, CFSTR("ഡ"));
    CFStringAppend(v16, CFSTR("ഢ"));
    CFStringAppend(v16, CFSTR("ണ"));
    CFStringAppend(v16, CFSTR("ത"));
    CFStringAppend(v16, CFSTR("ഥ"));
    CFStringAppend(v16, CFSTR("ദ"));
    CFStringAppend(v16, CFSTR("ധ"));
    CFStringAppend(v16, CFSTR("ന"));
    CFStringAppend(v16, CFSTR("ഩ"));
    CFStringAppend(v16, CFSTR("പ"));
    CFStringAppend(v16, CFSTR("ഫ"));
    CFStringAppend(v16, CFSTR("ബ"));
    CFStringAppend(v16, CFSTR("ഭ"));
    CFStringAppend(v16, CFSTR("മ"));
    CFStringAppend(v16, CFSTR("യ"));
    CFStringAppend(v16, CFSTR("ര"));
    CFStringAppend(v16, CFSTR("റ"));
    CFStringAppend(v16, CFSTR("ല"));
    CFStringAppend(v16, CFSTR("ള"));
    CFStringAppend(v16, CFSTR("ഴ"));
    CFStringAppend(v16, CFSTR("വ"));
    CFStringAppend(v16, CFSTR("ശ"));
    CFStringAppend(v16, CFSTR("ഷ"));
    CFStringAppend(v16, CFSTR("സ"));
    CFStringAppend(v16, CFSTR("ഹ"));
    CFStringAppend(v16, CFSTR("ഺ"));
    CFStringAppend(v16, CFSTR("ൺ"));
    CFStringAppend(v16, CFSTR("ൻ"));
    CFStringAppend(v16, CFSTR("ർ"));
    CFStringAppend(v16, CFSTR("ൽ"));
    CFStringAppend(v16, CFSTR("ൾ"));
    CFStringAppend(v16, CFSTR("ൿ"));
  }
  v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  v18 = CFStringCreateMutable(0, 0);
  v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
}

void sub_2493E29B0(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLMalayalamOrthographyChecker::~TLMalayalamOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A542C8;
  v2 = this + 6;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLMalayalamOrthographyChecker::~TLMalayalamOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLMalayalamOrthographyChecker::canViramaPrecedeLetter(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  const __CFCharacterSet *v4;
  UniChar CharacterAtIndex;

  v4 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
  CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFStringCompare(theString, *((CFStringRef *)this + 1), 0) == kCFCompareEqualTo;
}

BOOL TLMalayalamOrthographyChecker::isInvalidConsecutiveDiacritics(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFRange v7;
  CFIndex location;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFCharacterSet *v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  int CharacterFromSet;
  CFRange result;
  CFRange v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v18.location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v18, 0, &result))
  {
    v5 = 0;
    v6 = 1;
    v7.location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      location = result.location;
      if (!result.location)
      {
        v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location)
        break;
LABEL_22:
      v5 = result.length;
      v22.location = result.length + location;
      v22.length = Length - (result.length + location);
      CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v22, 0, &result);
      v7.location = location;
      if (!CharacterFromSet)
        return (v6 & 1) == 0;
    }
    v7.length = v5;
    v9 = CFStringCreateWithSubstring(0, theString, v7);
    v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFStringCompare(v10, *((CFStringRef *)this + 3), 0) == kCFCompareEqualTo)
    {
      v12 = (const __CFCharacterSet *)*((_QWORD *)this + 7);
      v19.length = CFStringGetLength(v9);
      v19.location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0))
        goto LABEL_16;
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 2), 0)
       || (v13 = (const __CFCharacterSet *)*((_QWORD *)this + 7),
           v20.length = CFStringGetLength(v9),
           v20.location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || (v14 = (const __CFCharacterSet *)*((_QWORD *)this + 7),
           v21.length = CFStringGetLength(v9),
           v21.location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      v6 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_18;
    }
    else
    {
LABEL_16:
      v11 = 1;
      if (!v10)
      {
LABEL_18:
        if (v9)
          CFRelease(v9);
        if (!v11)
          return (v6 & 1) == 0;
        location = result.location;
        goto LABEL_22;
      }
    }
    CFRelease(v10);
    goto LABEL_18;
  }
  v6 = 1;
  return (v6 & 1) == 0;
}

void sub_2493E2DA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLMalayalamOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFCharacterSet *v8;
  UniChar CharacterAtIndex;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v13;
  CFRange v14;
  CFRange v15;
  CFRange v16;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v13.location = 0;
  v13.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 5), v13, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v14.location = result.location - 1;
      v14.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v14);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v15.length = 1;
        v15.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v15);
      }
      v8 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
      CharacterAtIndex = CFStringGetCharacterAtIndex(v6, 0);
      if (!CFCharacterSetIsCharacterMember(v8, CharacterAtIndex))
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLMalayalamOrthographyChecker::canViramaPrecedeLetter(this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v16.location = result.length + result.location;
        v16.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 5), v16, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493E2F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLMalayalamOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  int CharacterFromSet;
  UniChar CharacterAtIndex;
  CFRange result;
  const __CFCharacterSet *v11;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ഁം"));
  v6.location = 0;
  v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, this[6], v6, 0, &result);
    if (!CharacterFromSet)
      break;
    if (result.location + 1 < Length)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[8], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex))
          break;
      }
    }
    v6.location = result.length + result.location;
  }
  if (v5)
    CFRelease(v5);
  return CharacterFromSet != 0;
}

void sub_2493E304C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLMalayalamOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLMalayalamOrthographyChecker::isInvalidConsecutiveDiacritics((TLMalayalamOrthographyChecker *)this, a2)
    || TLMalayalamOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((TLMalayalamOrthographyChecker *)this, a2)|| TLMalayalamOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[10], v7, 0, 0) == 0;
}

void TLKannadaOrthographyChecker::TLKannadaOrthographyChecker(TLKannadaOrthographyChecker *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  __CFString *Mutable;
  __CFString *v7;
  CFCharacterSetRef v8;
  __CFString *v9;
  __CFString *v10;
  CFCharacterSetRef v11;
  __CFString *v12;
  __CFString *v13;
  CFCharacterSetRef v14;
  __CFString *v15;
  __CFString *v16;
  CFCharacterSetRef v17;
  __CFString *v18;
  __CFString *v19;
  const __CFCharacterSet *v20;
  CFCharacterSetRef InvertedSet;
  const void **v22;

  *((_OWORD *)this + 4) = 0u;
  v2 = (const void **)((char *)this + 64);
  v3 = (const void **)((char *)this + 72);
  *((_OWORD *)this + 5) = 0u;
  v4 = (const void **)((char *)this + 80);
  *(_QWORD *)this = &off_251A54308;
  *((_QWORD *)this + 1) = CFSTR("‍");
  *((_QWORD *)this + 6) = CFSTR("಼");
  *((_QWORD *)this + 7) = CFSTR("್");
  *((_QWORD *)this + 4) = CFSTR("ಂ");
  *((_QWORD *)this + 5) = CFSTR("ಃ");
  *((_QWORD *)this + 2) = CFSTR("ಀ");
  *((_QWORD *)this + 3) = CFSTR("ಁ");
  v22 = (const void **)((char *)this + 88);
  *((_QWORD *)this + 12) = 0;
  v5 = (const void **)((char *)this + 96);
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("ಅ"));
    CFStringAppend(v7, CFSTR("ಆ"));
    CFStringAppend(v7, CFSTR("ಇ"));
    CFStringAppend(v7, CFSTR("ಈ"));
    CFStringAppend(v7, CFSTR("ಉ"));
    CFStringAppend(v7, CFSTR("ಊ"));
    CFStringAppend(v7, CFSTR("ಋ"));
    CFStringAppend(v7, CFSTR("ಌ"));
    CFStringAppend(v7, CFSTR("ಎ"));
    CFStringAppend(v7, CFSTR("ಏ"));
    CFStringAppend(v7, CFSTR("ಐ"));
    CFStringAppend(v7, CFSTR("ಒ"));
    CFStringAppend(v7, CFSTR("ಓ"));
    CFStringAppend(v7, CFSTR("ಔ"));
  }
  v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  v9 = CFStringCreateMutable(0, 0);
  v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, CFSTR("ಾ"));
    CFStringAppend(v10, CFSTR("ಿ"));
    CFStringAppend(v10, CFSTR("ೀ"));
    CFStringAppend(v10, CFSTR("ು"));
    CFStringAppend(v10, CFSTR("ೂ"));
    CFStringAppend(v10, CFSTR("ೃ"));
    CFStringAppend(v10, CFSTR("ೄ"));
    CFStringAppend(v10, CFSTR("ೆ"));
    CFStringAppend(v10, CFSTR("ೇ"));
    CFStringAppend(v10, CFSTR("ೈ"));
    CFStringAppend(v10, CFSTR("ೊ"));
    CFStringAppend(v10, CFSTR("ೋ"));
    CFStringAppend(v10, CFSTR("ೌ"));
  }
  v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  v12 = CFStringCreateMutable(0, 0);
  v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 6));
    CFStringAppend(v13, *((CFStringRef *)this + 7));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  v15 = CFStringCreateMutable(0, 0);
  v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, CFSTR("ಕ"));
    CFStringAppend(v16, CFSTR("ಖ"));
    CFStringAppend(v16, CFSTR("ಗ"));
    CFStringAppend(v16, CFSTR("ಘ"));
    CFStringAppend(v16, CFSTR("ಙ"));
    CFStringAppend(v16, CFSTR("ಚ"));
    CFStringAppend(v16, CFSTR("ಛ"));
    CFStringAppend(v16, CFSTR("ಜ"));
    CFStringAppend(v16, CFSTR("ಝ"));
    CFStringAppend(v16, CFSTR("ಞ"));
    CFStringAppend(v16, CFSTR("ಟ"));
    CFStringAppend(v16, CFSTR("ಠ"));
    CFStringAppend(v16, CFSTR("ಡ"));
    CFStringAppend(v16, CFSTR("ಢ"));
    CFStringAppend(v16, CFSTR("ಣ"));
    CFStringAppend(v16, CFSTR("ತ"));
    CFStringAppend(v16, CFSTR("ಥ"));
    CFStringAppend(v16, CFSTR("ದ"));
    CFStringAppend(v16, CFSTR("ಧ"));
    CFStringAppend(v16, CFSTR("ನ"));
    CFStringAppend(v16, CFSTR("ಪ"));
    CFStringAppend(v16, CFSTR("ಫ"));
    CFStringAppend(v16, CFSTR("ಬ"));
    CFStringAppend(v16, CFSTR("ಭ"));
    CFStringAppend(v16, CFSTR("ಮ"));
    CFStringAppend(v16, CFSTR("ಯ"));
    CFStringAppend(v16, CFSTR("ರ"));
    CFStringAppend(v16, CFSTR("ಱ"));
    CFStringAppend(v16, CFSTR("ಲ"));
    CFStringAppend(v16, CFSTR("ಳ"));
    CFStringAppend(v16, CFSTR("ವ"));
    CFStringAppend(v16, CFSTR("ಶ"));
    CFStringAppend(v16, CFSTR("ಷ"));
    CFStringAppend(v16, CFSTR("ಸ"));
    CFStringAppend(v16, CFSTR("ಹ"));
    CFStringAppend(v16, CFSTR("ೝ"));
  }
  v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  v18 = CFStringCreateMutable(0, 0);
  v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
}

void sub_2493E3770(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  const void **v3;
  const void **v4;
  const void **v5;
  const void *v7;
  va_list va;
  const void *v9;
  va_list va1;
  const void *v11;
  va_list va2;
  const void *v13;
  va_list va3;
  const void *v15;
  va_list va4;
  va_list va5;

  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLKannadaOrthographyChecker::~TLKannadaOrthographyChecker(const void **this)
{
  const void **v2;

  *this = &off_251A54308;
  v2 = this + 8;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 12, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  TLKannadaOrthographyChecker::~TLKannadaOrthographyChecker(this);
  JUMPOUT(0x2495AFA48);
}

BOOL TLKannadaOrthographyChecker::isInvalidConsecutiveDiacritics(TLKannadaOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  char v6;
  CFRange v7;
  CFIndex location;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFCharacterSet *v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  int CharacterFromSet;
  CFRange result;
  CFRange v18;
  CFRange v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v18.location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v18, 0, &result))
  {
    v5 = 0;
    v6 = 1;
    v7.location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      location = result.location;
      if (!result.location)
      {
        v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location)
        break;
LABEL_25:
      v5 = result.length;
      v22.location = result.length + location;
      v22.length = Length - (result.length + location);
      CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v22, 0, &result);
      v7.location = location;
      if (!CharacterFromSet)
        return (v6 & 1) == 0;
    }
    v7.length = v5;
    v9 = CFStringCreateWithSubstring(0, theString, v7);
    v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFStringCompare(v9, *((CFStringRef *)this + 6), 0) == kCFCompareEqualTo
      && CFStringCompare(v10, *((CFStringRef *)this + 6), 0))
    {
      goto LABEL_19;
    }
    if (CFStringCompare(v10, *((CFStringRef *)this + 4), 0) == kCFCompareEqualTo)
    {
      v12 = (const __CFCharacterSet *)*((_QWORD *)this + 9);
      v19.length = CFStringGetLength(v9);
      v19.location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0))
        goto LABEL_19;
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || (v13 = (const __CFCharacterSet *)*((_QWORD *)this + 9),
           v20.length = CFStringGetLength(v9),
           v20.location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (v14 = (const __CFCharacterSet *)*((_QWORD *)this + 9),
           v21.length = CFStringGetLength(v9),
           v21.location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      v6 = 0;
      v11 = 0;
      if (!v10)
        goto LABEL_21;
    }
    else
    {
LABEL_19:
      v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9)
          CFRelease(v9);
        if (!v11)
          return (v6 & 1) == 0;
        location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  v6 = 1;
  return (v6 & 1) == 0;
}

void sub_2493E3B2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLKannadaOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 canViramaPrecedeLetter;
  CFRange result;
  CFRange v11;
  CFRange v12;
  CFRange v13;
  CFRange v14;

  Length = CFStringGetLength(theString);
  result = (CFRange)xmmword_2493E9370;
  v11.location = 0;
  v11.length = Length;
  v5 = 1;
  if (CFStringFindWithOptions(theString, this[7], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.location = result.location - 1;
      v12.length = 1;
      v6 = CFStringCreateWithSubstring(0, theString, v12);
      v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.location = result.location + 1;
        v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLTeluguOrthographyChecker::canViramaFollowLetter(this, v6))
        break;
      if (v7)
      {
        canViramaPrecedeLetter = TLTeluguOrthographyChecker::canViramaPrecedeLetter((TLTeluguOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      canViramaPrecedeLetter = 1;
      if (v6)
        goto LABEL_11;
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[7], v14, 0, &result))
          continue;
      }
      return (v5 & 1) == 0;
    }
    canViramaPrecedeLetter = 0;
    v5 = 0;
    if (v7)
LABEL_9:
      CFRelease(v7);
    if (!v6)
      goto LABEL_12;
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_2493E3CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

BOOL TLKannadaOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length;
  const __CFCharacterSet *v5;
  CFRange v6;
  int CharacterFromSet;
  UniChar CharacterAtIndex;
  CFRange result;
  const __CFCharacterSet *v11;

  Length = CFStringGetLength(theString);
  v5 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ಁಂ"));
  v6.location = 0;
  v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    CharacterFromSet = CFStringFindCharacterFromSet(theString, this[8], v6, 0, &result);
    if (!CharacterFromSet)
      break;
    if (result.location + 1 < Length)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[10], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex))
          break;
      }
    }
    v6.location = result.length + result.location;
  }
  if (v5)
    CFRelease(v5);
  return CharacterFromSet != 0;
}

void sub_2493E3DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLKannadaOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  CFRange v7;

  if (TLKannadaOrthographyChecker::isInvalidConsecutiveDiacritics((TLKannadaOrthographyChecker *)this, a2)
    || TLKannadaOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLKannadaOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  return CFStringFindCharacterFromSet(a2, this[12], v7, 0, 0) == 0;
}

uint64_t TLLanguageModel::create@<X0>(std::string *this@<X0>, TLLanguageModelStr **a2@<X8>)
{
  TLLanguageModelStr *v5;
  uint64_t result;

  v5 = (TLLanguageModelStr *)operator new();
  TLLanguageModelStr::TLLanguageModelStr(v5);
  result = TLLanguageModelStr::load(v5, this);
  if ((result & 1) == 0)
  {
    result = (*(uint64_t (**)(TLLanguageModelStr *))(*(_QWORD *)v5 + 16))(v5);
    v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_2493E3ECC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void TLCompositeTransliterator::TLCompositeTransliterator(TLCompositeTransliterator *this, const __CFLocale *a2, const __CFURL *a3, int a4, int a5)
{
  TL::StringMap ***v9;
  const void ***v10;
  TLMalayalamOrthographyChecker **v11;
  TLCompositeTransliteratorSeq2Seq *v12;
  uint64_t v13;
  TLCompositeTransliteratorException *v14;
  TLCompositeTransliteratorLexicon *v15;
  const __CFString *v16;
  const __CFString *Value;
  TLMalayalamOrthographyChecker *v18;
  TLMalayalamOrthographyChecker *v19;
  CFTypeID TypeID;
  CFStringRef v21;
  const __CFString *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFAllocator *v27;
  CFMutableStringRef Mutable;
  const __CFString *v29;
  uint64_t v30;
  CFURLRef v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *__p[2];
  void *v41[4];
  id v42;
  CFTypeRef cf[5];
  __int128 v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  void *v48;
  CFTypeRef v49;

  *(_OWORD *)this = 0u;
  v9 = (TL::StringMap ***)((char *)this + 8);
  *((_OWORD *)this + 1) = 0u;
  v10 = (const void ***)((char *)this + 16);
  *((_QWORD *)this + 5) = 0;
  v11 = (TLMalayalamOrthographyChecker **)((char *)this + 40);
  *((_QWORD *)this + 6) = 0;
  if (a5)
  {
    v12 = (TLCompositeTransliteratorSeq2Seq *)operator new();
    TLCompositeTransliteratorSeq2Seq::TLCompositeTransliteratorSeq2Seq(v12, a2, a3);
    v13 = *(_QWORD *)this;
    *(_QWORD *)this = v12;
    if (v13)
      std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100]((uint64_t)this, v13);
  }
  v14 = (TLCompositeTransliteratorException *)operator new();
  TLCompositeTransliteratorException::TLCompositeTransliteratorException(v14, a2, a3);
  std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100](v9, (TL::StringMap **)v14);
  v15 = (TLCompositeTransliteratorLexicon *)operator new();
  TLCompositeTransliteratorLexicon::TLCompositeTransliteratorLexicon(v15, a2);
  std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100](v10, (const void **)v15);
  v16 = (const __CFString *)*MEMORY[0x24BDBD418];
  Value = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  if (CFStringCompare(Value, CFSTR("hi"), 0) && CFStringCompare(Value, CFSTR("mr"), 0))
  {
    if (CFStringCompare(Value, CFSTR("bn"), 0))
    {
      if (CFStringCompare(Value, CFSTR("gu"), 0))
      {
        if (CFStringCompare(Value, CFSTR("ur"), 0))
        {
          if (CFStringCompare(Value, CFSTR("pa"), 0))
          {
            if (CFStringCompare(Value, CFSTR("te"), 0))
            {
              if (CFStringCompare(Value, CFSTR("ta"), 0))
              {
                if (CFStringCompare(Value, CFSTR("kn"), 0))
                {
                  if (CFStringCompare(Value, CFSTR("ml"), 0))
                    goto LABEL_18;
                  v18 = (TLMalayalamOrthographyChecker *)operator new();
                  TLMalayalamOrthographyChecker::TLMalayalamOrthographyChecker(v18);
                }
                else
                {
                  v18 = (TLMalayalamOrthographyChecker *)operator new();
                  TLKannadaOrthographyChecker::TLKannadaOrthographyChecker(v18);
                }
              }
              else
              {
                v18 = (TLMalayalamOrthographyChecker *)operator new();
                TLTamilOrthographyChecker::TLTamilOrthographyChecker(v18);
              }
            }
            else
            {
              v18 = (TLMalayalamOrthographyChecker *)operator new();
              TLTeluguOrthographyChecker::TLTeluguOrthographyChecker(v18);
            }
          }
          else
          {
            v18 = (TLMalayalamOrthographyChecker *)operator new();
            TLGurmukhiOrthographyChecker::TLGurmukhiOrthographyChecker(v18);
          }
        }
        else
        {
          v18 = (TLMalayalamOrthographyChecker *)operator new();
          TLUrduOrthographyChecker::TLUrduOrthographyChecker(v18);
        }
      }
      else
      {
        v18 = (TLMalayalamOrthographyChecker *)operator new();
        TLGujaratiOrthographyChecker::TLGujaratiOrthographyChecker(v18);
      }
    }
    else
    {
      v18 = (TLMalayalamOrthographyChecker *)operator new();
      TLBengaliOrthographyChecker::TLBengaliOrthographyChecker(v18);
    }
  }
  else
  {
    v18 = (TLMalayalamOrthographyChecker *)operator new();
    TLDevanagariOrthographyChecker::TLDevanagariOrthographyChecker(v18, Value);
  }
  v19 = *v11;
  *v11 = v18;
  if (v19)
    (*(void (**)(TLMalayalamOrthographyChecker *))(*(_QWORD *)v19 + 8))(v19);
LABEL_18:
  if (a4)
  {
    memset(v41, 0, sizeof(v41));
    *(_OWORD *)__p = 0u;
    if (Value && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(Value)))
      applesauce::CF::details::CFString_get_value<false>(Value, (uint64_t)&v44);
    else
      std::string::basic_string[abi:ne180100]<0>(&v44, "");
    if (SHIBYTE(v41[0]) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v44;
    v41[0] = (void *)v45;
    if (a3)
    {
      v21 = CFURLCopyPath(a3);
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)cf, v21);
      v22 = (const __CFString *)cf[0];
      if (cf[0] && (v23 = CFStringGetTypeID(), v23 == CFGetTypeID(v22)))
        applesauce::CF::details::CFString_get_value<false>(v22, (uint64_t)&v44);
      else
        std::string::basic_string[abi:ne180100]<0>(&v44, "");
      if (SHIBYTE(v41[3]) < 0)
        operator delete(v41[1]);
      *(_OWORD *)&v41[1] = v44;
      v41[3] = (void *)v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      if (cf[0])
        CFRelease(cf[0]);
    }
    TLLanguageModel::create((std::string *)__p, (TLLanguageModelStr **)&v44);
    v24 = v44;
    *(_QWORD *)&v44 = 0;
    v25 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v24;
    if (v25)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25);
      v26 = v44;
      *(_QWORD *)&v44 = 0;
      if (v26)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 16))(v26);
      v24 = *((_QWORD *)this + 3);
    }
    if (v24)
    {
      *(_QWORD *)&v44 = 0;
      *((_QWORD *)&v44 + 1) = &v44;
      v45 = 0x3812000000;
      v46 = __Block_byref_object_copy__3;
      v47 = __Block_byref_object_dispose__3;
      v48 = &unk_2493ECF5D;
      v49 = 0;
      if (a3)
      {
        v27 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        cf[0] = Mutable;
        v29 = (const __CFString *)CFLocaleGetValue(a2, v16);
        if (Mutable)
        {
          CFStringAppend(Mutable, v29);
          CFStringAppend(Mutable, CFSTR(".lm/Info.plist"));
        }
        v30 = *((_QWORD *)&v44 + 1);
        v31 = CFURLCreateCopyAppendingPathComponent(v27, a3, Mutable, 1u);
        nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v30 + 48), v31);
        if (Mutable)
          CFRelease(Mutable);
      }
      else
      {
        cf[0] = (CFTypeRef)MEMORY[0x24BDAC760];
        cf[1] = (CFTypeRef)3221225472;
        cf[2] = ___ZL30loadLMSpecificModulatingFactorPK10__CFLocalePK7__CFURL_block_invoke;
        cf[3] = &unk_251A53E68;
        cf[4] = &v44;
        LDEnumerateAssetDataItems();
      }
      v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 48);
      v42 = 0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v32, &v42);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v42;
      if (v33)
      {
        objc_msgSend(v33, "objectForKey:", CFSTR("LMWeightTransliteration"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v36 = 0.25;
        if (v37 > 0.0)
        {
          objc_msgSend(v35, "doubleValue");
          if (v38 < 1.0)
          {
            objc_msgSend(v35, "doubleValue");
            v36 = v39;
          }
        }

      }
      else
      {
        v36 = 0.25;
      }

      _Block_object_dispose(&v44, 8);
      if (v49)
        CFRelease(v49);
      *((double *)this + 4) = v36;
    }
    if (SHIBYTE(v41[3]) < 0)
      operator delete(v41[1]);
    if (SHIBYTE(v41[0]) < 0)
      operator delete(__p[0]);
  }
}

void sub_2493E45A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void **a10)
{
  uint64_t *v10;
  TL::StringMap ***v11;
  const void ***v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  MEMORY[0x2495AFA48](v14, 0xE1C404007A923);
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(a10, 0);
  v16 = *v13;
  *v13 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = v10[3];
  v10[3] = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
  std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100](v12, 0);
  std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100](v11, 0);
  v18 = *v10;
  *v10 = 0;
  if (v18)
    std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100]((uint64_t)v10, v18);
  _Unwind_Resume(a1);
}

TL::StringMap **std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100](TL::StringMap ***a1, TL::StringMap **a2)
{
  TL::StringMap **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliteratorException::~TLCompositeTransliteratorException(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

const void **std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  const void **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliteratorLexicon::~TLCompositeTransliteratorLexicon(result);
    JUMPOUT(0x2495AFA48);
  }
  return result;
}

void TLLanguageModelCreateOptions::~TLLanguageModelCreateOptions(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void TLCompositeTransliterator::~TLCompositeTransliterator(TLCompositeTransliterator *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset((const void **)this + 6, 0);
  v2 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100]((const void ***)this + 2, 0);
  std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100]((TL::StringMap ***)this + 1, 0);
  v4 = *(_QWORD *)this;
  *(_QWORD *)this = 0;
  if (v4)
    std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100]((uint64_t)this, v4);
}

uint64_t TLCompositeTransliterator::isTransliteratedWordInLexiconForCandidate(TLCompositeTransliterator *this, const TLCompositeTransliteratorCandidate *a2)
{
  std::string::size_type size;
  uint64_t isMemberOfTheNativeLexicon;
  std::string __p;

  if (*((char *)a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  else
    __p = *(std::string *)((_BYTE *)a2 + 1);
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (!size)
  {
    isMemberOfTheNativeLexicon = 0;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      return isMemberOfTheNativeLexicon;
    goto LABEL_8;
  }
  isMemberOfTheNativeLexicon = TLCompositeTransliteratorLexicon::isMemberOfTheNativeLexicon(*((_QWORD *)this + 2), (uint64_t)&__p);
  if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_8:
    operator delete(__p.__r_.__value_.__l.__data_);
  return isMemberOfTheNativeLexicon;
}

void sub_2493E4964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unint64_t TLCompositeTransliterator::updateCandidatesWithEmojiCandidates(uint64_t a1, _QWORD *a2)
{
  __int128 *v3;
  __int128 v4;
  unint64_t v5;
  const void *EmojiTokensForString;
  CFIndex i;
  const __CFString *String;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  uint64_t v12;
  std::string *v13;
  char *v14;
  _BOOL4 v15;
  uint64_t v16;
  const void *v17;
  const void *v18;
  int v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  std::string *v24;
  uint64_t v26;
  double v27;
  BOOL v28;
  void *__p[2];
  std::string::size_type v30;
  CFTypeRef cf;
  CFTypeRef CFStringFromString;
  std::string v33;
  std::string v34;
  const void **v35;
  std::string *v36;
  unint64_t v37;
  void **v38;

  if (!*(_QWORD *)(a1 + 48))
    return 0;
  v3 = (__int128 *)*a2;
  if (*a2 == a2[1])
    return 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
    v3 = (__int128 *)*a2;
  }
  else
  {
    v4 = *v3;
    v34.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)v3 + 47) < 0)
    std::string::__init_copy_ctor_external(&v33, *((const std::string::value_type **)v3 + 3), *((_QWORD *)v3 + 4));
  else
    v33 = *(std::string *)((_BYTE *)v3 + 1);
  CFStringFromString = createCFStringFromString((uint64_t)&v33);
  EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
  cf = EmojiTokensForString;
  if (EmojiTokensForString)
  {
    for (i = 0; i < CFArrayGetCount((CFArrayRef)EmojiTokensForString); ++i)
    {
      CFArrayGetValueAtIndex((CFArrayRef)EmojiTokensForString, i);
      String = (const __CFString *)CEMEmojiTokenGetString();
      getUTF8StringFromCFString(String, __p);
      v9 = v36;
      if ((unint64_t)v36 >= v37)
      {
        v11 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v35, (__int128 *)__p);
      }
      else
      {
        if (SHIBYTE(v30) < 0)
        {
          std::string::__init_copy_ctor_external(v36, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          v10 = *(_OWORD *)__p;
          v36->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
        }
        v11 = v9 + 1;
      }
      v36 = v11;
      if (SHIBYTE(v30) < 0)
        operator delete(__p[0]);
    }
    __p[0] = 0;
    __p[1] = 0;
    v30 = 0;
    v12 = (uint64_t)v35;
    v13 = v36;
    if (v35 == (const void **)v36)
    {
      v14 = 0;
      v24 = 0;
    }
    else
    {
      v14 = 0;
      do
      {
        v15 = 0;
        v28 = 0;
        v16 = *(unsigned __int8 *)(v12 + 23);
        if ((v16 & 0x80u) == 0)
          v17 = (const void *)*(unsigned __int8 *)(v12 + 23);
        else
          v17 = *(const void **)(v12 + 8);
        v18 = (const void *)*((unsigned __int8 *)v35 + 23);
        v19 = (char)v18;
        if ((char)v18 < 0)
          v18 = v35[1];
        if (v17 == v18)
        {
          if (v19 >= 0)
            v20 = (unsigned __int8 *)v35;
          else
            v20 = (unsigned __int8 *)*v35;
          if ((v16 & 0x80) != 0)
          {
            v15 = memcmp(*(const void **)v12, v20, *(_QWORD *)(v12 + 8)) == 0;
          }
          else if (*(_BYTE *)(v12 + 23))
          {
            v21 = 0;
            v22 = v16 - 1;
            do
            {
              v15 = *(unsigned __int8 *)(v12 + v21) == v20[v21];
              v23 = *(unsigned __int8 *)(v12 + v21) != v20[v21] || v22 == v21;
              ++v21;
            }
            while (!v23);
          }
          else
          {
            v15 = 1;
          }
        }
        v28 = !v15;
        v38 = 0;
        v26 = 3;
        v27 = 0.0;
        if ((unint64_t)v14 >= v30)
        {
          v14 = (char *)std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string &,std::string &,double,double,TLTransliteratorCandidateType,BOOL &>((int64x2_t *)__p, (uint64_t)&v34, v12, (double *)&v38, &v27, &v26, (unsigned __int8 *)&v28);
        }
        else
        {
          TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v14, &v34, v12, 3, !v15, 0.0, 0.0);
          v14 += 80;
        }
        __p[1] = v14;
        v12 += 24;
      }
      while ((std::string *)v12 != v13);
      v24 = (std::string *)__p[0];
    }
    std::vector<TLCompositeTransliteratorCandidate>::__insert_with_size[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate*>,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((uint64_t)a2, (__int128 *)(*a2 + 80), v24, (uint64_t)v14, 0xCCCCCCCCCCCCCCCDLL * ((v14 - (char *)v24) >> 4));
    v5 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3);
    v38 = __p;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](&v38);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v5 = 0;
  }
  if (CFStringFromString)
    CFRelease(CFStringFromString);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
  return v5;
}

void sub_2493E4CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;

  if (a35 < 0)
    operator delete(__p);
  __p = (void *)(v35 - 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void TLCompositeTransliterator::performOrthographyCheck(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  CFStringRef CFStringFromString;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)a2;
    while (v3 != *(_QWORD *)(a2 + 8))
    {
      CFStringFromString = createCFStringFromString(v3 + 24);
      if (((*(uint64_t (**)(_QWORD, CFStringRef, _QWORD, _QWORD))(**(_QWORD **)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), CFStringFromString, 0, 0) & 1) != 0)
      {
        v3 += 80;
        if (!CFStringFromString)
          continue;
      }
      else
      {
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v9, (__int128 *)(v3 + 80), *(__int128 **)(a2 + 8), v3);
        v7 = v6;
        v8 = *(_QWORD *)(a2 + 8);
        if (v8 != v6)
        {
          do
          {
            v8 -= 80;
            std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v8);
          }
          while (v8 != v7);
        }
        *(_QWORD *)(a2 + 8) = v7;
        if (!CFStringFromString)
          continue;
      }
      CFRelease(CFStringFromString);
    }
  }
}

void sub_2493E4E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  _Unwind_Resume(a1);
}

void TLCompositeTransliterator::assignLanguageModelScoreToCandidates(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a1 + 24))
  {
    v4 = a2[1];
    if (*a2 != v4)
    {
      v7 = (uint64_t)(*a2 + 3);
      do
      {
        *(double *)(v7 + 24) = (***(double (****)(_QWORD, uint64_t, uint64_t))(a1 + 24))(*(_QWORD *)(a1 + 24), v7, a3);
        v8 = v7 + 56;
        v7 += 80;
      }
      while ((uint64_t *)v8 != v4);
      v10 = *a2;
      v9 = (__int128 *)a2[1];
      v14 = a1;
      if ((char *)v9 - (char *)v10 < 1)
      {
        v11 = 0;
        v13 = 0;
      }
      else
      {
        v11 = std::get_temporary_buffer[abi:ne180100]<TLCompositeTransliteratorCandidate>(0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v10) >> 4));
        v13 = v12;
      }
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v10, v9, &v14, 0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v10) >> 4), (uint64_t)v11, v13);
      if (v11)
        operator delete(v11);
    }
  }
}

void sub_2493E4F7C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void TLCompositeTransliterator::getTransliterationCandidates(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned int v14;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  std::string *v19;
  std::string *v20;
  std::string *v21;
  __int128 *v22;
  __int128 *j;
  unint64_t v24;
  uint64_t v25;
  __int128 *v26;
  __int128 *i;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  std::locale::id *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  const std::locale::facet *v36;
  NSObject *v37;
  unint64_t v38;
  unint64_t updated;
  unint64_t v40;
  int64x2_t v42;
  int64x2_t v43;
  uint64_t v44;
  std::string v45;
  os_signpost_id_t v46;
  std::locale v47;
  int64x2_t v48;
  uint64_t v49;
  void *__p;
  char v51;
  uint64_t v52;
  char v53;
  uint8_t buf[32];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  TLOSSignPostgetTransliterationCandidates::TLOSSignPostgetTransliterationCandidates((TLOSSignPostgetTransliterationCandidates *)&v46);
  v9 = *(char *)(a3 + 23);
  if (v9 >= 0)
    v10 = (char *)a3;
  else
    v10 = *(char **)a3;
  if (v9 >= 0)
    v11 = *(unsigned __int8 *)(a3 + 23);
  else
    v11 = *(_QWORD *)(a3 + 8);
  if (v11)
  {
    v12 = &v10[v11];
    v13 = MEMORY[0x24BDAC740];
    while (1)
    {
      v14 = *v10;
      if (!((v14 & 0x80000000) != 0 ? __maskrune(v14, 0x100uLL) : *(_DWORD *)(v13 + 4 * v14 + 60) & 0x100))
        break;
      ++v10;
      if (!--v11)
      {
        v10 = v12;
        break;
      }
    }
    LOBYTE(v9) = *(_BYTE *)(a3 + 23);
  }
  if ((v9 & 0x80) != 0)
  {
    v16 = *(const std::string::value_type **)a3;
    v17 = *(_QWORD *)(a3 + 8);
    if (v10 == (char *)(*(_QWORD *)a3 + v17))
    {
      *(_QWORD *)a5 = 0;
      *(_QWORD *)(a5 + 8) = 0;
      *(_QWORD *)(a5 + 16) = 0;
      std::string::__init_copy_ctor_external(&v45, v16, v17);
      goto LABEL_22;
    }
LABEL_20:
    *(_QWORD *)a5 = 0;
    *(_QWORD *)(a5 + 8) = 0;
    *(_QWORD *)(a5 + 16) = 0;
    goto LABEL_79;
  }
  if (v10 != (char *)(a3 + v9))
    goto LABEL_20;
  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = 0;
  v45 = *(std::string *)a3;
LABEL_22:
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v18 = (std::string *)((char *)&v45 + HIBYTE(v45.__r_.__value_.__r.__words[2]));
  else
    v18 = (std::string *)(v45.__r_.__value_.__r.__words[0] + v45.__r_.__value_.__l.__size_);
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v45;
  else
    v19 = (std::string *)v45.__r_.__value_.__r.__words[0];
  while (v19 != v18)
  {
    v19->__r_.__value_.__s.__data_[0] = __tolower(v19->__r_.__value_.__s.__data_[0]);
    v19 = (std::string *)((char *)v19 + 1);
  }
  v43 = 0uLL;
  v44 = 0;
  if (*(_QWORD *)a1)
  {
    TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(*(uint64_t **)a1, (uint64_t)&v45, &v48);
    std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate((void **)&v43);
    v43 = v48;
    v44 = v49;
    v49 = 0;
    v48 = 0uLL;
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  }
  TLCompositeTransliteratorException::exceptionCandidatesForInput(*(uint64_t ***)(a1 + 8), a3, &v42);
  v21 = (std::string *)v42.i64[1];
  v20 = (std::string *)v42.i64[0];
  if (v42.i64[0] == v42.i64[1])
  {
    TLCompositeTransliteratorException::exceptionCandidatesForInput(*(uint64_t ***)(a1 + 8), (uint64_t)&v45, &v48);
    std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>((uint64_t)&v42, (std::string *)v48.i64[0], (std::string *)v48.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v48.i64[1] - v48.i64[0]) >> 4));
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
    v21 = (std::string *)v42.i64[1];
    v20 = (std::string *)v42.i64[0];
  }
  if (v20 == v21)
  {
    TLCompositeTransliteratorLexicon::lexiconCandidatesForInput(*(_QWORD **)(a1 + 16), (uint64_t)&v45, &v48);
    if (v48.i64[1] == v48.i64[0])
    {
      if (&v43 != (int64x2_t *)a5)
        std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, (std::string *)v43.i64[0], (std::string *)v43.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v43.i64[1] - v43.i64[0]) >> 4));
    }
    else
    {
      if (&v48 != (int64x2_t *)a5)
        std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, (std::string *)v48.i64[0], (std::string *)v48.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v48.i64[1] - v48.i64[0]) >> 4));
      v26 = (__int128 *)v43.i64[1];
      for (i = (__int128 *)v43.i64[0]; i != v26; i += 5)
      {
        if ((candidateSurfaceFormPresentInVector((uint64_t)i, (uint64_t *)a5) & 1) == 0)
        {
          v28 = *(_QWORD *)(a5 + 8);
          if (v28 >= *(_QWORD *)(a5 + 16))
          {
            v29 = std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>((int64x2_t *)a5, i);
          }
          else
          {
            std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(*(std::string **)(a5 + 8), i);
            v29 = v28 + 80;
            *(_QWORD *)(a5 + 8) = v28 + 80;
          }
          *(_QWORD *)(a5 + 8) = v29;
        }
      }
    }
    TLCompositeTransliterator::assignLanguageModelScoreToCandidates(a1, (uint64_t **)a5, a2);
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  }
  else
  {
    if (&v42 != (int64x2_t *)a5)
      std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, v20, v21, 0xCCCCCCCCCCCCCCCDLL * (((char *)v21 - (char *)v20) >> 4));
    if (v43.i64[0] != v43.i64[1])
    {
      TLCompositeTransliterator::assignLanguageModelScoreToCandidates(a1, (uint64_t **)&v43, a2);
      v22 = (__int128 *)v43.i64[1];
      for (j = (__int128 *)v43.i64[0]; j != v22; j += 5)
      {
        if ((candidateSurfaceFormPresentInVector((uint64_t)j, (uint64_t *)a5) & 1) == 0)
        {
          v24 = *(_QWORD *)(a5 + 8);
          if (v24 >= *(_QWORD *)(a5 + 16))
          {
            v25 = std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>((int64x2_t *)a5, j);
          }
          else
          {
            std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(*(std::string **)(a5 + 8), j);
            v25 = v24 + 80;
            *(_QWORD *)(a5 + 8) = v24 + 80;
          }
          *(_QWORD *)(a5 + 8) = v25;
        }
      }
    }
  }
  TLCompositeTransliterator::performOrthographyCheck(a1, a5);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v48);
  v31 = *(_QWORD *)a5;
  v30 = *(_QWORD *)(a5 + 8);
  if (*(_QWORD *)a5 != v30)
  {
    v32 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v48, (uint64_t)"<", 1);
      v34 = operator<<(v33, v31);
      v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)">", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(_QWORD *)(*v35 - 24)));
      v36 = std::locale::use_facet(&v47, v32);
      ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
      std::locale::~locale(&v47);
      std::ostream::put();
      std::ostream::flush();
      v31 += 80;
    }
    while (v31 != v30);
  }
  _nlpDefaultLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v48.i64[1], &v47);
    TLCompositeTransliterator::getTransliterationCandidates((int)&v53, (char *)&v47, buf, v37);
  }

  v48.i64[0] = *MEMORY[0x24BEDB800];
  *(uint64_t *)((char *)v48.i64 + *(_QWORD *)(v48.i64[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v48.i64[1] = MEMORY[0x24BEDB848] + 16;
  if (v51 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2495AFA00](&v52);
  v38 = *(unsigned __int8 *)(a3 + 23);
  if ((v38 & 0x80u) != 0)
    v38 = *(_QWORD *)(a3 + 8);
  if (v38 < 2)
    updated = 0;
  else
    updated = TLCompositeTransliterator::updateCandidatesWithEmojiCandidates(a1, (_QWORD *)a5);
  if (updated + 5 >= updated + a4)
    v40 = updated + a4;
  else
    v40 = updated + 5;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 4) > v40)
    std::vector<TLCompositeTransliteratorCandidate>::resize(a5, v40);
  v48.i64[0] = (uint64_t)&v42;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  v48.i64[0] = (uint64_t)&v43;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
LABEL_79:
  TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(&v46);
}

void sub_2493E5548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,os_signpost_id_t a24,std::locale a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  *(_QWORD *)(v28 - 136) = &a10;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 136));
  a10 = &a13;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  if (a22 < 0)
    operator delete(__p);
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(&a24);
  _Unwind_Resume(a1);
}

uint64_t candidateSurfaceFormPresentInVector(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 == v3)
    return 0;
  v6 = *(unsigned __int8 **)(a1 + 24);
  v4 = (unsigned __int8 *)(a1 + 24);
  v5 = v6;
  v7 = (char)v4[23];
  if (v7 >= 0)
    v8 = v4[23];
  else
    v8 = *((_QWORD *)v4 + 1);
  if (v7 >= 0)
    v9 = v4;
  else
    v9 = v5;
  while (1)
  {
    v10 = *(unsigned __int8 *)(v2 + 47);
    if ((v10 & 0x80u) == 0)
      v11 = *(unsigned __int8 *)(v2 + 47);
    else
      v11 = *(_QWORD *)(v2 + 32);
    if (v11 != v8)
      goto LABEL_19;
    if ((v10 & 0x80) != 0)
      break;
    if (!*(_BYTE *)(v2 + 47))
      return 1;
    v12 = 0;
    while (*(unsigned __int8 *)(v2 + v12 + 24) == v9[v12])
    {
      if (v10 == ++v12)
        return 1;
    }
LABEL_19:
    v2 += 80;
    if (v2 == v3)
      return 0;
  }
  if (memcmp(*(const void **)(v2 + 24), v9, *(_QWORD *)(v2 + 32)))
    goto LABEL_19;
  return 1;
}

void std::vector<TLCompositeTransliteratorCandidate>::resize(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = 0xCCCCCCCCCCCCCCCDLL * ((v3 - *(_QWORD *)a1) >> 4);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<TLCompositeTransliteratorCandidate>::__append((char **)a1, v6);
  }
  else if (!v5)
  {
    v7 = *(_QWORD *)a1 + 80 * a2;
    while (v3 != v7)
    {
      v3 -= 80;
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v3);
    }
    *(_QWORD *)(a1 + 8) = v7;
  }
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x2495AF904](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  return this;
}

void sub_2493E57FC(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(a1 + 48), 0);
}

void ___ZL30loadLMSpecificModulatingFactorPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const __CFString *a5, _BYTE *a6)
{
  const __CFString *PathComponent;
  const __CFString *v11;
  uint64_t v12;
  CFURLRef v13;

  PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    v11 = PathComponent;
    if (CFStringHasSuffix(PathComponent, CFSTR(".lm")))
    {
      if (CFStringsAreEqual(a5, CFSTR("LanguageModel")))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v13 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], url, CFSTR("Info.plist"), 0);
        nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v12 + 48), v13);
        *a6 = 1;
      }
    }
    CFRelease(v11);
  }
}

void sub_2493E5908(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
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
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
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

void sub_2493E5A2C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string &,std::string &,double,double,TLTransliteratorCandidateType,BOOL &>(int64x2_t *a1, uint64_t a2, uint64_t a3, double *a4, double *a5, _QWORD *a6, unsigned __int8 *a7)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i64;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64x2_t v28;
  uint64_t v29;
  char *v30;
  char *v32;
  int64x2_t v33;
  char *v34;
  int64x2_t *v35;

  v8 = a1->i64[0];
  v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  i64 = (uint64_t)a1[1].i64;
  v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10)
    v10 = 2 * v18;
  if (v18 >= 0x199999999999999)
    v19 = 0x333333333333333;
  else
    v19 = v10;
  v35 = a1 + 1;
  if (v19)
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  else
    v20 = 0;
  v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  v22 = a1->i64[0];
  v21 = a1->u64[1];
  v23 = v33.i64[0];
  v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      v25 = *(_OWORD *)(v21 - 80);
      *(_QWORD *)(v24 - 64) = *(_QWORD *)(v21 - 64);
      *(_OWORD *)(v24 - 80) = v25;
      *(_QWORD *)(v21 - 72) = 0;
      *(_QWORD *)(v21 - 64) = 0;
      *(_QWORD *)(v21 - 80) = 0;
      v26 = *(_OWORD *)(v21 - 56);
      *(_QWORD *)(v24 - 40) = *(_QWORD *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(_QWORD *)(v21 - 48) = 0;
      *(_QWORD *)(v21 - 40) = 0;
      *(_QWORD *)(v21 - 56) = 0;
      v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    v28 = *a1;
  }
  v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  v33 = v28;
  v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  v34 = v30;
  v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_2493E5BDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

__int128 *std::vector<TLCompositeTransliteratorCandidate>::__insert_with_size[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate*>,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t a1, __int128 *a2, std::string *a3, uint64_t a4, uint64_t a5)
{
  __int128 *v5;
  std::string *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  std::string *v21;
  std::string *v22;
  uint64_t v23;
  std::string *v24;
  uint64_t v25;
  _QWORD v27[2];
  std::string *v28;
  char *v29;
  uint64_t v30;

  v5 = a2;
  if (a5 >= 1)
  {
    v7 = a3;
    v11 = *(_QWORD *)(a1 + 16);
    v9 = a1 + 16;
    v10 = v11;
    v12 = *(_QWORD *)(v9 - 8);
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 4)) >= a5)
    {
      v20 = v12 - (_QWORD)a2;
      if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (_QWORD)a2) >> 4)) >= a5)
      {
        v21 = (std::string *)((char *)a3 + 80 * a5);
      }
      else
      {
        v21 = (std::string *)((char *)a3 + 16 * ((uint64_t)(v12 - (_QWORD)a2) >> 4));
        *(_QWORD *)(a1 + 8) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v9, (uint64_t)v21, a4, *(_QWORD *)(v9 - 8));
        if (v20 < 1)
          return v5;
      }
      std::vector<TLCompositeTransliteratorCandidate>::__move_range(a1, (uint64_t)v5, v12, (uint64_t)&v5[5 * a5]);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)v27, v7, v21, (std::string *)v5);
    }
    else
    {
      v13 = *(__int128 **)a1;
      v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(_QWORD *)a1) >> 4);
      if (v14 > 0x333333333333333)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v15 = 0xCCCCCCCCCCCCCCCDLL * (a2 - v13);
      v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 4);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x199999999999999)
        v18 = 0x333333333333333;
      else
        v18 = v17;
      v30 = v9;
      if (v18)
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(v9, v18);
      else
        v19 = 0;
      v22 = (std::string *)&v19[80 * v15];
      v27[0] = v19;
      v27[1] = v22;
      v28 = v22;
      v29 = &v19[80 * v18];
      v23 = 5 * a5;
      v24 = (std::string *)((char *)v22 + 80 * a5);
      v25 = 16 * v23;
      do
      {
        std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>(v22, (__int128 *)v7);
        v22 = (std::string *)((char *)v22 + 80);
        v7 = (std::string *)((char *)v7 + 80);
        v25 -= 80;
      }
      while (v25);
      v28 = v24;
      v5 = std::vector<TLCompositeTransliteratorCandidate>::__swap_out_circular_buffer((__int128 **)a1, v27, v5);
      std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)v27);
    }
  }
  return v5;
}

void sub_2493E5DB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v14;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = v6;
  if (v7 < a3)
  {
    v9 = v7;
    v8 = *(_QWORD *)(a1 + 8);
    do
    {
      v10 = *(_OWORD *)v9;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
      *(_OWORD *)v8 = v10;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)v9 = 0;
      v11 = *(_OWORD *)(v9 + 24);
      *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 40);
      *(_OWORD *)(v8 + 24) = v11;
      *(_QWORD *)(v9 + 32) = 0;
      *(_QWORD *)(v9 + 40) = 0;
      *(_QWORD *)(v9 + 24) = 0;
      v12 = *(_OWORD *)(v9 + 48);
      *(_OWORD *)(v8 + 57) = *(_OWORD *)(v9 + 57);
      *(_OWORD *)(v8 + 48) = v12;
      v8 += 80;
      v9 += 80;
    }
    while (v9 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v14, a2, v7, v6);
}

__int128 *std::vector<TLCompositeTransliteratorCandidate>::__swap_out_circular_buffer(__int128 **a1, _QWORD *a2, __int128 *a3)
{
  __int128 *result;
  __int128 *v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 *v17;
  __int128 *v18;
  __int128 *v19;

  result = (__int128 *)a2[1];
  v5 = *a1;
  v6 = result;
  if (*a1 != a3)
  {
    v7 = a3;
    v8 = a2[1];
    do
    {
      v6 = (__int128 *)(v8 - 80);
      v9 = *(v7 - 5);
      *(_QWORD *)(v8 - 64) = *((_QWORD *)v7 - 8);
      *(_OWORD *)(v8 - 80) = v9;
      *((_QWORD *)v7 - 9) = 0;
      *((_QWORD *)v7 - 8) = 0;
      *((_QWORD *)v7 - 10) = 0;
      v10 = *(__int128 *)((char *)v7 - 56);
      *(_QWORD *)(v8 - 40) = *((_QWORD *)v7 - 5);
      *(_OWORD *)(v8 - 56) = v10;
      *((_QWORD *)v7 - 6) = 0;
      *((_QWORD *)v7 - 5) = 0;
      *((_QWORD *)v7 - 7) = 0;
      v11 = *(v7 - 2);
      *(_OWORD *)(v8 - 23) = *(__int128 *)((char *)v7 - 23);
      *(_OWORD *)(v8 - 32) = v11;
      v7 -= 5;
      v8 -= 80;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v12 = a1[1];
  v13 = a2[2];
  if (v12 != a3)
  {
    do
    {
      v14 = *a3;
      *(_QWORD *)(v13 + 16) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v13 = v14;
      *((_QWORD *)a3 + 1) = 0;
      *((_QWORD *)a3 + 2) = 0;
      *(_QWORD *)a3 = 0;
      v15 = *(__int128 *)((char *)a3 + 24);
      *(_QWORD *)(v13 + 40) = *((_QWORD *)a3 + 5);
      *(_OWORD *)(v13 + 24) = v15;
      *((_QWORD *)a3 + 4) = 0;
      *((_QWORD *)a3 + 5) = 0;
      *((_QWORD *)a3 + 3) = 0;
      v16 = a3[3];
      *(_OWORD *)(v13 + 57) = *(__int128 *)((char *)a3 + 57);
      *(_OWORD *)(v13 + 48) = v16;
      v13 += 80;
      a3 += 5;
    }
    while (a3 != v12);
    v6 = (__int128 *)a2[1];
  }
  a2[2] = v13;
  v17 = *a1;
  *a1 = v6;
  a2[1] = v17;
  v18 = a1[1];
  a1[1] = (__int128 *)a2[2];
  a2[2] = v18;
  v19 = a1[2];
  a1[2] = (__int128 *)a2[3];
  a2[3] = v19;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>((std::string *)(a4 + v7), (__int128 *)(a2 + v7));
      v7 += 80;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_2493E5FF0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v2)
  {
    v4 = v1 - 80;
    do
    {
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v4 + v2);
      v2 -= 80;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>(std::string *this, __int128 *a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;
  __int128 v7;

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
  v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = a2[3];
  *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = *(__int128 *)((char *)a2 + 57);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v7;
  return this;
}

void sub_2493E609C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void **v9;
  __int128 *v10;
  __int128 v11;
  void **v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;

  if (a3 != a2)
  {
    v7 = 0;
    do
    {
      v8 = a4 + v7;
      v9 = (void **)(a4 + v7 - 80);
      if (*(char *)(a4 + v7 - 57) < 0)
        operator delete(*v9);
      v10 = (__int128 *)(a3 + v7 - 80);
      v11 = *v10;
      *(_QWORD *)(a4 + v7 - 64) = *(_QWORD *)(a3 + v7 - 64);
      *(_OWORD *)v9 = v11;
      *(_BYTE *)(a3 + v7 - 57) = 0;
      *(_BYTE *)v10 = 0;
      v12 = (void **)(v8 - 56);
      if (*(char *)(v8 - 33) < 0)
        operator delete(*v12);
      v13 = a3 + v7;
      v14 = *(_OWORD *)(a3 + v7 - 56);
      *(_QWORD *)(v8 - 40) = *(_QWORD *)(a3 + v7 - 40);
      *(_OWORD *)v12 = v14;
      *(_BYTE *)(v13 - 33) = 0;
      *(_BYTE *)(v13 - 56) = 0;
      v15 = a4 + v7;
      v16 = *(_OWORD *)(a3 + v7 - 32);
      *(_OWORD *)(v15 - 23) = *(_OWORD *)(a3 + v7 - 23);
      *(_OWORD *)(v15 - 32) = v16;
      v7 -= 80;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

std::string *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(int a1, std::string *__str, std::string *a3, std::string *this)
{
  std::string *v5;
  std::string *v6;
  __int128 v7;

  v5 = __str;
  if (__str == a3)
    return __str;
  v6 = a3;
  do
  {
    std::string::operator=(this, v5);
    std::string::operator=(this + 1, v5 + 1);
    v7 = *(_OWORD *)((char *)&v5[2].__r_.__value_.__r.__words[1] + 1);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = *(_OWORD *)&v5[2].__r_.__value_.__l.__data_;
    *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = v7;
    this = (std::string *)((char *)this + 80);
    v5 = (std::string *)((char *)v5 + 80);
  }
  while (v5 != v6);
  return v6;
}

__int128 *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v5;
  __int128 v7;
  void **v8;
  __int128 v9;
  __int128 v10;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0)
        operator delete(*(void **)a4);
      v7 = *v5;
      *(_QWORD *)(a4 + 16) = *((_QWORD *)v5 + 2);
      *(_OWORD *)a4 = v7;
      *((_BYTE *)v5 + 23) = 0;
      *(_BYTE *)v5 = 0;
      v8 = (void **)(a4 + 24);
      if (*(char *)(a4 + 47) < 0)
        operator delete(*v8);
      v9 = *(__int128 *)((char *)v5 + 24);
      *(_QWORD *)(a4 + 40) = *((_QWORD *)v5 + 5);
      *(_OWORD *)v8 = v9;
      *((_BYTE *)v5 + 47) = 0;
      *((_BYTE *)v5 + 24) = 0;
      v10 = v5[3];
      *(_OWORD *)(a4 + 57) = *(__int128 *)((char *)v5 + 57);
      *(_OWORD *)(a4 + 48) = v10;
      a4 += 80;
      v5 += 5;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void TLOSSignPostgetTransliterationCandidates::TLOSSignPostgetTransliterationCandidates(TLOSSignPostgetTransliterationCandidates *this)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, this);

  *(_QWORD *)this = v3;
  _nlpSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)this;
  if ((unint64_t)(*(_QWORD *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getTransliterationCandidates", (const char *)&unk_2493EB9EA, v7, 2u);
  }

}

void std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 80;
        std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v3);
      }
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(uint64_t a1, std::string *__str, std::string *a3, unint64_t a4)
{
  uint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::string *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v8 = a1 + 16;
  v9 = *(std::string **)a1;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4) < a4)
  {
    std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate((void **)a1);
    if (a4 > 0x333333333333333)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v10 = 0x999999999999999ALL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4);
    if (v10 <= a4)
      v10 = a4;
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4) >= 0x199999999999999)
      v11 = 0x333333333333333;
    else
      v11 = v10;
    std::vector<TLCompositeTransliteratorCandidate>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v8, (uint64_t)__str, (uint64_t)a3, *(_QWORD *)(a1 + 8));
    goto LABEL_11;
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4) < a4)
  {
    v13 = (std::string *)((char *)__str + 16 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4));
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)&v17, __str, v13, v9);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v8, (uint64_t)v13, (uint64_t)a3, *(_QWORD *)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)&v18, __str, a3, v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 80;
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v16);
    }
    while (v16 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_2493E6540(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_2493E6548(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::vector<TLCompositeTransliteratorCandidate>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x333333333333334)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>(int64x2_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i64;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int64x2_t v18;
  uint64_t v19;
  char *v20;
  char *v22;
  int64x2_t v23;
  char *v24;
  int64x2_t *v25;

  v3 = a1->i64[0];
  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  i64 = (uint64_t)a1[1].i64;
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x199999999999999)
    v9 = 0x333333333333333;
  else
    v9 = v5;
  v25 = a1 + 1;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v9);
  else
    v10 = 0;
  v22 = v10;
  v23.i64[0] = (uint64_t)&v10[80 * v4];
  v23.i64[1] = v23.i64[0];
  v24 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>((std::string *)v23.i64[0], a2);
  v12 = a1->i64[0];
  v11 = a1->u64[1];
  v13 = v23.i64[0];
  v14 = v23.i64[0];
  if (v11 == a1->i64[0])
  {
    v18 = vdupq_n_s64(v11);
  }
  else
  {
    do
    {
      v15 = *(_OWORD *)(v11 - 80);
      *(_QWORD *)(v14 - 64) = *(_QWORD *)(v11 - 64);
      *(_OWORD *)(v14 - 80) = v15;
      *(_QWORD *)(v11 - 72) = 0;
      *(_QWORD *)(v11 - 64) = 0;
      *(_QWORD *)(v11 - 80) = 0;
      v16 = *(_OWORD *)(v11 - 56);
      *(_QWORD *)(v14 - 40) = *(_QWORD *)(v11 - 40);
      *(_OWORD *)(v14 - 56) = v16;
      *(_QWORD *)(v11 - 48) = 0;
      *(_QWORD *)(v11 - 40) = 0;
      *(_QWORD *)(v11 - 56) = 0;
      v17 = *(_OWORD *)(v11 - 32);
      *(_OWORD *)(v14 - 23) = *(_OWORD *)(v11 - 23);
      *(_OWORD *)(v14 - 32) = v17;
      v14 -= 80;
      v11 -= 80;
    }
    while (v11 != v12);
    v18 = *a1;
  }
  v19 = v13 + 80;
  a1->i64[0] = v14;
  a1->i64[1] = v13 + 80;
  v23 = v18;
  v20 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v24;
  v24 = v20;
  v22 = (char *)v18.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v22);
  return v19;
}

void sub_2493E6704(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(std::string *this, __int128 *a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;
  __int128 v7;

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
  v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = a2[3];
  *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = *(__int128 *)((char *)a2 + 57);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v7;
  return this;
}

void sub_2493E67A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_2493E6880(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x2495AFA00](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2495AFA00](a1 + 112);
  return a1;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void std::vector<TLCompositeTransliteratorCandidate>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      v13 = 80 * ((80 * a2 - 80) / 0x50) + 80;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a1) >> 4);
    v9 = v8 + a2;
    if (v8 + a2 > 0x333333333333333)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x199999999999999)
      v11 = 0x333333333333333;
    else
      v11 = v9;
    v28 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[80 * v8];
    v15 = &v12[80 * v11];
    v16 = 80 * ((80 * a2 - 80) / 0x50) + 80;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = *a1;
    v18 = (unint64_t)a1[1];
    if ((char *)v18 == *a1)
    {
      v23 = vdupq_n_s64(v18);
    }
    else
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 80);
        *((_QWORD *)v14 - 8) = *(_QWORD *)(v18 - 64);
        *((_OWORD *)v14 - 5) = v20;
        *(_QWORD *)(v18 - 72) = 0;
        *(_QWORD *)(v18 - 64) = 0;
        *(_QWORD *)(v18 - 80) = 0;
        v21 = *(_OWORD *)(v18 - 56);
        *((_QWORD *)v14 - 5) = *(_QWORD *)(v18 - 40);
        *(_OWORD *)(v14 - 56) = v21;
        *(_QWORD *)(v18 - 48) = 0;
        *(_QWORD *)(v18 - 40) = 0;
        *(_QWORD *)(v18 - 56) = 0;
        v22 = *(_OWORD *)(v18 - 32);
        *(_OWORD *)(v14 - 23) = *(_OWORD *)(v18 - 23);
        *((_OWORD *)v14 - 2) = v22;
        v14 -= 80;
        v18 -= 80;
      }
      while ((char *)v18 != v19);
      v23 = *(int64x2_t *)a1;
    }
    *a1 = v14;
    a1[1] = v17;
    v26 = v23;
    v24 = a1[2];
    a1[2] = v15;
    v27 = v24;
    v25 = v23.i64[0];
    std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v25);
  }
}

void TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(os_signpost_id_t *this)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  _nlpSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2493D1000, v3, OS_SIGNPOST_INTERVAL_END, v4, "getTransliterationCandidates", (const char *)&unk_2493EB9EA, v5, 2u);
  }

}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {

    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(a2 + 8), 0);
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)a2, 0);
    JUMPOUT(0x2495AFA48);
  }
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void *std::get_temporary_buffer[abi:ne180100]<TLCompositeTransliteratorCandidate>(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x199999999999999)
    v1 = 0x199999999999999;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x24BEDB6B8];
  while (1)
  {
    result = operator new(80 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

void std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t *a1, __int128 *a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  double TotalScore;
  uint64_t v14;
  __int128 *v15;
  uint64_t v16;
  TLCompositeTransliteratorCandidate *v17;
  uint64_t v18;
  uint64_t *v19;
  TLCompositeTransliteratorCandidate *v20;
  uint64_t v21;
  double v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  void **v26;
  char *v27;
  char *v28;
  __int128 v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  char v33;
  void **v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  _OWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  void **v46;
  int v47;
  __int128 v48;
  void **v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void **v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _OWORD *v57;
  void **v58;
  uint64_t v59;
  __int128 v60;
  void **v61;
  __int128 v62;
  _OWORD *v63;
  __int128 v64;
  uint64_t v65;
  _OWORD *v66;
  void **v67;
  uint64_t v68;
  __int128 v69;
  void **v70;
  __int128 v71;
  _OWORD *v72;
  __int128 v73;
  __int128 *v74;
  uint64_t *v75;
  void *__p[2];
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  _OWORD v80[2];

  v74 = a2;
  v75 = a1;
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      v74 = a2 - 5;
      v9 = *a3;
      TotalScore = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(a2 - 5), *(double *)(*a3 + 32));
      if (TotalScore > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)a1, *(double *)(v9 + 32)))std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v75, &v74);
    }
    else if ((uint64_t)a4 <= 0)
    {
      if (a1 != (uint64_t *)a2)
      {
        v17 = (TLCompositeTransliteratorCandidate *)(a1 + 10);
        if (a1 + 10 != (uint64_t *)a2)
        {
          v18 = 0;
          v19 = a1;
          do
          {
            v20 = v17;
            v21 = *a3;
            v22 = TLCompositeTransliteratorCandidate::getTotalScore(v17, *(double *)(*a3 + 32));
            if (v22 > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v19, *(double *)(v21 + 32)))
            {
              v23 = *(_OWORD *)v20;
              v77 = *((_QWORD *)v20 + 2);
              *(_OWORD *)__p = v23;
              *((_QWORD *)v20 + 1) = 0;
              *((_QWORD *)v20 + 2) = 0;
              *(_QWORD *)v20 = 0;
              v78 = *(_OWORD *)(v19 + 13);
              v79 = v19[15];
              v19[14] = 0;
              v19[15] = 0;
              v19[13] = 0;
              v80[0] = *((_OWORD *)v19 + 8);
              *(_OWORD *)((char *)v80 + 9) = *(_OWORD *)((char *)v19 + 137);
              v24 = v18;
              while (1)
              {
                v25 = (char *)a1 + v24;
                v26 = (void **)((char *)a1 + v24 + 80);
                if (*((char *)a1 + v24 + 103) < 0)
                  operator delete(*v26);
                *(_OWORD *)v26 = *(_OWORD *)v25;
                *(uint64_t *)((char *)a1 + v24 + 96) = *((_QWORD *)v25 + 2);
                v25[23] = 0;
                *v25 = 0;
                v27 = v25 + 104;
                if (v25[127] < 0)
                  operator delete(*(void **)v27);
                v28 = (char *)a1 + v24;
                v29 = *(_OWORD *)((char *)a1 + v24 + 24);
                *((_QWORD *)v27 + 2) = *(uint64_t *)((char *)a1 + v24 + 40);
                *(_OWORD *)v27 = v29;
                v28[47] = 0;
                v28[24] = 0;
                *((_OWORD *)v28 + 8) = *(_OWORD *)((char *)a1 + v24 + 48);
                *(_OWORD *)(v28 + 137) = *(_OWORD *)((char *)a1 + v24 + 57);
                if (!v24)
                  break;
                v30 = *a3;
                v31 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)__p, *(double *)(*a3 + 32));
                v24 -= 80;
                if (v31 <= TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(v28 - 80), *(double *)(v30 + 32)))
                {
                  v32 = (uint64_t)a1 + v24 + 80;
                  goto LABEL_21;
                }
              }
              v32 = (uint64_t)a1;
LABEL_21:
              if (*(char *)(v32 + 23) < 0)
                operator delete(*(void **)v32);
              v33 = 0;
              v34 = (void **)(v28 + 24);
              v35 = *(_OWORD *)__p;
              *(_QWORD *)(v32 + 16) = v77;
              *(_OWORD *)v32 = v35;
              HIBYTE(v77) = 0;
              LOBYTE(__p[0]) = 0;
              if (*(char *)(v32 + 47) < 0)
              {
                operator delete(*v34);
                v33 = HIBYTE(v77);
              }
              v36 = v78;
              *((_QWORD *)v28 + 5) = v79;
              *(_OWORD *)v34 = v36;
              HIBYTE(v79) = 0;
              LOBYTE(v78) = 0;
              v37 = v80[0];
              *(_OWORD *)(v28 + 57) = *(_OWORD *)((char *)v80 + 9);
              *((_OWORD *)v28 + 3) = v37;
              if (v33 < 0)
                operator delete(__p[0]);
            }
            v17 = (TLCompositeTransliteratorCandidate *)((char *)v20 + 80);
            v18 += 80;
            v19 = (uint64_t *)v20;
          }
          while ((__int128 *)((char *)v20 + 80) != a2);
        }
      }
    }
    else
    {
      v14 = a4 >> 1;
      v15 = (__int128 *)&a1[10 * (a4 >> 1)];
      if ((uint64_t)a4 <= a6)
      {
        std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((__int128 *)a1, (__int128 *)&a1[10 * (a4 >> 1)], a3, a4 >> 1, a5);
        v38 = a5 + 80 * v14;
        std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((__int128 *)&a1[10 * (a4 >> 1)], a2, a3, a4 - v14, v38);
        __p[0] = (void *)a4;
        v39 = a5 + 80 * a4;
        v40 = a1 + 6;
        v41 = v38;
        v42 = a5;
        while (v41 != v39)
        {
          v43 = *a3;
          v44 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v41, *(double *)(*a3 + 32));
          v45 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v42, *(double *)(v43 + 32));
          v46 = (void **)(v40 - 3);
          v47 = *((char *)v40 - 25);
          if (v44 <= v45)
          {
            if (v47 < 0)
              operator delete(*v46);
            v52 = *(_OWORD *)v42;
            *((_QWORD *)v40 - 4) = *(_QWORD *)(v42 + 16);
            *(_OWORD *)v46 = v52;
            *(_BYTE *)(v42 + 23) = 0;
            *(_BYTE *)v42 = 0;
            v53 = (void **)v40 - 3;
            if (*((char *)v40 - 1) < 0)
              operator delete(*v53);
            v54 = *(_OWORD *)(v42 + 24);
            *((_QWORD *)v40 - 1) = *(_QWORD *)(v42 + 40);
            *(_OWORD *)v53 = v54;
            *(_BYTE *)(v42 + 47) = 0;
            *(_BYTE *)(v42 + 24) = 0;
            v55 = *(_OWORD *)(v42 + 48);
            *(_OWORD *)((char *)v40 + 9) = *(_OWORD *)(v42 + 57);
            *v40 = v55;
            v42 += 80;
          }
          else
          {
            if (v47 < 0)
              operator delete(*v46);
            v48 = *(_OWORD *)v41;
            *((_QWORD *)v40 - 4) = *(_QWORD *)(v41 + 16);
            *(_OWORD *)v46 = v48;
            *(_BYTE *)(v41 + 23) = 0;
            *(_BYTE *)v41 = 0;
            v49 = (void **)v40 - 3;
            if (*((char *)v40 - 1) < 0)
              operator delete(*v49);
            v50 = *(_OWORD *)(v41 + 24);
            *((_QWORD *)v40 - 1) = *(_QWORD *)(v41 + 40);
            *(_OWORD *)v49 = v50;
            *(_BYTE *)(v41 + 47) = 0;
            *(_BYTE *)(v41 + 24) = 0;
            v51 = *(_OWORD *)(v41 + 48);
            *(_OWORD *)((char *)v40 + 9) = *(_OWORD *)(v41 + 57);
            *v40 = v51;
            v41 += 80;
          }
          v40 += 5;
          if (v42 == v38)
          {
            if (v41 != v39)
            {
              v56 = 0;
              do
              {
                v57 = &v40[v56];
                v58 = (void **)&v40[v56 - 3];
                if (*((char *)&v40[v56 - 1] - 9) < 0)
                  operator delete(*v58);
                v59 = v41 + v56 * 16;
                v60 = *(_OWORD *)(v41 + v56 * 16);
                *(_QWORD *)&v40[v56 - 2] = *(_QWORD *)(v41 + v56 * 16 + 16);
                *(_OWORD *)v58 = v60;
                *(_BYTE *)(v59 + 23) = 0;
                *(_BYTE *)v59 = 0;
                v61 = (void **)v57 - 3;
                if (*((char *)v57 - 1) < 0)
                  operator delete(*v61);
                v62 = *(_OWORD *)(v59 + 24);
                *((_QWORD *)v57 - 1) = *(_QWORD *)(v59 + 40);
                *(_OWORD *)v61 = v62;
                *(_BYTE *)(v59 + 47) = 0;
                *(_BYTE *)(v59 + 24) = 0;
                v63 = &v40[v56];
                v64 = *(_OWORD *)(v59 + 48);
                *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)(v59 + 57);
                *v63 = v64;
                v56 += 5;
              }
              while (v59 + 80 != v39);
            }
            goto LABEL_58;
          }
        }
        if (v42 != v38)
        {
          v65 = 0;
          do
          {
            v66 = &v40[v65];
            v67 = (void **)&v40[v65 - 3];
            if (*((char *)&v40[v65 - 1] - 9) < 0)
              operator delete(*v67);
            v68 = v42 + v65 * 16;
            v69 = *(_OWORD *)(v42 + v65 * 16);
            *(_QWORD *)&v40[v65 - 2] = *(_QWORD *)(v42 + v65 * 16 + 16);
            *(_OWORD *)v67 = v69;
            *(_BYTE *)(v68 + 23) = 0;
            *(_BYTE *)v68 = 0;
            v70 = (void **)v66 - 3;
            if (*((char *)v66 - 1) < 0)
              operator delete(*v70);
            v71 = *(_OWORD *)(v68 + 24);
            *((_QWORD *)v66 - 1) = *(_QWORD *)(v68 + 40);
            *(_OWORD *)v70 = v71;
            *(_BYTE *)(v68 + 47) = 0;
            *(_BYTE *)(v68 + 24) = 0;
            v72 = &v40[v65];
            v73 = *(_OWORD *)(v68 + 48);
            *(_OWORD *)((char *)v72 + 9) = *(_OWORD *)(v68 + 57);
            *v72 = v73;
            v65 += 5;
          }
          while (v68 + 80 != v38);
        }
LABEL_58:
        if (a5)
          std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>((unint64_t *)__p, a5);
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, &a1[10 * (a4 >> 1)], a3, a4 >> 1, a5, a6);
        v16 = a4 - v14;
        std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v15, a2, a3, v16, a5, a6);
        std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, v15, (uint64_t *)a2, a3, v14, v16, a5, a6);
      }
    }
  }
}

void sub_2493E7354(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  uint64_t v11;

  if (v11)
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a11, v11);
  _Unwind_Resume(exception_object);
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(uint64_t **a1, __int128 **a2)
{
  uint64_t *v2;
  __int128 *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  void **v7;
  char v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 result;
  _BYTE v14[25];
  _BYTE v15[15];
  _BYTE v16[15];

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  *(_QWORD *)v16 = (*a1)[1];
  *(_QWORD *)&v16[7] = *(uint64_t *)((char *)*a1 + 15);
  v5 = *((_BYTE *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  v7 = (void **)(v2 + 3);
  v6 = v2[3];
  *(_QWORD *)v15 = v2[4];
  *(_QWORD *)&v15[7] = *(uint64_t *)((char *)v2 + 39);
  v8 = *((_BYTE *)v2 + 47);
  v2[4] = 0;
  v2[5] = 0;
  v2[3] = 0;
  v9 = v2 + 6;
  *(_OWORD *)&v14[9] = *(_OWORD *)((char *)v2 + 57);
  *(_OWORD *)v14 = *((_OWORD *)v2 + 3);
  v10 = *v3;
  v2[2] = *((_QWORD *)v3 + 2);
  *(_OWORD *)v2 = v10;
  *((_BYTE *)v3 + 23) = 0;
  *(_BYTE *)v3 = 0;
  if (*((char *)v2 + 47) < 0)
    operator delete(*v7);
  v11 = *(__int128 *)((char *)v3 + 24);
  v7[2] = (void *)*((_QWORD *)v3 + 5);
  *(_OWORD *)v7 = v11;
  *((_BYTE *)v3 + 47) = 0;
  *((_BYTE *)v3 + 24) = 0;
  v12 = v3[3];
  *(_OWORD *)((char *)v9 + 9) = *(__int128 *)((char *)v3 + 57);
  *v9 = v12;
  if (*((char *)v3 + 23) < 0)
    operator delete(*(void **)v3);
  *(_QWORD *)v3 = v4;
  *((_QWORD *)v3 + 1) = *(_QWORD *)v16;
  *(_QWORD *)((char *)v3 + 15) = *(_QWORD *)&v16[7];
  *((_BYTE *)v3 + 23) = v5;
  if (*((char *)v3 + 47) < 0)
    operator delete(*((void **)v3 + 3));
  *((_QWORD *)v3 + 3) = v6;
  *((_QWORD *)v3 + 4) = *(_QWORD *)v15;
  *(_QWORD *)((char *)v3 + 39) = *(_QWORD *)&v15[7];
  *((_BYTE *)v3 + 47) = v8;
  v3[3] = *(_OWORD *)v14;
  result = *(__n128 *)&v14[9];
  *(__int128 *)((char *)v3 + 57) = *(_OWORD *)&v14[9];
  return result;
}

void std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(__int128 *a1, __int128 *a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  __int128 *v8;
  TLCompositeTransliteratorCandidate *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 *v13;
  uint64_t v14;
  double TotalScore;
  double v16;
  _OWORD *v17;
  _OWORD *v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  TLCompositeTransliteratorCandidate *v30;
  uint64_t v31;
  _OWORD *v32;
  TLCompositeTransliteratorCandidate *v33;
  uint64_t v34;
  double v35;
  double v36;
  _OWORD *v37;
  _OWORD *v38;
  _OWORD *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  TLCompositeTransliteratorCandidate *v46;
  uint64_t v47;
  void **v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void **v54;
  __int128 v55;
  __int128 v56;
  TLCompositeTransliteratorCandidate *v57;
  uint64_t v58;
  __int128 *v59;
  uint64_t v60;
  double v61;
  double v62;
  _OWORD *v63;
  _OWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  __int128 *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v90;
  uint64_t v91;

  if (a4)
  {
    v8 = a2;
    v9 = (TLCompositeTransliteratorCandidate *)a1;
    if (a4 == 2)
    {
      v13 = a2 - 5;
      v14 = *a3;
      TotalScore = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(a2 - 5), *(double *)(*a3 + 32));
      v16 = TLCompositeTransliteratorCandidate::getTotalScore(v9, *(double *)(v14 + 32));
      v17 = (_OWORD *)(a5 + 24);
      v18 = (_OWORD *)(a5 + 48);
      v19 = (_OWORD *)(a5 + 80);
      v20 = (_OWORD *)(a5 + 104);
      if (TotalScore <= v16)
      {
        v77 = *(_OWORD *)v9;
        *(_QWORD *)(a5 + 16) = *((_QWORD *)v9 + 2);
        *(_OWORD *)a5 = v77;
        *((_QWORD *)v9 + 1) = 0;
        *((_QWORD *)v9 + 2) = 0;
        *(_QWORD *)v9 = 0;
        v78 = *(_OWORD *)((char *)v9 + 24);
        *(_QWORD *)(a5 + 40) = *((_QWORD *)v9 + 5);
        *v17 = v78;
        *((_QWORD *)v9 + 4) = 0;
        *((_QWORD *)v9 + 5) = 0;
        *((_QWORD *)v9 + 3) = 0;
        v79 = *((_OWORD *)v9 + 3);
        *(_OWORD *)(a5 + 57) = *(_OWORD *)((char *)v9 + 57);
        *v18 = v79;
        v80 = *v13;
        *(_QWORD *)(a5 + 96) = *((_QWORD *)v8 - 8);
        *v19 = v80;
        *((_QWORD *)v8 - 9) = 0;
        *((_QWORD *)v8 - 8) = 0;
        *(_QWORD *)v13 = 0;
        v81 = *(__int128 *)((char *)v8 - 56);
        *(_QWORD *)(a5 + 120) = *((_QWORD *)v8 - 5);
        *v20 = v81;
        *((_QWORD *)v8 - 6) = 0;
        *((_QWORD *)v8 - 5) = 0;
        *((_QWORD *)v8 - 7) = 0;
        v26 = v8 - 2;
      }
      else
      {
        v21 = *v13;
        *(_QWORD *)(a5 + 16) = *((_QWORD *)v8 - 8);
        *(_OWORD *)a5 = v21;
        *((_QWORD *)v8 - 9) = 0;
        *((_QWORD *)v8 - 8) = 0;
        *(_QWORD *)v13 = 0;
        v22 = *(__int128 *)((char *)v8 - 56);
        *(_QWORD *)(a5 + 40) = *((_QWORD *)v8 - 5);
        *v17 = v22;
        *((_QWORD *)v8 - 6) = 0;
        *((_QWORD *)v8 - 5) = 0;
        *((_QWORD *)v8 - 7) = 0;
        v23 = *(v8 - 2);
        *(_OWORD *)(a5 + 57) = *(__int128 *)((char *)v8 - 23);
        *v18 = v23;
        v24 = *(_OWORD *)v9;
        *(_QWORD *)(a5 + 96) = *((_QWORD *)v9 + 2);
        *v19 = v24;
        *((_QWORD *)v9 + 1) = 0;
        *((_QWORD *)v9 + 2) = 0;
        *(_QWORD *)v9 = 0;
        v25 = *(_OWORD *)((char *)v9 + 24);
        *(_QWORD *)(a5 + 120) = *((_QWORD *)v9 + 5);
        *v20 = v25;
        *((_QWORD *)v9 + 4) = 0;
        *((_QWORD *)v9 + 5) = 0;
        *((_QWORD *)v9 + 3) = 0;
        v26 = (__int128 *)((char *)v9 + 48);
      }
      v82 = *v26;
      *(_OWORD *)(a5 + 137) = *(__int128 *)((char *)v26 + 9);
      *(_OWORD *)(a5 + 128) = v82;
    }
    else if (a4 == 1)
    {
      v10 = *a1;
      *(_QWORD *)(a5 + 16) = *((_QWORD *)a1 + 2);
      *(_OWORD *)a5 = v10;
      *((_QWORD *)a1 + 1) = 0;
      *((_QWORD *)a1 + 2) = 0;
      *(_QWORD *)a1 = 0;
      v11 = *(__int128 *)((char *)a1 + 24);
      *(_QWORD *)(a5 + 40) = *((_QWORD *)a1 + 5);
      *(_OWORD *)(a5 + 24) = v11;
      *((_QWORD *)a1 + 4) = 0;
      *((_QWORD *)a1 + 5) = 0;
      *((_QWORD *)a1 + 3) = 0;
      v12 = a1[3];
      *(_OWORD *)(a5 + 57) = *(__int128 *)((char *)a1 + 57);
      *(_OWORD *)(a5 + 48) = v12;
    }
    else if ((uint64_t)a4 > 8)
    {
      v57 = (TLCompositeTransliteratorCandidate *)&a1[5 * (a4 >> 1)];
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, v57, a3, a4 >> 1, a5, a4 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((char *)v9 + 80 * (a4 >> 1), v8, a3, a4 - (a4 >> 1), a5 + 80 * (a4 >> 1), a4 - (a4 >> 1));
      v91 = 0;
      v58 = a5;
      v59 = (__int128 *)((char *)v9 + 80 * (a4 >> 1));
      while (v59 != v8)
      {
        v60 = *a3;
        v61 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v59, *(double *)(*a3 + 32));
        v62 = TLCompositeTransliteratorCandidate::getTotalScore(v9, *(double *)(v60 + 32));
        v63 = (_OWORD *)(v58 + 24);
        v64 = (_OWORD *)(v58 + 48);
        if (v61 <= v62)
        {
          v68 = *(_OWORD *)v9;
          *(_QWORD *)(v58 + 16) = *((_QWORD *)v9 + 2);
          *(_OWORD *)v58 = v68;
          *((_QWORD *)v9 + 1) = 0;
          *((_QWORD *)v9 + 2) = 0;
          *(_QWORD *)v9 = 0;
          v69 = *(_OWORD *)((char *)v9 + 24);
          *(_QWORD *)(v58 + 40) = *((_QWORD *)v9 + 5);
          *v63 = v69;
          *((_QWORD *)v9 + 4) = 0;
          *((_QWORD *)v9 + 5) = 0;
          *((_QWORD *)v9 + 3) = 0;
          v70 = *((_OWORD *)v9 + 3);
          *(_OWORD *)(v58 + 57) = *(_OWORD *)((char *)v9 + 57);
          *v64 = v70;
          v9 = (TLCompositeTransliteratorCandidate *)((char *)v9 + 80);
        }
        else
        {
          v65 = *v59;
          *(_QWORD *)(v58 + 16) = *((_QWORD *)v59 + 2);
          *(_OWORD *)v58 = v65;
          *((_QWORD *)v59 + 1) = 0;
          *((_QWORD *)v59 + 2) = 0;
          *(_QWORD *)v59 = 0;
          v66 = *(__int128 *)((char *)v59 + 24);
          *(_QWORD *)(v58 + 40) = *((_QWORD *)v59 + 5);
          *v63 = v66;
          *((_QWORD *)v59 + 4) = 0;
          *((_QWORD *)v59 + 5) = 0;
          *((_QWORD *)v59 + 3) = 0;
          v67 = v59[3];
          *(_OWORD *)(v58 + 57) = *(__int128 *)((char *)v59 + 57);
          *v64 = v67;
          v59 += 5;
        }
        ++v91;
        v58 += 80;
        if (v9 == v57)
        {
          if (v59 != v8)
          {
            v71 = 0;
            do
            {
              v72 = &v59[v71];
              v73 = v58 + v71 * 16;
              v74 = v59[v71];
              *(_QWORD *)(v73 + 16) = *(_QWORD *)&v59[v71 + 1];
              *(_OWORD *)v73 = v74;
              *((_QWORD *)v72 + 1) = 0;
              *((_QWORD *)v72 + 2) = 0;
              *(_QWORD *)v72 = 0;
              v75 = *(__int128 *)((char *)&v59[v71 + 1] + 8);
              *(_QWORD *)(v73 + 40) = *((_QWORD *)&v59[v71 + 2] + 1);
              *(_OWORD *)(v73 + 24) = v75;
              *((_QWORD *)v72 + 4) = 0;
              *((_QWORD *)v72 + 5) = 0;
              *((_QWORD *)v72 + 3) = 0;
              v76 = v59[v71 + 3];
              *(_OWORD *)(v73 + 57) = *(__int128 *)((char *)&v59[v71 + 3] + 9);
              *(_OWORD *)(v73 + 48) = v76;
              v71 += 5;
            }
            while (v72 + 5 != v8);
          }
          return;
        }
      }
      if (v9 != v57)
      {
        v83 = 0;
        do
        {
          v84 = v58 + v83;
          v85 = (_QWORD *)((char *)v9 + v83);
          v86 = *(_OWORD *)((char *)v9 + v83);
          *(_QWORD *)(v84 + 16) = *(_QWORD *)((char *)v9 + v83 + 16);
          *(_OWORD *)v84 = v86;
          v85[1] = 0;
          v85[2] = 0;
          *v85 = 0;
          v87 = *(_OWORD *)((char *)v9 + v83 + 24);
          *(_QWORD *)(v84 + 40) = *(_QWORD *)((char *)v9 + v83 + 40);
          *(_OWORD *)(v84 + 24) = v87;
          v85[4] = 0;
          v85[5] = 0;
          v85[3] = 0;
          v88 = *(_OWORD *)((char *)v9 + v83 + 48);
          *(_OWORD *)(v84 + 57) = *(_OWORD *)((char *)v9 + v83 + 57);
          *(_OWORD *)(v84 + 48) = v88;
          v83 += 80;
        }
        while (v85 + 10 != (_QWORD *)v57);
      }
    }
    else if (a1 != a2)
    {
      v27 = *a1;
      *(_QWORD *)(a5 + 16) = *((_QWORD *)a1 + 2);
      *(_OWORD *)a5 = v27;
      *((_QWORD *)a1 + 1) = 0;
      *((_QWORD *)a1 + 2) = 0;
      *(_QWORD *)a1 = 0;
      v28 = *(__int128 *)((char *)a1 + 24);
      *(_QWORD *)(a5 + 40) = *((_QWORD *)a1 + 5);
      *(_OWORD *)(a5 + 24) = v28;
      *((_QWORD *)a1 + 4) = 0;
      *((_QWORD *)a1 + 5) = 0;
      *((_QWORD *)a1 + 3) = 0;
      v29 = a1[3];
      *(_OWORD *)(a5 + 57) = *(__int128 *)((char *)a1 + 57);
      *(_OWORD *)(a5 + 48) = v29;
      v90 = 1;
      v30 = (TLCompositeTransliteratorCandidate *)(a1 + 5);
      if (a1 + 5 != a2)
      {
        v31 = 0;
        v32 = (_OWORD *)a5;
        do
        {
          v33 = v30;
          v34 = *a3;
          v35 = TLCompositeTransliteratorCandidate::getTotalScore(v30, *(double *)(*a3 + 32));
          v36 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v32, *(double *)(v34 + 32));
          v37 = v32 + 5;
          v38 = (_OWORD *)((char *)v32 + 104);
          v39 = v32 + 8;
          if (v35 <= v36)
          {
            v50 = *(_OWORD *)v33;
            *((_QWORD *)v32 + 12) = *((_QWORD *)v33 + 2);
            *v37 = v50;
            *((_QWORD *)v33 + 1) = 0;
            *((_QWORD *)v33 + 2) = 0;
            *(_QWORD *)v33 = 0;
            v51 = *(_OWORD *)((char *)v9 + 104);
            *((_QWORD *)v32 + 15) = *((_QWORD *)v9 + 15);
            *v38 = v51;
            *((_QWORD *)v9 + 14) = 0;
            *((_QWORD *)v9 + 15) = 0;
            *((_QWORD *)v9 + 13) = 0;
            v52 = *((_OWORD *)v9 + 8);
            *(_OWORD *)((char *)v32 + 137) = *(_OWORD *)((char *)v9 + 137);
            *v39 = v52;
            ++v90;
          }
          else
          {
            *v37 = *v32;
            *((_QWORD *)v32 + 12) = *((_QWORD *)v32 + 2);
            *(_QWORD *)v32 = 0;
            *((_QWORD *)v32 + 1) = 0;
            v40 = *(_OWORD *)((char *)v32 + 24);
            *((_QWORD *)v32 + 2) = 0;
            *((_QWORD *)v32 + 3) = 0;
            *v38 = v40;
            *((_QWORD *)v32 + 15) = *((_QWORD *)v32 + 5);
            *((_QWORD *)v32 + 4) = 0;
            *((_QWORD *)v32 + 5) = 0;
            *(_OWORD *)((char *)v32 + 137) = *(_OWORD *)((char *)v32 + 57);
            *v39 = v32[3];
            v41 = a5;
            ++v90;
            if (v32 != (_OWORD *)a5)
            {
              v42 = v31;
              while (1)
              {
                v43 = *a3;
                v44 = TLCompositeTransliteratorCandidate::getTotalScore(v33, *(double *)(*a3 + 32));
                v45 = a5 + v42;
                v46 = (TLCompositeTransliteratorCandidate *)(a5 + v42 - 80);
                if (v44 <= TLCompositeTransliteratorCandidate::getTotalScore(v46, *(double *)(v43 + 32)))
                  break;
                v47 = a5 + v42;
                if (*(char *)(a5 + v42 + 23) < 0)
                  operator delete(*(void **)v45);
                *(_OWORD *)v45 = *(_OWORD *)v46;
                *(_QWORD *)(v45 + 16) = *(_QWORD *)(a5 + v42 - 64);
                *(_BYTE *)(v47 - 57) = 0;
                *(_BYTE *)v46 = 0;
                v48 = (void **)(v47 + 24);
                if (*(char *)(v47 + 47) < 0)
                  operator delete(*v48);
                v49 = a5 + v42;
                *(_OWORD *)v48 = *(_OWORD *)(a5 + v42 - 56);
                *(_QWORD *)(v47 + 40) = *(_QWORD *)(a5 + v42 - 40);
                *(_BYTE *)(v49 - 33) = 0;
                *(_BYTE *)(v49 - 56) = 0;
                *(_OWORD *)(v49 + 48) = *(_OWORD *)(a5 + v42 - 32);
                *(_OWORD *)(v49 + 57) = *(_OWORD *)(a5 + v42 - 23);
                v42 -= 80;
                if (!v42)
                {
                  v41 = a5;
                  goto LABEL_23;
                }
              }
              v41 = a5 + v42;
LABEL_23:
              v8 = a2;
            }
            if (*(char *)(v41 + 23) < 0)
              operator delete(*(void **)v41);
            v53 = *(_OWORD *)v33;
            *(_QWORD *)(v41 + 16) = *((_QWORD *)v33 + 2);
            *(_OWORD *)v41 = v53;
            *((_BYTE *)v9 + 103) = 0;
            *(_BYTE *)v33 = 0;
            v54 = (void **)(v41 + 24);
            if (*(char *)(v41 + 47) < 0)
              operator delete(*v54);
            v55 = *(_OWORD *)((char *)v9 + 104);
            *(_QWORD *)(v41 + 40) = *((_QWORD *)v9 + 15);
            *(_OWORD *)v54 = v55;
            *((_BYTE *)v9 + 127) = 0;
            *((_BYTE *)v9 + 104) = 0;
            v56 = *((_OWORD *)v9 + 8);
            *(_OWORD *)(v41 + 57) = *(_OWORD *)((char *)v9 + 137);
            *(_OWORD *)(v41 + 48) = v56;
          }
          v30 = (TLCompositeTransliteratorCandidate *)((char *)v33 + 80);
          v31 += 80;
          v32 = v37;
          v9 = v33;
        }
        while ((__int128 *)((char *)v33 + 80) != v8);
      }
    }
  }
}

void sub_2493E7B68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unint64_t a10)
{
  uint64_t v10;

  if (v10)
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t *a1, __int128 *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v12;
  uint64_t v13;
  __int128 *v14;
  TLCompositeTransliteratorCandidate *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double TotalScore;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  TLCompositeTransliteratorCandidate *v34;
  double v35;
  double v36;
  uint64_t *v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  TLCompositeTransliteratorCandidate *v43;
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  int v59;
  __int128 v60;
  void **v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  void **v65;
  __int128 v66;
  __int128 v67;
  TLCompositeTransliteratorCandidate *v68;
  uint64_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 *v77;
  uint64_t v78;
  double v79;
  double v80;
  int v81;
  __int128 v82;
  void **v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  void **v87;
  __int128 v88;
  __int128 v89;
  TLCompositeTransliteratorCandidate *v90;
  uint64_t v91;
  uint64_t v92;
  TLCompositeTransliteratorCandidate *v93;
  uint64_t v97;
  __int128 *v98;
  uint64_t *v99;
  unint64_t v100;
  char v101;

  v98 = a2;
  v99 = a1;
  if (!a6)
    return;
  v8 = a8;
  v9 = a7;
  v12 = (uint64_t *)a2;
  v13 = (uint64_t)a1;
  v14 = v98;
  v15 = (TLCompositeTransliteratorCandidate *)a2;
  while (a6 > v8 && a5 > v8)
  {
    if (!a5)
      goto LABEL_45;
    v97 = a6;
    v16 = v12;
    v17 = 0;
    v18 = -a5;
    while (1)
    {
      v19 = v13;
      v13 += v17;
      v20 = *a4;
      TotalScore = TLCompositeTransliteratorCandidate::getTotalScore(v15, *(double *)(*a4 + 32));
      if (TotalScore > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v13, *(double *)(v20 + 32)))break;
      v17 += 80;
      v22 = __CFADD__(v18++, 1);
      v13 = v19;
      if (v22)
        goto LABEL_45;
    }
    v99 = (uint64_t *)v13;
    v23 = -v18;
    v24 = v97;
    if (-v18 >= v97)
    {
      if (v18 == -1)
      {
        v98 = v14;
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v99, &v98);
        return;
      }
      if (v18 > 0)
        v23 = 1 - v18;
      v30 = v23 >> 1;
      v93 = (TLCompositeTransliteratorCandidate *)(v19 + 80 * (v23 >> 1) + v17);
      v14 = (__int128 *)a3;
      if (a3 != (uint64_t *)v15)
      {
        v91 = v23 >> 1;
        v14 = (__int128 *)v15;
        v32 = *a4;
        v33 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)v15) >> 4);
        do
        {
          v34 = (TLCompositeTransliteratorCandidate *)&v14[5 * (v33 >> 1)];
          v35 = TLCompositeTransliteratorCandidate::getTotalScore(v34, *(double *)(v32 + 32));
          v36 = TLCompositeTransliteratorCandidate::getTotalScore(v93, *(double *)(v32 + 32));
          if (v35 <= v36)
            v33 >>= 1;
          else
            v33 += ~(v33 >> 1);
          if (v35 > v36)
            v14 = (__int128 *)((char *)v34 + 80);
        }
        while (v33);
        v24 = v97;
        v30 = v91;
      }
      v31 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v14 - (char *)v15) >> 4);
      v12 = (uint64_t *)v93;
    }
    else
    {
      if (v97 >= 0)
        v25 = v97;
      else
        v25 = v97 + 1;
      v92 = v25 >> 1;
      v14 = (__int128 *)&v16[10 * (v25 >> 1)];
      v26 = (uint64_t)v16 - v19 - v17;
      if (v26)
      {
        v90 = v15;
        v27 = 0xCCCCCCCCCCCCCCCDLL * (v26 >> 4);
        v16 = (uint64_t *)v13;
        do
        {
          v28 = *a4;
          v29 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v14, *(double *)(*a4 + 32));
          if (v29 > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)&v16[10 * (v27 >> 1)], *(double *)(v28 + 32)))
          {
            v27 >>= 1;
          }
          else
          {
            v16 += 10 * (v27 >> 1) + 10;
            v27 += ~(v27 >> 1);
          }
        }
        while (v27);
        v24 = v97;
        v15 = v90;
      }
      v30 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v16 - v19 - v17) >> 4);
      v12 = v16;
      v31 = v92;
    }
    if (v12 == (uint64_t *)v15)
    {
      v38 = (uint64_t *)v14;
    }
    else if (v15 == (TLCompositeTransliteratorCandidate *)v14)
    {
      v38 = v12;
    }
    else
    {
      v37 = std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<TLCompositeTransliteratorCandidate *>>(v12, (__int128 *)v15, v14);
      v24 = v97;
      v38 = v37;
    }
    a5 = -(v30 + v18);
    v39 = v24 - v31;
    if ((uint64_t)(v30 + v31) >= (uint64_t)(v24 - (v30 + v31) - v18))
    {
      v9 = a7;
      v41 = a5;
      a5 = v30;
      v8 = a8;
      std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v38, v14, a3, a4, v41, v24 - v31, a7, a8);
      v14 = (__int128 *)v12;
      v39 = v31;
      a3 = v38;
    }
    else
    {
      v40 = v30;
      v8 = a8;
      v9 = a7;
      std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v13, v12, v38, a4, v40, v31, a7, a8);
      v99 = v38;
      v13 = (uint64_t)v38;
      v12 = (uint64_t *)v14;
    }
    v15 = (TLCompositeTransliteratorCandidate *)v14;
    a6 = v39;
    if (!v39)
    {
LABEL_45:
      v98 = v14;
      return;
    }
  }
  v98 = v14;
  if (a5 <= a6)
  {
    if ((TLCompositeTransliteratorCandidate *)v13 != v15)
    {
      v68 = v15;
      v69 = a4;
      v70 = 0;
      v71 = 0;
      do
      {
        v72 = v9 + v70;
        v73 = (_QWORD *)(v13 + v70);
        v74 = *(_OWORD *)(v13 + v70);
        *(_QWORD *)(v72 + 16) = *(_QWORD *)(v13 + v70 + 16);
        *(_OWORD *)v72 = v74;
        v73[1] = 0;
        v73[2] = 0;
        *v73 = 0;
        v75 = *(_OWORD *)(v13 + v70 + 24);
        *(_QWORD *)(v72 + 40) = *(_QWORD *)(v13 + v70 + 40);
        *(_OWORD *)(v72 + 24) = v75;
        v73[4] = 0;
        v73[5] = 0;
        v73[3] = 0;
        v76 = *(_OWORD *)(v13 + v70 + 48);
        *(_OWORD *)(v72 + 57) = *(_OWORD *)(v13 + v70 + 57);
        *(_OWORD *)(v72 + 48) = v76;
        ++v71;
        v70 += 80;
      }
      while (v73 + 10 != (_QWORD *)v68);
      v52 = v9;
      v100 = v71;
      if (v70)
      {
        v77 = (__int128 *)(v9 + v70);
        while (v68 != (TLCompositeTransliteratorCandidate *)a3)
        {
          v78 = *v69;
          v79 = TLCompositeTransliteratorCandidate::getTotalScore(v68, *(double *)(*v69 + 32));
          v80 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v9, *(double *)(v78 + 32));
          v81 = *(char *)(v13 + 23);
          if (v79 <= v80)
          {
            if (v81 < 0)
              operator delete(*(void **)v13);
            v86 = *(_OWORD *)v9;
            *(_QWORD *)(v13 + 16) = *(_QWORD *)(v9 + 16);
            *(_OWORD *)v13 = v86;
            *(_BYTE *)(v9 + 23) = 0;
            *(_BYTE *)v9 = 0;
            v87 = (void **)(v13 + 24);
            if (*(char *)(v13 + 47) < 0)
              operator delete(*v87);
            v88 = *(_OWORD *)(v9 + 24);
            *(_QWORD *)(v13 + 40) = *(_QWORD *)(v9 + 40);
            *(_OWORD *)v87 = v88;
            *(_BYTE *)(v9 + 47) = 0;
            *(_BYTE *)(v9 + 24) = 0;
            v89 = *(_OWORD *)(v9 + 48);
            *(_OWORD *)(v13 + 57) = *(_OWORD *)(v9 + 57);
            *(_OWORD *)(v13 + 48) = v89;
            v9 += 80;
          }
          else
          {
            if (v81 < 0)
              operator delete(*(void **)v13);
            v82 = *(_OWORD *)v68;
            *(_QWORD *)(v13 + 16) = *((_QWORD *)v68 + 2);
            *(_OWORD *)v13 = v82;
            *((_BYTE *)v68 + 23) = 0;
            *(_BYTE *)v68 = 0;
            v83 = (void **)(v13 + 24);
            if (*(char *)(v13 + 47) < 0)
              operator delete(*v83);
            v84 = *(_OWORD *)((char *)v68 + 24);
            *(_QWORD *)(v13 + 40) = *((_QWORD *)v68 + 5);
            *(_OWORD *)v83 = v84;
            *((_BYTE *)v68 + 47) = 0;
            *((_BYTE *)v68 + 24) = 0;
            v85 = *((_OWORD *)v68 + 3);
            *(_OWORD *)(v13 + 57) = *(_OWORD *)((char *)v68 + 57);
            *(_OWORD *)(v13 + 48) = v85;
            v68 = (TLCompositeTransliteratorCandidate *)((char *)v68 + 80);
          }
          v13 += 80;
          if (v77 == (__int128 *)v9)
            goto LABEL_90;
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v101, (__int128 *)v9, v77, v13);
      }
      goto LABEL_90;
    }
  }
  else
  {
    v42 = (uint64_t)a3;
    if (v15 != (TLCompositeTransliteratorCandidate *)a3)
    {
      v43 = v15;
      v44 = a4;
      v45 = 0;
      v46 = 0;
      do
      {
        v47 = v9 + v45;
        v48 = (_QWORD *)((char *)v43 + v45);
        v49 = *(_OWORD *)((char *)v43 + v45);
        *(_QWORD *)(v47 + 16) = *(_QWORD *)((char *)v43 + v45 + 16);
        *(_OWORD *)v47 = v49;
        v48[1] = 0;
        v48[2] = 0;
        *v48 = 0;
        v50 = *(_OWORD *)((char *)v43 + v45 + 24);
        *(_QWORD *)(v47 + 40) = *(_QWORD *)((char *)v43 + v45 + 40);
        *(_OWORD *)(v47 + 24) = v50;
        v48[4] = 0;
        v48[5] = 0;
        v48[3] = 0;
        v51 = *(_OWORD *)((char *)v43 + v45 + 48);
        *(_OWORD *)(v47 + 57) = *(_OWORD *)((char *)v43 + v45 + 57);
        *(_OWORD *)(v47 + 48) = v51;
        ++v46;
        v45 += 80;
      }
      while (v48 + 10 != a3);
      v52 = v9;
      v100 = v46;
      if (v45)
      {
        v53 = v9 + v45;
        v54 = a3 - 10;
        while (v43 != (TLCompositeTransliteratorCandidate *)v13)
        {
          v55 = v42;
          v56 = *v44;
          v57 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(v53 - 80), *(double *)(*v44 + 32));
          v58 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)((char *)v43 - 80), *(double *)(v56 + 32));
          v59 = *((char *)v54 + 23);
          if (v57 <= v58)
          {
            if (v59 < 0)
              operator delete((void *)*v54);
            v64 = *(_OWORD *)(v53 - 80);
            v54[2] = *(_QWORD *)(v53 - 64);
            *(_OWORD *)v54 = v64;
            *(_BYTE *)(v53 - 57) = 0;
            *(_BYTE *)(v53 - 80) = 0;
            v65 = (void **)(v54 + 3);
            if (*((char *)v54 + 47) < 0)
              operator delete(*v65);
            v66 = *(_OWORD *)(v53 - 56);
            v54[5] = *(_QWORD *)(v53 - 40);
            *(_OWORD *)v65 = v66;
            v63 = v53;
            v53 -= 80;
          }
          else
          {
            if (v59 < 0)
              operator delete((void *)*v54);
            v60 = *((_OWORD *)v43 - 5);
            v54[2] = *((_QWORD *)v43 - 8);
            *(_OWORD *)v54 = v60;
            *((_BYTE *)v43 - 57) = 0;
            *((_BYTE *)v43 - 80) = 0;
            v61 = (void **)(v54 + 3);
            if (*((char *)v54 + 47) < 0)
              operator delete(*v61);
            v62 = *(_OWORD *)((char *)v43 - 56);
            v54[5] = *((_QWORD *)v43 - 5);
            *(_OWORD *)v61 = v62;
            v63 = (uint64_t)v43;
            v43 = (TLCompositeTransliteratorCandidate *)((char *)v43 - 80);
          }
          *(_BYTE *)(v63 - 33) = 0;
          *(_BYTE *)(v63 - 56) = 0;
          v67 = *(_OWORD *)(v63 - 32);
          *(_OWORD *)((char *)v54 + 57) = *(_OWORD *)(v63 - 23);
          *((_OWORD *)v54 + 3) = v67;
          v42 = v55 - 80;
          v54 -= 10;
          if (v53 == v52)
            goto LABEL_90;
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<std::__wrap_iter<TLCompositeTransliteratorCandidate *>>>((uint64_t)&v101, v53, v52, v42);
      }
      goto LABEL_90;
    }
  }
  v52 = v9;
  v100 = 0;
LABEL_90:
  if (v52)
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&v100, v52);
}

void sub_2493E8280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t a19)
{
  uint64_t v19;

  if (v19)
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a19, v19);
  _Unwind_Resume(exception_object);
}

void std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(unint64_t *a1, uint64_t a2)
{
  unint64_t v3;
  char *v4;

  if (*a1)
  {
    v3 = 0;
    v4 = (char *)(a2 + 23);
    do
    {
      if (v4[24] < 0)
        operator delete(*(void **)(v4 + 1));
      if (*v4 < 0)
        operator delete(*(void **)(v4 - 23));
      v4 += 80;
      ++v3;
    }
    while (v3 < *a1);
  }
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<std::__wrap_iter<TLCompositeTransliteratorCandidate *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  void **v10;
  __int128 v11;
  __int128 v12;

  v4 = a4;
  v5 = a2;
  if (a2 != a3)
  {
    v7 = a4 - 80;
    do
    {
      if (*(char *)(v7 + 23) < 0)
        operator delete(*(void **)v7);
      v8 = v5 - 80;
      v9 = *(_OWORD *)(v5 - 80);
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 - 64);
      *(_OWORD *)v7 = v9;
      *(_BYTE *)(v5 - 57) = 0;
      *(_BYTE *)(v5 - 80) = 0;
      v10 = (void **)(v7 + 24);
      if (*(char *)(v7 + 47) < 0)
        operator delete(*v10);
      v11 = *(_OWORD *)(v5 - 56);
      *(_QWORD *)(v7 + 40) = *(_QWORD *)(v5 - 40);
      *(_OWORD *)v10 = v11;
      *(_BYTE *)(v5 - 33) = 0;
      *(_BYTE *)(v5 - 56) = 0;
      v12 = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v7 + 57) = *(_OWORD *)(v5 - 23);
      *(_OWORD *)(v7 + 48) = v12;
      v4 -= 80;
      v7 -= 80;
      v5 -= 80;
    }
    while (v8 != a3);
    return a3;
  }
  return v5;
}

uint64_t *std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<TLCompositeTransliteratorCandidate *>>(uint64_t *a1, __int128 *a2, __int128 *a3)
{
  __int128 *v4;
  uint64_t *v5;
  __int128 *v6;
  uint64_t *v7;
  __int128 *v8;
  __int128 *v10;
  uint64_t *v11;

  v4 = a2;
  v10 = a2;
  v11 = a1;
  while (1)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v11, &v10);
    v5 = v11 + 10;
    v6 = v10 + 5;
    v10 = v6;
    v11 += 10;
    if (v6 == a3)
      break;
    if (v5 == (uint64_t *)v4)
      v4 = v6;
  }
  if (v5 != (uint64_t *)v4)
  {
    do
    {
      v10 = v4;
      while (1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v11, &v10);
        v7 = v11 + 10;
        v8 = v10 + 5;
        v10 = v8;
        v11 += 10;
        if (v8 == a3)
          break;
        if (v7 == (uint64_t *)v4)
          v4 = v8;
      }
    }
    while (v7 != (uint64_t *)v4);
  }
  return v5;
}

void TLCreateStringWithValidatedFormat(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2493D1000, log, OS_LOG_TYPE_ERROR, "Failed to create string with format %@:%@", (uint8_t *)&v3, 0x16u);
}

void TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(char *a1, _QWORD *a2, os_log_t log)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_2493D1000, log, OS_LOG_TYPE_ERROR, "Failed to get seq2seq candidates for string: %s, translateString timedout", (uint8_t *)&v4, 0xCu);
}

void TLCompositeTransliterator::getTransliterationCandidates(int a1, char *a2, uint8_t *buf, os_log_t log)
{
  char *v5;

  if (a2[23] >= 0)
    v5 = a2;
  else
    v5 = *(char **)a2;
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "Candidates";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_2493D1000, log, OS_LOG_TYPE_DEBUG, "%s:\n %s", buf, 0x16u);
  if (a2[23] < 0)
    operator delete(*(void **)a2);
}

uint64_t CEMEmojiLocaleDataCreateEmojiTokensForString()
{
  return MEMORY[0x24BE1B210]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x24BE1B258]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

uint64_t CFBurstTrieAddUTF8String()
{
  return MEMORY[0x24BDBBB00]();
}

uint64_t CFBurstTrieCreate()
{
  return MEMORY[0x24BDBBB18]();
}

uint64_t CFBurstTrieCreateFromMapBytes()
{
  return MEMORY[0x24BDBBB30]();
}

uint64_t CFBurstTrieFindUTF8String()
{
  return MEMORY[0x24BDBBB50]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x24BDBBB60]();
}

uint64_t CFBurstTrieSerializeWithFileDescriptor()
{
  return MEMORY[0x24BDBBB70]();
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBBF0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBBF8](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x24BDBBC08](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC18](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
  MEMORY[0x24BDBBC50](theSet, theOtherSet);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateStringWithValidatedFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef validFormatSpecifiers, CFStringRef format, va_list arguments, CFErrorRef *errorPtr)
{
  return (CFStringRef)MEMORY[0x24BDBC550](alloc, formatOptions, validFormatSpecifiers, format, arguments, errorPtr);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
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

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
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

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E0](theString, range.location, range.length, replacement);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x24BE5F7C0]();
}

uint64_t LXTransliterationCreate()
{
  return MEMORY[0x24BE5F120]();
}

uint64_t LXTransliterationEntryCopyNativeString()
{
  return MEMORY[0x24BE5F128]();
}

uint64_t LXTransliterationEnumerateForTransliterated()
{
  return MEMORY[0x24BE5F130]();
}

uint64_t LXTransliterationHasNativeWord()
{
  return MEMORY[0x24BE5F138]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void language_modeling::v1::Probability::~Probability(language_modeling::v1::Probability *this)
{
  MEMORY[0x24BE5ECD0](this);
}

uint64_t language_modeling::v1::LanguageModel::wireMemory(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x24BE5ECD8](this);
}

uint64_t language_modeling::v1::LanguageModel::unwireMemory(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x24BE5ECE0](this);
}

uint64_t language_modeling::v1::LanguageModel::init()
{
  return MEMORY[0x24BE5ECF8]();
}

uint64_t language_modeling::v1::LanguageModel::LanguageModel(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x24BE5ED00](this);
}

void language_modeling::v1::LanguageModel::~LanguageModel(language_modeling::v1::LanguageModel *this)
{
  MEMORY[0x24BE5ED08](this);
}

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x24BE5ED10]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x24BE5ED28](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  MEMORY[0x24BE5ED30](this);
}

uint64_t language_modeling::v1::LanguageModelSession::supportsFragmentsBasedConditionalProbability(language_modeling::v1::LanguageModelSession *this)
{
  return MEMORY[0x24BE5ED48](this);
}

void language_modeling::v1::LanguageModelSession::~LanguageModelSession(language_modeling::v1::LanguageModelSession *this)
{
  MEMORY[0x24BE5ED50](this);
}

uint64_t language_modeling::v1::Probability::probability()
{
  return MEMORY[0x24BE5EDA8]();
}

uint64_t language_modeling::v1::LanguageModel::makeDefaultSession(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x24BE5EDC8](this);
}

uint64_t language_modeling::v1::LanguageModelSession::canReasonAbout()
{
  return MEMORY[0x24BE5EDE0]();
}

uint64_t language_modeling::v1::LanguageModelSession::detailedConditionalProbability()
{
  return MEMORY[0x24BE5EDE8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
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

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
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
  return off_251A53A40();
}

void operator delete(void *__p)
{
  off_251A53A48(__p);
}

uint64_t operator delete()
{
  return off_251A53A50();
}

uint64_t operator new[]()
{
  return off_251A53A58();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251A53A60(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_251A53A68(__sz, a2);
}

uint64_t operator new()
{
  return off_251A53A70();
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

