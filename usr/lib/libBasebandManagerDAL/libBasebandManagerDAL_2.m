void sub_24B927F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  void *v13;
  uint64_t v14;

  operator delete(v13);
  std::ostringstream::~ostringstream((uint64_t)&a13);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v14 - 168);
  _Unwind_Resume(a1);
}

void sub_24B927F90(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::ostream::~ostream();
  MEMORY[0x24BD29B5C](v1);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v2 - 168);
  _Unwind_Resume(a1);
}

void sub_24B927FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v5 - 168);
  _Unwind_Resume(a1);
}

void util::GuaranteedCallback::run(uint64_t a1, int a2, uint64_t a3)
{
  dispatch_once_t *v3;
  _QWORD block[5];
  std::string __p;
  int v6;

  v3 = (dispatch_once_t *)(a1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4util18GuaranteedCallback3runEiNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_3_3;
  block[4] = a1;
  v6 = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
    if (*v3 == -1)
    {
LABEL_3:
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return;
LABEL_7:
      operator delete(__p.__r_.__value_.__l.__data_);
      return;
    }
  }
  else
  {
    __p = *(std::string *)a3;
    if (*v3 == -1)
      goto LABEL_3;
  }
  dispatch_once(v3, block);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_7;
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN4util18GuaranteedCallbackEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN4util18GuaranteedCallbackEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN4util18GuaranteedCallback3runEiNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  std::string v9;
  _QWORD block[4];
  void *aBlock;
  std::string __p;
  int v13;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 64);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(const void **)(v1 + 16);
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v9 = *(std::string *)(a1 + 40);
    v3 = *(const void **)(v1 + 16);
    if (v3)
    {
LABEL_3:
      v4 = _Block_copy(v3);
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFviNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEclIJiS7_EEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_5_7;
  if (v4)
  {
    aBlock = _Block_copy(v4);
    v13 = v2;
    if ((SHIBYTE(v9.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_8:
      __p = v9;
      goto LABEL_11;
    }
  }
  else
  {
    aBlock = 0;
    v13 = v2;
    if ((SHIBYTE(v9.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_8;
  }
  std::string::__init_copy_ctor_external(&__p, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
LABEL_11:
  dispatch_async(v5, block);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    v6 = aBlock;
    if (!aBlock)
      goto LABEL_16;
    goto LABEL_15;
  }
  v6 = aBlock;
  if (aBlock)
LABEL_15:
    _Block_release(v6);
LABEL_16:
  if (v4)
    _Block_release(v4);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v9.__r_.__value_.__l.__data_);
    v7 = *(const void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;
    if (!v7)
      goto LABEL_23;
    goto LABEL_22;
  }
  v7 = *(const void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;
  if (v7)
LABEL_22:
    _Block_release(v7);
LABEL_23:
  v8 = *(NSObject **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;
  if (v8)
    dispatch_release(v8);
}

void sub_24B928260(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *aBlock)
{
  const void *v19;

  if (aBlock)
    _Block_release(aBlock);
  if (v19)
    _Block_release(v19);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper,std::allocator<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CBF860;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper,std::allocator<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CBF860;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper,std::allocator<util::GuaranteedCallback::create(dispatch::block<void({block_pointer})(int,std::string)>,dispatch::queue,std::chrono::duration<long long,std::ratio<1l,1000l>>)::wrapper>>::__on_zero_shared(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;
  std::__shared_weak_count *v5;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  v2 = *(NSObject **)(a1 + 64);
  if (v2)
    dispatch_release(v2);
  v3 = *(NSObject **)(a1 + 48);
  if (v3)
    dispatch_release(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    _Block_release(v4);
  v5 = *(std::__shared_weak_count **)(a1 + 32);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

void ___ZNK8dispatch8callbackIU13block_pointerFviNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEclIJiS7_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::string __p;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 64);
  if (*(char *)(a1 + 63) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    __p = *(std::string *)(a1 + 40);
  (*(void (**)(uint64_t, uint64_t, std::string *))(v1 + 16))(v1, v2, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B9283CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *support::log::delegate::context::create@<X0>(support::log::delegate::context *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v5;
  _QWORD *result;

  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  v5 = operator new(0x10uLL);
  *v5 = off_251CBF8E0;
  v5[1] = this;
  *a2 = v5;
  result = operator new(0x20uLL);
  *result = off_251CBFB38;
  result[1] = 0;
  result[2] = 0;
  result[3] = v5;
  a2[1] = result;
  return result;
}

void sub_24B928450(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *support::log::delegate::context::context(_QWORD *this, void *a2)
{
  *this = off_251CBF8E0;
  this[1] = a2;
  return this;
}

{
  *this = off_251CBF8E0;
  this[1] = a2;
  return this;
}

uint64_t support::log::delegate::delegate(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *(_QWORD *)result = &unk_251CBF900;
  *(_QWORD *)(result + 8) = v3;
  *(_QWORD *)(result + 16) = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_BYTE *)(result + 24) = 1;
  return result;
}

uint64_t support::log::delegate::get_context@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_BYTE *)a2 = 0;
  *(_BYTE *)(a2 + 16) = 0;
  if (*(_BYTE *)(this + 24))
  {
    v2 = *(_QWORD *)(this + 16);
    *(_QWORD *)a2 = *(_QWORD *)(this + 8);
    *(_QWORD *)(a2 + 8) = v2;
    if (v2)
    {
      v3 = (unint64_t *)(v2 + 16);
      do
        v4 = __ldxr(v3);
      while (__stxr(v4 + 1, v3));
    }
    *(_BYTE *)(a2 + 16) = 1;
  }
  return this;
}

uint64_t support::log::manager::parameters::parameters(uint64_t result, char a2)
{
  *(_QWORD *)result = &off_251CBF930;
  *(_BYTE *)(result + 8) = a2;
  return result;
}

{
  *(_QWORD *)result = &off_251CBF930;
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t support::log::manager::parameters::parameters(uint64_t this)
{
  *(_QWORD *)this = &off_251CBF930;
  *(_BYTE *)(this + 8) = 3;
  return this;
}

{
  *(_QWORD *)this = &off_251CBF930;
  *(_BYTE *)(this + 8) = 3;
  return this;
}

uint64_t support::log::manager::parameters::set_defaults(uint64_t this)
{
  *(_BYTE *)(this + 8) = 3;
  return this;
}

uint64_t support::log::manager::manager(uint64_t a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  std::string *v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::string::value_type __s[23];
  char v17;
  std::string v18;

  *(_QWORD *)a1 = off_251CBF948;
  *(_QWORD *)(a1 + 8) = 850045863;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  v18 = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  v17 = 12;
  strcpy(__s, ".log_manager");
  v7 = std::string::append(&v18, __s, 0xCuLL);
  v8 = (const char *)(a1 + 72);
  v9 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)&v7->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 72) = v9;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  if ((v17 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_8:
    operator delete(v18.__r_.__value_.__l.__data_);
    if ((*(char *)(a1 + 95) & 0x80000000) == 0)
      goto LABEL_4;
    goto LABEL_9;
  }
  operator delete(*(void **)__s);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_8;
LABEL_3:
  if ((*(char *)(a1 + 95) & 0x80000000) == 0)
    goto LABEL_4;
LABEL_9:
  v8 = *(const char **)v8;
LABEL_4:
  *(_QWORD *)(a1 + 96) = os_log_create("com.apple.telephony.basebandservices", v8);
  *(_QWORD *)(a1 + 104) = &off_251CBF930;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a3 + 8);
  *(_QWORD *)(a1 + 120) = a1 + 120;
  *(_QWORD *)(a1 + 128) = a1 + 120;
  *(_QWORD *)(a1 + 136) = 0;
  v10 = a4[2];
  if (v10)
  {
    v12 = *a4;
    v11 = (uint64_t *)a4[1];
    v13 = *v11;
    *(_QWORD *)(v13 + 8) = *(_QWORD *)(*a4 + 8);
    **(_QWORD **)(v12 + 8) = v13;
    v14 = *(_QWORD *)(a1 + 120);
    *(_QWORD *)(v14 + 8) = v11;
    *v11 = v14;
    *(_QWORD *)(a1 + 120) = v12;
    *(_QWORD *)(v12 + 8) = a1 + 120;
    *(_QWORD *)(a1 + 136) = v10;
    a4[2] = 0;
  }
  return a1;
}

void sub_24B9286D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::mutex *v21;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      std::mutex::~mutex(v21);
      _Unwind_Resume(a1);
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  std::mutex::~mutex(v21);
  _Unwind_Resume(a1);
}

uint64_t support::log::manager::manager(uint64_t a1, std::string *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::string __p;

  __p = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  v15 = (uint64_t)&v15;
  v16 = &v15;
  v17 = 0;
  support::log::manager::manager(a1, &__p, a3, &v15);
  if (v17)
  {
    v6 = v15;
    v7 = v16;
    v8 = *v16;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v15 + 8);
    **(_QWORD **)(v6 + 8) = v8;
    v17 = 0;
    if (v7 != &v15)
    {
      do
      {
        v10 = (uint64_t *)v7[1];
        v9 = v7[2];
        v7[2] = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
        operator delete(v7);
        v7 = v10;
      }
      while (v10 != &v15);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*a4)
      return a1;
    goto LABEL_10;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (*a4)
  {
LABEL_10:
    std::mutex::lock((std::mutex *)(a1 + 8));
    v11 = operator new(0x18uLL);
    v12 = *a4;
    *a4 = 0;
    v13 = *(_QWORD *)(a1 + 120);
    v11[1] = a1 + 120;
    v11[2] = v12;
    *v11 = v13;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 120) = v11;
    ++*(_QWORD *)(a1 + 136);
    std::mutex::unlock((std::mutex *)(a1 + 8));
  }
  return a1;
}

{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::string __p;

  __p = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  v15 = (uint64_t)&v15;
  v16 = &v15;
  v17 = 0;
  support::log::manager::manager(a1, &__p, a3, &v15);
  if (v17)
  {
    v6 = v15;
    v7 = v16;
    v8 = *v16;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v15 + 8);
    **(_QWORD **)(v6 + 8) = v8;
    v17 = 0;
    if (v7 != &v15)
    {
      do
      {
        v10 = (uint64_t *)v7[1];
        v9 = v7[2];
        v7[2] = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
        operator delete(v7);
        v7 = v10;
      }
      while (v10 != &v15);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*a4)
      return a1;
    goto LABEL_10;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (*a4)
  {
LABEL_10:
    std::mutex::lock((std::mutex *)(a1 + 8));
    v11 = operator new(0x18uLL);
    v12 = *a4;
    *a4 = 0;
    v13 = *(_QWORD *)(a1 + 120);
    v11[1] = a1 + 120;
    v11[2] = v12;
    *v11 = v13;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 120) = v11;
    ++*(_QWORD *)(a1 + 136);
    std::mutex::unlock((std::mutex *)(a1 + 8));
  }
  return a1;
}

void sub_24B928860(_Unwind_Exception *a1)
{
  support::log::manager *v1;
  std::mutex *v2;

  std::mutex::unlock(v2);
  support::log::manager::~manager(v1);
  _Unwind_Resume(a1);
}

void sub_24B928884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  std::list<std::unique_ptr<support::log::delegate>>::~list(&a10);
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t *std::list<std::unique_ptr<support::log::delegate>>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v7 = (uint64_t *)v3[1];
        v6 = v3[2];
        v3[2] = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v3);
        v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

void support::log::manager::add_delegate(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  std::mutex *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (_QWORD *)a1;
  v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  v5 = operator new(0x18uLL);
  v6 = *a2;
  *a2 = 0;
  v7 = v3[15];
  v3 += 15;
  v5[1] = v3;
  v5[2] = v6;
  *v5 = v7;
  *(_QWORD *)(v7 + 8) = v5;
  *v3 = v5;
  ++v3[2];
  std::mutex::unlock(v4);
}

void sub_24B928994(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void support::log::manager::~manager(support::log::manager *this)
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(_QWORD *)this = off_251CBF948;
  if (*((_QWORD *)this + 17))
  {
    v2 = (char *)this + 120;
    v3 = *((_QWORD *)this + 15);
    v4 = (char *)*((_QWORD *)this + 16);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v4 + 1);
        v6 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v4);
        v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(_QWORD *)this = off_251CBF948;
  if (*((_QWORD *)this + 17))
  {
    v2 = (char *)this + 120;
    v3 = *((_QWORD *)this + 15);
    v4 = (char *)*((_QWORD *)this + 16);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v4 + 1);
        v6 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v4);
        v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(_QWORD *)this = off_251CBF948;
  if (*((_QWORD *)this + 17))
  {
    v2 = (char *)this + 120;
    v3 = *((_QWORD *)this + 15);
    v4 = (char *)*((_QWORD *)this + 16);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v4 + 1);
        v6 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v4);
        v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
  operator delete(this);
}

void sub_24B928B8C(_Unwind_Exception *a1)
{
  support::log::manager *v1;
  std::mutex *v2;

  std::mutex::unlock(v2);
  support::log::manager::~manager(v1);
  _Unwind_Resume(a1);
}

void sub_24B928BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  std::list<std::unique_ptr<support::log::delegate>>::~list(&a10);
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void support::log::manager::create(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v8;
  _QWORD *v9;
  std::string __p;

  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = operator new(0x90uLL);
  __p = *a1;
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  support::log::manager::manager((uint64_t)v8, &__p, a2, a3);
  *a4 = v8;
  v9 = operator new(0x20uLL);
  *v9 = off_251CBFC20;
  v9[1] = 0;
  v9[2] = 0;
  v9[3] = v8;
  a4[1] = v9;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B928D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void support::log::manager::create(std::string *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v8;
  _QWORD *v9;
  std::string __p;

  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = operator new(0x90uLL);
  __p = *a1;
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  support::log::manager::manager((uint64_t)v8, &__p, a2, a3);
  *a4 = v8;
  v9 = operator new(0x20uLL);
  *v9 = off_251CBFC20;
  v9[1] = 0;
  v9[2] = 0;
  v9[3] = v8;
  a4[1] = v9;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B928E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t support::log::manager::get_level(support::log::manager *this)
{
  return *((unsigned __int8 *)this + 112);
}

void support::log::manager::set_level(uint64_t a1, unsigned int a2)
{
  std::mutex *v4;
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  v5 = *(NSObject **)(a1 + 96);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 112);
    if (v6 > 6)
    {
      v7 = "???";
      if (a2 > 6)
        goto LABEL_4;
    }
    else
    {
      if (a2 > 6)
      {
LABEL_4:
        v8 = "???";
LABEL_7:
        v9 = 136315394;
        v10 = v7;
        v11 = 2080;
        v12 = v8;
        _os_log_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEFAULT, "setting log level %s -> %s", (uint8_t *)&v9, 0x16u);
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
LABEL_8:
  *(_BYTE *)(a1 + 112) = a2;
  std::mutex::unlock(v4);
}

uint64_t support::log::manager::get_log_buffer(support::log::manager *this)
{
  char *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void **v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t **v16;
  uint64_t **v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;

  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (qword_2579B8988)
    goto LABEL_2;
  v1 = (char *)operator new(0xA8uLL);
  *((_QWORD *)v1 + 1) = 0;
  *((_QWORD *)v1 + 2) = 0;
  *(_QWORD *)v1 = off_251CBFB88;
  *((_QWORD *)v1 + 3) = off_251CBFBD8;
  v2 = (uint64_t)(v1 + 24);
  *((_QWORD *)v1 + 4) = 850045863;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *((_QWORD *)v1 + 14) = 0;
  *((_QWORD *)v1 + 13) = 0;
  *((_QWORD *)v1 + 11) = 0;
  *((_QWORD *)v1 + 12) = v1 + 104;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  v3 = (std::__shared_weak_count *)off_2579B8990;
  qword_2579B8988 = (uint64_t)(v1 + 24);
  off_2579B8990 = v1;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
LABEL_2:
    v2 = qword_2579B8988;
    v1 = (char *)off_2579B8990;
    if (!off_2579B8990)
      goto LABEL_11;
  }
  v6 = (unint64_t *)(v1 + 8);
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
LABEL_11:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  std::mutex::lock((std::mutex *)(v2 + 8));
  v8 = *(_QWORD *)(v2 + 136);
  if (v8)
  {
    v9 = (_QWORD *)(v2 + 128);
    v10 = *(void ***)(v2 + 104);
    v11 = (*(_QWORD **)((char *)v10 + ((*(_QWORD *)(v2 + 128) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(_QWORD *)(v2 + 128) & 0x1FFLL];
    v12 = *(_QWORD *)(v2 + 128) + 1;
    *(_QWORD *)(v2 + 128) = v12;
    *(_QWORD *)(v2 + 136) = v8 - 1;
    if (v12 >= 0x400)
    {
      operator delete(*v10);
      *(_QWORD *)(v2 + 104) += 8;
      v13 = -512;
LABEL_25:
      *v9 += v13;
    }
  }
  else
  {
    v14 = malloc_type_malloc(0x400uLL, 0x45F1E4C6uLL);
    v11 = (uint64_t)v14;
    if (v14)
    {
      v16 = (uint64_t **)(v2 + 80);
      v15 = *(uint64_t **)(v2 + 80);
      if (!v15)
      {
        v17 = (uint64_t **)(v2 + 80);
LABEL_22:
        v19 = (uint64_t *)operator new(0x28uLL);
        v19[4] = v11;
        *v19 = 0;
        v19[1] = 0;
        v19[2] = (uint64_t)v17;
        *v16 = v19;
        v20 = **(_QWORD **)(v2 + 72);
        if (v20)
        {
          *(_QWORD *)(v2 + 72) = v20;
          v19 = *v16;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 80), v19);
        v9 = (_QWORD *)(v2 + 88);
        v13 = 1;
        goto LABEL_25;
      }
      while (1)
      {
        while (1)
        {
          v17 = (uint64_t **)v15;
          v18 = v15[4];
          if ((unint64_t)v14 >= v18)
            break;
          v15 = *v17;
          v16 = v17;
          if (!*v17)
            goto LABEL_22;
        }
        if (v18 >= (unint64_t)v14)
          break;
        v15 = v17[1];
        if (!v15)
        {
          v16 = v17 + 1;
          goto LABEL_22;
        }
      }
    }
  }
  std::mutex::unlock((std::mutex *)(v2 + 8));
  if (!v1)
    return v11;
  v21 = (unint64_t *)(v1 + 8);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v22)
    return v11;
  (*(void (**)(char *))(*(_QWORD *)v1 + 16))(v1);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v1);
  return v11;
}

void sub_24B92922C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  _Unwind_Resume(a1);
}

void support::log::manager::release_log_buffer(support::log::manager *this, char *a2)
{
  char *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD *v16;
  unint64_t *v17;
  unint64_t v18;
  char *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::mutex *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  BOOL v36;
  _QWORD *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  int64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  char *v61;
  void *v62;
  char *v63;
  char *v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  BOOL v69;
  int64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  unint64_t v74;
  char *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _OWORD *v81;
  unint64_t v82;
  char *v83;
  char *v84;
  unint64_t v85;
  int64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 *v93;
  char *v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  unint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  __int128 *v107;
  _OWORD *v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  size_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  __int128 *v126;
  _OWORD *v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  unint64_t *v131;
  unint64_t v132;
  std::__shared_weak_count *v133;
  unint64_t *v134;
  unint64_t v135;
  unint64_t v136;
  char *v137;
  char *v138;
  int64_t v139;
  unint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  __int128 *v146;
  _OWORD *v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  std::runtime_error *exception;
  void *v152;
  std::__shared_weak_count *v153;
  std::__shared_weak_count *v154;

  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (!qword_2579B8988)
  {
    v3 = (char *)operator new(0xA8uLL);
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    *(_QWORD *)v3 = off_251CBFB88;
    *((_QWORD *)v3 + 3) = off_251CBFBD8;
    v4 = (uint64_t)(v3 + 24);
    *((_QWORD *)v3 + 4) = 850045863;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 72) = 0u;
    *((_QWORD *)v3 + 14) = 0;
    *((_QWORD *)v3 + 13) = 0;
    *((_QWORD *)v3 + 11) = 0;
    *((_QWORD *)v3 + 12) = v3 + 104;
    *(_OWORD *)(v3 + 120) = 0u;
    *(_OWORD *)(v3 + 136) = 0u;
    *(_OWORD *)(v3 + 152) = 0u;
    v5 = (std::__shared_weak_count *)off_2579B8990;
    qword_2579B8988 = (uint64_t)(v3 + 24);
    off_2579B8990 = v3;
    if (!v5)
    {
LABEL_9:
      v8 = (unint64_t *)(v3 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
      goto LABEL_11;
    }
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v4 = qword_2579B8988;
  v3 = (char *)off_2579B8990;
  if (off_2579B8990)
    goto LABEL_9;
LABEL_11:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  v12 = *(_QWORD **)(v4 + 80);
  v11 = v4 + 80;
  v10 = v12;
  if (!v12)
    goto LABEL_22;
  v13 = (_QWORD *)v11;
  do
  {
    v14 = v10[4];
    v15 = v14 >= (unint64_t)a2;
    if (v14 >= (unint64_t)a2)
      v16 = v10;
    else
      v16 = v10 + 1;
    if (v15)
      v13 = v10;
    v10 = (_QWORD *)*v16;
  }
  while (*v16);
  if (v13 == (_QWORD *)v11 || v13[4] > (unint64_t)a2)
LABEL_22:
    v13 = (_QWORD *)v11;
  if (!v3)
    goto LABEL_27;
  v17 = (unint64_t *)(v3 + 8);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (v18)
  {
LABEL_27:
    if (v13 != (_QWORD *)v11)
      goto LABEL_28;
LABEL_32:
    free(a2);
    return;
  }
  (*(void (**)(char *))(*(_QWORD *)v3 + 16))(v3);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v3);
  if (v13 == (_QWORD *)v11)
    goto LABEL_32;
LABEL_28:
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (qword_2579B8988)
    goto LABEL_29;
  v19 = (char *)operator new(0xA8uLL);
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = off_251CBFB88;
  *((_QWORD *)v19 + 3) = off_251CBFBD8;
  *((_QWORD *)v19 + 4) = 850045863;
  *(_OWORD *)(v19 + 40) = 0u;
  *(_OWORD *)(v19 + 56) = 0u;
  *(_OWORD *)(v19 + 72) = 0u;
  *((_QWORD *)v19 + 14) = 0;
  *((_QWORD *)v19 + 13) = 0;
  *((_QWORD *)v19 + 11) = 0;
  *((_QWORD *)v19 + 12) = v19 + 104;
  *(_OWORD *)(v19 + 120) = 0u;
  *(_OWORD *)(v19 + 136) = 0u;
  *(_OWORD *)(v19 + 152) = 0u;
  v20 = (std::__shared_weak_count *)off_2579B8990;
  qword_2579B8988 = (uint64_t)(v19 + 24);
  off_2579B8990 = v19;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
LABEL_29:
    v19 = (char *)off_2579B8990;
    v153 = (std::__shared_weak_count *)off_2579B8990;
    if (!off_2579B8990)
      goto LABEL_41;
    goto LABEL_39;
  }
  v153 = (std::__shared_weak_count *)v19;
LABEL_39:
  v23 = (unint64_t *)(v19 + 8);
  do
    v24 = __ldxr(v23);
  while (__stxr(v24 + 1, v23));
LABEL_41:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (!qword_2579B8988)
  {
    v25 = (char *)operator new(0xA8uLL);
    *((_QWORD *)v25 + 1) = 0;
    *((_QWORD *)v25 + 2) = 0;
    *(_QWORD *)v25 = off_251CBFB88;
    *((_QWORD *)v25 + 3) = off_251CBFBD8;
    v26 = (uint64_t)(v25 + 24);
    *((_QWORD *)v25 + 4) = 850045863;
    *(_OWORD *)(v25 + 40) = 0u;
    *(_OWORD *)(v25 + 56) = 0u;
    *(_OWORD *)(v25 + 72) = 0u;
    *((_QWORD *)v25 + 14) = 0;
    *((_QWORD *)v25 + 13) = 0;
    *((_QWORD *)v25 + 11) = 0;
    *((_QWORD *)v25 + 12) = v25 + 104;
    *(_OWORD *)(v25 + 120) = 0u;
    *(_OWORD *)(v25 + 136) = 0u;
    *(_OWORD *)(v25 + 152) = 0u;
    v27 = (std::__shared_weak_count *)off_2579B8990;
    qword_2579B8988 = (uint64_t)(v25 + 24);
    off_2579B8990 = v25;
    if (!v27)
    {
      v154 = (std::__shared_weak_count *)v25;
LABEL_50:
      v30 = (unint64_t *)(v25 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
      goto LABEL_52;
    }
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v26 = qword_2579B8988;
  v25 = (char *)off_2579B8990;
  v154 = (std::__shared_weak_count *)off_2579B8990;
  if (off_2579B8990)
    goto LABEL_50;
LABEL_52:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  v32 = (std::mutex *)(v26 + 8);
  std::mutex::lock((std::mutex *)(v26 + 8));
  v33 = *(_QWORD **)(v26 + 80);
  if (!v33)
    goto LABEL_186;
  v34 = v26 + 80;
  do
  {
    v35 = v33[4];
    v36 = v35 >= (unint64_t)a2;
    if (v35 >= (unint64_t)a2)
      v37 = v33;
    else
      v37 = v33 + 1;
    if (v36)
      v34 = (uint64_t)v33;
    v33 = (_QWORD *)*v37;
  }
  while (*v37);
  if (v34 == v26 + 80 || *(_QWORD *)(v34 + 32) > (unint64_t)a2)
  {
LABEL_186:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "attempting to put back a buffer the instance does not own");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v38 = *(char **)(v26 + 112);
  v39 = *(char **)(v26 + 104);
  v40 = v38 - v39;
  if (v38 == v39)
    v41 = 0;
  else
    v41 = ((v38 - v39) << 6) - 1;
  v43 = *(_QWORD *)(v26 + 128);
  v42 = *(_QWORD *)(v26 + 136);
  v44 = v42 + v43;
  if (v41 == v42 + v43)
  {
    if (v43 >= 0x200)
    {
      *(_QWORD *)(v26 + 128) = v43 - 512;
      v45 = v39 + 8;
      v46 = *(_QWORD *)v39;
      *(_QWORD *)(v26 + 104) = v39 + 8;
      if (v38 != *(char **)(v26 + 120))
      {
LABEL_157:
        *(_QWORD *)v38 = v46;
        goto LABEL_158;
      }
      v47 = *(char **)(v26 + 96);
      if (v45 > v47)
      {
        v48 = (v45 - v47) >> 3;
        if (v48 >= -1)
          v49 = v48 + 1;
        else
          v49 = v48 + 2;
        v50 = v49 >> 1;
        v51 = -v50;
        v52 = &v45[-8 * v50];
        v53 = v38 - v45;
        if (v38 != v45)
        {
          memmove(&v45[-8 * v50], v45, v38 - v45);
          v38 = *(char **)(v26 + 104);
        }
        v54 = &v38[8 * v51];
        v38 = &v52[v53];
        *(_QWORD *)(v26 + 104) = v54;
        *(_QWORD *)(v26 + 112) = &v52[v53];
        goto LABEL_157;
      }
      if (v38 == v47)
        v66 = 1;
      else
        v66 = (v38 - v47) >> 2;
      if (!(v66 >> 61))
      {
        v67 = (char *)operator new(8 * v66);
        v68 = &v67[8 * (v66 >> 2)];
        v70 = v38 - v45;
        v69 = v38 == v45;
        v38 = v68;
        if (v69)
          goto LABEL_155;
        v38 = &v68[v70 & 0xFFFFFFFFFFFFFFF8];
        v71 = v70 - 8;
        if (v71 >= 0x38)
        {
          v123 = &v67[8 * (v66 >> 2)];
          v72 = v123;
          if ((unint64_t)(v123 - v45) >= 0x20)
          {
            v124 = (v71 >> 3) + 1;
            v125 = 8 * (v124 & 0x3FFFFFFFFFFFFFFCLL);
            v72 = &v68[v125];
            v45 += v125;
            v126 = (__int128 *)(v39 + 24);
            v127 = v123 + 16;
            v128 = v124 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v129 = *v126;
              *(v127 - 1) = *(v126 - 1);
              *v127 = v129;
              v126 += 2;
              v127 += 2;
              v128 -= 4;
            }
            while (v128);
            if (v124 == (v124 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_155:
              *(_QWORD *)(v26 + 96) = v67;
              *(_QWORD *)(v26 + 104) = v68;
              *(_QWORD *)(v26 + 112) = v38;
              *(_QWORD *)(v26 + 120) = &v67[8 * v66];
              if (v47)
              {
                operator delete(v47);
                v38 = *(char **)(v26 + 112);
              }
              goto LABEL_157;
            }
          }
        }
        else
        {
          v72 = &v67[8 * (v66 >> 2)];
        }
        do
        {
          v130 = *(_QWORD *)v45;
          v45 += 8;
          *(_QWORD *)v72 = v130;
          v72 += 8;
        }
        while (v72 != v38);
        goto LABEL_155;
      }
LABEL_188:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v55 = v40 >> 3;
    v56 = *(char **)(v26 + 120);
    v57 = *(char **)(v26 + 96);
    if (v40 >> 3 >= (unint64_t)((v56 - v57) >> 3))
    {
      if (v56 == v57)
        v60 = 1;
      else
        v60 = (v56 - v57) >> 2;
      if (!(v60 >> 61))
      {
        v61 = (char *)operator new(8 * v60);
        v62 = operator new(0x1000uLL);
        v63 = &v61[8 * v55];
        v64 = &v61[8 * v60];
        if (v55 == v60)
        {
          v152 = v62;
          if (v40 < 1)
          {
            if (v38 == v39)
              v74 = 1;
            else
              v74 = v40 >> 2;
            if (v74 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v63 = (char *)operator new(8 * v74);
            v64 = &v63[8 * v74];
            operator delete(v61);
            v39 = *(char **)(v26 + 104);
            v38 = *(char **)(v26 + 112);
            v61 = v63;
          }
          else
          {
            v65 = v55 + 2;
            if (v55 >= -1)
              v65 = v55 + 1;
            v63 -= 8 * (v65 >> 1);
          }
          v62 = v152;
        }
        *(_QWORD *)v63 = v62;
        v75 = v63 + 8;
        if (v38 != v39)
        {
          do
          {
            if (v63 == v61)
            {
              if (v75 >= v64)
              {
                if (v64 == v61)
                  v82 = 1;
                else
                  v82 = (v64 - v61) >> 2;
                if (v82 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v83 = (char *)operator new(8 * v82);
                v84 = v83;
                v85 = (v82 + 3) >> 2;
                v63 = &v83[8 * v85];
                v86 = v75 - v61;
                v69 = v75 == v61;
                v75 = v63;
                if (!v69)
                {
                  v75 = &v63[v86 & 0xFFFFFFFFFFFFFFF8];
                  v87 = v86 - 8;
                  v88 = &v83[8 * v85];
                  v89 = v61;
                  if (v87 < 0x38)
                    goto LABEL_192;
                  v90 = 8 * v85;
                  v88 = &v83[8 * v85];
                  v89 = v61;
                  if ((unint64_t)(v88 - v61) < 0x20)
                    goto LABEL_192;
                  v91 = (v87 >> 3) + 1;
                  v92 = 8 * (v91 & 0x3FFFFFFFFFFFFFFCLL);
                  v88 = &v63[v92];
                  v89 = &v61[v92];
                  v93 = (__int128 *)(v61 + 16);
                  v94 = &v83[v90 + 16];
                  v95 = v91 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v96 = *v93;
                    *((_OWORD *)v94 - 1) = *(v93 - 1);
                    *(_OWORD *)v94 = v96;
                    v93 += 2;
                    v94 += 32;
                    v95 -= 4;
                  }
                  while (v95);
                  if (v91 != (v91 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_192:
                    do
                    {
                      v97 = *(_QWORD *)v89;
                      v89 += 8;
                      *(_QWORD *)v88 = v97;
                      v88 += 8;
                    }
                    while (v88 != v75);
                  }
                }
                v64 = &v83[8 * v82];
                operator delete(v61);
                v61 = v84;
              }
              else
              {
                v78 = (v64 - v75) >> 3;
                if (v78 >= -1)
                  v79 = v78 + 1;
                else
                  v79 = v78 + 2;
                v80 = v79 >> 1;
                v63 = &v61[8 * (v79 >> 1)];
                v81 = v61;
                if (v75 != v61)
                {
                  memmove(v63, v61, v75 - v61);
                  v81 = v75;
                }
                v75 = (char *)v81 + 8 * v80;
              }
            }
            v77 = *((_QWORD *)v38 - 1);
            v38 -= 8;
            *((_QWORD *)v63 - 1) = v77;
            v63 -= 8;
          }
          while (v38 != *(char **)(v26 + 104));
        }
        v76 = *(void **)(v26 + 96);
        *(_QWORD *)(v26 + 96) = v61;
        *(_QWORD *)(v26 + 104) = v63;
        *(_QWORD *)(v26 + 112) = v75;
        *(_QWORD *)(v26 + 120) = v64;
        v32 = (std::mutex *)(v26 + 8);
        if (v76)
          operator delete(v76);
        goto LABEL_159;
      }
      goto LABEL_188;
    }
    v58 = operator new(0x1000uLL);
    v59 = v58;
    if (v56 != v38)
    {
      *(_QWORD *)v38 = v58;
LABEL_158:
      *(_QWORD *)(v26 + 112) += 8;
LABEL_159:
      v39 = *(char **)(v26 + 104);
      v42 = *(_QWORD *)(v26 + 136);
      v44 = *(_QWORD *)(v26 + 128) + v42;
      goto LABEL_160;
    }
    if (v39 == v57)
    {
      if (v38 == v39)
        v98 = 1;
      else
        v98 = (v56 - v39) >> 2;
      if (v98 >> 61)
        goto LABEL_188;
      v99 = (char *)operator new(8 * v98);
      v100 = (v98 + 3) >> 2;
      v73 = &v99[8 * v100];
      v101 = v73;
      if (v38 != v39)
      {
        v101 = &v73[8 * v55];
        v102 = &v99[8 * v100];
        v103 = v39;
        if ((unint64_t)(v40 - 8) < 0x38)
          goto LABEL_193;
        v104 = &v99[8 * v100];
        v102 = v104;
        v103 = v39;
        if ((unint64_t)(v104 - v39) < 0x20)
          goto LABEL_193;
        v105 = ((unint64_t)(v40 - 8) >> 3) + 1;
        v106 = 8 * (v105 & 0x3FFFFFFFFFFFFFFCLL);
        v102 = &v73[v106];
        v103 = &v39[v106];
        v107 = (__int128 *)(v39 + 16);
        v108 = v104 + 16;
        v109 = v105 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v110 = *v107;
          *(v108 - 1) = *(v107 - 1);
          *v108 = v110;
          v107 += 2;
          v108 += 2;
          v109 -= 4;
        }
        while (v109);
        if (v105 != (v105 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_193:
          do
          {
            v111 = *(_QWORD *)v103;
            v103 += 8;
            *(_QWORD *)v102 = v111;
            v102 += 8;
          }
          while (v102 != v101);
        }
      }
      *(_QWORD *)(v26 + 96) = v99;
      *(_QWORD *)(v26 + 104) = v73;
      *(_QWORD *)(v26 + 112) = v101;
      *(_QWORD *)(v26 + 120) = &v99[8 * v98];
      if (v39)
      {
        operator delete(v39);
        v73 = *(char **)(v26 + 104);
      }
    }
    else
    {
      v73 = v39;
    }
    *((_QWORD *)v73 - 1) = v59;
    v112 = *(char **)(v26 + 104);
    v113 = *(char **)(v26 + 112);
    *(_QWORD *)(v26 + 104) = v112 - 8;
    v114 = *((_QWORD *)v112 - 1);
    *(_QWORD *)(v26 + 104) = v112;
    if (v113 != *(char **)(v26 + 120))
    {
LABEL_142:
      *(_QWORD *)v113 = v114;
      goto LABEL_158;
    }
    v115 = *(char **)(v26 + 96);
    if (v112 > v115)
    {
      v116 = (v112 - v115) >> 3;
      if (v116 >= -1)
        v117 = v116 + 1;
      else
        v117 = v116 + 2;
      v118 = v117 >> 1;
      v119 = -v118;
      v120 = &v112[-8 * v118];
      v121 = v113 - v112;
      if (v121)
      {
        memmove(&v112[-8 * v118], v112, v121);
        v112 = *(char **)(v26 + 104);
      }
      v122 = &v120[v121];
      *(_QWORD *)(v26 + 104) = &v112[8 * v119];
      *(_QWORD *)(v26 + 112) = v122;
      *(_QWORD *)v122 = v114;
      goto LABEL_158;
    }
    if (v113 == v115)
      v136 = 1;
    else
      v136 = (v113 - v115) >> 2;
    if (v136 >> 61)
      goto LABEL_188;
    v137 = (char *)operator new(8 * v136);
    v138 = &v137[8 * (v136 >> 2)];
    v139 = v113 - v112;
    v69 = v113 == v112;
    v113 = v138;
    if (!v69)
    {
      v113 = &v138[v139 & 0xFFFFFFFFFFFFFFF8];
      v140 = v139 - 8;
      if (v140 < 0x38)
      {
        v141 = &v137[8 * (v136 >> 2)];
        do
        {
LABEL_183:
          v150 = *(_QWORD *)v112;
          v112 += 8;
          *(_QWORD *)v141 = v150;
          v141 += 8;
        }
        while (v141 != v113);
        goto LABEL_184;
      }
      v142 = &v137[8 * (v136 >> 2)];
      v141 = v142;
      if ((unint64_t)(v142 - v112) < 0x20)
        goto LABEL_183;
      v143 = (v140 >> 3) + 1;
      v144 = 8 * (v143 & 0x3FFFFFFFFFFFFFFCLL);
      v141 = &v138[v144];
      v145 = &v112[v144];
      v146 = (__int128 *)(v112 + 16);
      v147 = v142 + 16;
      v148 = v143 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v149 = *v146;
        *(v147 - 1) = *(v146 - 1);
        *v147 = v149;
        v146 += 2;
        v147 += 2;
        v148 -= 4;
      }
      while (v148);
      v112 = v145;
      if (v143 != (v143 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_183;
    }
LABEL_184:
    *(_QWORD *)(v26 + 96) = v137;
    *(_QWORD *)(v26 + 104) = v138;
    *(_QWORD *)(v26 + 112) = v113;
    *(_QWORD *)(v26 + 120) = &v137[8 * v136];
    if (v115)
    {
      operator delete(v115);
      v113 = *(char **)(v26 + 112);
    }
    goto LABEL_142;
  }
LABEL_160:
  *(_QWORD *)(*(_QWORD *)&v39[(v44 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v44 & 0x1FF)) = a2;
  *(_QWORD *)(v26 + 136) = v42 + 1;
  std::mutex::unlock(v32);
  if (!v154)
    goto LABEL_164;
  v131 = (unint64_t *)&v154->__shared_owners_;
  do
    v132 = __ldaxr(v131);
  while (__stlxr(v132 - 1, v131));
  if (!v132)
  {
    ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
    std::__shared_weak_count::__release_weak(v154);
    v133 = v153;
    if (!v153)
      return;
  }
  else
  {
LABEL_164:
    v133 = v153;
    if (!v153)
      return;
  }
  v134 = (unint64_t *)&v133->__shared_owners_;
  do
    v135 = __ldaxr(v134);
  while (__stlxr(v135 - 1, v134));
  if (!v135)
  {
    ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
    std::__shared_weak_count::__release_weak(v133);
  }
}

void sub_24B929DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, std::mutex *a10, char a11, uint64_t a12, char a13)
{
  void *v13;

  operator delete(__p);
  operator delete(v13);
  std::mutex::unlock(a10);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void support::log::manager::add_delegates(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  std::mutex *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a2 + 8);
  if (v2 != a2)
  {
    v5 = (std::mutex *)(a1 + 8);
    v6 = a1 + 120;
    do
    {
      std::mutex::lock(v5);
      v7 = operator new(0x18uLL);
      v8 = *(_QWORD *)(v2 + 16);
      *(_QWORD *)(v2 + 16) = 0;
      v7[1] = v6;
      v7[2] = v8;
      v9 = *(_QWORD *)(a1 + 120);
      *v7 = v9;
      *(_QWORD *)(v9 + 8) = v7;
      *(_QWORD *)(a1 + 120) = v7;
      ++*(_QWORD *)(a1 + 136);
      std::mutex::unlock(v5);
      v2 = *(_QWORD *)(v2 + 8);
    }
    while (v2 != a2);
  }
}

void sub_24B929F2C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void support::log::manager::set_defaults(support::log::manager *this)
{
  std::mutex *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  *((_BYTE *)this + 112) = 3;
  if (*((_QWORD *)this + 17))
  {
    v3 = (char *)this + 120;
    v4 = *((_QWORD *)this + 15);
    v5 = (char *)*((_QWORD *)this + 16);
    v6 = *(_QWORD *)v5;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(v4 + 8);
    **(_QWORD **)(v4 + 8) = v6;
    *((_QWORD *)this + 17) = 0;
    if (v5 != (char *)this + 120)
    {
      do
      {
        v8 = (char *)*((_QWORD *)v5 + 1);
        v7 = *((_QWORD *)v5 + 2);
        *((_QWORD *)v5 + 2) = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
        operator delete(v5);
        v5 = v8;
      }
      while (v8 != v3);
    }
  }
  std::mutex::unlock(v2);
}

void support::log::manager::message_delegates(support::log::manager *a1, uint64_t a2, char *a3)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)((char *)a1 + 120);
  v5 = *((_QWORD *)a1 + 16);
  if ((support::log::manager *)v5 != (support::log::manager *)((char *)a1 + 120))
  {
    do
    {
      a1 = (support::log::manager *)(***(uint64_t (****)(_QWORD, uint64_t, char *))(v5 + 16))(*(_QWORD *)(v5 + 16), a2, a3);
      v5 = *(_QWORD *)(v5 + 8);
    }
    while ((_QWORD *)v5 != v4);
  }
  support::log::manager::release_log_buffer(a1, a3);
}

void support::log::stdout_delegate::create(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  *a2 = 0xAAAAAAAAAAAAAAAALL;
  v4 = operator new(0x20uLL);
  v5 = v4;
  v6 = *a1;
  v7 = (std::__shared_weak_count *)a1[1];
  if (v7)
  {
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
    do
      v10 = __ldxr(p_shared_weak_owners);
    while (__stxr(v10 + 1, p_shared_weak_owners));
    v4[1] = v6;
    v4[2] = v7;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
    *((_BYTE *)v4 + 24) = 1;
    std::__shared_weak_count::__release_weak(v7);
    *v5 = &off_251CBF978;
    std::__shared_weak_count::__release_weak(v7);
    *a2 = v5;
  }
  else
  {
    v4[1] = v6;
    v4[2] = 0;
    *((_BYTE *)v4 + 24) = 1;
    *v4 = &off_251CBF978;
    *a2 = v4;
  }
}

uint64_t support::log::stdout_delegate::stdout_delegate(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    *(_QWORD *)a1 = &unk_251CBF900;
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v3;
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
    *(_BYTE *)(a1 + 24) = 1;
    std::__shared_weak_count::__release_weak(v3);
  }
  else
  {
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  *(_QWORD *)a1 = &off_251CBF978;
  return a1;
}

{
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    *(_QWORD *)a1 = &unk_251CBF900;
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v3;
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
    *(_BYTE *)(a1 + 24) = 1;
    std::__shared_weak_count::__release_weak(v3);
  }
  else
  {
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  *(_QWORD *)a1 = &off_251CBF978;
  return a1;
}

double support::log::stdout_delegate::create@<D0>(_QWORD *a1@<X8>)
{
  _OWORD *v3;
  double result;

  *a1 = 0xAAAAAAAAAAAAAAAALL;
  v3 = operator new(0x20uLL);
  result = 0.0;
  *v3 = 0u;
  v3[1] = 0u;
  *(_QWORD *)v3 = &off_251CBF978;
  *a1 = v3;
  return result;
}

void support::log::stdout_delegate::message(uint64_t a1, uint64_t a2, const char *a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  _QWORD v8[3];

  if (a3)
  {
    memset(v8, 170, sizeof(v8));
    (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)a1 + 24))(v8);
    if (LOBYTE(v8[2]))
    {
      if (!v8[1])
        return;
      v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)v8[1]);
      if (v4)
      {
        v5 = v4;
        if (v8[0])
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s\n", a3);
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldaxr(p_shared_owners);
        while (__stlxr(v7 - 1, p_shared_owners));
        if (!v7)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s\n", a3);
    }
    if (LOBYTE(v8[2]))
    {
      if (v8[1])
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8[1]);
    }
  }
}

support::log::manager_global *support::log::manager_global::manager_global(support::log::manager_global *this)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (**v11)(support::log::manager::parameters *__hidden);
  char v12;
  std::string __p;

  *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
  strcpy((char *)&__p, "global");
  v10 = 0;
  v11 = &off_251CBF930;
  v12 = 3;
  v8 = (uint64_t)&v8;
  v9 = &v8;
  support::log::manager::manager((uint64_t)this, &__p, (uint64_t)&v11, &v8);
  if (v10)
  {
    v2 = v8;
    v3 = v9;
    v4 = *v9;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(v8 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    v10 = 0;
    if (v3 != &v8)
    {
      do
      {
        v7 = (uint64_t *)v3[1];
        v6 = v3[2];
        v3[2] = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v3);
        v3 = v7;
      }
      while (v7 != &v8);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_251CBF9A8;
  return this;
}

void sub_24B92A438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  std::list<std::unique_ptr<support::log::delegate>>::~list(&a9);
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *support::log::client::descriptor::descriptor(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t descriptor_instance;

  *a1 = off_251CBF9D8;
  descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance(a2, a3);
  a1[1] = descriptor_instance;
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance + 8;
  a1[4] = descriptor_instance + 32;
  a1[5] = descriptor_instance + 56;
  return a1;
}

{
  uint64_t descriptor_instance;

  *a1 = off_251CBF9D8;
  descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance(a2, a3);
  a1[1] = descriptor_instance;
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance + 8;
  a1[4] = descriptor_instance + 32;
  a1[5] = descriptor_instance + 56;
  return a1;
}

uint64_t support::log::global_client_descriptor_manager::get_descriptor_instance(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4;
  int v5;
  size_t v6;
  unint64_t v7;
  std::string *p_dst;
  uint64_t v9;
  uint64_t v10;
  const std::string::value_type *v11;
  int v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  std::string *v15;
  __int128 v16;
  char *v17;
  const char *v18;
  const char *v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint64_t **v27;
  uint64_t *v28;
  void *v29;
  void **v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  const void **v34;
  void **v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void **v39;
  void **v40;
  char *v41;
  std::string *v42;
  float v43;
  _QWORD *v44;
  _QWORD *v45;
  _BOOL8 v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t prime;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD **v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *i;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint8x8_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void *v71;
  std::string v72;
  std::string v73;
  void *__p[3];
  std::string __dst;

  v4 = atomic_load((unsigned __int8 *)&_MergedGlobals_6);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&_MergedGlobals_6))
  {
    *(_OWORD *)&qword_2579B8C00 = 0u;
    *(_OWORD *)&qword_2579B8BF0 = 0u;
    dword_2579B8C10 = 1065353216;
    __cxa_guard_release(&_MergedGlobals_6);
  }
  std::mutex::lock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
  memset(__p, 170, sizeof(__p));
  v5 = *(char *)(a1 + 23);
  if (v5 >= 0)
    v6 = *(unsigned __int8 *)(a1 + 23);
  else
    v6 = *(_QWORD *)(a1 + 8);
  v7 = v6 + 1;
  memset(&__dst, 170, sizeof(__dst));
  if (v6 + 1 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v7 >= 0x17)
  {
    v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v9 = v7 | 7;
    v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v6 + 1;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = &__dst;
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v6 + 1;
    if (!v6)
      goto LABEL_16;
  }
  if (v5 >= 0)
    v11 = (const std::string::value_type *)a1;
  else
    v11 = *(const std::string::value_type **)a1;
  memmove(p_dst, v11, v6);
LABEL_16:
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v6) = 44;
  v12 = *(char *)(a2 + 23);
  if (v12 >= 0)
    v13 = (const std::string::value_type *)a2;
  else
    v13 = *(const std::string::value_type **)a2;
  if (v12 >= 0)
    v14 = *(unsigned __int8 *)(a2 + 23);
  else
    v14 = *(_QWORD *)(a2 + 8);
  v15 = std::string::append(&__dst, v13, v14);
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  __p[2] = (void *)v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p))
      goto LABEL_156;
  }
  else if (std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p))
  {
    goto LABEL_156;
  }
  v17 = (char *)operator new(0x40uLL);
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v73, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v73 = *(std::string *)a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v72, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v72 = *(std::string *)a2;
  *(_QWORD *)v17 = off_251CBFB08;
  v18 = v17 + 8;
  *(std::string *)(v17 + 8) = v73;
  memset(&v73, 0, sizeof(v73));
  *(std::string *)(v17 + 32) = v72;
  memset(&v72, 0, sizeof(v72));
  if (v17[31] < 0)
  {
    v18 = *(const char **)v18;
    v19 = v17 + 32;
    if ((v17[55] & 0x80000000) == 0)
      goto LABEL_34;
  }
  else
  {
    v19 = v17 + 32;
    if ((v17[55] & 0x80000000) == 0)
      goto LABEL_34;
  }
  v19 = *(const char **)v19;
LABEL_34:
  *((_QWORD *)v17 + 7) = os_log_create(v18, v19);
  if (SHIBYTE(__p[2]) >= 0)
    v20 = (uint64_t *)__p;
  else
    v20 = (uint64_t *)__p[0];
  if (SHIBYTE(__p[2]) >= 0)
    v21 = HIBYTE(__p[2]);
  else
    v21 = (unint64_t)__p[1];
  v22 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&__dst, v20, v21);
  v23 = v22;
  v24 = qword_2579B8BF8;
  if (qword_2579B8BF8)
  {
    v25 = (uint8x8_t)vcnt_s8((int8x8_t)qword_2579B8BF8);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      v26 = v22;
      if (v22 >= qword_2579B8BF8)
        v26 = v22 % qword_2579B8BF8;
    }
    else
    {
      v26 = (qword_2579B8BF8 - 1) & v22;
    }
    v27 = *(uint64_t ***)(qword_2579B8BF0 + 8 * v26);
    if (v27)
    {
      v28 = *v27;
      if (*v27)
      {
        if (SHIBYTE(__p[2]) >= 0)
          v29 = (void *)HIBYTE(__p[2]);
        else
          v29 = __p[1];
        if (SHIBYTE(__p[2]) >= 0)
          v30 = __p;
        else
          v30 = (void **)__p[0];
        if (v25.u32[0] < 2uLL)
        {
          while (1)
          {
            v36 = v28[1];
            if (v36 == v23)
            {
              v37 = *((unsigned __int8 *)v28 + 39);
              if ((v37 & 0x80u) == 0)
                v38 = (void *)*((unsigned __int8 *)v28 + 39);
              else
                v38 = (void *)v28[3];
              if (v38 == v29)
              {
                v39 = (const void **)(v28 + 2);
                if ((v37 & 0x80) != 0)
                {
                  if (!memcmp(*v39, v30, v28[3]))
                    goto LABEL_154;
                }
                else
                {
                  if (!*((_BYTE *)v28 + 39))
                    goto LABEL_154;
                  v40 = v30;
                  while (*(unsigned __int8 *)v39 == *(unsigned __int8 *)v40)
                  {
                    v39 = (const void **)((char *)v39 + 1);
                    v40 = (void **)((char *)v40 + 1);
                    if (!--v37)
                      goto LABEL_154;
                  }
                }
              }
            }
            else if ((v36 & (v24 - 1)) != v26)
            {
              goto LABEL_90;
            }
            v28 = (uint64_t *)*v28;
            if (!v28)
              goto LABEL_90;
          }
        }
        do
        {
          v31 = v28[1];
          if (v31 == v23)
          {
            v32 = *((unsigned __int8 *)v28 + 39);
            if ((v32 & 0x80u) == 0)
              v33 = (void *)*((unsigned __int8 *)v28 + 39);
            else
              v33 = (void *)v28[3];
            if (v33 == v29)
            {
              v34 = (const void **)(v28 + 2);
              if ((v32 & 0x80) != 0)
              {
                if (!memcmp(*v34, v30, v28[3]))
                  goto LABEL_154;
              }
              else
              {
                if (!*((_BYTE *)v28 + 39))
                  goto LABEL_154;
                v35 = v30;
                while (*(unsigned __int8 *)v34 == *(unsigned __int8 *)v35)
                {
                  v34 = (const void **)((char *)v34 + 1);
                  v35 = (void **)((char *)v35 + 1);
                  if (!--v32)
                    goto LABEL_154;
                }
              }
            }
          }
          else
          {
            if (v31 >= v24)
              v31 %= v24;
            if (v31 != v26)
              break;
          }
          v28 = (uint64_t *)*v28;
        }
        while (v28);
      }
    }
  }
  else
  {
    v26 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_90:
  __dst.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAA00;
  v41 = (char *)operator new(0x30uLL);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v41;
  __dst.__r_.__value_.__l.__size_ = (std::string::size_type)&qword_2579B8C00;
  *(_QWORD *)v41 = 0;
  *((_QWORD *)v41 + 1) = v23;
  v42 = (std::string *)(v41 + 16);
  if (SHIBYTE(__p[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v42, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v42->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void **)v41 + 4) = __p[2];
  }
  *((_QWORD *)v41 + 5) = v17;
  __dst.__r_.__value_.__s.__data_[16] = 1;
  v43 = (float)(unint64_t)(qword_2579B8C08 + 1);
  if (!v24 || (float)(*(float *)&dword_2579B8C10 * (float)v24) < v43)
  {
    v46 = 1;
    if (v24 >= 3)
      v46 = (v24 & (v24 - 1)) != 0;
    v47 = v46 | (2 * v24);
    v48 = vcvtps_u32_f32(v43 / *(float *)&dword_2579B8C10);
    if (v47 <= v48)
      prime = v48;
    else
      prime = v47;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v24 = qword_2579B8BF8;
    if (prime > qword_2579B8BF8)
      goto LABEL_107;
    if (prime >= qword_2579B8BF8)
      goto LABEL_140;
    v60 = vcvtps_u32_f32((float)(unint64_t)qword_2579B8C08 / *(float *)&dword_2579B8C10);
    if ((unint64_t)qword_2579B8BF8 < 3
      || (v61 = (uint8x8_t)vcnt_s8((int8x8_t)qword_2579B8BF8), v61.i16[0] = vaddlv_u8(v61), v61.u32[0] > 1uLL))
    {
      v60 = std::__next_prime(v60);
    }
    else
    {
      v62 = 1 << -(char)__clz(v60 - 1);
      if (v60 >= 2)
        v60 = v62;
    }
    if (prime <= v60)
      prime = v60;
    if (prime >= v24)
    {
      v24 = qword_2579B8BF8;
    }
    else
    {
      if (prime)
      {
LABEL_107:
        if (prime >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v50 = operator new(8 * prime);
        v51 = (void *)qword_2579B8BF0;
        qword_2579B8BF0 = (uint64_t)v50;
        if (v51)
          operator delete(v51);
        v52 = 0;
        qword_2579B8BF8 = prime;
        do
          *(_QWORD *)(qword_2579B8BF0 + 8 * v52++) = 0;
        while (prime != v52);
        v53 = (_QWORD **)qword_2579B8C00;
        if (!qword_2579B8C00)
          goto LABEL_139;
        v54 = *(_QWORD *)(qword_2579B8C00 + 8);
        v55 = prime - 1;
        if ((prime & (prime - 1)) == 0)
        {
          v56 = v54 & v55;
          *(_QWORD *)(qword_2579B8BF0 + 8 * v56) = &qword_2579B8C00;
          for (i = *v53; *v53; i = *v53)
          {
            v58 = i[1] & v55;
            if (v58 == v56)
            {
              v53 = (_QWORD **)i;
            }
            else if (*(_QWORD *)(qword_2579B8BF0 + 8 * v58))
            {
              *v53 = (_QWORD *)*i;
              v59 = 8 * v58;
              *i = **(_QWORD **)(qword_2579B8BF0 + v59);
              **(_QWORD **)(qword_2579B8BF0 + v59) = i;
            }
            else
            {
              *(_QWORD *)(qword_2579B8BF0 + 8 * v58) = v53;
              v53 = (_QWORD **)i;
              v56 = v58;
            }
          }
LABEL_139:
          v24 = prime;
          goto LABEL_140;
        }
        if (v54 >= prime)
          v54 %= prime;
        *(_QWORD *)(qword_2579B8BF0 + 8 * v54) = &qword_2579B8C00;
        v63 = *v53;
        if (!*v53)
          goto LABEL_139;
        while (1)
        {
          v65 = v63[1];
          if (v65 >= prime)
            v65 %= prime;
          if (v65 == v54)
            goto LABEL_133;
          if (*(_QWORD *)(qword_2579B8BF0 + 8 * v65))
          {
            *v53 = (_QWORD *)*v63;
            v64 = 8 * v65;
            *v63 = **(_QWORD **)(qword_2579B8BF0 + v64);
            **(_QWORD **)(qword_2579B8BF0 + v64) = v63;
            v63 = v53;
LABEL_133:
            v53 = (_QWORD **)v63;
            v63 = (_QWORD *)*v63;
            if (!v63)
              goto LABEL_139;
          }
          else
          {
            *(_QWORD *)(qword_2579B8BF0 + 8 * v65) = v53;
            v53 = (_QWORD **)v63;
            v63 = (_QWORD *)*v63;
            v54 = v65;
            if (!v63)
              goto LABEL_139;
          }
        }
      }
      v71 = (void *)qword_2579B8BF0;
      qword_2579B8BF0 = 0;
      if (v71)
        operator delete(v71);
      v24 = 0;
      qword_2579B8BF8 = 0;
    }
LABEL_140:
    v66 = v24 - 1;
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v23 >= v24)
      {
        v26 = v23 % v24;
        v44 = *(_QWORD **)(qword_2579B8BF0 + 8 * (v23 % v24));
        v45 = (_QWORD *)__dst.__r_.__value_.__r.__words[0];
        if (v44)
          goto LABEL_96;
      }
      else
      {
        v26 = v23;
        v44 = *(_QWORD **)(qword_2579B8BF0 + 8 * v23);
        v45 = (_QWORD *)__dst.__r_.__value_.__r.__words[0];
        if (v44)
          goto LABEL_96;
      }
    }
    else
    {
      v26 = v66 & v23;
      v44 = *(_QWORD **)(qword_2579B8BF0 + 8 * (v66 & v23));
      v45 = (_QWORD *)__dst.__r_.__value_.__r.__words[0];
      if (v44)
        goto LABEL_96;
    }
LABEL_142:
    *v45 = qword_2579B8C00;
    qword_2579B8C00 = __dst.__r_.__value_.__r.__words[0];
    *(_QWORD *)(qword_2579B8BF0 + 8 * v26) = &qword_2579B8C00;
    if (*(_QWORD *)__dst.__r_.__value_.__l.__data_)
    {
      v67 = *(_QWORD *)(*(_QWORD *)__dst.__r_.__value_.__l.__data_ + 8);
      if ((v24 & (v24 - 1)) != 0)
      {
        if (v67 >= v24)
          v67 %= v24;
      }
      else
      {
        v67 &= v24 - 1;
      }
      *(_QWORD *)(qword_2579B8BF0 + 8 * v67) = __dst.__r_.__value_.__r.__words[0];
    }
    goto LABEL_153;
  }
  v44 = *(_QWORD **)(qword_2579B8BF0 + 8 * v26);
  v45 = (_QWORD *)__dst.__r_.__value_.__r.__words[0];
  if (!v44)
    goto LABEL_142;
LABEL_96:
  *v45 = *v44;
  *v44 = __dst.__r_.__value_.__r.__words[0];
LABEL_153:
  ++qword_2579B8C08;
LABEL_154:
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v72.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v73.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_156:
      v68 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p);
      if (v68)
        goto LABEL_157;
LABEL_162:
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
  }
  else if ((SHIBYTE(v73.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_156;
  }
  operator delete(v73.__r_.__value_.__l.__data_);
  v68 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p);
  if (!v68)
    goto LABEL_162;
LABEL_157:
  v69 = v68[5];
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
  return v69;
}

void sub_24B92AD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)&a29);
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
      goto LABEL_3;
  }
  else if ((a21 & 0x80000000) == 0)
  {
LABEL_3:
    if ((a28 & 0x80000000) == 0)
    {
LABEL_8:
      std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
      _Unwind_Resume(a1);
    }
LABEL_7:
    operator delete(a23);
    std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
    _Unwind_Resume(a1);
  }
  operator delete(a16);
  if ((a28 & 0x80000000) == 0)
    goto LABEL_8;
  goto LABEL_7;
}

BOOL support::log::client::descriptor::operator==(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
}

_QWORD *support::log::client::client(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t descriptor_instance;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  void *__p[2];
  uint64_t v15;
  void *v16[2];
  uint64_t v17;

  *a1 = off_251CBF9F8;
  *(_OWORD *)v16 = *(_OWORD *)a2;
  v17 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)__p = *(_OWORD *)a3;
  v15 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  a1[1] = off_251CBF9D8;
  descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance((uint64_t)v16, (uint64_t)__p);
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance;
  a1[4] = descriptor_instance + 8;
  a1[5] = descriptor_instance + 32;
  a1[6] = descriptor_instance + 56;
  if ((SHIBYTE(v15) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v17) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(v16[0]);
    if (a4)
      goto LABEL_4;
LABEL_7:
    pthread_mutex_lock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
    if (!qword_2579B89E0)
    {
      v7 = operator new(0xA8uLL);
      v7[1] = 0;
      v7[2] = 0;
      *v7 = off_251CBFC70;
      a4 = (uint64_t)(v7 + 3);
      support::log::manager_global::manager_global((support::log::manager_global *)(v7 + 3));
      v8 = (std::__shared_weak_count *)off_2579B89E8;
      qword_2579B89E0 = (uint64_t)(v7 + 3);
      off_2579B89E8 = v7;
      if (!v8)
        goto LABEL_15;
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    a4 = qword_2579B89E0;
    v7 = off_2579B89E8;
    if (!off_2579B89E8)
    {
LABEL_17:
      pthread_mutex_unlock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
      a1[7] = a4;
      a1[8] = v7;
      goto LABEL_18;
    }
LABEL_15:
    v11 = v7 + 1;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    goto LABEL_17;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v17) < 0)
    goto LABEL_6;
LABEL_3:
  if (!a4)
    goto LABEL_7;
LABEL_4:
  a1[7] = 0;
  a1[8] = 0;
LABEL_18:
  a1[9] = a4;
  return a1;
}

void sub_24B92B05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::__shared_weak_count *v21;
  void *v23;

  std::__shared_weak_count::~__shared_weak_count(v21);
  operator delete(v23);
  pthread_mutex_unlock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
  _Unwind_Resume(a1);
}

_QWORD *support::log::client::client(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t descriptor_instance;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v10;
  unint64_t v11;
  void *__p[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;

  *a1 = off_251CBF9F8;
  *(_OWORD *)v14 = *(_OWORD *)a2;
  v15 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)__p = *(_OWORD *)a3;
  v13 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  a1[1] = off_251CBF9D8;
  descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance((uint64_t)v14, (uint64_t)__p);
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance;
  a1[4] = descriptor_instance + 8;
  a1[5] = descriptor_instance + 32;
  a1[6] = descriptor_instance + 56;
  if ((SHIBYTE(v13) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(v14[0]);
    v7 = *a4;
    v8 = a4[1];
    a1[7] = *a4;
    a1[8] = v8;
    if (!v8)
      goto LABEL_4;
    goto LABEL_7;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v15) < 0)
    goto LABEL_6;
LABEL_3:
  v7 = *a4;
  v8 = a4[1];
  a1[7] = *a4;
  a1[8] = v8;
  if (!v8)
  {
LABEL_4:
    a1[9] = v7;
    return a1;
  }
LABEL_7:
  v10 = (unint64_t *)(v8 + 8);
  do
    v11 = __ldxr(v10);
  while (__stxr(v11 + 1, v10));
  a1[9] = a1[7];
  return a1;
}

void sub_24B92B1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

_QWORD *support::log::client::client(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  uint64_t v6;
  void *v7[2];
  uint64_t v8;

  *(_OWORD *)v7 = *(_OWORD *)a2;
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)__p = *(_OWORD *)a3;
  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  support::log::client::client(a1, (uint64_t)v7, (uint64_t)__p, 0);
  if (SHIBYTE(v6) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v8) & 0x80000000) == 0)
      return a1;
  }
  else if ((SHIBYTE(v8) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(v7[0]);
  return a1;
}

{
  void *__p[2];
  uint64_t v6;
  void *v7[2];
  uint64_t v8;

  *(_OWORD *)v7 = *(_OWORD *)a2;
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)__p = *(_OWORD *)a3;
  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  support::log::client::client(a1, (uint64_t)v7, (uint64_t)__p, 0);
  if (SHIBYTE(v6) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v8) & 0x80000000) == 0)
      return a1;
  }
  else if ((SHIBYTE(v8) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(v7[0]);
  return a1;
}

void sub_24B92B2B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

void sub_24B92B390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t support::log::client::get_manager(support::log::client *this)
{
  return *((_QWORD *)this + 9);
}

uint64_t support::log::client::get_descriptor(support::log::client *this)
{
  return (uint64_t)this + 8;
}

void support::log::stdout_delegate::~stdout_delegate(support::log::stdout_delegate *this)
{
  std::__shared_weak_count *v1;

  *(_QWORD *)this = &unk_251CBF900;
  if (*((_BYTE *)this + 24))
  {
    v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v1)
      std::__shared_weak_count::__release_weak(v1);
  }
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &unk_251CBF900;
  if (*((_BYTE *)this + 24))
  {
    v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v2)
      std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(this);
}

BOOL support::log::manager::should_log(uint64_t a1, unsigned int a2, os_log_t oslog)
{
  return *(unsigned __int8 *)(a1 + 112) >= a2 || os_log_type_enabled(oslog, support::log::sOSLogLevel[a2]);
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::buffer>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::manager_global>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void support::log::manager_global::~manager_global(support::log::manager_global *this)
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(_QWORD *)this = off_251CBF948;
  if (*((_QWORD *)this + 17))
  {
    v2 = (char *)this + 120;
    v3 = *((_QWORD *)this + 15);
    v4 = (char *)*((_QWORD *)this + 16);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v4 + 1);
        v6 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v4);
        v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(_QWORD *)this = off_251CBF948;
  if (*((_QWORD *)this + 17))
  {
    v2 = (char *)this + 120;
    v3 = *((_QWORD *)this + 15);
    v4 = (char *)*((_QWORD *)this + 16);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v4 + 1);
        v6 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
        operator delete(v4);
        v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
  operator delete(this);
}

void support::log::client::~client(support::log::client *this)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  *(_QWORD *)this = off_251CBF9F8;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  *(_QWORD *)this = off_251CBF9F8;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    operator delete(this);
  }
  else
  {
LABEL_5:
    operator delete(this);
  }
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(_QWORD *a1)
{
  _BYTE *v1;
  int v2;
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t *result;
  uint64_t **v11;
  uint64_t *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v1 = a1;
  v2 = *((char *)a1 + 23);
  if (v2 >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  if (v2 >= 0)
    v4 = *((unsigned __int8 *)a1 + 23);
  else
    v4 = a1[1];
  v5 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v24, v3, v4);
  v6 = qword_2579B8BF8;
  if (!qword_2579B8BF8)
    return 0;
  v7 = v5;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)qword_2579B8BF8);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = v5;
    if (v5 >= qword_2579B8BF8)
      v9 = v5 % qword_2579B8BF8;
  }
  else
  {
    v9 = (qword_2579B8BF8 - 1) & v5;
  }
  v11 = *(uint64_t ***)(qword_2579B8BF0 + 8 * v9);
  if (v11)
  {
    v12 = *v11;
    if (*v11)
    {
      v13 = v1[23];
      if (v13 >= 0)
        v14 = v1[23];
      else
        v14 = *((_QWORD *)v1 + 1);
      if (v13 < 0)
        v1 = *(_BYTE **)v1;
      if (v8.u32[0] < 2uLL)
      {
        v15 = qword_2579B8BF8 - 1;
        while (1)
        {
          v20 = v12[1];
          if (v20 == v7)
          {
            v21 = *((unsigned __int8 *)v12 + 39);
            if ((v21 & 0x80u) == 0)
              v22 = *((unsigned __int8 *)v12 + 39);
            else
              v22 = v12[3];
            if (v22 == v14)
            {
              if ((v21 & 0x80) != 0)
              {
                if (!memcmp((const void *)v12[2], v1, v12[3]))
                  return v12;
              }
              else
              {
                if (!*((_BYTE *)v12 + 39))
                  return v12;
                v23 = 0;
                while (*((unsigned __int8 *)v12 + v23 + 16) == v1[v23])
                {
                  if (v21 == ++v23)
                    return v12;
                }
              }
            }
          }
          else if ((v20 & v15) != v9)
          {
            return 0;
          }
          result = 0;
          v12 = (uint64_t *)*v12;
          if (!v12)
            return result;
        }
      }
      while (1)
      {
        v16 = v12[1];
        if (v16 == v7)
        {
          v17 = *((unsigned __int8 *)v12 + 39);
          if ((v17 & 0x80u) == 0)
            v18 = *((unsigned __int8 *)v12 + 39);
          else
            v18 = v12[3];
          if (v18 == v14)
          {
            if ((v17 & 0x80) != 0)
            {
              if (!memcmp((const void *)v12[2], v1, v12[3]))
                return v12;
            }
            else
            {
              if (!*((_BYTE *)v12 + 39))
                return v12;
              v19 = 0;
              while (*((unsigned __int8 *)v12 + v19 + 16) == v1[v19])
              {
                if (v17 == ++v19)
                  return v12;
              }
            }
          }
        }
        else
        {
          if (v16 >= v6)
            v16 %= v6;
          if (v16 != v9)
            return 0;
        }
        result = 0;
        v12 = (uint64_t *)*v12;
        if (!v12)
          return result;
      }
    }
  }
  return 0;
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {
      v3 = *(_QWORD *)(v2 + 40);
      *(_QWORD *)(v2 + 40) = 0;
      if (v3)
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
      if (*(char *)(v2 + 39) < 0)
        operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void support::log::global_client_descriptor::~global_client_descriptor(void **this)
{
  *this = off_251CBFB08;
  if ((*((char *)this + 55) & 0x80000000) == 0)
  {
    if ((*((char *)this + 31) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(this[1]);
    return;
  }
  operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    goto LABEL_5;
}

{
  *this = off_251CBFB08;
  if (*((char *)this + 55) < 0)
  {
    operator delete(this[4]);
    if ((*((char *)this + 31) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(this[1]);
    operator delete(this);
    return;
  }
  if (*((char *)this + 31) < 0)
    goto LABEL_6;
LABEL_3:
  operator delete(this);
}

void std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B9553A9)
    return a1 + 24;
  if (((v3 & 0x800000024B9553A9 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B9553A9))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B9553A9 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__shared_ptr_emplace<support::log::buffer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFB88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<support::log::buffer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFB88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<support::log::buffer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void support::log::buffer::~buffer(support::log::buffer *this)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  BOOL v6;

  *(_QWORD *)this = off_251CBFBD8;
  v2 = (char *)*((_QWORD *)this + 9);
  v3 = (char *)this + 80;
  if (v2 != (char *)this + 80)
  {
    do
    {
      free(*((void **)v2 + 4));
      v4 = (char *)*((_QWORD *)v2 + 1);
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (char *)*((_QWORD *)v2 + 2);
          v6 = *(_QWORD *)v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  std::deque<char *>::~deque[abi:ne180100]((uint64_t)this + 96);
  std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy(*((_QWORD **)this + 10));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  BOOL v6;

  *(_QWORD *)this = off_251CBFBD8;
  v2 = (char *)*((_QWORD *)this + 9);
  v3 = (char *)this + 80;
  if (v2 != (char *)this + 80)
  {
    do
    {
      free(*((void **)v2 + 4));
      v4 = (char *)*((_QWORD *)v2 + 1);
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (char *)*((_QWORD *)v2 + 2);
          v6 = *(_QWORD *)v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  std::deque<char *>::~deque[abi:ne180100]((uint64_t)this + 96);
  std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy(*((_QWORD **)this + 10));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
  operator delete(this);
}

uint64_t std::deque<char *>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  *(_QWORD *)(a1 + 40) = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 256;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = 512;
LABEL_7:
    *(_QWORD *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v8 != v9)
      *(_QWORD *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B955535)
    return a1 + 24;
  if (((v3 & 0x800000024B955535 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B955535))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B955535 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__shared_ptr_emplace<support::log::manager_global>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFC70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<support::log::manager_global>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFC70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<support::log::manager_global>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t __cxx_global_var_init_11()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_24B855000);
  }
  return result;
}

void ABMServerFactory::create(uint64_t *a1@<X8>)
{
  _ZNSt3__115allocate_sharedB8ne180100I16ABMServerFactoryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(a1);
}

void ABMServerFactory::ABMServerFactory(ABMServerFactory *this)
{
  _QWORD *v1;

  Factory::Factory(this);
  *v1 = &off_251CBFCC0;
}

{
  _QWORD *v1;

  Factory::Factory(this);
  *v1 = &off_251CBFCC0;
}

void ABMServerFactory::~ABMServerFactory(ABMServerFactory *this)
{
  void *v1;

  Factory::~Factory(this);
  operator delete(v1);
}

void ABMServerFactory::createServiceManager(uint64_t *a1@<X1>, _OWORD *a2@<X8>)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  __n128 v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8[2];

  v2 = (std::__shared_weak_count *)a1[1];
  v8[0] = *a1;
  v8[1] = (uint64_t)v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5.n128_f64[0] = ABMServiceManager::create(v8, a2);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v2->__on_zero_shared)(v2, v5);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

void sub_24B92C298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ABMServerFactory::createBBServerConnection(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void ABMServerFactory::createRouterServer(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void _ZNSt3__115allocate_sharedB8ne180100I16ABMServerFactoryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(uint64_t *a1@<X8>)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  uint64_t v4;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;

  v2 = (std::__shared_weak_count *)operator new(0x30uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFD10;
  Factory::Factory((Factory *)&v2[1]);
  v2[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CBFCC0;
  *a1 = v4;
  a1[1] = (uint64_t)v2;
  shared_weak_owners = (std::__shared_weak_count *)v2[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      return;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    v2[1].__shared_owners_ = v4;
    v2[1].__shared_weak_owners_ = (uint64_t)v2;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    v2[1].__shared_owners_ = v4;
    v2[1].__shared_weak_owners_ = (uint64_t)v2;
  }
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

void sub_24B92C3C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ABMServerFactory>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFD10;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABMServerFactory>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFD10;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ABMServerFactory>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 24))(a1 + 24);
}

void NetworkStatsInterface::create(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = operator new(0x68uLL);
  v5 = (uint64_t)v4;
  v6 = (std::__shared_weak_count *)a1[1];
  v12 = *a1;
  v13 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  NetworkStatsInterface::NetworkStatsInterface(v4, &v12);
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  std::shared_ptr<NetworkStatsInterface>::shared_ptr[abi:ne180100]<NetworkStatsInterface,std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface*)#1},void>(a2, v5);
  ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*a2);
  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_24B92C4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B92C50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B92C520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v9);
  _Unwind_Resume(a1);
}

_QWORD *NetworkStatsInterface::NetworkStatsInterface(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  _BYTE v6[16];
  dispatch_object_t object;

  *a1 = off_251CBFD60;
  v4 = a1 + 9;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v6, "com.apple.telephony.abm", "net.stats");
  object = 0;
  ctu::SharedSynchronizable<NetworkStatsInterface>::SharedSynchronizable(v4, "net.stats", QOS_CLASS_DEFAULT, &object);
  if (object)
    dispatch_release(object);
  ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>&>(a1, (uint64_t)v6, a2);
  *a1 = off_251CBFED0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v6);
  *a1 = off_251CBFD60;
  return a1;
}

void sub_24B92C5F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  va_list va;

  va_start(va, a2);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

void sub_24B92C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a10);
  _Unwind_Resume(a1);
}

const char *NetworkStatsInterface::getName(NetworkStatsInterface *this)
{
  return "net.stats";
}

void NetworkStatsInterface::query(NetworkStatsInterface *this@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count_vtbl *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  std::__shared_weak_count_vtbl *v18;
  std::__shared_weak_count *v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3802000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v19 = 0;
  v4 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v4->__on_zero_shared = 0;
  v4->~__shared_weak_count_0 = 0;
  v4->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&v4->~__shared_weak_count_0;
  v5 = (std::__shared_weak_count *)operator new(0x20uLL);
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFF50;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5[1].__vftable = v4;
  v18 = v4;
  v19 = v5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = ___ZN21NetworkStatsInterface5queryEv_block_invoke;
  v12[3] = &unk_251CBFD98;
  v12[4] = &v13;
  NetworkStatsInterface::applyInterfaces((uint64_t)this, (uint64_t)v12);
  v6 = v14[6];
  *a2 = v14[5];
  a2[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  _Block_object_dispose(&v13, 8);
  v9 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_24B92C78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;
  uint64_t v15;

  operator delete(v14);
  _Block_object_dispose(&a14, 8);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v15 + 40);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void NetworkStatsInterface::applyInterfaces(uint64_t a1, uint64_t a2)
{
  int v3;
  int *v4;
  NSObject *v5;
  int v6;
  char *v7;
  ifaddrs *v8;
  sockaddr *ifa_addr;
  int sa_family;
  unsigned int ifa_flags;
  const char *ifa_name;
  size_t v13;
  _BYTE *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BYTE *v20;
  void **v21;
  void **v22;
  char *p_p;
  int64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  void **v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int64_t v32;
  _BYTE *v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  size_t v38;
  _BYTE *v39;
  _BYTE *v40;
  BOOL v41;
  uint64_t v42;
  const char *v43;
  unsigned int v44;
  void **v45;
  unsigned int v46;
  ifaddrs *v48;
  uint64_t v49;
  void *__dst[3];
  void *__p;
  unint64_t v53;
  uint64_t v54;
  ifaddrs *v55;
  char *__endptr;
  _BYTE buf[24];
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v55 = (ifaddrs *)0xAAAAAAAAAAAAAAAALL;
  v3 = getifaddrs(&v55);
  if (v3)
  {
    v4 = __error();
    v5 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *v4;
      v7 = strerror(v6);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v3;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v6;
      *(_WORD *)&buf[14] = 2080;
      *(_QWORD *)&buf[16] = v7;
      _os_log_error_impl(&dword_24B855000, v5, OS_LOG_TYPE_ERROR, "Failed to get data stats, error %d errno=%d(%s)", buf, 0x18u);
    }
    return;
  }
  v8 = v55;
  if (v55)
  {
    v49 = a2;
    while (1)
    {
      v53 = 0xAAAAAAAAAAAAAAAALL;
      v54 = 0x6AAAAAAAAAAAAAALL;
      __p = (void *)0xAA0070695F706470;
      ifa_addr = v8->ifa_addr;
      if (!ifa_addr)
      {
        v8 = v8->ifa_next;
        goto LABEL_7;
      }
      sa_family = ifa_addr->sa_family;
      ifa_flags = v8->ifa_flags;
      memset(__dst, 170, sizeof(__dst));
      ifa_name = v8->ifa_name;
      v13 = strlen(ifa_name);
      if (v13 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v14 = (_BYTE *)v13;
      if (v13 >= 0x17)
        break;
      HIBYTE(__dst[2]) = v13;
      v15 = __dst;
      if (v13)
        goto LABEL_16;
LABEL_17:
      v14[(_QWORD)v15] = 0;
      v18 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v45 = __dst;
        if (SHIBYTE(__dst[2]) < 0)
          v45 = (void **)__dst[0];
        v46 = v8->ifa_flags;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = sa_family;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v46;
        v58 = 1024;
        v59 = ifa_flags & 1;
        _os_log_debug_impl(&dword_24B855000, v18, OS_LOG_TYPE_DEBUG, "#D Found interface %s, family %u, flags %u, up %d", buf, 0x1Eu);
        if (sa_family != 30 && sa_family != 18)
          goto LABEL_79;
      }
      else if (sa_family != 30 && sa_family != 18)
      {
        goto LABEL_79;
      }
      v20 = (_BYTE *)HIBYTE(__dst[2]);
      v21 = (void **)__dst[0];
      if (SHIBYTE(__dst[2]) >= 0)
        v22 = __dst;
      else
        v22 = (void **)__dst[0];
      if (v54 >= 0)
        p_p = (char *)&__p;
      else
        p_p = (char *)__p;
      if (v54 >= 0)
        v24 = HIBYTE(v54);
      else
        v24 = v53;
      if (!v24)
      {
        v32 = 0;
LABEL_44:
        v33 = (_BYTE *)(v32 + v24);
        if ((v20 & 0x80) != 0)
        {
          v20 = __dst[1];
          if (__dst[1] < v33)
LABEL_102:
            std::string::__throw_out_of_range[abi:ne180100]();
        }
        else
        {
          if (v33 > v20)
            goto LABEL_102;
          v21 = __dst;
        }
        v34 = v20 - v33;
        if ((unint64_t)(v20 - v33) > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v34 >= 0x17)
        {
          v36 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v34 | 7) != 0x17)
            v36 = v34 | 7;
          v37 = v36 + 1;
          v35 = operator new(v36 + 1);
          *(_QWORD *)&buf[8] = v20 - v33;
          *(_QWORD *)&buf[16] = v37 | 0x8000000000000000;
          *(_QWORD *)buf = v35;
        }
        else
        {
          buf[23] = (_BYTE)v20 - (_BYTE)v33;
          v35 = buf;
          if (v20 == v33)
          {
LABEL_56:
            v35[v34] = 0;
            __endptr = 0;
            if (buf[23] >= 0)
              v38 = buf[23];
            else
              v38 = *(_QWORD *)&buf[8];
            if (v38
              && (buf[23] >= 0 ? (v39 = buf) : (v39 = *(_BYTE **)buf),
                  (v40 = memchr(v39, 45, v38)) != 0 && v40 - v39 != -1))
            {
              v41 = 0;
              v42 = 2863311530;
              if ((buf[23] & 0x80000000) != 0)
              {
LABEL_66:
                operator delete(*(void **)buf);
                if (!v41)
                  goto LABEL_79;
LABEL_78:
                (*(void (**)(uint64_t, ifaddrs *, uint64_t))(v49 + 16))(v49, v8, v42);
                goto LABEL_79;
              }
            }
            else
            {
              *__error() = 0;
              if (buf[23] >= 0)
                v43 = buf;
              else
                v43 = *(const char **)buf;
              v44 = strtoul(v43, &__endptr, 10);
              v41 = 0;
              if (*__error())
              {
                v42 = 2863311530;
                if ((buf[23] & 0x80000000) != 0)
                  goto LABEL_66;
              }
              else
              {
                v42 = 2863311530;
                if (__endptr)
                {
                  v41 = *__endptr == 0;
                  if (*__endptr)
                    v42 = 2863311530;
                  else
                    v42 = v44;
                }
                if ((buf[23] & 0x80000000) != 0)
                  goto LABEL_66;
              }
            }
            if (!v41)
              goto LABEL_79;
            goto LABEL_78;
          }
        }
        memmove(v35, &v33[(_QWORD)v21], v20 - v33);
        goto LABEL_56;
      }
      if (SHIBYTE(__dst[2]) >= 0)
        v25 = HIBYTE(__dst[2]);
      else
        v25 = (uint64_t)__dst[1];
      if (v25 >= v24)
      {
        v26 = (char *)v22 + v25;
        v27 = *p_p;
        v28 = v22;
        while (1)
        {
          v29 = v25 - v24;
          if (v29 == -1)
            goto LABEL_79;
          v30 = (char *)memchr(v28, v27, v29 + 1);
          if (!v30)
            goto LABEL_79;
          v31 = v30;
          if (!memcmp(v30, p_p, v24))
            break;
          v28 = (void **)(v31 + 1);
          v25 = v26 - (v31 + 1);
          if (v25 < v24)
            goto LABEL_79;
        }
        if (v31 != v26)
        {
          v32 = v31 - (char *)v22;
          if (v31 - (char *)v22 != -1)
            goto LABEL_44;
        }
      }
LABEL_79:
      if (SHIBYTE(__dst[2]) < 0)
      {
        operator delete(__dst[0]);
        v8 = v8->ifa_next;
        if (SHIBYTE(v54) < 0)
LABEL_83:
          operator delete(__p);
      }
      else
      {
        v8 = v8->ifa_next;
        if (SHIBYTE(v54) < 0)
          goto LABEL_83;
      }
LABEL_7:
      if (!v8)
      {
        v48 = v55;
        goto LABEL_98;
      }
    }
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    __dst[2] = (void *)(v17 | 0x8000000000000000);
    __dst[0] = v15;
LABEL_16:
    memmove(v15, ifa_name, (size_t)v14);
    goto LABEL_17;
  }
  v48 = 0;
LABEL_98:
  MEMORY[0x24BD29EF8](v48);
}

void sub_24B92CD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if ((a24 & 0x80000000) == 0)
LABEL_7:
      _Unwind_Resume(a1);
  }
  else if ((a24 & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(a19);
  goto LABEL_7;
}

void ___ZN21NetworkStatsInterface5queryEv_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6;
  const char *v7;
  size_t v8;
  size_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t **v16;
  unsigned int v17;
  char *v18;
  uint64_t *v19;
  uint64_t *v20;
  void **v21;
  _BYTE *v22;
  size_t v23;
  uint64_t v24;
  int v25;
  _BYTE __dst[24];

  v6 = *(_DWORD *)(a2 + 16);
  memset(__dst, 170, sizeof(__dst));
  v7 = *(const char **)(a2 + 8);
  v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    *(_QWORD *)&__dst[8] = v9;
    *(_QWORD *)&__dst[16] = v12 | 0x8000000000000000;
    *(_QWORD *)__dst = v10;
    goto LABEL_8;
  }
  __dst[23] = v8;
  v10 = __dst;
  if (v8)
LABEL_8:
    memmove(v10, v7, v9);
  v10[v9] = 0;
  v13 = *(uint64_t ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v15 = v13 + 1;
  v14 = v13[1];
  if (v14)
  {
    while (1)
    {
      while (1)
      {
        v16 = (uint64_t **)v14;
        v17 = *((_DWORD *)v14 + 8);
        if (v17 <= a3)
          break;
        v14 = *v16;
        v15 = v16;
        if (!*v16)
          goto LABEL_16;
      }
      if (v17 >= a3)
        break;
      v14 = v16[1];
      if (!v14)
      {
        v15 = v16 + 1;
        goto LABEL_16;
      }
    }
    v18 = (char *)v16;
  }
  else
  {
    v16 = v13 + 1;
LABEL_16:
    v18 = (char *)operator new(0x50uLL);
    *((_DWORD *)v18 + 8) = a3;
    *(_OWORD *)(v18 + 40) = 0u;
    *(_OWORD *)(v18 + 56) = 0u;
    *((_QWORD *)v18 + 9) = 0;
    *(_QWORD *)v18 = 0;
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 2) = v16;
    *v15 = (uint64_t *)v18;
    v19 = (uint64_t *)**v13;
    v20 = (uint64_t *)v18;
    if (v19)
    {
      *v13 = v19;
      v20 = *v15;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v13[1], v20);
    v13[2] = (uint64_t *)((char *)v13[2] + 1);
  }
  v18[48] |= v6 & 1;
  v21 = (void **)(v18 + 56);
  if (v18 + 56 != __dst)
  {
    if (v18[79] < 0)
    {
      if (__dst[23] >= 0)
        v22 = __dst;
      else
        v22 = *(_BYTE **)__dst;
      if (__dst[23] >= 0)
        v23 = __dst[23];
      else
        v23 = *(_QWORD *)&__dst[8];
      std::string::__assign_no_alias<false>(v21, v22, v23);
    }
    else if ((__dst[23] & 0x80) != 0)
    {
      std::string::__assign_no_alias<true>(v21, *(void **)__dst, *(size_t *)&__dst[8]);
    }
    else
    {
      *(_OWORD *)v21 = *(_OWORD *)__dst;
      *((_QWORD *)v18 + 9) = *(_QWORD *)&__dst[16];
    }
  }
  v24 = *(_QWORD *)(a2 + 48);
  if (v24)
  {
    v25 = *((_DWORD *)v18 + 11);
    *((_DWORD *)v18 + 10) += *(_DWORD *)(v24 + 28);
    *((_DWORD *)v18 + 11) = v25 + *(_DWORD *)(v24 + 20);
  }
  if ((__dst[23] & 0x80000000) != 0)
    operator delete(*(void **)__dst);
}

void sub_24B92D00C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void NetworkStatsInterface::getInterfaceList(NetworkStatsInterface *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  _BYTE *v4;
  _BYTE *v5;
  int64_t v6;
  char *v7;
  char *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(_QWORD *, uint64_t);
  void (*v14)(uint64_t);
  void *__p;
  void *v16;
  uint64_t v17;

  v10 = 0;
  v11 = &v10;
  v12 = 0x4002000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__4;
  v17 = 0;
  __p = 0;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK21NetworkStatsInterface16getInterfaceListEv_block_invoke;
  v9[3] = &unk_251CBFDC0;
  v9[4] = &v10;
  NetworkStatsInterface::applyInterfaces((uint64_t)this, (uint64_t)v9);
  v3 = v11;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v5 = (_BYTE *)v3[5];
  v4 = (_BYTE *)v3[6];
  v6 = v4 - v5;
  if (v4 != v5)
  {
    if (v6 < 0)
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
    v7 = (char *)operator new(v4 - v5);
    *a2 = v7;
    v8 = &v7[4 * (v6 >> 2)];
    a2[2] = v8;
    memcpy(v7, v5, v6);
    a2[1] = v8;
  }
  _Block_object_dispose(&v10, 8);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
}

void sub_24B92D124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void ___ZNK21NetworkStatsInterface16getInterfaceListEv_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v4;
  unint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _DWORD *v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  int v25;

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (char *)v4[6];
  v5 = v4[7];
  v7 = v6;
  if ((unint64_t)v6 < v5)
  {
    *(_DWORD *)v6 = a3;
    v8 = (uint64_t)(v6 + 4);
    goto LABEL_22;
  }
  v9 = (char *)v4[5];
  v10 = (v6 - v9) >> 2;
  v11 = v10 + 1;
  if ((unint64_t)(v10 + 1) >> 62)
    std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
  v12 = v5 - (_QWORD)v9;
  if (v12 >> 1 > v11)
    v11 = v12 >> 1;
  if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
    v13 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v13 = v11;
  if (v13)
  {
    if (v13 >> 62)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v14 = operator new(4 * v13);
    v15 = &v14[4 * v10];
    v16 = &v14[4 * v13];
    *v15 = a3;
    v8 = (uint64_t)(v15 + 1);
    v17 = v6 - v9;
    if (v6 == v9)
      goto LABEL_20;
    goto LABEL_14;
  }
  v14 = 0;
  v15 = (_DWORD *)(4 * v10);
  v16 = 0;
  *(_DWORD *)(4 * v10) = a3;
  v8 = 4 * v10 + 4;
  v17 = v6 - v9;
  if (v6 != v9)
  {
LABEL_14:
    v18 = v17 - 4;
    if (v18 < 0x2C)
      goto LABEL_27;
    if ((unint64_t)(v9 - v14) < 0x20)
      goto LABEL_27;
    v19 = (v18 >> 2) + 1;
    v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
    v7 = &v6[-v20];
    v15 = (_DWORD *)((char *)v15 - v20);
    v21 = &v14[4 * v10 - 16];
    v22 = v6 - 16;
    v23 = v19 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v24 = *(_OWORD *)v22;
      *(v21 - 1) = *((_OWORD *)v22 - 1);
      *v21 = v24;
      v21 -= 2;
      v22 -= 32;
      v23 -= 8;
    }
    while (v23);
    if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_27:
      do
      {
        v25 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *--v15 = v25;
      }
      while (v7 != v9);
    }
  }
LABEL_20:
  v4[5] = v15;
  v4[6] = v8;
  v4[7] = v16;
  if (v9)
    operator delete(v9);
LABEL_22:
  v4[6] = v8;
}

void NetworkStatsInterface::~NetworkStatsInterface(NetworkStatsInterface *this)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = *((_QWORD *)this + 12);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 11);
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = *((_QWORD *)this + 12);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 11);
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(this);
}

uint64_t ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 9;
  strcpy(a1, "net.stats");
}

uint64_t ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

void ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = a1 + 56;
  if (*(_QWORD *)(a1 + 56))
  {
    if (!*(_QWORD *)(a1 + 80) || (v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0)
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_24B92D4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_24B92D4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<NetworkStatsInterface>::shared_ptr[abi:ne180100]<NetworkStatsInterface,std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface*)#1},void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v6;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t v14;

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_251CBFE80;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2)
    return a1;
  v6 = *(std::__shared_weak_count **)(a2 + 80);
  if (v6)
  {
    if (v6->__shared_owners_ != -1)
      return a1;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    *(_QWORD *)(a2 + 72) = a2;
    *(_QWORD *)(a2 + 80) = v4;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    *(_QWORD *)(a2 + 72) = a2;
    *(_QWORD *)(a2 + 80) = v4;
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (v14)
    return a1;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_24B92D610(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface*)#1}::operator() const(NetworkStatsInterface*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_24B92D630(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<NetworkStatsInterface *,std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface *)#1},std::allocator<NetworkStatsInterface>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<NetworkStatsInterface *,std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface *)#1},std::allocator<NetworkStatsInterface>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 88), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface*)#1}::operator() const(NetworkStatsInterface*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<NetworkStatsInterface *,std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface *)#1},std::allocator<NetworkStatsInterface>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI21NetworkStatsInterfaceE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI21NetworkStatsInterfaceE15make_shared_ptrIS1_EENSt3__110sha"
                                "red_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI21NetworkStatsInterfaceE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI21NetworkStatsInterfaceE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<NetworkStatsInterface> ctu::SharedSynchronizable<NetworkStatsInterface>::make_shared_ptr<NetworkStatsInterface>(NetworkStatsInterface*)::{lambda(NetworkStatsInterface*)#1}::operator() const(NetworkStatsInterface*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

_QWORD *ctu::SharedSynchronizable<NetworkStatsInterface>::SharedSynchronizable(_QWORD *a1, const char *a2, dispatch_qos_class_t a3, dispatch_object_t *a4)
{
  NSObject *v8;
  NSObject *initially_inactive;
  NSObject *v10;
  NSObject *v11;

  v8 = *a4;
  if (*a4)
    dispatch_retain(*a4);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v10 = dispatch_queue_create_with_target_V2(a2, initially_inactive, v8);
  dispatch_set_qos_class_floor(v10, a3, 0);
  dispatch_activate(v10);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v10;
  if (v10)
    dispatch_retain(v10);
  v11 = *a4;
  a1[3] = *a4;
  if (v11)
    dispatch_retain(v11);
  if (v10)
    dispatch_release(v10);
  if (v8)
    dispatch_release(v8);
  return a1;
}

_QWORD *ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>&>(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  _BYTE v10[16];

  *a1 = off_251CBFF10;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
  a1[1] = &unk_251CB85F0;
  a1[7] = *a3;
  v5 = a3[1];
  a1[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v9);
  return a1;
}

void sub_24B92D858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

_QWORD *ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<NetworkStatsInterface,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CBFF10;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void std::__shared_ptr_pointer<std::map<unsigned int,NetworkStat> *,std::shared_ptr<std::map<unsigned int,NetworkStat>>::__shared_ptr_default_delete<std::map<unsigned int,NetworkStat>,std::map<unsigned int,NetworkStat>>,std::allocator<std::map<unsigned int,NetworkStat>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<std::map<unsigned int,NetworkStat> *,std::shared_ptr<std::map<unsigned int,NetworkStat>>::__shared_ptr_default_delete<std::map<unsigned int,NetworkStat>,std::map<unsigned int,NetworkStat>>,std::allocator<std::map<unsigned int,NetworkStat>>>::__on_zero_shared(uint64_t a1)
{
  char **v1;

  v1 = *(char ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<unsigned int,NetworkStat>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NetworkStat>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NetworkStat>>>::destroy(*(_QWORD *)(a1 + 24), v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<std::map<unsigned int,NetworkStat> *,std::shared_ptr<std::map<unsigned int,NetworkStat>>::__shared_ptr_default_delete<std::map<unsigned int,NetworkStat>,std::map<unsigned int,NetworkStat>>,std::allocator<std::map<unsigned int,NetworkStat>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B95594ELL)
    return a1 + 24;
  if (((v3 & 0x800000024B95594ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B95594ELL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B95594ELL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__tree<std::__value_type<unsigned int,NetworkStat>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NetworkStat>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NetworkStat>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,NetworkStat>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NetworkStat>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NetworkStat>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<unsigned int,NetworkStat>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NetworkStat>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NetworkStat>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[79] < 0)
      operator delete(*((void **)a2 + 7));
    operator delete(a2);
  }
}

void BootController::BootController(BootController *this)
{
  unsigned __int8 v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t Controller;
  const void *v12;
  __int128 __p;
  void (*v14)(uint64_t);
  void *v15;
  __int128 *v16;

  *(_QWORD *)this = off_251CBFFA0;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  *(_QWORD *)&__p = MEMORY[0x24BDAC760];
  *((_QWORD *)&__p + 1) = 0x40000000;
  v14 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v15 = &__block_descriptor_tmp_13_5;
  v16 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v4 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &__p);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v4 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_6;
  }
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v6 = __ldxr(p_shared_owners);
  while (__stxr(v6 + 1, p_shared_owners));
LABEL_6:
  *(_QWORD *)this = off_251CC0058;
  HIBYTE(v14) = 9;
  strcpy((char *)&__p, "boot.ctrl");
  ctu::LoggerCommonBase::LoggerCommonBase();
  *((_QWORD *)this + 1) = &unk_251CB85F0;
  *((_QWORD *)this + 7) = v4;
  *((_QWORD *)this + 8) = v3;
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  if (SHIBYTE(v14) < 0)
    operator delete((void *)__p);
  if (v3)
  {
    v9 = (unint64_t *)&v3->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  *((_QWORD *)this + 9) = 0;
  *(_QWORD *)this = off_251CBFFA0;
  *((_BYTE *)this + 80) = 1;
  Controller = TelephonyBasebandCreateController();
  v12 = (const void *)*((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = Controller;
  if (v12)
    CFRelease(v12);
}

void sub_24B92DCB8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  const void **v2;
  uint64_t v3;
  const void **v4;

  v4 = v2;
  ctu::cf::CFSharedRef<__TelephonyBasebandControllerHandle_tag>::~CFSharedRef(v4);
  *v1 = v3;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  _Unwind_Resume(a1);
}

void sub_24B92DCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  _Unwind_Resume(a1);
}

const char *BootController::getName(BootController *this)
{
  return "boot.ctrl";
}

uint64_t BootController::prepare()
{
  return 1;
}

uint64_t BootController::resetModem(BootController *this)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_24B855000, "Reset baseband", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  v3 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_24B855000, v3, OS_LOG_TYPE_DEFAULT, "#I Reset baseband", (uint8_t *)&state, 2u);
  }
  v4 = TelephonyBasebandResetModem();
  if ((v4 & 1) == 0)
  {
    v5 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_24B855000, v5, OS_LOG_TYPE_ERROR, "Failed Resetting Modem", (uint8_t *)&state, 2u);
      if (!v2)
        return v4;
      goto LABEL_6;
    }
  }
  if (v2)
LABEL_6:
    os_release(v2);
  return v4;
}

void sub_24B92DE24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

uint64_t BootController::powerCycleModem(BootController *this)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_24B855000, "Powercycle baseband", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  v3 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_24B855000, v3, OS_LOG_TYPE_DEFAULT, "#I Powercycle baseband", (uint8_t *)&state, 2u);
  }
  v4 = TelephonyBasebandPowercycleModem();
  if ((v4 & 1) == 0)
  {
    v5 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_24B855000, v5, OS_LOG_TYPE_ERROR, "Failed to powercycle baseband", (uint8_t *)&state, 2u);
      if (!v2)
        return v4;
      goto LABEL_6;
    }
  }
  if (v2)
LABEL_6:
    os_release(v2);
  return v4;
}

void sub_24B92DF48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

uint64_t BootController::powerOffModem(BootController *this)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_24B855000, "Poweroff baseband", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  v3 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_24B855000, v3, OS_LOG_TYPE_DEFAULT, "#I Poweroff baseband", (uint8_t *)&state, 2u);
  }
  v4 = TelephonyBasebandPowerOnModem();
  if ((v4 & 1) == 0)
  {
    v5 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_24B855000, v5, OS_LOG_TYPE_ERROR, "Failed to poweroff baseband", (uint8_t *)&state, 2u);
      if (!v2)
        return v4;
      goto LABEL_6;
    }
  }
  if (v2)
LABEL_6:
    os_release(v2);
  return v4;
}

void sub_24B92E070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

void BootController::markNonvolatileDataErased(BootController *this)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_24B855000, v2, OS_LOG_TYPE_DEFAULT, "#I Marking EFS as erased", v3, 2u);
  }
  *((_BYTE *)this + 80) = 1;
}

uint64_t BootController::setManagerState(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = TelephonyBasebandSetManagerState();
  if ((v2 & 1) != 0)
    return v2;
  v3 = *(NSObject **)(a1 + 40);
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    return v2;
  *(_WORD *)v5 = 0;
  _os_log_error_impl(&dword_24B855000, v3, OS_LOG_TYPE_ERROR, "Failed to set manager state", v5, 2u);
  return v2;
}

uint64_t BootController::getManagerState(uint64_t a1)
{
  uint64_t ManagerState;
  NSObject *v3;
  uint8_t v5[16];

  ManagerState = TelephonyBasebandGetManagerState();
  if ((ManagerState & 1) != 0)
    return ManagerState;
  v3 = *(NSObject **)(a1 + 40);
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    return ManagerState;
  *(_WORD *)v5 = 0;
  _os_log_error_impl(&dword_24B855000, v3, OS_LOG_TYPE_ERROR, "Failed to get manager state", v5, 2u);
  return ManagerState;
}

BOOL BootController::setBasebandState(capabilities::radio *a1)
{
  _BOOL8 result;
  NSObject *v3;
  uint8_t v4[16];

  if (!capabilities::radio::supportsBasebandStateController(a1))
    return 1;
  if ((TelephonyBasebandSetBasebandState() & 1) != 0)
    return 1;
  v3 = *((_QWORD *)a1 + 5);
  result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_24B855000, v3, OS_LOG_TYPE_ERROR, "Failed to set baseband state", v4, 2u);
    return 0;
  }
  return result;
}

BOOL BootController::getBasebandState(capabilities::radio *a1, _DWORD *a2)
{
  _BOOL8 result;
  NSObject *v4;
  uint8_t v5[16];

  *a2 = 0;
  if (!capabilities::radio::supportsBasebandStateController(a1))
    return 1;
  if ((TelephonyBasebandGetBasebandState() & 1) != 0)
    return 1;
  v4 = *((_QWORD *)a1 + 5);
  result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_24B855000, v4, OS_LOG_TYPE_ERROR, "Failed to get baseband state", v5, 2u);
    return 0;
  }
  return result;
}

uint64_t ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 9;
  strcpy(a1, "boot.ctrl");
}

uint64_t ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC0058;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC0058;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void TraceManager::create(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13[2];
  _QWORD v14[5];
  _QWORD *v15;
  _QWORD block[6];

  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = operator new(0x140uLL);
  v5 = (uint64_t)v4;
  v6 = *a1;
  v7 = (std::__shared_weak_count *)a1[1];
  v13[0] = v6;
  v13[1] = (uint64_t)v7;
  if (v7)
  {
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }
  TraceManager::TraceManager((uint64_t)v4, v13);
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  std::shared_ptr<TraceManager>::shared_ptr[abi:ne180100]<TraceManager,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1},void>(a2, v5);
  ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*a2 + 48);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
  v10 = *a2;
  v11 = *a2 + 120;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 0x40000000;
  v14[2] = ___ZN12TraceManager4initEv_block_invoke;
  v14[3] = &__block_descriptor_tmp_6_6;
  v14[4] = v10;
  v15 = v14;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12TraceManagerE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_79_0;
  block[4] = v11;
  block[5] = &v15;
  v12 = *(NSObject **)(v10 + 136);
  if (*(_QWORD *)(v10 + 144))
    dispatch_async_and_wait(v12, block);
  else
    dispatch_sync(v12, block);
}

void sub_24B92E528(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  uint64_t v2;

  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v2);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void TraceManager::init(TraceManager *this)
{
  NSObject *v1;
  char *v2;
  _QWORD v3[5];
  _QWORD *v4;
  _QWORD block[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZN12TraceManager4initEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_6_6;
  v3[4] = this;
  v4 = v3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12TraceManagerE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_79_0;
  block[4] = (char *)this + 120;
  block[5] = &v4;
  v2 = (char *)this + 136;
  v1 = *((_QWORD *)this + 17);
  if (*((_QWORD *)v2 + 1))
    dispatch_async_and_wait(v1, block);
  else
    dispatch_sync(v1, block);
}

uint64_t TraceManager::TraceManager(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unsigned __int8 v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  NSObject *initially_inactive;
  NSObject *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  BasebandCrashReasonFilter *v22;
  __int128 v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  TraceCAReporter *v30;
  __int128 v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  _BYTE v39[16];
  __int128 block;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  _BYTE v44[16];

  v3 = *a2;
  v4 = (std::__shared_weak_count *)a2[1];
  if (v4)
  {
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
    *(_QWORD *)a1 = off_251CC0DB8;
    *(_QWORD *)(a1 + 8) = v3;
    *(_QWORD *)(a1 + 16) = v4;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    std::__shared_weak_count::__release_weak(v4);
    *(_QWORD *)a1 = &unk_251CB9EC8;
    std::__shared_weak_count::__release_weak(v4);
  }
  else
  {
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_QWORD *)a1 = &unk_251CB9EC8;
    *(_QWORD *)(a1 + 8) = v3;
  }
  *(_QWORD *)a1 = off_251CC0098;
  *(_QWORD *)(a1 + 48) = &unk_251CC0108;
  v9 = (_QWORD *)(a1 + 48);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v39, "com.apple.telephony.abm", "trace.mgr");
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  *(_QWORD *)&block = MEMORY[0x24BDAC760];
  *((_QWORD *)&block + 1) = 0x40000000;
  v41 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v42 = &__block_descriptor_tmp_13_5;
  v43 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v12 = GetABMLogServer(void)::sLogServer;
    v11 = *(std::__shared_weak_count **)algn_2579B8AE8;
    if (*(_QWORD *)algn_2579B8AE8)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v12 = GetABMLogServer(void)::sLogServer;
    v11 = *(std::__shared_weak_count **)algn_2579B8AE8;
    if (*(_QWORD *)algn_2579B8AE8)
    {
LABEL_12:
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v16 = dispatch_queue_create_with_target_V2("trace.mgr", initially_inactive, 0);
  dispatch_set_qos_class_floor(v16, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v16);
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = v16;
  if (v16)
  {
    dispatch_retain(v16);
    *(_QWORD *)(a1 + 144) = 0;
    dispatch_release(v16);
  }
  else
  {
    *(_QWORD *)(a1 + 144) = 0;
  }
  *(_QWORD *)(a1 + 48) = off_251CC07D0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&block);
  *(_QWORD *)(a1 + 56) = &unk_251CB85F0;
  *(_QWORD *)(a1 + 104) = v12;
  *(_QWORD *)(a1 + 112) = v11;
  if (v11)
  {
    v17 = (unint64_t *)&v11->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v44);
    *v9 = off_251CC0860;
    do
      v19 = __ldaxr(v17);
    while (__stlxr(v19 - 1, v17));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  else
  {
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v44);
    *v9 = off_251CC0860;
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v39);
  *(_QWORD *)a1 = off_251CC0098;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)(a1 + 48) = &unk_251CC0108;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_QWORD *)(a1 + 216) = a1 + 216;
  *(_QWORD *)(a1 + 224) = a1 + 216;
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 248) = 0;
  v20 = operator new(0x18uLL);
  v20[2] = 0;
  v20[1] = 0;
  *v20 = v20 + 1;
  *(_QWORD *)(a1 + 256) = v20;
  v21 = operator new(0x20uLL);
  *v21 = off_251CC08A0;
  v21[1] = 0;
  v21[2] = 0;
  v21[3] = v20;
  *(_QWORD *)(a1 + 264) = v21;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  v22 = (BasebandCrashReasonFilter *)operator new(0x60uLL);
  BasebandCrashReasonFilter::BasebandCrashReasonFilter(v22);
  *(_QWORD *)&block = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&block + 1) = 0xAAAAAAAAAAAAAAAALL;
  std::shared_ptr<BasebandCrashReasonFilter>::shared_ptr[abi:ne180100]<BasebandCrashReasonFilter,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter*)#1},void>(&block, (uint64_t)v22);
  v23 = block;
  block = 0uLL;
  v24 = *(std::__shared_weak_count **)(a1 + 296);
  *(_OWORD *)(a1 + 288) = v23;
  if (v24)
  {
    v25 = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
  if (*((_QWORD *)&block + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = (TraceCAReporter *)operator new(0x68uLL);
  TraceCAReporter::TraceCAReporter(v30);
  *(_QWORD *)&block = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&block + 1) = 0xAAAAAAAAAAAAAAAALL;
  std::shared_ptr<TraceCAReporter>::shared_ptr[abi:ne180100]<TraceCAReporter,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter*)#1},void>((std::__shared_weak_count_vtbl **)&block, (std::__shared_weak_count_vtbl *)v30);
  v31 = block;
  block = 0uLL;
  v32 = *(std::__shared_weak_count **)(a1 + 312);
  *(_OWORD *)(a1 + 304) = v31;
  if (v32)
  {
    v33 = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
  if (*((_QWORD *)&block + 1))
  {
    v36 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  return a1;
}

void sub_24B92EACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v26 = v25;
  operator delete(v26);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v19 + 304);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v19 + 288);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v19 + 272);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v24);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v23);
  std::list<boost::signals2::connection>::~list(v22);
  if (*(char *)(v19 + 215) < 0)
    operator delete(*(void **)(v19 + 192));
  if (*(char *)(v19 + 191) < 0)
    operator delete(*(void **)(v19 + 168));
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v21);
  ctu::SharedLoggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v20);
  Service::~Service((Service *)v19);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void TraceManager::~TraceManager(TraceManager *this)
{
  char *v2;
  char *i;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int j;
  unsigned int v7;
  boost::signals2::detail::connection_body_base *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  unsigned int *v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int v43;
  char *v44;
  unsigned int *v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  std::__shared_weak_count *v58;
  _QWORD v59[2];

  *(_QWORD *)this = off_251CC0098;
  *((_QWORD *)this + 6) = &unk_251CC0108;
  v2 = (char *)this + 216;
  for (i = (char *)*((_QWORD *)this + 28); i != v2; i = (char *)*((_QWORD *)i + 1))
  {
    v4 = (unsigned int *)*((_QWORD *)i + 3);
    v59[0] = 0;
    v59[1] = v4;
    if (v4)
    {
      v5 = v4 + 2;
      for (j = v4[2]; j; j = v7)
      {
        v7 = __ldxr(v5);
        if (v7 == j)
        {
          if (!__stxr(j + 1, v5))
          {
            v8 = (boost::signals2::detail::connection_body_base *)*((_QWORD *)i + 2);
            v59[0] = v8;
            if (v8)
              boost::signals2::detail::connection_body_base::disconnect(v8);
            do
            {
              v9 = __ldaxr(v5);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v5));
            if (!v10)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
              v11 = v4 + 3;
              do
              {
                v12 = __ldaxr(v11);
                v13 = v12 - 1;
              }
              while (__stlxr(v13, v11));
              if (!v13)
                (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 24))(v4);
            }
            break;
          }
        }
        else
        {
          __clrex();
        }
      }
    }
  }
  if (*((_QWORD *)this + 29))
  {
    v14 = *((_QWORD *)this + 27);
    v15 = (char *)*((_QWORD *)this + 28);
    v16 = *(_QWORD *)v15;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)(v14 + 8);
    **(_QWORD **)(v14 + 8) = v16;
    *((_QWORD *)this + 29) = 0;
    if (v15 != v2)
    {
      do
      {
        v39 = (char *)*((_QWORD *)v15 + 1);
        v40 = (unsigned int *)*((_QWORD *)v15 + 3);
        if (v40)
        {
          v41 = v40 + 3;
          do
          {
            v42 = __ldaxr(v41);
            v43 = v42 - 1;
          }
          while (__stlxr(v43, v41));
          if (!v43)
            (*(void (**)(unsigned int *))(*(_QWORD *)v40 + 24))(v40);
        }
        operator delete(v15);
        v15 = v39;
      }
      while (v39 != v2);
    }
  }
  v17 = (std::__shared_weak_count *)*((_QWORD *)this + 31);
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      v20 = *((_QWORD *)this + 11);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  v20 = *((_QWORD *)this + 11);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
LABEL_26:
    LOWORD(v59[0]) = 0;
    _os_log_impl(&dword_24B855000, v20, OS_LOG_TYPE_DEFAULT, "#I Gone!", (uint8_t *)v59, 2u);
  }
LABEL_27:
  v21 = (std::__shared_weak_count *)*((_QWORD *)this + 39);
  if (v21)
  {
    v22 = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)this + 37);
  if (v24)
  {
    v25 = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = (std::__shared_weak_count *)*((_QWORD *)this + 35);
  if (v27)
  {
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = (std::__shared_weak_count *)*((_QWORD *)this + 33);
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = (std::__shared_weak_count *)*((_QWORD *)this + 31);
  if (!v33)
    goto LABEL_51;
  v34 = (unint64_t *)&v33->__shared_owners_;
  do
    v35 = __ldaxr(v34);
  while (__stlxr(v35 - 1, v34));
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
    if (!*((_QWORD *)this + 29))
      goto LABEL_69;
  }
  else
  {
LABEL_51:
    if (!*((_QWORD *)this + 29))
      goto LABEL_69;
  }
  v36 = *((_QWORD *)this + 27);
  v37 = (char *)*((_QWORD *)this + 28);
  v38 = *(_QWORD *)v37;
  *(_QWORD *)(v38 + 8) = *(_QWORD *)(v36 + 8);
  **(_QWORD **)(v36 + 8) = v38;
  *((_QWORD *)this + 29) = 0;
  if (v37 != v2)
  {
    do
    {
      v44 = (char *)*((_QWORD *)v37 + 1);
      v45 = (unsigned int *)*((_QWORD *)v37 + 3);
      if (v45)
      {
        v46 = v45 + 3;
        do
        {
          v47 = __ldaxr(v46);
          v48 = v47 - 1;
        }
        while (__stlxr(v48, v46));
        if (!v48)
          (*(void (**)(unsigned int *))(*(_QWORD *)v45 + 24))(v45);
      }
      operator delete(v37);
      v37 = v44;
    }
    while (v44 != v2);
  }
LABEL_69:
  if (*((char *)this + 215) < 0)
  {
    operator delete(*((void **)this + 24));
    if ((*((char *)this + 191) & 0x80000000) == 0)
    {
LABEL_71:
      v49 = (std::__shared_weak_count *)*((_QWORD *)this + 20);
      if (!v49)
        goto LABEL_79;
      goto LABEL_75;
    }
  }
  else if ((*((char *)this + 191) & 0x80000000) == 0)
  {
    goto LABEL_71;
  }
  operator delete(*((void **)this + 21));
  v49 = (std::__shared_weak_count *)*((_QWORD *)this + 20);
  if (!v49)
    goto LABEL_79;
LABEL_75:
  v50 = (unint64_t *)&v49->__shared_owners_;
  do
    v51 = __ldaxr(v50);
  while (__stlxr(v51 - 1, v50));
  if (!v51)
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
LABEL_79:
  *((_QWORD *)this + 6) = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v52 = *((_QWORD *)this + 18);
  if (v52)
    dispatch_release(v52);
  v53 = *((_QWORD *)this + 17);
  if (v53)
    dispatch_release(v53);
  v54 = (std::__shared_weak_count *)*((_QWORD *)this + 16);
  if (v54)
    std::__shared_weak_count::__release_weak(v54);
  *(_QWORD *)this = off_251CC0DB8;
  v55 = *((_QWORD *)this + 3);
  if (v55)
  {
    v56 = *((_QWORD *)this + 4);
    v57 = (void *)*((_QWORD *)this + 3);
    if (v56 != v55)
    {
      do
      {
        if (*(char *)(v56 - 1) < 0)
          operator delete(*(void **)(v56 - 24));
        v56 -= 24;
      }
      while (v56 != v55);
      v57 = (void *)*((_QWORD *)this + 3);
    }
    *((_QWORD *)this + 4) = v55;
    operator delete(v57);
  }
  v58 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v58)
    std::__shared_weak_count::__release_weak(v58);
}

{
  void *v1;

  TraceManager::~TraceManager(this);
  operator delete(v1);
}

void sub_24B92F0E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  boost::shared_ptr<boost::signals2::detail::connection_body_base>::~shared_ptr((uint64_t)&a9);
  __clang_call_terminate(a1);
}

void `non-virtual thunk to'TraceManager::~TraceManager(TraceManager *this)
{
  TraceManager::~TraceManager((TraceManager *)((char *)this - 48));
}

{
  void *v1;

  TraceManager::~TraceManager((TraceManager *)((char *)this - 48));
  operator delete(v1);
}

void ___ZN12TraceManager4initEv_block_invoke(uint64_t a1)
{
  NSObject *v1;
  CommandDriverFactory *v2;
  uint64_t v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  char v27;
  char v28;
  uint64_t v29;
  void (*v30)(_BYTE *, _BYTE *, uint64_t);
  void (*v31)(uint64_t, _WORD *, unsigned int);
  unint64_t *p_shared_weak_owners;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t ***v42;
  __int128 v43;
  pthread_mutex_t *v44;
  unsigned int *v45;
  unsigned int v46;
  uint64_t *v47;
  uint64_t *v48;
  int v49;
  uint64_t **v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  unsigned int *v60;
  unsigned int v61;
  _QWORD **v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  int v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  int v83;
  int v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  int v88;
  int v89;
  int v90;
  _QWORD *v91;
  __int128 v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  unsigned int *v99;
  unsigned int v100;
  uint64_t **v101;
  unsigned int *v102;
  unsigned int *v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int *v106;
  unsigned int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t i;
  uint64_t v116;
  unsigned int v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t **v120;
  int v121;
  int v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  BOOL v127;
  BOOL v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t **v131;
  uint64_t **v132;
  int v133;
  uint64_t ***v134;
  BOOL v135;
  BOOL v136;
  uint64_t ***v137;
  int v138;
  BOOL v139;
  int v140;
  uint64_t *v141;
  uint64_t *v142;
  int v143;
  uint64_t **v144;
  int v145;
  int v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  unsigned int *v155;
  unsigned int *v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int *v159;
  unsigned int v160;
  unsigned int v161;
  _QWORD *v162;
  _QWORD *v163;
  uint64_t v164;
  int *v165;
  int v166;
  uint64_t v167;
  unsigned int *v168;
  unsigned int v169;
  unsigned int v170;
  _QWORD *v171;
  uint64_t **v172;
  unsigned int *v173;
  unsigned int v174;
  unsigned int *v175;
  unsigned int *v176;
  uint64_t *v177;
  _QWORD *v178;
  _QWORD *v179;
  uint64_t *v180;
  unsigned int v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t *v184;
  uint64_t v185;
  int v186;
  BOOL v187;
  BOOL v188;
  uint64_t *v189;
  int v190;
  uint64_t *v191;
  _QWORD *v192;
  uint64_t v193;
  unsigned int *v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  unsigned int v198;
  unsigned int *v199;
  const void *v200;
  unsigned int *v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int *v204;
  unsigned int v205;
  unsigned int v206;
  char *v207;
  char *v208;
  unsigned int *v209;
  unsigned int *v210;
  unsigned int v211;
  unsigned int v212;
  unsigned int *v213;
  unsigned int v214;
  unsigned int v215;
  void (*v216)(__int128 *, __int128 *, uint64_t);
  uint64_t v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  int v221;
  int v222;
  unsigned int *v223;
  unsigned int *v224;
  unsigned int v225;
  unsigned int v226;
  uint64_t v227;
  unsigned int *v228;
  unsigned int v229;
  unsigned int v230;
  unint64_t *v231;
  unint64_t v232;
  _OWORD *v233;
  uint64_t v234;
  std::__shared_weak_count *v235;
  unint64_t *v236;
  unint64_t v237;
  uint64_t *v238;
  unint64_t v239;
  const void *v240;
  size_t v241;
  size_t v242;
  _BYTE *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  NSObject *global_queue;
  unsigned int *v248;
  unsigned int v249;
  unsigned int v250;
  void *v251;
  uint64_t **v252;
  void *v253;
  const void *v254;
  _QWORD *v255;
  std::__shared_weak_count *v256;
  uint64_t v257;
  uint64_t ***v258;
  _QWORD block[6];
  std::__shared_weak_count *v260;
  uint64_t v261;
  std::__shared_weak_count *v262;
  uint64_t v263;
  std::__shared_weak_count *v264;
  __int128 v265;
  _QWORD aBlock[7];
  dispatch_object_t v267;
  void *v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  uint64_t v272;
  dispatch_object_t v273;
  void *v274;
  dispatch_object_t object;
  void *v276;
  unint64_t v277;
  unint64_t v278;
  void *v279;
  _BYTE buf[32];
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  unint64_t v289;
  void *__p;
  uint64_t v291;
  pthread_mutex_t *v292;
  uint64_t v293;

  v293 = *MEMORY[0x24BDAC8D0];
  v255 = *(_QWORD **)(a1 + 32);
  v1 = v255[11];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Initializing", buf, 2u);
  }
  v2 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  v3 = off_2579B85E0;
  if (!off_2579B85E0)
  {
    CommandDriverFactory::create_default_global(v2);
    v4 = *(_OWORD *)buf;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v5 = (std::__shared_weak_count *)*(&off_2579B85E0 + 1);
    off_2579B85E0 = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v8 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v9 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v3 = off_2579B85E0;
  }
  block[5] = v3;
  v260 = (std::__shared_weak_count *)*(&off_2579B85E0 + 1);
  if (*(&off_2579B85E0 + 1))
  {
    v11 = (unint64_t *)(*(&off_2579B85E0 + 1) + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v3 + 16))(&v261, v3);
  v263 = 0;
  v264 = 0;
  if (v262 && (v264 = std::__shared_weak_count::lock(v262)) != 0)
  {
    v13 = v261;
    v263 = v261;
  }
  else
  {
    v13 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3ctu20SharedSynchronizableI12TraceManagerE13connect_eventIN5boost8signals26signalIFvNS_2cf11CFSharedRefIK14__CFDictionaryEEENS5_19optional_last_valueIvEEiNSt3__14lessIiEENS4_8functionISC_EENSI_IFvRKNS5_10connectionESB_EEENS5_5mutexEEES1_vJSB_EEEDTcl7connectfp_cvNSF_10shared_ptrIS1_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSV_SX_E_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_76_1;
  aBlock[4] = v255 + 15;
  aBlock[5] = TraceManager::handleDumpLogsIndication_sync;
  aBlock[6] = 0;
  v14 = _Block_copy(aBlock);
  v257 = v13;
  v15 = (std::__shared_weak_count *)v255[16];
  if (!v15 || (v16 = v255[15], (v256 = std::__shared_weak_count::lock(v15)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v17 = v255[17];
  v267 = v17;
  v254 = v14;
  if (v14)
    v18 = _Block_copy(v14);
  else
    v18 = 0;
  v268 = v18;
  dispatch_retain(v17);
  v269 = 0u;
  v270 = 0u;
  v273 = v17;
  if (v18)
    v18 = _Block_copy(v18);
  v274 = v18;
  dispatch_retain(v17);
  object = v17;
  if (!v18)
  {
    v276 = 0;
    dispatch_retain(v17);
    goto LABEL_38;
  }
  v19 = _Block_copy(v18);
  v276 = v19;
  dispatch_retain(v17);
  if (!v19)
  {
LABEL_38:
    dispatch_retain(v17);
    v277 = 0;
    goto LABEL_39;
  }
  v20 = _Block_copy(v19);
  dispatch_retain(v17);
  v277 = 0;
  if (!v20)
  {
LABEL_39:
    dispatch_retain(v17);
    v251 = 0;
    v25 = 1;
LABEL_40:
    dispatch_retain(v17);
    v253 = 0;
    v26 = 1;
LABEL_41:
    dispatch_retain(v17);
    v22 = 0;
    v27 = 1;
LABEL_42:
    dispatch_retain(v17);
    v23 = 0;
    v278 = (unint64_t)v17;
    v28 = 1;
    goto LABEL_43;
  }
  v21 = _Block_copy(v20);
  dispatch_retain(v17);
  v251 = v20;
  if (!v21)
  {
    v25 = 0;
    goto LABEL_40;
  }
  v22 = _Block_copy(v21);
  dispatch_retain(v17);
  v253 = v21;
  if (!v22)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_41;
  }
  v23 = _Block_copy(v22);
  dispatch_retain(v17);
  if (!v23)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_42;
  }
  v24 = _Block_copy(v23);
  dispatch_retain(v17);
  v278 = (unint64_t)v17;
  if (v24)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v279 = _Block_copy(v24);
    dispatch_retain(v17);
    dispatch_release(v17);
    _Block_release(v24);
    goto LABEL_44;
  }
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
LABEL_43:
  v279 = 0;
  dispatch_retain(v17);
  dispatch_release(v17);
LABEL_44:
  dispatch_release(v17);
  if ((v28 & 1) == 0)
    _Block_release(v23);
  dispatch_release(v17);
  if ((v27 & 1) == 0)
    _Block_release(v22);
  v277 = (unint64_t)boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>>(ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>)::stored_vtable;
  dispatch_release(v17);
  if ((v26 & 1) == 0)
    _Block_release(v253);
  dispatch_release(v17);
  if ((v25 & 1) == 0)
    _Block_release(v251);
  *(_QWORD *)buf = 0;
  memset(&buf[8], 170, 24);
  boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::move_assign((uint64_t)buf, (uint64_t *)&v277);
  v29 = v16;
  boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::move_assign((uint64_t)&v277, (uint64_t *)&v270 + 1);
  boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::move_assign((uint64_t)&v270 + 8, (uint64_t *)buf);
  if (*(_QWORD *)buf)
  {
    if ((buf[0] & 1) == 0)
    {
      v30 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)buf & 0xFFFFFFFFFFFFFFFELL);
      if (v30)
        v30(&buf[8], &buf[8], 2);
    }
  }
  if (v277)
  {
    if ((v277 & 1) == 0)
    {
      v31 = *(void (**)(uint64_t, _WORD *, unsigned int))(v277 & 0xFFFFFFFFFFFFFFFELL);
      if (v31)
        v31((uint64_t)&v278, &v278, 2u);
    }
    v277 = 0;
  }
  dispatch_release(object);
  if (v276)
    _Block_release(v276);
  dispatch_release(v273);
  if (v274)
    _Block_release(v274);
  p_shared_weak_owners = (unint64_t *)&v256->__shared_weak_owners_;
  do
    v33 = __ldxr(p_shared_weak_owners);
  while (__stxr(v33 + 1, p_shared_weak_owners));
  v34 = operator new(0x18uLL);
  *v34 = &off_251CC0B48;
  v34[1] = v16;
  v34[2] = v256;
  do
    v35 = __ldxr(p_shared_weak_owners);
  while (__stxr(v35 + 1, p_shared_weak_owners));
  v36 = operator new(0x18uLL);
  v37 = v36;
  *v36 = &off_251CC0B48;
  v36[1] = v16;
  v36[2] = v256;
  do
    v38 = __ldxr(p_shared_weak_owners);
  while (__stxr(v38 + 1, p_shared_weak_owners));
  *(_QWORD *)&buf[8] = v36;
  *(_DWORD *)buf = 2;
  v39 = *((_QWORD *)&v269 + 1);
  if (*((_QWORD *)&v269 + 1) < (unint64_t)v270)
  {
    v40 = operator new(0x18uLL);
    *v40 = &off_251CC0B48;
    v40[1] = v29;
    v40[2] = v256;
    do
      v41 = __ldxr(p_shared_weak_owners);
    while (__stxr(v41 + 1, p_shared_weak_owners));
    *(_QWORD *)(v39 + 8) = v40;
    *(_DWORD *)v39 = 2;
    *((_QWORD *)&v269 + 1) = v39 + 24;
LABEL_75:
    (*(void (**)(_QWORD *))(*v37 + 8))(v37);
    goto LABEL_76;
  }
  v165 = std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__push_back_slow_path<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>((uint64_t *)&v269, (uint64_t)buf);
  v166 = *(_DWORD *)buf ^ (*(int *)buf >> 31);
  *((_QWORD *)&v269 + 1) = v165;
  if (v166 == 2)
  {
    v37 = *(_QWORD **)&buf[8];
    if (!*(_QWORD *)&buf[8])
      goto LABEL_76;
    goto LABEL_75;
  }
  if (v166 == 1)
  {
    v167 = *(_QWORD *)&buf[16];
    if (*(_QWORD *)&buf[16])
    {
      v168 = (unsigned int *)(*(_QWORD *)&buf[16] + 12);
      do
      {
        v169 = __ldaxr(v168);
        v170 = v169 - 1;
      }
      while (__stlxr(v170, v168));
      if (!v170)
LABEL_285:
        (*(void (**)(uint64_t))(*(_QWORD *)v167 + 24))(v167);
    }
  }
  else
  {
    v167 = *(_QWORD *)&buf[16];
    if (*(_QWORD *)&buf[16])
    {
      v248 = (unsigned int *)(*(_QWORD *)&buf[16] + 12);
      do
      {
        v249 = __ldaxr(v248);
        v250 = v249 - 1;
      }
      while (__stlxr(v250, v248));
      if (!v250)
        goto LABEL_285;
    }
  }
LABEL_76:
  (*(void (**)(_QWORD *))(*v34 + 8))(v34);
  std::__shared_weak_count::__release_weak(v256);
  v42 = *(uint64_t ****)(v257 + 112);
  *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v287 = v43;
  v288 = v43;
  v285 = v43;
  v286 = v43;
  v283 = v43;
  v284 = v43;
  v281 = v43;
  v282 = v43;
  *(_OWORD *)buf = v43;
  *(_OWORD *)&buf[16] = v43;
  v44 = (pthread_mutex_t *)v42[3];
  v289 = 10;
  __p = buf;
  v291 = 0;
  v292 = v44;
  pthread_mutex_lock(v44);
  v277 = 0xAAAAAAAAAAAAAAAALL;
  v278 = 0xAAAAAAAAAAAAAAAALL;
  v45 = (unsigned int *)v42[1];
  v258 = v42;
  if (!v45 || (v46 = atomic_load(v45 + 2), v46 != 1))
  {
    v50 = (uint64_t **)operator new(0x20uLL);
    v51 = (uint64_t *)*v42;
    v52 = *v51;
    v252 = v50;
    v53 = operator new(0x40uLL);
    v54 = v53;
    *v53 = v53;
    v53[1] = v53;
    v53[2] = 0;
    v55 = *(_QWORD **)(v52 + 8);
    if (v55 != (_QWORD *)v52)
    {
      v56 = 0;
      v57 = v53;
      do
      {
        v58 = operator new(0x20uLL);
        v58[2] = v55[2];
        v59 = v55[3];
        v58[3] = v59;
        if (v59)
        {
          v60 = (unsigned int *)(v59 + 8);
          do
            v61 = __ldxr(v60);
          while (__stxr(v61 + 1, v60));
          v57 = (_QWORD *)*v54;
          v56 = v54[2];
        }
        *v58 = v57;
        v58[1] = v54;
        v57[1] = v58;
        *v54 = v58;
        v54[2] = ++v56;
        v55 = (_QWORD *)v55[1];
        v57 = v58;
      }
      while (v55 != (_QWORD *)v52);
    }
    v54[3] = 0;
    v62 = (_QWORD **)(v54 + 3);
    v54[4] = 0;
    v63 = v54 + 4;
    v54[5] = 0;
    *((_BYTE *)v54 + 48) = *(_BYTE *)(v52 + 48);
    v54[3] = v54 + 4;
    v64 = *(_QWORD **)(v52 + 24);
    v65 = (_QWORD *)(v52 + 32);
    if (v64 == (_QWORD *)(v52 + 32))
    {
LABEL_88:
      *((_BYTE *)v54 + 56) = *(_BYTE *)(v52 + 56);
      v66 = *(_QWORD **)(v52 + 24);
      if (v66 != v65)
      {
        v67 = (_QWORD *)v54[3];
        v68 = v54[1];
        do
        {
          v67[6] = v68;
          v69 = v52;
          if (v66 != v65)
            v69 = v66[6];
          v70 = (_QWORD *)v66[1];
          v71 = v70;
          v72 = v66;
          if (v70)
          {
            do
            {
              v73 = v71;
              v71 = (_QWORD *)*v71;
            }
            while (v71);
          }
          else
          {
            do
            {
              v73 = (_QWORD *)v72[2];
              v127 = *v73 == (_QWORD)v72;
              v72 = v73;
            }
            while (!v127);
          }
          v74 = v52;
          if (v73 != v65)
            v74 = v73[6];
          while (v69 != v74)
          {
            v69 = *(_QWORD *)(v69 + 8);
            v68 = *(_QWORD *)(v68 + 8);
          }
          if (v70)
          {
            do
            {
              v75 = v70;
              v70 = (_QWORD *)*v70;
            }
            while (v70);
          }
          else
          {
            do
            {
              v75 = (_QWORD *)v66[2];
              v127 = *v75 == (_QWORD)v66;
              v66 = v75;
            }
            while (!v127);
          }
          v76 = (_QWORD *)v67[1];
          if (v76)
          {
            do
            {
              v77 = v76;
              v76 = (_QWORD *)*v76;
            }
            while (v76);
          }
          else
          {
            do
            {
              v77 = (_QWORD *)v67[2];
              v127 = *v77 == (_QWORD)v67;
              v67 = v77;
            }
            while (!v127);
          }
          v66 = v75;
          v67 = v77;
        }
        while (v75 != v65);
      }
      *v252 = v54;
      v252[1] = 0;
      v97 = (uint64_t *)operator new(0x18uLL);
      v97[1] = 0x100000001;
      *v97 = (uint64_t)off_251CC0970;
      v97[2] = (uint64_t)v54;
      v252[1] = v97;
      v252[2] = (uint64_t *)v51[2];
      v98 = v51[3];
      v252[3] = (uint64_t *)v98;
      if (v98)
      {
        v99 = (unsigned int *)(v98 + 8);
        do
          v100 = __ldxr(v99);
        while (__stxr(v100 + 1, v99));
      }
      v101 = (uint64_t **)operator new(0x18uLL);
      v101[1] = (uint64_t *)0x100000001;
      *v101 = (uint64_t *)off_251CC0910;
      v101[2] = (uint64_t *)v252;
      v102 = (unsigned int *)v258[1];
      *v258 = v252;
      v258[1] = v101;
      if (v102)
      {
        v103 = v102 + 2;
        do
        {
          v104 = __ldaxr(v103);
          v105 = v104 - 1;
        }
        while (__stlxr(v105, v103));
        if (!v105)
        {
          (*(void (**)(unsigned int *))(*(_QWORD *)v102 + 16))(v102);
          v106 = v102 + 3;
          do
          {
            v107 = __ldaxr(v106);
            v108 = v107 - 1;
          }
          while (__stlxr(v108, v106));
          if (!v108)
            (*(void (**)(unsigned int *))(*(_QWORD *)v102 + 24))(v102);
        }
      }
      v49 = 0;
      v47 = **v258;
LABEL_172:
      v48 = (uint64_t *)v47[1];
      if (v47 == v48)
        goto LABEL_276;
      goto LABEL_173;
    }
    while (1)
    {
      v78 = *((_DWORD *)v64 + 8);
      v79 = (_QWORD *)*v63;
      v80 = v54 + 4;
      if (*v62 != v63)
      {
        v81 = (_QWORD *)*v63;
        v82 = v54 + 4;
        if (v79)
        {
          do
          {
            v80 = v81;
            v81 = (_QWORD *)v81[1];
          }
          while (v81);
        }
        else
        {
          do
          {
            v80 = (_QWORD *)v82[2];
            v127 = *v80 == (_QWORD)v82;
            v82 = v80;
          }
          while (v127);
        }
        v83 = *((_DWORD *)v64 + 10);
        v84 = *((_DWORD *)v80 + 8);
        if (v84 == v78)
        {
          if (v78 != 1)
            goto LABEL_133;
          if (*((_DWORD *)v80 + 10) >= v83)
          {
            v85 = (_QWORD *)*v63;
            v86 = v54 + 4;
            v87 = v54 + 4;
            if (v79)
              goto LABEL_137;
LABEL_144:
            v91 = operator new(0x38uLL);
            v92 = *((_OWORD *)v64 + 2);
            v91[6] = v64[6];
            *((_OWORD *)v91 + 2) = v92;
            *v91 = 0;
            v91[1] = 0;
            v91[2] = v87;
            *v86 = v91;
            v93 = (_QWORD *)**v62;
            if (v93)
            {
              *v62 = v93;
              v91 = (_QWORD *)*v86;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v54[4], v91);
            ++v54[5];
            goto LABEL_147;
          }
        }
        else if (v84 >= v78)
        {
LABEL_133:
          v86 = v54 + 4;
          v87 = v54 + 4;
          if (!v79)
            goto LABEL_144;
          v85 = (_QWORD *)*v63;
          if (v78 != 1)
          {
            v88 = *((_DWORD *)v79 + 8);
            v87 = (_QWORD *)*v63;
            while (v78 != v88)
            {
              if (v78 < v88)
              {
                v96 = *v87;
                v86 = v87;
                if (!*v87)
                  goto LABEL_144;
              }
              else
              {
                if (v88 >= v78)
                  goto LABEL_147;
                v96 = v87[1];
                if (!v96)
                  goto LABEL_143;
              }
              v88 = *(_DWORD *)(v96 + 32);
              v87 = (_QWORD *)v96;
            }
            goto LABEL_147;
          }
          while (1)
          {
LABEL_137:
            v87 = v85;
            v89 = *((_DWORD *)v85 + 8);
            if (v89 == 1)
            {
              v90 = *((_DWORD *)v85 + 10);
              if (v90 > v83)
                goto LABEL_136;
              if (v90 >= v83)
                goto LABEL_147;
            }
            else if (v89 > 1)
            {
LABEL_136:
              v85 = (_QWORD *)*v85;
              v86 = v87;
              if (!*v87)
                goto LABEL_144;
              continue;
            }
            v85 = (_QWORD *)v85[1];
            if (!v85)
            {
LABEL_143:
              v86 = v87 + 1;
              goto LABEL_144;
            }
          }
        }
      }
      if (v79)
        v87 = v80;
      else
        v87 = v54 + 4;
      if (v79)
        v86 = v80 + 1;
      else
        v86 = v54 + 4;
      if (!*v86)
        goto LABEL_144;
LABEL_147:
      v94 = (_QWORD *)v64[1];
      if (v94)
      {
        do
        {
          v95 = v94;
          v94 = (_QWORD *)*v94;
        }
        while (v94);
      }
      else
      {
        do
        {
          v95 = (_QWORD *)v64[2];
          v127 = *v95 == (_QWORD)v64;
          v64 = v95;
        }
        while (!v127);
      }
      v64 = v95;
      if (v95 == v65)
        goto LABEL_88;
    }
  }
  v47 = **v42;
  v48 = (uint64_t *)v42[2];
  v49 = 2;
  if (v48 == v47)
    goto LABEL_172;
LABEL_173:
  v109 = 0;
  v110 = v49 - 1;
  do
  {
    v113 = v48[2];
    v114 = *(uint64_t **)(v113 + 32);
    if (v114)
    {
      for (i = *v114; i != v114[1]; i += 24)
      {
        if ((*(_DWORD *)i ^ (*(int *)i >> 31)) > 1)
        {
          if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(i + 8) + 24))(*(_QWORD *)(i + 8)) & 1) != 0)
            goto LABEL_190;
        }
        else
        {
          v116 = *(_QWORD *)(i + 16);
          if (!v116 || (v117 = atomic_load((unsigned int *)(v116 + 8))) == 0)
          {
LABEL_190:
            if (*(_BYTE *)(v113 + 24))
            {
              *(_BYTE *)(v113 + 24) = 0;
              boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)v113, buf);
            }
            break;
          }
        }
      }
    }
    v111 = v48[2];
    if (*(_BYTE *)(v111 + 24))
    {
      v47 = (uint64_t *)v48[1];
      goto LABEL_176;
    }
    v118 = **v258;
    v120 = (uint64_t **)(v118 + 4);
    v119 = v118[4];
    if (!v119)
    {
      if ((uint64_t *)v118[10] != v48)
        goto LABEL_267;
      v142 = (uint64_t *)v48[1];
      v144 = (uint64_t **)(v118 + 4);
      v123 = v118 + 4;
      if (v142 != v118)
        goto LABEL_263;
LABEL_245:
      v147 = (uint64_t *)v123[1];
      v148 = v123;
      if (v147)
      {
        do
        {
          v149 = v147;
          v147 = (uint64_t *)*v147;
        }
        while (v147);
      }
      else
      {
        do
        {
          v149 = (uint64_t *)v148[2];
          v127 = *v149 == (_QWORD)v148;
          v148 = v149;
        }
        while (!v127);
      }
      if ((uint64_t *)v118[3] == v123)
        v118[3] = (uint64_t)v149;
      --v118[5];
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v119, v123);
      operator delete(v123);
      goto LABEL_267;
    }
    v121 = *(_DWORD *)(v111 + 64);
    v122 = *(_DWORD *)(v111 + 72);
    v123 = v118 + 4;
    v124 = v118[4];
    if (v121 == 1)
    {
      v123 = v118 + 4;
      v125 = v118[4];
      do
      {
        while (1)
        {
          v138 = *(_DWORD *)(v125 + 32);
          v139 = v138 < 1;
          if (v138 == 1)
            v139 = *(_DWORD *)(v125 + 40) < v122;
          if (v139)
            break;
          v123 = (uint64_t *)v125;
          v125 = *(_QWORD *)v125;
          if (!v125)
            goto LABEL_205;
        }
        v125 = *(_QWORD *)(v125 + 8);
      }
      while (v125);
    }
    else
    {
      do
      {
        v126 = *(_DWORD *)(v124 + 32);
        v127 = v126 == v121;
        v128 = v126 < v121;
        if (v126 >= v121)
          v129 = (uint64_t *)v124;
        else
          v129 = (uint64_t *)(v124 + 8);
        if (v128)
          v130 = v123;
        else
          v130 = (uint64_t *)v124;
        if (v127)
        {
          v129 = (uint64_t *)v124;
          v123 = (uint64_t *)v124;
        }
        else
        {
          v123 = v130;
        }
        v124 = *v129;
      }
      while (*v129);
    }
LABEL_205:
    if ((uint64_t *)v123[6] != v48)
      goto LABEL_267;
    v131 = (uint64_t **)(v118 + 4);
    v132 = (uint64_t **)v118[4];
    if (v121 == 1)
    {
      while (1)
      {
        v140 = *((_DWORD *)v132 + 8);
        if (v140 == 1)
        {
          if (v122 < *((_DWORD *)v132 + 10))
            goto LABEL_228;
LABEL_223:
          v132 = (uint64_t **)v132[1];
          if (!v132)
            goto LABEL_229;
        }
        else
        {
          if (v140 <= 1)
            goto LABEL_223;
LABEL_228:
          v131 = v132;
          v132 = (uint64_t **)*v132;
          if (!v132)
            goto LABEL_229;
        }
      }
    }
    do
    {
      v133 = *((_DWORD *)v132 + 8);
      v134 = (uint64_t ***)(v132 + 1);
      v135 = v121 == v133;
      v136 = v121 < v133;
      if (v121 >= v133)
        v137 = (uint64_t ***)(v132 + 1);
      else
        v137 = (uint64_t ***)v132;
      if (!v136)
        v132 = v131;
      if (v135)
        v137 = v134;
      else
        v131 = v132;
      v132 = *v137;
    }
    while (*v137);
LABEL_229:
    v141 = **v258;
    if (v131 != v120)
      v141 = v131[6];
    v142 = (uint64_t *)v48[1];
    if (v142 == v141)
      goto LABEL_245;
    if (v121 == 1)
    {
      while (1)
      {
        while (1)
        {
          v144 = (uint64_t **)v119;
          v145 = *(_DWORD *)(v119 + 32);
          if (v145 == 1)
            break;
          if (v145 <= 1)
            goto LABEL_241;
LABEL_235:
          v119 = *(_QWORD *)v119;
          if (!*v144)
          {
            v120 = v144;
            goto LABEL_263;
          }
        }
        v146 = *(_DWORD *)(v119 + 40);
        if (v146 > v122)
          goto LABEL_235;
        if (v146 >= v122)
        {
          *(_QWORD *)(v119 + 48) = v142;
          goto LABEL_267;
        }
LABEL_241:
        v119 = *(_QWORD *)(v119 + 8);
        if (!v119)
        {
          v120 = v144 + 1;
          goto LABEL_263;
        }
      }
    }
    v143 = *(_DWORD *)(v119 + 32);
    if (v121 == v143)
      goto LABEL_266;
    while (v121 >= v143)
    {
      if (v143 >= v121)
        goto LABEL_266;
      v150 = *(_QWORD *)(v119 + 8);
      if (!v150)
      {
        v120 = (uint64_t **)(v119 + 8);
        goto LABEL_262;
      }
LABEL_254:
      v143 = *(_DWORD *)(v150 + 32);
      v119 = v150;
      if (v121 == v143)
      {
        *(_QWORD *)(v150 + 48) = v142;
        goto LABEL_267;
      }
    }
    v150 = *(_QWORD *)v119;
    if (*(_QWORD *)v119)
      goto LABEL_254;
    v120 = (uint64_t **)v119;
LABEL_262:
    v144 = (uint64_t **)v119;
LABEL_263:
    v119 = (uint64_t)operator new(0x38uLL);
    v151 = *(_QWORD *)(v111 + 64);
    *(_DWORD *)(v119 + 40) = *(_DWORD *)(v111 + 72);
    *(_QWORD *)(v119 + 32) = v151;
    *(_QWORD *)(v119 + 48) = 0;
    *(_QWORD *)v119 = 0;
    *(_QWORD *)(v119 + 8) = 0;
    *(_QWORD *)(v119 + 16) = v144;
    *v120 = (uint64_t *)v119;
    v152 = *(_QWORD *)v118[3];
    v153 = (uint64_t *)v119;
    if (v152)
    {
      v118[3] = v152;
      v153 = *v120;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v118[4], v153);
    ++v118[5];
LABEL_266:
    *(_QWORD *)(v119 + 48) = v142;
LABEL_267:
    v154 = *v48;
    v47 = (uint64_t *)v48[1];
    *(_QWORD *)(v154 + 8) = v47;
    *(_QWORD *)v48[1] = v154;
    --v118[2];
    v155 = (unsigned int *)v48[3];
    if (v155)
    {
      v156 = v155 + 2;
      do
      {
        v157 = __ldaxr(v156);
        v158 = v157 - 1;
      }
      while (__stlxr(v158, v156));
      if (!v158)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v155 + 16))(v155);
        v159 = v155 + 3;
        do
        {
          v160 = __ldaxr(v159);
          v161 = v160 - 1;
        }
        while (__stlxr(v161, v159));
        if (!v161)
          (*(void (**)(unsigned int *))(*(_QWORD *)v155 + 24))(v155);
      }
    }
    operator delete(v48);
LABEL_176:
    v112 = v47 != **v258 && v110 >= ++v109;
    v48 = v47;
  }
  while (v112);
LABEL_276:
  v258[2] = (uint64_t **)v47;
  v162 = operator new(0x50uLL);
  v162[1] = 0;
  v162[2] = 0;
  *((_BYTE *)v162 + 24) = 1;
  *((_DWORD *)v162 + 7) = 1;
  *v162 = off_251CC09D0;
  v163 = operator new(0x38uLL);
  std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::vector(v163, (uint64_t *)&v269);
  v163[3] = 0;
  v164 = *((_QWORD *)&v270 + 1);
  if (*((_QWORD *)&v270 + 1))
  {
    v163[3] = *((_QWORD *)&v270 + 1);
    if ((v164 & 1) != 0)
    {
      *((_OWORD *)v163 + 2) = v271;
      v163[6] = v272;
    }
    else
    {
      (*(void (**)(__int128 *, _QWORD *, _QWORD))(v164 & 0xFFFFFFFFFFFFFFFELL))(&v271, v163 + 4, 0);
    }
  }
  v162[4] = v163;
  v162[5] = 0;
  v171 = operator new(0x18uLL);
  v171[1] = 0x100000001;
  *v171 = off_251CC0A28;
  v171[2] = v163;
  v162[5] = v171;
  v162[6] = v258[3];
  v172 = v258[4];
  v162[7] = v172;
  if (v172)
  {
    v173 = (unsigned int *)(v172 + 1);
    do
      v174 = __ldxr(v173);
    while (__stxr(v174 + 1, v173));
  }
  *((_DWORD *)v162 + 16) = 0;
  *((_BYTE *)v162 + 68) = 0;
  v277 = (unint64_t)v162;
  v175 = (unsigned int *)operator new(0x18uLL);
  *((_QWORD *)v175 + 1) = 0x100000001;
  v176 = v175 + 2;
  *(_QWORD *)v175 = off_251CC0A88;
  *((_QWORD *)v175 + 2) = v162;
  v278 = (unint64_t)v175;
  v177 = **v258;
  v178 = operator new(0x20uLL);
  v179 = v178;
  v180 = v177 + 4;
  v178[2] = v162;
  v178[3] = v175;
  do
    v181 = __ldxr(v176);
  while (__stxr(v181 + 1, v176));
  v182 = *v177;
  *(_QWORD *)(v182 + 8) = v178;
  *v178 = v182;
  *v177 = (uint64_t)v178;
  v178[1] = v177;
  ++v177[2];
  v183 = (uint64_t *)v177[4];
  if (v183)
  {
    v184 = v177 + 4;
    v185 = v177[4];
    do
    {
      v186 = *(_DWORD *)(v185 + 32);
      v187 = v186 == 2;
      v188 = v186 < 2;
      if (v186 >= 2)
        v189 = (uint64_t *)v185;
      else
        v189 = (uint64_t *)(v185 + 8);
      if (!v188)
        v184 = (uint64_t *)v185;
      if (v187)
      {
        v189 = (uint64_t *)v185;
        v184 = (uint64_t *)v185;
      }
      v185 = *v189;
    }
    while (*v189);
    if (v184 == v180 || *((_DWORD *)v184 + 8) != 2)
    {
      v190 = *((_DWORD *)v183 + 8);
      while (v190 != 2)
      {
        if (v190 < 3)
        {
          v191 = (uint64_t *)v183[1];
          if (!v191)
          {
            v180 = v183 + 1;
            goto LABEL_313;
          }
        }
        else
        {
          v191 = (uint64_t *)*v183;
          v180 = v183;
          if (!*v183)
            goto LABEL_313;
        }
        v190 = *((_DWORD *)v191 + 8);
        v183 = v191;
      }
    }
    *((_DWORD *)v162 + 16) = 2;
    *(_QWORD *)((char *)v162 + 68) = 0xAAAAAAAAAAAAAA00;
LABEL_316:
    v194 = v175 + 3;
    do
      v195 = __ldxr(v194);
    while (__stxr(v195 + 1, v194));
    *(_QWORD *)&v265 = v162;
    *((_QWORD *)&v265 + 1) = v175;
    do
      v196 = __ldxr(v194);
    while (__stxr(v196 + 1, v194));
    do
    {
      v197 = __ldaxr(v194);
      v198 = v197 - 1;
    }
    while (__stlxr(v198, v194));
    if (!v198)
      (*(void (**)(unsigned int *))(*(_QWORD *)v175 + 24))(v175);
    v199 = (unsigned int *)v278;
    v200 = v254;
    if (v278)
      goto LABEL_324;
  }
  else
  {
    v183 = v177 + 4;
LABEL_313:
    v192 = operator new(0x38uLL);
    v192[4] = 0xAAAAAA0000000002;
    *((_DWORD *)v192 + 10) = -1431655766;
    v192[6] = v179;
    *v192 = 0;
    v192[1] = 0;
    v192[2] = v183;
    *v180 = (uint64_t)v192;
    v193 = *(_QWORD *)v177[3];
    if (v193)
    {
      v177[3] = v193;
      v192 = (_QWORD *)*v180;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v177[4], v192);
    ++v177[5];
    v162 = (_QWORD *)v277;
    v175 = (unsigned int *)v278;
    *(_DWORD *)(v277 + 64) = 2;
    *(_QWORD *)((char *)v162 + 68) = 0xAAAAAAAAAAAAAA00;
    if (v175)
      goto LABEL_316;
    v265 = (unint64_t)v162;
    v199 = (unsigned int *)v278;
    v200 = v254;
    if (v278)
    {
LABEL_324:
      v201 = v199 + 2;
      do
      {
        v202 = __ldaxr(v201);
        v203 = v202 - 1;
      }
      while (__stlxr(v203, v201));
      if (!v203)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v199 + 16))(v199);
        v204 = v199 + 3;
        do
        {
          v205 = __ldaxr(v204);
          v206 = v205 - 1;
        }
        while (__stlxr(v206, v204));
        if (!v206)
          (*(void (**)(unsigned int *))(*(_QWORD *)v199 + 24))(v199);
      }
    }
  }
  pthread_mutex_unlock(v292);
  v207 = (char *)__p;
  if (__p)
  {
    if (v291 - 1 >= 0)
    {
      v208 = (char *)__p + 16 * v291;
      do
      {
        v209 = (unsigned int *)*((_QWORD *)v208 - 1);
        if (v209)
        {
          v210 = v209 + 2;
          do
          {
            v211 = __ldaxr(v210);
            v212 = v211 - 1;
          }
          while (__stlxr(v212, v210));
          if (!v212)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v209 + 16))(v209);
            v213 = v209 + 3;
            do
            {
              v214 = __ldaxr(v213);
              v215 = v214 - 1;
            }
            while (__stlxr(v215, v213));
            if (!v215)
              (*(void (**)(unsigned int *))(*(_QWORD *)v209 + 24))(v209);
          }
        }
        v208 -= 16;
      }
      while (v208 > v207);
    }
    if (v289 >= 0xB)
      operator delete(__p);
  }
  if (*((_QWORD *)&v270 + 1))
  {
    if ((BYTE8(v270) & 1) == 0)
    {
      v216 = *(void (**)(__int128 *, __int128 *, uint64_t))(*((_QWORD *)&v270 + 1) & 0xFFFFFFFFFFFFFFFELL);
      if (v216)
        v216(&v271, &v271, 2);
    }
    *((_QWORD *)&v270 + 1) = 0;
  }
  v217 = v269;
  if (!(_QWORD)v269)
    goto LABEL_371;
  v218 = *((_QWORD *)&v269 + 1);
  v219 = (void *)v269;
  if (*((_QWORD *)&v269 + 1) == (_QWORD)v269)
    goto LABEL_370;
  v220 = *((_QWORD *)&v269 + 1);
  while (2)
  {
    v221 = *(_DWORD *)(v220 - 24);
    v220 -= 24;
    v222 = v221 ^ (v221 >> 31);
    if (v222 == 2)
    {
      v227 = *(_QWORD *)(v218 - 16);
      if (v227)
        (*(void (**)(uint64_t))(*(_QWORD *)v227 + 8))(v227);
    }
    else if (v222 == 1)
    {
      v223 = *(unsigned int **)(v218 - 8);
      if (v223)
      {
        v224 = v223 + 3;
        do
        {
          v225 = __ldaxr(v224);
          v226 = v225 - 1;
        }
        while (__stlxr(v226, v224));
        if (!v226)
          goto LABEL_361;
      }
    }
    else
    {
      v223 = *(unsigned int **)(v218 - 8);
      if (v223)
      {
        v228 = v223 + 3;
        do
        {
          v229 = __ldaxr(v228);
          v230 = v229 - 1;
        }
        while (__stlxr(v230, v228));
        if (!v230)
LABEL_361:
          (*(void (**)(unsigned int *))(*(_QWORD *)v223 + 24))(v223);
      }
    }
    v218 = v220;
    if (v220 != v217)
      continue;
    break;
  }
  v219 = (void *)v269;
LABEL_370:
  *((_QWORD *)&v269 + 1) = v217;
  operator delete(v219);
LABEL_371:
  dispatch_release(v267);
  if (v268)
    _Block_release(v268);
  v231 = (unint64_t *)&v256->__shared_owners_;
  do
    v232 = __ldaxr(v231);
  while (__stlxr(v232 - 1, v231));
  if (v232)
  {
    if (!v200)
      goto LABEL_380;
LABEL_379:
    _Block_release(v200);
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v256->__on_zero_shared)(v256);
    std::__shared_weak_count::__release_weak(v256);
    if (v200)
      goto LABEL_379;
  }
LABEL_380:
  v233 = operator new(0x20uLL);
  v233[1] = v265;
  v265 = 0uLL;
  *((_QWORD *)v233 + 1) = v255 + 27;
  v234 = v255[27];
  *(_QWORD *)v233 = v234;
  *(_QWORD *)(v234 + 8) = v233;
  v255[27] = v233;
  ++v255[29];
  v235 = v264;
  if (v264)
  {
    v236 = (unint64_t *)&v264->__shared_owners_;
    do
      v237 = __ldaxr(v236);
    while (__stlxr(v237 - 1, v236));
    if (!v237)
    {
      ((void (*)(std::__shared_weak_count *))v235->__on_zero_shared)(v235);
      std::__shared_weak_count::__release_weak(v235);
    }
  }
  if (v262)
    std::__shared_weak_count::__release_weak(v262);
  if (v260)
  {
    v238 = &v260->__shared_owners_;
    do
      v239 = __ldaxr((unint64_t *)v238);
    while (__stlxr(v239 - 1, (unint64_t *)v238));
    if (!v239)
    {
      ((void (*)(std::__shared_weak_count *))v260->__on_zero_shared)(v260);
      std::__shared_weak_count::__release_weak(v260);
    }
  }
  v240 = (const void *)*MEMORY[0x24BDFC710];
  v241 = strlen((const char *)*MEMORY[0x24BDFC710]);
  if (v241 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v242 = v241;
  if (v241 >= 0x17)
  {
    v244 = (v241 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v241 | 7) != 0x17)
      v244 = v241 | 7;
    v245 = v244 + 1;
    v243 = operator new(v244 + 1);
    *(_QWORD *)&buf[8] = v242;
    *(_QWORD *)&buf[16] = v245 | 0x8000000000000000;
    *(_QWORD *)buf = v243;
    goto LABEL_399;
  }
  buf[23] = v241;
  v243 = buf;
  if (v241)
LABEL_399:
    memmove(v243, v240, v242);
  v246 = MEMORY[0x24BDAC760];
  v243[v242] = 0;
  support::fs::createDir(buf, 0x1EDu, 1);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v246;
  block[1] = 0x40000000;
  block[2] = ___ZN12TraceManager4initEv_block_invoke_2;
  block[3] = &__block_descriptor_tmp_22;
  block[4] = v255;
  dispatch_async(global_queue, block);
}

void sub_24B930808(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_24B930814(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930820(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B93082C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930838(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930844(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930850(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B93085C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930868(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930874(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  boost::signals2::detail::connection_body_base *v55;
  unsigned int *v56;
  void *v57;

  if (a2)
  {
    if (*(_QWORD *)v56)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100](v56, *(_QWORD *)v56);
      operator delete(*(void **)v56);
    }
    operator delete(v56);
    boost::signals2::detail::connection_body_base::~connection_body_base(v55);
    operator delete(v57);
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a55);
    boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot((uint64_t)&a39);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a37);
    JUMPOUT(0x24B9310B8);
  }
  _Unwind_Resume(a1);
}

void sub_24B9308A4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9308B0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B9308C4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9308D0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9308DC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9308E8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9308F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  if (a2)
  {
    boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::~variant((uint64_t)&a55);
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
    std::__shared_weak_count::__release_weak(a14);
    JUMPOUT(0x24B9310A8);
  }
  _Unwind_Resume(a1);
}

void sub_24B930910(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B93091C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930928(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930934(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930940(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B93094C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930958(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930964(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930970(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B93097C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930988(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930994(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B9309A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *__p)
{
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;

  if (a2)
  {
    __cxa_begin_catch(a1);
    v10 = (unsigned int *)__p[3];
    if (v10)
    {
      v11 = v10 + 2;
      do
      {
        v12 = __ldaxr(v11);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, v11));
      if (!v13)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 16))(v10);
        v14 = v10 + 3;
        do
        {
          v15 = __ldaxr(v14);
          v16 = v15 - 1;
        }
        while (__stlxr(v16, v14));
        if (!v16)
          (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 24))(v10);
      }
    }
    v17 = (unsigned int *)__p[1];
    if (v17)
    {
      v18 = v17 + 2;
      do
      {
        v19 = __ldaxr(v18);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, v18));
      if (!v20)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v17 + 16))(v17);
        v21 = v17 + 3;
        do
        {
          v22 = __ldaxr(v21);
          v23 = v22 - 1;
        }
        while (__stlxr(v23, v21));
        if (!v23)
          (*(void (**)(unsigned int *))(*(_QWORD *)v17 + 24))(v17);
      }
    }
    operator delete(__p);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_24B930A78(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930A84(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930A90(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (a2)
  {
    __cxa_end_catch();
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a55);
    boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot((uint64_t)&a39);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a37);
    JUMPOUT(0x24B9310B8);
  }
  _Unwind_Resume(a1);
}

void sub_24B930AA0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930AAC(_Unwind_Exception *a1, int a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  if (a2)
  {
    __cxa_begin_catch(a1);
    std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy((_QWORD *)v2[4]);
    if (v2[2])
    {
      v3 = (_QWORD *)*v2;
      v4 = (uint64_t *)v2[1];
      v5 = *v4;
      *(_QWORD *)(v5 + 8) = *(_QWORD *)(*v2 + 8);
      *(_QWORD *)v3[1] = v5;
      v2[2] = 0;
      if (v4 != v2)
      {
        do
        {
          v6 = (uint64_t *)v4[1];
          v7 = (unsigned int *)v4[3];
          if (v7)
          {
            v8 = v7 + 2;
            do
            {
              v9 = __ldaxr(v8);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v8));
            if (!v10)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
              v11 = v7 + 3;
              do
              {
                v12 = __ldaxr(v11);
                v13 = v12 - 1;
              }
              while (__stlxr(v13, v11));
              if (!v13)
                (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
            }
          }
          operator delete(v4);
          v4 = v6;
        }
        while (v6 != v2);
      }
    }
    operator delete(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_24B930B74(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930B80(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;

  if (a2)
  {
    __cxa_end_catch();
    v10 = *(unsigned int **)(a10 + 8);
    if (v10)
    {
      v11 = v10 + 2;
      do
      {
        v12 = __ldaxr(v11);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, v11));
      if (!v13)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 16))(v10);
        v14 = v10 + 3;
        do
        {
          v15 = __ldaxr(v14);
          v16 = v15 - 1;
        }
        while (__stlxr(v16, v14));
        if (!v16)
          (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 24))(v10);
      }
    }
    JUMPOUT(0x24B931008);
  }
  _Unwind_Resume(a1);
}

void sub_24B930BEC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930BF8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930C04(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x24B931008);
  _Unwind_Resume(a1);
}

void sub_24B930C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *__p,uint64_t a56,int a57,__int16 a58,char a59,char a60)
{
  if (a60 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void sub_24B930C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,char a25,uint64_t a26,char a27)
{
  boost::signals2::connection::~connection((boost::signals2::connection *)&a27);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  if (a24)
  {
    std::__shared_weak_count::__release_weak(a24);
    std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_24B930C5C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930C68(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    __cxa_begin_catch(a1);
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_24B930C90(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (a2)
  {
    __cxa_end_catch();
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a55);
    boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot((uint64_t)&a39);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a37);
    JUMPOUT(0x24B9310B8);
  }
  _Unwind_Resume(a1);
}

void sub_24B930CA0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930CAC(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);

  if (a2)
  {
    __cxa_begin_catch(a1);
    v3 = *(_QWORD *)(v2 + 24);
    if (v3)
    {
      if ((v3 & 1) == 0)
      {
        v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 & 0xFFFFFFFFFFFFFFFELL);
        if (v4)
          v4(v2 + 32, v2 + 32, 2);
      }
      *(_QWORD *)(v2 + 24) = 0;
    }
    if (*(_QWORD *)v2)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)v2, *(_QWORD *)v2);
      operator delete(*(void **)v2);
    }
    operator delete((void *)v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_24B930D10(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930D1C(_Unwind_Exception *a1, int a2)
{
  boost::signals2::detail::connection_body_base *v2;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  if (a2)
  {
    __cxa_end_catch();
    v3 = (unsigned int *)*((_QWORD *)v2 + 5);
    if (v3)
    {
      v4 = v3 + 2;
      do
      {
        v5 = __ldaxr(v4);
        v6 = v5 - 1;
      }
      while (__stlxr(v6, v4));
      if (!v6)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
        v7 = v3 + 3;
        do
        {
          v8 = __ldaxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
          (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
      }
    }
    boost::signals2::detail::connection_body_base::~connection_body_base(v2);
    JUMPOUT(0x24B931008);
  }
  _Unwind_Resume(a1);
}

void sub_24B930D84(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930D90(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930D9C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x24B930DA4);
  _Unwind_Resume(a1);
}

void sub_24B930DB0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x24B930DB8);
  _Unwind_Resume(a1);
}

void sub_24B930DC4(_Unwind_Exception *a1, int a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

  if (a2)
  {
    v2 = STACK[0x218];
    if (STACK[0x218])
    {
      if ((uint64_t)(STACK[0x220] - 1) >= 0)
      {
        v3 = v2 + 16 * STACK[0x220];
        do
        {
          v4 = *(unsigned int **)(v3 - 8);
          if (v4)
          {
            v5 = v4 + 2;
            do
            {
              v6 = __ldaxr(v5);
              v7 = v6 - 1;
            }
            while (__stlxr(v7, v5));
            if (!v7)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
              v8 = v4 + 3;
              do
              {
                v9 = __ldaxr(v8);
                v10 = v9 - 1;
              }
              while (__stlxr(v10, v8));
              if (!v10)
                (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 24))(v4);
            }
          }
          v3 -= 16;
        }
        while (v3 > v2);
      }
      if (STACK[0x210] >= 0xB)
        operator delete((void *)STACK[0x218]);
    }
    JUMPOUT(0x24B9310A8);
  }
  _Unwind_Resume(a1);
}

void sub_24B930E68(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930E74(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x24B930E84);
  _Unwind_Resume(a1);
}

void sub_24B930E94(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x24B930E9CLL);
  _Unwind_Resume(a1);
}

void sub_24B930EA8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930EC8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930ED4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930EE0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930EEC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (a2)
  {
    boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::~shared_ptr((uint64_t)&a51);
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a55);
    boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot((uint64_t)&a39);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a37);
    JUMPOUT(0x24B9310B8);
  }
  _Unwind_Resume(a1);
}

void sub_24B930F04(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  void (*v55)(uint64_t *, uint64_t *, uint64_t);

  if (a2)
  {
    boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::~function1(&a55);
    boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(&a51);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a49);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot((uint64_t)&a47);
    if (a42)
    {
      if ((a42 & 1) == 0)
      {
        v55 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(a42 & 0xFFFFFFFFFFFFFFFELL);
        if (v55)
          v55(&a43, &a43, 2);
      }
      a42 = 0;
    }
    if (__p)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)&__p, (uint64_t)__p);
      operator delete(__p);
    }
    JUMPOUT(0x24B9310B0);
  }
  _Unwind_Resume(a1);
}

void sub_24B930F88(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930F94(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930FA4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B930FB0(_Unwind_Exception *a1, int a2)
{
  uint64_t *v2;
  _QWORD *v3;

  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy(v3);
    std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~list(v2);
    operator delete(v2);
    JUMPOUT(0x24B931004);
  }
  _Unwind_Resume(a1);
}

void sub_24B931084(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_24B931090(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  if (!a2)
    JUMPOUT(0x24B931098);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock(&a55);
  boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot(&a39);
  ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot(&a37);
  JUMPOUT(0x24B9310B8);
}

void TraceManager::handleDumpLogsIndication_sync(uint64_t a1, const __CFDictionary **a2)
{
  NSObject *v4;
  const void *v5;
  size_t v6;
  std::string::size_type v7;
  std::string *p_dst;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  uint64_t (*v12)(uint64_t);
  const void *v13;
  size_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  std::string::size_type v21;
  const char *v22;
  const char *v23;
  int v24;
  size_t v25;
  void **v26;
  xpc_object_t v27;
  xpc_object_t v28;
  std::string *v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  void **v34;
  xpc_object_t v35;
  xpc_object_t v36;
  const void *v37;
  size_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const void *v43;
  xpc_object_t object;
  void *__p[2];
  unint64_t v46;
  void *v47[3];
  _QWORD v48[2];
  std::string __dst;
  uint8_t buf[32];

  v4 = *(NSObject **)(a1 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v4, OS_LOG_TYPE_DEFAULT, "#I Received Dump logs indication from Baseband", buf, 2u);
  }
  memset(buf, 170, 24);
  Timestamp::Timestamp((Timestamp *)buf);
  memset(&__dst, 170, sizeof(__dst));
  v5 = (const void *)*MEMORY[0x24BE04E40];
  v6 = strlen((const char *)*MEMORY[0x24BE04E40]);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_10;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_10:
    memmove(p_dst, v5, v7);
  p_dst->__r_.__value_.__s.__data_[v7] = 0;
  v11 = *a2;
  v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!*a2)
    v12 = 0;
  if (v12)
  {
    v48[0] = 0xAAAAAAAAAAAAAAAALL;
    v48[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v48, v11);
    v13 = (const void *)*MEMORY[0x24BE04EC0];
    v14 = strlen((const char *)*MEMORY[0x24BE04EC0]);
    if (v14 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v15 = (void *)v14;
    if (v14 >= 0x17)
    {
      v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v18 = v14 | 7;
      v19 = v18 + 1;
      v16 = operator new(v18 + 1);
      __p[1] = v15;
      v46 = v19 | 0x8000000000000000;
      __p[0] = v16;
    }
    else
    {
      HIBYTE(v46) = v14;
      v16 = __p;
      if (!v14)
      {
LABEL_23:
        *((_BYTE *)v15 + (_QWORD)v16) = 0;
        ctu::cf::map_adapter::getString();
        if (SHIBYTE(v47[2]) >= 0)
          v20 = v47;
        else
          v20 = (void **)v47[0];
        if (SHIBYTE(v47[2]) >= 0)
          v21 = HIBYTE(v47[2]);
        else
          v21 = (std::string::size_type)v47[1];
        std::string::append(&__dst, (const std::string::value_type *)v20, v21);
        if (SHIBYTE(v47[2]) < 0)
        {
          operator delete(v47[0]);
          if ((SHIBYTE(v46) & 0x80000000) == 0)
            goto LABEL_31;
        }
        else if ((SHIBYTE(v46) & 0x80000000) == 0)
        {
          goto LABEL_31;
        }
        operator delete(__p[0]);
LABEL_31:
        memset(v47, 170, sizeof(v47));
        HIBYTE(v46) = 0;
        LOBYTE(__p[0]) = 0;
        ctu::cf::map_adapter::getString();
        if (SHIBYTE(v46) < 0)
          operator delete(__p[0]);
        LODWORD(__p[0]) = 1;
        v22 = (const char *)radio::asString();
        v23 = v22;
        v24 = SHIBYTE(v47[2]);
        if (SHIBYTE(v47[2]) >= 0)
          v25 = HIBYTE(v47[2]);
        else
          v25 = (size_t)v47[1];
        if (v25 == strlen(v22))
        {
          if (SHIBYTE(v47[2]) >= 0)
            v26 = v47;
          else
            v26 = (void **)v47[0];
          if (!memcmp(v26, v23, v25))
            v17 = 5;
          else
            v17 = 2;
          if ((v24 & 0x80000000) == 0)
            goto LABEL_47;
        }
        else
        {
          v17 = 2;
          if ((SHIBYTE(v47[2]) & 0x80000000) == 0)
          {
LABEL_47:
            MEMORY[0x24BD294A8](v48);
            goto LABEL_48;
          }
        }
        operator delete(v47[0]);
        goto LABEL_47;
      }
    }
    memmove(v16, v13, (size_t)v15);
    goto LABEL_23;
  }
  v17 = 2;
LABEL_48:
  v27 = xpc_dictionary_create(0, 0, 0);
  if (v27 || (v27 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v27) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v27);
      v28 = v27;
    }
    else
    {
      v28 = xpc_null_create();
    }
  }
  else
  {
    v28 = xpc_null_create();
    v27 = 0;
  }
  xpc_release(v27);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = &__dst;
  else
    v29 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  v30 = xpc_string_create((const char *)v29);
  if (!v30)
    v30 = xpc_null_create();
  xpc_dictionary_set_value(v28, (const char *)*MEMORY[0x24BE053F0], v30);
  v31 = xpc_null_create();
  xpc_release(v30);
  xpc_release(v31);
  v32 = xpc_int64_create(v17);
  if (!v32)
    v32 = xpc_null_create();
  xpc_dictionary_set_value(v28, (const char *)*MEMORY[0x24BE04E78], v32);
  v33 = xpc_null_create();
  xpc_release(v32);
  xpc_release(v33);
  Timestamp::asString((uint64_t)buf, 0, 9, v47);
  if (SHIBYTE(v47[2]) >= 0)
    v34 = v47;
  else
    v34 = (void **)v47[0];
  v35 = xpc_string_create((const char *)v34);
  if (!v35)
    v35 = xpc_null_create();
  xpc_dictionary_set_value(v28, (const char *)*MEMORY[0x24BE05090], v35);
  v36 = xpc_null_create();
  xpc_release(v35);
  xpc_release(v36);
  if (SHIBYTE(v47[2]) < 0)
    operator delete(v47[0]);
  v37 = (const void *)*MEMORY[0x24BE05200];
  v38 = strlen((const char *)*MEMORY[0x24BE05200]);
  if (v38 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v39 = (void *)v38;
  if (v38 >= 0x17)
  {
    v41 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v38 | 7) != 0x17)
      v41 = v38 | 7;
    v42 = v41 + 1;
    v40 = operator new(v41 + 1);
    v47[1] = v39;
    v47[2] = (void *)(v42 | 0x8000000000000000);
    v47[0] = v40;
LABEL_78:
    memmove(v40, v37, (size_t)v39);
    *((_BYTE *)v39 + (_QWORD)v40) = 0;
    object = v28;
    if (v28)
      goto LABEL_74;
    goto LABEL_79;
  }
  HIBYTE(v47[2]) = v38;
  v40 = v47;
  if (v38)
    goto LABEL_78;
  LOBYTE(v47[0]) = 0;
  object = v28;
  if (v28)
  {
LABEL_74:
    xpc_retain(v28);
    goto LABEL_80;
  }
LABEL_79:
  object = xpc_null_create();
LABEL_80:
  v43 = 0;
  Service::runCommand(a1, (uint64_t)v47, &object, &v43);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v47[2]) < 0)
    operator delete(v47[0]);
  xpc_release(v28);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)buf, *(_QWORD **)&buf[8]);
}

void sub_24B93166C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  if (a23 < 0)
    operator delete(__p);
  MEMORY[0x24BD294A8](&a24);
  if (a31 < 0)
  {
    operator delete(a26);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v31 - 96, *(_QWORD **)(v31 - 88));
    _Unwind_Resume(a1);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v31 - 96, *(_QWORD **)(v31 - 88));
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager4initEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  size_t v3;
  size_t v4;
  void *p_p;
  uint64_t v6;
  uint64_t v7;
  config::hw *v8;
  const void *v9;
  size_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  const char *v17;
  void *__p;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (const void *)*MEMORY[0x24BDFC710];
  v3 = strlen((const char *)*MEMORY[0x24BDFC710]);
  if (v3 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    p_p = operator new(v6 + 1);
    *(_QWORD *)&v19 = v4;
    *((_QWORD *)&v19 + 1) = v7 | 0x8000000000000000;
    __p = p_p;
    goto LABEL_8;
  }
  HIBYTE(v19) = v3;
  p_p = &__p;
  if (v3)
LABEL_8:
    memmove(p_p, v2, v4);
  *((_BYTE *)p_p + v4) = 0;
  v8 = (config::hw *)support::fs::removeDirContents((const char *)&__p, 0);
  if (SHIBYTE(v19) < 0)
    operator delete(__p);
  if (config::hw::watch(v8)
    && (TelephonyUtilIsInternalBuild() & 1) == 0
    && (TelephonyUtilIsCarrierBuild() & 1) == 0)
  {
    v9 = (const void *)*MEMORY[0x24BDFC720];
    v10 = strlen((const char *)*MEMORY[0x24BDFC720]);
    if (v10 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v11 = v10;
    if (v10 >= 0x17)
    {
      v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17)
        v13 = v10 | 7;
      v14 = v13 + 1;
      v12 = operator new(v13 + 1);
      *(_QWORD *)&v19 = v11;
      *((_QWORD *)&v19 + 1) = v14 | 0x8000000000000000;
      __p = v12;
    }
    else
    {
      HIBYTE(v19) = v10;
      v12 = &__p;
      if (!v10)
        goto LABEL_22;
    }
    memmove(v12, v9, v11);
LABEL_22:
    *((_BYTE *)v12 + v11) = 0;
    v15 = support::fs::removeDirContents((const char *)&__p, 0x708uLL);
    if (SHIBYTE(v19) < 0)
      operator delete(__p);
    v16 = *(NSObject **)(v1 + 88);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "failed";
      if (v15)
        v17 = "success";
      __p = (void *)0x1E04000202;
      LOWORD(v19) = 2080;
      *(_QWORD *)((char *)&v19 + 2) = v17;
      _os_log_impl(&dword_24B855000, v16, OS_LOG_TYPE_DEFAULT, "#I Deleting telephony log files older than %d mins %s", (uint8_t *)&__p, 0x12u);
    }
  }
}

void sub_24B9319D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void TraceManager::setupDumpLogsIndication_sync(NSObject **this)
{
  CommandDriverFactory *v2;
  uint64_t v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  uint8_t buf[16];

  if (!capabilities::trace::supportsDumpLogIndication((capabilities::trace *)this))
    return;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v2 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  v3 = off_2579B85E0;
  if (!off_2579B85E0)
  {
    CommandDriverFactory::create_default_global(v2);
    v4 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v5 = (std::__shared_weak_count *)*(&off_2579B85E0 + 1);
    off_2579B85E0 = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v3 = off_2579B85E0;
  }
  v8 = (std::__shared_weak_count *)*(&off_2579B85E0 + 1);
  if (*(&off_2579B85E0 + 1))
  {
    v9 = (unint64_t *)(*(&off_2579B85E0 + 1) + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(_QWORD *)v3 + 16))(&v18, v3);
  v20 = 0;
  v21 = 0;
  if (v19)
  {
    v21 = std::__shared_weak_count::lock(v19);
    if (v21)
      v20 = v18;
    if (v19)
      std::__shared_weak_count::__release_weak(v19);
  }
  if (!v8)
    goto LABEL_21;
  v11 = (unint64_t *)&v8->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    v13 = v20;
    if (v20)
      goto LABEL_22;
  }
  else
  {
LABEL_21:
    v13 = v20;
    if (v20)
    {
LABEL_22:
      v14 = this[11];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B855000, v14, OS_LOG_TYPE_DEFAULT, "#I Enabling Dump logs indication", buf, 2u);
      }
      (*(void (**)(unint64_t))(*(_QWORD *)v13 + 200))(v13);
    }
  }
  v15 = v21;
  if (v21)
  {
    v16 = (unint64_t *)&v21->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_24B931C28(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B931C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B931C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

xpc::dict *xpc::dict::dict(xpc::dict *this, xpc_object_t object)
{
  *(_QWORD *)this = object;
  if (object)
    xpc_retain(object);
  else
    *(_QWORD *)this = xpc_null_create();
  return this;
}

const char *TraceManager::getName(TraceManager *this)
{
  return "trace.mgr";
}

char *TraceManager::getShutdownStages@<X0>(_QWORD *a1@<X8>)
{
  char *result;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  result = (char *)operator new(3uLL);
  a1[1] = result + 3;
  a1[2] = result + 3;
  *(_WORD *)result = 512;
  result[2] = 3;
  *a1 = result;
  return result;
}

void TraceManager::shutdown(uint64_t a1, int a2, NSObject **a3)
{
  uint64_t *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t *v8;
  NSObject *v9;
  _QWORD v10[5];
  dispatch_group_t group;
  _QWORD v12[5];
  dispatch_group_t object;
  _QWORD v14[5];
  dispatch_group_t v15;

  if (a2 == 3)
  {
    v6 = (uint64_t *)(a1 + 120);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1174405120;
    v10[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_12;
    v10[3] = &__block_descriptor_tmp_13_6;
    v7 = *a3;
    v10[4] = a1;
    group = v7;
    if (v7)
    {
      dispatch_retain(v7);
      dispatch_group_enter(v7);
    }
    ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v6, (uint64_t)v10);
    if (group)
    {
      dispatch_group_leave(group);
      v5 = group;
      if (group)
        goto LABEL_18;
    }
  }
  else
  {
    if (a2 != 2)
    {
      if (a2)
        return;
      v3 = (uint64_t *)(a1 + 120);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 1174405120;
      v14[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke;
      v14[3] = &__block_descriptor_tmp_9_5;
      v4 = *a3;
      v14[4] = a1;
      v15 = v4;
      if (v4)
      {
        dispatch_retain(v4);
        dispatch_group_enter(v4);
      }
      ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v3, (uint64_t)v14);
      if (!v15)
        return;
      dispatch_group_leave(v15);
      v5 = v15;
      if (!v15)
        return;
LABEL_18:
      dispatch_release(v5);
      return;
    }
    v8 = (uint64_t *)(a1 + 120);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1174405120;
    v12[2] = ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_10;
    v12[3] = &__block_descriptor_tmp_11_6;
    v9 = *a3;
    v12[4] = a1;
    object = v9;
    if (v9)
    {
      dispatch_retain(v9);
      dispatch_group_enter(v9);
    }
    ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v8, (uint64_t)v12);
    if (object)
    {
      dispatch_group_leave(object);
      v5 = object;
      if (object)
        goto LABEL_18;
    }
  }
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  xpc_object_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6[2];
  NSObject *v7;
  xpc_object_t object;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = xpc_null_create();
  v4 = *MEMORY[0x24BDFC820];
  v5 = *(NSObject **)(a1 + 40);
  v7 = v5;
  object = v3;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v6[0] = 0;
  v6[1] = 0;
  TraceManager::runOnHelper_sync(v2, (const char *)9, v4, 0x1F40u, 0, &object, &v7, v6);
  if (v5)
  {
    dispatch_group_leave(v5);
    dispatch_release(v5);
  }
  xpc_release(object);
}

void sub_24B931F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  NSObject *v12;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v12)
  {
    dispatch_group_leave(v12);
    dispatch_release(v12);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void TraceManager::runOnHelper_sync(_QWORD *a1, const char *a2, uint64_t a3, unsigned int a4, char a5, xpc_object_t *a6, NSObject **a7, void **a8)
{
  int v13;
  const char *v15;
  const char *v16;
  NSObject *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  void *v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_weak_owners;
  unint64_t v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  unint64_t *v45;
  unint64_t v46;
  void *v47;
  NSObject *v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  NSObject *v53;
  unint64_t *v54;
  unint64_t v55;
  const void *v56;
  NSObject *object;
  xpc_object_t v58;
  _QWORD aBlock[6];
  std::__shared_weak_count *v60;
  dispatch_group_t group;
  unint64_t v62;
  std::__shared_weak_count *v63;
  uint64_t v64;
  int v65;
  void *v66;
  dispatch_object_t v67;
  xpc_object_t v68;
  __int128 v69;
  unint64_t v70;
  unint64_t v71;
  _BYTE buf[24];
  void *v73;
  __int128 *v74;
  uint64_t v75;

  v13 = (int)a2;
  v75 = *MEMORY[0x24BDAC8D0];
  if ((a5 & 1) == 0
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04EE8], a2)
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE05920], v15)
    && !prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04F58], v16))
  {
    return;
  }
  v17 = a1[11];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = abm::helper::asString();
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_24B855000, v17, OS_LOG_TYPE_DEFAULT, "#I Running helper action: %s:%s", buf, 0x16u);
  }
  v70 = 0xAAAAAAAAAAAAAAAALL;
  v71 = 0xAAAAAAAAAAAAAAAALL;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  v19 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 0x40000000;
  *(_QWORD *)&buf[16] = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v73 = &__block_descriptor_tmp_13_5;
  v74 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v20 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v69 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, buf);
    v20 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v69 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_12;
  }
  v21 = (unint64_t *)(v20 + 8);
  do
    v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
LABEL_12:
  abm::HelperClient::create();
  if (*((_QWORD *)&v69 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v69 + 1) + 16))(*((_QWORD *)&v69 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v69 + 1));
    }
  }
  v25 = MEMORY[0x24BD2A468](*a6);
  v26 = MEMORY[0x24BDACFA0];
  if (v25 != MEMORY[0x24BDACFA0])
  {
    v27 = xpc_dictionary_create(0, 0, 0);
    if (v27 || (v27 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD2A468](v27) == v26)
      {
        xpc_retain(v27);
        v28 = v27;
      }
      else
      {
        v28 = xpc_null_create();
      }
    }
    else
    {
      v28 = xpc_null_create();
      v27 = 0;
    }
    xpc_release(v27);
    v29 = xpc_null_create();
    v30 = *a6;
    *a6 = v28;
    xpc_release(v30);
    xpc_release(v29);
  }
  if (a4)
  {
    v31 = xpc_int64_create(a4);
    if (!v31)
      v31 = xpc_null_create();
    xpc_dictionary_set_value(*a6, (const char *)*MEMORY[0x24BDFC790], v31);
    v32 = xpc_null_create();
    xpc_release(v31);
    xpc_release(v32);
  }
  if (!*a8 || !a8[1])
  {
    v35 = (std::__shared_weak_count *)a1[16];
    if (!v35 || (v36 = a1[15], (v37 = std::__shared_weak_count::lock(v35)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v38 = v37;
    p_shared_weak_owners = (unint64_t *)&v37->__shared_weak_owners_;
    do
      v40 = __ldxr(p_shared_weak_owners);
    while (__stxr(v40 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v42 = __ldaxr(p_shared_owners);
    while (__stlxr(v42 - 1, p_shared_owners));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v38);
    }
    memset(buf, 170, 16);
    aBlock[0] = v19;
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TraceManager16runOnHelper_syncEN3abm6helper6TaskIDEPKcjbN3xpc4dictEN8dispatch13group_sessionENS7_8callbackIU13block_pointerFvN12TelephonyXPC6ResultES6_EEE_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_70_1;
    aBlock[4] = a1;
    aBlock[5] = v36;
    v60 = v38;
    do
      v43 = __ldxr(p_shared_weak_owners);
    while (__stxr(v43 + 1, p_shared_weak_owners));
    v44 = *a7;
    group = v44;
    if (v44)
    {
      dispatch_retain(v44);
      dispatch_group_enter(group);
    }
    v62 = v70;
    v63 = (std::__shared_weak_count *)v71;
    if (v71)
    {
      v45 = (unint64_t *)(v71 + 8);
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    v65 = v13;
    v64 = a3;
    v47 = _Block_copy(aBlock);
    v48 = a1[17];
    if (v48)
      dispatch_retain(v48);
    *(_QWORD *)buf = v47;
    *(_QWORD *)&buf[8] = v48;
    v58 = *a6;
    if (*a6)
    {
      xpc_retain(*a6);
      if (v47)
        goto LABEL_53;
    }
    else
    {
      v58 = xpc_null_create();
      if (v47)
      {
LABEL_53:
        v56 = _Block_copy(v47);
        object = v48;
        if (!v48)
          goto LABEL_55;
        goto LABEL_54;
      }
    }
    v56 = 0;
    object = v48;
    if (!v48)
    {
LABEL_55:
      abm::HelperClient::perform();
      if (object)
        dispatch_release(object);
      if (v56)
        _Block_release(v56);
      xpc_release(v58);
      if (v48)
        dispatch_release(v48);
      if (v47)
        _Block_release(v47);
      v49 = v63;
      if (v63)
      {
        v50 = (unint64_t *)&v63->__shared_owners_;
        do
          v51 = __ldaxr(v50);
        while (__stlxr(v51 - 1, v50));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v60)
        std::__shared_weak_count::__release_weak(v60);
      std::__shared_weak_count::__release_weak(v38);
      v52 = (std::__shared_weak_count *)v71;
      if (v71)
        goto LABEL_87;
      return;
    }
LABEL_54:
    dispatch_retain(v48);
    goto LABEL_55;
  }
  v33 = *a6;
  v68 = v33;
  if (!v33)
  {
    v68 = xpc_null_create();
    v34 = *a8;
    if (!*a8)
      goto LABEL_80;
    goto LABEL_79;
  }
  xpc_retain(v33);
  v34 = *a8;
  if (*a8)
LABEL_79:
    v34 = _Block_copy(v34);
LABEL_80:
  v53 = a8[1];
  v66 = v34;
  v67 = v53;
  if (v53)
    dispatch_retain(v53);
  abm::HelperClient::perform();
  if (v67)
    dispatch_release(v67);
  if (v66)
    _Block_release(v66);
  xpc_release(v68);
  v68 = 0;
  v52 = (std::__shared_weak_count *)v71;
  if (v71)
  {
LABEL_87:
    v54 = (unint64_t *)&v52->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
}

void sub_24B9325A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, dispatch_group_t group, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,xpc_object_t object,char a27,uint64_t a28,char a29)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void sub_24B9326D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a29);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  const char *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10[2];
  NSObject *v11;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v3) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v3);
      v4 = v3;
    }
    else
    {
      v4 = xpc_null_create();
    }
  }
  else
  {
    v4 = xpc_null_create();
    v3 = 0;
  }
  xpc_release(v3);
  v5 = (const char *)(v2 + 168);
  if (*(char *)(v2 + 191) < 0)
    v5 = *(const char **)v5;
  v6 = xpc_string_create(v5);
  if (!v6)
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE05060], v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  object = v4;
  if (v4)
  {
    xpc_retain(v4);
    v8 = *MEMORY[0x24BDFC898];
    v9 = *(NSObject **)(a1 + 40);
    v11 = v9;
    if (!v9)
      goto LABEL_14;
    goto LABEL_13;
  }
  object = xpc_null_create();
  v8 = *MEMORY[0x24BDFC898];
  v9 = *(NSObject **)(a1 + 40);
  v11 = v9;
  if (v9)
  {
LABEL_13:
    dispatch_retain(v9);
    dispatch_group_enter(v9);
  }
LABEL_14:
  v10[0] = 0;
  v10[1] = 0;
  TraceManager::runOnHelper_sync((_QWORD *)v2, (const char *)9, v8, 0x1388u, 0, &object, &v11, v10);
  if (v9)
  {
    dispatch_group_leave(v9);
    dispatch_release(v9);
  }
  xpc_release(object);
  object = 0;
  xpc_release(v4);
}

void sub_24B93289C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  void *v12;
  NSObject *v13;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v13)
  {
    dispatch_group_leave(v13);
    dispatch_release(v13);
  }
  xpc_release(object);
  object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager8shutdownE13ShutdownStageN8dispatch13group_sessionE_block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(std::__shared_weak_count **)(v1 + 160);
  *(_QWORD *)(v1 + 152) = 0;
  *(_QWORD *)(v1 + 160) = 0;
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
}

void TraceManager::initialize(_QWORD *a1, NSObject **a2)
{
  uint64_t *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  _QWORD *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD v15[5];
  dispatch_group_t group;

  v3 = a1 + 15;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1174405120;
  v15[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke;
  v15[3] = &__block_descriptor_tmp_35_2;
  v4 = *a2;
  v15[4] = a1;
  group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  ctu::SharedSynchronizable<TraceManager>::execute_wrapped(v3, (uint64_t)v15);
  v5 = (std::__shared_weak_count *)a1[16];
  if (!v5 || (v6 = a1[15], (v7 = std::__shared_weak_count::lock(v5)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v8 = v7;
  v9 = operator new(8uLL);
  *v9 = a1;
  v10 = a1[17];
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  v13 = operator new(0x18uLL);
  *v13 = v9;
  v13[1] = v6;
  v13[2] = v8;
  dispatch_async_f(v10, v13, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::initialize(dispatch::group_session)::$_0>(TraceManager::initialize(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::initialize(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::initialize(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  const char *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  const void *v21;
  unint64_t v22;
  void *v23;
  const void *v24;
  size_t v25;
  size_t v26;
  void **p_dst;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  const void *v32;
  size_t v33;
  size_t v34;
  void **v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  const void *v40;
  size_t v41;
  size_t v42;
  void **v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  _QWORD v48[6];
  std::__shared_weak_count *v49;
  const void *v50;
  _QWORD v51[6];
  std::__shared_weak_count *v52;
  const void *v53;
  _QWORD v54[6];
  std::__shared_weak_count *v55;
  const void *v56;
  _QWORD aBlock[5];
  void **__dst;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  const void *v64;
  dispatch_object_t v65;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(std::__shared_weak_count **)(v1 + 128);
  if (!v2 || (v3 = *(_QWORD *)(v1 + 120), (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v7 = __ldxr(p_shared_weak_owners);
  while (__stxr(v7 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  TraceManager::initTraceHelper_sync((TraceManager *)v1);
  v10 = *(std::__shared_weak_count **)(v1 + 128);
  if (!v10 || (v11 = *(_QWORD *)(v1 + 120), (v12 = std::__shared_weak_count::lock(v10)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v13 = v12;
  v14 = (const char *)*MEMORY[0x24BE053C8];
  v15 = (unint64_t *)&v12->__shared_weak_owners_;
  do
    v16 = __ldxr(v15);
  while (__stxr(v16 + 1, v15));
  v17 = (unint64_t *)&v12->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v13);
  }
  v19 = *(NSObject **)(v1 + 136);
  if (v19)
    dispatch_retain(*(dispatch_object_t *)(v1 + 136));
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2;
  aBlock[3] = &__block_descriptor_tmp_15_5;
  aBlock[4] = v1;
  if (v14)
  {
    if (v19)
    {
      v20 = _Block_copy(aBlock);
      v21 = v20;
      v65 = v19;
      __dst = (void **)MEMORY[0x24BDAC760];
      v59 = 1174405120;
      v60 = (unint64_t)___ZN9analytics29registerCallbackForTimedEventI12TraceManagerEEvPKcNS_9TimerTypeENSt3__18weak_ptrIT_EEN8dispatch5queueEU13block_pointerFvNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_block_invoke;
      v61 = &__block_descriptor_tmp_91_0;
      v62 = v11;
      v63 = v13;
      do
        v22 = __ldxr(v15);
      while (__stxr(v22 + 1, v15));
      if (v20)
        v23 = _Block_copy(v20);
      else
        v23 = 0;
      v64 = v23;
      analytics::registerCallbackForTimedEventImpl(v14);
      if (v65)
        dispatch_release(v65);
      if (v64)
        _Block_release(v64);
      if (v63)
        std::__shared_weak_count::__release_weak(v63);
      if (v21)
        _Block_release(v21);
    }
  }
  else if (v19)
  {
    dispatch_release(v19);
  }
  std::__shared_weak_count::__release_weak(v13);
  v24 = (const void *)*MEMORY[0x24BE05738];
  v25 = strlen((const char *)*MEMORY[0x24BE05738]);
  if (v25 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v26 = v25;
  if (v25 >= 0x17)
  {
    v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v28 = v25 | 7;
    v29 = v28 + 1;
    p_dst = (void **)operator new(v28 + 1);
    v59 = v26;
    v60 = v29 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v60) = v25;
    p_dst = (void **)&__dst;
    if (!v25)
      goto LABEL_44;
  }
  memmove(p_dst, v24, v26);
LABEL_44:
  *((_BYTE *)p_dst + v26) = 0;
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 1174405120;
  v54[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_3;
  v54[3] = &__block_descriptor_tmp_22_4;
  v54[4] = v1;
  v54[5] = v3;
  v55 = v5;
  do
    v30 = __ldxr(p_shared_weak_owners);
  while (__stxr(v30 + 1, p_shared_weak_owners));
  v31 = _Block_copy(v54);
  v56 = v31;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v56);
  if (v31)
    _Block_release(v31);
  if (SHIBYTE(v60) < 0)
    operator delete(__dst);
  v32 = (const void *)*MEMORY[0x24BE05728];
  v33 = strlen((const char *)*MEMORY[0x24BE05728]);
  if (v33 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v34 = v33;
  if (v33 >= 0x17)
  {
    v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17)
      v36 = v33 | 7;
    v37 = v36 + 1;
    v35 = (void **)operator new(v36 + 1);
    v59 = v34;
    v60 = v37 | 0x8000000000000000;
    __dst = v35;
  }
  else
  {
    HIBYTE(v60) = v33;
    v35 = (void **)&__dst;
    if (!v33)
      goto LABEL_58;
  }
  memmove(v35, v32, v34);
LABEL_58:
  *((_BYTE *)v35 + v34) = 0;
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 1174405120;
  v51[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_23;
  v51[3] = &__block_descriptor_tmp_30_3;
  v51[4] = v1;
  v51[5] = v3;
  v52 = v5;
  do
    v38 = __ldxr(p_shared_weak_owners);
  while (__stxr(v38 + 1, p_shared_weak_owners));
  v39 = _Block_copy(v51);
  v53 = v39;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v53);
  if (v39)
    _Block_release(v39);
  if (SHIBYTE(v60) < 0)
    operator delete(__dst);
  v40 = (const void *)*MEMORY[0x24BE05690];
  v41 = strlen((const char *)*MEMORY[0x24BE05690]);
  if (v41 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v42 = v41;
  if (v41 >= 0x17)
  {
    v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17)
      v44 = v41 | 7;
    v45 = v44 + 1;
    v43 = (void **)operator new(v44 + 1);
    v59 = v42;
    v60 = v45 | 0x8000000000000000;
    __dst = v43;
  }
  else
  {
    HIBYTE(v60) = v41;
    v43 = (void **)&__dst;
    if (!v41)
      goto LABEL_72;
  }
  memmove(v43, v40, v42);
LABEL_72:
  *((_BYTE *)v43 + v42) = 0;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 1174405120;
  v48[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_31;
  v48[3] = &__block_descriptor_tmp_34_2;
  v48[4] = v1;
  v48[5] = v3;
  v49 = v5;
  do
    v46 = __ldxr(p_shared_weak_owners);
  while (__stxr(v46 + 1, p_shared_weak_owners));
  v47 = _Block_copy(v48);
  v50 = v47;
  Service::registerCommandHandler(v1, (uint64_t)&__dst, &v50);
  if (v47)
    _Block_release(v47);
  if (SHIBYTE(v60) < 0)
    operator delete(__dst);
  if (v49)
    std::__shared_weak_count::__release_weak(v49);
  if (v52)
    std::__shared_weak_count::__release_weak(v52);
  if (v55)
    std::__shared_weak_count::__release_weak(v55);
  std::__shared_weak_count::__release_weak(v5);
}

void sub_24B93301C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::__shared_weak_count *a31)
{
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  const void *v33;
  uint64_t v34;
  const void *v36;
  std::__shared_weak_count *v37;
  NSObject *v38;

  v36 = *(const void **)(v34 - 120);
  if (v36)
    _Block_release(v36);
  v37 = *(std::__shared_weak_count **)(v34 - 128);
  if (v37)
  {
    std::__shared_weak_count::__release_weak(v37);
    v38 = *(NSObject **)(v34 - 112);
    if (!v38)
    {
LABEL_5:
      if (!v33)
      {
LABEL_10:
        std::__shared_weak_count::__release_weak(v32);
        std::__shared_weak_count::__release_weak(v31);
        _Unwind_Resume(a1);
      }
LABEL_9:
      _Block_release(v33);
      goto LABEL_10;
    }
  }
  else
  {
    v38 = *(NSObject **)(v34 - 112);
    if (!v38)
      goto LABEL_5;
  }
  dispatch_release(v38);
  if (!v33)
    goto LABEL_10;
  goto LABEL_9;
}

void sub_24B933184(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void TraceManager::initTraceHelper_sync(TraceManager *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const void *v16;
  NSObject *object;
  __int128 v18;
  _QWORD aBlock[6];
  std::__shared_weak_count *v20;
  const void *v21;
  dispatch_object_t v22;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 16);
  if (!v2 || (v3 = *((_QWORD *)this + 15), (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v7 = __ldxr(p_shared_weak_owners);
  while (__stxr(v7 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  v21 = (const void *)0xAAAAAAAAAAAAAAAALL;
  v22 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager20initTraceHelper_syncEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_69_0;
  aBlock[4] = this;
  aBlock[5] = v3;
  v20 = v5;
  do
    v10 = __ldxr(p_shared_weak_owners);
  while (__stxr(v10 + 1, p_shared_weak_owners));
  v11 = _Block_copy(aBlock);
  v12 = *((_QWORD *)this + 17);
  if (v12)
    dispatch_retain(*((dispatch_object_t *)this + 17));
  v21 = v11;
  v22 = v12;
  if (!v11)
  {
    v16 = 0;
    object = v12;
    if (!v12)
      goto LABEL_16;
    goto LABEL_15;
  }
  v16 = _Block_copy(v11);
  object = v12;
  if (v12)
LABEL_15:
    dispatch_retain(v12);
LABEL_16:
  abm::HelperClient::registerForHelperReady();
  v13 = (std::__shared_weak_count *)*((_QWORD *)this + 31);
  *((_OWORD *)this + 15) = v18;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (object)
    dispatch_release(object);
  if (v16)
    _Block_release(v16);
  if (v22)
    dispatch_release(v22);
  if (v21)
    _Block_release(v21);
  if (v20)
    std::__shared_weak_count::__release_weak(v20);
  std::__shared_weak_count::__release_weak(v5);
}

void sub_24B9333AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  std::__shared_weak_count *v20;
  uint64_t v21;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(v21 - 48);
  if (a20)
    std::__shared_weak_count::__release_weak(a20);
  std::__shared_weak_count::__release_weak(v20);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v2;
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  const char *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  size_t v10;
  void *v11;
  xpc_object_t *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  const char *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  TraceCAReporter *v21;
  const void *v22;
  size_t v23;
  size_t v24;
  BOOL *v25;
  xpc_object_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  xpc_object_t v30;
  xpc_object_t object;
  xpc_object_t __dst[2];
  unint64_t v33;
  BOOL __val[25];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = MEMORY[0x24BDACFA0];
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v2) == v3)
    {
      xpc_retain(v2);
      v4 = v2;
    }
    else
    {
      v4 = xpc_null_create();
    }
  }
  else
  {
    v4 = xpc_null_create();
    v2 = 0;
  }
  xpc_release(v2);
  v5 = xpc_string_create((const char *)*MEMORY[0x24BE04EE8]);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE04E98], v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  v7 = (const char *)*MEMORY[0x24BE04F88];
  v8 = xpc_string_create((const char *)*MEMORY[0x24BE04F88]);
  if (!v8)
    v8 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE051B0], v8);
  v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  __val[0] = 0;
  v10 = strlen(v7);
  if (v10 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v12 = (xpc_object_t *)operator new(v13 + 1);
    __dst[1] = v11;
    v33 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_18;
  }
  HIBYTE(v33) = v10;
  v12 = __dst;
  if (v10)
LABEL_18:
    memmove(v12, v7, (size_t)v11);
  *((_BYTE *)v11 + (_QWORD)v12) = 0;
  memset(&__val[1], 0, 24);
  if (prop::bbtrace::get((char *)__dst, (uint64_t)&__val[1]))
    util::convert<BOOL>((const std::string *)&__val[1], __val, 0);
  if (__val[24] < 0)
  {
    operator delete(*(void **)&__val[1]);
    if ((SHIBYTE(v33) & 0x80000000) == 0)
      goto LABEL_23;
  }
  else if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete(__dst[0]);
LABEL_23:
  std::to_string((std::string *)&__val[1], __val[0]);
  if (__val[24] >= 0)
    v15 = (const char *)&__val[1];
  else
    v15 = *(const char **)&__val[1];
  v16 = xpc_string_create(v15);
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE05270], v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (__val[24] < 0)
    operator delete(*(void **)&__val[1]);
  abm::asString();
  if (__val[24] >= 0)
    v18 = (const char *)&__val[1];
  else
    v18 = *(const char **)&__val[1];
  v19 = xpc_string_create(v18);
  if (!v19)
    v19 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE05788], v19);
  v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  if (__val[24] < 0)
  {
    operator delete(*(void **)&__val[1]);
    object = v4;
    __dst[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    v21 = *(TraceCAReporter **)(v1 + 304);
    if (v4)
      goto LABEL_37;
  }
  else
  {
    object = v4;
    __dst[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    v21 = *(TraceCAReporter **)(v1 + 304);
    if (v4)
    {
LABEL_37:
      xpc_retain(v4);
      goto LABEL_42;
    }
  }
  object = xpc_null_create();
LABEL_42:
  TraceCAReporter::prepTraceStats(v21, &object, __dst);
  xpc_release(object);
  object = 0;
  if (MEMORY[0x24BD2A468](__dst[0]) != v3)
    goto LABEL_55;
  v22 = (const void *)*MEMORY[0x24BE051F0];
  v23 = strlen((const char *)*MEMORY[0x24BE051F0]);
  if (v23 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v24 = v23;
  if (v23 >= 0x17)
  {
    v27 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17)
      v27 = v23 | 7;
    v28 = v27 + 1;
    v25 = (BOOL *)operator new(v27 + 1);
    *(_QWORD *)&__val[9] = v24;
    *(_QWORD *)&__val[17] = v28 | 0x8000000000000000;
    *(_QWORD *)&__val[1] = v25;
LABEL_51:
    memmove(v25, v22, v24);
    v25[v24] = 0;
    v26 = __dst[0];
    v30 = __dst[0];
    if (__dst[0])
      goto LABEL_47;
    goto LABEL_52;
  }
  __val[24] = v23;
  v25 = &__val[1];
  if (v23)
    goto LABEL_51;
  __val[1] = 0;
  v26 = __dst[0];
  v30 = __dst[0];
  if (__dst[0])
  {
LABEL_47:
    xpc_retain(v26);
    goto LABEL_53;
  }
LABEL_52:
  v26 = xpc_null_create();
  v30 = v26;
LABEL_53:
  v29 = 0;
  Service::runCommand(v1, (uint64_t)&__val[1], &v30, &v29);
  xpc_release(v26);
  v30 = 0;
  if (__val[24] < 0)
    operator delete(*(void **)&__val[1]);
LABEL_55:
  xpc_release(__dst[0]);
  xpc_release(v4);
}

void sub_24B933850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, xpc_object_t object, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;
  void *v25;

  xpc_release(v25);
  if (a24 < 0)
    operator delete(__p);
  xpc_release(object);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_3(_QWORD *a1, void **a2, const void **a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  void *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v22[5];
  xpc_object_t object;
  void *aBlock;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v7 = a1[4];
    v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      v9 = v8;
      v10 = a1[5];
      if (!v10)
        goto LABEL_18;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 1174405120;
      v22[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_4;
      v22[3] = &__block_descriptor_tmp_20_3;
      v11 = *a2;
      v22[4] = v7;
      object = v11;
      if (v11)
      {
        xpc_retain(v11);
        v12 = *a3;
        if (*a3)
        {
LABEL_6:
          v13 = _Block_copy(v12);
LABEL_9:
          aBlock = v13;
          v25 = v10;
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          v26 = v9;
          do
            v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
          ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v22);
          v16 = v26;
          if (!v26)
            goto LABEL_15;
          v17 = (unint64_t *)&v26->__shared_owners_;
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
            v19 = aBlock;
            if (!aBlock)
              goto LABEL_17;
          }
          else
          {
LABEL_15:
            v19 = aBlock;
            if (!aBlock)
            {
LABEL_17:
              xpc_release(object);
              object = 0;
LABEL_18:
              v20 = (unint64_t *)&v9->__shared_owners_;
              do
                v21 = __ldaxr(v20);
              while (__stlxr(v21 - 1, v20));
              if (!v21)
              {
                ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
                std::__shared_weak_count::__release_weak(v9);
              }
              return;
            }
          }
          _Block_release(v19);
          goto LABEL_17;
        }
      }
      else
      {
        object = xpc_null_create();
        v12 = *a3;
        if (*a3)
          goto LABEL_6;
      }
      v13 = 0;
      goto LABEL_9;
    }
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t value;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  int v7;
  char isSupported;
  char v9;
  const void *v10;
  size_t v11;
  std::string::size_type v12;
  void *v13;
  void *v14;
  const object *v15;
  xpc_object_t v16;
  uint64_t v17;
  xpc_object_t v18;
  const void *v19;
  CFTypeID v20;
  const void *v21;
  const void *v22;
  size_t v23;
  void *v24;
  void **v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  xpc_object_t v30;
  uint64_t v31;
  xpc_object_t v32;
  std::string *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  std::string *v37;
  __int128 v38;
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  std::string *v49;
  xpc_object_t v50;
  xpc_object_t v51;
  const char *v52;
  xpc_object_t v53;
  xpc_object_t v54;
  const char *v55;
  xpc_object_t v56;
  xpc_object_t v57;
  NSObject *v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  unint64_t *p_shared_owners;
  unint64_t v62;
  const void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  TraceCAReporter *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  const void *v77;
  size_t v78;
  size_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  xpc_object_t v83;
  xpc_object_t v84;
  uint64_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  void *v88;
  uint8_t *v89;
  xpc_object_t v90;
  xpc_object_t v91;
  const void *v92;
  std::string::size_type v93;
  xpc_object_t v94;
  void *v95[2];
  NSObject *v96;
  xpc_object_t v97;
  void *v98[2];
  NSObject *v99;
  xpc_object_t v100;
  _QWORD v101[6];
  std::__shared_weak_count *v102;
  void *v103;
  xpc_object_t v104;
  void *aBlock;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v108;
  xpc_object_t object;
  std::string v110;
  xpc_object_t v111[3];
  xpc_object_t v112[3];
  std::string v113;
  std::string v114;
  uint8_t buf[24];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  memset(&v113, 170, sizeof(v113));
  v2 = *(_QWORD *)(a1 + 32);
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE04E98]);
  v112[0] = value;
  if (value)
    xpc_retain(value);
  else
    v112[0] = xpc_null_create();
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v112[0]);
  memset(v112, 170, sizeof(v112));
  v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE051B0]);
  v111[0] = v4;
  if (v4)
    xpc_retain(v4);
  else
    v111[0] = xpc_null_create();
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v111[0]);
  memset(v111, 170, sizeof(v111));
  v5 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE05270]);
  v114.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  if (v5)
    xpc_retain(v5);
  else
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  xpc_release(v114.__r_.__value_.__l.__data_);
  v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE057B0]);
  *(_QWORD *)buf = v6;
  if (v6)
    xpc_retain(v6);
  else
    *(_QWORD *)buf = xpc_null_create();
  v7 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  xpc_release(*(xpc_object_t *)buf);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v110, v113.__r_.__value_.__l.__data_, v113.__r_.__value_.__l.__size_);
  else
    v110 = v113;
  isSupported = abm::trace::isSupported();
  v9 = isSupported;
  if ((SHIBYTE(v110.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((isSupported & 1) != 0)
      goto LABEL_18;
LABEL_24:
    v114.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v14 = *(void **)(a1 + 40);
    object = v14;
    if (v14)
      xpc_retain(v14);
    else
      object = xpc_null_create();
    xpc::bridge((xpc *)&object, v15);
    v19 = *(const void **)buf;
    if (*(_QWORD *)buf && (v20 = CFGetTypeID(*(CFTypeRef *)buf), v20 == CFDictionaryGetTypeID()))
    {
      v114.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
      CFRetain(v19);
      v21 = *(const void **)buf;
      if (!*(_QWORD *)buf)
      {
LABEL_37:
        xpc_release(object);
        v22 = (const void *)*MEMORY[0x24BE05430];
        v23 = strlen((const char *)*MEMORY[0x24BE05430]);
        if (v23 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v24 = (void *)v23;
        if (v23 >= 0x17)
        {
          v27 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v23 | 7) != 0x17)
            v27 = v23 | 7;
          v28 = v27 + 1;
          v25 = (void **)operator new(v27 + 1);
          __dst[1] = v24;
          v108 = v28 | 0x8000000000000000;
          __dst[0] = v25;
        }
        else
        {
          HIBYTE(v108) = v23;
          v25 = __dst;
          if (!v23)
          {
            LOBYTE(__dst[0]) = 0;
            v26 = (const void *)v114.__r_.__value_.__r.__words[0];
            cf = (CFTypeRef)v114.__r_.__value_.__r.__words[0];
            if (!v114.__r_.__value_.__r.__words[0])
            {
LABEL_47:
              aBlock = 0;
              Service::broadcastEvent(v2, (uint64_t)__dst, &cf, (const void **)&aBlock);
              if (aBlock)
                _Block_release(aBlock);
              if (cf)
                CFRelease(cf);
              if (SHIBYTE(v108) < 0)
              {
                operator delete(__dst[0]);
                v29 = *(NSObject **)(v2 + 88);
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
LABEL_53:
                  if (!*(_QWORD *)(a1 + 48))
                    goto LABEL_55;
                  goto LABEL_54;
                }
              }
              else
              {
                v29 = *(NSObject **)(v2 + 88);
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  goto LABEL_53;
              }
              v33 = &v113;
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v33 = (std::string *)v113.__r_.__value_.__r.__words[0];
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v33;
              _os_log_error_impl(&dword_24B855000, v29, OS_LOG_TYPE_ERROR, "Trace not supported: %s", buf, 0xCu);
              if (!*(_QWORD *)(a1 + 48))
                goto LABEL_55;
LABEL_54:
              v30 = xpc_null_create();
              v31 = *(_QWORD *)(a1 + 48);
              *(_QWORD *)buf = v30;
              v32 = xpc_null_create();
              (*(void (**)(uint64_t, uint64_t, uint8_t *))(v31 + 16))(v31, 3760250884, buf);
              xpc_release(*(xpc_object_t *)buf);
              xpc_release(v32);
LABEL_55:
              if (v26)
                CFRelease(v26);
LABEL_169:
              if ((SHIBYTE(v111[2]) & 0x80000000) == 0)
                goto LABEL_170;
              goto LABEL_174;
            }
LABEL_46:
            CFRetain(v26);
            goto LABEL_47;
          }
        }
        memmove(v25, v22, (size_t)v24);
        *((_BYTE *)v24 + (_QWORD)v25) = 0;
        v26 = (const void *)v114.__r_.__value_.__r.__words[0];
        cf = (CFTypeRef)v114.__r_.__value_.__r.__words[0];
        if (!v114.__r_.__value_.__r.__words[0])
          goto LABEL_47;
        goto LABEL_46;
      }
    }
    else
    {
      v114.__r_.__value_.__r.__words[0] = 0;
      v21 = *(const void **)buf;
      if (!*(_QWORD *)buf)
        goto LABEL_37;
    }
    CFRelease(v21);
    goto LABEL_37;
  }
  operator delete(v110.__r_.__value_.__l.__data_);
  if ((v9 & 1) == 0)
    goto LABEL_24;
LABEL_18:
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 88))(v2))
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    v17 = MEMORY[0x24BDACFA0];
    if (v16 || (v16 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD2A468](v16) == v17)
      {
        xpc_retain(v16);
        v18 = v16;
      }
      else
      {
        v18 = xpc_null_create();
      }
    }
    else
    {
      v18 = xpc_null_create();
      v16 = 0;
    }
    xpc_release(v16);
    v47 = xpc_int64_create(5000);
    if (!v47)
      v47 = xpc_null_create();
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x24BDFC790], v47);
    v48 = xpc_null_create();
    xpc_release(v47);
    xpc_release(v48);
    if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v49 = &v113;
    else
      v49 = (std::string *)v113.__r_.__value_.__r.__words[0];
    v50 = xpc_string_create((const char *)v49);
    if (!v50)
      v50 = xpc_null_create();
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x24BDFC7A8], v50);
    v51 = xpc_null_create();
    xpc_release(v50);
    xpc_release(v51);
    if (SHIBYTE(v112[2]) >= 0)
      v52 = (const char *)v112;
    else
      v52 = (const char *)v112[0];
    v53 = xpc_string_create(v52);
    if (!v53)
      v53 = xpc_null_create();
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x24BDFC7D0], v53);
    v54 = xpc_null_create();
    xpc_release(v53);
    xpc_release(v54);
    if (SHIBYTE(v111[2]) >= 0)
      v55 = (const char *)v111;
    else
      v55 = (const char *)v111[0];
    v56 = xpc_string_create(v55);
    if (!v56)
      v56 = xpc_null_create();
    xpc_dictionary_set_value(v18, (const char *)*MEMORY[0x24BDFC808], v56);
    v57 = xpc_null_create();
    xpc_release(v56);
    xpc_release(v57);
    if (v7)
    {
      v58 = *(NSObject **)(v2 + 88);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_24B855000, v58, OS_LOG_TYPE_DEBUG, "#D Request to set property with completion", buf, 2u);
      }
      memset(buf, 170, 16);
      v101[0] = MEMORY[0x24BDAC760];
      v101[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_17;
      v101[3] = &__block_descriptor_tmp_19_2;
      v60 = *(_QWORD *)(a1 + 56);
      v59 = *(std::__shared_weak_count **)(a1 + 64);
      v101[4] = v2;
      v101[5] = v60;
      v101[1] = 1174405120;
      v102 = v59;
      if (v59)
      {
        p_shared_owners = (unint64_t *)&v59->__shared_owners_;
        do
          v62 = __ldxr(p_shared_owners);
        while (__stxr(v62 + 1, p_shared_owners));
      }
      v63 = *(const void **)(a1 + 48);
      if (v63)
      {
        v64 = _Block_copy(v63);
        v65 = *(void **)(a1 + 40);
        v103 = v64;
        v104 = v65;
        if (v65)
        {
LABEL_108:
          xpc_retain(v65);
          goto LABEL_113;
        }
      }
      else
      {
        v65 = *(void **)(a1 + 40);
        v103 = 0;
        v104 = v65;
        if (v65)
          goto LABEL_108;
      }
      v104 = xpc_null_create();
LABEL_113:
      v66 = _Block_copy(v101);
      v67 = *(_QWORD *)(v2 + 136);
      if (v67)
        dispatch_retain(*(dispatch_object_t *)(v2 + 136));
      *(_QWORD *)buf = v66;
      *(_QWORD *)&buf[8] = v67;
      v100 = v18;
      if (v18)
      {
        xpc_retain(v18);
        v66 = *(void **)buf;
        v99 = 0;
        if (*(_QWORD *)buf)
        {
LABEL_117:
          v68 = _Block_copy(v66);
LABEL_123:
          v72 = *MEMORY[0x24BDFC840];
          v73 = *(NSObject **)&buf[8];
          v98[0] = v68;
          v98[1] = *(void **)&buf[8];
          if (*(_QWORD *)&buf[8])
            dispatch_retain(*(dispatch_object_t *)&buf[8]);
          TraceManager::runOnHelper_sync((_QWORD *)v2, (const char *)9, v72, 0, 1, &v100, &v99, v98);
          if (v73)
            dispatch_release(v73);
          if (v68)
            _Block_release(v68);
          xpc_release(v100);
          v100 = 0;
          if (v73)
            dispatch_release(v73);
          if (v66)
            _Block_release(v66);
          xpc_release(v104);
          v104 = 0;
          if (v103)
            _Block_release(v103);
          v74 = v102;
          if (v102)
          {
            v75 = (unint64_t *)&v102->__shared_owners_;
            do
              v76 = __ldaxr(v75);
            while (__stlxr(v76 - 1, v75));
            if (!v76)
            {
              ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
              std::__shared_weak_count::__release_weak(v74);
            }
          }
LABEL_159:
          xpc_release(v18);
          goto LABEL_169;
        }
      }
      else
      {
        v99 = 0;
        v100 = xpc_null_create();
        if (v66)
          goto LABEL_117;
      }
      v68 = 0;
      goto LABEL_123;
    }
    v97 = v18;
    if (v18)
      xpc_retain(v18);
    else
      v97 = xpc_null_create();
    v69 = *MEMORY[0x24BDFC840];
    v95[1] = 0;
    v96 = 0;
    v95[0] = 0;
    TraceManager::runOnHelper_sync((_QWORD *)v2, (const char *)9, v69, 0, 1, &v97, &v96, v95);
    xpc_release(v97);
    v97 = 0;
    v114.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v70 = *(TraceCAReporter **)(v2 + 304);
    v71 = *(void **)(a1 + 40);
    v94 = v71;
    if (v71)
      xpc_retain(v71);
    else
      v94 = xpc_null_create();
    TraceCAReporter::prepTraceStats(v70, &v94, (xpc_object_t *)&v114.__r_.__value_.__l.__data_);
    xpc_release(v94);
    v94 = 0;
    if (MEMORY[0x24BD2A468](v114.__r_.__value_.__r.__words[0]) != v17)
    {
LABEL_156:
      if (*(_QWORD *)(a1 + 48))
      {
        v84 = xpc_null_create();
        v85 = *(_QWORD *)(a1 + 48);
        *(_QWORD *)buf = v84;
        v86 = xpc_null_create();
        (*(void (**)(uint64_t, _QWORD, uint8_t *))(v85 + 16))(v85, 0, buf);
        xpc_release(*(xpc_object_t *)buf);
        xpc_release(v86);
      }
      xpc_release(v114.__r_.__value_.__l.__data_);
      goto LABEL_159;
    }
    v77 = (const void *)*MEMORY[0x24BE051F0];
    v78 = strlen((const char *)*MEMORY[0x24BE051F0]);
    if (v78 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v79 = v78;
    if (v78 >= 0x17)
    {
      v81 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v78 | 7) != 0x17)
        v81 = v78 | 7;
      v82 = v81 + 1;
      v80 = operator new(v81 + 1);
      *(_QWORD *)&buf[8] = v79;
      *(_QWORD *)&buf[16] = v82 | 0x8000000000000000;
      *(_QWORD *)buf = v80;
    }
    else
    {
      buf[23] = v78;
      v80 = buf;
      if (!v78)
      {
LABEL_151:
        v80[v79] = 0;
        v83 = (xpc_object_t)v114.__r_.__value_.__r.__words[0];
        v93 = v114.__r_.__value_.__r.__words[0];
        if (v114.__r_.__value_.__r.__words[0])
        {
          xpc_retain(v114.__r_.__value_.__l.__data_);
        }
        else
        {
          v83 = xpc_null_create();
          v93 = (std::string::size_type)v83;
        }
        v92 = 0;
        Service::runCommand(v2, (uint64_t)buf, (xpc_object_t *)&v93, &v92);
        xpc_release(v83);
        v93 = 0;
        if ((char)buf[23] < 0)
          operator delete(*(void **)buf);
        goto LABEL_156;
      }
    }
    memmove(v80, v77, v79);
    goto LABEL_151;
  }
  memset(buf, 170, sizeof(buf));
  v10 = (const void *)*MEMORY[0x24BE05368];
  v11 = strlen((const char *)*MEMORY[0x24BE05368]);
  if (v11 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v12 = v11;
  if (v11 >= 0x17)
  {
    v34 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v34 = v11 | 7;
    v35 = v34 + 1;
    v13 = operator new(v34 + 1);
    v114.__r_.__value_.__l.__size_ = v12;
    v114.__r_.__value_.__r.__words[2] = v35 | 0x8000000000000000;
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    goto LABEL_65;
  }
  *((_BYTE *)&v114.__r_.__value_.__s + 23) = v11;
  v13 = &v114;
  if (v11)
LABEL_65:
    memmove(v13, v10, v12);
  *((_BYTE *)v13 + v12) = 0;
  v36 = (char *)operator new(0x28uLL);
  strcpy(v36, " rejected; ABM is shutting down ");
  v37 = std::string::append(&v114, v36, 0x20uLL);
  v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  *(_QWORD *)&buf[16] = *((_QWORD *)&v37->__r_.__value_.__l + 2);
  *(_OWORD *)buf = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  operator delete(v36);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v114.__r_.__value_.__l.__data_);
    v39 = *(NSObject **)(v2 + 88);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
LABEL_68:
      v41 = *(_QWORD *)(a1 + 48);
      v40 = (uint64_t *)(a1 + 48);
      if (!v41)
        goto LABEL_168;
      goto LABEL_74;
    }
  }
  else
  {
    v39 = *(NSObject **)(v2 + 88);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      goto LABEL_68;
  }
  v42 = buf;
  if ((buf[23] & 0x80u) != 0)
    v42 = *(uint8_t **)buf;
  LODWORD(v114.__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)v114.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
  _os_log_impl(&dword_24B855000, v39, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v114, 0xCu);
  v43 = *(_QWORD *)(a1 + 48);
  v40 = (uint64_t *)(a1 + 48);
  if (v43)
  {
LABEL_74:
    v114.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    v44 = buf[23];
    if ((buf[23] & 0x80u) != 0)
      v44 = *(_QWORD *)&buf[8];
    if (v44)
    {
      v45 = xpc_dictionary_create(0, 0, 0);
      if (v45 || (v45 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2A468](v45) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(v45);
          v46 = v45;
        }
        else
        {
          v46 = xpc_null_create();
        }
      }
      else
      {
        v46 = xpc_null_create();
        v45 = 0;
      }
      xpc_release(v45);
      v87 = xpc_null_create();
      v88 = (void *)v114.__r_.__value_.__r.__words[0];
      v114.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
      xpc_release(v88);
      xpc_release(v87);
      if ((buf[23] & 0x80u) == 0)
        v89 = buf;
      else
        v89 = *(uint8_t **)buf;
      v90 = xpc_string_create((const char *)v89);
      if (!v90)
        v90 = xpc_null_create();
      xpc_dictionary_set_value(v46, (const char *)*MEMORY[0x24BE04F20], v90);
      v91 = xpc_null_create();
      xpc_release(v90);
      xpc_release(v91);
    }
    LODWORD(object) = -534716415;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(v40, (unsigned int *)&object, (void **)&v114.__r_.__value_.__l.__data_);
    xpc_release(v114.__r_.__value_.__l.__data_);
  }
LABEL_168:
  if (((char)buf[23] & 0x80000000) == 0)
    goto LABEL_169;
  operator delete(*(void **)buf);
  if ((SHIBYTE(v111[2]) & 0x80000000) == 0)
  {
LABEL_170:
    if ((SHIBYTE(v112[2]) & 0x80000000) == 0)
      goto LABEL_171;
    goto LABEL_175;
  }
LABEL_174:
  operator delete(v111[0]);
  if ((SHIBYTE(v112[2]) & 0x80000000) == 0)
  {
LABEL_171:
    if ((SHIBYTE(v113.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_176:
    operator delete(v113.__r_.__value_.__l.__data_);
    return;
  }
LABEL_175:
  operator delete(v112[0]);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_176;
}

void sub_24B934870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, char a12, uint64_t a13, uint64_t a14, xpc_object_t a15, char a16, uint64_t a17, uint64_t a18, xpc_object_t object, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *aBlock,xpc_object_t a28,void *a29,char a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,xpc_object_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_17(_QWORD *a1, int *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  TraceCAReporter *v7;
  void *v8;
  const void *v9;
  size_t v10;
  size_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  xpc_object_t v17;
  uint64_t v18;
  xpc_object_t v19;
  const void *v20;
  xpc_object_t v21;
  uint8_t buf[8];
  size_t v23;
  unint64_t v24;
  xpc_object_t object;
  xpc_object_t v26;

  v4 = a1[4];
  v5 = *(NSObject **)(v4 + 88);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEBUG, "#D Set property completion called", buf, 2u);
    if (!a1[7])
      return;
  }
  else if (!a1[7])
  {
    return;
  }
  v6 = *a2;
  if (!*a2)
  {
    v7 = *(TraceCAReporter **)(v4 + 304);
    v8 = (void *)a1[8];
    object = v8;
    v26 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    if (v8)
      xpc_retain(v8);
    else
      object = xpc_null_create();
    TraceCAReporter::prepTraceStats(v7, &object, &v26);
    xpc_release(object);
    object = 0;
    if (MEMORY[0x24BD2A468](v26) != MEMORY[0x24BDACFA0])
    {
LABEL_23:
      xpc_release(v26);
      v6 = *a2;
      goto LABEL_24;
    }
    v9 = (const void *)*MEMORY[0x24BE051F0];
    v10 = strlen((const char *)*MEMORY[0x24BE051F0]);
    if (v10 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v11 = v10;
    if (v10 >= 0x17)
    {
      v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17)
        v13 = v10 | 7;
      v14 = v13 + 1;
      v12 = operator new(v13 + 1);
      v23 = v11;
      v24 = v14 | 0x8000000000000000;
      *(_QWORD *)buf = v12;
    }
    else
    {
      HIBYTE(v24) = v10;
      v12 = buf;
      if (!v10)
      {
LABEL_18:
        v12[v11] = 0;
        v15 = v26;
        v21 = v26;
        if (v26)
        {
          xpc_retain(v26);
        }
        else
        {
          v15 = xpc_null_create();
          v21 = v15;
        }
        v20 = 0;
        Service::runCommand(v4, (uint64_t)buf, &v21, &v20);
        xpc_release(v15);
        v21 = 0;
        if (SHIBYTE(v24) < 0)
          operator delete(*(void **)buf);
        goto LABEL_23;
      }
    }
    memmove(v12, v9, v11);
    goto LABEL_18;
  }
LABEL_24:
  if (v6)
    v16 = 3760250880;
  else
    v16 = 0;
  v17 = xpc_null_create();
  v18 = a1[7];
  *(_QWORD *)buf = v17;
  v19 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, uint8_t *))(v18 + 16))(v18, v16, buf);
  xpc_release(*(xpc_object_t *)buf);
  xpc_release(v19);
}

void sub_24B934EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, xpc_object_t a18, xpc_object_t object)
{
  void *v19;

  xpc_release(v19);
  if (a16 < 0)
    operator delete(__p);
  xpc_release(object);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c15_ZTSN3xpc4dictE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  xpc_object_t result;

  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (const void *)a2[7];
  if (v7)
  {
    v8 = _Block_copy(v7);
    v9 = (void *)a2[8];
    a1[7] = v8;
    a1[8] = v9;
    if (v9)
      return xpc_retain(v9);
  }
  else
  {
    v9 = (void *)a2[8];
    a1[7] = 0;
    a1[8] = v9;
    if (v9)
      return xpc_retain(v9);
  }
  result = xpc_null_create();
  a1[8] = result;
  return result;
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  xpc_release(*(xpc_object_t *)(a1 + 64));
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(const void **)(a1 + 56);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

_QWORD *dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(_QWORD *a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;

  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 8);
  *a1 = v4;
  a1[1] = v5;
  if (v5)
    dispatch_retain(v5);
  return a1;
}

void *__copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *result;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v4 = (void *)a2[5];
  a1[5] = v4;
  if (!v4)
  {
    a1[5] = xpc_null_create();
    result = (void *)a2[6];
    if (!result)
      goto LABEL_6;
    goto LABEL_5;
  }
  xpc_retain(v4);
  result = (void *)a2[6];
  if (result)
LABEL_5:
    result = _Block_copy(result);
LABEL_6:
  v7 = a2[7];
  v6 = a2[8];
  a1[6] = result;
  a1[7] = v7;
  a1[8] = v6;
  if (v6)
  {
    v8 = (unint64_t *)(v6 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return result;
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  const void *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 64);
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
      v5 = *(const void **)(a1 + 48);
      if (!v5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
LABEL_6:
    _Block_release(v5);
LABEL_7:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

uint64_t __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_23(_QWORD *a1, void **a2, void **a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  xpc_object_t object;
  void *aBlock;

  v4 = (std::__shared_weak_count *)a1[6];
  if (!v4)
    return;
  v7 = a1[4];
  v8 = std::__shared_weak_count::lock(v4);
  if (!v8)
    return;
  v9 = v8;
  v10 = a1[5];
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (v12)
  {
    if (!v10)
      return;
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
    if (!v10)
      return;
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1174405120;
  v15[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_24;
  v15[3] = &__block_descriptor_tmp_29_0;
  v13 = *a2;
  v15[4] = v7;
  object = v13;
  if (v13)
  {
    xpc_retain(v13);
    v14 = *a3;
    if (!*a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  object = xpc_null_create();
  v14 = *a3;
  if (*a3)
LABEL_13:
    v14 = _Block_copy(v14);
LABEL_14:
  aBlock = v14;
  ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v15);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_24(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t value;
  xpc_object_t v4;
  char isSupported;
  char v6;
  void *v7;
  NSObject *v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  const char *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  NSObject *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  std::string *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  void **v23;
  xpc_object_t v24;
  xpc_object_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  std::string *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  xpc_object_t v36;
  _QWORD aBlock[6];
  void *v38;
  uint8_t buf[16];
  xpc_object_t object;
  xpc_object_t *p_object;
  uint64_t v42;
  xpc_object_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  xpc_object_t v45;
  std::string v46;
  void *__p[3];
  std::string v48;
  __int128 v49;
  uint64_t v50;
  __n128 (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  void *v53[2];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  memset(&v48, 170, sizeof(v48));
  v2 = *(_QWORD *)(a1 + 32);
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE04E98]);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v49 = 0uLL;
  v50 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(object);
  memset(__p, 170, sizeof(__p));
  v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), (const char *)*MEMORY[0x24BE051B0]);
  object = v4;
  if (v4)
    xpc_retain(v4);
  else
    object = xpc_null_create();
  v49 = 0uLL;
  v50 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(object);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v46, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  else
    v46 = v48;
  isSupported = abm::trace::isSupported();
  v6 = isSupported;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
    if ((v6 & 1) != 0)
    {
LABEL_12:
      object = 0;
      p_object = &object;
      v42 = 0x3002000000;
      v43 = __Block_byref_object_copy__2;
      v44 = __Block_byref_object_dispose__2;
      v7 = *(void **)(a1 + 40);
      v45 = v7;
      if (v7)
        xpc_retain(v7);
      else
        v45 = xpc_null_create();
      *(_QWORD *)&v49 = 0;
      *((_QWORD *)&v49 + 1) = &v49;
      v50 = 0x4002000000;
      v51 = __Block_byref_object_copy__25;
      v52 = __Block_byref_object_dispose__26;
      v53[1] = 0;
      v54 = 0;
      v53[0] = 0;
      if (prop::get((char *)&v48, (char *)__p, (uint64_t)v53))
      {
        v12 = (const char *)(*((_QWORD *)&v49 + 1) + 40);
        if (*(char *)(*((_QWORD *)&v49 + 1) + 63) < 0)
          v12 = *(const char **)v12;
        v13 = xpc_string_create(v12);
        if (!v13)
          v13 = xpc_null_create();
        xpc_dictionary_set_value(p_object[5], (const char *)*MEMORY[0x24BE05270], v13);
        v14 = xpc_null_create();
        xpc_release(v13);
        xpc_release(v14);
        *(_DWORD *)buf = 0;
        dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>((uint64_t *)(a1 + 48), (unsigned int *)buf, p_object + 5);
LABEL_63:
        _Block_object_dispose(&v49, 8);
        if (SHIBYTE(v54) < 0)
          operator delete(v53[0]);
        _Block_object_dispose(&object, 8);
        xpc_release(v45);
        goto LABEL_66;
      }
      v15 = *(NSObject **)(v2 + 88);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B855000, v15, OS_LOG_TYPE_DEFAULT, "#I Checking with abm-helper daemon", buf, 2u);
      }
      v16 = xpc_dictionary_create(0, 0, 0);
      if (v16 || (v16 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2A468](v16) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(v16);
          v17 = v16;
        }
        else
        {
          v17 = xpc_null_create();
        }
      }
      else
      {
        v17 = xpc_null_create();
        v16 = 0;
      }
      xpc_release(v16);
      v18 = xpc_int64_create(1500);
      if (!v18)
        v18 = xpc_null_create();
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x24BDFC790], v18);
      v19 = xpc_null_create();
      xpc_release(v18);
      xpc_release(v19);
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v20 = &v48;
      else
        v20 = (std::string *)v48.__r_.__value_.__r.__words[0];
      v21 = xpc_string_create((const char *)v20);
      if (!v21)
        v21 = xpc_null_create();
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x24BDFC7A8], v21);
      v22 = xpc_null_create();
      xpc_release(v21);
      xpc_release(v22);
      if (SHIBYTE(__p[2]) >= 0)
        v23 = __p;
      else
        v23 = (void **)__p[0];
      v24 = xpc_string_create((const char *)v23);
      if (!v24)
        v24 = xpc_null_create();
      xpc_dictionary_set_value(v17, (const char *)*MEMORY[0x24BDFC7D0], v24);
      v25 = xpc_null_create();
      xpc_release(v24);
      xpc_release(v25);
      memset(buf, 170, sizeof(buf));
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1174405120;
      aBlock[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_27;
      aBlock[3] = &unk_251CC02C0;
      aBlock[4] = &v49;
      aBlock[5] = &object;
      v26 = *(void **)(a1 + 48);
      if (v26)
        v26 = _Block_copy(v26);
      v38 = v26;
      v27 = _Block_copy(aBlock);
      v28 = *(_QWORD *)(v2 + 136);
      if (v28)
        dispatch_retain(*(dispatch_object_t *)(v2 + 136));
      *(_QWORD *)buf = v27;
      *(_QWORD *)&buf[8] = v28;
      v36 = v17;
      if (v17)
      {
        xpc_retain(v17);
        v27 = *(void **)buf;
        v35 = 0;
        if (*(_QWORD *)buf)
          goto LABEL_50;
      }
      else
      {
        v35 = 0;
        v36 = xpc_null_create();
        if (v27)
        {
LABEL_50:
          v29 = _Block_copy(v27);
          v30 = *MEMORY[0x24BDFC838];
          v31 = *(NSObject **)&buf[8];
          v33 = v29;
          v34 = *(_QWORD *)&buf[8];
          if (!*(_QWORD *)&buf[8])
          {
LABEL_52:
            TraceManager::runOnHelper_sync((_QWORD *)v2, (const char *)9, v30, 0, 1, &v36, &v35, &v33);
            if (v31)
              dispatch_release(v31);
            if (v29)
              _Block_release(v29);
            xpc_release(v36);
            v36 = 0;
            if (v31)
              dispatch_release(v31);
            if (v27)
              _Block_release(v27);
            if (v38)
              _Block_release(v38);
            xpc_release(v17);
            goto LABEL_63;
          }
LABEL_51:
          dispatch_retain(v31);
          goto LABEL_52;
        }
      }
      v29 = 0;
      v30 = *MEMORY[0x24BDFC838];
      v31 = *(NSObject **)&buf[8];
      v33 = 0;
      v34 = *(_QWORD *)&buf[8];
      if (!*(_QWORD *)&buf[8])
        goto LABEL_52;
      goto LABEL_51;
    }
  }
  else if ((isSupported & 1) != 0)
  {
    goto LABEL_12;
  }
  v8 = *(NSObject **)(v2 + 88);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v32 = &v48;
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v32 = (std::string *)v48.__r_.__value_.__r.__words[0];
    LODWORD(v49) = 136315138;
    *(_QWORD *)((char *)&v49 + 4) = v32;
    _os_log_error_impl(&dword_24B855000, v8, OS_LOG_TYPE_ERROR, "Trace not supported: %s", (uint8_t *)&v49, 0xCu);
  }
  v9 = xpc_null_create();
  v10 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)&v49 = v9;
  v11 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, __int128 *))(v10 + 16))(v10, 3760250884, &v49);
  xpc_release((xpc_object_t)v49);
  xpc_release(v11);
LABEL_66:
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v48.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_70:
    operator delete(v48.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_70;
}

void sub_24B935988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, xpc_object_t object, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock,char a21,uint64_t a22,xpc_object_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,xpc_object_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

xpc_object_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  xpc_object_t result;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  result = xpc_null_create();
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

__n128 __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
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

void __Block_byref_object_dispose__26(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_27(_QWORD *a1, _DWORD *a2, xpc_object_t *a3)
{
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  xpc_object_t value;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t object[2];
  uint64_t v18;

  if (!*a2 && MEMORY[0x24BD2A468](*a3) == MEMORY[0x24BDACFA0])
  {
    value = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x24BDFC808]);
    v16 = value;
    if (value)
      xpc_retain(value);
    else
      v16 = xpc_null_create();
    xpc::dyn_cast_or_default((xpc *)&v16, (const object *)"", v9);
    v10 = *(_QWORD *)(a1[4] + 8);
    v11 = v10 + 40;
    if (*(char *)(v10 + 63) < 0)
      operator delete(*(void **)v11);
    *(_OWORD *)v11 = *(_OWORD *)object;
    *(_QWORD *)(v11 + 16) = v18;
    HIBYTE(v18) = 0;
    LOBYTE(object[0]) = 0;
    xpc_release(v16);
    v12 = *(_QWORD *)(a1[4] + 8);
    v13 = (const char *)(v12 + 40);
    if (*(char *)(v12 + 63) < 0)
      v13 = *(const char **)v13;
    v14 = xpc_string_create(v13);
    if (!v14)
      v14 = xpc_null_create();
    xpc_dictionary_set_value(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 40), (const char *)*MEMORY[0x24BE05270], v14);
    v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    LODWORD(object[0]) = 0;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(a1 + 6, (unsigned int *)object, (void **)(*(_QWORD *)(a1[5] + 8) + 40));
  }
  else
  {
    v5 = xpc_null_create();
    v6 = a1[6];
    object[0] = v5;
    v7 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v6 + 16))(v6, 3760250880, object);
    xpc_release(object[0]);
    xpc_release(v7);
  }
}

void sub_24B935DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_31(_QWORD *a1, void **a2, const void **a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void *aBlock;
  xpc_object_t object;

  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v7 = a1[4];
    v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      v9 = v8;
      v10 = a1[5];
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (v12)
      {
        if (!v10)
          return;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
        if (!v10)
          return;
      }
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 1174405120;
      v15[2] = ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_32;
      v15[3] = &__block_descriptor_tmp_33_3;
      v15[4] = v7;
      if (*a3)
      {
        v13 = _Block_copy(*a3);
        v14 = *a2;
        aBlock = v13;
        object = v14;
        if (v14)
        {
LABEL_11:
          xpc_retain(v14);
          goto LABEL_14;
        }
      }
      else
      {
        v14 = *a2;
        aBlock = 0;
        object = v14;
        if (v14)
          goto LABEL_11;
      }
      object = xpc_null_create();
LABEL_14:
      ctu::SharedSynchronizable<TraceManager>::execute_wrapped((uint64_t *)(v7 + 120), (uint64_t)v15);
      xpc_release(object);
      object = 0;
      if (aBlock)
        _Block_release(aBlock);
    }
  }
}

void ___ZN12TraceManager10initializeEN8dispatch13group_sessionE_block_invoke_2_32(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  size_t v4;
  std::string::size_type v5;
  std::string *p_dst;
  xpc_object_t value;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  std::string *v12;
  __int128 v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  size_t v17;
  void **v18;
  xpc_object_t v19;
  const void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void *v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  void *v28;
  xpc_object_t v29;
  void *v30;
  void **v31;
  xpc_object_t v32;
  xpc_object_t v33;
  void *v34;
  xpc_object_t v35;
  void *aBlock;
  xpc_object_t v37;
  unsigned int v38;
  void *__p[4];
  std::string __dst;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (!(*(unsigned int (**)(_QWORD *))(*v2 + 88))(v2))
  {
    memset(__p, 170, 24);
    value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 48), (const char *)*MEMORY[0x24BE04F40]);
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)value;
    if (value)
      xpc_retain(value);
    else
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    xpc::dyn_cast_or_default((xpc *)&__dst, (const object *)*MEMORY[0x24BE05168], v8);
    xpc_release(__dst.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[2]) >= 0)
      v17 = HIBYTE(__p[2]);
    else
      v17 = (size_t)__p[1];
    if (v17 != strlen((const char *)*MEMORY[0x24BE050B0])
      || (SHIBYTE(__p[2]) >= 0 ? (v18 = __p) : (v18 = (void **)__p[0]),
          memcmp(v18, (const void *)*MEMORY[0x24BE050B0], v17)))
    {
      v19 = *(xpc_object_t *)(a1 + 48);
      v35 = v19;
      if (v19)
      {
        xpc_retain(v19);
        v20 = *(const void **)(a1 + 40);
        if (v20)
        {
LABEL_27:
          v21 = _Block_copy(v20);
LABEL_41:
          v34 = v21;
          TraceManager::collectLogs_sync(v2, &v35, &v34);
          if (v21)
            _Block_release(v21);
          xpc_release(v19);
          goto LABEL_61;
        }
      }
      else
      {
        v19 = xpc_null_create();
        v35 = v19;
        v20 = *(const void **)(a1 + 40);
        if (v20)
          goto LABEL_27;
      }
      v21 = 0;
      goto LABEL_41;
    }
    v27 = *(xpc_object_t *)(a1 + 48);
    v37 = v27;
    if (v27)
    {
      xpc_retain(v27);
      v28 = *(void **)(a1 + 40);
      if (!v28)
        goto LABEL_50;
    }
    else
    {
      v27 = xpc_null_create();
      v37 = v27;
      v28 = *(void **)(a1 + 40);
      if (!v28)
      {
LABEL_50:
        aBlock = v28;
        TraceManager::collectBasebandLogs_sync((uint64_t)v2, &v37, (uint64_t *)&aBlock);
        if (aBlock)
          _Block_release(aBlock);
        xpc_release(v27);
        goto LABEL_61;
      }
    }
    v28 = _Block_copy(v28);
    goto LABEL_50;
  }
  memset(__p, 170, 24);
  v3 = (const void *)*MEMORY[0x24BE05200];
  v4 = strlen((const char *)*MEMORY[0x24BE05200]);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v9 = v4 | 7;
    v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v5;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v4;
    p_dst = &__dst;
    if (!v4)
      goto LABEL_12;
  }
  memmove(p_dst, v3, v5);
LABEL_12:
  p_dst->__r_.__value_.__s.__data_[v5] = 0;
  v11 = (char *)operator new(0x28uLL);
  strcpy(v11, " rejected; ABM is shutting down ");
  v12 = std::string::append(&__dst, v11, 0x20uLL);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  __p[2] = (void *)v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  operator delete(v11);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    v14 = v2[11];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      v16 = *(_QWORD *)(a1 + 40);
      v15 = (uint64_t *)(a1 + 40);
      if (!v16)
        goto LABEL_61;
      goto LABEL_32;
    }
  }
  else
  {
    v14 = v2[11];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
  }
  v22 = __p;
  if (SHIBYTE(__p[2]) < 0)
    v22 = (void **)__p[0];
  LODWORD(__dst.__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = (std::string::size_type)v22;
  _os_log_impl(&dword_24B855000, v14, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&__dst, 0xCu);
  v23 = *(_QWORD *)(a1 + 40);
  v15 = (uint64_t *)(a1 + 40);
  if (v23)
  {
LABEL_32:
    __dst.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    v24 = (void *)HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) < 0)
      v24 = __p[1];
    if (v24)
    {
      v25 = xpc_dictionary_create(0, 0, 0);
      if (v25 || (v25 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2A468](v25) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(v25);
          v26 = v25;
        }
        else
        {
          v26 = xpc_null_create();
        }
      }
      else
      {
        v26 = xpc_null_create();
        v25 = 0;
      }
      xpc_release(v25);
      v29 = xpc_null_create();
      v30 = (void *)__dst.__r_.__value_.__r.__words[0];
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
      xpc_release(v30);
      xpc_release(v29);
      if (SHIBYTE(__p[2]) >= 0)
        v31 = __p;
      else
        v31 = (void **)__p[0];
      v32 = xpc_string_create((const char *)v31);
      if (!v32)
        v32 = xpc_null_create();
      xpc_dictionary_set_value(v26, (const char *)*MEMORY[0x24BE04F20], v32);
      v33 = xpc_null_create();
      xpc_release(v32);
      xpc_release(v33);
    }
    v38 = -534716415;
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(v15, &v38, (void **)&__dst.__r_.__value_.__l.__data_);
    xpc_release(__dst.__r_.__value_.__l.__data_);
  }
LABEL_61:
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
}

void sub_24B9363F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *aBlock, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,xpc_object_t object,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void TraceManager::collectBasebandLogs_sync(uint64_t a1, xpc_object_t *a2, uint64_t *a3)
{
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t v8;
  const __CFString **v9;
  xpc_object_t value;
  const char *v11;
  xpc_object_t v12;
  uint64_t v13;
  const __CFString **v14;
  xpc_object_t v15;
  uint64_t IsInternalBuild;
  uint64_t CompressionMode;
  const void *v18;
  size_t v19;
  std::string::size_type v20;
  std::string *p_dst;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t v24;
  int v25;
  const void *v26;
  size_t v27;
  std::string::size_type v28;
  int v29;
  std::string *v30;
  uint64_t v31;
  uint64_t v32;
  xpc_object_t v33;
  std::string::size_type size;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  __int128 v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  const char **v50;
  const void *v51;
  size_t v52;
  size_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  ctu *Mutable;
  const __CFAllocator *v59;
  __CFDictionary *v60;
  const __CFAllocator *v61;
  const char *v62;
  size_t v63;
  std::string::size_type v64;
  std::string *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const void *v69;
  size_t v70;
  int v71;
  size_t v72;
  unint64_t v73;
  size_t v74;
  _BYTE *v75;
  std::string *v76;
  std::string *v77;
  std::string::size_type v78;
  char v79;
  const __CFAllocator *v80;
  __CFDictionary *v81;
  const __CFAllocator *v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  std::__shared_weak_count *v86;
  unint64_t *p_shared_weak_owners;
  unint64_t v88;
  unint64_t *p_shared_owners;
  unint64_t v90;
  unint64_t v91;
  void *v92;
  const void *v93;
  void *v94;
  NSObject *v95;
  ctu *v96;
  xpc_object_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  xpc_object_t v101;
  xpc_object_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  xpc_object_t v106;
  NSObject *v107;
  uint64_t v108;
  xpc_object_t v109;
  NSObject *v110;
  _BOOL4 v111;
  uint64_t v112;
  std::string *v113;
  xpc_object_t v114;
  xpc_object_t v115;
  xpc_object_t v116;
  std::string::size_type v117;
  const char *v118;
  void **v119;
  const __CFString **v120;
  const __CFString **v121;
  void *v122;
  NSObject *v123;
  NSObject *v124;
  xpc_object_t v125;
  _QWORD aBlock[6];
  std::__shared_weak_count *v127;
  void *v128;
  std::string v129;
  std::string __p;
  int v131;
  BOOL v132;
  xpc_object_t v133;
  xpc_object_t v134;
  xpc_object_t v135;
  xpc_object_t v136;
  xpc_object_t v137[2];
  xpc_object_t v138;
  xpc_object_t v139;
  xpc_object_t xdict;
  __int128 v141;
  ctu *v142;
  unint64_t v143;
  BOOL v144;
  std::string v145;
  std::string v146[2];
  _BYTE block[32];
  __int128 *v148;
  uint8_t buf[4];
  std::string *v150;
  const void *v151[3];
  std::string __dst;
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x24BD2A468](*a2) != MEMORY[0x24BDACFA0])
  {
    v6 = xpc_null_create();
    v7 = *a3;
    *(_QWORD *)block = v6;
    v8 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(v7 + 16))(v7, 3760250880, block);
    xpc_release(*(xpc_object_t *)block);
    xpc_release(v8);
    return;
  }
  memset(&v146[1], 170, sizeof(std::string));
  v9 = (const __CFString **)*MEMORY[0x24BE04F40];
  value = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE04F40]);
  *(_QWORD *)block = value;
  if (value)
    xpc_retain(value);
  else
    *(_QWORD *)block = xpc_null_create();
  xpc::dyn_cast_or_default((xpc *)block, (const object *)*MEMORY[0x24BE050B0], v11);
  xpc_release(*(xpc_object_t *)block);
  memset(v146, 170, 24);
  v121 = (const __CFString **)*MEMORY[0x24BE05090];
  v12 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE05090]);
  v145.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
  if (v12)
    xpc_retain(v12);
  else
    v145.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  Timestamp::Timestamp((Timestamp *)&__dst);
  Timestamp::asString(v13, 0, 9, block);
  xpc::dyn_cast_or_default();
  if ((block[23] & 0x80000000) != 0)
    operator delete(*(void **)block);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)&__dst, (_QWORD *)__dst.__r_.__value_.__l.__size_);
  xpc_release(v145.__r_.__value_.__l.__data_);
  memset(&v145, 170, sizeof(v145));
  v14 = (const __CFString **)*MEMORY[0x24BE053F0];
  v15 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE053F0]);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
  if (v15)
    xpc_retain(v15);
  else
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  memset(block, 0, 24);
  xpc::dyn_cast_or_default();
  if ((block[23] & 0x80000000) != 0)
    operator delete(*(void **)block);
  xpc_release(__dst.__r_.__value_.__l.__data_);
  IsInternalBuild = TelephonyUtilIsInternalBuild();
  v120 = v9;
  if ((IsInternalBuild & 1) != 0 || (IsInternalBuild = TelephonyUtilIsCarrierBuild(), (_DWORD)IsInternalBuild))
    CompressionMode = capabilities::trace::getCompressionMode((capabilities::trace *)IsInternalBuild);
  else
    CompressionMode = 2;
  v144 = 0;
  v18 = (const void *)*MEMORY[0x24BDFC970];
  v19 = strlen((const char *)*MEMORY[0x24BDFC970]);
  if (v19 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v20 = v19;
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    p_dst = (std::string *)operator new(v22 + 1);
    __dst.__r_.__value_.__l.__size_ = v20;
    __dst.__r_.__value_.__r.__words[2] = v23 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_27;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v19;
  p_dst = &__dst;
  if (v19)
LABEL_27:
    memmove(p_dst, v18, v20);
  p_dst->__r_.__value_.__s.__data_[v20] = 0;
  memset(block, 0, 24);
  if (prop::compression::get((char *)&__dst, (uint64_t)block))
  {
    LODWORD(v151[0]) = -1431655766;
    if (util::convert<int>((const std::string *)block, v151, 0))
      CompressionMode = LODWORD(v151[0]);
    else
      CompressionMode = CompressionMode;
  }
  if ((block[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)block);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_34;
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_34;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_34:
  v24 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE05800]);
  *(_QWORD *)block = v24;
  if (v24)
    xpc_retain(v24);
  else
    *(_QWORD *)block = xpc_null_create();
  v25 = xpc::dyn_cast_or_default((xpc *)block, (const object *)CompressionMode);
  xpc_release(*(xpc_object_t *)block);
  if (v25)
  {
    v144 = 0;
    v26 = (const void *)*MEMORY[0x24BDFC7F8];
    v27 = strlen((const char *)*MEMORY[0x24BDFC7F8]);
    if (v27 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v28 = v27;
    v29 = v25;
    if (v27 >= 0x17)
    {
      v31 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v27 | 7) != 0x17)
        v31 = v27 | 7;
      v32 = v31 + 1;
      v30 = (std::string *)operator new(v31 + 1);
      __dst.__r_.__value_.__l.__size_ = v28;
      __dst.__r_.__value_.__r.__words[2] = v32 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
    }
    else
    {
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v27;
      v30 = &__dst;
      if (!v27)
      {
LABEL_48:
        v30->__r_.__value_.__s.__data_[v28] = 0;
        memset(block, 0, 24);
        if (prop::compression::get((char *)&__dst, (uint64_t)block))
          util::convert<BOOL>((const std::string *)block, &v144, 0);
        v25 = v29;
        if ((block[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)block);
          if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_52;
        }
        else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_52:
          v33 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE056C8]);
          *(_QWORD *)block = v33;
          if (v33)
            xpc_retain(v33);
          else
            *(_QWORD *)block = xpc_null_create();
          v144 = xpc::dyn_cast_or_default((xpc *)block, (const object *)v144);
          xpc_release(*(xpc_object_t *)block);
          goto LABEL_58;
        }
        operator delete(__dst.__r_.__value_.__l.__data_);
        goto LABEL_52;
      }
    }
    memmove(v30, v26, v28);
    goto LABEL_48;
  }
LABEL_58:
  size = HIBYTE(v145.__r_.__value_.__r.__words[2]);
  if ((v145.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v145.__r_.__value_.__l.__size_;
  if (!size)
    std::string::__assign_external(&v145, (const std::string::value_type *)*MEMORY[0x24BE04EC0]);
  v142 = (ctu *)0xAAAAAAAAAAAAAAAALL;
  v143 = 0xAAAAAAAAAAAAAAAALL;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  v36 = MEMORY[0x24BDAC760];
  *(_QWORD *)block = MEMORY[0x24BDAC760];
  *(_QWORD *)&block[8] = 0x40000000;
  *(_QWORD *)&block[16] = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  *(_QWORD *)&block[24] = &__block_descriptor_tmp_13_5;
  v148 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v37 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v141 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_67;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
    v37 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v141 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_67;
  }
  v38 = (unint64_t *)(v37 + 8);
  do
    v39 = __ldxr(v38);
  while (__stxr(v39 + 1, v38));
LABEL_67:
  abm::HelperClient::create();
  if (*((_QWORD *)&v141 + 1))
  {
    v40 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v141 + 1) + 16))(*((_QWORD *)&v141 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v141 + 1));
    }
  }
  xdict = xpc_null_create();
  v42 = xpc_dictionary_create(0, 0, 0);
  if (v42 || (v42 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v42) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v42);
      v43 = v42;
    }
    else
    {
      v43 = xpc_null_create();
    }
  }
  else
  {
    v43 = xpc_null_create();
    v42 = 0;
  }
  xpc_release(v42);
  v44 = xpc_int64_create(1500);
  if (!v44)
    v44 = xpc_null_create();
  xpc_dictionary_set_value(v43, (const char *)*MEMORY[0x24BDFC790], v44);
  v45 = xpc_null_create();
  xpc_release(v44);
  xpc_release(v45);
  *(_QWORD *)&v46 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)block = v46;
  *(_OWORD *)&block[16] = v46;
  v139 = v43;
  if (v43)
    xpc_retain(v43);
  else
    v139 = xpc_null_create();
  abm::HelperClient::perform();
  xpc_release(v139);
  v139 = 0;
  v138 = xpc_null_create();
  if (*(_DWORD *)block || MEMORY[0x24BD2A468](xdict) != MEMORY[0x24BDACFA0] || !*(_QWORD *)(a1 + 256))
  {
LABEL_85:
    xpc_release(v138);
    if ((block[31] & 0x80000000) != 0)
      operator delete(*(void **)&block[8]);
    xpc_release(v43);
    xpc_release(xdict);
    v47 = (std::__shared_weak_count *)v143;
    if (v143)
    {
      v48 = (unint64_t *)(v143 + 8);
      do
        v49 = __ldaxr(v48);
      while (__stlxr(v49 - 1, v48));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    v119 = (void **)a3;
    v50 = (const char **)MEMORY[0x24BDFC720];
    v51 = (const void *)*MEMORY[0x24BDFC720];
    v52 = strlen((const char *)*MEMORY[0x24BDFC720]);
    if (v52 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v53 = v52;
    if (v52 >= 0x17)
    {
      v55 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v52 | 7) != 0x17)
        v55 = v52 | 7;
      v56 = v55 + 1;
      v54 = operator new(v55 + 1);
      *(_QWORD *)&block[8] = v53;
      *(_QWORD *)&block[16] = v56 | 0x8000000000000000;
      *(_QWORD *)block = v54;
    }
    else
    {
      block[23] = v52;
      v54 = block;
      if (!v52)
      {
LABEL_100:
        v54[v53] = 0;
        support::fs::createDir(block, 0x1EDu, 1);
        if ((block[23] & 0x80000000) != 0)
          operator delete(*(void **)block);
        v142 = 0;
        v57 = *MEMORY[0x24BDBD240];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v60 = Mutable;
        if (Mutable)
          v142 = Mutable;
        if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external((std::string *)block, v145.__r_.__value_.__l.__data_, v145.__r_.__value_.__l.__size_);
        else
          *(std::string *)block = v145;
        ctu::cf::insert<char const*,std::string>(v60, v14, (uint64_t)block, v57, v59);
        if ((block[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)block);
          if ((SHIBYTE(v146[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_109;
        }
        else if ((SHIBYTE(v146[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_109:
          *(std::string *)block = v146[0];
          goto LABEL_112;
        }
        std::string::__init_copy_ctor_external((std::string *)block, v146[0].__r_.__value_.__l.__data_, v146[0].__r_.__value_.__l.__size_);
LABEL_112:
        ctu::cf::insert<char const*,std::string>(v60, v121, (uint64_t)block, v57, v61);
        if ((block[23] & 0x80000000) != 0)
          operator delete(*(void **)block);
        memset(&__dst, 170, sizeof(__dst));
        v62 = *v50;
        v63 = strlen(*v50);
        if (v63 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v64 = v63;
        if (v63 >= 0x17)
        {
          v66 = (v63 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v63 | 7) != 0x17)
            v66 = v63 | 7;
          v67 = v66 + 1;
          v65 = (std::string *)operator new(v66 + 1);
          __dst.__r_.__value_.__l.__size_ = v64;
          __dst.__r_.__value_.__r.__words[2] = v67 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v65;
        }
        else
        {
          *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v63;
          v65 = &__dst;
          if (!v63)
          {
            __dst.__r_.__value_.__s.__data_[0] = 0;
            if (!v25)
              goto LABEL_139;
LABEL_123:
            v68 = v25;
            v69 = (const void *)*MEMORY[0x24BDFC738];
            v70 = strlen((const char *)*MEMORY[0x24BDFC738]);
            v71 = SHIBYTE(v146[0].__r_.__value_.__r.__words[2]);
            if ((v146[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v72 = HIBYTE(v146[0].__r_.__value_.__r.__words[2]);
            else
              v72 = v146[0].__r_.__value_.__l.__size_;
            v73 = v72 + v70;
            memset(block, 170, 24);
            if (v72 + v70 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            v74 = v70;
            if (v73 > 0x16)
            {
              v98 = (v73 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v73 | 7) != 0x17)
                v98 = v73 | 7;
              v99 = v98 + 1;
              v75 = operator new(v98 + 1);
              *(_QWORD *)&block[8] = v73;
              *(_QWORD *)&block[16] = v99 | 0x8000000000000000;
              *(_QWORD *)block = v75;
              if (!v74)
                goto LABEL_130;
            }
            else
            {
              memset(block, 0, 24);
              v75 = block;
              block[23] = v72 + v70;
              if (!v70)
              {
LABEL_130:
                if (v72)
                {
                  if (v71 >= 0)
                    v76 = v146;
                  else
                    v76 = (std::string *)v146[0].__r_.__value_.__r.__words[0];
                  memmove(&v75[v74], v76, v72);
                }
                v75[v74 + v72] = 0;
                v77 = std::string::append((std::string *)block, "/", 1uLL);
                v78 = v77->__r_.__value_.__r.__words[0];
                v151[0] = (const void *)v77->__r_.__value_.__l.__size_;
                *(const void **)((char *)v151 + 7) = *(const void **)((char *)&v77->__r_.__value_.__r.__words[1] + 7);
                v79 = HIBYTE(v77->__r_.__value_.__r.__words[2]);
                v77->__r_.__value_.__l.__size_ = 0;
                v77->__r_.__value_.__r.__words[2] = 0;
                v77->__r_.__value_.__r.__words[0] = 0;
                v25 = v68;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__dst.__r_.__value_.__l.__data_);
                __dst.__r_.__value_.__r.__words[0] = v78;
                __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v151[0];
                *(std::string::size_type *)((char *)&__dst.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v151 + 7);
                *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v79;
                v36 = MEMORY[0x24BDAC760];
                if ((block[23] & 0x80000000) != 0)
                  operator delete(*(void **)block);
LABEL_139:
                support::fs::createDir((const char *)&__dst, 0x1EDu, 1);
                v81 = v142;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external((std::string *)block, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                else
                  *(std::string *)block = __dst;
                ctu::cf::insert<char const*,std::string>(v81, (const __CFString **)*MEMORY[0x24BE05268], (uint64_t)block, v57, v80);
                if ((block[23] & 0x80000000) != 0)
                {
                  operator delete(*(void **)block);
                  if ((SHIBYTE(v146[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_144;
                }
                else if ((SHIBYTE(v146[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_144:
                  *(std::string *)block = v146[1];
                  goto LABEL_147;
                }
                std::string::__init_copy_ctor_external((std::string *)block, v146[1].__r_.__value_.__l.__data_, v146[1].__r_.__value_.__l.__size_);
LABEL_147:
                ctu::cf::insert<char const*,std::string>(v81, v120, (uint64_t)block, v57, v82);
                if ((block[23] & 0x80000000) != 0)
                  operator delete(*(void **)block);
                v83 = *(std::__shared_weak_count **)(a1 + 128);
                if (!v83 || (v84 = *(_QWORD *)(a1 + 120), (v85 = std::__shared_weak_count::lock(v83)) == 0))
                  std::__throw_bad_weak_ptr[abi:ne180100]();
                v86 = v85;
                p_shared_weak_owners = (unint64_t *)&v85->__shared_weak_owners_;
                do
                  v88 = __ldxr(p_shared_weak_owners);
                while (__stxr(v88 + 1, p_shared_weak_owners));
                p_shared_owners = (unint64_t *)&v85->__shared_owners_;
                do
                  v90 = __ldaxr(p_shared_owners);
                while (__stlxr(v90 - 1, p_shared_owners));
                if (!v90)
                {
                  ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
                  std::__shared_weak_count::__release_weak(v86);
                }
                memset(block, 170, 16);
                aBlock[0] = v36;
                aBlock[1] = 1174405120;
                aBlock[2] = ___ZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke;
                aBlock[3] = &__block_descriptor_tmp_41_0;
                aBlock[4] = a1;
                aBlock[5] = v84;
                v127 = v86;
                do
                  v91 = __ldxr(p_shared_weak_owners);
                while (__stxr(v91 + 1, p_shared_weak_owners));
                v92 = *v119;
                if (*v119)
                  v92 = _Block_copy(v92);
                v128 = v92;
                if (SHIBYTE(v146[0].__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external(&v129, v146[0].__r_.__value_.__l.__data_, v146[0].__r_.__value_.__l.__size_);
                else
                  v129 = v146[0];
                v131 = v25;
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                else
                  __p = __dst;
                v132 = v144;
                v94 = _Block_copy(aBlock);
                v95 = *(NSObject **)(a1 + 136);
                if (v95)
                  dispatch_retain(*(dispatch_object_t *)(a1 + 136));
                *(_QWORD *)block = v94;
                *(_QWORD *)&block[8] = v95;
                v96 = v142;
                ctu::cf_to_xpc(v142, v93);
                v97 = (xpc_object_t)v151[0];
                if (v151[0] && MEMORY[0x24BD2A468](v151[0]) == MEMORY[0x24BDACFA0])
                  xpc_retain(v97);
                else
                  v97 = xpc_null_create();
                xpc_release((xpc_object_t)v151[0]);
                v100 = (const char *)(a1 + 168);
                if (*(char *)(a1 + 191) < 0)
                  v100 = *(const char **)v100;
                v101 = xpc_string_create(v100);
                if (!v101)
                  v101 = xpc_null_create();
                xpc_dictionary_set_value(v97, (const char *)*MEMORY[0x24BE05060], v101);
                v102 = xpc_null_create();
                xpc_release(v101);
                xpc_release(v102);
                v125 = v97;
                if (v97)
                {
                  xpc_retain(v97);
                  v124 = 0;
                  if (v94)
                    goto LABEL_183;
                }
                else
                {
                  v124 = 0;
                  v125 = xpc_null_create();
                  if (v94)
                  {
LABEL_183:
                    v103 = _Block_copy(v94);
                    v104 = *MEMORY[0x24BDFC900];
                    v122 = v103;
                    v123 = v95;
                    if (!v95)
                      goto LABEL_185;
                    goto LABEL_184;
                  }
                }
                v103 = 0;
                v104 = *MEMORY[0x24BDFC900];
                v122 = 0;
                v123 = v95;
                if (!v95)
                {
LABEL_185:
                  TraceManager::runOnHelper_sync((_QWORD *)a1, (const char *)9, v104, 0x1388u, 1, &v125, &v124, &v122);
                  if (v95)
                    dispatch_release(v95);
                  if (v103)
                    _Block_release(v103);
                  xpc_release(v125);
                  v125 = 0;
                  xpc_release(v97);
                  if (v95)
                    dispatch_release(v95);
                  if (v94)
                    _Block_release(v94);
                  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  {
                    operator delete(__p.__r_.__value_.__l.__data_);
                    if ((SHIBYTE(v129.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
LABEL_195:
                      v105 = v128;
                      if (!v128)
                      {
LABEL_203:
                        if (v127)
                          std::__shared_weak_count::__release_weak(v127);
                        std::__shared_weak_count::__release_weak(v86);
                        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                        {
                          operator delete(__dst.__r_.__value_.__l.__data_);
                          if (!v96)
                            goto LABEL_210;
                        }
                        else if (!v96)
                        {
LABEL_210:
                          if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
                            goto LABEL_250;
LABEL_211:
                          if (SHIBYTE(v146[0].__r_.__value_.__r.__words[2]) < 0)
                            goto LABEL_251;
                          goto LABEL_212;
                        }
                        CFRelease(v96);
                        goto LABEL_210;
                      }
LABEL_202:
                      _Block_release(v105);
                      goto LABEL_203;
                    }
                  }
                  else if ((SHIBYTE(v129.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
                    goto LABEL_195;
                  }
                  operator delete(v129.__r_.__value_.__l.__data_);
                  v105 = v128;
                  if (!v128)
                    goto LABEL_203;
                  goto LABEL_202;
                }
LABEL_184:
                dispatch_retain(v95);
                goto LABEL_185;
              }
            }
            memcpy(v75, v69, v74);
            goto LABEL_130;
          }
        }
        memmove(v65, v62, v64);
        v65->__r_.__value_.__s.__data_[v64] = 0;
        if (!v25)
          goto LABEL_139;
        goto LABEL_123;
      }
    }
    memmove(v54, v51, v53);
    goto LABEL_100;
  }
  memset(v151, 170, sizeof(v151));
  v106 = xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x24BDFC868]);
  v137[0] = v106;
  if (v106)
    xpc_retain(v106);
  else
    v137[0] = xpc_null_create();
  memset(&__dst, 0, sizeof(__dst));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  xpc_release(v137[0]);
  v107 = *(NSObject **)(a1 + 88);
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    v108 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 16);
    LODWORD(__dst.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(__dst.__r_.__value_.__r.__words[0]) = v108;
    _os_log_impl(&dword_24B855000, v107, OS_LOG_TYPE_DEFAULT, "#I Baseband Log tracker size: %d", (uint8_t *)&__dst, 8u);
  }
  v137[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v137[1] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  BBLogTracker::getLog(*(_QWORD *)(a1 + 256), v151, (uint64_t *)v137);
  v109 = v137[0];
  if (!v137[0])
  {
    std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v137);
    if (SHIBYTE(v151[2]) < 0)
      operator delete((void *)v151[0]);
    goto LABEL_85;
  }
  v110 = *(NSObject **)(a1 + 88);
  v111 = os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
  v112 = MEMORY[0x24BDACFA0];
  if (v111)
  {
    asString((uint64_t)v109, &__dst);
    v113 = (__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
         ? &__dst
         : (std::string *)__dst.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    v150 = v113;
    _os_log_impl(&dword_24B855000, v110, OS_LOG_TYPE_DEFAULT, "#I Log tracker info: %s", buf, 0xCu);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
  }
  v114 = xpc_dictionary_create(0, 0, 0);
  v115 = v114;
  if (v114)
  {
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v114;
  }
  else
  {
    v115 = xpc_null_create();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v115;
    if (!v115)
    {
      v116 = xpc_null_create();
      v115 = 0;
      goto LABEL_238;
    }
  }
  if (MEMORY[0x24BD2A468](v115) == v112)
  {
    xpc_retain(v115);
    goto LABEL_239;
  }
  v116 = xpc_null_create();
LABEL_238:
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v116;
LABEL_239:
  xpc_release(v115);
  xpc::dict::operator=(&v138, (xpc_object_t *)&__dst.__r_.__value_.__l.__data_);
  xpc_release(__dst.__r_.__value_.__l.__data_);
  v135 = xpc_string_create((const char *)*MEMORY[0x24BDFC720]);
  if (!v135)
    v135 = xpc_null_create();
  v117 = *MEMORY[0x24BE05268];
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v138;
  __dst.__r_.__value_.__l.__size_ = v117;
  xpc::dict::object_proxy::operator=((uint64_t)&__dst, &v135, &v136);
  xpc_release(v136);
  v136 = 0;
  xpc_release(v135);
  v135 = 0;
  v118 = (const char *)v137[0];
  if (*((char *)v137[0] + 23) < 0)
    v118 = *(const char **)v137[0];
  v133 = xpc_string_create(v118);
  if (!v133)
    v133 = xpc_null_create();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v138;
  __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v121;
  xpc::dict::object_proxy::operator=((uint64_t)&__dst, &v133, &v134);
  xpc_release(v134);
  v134 = 0;
  xpc_release(v133);
  v133 = 0;
  LODWORD(__dst.__r_.__value_.__l.__data_) = 0;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>(a3, (unsigned int *)&__dst, &v138);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v137);
  if (SHIBYTE(v151[2]) < 0)
    operator delete((void *)v151[0]);
  xpc_release(v138);
  if ((block[31] & 0x80000000) != 0)
    operator delete(*(void **)&block[8]);
  xpc_release(v43);
  xpc_release(xdict);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&v142);
  if ((SHIBYTE(v145.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_211;
LABEL_250:
  operator delete(v145.__r_.__value_.__l.__data_);
  if (SHIBYTE(v146[0].__r_.__value_.__r.__words[2]) < 0)
  {
LABEL_251:
    operator delete(v146[0].__r_.__value_.__l.__data_);
    if (SHIBYTE(v146[1].__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_252;
    return;
  }
LABEL_212:
  if (SHIBYTE(v146[1].__r_.__value_.__r.__words[2]) < 0)
LABEL_252:
    operator delete(v146[1].__r_.__value_.__l.__data_);
}

void sub_24B9377CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, xpc_object_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,void *aBlock,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,xpc_object_t a42,uint64_t a43,xpc_object_t object,xpc_object_t a45,xpc_object_t a46,char a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void TraceManager::collectLogs_sync(_QWORD *a1, xpc_object_t *a2, void **a3)
{
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  void (**v9)(void *, uint64_t, stat *);
  xpc_object_t v10;
  const __CFString **v11;
  xpc_object_t value;
  const char *v13;
  char *v14;
  const __CFString **v15;
  xpc_object_t v16;
  const __CFString **v17;
  xpc_object_t v18;
  const __CFString **v19;
  xpc_object_t v20;
  const __CFString **v21;
  xpc_object_t v22;
  const __CFString **v23;
  xpc_object_t v24;
  size_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  xpc_object_t v30;
  uint64_t IsInternalBuild;
  uint64_t CompressionMode;
  const void *v33;
  size_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  xpc_object_t v39;
  int v40;
  const void *v41;
  size_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  xpc_object_t v47;
  void *v48;
  size_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  xpc_object_t v54;
  std::string::size_type size;
  const void *v56;
  size_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int data;
  xpc_object_t v63;
  int v64;
  char IsCarrierBuild;
  char v66;
  uint64_t **v67;
  NSObject *v68;
  stat *p_block;
  uint64_t *v70;
  NSObject *v71;
  const void *v72;
  size_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  _QWORD *v79;
  const void *v80;
  size_t v81;
  int v82;
  size_t v83;
  __darwin_ino64_t v84;
  size_t v85;
  char *v86;
  char *v87;
  void **v88;
  std::string *v89;
  void *v90;
  char v91;
  size_t v92;
  std::string::size_type *v93;
  uint64_t v94;
  uint64_t v95;
  const void *v96;
  size_t v97;
  __darwin_ino64_t v98;
  void *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  int st_gid_high;
  void *v104;
  stat *v105;
  std::string *v106;
  size_t v107;
  int v108;
  int v109;
  int v110;
  NSObject *v111;
  std::string *v112;
  const __CFAllocator *v113;
  CFMutableDictionaryRef Mutable;
  const __CFAllocator *v115;
  __CFDictionary *v116;
  const __CFAllocator *v117;
  const __CFAllocator *v118;
  const __CFAllocator *v119;
  const __CFAllocator *v120;
  const __CFAllocator *v121;
  const __CFAllocator *v122;
  const __CFAllocator *v123;
  const __CFAllocator *v124;
  const __CFAllocator *v125;
  const __CFAllocator *v126;
  const __CFAllocator *v127;
  const __CFString **v128;
  xpc_object_t v129;
  int v130;
  const __CFAllocator *v131;
  const __CFString **v132;
  xpc_object_t v133;
  int v134;
  const __CFAllocator *v135;
  const __CFString **v136;
  xpc_object_t v137;
  int v138;
  const __CFAllocator *v139;
  const __CFAllocator *v140;
  unsigned __int8 v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t *v144;
  unint64_t v145;
  unint64_t *v146;
  unint64_t v147;
  xpc_object_t v148;
  xpc_object_t v149;
  xpc_object_t v150;
  xpc_object_t v151;
  xpc_object_t v152;
  xpc_object_t v153;
  xpc_object_t v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const __CFString ***v158;
  const void *v159;
  size_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  timespec v165;
  void **v166;
  int v167;
  const __CFAllocator *v168;
  int v169;
  __int128 v170;
  const __CFAllocator *v171;
  NSObject *v172;
  std::__shared_weak_count *v173;
  const void *v174;
  size_t v175;
  void *v176;
  void *v177;
  CFTypeRef v178;
  uint64_t v179;
  uint64_t v180;
  CFTypeID v181;
  unint64_t *v182;
  unint64_t v183;
  unint64_t *v184;
  unint64_t v185;
  void *v186;
  void *v187;
  std::__shared_weak_count *v188;
  unint64_t *p_shared_owners;
  unint64_t v190;
  std::__shared_weak_count *v191;
  unint64_t *v192;
  unint64_t v193;
  std::__shared_weak_count *st_ino;
  unint64_t *v195;
  unint64_t v196;
  std::__shared_weak_count *v197;
  unint64_t *v198;
  unint64_t v199;
  CFTypeRef v200;
  void **v201;
  int v202;
  const __CFString **v203;
  const __CFString **v204;
  const __CFString **v205;
  int v206;
  const __CFString **v207;
  const __CFString **v208;
  const __CFString **v209;
  const __CFString **v210;
  const __CFString **v211;
  const __CFString **v212;
  char *__s;
  void *__src;
  _QWORD aBlock[5];
  __int128 v216;
  unint64_t v217;
  std::__shared_weak_count *v218;
  xpc_object_t v219;
  CFTypeRef v220;
  void *v221;
  std::string v222;
  void *v223;
  CFTypeRef v224;
  void *v225[2];
  unint64_t v226;
  xpc_object_t v227;
  void *v228[2];
  int64_t v229;
  xpc_object_t v230;
  __int128 v231;
  unint64_t v232;
  unint64_t v233;
  CFTypeRef cf;
  std::string v235;
  void *__p[2];
  char v237;
  char v238;
  BOOL v239;
  char v240;
  std::string v241[2];
  void *v242[3];
  void *v243[3];
  std::string::size_type __sz[3];
  std::string v245;
  xpc_object_t __dst[4];
  stat block;
  uint64_t v248;

  v248 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BD2A468](*a2);
  v7 = MEMORY[0x24BDACFA0];
  if (v6 != MEMORY[0x24BDACFA0])
  {
    v8 = xpc_null_create();
    v9 = (void (**)(void *, uint64_t, stat *))*a3;
    *(_QWORD *)&block.st_dev = v8;
    v10 = xpc_null_create();
    v9[2](v9, 3760250880, &block);
    xpc_release(*(xpc_object_t *)&block.st_dev);
    xpc_release(v10);
    return;
  }
  memset(__sz, 170, sizeof(__sz));
  v11 = (const __CFString **)*MEMORY[0x24BE04F40];
  value = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE04F40]);
  *(_QWORD *)&block.st_dev = value;
  if (value)
    xpc_retain(value);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v14 = (char *)*MEMORY[0x24BE05168];
  xpc::dyn_cast_or_default((xpc *)&block, (const object *)*MEMORY[0x24BE05168], v13);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  memset(v243, 170, sizeof(v243));
  v15 = (const __CFString **)*MEMORY[0x24BE05090];
  v16 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE05090]);
  v241[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v16;
  if (v16)
    xpc_retain(v16);
  else
    v241[1].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  Timestamp::Timestamp((Timestamp *)v242);
  Timestamp::asString((uint64_t)v242, 0, 9, &block);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v242, (_QWORD *)v242[1]);
  xpc_release(v241[1].__r_.__value_.__l.__data_);
  memset(v242, 170, sizeof(v242));
  v17 = (const __CFString **)*MEMORY[0x24BE051A0];
  v18 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE051A0]);
  v241[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
  if (v18)
    xpc_retain(v18);
  else
    v241[1].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  memset(&block, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
  xpc_release(v241[1].__r_.__value_.__l.__data_);
  memset(&v241[1], 170, sizeof(std::string));
  v19 = (const __CFString **)*MEMORY[0x24BE05398];
  v20 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE05398]);
  v241[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
  if (v20)
    xpc_retain(v20);
  else
    v241[0].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  memset(&block, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
  __s = v14;
  xpc_release(v241[0].__r_.__value_.__l.__data_);
  memset(v241, 170, 24);
  v21 = (const __CFString **)*MEMORY[0x24BE053F0];
  v22 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE053F0]);
  __dst[0] = v22;
  if (v22)
    xpc_retain(v22);
  else
    __dst[0] = xpc_null_create();
  memset(&block, 0, 24);
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
  xpc_release(__dst[0]);
  v23 = (const __CFString **)*MEMORY[0x24BE04E78];
  v24 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE04E78]);
  *(_QWORD *)&block.st_dev = v24;
  if (v24)
    xpc_retain(v24);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v211 = v15;
  v212 = v21;
  v206 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)7);
  v207 = v23;
  v208 = v19;
  v209 = v17;
  xpc_release(*(xpc_object_t *)&block.st_dev);
  v240 = 1;
  __src = (void *)*MEMORY[0x24BE05838];
  v25 = strlen((const char *)*MEMORY[0x24BE05838]);
  if (v25 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v26 = (void *)v25;
  v210 = v11;
  if (v25 >= 0x17)
  {
    v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v28 = v25 | 7;
    v29 = v28 + 1;
    v27 = operator new(v28 + 1);
    __dst[2] = (xpc_object_t)(v29 | 0x8000000000000000);
    __dst[0] = v27;
    __dst[1] = v26;
    goto LABEL_36;
  }
  HIBYTE(__dst[2]) = v25;
  v27 = __dst;
  if (v25)
LABEL_36:
    memmove(v27, __src, (size_t)v26);
  *((_BYTE *)v26 + (_QWORD)v27) = 0;
  memset(&block, 0, 24);
  if (prop::logfilter::get((char *)__dst, (uint64_t)&block))
    util::convert<BOOL>((const std::string *)&block, (BOOL *)&v240, 0);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_41;
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_41;
  }
  operator delete(__dst[0]);
LABEL_41:
  v30 = xpc_dictionary_get_value(*a2, (const char *)__src);
  *(_QWORD *)&block.st_dev = v30;
  if (v30)
    xpc_retain(v30);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v240 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)v240);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  IsInternalBuild = TelephonyUtilIsInternalBuild();
  if ((IsInternalBuild & 1) != 0 || (IsInternalBuild = TelephonyUtilIsCarrierBuild(), (_DWORD)IsInternalBuild))
    CompressionMode = capabilities::trace::getCompressionMode((capabilities::trace *)IsInternalBuild);
  else
    CompressionMode = 2;
  v239 = 0;
  v33 = (const void *)*MEMORY[0x24BDFC970];
  v34 = strlen((const char *)*MEMORY[0x24BDFC970]);
  if (v34 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v35 = (void *)v34;
  if (v34 >= 0x17)
  {
    v37 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v34 | 7) != 0x17)
      v37 = v34 | 7;
    v38 = v37 + 1;
    v36 = operator new(v37 + 1);
    __dst[2] = (xpc_object_t)(v38 | 0x8000000000000000);
    __dst[0] = v36;
    __dst[1] = v35;
    goto LABEL_57;
  }
  HIBYTE(__dst[2]) = v34;
  v36 = __dst;
  if (v34)
LABEL_57:
    memmove(v36, v33, (size_t)v35);
  *((_BYTE *)v35 + (_QWORD)v36) = 0;
  memset(&block, 0, 24);
  if (prop::compression::get((char *)__dst, (uint64_t)&block))
  {
    LODWORD(v245.__r_.__value_.__l.__data_) = -1431655766;
    if (util::convert<int>((const std::string *)&block, &v245, 0))
      CompressionMode = LODWORD(v245.__r_.__value_.__l.__data_);
    else
      CompressionMode = CompressionMode;
  }
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_64;
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_64;
  }
  operator delete(__dst[0]);
LABEL_64:
  v205 = (const __CFString **)*MEMORY[0x24BE05800];
  v39 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE05800]);
  *(_QWORD *)&block.st_dev = v39;
  if (v39)
    xpc_retain(v39);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v40 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)CompressionMode);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  if (v40)
  {
    v239 = 0;
    v41 = (const void *)*MEMORY[0x24BDFC7F8];
    v42 = strlen((const char *)*MEMORY[0x24BDFC7F8]);
    if (v42 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v43 = (void *)v42;
    if (v42 >= 0x17)
    {
      v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v42 | 7) != 0x17)
        v45 = v42 | 7;
      v46 = v45 + 1;
      v44 = operator new(v45 + 1);
      __dst[2] = (xpc_object_t)(v46 | 0x8000000000000000);
      __dst[0] = v44;
      __dst[1] = v43;
    }
    else
    {
      HIBYTE(__dst[2]) = v42;
      v44 = __dst;
      if (!v42)
      {
LABEL_78:
        *((_BYTE *)v43 + (_QWORD)v44) = 0;
        memset(&block, 0, 24);
        if (prop::compression::get((char *)__dst, (uint64_t)&block))
          util::convert<BOOL>((const std::string *)&block, &v239, 0);
        if (SHIBYTE(block.st_gid) < 0)
        {
          operator delete(*(void **)&block.st_dev);
          if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
            goto LABEL_82;
        }
        else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
        {
LABEL_82:
          v47 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE056C8]);
          *(_QWORD *)&block.st_dev = v47;
          if (v47)
            xpc_retain(v47);
          else
            *(_QWORD *)&block.st_dev = xpc_null_create();
          v239 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)v239);
          xpc_release(*(xpc_object_t *)&block.st_dev);
          goto LABEL_88;
        }
        operator delete(__dst[0]);
        goto LABEL_82;
      }
    }
    memmove(v44, v41, (size_t)v43);
    goto LABEL_78;
  }
LABEL_88:
  v238 = 1;
  v48 = (void *)*MEMORY[0x24BE05498];
  v49 = strlen((const char *)*MEMORY[0x24BE05498]);
  if (v49 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v50 = (void *)v49;
  if (v49 >= 0x17)
  {
    v52 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v49 | 7) != 0x17)
      v52 = v49 | 7;
    v53 = v52 + 1;
    v51 = operator new(v52 + 1);
    __dst[2] = (xpc_object_t)(v53 | 0x8000000000000000);
    __dst[0] = v51;
    __dst[1] = v50;
    goto LABEL_95;
  }
  HIBYTE(__dst[2]) = v49;
  v51 = __dst;
  if (v49)
LABEL_95:
    memmove(v51, v48, (size_t)v50);
  *((_BYTE *)v50 + (_QWORD)v51) = 0;
  memset(&block, 0, 24);
  if (prop::systemlogs::get((char *)__dst, (uint64_t)&block))
    util::convert<BOOL>((const std::string *)&block, (BOOL *)&v238, 0);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_100;
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_100;
  }
  operator delete(__dst[0]);
LABEL_100:
  v54 = xpc_dictionary_get_value(*a2, (const char *)v48);
  *(_QWORD *)&block.st_dev = v54;
  if (v54)
    xpc_retain(v54);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v238 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)v238);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  size = HIBYTE(v241[0].__r_.__value_.__r.__words[2]);
  if ((v241[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v241[0].__r_.__value_.__l.__size_;
  if (!size)
    std::string::__assign_external(v241, (const std::string::value_type *)*MEMORY[0x24BE04EC0]);
  v56 = (const void *)*MEMORY[0x24BE04E90];
  v57 = strlen((const char *)*MEMORY[0x24BE04E90]);
  if (v57 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v58 = (void *)v57;
  v204 = (const __CFString **)v48;
  if (v57 >= 0x17)
  {
    v60 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v57 | 7) != 0x17)
      v60 = v57 | 7;
    v61 = v60 + 1;
    v59 = operator new(v60 + 1);
    __dst[2] = (xpc_object_t)(v61 | 0x8000000000000000);
    __dst[0] = v59;
    __dst[1] = v58;
    goto LABEL_116;
  }
  HIBYTE(__dst[2]) = v57;
  v59 = __dst;
  if (v57)
LABEL_116:
    memmove(v59, v56, (size_t)v58);
  *((_BYTE *)v58 + (_QWORD)v59) = 0;
  memset(&block, 0, 24);
  v201 = a3;
  if (!prop::systemlogs::get((char *)__dst, (uint64_t)&block))
  {
    data = 0;
    if ((SHIBYTE(block.st_gid) & 0x80000000) == 0)
      goto LABEL_125;
    goto LABEL_124;
  }
  LODWORD(v245.__r_.__value_.__l.__data_) = -1431655766;
  if (util::convert<int>((const std::string *)&block, &v245, 0))
    data = v245.__r_.__value_.__l.__data_;
  else
    data = 0;
  if (SHIBYTE(block.st_gid) < 0)
LABEL_124:
    operator delete(*(void **)&block.st_dev);
LABEL_125:
  if (SHIBYTE(__dst[2]) < 0)
    operator delete(__dst[0]);
  v203 = (const __CFString **)*MEMORY[0x24BE04F98];
  v63 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE04F98]);
  *(_QWORD *)&block.st_dev = v63;
  if (v63)
    xpc_retain(v63);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v64 = xpc::dyn_cast_or_default((xpc *)&block, (const object *)data);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  if ((TelephonyUtilIsInternalBuild() & 1) != 0
    || ((IsCarrierBuild = TelephonyUtilIsCarrierBuild(), v64 != 2) ? (v66 = 1) : (v66 = IsCarrierBuild), (v66 & 1) != 0))
  {
    if (v64 == 2)
    {
      v67 = (uint64_t **)a1[32];
      if (v67)
      {
        v68 = a1[11];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          abm::helper::asString();
          if ((block.st_gid & 0x80000000) == 0)
            p_block = &block;
          else
            p_block = *(stat **)&block.st_dev;
          LODWORD(__dst[0]) = 136315138;
          *(xpc_object_t *)((char *)__dst + 4) = p_block;
          _os_log_impl(&dword_24B855000, v68, OS_LOG_TYPE_DEFAULT, "#I Detected a log dump with sysdiagnose mode, overriding compression mode to %s", (uint8_t *)__dst, 0xCu);
          if (SHIBYTE(block.st_gid) < 0)
            operator delete(*(void **)&block.st_dev);
          v67 = (uint64_t **)a1[32];
        }
        BBLogTracker::addLog(v67, (__int128 *)v243, 2, (uint64_t)__sz);
        v70 = (uint64_t *)a1[32];
        if ((unint64_t)v70[2] >= 0xB)
        {
          do
            std::__tree<std::__value_type<std::string,std::shared_ptr<LogInfo>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<LogInfo>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<LogInfo>>>>::erase(v70, *v70);
          while ((unint64_t)v70[2] > 0xA);
        }
        v40 = 0;
      }
      v202 = 2;
    }
    else
    {
      v202 = v64;
    }
  }
  else
  {
    v71 = a1[11];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_error_impl(&dword_24B855000, v71, OS_LOG_TYPE_ERROR, "Detected a log dump with SYSDIAGNOSE mode in customer build, overriding to OFF", (uint8_t *)&block, 2u);
    }
    v202 = 0;
  }
  memset(__dst, 170, 24);
  v72 = (const void *)*MEMORY[0x24BDFC720];
  v73 = strlen((const char *)*MEMORY[0x24BDFC720]);
  if (v73 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v74 = (void *)v73;
  if (v73 >= 0x17)
  {
    v76 = (v73 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v73 | 7) != 0x17)
      v76 = v73 | 7;
    v77 = v76 + 1;
    v75 = operator new(v76 + 1);
    __dst[2] = (xpc_object_t)(v77 | 0x8000000000000000);
    __dst[0] = v75;
    __dst[1] = v74;
LABEL_160:
    memmove(v75, v72, (size_t)v74);
    *((_BYTE *)v74 + (_QWORD)v75) = 0;
    if (!v40)
      goto LABEL_177;
    goto LABEL_161;
  }
  HIBYTE(__dst[2]) = v73;
  v75 = __dst;
  if (v73)
    goto LABEL_160;
  LOBYTE(__dst[0]) = 0;
  if (!v40)
    goto LABEL_177;
LABEL_161:
  v78 = v40;
  v79 = a1;
  v80 = (const void *)*MEMORY[0x24BDFC738];
  v81 = strlen((const char *)*MEMORY[0x24BDFC738]);
  v82 = SHIBYTE(v243[2]);
  if (SHIBYTE(v243[2]) >= 0)
    v83 = HIBYTE(v243[2]);
  else
    v83 = (size_t)v243[1];
  v84 = v83 + v81;
  memset(&block, 170, 24);
  if (v83 + v81 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v85 = v81;
  if (v84 > 0x16)
  {
    v94 = (v84 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v84 | 7) != 0x17)
      v94 = v84 | 7;
    v95 = v94 + 1;
    v86 = (char *)operator new(v94 + 1);
    block.st_ino = v84;
    *(_QWORD *)&block.st_uid = v95 | 0x8000000000000000;
    *(_QWORD *)&block.st_dev = v86;
    v40 = v78;
    if (!v85)
      goto LABEL_168;
    goto LABEL_167;
  }
  memset(&block, 0, 24);
  v86 = (char *)&block;
  HIBYTE(block.st_gid) = v83 + v81;
  v40 = v78;
  if (v81)
LABEL_167:
    memcpy(v86, v80, v85);
LABEL_168:
  v87 = &v86[v85];
  if (v83)
  {
    if (v82 >= 0)
      v88 = v243;
    else
      v88 = (void **)v243[0];
    memmove(v87, v88, v83);
  }
  v87[v83] = 0;
  v89 = std::string::append((std::string *)&block, "/", 1uLL);
  v90 = (void *)v89->__r_.__value_.__r.__words[0];
  v245.__r_.__value_.__r.__words[0] = v89->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v245.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v89->__r_.__value_.__r.__words[1] + 7);
  v91 = HIBYTE(v89->__r_.__value_.__r.__words[2]);
  v89->__r_.__value_.__l.__size_ = 0;
  v89->__r_.__value_.__r.__words[2] = 0;
  v89->__r_.__value_.__r.__words[0] = 0;
  a1 = v79;
  if (SHIBYTE(__dst[2]) < 0)
    operator delete(__dst[0]);
  __dst[0] = v90;
  __dst[1] = v245.__r_.__value_.__l.__data_;
  *(xpc_object_t *)((char *)&__dst[1] + 7) = *(xpc_object_t *)((char *)v245.__r_.__value_.__r.__words + 7);
  HIBYTE(__dst[2]) = v91;
  v7 = MEMORY[0x24BDACFA0];
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
LABEL_177:
  support::fs::createDir((const char *)__dst, 0x1EDu, 1);
  if ((__sz[2] & 0x8000000000000000) == 0)
    v92 = HIBYTE(__sz[2]);
  else
    v92 = __sz[1];
  if (v92 == strlen(__s))
  {
    v93 = (__sz[2] & 0x8000000000000000) == 0 ? __sz : (std::string::size_type *)__sz[0];
    if (!memcmp(v93, __s, v92))
    {
      v237 = 9;
      strcpy((char *)__p, "StateDump");
      if (SHIBYTE(v241[0].__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v235, v241[0].__r_.__value_.__l.__data_, v241[0].__r_.__value_.__l.__size_);
      else
        v235 = v241[0];
      TraceManager::submitTraceMetric_sync((uint64_t)a1, (const char *)__p, (const char *)&v235);
      if (SHIBYTE(v235.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v235.__r_.__value_.__l.__data_);
      if (v237 < 0)
        operator delete(__p[0]);
    }
  }
  memset(&v245, 0, sizeof(v245));
  TraceFilter::determineFilterAction(&v245);
  v96 = (const void *)*MEMORY[0x24BE05280];
  v97 = strlen((const char *)*MEMORY[0x24BE05280]);
  if (v97 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v98 = v97;
  if (v97 >= 0x17)
  {
    v101 = (v97 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v97 | 7) != 0x17)
      v101 = v97 | 7;
    v102 = v101 + 1;
    v99 = operator new(v101 + 1);
    block.st_ino = v98;
    *(_QWORD *)&block.st_uid = v102 | 0x8000000000000000;
    *(_QWORD *)&block.st_dev = v99;
  }
  else
  {
    HIBYTE(block.st_gid) = v97;
    v99 = &block;
    if (!v97)
    {
      v100 = v40;
      goto LABEL_204;
    }
  }
  v100 = v40;
  memmove(v99, v96, v98);
LABEL_204:
  *((_BYTE *)v99 + v98) = 0;
  st_gid_high = SHIBYTE(block.st_gid);
  v104 = *(void **)&block.st_dev;
  if ((block.st_gid & 0x80000000) == 0)
    v105 = &block;
  else
    v105 = *(stat **)&block.st_dev;
  if ((v245.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v106 = &v245;
  else
    v106 = (std::string *)v245.__r_.__value_.__r.__words[0];
  v107 = strlen((const char *)v96);
  v108 = strncasecmp((const char *)v105, (const char *)v106, v107);
  v109 = v108;
  if (st_gid_high < 0)
  {
    operator delete(v104);
    v110 = v100;
    if (!v109)
      goto LABEL_215;
    goto LABEL_214;
  }
  v110 = v100;
  if (v108)
LABEL_214:
    std::string::append(v241, " (some logs are dropped due to not enough space on device!)", 0x3BuLL);
LABEL_215:
  v111 = a1[11];
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
  {
    v112 = &v245;
    if ((v245.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v112 = (std::string *)v245.__r_.__value_.__r.__words[0];
    block.st_dev = 136315138;
    *(_QWORD *)&block.st_mode = v112;
    _os_log_impl(&dword_24B855000, v111, OS_LOG_TYPE_DEFAULT, "#I Trace filter '%s'", (uint8_t *)&block, 0xCu);
  }
  cf = 0;
  v113 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v116 = Mutable;
  if (Mutable)
    cf = Mutable;
  if (SHIBYTE(v241[0].__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&block, v241[0].__r_.__value_.__l.__data_, v241[0].__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&block.st_dev = *(_OWORD *)&v241[0].__r_.__value_.__l.__data_;
    *(_QWORD *)&block.st_uid = *((_QWORD *)&v241[0].__r_.__value_.__l + 2);
  }
  ctu::cf::insert<char const*,std::string>(v116, v212, (uint64_t)&block, (uint64_t)v113, v115);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(v243[2]) & 0x80000000) == 0)
      goto LABEL_226;
  }
  else if ((SHIBYTE(v243[2]) & 0x80000000) == 0)
  {
LABEL_226:
    *(_OWORD *)&block.st_dev = *(_OWORD *)v243;
    *(void **)&block.st_uid = v243[2];
    goto LABEL_229;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, (const std::string::value_type *)v243[0], (std::string::size_type)v243[1]);
LABEL_229:
  ctu::cf::insert<char const*,std::string>(v116, v211, (uint64_t)&block, (uint64_t)v113, v117);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_231;
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
LABEL_231:
    *(_OWORD *)&block.st_dev = *(_OWORD *)__dst;
    *(xpc_object_t *)&block.st_uid = __dst[2];
    goto LABEL_234;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, (const std::string::value_type *)__dst[0], (std::string::size_type)__dst[1]);
LABEL_234:
  ctu::cf::insert<char const*,std::string>(v116, (const __CFString **)*MEMORY[0x24BE05268], (uint64_t)&block, (uint64_t)v113, v118);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(__sz[2]) & 0x80000000) == 0)
      goto LABEL_236;
  }
  else if ((SHIBYTE(__sz[2]) & 0x80000000) == 0)
  {
LABEL_236:
    *(_OWORD *)&block.st_dev = *(_OWORD *)__sz;
    *(_QWORD *)&block.st_uid = __sz[2];
    goto LABEL_239;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, (const std::string::value_type *)__sz[0], __sz[1]);
LABEL_239:
  ctu::cf::insert<char const*,std::string>(v116, v210, (uint64_t)&block, (uint64_t)v113, v119);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(v245.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_241;
  }
  else if ((SHIBYTE(v245.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_241:
    *(_OWORD *)&block.st_dev = *(_OWORD *)&v245.__r_.__value_.__l.__data_;
    *(_QWORD *)&block.st_uid = *((_QWORD *)&v245.__r_.__value_.__l + 2);
    goto LABEL_244;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, v245.__r_.__value_.__l.__data_, v245.__r_.__value_.__l.__size_);
LABEL_244:
  ctu::cf::insert<char const*,std::string>(v116, (const __CFString **)*MEMORY[0x24BE051A8], (uint64_t)&block, (uint64_t)v113, v120);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(v242[2]) & 0x80000000) == 0)
      goto LABEL_246;
  }
  else if ((SHIBYTE(v242[2]) & 0x80000000) == 0)
  {
LABEL_246:
    *(_OWORD *)&block.st_dev = *(_OWORD *)v242;
    *(void **)&block.st_uid = v242[2];
    goto LABEL_249;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, (const std::string::value_type *)v242[0], (std::string::size_type)v242[1]);
LABEL_249:
  ctu::cf::insert<char const*,std::string>(v116, v209, (uint64_t)&block, (uint64_t)v113, v121);
  if (SHIBYTE(block.st_gid) < 0)
  {
    operator delete(*(void **)&block.st_dev);
    if ((SHIBYTE(v241[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_251;
  }
  else if ((SHIBYTE(v241[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_251:
    *(_OWORD *)&block.st_dev = *(_OWORD *)&v241[1].__r_.__value_.__l.__data_;
    *(_QWORD *)&block.st_uid = *((_QWORD *)&v241[1].__r_.__value_.__l + 2);
    goto LABEL_254;
  }
  std::string::__init_copy_ctor_external((std::string *)&block, v241[1].__r_.__value_.__l.__data_, v241[1].__r_.__value_.__l.__size_);
LABEL_254:
  ctu::cf::insert<char const*,std::string>(v116, v208, (uint64_t)&block, (uint64_t)v113, v122);
  if (SHIBYTE(block.st_gid) < 0)
    operator delete(*(void **)&block.st_dev);
  ctu::cf::insert<char const*,int>(v116, v207, v206, v113, v123);
  ctu::cf::insert<char const*,int>(v116, v205, v110, v113, v124);
  ctu::cf::insert<char const*,BOOL>(v116, (const __CFString **)*MEMORY[0x24BE056C8], v239, (uint64_t)v113, v125);
  ctu::cf::insert<char const*,int>(v116, v203, v202, v113, v126);
  ctu::cf::insert<char const*,BOOL>(v116, v204, v238, (uint64_t)v113, v127);
  v128 = (const __CFString **)*MEMORY[0x24BE052E0];
  v129 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE052E0]);
  *(_QWORD *)&block.st_dev = v129;
  if (v129)
    xpc_retain(v129);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v130 = xpc::dyn_cast_or_default((xpc *)&block, 0);
  ctu::cf::insert<char const*,BOOL>(v116, v128, v130, (uint64_t)v113, v131);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  v132 = (const __CFString **)*MEMORY[0x24BE052F8];
  v133 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE052F8]);
  *(_QWORD *)&block.st_dev = v133;
  if (v133)
    xpc_retain(v133);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v134 = xpc::dyn_cast_or_default((xpc *)&block, 0);
  ctu::cf::insert<char const*,BOOL>(v116, v132, v134, (uint64_t)v113, v135);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  v136 = (const __CFString **)*MEMORY[0x24BE052F0];
  v137 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x24BE052F0]);
  *(_QWORD *)&block.st_dev = v137;
  if (v137)
    xpc_retain(v137);
  else
    *(_QWORD *)&block.st_dev = xpc_null_create();
  v138 = xpc::dyn_cast_or_default((xpc *)&block, 0);
  ctu::cf::insert<char const*,BOOL>(v116, v136, v138, (uint64_t)v113, v139);
  xpc_release(*(xpc_object_t *)&block.st_dev);
  ctu::cf::insert<char const*,BOOL>(v116, (const __CFString **)__src, v240, (uint64_t)v113, v140);
  v232 = 0xAAAAAAAAAAAAAAAALL;
  v233 = 0xAAAAAAAAAAAAAAAALL;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  v142 = MEMORY[0x24BDAC760];
  *(_QWORD *)&block.st_dev = MEMORY[0x24BDAC760];
  block.st_ino = 0x40000000;
  *(_QWORD *)&block.st_uid = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  *(_QWORD *)&block.st_rdev = &__block_descriptor_tmp_13_5;
  block.st_atimespec.tv_sec = (__darwin_time_t)&GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v143 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v231 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_270;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v143 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v231 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_270;
  }
  v144 = (unint64_t *)(v143 + 8);
  do
    v145 = __ldxr(v144);
  while (__stxr(v145 + 1, v144));
LABEL_270:
  abm::HelperClient::create();
  if (*((_QWORD *)&v231 + 1))
  {
    v146 = (unint64_t *)(*((_QWORD *)&v231 + 1) + 8);
    do
      v147 = __ldaxr(v146);
    while (__stlxr(v147 - 1, v146));
    if (!v147)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v231 + 1) + 16))(*((_QWORD *)&v231 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v231 + 1));
    }
  }
  v148 = xpc_dictionary_create(0, 0, 0);
  if (v148 || (v148 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v148) == v7)
    {
      xpc_retain(v148);
      v149 = v148;
    }
    else
    {
      v149 = xpc_null_create();
    }
  }
  else
  {
    v149 = xpc_null_create();
    v148 = 0;
  }
  xpc_release(v148);
  v230 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v150 = xpc_dictionary_create(0, 0, 0);
  v151 = v150;
  if (v150)
  {
    v230 = v150;
  }
  else
  {
    v151 = xpc_null_create();
    v230 = v151;
    if (!v151)
    {
      v152 = xpc_null_create();
      v151 = 0;
      goto LABEL_288;
    }
  }
  if (MEMORY[0x24BD2A468](v151) == v7)
  {
    xpc_retain(v151);
    goto LABEL_289;
  }
  v152 = xpc_null_create();
LABEL_288:
  v230 = v152;
LABEL_289:
  xpc_release(v151);
  v153 = xpc_int64_create(1500);
  if (!v153)
    v153 = xpc_null_create();
  xpc_dictionary_set_value(v149, (const char *)*MEMORY[0x24BDFC790], v153);
  v154 = xpc_null_create();
  xpc_release(v153);
  xpc_release(v154);
  if (prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04EE8], v155)
    || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE05920], v156)
    || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04F58], v157))
  {
    v158 = (const __CFString ***)MEMORY[0x24BDFC760];
    v159 = (const void *)*MEMORY[0x24BDFC760];
    v160 = strlen((const char *)*MEMORY[0x24BDFC760]);
    if (v160 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v161 = (void *)v160;
    if (v160 >= 0x17)
    {
      v163 = (v160 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v160 | 7) != 0x17)
        v163 = v160 | 7;
      v164 = v163 + 1;
      v162 = operator new(v163 + 1);
      v228[1] = v161;
      v229 = v164 | 0x8000000000000000;
      v228[0] = v162;
    }
    else
    {
      HIBYTE(v229) = v160;
      v162 = v228;
      if (!v160)
      {
LABEL_302:
        *((_BYTE *)v161 + (_QWORD)v162) = 0;
        v165.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v165.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&block.st_blksize = v165;
        *(timespec *)block.st_qspare = v165;
        block.st_birthtimespec = v165;
        *(timespec *)&block.st_size = v165;
        block.st_mtimespec = v165;
        block.st_ctimespec = v165;
        *(timespec *)&block.st_uid = v165;
        block.st_atimespec = v165;
        *(timespec *)&block.st_dev = v165;
        if (v229 >= 0)
          v166 = v228;
        else
          v166 = (void **)v228[0];
        v167 = stat((const char *)v166, &block);
        v169 = v167;
        if (SHIBYTE(v229) < 0)
        {
          operator delete(v228[0]);
          if (v169)
            goto LABEL_307;
        }
        else if (v167)
        {
LABEL_307:
          *(_QWORD *)&v170 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v170 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&block.st_dev = v170;
          *(_OWORD *)&block.st_uid = v170;
          v227 = v149;
          if (v149)
            xpc_retain(v149);
          else
            v227 = xpc_null_create();
          abm::HelperClient::perform();
          xpc_release(v227);
          v227 = 0;
          if (!block.st_dev)
            ctu::cf::insert<char const*,char const*>((__CFDictionary *)cf, (const __CFString **)*MEMORY[0x24BE05868], *v158, (uint64_t)v113, v171);
          if (*((char *)&block.st_rdev + 7) < 0)
            operator delete((void *)block.st_ino);
          goto LABEL_318;
        }
        ctu::cf::insert<char const*,char const*>((__CFDictionary *)cf, (const __CFString **)*MEMORY[0x24BE05868], *v158, (uint64_t)v113, v168);
        goto LABEL_318;
      }
    }
    memmove(v162, v159, (size_t)v161);
    goto LABEL_302;
  }
  v172 = a1[11];
  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl(&dword_24B855000, v172, OS_LOG_TYPE_DEFAULT, "#I mobile BasebandServices path is disabled as baseband log is off", (uint8_t *)&block, 2u);
  }
LABEL_318:
  v173 = (std::__shared_weak_count *)a1[16];
  *(_QWORD *)&block.st_dev = a1[15];
  if (!v173 || (block.st_ino = (__darwin_ino64_t)std::__shared_weak_count::lock(v173)) == 0)
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v174 = (const void *)*MEMORY[0x24BE05420];
  v175 = strlen((const char *)*MEMORY[0x24BE05420]);
  if (v175 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v176 = (void *)v175;
  if (v175 >= 0x17)
  {
    v179 = (v175 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v175 | 7) != 0x17)
      v179 = v175 | 7;
    v180 = v179 + 1;
    v177 = operator new(v179 + 1);
    v225[1] = v176;
    v226 = v180 | 0x8000000000000000;
    v225[0] = v177;
LABEL_328:
    memmove(v177, v174, (size_t)v176);
    *((_BYTE *)v176 + (_QWORD)v177) = 0;
    v178 = cf;
    if (!cf)
      goto LABEL_331;
    goto LABEL_329;
  }
  HIBYTE(v226) = v175;
  v177 = v225;
  if (v175)
    goto LABEL_328;
  LOBYTE(v225[0]) = 0;
  v178 = cf;
  if (!cf)
    goto LABEL_331;
LABEL_329:
  v181 = CFGetTypeID(v178);
  if (v181 == CFDictionaryGetTypeID())
  {
    v224 = v178;
    CFRetain(v178);
    goto LABEL_332;
  }
LABEL_331:
  v224 = 0;
LABEL_332:
  aBlock[0] = v142;
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_40_0;
  aBlock[4] = a1;
  v216 = *(_OWORD *)&block.st_dev;
  if (block.st_ino)
  {
    v182 = (unint64_t *)(block.st_ino + 8);
    do
      v183 = __ldxr(v182);
    while (__stxr(v183 + 1, v182));
  }
  v217 = v232;
  v218 = (std::__shared_weak_count *)v233;
  if (v233)
  {
    v184 = (unint64_t *)(v233 + 8);
    do
      v185 = __ldxr(v184);
    while (__stxr(v185 + 1, v184));
  }
  v219 = v149;
  if (!v149)
  {
    v219 = xpc_null_create();
    v220 = v178;
    if (!v178)
      goto LABEL_343;
    goto LABEL_342;
  }
  xpc_retain(v149);
  v178 = cf;
  v220 = cf;
  if (cf)
LABEL_342:
    CFRetain(v178);
LABEL_343:
  v186 = *v201;
  if (*v201)
    v186 = _Block_copy(v186);
  v221 = v186;
  if (SHIBYTE(v241[0].__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v222, v241[0].__r_.__value_.__l.__data_, v241[0].__r_.__value_.__l.__size_);
  else
    v222 = v241[0];
  v223 = _Block_copy(aBlock);
  Service::broadcastEvent((uint64_t)a1, (uint64_t)v225, &v224, (const void **)&v223);
  if (v223)
    _Block_release(v223);
  if (v224)
    CFRelease(v224);
  if ((SHIBYTE(v226) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v222.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_354;
LABEL_357:
    operator delete(v222.__r_.__value_.__l.__data_);
    v187 = v221;
    if (!v221)
      goto LABEL_359;
    goto LABEL_358;
  }
  operator delete(v225[0]);
  if (SHIBYTE(v222.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_357;
LABEL_354:
  v187 = v221;
  if (v221)
LABEL_358:
    _Block_release(v187);
LABEL_359:
  if (v220)
    CFRelease(v220);
  xpc_release(v219);
  v219 = 0;
  v188 = v218;
  if (v218)
  {
    p_shared_owners = (unint64_t *)&v218->__shared_owners_;
    do
      v190 = __ldaxr(p_shared_owners);
    while (__stlxr(v190 - 1, p_shared_owners));
    if (!v190)
    {
      ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
      std::__shared_weak_count::__release_weak(v188);
    }
  }
  v191 = (std::__shared_weak_count *)*((_QWORD *)&v216 + 1);
  if (*((_QWORD *)&v216 + 1))
  {
    v192 = (unint64_t *)(*((_QWORD *)&v216 + 1) + 8);
    do
      v193 = __ldaxr(v192);
    while (__stlxr(v193 - 1, v192));
    if (!v193)
    {
      ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
      std::__shared_weak_count::__release_weak(v191);
    }
  }
  st_ino = (std::__shared_weak_count *)block.st_ino;
  if (block.st_ino)
  {
    v195 = (unint64_t *)(block.st_ino + 8);
    do
      v196 = __ldaxr(v195);
    while (__stlxr(v196 - 1, v195));
    if (!v196)
    {
      ((void (*)(std::__shared_weak_count *))st_ino->__on_zero_shared)(st_ino);
      std::__shared_weak_count::__release_weak(st_ino);
    }
  }
  xpc_release(v230);
  xpc_release(v149);
  v197 = (std::__shared_weak_count *)v233;
  if (!v233)
    goto LABEL_380;
  v198 = (unint64_t *)(v233 + 8);
  do
    v199 = __ldaxr(v198);
  while (__stlxr(v199 - 1, v198));
  if (v199)
  {
LABEL_380:
    v200 = cf;
    if (!cf)
      goto LABEL_382;
    goto LABEL_381;
  }
  ((void (*)(std::__shared_weak_count *))v197->__on_zero_shared)(v197);
  std::__shared_weak_count::__release_weak(v197);
  v200 = cf;
  if (cf)
LABEL_381:
    CFRelease(v200);
LABEL_382:
  if (SHIBYTE(v245.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v245.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
    {
LABEL_384:
      if ((SHIBYTE(v241[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_385;
      goto LABEL_392;
    }
  }
  else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
  {
    goto LABEL_384;
  }
  operator delete(__dst[0]);
  if ((SHIBYTE(v241[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_385:
    if ((SHIBYTE(v241[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_386;
    goto LABEL_393;
  }
LABEL_392:
  operator delete(v241[0].__r_.__value_.__l.__data_);
  if ((SHIBYTE(v241[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_386:
    if ((SHIBYTE(v242[2]) & 0x80000000) == 0)
      goto LABEL_387;
    goto LABEL_394;
  }
LABEL_393:
  operator delete(v241[1].__r_.__value_.__l.__data_);
  if ((SHIBYTE(v242[2]) & 0x80000000) == 0)
  {
LABEL_387:
    if ((SHIBYTE(v243[2]) & 0x80000000) == 0)
      goto LABEL_388;
    goto LABEL_395;
  }
LABEL_394:
  operator delete(v242[0]);
  if ((SHIBYTE(v243[2]) & 0x80000000) == 0)
  {
LABEL_388:
    if ((SHIBYTE(__sz[2]) & 0x80000000) == 0)
      return;
LABEL_396:
    operator delete((void *)__sz[0]);
    return;
  }
LABEL_395:
  operator delete(v243[0]);
  if (SHIBYTE(__sz[2]) < 0)
    goto LABEL_396;
}

void sub_24B93981C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,xpc_object_t a32,uint64_t a33,void *aBlock,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,xpc_object_t a43,void *a44,uint64_t a45,uint64_t a46,xpc_object_t object,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,void *__p,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  xpc_object_t a64;
  char a69;
  xpc_object_t a70;
  char a72;
  void *a73;
  char a74;
  void *a75;
  char a76;

  if (a62 < 0)
    operator delete(__p);
  if (SLOBYTE(STACK[0x247]) < 0)
    operator delete((void *)STACK[0x230]);
  if (a69 < 0)
    operator delete(a64);
  if (a72 < 0)
    operator delete(a70);
  if (a74 < 0)
    operator delete(a73);
  if (a76 < 0)
    operator delete(a75);
  if (SLOBYTE(STACK[0x217]) < 0)
    operator delete((void *)STACK[0x200]);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_40c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE48c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  void *v6;
  xpc_object_t result;

  v4 = *(const void **)(a2 + 40);
  if (v4)
  {
    v5 = _Block_copy(v4);
    v6 = *(void **)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v5;
    *(_QWORD *)(a1 + 48) = v6;
    if (v6)
      return xpc_retain(v6);
  }
  else
  {
    v6 = *(void **)(a2 + 48);
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = v6;
    if (v6)
      return xpc_retain(v6);
  }
  result = xpc_null_create();
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_e8_40c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE48c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
  v2 = *(const void **)(a1 + 40);
  if (v2)
    _Block_release(v2);
}

void TraceManager::submitTraceMetric_sync(uint64_t a1, const char *a2, const char *a3)
{
  NSObject *v3;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  const void *v22;
  size_t v23;
  size_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const void *v28;
  xpc_object_t object;
  uint8_t buf[8];
  size_t v31;
  unint64_t v32;

  v3 = *(NSObject **)(a1 + 88);
  if (*(_QWORD *)(a1 + 152))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B855000, v3, OS_LOG_TYPE_DEFAULT, "#I Submitting AWD of trace stats", buf, 2u);
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = MEMORY[0x24BDACFA0];
    if (v7 || (v7 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD2A468](v7) == v8)
      {
        xpc_retain(v7);
        v9 = v7;
      }
      else
      {
        v9 = xpc_null_create();
      }
    }
    else
    {
      v9 = xpc_null_create();
      v7 = 0;
    }
    xpc_release(v7);
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD2A468](v10) == v8)
      {
        xpc_retain(v10);
        v11 = v10;
      }
      else
      {
        v11 = xpc_null_create();
      }
    }
    else
    {
      v11 = xpc_null_create();
      v10 = 0;
    }
    xpc_release(v10);
    if (a2[23] < 0)
      a2 = *(const char **)a2;
    v12 = xpc_string_create(a2);
    if (!v12)
      v12 = xpc_null_create();
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x24BE052D0], v12);
    v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (a3[23] < 0)
      a3 = *(const char **)a3;
    v14 = xpc_string_create(a3);
    if (!v14)
      v14 = xpc_null_create();
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x24BE05440], v14);
    v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    v16 = xpc_string_create((const char *)*MEMORY[0x24BE058A0]);
    if (!v16)
      v16 = xpc_null_create();
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x24BE04E88], v16);
    v17 = xpc_null_create();
    xpc_release(v16);
    xpc_release(v17);
    v18 = xpc_int64_create(524539);
    if (!v18)
      v18 = xpc_null_create();
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x24BE04F38], v18);
    v19 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v19);
    if (v11)
    {
      xpc_retain(v11);
      v20 = v11;
    }
    else
    {
      v20 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x24BE04E80], v20);
    v21 = xpc_null_create();
    xpc_release(v20);
    xpc_release(v21);
    v22 = (const void *)*MEMORY[0x24BE051F0];
    v23 = strlen((const char *)*MEMORY[0x24BE051F0]);
    if (v23 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v24 = v23;
    if (v23 >= 0x17)
    {
      v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17)
        v26 = v23 | 7;
      v27 = v26 + 1;
      v25 = operator new(v26 + 1);
      v31 = v24;
      v32 = v27 | 0x8000000000000000;
      *(_QWORD *)buf = v25;
    }
    else
    {
      HIBYTE(v32) = v23;
      v25 = buf;
      if (!v23)
      {
        buf[0] = 0;
        object = v9;
        if (v9)
        {
LABEL_37:
          xpc_retain(v9);
LABEL_43:
          v28 = 0;
          Service::runCommand(a1, (uint64_t)buf, &object, &v28);
          xpc_release(object);
          object = 0;
          if (SHIBYTE(v32) < 0)
            operator delete(*(void **)buf);
          xpc_release(v11);
          xpc_release(v9);
          return;
        }
LABEL_42:
        object = xpc_null_create();
        goto LABEL_43;
      }
    }
    memmove(v25, v22, v24);
    *((_BYTE *)v25 + v24) = 0;
    object = v9;
    if (v9)
      goto LABEL_37;
    goto LABEL_42;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_24B855000, v3, OS_LOG_TYPE_ERROR, "Baseband manager is not ready yet", buf, 2u);
  }
}

void sub_24B93A260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  xpc_release(v17);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

uint64_t ___ZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  std::string::size_type v3;
  unint64_t *v4;
  unint64_t v5;
  void *v6;
  const void *v7;
  void *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  std::string *v13;
  std::string::size_type v14;
  unint64_t *v15;
  unint64_t v16;
  xpc_object_t v17;
  const void *v18;
  void *v19;
  std::string *v20;
  NSObject *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  std::string::size_type v27;
  std::string::size_type v28;
  xpc_object_t object;
  _QWORD *v30;
  const void *v31;
  void *aBlock;
  std::string v33;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 56);
  v28 = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = *(void **)(a1 + 72);
  object = v6;
  if (!v6)
  {
    object = xpc_null_create();
    v7 = *(const void **)(a1 + 80);
    v30 = v2;
    v31 = v7;
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  xpc_retain(v6);
  v7 = *(const void **)(a1 + 80);
  v30 = v2;
  v31 = v7;
  if (v7)
LABEL_8:
    CFRetain(v7);
LABEL_9:
  v8 = *(void **)(a1 + 88);
  if (v8)
    v8 = _Block_copy(v8);
  aBlock = v8;
  if (*(char *)(a1 + 119) < 0)
    std::string::__init_copy_ctor_external(&v33, *(const std::string::value_type **)(a1 + 96), *(_QWORD *)(a1 + 104));
  else
    v33 = *(std::string *)(a1 + 96);
  v9 = (std::__shared_weak_count *)v2[16];
  if (!v9 || (v10 = v2[15], (v11 = std::__shared_weak_count::lock(v9)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v12 = v11;
  v13 = (std::string *)operator new(0x48uLL);
  v14 = v28;
  v13->__r_.__value_.__r.__words[0] = v27;
  v13->__r_.__value_.__l.__size_ = v14;
  if (v14)
  {
    v15 = (unint64_t *)(v14 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = object;
  v13->__r_.__value_.__r.__words[2] = (std::string::size_type)object;
  if (!v17)
  {
    v13->__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
    v18 = v31;
    v13[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
    v13[1].__r_.__value_.__l.__size_ = (std::string::size_type)v18;
    if (!v18)
      goto LABEL_24;
    goto LABEL_23;
  }
  xpc_retain(v17);
  v18 = v31;
  v13[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  v13[1].__r_.__value_.__l.__size_ = (std::string::size_type)v18;
  if (v18)
LABEL_23:
    CFRetain(v18);
LABEL_24:
  v19 = aBlock;
  if (aBlock)
    v19 = _Block_copy(aBlock);
  v13[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v19;
  v20 = v13 + 2;
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v20, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *(_OWORD *)&v33.__r_.__value_.__l.__data_;
    v13[2].__r_.__value_.__r.__words[2] = v33.__r_.__value_.__r.__words[2];
  }
  v21 = v2[17];
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  do
    v23 = __ldxr(p_shared_owners);
  while (__stxr(v23 + 1, p_shared_owners));
  v24 = operator new(0x18uLL);
  *v24 = v13;
  v24[1] = v10;
  v24[2] = v12;
  dispatch_async_f(v21, v24, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_16collectLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb0_E3__1EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_);
  do
    v25 = __ldaxr(p_shared_owners);
  while (__stlxr(v25 - 1, p_shared_owners));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  return _ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev((uint64_t)&v27);
}

void sub_24B93A534(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, void *aBlock)
{
  uint64_t v15;
  const void *v17;
  const void *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;

  v17 = *(const void **)(v15 + 40);
  if (v17)
    _Block_release(v17);
  v18 = *(const void **)(v15 + 32);
  if (v18)
    CFRelease(v18);
  xpc_release(*(xpc_object_t *)(v15 + 16));
  *(_QWORD *)(v15 + 16) = 0;
  v19 = *(std::__shared_weak_count **)(v15 + 8);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
      __clang_call_terminate(a1);
    }
  }
  __clang_call_terminate(a1);
}

uint64_t _ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(uint64_t a1)
{
  const void *v2;
  const void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  if (*(char *)(a1 + 71) < 0)
  {
    operator delete(*(void **)(a1 + 48));
    v2 = *(const void **)(a1 + 40);
    if (!v2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = *(const void **)(a1 + 40);
  if (v2)
LABEL_5:
    _Block_release(v2);
LABEL_6:
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  if (!v4)
    return a1;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (v6)
    return a1;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void __copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE72c15_ZTSN3xpc4dictE80c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE88c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE96c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v4;
  unint64_t *v5;
  unint64_t v6;
  std::string::size_type v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  const void *v11;
  void *v12;
  std::string *v13;
  __int128 v14;

  v4 = *(_QWORD *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *(_QWORD *)(a2 + 64);
  a1[2].__r_.__value_.__l.__size_ = *(_QWORD *)(a2 + 56);
  a1[2].__r_.__value_.__r.__words[2] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = *(void **)(a2 + 72);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
  if (!v10)
  {
    a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    v11 = *(const void **)(a2 + 80);
    a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v11;
    if (!v11)
      goto LABEL_12;
    goto LABEL_11;
  }
  xpc_retain(v10);
  v11 = *(const void **)(a2 + 80);
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v11;
  if (v11)
LABEL_11:
    CFRetain(v11);
LABEL_12:
  v12 = *(void **)(a2 + 88);
  if (v12)
    v12 = _Block_copy(v12);
  a1[3].__r_.__value_.__r.__words[2] = (std::string::size_type)v12;
  v13 = a1 + 4;
  if (*(char *)(a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v13, *(const std::string::value_type **)(a2 + 96), *(_QWORD *)(a2 + 104));
  }
  else
  {
    v14 = *(_OWORD *)(a2 + 96);
    a1[4].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 112);
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
  }
}

void sub_24B93A7C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  xpc_object_t *v4;
  const void **v5;
  const void *v7;

  v7 = *(const void **)(v3 + 88);
  if (v7)
    _Block_release(v7);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v5);
  xpc::dict::~dict(v4);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE72c15_ZTSN3xpc4dictE80c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE88c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE96c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  const void *v2;
  const void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;

  if (*(char *)(a1 + 119) < 0)
  {
    operator delete(*(void **)(a1 + 96));
    v2 = *(const void **)(a1 + 88);
    if (!v2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = *(const void **)(a1 + 88);
  if (v2)
LABEL_5:
    _Block_release(v2);
LABEL_6:
  v3 = *(const void **)(a1 + 80);
  if (v3)
    CFRelease(v3);
  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(_QWORD *)(a1 + 72) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v4)
    goto LABEL_12;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    v7 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v7)
      return;
  }
  else
  {
LABEL_12:
    v7 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v7)
      return;
  }
  v8 = (unint64_t *)&v7->__shared_owners_;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ___ZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEE_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  char *v21;
  char *v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::string *v27;
  NSObject *v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  _QWORD *v34;
  std::string __p;
  void *aBlock;
  int v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  std::string v40;
  char v41;
  xpc_object_t v42;

  v2 = *(_QWORD **)(a1 + 32);
  __p.__r_.__value_.__r.__words[0] = 0;
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    v5 = v4;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
    if (v4 && *(_QWORD *)(a1 + 40))
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (v7)
      {
        v34 = v2;
        if ((*(char *)(a1 + 87) & 0x80000000) == 0)
          goto LABEL_8;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        v34 = v2;
        if ((*(char *)(a1 + 87) & 0x80000000) == 0)
        {
LABEL_8:
          __p = *(std::string *)(a1 + 64);
          v8 = *(void **)(a1 + 56);
          if (!v8)
          {
LABEL_19:
            aBlock = v8;
            v37 = *(_DWORD *)(a1 + 112);
            v14 = *(std::__shared_weak_count **)(a1 + 48);
            v38 = *(_QWORD *)(a1 + 40);
            v39 = v14;
            if (v14)
            {
              p_shared_weak_owners = (unint64_t *)&v14->__shared_weak_owners_;
              do
                v16 = __ldxr(p_shared_weak_owners);
              while (__stxr(v16 + 1, p_shared_weak_owners));
            }
            if (*(char *)(a1 + 111) < 0)
              std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)(a1 + 88), *(_QWORD *)(a1 + 96));
            else
              v40 = *(std::string *)(a1 + 88);
            v41 = *(_BYTE *)(a1 + 116);
            v17 = (std::__shared_weak_count *)v2[16];
            if (!v17 || (v18 = v2[15], (v19 = std::__shared_weak_count::lock(v17)) == 0))
              std::__throw_bad_weak_ptr[abi:ne180100]();
            v20 = v19;
            v21 = (char *)operator new(0x60uLL);
            v22 = v21;
            *(_QWORD *)v21 = v34;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external((std::string *)(v21 + 8), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            else
              *(std::string *)(v21 + 8) = __p;
            v23 = aBlock;
            if (aBlock)
              v23 = _Block_copy(aBlock);
            *((_QWORD *)v22 + 4) = v23;
            *((_DWORD *)v22 + 10) = v37;
            v24 = v39;
            *((_QWORD *)v22 + 6) = v38;
            *((_QWORD *)v22 + 7) = v24;
            if (v24)
            {
              v25 = (unint64_t *)&v24->__shared_weak_owners_;
              do
                v26 = __ldxr(v25);
              while (__stxr(v26 + 1, v25));
            }
            v27 = (std::string *)(v22 + 64);
            if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(v27, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)&v27->__r_.__value_.__l.__data_ = *(_OWORD *)&v40.__r_.__value_.__l.__data_;
              *((_QWORD *)v22 + 10) = *((_QWORD *)&v40.__r_.__value_.__l + 2);
            }
            v22[88] = v41;
            v28 = v2[17];
            v29 = (unint64_t *)&v20->__shared_owners_;
            do
              v30 = __ldxr(v29);
            while (__stxr(v30 + 1, v29));
            v31 = operator new(0x18uLL);
            *v31 = v22;
            v31[1] = v18;
            v31[2] = v20;
            dispatch_async_f(v28, v31, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_24collectBasebandLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb1_E3__2EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_);
            do
              v32 = __ldaxr(v29);
            while (__stlxr(v32 - 1, v29));
            if (v32)
            {
              if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_44;
            }
            else
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
              if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_44:
                v33 = v39;
                if (!v39)
                {
LABEL_46:
                  if (aBlock)
                    _Block_release(aBlock);
                  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__p.__r_.__value_.__l.__data_);
                  return;
                }
LABEL_45:
                std::__shared_weak_count::__release_weak(v33);
                goto LABEL_46;
              }
            }
            operator delete(v40.__r_.__value_.__l.__data_);
            v33 = v39;
            if (!v39)
              goto LABEL_46;
            goto LABEL_45;
          }
LABEL_18:
          v8 = _Block_copy(v8);
          goto LABEL_19;
        }
      }
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 64), *(_QWORD *)(a1 + 72));
      v8 = *(void **)(a1 + 56);
      if (!v8)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else
  {
    v5 = 0;
  }
  v9 = xpc_null_create();
  v10 = *(_QWORD *)(a1 + 56);
  v42 = v9;
  v11 = xpc_null_create();
  (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v10 + 16))(v10, 3760250880, &v42);
  xpc_release(v42);
  xpc_release(v11);
  if (v5)
  {
    v12 = (unint64_t *)&v5->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_24B93AC50(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *aBlock, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  uint64_t v20;
  void **v21;
  std::__shared_weak_count *v23;
  const void *v24;

  v23 = *(std::__shared_weak_count **)(v20 + 56);
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
  v24 = *(const void **)(v20 + 32);
  if (v24)
    _Block_release(v24);
  if (*(char *)(v20 + 31) < 0)
  {
    operator delete(*v21);
    __clang_call_terminate(a1);
  }
  __clang_call_terminate(a1);
}

void __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;

  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *(void **)(a2 + 56);
  if (v7)
    v7 = _Block_copy(v7);
  *(_QWORD *)(a1 + 56) = v7;
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 64), *(const std::string::value_type **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = v8;
  }
  v9 = (std::string *)(a1 + 88);
  if (*(char *)(a2 + 111) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a2 + 88), *(_QWORD *)(a2 + 96));
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
}

void sub_24B93ADD8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  const void *v4;
  std::__shared_weak_count *v5;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  v4 = *(const void **)(v1 + 56);
  if (v4)
    _Block_release(v4);
  v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  if ((*(char *)(a1 + 111) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 87) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(*(void **)(a1 + 64));
    v2 = *(const void **)(a1 + 56);
    if (!v2)
      goto LABEL_8;
    goto LABEL_7;
  }
  operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 87) < 0)
    goto LABEL_6;
LABEL_3:
  v2 = *(const void **)(a1 + 56);
  if (v2)
LABEL_7:
    _Block_release(v2);
LABEL_8:
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

void TraceManager::start(_QWORD *a1, dispatch_object_t *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = v3;
  v8[1] = a1;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[17];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::start(dispatch::group_session)::$_0>(TraceManager::start(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::start(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::start(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void TraceManager::finishInitialization_sync(std::__shared_weak_count **this)
{
  const char *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  const void *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  std::__shared_weak_count *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_weak_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  const void *v24;
  size_t v25;
  void *v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  const void *v34;
  size_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  NSObject *v42;
  const void *v43;
  size_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  NSObject *v51;
  _QWORD v52[6];
  std::__shared_weak_count *v53;
  void *v54;
  dispatch_object_t v55;
  void *v56[2];
  unint64_t v57;
  _QWORD v58[6];
  std::__shared_weak_count *v59;
  void *v60;
  dispatch_object_t object;
  void *__p[2];
  unint64_t v63;
  _QWORD aBlock[6];
  std::__shared_weak_count *v65;
  const void *v66;
  dispatch_object_t v67;
  void *v68[2];
  unint64_t v69;
  const void *v70;
  void *__dst[2];
  unint64_t v72;
  __int128 v73;

  v2 = (const char *)((uint64_t (*)(std::__shared_weak_count **))(*this)->__shared_weak_owners_)(this);
  v3 = strlen(v2);
  if (v3 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v72 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v72) = v3;
    v5 = __dst;
    if (!v3)
      goto LABEL_9;
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  v70 = 0;
  AppleBasebandManager::create();
  v8 = v73;
  v73 = 0uLL;
  v9 = this[20];
  *(_OWORD *)(this + 19) = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_18;
  v13 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v14)
  {
LABEL_18:
    v15 = v70;
    if (!v70)
      goto LABEL_20;
    goto LABEL_19;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  v15 = v70;
  if (v70)
LABEL_19:
    CFRelease(v15);
LABEL_20:
  if (SHIBYTE(v72) < 0)
    operator delete(__dst[0]);
  v16 = this[16];
  if (!v16 || (v17 = this[15], (v18 = std::__shared_weak_count::lock(v16)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v19 = v18;
  p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
  do
    v21 = __ldxr(p_shared_weak_owners);
  while (__stxr(v21 + 1, p_shared_weak_owners));
  v22 = (unint64_t *)&v18->__shared_owners_;
  do
    v23 = __ldaxr(v22);
  while (__stlxr(v23 - 1, v22));
  if (!v23)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v19);
  }
  v24 = (const void *)*MEMORY[0x24BE05658];
  v25 = strlen((const char *)*MEMORY[0x24BE05658]);
  if (v25 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v26 = (void *)v25;
  if (v25 >= 0x17)
  {
    v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v28 = v25 | 7;
    v29 = v28 + 1;
    v27 = (void **)operator new(v28 + 1);
    v68[1] = v26;
    v69 = v29 | 0x8000000000000000;
    v68[0] = v27;
  }
  else
  {
    HIBYTE(v69) = v25;
    v27 = v68;
    if (!v25)
      goto LABEL_38;
  }
  memmove(v27, v24, (size_t)v26);
LABEL_38:
  *((_BYTE *)v26 + (_QWORD)v27) = 0;
  v30 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_60_0;
  aBlock[4] = this;
  aBlock[5] = v17;
  v65 = v19;
  do
    v31 = __ldxr(p_shared_weak_owners);
  while (__stxr(v31 + 1, p_shared_weak_owners));
  v32 = _Block_copy(aBlock);
  v33 = this[17];
  if (v33)
    dispatch_retain((dispatch_object_t)this[17]);
  v66 = v32;
  v67 = v33;
  AppleBasebandManager::setEventHandler();
  if (v67)
    dispatch_release(v67);
  if (v66)
    _Block_release(v66);
  if (SHIBYTE(v69) < 0)
    operator delete(v68[0]);
  v34 = (const void *)*MEMORY[0x24BE05420];
  v35 = strlen((const char *)*MEMORY[0x24BE05420]);
  if (v35 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v36 = (void *)v35;
  if (v35 >= 0x17)
  {
    v38 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v35 | 7) != 0x17)
      v38 = v35 | 7;
    v39 = v38 + 1;
    v37 = operator new(v38 + 1);
    __p[1] = v36;
    v63 = v39 | 0x8000000000000000;
    __p[0] = v37;
  }
  else
  {
    HIBYTE(v63) = v35;
    v37 = __p;
    if (!v35)
      goto LABEL_56;
  }
  memmove(v37, v34, (size_t)v36);
LABEL_56:
  *((_BYTE *)v36 + (_QWORD)v37) = 0;
  v58[0] = v30;
  v58[1] = 1174405120;
  v58[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_61;
  v58[3] = &__block_descriptor_tmp_64_2;
  v58[4] = this;
  v58[5] = v17;
  v59 = v19;
  do
    v40 = __ldxr(p_shared_weak_owners);
  while (__stxr(v40 + 1, p_shared_weak_owners));
  v41 = _Block_copy(v58);
  v42 = this[17];
  if (v42)
    dispatch_retain((dispatch_object_t)this[17]);
  v60 = v41;
  object = v42;
  AppleBasebandManager::setEventHandler();
  if (object)
    dispatch_release(object);
  if (v60)
    _Block_release(v60);
  if (SHIBYTE(v63) < 0)
    operator delete(__p[0]);
  v43 = (const void *)*MEMORY[0x24BE05428];
  v44 = strlen((const char *)*MEMORY[0x24BE05428]);
  if (v44 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v45 = (void *)v44;
  if (v44 >= 0x17)
  {
    v47 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v44 | 7) != 0x17)
      v47 = v44 | 7;
    v48 = v47 + 1;
    v46 = operator new(v47 + 1);
    v56[1] = v45;
    v57 = v48 | 0x8000000000000000;
    v56[0] = v46;
  }
  else
  {
    HIBYTE(v57) = v44;
    v46 = v56;
    if (!v44)
      goto LABEL_74;
  }
  memmove(v46, v43, (size_t)v45);
LABEL_74:
  *((_BYTE *)v45 + (_QWORD)v46) = 0;
  v52[0] = v30;
  v52[1] = 1174405120;
  v52[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_65;
  v52[3] = &__block_descriptor_tmp_67_0;
  v52[4] = this;
  v52[5] = v17;
  v53 = v19;
  do
    v49 = __ldxr(p_shared_weak_owners);
  while (__stxr(v49 + 1, p_shared_weak_owners));
  v50 = _Block_copy(v52);
  v51 = this[17];
  if (v51)
    dispatch_retain((dispatch_object_t)this[17]);
  v54 = v50;
  v55 = v51;
  AppleBasebandManager::setEventHandler();
  if (v55)
    dispatch_release(v55);
  if (v54)
    _Block_release(v54);
  if (SHIBYTE(v57) < 0)
    operator delete(v56[0]);
  AppleBasebandManager::eventsOn((AppleBasebandManager *)this[19]);
  if (v53)
    std::__shared_weak_count::__release_weak(v53);
  if (v59)
    std::__shared_weak_count::__release_weak(v59);
  if (v65)
    std::__shared_weak_count::__release_weak(v65);
  std::__shared_weak_count::__release_weak(v19);
}

void sub_24B93B520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30,char a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,std::__shared_weak_count *a45)
{
  std::__shared_weak_count *v45;

  if (a15)
    std::__shared_weak_count::__release_weak(a15);
  if (a30)
    std::__shared_weak_count::__release_weak(a30);
  if (a45)
    std::__shared_weak_count::__release_weak(a45);
  std::__shared_weak_count::__release_weak(v45);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  const void *v9;
  const char *v10;
  void **v11;
  _BYTE *v12;
  size_t v13;
  NSObject *v14;
  _BYTE *v15;
  int v16;
  size_t v17;
  _BYTE *v18;
  const char *v19;
  _BYTE *v20;
  const void *v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  char *v32;
  char *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const std::string::value_type *v39;
  size_t v40;
  std::string::size_type v41;
  std::string *p_buf;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  void *v48;
  std::string::size_type v49;
  xpc_object_t v50;
  xpc_object_t v51;
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  void *v58;
  std::string::size_type v59;
  xpc_object_t v60;
  xpc_object_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  std::string::size_type v66;
  void *v67;
  int v68;
  size_t v69;
  void **v70;
  const void *v71;
  void **v72;
  NSObject *v73;
  void **v74;
  xpc_object_t v75;
  uint64_t v76;
  const void *v77;
  size_t v78;
  void *v79;
  void **v80;
  uint64_t v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  void *v87;
  NSObject *v88;
  const void *v89;
  size_t v90;
  void *v91;
  void **v92;
  xpc_object_t v93;
  xpc_object_t v94;
  void *v95;
  uint64_t v96;
  NSObject *size;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  const void *v107;
  size_t v108;
  void *v109;
  void **v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  const void *v114;
  size_t v115;
  void *v116;
  void **v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  xpc_object_t v121;
  xpc_object_t v122;
  const void *v123;
  size_t v124;
  void *v125;
  void **v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  int v130;
  const void *v131;
  size_t v132;
  void *v133;
  void **v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  NSObject *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  std::__shared_weak_count *v143;
  unint64_t *v144;
  unint64_t v145;
  unint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  const void *v150;
  size_t v151;
  void *v152;
  void **v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  const void *v157;
  size_t v158;
  void *v159;
  void **v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  NSObject *v164;
  xpc_object_t v165;
  uint64_t v166;
  const char *v167;
  const void *v168;
  size_t v169;
  NSObject *v170;
  void *p_p;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  xpc_object_t v175;
  xpc_object_t v176;
  NSObject *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  xpc_object_t v181;
  uint64_t v182;
  size_t v183;
  void *v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  NSObject *v188;
  std::__shared_weak_count *v189;
  unint64_t *v190;
  unint64_t v191;
  std::__shared_weak_count *v192;
  unint64_t *v193;
  unint64_t v194;
  const char *v195;
  xpc_object_t v196;
  xpc_object_t v197;
  std::string *v198;
  xpc_object_t v199;
  xpc_object_t v200;
  std::string *v201;
  xpc_object_t v202;
  xpc_object_t v203;
  const char *v204;
  xpc_object_t v205;
  xpc_object_t v206;
  xpc_object_t v207;
  xpc_object_t v208;
  xpc_object_t v209;
  xpc_object_t v210;
  const char *v211;
  char Bool;
  xpc_object_t v213;
  xpc_object_t v214;
  const char *v215;
  char v216;
  xpc_object_t v217;
  xpc_object_t v218;
  const char *v219;
  char v220;
  xpc_object_t v221;
  xpc_object_t v222;
  std::__shared_weak_count *v223;
  uint64_t v224;
  std::__shared_weak_count *v225;
  std::__shared_weak_count *v226;
  unint64_t *p_shared_weak_owners;
  unint64_t v228;
  unint64_t *v229;
  unint64_t v230;
  const void *v231;
  size_t v232;
  NSObject *v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  std::__shared_weak_count *v237;
  abm::client::Event *v238;
  unint64_t *v239;
  unint64_t v240;
  unint64_t v241;
  void *v242;
  size_t v243;
  void *v244;
  void **v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  void **v249;
  std::__shared_weak_count *v250;
  std::__shared_weak_count *v251;
  unint64_t *v252;
  unint64_t v253;
  unint64_t *p_shared_owners;
  unint64_t v255;
  char *__s;
  int Int;
  void *v258[2];
  NSObject *v259;
  xpc_object_t v260;
  _QWORD v261[5];
  _QWORD v262[2];
  void *v263[2];
  NSObject *v264;
  xpc_object_t object;
  _QWORD aBlock[5];
  _QWORD v267[2];
  _QWORD v268[2];
  void *v269[2];
  NSObject *v270;
  xpc_object_t v271;
  _QWORD v272[5];
  _QWORD v273[2];
  void *v274[2];
  NSObject *v275;
  xpc_object_t v276;
  _QWORD v277[6];
  std::__shared_weak_count *v278;
  abm::client::Event *v279;
  std::__shared_weak_count *v280;
  void *v281[2];
  NSObject *v282;
  xpc_object_t v283;
  _QWORD v284[6];
  std::__shared_weak_count *v285;
  abm::client::Event *v286;
  std::__shared_weak_count *v287;
  std::string v288;
  void *v289[2];
  unint64_t v290;
  void *v291[2];
  NSObject *v292;
  xpc_object_t v293;
  _QWORD v294[5];
  _QWORD v295[2];
  void *v296[2];
  NSObject *v297;
  xpc_object_t v298;
  _QWORD v299[6];
  std::__shared_weak_count *v300;
  abm::client::Event *v301;
  std::__shared_weak_count *v302;
  std::string v303;
  void *v304[2];
  unint64_t v305;
  _QWORD v306[6];
  std::__shared_weak_count *v307;
  uint64_t v308;
  std::__shared_weak_count *v309;
  const void *v310;
  xpc_object_t v311;
  void *__p;
  dispatch_object_t v313;
  unint64_t v314;
  void *v315[2];
  NSObject *v316;
  xpc_object_t v317;
  void *__dst[3];
  std::string v319;
  void *v320[3];
  _BYTE v321[24];
  _QWORD v322[2];
  unint64_t v323;
  uint64_t v324;
  std::__shared_weak_count *v325;
  uint64_t v326;
  std::string buf;
  uint64_t v328;

  v328 = *MEMORY[0x24BDAC8D0];
  v3 = (std::__shared_weak_count *)a1[6];
  if (!v3)
    return;
  v5 = a1[4];
  v6 = std::__shared_weak_count::lock(v3);
  v325 = v6;
  if (!v6)
    return;
  v7 = v6;
  v8 = a1[5];
  v324 = v8;
  if (!v8)
  {
LABEL_474:
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v255 = __ldaxr(p_shared_owners);
    while (__stlxr(v255 - 1, p_shared_owners));
    if (!v255)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  v323 = 0xAAAAAAAAAAAAAAAALL;
  abm::client::Event::getData(*(abm::client::Event **)a2);
  v9 = (const void *)0xAAAAAAAAAAAAAAAALL;
  if (ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get)
  {
    v322[0] = 0xAAAAAAAAAAAAAAAALL;
    v322[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v322, (const __CFDictionary *)0xAAAAAAAAAAAAAAAALL);
    memset(v321, 170, sizeof(v321));
    v10 = (const char *)*MEMORY[0x24BE05198];
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&buf, (const char *)*MEMORY[0x24BE05198]);
    ctu::cf::map_adapter::getString();
    MEMORY[0x24BD29478](&buf);
    v11 = (void **)(v5 + 192);
    if ((_BYTE *)(v5 + 192) != v321)
    {
      if (*(char *)(v5 + 215) < 0)
      {
        if (v321[23] >= 0)
          v12 = v321;
        else
          v12 = *(_BYTE **)v321;
        if (v321[23] >= 0)
          v13 = v321[23];
        else
          v13 = *(_QWORD *)&v321[8];
        std::string::__assign_no_alias<false>(v11, v12, v13);
      }
      else if ((v321[23] & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v11, *(void **)v321, *(size_t *)&v321[8]);
      }
      else
      {
        *(_OWORD *)v11 = *(_OWORD *)v321;
        *(_QWORD *)(v5 + 208) = *(_QWORD *)&v321[16];
      }
    }
    v14 = *(NSObject **)(v5 + 88);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v321;
      if (v321[23] < 0)
        v15 = *(_BYTE **)v321;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      _os_log_impl(&dword_24B855000, v14, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&buf, 0xCu);
    }
    v16 = v321[23];
    if (v321[23] >= 0)
      v17 = v321[23];
    else
      v17 = *(_QWORD *)&v321[8];
    if (v17 != strlen((const char *)*MEMORY[0x24BE05530])
      || (v321[23] >= 0 ? (v18 = v321) : (v18 = *(_BYTE **)v321), memcmp(v18, (const void *)*MEMORY[0x24BE05530], v17)))
    {
      v19 = (const char *)*MEMORY[0x24BE05340];
      if (v17 == strlen((const char *)*MEMORY[0x24BE05340]))
      {
        v20 = v16 >= 0 ? v321 : *(_BYTE **)v321;
        if (!memcmp(v20, v19, v17))
        {
          memset(&buf, 170, 16);
          v284[0] = MEMORY[0x24BDAC760];
          v284[1] = 1174405120;
          v284[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_49;
          v284[3] = &__block_descriptor_tmp_50_0;
          v284[4] = v5;
          v284[5] = v8;
          v285 = v7;
          v43 = (unint64_t *)&v7->__shared_owners_;
          do
            v44 = __ldxr(v43);
          while (__stxr(v44 + 1, v43));
          v45 = *(std::__shared_weak_count **)(a2 + 8);
          v286 = *(abm::client::Event **)a2;
          v287 = v45;
          if (v45)
          {
            v46 = (unint64_t *)&v45->__shared_owners_;
            do
              v47 = __ldxr(v46);
            while (__stxr(v47 + 1, v46));
          }
          v48 = _Block_copy(v284);
          v49 = *(_QWORD *)(v5 + 136);
          if (v49)
            dispatch_retain(*(dispatch_object_t *)(v5 + 136));
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v48;
          buf.__r_.__value_.__l.__size_ = v49;
          v50 = xpc_dictionary_create(0, 0, 0);
          if (v50 || (v50 = xpc_null_create()) != 0)
          {
            if (MEMORY[0x24BD2A468](v50) == MEMORY[0x24BDACFA0])
            {
              xpc_retain(v50);
              v51 = v50;
            }
            else
            {
              v51 = xpc_null_create();
            }
          }
          else
          {
            v51 = xpc_null_create();
            v50 = 0;
          }
          xpc_release(v50);
          v93 = xpc_string_create(v19);
          if (!v93)
            v93 = xpc_null_create();
          xpc_dictionary_set_value(v51, v10, v93);
          v94 = xpc_null_create();
          xpc_release(v93);
          xpc_release(v94);
          v283 = v51;
          if (v51)
            xpc_retain(v51);
          else
            v283 = xpc_null_create();
          v282 = 0;
          if (buf.__r_.__value_.__r.__words[0])
            v95 = _Block_copy(buf.__r_.__value_.__l.__data_);
          else
            v95 = 0;
          v96 = *MEMORY[0x24BDFC878];
          size = buf.__r_.__value_.__l.__size_;
          v281[0] = v95;
          v281[1] = (void *)buf.__r_.__value_.__l.__size_;
          if (buf.__r_.__value_.__l.__size_)
            dispatch_retain((dispatch_object_t)buf.__r_.__value_.__l.__size_);
          TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)9, v96, 0x1388u, 0, &v283, &v282, v281);
          if (size)
            dispatch_release(size);
          if (v95)
            _Block_release(v95);
          xpc_release(v283);
          v283 = 0;
          xpc_release(v51);
          if (buf.__r_.__value_.__l.__size_)
            dispatch_release((dispatch_object_t)buf.__r_.__value_.__l.__size_);
          if (buf.__r_.__value_.__r.__words[0])
            _Block_release(buf.__r_.__value_.__l.__data_);
          v98 = v287;
          if (v287)
          {
            v99 = (unint64_t *)&v287->__shared_owners_;
            do
              v100 = __ldaxr(v99);
            while (__stlxr(v100 - 1, v99));
            if (!v100)
            {
              ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
              std::__shared_weak_count::__release_weak(v98);
            }
          }
          v101 = v285;
          if (!v285)
            goto LABEL_468;
          v102 = (unint64_t *)&v285->__shared_owners_;
          do
            v103 = __ldaxr(v102);
          while (__stlxr(v103 - 1, v102));
LABEL_266:
          if (!v103)
          {
            ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
            std::__shared_weak_count::__release_weak(v101);
          }
          goto LABEL_468;
        }
      }
      v21 = (const void *)*MEMORY[0x24BE05418];
      if (v17 != strlen((const char *)*MEMORY[0x24BE05418])
        || (v16 >= 0 ? (v22 = v321) : (v22 = *(_BYTE **)v321), memcmp(v22, v21, v17)))
      {
        if (v17 == strlen((const char *)*MEMORY[0x24BE051C8]))
        {
          v23 = v16 >= 0 ? v321 : *(_BYTE **)v321;
          if (!memcmp(v23, (const void *)*MEMORY[0x24BE051C8], v17))
          {
            v320[0] = (void *)0xAAAAAAAAAAAAAAAALL;
            v320[1] = (void *)0xAAAAAAAAAAAAAAAALL;
            v24 = MEMORY[0x24BDAC760];
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 1174405120;
            aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_55;
            aBlock[3] = &__block_descriptor_tmp_56_1;
            aBlock[4] = v5;
            v267[0] = v8;
            v267[1] = v7;
            v25 = (unint64_t *)&v7->__shared_owners_;
            do
              v26 = __ldxr(v25);
            while (__stxr(v26 + 1, v25));
            v27 = *(_QWORD *)(a2 + 8);
            v268[0] = *(_QWORD *)a2;
            v268[1] = v27;
            if (v27)
            {
              v28 = (unint64_t *)(v27 + 8);
              do
                v29 = __ldxr(v28);
              while (__stxr(v29 + 1, v28));
            }
            v30 = _Block_copy(aBlock);
            v31 = *(void **)(v5 + 136);
            if (v31)
              dispatch_retain(*(dispatch_object_t *)(v5 + 136));
            v320[0] = v30;
            v320[1] = v31;
            LODWORD(v319.__r_.__value_.__l.__data_) = -1431655766;
            v32 = (char *)std::string::basic_string[abi:ne180100]<0>(&buf, (char *)*MEMORY[0x24BE04E90]);
            prop::bbtrace::get<diag::config::Mode>(v32, (int *)&v319);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            LODWORD(__dst[0]) = -1431655766;
            v33 = (char *)std::string::basic_string[abi:ne180100]<0>(&buf, (char *)*MEMORY[0x24BE05048]);
            prop::bbtrace::get<abm::traceOwnership>(v33, (int *)__dst);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            if (LODWORD(v319.__r_.__value_.__l.__data_) == 4 && LODWORD(__dst[0]) == 1)
            {
              v34 = *(NSObject **)(v5 + 88);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                _os_log_impl(&dword_24B855000, v34, OS_LOG_TYPE_DEFAULT, "#N Baseband is dead while Cellular Logging is running. Cellular Logging will be stopped.", (uint8_t *)&buf, 2u);
              }
              v264 = 0;
              object = xpc_null_create();
              v261[0] = v24;
              v261[1] = 1174405120;
              v261[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_57;
              v261[3] = &__block_descriptor_tmp_58_2;
              v261[4] = v5;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v262, (uint64_t)v320);
              v35 = _Block_copy(v261);
              v36 = *MEMORY[0x24BDFC8F8];
              v37 = *(void **)(v5 + 136);
              if (v37)
                dispatch_retain(*(dispatch_object_t *)(v5 + 136));
              v263[0] = v35;
              v263[1] = v37;
              TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)0xA, v36, 0x1388u, 1, &object, &v264, v263);
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v263);
              xpc_release(object);
              object = 0;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v262);
            }
            else
            {
              v75 = xpc_null_create();
              v76 = *MEMORY[0x24BDFC818];
              v259 = 0;
              v260 = v75;
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v258, (uint64_t)v320);
              TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)9, v76, 0x7D0u, 0, &v260, &v259, v258);
              dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v258);
              xpc_release(v260);
              v260 = 0;
            }
            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v320);
            std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v268);
            std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)v267);
          }
        }
LABEL_468:
        if ((v321[23] & 0x80000000) != 0)
          operator delete(*(void **)v321);
        MEMORY[0x24BD294A8](v322);
        v9 = (const void *)v323;
        goto LABEL_471;
      }
      TraceManager::updateBasebandFWInfo((TraceManager *)v5);
      v319.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
      v319.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      v52 = MEMORY[0x24BDAC760];
      v277[0] = MEMORY[0x24BDAC760];
      v277[1] = 1174405120;
      v277[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_51;
      v277[3] = &__block_descriptor_tmp_52_2;
      v277[4] = v5;
      v277[5] = v8;
      v278 = v7;
      v53 = (unint64_t *)&v7->__shared_owners_;
      do
        v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
      v55 = *(std::__shared_weak_count **)(a2 + 8);
      v279 = *(abm::client::Event **)a2;
      v280 = v55;
      if (v55)
      {
        v56 = (unint64_t *)&v55->__shared_owners_;
        do
          v57 = __ldxr(v56);
        while (__stxr(v57 + 1, v56));
      }
      v58 = _Block_copy(v277);
      v59 = *(_QWORD *)(v5 + 136);
      if (v59)
        dispatch_retain(*(dispatch_object_t *)(v5 + 136));
      v319.__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
      v319.__r_.__value_.__l.__size_ = v59;
      v60 = xpc_dictionary_create(0, 0, 0);
      if (v60 || (v60 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2A468](v60) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(v60);
          v61 = v60;
        }
        else
        {
          v61 = xpc_null_create();
        }
      }
      else
      {
        v61 = xpc_null_create();
        v60 = 0;
      }
      xpc_release(v60);
      v121 = xpc_string_create((const char *)v21);
      if (!v121)
        v121 = xpc_null_create();
      xpc_dictionary_set_value(v61, v10, v121);
      v122 = xpc_null_create();
      xpc_release(v121);
      xpc_release(v122);
      v123 = (const void *)*MEMORY[0x24BE04E90];
      v124 = strlen((const char *)*MEMORY[0x24BE04E90]);
      if (v124 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v125 = (void *)v124;
      if (v124 >= 0x17)
      {
        v127 = (v124 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v124 | 7) != 0x17)
          v127 = v124 | 7;
        v128 = v127 + 1;
        v126 = (void **)operator new(v127 + 1);
        v320[1] = v125;
        v320[2] = (void *)(v128 | 0x8000000000000000);
        v320[0] = v126;
      }
      else
      {
        HIBYTE(v320[2]) = v124;
        v126 = v320;
        if (!v124)
        {
LABEL_221:
          *((_BYTE *)v125 + (_QWORD)v126) = 0;
          memset(&buf, 0, sizeof(buf));
          v129 = -1431655766;
          v130 = -1431655766;
          if (prop::bbtrace::get((char *)v320, (uint64_t)&buf))
          {
            LODWORD(__dst[0]) = -1431655766;
            if (util::convert<int>(&buf, __dst, 0))
              v130 = (int)__dst[0];
            else
              v130 = -1431655766;
          }
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);
          if (SHIBYTE(v320[2]) < 0)
            operator delete(v320[0]);
          v131 = (const void *)*MEMORY[0x24BE05048];
          v132 = strlen((const char *)*MEMORY[0x24BE05048]);
          if (v132 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v133 = (void *)v132;
          if (v132 >= 0x17)
          {
            v135 = (v132 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v132 | 7) != 0x17)
              v135 = v132 | 7;
            v136 = v135 + 1;
            v134 = (void **)operator new(v135 + 1);
            v320[1] = v133;
            v320[2] = (void *)(v136 | 0x8000000000000000);
            v320[0] = v134;
          }
          else
          {
            HIBYTE(v320[2]) = v132;
            v134 = v320;
            if (!v132)
            {
LABEL_237:
              *((_BYTE *)v133 + (_QWORD)v134) = 0;
              memset(&buf, 0, sizeof(buf));
              if (prop::bbtrace::get((char *)v320, (uint64_t)&buf))
              {
                LODWORD(__dst[0]) = -1431655766;
                if (util::convert<int>(&buf, __dst, 0))
                  v129 = (int)__dst[0];
                else
                  v129 = -1431655766;
              }
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(buf.__r_.__value_.__l.__data_);
                if ((SHIBYTE(v320[2]) & 0x80000000) == 0)
                {
LABEL_243:
                  v137 = (uint64_t *)MEMORY[0x24BDFC828];
                  if (v130 != 4)
                    goto LABEL_253;
LABEL_247:
                  if (v129 == 1)
                  {
                    v138 = *(NSObject **)(v5 + 88);
                    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                      _os_log_impl(&dword_24B855000, v138, OS_LOG_TYPE_DEFAULT, "#N Resume notification will be sent to cellular logging after all traces are started.", (uint8_t *)&buf, 2u);
                    }
                    v275 = 0;
                    v276 = xpc_null_create();
                    v272[0] = v52;
                    v272[1] = 1174405120;
                    v272[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_53;
                    v272[3] = &__block_descriptor_tmp_54;
                    v272[4] = v5;
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v273, (uint64_t)&v319);
                    v139 = _Block_copy(v272);
                    v140 = *v137;
                    v141 = *(void **)(v5 + 136);
                    if (v141)
                      dispatch_retain(*(dispatch_object_t *)(v5 + 136));
                    v274[0] = v139;
                    v274[1] = v141;
                    TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)9, v140, 0x1388u, 0, &v276, &v275, v274);
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v274);
                    xpc_release(v276);
                    v276 = 0;
                    dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v273);
                    goto LABEL_254;
                  }
LABEL_253:
                  v142 = *v137;
                  xpc::dict::dict((xpc::dict *)&v271, v61);
                  v270 = 0;
                  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v269, (uint64_t)&v319);
                  TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)9, v142, 0x1388u, 0, &v271, &v270, v269);
                  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v269);
                  xpc_release(v271);
                  v271 = 0;
LABEL_254:
                  TraceManager::setupDumpLogsIndication_sync((NSObject **)v5);
                  xpc_release(v61);
                  if (v319.__r_.__value_.__l.__size_)
                    dispatch_release((dispatch_object_t)v319.__r_.__value_.__l.__size_);
                  if (v319.__r_.__value_.__r.__words[0])
                    _Block_release(v319.__r_.__value_.__l.__data_);
                  v143 = v280;
                  if (v280)
                  {
                    v144 = (unint64_t *)&v280->__shared_owners_;
                    do
                      v145 = __ldaxr(v144);
                    while (__stlxr(v145 - 1, v144));
                    if (!v145)
                    {
                      ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
                      std::__shared_weak_count::__release_weak(v143);
                    }
                  }
                  v101 = v278;
                  if (!v278)
                    goto LABEL_468;
                  v146 = (unint64_t *)&v278->__shared_owners_;
                  do
                    v103 = __ldaxr(v146);
                  while (__stlxr(v103 - 1, v146));
                  goto LABEL_266;
                }
              }
              else if ((SHIBYTE(v320[2]) & 0x80000000) == 0)
              {
                goto LABEL_243;
              }
              operator delete(v320[0]);
              v137 = (uint64_t *)MEMORY[0x24BDFC828];
              if (v130 != 4)
                goto LABEL_253;
              goto LABEL_247;
            }
          }
          memmove(v134, v131, (size_t)v133);
          goto LABEL_237;
        }
      }
      memmove(v126, v123, (size_t)v125);
      goto LABEL_221;
    }
    memset(v320, 170, sizeof(v320));
    v38 = (const char *)*MEMORY[0x24BE051A0];
    memset(&buf, 0, sizeof(buf));
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v319, v38);
    ctu::cf::map_adapter::getString();
    MEMORY[0x24BD29478](&v319);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    memset(&v319, 170, sizeof(v319));
    v39 = (const std::string::value_type *)*MEMORY[0x24BE04EC0];
    v40 = strlen((const char *)*MEMORY[0x24BE04EC0]);
    if (v40 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v41 = v40;
    if (v40 >= 0x17)
    {
      v62 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v40 | 7) != 0x17)
        v62 = v40 | 7;
      v63 = v62 + 1;
      p_buf = (std::string *)operator new(v62 + 1);
      buf.__r_.__value_.__l.__size_ = v41;
      buf.__r_.__value_.__r.__words[2] = v63 | 0x8000000000000000;
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
    }
    else
    {
      *((_BYTE *)&buf.__r_.__value_.__s + 23) = v40;
      p_buf = &buf;
      if (!v40)
      {
LABEL_94:
        v64 = (const char *)*MEMORY[0x24BE052E8];
        p_buf->__r_.__value_.__s.__data_[v41] = 0;
        ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)__dst, v64);
        ctu::cf::map_adapter::getString();
        MEMORY[0x24BD29478](__dst);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        v65 = (const char *)*MEMORY[0x24BE04E78];
        ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&buf, (const char *)*MEMORY[0x24BE04E78]);
        Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v322, (const __CFString *)buf.__r_.__value_.__l.__data_);
        MEMORY[0x24BD29478](&buf);
        v66 = HIBYTE(v319.__r_.__value_.__r.__words[2]);
        if ((v319.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v66 = v319.__r_.__value_.__l.__size_;
        if (!v66)
          std::string::__assign_external(&v319, v39);
        v67 = (void *)*MEMORY[0x24BE051D0];
        v68 = SHIBYTE(v320[2]);
        if (SHIBYTE(v320[2]) >= 0)
          v69 = HIBYTE(v320[2]);
        else
          v69 = (size_t)v320[1];
        if (v69 != strlen((const char *)*MEMORY[0x24BE051D0])
          || (SHIBYTE(v320[2]) >= 0 ? (v70 = v320) : (v70 = (void **)v320[0]), memcmp(v70, v67, v69)))
        {
          v71 = (const void *)*MEMORY[0x24BE051D8];
          if (v69 != strlen((const char *)*MEMORY[0x24BE051D8])
            || (v68 >= 0 ? (v72 = v320) : (v72 = (void **)v320[0]), memcmp(v72, v71, v69)))
          {
            v73 = *(NSObject **)(v5 + 88);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              v74 = (void **)v320[0];
              if (v68 >= 0)
                v74 = v320;
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v74;
              _os_log_impl(&dword_24B855000, v73, OS_LOG_TYPE_DEFAULT, "#I Invalid reset type [%s]", (uint8_t *)&buf, 0xCu);
            }
LABEL_464:
            if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v319.__r_.__value_.__l.__data_);
            if (SHIBYTE(v320[2]) < 0)
              operator delete(v320[0]);
            goto LABEL_468;
          }
          v313 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
          __p = (void *)0xAAAAAAAAAAAAAAAALL;
          v299[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_45;
          v299[3] = &__block_descriptor_tmp_46_0;
          v299[4] = v5;
          v299[5] = v324;
          v81 = MEMORY[0x24BDAC760];
          v299[0] = MEMORY[0x24BDAC760];
          v299[1] = 1174405120;
          v300 = v325;
          if (v325)
          {
            v82 = (unint64_t *)&v325->__shared_owners_;
            do
              v83 = __ldxr(v82);
            while (__stxr(v83 + 1, v82));
          }
          v84 = *(std::__shared_weak_count **)(a2 + 8);
          v301 = *(abm::client::Event **)a2;
          v302 = v84;
          if (v84)
          {
            v85 = (unint64_t *)&v84->__shared_owners_;
            do
              v86 = __ldxr(v85);
            while (__stxr(v86 + 1, v85));
          }
          v87 = _Block_copy(v299);
          v88 = *(NSObject **)(v5 + 136);
          if (v88)
            dispatch_retain(*(dispatch_object_t *)(v5 + 136));
          __p = v87;
          v313 = v88;
          v89 = (const void *)*MEMORY[0x24BE04E90];
          v90 = strlen((const char *)*MEMORY[0x24BE04E90]);
          if (v90 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v91 = (void *)v90;
          if (v90 >= 0x17)
          {
            v147 = (v90 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v90 | 7) != 0x17)
              v147 = v90 | 7;
            v148 = v147 + 1;
            v92 = (void **)operator new(v147 + 1);
            __dst[2] = (void *)(v148 | 0x8000000000000000);
            __dst[0] = v92;
            __dst[1] = v91;
          }
          else
          {
            HIBYTE(__dst[2]) = v90;
            v92 = __dst;
            if (!v90)
            {
LABEL_272:
              *((_BYTE *)v91 + (_QWORD)v92) = 0;
              memset(&buf, 0, sizeof(buf));
              v149 = -1431655766;
              if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
              {
                LODWORD(v326) = -1431655766;
                if (util::convert<int>(&buf, &v326, 0))
                  v149 = v326;
                else
                  v149 = -1431655766;
              }
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                operator delete(buf.__r_.__value_.__l.__data_);
              if (SHIBYTE(__dst[2]) < 0)
                operator delete(__dst[0]);
              v150 = (const void *)*MEMORY[0x24BE05048];
              v151 = strlen((const char *)*MEMORY[0x24BE05048]);
              if (v151 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              v152 = (void *)v151;
              if (v151 >= 0x17)
              {
                v154 = (v151 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v151 | 7) != 0x17)
                  v154 = v151 | 7;
                v155 = v154 + 1;
                v153 = (void **)operator new(v154 + 1);
                __dst[2] = (void *)(v155 | 0x8000000000000000);
                __dst[0] = v153;
                __dst[1] = v152;
              }
              else
              {
                HIBYTE(__dst[2]) = v151;
                v153 = __dst;
                if (!v151)
                {
LABEL_288:
                  *((_BYTE *)v152 + (_QWORD)v153) = 0;
                  memset(&buf, 0, sizeof(buf));
                  v156 = -1431655766;
                  if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                  {
                    LODWORD(v326) = -1431655766;
                    if (util::convert<int>(&buf, &v326, 0))
                      v156 = v326;
                    else
                      v156 = -1431655766;
                  }
                  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(buf.__r_.__value_.__l.__data_);
                  if (SHIBYTE(__dst[2]) < 0)
                    operator delete(__dst[0]);
                  v157 = (const void *)*MEMORY[0x24BE0BF68];
                  v158 = strlen((const char *)*MEMORY[0x24BE0BF68]);
                  if (v158 > 0x7FFFFFFFFFFFFFF7)
                    std::string::__throw_length_error[abi:ne180100]();
                  v159 = (void *)v158;
                  if (v158 >= 0x17)
                  {
                    v161 = (v158 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v158 | 7) != 0x17)
                      v161 = v158 | 7;
                    v162 = v161 + 1;
                    v160 = (void **)operator new(v161 + 1);
                    __dst[2] = (void *)(v162 | 0x8000000000000000);
                    __dst[0] = v160;
                    __dst[1] = v159;
                  }
                  else
                  {
                    HIBYTE(__dst[2]) = v158;
                    v160 = __dst;
                    if (!v158)
                    {
LABEL_304:
                      *((_BYTE *)v159 + (_QWORD)v160) = 0;
                      memset(&buf, 0, sizeof(buf));
                      if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                      {
                        LODWORD(v326) = -1431655766;
                        if (util::convert<int>(&buf, &v326, 0))
                          v163 = v326;
                        else
                          v163 = 0;
                      }
                      else
                      {
                        v163 = 0;
                      }
                      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(buf.__r_.__value_.__l.__data_);
                        if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                        {
LABEL_311:
                          if (v149 != 4)
                            goto LABEL_347;
LABEL_341:
                          if (v156 == 1)
                          {
                            v177 = *(NSObject **)(v5 + 88);
                            if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
                            {
                              LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                              _os_log_impl(&dword_24B855000, v177, OS_LOG_TYPE_DEFAULT, "#N Soft reset detected while Cellular Logging is running. Cellular Logging will be paused.", (uint8_t *)&buf, 2u);
                            }
                            v298 = xpc_null_create();
                            v297 = 0;
                            v294[0] = v81;
                            v294[1] = 1174405120;
                            v294[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_47;
                            v294[3] = &__block_descriptor_tmp_48_1;
                            v294[4] = v5;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v295, (uint64_t)&__p);
                            v178 = _Block_copy(v294);
                            v179 = *MEMORY[0x24BDFC918];
                            v180 = *(void **)(v5 + 136);
                            if (v180)
                              dispatch_retain(*(dispatch_object_t *)(v5 + 136));
                            v296[0] = v178;
                            v296[1] = v180;
                            TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)0xA, v179, 0x1388u, 1, &v298, &v297, v296);
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v296);
                            xpc_release(v298);
                            v298 = 0;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v295);
LABEL_351:
                            v183 = strlen((const char *)v71);
                            if (v183 > 0x7FFFFFFFFFFFFFF7)
                              std::string::__throw_length_error[abi:ne180100]();
                            v184 = (void *)v183;
                            if (v183 >= 0x17)
                            {
                              v186 = (v183 & 0xFFFFFFFFFFFFFFF8) + 8;
                              if ((v183 | 7) != 0x17)
                                v186 = v183 | 7;
                              v187 = v186 + 1;
                              v185 = operator new(v186 + 1);
                              v290 = v187 | 0x8000000000000000;
                              v289[0] = v185;
                              v289[1] = v184;
                            }
                            else
                            {
                              HIBYTE(v290) = v183;
                              v185 = v289;
                              if (!v183)
                              {
LABEL_359:
                                *((_BYTE *)v184 + (_QWORD)v185) = 0;
                                if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
                                  std::string::__init_copy_ctor_external(&v288, v319.__r_.__value_.__l.__data_, v319.__r_.__value_.__l.__size_);
                                else
                                  v288 = v319;
                                TraceManager::submitTraceMetric_sync(v5, (const char *)v289, (const char *)&v288);
                                if (SHIBYTE(v288.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  operator delete(v288.__r_.__value_.__l.__data_);
                                  if ((SHIBYTE(v290) & 0x80000000) == 0)
                                  {
LABEL_364:
                                    v188 = v313;
                                    if (!v313)
                                    {
LABEL_366:
                                      if (__p)
                                        _Block_release(__p);
                                      v189 = v302;
                                      if (v302)
                                      {
                                        v190 = (unint64_t *)&v302->__shared_owners_;
                                        do
                                          v191 = __ldaxr(v190);
                                        while (__stlxr(v191 - 1, v190));
                                        if (!v191)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
                                          std::__shared_weak_count::__release_weak(v189);
                                        }
                                      }
                                      v192 = v300;
                                      if (v300)
                                      {
                                        v193 = (unint64_t *)&v300->__shared_owners_;
                                        do
                                          v194 = __ldaxr(v193);
                                        while (__stlxr(v194 - 1, v193));
                                        if (!v194)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v192->__on_zero_shared)(v192);
                                          std::__shared_weak_count::__release_weak(v192);
                                        }
                                      }
                                      goto LABEL_464;
                                    }
LABEL_365:
                                    dispatch_release(v188);
                                    goto LABEL_366;
                                  }
                                }
                                else if ((SHIBYTE(v290) & 0x80000000) == 0)
                                {
                                  goto LABEL_364;
                                }
                                operator delete(v289[0]);
                                v188 = v313;
                                if (!v313)
                                  goto LABEL_366;
                                goto LABEL_365;
                              }
                            }
                            memmove(v185, v71, (size_t)v184);
                            goto LABEL_359;
                          }
LABEL_347:
                          if (v156 | v149 || v163 != 3)
                          {
                            v181 = xpc_null_create();
                            v182 = *MEMORY[0x24BDFC818];
                            v293 = v181;
                            v292 = 0;
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::callback(v291, (uint64_t)&__p);
                            TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)9, v182, 0x1388u, 0, &v293, &v292, v291);
                            dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)v291);
                            xpc_release(v293);
                            v293 = 0;
                          }
                          else
                          {
                            notify_post("com.apple.cellularlogging.bbreset");
                          }
                          goto LABEL_351;
                        }
                      }
                      else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                      {
                        goto LABEL_311;
                      }
                      operator delete(__dst[0]);
                      if (v149 != 4)
                        goto LABEL_347;
                      goto LABEL_341;
                    }
                  }
                  memmove(v160, v157, (size_t)v159);
                  goto LABEL_304;
                }
              }
              memmove(v153, v150, (size_t)v152);
              goto LABEL_288;
            }
          }
          memmove(v92, v89, (size_t)v91);
          goto LABEL_272;
        }
        v77 = (const void *)*MEMORY[0x24BE04E90];
        v78 = strlen((const char *)*MEMORY[0x24BE04E90]);
        if (v78 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v79 = (void *)v78;
        if (v78 >= 0x17)
        {
          v104 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v78 | 7) != 0x17)
            v104 = v78 | 7;
          v105 = v104 + 1;
          v80 = (void **)operator new(v104 + 1);
          __dst[2] = (void *)(v105 | 0x8000000000000000);
          __dst[0] = v80;
          __dst[1] = v79;
        }
        else
        {
          HIBYTE(__dst[2]) = v78;
          v80 = __dst;
          if (!v78)
          {
LABEL_169:
            *((_BYTE *)v79 + (_QWORD)v80) = 0;
            memset(&buf, 0, sizeof(buf));
            v106 = -1431655766;
            if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
            {
              LODWORD(__p) = -1431655766;
              if (util::convert<int>(&buf, &__p, 0))
                v106 = (int)__p;
              else
                v106 = -1431655766;
            }
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            if (SHIBYTE(__dst[2]) < 0)
              operator delete(__dst[0]);
            v107 = (const void *)*MEMORY[0x24BE05048];
            v108 = strlen((const char *)*MEMORY[0x24BE05048]);
            if (v108 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            v109 = (void *)v108;
            __s = (char *)v67;
            if (v108 >= 0x17)
            {
              v111 = (v108 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v108 | 7) != 0x17)
                v111 = v108 | 7;
              v112 = v111 + 1;
              v110 = (void **)operator new(v111 + 1);
              __dst[2] = (void *)(v112 | 0x8000000000000000);
              __dst[0] = v110;
              __dst[1] = v109;
            }
            else
            {
              HIBYTE(__dst[2]) = v108;
              v110 = __dst;
              if (!v108)
              {
LABEL_185:
                *((_BYTE *)v109 + (_QWORD)v110) = 0;
                memset(&buf, 0, sizeof(buf));
                v113 = -1431655766;
                if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                {
                  LODWORD(__p) = -1431655766;
                  if (util::convert<int>(&buf, &__p, 0))
                    v113 = (int)__p;
                  else
                    v113 = -1431655766;
                }
                if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(buf.__r_.__value_.__l.__data_);
                if (SHIBYTE(__dst[2]) < 0)
                  operator delete(__dst[0]);
                v114 = (const void *)*MEMORY[0x24BE0BF68];
                v115 = strlen((const char *)*MEMORY[0x24BE0BF68]);
                if (v115 > 0x7FFFFFFFFFFFFFF7)
                  std::string::__throw_length_error[abi:ne180100]();
                v116 = (void *)v115;
                if (v115 >= 0x17)
                {
                  v118 = (v115 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v115 | 7) != 0x17)
                    v118 = v115 | 7;
                  v119 = v118 + 1;
                  v117 = (void **)operator new(v118 + 1);
                  __dst[2] = (void *)(v119 | 0x8000000000000000);
                  __dst[0] = v117;
                  __dst[1] = v116;
                }
                else
                {
                  HIBYTE(__dst[2]) = v115;
                  v117 = __dst;
                  if (!v115)
                  {
LABEL_201:
                    *((_BYTE *)v116 + (_QWORD)v117) = 0;
                    memset(&buf, 0, sizeof(buf));
                    if (prop::bbtrace::get((char *)__dst, (uint64_t)&buf))
                    {
                      LODWORD(__p) = -1431655766;
                      if (util::convert<int>(&buf, &__p, 0))
                        v120 = (int)__p;
                      else
                        v120 = 0;
                    }
                    else
                    {
                      v120 = 0;
                    }
                    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                    {
                      operator delete(buf.__r_.__value_.__l.__data_);
                      if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                      {
LABEL_208:
                        if (v106 != 4)
                          goto LABEL_319;
LABEL_315:
                        if (v113 == 1)
                        {
                          v164 = *(NSObject **)(v5 + 88);
                          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                            _os_log_impl(&dword_24B855000, v164, OS_LOG_TYPE_DEFAULT, "#N Hard reset detected while Cellular Logging is running. Cellular Logging will be paused.", (uint8_t *)&buf, 2u);
                          }
                          v165 = xpc_null_create();
                          v166 = *MEMORY[0x24BDFC918];
                          v317 = v165;
                          v316 = 0;
                          v315[1] = 0;
                          v315[0] = 0;
                          TraceManager::runOnHelper_sync((_QWORD *)v5, (const char *)0xA, v166, 0x1388u, 1, &v317, &v316, v315);
                          xpc_release(v317);
                          v317 = 0;
LABEL_322:
                          memset(&buf, 170, sizeof(buf));
                          v167 = (const char *)*MEMORY[0x24BE05398];
                          memset(__dst, 0, sizeof(__dst));
                          ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, v167);
                          ctu::cf::map_adapter::getString();
                          MEMORY[0x24BD29478](&__p);
                          if (SHIBYTE(__dst[2]) < 0)
                            operator delete(__dst[0]);
                          memset(__dst, 170, sizeof(__dst));
                          v168 = (const void *)*MEMORY[0x24BE04FF0];
                          v169 = strlen((const char *)*MEMORY[0x24BE04FF0]);
                          if (v169 > 0x7FFFFFFFFFFFFFF7)
                            std::string::__throw_length_error[abi:ne180100]();
                          v170 = v169;
                          if (v169 >= 0x17)
                          {
                            v172 = (v169 & 0xFFFFFFFFFFFFFFF8) + 8;
                            if ((v169 | 7) != 0x17)
                              v172 = v169 | 7;
                            v173 = v172 + 1;
                            p_p = operator new(v172 + 1);
                            v314 = v173 | 0x8000000000000000;
                            __p = p_p;
                            v313 = v170;
                          }
                          else
                          {
                            HIBYTE(v314) = v169;
                            p_p = &__p;
                            if (!v169)
                            {
LABEL_332:
                              v174 = (const char *)*MEMORY[0x24BE05090];
                              *((_BYTE *)&v170->isa + (_QWORD)p_p) = 0;
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v326, v174);
                              ctu::cf::map_adapter::getString();
                              MEMORY[0x24BD29478](&v326);
                              if (SHIBYTE(v314) < 0)
                                operator delete(__p);
                              v175 = xpc_dictionary_create(0, 0, 0);
                              if (v175 || (v175 = xpc_null_create()) != 0)
                              {
                                if (MEMORY[0x24BD2A468](v175) == MEMORY[0x24BDACFA0])
                                {
                                  xpc_retain(v175);
                                  v176 = v175;
                                }
                                else
                                {
                                  v176 = xpc_null_create();
                                }
                              }
                              else
                              {
                                v176 = xpc_null_create();
                                v175 = 0;
                              }
                              xpc_release(v175);
                              if (SHIBYTE(v320[2]) >= 0)
                                v195 = (const char *)v320;
                              else
                                v195 = (const char *)v320[0];
                              v196 = xpc_string_create(v195);
                              if (!v196)
                                v196 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v38, v196);
                              v197 = xpc_null_create();
                              xpc_release(v196);
                              xpc_release(v197);
                              if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                v198 = &buf;
                              else
                                v198 = (std::string *)buf.__r_.__value_.__r.__words[0];
                              v199 = xpc_string_create((const char *)v198);
                              if (!v199)
                                v199 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v167, v199);
                              v200 = xpc_null_create();
                              xpc_release(v199);
                              xpc_release(v200);
                              if ((v319.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                v201 = &v319;
                              else
                                v201 = (std::string *)v319.__r_.__value_.__r.__words[0];
                              v202 = xpc_string_create((const char *)v201);
                              if (!v202)
                                v202 = xpc_null_create();
                              xpc_dictionary_set_value(v176, (const char *)*MEMORY[0x24BE053F0], v202);
                              v203 = xpc_null_create();
                              xpc_release(v202);
                              xpc_release(v203);
                              if (SHIBYTE(__dst[2]) >= 0)
                                v204 = (const char *)__dst;
                              else
                                v204 = (const char *)__dst[0];
                              v205 = xpc_string_create(v204);
                              if (!v205)
                                v205 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v174, v205);
                              v206 = xpc_null_create();
                              xpc_release(v205);
                              xpc_release(v206);
                              v207 = xpc_string_create((const char *)*MEMORY[0x24BE05758]);
                              if (!v207)
                                v207 = xpc_null_create();
                              xpc_dictionary_set_value(v176, (const char *)*MEMORY[0x24BE04F40], v207);
                              v208 = xpc_null_create();
                              xpc_release(v207);
                              xpc_release(v208);
                              v209 = xpc_int64_create(Int);
                              if (!v209)
                                v209 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v65, v209);
                              v210 = xpc_null_create();
                              xpc_release(v209);
                              xpc_release(v210);
                              v211 = (const char *)*MEMORY[0x24BE052E0];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x24BE052E0]);
                              Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v322, (const __CFString *)__p);
                              MEMORY[0x24BD29478](&__p);
                              v213 = xpc_BOOL_create(Bool);
                              if (!v213)
                                v213 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v211, v213);
                              v214 = xpc_null_create();
                              xpc_release(v213);
                              xpc_release(v214);
                              v215 = (const char *)*MEMORY[0x24BE052F8];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x24BE052F8]);
                              v216 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v322, (const __CFString *)__p);
                              MEMORY[0x24BD29478](&__p);
                              v217 = xpc_BOOL_create(v216);
                              if (!v217)
                                v217 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v215, v217);
                              v218 = xpc_null_create();
                              xpc_release(v217);
                              xpc_release(v218);
                              v219 = (const char *)*MEMORY[0x24BE052F0];
                              ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, (const char *)*MEMORY[0x24BE052F0]);
                              v220 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v322, (const __CFString *)__p);
                              MEMORY[0x24BD29478](&__p);
                              v221 = xpc_BOOL_create(v220);
                              if (!v221)
                                v221 = xpc_null_create();
                              xpc_dictionary_set_value(v176, v219, v221);
                              v222 = xpc_null_create();
                              xpc_release(v221);
                              xpc_release(v222);
                              v223 = *(std::__shared_weak_count **)(v5 + 128);
                              if (!v223
                                || (v224 = *(_QWORD *)(v5 + 120), (v225 = std::__shared_weak_count::lock(v223)) == 0))
                              {
                                std::__throw_bad_weak_ptr[abi:ne180100]();
                              }
                              v226 = v225;
                              p_shared_weak_owners = (unint64_t *)&v225->__shared_weak_owners_;
                              do
                                v228 = __ldxr(p_shared_weak_owners);
                              while (__stxr(v228 + 1, p_shared_weak_owners));
                              v229 = (unint64_t *)&v225->__shared_owners_;
                              do
                                v230 = __ldaxr(v229);
                              while (__stlxr(v230 - 1, v229));
                              if (!v230)
                              {
                                ((void (*)(std::__shared_weak_count *))v225->__on_zero_shared)(v225);
                                std::__shared_weak_count::__release_weak(v226);
                              }
                              v231 = (const void *)*MEMORY[0x24BE05200];
                              v232 = strlen((const char *)*MEMORY[0x24BE05200]);
                              if (v232 > 0x7FFFFFFFFFFFFFF7)
                                std::string::__throw_length_error[abi:ne180100]();
                              v233 = v232;
                              if (v232 >= 0x17)
                              {
                                v235 = (v232 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v232 | 7) != 0x17)
                                  v235 = v232 | 7;
                                v236 = v235 + 1;
                                v234 = operator new(v235 + 1);
                                v314 = v236 | 0x8000000000000000;
                                __p = v234;
                                v313 = v233;
                              }
                              else
                              {
                                HIBYTE(v314) = v232;
                                v234 = &__p;
                                if (!v232)
                                {
LABEL_428:
                                  *((_BYTE *)&v233->isa + (_QWORD)v234) = 0;
                                  v311 = v176;
                                  if (v176)
                                    xpc_retain(v176);
                                  else
                                    v311 = xpc_null_create();
                                  v306[0] = MEMORY[0x24BDAC760];
                                  v306[1] = 1174405120;
                                  v306[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_42;
                                  v306[3] = &__block_descriptor_tmp_44_1;
                                  v238 = *(abm::client::Event **)a2;
                                  v237 = *(std::__shared_weak_count **)(a2 + 8);
                                  v306[4] = v5;
                                  v306[5] = v238;
                                  v307 = v237;
                                  if (v237)
                                  {
                                    v239 = (unint64_t *)&v237->__shared_owners_;
                                    do
                                      v240 = __ldxr(v239);
                                    while (__stxr(v240 + 1, v239));
                                  }
                                  v308 = v224;
                                  v309 = v226;
                                  do
                                    v241 = __ldxr(p_shared_weak_owners);
                                  while (__stxr(v241 + 1, p_shared_weak_owners));
                                  v242 = _Block_copy(v306);
                                  v310 = v242;
                                  Service::runCommand(v5, (uint64_t)&__p, &v311, &v310);
                                  if (v242)
                                    _Block_release(v242);
                                  xpc_release(v311);
                                  v311 = 0;
                                  if (SHIBYTE(v314) < 0)
                                    operator delete(__p);
                                  v243 = strlen(__s);
                                  if (v243 > 0x7FFFFFFFFFFFFFF7)
                                    std::string::__throw_length_error[abi:ne180100]();
                                  v244 = (void *)v243;
                                  if (v243 >= 0x17)
                                  {
                                    v247 = (v243 & 0xFFFFFFFFFFFFFFF8) + 8;
                                    if ((v243 | 7) != 0x17)
                                      v247 = v243 | 7;
                                    v248 = v247 + 1;
                                    v249 = (void **)operator new(v247 + 1);
                                    v246 = __s;
                                    v245 = v249;
                                    v305 = v248 | 0x8000000000000000;
                                    v304[0] = v249;
                                    v304[1] = v244;
                                  }
                                  else
                                  {
                                    HIBYTE(v305) = v243;
                                    v245 = v304;
                                    v246 = __s;
                                    if (!v243)
                                    {
LABEL_448:
                                      *((_BYTE *)v244 + (_QWORD)v245) = 0;
                                      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0)
                                        std::string::__init_copy_ctor_external(&v303, v319.__r_.__value_.__l.__data_, v319.__r_.__value_.__l.__size_);
                                      else
                                        v303 = v319;
                                      TraceManager::submitTraceMetric_sync(v5, (const char *)v304, (const char *)&v303);
                                      if (SHIBYTE(v303.__r_.__value_.__r.__words[2]) < 0)
                                      {
                                        operator delete(v303.__r_.__value_.__l.__data_);
                                        if ((SHIBYTE(v305) & 0x80000000) == 0)
                                        {
LABEL_453:
                                          v250 = v309;
                                          if (!v309)
                                            goto LABEL_455;
                                          goto LABEL_454;
                                        }
                                      }
                                      else if ((SHIBYTE(v305) & 0x80000000) == 0)
                                      {
                                        goto LABEL_453;
                                      }
                                      operator delete(v304[0]);
                                      v250 = v309;
                                      if (!v309)
                                      {
LABEL_455:
                                        v251 = v307;
                                        if (v307)
                                        {
                                          v252 = (unint64_t *)&v307->__shared_owners_;
                                          do
                                            v253 = __ldaxr(v252);
                                          while (__stlxr(v253 - 1, v252));
                                          if (!v253)
                                          {
                                            ((void (*)(std::__shared_weak_count *))v251->__on_zero_shared)(v251);
                                            std::__shared_weak_count::__release_weak(v251);
                                          }
                                        }
                                        std::__shared_weak_count::__release_weak(v226);
                                        xpc_release(v176);
                                        if (SHIBYTE(__dst[2]) < 0)
                                          operator delete(__dst[0]);
                                        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                                          operator delete(buf.__r_.__value_.__l.__data_);
                                        goto LABEL_464;
                                      }
LABEL_454:
                                      std::__shared_weak_count::__release_weak(v250);
                                      goto LABEL_455;
                                    }
                                  }
                                  memmove(v245, v246, (size_t)v244);
                                  goto LABEL_448;
                                }
                              }
                              memmove(v234, v231, (size_t)v233);
                              goto LABEL_428;
                            }
                          }
                          memmove(p_p, v168, (size_t)v170);
                          goto LABEL_332;
                        }
LABEL_319:
                        if (!(v113 | v106) && v120 == 3)
                          notify_post("com.apple.cellularlogging.bbreset");
                        goto LABEL_322;
                      }
                    }
                    else if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                    {
                      goto LABEL_208;
                    }
                    operator delete(__dst[0]);
                    if (v106 != 4)
                      goto LABEL_319;
                    goto LABEL_315;
                  }
                }
                memmove(v117, v114, (size_t)v116);
                goto LABEL_201;
              }
            }
            memmove(v110, v107, (size_t)v109);
            goto LABEL_185;
          }
        }
        memmove(v80, v77, (size_t)v79);
        goto LABEL_169;
      }
    }
    memmove(p_buf, v39, v41);
    goto LABEL_94;
  }
LABEL_471:
  if (v9)
    CFRelease(v9);
  v7 = v325;
  if (v325)
    goto LABEL_474;
}

void sub_24B93D894(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_24B93DF34()
{
  JUMPOUT(0x24B93DF1CLL);
}

void sub_24B93DF3C()
{
  JUMPOUT(0x24B93DF24);
}

void prop::bbtrace::get<diag::config::Mode>(char *a1, int *a2)
{
  std::string __p;
  int v4;

  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get(a1, (uint64_t)&__p))
  {
    v4 = -1431655766;
    if (util::convert<int>(&__p, &v4, 0))
      *a2 = v4;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B93DFC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void prop::bbtrace::get<abm::traceOwnership>(char *a1, int *a2)
{
  std::string __p;
  int v4;

  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get(a1, (uint64_t)&__p))
  {
    v4 = -1431655766;
    if (util::convert<int>(&__p, &v4, 0))
      *a2 = v4;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B93E058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL TraceManager::isCellullarLoggingStreamingMode(uint64_t a1, int a2, int a3, int a4)
{
  return !(a3 | a2) && a4 == 3;
}

uint64_t TraceManager::postBBResetNotification(TraceManager *this)
{
  return notify_post("com.apple.cellularlogging.bbreset");
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_42(_QWORD *a1, int a2, xpc_object_t *a3)
{
  std::__shared_weak_count *v4;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  xpc_object_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  xpc_object_t v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *p_shared_owners;
  unint64_t v34;

  v4 = (std::__shared_weak_count *)a1[8];
  if (v4)
  {
    v7 = (_QWORD *)a1[4];
    v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      v9 = v8;
      v10 = a1[7];
      if (!v10)
      {
LABEL_29:
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v34 = __ldaxr(p_shared_owners);
        while (__stlxr(v34 - 1, p_shared_owners));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
        return;
      }
      v11 = (unint64_t *)&v8->__shared_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      v13 = *a3;
      if (*a3)
      {
        xpc_retain(*a3);
        v15 = a1[5];
        v14 = (std::__shared_weak_count *)a1[6];
        if (!v14)
        {
LABEL_12:
          v18 = (std::__shared_weak_count *)v7[16];
          if (!v18 || (v19 = v7[15], (v20 = std::__shared_weak_count::lock(v18)) == 0))
            std::__throw_bad_weak_ptr[abi:ne180100]();
          v21 = v20;
          v22 = operator new(0x38uLL);
          *v22 = v7;
          v22[1] = v10;
          v22[2] = v9;
          *((_DWORD *)v22 + 6) = a2;
          v22[4] = v13;
          v23 = xpc_null_create();
          v22[5] = v15;
          v22[6] = v14;
          if (v14)
          {
            v24 = (unint64_t *)&v14->__shared_owners_;
            do
              v25 = __ldxr(v24);
            while (__stxr(v25 + 1, v24));
          }
          v26 = v7[17];
          v27 = (unint64_t *)&v21->__shared_owners_;
          do
            v28 = __ldxr(v27);
          while (__stxr(v28 + 1, v27));
          v29 = operator new(0x18uLL);
          *v29 = v22;
          v29[1] = v19;
          v29[2] = v21;
          dispatch_async_f(v26, v29, (dispatch_function_t)_ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZZNS3_25finishInitialization_syncEvEUb2_EUb3_E3__4EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrIS7_NSC_14default_deleteIS7_EEEEENUlPvE_8__invokeESH_);
          do
            v30 = __ldaxr(v27);
          while (__stlxr(v30 - 1, v27));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
          if (v14)
          {
            v31 = (unint64_t *)&v14->__shared_owners_;
            do
              v32 = __ldaxr(v31);
            while (__stlxr(v32 - 1, v31));
            if (!v32)
            {
              ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
              std::__shared_weak_count::__release_weak(v14);
            }
          }
          xpc_release(v23);
          goto LABEL_29;
        }
      }
      else
      {
        v13 = xpc_null_create();
        v15 = a1[5];
        v14 = (std::__shared_weak_count *)a1[6];
        if (!v14)
          goto LABEL_12;
      }
      v16 = (unint64_t *)&v14->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
      goto LABEL_12;
    }
  }
}

_QWORD *__copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c37_ZTSNSt3__18weak_ptrI12TraceManagerEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_45(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Abort complete", v2, 2u);
  }
}

_QWORD *__copy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c40_ZTSNSt3__110shared_ptrI12TraceManagerEE56c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5)
      return;
  }
  else
  {
LABEL_5:
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5)
      return;
  }
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_47(_QWORD *a1)
{
  _QWORD *v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  xpc_object_t object;

  v2 = (_QWORD *)a1[4];
  v9 = 0;
  object = xpc_null_create();
  v3 = (const void *)a1[5];
  if (v3)
  {
    v4 = _Block_copy(v3);
    v5 = *MEMORY[0x24BDFC818];
    v6 = a1[6];
    v7 = v4;
    v8 = v6;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  v5 = *MEMORY[0x24BDFC818];
  v6 = a1[6];
  v7 = 0;
  v8 = v6;
  if (v6)
LABEL_3:
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)9, v5, 0x1388u, 0, &object, &v9, &v7);
  if (v6)
    dispatch_release(v6);
  if (v4)
    _Block_release(v4);
  xpc_release(object);
}

void sub_24B93E570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c79_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;

  v4 = *(void **)(a2 + 40);
  if (v4)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  if (v5)
    dispatch_retain(v5);
}

void __destroy_helper_block_e8_40c79_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    _Block_release(v3);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_49(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Prepare complete", v2, 2u);
  }
}

void TraceManager::updateBasebandFWInfo(TraceManager *this)
{
  xpc_object_t v2;
  xpc_object_t v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  const void *v12;
  size_t v13;
  void *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;
  const void *v22;
  xpc_object_t object;
  void *__dst[2];
  unint64_t v25;

  v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v2) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v2);
      v3 = v2;
    }
    else
    {
      v3 = xpc_null_create();
    }
  }
  else
  {
    v3 = xpc_null_create();
    v2 = 0;
  }
  xpc_release(v2);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 16);
  if (!v4 || (v5 = *((_QWORD *)this + 15), (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = (const void *)*MEMORY[0x24BE05688];
  v13 = strlen((const char *)*MEMORY[0x24BE05688]);
  if (v13 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v14 = (void *)v13;
  if (v13 >= 0x17)
  {
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    v25 = v17 | 0x8000000000000000;
    __dst[0] = v15;
LABEL_23:
    memmove(v15, v12, (size_t)v14);
    *((_BYTE *)v14 + (_QWORD)v15) = 0;
    object = v3;
    if (v3)
      goto LABEL_19;
LABEL_24:
    object = xpc_null_create();
    goto LABEL_25;
  }
  HIBYTE(v25) = v13;
  v15 = __dst;
  if (v13)
    goto LABEL_23;
  LOBYTE(__dst[0]) = 0;
  object = v3;
  if (!v3)
    goto LABEL_24;
LABEL_19:
  xpc_retain(v3);
LABEL_25:
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 1174405120;
  v20[2] = ___ZN12TraceManager20updateBasebandFWInfoEv_block_invoke;
  v20[3] = &__block_descriptor_tmp_68_1;
  v20[4] = this;
  v20[5] = v5;
  v21 = v7;
  do
    v18 = __ldxr(p_shared_weak_owners);
  while (__stxr(v18 + 1, p_shared_weak_owners));
  v19 = _Block_copy(v20);
  v22 = v19;
  Service::runCommand((uint64_t)this, (uint64_t)__dst, &object, &v22);
  if (v19)
    _Block_release(v19);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v25) < 0)
    operator delete(__dst[0]);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
  std::__shared_weak_count::__release_weak(v7);
  xpc_release(v3);
}

void sub_24B93E8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, xpc_object_t object, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;
  std::__shared_weak_count *v24;
  const void *v25;

  if (v25)
    _Block_release(v25);
  if (a15)
    std::__shared_weak_count::__release_weak(a15);
  xpc_release(object);
  if (a23 < 0)
    operator delete(__p);
  std::__shared_weak_count::__release_weak(v24);
  xpc_release(v23);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_51(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Start complete", v2, 2u);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_53(_QWORD *a1)
{
  _QWORD *v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  xpc_object_t object;

  v2 = (_QWORD *)a1[4];
  v9 = 0;
  object = xpc_null_create();
  v3 = (const void *)a1[5];
  if (v3)
  {
    v4 = _Block_copy(v3);
    v5 = *MEMORY[0x24BDFC928];
    v6 = a1[6];
    v7 = v4;
    v8 = v6;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  v5 = *MEMORY[0x24BDFC928];
  v6 = a1[6];
  v7 = 0;
  v8 = v6;
  if (v6)
LABEL_3:
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)0xA, v5, 0x1388u, 1, &object, &v9, &v7);
  if (v6)
    dispatch_release(v6);
  if (v4)
    _Block_release(v4);
  xpc_release(object);
}

void sub_24B93EAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_55(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Abort complete", v2, 2u);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_57(_QWORD *a1)
{
  _QWORD *v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  xpc_object_t object;

  v2 = (_QWORD *)a1[4];
  v9 = 0;
  object = xpc_null_create();
  v3 = (const void *)a1[5];
  if (v3)
  {
    v4 = _Block_copy(v3);
    v5 = *MEMORY[0x24BDFC818];
    v6 = a1[6];
    v7 = v4;
    v8 = v6;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  v5 = *MEMORY[0x24BDFC818];
  v6 = a1[6];
  v7 = 0;
  v8 = v6;
  if (v6)
LABEL_3:
    dispatch_retain(v6);
LABEL_4:
  TraceManager::runOnHelper_sync(v2, (const char *)9, v5, 0x7D0u, 0, &object, &v9, &v7);
  if (v6)
    dispatch_release(v6);
  if (v4)
    _Block_release(v4);
  xpc_release(object);
}

void sub_24B93EC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_61(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  char *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  NSObject *v9;
  ctu *v10;
  NSObject *v11;
  uint64_t v12;
  ctu *v13;
  uint64_t (*v14)(uint64_t);
  std::__shared_weak_count *v15;
  abm::client::Event *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  const void *v21;
  void *v22;
  NSObject *v23;
  xpc_object_t v24;
  const char *v25;
  xpc_object_t v26;
  xpc_object_t v27;
  void *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  xpc_object_t v41;
  xpc_object_t object;
  _QWORD aBlock[6];
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  __int128 __p;
  char v50;
  ctu *buf[4];

  buf[3] = *(ctu **)MEMORY[0x24BDAC8D0];
  v3 = (std::__shared_weak_count *)a1[6];
  if (!v3)
    return;
  v5 = (char *)a1[4];
  v6 = std::__shared_weak_count::lock(v3);
  v48 = v6;
  if (!v6)
    return;
  v7 = v6;
  v8 = a1[5];
  v47 = v8;
  if (!v8)
  {
LABEL_57:
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  v9 = *((_QWORD *)v5 + 11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    abm::client::Event::name(*(abm::client::Event **)a2);
    v10 = v50 >= 0 ? (ctu *)&__p : (ctu *)__p;
    LODWORD(buf[0]) = 136315138;
    *(ctu **)((char *)buf + 4) = v10;
    _os_log_impl(&dword_24B855000, v9, OS_LOG_TYPE_DEFAULT, "#I Received event %s", (uint8_t *)buf, 0xCu);
    if (v50 < 0)
      operator delete((void *)__p);
  }
  if ((*(unsigned int (**)(char *))(*(_QWORD *)v5 + 88))(v5))
  {
    v11 = *((_QWORD *)v5 + 11);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *MEMORY[0x24BE05420];
      LODWORD(__p) = 136315138;
      *(_QWORD *)((char *)&__p + 4) = v12;
      _os_log_impl(&dword_24B855000, v11, OS_LOG_TYPE_DEFAULT, "#I Server going down. Skipping event %s", (uint8_t *)&__p, 0xCu);
    }
    goto LABEL_57;
  }
  buf[0] = (ctu *)0xAAAAAAAAAAAAAAAALL;
  abm::client::Event::getData(*(abm::client::Event **)a2);
  v13 = buf[0];
  v14 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!buf[0])
    v14 = 0;
  if (v14)
  {
    *(_QWORD *)&__p = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&__p + 1) = 0xAAAAAAAAAAAAAAAALL;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_62;
    aBlock[3] = &__block_descriptor_tmp_63_1;
    v16 = *(abm::client::Event **)a2;
    v15 = *(std::__shared_weak_count **)(a2 + 8);
    aBlock[4] = v5;
    aBlock[5] = v16;
    v44 = v15;
    if (v15)
    {
      v17 = (unint64_t *)&v15->__shared_owners_;
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v45 = v8;
    v46 = v7;
    v19 = (unint64_t *)&v7->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    v22 = _Block_copy(aBlock);
    v23 = *((_QWORD *)v5 + 17);
    if (v23)
      dispatch_retain(*((dispatch_object_t *)v5 + 17));
    *(_QWORD *)&__p = v22;
    *((_QWORD *)&__p + 1) = v23;
    ctu::cf_to_xpc(buf[0], v21);
    v24 = object;
    if (object && MEMORY[0x24BD2A468](object) == MEMORY[0x24BDACFA0])
      xpc_retain(object);
    else
      v24 = xpc_null_create();
    xpc_release(object);
    v25 = v5 + 168;
    if (v5[191] < 0)
      v25 = *(const char **)v25;
    v26 = xpc_string_create(v25);
    if (!v26)
      v26 = xpc_null_create();
    xpc_dictionary_set_value(v24, (const char *)*MEMORY[0x24BE05060], v26);
    v27 = xpc_null_create();
    xpc_release(v26);
    xpc_release(v27);
    v41 = v24;
    if (v24)
    {
      xpc_retain(v24);
      v40 = 0;
      if (v22)
        goto LABEL_33;
    }
    else
    {
      v40 = 0;
      v41 = xpc_null_create();
      if (v22)
      {
LABEL_33:
        v28 = _Block_copy(v22);
        v29 = *MEMORY[0x24BDFC830];
        v38 = v28;
        v39 = v23;
        if (!v23)
        {
LABEL_35:
          TraceManager::runOnHelper_sync(v5, (const char *)9, v29, 0x1388u, 1, &v41, &v40, &v38);
          if (v23)
            dispatch_release(v23);
          if (v28)
            _Block_release(v28);
          xpc_release(v41);
          v41 = 0;
          xpc_release(v24);
          if (v23)
            dispatch_release(v23);
          if (v22)
            _Block_release(v22);
          v30 = v46;
          if (v46)
          {
            v31 = (unint64_t *)&v46->__shared_owners_;
            do
              v32 = __ldaxr(v31);
            while (__stlxr(v32 - 1, v31));
            if (!v32)
            {
              ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
              std::__shared_weak_count::__release_weak(v30);
            }
          }
          v33 = v44;
          if (v44)
          {
            v34 = (unint64_t *)&v44->__shared_owners_;
            do
              v35 = __ldaxr(v34);
            while (__stlxr(v35 - 1, v34));
            if (!v35)
            {
              ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
              std::__shared_weak_count::__release_weak(v33);
            }
          }
          v13 = buf[0];
          goto LABEL_54;
        }
LABEL_34:
        dispatch_retain(v23);
        goto LABEL_35;
      }
    }
    v28 = 0;
    v29 = *MEMORY[0x24BDFC830];
    v38 = 0;
    v39 = v23;
    if (!v23)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_54:
  if (v13)
    CFRelease(v13);
  v7 = v48;
  if (v48)
    goto LABEL_57;
}

void sub_24B93F09C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_62(uint64_t a1, _DWORD *a2)
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *a2 == 0;
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_24B855000, v3, OS_LOG_TYPE_DEFAULT, "#I Snapshot : Snapshot complete. Success = %d", (uint8_t *)v5, 8u);
  }
}

_QWORD *__copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE56c40_ZTSNSt3__110shared_ptrI12TraceManagerEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5)
      return;
  }
  else
  {
LABEL_5:
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5)
      return;
  }
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ___ZN12TraceManager25finishInitialization_syncEv_block_invoke_65(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t v13;
  void *v14[2];
  NSObject *v15;
  xpc_object_t object;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = (_QWORD *)a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      v6 = a1[5];
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (v8)
      {
        if (!v6)
          return;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6)
          return;
      }
      v9 = xpc_dictionary_create(0, 0, 0);
      if (v9 || (v9 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2A468](v9) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(v9);
          v10 = v9;
        }
        else
        {
          v10 = xpc_null_create();
        }
      }
      else
      {
        v10 = xpc_null_create();
        v9 = 0;
      }
      xpc_release(v9);
      v11 = xpc_string_create("Trace state for sysdiagnose");
      if (!v11)
        v11 = xpc_null_create();
      xpc_dictionary_set_value(v10, (const char *)*MEMORY[0x24BDFC850], v11);
      v12 = xpc_null_create();
      xpc_release(v11);
      xpc_release(v12);
      object = v10;
      if (v10)
        xpc_retain(v10);
      else
        object = xpc_null_create();
      v13 = *MEMORY[0x24BDFC800];
      v14[1] = 0;
      v15 = 0;
      v14[0] = 0;
      TraceManager::runOnHelper_sync(v3, (const char *)9, v13, 0x1388u, 1, &object, &v15, v14);
      xpc_release(object);
      object = 0;
      xpc_release(v10);
    }
  }
}

void sub_24B93F490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  void *v12;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void TraceManager::sleep(_QWORD *a1, dispatch_object_t *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[17];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::sleep(dispatch::group_session)::$_0>(TraceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void TraceManager::wake(_QWORD *a1, dispatch_object_t *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)a1[16];
  if (!v4 || (v5 = a1[15], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[17];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::wake(dispatch::group_session)::$_0>(TraceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ___ZN12TraceManager20updateBasebandFWInfoEv_block_invoke(_QWORD *a1, int a2, xpc_object_t *a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  xpc_object_t value;
  const char *v14;
  void **v15;
  xpc_object_t object;
  __int128 v17;
  uint64_t v18;

  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v7 = a1[4];
    v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      v9 = v8;
      v10 = a1[5];
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (v12)
      {
        if (a2)
          return;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
        if (a2)
          return;
      }
      if (v10)
      {
        value = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x24BE05060]);
        object = value;
        if (value)
          xpc_retain(value);
        else
          object = xpc_null_create();
        xpc::dyn_cast_or_default((xpc *)&object, (const object *)"", v14);
        v15 = (void **)(v7 + 168);
        if (*(char *)(v7 + 191) < 0)
          operator delete(*v15);
        *(_OWORD *)v15 = v17;
        *(_QWORD *)(v7 + 184) = v18;
        HIBYTE(v18) = 0;
        LOBYTE(v17) = 0;
        xpc_release(object);
      }
    }
  }
}

void sub_24B93F7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager20initTraceHelper_syncEv_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  size_t v12;
  const void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  void *v23[2];
  NSObject *v24;
  xpc_object_t object;
  uint8_t buf[16];

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      v6 = a1[5];
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (v8)
      {
        if (!v6)
          return;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6)
          return;
      }
      v9 = *(NSObject **)(v3 + 88);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B855000, v9, OS_LOG_TYPE_DEFAULT, "#I Wireless helper server has started", buf, 2u);
      }
      v10 = (const char *)*MEMORY[0x24BE05418];
      v11 = *(char *)(v3 + 215);
      if (v11 >= 0)
        v12 = *(unsigned __int8 *)(v3 + 215);
      else
        v12 = *(_QWORD *)(v3 + 200);
      if (v12 == strlen((const char *)*MEMORY[0x24BE05418])
        && (v11 >= 0 ? (v13 = (const void *)(v3 + 192)) : (v13 = *(const void **)(v3 + 192)),
            !memcmp(v13, v10, v12)
         && (prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04EE8], v14)
          || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE05920], v16)
          || prop::tracesettings::enabled((prop::tracesettings *)*MEMORY[0x24BE04F58], v17))))
      {
        v18 = xpc_dictionary_create(0, 0, 0);
        if (v18 || (v18 = xpc_null_create()) != 0)
        {
          if (MEMORY[0x24BD2A468](v18) == MEMORY[0x24BDACFA0])
          {
            xpc_retain(v18);
            v19 = v18;
          }
          else
          {
            v19 = xpc_null_create();
          }
        }
        else
        {
          v19 = xpc_null_create();
          v18 = 0;
        }
        xpc_release(v18);
        v20 = xpc_string_create(v10);
        if (!v20)
          v20 = xpc_null_create();
        xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BE05198], v20);
        v21 = xpc_null_create();
        xpc_release(v20);
        xpc_release(v21);
        object = v19;
        if (v19)
          xpc_retain(v19);
        else
          object = xpc_null_create();
        v22 = *MEMORY[0x24BDFC828];
        v23[1] = 0;
        v24 = 0;
        v23[0] = 0;
        TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)9, v22, 0x1388u, 0, &object, &v24, v23);
        xpc_release(object);
        object = 0;
        xpc_release(v19);
      }
      else
      {
        v15 = *(NSObject **)(v3 + 88);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24B855000, v15, OS_LOG_TYPE_DEFAULT, "#I Skipping trace start", buf, 2u);
        }
      }
    }
  }
}

void sub_24B93FABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  void *v12;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  object = 0;
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN12TraceManager16runOnHelper_syncEN3abm6helper6TaskIDEPKcjbN3xpc4dictEN8dispatch13group_sessionENS7_8callbackIU13block_pointerFvN12TelephonyXPC6ResultES6_EEE_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      v6 = a1[5];
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v5);
      }
      if (v6)
      {
        v9 = *(NSObject **)(v3 + 88);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = abm::helper::asString();
          v11 = a1[10];
          v12 = 136315394;
          v13 = v10;
          v14 = 2080;
          v15 = v11;
          _os_log_impl(&dword_24B855000, v9, OS_LOG_TYPE_DEFAULT, "#I %s:%s: complete", (uint8_t *)&v12, 0x16u);
        }
      }
    }
  }
}

void __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c30_ZTSN8dispatch13group_sessionE64c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a2[7];
  a1[7] = v7;
  if (v7)
  {
    dispatch_retain(v7);
    v8 = a1[7];
    if (v8)
      dispatch_group_enter(v8);
  }
  v9 = a2[9];
  a1[8] = a2[8];
  a1[9] = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c30_ZTSN8dispatch13group_sessionE64c46_ZTSNSt3__110shared_ptrIN3abm12HelperClientEEE(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;

  v2 = (std::__shared_weak_count *)a1[9];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = a1[7];
    if (!v5)
      goto LABEL_9;
  }
  else
  {
LABEL_5:
    v5 = a1[7];
    if (!v5)
      goto LABEL_9;
  }
  dispatch_group_leave(v5);
  v6 = a1[7];
  if (v6)
    dispatch_release(v6);
LABEL_9:
  v7 = (std::__shared_weak_count *)a1[6];
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
}

uint64_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 - 48) + 16))(a1 - 48);
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::Loggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = a1 + 56;
  if (*(_QWORD *)(a1 + 56))
  {
    if (!*(_QWORD *)(a1 + 80) || (v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0)
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_24B93FF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_24B93FF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<TraceManager>::shared_ptr[abi:ne180100]<TraceManager,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1},void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v6;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t v14;

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_251CC0810;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2)
    return a1;
  v6 = *(std::__shared_weak_count **)(a2 + 128);
  if (v6)
  {
    if (v6->__shared_owners_ != -1)
      return a1;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    *(_QWORD *)(a2 + 120) = a2;
    *(_QWORD *)(a2 + 128) = v4;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    *(_QWORD *)(a2 + 120) = a2;
    *(_QWORD *)(a2 + 128) = v4;
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (v14)
    return a1;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_24B94008C(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[17], v1, (dispatch_function_t)std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1}::operator() const(TraceManager*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_24B9400AC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 136), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1}::operator() const(TraceManager*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<TraceManager *,std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager *)#1},std::allocator<TraceManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT"
                                "_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI12TraceManagerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<TraceManager> ctu::SharedSynchronizable<TraceManager>::make_shared_ptr<TraceManager>(TraceManager*)::{lambda(TraceManager*)#1}::operator() const(TraceManager*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void ctu::SharedLoggable<TraceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC07D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::__on_zero_shared(uint64_t a1)
{
  uint64_t *v1;

  v1 = *(uint64_t **)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<support::misc::Watchdog>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<BBLogTracker *,std::shared_ptr<BBLogTracker>::__shared_ptr_default_delete<BBLogTracker,BBLogTracker>,std::allocator<BBLogTracker>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B955CE2)
    return a1 + 24;
  if (((v3 & 0x800000024B955CE2 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B955CE2))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B955CE2 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void ___ZN3ctu20SharedSynchronizableI12TraceManagerE13connect_eventIN5boost8signals26signalIFvNS_2cf11CFSharedRefIK14__CFDictionaryEEENS5_19optional_last_valueIvEEiNSt3__14lessIiEENS4_8functionISC_EENSI_IFvRKNS5_10connectionESB_EEENS5_5mutexEEES1_vJSB_EEEDTcl7connectfp_cvNSF_10shared_ptrIS1_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSV_SX_E_block_invoke(_QWORD *a1, const void **a2)
{
  uint64_t v2;
  void (*v3)(_QWORD *, CFTypeRef *);
  _QWORD *v4;
  const void *v5;
  CFTypeRef cf;

  v3 = (void (*)(_QWORD *, CFTypeRef *))a1[5];
  v2 = a1[6];
  v4 = (_QWORD *)(a1[4] + (v2 >> 1) - 120);
  if ((v2 & 1) != 0)
    v3 = *(void (**)(_QWORD *, CFTypeRef *))(*v4 + v3);
  v5 = *a2;
  cf = v5;
  if (v5)
    CFRetain(v5);
  v3(v4, &cf);
  if (cf)
    CFRelease(cf);
}

void sub_24B940354(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~slot(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 32, a1 + 32, 2);
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
  if (*(_QWORD *)a1)
  {
    std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)a1, *(_QWORD *)a1);
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::~DispatchSlot(uint64_t a1)
{
  const void *v2;

  dispatch_release(*(dispatch_object_t *)a1);
  v2 = *(const void **)(a1 + 8);
  if (v2)
    _Block_release(v2);
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

uint64_t *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(_QWORD *a1)
{
  _QWORD *v1;

  v1 = boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(a1);
  operator delete(v1);
}

BOOL boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::connected(uint64_t a1)
{
  __int128 v2;
  pthread_mutex_t *v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int i;
  unsigned int v10;
  uint64_t v11;
  char v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  char *v22;
  char *v23;
  unsigned int *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v32;
  _OWORD v33[10];
  unint64_t v34;
  void *__p;
  uint64_t v36;
  pthread_mutex_t *v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[8] = v2;
  v33[9] = v2;
  v33[6] = v2;
  v33[7] = v2;
  v33[4] = v2;
  v33[5] = v2;
  v33[2] = v2;
  v33[3] = v2;
  v33[0] = v2;
  v33[1] = v2;
  v3 = *(pthread_mutex_t **)(a1 + 48);
  v34 = 10;
  __p = v33;
  v36 = 0;
  v37 = v3;
  pthread_mutex_lock(v3);
  v4 = *(uint64_t **)(a1 + 32);
  if (!v4)
    goto LABEL_40;
  v5 = *v4;
  if (*v4 == v4[1])
    goto LABEL_40;
  do
  {
    memset(v38, 170, 24);
    v6 = *(_DWORD *)v5 ^ (*(int *)v5 >> 31);
    if (v6 == 2)
    {
      (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(v5 + 8) + 16))(&v32);
      v38[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      LODWORD(v38[0]) = 1;
      if (v32)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
        if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
          goto LABEL_26;
LABEL_19:
        v11 = *(_QWORD *)(v5 + 16);
        if (!v11)
          goto LABEL_27;
        if (!atomic_load((unsigned int *)(v11 + 8)))
          goto LABEL_27;
LABEL_21:
        v13 = 0;
        if (LODWORD(v38[0]) == SLODWORD(v38[0]) >> 31)
          goto LABEL_30;
        goto LABEL_22;
      }
LABEL_18:
      if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v6 != 1)
    {
      LODWORD(v38[0]) = 0;
      v38[1] = 0;
      v38[2] = 0;
      goto LABEL_18;
    }
    v7 = *(_QWORD *)(v5 + 16);
    if (!v7)
    {
LABEL_25:
      v38[1] = 0;
      v38[2] = v7;
      LODWORD(v38[0]) = 0;
      if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        goto LABEL_26;
      goto LABEL_19;
    }
    v8 = (unsigned int *)(v7 + 8);
    for (i = *(_DWORD *)(v7 + 8); ; i = v10)
    {
      if (!i)
      {
        v7 = 0;
        goto LABEL_25;
      }
      v10 = __ldxr(v8);
      if (v10 != i)
      {
        __clrex();
        continue;
      }
      if (!__stxr(i + 1, v8))
        break;
    }
    v38[1] = *(_QWORD *)(v5 + 8);
    v38[2] = v7;
    LODWORD(v38[0]) = 0;
    if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) != 2)
      goto LABEL_19;
LABEL_26:
    if (!(*(unsigned int (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 24))(*(_QWORD *)(v5 + 8)))
      goto LABEL_21;
LABEL_27:
    if (*(_BYTE *)(a1 + 24))
    {
      *(_BYTE *)(a1 + 24) = 0;
      boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)a1, v33);
    }
    v13 = 1;
    if (LODWORD(v38[0]) == SLODWORD(v38[0]) >> 31)
    {
LABEL_30:
      v14 = (unsigned int *)v38[2];
      if (v38[2])
      {
        v15 = (unsigned int *)(v38[2] + 8);
        do
        {
          v16 = __ldaxr(v15);
          v17 = v16 - 1;
        }
        while (__stlxr(v17, v15));
        if (!v17)
        {
          (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 16))(v14);
          v18 = v14 + 3;
          do
          {
            v19 = __ldaxr(v18);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v18));
          if (!v20)
            (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 24))(v14);
        }
      }
      goto LABEL_38;
    }
LABEL_22:
    if (v38[1])
      (*(void (**)(_QWORD))(*(_QWORD *)v38[1] + 8))(v38[1]);
LABEL_38:
    if ((v13 & 1) != 0)
      break;
    v5 += 24;
  }
  while (v5 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
LABEL_40:
  v21 = *(unsigned __int8 *)(a1 + 24);
  pthread_mutex_unlock(v37);
  v22 = (char *)__p;
  if (__p)
  {
    if (v36 - 1 >= 0)
    {
      v23 = (char *)__p + 16 * v36;
      do
      {
        v24 = (unsigned int *)*((_QWORD *)v23 - 1);
        if (v24)
        {
          v25 = v24 + 2;
          do
          {
            v26 = __ldaxr(v25);
            v27 = v26 - 1;
          }
          while (__stlxr(v27, v25));
          if (!v27)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 16))(v24);
            v28 = v24 + 3;
            do
            {
              v29 = __ldaxr(v28);
              v30 = v29 - 1;
            }
            while (__stlxr(v30, v28));
            if (!v30)
              (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 24))(v24);
          }
        }
        v23 -= 16;
      }
      while (v23 > v22);
    }
    if (v34 >= 0xB)
      operator delete(__p);
  }
  return v21 != 0;
}

void sub_24B940AE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::lock(uint64_t a1)
{
  return pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::unlock(uint64_t a1)
{
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::release_slot@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v3 = *(_QWORD *)(result + 40);
  v2 = (_QWORD *)(result + 32);
  *a2 = *(_QWORD *)(result + 32);
  a2[1] = v3;
  if (v3)
  {
    v4 = (unsigned int *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    v6 = *(unsigned int **)(result + 40);
    *v2 = 0;
    *(_QWORD *)(result + 40) = 0;
    if (v6)
    {
      v7 = v6 + 2;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
      {
        result = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
        v10 = v6 + 3;
        do
        {
          v11 = __ldaxr(v10);
          v12 = v11 - 1;
        }
        while (__stlxr(v12, v10));
        if (!v12)
          return (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
      }
    }
  }
  else
  {
    *v2 = 0;
    *(_QWORD *)(result + 40) = 0;
  }
  return result;
}

void boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::dispose(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
    {
      if ((v2 & 1) == 0)
      {
        v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
        if (v3)
          v3(v1 + 32, v1 + 32, 2);
      }
      *(_QWORD *)(v1 + 24) = 0;
    }
    if (*(_QWORD *)v1)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)v1, *(_QWORD *)v1);
      operator delete(*(void **)v1);
    }
    operator delete((void *)v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::get_untyped_deleter()
{
  return 0;
}

_QWORD *boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>::~connection_body(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;

  *a1 = off_251CC09D0;
  v2 = (unsigned int *)a1[7];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  v9 = (unsigned int *)a1[5];
  if (v9)
  {
    v10 = v9 + 2;
    do
    {
      v11 = __ldaxr(v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, v10));
    if (!v12)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
      v13 = v9 + 3;
      do
      {
        v14 = __ldaxr(v13);
        v15 = v14 - 1;
      }
      while (__stlxr(v15, v13));
      if (!v15)
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
    }
  }
  *a1 = &unk_251CB86B8;
  v16 = (unsigned int *)a1[2];
  if (v16)
  {
    v17 = v16 + 3;
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 24))(v16);
  }
  return a1;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(uint64_t *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t *, uint64_t *, uint64_t);

  v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 1, a1 + 1, 2);
    }
    *a1 = 0;
  }
  return a1;
}

void boost::detail::function::functor_manager<ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>>::manage(uint64_t a1, _WORD *a2, unsigned int a3)
{
  NSObject *v6;
  void *v7;
  const void *v8;
  const char *v9;

  if (a3 == 4)
    goto LABEL_2;
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      v9 = (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v9 == (const char *)(0x800000024B95612BLL & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v9, (const char *)(0x800000024B95612BLL & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(_QWORD *)a2 = a1;
      }
      else
      {
        *(_QWORD *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      dispatch_release(*(dispatch_object_t *)a2);
      v8 = (const void *)*((_QWORD *)a2 + 1);
      if (v8)
LABEL_9:
        _Block_release(v8);
    }
  }
  else
  {
    v6 = *(NSObject **)a1;
    v7 = *(void **)(a1 + 8);
    *(_QWORD *)a2 = *(_QWORD *)a1;
    if (v7)
    {
      v7 = _Block_copy(v7);
      v6 = *(NSObject **)a2;
    }
    *((_QWORD *)a2 + 1) = v7;
    dispatch_retain(v6);
    if (a3 == 1)
    {
      dispatch_release(*(dispatch_object_t *)a1);
      v8 = *(const void **)(a1 + 8);
      if (v8)
        goto LABEL_9;
    }
  }
}

void boost::detail::function::void_function_obj_invoker1<ctu::DispatchSlot<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>,void,ctu::cf::CFSharedRef<__CFDictionary const>>::invoke(uint64_t a1, const void **a2)
{
  const void *v2;
  const void *v3;
  NSObject *v4;
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  void *v11;
  const void *v12;
  void *v13;
  const void *v14;
  void *v15;
  const void *v16;
  char v17;
  _QWORD *v18;
  char *v19;
  char *v20;
  void (*v21)(__int128 *, __int128 *, uint64_t);
  const void *v22;
  __int128 v23;
  uint64_t v24;
  _QWORD block[6];

  v2 = *a2;
  v22 = *a2;
  *a2 = 0;
  v4 = *(NSObject **)a1;
  v3 = *(const void **)(a1 + 8);
  if (!v3)
  {
    v6 = 0;
LABEL_10:
    v17 = 1;
    *(_QWORD *)&v23 = 0;
    if (!v2)
      goto LABEL_23;
    goto LABEL_22;
  }
  v5 = _Block_copy(v3);
  v6 = v5;
  if (!v5)
    goto LABEL_10;
  v7 = _Block_copy(v5);
  v8 = v7;
  if (!v7)
  {
    v17 = 0;
    *(_QWORD *)&v23 = 0;
    if (!v2)
      goto LABEL_23;
LABEL_22:
    CFRetain(v2);
    goto LABEL_23;
  }
  v9 = _Block_copy(v7);
  v10 = v9;
  if (v9)
  {
    v11 = _Block_copy(v9);
    v12 = v11;
    if (v11)
    {
      v13 = _Block_copy(v11);
      v14 = v13;
      if (v13)
      {
        v15 = _Block_copy(v13);
        v16 = v15;
        if (v15)
        {
          *(_QWORD *)&v23 = _Block_copy(v15);
          _Block_release(v16);
        }
        else
        {
          *(_QWORD *)&v23 = 0;
        }
        _Block_release(v14);
      }
      else
      {
        *(_QWORD *)&v23 = 0;
      }
      _Block_release(v12);
    }
    else
    {
      *(_QWORD *)&v23 = 0;
    }
    _Block_release(v10);
  }
  else
  {
    *(_QWORD *)&v23 = 0;
  }
  _Block_release(v8);
  v17 = 0;
  if (v2)
    goto LABEL_22;
LABEL_23:
  v18 = operator new(8uLL);
  *v18 = v2;
  if (v2)
    CFRetain(v2);
  v19 = (char *)operator new(0x20uLL);
  v20 = v19;
  *(_QWORD *)v19 = 0;
  if (boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable)
  {
    *(_QWORD *)v19 = boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable;
    if ((boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 1) != 0)
    {
      *(_OWORD *)(v19 + 8) = v23;
      *((_QWORD *)v19 + 3) = v24;
    }
    else
    {
      (*(void (**)(__int128 *, char *, _QWORD))((unint64_t)boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL))(&v23, v19 + 8, 0);
    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEES8__block_invoke;
  block[3] = &__block_descriptor_tmp_77_0;
  block[4] = v20;
  block[5] = v18;
  dispatch_async(v4, block);
  if (v2)
    CFRelease(v2);
  if (boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable)
  {
    if ((boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 1) == 0)
    {
      v21 = *(void (**)(__int128 *, __int128 *, uint64_t))((unint64_t)boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::assign_to<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>(dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL);
      if (v21)
        v21(&v23, &v23, 2);
    }
  }
  if ((v17 & 1) == 0)
  {
    _Block_release(v6);
    v2 = v22;
  }
  if (v2)
    CFRelease(v2);
}

void sub_24B9412B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, uint64_t a11)
{
  const void *v11;
  void *v12;
  char v13;

  operator delete(v12);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>::~function(&a11);
  if ((v13 & 1) == 0)
    _Block_release(v11);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)&a9);
  _Unwind_Resume(a1);
}

void ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEES8__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  std::runtime_error_vtbl *v3;
  void (*v4)(_QWORD *, std::runtime_error *);
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t *, uint64_t *, uint64_t);
  CFTypeRef *v8;
  std::runtime_error cf;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = **(std::runtime_error_vtbl ***)(a1 + 40);
  if (v3)
    CFRetain(v3);
  if (!*v2)
  {
    std::runtime_error::runtime_error(&cf, "call to empty boost::function");
    cf.__vftable = (std::runtime_error_vtbl *)&unk_251CB8BE8;
    boost::throw_exception<boost::bad_function_call>(&cf);
  }
  v4 = *(void (**)(_QWORD *, std::runtime_error *))((*v2 & 0xFFFFFFFFFFFFFFFELL) + 8);
  cf.__vftable = v3;
  v4(v2 + 1, &cf);
  if (cf.__vftable)
    CFRelease(cf.__vftable);
  v5 = *(uint64_t **)(a1 + 32);
  if (v5)
  {
    v6 = *v5;
    if (*v5)
    {
      if ((v6 & 1) == 0)
      {
        v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 & 0xFFFFFFFFFFFFFFFELL);
        if (v7)
          v7(v5 + 1, v5 + 1, 2);
      }
      *v5 = 0;
    }
    operator delete(v5);
  }
  v8 = *(CFTypeRef **)(a1 + 40);
  if (v8)
  {
    if (*v8)
      CFRelease(*v8);
    operator delete(v8);
  }
}

void sub_24B94140C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, std::runtime_error a11)
{
  std::runtime_error::~runtime_error(&a11);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  _Unwind_Resume(a1);
}

void sub_24B941428(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_24B941444(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void boost::detail::function::functor_manager<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>>::manage(void **a1, _WORD *a2, unsigned int a3)
{
  void *v6;
  void *v7;
  const char *v8;

  if (a3 == 4)
    goto LABEL_2;
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      v8 = (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v8 == (const char *)(0x800000024B95618FLL & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v8, (const char *)(0x800000024B95618FLL & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(_QWORD *)a2 = a1;
      }
      else
      {
        *(_QWORD *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      v7 = *(void **)a2;
      if (*(_QWORD *)a2)
LABEL_9:
        _Block_release(v7);
    }
  }
  else
  {
    v6 = *a1;
    if (*a1)
      v6 = _Block_copy(v6);
    *(_QWORD *)a2 = v6;
    if (a3 == 1)
    {
      v7 = *a1;
      if (*a1)
        goto LABEL_9;
    }
  }
}

void boost::detail::function::void_function_obj_invoker1<dispatch::block<void({block_pointer})(ctu::cf::CFSharedRef<__CFDictionary const>)>,void,ctu::cf::CFSharedRef<__CFDictionary const>>::invoke(uint64_t *a1, CFTypeRef *a2)
{
  uint64_t v2;
  CFTypeRef cf;

  v2 = *a1;
  cf = *a2;
  *a2 = 0;
  (*(void (**)(void))(v2 + 16))();
  if (cf)
    CFRelease(cf);
}

void sub_24B9415A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::move_assign(uint64_t result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  __int128 v7;

  if (a2 != (uint64_t *)result)
  {
    v2 = a2;
    v3 = (uint64_t *)result;
    v4 = *a2;
    if (*a2)
    {
      *(_QWORD *)result = v4;
      if ((v4 & 1) != 0)
      {
        v7 = *(_OWORD *)(a2 + 1);
        *(_QWORD *)(result + 24) = a2[3];
        *(_OWORD *)(result + 8) = v7;
      }
      else
      {
        result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL))(a2 + 1, result + 8, 1);
      }
    }
    else
    {
      v5 = *(_QWORD *)result;
      if (!*(_QWORD *)result)
        return result;
      if ((v5 & 1) == 0)
      {
        v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 & 0xFFFFFFFFFFFFFFFELL);
        if (v6)
          result = v6(result + 8, result + 8, 2);
      }
      v2 = v3;
    }
    *v2 = 0;
  }
  return result;
}

void sub_24B941658(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_rethrow();
}

void sub_24B941668(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *boost::function1<void,ctu::cf::CFSharedRef<__CFDictionary const>>::~function1(uint64_t *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t *, uint64_t *, uint64_t);

  v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 1, a1 + 1, 2);
    }
    *a1 = 0;
  }
  return a1;
}

_QWORD *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::~foreign_weak_ptr_impl(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_251CC0B48;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::~foreign_weak_ptr_impl(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_251CC0B48;
  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::lock(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;

  v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  v7 = operator new(0x18uLL);
  *v7 = &off_251CC0B98;
  v7[1] = v6;
  v7[2] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    *a2 = v7;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    *a2 = v7;
  }
}

void sub_24B941824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::expired(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  return !v1 || *(_QWORD *)(v1 + 8) == -1;
}

_QWORD *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<TraceManager>>::clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_251CC0B48;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

_QWORD *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::~foreign_shared_ptr_impl(_QWORD *result)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  *result = &off_251CC0B98;
  v2 = (std::__shared_weak_count *)result[2];
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
      return v1;
    }
  }
  return result;
}

void boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::~foreign_shared_ptr_impl(_QWORD *__p)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  *__p = &off_251CC0B98;
  v2 = (std::__shared_weak_count *)__p[2];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    operator delete(__p);
  }
  else
  {
LABEL_5:
    operator delete(__p);
  }
}

_QWORD *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<TraceManager>>::clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_251CC0B98;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

void ctu::SharedSynchronizable<TraceManager>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD block[6];
  std::__shared_weak_count *v16;

  v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_251CC0BF0;
  block[5] = v5;
  v16 = v7;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  block[4] = a2;
  dispatch_async(v8, block);
  v11 = v16;
  if (v16)
  {
    v12 = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12TraceManagerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c41_ZTSNSt3__110shared_ptrIK12TraceManagerEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void ___ZN9analytics29registerCallbackForTimedEventI12TraceManagerEEvPKcNS_9TimerTypeENSt3__18weak_ptrIT_EEN8dispatch5queueEU13block_pointerFvNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_block_invoke(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string v10;

  v3 = (std::__shared_weak_count *)a1[5];
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      if (a1[4])
      {
        v7 = a1[6];
        if (*(char *)(a2 + 23) < 0)
          std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
        else
          v10 = *(std::string *)a2;
        (*(void (**)(uint64_t, std::string *))(v7 + 16))(v7, &v10);
        if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v10.__r_.__value_.__l.__data_);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_24B941C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B941C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12TraceManagerEE48c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  void *result;

  v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = (void *)a2[6];
  if (result)
    result = _Block_copy(result);
  a1[6] = result;
  return result;
}

void __destroy_helper_block_e8_32c37_ZTSNSt3__18weak_ptrI12TraceManagerEE48c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::initialize(dispatch::group_session)::$_0>(TraceManager::initialize(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::initialize(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::initialize(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  std::__shared_weak_count ***v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *(std::__shared_weak_count ****)a1;
  TraceManager::finishInitialization_sync(**(std::__shared_weak_count ****)a1);
  operator delete(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    operator delete((void *)a1);
  }
  else
  {
LABEL_5:
    operator delete((void *)a1);
  }
}

void sub_24B941DCC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  operator delete(v2);
  v4 = (std::__shared_weak_count *)v1[2];
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
  operator delete(v1);
  _Unwind_Resume(a1);
}

void ctu::cf::insert<char const*,int>(__CFDictionary *a1, const __CFString **a2, int a3, const __CFAllocator *a4, const __CFAllocator *a5)
{
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  BOOL v11;
  CFNumberRef v12;
  int valuePtr;

  v12 = 0;
  ctu::cf::convert_copy((ctu::cf *)&v12, a2, (const char *)0x8000100, (uint64_t)a4, a5);
  v8 = v12;
  valuePtr = a3;
  v9 = CFNumberCreate(a4, kCFNumberIntType, &valuePtr);
  v10 = v9;
  v12 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    CFDictionaryAddValue(a1, v8, v9);
  }
  CFRelease(v10);
LABEL_8:
  if (v8)
    CFRelease(v8);
}

void sub_24B941EC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_24B941EE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::cf::insert<char const*,BOOL>(__CFDictionary *a1, const __CFString **a2, int a3, uint64_t a4, const __CFAllocator *a5)
{
  void *v7;
  void **v8;
  void *v9;
  BOOL v10;
  void *key;

  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, a2, (const char *)0x8000100, a4, a5);
  v7 = key;
  v8 = (void **)MEMORY[0x24BDBD270];
  if (!a3)
    v8 = (void **)MEMORY[0x24BDBD268];
  v9 = *v8;
  key = *v8;
  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    CFDictionaryAddValue(a1, v7, v9);
  }
  CFRelease(v9);
LABEL_10:
  if (v7)
    CFRelease(v7);
}

void sub_24B941FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a9);
  _Unwind_Resume(a1);
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_16collectLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb0_E3__1EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  __int128 v8;
  void *v9;
  const __CFAllocator *v10;
  const char **v11;
  uint64_t *v12;
  xpc_object_t value;
  const char *v14;
  const __CFAllocator *v15;
  __CFDictionary *v16;
  xpc_object_t v17;
  xpc_object_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_weak_owners;
  unint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  const void *v30;
  void *v31;
  NSObject *v32;
  xpc_object_t v33;
  xpc_object_t v34;
  const char *v35;
  xpc_object_t v36;
  xpc_object_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  xpc_object_t v47;
  std::string v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  void *v53;
  CFTypeRef cf;
  xpc_object_t aBlock;
  dispatch_object_t v56;
  xpc_object_t v57;
  xpc_object_t object;
  void *__p[2];
  __int128 v60;
  xpc_object_t v61;
  std::string v62;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 24);
  memset(&v62, 0, sizeof(v62));
  v61 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  v6 = MEMORY[0x24BDACFA0];
  if (v4)
  {
    v61 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    v61 = v5;
    if (!v5)
    {
      v7 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x24BD2A468](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v7 = xpc_null_create();
LABEL_8:
  v61 = v7;
LABEL_9:
  xpc_release(v5);
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v8;
  v60 = v8;
  v9 = *(void **)(v2 + 16);
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  abm::HelperClient::perform();
  xpc_release(object);
  object = 0;
  v11 = (const char **)MEMORY[0x24BDFC8B8];
  v12 = (uint64_t *)MEMORY[0x24BDBD240];
  if (!LODWORD(__p[0]) && MEMORY[0x24BD2A468](v61) == v6)
  {
    value = xpc_dictionary_get_value(v61, *v11);
    aBlock = value;
    if (value)
      xpc_retain(value);
    else
      aBlock = xpc_null_create();
    xpc::dyn_cast_or_default((xpc *)&aBlock, (const object *)"", v14);
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    v62 = v48;
    *((_BYTE *)&v48.__r_.__value_.__s + 23) = 0;
    v48.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(aBlock);
    if (ResetInfo::reasonMatchesAtLeastOneApplicablePattern(2, (uint64_t)&v62, (__int128 **)(*(_QWORD *)(v3 + 288) + 48)))ctu::cf::update<char const*,BOOL>(*(__CFDictionary **)(v2 + 32), (const __CFString **)*MEMORY[0x24BE052F8], 1, *v12, v15);
    if (ResetInfo::reasonMatchesAtLeastOneApplicablePattern(4, (uint64_t)&v62, (__int128 **)(*(_QWORD *)(v3 + 288) + 48)))ctu::cf::update<char const*,BOOL>(*(__CFDictionary **)(v2 + 32), (const __CFString **)*MEMORY[0x24BE052F0], 1, *v12, v10);
  }
  v16 = *(__CFDictionary **)(v2 + 32);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v48, v62.__r_.__value_.__l.__data_, v62.__r_.__value_.__l.__size_);
  else
    v48 = v62;
  ctu::cf::insert<char const*,std::string>(v16, (const __CFString **)*MEMORY[0x24BE052D8], (uint64_t)&v48, *v12, v10);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  v17 = xpc_string_create("");
  if (!v17)
    v17 = xpc_null_create();
  xpc_dictionary_set_value(*(xpc_object_t *)(v2 + 16), *v11, v17);
  v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  v19 = *(void **)(v2 + 16);
  v57 = v19;
  if (v19)
    xpc_retain(v19);
  else
    v57 = xpc_null_create();
  aBlock = 0;
  v56 = 0;
  abm::HelperClient::perform();
  if (v56)
    dispatch_release(v56);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v57);
  v57 = 0;
  v20 = *(std::__shared_weak_count **)(v3 + 128);
  if (!v20 || (v21 = *(_QWORD *)(v3 + 120), (v22 = std::__shared_weak_count::lock(v20)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v23 = v22;
  p_shared_weak_owners = (unint64_t *)&v22->__shared_weak_owners_;
  do
    v25 = __ldxr(p_shared_weak_owners);
  while (__stxr(v25 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v22->__shared_owners_;
  do
    v27 = __ldaxr(p_shared_owners);
  while (__stlxr(v27 - 1, p_shared_owners));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v23);
  }
  v48.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
  v48.__r_.__value_.__l.__size_ = 1174405120;
  v48.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke;
  v49 = &__block_descriptor_tmp_93_0;
  v50 = v3;
  v51 = v21;
  v52 = v23;
  do
    v28 = __ldxr(p_shared_weak_owners);
  while (__stxr(v28 + 1, p_shared_weak_owners));
  v29 = *(void **)(v2 + 40);
  if (v29)
    v29 = _Block_copy(v29);
  v53 = v29;
  v30 = *(const void **)(v2 + 32);
  cf = v30;
  if (v30)
    CFRetain(v30);
  v31 = _Block_copy(&v48);
  v32 = *(NSObject **)(v3 + 136);
  if (v32)
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  v33 = xpc_dictionary_create(0, 0, 0);
  if (v33 || (v33 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v33) == v6)
    {
      xpc_retain(v33);
      v34 = v33;
    }
    else
    {
      v34 = xpc_null_create();
    }
  }
  else
  {
    v34 = xpc_null_create();
    v33 = 0;
  }
  xpc_release(v33);
  v35 = (const char *)(v2 + 48);
  if (*(char *)(v2 + 71) < 0)
    v35 = *(const char **)v35;
  v36 = xpc_string_create(v35);
  if (!v36)
    v36 = xpc_null_create();
  xpc_dictionary_set_value(v34, (const char *)*MEMORY[0x24BDFC850], v36);
  v37 = xpc_null_create();
  xpc_release(v36);
  xpc_release(v37);
  v47 = v34;
  if (v34)
  {
    xpc_retain(v34);
    v46 = 0;
    if (v31)
      goto LABEL_65;
  }
  else
  {
    v46 = 0;
    v47 = xpc_null_create();
    if (v31)
    {
LABEL_65:
      v38 = _Block_copy(v31);
      v39 = *MEMORY[0x24BDFC800];
      v44 = v38;
      v45 = v32;
      if (!v32)
        goto LABEL_67;
      goto LABEL_66;
    }
  }
  v38 = 0;
  v39 = *MEMORY[0x24BDFC800];
  v44 = 0;
  v45 = v32;
  if (v32)
LABEL_66:
    dispatch_retain(v32);
LABEL_67:
  TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)9, v39, 0, 1, &v47, &v46, &v44);
  if (v32)
    dispatch_release(v32);
  if (v38)
    _Block_release(v38);
  xpc_release(v47);
  v47 = 0;
  xpc_release(v34);
  if (v32)
    dispatch_release(v32);
  if (v31)
    _Block_release(v31);
  if (cf)
    CFRelease(cf);
  if (v53)
    _Block_release(v53);
  if (v52)
    std::__shared_weak_count::__release_weak(v52);
  std::__shared_weak_count::__release_weak(v23);
  if (SHIBYTE(v60) < 0)
    operator delete(__p[1]);
  xpc_release(v61);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);
  v40 = (void *)_ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(v2);
  operator delete(v40);
  v41 = (std::__shared_weak_count *)a1[2];
  if (v41)
  {
    v42 = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  operator delete(a1);
}

void sub_24B9425F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,void *aBlock,CFTypeRef cf,uint64_t a25,xpc_object_t object,dispatch_object_t a27,xpc_object_t a28,xpc_object_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;

  xpc_release(object);
  if (a36 < 0)
    operator delete(__p);
  xpc_release(*(xpc_object_t *)(v38 - 120));
  if (*(char *)(v38 - 89) < 0)
    operator delete(*(void **)(v38 - 112));
  v40 = (void *)_ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_EN3__1D1Ev(v37);
  operator delete(v40);
  v41 = (std::__shared_weak_count *)v36[2];
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  operator delete(v36);
  _Unwind_Resume(a1);
}

void ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  const void *v4;
  size_t v5;
  void *v6;
  void **v7;
  const void *v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID v17;
  const void *v18;
  void *v19;
  const void *v20;
  CFTypeRef v21;
  _QWORD v22[4];
  void *v23;
  CFTypeRef v24;
  void *aBlock;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  xpc_object_t v31;

  v2 = a1[4];
  v29 = 0;
  v30 = 0;
  v3 = (std::__shared_weak_count *)a1[6];
  if (!v3 || (v30 = std::__shared_weak_count::lock(v3)) == 0 || (v29 = a1[5]) == 0)
  {
    v9 = xpc_null_create();
    v10 = a1[7];
    v31 = v9;
    v11 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v10 + 16))(v10, 3760250880, &v31);
    xpc_release(v31);
    xpc_release(v11);
    goto LABEL_10;
  }
  v4 = (const void *)*MEMORY[0x24BE052B0];
  v5 = strlen((const char *)*MEMORY[0x24BE052B0]);
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    v15 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v15 = v5 | 7;
    v16 = v15 + 1;
    v7 = (void **)operator new(v15 + 1);
    __dst[1] = v6;
    v28 = v16 | 0x8000000000000000;
    __dst[0] = v7;
LABEL_19:
    memmove(v7, v4, (size_t)v6);
    *((_BYTE *)v6 + (_QWORD)v7) = 0;
    v8 = (const void *)a1[8];
    if (!v8)
      goto LABEL_22;
    goto LABEL_20;
  }
  HIBYTE(v28) = v5;
  v7 = __dst;
  if (v5)
    goto LABEL_19;
  LOBYTE(__dst[0]) = 0;
  v8 = (const void *)a1[8];
  if (!v8)
    goto LABEL_22;
LABEL_20:
  v17 = CFGetTypeID(v8);
  if (v17 == CFDictionaryGetTypeID())
  {
    cf = v8;
    CFRetain(v8);
    goto LABEL_23;
  }
LABEL_22:
  cf = 0;
LABEL_23:
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 1174405120;
  v22[2] = ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke_2;
  v22[3] = &__block_descriptor_tmp_92_0;
  v18 = (const void *)a1[7];
  if (!v18)
  {
    v20 = (const void *)a1[8];
    v23 = 0;
    v24 = v20;
    if (!v20)
      goto LABEL_28;
    goto LABEL_27;
  }
  v19 = _Block_copy(v18);
  v20 = (const void *)a1[8];
  v23 = v19;
  v24 = v20;
  if (v20)
LABEL_27:
    CFRetain(v20);
LABEL_28:
  aBlock = _Block_copy(v22);
  Service::broadcastEvent(v2, (uint64_t)__dst, &cf, (const void **)&aBlock);
  if (aBlock)
    _Block_release(aBlock);
  if (cf)
    CFRelease(cf);
  if (SHIBYTE(v28) < 0)
  {
    operator delete(__dst[0]);
    v21 = v24;
    if (!v24)
      goto LABEL_37;
    goto LABEL_36;
  }
  v21 = v24;
  if (v24)
LABEL_36:
    CFRelease(v21);
LABEL_37:
  if (v23)
    _Block_release(v23);
LABEL_10:
  v12 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_24B942AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *aBlock, const void *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  const void **v22;
  uint64_t v23;

  if (aBlock)
    _Block_release(aBlock);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v22);
  if (a13)
    _Block_release(a13);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a16);
  if (a22 < 0)
  {
    operator delete(__p);
    std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v23 - 72);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v23 - 72);
  _Unwind_Resume(a1);
}

void ___ZZZN12TraceManager16collectLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb0_ENK3__1clEv_block_invoke_2(uint64_t a1, const void *a2)
{
  uint64_t *v2;
  xpc_object_t object;
  unsigned int v4;

  v2 = (uint64_t *)(a1 + 32);
  v4 = 0;
  ctu::cf_to_xpc(*(ctu **)(a1 + 40), a2);
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::object>(v2, &v4, &object);
  xpc_release(object);
}

void sub_24B942BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

CFTypeRef __copy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE40c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  CFTypeRef result;

  v4 = *(const void **)(a2 + 32);
  if (!v4)
  {
    result = *(CFTypeRef *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = result;
    if (!result)
      return result;
    return CFRetain(result);
  }
  v5 = _Block_copy(v4);
  result = *(CFTypeRef *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE40c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    _Block_release(v3);
}

CFTypeRef __copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const void *v7;
  void *v8;
  CFTypeRef result;

  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (const void *)a2[7];
  if (!v7)
  {
    result = (CFTypeRef)a2[8];
    a1[7] = 0;
    a1[8] = result;
    if (!result)
      return result;
    return CFRetain(result);
  }
  v8 = _Block_copy(v7);
  result = (CFTypeRef)a2[8];
  a1[7] = v8;
  a1[8] = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  std::__shared_weak_count *v4;

  v2 = (const void *)a1[8];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[7];
  if (v3)
    _Block_release(v3);
  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZNS3_24collectBasebandLogs_syncEN3xpc4dictENS_5blockIU13block_pointerFviS7_EEEEUb1_E3__2EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrISD_NSI_14default_deleteISD_EEEEENUlPvE_8__invokeESN_(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  const char *v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t *p_shared_owners;
  unint64_t v37;
  void *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  void *aBlock;
  dispatch_object_t object;
  xpc_object_t v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  uint8_t buf[8];
  uint64_t v49;
  void (*v50)(_QWORD *, unsigned int *);
  void *v51;
  uint64_t v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  void *v55;
  std::string __p;
  void *v57;
  _BYTE v58[32];
  __int128 block;
  void (*v60)(uint64_t);
  void *v61;
  __int128 *v62;

  v2 = *a1;
  v42 = v2;
  v3 = *(_QWORD *)v2;
  v4 = *(NSObject **)(*(_QWORD *)v2 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v4, OS_LOG_TYPE_DEFAULT, "#I Snapshot of baseband trace complete", buf, 2u);
  }
  v5 = (const char *)(v2 + 8);
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v58 = v6;
  *(_OWORD *)&v58[16] = v6;
  if (*(char *)(v2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v58, *(const std::string::value_type **)(v2 + 8), *(_QWORD *)(v2 + 16));
  }
  else
  {
    v7 = *(_OWORD *)v5;
    *(_QWORD *)&v58[16] = *(_QWORD *)(v2 + 24);
    *(_OWORD *)v58 = v7;
  }
  v8 = *(void **)(v2 + 32);
  if (v8)
    v8 = _Block_copy(v8);
  *(_QWORD *)&v58[24] = v8;
  if (!*(_DWORD *)(v2 + 40))
  {
    _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv((uint64_t)v58);
    goto LABEL_74;
  }
  v9 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  v49 = 1174405120;
  v50 = ___ZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEv_block_invoke;
  v51 = &__block_descriptor_tmp_94_0;
  v11 = *(_QWORD *)(v2 + 48);
  v10 = *(std::__shared_weak_count **)(v2 + 56);
  v52 = v3;
  v53 = v11;
  v54 = v10;
  if (v10)
  {
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
  }
  v14 = *(void **)(v2 + 32);
  if (v14)
    v14 = _Block_copy(v14);
  v55 = v14;
  if ((v58[23] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v58, *(std::string::size_type *)&v58[8]);
  else
    __p = *(std::string *)v58;
  v15 = *(void **)&v58[24];
  if (*(_QWORD *)&v58[24])
    v15 = _Block_copy(*(const void **)&v58[24]);
  v57 = v15;
  v16 = _Block_copy(buf);
  v17 = *(NSObject **)(v3 + 136);
  if (v17)
    dispatch_retain(v17);
  v18 = xpc_dictionary_create(0, 0, 0);
  if (v18 || (v18 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v18) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v18);
      v19 = v18;
    }
    else
    {
      v19 = xpc_null_create();
    }
  }
  else
  {
    v19 = xpc_null_create();
    v18 = 0;
  }
  xpc_release(v18);
  if (*(char *)(v2 + 31) < 0)
    v5 = *(const char **)v5;
  v20 = xpc_string_create(v5);
  if (!v20)
    v20 = xpc_null_create();
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BDFC868], v20);
  v21 = xpc_null_create();
  xpc_release(v20);
  xpc_release(v21);
  v22 = (const char *)(v2 + 64);
  if (*(char *)(v2 + 87) < 0)
    v22 = *(const char **)v22;
  v23 = xpc_string_create(v22);
  if (!v23)
    v23 = xpc_null_create();
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BDFC880], v23);
  v24 = xpc_null_create();
  xpc_release(v23);
  xpc_release(v24);
  v25 = xpc_int64_create(*(int *)(v2 + 40));
  if (!v25)
    v25 = xpc_null_create();
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BDFC970], v25);
  v26 = xpc_null_create();
  xpc_release(v25);
  xpc_release(v26);
  v27 = xpc_BOOL_create(*(_BYTE *)(v2 + 88));
  if (!v27)
    v27 = xpc_null_create();
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BDFC7F8], v27);
  v28 = xpc_null_create();
  xpc_release(v27);
  xpc_release(v28);
  v46 = 0xAAAAAAAAAAAAAAAALL;
  v47 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  *(_QWORD *)&block = v9;
  *((_QWORD *)&block + 1) = 0x40000000;
  v60 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v61 = &__block_descriptor_tmp_13_5;
  v62 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v30 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    block = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_45;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v30 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    block = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_45;
  }
  v31 = (unint64_t *)(v30 + 8);
  do
    v32 = __ldxr(v31);
  while (__stxr(v32 + 1, v31));
LABEL_45:
  abm::HelperClient::create();
  v33 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
  if (!*((_QWORD *)&block + 1))
    goto LABEL_49;
  v34 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
  do
    v35 = __ldaxr(v34);
  while (__stlxr(v35 - 1, v34));
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
    v45 = v19;
    if (v19)
    {
LABEL_50:
      xpc_retain(v19);
      if (v16)
        goto LABEL_51;
      goto LABEL_86;
    }
  }
  else
  {
LABEL_49:
    v45 = v19;
    if (v19)
      goto LABEL_50;
  }
  v45 = xpc_null_create();
  if (v16)
  {
LABEL_51:
    aBlock = _Block_copy(v16);
    object = v17;
    if (!v17)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_86:
  aBlock = 0;
  object = v17;
  if (v17)
LABEL_52:
    dispatch_retain(v17);
LABEL_53:
  abm::HelperClient::perform();
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v45);
  v45 = 0;
  p_shared_owners = &v47->__shared_owners_;
  do
    v37 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v37 - 1, (unint64_t *)p_shared_owners));
  if (!v37)
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  xpc_release(v19);
  if (v17)
    dispatch_release(v17);
  if (v16)
    _Block_release(v16);
  if (v57)
    _Block_release(v57);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    v38 = v55;
    if (!v55)
      goto LABEL_72;
    goto LABEL_71;
  }
  v38 = v55;
  if (v55)
LABEL_71:
    _Block_release(v38);
LABEL_72:
  if (v54)
    std::__shared_weak_count::__release_weak(v54);
LABEL_74:
  if (*(_QWORD *)&v58[24])
    _Block_release(*(const void **)&v58[24]);
  if ((v58[23] & 0x80000000) != 0)
    operator delete(*(void **)v58);
  _ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(&v42);
  v39 = (std::__shared_weak_count *)a1[2];
  if (v39)
  {
    v40 = (unint64_t *)&v39->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  operator delete(a1);
}

void sub_24B943368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, dispatch_object_t object, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,void *aBlock,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36)
{
  _QWORD *v36;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;

  if (aBlock)
    _Block_release(aBlock);
  if (a21)
    std::__shared_weak_count::__release_weak(a21);
  if (a36)
    _Block_release(a36);
  if (a35 < 0)
    operator delete(__p);
  _ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(&a9);
  v38 = (std::__shared_weak_count *)v36[2];
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v40 = __ldaxr(p_shared_owners);
    while (__stlxr(v40 - 1, p_shared_owners));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  operator delete(v36);
  _Unwind_Resume(a1);
}

uint64_t *_ZNSt3__110unique_ptrIZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS3_EEEEUb1_E3__2NS_14default_deleteIS9_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  const void *v4;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*(char *)(v2 + 87) < 0)
      operator delete(*(void **)(v2 + 64));
    v3 = *(std::__shared_weak_count **)(v2 + 56);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    v4 = *(const void **)(v2 + 32);
    if (v4)
      _Block_release(v4);
    if (*(char *)(v2 + 31) < 0)
      operator delete(*(void **)(v2 + 8));
    operator delete((void *)v2);
  }
  return a1;
}

void _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  const char *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  unsigned int v10;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xdict = v2;
  }
  else
  {
    v3 = xpc_null_create();
    xdict = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x24BD2A468](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  xdict = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_string_create((const char *)*MEMORY[0x24BDFC720]);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x24BE05268], v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  v7 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0)
    v7 = *(const char **)a1;
  v8 = xpc_string_create(v7);
  if (!v8)
    v8 = xpc_null_create();
  xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x24BE05090], v8);
  v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  v10 = 0;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int,xpc::dict&>((uint64_t *)(a1 + 24), &v10, &xdict);
  xpc_release(xdict);
}

void sub_24B943760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEv_block_invoke(_QWORD *a1, unsigned int *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v6;
  uint64_t v7;
  NSObject *v8;
  void **v9;
  xpc_object_t v10;
  uint64_t v11;
  xpc_object_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *__p[2];
  char v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint8_t buf[4];
  void **v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  v17 = 0;
  v18 = 0;
  v4 = (std::__shared_weak_count *)a1[6];
  if (!v4)
  {
    v6 = 0;
    goto LABEL_12;
  }
  v6 = std::__shared_weak_count::lock(v4);
  v18 = v6;
  if (!v6 || (v17 = a1[5]) == 0)
  {
LABEL_12:
    v10 = xpc_null_create();
    v11 = a1[7];
    __p[0] = v10;
    v12 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, void **))(v11 + 16))(v11, 3760250880, __p);
    xpc_release(__p[0]);
    xpc_release(v12);
    if (!v6)
      return;
    goto LABEL_17;
  }
  v7 = *a2;
  v8 = *(NSObject **)(v3 + 88);
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      TelephonyXPC::Result::toString(v7, (uint64_t)__p);
      if (v16 >= 0)
        v9 = __p;
      else
        v9 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v20 = v9;
      _os_log_error_impl(&dword_24B855000, v8, OS_LOG_TYPE_ERROR, "Failed to archive logs. Result: %s", buf, 0xCu);
      if (v16 < 0)
        operator delete(__p[0]);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(__p[0]) = 0;
    _os_log_debug_impl(&dword_24B855000, v8, OS_LOG_TYPE_DEBUG, "#D Compression is done.", (uint8_t *)__p, 2u);
  }
  _ZZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvENKUlvE_clEv((uint64_t)(a1 + 8));
LABEL_17:
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_24B943978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_24B9439BC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void *__copy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c124_ZTSZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvEUlvE_(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  std::string *v8;
  __int128 v9;
  void *result;

  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *(void **)(a2 + 56);
  if (v7)
    v7 = _Block_copy(v7);
  a1[7] = v7;
  v8 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 64);
    a1[10] = *(_QWORD *)(a2 + 80);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  result = *(void **)(a2 + 88);
  if (result)
    result = _Block_copy(result);
  a1[11] = result;
  return result;
}

void sub_24B943A60(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;
  std::__shared_weak_count *v4;

  v3 = *(const void **)(v1 + 56);
  if (v3)
    _Block_release(v3);
  v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c37_ZTSNSt3__18weak_ptrI12TraceManagerEE56c54_ZTSN8dispatch5blockIU13block_pointerFviN3xpc4dictEEEE64c124_ZTSZZZN12TraceManager24collectBasebandLogs_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFviS1_EEEEUb1_ENK3__2clEvEUlvE_(uint64_t a1)
{
  const void *v2;
  const void *v3;
  std::__shared_weak_count *v4;

  v2 = *(const void **)(a1 + 88);
  if (v2)
    _Block_release(v2);
  if (*(char *)(a1 + 87) < 0)
  {
    operator delete(*(void **)(a1 + 64));
    v3 = *(const void **)(a1 + 56);
    if (!v3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v3 = *(const void **)(a1 + 56);
  if (v3)
LABEL_7:
    _Block_release(v3);
LABEL_8:
  v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::start(dispatch::group_session)::$_0>(TraceManager::start(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::start(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::start(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(dispatch_group_t **__p)
{
  dispatch_group_t *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *__p;
  if (*__p)
  {
    if (*v2)
    {
      dispatch_group_leave(*v2);
      if (*v2)
        dispatch_release(*v2);
    }
    operator delete(v2);
  }
  v3 = (std::__shared_weak_count *)__p[2];
  if (!v3)
    goto LABEL_10;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    operator delete(__p);
  }
  else
  {
LABEL_10:
    operator delete(__p);
  }
}

void _ZZN8dispatch5asyncIZNK3ctu20SharedSynchronizableI12TraceManagerE15execute_wrappedIZZZNS3_25finishInitialization_syncEvEUb2_EUb3_E3__4EEvOT_EUlvE_EEvP16dispatch_queue_sNSt3__110unique_ptrIS7_NSC_14default_deleteIS7_EEEEENUlPvE_8__invokeESH_(_QWORD *a1)
{
  _DWORD *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void **v7;
  _DWORD *v8;
  void *__p;
  char v10;
  uint8_t buf[4];
  void **v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)*a1;
  v8 = v2;
  if (v2[6])
  {
    v3 = *(NSObject **)(*(_QWORD *)v2 + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      xpc::object::to_string((xpc::object *)(v2 + 8));
      v7 = v10 >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 136315138;
      v12 = v7;
      _os_log_error_impl(&dword_24B855000, v3, OS_LOG_TYPE_ERROR, "Dump state failed: %s", buf, 0xCu);
      if (v10 < 0)
        operator delete(__p);
    }
  }
  _ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev((uint64_t *)&v8);
  v4 = (std::__shared_weak_count *)a1[2];
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
  operator delete(a1);
}

void sub_24B943CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  _ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev(&a9);
  v11 = (std::__shared_weak_count *)v9[2];
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  operator delete(v9);
  _Unwind_Resume(a1);
}

uint64_t *_ZNSt3__110unique_ptrIZZZN12TraceManager25finishInitialization_syncEvEUb2_EUb3_E3__4NS_14default_deleteIS2_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(std::__shared_weak_count **)(v2 + 48);
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    xpc_release(*(xpc_object_t *)(v2 + 32));
    *(_QWORD *)(v2 + 32) = 0;
    v6 = *(std::__shared_weak_count **)(v2 + 16);
    if (v6)
    {
      v7 = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::sleep(dispatch::group_session)::$_0>(TraceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  size_t v6;
  size_t v7;
  void **p_dst;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  const void *v13;
  size_t v14;
  size_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  xpc_object_t v20;
  NSObject *v21;
  NSObject *v22;
  void **v23;
  uint64_t v24;
  NSObject *v25;
  void **v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  unint64_t v33;
  std::string __p;
  void *v35;
  uint64_t v36;
  dispatch_group_t group;
  NSObject *v38;
  xpc_object_t object;
  void **__dst;
  size_t v41;
  unint64_t v42;

  v2 = *a1;
  v3 = **a1;
  v4 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_24B855000, v4, OS_LOG_TYPE_DEFAULT, "#I Helper sleep requested", (uint8_t *)&__p, 2u);
  }
  v5 = (const void *)*MEMORY[0x24BE04E90];
  v6 = strlen((const char *)*MEMORY[0x24BE04E90]);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
LABEL_70:
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (void **)operator new(v9 + 1);
    v41 = v7;
    v42 = v10 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v42) = v6;
  p_dst = (void **)&__dst;
  if (v6)
LABEL_10:
    memmove(p_dst, v5, v7);
  *((_BYTE *)p_dst + v7) = 0;
  memset(&__p, 0, sizeof(__p));
  v11 = -1431655766;
  v12 = -1431655766;
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0))
      v12 = (int)object;
    else
      v12 = -1431655766;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v42) & 0x80000000) == 0)
      goto LABEL_17;
  }
  else if ((SHIBYTE(v42) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(__dst);
LABEL_17:
  v13 = (const void *)*MEMORY[0x24BE05048];
  v14 = strlen((const char *)*MEMORY[0x24BE05048]);
  if (v14 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_70;
  v15 = v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    v41 = v15;
    v42 = v18 | 0x8000000000000000;
    __dst = v16;
    goto LABEL_24;
  }
  HIBYTE(v42) = v14;
  v16 = (void **)&__dst;
  if (v14)
LABEL_24:
    memmove(v16, v13, v15);
  *((_BYTE *)v16 + v15) = 0;
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0))
      v11 = (int)object;
    else
      v11 = -1431655766;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v42) & 0x80000000) == 0)
    {
LABEL_31:
      if (v12 != 4)
        goto LABEL_42;
      goto LABEL_37;
    }
  }
  else if ((SHIBYTE(v42) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(__dst);
  if (v12 != 4)
  {
LABEL_42:
    v23 = (void **)xpc_null_create();
    v24 = *MEMORY[0x24BDFC8F0];
    v25 = v2[1];
    object = v25;
    __dst = v23;
    if (v25)
    {
      dispatch_retain(v25);
      dispatch_group_enter(v25);
    }
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
    TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)9, v24, 0x61A8u, 0, (xpc_object_t *)&__dst, (NSObject **)&object, (void **)&__p.__r_.__value_.__l.__data_);
    if (v25)
    {
      dispatch_group_leave(v25);
      dispatch_release(v25);
    }
    xpc_release(__dst);
    goto LABEL_61;
  }
LABEL_37:
  if (v11 != 1)
    goto LABEL_42;
  v19 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_24B855000, v19, OS_LOG_TYPE_DEFAULT, "#I Cellular Logging should be paused and the other traces will hanlde enter low power.", (uint8_t *)&__p, 2u);
  }
  v20 = xpc_null_create();
  v21 = v2[1];
  v38 = v21;
  object = v20;
  if (v21)
  {
    dispatch_retain(v21);
    dispatch_group_enter(v21);
    v22 = v2[1];
  }
  else
  {
    v22 = 0;
  }
  __p.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
  __p.__r_.__value_.__l.__size_ = 1174405120;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZN12TraceManager5sleepEN8dispatch13group_sessionEENK3__0clEv_block_invoke;
  v35 = &__block_descriptor_tmp_105_0;
  v36 = v3;
  group = v22;
  if (v22)
  {
    dispatch_retain(v22);
    dispatch_group_enter(v22);
  }
  v26 = (void **)_Block_copy(&__p);
  v27 = *MEMORY[0x24BDFC918];
  v28 = *(NSObject **)(v3 + 136);
  if (v28)
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  __dst = v26;
  v41 = (size_t)v28;
  TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)0xA, v27, 0x1388u, 1, &object, &v38, (void **)&__dst);
  if (v28)
    dispatch_release(v28);
  if (v26)
    _Block_release(v26);
  if (v21)
  {
    dispatch_group_leave(v21);
    dispatch_release(v21);
  }
  xpc_release(object);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
LABEL_61:
  v29 = v2[1];
  if (v29)
  {
    dispatch_group_leave(v29);
    v30 = v2[1];
    if (v30)
      dispatch_release(v30);
  }
  operator delete(v2);
  v31 = (std::__shared_weak_count *)a1[2];
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v33 = __ldaxr(p_shared_owners);
    while (__stlxr(v33 - 1, p_shared_owners));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  operator delete(a1);
}

void sub_24B94426C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, dispatch_group_t group, uint64_t a18, uint64_t a19, xpc_object_t object,xpc_object_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  _QWORD *v26;
  _QWORD *v27;
  NSObject *v28;
  const void *v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;

  if (v30)
    dispatch_release(v30);
  if (v29)
    _Block_release(v29);
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (v28)
  {
    dispatch_group_leave(v28);
    dispatch_release(v28);
  }
  xpc_release(object);
  v32 = v27[1];
  if (v32)
  {
    dispatch_group_leave(v32);
    v33 = v27[1];
    if (v33)
      dispatch_release(v33);
  }
  operator delete(v27);
  v34 = (std::__shared_weak_count *)v26[2];
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v36 = __ldaxr(p_shared_owners);
    while (__stlxr(v36 - 1, p_shared_owners));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void ___ZZN12TraceManager5sleepEN8dispatch13group_sessionEENK3__0clEv_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  xpc_object_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6[2];
  NSObject *v7;
  xpc_object_t object;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = xpc_null_create();
  v4 = *MEMORY[0x24BDFC8F0];
  v5 = *(NSObject **)(a1 + 40);
  v7 = v5;
  object = v3;
  if (v5)
  {
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
  v6[0] = 0;
  v6[1] = 0;
  TraceManager::runOnHelper_sync(v2, (const char *)9, v4, 0x61A8u, 0, &object, &v7, v6);
  if (v5)
  {
    dispatch_group_leave(v5);
    dispatch_release(v5);
  }
  xpc_release(object);
}

void sub_24B94443C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  NSObject *v12;

  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  if (v12)
  {
    dispatch_group_leave(v12);
    dispatch_release(v12);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<TraceManager>::execute_wrapped<TraceManager::wake(dispatch::group_session)::$_0>(TraceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<TraceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<TraceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  size_t v6;
  size_t v7;
  void **p_dst;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  const void *v13;
  size_t v14;
  size_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  NSObject *v20;
  xpc_object_t v21;
  NSObject *v22;
  void **v23;
  uint64_t v24;
  NSObject *v25;
  void **v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::string __p;
  void *v34;
  uint64_t v35;
  dispatch_group_t group;
  NSObject *v37;
  xpc_object_t object;
  void **__dst;
  size_t v40;
  unint64_t v41;

  v2 = *a1;
  v3 = **a1;
  v4 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_24B855000, v4, OS_LOG_TYPE_DEFAULT, "#I Helper wake requested", (uint8_t *)&__p, 2u);
  }
  v5 = (const void *)*MEMORY[0x24BE04E90];
  v6 = strlen((const char *)*MEMORY[0x24BE04E90]);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
LABEL_61:
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (void **)operator new(v9 + 1);
    v40 = v7;
    v41 = v10 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v41) = v6;
  p_dst = (void **)&__dst;
  if (v6)
LABEL_10:
    memmove(p_dst, v5, v7);
  *((_BYTE *)p_dst + v7) = 0;
  memset(&__p, 0, sizeof(__p));
  v11 = -1431655766;
  v12 = -1431655766;
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0))
      v12 = (int)object;
    else
      v12 = -1431655766;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v41) & 0x80000000) == 0)
      goto LABEL_17;
  }
  else if ((SHIBYTE(v41) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(__dst);
LABEL_17:
  v13 = (const void *)*MEMORY[0x24BE05048];
  v14 = strlen((const char *)*MEMORY[0x24BE05048]);
  if (v14 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_61;
  v15 = v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    v40 = v15;
    v41 = v18 | 0x8000000000000000;
    __dst = v16;
    goto LABEL_24;
  }
  HIBYTE(v41) = v14;
  v16 = (void **)&__dst;
  if (v14)
LABEL_24:
    memmove(v16, v13, v15);
  *((_BYTE *)v16 + v15) = 0;
  memset(&__p, 0, sizeof(__p));
  if (prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
  {
    LODWORD(object) = -1431655766;
    if (util::convert<int>(&__p, &object, 0))
      v11 = (int)object;
    else
      v11 = -1431655766;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v41) & 0x80000000) == 0)
    {
LABEL_31:
      v19 = (uint64_t *)MEMORY[0x24BDFC8D0];
      if (v12 != 4)
        goto LABEL_51;
      goto LABEL_37;
    }
  }
  else if ((SHIBYTE(v41) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(__dst);
  v19 = (uint64_t *)MEMORY[0x24BDFC8D0];
  if (v12 != 4)
  {
LABEL_51:
    v26 = (void **)xpc_null_create();
    v27 = *v19;
    object = 0;
    __dst = v26;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
    TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)9, v27, 0x1388u, 0, (xpc_object_t *)&__dst, (NSObject **)&object, (void **)&__p.__r_.__value_.__l.__data_);
    xpc_release(__dst);
    goto LABEL_52;
  }
LABEL_37:
  if (v11 != 1)
    goto LABEL_51;
  v20 = *(NSObject **)(v3 + 88);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_24B855000, v20, OS_LOG_TYPE_DEFAULT, "#I The other traces will handle exit low power first, then the Cellular Logging should be resumed.", (uint8_t *)&__p, 2u);
  }
  v21 = xpc_null_create();
  v37 = 0;
  object = v21;
  __p.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
  __p.__r_.__value_.__l.__size_ = 1174405120;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZZN12TraceManager4wakeEN8dispatch13group_sessionEENK3__0clEv_block_invoke;
  v34 = &__block_descriptor_tmp_106;
  v35 = v3;
  v22 = v2[1];
  group = v22;
  if (v22)
  {
    dispatch_retain(v22);
    dispatch_group_enter(v22);
  }
  v23 = (void **)_Block_copy(&__p);
  v24 = *v19;
  v25 = *(NSObject **)(v3 + 136);
  if (v25)
    dispatch_retain(*(dispatch_object_t *)(v3 + 136));
  __dst = v23;
  v40 = (size_t)v25;
  TraceManager::runOnHelper_sync((_QWORD *)v3, (const char *)9, v24, 0x1388u, 0, &object, &v37, (void **)&__dst);
  if (v25)
    dispatch_release(v25);
  if (v23)
    _Block_release(v23);
  xpc_release(object);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
LABEL_52:
  v28 = v2[1];
  if (v28)
  {
    dispatch_group_leave(v28);
    v29 = v2[1];
    if (v29)
      dispatch_release(v29);
  }
  operator delete(v2);
  v30 = (std::__shared_weak_count *)a1[2];
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  operator delete(a1);
}

void sub_24B9448B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, dispatch_group_t group, uint64_t a18, uint64_t a19, xpc_object_t object,xpc_object_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  _QWORD *v26;
  _QWORD *v27;
  const void *v28;
  NSObject *v29;
  NSObject *v31;
  NSObject *v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;

  if (v29)
    dispatch_release(v29);
  if (v28)
    _Block_release(v28);
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  xpc_release(object);
  v31 = v27[1];
  if (v31)
  {
    dispatch_group_leave(v31);
    v32 = v27[1];
    if (v32)
      dispatch_release(v32);
  }
  operator delete(v27);
  v33 = (std::__shared_weak_count *)v26[2];
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void ___ZZN12TraceManager4wakeEN8dispatch13group_sessionEENK3__0clEv_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  xpc_object_t v2;
  uint64_t v3;
  void *v4[2];
  NSObject *v5;
  xpc_object_t object;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = xpc_null_create();
  v3 = *MEMORY[0x24BDFC928];
  v5 = 0;
  object = v2;
  v4[0] = 0;
  v4[1] = 0;
  TraceManager::runOnHelper_sync(v1, (const char *)0xA, v3, 0x1388u, 1, &object, &v5, v4);
  xpc_release(object);
}

void sub_24B944A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t __cxx_global_var_init_72()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<CommandDriverFactory>::~PthreadMutexGuardPolicy, &ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance, &dword_24B855000);
  }
  return result;
}

_QWORD *Capabilities::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  void *v3;
  _QWORD *result;

  v3 = operator new(1uLL);
  *a1 = v3;
  result = operator new(0x20uLL);
  *result = off_251CC0D50;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_24B944AC4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t Capabilities::isCMHandDetectionSupported(Capabilities *this)
{
  capabilities::abs::supportsCMHandDetection(this);
  return objc_msgSend(MEMORY[0x24BDC13A0], "isCallHandednessAvailable");
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B956307)
    return a1 + 24;
  if (((v3 & 0x800000024B956307 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B956307))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B956307 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

const char *asString(_DWORD *a1)
{
  const char *v1;

  v1 = "Unknown";
  if (*a1 == 1)
    v1 = "PoweredOn";
  if (*a1)
    return v1;
  else
    return "LowPower";
}

const char *asString(int *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "Unknown";
  else
    return off_251CC0D90[v1];
}

void SystemState::SystemState(SystemState *this)
{
  *(_QWORD *)this = 0x200000001;
  *((_DWORD *)this + 2) = -536870144;
}

{
  *(_QWORD *)this = 0x200000001;
  *((_DWORD *)this + 2) = -536870144;
}

uint64_t SystemState::acceptSystemNotification(SystemState *this, int a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = 0;
  HIDWORD(v3) = a2;
  LODWORD(v3) = a2 + 536870288;
  switch((v3 >> 4))
  {
    case 0u:
      if (*(_DWORD *)this != 1)
        return 0;
      *((_DWORD *)this + 1) = 0;
      goto LABEL_17;
    case 1u:
      if (*(_DWORD *)this != 1)
        return 0;
      if (*((_DWORD *)this + 1))
        *((_DWORD *)this + 1) = 1;
      *(_DWORD *)this = 0;
      goto LABEL_17;
    case 2u:
      if (!*((_DWORD *)this + 1))
        goto LABEL_12;
      return 0;
    case 9u:
      if (*(_DWORD *)this || *((_DWORD *)this + 1) != 2)
        return 0;
LABEL_12:
      *(_QWORD *)this = 0x200000001;
      goto LABEL_17;
    case 0xBu:
      if (*(_DWORD *)this || *((_DWORD *)this + 1) == 2)
        return 0;
      *((_DWORD *)this + 1) = 2;
LABEL_17:
      *((_DWORD *)this + 2) = a2;
      return 1;
    default:
      return v2;
  }
}

uint64_t SystemState::getSystemNotification(SystemState *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t SystemState::getPowerState(SystemState *this)
{
  return *(unsigned int *)this;
}

uint64_t SystemState::getSleepState(SystemState *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t __cxx_global_var_init_12()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::power::assertion,ctu::power::assertion,ctu::PthreadMutexGuardPolicy<ctu::power::assertion>>::sInstance, &dword_24B855000);
  }
  return result;
}

uint64_t config::hw::watch(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v13;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 144))(v2);
  v10 = result;
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v10;
    }
  }
  return result;
}

void sub_24B944EA8(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B944EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t config::hw::iPad(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v13;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 136))(v2);
  v10 = result;
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v10;
    }
  }
  return result;
}

void sub_24B945028(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void config::hw::product(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v11;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_24B9451B0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B9451CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void config::hw::deviceMaterial(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v11;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 104))(v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_24B945338(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void config::hw::getBootArgs(std::string *a1@<X8>)
{
  ctu::Gestalt *v3;
  uint64_t v4;
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t **v16;
  _QWORD *v17;
  const void *v18;
  const void *v19;
  int v20;
  const void *v21;
  unint64_t v22;
  size_t v23;
  int v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  __int128 v29;
  void *__p[2];
  uint64_t v31;
  _QWORD v32[5];

  memset(v32, 170, 24);
  v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v4 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v3);
    v5 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v5;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v4 = off_2579B8870;
  }
  v9 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  v32[3] = v4;
  v32[4] = *(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v10 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)v4 + 112))(v32, v4);
  if (v9)
  {
    v12 = (unint64_t *)&v9->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  HIBYTE(v31) = 9;
  strcpy((char *)__p, "boot-args");
  v14 = (uint64_t *)v32[1];
  if (v32[1])
  {
    while (1)
    {
      v16 = (uint64_t **)v14;
      v19 = (const void *)v14[4];
      v17 = v14 + 4;
      v18 = v19;
      v20 = *((char *)v17 + 23);
      if (v20 >= 0)
        v21 = v17;
      else
        v21 = v18;
      if (v20 >= 0)
        v22 = *((unsigned __int8 *)v17 + 23);
      else
        v22 = v17[1];
      if (v22 >= 9)
        v23 = 9;
      else
        v23 = v22;
      v24 = memcmp(__p, v21, v23);
      if (v24)
      {
        if (v24 < 0)
          goto LABEL_18;
LABEL_32:
        v25 = memcmp(v21, __p, v23);
        if (v25)
        {
          if ((v25 & 0x80000000) == 0)
            goto LABEL_43;
        }
        else if (v22 >= 9)
        {
LABEL_43:
          v26 = (char *)v16;
          if (*((char *)v16 + 79) < 0)
            goto LABEL_44;
LABEL_42:
          v29 = *(_OWORD *)(v26 + 56);
          a1->__r_.__value_.__r.__words[2] = *((_QWORD *)v26 + 9);
          *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v29;
          goto LABEL_45;
        }
        v14 = v16[1];
        if (!v14)
        {
          v15 = v16 + 1;
          goto LABEL_39;
        }
      }
      else
      {
        if (v22 <= 9)
          goto LABEL_32;
LABEL_18:
        v14 = *v16;
        v15 = v16;
        if (!*v16)
          goto LABEL_39;
      }
    }
  }
  v15 = (uint64_t **)&v32[1];
  v16 = (uint64_t **)&v32[1];
LABEL_39:
  v26 = (char *)operator new(0x50uLL);
  *((_OWORD *)v26 + 2) = *(_OWORD *)__p;
  v27 = v31;
  __p[1] = 0;
  v31 = 0;
  __p[0] = 0;
  *((_QWORD *)v26 + 6) = v27;
  *((_QWORD *)v26 + 7) = 0;
  *((_QWORD *)v26 + 8) = 0;
  *((_QWORD *)v26 + 9) = 0;
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  *((_QWORD *)v26 + 2) = v16;
  *v15 = (uint64_t *)v26;
  v28 = (uint64_t *)v26;
  if (*(_QWORD *)v32[0])
  {
    v32[0] = *(_QWORD *)v32[0];
    v28 = *v15;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v32[1], v28);
  ++v32[2];
  if ((v26[79] & 0x80000000) == 0)
    goto LABEL_42;
LABEL_44:
  std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)v26 + 7), *((_QWORD *)v26 + 8));
LABEL_45:
  if (SHIBYTE(v31) < 0)
    operator delete(__p[0]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v32[1]);
}

void sub_24B945638(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B94566C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
{
  if (a14 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a16);
  _Unwind_Resume(a1);
}

void config::hw::regionCode(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v11;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 72))(v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_24B9457E4(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void config::hw::regionInfo(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v11;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 64))(v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_24B94596C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t config::build::carrier(config::build *this)
{
  uint64_t result;

  result = TelephonyUtilIsCarrierBuild();
  if ((_DWORD)result)
    return TelephonyUtilIsInternalBuild() ^ 1;
  return result;
}

uint64_t config::build::internal_or_carrier(config::build *this)
{
  if ((TelephonyUtilIsInternalBuild() & 1) != 0)
    return 1;
  else
    return TelephonyUtilIsCarrierBuild();
}

void config::build::version(config::build *this)
{
  ctu::Gestalt *v1;
  void (***v2)(_QWORD);
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = (void (***)(_QWORD))off_2579B8870;
  if (!off_2579B8870)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
    off_2579B8870 = v11;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = (void (***)(_QWORD))off_2579B8870;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8870 + 1);
  if (*(&off_2579B8870 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8870 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (**v2)(v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_24B945B3C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B945B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
        goto LABEL_4;
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
LABEL_4:
      operator delete((void *)a1);
      return;
    }
    operator delete(*(void **)(a1 + 32));
    operator delete((void *)a1);
  }
}

uint64_t __cxx_global_var_init_13()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B855000);
  }
  return result;
}

_QWORD *Service::Service(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = off_251CC0DB8;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

void Service::~Service(Service *this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  std::__shared_weak_count *v5;

  *(_QWORD *)this = off_251CC0DB8;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    v3 = *((_QWORD *)this + 4);
    v4 = (void *)*((_QWORD *)this + 3);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 1) < 0)
          operator delete(*(void **)(v3 - 24));
        v3 -= 24;
      }
      while (v3 != v2);
      v4 = (void *)*((_QWORD *)this + 3);
    }
    *((_QWORD *)this + 4) = v2;
    operator delete(v4);
  }
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

std::__shared_weak_count *Service::getServiceManager@<X0>(Service *this@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count *result;

  *a2 = 0;
  a2[1] = 0;
  result = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (result)
  {
    result = std::__shared_weak_count::lock(result);
    a2[1] = result;
    if (result)
      *a2 = *((_QWORD *)this + 1);
  }
  return result;
}

uint64_t Service::isServerDown(Service *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v2)
    return 1;
  v3 = std::__shared_weak_count::lock(v2);
  if (!v3)
    return 1;
  v4 = v3;
  v5 = *((_QWORD *)this + 1);
  if (v5)
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 80))(v5);
  else
    v6 = 1;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (v9)
    return v6;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return v6;
}

void sub_24B945DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void Service::registerCommandHandler(uint64_t a1, uint64_t a2, const void **a3)
{
  unint64_t v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  void *v11;
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15[3];

  v6 = *(_QWORD *)(a1 + 32);
  if (v6 >= *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(a1 + 32) = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)(a1 + 24), a2);
    v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8)
      return;
  }
  else
  {
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(a1 + 32), *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    }
    else
    {
      v7 = *(_OWORD *)a2;
      *(_QWORD *)(v6 + 16) = *(_QWORD *)(a2 + 16);
      *(_OWORD *)v6 = v7;
    }
    *(_QWORD *)(a1 + 32) = v6 + 24;
    *(_QWORD *)(a1 + 32) = v6 + 24;
    v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8)
      return;
  }
  v9 = std::__shared_weak_count::lock(v8);
  v15[2] = v9;
  if (v9)
  {
    v10 = v9;
    v11 = *(void **)(a1 + 8);
    v15[1] = v11;
    if (v11)
    {
      if (*a3)
        v12 = _Block_copy(*a3);
      else
        v12 = 0;
      v15[0] = v12;
      ServiceManager::registerCommandHandler((uint64_t)v11, a2, v15);
      if (v12)
        _Block_release(v12);
    }
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_24B945F2C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = v1;
  _Unwind_Resume(a1);
}

void sub_24B945F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  const void *v11;

  if (v11)
    _Block_release(v11);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void ServiceManager::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4;
  void *v5;
  void *aBlock;

  v4 = *(_QWORD *)(a1 + 168);
  v5 = *a3;
  if (*a3)
    v5 = _Block_copy(v5);
  aBlock = v5;
  ServiceCtrl::registerCommandHandler(v4, a2, &aBlock);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_24B945FB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void Service::runCommand(uint64_t a1, uint64_t a2, xpc_object_t *a3, const void **a4)
{
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  void *v11;
  xpc_object_t v12;
  const void *v13;
  void *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  void *v18[3];

  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    v9 = std::__shared_weak_count::lock(v5);
    v18[2] = v9;
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(a1 + 8);
      v18[1] = v11;
      if (!v11)
      {
LABEL_12:
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        return;
      }
      v12 = *a3;
      v18[0] = v12;
      if (v12)
      {
        xpc_retain(v12);
        v13 = *a4;
        if (*a4)
        {
LABEL_6:
          v14 = _Block_copy(v13);
LABEL_9:
          v17 = v14;
          ServiceManager::runCommand((uint64_t)v11, a2, v18, &v17);
          if (v14)
            _Block_release(v14);
          xpc_release(v12);
          v18[0] = 0;
          goto LABEL_12;
        }
      }
      else
      {
        v12 = xpc_null_create();
        v18[0] = v12;
        v13 = *a4;
        if (*a4)
          goto LABEL_6;
      }
      v14 = 0;
      goto LABEL_9;
    }
  }
}

void sub_24B9460F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;
  const void *v12;

  if (v12)
    _Block_release(v12);
  xpc_release(v11);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void ServiceManager::runCommand(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *aBlock;
  xpc_object_t object;

  v6 = *(_QWORD *)(a1 + 168);
  v7 = *a3;
  object = v7;
  if (!v7)
  {
    object = xpc_null_create();
    v8 = *a4;
    if (!*a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  xpc_retain(v7);
  v8 = *a4;
  if (*a4)
LABEL_5:
    v8 = _Block_copy(v8);
LABEL_6:
  aBlock = v8;
  ServiceCtrl::handleCommand(v6, a2, &object, &aBlock);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
}

void sub_24B9461C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, xpc_object_t object)
{
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void Service::broadcastEvent(uint64_t a1, uint64_t a2, const void **a3, const void **a4)
{
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  const void *v18;
  std::string v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    v9 = std::__shared_weak_count::lock(v5);
    v21 = v9;
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 8);
      v20 = v11;
      if (!v11)
      {
LABEL_20:
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        return;
      }
      if (*(char *)(a2 + 23) < 0)
        std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      else
        v19 = *(std::string *)a2;
      v12 = *a3;
      v18 = v12;
      if (v12)
        CFRetain(v12);
      if (*a4)
      {
        v13 = _Block_copy(*a4);
        v17 = v13;
        v14 = *(_QWORD *)(v11 + 184);
        if (!v14)
          goto LABEL_14;
      }
      else
      {
        v13 = 0;
        v17 = 0;
        v14 = *(_QWORD *)(v11 + 184);
        if (!v14)
        {
LABEL_14:
          if (v13)
            _Block_release(v13);
          if (v12)
            CFRelease(v12);
          if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v19.__r_.__value_.__l.__data_);
          goto LABEL_20;
        }
      }
      dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v14, (uint64_t)&v19, &v18, &v17);
      goto LABEL_14;
    }
  }
}

void sub_24B946340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B94635C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  const void *v18;

  if (v18)
    _Block_release(v18);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  if (a16 < 0)
    operator delete(__p);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void ServiceManager::broadcastEvent(uint64_t a1, uint64_t a2, const void **a3, void **a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 184);
  if (v4)
    dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v4, a2, a3, a4);
}

void Service::broadcastEvent(uint64_t a1, uint64_t a2, void **a3, const void **a4)
{
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  void *v12;
  const object *v13;
  CFTypeRef v14;
  CFTypeID v15;
  CFTypeRef v16;
  void *v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *v21;
  const void *v22;
  std::string v23;
  xpc_object_t object;
  CFTypeRef cf;
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;

  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    v9 = std::__shared_weak_count::lock(v5);
    v28 = v9;
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 8);
      v27 = v11;
      if (!v11)
        goto LABEL_32;
      v26 = 0xAAAAAAAAAAAAAAAALL;
      v12 = *a3;
      object = v12;
      if (v12)
        xpc_retain(v12);
      else
        object = xpc_null_create();
      xpc::bridge((xpc *)&object, v13);
      v14 = cf;
      if (cf && (v15 = CFGetTypeID(cf), v15 == CFDictionaryGetTypeID()))
      {
        v26 = (unint64_t)v14;
        CFRetain(v14);
        v16 = cf;
        if (!cf)
        {
LABEL_13:
          xpc_release(object);
          if (*(char *)(a2 + 23) < 0)
            std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
          else
            v23 = *(std::string *)a2;
          v22 = v14;
          if (v14)
            CFRetain(v14);
          if (*a4)
          {
            v17 = _Block_copy(*a4);
            v21 = v17;
            v18 = *(_QWORD *)(v11 + 184);
            if (!v18)
            {
LABEL_23:
              if (v17)
                _Block_release(v17);
              if (v14)
                CFRelease(v14);
              if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v23.__r_.__value_.__l.__data_);
                if (!v14)
                  goto LABEL_32;
              }
              else if (!v14)
              {
LABEL_32:
                p_shared_owners = (unint64_t *)&v10->__shared_owners_;
                do
                  v20 = __ldaxr(p_shared_owners);
                while (__stlxr(v20 - 1, p_shared_owners));
                if (!v20)
                {
                  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
                  std::__shared_weak_count::__release_weak(v10);
                }
                return;
              }
              CFRelease(v14);
              goto LABEL_32;
            }
          }
          else
          {
            v17 = 0;
            v21 = 0;
            v18 = *(_QWORD *)(v11 + 184);
            if (!v18)
              goto LABEL_23;
          }
          dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v18, (uint64_t)&v23, &v22, &v21);
          goto LABEL_23;
        }
      }
      else
      {
        v14 = 0;
        v26 = 0;
        v16 = cf;
        if (!cf)
          goto LABEL_13;
      }
      CFRelease(v16);
      goto LABEL_13;
    }
  }
}

void sub_24B946598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, const void *a19, __int16 a20,char a21,char a22)
{
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a19);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void sub_24B946600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, char a17)
{
  xpc_release(object);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void Service::getRegisteredCommands(Service *this@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *((_QWORD *)this + 3), *((_QWORD *)this + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 3));
}

void ServiceManager::~ServiceManager(ServiceManager *this)
{
  const void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  std::__shared_weak_count *v23;

  *(_QWORD *)this = off_251CC0E28;
  v2 = (const void *)*((_QWORD *)this + 23);
  if (v2)
    _Block_release(v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = *((_QWORD *)this + 18);
  if (v6)
  {
    v7 = *((_QWORD *)this + 19);
    v8 = (void *)*((_QWORD *)this + 18);
    if (v7 != v6)
    {
      do
      {
        v9 = *(std::__shared_weak_count **)(v7 - 8);
        if (v9)
        {
          v10 = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldaxr(v10);
          while (__stlxr(v11 - 1, v10));
          if (!v11)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
        v7 -= 16;
      }
      while (v7 != v6);
      v8 = (void *)*((_QWORD *)this + 18);
    }
    *((_QWORD *)this + 19) = v6;
    operator delete(v8);
  }
  v12 = *((_QWORD *)this + 15);
  if (v12)
  {
    v13 = *((_QWORD *)this + 16);
    v14 = (void *)*((_QWORD *)this + 15);
    if (v13 != v12)
    {
      do
      {
        v15 = *(std::__shared_weak_count **)(v13 - 8);
        if (v15)
        {
          v16 = (unint64_t *)&v15->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        v13 -= 16;
      }
      while (v13 != v12);
      v14 = (void *)*((_QWORD *)this + 15);
    }
    *((_QWORD *)this + 16) = v12;
    operator delete(v14);
  }
  v18 = (std::__shared_weak_count *)*((_QWORD *)this + 14);
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  *(_QWORD *)this = off_251CC0F60;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v21 = *((_QWORD *)this + 12);
  if (v21)
    dispatch_release(v21);
  v22 = *((_QWORD *)this + 11);
  if (v22)
    dispatch_release(v22);
  v23 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
}

void ServiceManager::ServiceManager(ServiceManager *this, const char *a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  _BYTE v13[16];
  dispatch_object_t object[5];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v13, "com.apple.telephony.abm", a2);
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  object[0] = (dispatch_object_t)MEMORY[0x24BDAC760];
  object[1] = (dispatch_object_t)0x40000000;
  object[2] = (dispatch_object_t)___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  object[3] = (dispatch_object_t)&__block_descriptor_tmp_13_5;
  object[4] = (dispatch_object_t)&GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v5 = *(_QWORD *)algn_2579B8AE8;
    v11 = GetABMLogServer(void)::sLogServer;
    v12 = *(std::__shared_weak_count **)algn_2579B8AE8;
    if (!*(_QWORD *)algn_2579B8AE8)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, object);
    v5 = *(_QWORD *)algn_2579B8AE8;
    v11 = GetABMLogServer(void)::sLogServer;
    v12 = *(std::__shared_weak_count **)algn_2579B8AE8;
    if (!*(_QWORD *)algn_2579B8AE8)
      goto LABEL_6;
  }
  v6 = (unint64_t *)(v5 + 8);
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
LABEL_6:
  object[0] = 0;
  ctu::SharedSynchronizable<NetworkStatsInterface>::SharedSynchronizable((_QWORD *)this + 9, a2, QOS_CLASS_DEFAULT, object);
  if (object[0])
    dispatch_release(object[0]);
  ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(this, (uint64_t)v13, &v11);
  *(_QWORD *)this = off_251CC11F8;
  v8 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v13);
  *(_QWORD *)this = off_251CC0E28;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((_QWORD *)this + 23) = 0;
  *((_BYTE *)this + 192) = 1;
}

void sub_24B946A00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  _Unwind_Resume(a1);
}

void sub_24B946A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a12);
  _Unwind_Resume(a1);
}

void ServiceManager::init(_QWORD *a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  const void *(__cdecl *v5)(const std::__shared_weak_count *__hidden, const std::type_info *);
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count_vtbl *v12;
  std::__shared_weak_count_vtbl *v13;
  unint64_t v14;
  unsigned __int8 v15;
  void (__cdecl *v16)(std::__shared_count *__hidden);
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *initially_inactive;
  NSObject *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  std::__shared_weak_count *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  _QWORD aBlock[5];
  void *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  __int128 v66;
  _BYTE v67[16];
  uint64_t block;
  uint64_t v69;
  void (*v70)(uint64_t);
  void *v71;
  __int128 *v72;
  uint64_t v73;
  std::__shared_weak_count *v74;

  v3 = (std::__shared_weak_count *)a1[10];
  if (!v3
    || (v5 = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))a1[9],
        (v6 = std::__shared_weak_count::lock(v3)) == 0))
  {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v12 = (std::__shared_weak_count_vtbl *)operator new(0x90uLL);
  v13 = v12;
  do
    v14 = __ldxr(p_shared_weak_owners);
  while (__stxr(v14 + 1, p_shared_weak_owners));
  v12->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_251CC0FF0;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v67, "com.apple.telephony.abm", "svc.ctrl");
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  block = MEMORY[0x24BDAC760];
  v69 = 0x40000000;
  v70 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v71 = &__block_descriptor_tmp_13_5;
  v72 = &GetABMLogServer(void)::sLogServer;
  v61 = a2;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v17 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v16 = (void (__cdecl *)(std::__shared_count *__hidden))GetABMLogServer(void)::sLogServer;
    v66 = GetABMLogServer(void)::sLogServer;
    if (*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v16 = (void (__cdecl *)(std::__shared_count *__hidden))GetABMLogServer(void)::sLogServer;
    v66 = GetABMLogServer(void)::sLogServer;
    if (*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
    {
LABEL_14:
      v18 = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v21 = dispatch_queue_create_with_target_V2("svc.ctrl", initially_inactive, 0);
  dispatch_set_qos_class_floor(v21, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v21);
  v13[1].__on_zero_shared_weak = 0;
  v13[2].~__shared_weak_count = 0;
  v13[2].~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v21;
  if (v21)
  {
    dispatch_retain(v21);
    v13[2].__on_zero_shared = 0;
    dispatch_release(v21);
  }
  else
  {
    v13[2].__on_zero_shared = 0;
  }
  v13->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_251CC1100;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&block);
  v13->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_251CB85F0;
  v13[1].__on_zero_shared = v16;
  v13[1].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v17;
  if (v17)
  {
    v22 = (unint64_t *)&v17->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v73);
    v13->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_251CC10C0;
    do
      v24 = __ldaxr(v22);
    while (__stlxr(v24 - 1, v22));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  else
  {
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v73);
    v13->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_251CC10C0;
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v67);
  v13->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_251CC0FF0;
  v13[2].__get_deleter = v5;
  v13[2].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  do
    v25 = __ldxr(p_shared_weak_owners);
  while (__stxr(v25 + 1, p_shared_weak_owners));
  v13[3].__on_zero_shared = 0;
  v13[3].~__shared_weak_count_0 = 0;
  v13[3].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&v13[3].~__shared_weak_count_0;
  v64 = (unint64_t)v13;
  v26 = (std::__shared_weak_count *)operator new(0x20uLL);
  v26->__shared_owners_ = 0;
  v27 = (unint64_t *)&v26->__shared_owners_;
  v26->__vftable = (std::__shared_weak_count_vtbl *)off_251CC0FA0;
  v26->__shared_weak_owners_ = 0;
  v26[1].__vftable = v13;
  v65 = v26;
  v28 = (std::__shared_weak_count *)v13[2].~__shared_weak_count;
  if (v28)
  {
    if (v28->__shared_owners_ != -1)
      goto LABEL_41;
    do
      v29 = __ldxr(v27);
    while (__stxr(v29 + 1, v27));
    v30 = (unint64_t *)&v26->__shared_weak_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
    v13[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
    v13[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v26;
    std::__shared_weak_count::__release_weak(v28);
  }
  else
  {
    do
      v32 = __ldxr(v27);
    while (__stxr(v32 + 1, v27));
    v33 = (unint64_t *)&v26->__shared_weak_owners_;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    v13[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
    v13[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v26;
  }
  do
    v35 = __ldaxr(v27);
  while (__stlxr(v35 - 1, v27));
  if (v35)
  {
LABEL_41:
    v36 = (_QWORD *)v64;
    if (!*(_QWORD *)(v64 + 56))
      goto LABEL_55;
    goto LABEL_42;
  }
  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
  std::__shared_weak_count::__release_weak(v26);
  v36 = (_QWORD *)v64;
  if (!*(_QWORD *)(v64 + 56))
    goto LABEL_55;
LABEL_42:
  v37 = (std::__shared_weak_count *)v36[10];
  if (!v37 || (v38 = v36[9], (v39 = std::__shared_weak_count::lock(v37)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v40 = v39;
  block = v38;
  v69 = (uint64_t)v39;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v36 + 1));
  v73 = v38;
  v74 = v40;
  block = 0;
  v69 = 0;
  ctu::TrackedLogger::registerLoggerToServer();
  v41 = v74;
  if (v74)
  {
    v42 = (unint64_t *)&v74->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v44 = (std::__shared_weak_count *)v69;
  if (v69)
  {
    v45 = (unint64_t *)(v69 + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v36 = (_QWORD *)v64;
LABEL_55:
  std::__shared_weak_count::__release_weak(v7);
  v47 = v65;
  v64 = 0;
  v65 = 0;
  v48 = (std::__shared_weak_count *)a1[22];
  a1[21] = v36;
  a1[22] = v47;
  if (v48)
  {
    v49 = (unint64_t *)&v48->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  if (!v65)
    goto LABEL_64;
  v51 = &v65->__shared_owners_;
  do
    v52 = __ldaxr((unint64_t *)v51);
  while (__stlxr(v52 - 1, (unint64_t *)v51));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
    std::__shared_weak_count::__release_weak(v65);
    std::__shared_weak_count::__release_weak(v7);
    v53 = *v61;
    if (!*v61)
      return;
  }
  else
  {
LABEL_64:
    std::__shared_weak_count::__release_weak(v7);
    v53 = *v61;
    if (!*v61)
      return;
  }
  v54 = v61[1];
  if (v54)
  {
    v55 = (unint64_t *)(v54 + 8);
    do
      v56 = __ldxr(v55);
    while (__stxr(v56 + 1, v55));
  }
  v57 = (std::__shared_weak_count *)a1[14];
  a1[13] = v53;
  a1[14] = v54;
  if (v57)
  {
    v58 = (unint64_t *)&v57->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v60 = a1[13];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_23;
  aBlock[4] = a1;
  v63 = _Block_copy(aBlock);
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v60 + 16))(v60, &v63);
  if (v63)
    _Block_release(v63);
}

void sub_24B947068(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *aBlock)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void sub_24B947080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100](v9 - 120);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  std::shared_ptr<data::TransportService::State>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::__shared_weak_count::__release_weak(v8);
  std::__shared_weak_count::__release_weak(v8);
  JUMPOUT(0x24B947140);
}

void sub_24B9470A4(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl*)#1}::operator() const(ServiceCtrl*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_24B9470C4()
{
  __cxa_end_catch();
  JUMPOUT(0x24B947130);
}

void sub_24B9470D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  std::__shared_weak_count *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  va_list va1;
  uint64_t v19;
  va_list va2;

  va_start(va2, a10);
  va_start(va1, a10);
  va_start(va, a10);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v17 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v13 - 120));
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v12);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  std::__shared_weak_count::__release_weak(v10);
  operator delete(v11);
  JUMPOUT(0x24B947138);
}

void sub_24B94711C()
{
  JUMPOUT(0x24B947138);
}

void ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke(uint64_t a1, int a2, NSObject **a3)
{
  _QWORD *v3;
  NSObject *v4;
  dispatch_object_t v5;
  dispatch_object_t v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (a2 == 1)
  {
    v4 = *a3;
    v5 = v4;
    if (v4)
    {
      dispatch_retain(v4);
      dispatch_group_enter(v4);
      ServiceManager::wake(v3, &v5);
      goto LABEL_7;
    }
    ServiceManager::wake(v3, &v5);
  }
  else if (!a2)
  {
    v4 = *a3;
    v6 = v4;
    if (v4)
    {
      dispatch_retain(v4);
      dispatch_group_enter(v4);
      ServiceManager::sleep(v3, &v6);
LABEL_7:
      dispatch_group_leave(v4);
      dispatch_release(v4);
      return;
    }
    ServiceManager::sleep(v3, &v6);
  }
}

void ServiceManager::sleep(_QWORD *a1, dispatch_object_t *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (v5 = a1[9], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[11];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::wake(_QWORD *a1, dispatch_object_t *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (v5 = a1[9], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[11];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::createPowerAssertion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  std::string __p;

  v4 = *(_QWORD *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  (*(void (**)(uint64_t, std::string *, uint64_t))(*(_QWORD *)v4 + 24))(v4, &__p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B947498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ServiceManager::releasePowerAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v2 + 32))(v2, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24B947538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ServiceCtrl::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  std::string __p;
  void *aBlock;
  _QWORD block[6];

  v8 = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v5 = *a3;
    if (!*a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  __p = *(std::string *)a2;
  v5 = *a3;
  if (*a3)
LABEL_5:
    v5 = _Block_copy(v5);
LABEL_6:
  aBlock = v5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke;
  block[3] = &__block_descriptor_tmp_7_4;
  block[4] = a1 + 72;
  block[5] = &v8;
  v6 = *(NSObject **)(a1 + 88);
  if (!*(_QWORD *)(a1 + 96))
  {
    dispatch_sync(v6, block);
    v7 = aBlock;
    if (!aBlock)
      goto LABEL_11;
    goto LABEL_10;
  }
  dispatch_async_and_wait(v6, block);
  v7 = aBlock;
  if (aBlock)
LABEL_10:
    _Block_release(v7);
LABEL_11:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void ServiceCtrl::handleCommand(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  std::string __p;
  xpc_object_t object;
  void *aBlock;

  v9 = a1;
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    __p = *(std::string *)a2;
    v7 = *a3;
    object = v7;
    if (v7)
      goto LABEL_3;
LABEL_6:
    object = xpc_null_create();
    v8 = *a4;
    if (!*a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  v7 = *a3;
  object = v7;
  if (!v7)
    goto LABEL_6;
LABEL_3:
  xpc_retain(v7);
  v8 = *a4;
  if (*a4)
LABEL_7:
    v8 = _Block_copy(v8);
LABEL_8:
  aBlock = v8;
  ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>((uint64_t *)(a1 + 72), (uint64_t)&v9);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void ServiceManager::registerEventDispatcher(uint64_t a1, void **a2)
{
  void *v3;
  const void *v4;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  v4 = *(const void **)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v3;
  if (v4)
    _Block_release(v4);
}

void dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(uint64_t a1, uint64_t a2, const void **a3, void **a4)
{
  const void *v7;
  void *v8;
  void *aBlock;
  CFTypeRef cf;
  std::string v11;

  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v7 = *a3;
    cf = v7;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = *(std::string *)a2;
  v7 = *a3;
  cf = v7;
  if (v7)
LABEL_5:
    CFRetain(v7);
LABEL_6:
  v8 = *a4;
  if (*a4)
    v8 = _Block_copy(v8);
  aBlock = v8;
  (*(void (**)(uint64_t, std::string *, CFTypeRef *, void **))(a1 + 16))(a1, &v11, &cf, &aBlock);
  if (aBlock)
    _Block_release(aBlock);
  if (cf)
    CFRelease(cf);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

void sub_24B947888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (aBlock)
    _Block_release(aBlock);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a10);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t ServiceManager::isServerDown(ServiceManager *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)this + 192);
  return v1 & 1;
}

void ServiceManager::initializeGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  NSObject *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  _QWORD *v10;
  unint64_t *p_shared_owners;
  NSObject *v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;

  v4 = dispatch_group_create();
  v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (!v6 || (v7 = *((_QWORD *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v9 = v8;
  v10 = operator new(0x10uLL);
  *v10 = this;
  v10[1] = v5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v12 = *((_QWORD *)this + 11);
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v14 = operator new(0x18uLL);
  *v14 = v10;
  v14[1] = v7;
  v14[2] = v9;
  dispatch_async_f(v12, v14, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::shutdownGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  NSObject *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  _QWORD *v10;
  unint64_t *p_shared_owners;
  NSObject *v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;

  v4 = dispatch_group_create();
  v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (!v6 || (v7 = *((_QWORD *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v9 = v8;
  v10 = operator new(0x10uLL);
  *v10 = this;
  v10[1] = v5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v12 = *((_QWORD *)this + 11);
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v14 = operator new(0x18uLL);
  *v14 = v10;
  v14[1] = v7;
  v14[2] = v9;
  dispatch_async_f(v12, v14, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::initializeDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  NSObject *v4;
  uint64_t v5;
  dispatch_object_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  void *__p;
  __int128 v11;
  dispatch_object_t object;

  v4 = dispatch_group_create();
  *a2 = v4;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = *((_QWORD *)this + 13);
  __p = operator new(0x30uLL);
  v11 = xmmword_24B953EB0;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, _QWORD))(*(_QWORD *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  v6 = object;
  if (object)
    dispatch_retain(object);
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  v7 = object;
  v8 = *((_QWORD *)this + 11);
  v9 = operator new(0x18uLL);
  *v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object)
    dispatch_release(object);
}

void sub_24B947BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  NSObject *v19;

  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object)
    dispatch_release(object);
  if (v19)
    dispatch_release(v19);
  _Unwind_Resume(a1);
}

uint64_t ServiceManager::initializeDynamicServices(void)::$_0::~$_0(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;

  v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 16);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_release(v4);
  return a1;
}

void ServiceManager::shutdownDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  NSObject *v4;
  uint64_t v5;
  dispatch_object_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  void *__p;
  __int128 v11;
  dispatch_object_t object;

  v4 = dispatch_group_create();
  *a2 = v4;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = *((_QWORD *)this + 13);
  __p = operator new(0x30uLL);
  v11 = xmmword_24B953EB0;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, _QWORD))(*(_QWORD *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  v6 = object;
  if (object)
    dispatch_retain(object);
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  v7 = object;
  v8 = *((_QWORD *)this + 11);
  v9 = operator new(0x18uLL);
  *v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object)
    dispatch_release(object);
}

void sub_24B947D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  NSObject *v19;

  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object)
    dispatch_release(object);
  if (v19)
    dispatch_release(v19);
  _Unwind_Resume(a1);
}

_QWORD *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC0F60;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC0F60;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 88), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl*)#1}::operator() const(ServiceCtrl*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl*)#1}::operator() const(ServiceCtrl*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void ServiceCtrl::~ServiceCtrl(char **this)
{
  void *v1;

  ServiceCtrl::~ServiceCtrl(this);
  operator delete(v1);
}

{
  std::__shared_weak_count *v2;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  *this = (char *)off_251CC0FF0;
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(this[16]);
  v2 = (std::__shared_weak_count *)this[14];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  *this = (char *)off_251CC1100;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v3 = this[12];
  if (v3)
    dispatch_release(v3);
  v4 = this[11];
  if (v4)
    dispatch_release(v4);
  v5 = (std::__shared_weak_count *)this[10];
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 8;
  strcpy(a1, "svc.ctrl");
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC1100;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC1100;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

_QWORD *ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC1100;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_251CC1100;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(char *a1)
{
  const void *v2;

  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*((_QWORD *)a1 + 1));
    v2 = (const void *)*((_QWORD *)a1 + 7);
    if (v2)
      _Block_release(v2);
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  const void *v9;
  size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  const void *v13;
  const void *v14;
  int v15;
  const void *v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  _QWORD *v21;
  std::string *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  const void *v26;

  v1 = *(uint64_t **)(a1 + 40);
  v2 = *v1;
  v3 = (const void *)v1[4];
  if (v3)
  {
    v4 = _Block_copy(v3);
    v5 = v1 + 1;
    v7 = (_QWORD *)(v2 + 128);
    v6 = *(_QWORD **)(v2 + 128);
    if (v6)
    {
LABEL_3:
      v8 = *((char *)v1 + 31);
      if (v8 >= 0)
        v9 = v5;
      else
        v9 = (const void *)v1[1];
      if (v8 >= 0)
        v10 = *((unsigned __int8 *)v1 + 31);
      else
        v10 = v1[2];
      while (1)
      {
        v11 = v6;
        v14 = (const void *)v6[4];
        v12 = v6 + 4;
        v13 = v14;
        v15 = *((char *)v12 + 23);
        if (v15 >= 0)
          v16 = v12;
        else
          v16 = v13;
        if (v15 >= 0)
          v17 = *((unsigned __int8 *)v12 + 23);
        else
          v17 = v12[1];
        if (v17 >= v10)
          v18 = v10;
        else
          v18 = v17;
        v19 = memcmp(v9, v16, v18);
        if (v19)
        {
          if (v19 < 0)
            goto LABEL_9;
LABEL_23:
          v20 = memcmp(v16, v9, v18);
          if (v20)
          {
            if ((v20 & 0x80000000) == 0)
              goto LABEL_38;
          }
          else if (v17 >= v10)
          {
LABEL_38:
            v26 = (const void *)v11[7];
            v11[7] = v4;
            if (v26)
              goto LABEL_39;
            return;
          }
          v6 = (_QWORD *)v11[1];
          if (!v6)
          {
            v7 = v11 + 1;
            goto LABEL_31;
          }
        }
        else
        {
          if (v10 >= v17)
            goto LABEL_23;
LABEL_9:
          v6 = (_QWORD *)*v11;
          v7 = v11;
          if (!*v11)
            goto LABEL_31;
        }
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = v1 + 1;
    v7 = (_QWORD *)(v2 + 128);
    v6 = *(_QWORD **)(v2 + 128);
    if (v6)
      goto LABEL_3;
  }
  v11 = v7;
LABEL_31:
  v21 = operator new(0x40uLL);
  v22 = (std::string *)(v21 + 4);
  if (*((char *)v1 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)v1[1], v1[2]);
  }
  else
  {
    v23 = *(_OWORD *)v5;
    v21[6] = v5[2];
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
  }
  v21[7] = 0;
  *v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *v7 = v21;
  v24 = **(_QWORD **)(v2 + 120);
  v25 = v21;
  if (v24)
  {
    *(_QWORD *)(v2 + 120) = v24;
    v25 = (uint64_t *)*v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 128), v25);
  ++*(_QWORD *)(v2 + 136);
  v26 = (const void *)v21[7];
  v21[7] = v4;
  if (v26)
LABEL_39:
    _Block_release(v26);
}

void sub_24B9482DC(_Unwind_Exception *a1)
{
  const void *v1;
  void *v2;

  operator delete(v2);
  if (v1)
    _Block_release(v1);
  _Unwind_Resume(a1);
}

void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  NSObject *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;

  v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)v8 = *(_QWORD *)a2;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 24) = 0;
  *((_QWORD *)v8 + 3) = v9;
  *((_QWORD *)v8 + 4) = v10;
  v11 = xpc_null_create();
  *((_QWORD *)v8 + 5) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = 0;
  v12 = a1[2];
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  v15 = operator new(0x18uLL);
  *v15 = v8;
  v15[1] = v5;
  v15[2] = v7;
  dispatch_async_f(v12, v15, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceCtrl>::execute_wrapped<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>(ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  const void *v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  const void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  _QWORD v14[5];
  _QWORD *v15;
  _QWORD aBlock[4];
  void *v17;
  xpc_object_t object[5];
  void *v19;

  v2 = *a1;
  v3 = **a1;
  v4 = std::__tree<std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,xpc::dict>>>>::find<std::string>(v3 + 120, (const void **)*a1 + 1);
  v5 = (const void *)v2[5];
  if ((uint64_t *)(v3 + 128) == v4)
  {
    if (!v5)
      goto LABEL_12;
    v7 = xpc_null_create();
    v8 = v2[5];
    object[0] = v7;
    v9 = xpc_null_create();
    (*(void (**)(uint64_t, uint64_t, xpc_object_t *))(v8 + 16))(v8, 3760250882, object);
    xpc_release(object[0]);
    xpc_release(v9);
  }
  else if (v5)
  {
    object[0] = 0;
    object[1] = object;
    object[2] = (xpc_object_t)0x3002000000;
    object[3] = __Block_byref_object_copy__3;
    object[4] = __Block_byref_object_dispose__3;
    v19 = (void *)0xAAAAAAAAAAAAAAAALL;
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_10;
    aBlock[3] = &__block_descriptor_tmp_11_7;
    v17 = _Block_copy(v5);
    v19 = _Block_copy(aBlock);
    v14[0] = v6;
    v14[1] = 0x40000000;
    v14[2] = ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_12;
    v14[3] = &unk_251CC11C8;
    v14[4] = object;
    v15 = v14;
    dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(v4[7], (xpc_object_t)v2[4], (void **)&v15);
    _Block_object_dispose(object, 8);
    if (v19)
      _Block_release(v19);
    if (v17)
      _Block_release(v17);
  }
  else
  {
    object[0] = &__block_literal_global_6;
    dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(v4[7], (xpc_object_t)v2[4], object);
  }
  v10 = (const void *)v2[5];
  if (v10)
    _Block_release(v10);
LABEL_12:
  xpc_release((xpc_object_t)v2[4]);
  v2[4] = 0;
  if (*((char *)v2 + 31) < 0)
    operator delete((void *)v2[1]);
  operator delete(v2);
  v11 = (std::__shared_weak_count *)a1[2];
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  operator delete(a1);
}

void sub_24B948638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,xpc_object_t object,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *aBlock)
{
  _QWORD *v26;
  void *v27;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;

  xpc_release(object);
  xpc_release(v27);
  std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&a9);
  v29 = (std::__shared_weak_count *)v26[2];
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

void dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>::operator()<xpc::dict const&,void({block_pointer})(int,xpc::dict)>(uint64_t a1, xpc_object_t object, void **a3)
{
  void *v5;
  void *aBlock;
  xpc_object_t objecta;

  objecta = object;
  if (!object)
  {
    objecta = xpc_null_create();
    v5 = *a3;
    if (!*a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  xpc_retain(object);
  v5 = *a3;
  if (*a3)
LABEL_5:
    v5 = _Block_copy(v5);
LABEL_6:
  aBlock = v5;
  (*(void (**)(uint64_t, xpc_object_t *, void **))(a1 + 16))(a1, &objecta, &aBlock);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(objecta);
}

void sub_24B948790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *aBlock, xpc_object_t object)
{
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_10(uint64_t a1, unsigned int a2, void **a3)
{
  unsigned int v3;

  v3 = a2;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>((uint64_t *)(a1 + 32), &v3, a3);
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_12(uint64_t a1, unsigned int a2, void **a3)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  unsigned int v9;

  v9 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (uint64_t *)(v4 + 40);
  if (v6)
  {
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>(v5, &v9, a3);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(const void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;
    if (v8)
      _Block_release(v8);
  }
}

uint64_t *std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(const void **)(v2 + 40);
    if (v3)
      _Block_release(v3);
    xpc_release(*(xpc_object_t *)(v2 + 32));
    *(_QWORD *)(v2 + 32) = 0;
    if (*(char *)(v2 + 31) < 0)
      operator delete(*(void **)(v2 + 8));
    operator delete((void *)v2);
  }
  return a1;
}

_QWORD *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  _BYTE v10[16];

  *a1 = off_251CC0F60;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
  a1[1] = &unk_251CB85F0;
  a1[7] = *a3;
  v5 = a3[1];
  a1[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v9);
  return a1;
}

void sub_24B948984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC0F60;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_251CC0F60;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  _QWORD *v9;
  unint64_t *p_shared_owners;
  NSObject **v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  __int128 *p_buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  dispatch_time_t v26;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::string *v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  std::string *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  std::string *v40;
  std::string *v41;
  NSObject *v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  std::string *p_p;
  std::__shared_weak_count *v51;
  uint64_t *v52;
  uint64_t **v53;
  std::string __p;
  dispatch_group_t group;
  uint8_t v56[4];
  unint64_t v57;
  __int16 v58;
  std::string *v59;
  __int128 v60;
  unint64_t v61;
  __int128 buf;
  unint64_t v63;
  uint64_t v64;

  v1 = a1;
  v64 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = **a1;
  v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (uint64_t)(*(_QWORD *)(v3 + 152) - *(_QWORD *)(v3 + 144)) >> 4;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to sleep", (uint8_t *)&buf, 0xCu);
    }
    v52 = v2;
    v53 = v1;
    v7 = dispatch_group_create();
    v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    v11 = (NSObject **)&v8[1];
    v51 = v8;
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      v12 = *(_QWORD **)(v3 + 144);
      v13 = *(_QWORD **)(v3 + 152);
      if (v12 != v13)
        goto LABEL_12;
LABEL_33:
      v24 = *v11;
      v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 104))(v3);
      v26 = dispatch_time(0, 1000000000 * v25);
      if (dispatch_group_wait(v24, v26))
      {
        v60 = 0uLL;
        v61 = 0;
        shared_owners = (uint64_t *)v51[1].__shared_owners_;
        shared_weak_owners = (uint64_t *)v51[1].__shared_weak_owners_;
        if (shared_owners == shared_weak_owners)
        {
          v29 = 0;
        }
        else
        {
          do
          {
            v30 = (std::__shared_weak_count *)shared_owners[1];
            if (v30)
            {
              v31 = std::__shared_weak_count::lock(v30);
              if (v31)
              {
                v32 = v31;
                v33 = *shared_owners;
                if (*shared_owners)
                {
                  v34 = (_OWORD *)*((_QWORD *)&v60 + 1);
                  if (*((_QWORD *)&v60 + 1) >= v61)
                  {
                    v36 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)&v60, v33);
                  }
                  else
                  {
                    if (*(char *)(v33 + 23) < 0)
                    {
                      std::string::__init_copy_ctor_external(*((std::string **)&v60 + 1), *(const std::string::value_type **)v33, *(_QWORD *)(v33 + 8));
                    }
                    else
                    {
                      v35 = *(_OWORD *)v33;
                      *(_QWORD *)(*((_QWORD *)&v60 + 1) + 16) = *(_QWORD *)(v33 + 16);
                      *v34 = v35;
                    }
                    v36 = (std::string *)((char *)v34 + 24);
                  }
                  *((_QWORD *)&v60 + 1) = v36;
                }
                v37 = (unint64_t *)&v32->__shared_owners_;
                do
                  v38 = __ldaxr(v37);
                while (__stlxr(v38 - 1, v37));
                if (!v38)
                {
                  ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
                  std::__shared_weak_count::__release_weak(v32);
                }
              }
            }
            shared_owners += 2;
          }
          while (shared_owners != shared_weak_owners);
          v29 = (std::string *)v60;
        }
        v39 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v49 = *((_QWORD *)&v60 + 1);
          ctu::join<std::__wrap_iter<std::string *>>(&__p, v29, *((__int128 **)&v60 + 1));
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)v56 = 134218242;
          v57 = 0xAAAAAAAAAAAAAAABLL * ((v49 - (uint64_t)v29) >> 3);
          v58 = 2080;
          v59 = p_p;
          _os_log_error_impl(&dword_24B855000, v39, OS_LOG_TYPE_ERROR, "Sleep TIMEOUT: %zd clients failed to complete sleep request: %s", v56, 0x16u);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          v29 = (std::string *)v60;
          if (!(_QWORD)v60)
            goto LABEL_61;
          goto LABEL_54;
        }
        if (v29)
        {
LABEL_54:
          v40 = (std::string *)*((_QWORD *)&v60 + 1);
          v41 = v29;
          if (*((std::string **)&v60 + 1) != v29)
          {
            do
            {
              if (SHIBYTE(v40[-1].__r_.__value_.__r.__words[2]) < 0)
                operator delete(v40[-1].__r_.__value_.__l.__data_);
              --v40;
            }
            while (v40 != v29);
            v41 = (std::string *)v60;
          }
          *((_QWORD *)&v60 + 1) = v29;
          operator delete(v41);
        }
      }
LABEL_61:
      v42 = *(NSObject **)(v3 + 40);
      v2 = v52;
      v1 = v53;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl(&dword_24B855000, v42, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for sleep request", (uint8_t *)&v60, 2u);
      }
      do
        v43 = __ldaxr(p_shared_owners);
      while (__stlxr(v43 - 1, p_shared_owners));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
      goto LABEL_66;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    v12 = *(_QWORD **)(v3 + 144);
    v13 = *(_QWORD **)(v3 + 152);
    if (v12 == v13)
      goto LABEL_33;
    while (1)
    {
LABEL_12:
      v14 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v12 + 16))(*v12);
        LODWORD(v60) = 136315138;
        *(_QWORD *)((char *)&v60 + 4) = v15;
        _os_log_impl(&dword_24B855000, v14, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to sleep", (uint8_t *)&v60, 0xCu);
      }
      *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
      v16 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v12 + 16))(*v12);
      v17 = strlen(v16);
      if (v17 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      v18 = v17;
      if (v17 >= 0x17)
        break;
      HIBYTE(v63) = v17;
      p_buf = &buf;
      if (v17)
        goto LABEL_21;
LABEL_22:
      *((_BYTE *)p_buf + v18) = 0;
      ctu::TrackedGroup::fork((NSObject **)&v60, (uint64_t)v11, (uint64_t)&buf);
      if (SHIBYTE(v63) < 0)
      {
        operator delete((void *)buf);
        v22 = *v12;
        v23 = v60;
        group = (dispatch_group_t)v60;
        if ((_QWORD)v60)
        {
LABEL_26:
          dispatch_retain(v23);
          if (group)
            dispatch_group_enter(group);
        }
      }
      else
      {
        v22 = *v12;
        v23 = v60;
        group = (dispatch_group_t)v60;
        if ((_QWORD)v60)
          goto LABEL_26;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v22 + 48))(v22, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v23)
      {
        dispatch_group_leave(v23);
        dispatch_release(v23);
      }
      v12 += 2;
      if (v12 == v13)
        goto LABEL_33;
    }
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    p_buf = (__int128 *)operator new(v20 + 1);
    *((_QWORD *)&buf + 1) = v18;
    v63 = v21 | 0x8000000000000000;
    *(_QWORD *)&buf = p_buf;
LABEL_21:
    memmove(p_buf, v16, v18);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring sleep request",
      (uint8_t *)&buf,
      2u);
  }
LABEL_66:
  v44 = v2[1];
  if (v44)
  {
    dispatch_group_leave(v44);
    v45 = v2[1];
    if (v45)
      dispatch_release(v45);
  }
  operator delete(v2);
  v46 = (std::__shared_weak_count *)v1[2];
  if (v46)
  {
    v47 = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  operator delete(v1);
}

void sub_24B949038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, _QWORD *a11, _QWORD *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_group_t group, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void **__p,uint64_t a24)
{
  unint64_t *v24;
  std::__shared_weak_count *v25;
  void **v26;
  unint64_t *p_shared_owners;
  unint64_t v29;
  void **v30;
  void **v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;

  p_shared_owners = (unint64_t *)&v25->__shared_owners_;
  do
    v29 = __ldaxr(p_shared_owners);
  while (__stlxr(v29 - 1, p_shared_owners));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  if (__p)
  {
    v30 = v26;
    v31 = __p;
    if (v26 != __p)
    {
      do
      {
        if (*((char *)v30 - 1) < 0)
          operator delete(*(v30 - 3));
        v30 -= 3;
      }
      while (v30 != __p);
      v31 = __p;
    }
    operator delete(v31);
  }
  do
    v32 = __ldaxr(v24);
  while (__stlxr(v32 - 1, v24));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
    std::__shared_weak_count::__release_weak(a10);
  }
  v33 = a11[1];
  if (v33)
  {
    dispatch_group_leave(v33);
    v34 = a11[1];
    if (v34)
      dispatch_release(v34);
  }
  operator delete(a11);
  v35 = (std::__shared_weak_count *)a12[2];
  if (v35)
  {
    v36 = (unint64_t *)&v35->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void ctu::TrackedGroup::fork(NSObject **a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  void *__p[2];
  uint64_t v8;
  void *v9;
  void *v10;
  void *object[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__p = *(_OWORD *)a3;
  v8 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  *(_OWORD *)object = 0u;
  v12 = 0u;
  v13 = 0u;
  ctu::TrackedGroup::fork(a1, a2, (uint64_t)__p, (dispatch_group_t *)object);
  if (*((_QWORD *)&v13 + 1) && object[0])
  {
    v9 = object[0];
    v10 = object[1];
    (*(void (**)(void))(**((_QWORD **)&v13 + 1) + 48))();
  }
  if (object[1])
    os_release(object[1]);
  v3 = &v12;
  v4 = (__int128 *)*((_QWORD *)&v13 + 1);
  object[1] = 0;
  *((_QWORD *)&v13 + 1) = 0;
  if (v4 == &v12)
  {
    v5 = 4;
    v4 = &v12;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
    object[0] = 0;
    if (*((__int128 **)&v13 + 1) == &v12)
    {
      v6 = 4;
    }
    else
    {
      if (!*((_QWORD *)&v13 + 1))
        goto LABEL_15;
      v6 = 5;
      v3 = (__int128 *)*((_QWORD *)&v13 + 1);
    }
    (*(void (**)(__int128 *))(*(_QWORD *)v3 + 8 * v6))(v3);
LABEL_15:
    if ((SHIBYTE(v8) & 0x80000000) == 0)
      return;
    goto LABEL_16;
  }
  if (v4)
  {
    v5 = 5;
    goto LABEL_10;
  }
  object[0] = 0;
  if (SHIBYTE(v8) < 0)
LABEL_16:
    operator delete(__p[0]);
}

void sub_24B949320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::__on_zero_shared(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;

  v2 = a1[4];
  if (v2)
  {
    v3 = a1[5];
    v4 = (void *)a1[4];
    if (v3 != v2)
    {
      do
      {
        v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5)
          std::__shared_weak_count::__release_weak(v5);
        v3 -= 16;
      }
      while (v3 != v2);
      v4 = (void *)a1[4];
    }
    a1[5] = v2;
    operator delete(v4);
  }
  v6 = a1[3];
  if (v6)
    dispatch_release(v6);
}

void ctu::TrackedGroup::fork(NSObject **a1, uint64_t a2, uint64_t a3, dispatch_group_t *a4)
{
  NSObject *v8;
  NSObject *v9;
  char *v10;
  unint64_t *v11;
  NSObject *v12;
  NSObject *global_queue;
  NSObject *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *p_isa;
  dispatch_group_t v18;
  dispatch_group_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unint64_t *v41;
  unint64_t v42;
  char *v43;
  __int128 v44;
  char *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  dispatch_group_t group[2];
  dispatch_group_t object;
  _QWORD v53[3];
  _QWORD *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = dispatch_group_create();
  v9 = v8;
  *a1 = v8;
  if (v8)
  {
    dispatch_retain(v8);
    dispatch_group_enter(v9);
    dispatch_release(v9);
  }
  v10 = (char *)operator new(0x30uLL);
  *((_QWORD *)v10 + 1) = 0;
  v11 = (unint64_t *)(v10 + 8);
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = off_251CC1288;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a3;
  *((_QWORD *)v10 + 5) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)&v49 = v10 + 24;
  *((_QWORD *)&v49 + 1) = v10;
  v12 = *(NSObject **)a2;
  if (*(_QWORD *)a2)
  {
    dispatch_retain(*(dispatch_object_t *)a2);
    dispatch_group_enter(v12);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v14 = global_queue;
  if (global_queue)
    dispatch_retain(global_queue);
  *(_QWORD *)&v50 = v10 + 24;
  *((_QWORD *)&v50 + 1) = v10;
  do
    v15 = __ldxr(v11);
  while (__stxr(v15 + 1, v11));
  group[0] = v12;
  if (v12)
  {
    dispatch_retain(v12);
    dispatch_group_enter(v12);
  }
  group[1] = *a4;
  object = a4[1];
  v16 = v53;
  p_isa = a4 + 2;
  v18 = a4[5];
  if (v18)
  {
    if (v18 == (dispatch_group_t)p_isa)
    {
      v54 = v53;
      (*(void (**)(dispatch_group_t *, _QWORD *))(*p_isa + 24))(a4 + 2, v53);
    }
    else
    {
      v54 = a4[5];
      a4[5] = 0;
    }
  }
  else
  {
    v54 = 0;
  }
  *a4 = 0;
  a4[1] = 0;
  v19 = a4[5];
  a4[5] = 0;
  if (v19 == (dispatch_group_t)p_isa)
  {
    v20 = 4;
  }
  else
  {
    if (!v19)
      goto LABEL_21;
    v20 = 5;
    p_isa = &v19->isa;
  }
  (*(void (**)(_QWORD *))(*p_isa + 8 * v20))(p_isa);
LABEL_21:
  v21 = (char *)operator new(0x48uLL);
  v22 = v21;
  *(_OWORD *)v21 = v50;
  *((_OWORD *)v21 + 1) = *(_OWORD *)group;
  v23 = v54;
  *((_QWORD *)v21 + 4) = object;
  if (v23)
  {
    if (v23 == v53)
    {
      *((_QWORD *)v21 + 8) = v21 + 40;
      (*(void (**)(_QWORD *))(v53[0] + 24))(v53);
    }
    else
    {
      *((_QWORD *)v21 + 8) = v23;
      v54 = 0;
    }
  }
  else
  {
    *((_QWORD *)v21 + 8) = 0;
  }
  v24 = v54;
  v54 = 0;
  if (v24 == v53)
  {
    v25 = 4;
    v24 = v53;
  }
  else
  {
    if (!v24)
      goto LABEL_31;
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_31:
  dispatch_group_notify_f(v9, v14, v22, (dispatch_function_t)dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  v26 = v54;
  v54 = 0;
  if (v26 == v53)
  {
    v27 = 4;
    v26 = v53;
  }
  else
  {
    if (!v26)
      goto LABEL_40;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
  if (v54 == v53)
  {
    v28 = 4;
  }
  else
  {
    if (!v54)
      goto LABEL_40;
    v28 = 5;
    v16 = v54;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v28))(v16);
LABEL_40:
  if (v14)
    dispatch_release(v14);
  v30 = *(char **)(a2 + 16);
  v29 = *(_QWORD *)(a2 + 24);
  if ((unint64_t)v30 >= v29)
  {
    v34 = *(char **)(a2 + 8);
    v35 = (v30 - v34) >> 4;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 60)
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
    v37 = v29 - (_QWORD)v34;
    if (v37 >> 3 > v36)
      v36 = v37 >> 3;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
      v38 = 0xFFFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    if (v38 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v39 = (char *)operator new(16 * v38);
    v40 = &v39[16 * v35];
    *(_OWORD *)v40 = v49;
    if (*((_QWORD *)&v49 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 16);
      do
        v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
      v34 = *(char **)(a2 + 8);
      v30 = *(char **)(a2 + 16);
    }
    v43 = &v39[16 * v38];
    v33 = v40 + 16;
    if (v30 == v34)
    {
      *(_QWORD *)(a2 + 8) = v40;
      *(_QWORD *)(a2 + 16) = v33;
      *(_QWORD *)(a2 + 24) = v43;
    }
    else
    {
      do
      {
        v44 = *((_OWORD *)v30 - 1);
        v30 -= 16;
        *((_OWORD *)v40 - 1) = v44;
        v40 -= 16;
        *(_QWORD *)v30 = 0;
        *((_QWORD *)v30 + 1) = 0;
      }
      while (v30 != v34);
      v34 = *(char **)(a2 + 8);
      v45 = *(char **)(a2 + 16);
      *(_QWORD *)(a2 + 8) = v40;
      *(_QWORD *)(a2 + 16) = v33;
      *(_QWORD *)(a2 + 24) = v43;
      while (v45 != v34)
      {
        v46 = (std::__shared_weak_count *)*((_QWORD *)v45 - 1);
        if (v46)
          std::__shared_weak_count::__release_weak(v46);
        v45 -= 16;
      }
    }
    if (v34)
      operator delete(v34);
  }
  else
  {
    *(_OWORD *)v30 = v49;
    if (*((_QWORD *)&v49 + 1))
    {
      v31 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 16);
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    v33 = v30 + 16;
  }
  *(_QWORD *)(a2 + 16) = v33;
  if (v12)
  {
    dispatch_group_leave(v12);
    dispatch_release(v12);
  }
  if (*((_QWORD *)&v49 + 1))
  {
    v47 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v49 + 1) + 16))(*((_QWORD *)&v49 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v49 + 1));
    }
  }
}

void sub_24B949920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}::~signpost_interval(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
  v2 = a1[2];
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = a1[2];
    if (v3)
      dispatch_release(v3);
  }
  v4 = (std::__shared_weak_count *)a1[1];
  if (!v4)
    return a1;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (v6)
    return a1;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1288;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1288;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<std::string>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

void dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  if (a1)
  {
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
    v2 = a1[2];
    if (v2)
    {
      dispatch_group_leave(v2);
      v3 = a1[2];
      if (v3)
        dispatch_release(v3);
    }
    v4 = (std::__shared_weak_count *)a1[1];
    if (!v4)
      goto LABEL_9;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      operator delete(a1);
    }
    else
    {
LABEL_9:
      operator delete(a1);
    }
  }
}

void ctu::os::signpost_interval::~signpost_interval(ctu::os::signpost_interval *this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  ctu::os::signpost_interval *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *((_QWORD *)this + 5);
  if (v2 && *(_QWORD *)this)
  {
    v3 = *((_QWORD *)this + 1);
    v10 = *(_QWORD *)this;
    v11 = v3;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v2 + 48))(v2, &v11, &v10);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
    os_release(v4);
  v5 = (_QWORD *)((char *)this + 16);
  *((_QWORD *)this + 1) = 0;
  v6 = (ctu::os::signpost_interval *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v6 == (ctu::os::signpost_interval *)((char *)this + 16))
  {
    v7 = 4;
    v6 = (ctu::os::signpost_interval *)((char *)this + 16);
  }
  else
  {
    if (!v6)
    {
      *(_QWORD *)this = 0;
      return;
    }
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
  v8 = (_QWORD *)*((_QWORD *)this + 5);
  *(_QWORD *)this = 0;
  if (v8 == v5)
  {
    v9 = 4;
  }
  else
  {
    if (!v8)
      return;
    v9 = 5;
    v5 = v8;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v9))(v5);
}

std::string *ctu::join<std::__wrap_iter<std::string *>>(std::string *__dst, std::string *a2, __int128 *a3)
{
  std::string *v5;
  __int128 v6;
  std::string *j;
  int v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  std::string *i;
  int v12;
  const std::string::value_type *v13;
  std::string::size_type size;
  std::string::value_type *v15;
  std::string::size_type v16;
  std::string::value_type __s[8];
  std::string::size_type v18;
  uint64_t v19;

  __dst->__r_.__value_.__r.__words[0] = 0;
  __dst->__r_.__value_.__l.__size_ = 0;
  __dst->__r_.__value_.__r.__words[2] = 0;
  if (a2 != (std::string *)a3)
  {
    v5 = __dst;
    if (a2 != __dst)
    {
      if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
      {
        __dst = (std::string *)std::string::__assign_no_alias<true>(__dst, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
      }
      else
      {
        v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
        __dst->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = v6;
      }
    }
    if (",")
    {
      for (i = a2 + 1; i != (std::string *)a3; ++i)
      {
        HIBYTE(v19) = 1;
        memmove(__s, ",", 1uLL);
        __s[1] = 0;
        if (v19 >= 0)
          v15 = __s;
        else
          v15 = *(std::string::value_type **)__s;
        if (v19 >= 0)
          v16 = HIBYTE(v19);
        else
          v16 = v18;
        std::string::append(v5, v15, v16);
        if (SHIBYTE(v19) < 0)
          operator delete(*(void **)__s);
        v12 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
        if (v12 >= 0)
          v13 = (const std::string::value_type *)i;
        else
          v13 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
        if (v12 >= 0)
          size = HIBYTE(i->__r_.__value_.__r.__words[2]);
        else
          size = i->__r_.__value_.__l.__size_;
        __dst = std::string::append(v5, v13, size);
      }
    }
    else
    {
      for (j = a2 + 1; j != (std::string *)a3; ++j)
      {
        *(_QWORD *)__s = 0;
        v18 = 0;
        v19 = 0;
        std::string::append(v5, __s, 0);
        if (SHIBYTE(v19) < 0)
          operator delete(*(void **)__s);
        v8 = SHIBYTE(j->__r_.__value_.__r.__words[2]);
        if (v8 >= 0)
          v9 = (const std::string::value_type *)j;
        else
          v9 = (const std::string::value_type *)j->__r_.__value_.__r.__words[0];
        if (v8 >= 0)
          v10 = HIBYTE(j->__r_.__value_.__r.__words[2]);
        else
          v10 = j->__r_.__value_.__l.__size_;
        __dst = std::string::append(v5, v9, v10);
      }
    }
  }
  return __dst;
}

void sub_24B949E90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 + 23) < 0)
  {
    operator delete(*(void **)v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  _QWORD *v9;
  unint64_t *p_shared_owners;
  NSObject **v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  __int128 *p_buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  dispatch_time_t v26;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::string *v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  std::string *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  std::string *v40;
  std::string *v41;
  NSObject *v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  std::string *p_p;
  std::__shared_weak_count *v51;
  uint64_t *v52;
  uint64_t **v53;
  std::string __p;
  dispatch_group_t group;
  uint8_t v56[4];
  unint64_t v57;
  __int16 v58;
  std::string *v59;
  __int128 v60;
  unint64_t v61;
  __int128 buf;
  unint64_t v63;
  uint64_t v64;

  v1 = a1;
  v64 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = **a1;
  v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (uint64_t)(*(_QWORD *)(v3 + 152) - *(_QWORD *)(v3 + 144)) >> 4;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to wake", (uint8_t *)&buf, 0xCu);
    }
    v52 = v2;
    v53 = v1;
    v7 = dispatch_group_create();
    v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    v11 = (NSObject **)&v8[1];
    v51 = v8;
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      v12 = *(_QWORD **)(v3 + 144);
      v13 = *(_QWORD **)(v3 + 152);
      if (v12 != v13)
        goto LABEL_12;
LABEL_33:
      v24 = *v11;
      v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 104))(v3);
      v26 = dispatch_time(0, 2000000000 * v25);
      if (dispatch_group_wait(v24, v26))
      {
        v60 = 0uLL;
        v61 = 0;
        shared_owners = (uint64_t *)v51[1].__shared_owners_;
        shared_weak_owners = (uint64_t *)v51[1].__shared_weak_owners_;
        if (shared_owners == shared_weak_owners)
        {
          v29 = 0;
        }
        else
        {
          do
          {
            v30 = (std::__shared_weak_count *)shared_owners[1];
            if (v30)
            {
              v31 = std::__shared_weak_count::lock(v30);
              if (v31)
              {
                v32 = v31;
                v33 = *shared_owners;
                if (*shared_owners)
                {
                  v34 = (_OWORD *)*((_QWORD *)&v60 + 1);
                  if (*((_QWORD *)&v60 + 1) >= v61)
                  {
                    v36 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)&v60, v33);
                  }
                  else
                  {
                    if (*(char *)(v33 + 23) < 0)
                    {
                      std::string::__init_copy_ctor_external(*((std::string **)&v60 + 1), *(const std::string::value_type **)v33, *(_QWORD *)(v33 + 8));
                    }
                    else
                    {
                      v35 = *(_OWORD *)v33;
                      *(_QWORD *)(*((_QWORD *)&v60 + 1) + 16) = *(_QWORD *)(v33 + 16);
                      *v34 = v35;
                    }
                    v36 = (std::string *)((char *)v34 + 24);
                  }
                  *((_QWORD *)&v60 + 1) = v36;
                }
                v37 = (unint64_t *)&v32->__shared_owners_;
                do
                  v38 = __ldaxr(v37);
                while (__stlxr(v38 - 1, v37));
                if (!v38)
                {
                  ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
                  std::__shared_weak_count::__release_weak(v32);
                }
              }
            }
            shared_owners += 2;
          }
          while (shared_owners != shared_weak_owners);
          v29 = (std::string *)v60;
        }
        v39 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v49 = *((_QWORD *)&v60 + 1);
          ctu::join<std::__wrap_iter<std::string *>>(&__p, v29, *((__int128 **)&v60 + 1));
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)v56 = 134218242;
          v57 = 0xAAAAAAAAAAAAAAABLL * ((v49 - (uint64_t)v29) >> 3);
          v58 = 2080;
          v59 = p_p;
          _os_log_error_impl(&dword_24B855000, v39, OS_LOG_TYPE_ERROR, "Wake TIMEOUT: %zd clients failed to complete wake request: %s", v56, 0x16u);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          v29 = (std::string *)v60;
          if (!(_QWORD)v60)
            goto LABEL_61;
          goto LABEL_54;
        }
        if (v29)
        {
LABEL_54:
          v40 = (std::string *)*((_QWORD *)&v60 + 1);
          v41 = v29;
          if (*((std::string **)&v60 + 1) != v29)
          {
            do
            {
              if (SHIBYTE(v40[-1].__r_.__value_.__r.__words[2]) < 0)
                operator delete(v40[-1].__r_.__value_.__l.__data_);
              --v40;
            }
            while (v40 != v29);
            v41 = (std::string *)v60;
          }
          *((_QWORD *)&v60 + 1) = v29;
          operator delete(v41);
        }
      }
LABEL_61:
      v42 = *(NSObject **)(v3 + 40);
      v2 = v52;
      v1 = v53;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl(&dword_24B855000, v42, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for wake request", (uint8_t *)&v60, 2u);
      }
      do
        v43 = __ldaxr(p_shared_owners);
      while (__stlxr(v43 - 1, p_shared_owners));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
      goto LABEL_66;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    v12 = *(_QWORD **)(v3 + 144);
    v13 = *(_QWORD **)(v3 + 152);
    if (v12 == v13)
      goto LABEL_33;
    while (1)
    {
LABEL_12:
      v14 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v12 + 16))(*v12);
        LODWORD(v60) = 136315138;
        *(_QWORD *)((char *)&v60 + 4) = v15;
        _os_log_impl(&dword_24B855000, v14, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to wake", (uint8_t *)&v60, 0xCu);
      }
      *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
      v16 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v12 + 16))(*v12);
      v17 = strlen(v16);
      if (v17 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      v18 = v17;
      if (v17 >= 0x17)
        break;
      HIBYTE(v63) = v17;
      p_buf = &buf;
      if (v17)
        goto LABEL_21;
LABEL_22:
      *((_BYTE *)p_buf + v18) = 0;
      ctu::TrackedGroup::fork((NSObject **)&v60, (uint64_t)v11, (uint64_t)&buf);
      if (SHIBYTE(v63) < 0)
      {
        operator delete((void *)buf);
        v22 = *v12;
        v23 = v60;
        group = (dispatch_group_t)v60;
        if ((_QWORD)v60)
        {
LABEL_26:
          dispatch_retain(v23);
          if (group)
            dispatch_group_enter(group);
        }
      }
      else
      {
        v22 = *v12;
        v23 = v60;
        group = (dispatch_group_t)v60;
        if ((_QWORD)v60)
          goto LABEL_26;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v22 + 56))(v22, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v23)
      {
        dispatch_group_leave(v23);
        dispatch_release(v23);
      }
      v12 += 2;
      if (v12 == v13)
        goto LABEL_33;
    }
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    p_buf = (__int128 *)operator new(v20 + 1);
    *((_QWORD *)&buf + 1) = v18;
    v63 = v21 | 0x8000000000000000;
    *(_QWORD *)&buf = p_buf;
LABEL_21:
    memmove(p_buf, v16, v18);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_24B855000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring wake request",
      (uint8_t *)&buf,
      2u);
  }
LABEL_66:
  v44 = v2[1];
  if (v44)
  {
    dispatch_group_leave(v44);
    v45 = v2[1];
    if (v45)
      dispatch_release(v45);
  }
  operator delete(v2);
  v46 = (std::__shared_weak_count *)v1[2];
  if (v46)
  {
    v47 = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  operator delete(v1);
}

void sub_24B94A4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, _QWORD *a11, _QWORD *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_group_t group, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void **__p,uint64_t a24)
{
  unint64_t *v24;
  std::__shared_weak_count *v25;
  void **v26;
  unint64_t *p_shared_owners;
  unint64_t v29;
  void **v30;
  void **v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;

  p_shared_owners = (unint64_t *)&v25->__shared_owners_;
  do
    v29 = __ldaxr(p_shared_owners);
  while (__stlxr(v29 - 1, p_shared_owners));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  if (__p)
  {
    v30 = v26;
    v31 = __p;
    if (v26 != __p)
    {
      do
      {
        if (*((char *)v30 - 1) < 0)
          operator delete(*(v30 - 3));
        v30 -= 3;
      }
      while (v30 != __p);
      v31 = __p;
    }
    operator delete(v31);
  }
  do
    v32 = __ldaxr(v24);
  while (__stlxr(v32 - 1, v24));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
    std::__shared_weak_count::__release_weak(a10);
  }
  v33 = a11[1];
  if (v33)
  {
    dispatch_group_leave(v33);
    v34 = a11[1];
    if (v34)
      dispatch_release(v34);
  }
  operator delete(a11);
  v35 = (std::__shared_weak_count *)a12[2];
  if (v35)
  {
    v36 = (unint64_t *)&v35->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t *v6;
  NSObject **v7;
  _QWORD *v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  _BYTE *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  dispatch_time_t v22;
  std::__shared_weak_count *v23;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::__shared_weak_count *v26;
  std::__shared_weak_count *v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::string *v30;
  __int128 v31;
  __int128 *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  std::ios_base *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  std::string *p_p;
  size_t v45;
  NSObject *v46;
  __int128 *v47;
  std::string *v48;
  void *v49;
  NSObject *v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::string::size_type v57;
  std::string *v58;
  uint64_t v59;
  const void **v60;
  const void *v61;
  uint64_t v62;
  uint64_t v63;
  std::string *v64;
  _QWORD *v65;
  std::__shared_weak_count *v67;
  _QWORD *v68;
  std::string __p;
  void *v70;
  std::string *v71;
  unint64_t v72;
  dispatch_group_t group;
  void *__dst[2];
  unint64_t v75;
  uint8_t v76[4];
  std::string *v77;
  _BYTE buf[24];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v65 = (_QWORD *)*a1;
  v68 = *(_QWORD **)*a1;
  v1 = v68[5];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (uint64_t)(v68[16] - v68[15]) >> 4;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v2;
    _os_log_impl(&dword_24B855000, v1, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd global services", buf, 0xCu);
  }
  v3 = dispatch_group_create();
  v4 = operator new(0x38uLL);
  v5 = v4;
  v4[1] = 0;
  v6 = v4 + 1;
  v4[2] = 0;
  *v4 = off_251CC1238;
  v4[3] = v3;
  v7 = (NSObject **)(v4 + 3);
  v67 = (std::__shared_weak_count *)v4;
  if (!v3)
  {
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = 0;
    v8 = (_QWORD *)v68[15];
    v9 = (_QWORD *)v68[16];
    if (v8 == v9)
      goto LABEL_30;
    while (1)
    {
LABEL_9:
      v10 = v68[5];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v8 + 16))(*v8);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_24B855000, v10, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      v12 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v8 + 16))(*v8);
      v13 = strlen(v12);
      if (v13 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v14 = (_BYTE *)v13;
      if (v13 >= 0x17)
        break;
      HIBYTE(v75) = v13;
      v15 = __dst;
      if (v13)
        goto LABEL_18;
LABEL_19:
      v14[(_QWORD)v15] = 0;
      ctu::TrackedGroup::fork((NSObject **)buf, (uint64_t)v7, (uint64_t)__dst);
      if (SHIBYTE(v75) < 0)
      {
        operator delete(__dst[0]);
        v18 = *v8;
        v19 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
        {
LABEL_23:
          dispatch_retain(v19);
          if (group)
            dispatch_group_enter(group);
        }
      }
      else
      {
        v18 = *v8;
        v19 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
          goto LABEL_23;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v18 + 32))(v18, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v19)
      {
        dispatch_group_leave(v19);
        dispatch_release(v19);
      }
      v8 += 2;
      if (v8 == v9)
        goto LABEL_30;
    }
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    v15 = (void **)operator new(v16 + 1);
    __dst[1] = v14;
    v75 = v17 | 0x8000000000000000;
    __dst[0] = v15;
LABEL_18:
    memmove(v15, v12, (size_t)v14);
    goto LABEL_19;
  }
  dispatch_retain(v3);
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  dispatch_release(v3);
  v8 = (_QWORD *)v68[15];
  v9 = (_QWORD *)v68[16];
  if (v8 != v9)
    goto LABEL_9;
LABEL_30:
  v20 = *v7;
  v21 = (*(uint64_t (**)(_QWORD *))(*v68 + 88))(v68);
  v22 = dispatch_time(0, 1000000000 * v21);
  v23 = v67;
  if (!dispatch_group_wait(v20, v22))
    goto LABEL_63;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  shared_owners = (uint64_t *)v67[1].__shared_owners_;
  shared_weak_owners = (uint64_t *)v67[1].__shared_weak_owners_;
  while (shared_owners != shared_weak_owners)
  {
    v26 = (std::__shared_weak_count *)shared_owners[1];
    if (v26)
    {
      v27 = std::__shared_weak_count::lock(v26);
      if (v27)
      {
        v28 = v27;
        v29 = *shared_owners;
        if (*shared_owners)
        {
          v30 = v71;
          if ((unint64_t)v71 >= v72)
          {
            v32 = (__int128 *)std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)&v70, v29);
          }
          else
          {
            if (*(char *)(v29 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v71, *(const std::string::value_type **)v29, *(_QWORD *)(v29 + 8));
            }
            else
            {
              v31 = *(_OWORD *)v29;
              v71->__r_.__value_.__r.__words[2] = *(_QWORD *)(v29 + 16);
              *(_OWORD *)&v30->__r_.__value_.__l.__data_ = v31;
            }
            v32 = (__int128 *)&v30[1];
          }
          v71 = (std::string *)v32;
        }
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v34 = __ldaxr(p_shared_owners);
        while (__stlxr(v34 - 1, p_shared_owners));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
    }
    shared_owners += 2;
  }
  *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v84 = 0xAAAAAAAAAAAAAAAALL;
  v94 = v35;
  v93 = v35;
  v92 = v35;
  v91 = v35;
  v90 = v35;
  v89 = v35;
  v88 = v35;
  v87 = v35;
  v86 = v35;
  v83 = v35;
  v82 = v35;
  v81 = v35;
  v80 = v35;
  v79 = v35;
  *(_OWORD *)&buf[8] = v35;
  v36 = MEMORY[0x24BEDB870];
  v37 = MEMORY[0x24BEDB870] + 64;
  v85 = MEMORY[0x24BEDB870] + 64;
  v38 = (_QWORD *)MEMORY[0x24BEDB800];
  v39 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)buf = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v39;
  v40 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v40, &buf[8]);
  v40[1].__vftable = 0;
  v40[1].__fmtflags_ = -1;
  *(_QWORD *)buf = v36 + 24;
  v85 = v37;
  std::streambuf::basic_streambuf();
  v41 = MEMORY[0x24BEDB848];
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  v82 = 0u;
  v83 = 0u;
  LODWORD(v84) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  v42 = (_QWORD *)std::ostream::operator<<();
  v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)" clients failed to complete init stage: ", 40);
  p_p = &__p;
  ctu::join<std::__wrap_iter<std::string *>>(&__p, (std::string *)v70, (__int128 *)v71);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v45 = strlen((const char *)p_p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)p_p, v45);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v46 = v68[5];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    if ((v84 & 0x10) != 0)
    {
      v59 = *((_QWORD *)&v83 + 1);
      if (*((_QWORD *)&v83 + 1) < (unint64_t)v81)
      {
        *((_QWORD *)&v83 + 1) = v81;
        v59 = v81;
      }
      v60 = (const void **)&v80 + 1;
    }
    else
    {
      if ((v84 & 8) == 0)
      {
        v57 = 0;
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
        v58 = &__p;
        goto LABEL_92;
      }
      v60 = (const void **)&v79;
      v59 = v80;
    }
    v61 = *v60;
    v57 = v59 - (_QWORD)*v60;
    if (v57 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v57 >= 0x17)
    {
      v62 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v57 | 7) != 0x17)
        v62 = v57 | 7;
      v63 = v62 + 1;
      v58 = (std::string *)operator new(v62 + 1);
      __p.__r_.__value_.__l.__size_ = v57;
      __p.__r_.__value_.__r.__words[2] = v63 | 0x8000000000000000;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
    }
    else
    {
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v59 - *(_BYTE *)v60;
      v58 = &__p;
      if (!v57)
        goto LABEL_92;
    }
    memmove(v58, v61, v57);
LABEL_92:
    v58->__r_.__value_.__s.__data_[v57] = 0;
    v64 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v64 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)v76 = 136315138;
    v77 = v64;
    _os_log_error_impl(&dword_24B855000, v46, OS_LOG_TYPE_ERROR, "%s", v76, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v23 = v67;
  }
  *(_QWORD *)buf = *v38;
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v38[3];
  *(_QWORD *)&buf[8] = v41 + 16;
  if (SBYTE7(v83) < 0)
    operator delete((void *)v82);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD29B5C](&v85);
  v47 = (__int128 *)v70;
  if (v70)
  {
    v48 = v71;
    v49 = v70;
    if (v71 != v70)
    {
      do
      {
        if (SHIBYTE(v48[-1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v48[-1].__r_.__value_.__l.__data_);
        --v48;
      }
      while (v48 != (std::string *)v47);
      v49 = v70;
    }
    v71 = (std::string *)v47;
    operator delete(v49);
  }
LABEL_63:
  v50 = v68[5];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v50, OS_LOG_TYPE_DEFAULT, "#I All global services initialized", buf, 2u);
  }
  do
    v51 = __ldaxr(v6);
  while (__stlxr(v51 - 1, v6));
  if (!v51)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  v52 = v65[1];
  if (v52)
  {
    dispatch_group_leave(v52);
    v53 = v65[1];
    if (v53)
      dispatch_release(v53);
  }
  operator delete(v65);
  v54 = (std::__shared_weak_count *)a1[2];
  if (v54)
  {
    v55 = (unint64_t *)&v54->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  operator delete(a1);
}

void sub_24B94AE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10, _QWORD *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void **__p,uint64_t a24,uint64_t a25,dispatch_group_t group,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  unint64_t *v49;
  std::__shared_weak_count *v50;
  void **v51;
  unint64_t *p_shared_owners;
  unint64_t v54;
  void **v55;
  void **v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;

  p_shared_owners = (unint64_t *)&v50->__shared_owners_;
  do
    v54 = __ldaxr(p_shared_owners);
  while (__stlxr(v54 - 1, p_shared_owners));
  if (!v54)
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
  if (__p)
  {
    v55 = v51;
    v56 = __p;
    if (v51 != __p)
    {
      do
      {
        if (*((char *)v55 - 1) < 0)
          operator delete(*(v55 - 3));
        v55 -= 3;
      }
      while (v55 != __p);
      v56 = __p;
    }
    operator delete(v56);
  }
  do
    v57 = __ldaxr(v49);
  while (__stlxr(v57 - 1, v49));
  if (!v57)
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  v58 = a10[1];
  if (v58)
  {
    dispatch_group_leave(v58);
    v59 = a10[1];
    if (v59)
      dispatch_release(v59);
  }
  operator delete(a10);
  v60 = a11;
  v61 = (std::__shared_weak_count *)a11[2];
  if (v61)
  {
    v62 = (unint64_t *)&v61->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    v60 = a11;
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  operator delete(v60);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  _QWORD *v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t *v7;
  NSObject **v8;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  _BYTE *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  dispatch_time_t v23;
  std::__shared_weak_count *v24;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::__shared_weak_count *v27;
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::string *v31;
  __int128 v32;
  __int128 *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  std::ios_base *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  std::string *p_p;
  size_t v46;
  NSObject *v47;
  __int128 *v48;
  std::string *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 *v56;
  std::string *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  unint64_t v63;
  NSObject *v64;
  NSObject *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  BOOL v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::string::size_type v73;
  std::string *v74;
  uint64_t v75;
  const void **v76;
  const void *v77;
  uint64_t v78;
  std::string *v79;
  _QWORD *v80;
  std::__shared_weak_count *v82;
  uint64_t v83;
  std::string __p;
  void *v85;
  std::string *v86;
  unint64_t v87;
  dispatch_group_t group;
  void *__dst[2];
  unint64_t v90;
  uint8_t v91[4];
  std::string *v92;
  uint8_t buf[24];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  unint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v80 = (_QWORD *)*a1;
  v1 = *(_QWORD **)*a1;
  v2 = v1[5];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (uint64_t)(v1[16] - v1[15]) >> 4;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_24B855000, v2, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd global services", buf, 0xCu);
  }
  v4 = dispatch_group_create();
  v5 = operator new(0x38uLL);
  v6 = v5;
  v5[1] = 0;
  v7 = v5 + 1;
  v5[2] = 0;
  *v5 = off_251CC1238;
  v5[3] = v4;
  v8 = (NSObject **)(v5 + 3);
  v82 = (std::__shared_weak_count *)v5;
  if (!v4)
  {
    v5[4] = 0;
    v5[5] = 0;
    v5[6] = 0;
    v9 = (_QWORD *)v1[15];
    v10 = (_QWORD *)v1[16];
    if (v9 == v10)
      goto LABEL_30;
    while (1)
    {
LABEL_9:
      v11 = v1[5];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v9 + 16))(*v9);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_24B855000, v11, OS_LOG_TYPE_DEFAULT, "#I Shutdown global service '%s'", buf, 0xCu);
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      v13 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v9 + 16))(*v9);
      v14 = strlen(v13);
      if (v14 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v15 = (_BYTE *)v14;
      if (v14 >= 0x17)
        break;
      HIBYTE(v90) = v14;
      v16 = __dst;
      if (v14)
        goto LABEL_18;
LABEL_19:
      v15[(_QWORD)v16] = 0;
      ctu::TrackedGroup::fork((NSObject **)buf, (uint64_t)v8, (uint64_t)__dst);
      if (SHIBYTE(v90) < 0)
      {
        operator delete(__dst[0]);
        v19 = *v9;
        v20 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
        {
LABEL_23:
          dispatch_retain(v20);
          if (group)
            dispatch_group_enter(group);
        }
      }
      else
      {
        v19 = *v9;
        v20 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
          goto LABEL_23;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v19 + 64))(v19, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v20)
      {
        dispatch_group_leave(v20);
        dispatch_release(v20);
      }
      v9 += 2;
      if (v9 == v10)
        goto LABEL_30;
    }
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    __dst[1] = v15;
    v90 = v18 | 0x8000000000000000;
    __dst[0] = v16;
LABEL_18:
    memmove(v16, v13, (size_t)v15);
    goto LABEL_19;
  }
  dispatch_retain(v4);
  v6[4] = 0;
  v6[5] = 0;
  v6[6] = 0;
  dispatch_release(v4);
  v9 = (_QWORD *)v1[15];
  v10 = (_QWORD *)v1[16];
  if (v9 != v10)
    goto LABEL_9;
LABEL_30:
  v21 = *v8;
  v22 = (*(uint64_t (**)(_QWORD *))(*v1 + 112))(v1);
  v23 = dispatch_time(0, 1000000000 * v22);
  v24 = v82;
  if (!dispatch_group_wait(v21, v23))
    goto LABEL_63;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  shared_owners = (uint64_t *)v82[1].__shared_owners_;
  shared_weak_owners = (uint64_t *)v82[1].__shared_weak_owners_;
  while (shared_owners != shared_weak_owners)
  {
    v27 = (std::__shared_weak_count *)shared_owners[1];
    if (v27)
    {
      v28 = std::__shared_weak_count::lock(v27);
      if (v28)
      {
        v29 = v28;
        v30 = *shared_owners;
        if (*shared_owners)
        {
          v31 = v86;
          if ((unint64_t)v86 >= v87)
          {
            v33 = (__int128 *)std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)&v85, v30);
          }
          else
          {
            if (*(char *)(v30 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v86, *(const std::string::value_type **)v30, *(_QWORD *)(v30 + 8));
            }
            else
            {
              v32 = *(_OWORD *)v30;
              v86->__r_.__value_.__r.__words[2] = *(_QWORD *)(v30 + 16);
              *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
            }
            v33 = (__int128 *)&v31[1];
          }
          v86 = (std::string *)v33;
        }
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v35 = __ldaxr(p_shared_owners);
        while (__stlxr(v35 - 1, p_shared_owners));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
    shared_owners += 2;
  }
  *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v99 = 0xAAAAAAAAAAAAAAAALL;
  v109 = v36;
  v108 = v36;
  v107 = v36;
  v106 = v36;
  v105 = v36;
  v104 = v36;
  v103 = v36;
  v102 = v36;
  v101 = v36;
  v98 = v36;
  v97 = v36;
  v96 = v36;
  v95 = v36;
  v94 = v36;
  *(_OWORD *)&buf[8] = v36;
  v37 = MEMORY[0x24BEDB870];
  v38 = MEMORY[0x24BEDB870] + 64;
  v100 = MEMORY[0x24BEDB870] + 64;
  v39 = (_QWORD *)MEMORY[0x24BEDB800];
  v40 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)buf = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v40;
  v41 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v41, &buf[8]);
  v41[1].__vftable = 0;
  v41[1].__fmtflags_ = -1;
  *(_QWORD *)buf = v37 + 24;
  v100 = v38;
  std::streambuf::basic_streambuf();
  v42 = MEMORY[0x24BEDB848];
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  v97 = 0u;
  v98 = 0u;
  LODWORD(v99) = 16;
  v24 = v82;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown global service: TIMEOUT: ", 34);
  v43 = (_QWORD *)std::ostream::operator<<();
  v44 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)" clients failed to complete shutdown: ", 38);
  p_p = &__p;
  ctu::join<std::__wrap_iter<std::string *>>(&__p, (std::string *)v85, (__int128 *)v86);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v46 = strlen((const char *)p_p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)p_p, v46);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v47 = v1[5];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    if ((v99 & 0x10) != 0)
    {
      v75 = *((_QWORD *)&v98 + 1);
      if (*((_QWORD *)&v98 + 1) < (unint64_t)v96)
      {
        *((_QWORD *)&v98 + 1) = v96;
        v75 = v96;
      }
      v76 = (const void **)&v95 + 1;
    }
    else
    {
      if ((v99 & 8) == 0)
      {
        v73 = 0;
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
        v74 = &__p;
        goto LABEL_118;
      }
      v76 = (const void **)&v94;
      v75 = v95;
    }
    v77 = *v76;
    v73 = v75 - (_QWORD)*v76;
    if (v73 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v73 >= 0x17)
    {
      v78 = (v73 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v73 | 7) != 0x17)
        v78 = v73 | 7;
      v83 = v78 + 1;
      v74 = (std::string *)operator new(v78 + 1);
      __p.__r_.__value_.__l.__size_ = v73;
      __p.__r_.__value_.__r.__words[2] = v83 | 0x8000000000000000;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v74;
    }
    else
    {
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v75 - *(_BYTE *)v76;
      v74 = &__p;
      if (!v73)
        goto LABEL_118;
    }
    memmove(v74, v77, v73);
LABEL_118:
    v74->__r_.__value_.__s.__data_[v73] = 0;
    v79 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v79 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)v91 = 136315138;
    v92 = v79;
    _os_log_error_impl(&dword_24B855000, v47, OS_LOG_TYPE_ERROR, "%s", v91, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v24 = v82;
  }
  *(_QWORD *)buf = *v39;
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v39[3];
  *(_QWORD *)&buf[8] = v42 + 16;
  if (SBYTE7(v98) < 0)
    operator delete((void *)v97);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD29B5C](&v100);
  v48 = (__int128 *)v85;
  if (v85)
  {
    v49 = v86;
    v50 = v85;
    if (v86 != v85)
    {
      do
      {
        if (SHIBYTE(v49[-1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v49[-1].__r_.__value_.__l.__data_);
        --v49;
      }
      while (v49 != (std::string *)v48);
      v50 = v85;
    }
    v86 = (std::string *)v48;
    operator delete(v50);
  }
LABEL_63:
  v51 = v1[16];
  if (v51 != v1[15])
  {
    do
    {
      v53 = v51;
      v54 = *(_QWORD *)(v51 - 16);
      v51 -= 16;
      memset(buf, 0, sizeof(buf));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(_QWORD *)(v54 + 24), *(_QWORD *)(v54 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v54 + 32) - *(_QWORD *)(v54 + 24)) >> 3));
      v55 = v1[21];
      v86 = 0;
      v87 = 0;
      v85 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v85, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v55, (uint64_t)v85, (uint64_t)v86);
      v56 = (__int128 *)v85;
      if (v85)
      {
        v57 = v86;
        v58 = v85;
        if (v86 != v85)
        {
          do
          {
            if (SHIBYTE(v57[-1].__r_.__value_.__r.__words[2]) < 0)
              operator delete(v57[-1].__r_.__value_.__l.__data_);
            --v57;
          }
          while (v57 != (std::string *)v56);
          v58 = v85;
        }
        v86 = (std::string *)v56;
        operator delete(v58);
      }
      v59 = *(_QWORD *)buf;
      if (*(_QWORD *)buf)
      {
        v60 = *(_QWORD *)&buf[8];
        v52 = *(void **)buf;
        if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
        {
          do
          {
            if (*(char *)(v60 - 1) < 0)
              operator delete(*(void **)(v60 - 24));
            v60 -= 24;
          }
          while (v60 != v59);
          v52 = *(void **)buf;
        }
        *(_QWORD *)&buf[8] = v59;
        operator delete(v52);
      }
    }
    while (v51 != v1[15]);
    v61 = v1[16];
    if (v61 != v51)
    {
      do
      {
        v70 = *(std::__shared_weak_count **)(v61 - 8);
        if (v70)
        {
          v71 = (unint64_t *)&v70->__shared_owners_;
          do
            v72 = __ldaxr(v71);
          while (__stlxr(v72 - 1, v71));
          if (!v72)
          {
            ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
            std::__shared_weak_count::__release_weak(v70);
          }
        }
        v69 = v61 == v53;
        v61 -= 16;
      }
      while (!v69);
    }
  }
  v1[16] = v51;
  v62 = v1[5];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v62, OS_LOG_TYPE_DEFAULT, "#I All global services have shutdown", buf, 2u);
  }
  do
    v63 = __ldaxr(v7);
  while (__stlxr(v63 - 1, v7));
  if (!v63)
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  v64 = v80[1];
  if (v64)
  {
    dispatch_group_leave(v64);
    v65 = v80[1];
    if (v65)
      dispatch_release(v65);
  }
  operator delete(v80);
  v66 = (std::__shared_weak_count *)a1[2];
  if (v66)
  {
    v67 = (unint64_t *)&v66->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
  operator delete(a1);
}

void sub_24B94BA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10, _QWORD *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void **__p,uint64_t a22,uint64_t a23,dispatch_group_t group,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  unint64_t *v47;
  std::__shared_weak_count *v48;
  void **v49;
  unint64_t *p_shared_owners;
  unint64_t v52;
  void **v53;
  void **v54;
  unint64_t v55;
  NSObject *v56;
  NSObject *v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;

  p_shared_owners = (unint64_t *)&v48->__shared_owners_;
  do
    v52 = __ldaxr(p_shared_owners);
  while (__stlxr(v52 - 1, p_shared_owners));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
  if (__p)
  {
    v53 = v49;
    v54 = __p;
    if (v49 != __p)
    {
      do
      {
        if (*((char *)v53 - 1) < 0)
          operator delete(*(v53 - 3));
        v53 -= 3;
      }
      while (v53 != __p);
      v54 = __p;
    }
    operator delete(v54);
  }
  do
    v55 = __ldaxr(v47);
  while (__stlxr(v55 - 1, v47));
  if (!v55)
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  v56 = a10[1];
  if (v56)
  {
    dispatch_group_leave(v56);
    v57 = a10[1];
    if (v57)
      dispatch_release(v57);
  }
  operator delete(a10);
  v58 = (std::__shared_weak_count *)a11[2];
  if (v58)
  {
    v59 = (unint64_t *)&v58->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void ServiceCtrl::clearCommandHandlers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  void **v6;
  void **v7;
  void *v8;
  uint64_t v9;
  void *__p;
  void **v11;
  uint64_t v12;
  _QWORD block[6];

  v4 = a1 + 72;
  v9 = a1;
  __p = 0;
  v11 = 0;
  v12 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, a2, a3, 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 3));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke;
  block[3] = &__block_descriptor_tmp_19_3;
  block[4] = v4;
  block[5] = &v9;
  v5 = *(NSObject **)(a1 + 88);
  if (*(_QWORD *)(a1 + 96))
  {
    dispatch_async_and_wait(v5, block);
    v6 = (void **)__p;
    if (!__p)
      return;
  }
  else
  {
    dispatch_sync(v5, block);
    v6 = (void **)__p;
    if (!__p)
      return;
  }
  v7 = v11;
  v8 = v6;
  if (v11 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0)
        operator delete(*(v7 - 3));
      v7 -= 3;
    }
    while (v7 != v6);
    v8 = __p;
  }
  v11 = v6;
  operator delete(v8);
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  const void **v2;
  const void **v3;
  uint64_t v4;
  uint64_t **v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t *v13;
  const void *v14;

  v1 = *(_QWORD **)(a1 + 40);
  v2 = (const void **)v1[1];
  v3 = (const void **)v1[2];
  if (v2 != v3)
  {
    v4 = *v1;
    v5 = (uint64_t **)(*v1 + 120);
    v6 = *v1 + 128;
    do
    {
      v7 = std::__tree<std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,xpc::dict>>>>::find<std::string>((uint64_t)v5, v2);
      if ((uint64_t *)v6 != v7)
      {
        v8 = v7;
        v9 = (uint64_t *)v7[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (uint64_t *)*v9;
          }
          while (v9);
        }
        else
        {
          v11 = v7;
          do
          {
            v10 = (uint64_t *)v11[2];
            v12 = *v10 == (_QWORD)v11;
            v11 = v10;
          }
          while (!v12);
        }
        if (*v5 == v7)
          *v5 = v10;
        v13 = *(uint64_t **)(v4 + 128);
        --*(_QWORD *)(v4 + 136);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v8);
        v14 = (const void *)v8[7];
        if (v14)
          _Block_release(v14);
        if (*((char *)v8 + 55) < 0)
          operator delete((void *)v8[4]);
        operator delete(v8);
      }
      v2 += 3;
    }
    while (v2 != v3);
  }
}

void dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  _QWORD *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  NSObject *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  v2 = *(_QWORD **)a1;
  v3 = *((_QWORD *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = v2;
  v8[1] = v3;
  v9 = v2[11];
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v9, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v14 = *((_QWORD *)a1 + 2);
  if (v14)
  {
    dispatch_group_leave(v14);
    v15 = *((_QWORD *)a1 + 2);
    if (v15)
      dispatch_release(v15);
  }
  v16 = *((_QWORD *)a1 + 1);
  if (v16)
    dispatch_release(v16);
  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  NSObject **v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  _BYTE *v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  dispatch_time_t v25;
  intptr_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::string *v35;
  __int128 v36;
  __int128 *v37;
  unint64_t *v38;
  unint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  std::ios_base *v43;
  _QWORD *v44;
  _QWORD *v45;
  std::string *p_p;
  size_t v47;
  NSObject *v48;
  __int128 *v49;
  std::string *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  std::__shared_weak_count *v54;
  _QWORD *v55;
  unint64_t *v56;
  NSObject **v57;
  _QWORD *v58;
  _QWORD *v59;
  NSObject *v60;
  uint64_t v61;
  const char *v62;
  size_t v63;
  __int128 *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  dispatch_time_t v72;
  intptr_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t *v76;
  std::__shared_weak_count *v77;
  std::__shared_weak_count *v78;
  std::__shared_weak_count *v79;
  uint64_t v80;
  _OWORD *size;
  __int128 v82;
  std::string *v83;
  unint64_t *v84;
  unint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  std::ios_base *v91;
  _QWORD *v92;
  _QWORD *v93;
  std::string *v94;
  size_t v95;
  NSObject *v96;
  std::string::size_type v97;
  std::string::size_type v98;
  void *v99;
  NSObject *v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  NSObject *v104;
  NSObject *v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  std::string::size_type v109;
  std::string *v110;
  std::string::size_type v111;
  std::string *v112;
  uint64_t v113;
  const void **v114;
  uint64_t v115;
  const void **v116;
  const void *v117;
  uint64_t v118;
  uint64_t v119;
  std::string *v120;
  const void *v121;
  uint64_t v122;
  uint64_t v123;
  std::string *v124;
  std::__shared_weak_count *v125;
  uint64_t *v126;
  uint64_t **v127;
  std::__shared_weak_count *v128;
  uint64_t v129;
  dispatch_group_t object;
  std::string __p;
  void *v132;
  std::string *v133;
  unint64_t v134;
  dispatch_group_t group;
  void *__dst[2];
  unint64_t v137;
  uint8_t v138[4];
  std::string *v139;
  std::string v140;
  _BYTE buf[24];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = **a1;
  (***(void (****)(_QWORD))(v3 + 104))(*(_QWORD *)(v3 + 104));
  v4 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (uint64_t)(*(_QWORD *)(v3 + 152) - *(_QWORD *)(v3 + 144)) >> 4;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_24B855000, v4, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd services", buf, 0xCu);
  }
  v126 = v2;
  v127 = a1;
  v6 = dispatch_group_create();
  v7 = (std::__shared_weak_count *)operator new(0x38uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  v9 = (NSObject **)&v7[1];
  v125 = v7;
  if (!v6)
  {
    v7[1].__shared_owners_ = 0;
    v7[1].__shared_weak_owners_ = 0;
    v7[2].__vftable = 0;
    v11 = *(_QWORD **)(v3 + 144);
    v12 = *(_QWORD **)(v3 + 152);
    v129 = v3;
    if (v11 == v12)
      goto LABEL_30;
    while (1)
    {
LABEL_9:
      v13 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v11 + 16))(*v11);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_24B855000, v13, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      v15 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v11 + 16))(*v11);
      v16 = strlen(v15);
      if (v16 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v17 = (_BYTE *)v16;
      if (v16 >= 0x17)
        break;
      HIBYTE(v137) = v16;
      v18 = __dst;
      if (v16)
        goto LABEL_18;
LABEL_19:
      v3 = v129;
      v17[(_QWORD)v18] = 0;
      ctu::TrackedGroup::fork((NSObject **)buf, (uint64_t)v9, (uint64_t)__dst);
      if (SHIBYTE(v137) < 0)
      {
        operator delete(__dst[0]);
        v21 = *v11;
        v22 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
        {
LABEL_23:
          dispatch_retain(v22);
          if (group)
            dispatch_group_enter(group);
        }
      }
      else
      {
        v21 = *v11;
        v22 = *(NSObject **)buf;
        group = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
          goto LABEL_23;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v21 + 32))(v21, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v22)
      {
        dispatch_group_leave(v22);
        dispatch_release(v22);
      }
      v11 += 2;
      if (v11 == v12)
        goto LABEL_30;
    }
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v18 = (void **)operator new(v19 + 1);
    __dst[1] = v17;
    v137 = v20 | 0x8000000000000000;
    __dst[0] = v18;
LABEL_18:
    memmove(v18, v15, (size_t)v17);
    goto LABEL_19;
  }
  v10 = &v7->__vftable;
  dispatch_retain(v6);
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = 0;
  dispatch_release(v6);
  v11 = *(_QWORD **)(v3 + 144);
  v12 = *(_QWORD **)(v3 + 152);
  v129 = v3;
  if (v11 != v12)
    goto LABEL_9;
LABEL_30:
  v23 = *v9;
  v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 88))(v3);
  v25 = dispatch_time(0, 1000000000 * v24);
  v26 = dispatch_group_wait(v23, v25);
  v27 = MEMORY[0x24BEDB870];
  v28 = (_QWORD *)MEMORY[0x24BEDB800];
  if (!v26)
    goto LABEL_63;
  v132 = 0;
  v133 = 0;
  v134 = 0;
  shared_owners = (uint64_t *)v125[1].__shared_owners_;
  shared_weak_owners = (uint64_t *)v125[1].__shared_weak_owners_;
  while (shared_owners != shared_weak_owners)
  {
    v31 = (std::__shared_weak_count *)shared_owners[1];
    if (v31)
    {
      v32 = std::__shared_weak_count::lock(v31);
      if (v32)
      {
        v33 = v32;
        v34 = *shared_owners;
        if (*shared_owners)
        {
          v35 = v133;
          if ((unint64_t)v133 >= v134)
          {
            v37 = (__int128 *)std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)&v132, v34);
          }
          else
          {
            if (*(char *)(v34 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v133, *(const std::string::value_type **)v34, *(_QWORD *)(v34 + 8));
            }
            else
            {
              v36 = *(_OWORD *)v34;
              v133->__r_.__value_.__r.__words[2] = *(_QWORD *)(v34 + 16);
              *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
            }
            v37 = (__int128 *)&v35[1];
          }
          v133 = (std::string *)v37;
        }
        v38 = (unint64_t *)&v33->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
    }
    shared_owners += 2;
  }
  *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v147 = v40;
  v156 = v40;
  v155 = v40;
  v154 = v40;
  v153 = v40;
  v152 = v40;
  v151 = v40;
  v150 = v40;
  v149 = v40;
  v148 = v40;
  v146 = v40;
  v145 = v40;
  v144 = v40;
  v143 = v40;
  v142 = v40;
  *(_OWORD *)&buf[8] = v40;
  v41 = v28[1];
  v42 = v28[2];
  *((_QWORD *)&v147 + 1) = v27 + 64;
  *(_QWORD *)buf = v41;
  *(_QWORD *)&buf[*(_QWORD *)(v41 - 24)] = v42;
  v43 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v43, &buf[8]);
  v43[1].__vftable = 0;
  v43[1].__fmtflags_ = -1;
  *(_QWORD *)buf = v27 + 24;
  *((_QWORD *)&v147 + 1) = v27 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  v145 = 0u;
  v146 = 0u;
  LODWORD(v147) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  v44 = (_QWORD *)std::ostream::operator<<();
  v45 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)" clients failed to complete init stage: ", 40);
  p_p = &__p;
  ctu::join<std::__wrap_iter<std::string *>>(&__p, (std::string *)v132, (__int128 *)v133);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v47 = strlen((const char *)p_p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)p_p, v47);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v48 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    if ((v147 & 0x10) != 0)
    {
      v113 = *((_QWORD *)&v146 + 1);
      if (*((_QWORD *)&v146 + 1) < (unint64_t)v144)
      {
        *((_QWORD *)&v146 + 1) = v144;
        v113 = v144;
      }
      v114 = (const void **)&v143 + 1;
    }
    else
    {
      if ((v147 & 8) == 0)
      {
        v109 = 0;
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
        v110 = &__p;
LABEL_166:
        v110->__r_.__value_.__s.__data_[v109] = 0;
        v120 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v120 = (std::string *)__p.__r_.__value_.__r.__words[0];
        LODWORD(v140.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v140.__r_.__value_.__r.__words + 4) = (std::string::size_type)v120;
        _os_log_error_impl(&dword_24B855000, v48, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v140, 0xCu);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v28 = (_QWORD *)MEMORY[0x24BEDB800];
        goto LABEL_53;
      }
      v114 = (const void **)&v142;
      v113 = v143;
    }
    v117 = *v114;
    v109 = v113 - (_QWORD)*v114;
    if (v109 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v109 >= 0x17)
    {
      v118 = (v109 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v109 | 7) != 0x17)
        v118 = v109 | 7;
      v119 = v118 + 1;
      v110 = (std::string *)operator new(v118 + 1);
      __p.__r_.__value_.__l.__size_ = v109;
      __p.__r_.__value_.__r.__words[2] = v119 | 0x8000000000000000;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v110;
    }
    else
    {
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v113 - *(_BYTE *)v114;
      v110 = &__p;
      if (!v109)
        goto LABEL_165;
    }
    memmove(v110, v117, v109);
LABEL_165:
    v3 = v129;
    goto LABEL_166;
  }
LABEL_53:
  *(_QWORD *)buf = *v28;
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v28[3];
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  if (SBYTE7(v146) < 0)
    operator delete((void *)v145);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD29B5C]((char *)&v147 + 8);
  v49 = (__int128 *)v132;
  if (v132)
  {
    v50 = v133;
    v51 = v132;
    if (v133 != v132)
    {
      do
      {
        if (SHIBYTE(v50[-1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v50[-1].__r_.__value_.__l.__data_);
        --v50;
      }
      while (v50 != (std::string *)v49);
      v51 = v132;
    }
    v133 = (std::string *)v49;
    operator delete(v51);
  }
LABEL_63:
  v52 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v52, OS_LOG_TYPE_DEFAULT, "#I All services initialized; Starting them now!", buf, 2u);
  }
  v53 = dispatch_group_create();
  v54 = (std::__shared_weak_count *)operator new(0x38uLL);
  v55 = &v54->__vftable;
  v54->__shared_owners_ = 0;
  v56 = (unint64_t *)&v54->__shared_owners_;
  v54->__shared_weak_owners_ = 0;
  v54->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
  v54[1].__vftable = (std::__shared_weak_count_vtbl *)v53;
  v57 = (NSObject **)&v54[1];
  v128 = v54;
  if (!v53)
  {
    v54[1].__shared_owners_ = 0;
    v54[1].__shared_weak_owners_ = 0;
    v54[2].__vftable = 0;
    v58 = *(_QWORD **)(v3 + 144);
    v59 = *(_QWORD **)(v3 + 152);
    if (v58 == v59)
      goto LABEL_92;
    while (1)
    {
LABEL_71:
      v60 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v58 + 16))(*v58);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v61;
        _os_log_impl(&dword_24B855000, v60, OS_LOG_TYPE_DEFAULT, "#I Starting '%s'", buf, 0xCu);
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      v62 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v58 + 16))(*v58);
      v63 = strlen(v62);
      if (v63 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v64 = (__int128 *)v63;
      if (v63 >= 0x17)
        break;
      HIBYTE(v134) = v63;
      v65 = &v132;
      if (v63)
        goto LABEL_80;
LABEL_81:
      *((_BYTE *)v64 + (_QWORD)v65) = 0;
      ctu::TrackedGroup::fork((NSObject **)buf, (uint64_t)v57, (uint64_t)&v132);
      if (SHIBYTE(v134) < 0)
      {
        operator delete(v132);
        v68 = *v58;
        v69 = *(NSObject **)buf;
        object = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
        {
LABEL_85:
          dispatch_retain(v69);
          if (object)
            dispatch_group_enter(object);
        }
      }
      else
      {
        v68 = *v58;
        v69 = *(NSObject **)buf;
        object = *(dispatch_group_t *)buf;
        if (*(_QWORD *)buf)
          goto LABEL_85;
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(_QWORD *)v68 + 40))(v68, &object);
      if (object)
      {
        dispatch_group_leave(object);
        if (object)
          dispatch_release(object);
      }
      if (v69)
      {
        dispatch_group_leave(v69);
        dispatch_release(v69);
      }
      v58 += 2;
      v3 = v129;
      if (v58 == v59)
        goto LABEL_92;
    }
    v66 = (v63 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v63 | 7) != 0x17)
      v66 = v63 | 7;
    v67 = v66 + 1;
    v65 = operator new(v66 + 1);
    v133 = (std::string *)v64;
    v134 = v67 | 0x8000000000000000;
    v132 = v65;
LABEL_80:
    memmove(v65, v62, (size_t)v64);
    goto LABEL_81;
  }
  dispatch_retain(v53);
  v55[4] = 0;
  v55[5] = 0;
  v55[6] = 0;
  dispatch_release(v53);
  v58 = *(_QWORD **)(v3 + 144);
  v59 = *(_QWORD **)(v3 + 152);
  if (v58 != v59)
    goto LABEL_71;
LABEL_92:
  atomic_store(0, (unsigned __int8 *)(v3 + 192));
  v70 = *v57;
  v71 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 96))(v3);
  v72 = dispatch_time(0, 1000000000 * v71);
  v73 = dispatch_group_wait(v70, v72);
  v74 = MEMORY[0x24BEDB800];
  if (!v73)
    goto LABEL_125;
  memset(&__p, 0, sizeof(__p));
  v75 = (uint64_t *)v128[1].__shared_owners_;
  v76 = (uint64_t *)v128[1].__shared_weak_owners_;
  while (v75 != v76)
  {
    v77 = (std::__shared_weak_count *)v75[1];
    if (v77)
    {
      v78 = std::__shared_weak_count::lock(v77);
      if (v78)
      {
        v79 = v78;
        v80 = *v75;
        if (*v75)
        {
          size = (_OWORD *)__p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            v83 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(&__p.__r_.__value_.__l.__data_, v80);
          }
          else
          {
            if (*(char *)(v80 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p.__r_.__value_.__l.__size_, *(const std::string::value_type **)v80, *(_QWORD *)(v80 + 8));
            }
            else
            {
              v82 = *(_OWORD *)v80;
              *(_QWORD *)(__p.__r_.__value_.__l.__size_ + 16) = *(_QWORD *)(v80 + 16);
              *size = v82;
            }
            v83 = (std::string *)((char *)size + 24);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v83;
        }
        v84 = (unint64_t *)&v79->__shared_owners_;
        do
          v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
    }
    v75 += 2;
  }
  *(_QWORD *)&v86 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v86 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v147 = v86;
  v156 = v86;
  v155 = v86;
  v154 = v86;
  v153 = v86;
  v152 = v86;
  v151 = v86;
  v150 = v86;
  v149 = v86;
  v148 = v86;
  v146 = v86;
  v145 = v86;
  v144 = v86;
  v143 = v86;
  v142 = v86;
  *(_OWORD *)&buf[8] = v86;
  v87 = MEMORY[0x24BEDB870];
  v88 = MEMORY[0x24BEDB870] + 64;
  v89 = *(_QWORD *)(v74 + 8);
  v90 = *(_QWORD *)(v74 + 16);
  *((_QWORD *)&v147 + 1) = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)buf = v89;
  *(_QWORD *)&buf[*(_QWORD *)(v89 - 24)] = v90;
  v91 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v91, &buf[8]);
  v91[1].__vftable = 0;
  v91[1].__fmtflags_ = -1;
  *(_QWORD *)buf = v87 + 24;
  *((_QWORD *)&v147 + 1) = v88;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  v145 = 0u;
  v146 = 0u;
  LODWORD(v147) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Start TIMEOUT: ", 15);
  v92 = (_QWORD *)std::ostream::operator<<();
  v93 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v92, (uint64_t)" clients failed to complete start stage: ", 41);
  v94 = &v140;
  ctu::join<std::__wrap_iter<std::string *>>(&v140, (std::string *)__p.__r_.__value_.__l.__data_, (__int128 *)__p.__r_.__value_.__l.__size_);
  if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v94 = (std::string *)v140.__r_.__value_.__r.__words[0];
  v95 = strlen((const char *)v94);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v93, (uint64_t)v94, v95);
  if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v140.__r_.__value_.__l.__data_);
  v96 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    if ((v147 & 0x10) != 0)
    {
      v115 = *((_QWORD *)&v146 + 1);
      if (*((_QWORD *)&v146 + 1) < (unint64_t)v144)
      {
        *((_QWORD *)&v146 + 1) = v144;
        v115 = v144;
      }
      v116 = (const void **)&v143 + 1;
    }
    else
    {
      if ((v147 & 8) == 0)
      {
        v111 = 0;
        *((_BYTE *)&v140.__r_.__value_.__s + 23) = 0;
        v112 = &v140;
        goto LABEL_180;
      }
      v116 = (const void **)&v142;
      v115 = v143;
    }
    v121 = *v116;
    v111 = v115 - (_QWORD)*v116;
    if (v111 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v111 >= 0x17)
    {
      v122 = (v111 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v111 | 7) != 0x17)
        v122 = v111 | 7;
      v123 = v122 + 1;
      v112 = (std::string *)operator new(v122 + 1);
      v140.__r_.__value_.__l.__size_ = v111;
      v140.__r_.__value_.__r.__words[2] = v123 | 0x8000000000000000;
      v140.__r_.__value_.__r.__words[0] = (std::string::size_type)v112;
    }
    else
    {
      *((_BYTE *)&v140.__r_.__value_.__s + 23) = v115 - *(_BYTE *)v116;
      v112 = &v140;
      if (!v111)
        goto LABEL_180;
    }
    memmove(v112, v121, v111);
LABEL_180:
    v112->__r_.__value_.__s.__data_[v111] = 0;
    v124 = &v140;
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v124 = (std::string *)v140.__r_.__value_.__r.__words[0];
    *(_DWORD *)v138 = 136315138;
    v139 = v124;
    _os_log_error_impl(&dword_24B855000, v96, OS_LOG_TYPE_ERROR, "%s", v138, 0xCu);
    if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v140.__r_.__value_.__l.__data_);
    v3 = v129;
  }
  *(_QWORD *)buf = *MEMORY[0x24BEDB800];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
  if (SBYTE7(v146) < 0)
    operator delete((void *)v145);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD29B5C]((char *)&v147 + 8);
  v97 = __p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    v98 = __p.__r_.__value_.__l.__size_;
    v99 = (void *)__p.__r_.__value_.__r.__words[0];
    if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(v98 - 1) < 0)
          operator delete(*(void **)(v98 - 24));
        v98 -= 24;
      }
      while (v98 != v97);
      v99 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    __p.__r_.__value_.__l.__size_ = v97;
    operator delete(v99);
  }
LABEL_125:
  v100 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B855000, v100, OS_LOG_TYPE_DEFAULT, "#I All services started", buf, 2u);
  }
  v101 = *(_QWORD *)(v3 + 104);
  *(_QWORD *)buf = operator new(0x30uLL);
  *(_OWORD *)&buf[8] = xmmword_24B953EB0;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v101 + 32))(v101, buf);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  do
    v102 = __ldaxr(v56);
  while (__stlxr(v102 - 1, v56));
  if (!v102)
  {
    ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
    std::__shared_weak_count::__release_weak(v128);
  }
  do
    v103 = __ldaxr(p_shared_owners);
  while (__stlxr(v103 - 1, p_shared_owners));
  if (!v103)
  {
    ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
    std::__shared_weak_count::__release_weak(v125);
  }
  v104 = v126[1];
  if (v104)
  {
    dispatch_group_leave(v104);
    v105 = v126[1];
    if (v105)
      dispatch_release(v105);
  }
  operator delete(v126);
  v106 = (std::__shared_weak_count *)v127[2];
  if (v106)
  {
    v107 = (unint64_t *)&v106->__shared_owners_;
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
      std::__shared_weak_count::__release_weak(v106);
    }
  }
  operator delete(v127);
}

void sub_24B94CF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, _QWORD *a10, _QWORD *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_group_t group, void **__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,dispatch_group_t object,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62)
{
  unint64_t *v62;
  unint64_t *v63;
  std::__shared_weak_count *v64;
  void **v65;
  unint64_t *p_shared_owners;
  unint64_t v68;
  void **v69;
  void **v70;
  unint64_t v71;
  unint64_t v72;
  NSObject *v73;
  NSObject *v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;

  p_shared_owners = (unint64_t *)&v64->__shared_owners_;
  do
    v68 = __ldaxr(p_shared_owners);
  while (__stlxr(v68 - 1, p_shared_owners));
  if (!v68)
  {
    ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
    std::__shared_weak_count::__release_weak(v64);
  }
  if (__p)
  {
    v69 = v65;
    v70 = __p;
    if (v65 != __p)
    {
      do
      {
        if (*((char *)v69 - 1) < 0)
          operator delete(*(v69 - 3));
        v69 -= 3;
      }
      while (v69 != __p);
      v70 = __p;
    }
    operator delete(v70);
  }
  do
    v71 = __ldaxr(v63);
  while (__stlxr(v71 - 1, v63));
  if (!v71)
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  do
    v72 = __ldaxr(v62);
  while (__stlxr(v72 - 1, v62));
  if (!v72)
  {
    ((void (*)(std::__shared_weak_count *))a9->__on_zero_shared)(a9);
    std::__shared_weak_count::__release_weak(a9);
  }
  v73 = a10[1];
  if (v73)
  {
    dispatch_group_leave(v73);
    v74 = a10[1];
    if (v74)
      dispatch_release(v74);
  }
  operator delete(a10);
  v75 = (std::__shared_weak_count *)a11[2];
  if (v75)
  {
    v76 = (unint64_t *)&v75->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  _QWORD *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  NSObject *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  v2 = *(_QWORD **)a1;
  v3 = *((_QWORD *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = v2;
  v8[1] = v3;
  v9 = v2[11];
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v9, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v14 = *((_QWORD *)a1 + 2);
  if (v14)
  {
    dispatch_group_leave(v14);
    v15 = *((_QWORD *)a1 + 2);
    if (v15)
      dispatch_release(v15);
  }
  v16 = *((_QWORD *)a1 + 1);
  if (v16)
    dispatch_release(v16);
  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(std::__shared_weak_count **a1)
{
  std::__shared_weak_count_vtbl *v1;
  NSObject *v2;
  uint64_t v3;
  void (__cdecl *on_zero_shared_weak)(std::__shared_weak_count *__hidden);
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  _QWORD *v9;
  _QWORD **v10;
  _QWORD *v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _BYTE *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _QWORD *v31;
  void (__cdecl *v32)(std::__shared_weak_count *__hidden);
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD **v52;
  NSObject *v53;
  std::__shared_weak_count *v54;
  _QWORD *v55;
  unint64_t *p_shared_owners;
  NSObject **v57;
  _QWORD *v58;
  _QWORD *v59;
  NSObject *v60;
  unint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  size_t v65;
  size_t v66;
  __int128 *p_dst;
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  dispatch_time_t v79;
  uint64_t *shared_owners;
  uint64_t *shared_weak_owners;
  std::__shared_weak_count *v82;
  std::__shared_weak_count *v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  _OWORD *v86;
  __int128 v87;
  std::string *v88;
  unint64_t *v89;
  unint64_t v90;
  __int128 v91;
  std::ios_base *v92;
  _QWORD *v93;
  unint64_t v94;
  const char *v95;
  size_t v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  std::string *v100;
  size_t v101;
  NSObject *v102;
  NSObject *v103;
  unint64_t v104;
  const char *v105;
  uint64_t v106;
  uint8_t *v107;
  const void *v108;
  std::string::size_type v109;
  std::string *v110;
  uint64_t v111;
  uint64_t v112;
  std::string *v113;
  void **v114;
  void **v115;
  void *v116;
  unint64_t v117;
  _QWORD *v118;
  _QWORD **v119;
  void *v120;
  void (__cdecl *v121)(std::__shared_weak_count *__hidden);
  uint64_t v122;
  uint64_t v123;
  void **v124;
  void **v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void (__cdecl *v129)(std::__shared_weak_count *__hidden);
  const void *(__cdecl *get_deleter)(const std::__shared_weak_count *__hidden, const std::type_info *);
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  std::__shared_weak_count **v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  std::__shared_weak_count *v138;
  unint64_t *v139;
  unint64_t v140;
  std::__shared_weak_count *v141;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  std::__shared_weak_count *v149;
  unsigned __int8 *v150;
  std::__shared_weak_count_vtbl *v151;
  std::string v152;
  dispatch_group_t group;
  __int128 __dst;
  unint64_t v155;
  dispatch_object_t object;
  _QWORD **v157;
  _QWORD *v158;
  uint64_t v159;
  void *__p[2];
  void *v161;
  uint8_t v162[16];
  uint8_t buf[56];
  __int128 v164;
  __int128 v165;
  __int128 v166;
  unint64_t v167;
  uint64_t v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;

  v178 = *MEMORY[0x24BDAC8D0];
  v141 = *a1;
  v1 = (*a1)->__vftable;
  v2 = v1[1].~__shared_weak_count;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = ((char *)v1[3].__on_zero_shared_weak - (char *)v1[3].__get_deleter) >> 4;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_24B855000, v2, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd dynamic services", buf, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&v1[4].__on_zero_shared_weak);
  v158 = 0;
  v159 = 0;
  v151 = v1;
  v157 = &v158;
  on_zero_shared_weak = v1[3].__on_zero_shared_weak;
  if (on_zero_shared_weak == (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter)
    goto LABEL_191;
  while (2)
  {
    memset(buf, 170, 24);
    v5 = *((_QWORD *)on_zero_shared_weak - 2);
    on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
    (*(void (**)(uint8_t *__return_ptr))(*(_QWORD *)v5 + 24))(buf);
    v6 = *(unsigned __int8 **)buf;
    v7 = *(unsigned __int8 **)&buf[8];
    v150 = *(unsigned __int8 **)&buf[8];
    if (*(_QWORD *)buf == *(_QWORD *)&buf[8])
    {
      if (*(_QWORD *)buf)
        goto LABEL_73;
      goto LABEL_5;
    }
    do
    {
      while (1)
      {
        v8 = *v6;
        v9 = v158;
        v10 = &v158;
LABEL_12:
        v11 = v10;
        if (v9)
          break;
LABEL_17:
        v13 = operator new(0x40uLL);
        v14 = v13;
        *((_BYTE *)v13 + 32) = v8;
        v13[6] = 0;
        v13[7] = 0;
        v13[5] = 0;
        *v13 = 0;
        v13[1] = 0;
        v13[2] = v10;
        *v11 = v13;
        v15 = v13;
        if (*v157)
        {
          v157 = (_QWORD **)*v157;
          v15 = (_QWORD *)*v11;
        }
        v16 = v158;
        v17 = v15 == v158;
        *((_BYTE *)v15 + 24) = v15 == v158;
        if (!v17)
        {
          do
          {
            v18 = v15[2];
            if (*(_BYTE *)(v18 + 24))
              break;
            v19 = *(_QWORD **)(v18 + 16);
            v20 = *v19;
            if (*v19 == v18)
            {
              v23 = v19[1];
              if (!v23 || (v24 = *(unsigned __int8 *)(v23 + 24), v21 = (_BYTE *)(v23 + 24), v24))
              {
                if (*(_QWORD **)v18 == v15)
                {
                  *(_BYTE *)(v18 + 24) = 1;
                  *((_BYTE *)v19 + 24) = 0;
                  v27 = *(_QWORD *)(v18 + 8);
                  *v19 = v27;
                  if (v27)
                    goto LABEL_34;
                }
                else
                {
                  v25 = *(uint64_t **)(v18 + 8);
                  v26 = *v25;
                  *(_QWORD *)(v18 + 8) = *v25;
                  if (v26)
                  {
                    *(_QWORD *)(v26 + 16) = v18;
                    v19 = *(_QWORD **)(v18 + 16);
                  }
                  v25[2] = (uint64_t)v19;
                  *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v25;
                  *v25 = v18;
                  *(_QWORD *)(v18 + 16) = v25;
                  v19 = (_QWORD *)v25[2];
                  v18 = *v19;
                  *((_BYTE *)v25 + 24) = 1;
                  *((_BYTE *)v19 + 24) = 0;
                  v27 = *(_QWORD *)(v18 + 8);
                  *v19 = v27;
                  if (v27)
LABEL_34:
                    *(_QWORD *)(v27 + 16) = v19;
                }
                *(_QWORD *)(v18 + 16) = v19[2];
                *(_QWORD *)(v19[2] + 8 * (*(_QWORD *)v19[2] != (_QWORD)v19)) = v18;
                *(_QWORD *)(v18 + 8) = v19;
LABEL_42:
                v19[2] = v18;
                break;
              }
            }
            else if (!v20 || (v22 = *(unsigned __int8 *)(v20 + 24), v21 = (_BYTE *)(v20 + 24), v22))
            {
              if (*(_QWORD **)v18 == v15)
              {
                v51 = v15[1];
                *(_QWORD *)v18 = v51;
                if (v51)
                {
                  *(_QWORD *)(v51 + 16) = v18;
                  v19 = *(_QWORD **)(v18 + 16);
                }
                v15[2] = v19;
                *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v15;
                v15[1] = v18;
                *(_QWORD *)(v18 + 16) = v15;
                v19 = (_QWORD *)v15[2];
                *((_BYTE *)v15 + 24) = 1;
                *((_BYTE *)v19 + 24) = 0;
                v18 = v19[1];
                v31 = *(_QWORD **)v18;
                v19[1] = *(_QWORD *)v18;
                if (v31)
LABEL_40:
                  v31[2] = v19;
              }
              else
              {
                *(_BYTE *)(v18 + 24) = 1;
                *((_BYTE *)v19 + 24) = 0;
                v18 = v19[1];
                v31 = *(_QWORD **)v18;
                v19[1] = *(_QWORD *)v18;
                if (v31)
                  goto LABEL_40;
              }
              *(_QWORD *)(v18 + 16) = v19[2];
              *(_QWORD *)(v19[2] + 8 * (*(_QWORD *)v19[2] != (_QWORD)v19)) = v18;
              *(_QWORD *)v18 = v19;
              goto LABEL_42;
            }
            *(_BYTE *)(v18 + 24) = 1;
            v15 = v19;
            *((_BYTE *)v19 + 24) = v19 == v16;
            *v21 = 1;
          }
          while (v19 != v16);
        }
        ++v159;
        v28 = *(_QWORD *)on_zero_shared_weak;
        v30 = (char *)v13[6];
        v29 = (char *)v13[7];
        if (v30 >= v29)
          goto LABEL_44;
LABEL_9:
        *(_QWORD *)v30 = v28;
        v14[6] = v30 + 8;
        if (++v6 == v7)
          goto LABEL_72;
      }
      while (1)
      {
        v10 = (_QWORD **)v9;
        v12 = *((unsigned __int8 *)v9 + 32);
        if (v8 < v12)
        {
          v9 = *v10;
          goto LABEL_12;
        }
        if (v12 >= v8)
          break;
        v9 = v10[1];
        if (!v9)
        {
          v11 = v10 + 1;
          goto LABEL_17;
        }
      }
      v14 = v10;
      v28 = *(_QWORD *)on_zero_shared_weak;
      v30 = (char *)v10[6];
      v29 = (char *)v10[7];
      if (v30 < v29)
        goto LABEL_9;
LABEL_44:
      v32 = on_zero_shared_weak;
      v33 = (char *)v14[5];
      v34 = (v30 - v33) >> 3;
      v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 61)
        std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
      v36 = v29 - v33;
      if (v36 >> 2 > v35)
        v35 = v36 >> 2;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
        v37 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        if (v37 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v38 = (char *)operator new(8 * v37);
        v39 = &v38[8 * v34];
        *(_QWORD *)v39 = v28;
        v40 = (uint64_t)(v39 + 8);
        v41 = (char *)(v30 - v33);
        if (v30 == v33)
        {
LABEL_62:
          v14[5] = v39;
          v14[6] = v40;
          v14[7] = &v38[8 * v37];
          on_zero_shared_weak = v32;
          v7 = v150;
          if (!v30)
            goto LABEL_64;
LABEL_63:
          operator delete(v30);
          goto LABEL_64;
        }
      }
      else
      {
        v38 = 0;
        v39 = (char *)(8 * v34);
        *(_QWORD *)(8 * v34) = v28;
        v40 = 8 * v34 + 8;
        v41 = (char *)(v30 - v33);
        if (v30 == v33)
          goto LABEL_62;
      }
      v42 = (unint64_t)(v41 - 8);
      if (v42 < 0x58)
        goto LABEL_236;
      if ((unint64_t)(v33 - v38) < 0x20)
        goto LABEL_236;
      v43 = (v42 >> 3) + 1;
      v44 = 8 * (v43 & 0x3FFFFFFFFFFFFFFCLL);
      v45 = &v30[-v44];
      v39 -= v44;
      v46 = &v38[8 * v34 - 16];
      v47 = v30 - 16;
      v48 = v43 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v49 = *(_OWORD *)v47;
        *((_OWORD *)v46 - 1) = *((_OWORD *)v47 - 1);
        *(_OWORD *)v46 = v49;
        v46 -= 32;
        v47 -= 32;
        v48 -= 4;
      }
      while (v48);
      v30 = v45;
      if (v43 != (v43 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_236:
        do
        {
          v50 = *((_QWORD *)v30 - 1);
          v30 -= 8;
          *((_QWORD *)v39 - 1) = v50;
          v39 -= 8;
        }
        while (v30 != v33);
      }
      v30 = (char *)v14[5];
      v14[5] = v39;
      v14[6] = v40;
      v14[7] = &v38[8 * v37];
      on_zero_shared_weak = v32;
      v7 = v150;
      if (v30)
        goto LABEL_63;
LABEL_64:
      v14[6] = v40;
      ++v6;
    }
    while (v6 != v7);
LABEL_72:
    v6 = *(unsigned __int8 **)buf;
    if (*(_QWORD *)buf)
    {
LABEL_73:
      *(_QWORD *)&buf[8] = v6;
      operator delete(v6);
    }
LABEL_5:
    if (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v151[3].__get_deleter)
      continue;
    break;
  }
  v52 = v157;
  if (v157 == &v158)
    goto LABEL_191;
  v145 = *MEMORY[0x24BEDB800];
  v147 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v148 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v144 = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v146 = MEMORY[0x24BEDB870] + 64;
  v143 = MEMORY[0x24BEDB848] + 16;
  while (2)
  {
    v53 = dispatch_group_create();
    v54 = (std::__shared_weak_count *)operator new(0x38uLL);
    v55 = &v54->__vftable;
    v54->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v54->__shared_owners_;
    v54->__shared_weak_owners_ = 0;
    v54->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1238;
    v54[1].__vftable = (std::__shared_weak_count_vtbl *)v53;
    v57 = (NSObject **)&v54[1];
    v149 = v54;
    if (v53)
    {
      dispatch_retain(v53);
      v55[4] = 0;
      v55[5] = 0;
      v55[6] = 0;
      dispatch_release(v53);
    }
    else
    {
      v54[1].__shared_owners_ = 0;
      v54[1].__shared_weak_owners_ = 0;
      v54[2].__vftable = 0;
    }
    v58 = v52[5];
    v59 = v52[6];
    while (2)
    {
      if (v58 != v59)
      {
        v60 = v151[1].~__shared_weak_count;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = *((char *)v52 + 32);
          v62 = "???";
          if (v61 <= 3)
            v62 = (&off_251CC1300)[v61];
          v63 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v58 + 16))(*v58);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v62;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v63;
          _os_log_impl(&dword_24B855000, v60, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s Service=%s", buf, 0x16u);
        }
        object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
        v64 = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v58 + 16))(*v58);
        v65 = strlen(v64);
        if (v65 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v66 = v65;
        if (v65 >= 0x17)
        {
          v68 = (v65 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v65 | 7) != 0x17)
            v68 = v65 | 7;
          v69 = v68 + 1;
          p_dst = (__int128 *)operator new(v68 + 1);
          *((_QWORD *)&__dst + 1) = v66;
          v155 = v69 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
        }
        else
        {
          HIBYTE(v155) = v65;
          p_dst = &__dst;
          if (!v65)
            goto LABEL_95;
        }
        memmove(p_dst, v64, v66);
LABEL_95:
        *((_BYTE *)p_dst + v66) = 0;
        *(_OWORD *)__p = __dst;
        v161 = (void *)v155;
        __dst = 0uLL;
        v155 = 0;
        memset(buf, 0, 48);
        ctu::TrackedGroup::fork(&object, (uint64_t)v57, (uint64_t)__p, (dispatch_group_t *)buf);
        if (*(_QWORD *)&buf[40] && *(_QWORD *)buf)
        {
          v152.__r_.__value_.__r.__words[0] = *(_QWORD *)&buf[8];
          *(_QWORD *)v162 = *(_QWORD *)buf;
          (*(void (**)(void))(**(_QWORD **)&buf[40] + 48))();
        }
        if (*(_QWORD *)&buf[8])
          os_release(*(void **)&buf[8]);
        v70 = *(uint8_t **)&buf[40];
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[40] = 0;
        if (v70 != &buf[16])
        {
          if (v70)
          {
            v71 = 5;
            goto LABEL_104;
          }
          *(_QWORD *)buf = 0;
          if (SHIBYTE(v161) < 0)
          {
LABEL_113:
            operator delete(__p[0]);
            v74 = *v58;
            v75 = *((unsigned __int8 *)v52 + 32);
            v76 = object;
            group = object;
            if (object)
              goto LABEL_114;
            goto LABEL_116;
          }
LABEL_110:
          v74 = *v58;
          v75 = *((unsigned __int8 *)v52 + 32);
          v76 = object;
          group = object;
          if (object)
          {
LABEL_114:
            dispatch_retain(v76);
            if (group)
              dispatch_group_enter(group);
          }
LABEL_116:
          (*(void (**)(uint64_t, uint64_t, dispatch_group_t *))(*(_QWORD *)v74 + 72))(v74, v75, &group);
          if (group)
          {
            dispatch_group_leave(group);
            if (group)
              dispatch_release(group);
          }
          if (v76)
          {
            dispatch_group_leave(v76);
            dispatch_release(v76);
          }
          ++v58;
          continue;
        }
        v70 = &buf[16];
        v71 = 4;
LABEL_104:
        (*(void (**)(void))(*(_QWORD *)v70 + 8 * v71))();
        v72 = *(uint8_t **)&buf[40];
        *(_QWORD *)buf = 0;
        if (*(uint8_t **)&buf[40] == &buf[16])
        {
          v72 = &buf[16];
          v73 = 4;
LABEL_108:
          (*(void (**)(void))(*(_QWORD *)v72 + 8 * v73))();
        }
        else if (*(_QWORD *)&buf[40])
        {
          v73 = 5;
          goto LABEL_108;
        }
        if (SHIBYTE(v161) < 0)
          goto LABEL_113;
        goto LABEL_110;
      }
      break;
    }
    v77 = *v57;
    v78 = (*((uint64_t (**)(std::__shared_weak_count_vtbl *, _QWORD))v151->~__shared_weak_count + 15))(v151, *((unsigned __int8 *)v52 + 32));
    v79 = dispatch_time(0, 1000000000 * v78);
    if (dispatch_group_wait(v77, v79))
    {
      __p[0] = 0;
      __p[1] = 0;
      v161 = 0;
      shared_owners = (uint64_t *)v149[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v149[1].__shared_weak_owners_;
      while (shared_owners != shared_weak_owners)
      {
        v82 = (std::__shared_weak_count *)shared_owners[1];
        if (v82)
        {
          v83 = std::__shared_weak_count::lock(v82);
          if (v83)
          {
            v84 = v83;
            v85 = *shared_owners;
            if (*shared_owners)
            {
              v86 = __p[1];
              if (__p[1] >= v161)
              {
                v88 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v85);
              }
              else
              {
                if (*(char *)(v85 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v85, *(_QWORD *)(v85 + 8));
                }
                else
                {
                  v87 = *(_OWORD *)v85;
                  *((_QWORD *)__p[1] + 2) = *(_QWORD *)(v85 + 16);
                  *v86 = v87;
                }
                v88 = (std::string *)((char *)v86 + 24);
              }
              __p[1] = v88;
            }
            v89 = (unint64_t *)&v84->__shared_owners_;
            do
              v90 = __ldaxr(v89);
            while (__stlxr(v90 - 1, v89));
            if (!v90)
            {
              ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
              std::__shared_weak_count::__release_weak(v84);
            }
          }
        }
        shared_owners += 2;
      }
      *(_QWORD *)&v91 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v91 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v176 = v91;
      v177 = v91;
      v174 = v91;
      v175 = v91;
      v172 = v91;
      v173 = v91;
      v170 = v91;
      v171 = v91;
      v167 = 0xAAAAAAAAAAAAAAAALL;
      v169 = v91;
      v165 = v91;
      v166 = v91;
      *(_OWORD *)&buf[40] = v91;
      v164 = v91;
      *(_OWORD *)&buf[8] = v91;
      *(_OWORD *)&buf[24] = v91;
      v168 = v146;
      *(_QWORD *)buf = v148;
      *(_QWORD *)&buf[*(_QWORD *)(v148 - 24)] = v147;
      v92 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
      std::ios_base::init(v92, &buf[8]);
      v92[1].__vftable = 0;
      v92[1].__fmtflags_ = -1;
      *(_QWORD *)buf = MEMORY[0x24BEDB870] + 24;
      v168 = MEMORY[0x24BEDB870] + 64;
      std::streambuf::basic_streambuf();
      *(_QWORD *)&buf[8] = v143;
      v165 = 0u;
      v166 = 0u;
      LODWORD(v167) = 16;
      v93 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown dynamic service: Stage=", 32);
      v94 = *((char *)v52 + 32);
      v95 = "???";
      if (v94 <= 3)
        v95 = (&off_251CC1300)[v94];
      v96 = strlen(v95);
      v97 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v93, (uint64_t)v95, v96);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v97, (uint64_t)" TIMEOUT: ", 10);
      v98 = (_QWORD *)std::ostream::operator<<();
      v99 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v98, (uint64_t)" clients failed to complete shutdown stage: ", 44);
      ctu::join<std::__wrap_iter<std::string *>>(&v152, (std::string *)__p[0], (__int128 *)__p[1]);
      if ((v152.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v100 = &v152;
      else
        v100 = (std::string *)v152.__r_.__value_.__r.__words[0];
      v101 = strlen((const char *)v100);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v99, (uint64_t)v100, v101);
      if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v152.__r_.__value_.__l.__data_);
        v102 = v151[1].~__shared_weak_count;
        if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          goto LABEL_169;
      }
      else
      {
        v102 = v151[1].~__shared_weak_count;
        if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          goto LABEL_169;
      }
      if ((v167 & 0x10) != 0)
      {
        v106 = *((_QWORD *)&v166 + 1);
        v107 = &buf[48];
        if (*((_QWORD *)&v166 + 1) < (unint64_t)v164)
        {
          *((_QWORD *)&v166 + 1) = v164;
          v106 = v164;
          v107 = &buf[48];
        }
LABEL_157:
        v108 = *(const void **)v107;
        v109 = v106 - *(_QWORD *)v107;
        if (v109 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v109 >= 0x17)
        {
          v111 = (v109 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v109 | 7) != 0x17)
            v111 = v109 | 7;
          v112 = v111 + 1;
          v110 = (std::string *)operator new(v111 + 1);
          v152.__r_.__value_.__l.__size_ = v109;
          v152.__r_.__value_.__r.__words[2] = v112 | 0x8000000000000000;
          v152.__r_.__value_.__r.__words[0] = (std::string::size_type)v110;
        }
        else
        {
          *((_BYTE *)&v152.__r_.__value_.__s + 23) = v106 - *v107;
          v110 = &v152;
          if (!v109)
            goto LABEL_165;
        }
        memmove(v110, v108, v109);
      }
      else
      {
        if ((v167 & 8) != 0)
        {
          v106 = *(_QWORD *)&buf[40];
          v107 = &buf[24];
          goto LABEL_157;
        }
        v109 = 0;
        *((_BYTE *)&v152.__r_.__value_.__s + 23) = 0;
        v110 = &v152;
      }
LABEL_165:
      v110->__r_.__value_.__s.__data_[v109] = 0;
      v113 = &v152;
      if ((v152.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v113 = (std::string *)v152.__r_.__value_.__r.__words[0];
      *(_DWORD *)v162 = 136315138;
      *(_QWORD *)&v162[4] = v113;
      _os_log_error_impl(&dword_24B855000, v102, OS_LOG_TYPE_ERROR, "%s", v162, 0xCu);
      if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v152.__r_.__value_.__l.__data_);
LABEL_169:
      *(_QWORD *)buf = v145;
      *(_QWORD *)&buf[*(_QWORD *)(v145 - 24)] = v144;
      *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
      if (SBYTE7(v166) < 0)
        operator delete((void *)v165);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x24BD29B5C](&v168);
      v114 = (void **)__p[0];
      if (__p[0])
      {
        v115 = (void **)__p[1];
        v116 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v115 - 1) < 0)
              operator delete(*(v115 - 3));
            v115 -= 3;
          }
          while (v115 != v114);
          v116 = __p[0];
        }
        __p[1] = v114;
        operator delete(v116);
      }
    }
    else
    {
      v103 = v151[1].~__shared_weak_count;
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        v104 = *((char *)v52 + 32);
        v105 = "???";
        if (v104 <= 3)
          v105 = (&off_251CC1300)[v104];
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v105;
        _os_log_impl(&dword_24B855000, v103, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s SUCCESS", buf, 0xCu);
      }
    }
    do
      v117 = __ldaxr(p_shared_owners);
    while (__stlxr(v117 - 1, p_shared_owners));
    if (v117)
    {
      v118 = v52[1];
      if (!v118)
        goto LABEL_186;
      do
      {
LABEL_184:
        v119 = (_QWORD **)v118;
        v118 = (_QWORD *)*v118;
      }
      while (v118);
    }
    else
    {
      ((void (*)(std::__shared_weak_count *))v149->__on_zero_shared)(v149);
      std::__shared_weak_count::__release_weak(v149);
      v118 = v52[1];
      if (v118)
        goto LABEL_184;
      do
      {
LABEL_186:
        v119 = (_QWORD **)v52[2];
        v17 = *v119 == v52;
        v52 = v119;
      }
      while (!v17);
    }
    v52 = v119;
    if (v119 != &v158)
      continue;
    break;
  }
  on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v151[3].__get_deleter;
LABEL_191:
  if (v151[3].__on_zero_shared_weak != on_zero_shared_weak)
  {
    on_zero_shared_weak = v151[3].__on_zero_shared_weak;
    do
    {
      v121 = on_zero_shared_weak;
      v122 = *((_QWORD *)on_zero_shared_weak - 2);
      on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
      memset(buf, 0, 24);
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(_QWORD *)(v122 + 24), *(_QWORD *)(v122 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v122 + 32) - *(_QWORD *)(v122 + 24)) >> 3));
      v123 = (uint64_t)v151[4].~__shared_weak_count_0;
      __p[1] = 0;
      v161 = 0;
      __p[0] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(__p, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v123, (uint64_t)__p[0], (uint64_t)__p[1]);
      v124 = (void **)__p[0];
      if (__p[0])
      {
        v125 = (void **)__p[1];
        v126 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v125 - 1) < 0)
              operator delete(*(v125 - 3));
            v125 -= 3;
          }
          while (v125 != v124);
          v126 = __p[0];
        }
        __p[1] = v124;
        operator delete(v126);
      }
      v127 = *(_QWORD *)buf;
      if (*(_QWORD *)buf)
      {
        v128 = *(_QWORD *)&buf[8];
        v120 = *(void **)buf;
        if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
        {
          do
          {
            if (*(char *)(v128 - 1) < 0)
              operator delete(*(void **)(v128 - 24));
            v128 -= 24;
          }
          while (v128 != v127);
          v120 = *(void **)buf;
        }
        *(_QWORD *)&buf[8] = v127;
        operator delete(v120);
      }
    }
    while (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v151[3].__get_deleter);
    v129 = v151[3].__on_zero_shared_weak;
    if (v129 != on_zero_shared_weak)
    {
      do
      {
        v138 = (std::__shared_weak_count *)*((_QWORD *)v129 - 1);
        if (v138)
        {
          v139 = (unint64_t *)&v138->__shared_owners_;
          do
            v140 = __ldaxr(v139);
          while (__stlxr(v140 - 1, v139));
          if (!v140)
          {
            ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
            std::__shared_weak_count::__release_weak(v138);
          }
        }
        v17 = v129 == v121;
        v129 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v129 - 16);
      }
      while (!v17);
    }
  }
  v151[3].__on_zero_shared_weak = on_zero_shared_weak;
  get_deleter = v151[2].__get_deleter;
  *(_QWORD *)buf = operator new(0x30uLL);
  *(_OWORD *)&buf[8] = xmmword_24B953EB0;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *), uint8_t *))(*(_QWORD *)get_deleter + 32))(get_deleter, buf);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *)))(*(_QWORD *)v151[2].__get_deleter + 8))(v151[2].__get_deleter);
  v131 = v151[1].~__shared_weak_count;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v152.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_24B855000, v131, OS_LOG_TYPE_DEFAULT, "#I All dynamic services have shutdown", (uint8_t *)&v152, 2u);
  }
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(v158);
  v132 = v141->__shared_owners_;
  if (v132)
  {
    dispatch_group_leave(v132);
    v133 = v141->__shared_owners_;
    if (v133)
      dispatch_release(v133);
  }
  operator delete(v141);
  v134 = a1;
  v135 = a1[2];
  if (v135)
  {
    v136 = (unint64_t *)&v135->__shared_owners_;
    do
      v137 = __ldaxr(v136);
    while (__stlxr(v137 - 1, v136));
    if (!v137)
    {
      ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
      std::__shared_weak_count::__release_weak(v135);
      v134 = a1;
    }
  }
  operator delete(v134);
}

void sub_24B94E524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9, uint64_t a10, std::__shared_weak_count **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,dispatch_group_t group,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,_QWORD *a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,void *object,int a49,__int16 a50,char a51,char a52)
{
  NSObject *v53;
  NSObject *v54;
  std::__shared_weak_count **v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;

  if (a52 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a39);
  v53 = a9[1];
  if (v53)
  {
    dispatch_group_leave(v53);
    v54 = a9[1];
    if (v54)
      dispatch_release(v54);
  }
  operator delete(a9);
  v55 = a11;
  v56 = a11[2];
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v58 = __ldaxr(p_shared_owners);
    while (__stlxr(v58 - 1, p_shared_owners));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
      v55 = a11;
    }
  }
  operator delete(v55);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(*a1);
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a1[1]);
    v2 = (void *)a1[5];
    if (v2)
    {
      a1[6] = v2;
      operator delete(v2);
    }
    operator delete(a1);
  }
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return MEMORY[0x24BDFD2D8]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x24BDFD300]();
}

uint64_t BBUpdaterRegisterGlobalLogSink()
{
  return MEMORY[0x24BED3468]();
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
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

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
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

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x24BDBC318](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x24BE12320]();
}

uint64_t IOPMClaimSystemWakeEvent()
{
  return MEMORY[0x24BDD8760]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x24BEB0C80]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x24BED8D60]();
}

uint64_t TelephonyBasebandGetBasebandState()
{
  return MEMORY[0x24BED8D88]();
}

uint64_t TelephonyBasebandGetManagerState()
{
  return MEMORY[0x24BED8D90]();
}

uint64_t TelephonyBasebandGetPowerDebugOptions()
{
  return MEMORY[0x24BED8DA0]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x24BED8DA8]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyBasebandPowerDebugUnblock()
{
  return MEMORY[0x24BED8DB8]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x24BED8DC0]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x24BED8DC8]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x24BED8DD8]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x24BED8DE0]();
}

uint64_t TelephonyBasebandResetSPMI()
{
  return MEMORY[0x24BED8DE8]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x24BED8DF0]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x24BED8DF8]();
}

uint64_t TelephonyBasebandSetChargerDesense()
{
  return MEMORY[0x24BED8E00]();
}

uint64_t TelephonyBasebandSetManagerState()
{
  return MEMORY[0x24BED8E08]();
}

uint64_t TelephonyBasebandSetPowerDebugOptions()
{
  return MEMORY[0x24BED8E18]();
}

uint64_t TelephonyBasebandWatchdogStart()
{
  return MEMORY[0x24BED9628]();
}

uint64_t TelephonyBasebandWatchdogStop()
{
  return MEMORY[0x24BED9630]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x24BED96F8]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x24BED9700]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x24BED9638]();
}

uint64_t TelephonyUtilGetSystemWakeReason()
{
  return MEMORY[0x24BED9640]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x24BED9648]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x24BED9650]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x24BED9658]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x24BED9660]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
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

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  return MEMORY[0x24BED90B8](this);
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x24BED90C0](this);
}

uint64_t capabilities::abs::logScratchPath(capabilities::abs *this)
{
  return MEMORY[0x24BED90C8](this);
}

uint64_t capabilities::abs::logSnapshotPath(capabilities::abs *this)
{
  return MEMORY[0x24BED90D0](this);
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  return MEMORY[0x24BED90D8](this);
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return MEMORY[0x24BED90E0](this);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x24BED90E8](this);
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  return MEMORY[0x24BED90F0](this);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  return MEMORY[0x24BED90F8](this);
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  return MEMORY[0x24BED9100](this);
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  return MEMORY[0x24BED9108](this);
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  return MEMORY[0x24BED9110](this);
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x24BED9118](this);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  return MEMORY[0x24BED9120](this);
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  return MEMORY[0x24BED9128](this);
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  return MEMORY[0x24BED9130](this);
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  return MEMORY[0x24BED9140](this);
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  return MEMORY[0x24BED9148](this);
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9150](this);
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9158](this);
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9160](this);
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9168](this);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9170](this);
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9178](this);
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9180](this);
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x24BED9188](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  return MEMORY[0x24BED9190](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  return MEMORY[0x24BED91A0](this);
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  return MEMORY[0x24BED91A8](this);
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x24BED91B0](this);
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  return MEMORY[0x24BED91B8](this);
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  return MEMORY[0x24BED91D0](this);
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x24BED91D8](this);
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  return MEMORY[0x24BED91E0](this);
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  return MEMORY[0x24BED9270](this);
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  return MEMORY[0x24BED9280](this);
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  return MEMORY[0x24BED9288](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x24BED9290](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x24BED9298](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  return MEMORY[0x24BED92B0](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x24BED92B8](this);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x24BED92C0](this);
}

uint64_t capabilities::radio::radioType(capabilities::radio *this)
{
  return MEMORY[0x24BED92D0](this);
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  return MEMORY[0x24BED92D8](this);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  return MEMORY[0x24BED92E0](this);
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  return MEMORY[0x24BED92E8](this);
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  return MEMORY[0x24BED92F0](this);
}

uint64_t capabilities::trace::defaultSleepTraceMode(capabilities::trace *this)
{
  return MEMORY[0x24BED92F8](this);
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  return MEMORY[0x24BED9308](this);
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  return MEMORY[0x24BED9310](this);
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  return MEMORY[0x24BED9318](this);
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  return MEMORY[0x24BED9320](this);
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  return MEMORY[0x24BED9328](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x24BED9330](this);
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  return MEMORY[0x24BED9358](this);
}

uint64_t AppleBasebandManager::setEventHandler()
{
  return MEMORY[0x24BE04DD8]();
}

uint64_t AppleBasebandManager::create()
{
  return MEMORY[0x24BE04DE0]();
}

uint64_t AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  return MEMORY[0x24BE04DE8](this);
}

uint64_t CommandDriverFactory::setRegistry()
{
  return MEMORY[0x24BED3488]();
}

uint64_t CommandDriverFactory::create_default_global(CommandDriverFactory *this)
{
  return MEMORY[0x24BED3490](this);
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  return MEMORY[0x24BE086E0](this);
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, uint64_t a2, BOOL *a3)
{
  return MEMORY[0x24BE086E8](this, a2, a3);
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x24BE086F0](this);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x24BE086F8](this);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats()
{
  return MEMORY[0x24BE08700]();
}

uint64_t abm::HelperClient::registerForHelperReady()
{
  return MEMORY[0x24BDFC6E0]();
}

uint64_t abm::HelperClient::create()
{
  return MEMORY[0x24BDFC6E8]();
}

uint64_t abm::HelperClient::perform()
{
  return MEMORY[0x24BDFC6F0]();
}

{
  return MEMORY[0x24BDFC6F8]();
}

uint64_t abm::trace::isSupported()
{
  return MEMORY[0x24BDFC700]();
}

uint64_t abm::helper::asEnum(abm::helper *this, const char *a2)
{
  return MEMORY[0x24BDFC948](this, a2);
}

uint64_t abm::helper::asString()
{
  return MEMORY[0x24BDFC950]();
}

{
  return MEMORY[0x24BDFC958]();
}

{
  return MEMORY[0x24BDFC960]();
}

{
  return MEMORY[0x24BDFC968]();
}

uint64_t abm::asString()
{
  return MEMORY[0x24BE058B0]();
}

{
  return MEMORY[0x24BE058B8]();
}

{
  return MEMORY[0x24BE058C0]();
}

uint64_t awd::AppContext::setHandler()
{
  return MEMORY[0x24BED34A0]();
}

{
  return MEMORY[0x24BED34A8]();
}

{
  return MEMORY[0x24BED34B0]();
}

uint64_t awd::AppContext::setProperties()
{
  return MEMORY[0x24BED34B8]();
}

uint64_t awd::AwdCommandDriver::checkIn()
{
  return MEMORY[0x24BED34C0]();
}

uint64_t awd::asString()
{
  return MEMORY[0x24BED34D8]();
}

{
  return MEMORY[0x24BED34E8]();
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x24BED97E0]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x24BED97E8]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9828](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x24BED9830]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x24BED9838](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x24BED9840](this);
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x24BED9850]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x24BED9860](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x24BED9870]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x24BED9880]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x24BED9888](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
  MEMORY[0x24BED98A0](this);
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x24BED9918]();
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9968](this);
}

uint64_t ctu::LogMessageBuffer::takeMetadata(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9970](this);
}

uint64_t ctu::LogMessageBuffer::vprintf(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x24BED9988](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9990](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x24BED99A0]();
}

uint64_t ctu::LoggerCommonBase::setInheritedLogLevel()
{
  return MEMORY[0x24BED99A8]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x24BED99B0]();
}

{
  return MEMORY[0x24BED99B8]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x24BED99C8]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x24BED9A78](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
  MEMORY[0x24BED9A80](this);
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x24BED9A88](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x24BED9A90]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED9AA0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x24BED9AB0](this);
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BED9AB8](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
  MEMORY[0x24BED9AC0](this);
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x24BED9AC8](this, a2);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

{
  return MEMORY[0x24BED9AE0]();
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x24BED9AF8](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B10](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned __int16 *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B18](this, a2, a3);
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x24BED9B30]();
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x24BED9B38]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x24BED9B50]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x24BED9B58]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x24BED9B68]();
}

uint64_t ctu::fs::get_filtered_files()
{
  return MEMORY[0x24BED9B70]();
}

uint64_t ctu::fs::get_unique_filename()
{
  return MEMORY[0x24BED9B78]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x24BED9B88]();
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x24BED9C58](this);
}

uint64_t ctu::iokit::Controller::registerForBatteryInfoChange()
{
  return MEMORY[0x24BED9668]();
}

uint64_t ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x24BED9670](this);
}

uint64_t ctu::iokit::Controller::create()
{
  return MEMORY[0x24BED9678]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x24BED9680]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x24BED9688](this);
}

uint64_t ctu::power::manager::asCString(ctu::power::manager *this)
{
  return MEMORY[0x24BED9690](this);
}

uint64_t ctu::power::assertion::createInternal()
{
  return MEMORY[0x24BED9698]();
}

uint64_t ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  return MEMORY[0x24BED96A0](this);
}

uint64_t ctu::assign()
{
  return MEMORY[0x24BED9C60]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x24BED9C78](this);
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x24BED9C98]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x24BED9CA0](this);
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x24BED9CA8]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x24BED9CB0]();
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x24BED9CB8](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x24BED9CC0]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x24BED9CC8]();
}

uint64_t ctu::XpcServer::setListener_sync()
{
  return MEMORY[0x24BED9CE8]();
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x24BED9CF0](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x24BED9CF8]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
  MEMORY[0x24BED9D00](this);
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9D08](this, a2);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D28]();
}

{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D48]();
}

{
  return MEMORY[0x24BED9D58]();
}

uint64_t pci::event::Listener::create()
{
  return MEMORY[0x24BED8A70]();
}

uint64_t wis::WISServerConnection::RegisterCallbackForTimer()
{
  return MEMORY[0x24BEC2B30]();
}

uint64_t wis::WISServerConnection::RegisterQueriableMetricCallbackForIdentifier()
{
  return MEMORY[0x24BEC2B38]();
}

uint64_t wis::WISServerConnection::WISServerConnection(wis::WISServerConnection *this)
{
  return MEMORY[0x24BEC2B40](this);
}

void wis::WISServerConnection::~WISServerConnection(wis::WISServerConnection *this)
{
  MEMORY[0x24BEC2B48](this);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return MEMORY[0x24BED9D68](this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D70]();
}

{
  return MEMORY[0x24BED9D78]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x24BED9D80](this, a2);
}

{
  return MEMORY[0x24BED9D90](this, a2);
}

{
  return MEMORY[0x24BED9D98](this, a2);
}

{
  return MEMORY[0x24BED9DA8](this, a2);
}

{
  return MEMORY[0x24BED9DB0](this, a2);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x24BED9DB8](this, a2);
}

uint64_t diag::config::asEnum()
{
  return MEMORY[0x24BDFC9B0]();
}

uint64_t util::writeJSON()
{
  return MEMORY[0x24BDFC9B8]();
}

uint64_t radio::asStringV2()
{
  return MEMORY[0x24BED3780]();
}

uint64_t radio::CommandDriver::watchClientState()
{
  return MEMORY[0x24BED37B8]();
}

uint64_t radio::CommandDriver::watchOperatingMode()
{
  return MEMORY[0x24BED37D8]();
}

uint64_t radio::RFCalibration_t::fill()
{
  return MEMORY[0x24BED3888]();
}

uint64_t radio::RFCalibration_t::toString(radio::RFCalibration_t *this)
{
  return MEMORY[0x24BED3890](this);
}

uint64_t radio::RFCalibration_t::RFCalibration_t(radio::RFCalibration_t *this)
{
  return MEMORY[0x24BED3898](this);
}

uint64_t radio::BasebandProperties::create()
{
  return MEMORY[0x24BED38B8]();
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(radio::HealthCommandDriver::LinkStats *this)
{
  return MEMORY[0x24BED38C8](this);
}

uint64_t radio::asString()
{
  return MEMORY[0x24BED3940]();
}

{
  return MEMORY[0x24BED3948]();
}

uint64_t trace::toString()
{
  return MEMORY[0x24BE0BF78]();
}

void Factory::Factory(Factory *this)
{
  MEMORY[0x24BED3BA0](this);
}

void Factory::~Factory(Factory *this)
{
  MEMORY[0x24BED3BA8](this);
}

void Registry::Registry(Registry *this)
{
  MEMORY[0x24BED3BB0](this);
}

uint64_t abm::client::Event::name(abm::client::Event *this)
{
  return MEMORY[0x24BE05928](this);
}

uint64_t abm::client::Event::getData(abm::client::Event *this)
{
  return MEMORY[0x24BE05930](this);
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return MEMORY[0x24BED3B10](this);
}

uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return MEMORY[0x24BED3B18](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E60](this);
}

uint64_t ctu::LoggerCommonBase::getLocalLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E68](this);
}

uint64_t ctu::cf::map_adapter::copyCFArrayRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E78](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E80](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E90](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E98](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x24BED9EA8]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x24BED9EC0](this);
}

uint64_t ctu::XpcServer::getListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x24BED9EC8](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x24BED9ED0](this);
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return MEMORY[0x24BED3BB8](this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
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

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB58](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
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
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
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

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB338](__str, __idx, *(_QWORD *)&__base);
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

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_251CB7D28(__p);
}

void operator delete(void *__p)
{
  off_251CB7D30(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_251CB7D38(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CB7D40(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADDE8](group, queue, context, work);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x24BDADF58](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF798](__attr, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF980](*(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x24BDAFEB8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

