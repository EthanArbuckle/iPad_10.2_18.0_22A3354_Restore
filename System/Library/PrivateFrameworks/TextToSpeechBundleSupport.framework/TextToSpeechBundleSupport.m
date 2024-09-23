uint64_t _TTSSystemFocusedPid()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v0 = (void *)getAXSpringBoardServerClass_softClass;
  v10 = getAXSpringBoardServerClass_softClass;
  if (!getAXSpringBoardServerClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getAXSpringBoardServerClass_block_invoke;
    v6[3] = &unk_24D44C0C8;
    v6[4] = &v7;
    __getAXSpringBoardServerClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v1, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedAppPID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

void sub_215BA48D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSpringBoardServerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXSpringBoardServer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getAXSpringBoardServerClass_block_invoke_cold_1();
    free(v3);
  }
  getAXSpringBoardServerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_215BA4B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_215BA4D64(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<SiriTTS::VoiceResource>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
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

void sub_215BA533C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  void *v29;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (a2)
  {

    __cxa_begin_catch(exception_object);
    AXTTSLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[TTSSiriSynthWrapper initWithVoicePath:language:censorPlainText:delegate:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

    if (objc_msgSend(v28, "synthesizer"))
    {
      v39 = MEMORY[0x2199ECE6C]();
      MEMORY[0x2199ECEE4](v39, 0x20C40A4A59CD2);
    }
    objc_msgSend(v28, "setSynthesizer:", 0);
    __cxa_end_catch();
    JUMPOUT(0x215BA52ECLL);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_215BA5534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TTSSiriSynthWrapper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_215BA55F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_215BA5690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215BA58DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char *a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  uint64_t v26;

  *(_QWORD *)(v26 - 96) = &a22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v26 - 96));
  a22 = &a25;
  std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  _Unwind_Resume(a1);
}

void sub_215BA59B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215BA5B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_215BA5C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_215BA5D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_215BA5DC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215BA6074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, const std::logic_error a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,char *a25)
{
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  void *exception_ptr;
  NSObject *v35;
  void *v36;

  v30 = a25;
  if (a25 == &a22)
  {
    v31 = 4;
    v30 = &a22;
  }
  else
  {
    if (!a25)
      goto LABEL_15;
    v31 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v30 + 8 * v31))();
LABEL_15:
  if (a2 == 1)
  {
    exception_ptr = __cxa_get_exception_ptr(a1);
    MEMORY[0x2199ECE84](&a9, exception_ptr);
    __cxa_begin_catch(a1);
    AXTTSLogCommon();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      __40__TTSSiriSynthWrapper_synthesizeString___block_invoke_cold_1(&a9, v35);

    objc_msgSend(*(id *)(v26 + 32), "setSynthesizing:", 0);
    objc_msgSend(*(id *)(v26 + 32), "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "siriDidEndSynthesis:successfully:", *(_QWORD *)(v26 + 32), 0);

    MEMORY[0x2199ECE9C](&a9);
    __cxa_end_catch();
    JUMPOUT(0x215BA5FD4);
  }
  v32 = *(_QWORD **)(v27 - 48);
  if (v32 == (_QWORD *)(v27 - 72))
  {
    v33 = 4;
    v32 = (_QWORD *)(v27 - 72);
  }
  else
  {
    if (!v32)
      goto LABEL_11;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_11:
  *(_QWORD *)(v27 - 72) = &a10;
  std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100]((void ***)(v27 - 72));
  if (__p)
  {
    a14 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a21 < 0)
    operator delete(a16);

  _Unwind_Resume(a1);
}

void sub_215BA62A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215BA6350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_215BA66D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_215BA6984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215BA6AC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D44BC90, MEMORY[0x24BEDAAF0]);
}

void sub_215BA6CE0(_Unwind_Exception *a1)
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

void *std::allocator<float>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
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

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_215BA6F20(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::allocator<float>::allocate_at_least[abi:ne180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
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

void std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 72;
        std::__destroy_at[abi:ne180100]<TTSSynthesizer::SpeakingStyle,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<TTSSynthesizer::SpeakingStyle,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
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

uint64_t std::shared_ptr<SiriTTS::VoiceResource>::~shared_ptr[abi:ne180100](uint64_t a1)
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

uint64_t _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEED1Ev(uint64_t a1)
{

  return a1;
}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEED0Ev(uint64_t a1)
{

  JUMPOUT(0x2199ECEE4);
}

_QWORD *_ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7__cloneEv(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x28uLL);
  *v2 = &off_24D44C208;
  v2[1] = *(id *)(a1 + 8);
  *((_OWORD *)v2 + 1) = *(_OWORD *)(a1 + 16);
  v2[4] = *(_QWORD *)(a1 + 32);
  return v2;
}

__n128 _ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7__cloneEPNS0_6__baseIS7_EE(uint64_t a1, __n128 *a2)
{
  unint64_t v4;
  __n128 result;

  a2->n128_u64[0] = (unint64_t)&off_24D44C208;
  a2->n128_u64[1] = (unint64_t)*(id *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 32);
  result = *(__n128 *)(a1 + 16);
  a2[1] = result;
  a2[2].n128_u64[0] = v4;
  return result;
}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7destroyEv(uint64_t a1)
{

}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE18destroy_deallocateEv(id *a1)
{

  operator delete(a1);
}

uint64_t _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEEclEOS6_(uint64_t a1, _DWORD *a2, __n128 a3)
{
  __int16 v3;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void **v20;
  char *v21;
  char *v22;
  char *v23;
  id *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;
  unsigned int v38;
  unsigned int v39;
  char v40;
  int64_t v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  unsigned __int8 *v46;
  int v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int16 v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  void *v66;
  void *v67;
  void *v68;
  __n128 v70;
  void *__p;
  unint64_t v72;
  _QWORD v73[2];
  id v74;
  _BYTE *v75;
  id v76;
  _DWORD v77[4];
  uint64_t v78;
  _BYTE buf[24];
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  switch(*a2)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 8), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriDidStartSynthesis:", *(_QWORD *)(a1 + 8));
      goto LABEL_12;
    case 1:
      v24 = (id *)(a1 + 8);
      objc_msgSend(*(id *)(a1 + 8), "setSynthesizing:", 0);
      objc_msgSend(*v24, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriDidEndSynthesis:successfully:", *v24, 1);
LABEL_12:

      return 0;
    case 4:
      v6 = *(uint64_t **)(a1 + 16);
      v7 = *v6;
      v8 = v6[1];
      if (v7 == v8)
        return 0;
      v9 = v8 - v7;
      v77[0] = 1;
      v77[2] = 1;
      v77[3] = v8 - v7;
      v78 = v7;
      v10 = objc_alloc(MEMORY[0x24BDB1840]);
      objc_msgSend(*(id *)(a1 + 8), "engineFormat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithPCMFormat:bufferListNoCopy:deallocator:", v11, v77, &__block_literal_global_198);

      v13 = objc_alloc(MEMORY[0x24BDB1840]);
      objc_msgSend(*(id *)(a1 + 8), "outputFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithPCMFormat:frameCapacity:", v14, v9 >> 1);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v80 = 0;
      objc_msgSend(*(id *)(a1 + 8), "bufferConverter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = buf;
      v76 = 0;
      __p = (void *)MEMORY[0x24BDAC760];
      v72 = 3221225472;
      v73[0] = ___ZZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_ENK3__0clEN14TTSSynthesizer15CallbackMessageE_block_invoke_2;
      v73[1] = &unk_24D44C2C0;
      v17 = v12;
      v74 = v17;
      objc_msgSend(v16, "convertToBuffer:error:withInputFromBlock:", v15, &v76, &__p);
      v18 = v76;

      objc_msgSend(*(id *)(a1 + 8), "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "siri:didGenerateBuffer:", *(_QWORD *)(a1 + 8), v15);

      v20 = *(void ***)(a1 + 16);
      v22 = (char *)*v20;
      v21 = (char *)v20[1];
      if ((((_DWORD)v21 - *v20) & 1) == 0)
        goto LABEL_9;
      v23 = v21 - 1;
      if (v22 != v21 - 1)
      {
        if (v21 != v23)
          memmove(*v20, v23, 1uLL);
        ++v22;
LABEL_9:
        v20[1] = v22;
      }

      _Block_object_dispose(buf, 8);
      return 0;
    case 5:
      __p = 0;
      v72 = 0;
      v73[0] = 0;
      v25 = *(uint64_t **)(a1 + 24);
      v26 = *v25;
      v27 = v25[1];
      if (*v25 == v27)
        goto LABEL_92;
      v28 = MEMORY[0x24BDAC740];
      v29 = 0x24BDD1000uLL;
      a3.n128_u64[0] = 138412546;
      v70 = a3;
      break;
    default:
      return 0;
  }
  do
  {
    if (*(_DWORD *)v26 == 1)
    {
      v33 = *(char *)(v26 + 55);
      if (v33 >= 0)
        v34 = (unsigned __int8 *)(v26 + 32);
      else
        v34 = *(unsigned __int8 **)(v26 + 32);
      if (v33 >= 0)
        v35 = *(unsigned __int8 *)(v26 + 55);
      else
        v35 = *(_QWORD *)(v26 + 40);
      if (v35 < 1)
      {
        v39 = 0;
LABEL_31:
        v40 = 1;
        goto LABEL_72;
      }
      v36 = &v34[v35];
      v37 = v34 + 1;
      if (v35 != 1)
      {
        v38 = *v34;
        if (v38 != 48)
        {
LABEL_35:
          if (v38 != 36)
          {
            if ((v38 & 0x80) == 0 && (*(_DWORD *)(v28 + 4 * v38 + 60) & 0x400) != 0)
            {
              v39 = 0;
              while (1)
              {
                v54 = (char)*v34;
                if ((v54 & 0x80000000) != 0 || (*(_DWORD *)(v28 + 4 * v54 + 60) & 0x400) == 0)
                  goto LABEL_70;
                v39 = v54 + 10 * v39 - 48;
                ++v34;
                v40 = 1;
                if (v34 >= v36)
                  goto LABEL_71;
              }
            }
            if (v38 == 39 || v38 == 34)
            {
              if ((unint64_t)v35 < 2)
              {
LABEL_58:
                v39 = 0;
                goto LABEL_70;
              }
              v39 = 0;
              v46 = v34 + 2;
              while (1)
              {
                v47 = *(v46 - 1);
                if (v38 == v47)
                  break;
                v39 = v47 | (v39 << 8);
                v40 = 1;
                if (v46 < v36)
                {
                  ++v46;
                  if (!HIBYTE(v39))
                    continue;
                }
                goto LABEL_71;
              }
            }
            else
            {
              v39 = (v38 << 24) | (v34[1] << 16) | (v34[2] << 8) | v34[3];
            }
LABEL_70:
            v40 = 1;
LABEL_71:
            v29 = 0x24BDD1000;
            goto LABEL_72;
          }
LABEL_36:
          if (v37 < v36)
          {
            v39 = 0;
            v41 = &v34[v35] - v37;
            v29 = 0x24BDD1000;
            do
            {
              v42 = (char)*v37;
              if ((v42 & 0x80000000) != 0)
                break;
              v43 = *(_DWORD *)(v28 + 4 * v42 + 60);
              if ((v43 & 0x10000) == 0)
                break;
              v44 = (v43 & 0x1000) != 0 ? -87 : -55;
              v45 = (v43 & 0x400) != 0 ? -48 : v44;
              v39 = v42 + 16 * v39 + v45;
              ++v37;
              --v41;
            }
            while (v41);
            goto LABEL_31;
          }
          goto LABEL_58;
        }
        if (__toupper((char)*v37) == 88)
        {
          v37 = v34 + 2;
          goto LABEL_36;
        }
      }
      v38 = *v34;
      goto LABEL_35;
    }
    if (*(_DWORD *)v26)
      goto LABEL_89;
    v30 = *(_QWORD *)(v26 + 16);
    if (!v30)
      goto LABEL_60;
    v31 = *(_QWORD *)(v26 + 8) + v30;
    v32 = *(_QWORD *)(a1 + 32);
    if (*(char *)(v32 + 23) < 0)
    {
      if (v31 > *(_QWORD *)(v32 + 8))
        goto LABEL_60;
LABEL_63:
      v49 = objc_msgSend(MEMORY[0x24BEB6268], "utf16RangeFromUTF8Range:chars:size:", *(_OWORD *)&v70);
      v51 = v50;
      objc_msgSend(*(id *)(a1 + 8), "processedSpeechString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v52, "translateRangeInTransformedString:", v49, v51);
      v3 = v53;

      v40 = 0;
LABEL_72:
      v55 = *(_QWORD *)(v26 + 24);
      v56 = v72;
      if (v72 >= v73[0])
      {
        v58 = __p;
        v59 = (uint64_t)(v72 - (_QWORD)__p) >> 4;
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 60)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v61 = v73[0] - (_QWORD)__p;
        if ((uint64_t)(v73[0] - (_QWORD)__p) >> 3 > v60)
          v60 = v61 >> 3;
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0)
          v62 = 0xFFFFFFFFFFFFFFFLL;
        else
          v62 = v60;
        if (v62)
        {
          v63 = (char *)std::allocator<SiriTTSMarker>::allocate_at_least[abi:ne180100]((uint64_t)v73, v62);
          v58 = __p;
          v56 = v72;
          v29 = 0x24BDD1000;
        }
        else
        {
          v63 = 0;
        }
        v64 = &v63[16 * v59];
        *v64 = v40;
        v64[1] = 0;
        *((_WORD *)v64 + 1) = v3;
        *((_DWORD *)v64 + 1) = v39;
        *((_QWORD *)v64 + 1) = v55;
        v65 = v64;
        if ((void *)v56 != v58)
        {
          do
          {
            *((_OWORD *)v65 - 1) = *(_OWORD *)(v56 - 16);
            v65 -= 16;
            v56 -= 16;
          }
          while ((void *)v56 != v58);
          v58 = __p;
        }
        v57 = (unint64_t)(v64 + 16);
        __p = v65;
        v72 = (unint64_t)(v64 + 16);
        v73[0] = &v63[16 * v62];
        if (v58)
          operator delete(v58);
      }
      else
      {
        *(_BYTE *)v72 = v40;
        *(_BYTE *)(v56 + 1) = 0;
        *(_WORD *)(v56 + 2) = v3;
        *(_DWORD *)(v56 + 4) = v39;
        v57 = v56 + 16;
        *(_QWORD *)(v56 + 8) = v55;
      }
      v72 = v57;
      goto LABEL_89;
    }
    if (v31 <= *(unsigned __int8 *)(v32 + 23))
      goto LABEL_63;
LABEL_60:
    AXTTSLogCommon();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v29 + 1760), "numberWithUnsignedLong:", *(_QWORD *)(v26 + 8));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v29 + 1760), "numberWithUnsignedLong:", *(_QWORD *)(v26 + 16));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v70.n128_u32[0];
      *(_QWORD *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v67;
      _os_log_error_impl(&dword_215BA2000, v48, OS_LOG_TYPE_ERROR, "Siri returned invalid word marker [%@,%@], skipping.", buf, 0x16u);

      v29 = 0x24BDD1000;
    }

LABEL_89:
    v26 += 56;
  }
  while (v26 != v27);
  if (__p != (void *)v72)
  {
    objc_msgSend(*(id *)(a1 + 8), "delegate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "siri:didGenerateMarkers:count:", *(_QWORD *)(a1 + 8));

  }
LABEL_92:
  std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](*(uint64_t **)(a1 + 24));
  if (__p)
  {
    v72 = (unint64_t)__p;
    operator delete(__p);
  }
  return 0;
}

void sub_215BA7A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  void *v23;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t _ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE11target_typeEv()
{
  return &_ZTIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0;
}

id ___ZZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_ENK3__0clEN14TTSSynthesizer15CallbackMessageE_block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    *a3 = 0;
    return *(id *)(a1 + 32);
  }
}

void *std::allocator<SiriTTSMarker>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

Swift::UInt32 __swiftcall String.osType()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  Swift::UInt32 result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = sub_215BB33B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  sub_215BB33AC();
  sub_215BB33A0();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v5 >> 60 != 15)
    __asm { BR              X10 }
  result = v8;
  if (HIDWORD(v8))
  {
    __break(1u);
    JUMPOUT(0x215BA7F14);
  }
  return result;
}

uint64_t sub_215BA7F54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_215BA7F68(a1, a2);
  return a1;
}

uint64_t sub_215BA7F68(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_215BA7FAC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1)
  {
    __break(1u);
    JUMPOUT(0x215BA8028);
  }
  return ((uint64_t (*)(void))((char *)&loc_215BA7FBC + *((int *)qword_215BA8028 + (a3 >> 62))))();
}

uint64_t sub_215BA8038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v10;

  result = sub_215BB3064();
  v10 = result;
  if (result)
  {
    result = sub_215BB307C();
    if (__OFSUB__(a1, result))
      goto LABEL_7;
    v10 += a1 - result;
  }
  if (!__OFSUB__(a2, a1))
  {
    sub_215BB3070();
    sub_215BA7FAC(v10, a4, a5);
    return sub_215BA7F68(a4, a5);
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_215BA80DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_215BA80F0(a1, a2);
  return a1;
}

uint64_t sub_215BA80F0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_215BA8134()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DF98F0);
  __swift_allocate_value_buffer(v0, qword_254DF9DD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DF9DD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AE0);
  return sub_215BB31FC();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199ED37C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_215BA820C()
{
  uint64_t result;
  uint64_t v1;

  result = *MEMORY[0x24BDFE1A8];
  if (*MEMORY[0x24BDFE1A8])
  {
    result = sub_215BB3424();
    qword_253D74EE0 = result;
    qword_253D74EE8 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_215BA8244()
{
  uint64_t v0;

  v0 = sub_215BB3220();
  __swift_allocate_value_buffer(v0, qword_253D74F08);
  __swift_project_value_buffer(v0, (uint64_t)qword_253D74F08);
  if (qword_253D74EF8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_215BB3214();
}

uint64_t sub_215BA82FC()
{
  return 1;
}

uint64_t sub_215BA8304()
{
  sub_215BB36E8();
  sub_215BB36F4();
  return sub_215BB3700();
}

uint64_t sub_215BA8344()
{
  return sub_215BB36F4();
}

uint64_t sub_215BA8368()
{
  sub_215BB36E8();
  sub_215BB36F4();
  return sub_215BB3700();
}

_QWORD *sub_215BA83A4@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_215BA83B8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t type metadata accessor for TTSSiriSynthAudioUnit()
{
  uint64_t result;

  result = qword_253D74F40;
  if (!qword_253D74F40)
    return swift_getSingletonMetadata();
  return result;
}

__n128 sub_215BA83FC@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = a1 + qword_253D750B0;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

uint64_t sub_215BA8448()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_253D750B0;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

__n128 sub_215BA8490(uint64_t a1, uint64_t a2, __n128 *a3)
{
  __n128 *v3;
  __n128 result;
  __n128 v5;
  __n128 v6;

  v3 = (__n128 *)(a1 + qword_253D750B0);
  v5 = a3[1];
  v6 = *a3;
  swift_beginAccess();
  result = v5;
  *v3 = v6;
  v3[1] = v5;
  return result;
}

uint64_t sub_215BA84E8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  uint64_t result;

  v5 = a4;
  v6 = a3;
  v7 = a2;
  v8 = a1;
  v9 = HIDWORD(a1);
  v10 = HIDWORD(a2);
  v11 = HIDWORD(a3);
  v12 = HIDWORD(a4);
  v13 = (_DWORD *)(v4 + qword_253D750B0);
  result = swift_beginAccess();
  *v13 = v8;
  v13[1] = v9;
  v13[2] = v7;
  v13[3] = v10;
  v13[4] = v6;
  v13[5] = v11;
  v13[6] = v5;
  v13[7] = v12;
  return result;
}

uint64_t sub_215BA8578@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  result = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                + (*MEMORY[0x24BEE4EA0] & **a1)
                                + 288))();
  *(_QWORD *)a2 = result;
  *(_DWORD *)(a2 + 8) = v4;
  *(_DWORD *)(a2 + 12) = v5;
  *(_DWORD *)(a2 + 16) = v6;
  *(_DWORD *)(a2 + 20) = v7;
  *(_DWORD *)(a2 + 24) = v8;
  *(_DWORD *)(a2 + 28) = v9;
  return result;
}

uint64_t sub_215BA85E0(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(class metadata base offset for TTSSiriSynthAudioUnit
                                                                   + (*MEMORY[0x24BEE4EA0] & **a2)
                                                                   + 296))(*a1, a1[1], a1[2], a1[3]);
}

uint64_t (*sub_215BA8634())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_215BA867C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = qword_253D75078;
  v2 = *(void **)(v0 + qword_253D75078);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_253D75078);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)sub_215BB32D4()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id TTSSiriSynthAudioUnit.__allocating_init(componentDescription:options:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[2];
  int v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v9[0] = a1;
  v9[1] = a2;
  v10 = a3;
  v5 = objc_msgSend(objc_allocWithZone(v4), sel_initWithComponentDescription_options_error_, v9, a4, v11);
  if (v5)
  {
    v6 = v11[0];
  }
  else
  {
    v7 = v11[0];
    sub_215BB30A0();

    swift_willThrow();
  }
  return v5;
}

char *TTSSiriSynthAudioUnit.init(componentDescription:options:)(unint64_t a1, unint64_t a2, int a3, unsigned int a4)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unint64_t v42;
  unsigned int v43;
  unint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  char *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v66;
  _BYTE v67[16];
  id v68;
  unint64_t v69;
  unint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  unsigned int v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  objc_class *v94;
  _BYTE *v95;
  objc_super v96;
  id v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;

  v72 = a4;
  v71 = a3;
  v70 = a2;
  v69 = a1;
  v101 = *MEMORY[0x24BDAC8D0];
  v5 = sub_215BB352C();
  v92 = *(_QWORD *)(v5 - 8);
  v93 = v5;
  MEMORY[0x24BDAC7A8]();
  v91 = &v67[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v90 = sub_215BB3520();
  MEMORY[0x24BDAC7A8]();
  v89 = &v67[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_215BB3310();
  MEMORY[0x24BDAC7A8]();
  v95 = &v67[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = &v4[qword_253D74F30];
  v88 = sub_215BB299C(0, (unint64_t *)&unk_253D74E78);
  v94 = (objc_class *)type metadata accessor for TTSSiriSynthAudioUnit();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = (void *)objc_opt_self();
  v12 = v4;
  v13 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_215BB3088();

  v14 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_215BB3088();

  v15 = MEMORY[0x24BEE4AF8];
  sub_215BB3514();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v97 = 0;
  v100 = 0;
  v98 = 0u;
  v99 = 0u;
  v84 = v9;
  sub_215BB3154();
  v16 = (char *)v12 + qword_253D750B0;
  *v16 = 0u;
  v16[1] = 0u;
  v82 = qword_253D75078;
  *(_QWORD *)((char *)v12 + qword_253D75078) = 0;
  v17 = qword_253D75090;
  sub_215BB299C(0, &qword_253D74E20);
  sub_215BB32F8();
  *(_QWORD *)&v98 = v15;
  v87 = sub_215BA9340();
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DD0);
  v88 = sub_215BB0CF0((unint64_t *)&unk_253D74DD8, &qword_253D74DD0, MEMORY[0x24BEE12C8]);
  sub_215BB35C8();
  v85 = *MEMORY[0x24BEE5750];
  v18 = v91;
  v92 = *(_QWORD *)(v92 + 104);
  v19 = v93;
  ((void (*)(_BYTE *))v92)(v91);
  v20 = sub_215BB3544();
  v83 = v17;
  *(_QWORD *)((char *)v12 + v17) = v20;
  v81 = qword_253D75088;
  *(_QWORD *)((char *)v12 + qword_253D75088) = 0;
  *(_QWORD *)((char *)v12 + qword_253D74F70) = 0x40E7700000000000;
  *(_DWORD *)((char *)v12 + qword_253D74F88) = 1;
  *(_DWORD *)((char *)v12 + qword_253D75060) = 1;
  *(_DWORD *)((char *)v12 + qword_253D74F58) = 1024;
  v73 = qword_253D75010;
  *(_QWORD *)((char *)v12 + qword_253D75010) = 0;
  v74 = qword_253D74F98;
  *(_QWORD *)((char *)v12 + qword_253D74F98) = 0;
  v75 = qword_253D75000;
  *(_QWORD *)((char *)v12 + qword_253D75000) = 0;
  v76 = qword_253D75098;
  *(_QWORD *)((char *)v12 + qword_253D75098) = 0;
  v78 = qword_253D74FE0;
  v21 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)((char *)v12 + qword_253D74FE0) = MEMORY[0x24BEE4AF8];
  v80 = qword_253D74FC8;
  *(_QWORD *)((char *)v12 + qword_253D74FC8) = 0;
  *(_QWORD *)((char *)v12 + qword_253D75070) = 0;
  v79 = qword_253D74FA8;
  *(_QWORD *)((char *)v12 + qword_253D74FA8) = v21;
  v22 = v21;
  *(_QWORD *)((char *)v12 + qword_253D74F90) = 0;
  v23 = qword_253D74FF8;
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14C8]), sel_init);
  v77 = v23;
  v68 = v24;
  *(_QWORD *)((char *)v12 + v23) = v24;
  v25 = qword_253D74F80;
  sub_215BB3304();
  *(_QWORD *)&v98 = v22;
  sub_215BB35C8();
  ((void (*)(_BYTE *, _QWORD, uint64_t))v92)(v18, v85, v19);
  v26 = sub_215BB3544();
  v95 = (_BYTE *)v25;
  *(_QWORD *)((char *)v12 + v25) = v26;
  v27 = qword_253D74F68;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D74E50);
  v28 = swift_allocObject();
  *(_DWORD *)(v28 + 16) = 0;
  *(_QWORD *)((char *)v12 + v27) = v28;
  v29 = (char *)v12 + qword_253D75030;
  *v29 = 0;
  v29[1] = 0;
  v30 = (char *)v12 + qword_253D75058;
  *v30 = 0;
  v30[1] = 0;
  v31 = (char *)v12 + qword_253D74FD0;
  *(_QWORD *)v31 = 0;
  *((_QWORD *)v31 + 1) = 0;
  v31[16] = 1;
  v32 = (char *)v12 + qword_253D75048;
  *(_QWORD *)v32 = 0;
  v32[8] = 1;
  *((_BYTE *)v12 + qword_253D75020) = 0;
  v33 = (char *)v12 + qword_253D74FB8;
  v34 = sub_215BB3124();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v33, 1, 1, v34);
  *((_BYTE *)v12 + qword_253D74F50) = 1;
  *((_BYTE *)v12 + qword_253D74F28) = 2;
  *(_QWORD *)((char *)v12 + qword_253D75040) = 0;
  *(_QWORD *)((char *)v12 + qword_253D74FE8) = MEMORY[0x24BEE4AF8];
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1820]), sel_initStandardFormatWithSampleRate_channels_, 1, 48000.0);
  if (!v35)
  {

    *(_QWORD *)&v98 = sub_215BB299C(0, &qword_254DF98F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9900);
    v59 = sub_215BB33C4();
    v61 = v60;
    sub_215BA93CC();
    swift_allocError();
    *(_QWORD *)v62 = v59;
    *(_QWORD *)(v62 + 8) = v61;
    *(_BYTE *)(v62 + 16) = 1;
    swift_willThrow();
LABEL_7:
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v64 - 8) + 8))(v84, v64);

    swift_release();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_215BB2AB4((uint64_t)v33, &qword_253D74DB8);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    return v33;
  }
  v36 = v35;
  v37 = objc_allocWithZone(MEMORY[0x24BE0A838]);
  *(_QWORD *)&v98 = 0;
  v38 = objc_msgSend(v37, sel_initWithFormat_error_, v36, &v98);
  v39 = (void *)v98;
  if (!v38)
  {
    v63 = (id)v98;
    sub_215BB30A0();

    swift_willThrow();
    goto LABEL_7;
  }
  v40 = v38;
  v41 = v69;
  v42 = HIDWORD(v69);
  v43 = v70;
  v44 = HIDWORD(v70);
  *(_QWORD *)((char *)v12 + qword_253D750A0) = v38;
  v45 = v39;
  objc_msgSend(v40, sel_setMaximumChannelCount_, 1);
  v46 = v68;
  v47 = (void *)sub_215BB3388();
  objc_msgSend(v46, sel_setName_, v47);

  v96.receiver = v12;
  v96.super_class = v94;
  v97 = 0;
  *(_QWORD *)&v98 = __PAIR64__(v42, v41);
  *((_QWORD *)&v98 + 1) = __PAIR64__(v44, v43);
  LODWORD(v99) = v71;
  v48 = objc_msgSendSuper2(&v96, sel_initWithComponentDescription_options_error_, &v98, v72, &v97);
  if (v48)
  {
    v49 = v48;
    v50 = v97;
    v51 = v49;
    objc_msgSend(v51, sel_setMaximumFramesToRender_, 1024);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D74E60);
    v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_215BB42C0;
    v53 = *(void **)&v51[qword_253D750A0];
    *(_QWORD *)(v52 + 32) = v53;
    *(_QWORD *)&v98 = v52;
    sub_215BB34B4();
    v54 = objc_allocWithZone(MEMORY[0x24BE0A840]);
    sub_215BB299C(0, (unint64_t *)&unk_253D74DF8);
    v33 = v51;
    v55 = v53;
    v56 = (void *)sub_215BB349C();
    swift_bridgeObjectRelease();
    v57 = objc_msgSend(v54, sel_initWithAudioUnit_busType_busses_, v33, 2, v56);

    v58 = *(void **)&v33[qword_253D75010];
    *(_QWORD *)&v33[qword_253D75010] = v57;

  }
  else
  {
    v66 = v97;
    v33 = (char *)sub_215BB30A0();

    swift_willThrow();
  }
  return v33;
}

unint64_t sub_215BA9340()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D74E18;
  if (!qword_253D74E18)
  {
    v1 = sub_215BB3520();
    result = MEMORY[0x2199ED394](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_253D74E18);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199ED388](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_215BA93CC()
{
  unint64_t result;

  result = qword_254DF9908;
  if (!qword_254DF9908)
  {
    result = MEMORY[0x2199ED394](&protocol conformance descriptor for TTSSiriSynthAudioUnit.Error, &type metadata for TTSSiriSynthAudioUnit.Error);
    atomic_store(result, (unint64_t *)&qword_254DF9908);
  }
  return result;
}

char *sub_215BA9410(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return TTSSiriSynthAudioUnit.init(componentDescription:options:)(*(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(_DWORD *)(a3 + 16), a4);
}

uint64_t sub_215BA948C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = qword_253D75088;
  if (*(_QWORD *)(v0 + qword_253D75088))
  {
    v2 = *(_QWORD *)(v0 + qword_253D75088);
  }
  else
  {
    v3 = v0;
    sub_215BB3280();
    swift_allocObject();
    v2 = sub_215BB3274();
    *(_QWORD *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_215BA9504(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  sub_215BA9564();

  sub_215BB299C(0, &qword_253D74E28);
  v2 = (void *)sub_215BB349C();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_215BA9564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  _QWORD v28[4];
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v0 = sub_215BB3244();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((TTSVBHasDeviceBeenUnlockedSinceBoot() & 1) != 0)
  {
    sub_215BAE448();
    v5 = v4;
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      v36 = MEMORY[0x24BEE4AF8];
      sub_215BB364C();
      v7 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
      v28[1] = v5;
      v8 = v5 + v7;
      v30 = *(_QWORD *)(v1 + 72);
      v29 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      v28[3] = *MEMORY[0x24BEB62D8];
      v35 = xmmword_215BB42D0;
      v28[2] = MEMORY[0x24BEE4AD8] + 8;
      v32 = v1;
      v31 = v0;
      do
      {
        v34 = v6;
        v29(v3, v8, v0);
        swift_getKeyPath();
        sub_215BB3238();
        swift_release();
        v33 = v37;
        swift_getKeyPath();
        sub_215BB3238();
        swift_release();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AB8);
        *(_OWORD *)(swift_allocObject() + 16) = v35;
        swift_getKeyPath();
        sub_215BB3238();
        swift_release();
        *(_OWORD *)(swift_allocObject() + 16) = v35;
        swift_getKeyPath();
        sub_215BB3238();
        swift_release();
        v9 = objc_allocWithZone(MEMORY[0x24BDB18D8]);
        v10 = (void *)sub_215BB3388();
        swift_bridgeObjectRelease();
        v11 = (void *)sub_215BB3388();
        swift_bridgeObjectRelease();
        v12 = MEMORY[0x24BEE0D00];
        v13 = (void *)sub_215BB349C();
        swift_bridgeObjectRelease();
        v14 = (void *)sub_215BB349C();
        v15 = v34;
        swift_bridgeObjectRelease();
        v16 = v9;
        v0 = v31;
        v17 = objc_msgSend(v16, sel_initWithName_identifier_primaryLanguages_supportedLanguages_, v10, v11, v13, v14);

        v18 = v32;
        objc_msgSend(v17, sel_setIsPersonalVoice_, 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AC8);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v35;
        v38 = sub_215BB3394();
        v39 = v20;
        sub_215BB35EC();
        *(_QWORD *)(inited + 96) = v12;
        strcpy((char *)(inited + 72), "Personal Voice");
        *(_BYTE *)(inited + 87) = -18;
        sub_215BA9B78(inited);
        v21 = (void *)sub_215BB3370();
        swift_bridgeObjectRelease();
        objc_msgSend(v17, sel_setExtraAttributes_, v21);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v0);
        sub_215BB3634();
        sub_215BB3658();
        sub_215BB3664();
        sub_215BB3640();
        v8 += v30;
        v6 = v15 - 1;
      }
      while (v6);
    }
    goto LABEL_5;
  }
  v22 = objc_msgSend((id)objc_opt_self(), sel_allSynthesisProviderVoices);
  sub_215BB299C(0, &qword_253D74E28);
  v23 = sub_215BB34A8();

  v37 = MEMORY[0x24BEE4AF8];
  if (!(v23 >> 62))
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v24)
      goto LABEL_8;
LABEL_5:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v24 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (!v24)
    goto LABEL_5;
LABEL_8:
  if (v24 >= 1)
  {
    for (i = 0; i != v24; ++i)
    {
      if ((v23 & 0xC000000000000001) != 0)
        v26 = (id)MEMORY[0x2199ECC8C](i, v23);
      else
        v26 = *(id *)(v23 + 8 * i + 32);
      v27 = v26;
      if (objc_msgSend(v26, sel_isPersonalVoice))
      {
        sub_215BB3634();
        sub_215BB3658();
        sub_215BB3664();
        sub_215BB3640();
      }
      else
      {

      }
    }
    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_215BA9AC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_215BB32B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_215BA9AEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_215BB328C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_215BA9B14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_215BB3298();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_215BA9B3C()
{
  swift_bridgeObjectRetain();
  return sub_215BB32A4();
}

unint64_t sub_215BA9B78(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AD0);
  v2 = sub_215BB3688();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_215BB2BCC(v6, (uint64_t)v15, &qword_254DF9AD8);
    result = sub_215BB0B34((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_215BB2AF0(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_215BA9CB8()
{
  sub_215BB299C(0, (unint64_t *)&unk_253D74E30);
  return (id)sub_215BB3568();
}

id sub_215BA9CF4()
{
  sub_215BB299C(0, (unint64_t *)&unk_253D74E30);
  return (id)sub_215BB3568();
}

id sub_215BA9D30(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + qword_253D75010);
  if (result)
    return result;
  __break(1u);
  return result;
}

void sub_215BA9D48(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  void (*v68)(char *, char *, uint64_t);
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  id v73;
  unsigned int v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215BAEE0C(a1, a2);
  if (v9)
  {
    v10 = (_AXSSpeechSynthesisOptions() & 1) == 0;
    v11 = objc_allocWithZone((Class)TTSSiriSynthWrapper);
    v12 = v2;
    v13 = (void *)sub_215BB3388();
    swift_bridgeObjectRelease();
    v14 = (void *)sub_215BB3388();
    v15 = objc_msgSend(v11, sel_initWithVoicePath_language_censorPlainText_delegate_, v13, v14, v10, v12);

    v16 = qword_253D74F98;
    v17 = *(void **)&v12[qword_253D74F98];
    *(_QWORD *)&v12[qword_253D74F98] = v15;

    v18 = *(void **)&v12[v16];
    if (v18)
    {
      v78 = v18;
      v19 = objc_msgSend(v78, sel_neuralStyles);
      sub_215BB299C(0, &qword_254DF9918);
      v20 = sub_215BB34A8();

      if (v20 >> 62)
      {
        swift_bridgeObjectRetain();
        v21 = sub_215BB367C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v21)
      {
        v22 = objc_msgSend(v78, sel_neuralStyles);
        v23 = sub_215BB34A8();

        if (v23 >> 62)
        {
          swift_bridgeObjectRetain();
          v24 = sub_215BB367C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v24)
        {

          return;
        }
        v25 = &v12[qword_253D74F30];
        v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
        v26(v8, &v12[qword_253D74F30], v5);
        sub_215BB3148();
        v27 = *(void (**)(char *, uint64_t))(v6 + 8);
        v27(v8, v5);
        sub_215BB3184();
        swift_release();
        v26(v8, v25, v5);
        v28 = sub_215BB3148();
        v27(v8, v5);
        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v29 = (void *)sub_215BB316C();
        swift_release();
        v30 = objc_msgSend(v29, sel_identifier);

        v77 = (uint64_t)v30;
        if (!v30)
        {
          sub_215BB3394();
          v77 = sub_215BB3388();
          swift_bridgeObjectRelease();
        }
        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v31 = (void *)sub_215BB316C();
        swift_release();
        v32 = objc_msgSend(v31, sel_displayName);

        v76 = (uint64_t)v32;
        if (!v32)
        {
          sub_215BB3394();
          v76 = sub_215BB3388();
          swift_bridgeObjectRelease();
        }
        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v33 = (void *)sub_215BB316C();
        swift_release();
        v75 = objc_msgSend(v33, sel_address);

        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v34 = (void *)sub_215BB316C();
        swift_release();
        objc_msgSend(v34, sel_minValue);
        v36 = v35;

        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v37 = (void *)sub_215BB316C();
        swift_release();
        objc_msgSend(v37, sel_maxValue);
        v39 = v38;

        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v40 = (void *)sub_215BB316C();
        swift_release();
        v74 = objc_msgSend(v40, sel_unit);

        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v41 = (void *)sub_215BB316C();
        swift_release();
        v73 = objc_msgSend(v41, sel_unitName);

        v42 = objc_msgSend(v78, sel_neuralStyles);
        v43 = sub_215BB34A8();

        if (v43 >> 62)
        {
          swift_bridgeObjectRetain();
          v44 = sub_215BB367C();
          swift_bridgeObjectRelease();
          if (v44)
            goto LABEL_15;
        }
        else
        {
          v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v44)
          {
LABEL_15:
            v68 = v26;
            v69 = v25;
            v70 = v28;
            v71 = v8;
            v72 = v5;
            v79 = MEMORY[0x24BEE4AF8];
            sub_215BB09B0(0, v44 & ~(v44 >> 63), 0);
            if (v44 < 0)
            {
              __break(1u);
              return;
            }
            v45 = 0;
            v46 = v79;
            v47 = v27;
            do
            {
              if ((v43 & 0xC000000000000001) != 0)
                v48 = (id)MEMORY[0x2199ECC8C](v45, v43);
              else
                v48 = *(id *)(v43 + 8 * v45 + 32);
              v49 = v48;
              v50 = objc_msgSend(v48, sel_name);
              v51 = sub_215BB3394();
              v53 = v52;

              v79 = v46;
              v55 = *(_QWORD *)(v46 + 16);
              v54 = *(_QWORD *)(v46 + 24);
              if (v55 >= v54 >> 1)
              {
                sub_215BB09B0(v54 > 1, v55 + 1, 1);
                v46 = v79;
              }
              ++v45;
              *(_QWORD *)(v46 + 16) = v55 + 1;
              v56 = v46 + 16 * v55;
              *(_QWORD *)(v56 + 32) = v51;
              *(_QWORD *)(v56 + 40) = v53;
            }
            while (v44 != v45);
            v27 = v47;
            swift_bridgeObjectRelease();
            v8 = v71;
            v5 = v72;
            v25 = v69;
            v26 = v68;
            goto LABEL_31;
          }
        }
        swift_bridgeObjectRelease();
LABEL_31:
        v57 = objc_opt_self();
        v58 = (void *)sub_215BB349C();
        swift_bridgeObjectRelease();
        v26(v8, v25, v5);
        sub_215BB3148();
        v27(v8, v5);
        v59 = (void *)sub_215BB316C();
        swift_release();
        v60 = objc_msgSend(v59, sel_dependentParameters);

        v61 = (void *)v57;
        v63 = (void *)v76;
        v62 = (void *)v77;
        LODWORD(v64) = v36;
        LODWORD(v65) = v39;
        v66 = v73;
        v67 = objc_msgSend(v61, sel_createParameterWithIdentifier_name_address_min_max_unit_unitName_flags_valueStrings_dependentParameters_, v77, v76, v75, v74, v73, 0, v64, v65, v58, v60);

        sub_215BB3178();
        swift_release();

        return;
      }

    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v12[qword_253D74F30], v5);
    sub_215BB3148();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_215BB3184();
    swift_release();
  }
}

uint64_t sub_215BAA5B4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = sub_215BB3394();
  v4 = v3;
  v5 = a1;
  sub_215BA9D48(v2, v4);

  return swift_bridgeObjectRelease();
}

BOOL sub_215BAA608()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  void *v3;
  _BOOL8 value;

  v1 = qword_253D74F28;
  v2 = *((unsigned __int8 *)v0 + qword_253D74F28);
  if (v2 != 2)
    return v2 & 1;
  (*(void (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 288))();
  v3 = (void *)xpc_copy_entitlement_for_token();
  if (v3)
  {
    value = xpc_BOOL_get_value(v3);
    swift_unknownObjectRelease();
  }
  else
  {
    value = 0;
  }
  *((_BYTE *)v0 + v1) = value;
  return value;
}

void sub_215BAA6F8(id a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint8_t *v40;
  id v41;
  unsigned __int8 v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t (*v69)(void);
  id v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  int v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  int v81;
  uint8_t *v82;
  void *v83;
  _QWORD *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  _QWORD *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  char v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  _BOOL8 v127;
  id v128;
  _BYTE *v129;
  _QWORD *v130;
  void *v131;
  void *v132;
  id v133;
  uint64_t v134;
  void *v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char **v141;
  id v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t *v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  os_log_type_t v164;
  uint8_t *v165;
  uint64_t v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  id v174;
  _BYTE *v175;
  char *v176;
  _BYTE *v177;
  void *v178;
  id v179;
  uint64_t v180;
  void *v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  _BYTE *v187;
  uint64_t v188;
  void (*v189)(char *, _BYTE *, uint64_t);
  char *v190;
  uint64_t v191;
  id v192;
  void (*v193)(char *, uint64_t);
  id v194;
  uint64_t v195;
  id v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void (*v208)(uint64_t *, uint64_t, uint64_t);
  void (*v209)(uint64_t *, uint64_t);
  char *v210;
  char *v211;
  uint64_t v212;
  uint64_t *v213;
  id v214;
  uint64_t v215;
  _BYTE *v216;
  uint64_t v217;
  unint64_t v218;
  audit_token_t atoken;
  void *v220;
  void *v221;
  uint64_t v222[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB0);
  v202 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v198 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB8);
  MEMORY[0x24BDAC7A8](v7);
  v210 = (char *)&v198 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_215BB31F0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v211 = (char *)&v198 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_215BB3190();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v213 = (uint64_t *)((char *)&v198 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_253D74F20 != -1)
    swift_once();
  v15 = sub_215BB3220();
  v215 = __swift_project_value_buffer(v15, (uint64_t)qword_253D74F08);
  v16 = sub_215BB3208();
  v17 = sub_215BB34E4();
  v18 = os_log_type_enabled(v16, v17);
  v206 = v9;
  v205 = v10;
  v204 = v4;
  v203 = v6;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    *(_QWORD *)atoken.val = v20;
    *(_DWORD *)v19 = 136315138;
    v222[0] = sub_215BB02F8(0xD00000000000001BLL, 0x8000000215BB4F90, (uint64_t *)&atoken);
    sub_215BB3598();
    _os_log_impl(&dword_215BA2000, v16, v17, "Did get %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199ED418](v20, -1, -1);
    MEMORY[0x2199ED418](v19, -1, -1);
  }

  v207 = sub_215BB31B4();
  v21 = (void *)sub_215BB31A8();
  v22 = *MEMORY[0x24BEB5E68];
  v23 = v213;
  v208 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 104);
  v208(v213, v22, v12);
  v24 = objc_msgSend(a1, sel_jobIdentifier);
  sub_215BB3394();

  sub_215BB319C();
  swift_bridgeObjectRelease();
  v209 = *(void (**)(uint64_t *, uint64_t))(v13 + 8);
  v209(v23, v12);
  v216 = (_BYTE *)qword_253D74F50;
  *((_BYTE *)v2 + qword_253D74F50) = 1;
  v25 = objc_msgSend(a1, sel_voice);
  LODWORD(v24) = objc_msgSend(v25, sel_isPersonalVoice);

  if ((_DWORD)v24)
  {
    v26 = sub_215BA867C();
    v27 = sub_215BB32C8();

    if ((v27 & 1) == 0)
    {
      v28 = sub_215BB3208();
      v29 = sub_215BB34FC();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_215BA2000, v28, v29, "Personal voices cannot be used on devices without a passcode. No speech will be generated", v30, 2u);
        MEMORY[0x2199ED418](v30, -1, -1);
      }

      v216[(_QWORD)v2] = 0;
    }
    v31 = sub_215BA867C();
    v32 = sub_215BB32BC();

    if ((v32 & 1) != 0)
    {
      v33 = sub_215BB3208();
      v34 = sub_215BB34FC();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_215BA2000, v33, v34, "Personal voices cannot be used on devices that are locked. No speech will be generated", v35, 2u);
        MEMORY[0x2199ED418](v35, -1, -1);
      }

      v216[(_QWORD)v2] = 0;
    }
    v36 = v2;
    v37 = sub_215BB3208();
    v38 = sub_215BB34F0();
    v39 = os_log_type_enabled(v37, v38);
    v214 = a1;
    if (v39)
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v40 = 67109120;
      LOBYTE(atoken.val[0]) = sub_215BAA608();
      atoken.val[0] = LOBYTE(atoken.val[0]);
      sub_215BB3598();

      _os_log_impl(&dword_215BA2000, v37, v38, "Has PV entitlement %{BOOL}d", v40, 8u);
      MEMORY[0x2199ED418](v40, -1, -1);
    }
    else
    {

      v37 = v36;
    }

    v41 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v42 = objc_msgSend(v41, sel_allowAppUsage);

    if ((v42 & 1) == 0 && !sub_215BAA608())
    {
      v43 = sub_215BB3208();
      v44 = sub_215BB34FC();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_215BA2000, v43, v44, "This personal voice does not allow app usage. No speech will be generated", v45, 2u);
        MEMORY[0x2199ED418](v45, -1, -1);
      }

      v216[(_QWORD)v2] = 0;
    }
    if (!sub_215BAA608())
    {
      v46 = _TTSSystemFocusedPid();
      *(_QWORD *)atoken.val = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                                   + (*MEMORY[0x24BEE4EA0] & (uint64_t)v36->isa)
                                                   + 288))();
      atoken.val[2] = v47;
      atoken.val[3] = v48;
      atoken.val[4] = v49;
      atoken.val[5] = v50;
      atoken.val[6] = v51;
      atoken.val[7] = v52;
      if (v46 != audit_token_to_pid(&atoken))
      {
        v53 = sub_215BB3208();
        v54 = sub_215BB34FC();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v55 = 0;
          _os_log_impl(&dword_215BA2000, v53, v54, "Personal voices can only be used while app is foreground", v55, 2u);
          MEMORY[0x2199ED418](v55, -1, -1);
        }

        v216[(_QWORD)v2] = 0;
      }
    }
    v212 = v12;
    v56 = v36;
    v57 = sub_215BB3208();
    v58 = sub_215BB34E4();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      *(_DWORD *)v59 = 136315138;
      v222[0] = v60;
      *(_QWORD *)atoken.val = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                                   + (*MEMORY[0x24BEE4EA0] & (uint64_t)v56->isa)
                                                   + 288))();
      atoken.val[2] = v61;
      atoken.val[3] = v62;
      atoken.val[4] = v63;
      atoken.val[5] = v64;
      atoken.val[6] = v65;
      atoken.val[7] = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9930);
      v67 = sub_215BB33C4();
      *(_QWORD *)atoken.val = sub_215BB02F8(v67, v68, v222);
      sub_215BB3598();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215BA2000, v57, v58, "Speech request is for personal voice. Will check if host is TCC-approved. token=%s", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199ED418](v60, -1, -1);
      MEMORY[0x2199ED418](v59, -1, -1);

    }
    else
    {

    }
    v12 = v212;
    a1 = v214;
    if (!*MEMORY[0x24BEB3988])
      goto LABEL_91;
    v69 = *(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                              + (*MEMORY[0x24BEE4EA0] & (uint64_t)v56->isa)
                              + 288);
    v70 = (id)*MEMORY[0x24BEB3988];
    *(_QWORD *)atoken.val = v69();
    atoken.val[2] = v71;
    atoken.val[3] = v72;
    atoken.val[4] = v73;
    atoken.val[5] = v74;
    atoken.val[6] = v75;
    atoken.val[7] = v76;
    v77 = TCCAccessCheckAuditToken();

    v78 = sub_215BB3208();
    if (v77)
    {
      v79 = sub_215BB34E4();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_215BA2000, v78, v79, "Host is TCC-approved for personal voice speech", v80, 2u);
        MEMORY[0x2199ED418](v80, -1, -1);
      }

    }
    else
    {
      v81 = sub_215BB34FC();
      if (os_log_type_enabled(v78, (os_log_type_t)v81))
      {
        v82 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v82 = 0;
        _os_log_impl(&dword_215BA2000, v78, (os_log_type_t)v81, "Caller does not have kTCCServiceVoiceBanking access to personal voices. No speech will be generated", v82, 2u);
        MEMORY[0x2199ED418](v82, -1, -1);
      }

      v216[(_QWORD)v2] = 0;
    }
  }
  v83 = *(void **)((char *)v2 + qword_253D75000);
  *(_QWORD *)((char *)v2 + qword_253D75000) = a1;
  v214 = a1;

  *(_QWORD *)((char *)v2 + qword_253D74F90) = 0;
  v84 = (char *)v2 + qword_253D74FE0;
  swift_beginAccess();
  *v84 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v85 = *(NSObject **)((char *)v2 + qword_253D74F80);
  v86 = swift_allocObject();
  *(_QWORD *)(v86 + 16) = v2;
  v87 = swift_allocObject();
  *(_QWORD *)(v87 + 16) = sub_215BB0C60;
  *(_QWORD *)(v87 + 24) = v86;
  v220 = sub_215BB0C74;
  v221 = (void *)v87;
  *(_QWORD *)atoken.val = MEMORY[0x24BDAC760];
  *(_QWORD *)&atoken.val[2] = 1107296256;
  *(_QWORD *)&atoken.val[4] = sub_215BAC11C;
  *(_QWORD *)&atoken.val[6] = &block_descriptor;
  v88 = _Block_copy(&atoken);
  v89 = v221;
  v90 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v85, v88);
  _Block_release(v88);
  LOBYTE(v85) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v85 & 1) != 0)
  {
    __break(1u);
    goto LABEL_87;
  }
  *(_QWORD *)((char *)v90 + qword_253D75070) = 0;
  v91 = *(void **)((char *)v90 + qword_253D74FC8);
  *(_QWORD *)((char *)v90 + qword_253D74FC8) = 0;

  if ((v216[(_QWORD)v2] & 1) == 0)
  {
    v99 = sub_215BB3208();
    v100 = sub_215BB34FC();
    if (os_log_type_enabled(v99, v100))
    {
      v101 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v101 = 0;
      _os_log_impl(&dword_215BA2000, v99, v100, "Voice not allowed to render speech! Will not set up synthesizer. Bailing now", v101, 2u);
      MEMORY[0x2199ED418](v101, -1, -1);
    }
    goto LABEL_70;
  }
  v201 = qword_253D74F98;
  v92 = *(_QWORD *)((char *)v90 + qword_253D74F98);
  v216 = v90;
  v89 = v214;
  if (!v92)
  {
LABEL_51:
    v102 = objc_msgSend(v89, sel_voice);
    v103 = *(void **)((char *)v90 + qword_253D75098);
    *(_QWORD *)((char *)v90 + qword_253D75098) = v102;

    v104 = objc_msgSend(v89, sel_voice);
    v105 = objc_msgSend(v104, sel_identifier);

    v106 = sub_215BB3394();
    v108 = v107;

    sub_215BAEE0C(v106, v108);
    v110 = v109;
    v112 = v111;
    swift_bridgeObjectRelease();
    if (v112)
    {
      v113 = objc_msgSend(v89, sel_voice);
      v114 = objc_msgSend(v113, sel_primaryLanguages);

      v115 = sub_215BB34A8();
      v116 = *(_QWORD *)(v115 + 16);
      v212 = v12;
      if (v116)
        swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v127 = (_AXSSpeechSynthesisOptions() & 1) == 0;
      v128 = objc_allocWithZone((Class)TTSSiriSynthWrapper);
      v129 = v216;
      v130 = v216;
      swift_bridgeObjectRetain();
      v131 = (void *)sub_215BB3388();
      swift_bridgeObjectRelease();
      v132 = (void *)sub_215BB3388();
      swift_bridgeObjectRelease();
      v133 = objc_msgSend(v128, sel_initWithVoicePath_language_censorPlainText_delegate_, v131, v132, v127, v130);

      v134 = v201;
      v135 = *(void **)&v129[v201];
      *(_QWORD *)&v129[v201] = v133;

      if (*(_QWORD *)&v129[v134])
      {
        swift_bridgeObjectRelease();
        v89 = v214;
        v136 = objc_msgSend(v214, sel_voice);
        v137 = objc_msgSend(v136, sel_identifier);

        v138 = sub_215BB3394();
        v140 = v139;

        (*(void (**)(uint64_t, uint64_t))(class metadata base offset for TTSSiriSynthAudioUnit
                                                 + (*MEMORY[0x24BEE4EA0] & *v130)
                                                 + 928))(v138, v140);
        swift_bridgeObjectRelease();
        v12 = v212;
        v90 = v216;
        goto LABEL_58;
      }
      swift_bridgeObjectRetain();
      v99 = sub_215BB3208();
      v164 = sub_215BB34FC();
      if (!os_log_type_enabled(v99, v164))
      {
        swift_release();

        swift_bridgeObjectRelease_n();
        return;
      }
      v165 = (uint8_t *)swift_slowAlloc();
      v166 = swift_slowAlloc();
      *(_QWORD *)atoken.val = v166;
      *(_DWORD *)v165 = 136315138;
      swift_bridgeObjectRetain();
      v217 = sub_215BB02F8(v110, v112, (uint64_t *)&atoken);
      sub_215BB3598();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_215BA2000, v99, v164, "SiriTTSSynthesizer failed to initialize with voice path %s", v165, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199ED418](v166, -1, -1);
      MEMORY[0x2199ED418](v165, -1, -1);
    }
    else
    {
      v117 = v89;
      v99 = sub_215BB3208();
      v118 = sub_215BB34FC();
      if (!os_log_type_enabled(v99, v118))
      {
        swift_release();

        return;
      }
      v119 = (uint8_t *)swift_slowAlloc();
      v120 = swift_slowAlloc();
      v215 = v86;
      v121 = v120;
      *(_QWORD *)atoken.val = v120;
      *(_DWORD *)v119 = 136315138;
      v122 = objc_msgSend(v117, (SEL)0x24D44EC40);
      v123 = objc_msgSend(v122, sel_identifier);

      v124 = sub_215BB3394();
      v126 = v125;

      v217 = sub_215BB02F8(v124, v126, (uint64_t *)&atoken);
      sub_215BB3598();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215BA2000, v99, v118, "Voice %s not found or unavailable for use", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199ED418](v121, -1, -1);
      MEMORY[0x2199ED418](v119, -1, -1);
    }
LABEL_70:
    swift_release();

    return;
  }
  v93 = *(void **)((char *)v90 + qword_253D75098);
  v94 = v93;
  v95 = objc_msgSend(v89, sel_voice);
  v96 = v95;
  if (v93)
  {
    if (v95)
    {
      sub_215BB299C(0, &qword_253D74E28);
      v97 = v94;
      v98 = sub_215BB3574();

      v90 = v216;
      if ((v98 & 1) != 0)
        goto LABEL_58;
      goto LABEL_51;
    }
    v96 = v94;
    v90 = v216;
    goto LABEL_50;
  }
  v90 = v216;
  if (v95)
  {
LABEL_50:

    goto LABEL_51;
  }
LABEL_58:
  v141 = &selRef_setPrimeMethod_;
  v142 = objc_msgSend(v89, sel_ssmlRepresentation);
  sub_215BB3394();

  sub_215BB31E4();
  v143 = sub_215BB31D8();
  v144 = (_QWORD *)((char *)v90 + qword_253D75030);
  v199 = v143;
  *v144 = v143;
  v144[1] = v145;
  v200 = v145;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v146 = objc_msgSend(v89, sel_ssmlRepresentation);
  v147 = sub_215BB3394();
  v149 = v148;

  v90 = (_QWORD *)((char *)v90 + qword_253D75058);
  *v90 = v147;
  v90[1] = v149;
  swift_bridgeObjectRelease();
  v150 = v90[1];
  if (v150)
  {
    v215 = v86;
    v212 = v12;
    *(_QWORD *)atoken.val = *v90;
    *(_QWORD *)&atoken.val[2] = v150;
    v151 = qword_254DF9BB0;
    swift_bridgeObjectRetain();
    if (v151 == -1)
    {
LABEL_60:
      v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DF98F0);
      __swift_project_value_buffer(v152, (uint64_t)qword_254DF9DD8);
      sub_215BB0CAC();
      sub_215BB0CF0(&qword_254DF9928, &qword_254DF98F0, MEMORY[0x24BEE7460]);
      v153 = sub_215BB337C();
      swift_bridgeObjectRelease();
      v198 = v153;
      v154 = *(_QWORD *)(v153 + 16);
      v141 = &selRef_setPrimeMethod_;
      if (v154)
      {
        v155 = (unint64_t *)(v198 + 40);
        do
        {
          if (v90[1])
          {
            v162 = *(v155 - 1);
            v161 = *v155;
            sub_215BB3478();
            v158 = *v90;
            v163 = v90[1];
            if (v163)
            {
              *(_QWORD *)atoken.val = 0;
              *(_QWORD *)&atoken.val[2] = 0xE000000000000000;
              v217 = 32;
              v218 = 0xE100000000000000;
              sub_215BB0D30();
              swift_bridgeObjectRetain();
              v156 = sub_215BB35BC();
              v158 = sub_215BAC13C(v162, v161, v156, v157, v158, v163);
              v160 = v159;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              v160 = 0;
            }
            *v90 = v158;
            v90[1] = v160;
            swift_bridgeObjectRelease();
            v89 = v214;
            v141 = &selRef_setPrimeMethod_;
          }
          v155 += 2;
          --v154;
        }
        while (v154);
      }
      swift_bridgeObjectRelease();
      v12 = v212;
      goto LABEL_73;
    }
LABEL_87:
    swift_once();
    goto LABEL_60;
  }
LABEL_73:
  v167 = (void *)sub_215BB31A8();
  v168 = objc_msgSend(v89, v141[63]);
  v169 = sub_215BB3394();
  v171 = v170;

  v172 = v213;
  *v213 = v169;
  v172[1] = v171;
  v173 = v200;
  v172[2] = v199;
  v172[3] = v173;
  v208(v172, *MEMORY[0x24BEB5E78], v12);
  swift_bridgeObjectRetain();
  v174 = objc_msgSend(v89, sel_jobIdentifier);
  sub_215BB3394();

  sub_215BB319C();
  swift_bridgeObjectRelease();
  v209(v172, v12);
  v175 = v216;
  v176 = &v216[qword_253D75048];
  *(_QWORD *)v176 = 0;
  v176[8] = 1;
  v177 = &v175[qword_253D74FD0];
  *(_QWORD *)v177 = 0;
  *((_QWORD *)v177 + 1) = 0;
  v177[16] = 1;
  v178 = *(void **)&v175[v201];
  if (v178)
  {
    v179 = objc_msgSend(v178, sel_ruleSetRunner);
    v180 = swift_allocObject();
    *(_QWORD *)(v180 + 16) = v89;
    v220 = sub_215BB0D74;
    v221 = (void *)v180;
    *(_QWORD *)atoken.val = MEMORY[0x24BDAC760];
    *(_QWORD *)&atoken.val[2] = 1107296256;
    *(_QWORD *)&atoken.val[4] = sub_215BAC5F0;
    *(_QWORD *)&atoken.val[6] = &block_descriptor_9;
    v181 = _Block_copy(&atoken);
    v182 = v89;
    swift_release();
    objc_msgSend(v179, sel_setMatchLogger_, v181);
    _Block_release(v181);

  }
  v183 = (uint64_t)v210;
  sub_215BB3118();
  v184 = sub_215BB3124();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v184 - 8) + 56))(v183, 0, 1, v184);
  v185 = (uint64_t)&v175[qword_253D74FB8];
  swift_beginAccess();
  sub_215BB0D7C(v183, v185);
  swift_endAccess();
  v186 = *(void **)&v175[v201];
  if (!v186)
  {
    (*(void (**)(char *, uint64_t))(v205 + 8))(v211, v206);
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  v187 = &v175[qword_253D74F30];
  v188 = v202;
  v189 = *(void (**)(char *, _BYTE *, uint64_t))(v202 + 16);
  v190 = v203;
  v191 = v204;
  v189(v203, &v175[qword_253D74F30], v204);
  v192 = v186;
  sub_215BB313C();
  v193 = *(void (**)(char *, uint64_t))(v188 + 8);
  v193(v190, v191);
  if (*(uint64_t *)atoken.val <= 0)
  {
    v196 = 0;
    goto LABEL_85;
  }
  v194 = objc_msgSend(v192, sel_neuralStyles);
  sub_215BB299C(0, &qword_254DF9918);
  v195 = sub_215BB34A8();

  v189(v190, v187, v191);
  sub_215BB313C();
  v193(v190, v191);
  if ((v195 & 0xC000000000000001) != 0)
  {
    v196 = (id)MEMORY[0x2199ECC8C](*(_QWORD *)atoken.val, v195);
    goto LABEL_81;
  }
  if ((*(_QWORD *)atoken.val & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)atoken.val < *(_QWORD *)((v195 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v196 = *(id *)(v195 + 8 * *(_QWORD *)atoken.val + 32);
LABEL_81:
    swift_bridgeObjectRelease();
LABEL_85:
    objc_msgSend(v192, sel_setCurrentNeuralStyle_, v196, v198);

    v197 = (void *)sub_215BB3388();
    swift_bridgeObjectRelease();
    objc_msgSend(v192, sel_synthesizeString_, v197);

    (*(void (**)(char *, uint64_t))(v205 + 8))(v211, v206);
    v216[qword_253D75020] = 1;
    swift_release();
    return;
  }
  __break(1u);
LABEL_91:
  __break(1u);
}

uint64_t sub_215BAC11C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_215BAC13C(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  swift_bridgeObjectRetain();
  sub_215BB358C();
  v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 0x1000000000000000) != 0)
    goto LABEL_25;
  swift_bridgeObjectRetain();
  sub_215BB358C();
  v15 = v14;
  result = swift_bridgeObjectRelease();
  if ((v15 & 0x1000000000000000) != 0)
    goto LABEL_25;
  v17 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0)
    LOBYTE(v17) = 1;
  v18 = 4 << v17;
  v19 = a1;
  if ((a1 & 0xC) == 4 << v17)
  {
    result = sub_215BB07EC(a1, a5, a6);
    v19 = result;
  }
  v40 = a3;
  v20 = a2;
  v21 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    v23 = a6 & 0x2000000000000000;
    v25 = a5 & 0xFFFFFFFFFFFFLL;
    v24 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0)
      v32 = HIBYTE(a6) & 0xF;
    else
      v32 = a5 & 0xFFFFFFFFFFFFLL;
    if (v32 < v19 >> 16)
      goto LABEL_43;
    result = sub_215BB3448();
    v22 = result;
    if (v21)
      v26 = 7;
    else
      v26 = 11;
  }
  else
  {
    v22 = v19 >> 16;
    v23 = a6 & 0x2000000000000000;
    v24 = HIBYTE(a6) & 0xF;
    v25 = a5 & 0xFFFFFFFFFFFFLL;
    v26 = 7;
  }
  if (!v23)
    v24 = v25;
  v27 = 4 << (v21 >> 59);
  v28 = v26 | (v24 << 16);
  a2 = v20;
  if ((a6 & 0x1000000000000000) == 0)
    v27 = 8;
  v29 = v20;
  if ((v20 & 0xC) == v27)
  {
    v33 = v20;
    v34 = v22;
    result = sub_215BB07EC(v33, a5, a6);
    v22 = v34;
    v29 = result;
  }
  if ((v26 & 0xC) == v18)
  {
    v35 = v26 | (v24 << 16);
    v36 = v22;
    result = sub_215BB07EC(v35, a5, a6);
    v22 = v36;
    v28 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      v30 = (v28 >> 16) - (v29 >> 16);
      if ((a4 & 0x1000000000000000) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v24 < v29 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v24 >= v28 >> 16)
  {
    v37 = v22;
    v38 = sub_215BB3448();
    v22 = v37;
    v30 = v38;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x2000000000000000) != 0)
      {
        result = HIBYTE(a4) & 0xF;
        v31 = v22 + result;
        if (!__OFADD__(v22, result))
          goto LABEL_23;
      }
      else
      {
        result = v40 & 0xFFFFFFFFFFFFLL;
        v31 = v22 + (v40 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v22, v40 & 0xFFFFFFFFFFFFLL))
          goto LABEL_23;
      }
      goto LABEL_39;
    }
LABEL_37:
    v39 = v22;
    result = sub_215BB3430();
    v31 = v39 + result;
    if (!__OFADD__(v39, result))
    {
LABEL_23:
      result = v31 + v30;
      if (!__OFADD__(v31, v30))
      {
        MEMORY[0x2199ECA58](result);
LABEL_25:
        sub_215BB3484();
        sub_215BB29D4();
        sub_215BB340C();
        swift_bridgeObjectRelease();
        sub_215BB340C();
        sub_215BB01A0(a2, a5, a6);
        sub_215BB340C();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_215BAC480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v26 = a4;
  v27 = a8;
  v24 = a5;
  v25 = a3;
  v12 = sub_215BB3190();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t *)((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_215BB31B4();
  v16 = (void *)sub_215BB31A8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = objc_msgSend(a7, sel_identifier);
  v18 = sub_215BB3394();
  v20 = v19;

  *v15 = a1;
  v15[1] = a2;
  v15[2] = v24;
  v15[3] = a6;
  v21 = v26;
  v15[4] = v25;
  v15[5] = v21;
  v15[6] = v18;
  v15[7] = v20;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEB5E58], v12);
  v22 = objc_msgSend(v27, sel_jobIdentifier);
  sub_215BB3394();

  sub_215BB319C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_215BAC5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  v10 = sub_215BB3394();
  v12 = v11;
  v13 = sub_215BB3394();
  v15 = v14;
  swift_retain();
  v16 = a6;
  v9(v10, v12, a3, a4, v13, v15, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void sub_215BAC6B4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_215BAA6F8(v4);

}

id sub_215BAC708()
{
  uint64_t v0;
  void *v1;
  _QWORD v3[6];

  v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_215BB24B0;
  v3[5] = v0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 1107296256;
  v3[2] = sub_215BAC7A0;
  v3[3] = &block_descriptor_35;
  v1 = _Block_copy(v3);
  swift_release();
  return v1;
}

uint64_t sub_215BAC7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *aBlock)
{
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(a1 + 32);
  v15 = _Block_copy(aBlock);
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v15 = sub_215BB24E4;
  }
  else
  {
    v16 = 0;
  }
  swift_retain();
  v17 = v14(a2, a3, a4, a5, a6, a7, v15, v16);
  sub_215BB2C80((uint64_t)v15);
  swift_release();
  return v17;
}

uint64_t sub_215BAC878(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char **v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t *, _QWORD);
  uint64_t v17;
  void (*v18)(uint64_t *, _QWORD);
  _DWORD *v19;
  void *v20;
  void (*v21)(uint64_t *, _QWORD);
  void *v22;
  void (*v23)(uint64_t *, _QWORD);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  id v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint8_t *v55;
  char **v56;
  int v57;
  void (*v58)(uint64_t *, _QWORD);
  uint64_t v59;
  NSObject *v60;
  _QWORD *v61;
  unint64_t v62;
  void *v63;
  char *v64;
  uint64_t v65;
  uint64_t *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  id v97;
  void *v98;
  NSString *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  BOOL v105;
  char **v106;
  uint8_t *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  id v123;
  void (**v124)(_QWORD, _QWORD, _QWORD);
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  void (*v136)(char *, uint64_t);
  char **v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t aBlock;
  unint64_t v145;
  uint64_t (*v146)(uint64_t);
  void *v147;
  uint64_t (*v148)();
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unsigned int v152;
  NSRange v153;

  v7 = sub_215BB3340();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char **)((char *)&v128 - v12);
  swift_beginAccess();
  v14 = MEMORY[0x2199ED454](a4 + 16);
  if (!v14)
    return 0xFFFFFFFFLL;
  v15 = (char *)v14;
  sub_215BB334C();
  v16 = (void (*)(uint64_t *, _QWORD))sub_215BB3358();
  *(_DWORD *)(v17 + 4) = 0;
  v16(&aBlock, 0);
  v18 = (void (*)(uint64_t *, _QWORD))sub_215BB3358();
  *v19 = 1;
  v18(&aBlock, 0);
  v21 = (void (*)(uint64_t *, _QWORD))sub_215BB3364();
  if (!v20)
  {
    v21(&aBlock, 0);
    if (qword_253D74F20 != -1)
LABEL_82:
      swift_once();
    v38 = sub_215BB3220();
    __swift_project_value_buffer(v38, (uint64_t)qword_253D74F08);
    v39 = sub_215BB3208();
    v40 = sub_215BB34FC();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = v7;
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_215BA2000, v39, v40, "could not get audio buffer to zero", v42, 2u);
      v43 = v42;
      v7 = v41;
      MEMORY[0x2199ED418](v43, -1, -1);
    }

LABEL_26:
    (*(void (**)(char **, uint64_t))(v8 + 8))(v13, v7);
    return 0xFFFFFFFFLL;
  }
  v22 = v20;
  v21(&aBlock, 0);
  bzero(v22, 4 * a2);
  if ((v15[qword_253D74F50] & 1) == 0)
  {
    if (qword_253D74F20 != -1)
LABEL_84:
      swift_once();
    v44 = sub_215BB3220();
    __swift_project_value_buffer(v44, (uint64_t)qword_253D74F08);
    v45 = sub_215BB3208();
    v46 = sub_215BB3508();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_215BA2000, v45, v46, "In render block but not allowed to render. Returning immediately with action complete", v47, 2u);
      MEMORY[0x2199ED418](v47, -1, -1);
    }

    *a1 = 128;
    goto LABEL_26;
  }
  sub_215BB334C();
  v23 = (void (*)(uint64_t *, _QWORD))sub_215BB3364();
  v25 = v24;
  v23(&aBlock, 0);
  v136 = *(void (**)(char *, uint64_t))(v8 + 8);
  v136(v11, v7);
  if (!v25)
  {
    if (qword_253D74F20 != -1)
      swift_once();
    v50 = sub_215BB3220();
    __swift_project_value_buffer(v50, (uint64_t)qword_253D74F08);
    v51 = sub_215BB3208();
    v52 = sub_215BB34FC();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = v7;
      v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_215BA2000, v51, v52, "could not get audio buffer to fill", v54, 2u);
      v55 = v54;
      v7 = v53;
      MEMORY[0x2199ED418](v55, -1, -1);
    }

    v56 = v13;
LABEL_79:
    v136((char *)v56, v7);
    return 0xFFFFFFFFLL;
  }
  v133 = v7;
  v152 = 0;
  v137 = v13;
  if (a2)
  {
    v7 = qword_253D74FC8;
    v8 = qword_253D75070;
    v13 = &selRef_setPrimeMethod_;
    do
    {
      v28 = *(void **)&v15[v7];
      if (v28)
      {
        v29 = v28;
        v30 = *((_QWORD *)objc_msgSend(v29, sel_mutableAudioBufferList) + 2);
        if (!v30)
        {
          if (qword_253D74F20 != -1)
            swift_once();
          v102 = sub_215BB3220();
          __swift_project_value_buffer(v102, (uint64_t)qword_253D74F08);
          v103 = sub_215BB3208();
          v104 = sub_215BB34FC();
          v105 = os_log_type_enabled(v103, v104);
          v7 = v133;
          v106 = v137;
          if (v105)
          {
            v107 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v107 = 0;
            _os_log_impl(&dword_215BA2000, v103, v104, "Failed to get source buffer to fill from", v107, 2u);
            MEMORY[0x2199ED418](v107, -1, -1);
          }

          v56 = v106;
          goto LABEL_79;
        }
        v31 = *(_QWORD *)&v15[v8];
        if (v31 >= objc_msgSend(v29, sel_frameLength))
        {
          *(_QWORD *)&v15[v8] = 0;
          v26 = *(void **)&v15[v7];
          *(_QWORD *)&v15[v7] = 0;

          LODWORD(v27) = v152;
        }
        else
        {
          *(_DWORD *)(v25 + 4 * v152) = *(_DWORD *)(v30 + 4 * *(_QWORD *)&v15[v8]);

          LODWORD(v27) = v152 + 1;
          if (v152 == -1)
          {
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }
          ++v152;
          v32 = *(_QWORD *)&v15[v8];
          v33 = __OFADD__(v32, 1);
          v34 = v32 + 1;
          if (v33)
            goto LABEL_81;
          *(_QWORD *)&v15[v8] = v34;
        }
      }
      else
      {
        v35 = sub_215BAE044();
        v36 = *(void **)&v15[v7];
        *(_QWORD *)&v15[v7] = v35;

        *(_QWORD *)&v15[v8] = 0;
        v27 = v152;
        if (!*(_QWORD *)&v15[v7])
        {
          *a1 = 128;
          *(_DWORD *)(v25 + 4 * v27) = 0;
          v37 = __CFADD__((_DWORD)v27, 1);
          LODWORD(v27) = v27 + 1;
          if (v37)
          {
            __break(1u);
            goto LABEL_84;
          }
          v152 = v27;
        }
      }
    }
    while (v27 < a2);
    v150 = 0;
    v151 = MEMORY[0x24BEE4AF8];
    v13 = v137;
    if (v27 >> 30)
      goto LABEL_104;
    v57 = 4 * v27;
  }
  else
  {
    v57 = 0;
    v150 = 0;
    v151 = MEMORY[0x24BEE4AF8];
  }
  v58 = (void (*)(uint64_t *, _QWORD))sub_215BB3358();
  *(_DWORD *)(v59 + 4) = v57;
  v58(&aBlock, 0);
  v60 = *(NSObject **)&v15[qword_253D74F80];
  v61 = (_QWORD *)swift_allocObject();
  v61[2] = v15;
  v61[3] = &v152;
  v61[4] = &v151;
  v61[5] = &v150;
  v62 = swift_allocObject();
  *(_QWORD *)(v62 + 16) = sub_215BB2788;
  *(_QWORD *)(v62 + 24) = v61;
  v130 = v61;
  v148 = sub_215BB2EA4;
  v149 = v62;
  aBlock = MEMORY[0x24BDAC760];
  v145 = 1107296256;
  v146 = sub_215BAC11C;
  v147 = &block_descriptor_61;
  v63 = _Block_copy(&aBlock);
  v64 = v15;
  swift_retain();
  swift_release();
  dispatch_sync(v60, v63);
  _Block_release(v63);
  LOBYTE(v60) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v60 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v62 = MEMORY[0x24BEE4AF8];
    v143 = MEMORY[0x24BEE4AF8];
    v65 = *(_QWORD *)(v151 + 16);
    v134 = v64;
    if (v65)
    {
      v66 = (uint64_t *)&v64[qword_253D75058];
      v67 = &v64[qword_253D75030];
      v131 = &v64[qword_253D75048];
      v135 = &v64[qword_253D74FD0];
      v129 = qword_253D74F90;
      v128 = swift_bridgeObjectRetain();
      v68 = v128 + 36;
      v132 = v67;
      while (1)
      {
        if ((*(_BYTE *)(v68 - 4) & 1) == 0)
        {
          v69 = v66[1];
          if (v69)
          {
            if (*((_QWORD *)v67 + 1))
            {
              v70 = *v66;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_215BB34D8();
              if ((v71 & 1) != 0)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v13 = v137;
              }
              else
              {
                v72 = sub_215BB3484();
                v74 = v73;
                v76 = v75;
                v78 = v77;
                swift_bridgeObjectRelease();
                MEMORY[0x2199ECA4C](v72, v74, v76, v78);
                swift_bridgeObjectRelease();
                v79 = (void *)sub_215BB3388();
                swift_bridgeObjectRelease();
                v80 = objc_msgSend(v79, sel_xmlEscaped, v128);

                v81 = sub_215BB3394();
                v62 = v82;

                v83 = v131;
                sub_215BADA84(v81, v62, *(_QWORD *)v131, v131[8], v70, v69);
                if ((v84 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v13 = v137;
                  v67 = v132;
                }
                else
                {
                  sub_215BB33F4();
                  *(_QWORD *)v83 = sub_215BB3400();
                  v83[8] = 0;
                  aBlock = v70;
                  v145 = v69;
                  sub_215BB0D30();
                  v85 = sub_215BB33E8();
                  swift_bridgeObjectRelease();
                  if ((v62 & 0x1000000000000000) != 0)
                    v86 = sub_215BB3454();
                  else
                    v86 = sub_215BB3460();
                  v87 = v86;
                  v13 = v137;
                  v67 = v132;
                  swift_bridgeObjectRelease();
                  if ((v135[16] & 1) != 0 || *(_QWORD *)v135 != v85 || *((_QWORD *)v135 + 1) != v87)
                  {
                    v89 = v135;
                    *(_QWORD *)v135 = v85;
                    *((_QWORD *)v89 + 1) = v87;
                    v89[16] = 0;
                    v90 = *(_QWORD *)&v134[v129];
                    if ((unint64_t)(v90 - 0x2000000000000000) >> 62 != 3)
                    {
                      __break(1u);
                      goto LABEL_89;
                    }
                    v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB18D0]), sel_initWithMarkerType_forTextRange_atByteSampleOffset_, 1, v85, v87, 4 * v90);
                    MEMORY[0x2199ECB0C]();
                    if (*(_QWORD *)((v143 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v143 & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
                      sub_215BB34C0();
                    sub_215BB34CC();
                    sub_215BB34B4();

                  }
                }
              }
            }
          }
        }
        v68 += 16;
        if (!--v65)
        {
          swift_bridgeObjectRelease();
          v62 = v143;
          v64 = v134;
          break;
        }
      }
    }
    v61 = (_QWORD *)(v62 >> 62);
    if (!(v62 >> 62))
    {
      if (!*(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_87;
      goto LABEL_62;
    }
  }
  swift_bridgeObjectRetain();
  v108 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (!v108)
    goto LABEL_87;
LABEL_62:
  v88 = *(char **)&v64[qword_253D75000];
  if (!v88)
    goto LABEL_87;
  aBlock = 10;
  v145 = 0xE100000000000000;
  v135 = v88;
  if (!v61)
  {
    v92 = *(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10);
    v93 = v88;
    swift_bridgeObjectRetain();
    if (v92)
      goto LABEL_65;
LABEL_90:
    swift_bridgeObjectRelease();
    if (qword_253D74F20 != -1)
      goto LABEL_101;
    while (1)
    {
      v110 = sub_215BB3220();
      __swift_project_value_buffer(v110, (uint64_t)qword_253D74F08);
      v111 = aBlock;
      v112 = v145;
      v64 = v134;
      v113 = v134;
      swift_bridgeObjectRetain();
      v114 = sub_215BB3208();
      v115 = sub_215BB34F0();
      if (os_log_type_enabled(v114, v115))
      {
        v116 = swift_slowAlloc();
        v117 = swift_slowAlloc();
        v142 = v117;
        *(_DWORD *)v116 = 134218754;
        v118 = qword_253D74F90;
        v119 = *(_QWORD *)&v113[qword_253D74F90];

        v140 = v119;
        sub_215BB3598();

        *(_WORD *)(v116 + 12) = 2048;
        v120 = *(_QWORD *)&v113[v118];
        swift_beginAccess();
        v121 = v152;

        if (__OFADD__(v120, v121))
          goto LABEL_103;
        v139 = v120 + v121;
        sub_215BB3598();

        *(_WORD *)(v116 + 22) = 2048;
        swift_beginAccess();
        v138 = v150;
        sub_215BB3598();
        *(_WORD *)(v116 + 32) = 2080;
        swift_bridgeObjectRetain();
        v138 = sub_215BB02F8(v111, v112, &v142);
        sub_215BB3598();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_215BA2000, v114, v115, "Markers for [%ld..<%ld] (%ld remaining): \n%s", (uint8_t *)v116, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x2199ED418](v117, -1, -1);
        MEMORY[0x2199ED418](v116, -1, -1);

        v13 = v137;
        v64 = v134;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v13 = v137;
      }
      v122 = v135;
      v123 = objc_msgSend(v113, sel_speechSynthesisOutputMetadataBlock, v128);
      if (v123)
      {
        v124 = (void (**)(_QWORD, _QWORD, _QWORD))v123;
        _Block_copy(v123);
        sub_215BB299C(0, &qword_254DF9AA0);
        v125 = (void *)sub_215BB349C();
        ((void (**)(_QWORD, void *, char *))v124)[2](v124, v125, v122);

        _Block_release(v124);
        _Block_release(v124);
        swift_bridgeObjectRelease();

      }
      else
      {

LABEL_87:
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      v126 = *(_QWORD *)&v64[qword_253D74F90];
      v127 = v133;
      if (!__OFADD__(v126, v152))
        break;
      __break(1u);
LABEL_101:
      swift_once();
    }
    *(_QWORD *)&v64[qword_253D74F90] = v126 + v152;
    v48 = sub_215BB32E0();

    v136((char *)v13, v127);
    swift_release();
    swift_bridgeObjectRelease();
    return v48;
  }
LABEL_89:
  v109 = v88;
  swift_bridgeObjectRetain();
  v92 = sub_215BB367C();
  if (!v92)
    goto LABEL_90;
LABEL_65:
  if (v92 >= 1)
  {
    v94 = 0;
    v95 = v62 & 0xC000000000000001;
    v96 = v62;
    do
    {
      if (v95)
        v97 = (id)MEMORY[0x2199ECC8C](v94, v62);
      else
        v97 = *(id *)(v62 + 8 * v94 + 32);
      v98 = v97;
      ++v94;
      v140 = 0;
      v141 = 0xE000000000000000;
      sub_215BB35F8();
      swift_bridgeObjectRelease();
      v140 = 0x2064726F57202020;
      v141 = 0xE800000000000000;
      v153.location = (NSUInteger)objc_msgSend(v98, sel_textRange);
      v99 = NSStringFromRange(v153);
      sub_215BB3394();

      sub_215BB3418();
      swift_bridgeObjectRelease();
      sub_215BB3418();
      v100 = objc_msgSend(v98, sel_byteSampleOffset);
      if ((uint64_t)v100 >= 0)
        v101 = (uint64_t)v100;
      else
        v101 = (uint64_t)v100 + 1;
      v139 = v101 >> 1;
      sub_215BB36A0();
      sub_215BB3418();
      swift_bridgeObjectRelease();
      sub_215BB3418();
      sub_215BB3418();

      swift_bridgeObjectRelease();
      v62 = v96;
    }
    while (v92 != v94);
    goto LABEL_90;
  }
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  result = sub_215BB3670();
  __break(1u);
  return result;
}

uint64_t sub_215BAD940(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_215BB01EC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[2 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[2 * v2] && (unint64_t)v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 16 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_215BB3694();
  __break(1u);
  return result;
}

uint64_t sub_215BADA84(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9938);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 1) != 0)
  {
    v28 = a5;
    v29 = a6;
    v26 = a1;
    v27 = a2;
    v20 = sub_215BB3130();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 1, 1, v20);
    sub_215BB0D30();
  }
  else
  {
    v15 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0)
      v15 = a5 & 0xFFFFFFFFFFFFLL;
    if (a3 >> 14 >= 4 * v15)
      return 0;
    v28 = a5;
    v29 = a6;
    v26 = a1;
    v27 = a2;
    v16 = sub_215BB3130();
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
    v25(v14, 1, 1, v16);
    sub_215BB0D30();
    v17 = sub_215BB35B0();
    v19 = v18;
    sub_215BB2AB4((uint64_t)v14, &qword_254DF9938);
    if ((v19 & 1) == 0)
      return v17;
    v28 = a5;
    v29 = a6;
    v26 = a1;
    v27 = a2;
    v25(v14, 1, 1, v16);
  }
  v17 = sub_215BB35B0();
  v22 = v21;
  sub_215BB2AB4((uint64_t)v14, &qword_254DF9938);
  if ((v22 & 1) != 0)
    return 0;
  return v17;
}

uint64_t sub_215BADCC8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  os_unfair_lock_s *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t result;
  void *v19;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_215BB3190();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215BB31B4();
  v6 = (void *)sub_215BB31A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEB5E60], v2);
  v7 = *(void **)&v1[qword_253D75000];
  if (v7)
  {
    v8 = objc_msgSend(v7, sel_jobIdentifier);
    sub_215BB3394();

  }
  sub_215BB319C();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(*(id *)&v1[qword_253D74F98], sel_stopSynthesis);
  v9 = (os_unfair_lock_s *)(*(_QWORD *)&v1[qword_253D74F68] + 16);
  os_unfair_lock_lock(v9);
  v10 = &v1[qword_253D74FE0];
  swift_beginAccess();
  *(_QWORD *)v10 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v11 = qword_253D74FC8;
  v12 = *(void **)&v1[qword_253D74FC8];
  *(_QWORD *)&v1[qword_253D74FC8] = 0;

  v13 = *(NSObject **)&v1[qword_253D74F80];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v1;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_215BB0C60;
  *(_QWORD *)(v15 + 24) = v14;
  aBlock[4] = sub_215BB2EA4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_215BAC11C;
  aBlock[3] = &block_descriptor_22;
  v16 = _Block_copy(aBlock);
  v17 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v13, v16);
  _Block_release(v16);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v17[qword_253D75070] = 0;
    v19 = *(void **)&v1[v11];
    *(_QWORD *)&v1[v11] = 0;

    objc_msgSend(*(id *)&v17[qword_253D74FF8], sel_broadcast);
    os_unfair_lock_unlock(v9);
    return swift_release();
  }
  return result;
}

void sub_215BADF90(void *a1)
{
  id v1;

  v1 = a1;
  sub_215BADCC8();

}

void sub_215BADFC4()
{
  uint64_t v0;

  *(_BYTE *)(v0 + qword_253D75020) = 0;
}

uint64_t sub_215BADFD4(uint64_t result)
{
  *(_BYTE *)(result + qword_253D75020) = 0;
  return result;
}

void sub_215BADFE4(uint64_t a1, char a2)
{
  sub_215BB152C(a2);
}

void sub_215BADFEC(void *a1, uint64_t a2, void *a3, char a4)
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a1;
  sub_215BB152C(a4);

}

id sub_215BAE044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  os_unfair_lock_s *v9;
  _QWORD *v10;
  id v11;
  id result;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void (*v18)(_BYTE *, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];

  v1 = v0;
  v2 = sub_215BB3124();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v23[-v7];
  v9 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + qword_253D74F68) + 16);
  os_unfair_lock_lock(v9);
  v10 = (_QWORD *)(v0 + qword_253D74FE0);
  swift_beginAccess();
  if (!(*v10 >> 62))
  {
    if (*(_QWORD *)((*v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:
    v11 = 0;
LABEL_15:
    os_unfair_lock_unlock(v9);
    v14 = *(void **)(v1 + qword_253D74F98);
    if (v14)
    {
      v15 = objc_msgSend(v14, sel_synthesizing);
      if (!v11)
      {
        if (v15)
        {
          v16 = objc_msgSend(*(id *)(v1 + qword_253D74FF8), sel_wait);
          return (id)sub_215BAE044(v16);
        }
LABEL_20:
        if (*(_BYTE *)(v1 + qword_253D75020) != 1)
          return 0;
        v17 = *(void **)(v1 + qword_253D74FF8);
        sub_215BB30F4();
        sub_215BB3100();
        v18 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
        v18(v6, v2);
        v19 = (void *)sub_215BB30E8();
        v18(v8, v2);
        objc_msgSend(v17, sel_waitUntilDate_, v19);

        return (id)sub_215BAE044(v16);
      }
    }
    else if (!v11)
    {
      goto LABEL_20;
    }
    return v11;
  }
  swift_bridgeObjectRetain();
  v13 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_14;
LABEL_3:
  swift_beginAccess();
  v11 = (id)*v10;
  if (!(*v10 >> 62))
  {
    if (*(_QWORD *)(((unint64_t)v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  v20 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_26;
LABEL_5:
  v11 = (id)*v10;
  if (!(*v10 >> 62))
  {
    if (*(_QWORD *)(((unint64_t)v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_7;
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v21 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (!v21)
    goto LABEL_28;
LABEL_7:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
LABEL_29:
    result = (id)MEMORY[0x2199ECC8C](0, v11);
    goto LABEL_10;
  }
  if (!*(_QWORD *)(((unint64_t)v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    v22 = sub_215BB367C();
    result = (id)swift_bridgeObjectRelease();
    if (v22)
      goto LABEL_12;
    goto LABEL_32;
  }
  result = *((id *)v11 + 4);
LABEL_10:
  v11 = result;
  if (*v10 >> 62)
    goto LABEL_31;
  if (*(_QWORD *)((*v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_12:
    sub_215BB0E50(0, 1);
    swift_endAccess();
    goto LABEL_15;
  }
LABEL_32:
  __break(1u);
  return result;
}

void sub_215BAE370(uint64_t a1, void *a2)
{
  sub_215BB1648(a2);
}

void sub_215BAE378(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_215BB1648(v7);

}

uint64_t sub_215BAE3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_215BB19B4(a2, a3);
}

void sub_215BAE3E8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a1;
  sub_215BB19B4(a4, a5);

}

void sub_215BAE448()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  dispatch_semaphore_t v27;
  NSObject *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  dispatch_semaphore_t v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_215BB3328();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - v7;
  if ((TTSVBHasDeviceBeenUnlockedSinceBoot() & 1) == 0)
  {
    if (qword_253D74F20 != -1)
      swift_once();
    v16 = sub_215BB3220();
    __swift_project_value_buffer(v16, (uint64_t)qword_253D74F08);
    v17 = sub_215BB3208();
    v18 = sub_215BB3508();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_16;
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    v20 = "Device has not been unlocked yet. Will not fetch personal voices";
    goto LABEL_15;
  }
  v9 = qword_253D75040;
  if (*(uint64_t *)&v0[qword_253D75040] >= 5)
  {
    if (qword_253D74F20 != -1)
      swift_once();
    v21 = sub_215BB3220();
    __swift_project_value_buffer(v21, (uint64_t)qword_253D74F08);
    v17 = sub_215BB3208();
    v18 = sub_215BB34FC();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_16;
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    v20 = "Asking for personal voices too many times without any any responses. Will not continue asking to avoid leaking ports";
LABEL_15:
    _os_log_impl(&dword_215BA2000, v17, v18, v20, v19, 2u);
    MEMORY[0x2199ED418](v19, -1, -1);
LABEL_16:

    return;
  }
  v35 = dispatch_semaphore_create(0);
  if (qword_253D74F20 != -1)
    swift_once();
  v10 = sub_215BB3220();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_253D74F08);
  v12 = v1;
  v34 = v11;
  v13 = sub_215BB3208();
  v14 = sub_215BB3508();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 134217984;
    v36 = *(_QWORD *)&v1[v9];
    sub_215BB3598();

    _os_log_impl(&dword_215BA2000, v13, v14, "Will fetch personal voices from service. FetchCount=%ld", v15, 0xCu);
    MEMORY[0x2199ED418](v15, -1, -1);

  }
  else
  {

  }
  v22 = *(_QWORD *)&v1[v9];
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v1[v9] = v24;
    sub_215BA948C();
    v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v26 = swift_allocObject();
    v27 = v35;
    *(_QWORD *)(v26 + 16) = v25;
    *(_QWORD *)(v26 + 24) = v27;
    swift_retain();
    v28 = v27;
    sub_215BB3268();
    swift_release();
    swift_release();
    swift_release();
    sub_215BB331C();
    MEMORY[0x2199EC9B0](v6, 5.0);
    v29 = *(void (**)(char *, uint64_t))(v3 + 8);
    v29(v6, v2);
    sub_215BB3550();
    v29(v8, v2);
    v30 = sub_215BB32EC();
    if ((v30 & 1) != 0)
    {
      v31 = sub_215BB3208();
      v32 = sub_215BB34FC();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_215BA2000, v31, v32, "Timeout occurred fetching personal voices", v33, 2u);
        MEMORY[0x2199ED418](v33, -1, -1);
      }

    }
    else
    {
      MEMORY[0x24BDAC7A8](v30);
      *(&v34 - 2) = (uint64_t)v12;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D74DC0);
      sub_215BB3538();

    }
  }
}

uint64_t sub_215BAE908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t result;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void (*v30)(char *, uint64_t);
  NSObject *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t aBlock[6];

  v6 = sub_215BB325C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v37 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D74E68);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  result = MEMORY[0x2199ED454](a2 + 16);
  if (result)
  {
    v17 = (char *)result;
    sub_215BB2BCC(a1, (uint64_t)v15, (uint64_t *)&unk_253D74E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v39 = a3;
      (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v12, v15, v6);
      if (qword_253D74F20 != -1)
        goto LABEL_18;
      while (1)
      {
        v18 = sub_215BB3220();
        __swift_project_value_buffer(v18, (uint64_t)qword_253D74F08);
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
        v19 = sub_215BB3208();
        v20 = sub_215BB34FC();
        if (os_log_type_enabled(v19, v20))
        {
          v21 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          aBlock[0] = v38;
          *(_DWORD *)v21 = 136315138;
          v37[1] = v21 + 4;
          v22 = sub_215BB3250();
          v40 = sub_215BB02F8(v22, v23, aBlock);
          sub_215BB3598();
          swift_bridgeObjectRelease();
          v24 = *(void (**)(char *, uint64_t))(v7 + 8);
          v24(v10, v6);
          _os_log_impl(&dword_215BA2000, v19, v20, "Fetching personal voices failed: %s", v21, 0xCu);
          v10 = (char *)v38;
          swift_arrayDestroy();
          MEMORY[0x2199ED418](v10, -1, -1);
          MEMORY[0x2199ED418](v21, -1, -1);

          v24(v12, v6);
        }
        else
        {

          v30 = *(void (**)(char *, uint64_t))(v7 + 8);
          v30(v10, v6);
          v30(v12, v6);
        }
        v6 = 0;
        v12 = 0;
LABEL_14:
        v34 = *(_QWORD *)&v17[qword_253D75040];
        v35 = __OFSUB__(v34, 1);
        v36 = v34 - 1;
        if (!v35)
          break;
        __break(1u);
LABEL_18:
        swift_once();
      }
      *(_QWORD *)&v17[qword_253D75040] = v36;
      sub_215BB355C();

      return sub_215BB2C80(v6);
    }
    else
    {
      v25 = *v15;
      if (qword_253D74F20 != -1)
        swift_once();
      v26 = sub_215BB3220();
      __swift_project_value_buffer(v26, (uint64_t)qword_253D74F08);
      swift_bridgeObjectRetain();
      v27 = sub_215BB3208();
      v28 = sub_215BB3508();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v29 = 134217984;
        aBlock[0] = *(_QWORD *)(v25 + 16);
        sub_215BB3598();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_215BA2000, v27, v28, "Did fetch (%ld) personal voices from service", v29, 0xCu);
        MEMORY[0x2199ED418](v29, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
      }
      v31 = *(NSObject **)&v17[qword_253D75090];
      v12 = (char *)swift_allocObject();
      *((_QWORD *)v12 + 2) = v17;
      *((_QWORD *)v12 + 3) = v25;
      v32 = swift_allocObject();
      v6 = (uint64_t)sub_215BB2C3C;
      *(_QWORD *)(v32 + 16) = sub_215BB2C3C;
      *(_QWORD *)(v32 + 24) = v12;
      aBlock[4] = (uint64_t)sub_215BB2EA4;
      aBlock[5] = v32;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_215BAC11C;
      aBlock[3] = (uint64_t)&block_descriptor_79;
      v10 = (char *)_Block_copy(aBlock);
      v33 = v17;
      swift_retain();
      swift_release();
      dispatch_sync(v31, v10);
      _Block_release(v10);
      LOBYTE(v31) = swift_isEscapingClosureAtFileLocation();
      result = swift_release();
      if ((v31 & 1) == 0)
        goto LABEL_14;
      __break(1u);
    }
  }
  return result;
}

void sub_215BAEE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  NSObject *v43;
  id v44;
  uint8_t *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  NSObject *v57;
  char **v58;
  uint8_t *v59;
  id v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84[2];

  v82 = a1;
  v3 = sub_215BB3220();
  v74 = *(_QWORD *)(v3 - 8);
  v75 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v73 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v72 = (char *)&v72 - v6;
  v7 = sub_215BB30C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_215BB3244();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v81 = (char *)&v72 - v19;
  sub_215BAE448();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v77 = v13;
    v78 = v10;
    v79 = v8;
    v80 = v7;
    v22 = v20 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v23 = *(_QWORD *)(v15 + 72);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v76 = v20;
    swift_bridgeObjectRetain();
    while (1)
    {
      v24(v18, v22, v14);
      swift_getKeyPath();
      sub_215BB3238();
      swift_release();
      if (v84[0] == v82 && v84[1] == a2)
        break;
      v26 = sub_215BB36AC();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
        goto LABEL_12;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease();
        v27 = 1;
        v8 = v79;
        v7 = v80;
        v13 = v77;
        v10 = v78;
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    v13 = v77;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v77, v18, v14);
    v27 = 0;
    v8 = v79;
    v7 = v80;
    v10 = v78;
  }
  else
  {
    v27 = 1;
  }
LABEL_13:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v27, 1, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    v52 = v81;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v81, v13, v14);
    sub_215BB322C();
    sub_215BB30B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v52, v14);
    return;
  }
  sub_215BB2AB4((uint64_t)v13, &qword_254DF9AC0);
  v28 = (void *)objc_opt_self();
  v29 = objc_msgSend(v28, sel_sharedInstance);
  v30 = (void *)sub_215BB3388();
  v31 = objc_msgSend(v29, sel_resourceWithVoiceId_, v30);

  if (v31)
  {
    if (objc_msgSend(v31, sel_type) == (id)3
      && objc_msgSend(v31, sel_subtype) == (id)7
      && objc_msgSend(v31, sel_footprint) == (id)3)
    {
      v32 = objc_msgSend(v31, sel_name);
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v31, sel_primaryLanguage);
        if (!v34)
        {
          sub_215BB3394();
          v34 = (id)sub_215BB3388();
          swift_bridgeObjectRelease();
        }
        v35 = objc_msgSend((id)objc_opt_self(), sel_voiceIdentifierForType_footprint_language_name_, 7, 4, v34, v33);

        if (v35)
        {
          v36 = objc_msgSend(v28, sel_sharedInstance);
          v37 = objc_msgSend(v36, sel_resourceWithVoiceId_, v35);

          if (v37)
          {
            if (objc_msgSend(v37, sel_isInstalled))
            {
              v39 = v74;
              v38 = v75;
              if (qword_253D74F20 != -1)
                swift_once();
              v40 = __swift_project_value_buffer(v38, (uint64_t)qword_253D74F08);
              v41 = v72;
              (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v72, v40, v38);
              v42 = v37;
              v43 = sub_215BB3208();
              v44 = (id)sub_215BB34F0();
              if (!os_log_type_enabled(v43, (os_log_type_t)v44))
              {

                (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
                goto LABEL_36;
              }
              v45 = (uint8_t *)swift_slowAlloc();
              v46 = swift_slowAlloc();
              v84[0] = v46;
              *(_DWORD *)v45 = 136315138;
              v47 = objc_msgSend(v42, sel_voiceId);
              if (v47)
              {
                v48 = v47;
                v49 = sub_215BB3394();
                v51 = v50;

                v83 = sub_215BB02F8(v49, v51, v84);
                sub_215BB3598();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_215BA2000, v43, (os_log_type_t)v44, "Found upgraded siri voice %s", v45, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2199ED418](v46, -1, -1);
                MEMORY[0x2199ED418](v45, -1, -1);

                (*(void (**)(char *, uint64_t))(v74 + 8))(v72, v75);
LABEL_36:
                v65 = objc_msgSend(v42, sel_contentPath);
                if (v65)
                {
                  v66 = v65;
                  sub_215BB3394();

                  return;
                }

LABEL_44:
                return;
              }
              goto LABEL_47;
            }
            v54 = v74;
            v53 = v75;
            if (qword_253D74F20 != -1)
              swift_once();
            v55 = __swift_project_value_buffer(v53, (uint64_t)qword_253D74F08);
            v56 = v73;
            (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v73, v55, v53);
            v44 = v37;
            v57 = sub_215BB3208();
            v42 = (id)sub_215BB34F0();
            v58 = &selRef_setPrimeMethod_;
            if (os_log_type_enabled(v57, (os_log_type_t)v42))
            {
              v59 = (uint8_t *)swift_slowAlloc();
              v82 = swift_slowAlloc();
              v84[0] = v82;
              *(_DWORD *)v59 = 136315138;
              v60 = objc_msgSend(v44, sel_voiceId);
              if (!v60)
              {
LABEL_48:

                __break(1u);
                return;
              }
              v61 = v60;
              v81 = (char *)(v59 + 4);
              v62 = sub_215BB3394();
              v64 = v63;

              v83 = sub_215BB02F8(v62, v64, v84);
              sub_215BB3598();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_215BA2000, v57, (os_log_type_t)v42, "Downloading upgraded siri voice %s", v59, 0xCu);
              v42 = (id)v82;
              swift_arrayDestroy();
              MEMORY[0x2199ED418](v42, -1, -1);
              MEMORY[0x2199ED418](v59, -1, -1);

              (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v75);
              v58 = &selRef_setPrimeMethod_;
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
            }
            v67 = objc_msgSend(v28, sel_sharedInstance);
            v68 = objc_msgSend(v44, v58[97]);
            if (!v68)
            {
              __break(1u);
LABEL_47:

              __break(1u);
              goto LABEL_48;
            }
            v69 = v68;
            objc_msgSend(v67, sel_downloadResourceWithVoiceId_, v68);

          }
        }
      }
    }
    v70 = objc_msgSend(v31, sel_contentPath);
    if (v70)
    {
      v71 = v70;
      sub_215BB3394();

      return;
    }
    goto LABEL_44;
  }
}

void sub_215BAF724()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  id v30;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = (void *)sub_215BB3388();
  v4 = objc_msgSend(v2, sel_resourceWithVoiceId_, v3);

  if (v4)
  {
    v5 = qword_253D74F98;
    objc_msgSend(*(id *)&v1[qword_253D74F98], sel_unloadAllVoiceResources);
    sub_215BB31CC();
    v6 = sub_215BB31C0();
    v7 = v6;
    if (v6 >> 62)
      goto LABEL_14;
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v8; v8 = sub_215BB367C())
    {
      v9 = 4;
      v10 = 0;
      if ((v7 & 0xC000000000000001) != 0)
      {
LABEL_5:
        v11 = (id)MEMORY[0x2199ECC8C](v10, v7);
        goto LABEL_7;
      }
      while (1)
      {
        v11 = *(id *)(v7 + 8 * v9);
LABEL_7:
        v12 = v11;
        v13 = __OFADD__(v10, 1);
        v14 = v10 + 1;
        if (v13)
          break;
        v15 = *(void **)&v1[v5];
        if (v15)
          objc_msgSend(v15, sel_loadRuleset_, v12);

        if (v14 == v8)
          goto LABEL_15;
        v10 = ++v9 - 4;
        if ((v7 & 0xC000000000000001) != 0)
          goto LABEL_5;
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    v16 = objc_msgSend(v4, sel_primaryLanguage);
    if (!v16)
    {
      sub_215BB3394();
      v16 = (id)sub_215BB3388();
      swift_bridgeObjectRelease();
    }
    v17 = (void *)objc_opt_self();
    v18 = objc_msgSend(v4, sel_speechVoice);
    v19 = objc_msgSend(v18, sel_voiceType);

    v20 = objc_msgSend(v17, sel_effectiveResourceForLanguageCode_andVoiceType_, v16, v19);
    if (v20)
    {
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = v1;
      aBlock[4] = sub_215BB1AF4;
      aBlock[5] = v21;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_215BAFB70;
      aBlock[3] = &block_descriptor_28;
      v22 = _Block_copy(aBlock);
      v23 = v1;
      swift_release();
      objc_msgSend(v17, sel_enumerateLoadableResourcesInAsset_usingBlock_, v20, v22);
      _Block_release(v22);

    }
    else
    {
      if (qword_253D74F20 != -1)
        swift_once();
      v24 = sub_215BB3220();
      __swift_project_value_buffer(v24, (uint64_t)qword_253D74F08);
      v30 = v4;
      v25 = sub_215BB3208();
      v26 = sub_215BB34E4();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v27 = 138412290;
        aBlock[0] = v30;
        v29 = v30;
        sub_215BB3598();
        *v28 = v4;

        _os_log_impl(&dword_215BA2000, v25, v26, "Could not find voice resource for resource %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9940);
        swift_arrayDestroy();
        MEMORY[0x2199ED418](v28, -1, -1);
        MEMORY[0x2199ED418](v27, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_215BAFB70(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t, char *);
  uint64_t v19;

  v19 = sub_215BB30C4();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t, char *))(a1 + 32);
  v9 = sub_215BB3394();
  v11 = v10;
  v12 = sub_215BB3394();
  v14 = v13;
  v15 = _Block_copy(a4);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  sub_215BB30AC();
  swift_retain();
  v18(v9, v11, v12, v14, sub_215BB2504, v16, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v19);
}

uint64_t sub_215BAFCBC(uint64_t a1)
{
  id v1;
  uint64_t v2;

  v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  v2 = sub_215BB30DC();

  return v2;
}

void static TTSSiriSynthAudioUnit.registerAudioUnit()()
{
  Swift::UInt32 v0;
  void *v1;
  uint64_t ObjCClassFromMetadata;
  void *v3;
  _DWORD v4[2];
  uint64_t v5;
  int v6;

  if ((TTSIsBaseSystem() & 1) == 0)
  {
    v0 = String.osType()();
    v1 = (void *)objc_opt_self();
    type metadata accessor for TTSSiriSynthAudioUnit();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v3 = (void *)sub_215BB3388();
    v4[0] = 1635087216;
    v4[1] = v0;
    v5 = 1634758764;
    v6 = 0;
    objc_msgSend(v1, sel_registerSubclass_asComponentDescription_name_version_, ObjCClassFromMetadata, v4, v3, 0);

  }
}

void sub_215BAFDC8()
{
  Swift::UInt32 v0;
  void *v1;
  uint64_t ObjCClassFromMetadata;
  void *v3;
  _DWORD v4[2];
  uint64_t v5;
  int v6;

  if ((TTSIsBaseSystem() & 1) == 0)
  {
    v0 = String.osType()();
    v1 = (void *)objc_opt_self();
    type metadata accessor for TTSSiriSynthAudioUnit();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v3 = (void *)sub_215BB3388();
    v4[0] = 1635087216;
    v4[1] = v0;
    v5 = 1634758764;
    v6 = 0;
    objc_msgSend(v1, sel_registerSubclass_asComponentDescription_name_version_, ObjCClassFromMetadata, v4, v3, 0);

  }
}

uint64_t sub_215BAFE88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_253D74F30;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_215BB2AB4(v0 + qword_253D74FB8, &qword_253D74DB8);
  return swift_bridgeObjectRelease();
}

id TTSSiriSynthAudioUnit.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSSiriSynthAudioUnit();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_215BB002C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + qword_253D74F30;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_215BB2AB4(a1 + qword_253D74FB8, &qword_253D74DB8);
  return swift_bridgeObjectRelease();
}

unint64_t sub_215BB01A0(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_215BB3484();
  __break(1u);
  return result;
}

_QWORD *sub_215BB01EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9A98);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_215BB1158(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_215BB02F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_215BB03C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_215BB2A38((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_215BB2A38((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_215BB03C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_215BB35A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_215BB0580(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_215BB3628();
  if (!v8)
  {
    sub_215BB3670();
    __break(1u);
LABEL_17:
    result = sub_215BB3694();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_215BB0580(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_215BB0614(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_215BB0864(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_215BB0864(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_215BB0614(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_215BB0788(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_215BB3604();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_215BB3670();
      __break(1u);
LABEL_10:
      v2 = sub_215BB3430();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_215BB3694();
    __break(1u);
LABEL_14:
    result = sub_215BB3670();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_215BB0788(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AB0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_215BB07EC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_215BB346C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2199ECAB8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_215BB0864(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AB0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_215BB3694();
  __break(1u);
  return result;
}

uint64_t sub_215BB09B0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_215BB09CC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_215BB09CC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DF9AB8);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_215BB3694();
  __break(1u);
  return result;
}

unint64_t sub_215BB0B34(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_215BB35D4();
  return sub_215BB0B64(a1, v2);
}

unint64_t sub_215BB0B64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_215BB2B00(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199ECC5C](v9, a1);
      sub_215BB2B3C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

_QWORD *sub_215BB0C28(_QWORD *a1)
{
  return sub_215BB01EC(0, a1[2], 0, a1);
}

uint64_t sub_215BB0C3C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_215BB0C64()
{
  return swift_deallocObject();
}

uint64_t sub_215BB0C74()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_215BB0CAC()
{
  unint64_t result;

  result = qword_254DF9920;
  if (!qword_254DF9920)
  {
    result = MEMORY[0x2199ED394](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254DF9920);
  }
  return result;
}

uint64_t sub_215BB0CF0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199ED394](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_215BB0D30()
{
  unint64_t result;

  result = qword_253D74E90;
  if (!qword_253D74E90)
  {
    result = MEMORY[0x2199ED394](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253D74E90);
  }
  return result;
}

uint64_t sub_215BB0D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7;

  return sub_215BAC480(a1, a2, a3, a4, a5, a6, a7, *(void **)(v7 + 16));
}

uint64_t sub_215BB0D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_215BB0DC4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_215BB0DE8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 16) + qword_253D74FA8);
  swift_beginAccess();
  *v1 = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_215BB0E40()
{
  return swift_deallocObject();
}

uint64_t sub_215BB0E50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_215BB367C();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_215BB367C();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_215BB367C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x2199ECC98](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_215BB299C(0, &qword_254DF9A90);
  swift_arrayDestroy();
  if (!v5)
    return sub_215BB34B4();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_215BB367C();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_215BB34B4();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_215BB367C();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_215BB3694();
  __break(1u);
  return result;
}

char *sub_215BB1158(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_215BB3694();
  __break(1u);
  return result;
}

_QWORD *sub_215BB1240(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  int64_t v9;
  _QWORD *result;
  int64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD **)v4;
  v8 = *(_QWORD *)(*(_QWORD *)v4 + 16);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v9 > v7[3] >> 1)
    goto LABEL_8;
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9)
        v13 = v8 + v6;
      else
        v13 = v8;
      result = sub_215BB01EC(result, v13, 1, v7);
      v7 = result;
      if (v5 != a3)
        goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_12:
  v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6)
    goto LABEL_25;
  if (v6 < 0)
    goto LABEL_27;
  v15 = (char *)&v7[2 * v14 + 4];
  v16 = (char *)(a2 + 16 * a3);
  if (v16 < &v15[16 * v6] && v15 < &v16[16 * v6])
    goto LABEL_27;
  result = memcpy(v15, v16, 16 * v6);
  if (!v6)
  {
LABEL_22:
    *(_QWORD *)v4 = v7;
    return result;
  }
  v18 = v7[2];
  v19 = __OFADD__(v18, v6);
  v20 = v18 + v6;
  if (!v19)
  {
    v7[2] = v20;
    goto LABEL_22;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  result = (_QWORD *)sub_215BB3694();
  __break(1u);
  return result;
}

char *sub_215BB13D4(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_215BB01EC(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[16 * a1 + 32];
    v15 = &v4[16 * a2 + 32];
    if (a1 != a2 || result >= &v15[16 * v14])
      result = (char *)memmove(result, v15, 16 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_215BB3694();
  __break(1u);
  return result;
}

void sub_215BB152C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;

  v2 = v1;
  *(_BYTE *)(v2 + qword_253D75020) = 0;
  objc_msgSend(*(id *)(v2 + qword_253D74FF8), sel_broadcast);
  if ((a1 & 1) == 0)
  {
    if (qword_253D74F20 != -1)
      swift_once();
    v4 = sub_215BB3220();
    __swift_project_value_buffer(v4, (uint64_t)qword_253D74F08);
    v5 = sub_215BB3208();
    v6 = sub_215BB34FC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215BA2000, v5, v6, "SiriSSE encountered error during synthesis. Resetting engine.", v7, 2u);
      MEMORY[0x2199ED418](v7, -1, -1);
    }

    v8 = *(void **)(v2 + qword_253D74F98);
    *(_QWORD *)(v2 + qword_253D74F98) = 0;

  }
}

void sub_215BB1648(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  os_unfair_lock_s *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[3];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D74DB8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v28 - v8;
  v10 = sub_215BB3124();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v28 - v15;
  v17 = v2 + qword_253D74FB8;
  swift_beginAccess();
  sub_215BB2BCC(v17, (uint64_t)v9, &qword_253D74DB8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_215BB2AB4((uint64_t)v9, &qword_253D74DB8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    sub_215BB3118();
    sub_215BB310C();
    v19 = v18;
    v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v14, v10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
    swift_beginAccess();
    sub_215BB0D7C((uint64_t)v7, v17);
    swift_endAccess();
    if (qword_253D74F20 != -1)
      swift_once();
    v21 = sub_215BB3220();
    __swift_project_value_buffer(v21, (uint64_t)qword_253D74F08);
    v22 = sub_215BB3208();
    v23 = sub_215BB34F0();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v24 = 134217984;
      v28[0] = v19;
      sub_215BB3598();
      _os_log_impl(&dword_215BA2000, v22, v23, "SiriAUSP first buffer latency %fs", v24, 0xCu);
      MEMORY[0x2199ED418](v24, -1, -1);
    }

    v20(v16, v10);
  }
  *(_BYTE *)(v2 + qword_253D75020) = 0;
  v25 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + qword_253D74F68) + 16);
  os_unfair_lock_lock(v25);
  v26 = (_QWORD *)(v2 + qword_253D74FE0);
  swift_beginAccess();
  v27 = a1;
  MEMORY[0x2199ECB0C]();
  if (*(_QWORD *)((*v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_215BB34C0();
  sub_215BB34CC();
  sub_215BB34B4();
  swift_endAccess();
  objc_msgSend(*(id *)(v2 + qword_253D74FF8), sel_broadcast);
  os_unfair_lock_unlock(v25);
}

uint64_t sub_215BB19B4(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v2[qword_253D75020] = 0;
  v5 = *(NSObject **)&v2[qword_253D74F80];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a1;
  v6[4] = v2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_215BB2530;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_215BB2EA4;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_215BAC11C;
  v12[3] = &block_descriptor_51;
  v8 = _Block_copy(v12);
  v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_215BB1AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;

  v9 = *(_QWORD *)(v5 + 16);
  v10 = objc_msgSend(objc_allocWithZone((Class)TTSSiriVoiceResource), sel_init);
  if (a3 != 0xD000000000000022 || a4 != 0x8000000215BB5630)
  {
    v19 = v10;
    v11 = sub_215BB36AC();
    v10 = v19;
    if ((v11 & 1) == 0)
    {
      if (a3 == 0xD000000000000020 && a4 == 0x8000000215BB5660 || (sub_215BB36AC() & 1) != 0)
      {
        v12 = 1;
      }
      else if (a3 == 0xD00000000000001FLL && a4 == 0x8000000215BB5690)
      {
        v12 = 2;
      }
      else if ((sub_215BB36AC() & 1) != 0)
      {
        v12 = 2;
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v19, sel_setType_, v12);
      v13 = (void *)sub_215BB3388();
      objc_msgSend(v19, sel_setResourceName_, v13);

      v14 = a5();
      v16 = v15;
      v17 = (void *)sub_215BB30D0();
      sub_215BA7F68(v14, v16);
      objc_msgSend(v19, sel_setResourceData_, v17);

      v18 = *(id *)(v9 + qword_253D74F98);
      objc_msgSend(v18, sel_loadVoiceResource_, v19);

      v10 = v19;
    }
  }

}

unint64_t sub_215BB1CF4()
{
  unint64_t result;

  result = qword_254DF9948;
  if (!qword_254DF9948)
  {
    result = MEMORY[0x2199ED394](&unk_215BB431C, &type metadata for SiriParameter);
    atomic_store(result, (unint64_t *)&qword_254DF9948);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriParameter(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SiriParameter(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_215BB1DD0 + 4 * byte_215BB4310[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_215BB1DF0 + 4 * byte_215BB4315[v4]))();
}

_BYTE *sub_215BB1DD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_215BB1DF0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_215BB1DF8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_215BB1E00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_215BB1E08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_215BB1E10(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_215BB1E1C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriParameter()
{
  return &type metadata for SiriParameter;
}

void sub_215BB1E38()
{
  unint64_t v0;
  unint64_t v1;

  sub_215BB20A8();
  if (v0 <= 0x3F)
  {
    sub_215BB2104();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t method lookup function for TTSSiriSynthAudioUnit()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 288))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 296))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 304))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siriDidStartSynthesis(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 816))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siriDidEndSynthesis(_:successfully:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 824))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siri(_:didGenerate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 840))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siri(_:didGenerateMarkers:count:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x24BEE4EA0] & *v0) + 848))();
}

void sub_215BB20A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D74E88)
  {
    v0 = sub_215BB3160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D74E88);
  }
}

void sub_215BB2104()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D74ED0)
  {
    sub_215BB3124();
    v0 = sub_215BB3580();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D74ED0);
  }
}

uint64_t sub_215BB2158()
{
  return type metadata accessor for TTSSiriSynthAudioUnit();
}

uint64_t sub_215BB2164(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for TTSSiriSynthAudioUnit.Error(uint64_t a1)
{
  return sub_215BB2184(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_215BB2184(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s25TextToSpeechBundleSupport21TTSSiriSynthAudioUnitC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_215BB2164(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TTSSiriSynthAudioUnit.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_215BB2164(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_215BB2184(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTSSiriSynthAudioUnit.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_215BB2184(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSSiriSynthAudioUnit.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSSiriSynthAudioUnit.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_215BB2314(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_215BB231C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TTSSiriSynthAudioUnit.Error()
{
  return &type metadata for TTSSiriSynthAudioUnit.Error;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_215BB2E5C(a1, (unint64_t *)&unk_253D74E40);
}

uint64_t sub_215BB2358(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_215BB23AC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for SiriTTSMarker(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_253D74DE8);
}

uint64_t sub_215BB2400(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_215BB243C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_215BB245C(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_253D74DF0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_215BB2E5C(a1, (unint64_t *)&unk_253D74E08);
}

uint64_t sub_215BB24B0(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_215BAC878(a1, a3, a5, v5);
}

uint64_t sub_215BB24C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_215BB24E4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_215BB2504()
{
  uint64_t v0;

  return sub_215BAFCBC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_215BB250C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_215BB2530()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  uint64_t v22;

  v1 = v0[2];
  if (v1 < 0)
  {
LABEL_29:
    __break(1u);
  }
  else
  {
    if (v1)
    {
      v2 = v0[3];
      v22 = v0[4] + qword_253D74FA8;
      swift_beginAccess();
      v3 = 0;
      v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v21 = v1;
      while (1)
      {
        v6 = v2 + 16 * v3;
        if ((*(_BYTE *)v6 & 1) == 0)
        {
          v7 = *(_BYTE *)(v6 + 1);
          v8 = *(unsigned __int16 *)(v6 + 2);
          v9 = *(_DWORD *)(v6 + 4);
          v10 = *(_QWORD *)(v6 + 8);
          v11 = *(_QWORD *)v22;
          v12 = *(_QWORD *)(*(_QWORD *)v22 + 16);
          if (v12)
          {
            v13 = 0;
            v14 = 0;
            while (1)
            {
              v15 = *(_BYTE *)(v11 + v13 + 32) != 1 && v9 == *(_DWORD *)(v11 + v13 + 36);
              if (v15 && v8 == *(unsigned __int16 *)(v11 + v13 + 34))
                break;
              ++v14;
              v13 += 16;
              if (v12 == v14)
                goto LABEL_18;
            }
            swift_beginAccess();
            v19 = *(_QWORD **)v22;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)v22 = v19;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v19 = sub_215BB0C28(v19);
              *(_QWORD *)v22 = v19;
            }
            if (v14 >= v19[2])
            {
              __break(1u);
              goto LABEL_29;
            }
            v19[v13 / 8 + 5] = v10;
            swift_endAccess();
          }
          else
          {
LABEL_18:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v4 = sub_215BB01EC(0, v4[2] + 1, 1, v4);
            v18 = v4[2];
            v17 = v4[3];
            if (v18 >= v17 >> 1)
              v4 = sub_215BB01EC((_QWORD *)(v17 > 1), v18 + 1, 1, v4);
            v4[2] = v18 + 1;
            v5 = &v4[2 * v18];
            *((_BYTE *)v5 + 32) = 0;
            *((_BYTE *)v5 + 33) = v7;
            *((_WORD *)v5 + 17) = v8;
            *((_DWORD *)v5 + 9) = v9;
            v5[5] = v10;
          }
          v1 = v21;
        }
        if (++v3 == v1)
          goto LABEL_27;
      }
    }
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_27:
    swift_beginAccess();
    sub_215BAD940((uint64_t)v4);
    swift_endAccess();
  }
}

uint64_t sub_215BB2750()
{
  return swift_deallocObject();
}

uint64_t sub_215BB2764()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_215BB2788()
{
  _QWORD *v0;
  char *v1;
  unsigned int *v2;
  _QWORD *v3;
  char *v4;
  _QWORD *v5;
  char *v6;
  char isUniquelyReferenced_nonNull_native;
  int64_t i;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char v13;
  _QWORD *v14;
  char v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v1 = (char *)v0[2];
  v2 = (unsigned int *)v0[3];
  v3 = (_QWORD *)v0[5];
  v4 = &v1[qword_253D74FA8];
  swift_beginAccess();
  v5 = *(_QWORD **)v4;
  v6 = v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v4 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_14;
  for (i = v5[2]; i; i = v5[2])
  {
    v9 = v5 + 4;
    v10 = qword_253D74F90;
    v11 = v6;
    v12 = 0;
    while (1)
    {
      v17 = *(_QWORD *)&v6[v10];
      v18 = *v2;
      v19 = v17 + v18;
      if (__OFADD__(v17, v18))
        break;
      v20 = &v9[2 * v12];
      v21 = v20[1];
      if (v21 >= v19)
      {
        if (v12 >= i - 1)
        {
LABEL_12:

          goto LABEL_16;
        }
        v22 = (uint64_t)&v5[2 * i-- + 2];
        while (*(_QWORD *)(v22 + 8) >= v19)
        {
          --i;
          v22 -= 16;
          if (v12 >= i)
            goto LABEL_12;
        }
        v13 = *(_BYTE *)v20;
        v14 = &v9[2 * v12];
        v15 = *((_BYTE *)v14 + 1);
        v16 = *((_WORD *)v14 + 1);
        LODWORD(v14) = *((_DWORD *)v14 + 1);
        *(_OWORD *)v20 = *(_OWORD *)v22;
        *(_BYTE *)v22 = v13;
        *(_BYTE *)(v22 + 1) = v15;
        *(_WORD *)(v22 + 2) = v16;
        *(_DWORD *)(v22 + 4) = (_DWORD)v14;
        *(_QWORD *)(v22 + 8) = v21;
      }
      if (++v12 >= i)
        goto LABEL_12;
    }
    __break(1u);
LABEL_14:
    v5 = sub_215BB0C28(v5);
    *(_QWORD *)v4 = v5;
  }
  v12 = 0;
LABEL_16:
  *(_QWORD *)v4 = v5;
  swift_endAccess();

  v23 = *(_QWORD **)v4;
  if (*(_QWORD *)(*(_QWORD *)v4 + 16) < (unint64_t)v12)
  {
    __break(1u);
  }
  else
  {
    v24 = swift_bridgeObjectRetain();
    sub_215BB1240(v24, (uint64_t)(v23 + 4), 0, (2 * v12) | 1);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (!v12)
    {
LABEL_20:
      swift_endAccess();
      *v3 = *(_QWORD *)(*(_QWORD *)v4 + 16);
      return;
    }
    if (*(_QWORD *)(*(_QWORD *)v4 + 16) >= (unint64_t)v12)
    {
      sub_215BB13D4(0, v12);
      goto LABEL_20;
    }
  }
  __break(1u);
}

uint64_t sub_215BB298C()
{
  return swift_deallocObject();
}

uint64_t sub_215BB299C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_215BB29D4()
{
  unint64_t result;

  result = qword_254DF9AA8;
  if (!qword_254DF9AA8)
  {
    result = MEMORY[0x2199ED394](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_254DF9AA8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_215BB2A38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_215BB2AB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_215BB2AF0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_215BB2B00(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_215BB2B3C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_215BB2B70()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_215BB2B9C(uint64_t a1)
{
  uint64_t v1;

  return sub_215BAE908(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_215BB2BA4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + qword_253D74FE8);
  return swift_bridgeObjectRetain();
}

uint64_t sub_215BB2BCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_215BB2C10()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_215BB2C3C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + qword_253D74FE8) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_215BB2C70()
{
  return swift_deallocObject();
}

uint64_t sub_215BB2C80(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_215BB2CA4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_215BB2CC4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for AudioBufferList(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9AE8);
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_215BB2D18(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_215BB2D38(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for AudioTimeStamp(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9AF0);
}

void type metadata accessor for AudioUnitRenderActionFlags(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9AF8);
}

void type metadata accessor for AudioTimeStampFlags(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9B00);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for SMPTETime(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9B08);
}

uint64_t sub_215BB2DD8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_215BB2DF8(uint64_t result, int a2, int a3)
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

void type metadata accessor for AudioBuffer(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9B10);
}

void type metadata accessor for SMPTETimeFlags(uint64_t a1)
{
  sub_215BB2E5C(a1, &qword_254DF9B18);
}

void type metadata accessor for SMPTETimeType(uint64_t a1)
{
  sub_215BB2E5C(a1, (unint64_t *)&unk_254DF9B20);
}

void sub_215BB2E5C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void __getAXSpringBoardServerClass_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = abort_report_np();
  -[TTSSiriSynthWrapper initWithVoicePath:language:censorPlainText:delegate:].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_215BB3064()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_215BB3070()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_215BB307C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_215BB3088()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_215BB3094()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_215BB30A0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_215BB30AC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_215BB30B8()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_215BB30C4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_215BB30D0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_215BB30DC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_215BB30E8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_215BB30F4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_215BB3100()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_215BB310C()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_215BB3118()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_215BB3124()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_215BB3130()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_215BB313C()
{
  return MEMORY[0x24BEB5CD8]();
}

uint64_t sub_215BB3148()
{
  return MEMORY[0x24BEB5CE0]();
}

uint64_t sub_215BB3154()
{
  return MEMORY[0x24BEB5CE8]();
}

uint64_t sub_215BB3160()
{
  return MEMORY[0x24BEB5CF0]();
}

uint64_t sub_215BB316C()
{
  return MEMORY[0x24BEB5D88]();
}

uint64_t sub_215BB3178()
{
  return MEMORY[0x24BEB5D90]();
}

uint64_t sub_215BB3184()
{
  return MEMORY[0x24BEB5D98]();
}

uint64_t sub_215BB3190()
{
  return MEMORY[0x24BEB5E80]();
}

uint64_t sub_215BB319C()
{
  return MEMORY[0x24BEB60A8]();
}

uint64_t sub_215BB31A8()
{
  return MEMORY[0x24BEB60B0]();
}

uint64_t sub_215BB31B4()
{
  return MEMORY[0x24BEB60B8]();
}

uint64_t sub_215BB31C0()
{
  return MEMORY[0x24BEB60D8]();
}

uint64_t sub_215BB31CC()
{
  return MEMORY[0x24BEB60E0]();
}

uint64_t sub_215BB31D8()
{
  return MEMORY[0x24BEB6190]();
}

uint64_t sub_215BB31E4()
{
  return MEMORY[0x24BEB6198]();
}

uint64_t sub_215BB31F0()
{
  return MEMORY[0x24BEB61A0]();
}

uint64_t sub_215BB31FC()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_215BB3208()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_215BB3214()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_215BB3220()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_215BB322C()
{
  return MEMORY[0x24BEB63A8]();
}

uint64_t sub_215BB3238()
{
  return MEMORY[0x24BEB63B0]();
}

uint64_t sub_215BB3244()
{
  return MEMORY[0x24BEB63B8]();
}

uint64_t sub_215BB3250()
{
  return MEMORY[0x24BEB63F8]();
}

uint64_t sub_215BB325C()
{
  return MEMORY[0x24BEB64D0]();
}

uint64_t sub_215BB3268()
{
  return MEMORY[0x24BEB6540]();
}

uint64_t sub_215BB3274()
{
  return MEMORY[0x24BEB6598]();
}

uint64_t sub_215BB3280()
{
  return MEMORY[0x24BEB65A8]();
}

uint64_t sub_215BB328C()
{
  return MEMORY[0x24BEB6710]();
}

uint64_t sub_215BB3298()
{
  return MEMORY[0x24BEB6730]();
}

uint64_t sub_215BB32A4()
{
  return MEMORY[0x24BEB6738]();
}

uint64_t sub_215BB32B0()
{
  return MEMORY[0x24BEB6750]();
}

uint64_t sub_215BB32BC()
{
  return MEMORY[0x24BEB6928]();
}

uint64_t sub_215BB32C8()
{
  return MEMORY[0x24BEB6938]();
}

uint64_t sub_215BB32D4()
{
  return MEMORY[0x24BEB6978]();
}

uint64_t sub_215BB32E0()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_215BB32EC()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_215BB32F8()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_215BB3304()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_215BB3310()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_215BB331C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_215BB3328()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_215BB3334()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_215BB3340()
{
  return MEMORY[0x24BEE5068]();
}

uint64_t sub_215BB334C()
{
  return MEMORY[0x24BEE5070]();
}

uint64_t sub_215BB3358()
{
  return MEMORY[0x24BEE5078]();
}

uint64_t sub_215BB3364()
{
  return MEMORY[0x24BEE5080]();
}

uint64_t sub_215BB3370()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_215BB337C()
{
  return MEMORY[0x24BEE75E8]();
}

uint64_t sub_215BB3388()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_215BB3394()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_215BB33A0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_215BB33AC()
{
  return MEMORY[0x24BDCFA88]();
}

uint64_t sub_215BB33B8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_215BB33C4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_215BB33D0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_215BB33DC()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_215BB33E8()
{
  return MEMORY[0x24BEE0B38]();
}

uint64_t sub_215BB33F4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_215BB3400()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_215BB340C()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_215BB3418()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_215BB3424()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_215BB3430()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_215BB343C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_215BB3448()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_215BB3454()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_215BB3460()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_215BB346C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_215BB3478()
{
  return MEMORY[0x24BEE0CA8]();
}

uint64_t sub_215BB3484()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_215BB3490()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_215BB349C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_215BB34A8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_215BB34B4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_215BB34C0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_215BB34CC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_215BB34D8()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_215BB34E4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_215BB34F0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_215BB34FC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_215BB3508()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_215BB3514()
{
  return MEMORY[0x24BEB6200]();
}

uint64_t sub_215BB3520()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_215BB352C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_215BB3538()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_215BB3544()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_215BB3550()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_215BB355C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_215BB3568()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_215BB3574()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_215BB3580()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_215BB358C()
{
  return MEMORY[0x24BEE1E68]();
}

uint64_t sub_215BB3598()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_215BB35A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_215BB35B0()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_215BB35BC()
{
  return MEMORY[0x24BDD0630]();
}

uint64_t sub_215BB35C8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_215BB35D4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_215BB35E0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_215BB35EC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_215BB35F8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_215BB3604()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_215BB3610()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_215BB361C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_215BB3628()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_215BB3634()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_215BB3640()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_215BB364C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_215BB3658()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_215BB3664()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_215BB3670()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_215BB367C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_215BB3688()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_215BB3694()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_215BB36A0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_215BB36AC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_215BB36B8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_215BB36C4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_215BB36D0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_215BB36DC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_215BB36E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_215BB36F4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_215BB3700()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x24BDFE3C0]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x24BEB3758]();
}

uint64_t TTSIsBaseSystem()
{
  return MEMORY[0x24BEB62A0]();
}

uint64_t TTSVBHasDeviceBeenUnlockedSinceBoot()
{
  return MEMORY[0x24BEB6B80]();
}

uint64_t _AXSSpeechSynthesisOptions()
{
  return MEMORY[0x24BED2538]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t TTSSynthesizer::initialize()
{
  return MEMORY[0x24BEA7890]();
}

uint64_t TTSSynthesizer::stop_synthesis(TTSSynthesizer *this)
{
  return MEMORY[0x24BEA78A8](this);
}

uint64_t TTSSynthesizer::unload_resource()
{
  return MEMORY[0x24BEA78B8]();
}

uint64_t TTSSynthesizer::set_neural_style()
{
  return MEMORY[0x24BEA78C0]();
}

uint64_t TTSSynthesizer::load_voice_resource()
{
  return MEMORY[0x24BEA78C8]();
}

uint64_t TTSSynthesizer::set_censor_plaintext(TTSSynthesizer *this)
{
  return MEMORY[0x24BEA78D0](this);
}

uint64_t TTSSynthesizer::available_neural_styles(TTSSynthesizer *this)
{
  return MEMORY[0x24BEA78E0](this);
}

uint64_t TTSSynthesizer::synthesize_text_with_markers_async()
{
  return MEMORY[0x24BEA78E8]();
}

void TTSSynthesizer::TTSSynthesizer(TTSSynthesizer *this)
{
  MEMORY[0x24BEA7900](this);
}

void TTSSynthesizer::~TTSSynthesizer(TTSSynthesizer *this)
{
  MEMORY[0x24BEA7910](this);
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return (const char *)MEMORY[0x24BEDA970](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  MEMORY[0x24BEDAAC0](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D44BCA8(__p);
}

uint64_t operator delete()
{
  return off_24D44BCB0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D44BCB8(__sz);
}

uint64_t operator new()
{
  return off_24D44BCC0();
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x24BEDB938](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

