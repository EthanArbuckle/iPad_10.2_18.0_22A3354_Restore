void TelephonyBasebandWatchdogStart(NSObject **a1, unsigned int a2, void *a3)
{
  NSObject *global_queue;
  NSObject *v7;
  dispatch_time_t v8;

  global_queue = dispatch_get_global_queue(-2, 0);
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 1uLL, 0, global_queue);
  v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_event_handler(v7, a3);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 500000 * a2);
  dispatch_activate(v7);
  *a1 = v7;
}

void TelephonyBasebandWatchdogStop(dispatch_object_t *a1)
{
  NSObject *v2;

  v2 = *a1;
  if (!v2)
  {
    __TUAssertTrigger();
    v2 = *a1;
  }
  dispatch_source_cancel(v2);
  dispatch_release(*a1);
  *a1 = 0;
}

uint64_t TelephonySystemTrace::TelephonySystemTrace(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  v5 = (std::string *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 32), *(_QWORD *)(a2 + 40));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_BYTE *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = dispatch_queue_create("SystemTrace", 0);
  return a1;
}

void sub_22D8C70C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void TelephonySystemTrace::~TelephonySystemTrace(TelephonySystemTrace *this)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  if (TelephonyUtilTraceAllowed())
  {
    v2 = *((_QWORD *)this + 9);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN20TelephonySystemTraceD2Ev_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = this;
    dispatch_sync(v2, block);
  }
  v3 = *((_QWORD *)this + 9);
  if (v3)
    dispatch_release(v3);
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t ___ZN20TelephonySystemTraceD2Ev_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 56))
  {
    result = TelephonyUtilRunCommand();
    if (!(_DWORD)result)
      *(_BYTE *)(v1 + 56) = 0;
  }
  return result;
}

uint64_t TelephonySystemTrace::stopTrace_sync(TelephonySystemTrace *this)
{
  if (*((_BYTE *)this + 56))
  {
    if (TelephonyUtilRunCommand())
      return 0;
    *((_BYTE *)this + 56) = 0;
  }
  return 1;
}

BOOL TelephonySystemTrace::startTrace_sync(TelephonySystemTrace *this)
{
  _BOOL8 result;

  if (*((_BYTE *)this + 56))
    return 1;
  result = TelephonySystemTrace::setTraceBuffer(this);
  if (result)
  {
    if (TelephonyUtilRunCommand())
    {
      return 0;
    }
    else
    {
      result = 1;
      *((_BYTE *)this + 56) = 1;
    }
  }
  return result;
}

BOOL TelephonySystemTrace::setTraceBuffer(TelephonySystemTrace *this)
{
  std::string *v1;
  int v2;
  std::string v4;
  const char *v5;
  const char *v6;
  const char *v7;
  std::string *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&v4, 170, sizeof(v4));
  std::to_string(&v4, *(_DWORD *)this);
  v5 = "trace";
  v6 = "-i";
  if ((v4.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v1 = &v4;
  else
    v1 = (std::string *)v4.__r_.__value_.__r.__words[0];
  v7 = "-b";
  v8 = v1;
  v9 = 0;
  v2 = TelephonyUtilRunCommand();
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
  return v2 == 0;
}

void sub_22D8C741C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL TelephonySystemTrace::enableTrace(TelephonySystemTrace *this)
{
  return TelephonyUtilRunCommand() == 0;
}

BOOL TelephonySystemTrace::disableTrace(TelephonySystemTrace *this)
{
  return TelephonyUtilRunCommand() == 0;
}

void TelephonySystemTrace::watchdogStart(uint64_t a1, int a2, uint64_t a3, void **a4, void **a5)
{
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  void *v18;
  _QWORD aBlock[5];
  std::string __p;
  void *v21;
  int v22;
  void *v23;
  _QWORD block[5];
  void *v25;

  if (TelephonyUtilTraceAllowed())
  {
    v10 = _Block_copy(&__block_literal_global);
    v25 = v10;
    TelephonySystemTrace::watchdogStop(a1, 0, &v25);
    if (v10)
      _Block_release(v10);
    v11 = MEMORY[0x24BDAC760];
    v12 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_2;
    block[3] = &__block_descriptor_tmp_3;
    block[4] = a1;
    dispatch_async(v12, block);
    aBlock[0] = v11;
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_3;
    aBlock[3] = &__block_descriptor_tmp_8;
    aBlock[4] = a1;
    if (*(char *)(a3 + 23) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
    else
      __p = *(std::string *)a3;
    v22 = a2;
    v13 = *a4;
    if (*a4)
      v13 = _Block_copy(v13);
    v21 = v13;
    v14 = _Block_copy(aBlock);
    v23 = v14;
    TelephonySystemTrace::watchdogStartInternal(a1, a2, &v23);
    if (v14)
      _Block_release(v14);
    v15 = *(NSObject **)(a1 + 72);
    v17[0] = v11;
    v17[1] = 1174405120;
    v17[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_9;
    v17[3] = &__block_descriptor_tmp_10;
    v16 = *a5;
    if (*a5)
      v16 = _Block_copy(v16);
    v18 = v16;
    dispatch_async(v15, v17);
    if (v18)
      _Block_release(v18);
    if (v21)
      _Block_release(v21);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_22D8C7704(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void TelephonySystemTrace::watchdogStop(uint64_t a1, int a2, void **a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  void *aBlock;
  _QWORD v13[5];
  _QWORD block[5];

  if (TelephonyUtilTraceAllowed())
  {
    v6 = MEMORY[0x24BDAC760];
    if (a2)
    {
      v7 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
      block[3] = &__block_descriptor_tmp_12;
      block[4] = a1;
      dispatch_async(v7, block);
    }
    v8 = *(NSObject **)(a1 + 72);
    v13[0] = v6;
    v13[1] = 0x40000000;
    v13[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_2;
    v13[3] = &__block_descriptor_tmp_13;
    v13[4] = a1;
    dispatch_async(v8, v13);
    v9 = *(NSObject **)(a1 + 72);
    v11[0] = v6;
    v11[1] = 1174405120;
    v11[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_3;
    v11[3] = &__block_descriptor_tmp_14;
    v10 = *a3;
    if (*a3)
      v10 = _Block_copy(v10);
    aBlock = v10;
    dispatch_async(v9, v11);
    if (aBlock)
      _Block_release(aBlock);
  }
}

BOOL ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_2(uint64_t a1)
{
  return TelephonySystemTrace::startTrace_sync(*(TelephonySystemTrace **)(a1 + 32));
}

void TelephonySystemTrace::watchdogStartInternal(uint64_t a1, int a2, void **a3)
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  void *aBlock;
  int v7;

  v3 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN20TelephonySystemTrace21watchdogStartInternalEjN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_11;
  block[4] = a1;
  v7 = a2;
  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  aBlock = v4;
  dispatch_async(v3, block);
  if (aBlock)
    _Block_release(aBlock);
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_3(uint64_t a1)
{
  TelephonySystemTrace *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const char *p_dst;
  NSObject *v14;
  void *v15;
  _QWORD block[4];
  void *aBlock;
  uint64_t v19;
  _OWORD v20[4];
  void *__p[2];
  __int128 v22;
  unint64_t v23;
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
  __int128 __dst;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *(TelephonySystemTrace **)(a1 + 32);
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  v33 = v3;
  v32 = v3;
  v31 = v3;
  v30 = v3;
  v29 = v3;
  v28 = v3;
  v27 = v3;
  v26 = v3;
  v25 = v3;
  v22 = v3;
  v20[3] = v3;
  *(_OWORD *)__p = v3;
  v20[1] = v3;
  v20[2] = v3;
  v20[0] = v3;
  v4 = MEMORY[0x24BEDB870];
  v5 = MEMORY[0x24BEDB870] + 64;
  v24 = MEMORY[0x24BEDB870] + 64;
  v6 = (uint64_t *)MEMORY[0x24BEDB800];
  v7 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v19 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v19 + *(_QWORD *)(v19 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v19 + *(_QWORD *)(v19 - 24));
  std::ios_base::init(v8, v20);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v19 = v4 + 24;
  v24 = v5;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v20[0] = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v22 = 0u;
  LODWORD(v23) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)"operation timeout at ", 21);
  v10 = *(char *)(a1 + 63);
  if (v10 >= 0)
    v11 = a1 + 40;
  else
    v11 = *(_QWORD *)(a1 + 40);
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a1 + 63);
  else
    v12 = *(_QWORD *)(a1 + 48);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)", timeout ", 10);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(&__dst, (uint64_t)v20);
  if (v35 >= 0)
    p_dst = (const char *)&__dst;
  else
    p_dst = (const char *)__dst;
  syslog(5, "Watchdog fired: %s\n", p_dst);
  if (SHIBYTE(v35) < 0)
    operator delete((void *)__dst);
  __dst = xmmword_24F95FBE8;
  v35 = 0;
  TelephonyUtilRunCommand();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(&__dst, (uint64_t)v20);
  TelephonyUtilWriteStackshot();
  if (SHIBYTE(v35) < 0)
    operator delete((void *)__dst);
  TelephonySystemTrace::writeTraceBuffer(v2);
  __dst = xmmword_24F95FBD0;
  v35 = 0;
  TelephonyUtilRunCommand();
  v14 = *((_QWORD *)v2 + 9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_4;
  block[3] = &__block_descriptor_tmp_7;
  v15 = *(void **)(a1 + 64);
  if (v15)
    v15 = _Block_copy(v15);
  aBlock = v15;
  dispatch_async(v14, block);
  if (aBlock)
    _Block_release(aBlock);
  v19 = *v6;
  *(uint64_t *)((char *)&v19 + *(_QWORD *)(v19 - 24)) = v6[3];
  *(_QWORD *)&v20[0] = v9 + 16;
  if (SBYTE7(v22) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22E31A64C](&v24);
}

void sub_22D8C7BD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

BOOL TelephonySystemTrace::writeTraceBuffer(TelephonySystemTrace *this)
{
  const char *v2;
  int v3;
  const std::string::value_type *v4;
  std::string::size_type v5;
  std::string *v6;
  __int128 v7;
  void **v8;
  void **v9;
  int v10;
  void *__p[2];
  int64_t v13;
  std::string v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (char *)this + 32;
  if (*((char *)this + 55) < 0)
    v2 = *(const char **)v2;
  TelephonySystemTrace::generateFileName(v2, &v14);
  v3 = *((char *)this + 31);
  if (v3 >= 0)
    v4 = (char *)this + 8;
  else
    v4 = (const std::string::value_type *)*((_QWORD *)this + 1);
  if (v3 >= 0)
    v5 = *((unsigned __int8 *)this + 31);
  else
    v5 = *((_QWORD *)this + 2);
  v6 = std::string::insert(&v14, 0, v4, v5);
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v13 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  syslog(5, "Writing system trace at %s\n", (const char *)v8);
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)"trace";
  v14.__r_.__value_.__l.__size_ = (std::string::size_type)"-l";
  if (v13 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  v14.__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
  v15 = 0;
  v10 = TelephonyUtilRunCommand();
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
  return v10 == 0;
}

void sub_22D8C7D78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
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
  MEMORY[0x22E31A64C](a1 + 112);
  return a1;
}

void *__copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;
  void *result;

  v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 40);
    v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  result = *(void **)(a2 + 64);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 64);
  if (v2)
    _Block_release(v2);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZN20TelephonySystemTrace21watchdogStartInternalEjN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  dispatch_time_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 64) = dispatch_source_create(MEMORY[0x24BDACA18], 1uLL, 0, *(dispatch_queue_t *)(v2 + 72));
  v3 = *(_DWORD *)(a1 + 48);
  v4 = dispatch_time(0, 1000000 * v3);
  dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 64), *(dispatch_block_t *)(a1 + 40));
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 64), v4, 0xFFFFFFFFFFFFFFFFLL, 500000 * v3);
  dispatch_activate(*(dispatch_object_t *)(v2 + 64));
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 56))
  {
    result = TelephonyUtilRunCommand();
    if (!(_DWORD)result)
      *(_BYTE *)(v1 + 56) = 0;
  }
  return result;
}

void ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(v1 + 64));
    *(_QWORD *)(v1 + 64) = 0;
  }
}

uint64_t ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

unint64_t TelephonySystemTrace::generateFileName@<X0>(const char *a1@<X1>, _QWORD *a2@<X8>)
{
  __int128 v5;
  unint64_t result;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  time_t v11;
  tm v12;
  char __str[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  memset(&v12, 0, sizeof(v12));
  v11 = time(0);
  localtime_r(&v11, &v12);
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  snprintf(__str, 0x100uLL, "%s%04u-%02u-%02u-%02u-%02u-%02u-systemtrace.raw", a1, v12.tm_year + 1900, v12.tm_mon + 1, v12.tm_mday, v12.tm_hour, v12.tm_min, v12.tm_sec);
  result = strlen(__str);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = result;
  if (result >= 0x17)
  {
    v8 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v8 = result | 7;
    v9 = v8 + 1;
    v10 = operator new(v8 + 1);
    a2[1] = v7;
    a2[2] = v9 | 0x8000000000000000;
    *a2 = v10;
    a2 = v10;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
      goto LABEL_9;
  }
  result = (unint64_t)memcpy(a2, __str, v7);
LABEL_9:
  *((_BYTE *)a2 + v7) = 0;
  return result;
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24F95F8E8, MEMORY[0x24BEDAAF0]);
}

void sub_22D8C8310(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _QWORD v23[2];
  std::locale __b[3];

  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x22E31A5D4](v23, a1);
  if (LOBYTE(v23[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        v17 = (std::locale::__imp *)operator new(v18 + 1);
        __b[1].__locale_ = (std::locale::__imp *)v16;
        __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
        __b[0].__locale_ = v17;
      }
      else
      {
        HIBYTE(__b[2].__locale_) = v16;
        v17 = (std::locale::__imp *)__b;
      }
      memset(v17, v9, v16);
      *((_BYTE *)v17 + v16) = 0;
      v20 = SHIBYTE(__b[2].__locale_) >= 0 ? __b : (std::locale *)__b[0].__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(__b[2].__locale_) < 0)
        operator delete(__b[0].__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x22E31A5E0](v23);
  return a1;
}

void sub_22D8C8584(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x22E31A5E0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22D8C8558);
}

void sub_22D8C85E4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::stringbuf::str[abi:ne180100]<std::allocator<char>>(_QWORD *__dst, uint64_t a2)
{
  _QWORD *v2;
  int v3;
  size_t v4;
  unint64_t v5;
  unint64_t v6;
  const void **v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = __dst;
  v3 = *(_DWORD *)(a2 + 96);
  if ((v3 & 0x10) != 0)
  {
    v5 = *(_QWORD *)(a2 + 88);
    v6 = *(_QWORD *)(a2 + 48);
    if (v5 < v6)
    {
      *(_QWORD *)(a2 + 88) = v6;
      v5 = v6;
    }
    v7 = (const void **)(a2 + 40);
  }
  else
  {
    if ((v3 & 8) == 0)
    {
      v4 = 0;
      *((_BYTE *)__dst + 23) = 0;
      goto LABEL_16;
    }
    v7 = (const void **)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 32);
  }
  v8 = *v7;
  v4 = v5 - (_QWORD)*v7;
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 >= 0x17)
  {
    v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v9 = v4 | 7;
    v10 = v9 + 1;
    v11 = operator new(v9 + 1);
    v2[1] = v4;
    v2[2] = v10 | 0x8000000000000000;
    *v2 = v11;
    v2 = v11;
  }
  else
  {
    *((_BYTE *)__dst + 23) = v4;
    if (!v4)
      goto LABEL_16;
  }
  __dst = memmove(v2, v8, v4);
LABEL_16:
  *((_BYTE *)v2 + v4) = 0;
  return __dst;
}

void TelephonyBasebandWatchdogStartWithStackshot(NSObject **a1, unsigned int a2, uint64_t a3)
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __TelephonyBasebandWatchdogStartWithStackshot_block_invoke;
  v3[3] = &__block_descriptor_tmp_0;
  v3[4] = a3;
  v4 = a2;
  TelephonyBasebandWatchdogStart(a1, a2, v3);
}

uint64_t TelephonyUtilRunCommand()
{
  return MEMORY[0x24BED9780]();
}

uint64_t TelephonyUtilTraceAllowed()
{
  return MEMORY[0x24BED9798]();
}

uint64_t TelephonyUtilWriteStackshot()
{
  return MEMORY[0x24BED97B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x24BED97C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
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
  return MEMORY[0x24BEDAF50]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F95F910(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F95F918(__sz);
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x24BED9EF0]();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

