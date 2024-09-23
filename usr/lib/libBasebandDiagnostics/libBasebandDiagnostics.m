const char *BasebandRFDiagnostics::asString(unsigned int a1)
{
  if (a1 > 9)
    return "Unknown";
  else
    return off_251CB5128[a1];
}

void BasebandRFDiagnostics::BasebandRFDiagnostics(BasebandRFDiagnostics *this)
{
  uint64_t v1;

  BasebandDiagnostics::BasebandDiagnostics(this);
  *(_QWORD *)v1 = &off_251CB50A0;
  *(_QWORD *)(v1 + 136) = 0;
  *(_QWORD *)(v1 + 144) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  *(_QWORD *)(v1 + 168) = 0;
  *(_QWORD *)(v1 + 176) = 0;
  *(_QWORD *)(v1 + 160) = 0;
  *(_QWORD *)(v1 + 192) = 0;
  *(_DWORD *)(v1 + 200) = 0;
  *(_QWORD *)(v1 + 208) = 0;
  *(_DWORD *)(v1 + 216) = 0;
}

{
  uint64_t v1;

  BasebandDiagnostics::BasebandDiagnostics(this);
  *(_QWORD *)v1 = &off_251CB50A0;
  *(_QWORD *)(v1 + 136) = 0;
  *(_QWORD *)(v1 + 144) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  *(_QWORD *)(v1 + 168) = 0;
  *(_QWORD *)(v1 + 176) = 0;
  *(_QWORD *)(v1 + 160) = 0;
  *(_QWORD *)(v1 + 192) = 0;
  *(_DWORD *)(v1 + 200) = 0;
  *(_QWORD *)(v1 + 208) = 0;
  *(_DWORD *)(v1 + 216) = 0;
}

void BasebandRFDiagnostics::~BasebandRFDiagnostics(BasebandRFDiagnostics *this)
{
  NSObject *v2;
  const void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  *(_QWORD *)this = &off_251CB50A0;
  v2 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24B846000, v2, OS_LOG_TYPE_DEFAULT, "#I BasebandRFDiagHelper dealloc", v6, 2u);
  }
  v3 = (const void *)*((_QWORD *)this + 24);
  if (v3)
    CFRelease(v3);
  v4 = (void *)*((_QWORD *)this + 20);
  if (v4)
  {
    *((_QWORD *)this + 21) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 16);
  if (v5)
  {
    *((_QWORD *)this + 17) = v5;
    operator delete(v5);
  }
  BasebandDiagnostics::~BasebandDiagnostics(this);
}

{
  void *v1;

  BasebandRFDiagnostics::~BasebandRFDiagnostics(this);
  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void BasebandRFDiagnostics::resetAll(BasebandRFDiagnostics *this)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  *((_DWORD *)this + 50) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_DWORD *)this + 54) = 0;
  if (*((_QWORD *)this + 7))
  {
    v2 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_24B846000, v2, OS_LOG_TYPE_DEFAULT, "#I ABM client reset", v7, 2u);
    }
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
    *((_QWORD *)this + 7) = 0;
    *((_QWORD *)this + 8) = 0;
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
  v6 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v6)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
  }
}

void BasebandRFDiagnostics::create(std::__shared_weak_count ***a1@<X8>)
{
  std::__shared_weak_count **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v6;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;

  v3 = (std::__shared_weak_count **)operator new(0xE0uLL);
  BasebandDiagnostics::BasebandDiagnostics((BasebandDiagnostics *)v3);
  *v3 = (std::__shared_weak_count *)&off_251CB50A0;
  v3[17] = 0;
  v3[18] = 0;
  v3[16] = 0;
  v3[21] = 0;
  v3[22] = 0;
  v3[20] = 0;
  v3[24] = 0;
  *((_DWORD *)v3 + 50) = 0;
  v3[26] = 0;
  *((_DWORD *)v3 + 54) = 0;
  *a1 = v3;
  a1[1] = (std::__shared_weak_count **)0xAAAAAAAAAAAAAAAALL;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_251CB50E8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)v3;
  a1[1] = (std::__shared_weak_count **)v4;
  v6 = v3[2];
  if (v6)
  {
    if (v6->__shared_owners_ != -1)
      return;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
    v3[1] = (std::__shared_weak_count *)v3;
    v3[2] = v4;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v11 = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    v3[1] = (std::__shared_weak_count *)v3;
    v3[2] = v4;
  }
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_24B847260(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics*)#1}::operator() const(BasebandRFDiagnostics*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_24B847280(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_24B847294(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

const char *BasebandRFDiagnostics::getName(BasebandRFDiagnostics *this)
{
  return "BBDiagnosticsRF";
}

uint64_t BasebandRFDiagnostics::getBasebandPersonalizationInfo(BasebandRFDiagnostics *this)
{
  xpc_object_t v2;
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  const void *v11;
  size_t v12;
  size_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v26;
  const char *v27;
  xpc_object_t value;
  _BYTE *v29;
  void *v30;
  xpc_object_t v31;
  NSObject *v32;
  __int128 v33;
  std::__shared_weak_count *v34;
  _BYTE *v35;
  int v36;
  __int128 v37;
  unint64_t *v38;
  unint64_t v39;
  const void *v40;
  size_t v41;
  size_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  NSObject *v50;
  const char *v51;
  xpc_object_t v52;
  NSObject *v53;
  int v54;
  std::__shared_weak_count *v55;
  _BYTE __dst[32];
  xpc_object_t object;
  uint64_t v58;
  std::__shared_weak_count *v59;
  void *__p[2];
  __int128 v61;
  xpc_object_t v62;
  uint8_t buf[24];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = MEMORY[0x24BDACFA0];
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v2) == v3)
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
  v5 = xpc_int64_create(5000);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE04E20], v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  v62 = xpc_null_create();
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v7;
  v61 = v7;
  v8 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v58 = *((_QWORD *)this + 7);
  v59 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (const void *)*MEMORY[0x24BE05518];
  v12 = strlen((const char *)*MEMORY[0x24BE05518]);
  if (v12 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v13 = v12;
  if (v12 >= 0x17)
  {
    v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v15 = v12 | 7;
    v16 = v15 + 1;
    v14 = operator new(v15 + 1);
    *(_QWORD *)&__dst[8] = v13;
    *(_QWORD *)&__dst[16] = v16 | 0x8000000000000000;
    *(_QWORD *)__dst = v14;
    goto LABEL_19;
  }
  __dst[23] = v12;
  v14 = __dst;
  if (v12)
LABEL_19:
    memmove(v14, v11, v13);
  v14[v13] = 0;
  abm::client::PerformCommand();
  if ((__dst[23] & 0x80000000) != 0)
    operator delete(*(void **)__dst);
  v17 = v59;
  if (!v59)
    goto LABEL_26;
  v18 = (unint64_t *)&v59->__shared_owners_;
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    v20 = v62;
    if (v62)
      goto LABEL_30;
  }
  else
  {
LABEL_26:
    v20 = v62;
    if (v62)
      goto LABEL_30;
  }
  v20 = xpc_null_create();
  if (!v20)
  {
    v21 = xpc_null_create();
    v20 = 0;
    goto LABEL_33;
  }
LABEL_30:
  if (MEMORY[0x24BD28B14](v20) == v3)
  {
    xpc_retain(v20);
    v21 = v20;
  }
  else
  {
    v21 = xpc_null_create();
  }
LABEL_33:
  xpc_release(v20);
  if (LODWORD(__p[0])
    || MEMORY[0x24BD28B14](v21) != v3
    || (v26 = (const char *)*MEMORY[0x24BE053A0], !xpc_dictionary_get_value(v21, (const char *)*MEMORY[0x24BE053A0]))
    || (v27 = (const char *)*MEMORY[0x24BE05020], !xpc_dictionary_get_value(v21, (const char *)*MEMORY[0x24BE05020])))
  {
    v22 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__dst = 0;
      _os_log_error_impl(&dword_24B846000, v22, OS_LOG_TYPE_ERROR, "Failed to get Firmware Info", __dst, 2u);
      if (LODWORD(__p[0]))
        goto LABEL_37;
    }
    else if (LODWORD(__p[0]))
    {
LABEL_37:
      v23 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, __dst);
        v29 = __dst[23] >= 0 ? __dst : *(_BYTE **)__dst;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v29;
        _os_log_error_impl(&dword_24B846000, v23, OS_LOG_TYPE_ERROR, "Get firmware info cmd failed: %s", buf, 0xCu);
        if ((__dst[23] & 0x80000000) != 0)
          operator delete(*(void **)__dst);
      }
    }
    v24 = 0;
    goto LABEL_39;
  }
  value = xpc_dictionary_get_value(v21, v26);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  memset(__dst, 0, 24);
  xpc::dyn_cast_or_default();
  if (*(_QWORD *)__dst)
  {
    *(_QWORD *)&__dst[8] = *(_QWORD *)__dst;
    operator delete(*(void **)__dst);
  }
  v30 = (void *)*((_QWORD *)this + 16);
  if (v30)
  {
    *((_QWORD *)this + 17) = v30;
    operator delete(v30);
    *((_QWORD *)this + 16) = 0;
    *((_QWORD *)this + 17) = 0;
    *((_QWORD *)this + 18) = 0;
  }
  *((_OWORD *)this + 8) = *(_OWORD *)buf;
  *((_QWORD *)this + 18) = *(_QWORD *)&buf[16];
  memset(buf, 0, sizeof(buf));
  xpc_release(object);
  v31 = xpc_dictionary_get_value(v21, v27);
  *(_QWORD *)__dst = v31;
  if (v31)
    xpc_retain(v31);
  else
    *(_QWORD *)__dst = xpc_null_create();
  *((_DWORD *)this + 38) = xpc::dyn_cast_or_default();
  xpc_release(*(xpc_object_t *)__dst);
  memset(__dst, 170, 24);
  ctu::hex(*((ctu **)this + 16), (const void *)(*((_QWORD *)this + 17) - *((_QWORD *)this + 16)));
  v32 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v35 = __dst;
    if (__dst[23] < 0)
      v35 = *(_BYTE **)__dst;
    v36 = *((_DWORD *)this + 38);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v36;
    _os_log_debug_impl(&dword_24B846000, v32, OS_LOG_TYPE_DEBUG, "#D Serial Number: %s, ChipId: %d", buf, 0x12u);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_63:
      *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__dst = v33;
      *(_OWORD *)&__dst[16] = v33;
      v34 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
      v55 = v34;
      if (!v34)
        goto LABEL_71;
      goto LABEL_69;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_63;
  }
  operator delete(*(void **)__dst);
  *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__dst = v37;
  *(_OWORD *)&__dst[16] = v37;
  v34 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v55 = v34;
  if (!v34)
    goto LABEL_71;
LABEL_69:
  v38 = (unint64_t *)&v34->__shared_owners_;
  do
    v39 = __ldxr(v38);
  while (__stxr(v39 + 1, v38));
LABEL_71:
  v40 = (const void *)*MEMORY[0x24BE05100];
  v41 = strlen((const char *)*MEMORY[0x24BE05100]);
  if (v41 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v42 = v41;
  if (v41 >= 0x17)
  {
    v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17)
      v44 = v41 | 7;
    v45 = v44 + 1;
    v43 = operator new(v44 + 1);
    *(_QWORD *)&buf[8] = v42;
    *(_QWORD *)&buf[16] = v45 | 0x8000000000000000;
    *(_QWORD *)buf = v43;
  }
  else
  {
    buf[23] = v41;
    v43 = buf;
    if (!v41)
      goto LABEL_79;
  }
  memmove(v43, v40, v42);
LABEL_79:
  *((_BYTE *)v43 + v42) = 0;
  abm::client::PerformCommand();
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  if (v55)
  {
    v46 = (unint64_t *)&v55->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  v48 = v62;
  if (v62 || (v48 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v48) == v3)
    {
      xpc_retain(v48);
      v49 = v48;
    }
    else
    {
      v49 = xpc_null_create();
    }
  }
  else
  {
    v49 = xpc_null_create();
    v48 = 0;
  }
  xpc_release(v48);
  if (!*(_DWORD *)__dst
    && MEMORY[0x24BD28B14](v49) == v3
    && (v51 = (const char *)*MEMORY[0x24BE05018], xpc_dictionary_get_value(v49, (const char *)*MEMORY[0x24BE05018])))
  {
    v52 = xpc_dictionary_get_value(v49, v51);
    *(_QWORD *)buf = v52;
    if (v52)
      xpc_retain(v52);
    else
      *(_QWORD *)buf = xpc_null_create();
    *((_DWORD *)this + 46) = xpc::dyn_cast_or_default();
    xpc_release(*(xpc_object_t *)buf);
    v53 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = *((_DWORD *)this + 46);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v54;
      _os_log_debug_impl(&dword_24B846000, v53, OS_LOG_TYPE_DEBUG, "#D GoldCertID: 0x%x", buf, 8u);
    }
    v24 = 1;
  }
  else
  {
    v50 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_24B846000, v50, OS_LOG_TYPE_ERROR, "Failed to get GoldCertId", buf, 2u);
    }
    v24 = 0;
  }
  xpc_release(v49);
  if ((__dst[31] & 0x80000000) != 0)
    operator delete(*(void **)&__dst[8]);
LABEL_39:
  xpc_release(v21);
  if (SHIBYTE(v61) < 0)
    operator delete(__p[1]);
  xpc_release(v4);
  return v24;
}

void sub_24B847AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, void *__p, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,xpc_object_t a22,char a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
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

uint64_t TelephonyXPC::Result::describe@<X0>(TelephonyXPC::Result *this@<X0>, _BYTE *a2@<X8>)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  _QWORD *v16;
  int v17;
  _QWORD *v18;
  int v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  size_t v23;
  uint64_t v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  void *__p[2];
  __int16 v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38[2];
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v40 = 0xAAAAAAAAAAAAAAAALL;
  v50 = v4;
  v49 = v4;
  v48 = v4;
  v47 = v4;
  v46 = v4;
  v45 = v4;
  v44 = v4;
  v43 = v4;
  v42 = v4;
  *(_OWORD *)v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v5 = MEMORY[0x24BEDB870];
  v6 = MEMORY[0x24BEDB870] + 64;
  v41 = MEMORY[0x24BEDB870] + 64;
  v7 = (uint64_t *)MEMORY[0x24BEDB800];
  v8 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v33 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v33 + *(_QWORD *)(v33 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v33 + *(_QWORD *)(v33 - 24));
  std::ios_base::init(v9, &v34);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v33 = v5 + 24;
  v41 = v6;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v34 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)v38 = 0u;
  v39 = 0u;
  LODWORD(v40) = 16;
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v33, (uint64_t)"Result:'", 8);
  switch(*(_DWORD *)this)
  {
    case 0xE020E000:
      v12 = 14;
      v32 = 14;
      strcpy((char *)__p, "kInternalError");
      break;
    case 0xE020E001:
      v12 = 12;
      v32 = 12;
      strcpy((char *)__p, "kServerError");
      break;
    case 0xE020E002:
      v12 = 13;
      v14 = "kCommandError";
      goto LABEL_10;
    case 0xE020E003:
      v12 = 8;
      v32 = 8;
      v13 = 0x74756F656D69546BLL;
      goto LABEL_8;
    case 0xE020E004:
      v12 = 13;
      v14 = "kNotSupported";
      goto LABEL_10;
    case 0xE020E005:
      v12 = 6;
      v32 = 6;
      strcpy((char *)__p, "kRetry");
      break;
    case 0xE020E006:
      v12 = 17;
      v32 = 17;
      v31 = 100;
      v15 = "kPermissionDenied";
      goto LABEL_15;
    case 0xE020E007:
      v12 = 13;
      v14 = "kNotAvailable";
LABEL_10:
      v32 = 13;
      __p[0] = *(void **)v14;
      *(void **)((char *)__p + 5) = *(void **)(v14 + 5);
      BYTE5(__p[1]) = 0;
      break;
    default:
      if (*(_DWORD *)this)
      {
        v12 = 17;
        v32 = 17;
        v31 = 101;
        v15 = "kInvalidErrorCode";
LABEL_15:
        *(_OWORD *)__p = *(_OWORD *)v15;
      }
      else
      {
        v12 = 8;
        v32 = 8;
        v13 = 0x737365636375536BLL;
LABEL_8:
        __p[0] = (void *)v13;
        LOBYTE(__p[1]) = 0;
      }
      break;
  }
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)__p, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"'", 1);
  if (v32 < 0)
  {
    operator delete(__p[0]);
    v17 = *((char *)this + 31);
    if ((v17 & 0x80000000) == 0)
    {
LABEL_18:
      if (!(_BYTE)v17)
        goto LABEL_29;
      goto LABEL_22;
    }
  }
  else
  {
    v17 = *((char *)this + 31);
    if ((v17 & 0x80000000) == 0)
      goto LABEL_18;
  }
  if (!*((_QWORD *)this + 2))
    goto LABEL_29;
LABEL_22:
  v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v33, (uint64_t)" Info:'", 7);
  v19 = *((char *)this + 31);
  if (v19 >= 0)
    v20 = (char *)this + 8;
  else
    v20 = (char *)*((_QWORD *)this + 1);
  if (v19 >= 0)
    v21 = *((unsigned __int8 *)this + 31);
  else
    v21 = *((_QWORD *)this + 2);
  v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v20, v21);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"'", 1);
LABEL_29:
  if ((v40 & 0x10) != 0)
  {
    v24 = *((_QWORD *)&v39 + 1);
    if (*((_QWORD *)&v39 + 1) < (unint64_t)v37)
    {
      *((_QWORD *)&v39 + 1) = v37;
      v24 = v37;
    }
    v25 = (const void *)*((_QWORD *)&v36 + 1);
    v23 = v24 - *((_QWORD *)&v36 + 1);
    if ((unint64_t)(v24 - *((_QWORD *)&v36 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_46;
  }
  else
  {
    if ((v40 & 8) == 0)
    {
      v23 = 0;
      a2[23] = 0;
      goto LABEL_42;
    }
    v25 = (const void *)v35;
    v23 = v36 - v35;
    if ((_QWORD)v36 - (_QWORD)v35 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_46:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v23 >= 0x17)
  {
    v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17)
      v26 = v23 | 7;
    v27 = v26 + 1;
    v28 = operator new(v26 + 1);
    *((_QWORD *)a2 + 1) = v23;
    *((_QWORD *)a2 + 2) = v27 | 0x8000000000000000;
    *(_QWORD *)a2 = v28;
    a2 = v28;
    goto LABEL_41;
  }
  a2[23] = v23;
  if (v23)
LABEL_41:
    memmove(a2, v25, v23);
LABEL_42:
  a2[v23] = 0;
  v33 = *v7;
  *(uint64_t *)((char *)&v33 + *(_QWORD *)(v33 - 24)) = v7[3];
  *(_QWORD *)&v34 = v10 + 16;
  if (SBYTE7(v39) < 0)
    operator delete(v38[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x24BD2888C](&v41);
}

void sub_24B8480D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x24BD2888C](v1);
  _Unwind_Resume(a1);
}

uint64_t BasebandRFDiagnostics::getPersonalizationInfo(ctu **this)
{
  xpc_object_t v2;
  uint64_t v3;
  xpc_object_t v4;
  int v5;
  xpc_object_t v6;
  xpc_object_t v7;
  __int128 v8;
  ctu *v9;
  unint64_t *v10;
  unint64_t v11;
  const void *v12;
  size_t v13;
  void *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  xpc_object_t value;
  ctu *v27;
  NSObject *v28;
  void **v30;
  void **v31;
  xpc_object_t object;
  std::__shared_weak_count *v33;
  void *__p[2];
  __int128 v35;
  xpc_object_t v36;
  void *__dst[4];
  uint8_t buf[16];
  ctu *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (capabilities::radio::vendor((capabilities::radio *)this) - 1 > 1
    || !BasebandRFDiagnostics::getBasebandPersonalizationInfo((BasebandRFDiagnostics *)this))
  {
    v5 = 0;
    return v5 ^ 1u;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = MEMORY[0x24BDACFA0];
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v2) == v3)
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
  v6 = xpc_int64_create(5000);
  if (!v6)
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x24BE04E20], v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  v36 = xpc_null_create();
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v8;
  v35 = v8;
  v9 = this[8];
  v33 = (std::__shared_weak_count *)v9;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = (const void *)*MEMORY[0x24BE057A0];
  v13 = strlen((const char *)*MEMORY[0x24BE057A0]);
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
    __dst[2] = (void *)(v17 | 0x8000000000000000);
    __dst[0] = v15;
    goto LABEL_22;
  }
  HIBYTE(__dst[2]) = v13;
  v15 = __dst;
  if (v13)
LABEL_22:
    memmove(v15, v12, (size_t)v14);
  *((_BYTE *)v14 + (_QWORD)v15) = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    v18 = v33;
    if (!v33)
      goto LABEL_30;
  }
  else
  {
    v18 = v33;
    if (!v33)
      goto LABEL_30;
  }
  p_shared_owners = (unint64_t *)&v18->__shared_owners_;
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    v21 = v36;
    if (v36)
      goto LABEL_34;
    goto LABEL_31;
  }
LABEL_30:
  v21 = v36;
  if (v36)
    goto LABEL_34;
LABEL_31:
  v21 = xpc_null_create();
  if (!v21)
  {
    v22 = xpc_null_create();
    v21 = 0;
    goto LABEL_37;
  }
LABEL_34:
  if (MEMORY[0x24BD28B14](v21) == v3)
  {
    xpc_retain(v21);
    v22 = v21;
  }
  else
  {
    v22 = xpc_null_create();
  }
LABEL_37:
  xpc_release(v21);
  if (LODWORD(__p[0]))
  {
    v23 = this[5];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, __dst);
      v30 = SHIBYTE(__dst[2]) >= 0 ? __dst : (void **)__dst[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_24B846000, v23, OS_LOG_TYPE_ERROR, "Get rf self test nonce cmd failed: %s", buf, 0xCu);
      if (SHIBYTE(__dst[2]) < 0)
        operator delete(__dst[0]);
    }
    goto LABEL_39;
  }
  v25 = (const char *)*MEMORY[0x24BE05900];
  if (!xpc_dictionary_get_value(v22, (const char *)*MEMORY[0x24BE05900]))
  {
LABEL_39:
    v24 = this[5];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__dst[0]) = 0;
      _os_log_error_impl(&dword_24B846000, v24, OS_LOG_TYPE_ERROR, "Failed to get RFSelfTestNonce", (uint8_t *)__dst, 2u);
    }
    v5 = 0;
    goto LABEL_54;
  }
  value = xpc_dictionary_get_value(v22, v25);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  memset(__dst, 0, 24);
  xpc::dyn_cast_or_default();
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }
  v27 = this[20];
  if (v27)
  {
    this[21] = v27;
    operator delete(v27);
    this[20] = 0;
    this[21] = 0;
    this[22] = 0;
  }
  *((_OWORD *)this + 10) = *(_OWORD *)buf;
  this[22] = v39;
  v39 = 0;
  memset(buf, 0, sizeof(buf));
  xpc_release(object);
  memset(__dst, 170, 24);
  ctu::hex(this[20], (const void *)(this[21] - this[20]));
  v28 = this[5];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v31 = __dst;
    if (SHIBYTE(__dst[2]) < 0)
      v31 = (void **)__dst[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v31;
    _os_log_debug_impl(&dword_24B846000, v28, OS_LOG_TYPE_DEBUG, "#D RF Self Test Nonce: %s", buf, 0xCu);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
  if (SHIBYTE(__dst[2]) < 0)
LABEL_52:
    operator delete(__dst[0]);
LABEL_53:
  v5 = 1;
LABEL_54:
  xpc_release(v22);
  if (SHIBYTE(v35) < 0)
    operator delete(__p[1]);
  xpc_release(v4);
  return v5 ^ 1u;
}

void sub_24B848638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;
  void *v28;

  xpc_release(v28);
  if (a19 < 0)
    operator delete(__p);
  xpc_release(v27);
  _Unwind_Resume(a1);
}

uint64_t BasebandRFDiagnostics::isRFTestSupported(capabilities::abs *a1, int a2)
{
  if (a2 == 2)
    return capabilities::abs::supportsDesenseRFSelfTest(a1);
  if (a2 == 1)
    return capabilities::abs::supportsRFSelfTest(a1);
  return 0;
}

BOOL BasebandRFDiagnostics::getAPAuthParameters(BasebandRFDiagnostics *this)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  BOOL v5;

  v2 = MGGetSInt64Answer();
  v3 = v2 & 0xFFFFFF;
  if (HIDWORD(v2))
    v3 = 0;
  *((_DWORD *)this + 50) = v3;
  v4 = MGGetSInt64Answer();
  *((_QWORD *)this + 26) = v4;
  if (*((_DWORD *)this + 50))
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

uint64_t BasebandRFDiagnostics::getSignedTicketAndStore(BasebandRFDiagnostics *this, _BOOL4 a2)
{
  BOOL v2;
  BasebandRFDiagnostics *v3;
  unint64_t v4;
  int v5;
  NSObject *v7;
  uint64_t v8;
  CFTypeRef v9;
  unsigned int RFSelfTestTicket;
  NSObject *v11;
  int IntegerFromUserDefaults;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  CFTypeRef cf;
  _BYTE buf[24];
  uint64_t v21;

  v2 = a2;
  v3 = this;
  v21 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  if (a2)
  {
    v4 = MGGetSInt64Answer();
    v5 = v4 & 0xFFFFFF;
    if (HIDWORD(v4))
      v5 = 0;
    *((_DWORD *)v3 + 50) = v5;
    this = (BasebandRFDiagnostics *)MGGetSInt64Answer();
    *((_QWORD *)v3 + 26) = this;
    if (!*((_DWORD *)v3 + 50) || this == 0)
    {
      v7 = *((_QWORD *)v3 + 5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = 2;
        _os_log_impl(&dword_24B846000, v7, OS_LOG_TYPE_DEFAULT, "#I Failed to get AP tag info", buf, 2u);
        v9 = cf;
        if (!cf)
          return v8;
      }
      else
      {
        v8 = 2;
        v9 = cf;
        if (!cf)
          return v8;
      }
      goto LABEL_42;
    }
  }
  if (capabilities::radio::vendor(this) - 3 < 0xFFFFFFFE)
  {
    RFSelfTestTicket = 14;
    goto LABEL_15;
  }
  RFSelfTestTicket = BasebandRFDiagnostics::getRFSelfTestTicket((const UInt8 **)v3, v2, 1u, (const __CFData **)&cf);
  if (!RFSelfTestTicket)
  {
    *(_QWORD *)buf = operator new(0x19uLL);
    *(_OWORD *)&buf[8] = xmmword_24B8536B0;
    strcpy(*(char **)buf, "RFSelfTestTicketBlocked");
    IntegerFromUserDefaults = BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)v3, (uint64_t *)buf);
    v13 = IntegerFromUserDefaults;
    if ((buf[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)buf);
      if (v13)
      {
LABEL_26:
        v14 = *((_QWORD *)v3 + 5);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24B846000, v14, OS_LOG_TYPE_DEFAULT, "#I Access to RFSelfTestTicket is blocked", buf, 2u);
          v8 = 5;
          v9 = cf;
          if (!cf)
            return v8;
        }
        else
        {
          v8 = 5;
          v9 = cf;
          if (!cf)
            return v8;
        }
        goto LABEL_42;
      }
    }
    else if (IntegerFromUserDefaults)
    {
      goto LABEL_26;
    }
    buf[23] = 16;
    strcpy(buf, "RFSelfTestTicket");
    v15 = BasebandDiagnostics::saveToUserDefaults((uint64_t)v3, (uint64_t *)buf, (uint64_t)cf);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v16 = *((_QWORD *)v3 + 5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "Failed";
      if (v15)
        v17 = "Success";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_24B846000, v16, OS_LOG_TYPE_DEFAULT, "#I Get signed ticket and save: %s", buf, 0xCu);
    }
    if (v15)
      v8 = 0;
    else
      v8 = 5;
LABEL_41:
    v9 = cf;
    if (!cf)
      return v8;
LABEL_42:
    CFRelease(v9);
    return v8;
  }
LABEL_15:
  v11 = *((_QWORD *)v3 + 5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = RFSelfTestTicket;
    _os_log_impl(&dword_24B846000, v11, OS_LOG_TYPE_DEFAULT, "#I Failed to get signed ticket from Server w/ error: %d", buf, 8u);
  }
  v8 = 4;
  if (RFSelfTestTicket <= 0x13 && ((1 << RFSelfTestTicket) & 0xE0002) != 0)
    goto LABEL_41;
  if (RFSelfTestTicket == 3194)
    v8 = 4;
  else
    v8 = 3;
  v9 = cf;
  if (cf)
    goto LABEL_42;
  return v8;
}

void sub_24B848AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandRFDiagnostics::getRFSelfTestTicket(const UInt8 **this, BOOL a2, unsigned int a3, const __CFData **a4)
{
  const __CFAllocator *v5;
  CFDataRef v6;
  CFDataRef v7;
  uint64_t RFSelfTestTicket;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], this[16], this[17] - this[16]);
  v7 = CFDataCreate(v5, this[20], this[21] - this[20]);
  RFSelfTestTicket = AMAuthInstallBasebandGetRFSelfTestTicket();
  if (v7)
    CFRelease(v7);
  if (v6)
    CFRelease(v6);
  return RFSelfTestTicket;
}

void sub_24B848BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  const void *v4;
  va_list va;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_24B848BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void BasebandRFDiagnostics::clearRFSelfTestTicket(BasebandRFDiagnostics *this)
{
  NSObject *v2;
  char __p[17];
  char v4;

  v2 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl(&dword_24B846000, v2, OS_LOG_TYPE_DEFAULT, "#I Clear ticket", (uint8_t *)__p, 2u);
  }
  v4 = 16;
  strcpy(__p, "RFSelfTestTicket");
  BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)__p);
  if (v4 < 0)
    operator delete(*(void **)__p);
}

void sub_24B848CA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(BasebandRFDiagnostics *this)
{
  const __CFData *v2;
  const __CFData *ObjectFromUserDefaults;
  uint64_t (*v4)(uint64_t);
  uint64_t (*v5)(uint64_t);
  xpc_object_t v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *i;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  void **v18;
  xpc_object_t v19;
  xpc_object_t v20;
  _BOOL4 v21;
  NSObject *v22;
  const char *v23;
  void *v25[2];
  uint64_t v26;
  void *__p[3];
  const __CFData *v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)buf = operator new(0x19uLL);
  *(_OWORD *)&buf[8] = xmmword_24B8536B0;
  strcpy(*(char **)buf, "RFSelfTestTicketBlocked");
  if (BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)this, (uint64_t *)buf))
  {
    v2 = 0;
    v28 = 0;
    if ((char)buf[23] < 0)
    {
LABEL_13:
      operator delete(*(void **)buf);
      v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      if (!v2)
        v5 = 0;
      if (v5)
        goto LABEL_16;
LABEL_21:
      v8 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B846000, v8, OS_LOG_TYPE_DEFAULT, "#I Failed to restore ticket", buf, 2u);
      }
      v9 = 6;
      if (v2)
        goto LABEL_60;
      return v9;
    }
  }
  else
  {
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "RFSelfTestTicket");
    ObjectFromUserDefaults = (const __CFData *)BasebandDiagnostics::readObjectFromUserDefaults((uint64_t)this, (uint64_t *)__p);
    v2 = ObjectFromUserDefaults;
    v28 = ObjectFromUserDefaults;
    if (ObjectFromUserDefaults)
      CFRetain(ObjectFromUserDefaults);
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if ((char)buf[23] < 0)
        goto LABEL_13;
    }
    else if ((char)buf[23] < 0)
    {
      goto LABEL_13;
    }
  }
  v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v2)
    v4 = 0;
  if (!v4)
    goto LABEL_21;
LABEL_16:
  if (!CFDataGetLength(v2))
    goto LABEL_21;
  memset(__p, 0, sizeof(__p));
  ctu::cf::assign();
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v6) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v10 = xpc_array_create(0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v10) == MEMORY[0x24BDACF78])
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
  v12 = (unsigned __int8 *)__p[0];
  for (i = (unsigned __int8 *)__p[1]; v12 != i; ++v12)
  {
    v14 = xpc_int64_create(*v12);
    if (!v14)
      v14 = xpc_null_create();
    xpc_array_append_value(v11, v14);
    xpc_release(v14);
  }
  v15 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE054E8], v15);
  v16 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v15);
  if (v11)
  {
    xpc_retain(v11);
    v17 = v11;
  }
  else
  {
    v17 = xpc_null_create();
  }
  memset(buf, 0, sizeof(buf));
  ctu::cf::assign();
  *(_OWORD *)v25 = *(_OWORD *)buf;
  v26 = *(_QWORD *)&buf[16];
  if ((buf[23] & 0x80u) == 0)
    v18 = v25;
  else
    v18 = *(void ***)buf;
  xpc_dictionary_set_value(v7, (const char *)v18, v17);
  v19 = xpc_null_create();
  xpc_release(v17);
  if (SHIBYTE(v26) < 0)
    operator delete(v25[0]);
  xpc_release(v19);
  if (v7)
  {
    xpc_retain(v7);
    v20 = v7;
  }
  else
  {
    v20 = xpc_null_create();
  }
  v21 = BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest((uint64_t)this);
  xpc_release(v20);
  if (v21)
    v9 = 0;
  else
    v9 = 7;
  v22 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = "Failed";
    if (v21)
      v23 = "Success";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v23;
    _os_log_impl(&dword_24B846000, v22, OS_LOG_TYPE_DEFAULT, "#I Start Baseband RF Self Test: %s", buf, 0xCu);
  }
  buf[23] = 16;
  strcpy((char *)buf, "RFSelfTestTicket");
  BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)buf);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  xpc_release(v11);
  xpc_release(v7);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v2 = v28;
  if (v28)
LABEL_60:
    CFRelease(v2);
  return v9;
}

void sub_24B84915C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest(uint64_t a1)
{
  __int128 v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  const void *v6;
  size_t v7;
  size_t v8;
  __int128 *p_dst;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void **v16;
  xpc_object_t value;
  int v18;
  void *__p[2];
  int64_t v21;
  xpc_object_t object;
  uint64_t v23;
  std::__shared_weak_count *v24;
  void *v25[2];
  __int128 v26;
  xpc_object_t v27;
  __int128 __dst;
  int64_t v29;

  v27 = xpc_null_create();
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v25 = v2;
  v26 = v2;
  v3 = *(std::__shared_weak_count **)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 56);
  v24 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (const void *)*MEMORY[0x24BE05768];
  v7 = strlen((const char *)*MEMORY[0x24BE05768]);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    p_dst = (__int128 *)operator new(v10 + 1);
    *((_QWORD *)&__dst + 1) = v8;
    v29 = v11 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_11;
  }
  HIBYTE(v29) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_11:
    memmove(p_dst, v6, v8);
  *((_BYTE *)p_dst + v8) = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(v29) < 0)
    operator delete((void *)__dst);
  if (!v24)
    goto LABEL_18;
  v12 = &v24->__shared_owners_;
  do
    v13 = __ldaxr((unint64_t *)v12);
  while (__stlxr(v13 - 1, (unint64_t *)v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
    v14 = v27;
    if (v27)
    {
LABEL_22:
      if (MEMORY[0x24BD28B14](v14) == MEMORY[0x24BDACFA0])
      {
        xpc_retain(v14);
        v15 = v14;
      }
      else
      {
        v15 = xpc_null_create();
      }
      goto LABEL_25;
    }
  }
  else
  {
LABEL_18:
    v14 = v27;
    if (v27)
      goto LABEL_22;
  }
  v14 = xpc_null_create();
  if (v14)
    goto LABEL_22;
  v15 = xpc_null_create();
  v14 = 0;
LABEL_25:
  xpc_release(v14);
  __dst = 0uLL;
  v29 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = __dst;
  v21 = v29;
  if (v29 >= 0)
    v16 = __p;
  else
    v16 = (void **)__p[0];
  value = xpc_dictionary_get_value(v15, (const char *)v16);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  *(_DWORD *)(a1 + 216) = xpc::dyn_cast_or_default();
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  v18 = (int)v25[0];
  xpc_release(v15);
  if (SHIBYTE(v26) < 0)
    operator delete(v25[1]);
  return v18 == 0;
}

void sub_24B849538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, xpc_object_t object, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  xpc_release(object);
  if (a14 < 0)
    operator delete(a9);
  xpc_release(v24);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24B8495A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  if (*(char *)(v5 - 49) < 0)
  {
    operator delete(*(void **)(v5 - 72));
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void **v13;
  xpc_object_t v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  NSObject *v18;
  const char *v19;
  xpc_object_t object;
  void *__p[2];
  uint64_t v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v6) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v8 = xpc_int64_create(1);
  if (!v8)
    v8 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE054E8], v8);
  v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  if (a2)
  {
    v10 = xpc_int64_create(a2);
    if (!v10)
      v10 = xpc_null_create();
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)__p = 0u;
    v23 = 0;
    xpc_dictionary_set_value(v7, (const char *)__p, v10);
    v11 = xpc_null_create();
    xpc_release(v10);
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);
    xpc_release(v11);
    v12 = xpc_int64_create(a3);
    if (!v12)
      v12 = xpc_null_create();
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)__p = *(_OWORD *)buf;
    v23 = *(_QWORD *)&buf[16];
    if ((buf[23] & 0x80u) == 0)
      v13 = __p;
    else
      v13 = *(void ***)buf;
    xpc_dictionary_set_value(v7, (const char *)v13, v12);
    v14 = xpc_null_create();
    xpc_release(v12);
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);
    xpc_release(v14);
    object = v7;
    if (v7)
      xpc_retain(v7);
    else
      object = xpc_null_create();
    v17 = BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest(a1);
    xpc_release(object);
    if (v17)
      v16 = 0;
    else
      v16 = 8;
    v18 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "Failed";
      if (v17)
        v19 = "Success";
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = a3;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = v19;
      _os_log_impl(&dword_24B846000, v18, OS_LOG_TYPE_DEFAULT, "#I Start Baseband RF Self Test (Type=%d) in FTM: %s", buf, 0x12u);
    }
  }
  else
  {
    v15 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_24B846000, v15, OS_LOG_TYPE_ERROR, "Invalid measType in RF Self Test", buf, 2u);
    }
    v16 = 8;
  }
  xpc_release(v7);
  return v16;
}

void sub_24B849950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t BasebandRFDiagnostics::getBasebandEstimatedTestTime(BasebandRFDiagnostics *this)
{
  return *((unsigned int *)this + 54);
}

uint64_t BasebandRFDiagnostics::setBasebandRFSelfTestTicket(BasebandRFDiagnostics *this)
{
  const __CFData *v2;
  uint64_t (*v3)(uint64_t);
  const __CFData *ObjectFromUserDefaults;
  uint64_t (*v5)(uint64_t);
  xpc_object_t v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t i;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void **v16;
  xpc_object_t v17;
  __int128 v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  const void *v22;
  size_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  int v31;
  NSObject *v32;
  const char *v33;
  std::__shared_weak_count *v35;
  void *__dst[2];
  void *v37;
  uint64_t v38[3];
  const __CFData *v39;
  void *__p[6];

  __p[5] = *(void **)MEMORY[0x24BDAC8D0];
  __p[0] = operator new(0x19uLL);
  *(_OWORD *)&__p[1] = xmmword_24B8536B0;
  strcpy((char *)__p[0], "RFSelfTestTicketBlocked");
  if (!BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)this, (uint64_t *)__p))
  {
    HIBYTE(v38[2]) = 16;
    strcpy((char *)v38, "RFSelfTestTicket");
    ObjectFromUserDefaults = (const __CFData *)BasebandDiagnostics::readObjectFromUserDefaults((uint64_t)this, v38);
    v2 = ObjectFromUserDefaults;
    v39 = ObjectFromUserDefaults;
    if (ObjectFromUserDefaults)
      CFRetain(ObjectFromUserDefaults);
    if (SHIBYTE(v38[2]) < 0)
    {
      operator delete((void *)v38[0]);
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
        goto LABEL_11;
    }
    else if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
      goto LABEL_11;
    }
LABEL_3:
    operator delete(__p[0]);
    v3 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    if (!v2)
      v3 = 0;
    if (!v3)
      goto LABEL_19;
LABEL_14:
    if (!CFDataGetLength(v2))
      goto LABEL_19;
    memset(v38, 0, sizeof(v38));
    ctu::cf::assign();
    v6 = xpc_array_create(0, 0);
    if (v6 || (v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD28B14](v6) == MEMORY[0x24BDACF78])
      {
        xpc_retain(v6);
        v7 = v6;
      }
      else
      {
        v7 = xpc_null_create();
      }
    }
    else
    {
      v7 = xpc_null_create();
      v6 = 0;
    }
    xpc_release(v6);
    v10 = (unsigned __int8 *)v38[0];
    for (i = v38[1]; v10 != (unsigned __int8 *)i; ++v10)
    {
      v12 = xpc_int64_create(*v10);
      if (!v12)
        v12 = xpc_null_create();
      xpc_array_append_value(v7, v12);
      xpc_release(v12);
    }
    v13 = xpc_dictionary_create(0, 0, 0);
    if (v13 || (v13 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD28B14](v13) == MEMORY[0x24BDACFA0])
      {
        xpc_retain(v13);
        v14 = v13;
      }
      else
      {
        v14 = xpc_null_create();
      }
    }
    else
    {
      v14 = xpc_null_create();
      v13 = 0;
    }
    xpc_release(v13);
    if (v7)
    {
      xpc_retain(v7);
      v15 = v7;
    }
    else
    {
      v15 = xpc_null_create();
    }
    memset(__p, 0, 24);
    ctu::cf::assign();
    *(_OWORD *)__dst = *(_OWORD *)__p;
    v37 = __p[2];
    if (SHIBYTE(__p[2]) >= 0)
      v16 = __dst;
    else
      v16 = (void **)__p[0];
    xpc_dictionary_set_value(v14, (const char *)v16, v15);
    v17 = xpc_null_create();
    xpc_release(v15);
    if (SHIBYTE(v37) < 0)
      operator delete(__dst[0]);
    xpc_release(v17);
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__p = v18;
    *(_OWORD *)&__p[2] = v18;
    v19 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
    v35 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    v22 = (const void *)*MEMORY[0x24BE057C8];
    v23 = strlen((const char *)*MEMORY[0x24BE057C8]);
    if (v23 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v24 = (void *)v23;
    if (v23 >= 0x17)
    {
      v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17)
        v26 = v23 | 7;
      v27 = v26 + 1;
      v25 = operator new(v26 + 1);
      __dst[1] = v24;
      v37 = (void *)(v27 | 0x8000000000000000);
      __dst[0] = v25;
    }
    else
    {
      HIBYTE(v37) = v23;
      v25 = __dst;
      if (!v23)
      {
LABEL_56:
        *((_BYTE *)v24 + (_QWORD)v25) = 0;
        abm::client::PerformCommand();
        if (SHIBYTE(v37) < 0)
        {
          operator delete(__dst[0]);
          v28 = v35;
          if (!v35)
            goto LABEL_63;
        }
        else
        {
          v28 = v35;
          if (!v35)
            goto LABEL_63;
        }
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
          v31 = (int)__p[0];
          if (LODWORD(__p[0]))
            v9 = 7;
          else
            v9 = 0;
          if (SHIBYTE(__p[3]) < 0)
            goto LABEL_67;
          goto LABEL_68;
        }
LABEL_63:
        v31 = (int)__p[0];
        if (LODWORD(__p[0]))
          v9 = 7;
        else
          v9 = 0;
        if (SHIBYTE(__p[3]) < 0)
LABEL_67:
          operator delete(__p[1]);
LABEL_68:
        xpc_release(v14);
        xpc_release(v7);
        if (v38[0])
        {
          v38[1] = v38[0];
          operator delete((void *)v38[0]);
        }
        v32 = *((_QWORD *)this + 5);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = "Failed";
          if (!v31)
            v33 = "Success";
          LODWORD(__p[0]) = 136315138;
          *(void **)((char *)__p + 4) = (void *)v33;
          _os_log_impl(&dword_24B846000, v32, OS_LOG_TYPE_DEFAULT, "#I Set RF Self Test Ticket to baseband: %s", (uint8_t *)__p, 0xCu);
        }
        HIBYTE(__p[2]) = 16;
        strcpy((char *)__p, "RFSelfTestTicket");
        BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)__p);
        if (SHIBYTE(__p[2]) < 0)
        {
          operator delete(__p[0]);
          v2 = v39;
          if (!v39)
            return v9;
        }
        else
        {
          v2 = v39;
          if (!v39)
            return v9;
        }
LABEL_78:
        CFRelease(v2);
        return v9;
      }
    }
    memmove(v25, v22, (size_t)v24);
    goto LABEL_56;
  }
  v2 = 0;
  v39 = 0;
  if (SHIBYTE(__p[2]) < 0)
    goto LABEL_3;
LABEL_11:
  v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v2)
    v5 = 0;
  if (v5)
    goto LABEL_14;
LABEL_19:
  v8 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_24B846000, v8, OS_LOG_TYPE_DEFAULT, "#I Failed to restore ticket", (uint8_t *)__p, 2u);
  }
  v9 = 6;
  if (v2)
    goto LABEL_78;
  return v9;
}

void sub_24B849FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t BasebandRFDiagnostics::prepareRFSelfTest(BasebandRFDiagnostics *this)
{
  return 1;
}

BOOL BasebandRFDiagnostics::createNum64Num32FromData(uint64_t a1, CFDataRef theData, const void **a3)
{
  const UInt8 *BytePtr;
  const UInt8 *v7;
  CFIndex Length;
  CFIndex v9;
  CFNumberRef v10;
  const void *v11;
  uint64_t (*v12)(uint64_t);
  NSObject *v13;
  NSObject *v14;
  _BOOL8 result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  CFNumberRef v20;
  const void *v21;
  uint64_t (*v22)(uint64_t);
  uint8_t v24[16];
  uint8_t __dst[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!theData || !a3)
  {
    v14 = *(NSObject **)(a1 + 40);
    result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)__dst = 0;
    v16 = "Null param";
LABEL_18:
    v17 = v14;
    v18 = 2;
LABEL_19:
    _os_log_error_impl(&dword_24B846000, v17, OS_LOG_TYPE_ERROR, v16, __dst, v18);
    return 0;
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!BytePtr)
  {
    v14 = *(NSObject **)(a1 + 40);
    result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)__dst = 0;
    v16 = "Get byte pointer failed";
    goto LABEL_18;
  }
  v7 = BytePtr;
  Length = CFDataGetLength(theData);
  v9 = Length;
  if ((Length & 0x8000000000000000) == 0 && Length < 9uLL)
  {
    if (Length < 5uLL)
    {
      *(_DWORD *)__dst = 0;
      memcpy(__dst, v7, Length);
      v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, __dst);
      v21 = *a3;
      *a3 = v20;
      if (v21)
      {
        CFRelease(v21);
        v20 = (CFNumberRef)*a3;
      }
      v22 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
      if (!v20)
        v22 = 0;
      if (!v22)
      {
        v13 = *(NSObject **)(a1 + 40);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          return 0;
        goto LABEL_30;
      }
    }
    else
    {
      *(_QWORD *)__dst = 0;
      memcpy(__dst, v7, Length);
      v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, __dst);
      v11 = *a3;
      *a3 = v10;
      if (v11)
      {
        CFRelease(v11);
        v10 = (CFNumberRef)*a3;
      }
      v12 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
      if (!v10)
        v12 = 0;
      if (!v12)
      {
        v13 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_30:
          *(_WORD *)v24 = 0;
          _os_log_error_impl(&dword_24B846000, v13, OS_LOG_TYPE_ERROR, "Data allocation error during conversion", v24, 2u);
        }
        return 0;
      }
    }
    return 1;
  }
  v19 = *(NSObject **)(a1 + 40);
  result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)__dst = 134217984;
    *(_QWORD *)&__dst[4] = v9;
    v16 = "Data size wrong %lu";
    v17 = v19;
    v18 = 12;
    goto LABEL_19;
  }
  return result;
}

void sub_24B84A400(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
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
  __cxa_throw(exception, (struct type_info *)off_251CB4E18, MEMORY[0x24BEDAAF0]);
}

void sub_24B84A464(_Unwind_Exception *a1)
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
  MEMORY[0x24BD2888C](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x24BD287CC](v13, a1);
  if (LOBYTE(v13[0]))
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
  MEMORY[0x24BD287D8](v13);
  return a1;
}

void sub_24B84A630(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24BD287D8](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24B84A610);
}

void sub_24B84A678(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[3];

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
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_24B84A820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 24), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics*)#1}::operator() const(BasebandRFDiagnostics*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3_"
                     "_110shared_ptrIT_EEPS7_EUlPS4_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnos"
                                "ticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics*)#1}::operator() const(BasebandRFDiagnostics*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v13;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84AA40(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84AA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v13;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84ABC0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84ABDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v11;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84AD48(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84AD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v11;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84AED0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84AEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  _QWORD *v14;
  char **v15;
  _QWORD *v16;
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
  char *v28;
  char *v29;
  BOOL v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _BYTE *v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  __int128 v43;
  void *__p[2];
  uint64_t v45;
  _QWORD v46[5];

  memset(v46, 170, 24);
  v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v4 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v3);
    v5 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v5;
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
    v4 = off_2579B8290;
  }
  v9 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  v46[3] = v4;
  v46[4] = *(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v10 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)v4 + 112))(v46, v4);
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
  HIBYTE(v45) = 9;
  strcpy((char *)__p, "boot-args");
  v14 = (_QWORD *)v46[1];
  if (v46[1])
  {
    while (1)
    {
      v16 = v14;
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
            goto LABEL_57;
        }
        else if (v22 >= 9)
        {
LABEL_57:
          v26 = (char *)v16;
          if (*((char *)v16 + 79) < 0)
            goto LABEL_58;
LABEL_70:
          v43 = *(_OWORD *)(v26 + 56);
          a1->__r_.__value_.__r.__words[2] = *((_QWORD *)v26 + 9);
          *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v43;
          if (SHIBYTE(v45) < 0)
            goto LABEL_71;
          goto LABEL_59;
        }
        v14 = (_QWORD *)v16[1];
        if (!v14)
        {
          v15 = (char **)(v16 + 1);
          goto LABEL_39;
        }
      }
      else
      {
        if (v22 <= 9)
          goto LABEL_32;
LABEL_18:
        v14 = (_QWORD *)*v16;
        v15 = (char **)v16;
        if (!*v16)
          goto LABEL_39;
      }
    }
  }
  v15 = (char **)&v46[1];
  v16 = &v46[1];
LABEL_39:
  v26 = (char *)operator new(0x50uLL);
  *((_OWORD *)v26 + 2) = *(_OWORD *)__p;
  v27 = v45;
  __p[1] = 0;
  v45 = 0;
  __p[0] = 0;
  *((_QWORD *)v26 + 6) = v27;
  *((_QWORD *)v26 + 7) = 0;
  *((_QWORD *)v26 + 8) = 0;
  *((_QWORD *)v26 + 9) = 0;
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  *((_QWORD *)v26 + 2) = v16;
  *v15 = v26;
  v28 = v26;
  if (*(_QWORD *)v46[0])
  {
    v46[0] = *(_QWORD *)v46[0];
    v28 = *v15;
  }
  v29 = (char *)v46[1];
  v30 = v28 == (char *)v46[1];
  v28[24] = v28 == (char *)v46[1];
  if (!v30)
  {
    do
    {
      v31 = *((_QWORD *)v28 + 2);
      if (*(_BYTE *)(v31 + 24))
        break;
      v32 = *(char **)(v31 + 16);
      v33 = *(_QWORD *)v32;
      if (*(_QWORD *)v32 == v31)
      {
        v36 = *((_QWORD *)v32 + 1);
        if (!v36 || (v37 = *(unsigned __int8 *)(v36 + 24), v34 = (_BYTE *)(v36 + 24), v37))
        {
          if (*(char **)v31 == v28)
          {
            *(_BYTE *)(v31 + 24) = 1;
            v32[24] = 0;
            v40 = *(_QWORD *)(v31 + 8);
            *(_QWORD *)v32 = v40;
            if (v40)
              goto LABEL_55;
          }
          else
          {
            v38 = *(uint64_t **)(v31 + 8);
            v39 = *v38;
            *(_QWORD *)(v31 + 8) = *v38;
            if (v39)
            {
              *(_QWORD *)(v39 + 16) = v31;
              v32 = *(char **)(v31 + 16);
            }
            v38[2] = (uint64_t)v32;
            *(_QWORD *)(*(_QWORD *)(v31 + 16) + 8 * (**(_QWORD **)(v31 + 16) != v31)) = v38;
            *v38 = v31;
            *(_QWORD *)(v31 + 16) = v38;
            v32 = (char *)v38[2];
            v31 = *(_QWORD *)v32;
            *((_BYTE *)v38 + 24) = 1;
            v32[24] = 0;
            v40 = *(_QWORD *)(v31 + 8);
            *(_QWORD *)v32 = v40;
            if (v40)
LABEL_55:
              *(_QWORD *)(v40 + 16) = v32;
          }
          *(_QWORD *)(v31 + 16) = *((_QWORD *)v32 + 2);
          *(_QWORD *)(*((_QWORD *)v32 + 2) + 8 * (**((_QWORD **)v32 + 2) != (_QWORD)v32)) = v31;
          *(_QWORD *)(v31 + 8) = v32;
LABEL_68:
          *((_QWORD *)v32 + 2) = v31;
          break;
        }
      }
      else if (!v33 || (v35 = *(unsigned __int8 *)(v33 + 24), v34 = (_BYTE *)(v33 + 24), v35))
      {
        if (*(char **)v31 == v28)
        {
          v41 = *((_QWORD *)v28 + 1);
          *(_QWORD *)v31 = v41;
          if (v41)
          {
            *(_QWORD *)(v41 + 16) = v31;
            v32 = *(char **)(v31 + 16);
          }
          *((_QWORD *)v28 + 2) = v32;
          *(_QWORD *)(*(_QWORD *)(v31 + 16) + 8 * (**(_QWORD **)(v31 + 16) != v31)) = v28;
          *((_QWORD *)v28 + 1) = v31;
          *(_QWORD *)(v31 + 16) = v28;
          v32 = (char *)*((_QWORD *)v28 + 2);
        }
        else
        {
          v28 = (char *)*((_QWORD *)v28 + 2);
        }
        v28[24] = 1;
        v32[24] = 0;
        v31 = *((_QWORD *)v32 + 1);
        v42 = *(char **)v31;
        *((_QWORD *)v32 + 1) = *(_QWORD *)v31;
        if (v42)
          *((_QWORD *)v42 + 2) = v32;
        *(_QWORD *)(v31 + 16) = *((_QWORD *)v32 + 2);
        *(_QWORD *)(*((_QWORD *)v32 + 2) + 8 * (**((_QWORD **)v32 + 2) != (_QWORD)v32)) = v31;
        *(_QWORD *)v31 = v32;
        goto LABEL_68;
      }
      *(_BYTE *)(v31 + 24) = 1;
      v28 = v32;
      v32[24] = v32 == v29;
      *v34 = 1;
    }
    while (v32 != v29);
  }
  ++v46[2];
  if ((v26[79] & 0x80000000) == 0)
    goto LABEL_70;
LABEL_58:
  std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)v26 + 7), *((_QWORD *)v26 + 8));
  if (SHIBYTE(v45) < 0)
LABEL_71:
    operator delete(__p[0]);
LABEL_59:
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v46[1]);
}

void sub_24B84B37C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84B398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B84B3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v11;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84B528(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  v2 = off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v11;
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
    v2 = off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84B6B0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84B6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
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
  v2 = (void (***)(_QWORD))off_2579B8290;
  if (!off_2579B8290)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
    off_2579B8290 = v11;
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
    v2 = (void (***)(_QWORD))off_2579B8290;
  }
  v6 = (std::__shared_weak_count *)*(&off_2579B8290 + 1);
  if (*(&off_2579B8290 + 1))
  {
    v7 = (unint64_t *)(*(&off_2579B8290 + 1) + 8);
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

void sub_24B84B880(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_24B84B89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
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

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B846000);
  }
  return result;
}

uint64_t *sGetDiagnosticsLogHandler(void)
{
  if (qword_2579B82B0 != -1)
    dispatch_once(&qword_2579B82B0, &__block_literal_global);
  return &_MergedGlobals;
}

os_log_t ___Z25sGetDiagnosticsLogHandlerv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.telephony.abm", "abm.diagnostics");
  _MergedGlobals = (uint64_t)result;
  return result;
}

const char *radio::asString(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 7)
    return "Unknown";
  else
    return off_251CB54A8[v1];
}

{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "FactoryCalibrationStatus::kUnknown";
  else
    return off_251CB55A0[v1];
}

{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "RFCalibrationStatus::kUnknown";
  else
    return off_251CB55D0[v1];
}

void radio::OpMode::~OpMode(radio::OpMode *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 2) = v2;
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
    v2 = (void *)*((_QWORD *)this + 1);
  }
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 2) = v2;
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
    v2 = (void *)*((_QWORD *)this + 1);
  }
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void radio::OpMode::create(_QWORD *a1@<X8>)
{
  char *v3;

  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  v3 = (char *)operator new(0x50uLL);
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = off_251CB5468;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *((_QWORD *)v3 + 9) = 0;
  a1[1] = v3;
  *(_OWORD *)(v3 + 24) = 0u;
  v3 += 24;
  *a1 = v3;
  radio::OpMode::init((radio::OpMode *)v3);
}

void sub_24B84BC34(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void radio::OpMode::init(radio::OpMode *this)
{
  int RadioVendor;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _WORD *v7;
  _WORD *v8;

  *(_BYTE *)this = 8;
  *((_WORD *)this + 1) = 0;
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    v7 = operator new(7uLL);
    *(_DWORD *)v7 = 262657;
    v7[2] = 1536;
    *((_BYTE *)v7 + 6) = 7;
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    *((_QWORD *)this + 2) = (char *)v7 + 7;
    *((_QWORD *)this + 3) = (char *)v7 + 7;
    if (!v5)
      return;
    goto LABEL_9;
  }
  if (RadioVendor == 4)
  {
    v8 = operator new(2uLL);
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8;
    *v8++ = 1;
    *((_QWORD *)this + 2) = v8;
    *((_QWORD *)this + 3) = v8;
    if (!v5)
      return;
LABEL_9:
    operator delete(v5);
    return;
  }
  if (RadioVendor == 1)
  {
    v3 = operator new(8uLL);
    *v3 = 0xB09050403020100;
    v4 = operator new(8uLL);
    *v4 = 0x3000200010000;
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v3;
    *((_QWORD *)this + 2) = v3 + 1;
    v6 = (void *)*((_QWORD *)this + 4);
    *((_QWORD *)this + 3) = v3 + 1;
    *((_QWORD *)this + 4) = v4;
    *((_QWORD *)this + 5) = v4 + 1;
    *((_QWORD *)this + 6) = v4 + 1;
    if (v6)
      operator delete(v6);
    if (v5)
      goto LABEL_9;
  }
}

void sub_24B84BD6C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_BYTE *radio::OpMode::setMode(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t radio::OpMode::setMode(uint64_t this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(this + 8);
  v3 = *(_QWORD *)(this + 16);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3)
        goto LABEL_5;
    }
  }
  *(_BYTE *)this = v4;
  return this;
}

uint64_t radio::OpMode::convertMode(radio::OpMode *this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3)
        goto LABEL_5;
    }
  }
  return v4;
}

uint64_t radio::OpMode::getMode(radio::OpMode *this)
{
  return *(unsigned __int8 *)this;
}

uint64_t radio::OpMode::getModeValue(radio::OpMode *this)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)this;
  v2 = *((_QWORD *)this + 1);
  if (*((_QWORD *)this + 2) - v2 <= v1)
    return 255;
  else
    return *(unsigned __int8 *)(v2 + v1);
}

uint64_t radio::OpMode::convertMode(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(a1 + 16) - v2 <= (unint64_t)a2)
    return 255;
  else
    return *(unsigned __int8 *)(v2 + a2);
}

uint64_t radio::OpMode::setConfig(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 2) = a2;
  return result;
}

uint64_t radio::OpMode::setConfig(uint64_t this, int a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  __int16 v4;

  v2 = *(unsigned __int16 **)(this + 32);
  v3 = *(unsigned __int16 **)(this + 40);
  if (v2 == v3)
  {
LABEL_5:
    v4 = 0;
  }
  else
  {
    v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3)
        goto LABEL_5;
    }
  }
  *(_WORD *)(this + 2) = v4;
  return this;
}

uint64_t radio::OpMode::convertConfig(radio::OpMode *this, int a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  unsigned __int16 v4;

  v2 = (unsigned __int16 *)*((_QWORD *)this + 4);
  v3 = (unsigned __int16 *)*((_QWORD *)this + 5);
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3)
        return 0;
    }
  }
  return v4;
}

uint64_t radio::OpMode::getConfig(radio::OpMode *this)
{
  return *((unsigned __int16 *)this + 1);
}

uint64_t radio::OpMode::getConfigValue(radio::OpMode *this)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *((unsigned __int8 *)this + 2);
  v2 = *((_QWORD *)this + 4);
  if (v1 >= (*((_QWORD *)this + 5) - v2) >> 1)
    return 0xFFFFLL;
  else
    return *(unsigned __int16 *)(v2 + 2 * v1);
}

uint64_t radio::OpMode::convertConfig(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 40) - v2) >> 1))
    return 0xFFFFLL;
  else
    return *(unsigned __int16 *)(v2 + 2 * a2);
}

BOOL radio::OpMode::allowModeChange(radio::OpMode *this)
{
  unsigned int v1;
  int v3;

  v1 = *((unsigned __int16 *)this + 1);
  if (v1 < 2)
    return 1;
  if (v1 == 3)
  {
    v3 = *(unsigned __int8 *)this;
    if ((v3 & 0xFE) == 4)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)this;
  }
  return v3 != 2;
}

uint64_t radio::OpMode::getModeString@<X0>(radio::OpMode *this@<X0>, _BYTE *a2@<X8>)
{
  return radio::OpMode::modeToString((uint64_t)this, *(unsigned __int8 *)this, a2);
}

uint64_t radio::OpMode::modeToString@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, _BYTE *a3@<X8>)
{
  __int128 v6;
  const char *v7;
  size_t v8;
  int RadioVendor;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  char v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  size_t v22;
  _BYTE *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *__src[2];
  void *__p[2];
  __int128 v36;
  __int128 v37;
  _OWORD v38[9];
  unint64_t v39;

  v39 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[7] = v6;
  v38[8] = v6;
  v38[5] = v6;
  v38[6] = v6;
  v38[3] = v6;
  v38[4] = v6;
  v38[1] = v6;
  v38[2] = v6;
  v37 = v6;
  v38[0] = v6;
  *(_OWORD *)__p = v6;
  v36 = v6;
  v33 = v6;
  *(_OWORD *)__src = v6;
  v31 = v6;
  v32 = v6;
  v30 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v30);
  if (a2 > 7)
    v7 = "Unknown";
  else
    v7 = off_251CB54A8[(char)a2];
  v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)v7, v8);
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v16 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16) - v16 <= (unint64_t)a2 || (v17 = *(char *)(v16 + a2), v17 > 7))
      v13 = "Unknown";
    else
      v13 = off_251CB5548[v17];
  }
  else if (RadioVendor == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v18 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16) - v18 <= (unint64_t)a2 || (v19 = *(char *)(v18 + a2), v19 > 0xB))
      v13 = "Unknown";
    else
      v13 = off_251CB54E8[v19];
  }
  else
  {
    if (RadioVendor != 4)
      goto LABEL_23;
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v11 = *(_QWORD *)(a1 + 8);
    v12 = a2;
    v13 = "Unknown";
    if (*(_QWORD *)(a1 + 16) - v11 > v12)
    {
      v14 = *(_BYTE *)(v11 + v12);
      v15 = "Online";
      if (v14 != 1)
        v15 = "Unknown";
      if (v14)
        v13 = v15;
      else
        v13 = "Airplane";
    }
  }
  v20 = strlen(v13);
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)v13, v20);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)" ]", 2);
LABEL_23:
  if ((BYTE8(v37) & 0x10) != 0)
  {
    v23 = (_BYTE *)v37;
    if ((void *)v37 < __src[1])
    {
      *(void **)&v37 = __src[1];
      v23 = __src[1];
    }
    v24 = __src[0];
    v22 = v23 - (char *)__src[0];
    if ((unint64_t)(v23 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_40;
  }
  else
  {
    if ((BYTE8(v37) & 8) == 0)
    {
      v22 = 0;
      a3[23] = 0;
      goto LABEL_36;
    }
    v24 = (const void *)*((_QWORD *)&v32 + 1);
    v22 = *((_QWORD *)&v33 + 1) - *((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v33 + 1) - *((_QWORD *)&v32 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_40:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v22 >= 0x17)
  {
    v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17)
      v25 = v22 | 7;
    v26 = v25 + 1;
    v27 = operator new(v25 + 1);
    *((_QWORD *)a3 + 1) = v22;
    *((_QWORD *)a3 + 2) = v26 | 0x8000000000000000;
    *(_QWORD *)a3 = v27;
    a3 = v27;
    goto LABEL_35;
  }
  a3[23] = v22;
  if (v22)
LABEL_35:
    memmove(a3, v24, v22);
LABEL_36:
  a3[v22] = 0;
  *(_QWORD *)&v30 = *MEMORY[0x24BEDB7F0];
  v28 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v30 + *(_QWORD *)(v30 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v31 = v28;
  *((_QWORD *)&v31 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v36) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2888C](v38);
}

void sub_24B84C2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B84C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B84C304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B84C318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::OpMode::modeToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *((_QWORD *)this + 1);
  v4 = *((_QWORD *)this + 2);
  if (v3 == v4)
  {
LABEL_5:
    LOBYTE(v5) = 8;
  }
  else
  {
    v5 = 0;
    while (*(unsigned __int8 *)(v3 + v5) != a2)
    {
      ++v5;
      if (v3 + v5 == v4)
        goto LABEL_5;
    }
  }
  return radio::OpMode::modeToString((uint64_t)this, v5, a3);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_24B84C468(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x24BD2888C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2888C](a1 + 128);
  return a1;
}

uint64_t radio::OpMode::getConfigString@<X0>(radio::OpMode *this@<X0>, _BYTE *a2@<X8>)
{
  return radio::OpMode::configToString((uint64_t)this, *((unsigned __int16 *)this + 1), a2);
}

uint64_t radio::OpMode::configToString@<X0>(uint64_t a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  __int128 v6;
  const char *v7;
  size_t v8;
  int RadioVendor;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  size_t v16;
  _QWORD *v17;
  size_t v18;
  _BYTE *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *__src[2];
  void *__p[2];
  __int128 v32;
  __int128 v33;
  _OWORD v34[9];
  unint64_t v35;

  v35 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[7] = v6;
  v34[8] = v6;
  v34[5] = v6;
  v34[6] = v6;
  v34[3] = v6;
  v34[4] = v6;
  v34[1] = v6;
  v34[2] = v6;
  v33 = v6;
  v34[0] = v6;
  *(_OWORD *)__p = v6;
  v32 = v6;
  v29 = v6;
  *(_OWORD *)__src = v6;
  v27 = v6;
  v28 = v6;
  v26 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v26);
  if ((a2 - 1) > 2)
    v7 = "Unknown";
  else
    v7 = off_251CB5588[(__int16)(a2 - 1)];
  v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v7, v8);
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
      v13 = *(_QWORD *)(a1 + 32);
      if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 40) - v13) >> 1)
        || (v14 = *(unsigned __int16 *)(v13 + 2 * a2) - 1, v14 > 2))
      {
        v15 = "Unknown";
      }
      else
      {
        v15 = off_251CB5588[(__int16)v14];
      }
      v16 = strlen(v15);
      v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" ]", 2);
    }
  }
  else
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Invalid for ICE", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" ]", 2);
  }
  if ((BYTE8(v33) & 0x10) != 0)
  {
    v19 = (_BYTE *)v33;
    if ((void *)v33 < __src[1])
    {
      *(void **)&v33 = __src[1];
      v19 = __src[1];
    }
    v20 = __src[0];
    v18 = v19 - (char *)__src[0];
    if ((unint64_t)(v19 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_29;
  }
  else
  {
    if ((BYTE8(v33) & 8) == 0)
    {
      v18 = 0;
      a3[23] = 0;
      goto LABEL_25;
    }
    v20 = (const void *)*((_QWORD *)&v28 + 1);
    v18 = *((_QWORD *)&v29 + 1) - *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v29 + 1) - *((_QWORD *)&v28 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_29:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v18 >= 0x17)
  {
    v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v21 = v18 | 7;
    v22 = v21 + 1;
    v23 = operator new(v21 + 1);
    *((_QWORD *)a3 + 1) = v18;
    *((_QWORD *)a3 + 2) = v22 | 0x8000000000000000;
    *(_QWORD *)a3 = v23;
    a3 = v23;
    goto LABEL_24;
  }
  a3[23] = v18;
  if (v18)
LABEL_24:
    memmove(a3, v20, v18);
LABEL_25:
  a3[v18] = 0;
  *(_QWORD *)&v26 = *MEMORY[0x24BEDB7F0];
  v24 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v26 + *(_QWORD *)(v26 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v27 = v24;
  *((_QWORD *)&v27 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v32) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2888C](v34);
}

void sub_24B84C7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_24B84C7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::OpMode::configToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  unsigned __int16 v5;

  v3 = (unsigned __int16 *)*((_QWORD *)this + 4);
  v4 = (unsigned __int16 *)*((_QWORD *)this + 5);
  if (v3 == v4)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    while (*v3 != a2)
    {
      ++v3;
      ++v5;
      if (v3 == v4)
        goto LABEL_5;
    }
  }
  return radio::OpMode::configToString((uint64_t)this, v5, a3);
}

const char *radio::asStringV2(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "FactoryCalibrationStatus::kUnknown";
  else
    return off_251CB55B8[v1];
}

uint64_t radio::RFCalibration_t::toString@<X0>(radio::RFCalibration_t *this@<X0>, _BYTE *a2@<X8>)
{
  __int128 v4;
  unint64_t v5;
  const char *v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  int v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  int v29;
  const char *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  int v36;
  int v37;
  const char *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  size_t v48;
  _BYTE *v49;
  const void *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *__src[2];
  void *__p[2];
  __int128 v62;
  __int128 v63;
  _OWORD v64[9];
  unint64_t v65;

  v65 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v64[7] = v4;
  v64[8] = v4;
  v64[5] = v4;
  v64[6] = v4;
  v64[3] = v4;
  v64[4] = v4;
  v64[1] = v4;
  v64[2] = v4;
  v63 = v4;
  v64[0] = v4;
  *(_OWORD *)__p = v4;
  v62 = v4;
  v59 = v4;
  *(_OWORD *)__src = v4;
  v57 = v4;
  v58 = v4;
  v56 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v56);
  v5 = *(char *)this;
  if (v5 > 2)
    v6 = "RFCalibrationStatus::kUnknown";
  else
    v6 = off_251CB55D0[v5];
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)v6, v7);
  if (*(_BYTE *)this == 1)
  {
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nGSM: ", 6);
    *(_DWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"0x", 2);
    v9 = (_QWORD *)std::ostream::operator<<();
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"0x", 2);
    v11 = (_QWORD *)std::ostream::operator<<();
    v12 = *((unsigned __int16 *)this + 1);
    v13 = *((unsigned __int16 *)this + 2);
    if (v12 == v13)
      v14 = " - CORRECT";
    else
      v14 = " - INCORRECT";
    if (v12 == v13)
      v15 = 10;
    else
      v15 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v14, v15);
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nCDMA: ", 7);
    *(_DWORD *)((char *)v16 + *(_QWORD *)(*v16 - 24) + 8) = *(_DWORD *)((_BYTE *)v16 + *(_QWORD *)(*v16 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"0x", 2);
    v17 = (_QWORD *)std::ostream::operator<<();
    v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 8) = *(_DWORD *)((_BYTE *)v18 + *(_QWORD *)(*v18 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = *((_DWORD *)this + 2);
    v21 = *((_DWORD *)this + 3);
    if (v20 == v21)
      v22 = " - CORRECT";
    else
      v22 = " - INCORRECT";
    if (v20 == v21)
      v23 = 10;
    else
      v23 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v22, v23);
    v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nWCDMA: ", 8);
    *(_DWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 8) = *(_DWORD *)((_BYTE *)v24 + *(_QWORD *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"0x", 2);
    v25 = (_QWORD *)std::ostream::operator<<();
    v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v26 + *(_QWORD *)(*v26 - 24) + 8) = *(_DWORD *)((_BYTE *)v26 + *(_QWORD *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"0x", 2);
    v27 = (_QWORD *)std::ostream::operator<<();
    v28 = *((_DWORD *)this + 4);
    v29 = *((_DWORD *)this + 5);
    if (v28 == v29)
      v30 = " - CORRECT";
    else
      v30 = " - INCORRECT";
    if (v28 == v29)
      v31 = 10;
    else
      v31 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v30, v31);
    v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nTDSCDMA: ", 10);
    *(_DWORD *)((char *)v32 + *(_QWORD *)(*v32 - 24) + 8) = *(_DWORD *)((_BYTE *)v32 + *(_QWORD *)(*v32 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"0x", 2);
    v33 = (_QWORD *)std::ostream::operator<<();
    v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v34 + *(_QWORD *)(*v34 - 24) + 8) = *(_DWORD *)((_BYTE *)v34 + *(_QWORD *)(*v34 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"0x", 2);
    v35 = (_QWORD *)std::ostream::operator<<();
    v36 = *((_DWORD *)this + 6);
    v37 = *((_DWORD *)this + 7);
    if (v36 == v37)
      v38 = " - CORRECT";
    else
      v38 = " - INCORRECT";
    if (v36 == v37)
      v39 = 10;
    else
      v39 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)v38, v39);
    v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nLTE: ", 6);
    *(_DWORD *)((char *)v40 + *(_QWORD *)(*v40 - 24) + 8) = *(_DWORD *)((_BYTE *)v40 + *(_QWORD *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)"0x", 2);
    v41 = (_QWORD *)std::ostream::operator<<();
    v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v42 + *(_QWORD *)(*v42 - 24) + 8) = *(_DWORD *)((_BYTE *)v42 + *(_QWORD *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"0x", 2);
    v43 = (_QWORD *)std::ostream::operator<<();
    v44 = *((_QWORD *)this + 4);
    v45 = *((_QWORD *)this + 5);
    if (v44 == v45)
      v46 = " - CORRECT";
    else
      v46 = " - INCORRECT";
    if (v44 == v45)
      v47 = 10;
    else
      v47 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)v46, v47);
  }
  if ((BYTE8(v63) & 0x10) != 0)
  {
    v49 = (_BYTE *)v63;
    if ((void *)v63 < __src[1])
    {
      *(void **)&v63 = __src[1];
      v49 = __src[1];
    }
    v50 = __src[0];
    v48 = v49 - (char *)__src[0];
    if ((unint64_t)(v49 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_53;
  }
  else
  {
    if ((BYTE8(v63) & 8) == 0)
    {
      v48 = 0;
      a2[23] = 0;
      goto LABEL_49;
    }
    v50 = (const void *)*((_QWORD *)&v58 + 1);
    v48 = *((_QWORD *)&v59 + 1) - *((_QWORD *)&v58 + 1);
    if (*((_QWORD *)&v59 + 1) - *((_QWORD *)&v58 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_53:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v48 >= 0x17)
  {
    v51 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v48 | 7) != 0x17)
      v51 = v48 | 7;
    v52 = v51 + 1;
    v53 = operator new(v51 + 1);
    *((_QWORD *)a2 + 1) = v48;
    *((_QWORD *)a2 + 2) = v52 | 0x8000000000000000;
    *(_QWORD *)a2 = v53;
    a2 = v53;
    goto LABEL_48;
  }
  a2[23] = v48;
  if (v48)
LABEL_48:
    memmove(a2, v50, v48);
LABEL_49:
  a2[v48] = 0;
  *(_QWORD *)&v56 = *MEMORY[0x24BEDB7F0];
  v54 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v56 + *(_QWORD *)(v56 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v57 = v54;
  *((_QWORD *)&v57 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v62) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2888C](v64);
}

void sub_24B84CE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_BYTE *radio::RFCalibration_t::RFCalibration_t(_BYTE *this)
{
  *this = 2;
  return this;
}

{
  *this = 2;
  return this;
}

BOOL radio::RFCalibration_t::fill(uint64_t a1, const __CFDictionary **a2)
{
  const __CFDictionary *v2;
  uint64_t (*v3)(uint64_t);
  int Bool;
  const __CFNumber *v6;
  const __CFNumber *v7;
  int v8;
  const __CFNumber *v10;
  const __CFNumber *v11;
  unint64_t valuePtr;
  _QWORD v13[2];

  v2 = *a2;
  v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v2)
    v3 = 0;
  if (!v3)
    return 0;
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v13, v2);
  Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v13, CFSTR("BasebandRFCalibrationPresentStatus"));
  *(_BYTE *)a1 = Bool;
  if (Bool)
  {
    *(_WORD *)(a1 + 2) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandGSMCalibrationStatus"));
    *(_WORD *)(a1 + 4) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandGSMCalibrationMask"));
    *(_DWORD *)(a1 + 8) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 12) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandCDMACalibrationMask"));
    *(_DWORD *)(a1 + 16) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandWCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 20) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandWCDMACalibrationMask"));
    *(_DWORD *)(a1 + 24) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandTDSCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 28) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandTDSCDMACalibrationMask"));
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    v6 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, CFSTR("BasebandLTECalibrationStatus"));
    v7 = v6;
    if (v6)
    {
      if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
      {
        *(_QWORD *)(a1 + 32) = valuePtr;
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v7);
      valuePtr = 0;
    }
    else
    {
      v8 = 1;
    }
    v10 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, CFSTR("BasebandLTECalibrationMask"));
    v11 = v10;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr))
        *(_QWORD *)(a1 + 40) = valuePtr;
      else
        v8 = 0;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = 0;
  }
  MEMORY[0x24BD286AC](v13);
  return v8 != 0;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const char *radio::asString(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 1;
  if (v1 > 4)
    return "Other";
  else
    return off_251CB55E8[v1];
}

const char *radio::asString(_BYTE *a1)
{
  const char *v1;

  v1 = "Invalid";
  if (!*a1)
    v1 = "Disabled";
  if (*a1 == 1)
    return "Enabled";
  else
    return v1;
}

{
  const char *v1;

  v1 = "Invalid";
  if (!*a1)
    v1 = "Disabled";
  if (*a1 == 1)
    return "Enabled";
  else
    return v1;
}

uint64_t radio::BasebandProperties::create(const __CFDictionary **a1)
{
  const __CFDictionary *v1;
  int Bool;
  int Int;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  __CFString *v8;

  v1 = *a1;
  if (!*a1)
    return 0xAAAAAAAAAAAAAA00;
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v7, v1);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyCoredumpSupported");
  Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x24BD28688](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyPowerSequenceIndex");
  Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x24BD28688](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyBasebandVersion");
  v4 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x24BD28688](&v8);
  MEMORY[0x24BD286AC](v7);
  v5 = 256;
  if (!Bool)
    v5 = 0;
  return (Int << 16) | (unint64_t)(v4 << 32) | v5 | 1;
}

void sub_24B84D220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  MEMORY[0x24BD28688](va1);
  MEMORY[0x24BD286AC]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void radio::BasebandProperties::toDict(radio::BasebandProperties *this@<X0>, __CFDictionary **a2@<X8>)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  int v6;
  const __CFAllocator *v7;
  const __CFAllocator *v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  CFNumberRef v14;
  const __CFAllocator *v15;
  CFNumberRef v16;
  void *v17;
  void *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFTypeID v21;
  void *key;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = *((unsigned __int8 *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyCoredumpSupported", (const char *)0x8000100, (uint64_t)v4, v7);
  v9 = key;
  v10 = (void **)MEMORY[0x24BDBD270];
  if (!v6)
    v10 = (void **)MEMORY[0x24BDBD268];
  v11 = *v10;
  key = *v10;
  if (v9 && v11)
  {
    CFDictionaryAddValue(Mutable, v9, v11);
  }
  else if (!v11)
  {
    goto LABEL_8;
  }
  CFRelease(v11);
LABEL_8:
  if (v9)
    CFRelease(v9);
  v12 = (void *)*((unsigned __int16 *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyPowerSequenceIndex", (const char *)0x8000100, (uint64_t)v4, v8);
  v13 = key;
  key = v12;
  v14 = CFNumberCreate(v4, kCFNumberLongLongType, &key);
  v16 = v14;
  if (v13 && v14)
  {
    CFDictionaryAddValue(Mutable, v13, v14);
  }
  else if (!v14)
  {
    goto LABEL_15;
  }
  CFRelease(v16);
LABEL_15:
  if (v13)
    CFRelease(v13);
  v17 = (void *)*((unsigned int *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyBasebandVersion", (const char *)0x8000100, (uint64_t)v4, v15);
  v18 = key;
  key = v17;
  v19 = CFNumberCreate(v4, kCFNumberLongLongType, &key);
  v20 = v19;
  if (v18 && v19)
  {
    CFDictionaryAddValue(Mutable, v18, v19);
  }
  else if (!v19)
  {
    goto LABEL_22;
  }
  CFRelease(v20);
LABEL_22:
  if (v18)
    CFRelease(v18);
  if (Mutable)
  {
    v21 = CFGetTypeID(Mutable);
    if (v21 == CFDictionaryGetTypeID())
    {
      *a2 = Mutable;
      CFRetain(Mutable);
    }
    else
    {
      *a2 = 0;
    }
    CFRelease(Mutable);
  }
  else
  {
    *a2 = 0;
  }
}

void sub_24B84D490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a11);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_24B84D4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, const void *a11)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a11);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_24B84D500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CB5468;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CB5468;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<radio::OpMode>::__on_zero_shared(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  a1[5] = v2;
  v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    operator delete(v3);
    v2 = (void *)a1[4];
  }
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

const char *BasebandDiagnostics::getName(BasebandDiagnostics *this)
{
  return "BBDiagnostics";
}

const char *BasebandDiagnostics::asString(uint64_t a1, unsigned int a2)
{
  if (a2 > 3)
    return "Invalid";
  else
    return (&off_251CB5778)[a2];
}

void BasebandDiagnostics::BasebandDiagnostics(BasebandDiagnostics *this)
{
  uint64_t v2;
  NSObject *initially_inactive;
  NSObject *v4;
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  dispatch_group_t v12;
  NSObject *v13;
  __int128 v14;

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v14, "com.apple.telephony.abm", "BBDiag");
  v2 = *((_QWORD *)&v14 + 1);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v4 = dispatch_queue_create_with_target_V2("BasebandDiagnostics", initially_inactive, 0);
  dispatch_set_qos_class_floor(v4, QOS_CLASS_UTILITY, 0);
  dispatch_activate(v4);
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    *((_QWORD *)this + 4) = 0;
    dispatch_release(v4);
  }
  else
  {
    *((_QWORD *)this + 4) = 0;
  }
  MEMORY[0x24BD2864C]((char *)this + 40, v2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v14);
  *(_QWORD *)this = &off_251CB5620;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_QWORD *)this + 10) = 0;
  abm::client::CreateManager();
  v5 = v14;
  v14 = 0uLL;
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  *(_OWORD *)((char *)this + 56) = v5;
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
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  if (*((_QWORD *)&v14 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  *((_BYTE *)this + 96) = 0;
  v12 = dispatch_group_create();
  v13 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = v12;
  if (v13)
    dispatch_release(v13);
}

void sub_24B84D7CC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void **v3;
  uint64_t v4;
  NSObject **v5;
  void **v6;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v6 = v3;
  v8 = *v6;
  if (*v6)
  {
    v1[14] = v8;
    operator delete(v8);
  }
  v9 = v1[10];
  if (v9)
  {
    dispatch_group_leave(v9);
    v10 = v1[10];
    if (v10)
      dispatch_release(v10);
  }
  v11 = v1[9];
  if (v11)
  {
    dispatch_release(v11);
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v4);
    v12 = *v5;
    if (!*v5)
    {
LABEL_8:
      ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(v2);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v4);
    v12 = *v5;
    if (!*v5)
      goto LABEL_8;
  }
  dispatch_release(v12);
  ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(v2);
  _Unwind_Resume(a1);
}

void sub_24B84D84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;

  ctu::SharedSynchronizable<BasebandDiagnostics>::~SharedSynchronizable(v9);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  MEMORY[0x24BD28658](a1 + 4);
  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void BasebandDiagnostics::~BasebandDiagnostics(BasebandDiagnostics *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  std::__shared_weak_count *v19;

  *(_QWORD *)this = &off_251CB5620;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v19 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  abm::client::EventsOff();
  if (v19)
  {
    v5 = (unint64_t *)&v19->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v7 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v7)
  {
    dispatch_group_leave(v7);
    dispatch_release(v7);
  }
  v8 = (void *)*((_QWORD *)this + 13);
  if (v8)
  {
    *((_QWORD *)this + 14) = v8;
    operator delete(v8);
  }
  v9 = *((_QWORD *)this + 10);
  if (v9)
  {
    dispatch_group_leave(v9);
    v10 = *((_QWORD *)this + 10);
    if (v10)
      dispatch_release(v10);
  }
  v11 = *((_QWORD *)this + 9);
  if (v11)
    dispatch_release(v11);
  v12 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  if (v12)
  {
    v13 = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = *((_QWORD *)this + 6);
  if (v15)
    dispatch_release(v15);
  MEMORY[0x24BD28658]((char *)this + 40);
  v16 = *((_QWORD *)this + 4);
  if (v16)
    dispatch_release(v16);
  v17 = *((_QWORD *)this + 3);
  if (v17)
    dispatch_release(v17);
  v18 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
}

{
  void *v1;

  BasebandDiagnostics::~BasebandDiagnostics(this);
  operator delete(v1);
}

BOOL BasebandDiagnostics::resetBaseband(uint64_t a1, uint64_t a2, int a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  const char *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  const void *v20;
  size_t v21;
  size_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  _BYTE *v32;
  const char *v33;
  std::__shared_weak_count *v35;
  unint64_t v36;
  __int128 __p;
  uint64_t v38;
  _BYTE __dst[24];
  _BYTE buf[24];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = 0xAAAAAAAAE020E002;
  __p = 0uLL;
  v38 = 0;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v6) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v8 = xpc_int64_create(20000);
  if (!v8)
    v8 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE04E20], v8);
  v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  if (a3)
  {
    v10 = xpc_string_create((const char *)*MEMORY[0x24BE051D0]);
    if (!v10)
      v10 = xpc_null_create();
  }
  else
  {
    v10 = xpc_string_create((const char *)*MEMORY[0x24BE051D8]);
    if (!v10)
      v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE051A0], v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  v12 = xpc_string_create((const char *)*MEMORY[0x24BE05710]);
  if (!v12)
    v12 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE05398], v12);
  v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  if (*(char *)(a2 + 23) >= 0)
    v14 = (const char *)a2;
  else
    v14 = *(const char **)a2;
  v15 = xpc_string_create(v14);
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE052E8], v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  v17 = *(std::__shared_weak_count **)(a1 + 64);
  v35 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  v20 = (const void *)*MEMORY[0x24BE05170];
  v21 = strlen((const char *)*MEMORY[0x24BE05170]);
  if (v21 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v22 = v21;
  if (v21 >= 0x17)
  {
    v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v24 = v21 | 7;
    v25 = v24 + 1;
    v23 = operator new(v24 + 1);
    *(_QWORD *)&__dst[8] = v22;
    *(_QWORD *)&__dst[16] = v25 | 0x8000000000000000;
    *(_QWORD *)__dst = v23;
    goto LABEL_32;
  }
  __dst[23] = v21;
  v23 = __dst;
  if (v21)
LABEL_32:
    memmove(v23, v20, v22);
  v23[v22] = 0;
  abm::client::PerformCommand();
  LODWORD(v36) = *(_DWORD *)buf;
  if (SHIBYTE(v38) < 0)
    operator delete((void *)__p);
  __p = *(_OWORD *)&buf[8];
  v38 = v41;
  HIBYTE(v41) = 0;
  buf[8] = 0;
  if ((__dst[23] & 0x80000000) != 0)
    operator delete(*(void **)__dst);
  if (!v35)
    goto LABEL_41;
  v26 = (unint64_t *)&v35->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
    std::__shared_weak_count::__release_weak(v35);
    v28 = v36;
    v29 = *(NSObject **)(a1 + 40);
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v36)
    {
LABEL_42:
      if (v30)
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)&v36, buf);
        v31 = "soft";
        if (a3)
          v31 = "hard";
        if (buf[23] >= 0)
          v32 = buf;
        else
          v32 = *(_BYTE **)buf;
        *(_DWORD *)__dst = 136315394;
        *(_QWORD *)&__dst[4] = v31;
        *(_WORD *)&__dst[12] = 2080;
        *(_QWORD *)&__dst[14] = v32;
        _os_log_impl(&dword_24B846000, v29, OS_LOG_TYPE_DEFAULT, "#I Baseband %s reset failed: %s", __dst, 0x16u);
        if ((buf[23] & 0x80000000) != 0)
          operator delete(*(void **)buf);
      }
      goto LABEL_55;
    }
  }
  else
  {
LABEL_41:
    v28 = v36;
    v29 = *(NSObject **)(a1 + 40);
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v36)
      goto LABEL_42;
  }
  if (v30)
  {
    v33 = "soft";
    if (a3)
      v33 = "hard";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v33;
    _os_log_impl(&dword_24B846000, v29, OS_LOG_TYPE_DEFAULT, "#I Baseband %s reset success", buf, 0xCu);
  }
LABEL_55:
  xpc_release(v7);
  if (SHIBYTE(v38) < 0)
    operator delete((void *)__p);
  return v28 == 0;
}

void sub_24B84DF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t BasebandDiagnostics::getOperatingMode(BasebandDiagnostics *this)
{
  NSObject *v2;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  const void *v12;
  size_t v13;
  size_t v14;
  __int128 *p_dst;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  NSObject *v22;
  _BYTE *v23;
  uint64_t v24;
  xpc_object_t value;
  unsigned __int8 v27;
  NSObject *v28;
  const char *v29;
  std::__shared_weak_count *v30;
  xpc_object_t v31;
  uint8_t buf[8];
  __int128 __p;
  uint64_t v34;
  __int128 __dst;
  unint64_t v36;
  _BYTE object[24];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B846000, v2, OS_LOG_TYPE_DEFAULT, "#I Getting baseband operating mode", buf, 2u);
  }
  *(_QWORD *)buf = 0xAAAAAAAAE020E002;
  __p = 0uLL;
  v34 = 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = MEMORY[0x24BDACFA0];
  if (v3 || (v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v3) == v4)
    {
      xpc_retain(v3);
      v5 = v3;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v3 = 0;
  }
  xpc_release(v3);
  v6 = xpc_int64_create(180000);
  if (!v6)
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x24BE04E20], v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  v8 = xpc_null_create();
  v9 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v30 = v9;
  v31 = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12 = (const void *)*MEMORY[0x24BE05720];
  v13 = strlen((const char *)*MEMORY[0x24BE05720]);
  if (v13 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v14 = v13;
  if (v13 >= 0x17)
  {
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    p_dst = (__int128 *)operator new(v16 + 1);
    *((_QWORD *)&__dst + 1) = v14;
    v36 = v17 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_21;
  }
  HIBYTE(v36) = v13;
  p_dst = &__dst;
  if (v13)
LABEL_21:
    memmove(p_dst, v12, v14);
  *((_BYTE *)p_dst + v14) = 0;
  abm::client::PerformCommand();
  *(_DWORD *)buf = *(_DWORD *)object;
  if (SHIBYTE(v34) < 0)
    operator delete((void *)__p);
  __p = *(_OWORD *)&object[8];
  v34 = v38;
  HIBYTE(v38) = 0;
  object[8] = 0;
  if (SHIBYTE(v36) < 0)
    operator delete((void *)__dst);
  if (!v30)
    goto LABEL_30;
  v18 = (unint64_t *)&v30->__shared_owners_;
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
    v20 = v31;
    if (v31)
      goto LABEL_34;
  }
  else
  {
LABEL_30:
    v20 = v31;
    if (v31)
      goto LABEL_34;
  }
  v20 = xpc_null_create();
  if (!v20)
  {
    v21 = xpc_null_create();
    v20 = 0;
    goto LABEL_37;
  }
LABEL_34:
  if (MEMORY[0x24BD28B14](v20) == v4)
  {
    xpc_retain(v20);
    v21 = v20;
  }
  else
  {
    v21 = xpc_null_create();
  }
LABEL_37:
  xpc_release(v20);
  if (!*(_DWORD *)buf && MEMORY[0x24BD28B14](v21) == v4)
  {
    value = xpc_dictionary_get_value(v21, (const char *)*MEMORY[0x24BE05460]);
    *(_QWORD *)object = value;
    if (value)
      xpc_retain(value);
    else
      *(_QWORD *)object = xpc_null_create();
    v27 = xpc::dyn_cast_or_default();
    xpc_release(*(xpc_object_t *)object);
    if (v27 >= 7u)
    {
      v24 = 5;
      v28 = *((_QWORD *)this + 5);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
    }
    else
    {
      v24 = dword_24B85383C[(char)v27];
      v28 = *((_QWORD *)this + 5);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
    }
    if (v24 > 3)
      v29 = "Invalid";
    else
      v29 = (&off_251CB5778)[(int)v24];
    *(_DWORD *)object = 136315138;
    *(_QWORD *)&object[4] = v29;
    _os_log_impl(&dword_24B846000, v28, OS_LOG_TYPE_DEFAULT, "#I Baseband operating mode: %s", object, 0xCu);
    goto LABEL_46;
  }
  v22 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, object);
    v23 = object[23] >= 0 ? object : *(_BYTE **)object;
    LODWORD(__dst) = 136315138;
    *(_QWORD *)((char *)&__dst + 4) = v23;
    _os_log_impl(&dword_24B846000, v22, OS_LOG_TYPE_DEFAULT, "#I Failed to get operating mode: %s", (uint8_t *)&__dst, 0xCu);
    if ((object[23] & 0x80000000) != 0)
      operator delete(*(void **)object);
  }
  v24 = 5;
LABEL_46:
  xpc_release(v21);
  xpc_release(v5);
  if (SHIBYTE(v34) < 0)
    operator delete((void *)__p);
  return v24;
}

void sub_24B84E4D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

BOOL BasebandDiagnostics::setOperatingMode(uint64_t a1, int a2)
{
  NSObject *v3;
  _BOOL8 v4;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  const void *v15;
  size_t v16;
  size_t v17;
  __int128 *p_dst;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  _BYTE *v25;
  const char *v26;
  std::__shared_weak_count *v28;
  uint8_t buf[8];
  __int128 __p;
  uint64_t v31;
  __int128 __dst;
  unint64_t v33;
  _BYTE v34[24];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 5)
  {
    v3 = *(NSObject **)(a1 + 40);
    v4 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B846000, v3, OS_LOG_TYPE_DEFAULT, "#I Invalid Baseband op mode", buf, 2u);
      return 0;
    }
    return v4;
  }
  *(_QWORD *)buf = 0xAAAAAAAAE020E002;
  __p = 0uLL;
  v31 = 0;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v6) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v8 = xpc_int64_create(5000);
  if (!v8)
    v8 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE04E20], v8);
  v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  switch(a2)
  {
    case 0:
      v10 = xpc_int64_create(0);
      if (!v10)
        v10 = xpc_null_create();
      goto LABEL_24;
    case 1:
      v10 = xpc_int64_create(1);
      if (!v10)
        v10 = xpc_null_create();
      goto LABEL_24;
    case 2:
      v10 = xpc_int64_create(2);
      if (!v10)
        v10 = xpc_null_create();
      goto LABEL_24;
    case 3:
      v10 = xpc_int64_create(3);
      if (!v10)
        v10 = xpc_null_create();
LABEL_24:
      xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x24BE05460], v10);
      v11 = xpc_null_create();
      xpc_release(v10);
      xpc_release(v11);
      break;
    default:
      break;
  }
  v12 = *(std::__shared_weak_count **)(a1 + 64);
  v28 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = (const void *)*MEMORY[0x24BE05730];
  v16 = strlen((const char *)*MEMORY[0x24BE05730]);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    p_dst = (__int128 *)operator new(v19 + 1);
    *((_QWORD *)&__dst + 1) = v17;
    v33 = v20 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v33) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_36;
  }
  memmove(p_dst, v15, v17);
LABEL_36:
  *((_BYTE *)p_dst + v17) = 0;
  abm::client::PerformCommand();
  *(_DWORD *)buf = *(_DWORD *)v34;
  if (SHIBYTE(v31) < 0)
    operator delete((void *)__p);
  __p = *(_OWORD *)&v34[8];
  v31 = v35;
  HIBYTE(v35) = 0;
  v34[8] = 0;
  if (SHIBYTE(v33) < 0)
    operator delete((void *)__dst);
  if (v28)
  {
    v21 = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v4 = *(_DWORD *)buf == 0;
  v23 = *(NSObject **)(a1 + 40);
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (*(_DWORD *)buf)
  {
    if (v24)
    {
      TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, v34);
      v25 = v34[23] >= 0 ? v34 : *(_BYTE **)v34;
      LODWORD(__dst) = 136315138;
      *(_QWORD *)((char *)&__dst + 4) = v25;
      _os_log_impl(&dword_24B846000, v23, OS_LOG_TYPE_DEFAULT, "#I Failed to set operating mode: %s", (uint8_t *)&__dst, 0xCu);
      if ((v34[23] & 0x80000000) != 0)
        operator delete(*(void **)v34);
    }
  }
  else if (v24)
  {
    if (a2 > 3)
      v26 = "Invalid";
    else
      v26 = (&off_251CB5778)[a2];
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)&v34[4] = v26;
    _os_log_impl(&dword_24B846000, v23, OS_LOG_TYPE_DEFAULT, "#I Set operating mode to %s success", v34, 0xCu);
  }
  xpc_release(v7);
  if (SHIBYTE(v31) < 0)
    operator delete((void *)__p);
  return v4;
}

void sub_24B84EAC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void BasebandDiagnostics::waitForBasebandOperatingMode(uint64_t a1, int a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  const void *v13;
  size_t v14;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  std::__shared_weak_count *v34;
  void *__dst[2];
  unint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;

  if (a2 == 5 || !*(_QWORD *)(a1 + 56))
    return;
  *(_DWORD *)(a1 + 88) = a2;
  *(_BYTE *)(a1 + 96) = 1;
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3 || (v4 = std::__shared_weak_count::lock(v3)) == 0)
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
  v10 = *(std::__shared_weak_count **)(a1 + 64);
  v37 = *(_QWORD *)(a1 + 56);
  v38 = v10;
  if (v10)
  {
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = (const void *)*MEMORY[0x24BE05778];
  v14 = strlen((const char *)*MEMORY[0x24BE05778]);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v15 = (void *)v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    __dst[1] = v15;
    v36 = v18 | 0x8000000000000000;
    __dst[0] = v16;
    goto LABEL_21;
  }
  HIBYTE(v36) = v14;
  v16 = __dst;
  if (v14)
LABEL_21:
    memmove(v16, v13, (size_t)v15);
  *((_BYTE *)v15 + (_QWORD)v16) = 0;
  do
    v19 = __ldxr(p_shared_weak_owners);
  while (__stxr(v19 + 1, p_shared_weak_owners));
  abm::client::RegisterEventHandler();
  if (SHIBYTE(v36) < 0)
    operator delete(__dst[0]);
  v20 = v38;
  if (v38)
  {
    v21 = (unint64_t *)&v38->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *(std::__shared_weak_count **)(a1 + 64);
  v34 = v23;
  if (v23)
  {
    v24 = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  abm::client::EventsOff();
  if (v34)
  {
    v26 = (unint64_t *)&v34->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v28 = *(std::__shared_weak_count **)(a1 + 64);
  v33 = v28;
  if (v28)
  {
    v29 = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 + 1, v29));
  }
  abm::client::EventsOn();
  if (v33)
  {
    v31 = (unint64_t *)&v33->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  std::__shared_weak_count::__release_weak(v5);
  std::__shared_weak_count::__release_weak(v5);
}

void sub_24B84EE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::__shared_weak_count *v25;

  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  if (a19)
  {
    std::__shared_weak_count::__release_weak(a19);
    std::__shared_weak_count::__release_weak(v25);
    _Unwind_Resume(a1);
  }
  std::__shared_weak_count::__release_weak(v25);
  _Unwind_Resume(a1);
}

void ___ZN19BasebandDiagnostics28waitForBasebandOperatingModeE14BasebandOpMode_block_invoke(_QWORD *a1, xpc_object_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  xpc_object_t v8;
  xpc_object_t value;
  unsigned __int8 v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  _BYTE object[12];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (std::__shared_weak_count *)a1[6];
  if (!v3)
    return;
  v5 = a1[4];
  v6 = std::__shared_weak_count::lock(v3);
  v21 = v6;
  if (!v6)
    return;
  if (!a1[5])
  {
    v7 = v6;
LABEL_33:
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  if (a2)
  {
    xpc_retain(a2);
    goto LABEL_8;
  }
  a2 = xpc_null_create();
  if (a2)
  {
LABEL_8:
    if (MEMORY[0x24BD28B14](a2) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(a2);
      v8 = a2;
    }
    else
    {
      v8 = xpc_null_create();
    }
    goto LABEL_12;
  }
  v8 = xpc_null_create();
  a2 = 0;
LABEL_12:
  xpc_release(a2);
  value = xpc_dictionary_get_value(v8, (const char *)*MEMORY[0x24BE05460]);
  *(_QWORD *)object = value;
  if (value)
    xpc_retain(value);
  else
    *(_QWORD *)object = xpc_null_create();
  v10 = xpc::dyn_cast_or_default();
  xpc_release(*(xpc_object_t *)object);
  v11 = *(NSObject **)(v5 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 7u)
    {
      v12 = "Unknown";
      if (*(_QWORD *)(v5 + 80))
      {
LABEL_18:
        v13 = *(int *)(v5 + 88);
        if (v13 > 3)
          v14 = "Invalid";
        else
          v14 = (&off_251CB5778)[v13];
        goto LABEL_23;
      }
    }
    else
    {
      v12 = (&off_251CB5738)[(char)v10];
      if (*(_QWORD *)(v5 + 80))
        goto LABEL_18;
    }
    v14 = "None";
LABEL_23:
    *(_DWORD *)object = 136315394;
    *(_QWORD *)&object[4] = v12;
    v23 = 2080;
    v24 = v14;
    _os_log_impl(&dword_24B846000, v11, OS_LOG_TYPE_DEFAULT, "#I BB mode event [%s] - target mode [%s]", object, 0x16u);
  }
  v15 = v10;
  if (v10 >= 4u)
    v15 = 5;
  *(_DWORD *)(v5 + 92) = v15;
  v16 = *(_DWORD *)(v5 + 88);
  if (v16 != 5 && v16 == v15)
  {
    *(_BYTE *)(v5 + 96) = 0;
    v17 = *(NSObject **)(v5 + 80);
    if (v17)
    {
      *(_QWORD *)(v5 + 80) = 0;
      dispatch_group_leave(v17);
      dispatch_release(v17);
    }
    else
    {
      v18 = *(NSObject **)(v5 + 40);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)object = 0;
        _os_log_impl(&dword_24B846000, v18, OS_LOG_TYPE_DEFAULT, "#I BB mode reached to target but no group waiting", object, 2u);
      }
    }
  }
  xpc_release(v8);
  v7 = v21;
  if (v21)
    goto LABEL_33;
}

void sub_24B84F1B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t __copy_helper_block_ea8_40c44_ZTSNSt3__18weak_ptrI19BasebandDiagnosticsEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_ea8_40c44_ZTSNSt3__18weak_ptrI19BasebandDiagnosticsEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

BOOL BasebandDiagnostics::updateBasebandOperatingMode(uint64_t a1, unsigned int a2, int a3, int a4)
{
  _BOOL8 v4;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  int OperatingMode;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const void **v22;
  int v23;
  size_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  char v30;
  _BOOL4 v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  dispatch_time_t v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  std::__shared_weak_count *v41;
  uint8_t v42[4];
  const char *v43;
  uint8_t buf[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a2 == 5)
    return 0;
  v6 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v6 || (v10 = std::__shared_weak_count::lock(v6)) == 0)
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v11 = v10;
  p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
  do
    v13 = __ldxr(p_shared_weak_owners);
  while (__stxr(v13 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (a2)
  {
    if (a4)
    {
      v16 = *(NSObject **)(a1 + 40);
      a4 = 0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 > 3)
          v17 = "Invalid";
        else
          v17 = (&off_251CB5778)[a2];
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_24B846000, v16, OS_LOG_TYPE_DEFAULT, "#I %s mode cannot be set by resetting", buf, 0xCu);
        a4 = 0;
      }
    }
  }
  OperatingMode = BasebandDiagnostics::getOperatingMode((BasebandDiagnostics *)a1);
  *(_DWORD *)(a1 + 92) = OperatingMode;
  if (OperatingMode == a2)
  {
    v4 = 1;
    goto LABEL_65;
  }
  BasebandDiagnostics::waitForBasebandOperatingMode(a1, a2);
  v41 = v11;
  while (*(_BYTE *)(a1 + 96))
  {
    v19 = *(NSObject **)(a1 + 72);
    if (v19)
    {
      dispatch_retain(*(dispatch_object_t *)(a1 + 72));
      dispatch_group_enter(v19);
    }
    v20 = *(NSObject **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v19;
    if (v20)
    {
      dispatch_group_leave(v20);
      dispatch_release(v20);
    }
    if (!a4)
      goto LABEL_43;
    v21 = (**(uint64_t (***)(uint64_t))a1)(a1);
    v22 = (const void **)v21;
    v23 = *(char *)(v21 + 23);
    if (v23 >= 0)
      v24 = *(unsigned __int8 *)(v21 + 23);
    else
      v24 = *(_QWORD *)(v21 + 8);
    v25 = v24 + 41;
    memset(buf, 170, sizeof(buf));
    if (v24 + 41 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v25 <= 0x16)
    {
      memset(buf, 0, sizeof(buf));
      v26 = buf;
      buf[23] = v24 + 41;
LABEL_37:
      if (v23 >= 0)
        v29 = v22;
      else
        v29 = *v22;
      memmove(v26, v29, v24);
      goto LABEL_41;
    }
    v27 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v27 = v25 | 7;
    v28 = v27 + 1;
    v26 = operator new(v27 + 1);
    *(_QWORD *)&buf[8] = v24 + 41;
    *(_QWORD *)&buf[16] = v28 | 0x8000000000000000;
    *(_QWORD *)buf = v26;
    if (v24)
      goto LABEL_37;
LABEL_41:
    strcpy((char *)v26 + v24, ": resetting baseband to recover to online");
    if (BasebandDiagnostics::resetBaseband(a1, (uint64_t)buf, 0))
    {
      v30 = 1;
      goto LABEL_44;
    }
LABEL_43:
    v31 = BasebandDiagnostics::setOperatingMode(a1, a2);
    v30 = v31;
    if (!a4)
    {
      if (!v31)
        goto LABEL_58;
      goto LABEL_50;
    }
LABEL_44:
    if ((char)buf[23] < 0)
    {
      operator delete(*(void **)buf);
      if ((v30 & 1) == 0)
        goto LABEL_58;
    }
    else if ((v30 & 1) == 0)
    {
      goto LABEL_58;
    }
LABEL_50:
    if (!*(_BYTE *)(a1 + 96))
    {
      v39 = *(NSObject **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;
      if (v39)
      {
        dispatch_group_leave(v39);
        dispatch_release(v39);
      }
      break;
    }
    v32 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "Invalid";
      if (a2 <= 3)
        v33 = (&off_251CB5778)[a2];
      *(_DWORD *)v42 = 136315138;
      v43 = v33;
      _os_log_impl(&dword_24B846000, v32, OS_LOG_TYPE_DEFAULT, "#I Waiting for Baseband %s mode", v42, 0xCu);
    }
    v34 = *(NSObject **)(a1 + 72);
    v35 = dispatch_time(0, 10000000000);
    if (!dispatch_group_wait(v34, v35))
    {
      v37 = 0;
      v38 = *(NSObject **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;
      if (!v38)
        goto LABEL_21;
LABEL_59:
      dispatch_group_leave(v38);
      dispatch_release(v38);
      goto LABEL_21;
    }
    v36 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 67109120;
      LODWORD(v43) = a3;
      _os_log_impl(&dword_24B846000, v36, OS_LOG_TYPE_DEFAULT, "#I Baseband mode not updated in time. retry=%d", v42, 8u);
    }
LABEL_58:
    v37 = a3;
    v38 = *(NSObject **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;
    if (v38)
      goto LABEL_59;
LABEL_21:
    a3 = v37 - 1;
    if (!v37)
      break;
  }
  *(_DWORD *)(a1 + 88) = 5;
  v4 = *(_DWORD *)(a1 + 92) == a2;
  v11 = v41;
LABEL_65:
  std::__shared_weak_count::__release_weak(v11);
  return v4;
}

void sub_24B84F6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  std::__shared_weak_count *v22;

  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_24B84F6DC()
{
  int v0;

  if (v0)
    JUMPOUT(0x24B84F6E4);
  JUMPOUT(0x24B84F6F4);
}

uint64_t BasebandDiagnostics::getRadioType(BasebandDiagnostics *this)
{
  int v1;
  unsigned __int8 v2;

  v1 = capabilities::radio::vendor(this);
  if (v1 == 1)
    v2 = 1;
  else
    v2 = -1;
  if (v1 == 2)
    return 0;
  return v2;
}

BOOL BasebandDiagnostics::addAWDConfig(BasebandDiagnostics *a1, uint64_t **a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  std::ios_base *v9;
  __int128 v10;
  void *v11;
  xpc_object_t v12;
  _BOOL8 v13;
  NSObject *v14;
  _OWORD v16[8];
  size_t __sz;
  _QWORD v18[73];

  v18[72] = *MEMORY[0x24BDAC8D0];
  memset(&v18[1], 170, 0x238uLL);
  v4 = MEMORY[0x24BEDB838];
  v5 = MEMORY[0x24BEDB838] + 64;
  v6 = (_QWORD *)MEMORY[0x24BEDB7E0];
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  v18[53] = MEMORY[0x24BEDB838] + 64;
  v18[0] = v7;
  *(_QWORD *)((char *)v18 + *(_QWORD *)(v7 - 24)) = v8;
  v18[1] = 0;
  v9 = (std::ios_base *)((char *)v18 + *(_QWORD *)(v18[0] - 24));
  std::ios_base::init(v9, &v18[2]);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v18[0] = v4 + 24;
  v18[53] = v5;
  MEMORY[0x24BD28784](&v18[2]);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)v18 + *(_QWORD *)(v18[0] - 24)), *(_DWORD *)((char *)&v18[4] + *(_QWORD *)(v18[0] - 24)) | 4);
  if (v18[17])
  {
    __sz = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[6] = v10;
    v16[7] = v10;
    v16[4] = v10;
    v16[5] = v10;
    v16[2] = v10;
    v16[3] = v10;
    v16[0] = v10;
    v16[1] = v10;
    std::istream::tellg();
    v11 = operator new[](0xAAAAAAAAAAAAAAAALL);
    std::istream::seekg();
    std::istream::read();
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)v18 + *(_QWORD *)(v18[0] - 24)), *(_DWORD *)((char *)&v18[4] + *(_QWORD *)(v18[0] - 24)) | 4);
    v12 = xpc_data_create(v11, 0xAAAAAAAAAAAAAAAALL);
    if (!v12)
      v12 = xpc_null_create();
    operator delete[](v11);
    v13 = BasebandDiagnostics::addAWDConfigPayload(a1, (char *)v11, 0xAAAAAAAAAAAAAAAALL);
    xpc_release(v12);
  }
  else
  {
    v14 = *((_QWORD *)a1 + 5);
    v13 = 0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) < 0)
        a2 = (uint64_t **)*a2;
      LODWORD(v16[0]) = 136315138;
      *(_QWORD *)((char *)v16 + 4) = a2;
      _os_log_impl(&dword_24B846000, v14, OS_LOG_TYPE_DEFAULT, "#I Failed to open AWD Config file (%s)", (uint8_t *)v16, 0xCu);
      v13 = 0;
    }
  }
  v18[0] = *v6;
  *(_QWORD *)((char *)v18 + *(_QWORD *)(v18[0] - 24)) = v6[3];
  MEMORY[0x24BD28790](&v18[2]);
  std::istream::~istream();
  MEMORY[0x24BD2888C](&v18[53]);
  return v13;
}

void sub_24B84F9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

BOOL BasebandDiagnostics::addAWDConfigPayload(BasebandDiagnostics *this, char *bytes, size_t length)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  char v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  const void *v23;
  size_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  const char *v33;
  void *__p[2];
  unint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  xpc_object_t v39;
  uint8_t buf[4];
  _BYTE v41[12];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = xpc_data_create(bytes, length);
  if (!v4)
    v4 = xpc_null_create();
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5 || (v5 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v5) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v5);
      v6 = v5;
    }
    else
    {
      v6 = xpc_null_create();
    }
  }
  else
  {
    v6 = xpc_null_create();
    v5 = 0;
  }
  xpc_release(v5);
  if (MEMORY[0x24BD28B14](v4) == MEMORY[0x24BDACFE0])
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *((_QWORD *)this + 5);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    goto LABEL_40;
  }
  v7 = xpc_int64_create(5);
  if (!v7)
    v7 = xpc_null_create();
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x24BE058E8], v7);
  v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  if (v4)
  {
    xpc_retain(v4);
    v9 = v4;
  }
  else
  {
    v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x24BE04E18], v9);
  v14 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v14);
  v15 = xpc_int64_create(0);
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x24BE04F28], v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  v17 = xpc_int64_create(5000);
  if (!v17)
    v17 = xpc_null_create();
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x24BE04E20], v17);
  v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  v19 = xpc_null_create();
  v20 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v37 = *((_QWORD *)this + 7);
  v38 = v20;
  v39 = v19;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
  }
  v23 = (const void *)*MEMORY[0x24BE05348];
  v24 = strlen((const char *)*MEMORY[0x24BE05348]);
  if (v24 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v25 = (void *)v24;
  if (v24 >= 0x17)
  {
    v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17)
      v27 = v24 | 7;
    v28 = v27 + 1;
    v26 = operator new(v27 + 1);
    __p[1] = v25;
    v36 = v28 | 0x8000000000000000;
    __p[0] = v26;
    goto LABEL_31;
  }
  HIBYTE(v36) = v24;
  v26 = __p;
  if (v24)
LABEL_31:
    memmove(v26, v23, (size_t)v25);
  *((_BYTE *)v25 + (_QWORD)v26) = 0;
  abm::client::PerformCommand();
  v29 = *(_DWORD *)buf;
  v11 = *(void **)&v41[4];
  v10 = v42;
  v42 = 0;
  v41[4] = 0;
  if (SHIBYTE(v36) < 0)
    operator delete(__p[0]);
  v30 = v38;
  if (v38)
  {
    v31 = (unint64_t *)&v38->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v12 = v29 == 0;
  v13 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
LABEL_40:
    v33 = "Failed";
    if (v12)
      v33 = "Success";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v41 = v33;
    _os_log_impl(&dword_24B846000, v13, OS_LOG_TYPE_DEFAULT, "#I AWD Configuration add %s", buf, 0xCu);
  }
LABEL_43:
  xpc_release(v6);
  if (v10 < 0)
    operator delete(v11);
  xpc_release(v4);
  return v12;
}

void sub_24B84FE3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x24BD28790](a1 + 2);
  std::istream::~istream();
  MEMORY[0x24BD2888C](a1 + 53);
  return a1;
}

BOOL BasebandDiagnostics::removeAWDConfig(BasebandDiagnostics *this)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  const void *v11;
  size_t v12;
  void *v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  int v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  const char *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v31;
  void *__dst[2];
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  xpc_object_t v36;
  uint8_t buf[4];
  _BYTE v38[12];
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v36 = xpc_null_create();
  v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD28B14](v2) == MEMORY[0x24BDACFA0])
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
  v4 = xpc_int64_create(5);
  if (!v4)
    v4 = xpc_null_create();
  xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x24BE058E8], v4);
  v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  v6 = xpc_int64_create(5000);
  if (!v6)
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x24BE04E20], v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  v8 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v34 = *((_QWORD *)this + 7);
  v35 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (const void *)*MEMORY[0x24BE054B0];
  v12 = strlen((const char *)*MEMORY[0x24BE054B0]);
  if (v12 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v13 = (void *)v12;
  if (v12 >= 0x17)
  {
    v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v15 = v12 | 7;
    v16 = v15 + 1;
    v14 = (void **)operator new(v15 + 1);
    __dst[1] = v13;
    v33 = v16 | 0x8000000000000000;
    __dst[0] = v14;
    goto LABEL_21;
  }
  HIBYTE(v33) = v12;
  v14 = __dst;
  if (v12)
LABEL_21:
    memmove(v14, v11, (size_t)v13);
  *((_BYTE *)v13 + (_QWORD)v14) = 0;
  abm::client::PerformCommand();
  v17 = *(_DWORD *)buf;
  v18 = *(void **)&v38[4];
  v19 = v39;
  v39 = 0;
  v38[4] = 0;
  if (SHIBYTE(v33) < 0)
    operator delete(__dst[0]);
  v20 = v35;
  if (!v35)
    goto LABEL_28;
  v21 = (unint64_t *)&v35->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    v23 = *((_QWORD *)this + 5);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
  }
  else
  {
LABEL_28:
    v23 = *((_QWORD *)this + 5);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
  }
  v24 = "Failed";
  if (!v17)
    v24 = "Success";
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)v38 = v24;
  _os_log_impl(&dword_24B846000, v23, OS_LOG_TYPE_DEFAULT, "#I AWD Configuration remove %s", buf, 0xCu);
LABEL_32:
  v25 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  v31 = v25;
  if (v25)
  {
    v26 = (unint64_t *)&v25->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  abm::client::EventsOff();
  if (v31)
  {
    v28 = (unint64_t *)&v31->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  xpc_release(v3);
  if (v19 < 0)
    operator delete(v18);
  return v17 == 0;
}

void sub_24B8502E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void BasebandDiagnostics::resetAll(BasebandDiagnostics *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    v5 = *((_QWORD *)this + 10);
    *((_QWORD *)this + 10) = 0;
    if (!v5)
      return;
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  v5 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v5)
  {
LABEL_6:
    dispatch_group_leave(v5);
    dispatch_release(v5);
  }
}

void BasebandDiagnostics::registerAWDMetricHandler(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  __int128 v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  const void *v9;
  size_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  std::__shared_weak_count *v35;
  void *__dst[2];
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, xpc_object_t);
  void *v43;
  _QWORD *v44;
  _BYTE v45[24];
  _BYTE *v46;
  uint8_t buf[16];
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (!v3)
  {
    v5 = a1[5];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_24B846000, v5, OS_LOG_TYPE_ERROR, "No AWD Metric handler", buf, 2u);
    }
    return;
  }
  a1[14] = a1[13];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v4;
  v48 = v4;
  if (v3 == a2)
  {
    *((_QWORD *)&v48 + 1) = buf;
    (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, buf);
  }
  else
  {
    *((_QWORD *)&v48 + 1) = (*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
  }
  v6 = (std::__shared_weak_count *)a1[8];
  v38 = a1[7];
  v39 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = (const void *)*MEMORY[0x24BE04E28];
  v10 = strlen((const char *)*MEMORY[0x24BE04E28]);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v12 = (void **)operator new(v13 + 1);
    __dst[1] = v11;
    v37 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_17;
  }
  HIBYTE(v37) = v10;
  v12 = __dst;
  if (v10)
LABEL_17:
    memmove(v12, v9, (size_t)v11);
  *((_BYTE *)v11 + (_QWORD)v12) = 0;
  v40 = MEMORY[0x24BDAC760];
  v41 = 3321888768;
  v42 = ___ZN19BasebandDiagnostics24registerAWDMetricHandlerENSt3__18functionIFvNS0_6vectorIhNS0_9allocatorIhEEEEEEE_block_invoke;
  v43 = &__block_descriptor_72_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE_e31_v24__0_v8__dispatch_group_s__16l;
  v44 = a1;
  v15 = v45;
  v16 = *((_QWORD *)&v48 + 1);
  if (!*((_QWORD *)&v48 + 1))
  {
LABEL_21:
    v46 = (_BYTE *)v16;
    goto LABEL_23;
  }
  if (*((uint8_t **)&v48 + 1) != buf)
  {
    v16 = (*(uint64_t (**)(void))(**((_QWORD **)&v48 + 1) + 16))();
    goto LABEL_21;
  }
  v46 = v45;
  (*(void (**)(uint8_t *, _BYTE *))(*(_QWORD *)buf + 24))(buf, v45);
LABEL_23:
  abm::client::RegisterEventHandler();
  if (SHIBYTE(v37) < 0)
    operator delete(__dst[0]);
  v17 = v39;
  if (v39)
  {
    v18 = (unint64_t *)&v39->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = (std::__shared_weak_count *)a1[8];
  v35 = v20;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  abm::client::EventsOff();
  if (v35)
  {
    v23 = (unint64_t *)&v35->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v25 = (std::__shared_weak_count *)a1[8];
  v34 = v25;
  if (v25)
  {
    v26 = (unint64_t *)&v25->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  abm::client::EventsOn();
  if (!v34)
    goto LABEL_45;
  v28 = (unint64_t *)&v34->__shared_owners_;
  do
    v29 = __ldaxr(v28);
  while (__stlxr(v29 - 1, v28));
  if (v29)
  {
LABEL_45:
    v30 = v46;
    if (v46 != v45)
      goto LABEL_46;
LABEL_49:
    v31 = 4;
    goto LABEL_50;
  }
  ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
  std::__shared_weak_count::__release_weak(v34);
  v30 = v46;
  if (v46 == v45)
    goto LABEL_49;
LABEL_46:
  if (v30)
  {
    v31 = 5;
    v15 = v30;
LABEL_50:
    (*(void (**)(_QWORD *))(*v15 + 8 * v31))(v15);
  }
  v32 = (uint8_t *)*((_QWORD *)&v48 + 1);
  if (*((uint8_t **)&v48 + 1) == buf)
  {
    v33 = 4;
    v32 = buf;
  }
  else
  {
    if (!*((_QWORD *)&v48 + 1))
      return;
    v33 = 5;
  }
  (*(void (**)(uint8_t *))(*(_QWORD *)v32 + 8 * v33))(v32);
}

void sub_24B8507C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;
  uint64_t v31;

  if (a18 < 0)
    operator delete(__p);
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  v31 = *(_QWORD *)(v29 - 72);
  if (v31 == v29 - 96)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)(v29 - 96) + 32))(v29 - 96);
    _Unwind_Resume(a1);
  }
  if (!v31)
    _Unwind_Resume(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)v31 + 40))(v31);
  _Unwind_Resume(a1);
}

void ___ZN19BasebandDiagnostics24registerAWDMetricHandlerENSt3__18functionIFvNS0_6vectorIhNS0_9allocatorIhEEEEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  const char *v6;
  xpc_object_t value;
  int v8;
  const char *v9;
  xpc_object_t v10;
  NSObject *v11;
  _BYTE *v12;
  _BYTE *v13;
  NSObject *v14;
  const char *v15;
  xpc_object_t v16;
  int v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  size_t v21;
  char *v22;
  char *v23;
  NSObject *v24;
  void *__p;
  void *v26;
  char *v27;
  xpc_object_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  xpc_object_t objecta[4];

  objecta[3] = *(xpc_object_t *)MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    goto LABEL_4;
  }
  v4 = xpc_null_create();
  if (v4)
  {
LABEL_4:
    if (MEMORY[0x24BD28B14](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
      v5 = v4;
    }
    else
    {
      v5 = xpc_null_create();
    }
    goto LABEL_8;
  }
  v5 = xpc_null_create();
  v4 = 0;
LABEL_8:
  xpc_release(v4);
  v6 = (const char *)*MEMORY[0x24BE058E8];
  if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x24BE058E8]))
  {
    value = xpc_dictionary_get_value(v5, v6);
    objecta[0] = value;
    if (value)
      xpc_retain(value);
    else
      objecta[0] = xpc_null_create();
    v8 = xpc::dyn_cast_or_default();
    xpc_release(objecta[0]);
    if (v8 == 5)
    {
      v9 = (const char *)*MEMORY[0x24BE04E18];
      if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x24BE04E18]))
      {
        v10 = xpc_dictionary_get_value(v5, v9);
        v28 = v10;
        if (v10)
          xpc_retain(v10);
        else
          v28 = xpc_null_create();
        memset(objecta, 0, 24);
        xpc::dyn_cast_or_default();
        v12 = v29;
        v13 = v30;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        xpc_release(v28);
        v14 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(objecta[0]) = 134217984;
          *(xpc_object_t *)((char *)objecta + 4) = (xpc_object_t)(v13 - v12);
          _os_log_impl(&dword_24B846000, v14, OS_LOG_TYPE_DEFAULT, "#I Received AWD metric w/ payload size = %ld", (uint8_t *)objecta, 0xCu);
        }
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v3 + 104, *(char **)(v3 + 112), v12, v13, v13 - v12);
        v15 = (const char *)*MEMORY[0x24BE04F70];
        if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x24BE04F70]))
        {
          v16 = xpc_dictionary_get_value(v5, v15);
          objecta[0] = v16;
          if (v16)
            xpc_retain(v16);
          else
            objecta[0] = xpc_null_create();
          v17 = xpc::dyn_cast_or_default();
          xpc_release(objecta[0]);
          if (!v17)
          {
            v24 = *(NSObject **)(v3 + 40);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(objecta[0]) = 0;
              _os_log_impl(&dword_24B846000, v24, OS_LOG_TYPE_DEFAULT, "#I Continue to wait for more data..", (uint8_t *)objecta, 2u);
            }
            goto LABEL_36;
          }
        }
        memset(objecta, 170, 24);
        wis::createTagForProtobuf((wis *)0xF);
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v3 + 104, *(char **)(v3 + 104), (_BYTE *)objecta[0], (_BYTE *)objecta[1], (char *)objecta[1] - (char *)objecta[0]);
        if (objecta[0])
        {
          objecta[1] = objecta[0];
          operator delete(objecta[0]);
        }
      }
      else
      {
        v11 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          LOWORD(objecta[0]) = 0;
          _os_log_error_impl(&dword_24B846000, v11, OS_LOG_TYPE_ERROR, "Received AWD metric w/ no Payload!", (uint8_t *)objecta, 2u);
        }
        v12 = 0;
        *(_QWORD *)(v3 + 112) = *(_QWORD *)(v3 + 104);
      }
      v18 = *(_QWORD *)(a1 + 64);
      if (v18)
      {
        __p = 0;
        v26 = 0;
        v27 = 0;
        v20 = *(_BYTE **)(v3 + 104);
        v19 = *(_BYTE **)(v3 + 112);
        v21 = v19 - v20;
        if (v19 != v20)
        {
          if ((v21 & 0x8000000000000000) != 0)
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          v22 = (char *)operator new(v19 - v20);
          v23 = &v22[v21];
          __p = v22;
          v27 = &v22[v21];
          memcpy(v22, v20, v21);
          v26 = v23;
        }
        (*(void (**)(uint64_t, void **))(*(_QWORD *)v18 + 48))(v18, &__p);
        if (__p)
        {
          v26 = __p;
          operator delete(__p);
        }
      }
      *(_QWORD *)(v3 + 112) = *(_QWORD *)(v3 + 104);
LABEL_36:
      if (v12)
        operator delete(v12);
    }
  }
  xpc_release(v5);
}

void sub_24B850C94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, xpc_object_t a13, uint64_t a14, uint64_t a15, uint64_t a16, xpc_object_t object, uint64_t a18)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t __copy_helper_block_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a2 + 64);
  if (result)
  {
    if (result == a2 + 40)
    {
      *(_QWORD *)(a1 + 64) = a1 + 40;
      return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 64) + 24))(*(_QWORD *)(a2 + 64), a1 + 40);
    }
    else
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
      *(_QWORD *)(a1 + 64) = result;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 64) = 0;
  }
  return result;
}

uint64_t __destroy_helper_block_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 + 40;
  result = *(_QWORD *)(a1 + 64);
  if (result == v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 32))(v1);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 40))(result);
  return result;
}

BOOL BasebandDiagnostics::saveToUserDefaults(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  NSObject *v11;
  uint64_t *v12;
  const char *v13;
  int v15;
  uint64_t *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BasebandDiagnostics"));
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v7 = a2;
    else
      v7 = (uint64_t *)*a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

    if (*((char *)a2 + 23) >= 0)
      v9 = a2;
    else
      v9 = (uint64_t *)*a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", a3, v10);

    objc_msgSend(v6, "synchronize");
  }
  v11 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (uint64_t *)*a2;
    v13 = "Failed";
    if (*((char *)a2 + 23) >= 0)
      v12 = a2;
    if (v6)
      v13 = "Success";
    v15 = 136315394;
    v16 = v12;
    v17 = 2080;
    v18 = v13;
    _os_log_impl(&dword_24B846000, v11, OS_LOG_TYPE_DEFAULT, "#I User Defaults - Save Data for key=%s: %s", (uint8_t *)&v15, 0x16u);
  }

  return v6 != 0;
}

void sub_24B850FC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24B850FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24B850FF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL BasebandDiagnostics::removeFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  void *v4;
  uint64_t *v5;
  void *v6;
  NSObject *v7;
  uint64_t *v8;
  const char *v9;
  int v11;
  uint64_t *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BasebandDiagnostics"));
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0)
      v5 = a2;
    else
      v5 = (uint64_t *)*a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v6);

    objc_msgSend(v4, "synchronize");
  }
  v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (uint64_t *)*a2;
    v9 = "Failed";
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    if (v4)
      v9 = "Success";
    v11 = 136315394;
    v12 = v8;
    v13 = 2080;
    v14 = v9;
    _os_log_impl(&dword_24B846000, v7, OS_LOG_TYPE_DEFAULT, "#I User Defaults - Remove key=%s: %s", (uint8_t *)&v11, 0x16u);
  }

  return v4 != 0;
}

void sub_24B851144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24B85115C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BasebandDiagnostics::readObjectFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  void *v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BasebandDiagnostics"));
  if (v3)
  {
    if (*((char *)a2 + 23) >= 0)
      v4 = a2;
    else
      v4 = (uint64_t *)*a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "objectForKey:", v5);

    return v6;
  }
  else
  {

    return 0;
  }
}

void sub_24B85120C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24B851220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BasebandDiagnostics::readIntegerFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  void *v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BasebandDiagnostics"));
  if (v3)
  {
    if (*((char *)a2 + 23) >= 0)
      v4 = a2;
    else
      v4 = (uint64_t *)*a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "integerForKey:", v5);

    return v6;
  }
  else
  {

    return 0;
  }
}

void sub_24B8512D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24B8512E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void BasebandDiagnostics::readStringFromUserDefaults(uint64_t *a1@<X1>, void **a2@<X2>, uint64_t a3@<X8>)
{
  void *v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  size_t v12;
  id v13;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BasebandDiagnostics"));
  if (v6)
  {
    v13 = v6;
    if (*((char *)a1 + 23) >= 0)
      v7 = a1;
    else
      v7 = (uint64_t *)*a1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "length"))
    {
      std::string::__assign_external((std::string *)a3, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    }
    else if ((void **)a3 != a2)
    {
      v10 = *((_BYTE *)a2 + 23);
      if (*(char *)(a3 + 23) < 0)
      {
        if (v10 >= 0)
          v11 = a2;
        else
          v11 = *a2;
        if (v10 >= 0)
          v12 = *((unsigned __int8 *)a2 + 23);
        else
          v12 = (size_t)a2[1];
        std::string::__assign_no_alias<false>((void **)a3, v11, v12);
      }
      else if ((*((_BYTE *)a2 + 23) & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>((_QWORD *)a3, *a2, (size_t)a2[1]);
      }
      else
      {
        *(_OWORD *)a3 = *(_OWORD *)a2;
        *(_QWORD *)(a3 + 16) = a2[2];
      }
    }

    v6 = v13;
  }

}

void sub_24B851418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;
  void *v11;

  if (*(char *)(v10 + 23) < 0)
    operator delete(*(void **)v10);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedSynchronizable<BasebandDiagnostics>::~SharedSynchronizable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(uint64_t a1, char *__dst, _BYTE *__src, _BYTE *a4, unint64_t a5)
{
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  void *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  _OWORD *v31;
  __int128 *v32;
  unint64_t v33;
  __int128 v34;
  char v35;
  __int128 *v36;
  _OWORD *v37;
  unint64_t v38;
  __int128 v39;
  uint64_t *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  char *v45;
  unint64_t v46;
  char *v47;
  char *v48;
  _OWORD *v49;
  unint64_t v50;
  __int128 v51;
  char v52;
  char *v53;
  char *v54;

  if ((uint64_t)a5 < 1)
    return;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < (uint64_t)a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
    {
      v16 = operator new(v15);
      v17 = &v13[(_QWORD)v16];
      v18 = &v13[(_QWORD)v16 + a5];
      v19 = &v13[(_QWORD)v16];
      v20 = __src;
      if (a5 < 8)
        goto LABEL_43;
    }
    else
    {
      v16 = 0;
      v17 = (char *)(__dst - v11);
      v18 = &v13[a5];
      v19 = (char *)(__dst - v11);
      v20 = __src;
      if (a5 < 8)
        goto LABEL_43;
    }
    v19 = v17;
    v20 = __src;
    if ((char *)(&__dst[(_QWORD)v16] - &__src[(_QWORD)v11]) >= (char *)0x20)
    {
      if (a5 >= 0x20)
      {
        v29 = a5 & 0x7FFFFFFFFFFFFFE0;
        v36 = (__int128 *)(__src + 16);
        v37 = (char *)v16 + (_QWORD)v13 + 16;
        v38 = a5 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v39 = *v36;
          *(v37 - 1) = *(v36 - 1);
          *v37 = v39;
          v36 += 2;
          v37 += 2;
          v38 -= 32;
        }
        while (v38);
        if (v29 == a5)
        {
LABEL_44:
          v45 = *(char **)a1;
          if (*(char **)a1 == __dst)
          {
LABEL_53:
            v53 = (char *)v16 + v15;
            if (v10 != __dst)
              memmove(v18, __dst, v10 - __dst);
            v54 = *(char **)a1;
            *(_QWORD *)a1 = v17;
            *(_QWORD *)(a1 + 8) = &v18[v10 - __dst];
            *(_QWORD *)(a1 + 16) = v53;
            if (v54)
              operator delete(v54);
            return;
          }
          v46 = __dst - v45;
          if ((unint64_t)(__dst - v45) >= 0x20)
          {
            v47 = __dst;
            if ((unint64_t)(v11 - (_BYTE *)v16) >= 0x20)
            {
              v47 = &__dst[-(v46 & 0xFFFFFFFFFFFFFFE0)];
              v17 -= v46 & 0xFFFFFFFFFFFFFFE0;
              v48 = __dst - 16;
              v49 = (char *)v16 + __dst - 16 - v11;
              v50 = v46 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                v51 = *(_OWORD *)v48;
                *(v49 - 1) = *((_OWORD *)v48 - 1);
                *v49 = v51;
                v49 -= 2;
                v48 -= 32;
                v50 -= 32;
              }
              while (v50);
              if (v46 == (v46 & 0xFFFFFFFFFFFFFFE0))
                goto LABEL_52;
            }
          }
          else
          {
            v47 = __dst;
          }
          do
          {
            v52 = *--v47;
            *--v17 = v52;
          }
          while (v47 != v45);
LABEL_52:
          v10 = *(char **)(a1 + 8);
          goto LABEL_53;
        }
        if ((a5 & 0x18) == 0)
        {
          v20 = &__src[v29];
          v19 = &v17[v29];
          goto LABEL_43;
        }
      }
      else
      {
        v29 = 0;
      }
      v19 = &v17[a5 & 0xFFFFFFFFFFFFFFF8];
      v20 = &__src[a5 & 0xFFFFFFFFFFFFFFF8];
      v40 = (uint64_t *)&__src[v29];
      v41 = (char *)v16 + &__dst[v29] - v11;
      v42 = v29 - (a5 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v43 = *v40++;
        *v41++ = v43;
        v42 += 8;
      }
      while (v42);
      if ((a5 & 0x7FFFFFFFFFFFFFF8) == a5)
        goto LABEL_44;
    }
    do
    {
LABEL_43:
      v44 = *v20++;
      *v19++ = v44;
    }
    while (v19 != v18);
    goto LABEL_44;
  }
  v21 = v10 - __dst;
  if (v10 - __dst >= (uint64_t)a5)
  {
    v22 = &__src[a5];
    v24 = *(char **)(a1 + 8);
    v25 = &__dst[a5];
    v26 = &v10[-a5];
    v27 = v24;
    if ((unint64_t)v10 < a5)
      goto LABEL_30;
    goto LABEL_19;
  }
  v22 = &__src[v21];
  v23 = a4 - &__src[v21];
  if (a4 != &__src[v21])
    memmove(*(void **)(a1 + 8), &__src[v21], a4 - &__src[v21]);
  v24 = &v10[v23];
  *(_QWORD *)(a1 + 8) = &v10[v23];
  if (v21 >= 1)
  {
    v25 = &__dst[a5];
    v26 = &v24[-a5];
    v27 = &v10[v23];
    if (&v24[-a5] >= v10)
      goto LABEL_30;
LABEL_19:
    v28 = &v10[a5] - v24;
    if (v28 >= 0x20)
    {
      v27 = v24;
      if (a5 >= 0x20)
      {
        v30 = &v26[v28 & 0xFFFFFFFFFFFFFFE0];
        v27 = &v24[v28 & 0xFFFFFFFFFFFFFFE0];
        v31 = v24 + 16;
        v32 = (__int128 *)(v26 + 16);
        v33 = v28 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v34 = *v32;
          *(v31 - 1) = *(v32 - 1);
          *v31 = v34;
          v31 += 2;
          v32 += 2;
          v33 -= 32;
        }
        while (v33);
        v26 = v30;
        if (v28 == (v28 & 0xFFFFFFFFFFFFFFE0))
          goto LABEL_30;
      }
    }
    else
    {
      v27 = v24;
    }
    do
    {
      v35 = *v26++;
      *v27++ = v35;
    }
    while (v26 != v10);
LABEL_30:
    *(_QWORD *)(a1 + 8) = v27;
    if (v24 != v25)
      memmove(v25, __dst, v24 - v25);
    if (v22 != __src)
      memmove(__dst, __src, v22 - __src);
  }
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

_QWORD *std::string::__assign_no_alias<true>(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  size_t v11;
  std::string::size_type v12;
  uint64_t v13;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22)
            operator delete(v9);
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__n > 2 * v8)
          v12 = __n;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    v6 = HIBYTE(v10);
    v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  std::string::size_type v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

uint64_t AMAuthInstallBasebandGetRFSelfTestTicket()
{
  return MEMORY[0x24BEDA6C0]();
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x24BED84A0]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x24BED9720]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x24BED9728]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x24BED90E8](this);
}

uint64_t capabilities::abs::supportsDesenseRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x24BED9138](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t abm::client::CreateManager()
{
  return MEMORY[0x24BE05878]();
}

uint64_t abm::client::PerformCommand()
{
  return MEMORY[0x24BE05880]();
}

uint64_t abm::client::RegisterEventHandler()
{
  return MEMORY[0x24BE05888]();
}

uint64_t abm::client::EventsOn()
{
  return MEMORY[0x24BE05890]();
}

uint64_t abm::client::EventsOff()
{
  return MEMORY[0x24BE05898]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, os_log_s *a2)
{
  return MEMORY[0x24BED9820](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x24BED9840](this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
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

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED9AA0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x24BED9AB0](this);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

{
  return MEMORY[0x24BED9AE8]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9BB0](this, a2);
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x24BED9C78](this);
}

uint64_t wis::createTagForProtobuf(wis *this)
{
  return MEMORY[0x24BEC2B50](this);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D78]();
}

{
  return MEMORY[0x24BED9D90]();
}

{
  return MEMORY[0x24BED9D98]();
}

{
  return MEMORY[0x24BED9DA8]();
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
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_251CB4E68(__p);
}

void operator delete(void *__p)
{
  off_251CB4E70(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_251CB4E78(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CB4E80(__sz);
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x24BDADF58](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
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

