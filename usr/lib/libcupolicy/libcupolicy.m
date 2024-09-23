uint64_t __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  return std::shared_ptr<CellularUsagePolicyClient>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZN25CellularUsagePolicyClient5startEv_block_invoke(uint64_t a1)
{
  CellularUsagePolicyClient::start_sync(*(CellularUsagePolicyClient **)(a1 + 32));
}

uint64_t __copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
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

uint64_t network_usage_policy_set_changed_handler(uint64_t *a1, NSObject *a2, void *a3)
{
  uint64_t v3;

  if (a1 && (v3 = *a1) != 0)
    return CellularUsagePolicyClient::setPolicyChangedHandler(v3, a2, a3);
  else
    return 22;
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5queueE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1)
{
  const void *v2;
  NSObject *v3;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    _Block_release(v2);
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
    dispatch_release(v3);
}

void ___ZN25CellularUsagePolicyClient27dispatchClientCallback_syncEN3xpc5arrayE_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v2 = (std::__shared_weak_count *)a1[5];
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      if (a1[4])
        (*(void (**)(void))(a1[6] + 16))();
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
  }
}

void sub_22E10C014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CellularUsagePolicyClient>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE56c16_ZTSN3xpc5arrayE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(_QWORD *)(a1 + 56) = 0;
  v2 = *(const void **)(a1 + 48);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

xpc_object_t __copy_helper_block_e8_32c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE56c16_ZTSN3xpc5arrayE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  xpc_object_t result;

  v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (const void *)a2[6];
  if (v7)
    v8 = _Block_copy(v7);
  else
    v8 = 0;
  v9 = (void *)a2[7];
  a1[6] = v8;
  a1[7] = v9;
  if (v9)
    return xpc_retain(v9);
  result = xpc_null_create();
  a1[7] = result;
  return result;
}

void *__copy_helper_block_e8_40c21_ZTSN8dispatch5queueE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *result;

  v4 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  if (v4)
    dispatch_retain(v4);
  result = *(void **)(a2 + 48);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void sub_22E10C3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, xpc_object_t a13, uint64_t a14, uint64_t a15, xpc_object_t object)
{
  void *v16;
  void *v17;
  uint64_t v18;

  xpc_release(v17);
  xpc_release(v16);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)(v18 - 48));
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v4;
  CFTypeID v5;

  v4 = *a2;
  if (*a2 && (v5 = CFGetTypeID(*a2), v5 == CFBooleanGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2)
      CFRelease(*a2);
  }
  return a1;
}

void CellularUsagePolicyClient::start_sync(CellularUsagePolicyClient *this)
{
  int v2;
  int *v3;
  NSObject *v4;
  _QWORD handler[5];

  v3 = (int *)((char *)this + 80);
  v2 = *((_DWORD *)this + 20);
  if (v2 != -1)
    notify_cancel(v2);
  v4 = *((_QWORD *)this + 3);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = ___ZN25CellularUsagePolicyClient10start_syncEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_28;
  handler[4] = this;
  notify_register_dispatch("com.apple.coretelephony.daemon_ready", v3, v4, handler);
  CellularUsagePolicyClient::connectAndCheckin_sync((dispatch_queue_t *)this);
}

void CellularUsagePolicyClient::connectAndCheckin_sync(dispatch_queue_t *this)
{
  xpc_connection_t mach_service;
  xpc_object_t v3;
  xpc_object_t object;

  mach_service = xpc_connection_create_mach_service("com.apple.commcenter.cupolicy.xpc", this[3], 2uLL);
  if (mach_service)
  {
    v3 = mach_service;
    object = mach_service;
LABEL_4:
    xpc_retain(v3);
    goto LABEL_5;
  }
  v3 = xpc_null_create();
  object = v3;
  if (v3)
    goto LABEL_4;
  v3 = 0;
  object = xpc_null_create();
LABEL_5:
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  if (MEMORY[0x22E3268EC](v3) == MEMORY[0x24BDACF88])
    CellularUsagePolicyClient::checkin_sync((xpc_connection_t *)this);
  xpc_release(v3);
}

void sub_22E10C680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::checkin_sync(xpc_connection_t *this)
{
  const char *v2;
  xpc_object_t *v3;
  xpc_object_t object[2];
  char v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t message;
  _BYTE buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  message = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kRegisterCUPolicyClient", object, (uint64_t)"kRequest", (void **)buf);
  xpc_release(object[0]);
  message = *(xpc_object_t *)buf;
  *(_QWORD *)buf = xpc_null_create();
  xpc_release(*(xpc_object_t *)buf);
  v2 = getprogname();
  if (v2)
  {
    v6 = xpc_string_create(v2);
    if (!v6)
      v6 = xpc_null_create();
    object[0] = &message;
    object[1] = "kProgName";
    xpc::dict::object_proxy::operator=((uint64_t)object, &v6, &v7);
    xpc_release(v7);
    v7 = 0;
    xpc_release(v6);
    v6 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string((xpc::object *)&message);
    if (v5 >= 0)
      v3 = object;
    else
      v3 = (xpc_object_t *)object[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Checking in with server: %s", buf, 0xCu);
    if (v5 < 0)
      operator delete(object[0]);
  }
  xpc_connection_send_message(this[5], message);
  xpc_release(message);
}

void sub_22E10C828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

xpc_object_t xpc::dict::object_proxy::operator=@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

void xpc::dict_creator::operator()<char const*>(char *string@<X2>, void **a2@<X0>, uint64_t a3@<X1>, void **a4@<X8>)
{
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  _QWORD v10[2];
  xpc_object_t v11;
  xpc_object_t object;

  v7 = xpc_string_create(string);
  v8 = v7;
  if (v7)
  {
    v11 = v7;
LABEL_4:
    xpc_retain(v8);
    goto LABEL_5;
  }
  v8 = xpc_null_create();
  v11 = v8;
  if (v8)
    goto LABEL_4;
  v8 = 0;
  v11 = xpc_null_create();
LABEL_5:
  v10[0] = a2;
  v10[1] = a3;
  xpc::dict::object_proxy::operator=((uint64_t)v10, &v11, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
  v11 = 0;
  v9 = *a2;
  *a4 = *a2;
  if (v9)
    xpc_retain(v9);
  else
    *a4 = xpc_null_create();
  xpc_release(v8);
}

xpc::dict_creator *xpc::dict_creator::dict_creator(xpc::dict_creator *this)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x22E3268EC](v2) == MEMORY[0x24BDACFA0])
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
  *(_QWORD *)this = v3;
  v4 = xpc_null_create();
  xpc_release(v4);
  return this;
}

uint64_t *network_usage_policy_create_client()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = (uint64_t *)operator new();
  CellularUsagePolicyClient::create(v0);
  if (*v0)
  {
    CellularUsagePolicyClient::start((CellularUsagePolicyClient *)*v0);
  }
  else
  {
    v1 = std::shared_ptr<CellularUsagePolicyClient>::~shared_ptr[abi:ne180100]((uint64_t)v0);
    MEMORY[0x22E326718](v1, 0x20C40A4A59CD2);
    return 0;
  }
  return v0;
}

void sub_22E10CAC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E326718](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

uint64_t *CellularUsagePolicyClient::create@<X0>(uint64_t *a1@<X8>)
{
  CellularUsagePolicyClient *v3;

  v3 = (CellularUsagePolicyClient *)operator new();
  CellularUsagePolicyClient::CellularUsagePolicyClient(v3);
  return std::shared_ptr<CellularUsagePolicyClient>::shared_ptr[abi:ne180100]<CellularUsagePolicyClient,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1},void>(a1, (uint64_t)v3);
}

void sub_22E10CB2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E326718](v1, 0x10B3C408A6EA412);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::CellularUsagePolicyClient(CellularUsagePolicyClient *this)
{
  void *__p;
  char v3;

  std::string::basic_string[abi:ne180100]<0>(&__p, "com.apple.cupolicy.client");
  ctu::XpcClient::XpcClient();
  if (v3 < 0)
    operator delete(__p);
  ctu::OsLogLogger::OsLogLogger((CellularUsagePolicyClient *)((char *)this + 72), "com.apple.telephony", "cupolicy");
  *(_QWORD *)this = &off_24F9EC098;
  *((_DWORD *)this + 20) = -1;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = (char *)this + 112;
  *((_BYTE *)this + 128) = 0;
}

void sub_22E10CBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  ctu::XpcClient *v15;

  ctu::XpcClient::~XpcClient(v15);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::start(CellularUsagePolicyClient *this)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = ___ZN25CellularUsagePolicyClient5startEv_block_invoke;
  v1[3] = &__block_descriptor_tmp;
  v1[4] = this;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)this + 1, (uint64_t)v1);
}

void CellularUsagePolicyClient::handleMessage_sync(uint64_t a1, xpc::object *a2)
{
  void **v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *__p[2];
  char v8;
  _BYTE buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string(a2);
    v4 = v8 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received msg from server: %s", buf, 0xCu);
    if (v8 < 0)
      operator delete(__p[0]);
  }
  if (xpc_dictionary_get_value(*(xpc_object_t *)a2, "kDataUsagePolicyNotification"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received new data usage policy list", (uint8_t *)__p, 2u);
    }
    *(_QWORD *)buf = 0;
    __p[0] = a2;
    __p[1] = "kDataUsagePolicies";
    xpc::dict::object_proxy::operator xpc::array((uint64_t)__p, buf);
    v5 = *(xpc_object_t *)buf;
    v6 = *(xpc_object_t *)buf;
    if (*(_QWORD *)buf)
    {
      xpc_retain(*(xpc_object_t *)buf);
    }
    else
    {
      v5 = xpc_null_create();
      v6 = v5;
    }
    CellularUsagePolicyClient::handleDataUsagePolicies_sync(a1, &v6);
    xpc_release(v5);
    v6 = 0;
    xpc_release(*(xpc_object_t *)buf);
  }
}

void sub_22E10CDF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void xpc::dict::object_proxy::operator xpc::array(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t v4;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
  if (value)
  {
    v4 = value;
    xpc_retain(value);
    *a2 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      v5 = xpc_null_create();
      v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x22E3268EC](v4) != MEMORY[0x24BDACF78])
  {
    v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

void CellularUsagePolicyClient::handleDataUsagePolicies_sync(uint64_t a1, xpc_object_t *a2)
{
  _QWORD *v4;
  uint64_t *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *count;
  xpc_object_t v9;
  void *v10;
  xpc_object_t v11[2];
  xpc_object_t v12[2];
  xpc_object_t object;

  v4 = (_QWORD *)(a1 + 112);
  v5 = (uint64_t *)(a1 + 104);
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1 + 104, *(xpc_object_t **)(a1 + 112));
  *(v4 - 1) = v4;
  *v4 = 0;
  v4[1] = 0;
  v6 = *a2;
  object = v6;
  if (v6)
    xpc_retain(v6);
  else
    object = xpc_null_create();
  xpc::array::iterator::iterator(v12, &object, 0);
  xpc_release(object);
  v7 = *a2;
  object = v7;
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  if (MEMORY[0x22E3268EC](*a2) == MEMORY[0x24BDACF78])
    count = (void *)xpc_array_get_count(*a2);
  else
    count = 0;
  xpc::array::iterator::iterator(v11, &object, count);
  xpc_release(object);
  std::copy[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v12, v11, (uint64_t)v5, *v5);
  xpc_release(v11[0]);
  v11[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  *(_BYTE *)(a1 + 128) = 1;
  v9 = *a2;
  v10 = v9;
  if (v9)
  {
    xpc_retain(v9);
  }
  else
  {
    v9 = xpc_null_create();
    v10 = v9;
  }
  CellularUsagePolicyClient::dispatchClientCallback_sync((_QWORD *)a1, &v10);
  xpc_release(v9);
}

void sub_22E10D02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;

  xpc_release(v14);
  _Unwind_Resume(a1);
}

void **xpc::array::iterator::iterator(void **a1, void **a2, void *a3)
{
  void *v5;

  v5 = *a2;
  *a1 = *a2;
  if (v5)
    xpc_retain(v5);
  else
    *a1 = xpc_null_create();
  a1[1] = a3;
  return a1;
}

void std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(uint64_t a1, xpc_object_t *a2)
{
  if (a2)
  {
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1, *a2);
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<xpc::dict,0>(a2 + 4);
    operator delete(a2);
  }
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__emplace_hint_unique_key_args<xpc::dict,xpc::dict>(uint64_t **a1, _QWORD *a2, void *a3, _QWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v6 = std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    memset(v10, 0, sizeof(v10));
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__construct_node<xpc::dict>((uint64_t)a1, a4, v10);
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__insert_node_at(a1, v12, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<xpc::dict,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<xpc::dict,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

xpc_object_t std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__construct_node<xpc::dict>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  xpc_object_t result;

  v5 = a1 + 8;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v6 = operator new(0x28uLL);
  *a3 = v6;
  a3[1] = v5;
  *((_BYTE *)a3 + 16) = 0;
  v6[4] = *a2;
  result = xpc_null_create();
  *a2 = result;
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t *a4, void *a5)
{
  _QWORD *v9;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  _QWORD *v18;

  v9 = a1 + 1;
  if (a1 + 1 == a2 || CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a5, a2 + 4))
  {
    if ((_QWORD *)*a1 == a2)
    {
      v12 = a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    v11 = (_QWORD *)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (_QWORD *)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (_QWORD *)v16[2];
        v17 = *v12 == (_QWORD)v16;
        v16 = v12;
      }
      while (v17);
    }
    if (CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), v12 + 4, a5))
      goto LABEL_16;
    return std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>((uint64_t)a1, a3, a5);
  }
  if (CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (_QWORD *)a2[1];
      do
      {
        v15 = v14;
        v14 = (_QWORD *)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = a2;
      do
      {
        v15 = (_QWORD *)v18[2];
        v17 = *v15 == (_QWORD)v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a5, v15 + 4))
        return std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = a2;
    }
    return a4;
  }
  *a3 = a2;
  *a4 = (uint64_t)a2;
  return a4;
}

void xpc::array::object_proxy::operator xpc::dict(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t v4;
  xpc_object_t v5;

  value = xpc_array_get_value(**(xpc_object_t **)a1, *(_QWORD *)(a1 + 8));
  if (value)
  {
    v4 = value;
    xpc_retain(value);
    *a2 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      v5 = xpc_null_create();
      v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x22E3268EC](v4) != MEMORY[0x24BDACFA0])
  {
    v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

void CellularUsagePolicyClient::dispatchClientCallback_sync(_QWORD *a1, void **a2)
{
  const void *v3;
  void *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  std::__shared_weak_count *v18;
  void *aBlock;
  xpc_object_t object;
  uint64_t v21;
  std::__shared_weak_count *v22;

  if (a1[11])
  {
    v3 = (const void *)a1[12];
    if (v3)
    {
      v5 = _Block_copy(v3);
      std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v21, a1 + 1);
      v7 = v21;
      v6 = v22;
      if (v22)
      {
        p_shared_weak_owners = (unint64_t *)&v22->__shared_weak_owners_;
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
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v12 = a1[11];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 1174405120;
      v17[2] = ___ZN25CellularUsagePolicyClient27dispatchClientCallback_syncEN3xpc5arrayE_block_invoke;
      v17[3] = &__block_descriptor_tmp_34;
      v17[4] = v7;
      v18 = v6;
      if (v6)
      {
        v13 = (unint64_t *)&v6->__shared_weak_owners_;
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      if (v5)
        v15 = _Block_copy(v5);
      else
        v15 = 0;
      v16 = *a2;
      aBlock = v15;
      object = v16;
      if (v16)
        xpc_retain(v16);
      else
        object = xpc_null_create();
      dispatch_async(v12, v17);
      xpc_release(object);
      object = 0;
      if (aBlock)
        _Block_release(aBlock);
      if (v18)
        std::__shared_weak_count::__release_weak(v18);
      if (v6)
        std::__shared_weak_count::__release_weak(v6);
      if (v5)
        _Block_release(v5);
    }
  }
}

void sub_22E10D634(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

uint64_t CellularUsagePolicyClient::setPolicyChangedHandler(uint64_t a1, dispatch_object_t object, void *a3)
{
  void *v6;
  _QWORD v8[5];
  dispatch_object_t objecta;
  void *aBlock;

  if (!object)
    return 22;
  dispatch_retain(object);
  if (a3)
    a3 = _Block_copy(a3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1174405120;
  v8[2] = ___ZN25CellularUsagePolicyClient23setPolicyChangedHandlerEP16dispatch_queue_sU13block_pointerFvPvE_block_invoke;
  v8[3] = &__block_descriptor_tmp_25;
  v8[4] = a1;
  objecta = object;
  dispatch_retain(object);
  if (a3)
    v6 = _Block_copy(a3);
  else
    v6 = 0;
  aBlock = v6;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)(a1 + 8), (uint64_t)v8);
  if (aBlock)
    _Block_release(aBlock);
  if (objecta)
    dispatch_release(objecta);
  if (a3)
    _Block_release(a3);
  dispatch_release(object);
  return 0;
}

CellularUsagePolicyClient **network_usage_policy_destroy_client(CellularUsagePolicyClient **result)
{
  uint64_t v1;

  if (result)
  {
    v1 = (uint64_t)result;
    CellularUsagePolicyClient::shutdown(*result);
    std::shared_ptr<CellularUsagePolicyClient>::~shared_ptr[abi:ne180100](v1);
    JUMPOUT(0x22E326718);
  }
  return result;
}

uint64_t network_usage_policy_get_datausage_policies(uint64_t *a1, void *a2)
{
  uint64_t v2;

  if (a1 && (v2 = *a1) != 0)
    return CellularUsagePolicyClient::getDataUsagePolicies(v2, a2);
  else
    return 22;
}

uint64_t network_usage_policy_get_for_bundle(uint64_t *a1, char *a2, const void *a3)
{
  uint64_t v3;

  if (a1 && a2 && (v3 = *a1) != 0)
    return CellularUsagePolicyClient::getDataUsagePolicy(v3, a2, a3);
  else
    return 22;
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy(xpc_object_t object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  _QWORD v6[2];
  xpc_object_t objecta;
  xpc_object_t v8;

  v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    v8 = (xpc_object_t)v1;
    v2 = MEMORY[0x22E3268EC](v1);
    v3 = MEMORY[0x24BDACFA0];
    if (v2 == MEMORY[0x24BDACFA0])
    {
      xpc_retain((xpc_object_t)v1);
      v4 = (xpc_object_t)v1;
    }
    else
    {
      v4 = xpc_null_create();
      v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x22E3268EC](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyDataAllowed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      v4 = v8;
    }
    else
    {
      v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_22E10D89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
  xpc_release(object);
  xpc_release(a12);
  _Unwind_Resume(a1);
}

xpc_object_t xpc::dict::object_proxy::operator xpc::object@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
  *a2 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t network_usage_policy_get_WiFi_data_allowed_from_policy(xpc_object_t object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  _QWORD v6[2];
  xpc_object_t objecta;
  xpc_object_t v8;

  v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    v8 = (xpc_object_t)v1;
    v2 = MEMORY[0x22E3268EC](v1);
    v3 = MEMORY[0x24BDACFA0];
    if (v2 == MEMORY[0x24BDACFA0])
    {
      xpc_retain((xpc_object_t)v1);
      v4 = (xpc_object_t)v1;
    }
    else
    {
      v4 = xpc_null_create();
      v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x22E3268EC](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyWiFiAllowed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      v4 = v8;
    }
    else
    {
      v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_22E10DA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
  xpc_release(object);
  xpc_release(a12);
  _Unwind_Resume(a1);
}

uint64_t network_usage_policy_get_first_use_flow_performed_from_policy(xpc_object_t object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  _QWORD v6[2];
  xpc_object_t objecta;
  xpc_object_t v8;

  v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    v8 = (xpc_object_t)v1;
    v2 = MEMORY[0x22E3268EC](v1);
    v3 = MEMORY[0x24BDACFA0];
    if (v2 == MEMORY[0x24BDACFA0])
    {
      xpc_retain((xpc_object_t)v1);
      v4 = (xpc_object_t)v1;
    }
    else
    {
      v4 = xpc_null_create();
      v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x22E3268EC](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyFirstNetworkUseFlowPerformed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      v4 = v8;
    }
    else
    {
      v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_22E10DB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
  xpc_release(object);
  xpc_release(a12);
  _Unwind_Resume(a1);
}

char *network_usage_policy_get_bundle_from_policy(char *object)
{
  char *string_ptr;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v6[2];
  xpc_object_t xstring;
  char *v8;

  string_ptr = object;
  if (object)
  {
    xpc_retain(object);
    v8 = string_ptr;
    v2 = MEMORY[0x22E3268EC](string_ptr);
    v3 = MEMORY[0x24BDACFA0];
    if (v2 == MEMORY[0x24BDACFA0])
    {
      xpc_retain(string_ptr);
      v4 = string_ptr;
    }
    else
    {
      v4 = (char *)xpc_null_create();
      v8 = v4;
    }
    xpc_release(string_ptr);
    if (MEMORY[0x22E3268EC](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyBundleID";
      xstring = 0;
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &xstring);
      if (MEMORY[0x22E3268EC](xstring) != MEMORY[0x24BDACFE0] && MEMORY[0x22E3268EC](xstring) == MEMORY[0x24BDACFF0])
        string_ptr = (char *)xpc_string_get_string_ptr(xstring);
      else
        string_ptr = 0;
      xpc_release(xstring);
      v4 = v8;
    }
    else
    {
      string_ptr = 0;
    }
    xpc_release(v4);
  }
  return string_ptr;
}

void sub_22E10DC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t perform_first_network_use_flow(uint64_t *a1, char *a2, char a3, const void *a4)
{
  uint64_t v4;

  if (a1 && a2 && (v4 = *a1) != 0)
    return CellularUsagePolicyClient::performFirstNetworkUseFlow(v4, a2, a3, a4);
  else
    return 22;
}

uint64_t std::shared_ptr<CellularUsagePolicyClient>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void CellularUsagePolicyClient::shutdown(CellularUsagePolicyClient *this)
{
  NSObject *v1;
  char *v2;
  _QWORD v3[5];
  _QWORD *v4;
  _QWORD block[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZN25CellularUsagePolicyClient8shutdownEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_3;
  v3[4] = this;
  v4 = v3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_38;
  block[4] = (char *)this + 8;
  block[5] = &v4;
  v2 = (char *)this + 24;
  v1 = *((_QWORD *)this + 3);
  if (*((_QWORD *)v2 + 1))
    dispatch_async_and_wait(v1, block);
  else
    dispatch_sync(v1, block);
}

void ___ZN25CellularUsagePolicyClient8shutdownEv_block_invoke(uint64_t a1)
{
  CellularUsagePolicyClient::shutdown_sync(*(xpc_connection_t **)(a1 + 32));
}

void CellularUsagePolicyClient::shutdown_sync(xpc_connection_t *this)
{
  int v2;
  xpc_connection_t v3;
  NSObject *v4;
  xpc_object_t object;

  CellularUsagePolicyClient::checkout_sync(this);
  v2 = *((_DWORD *)this + 20);
  if (v2 != -1)
    notify_cancel(v2);
  v3 = this[12];
  this[12] = 0;
  if (v3)
    _Block_release(v3);
  v4 = this[11];
  this[11] = 0;
  if (v4)
    dispatch_release(v4);
  object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
}

void sub_22E10DE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t CellularUsagePolicyClient::performFirstNetworkUseFlow(uint64_t a1, char *a2, char a3, const void *a4)
{
  uint64_t result;
  void *v8;
  void *v9;
  _QWORD v10[5];
  std::string __p;
  void *aBlock;
  char v13;
  std::string v14;

  result = 22;
  if (!a2 || !a4)
    return result;
  memset(&v14, 0, sizeof(v14));
  std::string::basic_string[abi:ne180100]<0>(&v14, a2);
  v8 = _Block_copy(a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke;
  v10[3] = &__block_descriptor_tmp_13;
  v10[4] = a1;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  else
    __p = v14;
  v13 = a3;
  if (v8)
    v9 = _Block_copy(v8);
  else
    v9 = 0;
  aBlock = v9;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)(a1 + 8), (uint64_t)v10);
  if (aBlock)
    _Block_release(aBlock);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!v8)
      goto LABEL_16;
    goto LABEL_15;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (v8)
LABEL_15:
    _Block_release(v8);
LABEL_16:
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return 0;
}

void sub_22E10DF98(_Unwind_Exception *exception_object)
{
  const void *v1;
  uint64_t v2;

  if (v1)
    _Block_release(v1);
  if (*(char *)(v2 - 33) < 0)
    operator delete(*(void **)(v2 - 56));
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  NSObject *v6;
  void *v7;
  _QWORD handler[4];
  void *aBlock;
  xpc_object_t v10;
  xpc_object_t object;
  uint8_t buf[8];
  const char *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Performing first network use flow", buf, 2u);
  }
  v17 = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)buf);
  xpc::dict_creator::operator()<char const*>("kCUPerformFirstNetworkUseFlow", (void **)buf, (uint64_t)"kRequest", &v16);
  xpc_release(*(xpc_object_t *)buf);
  v17 = v16;
  v16 = xpc_null_create();
  xpc_release(v16);
  v3 = (const char *)(a1 + 40);
  if (*(char *)(a1 + 63) < 0)
    v3 = *(const char **)v3;
  v14 = xpc_string_create(v3);
  if (!v14)
    v14 = xpc_null_create();
  *(_QWORD *)buf = &v17;
  v13 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v14, &v15);
  xpc_release(v15);
  v15 = 0;
  xpc_release(v14);
  v14 = 0;
  v10 = xpc_BOOL_create(*(_BYTE *)(a1 + 72));
  if (!v10)
    v10 = xpc_null_create();
  *(_QWORD *)buf = &v17;
  v13 = "kCUIgnoreFGApp";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v10, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v10);
  v10 = 0;
  v4 = *(_xpc_connection_s **)(v2 + 40);
  v5 = v17;
  v6 = *(NSObject **)(v2 + 24);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_8;
  handler[3] = &__block_descriptor_tmp_12;
  v7 = *(void **)(a1 + 64);
  if (v7)
    v7 = _Block_copy(v7);
  aBlock = v7;
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v17);
}

void sub_22E10E1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  uint64_t v14;

  if (aBlock)
    _Block_release(aBlock);
  xpc_release(*(xpc_object_t *)(v14 - 40));
  _Unwind_Resume(a1);
}

void ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_8(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v3;
  xpc_object_t v4;
  char v5;
  NSObject *global_queue;
  void *v7;
  _QWORD v8[4];
  void *aBlock;
  char v10;
  _QWORD v11[2];
  xpc_object_t v12;
  xpc_object_t v13;

  if (object)
  {
    v3 = object;
    xpc_retain(object);
    v13 = v3;
  }
  else
  {
    v3 = xpc_null_create();
    v13 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x22E3268EC](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  v13 = v4;
LABEL_9:
  xpc_release(v3);
  v11[0] = &v13;
  v11[1] = "kCUFirstNetworkUseFlowPeformedResult";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v11, &v12);
  v5 = xpc::dyn_cast_or_default();
  xpc_release(v12);
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1174405120;
  v8[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_2;
  v8[3] = &__block_descriptor_tmp_10;
  v7 = *(void **)(a1 + 32);
  if (v7)
    v7 = _Block_copy(v7);
  aBlock = v7;
  v10 = v5;
  dispatch_async(global_queue, v8);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v13);
}

void sub_22E10E34C(_Unwind_Exception *a1)
{
  uint64_t v1;

  xpc_release(*(xpc_object_t *)(v1 - 48));
  xpc_release(*(xpc_object_t *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void *__copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
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

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 64);
  if (v2)
    _Block_release(v2);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t CellularUsagePolicyClient::getDataUsagePolicies(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;
  void *v5;
  _QWORD v7[5];
  void *aBlocka;

  if (!aBlock)
    return 22;
  v3 = _Block_copy(aBlock);
  v4 = v3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1174405120;
  v7[2] = ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke;
  v7[3] = &__block_descriptor_tmp_16;
  v7[4] = a1;
  if (v3)
    v5 = _Block_copy(v3);
  else
    v5 = 0;
  aBlocka = v5;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)(a1 + 8), (uint64_t)v7);
  if (aBlocka)
    _Block_release(aBlocka);
  if (v4)
    _Block_release(v4);
  return 0;
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  void *v1;
  void (*v2)(_QWORD, _QWORD);
  void (*v3[5])(_QWORD, _QWORD);
  void *aBlock;

  v3[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x24BDAC760];
  v3[1] = (void (*)(_QWORD, _QWORD))1174405120;
  v3[2] = (void (*)(_QWORD, _QWORD))___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2;
  v3[3] = (void (*)(_QWORD, _QWORD))&__block_descriptor_tmp_15;
  v2 = *(void (**)(_QWORD, _QWORD))(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[4] = v2;
  if (v1)
    v1 = _Block_copy(v1);
  aBlock = v1;
  CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync((uint64_t)v2, v3);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_22E10E5CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync(uint64_t a1, void (**aBlock)(_QWORD, _QWORD))
{
  void *v4;
  void **v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  _QWORD v9[6];
  xpc_object_t v10;
  xpc_object_t v11;

  if (*(_BYTE *)(a1 + 128))
  {
    aBlock[2](aBlock, 1);
  }
  else
  {
    if (aBlock)
      v4 = _Block_copy(aBlock);
    else
      v4 = 0;
    v5 = (void **)xpc::dict_creator::dict_creator((xpc::dict_creator *)&v11);
    xpc::dict_creator::operator()<char const*>("kCUGetNetworkAccessPolicies", v5, (uint64_t)"kRequest", &v10);
    xpc_release(v11);
    v6 = v10;
    v10 = xpc_null_create();
    xpc_release(v10);
    v7 = *(_xpc_connection_s **)(a1 + 40);
    v8 = *(NSObject **)(a1 + 24);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZN25CellularUsagePolicyClient35fetchDataUsagePoliciesIfNeeded_syncEU13block_pointerFvbE_block_invoke;
    v9[3] = &unk_24F9EC278;
    v9[4] = aBlock;
    v9[5] = a1;
    xpc_connection_send_message_with_reply(v7, v6, v8, v9);
    xpc_release(v6);
    if (v4)
      _Block_release(v4);
  }
}

void sub_22E10E6F4(_Unwind_Exception *a1)
{
  const void *v1;
  void *v2;

  xpc_release(v2);
  if (v1)
    _Block_release(v1);
  _Unwind_Resume(a1);
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2(uint64_t a1, char a2)
{
  const void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(const void **)(a1 + 40);
    if (v3)
      v5 = _Block_copy(v3);
    else
      v5 = 0;
    v14 = v5;
    CellularUsagePolicyClient::getDataUsagePolicies_sync(v4, &v14);
    if (v5)
      _Block_release(v5);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    xpc_null_create();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void sub_22E10E7C0(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void CellularUsagePolicyClient::getDataUsagePolicies_sync(uint64_t a1, const void **a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  NSObject *global_queue;
  void *v9;
  _QWORD v10[4];
  void *aBlock;
  xpc_object_t v12;
  xpc_object_t object;
  char v14;

  object = xpc_null_create();
  if (*(_QWORD *)(a1 + 120))
  {
    v4 = xpc_array_create(0, 0);
    if (v4 || (v4 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x22E3268EC](v4) == MEMORY[0x24BDACF78])
      {
        xpc_retain(v4);
        v5 = v4;
      }
      else
      {
        v5 = xpc_null_create();
      }
    }
    else
    {
      v5 = xpc_null_create();
      v4 = 0;
    }
    xpc_release(v4);
    v6 = xpc_null_create();
    v7 = object;
    object = v5;
    xpc_release(v7);
    xpc_release(v6);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::back_insert_iterator<xpc::array>>((uint64_t)&v14, *(_QWORD **)(a1 + 104), (_QWORD *)(a1 + 112), &object);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZN25CellularUsagePolicyClient25getDataUsagePolicies_syncEN8dispatch5blockIU13block_pointerFvPvEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_20;
  if (*a2)
    v9 = _Block_copy(*a2);
  else
    v9 = 0;
  aBlock = v9;
  v12 = object;
  if (object)
    xpc_retain(object);
  else
    v12 = xpc_null_create();
  dispatch_async(global_queue, v10);
  xpc_release(v12);
  v12 = 0;
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(object);
}

void sub_22E10E95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN25CellularUsagePolicyClient35fetchDataUsagePoliciesIfNeeded_syncEU13block_pointerFvbE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void **v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *__p[2];
  char v11;
  xpc_object_t objecta;
  _BYTE buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  objecta = 0;
  v4 = MEMORY[0x24BDACFA0];
  if (object)
  {
    v5 = object;
    xpc_retain(object);
    objecta = v5;
  }
  else
  {
    v5 = xpc_null_create();
    objecta = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x22E3268EC](v5) == v4)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  objecta = v6;
LABEL_9:
  xpc_release(v5);
  if (MEMORY[0x22E3268EC](objecta) == v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      xpc::object::to_string((xpc::object *)&objecta);
      v7 = v11 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Initial network access policies msg received from server: %s", buf, 0xCu);
      if (v11 < 0)
        operator delete(__p[0]);
    }
    *(_QWORD *)buf = 0;
    __p[0] = &objecta;
    __p[1] = "kDataUsagePolicies";
    xpc::dict::object_proxy::operator xpc::array((uint64_t)__p, buf);
    if (MEMORY[0x22E3268EC](*(_QWORD *)buf) == MEMORY[0x24BDACF78])
    {
      v8 = *(xpc_object_t *)buf;
      v9 = *(xpc_object_t *)buf;
      if (*(_QWORD *)buf)
      {
        xpc_retain(*(xpc_object_t *)buf);
      }
      else
      {
        v8 = xpc_null_create();
        v9 = v8;
      }
      CellularUsagePolicyClient::handleDataUsagePolicies_sync(v3, &v9);
      xpc_release(v8);
      v9 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    xpc_release(*(xpc_object_t *)buf);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  xpc_release(objecta);
}

void sub_22E10EBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14, xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t ___ZN25CellularUsagePolicyClient25getDataUsagePolicies_syncEN8dispatch5blockIU13block_pointerFvPvEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

xpc_object_t __copy_helper_block_e8_32c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE40c16_ZTSN3xpc5arrayE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  void *v6;
  xpc_object_t result;

  v4 = *(const void **)(a2 + 32);
  if (v4)
    v5 = _Block_copy(v4);
  else
    v5 = 0;
  v6 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  if (v6)
    return xpc_retain(v6);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE40c16_ZTSN3xpc5arrayE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void CellularUsagePolicyClient::getDataUsagePolicy_sync(uint64_t a1, void **a2, unsigned __int8 **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  size_t v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  uint64_t v11;
  void *v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  NSObject *global_queue;
  void *v25;
  _QWORD block[4];
  void *aBlock;
  xpc_object_t v28;
  _QWORD v29[2];
  xpc_object_t object;
  void *__p;
  size_t __n;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = *(_QWORD **)(a1 + 104);
  v5 = (_QWORD *)(a1 + 112);
  if (v4 != (_QWORD *)(a1 + 112))
  {
    while (1)
    {
      if (xpc_dictionary_get_value((xpc_object_t)v4[4], "kCUPolicyKeyBundleID"))
      {
        __p = 0;
        __n = 0;
        v33 = 0;
        v29[0] = v4 + 4;
        v29[1] = "kCUPolicyKeyBundleID";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)v29, &object);
        v34 = 0;
        v35 = 0;
        v36 = 0;
        xpc::dyn_cast_or_default();
        if (SHIBYTE(v36) < 0)
          operator delete(v34);
        xpc_release(object);
        if (v33 >= 0)
          v7 = HIBYTE(v33);
        else
          v7 = __n;
        v8 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
        v9 = (char)v8;
        if ((char)v8 < 0)
          v8 = a3[1];
        if ((unsigned __int8 *)v7 == v8)
        {
          if (v9 >= 0)
            v10 = (unsigned __int8 *)a3;
          else
            v10 = *a3;
          if (v33 < 0)
          {
            v12 = __p;
            v13 = memcmp(__p, v10, __n);
            operator delete(v12);
            if (!v13)
              break;
            goto LABEL_23;
          }
          if (!HIBYTE(v33))
            break;
          v11 = 0;
          while (*((unsigned __int8 *)&__p + v11) == v10[v11])
          {
            if (HIBYTE(v33) == ++v11)
              goto LABEL_30;
          }
        }
        if (v33 < 0)
          operator delete(__p);
      }
LABEL_23:
      v14 = (_QWORD *)v4[1];
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (_QWORD *)v4[2];
          v16 = *v15 == (_QWORD)v4;
          v4 = v15;
        }
        while (!v16);
      }
      v4 = v15;
      if (v15 == v5)
      {
        v4 = v5;
        break;
      }
    }
  }
LABEL_30:
  v17 = xpc_null_create();
  v18 = v17;
  if (v4 == v5)
  {
    v21 = v17;
  }
  else
  {
    v19 = xpc_copy((xpc_object_t)v4[4]);
    if (v19 || (v19 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x22E3268EC](v19) == MEMORY[0x24BDACFA0])
      {
        xpc_retain(v19);
        v20 = v19;
      }
      else
      {
        v20 = xpc_null_create();
      }
    }
    else
    {
      v20 = xpc_null_create();
      v19 = 0;
    }
    xpc_release(v19);
    v22 = xpc_array_create(0, 0);
    if (v22 || (v22 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x22E3268EC](v22) == MEMORY[0x24BDACF78])
      {
        xpc_retain(v22);
        v21 = v22;
      }
      else
      {
        v21 = xpc_null_create();
      }
    }
    else
    {
      v21 = xpc_null_create();
      v22 = 0;
    }
    xpc_release(v22);
    v23 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v23);
    xpc_array_append_value(v21, v20);
    xpc_release(v20);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK25CellularUsagePolicyClient23getDataUsagePolicy_syncEN8dispatch5blockIU13block_pointerFvPvEEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  v25 = *a2;
  if (*a2)
    v25 = _Block_copy(v25);
  aBlock = v25;
  v28 = v21;
  if (v21)
    xpc_retain(v21);
  else
    v28 = xpc_null_create();
  dispatch_async(global_queue, block);
  xpc_release(v28);
  v28 = 0;
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v21);
}

void sub_22E10F050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, xpc_object_t object)
{
  void *v18;
  void *v19;

  xpc_release(v19);
  xpc_release(v18);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK25CellularUsagePolicyClient23getDataUsagePolicy_syncEN8dispatch5blockIU13block_pointerFvPvEEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t CellularUsagePolicyClient::getDataUsagePolicy(uint64_t a1, char *a2, const void *a3)
{
  uint64_t result;
  void *v6;
  const void *v7;
  void *v8;
  _QWORD v9[5];
  void *aBlock;
  std::string __p;
  std::string v12;

  result = 22;
  if (a2 && a3)
  {
    memset(&v12, 0, sizeof(v12));
    std::string::basic_string[abi:ne180100]<0>(&v12, a2);
    v6 = _Block_copy(a3);
    v7 = v6;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 1174405120;
    v9[2] = ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke;
    v9[3] = &__block_descriptor_tmp_23;
    v9[4] = a1;
    if (v6)
      v8 = _Block_copy(v6);
    else
      v8 = 0;
    aBlock = v8;
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
    else
      __p = v12;
    ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)(a1 + 8), (uint64_t)v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (aBlock)
      _Block_release(aBlock);
    if (v7)
      _Block_release(v7);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v12.__r_.__value_.__l.__data_);
    return 0;
  }
  return result;
}

void sub_22E10F1F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  const void *v14;
  uint64_t v15;

  if (aBlock)
    _Block_release(aBlock);
  if (v14)
    _Block_release(v14);
  if (*(char *)(v15 - 17) < 0)
    operator delete(*(void **)(v15 - 40));
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(_QWORD, _QWORD);
  void (*v4[5])(_QWORD, _QWORD);
  void *aBlock;
  std::string __p;

  v4[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x24BDAC760];
  v4[1] = (void (*)(_QWORD, _QWORD))1174405120;
  v4[2] = (void (*)(_QWORD, _QWORD))___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke_2;
  v4[3] = (void (*)(_QWORD, _QWORD))&__block_descriptor_tmp_22;
  v3 = *(void (**)(_QWORD, _QWORD))(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[4] = v3;
  if (v2)
    v2 = _Block_copy(v2);
  aBlock = v2;
  if (*(char *)(a1 + 71) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    __p = *(std::string *)(a1 + 48);
  CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync((uint64_t)v3, v4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_22E10F2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *aBlock, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke_2(uint64_t a1, char a2)
{
  const void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if ((a2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(const void **)(a1 + 40);
    if (v3)
      v5 = _Block_copy(v3);
    else
      v5 = 0;
    v14 = v5;
    CellularUsagePolicyClient::getDataUsagePolicy_sync(v4, &v14, (unsigned __int8 **)(a1 + 48));
    if (v5)
      _Block_release(v5);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    xpc_null_create();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void sub_22E10F3D8(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  void *v4;
  std::string *v5;
  __int128 v6;

  v4 = *(void **)(a2 + 40);
  if (v4)
    v4 = _Block_copy(v4);
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_22E10F450(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 40);
  if (v3)
    _Block_release(v3);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  const void *v2;

  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    _Block_release(v2);
}

xpc_object_t std::copy[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>>(void **a1, void **a2, xpc_object_t *a3)
{
  void *v6;
  void *v7;
  xpc_object_t v8;
  xpc_object_t v10[2];
  xpc_object_t v11[2];
  xpc_object_t object[3];

  v6 = *a1;
  v11[0] = v6;
  if (v6)
    xpc_retain(v6);
  else
    v11[0] = xpc_null_create();
  v11[1] = a1[1];
  v7 = *a2;
  v10[0] = v7;
  if (v7)
    xpc_retain(v7);
  else
    v10[0] = xpc_null_create();
  v10[1] = a2[1];
  std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v11, v10, a3, object);
  v8 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10[0]);
  v10[0] = 0;
  xpc_release(v11[0]);
  return v8;
}

void sub_22E10F570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12)
{
  xpc_release(object);
  xpc_release(a12);
  _Unwind_Resume(a1);
}

void ___ZN25CellularUsagePolicyClient10start_syncEv_block_invoke(uint64_t a1)
{
  CellularUsagePolicyClient::connectAndCheckin_sync(*(dispatch_queue_t **)(a1 + 32));
}

void CellularUsagePolicyClient::checkout_sync(xpc_connection_t *this)
{
  void *v2;
  xpc_object_t *v3;
  xpc_object_t object[2];
  char v5;
  void *v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kUnregisterCUPolicyClient", object, (uint64_t)"kRequest", (void **)buf);
  xpc_release(object[0]);
  v2 = *(void **)buf;
  v6 = *(void **)buf;
  *(_QWORD *)buf = xpc_null_create();
  xpc_release(*(xpc_object_t *)buf);
  xpc_connection_send_message(this[5], v2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string((xpc::object *)&v6);
    if (v5 >= 0)
      v3 = object;
    else
      v3 = (xpc_object_t *)object[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Checking out with server: %s", buf, 0xCu);
    if (v5 < 0)
      operator delete(object[0]);
    v2 = v6;
  }
  xpc_release(v2);
}

void sub_22E10F6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::handleServerError_sync(uint64_t a1, _QWORD *a2)
{
  uint8_t v2[16];

  if (*a2 == MEMORY[0x24BDACF30] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22E10B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection interrupted", v2, 2u);
  }
}

xpc_object_t std::copy[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(void **a1, void **a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v12[2];
  xpc_object_t v13[2];
  xpc_object_t object[3];

  v8 = *a1;
  v13[0] = v8;
  if (v8)
    xpc_retain(v8);
  else
    v13[0] = xpc_null_create();
  v13[1] = a1[1];
  v9 = *a2;
  v12[0] = v9;
  if (v9)
    xpc_retain(v9);
  else
    v12[0] = xpc_null_create();
  v12[1] = a2[1];
  std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v13, v12, a3, a4, (uint64_t)object);
  v10 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  xpc_release(v13[0]);
  return v10;
}

void sub_22E10F850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::~CellularUsagePolicyClient(xpc_object_t **this)
{
  xpc_object_t *v2;
  NSObject *v3;

  *this = (xpc_object_t *)&off_24F9EC098;
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy((uint64_t)(this + 13), this[14]);
  v2 = this[12];
  if (v2)
    _Block_release(v2);
  v3 = this[11];
  if (v3)
    dispatch_release(v3);
  MEMORY[0x22E326670](this + 9);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)this);
}

{
  xpc_object_t *v2;
  NSObject *v3;

  *this = (xpc_object_t *)&off_24F9EC098;
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy((uint64_t)(this + 13), this[14]);
  v2 = this[12];
  if (v2)
    _Block_release(v2);
  v3 = this[11];
  if (v3)
    dispatch_release(v3);
  MEMORY[0x22E326670](this + 9);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)this);
  JUMPOUT(0x22E326718);
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
  __cxa_throw(exception, (struct type_info *)off_24F9EBE48, MEMORY[0x24BEDAAF0]);
}

void sub_22E10FA44(_Unwind_Exception *a1)
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

_QWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::back_insert_iterator<xpc::array>>(uint64_t a1, _QWORD *a2, _QWORD *a3, xpc_object_t *a4)
{
  _QWORD *v5;
  xpc_object_t v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = (xpc_object_t)v5[4];
      if (v7)
        xpc_retain((xpc_object_t)v5[4]);
      else
        v7 = xpc_null_create();
      xpc_array_append_value(*a4, v7);
      xpc_release(v7);
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
    }
    while (v9 != a3);
    return a3;
  }
  return v5;
}

void sub_22E10FBB0(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

void std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v9[2];

  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_22E10FC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v9[2];

  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_22E10FD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11[2];
  xpc_object_t v12[2];
  _QWORD v13[2];
  xpc_object_t object[2];
  xpc_object_t v15[2];
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  xpc_object_t v19[2];
  xpc_object_t v20[2];
  __int128 v21;
  __int128 v22;

  v21 = 0u;
  v22 = 0u;
  v8 = *a1;
  v20[0] = v8;
  if (v8)
    xpc_retain(v8);
  else
    v20[0] = xpc_null_create();
  v20[1] = a1[1];
  v19[0] = *a2;
  *a2 = xpc_null_create();
  v19[1] = a2[1];
  std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(v20, v19, (xpc_object_t *)&v21);
  xpc_release(v19[0]);
  v19[0] = 0;
  xpc_release(v20[0]);
  v20[0] = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v15[0] = (xpc_object_t)v21;
  *(_QWORD *)&v21 = xpc_null_create();
  v15[1] = *((xpc_object_t *)&v21 + 1);
  object[0] = (xpc_object_t)v22;
  *(_QWORD *)&v22 = xpc_null_create();
  object[1] = *((xpc_object_t *)&v22 + 1);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>((uint64_t)v15, object, a3, &v16);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v15[0]);
  v15[0] = 0;
  v12[0] = *a1;
  *a1 = xpc_null_create();
  v12[1] = a1[1];
  v11[0] = v16;
  v16 = xpc_null_create();
  v11[1] = v17;
  std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(v12, v11, v13);
  v9 = v18;
  *a4 = v13[0];
  v10 = xpc_null_create();
  v13[0] = v10;
  a4[1] = v13[1];
  a4[2] = v9;
  xpc_release(v10);
  v13[0] = 0;
  xpc_release(v11[0]);
  v11[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  xpc_release(v16);
  xpc_release((xpc_object_t)v22);
  *(_QWORD *)&v22 = 0;
  xpc_release((xpc_object_t)v21);
}

void sub_22E10FF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t a16, uint64_t a17, xpc_object_t a18, uint64_t a19, xpc_object_t a20)
{
  uint64_t v20;

  xpc_release(object);
  xpc_release(a12);
  xpc_release(a20);
  std::pair<xpc::array::iterator,xpc::array::iterator>::~pair((xpc_object_t *)(v20 - 64));
  _Unwind_Resume(a1);
}

void std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v7[2];

  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__unwrap[abi:ne180100]((uint64_t)v7, (uint64_t)object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

xpc_object_t *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, xpc_object_t *a3@<X3>, xpc_object_t *a4@<X8>)
{
  uint64_t i;
  _QWORD v10[2];
  xpc_object_t value;
  xpc_object_t *v12;

  v12 = a3;
  for (i = *(_QWORD *)(a1 + 8); i != a2[1] || *(_QWORD *)a1 != *a2; *(_QWORD *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    xpc::array::object_proxy::operator xpc::object((uint64_t)v10, &value);
    xpc_array_append_value(*a3, value);
    xpc_release(value);
    i = *(_QWORD *)(a1 + 8) + 1;
  }
  return std::pair<xpc::array::iterator,std::back_insert_iterator<xpc::array>>::pair[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(a4, (xpc_object_t *)a1, (xpc_object_t *)&v12);
}

void sub_22E110110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v7[2];

  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__rewrap[abi:ne180100](v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

xpc_object_t *std::pair<xpc::array::iterator,xpc::array::iterator>::~pair(xpc_object_t *a1)
{
  xpc_release(a1[2]);
  a1[2] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

void std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__unwrap[abi:ne180100](uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  void *v6;
  void *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t object[2];
  xpc_object_t v15[2];

  v6 = *(void **)a1;
  *(_QWORD *)a1 = xpc_null_create();
  v7 = *(void **)(a1 + 8);
  if (v6)
  {
    xpc_retain(v6);
    v8 = v6;
  }
  else
  {
    v8 = xpc_null_create();
  }
  v15[0] = v8;
  v9 = xpc_null_create();
  v15[1] = v7;
  xpc_release(v9);
  v10 = *(void **)a2;
  *(_QWORD *)a2 = xpc_null_create();
  v11 = *(void **)(a2 + 8);
  if (v10)
  {
    xpc_retain(v10);
    v12 = v10;
  }
  else
  {
    v12 = xpc_null_create();
  }
  object[0] = v12;
  v13 = xpc_null_create();
  object[1] = v11;
  xpc_release(v13);
  std::pair<xpc::array::iterator,xpc::array::iterator>::pair[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,0>(a3, v15, object);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10);
  xpc_release(v15[0]);
  v15[0] = 0;
  xpc_release(v6);
}

xpc_object_t *std::pair<xpc::array::iterator,xpc::array::iterator>::pair[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,0>(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  xpc_object_t v6;

  *a1 = *a2;
  *a2 = xpc_null_create();
  v6 = *a3;
  a1[1] = a2[1];
  a1[2] = v6;
  *a3 = xpc_null_create();
  a1[3] = a3[1];
  return a1;
}

xpc_object_t xpc::array::object_proxy::operator xpc::object@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_array_get_value(**(xpc_object_t **)a1, *(_QWORD *)(a1 + 8));
  *a2 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc_object_t *std::pair<xpc::array::iterator,std::back_insert_iterator<xpc::array>>::pair[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  *a1 = *a2;
  *a2 = xpc_null_create();
  a1[1] = a2[1];
  a1[2] = *a3;
  return a1;
}

void std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__rewrap[abi:ne180100](xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v7[2];

  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__rewrap_iter[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::__unwrap_iter_impl<xpc::array::iterator,false>>(v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

void std::__rewrap_iter[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::__unwrap_iter_impl<xpc::array::iterator,false>>(void **a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;

  v5 = *a1;
  *a1 = xpc_null_create();
  v6 = *a2;
  *a2 = xpc_null_create();
  v7 = a2[1];
  *a3 = v6;
  v8 = xpc_null_create();
  a3[1] = v7;
  xpc_release(v8);
  xpc_release(v5);
}

void std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v11[2];

  v11[0] = *a1;
  *a1 = xpc_null_create();
  v11[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v11, object, a3, a4, a5);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v11[0]);
}

void sub_22E1105BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v11[2];

  v11[0] = *a1;
  *a1 = xpc_null_create();
  v11[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(v11, object, a3, a4, a5);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v11[0]);
}

void sub_22E110694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  xpc_object_t v10;
  __int128 v11;
  xpc_object_t v12;
  xpc_object_t v13[2];
  xpc_object_t v14[2];
  _QWORD v15[2];
  xpc_object_t v16[2];
  xpc_object_t v17[2];
  xpc_object_t v18[2];
  __int128 v19;
  xpc_object_t object[2];
  xpc_object_t v21[2];
  __int128 v22;
  __int128 v23;

  v22 = 0u;
  v23 = 0u;
  v10 = *a1;
  v21[0] = v10;
  if (v10)
    xpc_retain(v10);
  else
    v21[0] = xpc_null_create();
  v21[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(v21, object, (xpc_object_t *)&v22);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v21[0]);
  v21[0] = 0;
  *(_OWORD *)v18 = 0u;
  v19 = 0u;
  v17[0] = (xpc_object_t)v22;
  *(_QWORD *)&v22 = xpc_null_create();
  v17[1] = *((xpc_object_t *)&v22 + 1);
  v16[0] = (xpc_object_t)v23;
  *(_QWORD *)&v23 = xpc_null_create();
  v16[1] = *((xpc_object_t *)&v23 + 1);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>((uint64_t)v17, v16, a3, a4, (uint64_t)v18);
  xpc_release(v16[0]);
  v16[0] = 0;
  xpc_release(v17[0]);
  v17[0] = 0;
  v14[0] = *a1;
  *a1 = xpc_null_create();
  v14[1] = a1[1];
  v13[0] = v18[0];
  v18[0] = xpc_null_create();
  v13[1] = v18[1];
  std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(v14, v13, v15);
  v11 = v19;
  *(_QWORD *)a5 = v15[0];
  v12 = xpc_null_create();
  v15[0] = v12;
  *(_QWORD *)(a5 + 8) = v15[1];
  *(_OWORD *)(a5 + 16) = v11;
  xpc_release(v12);
  v15[0] = 0;
  xpc_release(v13[0]);
  v13[0] = 0;
  xpc_release(v14[0]);
  v14[0] = 0;
  xpc_release(v18[0]);
  xpc_release((xpc_object_t)v23);
  *(_QWORD *)&v23 = 0;
  xpc_release((xpc_object_t)v22);
}

void sub_22E110894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t a15, uint64_t a16, xpc_object_t a17, uint64_t a18, xpc_object_t a19, uint64_t a20,uint64_t a21,uint64_t a22,xpc_object_t a23)
{
  uint64_t v23;

  xpc_release(object);
  xpc_release(a11);
  xpc_release(a19);
  std::pair<xpc::array::iterator,xpc::array::iterator>::~pair((xpc_object_t *)(v23 - 80));
  _Unwind_Resume(a1);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t i;
  _QWORD v10[2];
  xpc_object_t object;
  __int128 v12;

  *(_QWORD *)&v12 = a3;
  *((_QWORD *)&v12 + 1) = a4;
  for (i = *(_QWORD *)(a1 + 8); i != a2[1] || *(_QWORD *)a1 != *a2; *(_QWORD *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    xpc::array::object_proxy::operator xpc::dict((uint64_t)v10, &object);
    std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>::operator=[abi:ne180100]((uint64_t)&v12, &object);
    xpc_release(object);
    i = *(_QWORD *)(a1 + 8) + 1;
  }
  return std::pair<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>::pair[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(a5, (xpc_object_t *)a1, &v12);
}

void sub_22E1109E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>::operator=[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  BOOL v6;

  v3 = std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__emplace_hint_unique_key_args<xpc::dict,xpc::dict>(*(uint64_t ***)a1, *(_QWORD **)(a1 + 8), a2, a2);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      v5 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    do
    {
      v5 = (uint64_t *)v3[2];
      v6 = *v5 == (_QWORD)v3;
      v3 = v5;
    }
    while (!v6);
  }
  *(_QWORD *)(a1 + 8) = v5;
  return a1;
}

BOOL CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *__p[2];
  uint64_t v9;
  void *v10[2];
  uint64_t v11;
  xpc_object_t object;
  xpc_object_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;

  v13 = 0;
  v14 = a2;
  v15 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&v14, &v13);
  object = 0;
  v14 = a3;
  v15 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&v14, &object);
  v4 = MEMORY[0x22E3268EC](v13);
  v5 = MEMORY[0x24BDACFE0];
  if (v4 == MEMORY[0x24BDACFE0] || MEMORY[0x22E3268EC](object) == v5)
  {
    v6 = 0;
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0)
      operator delete(v14);
    __p[0] = 0;
    __p[1] = 0;
    v9 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0)
      operator delete(v14);
    v6 = (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v10, __p) & 0x80u) != 0;
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v11) < 0)
      operator delete(v10[0]);
  }
  xpc_release(object);
  xpc_release(v13);
  return v6;
}

void sub_22E110B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, xpc_object_t object)
{
  uint64_t v19;

  if (*(char *)(v19 - 17) < 0)
    operator delete(*(void **)(v19 - 40));
  if (a18 < 0)
    operator delete(__p);
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v19 - 48));
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(uint64_t a1, _QWORD *a2, void *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  void *v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = v4;
        v9 = v4 + 4;
        if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(v7, a3, v4 + 4))
          break;
        v4 = (_QWORD *)*v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = (_QWORD *)v8[1];
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

void std::unique_ptr<std::__tree_node<xpc::dict,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<xpc::dict,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  xpc_object_t *v2;

  v2 = *(xpc_object_t **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<xpc::dict,0>(v2 + 4);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<xpc::dict,0>(xpc_object_t *a1)
{
  xpc_release(*a1);
  *a1 = 0;
}

uint64_t std::pair<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>::pair[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(uint64_t a1, xpc_object_t *a2, _OWORD *a3)
{
  *(_QWORD *)a1 = *a2;
  *a2 = xpc_null_create();
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_OWORD *)(a1 + 16) = *a3;
  return a1;
}

uint64_t *std::shared_ptr<CellularUsagePolicyClient>::shared_ptr[abi:ne180100]<CellularUsagePolicyClient,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1},void>(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24F9EC0C8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2)
    v5 = (_QWORD *)(a2 + 8);
  else
    v5 = 0;
  std::shared_ptr<CellularUsagePolicyClient>::__enable_weak_this[abi:ne180100]<ctu::XpcClient,CellularUsagePolicyClient,void>((uint64_t)a1, v5, a2);
  return a1;
}

void sub_22E111000(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1}::operator() const(CellularUsagePolicyClient*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_22E111020(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::shared_ptr<CellularUsagePolicyClient>::__enable_weak_this[abi:ne180100]<ctu::XpcClient,CellularUsagePolicyClient,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  if (a2)
  {
    v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4)
        std::__shared_weak_count::__release_weak(v4);
      if (v5)
      {
        v10 = (unint64_t *)&v5->__shared_owners_;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

void std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E326718);
}

void std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 24), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1}::operator() const(CellularUsagePolicyClient*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::__get_deleter(uint64_t a1, uint64_t a2)
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

uint64_t std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1}::operator() const(CellularUsagePolicyClient*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

void ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD block[6];
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v15 = 0;
  v16 = 0;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v15, a1);
  v4 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_24F9EC390;
  block[5] = v15;
  v14 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  block[4] = a2;
  dispatch_async(v4, block);
  v7 = v14;
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v16;
  if (v16)
  {
    v11 = (unint64_t *)&v16->__shared_owners_;
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

_QWORD *std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(_QWORD *a1, _QWORD *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4)
    goto LABEL_5;
  return a1;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E10B000, MEMORY[0x24BDACB70], a3, "Failed to ping data usage policy server", a5, a6, a7, a8, 0);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9828](this, a2, a3);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x24BED9840](this);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x24BED9AF8](this, a2, a3);
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x24BED9CD0]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x24BED9CD8]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
  MEMORY[0x24BED9CE0](this);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D70]();
}

{
  return MEMORY[0x24BED9D80]();
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x24BED9ED0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F9EBE60(__p);
}

uint64_t operator delete()
{
  return off_24F9EBE68();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F9EBE70(__sz);
}

uint64_t operator new()
{
  return off_24F9EBE78();
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
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

