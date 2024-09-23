__n128 telephonytransport::TelephonyTransport::TelephonyTransport(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(_QWORD *)a1 = &unk_24C8095B0;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

void telephonytransport::TelephonyTransport::~TelephonyTransport(telephonytransport::TelephonyTransport *this)
{
  std::__shared_weak_count *v1;

  *(_QWORD *)this = &unk_24C8095B0;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

BOOL telephonytransport::isReadRequested(int a1)
{
  return a1 != 1;
}

BOOL telephonytransport::isWriteRequested(int a1)
{
  return a1 != 0;
}

BOOL telephonytransport::NetworkIfaceParams::readRequested(telephonytransport::NetworkIfaceParams *this)
{
  return *((_DWORD *)this + 14) != 1;
}

BOOL telephonytransport::NetworkIfaceParams::writeRequested(telephonytransport::NetworkIfaceParams *this)
{
  return *((_DWORD *)this + 14) != 0;
}

uint64_t telephonytransport::NetworkIfaceParams::isValid(telephonytransport::NetworkIfaceParams *this)
{
  if (*((char *)this + 23) < 0)
  {
    if (!*((_QWORD *)this + 1))
      return 0;
  }
  else if (!*((_BYTE *)this + 23))
  {
    return 0;
  }
  if (*((_DWORD *)this + 14) == 1)
  {
    if (*((char *)this + 55) < 0)
    {
      if (*((_QWORD *)this + 5))
        return 0;
    }
    else if (*((_BYTE *)this + 55))
    {
      return 0;
    }
  }
  return 1;
}

void telephonytransport::TCPSocketStream::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, _QWORD *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::__shared_weak_count_vtbl **a6@<X8>)
{
  std::__shared_weak_count_vtbl *v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  _BOOL8 started;
  unint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  __int16 v23;
  dispatch_queue_t v24;
  uint8_t buf[8];
  std::__shared_weak_count *v26;

  if (!*a3)
  {
    v18 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid socket descriptor";
LABEL_29:
      _os_log_error_impl(&dword_20DA91000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    }
LABEL_20:
    *a6 = 0;
    a6[1] = 0;
    return;
  }
  if (a4 != 1)
  {
    v20 = *((_QWORD *)a1 + 1);
    if (!v20 || *(_QWORD *)(v20 + 8) == -1)
    {
      v18 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = "Delegate is mandatory";
        goto LABEL_29;
      }
    }
    else
    {
      if (*a2)
        goto LABEL_3;
      v18 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = "Providing readQueue is mandatory when read mode is specified";
        goto LABEL_29;
      }
    }
    goto LABEL_20;
  }
LABEL_3:
  v12 = (std::__shared_weak_count_vtbl *)operator new(0x50uLL);
  v13 = *a2;
  v24 = v13;
  if (v13)
    dispatch_retain(v13);
  telephonytransport::TCPSocketStream::TCPSocketStream((uint64_t)v12, (uint64_t)a1, &v24, (uint64_t)a3, a4, a5);
  *(_QWORD *)buf = v12;
  v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)off_24C8096F0;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = v12;
  v26 = v14;
  if (v13)
    dispatch_release(v13);
  if (LODWORD(v12[1].__on_zero_shared) == 1
    || (started = telephonytransport::TCPSocketStream::startReading((telephonytransport::TCPSocketStream *)v12)))
  {
    *a6 = v12;
    a6[1] = (std::__shared_weak_count_vtbl *)v14;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  else
  {
    v21 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)started);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = 0;
      _os_log_error_impl(&dword_20DA91000, v21, OS_LOG_TYPE_ERROR, "Failed to initialize", (uint8_t *)&v23, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
}

void sub_20DA922B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::TCPSocketStream::init(telephonytransport::TCPSocketStream *this)
{
  return *((_DWORD *)this + 14) == 1 || telephonytransport::TCPSocketStream::startReading(this);
}

uint64_t telephonytransport::TCPSocketStream::TCPSocketStream(uint64_t a1, uint64_t a2, dispatch_queue_t *a3, uint64_t a4, int a5, char *a6)
{
  NSObject *v11;
  dispatch_qos_class_t qos_class;
  NSObject *v13;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpsockstream", a6, (_QWORD *)(a1 + 24));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)a1 = &off_24C809620;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a4;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_DWORD *)(a1 + 56) = a5;
  *(_QWORD *)(a1 + 64) = 0;
  v11 = *a3;
  if (*a3)
  {
    qos_class = dispatch_queue_get_qos_class(v11, 0);
    v13 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
    if (*a3)
      v11 = dispatch_queue_create_with_target_V2("TCPSocketStream", v13, *a3);
    else
      v11 = dispatch_queue_create("TCPSocketStream", v13);
  }
  *(_QWORD *)(a1 + 72) = v11;
  return a1;
}

void telephonytransport::TCPSocketStream::~TCPSocketStream(telephonytransport::TCPSocketStream *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  *(_QWORD *)this = &off_24C809620;
  v2 = *((_QWORD *)this + 8);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = *((_QWORD *)this + 9);
  if (v3)
    dispatch_release(v3);
  v4 = *((_QWORD *)this + 8);
  if (v4)
    dispatch_release(v4);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  *(_QWORD *)this = &unk_24C8095B0;
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
}

{
  void *v1;

  telephonytransport::TCPSocketStream::~TCPSocketStream(this);
  operator delete(v1);
}

BOOL telephonytransport::TCPSocketStream::startReading(telephonytransport::TCPSocketStream *this)
{
  NSObject **v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  dispatch_source_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  _BOOL8 result;
  NSObject **v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t v50;
  _QWORD v51[5];
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  __n128 (*v55)(uint64_t, uint64_t);
  uint64_t (*v56)(uint64_t);
  uint64_t v57;
  std::__shared_weak_count *v58;
  _QWORD handler[5];
  std::__shared_weak_count *v60;
  std::__shared_weak_count *v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  int v65;

  if (*((_QWORD *)this + 8))
  {
    v2 = (NSObject **)*((_QWORD *)this + 3);
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
      v6 = *v2;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    else
    {
      v6 = *v2;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v6, OS_LOG_TYPE_ERROR, "Already started reading", buf, 2u);
    }
    return 1;
  }
  v8 = dispatch_source_create(MEMORY[0x24BDACA00], *(int *)(*((_QWORD *)this + 5) + 16), 0, *((dispatch_queue_t *)this + 9));
  v9 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v8;
  if (v9)
  {
    dispatch_release(v9);
    v8 = (dispatch_source_t)*((_QWORD *)this + 8);
  }
  if (v8)
  {
    v11 = *((_QWORD *)this + 1);
    v10 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v10)
    {
      p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
      do
        v13 = __ldxr(p_shared_weak_owners);
      while (__stxr(v13 + 1, p_shared_weak_owners));
    }
    v14 = *(_DWORD *)(*((_QWORD *)this + 5) + 16);
    v15 = (std::__shared_weak_count *)operator new(0x10018uLL);
    v15->__shared_owners_ = 0;
    v16 = (unint64_t *)&v15->__shared_owners_;
    v15->__shared_weak_owners_ = 0;
    v15->__vftable = (std::__shared_weak_count_vtbl *)off_24C809768;
    bzero(&v15[1], 0x10000uLL);
    v17 = *((_QWORD *)this + 3);
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    v21 = *((_QWORD *)this + 8);
    v22 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = v11;
    v60 = v10;
    if (v10)
    {
      v23 = (unint64_t *)&v10->__shared_weak_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    v65 = v14;
    v61 = v15 + 1;
    v62 = v15;
    do
      v25 = __ldxr(v16);
    while (__stxr(v25 + 1, v16));
    v63 = v17;
    v64 = v18;
    if (v18)
    {
      v26 = (unint64_t *)&v18->__shared_owners_;
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    dispatch_source_set_event_handler(v21, handler);
    *(_QWORD *)buf = 0;
    v53 = buf;
    v54 = 0x3802000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    v28 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
    v57 = *((_QWORD *)this + 5);
    v58 = v28;
    if (v28)
    {
      v29 = (unint64_t *)&v28->__shared_owners_;
      do
        v30 = __ldxr(v29);
      while (__stxr(v30 + 1, v29));
    }
    v31 = *((_QWORD *)this + 8);
    v51[0] = v22;
    v51[1] = 1107296256;
    v51[2] = ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke_3;
    v51[3] = &__block_descriptor_tmp_4;
    v51[4] = buf;
    dispatch_source_set_cancel_handler(v31, v51);
    dispatch_resume(*((dispatch_object_t *)this + 8));
    _Block_object_dispose(buf, 8);
    v32 = v58;
    if (v58)
    {
      v33 = (unint64_t *)&v58->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v35 = v64;
    if (v64)
    {
      v36 = (unint64_t *)&v64->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    v38 = v62;
    if (v62)
    {
      v39 = (unint64_t *)&v62->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    if (v60)
      std::__shared_weak_count::__release_weak(v60);
    if (v18)
    {
      v41 = (unint64_t *)&v18->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    do
      v43 = __ldaxr(v16);
    while (__stlxr(v43 - 1, v16));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    if (v10)
      std::__shared_weak_count::__release_weak(v10);
    return 1;
  }
  v45 = (NSObject **)*((_QWORD *)this + 3);
  v46 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (v46)
  {
    v47 = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
    v49 = *v45;
    do
      v50 = __ldaxr(v47);
    while (__stlxr(v50 - 1, v47));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  else
  {
    v49 = *v45;
  }
  result = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20DA91000, v49, OS_LOG_TYPE_ERROR, "Unable to create read source", buf, 2u);
    return 0;
  }
  return result;
}

void sub_20DA928EC(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(exception_object);
}

BOOL telephonytransport::TCPSocketStream::write(telephonytransport::TCPSocketStream *this, const unsigned __int8 *a2, unint64_t a3)
{
  NSObject *v3;
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  const unsigned __int8 *v10;
  unint64_t v11;
  ssize_t v12;
  _BOOL8 result;
  NSObject **isa;
  Class v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  int *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;

  v3 = this;
  v22 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 14))
  {
    v4 = (NSObject **)*((_QWORD *)this + 3);
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v3 = *v4;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *, const unsigned __int8 *))v5->__on_zero_shared)(v5, a2);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v3 = *v4;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl(&dword_20DA91000, v3, OS_LOG_TYPE_FAULT, "Write is not supported", (uint8_t *)&v21, 2u);
    }
    __break(1u);
  }
  v9 = a3;
  if (!a3)
    return 1;
  v10 = a2;
  v11 = 0;
  while (1)
  {
    v12 = send(*((_DWORD *)v3[5].isa + 4), &v10[v11], v9 - v11, 0);
    if (v12 == -1)
      break;
    v11 += v12;
LABEL_19:
    if (v11 >= v9)
      return 1;
  }
  if (*__error() == 35 || *__error() == 35)
    goto LABEL_19;
  isa = (NSObject **)v3[3].isa;
  v15 = v3[4].isa;
  *(_QWORD *)&v21 = isa;
  *((_QWORD *)&v21 + 1) = v15;
  if (v15)
  {
    v16 = (unint64_t *)((char *)v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = *isa;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&v21);
  result = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v19 = __error();
    v20 = strerror(*v19);
    LODWORD(v21) = 136315138;
    *(_QWORD *)((char *)&v21 + 4) = v20;
    _os_log_error_impl(&dword_20DA91000, v18, OS_LOG_TYPE_ERROR, "Write failed: %s", (uint8_t *)&v21, 0xCu);
    return 0;
  }
  return result;
}

void ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  ssize_t v6;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  int *v10;
  char *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  uint8_t buf[4];
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        v6 = recv(*(_DWORD *)(a1 + 80), *(void **)(a1 + 48), 0x10000uLL, 0);
        if (v6 == -1)
        {
          if (*__error() != 35 && *__error() != 35)
          {
            v12 = **(NSObject ***)(a1 + 64);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v13 = __error();
              v14 = strerror(*v13);
              *(_DWORD *)buf = 136315138;
              v16 = v14;
              _os_log_error_impl(&dword_20DA91000, v12, OS_LOG_TYPE_ERROR, "Error encountered while reading: %s", buf, 0xCu);
            }
            exit(1);
          }
          v7 = **(NSObject ***)(a1 + 64);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v10 = __error();
            v11 = strerror(*v10);
            *(_DWORD *)buf = 136315138;
            v16 = v11;
            _os_log_debug_impl(&dword_20DA91000, v7, OS_LOG_TYPE_DEBUG, "Read issue: %s", buf, 0xCu);
          }
        }
        else if (v6)
        {
          (*(void (**)(uint64_t, _QWORD, ssize_t))(*(_QWORD *)v5 + 16))(v5, *(_QWORD *)(a1 + 48), v6);
        }
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

void sub_20DA92CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE48c48_ZTSKNSt3__110shared_ptrINS_5arrayIhLm65536EEEEE64c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = a2[9];
  result[8] = a2[8];
  result[9] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return result;
}

void __destroy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE48c48_ZTSKNSt3__110shared_ptrINS_5arrayIhLm65536EEEEE64c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 64);
  v2 = *(std::__shared_weak_count **)(a1 + 56);
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
  v5 = *(std::__shared_weak_count **)(a1 + 40);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose_(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke_3(uint64_t a1)
{
  std::shared_ptr<telephonytransport::NetworkSocket>::reset[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 40));
}

void std::shared_ptr<telephonytransport::NetworkSocket>::reset[abi:ne180100](_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
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

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

void std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::__get_deleter(uint64_t a1, uint64_t a2)
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

uint64_t std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__shared_ptr_emplace<std::array<unsigned char,65536ul>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C809768;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::array<unsigned char,65536ul>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C809768;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t telephonytransport::getDefaultOSLogHandle(telephonytransport *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"default", (const char *)&str_1, &telephonytransport::getDefaultOSLogHandle(void)::defaultOSLogHandle);
    __cxa_atexit((void (*)(void *))std::shared_ptr<telephonytransport::OSLogHandle>::~shared_ptr[abi:ne180100], &telephonytransport::getDefaultOSLogHandle(void)::defaultOSLogHandle, &dword_20DA91000);
  }
  return telephonytransport::getDefaultOSLogHandle(void)::defaultOSLogHandle;
}

void sub_20DA9300C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::getMacAddress(telephonytransport *this, char *a2, unsigned __int8 *a3)
{
  telephonytransport *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  ifaddrs *v10;
  sockaddr *ifa_addr;
  NSObject *v12;
  uint64_t v13;
  __uint8_t *v15;
  int v16;
  ifaddrs *v17;
  uint8_t buf[4];
  telephonytransport *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v5 = (telephonytransport *)getifaddrs(&v17);
  if ((_DWORD)v5)
  {
    v6 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Unable to get interface addresses";
      v8 = v6;
      v9 = 2;
LABEL_15:
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v10 = v17;
  if (!v17)
  {
LABEL_8:
    v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = this;
      v7 = "Couldn't find mac address for interface: %s";
      v8 = v12;
      v9 = 12;
      goto LABEL_15;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  while (1)
  {
    v5 = (telephonytransport *)strcmp((const char *)this, v10->ifa_name);
    if (!(_DWORD)v5)
    {
      ifa_addr = v10->ifa_addr;
      if (ifa_addr->sa_data[4] == 6)
        break;
    }
    v10 = v10->ifa_next;
    if (!v10)
      goto LABEL_8;
  }
  v15 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
  v16 = *((_DWORD *)v15 + 2);
  *((_WORD *)a2 + 2) = *((_WORD *)v15 + 6);
  *(_DWORD *)a2 = v16;
  v13 = 1;
LABEL_10:
  if (v17)
    MEMORY[0x212BAE710]();
  return v13;
}

void telephonytransport::toString(const __CFString *this@<X0>, uint64_t a2@<X8>)
{
  CFIndex Length;
  CFIndex Bytes;
  char *v8;
  char *v9;
  int64_t v10;
  _BYTE *v11;
  int64_t v12;
  char v13;
  void *__p[3];
  CFIndex usedBufLen;
  CFRange v16;
  CFRange v17;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if (this)
  {
    Length = CFStringGetLength(this);
    usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    v16.location = 0;
    v16.length = Length;
    Bytes = CFStringGetBytes(this, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if (usedBufLen && Bytes != 0)
    {
      memset(__p, 170, sizeof(__p));
      std::vector<unsigned char>::vector(__p, usedBufLen);
      v17.location = 0;
      v17.length = Length;
      if (CFStringGetBytes(this, v17, 0x8000100u, 0, 0, (UInt8 *)__p[0], (char *)__p[1] - (char *)__p[0], 0))
      {
        v8 = (char *)__p[0];
        v9 = (char *)__p[1];
        v10 = (char *)__p[1] - (char *)__p[0];
        v11 = (_BYTE *)a2;
        if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x17)
        {
          std::string::__grow_by((std::string *)a2, 0x16uLL, v10 - 22, 0, 0, 0, 0);
          *(_QWORD *)(a2 + 8) = 0;
          v11 = *(_BYTE **)a2;
          if (*(char *)(a2 + 23) >= 0)
            v11 = (_BYTE *)a2;
        }
        if (v9 != v8)
        {
          v12 = v10;
          do
          {
            v13 = *v8++;
            *v11++ = v13;
            --v12;
          }
          while (v12);
        }
        *v11 = 0;
        if (*(char *)(a2 + 23) < 0)
          *(_QWORD *)(a2 + 8) = v10;
        else
          *(_BYTE *)(a2 + 23) = v10 & 0x7F;
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
}

void sub_20DA932E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  uint64_t v12;

  if (*(char *)(v12 + 23) < 0)
    operator delete(*(void **)v12);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_20DA9336C(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C809330, MEMORY[0x24BEDAAF0]);
}

void sub_20DA93418(_Unwind_Exception *a1)
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void telephonytransport::TCPServer::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, int a5@<W4>, char *a6@<X5>, telephonytransport::TCPServer **a7@<X8>)
{
  uint64_t v8;
  NSObject *v9;
  telephonytransport::TCPServer *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  const char *v21;
  NSObject *v22;
  uint8_t buf[8];
  std::__shared_weak_count *v24;

  v8 = *((_QWORD *)a1 + 1);
  if (!v8 || *(_QWORD *)(v8 + 8) == -1)
  {
    v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Must provide a valid delegate";
      goto LABEL_19;
    }
LABEL_10:
    *a7 = 0;
    a7[1] = 0;
    return;
  }
  v9 = *a2;
  if (!*a2)
  {
    v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Providing acceptQueue is mandatory";
LABEL_19:
      _os_log_error_impl(&dword_20DA91000, v19, OS_LOG_TYPE_ERROR, v21, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v15 = (telephonytransport::TCPServer *)operator new(0x78uLL);
  v22 = v9;
  dispatch_retain(v9);
  telephonytransport::TCPServer::TCPServer((uint64_t)v15, (uint64_t)a1, &v22, a3, a4, a5, a6);
  *(_QWORD *)buf = v15;
  v16 = (std::__shared_weak_count *)operator new(0x20uLL);
  v16->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  v16->__vftable = (std::__shared_weak_count_vtbl *)off_24C809850;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v15;
  v24 = v16;
  dispatch_release(v9);
  if (telephonytransport::TCPServer::init(v15) && telephonytransport::TCPServer::startServer(v15))
  {
    *a7 = v15;
    a7[1] = (telephonytransport::TCPServer *)v16;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  else
  {
    *a7 = 0;
    a7[1] = 0;
  }
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
}

void sub_20DA93624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  telephonytransport::TCPServer *v11;
  NSObject *v12;
  void *v14;

  telephonytransport::TCPServer::~TCPServer(v11);
  operator delete(v14);
  dispatch_release(v12);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::TCPServer::init(telephonytransport::TCPServer *this)
{
  _QWORD *v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject **v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  _QWORD *v18;
  _BOOL8 result;
  const char **v20;
  const char *v21;
  NSObject **v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NSObject **v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  unint64_t v36;
  NSObject **v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  unint64_t v42;
  int *v43;
  char *v44;
  int v45;
  _BYTE v46[18];
  __int16 v47;
  _QWORD *v48;
  sockaddr v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)socket(2, 1, 0);
  telephonytransport::NetworkSocket::created(v2, v46);
  v3 = *(_OWORD *)v46;
  *(_OWORD *)v46 = 0uLL;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 13);
  *((_OWORD *)this + 6) = v3;
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
  v7 = *(std::__shared_weak_count **)&v46[8];
  if (*(_QWORD *)&v46[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&v46[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *((_QWORD *)this + 12);
  if (!v10)
  {
    v12 = *(NSObject ***)this;
    v13 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v13)
    {
      v14 = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      v16 = *v12;
      do
        v17 = __ldaxr(v14);
      while (__stlxr(v17 - 1, v14));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    else
    {
      v16 = *v12;
    }
    result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)v46 = 0;
      v28 = "Failed to create socket";
      v29 = v16;
      v30 = 2;
LABEL_69:
      _os_log_error_impl(&dword_20DA91000, v29, OS_LOG_TYPE_ERROR, v28, v46, v30);
      return 0;
    }
    return result;
  }
  if (*((char *)this + 63) < 0)
    v11 = *((_QWORD *)this + 6);
  else
    v11 = *((unsigned __int8 *)this + 63);
  v18 = (_QWORD *)((char *)this + 40);
  if (v11)
  {
    result = telephonytransport::NetworkSocket::bindToInterface(v10, (const char *)this + 40);
    if (!result)
      return result;
  }
  *(_DWORD *)&v49.sa_data[10] = 0;
  *(_QWORD *)&v49.sa_data[2] = 0;
  *(_WORD *)v49.sa_data = bswap32(*((unsigned __int16 *)this + 44)) >> 16;
  *(_WORD *)&v49.sa_len = 528;
  v20 = (const char **)((char *)this + 64);
  if (*((char *)this + 87) < 0)
  {
    if (!*((_QWORD *)this + 9))
      goto LABEL_30;
    v21 = *v20;
  }
  else
  {
    v21 = (char *)this + 64;
    if (!*((_BYTE *)this + 87))
    {
LABEL_30:
      result = telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe(*((telephonytransport::NetworkSocket **)this
                                                                             + 12));
      if (result)
      {
        result = telephonytransport::NetworkSocket::enablePortReuse(*((telephonytransport::NetworkSocket **)this + 12));
        if (result)
        {
          if (!bind(*(_DWORD *)(*((_QWORD *)this + 12) + 16), &v49, 0x10u))
            return 1;
          v22 = *(NSObject ***)this;
          v23 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
          if (v23)
          {
            v24 = (unint64_t *)&v23->__shared_owners_;
            do
              v25 = __ldxr(v24);
            while (__stxr(v25 + 1, v24));
            v26 = *v22;
            do
              v27 = __ldaxr(v24);
            while (__stlxr(v27 - 1, v24));
            if (!v27)
            {
              ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
              std::__shared_weak_count::__release_weak(v23);
            }
          }
          else
          {
            v26 = *v22;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            if (*((char *)this + 87) < 0)
              v20 = (const char **)*v20;
            v45 = *((_DWORD *)this + 22);
            if (*((char *)this + 63) < 0)
              v18 = (_QWORD *)*v18;
            *(_DWORD *)v46 = 136315650;
            *(_QWORD *)&v46[4] = v20;
            *(_WORD *)&v46[12] = 1024;
            *(_DWORD *)&v46[14] = v45;
            v47 = 2080;
            v48 = v18;
            _os_log_error_impl(&dword_20DA91000, v26, OS_LOG_TYPE_ERROR, "Unable to bind to %s:%u - %s", v46, 0x1Cu);
          }
          v37 = *(NSObject ***)this;
          v38 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
          if (v38)
          {
            v39 = (unint64_t *)&v38->__shared_owners_;
            do
              v40 = __ldxr(v39);
            while (__stxr(v40 + 1, v39));
            v41 = *v37;
            do
              v42 = __ldaxr(v39);
            while (__stlxr(v42 - 1, v39));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
              std::__shared_weak_count::__release_weak(v38);
            }
          }
          else
          {
            v41 = *v37;
          }
          result = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v43 = __error();
            v44 = strerror(*v43);
            *(_DWORD *)v46 = 136315138;
            *(_QWORD *)&v46[4] = v44;
            v28 = "%s";
            v29 = v41;
LABEL_68:
            v30 = 12;
            goto LABEL_69;
          }
        }
      }
      return result;
    }
  }
  if (inet_pton(2, v21, &v49.sa_data[2]) == 1)
    goto LABEL_30;
  v31 = *(NSObject ***)this;
  v32 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v32)
  {
    v33 = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    v35 = *v31;
    do
      v36 = __ldaxr(v33);
    while (__stlxr(v36 - 1, v33));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  else
  {
    v35 = *v31;
  }
  result = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
  if (result)
  {
    if (*((char *)this + 87) < 0)
      v20 = (const char **)*v20;
    *(_DWORD *)v46 = 136315138;
    *(_QWORD *)&v46[4] = v20;
    v28 = "Invalid address: %s";
    v29 = v35;
    goto LABEL_68;
  }
  return result;
}

BOOL telephonytransport::TCPServer::startServer(telephonytransport::TCPServer *this)
{
  NSObject **v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  dispatch_source_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  NSObject **v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  NSObject *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  _BOOL8 result;
  NSObject **v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  NSObject *v42;
  unint64_t v43;
  NSObject **v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  NSObject *v48;
  unint64_t v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  _QWORD *v53;
  int v54;
  _QWORD *v55;
  int *v56;
  char *v57;
  _QWORD v58[5];
  _QWORD handler[5];
  std::__shared_weak_count *v60;
  NSObject **v61;
  std::__shared_weak_count *v62;
  int v63;
  _BYTE buf[32];
  uint64_t (*v65)(uint64_t);
  uint64_t v66;
  std::__shared_weak_count *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  if (listen(*(_DWORD *)(*((_QWORD *)this + 12) + 16), 5))
  {
    v2 = *(NSObject ***)this;
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
      v6 = *v2;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    else
    {
      v6 = *v2;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v53 = (_QWORD *)((char *)this + 64);
      if (*((char *)this + 87) < 0)
        v53 = (_QWORD *)*v53;
      v54 = *((_DWORD *)this + 22);
      v55 = (_QWORD *)((char *)this + 40);
      if (*((char *)this + 63) < 0)
        v55 = (_QWORD *)*v55;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v53;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v54;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v55;
      _os_log_error_impl(&dword_20DA91000, v6, OS_LOG_TYPE_ERROR, "Failed to listen for %s:%u - %s", buf, 0x1Cu);
    }
    v38 = *(NSObject ***)this;
    v39 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v39)
    {
      v40 = (unint64_t *)&v39->__shared_owners_;
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
      v42 = *v38;
      do
        v43 = __ldaxr(v40);
      while (__stlxr(v43 - 1, v40));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    else
    {
      v42 = *v38;
    }
    result = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    v56 = __error();
    v57 = strerror(*v56);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v57;
    v50 = "%s";
    v51 = v42;
    v52 = 12;
LABEL_75:
    _os_log_error_impl(&dword_20DA91000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    return 0;
  }
  v8 = dispatch_source_create(MEMORY[0x24BDACA00], *(int *)(*((_QWORD *)this + 12) + 16), 0, *((dispatch_queue_t *)this + 4));
  v9 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = v8;
  if (v9)
  {
    dispatch_release(v9);
    v8 = (dispatch_source_t)*((_QWORD *)this + 14);
  }
  if (v8)
  {
    v10 = *(_DWORD *)(*((_QWORD *)this + 12) + 16);
    v11 = *((_QWORD *)this + 2);
    v12 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
    if (v12)
    {
      p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v14 = __ldxr(p_shared_weak_owners);
      while (__stxr(v14 + 1, p_shared_weak_owners));
    }
    v15 = *(NSObject ***)this;
    v16 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v16)
    {
      v17 = (unint64_t *)&v16->__shared_owners_;
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = *((_QWORD *)this + 14);
    v20 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v11;
    v60 = v12;
    if (v12)
    {
      v21 = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    v63 = v10;
    v61 = v15;
    v62 = v16;
    if (v16)
    {
      v23 = (unint64_t *)&v16->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    dispatch_source_set_event_handler(v19, handler);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3802000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__0;
    v65 = __Block_byref_object_dispose__0;
    v25 = (std::__shared_weak_count *)*((_QWORD *)this + 13);
    v66 = *((_QWORD *)this + 12);
    v67 = v25;
    if (v25)
    {
      v26 = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    v28 = *((_QWORD *)this + 14);
    v58[0] = v20;
    v58[1] = 1107296256;
    v58[2] = ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke_2;
    v58[3] = &__block_descriptor_tmp_3;
    v58[4] = buf;
    dispatch_source_set_cancel_handler(v28, v58);
    dispatch_resume(*((dispatch_object_t *)this + 14));
    _Block_object_dispose(buf, 8);
    v29 = v67;
    if (v67)
    {
      v30 = (unint64_t *)&v67->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = v62;
    if (v62)
    {
      v33 = (unint64_t *)&v62->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    if (v60)
      std::__shared_weak_count::__release_weak(v60);
    if (v16)
    {
      v35 = (unint64_t *)&v16->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    if (v12)
      std::__shared_weak_count::__release_weak(v12);
    return 1;
  }
  else
  {
    v44 = *(NSObject ***)this;
    v45 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v45)
    {
      v46 = (unint64_t *)&v45->__shared_owners_;
      do
        v47 = __ldxr(v46);
      while (__stxr(v47 + 1, v46));
      v48 = *v44;
      do
        v49 = __ldaxr(v46);
      while (__stlxr(v49 - 1, v46));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    else
    {
      v48 = *v44;
    }
    result = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      v50 = "Unable to create accept source";
      v51 = v48;
      v52 = 2;
      goto LABEL_75;
    }
  }
  return result;
}

uint64_t telephonytransport::TCPServer::TCPServer(uint64_t a1, uint64_t a2, NSObject **a3, __int128 *a4, __int128 *a5, int a6, char *a7)
{
  NSObject *v13;
  __int128 v14;
  __int128 v15;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpserver", a7, (_QWORD *)a1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v13 = *a3;
  *(_QWORD *)(a1 + 32) = *a3;
  if (v13)
    dispatch_retain(v13);
  v14 = *a4;
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a4 + 2);
  *(_OWORD *)(a1 + 40) = v14;
  *((_QWORD *)a4 + 1) = 0;
  *((_QWORD *)a4 + 2) = 0;
  *(_QWORD *)a4 = 0;
  v15 = *a5;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a5 + 2);
  *(_OWORD *)(a1 + 64) = v15;
  *((_QWORD *)a5 + 1) = 0;
  *((_QWORD *)a5 + 2) = 0;
  *(_QWORD *)a5 = 0;
  *(_DWORD *)(a1 + 88) = a6;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  return a1;
}

void telephonytransport::TCPServer::~TCPServer(telephonytransport::TCPServer *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 14);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *((_QWORD *)this + 14);
    if (v3)
      dispatch_release(v3);
  }
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  if (*((char *)this + 87) < 0)
    operator delete(*((void **)this + 8));
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  v4 = *((_QWORD *)this + 4);
  if (v4)
    dispatch_release(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  void (***v4)(_QWORD, unint64_t *);
  _QWORD *v5;
  std::__shared_weak_count *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int *v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  void (***v17)(_QWORD, unint64_t *);
  std::__shared_weak_count *v18;
  uint8_t buf[4];
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v18 = v3;
    if (v3)
    {
      v4 = *(void (****)(_QWORD, unint64_t *))(a1 + 32);
      v17 = v4;
      if (!v4)
      {
        v6 = v3;
LABEL_15:
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        return;
      }
      v15 = 0xAAAAAAAAAAAAAAAALL;
      v16 = 0xAAAAAAAAAAAAAAAALL;
      v5 = (_QWORD *)accept(*(_DWORD *)(a1 + 64), 0, 0);
      telephonytransport::NetworkSocket::created(v5, &v15);
      if (v15)
      {
        (**v4)(v4, &v15);
      }
      else
      {
        v7 = **(NSObject ***)(a1 + 48);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v13 = __error();
          v14 = strerror(*v13);
          *(_DWORD *)buf = 136315138;
          v20 = v14;
          _os_log_error_impl(&dword_20DA91000, v7, OS_LOG_TYPE_ERROR, "Accept failed: %s", buf, 0xCu);
        }
      }
      v8 = (std::__shared_weak_count *)v16;
      if (v16)
      {
        v9 = (unint64_t *)(v16 + 8);
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v6 = v18;
      if (v18)
        goto LABEL_15;
    }
  }
}

void sub_20DA94244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_32c65_ZTSKNSt3__18weak_ptrIN18telephonytransport17TCPServerDelegateEEE48c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_32c65_ZTSKNSt3__18weak_ptrIN18telephonytransport17TCPServerDelegateEEE48c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 48);
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__0(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke_2(uint64_t a1)
{
  std::shared_ptr<telephonytransport::NetworkSocket>::reset[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 40));
}

void std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::__on_zero_shared(uint64_t a1)
{
  telephonytransport::TCPServer *v1;
  void *v2;

  v1 = *(telephonytransport::TCPServer **)(a1 + 24);
  if (v1)
  {
    telephonytransport::TCPServer::~TCPServer(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL telephonytransport::toDataMessageType(telephonytransport *this)
{
  return (_DWORD)this == 1;
}

void telephonytransport::TransactionManager::add(std::mutex *this@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  uint64_t *v7;
  uint64_t **opaque;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  NSObject *v15;
  __int16 v16;
  char *v17;

  std::mutex::lock(this);
  v6 = (char *)operator new(0xA8uLL);
  *((_QWORD *)v6 + 2) = 0;
  *((_QWORD *)v6 + 3) = 850045863;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_QWORD *)v6 + 10) = 0;
  *((_QWORD *)v6 + 11) = 1018212795;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(_QWORD *)v6 = off_24C8098C8;
  *((_QWORD *)v6 + 1) = 0;
  v17 = v6;
  opaque = (uint64_t **)this[1].__m_.__opaque;
  v7 = *(uint64_t **)this[1].__m_.__opaque;
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v7;
        v10 = v7[4];
        if (v10 <= a2)
          break;
        v7 = *v9;
        opaque = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v10 >= a2)
        break;
      v7 = v9[1];
      if (!v7)
      {
        opaque = v9 + 1;
        goto LABEL_9;
      }
    }
    v14 = std::promise<telephonytransport::TransactionResponse>::~promise((uint64_t *)&v17);
    v15 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = 0;
      _os_log_fault_impl(&dword_20DA91000, v15, OS_LOG_TYPE_FAULT, "Emplace should always succeed (duplicate txnId is fatal)", (uint8_t *)&v16, 2u);
    }
    __break(1u);
  }
  else
  {
    v9 = (uint64_t **)this[1].__m_.__opaque;
LABEL_9:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = a2;
    v11[5] = (uint64_t)v6;
    v17 = 0;
    *v11 = 0;
    v11[1] = 0;
    v11[2] = (uint64_t)v9;
    *opaque = v11;
    v12 = *(_QWORD *)this[1].__m_.__sig;
    v13 = v11;
    if (v12)
    {
      this[1].__m_.__sig = v12;
      v13 = *opaque;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)this[1].__m_.__opaque, v13);
    ++*(_QWORD *)&this[1].__m_.__opaque[8];
    std::promise<telephonytransport::TransactionResponse>::~promise((uint64_t *)&v17);
    std::promise<telephonytransport::TransactionResponse>::get_future(a3, v11[5]);
    std::mutex::unlock(this);
  }
}

void sub_20DA94520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  std::mutex *v10;

  std::mutex::unlock(v10);
  _Unwind_Resume(a1);
}

void std::promise<telephonytransport::TransactionResponse>::get_future(_QWORD *a1, uint64_t a2)
{
  std::mutex *v3;
  int v4;
  unint64_t *v5;
  unint64_t v6;

  if (!a2)
    std::__throw_future_error[abi:ne180100](3u);
  *a1 = a2;
  v3 = (std::mutex *)(a2 + 24);
  std::mutex::lock((std::mutex *)(a2 + 24));
  v4 = *(_DWORD *)(a2 + 136);
  if ((v4 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v5 = (unint64_t *)(a2 + 8);
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  *(_DWORD *)(a2 + 136) = v4 | 2;
  std::mutex::unlock(v3);
}

void sub_20DA945B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::TransactionManager::fulfilPromise(uint64_t a1, unint64_t a2, int a3, __int128 *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  BOOL v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;

  std::mutex::lock((std::mutex *)a1);
  v8 = *(_QWORD **)(a1 + 72);
  if (!v8)
    goto LABEL_12;
  v9 = (_QWORD *)(a1 + 72);
  do
  {
    v10 = v8[4];
    v11 = v10 >= a2;
    if (v10 >= a2)
      v12 = v8;
    else
      v12 = v8 + 1;
    if (v11)
      v9 = v8;
    v8 = (_QWORD *)*v12;
  }
  while (*v12);
  if (v9 != (_QWORD *)(a1 + 72) && v9[4] <= a2)
  {
    LODWORD(v18) = a3;
    v19 = *a4;
    *(_QWORD *)a4 = 0;
    *((_QWORD *)a4 + 1) = 0;
    std::promise<telephonytransport::TransactionResponse>::set_value(v9 + 5, (uint64_t)&v18);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = a2;
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>(a1 + 64, &v18);
    v13 = 1;
  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  std::mutex::unlock((std::mutex *)a1);
  return v13;
}

void sub_20DA946D8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::promise<telephonytransport::TransactionResponse>::set_value(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (!v2)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<telephonytransport::TransactionResponse>::set_value<telephonytransport::TransactionResponse>(v2, a2);
}

void telephonytransport::TransactionManager::remove(std::mutex *this, unint64_t a2)
{
  unint64_t v4;

  std::mutex::lock(this);
  v4 = a2;
  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>((uint64_t)&this[1], &v4);
  std::mutex::unlock(this);
}

void sub_20DA94760(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__assoc_state<telephonytransport::TransactionResponse>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  operator delete(v3);
}

uint64_t std::__assoc_state<telephonytransport::TransactionResponse>::__on_zero_shared(_BYTE *a1)
{
  if ((a1[136] & 1) != 0)
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 152));
  return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<telephonytransport::TransactionResponse>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  const std::error_category *v4;
  unint64_t *v5;
  unint64_t v6;
  std::logic_error v8[2];
  std::exception_ptr v9;

  v2 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v9.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v9);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v4 = std::future_category();
        MEMORY[0x212BAE458](v8, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v8);
      }
    }
    v5 = (unint64_t *)(v2 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  std::logic_error *exception;
  std::logic_error *v3;

  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_20DA9497C(void *a1)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
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

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x212BAE458](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_20DA94B7C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<telephonytransport::TransactionResponse>::set_value<telephonytransport::TransactionResponse>(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::exception_ptr v9;

  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v9.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v9), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_DWORD *)(a1 + 144) = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 160) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_20DA94C3C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__remove_node_pointer((uint64_t **)a1, v4);
  std::promise<telephonytransport::TransactionResponse>::~promise(v4 + 5);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 != v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v18 = v7[1];
      *(_QWORD *)v12 = v18;
      if (v18)
        *(_QWORD *)(v18 + 16) = v12;
      v7[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
      v7[1] = v12;
      *(_QWORD *)(v12 + 16) = v7;
      if (result == (uint64_t *)v12)
        result = v7;
      v7 = *(uint64_t **)v12;
    }
    v19 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v19 + 24))
      goto LABEL_68;
    v20 = (uint64_t *)v7[1];
    if (v20 && !*((_BYTE *)v20 + 24))
    {
      if (v19 && !*((_BYTE *)v19 + 24))
      {
LABEL_68:
        v20 = v7;
      }
      else
      {
        *((_BYTE *)v20 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v26 = *v20;
        v7[1] = *v20;
        if (v26)
          *(_QWORD *)(v26 + 16) = v7;
        v20[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
        *v20 = (uint64_t)v7;
        v7[2] = (uint64_t)v20;
        v19 = v7;
      }
      v23 = v20[2];
      *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v19 + 24) = 1;
      v24 = *(uint64_t **)v23;
      v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
      *(_QWORD *)v23 = v27;
      if (v27)
        *(_QWORD *)(v27 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v13 = *(uint64_t **)(v12 + 8);
    v14 = *v13;
    *(_QWORD *)(v12 + 8) = *v13;
    if (v14)
      *(_QWORD *)(v14 + 16) = v12;
    v13[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
    *v13 = v12;
    *(_QWORD *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7)
      result = v7;
    v7 = *(uint64_t **)(*v7 + 8);
  }
  v15 = (_QWORD *)*v7;
  if (!*v7 || *((_BYTE *)v15 + 24))
  {
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_59;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
    goto LABEL_49;
  }
  v16 = (uint64_t *)v7[1];
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_59:
    v15 = v7;
  }
  else
  {
    *((_BYTE *)v15 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v22 = v15[1];
    *v7 = v22;
    if (v22)
      *(_QWORD *)(v22 + 16) = v7;
    v15[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    v16 = v7;
  }
  v23 = v15[2];
  *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v16 + 24) = 1;
  v24 = *(uint64_t **)(v23 + 8);
  v25 = *v24;
  *(_QWORD *)(v23 + 8) = *v24;
  if (v25)
    *(_QWORD *)(v25 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  *v24 = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void telephonytransport::NetworkSocketForwarder::create(uint64_t *a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, _QWORD *a5@<X8>)
{
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  telephonytransport *v15;
  std::__shared_weak_count_vtbl *v16;
  std::__shared_weak_count_vtbl *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_weak_owners;
  unint64_t v21;
  NSObject *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v49;
  std::__shared_weak_count *v50;
  __int128 v51;
  uint8_t buf[8];
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  NSObject *v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  std::__shared_weak_count_vtbl *v59;
  unint64_t v60;

  v59 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v60 = 0xAAAAAAAAAAAAAAAALL;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  v9 = (std::__shared_weak_count *)a2[1];
  v54 = *a2;
  v55 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  telephonytransport::TCPSocketStream::create((telephonytransport *)&v57, &v56, &v54, 1, a4, &v59);
  v12 = v55;
  if (v55)
  {
    v13 = (unint64_t *)&v55->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v56)
    dispatch_release(v56);
  v15 = (telephonytransport *)v58;
  if (v58)
    std::__shared_weak_count::__release_weak(v58);
  v16 = v59;
  if (v59)
  {
    v17 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v17->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_24C809910;
    v17->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v16;
    v18 = v60;
    v59 = 0;
    v60 = 0;
    v17->__get_deleter = 0;
    v17->__on_zero_shared_weak = 0;
    v17->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v18;
    *(_QWORD *)buf = v17;
    v19 = (std::__shared_weak_count *)operator new(0x20uLL);
    v19->__shared_weak_owners_ = 0;
    p_shared_weak_owners = (unint64_t *)&v19->__shared_weak_owners_;
    v19->__vftable = (std::__shared_weak_count_vtbl *)off_24C809950;
    v19->__shared_owners_ = 0;
    v19[1].__vftable = v17;
    v53 = v19;
    *(_QWORD *)&v51 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v17;
    v50 = v19;
    do
      v21 = __ldxr(p_shared_weak_owners);
    while (__stxr(v21 + 1, p_shared_weak_owners));
    v22 = *a3;
    object = v22;
    if (v22)
      dispatch_retain(v22);
    v23 = (std::__shared_weak_count *)a1[1];
    v46 = *a1;
    v47 = v23;
    if (v23)
    {
      v24 = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    telephonytransport::TCPSocketStream::create((telephonytransport *)&v49, &object, &v46, 0, a4, (std::__shared_weak_count_vtbl **)&v51);
    v26 = v47;
    if (v47)
    {
      v27 = (unint64_t *)&v47->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    if (object)
      dispatch_release(object);
    v29 = v50;
    if (v50)
      std::__shared_weak_count::__release_weak(v50);
    if ((_QWORD)v51)
    {
      v30 = *(_QWORD *)buf;
      std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](*(_QWORD *)buf + 24, &v51);
      v31 = v53;
      *a5 = v30;
      a5[1] = v31;
      if (v31)
      {
        v32 = (unint64_t *)&v31->__shared_owners_;
        do
          v33 = __ldxr(v32);
        while (__stxr(v33 + 1, v32));
      }
    }
    else
    {
      v35 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v29);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v45 = 0;
        _os_log_error_impl(&dword_20DA91000, v35, OS_LOG_TYPE_ERROR, "Failed to create source transport", (uint8_t *)&v45, 2u);
      }
      *a5 = 0;
      a5[1] = 0;
    }
    v36 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1))
    {
      v37 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    v39 = v53;
    if (v53)
    {
      v40 = (unint64_t *)&v53->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
  }
  else
  {
    v34 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v15);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v34, OS_LOG_TYPE_ERROR, "Failed to create destination transport", buf, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  v42 = (std::__shared_weak_count *)v60;
  if (v60)
  {
    v43 = (unint64_t *)(v60 + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
}

void sub_20DA95428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14, char a15, uint64_t a16, char a17)
{
  uint64_t v17;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v17 - 64);
  _Unwind_Resume(a1);
}

void sub_20DA95490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  va_list va;

  va_start(va, a11);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  v12 = *(NSObject **)(v11 - 88);
  if (v12)
    dispatch_release(v12);
  v13 = *(std::__shared_weak_count **)(v11 - 72);
  if (v13)
    std::__shared_weak_count::__release_weak(v13);
  JUMPOUT(0x20DA95488);
}

uint64_t std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

uint64_t telephonytransport::NetworkSocketForwarder::handleRead(telephonytransport::NetworkSocketForwarder *this, unsigned __int8 *a2)
{
  return (***((uint64_t (****)(_QWORD, unsigned __int8 *))this + 1))(*((_QWORD *)this + 1), a2);
}

void telephonytransport::NetworkSocketForwarder::~NetworkSocketForwarder(telephonytransport::NetworkSocketForwarder *this)
{
  char *v1;

  *(_QWORD *)this = off_24C809910;
  v1 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = off_24C809910;
  v2 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::RawIPIfaceToSocketForwarder::create(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  telephonytransport *v9;
  std::__shared_weak_count_vtbl *v10;
  std::__shared_weak_count_vtbl *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string v26;
  int v27;
  void *__p;
  char v29;
  uint64_t v30;
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v32;
  std::__shared_weak_count *v33;
  __int128 v34;
  std::__shared_weak_count_vtbl *v35;
  std::__shared_weak_count *v36;
  NSObject *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count_vtbl *v40;
  unint64_t v41;

  v40 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v38 = 0;
  v39 = 0;
  v37 = 0;
  telephonytransport::BaseProtocol::create((uint64_t)&v38, &v37, a2, 1, a4, &v40);
  if (v37)
    dispatch_release(v37);
  v9 = (telephonytransport *)v39;
  if (v39)
    std::__shared_weak_count::__release_weak(v39);
  v10 = v40;
  if (v40)
  {
    v11 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v11->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_24C8099C8;
    v11->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v11->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v41;
    v40 = 0;
    v41 = 0;
    v11->__get_deleter = 0;
    v11->__on_zero_shared_weak = 0;
    v35 = v11;
    v12 = (std::__shared_weak_count *)operator new(0x20uLL);
    v12->__shared_weak_owners_ = 0;
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)off_24C809A08;
    v12->__shared_owners_ = 0;
    v12[1].__vftable = v11;
    v36 = v12;
    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32 = v11;
    v33 = v12;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v15 = *a3;
    object = v15;
    if (v15)
      dispatch_retain(v15);
    if (*(char *)(a1 + 23) < 0)
      std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    else
      v26 = *(std::string *)a1;
    v27 = 12;
    std::string::basic_string[abi:ne180100]<0>(&__p, "ip or ip6");
    v30 = 0x100000000;
    telephonytransport::NetworkIface::create((telephonytransport *)&v32, &object, (uint64_t)&v26, a4, (telephonytransport::NetworkIface **)&v34);
    if (v29 < 0)
      operator delete(__p);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    if (object)
      dispatch_release(object);
    if (v33)
      std::__shared_weak_count::__release_weak(v33);
    std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)&v11->__get_deleter, &v34);
    *a5 = v11;
    a5[1] = (std::__shared_weak_count_vtbl *)v12;
    v35 = 0;
    v36 = 0;
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = v36;
    if (v36)
    {
      p_shared_owners = (unint64_t *)&v36->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  else
  {
    v16 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_20DA91000, v16, OS_LOG_TYPE_ERROR, "Failed to create destination write only protocol", (uint8_t *)&v26, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  v23 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v24 = (unint64_t *)(v41 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
}

void sub_20DA958E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  uint64_t v26;

  if (v25)
    dispatch_release(v25);
  if (a22)
    std::__shared_weak_count::__release_weak(a22);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v26 - 80);
  _Unwind_Resume(a1);
}

void sub_20DA95960()
{
  uint64_t v0;
  NSObject *v1;
  std::__shared_weak_count *v2;

  v1 = *(NSObject **)(v0 - 104);
  if (v1)
    dispatch_release(v1);
  v2 = *(std::__shared_weak_count **)(v0 - 88);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  JUMPOUT(0x20DA95958);
}

__n128 telephonytransport::RawIPIfaceToSocketForwarder::RawIPIfaceToSocketForwarder(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(_QWORD *)a1 = off_24C8099C8;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(_QWORD *)a1 = off_24C8099C8;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

void telephonytransport::NetworkIfaceParams::~NetworkIfaceParams(void **this)
{
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

uint64_t telephonytransport::RawIPIfaceToSocketForwarder::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 24, a2);
  return 1;
}

uint64_t telephonytransport::RawIPIfaceToSocketForwarder::handleRead(std::mutex **this, unsigned __int8 *a2, size_t a3)
{
  return telephonytransport::BaseProtocol::sendMessage(this[1], 1u, a2, a3);
}

void telephonytransport::RawIPIfaceToSocketForwarder::~RawIPIfaceToSocketForwarder(telephonytransport::RawIPIfaceToSocketForwarder *this)
{
  char *v1;

  *(_QWORD *)this = off_24C8099C8;
  v1 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = off_24C8099C8;
  v2 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
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

void std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketToEthernetIfaceForwarder::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, NSObject **a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, std::string *a6@<X8>)
{
  telephonytransport *v11;
  telephonytransport::NetworkIface *v12;
  char *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  NSObject *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *size;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint8_t v30[8];
  dispatch_object_t object;
  char *v32;
  std::__shared_weak_count *v33;
  __int128 v34;
  std::string v35;
  int v36;
  void *__p;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  telephonytransport::NetworkIface *v44;
  unint64_t v45;

  v44 = (telephonytransport::NetworkIface *)0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  v42 = 0;
  v43 = 0;
  v41 = 0;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v35 = *(std::string *)a2;
  v36 = 1;
  v38 = 0;
  v39 = 0;
  __p = 0;
  v40 = 1;
  telephonytransport::NetworkIface::create((telephonytransport *)&v42, &v41, (uint64_t)&v35, a5, &v44);
  if (SHIBYTE(v39) < 0)
    operator delete(__p);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if (v41)
    dispatch_release(v41);
  v11 = (telephonytransport *)v43;
  if (v43)
    std::__shared_weak_count::__release_weak(v43);
  v12 = v44;
  if (v44)
  {
    v13 = (char *)operator new(0x618uLL);
    *(_QWORD *)v13 = &off_24C809A80;
    *((_QWORD *)v13 + 1) = v12;
    *((_QWORD *)v13 + 2) = v45;
    v44 = 0;
    v45 = 0;
    *((_QWORD *)v13 + 3) = 0;
    *((_QWORD *)v13 + 4) = 0;
    *((_DWORD *)v13 + 10) = *(_DWORD *)(a4 + 6);
    *((_WORD *)v13 + 22) = *(_WORD *)(a4 + 10);
    *(_DWORD *)(v13 + 46) = *(_DWORD *)a4;
    *((_WORD *)v13 + 25) = *(_WORD *)(a4 + 4);
    v35.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    v14 = (std::__shared_weak_count *)operator new(0x20uLL);
    v14->__shared_weak_owners_ = 0;
    p_shared_weak_owners = (unint64_t *)&v14->__shared_weak_owners_;
    v14->__vftable = (std::__shared_weak_count_vtbl *)off_24C809AC0;
    v14->__shared_owners_ = 0;
    v14[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
    v35.__r_.__value_.__l.__size_ = (std::string::size_type)v14;
    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32 = v13;
    v33 = v14;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    v17 = *a3;
    object = v17;
    if (v17)
      dispatch_retain(v17);
    telephonytransport::BaseProtocol::create((uint64_t)&v32, &object, a1, 0, a5, (std::__shared_weak_count_vtbl **)&v34);
    if (object)
      dispatch_release(object);
    v18 = v33;
    if (v33)
      std::__shared_weak_count::__release_weak(v33);
    if ((_QWORD)v34)
    {
      std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)(v13 + 24), &v34);
      a6->__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
      a6->__r_.__value_.__l.__size_ = (std::string::size_type)v14;
      a6 = &v35;
    }
    else
    {
      v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v18);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl(&dword_20DA91000, v20, OS_LOG_TYPE_ERROR, "Failed to create source read only protocol", v30, 2u);
      }
    }
    a6->__r_.__value_.__r.__words[0] = 0;
    a6->__r_.__value_.__l.__size_ = 0;
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    size = (std::__shared_weak_count *)v35.__r_.__value_.__l.__size_;
    if (v35.__r_.__value_.__l.__size_)
    {
      v25 = (unint64_t *)(v35.__r_.__value_.__l.__size_ + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
  }
  else
  {
    v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v11);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_20DA91000, v19, OS_LOG_TYPE_ERROR, "Failed to create destination write only transport", (uint8_t *)&v35, 2u);
    }
    a6->__r_.__value_.__r.__words[0] = 0;
    a6->__r_.__value_.__l.__size_ = 0;
  }
  v27 = (std::__shared_weak_count *)v45;
  if (v45)
  {
    v28 = (unint64_t *)(v45 + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

void sub_20DA95F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, char a13, uint64_t a14, char a15)
{
  uint64_t v15;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v15 - 80);
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketToEthernetIfaceForwarder::SocketToEthernetIfaceForwarder(uint64_t a1, __n128 *a2, int *a3)
{
  __n128 result;
  int v4;
  int v5;

  *(_QWORD *)a1 = &off_24C809A80;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v4 = *(int *)((char *)a3 + 6);
  *(_WORD *)(a1 + 44) = *((_WORD *)a3 + 5);
  *(_DWORD *)(a1 + 40) = v4;
  v5 = *a3;
  *(_WORD *)(a1 + 50) = *((_WORD *)a3 + 2);
  *(_DWORD *)(a1 + 46) = v5;
  return result;
}

{
  __n128 result;
  int v4;
  int v5;

  *(_QWORD *)a1 = &off_24C809A80;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v4 = *(int *)((char *)a3 + 6);
  *(_WORD *)(a1 + 44) = *((_WORD *)a3 + 5);
  *(_DWORD *)(a1 + 40) = v4;
  v5 = *a3;
  *(_WORD *)(a1 + 50) = *((_WORD *)a3 + 2);
  *(_DWORD *)(a1 + 46) = v5;
  return result;
}

uint64_t telephonytransport::SocketToEthernetIfaceForwarder::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 24, a2);
  return 1;
}

uint64_t telephonytransport::SocketToEthernetIfaceForwarder::handleMessage(_BOOL8 this, int a2, unsigned __int8 *a3, size_t __n)
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  size_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  __int16 v12;
  NSObject *v14;
  int v15;
  size_t v16;
  unsigned __int8 *__src;
  uint8_t buf[4];
  size_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
    goto LABEL_6;
  v4 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
  this = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (this)
  {
    *(_WORD *)buf = 0;
    v5 = "Only kPDPIP message type is supported here";
    v6 = v4;
    v7 = 2;
LABEL_4:
    _os_log_fault_impl(&dword_20DA91000, v6, OS_LOG_TYPE_FAULT, v5, buf, v7);
    goto LABEL_5;
  }
  while (1)
  {
LABEL_5:
    while (1)
    {
      __break(1u);
LABEL_6:
      v8 = __n;
      if (__n + 14 < 0x5EF)
        break;
      v9 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
      this = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
      if (this)
      {
        *(_DWORD *)buf = 134217984;
        v19 = v8;
        v5 = "Cannot handle packet of length: %lu";
        v6 = v9;
        v7 = 12;
        goto LABEL_4;
      }
    }
    v16 = __n + 14;
    __src = a3;
    v10 = this;
    v11 = *a3 >> 4;
    if (v11 == 4)
    {
      v12 = 8;
      goto LABEL_13;
    }
    if (v11 == 6)
      break;
    v14 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
    this = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
    if (this)
    {
      v15 = *__src >> 4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v15;
      v5 = "IP header version: %u is invalid";
      v6 = v14;
      v7 = 8;
      goto LABEL_4;
    }
  }
  v12 = -8826;
LABEL_13:
  *(_WORD *)(this + 52) = v12;
  memcpy((void *)(this + 54), a3, __n);
  return (***(uint64_t (****)(_QWORD, uint64_t, size_t))(v10 + 8))(*(_QWORD *)(v10 + 8), v10 + 40, v16);
}

void telephonytransport::SocketToEthernetIfaceForwarder::~SocketToEthernetIfaceForwarder(telephonytransport::SocketToEthernetIfaceForwarder *this)
{
  char *v1;

  *(_QWORD *)this = &off_24C809A80;
  v1 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = &off_24C809A80;
  v2 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

_QWORD *telephonytransport::NetworkSocket::created@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  int v3;
  _DWORD *v4;
  __int128 v5;

  if ((_DWORD)this == -1)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    v3 = (int)this;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v4 = operator new(0x18uLL);
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"networksocket", (const char *)&str_1_0, v4);
    v4[4] = v3;
    this = std::shared_ptr<telephonytransport::NetworkSocket>::shared_ptr[abi:ne180100]<telephonytransport::NetworkSocket,void>(&v5, (uint64_t)v4);
    *(_OWORD *)a2 = v5;
  }
  return this;
}

void sub_20DA963DC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

telephonytransport::NetworkSocket *telephonytransport::NetworkSocket::NetworkSocket(telephonytransport::NetworkSocket *this, int a2)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"networksocket", (const char *)&str_1_0, this);
  *((_DWORD *)this + 4) = a2;
  return this;
}

{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"networksocket", (const char *)&str_1_0, this);
  *((_DWORD *)this + 4) = a2;
  return this;
}

uint64_t telephonytransport::NetworkSocket::init(telephonytransport::NetworkSocket *this)
{
  return 1;
}

void telephonytransport::NetworkSocket::~NetworkSocket(telephonytransport::NetworkSocket *this)
{
  close(*((_DWORD *)this + 4));
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

uint64_t telephonytransport::NetworkSocket::getValue(telephonytransport::NetworkSocket *this)
{
  return *((unsigned int *)this + 4);
}

BOOL telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe(telephonytransport::NetworkSocket *this)
{
  int v2;
  _BOOL8 v3;
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  NSObject **v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  uint8_t v17[12];
  int v18;
  uint8_t buf[16];

  if (fcntl(*((_DWORD *)this + 4), 4, 4) == -1)
  {
    v10 = *(NSObject ***)this;
    v11 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
      v14 = *v10;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    else
    {
      v14 = *v10;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v14, OS_LOG_TYPE_ERROR, "Warning: Unable to mark socket as non blocking", buf, 2u);
    }
    return 0;
  }
  else
  {
    v18 = 1;
    v2 = setsockopt(*((_DWORD *)this + 4), 0xFFFF, 4130, &v18, 4u);
    v3 = v2 != -1;
    if (v2 == -1)
    {
      v4 = *(NSObject ***)this;
      v5 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
      if (v5)
      {
        v6 = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(v6);
        while (__stxr(v7 + 1, v6));
        v8 = *v4;
        do
          v9 = __ldaxr(v6);
        while (__stlxr(v9 - 1, v6));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
      else
      {
        v8 = *v4;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Unable to set SO_NOSIGPIPE option", v17, 2u);
      }
    }
  }
  return v3;
}

BOOL telephonytransport::NetworkSocket::enablePortReuse(telephonytransport::NetworkSocket *this)
{
  int v2;
  NSObject **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  uint8_t v10[12];
  int v11;

  v11 = 1;
  v2 = setsockopt(*((_DWORD *)this + 4), 0xFFFF, 512, &v11, 4u);
  if (v2 == -1)
  {
    v3 = *(NSObject ***)this;
    v4 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
      v7 = *v3;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      v7 = *v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_20DA91000, v7, OS_LOG_TYPE_ERROR, "Failed to enable port reuse", v10, 2u);
    }
  }
  return v2 != -1;
}

BOOL telephonytransport::NetworkSocket::bindToInterface(uint64_t a1, const char *a2)
{
  const char *v4;
  NSObject **v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject **v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  _BOOL8 result;
  const char *v18;
  const char *v19;
  unsigned int v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((a2[23] & 0x80000000) == 0)
  {
    if (a2[23])
    {
      v4 = a2;
      goto LABEL_6;
    }
    return 0;
  }
  if (!*((_QWORD *)a2 + 1))
    return 0;
  v4 = *(const char **)a2;
LABEL_6:
  v20 = if_nametoindex(v4);
  if (!v20)
  {
    v11 = *(NSObject ***)a1;
    v12 = *(std::__shared_weak_count **)(a1 + 8);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      v15 = *v11;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    else
    {
      v15 = *v11;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (a2[23] >= 0)
        v19 = a2;
      else
        v19 = *(const char **)a2;
      *(_DWORD *)buf = 136315138;
      v22 = v19;
      _os_log_error_impl(&dword_20DA91000, v15, OS_LOG_TYPE_ERROR, "Unable to find index for interface: %s", buf, 0xCu);
    }
    return 1;
  }
  if (!setsockopt(*(_DWORD *)(a1 + 16), 0, 25, &v20, 4u))
    return 1;
  v5 = *(NSObject ***)a1;
  v6 = *(std::__shared_weak_count **)(a1 + 8);
  if (v6)
  {
    v7 = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    v9 = *v5;
    do
      v10 = __ldaxr(v7);
    while (__stlxr(v10 - 1, v7));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    v9 = *v5;
  }
  result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    if (a2[23] >= 0)
      v18 = a2;
    else
      v18 = *(const char **)a2;
    *(_DWORD *)buf = 136315138;
    v22 = v18;
    _os_log_error_impl(&dword_20DA91000, v9, OS_LOG_TYPE_ERROR, "Unable to bind to interface: %s", buf, 0xCu);
    return 0;
  }
  return result;
}

_QWORD *std::shared_ptr<telephonytransport::NetworkSocket>::shared_ptr[abi:ne180100]<telephonytransport::NetworkSocket,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24C809B38;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_20DA9698C(_Unwind_Exception *exception_object)
{
  telephonytransport::NetworkSocket *v1;
  void *v3;

  if (v1)
  {
    telephonytransport::NetworkSocket::~NetworkSocket(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::__on_zero_shared(uint64_t a1)
{
  telephonytransport::NetworkSocket *v1;
  void *v2;

  v1 = *(telephonytransport::NetworkSocket **)(a1 + 24);
  if (v1)
  {
    telephonytransport::NetworkSocket::~NetworkSocket(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::TCPClientSocketFactoryNetwork::create(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;

  v6 = (char *)operator new(0x58uLL);
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (_QWORD *)v6 + 1);
  *(_QWORD *)v6 = &off_24C809BB0;
  *(_OWORD *)(v6 + 24) = *(_OWORD *)a1;
  *((_QWORD *)v6 + 5) = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *((_OWORD *)v6 + 3) = *(_OWORD *)a2;
  *((_QWORD *)v6 + 8) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v7 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_24C809C10;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  if (telephonytransport::TCPClientSocketFactoryNetwork::init((telephonytransport::TCPClientSocketFactoryNetwork *)v6))
  {
    *a3 = v6;
    a3[1] = v7;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void sub_20DA96B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::TCPClientSocketFactoryNetwork::TCPClientSocketFactoryNetwork(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v6;
  __int128 v7;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (_QWORD *)(a1 + 8));
  *(_QWORD *)a1 = &off_24C809BB0;
  v6 = *a2;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 24) = v6;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v7 = *a3;
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a1 + 48) = v7;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  *(_QWORD *)a3 = 0;
  return a1;
}

{
  __int128 v6;
  __int128 v7;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (_QWORD *)(a1 + 8));
  *(_QWORD *)a1 = &off_24C809BB0;
  v6 = *a2;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 24) = v6;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v7 = *a3;
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a1 + 48) = v7;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  *(_QWORD *)a3 = 0;
  return a1;
}

BOOL telephonytransport::TCPClientSocketFactoryNetwork::init(telephonytransport::TCPClientSocketFactoryNetwork *this)
{
  const char **v2;
  const char *v3;
  int v4;
  NSObject **v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  int v12;
  const char **v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_WORD *)this + 36) = 528;
  v2 = (const char **)((char *)this + 24);
  v3 = (char *)this + 24;
  if (*((char *)this + 47) < 0)
    v3 = *v2;
  v4 = inet_pton(2, v3, (char *)this + 76);
  if (v4 != 1)
  {
    v5 = (NSObject **)*((_QWORD *)this + 1);
    v6 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
      v9 = *v5;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    else
    {
      v9 = *v5;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)this + 47) < 0)
        v2 = (const char **)*v2;
      v12 = 136315138;
      v13 = v2;
      _os_log_error_impl(&dword_20DA91000, v9, OS_LOG_TYPE_ERROR, "Invalid address: %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v4 == 1;
}

void telephonytransport::TCPClientSocketFactoryNetwork::connectTo(telephonytransport::TCPClientSocketFactoryNetwork *this@<X0>, unsigned int a2@<W1>, __int128 *a3@<X8>)
{
  _QWORD *v6;
  int *v7;
  NSObject **v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  unint64_t v13;
  NSObject **v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  NSObject **v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  char *v30;
  int *v31;
  char *v32;
  __int128 v33;
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  *((_WORD *)this + 37) = bswap32(a2) >> 16;
  *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6 = (_QWORD *)socket(2, 1, 0);
  telephonytransport::NetworkSocket::created(v6, &v33);
  v7 = (int *)v33;
  if (!(_QWORD)v33)
  {
    v8 = (NSObject **)*((_QWORD *)this + 1);
    v9 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
      v12 = *v8;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    else
    {
      v12 = *v8;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v12, OS_LOG_TYPE_ERROR, "Failed to create socket", buf, 2u);
    }
    *a3 = v33;
LABEL_28:
    a3 = &v33;
    goto LABEL_41;
  }
  if (*((char *)this + 71) < 0)
  {
    if (!*((_QWORD *)this + 7))
      goto LABEL_14;
  }
  else if (!*((_BYTE *)this + 71))
  {
    goto LABEL_14;
  }
  if (!telephonytransport::NetworkSocket::bindToInterface(v33, (const char *)this + 48))
    goto LABEL_41;
LABEL_14:
  if (!connect(v7[4], (const sockaddr *)((char *)this + 72), 0x10u))
  {
    if (!telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe((telephonytransport::NetworkSocket *)v7))
      goto LABEL_41;
    v20 = *((_QWORD *)&v33 + 1);
    *(_QWORD *)a3 = v7;
    *((_QWORD *)a3 + 1) = v20;
    goto LABEL_28;
  }
  v14 = (NSObject **)*((_QWORD *)this + 1);
  v15 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    v18 = *v14;
    do
      v19 = __ldaxr(v16);
    while (__stlxr(v19 - 1, v16));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  else
  {
    v18 = *v14;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v30 = (char *)this + 24;
    if (*((char *)this + 47) < 0)
      v30 = *(char **)v30;
    *(_DWORD *)buf = 136315394;
    v35 = v30;
    v36 = 1024;
    v37 = a2;
    _os_log_error_impl(&dword_20DA91000, v18, OS_LOG_TYPE_ERROR, "Failed to connect to: %s:%u", buf, 0x12u);
  }
  v21 = (NSObject **)*((_QWORD *)this + 1);
  v22 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    v25 = *v21;
    do
      v26 = __ldaxr(v23);
    while (__stlxr(v26 - 1, v23));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  else
  {
    v25 = *v21;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v31 = __error();
    v32 = strerror(*v31);
    *(_DWORD *)buf = 136315138;
    v35 = v32;
    _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
LABEL_41:
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
  if (*((_QWORD *)&v33 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

void sub_20DA970FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::TCPClientSocketFactoryNetwork::~TCPClientSocketFactoryNetwork(void **this)
{
  *this = &off_24C809BB0;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(this + 1));
}

{
  *this = &off_24C809BB0;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(this + 1));
  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::PCIServiceTransport::create(uint64_t a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, char *a4@<X3>, _QWORD *a5@<X8>)
{
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v13;
  unint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  __int16 v36;
  dispatch_object_t object;
  void *v38;
  std::__shared_weak_count *v39;
  __int128 v40;
  void *v41;
  std::__shared_weak_count *v42;

  v10 = operator new(0x50uLL);
  telephonytransport::PCIServiceTransport::PCIServiceTransport((uint64_t)v10, a1, a4);
  v41 = v10;
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)off_24C809DA8;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
  v42 = v11;
  v13 = (std::__shared_weak_count *)*((_QWORD *)v10 + 2);
  if (v13)
  {
    if (v13->__shared_owners_ != -1)
      goto LABEL_14;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    *((_QWORD *)v10 + 1) = v10;
    *((_QWORD *)v10 + 2) = v11;
    std::__shared_weak_count::__release_weak(v13);
  }
  else
  {
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v18 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    *((_QWORD *)v10 + 1) = v10;
    *((_QWORD *)v10 + 2) = v11;
  }
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_14:
  *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v41;
  v21 = v42;
  v38 = v41;
  v39 = v42;
  if (v42)
  {
    v23 = (unint64_t *)&v42->__shared_weak_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v25 = *a2;
  object = v25;
  if (v25)
    dispatch_retain(v25);
  telephonytransport::BaseProtocol::create((uint64_t)&v38, &object, a3, 2, a4, (std::__shared_weak_count_vtbl **)&v40);
  if (object)
    dispatch_release(object);
  v26 = v39;
  if (v39)
    std::__shared_weak_count::__release_weak(v39);
  if ((_QWORD)v40)
  {
    std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)v22 + 64, &v40);
    *a5 = v22;
    a5[1] = v21;
    if (v21)
    {
      v27 = (unint64_t *)&v21->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
  }
  else
  {
    v29 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v26);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v36 = 0;
      _os_log_impl(&dword_20DA91000, v29, OS_LOG_TYPE_INFO, "Failed to create base protocol", (uint8_t *)&v36, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
  if (*((_QWORD *)&v40 + 1))
  {
    v31 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = v42;
  if (v42)
  {
    v34 = (unint64_t *)&v42->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
}

void sub_20DA974BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, char a13, uint64_t a14, char a15)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIServiceTransport::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 64, a2);
  return 1;
}

uint64_t telephonytransport::PCIServiceTransport::PCIServiceTransport(uint64_t a1, uint64_t a2, char *a3)
{
  NSObject *v5;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"pciservicetransport", a3, (_QWORD *)(a1 + 24));
  *(_QWORD *)a1 = &off_24C809C88;
  v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INITIATED, 0);
  *(_QWORD *)(a1 + 40) = dispatch_queue_create("PCIServiceTransport", v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  return a1;
}

void sub_20DA975C0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

void telephonytransport::PCIServiceTransport::executeAsync(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  __int128 v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  uint64_t v23;
  _QWORD v24[5];
  std::__shared_weak_count *v25;
  _BYTE v26[24];
  _BYTE *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(std::__shared_weak_count **)(a1 + 16);
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28 = v10;
  v29 = v10;
  v11 = a2 + 3;
  v12 = (_QWORD *)a2[3];
  if (!v12)
  {
    v11 = (_QWORD *)&v29 + 1;
    goto LABEL_8;
  }
  if (v12 != a2)
  {
    *((_QWORD *)&v29 + 1) = a2[3];
LABEL_8:
    *v11 = 0;
    goto LABEL_10;
  }
  *((_QWORD *)&v29 + 1) = &v28;
  (*(void (**)(_QWORD *, __int128 *))(*a2 + 24))(a2, &v28);
LABEL_10:
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 1174405120;
  v24[2] = ___ZN18telephonytransport19PCIServiceTransport12executeAsyncEONSt3__18functionIFvvEEE_block_invoke;
  v24[3] = &__block_descriptor_tmp_1;
  v24[4] = v7;
  v25 = v6;
  if (v6)
  {
    v13 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = v26;
  v16 = *((_QWORD *)&v29 + 1);
  if (!*((_QWORD *)&v29 + 1))
    goto LABEL_16;
  if (*((__int128 **)&v29 + 1) != &v28)
  {
    v16 = (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t, uint64_t))(**((_QWORD **)&v29 + 1) + 16))(*((_QWORD *)&v29 + 1), a2, a3, a4, a5);
LABEL_16:
    v27 = (_BYTE *)v16;
    goto LABEL_18;
  }
  v27 = v26;
  (*(void (**)(__int128 *, _BYTE *))(v28 + 24))(&v28, v26);
LABEL_18:
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v24);
  if (v27 == v26)
  {
    v21 = 4;
  }
  else
  {
    if (!v27)
      goto LABEL_23;
    v21 = 5;
    v15 = v27;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v21))(v15);
LABEL_23:
  if (v25)
    std::__shared_weak_count::__release_weak(v25);
  v22 = (__int128 *)*((_QWORD *)&v29 + 1);
  if (*((__int128 **)&v29 + 1) == &v28)
  {
    v23 = 4;
    v22 = &v28;
  }
  else
  {
    if (!*((_QWORD *)&v29 + 1))
      goto LABEL_30;
    v23 = 5;
  }
  (*(void (**)(__int128 *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v22 + 8 * v23))(v22, v17, v18, v19, v20);
LABEL_30:
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void sub_20DA977B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZN18telephonytransport19PCIServiceTransport12executeAsyncEONSt3__18functionIFvvEEE_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = (std::__shared_weak_count *)a1[5];
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      if (a1[4])
      {
        v5 = a1[9];
        if (!v5)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

void sub_20DA978B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c66_ZTSNSt3__18weak_ptrIN18telephonytransport19PCIServiceTransportEEE48c27_ZTSNSt3__18functionIFvvEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t result;

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
  result = a2[9];
  if (!result)
    goto LABEL_7;
  if ((_QWORD *)result != a2 + 6)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
LABEL_7:
    a1[9] = result;
    return result;
  }
  a1[9] = a1 + 6;
  return (*(uint64_t (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[9] + 24))(a2[9], a1 + 6);
}

void sub_20DA9794C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 40);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_32c66_ZTSNSt3__18weak_ptrIN18telephonytransport19PCIServiceTransportEEE48c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = (_QWORD *)(a1 + 48);
  v3 = *(_QWORD **)(a1 + 72);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = *(std::__shared_weak_count **)(a1 + 40);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(_QWORD *a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  void (***v23)(telephonytransport::PCICreateResponse *__hidden);
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  _BYTE v38[24];
  _BYTE *v39;
  void (**v40)(telephonytransport::PCICreateResponse *__hidden);
  uint64_t v41;
  int v42;
  _BYTE v43[12];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    v37 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = a1[6];
      v36 = v7;
      if (!v7)
      {
LABEL_27:
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v30 = __ldaxr(p_shared_owners);
        while (__stlxr(v30 - 1, p_shared_owners));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        return;
      }
      v9 = a1[1];
      v8 = a1[2];
      if (v8)
      {
        v10 = (unint64_t *)(v8 + 16);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
        v12 = a1[2];
        v34 = a1[1];
        if (v12)
        {
          v13 = (unint64_t *)(v12 + 16);
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 + 1, v13));
        }
      }
      else
      {
        v12 = 0;
        v34 = a1[1];
      }
      v35 = -1431655766;
      v32 = *(_DWORD *)(*a2 + 36);
      v33 = *(_DWORD *)(*a2 + 32);
      v15 = *(unsigned int *)(*a2 + 24);
      v31 = *(_DWORD *)(*a2 + 28);
      v16 = *(unsigned int *)(*a2 + 16);
      v17 = *(unsigned int *)(*a2 + 20);
      v18 = operator new(0x20uLL);
      *v18 = &off_24C809E60;
      v18[1] = a1;
      v18[2] = v9;
      v18[3] = v8;
      *(_QWORD *)&v43[4] = v18;
      v19 = operator new(0x20uLL);
      *v19 = &off_24C809EF0;
      v19[1] = a1;
      v19[2] = v34;
      v19[3] = v12;
      v39 = v19;
      v20 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, void (***)(telephonytransport::PCICreateResponse *__hidden), _BYTE *, int *))(*(_QWORD *)v7 + 16))(v7, v33, v17, v15, v32, v31, v16, &v40, v38, &v35);
      v21 = v39;
      if (v39 == v38)
      {
        v22 = 4;
        v21 = v38;
      }
      else
      {
        if (!v39)
          goto LABEL_17;
        v22 = 5;
      }
      (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_17:
      v23 = *(void (****)(telephonytransport::PCICreateResponse *__hidden))&v43[4];
      if (*(void (****)(telephonytransport::PCICreateResponse *__hidden))&v43[4] == &v40)
      {
        v24 = 4;
        v23 = &v40;
      }
      else
      {
        if (!*(_QWORD *)&v43[4])
          goto LABEL_22;
        v24 = 5;
      }
      ((void (*)(void))(*v23)[v24])();
LABEL_22:
      if ((v20 & 1) != 0)
      {
        *(_QWORD *)&v43[4] = 0xAAAAAAAAAAAAAAAALL;
        v25 = *a2;
        v26 = v35;
        *(_QWORD *)v43 = 0x300000000;
        v27 = *(_QWORD *)(v25 + 8);
        *(_QWORD *)(v25 + 8) = 0;
        v40 = off_24C80B420;
        v41 = v27;
        v42 = v26;
        telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>((uint64_t)a1, (PB::Base *)&v40);
        v28 = v41;
        v40 = off_24C80B420;
        v41 = 0;
        if (v28)
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
        PB::Base::~Base((PB::Base *)&v40);
      }
      else
      {
        telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCICreateRequest>((uint64_t)a1, *a2);
      }
      goto LABEL_27;
    }
  }
}

void sub_20DA97C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCICreateRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(telephonytransport::PCICreateResponse *__hidden);
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = off_24C80B420;
  v5 = v2;
  *(_QWORD *)((char *)&v6 + 4) = 0x200000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>(a1, (PB::Base *)&v4);
  v3 = v5;
  v4 = off_24C80B420;
  v5 = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base((PB::Base *)&v4);
}

void sub_20DA97D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCICreateResponse::~PCICreateResponse((telephonytransport::PCICreateResponse *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 2u, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFreeRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void (**v14)(telephonytransport::PCIFreeResponse *__hidden);
  uint64_t v15;
  uint64_t v16;

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
      {
        if (((*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v7 + 24))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 8) + 16)) & 1) != 0)
        {
          v16 = 0;
          v8 = *(_QWORD *)(*a2 + 8);
          *(_QWORD *)(*a2 + 8) = 0;
          v14 = off_24C80B490;
          v15 = v8;
          BYTE4(v16) = 1;
        }
        else
        {
          v10 = *a2;
          v16 = 0x100000001;
          v11 = *(_QWORD *)(v10 + 8);
          *(_QWORD *)(v10 + 8) = 0;
          v14 = off_24C80B490;
          v15 = v11;
        }
        telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFreeResponse>(a1, (PB::Base *)&v14);
        v9 = v15;
        v14 = off_24C80B490;
        v15 = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
        PB::Base::~Base((PB::Base *)&v14);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA9800C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  telephonytransport::PCIFreeResponse::~PCIFreeResponse((telephonytransport::PCIFreeResponse *)va1);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFreeResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xAu, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  void *v7;
  uint64_t v8;
  PB::Data *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void (**v12)(telephonytransport::PCIReadResponse *__hidden);
  PB::Data *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[5];

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    __p[4] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(void **)(a1 + 48);
      __p[3] = v7;
      if (v7)
      {
        memset(__p, 170, 24);
        std::vector<unsigned char>::vector(__p, *(unsigned int *)(*a2 + 16));
        v16 = 0;
        if (((*(uint64_t (**)(void *, _QWORD, _QWORD, _QWORD, void *, uint64_t *))(*(_QWORD *)v7 + 32))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 8) + 16), *(unsigned int *)(*a2 + 16), *(unsigned int *)(*a2 + 20), __p[0], &v16) & 1) != 0)
        {
          v12 = off_24C80B3B0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v8 = *(_QWORD *)(*a2 + 8);
          *(_QWORD *)(*a2 + 8) = 0;
          v14 = v8;
          BYTE4(v15) = 1;
          v9 = (PB::Data *)operator new(0x10uLL);
          *(_QWORD *)v9 = 0;
          *((_QWORD *)v9 + 1) = 0;
          v13 = v9;
          PB::Data::assign(v9, (const unsigned __int8 *)__p[0], (const unsigned __int8 *)__p[0] + v16);
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(a1, (PB::Base *)&v12);
          telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)&v12);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRequest>(a1, *a2);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA982D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  uint64_t v15;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v15 - 48);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[4];

  v3[0] = off_24C80B3B0;
  v3[1] = 0;
  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v3[2] = v2;
  v3[3] = 0x100000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v3);
}

void sub_20DA9836C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 4u, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIWriteRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void (**v13)(telephonytransport::PCIWriteResponse *__hidden);
  uint64_t v14;
  int v15;
  _BYTE v16[12];
  _QWORD v17[3];

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    v17[2] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      v17[1] = v7;
      if (v7)
      {
        v17[0] = 0xAAAAAAAAAAAAAAAALL;
        if (((*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD *))(*(_QWORD *)v7 + 48))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 16) + 16), **(_QWORD **)(*a2 + 8), *(_QWORD *)(*(_QWORD *)(*a2 + 8) + 8), *(unsigned int *)(*a2 + 24), v17) & 1) != 0)
        {
          *(_QWORD *)&v16[4] = 0xAAAAAAAAAAAAAAAALL;
          v8 = *a2;
          *(_QWORD *)v16 = 0x300000000;
          v9 = *(_QWORD *)(v8 + 16);
          *(_QWORD *)(v8 + 16) = 0;
          v13 = off_24C80B570;
          v14 = v9;
          v15 = v17[0];
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(a1, (PB::Base *)&v13);
          v10 = v14;
          v13 = off_24C80B570;
          v14 = 0;
          if (v10)
            (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
          PB::Base::~Base((PB::Base *)&v13);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIWriteRequest>(a1, *a2);
        }
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA98600(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)va);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIWriteRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(telephonytransport::PCIWriteResponse *__hidden);
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v2 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v4 = off_24C80B570;
  v5 = v2;
  *(_QWORD *)((char *)&v6 + 4) = 0x200000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(a1, (PB::Base *)&v4);
  v3 = v5;
  v4 = off_24C80B570;
  v5 = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base((PB::Base *)&v4);
}

void sub_20DA98698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 8u, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCISendImageRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void (**v13)(telephonytransport::PCISendImageResponse *__hidden);
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  _QWORD v19[3];

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    v19[2] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      v19[1] = v7;
      if (v7)
      {
        v19[0] = 0xAAAAAAAAAAAAAAAALL;
        v18 = -1431655766;
        if (((*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD *, int *))(*(_QWORD *)v7 + 56))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 16) + 16), **(_QWORD **)(*a2 + 8), *(_QWORD *)(*(_QWORD *)(*a2 + 8) + 8), *(unsigned int *)(*a2 + 24), v19, &v18) & 1) != 0)
        {
          v8 = *a2;
          v17 = 0x700000000;
          v9 = *(_QWORD *)(v8 + 16);
          *(_QWORD *)(v8 + 16) = 0;
          v13 = off_24C80B1B8;
          v14 = v9;
          v15 = v19[0];
          v16 = v18;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(a1, (PB::Base *)&v13);
          v10 = v14;
          v13 = off_24C80B1B8;
          v14 = 0;
          if (v10)
            (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
          PB::Base::~Base((PB::Base *)&v13);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCISendImageRequest>(a1, *a2);
        }
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA98934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)&a9);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCISendImageRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(telephonytransport::PCISendImageResponse *__hidden);
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v6 = 0xAAAAAAAAAAAAAAAALL;
  v2 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v4 = off_24C80B1B8;
  v5 = v2;
  v7 = 0x400000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(a1, (PB::Base *)&v4);
  v3 = v5;
  v4 = off_24C80B1B8;
  v5 = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base((PB::Base *)&v4);
}

void sub_20DA989CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xCu, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  void *v7;
  uint64_t v8;
  PB::Data *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void (**v12)(telephonytransport::PCIReadRegisterResponse *__hidden);
  PB::Data *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[5];

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    __p[4] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(void **)(a1 + 48);
      __p[3] = v7;
      if (v7)
      {
        memset(__p, 170, 24);
        std::vector<unsigned char>::vector(__p, *(unsigned int *)(*a2 + 16));
        v16 = 0;
        if (((*(uint64_t (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, void *, uint64_t *))(*(_QWORD *)v7 + 40))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 8) + 16), *(unsigned int *)(*a2 + 24), *(unsigned int *)(*a2 + 16), *(unsigned int *)(*a2 + 20), __p[0], &v16) & 1) != 0)
        {
          v12 = off_24C80B228;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v8 = *(_QWORD *)(*a2 + 8);
          *(_QWORD *)(*a2 + 8) = 0;
          v14 = v8;
          BYTE4(v15) = 1;
          v9 = (PB::Data *)operator new(0x10uLL);
          *(_QWORD *)v9 = 0;
          *((_QWORD *)v9 + 1) = 0;
          v13 = v9;
          PB::Data::assign(v9, (const unsigned __int8 *)__p[0], (const unsigned __int8 *)__p[0] + v16);
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(a1, (PB::Base *)&v12);
          telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)&v12);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(a1, *a2);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA98C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  uint64_t v15;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v15 - 48);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[4];

  v3[0] = off_24C80B228;
  v3[1] = 0;
  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v3[2] = v2;
  v3[3] = 0x100000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v3);
}

void sub_20DA98D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xEu, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIUnblockReadRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void (**v14)(telephonytransport::PCIUnblockReadResponse *__hidden);
  uint64_t v15;
  uint64_t v16;

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
      {
        if (((*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v7 + 64))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 8) + 16)) & 1) != 0)
        {
          v16 = 0;
          v8 = *(_QWORD *)(*a2 + 8);
          *(_QWORD *)(*a2 + 8) = 0;
          v14 = off_24C80B1F0;
          v15 = v8;
          BYTE4(v16) = 1;
        }
        else
        {
          v10 = *a2;
          v16 = 0x100000001;
          v11 = *(_QWORD *)(v10 + 8);
          *(_QWORD *)(v10 + 8) = 0;
          v14 = off_24C80B1F0;
          v15 = v11;
        }
        telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIUnblockReadResponse>(a1, (PB::Base *)&v14);
        v9 = v15;
        v14 = off_24C80B1F0;
        v15 = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
        PB::Base::~Base((PB::Base *)&v14);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA98FBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)va1);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIUnblockReadResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0x10u, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFlushReadRequest>(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void (**v14)(telephonytransport::PCIFlushReadResponse *__hidden);
  uint64_t v15;
  uint64_t v16;

  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
      {
        if (((*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v7 + 72))(v7, *(unsigned int *)(*(_QWORD *)(*a2 + 8) + 16)) & 1) != 0)
        {
          v16 = 0;
          v8 = *(_QWORD *)(*a2 + 8);
          *(_QWORD *)(*a2 + 8) = 0;
          v14 = off_24C80B180;
          v15 = v8;
          BYTE4(v16) = 1;
        }
        else
        {
          v10 = *a2;
          v16 = 0x100000001;
          v11 = *(_QWORD *)(v10 + 8);
          *(_QWORD *)(v10 + 8) = 0;
          v14 = off_24C80B180;
          v15 = v11;
        }
        telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFlushReadResponse>(a1, (PB::Base *)&v14);
        v9 = v15;
        v14 = off_24C80B180;
        v15 = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
        PB::Base::~Base((PB::Base *)&v14);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_20DA99270(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)va1);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFlushReadResponse>(uint64_t a1, PB::Base *a2)
{
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0x12u, a2) & 1) == 0)
  {
    v4 = *(NSObject ***)(a1 + 24);
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
      if (v13 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = *(_QWORD *)(*((_QWORD *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v13 < 0)
        operator delete(__p[0]);
    }
  }
}

void telephonytransport::PCIServiceTransport::handleMessage(telephonytransport::PCIServiceTransport *this, unsigned int a2, unsigned __int8 *a3, void *a4)
{
  unsigned int v4;
  NSObject **v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  unint64_t v13;
  void **v14;
  NSObject **v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  _QWORD *v21;
  char *v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  NSObject **v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  _QWORD *v33;
  char *v34;
  _QWORD *v35;
  __int128 v36;
  uint64_t v37;
  char v38;
  NSObject **v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  NSObject *v43;
  unint64_t v44;
  _QWORD *v45;
  char *v46;
  _QWORD *v47;
  __int128 v48;
  uint64_t v49;
  char v50;
  NSObject **v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  NSObject *v55;
  unint64_t v56;
  _QWORD *v57;
  char *v58;
  _QWORD *v59;
  __int128 v60;
  uint64_t v61;
  char v62;
  NSObject **v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  NSObject *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  _QWORD *v70;
  _QWORD *v71;
  __int128 v72;
  uint64_t v73;
  char v74;
  NSObject **v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  NSObject *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  _QWORD *v82;
  _QWORD *v83;
  __int128 v84;
  uint64_t v85;
  char v86;
  NSObject **v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  NSObject *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  _QWORD *v94;
  _QWORD *v95;
  __int128 v96;
  uint64_t v97;
  char v98;
  NSObject **v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  NSObject *v103;
  unint64_t v104;
  _QWORD *v105;
  char *v106;
  _QWORD *v107;
  __int128 v108;
  uint64_t v109;
  char v110;
  NSObject **v111;
  std::__shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  NSObject *v115;
  unint64_t v116;
  NSObject **v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  unint64_t v121;
  NSObject **v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t v126;
  NSObject **v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  unint64_t v131;
  NSObject **v132;
  std::__shared_weak_count *v133;
  unint64_t *v134;
  unint64_t v135;
  unint64_t v136;
  NSObject **v137;
  std::__shared_weak_count *v138;
  unint64_t *v139;
  unint64_t v140;
  unint64_t v141;
  NSObject **v142;
  std::__shared_weak_count *v143;
  unint64_t *v144;
  unint64_t v145;
  unint64_t v146;
  NSObject **v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  unint64_t v151;
  NSObject **v152;
  std::__shared_weak_count *v153;
  unint64_t *v154;
  unint64_t v155;
  unint64_t v156;
  NSObject **v157;
  std::__shared_weak_count *v158;
  unint64_t *v159;
  unint64_t v160;
  unint64_t v161;
  NSObject **v162;
  std::__shared_weak_count *v163;
  unint64_t *v164;
  unint64_t v165;
  unint64_t v166;
  NSObject **v167;
  std::__shared_weak_count *v168;
  unint64_t *v169;
  unint64_t v170;
  unint64_t v171;
  NSObject **v172;
  std::__shared_weak_count *v173;
  unint64_t *v174;
  unint64_t v175;
  unint64_t v176;
  NSObject **v177;
  std::__shared_weak_count *v178;
  unint64_t *v179;
  unint64_t v180;
  unint64_t v181;
  NSObject **v182;
  std::__shared_weak_count *v183;
  unint64_t *v184;
  unint64_t v185;
  unint64_t v186;
  NSObject **v187;
  std::__shared_weak_count *v188;
  unint64_t *v189;
  unint64_t v190;
  unint64_t v191;
  NSObject **v192;
  std::__shared_weak_count *v193;
  unint64_t *v194;
  unint64_t v195;
  unint64_t v196;
  void **v197;
  const char *v198;
  void **v199;
  const char *v200;
  void **v201;
  const char *v202;
  void **v203;
  const char *v204;
  void **v205;
  const char *v206;
  void **v207;
  const char *v208;
  void **v209;
  const char *v210;
  void **v211;
  const char *v212;
  void **v213;
  void **v214;
  void **v215;
  void **v216;
  void **v217;
  void **v218;
  void **v219;
  void **v220;
  NSObject **v221;
  std::__shared_weak_count *v222;
  unint64_t *v223;
  unint64_t v224;
  unint64_t v225;
  NSObject **v226;
  std::__shared_weak_count *v227;
  unint64_t *v228;
  unint64_t v229;
  unint64_t v230;
  NSObject **v231;
  std::__shared_weak_count *v232;
  unint64_t *v233;
  unint64_t v234;
  unint64_t v235;
  NSObject **v236;
  std::__shared_weak_count *v237;
  unint64_t *v238;
  unint64_t v239;
  unint64_t v240;
  NSObject **v241;
  std::__shared_weak_count *v242;
  unint64_t *v243;
  unint64_t v244;
  unint64_t v245;
  NSObject **v246;
  std::__shared_weak_count *v247;
  unint64_t *v248;
  unint64_t v249;
  unint64_t v250;
  NSObject **v251;
  std::__shared_weak_count *v252;
  unint64_t *v253;
  unint64_t v254;
  unint64_t v255;
  NSObject **v256;
  std::__shared_weak_count *v257;
  unint64_t *v258;
  unint64_t v259;
  unint64_t v260;
  os_log_t **v261;
  os_log_t **v262;
  os_log_t **v263;
  os_log_t **v264;
  os_log_t **v265;
  os_log_t **v266;
  os_log_t **v267;
  os_log_t **v268;
  void **v269;
  void **v270;
  void **v271;
  void **v272;
  void **v273;
  void **v274;
  void **v275;
  void **v276;
  void **v277;
  std::__shared_weak_count *v278;
  unint64_t *v279;
  unint64_t v280;
  uint64_t v281;
  os_log_t *v282;
  std::__shared_weak_count *v283;
  unint64_t *v284;
  unint64_t v285;
  char v286;
  NSObject *v287;
  void **v288;
  std::__shared_weak_count *v289;
  unint64_t *v290;
  unint64_t v291;
  void **v292;
  void **v293;
  void **v294;
  void **v295;
  void **v296;
  char v297;
  unint64_t *v298;
  unint64_t v299;
  uint64_t v300;
  uint64_t v301;
  _QWORD *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void **v306;
  std::__shared_weak_count *v307;
  unint64_t *v308;
  unint64_t v309;
  uint64_t v310;
  os_log_t *v311;
  std::__shared_weak_count *v312;
  unint64_t *v313;
  unint64_t v314;
  char v315;
  NSObject *v316;
  void **v317;
  unint64_t *v318;
  char v319;
  unint64_t *v320;
  unint64_t v321;
  void **v322;
  std::__shared_weak_count *v323;
  unint64_t *v324;
  unint64_t v325;
  uint64_t v326;
  os_log_t *v327;
  std::__shared_weak_count *v328;
  unint64_t *v329;
  unint64_t v330;
  NSObject *v331;
  void **v332;
  unint64_t *v333;
  char v334;
  unint64_t *v335;
  unint64_t v336;
  void **v337;
  std::__shared_weak_count *v338;
  unint64_t *v339;
  unint64_t v340;
  uint64_t v341;
  os_log_t *v342;
  std::__shared_weak_count *v343;
  unint64_t *v344;
  unint64_t v345;
  NSObject *v346;
  void **v347;
  unint64_t *v348;
  char v349;
  unint64_t *v350;
  unint64_t v351;
  void **v352;
  std::__shared_weak_count *v353;
  unint64_t *v354;
  unint64_t v355;
  std::__shared_weak_count *v356;
  unint64_t *v357;
  unint64_t v358;
  unint64_t v359;
  __int128 v360;
  _QWORD *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t *v365;
  void **v366;
  std::__shared_weak_count *v367;
  unint64_t *v368;
  unint64_t v369;
  std::__shared_weak_count *v370;
  unint64_t *v371;
  unint64_t v372;
  unint64_t v373;
  __int128 v374;
  _QWORD *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unint64_t *v379;
  void **v380;
  std::__shared_weak_count *v381;
  unint64_t *v382;
  unint64_t v383;
  std::__shared_weak_count *v384;
  unint64_t *v385;
  unint64_t v386;
  unint64_t v387;
  __int128 v388;
  _QWORD *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  unint64_t *v393;
  void **v394;
  std::__shared_weak_count *v395;
  unint64_t *v396;
  unint64_t v397;
  uint64_t v398;
  os_log_t *v399;
  std::__shared_weak_count *v400;
  unint64_t *v401;
  unint64_t v402;
  char v403;
  NSObject *v404;
  void **v405;
  unint64_t *v406;
  void **v407;
  void **v408;
  char v409;
  unint64_t *v410;
  unint64_t v411;
  void **v412;
  uint64_t v413;
  void **v414;
  void **v415;
  void **v416;
  __int128 v417;
  os_log_t *v418;
  std::__shared_weak_count *v419;
  _BYTE buf[24];
  void *__p[2];
  __int128 v422;
  uint64_t v423;

  v423 = *MEMORY[0x24BDAC8D0];
  if (a2 - 1 >= 0x12)
    v4 = 0;
  else
    v4 = a2;
  switch(v4)
  {
    case 0u:
      v15 = (NSObject **)*((_QWORD *)this + 3);
      v16 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
      if (v16)
      {
        p_shared_owners = (unint64_t *)&v16->__shared_owners_;
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
        v19 = *v15;
        do
          v20 = __ldaxr(p_shared_owners);
        while (__stlxr(v20 - 1, p_shared_owners));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      else
      {
        v19 = *v15;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p[0]) = 134217984;
        *(void **)((char *)__p + 4) = a4;
        _os_log_error_impl(&dword_20DA91000, v19, OS_LOG_TYPE_ERROR, "Skipping Unknown message type of length: %zu", (uint8_t *)__p, 0xCu);
      }
      return;
    case 1u:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = operator new(0x48uLL);
      v21[1] = 0;
      v21[2] = 0;
      *v21 = off_24C809F80;
      v21[3] = off_24C80B378;
      v22 = (char *)(v21 + 3);
      v21[4] = 0;
      *((_DWORD *)v21 + 16) = 0;
      v418 = (os_log_t *)(v21 + 3);
      v419 = (std::__shared_weak_count *)v21;
      if (!a4)
        goto LABEL_114;
      v23 = v21;
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v24;
      v422 = v24;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, void **))(*(_QWORD *)v22 + 16))(v22, __p) & 1) == 0)
      {
        v157 = (NSObject **)*((_QWORD *)this + 3);
        v158 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v158)
        {
          v159 = (unint64_t *)&v158->__shared_owners_;
          do
            v160 = __ldxr(v159);
          while (__stxr(v160 + 1, v159));
          v31 = *v157;
          do
            v161 = __ldaxr(v159);
          while (__stlxr(v161 - 1, v159));
          if (!v161)
          {
            ((void (*)(std::__shared_weak_count *))v158->__on_zero_shared)(v158);
            std::__shared_weak_count::__release_weak(v158);
          }
        }
        else
        {
          v31 = *v157;
        }
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_453;
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v213 = __p;
        else
          v213 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v213;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v198 = "Failed to deserialize message. MessageType: %s, length: %zu";
        goto LABEL_451;
      }
      v25 = v23[4];
      if (!v25)
      {
LABEL_114:
        v117 = (NSObject **)*((_QWORD *)this + 3);
        v118 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v118)
        {
          v119 = (unint64_t *)&v118->__shared_owners_;
          do
            v120 = __ldxr(v119);
          while (__stxr(v120 + 1, v119));
          v31 = *v117;
          do
            v121 = __ldaxr(v119);
          while (__stlxr(v121 - 1, v119));
          if (!v121)
          {
            ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
            std::__shared_weak_count::__release_weak(v118);
          }
        }
        else
        {
          v31 = *v117;
        }
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_453;
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v197 = __p;
        else
          v197 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v197;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v198 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_451;
      }
      v26 = *(_BYTE *)(v25 + 20);
      if ((v26 & 1) != 0)
      {
        if ((v26 & 2) != 0)
        {
          *(_QWORD *)&v417 = v22;
          *((_QWORD *)&v417 + 1) = v23;
          v261 = &v418;
          goto LABEL_454;
        }
        v221 = (NSObject **)*((_QWORD *)this + 3);
        v222 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v222)
        {
          v223 = (unint64_t *)&v222->__shared_owners_;
          do
            v224 = __ldxr(v223);
          while (__stxr(v224 + 1, v223));
          v31 = *v221;
          do
            v225 = __ldaxr(v223);
          while (__stlxr(v225 - 1, v223));
          if (!v225)
          {
            ((void (*)(std::__shared_weak_count *))v222->__on_zero_shared)(v222);
            std::__shared_weak_count::__release_weak(v222);
          }
        }
        else
        {
          v31 = *v221;
        }
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_453;
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v277 = __p;
        else
          v277 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v277;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v198 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
LABEL_451:
        _os_log_error_impl(&dword_20DA91000, v31, OS_LOG_TYPE_ERROR, v198, buf, 0x16u);
        if (SBYTE7(v422) < 0)
          operator delete(__p[0]);
        goto LABEL_453;
      }
      v27 = (NSObject **)*((_QWORD *)this + 3);
      v28 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
      if (v28)
      {
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
        v31 = *v27;
        do
          v32 = __ldaxr(v29);
        while (__stlxr(v32 - 1, v29));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      else
      {
        v31 = *v27;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v269 = __p;
        else
          v269 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v269;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v198 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_451;
      }
LABEL_453:
      v261 = (os_log_t **)&v417;
LABEL_454:
      *v261 = 0;
      v261[1] = 0;
      v278 = v419;
      if (v419)
      {
        v279 = (unint64_t *)&v419->__shared_owners_;
        do
          v280 = __ldaxr(v279);
        while (__stlxr(v280 - 1, v279));
        if (!v280)
        {
          ((void (*)(std::__shared_weak_count *))v278->__on_zero_shared)(v278);
          std::__shared_weak_count::__release_weak(v278);
        }
      }
      v281 = v417;
      if ((_QWORD)v417)
      {
        v282 = (os_log_t *)*((_QWORD *)this + 3);
        v283 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        v418 = v282;
        v419 = v283;
        if (v283)
        {
          v284 = (unint64_t *)&v283->__shared_owners_;
          do
            v285 = __ldxr(v284);
          while (__stxr(v285 + 1, v284));
        }
        v286 = *(_BYTE *)(v281 + 40);
        if ((v286 & 0x10) != 0)
        {
          if ((v286 & 2) != 0)
          {
            if ((v286 & 4) != 0)
            {
              if ((v286 & 8) != 0)
              {
                if ((v286 & 1) != 0)
                {
                  if ((v286 & 0x20) != 0)
                  {
                    v297 = 1;
                    if (v283)
                      goto LABEL_506;
                    goto LABEL_510;
                  }
                  v287 = *v282;
                  if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
                  {
LABEL_505:
                    v297 = 0;
                    if (v283)
                    {
LABEL_506:
                      v298 = (unint64_t *)&v283->__shared_owners_;
                      do
                        v299 = __ldaxr(v298);
                      while (__stlxr(v299 - 1, v298));
                      if (!v299)
                      {
                        ((void (*)(std::__shared_weak_count *))v283->__on_zero_shared)(v283);
                        std::__shared_weak_count::__release_weak(v283);
                      }
                    }
LABEL_510:
                    if ((v297 & 1) != 0)
                    {
                      v301 = *((_QWORD *)&v417 + 1);
                      v300 = v417;
                      *(_QWORD *)buf = this;
                      *(_OWORD *)&buf[8] = v417;
                      v417 = 0uLL;
                      *((_QWORD *)&v422 + 1) = 0;
                      v302 = operator new(0x20uLL);
                      *v302 = off_24C80A060;
                    }
                    else
                    {
                      v301 = *((_QWORD *)&v417 + 1);
                      v300 = v417;
                      *(_QWORD *)buf = this;
                      *(_OWORD *)&buf[8] = v417;
                      v417 = 0uLL;
                      *((_QWORD *)&v422 + 1) = 0;
                      v302 = operator new(0x20uLL);
                      *v302 = off_24C809FD0;
                    }
                    goto LABEL_761;
                  }
                  std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                  if ((SBYTE7(v422) & 0x80u) == 0)
                    v296 = __p;
                  else
                    v296 = (void **)__p[0];
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "SizeReadIO";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = v296;
                }
                else
                {
                  v287 = *v282;
                  if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
                    goto LABEL_505;
                  std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                  if ((SBYTE7(v422) & 0x80u) == 0)
                    v295 = __p;
                  else
                    v295 = (void **)__p[0];
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CreateTimeOutMs";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = v295;
                }
              }
              else
              {
                v287 = *v282;
                if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
                  goto LABEL_505;
                std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v294 = __p;
                else
                  v294 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "OpenRetryCount";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v294;
              }
            }
            else
            {
              v287 = *v282;
              if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
                goto LABEL_505;
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v293 = __p;
              else
                v293 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "NumReadIO";
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v293;
            }
          }
          else
          {
            v287 = *v282;
            if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
              goto LABEL_505;
            std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
            if ((SBYTE7(v422) & 0x80u) == 0)
              v292 = __p;
            else
              v292 = (void **)__p[0];
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "Flags";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v292;
          }
        }
        else
        {
          v287 = *v282;
          if (!os_log_type_enabled(*v282, OS_LOG_TYPE_ERROR))
            goto LABEL_505;
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v288 = __p;
          else
            v288 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "PciTransportInterface";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v288;
        }
        _os_log_error_impl(&dword_20DA91000, v287, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
        if (SBYTE7(v422) < 0)
          operator delete(__p[0]);
        goto LABEL_505;
      }
      v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
      if (*((_QWORD *)&v417 + 1))
      {
        v290 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
        do
          v291 = __ldaxr(v290);
        while (__stlxr(v291 - 1, v290));
LABEL_738:
        if (!v291)
        {
          ((void (*)(std::__shared_weak_count *))v289->__on_zero_shared)(v289);
          std::__shared_weak_count::__release_weak(v289);
        }
      }
      return;
    case 2u:
    case 4u:
    case 5u:
    case 6u:
    case 8u:
    case 0xAu:
    case 0xCu:
    case 0xEu:
    case 0x10u:
    case 0x12u:
      v8 = (NSObject **)*((_QWORD *)this + 3);
      v9 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
      if (v9)
      {
        v10 = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
        v12 = *v8;
        do
          v13 = __ldaxr(v10);
        while (__stlxr(v13 - 1, v10));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      else
      {
        v12 = *v8;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        telephonytransport::toString(v4, __p);
        v14 = (SBYTE7(v422) & 0x80u) == 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        _os_log_error_impl(&dword_20DA91000, v12, OS_LOG_TYPE_ERROR, "Ignoring unsupported message type: %s, length: %zu", buf, 0x16u);
        if (SBYTE7(v422) < 0)
          operator delete(__p[0]);
      }
      return;
    case 3u:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = operator new(0x38uLL);
      v33[1] = 0;
      v33[2] = 0;
      *v33 = off_24C80A0E0;
      v33[3] = off_24C80B458;
      v34 = (char *)(v33 + 3);
      v33[4] = 0;
      *((_DWORD *)v33 + 12) = 0;
      v418 = (os_log_t *)(v33 + 3);
      v419 = (std::__shared_weak_count *)v33;
      if (!a4)
        goto LABEL_121;
      v35 = v33;
      *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v36;
      v422 = v36;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, void **))(*(_QWORD *)v34 + 16))(v34, __p) & 1) != 0)
      {
        v37 = v35[4];
        if (v37)
        {
          v38 = *(_BYTE *)(v37 + 20);
          if ((v38 & 1) == 0)
          {
            v39 = (NSObject **)*((_QWORD *)this + 3);
            v40 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v40)
            {
              v41 = (unint64_t *)&v40->__shared_owners_;
              do
                v42 = __ldxr(v41);
              while (__stxr(v42 + 1, v41));
              v43 = *v39;
              do
                v44 = __ldaxr(v41);
              while (__stlxr(v44 - 1, v41));
              if (!v44)
              {
                ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                std::__shared_weak_count::__release_weak(v40);
              }
            }
            else
            {
              v43 = *v39;
            }
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v270 = __p;
              else
                v270 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v270;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v200 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_519;
            }
LABEL_521:
            v262 = (os_log_t **)&v417;
LABEL_522:
            *v262 = 0;
            v262[1] = 0;
            v307 = v419;
            if (v419)
            {
              v308 = (unint64_t *)&v419->__shared_owners_;
              do
                v309 = __ldaxr(v308);
              while (__stlxr(v309 - 1, v308));
              if (!v309)
              {
                ((void (*)(std::__shared_weak_count *))v307->__on_zero_shared)(v307);
                std::__shared_weak_count::__release_weak(v307);
              }
            }
            v310 = v417;
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v318 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v318);
              while (__stlxr(v291 - 1, v318));
              goto LABEL_738;
            }
            v311 = (os_log_t *)*((_QWORD *)this + 3);
            v312 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            v418 = v311;
            v419 = v312;
            if (v312)
            {
              v313 = (unint64_t *)&v312->__shared_owners_;
              do
                v314 = __ldxr(v313);
              while (__stxr(v314 + 1, v313));
            }
            v315 = *(_BYTE *)(v310 + 24);
            if ((v315 & 1) != 0)
            {
              if ((v315 & 2) != 0)
              {
                v319 = 1;
LABEL_545:
                if (v312)
                {
                  v320 = (unint64_t *)&v312->__shared_owners_;
                  do
                    v321 = __ldaxr(v320);
                  while (__stlxr(v321 - 1, v320));
                  if (!v321)
                  {
                    ((void (*)(std::__shared_weak_count *))v312->__on_zero_shared)(v312);
                    std::__shared_weak_count::__release_weak(v312);
                  }
                }
                if ((v319 & 1) != 0)
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A1B0;
                }
                else
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A130;
                }
                goto LABEL_761;
              }
              v316 = *v311;
              if (os_log_type_enabled(*v311, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v416 = __p;
                else
                  v416 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "TimeoutMs";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v416;
LABEL_789:
                _os_log_error_impl(&dword_20DA91000, v316, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
                if (SBYTE7(v422) < 0)
                  operator delete(__p[0]);
              }
            }
            else
            {
              v316 = *v311;
              if (os_log_type_enabled(*v311, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v317 = __p;
                else
                  v317 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "BytesToRead";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v317;
                goto LABEL_789;
              }
            }
            v319 = 0;
            goto LABEL_545;
          }
          if ((v38 & 2) != 0)
          {
            *(_QWORD *)&v417 = v34;
            *((_QWORD *)&v417 + 1) = v35;
            v262 = &v418;
            goto LABEL_522;
          }
          v226 = (NSObject **)*((_QWORD *)this + 3);
          v227 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v227)
          {
            v228 = (unint64_t *)&v227->__shared_owners_;
            do
              v229 = __ldxr(v228);
            while (__stxr(v229 + 1, v228));
            v43 = *v226;
            do
              v230 = __ldaxr(v228);
            while (__stlxr(v230 - 1, v228));
            if (!v230)
            {
              ((void (*)(std::__shared_weak_count *))v227->__on_zero_shared)(v227);
              std::__shared_weak_count::__release_weak(v227);
            }
          }
          else
          {
            v43 = *v226;
          }
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            goto LABEL_521;
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v306 = __p;
          else
            v306 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v306;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v200 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_121:
          v122 = (NSObject **)*((_QWORD *)this + 3);
          v123 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v123)
          {
            v124 = (unint64_t *)&v123->__shared_owners_;
            do
              v125 = __ldxr(v124);
            while (__stxr(v125 + 1, v124));
            v43 = *v122;
            do
              v126 = __ldaxr(v124);
            while (__stlxr(v126 - 1, v124));
            if (!v126)
            {
              ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
              std::__shared_weak_count::__release_weak(v123);
            }
          }
          else
          {
            v43 = *v122;
          }
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            goto LABEL_521;
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v199 = __p;
          else
            v199 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v199;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v200 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v162 = (NSObject **)*((_QWORD *)this + 3);
        v163 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v163)
        {
          v164 = (unint64_t *)&v163->__shared_owners_;
          do
            v165 = __ldxr(v164);
          while (__stxr(v165 + 1, v164));
          v43 = *v162;
          do
            v166 = __ldaxr(v164);
          while (__stlxr(v166 - 1, v164));
          if (!v166)
          {
            ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
            std::__shared_weak_count::__release_weak(v163);
          }
        }
        else
        {
          v43 = *v162;
        }
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_521;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v214 = __p;
        else
          v214 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v214;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v200 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_519:
      _os_log_error_impl(&dword_20DA91000, v43, OS_LOG_TYPE_ERROR, v200, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_521;
    case 7u:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v45 = operator new(0x38uLL);
      v45[2] = 0;
      v45[3] = off_24C80B4C8;
      v46 = (char *)(v45 + 3);
      *v45 = off_24C80A230;
      v45[1] = 0;
      *((_DWORD *)v45 + 13) = 0;
      v45[4] = 0;
      v45[5] = 0;
      v418 = (os_log_t *)(v45 + 3);
      v419 = (std::__shared_weak_count *)v45;
      if (!a4)
        goto LABEL_128;
      v47 = v45;
      *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v48;
      v422 = v48;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, void **))(*(_QWORD *)v46 + 16))(v46, __p) & 1) != 0)
      {
        v49 = v47[5];
        if (v49)
        {
          v50 = *(_BYTE *)(v49 + 20);
          if ((v50 & 1) == 0)
          {
            v51 = (NSObject **)*((_QWORD *)this + 3);
            v52 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v52)
            {
              v53 = (unint64_t *)&v52->__shared_owners_;
              do
                v54 = __ldxr(v53);
              while (__stxr(v54 + 1, v53));
              v55 = *v51;
              do
                v56 = __ldaxr(v53);
              while (__stlxr(v56 - 1, v53));
              if (!v56)
              {
                ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
                std::__shared_weak_count::__release_weak(v52);
              }
            }
            else
            {
              v55 = *v51;
            }
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v271 = __p;
              else
                v271 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v271;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v202 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_559;
            }
LABEL_561:
            v263 = (os_log_t **)&v417;
LABEL_562:
            *v263 = 0;
            v263[1] = 0;
            v323 = v419;
            if (v419)
            {
              v324 = (unint64_t *)&v419->__shared_owners_;
              do
                v325 = __ldaxr(v324);
              while (__stlxr(v325 - 1, v324));
              if (!v325)
              {
                ((void (*)(std::__shared_weak_count *))v323->__on_zero_shared)(v323);
                std::__shared_weak_count::__release_weak(v323);
              }
            }
            v326 = v417;
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v333 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v333);
              while (__stlxr(v291 - 1, v333));
              goto LABEL_738;
            }
            v327 = (os_log_t *)*((_QWORD *)this + 3);
            v328 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            v418 = v327;
            v419 = v328;
            if (v328)
            {
              v329 = (unint64_t *)&v328->__shared_owners_;
              do
                v330 = __ldxr(v329);
              while (__stxr(v330 + 1, v329));
            }
            if (*(_QWORD *)(v326 + 8))
            {
              if ((*(_BYTE *)(v326 + 28) & 1) != 0)
              {
                v334 = 1;
LABEL_585:
                if (v328)
                {
                  v335 = (unint64_t *)&v328->__shared_owners_;
                  do
                    v336 = __ldaxr(v335);
                  while (__stlxr(v336 - 1, v335));
                  if (!v336)
                  {
                    ((void (*)(std::__shared_weak_count *))v328->__on_zero_shared)(v328);
                    std::__shared_weak_count::__release_weak(v328);
                  }
                }
                if ((v334 & 1) != 0)
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A300;
                }
                else
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A280;
                }
                goto LABEL_761;
              }
              v331 = *v327;
              if (os_log_type_enabled(*v327, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v332 = __p;
                else
                  v332 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "TimeoutMs";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v332;
                goto LABEL_775;
              }
            }
            else
            {
              v331 = *v327;
              if (os_log_type_enabled(*v327, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v414 = __p;
                else
                  v414 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "data";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v414;
LABEL_775:
                _os_log_error_impl(&dword_20DA91000, v331, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
                if (SBYTE7(v422) < 0)
                  operator delete(__p[0]);
              }
            }
            v334 = 0;
            goto LABEL_585;
          }
          if ((v50 & 2) != 0)
          {
            *(_QWORD *)&v417 = v46;
            *((_QWORD *)&v417 + 1) = v47;
            v263 = &v418;
            goto LABEL_562;
          }
          v231 = (NSObject **)*((_QWORD *)this + 3);
          v232 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v232)
          {
            v233 = (unint64_t *)&v232->__shared_owners_;
            do
              v234 = __ldxr(v233);
            while (__stxr(v234 + 1, v233));
            v55 = *v231;
            do
              v235 = __ldaxr(v233);
            while (__stlxr(v235 - 1, v233));
            if (!v235)
            {
              ((void (*)(std::__shared_weak_count *))v232->__on_zero_shared)(v232);
              std::__shared_weak_count::__release_weak(v232);
            }
          }
          else
          {
            v55 = *v231;
          }
          if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            goto LABEL_561;
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v322 = __p;
          else
            v322 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v322;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v202 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_128:
          v127 = (NSObject **)*((_QWORD *)this + 3);
          v128 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v128)
          {
            v129 = (unint64_t *)&v128->__shared_owners_;
            do
              v130 = __ldxr(v129);
            while (__stxr(v130 + 1, v129));
            v55 = *v127;
            do
              v131 = __ldaxr(v129);
            while (__stlxr(v131 - 1, v129));
            if (!v131)
            {
              ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
              std::__shared_weak_count::__release_weak(v128);
            }
          }
          else
          {
            v55 = *v127;
          }
          if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            goto LABEL_561;
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v201 = __p;
          else
            v201 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v201;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v202 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v167 = (NSObject **)*((_QWORD *)this + 3);
        v168 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v168)
        {
          v169 = (unint64_t *)&v168->__shared_owners_;
          do
            v170 = __ldxr(v169);
          while (__stxr(v170 + 1, v169));
          v55 = *v167;
          do
            v171 = __ldaxr(v169);
          while (__stlxr(v171 - 1, v169));
          if (!v171)
          {
            ((void (*)(std::__shared_weak_count *))v168->__on_zero_shared)(v168);
            std::__shared_weak_count::__release_weak(v168);
          }
        }
        else
        {
          v55 = *v167;
        }
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          goto LABEL_561;
        std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v215 = __p;
        else
          v215 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v215;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v202 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_559:
      _os_log_error_impl(&dword_20DA91000, v55, OS_LOG_TYPE_ERROR, v202, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_561;
    case 9u:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v93 = (std::__shared_weak_count *)operator new(0x28uLL);
      v93->__shared_owners_ = 0;
      v93->__shared_weak_owners_ = 0;
      v93->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A380;
      v93[1].__vftable = (std::__shared_weak_count_vtbl *)off_24C80B538;
      v94 = &v93[1].__vftable;
      v93[1].__shared_owners_ = 0;
      v418 = (os_log_t *)&v93[1];
      v419 = v93;
      if (!a4)
        goto LABEL_156;
      v95 = &v93->__vftable;
      *(_QWORD *)&v96 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v96 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v96;
      v422 = v96;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, void **))(*v94 + 16))(v94, __p) & 1) != 0)
      {
        v97 = v95[4];
        if (v97)
        {
          v98 = *(_BYTE *)(v97 + 20);
          if ((v98 & 1) == 0)
          {
            v99 = (NSObject **)*((_QWORD *)this + 3);
            v100 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v100)
            {
              v101 = (unint64_t *)&v100->__shared_owners_;
              do
                v102 = __ldxr(v101);
              while (__stxr(v102 + 1, v101));
              v103 = *v99;
              do
                v104 = __ldaxr(v101);
              while (__stlxr(v104 - 1, v101));
              if (!v104)
              {
                ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
                std::__shared_weak_count::__release_weak(v100);
              }
            }
            else
            {
              v103 = *v99;
            }
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v275 = __p;
              else
                v275 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v275;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v210 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_691;
            }
LABEL_693:
            v267 = (os_log_t **)&v417;
LABEL_694:
            *v267 = 0;
            v267[1] = 0;
            v381 = v419;
            if (v419)
            {
              v382 = (unint64_t *)&v419->__shared_owners_;
              do
                v383 = __ldaxr(v382);
              while (__stlxr(v383 - 1, v382));
              if (!v383)
              {
                ((void (*)(std::__shared_weak_count *))v381->__on_zero_shared)(v381);
                std::__shared_weak_count::__release_weak(v381);
              }
            }
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v393 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v393);
              while (__stlxr(v291 - 1, v393));
              goto LABEL_738;
            }
            v384 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v384)
            {
              v385 = (unint64_t *)&v384->__shared_owners_;
              do
                v386 = __ldxr(v385);
              while (__stxr(v386 + 1, v385));
              do
                v387 = __ldaxr(v385);
              while (__stlxr(v387 - 1, v385));
              if (!v387)
              {
                ((void (*)(std::__shared_weak_count *))v384->__on_zero_shared)(v384);
                std::__shared_weak_count::__release_weak(v384);
              }
            }
            v388 = v417;
            *(_QWORD *)buf = this;
            *(_OWORD *)&buf[8] = v417;
            v417 = 0uLL;
            *((_QWORD *)&v422 + 1) = 0;
            v389 = operator new(0x20uLL);
            *v389 = off_24C80A3D0;
            v389[1] = this;
            *((_OWORD *)v389 + 1) = v388;
            *(_OWORD *)&buf[8] = 0uLL;
            *((_QWORD *)&v422 + 1) = v389;
            telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p, v390, v391, v392);
            goto LABEL_763;
          }
          if ((v98 & 2) != 0)
          {
            *(_QWORD *)&v417 = v94;
            *((_QWORD *)&v417 + 1) = v95;
            v267 = &v418;
            goto LABEL_694;
          }
          v251 = (NSObject **)*((_QWORD *)this + 3);
          v252 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v252)
          {
            v253 = (unint64_t *)&v252->__shared_owners_;
            do
              v254 = __ldxr(v253);
            while (__stxr(v254 + 1, v253));
            v103 = *v251;
            do
              v255 = __ldaxr(v253);
            while (__stlxr(v255 - 1, v253));
            if (!v255)
            {
              ((void (*)(std::__shared_weak_count *))v252->__on_zero_shared)(v252);
              std::__shared_weak_count::__release_weak(v252);
            }
          }
          else
          {
            v103 = *v251;
          }
          if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            goto LABEL_693;
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v380 = __p;
          else
            v380 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v380;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v210 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_156:
          v147 = (NSObject **)*((_QWORD *)this + 3);
          v148 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v148)
          {
            v149 = (unint64_t *)&v148->__shared_owners_;
            do
              v150 = __ldxr(v149);
            while (__stxr(v150 + 1, v149));
            v103 = *v147;
            do
              v151 = __ldaxr(v149);
            while (__stlxr(v151 - 1, v149));
            if (!v151)
            {
              ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
              std::__shared_weak_count::__release_weak(v148);
            }
          }
          else
          {
            v103 = *v147;
          }
          if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            goto LABEL_693;
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v209 = __p;
          else
            v209 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v209;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v210 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v187 = (NSObject **)*((_QWORD *)this + 3);
        v188 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v188)
        {
          v189 = (unint64_t *)&v188->__shared_owners_;
          do
            v190 = __ldxr(v189);
          while (__stxr(v190 + 1, v189));
          v103 = *v187;
          do
            v191 = __ldaxr(v189);
          while (__stlxr(v191 - 1, v189));
          if (!v191)
          {
            ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
            std::__shared_weak_count::__release_weak(v188);
          }
        }
        else
        {
          v103 = *v187;
        }
        if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          goto LABEL_693;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v219 = __p;
        else
          v219 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v219;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v210 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_691:
      _os_log_error_impl(&dword_20DA91000, v103, OS_LOG_TYPE_ERROR, v210, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_693;
    case 0xBu:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v57 = operator new(0x38uLL);
      v57[2] = 0;
      v57[3] = off_24C80B3E8;
      v58 = (char *)(v57 + 3);
      *v57 = off_24C80A450;
      v57[1] = 0;
      *((_DWORD *)v57 + 13) = 0;
      v57[4] = 0;
      v57[5] = 0;
      v418 = (os_log_t *)(v57 + 3);
      v419 = (std::__shared_weak_count *)v57;
      if (!a4)
        goto LABEL_135;
      v59 = v57;
      *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v60;
      v422 = v60;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, void **))(*(_QWORD *)v58 + 16))(v58, __p) & 1) != 0)
      {
        v61 = v59[5];
        if (v61)
        {
          v62 = *(_BYTE *)(v61 + 20);
          if ((v62 & 1) == 0)
          {
            v63 = (NSObject **)*((_QWORD *)this + 3);
            v64 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v64)
            {
              v65 = (unint64_t *)&v64->__shared_owners_;
              do
                v66 = __ldxr(v65);
              while (__stxr(v66 + 1, v65));
              v67 = *v63;
              do
                v68 = __ldaxr(v65);
              while (__stlxr(v68 - 1, v65));
              if (!v68)
              {
                ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
                std::__shared_weak_count::__release_weak(v64);
              }
            }
            else
            {
              v67 = *v63;
            }
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v272 = __p;
              else
                v272 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v272;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v204 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_599;
            }
LABEL_601:
            v264 = (os_log_t **)&v417;
LABEL_602:
            *v264 = 0;
            v264[1] = 0;
            v338 = v419;
            if (v419)
            {
              v339 = (unint64_t *)&v419->__shared_owners_;
              do
                v340 = __ldaxr(v339);
              while (__stlxr(v340 - 1, v339));
              if (!v340)
              {
                ((void (*)(std::__shared_weak_count *))v338->__on_zero_shared)(v338);
                std::__shared_weak_count::__release_weak(v338);
              }
            }
            v341 = v417;
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v348 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v348);
              while (__stlxr(v291 - 1, v348));
              goto LABEL_738;
            }
            v342 = (os_log_t *)*((_QWORD *)this + 3);
            v343 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            v418 = v342;
            v419 = v343;
            if (v343)
            {
              v344 = (unint64_t *)&v343->__shared_owners_;
              do
                v345 = __ldxr(v344);
              while (__stxr(v345 + 1, v344));
            }
            if (*(_QWORD *)(v341 + 8))
            {
              if ((*(_BYTE *)(v341 + 28) & 1) != 0)
              {
                v349 = 1;
LABEL_625:
                if (v343)
                {
                  v350 = (unint64_t *)&v343->__shared_owners_;
                  do
                    v351 = __ldaxr(v350);
                  while (__stlxr(v351 - 1, v350));
                  if (!v351)
                  {
                    ((void (*)(std::__shared_weak_count *))v343->__on_zero_shared)(v343);
                    std::__shared_weak_count::__release_weak(v343);
                  }
                }
                if ((v349 & 1) != 0)
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A520;
                }
                else
                {
                  v301 = *((_QWORD *)&v417 + 1);
                  v300 = v417;
                  *(_QWORD *)buf = this;
                  *(_OWORD *)&buf[8] = v417;
                  v417 = 0uLL;
                  *((_QWORD *)&v422 + 1) = 0;
                  v302 = operator new(0x20uLL);
                  *v302 = off_24C80A4A0;
                }
                goto LABEL_761;
              }
              v346 = *v342;
              if (os_log_type_enabled(*v342, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v347 = __p;
                else
                  v347 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "TimeoutMs";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v347;
                goto LABEL_781;
              }
            }
            else
            {
              v346 = *v342;
              if (os_log_type_enabled(*v342, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v415 = __p;
                else
                  v415 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "data";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v415;
LABEL_781:
                _os_log_error_impl(&dword_20DA91000, v346, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
                if (SBYTE7(v422) < 0)
                  operator delete(__p[0]);
              }
            }
            v349 = 0;
            goto LABEL_625;
          }
          if ((v62 & 2) != 0)
          {
            *(_QWORD *)&v417 = v58;
            *((_QWORD *)&v417 + 1) = v59;
            v264 = &v418;
            goto LABEL_602;
          }
          v236 = (NSObject **)*((_QWORD *)this + 3);
          v237 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v237)
          {
            v238 = (unint64_t *)&v237->__shared_owners_;
            do
              v239 = __ldxr(v238);
            while (__stxr(v239 + 1, v238));
            v67 = *v236;
            do
              v240 = __ldaxr(v238);
            while (__stlxr(v240 - 1, v238));
            if (!v240)
            {
              ((void (*)(std::__shared_weak_count *))v237->__on_zero_shared)(v237);
              std::__shared_weak_count::__release_weak(v237);
            }
          }
          else
          {
            v67 = *v236;
          }
          if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            goto LABEL_601;
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v337 = __p;
          else
            v337 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v337;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v204 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_135:
          v132 = (NSObject **)*((_QWORD *)this + 3);
          v133 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v133)
          {
            v134 = (unint64_t *)&v133->__shared_owners_;
            do
              v135 = __ldxr(v134);
            while (__stxr(v135 + 1, v134));
            v67 = *v132;
            do
              v136 = __ldaxr(v134);
            while (__stlxr(v136 - 1, v134));
            if (!v136)
            {
              ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
              std::__shared_weak_count::__release_weak(v133);
            }
          }
          else
          {
            v67 = *v132;
          }
          if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            goto LABEL_601;
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v203 = __p;
          else
            v203 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v203;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v204 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v172 = (NSObject **)*((_QWORD *)this + 3);
        v173 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v173)
        {
          v174 = (unint64_t *)&v173->__shared_owners_;
          do
            v175 = __ldxr(v174);
          while (__stxr(v175 + 1, v174));
          v67 = *v172;
          do
            v176 = __ldaxr(v174);
          while (__stlxr(v176 - 1, v174));
          if (!v176)
          {
            ((void (*)(std::__shared_weak_count *))v173->__on_zero_shared)(v173);
            std::__shared_weak_count::__release_weak(v173);
          }
        }
        else
        {
          v67 = *v172;
        }
        if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          goto LABEL_601;
        std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v216 = __p;
        else
          v216 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v216;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v204 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_599:
      _os_log_error_impl(&dword_20DA91000, v67, OS_LOG_TYPE_ERROR, v204, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_601;
    case 0xDu:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v105 = operator new(0x38uLL);
      v105[1] = 0;
      v105[2] = 0;
      *v105 = off_24C80A5A0;
      v105[3] = off_24C80B260;
      v106 = (char *)(v105 + 3);
      v105[4] = 0;
      *((_DWORD *)v105 + 13) = 0;
      v418 = (os_log_t *)(v105 + 3);
      v419 = (std::__shared_weak_count *)v105;
      if (!a4)
        goto LABEL_163;
      v107 = v105;
      *(_QWORD *)&v108 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v108 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v108;
      v422 = v108;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, void **))(*(_QWORD *)v106 + 16))(v106, __p) & 1) != 0)
      {
        v109 = v107[4];
        if (v109)
        {
          v110 = *(_BYTE *)(v109 + 20);
          if ((v110 & 1) == 0)
          {
            v111 = (NSObject **)*((_QWORD *)this + 3);
            v112 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v112)
            {
              v113 = (unint64_t *)&v112->__shared_owners_;
              do
                v114 = __ldxr(v113);
              while (__stxr(v114 + 1, v113));
              v115 = *v111;
              do
                v116 = __ldaxr(v113);
              while (__stlxr(v116 - 1, v113));
              if (!v116)
              {
                ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
                std::__shared_weak_count::__release_weak(v112);
              }
            }
            else
            {
              v115 = *v111;
            }
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v276 = __p;
              else
                v276 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v276;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v212 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_717;
            }
LABEL_719:
            v268 = (os_log_t **)&v417;
LABEL_720:
            *v268 = 0;
            v268[1] = 0;
            v395 = v419;
            if (v419)
            {
              v396 = (unint64_t *)&v419->__shared_owners_;
              do
                v397 = __ldaxr(v396);
              while (__stlxr(v397 - 1, v396));
              if (!v397)
              {
                ((void (*)(std::__shared_weak_count *))v395->__on_zero_shared)(v395);
                std::__shared_weak_count::__release_weak(v395);
              }
            }
            v398 = v417;
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v406 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v406);
              while (__stlxr(v291 - 1, v406));
              goto LABEL_738;
            }
            v399 = (os_log_t *)*((_QWORD *)this + 3);
            v400 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            v418 = v399;
            v419 = v400;
            if (v400)
            {
              v401 = (unint64_t *)&v400->__shared_owners_;
              do
                v402 = __ldxr(v401);
              while (__stxr(v402 + 1, v401));
            }
            v403 = *(_BYTE *)(v398 + 28);
            if ((v403 & 1) != 0)
            {
              if ((v403 & 2) != 0)
              {
                if ((v403 & 4) != 0)
                {
                  v409 = 1;
                  if (v400)
                    goto LABEL_755;
                  goto LABEL_759;
                }
                v404 = *v399;
                if (!os_log_type_enabled(*v399, OS_LOG_TYPE_ERROR))
                {
LABEL_754:
                  v409 = 0;
                  if (v400)
                  {
LABEL_755:
                    v410 = (unint64_t *)&v400->__shared_owners_;
                    do
                      v411 = __ldaxr(v410);
                    while (__stlxr(v411 - 1, v410));
                    if (!v411)
                    {
                      ((void (*)(std::__shared_weak_count *))v400->__on_zero_shared)(v400);
                      std::__shared_weak_count::__release_weak(v400);
                    }
                  }
LABEL_759:
                  if ((v409 & 1) != 0)
                  {
                    v301 = *((_QWORD *)&v417 + 1);
                    v300 = v417;
                    *(_QWORD *)buf = this;
                    *(_OWORD *)&buf[8] = v417;
                    v417 = 0uLL;
                    *((_QWORD *)&v422 + 1) = 0;
                    v302 = operator new(0x20uLL);
                    *v302 = off_24C80A670;
                  }
                  else
                  {
                    v301 = *((_QWORD *)&v417 + 1);
                    v300 = v417;
                    *(_QWORD *)buf = this;
                    *(_OWORD *)&buf[8] = v417;
                    v417 = 0uLL;
                    *((_QWORD *)&v422 + 1) = 0;
                    v302 = operator new(0x20uLL);
                    *v302 = off_24C80A5F0;
                  }
LABEL_761:
                  v302[1] = this;
                  v302[2] = v300;
                  v302[3] = v301;
                  *(_OWORD *)&buf[8] = 0uLL;
                  *((_QWORD *)&v422 + 1) = v302;
                  telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p, v303, v304, v305);
LABEL_763:
                  v412 = (void **)*((_QWORD *)&v422 + 1);
                  if (*((void ***)&v422 + 1) == __p)
                  {
                    v413 = 4;
                    v412 = __p;
                  }
                  else
                  {
                    if (!*((_QWORD *)&v422 + 1))
                      return;
                    v413 = 5;
                  }
                  (*((void (**)(void))*v412 + v413))();
                  return;
                }
                std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v408 = __p;
                else
                  v408 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "WhichRegister";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v408;
              }
              else
              {
                v404 = *v399;
                if (!os_log_type_enabled(*v399, OS_LOG_TYPE_ERROR))
                  goto LABEL_754;
                std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
                if ((SBYTE7(v422) & 0x80u) == 0)
                  v407 = __p;
                else
                  v407 = (void **)__p[0];
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "TimeoutMs";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v407;
              }
            }
            else
            {
              v404 = *v399;
              if (!os_log_type_enabled(*v399, OS_LOG_TYPE_ERROR))
                goto LABEL_754;
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v405 = __p;
              else
                v405 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "BytesToRead";
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v405;
            }
            _os_log_error_impl(&dword_20DA91000, v404, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
            if (SBYTE7(v422) < 0)
              operator delete(__p[0]);
            goto LABEL_754;
          }
          if ((v110 & 2) != 0)
          {
            *(_QWORD *)&v417 = v106;
            *((_QWORD *)&v417 + 1) = v107;
            v268 = &v418;
            goto LABEL_720;
          }
          v256 = (NSObject **)*((_QWORD *)this + 3);
          v257 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v257)
          {
            v258 = (unint64_t *)&v257->__shared_owners_;
            do
              v259 = __ldxr(v258);
            while (__stxr(v259 + 1, v258));
            v115 = *v256;
            do
              v260 = __ldaxr(v258);
            while (__stlxr(v260 - 1, v258));
            if (!v260)
            {
              ((void (*)(std::__shared_weak_count *))v257->__on_zero_shared)(v257);
              std::__shared_weak_count::__release_weak(v257);
            }
          }
          else
          {
            v115 = *v256;
          }
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            goto LABEL_719;
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v394 = __p;
          else
            v394 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v394;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v212 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_163:
          v152 = (NSObject **)*((_QWORD *)this + 3);
          v153 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v153)
          {
            v154 = (unint64_t *)&v153->__shared_owners_;
            do
              v155 = __ldxr(v154);
            while (__stxr(v155 + 1, v154));
            v115 = *v152;
            do
              v156 = __ldaxr(v154);
            while (__stlxr(v156 - 1, v154));
            if (!v156)
            {
              ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
              std::__shared_weak_count::__release_weak(v153);
            }
          }
          else
          {
            v115 = *v152;
          }
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            goto LABEL_719;
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v211 = __p;
          else
            v211 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v211;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v212 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v192 = (NSObject **)*((_QWORD *)this + 3);
        v193 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v193)
        {
          v194 = (unint64_t *)&v193->__shared_owners_;
          do
            v195 = __ldxr(v194);
          while (__stxr(v195 + 1, v194));
          v115 = *v192;
          do
            v196 = __ldaxr(v194);
          while (__stlxr(v196 - 1, v194));
          if (!v196)
          {
            ((void (*)(std::__shared_weak_count *))v193->__on_zero_shared)(v193);
            std::__shared_weak_count::__release_weak(v193);
          }
        }
        else
        {
          v115 = *v192;
        }
        if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          goto LABEL_719;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v220 = __p;
        else
          v220 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v220;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v212 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_717:
      _os_log_error_impl(&dword_20DA91000, v115, OS_LOG_TYPE_ERROR, v212, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_719;
    case 0xFu:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v69 = (std::__shared_weak_count *)operator new(0x28uLL);
      v69->__shared_owners_ = 0;
      v69->__shared_weak_owners_ = 0;
      v69->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A6F0;
      v69[1].__vftable = (std::__shared_weak_count_vtbl *)off_24C80B298;
      v70 = &v69[1].__vftable;
      v69[1].__shared_owners_ = 0;
      v418 = (os_log_t *)&v69[1];
      v419 = v69;
      if (!a4)
        goto LABEL_142;
      v71 = &v69->__vftable;
      *(_QWORD *)&v72 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v72;
      v422 = v72;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, void **))(*v70 + 16))(v70, __p) & 1) != 0)
      {
        v73 = v71[4];
        if (v73)
        {
          v74 = *(_BYTE *)(v73 + 20);
          if ((v74 & 1) == 0)
          {
            v75 = (NSObject **)*((_QWORD *)this + 3);
            v76 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v76)
            {
              v77 = (unint64_t *)&v76->__shared_owners_;
              do
                v78 = __ldxr(v77);
              while (__stxr(v78 + 1, v77));
              v79 = *v75;
              do
                v80 = __ldaxr(v77);
              while (__stlxr(v80 - 1, v77));
              if (!v80)
              {
                ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                std::__shared_weak_count::__release_weak(v76);
              }
            }
            else
            {
              v79 = *v75;
            }
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v273 = __p;
              else
                v273 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v273;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v206 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_639;
            }
LABEL_641:
            v265 = (os_log_t **)&v417;
LABEL_642:
            *v265 = 0;
            v265[1] = 0;
            v353 = v419;
            if (v419)
            {
              v354 = (unint64_t *)&v419->__shared_owners_;
              do
                v355 = __ldaxr(v354);
              while (__stlxr(v355 - 1, v354));
              if (!v355)
              {
                ((void (*)(std::__shared_weak_count *))v353->__on_zero_shared)(v353);
                std::__shared_weak_count::__release_weak(v353);
              }
            }
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v365 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v365);
              while (__stlxr(v291 - 1, v365));
              goto LABEL_738;
            }
            v356 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v356)
            {
              v357 = (unint64_t *)&v356->__shared_owners_;
              do
                v358 = __ldxr(v357);
              while (__stxr(v358 + 1, v357));
              do
                v359 = __ldaxr(v357);
              while (__stlxr(v359 - 1, v357));
              if (!v359)
              {
                ((void (*)(std::__shared_weak_count *))v356->__on_zero_shared)(v356);
                std::__shared_weak_count::__release_weak(v356);
              }
            }
            v360 = v417;
            *(_QWORD *)buf = this;
            *(_OWORD *)&buf[8] = v417;
            v417 = 0uLL;
            *((_QWORD *)&v422 + 1) = 0;
            v361 = operator new(0x20uLL);
            *v361 = off_24C80A740;
            v361[1] = this;
            *((_OWORD *)v361 + 1) = v360;
            *(_OWORD *)&buf[8] = 0uLL;
            *((_QWORD *)&v422 + 1) = v361;
            telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p, v362, v363, v364);
            goto LABEL_763;
          }
          if ((v74 & 2) != 0)
          {
            *(_QWORD *)&v417 = v70;
            *((_QWORD *)&v417 + 1) = v71;
            v265 = &v418;
            goto LABEL_642;
          }
          v241 = (NSObject **)*((_QWORD *)this + 3);
          v242 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v242)
          {
            v243 = (unint64_t *)&v242->__shared_owners_;
            do
              v244 = __ldxr(v243);
            while (__stxr(v244 + 1, v243));
            v79 = *v241;
            do
              v245 = __ldaxr(v243);
            while (__stlxr(v245 - 1, v243));
            if (!v245)
            {
              ((void (*)(std::__shared_weak_count *))v242->__on_zero_shared)(v242);
              std::__shared_weak_count::__release_weak(v242);
            }
          }
          else
          {
            v79 = *v241;
          }
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            goto LABEL_641;
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v352 = __p;
          else
            v352 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v352;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v206 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_142:
          v137 = (NSObject **)*((_QWORD *)this + 3);
          v138 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v138)
          {
            v139 = (unint64_t *)&v138->__shared_owners_;
            do
              v140 = __ldxr(v139);
            while (__stxr(v140 + 1, v139));
            v79 = *v137;
            do
              v141 = __ldaxr(v139);
            while (__stlxr(v141 - 1, v139));
            if (!v141)
            {
              ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
              std::__shared_weak_count::__release_weak(v138);
            }
          }
          else
          {
            v79 = *v137;
          }
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            goto LABEL_641;
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v205 = __p;
          else
            v205 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v205;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v206 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v177 = (NSObject **)*((_QWORD *)this + 3);
        v178 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v178)
        {
          v179 = (unint64_t *)&v178->__shared_owners_;
          do
            v180 = __ldxr(v179);
          while (__stxr(v180 + 1, v179));
          v79 = *v177;
          do
            v181 = __ldaxr(v179);
          while (__stlxr(v181 - 1, v179));
          if (!v181)
          {
            ((void (*)(std::__shared_weak_count *))v178->__on_zero_shared)(v178);
            std::__shared_weak_count::__release_weak(v178);
          }
        }
        else
        {
          v79 = *v177;
        }
        if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          goto LABEL_641;
        std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v217 = __p;
        else
          v217 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v217;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v206 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_639:
      _os_log_error_impl(&dword_20DA91000, v79, OS_LOG_TYPE_ERROR, v206, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_641;
    case 0x11u:
      *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v81 = (std::__shared_weak_count *)operator new(0x28uLL);
      v81->__shared_owners_ = 0;
      v81->__shared_weak_owners_ = 0;
      v81->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A7C0;
      v81[1].__vftable = (std::__shared_weak_count_vtbl *)off_24C80B2D0;
      v82 = &v81[1].__vftable;
      v81[1].__shared_owners_ = 0;
      v418 = (os_log_t *)&v81[1];
      v419 = v81;
      if (!a4)
        goto LABEL_149;
      v83 = &v81->__vftable;
      *(_QWORD *)&v84 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v84 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v84;
      v422 = v84;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, void **))(*v82 + 16))(v82, __p) & 1) != 0)
      {
        v85 = v83[4];
        if (v85)
        {
          v86 = *(_BYTE *)(v85 + 20);
          if ((v86 & 1) == 0)
          {
            v87 = (NSObject **)*((_QWORD *)this + 3);
            v88 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v88)
            {
              v89 = (unint64_t *)&v88->__shared_owners_;
              do
                v90 = __ldxr(v89);
              while (__stxr(v90 + 1, v89));
              v91 = *v87;
              do
                v92 = __ldaxr(v89);
              while (__stlxr(v92 - 1, v89));
              if (!v92)
              {
                ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
                std::__shared_weak_count::__release_weak(v88);
              }
            }
            else
            {
              v91 = *v87;
            }
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
              if ((SBYTE7(v422) & 0x80u) == 0)
                v274 = __p;
              else
                v274 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v274;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v208 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_665;
            }
LABEL_667:
            v266 = (os_log_t **)&v417;
LABEL_668:
            *v266 = 0;
            v266[1] = 0;
            v367 = v419;
            if (v419)
            {
              v368 = (unint64_t *)&v419->__shared_owners_;
              do
                v369 = __ldaxr(v368);
              while (__stlxr(v369 - 1, v368));
              if (!v369)
              {
                ((void (*)(std::__shared_weak_count *))v367->__on_zero_shared)(v367);
                std::__shared_weak_count::__release_weak(v367);
              }
            }
            if (!(_QWORD)v417)
            {
              v289 = (std::__shared_weak_count *)*((_QWORD *)&v417 + 1);
              if (!*((_QWORD *)&v417 + 1))
                return;
              v379 = (unint64_t *)(*((_QWORD *)&v417 + 1) + 8);
              do
                v291 = __ldaxr(v379);
              while (__stlxr(v291 - 1, v379));
              goto LABEL_738;
            }
            v370 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
            if (v370)
            {
              v371 = (unint64_t *)&v370->__shared_owners_;
              do
                v372 = __ldxr(v371);
              while (__stxr(v372 + 1, v371));
              do
                v373 = __ldaxr(v371);
              while (__stlxr(v373 - 1, v371));
              if (!v373)
              {
                ((void (*)(std::__shared_weak_count *))v370->__on_zero_shared)(v370);
                std::__shared_weak_count::__release_weak(v370);
              }
            }
            v374 = v417;
            *(_QWORD *)buf = this;
            *(_OWORD *)&buf[8] = v417;
            v417 = 0uLL;
            *((_QWORD *)&v422 + 1) = 0;
            v375 = operator new(0x20uLL);
            *v375 = off_24C80A810;
            v375[1] = this;
            *((_OWORD *)v375 + 1) = v374;
            *(_OWORD *)&buf[8] = 0uLL;
            *((_QWORD *)&v422 + 1) = v375;
            telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p, v376, v377, v378);
            goto LABEL_763;
          }
          if ((v86 & 2) != 0)
          {
            *(_QWORD *)&v417 = v82;
            *((_QWORD *)&v417 + 1) = v83;
            v266 = &v418;
            goto LABEL_668;
          }
          v246 = (NSObject **)*((_QWORD *)this + 3);
          v247 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v247)
          {
            v248 = (unint64_t *)&v247->__shared_owners_;
            do
              v249 = __ldxr(v248);
            while (__stxr(v249 + 1, v248));
            v91 = *v246;
            do
              v250 = __ldaxr(v248);
            while (__stlxr(v250 - 1, v248));
            if (!v250)
            {
              ((void (*)(std::__shared_weak_count *))v247->__on_zero_shared)(v247);
              std::__shared_weak_count::__release_weak(v247);
            }
          }
          else
          {
            v91 = *v246;
          }
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            goto LABEL_667;
          std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v366 = __p;
          else
            v366 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v366;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v208 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        }
        else
        {
LABEL_149:
          v142 = (NSObject **)*((_QWORD *)this + 3);
          v143 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
          if (v143)
          {
            v144 = (unint64_t *)&v143->__shared_owners_;
            do
              v145 = __ldxr(v144);
            while (__stxr(v145 + 1, v144));
            v91 = *v142;
            do
              v146 = __ldaxr(v144);
            while (__stlxr(v146 - 1, v144));
            if (!v146)
            {
              ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
              std::__shared_weak_count::__release_weak(v143);
            }
          }
          else
          {
            v91 = *v142;
          }
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            goto LABEL_667;
          std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
          if ((SBYTE7(v422) & 0x80u) == 0)
            v207 = __p;
          else
            v207 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v207;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          v208 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        }
      }
      else
      {
        v182 = (NSObject **)*((_QWORD *)this + 3);
        v183 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v183)
        {
          v184 = (unint64_t *)&v183->__shared_owners_;
          do
            v185 = __ldxr(v184);
          while (__stxr(v185 + 1, v184));
          v91 = *v182;
          do
            v186 = __ldaxr(v184);
          while (__stlxr(v186 - 1, v184));
          if (!v186)
          {
            ((void (*)(std::__shared_weak_count *))v183->__on_zero_shared)(v183);
            std::__shared_weak_count::__release_weak(v183);
          }
        }
        else
        {
          v91 = *v182;
        }
        if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          goto LABEL_667;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
        if ((SBYTE7(v422) & 0x80u) == 0)
          v218 = __p;
        else
          v218 = (void **)__p[0];
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v218;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v208 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_665:
      _os_log_error_impl(&dword_20DA91000, v91, OS_LOG_TYPE_ERROR, v208, buf, 0x16u);
      if (SBYTE7(v422) < 0)
        operator delete(__p[0]);
      goto LABEL_667;
    default:
      return;
  }
}

void sub_20DA9C480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::~PCIServiceTransport(telephonytransport::PCIServiceTransport *this)
{
  std::__shared_weak_count *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = &off_24C809C88;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 64);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 7);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  v3 = *((_QWORD *)this + 5);
  if (v3)
    dispatch_release(v3);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  std::__shared_weak_count *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = &off_24C809C88;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 64);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 7);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  v3 = *((_QWORD *)this + 5);
  if (v3)
    dispatch_release(v3);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(this);
}

void std::unique_ptr<PB::Data>::reset[abi:ne180100](void ***a1, void **a2)
{
  void **v2;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    free(*v2);
    operator delete(v2);
  }
}

void std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  void *v1;

  std::exception::~exception(this);
  operator delete(v1);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__func(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_24C809E60;
  v2 = (std::__shared_weak_count *)a1[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__func(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_24C809E60;
  v2 = (std::__shared_weak_count *)__p[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = &off_24C809E60;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = &off_24C809E60;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::destroy(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::destroy_deallocate(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  v2 = (std::__shared_weak_count *)__p[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(_QWORD *a1, int *a2, unsigned __int8 *a3, const unsigned __int8 **a4, uint64_t *a5)
{
  std::__shared_weak_count *v6;
  int v7;
  int v8;
  const unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  _DWORD *v14;
  void **v15;
  NSObject **v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  NSObject *v20;
  unint64_t v21;
  NSObject **v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  void (**v32)(telephonytransport::PCIReadIndication *__hidden);
  PB::Data *v33;
  _DWORD *v34;
  uint8_t buf[8];
  char v36;
  uint8_t v37[4];
  uint8_t *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (std::__shared_weak_count *)a1[3];
  if (v6)
  {
    v7 = *a2;
    v8 = *a3;
    v9 = *a4;
    v10 = *a5;
    v11 = a1[1];
    v12 = std::__shared_weak_count::lock(v6);
    if (v12)
    {
      v13 = v12;
      if (a1[2])
      {
        if (v8)
        {
          v33 = 0;
          v32 = off_24C80B340;
          v14 = operator new(0x18uLL);
          v34 = v14;
          v14[4] = v7;
          v14[5] = 3;
          *(_QWORD *)v14 = off_24C80B308;
          *((_QWORD *)v14 + 1) = 0;
          v15 = (void **)operator new(0x10uLL);
          *v15 = 0;
          v15[1] = 0;
          std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v33, v15);
          PB::Data::assign(v33, v9, &v9[v10]);
          if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(v11 + 64), 5u, (const PB::Base *)&v32) & 1) == 0)
          {
            v16 = *(NSObject ***)(v11 + 24);
            v17 = *(std::__shared_weak_count **)(v11 + 32);
            if (v17)
            {
              p_shared_owners = (unint64_t *)&v17->__shared_owners_;
              do
                v19 = __ldxr(p_shared_owners);
              while (__stxr(v19 + 1, p_shared_owners));
              v20 = *v16;
              do
                v21 = __ldaxr(p_shared_owners);
              while (__stlxr(v21 - 1, p_shared_owners));
              if (!v21)
              {
                ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
                std::__shared_weak_count::__release_weak(v17);
              }
            }
            else
            {
              v20 = *v16;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
              if (v36 >= 0)
                v30 = buf;
              else
                v30 = *(uint8_t **)buf;
              v31 = *((_QWORD *)v34 + 1);
              *(_DWORD *)v37 = 136315394;
              v38 = v30;
              v39 = 2048;
              v40 = v31;
              _os_log_error_impl(&dword_20DA91000, v20, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", v37, 0x16u);
              if (v36 < 0)
                operator delete(*(void **)buf);
            }
          }
          telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)&v32);
        }
        else
        {
          v22 = *(NSObject ***)(v11 + 24);
          v23 = *(std::__shared_weak_count **)(v11 + 32);
          if (v23)
          {
            v24 = (unint64_t *)&v23->__shared_owners_;
            do
              v25 = __ldxr(v24);
            while (__stxr(v25 + 1, v24));
            v26 = *v22;
            do
              v27 = __ldaxr(v24);
            while (__stlxr(v27 - 1, v24));
            if (!v27)
            {
              ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
              std::__shared_weak_count::__release_weak(v23);
            }
          }
          else
          {
            v26 = *v22;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20DA91000, v26, OS_LOG_TYPE_ERROR, "Received indication with failure", buf, 2u);
          }
        }
      }
      v28 = (unint64_t *)&v13->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
}

void sub_20DA9CDF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v5;
  va_list va;

  va_start(va, a2);
  telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)va);
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__func(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_24C809EF0;
  v2 = (std::__shared_weak_count *)a1[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__func(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_24C809EF0;
  v2 = (std::__shared_weak_count *)__p[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = &off_24C809EF0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = &off_24C809EF0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::destroy(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::destroy_deallocate(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  v2 = (std::__shared_weak_count *)__p[3];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(_QWORD *a1, int *a2, int *a3, uint64_t *a4, uint64_t *a5)
{
  std::__shared_weak_count *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  _DWORD *v14;
  NSObject **v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  _DWORD *v21;
  unint64_t *v22;
  unint64_t v23;
  void **v24;
  uint64_t v25;
  _QWORD v26[3];
  _DWORD *v27;
  int v28;
  int v29;
  void *__p[2];
  char v31;
  uint8_t buf[4];
  void **v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = (std::__shared_weak_count *)a1[3];
  if (v6)
  {
    v7 = *a2;
    v8 = *a3;
    v9 = *a4;
    v10 = *a5;
    v11 = a1[1];
    v12 = std::__shared_weak_count::lock(v6);
    if (v12)
    {
      v13 = v12;
      if (a1[2])
      {
        v29 = 0;
        v26[0] = off_24C80B500;
        v14 = operator new(0x18uLL);
        v26[2] = v10;
        v27 = v14;
        v14[4] = v7;
        v14[5] = 3;
        *(_QWORD *)v14 = off_24C80B308;
        *((_QWORD *)v14 + 1) = 0;
        v28 = v8;
        LOBYTE(v29) = 7;
        v26[1] = v9;
        if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(v11 + 64), 6u, (const PB::Base *)v26) & 1) == 0)
        {
          v15 = *(NSObject ***)(v11 + 24);
          v16 = *(std::__shared_weak_count **)(v11 + 32);
          if (v16)
          {
            p_shared_owners = (unint64_t *)&v16->__shared_owners_;
            do
              v18 = __ldxr(p_shared_owners);
            while (__stxr(v18 + 1, p_shared_owners));
            v19 = *v15;
            do
              v20 = __ldaxr(p_shared_owners);
            while (__stlxr(v20 - 1, p_shared_owners));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          else
          {
            v19 = *v15;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kStatusIndication");
            v24 = v31 >= 0 ? __p : (void **)__p[0];
            v25 = *((_QWORD *)v27 + 1);
            *(_DWORD *)buf = 136315394;
            v33 = v24;
            v34 = 2048;
            v35 = v25;
            _os_log_error_impl(&dword_20DA91000, v19, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
            if (v31 < 0)
              operator delete(__p[0]);
          }
        }
        v21 = v27;
        v26[0] = off_24C80B500;
        v27 = 0;
        if (v21)
          (*(void (**)(_DWORD *))(*(_QWORD *)v21 + 8))(v21);
        PB::Base::~Base((PB::Base *)v26);
      }
      v22 = (unint64_t *)&v13->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
}

void sub_20DA9D1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v12;

  telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)&a9);
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C809F80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C809F80;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C809FD0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C809FD0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C809FD0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C809FD0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCICreateRequest>(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A060;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A060;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A060;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A060;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(*(_QWORD **)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A0E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A0E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A130;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A130;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A130;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A130;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRequest>(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A1B0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A1B0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A1B0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A1B0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A230;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A230;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A280;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A280;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A280;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A280;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIWriteRequest>(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A300;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A300;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A300;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A300;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIWriteRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A380;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A380;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A3D0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A3D0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A3D0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A3D0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFreeRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A450;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A450;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A4A0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A4A0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A4A0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A4A0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCISendImageRequest>(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A520;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A520;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A520;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A520;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCISendImageRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A5A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A5A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A5F0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A5F0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A5F0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A5F0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A670;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A670;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A670;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A670;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A6F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A6F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A740;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A740;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A740;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A740;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIUnblockReadRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A7C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A7C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A810;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = off_24C80A810;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 2));
  operator delete(a1);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  char *result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = (char *)operator new(0x20uLL);
  *(_QWORD *)result = off_24C80A810;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  *((_QWORD *)result + 3) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)a2 = off_24C80A810;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 24);
  *(_QWORD *)(a2 + 24) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 16);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 16);
  operator delete(a1);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
  telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFlushReadRequest>(*(_QWORD *)(a1 + 8), (uint64_t *)(a1 + 16));
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void telephonytransport::SocketToRawIPIfaceForwarder::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, std::string *a5@<X8>)
{
  telephonytransport *v9;
  telephonytransport::NetworkIface *v10;
  std::__shared_weak_count_vtbl *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  NSObject *v15;
  std::__shared_weak_count *v16;
  NSObject *v17;
  NSObject *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *size;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint8_t v28[8];
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v30;
  std::__shared_weak_count *v31;
  __int128 v32;
  std::string v33;
  int v34;
  void *__p;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  telephonytransport::NetworkIface *v42;
  unint64_t v43;

  v42 = (telephonytransport::NetworkIface *)0xAAAAAAAAAAAAAAAALL;
  v43 = 0xAAAAAAAAAAAAAAAALL;
  v40 = 0;
  v41 = 0;
  v39 = 0;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v33, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v33 = *(std::string *)a2;
  v34 = 12;
  v36 = 0;
  v37 = 0;
  __p = 0;
  v38 = 1;
  telephonytransport::NetworkIface::create((telephonytransport *)&v40, &v39, (uint64_t)&v33, a4, &v42);
  if (SHIBYTE(v37) < 0)
    operator delete(__p);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  if (v39)
    dispatch_release(v39);
  v9 = (telephonytransport *)v41;
  if (v41)
    std::__shared_weak_count::__release_weak(v41);
  v10 = v42;
  if (v42)
  {
    v11 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v11->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&off_24C80A890;
    v11->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v11->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v43;
    v42 = 0;
    v43 = 0;
    v11->__get_deleter = 0;
    v11->__on_zero_shared_weak = 0;
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
    v12 = (std::__shared_weak_count *)operator new(0x20uLL);
    v12->__shared_weak_owners_ = 0;
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)off_24C80A8D0;
    v12->__shared_owners_ = 0;
    v12[1].__vftable = v11;
    v33.__r_.__value_.__l.__size_ = (std::string::size_type)v12;
    *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v30 = v11;
    v31 = v12;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v15 = *a3;
    object = v15;
    if (v15)
      dispatch_retain(v15);
    telephonytransport::BaseProtocol::create((uint64_t)&v30, &object, a1, 0, a4, (std::__shared_weak_count_vtbl **)&v32);
    if (object)
      dispatch_release(object);
    v16 = v31;
    if (v31)
      std::__shared_weak_count::__release_weak(v31);
    if ((_QWORD)v32)
    {
      std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)&v11->__get_deleter, &v32);
      a5->__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
      a5->__r_.__value_.__l.__size_ = (std::string::size_type)v12;
      a5 = &v33;
    }
    else
    {
      v18 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v16);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_error_impl(&dword_20DA91000, v18, OS_LOG_TYPE_ERROR, "Failed to create source read only protocol", v28, 2u);
      }
    }
    a5->__r_.__value_.__r.__words[0] = 0;
    a5->__r_.__value_.__l.__size_ = 0;
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    size = (std::__shared_weak_count *)v33.__r_.__value_.__l.__size_;
    if (v33.__r_.__value_.__l.__size_)
    {
      v23 = (unint64_t *)(v33.__r_.__value_.__l.__size_ + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
  }
  else
  {
    v17 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_20DA91000, v17, OS_LOG_TYPE_ERROR, "Failed to create destination write only transport", (uint8_t *)&v33, 2u);
    }
    a5->__r_.__value_.__r.__words[0] = 0;
    a5->__r_.__value_.__l.__size_ = 0;
  }
  v25 = (std::__shared_weak_count *)v43;
  if (v43)
  {
    v26 = (unint64_t *)(v43 + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
}

void sub_20DA9EA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, char a13, uint64_t a14, char a15)
{
  uint64_t v15;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v15 - 80);
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketToRawIPIfaceForwarder::SocketToRawIPIfaceForwarder(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(_QWORD *)a1 = &off_24C80A890;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(_QWORD *)a1 = &off_24C80A890;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

uint64_t telephonytransport::SocketToRawIPIfaceForwarder::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 24, a2);
  return 1;
}

uint64_t telephonytransport::SocketToRawIPIfaceForwarder::handleMessage(_BOOL8 this, int a2, unsigned __int8 *a3, uint64_t a4)
{
  NSObject *v4;
  uint8_t v6[16];

  if (a2 != 1)
  {
    v4 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
    this = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
    if (this)
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_20DA91000, v4, OS_LOG_TYPE_FAULT, "Only kPDPIP message type is supported here", v6, 2u);
    }
    __break(1u);
  }
  return (***(uint64_t (****)(_QWORD, unsigned __int8 *, uint64_t))(this + 8))(*(_QWORD *)(this + 8), a3, a4);
}

void telephonytransport::SocketToRawIPIfaceForwarder::~SocketToRawIPIfaceForwarder(telephonytransport::SocketToRawIPIfaceForwarder *this)
{
  char *v1;

  *(_QWORD *)this = &off_24C80A890;
  v1 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = &off_24C80A890;
  v2 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketAndRawIPIfaceBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, NSObject **a4@<X3>, char *a5@<X4>, _QWORD *a6@<X8>)
{
  NSObject *v11;
  NSObject *v12;
  telephonytransport *v13;
  std::string::size_type v14;
  std::__shared_weak_count_vtbl *v15;
  _QWORD *v16;
  std::string::size_type size;
  unint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  dispatch_object_t v27;
  std::__shared_weak_count_vtbl *v28;
  unint64_t v29;
  dispatch_object_t object;
  std::string v31;

  v31.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v31.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  v11 = *a2;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  telephonytransport::SocketToRawIPIfaceForwarder::create(a1, a3, &object, a5, &v31);
  if (object)
    dispatch_release(object);
  v28 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v12 = *a4;
  v27 = v12;
  if (v12)
    dispatch_retain(v12);
  telephonytransport::RawIPIfaceToSocketForwarder::create(a3, a1, &v27, a5, &v28);
  v13 = (telephonytransport *)v27;
  if (v27)
    dispatch_release(v27);
  v14 = v31.__r_.__value_.__r.__words[0];
  if (v31.__r_.__value_.__r.__words[0] && (v15 = v28) != 0)
  {
    *a6 = 0xAAAAAAAAAAAAAAAALL;
    a6[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 = operator new(0x20uLL);
    size = v31.__r_.__value_.__l.__size_;
    *v16 = v14;
    v16[1] = size;
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = 0uLL;
    v18 = v29;
    v16[2] = v15;
    v16[3] = v18;
    v28 = 0;
    v29 = 0;
    *a6 = v16;
    v31.__r_.__value_.__r.__words[2] = (std::string::size_type)v16;
    v19 = operator new(0x20uLL);
    *v19 = off_24C80A948;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v16;
    a6[1] = v19;
    v31.__r_.__value_.__r.__words[2] = 0;
    std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100]((uint64_t *)&v31.__r_.__value_.__r.__words[2]);
  }
  else
  {
    v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31.__r_.__value_.__r.__words[2]) = 0;
      _os_log_error_impl(&dword_20DA91000, v20, OS_LOG_TYPE_ERROR, "Failed to create SocketAndRawIPIfaceBridge", (uint8_t *)&v31.__r_.__value_.__s.__data_[16], 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  v21 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v22 = (unint64_t *)(v29 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (std::__shared_weak_count *)v31.__r_.__value_.__l.__size_;
  if (v31.__r_.__value_.__l.__size_)
  {
    v25 = (unint64_t *)(v31.__r_.__value_.__l.__size_ + 8);
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

void sub_20DA9EED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, dispatch_object_t object, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100](&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_20DA9EF1C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  JUMPOUT(0x20DA9EF14);
}

__n128 telephonytransport::SocketAndRawIPIfaceBridge::SocketAndRawIPIfaceBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1 + 16);
    v2 = (void *)std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  void *v2;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1 + 16);
    v2 = (void *)std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

void telephonytransport::NetworkIface::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, telephonytransport::NetworkIface **a5@<X8>)
{
  uint64_t v6;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  std::__shared_weak_count *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  telephonytransport::NetworkIface *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  _BOOL8 v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  uint8_t v27[8];
  dispatch_queue_t v28;
  uint8_t buf[8];
  std::__shared_weak_count *v30;

  v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a3 + 8);
  if (!v6)
  {
LABEL_8:
    v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Invalid network interface parameters";
LABEL_30:
      _os_log_error_impl(&dword_20DA91000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (*(_DWORD *)(a3 + 56) == 1)
  {
    v11 = *(unsigned __int8 *)(a3 + 55);
    if ((v11 & 0x80u) != 0)
      v11 = *(_QWORD *)(a3 + 40);
    if (v11)
      goto LABEL_8;
  }
  else
  {
    if (!*a2)
    {
      v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "Providing readQueue is mandatory when read mode is specified";
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
    if (!v14)
      goto LABEL_26;
    v14 = std::__shared_weak_count::lock(v14);
    if (!v14)
      goto LABEL_26;
    v15 = v14;
    v16 = *(_QWORD *)a1;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v15);
    }
    if (!v16)
    {
LABEL_26:
      v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "Delegate is mandatory for modes that require reader";
        goto LABEL_30;
      }
LABEL_31:
      *a5 = 0;
      a5[1] = 0;
      return;
    }
  }
  v19 = (telephonytransport::NetworkIface *)operator new(0x80uLL);
  v20 = *a2;
  v28 = v20;
  if (v20)
    dispatch_retain(v20);
  telephonytransport::NetworkIface::NetworkIface((uint64_t)v19, (uint64_t)a1, &v28, (__int128 *)a3, a4);
  *(_QWORD *)buf = v19;
  v21 = (std::__shared_weak_count *)operator new(0x20uLL);
  v21->__shared_owners_ = 0;
  v22 = (unint64_t *)&v21->__shared_owners_;
  v21->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AAF0;
  v21->__shared_weak_owners_ = 0;
  v21[1].__vftable = (std::__shared_weak_count_vtbl *)v19;
  v30 = v21;
  if (v20)
    dispatch_release(v20);
  v23 = telephonytransport::NetworkIface::init(v19);
  if (v23)
  {
    *a5 = v19;
    a5[1] = (telephonytransport::NetworkIface *)v21;
    do
      v24 = __ldxr(v22);
    while (__stxr(v24 + 1, v22));
  }
  else
  {
    v25 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, "Failed to initialize", v27, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  do
    v26 = __ldaxr(v22);
  while (__stlxr(v26 - 1, v22));
  if (!v26)
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
}

void sub_20DA9F2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::NetworkIface::init(telephonytransport::NetworkIface *this)
{
  __int128 v2;
  _BOOL8 result;
  NSObject **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  NSObject **v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  const char *v15;
  uint8_t v16[16];
  char v17[16];
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v2;
  v32 = v2;
  v29 = v2;
  v30 = v2;
  v27 = v2;
  v28 = v2;
  v25 = v2;
  v26 = v2;
  v23 = v2;
  v24 = v2;
  v21 = v2;
  v22 = v2;
  v19 = v2;
  v20 = v2;
  *(_OWORD *)v17 = v2;
  v18 = v2;
  if (*((_DWORD *)this + 24) == 1)
    goto LABEL_4;
  if (telephonytransport::NetworkIface::initializeReader(this, v17))
  {
    if (!*((_DWORD *)this + 24))
      return 1;
LABEL_4:
    if (telephonytransport::NetworkIface::initializeWriter(this, v17))
      return 1;
    v4 = (NSObject **)*((_QWORD *)this + 3);
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = *v4;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      v8 = *v4;
    }
    result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)v16 = 0;
      v15 = "Failed to initialize writer";
LABEL_27:
      _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, v15, v16, 2u);
      return 0;
    }
    return result;
  }
  v10 = (NSObject **)*((_QWORD *)this + 3);
  v11 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (v11)
  {
    v12 = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    v8 = *v10;
    do
      v14 = __ldaxr(v12);
    while (__stlxr(v14 - 1, v12));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  else
  {
    v8 = *v10;
  }
  result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)v16 = 0;
    v15 = "Failed to initialize reader";
    goto LABEL_27;
  }
  return result;
}

uint64_t telephonytransport::NetworkIface::NetworkIface(uint64_t a1, uint64_t a2, dispatch_queue_t *a3, __int128 *a4, char *a5)
{
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  dispatch_qos_class_t qos_class;
  NSObject *v13;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"nwiface", a5, (_QWORD *)(a1 + 24));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)a1 = &off_24C80AA40;
  v9 = *a4;
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a4 + 2);
  *(_OWORD *)(a1 + 40) = v9;
  *((_QWORD *)a4 + 1) = 0;
  *((_QWORD *)a4 + 2) = 0;
  *(_QWORD *)a4 = 0;
  *(_DWORD *)(a1 + 64) = *((_DWORD *)a4 + 6);
  v10 = a4[2];
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a4 + 6);
  *(_OWORD *)(a1 + 72) = v10;
  *((_QWORD *)a4 + 5) = 0;
  *((_QWORD *)a4 + 6) = 0;
  *((_QWORD *)a4 + 4) = 0;
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a4 + 7);
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  v11 = *a3;
  if (*a3)
  {
    qos_class = dispatch_queue_get_qos_class(v11, 0);
    v13 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
    if (*a3)
      v11 = dispatch_queue_create_with_target_V2("NetworkIface", v13, *a3);
    else
      v11 = dispatch_queue_create("NetworkIface", v13);
  }
  *(_QWORD *)(a1 + 120) = v11;
  return a1;
}

void telephonytransport::NetworkIface::~NetworkIface(telephonytransport::NetworkIface *this)
{
  NSObject *v2;
  pcap_t *v3;
  NSObject *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  *(_QWORD *)this = &off_24C80AA40;
  v2 = *((_QWORD *)this + 14);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = (pcap_t *)*((_QWORD *)this + 13);
  if (v3)
    pcap_close(v3);
  v4 = *((_QWORD *)this + 15);
  if (v4)
    dispatch_release(v4);
  v5 = *((_QWORD *)this + 14);
  if (v5)
    dispatch_release(v5);
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  *(_QWORD *)this = &unk_24C8095B0;
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
}

{
  void *v1;

  telephonytransport::NetworkIface::~NetworkIface(this);
  operator delete(v1);
}

BOOL telephonytransport::NetworkIface::initializeReader(telephonytransport::NetworkIface *this, char *a2)
{
  const char *v4;
  pcap *v5;
  pcap_t *v6;
  NSObject **v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject **v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  NSObject **v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  _BOOL8 result;
  const char *v26;
  bpf_program *p_buf;
  NSObject *v28;
  int v29;
  int v30;
  NSObject **v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  unint64_t v40;
  const char *v41;
  NSObject **v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  NSObject **v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  uint32_t v52;
  int v53;
  char *v54;
  bpf_program buf;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)this + 40;
  if (*((char *)this + 63) < 0)
    v4 = *(const char **)v4;
  v5 = pcap_open_live(v4, 1522, 1, 10, a2);
  if (!v5)
  {
    v19 = (NSObject **)*((_QWORD *)this + 3);
    v20 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldxr(p_shared_owners);
      while (__stxr(v22 + 1, p_shared_owners));
      v23 = *v19;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    else
    {
      v23 = *v19;
    }
    result = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      buf.bf_len = 136315138;
      *(_QWORD *)(&buf.bf_len + 1) = a2;
      v26 = "Unable to create read handle! Details: %s";
      p_buf = &buf;
      v28 = v23;
LABEL_81:
      v52 = 12;
LABEL_87:
      _os_log_error_impl(&dword_20DA91000, v28, OS_LOG_TYPE_ERROR, v26, (uint8_t *)p_buf, v52);
      return 0;
    }
    return result;
  }
  v6 = v5;
  telephonytransport::NetworkIface::verifyDataLinkType(this, v5);
  if (*((_DWORD *)this + 25) == 1 && pcap_setdirection(v6, PCAP_D_IN))
  {
    v7 = (NSObject **)*((_QWORD *)this + 3);
    v8 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v8)
    {
      v9 = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      v11 = *v7;
      do
        v12 = __ldaxr(v9);
      while (__stlxr(v12 - 1, v9));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    else
    {
      v11 = *v7;
    }
    result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      buf.bf_len = 136315138;
      *(_QWORD *)(&buf.bf_len + 1) = pcap_geterr(v6);
      v26 = "Unable to set direction, error: %s";
      p_buf = &buf;
LABEL_80:
      v28 = v11;
      goto LABEL_81;
    }
    return result;
  }
  if (pcap_setnonblock(v6, 1, a2) == -1)
  {
    v13 = (NSObject **)*((_QWORD *)this + 3);
    v14 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
      v17 = *v13;
      do
        v18 = __ldaxr(v15);
      while (__stlxr(v18 - 1, v15));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    else
    {
      v17 = *v13;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.bf_len) = 0;
      _os_log_error_impl(&dword_20DA91000, v17, OS_LOG_TYPE_ERROR, "Warning: Unable to mark socket as non blocking", (uint8_t *)&buf, 2u);
    }
  }
  v29 = pcap_snapshot(v6);
  if (v29 >= 1523)
  {
    v30 = pcap_set_snaplen(v6, v29);
    v31 = (NSObject **)*((_QWORD *)this + 3);
    v32 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v30)
    {
      if (v32)
      {
        v33 = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
        v35 = *v31;
        do
          v36 = __ldaxr(v33);
        while (__stlxr(v36 - 1, v33));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      else
      {
        v35 = *v31;
      }
      result = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      LOWORD(buf.bf_len) = 0;
      v26 = "Failed to update snapshot length for read handle";
      p_buf = &buf;
      goto LABEL_86;
    }
    if (v32)
    {
      v37 = (unint64_t *)&v32->__shared_owners_;
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
      v39 = *v31;
      do
        v40 = __ldaxr(v37);
      while (__stlxr(v40 - 1, v37));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    else
    {
      v39 = *v31;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      buf.bf_len = 67109376;
      *(&buf.bf_len + 1) = 1522;
      LOWORD(buf.bf_insns) = 1024;
      *(_DWORD *)((char *)&buf.bf_insns + 2) = v29;
      _os_log_impl(&dword_20DA91000, v39, OS_LOG_TYPE_INFO, "Changed snaplength from %d to %d", (uint8_t *)&buf, 0xEu);
    }
  }
  memset(&buf, 170, sizeof(buf));
  v41 = (char *)this + 72;
  if (*((char *)this + 95) < 0)
    v41 = *(const char **)v41;
  if (!pcap_compile(v6, &buf, v41, 1, 0xFFFFFFFF))
  {
    if (!pcap_setfilter(v6, &buf))
    {
      pcap_freecode(&buf);
      return telephonytransport::NetworkIface::startReading(this, v6);
    }
    v47 = (NSObject **)*((_QWORD *)this + 3);
    v48 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v48)
    {
      v49 = (unint64_t *)&v48->__shared_owners_;
      do
        v50 = __ldxr(v49);
      while (__stxr(v50 + 1, v49));
      v35 = *v47;
      do
        v51 = __ldaxr(v49);
      while (__stlxr(v51 - 1, v49));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    else
    {
      v35 = *v47;
    }
    result = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    LOWORD(v53) = 0;
    v26 = "Unable to set filter";
    p_buf = (bpf_program *)&v53;
LABEL_86:
    v28 = v35;
    v52 = 2;
    goto LABEL_87;
  }
  v42 = (NSObject **)*((_QWORD *)this + 3);
  v43 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (v43)
  {
    v44 = (unint64_t *)&v43->__shared_owners_;
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
    v11 = *v42;
    do
      v46 = __ldaxr(v44);
    while (__stlxr(v46 - 1, v44));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  else
  {
    v11 = *v42;
  }
  result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    v53 = 136315138;
    v54 = pcap_geterr(v6);
    v26 = "Unable to compile filter expression, error: %s";
    p_buf = (bpf_program *)&v53;
    goto LABEL_80;
  }
  return result;
}

BOOL telephonytransport::NetworkIface::verifyDataLinkType(telephonytransport::NetworkIface *this, pcap *a2)
{
  int v3;
  int v4;
  _BOOL8 result;
  NSObject **v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject **v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject **v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  const char *v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v6 = (NSObject **)*((_QWORD *)this + 3);
    v7 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      v10 = *v6;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    else
    {
      v10 = *v6;
    }
    result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    LOWORD(v29) = 0;
    v24 = "No valid handle exists to determine link type.";
    v25 = v10;
    v26 = 2;
LABEL_35:
    _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v29, v26);
    return 0;
  }
  v3 = pcap_datalink(a2);
  v4 = v3;
  if (v3 < 0)
  {
    v12 = (NSObject **)*((_QWORD *)this + 3);
    v13 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v13)
    {
      v14 = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      v16 = *v12;
      do
        v17 = __ldaxr(v14);
      while (__stlxr(v17 - 1, v14));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    else
    {
      v16 = *v12;
    }
    result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    v29 = 67109120;
    LODWORD(v30) = v4;
    v24 = "Failed to determine link type. pcap_datalink returned: %d";
    v25 = v16;
    v26 = 8;
    goto LABEL_35;
  }
  if (v3 == *((_DWORD *)this + 16))
    return 1;
  v18 = (NSObject **)*((_QWORD *)this + 3);
  v19 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
    v22 = *v18;
    do
      v23 = __ldaxr(v20);
    while (__stlxr(v23 - 1, v20));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  else
  {
    v22 = *v18;
  }
  result = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v27 = pcap_datalink_val_to_description(v4);
    v28 = pcap_datalink_val_to_description(*((_DWORD *)this + 16));
    v29 = 136315394;
    v30 = v27;
    v31 = 2080;
    v32 = v28;
    v24 = "Data link type is: %s ; Expected: %s";
    v25 = v22;
    v26 = 22;
    goto LABEL_35;
  }
  return result;
}

BOOL telephonytransport::NetworkIface::startReading(telephonytransport::NetworkIface *this, pcap *a2)
{
  NSObject **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  int selectable_fd;
  int v11;
  dispatch_source_t v12;
  NSObject *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_weak_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  NSObject *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  _BOOL8 result;
  NSObject **v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  unint64_t v40;
  NSObject **v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  NSObject **v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  const char *v52;
  int *v53;
  char *v54;
  NSObject *v55;
  uint32_t v56;
  _QWORD v57[5];
  _QWORD handler[5];
  std::__shared_weak_count *v59;
  pcap *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint8_t buf[4];
  char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 14))
  {
    v3 = (NSObject **)*((_QWORD *)this + 3);
    v4 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
      v7 = *v3;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *, pcap *))v4->__on_zero_shared)(v4, a2);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      v7 = *v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v7, OS_LOG_TYPE_ERROR, "Warning: Already started reading", buf, 2u);
    }
    return 1;
  }
  selectable_fd = pcap_get_selectable_fd(a2);
  if (selectable_fd == -1)
  {
    v35 = (NSObject **)*((_QWORD *)this + 3);
    v36 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v36)
    {
      v37 = (unint64_t *)&v36->__shared_owners_;
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
      v39 = *v35;
      do
        v40 = __ldaxr(v37);
      while (__stlxr(v40 - 1, v37));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    else
    {
      v39 = *v35;
    }
    result = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      v52 = "Unable to retrieve a selectable fd";
LABEL_75:
      v55 = v39;
      v56 = 2;
      goto LABEL_76;
    }
  }
  else
  {
    v11 = selectable_fd;
    {
      v41 = (NSObject **)*((_QWORD *)this + 3);
      v42 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
      if (v42)
      {
        v43 = (unint64_t *)&v42->__shared_owners_;
        do
          v44 = __ldxr(v43);
        while (__stxr(v44 + 1, v43));
        v45 = *v41;
        do
          v46 = __ldaxr(v43);
        while (__stlxr(v46 - 1, v43));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
      else
      {
        v45 = *v41;
      }
      result = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
      if (result)
      {
        v53 = __error();
        v54 = strerror(*v53);
        *(_DWORD *)buf = 136315138;
        v64 = v54;
        v52 = "Unable to set immediate mode, error: %s";
        v55 = v45;
        v56 = 12;
LABEL_76:
        _os_log_error_impl(&dword_20DA91000, v55, OS_LOG_TYPE_ERROR, v52, buf, v56);
        return 0;
      }
    }
    else
    {
      v12 = dispatch_source_create(MEMORY[0x24BDACA00], v11, 0, *((dispatch_queue_t *)this + 15));
      v13 = *((_QWORD *)this + 14);
      *((_QWORD *)this + 14) = v12;
      if (v13)
      {
        dispatch_release(v13);
        v12 = (dispatch_source_t)*((_QWORD *)this + 14);
      }
      if (v12)
      {
        v14 = *((_QWORD *)this + 1);
        v15 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v15)
        {
          p_shared_weak_owners = (unint64_t *)&v15->__shared_weak_owners_;
          do
            v17 = __ldxr(p_shared_weak_owners);
          while (__stxr(v17 + 1, p_shared_weak_owners));
        }
        v18 = *((_QWORD *)this + 3);
        v19 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
        if (v19)
        {
          v20 = (unint64_t *)&v19->__shared_owners_;
          do
            v21 = __ldxr(v20);
          while (__stxr(v21 + 1, v20));
        }
        v22 = *((_QWORD *)this + 14);
        v23 = MEMORY[0x24BDAC760];
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 1174405120;
        handler[2] = ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke;
        handler[3] = &__block_descriptor_tmp_2;
        handler[4] = v14;
        v59 = v15;
        if (v15)
        {
          v24 = (unint64_t *)&v15->__shared_weak_owners_;
          do
            v25 = __ldxr(v24);
          while (__stxr(v25 + 1, v24));
        }
        v60 = a2;
        v61 = v18;
        v62 = v19;
        if (v19)
        {
          v26 = (unint64_t *)&v19->__shared_owners_;
          do
            v27 = __ldxr(v26);
          while (__stxr(v27 + 1, v26));
        }
        dispatch_source_set_event_handler(v22, handler);
        v28 = *((_QWORD *)this + 14);
        v57[0] = v23;
        v57[1] = 0x40000000;
        v57[2] = ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke_3;
        v57[3] = &__block_descriptor_tmp_4_0;
        v57[4] = a2;
        dispatch_source_set_cancel_handler(v28, v57);
        dispatch_resume(*((dispatch_object_t *)this + 14));
        v29 = v62;
        if (v62)
        {
          v30 = (unint64_t *)&v62->__shared_owners_;
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
        if (v59)
          std::__shared_weak_count::__release_weak(v59);
        if (v19)
        {
          v32 = (unint64_t *)&v19->__shared_owners_;
          do
            v33 = __ldaxr(v32);
          while (__stlxr(v33 - 1, v32));
          if (!v33)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        if (v15)
          std::__shared_weak_count::__release_weak(v15);
        return 1;
      }
      v47 = (NSObject **)*((_QWORD *)this + 3);
      v48 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
      if (v48)
      {
        v49 = (unint64_t *)&v48->__shared_owners_;
        do
          v50 = __ldxr(v49);
        while (__stxr(v50 + 1, v49));
        v39 = *v47;
        do
          v51 = __ldaxr(v49);
        while (__stlxr(v51 - 1, v49));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
          std::__shared_weak_count::__release_weak(v48);
        }
      }
      else
      {
        v39 = *v47;
      }
      result = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v52 = "Unable to create read source";
        goto LABEL_75;
      }
    }
  }
  return result;
}

BOOL telephonytransport::NetworkIface::initializeWriter(telephonytransport::NetworkIface *this, char *a2)
{
  const char *v4;
  pcap *v5;
  NSObject **v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  int v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)this + 40;
  if (*((char *)this + 63) < 0)
    v4 = *(const char **)v4;
  v5 = pcap_open_live(v4, 1522, 1, 10, a2);
  *((_QWORD *)this + 13) = v5;
  if (v5)
  {
    telephonytransport::NetworkIface::verifyDataLinkType(this, v5);
  }
  else
  {
    v6 = (NSObject **)*((_QWORD *)this + 3);
    v7 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      v10 = *v6;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    else
    {
      v10 = *v6;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = a2;
      _os_log_error_impl(&dword_20DA91000, v10, OS_LOG_TYPE_ERROR, "Unable to create write handle! Details: %s", (uint8_t *)&v13, 0xCu);
    }
  }
  return v5 != 0;
}

BOOL telephonytransport::NetworkIface::write(telephonytransport::NetworkIface *this, const unsigned __int8 *a2, size_t a3)
{
  telephonytransport::NetworkIface *v3;
  NSObject **v4;
  NSObject *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  NSObject **v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  _QWORD *v16;
  char *v17;
  _BYTE v18[22];
  uint64_t v19;

  v3 = this;
  v19 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 24))
  {
    v4 = (NSObject **)*((_QWORD *)this + 3);
    v3 = (telephonytransport::NetworkIface *)*((_QWORD *)this + 4);
    if (v3)
    {
      v6 = (unint64_t *)((char *)v3 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      v5 = *v4;
      do
        v8 = __ldaxr(v6);
      while (__stlxr(v8 - 1, v6));
      if (!v8)
      {
        (*(void (**)(telephonytransport::NetworkIface *, const unsigned __int8 *))(*(_QWORD *)v3 + 16))(v3, a2);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v3);
      }
    }
    else
    {
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl(&dword_20DA91000, v5, OS_LOG_TYPE_FAULT, "Write is not supported", v18, 2u);
    }
    __break(1u);
  }
  v9 = pcap_inject(*((pcap_t **)v3 + 13), a2, a3);
  if (v9 == -1)
  {
    v10 = (NSObject **)*((_QWORD *)v3 + 3);
    v11 = *((_QWORD *)v3 + 4);
    *(_QWORD *)v18 = v10;
    *(_QWORD *)&v18[8] = v11;
    if (v11)
    {
      v12 = (unint64_t *)(v11 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v14 = *v10;
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (_QWORD *)((char *)v3 + 40);
      if (*((char *)v3 + 63) < 0)
        v16 = (_QWORD *)*v16;
      v17 = pcap_geterr(*((pcap_t **)v3 + 13));
      *(_DWORD *)v18 = 136315394;
      *(_QWORD *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2080;
      *(_QWORD *)&v18[14] = v17;
      _os_log_error_impl(&dword_20DA91000, v14, OS_LOG_TYPE_ERROR, "Failed to write packet to %s, error: %s", v18, 0x16u);
    }
  }
  return v9 != -1;
}

void ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  u_char *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      v5 = *(u_char **)(a1 + 32);
      {
        v8 = **(NSObject ***)(a1 + 56);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = pcap_geterr(*(pcap_t **)(a1 + 48));
          v10 = 136315138;
          v11 = v9;
          _os_log_error_impl(&dword_20DA91000, v8, OS_LOG_TYPE_ERROR, "Error encountered while reading: %s", (uint8_t *)&v10, 0xCu);
        }
        exit(1);
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

void sub_20DAA071C(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  p_shared_owners = (unint64_t *)&v1->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t `anonymous namespace'::sReceivePacket(_anonymous_namespace_ *this, unsigned __int8 *a2, const pcap_pkthdr *a3, const unsigned __int8 *a4)
{
  return (*(uint64_t (**)(_anonymous_namespace_ *, const pcap_pkthdr *, _QWORD))(*(_QWORD *)this + 16))(this, a3, *((unsigned int *)a2 + 5));
}

_QWORD *__copy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE56c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
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

void __destroy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE56c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](a1 + 56);
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke_3(uint64_t a1)
{
  pcap_close(*(pcap_t **)(a1 + 32));
}

void std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::TCPClientTransportFactory::createNetwork(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::string __p;
  std::string v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v13 = *(std::string *)a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  telephonytransport::TCPClientSocketFactoryNetwork::create((uint64_t)&v13, (uint64_t)&__p, &v14);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  v5 = v14;
  if (v14)
  {
    v6 = operator new(0x20uLL);
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclienttransport", "factory", v6);
    v7 = v15;
    v6[2] = v5;
    v6[3] = v7;
    v14 = 0;
    v15 = 0;
    *a3 = v6;
    v16 = v6;
    v8 = operator new(0x20uLL);
    *v8 = off_24C80AB68;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = v6;
    a3[1] = v8;
    v16 = 0;
    std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100]((uint64_t *)&v16);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    v9 = (std::__shared_weak_count *)v15;
    if (v15)
    {
      v10 = (unint64_t *)(v15 + 8);
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
}

void sub_20DAA09C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t telephonytransport::TCPClientTransportFactory::TCPClientTransportFactory(uint64_t a1, uint64_t a2)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclienttransport", "factory", (_QWORD *)a1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  return a1;
}

{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclienttransport", "factory", (_QWORD *)a1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  return a1;
}

void telephonytransport::TCPClientTransportFactory::createUSB(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void telephonytransport::TCPClientTransportFactory::connect(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  NSObject *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject **v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  NSObject **v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  dispatch_object_t object;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint8_t buf[16];

  v7 = a2[1];
  if (!v7 || *(_QWORD *)(v7 + 8) == -1)
  {
    v21 = *(NSObject ***)a1;
    v22 = *(std::__shared_weak_count **)(a1 + 8);
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
      v25 = *v21;
      do
        v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    else
    {
      v25 = *v21;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v35 = "Must provide a valid delegate";
    goto LABEL_50;
  }
  if (!*a3)
  {
    v27 = *(NSObject ***)a1;
    v28 = *(std::__shared_weak_count **)(a1 + 8);
    if (v28)
    {
      v29 = (unint64_t *)&v28->__shared_owners_;
      do
        v30 = __ldxr(v29);
      while (__stxr(v30 + 1, v29));
      v25 = *v27;
      do
        v31 = __ldaxr(v29);
      while (__stlxr(v31 - 1, v29));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    else
    {
      v25 = *v27;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v35 = "Providing readQueue is mandatory";
LABEL_50:
    _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, v35, buf, 2u);
LABEL_31:
    *(_QWORD *)a6 = 0;
    *(_QWORD *)(a6 + 8) = 0;
    return;
  }
  memset(buf, 170, sizeof(buf));
  (***(void (****)(uint8_t *__return_ptr, _QWORD, uint64_t))(a1 + 16))(buf, *(_QWORD *)(a1 + 16), a4);
  v11 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v12 = (std::__shared_weak_count *)a2[1];
    v39 = *a2;
    v40 = v12;
    if (v12)
    {
      p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v14 = __ldxr(p_shared_weak_owners);
      while (__stxr(v14 + 1, p_shared_weak_owners));
    }
    v15 = *a3;
    object = v15;
    if (v15)
    {
      dispatch_retain(v15);
      v11 = *(_QWORD *)buf;
    }
    v36 = v11;
    v37 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v16 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    telephonytransport::TCPSocketStream::create((telephonytransport *)&v39, &object, &v36, 2, a5, (std::__shared_weak_count_vtbl **)a6);
    v18 = v37;
    if (v37)
    {
      v19 = (unint64_t *)&v37->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (object)
      dispatch_release(object);
    if (v40)
      std::__shared_weak_count::__release_weak(v40);
  }
  else
  {
    *(_QWORD *)a6 = 0;
    *(_QWORD *)(a6 + 8) = 0;
  }
  v32 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v33 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
}

void sub_20DAA0D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14, char a15)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  if (object)
    dispatch_release(object);
  if (a14)
    std::__shared_weak_count::__release_weak(a14);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1 + 16);
    v2 = (void *)std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketAndEthernetIfaceBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, NSObject **a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, _QWORD *a7@<X8>)
{
  NSObject *v13;
  NSObject *v14;
  telephonytransport *v15;
  std::string::size_type v16;
  std::__shared_weak_count_vtbl *v17;
  _QWORD *v18;
  std::string::size_type size;
  unint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  dispatch_object_t v29;
  std::__shared_weak_count_vtbl *v30;
  unint64_t v31;
  dispatch_object_t object;
  std::string v33;

  v33.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v33.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  v13 = *a2;
  object = v13;
  if (v13)
    dispatch_retain(v13);
  telephonytransport::SocketToEthernetIfaceForwarder::create(a1, a3, &object, a5, a6, &v33);
  if (object)
    dispatch_release(object);
  v30 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v14 = *a4;
  v29 = v14;
  if (v14)
    dispatch_retain(v14);
  telephonytransport::EthernetIfaceToSocketForwarder::create(a3, a1, &v29, a6, &v30);
  v15 = (telephonytransport *)v29;
  if (v29)
    dispatch_release(v29);
  v16 = v33.__r_.__value_.__r.__words[0];
  if (v33.__r_.__value_.__r.__words[0] && (v17 = v30) != 0)
  {
    *a7 = 0xAAAAAAAAAAAAAAAALL;
    a7[1] = 0xAAAAAAAAAAAAAAAALL;
    v18 = operator new(0x20uLL);
    size = v33.__r_.__value_.__l.__size_;
    *v18 = v16;
    v18[1] = size;
    *(_OWORD *)&v33.__r_.__value_.__l.__data_ = 0uLL;
    v20 = v31;
    v18[2] = v17;
    v18[3] = v20;
    v30 = 0;
    v31 = 0;
    *a7 = v18;
    v33.__r_.__value_.__r.__words[2] = (std::string::size_type)v18;
    v21 = operator new(0x20uLL);
    *v21 = off_24C80ABE0;
    v21[1] = 0;
    v21[2] = 0;
    v21[3] = v18;
    a7[1] = v21;
    v33.__r_.__value_.__r.__words[2] = 0;
    std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100]((uint64_t *)&v33.__r_.__value_.__r.__words[2]);
  }
  else
  {
    v22 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v15);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.__r_.__value_.__r.__words[2]) = 0;
      _os_log_error_impl(&dword_20DA91000, v22, OS_LOG_TYPE_ERROR, "Failed to create SocketAndEthernetIfaceBridge", (uint8_t *)&v33.__r_.__value_.__s.__data_[16], 2u);
    }
    *a7 = 0;
    a7[1] = 0;
  }
  v23 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v24 = (unint64_t *)(v31 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = (std::__shared_weak_count *)v33.__r_.__value_.__l.__size_;
  if (v33.__r_.__value_.__l.__size_)
  {
    v27 = (unint64_t *)(v33.__r_.__value_.__l.__size_ + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_20DAA1008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, dispatch_object_t object, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100](&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_20DAA104C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  JUMPOUT(0x20DAA1044);
}

__n128 telephonytransport::SocketAndEthernetIfaceBridge::SocketAndEthernetIfaceBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1 + 16);
    v2 = (void *)std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

double telephonytransport::sBuildLoggingCategory@<D0>(telephonytransport *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  size_t v6;
  std::string *v7;
  __int128 v8;
  std::string __p;
  void *v11[3];

  memset(v11, 170, sizeof(v11));
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)this);
  if (a2 && *a2)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v11, 46, &__p);
    v6 = strlen(a2);
    v7 = std::string::append(&__p, a2, v6);
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    *(std::string *)a3 = *v7;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v11[2]) < 0)
      operator delete(v11[0]);
  }
  else
  {
    *(void **)&v8 = v11[0];
    *(_OWORD *)a3 = *(_OWORD *)v11;
    *(void **)(a3 + 16) = v11[2];
  }
  return *(double *)&v8;
}

void sub_20DAA11EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  size_t v5;
  uint64_t result;
  char *v7;
  const void *v8;
  char *v9;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  memset(a3, 170, 24);
  result = std::string::basic_string[abi:ne180100]((uint64_t)a3, v5 + 1);
  if (*(char *)(result + 23) >= 0)
    v7 = (char *)result;
  else
    v7 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v8 = a1;
    else
      v8 = *a1;
    result = (uint64_t)memmove(v7, v8, v5);
  }
  v9 = &v7[v5];
  *v9 = a2;
  v9[1] = 0;
  return result;
}

void telephonytransport::OSLogHandle::create(telephonytransport::OSLogHandle *this@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v7;
  void **v8;
  void *__p[2];
  char v10;

  v7 = operator new(8uLL);
  telephonytransport::sBuildLoggingCategory(this, a2, (uint64_t)__p);
  if (v10 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  *v7 = os_log_create("com.apple.rtt", (const char *)v8);
  std::shared_ptr<telephonytransport::OSLogHandle>::shared_ptr[abi:ne180100]<telephonytransport::OSLogHandle,void>(a3, (uint64_t)v7);
  if (v10 < 0)
    operator delete(__p[0]);
}

void sub_20DAA1354(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

telephonytransport::OSLogHandle *telephonytransport::OSLogHandle::OSLogHandle(telephonytransport::OSLogHandle *this, const char *subsystem, const char *category)
{
  *(_QWORD *)this = os_log_create(subsystem, category);
  return this;
}

{
  *(_QWORD *)this = os_log_create(subsystem, category);
  return this;
}

uint64_t telephonytransport::OSLogHandle::get(telephonytransport::OSLogHandle *this)
{
  return *(_QWORD *)this;
}

void telephonytransport::OSLogHandle::~OSLogHandle(void **this)
{
  os_release(*this);
}

{
  os_release(*this);
}

telephonytransport::Loggable *telephonytransport::Loggable::Loggable(telephonytransport::Loggable *this, telephonytransport::OSLogHandle *a2, const char *a3)
{
  telephonytransport::OSLogHandle::create(a2, a3, this);
  return this;
}

{
  telephonytransport::OSLogHandle::create(a2, a3, this);
  return this;
}

_QWORD *telephonytransport::Loggable::Loggable(_QWORD *result, _QWORD *a2)
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

__n128 telephonytransport::Loggable::Loggable(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

uint64_t telephonytransport::Loggable::getOSLog(telephonytransport::Loggable *this)
{
  return **(_QWORD **)this;
}

_QWORD *telephonytransport::Loggable::getOSLogHandle@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = this[1];
  *a2 = *this;
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
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

_QWORD *std::shared_ptr<telephonytransport::OSLogHandle>::shared_ptr[abi:ne180100]<telephonytransport::OSLogHandle,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24C80AC58;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_20DAA1604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;

  a10 = 0;
  if (v10)
    std::default_delete<telephonytransport::OSLogHandle>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<telephonytransport::OSLogHandle>::operator()[abi:ne180100](a1 + 24, *(void ***)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<telephonytransport::OSLogHandle>::operator()[abi:ne180100](uint64_t a1, void **a2)
{
  if (a2)
  {
    os_release(*a2);
    operator delete(a2);
  }
}

void telephonytransport::PCIClientTransport::create(NSObject **a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, std::__shared_weak_count_vtbl **a6@<X8>)
{
  std::__shared_weak_count_vtbl *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  __int16 v27;
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v29;
  std::__shared_weak_count *v30;
  __int128 v31;
  std::__shared_weak_count_vtbl *v32;
  std::__shared_weak_count *v33;

  v12 = (std::__shared_weak_count_vtbl *)operator new(0x70uLL);
  telephonytransport::PCIClientTransport::PCIClientTransport(v12, a3, a4, a5);
  v32 = v12;
  v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  p_shared_weak_owners = (unint64_t *)&v13->__shared_weak_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AD30;
  v13[1].__vftable = v12;
  v33 = v13;
  *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = v12;
  v30 = v13;
  do
    v16 = __ldxr(p_shared_weak_owners);
  while (__stxr(v16 + 1, p_shared_weak_owners));
  v17 = *a1;
  object = v17;
  if (v17)
    dispatch_retain(v17);
  telephonytransport::BaseProtocol::create((uint64_t)&v29, &object, a2, 2, a5, (std::__shared_weak_count_vtbl **)&v31);
  if (object)
    dispatch_release(object);
  v18 = v30;
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  if ((_QWORD)v31)
  {
    std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)&v12[2].__on_zero_shared, &v31);
    *a6 = v12;
    a6[1] = (std::__shared_weak_count_vtbl *)v13;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  else
  {
    v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v18);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v27 = 0;
      _os_log_impl(&dword_20DA91000, v20, OS_LOG_TYPE_INFO, "Failed to create base protocol", (uint8_t *)&v27, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
  if (*((_QWORD *)&v31 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v33;
  if (v33)
  {
    v25 = (unint64_t *)&v33->__shared_owners_;
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

void sub_20DAA18A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, char a13, uint64_t a14, char a15)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 96, a2);
  return 1;
}

_QWORD *telephonytransport::PCIClientTransport::PCIClientTransport(_QWORD *a1, uint64_t a2, uint64_t a3, char *a4)
{
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"pciclienttransport", a4, a1 + 1);
  *a1 = &off_24C80ACD0;
  a1[3] = 0xAAAAAAAAAAAAAAAALL;
  v7 = (char *)operator new(0x60uLL);
  *(_QWORD *)v7 = 850045863;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *((_QWORD *)v7 + 10) = 0;
  *((_QWORD *)v7 + 9) = 0;
  *((_QWORD *)v7 + 7) = 0;
  *((_QWORD *)v7 + 8) = v7 + 72;
  *((std::chrono::steady_clock::time_point *)v7 + 11) = std::chrono::steady_clock::now();
  a1[3] = v7;
  v8 = (_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 24);
  if (!v9)
  {
    v8 = a1 + 7;
    goto LABEL_5;
  }
  if (v9 != a2)
  {
    a1[7] = v9;
LABEL_5:
    *v8 = 0;
    goto LABEL_7;
  }
  a1[7] = a1 + 4;
  (*(void (**)(_QWORD))(*(_QWORD *)*v8 + 24))(*v8);
LABEL_7:
  v10 = (_QWORD *)(a3 + 24);
  v11 = *(_QWORD *)(a3 + 24);
  if (v11)
  {
    if (v11 == a3)
    {
      a1[11] = a1 + 8;
      (*(void (**)(_QWORD))(*(_QWORD *)*v10 + 24))(*v10);
      goto LABEL_13;
    }
    a1[11] = v11;
  }
  else
  {
    v10 = a1 + 11;
  }
  *v10 = 0;
LABEL_13:
  a1[12] = 0;
  a1[13] = 0;
  return a1;
}

void sub_20DAA1A58(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_DWORD *telephonytransport::PCIClientTransport::getNextMessageId@<X0>(telephonytransport::PCIClientTransport *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  _DWORD *result;
  unint64_t *v7;
  unint64_t v8;
  char v9;

  *a3 = 0xAAAAAAAAAAAAAAAALL;
  result = operator new(0x18uLL);
  *(_QWORD *)result = off_24C80B308;
  result[5] = 0;
  *a3 = result;
  v7 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  v9 = *((_BYTE *)result + 20);
  *((_QWORD *)result + 1) = v8;
  *((_BYTE *)result + 20) = v9 | 3;
  result[4] = a2;
  return result;
}

uint64_t telephonytransport::PCIClientTransport::transportCreate(telephonytransport::PCIClientTransport *this, int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, unsigned int *a8)
{
  __int128 v14;
  _DWORD *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  NSObject **v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  NSObject **v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  NSObject *v32;
  unint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  NSObject **v40;
  std::__shared_weak_count *v41;
  NSObject *v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  NSObject **v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  NSObject *v50;
  unint64_t v51;
  unsigned int v52;
  NSObject **v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  const char *v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  NSObject **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  NSObject *v69;
  unint64_t v70;
  NSObject **v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  NSObject *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  NSObject **v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  unint64_t v87;
  const char *v88;
  void **v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  int v93;
  void **v94;
  void **v95;
  _BYTE *v96;
  NSObject **v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  NSObject **v101;
  uint64_t v102;
  unint64_t *v103;
  unint64_t v104;
  NSObject *v105;
  _BYTE *v106;
  unint64_t v108;
  unint64_t v109;
  void (**v110)(telephonytransport::PCICreateRequest *__hidden);
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  void *v114;
  std::__shared_weak_count *v115;
  char v116;
  uint64_t v117;
  _BYTE v118[12];
  char v119;
  _BYTE __p[22];
  __int16 v121;
  _BYTE *v122;
  uint8_t buf[4];
  _BYTE v124[12];
  std::__shared_weak_count *v125;
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v112 = v14;
  v113 = v14;
  v110 = off_24C80B378;
  v111 = 0;
  DWORD2(v113) = 16;
  LODWORD(v113) = a2;
  v15 = operator new(0x18uLL);
  v16 = (uint64_t)v15;
  *(_QWORD *)v15 = off_24C80B308;
  v15[5] = 0;
  v17 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 + 1, v17));
  v19 = *((_BYTE *)v15 + 20);
  *((_QWORD *)v15 + 1) = v18;
  *((_BYTE *)v15 + 20) = v19 | 3;
  v15[4] = 0;
  v20 = v111;
  v111 = v16;
  if (v20)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    v18 = *(_QWORD *)(v16 + 8);
  }
  DWORD1(v113) = a5;
  HIDWORD(v112) = a6;
  BYTE8(v113) |= 0x2Fu;
  LODWORD(v112) = a7;
  *(_QWORD *)((char *)&v112 + 4) = __PAIR64__(a4, a3);
  v108 = 0xAAAAAAAAAAAAAAAALL;
  v109 = 0xAAAAAAAAAAAAAAAALL;
  v117 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v18, &v117);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 1u, (const PB::Base *)&v110) & 1) == 0)
  {
    v28 = (NSObject **)*((_QWORD *)this + 1);
    v29 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v31 = __ldxr(p_shared_owners);
      while (__stxr(v31 + 1, p_shared_owners));
      v32 = *v28;
      do
        v33 = __ldaxr(p_shared_owners);
      while (__stlxr(v33 - 1, p_shared_owners));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    else
    {
      v32 = *v28;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
      v34 = v121 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v124 = v34;
      _os_log_error_impl(&dword_20DA91000, v32, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v121) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v21 = v117;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v21, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v22 = (NSObject **)*((_QWORD *)this + 1);
    v23 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v23)
    {
      v24 = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
      v26 = *v22;
      do
        v27 = __ldaxr(v24);
      while (__stlxr(v27 - 1, v24));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    else
    {
      v26 = *v22;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v26, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v18);
LABEL_41:
    v108 = 0;
    v109 = 0;
    goto LABEL_42;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v117);
  if (*(_DWORD *)buf != 2)
  {
    v65 = (NSObject **)*((_QWORD *)this + 1);
    v66 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v66)
    {
      v67 = (unint64_t *)&v66->__shared_owners_;
      do
        v68 = __ldxr(v67);
      while (__stxr(v68 + 1, v67));
      v69 = *v65;
      do
        v70 = __ldaxr(v67);
      while (__stlxr(v70 - 1, v67));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
    else
    {
      v69 = *v65;
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v114, "kCreateResponse");
      v93 = v116;
      v94 = (void **)v114;
      telephonytransport::toString(*(unsigned int *)buf, v118);
      v95 = &v114;
      if (v93 < 0)
        v95 = v94;
      if (v119 >= 0)
        v96 = v118;
      else
        v96 = *(_BYTE **)v118;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v18;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v95;
      v121 = 2080;
      v122 = v96;
      _os_log_error_impl(&dword_20DA91000, v69, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v119 < 0)
        operator delete(*(void **)v118);
      if (v116 < 0)
        operator delete(v114);
    }
    v108 = 0;
    v109 = 0;
    goto LABEL_98;
  }
  v35 = *(_QWORD *)&v124[4];
  v36 = (unint64_t)v125;
  if (v125)
  {
    v37 = (unint64_t *)&v125->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  v114 = (void *)v35;
  v115 = (std::__shared_weak_count *)v36;
  if (!v35)
  {
    v71 = (NSObject **)*((_QWORD *)this + 1);
    v72 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v72)
    {
      v73 = (unint64_t *)&v72->__shared_owners_;
      do
        v74 = __ldxr(v73);
      while (__stxr(v74 + 1, v73));
      v75 = *v71;
      do
        v76 = __ldaxr(v73);
      while (__stlxr(v76 - 1, v73));
      if (!v76)
      {
        ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
        std::__shared_weak_count::__release_weak(v72);
      }
    }
    else
    {
      v75 = *v71;
    }
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_123;
    *(_WORD *)__p = 0;
    v88 = "No response";
LABEL_139:
    _os_log_error_impl(&dword_20DA91000, v75, OS_LOG_TYPE_ERROR, v88, __p, 2u);
    goto LABEL_123;
  }
  v39 = *(_QWORD *)(v35 + 8);
  if (!v39)
  {
    v80 = (NSObject **)*((_QWORD *)this + 1);
    v81 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v81)
    {
      v82 = (unint64_t *)&v81->__shared_owners_;
      do
        v83 = __ldxr(v82);
      while (__stxr(v83 + 1, v82));
      v75 = *v80;
      do
        v84 = __ldaxr(v82);
      while (__stlxr(v84 - 1, v82));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
    }
    else
    {
      v75 = *v80;
    }
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_123;
    *(_WORD *)__p = 0;
    v88 = "Response doesn't contain messageId";
    goto LABEL_139;
  }
  if (!telephonytransport::PCIMessageId::operator==(v39, v111))
  {
    v40 = (NSObject **)*((_QWORD *)this + 1);
    v41 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v41)
    {
      v85 = (unint64_t *)&v41->__shared_owners_;
      do
        v86 = __ldxr(v85);
      while (__stxr(v86 + 1, v85));
      v42 = *v40;
      do
        v87 = __ldaxr(v85);
      while (__stlxr(v87 - 1, v85));
      if (!v87)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    else
    {
      v42 = *v40;
    }
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      goto LABEL_68;
    *(_WORD *)__p = 0;
    v58 = "Response messageId must match request messageId";
LABEL_67:
    _os_log_fault_impl(&dword_20DA91000, v42, OS_LOG_TYPE_FAULT, v58, __p, 2u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if ((*(_BYTE *)(v35 + 24) & 2) == 0)
  {
    v97 = (NSObject **)*((_QWORD *)this + 1);
    v98 = *((_QWORD *)this + 2);
    *(_QWORD *)__p = v97;
    *(_QWORD *)&__p[8] = v98;
    if (v98)
    {
      v99 = (unint64_t *)(v98 + 8);
      do
        v100 = __ldxr(v99);
      while (__stxr(v100 + 1, v99));
    }
    v75 = *v97;
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_123;
    *(_WORD *)__p = 0;
    v88 = "Response doesn't contain result";
    goto LABEL_139;
  }
  if (!*(_DWORD *)(v35 + 20))
  {
    v108 = v35;
    v109 = v36;
    v89 = &v114;
    goto LABEL_124;
  }
  v101 = (NSObject **)*((_QWORD *)this + 1);
  v102 = *((_QWORD *)this + 2);
  *(_QWORD *)__p = v101;
  *(_QWORD *)&__p[8] = v102;
  if (v102)
  {
    v103 = (unint64_t *)(v102 + 8);
    do
      v104 = __ldxr(v103);
    while (__stxr(v104 + 1, v103));
  }
  v105 = *v101;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
    v106 = v121 >= 0 ? __p : *(_BYTE **)__p;
    *(_DWORD *)v118 = 136315138;
    *(_QWORD *)&v118[4] = v106;
    _os_log_error_impl(&dword_20DA91000, v105, OS_LOG_TYPE_ERROR, "%s failed", v118, 0xCu);
    if (SHIBYTE(v121) < 0)
      operator delete(*(void **)__p);
  }
LABEL_123:
  v89 = (void **)&v108;
LABEL_124:
  *v89 = 0;
  v89[1] = 0;
  v90 = v115;
  if (v115)
  {
    v91 = (unint64_t *)&v115->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
LABEL_98:
  v77 = v125;
  if (v125)
  {
    v78 = (unint64_t *)&v125->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }
LABEL_42:
  v43 = v117;
  if (v117)
  {
    v44 = (unint64_t *)(v117 + 8);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
      (*(void (**)(uint64_t))(*(_QWORD *)v43 + 16))(v43);
  }
  if (!v108)
    goto LABEL_72;
  if ((*(_BYTE *)(v108 + 24) & 1) != 0)
  {
    v52 = *(_DWORD *)(v108 + 16);
    if (v52)
    {
      *a8 = v52;
      v59 = 1;
      goto LABEL_73;
    }
    v53 = (NSObject **)*((_QWORD *)this + 1);
    v54 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v54)
    {
      v55 = (unint64_t *)&v54->__shared_owners_;
      do
        v56 = __ldxr(v55);
      while (__stxr(v56 + 1, v55));
      v42 = *v53;
      do
        v57 = __ldaxr(v55);
      while (__stlxr(v57 - 1, v55));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    else
    {
      v42 = *v53;
    }
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      goto LABEL_68;
    *(_WORD *)__p = 0;
    v58 = "Create must return valid token";
    goto LABEL_67;
  }
  v46 = (NSObject **)*((_QWORD *)this + 1);
  v47 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v47)
  {
    v48 = (unint64_t *)&v47->__shared_owners_;
    do
      v49 = __ldxr(v48);
    while (__stxr(v49 + 1, v48));
    v50 = *v46;
    do
      v51 = __ldaxr(v48);
    while (__stlxr(v51 - 1, v48));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
    goto LABEL_70;
  }
LABEL_69:
  v50 = *v46;
LABEL_70:
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    _os_log_error_impl(&dword_20DA91000, v50, OS_LOG_TYPE_ERROR, "Created transport token is missing", __p, 2u);
  }
LABEL_72:
  v59 = 0;
LABEL_73:
  v60 = (std::__shared_weak_count *)v109;
  if (v109)
  {
    v61 = (unint64_t *)(v109 + 8);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = v111;
  v110 = off_24C80B378;
  v111 = 0;
  if (v63)
    (*(void (**)(uint64_t))(*(_QWORD *)v63 + 8))(v63);
  PB::Base::~Base((PB::Base *)&v110);
  return v59;
}

void sub_20DAA244C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v25 - 120);
  v27 = a25;
  if (a25)
  {
    v28 = (unint64_t *)(a25 + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
  }
  telephonytransport::PCICreateRequest::~PCICreateRequest((telephonytransport::PCICreateRequest *)&a13);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::transportFree(telephonytransport::PCIClientTransport *this, int a2)
{
  _DWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject **v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject **v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  NSObject **v29;
  std::__shared_weak_count *v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  NSObject **v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  NSObject **v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  NSObject *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject **v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  const char *v64;
  void **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  void **v70;
  void **v71;
  _BYTE *v72;
  NSObject **v73;
  uint64_t v74;
  unint64_t *v75;
  unint64_t v76;
  NSObject **v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  NSObject *v81;
  _BYTE *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  void (**v85)(telephonytransport::PCIFreeRequest *__hidden);
  uint64_t v86;
  void *v87;
  std::__shared_weak_count *v88;
  char v89;
  uint64_t v90;
  _BYTE v91[12];
  char v92;
  _BYTE __p[22];
  __int16 v94;
  _BYTE *v95;
  uint8_t buf[4];
  _BYTE v97[12];
  std::__shared_weak_count *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v85 = off_24C80B538;
  v86 = 0;
  v4 = operator new(0x18uLL);
  v5 = (uint64_t)v4;
  *(_QWORD *)v4 = off_24C80B308;
  v4[5] = 0;
  v6 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  v8 = *((_BYTE *)v4 + 20);
  *((_QWORD *)v4 + 1) = v7;
  *((_BYTE *)v4 + 20) = v8 | 3;
  v4[4] = a2;
  v9 = v86;
  v86 = v5;
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v7 = *(_QWORD *)(v5 + 8);
  }
  v90 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v7, &v90);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 9u, (const PB::Base *)&v85) & 1) == 0)
  {
    v17 = (NSObject **)*((_QWORD *)this + 1);
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      v21 = *v17;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    else
    {
      v21 = *v17;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
      v23 = v94 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v23;
      _os_log_error_impl(&dword_20DA91000, v21, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v94) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v10 = v90;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v10, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v11 = (NSObject **)*((_QWORD *)this + 1);
    v12 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
      v15 = *v11;
      do
        v16 = __ldaxr(v13);
      while (__stlxr(v16 - 1, v13));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    else
    {
      v15 = *v11;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v15, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v7);
LABEL_41:
    v83 = 0;
    v84 = 0;
    goto LABEL_42;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v90);
  if (*(_DWORD *)buf != 10)
  {
    v41 = (NSObject **)*((_QWORD *)this + 1);
    v42 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
      v45 = *v41;
      do
        v46 = __ldaxr(v43);
      while (__stlxr(v46 - 1, v43));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    else
    {
      v45 = *v41;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v87, "kFreeResponse");
      v69 = v89;
      v70 = (void **)v87;
      telephonytransport::toString(*(unsigned int *)buf, v91);
      v71 = &v87;
      if (v69 < 0)
        v71 = v70;
      if (v92 >= 0)
        v72 = v91;
      else
        v72 = *(_BYTE **)v91;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v7;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v71;
      v94 = 2080;
      v95 = v72;
      _os_log_error_impl(&dword_20DA91000, v45, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v92 < 0)
        operator delete(*(void **)v91);
      if (v89 < 0)
        operator delete(v87);
    }
    v83 = 0;
    v84 = 0;
    goto LABEL_72;
  }
  v24 = *(_QWORD *)&v97[4];
  v25 = v98;
  if (v98)
  {
    v26 = (unint64_t *)&v98->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v87 = (void *)v24;
  v88 = v25;
  if (v24)
  {
    v28 = *(_QWORD *)(v24 + 8);
    if (!v28)
    {
      v56 = (NSObject **)*((_QWORD *)this + 1);
      v57 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v57)
      {
        v58 = (unint64_t *)&v57->__shared_owners_;
        do
          v59 = __ldxr(v58);
        while (__stxr(v59 + 1, v58));
        v51 = *v56;
        do
          v60 = __ldaxr(v58);
        while (__stlxr(v60 - 1, v58));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }
      else
      {
        v51 = *v56;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_98;
      *(_WORD *)__p = 0;
      v64 = "Response doesn't contain messageId";
      goto LABEL_114;
    }
    if (telephonytransport::PCIMessageId::operator==(v28, v86))
    {
      if ((*(_BYTE *)(v24 + 20) & 1) == 0)
      {
        v73 = (NSObject **)*((_QWORD *)this + 1);
        v74 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v73;
        *(_QWORD *)&__p[8] = v74;
        if (v74)
        {
          v75 = (unint64_t *)(v74 + 8);
          do
            v76 = __ldxr(v75);
          while (__stxr(v76 + 1, v75));
        }
        v51 = *v73;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          goto LABEL_98;
        *(_WORD *)__p = 0;
        v64 = "Response doesn't contain result";
        goto LABEL_114;
      }
      if (!*(_DWORD *)(v24 + 16))
      {
        v83 = v24;
        v84 = v25;
        v65 = &v87;
        goto LABEL_99;
      }
      v77 = (NSObject **)*((_QWORD *)this + 1);
      v78 = *((_QWORD *)this + 2);
      *(_QWORD *)__p = v77;
      *(_QWORD *)&__p[8] = v78;
      if (v78)
      {
        v79 = (unint64_t *)(v78 + 8);
        do
          v80 = __ldxr(v79);
        while (__stxr(v80 + 1, v79));
      }
      v81 = *v77;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
        v82 = v94 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)v91 = 136315138;
        *(_QWORD *)&v91[4] = v82;
        _os_log_error_impl(&dword_20DA91000, v81, OS_LOG_TYPE_ERROR, "%s failed", v91, 0xCu);
        if (SHIBYTE(v94) < 0)
          operator delete(*(void **)__p);
      }
      goto LABEL_98;
    }
    v29 = (NSObject **)*((_QWORD *)this + 1);
    v30 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v30)
    {
      v61 = (unint64_t *)&v30->__shared_owners_;
      do
        v62 = __ldxr(v61);
      while (__stxr(v62 + 1, v61));
      v31 = *v29;
      do
        v63 = __ldaxr(v61);
      while (__stlxr(v63 - 1, v61));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    else
    {
      v31 = *v29;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_fault_impl(&dword_20DA91000, v31, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
    }
    __break(1u);
    goto LABEL_93;
  }
  v47 = (NSObject **)*((_QWORD *)this + 1);
  v48 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v48)
  {
LABEL_93:
    v51 = *v47;
    goto LABEL_94;
  }
  v49 = (unint64_t *)&v48->__shared_owners_;
  do
    v50 = __ldxr(v49);
  while (__stxr(v50 + 1, v49));
  v51 = *v47;
  do
    v52 = __ldaxr(v49);
  while (__stlxr(v52 - 1, v49));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
LABEL_94:
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    v64 = "No response";
LABEL_114:
    _os_log_error_impl(&dword_20DA91000, v51, OS_LOG_TYPE_ERROR, v64, __p, 2u);
  }
LABEL_98:
  v65 = (void **)&v83;
LABEL_99:
  *v65 = 0;
  v65[1] = 0;
  v66 = v88;
  if (v88)
  {
    v67 = (unint64_t *)&v88->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
LABEL_72:
  v53 = v98;
  if (v98)
  {
    v54 = (unint64_t *)&v98->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
LABEL_42:
  v32 = v90;
  if (v90)
  {
    v33 = (unint64_t *)(v90 + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
  }
  v36 = v83;
  v35 = v84;
  if (v84)
  {
    v37 = (unint64_t *)&v84->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v39 = v86;
  v85 = off_24C80B538;
  v86 = 0;
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  PB::Base::~Base((PB::Base *)&v85);
  return v36 != 0;
}

void sub_20DAA2CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v19 - 72);
  v21 = a19;
  if (a19)
  {
    v22 = (unint64_t *)(a19 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
  }
  telephonytransport::PCIFreeRequest::~PCIFreeRequest((telephonytransport::PCIFreeRequest *)&a11);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::read(telephonytransport::PCIClientTransport *this, int a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, NSObject *a6)
{
  _DWORD *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  NSObject **v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  NSObject **v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  NSObject *v29;
  unint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  NSObject **v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  size_t v41;
  NSObject **v42;
  NSObject **v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  NSObject *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  const char *v52;
  NSObject **v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  NSObject *v57;
  unint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  NSObject **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  NSObject *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  NSObject **v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  const char *v82;
  void **v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  int v87;
  void **v88;
  void **v89;
  _BYTE *v90;
  NSObject **v91;
  uint64_t v92;
  unint64_t *v93;
  unint64_t v94;
  NSObject **v95;
  uint64_t v96;
  unint64_t *v97;
  unint64_t v98;
  NSObject *v99;
  _BYTE *v100;
  unint64_t v101;
  unint64_t v102;
  void (**v103)(telephonytransport::PCIReadRequest *__hidden);
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  void *v107;
  std::__shared_weak_count *v108;
  char v109;
  uint64_t v110;
  _BYTE v111[12];
  char v112;
  _BYTE __p[22];
  __int16 v114;
  _BYTE *v115;
  uint8_t buf[4];
  _BYTE v117[12];
  std::__shared_weak_count *v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v105 = 0xAAAAAAAAAAAAAAAALL;
  v103 = off_24C80B458;
  v104 = 0;
  v106 = 0xAAAAAAAA00000000;
  v12 = operator new(0x18uLL);
  v13 = (uint64_t)v12;
  *(_QWORD *)v12 = off_24C80B308;
  v12[5] = 0;
  v14 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 + 1, v14));
  v16 = *((_BYTE *)v12 + 20);
  *((_QWORD *)v12 + 1) = v15;
  *((_BYTE *)v12 + 20) = v16 | 3;
  v12[4] = a2;
  v17 = v104;
  v104 = v13;
  if (v17)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    v15 = *(_QWORD *)(v13 + 8);
  }
  LOBYTE(v106) = v106 | 3;
  v105 = __PAIR64__(a4, a3);
  v101 = 0xAAAAAAAAAAAAAAAALL;
  v102 = 0xAAAAAAAAAAAAAAAALL;
  v110 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v15, &v110);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 3u, (const PB::Base *)&v103) & 1) == 0)
  {
    v25 = (NSObject **)*((_QWORD *)this + 1);
    v26 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldxr(p_shared_owners);
      while (__stxr(v28 + 1, p_shared_owners));
      v29 = *v25;
      do
        v30 = __ldaxr(p_shared_owners);
      while (__stlxr(v30 - 1, p_shared_owners));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    else
    {
      v29 = *v25;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
      v31 = v114 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v117 = v31;
      _os_log_error_impl(&dword_20DA91000, v29, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v114) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v18 = v110;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (!std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v18, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v110);
    if (*(_DWORD *)buf != 4)
      goto LABEL_69;
    v15 = *(_QWORD *)&v117[4];
    v32 = (unint64_t)v118;
    if (v118)
    {
      v33 = (unint64_t *)&v118->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v107 = (void *)v15;
    v108 = (std::__shared_weak_count *)v32;
    if (v15)
    {
      v35 = *(_QWORD *)(v15 + 16);
      if (v35)
      {
        if (!telephonytransport::PCIMessageId::operator==(v35, v104))
        {
          v36 = (NSObject **)*((_QWORD *)this + 1);
          this = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 2);
          if (this)
          {
            v79 = (unint64_t *)((char *)this + 8);
            do
              v80 = __ldxr(v79);
            while (__stxr(v80 + 1, v79));
            a6 = *v36;
            do
              v81 = __ldaxr(v79);
            while (__stlxr(v81 - 1, v79));
            if (!v81)
            {
              (*(void (**)(telephonytransport::PCIClientTransport *))(*(_QWORD *)this + 16))(this);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)this);
            }
          }
          else
          {
            a6 = *v36;
          }
          if (!os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
            goto LABEL_68;
          *(_WORD *)__p = 0;
          v52 = "Response messageId must match request messageId";
          goto LABEL_67;
        }
        if ((*(_BYTE *)(v15 + 28) & 1) != 0)
        {
          if (!*(_DWORD *)(v15 + 24))
          {
            v101 = v15;
            v102 = v32;
            v83 = &v107;
            goto LABEL_124;
          }
          v95 = (NSObject **)*((_QWORD *)this + 1);
          v96 = *((_QWORD *)this + 2);
          *(_QWORD *)__p = v95;
          *(_QWORD *)&__p[8] = v96;
          if (v96)
          {
            v97 = (unint64_t *)(v96 + 8);
            do
              v98 = __ldxr(v97);
            while (__stxr(v98 + 1, v97));
          }
          v99 = *v95;
          std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
            v100 = v114 >= 0 ? __p : *(_BYTE **)__p;
            *(_DWORD *)v111 = 136315138;
            *(_QWORD *)&v111[4] = v100;
            _os_log_error_impl(&dword_20DA91000, v99, OS_LOG_TYPE_ERROR, "%s failed", v111, 0xCu);
            if (SHIBYTE(v114) < 0)
              operator delete(*(void **)__p);
          }
LABEL_123:
          v83 = (void **)&v101;
LABEL_124:
          *v83 = 0;
          v83[1] = 0;
          v84 = v108;
          if (v108)
          {
            v85 = (unint64_t *)&v108->__shared_owners_;
            do
              v86 = __ldaxr(v85);
            while (__stlxr(v86 - 1, v85));
            if (!v86)
            {
              ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
              std::__shared_weak_count::__release_weak(v84);
            }
          }
          goto LABEL_98;
        }
        v91 = (NSObject **)*((_QWORD *)this + 1);
        v92 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v91;
        *(_QWORD *)&__p[8] = v92;
        if (v92)
        {
          v93 = (unint64_t *)(v92 + 8);
          do
            v94 = __ldxr(v93);
          while (__stxr(v94 + 1, v93));
        }
        v69 = *v91;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          goto LABEL_123;
        *(_WORD *)__p = 0;
        v82 = "Response doesn't contain result";
      }
      else
      {
        v74 = (NSObject **)*((_QWORD *)this + 1);
        v75 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v75)
        {
          v76 = (unint64_t *)&v75->__shared_owners_;
          do
            v77 = __ldxr(v76);
          while (__stxr(v77 + 1, v76));
          v69 = *v74;
          do
            v78 = __ldaxr(v76);
          while (__stlxr(v78 - 1, v76));
          if (!v78)
          {
            ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
            std::__shared_weak_count::__release_weak(v75);
          }
        }
        else
        {
          v69 = *v74;
        }
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          goto LABEL_123;
        *(_WORD *)__p = 0;
        v82 = "Response doesn't contain messageId";
      }
    }
    else
    {
      v65 = (NSObject **)*((_QWORD *)this + 1);
      v66 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v66)
      {
        v67 = (unint64_t *)&v66->__shared_owners_;
        do
          v68 = __ldxr(v67);
        while (__stxr(v68 + 1, v67));
        v69 = *v65;
        do
          v70 = __ldaxr(v67);
        while (__stlxr(v70 - 1, v67));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
          std::__shared_weak_count::__release_weak(v66);
        }
      }
      else
      {
        v69 = *v65;
      }
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_WORD *)__p = 0;
      v82 = "No response";
    }
    _os_log_error_impl(&dword_20DA91000, v69, OS_LOG_TYPE_ERROR, v82, __p, 2u);
    goto LABEL_123;
  }
  v19 = (NSObject **)*((_QWORD *)this + 1);
  v20 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
    v23 = *v19;
    do
      v24 = __ldaxr(v21);
    while (__stlxr(v24 - 1, v21));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  else
  {
    v23 = *v19;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    _os_log_error_impl(&dword_20DA91000, v23, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
  }
  telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v15);
LABEL_41:
  v101 = 0;
  v102 = 0;
  while (1)
  {
    v37 = v110;
    if (v110)
    {
      v38 = (unint64_t *)(v110 + 8);
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
        (*(void (**)(uint64_t))(*(_QWORD *)v37 + 16))(v37);
    }
    v15 = v101;
    if (!v101)
      goto LABEL_79;
    v40 = *(_QWORD *)(v101 + 8);
    if (!v40)
    {
      v43 = (NSObject **)*((_QWORD *)this + 1);
      v44 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v44)
      {
        v45 = (unint64_t *)&v44->__shared_owners_;
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
        v47 = *v43;
        do
          v48 = __ldaxr(v45);
        while (__stlxr(v48 - 1, v45));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
      else
      {
        v47 = *v43;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__p = 0;
        _os_log_error_impl(&dword_20DA91000, v47, OS_LOG_TYPE_ERROR, "No data read", __p, 2u);
      }
LABEL_79:
      v59 = 0;
      goto LABEL_80;
    }
    v41 = *(_QWORD *)(v40 + 8);
    if (v41 <= a3)
      break;
    v42 = (NSObject **)*((_QWORD *)this + 1);
    this = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 2);
    if (this)
    {
      v49 = (unint64_t *)((char *)this + 8);
      do
        v50 = __ldxr(v49);
      while (__stxr(v50 + 1, v49));
      a6 = *v42;
      do
        v51 = __ldaxr(v49);
      while (__stlxr(v51 - 1, v49));
      if (!v51)
      {
        (*(void (**)(telephonytransport::PCIClientTransport *))(*(_QWORD *)this + 16))(this);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)this);
      }
    }
    else
    {
      a6 = *v42;
    }
    if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      v52 = "Can't read more bytes than requested";
LABEL_67:
      _os_log_fault_impl(&dword_20DA91000, a6, OS_LOG_TYPE_FAULT, v52, __p, 2u);
    }
LABEL_68:
    __break(1u);
LABEL_69:
    v53 = (NSObject **)*((_QWORD *)this + 1);
    v54 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v54)
    {
      v55 = (unint64_t *)&v54->__shared_owners_;
      do
        v56 = __ldxr(v55);
      while (__stxr(v56 + 1, v55));
      v57 = *v53;
      do
        v58 = __ldaxr(v55);
      while (__stlxr(v58 - 1, v55));
      if (!v58)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    else
    {
      v57 = *v53;
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v107, "kReadResponse");
      v87 = v109;
      v88 = (void **)v107;
      telephonytransport::toString(*(unsigned int *)buf, v111);
      v89 = &v107;
      if (v87 < 0)
        v89 = v88;
      if (v112 >= 0)
        v90 = v111;
      else
        v90 = *(_BYTE **)v111;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v15;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v89;
      v114 = 2080;
      v115 = v90;
      _os_log_error_impl(&dword_20DA91000, v57, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v112 < 0)
        operator delete(*(void **)v111);
      if (v109 < 0)
        operator delete(v107);
    }
    v101 = 0;
    v102 = 0;
LABEL_98:
    v71 = v118;
    if (v118)
    {
      v72 = (unint64_t *)&v118->__shared_owners_;
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
  }
  memcpy(a5, *(const void **)v40, v41);
  a6->isa = *(Class *)(*(_QWORD *)(v15 + 8) + 8);
  v59 = 1;
LABEL_80:
  v60 = (std::__shared_weak_count *)v102;
  if (v102)
  {
    v61 = (unint64_t *)(v102 + 8);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = v104;
  v103 = off_24C80B458;
  v104 = 0;
  if (v63)
    (*(void (**)(uint64_t))(*(_QWORD *)v63 + 8))(v63);
  PB::Base::~Base((PB::Base *)&v103);
  return v59;
}

void sub_20DAA3698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v21 - 120);
  v23 = a21;
  if (a21)
  {
    v24 = (unint64_t *)(a21 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  }
  telephonytransport::PCIReadRequest::~PCIReadRequest((telephonytransport::PCIReadRequest *)&a11);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::write(telephonytransport::PCIClientTransport *this, int a2, unsigned __int8 *a3, uint64_t a4, int a5, NSObject *a6)
{
  _DWORD *v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  PB::Data *v17;
  void **v18;
  unint64_t v19;
  uint64_t v20;
  NSObject **v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  NSObject **v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  NSObject **v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  NSObject **v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  NSObject *v53;
  unint64_t v54;
  NSObject **v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  NSObject *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  NSObject **v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  const char *v72;
  void **v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  int v77;
  void **v78;
  void **v79;
  _BYTE *v80;
  NSObject **v81;
  uint64_t v82;
  unint64_t *v83;
  unint64_t v84;
  NSObject **v85;
  uint64_t v86;
  unint64_t *v87;
  unint64_t v88;
  NSObject *v89;
  _BYTE *v90;
  unint64_t v91;
  unint64_t v92;
  void (**v93)(telephonytransport::PCIWriteRequest *__hidden);
  PB::Data *v94;
  _QWORD *v95;
  uint64_t v96;
  void *v97;
  std::__shared_weak_count *v98;
  char v99;
  uint64_t v100;
  _BYTE v101[12];
  char v102;
  _BYTE __p[22];
  __int16 v104;
  _BYTE *v105;
  uint8_t buf[4];
  _BYTE v107[12];
  std::__shared_weak_count *v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v95 = 0;
  v96 = 2863311530;
  v93 = off_24C80B4C8;
  v94 = 0;
  v12 = operator new(0x18uLL);
  *(_QWORD *)v12 = off_24C80B308;
  v12[5] = 0;
  v13 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 + 1, v13));
  v15 = *((_BYTE *)v12 + 20);
  *((_QWORD *)v12 + 1) = v14;
  *((_BYTE *)v12 + 20) = v15 | 3;
  v12[4] = a2;
  v16 = (uint64_t)v95;
  v95 = v12;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = v94;
  if (!v94)
  {
    v18 = (void **)operator new(0x10uLL);
    *v18 = 0;
    v18[1] = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v94, v18);
    v17 = v94;
  }
  PB::Data::assign(v17, a3, &a3[a4]);
  BYTE4(v96) |= 1u;
  LODWORD(v96) = a5;
  v91 = 0xAAAAAAAAAAAAAAAALL;
  v92 = 0xAAAAAAAAAAAAAAAALL;
  v19 = v95[1];
  v100 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v19, &v100);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 7u, (const PB::Base *)&v93) & 1) == 0)
  {
    v27 = (NSObject **)*((_QWORD *)this + 1);
    v28 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v30 = __ldxr(p_shared_owners);
      while (__stxr(v30 + 1, p_shared_owners));
      v31 = *v27;
      do
        v32 = __ldaxr(p_shared_owners);
      while (__stlxr(v32 - 1, p_shared_owners));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    else
    {
      v31 = *v27;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
      v33 = v104 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v107 = v33;
      _os_log_error_impl(&dword_20DA91000, v31, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v104) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_43;
  }
  v20 = v100;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v20, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v21 = (NSObject **)*((_QWORD *)this + 1);
    v22 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v22)
    {
      v23 = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
      v25 = *v21;
      do
        v26 = __ldaxr(v23);
      while (__stlxr(v26 - 1, v23));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    else
    {
      v25 = *v21;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v19);
LABEL_43:
    v91 = 0;
    v92 = 0;
    goto LABEL_44;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v100);
  if (*(_DWORD *)buf != 8)
  {
    v49 = (NSObject **)*((_QWORD *)this + 1);
    v50 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v50)
    {
      v51 = (unint64_t *)&v50->__shared_owners_;
      do
        v52 = __ldxr(v51);
      while (__stxr(v52 + 1, v51));
      v53 = *v49;
      do
        v54 = __ldaxr(v51);
      while (__stlxr(v54 - 1, v51));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }
    else
    {
      v53 = *v49;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v97, "kWriteResponse");
      v77 = v99;
      v78 = (void **)v97;
      telephonytransport::toString(*(unsigned int *)buf, v101);
      v79 = &v97;
      if (v77 < 0)
        v79 = v78;
      if (v102 >= 0)
        v80 = v101;
      else
        v80 = *(_BYTE **)v101;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v19;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v79;
      v104 = 2080;
      v105 = v80;
      _os_log_error_impl(&dword_20DA91000, v53, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v102 < 0)
        operator delete(*(void **)v101);
      if (v99 < 0)
        operator delete(v97);
    }
    v91 = 0;
    v92 = 0;
    goto LABEL_75;
  }
  v34 = *(_QWORD *)&v107[4];
  v35 = (unint64_t)v108;
  if (v108)
  {
    v36 = (unint64_t *)&v108->__shared_owners_;
    do
      v37 = __ldxr(v36);
    while (__stxr(v37 + 1, v36));
  }
  v97 = (void *)v34;
  v98 = (std::__shared_weak_count *)v35;
  if (v34)
  {
    v38 = *(_QWORD *)(v34 + 8);
    if (!v38)
    {
      v64 = (NSObject **)*((_QWORD *)this + 1);
      v65 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v65)
      {
        v66 = (unint64_t *)&v65->__shared_owners_;
        do
          v67 = __ldxr(v66);
        while (__stxr(v67 + 1, v66));
        v59 = *v64;
        do
          v68 = __ldaxr(v66);
        while (__stlxr(v68 - 1, v66));
        if (!v68)
        {
          ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
          std::__shared_weak_count::__release_weak(v65);
        }
      }
      else
      {
        v59 = *v64;
      }
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        goto LABEL_101;
      *(_WORD *)__p = 0;
      v72 = "Response doesn't contain messageId";
      goto LABEL_117;
    }
    if (telephonytransport::PCIMessageId::operator==(v38, (uint64_t)v95))
    {
      if ((*(_BYTE *)(v34 + 24) & 2) == 0)
      {
        v81 = (NSObject **)*((_QWORD *)this + 1);
        v82 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v81;
        *(_QWORD *)&__p[8] = v82;
        if (v82)
        {
          v83 = (unint64_t *)(v82 + 8);
          do
            v84 = __ldxr(v83);
          while (__stxr(v84 + 1, v83));
        }
        v59 = *v81;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          goto LABEL_101;
        *(_WORD *)__p = 0;
        v72 = "Response doesn't contain result";
        goto LABEL_117;
      }
      if (!*(_DWORD *)(v34 + 20))
      {
        v91 = v34;
        v92 = v35;
        v73 = &v97;
        goto LABEL_102;
      }
      v85 = (NSObject **)*((_QWORD *)this + 1);
      v86 = *((_QWORD *)this + 2);
      *(_QWORD *)__p = v85;
      *(_QWORD *)&__p[8] = v86;
      if (v86)
      {
        v87 = (unint64_t *)(v86 + 8);
        do
          v88 = __ldxr(v87);
        while (__stxr(v88 + 1, v87));
      }
      v89 = *v85;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
        v90 = v104 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)v101 = 136315138;
        *(_QWORD *)&v101[4] = v90;
        _os_log_error_impl(&dword_20DA91000, v89, OS_LOG_TYPE_ERROR, "%s failed", v101, 0xCu);
        if (SHIBYTE(v104) < 0)
          operator delete(*(void **)__p);
      }
      goto LABEL_101;
    }
    v39 = (NSObject **)*((_QWORD *)this + 1);
    v40 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v40)
    {
      v69 = (unint64_t *)&v40->__shared_owners_;
      do
        v70 = __ldxr(v69);
      while (__stxr(v70 + 1, v69));
      a6 = *v39;
      do
        v71 = __ldaxr(v69);
      while (__stlxr(v71 - 1, v69));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    else
    {
      a6 = *v39;
    }
    if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_fault_impl(&dword_20DA91000, a6, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
    }
    __break(1u);
    goto LABEL_96;
  }
  v55 = (NSObject **)*((_QWORD *)this + 1);
  v56 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v56)
  {
LABEL_96:
    v59 = *v55;
    goto LABEL_97;
  }
  v57 = (unint64_t *)&v56->__shared_owners_;
  do
    v58 = __ldxr(v57);
  while (__stxr(v58 + 1, v57));
  v59 = *v55;
  do
    v60 = __ldaxr(v57);
  while (__stlxr(v60 - 1, v57));
  if (!v60)
  {
    ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
    std::__shared_weak_count::__release_weak(v56);
  }
LABEL_97:
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    v72 = "No response";
LABEL_117:
    _os_log_error_impl(&dword_20DA91000, v59, OS_LOG_TYPE_ERROR, v72, __p, 2u);
  }
LABEL_101:
  v73 = (void **)&v91;
LABEL_102:
  *v73 = 0;
  v73[1] = 0;
  v74 = v98;
  if (v98)
  {
    v75 = (unint64_t *)&v98->__shared_owners_;
    do
      v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
LABEL_75:
  v61 = v108;
  if (v108)
  {
    v62 = (unint64_t *)&v108->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
LABEL_44:
  v41 = v100;
  if (v100)
  {
    v42 = (unint64_t *)(v100 + 8);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
      (*(void (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
  }
  v44 = v91;
  if (v91 && (*(_BYTE *)(v91 + 24) & 1) != 0)
    a6->isa = (Class)*(unsigned int *)(v91 + 16);
  v45 = (std::__shared_weak_count *)v92;
  if (v92)
  {
    v46 = (unint64_t *)(v92 + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)&v93);
  return v44 != 0;
}

void sub_20DAA3F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v21 - 88);
  v23 = a21;
  if (a21)
  {
    v24 = (unint64_t *)(a21 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  }
  telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)&a11);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::sendImage(telephonytransport::PCIClientTransport *this, int a2, unsigned __int8 *a3, uint64_t a4, int a5, NSObject *a6, std::__shared_weak_count *a7)
{
  _DWORD *v14;
  unint64_t *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  PB::Data *v19;
  void **v20;
  unint64_t v21;
  uint64_t v22;
  NSObject **v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t v28;
  NSObject **v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  NSObject *v33;
  unint64_t v34;
  _BYTE *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  NSObject **v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  char v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  NSObject **v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  NSObject *v55;
  unint64_t v56;
  NSObject **v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  NSObject *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  NSObject **v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  const char *v74;
  void **v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  int v79;
  void **v80;
  void **v81;
  _BYTE *v82;
  NSObject **v83;
  uint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  NSObject **v87;
  uint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  NSObject *v91;
  _BYTE *v92;
  unint64_t v93;
  unint64_t v94;
  void (**v95)(telephonytransport::PCISendImageRequest *__hidden);
  PB::Data *v96;
  _QWORD *v97;
  uint64_t v98;
  void *v99;
  std::__shared_weak_count *v100;
  char v101;
  uint64_t v102;
  _BYTE v103[12];
  char v104;
  _BYTE __p[22];
  __int16 v106;
  _BYTE *v107;
  uint8_t buf[4];
  _BYTE v109[12];
  std::__shared_weak_count *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v97 = 0;
  v98 = 2863311530;
  v95 = off_24C80B3E8;
  v96 = 0;
  v14 = operator new(0x18uLL);
  *(_QWORD *)v14 = off_24C80B308;
  v14[5] = 0;
  v15 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 + 1, v15));
  v17 = *((_BYTE *)v14 + 20);
  *((_QWORD *)v14 + 1) = v16;
  *((_BYTE *)v14 + 20) = v17 | 3;
  v14[4] = a2;
  v18 = (uint64_t)v97;
  v97 = v14;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = v96;
  if (!v96)
  {
    v20 = (void **)operator new(0x10uLL);
    *v20 = 0;
    v20[1] = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v96, v20);
    v19 = v96;
  }
  PB::Data::assign(v19, a3, &a3[a4]);
  BYTE4(v98) |= 1u;
  LODWORD(v98) = a5;
  v93 = 0xAAAAAAAAAAAAAAAALL;
  v94 = 0xAAAAAAAAAAAAAAAALL;
  v21 = v97[1];
  v102 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v21, &v102);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xBu, (const PB::Base *)&v95) & 1) == 0)
  {
    v29 = (NSObject **)*((_QWORD *)this + 1);
    v30 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v32 = __ldxr(p_shared_owners);
      while (__stxr(v32 + 1, p_shared_owners));
      v33 = *v29;
      do
        v34 = __ldaxr(p_shared_owners);
      while (__stlxr(v34 - 1, p_shared_owners));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    else
    {
      v33 = *v29;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
      v35 = v106 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v109 = v35;
      _os_log_error_impl(&dword_20DA91000, v33, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v106) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_43;
  }
  v22 = v102;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v22, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v23 = (NSObject **)*((_QWORD *)this + 1);
    v24 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v24)
    {
      v25 = (unint64_t *)&v24->__shared_owners_;
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
      v27 = *v23;
      do
        v28 = __ldaxr(v25);
      while (__stlxr(v28 - 1, v25));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    else
    {
      v27 = *v23;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v27, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v21);
LABEL_43:
    v93 = 0;
    v94 = 0;
    goto LABEL_44;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v102);
  if (*(_DWORD *)buf != 12)
  {
    v51 = (NSObject **)*((_QWORD *)this + 1);
    v52 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v52)
    {
      v53 = (unint64_t *)&v52->__shared_owners_;
      do
        v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
      v55 = *v51;
      do
        v56 = __ldaxr(v53);
      while (__stlxr(v56 - 1, v53));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    else
    {
      v55 = *v51;
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v99, "kSendImageResponse");
      v79 = v101;
      v80 = (void **)v99;
      telephonytransport::toString(*(unsigned int *)buf, v103);
      v81 = &v99;
      if (v79 < 0)
        v81 = v80;
      if (v104 >= 0)
        v82 = v103;
      else
        v82 = *(_BYTE **)v103;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v21;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v81;
      v106 = 2080;
      v107 = v82;
      _os_log_error_impl(&dword_20DA91000, v55, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v104 < 0)
        operator delete(*(void **)v103);
      if (v101 < 0)
        operator delete(v99);
    }
    v93 = 0;
    v94 = 0;
    goto LABEL_77;
  }
  v36 = *(_QWORD *)&v109[4];
  v37 = (unint64_t)v110;
  if (v110)
  {
    v38 = (unint64_t *)&v110->__shared_owners_;
    do
      v39 = __ldxr(v38);
    while (__stxr(v39 + 1, v38));
  }
  v99 = (void *)v36;
  v100 = (std::__shared_weak_count *)v37;
  if (v36)
  {
    v40 = *(_QWORD *)(v36 + 8);
    if (!v40)
    {
      v66 = (NSObject **)*((_QWORD *)this + 1);
      v67 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v67)
      {
        v68 = (unint64_t *)&v67->__shared_owners_;
        do
          v69 = __ldxr(v68);
        while (__stxr(v69 + 1, v68));
        v61 = *v66;
        do
          v70 = __ldaxr(v68);
        while (__stlxr(v70 - 1, v68));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
          std::__shared_weak_count::__release_weak(v67);
        }
      }
      else
      {
        v61 = *v66;
      }
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        goto LABEL_103;
      *(_WORD *)__p = 0;
      v74 = "Response doesn't contain messageId";
      goto LABEL_119;
    }
    if (telephonytransport::PCIMessageId::operator==(v40, (uint64_t)v97))
    {
      if ((*(_BYTE *)(v36 + 28) & 4) == 0)
      {
        v83 = (NSObject **)*((_QWORD *)this + 1);
        v84 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v83;
        *(_QWORD *)&__p[8] = v84;
        if (v84)
        {
          v85 = (unint64_t *)(v84 + 8);
          do
            v86 = __ldxr(v85);
          while (__stxr(v86 + 1, v85));
        }
        v61 = *v83;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          goto LABEL_103;
        *(_WORD *)__p = 0;
        v74 = "Response doesn't contain result";
        goto LABEL_119;
      }
      if (!*(_DWORD *)(v36 + 24))
      {
        v93 = v36;
        v94 = v37;
        v75 = &v99;
        goto LABEL_104;
      }
      v87 = (NSObject **)*((_QWORD *)this + 1);
      v88 = *((_QWORD *)this + 2);
      *(_QWORD *)__p = v87;
      *(_QWORD *)&__p[8] = v88;
      if (v88)
      {
        v89 = (unint64_t *)(v88 + 8);
        do
          v90 = __ldxr(v89);
        while (__stxr(v90 + 1, v89));
      }
      v91 = *v87;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
        v92 = v106 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)v103 = 136315138;
        *(_QWORD *)&v103[4] = v92;
        _os_log_error_impl(&dword_20DA91000, v91, OS_LOG_TYPE_ERROR, "%s failed", v103, 0xCu);
        if (SHIBYTE(v106) < 0)
          operator delete(*(void **)__p);
      }
      goto LABEL_103;
    }
    v41 = (NSObject **)*((_QWORD *)this + 1);
    a7 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (a7)
    {
      v71 = (unint64_t *)&a7->__shared_owners_;
      do
        v72 = __ldxr(v71);
      while (__stxr(v72 + 1, v71));
      a6 = *v41;
      do
        v73 = __ldaxr(v71);
      while (__stlxr(v73 - 1, v71));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))a7->__on_zero_shared)(a7);
        std::__shared_weak_count::__release_weak(a7);
      }
    }
    else
    {
      a6 = *v41;
    }
    if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_fault_impl(&dword_20DA91000, a6, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
    }
    __break(1u);
    goto LABEL_98;
  }
  v57 = (NSObject **)*((_QWORD *)this + 1);
  v58 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v58)
  {
LABEL_98:
    v61 = *v57;
    goto LABEL_99;
  }
  v59 = (unint64_t *)&v58->__shared_owners_;
  do
    v60 = __ldxr(v59);
  while (__stxr(v60 + 1, v59));
  v61 = *v57;
  do
    v62 = __ldaxr(v59);
  while (__stlxr(v62 - 1, v59));
  if (!v62)
  {
    ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
    std::__shared_weak_count::__release_weak(v58);
  }
LABEL_99:
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    v74 = "No response";
LABEL_119:
    _os_log_error_impl(&dword_20DA91000, v61, OS_LOG_TYPE_ERROR, v74, __p, 2u);
  }
LABEL_103:
  v75 = (void **)&v93;
LABEL_104:
  *v75 = 0;
  v75[1] = 0;
  v76 = v100;
  if (v100)
  {
    v77 = (unint64_t *)&v100->__shared_owners_;
    do
      v78 = __ldaxr(v77);
    while (__stlxr(v78 - 1, v77));
    if (!v78)
    {
      ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
      std::__shared_weak_count::__release_weak(v76);
    }
  }
LABEL_77:
  v63 = v110;
  if (v110)
  {
    v64 = (unint64_t *)&v110->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
LABEL_44:
  v42 = v102;
  if (v102)
  {
    v43 = (unint64_t *)(v102 + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
  }
  v45 = v93;
  if (v93)
  {
    v46 = *(_BYTE *)(v93 + 28);
    if ((v46 & 2) != 0)
    {
      LODWORD(a7->__vftable) = *(_DWORD *)(v93 + 20);
      v46 = *(_BYTE *)(v45 + 28);
    }
    if ((v46 & 1) != 0)
      a6->isa = (Class)*(unsigned int *)(v45 + 16);
  }
  v47 = (std::__shared_weak_count *)v94;
  if (v94)
  {
    v48 = (unint64_t *)(v94 + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)&v95);
  return v45 != 0;
}

void sub_20DAA4860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v21 - 104);
  v23 = a21;
  if (a21)
  {
    v24 = (unint64_t *)(a21 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  }
  telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)&a11);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::readRegister(telephonytransport::PCIClientTransport *this, int a2, int a3, unsigned int a4, unsigned int a5, unsigned __int8 *a6, NSObject *a7)
{
  _DWORD *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  NSObject **v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  NSObject **v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  NSObject **v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  size_t v43;
  NSObject **v44;
  NSObject **v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t v53;
  const char *v54;
  NSObject **v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  NSObject *v59;
  unint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  uint64_t v65;
  NSObject **v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  NSObject *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  NSObject **v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t *v81;
  unint64_t v82;
  unint64_t v83;
  const char *v84;
  void **v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  int v89;
  void **v90;
  void **v91;
  _BYTE *v92;
  NSObject **v93;
  uint64_t v94;
  unint64_t *v95;
  unint64_t v96;
  NSObject **v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  NSObject *v101;
  _BYTE *v102;
  unint64_t v103;
  unint64_t v104;
  void (**v105)(telephonytransport::PCIReadRegisterRequest *__hidden);
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  void *v109;
  std::__shared_weak_count *v110;
  char v111;
  uint64_t v112;
  _BYTE v113[12];
  char v114;
  _BYTE __p[22];
  __int16 v116;
  _BYTE *v117;
  uint8_t buf[4];
  _BYTE v119[12];
  std::__shared_weak_count *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v107 = 0xAAAAAAAAAAAAAAAALL;
  v108 = 2863311530;
  v105 = off_24C80B260;
  v106 = 0;
  v14 = operator new(0x18uLL);
  v15 = (uint64_t)v14;
  *(_QWORD *)v14 = off_24C80B308;
  v14[5] = 0;
  v16 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 + 1, v16));
  v18 = *((_BYTE *)v14 + 20);
  *((_QWORD *)v14 + 1) = v17;
  *((_BYTE *)v14 + 20) = v18 | 3;
  v14[4] = a2;
  v19 = v106;
  v106 = v15;
  if (v19)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
    v17 = *(_QWORD *)(v15 + 8);
  }
  LODWORD(v108) = a3;
  BYTE4(v108) |= 7u;
  v107 = __PAIR64__(a5, a4);
  v103 = 0xAAAAAAAAAAAAAAAALL;
  v104 = 0xAAAAAAAAAAAAAAAALL;
  v112 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v17, &v112);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xDu, (const PB::Base *)&v105) & 1) == 0)
  {
    v27 = (NSObject **)*((_QWORD *)this + 1);
    v28 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v30 = __ldxr(p_shared_owners);
      while (__stxr(v30 + 1, p_shared_owners));
      v31 = *v27;
      do
        v32 = __ldaxr(p_shared_owners);
      while (__stlxr(v32 - 1, p_shared_owners));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    else
    {
      v31 = *v27;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
      v33 = v116 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v119 = v33;
      _os_log_error_impl(&dword_20DA91000, v31, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v116) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v20 = v112;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (!std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v20, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v112);
    if (*(_DWORD *)buf != 14)
      goto LABEL_69;
    v17 = *(_QWORD *)&v119[4];
    v34 = (unint64_t)v120;
    if (v120)
    {
      v35 = (unint64_t *)&v120->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    v109 = (void *)v17;
    v110 = (std::__shared_weak_count *)v34;
    if (v17)
    {
      v37 = *(_QWORD *)(v17 + 16);
      if (v37)
      {
        if (!telephonytransport::PCIMessageId::operator==(v37, v106))
        {
          v38 = (NSObject **)*((_QWORD *)this + 1);
          this = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 2);
          if (this)
          {
            v81 = (unint64_t *)((char *)this + 8);
            do
              v82 = __ldxr(v81);
            while (__stxr(v82 + 1, v81));
            a7 = *v38;
            do
              v83 = __ldaxr(v81);
            while (__stlxr(v83 - 1, v81));
            if (!v83)
            {
              (*(void (**)(telephonytransport::PCIClientTransport *))(*(_QWORD *)this + 16))(this);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)this);
            }
          }
          else
          {
            a7 = *v38;
          }
          if (!os_log_type_enabled(a7, OS_LOG_TYPE_FAULT))
            goto LABEL_68;
          *(_WORD *)__p = 0;
          v54 = "Response messageId must match request messageId";
          goto LABEL_67;
        }
        if ((*(_BYTE *)(v17 + 28) & 1) != 0)
        {
          if (!*(_DWORD *)(v17 + 24))
          {
            v103 = v17;
            v104 = v34;
            v85 = &v109;
            goto LABEL_124;
          }
          v97 = (NSObject **)*((_QWORD *)this + 1);
          v98 = *((_QWORD *)this + 2);
          *(_QWORD *)__p = v97;
          *(_QWORD *)&__p[8] = v98;
          if (v98)
          {
            v99 = (unint64_t *)(v98 + 8);
            do
              v100 = __ldxr(v99);
            while (__stxr(v100 + 1, v99));
          }
          v101 = *v97;
          std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
            v102 = v116 >= 0 ? __p : *(_BYTE **)__p;
            *(_DWORD *)v113 = 136315138;
            *(_QWORD *)&v113[4] = v102;
            _os_log_error_impl(&dword_20DA91000, v101, OS_LOG_TYPE_ERROR, "%s failed", v113, 0xCu);
            if (SHIBYTE(v116) < 0)
              operator delete(*(void **)__p);
          }
LABEL_123:
          v85 = (void **)&v103;
LABEL_124:
          *v85 = 0;
          v85[1] = 0;
          v86 = v110;
          if (v110)
          {
            v87 = (unint64_t *)&v110->__shared_owners_;
            do
              v88 = __ldaxr(v87);
            while (__stlxr(v88 - 1, v87));
            if (!v88)
            {
              ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
              std::__shared_weak_count::__release_weak(v86);
            }
          }
          goto LABEL_98;
        }
        v93 = (NSObject **)*((_QWORD *)this + 1);
        v94 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v93;
        *(_QWORD *)&__p[8] = v94;
        if (v94)
        {
          v95 = (unint64_t *)(v94 + 8);
          do
            v96 = __ldxr(v95);
          while (__stxr(v96 + 1, v95));
        }
        v71 = *v93;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          goto LABEL_123;
        *(_WORD *)__p = 0;
        v84 = "Response doesn't contain result";
      }
      else
      {
        v76 = (NSObject **)*((_QWORD *)this + 1);
        v77 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v77)
        {
          v78 = (unint64_t *)&v77->__shared_owners_;
          do
            v79 = __ldxr(v78);
          while (__stxr(v79 + 1, v78));
          v71 = *v76;
          do
            v80 = __ldaxr(v78);
          while (__stlxr(v80 - 1, v78));
          if (!v80)
          {
            ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
            std::__shared_weak_count::__release_weak(v77);
          }
        }
        else
        {
          v71 = *v76;
        }
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          goto LABEL_123;
        *(_WORD *)__p = 0;
        v84 = "Response doesn't contain messageId";
      }
    }
    else
    {
      v67 = (NSObject **)*((_QWORD *)this + 1);
      v68 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v68)
      {
        v69 = (unint64_t *)&v68->__shared_owners_;
        do
          v70 = __ldxr(v69);
        while (__stxr(v70 + 1, v69));
        v71 = *v67;
        do
          v72 = __ldaxr(v69);
        while (__stlxr(v72 - 1, v69));
        if (!v72)
        {
          ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
          std::__shared_weak_count::__release_weak(v68);
        }
      }
      else
      {
        v71 = *v67;
      }
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_WORD *)__p = 0;
      v84 = "No response";
    }
    _os_log_error_impl(&dword_20DA91000, v71, OS_LOG_TYPE_ERROR, v84, __p, 2u);
    goto LABEL_123;
  }
  v21 = (NSObject **)*((_QWORD *)this + 1);
  v22 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    v25 = *v21;
    do
      v26 = __ldaxr(v23);
    while (__stlxr(v26 - 1, v23));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  else
  {
    v25 = *v21;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    _os_log_error_impl(&dword_20DA91000, v25, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
  }
  telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v17);
LABEL_41:
  v103 = 0;
  v104 = 0;
  while (1)
  {
    v39 = v112;
    if (v112)
    {
      v40 = (unint64_t *)(v112 + 8);
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
        (*(void (**)(uint64_t))(*(_QWORD *)v39 + 16))(v39);
    }
    v17 = v103;
    if (!v103)
      goto LABEL_79;
    v42 = *(_QWORD *)(v103 + 8);
    if (!v42)
    {
      v45 = (NSObject **)*((_QWORD *)this + 1);
      v46 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v46)
      {
        v47 = (unint64_t *)&v46->__shared_owners_;
        do
          v48 = __ldxr(v47);
        while (__stxr(v48 + 1, v47));
        v49 = *v45;
        do
          v50 = __ldaxr(v47);
        while (__stlxr(v50 - 1, v47));
        if (!v50)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }
      else
      {
        v49 = *v45;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__p = 0;
        _os_log_error_impl(&dword_20DA91000, v49, OS_LOG_TYPE_ERROR, "No data read", __p, 2u);
      }
LABEL_79:
      v61 = 0;
      goto LABEL_80;
    }
    v43 = *(_QWORD *)(v42 + 8);
    if (v43 <= a4)
      break;
    v44 = (NSObject **)*((_QWORD *)this + 1);
    this = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 2);
    if (this)
    {
      v51 = (unint64_t *)((char *)this + 8);
      do
        v52 = __ldxr(v51);
      while (__stxr(v52 + 1, v51));
      a7 = *v44;
      do
        v53 = __ldaxr(v51);
      while (__stlxr(v53 - 1, v51));
      if (!v53)
      {
        (*(void (**)(telephonytransport::PCIClientTransport *))(*(_QWORD *)this + 16))(this);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)this);
      }
    }
    else
    {
      a7 = *v44;
    }
    if (os_log_type_enabled(a7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      v54 = "Can't read more bytes than requested";
LABEL_67:
      _os_log_fault_impl(&dword_20DA91000, a7, OS_LOG_TYPE_FAULT, v54, __p, 2u);
    }
LABEL_68:
    __break(1u);
LABEL_69:
    v55 = (NSObject **)*((_QWORD *)this + 1);
    v56 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v56)
    {
      v57 = (unint64_t *)&v56->__shared_owners_;
      do
        v58 = __ldxr(v57);
      while (__stxr(v58 + 1, v57));
      v59 = *v55;
      do
        v60 = __ldaxr(v57);
      while (__stlxr(v60 - 1, v57));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
        std::__shared_weak_count::__release_weak(v56);
      }
    }
    else
    {
      v59 = *v55;
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v109, "kReadRegisterResponse");
      v89 = v111;
      v90 = (void **)v109;
      telephonytransport::toString(*(unsigned int *)buf, v113);
      v91 = &v109;
      if (v89 < 0)
        v91 = v90;
      if (v114 >= 0)
        v92 = v113;
      else
        v92 = *(_BYTE **)v113;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v17;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v91;
      v116 = 2080;
      v117 = v92;
      _os_log_error_impl(&dword_20DA91000, v59, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v114 < 0)
        operator delete(*(void **)v113);
      if (v111 < 0)
        operator delete(v109);
    }
    v103 = 0;
    v104 = 0;
LABEL_98:
    v73 = v120;
    if (v120)
    {
      v74 = (unint64_t *)&v120->__shared_owners_;
      do
        v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
  }
  memcpy(a6, *(const void **)v42, v43);
  a7->isa = *(Class *)(*(_QWORD *)(v17 + 8) + 8);
  v61 = 1;
LABEL_80:
  v62 = (std::__shared_weak_count *)v104;
  if (v104)
  {
    v63 = (unint64_t *)(v104 + 8);
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  v65 = v106;
  v105 = off_24C80B260;
  v106 = 0;
  if (v65)
    (*(void (**)(uint64_t))(*(_QWORD *)v65 + 8))(v65);
  PB::Base::~Base((PB::Base *)&v105);
  return v61;
}

void sub_20DAA5254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v21 - 120);
  v23 = a21;
  if (a21)
  {
    v24 = (unint64_t *)(a21 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  }
  telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&a11);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::unblockRead(telephonytransport::PCIClientTransport *this, int a2)
{
  _DWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject **v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject **v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  NSObject **v29;
  std::__shared_weak_count *v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  NSObject **v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  NSObject **v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  NSObject *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject **v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  const char *v64;
  void **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  void **v70;
  void **v71;
  _BYTE *v72;
  NSObject **v73;
  uint64_t v74;
  unint64_t *v75;
  unint64_t v76;
  NSObject **v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  NSObject *v81;
  _BYTE *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  void (**v85)(telephonytransport::PCIUnblockReadRequest *__hidden);
  uint64_t v86;
  void *v87;
  std::__shared_weak_count *v88;
  char v89;
  uint64_t v90;
  _BYTE v91[12];
  char v92;
  _BYTE __p[22];
  __int16 v94;
  _BYTE *v95;
  uint8_t buf[4];
  _BYTE v97[12];
  std::__shared_weak_count *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v85 = off_24C80B298;
  v86 = 0;
  v4 = operator new(0x18uLL);
  v5 = (uint64_t)v4;
  *(_QWORD *)v4 = off_24C80B308;
  v4[5] = 0;
  v6 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  v8 = *((_BYTE *)v4 + 20);
  *((_QWORD *)v4 + 1) = v7;
  *((_BYTE *)v4 + 20) = v8 | 3;
  v4[4] = a2;
  v9 = v86;
  v86 = v5;
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v7 = *(_QWORD *)(v5 + 8);
  }
  v90 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v7, &v90);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xFu, (const PB::Base *)&v85) & 1) == 0)
  {
    v17 = (NSObject **)*((_QWORD *)this + 1);
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      v21 = *v17;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    else
    {
      v21 = *v17;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
      v23 = v94 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v23;
      _os_log_error_impl(&dword_20DA91000, v21, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v94) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v10 = v90;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v10, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v11 = (NSObject **)*((_QWORD *)this + 1);
    v12 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
      v15 = *v11;
      do
        v16 = __ldaxr(v13);
      while (__stlxr(v16 - 1, v13));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    else
    {
      v15 = *v11;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v15, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v7);
LABEL_41:
    v83 = 0;
    v84 = 0;
    goto LABEL_42;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v90);
  if (*(_DWORD *)buf != 16)
  {
    v41 = (NSObject **)*((_QWORD *)this + 1);
    v42 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
      v45 = *v41;
      do
        v46 = __ldaxr(v43);
      while (__stlxr(v46 - 1, v43));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    else
    {
      v45 = *v41;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v87, "kUnblockReadResponse");
      v69 = v89;
      v70 = (void **)v87;
      telephonytransport::toString(*(unsigned int *)buf, v91);
      v71 = &v87;
      if (v69 < 0)
        v71 = v70;
      if (v92 >= 0)
        v72 = v91;
      else
        v72 = *(_BYTE **)v91;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v7;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v71;
      v94 = 2080;
      v95 = v72;
      _os_log_error_impl(&dword_20DA91000, v45, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v92 < 0)
        operator delete(*(void **)v91);
      if (v89 < 0)
        operator delete(v87);
    }
    v83 = 0;
    v84 = 0;
    goto LABEL_72;
  }
  v24 = *(_QWORD *)&v97[4];
  v25 = v98;
  if (v98)
  {
    v26 = (unint64_t *)&v98->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v87 = (void *)v24;
  v88 = v25;
  if (v24)
  {
    v28 = *(_QWORD *)(v24 + 8);
    if (!v28)
    {
      v56 = (NSObject **)*((_QWORD *)this + 1);
      v57 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v57)
      {
        v58 = (unint64_t *)&v57->__shared_owners_;
        do
          v59 = __ldxr(v58);
        while (__stxr(v59 + 1, v58));
        v51 = *v56;
        do
          v60 = __ldaxr(v58);
        while (__stlxr(v60 - 1, v58));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }
      else
      {
        v51 = *v56;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_98;
      *(_WORD *)__p = 0;
      v64 = "Response doesn't contain messageId";
      goto LABEL_114;
    }
    if (telephonytransport::PCIMessageId::operator==(v28, v86))
    {
      if ((*(_BYTE *)(v24 + 20) & 1) == 0)
      {
        v73 = (NSObject **)*((_QWORD *)this + 1);
        v74 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v73;
        *(_QWORD *)&__p[8] = v74;
        if (v74)
        {
          v75 = (unint64_t *)(v74 + 8);
          do
            v76 = __ldxr(v75);
          while (__stxr(v76 + 1, v75));
        }
        v51 = *v73;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          goto LABEL_98;
        *(_WORD *)__p = 0;
        v64 = "Response doesn't contain result";
        goto LABEL_114;
      }
      if (!*(_DWORD *)(v24 + 16))
      {
        v83 = v24;
        v84 = v25;
        v65 = &v87;
        goto LABEL_99;
      }
      v77 = (NSObject **)*((_QWORD *)this + 1);
      v78 = *((_QWORD *)this + 2);
      *(_QWORD *)__p = v77;
      *(_QWORD *)&__p[8] = v78;
      if (v78)
      {
        v79 = (unint64_t *)(v78 + 8);
        do
          v80 = __ldxr(v79);
        while (__stxr(v80 + 1, v79));
      }
      v81 = *v77;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
        v82 = v94 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)v91 = 136315138;
        *(_QWORD *)&v91[4] = v82;
        _os_log_error_impl(&dword_20DA91000, v81, OS_LOG_TYPE_ERROR, "%s failed", v91, 0xCu);
        if (SHIBYTE(v94) < 0)
          operator delete(*(void **)__p);
      }
      goto LABEL_98;
    }
    v29 = (NSObject **)*((_QWORD *)this + 1);
    v30 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v30)
    {
      v61 = (unint64_t *)&v30->__shared_owners_;
      do
        v62 = __ldxr(v61);
      while (__stxr(v62 + 1, v61));
      v31 = *v29;
      do
        v63 = __ldaxr(v61);
      while (__stlxr(v63 - 1, v61));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    else
    {
      v31 = *v29;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_fault_impl(&dword_20DA91000, v31, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
    }
    __break(1u);
    goto LABEL_93;
  }
  v47 = (NSObject **)*((_QWORD *)this + 1);
  v48 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v48)
  {
LABEL_93:
    v51 = *v47;
    goto LABEL_94;
  }
  v49 = (unint64_t *)&v48->__shared_owners_;
  do
    v50 = __ldxr(v49);
  while (__stxr(v50 + 1, v49));
  v51 = *v47;
  do
    v52 = __ldaxr(v49);
  while (__stlxr(v52 - 1, v49));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
LABEL_94:
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    v64 = "No response";
LABEL_114:
    _os_log_error_impl(&dword_20DA91000, v51, OS_LOG_TYPE_ERROR, v64, __p, 2u);
  }
LABEL_98:
  v65 = (void **)&v83;
LABEL_99:
  *v65 = 0;
  v65[1] = 0;
  v66 = v88;
  if (v88)
  {
    v67 = (unint64_t *)&v88->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
LABEL_72:
  v53 = v98;
  if (v98)
  {
    v54 = (unint64_t *)&v98->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
LABEL_42:
  v32 = v90;
  if (v90)
  {
    v33 = (unint64_t *)(v90 + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
  }
  v36 = v83;
  v35 = v84;
  if (v84)
  {
    v37 = (unint64_t *)&v84->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v39 = v86;
  v85 = off_24C80B298;
  v86 = 0;
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  PB::Base::~Base((PB::Base *)&v85);
  return v36 != 0;
}

void sub_20DAA5AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v19 - 72);
  v21 = a19;
  if (a19)
  {
    v22 = (unint64_t *)(a19 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
  }
  telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&a11);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::flushRead(telephonytransport::PCIClientTransport *this, int a2)
{
  _DWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject **v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject **v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  NSObject **v29;
  std::__shared_weak_count *v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  NSObject **v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  NSObject **v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  NSObject *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject **v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  const char *v64;
  void **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  void **v70;
  void **v71;
  _BYTE *v72;
  NSObject **v73;
  uint64_t v74;
  unint64_t *v75;
  unint64_t v76;
  NSObject **v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  NSObject *v81;
  _BYTE *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  void (**v85)(telephonytransport::PCIFlushReadRequest *__hidden);
  uint64_t v86;
  void *v87;
  std::__shared_weak_count *v88;
  char v89;
  uint64_t v90;
  _BYTE v91[12];
  char v92;
  _BYTE __p[22];
  __int16 v94;
  _BYTE *v95;
  uint8_t buf[4];
  _BYTE v97[12];
  std::__shared_weak_count *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v85 = off_24C80B2D0;
  v86 = 0;
  v4 = operator new(0x18uLL);
  v5 = (uint64_t)v4;
  *(_QWORD *)v4 = off_24C80B308;
  v4[5] = 0;
  v6 = (unint64_t *)(*((_QWORD *)this + 3) + 88);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  v8 = *((_BYTE *)v4 + 20);
  *((_QWORD *)v4 + 1) = v7;
  *((_BYTE *)v4 + 20) = v8 | 3;
  v4[4] = a2;
  v9 = v86;
  v86 = v5;
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v7 = *(_QWORD *)(v5 + 8);
  }
  v90 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v7, &v90);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0x11u, (const PB::Base *)&v85) & 1) == 0)
  {
    v17 = (NSObject **)*((_QWORD *)this + 1);
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      v21 = *v17;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    else
    {
      v21 = *v17;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
      v23 = v94 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v23;
      _os_log_error_impl(&dword_20DA91000, v21, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v94) < 0)
        operator delete(*(void **)__p);
    }
    goto LABEL_41;
  }
  v10 = v90;
  *(_QWORD *)__p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v10, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    v11 = (NSObject **)*((_QWORD *)this + 1);
    v12 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
      v15 = *v11;
      do
        v16 = __ldaxr(v13);
      while (__stlxr(v16 - 1, v13));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    else
    {
      v15 = *v11;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_20DA91000, v15, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v7);
LABEL_41:
    v83 = 0;
    v84 = 0;
    goto LABEL_42;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v90);
  if (*(_DWORD *)buf != 18)
  {
    v41 = (NSObject **)*((_QWORD *)this + 1);
    v42 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
      v45 = *v41;
      do
        v46 = __ldaxr(v43);
      while (__stlxr(v46 - 1, v43));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    else
    {
      v45 = *v41;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v87, "kFlushReadResponse");
      v69 = v89;
      v70 = (void **)v87;
      telephonytransport::toString(*(unsigned int *)buf, v91);
      v71 = &v87;
      if (v69 < 0)
        v71 = v70;
      if (v92 >= 0)
        v72 = v91;
      else
        v72 = *(_BYTE **)v91;
      *(_DWORD *)__p = 134218498;
      *(_QWORD *)&__p[4] = v7;
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v71;
      v94 = 2080;
      v95 = v72;
      _os_log_error_impl(&dword_20DA91000, v45, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v92 < 0)
        operator delete(*(void **)v91);
      if (v89 < 0)
        operator delete(v87);
    }
    v83 = 0;
    v84 = 0;
    goto LABEL_72;
  }
  v24 = *(_QWORD *)&v97[4];
  v25 = v98;
  if (v98)
  {
    v26 = (unint64_t *)&v98->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v87 = (void *)v24;
  v88 = v25;
  if (v24)
  {
    v28 = *(_QWORD *)(v24 + 8);
    if (!v28)
    {
      v56 = (NSObject **)*((_QWORD *)this + 1);
      v57 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v57)
      {
        v58 = (unint64_t *)&v57->__shared_owners_;
        do
          v59 = __ldxr(v58);
        while (__stxr(v59 + 1, v58));
        v51 = *v56;
        do
          v60 = __ldaxr(v58);
        while (__stlxr(v60 - 1, v58));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }
      else
      {
        v51 = *v56;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_98;
      *(_WORD *)__p = 0;
      v64 = "Response doesn't contain messageId";
      goto LABEL_114;
    }
    if (telephonytransport::PCIMessageId::operator==(v28, v86))
    {
      if ((*(_BYTE *)(v24 + 20) & 1) == 0)
      {
        v73 = (NSObject **)*((_QWORD *)this + 1);
        v74 = *((_QWORD *)this + 2);
        *(_QWORD *)__p = v73;
        *(_QWORD *)&__p[8] = v74;
        if (v74)
        {
          v75 = (unint64_t *)(v74 + 8);
          do
            v76 = __ldxr(v75);
          while (__stxr(v76 + 1, v75));
        }
        v51 = *v73;
        std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          goto LABEL_98;
        *(_WORD *)__p = 0;
        v64 = "Response doesn't contain result";
        goto LABEL_114;
      }
      if (!*(_DWORD *)(v24 + 16))
      {
        v83 = v24;
        v84 = v25;
        v65 = &v87;
        goto LABEL_99;
      }
      v77 = (NSObject **)*((_QWORD *)this + 1);
      v78 = *((_QWORD *)this + 2);
      *(_QWORD *)__p = v77;
      *(_QWORD *)&__p[8] = v78;
      if (v78)
      {
        v79 = (unint64_t *)(v78 + 8);
        do
          v80 = __ldxr(v79);
        while (__stxr(v80 + 1, v79));
      }
      v81 = *v77;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
        v82 = v94 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)v91 = 136315138;
        *(_QWORD *)&v91[4] = v82;
        _os_log_error_impl(&dword_20DA91000, v81, OS_LOG_TYPE_ERROR, "%s failed", v91, 0xCu);
        if (SHIBYTE(v94) < 0)
          operator delete(*(void **)__p);
      }
      goto LABEL_98;
    }
    v29 = (NSObject **)*((_QWORD *)this + 1);
    v30 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (v30)
    {
      v61 = (unint64_t *)&v30->__shared_owners_;
      do
        v62 = __ldxr(v61);
      while (__stxr(v62 + 1, v61));
      v31 = *v29;
      do
        v63 = __ldaxr(v61);
      while (__stlxr(v63 - 1, v61));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    else
    {
      v31 = *v29;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_fault_impl(&dword_20DA91000, v31, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
    }
    __break(1u);
    goto LABEL_93;
  }
  v47 = (NSObject **)*((_QWORD *)this + 1);
  v48 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (!v48)
  {
LABEL_93:
    v51 = *v47;
    goto LABEL_94;
  }
  v49 = (unint64_t *)&v48->__shared_owners_;
  do
    v50 = __ldxr(v49);
  while (__stxr(v50 + 1, v49));
  v51 = *v47;
  do
    v52 = __ldaxr(v49);
  while (__stlxr(v52 - 1, v49));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
LABEL_94:
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    v64 = "No response";
LABEL_114:
    _os_log_error_impl(&dword_20DA91000, v51, OS_LOG_TYPE_ERROR, v64, __p, 2u);
  }
LABEL_98:
  v65 = (void **)&v83;
LABEL_99:
  *v65 = 0;
  v65[1] = 0;
  v66 = v88;
  if (v88)
  {
    v67 = (unint64_t *)&v88->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
LABEL_72:
  v53 = v98;
  if (v98)
  {
    v54 = (unint64_t *)&v98->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
LABEL_42:
  v32 = v90;
  if (v90)
  {
    v33 = (unint64_t *)(v90 + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
  }
  v36 = v83;
  v35 = v84;
  if (v84)
  {
    v37 = (unint64_t *)&v84->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v39 = v86;
  v85 = off_24C80B2D0;
  v86 = 0;
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  PB::Base::~Base((PB::Base *)&v85);
  return v36 != 0;
}

void sub_20DAA631C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;

  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v19 - 72);
  v21 = a19;
  if (a19)
  {
    v22 = (unint64_t *)(a19 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
  }
  telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&a11);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIClientTransport::handleMessage(telephonytransport::PCIClientTransport *this, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  unint64_t v4;
  NSObject **v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  unint64_t v13;
  _BYTE *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  __int128 v18;
  uint64_t v19;
  NSObject **v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  unint64_t v25;
  __int128 v26;
  NSObject **v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  _BYTE *v32;
  const char *v33;
  __int128 v34;
  uint64_t v35;
  NSObject **v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  NSObject *v40;
  _BYTE *v41;
  const char *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  __int128 v46;
  uint64_t v47;
  NSObject **v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  NSObject *v52;
  unint64_t v53;
  NSObject **v54;
  std::__shared_weak_count *v55;
  unint64_t *p_shared_owners;
  unint64_t v57;
  NSObject *v58;
  unint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  __int128 v63;
  uint64_t v64;
  NSObject **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  NSObject *v69;
  unint64_t v70;
  _QWORD *v71;
  char *v72;
  _QWORD *v73;
  __int128 v74;
  uint64_t v75;
  NSObject **v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  NSObject *v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t *v84;
  _QWORD *v85;
  __int128 v86;
  uint64_t v87;
  NSObject **v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  NSObject *v92;
  unint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t *v96;
  _QWORD *v97;
  __int128 v98;
  uint64_t v99;
  NSObject **v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  NSObject *v104;
  unint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  uint64_t *v108;
  _QWORD *v109;
  __int128 v110;
  uint64_t v111;
  NSObject **v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  NSObject *v116;
  unint64_t v117;
  _QWORD *v118;
  _QWORD *v119;
  _QWORD *v120;
  __int128 v121;
  uint64_t v122;
  NSObject **v123;
  std::__shared_weak_count *v124;
  unint64_t *v125;
  unint64_t v126;
  NSObject *v127;
  unint64_t v128;
  NSObject **v129;
  uint64_t v130;
  unint64_t *v131;
  unint64_t v132;
  _BYTE *v133;
  NSObject *v134;
  NSObject **v135;
  std::__shared_weak_count *v136;
  unint64_t *v137;
  unint64_t v138;
  unint64_t v139;
  NSObject **v140;
  uint64_t v141;
  unint64_t *v142;
  unint64_t v143;
  _BYTE *v144;
  NSObject *v145;
  NSObject **v146;
  std::__shared_weak_count *v147;
  unint64_t *v148;
  unint64_t v149;
  unint64_t v150;
  NSObject **v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  unint64_t v155;
  NSObject **v156;
  std::__shared_weak_count *v157;
  unint64_t *v158;
  unint64_t v159;
  unint64_t v160;
  NSObject **v161;
  std::__shared_weak_count *v162;
  unint64_t *v163;
  unint64_t v164;
  unint64_t v165;
  NSObject **v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  unint64_t v170;
  NSObject **v171;
  std::__shared_weak_count *v172;
  unint64_t *v173;
  unint64_t v174;
  unint64_t v175;
  NSObject **v176;
  std::__shared_weak_count *v177;
  unint64_t *v178;
  unint64_t v179;
  unint64_t v180;
  NSObject **v181;
  std::__shared_weak_count *v182;
  unint64_t *v183;
  unint64_t v184;
  unint64_t v185;
  NSObject **v186;
  std::__shared_weak_count *v187;
  unint64_t *v188;
  unint64_t v189;
  NSObject *v190;
  unint64_t v191;
  NSObject **v192;
  std::__shared_weak_count *v193;
  unint64_t *v194;
  unint64_t v195;
  NSObject *v196;
  unint64_t v197;
  NSObject **v198;
  std::__shared_weak_count *v199;
  unint64_t *v200;
  unint64_t v201;
  unint64_t v202;
  NSObject **v203;
  std::__shared_weak_count *v204;
  unint64_t *v205;
  unint64_t v206;
  unint64_t v207;
  NSObject **v208;
  std::__shared_weak_count *v209;
  unint64_t *v210;
  unint64_t v211;
  unint64_t v212;
  NSObject **v213;
  std::__shared_weak_count *v214;
  unint64_t *v215;
  unint64_t v216;
  unint64_t v217;
  NSObject **v218;
  std::__shared_weak_count *v219;
  unint64_t *v220;
  unint64_t v221;
  unint64_t v222;
  NSObject **v223;
  std::__shared_weak_count *v224;
  unint64_t *v225;
  unint64_t v226;
  unint64_t v227;
  NSObject **v228;
  std::__shared_weak_count *v229;
  unint64_t *v230;
  unint64_t v231;
  unint64_t v232;
  _BYTE *v233;
  const char *v234;
  _BYTE *v235;
  const char *v236;
  _BYTE *v237;
  const char *v238;
  _BYTE *v239;
  const char *v240;
  _BYTE *v241;
  const char *v242;
  _BYTE *v243;
  const char *v244;
  _BYTE *v245;
  const char *v246;
  _BYTE *v247;
  const char *v248;
  _BYTE *v249;
  uint64_t v250;
  _BYTE *v251;
  _BYTE *v252;
  _BYTE *v253;
  _BYTE *v254;
  _BYTE *v255;
  _BYTE *v256;
  _BYTE *v257;
  uint64_t v258;
  unint64_t v259;
  char v260;
  std::__shared_weak_count *v261;
  unint64_t *v262;
  unint64_t v263;
  NSObject **v264;
  std::__shared_weak_count *v265;
  unint64_t *v266;
  unint64_t v267;
  unint64_t v268;
  uint64_t v269;
  NSObject **v270;
  uint64_t v271;
  unint64_t *v272;
  unint64_t v273;
  NSObject *v274;
  NSObject **v275;
  uint64_t v276;
  unint64_t *v277;
  unint64_t v278;
  _BYTE *v279;
  uint64_t v280;
  unint64_t v281;
  char v282;
  std::__shared_weak_count *v283;
  unint64_t *v284;
  unint64_t v285;
  NSObject **v286;
  std::__shared_weak_count *v287;
  unint64_t *v288;
  unint64_t v289;
  unint64_t v290;
  uint64_t v291;
  unint64_t v292;
  char v293;
  std::__shared_weak_count *v294;
  unint64_t *v295;
  unint64_t v296;
  NSObject **v297;
  std::__shared_weak_count *v298;
  unint64_t *v299;
  unint64_t v300;
  unint64_t v301;
  uint64_t v302;
  unint64_t v303;
  char v304;
  std::__shared_weak_count *v305;
  unint64_t *v306;
  unint64_t v307;
  NSObject **v308;
  std::__shared_weak_count *v309;
  unint64_t *v310;
  unint64_t v311;
  unint64_t v312;
  uint64_t v313;
  unint64_t v314;
  char v315;
  std::__shared_weak_count *v316;
  unint64_t *v317;
  unint64_t v318;
  NSObject **v319;
  std::__shared_weak_count *v320;
  unint64_t *v321;
  unint64_t v322;
  unint64_t v323;
  uint64_t v324;
  unint64_t v325;
  char v326;
  std::__shared_weak_count *v327;
  unint64_t *v328;
  unint64_t v329;
  NSObject **v330;
  std::__shared_weak_count *v331;
  unint64_t *v332;
  unint64_t v333;
  unint64_t v334;
  uint64_t v335;
  unint64_t v336;
  char v337;
  std::__shared_weak_count *v338;
  unint64_t *v339;
  unint64_t v340;
  NSObject **v341;
  std::__shared_weak_count *v342;
  unint64_t *v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t v346;
  unint64_t v347;
  char v348;
  std::__shared_weak_count *v349;
  unint64_t *v350;
  unint64_t v351;
  NSObject **v352;
  std::__shared_weak_count *v353;
  unint64_t *v354;
  unint64_t v355;
  unint64_t v356;
  NSObject **v357;
  uint64_t v358;
  unint64_t *v359;
  unint64_t v360;
  _BYTE *v361;
  _BYTE *v362;
  _BYTE *v363;
  _BYTE *v364;
  _BYTE *v365;
  _BYTE *v366;
  _BYTE *v367;
  _BYTE *v368;
  _BYTE *v369;
  NSObject **v370;
  uint64_t v371;
  unint64_t *v372;
  unint64_t v373;
  _BYTE *v374;
  NSObject **v375;
  uint64_t v376;
  unint64_t *v377;
  unint64_t v378;
  _BYTE *v379;
  _BYTE *v380;
  _BYTE *v381;
  _BYTE *v382;
  std::__shared_weak_count *v383;
  unint64_t *v384;
  unint64_t v385;
  _BYTE *v386;
  unint64_t *v387;
  _BYTE *v388;
  unint64_t *v389;
  _BYTE *v390;
  unint64_t *v391;
  _BYTE *v392;
  unint64_t *v393;
  _BYTE *v394;
  unint64_t *v395;
  _BYTE *v396;
  unint64_t *v397;
  _BYTE *v398;
  unint64_t *v399;
  _BYTE __p[32];
  uint64_t v401;
  _BYTE v402[22];
  _BYTE buf[32];
  uint64_t v404;

  v404 = *MEMORY[0x24BDAC8D0];
  if (a2 - 1 >= 0x12)
    v4 = 0;
  else
    v4 = a2;
  switch((int)v4)
  {
    case 0:
      v54 = (NSObject **)*((_QWORD *)this + 1);
      v55 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v55)
      {
        p_shared_owners = (unint64_t *)&v55->__shared_owners_;
        do
          v57 = __ldxr(p_shared_owners);
        while (__stxr(v57 + 1, p_shared_owners));
        v58 = *v54;
        do
          v59 = __ldaxr(p_shared_owners);
        while (__stlxr(v59 - 1, p_shared_owners));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      else
      {
        v58 = *v54;
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 134217984;
        *(_QWORD *)&__p[4] = a4;
        _os_log_error_impl(&dword_20DA91000, v58, OS_LOG_TYPE_ERROR, "Skipping Unknown message type of length: %zu", __p, 0xCu);
      }
      return;
    case 1:
    case 3:
    case 7:
    case 9:
    case 11:
    case 13:
    case 15:
    case 17:
      v8 = (NSObject **)*((_QWORD *)this + 1);
      v9 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v9)
      {
        v10 = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
        v12 = *v8;
        do
          v13 = __ldaxr(v10);
        while (__stlxr(v13 - 1, v10));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      else
      {
        v12 = *v8;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        telephonytransport::toString(v4, __p);
        v14 = __p[23] >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        _os_log_error_impl(&dword_20DA91000, v12, OS_LOG_TYPE_ERROR, "Ignoring unsupported message type: %s, length: %zu", buf, 0x16u);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
      }
      return;
    case 2:
      v15 = operator new(0x38uLL);
      v15[2] = 0;
      v15[3] = off_24C80B420;
      v16 = (char *)(v15 + 3);
      *v15 = off_24C80ADA8;
      v15[1] = 0;
      v15[4] = 0;
      *((_DWORD *)v15 + 11) = 0;
      *((_DWORD *)v15 + 12) = 0;
      *(_QWORD *)v402 = v15 + 3;
      *(_QWORD *)&v402[8] = v15;
      if (!a4)
        goto LABEL_147;
      v17 = v15;
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v18;
      *(_OWORD *)&__p[16] = v18;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, _BYTE *))(*(_QWORD *)v16 + 16))(v16, __p) & 1) != 0)
      {
        v19 = v17[4];
        if (v19)
        {
          if ((*(_BYTE *)(v19 + 20) & 1) == 0)
          {
            v20 = (NSObject **)*((_QWORD *)this + 1);
            v21 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v21)
            {
              v22 = (unint64_t *)&v21->__shared_owners_;
              do
                v23 = __ldxr(v22);
              while (__stxr(v23 + 1, v22));
              v24 = *v20;
              do
                v25 = __ldaxr(v22);
              while (__stlxr(v25 - 1, v22));
              if (!v25)
              {
                ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            else
            {
              v24 = *v20;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
              if (__p[23] >= 0)
                v362 = __p;
              else
                v362 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v362;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v234 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_602;
            }
            goto LABEL_604;
          }
          v258 = *((_QWORD *)this + 3);
          v259 = *(_QWORD *)(v19 + 8);
          *(_QWORD *)__p = v16;
          *(_QWORD *)&__p[8] = v17;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v260 = telephonytransport::TransactionManager::fulfilPromise(v258, v259, 2, (__int128 *)__p);
          v261 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v262 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v263 = __ldaxr(v262);
            while (__stlxr(v263 - 1, v262));
            if (!v263)
            {
              ((void (*)(std::__shared_weak_count *))v261->__on_zero_shared)(v261);
              std::__shared_weak_count::__release_weak(v261);
            }
          }
          if ((v260 & 1) == 0)
          {
            v264 = (NSObject **)*((_QWORD *)this + 1);
            v265 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v265)
            {
              v266 = (unint64_t *)&v265->__shared_owners_;
              do
                v267 = __ldxr(v266);
              while (__stxr(v267 + 1, v266));
              v24 = *v264;
              do
                v268 = __ldaxr(v266);
              while (__stlxr(v268 - 1, v266));
              if (!v268)
              {
                ((void (*)(std::__shared_weak_count *))v265->__on_zero_shared)(v265);
                std::__shared_weak_count::__release_weak(v265);
              }
            }
            else
            {
              v24 = *v264;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
              if (__p[23] >= 0)
                v382 = __p;
              else
                v382 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v382;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v234 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_602;
            }
          }
LABEL_604:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v384 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v384);
            while (__stlxr(v385 - 1, v384));
            goto LABEL_691;
          }
          return;
        }
LABEL_147:
        v135 = (NSObject **)*((_QWORD *)this + 1);
        v136 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v136)
        {
          v137 = (unint64_t *)&v136->__shared_owners_;
          do
            v138 = __ldxr(v137);
          while (__stxr(v138 + 1, v137));
          v24 = *v135;
          do
            v139 = __ldaxr(v137);
          while (__stlxr(v139 - 1, v137));
          if (!v139)
          {
            ((void (*)(std::__shared_weak_count *))v136->__on_zero_shared)(v136);
            std::__shared_weak_count::__release_weak(v136);
          }
        }
        else
        {
          v24 = *v135;
        }
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          goto LABEL_604;
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
        if (__p[23] >= 0)
          v233 = __p;
        else
          v233 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v233;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v234 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v181 = (NSObject **)*((_QWORD *)this + 1);
        v182 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v182)
        {
          v183 = (unint64_t *)&v182->__shared_owners_;
          do
            v184 = __ldxr(v183);
          while (__stxr(v184 + 1, v183));
          v24 = *v181;
          do
            v185 = __ldaxr(v183);
          while (__stlxr(v185 - 1, v183));
          if (!v185)
          {
            ((void (*)(std::__shared_weak_count *))v182->__on_zero_shared)(v182);
            std::__shared_weak_count::__release_weak(v182);
          }
        }
        else
        {
          v24 = *v181;
        }
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          goto LABEL_604;
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
        if (__p[23] >= 0)
          v249 = __p;
        else
          v249 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v249;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v234 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_602:
      _os_log_error_impl(&dword_20DA91000, v24, OS_LOG_TYPE_ERROR, v234, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_604;
    case 4:
      v60 = operator new(0x38uLL);
      v60[2] = 0;
      v60[3] = off_24C80B3B0;
      v61 = v60 + 3;
      *v60 = off_24C80ADF8;
      v60[1] = 0;
      v60[5] = 0;
      v60[6] = 0;
      v60[4] = 0;
      *(_QWORD *)v402 = v60 + 3;
      *(_QWORD *)&v402[8] = v60;
      if (!a4)
        goto LABEL_170;
      v62 = v60;
      *(_QWORD *)&v63 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v63 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v63;
      *(_OWORD *)&__p[16] = v63;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v61 + 16))(v61, __p) & 1) != 0)
      {
        v64 = v62[5];
        if (v64)
        {
          if ((*(_BYTE *)(v64 + 20) & 1) == 0)
          {
            v65 = (NSObject **)*((_QWORD *)this + 1);
            v66 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v66)
            {
              v67 = (unint64_t *)&v66->__shared_owners_;
              do
                v68 = __ldxr(v67);
              while (__stxr(v68 + 1, v67));
              v69 = *v65;
              do
                v70 = __ldaxr(v67);
              while (__stlxr(v70 - 1, v67));
              if (!v70)
              {
                ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
                std::__shared_weak_count::__release_weak(v66);
              }
            }
            else
            {
              v69 = *v65;
            }
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
              if (__p[23] >= 0)
                v364 = __p;
              else
                v364 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v364;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v238 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_626;
            }
            goto LABEL_628;
          }
          v291 = *((_QWORD *)this + 3);
          v292 = *(_QWORD *)(v64 + 8);
          *(_QWORD *)__p = v61;
          *(_QWORD *)&__p[8] = v62;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v293 = telephonytransport::TransactionManager::fulfilPromise(v291, v292, 4, (__int128 *)__p);
          v294 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v295 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v296 = __ldaxr(v295);
            while (__stlxr(v296 - 1, v295));
            if (!v296)
            {
              ((void (*)(std::__shared_weak_count *))v294->__on_zero_shared)(v294);
              std::__shared_weak_count::__release_weak(v294);
            }
          }
          if ((v293 & 1) == 0)
          {
            v297 = (NSObject **)*((_QWORD *)this + 1);
            v298 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v298)
            {
              v299 = (unint64_t *)&v298->__shared_owners_;
              do
                v300 = __ldxr(v299);
              while (__stxr(v300 + 1, v299));
              v69 = *v297;
              do
                v301 = __ldaxr(v299);
              while (__stlxr(v301 - 1, v299));
              if (!v301)
              {
                ((void (*)(std::__shared_weak_count *))v298->__on_zero_shared)(v298);
                std::__shared_weak_count::__release_weak(v298);
              }
            }
            else
            {
              v69 = *v297;
            }
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
              if (__p[23] >= 0)
                v388 = __p;
              else
                v388 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v388;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v238 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_626;
            }
          }
LABEL_628:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v389 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v389);
            while (__stlxr(v385 - 1, v389));
            goto LABEL_691;
          }
          return;
        }
LABEL_170:
        v151 = (NSObject **)*((_QWORD *)this + 1);
        v152 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v152)
        {
          v153 = (unint64_t *)&v152->__shared_owners_;
          do
            v154 = __ldxr(v153);
          while (__stxr(v154 + 1, v153));
          v69 = *v151;
          do
            v155 = __ldaxr(v153);
          while (__stlxr(v155 - 1, v153));
          if (!v155)
          {
            ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
            std::__shared_weak_count::__release_weak(v152);
          }
        }
        else
        {
          v69 = *v151;
        }
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          goto LABEL_628;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
        if (__p[23] >= 0)
          v237 = __p;
        else
          v237 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v237;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v238 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v203 = (NSObject **)*((_QWORD *)this + 1);
        v204 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v204)
        {
          v205 = (unint64_t *)&v204->__shared_owners_;
          do
            v206 = __ldxr(v205);
          while (__stxr(v206 + 1, v205));
          v69 = *v203;
          do
            v207 = __ldaxr(v205);
          while (__stlxr(v207 - 1, v205));
          if (!v207)
          {
            ((void (*)(std::__shared_weak_count *))v204->__on_zero_shared)(v204);
            std::__shared_weak_count::__release_weak(v204);
          }
        }
        else
        {
          v69 = *v203;
        }
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          goto LABEL_628;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
        if (__p[23] >= 0)
          v252 = __p;
        else
          v252 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v252;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v238 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_626:
      _os_log_error_impl(&dword_20DA91000, v69, OS_LOG_TYPE_ERROR, v238, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_628;
    case 5:
      *(_QWORD *)&buf[8] = 0;
      *(_QWORD *)&buf[16] = 0;
      *(_QWORD *)buf = off_24C80B340;
      if (!a4)
        goto LABEL_138;
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v26;
      *(_OWORD *)&__p[16] = v26;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(telephonytransport::PCIReadIndication *, PB::Reader *))(*(_QWORD *)buf + 16))((telephonytransport::PCIReadIndication *)buf, (PB::Reader *)__p) & 1) != 0)
      {
        if (*(_QWORD *)&buf[16])
        {
          if ((*(_BYTE *)(*(_QWORD *)&buf[16] + 20) & 2) != 0)
          {
            if (*(_QWORD *)&buf[8])
            {
              v269 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8);
              if (!v269)
              {
                v270 = (NSObject **)*((_QWORD *)this + 1);
                v271 = *((_QWORD *)this + 2);
                *(_QWORD *)__p = v270;
                *(_QWORD *)&__p[8] = v271;
                if (v271)
                {
                  v272 = (unint64_t *)(v271 + 8);
                  do
                    v273 = __ldxr(v272);
                  while (__stxr(v273 + 1, v272));
                }
                v274 = *v270;
                std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
                if (os_log_type_enabled(v274, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)__p = 0;
                  _os_log_fault_impl(&dword_20DA91000, v274, OS_LOG_TYPE_FAULT, "Zero size message is not expected in read indication", __p, 2u);
                }
                __break(1u);
                goto LABEL_410;
              }
              std::function<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(*((_QWORD *)this + 7), *(_DWORD *)(*(_QWORD *)&buf[16] + 16), **(_QWORD **)&buf[8], v269);
              goto LABEL_341;
            }
            v370 = (NSObject **)*((_QWORD *)this + 1);
            v371 = *((_QWORD *)this + 2);
            *(_QWORD *)__p = v370;
            *(_QWORD *)&__p[8] = v371;
            if (v371)
            {
              v372 = (unint64_t *)(v371 + 8);
              do
                v373 = __ldxr(v372);
              while (__stxr(v373 + 1, v372));
            }
            v31 = *v370;
            std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
LABEL_341:
              telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)buf);
              return;
            }
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadIndication");
            if (__p[23] >= 0)
              v374 = __p;
            else
              v374 = *(_BYTE **)__p;
            *(_DWORD *)v402 = 136315394;
            *(_QWORD *)&v402[4] = "data";
            *(_WORD *)&v402[12] = 2080;
            *(_QWORD *)&v402[14] = v374;
            v33 = "%s is missing. Skipping MessageType: %s";
          }
          else
          {
            v27 = (NSObject **)*((_QWORD *)this + 1);
            v28 = *((_QWORD *)this + 2);
            *(_QWORD *)__p = v27;
            *(_QWORD *)&__p[8] = v28;
            if (v28)
            {
              v29 = (unint64_t *)(v28 + 8);
              do
                v30 = __ldxr(v29);
              while (__stxr(v30 + 1, v29));
            }
            v31 = *v27;
            std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              goto LABEL_341;
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadIndication");
            if (__p[23] >= 0)
              v32 = __p;
            else
              v32 = *(_BYTE **)__p;
            *(_DWORD *)v402 = 136315394;
            *(_QWORD *)&v402[4] = "messageId()->hasTransportToken";
            *(_WORD *)&v402[12] = 2080;
            *(_QWORD *)&v402[14] = v32;
            v33 = "%s is missing. Skipping MessageType: %s";
          }
        }
        else
        {
LABEL_138:
          v129 = (NSObject **)*((_QWORD *)this + 1);
          v130 = *((_QWORD *)this + 2);
          *(_QWORD *)__p = v129;
          *(_QWORD *)&__p[8] = v130;
          if (v130)
          {
            v131 = (unint64_t *)(v130 + 8);
            do
              v132 = __ldxr(v131);
            while (__stxr(v132 + 1, v131));
          }
          v31 = *v129;
          std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            goto LABEL_341;
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadIndication");
          if (__p[23] >= 0)
            v133 = __p;
          else
            v133 = *(_BYTE **)__p;
          *(_DWORD *)v402 = 136315394;
          *(_QWORD *)&v402[4] = "messageId";
          *(_WORD *)&v402[12] = 2080;
          *(_QWORD *)&v402[14] = v133;
          v33 = "%s is missing. Skipping MessageType: %s";
        }
        v134 = v31;
      }
      else
      {
        v186 = (NSObject **)*((_QWORD *)this + 1);
        v187 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v187)
        {
          v188 = (unint64_t *)&v187->__shared_owners_;
          do
            v189 = __ldxr(v188);
          while (__stxr(v189 + 1, v188));
          v190 = *v186;
          do
            v191 = __ldaxr(v188);
          while (__stlxr(v191 - 1, v188));
          if (!v191)
          {
            ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
            std::__shared_weak_count::__release_weak(v187);
          }
        }
        else
        {
          v190 = *v186;
        }
        if (!os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
          goto LABEL_341;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadIndication");
        if (__p[23] >= 0)
          v380 = __p;
        else
          v380 = *(_BYTE **)__p;
        *(_DWORD *)v402 = 136315394;
        *(_QWORD *)&v402[4] = v380;
        *(_WORD *)&v402[12] = 2048;
        *(_QWORD *)&v402[14] = a4;
        v33 = "Failed to deserialize message. MessageType: %s, length: %zu";
        v134 = v190;
      }
      _os_log_error_impl(&dword_20DA91000, v134, OS_LOG_TYPE_ERROR, v33, v402, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_341;
    case 6:
      *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v401 = 2863311530;
      *(_OWORD *)&__p[8] = v34;
      *(_QWORD *)__p = off_24C80B500;
      *(_QWORD *)&__p[24] = 0;
      if (!a4)
        goto LABEL_154;
      *(_OWORD *)buf = v34;
      *(_OWORD *)&buf[16] = v34;
      PB::Reader::Reader((PB::Reader *)buf, a3);
      if (((*(uint64_t (**)(telephonytransport::PCIStatusIndication *, PB::Reader *))(*(_QWORD *)__p + 16))((telephonytransport::PCIStatusIndication *)__p, (PB::Reader *)buf) & 1) != 0)
      {
        v35 = *(_QWORD *)&__p[24];
        if (*(_QWORD *)&__p[24])
        {
          if ((*(_BYTE *)(*(_QWORD *)&__p[24] + 20) & 2) != 0)
          {
LABEL_410:
            if ((v401 & 0x400000000) != 0)
            {
              if ((v401 & 0x100000000) != 0)
              {
                if ((v401 & 0x200000000) != 0)
                {
                  std::function<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(*((_QWORD *)this + 11), *(_DWORD *)(v35 + 16), v401, *(uint64_t *)&__p[8], *(uint64_t *)&__p[16]);
                  goto LABEL_344;
                }
                v375 = (NSObject **)*((_QWORD *)this + 1);
                v376 = *((_QWORD *)this + 2);
                *(_QWORD *)buf = v375;
                *(_QWORD *)&buf[8] = v376;
                if (v376)
                {
                  v377 = (unint64_t *)(v376 + 8);
                  do
                    v378 = __ldxr(v377);
                  while (__stxr(v378 + 1, v377));
                }
                v40 = *v375;
                std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)buf);
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  goto LABEL_344;
                std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
                if (buf[23] >= 0)
                  v379 = buf;
                else
                  v379 = *(_BYTE **)buf;
                *(_DWORD *)v402 = 136315394;
                *(_QWORD *)&v402[4] = "Arg2";
                *(_WORD *)&v402[12] = 2080;
                *(_QWORD *)&v402[14] = v379;
                v42 = "%s is missing. Skipping MessageType: %s";
              }
              else
              {
                v357 = (NSObject **)*((_QWORD *)this + 1);
                v358 = *((_QWORD *)this + 2);
                *(_QWORD *)buf = v357;
                *(_QWORD *)&buf[8] = v358;
                if (v358)
                {
                  v359 = (unint64_t *)(v358 + 8);
                  do
                    v360 = __ldxr(v359);
                  while (__stxr(v360 + 1, v359));
                }
                v40 = *v357;
                std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)buf);
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  goto LABEL_344;
                std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
                if (buf[23] >= 0)
                  v361 = buf;
                else
                  v361 = *(_BYTE **)buf;
                *(_DWORD *)v402 = 136315394;
                *(_QWORD *)&v402[4] = "Arg1";
                *(_WORD *)&v402[12] = 2080;
                *(_QWORD *)&v402[14] = v361;
                v42 = "%s is missing. Skipping MessageType: %s";
              }
            }
            else
            {
              v275 = (NSObject **)*((_QWORD *)this + 1);
              v276 = *((_QWORD *)this + 2);
              *(_QWORD *)buf = v275;
              *(_QWORD *)&buf[8] = v276;
              if (v276)
              {
                v277 = (unint64_t *)(v276 + 8);
                do
                  v278 = __ldxr(v277);
                while (__stxr(v278 + 1, v277));
              }
              v40 = *v275;
              std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)buf);
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                goto LABEL_344;
              std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
              if (buf[23] >= 0)
                v279 = buf;
              else
                v279 = *(_BYTE **)buf;
              *(_DWORD *)v402 = 136315394;
              *(_QWORD *)&v402[4] = "Status";
              *(_WORD *)&v402[12] = 2080;
              *(_QWORD *)&v402[14] = v279;
              v42 = "%s is missing. Skipping MessageType: %s";
            }
LABEL_162:
            v145 = v40;
            goto LABEL_594;
          }
          v36 = (NSObject **)*((_QWORD *)this + 1);
          v37 = *((_QWORD *)this + 2);
          *(_QWORD *)buf = v36;
          *(_QWORD *)&buf[8] = v37;
          if (v37)
          {
            v38 = (unint64_t *)(v37 + 8);
            do
              v39 = __ldxr(v38);
            while (__stxr(v39 + 1, v38));
          }
          v40 = *v36;
          std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)buf);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
            if (buf[23] >= 0)
              v41 = buf;
            else
              v41 = *(_BYTE **)buf;
            *(_DWORD *)v402 = 136315394;
            *(_QWORD *)&v402[4] = "messageId()->hasTransportToken";
            *(_WORD *)&v402[12] = 2080;
            *(_QWORD *)&v402[14] = v41;
            v42 = "%s is missing. Skipping MessageType: %s";
            goto LABEL_162;
          }
        }
        else
        {
LABEL_154:
          v140 = (NSObject **)*((_QWORD *)this + 1);
          v141 = *((_QWORD *)this + 2);
          *(_QWORD *)buf = v140;
          *(_QWORD *)&buf[8] = v141;
          if (v141)
          {
            v142 = (unint64_t *)(v141 + 8);
            do
              v143 = __ldxr(v142);
            while (__stxr(v143 + 1, v142));
          }
          v40 = *v140;
          std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)buf);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
            if (buf[23] >= 0)
              v144 = buf;
            else
              v144 = *(_BYTE **)buf;
            *(_DWORD *)v402 = 136315394;
            *(_QWORD *)&v402[4] = "messageId";
            *(_WORD *)&v402[12] = 2080;
            *(_QWORD *)&v402[14] = v144;
            v42 = "%s is missing. Skipping MessageType: %s";
            goto LABEL_162;
          }
        }
      }
      else
      {
        v192 = (NSObject **)*((_QWORD *)this + 1);
        v193 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v193)
        {
          v194 = (unint64_t *)&v193->__shared_owners_;
          do
            v195 = __ldxr(v194);
          while (__stxr(v195 + 1, v194));
          v196 = *v192;
          do
            v197 = __ldaxr(v194);
          while (__stlxr(v197 - 1, v194));
          if (!v197)
          {
            ((void (*)(std::__shared_weak_count *))v193->__on_zero_shared)(v193);
            std::__shared_weak_count::__release_weak(v193);
          }
        }
        else
        {
          v196 = *v192;
        }
        if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
          if (buf[23] >= 0)
            v381 = buf;
          else
            v381 = *(_BYTE **)buf;
          *(_DWORD *)v402 = 136315394;
          *(_QWORD *)&v402[4] = v381;
          *(_WORD *)&v402[12] = 2048;
          *(_QWORD *)&v402[14] = a4;
          v42 = "Failed to deserialize message. MessageType: %s, length: %zu";
          v145 = v196;
LABEL_594:
          _os_log_error_impl(&dword_20DA91000, v145, OS_LOG_TYPE_ERROR, v42, v402, 0x16u);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
        }
      }
LABEL_344:
      v250 = *(_QWORD *)&__p[24];
      *(_QWORD *)__p = v4 + 16;
      *(_QWORD *)&__p[24] = 0;
      if (v250)
        (*(void (**)(uint64_t))(*(_QWORD *)v250 + 8))(v250);
      PB::Base::~Base((PB::Base *)__p);
      return;
    case 8:
      v71 = operator new(0x38uLL);
      v71[2] = 0;
      v71[3] = off_24C80B570;
      v72 = (char *)(v71 + 3);
      *v71 = off_24C80AE48;
      v71[1] = 0;
      v71[4] = 0;
      *((_DWORD *)v71 + 11) = 0;
      *((_DWORD *)v71 + 12) = 0;
      *(_QWORD *)v402 = v71 + 3;
      *(_QWORD *)&v402[8] = v71;
      if (!a4)
        goto LABEL_177;
      v73 = v71;
      *(_QWORD *)&v74 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v74 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v74;
      *(_OWORD *)&__p[16] = v74;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(char *, _BYTE *))(*(_QWORD *)v72 + 16))(v72, __p) & 1) != 0)
      {
        v75 = v73[4];
        if (v75)
        {
          if ((*(_BYTE *)(v75 + 20) & 1) == 0)
          {
            v76 = (NSObject **)*((_QWORD *)this + 1);
            v77 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v77)
            {
              v78 = (unint64_t *)&v77->__shared_owners_;
              do
                v79 = __ldxr(v78);
              while (__stxr(v79 + 1, v78));
              v80 = *v76;
              do
                v81 = __ldaxr(v78);
              while (__stlxr(v81 - 1, v78));
              if (!v81)
              {
                ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
                std::__shared_weak_count::__release_weak(v77);
              }
            }
            else
            {
              v80 = *v76;
            }
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
              if (__p[23] >= 0)
                v365 = __p;
              else
                v365 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v365;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v240 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_638;
            }
            goto LABEL_640;
          }
          v302 = *((_QWORD *)this + 3);
          v303 = *(_QWORD *)(v75 + 8);
          *(_QWORD *)__p = v72;
          *(_QWORD *)&__p[8] = v73;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v304 = telephonytransport::TransactionManager::fulfilPromise(v302, v303, 8, (__int128 *)__p);
          v305 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v306 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v307 = __ldaxr(v306);
            while (__stlxr(v307 - 1, v306));
            if (!v307)
            {
              ((void (*)(std::__shared_weak_count *))v305->__on_zero_shared)(v305);
              std::__shared_weak_count::__release_weak(v305);
            }
          }
          if ((v304 & 1) == 0)
          {
            v308 = (NSObject **)*((_QWORD *)this + 1);
            v309 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v309)
            {
              v310 = (unint64_t *)&v309->__shared_owners_;
              do
                v311 = __ldxr(v310);
              while (__stxr(v311 + 1, v310));
              v80 = *v308;
              do
                v312 = __ldaxr(v310);
              while (__stlxr(v312 - 1, v310));
              if (!v312)
              {
                ((void (*)(std::__shared_weak_count *))v309->__on_zero_shared)(v309);
                std::__shared_weak_count::__release_weak(v309);
              }
            }
            else
            {
              v80 = *v308;
            }
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
              if (__p[23] >= 0)
                v390 = __p;
              else
                v390 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v390;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v240 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_638;
            }
          }
LABEL_640:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v391 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v391);
            while (__stlxr(v385 - 1, v391));
            goto LABEL_691;
          }
          return;
        }
LABEL_177:
        v156 = (NSObject **)*((_QWORD *)this + 1);
        v157 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v157)
        {
          v158 = (unint64_t *)&v157->__shared_owners_;
          do
            v159 = __ldxr(v158);
          while (__stxr(v159 + 1, v158));
          v80 = *v156;
          do
            v160 = __ldaxr(v158);
          while (__stlxr(v160 - 1, v158));
          if (!v160)
          {
            ((void (*)(std::__shared_weak_count *))v157->__on_zero_shared)(v157);
            std::__shared_weak_count::__release_weak(v157);
          }
        }
        else
        {
          v80 = *v156;
        }
        if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          goto LABEL_640;
        std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
        if (__p[23] >= 0)
          v239 = __p;
        else
          v239 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v239;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v240 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v208 = (NSObject **)*((_QWORD *)this + 1);
        v209 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v209)
        {
          v210 = (unint64_t *)&v209->__shared_owners_;
          do
            v211 = __ldxr(v210);
          while (__stxr(v211 + 1, v210));
          v80 = *v208;
          do
            v212 = __ldaxr(v210);
          while (__stlxr(v212 - 1, v210));
          if (!v212)
          {
            ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
            std::__shared_weak_count::__release_weak(v209);
          }
        }
        else
        {
          v80 = *v208;
        }
        if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          goto LABEL_640;
        std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
        if (__p[23] >= 0)
          v253 = __p;
        else
          v253 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v253;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v240 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_638:
      _os_log_error_impl(&dword_20DA91000, v80, OS_LOG_TYPE_ERROR, v240, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_640;
    case 10:
      v106 = operator new(0x30uLL);
      v106[1] = 0;
      v106[2] = 0;
      *v106 = off_24C80AE98;
      v106[3] = off_24C80B490;
      v107 = v106 + 3;
      v106[4] = 0;
      v108 = v106 + 4;
      v106[5] = 0;
      *(_QWORD *)v402 = v106 + 3;
      *(_QWORD *)&v402[8] = v106;
      if (!a4)
        goto LABEL_198;
      v109 = v106;
      *(_QWORD *)&v110 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v110 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v110;
      *(_OWORD *)&__p[16] = v110;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v107 + 16))(v107, __p) & 1) != 0)
      {
        v111 = *v108;
        if (*v108)
        {
          if ((*(_BYTE *)(v111 + 20) & 1) == 0)
          {
            v112 = (NSObject **)*((_QWORD *)this + 1);
            v113 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v113)
            {
              v114 = (unint64_t *)&v113->__shared_owners_;
              do
                v115 = __ldxr(v114);
              while (__stxr(v115 + 1, v114));
              v116 = *v112;
              do
                v117 = __ldaxr(v114);
              while (__stlxr(v117 - 1, v114));
              if (!v117)
              {
                ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
                std::__shared_weak_count::__release_weak(v113);
              }
            }
            else
            {
              v116 = *v112;
            }
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
              if (__p[23] >= 0)
                v368 = __p;
              else
                v368 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v368;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v246 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_674;
            }
            goto LABEL_676;
          }
          v335 = *((_QWORD *)this + 3);
          v336 = *(_QWORD *)(v111 + 8);
          *(_QWORD *)__p = v107;
          *(_QWORD *)&__p[8] = v109;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v337 = telephonytransport::TransactionManager::fulfilPromise(v335, v336, 10, (__int128 *)__p);
          v338 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v339 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v340 = __ldaxr(v339);
            while (__stlxr(v340 - 1, v339));
            if (!v340)
            {
              ((void (*)(std::__shared_weak_count *))v338->__on_zero_shared)(v338);
              std::__shared_weak_count::__release_weak(v338);
            }
          }
          if ((v337 & 1) == 0)
          {
            v341 = (NSObject **)*((_QWORD *)this + 1);
            v342 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v342)
            {
              v343 = (unint64_t *)&v342->__shared_owners_;
              do
                v344 = __ldxr(v343);
              while (__stxr(v344 + 1, v343));
              v116 = *v341;
              do
                v345 = __ldaxr(v343);
              while (__stlxr(v345 - 1, v343));
              if (!v345)
              {
                ((void (*)(std::__shared_weak_count *))v342->__on_zero_shared)(v342);
                std::__shared_weak_count::__release_weak(v342);
              }
            }
            else
            {
              v116 = *v341;
            }
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
              if (__p[23] >= 0)
                v396 = __p;
              else
                v396 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v396;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v246 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_674;
            }
          }
LABEL_676:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v397 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v397);
            while (__stlxr(v385 - 1, v397));
            goto LABEL_691;
          }
          return;
        }
LABEL_198:
        v171 = (NSObject **)*((_QWORD *)this + 1);
        v172 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v172)
        {
          v173 = (unint64_t *)&v172->__shared_owners_;
          do
            v174 = __ldxr(v173);
          while (__stxr(v174 + 1, v173));
          v116 = *v171;
          do
            v175 = __ldaxr(v173);
          while (__stlxr(v175 - 1, v173));
          if (!v175)
          {
            ((void (*)(std::__shared_weak_count *))v172->__on_zero_shared)(v172);
            std::__shared_weak_count::__release_weak(v172);
          }
        }
        else
        {
          v116 = *v171;
        }
        if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          goto LABEL_676;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
        if (__p[23] >= 0)
          v245 = __p;
        else
          v245 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v245;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v246 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v223 = (NSObject **)*((_QWORD *)this + 1);
        v224 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v224)
        {
          v225 = (unint64_t *)&v224->__shared_owners_;
          do
            v226 = __ldxr(v225);
          while (__stxr(v226 + 1, v225));
          v116 = *v223;
          do
            v227 = __ldaxr(v225);
          while (__stlxr(v227 - 1, v225));
          if (!v227)
          {
            ((void (*)(std::__shared_weak_count *))v224->__on_zero_shared)(v224);
            std::__shared_weak_count::__release_weak(v224);
          }
        }
        else
        {
          v116 = *v223;
        }
        if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          goto LABEL_676;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
        if (__p[23] >= 0)
          v256 = __p;
        else
          v256 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v256;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v246 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_674:
      _os_log_error_impl(&dword_20DA91000, v116, OS_LOG_TYPE_ERROR, v246, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_676;
    case 12:
      v43 = operator new(0x38uLL);
      v43[2] = 0;
      v43[3] = off_24C80B1B8;
      v44 = v43 + 3;
      *v43 = off_24C80AEE8;
      v43[1] = 0;
      v43[4] = 0;
      v43[6] = 0;
      *(_QWORD *)v402 = v43 + 3;
      *(_QWORD *)&v402[8] = v43;
      if (!a4)
        goto LABEL_163;
      v45 = v43;
      *(_QWORD *)&v46 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v46;
      *(_OWORD *)&__p[16] = v46;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v44 + 16))(v44, __p) & 1) != 0)
      {
        v47 = v45[4];
        if (v47)
        {
          if ((*(_BYTE *)(v47 + 20) & 1) == 0)
          {
            v48 = (NSObject **)*((_QWORD *)this + 1);
            v49 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v49)
            {
              v50 = (unint64_t *)&v49->__shared_owners_;
              do
                v51 = __ldxr(v50);
              while (__stxr(v51 + 1, v50));
              v52 = *v48;
              do
                v53 = __ldaxr(v50);
              while (__stlxr(v53 - 1, v50));
              if (!v53)
              {
                ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
                std::__shared_weak_count::__release_weak(v49);
              }
            }
            else
            {
              v52 = *v48;
            }
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
              if (__p[23] >= 0)
                v363 = __p;
              else
                v363 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v363;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v236 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_614;
            }
            goto LABEL_616;
          }
          v280 = *((_QWORD *)this + 3);
          v281 = *(_QWORD *)(v47 + 8);
          *(_QWORD *)__p = v44;
          *(_QWORD *)&__p[8] = v45;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v282 = telephonytransport::TransactionManager::fulfilPromise(v280, v281, 12, (__int128 *)__p);
          v283 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v284 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v285 = __ldaxr(v284);
            while (__stlxr(v285 - 1, v284));
            if (!v285)
            {
              ((void (*)(std::__shared_weak_count *))v283->__on_zero_shared)(v283);
              std::__shared_weak_count::__release_weak(v283);
            }
          }
          if ((v282 & 1) == 0)
          {
            v286 = (NSObject **)*((_QWORD *)this + 1);
            v287 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v287)
            {
              v288 = (unint64_t *)&v287->__shared_owners_;
              do
                v289 = __ldxr(v288);
              while (__stxr(v289 + 1, v288));
              v52 = *v286;
              do
                v290 = __ldaxr(v288);
              while (__stlxr(v290 - 1, v288));
              if (!v290)
              {
                ((void (*)(std::__shared_weak_count *))v287->__on_zero_shared)(v287);
                std::__shared_weak_count::__release_weak(v287);
              }
            }
            else
            {
              v52 = *v286;
            }
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
              if (__p[23] >= 0)
                v386 = __p;
              else
                v386 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v386;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v236 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_614;
            }
          }
LABEL_616:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v387 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v387);
            while (__stlxr(v385 - 1, v387));
            goto LABEL_691;
          }
          return;
        }
LABEL_163:
        v146 = (NSObject **)*((_QWORD *)this + 1);
        v147 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v147)
        {
          v148 = (unint64_t *)&v147->__shared_owners_;
          do
            v149 = __ldxr(v148);
          while (__stxr(v149 + 1, v148));
          v52 = *v146;
          do
            v150 = __ldaxr(v148);
          while (__stlxr(v150 - 1, v148));
          if (!v150)
          {
            ((void (*)(std::__shared_weak_count *))v147->__on_zero_shared)(v147);
            std::__shared_weak_count::__release_weak(v147);
          }
        }
        else
        {
          v52 = *v146;
        }
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          goto LABEL_616;
        std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
        if (__p[23] >= 0)
          v235 = __p;
        else
          v235 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v235;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v236 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v198 = (NSObject **)*((_QWORD *)this + 1);
        v199 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v199)
        {
          v200 = (unint64_t *)&v199->__shared_owners_;
          do
            v201 = __ldxr(v200);
          while (__stxr(v201 + 1, v200));
          v52 = *v198;
          do
            v202 = __ldaxr(v200);
          while (__stlxr(v202 - 1, v200));
          if (!v202)
          {
            ((void (*)(std::__shared_weak_count *))v199->__on_zero_shared)(v199);
            std::__shared_weak_count::__release_weak(v199);
          }
        }
        else
        {
          v52 = *v198;
        }
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          goto LABEL_616;
        std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
        if (__p[23] >= 0)
          v251 = __p;
        else
          v251 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v251;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v236 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_614:
      _os_log_error_impl(&dword_20DA91000, v52, OS_LOG_TYPE_ERROR, v236, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_616;
    case 14:
      v118 = operator new(0x38uLL);
      v118[2] = 0;
      v118[3] = off_24C80B228;
      v119 = v118 + 3;
      *v118 = off_24C80AF38;
      v118[1] = 0;
      v118[5] = 0;
      v118[6] = 0;
      v118[4] = 0;
      *(_QWORD *)v402 = v118 + 3;
      *(_QWORD *)&v402[8] = v118;
      if (!a4)
        goto LABEL_205;
      v120 = v118;
      *(_QWORD *)&v121 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v121 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v121;
      *(_OWORD *)&__p[16] = v121;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v119 + 16))(v119, __p) & 1) != 0)
      {
        v122 = v120[5];
        if (v122)
        {
          if ((*(_BYTE *)(v122 + 20) & 1) == 0)
          {
            v123 = (NSObject **)*((_QWORD *)this + 1);
            v124 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v124)
            {
              v125 = (unint64_t *)&v124->__shared_owners_;
              do
                v126 = __ldxr(v125);
              while (__stxr(v126 + 1, v125));
              v127 = *v123;
              do
                v128 = __ldaxr(v125);
              while (__stlxr(v128 - 1, v125));
              if (!v128)
              {
                ((void (*)(std::__shared_weak_count *))v124->__on_zero_shared)(v124);
                std::__shared_weak_count::__release_weak(v124);
              }
            }
            else
            {
              v127 = *v123;
            }
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
              if (__p[23] >= 0)
                v369 = __p;
              else
                v369 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v369;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v248 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_686;
            }
            goto LABEL_688;
          }
          v346 = *((_QWORD *)this + 3);
          v347 = *(_QWORD *)(v122 + 8);
          *(_QWORD *)__p = v119;
          *(_QWORD *)&__p[8] = v120;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v348 = telephonytransport::TransactionManager::fulfilPromise(v346, v347, 14, (__int128 *)__p);
          v349 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v350 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v351 = __ldaxr(v350);
            while (__stlxr(v351 - 1, v350));
            if (!v351)
            {
              ((void (*)(std::__shared_weak_count *))v349->__on_zero_shared)(v349);
              std::__shared_weak_count::__release_weak(v349);
            }
          }
          if ((v348 & 1) == 0)
          {
            v352 = (NSObject **)*((_QWORD *)this + 1);
            v353 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v353)
            {
              v354 = (unint64_t *)&v353->__shared_owners_;
              do
                v355 = __ldxr(v354);
              while (__stxr(v355 + 1, v354));
              v127 = *v352;
              do
                v356 = __ldaxr(v354);
              while (__stlxr(v356 - 1, v354));
              if (!v356)
              {
                ((void (*)(std::__shared_weak_count *))v353->__on_zero_shared)(v353);
                std::__shared_weak_count::__release_weak(v353);
              }
            }
            else
            {
              v127 = *v352;
            }
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
              if (__p[23] >= 0)
                v398 = __p;
              else
                v398 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v398;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v248 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_686;
            }
          }
LABEL_688:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v399 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v399);
            while (__stlxr(v385 - 1, v399));
            goto LABEL_691;
          }
          return;
        }
LABEL_205:
        v176 = (NSObject **)*((_QWORD *)this + 1);
        v177 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v177)
        {
          v178 = (unint64_t *)&v177->__shared_owners_;
          do
            v179 = __ldxr(v178);
          while (__stxr(v179 + 1, v178));
          v127 = *v176;
          do
            v180 = __ldaxr(v178);
          while (__stlxr(v180 - 1, v178));
          if (!v180)
          {
            ((void (*)(std::__shared_weak_count *))v177->__on_zero_shared)(v177);
            std::__shared_weak_count::__release_weak(v177);
          }
        }
        else
        {
          v127 = *v176;
        }
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          goto LABEL_688;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
        if (__p[23] >= 0)
          v247 = __p;
        else
          v247 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v247;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v248 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v228 = (NSObject **)*((_QWORD *)this + 1);
        v229 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v229)
        {
          v230 = (unint64_t *)&v229->__shared_owners_;
          do
            v231 = __ldxr(v230);
          while (__stxr(v231 + 1, v230));
          v127 = *v228;
          do
            v232 = __ldaxr(v230);
          while (__stlxr(v232 - 1, v230));
          if (!v232)
          {
            ((void (*)(std::__shared_weak_count *))v229->__on_zero_shared)(v229);
            std::__shared_weak_count::__release_weak(v229);
          }
        }
        else
        {
          v127 = *v228;
        }
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          goto LABEL_688;
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
        if (__p[23] >= 0)
          v257 = __p;
        else
          v257 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v257;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v248 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_686:
      _os_log_error_impl(&dword_20DA91000, v127, OS_LOG_TYPE_ERROR, v248, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_688;
    case 16:
      v82 = operator new(0x30uLL);
      v82[1] = 0;
      v82[2] = 0;
      *v82 = off_24C80AF88;
      v82[3] = off_24C80B1F0;
      v83 = v82 + 3;
      v82[4] = 0;
      v84 = v82 + 4;
      v82[5] = 0;
      *(_QWORD *)v402 = v82 + 3;
      *(_QWORD *)&v402[8] = v82;
      if (!a4)
        goto LABEL_184;
      v85 = v82;
      *(_QWORD *)&v86 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v86 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v86;
      *(_OWORD *)&__p[16] = v86;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v83 + 16))(v83, __p) & 1) != 0)
      {
        v87 = *v84;
        if (*v84)
        {
          if ((*(_BYTE *)(v87 + 20) & 1) == 0)
          {
            v88 = (NSObject **)*((_QWORD *)this + 1);
            v89 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v89)
            {
              v90 = (unint64_t *)&v89->__shared_owners_;
              do
                v91 = __ldxr(v90);
              while (__stxr(v91 + 1, v90));
              v92 = *v88;
              do
                v93 = __ldaxr(v90);
              while (__stlxr(v93 - 1, v90));
              if (!v93)
              {
                ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
                std::__shared_weak_count::__release_weak(v89);
              }
            }
            else
            {
              v92 = *v88;
            }
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
              if (__p[23] >= 0)
                v366 = __p;
              else
                v366 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v366;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v242 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
              goto LABEL_650;
            }
            goto LABEL_652;
          }
          v313 = *((_QWORD *)this + 3);
          v314 = *(_QWORD *)(v87 + 8);
          *(_QWORD *)__p = v83;
          *(_QWORD *)&__p[8] = v85;
          *(_QWORD *)v402 = 0;
          *(_QWORD *)&v402[8] = 0;
          v315 = telephonytransport::TransactionManager::fulfilPromise(v313, v314, 16, (__int128 *)__p);
          v316 = *(std::__shared_weak_count **)&__p[8];
          if (*(_QWORD *)&__p[8])
          {
            v317 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
            do
              v318 = __ldaxr(v317);
            while (__stlxr(v318 - 1, v317));
            if (!v318)
            {
              ((void (*)(std::__shared_weak_count *))v316->__on_zero_shared)(v316);
              std::__shared_weak_count::__release_weak(v316);
            }
          }
          if ((v315 & 1) == 0)
          {
            v319 = (NSObject **)*((_QWORD *)this + 1);
            v320 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
            if (v320)
            {
              v321 = (unint64_t *)&v320->__shared_owners_;
              do
                v322 = __ldxr(v321);
              while (__stxr(v322 + 1, v321));
              v92 = *v319;
              do
                v323 = __ldaxr(v321);
              while (__stlxr(v323 - 1, v321));
              if (!v323)
              {
                ((void (*)(std::__shared_weak_count *))v320->__on_zero_shared)(v320);
                std::__shared_weak_count::__release_weak(v320);
              }
            }
            else
            {
              v92 = *v319;
            }
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
              if (__p[23] >= 0)
                v392 = __p;
              else
                v392 = *(_BYTE **)__p;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v392;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a4;
              v242 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
              goto LABEL_650;
            }
          }
LABEL_652:
          v383 = *(std::__shared_weak_count **)&v402[8];
          if (*(_QWORD *)&v402[8])
          {
            v393 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
            do
              v385 = __ldaxr(v393);
            while (__stlxr(v385 - 1, v393));
            goto LABEL_691;
          }
          return;
        }
LABEL_184:
        v161 = (NSObject **)*((_QWORD *)this + 1);
        v162 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v162)
        {
          v163 = (unint64_t *)&v162->__shared_owners_;
          do
            v164 = __ldxr(v163);
          while (__stxr(v164 + 1, v163));
          v92 = *v161;
          do
            v165 = __ldaxr(v163);
          while (__stlxr(v165 - 1, v163));
          if (!v165)
          {
            ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
            std::__shared_weak_count::__release_weak(v162);
          }
        }
        else
        {
          v92 = *v161;
        }
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          goto LABEL_652;
        std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
        if (__p[23] >= 0)
          v241 = __p;
        else
          v241 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v241;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v242 = "messageId is missing. Skipping MessageType: %s, length: %zu";
      }
      else
      {
        v213 = (NSObject **)*((_QWORD *)this + 1);
        v214 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v214)
        {
          v215 = (unint64_t *)&v214->__shared_owners_;
          do
            v216 = __ldxr(v215);
          while (__stxr(v216 + 1, v215));
          v92 = *v213;
          do
            v217 = __ldaxr(v215);
          while (__stlxr(v217 - 1, v215));
          if (!v217)
          {
            ((void (*)(std::__shared_weak_count *))v214->__on_zero_shared)(v214);
            std::__shared_weak_count::__release_weak(v214);
          }
        }
        else
        {
          v92 = *v213;
        }
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          goto LABEL_652;
        std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
        if (__p[23] >= 0)
          v254 = __p;
        else
          v254 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v254;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v242 = "Failed to deserialize message. MessageType: %s, length: %zu";
      }
LABEL_650:
      _os_log_error_impl(&dword_20DA91000, v92, OS_LOG_TYPE_ERROR, v242, buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      goto LABEL_652;
    case 18:
      v94 = operator new(0x30uLL);
      v94[1] = 0;
      v94[2] = 0;
      *v94 = off_24C80AFD8;
      v94[3] = off_24C80B180;
      v95 = v94 + 3;
      v94[4] = 0;
      v96 = v94 + 4;
      v94[5] = 0;
      *(_QWORD *)v402 = v94 + 3;
      *(_QWORD *)&v402[8] = v94;
      if (!a4)
        goto LABEL_191;
      v97 = v94;
      *(_QWORD *)&v98 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v98 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v98;
      *(_OWORD *)&__p[16] = v98;
      PB::Reader::Reader((PB::Reader *)__p, a3);
      if (((*(uint64_t (**)(_QWORD *, _BYTE *))(*v95 + 16))(v95, __p) & 1) == 0)
      {
        v218 = (NSObject **)*((_QWORD *)this + 1);
        v219 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v219)
        {
          v220 = (unint64_t *)&v219->__shared_owners_;
          do
            v221 = __ldxr(v220);
          while (__stxr(v221 + 1, v220));
          v104 = *v218;
          do
            v222 = __ldaxr(v220);
          while (__stlxr(v222 - 1, v220));
          if (!v222)
          {
            ((void (*)(std::__shared_weak_count *))v219->__on_zero_shared)(v219);
            std::__shared_weak_count::__release_weak(v219);
          }
        }
        else
        {
          v104 = *v218;
        }
        if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          goto LABEL_664;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
        if (__p[23] >= 0)
          v255 = __p;
        else
          v255 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v255;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v244 = "Failed to deserialize message. MessageType: %s, length: %zu";
LABEL_662:
        _os_log_error_impl(&dword_20DA91000, v104, OS_LOG_TYPE_ERROR, v244, buf, 0x16u);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
        goto LABEL_664;
      }
      v99 = *v96;
      if (!*v96)
      {
LABEL_191:
        v166 = (NSObject **)*((_QWORD *)this + 1);
        v167 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v167)
        {
          v168 = (unint64_t *)&v167->__shared_owners_;
          do
            v169 = __ldxr(v168);
          while (__stxr(v169 + 1, v168));
          v104 = *v166;
          do
            v170 = __ldaxr(v168);
          while (__stlxr(v170 - 1, v168));
          if (!v170)
          {
            ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
            std::__shared_weak_count::__release_weak(v167);
          }
        }
        else
        {
          v104 = *v166;
        }
        if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          goto LABEL_664;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
        if (__p[23] >= 0)
          v243 = __p;
        else
          v243 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v243;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v244 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_662;
      }
      if ((*(_BYTE *)(v99 + 20) & 1) != 0)
      {
        v324 = *((_QWORD *)this + 3);
        v325 = *(_QWORD *)(v99 + 8);
        *(_QWORD *)__p = v95;
        *(_QWORD *)&__p[8] = v97;
        *(_QWORD *)v402 = 0;
        *(_QWORD *)&v402[8] = 0;
        v326 = telephonytransport::TransactionManager::fulfilPromise(v324, v325, 18, (__int128 *)__p);
        v327 = *(std::__shared_weak_count **)&__p[8];
        if (*(_QWORD *)&__p[8])
        {
          v328 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
          do
            v329 = __ldaxr(v328);
          while (__stlxr(v329 - 1, v328));
          if (!v329)
          {
            ((void (*)(std::__shared_weak_count *))v327->__on_zero_shared)(v327);
            std::__shared_weak_count::__release_weak(v327);
          }
        }
        if ((v326 & 1) != 0)
          goto LABEL_664;
        v330 = (NSObject **)*((_QWORD *)this + 1);
        v331 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v331)
        {
          v332 = (unint64_t *)&v331->__shared_owners_;
          do
            v333 = __ldxr(v332);
          while (__stxr(v333 + 1, v332));
          v104 = *v330;
          do
            v334 = __ldaxr(v332);
          while (__stlxr(v334 - 1, v332));
          if (!v334)
          {
            ((void (*)(std::__shared_weak_count *))v331->__on_zero_shared)(v331);
            std::__shared_weak_count::__release_weak(v331);
          }
        }
        else
        {
          v104 = *v330;
        }
        if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          goto LABEL_664;
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
        if (__p[23] >= 0)
          v394 = __p;
        else
          v394 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v394;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v244 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
        goto LABEL_662;
      }
      v100 = (NSObject **)*((_QWORD *)this + 1);
      v101 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      if (v101)
      {
        v102 = (unint64_t *)&v101->__shared_owners_;
        do
          v103 = __ldxr(v102);
        while (__stxr(v103 + 1, v102));
        v104 = *v100;
        do
          v105 = __ldaxr(v102);
        while (__stlxr(v105 - 1, v102));
        if (!v105)
        {
          ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
          std::__shared_weak_count::__release_weak(v101);
        }
      }
      else
      {
        v104 = *v100;
      }
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
        if (__p[23] >= 0)
          v367 = __p;
        else
          v367 = *(_BYTE **)__p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v367;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v244 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_662;
      }
LABEL_664:
      v383 = *(std::__shared_weak_count **)&v402[8];
      if (*(_QWORD *)&v402[8])
      {
        v395 = (unint64_t *)(*(_QWORD *)&v402[8] + 8);
        do
          v385 = __ldaxr(v395);
        while (__stlxr(v385 - 1, v395));
LABEL_691:
        if (!v385)
        {
          ((void (*)(std::__shared_weak_count *))v383->__on_zero_shared)(v383);
          std::__shared_weak_count::__release_weak(v383);
        }
      }
      return;
    default:
      return;
  }
}

void sub_20DAA8DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;

  v8 = a2;
  v7 = 1;
  v5 = a4;
  v6 = a3;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, char *, uint64_t *, uint64_t *))(*(_QWORD *)a1 + 48))(a1, &v8, &v7, &v6, &v5);
}

uint64_t std::function<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  v8 = a3;
  v9 = a2;
  v6 = a5;
  v7 = a4;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, int *, uint64_t *, uint64_t *))(*(_QWORD *)a1 + 48))(a1, &v9, &v8, &v7, &v6);
}

void telephonytransport::PCIClientTransport::~PCIClientTransport(telephonytransport::PCIClientTransport *this)
{
  telephonytransport::PCIClientTransport *v2;
  uint64_t v3;
  telephonytransport::PCIClientTransport *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24C80ACD0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  v2 = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 11);
  if (v2 == (telephonytransport::PCIClientTransport *)((char *)this + 64))
  {
    v3 = 4;
    v2 = (telephonytransport::PCIClientTransport *)((char *)this + 64);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  v4 = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 7);
  if (v4 == (telephonytransport::PCIClientTransport *)((char *)this + 32))
  {
    v5 = 4;
    v4 = (telephonytransport::PCIClientTransport *)((char *)this + 32);
  }
  else
  {
    if (!v4)
      goto LABEL_11;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_11:
  v6 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v6)
    std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](v6);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  telephonytransport::PCIClientTransport *v2;
  uint64_t v3;
  telephonytransport::PCIClientTransport *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24C80ACD0;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  v2 = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 11);
  if (v2 == (telephonytransport::PCIClientTransport *)((char *)this + 64))
  {
    v3 = 4;
    v2 = (telephonytransport::PCIClientTransport *)((char *)this + 64);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  v4 = (telephonytransport::PCIClientTransport *)*((_QWORD *)this + 7);
  if (v4 == (telephonytransport::PCIClientTransport *)((char *)this + 32))
  {
    v5 = 4;
    v4 = (telephonytransport::PCIClientTransport *)((char *)this + 32);
  }
  else
  {
    if (!v4)
      goto LABEL_11;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_11:
  v6 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v6)
    std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](v6);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  operator delete(this);
}

void std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(*(_QWORD **)(a1 + 72));
  std::mutex::~mutex((std::mutex *)a1);
  operator delete(v2);
}

void std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(a1[1]);
    std::promise<telephonytransport::TransactionResponse>::~promise(a1 + 5);
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::future<telephonytransport::TransactionResponse>::get(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::exception_ptr v10;
  std::exception_ptr v11;
  std::unique_lock<std::mutex> __lk;

  v3 = *a2;
  *a2 = 0;
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v3 + 24);
  *(_QWORD *)&__lk.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock((std::mutex *)(v3 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)v3, &__lk);
  v4 = *(_QWORD *)(v3 + 16);
  v11.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v11);
  if (v4)
  {
    std::exception_ptr::exception_ptr(&v11, (const std::exception_ptr *)(v3 + 16));
    v10.__ptr_ = &v11;
    std::rethrow_exception(v10);
    __break(1u);
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)(v3 + 144);
    v5 = *(_QWORD *)(v3 + 160);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(v3 + 152);
    *(_QWORD *)(a1 + 16) = v5;
    if (v5)
    {
      v6 = (unint64_t *)(v5 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
    v8 = (unint64_t *)(v3 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  }
}

void sub_20DAA936C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception_ptr a10, std::mutex *a11, char a12)
{
  unint64_t *v12;
  unint64_t *v14;
  unint64_t v15;

  std::exception_ptr::~exception_ptr(&a10);
  if (a12)
    std::mutex::unlock(a11);
  if (v12)
  {
    v14 = v12 + 1;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
      (*(void (**)(unint64_t *))(*v12 + 16))(v12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a2)
{
  std::mutex *m;
  unsigned int v5;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6;
  std::chrono::steady_clock::time_point v7;
  std::chrono::system_clock::time_point v8;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v10;
  unsigned int v11;
  uint64_t v12;
  std::unique_lock<std::mutex> v14;

  m = (std::mutex *)(a1 + 24);
  v14.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  *(_QWORD *)&v14.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock((std::mutex *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) != 0)
  {
    v12 = 2;
    goto LABEL_26;
  }
  if ((v5 & 4) != 0)
  {
    v12 = ((v5 >> 2) & 1) == 0;
    goto LABEL_26;
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
  {
    if (*a2 > std::chrono::steady_clock::now().__d_.__rep_)
    {
      v6 = *a2;
      v7.__d_.__rep_ = v6 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v7.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v8.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v8.__d_.__rep_)
        {
          v9 = 0;
          goto LABEL_14;
        }
        if (v8.__d_.__rep_ < 1)
        {
          if ((unint64_t)v8.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
            goto LABEL_13;
          v9 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v8.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            v9 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_14;
          }
LABEL_13:
          v9 = 1000 * v8.__d_.__rep_;
LABEL_14:
          if (v9 > (v7.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v10.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
        }
        v10.__d_.__rep_ = v9 + v7.__d_.__rep_;
LABEL_17:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 88), &v14, v10);
        std::chrono::steady_clock::now();
      }
      std::chrono::steady_clock::now();
    }
    v11 = *(_DWORD *)(a1 + 136);
    if ((v11 & 4) != 0)
      goto LABEL_24;
  }
  v11 = *(_DWORD *)(a1 + 136);
LABEL_24:
  v12 = ((v11 >> 2) & 1) == 0;
  if (v14.__owns_)
  {
    m = v14.__m_;
LABEL_26:
    std::mutex::unlock(m);
  }
  return v12;
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80ADA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80ADA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80ADF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80ADF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AE48;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AE48;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AE98;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AE98;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AEE8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AEE8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AF38;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AF38;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AF88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AF88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AFD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C80AFD8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void telephonytransport::EthernetIfaceToSocketForwarder::create(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  telephonytransport *v9;
  std::__shared_weak_count_vtbl *v10;
  std::__shared_weak_count_vtbl *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string v26;
  int v27;
  void *__p;
  char v29;
  uint64_t v30;
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v32;
  std::__shared_weak_count *v33;
  __int128 v34;
  std::__shared_weak_count_vtbl *v35;
  std::__shared_weak_count *v36;
  NSObject *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count_vtbl *v40;
  unint64_t v41;

  v40 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v38 = 0;
  v39 = 0;
  v37 = 0;
  telephonytransport::BaseProtocol::create((uint64_t)&v38, &v37, a2, 1, a4, &v40);
  if (v37)
    dispatch_release(v37);
  v9 = (telephonytransport *)v39;
  if (v39)
    std::__shared_weak_count::__release_weak(v39);
  v10 = v40;
  if (v40)
  {
    v11 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v11->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_24C80B028;
    v11->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v11->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v41;
    v40 = 0;
    v41 = 0;
    v11->__get_deleter = 0;
    v11->__on_zero_shared_weak = 0;
    v35 = v11;
    v12 = (std::__shared_weak_count *)operator new(0x20uLL);
    v12->__shared_weak_owners_ = 0;
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)off_24C80B068;
    v12->__shared_owners_ = 0;
    v12[1].__vftable = v11;
    v36 = v12;
    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32 = v11;
    v33 = v12;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v15 = *a3;
    object = v15;
    if (v15)
      dispatch_retain(v15);
    if (*(char *)(a1 + 23) < 0)
      std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    else
      v26 = *(std::string *)a1;
    v27 = 1;
    std::string::basic_string[abi:ne180100]<0>(&__p, "ip or ip6");
    v30 = 0x100000000;
    telephonytransport::NetworkIface::create((telephonytransport *)&v32, &object, (uint64_t)&v26, a4, (telephonytransport::NetworkIface **)&v34);
    if (v29 < 0)
      operator delete(__p);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    if (object)
      dispatch_release(object);
    if (v33)
      std::__shared_weak_count::__release_weak(v33);
    std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)&v11->__get_deleter, &v34);
    *a5 = v11;
    a5[1] = (std::__shared_weak_count_vtbl *)v12;
    v35 = 0;
    v36 = 0;
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = v36;
    if (v36)
    {
      p_shared_owners = (unint64_t *)&v36->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  else
  {
    v16 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_20DA91000, v16, OS_LOG_TYPE_ERROR, "Failed to create destination write only protocol", (uint8_t *)&v26, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  v23 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v24 = (unint64_t *)(v41 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
}

void sub_20DAA9A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  uint64_t v26;

  if (v25)
    dispatch_release(v25);
  if (a22)
    std::__shared_weak_count::__release_weak(a22);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v26 - 80);
  _Unwind_Resume(a1);
}

void sub_20DAA9A7C()
{
  uint64_t v0;
  NSObject *v1;
  std::__shared_weak_count *v2;

  v1 = *(NSObject **)(v0 - 104);
  if (v1)
    dispatch_release(v1);
  v2 = *(std::__shared_weak_count **)(v0 - 88);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  JUMPOUT(0x20DAA9A74);
}

__n128 telephonytransport::EthernetIfaceToSocketForwarder::EthernetIfaceToSocketForwarder(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(_QWORD *)a1 = off_24C80B028;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(_QWORD *)a1 = off_24C80B028;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

uint64_t telephonytransport::EthernetIfaceToSocketForwarder::init(uint64_t a1, __int128 *a2)
{
  std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 24, a2);
  return 1;
}

uint64_t telephonytransport::EthernetIfaceToSocketForwarder::handleRead(std::mutex **this, unsigned __int8 *a2, uint64_t a3)
{
  return telephonytransport::BaseProtocol::sendMessage(this[1], 1u, a2 + 14, a3 - 14);
}

void telephonytransport::EthernetIfaceToSocketForwarder::~EthernetIfaceToSocketForwarder(telephonytransport::EthernetIfaceToSocketForwarder *this)
{
  char *v1;

  *(_QWORD *)this = off_24C80B028;
  v1 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = off_24C80B028;
  v2 = (char *)this + 8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

_QWORD *telephonytransport::toString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 0x13)
    v2 = "???";
  else
    v2 = off_24C80B0D0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t telephonytransport::deserializeMessage(uint64_t a1, int a2, unsigned __int8 *a3, uint64_t a4)
{
  __int128 v5;
  _OWORD v7[2];

  if (!a4)
    return 1;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v5;
  v7[1] = v5;
  PB::Reader::Reader((PB::Reader *)v7, a3);
  return (*(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)a1 + 16))(a1, v7);
}

uint64_t telephonytransport::toPCIMessageType(uint64_t this)
{
  if ((this - 1) >= 0x12)
    return 0;
  else
    return this;
}

_QWORD *telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B180;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B180;
  return this;
}

void telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse(telephonytransport::PCIFlushReadResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B180;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B180;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B180;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIFlushReadResponse *telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(telephonytransport::PCIFlushReadResponse *this, const telephonytransport::PCIFlushReadResponse *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;

  *(_QWORD *)this = off_24C80B180;
  *((_QWORD *)this + 1) = 0;
  v4 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 1);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *v4 = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 20) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 20) = 1;
    *((_DWORD *)this + 4) = v11;
  }
  return this;
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t result, uint64_t a2)
{
  char v2;
  int v3;
  uint64_t v4;

  *(_QWORD *)result = off_24C80B308;
  *(_DWORD *)(result + 20) = 0;
  if ((*(_BYTE *)(a2 + 20) & 2) != 0)
  {
    v3 = *(_DWORD *)(a2 + 16);
    *(_BYTE *)(result + 20) = 2;
    *(_DWORD *)(result + 16) = v3;
    v2 = 3;
    if ((*(_BYTE *)(a2 + 20) & 1) == 0)
      return result;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*(_BYTE *)(a2 + 20) & 1) != 0)
  {
LABEL_5:
    v4 = *(_QWORD *)(a2 + 8);
    *(_BYTE *)(result + 20) = v2;
    *(_QWORD *)(result + 8) = v4;
  }
  return result;
}

{
  *(_QWORD *)result = off_24C80B308;
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

{
  *(_QWORD *)result = off_24C80B308;
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t telephonytransport::PCIFlushReadResponse::operator=(uint64_t a1, const telephonytransport::PCIFlushReadResponse *a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[3];

  if ((const telephonytransport::PCIFlushReadResponse *)a1 != a2)
  {
    memset(v7, 170, sizeof(v7));
    telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)v7, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v7[1];
    v4 = *(_DWORD *)(a1 + 16);
    v5 = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v7[2];
    v7[2] = __PAIR64__(v5, v4);
    v7[0] = off_24C80B180;
    v7[1] = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFlushReadResponse *a2, telephonytransport::PCIFlushReadResponse *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B180;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIFlushReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD v8[2];
  int v9;
  int v10;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6 = *(_DWORD *)(a1 + 16);
    LODWORD(v3) = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v4;
    v9 = v6;
    v10 = v3;
    v8[0] = off_24C80B180;
    v8[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIFlushReadResponse::formatText(telephonytransport::PCIFlushReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 20) & 1) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIFlushReadResponse::readFrom(telephonytransport::PCIFlushReadResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  char v33;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_28;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 20) |= 1u;
        v22 = *((_QWORD *)a2 + 1);
        v23 = *((_QWORD *)a2 + 2);
        v24 = *(_QWORD *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          v30 = 0;
          v31 = 0;
          v27 = 0;
          if (v23 <= v22)
            v23 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_47;
            }
            v32 = v22 + 1;
            v33 = *(_BYTE *)(v24 + v22);
            *((_QWORD *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0)
              break;
            v30 += 7;
            v22 = v32;
            v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v27) = 0;
        }
        else
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (1)
          {
            v28 = v22 + 1;
            *((_QWORD *)a2 + 1) = v22 + 1;
            v29 = *(_BYTE *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              break;
            v25 += 7;
            v22 = v28;
            v14 = v26++ > 8;
            if (v14)
              goto LABEL_43;
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_28;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t this)
{
  *(_QWORD *)this = off_24C80B308;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B308;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

uint64_t telephonytransport::PCIFlushReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 20) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIFlushReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 20) & 1) == 0;
  if ((*(_BYTE *)(a1 + 20) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

BOOL telephonytransport::PCIMessageId::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 20) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 20) & 2) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 20) & 2) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 20) & 1) == 0;
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    return (*(_BYTE *)(a2 + 20) & 1) != 0 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  return v2;
}

uint64_t telephonytransport::PCIFlushReadResponse::hash_value(telephonytransport::PCIFlushReadResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 20) & 1) != 0)
    v5 = *((int *)this + 4);
  else
    v5 = 0;
  return v5 ^ v1;
}

_QWORD *telephonytransport::PCIFlushReadResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCISendImageResponse::PCISendImageResponse(_QWORD *this)
{
  *this = off_24C80B1B8;
  this[1] = 0;
  this[3] = 0;
  return this;
}

{
  *this = off_24C80B1B8;
  this[1] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCISendImageResponse::~PCISendImageResponse(telephonytransport::PCISendImageResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCISendImageResponse *telephonytransport::PCISendImageResponse::PCISendImageResponse(telephonytransport::PCISendImageResponse *this, const telephonytransport::PCISendImageResponse *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  int v13;
  int v14;

  *(_QWORD *)this = off_24C80B1B8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  v10 = *((_BYTE *)a2 + 28);
  if ((v10 & 4) != 0)
  {
    v12 = *((_DWORD *)a2 + 6);
    v11 = 4;
    *((_BYTE *)this + 28) = 4;
    *((_DWORD *)this + 6) = v12;
    v10 = *((_BYTE *)a2 + 28);
    if ((v10 & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = 0;
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
LABEL_12:
    v13 = *((_DWORD *)a2 + 4);
    v11 |= 1u;
    *((_BYTE *)this + 28) = v11;
    *((_DWORD *)this + 4) = v13;
    v10 = *((_BYTE *)a2 + 28);
  }
LABEL_13:
  if ((v10 & 2) != 0)
  {
    v14 = *((_DWORD *)a2 + 5);
    *((_BYTE *)this + 28) = v11 | 2;
    *((_DWORD *)this + 5) = v14;
  }
  return this;
}

uint64_t telephonytransport::PCISendImageResponse::operator=(uint64_t a1, const telephonytransport::PCISendImageResponse *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  int v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  if ((const telephonytransport::PCISendImageResponse *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9 = v3;
    v10 = v3;
    telephonytransport::PCISendImageResponse::PCISendImageResponse((telephonytransport::PCISendImageResponse *)&v9, a2);
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v9 + 1);
    v5 = v10;
    v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    v7 = *(_QWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)&v10 = v7;
    *(_QWORD *)&v9 = off_24C80B1B8;
    *((_QWORD *)&v9 + 1) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCISendImageResponse *a2, telephonytransport::PCISendImageResponse *a3)
{
  int v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  result = *(double *)((char *)a2 + 20);
  v6 = *(_QWORD *)((char *)this + 20);
  *(double *)((char *)this + 20) = result;
  *(_QWORD *)((char *)a2 + 20) = v6;
  return result;
}

uint64_t telephonytransport::PCISendImageResponse::PCISendImageResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B1B8;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 20) = *(_QWORD *)(a2 + 20);
  return a1;
}

uint64_t telephonytransport::PCISendImageResponse::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  int v9;
  int v10;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_OWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 28) = 0;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 28);
    v9 = *(_DWORD *)(a1 + 24);
    v10 = v3;
    v6 = *(_QWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v4;
    v8[2] = v6;
    v8[0] = off_24C80B1B8;
    v8[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCISendImageResponse::formatText(telephonytransport::PCISendImageResponse *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  uint64_t v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "bytesWritten");
    v5 = *((_BYTE *)this + 28);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "cookie");
  v6 = *((_QWORD *)this + 1);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "messageId");
  if ((*((_BYTE *)this + 28) & 4) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCISendImageResponse::readFrom(telephonytransport::PCISendImageResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  unint64_t v57;
  char v58;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v21 = operator new(0x18uLL);
        *(_QWORD *)v21 = off_24C80B308;
        v21[5] = 0;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v21 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        v2 = *((_QWORD *)a2 + 1);
        v3 = *((_QWORD *)a2 + 2);
        v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0)
          return v4 == 0;
        break;
      case 2u:
        *((_BYTE *)this + 28) |= 4u;
        v23 = *((_QWORD *)a2 + 1);
        v24 = *((_QWORD *)a2 + 2);
        v25 = *(_QWORD *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = v23 + 1;
            *((_QWORD *)a2 + 1) = v23 + 1;
            v30 = *(_BYTE *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_79;
            v26 += 7;
            v23 = v29;
            v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        v47 = 0;
        v48 = 0;
        v28 = 0;
        if (v24 <= v23)
          v24 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v49 = v23 + 1;
            v50 = *(_BYTE *)(v25 + v23);
            *((_QWORD *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              v23 = v49;
              v14 = v48++ > 8;
              if (v14)
                goto LABEL_59;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v28) = 0;
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 6) = v28;
        goto LABEL_20;
      case 3u:
        *((_BYTE *)this + 28) |= 1u;
        v31 = *((_QWORD *)a2 + 1);
        v32 = *((_QWORD *)a2 + 2);
        v33 = *(_QWORD *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          do
          {
            v37 = v31 + 1;
            *((_QWORD *)a2 + 1) = v31 + 1;
            v38 = *(_BYTE *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0)
              goto LABEL_82;
            v34 += 7;
            v31 = v37;
            v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          LODWORD(v36) = 0;
          goto LABEL_82;
        }
        v51 = 0;
        v52 = 0;
        v36 = 0;
        if (v32 <= v31)
          v32 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v53 = v31 + 1;
            v54 = *(_BYTE *)(v33 + v31);
            *((_QWORD *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              v31 = v53;
              v14 = v52++ > 8;
              if (v14)
                goto LABEL_66;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v36) = 0;
          }
          break;
        }
LABEL_82:
        *((_DWORD *)this + 4) = v36;
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 28) |= 2u;
        v39 = *((_QWORD *)a2 + 1);
        v40 = *((_QWORD *)a2 + 2);
        v41 = *(_QWORD *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          v42 = 0;
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = v39 + 1;
            *((_QWORD *)a2 + 1) = v39 + 1;
            v46 = *(_BYTE *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0)
              goto LABEL_85;
            v42 += 7;
            v39 = v45;
            v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          LODWORD(v44) = 0;
          goto LABEL_85;
        }
        v55 = 0;
        v56 = 0;
        v44 = 0;
        if (v40 <= v39)
          v40 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v57 = v39 + 1;
            v58 = *(_BYTE *)(v41 + v39);
            *((_QWORD *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              v39 = v57;
              v14 = v56++ > 8;
              if (v14)
                goto LABEL_73;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v44) = 0;
          }
          break;
        }
LABEL_85:
        *((_DWORD *)this + 5) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t telephonytransport::PCISendImageResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 28);
  if ((v5 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        return this;
      return PB::Writer::writeVarInt(a2);
    }
  }
  else if ((*(_BYTE *)(v3 + 28) & 1) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 28) & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCISendImageResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 1) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 28) & 2) == 0;
  if ((*(_BYTE *)(a1 + 28) & 2) == 0)
    return result;
  return (*(_BYTE *)(a2 + 28) & 2) != 0 && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20);
}

uint64_t telephonytransport::PCISendImageResponse::hash_value(telephonytransport::PCISendImageResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 28) & 4) == 0)
  {
    v5 = 0;
    if ((*((_BYTE *)this + 28) & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v6 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
      goto LABEL_10;
LABEL_13:
    v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  v5 = *((int *)this + 6);
  if ((*((_BYTE *)this + 28) & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v6 = *((unsigned int *)this + 4);
  if ((*((_BYTE *)this + 28) & 2) == 0)
    goto LABEL_13;
LABEL_10:
  v7 = *((unsigned int *)this + 5);
  return v5 ^ v1 ^ v6 ^ v7;
}

_QWORD *telephonytransport::PCISendImageResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B1F0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B1F0;
  return this;
}

void telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse(telephonytransport::PCIUnblockReadResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1F0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1F0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B1F0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIUnblockReadResponse *telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(telephonytransport::PCIUnblockReadResponse *this, const telephonytransport::PCIUnblockReadResponse *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;

  *(_QWORD *)this = off_24C80B1F0;
  *((_QWORD *)this + 1) = 0;
  v4 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 1);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *v4 = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 20) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 20) = 1;
    *((_DWORD *)this + 4) = v11;
  }
  return this;
}

uint64_t telephonytransport::PCIUnblockReadResponse::operator=(uint64_t a1, const telephonytransport::PCIUnblockReadResponse *a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[3];

  if ((const telephonytransport::PCIUnblockReadResponse *)a1 != a2)
  {
    memset(v7, 170, sizeof(v7));
    telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)v7, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v7[1];
    v4 = *(_DWORD *)(a1 + 16);
    v5 = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v7[2];
    v7[2] = __PAIR64__(v5, v4);
    v7[0] = off_24C80B1F0;
    v7[1] = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIUnblockReadResponse *a2, telephonytransport::PCIUnblockReadResponse *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B1F0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD v8[2];
  int v9;
  int v10;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6 = *(_DWORD *)(a1 + 16);
    LODWORD(v3) = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v4;
    v9 = v6;
    v10 = v3;
    v8[0] = off_24C80B1F0;
    v8[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadResponse::formatText(telephonytransport::PCIUnblockReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 20) & 1) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIUnblockReadResponse::readFrom(telephonytransport::PCIUnblockReadResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  char v33;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_28;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 20) |= 1u;
        v22 = *((_QWORD *)a2 + 1);
        v23 = *((_QWORD *)a2 + 2);
        v24 = *(_QWORD *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          v30 = 0;
          v31 = 0;
          v27 = 0;
          if (v23 <= v22)
            v23 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_47;
            }
            v32 = v22 + 1;
            v33 = *(_BYTE *)(v24 + v22);
            *((_QWORD *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0)
              break;
            v30 += 7;
            v22 = v32;
            v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v27) = 0;
        }
        else
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (1)
          {
            v28 = v22 + 1;
            *((_QWORD *)a2 + 1) = v22 + 1;
            v29 = *(_BYTE *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              break;
            v25 += 7;
            v22 = v28;
            v14 = v26++ > 8;
            if (v14)
              goto LABEL_43;
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_28;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIUnblockReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 20) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIUnblockReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 20) & 1) == 0;
  if ((*(_BYTE *)(a1 + 20) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIUnblockReadResponse::hash_value(telephonytransport::PCIUnblockReadResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 20) & 1) != 0)
    v5 = *((int *)this + 4);
  else
    v5 = 0;
  return v5 ^ v1;
}

_QWORD *telephonytransport::PCIUnblockReadResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(_QWORD *this)
{
  *this = off_24C80B228;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = off_24C80B228;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse(telephonytransport::PCIReadRegisterResponse *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B228;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);
  PB::Base::~Base(this);
}

{
  void *v1;

  telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse(this);
  operator delete(v1);
}

telephonytransport::PCIReadRegisterResponse *telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(telephonytransport::PCIReadRegisterResponse *this, const telephonytransport::PCIReadRegisterResponse *a2)
{
  void ***v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  const PB::Data *v12;
  PB::Data *v13;

  *(_QWORD *)this = off_24C80B228;
  *((_QWORD *)this + 1) = 0;
  v4 = (void ***)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 2) = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 6);
    *((_BYTE *)this + 28) = 1;
    *((_DWORD *)this + 6) = v11;
  }
  v12 = (const PB::Data *)*((_QWORD *)a2 + 1);
  if (v12)
  {
    v13 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v13, v12);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v13);
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterResponse::operator=(uint64_t a1, const telephonytransport::PCIReadRegisterResponse *a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if ((const telephonytransport::PCIReadRegisterResponse *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRegisterResponse *a2, telephonytransport::PCIReadRegisterResponse *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(uint64_t a1, uint64_t a2)
{
  void ***v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  *(_QWORD *)a1 = off_24C80B228;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (void ***)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v7 = *(void ***)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterResponse::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if (a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse((uint64_t)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterResponse::formatText(telephonytransport::PCIReadRegisterResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 28) & 1) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIReadRegisterResponse::readFrom(telephonytransport::PCIReadRegisterResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void ***v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  void **v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  unint64_t v36;
  char v37;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void ***)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v25 = (void **)operator new(0x10uLL);
        *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((_DWORD)v22 == 2)
      {
        *((_BYTE *)this + 28) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v27 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          v34 = 0;
          v35 = 0;
          v31 = 0;
          if (v27 <= v26)
            v27 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_53;
            }
            v36 = v26 + 1;
            v37 = *(_BYTE *)(v28 + v26);
            *((_QWORD *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0)
              break;
            v34 += 7;
            v26 = v36;
            v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          while (1)
          {
            v32 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v33 = *(_BYTE *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              break;
            v29 += 7;
            v26 = v32;
            v15 = v30++ > 8;
            if (v15)
              goto LABEL_49;
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if ((_DWORD)v22 == 1)
      {
        v23 = operator new(0x18uLL);
        *(_QWORD *)v23 = off_24C80B308;
        v23[5] = 0;
        v24 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
          v23 = (_DWORD *)*((_QWORD *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_26;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_20;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadRegisterResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Data *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
    return PB::Writer::write(a2, v5);
  return this;
}

BOOL telephonytransport::PCIReadRegisterResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 1) != 0)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    if ((PB::Data::operator==() & 1) != 0)
      return 1;
    if (*(_QWORD *)(a1 + 8))
      return 0;
  }
  return *(_QWORD *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadRegisterResponse::hash_value(telephonytransport::PCIReadRegisterResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 2);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v5 = v4 ^ v3;
  }
  else
  {
    v5 = 0;
  }
  if ((*((_BYTE *)this + 28) & 1) != 0)
    v6 = *((int *)this + 6);
  else
    v6 = 0;
  if (*((_QWORD *)this + 1))
    v7 = PBHashBytes();
  else
    v7 = 0;
  return v6 ^ v5 ^ v7;
}

_QWORD *telephonytransport::PCIReadRegisterResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[2])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(uint64_t this)
{
  *(_QWORD *)this = off_24C80B260;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 28) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B260;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 28) = 0;
  return this;
}

void telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest(telephonytransport::PCIReadRegisterRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B260;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B260;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B260;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIReadRegisterRequest *telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(telephonytransport::PCIReadRegisterRequest *this, const telephonytransport::PCIReadRegisterRequest *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  int v13;
  int v14;

  *(_QWORD *)this = off_24C80B260;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 7) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  v10 = *((_BYTE *)a2 + 28);
  if ((v10 & 4) != 0)
  {
    v12 = *((_DWORD *)a2 + 6);
    v11 = 4;
    *((_BYTE *)this + 28) = 4;
    *((_DWORD *)this + 6) = v12;
    v10 = *((_BYTE *)a2 + 28);
    if ((v10 & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = 0;
  if ((*((_BYTE *)a2 + 28) & 2) != 0)
  {
LABEL_12:
    v13 = *((_DWORD *)a2 + 5);
    v11 |= 2u;
    *((_BYTE *)this + 28) = v11;
    *((_DWORD *)this + 5) = v13;
    v10 = *((_BYTE *)a2 + 28);
  }
LABEL_13:
  if ((v10 & 1) != 0)
  {
    v14 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 28) = v11 | 1;
    *((_DWORD *)this + 4) = v14;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::operator=(uint64_t a1, const telephonytransport::PCIReadRegisterRequest *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  int v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  if ((const telephonytransport::PCIReadRegisterRequest *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9 = v3;
    v10 = v3;
    telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&v9, a2);
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v9 + 1);
    v5 = v10;
    v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    v7 = *(_QWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)&v10 = v7;
    *(_QWORD *)&v9 = off_24C80B260;
    *((_QWORD *)&v9 + 1) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRegisterRequest *a2, telephonytransport::PCIReadRegisterRequest *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B260;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterRequest::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  int v9;
  int v10;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_OWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 28) = 0;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 28);
    v9 = *(_DWORD *)(a1 + 24);
    v10 = v3;
    v6 = *(_QWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v4;
    v8[2] = v6;
    v8[0] = off_24C80B260;
    v8[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterRequest::formatText(telephonytransport::PCIReadRegisterRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  char v6;

  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 28) & 1) != 0)
    PB::TextFormatter::format(a2, "bytesToRead");
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  v6 = *((_BYTE *)this + 28);
  if ((v6 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "timeoutMs");
    v6 = *((_BYTE *)this + 28);
  }
  if ((v6 & 4) != 0)
    PB::TextFormatter::format(a2, "whichRegister");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIReadRegisterRequest::readFrom(telephonytransport::PCIReadRegisterRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  unint64_t v57;
  char v58;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v21 = operator new(0x18uLL);
        *(_QWORD *)v21 = off_24C80B308;
        v21[5] = 0;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v21 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        v2 = *((_QWORD *)a2 + 1);
        v3 = *((_QWORD *)a2 + 2);
        v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0)
          return v4 == 0;
        break;
      case 2u:
        *((_BYTE *)this + 28) |= 4u;
        v23 = *((_QWORD *)a2 + 1);
        v24 = *((_QWORD *)a2 + 2);
        v25 = *(_QWORD *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = v23 + 1;
            *((_QWORD *)a2 + 1) = v23 + 1;
            v30 = *(_BYTE *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_79;
            v26 += 7;
            v23 = v29;
            v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        v47 = 0;
        v48 = 0;
        v28 = 0;
        if (v24 <= v23)
          v24 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v49 = v23 + 1;
            v50 = *(_BYTE *)(v25 + v23);
            *((_QWORD *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              v23 = v49;
              v14 = v48++ > 8;
              if (v14)
                goto LABEL_59;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v28) = 0;
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 6) = v28;
        goto LABEL_20;
      case 3u:
        *((_BYTE *)this + 28) |= 2u;
        v31 = *((_QWORD *)a2 + 1);
        v32 = *((_QWORD *)a2 + 2);
        v33 = *(_QWORD *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          do
          {
            v37 = v31 + 1;
            *((_QWORD *)a2 + 1) = v31 + 1;
            v38 = *(_BYTE *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0)
              goto LABEL_82;
            v34 += 7;
            v31 = v37;
            v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          LODWORD(v36) = 0;
          goto LABEL_82;
        }
        v51 = 0;
        v52 = 0;
        v36 = 0;
        if (v32 <= v31)
          v32 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v53 = v31 + 1;
            v54 = *(_BYTE *)(v33 + v31);
            *((_QWORD *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              v31 = v53;
              v14 = v52++ > 8;
              if (v14)
                goto LABEL_66;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v36) = 0;
          }
          break;
        }
LABEL_82:
        *((_DWORD *)this + 5) = v36;
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 28) |= 1u;
        v39 = *((_QWORD *)a2 + 1);
        v40 = *((_QWORD *)a2 + 2);
        v41 = *(_QWORD *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          v42 = 0;
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = v39 + 1;
            *((_QWORD *)a2 + 1) = v39 + 1;
            v46 = *(_BYTE *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0)
              goto LABEL_85;
            v42 += 7;
            v39 = v45;
            v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          LODWORD(v44) = 0;
          goto LABEL_85;
        }
        v55 = 0;
        v56 = 0;
        v44 = 0;
        if (v40 <= v39)
          v40 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v57 = v39 + 1;
            v58 = *(_BYTE *)(v41 + v39);
            *((_QWORD *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              v39 = v57;
              v14 = v56++ > 8;
              if (v14)
                goto LABEL_73;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v44) = 0;
          }
          break;
        }
LABEL_85:
        *((_DWORD *)this + 4) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t telephonytransport::PCIReadRegisterRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 28);
  if ((v5 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        return this;
      return PB::Writer::writeVarInt(a2);
    }
  }
  else if ((*(_BYTE *)(v3 + 28) & 2) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIReadRegisterRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 2) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 28) & 1) == 0;
  if ((*(_BYTE *)(a1 + 28) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 28) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIReadRegisterRequest::hash_value(telephonytransport::PCIReadRegisterRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 28) & 4) == 0)
  {
    v5 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v6 = 0;
    if ((*((_BYTE *)this + 28) & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  v5 = *((unsigned int *)this + 6);
  if ((*((_BYTE *)this + 28) & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v6 = *((unsigned int *)this + 5);
  if ((*((_BYTE *)this + 28) & 1) == 0)
    goto LABEL_13;
LABEL_10:
  v7 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6 ^ v7;
}

_QWORD *telephonytransport::PCIReadRegisterRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(_QWORD *this)
{
  *this = off_24C80B298;
  this[1] = 0;
  return this;
}

{
  *this = off_24C80B298;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest(telephonytransport::PCIUnblockReadRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B298;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B298;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B298;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIUnblockReadRequest *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(telephonytransport::PCIUnblockReadRequest *this, const telephonytransport::PCIUnblockReadRequest *a2)
{
  uint64_t v3;
  _DWORD *v4;
  char v5;
  char v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)this = off_24C80B298;
  *((_QWORD *)this + 1) = 0;
  v3 = *((_QWORD *)a2 + 1);
  if (v3)
  {
    v4 = operator new(0x18uLL);
    *(_QWORD *)v4 = off_24C80B308;
    v4[5] = 0;
    v5 = *(_BYTE *)(v3 + 20);
    if ((v5 & 2) != 0)
    {
      v7 = *(_DWORD *)(v3 + 16);
      *((_BYTE *)v4 + 20) = 2;
      v4[4] = v7;
      v6 = 3;
      if ((v5 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v4;
        return this;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(v3 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v8 = *(_QWORD *)(v3 + 8);
    *((_BYTE *)v4 + 20) = v6;
    *((_QWORD *)v4 + 1) = v8;
    goto LABEL_7;
  }
  return this;
}

const telephonytransport::PCIUnblockReadRequest *telephonytransport::PCIUnblockReadRequest::operator=(const telephonytransport::PCIUnblockReadRequest *a1, const telephonytransport::PCIUnblockReadRequest *a2)
{
  uint64_t v3;
  void (**v5)(telephonytransport::PCIUnblockReadRequest *__hidden);
  unint64_t v6;

  if (a1 != a2)
  {
    v5 = (void (**)(telephonytransport::PCIUnblockReadRequest *__hidden))0xAAAAAAAAAAAAAAAALL;
    v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = off_24C80B298;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIUnblockReadRequest *a2, telephonytransport::PCIUnblockReadRequest *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B298;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B298;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = off_24C80B298;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadRequest::formatText(telephonytransport::PCIUnblockReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIUnblockReadRequest::readFrom(telephonytransport::PCIUnblockReadRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIUnblockReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

BOOL telephonytransport::PCIUnblockReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  result = v3 == 0;
  if (v2)
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  return result;
}

uint64_t telephonytransport::PCIUnblockReadRequest::hash_value(telephonytransport::PCIUnblockReadRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(_BYTE *)(v1 + 20);
  v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0)
    v3 = 0;
  v4 = *(_QWORD *)(v1 + 8);
  if ((v2 & 1) == 0)
    v4 = 0;
  return v4 ^ v3;
}

_QWORD *telephonytransport::PCIUnblockReadRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(_QWORD *this)
{
  *this = off_24C80B2D0;
  this[1] = 0;
  return this;
}

{
  *this = off_24C80B2D0;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest(telephonytransport::PCIFlushReadRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B2D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B2D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B2D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIFlushReadRequest *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(telephonytransport::PCIFlushReadRequest *this, const telephonytransport::PCIFlushReadRequest *a2)
{
  uint64_t v3;
  _DWORD *v4;
  char v5;
  char v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)this = off_24C80B2D0;
  *((_QWORD *)this + 1) = 0;
  v3 = *((_QWORD *)a2 + 1);
  if (v3)
  {
    v4 = operator new(0x18uLL);
    *(_QWORD *)v4 = off_24C80B308;
    v4[5] = 0;
    v5 = *(_BYTE *)(v3 + 20);
    if ((v5 & 2) != 0)
    {
      v7 = *(_DWORD *)(v3 + 16);
      *((_BYTE *)v4 + 20) = 2;
      v4[4] = v7;
      v6 = 3;
      if ((v5 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v4;
        return this;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(v3 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v8 = *(_QWORD *)(v3 + 8);
    *((_BYTE *)v4 + 20) = v6;
    *((_QWORD *)v4 + 1) = v8;
    goto LABEL_7;
  }
  return this;
}

const telephonytransport::PCIFlushReadRequest *telephonytransport::PCIFlushReadRequest::operator=(const telephonytransport::PCIFlushReadRequest *a1, const telephonytransport::PCIFlushReadRequest *a2)
{
  uint64_t v3;
  void (**v5)(telephonytransport::PCIFlushReadRequest *__hidden);
  unint64_t v6;

  if (a1 != a2)
  {
    v5 = (void (**)(telephonytransport::PCIFlushReadRequest *__hidden))0xAAAAAAAAAAAAAAAALL;
    v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = off_24C80B2D0;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFlushReadRequest *a2, telephonytransport::PCIFlushReadRequest *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B2D0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B2D0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t telephonytransport::PCIFlushReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = off_24C80B2D0;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFlushReadRequest::formatText(telephonytransport::PCIFlushReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIFlushReadRequest::readFrom(telephonytransport::PCIFlushReadRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFlushReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

BOOL telephonytransport::PCIFlushReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  result = v3 == 0;
  if (v2)
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  return result;
}

uint64_t telephonytransport::PCIFlushReadRequest::hash_value(telephonytransport::PCIFlushReadRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(_BYTE *)(v1 + 20);
  v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0)
    v3 = 0;
  v4 = *(_QWORD *)(v1 + 8);
  if ((v2 & 1) == 0)
    v4 = 0;
  return v4 ^ v3;
}

_QWORD *telephonytransport::PCIFlushReadRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void telephonytransport::PCIMessageId::~PCIMessageId(telephonytransport::PCIMessageId *this)
{
  void *v1;

  PB::Base::~Base(this);
  operator delete(v1);
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t this, const telephonytransport::PCIMessageId *a2)
{
  char v2;
  int v3;
  uint64_t v4;

  *(_QWORD *)this = off_24C80B308;
  *(_DWORD *)(this + 20) = 0;
  if ((*((_BYTE *)a2 + 20) & 2) != 0)
  {
    v3 = *((_DWORD *)a2 + 4);
    *(_BYTE *)(this + 20) = 2;
    *(_DWORD *)(this + 16) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 20) & 1) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 20) & 1) != 0)
  {
LABEL_5:
    v4 = *((_QWORD *)a2 + 1);
    *(_BYTE *)(this + 20) = v2;
    *(_QWORD *)(this + 8) = v4;
  }
  return this;
}

uint64_t telephonytransport::PCIMessageId::operator=(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  void (**v12)(telephonytransport::PCIMessageId *__hidden);
  unint64_t v13;
  unint64_t v14;

  if (a1 != a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v14 = 2863311530;
    v12 = off_24C80B308;
    v3 = *(_BYTE *)(a2 + 20);
    if ((v3 & 2) != 0)
    {
      v5 = *(_DWORD *)(a2 + 16);
      BYTE4(v14) = 2;
      v4 = 3;
      if ((v3 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      v4 = 1;
      v5 = -1431655766;
      if ((*(_BYTE *)(a2 + 20) & 1) != 0)
      {
LABEL_4:
        v6 = *(_QWORD *)(a2 + 8);
        BYTE4(v14) = v4;
LABEL_7:
        v7 = HIDWORD(v14);
        v9 = *(_DWORD *)(a1 + 16);
        v8 = *(_DWORD *)(a1 + 20);
        *(_DWORD *)(a1 + 16) = v5;
        *(_DWORD *)(a1 + 20) = v7;
        v14 = __PAIR64__(v8, v9);
        v10 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v6;
        v13 = v10;
        PB::Base::~Base((PB::Base *)&v12);
        return a1;
      }
    }
    v6 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_7;
  }
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  _QWORD v9[2];
  int v10;
  int v11;

  if (a1 != a2)
  {
    v9[0] = off_24C80B308;
    v3 = *(_QWORD *)(a2 + 8);
    v4 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    v6 = *(_DWORD *)(a1 + 16);
    v5 = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v4;
    v10 = v6;
    v11 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v9[1] = v7;
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIMessageId *a2, telephonytransport::PCIMessageId *a3)
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  v4 = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIMessageId::formatText(telephonytransport::PCIMessageId *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 20);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "transportToken");
    v5 = *((_BYTE *)this + 20);
  }
  if ((v5 & 1) != 0)
    PB::TextFormatter::format(a2, "txnId");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIMessageId::readFrom(telephonytransport::PCIMessageId *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;

  v3 = *((_QWORD *)a2 + 1);
  v2 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v3 + 1;
        *((_QWORD *)a2 + 1) = v3 + 1;
        v13 = *(_BYTE *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v3 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_30;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 20) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v36 = 0;
          v37 = 0;
          v30 = 0;
          if (v2 <= v26)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v26)
            {
              v30 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_64;
            }
            v38 = v26++;
            v39 = *(_BYTE *)(v27 + v38);
            *((_QWORD *)a2 + 1) = v26;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0)
              break;
            v36 += 7;
            v14 = v37++ > 8;
            if (v14)
            {
              v30 = 0;
              goto LABEL_63;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v30 = 0;
LABEL_63:
          v3 = v38 + 1;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (1)
          {
            v3 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v31 = *(_BYTE *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0)
              break;
            v28 += 7;
            v26 = v3;
            v14 = v29++ > 8;
            if (v14)
            {
              v30 = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_QWORD *)this + 1) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 20) |= 2u;
        v19 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v20 = *(_QWORD *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          v32 = 0;
          v33 = 0;
          v23 = 0;
          if (v2 <= v19)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_60;
            }
            v34 = v19++;
            v35 = *(_BYTE *)(v20 + v34);
            *((_QWORD *)a2 + 1) = v19;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0)
              break;
            v32 += 7;
            v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v23) = 0;
LABEL_59:
          v3 = v34 + 1;
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v3 = v19 + 1;
            *((_QWORD *)a2 + 1) = v19 + 1;
            v24 = *(_BYTE *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0)
              break;
            v21 += 7;
            v19 = v3;
            v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 4) = v23;
      }
      else
      {
LABEL_30:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v3 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
      }
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v3 > v2)
      v2 = v3;
    while (v2 != v3)
    {
      v17 = v3 + 1;
      v18 = *(_BYTE *)(v8 + v3);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v3 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_30;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIMessageId::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 20);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 20);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t telephonytransport::PCIMessageId::hash_value(telephonytransport::PCIMessageId *this)
{
  uint64_t v1;
  uint64_t v2;

  if ((*((_BYTE *)this + 20) & 2) != 0)
  {
    v1 = *((unsigned int *)this + 4);
    if ((*((_BYTE *)this + 20) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v2 = 0;
    return v2 ^ v1;
  }
  v1 = 0;
  if ((*((_BYTE *)this + 20) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v2 = *((_QWORD *)this + 1);
  return v2 ^ v1;
}

_QWORD *telephonytransport::PCIReadIndication::PCIReadIndication(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B340;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B340;
  return this;
}

void telephonytransport::PCIReadIndication::~PCIReadIndication(telephonytransport::PCIReadIndication *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B340;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);
  PB::Base::~Base(this);
}

{
  void *v1;

  telephonytransport::PCIReadIndication::~PCIReadIndication(this);
  operator delete(v1);
}

telephonytransport::PCIReadIndication *telephonytransport::PCIReadIndication::PCIReadIndication(telephonytransport::PCIReadIndication *this, const telephonytransport::PCIReadIndication *a2)
{
  void ***v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  const PB::Data *v11;
  PB::Data *v12;

  *(_QWORD *)this = off_24C80B340;
  *((_QWORD *)this + 1) = 0;
  v4 = (void ***)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 2) = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  v11 = (const PB::Data *)*((_QWORD *)a2 + 1);
  if (v11)
  {
    v12 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v12, v11);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v12);
  }
  return this;
}

uint64_t telephonytransport::PCIReadIndication::operator=(uint64_t a1, const telephonytransport::PCIReadIndication *a2)
{
  __int128 v3;
  _QWORD v5[3];

  if ((const telephonytransport::PCIReadIndication *)a1 != a2)
  {
    memset(v5, 170, sizeof(v5));
    telephonytransport::PCIReadIndication::PCIReadIndication((telephonytransport::PCIReadIndication *)v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v5[1];
    *(_OWORD *)&v5[1] = v3;
    telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadIndication *a2, telephonytransport::PCIReadIndication *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  return this;
}

_QWORD *telephonytransport::PCIReadIndication::PCIReadIndication(_QWORD *a1, uint64_t a2)
{
  void ***v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  a1[1] = 0;
  v4 = (void ***)(a1 + 1);
  *a1 = off_24C80B340;
  a1[2] = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = a1[2];
  a1[2] = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(void ***)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadIndication::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  _QWORD v5[3];

  if (a1 != a2)
  {
    memset(v5, 170, sizeof(v5));
    telephonytransport::PCIReadIndication::PCIReadIndication(v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v5[1];
    *(_OWORD *)&v5[1] = v3;
    telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)v5);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadIndication::formatText(telephonytransport::PCIReadIndication *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIReadIndication::readFrom(telephonytransport::PCIReadIndication *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void ***v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t result;
  void **v23;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void ***)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_29;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        v23 = (void **)operator new(0x10uLL);
        *v23 = 0;
        v23[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v23);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((v12 >> 3) == 1)
      {
        v20 = operator new(0x18uLL);
        *(_QWORD *)v20 = off_24C80B308;
        v20[5] = 0;
        v21 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v20;
        if (v21)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
          v20 = (_DWORD *)*((_QWORD *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v20 + 16))(v20, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_29:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_29;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadIndication::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Data *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
    return PB::Writer::write(a2, v5);
  return this;
}

BOOL telephonytransport::PCIReadIndication::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    if ((PB::Data::operator==() & 1) != 0)
      return 1;
    if (*(_QWORD *)(a1 + 8))
      return 0;
  }
  return *(_QWORD *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadIndication::hash_value(telephonytransport::PCIReadIndication *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 2);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v5 = v4 ^ v3;
  }
  else
  {
    v5 = 0;
  }
  if (*((_QWORD *)this + 1))
    v6 = PBHashBytes();
  else
    v6 = 0;
  return v6 ^ v5;
}

_QWORD *telephonytransport::PCIReadIndication::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[2])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCICreateRequest::PCICreateRequest(uint64_t this)
{
  *(_QWORD *)this = off_24C80B378;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 40) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B378;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 40) = 0;
  return this;
}

void telephonytransport::PCICreateRequest::~PCICreateRequest(telephonytransport::PCICreateRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B378;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B378;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B378;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCICreateRequest *telephonytransport::PCICreateRequest::PCICreateRequest(telephonytransport::PCICreateRequest *this, const telephonytransport::PCICreateRequest *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  int v13;
  int v14;
  int v16;
  int v17;
  int v18;

  *(_QWORD *)this = off_24C80B378;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 10) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  v10 = *((_BYTE *)a2 + 40);
  if ((v10 & 0x10) != 0)
  {
    v12 = *((_DWORD *)a2 + 8);
    v11 = 16;
    *((_BYTE *)this + 40) = 16;
    *((_DWORD *)this + 8) = v12;
    v10 = *((_BYTE *)a2 + 40);
    if ((v10 & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = 0;
  if ((*((_BYTE *)a2 + 40) & 1) != 0)
  {
LABEL_12:
    v13 = *((_DWORD *)a2 + 4);
    v11 |= 1u;
    *((_BYTE *)this + 40) = v11;
    *((_DWORD *)this + 4) = v13;
    v10 = *((_BYTE *)a2 + 40);
  }
LABEL_13:
  if ((v10 & 8) != 0)
  {
    v16 = *((_DWORD *)a2 + 7);
    v11 |= 8u;
    *((_BYTE *)this + 40) = v11;
    *((_DWORD *)this + 7) = v16;
    v10 = *((_BYTE *)a2 + 40);
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 4) == 0)
        goto LABEL_16;
LABEL_21:
      v18 = *((_DWORD *)a2 + 6);
      v11 |= 4u;
      *((_BYTE *)this + 40) = v11;
      *((_DWORD *)this + 6) = v18;
      if ((*((_BYTE *)a2 + 40) & 0x20) == 0)
        return this;
      goto LABEL_17;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_15;
  }
  v17 = *((_DWORD *)a2 + 5);
  v11 |= 2u;
  *((_BYTE *)this + 40) = v11;
  *((_DWORD *)this + 5) = v17;
  v10 = *((_BYTE *)a2 + 40);
  if ((v10 & 4) != 0)
    goto LABEL_21;
LABEL_16:
  if ((v10 & 0x20) != 0)
  {
LABEL_17:
    v14 = *((_DWORD *)a2 + 9);
    *((_BYTE *)this + 40) = v11 | 0x20;
    *((_DWORD *)this + 9) = v14;
  }
  return this;
}

uint64_t telephonytransport::PCICreateRequest::operator=(uint64_t a1, const telephonytransport::PCICreateRequest *a2)
{
  __int128 v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if ((const telephonytransport::PCICreateRequest *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9 = v3;
    v10 = v3;
    v8 = v3;
    telephonytransport::PCICreateRequest::PCICreateRequest((telephonytransport::PCICreateRequest *)&v8, a2);
    v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = DWORD2(v10);
    DWORD2(v10) = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v8 + 1);
    v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v9;
    v9 = v6;
    *(_QWORD *)&v6 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)&v10 = v6;
    *(_QWORD *)&v8 = off_24C80B378;
    *((_QWORD *)&v8 + 1) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCICreateRequest *a2, telephonytransport::PCICreateRequest *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 36);
  *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v4;
  return this;
}

uint64_t telephonytransport::PCICreateRequest::PCICreateRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B378;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a2 + 40) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  return a1;
}

uint64_t telephonytransport::PCICreateRequest::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  __int128 v11;
  uint64_t v12;
  unint64_t v13;

  if (a1 != a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v3 = *(_DWORD *)(a2 + 40);
    *(_DWORD *)(a2 + 40) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    LODWORD(v13) = *(_DWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v6 = *(_OWORD *)(a2 + 16);
    v11 = *(_OWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a2 + 32);
    *(_DWORD *)(a1 + 40) = v3;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = v8;
    v12 = v7;
    v10[0] = off_24C80B378;
    v10[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v10);
  }
  return a1;
}

uint64_t telephonytransport::PCICreateRequest::formatText(telephonytransport::PCICreateRequest *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  uint64_t v6;
  char v7;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "createTimeOutMs");
    v5 = *((_BYTE *)this + 40);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "flags");
  v6 = *((_QWORD *)this + 1);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "messageId");
  v7 = *((_BYTE *)this + 40);
  if ((v7 & 4) != 0)
  {
    PB::TextFormatter::format(a2, "numReadIO");
    v7 = *((_BYTE *)this + 40);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      PB::TextFormatter::format(a2, "pciTransportInterface");
      if ((*((_BYTE *)this + 40) & 0x20) == 0)
        return PB::TextFormatter::endObject(a2);
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)this + 40) & 8) == 0)
  {
    goto LABEL_9;
  }
  PB::TextFormatter::format(a2, "openRetryCount");
  v7 = *((_BYTE *)this + 40);
  if ((v7 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v7 & 0x20) != 0)
LABEL_11:
    PB::TextFormatter::format(a2, "sizeReadIO");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCICreateRequest::readFrom(telephonytransport::PCICreateRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  unint64_t v93;
  char v94;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v21 = operator new(0x18uLL);
        *(_QWORD *)v21 = off_24C80B308;
        v21[5] = 0;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v21 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        v2 = *((_QWORD *)a2 + 1);
        v3 = *((_QWORD *)a2 + 2);
        v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0)
          return v4 == 0;
        break;
      case 2u:
        *((_BYTE *)this + 40) |= 0x10u;
        v23 = *((_QWORD *)a2 + 1);
        v24 = *((_QWORD *)a2 + 2);
        v25 = *(_QWORD *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = v23 + 1;
            *((_QWORD *)a2 + 1) = v23 + 1;
            v30 = *(_BYTE *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_124;
            v26 += 7;
            v23 = v29;
            v14 = v27++ > 8;
          }
          while (!v14);
LABEL_80:
          LODWORD(v28) = 0;
          goto LABEL_124;
        }
        v71 = 0;
        v72 = 0;
        v28 = 0;
        if (v24 <= v23)
          v24 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v73 = v23 + 1;
            v74 = *(_BYTE *)(v25 + v23);
            *((_QWORD *)a2 + 1) = v73;
            v28 |= (unint64_t)(v74 & 0x7F) << v71;
            if (v74 < 0)
            {
              v71 += 7;
              v23 = v73;
              v14 = v72++ > 8;
              if (v14)
                goto LABEL_80;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v28) = 0;
          }
          break;
        }
LABEL_124:
        *((_DWORD *)this + 8) = v28;
        goto LABEL_20;
      case 3u:
        *((_BYTE *)this + 40) |= 1u;
        v31 = *((_QWORD *)a2 + 1);
        v32 = *((_QWORD *)a2 + 2);
        v33 = *(_QWORD *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          do
          {
            v37 = v31 + 1;
            *((_QWORD *)a2 + 1) = v31 + 1;
            v38 = *(_BYTE *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0)
              goto LABEL_127;
            v34 += 7;
            v31 = v37;
            v14 = v35++ > 8;
          }
          while (!v14);
LABEL_87:
          LODWORD(v36) = 0;
          goto LABEL_127;
        }
        v75 = 0;
        v76 = 0;
        v36 = 0;
        if (v32 <= v31)
          v32 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v77 = v31 + 1;
            v78 = *(_BYTE *)(v33 + v31);
            *((_QWORD *)a2 + 1) = v77;
            v36 |= (unint64_t)(v78 & 0x7F) << v75;
            if (v78 < 0)
            {
              v75 += 7;
              v31 = v77;
              v14 = v76++ > 8;
              if (v14)
                goto LABEL_87;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v36) = 0;
          }
          break;
        }
LABEL_127:
        *((_DWORD *)this + 4) = v36;
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 40) |= 8u;
        v39 = *((_QWORD *)a2 + 1);
        v40 = *((_QWORD *)a2 + 2);
        v41 = *(_QWORD *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          v42 = 0;
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = v39 + 1;
            *((_QWORD *)a2 + 1) = v39 + 1;
            v46 = *(_BYTE *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0)
              goto LABEL_130;
            v42 += 7;
            v39 = v45;
            v14 = v43++ > 8;
          }
          while (!v14);
LABEL_94:
          LODWORD(v44) = 0;
          goto LABEL_130;
        }
        v79 = 0;
        v80 = 0;
        v44 = 0;
        if (v40 <= v39)
          v40 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v81 = v39 + 1;
            v82 = *(_BYTE *)(v41 + v39);
            *((_QWORD *)a2 + 1) = v81;
            v44 |= (unint64_t)(v82 & 0x7F) << v79;
            if (v82 < 0)
            {
              v79 += 7;
              v39 = v81;
              v14 = v80++ > 8;
              if (v14)
                goto LABEL_94;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v44) = 0;
          }
          break;
        }
LABEL_130:
        *((_DWORD *)this + 7) = v44;
        goto LABEL_20;
      case 5u:
        *((_BYTE *)this + 40) |= 2u;
        v47 = *((_QWORD *)a2 + 1);
        v48 = *((_QWORD *)a2 + 2);
        v49 = *(_QWORD *)a2;
        if (v47 <= 0xFFFFFFFFFFFFFFF5 && v47 + 10 <= v48)
        {
          v50 = 0;
          v51 = 0;
          v52 = 0;
          do
          {
            v53 = v47 + 1;
            *((_QWORD *)a2 + 1) = v47 + 1;
            v54 = *(_BYTE *)(v49 + v47);
            v52 |= (unint64_t)(v54 & 0x7F) << v50;
            if ((v54 & 0x80) == 0)
              goto LABEL_133;
            v50 += 7;
            v47 = v53;
            v14 = v51++ > 8;
          }
          while (!v14);
LABEL_101:
          LODWORD(v52) = 0;
          goto LABEL_133;
        }
        v83 = 0;
        v84 = 0;
        v52 = 0;
        if (v48 <= v47)
          v48 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v48 == v47)
          {
            LODWORD(v52) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v85 = v47 + 1;
            v86 = *(_BYTE *)(v49 + v47);
            *((_QWORD *)a2 + 1) = v85;
            v52 |= (unint64_t)(v86 & 0x7F) << v83;
            if (v86 < 0)
            {
              v83 += 7;
              v47 = v85;
              v14 = v84++ > 8;
              if (v14)
                goto LABEL_101;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v52) = 0;
          }
          break;
        }
LABEL_133:
        *((_DWORD *)this + 5) = v52;
        goto LABEL_20;
      case 6u:
        *((_BYTE *)this + 40) |= 4u;
        v55 = *((_QWORD *)a2 + 1);
        v56 = *((_QWORD *)a2 + 2);
        v57 = *(_QWORD *)a2;
        if (v55 <= 0xFFFFFFFFFFFFFFF5 && v55 + 10 <= v56)
        {
          v58 = 0;
          v59 = 0;
          v60 = 0;
          do
          {
            v61 = v55 + 1;
            *((_QWORD *)a2 + 1) = v55 + 1;
            v62 = *(_BYTE *)(v57 + v55);
            v60 |= (unint64_t)(v62 & 0x7F) << v58;
            if ((v62 & 0x80) == 0)
              goto LABEL_136;
            v58 += 7;
            v55 = v61;
            v14 = v59++ > 8;
          }
          while (!v14);
LABEL_108:
          LODWORD(v60) = 0;
          goto LABEL_136;
        }
        v87 = 0;
        v88 = 0;
        v60 = 0;
        if (v56 <= v55)
          v56 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v56 == v55)
          {
            LODWORD(v60) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v89 = v55 + 1;
            v90 = *(_BYTE *)(v57 + v55);
            *((_QWORD *)a2 + 1) = v89;
            v60 |= (unint64_t)(v90 & 0x7F) << v87;
            if (v90 < 0)
            {
              v87 += 7;
              v55 = v89;
              v14 = v88++ > 8;
              if (v14)
                goto LABEL_108;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v60) = 0;
          }
          break;
        }
LABEL_136:
        *((_DWORD *)this + 6) = v60;
        goto LABEL_20;
      case 7u:
        *((_BYTE *)this + 40) |= 0x20u;
        v63 = *((_QWORD *)a2 + 1);
        v64 = *((_QWORD *)a2 + 2);
        v65 = *(_QWORD *)a2;
        if (v63 <= 0xFFFFFFFFFFFFFFF5 && v63 + 10 <= v64)
        {
          v66 = 0;
          v67 = 0;
          v68 = 0;
          do
          {
            v69 = v63 + 1;
            *((_QWORD *)a2 + 1) = v63 + 1;
            v70 = *(_BYTE *)(v65 + v63);
            v68 |= (unint64_t)(v70 & 0x7F) << v66;
            if ((v70 & 0x80) == 0)
              goto LABEL_139;
            v66 += 7;
            v63 = v69;
            v14 = v67++ > 8;
          }
          while (!v14);
LABEL_115:
          LODWORD(v68) = 0;
          goto LABEL_139;
        }
        v91 = 0;
        v92 = 0;
        v68 = 0;
        if (v64 <= v63)
          v64 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v64 == v63)
          {
            LODWORD(v68) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v93 = v63 + 1;
            v94 = *(_BYTE *)(v65 + v63);
            *((_QWORD *)a2 + 1) = v93;
            v68 |= (unint64_t)(v94 & 0x7F) << v91;
            if (v94 < 0)
            {
              v91 += 7;
              v63 = v93;
              v14 = v92++ > 8;
              if (v14)
                goto LABEL_115;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v68) = 0;
          }
          break;
        }
LABEL_139:
        *((_DWORD *)this + 9) = v68;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t telephonytransport::PCICreateRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 40);
  if ((v5 & 0x10) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)(v3 + 40) & 1) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  v5 = *(_BYTE *)(v3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  this = PB::Writer::writeVarInt(a2);
  v5 = *(_BYTE *)(v3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  this = PB::Writer::writeVarInt(a2);
  v5 = *(_BYTE *)(v3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_14:
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 40) & 0x20) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCICreateRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 0x10) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 40) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 40) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 8) != 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 8) == 0 || *(_DWORD *)(a1 + 28) != *(_DWORD *)(a2 + 28))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 40) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 40) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 40) & 4) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 40) & 0x20) == 0;
  if ((*(_BYTE *)(a1 + 40) & 0x20) == 0)
    return result;
  return (*(_BYTE *)(a2 + 40) & 0x20) != 0 && *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
}

uint64_t telephonytransport::PCICreateRequest::hash_value(telephonytransport::PCICreateRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 40) & 0x10) != 0)
  {
    v5 = *((unsigned int *)this + 8);
    if ((*((_BYTE *)this + 40) & 1) != 0)
    {
LABEL_9:
      v6 = *((unsigned int *)this + 4);
      if ((*((_BYTE *)this + 40) & 8) != 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else
  {
    v5 = 0;
    if ((*((_BYTE *)this + 40) & 1) != 0)
      goto LABEL_9;
  }
  v6 = 0;
  if ((*((_BYTE *)this + 40) & 8) != 0)
  {
LABEL_10:
    v7 = *((unsigned int *)this + 7);
    if ((*((_BYTE *)this + 40) & 2) != 0)
      goto LABEL_11;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((*((_BYTE *)this + 40) & 2) != 0)
  {
LABEL_11:
    v8 = *((unsigned int *)this + 5);
    if ((*((_BYTE *)this + 40) & 4) != 0)
      goto LABEL_12;
LABEL_18:
    v9 = 0;
    if ((*((_BYTE *)this + 40) & 0x20) != 0)
      goto LABEL_13;
LABEL_19:
    v10 = 0;
    return v5 ^ v1 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_17:
  v8 = 0;
  if ((*((_BYTE *)this + 40) & 4) == 0)
    goto LABEL_18;
LABEL_12:
  v9 = *((unsigned int *)this + 6);
  if ((*((_BYTE *)this + 40) & 0x20) == 0)
    goto LABEL_19;
LABEL_13:
  v10 = *((unsigned int *)this + 9);
  return v5 ^ v1 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

_QWORD *telephonytransport::PCICreateRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIReadResponse::PCIReadResponse(_QWORD *this)
{
  *this = off_24C80B3B0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = off_24C80B3B0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCIReadResponse::~PCIReadResponse(telephonytransport::PCIReadResponse *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B3B0;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);
  PB::Base::~Base(this);
}

{
  void *v1;

  telephonytransport::PCIReadResponse::~PCIReadResponse(this);
  operator delete(v1);
}

telephonytransport::PCIReadResponse *telephonytransport::PCIReadResponse::PCIReadResponse(telephonytransport::PCIReadResponse *this, const telephonytransport::PCIReadResponse *a2)
{
  void ***v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  const PB::Data *v12;
  PB::Data *v13;

  *(_QWORD *)this = off_24C80B3B0;
  *((_QWORD *)this + 1) = 0;
  v4 = (void ***)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 2) = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 6);
    *((_BYTE *)this + 28) = 1;
    *((_DWORD *)this + 6) = v11;
  }
  v12 = (const PB::Data *)*((_QWORD *)a2 + 1);
  if (v12)
  {
    v13 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v13, v12);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v13);
  }
  return this;
}

uint64_t telephonytransport::PCIReadResponse::operator=(uint64_t a1, const telephonytransport::PCIReadResponse *a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if ((const telephonytransport::PCIReadResponse *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadResponse::PCIReadResponse((telephonytransport::PCIReadResponse *)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadResponse *a2, telephonytransport::PCIReadResponse *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIReadResponse::PCIReadResponse(uint64_t a1, uint64_t a2)
{
  void ***v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  *(_QWORD *)a1 = off_24C80B3B0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (void ***)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v7 = *(void ***)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if (a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadResponse::PCIReadResponse((uint64_t)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadResponse::formatText(telephonytransport::PCIReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 28) & 1) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIReadResponse::readFrom(telephonytransport::PCIReadResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void ***v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  void **v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  unint64_t v36;
  char v37;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void ***)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v25 = (void **)operator new(0x10uLL);
        *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((_DWORD)v22 == 2)
      {
        *((_BYTE *)this + 28) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v27 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          v34 = 0;
          v35 = 0;
          v31 = 0;
          if (v27 <= v26)
            v27 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_53;
            }
            v36 = v26 + 1;
            v37 = *(_BYTE *)(v28 + v26);
            *((_QWORD *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0)
              break;
            v34 += 7;
            v26 = v36;
            v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          while (1)
          {
            v32 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v33 = *(_BYTE *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              break;
            v29 += 7;
            v26 = v32;
            v15 = v30++ > 8;
            if (v15)
              goto LABEL_49;
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if ((_DWORD)v22 == 1)
      {
        v23 = operator new(0x18uLL);
        *(_QWORD *)v23 = off_24C80B308;
        v23[5] = 0;
        v24 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
          v23 = (_DWORD *)*((_QWORD *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_26;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_20;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Data *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
    return PB::Writer::write(a2, v5);
  return this;
}

BOOL telephonytransport::PCIReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 1) != 0)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    if ((PB::Data::operator==() & 1) != 0)
      return 1;
    if (*(_QWORD *)(a1 + 8))
      return 0;
  }
  return *(_QWORD *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadResponse::hash_value(telephonytransport::PCIReadResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 2);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v5 = v4 ^ v3;
  }
  else
  {
    v5 = 0;
  }
  if ((*((_BYTE *)this + 28) & 1) != 0)
    v6 = *((int *)this + 6);
  else
    v6 = 0;
  if (*((_QWORD *)this + 1))
    v7 = PBHashBytes();
  else
    v7 = 0;
  return v6 ^ v5 ^ v7;
}

_QWORD *telephonytransport::PCIReadResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[2])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::PCISendImageRequest(uint64_t this)
{
  *(_DWORD *)(this + 28) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = off_24C80B3E8;
  return this;
}

{
  *(_DWORD *)(this + 28) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = off_24C80B3E8;
  return this;
}

void telephonytransport::PCISendImageRequest::~PCISendImageRequest(telephonytransport::PCISendImageRequest *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B3E8;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);
  PB::Base::~Base(this);
}

{
  void *v1;

  telephonytransport::PCISendImageRequest::~PCISendImageRequest(this);
  operator delete(v1);
}

telephonytransport::PCISendImageRequest *telephonytransport::PCISendImageRequest::PCISendImageRequest(telephonytransport::PCISendImageRequest *this, const telephonytransport::PCISendImageRequest *a2)
{
  void ***v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  const PB::Data *v12;
  PB::Data *v13;

  *(_QWORD *)this = off_24C80B3E8;
  *((_QWORD *)this + 1) = 0;
  v4 = (void ***)((char *)this + 8);
  *((_DWORD *)this + 7) = 0;
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 2) = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 6);
    *((_BYTE *)this + 28) = 1;
    *((_DWORD *)this + 6) = v11;
  }
  v12 = (const PB::Data *)*((_QWORD *)a2 + 1);
  if (v12)
  {
    v13 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v13, v12);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v13);
  }
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::operator=(uint64_t a1, const telephonytransport::PCISendImageRequest *a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if ((const telephonytransport::PCISendImageRequest *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCISendImageRequest::PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCISendImageRequest *a2, telephonytransport::PCISendImageRequest *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::PCISendImageRequest(uint64_t a1, uint64_t a2)
{
  void ***v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  *(_QWORD *)a1 = off_24C80B3E8;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (void ***)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v7 = *(void ***)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCISendImageRequest::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if (a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCISendImageRequest::PCISendImageRequest((uint64_t)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCISendImageRequest::formatText(telephonytransport::PCISendImageRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 28) & 1) != 0)
    PB::TextFormatter::format(a2, "timeoutMs");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCISendImageRequest::readFrom(telephonytransport::PCISendImageRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void ***v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  void **v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  unint64_t v36;
  char v37;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void ***)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v25 = (void **)operator new(0x10uLL);
        *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((_DWORD)v22 == 2)
      {
        *((_BYTE *)this + 28) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v27 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          v34 = 0;
          v35 = 0;
          v31 = 0;
          if (v27 <= v26)
            v27 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_53;
            }
            v36 = v26 + 1;
            v37 = *(_BYTE *)(v28 + v26);
            *((_QWORD *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0)
              break;
            v34 += 7;
            v26 = v36;
            v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          while (1)
          {
            v32 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v33 = *(_BYTE *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              break;
            v29 += 7;
            v26 = v32;
            v15 = v30++ > 8;
            if (v15)
              goto LABEL_49;
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if ((_DWORD)v22 == 1)
      {
        v23 = operator new(0x18uLL);
        *(_QWORD *)v23 = off_24C80B308;
        v23[5] = 0;
        v24 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
          v23 = (_DWORD *)*((_QWORD *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_26;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_20;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCISendImageRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Data *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
    return PB::Writer::write(a2, v5);
  return this;
}

BOOL telephonytransport::PCISendImageRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 1) != 0)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    if ((PB::Data::operator==() & 1) != 0)
      return 1;
    if (*(_QWORD *)(a1 + 8))
      return 0;
  }
  return *(_QWORD *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCISendImageRequest::hash_value(telephonytransport::PCISendImageRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 2);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v5 = v4 ^ v3;
  }
  else
  {
    v5 = 0;
  }
  if ((*((_BYTE *)this + 28) & 1) != 0)
    v6 = *((unsigned int *)this + 6);
  else
    v6 = 0;
  if (*((_QWORD *)this + 1))
    v7 = PBHashBytes();
  else
    v7 = 0;
  return v6 ^ v5 ^ v7;
}

_QWORD *telephonytransport::PCISendImageRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[2])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCICreateResponse::PCICreateResponse(uint64_t this)
{
  *(_QWORD *)this = off_24C80B420;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B420;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCICreateResponse::~PCICreateResponse(telephonytransport::PCICreateResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B420;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B420;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B420;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCICreateResponse *telephonytransport::PCICreateResponse::PCICreateResponse(telephonytransport::PCICreateResponse *this, const telephonytransport::PCICreateResponse *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  int v12;

  *(_QWORD *)this = off_24C80B420;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 24) & 2) == 0)
  {
    v10 = 1;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return this;
    goto LABEL_12;
  }
  v11 = *((_DWORD *)a2 + 5);
  *((_BYTE *)this + 24) = 2;
  *((_DWORD *)this + 5) = v11;
  v10 = 3;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_12:
    v12 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 24) = v10;
    *((_DWORD *)this + 4) = v12;
  }
  return this;
}

uint64_t telephonytransport::PCICreateResponse::operator=(uint64_t a1, const telephonytransport::PCICreateResponse *a2)
{
  __int128 v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  if ((const telephonytransport::PCICreateResponse *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v8 = v3;
    v9 = v3;
    telephonytransport::PCICreateResponse::PCICreateResponse((telephonytransport::PCICreateResponse *)&v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v8 + 1);
    v6 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)&v9 = v6;
    *(_QWORD *)&v8 = off_24C80B420;
    *((_QWORD *)&v8 + 1) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCICreateResponse *a2, telephonytransport::PCICreateResponse *a3)
{
  int v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  result = *((double *)a2 + 2);
  v6 = *((_QWORD *)this + 2);
  *((double *)this + 2) = result;
  *((_QWORD *)a2 + 2) = v6;
  return result;
}

uint64_t telephonytransport::PCICreateResponse::PCICreateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B420;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCICreateResponse::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  unint64_t v10;

  if (a1 != a2)
  {
    v10 = 0xAAAAAAAAAAAAAAAALL;
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    LODWORD(v10) = *(_DWORD *)(a1 + 24);
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v6 = *(_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 16) = v7;
    v9[2] = v6;
    v9[0] = off_24C80B420;
    v9[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::PCICreateResponse::formatText(telephonytransport::PCICreateResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 24) & 1) != 0)
    PB::TextFormatter::format(a2, "createdTransportToken");
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 24) & 2) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCICreateResponse::readFrom(telephonytransport::PCICreateResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_19;
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((_BYTE *)this + 24) |= 1u;
        v24 = *((_QWORD *)a2 + 1);
        v25 = *((_QWORD *)a2 + 2);
        v26 = *(_QWORD *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          v40 = 0;
          v41 = 0;
          v29 = 0;
          if (v25 <= v24)
            v25 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_66;
            }
            v42 = v24 + 1;
            v43 = *(_BYTE *)(v26 + v24);
            *((_QWORD *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0)
              break;
            v40 += 7;
            v24 = v42;
            v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v29) = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = v24 + 1;
            *((_QWORD *)a2 + 1) = v24 + 1;
            v31 = *(_BYTE *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              break;
            v27 += 7;
            v24 = v30;
            v14 = v28++ > 8;
            if (v14)
              goto LABEL_54;
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if ((_DWORD)v21 == 2)
      {
        *((_BYTE *)this + 24) |= 2u;
        v32 = *((_QWORD *)a2 + 1);
        v33 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          v44 = 0;
          v45 = 0;
          v37 = 0;
          if (v33 <= v32)
            v33 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_69;
            }
            v46 = v32 + 1;
            v47 = *(_BYTE *)(v34 + v32);
            *((_QWORD *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0)
              break;
            v44 += 7;
            v32 = v46;
            v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = v32 + 1;
            *((_QWORD *)a2 + 1) = v32 + 1;
            v39 = *(_BYTE *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0)
              break;
            v35 += 7;
            v32 = v38;
            v14 = v36++ > 8;
            if (v14)
              goto LABEL_61;
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if ((_DWORD)v21 == 1)
      {
        v22 = operator new(0x18uLL);
        *(_QWORD *)v22 = off_24C80B308;
        v22[5] = 0;
        v23 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_25;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_19;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCICreateResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 24);
  }
  if ((v5 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCICreateResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 24) & 1) == 0;
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCICreateResponse::hash_value(telephonytransport::PCICreateResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 24) & 2) != 0)
  {
    v5 = *((int *)this + 5);
    if ((*((_BYTE *)this + 24) & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  v5 = 0;
  if ((*((_BYTE *)this + 24) & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

_QWORD *telephonytransport::PCICreateResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRequest::PCIReadRequest(uint64_t this)
{
  *(_QWORD *)this = off_24C80B458;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B458;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCIReadRequest::~PCIReadRequest(telephonytransport::PCIReadRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B458;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B458;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B458;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIReadRequest *telephonytransport::PCIReadRequest::PCIReadRequest(telephonytransport::PCIReadRequest *this, const telephonytransport::PCIReadRequest *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  int v12;

  *(_QWORD *)this = off_24C80B458;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 6) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 24) & 2) == 0)
  {
    v10 = 1;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return this;
    goto LABEL_12;
  }
  v11 = *((_DWORD *)a2 + 5);
  *((_BYTE *)this + 24) = 2;
  *((_DWORD *)this + 5) = v11;
  v10 = 3;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_12:
    v12 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 24) = v10;
    *((_DWORD *)this + 4) = v12;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRequest::operator=(uint64_t a1, const telephonytransport::PCIReadRequest *a2)
{
  __int128 v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  if ((const telephonytransport::PCIReadRequest *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v8 = v3;
    v9 = v3;
    telephonytransport::PCIReadRequest::PCIReadRequest((telephonytransport::PCIReadRequest *)&v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v8 + 1);
    v6 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)&v9 = v6;
    *(_QWORD *)&v8 = off_24C80B458;
    *((_QWORD *)&v8 + 1) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRequest *a2, telephonytransport::PCIReadRequest *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIReadRequest::PCIReadRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B458;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  unint64_t v10;

  if (a1 != a2)
  {
    v10 = 0xAAAAAAAAAAAAAAAALL;
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    LODWORD(v10) = *(_DWORD *)(a1 + 24);
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v6 = *(_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 16) = v7;
    v9[2] = v6;
    v9[0] = off_24C80B458;
    v9[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRequest::formatText(telephonytransport::PCIReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 24) & 1) != 0)
    PB::TextFormatter::format(a2, "bytesToRead");
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 24) & 2) != 0)
    PB::TextFormatter::format(a2, "timeoutMs");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIReadRequest::readFrom(telephonytransport::PCIReadRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_19;
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((_BYTE *)this + 24) |= 1u;
        v24 = *((_QWORD *)a2 + 1);
        v25 = *((_QWORD *)a2 + 2);
        v26 = *(_QWORD *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          v40 = 0;
          v41 = 0;
          v29 = 0;
          if (v25 <= v24)
            v25 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_66;
            }
            v42 = v24 + 1;
            v43 = *(_BYTE *)(v26 + v24);
            *((_QWORD *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0)
              break;
            v40 += 7;
            v24 = v42;
            v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v29) = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = v24 + 1;
            *((_QWORD *)a2 + 1) = v24 + 1;
            v31 = *(_BYTE *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              break;
            v27 += 7;
            v24 = v30;
            v14 = v28++ > 8;
            if (v14)
              goto LABEL_54;
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if ((_DWORD)v21 == 2)
      {
        *((_BYTE *)this + 24) |= 2u;
        v32 = *((_QWORD *)a2 + 1);
        v33 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          v44 = 0;
          v45 = 0;
          v37 = 0;
          if (v33 <= v32)
            v33 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_69;
            }
            v46 = v32 + 1;
            v47 = *(_BYTE *)(v34 + v32);
            *((_QWORD *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0)
              break;
            v44 += 7;
            v32 = v46;
            v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = v32 + 1;
            *((_QWORD *)a2 + 1) = v32 + 1;
            v39 = *(_BYTE *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0)
              break;
            v35 += 7;
            v32 = v38;
            v14 = v36++ > 8;
            if (v14)
              goto LABEL_61;
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if ((_DWORD)v21 == 1)
      {
        v22 = operator new(0x18uLL);
        *(_QWORD *)v22 = off_24C80B308;
        v22[5] = 0;
        v23 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_25;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_19;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 24);
  }
  if ((v5 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 24) & 1) == 0;
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIReadRequest::hash_value(telephonytransport::PCIReadRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 24) & 2) != 0)
  {
    v5 = *((unsigned int *)this + 5);
    if ((*((_BYTE *)this + 24) & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  v5 = 0;
  if ((*((_BYTE *)this + 24) & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

_QWORD *telephonytransport::PCIReadRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIFreeResponse::PCIFreeResponse(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B490;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = off_24C80B490;
  return this;
}

void telephonytransport::PCIFreeResponse::~PCIFreeResponse(telephonytransport::PCIFreeResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B490;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B490;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B490;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIFreeResponse *telephonytransport::PCIFreeResponse::PCIFreeResponse(telephonytransport::PCIFreeResponse *this, const telephonytransport::PCIFreeResponse *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;

  *(_QWORD *)this = off_24C80B490;
  *((_QWORD *)this + 1) = 0;
  v4 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 1);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *v4 = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 20) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 20) = 1;
    *((_DWORD *)this + 4) = v11;
  }
  return this;
}

uint64_t telephonytransport::PCIFreeResponse::operator=(uint64_t a1, const telephonytransport::PCIFreeResponse *a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[3];

  if ((const telephonytransport::PCIFreeResponse *)a1 != a2)
  {
    memset(v7, 170, sizeof(v7));
    telephonytransport::PCIFreeResponse::PCIFreeResponse((telephonytransport::PCIFreeResponse *)v7, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v7[1];
    v4 = *(_DWORD *)(a1 + 16);
    v5 = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v7[2];
    v7[2] = __PAIR64__(v5, v4);
    v7[0] = off_24C80B490;
    v7[1] = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFreeResponse *a2, telephonytransport::PCIFreeResponse *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIFreeResponse::PCIFreeResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B490;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIFreeResponse::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD v8[2];
  int v9;
  int v10;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6 = *(_DWORD *)(a1 + 16);
    LODWORD(v3) = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(a1 + 16) = v4;
    v9 = v6;
    v10 = v3;
    v8[0] = off_24C80B490;
    v8[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIFreeResponse::formatText(telephonytransport::PCIFreeResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 20) & 1) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIFreeResponse::readFrom(telephonytransport::PCIFreeResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  char v33;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_28;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 20) |= 1u;
        v22 = *((_QWORD *)a2 + 1);
        v23 = *((_QWORD *)a2 + 2);
        v24 = *(_QWORD *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          v30 = 0;
          v31 = 0;
          v27 = 0;
          if (v23 <= v22)
            v23 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_47;
            }
            v32 = v22 + 1;
            v33 = *(_BYTE *)(v24 + v22);
            *((_QWORD *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0)
              break;
            v30 += 7;
            v22 = v32;
            v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v27) = 0;
        }
        else
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (1)
          {
            v28 = v22 + 1;
            *((_QWORD *)a2 + 1) = v22 + 1;
            v29 = *(_BYTE *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              break;
            v25 += 7;
            v22 = v28;
            v14 = v26++ > 8;
            if (v14)
              goto LABEL_43;
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_28;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFreeResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 20) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIFreeResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 20) & 1) == 0;
  if ((*(_BYTE *)(a1 + 20) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIFreeResponse::hash_value(telephonytransport::PCIFreeResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 20) & 1) != 0)
    v5 = *((int *)this + 4);
  else
    v5 = 0;
  return v5 ^ v1;
}

_QWORD *telephonytransport::PCIFreeResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::PCIWriteRequest(uint64_t this)
{
  *(_DWORD *)(this + 28) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = off_24C80B4C8;
  return this;
}

{
  *(_DWORD *)(this + 28) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = off_24C80B4C8;
  return this;
}

void telephonytransport::PCIWriteRequest::~PCIWriteRequest(telephonytransport::PCIWriteRequest *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B4C8;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);
  PB::Base::~Base(this);
}

{
  void *v1;

  telephonytransport::PCIWriteRequest::~PCIWriteRequest(this);
  operator delete(v1);
}

telephonytransport::PCIWriteRequest *telephonytransport::PCIWriteRequest::PCIWriteRequest(telephonytransport::PCIWriteRequest *this, const telephonytransport::PCIWriteRequest *a2)
{
  void ***v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  const PB::Data *v12;
  PB::Data *v13;

  *(_QWORD *)this = off_24C80B4C8;
  *((_QWORD *)this + 1) = 0;
  v4 = (void ***)((char *)this + 8);
  *((_DWORD *)this + 7) = 0;
  *((_QWORD *)this + 2) = 0;
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_QWORD *)v6 = off_24C80B308;
    v6[5] = 0;
    v7 = *(_BYTE *)(v5 + 20);
    if ((v7 & 2) != 0)
    {
      v9 = *(_DWORD *)(v5 + 16);
      *((_BYTE *)v6 + 20) = 2;
      v6[4] = v9;
      v8 = 3;
      if ((v7 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 2) = v6;
        goto LABEL_8;
      }
    }
    else
    {
      v8 = 1;
      if ((*(_BYTE *)(v5 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v10 = *(_QWORD *)(v5 + 8);
    *((_BYTE *)v6 + 20) = v8;
    *((_QWORD *)v6 + 1) = v10;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
    v11 = *((_DWORD *)a2 + 6);
    *((_BYTE *)this + 28) = 1;
    *((_DWORD *)this + 6) = v11;
  }
  v12 = (const PB::Data *)*((_QWORD *)a2 + 1);
  if (v12)
  {
    v13 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v13, v12);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v13);
  }
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::operator=(uint64_t a1, const telephonytransport::PCIWriteRequest *a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if ((const telephonytransport::PCIWriteRequest *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIWriteRequest::PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIWriteRequest *a2, telephonytransport::PCIWriteRequest *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::PCIWriteRequest(uint64_t a1, uint64_t a2)
{
  void ***v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  *(_QWORD *)a1 = off_24C80B4C8;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (void ***)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v7 = *(void ***)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIWriteRequest::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  int v4;
  int v5;
  __int128 v6;
  _BYTE v8[32];

  if (a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIWriteRequest::PCIWriteRequest((uint64_t)v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    v5 = *(_DWORD *)(a1 + 28);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIWriteRequest::formatText(telephonytransport::PCIWriteRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 28) & 1) != 0)
    PB::TextFormatter::format(a2, "timeoutMs");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIWriteRequest::readFrom(telephonytransport::PCIWriteRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void ***v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  void **v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  unint64_t v36;
  char v37;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void ***)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v25 = (void **)operator new(0x10uLL);
        *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((_DWORD)v22 == 2)
      {
        *((_BYTE *)this + 28) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v27 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          v34 = 0;
          v35 = 0;
          v31 = 0;
          if (v27 <= v26)
            v27 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_53;
            }
            v36 = v26 + 1;
            v37 = *(_BYTE *)(v28 + v26);
            *((_QWORD *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0)
              break;
            v34 += 7;
            v26 = v36;
            v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          while (1)
          {
            v32 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v33 = *(_BYTE *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              break;
            v29 += 7;
            v26 = v32;
            v15 = v30++ > 8;
            if (v15)
              goto LABEL_49;
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if ((_DWORD)v22 == 1)
      {
        v23 = operator new(0x18uLL);
        *(_QWORD *)v23 = off_24C80B308;
        v23[5] = 0;
        v24 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
          v23 = (_DWORD *)*((_QWORD *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_26;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_20;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIWriteRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Data *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v5 = *(const PB::Data **)(v3 + 8);
  if (v5)
    return PB::Writer::write(a2, v5);
  return this;
}

BOOL telephonytransport::PCIWriteRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 28) & 1) != 0)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    if ((PB::Data::operator==() & 1) != 0)
      return 1;
    if (*(_QWORD *)(a1 + 8))
      return 0;
  }
  return *(_QWORD *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIWriteRequest::hash_value(telephonytransport::PCIWriteRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 2);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v5 = v4 ^ v3;
  }
  else
  {
    v5 = 0;
  }
  if ((*((_BYTE *)this + 28) & 1) != 0)
    v6 = *((unsigned int *)this + 6);
  else
    v6 = 0;
  if (*((_QWORD *)this + 1))
    v7 = PBHashBytes();
  else
    v7 = 0;
  return v6 ^ v5 ^ v7;
}

_QWORD *telephonytransport::PCIWriteRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[2])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::PCIStatusIndication(uint64_t this)
{
  *(_QWORD *)this = off_24C80B500;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 36) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B500;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 36) = 0;
  return this;
}

void telephonytransport::PCIStatusIndication::~PCIStatusIndication(telephonytransport::PCIStatusIndication *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B500;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  *(_QWORD *)this = off_24C80B500;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)this = off_24C80B500;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIStatusIndication *telephonytransport::PCIStatusIndication::PCIStatusIndication(telephonytransport::PCIStatusIndication *this, const telephonytransport::PCIStatusIndication *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)this = off_24C80B500;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 9) = 0;
  v4 = *((_QWORD *)a2 + 3);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 3) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  v10 = *((_BYTE *)a2 + 36);
  if ((v10 & 4) != 0)
  {
    v12 = *((_DWORD *)a2 + 8);
    v11 = 4;
    *((_BYTE *)this + 36) = 4;
    *((_DWORD *)this + 8) = v12;
    v10 = *((_BYTE *)a2 + 36);
    if ((v10 & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = 0;
  if ((*((_BYTE *)a2 + 36) & 1) != 0)
  {
LABEL_12:
    v13 = *((_QWORD *)a2 + 1);
    v11 |= 1u;
    *((_BYTE *)this + 36) = v11;
    *((_QWORD *)this + 1) = v13;
    v10 = *((_BYTE *)a2 + 36);
  }
LABEL_13:
  if ((v10 & 2) != 0)
  {
    v14 = *((_QWORD *)a2 + 2);
    *((_BYTE *)this + 36) = v11 | 2;
    *((_QWORD *)this + 2) = v14;
  }
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::operator=(uint64_t a1, const telephonytransport::PCIStatusIndication *a2)
{
  __int128 v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  __int128 v7;
  _BYTE v9[32];
  unint64_t v10;

  if ((const telephonytransport::PCIStatusIndication *)a1 != a2)
  {
    v10 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v9 = v3;
    *(_OWORD *)&v9[16] = v3;
    telephonytransport::PCIStatusIndication::PCIStatusIndication((telephonytransport::PCIStatusIndication *)v9, a2);
    v4 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)&v9[24];
    v5 = *(_DWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 36);
    *(_QWORD *)(a1 + 32) = v10;
    v10 = __PAIR64__(v6, v5);
    v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v9[8];
    *(_OWORD *)&v9[8] = v7;
    *(_QWORD *)v9 = off_24C80B500;
    *(_QWORD *)&v9[24] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIStatusIndication *a2, telephonytransport::PCIStatusIndication *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_DWORD *)(this + 36);
  *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v3;
  v4 = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  v7 = *(_QWORD *)(this + 16);
  v6 = *(_QWORD *)(this + 24);
  v8 = *((_QWORD *)a2 + 3);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *(_QWORD *)(this + 24) = v8;
  *((_DWORD *)a2 + 8) = v4;
  *((_QWORD *)a2 + 2) = v7;
  *((_QWORD *)a2 + 3) = v6;
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::PCIStatusIndication(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B500;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a2 + 36) = 0;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIStatusIndication::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void (**v9)(telephonytransport::PCIStatusIndication *__hidden);
  __int128 v10;
  uint64_t v11;
  int v12;
  int v13;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 36) = 0;
    v5 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 36);
    v12 = *(_DWORD *)(a1 + 32);
    v13 = v3;
    v6 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 32) = v4;
    v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    v10 = v7;
    v9 = off_24C80B500;
    v11 = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t telephonytransport::PCIStatusIndication::formatText(telephonytransport::PCIStatusIndication *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  uint64_t v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 36);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "arg1");
    v5 = *((_BYTE *)this + 36);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "arg2");
  v6 = *((_QWORD *)this + 3);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "messageId");
  if ((*((_BYTE *)this + 36) & 4) != 0)
    PB::TextFormatter::format(a2, "status");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIStatusIndication::readFrom(telephonytransport::PCIStatusIndication *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  unint64_t v57;
  char v58;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v21 = operator new(0x18uLL);
        *(_QWORD *)v21 = off_24C80B308;
        v21[5] = 0;
        v22 = *((_QWORD *)this + 3);
        *((_QWORD *)this + 3) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v21 = (_DWORD *)*((_QWORD *)this + 3);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        v2 = *((_QWORD *)a2 + 1);
        v3 = *((_QWORD *)a2 + 2);
        v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0)
          return v4 == 0;
        break;
      case 2u:
        *((_BYTE *)this + 36) |= 4u;
        v23 = *((_QWORD *)a2 + 1);
        v24 = *((_QWORD *)a2 + 2);
        v25 = *(_QWORD *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = v23 + 1;
            *((_QWORD *)a2 + 1) = v23 + 1;
            v30 = *(_BYTE *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_79;
            v26 += 7;
            v23 = v29;
            v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        v47 = 0;
        v48 = 0;
        v28 = 0;
        if (v24 <= v23)
          v24 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v49 = v23 + 1;
            v50 = *(_BYTE *)(v25 + v23);
            *((_QWORD *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              v23 = v49;
              v14 = v48++ > 8;
              if (v14)
                goto LABEL_59;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v28) = 0;
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 8) = v28;
        goto LABEL_20;
      case 3u:
        *((_BYTE *)this + 36) |= 1u;
        v31 = *((_QWORD *)a2 + 1);
        v32 = *((_QWORD *)a2 + 2);
        v33 = *(_QWORD *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          do
          {
            v37 = v31 + 1;
            *((_QWORD *)a2 + 1) = v31 + 1;
            v38 = *(_BYTE *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0)
              goto LABEL_82;
            v34 += 7;
            v31 = v37;
            v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          v36 = 0;
          goto LABEL_82;
        }
        v51 = 0;
        v52 = 0;
        v36 = 0;
        if (v32 <= v31)
          v32 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v32 == v31)
          {
            v36 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v53 = v31 + 1;
            v54 = *(_BYTE *)(v33 + v31);
            *((_QWORD *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              v31 = v53;
              v14 = v52++ > 8;
              if (v14)
                goto LABEL_66;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              v36 = 0;
          }
          break;
        }
LABEL_82:
        *((_QWORD *)this + 1) = v36;
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 36) |= 2u;
        v39 = *((_QWORD *)a2 + 1);
        v40 = *((_QWORD *)a2 + 2);
        v41 = *(_QWORD *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          v42 = 0;
          v43 = 0;
          v44 = 0;
          do
          {
            v45 = v39 + 1;
            *((_QWORD *)a2 + 1) = v39 + 1;
            v46 = *(_BYTE *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0)
              goto LABEL_85;
            v42 += 7;
            v39 = v45;
            v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          v44 = 0;
          goto LABEL_85;
        }
        v55 = 0;
        v56 = 0;
        v44 = 0;
        if (v40 <= v39)
          v40 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v40 == v39)
          {
            v44 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v57 = v39 + 1;
            v58 = *(_BYTE *)(v41 + v39);
            *((_QWORD *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              v39 = v57;
              v14 = v56++ > 8;
              if (v14)
                goto LABEL_73;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              v44 = 0;
          }
          break;
        }
LABEL_85:
        *((_QWORD *)this + 2) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t telephonytransport::PCIStatusIndication::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 24);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 36);
  if ((v5 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        return this;
      return PB::Writer::writeVarInt(a2);
    }
  }
  else if ((*(_BYTE *)(v3 + 36) & 1) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 36) & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIStatusIndication::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 36) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 36) & 4) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 36) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 36) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 36) & 1) == 0 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 36) & 1) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 36) & 2) == 0;
  if ((*(_BYTE *)(a1 + 36) & 2) == 0)
    return result;
  return (*(_BYTE *)(a2 + 36) & 2) != 0 && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIStatusIndication::hash_value(telephonytransport::PCIStatusIndication *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *((_QWORD *)this + 3);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 36) & 4) == 0)
  {
    v5 = 0;
    if ((*((_BYTE *)this + 36) & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v6 = 0;
    if ((*((_BYTE *)this + 36) & 2) != 0)
      goto LABEL_10;
LABEL_13:
    v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  v5 = *((unsigned int *)this + 8);
  if ((*((_BYTE *)this + 36) & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v6 = *((_QWORD *)this + 1);
  if ((*((_BYTE *)this + 36) & 2) == 0)
    goto LABEL_13;
LABEL_10:
  v7 = *((_QWORD *)this + 2);
  return v5 ^ v1 ^ v6 ^ v7;
}

_QWORD *telephonytransport::PCIStatusIndication::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[3])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[3] = this;
  }
  return this;
}

_QWORD *telephonytransport::PCIFreeRequest::PCIFreeRequest(_QWORD *this)
{
  *this = off_24C80B538;
  this[1] = 0;
  return this;
}

{
  *this = off_24C80B538;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIFreeRequest::~PCIFreeRequest(telephonytransport::PCIFreeRequest *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B538;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B538;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B538;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIFreeRequest *telephonytransport::PCIFreeRequest::PCIFreeRequest(telephonytransport::PCIFreeRequest *this, const telephonytransport::PCIFreeRequest *a2)
{
  uint64_t v3;
  _DWORD *v4;
  char v5;
  char v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)this = off_24C80B538;
  *((_QWORD *)this + 1) = 0;
  v3 = *((_QWORD *)a2 + 1);
  if (v3)
  {
    v4 = operator new(0x18uLL);
    *(_QWORD *)v4 = off_24C80B308;
    v4[5] = 0;
    v5 = *(_BYTE *)(v3 + 20);
    if ((v5 & 2) != 0)
    {
      v7 = *(_DWORD *)(v3 + 16);
      *((_BYTE *)v4 + 20) = 2;
      v4[4] = v7;
      v6 = 3;
      if ((v5 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v4;
        return this;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(v3 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v8 = *(_QWORD *)(v3 + 8);
    *((_BYTE *)v4 + 20) = v6;
    *((_QWORD *)v4 + 1) = v8;
    goto LABEL_7;
  }
  return this;
}

const telephonytransport::PCIFreeRequest *telephonytransport::PCIFreeRequest::operator=(const telephonytransport::PCIFreeRequest *a1, const telephonytransport::PCIFreeRequest *a2)
{
  uint64_t v3;
  void (**v5)(telephonytransport::PCIFreeRequest *__hidden);
  unint64_t v6;

  if (a1 != a2)
  {
    v5 = (void (**)(telephonytransport::PCIFreeRequest *__hidden))0xAAAAAAAAAAAAAAAALL;
    v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIFreeRequest::PCIFreeRequest((telephonytransport::PCIFreeRequest *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = off_24C80B538;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFreeRequest *a2, telephonytransport::PCIFreeRequest *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *telephonytransport::PCIFreeRequest::PCIFreeRequest(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B538;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = off_24C80B538;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t telephonytransport::PCIFreeRequest::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = off_24C80B538;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFreeRequest::formatText(telephonytransport::PCIFreeRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIFreeRequest::readFrom(telephonytransport::PCIFreeRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = operator new(0x18uLL);
        *(_QWORD *)v19 = off_24C80B308;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFreeRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

BOOL telephonytransport::PCIFreeRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  result = v3 == 0;
  if (v2)
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  return result;
}

uint64_t telephonytransport::PCIFreeRequest::hash_value(telephonytransport::PCIFreeRequest *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(_BYTE *)(v1 + 20);
  v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0)
    v3 = 0;
  v4 = *(_QWORD *)(v1 + 8);
  if ((v2 & 1) == 0)
    v4 = 0;
  return v4 ^ v3;
}

_QWORD *telephonytransport::PCIFreeRequest::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteResponse::PCIWriteResponse(uint64_t this)
{
  *(_QWORD *)this = off_24C80B570;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = off_24C80B570;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCIWriteResponse::~PCIWriteResponse(telephonytransport::PCIWriteResponse *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B570;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B570;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_24C80B570;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  operator delete(v3);
}

telephonytransport::PCIWriteResponse *telephonytransport::PCIWriteResponse::PCIWriteResponse(telephonytransport::PCIWriteResponse *this, const telephonytransport::PCIWriteResponse *a2)
{
  uint64_t v4;
  _DWORD *v5;
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  int v12;

  *(_QWORD *)this = off_24C80B570;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  v4 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    v5 = operator new(0x18uLL);
    *(_QWORD *)v5 = off_24C80B308;
    v5[5] = 0;
    v6 = *(_BYTE *)(v4 + 20);
    if ((v6 & 2) != 0)
    {
      v8 = *(_DWORD *)(v4 + 16);
      *((_BYTE *)v5 + 20) = 2;
      v5[4] = v8;
      v7 = 3;
      if ((v6 & 1) == 0)
      {
LABEL_7:
        *((_QWORD *)this + 1) = v5;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 1;
      if ((*(_BYTE *)(v4 + 20) & 1) == 0)
        goto LABEL_7;
    }
    v9 = *(_QWORD *)(v4 + 8);
    *((_BYTE *)v5 + 20) = v7;
    *((_QWORD *)v5 + 1) = v9;
    goto LABEL_7;
  }
LABEL_8:
  if ((*((_BYTE *)a2 + 24) & 2) == 0)
  {
    v10 = 1;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return this;
    goto LABEL_12;
  }
  v11 = *((_DWORD *)a2 + 5);
  *((_BYTE *)this + 24) = 2;
  *((_DWORD *)this + 5) = v11;
  v10 = 3;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_12:
    v12 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 24) = v10;
    *((_DWORD *)this + 4) = v12;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteResponse::operator=(uint64_t a1, const telephonytransport::PCIWriteResponse *a2)
{
  __int128 v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  if ((const telephonytransport::PCIWriteResponse *)a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v8 = v3;
    v9 = v3;
    telephonytransport::PCIWriteResponse::PCIWriteResponse((telephonytransport::PCIWriteResponse *)&v8, a2);
    v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)&v8 + 1);
    v6 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)&v9 = v6;
    *(_QWORD *)&v8 = off_24C80B570;
    *((_QWORD *)&v8 + 1) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCIWriteResponse *a2, telephonytransport::PCIWriteResponse *a3)
{
  int v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  result = *((double *)a2 + 2);
  v6 = *((_QWORD *)this + 2);
  *((double *)this + 2) = result;
  *((_QWORD *)a2 + 2) = v6;
  return result;
}

uint64_t telephonytransport::PCIWriteResponse::PCIWriteResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_24C80B570;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIWriteResponse::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  unint64_t v10;

  if (a1 != a2)
  {
    v10 = 0xAAAAAAAAAAAAAAAALL;
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    LODWORD(v10) = *(_DWORD *)(a1 + 24);
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v6 = *(_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 16) = v7;
    v9[2] = v6;
    v9[0] = off_24C80B570;
    v9[1] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::PCIWriteResponse::formatText(telephonytransport::PCIWriteResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 24) & 1) != 0)
    PB::TextFormatter::format(a2, "bytesWritten");
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "messageId");
  if ((*((_BYTE *)this + 24) & 2) != 0)
    PB::TextFormatter::format(a2, "result");
  return PB::TextFormatter::endObject(a2);
}

uint64_t telephonytransport::PCIWriteResponse::readFrom(telephonytransport::PCIWriteResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_19;
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((_BYTE *)this + 24) |= 1u;
        v24 = *((_QWORD *)a2 + 1);
        v25 = *((_QWORD *)a2 + 2);
        v26 = *(_QWORD *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          v40 = 0;
          v41 = 0;
          v29 = 0;
          if (v25 <= v24)
            v25 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_66;
            }
            v42 = v24 + 1;
            v43 = *(_BYTE *)(v26 + v24);
            *((_QWORD *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0)
              break;
            v40 += 7;
            v24 = v42;
            v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v29) = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = v24 + 1;
            *((_QWORD *)a2 + 1) = v24 + 1;
            v31 = *(_BYTE *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              break;
            v27 += 7;
            v24 = v30;
            v14 = v28++ > 8;
            if (v14)
              goto LABEL_54;
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if ((_DWORD)v21 == 2)
      {
        *((_BYTE *)this + 24) |= 2u;
        v32 = *((_QWORD *)a2 + 1);
        v33 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          v44 = 0;
          v45 = 0;
          v37 = 0;
          if (v33 <= v32)
            v33 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_69;
            }
            v46 = v32 + 1;
            v47 = *(_BYTE *)(v34 + v32);
            *((_QWORD *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0)
              break;
            v44 += 7;
            v32 = v46;
            v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = v32 + 1;
            *((_QWORD *)a2 + 1) = v32 + 1;
            v39 = *(_BYTE *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0)
              break;
            v35 += 7;
            v32 = v38;
            v14 = v36++ > 8;
            if (v14)
              goto LABEL_61;
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if ((_DWORD)v21 == 1)
      {
        v22 = operator new(0x18uLL);
        *(_QWORD *)v22 = off_24C80B308;
        v22[5] = 0;
        v23 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_25;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_19;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIWriteResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(_BYTE *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v5 = *(_BYTE *)(v3 + 24);
  }
  if ((v5 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL telephonytransport::PCIWriteResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 24) & 1) == 0;
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    return result;
  return (*(_BYTE *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIWriteResponse::hash_value(telephonytransport::PCIWriteResponse *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 1);
  if (v1)
  {
    v2 = *(_BYTE *)(v1 + 20);
    v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0)
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 8);
    if ((v2 & 1) == 0)
      v4 = 0;
    v1 = v4 ^ v3;
  }
  if ((*((_BYTE *)this + 24) & 2) != 0)
  {
    v5 = *((int *)this + 5);
    if ((*((_BYTE *)this + 24) & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  v5 = 0;
  if ((*((_BYTE *)this + 24) & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

_QWORD *telephonytransport::PCIWriteResponse::makeMessageId(_QWORD *this)
{
  _QWORD *v1;

  if (!this[1])
  {
    v1 = this;
    this = operator new(0x18uLL);
    *this = off_24C80B308;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void telephonytransport::BaseProtocol::create(uint64_t a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::__shared_weak_count_vtbl **a6@<X8>)
{
  std::__shared_weak_count_vtbl *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count_vtbl *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  dispatch_object_t object;
  std::__shared_weak_count_vtbl *v36;
  std::__shared_weak_count *v37;
  __int128 v38;
  std::__shared_weak_count_vtbl *v39;
  std::__shared_weak_count *v40;

  v12 = (std::__shared_weak_count_vtbl *)operator new(0xA8uLL);
  telephonytransport::BaseProtocol::BaseProtocol((uint64_t)v12, a1, a5);
  v39 = v12;
  v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_weak_owners_ = 0;
  p_shared_weak_owners = (unint64_t *)&v13->__shared_weak_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)off_24C80B840;
  v13->__shared_owners_ = 0;
  v13[1].__vftable = v12;
  v40 = v13;
  *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36 = v12;
  v37 = v13;
  do
    v15 = __ldxr(p_shared_weak_owners);
  while (__stxr(v15 + 1, p_shared_weak_owners));
  v16 = *a2;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  v17 = (std::__shared_weak_count *)a3[1];
  v33 = *a3;
  v34 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  telephonytransport::TCPSocketStream::create((telephonytransport *)&v36, &object, &v33, a4, a5, (std::__shared_weak_count_vtbl **)&v38);
  v20 = v34;
  if (v34)
  {
    v21 = (unint64_t *)&v34->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (object)
    dispatch_release(object);
  if (v37)
    std::__shared_weak_count::__release_weak(v37);
  if ((_QWORD)v38)
  {
    v23 = v39;
    std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100]((uint64_t)&v39[3].__on_zero_shared_weak, &v38);
    v24 = v40;
    *a6 = v23;
    a6[1] = (std::__shared_weak_count_vtbl *)v24;
    if (v24)
    {
      v25 = (unint64_t *)&v24->__shared_owners_;
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
  }
  else
  {
    *a6 = 0;
    a6[1] = 0;
  }
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = v40;
  if (v40)
  {
    v31 = (unint64_t *)&v40->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

void sub_20DAB4408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, char a17)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  if (object)
    dispatch_release(object);
  if (a14)
    std::__shared_weak_count::__release_weak(a14);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::BaseProtocol::init(uint64_t a1, __int128 *a2)
{
  return std::shared_ptr<telephonytransport::TelephonyTransport>::operator=[abi:ne180100](a1 + 152, a2);
}

uint64_t telephonytransport::BaseProtocol::BaseProtocol(uint64_t a1, uint64_t a2, char *a3)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"baseproto", a3, (_QWORD *)(a1 + 8));
  *(_QWORD *)a1 = off_24C80B7A8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)(a1 + 64) = 850045863;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 24));
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 128));
  return a1;
}

void sub_20DAB451C(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;
  void **v3;
  uint64_t v4;
  std::mutex *v5;
  void **v6;
  uint64_t v7;
  void *v9;
  std::__shared_weak_count *v10;
  void *v11;

  v7 = v4;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v7);
  v9 = *v6;
  if (*v6)
  {
    v2[17] = v9;
    operator delete(v9);
  }
  std::mutex::~mutex(v5);
  v10 = (std::__shared_weak_count *)v2[7];
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  v11 = *v3;
  if (*v3)
  {
    v2[4] = v11;
    operator delete(v11);
  }
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::reserve(unint64_t *a1)
{
  unint64_t v1;
  char *v3;
  _BYTE *v4;
  char *v5;
  _BYTE *v6;
  char *v7;
  char v8;

  v1 = *a1;
  if (!((a1[2] - *a1) >> 16))
  {
    v3 = (char *)a1[1];
    v4 = operator new(0x10000uLL);
    v5 = &v3[(_QWORD)v4 - v1];
    v6 = v5;
    if (v3 != (char *)v1)
    {
      v7 = &v3[~v1];
      do
      {
        v8 = *--v3;
        (v7--)[(_QWORD)v4] = v8;
      }
      while (v3 != (char *)v1);
      v6 = v4;
    }
    *a1 = (unint64_t)v6;
    a1[1] = (unint64_t)v5;
    a1[2] = (unint64_t)(v4 + 0x10000);
    if (v1)
      operator delete((void *)v1);
  }
}

void telephonytransport::BaseProtocol::handleRead(telephonytransport::BaseProtocol *this, char *__src, unint64_t a3)
{
  unint64_t v3;
  char *v6;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  unint64_t v22;
  unint64_t v23;
  std::__shared_weak_count **v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  _BYTE v32[22];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = a3;
    v7 = (char *)*((_QWORD *)this + 3);
    v6 = (char *)*((_QWORD *)this + 4);
    v8 = (std::__shared_weak_count *)((char *)this + 24);
    while (1)
    {
      if (v7 == v6)
        goto LABEL_25;
      v9 = v6 - v7;
      if (v6 - v7 + v3 <= 7)
      {
LABEL_31:
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, __src, &__src[v3], v3);
        return;
      }
      if (v9 <= 7)
      {
        v10 = 8 - v9;
        v11 = &__src[8 - v9];
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, __src, v11, 8 - v9);
        v3 -= v10;
        v7 = (char *)*((_QWORD *)this + 3);
        v6 = (char *)*((_QWORD *)this + 4);
        v9 = v6 - v7;
        __src = v11;
      }
      v12 = bswap32(*((_DWORD *)v7 + 1)) + 8;
      v13 = v12 - v9;
      if (v12 < v9)
      {
        v15 = (unint64_t *)*((_QWORD *)this + 1);
        v8 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
        if (v8)
        {
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v17 = __ldxr(p_shared_owners);
          while (__stxr(v17 + 1, p_shared_owners));
          v3 = *v15;
          do
            v18 = __ldaxr(p_shared_owners);
          while (__stlxr(v18 - 1, p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        else
        {
          v3 = *v15;
        }
        if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_FAULT))
          goto LABEL_24;
        *(_WORD *)v32 = 0;
        v19 = "Data available in buffer must not be greater than kHeaderSize + payloadLength";
        goto LABEL_22;
      }
      if (v3 < v13)
        goto LABEL_31;
      v14 = __src;
      __src += v13;
      std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, v14, __src, v13);
      if (telephonytransport::BaseProtocol::processData(this, *((unsigned __int8 **)this + 3), *((_QWORD *)this + 4) - *((_QWORD *)this + 3)) != v12)break;
      v6 = (char *)*((_QWORD *)this + 3);
      *((_QWORD *)this + 4) = v6;
      v7 = v6;
      v3 -= v13;
      if (!v3)
        return;
    }
    v28 = (unint64_t *)*((_QWORD *)this + 1);
    v29 = *((_QWORD *)this + 2);
    *(_QWORD *)v32 = v28;
    *(_QWORD *)&v32[8] = v29;
    if (v29)
    {
      v30 = (unint64_t *)(v29 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    v3 = *v28;
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v32);
    if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_WORD *)v32 = 0;
    v19 = "Failed to process the message properly";
LABEL_22:
    v20 = v3;
    v21 = 2;
LABEL_23:
    _os_log_fault_impl(&dword_20DA91000, v20, OS_LOG_TYPE_FAULT, v19, v32, v21);
LABEL_24:
    while (1)
    {
      __break(1u);
LABEL_25:
      v22 = telephonytransport::BaseProtocol::processData(this, (unsigned __int8 *)__src, v3);
      v23 = v22;
      if (v22 <= v3)
        break;
      v24 = (std::__shared_weak_count **)*((_QWORD *)this + 1);
      v25 = *((_QWORD *)this + 2);
      *(_QWORD *)v32 = v24;
      *(_QWORD *)&v32[8] = v25;
      if (v25)
      {
        v26 = (unint64_t *)(v25 + 8);
        do
          v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
      }
      v8 = *v24;
      std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)v32);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v32 = 134218240;
        *(_QWORD *)&v32[4] = v23;
        *(_WORD *)&v32[12] = 2048;
        *(_QWORD *)&v32[14] = v3;
        v19 = "Processed bytes cannot exceed length. Processed: %zu, Length: %zu";
        v20 = v8;
        v21 = 22;
        goto LABEL_23;
      }
    }
    if (v22 != v3)
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v8, &__src[v22], &__src[v3], v3 - v22);
  }
}

unint64_t telephonytransport::BaseProtocol::processData(telephonytransport::BaseProtocol *this, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t i;
  uint64_t v6;
  unsigned __int8 *v7;
  std::__shared_weak_count *v8;
  unsigned int v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  void (***v12)(_QWORD, _QWORD, unsigned __int8 *, uint64_t);
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v16;

  if (!a3)
    return 0;
  for (i = 0; i < a3; i += v6 + 8)
  {
    if (a3 - i < 8)
      break;
    v6 = bswap32(*((_DWORD *)a2 + 1));
    if (a3 - i < v6 + 8)
      break;
    v7 = a2 + 8;
    v8 = (std::__shared_weak_count *)*((_QWORD *)this + 7);
    if (v8)
    {
      v9 = *(_DWORD *)a2;
      v10 = std::__shared_weak_count::lock(v8);
      v16 = v10;
      if (v10)
      {
        v11 = v10;
        v12 = (void (***)(_QWORD, _QWORD, unsigned __int8 *, uint64_t))*((_QWORD *)this + 6);
        if (!v12 || ((**v12)(v12, bswap32(v9), v7, v6), (v11 = v16) != 0))
        {
          p_shared_owners = (unint64_t *)&v11->__shared_owners_;
          do
            v14 = __ldaxr(p_shared_owners);
          while (__stlxr(v14 - 1, p_shared_owners));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
      }
    }
    a2 = &v7[v6];
  }
  return i;
}

void sub_20DAB4A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::BaseProtocol::sendMessage(std::mutex *this, unsigned int a2, const PB::Base *a3)
{
  uint64_t v6;
  unsigned __int8 *v8[3];

  memset(v8, 170, sizeof(v8));
  PB::Writer::Writer((PB::Writer *)v8);
  (*(void (**)(const PB::Base *, unsigned __int8 **))(*(_QWORD *)a3 + 24))(a3, v8);
  v6 = telephonytransport::BaseProtocol::sendMessage(this, a2, v8[1], (LODWORD(v8[0]) - LODWORD(v8[1])));
  PB::Writer::~Writer((PB::Writer *)v8);
  return v6;
}

void sub_20DAB4ADC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::BaseProtocol::sendMessage(std::mutex *this, unsigned int a2, const unsigned __int8 *a3, size_t a4)
{
  std::mutex *v8;
  _DWORD *sig;
  unint64_t v10;
  uint64_t v11;

  v8 = this + 1;
  std::mutex::lock(this + 1);
  sig = (_DWORD *)this[2].__m_.__sig;
  v10 = *(_QWORD *)this[2].__m_.__opaque - (_QWORD)sig;
  if (a4 + 8 <= v10)
  {
    if (a4 + 8 < v10)
      *(_QWORD *)this[2].__m_.__opaque = (char *)sig + a4 + 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&this[2], a4 + 8 - v10);
    sig = (_DWORD *)this[2].__m_.__sig;
  }
  *sig = bswap32(a2);
  *(_DWORD *)(this[2].__m_.__sig + 4) = bswap32(a4);
  memcpy((void *)(this[2].__m_.__sig + 8), a3, a4);
  v11 = (***(uint64_t (****)(_QWORD, uint64_t, uint64_t))&this[2].__m_.__opaque[16])(*(_QWORD *)&this[2].__m_.__opaque[16], this[2].__m_.__sig, *(_QWORD *)this[2].__m_.__opaque - this[2].__m_.__sig);
  std::mutex::unlock(v8);
  return v11;
}

void sub_20DAB4BBC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void telephonytransport::BaseProtocol::~BaseProtocol(std::mutex *this)
{
  void *sig;
  std::__shared_weak_count *v3;
  void *v4;

  this->__m_.__sig = (uint64_t)off_24C80B7A8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&this[2].__m_.__opaque[16]);
  sig = (void *)this[2].__m_.__sig;
  if (sig)
  {
    *(_QWORD *)this[2].__m_.__opaque = sig;
    operator delete(sig);
  }
  std::mutex::~mutex(this + 1);
  v3 = *(std::__shared_weak_count **)&this->__m_.__opaque[48];
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  v4 = *(void **)&this->__m_.__opaque[16];
  if (v4)
  {
    *(_QWORD *)&this->__m_.__opaque[24] = v4;
    operator delete(v4);
  }
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this->__m_.__opaque);
}

{
  void *sig;
  std::__shared_weak_count *v3;
  void *v4;

  this->__m_.__sig = (uint64_t)off_24C80B7A8;
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&this[2].__m_.__opaque[16]);
  sig = (void *)this[2].__m_.__sig;
  if (sig)
  {
    *(_QWORD *)this[2].__m_.__opaque = sig;
    operator delete(sig);
  }
  std::mutex::~mutex(this + 1);
  v3 = *(std::__shared_weak_count **)&this->__m_.__opaque[48];
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  v4 = *(void **)&this->__m_.__opaque[16];
  if (v4)
  {
    *(_QWORD *)&this->__m_.__opaque[24] = v4;
    operator delete(v4);
  }
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)this->__m_.__opaque);
  operator delete(this);
}

_QWORD *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;

  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    v9 = (char *)v7[1];
    goto LABEL_17;
  }
  v12 = (_BYTE *)result[1];
  v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    v16 = a3 - __src;
    if (v16)
      result = memmove(v9, __src, v16);
    v15 = &v9[v16];
    goto LABEL_20;
  }
  v14 = &__src[v13];
  if (v12 != v9)
  {
    result = memmove((void *)*result, __src, v13);
    v9 = (char *)v7[1];
  }
  if (a3 != v14)
    result = memmove(v9, v14, a3 - v14);
  v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int64_t v19;
  _BYTE *v20;
  char *v21;
  char *v22;
  _BYTE *v23;
  char *v24;
  char v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;

  if (a5 < 1)
    return;
  v10 = *(_BYTE **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
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
      v16 = (char *)operator new(v15);
    else
      v16 = 0;
    v26 = &v13[(_QWORD)v16];
    memcpy(&v13[(_QWORD)v16], __src, a5);
    if (v11 == __dst)
    {
      v27 = &v13[(_QWORD)v16];
    }
    else
    {
      do
      {
        v13[(_QWORD)v16 - 1] = v13[(_QWORD)(v11 - 1)];
        --v13;
      }
      while (v13);
      v10 = *(_BYTE **)(a1 + 8);
      v27 = v16;
    }
    v28 = &v26[a5];
    v29 = &v16[v15];
    if (v10 != __dst)
      memmove(v28, __dst, v10 - __dst);
    v30 = *(char **)a1;
    *(_QWORD *)a1 = v27;
    *(_QWORD *)(a1 + 8) = &v28[v10 - __dst];
    *(_QWORD *)(a1 + 16) = v29;
    if (v30)
      operator delete(v30);
    return;
  }
  v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v18 = &__src[a5];
    v20 = *(_BYTE **)(a1 + 8);
LABEL_17:
    v21 = &__dst[a5];
    v22 = &v20[-a5];
    v23 = v20;
    if (&v20[-a5] < v10)
    {
      v24 = (char *)(&v10[a5] - v20);
      v23 = v20;
      do
      {
        v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(_QWORD *)(a1 + 8) = v23;
    if (v20 != v21)
      memmove(&__dst[a5], __dst, v20 - v21);
    if (v18 != __src)
      memmove(__dst, __src, v18 - __src);
    return;
  }
  v18 = &__src[v17];
  v19 = a4 - &__src[v17];
  if (a4 != &__src[v17])
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  v20 = &v10[v19];
  *(_QWORD *)(a1 + 8) = &v10[v19];
  if (v17 >= 1)
    goto LABEL_17;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

void std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::NetworkSocketBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, NSObject **a4@<X3>, char *a5@<X4>, _QWORD *a6@<X8>)
{
  NSObject *v11;
  NSObject *v12;
  telephonytransport *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  dispatch_object_t v27;
  unint64_t v28;
  unint64_t v29;
  dispatch_object_t object;
  unint64_t v31;
  unint64_t v32;
  uint8_t buf[8];

  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v11 = *a2;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  telephonytransport::NetworkSocketForwarder::create(a1, a3, &object, a5, &v31);
  if (object)
    dispatch_release(object);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v12 = *a4;
  v27 = v12;
  if (v12)
    dispatch_retain(v12);
  telephonytransport::NetworkSocketForwarder::create(a3, a1, &v27, a5, &v28);
  v13 = (telephonytransport *)v27;
  if (v27)
    dispatch_release(v27);
  v14 = v31;
  if (v31 && (v15 = v28) != 0)
  {
    *a6 = 0xAAAAAAAAAAAAAAAALL;
    a6[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 = operator new(0x20uLL);
    v17 = v32;
    *v16 = v14;
    v16[1] = v17;
    v31 = 0;
    v32 = 0;
    v18 = v29;
    v16[2] = v15;
    v16[3] = v18;
    v28 = 0;
    v29 = 0;
    *a6 = v16;
    *(_QWORD *)buf = v16;
    v19 = operator new(0x20uLL);
    *v19 = off_24C80B8B8;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v16;
    a6[1] = v19;
    *(_QWORD *)buf = 0;
    std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100]((uint64_t *)buf);
  }
  else
  {
    v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DA91000, v20, OS_LOG_TYPE_ERROR, "Failed to create NetworkSocketBridge", buf, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  v21 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v22 = (unint64_t *)(v29 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v25 = (unint64_t *)(v32 + 8);
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

void sub_20DAB5338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, dispatch_object_t object, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  std::unique_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::reset[abi:ne180100](&a15);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_20DAB537C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  JUMPOUT(0x20DAB5374);
}

__n128 telephonytransport::NetworkSocketBridge::NetworkSocketBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1 + 16);
    v2 = (void *)std::shared_ptr<telephonytransport::TCPSocketStream>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t PBHashBytes()
{
  return MEMORY[0x24BE7B010]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B1E8](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x24BE7B1F0]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B218](this, a2);
}

{
  return MEMORY[0x24BE7B220](this, a2);
}

{
  return MEMORY[0x24BE7B230](this, a2);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x24BE7B238](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x24BE7B240](this);
}

uint64_t PB::Data::assign(PB::Data *this, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  return MEMORY[0x24BE7B248](this, a2, a3);
}

uint64_t PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  return MEMORY[0x24BE7B250](this, a2);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x24BE7B258]();
}

uint64_t PB::Reader::read(PB::Reader *this, PB::Data *a2)
{
  return MEMORY[0x24BE7B260](this, a2);
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x24BE7B270](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x24BE7B278]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BE7B280](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x24BE7B288](this);
}

{
  return MEMORY[0x24BE7B290](this);
}

{
  return MEMORY[0x24BE7B2A0](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x24BE7B2A8](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, const PB::Data *a2)
{
  return MEMORY[0x24BE7B2B0](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x24BE7B2E8](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x24BE7B2F0](this);
}

uint64_t PB::Data::operator==()
{
  return MEMORY[0x24BE7B2F8]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C809350(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C809358(__sz);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x24BDADEE8](queue, relative_priority_ptr);
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

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void pcap_close(pcap_t *a1)
{
  MEMORY[0x24BEDD530](a1);
}

int pcap_compile(pcap_t *a1, bpf_program *a2, const char *a3, int a4, bpf_u_int32 a5)
{
  return MEMORY[0x24BEDD538](a1, a2, a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

int pcap_datalink(pcap_t *a1)
{
  return MEMORY[0x24BEDD540](a1);
}

const char *__cdecl pcap_datalink_val_to_description(int a1)
{
  return (const char *)MEMORY[0x24BEDD548](*(_QWORD *)&a1);
}

int pcap_dispatch(pcap_t *a1, int a2, pcap_handler a3, u_char *a4)
{
  return MEMORY[0x24BEDD550](a1, *(_QWORD *)&a2, a3, a4);
}

void pcap_freecode(bpf_program *a1)
{
  MEMORY[0x24BEDD578](a1);
}

int pcap_get_selectable_fd(pcap_t *a1)
{
  return MEMORY[0x24BEDD580](a1);
}

char *__cdecl pcap_geterr(pcap_t *a1)
{
  return (char *)MEMORY[0x24BEDD588](a1);
}

int pcap_inject(pcap_t *a1, const void *a2, size_t a3)
{
  return MEMORY[0x24BEDD590](a1, a2, a3);
}

pcap_t *__cdecl pcap_open_live(const char *a1, int a2, int a3, int a4, char *a5)
{
  return (pcap_t *)MEMORY[0x24BEDD5A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

int pcap_set_snaplen(pcap_t *a1, int a2)
{
  return MEMORY[0x24BEDD5A8](a1, *(_QWORD *)&a2);
}

int pcap_setdirection(pcap_t *a1, pcap_direction_t a2)
{
  return MEMORY[0x24BEDD5B0](a1, *(_QWORD *)&a2);
}

int pcap_setfilter(pcap_t *a1, bpf_program *a2)
{
  return MEMORY[0x24BEDD5B8](a1, a2);
}

int pcap_setnonblock(pcap_t *a1, int a2, char *a3)
{
  return MEMORY[0x24BEDD5C0](a1, *(_QWORD *)&a2, a3);
}

int pcap_snapshot(pcap_t *a1)
{
  return MEMORY[0x24BEDD5C8](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

