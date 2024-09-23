uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  return std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t result, uint64_t a2)
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

void *__copy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(_QWORD *a1, _QWORD *a2)
{
  void *result;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  result = (void *)a2[4];
  if (result)
    result = _Block_copy(result);
  v6 = a2[5];
  v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

xpc_object_t __copy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
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

void __destroy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

xpc_object_t __copy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE40c27_ZTSN12TelephonyXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  void *v4;
  std::string *v5;
  __int128 v6;
  void *v7;
  xpc_object_t result;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  v5 = (std::string *)(a1 + 48);
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v7;
  if (v7)
    return xpc_retain(v7);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

void sub_20E5C1E38(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 32);
  if (v3)
    _Block_release(v3);
  _Unwind_Resume(exception_object);
}

void ___ZN12TelephonyXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8[2];

  v2 = a1[4];
  v3 = (std::__shared_weak_count *)a1[6];
  v8[0] = a1[5];
  v8[1] = (uint64_t)v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  TelephonyXPC::Client::State::perform_sync(v2, v8);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_20E5C1EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  xpc_object_t object;
  int v5;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD *)(a1 + 40);
  if (*(char *)(a1 + 71) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    __p = *(std::string *)(a1 + 48);
  v3 = *(void **)(a1 + 72);
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v2 + 16))(v2, &v5, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5C1FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
}

void __destroy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE40c27_ZTSN12TelephonyXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(_QWORD *)(a1 + 72) = 0;
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 56);
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v2 = a1[4];
  v4 = a1[5];
  v3 = (std::__shared_weak_count *)a1[6];
  v10 = v4;
  v11 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v10);
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_20E5C2140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  unint64_t *p_shared_owners;
  unint64_t v12;

  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void __destroy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(uint64_t a1)
{
  const void *v2;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 40);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void ___ZN12TelephonyXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t objecta;

  if (object)
  {
    v3 = object;
    xpc_retain(object);
  }
  else
  {
    v3 = xpc_null_create();
  }
  v4 = *(_QWORD *)(a1 + 32);
  objecta = v3;
  v5 = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &objecta);
  xpc_release(objecta);
  xpc_release(v5);
}

void sub_20E5C2288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
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
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

void TelephonyXPC::Client::perform(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    TelephonyXPC::Client::State::perform(v3, v4, v5);
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    TelephonyXPC::Client::State::perform(v3, v4, 0);
  }
}

void TelephonyXPC::Client::State::perform(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3)
{
  uint64_t *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[6];
  std::__shared_weak_count *v11;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v4 = (uint64_t *)(a1 + 8);
  v10[2] = ___ZN12TelephonyXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_63;
  v10[4] = a1;
  v10[5] = a2;
  v11 = a3;
  if (a3)
  {
    p_shared_owners = (unint64_t *)&a3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v4, (uint64_t)v10);
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  object = v1;
  if (v1)
    xpc_retain(v1);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_20E5C24A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke(_QWORD *a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  xpc_object_t reply;
  xpc_object_t v8;
  std::__shared_weak_count *v9;
  xpc_connection_t remote_connection;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  ctu::LoggerCommonBase *v14;
  __int128 v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  ctu::LoggerCommonBase *v19;
  __int128 v20;
  uint64_t v21;
  void *__p[2];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  xpc_object_t v28;
  std::__shared_weak_count *v30;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    v30 = v6;
    if (v6)
    {
      if (!a1[5])
      {
        v9 = v6;
LABEL_23:
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
        return;
      }
      reply = xpc_dictionary_create_reply(*a2);
      if (reply || (reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x212BC0184](reply) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(reply);
          v8 = reply;
        }
        else
        {
          v8 = xpc_null_create();
        }
      }
      else
      {
        v8 = xpc_null_create();
        reply = 0;
      }
      xpc_release(reply);
      remote_connection = xpc_dictionary_get_remote_connection(*a2);
      v11 = remote_connection;
      if (remote_connection)
        xpc_retain(remote_connection);
      else
        v11 = xpc_null_create();
      v12 = MEMORY[0x212BC0184](*(_QWORD *)(v5 + 40));
      v13 = MEMORY[0x24BDACF88];
      if (v12 == MEMORY[0x24BDACF88]
        && MEMORY[0x212BC0184](v11) == v13
        && MEMORY[0x212BC0184](v8) == MEMORY[0x24BDACFA0]
        && v11 == *(xpc_object_t *)(v5 + 40))
      {
        v28 = v8;
        if (v8)
          xpc_retain(v8);
        else
          v28 = xpc_null_create();
        TelephonyXPC::Client::State::send_sync(v5, &v28);
        xpc_release(v28);
        v28 = 0;
        v19 = (ctu::LoggerCommonBase *)(v5 + 80);
        ctu::LoggerCommonBase::getLogLevel(v19);
        if (!(**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v19)(v19, 20))
        {
LABEL_22:
          xpc_release(v11);
          xpc_release(v8);
          v9 = v30;
          if (!v30)
            return;
          goto LABEL_23;
        }
        v27 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v20;
        v26 = v20;
        v24 = v20;
        ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v24);
        v21 = MEMORY[0x212BBFE3C](&v24, "Sent reply for: ");
        xpc::dict::to_debug_string((xpc::dict *)__p, (uint64_t)*a2);
        MEMORY[0x212BBFE48](v21, __p);
        if (v23 < 0)
          operator delete(__p[0]);
      }
      else
      {
        v14 = (ctu::LoggerCommonBase *)(v5 + 80);
        ctu::LoggerCommonBase::getLogLevel(v14);
        if (!(**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v14)(v14, 20))
          goto LABEL_22;
        v27 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v15;
        v26 = v15;
        v24 = v15;
        ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v24);
        v16 = MEMORY[0x212BBFE3C](&v24, "Unable to send reply for: ");
        xpc::dict::to_debug_string((xpc::dict *)__p, (uint64_t)*a2);
        MEMORY[0x212BBFE48](v16, __p);
        if (v23 < 0)
          operator delete(__p[0]);
      }
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](&v24);
      goto LABEL_22;
    }
  }
}

void sub_20E5C279C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  void *v16;
  void *v17;
  uint64_t v18;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x212BBFDD0](&a16);
  xpc_release(v17);
  xpc_release(v16);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v18 - 64);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void ***v10;
  xpc_object_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *p_shared_weak_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  _xpc_connection_s *v24;
  xpc_object_t v25;
  NSObject *v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  xpc_object_t object;
  void *v32;
  int v33;
  void *__p[2];
  uint64_t v35;
  _QWORD aBlock[6];
  std::__shared_weak_count *v37;
  std::string v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  xpc_object_t v41;
  __int128 handler;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  std::string v46;
  std::__shared_weak_count *v48;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    return;
  v3 = *(_QWORD **)(a1 + 32);
  v4 = std::__shared_weak_count::lock(v2);
  v48 = v4;
  if (!v4)
    return;
  if (!*(_QWORD *)(a1 + 40))
  {
    v12 = v4;
LABEL_19:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    return;
  }
  memset(&v46, 170, sizeof(v46));
  TelephonyXPC::Command::State::name(**(TelephonyXPC::Command::State ***)(a1 + 56));
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v3 + 10));
  if ((*(unsigned int (**)(_QWORD *, uint64_t))v3[10])(v3 + 10, 20))
  {
    v45 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v43 = v5;
    v44 = v5;
    handler = v5;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&handler);
    v6 = MEMORY[0x212BBFE3C](&handler, "Performing ");
    MEMORY[0x212BBFE48](v6, &v46);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](&handler);
  }
  v7 = **(_QWORD **)(a1 + 56);
  if (*(_QWORD *)(v7 + 8) && *(_QWORD *)(v7 + 16))
  {
    v8 = MEMORY[0x212BC0184](v3[5]);
    v9 = MEMORY[0x24BDACF88];
    v10 = *(void ****)(a1 + 56);
    if (v8 == MEMORY[0x24BDACF88])
    {
      TelephonyXPC::Command::State::get(*v10, &v41);
      v15 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1174405120;
      aBlock[2] = ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_2;
      aBlock[3] = &__block_descriptor_tmp_34;
      v17 = *(_QWORD *)(a1 + 40);
      v16 = *(std::__shared_weak_count **)(a1 + 48);
      aBlock[4] = v3;
      aBlock[5] = v17;
      v37 = v16;
      if (v16)
      {
        p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
        do
          v19 = __ldxr(p_shared_weak_owners);
        while (__stxr(v19 + 1, p_shared_weak_owners));
      }
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v38, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
      else
        v38 = v46;
      v20 = *(std::__shared_weak_count **)(a1 + 64);
      v39 = *(_QWORD *)(a1 + 56);
      v40 = v20;
      if (v20)
      {
        v21 = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      v23 = _Block_copy(aBlock);
      if (MEMORY[0x212BC0184](v3[5]) == v9)
      {
        v24 = (_xpc_connection_s *)v3[5];
        v25 = v41;
        v26 = v3[3];
        *(_QWORD *)&handler = v15;
        *((_QWORD *)&handler + 1) = 1174405120;
        *(_QWORD *)&v43 = ___ZN12TelephonyXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke;
        *((_QWORD *)&v43 + 1) = &__block_descriptor_tmp_38;
        v27 = v23 ? _Block_copy(v23) : 0;
        *(_QWORD *)&v44 = v27;
        xpc_connection_send_message_with_reply(v24, v25, v26, &handler);
        if ((_QWORD)v44)
          _Block_release((const void *)v44);
      }
      if (v23)
        _Block_release(v23);
      xpc_release(v41);
      v41 = 0;
      v28 = v40;
      if (v40)
      {
        v29 = (unint64_t *)&v40->__shared_owners_;
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v38.__r_.__value_.__l.__data_);
      if (v37)
        std::__shared_weak_count::__release_weak(v37);
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&handler, "Server not available");
      v33 = -534716415;
      *(_OWORD *)__p = handler;
      v35 = v43;
      handler = 0uLL;
      *(_QWORD *)&v43 = 0;
      v11 = xpc_null_create();
      v32 = v11;
      TelephonyXPC::Command::notify((uint64_t *)v10, (uint64_t)&v33, &v32);
      xpc_release(v11);
      v32 = 0;
      if (SHIBYTE(v35) < 0)
        operator delete(__p[0]);
      if (SBYTE7(v43) < 0)
        operator delete((void *)handler);
    }
  }
  else
  {
    TelephonyXPC::Command::State::get((void **)v7, &object);
    TelephonyXPC::Client::State::send_sync((uint64_t)v3, &object);
    xpc_release(object);
    object = 0;
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  v12 = v48;
  if (v48)
    goto LABEL_19;
}

void sub_20E5C2C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,xpc_object_t object,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *aBlock)
{
  const void *v42;
  uint64_t v43;

  if (aBlock)
    _Block_release(aBlock);
  if (v42)
    _Block_release(v42);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a32);
  if (a31 < 0)
    operator delete(__p);
  if (a25)
    std::__shared_weak_count::__release_weak(a25);
  xpc_release(object);
  object = 0;
  if (*(char *)(v43 - 97) < 0)
    operator delete(*(void **)(v43 - 120));
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v43 - 96);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::State::name(TelephonyXPC::Command::State *this)
{
  _QWORD v1[2];
  xpc_object_t object;

  v1[0] = this;
  v1[1] = "command";
  object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v1, &object);
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_20E5C2D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

xpc_object_t TelephonyXPC::Command::State::get@<X0>(void **this@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  xpc_object_t result;

  v2 = *this;
  *a2 = v2;
  if (v2)
    return xpc_retain(v2);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

void TelephonyXPC::Client::State::parseReply_sync(void **a1, _QWORD *a2, uint64_t a3)
{
  int v6;
  std::string::size_type v7;
  void *v8;
  _QWORD v9[2];
  xpc_object_t v10;
  std::string object;
  std::string __p;
  void *v13;
  const char *v14;
  uint64_t v15;

  *a1 = (void *)0xAAAAAAAAAAAAAAAALL;
  *a1 = xpc_null_create();
  memset(&__p, 170, sizeof(__p));
  std::string::basic_string[abi:ne180100]<0>(&__p, "Server not available");
  if (MEMORY[0x212BC0184](*a2) == MEMORY[0x24BDACFA0])
  {
    v13 = a2;
    v14 = "commandData";
    xpc::dict::object_proxy::operator xpc::dict((uint64_t)&v13, &object);
    v7 = object.__r_.__value_.__r.__words[0];
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    v8 = *a1;
    *a1 = (void *)v7;
    xpc_release(v8);
    xpc_release(object.__r_.__value_.__l.__data_);
    v13 = a2;
    v14 = "commandResult";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v13, &object);
    v6 = xpc::dyn_cast_or_default();
    xpc_release(object.__r_.__value_.__l.__data_);
    v9[0] = a1;
    v9[1] = "KeyErrorString";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v9, &v10);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v15) < 0)
      operator delete(v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = object;
    *((_BYTE *)&object.__r_.__value_.__s + 23) = 0;
    object.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(v10);
  }
  else
  {
    v6 = -534716415;
  }
  *(_DWORD *)a3 = v6;
  std::string::operator=((std::string *)(a3 + 8), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5C2F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  xpc_object_t *v20;
  uint64_t v21;

  if (*(char *)(v21 - 33) < 0)
    operator delete(*(void **)(v21 - 56));
  xpc_release(object);
  if (a20 < 0)
    operator delete(__p);
  xpc::dict::~dict(v20);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Event::getData(TelephonyXPC::Event *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD v3[2];

  v2 = *(_QWORD *)this;
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  v3[0] = v2;
  v3[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v3, a2);
}

void xpc::dict::object_proxy::operator xpc::dict(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  if (MEMORY[0x212BC0184](v4) != MEMORY[0x24BDACFA0])
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

void ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_2(_QWORD *a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  xpc_object_t v8;
  __int128 v9;
  ctu::LoggerCommonBase *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  xpc_object_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *v19;
  int v20;
  std::string v21;
  void *__p[2];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  xpc_object_t v28;
  void *v29;
  _BYTE v30[32];
  std::__shared_weak_count *v32;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    v32 = v6;
    if (v6)
    {
      v7 = v6;
      if (!a1[5])
      {
LABEL_30:
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        return;
      }
      v8 = *a2;
      if (v8 && MEMORY[0x212BC0184](v8) == MEMORY[0x24BDACFA0])
        xpc_retain(v8);
      else
        v8 = xpc_null_create();
      *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)v30 = v9;
      *(_OWORD *)&v30[16] = v9;
      std::string::basic_string[abi:ne180100]<0>(&v24, "Unknown internal error");
      *(_DWORD *)v30 = -534716416;
      *(_OWORD *)&v30[8] = v24;
      *(_QWORD *)&v30[24] = v25;
      v28 = v8;
      v29 = (void *)0xAAAAAAAAAAAAAAAALL;
      if (v8)
        xpc_retain(v8);
      else
        v28 = xpc_null_create();
      TelephonyXPC::Client::State::parseReply_sync(&v29, &v28, (uint64_t)v30);
      xpc_release(v28);
      v28 = 0;
      v10 = (ctu::LoggerCommonBase *)(v5 + 80);
      if (*(_DWORD *)v30)
      {
        ctu::LoggerCommonBase::getLogLevel(v10);
        if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v10)(v10, 20))
        {
          v27 = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v25 = v11;
          v26 = v11;
          v24 = v11;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v24);
          v12 = MEMORY[0x212BBFE3C](&v24, "Failure: ");
          TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, (uint64_t)v30);
          MEMORY[0x212BBFE48](v12, __p);
          if (v23 < 0)
            operator delete(__p[0]);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          goto LABEL_18;
        }
      }
      else
      {
        ctu::LoggerCommonBase::getLogLevel(v10);
        if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v10)(v10, 20))
        {
          v27 = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v25 = v13;
          v26 = v13;
          v24 = v13;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v24);
          v14 = MEMORY[0x212BBFE3C](&v24, "Successful: ");
          MEMORY[0x212BBFE48](v14, a1 + 7);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
LABEL_18:
          MEMORY[0x212BBFDD0](&v24);
        }
      }
      v15 = (uint64_t *)a1[10];
      v20 = *(_DWORD *)v30;
      if ((v30[31] & 0x80000000) != 0)
        std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)&v30[8], *(std::string::size_type *)&v30[16]);
      else
        v21 = *(std::string *)&v30[8];
      v16 = v29;
      v19 = v29;
      if (v29)
      {
        xpc_retain(v29);
      }
      else
      {
        v16 = xpc_null_create();
        v19 = v16;
      }
      TelephonyXPC::Command::notify(v15, (uint64_t)&v20, &v19);
      xpc_release(v16);
      v19 = 0;
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v21.__r_.__value_.__l.__data_);
      xpc_release(v29);
      if ((v30[31] & 0x80000000) != 0)
        operator delete(*(void **)&v30[8]);
      xpc_release(v8);
      goto LABEL_30;
    }
  }
}

void sub_20E5C33A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  void *v23;
  uint64_t v24;

  xpc_release(*(xpc_object_t *)(v24 - 104));
  if (*(char *)(v24 - 65) < 0)
    operator delete(*(void **)(v24 - 88));
  xpc_release(v23);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v24 - 64);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::create(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  std::__shared_weak_count_vtbl *v8;
  void *v9;
  NSObject *v10;
  xpc_object_t v11;
  void (__cdecl *v12)(std::__shared_weak_count *__hidden);
  void (__cdecl *v13)(std::__shared_weak_count *__hidden);
  uint64_t v14;
  void (__cdecl *v15)(std::__shared_weak_count *__hidden);
  void (__cdecl *v16)(std::__shared_weak_count *__hidden);
  void (__cdecl *v17)(std::__shared_weak_count *__hidden);
  void (__cdecl *v18)(std::__shared_weak_count *__hidden);
  const char *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  void *aBlock;
  NSObject *object;
  _QWORD v32[2];
  xpc_object_t v33;
  xpc_object_t v34;

  v8 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v9 = *(void **)a2;
  if (*(_QWORD *)a2)
    v9 = _Block_copy(v9);
  v10 = *(NSObject **)(a2 + 8);
  aBlock = v9;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  v11 = *a3;
  if (v11)
    xpc_retain(v11);
  else
    v11 = xpc_null_create();
  v12 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_dictionary_create(0, 0, 0);
  v13 = v12;
  v14 = MEMORY[0x24BDACFA0];
  if (v12)
  {
    v8->~__shared_weak_count = v12;
  }
  else
  {
    v13 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    v8->~__shared_weak_count = v13;
    if (!v13)
    {
      v15 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
      v13 = 0;
      goto LABEL_15;
    }
  }
  if (MEMORY[0x212BC0184](v13) == v14)
  {
    xpc_retain(v13);
    goto LABEL_16;
  }
  v15 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
LABEL_15:
  v8->~__shared_weak_count = v15;
LABEL_16:
  xpc_release(v13);
  if (aBlock)
    v16 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(aBlock);
  else
    v16 = 0;
  v8->~__shared_weak_count_0 = v16;
  v8->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))object;
  if (object)
    dispatch_retain(object);
  if (MEMORY[0x212BC0184](v11) == v14)
  {
    if (v11)
    {
      xpc_retain(v11);
      v17 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v11;
    }
    else
    {
      v17 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    }
    v18 = v8->~__shared_weak_count;
    v8->~__shared_weak_count = v17;
    xpc_release(v18);
  }
  if (*(char *)(a1 + 23) >= 0)
    v19 = (const char *)a1;
  else
    v19 = *(const char **)a1;
  v33 = xpc_string_create(v19);
  if (!v33)
    v33 = xpc_null_create();
  v32[0] = v8;
  v32[1] = "command";
  xpc::dict::object_proxy::operator=((uint64_t)v32, &v33, &v34);
  xpc_release(v34);
  v34 = 0;
  xpc_release(v33);
  v20 = (std::__shared_weak_count *)operator new(0x20uLL);
  v20->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  v20->__vftable = (std::__shared_weak_count_vtbl *)off_24C970768;
  v20->__shared_weak_owners_ = 0;
  v20[1].__vftable = v8;
  xpc_release(v11);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  v22 = operator new(0x10uLL);
  v23 = v22;
  do
    v24 = __ldxr(p_shared_owners);
  while (__stxr(v24 + 1, p_shared_owners));
  *v22 = v8;
  v22[1] = v20;
  do
    v25 = __ldxr(p_shared_owners);
  while (__stxr(v25 + 1, p_shared_owners));
  *a4 = v22;
  v26 = operator new(0x20uLL);
  *v26 = off_24C9707E0;
  v26[1] = 0;
  v26[2] = 0;
  v26[3] = v23;
  a4[1] = v26;
  do
    v27 = __ldaxr(p_shared_owners);
  while (__stlxr(v27 - 1, p_shared_owners));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v20)
  {
    v28 = (unint64_t *)&v20->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_20E5C3764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;
  void *v15;

  v15 = (void *)std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v13);
  operator delete(v15);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_20E5C3798(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  std::default_delete<TelephonyXPC::Command::State>::operator()[abi:ne180100](v2);
  xpc_release(v3);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)va);
  JUMPOUT(0x20E5C378CLL);
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

void TelephonyXPC::Client::State::perform_sync(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v4;
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD v21[6];
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  if (*a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v4 = *(std::__shared_weak_count **)(a1 + 16);
    v5 = (uint64_t *)(a1 + 8);
    if (!v4 || (v8 = std::__shared_weak_count::lock(v4)) == 0)
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v9 = v8;
    p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v9);
    }
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 1174405120;
    v21[2] = ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
    v21[3] = &__block_descriptor_tmp_36;
    v21[4] = a1;
    v21[5] = v6;
    v22 = v9;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v15 = (std::__shared_weak_count *)a2[1];
    v23 = *a2;
    v24 = v15;
    if (v15)
    {
      v16 = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v5, (uint64_t)v21);
    v18 = v24;
    if (v24)
    {
      v19 = (unint64_t *)&v24->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (v22)
      std::__shared_weak_count::__release_weak(v22);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void TelephonyXPC::Client::State::handleMessage_sync(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_weak_owners;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void **v21;
  int v22;
  int v23;
  BOOL v25;
  uint64_t v26;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  void *v29;
  unint64_t *v30;
  unint64_t v31;
  const void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _QWORD aBlock[6];
  std::__shared_weak_count *v47;
  void *v48;
  dispatch_object_t object;
  xpc_object_t v50;
  void *__p;
  unint64_t v52;
  char v53;
  void *block[2];
  __int128 v55;
  void *v56[2];
  unint64_t v57;

  v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(v4, 20))
  {
    v57 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v55 = v5;
    *(_OWORD *)v56 = v5;
    *(_OWORD *)block = v5;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)block);
    v6 = MEMORY[0x212BBFE3C](block, "Message From Server: ");
    xpc::dict::to_debug_string((xpc::dict *)&__p, *a2);
    MEMORY[0x212BBFE48](v6, &__p);
    if (v53 < 0)
      operator delete(__p);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](block);
  }
  v7 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v7 || (v8 = *(_QWORD *)(a1 + 8), (v9 = std::__shared_weak_count::lock(v7)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v10 = v9;
  p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
  do
    v12 = __ldxr(p_shared_weak_owners);
  while (__stxr(v12 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v10);
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  v52 = 0xAAAAAAAAAAAAAAAALL;
  v15 = (void *)*a2;
  v50 = v15;
  if (v15)
    xpc_retain(v15);
  else
    v50 = xpc_null_create();
  v16 = (void *)MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_74;
  aBlock[4] = a1;
  aBlock[5] = v8;
  v47 = v10;
  do
    v17 = __ldxr(p_shared_weak_owners);
  while (__stxr(v17 + 1, p_shared_weak_owners));
  v18 = _Block_copy(aBlock);
  v19 = *(NSObject **)(a1 + 24);
  if (v19)
    dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  v48 = v18;
  object = v19;
  TelephonyXPC::Event::create(&v50, (uint64_t)&v48, &__p);
  if (object)
    dispatch_release(object);
  if (v48)
    _Block_release(v48);
  xpc_release(v50);
  v50 = 0;
  TelephonyXPC::Event::State::name(*(TelephonyXPC::Event::State **)__p);
  v20 = (void *)BYTE7(v55);
  if (SBYTE7(v55) < 0)
    v20 = block[1];
  if (v20 == (void *)7)
  {
    v21 = (void **)block[0];
    if ((SBYTE7(v55) & 0x80u) == 0)
      v21 = block;
    v22 = *(_DWORD *)v21;
    v23 = *(_DWORD *)((char *)v21 + 3);
    v25 = v22 == *(_DWORD *)"invalid" && v23 == *(_DWORD *)"alid";
    if ((SBYTE7(v55) & 0x80000000) == 0)
    {
LABEL_36:
      if (v25)
        goto LABEL_69;
      goto LABEL_40;
    }
  }
  else
  {
    v25 = 0;
    if ((SBYTE7(v55) & 0x80000000) == 0)
      goto LABEL_36;
  }
  operator delete(block[0]);
  if (v25)
    goto LABEL_69;
LABEL_40:
  v26 = *(_QWORD *)(a1 + 224);
  TelephonyXPC::Event::State::name(*(TelephonyXPC::Event::State **)__p);
  v27 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(v26, block);
  if (SBYTE7(v55) < 0)
    operator delete(block[0]);
  if ((_QWORD *)(*(_QWORD *)(a1 + 224) + 8) != v27)
  {
    v29 = __p;
    v28 = (std::__shared_weak_count *)v52;
    if (v52)
    {
      v30 = (unint64_t *)(v52 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    v32 = (const void *)v27[7];
    if (v32)
      v33 = _Block_copy(v32);
    else
      v33 = 0;
    v34 = v27[8];
    block[0] = v16;
    block[1] = (void *)1174405120;
    *(_QWORD *)&v55 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
    *((_QWORD *)&v55 + 1) = &__block_descriptor_tmp_67;
    if (v33)
      v35 = _Block_copy(v33);
    else
      v35 = 0;
    v56[0] = v35;
    v56[1] = v29;
    v57 = (unint64_t)v28;
    if (v28)
    {
      v36 = (unint64_t *)&v28->__shared_owners_;
      do
        v37 = __ldxr(v36);
      while (__stxr(v37 + 1, v36));
    }
    dispatch_async(v34, block);
    v38 = (std::__shared_weak_count *)v57;
    if (v57)
    {
      v39 = (unint64_t *)(v57 + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    if (v56[0])
      _Block_release(v56[0]);
    if (v33)
      _Block_release(v33);
    if (v28)
    {
      v41 = (unint64_t *)&v28->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
LABEL_69:
  v43 = (std::__shared_weak_count *)v52;
  if (v52)
  {
    v44 = (unint64_t *)(v52 + 8);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  if (v47)
    std::__shared_weak_count::__release_weak(v47);
  std::__shared_weak_count::__release_weak(v10);
}

void sub_20E5C3DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, char a17, uint64_t a18, xpc_object_t object, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  std::__shared_weak_count *v26;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Event::State::name(TelephonyXPC::Event::State *this)
{
  _QWORD v1[2];
  xpc_object_t object;

  v1[0] = this;
  v1[1] = "event";
  object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v1, &object);
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_20E5C3ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
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

_QWORD *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  char v6;
  _QWORD *v7;

  v2 = (_QWORD *)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (_QWORD *)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = v3;
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

void std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::__on_zero_shared(uint64_t a1)
{
  TelephonyXPC::Event::State *v1;
  void *v2;

  v1 = *(TelephonyXPC::Event::State **)(a1 + 24);
  if (v1)
  {
    TelephonyXPC::Event::State::~State(v1);
    operator delete(v2);
  }
}

void TelephonyXPC::Event::create(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  std::__shared_weak_count_vtbl *v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  void (__cdecl *v10)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;

  v6 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v7 = *a1;
  if (v7)
    xpc_retain(v7);
  else
    v7 = xpc_null_create();
  if (*(_QWORD *)a2)
    v8 = _Block_copy(*(const void **)a2);
  else
    v8 = 0;
  v9 = *(NSObject **)(a2 + 8);
  if (v9)
    dispatch_retain(v9);
  v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  if (v7)
  {
    xpc_retain(v7);
    if (v8)
    {
LABEL_11:
      v10 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(v8);
      goto LABEL_14;
    }
  }
  else
  {
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    if (v8)
      goto LABEL_11;
  }
  v10 = 0;
LABEL_14:
  v6->~__shared_weak_count_0 = v10;
  v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v9;
  if (v9)
    dispatch_retain(v9);
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)off_24C96FE98;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v6;
  if (v9)
    dispatch_release(v9);
  if (v8)
    _Block_release(v8);
  xpc_release(v7);
  v13 = operator new(0x10uLL);
  v14 = v13;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  *v13 = v6;
  v13[1] = v11;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  *a3 = v13;
  v17 = operator new(0x20uLL);
  *v17 = off_24C96FF40;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = v14;
  a3[1] = v17;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v11)
  {
    v19 = (unint64_t *)&v11->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_20E5C41D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;
  void *v15;

  v15 = (void *)std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v13);
  operator delete(v15);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_20E5C4208(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  TelephonyXPC::Event::State *v11;
  void *v12;
  void *v13;

  TelephonyXPC::Event::State::~State(v11);
  operator delete(v13);
  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a11);
  xpc_release(v12);
  JUMPOUT(0x20E5C41FCLL);
}

void TelephonyXPC::Event::State::~State(TelephonyXPC::Event::State *this)
{
  uint64_t v2;
  int *p_p;
  int v4;
  int v5;
  BOOL v7;
  xpc_object_t v8;
  const void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const void *v14;
  void *__p;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *aBlock;
  xpc_object_t object;

  if (!*((_QWORD *)this + 1) || !*((_QWORD *)this + 2))
    goto LABEL_37;
  TelephonyXPC::Event::State::name(this);
  v2 = HIBYTE(v17);
  if (SHIBYTE(v17) < 0)
    v2 = v16;
  if (v2 != 7)
  {
    v7 = 0;
    if (SHIBYTE(v17) < 0)
      goto LABEL_19;
LABEL_17:
    if (v7)
      goto LABEL_37;
    goto LABEL_20;
  }
  p_p = (int *)__p;
  if (SHIBYTE(v17) >= 0)
    p_p = (int *)&__p;
  v4 = *p_p;
  v5 = *(int *)((char *)p_p + 3);
  v7 = v4 == *(_DWORD *)"invalid" && v5 == *(_DWORD *)"alid";
  if ((SHIBYTE(v17) & 0x80000000) == 0)
    goto LABEL_17;
LABEL_19:
  operator delete(__p);
  if (v7)
    goto LABEL_37;
LABEL_20:
  v8 = *(xpc_object_t *)this;
  if (*(_QWORD *)this)
    xpc_retain(*(xpc_object_t *)this);
  else
    v8 = xpc_null_create();
  v9 = (const void *)*((_QWORD *)this + 1);
  if (v9)
    v10 = _Block_copy(v9);
  else
    v10 = 0;
  v11 = *((_QWORD *)this + 2);
  __p = (void *)MEMORY[0x24BDAC760];
  v16 = 1174405120;
  v17 = ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke;
  v18 = &__block_descriptor_tmp;
  if (v10)
    v12 = _Block_copy(v10);
  else
    v12 = 0;
  aBlock = v12;
  object = v8;
  if (v8)
    xpc_retain(v8);
  else
    object = xpc_null_create();
  dispatch_async(v11, &__p);
  xpc_release(object);
  object = 0;
  if (aBlock)
    _Block_release(aBlock);
  if (v10)
    _Block_release(v10);
  xpc_release(v8);
LABEL_37:
  v13 = *((_QWORD *)this + 2);
  if (v13)
    dispatch_release(v13);
  v14 = (const void *)*((_QWORD *)this + 1);
  if (v14)
    _Block_release(v14);
  xpc_release(*(xpc_object_t *)this);
  *(_QWORD *)this = 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    v2 = (void *)std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    v2 = (void *)std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<TelephonyXPC::Command::State>::operator()[abi:ne180100](*(_QWORD *)(a1 + 24));
}

void TelephonyXPC::Command::notify(uint64_t *a1, uint64_t a2, void **a3)
{
  uint64_t v4;
  void *v5;
  xpc_object_t object;
  int v7;
  std::string __p;

  v4 = *a1;
  v7 = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  else
    __p = *(std::string *)(a2 + 8);
  v5 = *a3;
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::State::notify(v4, &v7, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5C451C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::State::notify(uint64_t a1, int *a2, xpc_object_t *a3)
{
  xpc_object_t v5;
  const void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  std::string v11;
  _QWORD block[4];
  void *aBlock;
  int v14;
  std::string __p;
  xpc_object_t object;

  if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
  {
    v10 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&v11, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      v11 = *(std::string *)(a2 + 2);
    v5 = *a3;
    if (v5)
      xpc_retain(v5);
    else
      v5 = xpc_null_create();
    v6 = *(const void **)(a1 + 8);
    if (v6)
      v7 = _Block_copy(v6);
    else
      v7 = 0;
    v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    if (v7)
      v9 = _Block_copy(v7);
    else
      v9 = 0;
    aBlock = v9;
    v14 = v10;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
    else
      __p = v11;
    object = v5;
    if (v5)
      xpc_retain(v5);
    else
      object = xpc_null_create();
    dispatch_async(v8, block);
    xpc_release(object);
    object = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (aBlock)
      _Block_release(aBlock);
    if (v7)
      _Block_release(v7);
    xpc_release(v5);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_20E5C46F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock)
{
  void *v20;
  const void *v21;

  if (aBlock)
    _Block_release(aBlock);
  if (v21)
    _Block_release(v21);
  xpc_release(v20);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

_QWORD *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(_QWORD *result, _QWORD *a2)
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

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::string *v7;
  __int128 v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

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
  v7 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 56), *(_QWORD *)(a2 + 64));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 56);
    a1[9] = *(_QWORD *)(a2 + 72);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  v9 = *(_QWORD *)(a2 + 88);
  a1[10] = *(_QWORD *)(a2 + 80);
  a1[11] = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
}

void sub_20E5C4878(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
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

_QWORD *TelephonyXPC::Event::Event(_QWORD *result, _QWORD *a2)
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

void TelephonyXPC::Event::getName(TelephonyXPC::Event::State **this)
{
  TelephonyXPC::Event::State::name(*this);
}

void TelephonyXPC::Event::name(TelephonyXPC::Event::State **this)
{
  TelephonyXPC::Event::State::name(*this);
}

uint64_t dispatch::callback<void({block_pointer})(xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void TelephonyXPC::Client::State::~State(TelephonyXPC::Client::State *this)
{
  const void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  os_unfair_lock_s *v4;
  std::__shared_weak_count_vtbl *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  __int128 v15;
  void (*v16)(uint64_t);
  void *v17;
  os_unfair_lock_s *v18;
  uint64_t v19;

  *(_QWORD *)this = &off_24C970068;
  *((_QWORD *)this + 9) = &unk_24C970098;
  v2 = (const void *)*((_QWORD *)this + 30);
  if (v2)
  {
    if (*((_QWORD *)this + 32))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *((const void **)this + 32), *((CFNotificationName *)this + 30), 0);
      pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
      v4 = (os_unfair_lock_s *)unk_253ECF618;
      if (!unk_253ECF618)
      {
        v5 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
        *(_OWORD *)&v5->__on_zero_shared = 0u;
        *(_OWORD *)&v5->__on_zero_shared_weak = 0u;
        *(_OWORD *)&v5->~__shared_weak_count = 0u;
        std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&v15, v5);
        std::shared_ptr<TelephonyXPC::ClientStateTracker>::operator=[abi:ne180100](&v15);
        v6 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
        if (*((_QWORD *)&v15 + 1))
        {
          v7 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
          do
            v8 = __ldaxr(v7);
          while (__stlxr(v8 - 1, v7));
          if (!v8)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        v4 = (os_unfair_lock_s *)unk_253ECF618;
      }
      v9 = (std::__shared_weak_count *)off_253ECF620;
      if (off_253ECF620)
      {
        v10 = (unint64_t *)((char *)off_253ECF620 + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
      v12 = *((_QWORD *)this + 32);
      if (v12)
      {
        *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v15 + 1) = 0x40000000;
        v16 = ___ZN12TelephonyXPC18ClientStateTracker6removeEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke;
        v17 = &__block_descriptor_tmp_0;
        v18 = v4;
        v19 = v12;
        os_unfair_lock_lock(v4 + 4);
        ___ZN12TelephonyXPC18ClientStateTracker6removeEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke((uint64_t)&v15);
        os_unfair_lock_unlock(v4 + 4);
      }
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v14 = __ldaxr(p_shared_owners);
        while (__stlxr(v14 - 1, p_shared_owners));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      *((_QWORD *)this + 32) = 0;
      v2 = (const void *)*((_QWORD *)this + 30);
    }
    CFRelease(v2);
  }
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)this + 224);
  if (*((char *)this + 215) < 0)
    operator delete(*((void **)this + 24));
  if (*((char *)this + 191) < 0)
    operator delete(*((void **)this + 21));
  if (*((char *)this + 167) < 0)
    operator delete(*((void **)this + 18));
  *((_QWORD *)this + 9) = off_24C970148;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::XpcClient::~XpcClient(this);
}

{
  void *v1;

  TelephonyXPC::Client::State::~State(this);
  operator delete(v1);
}

void sub_20E5C4D00(void *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  __clang_call_terminate(a1);
}

void TelephonyXPC::Client::State::Parameters::~Parameters(void **this)
{
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void `non-virtual thunk to'TelephonyXPC::Client::State::~State(TelephonyXPC::Client::State *this)
{
  TelephonyXPC::Client::State::~State((TelephonyXPC::Client::State *)((char *)this - 72));
}

{
  void *v1;

  TelephonyXPC::Client::State::~State((TelephonyXPC::Client::State *)((char *)this - 72));
  operator delete(v1);
}

void TelephonyXPC::Client::create(void **a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  int v10;
  std::string::size_type v11;
  uint64_t v12;
  int v13;
  std::string::size_type v14;
  uint64_t v15;
  int v16;
  std::string::size_type v17;
  char *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  std::string *v37;
  unint64_t *v38;
  unint64_t v39;
  std::string *v40;
  _QWORD *v41;
  _QWORD *v42;
  CFAllocatorRef *v43;
  std::string *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  std::__shared_weak_count *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t *p_shared_weak_owners;
  unint64_t v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  NSObject *v61;
  _QWORD *v62;
  std::__shared_weak_count *v63;
  xpc_object_t object;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  std::string v69;
  std::string v70;
  std::string v71;
  __int128 __s;
  _BYTE v73[64];
  _QWORD **v74[5];
  _QWORD ***v75;
  xpc_object_t *block;
  const char *v77;
  _QWORD *(*v78)(uint64_t);
  void *v79;
  unint64_t v80;
  _QWORD *v81;

  v65 = 0xAAAAAAAAAAAAAAAALL;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a1;
  object = v4;
  v62 = a3;
  if (v4)
    xpc_retain(v4);
  else
    object = xpc_null_create();
  v6 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  v63 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v65 = 0;
  v66 = 0;
  if (MEMORY[0x212BC0184](object) != MEMORY[0x24BDACFA0])
    goto LABEL_8;
  __s = 0u;
  memset(v73, 0, 56);
  block = &object;
  v77 = "ServiceXPCName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, v74);
  xpc::dyn_cast_or_default();
  __s = *(_OWORD *)&v69.__r_.__value_.__l.__data_;
  *(_QWORD *)v73 = *((_QWORD *)&v69.__r_.__value_.__l + 2);
  *((_BYTE *)&v69.__r_.__value_.__s + 23) = 0;
  v69.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(v74[0]);
  block = &object;
  v77 = "ServiceNotificationName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, v74);
  xpc::dyn_cast_or_default();
  *(std::string *)&v73[8] = v69;
  *((_BYTE *)&v69.__r_.__value_.__s + 23) = 0;
  v69.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(v74[0]);
  block = &object;
  v77 = "ClientHostName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, v74);
  xpc::dyn_cast_or_default();
  *(std::string *)&v73[32] = v69;
  *((_BYTE *)&v69.__r_.__value_.__s + 23) = 0;
  v69.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(v74[0]);
  v9 = v73[7];
  v10 = v73[7];
  v11 = *((_QWORD *)&__s + 1);
  if (v73[7] < 0)
    v9 = *((_QWORD *)&__s + 1);
  if (!v9)
    goto LABEL_20;
  v12 = v73[31];
  v13 = v73[31];
  v14 = *(_QWORD *)&v73[16];
  if (v73[31] < 0)
    v12 = *(_QWORD *)&v73[16];
  if (!v12)
    goto LABEL_20;
  v15 = v73[55];
  v16 = v73[55];
  v17 = *(_QWORD *)&v73[40];
  if (v73[55] < 0)
    v15 = *(_QWORD *)&v73[40];
  if (!v15)
  {
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v18 = (char *)operator new(0x108uLL);
  if (v10 < 0)
  {
    std::string::__init_copy_ctor_external(&v69, (const std::string::value_type *)__s, v11);
  }
  else
  {
    *(_OWORD *)&v69.__r_.__value_.__l.__data_ = __s;
    v69.__r_.__value_.__r.__words[2] = *(_QWORD *)v73;
  }
  if (v13 < 0)
    std::string::__init_copy_ctor_external(&v70, *(const std::string::value_type **)&v73[8], v14);
  else
    v70 = *(std::string *)&v73[8];
  if (v16 < 0)
    std::string::__init_copy_ctor_external(&v71, *(const std::string::value_type **)&v73[32], v17);
  else
    v71 = *(std::string *)&v73[32];
  v67 = v6;
  v68 = v5;
  if (v5)
  {
    v35 = (unint64_t *)&v5->__shared_owners_;
    do
      v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
  }
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v37 = &v71;
  else
    v37 = (std::string *)v71.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(&block, (char *)v37);
  ctu::XpcClient::XpcClient();
  if (SHIBYTE(v78) < 0)
    operator delete(block);
  *((_QWORD *)v18 + 9) = off_24C970148;
  ctu::LoggerCommonBase::LoggerCommonBase();
  *((_QWORD *)v18 + 10) = &unk_24C970188;
  *((_QWORD *)v18 + 16) = v6;
  *((_QWORD *)v18 + 17) = v5;
  if (v5)
  {
    v38 = (unint64_t *)&v5->__shared_owners_;
    do
      v39 = __ldxr(v38);
    while (__stxr(v39 + 1, v38));
  }
  *(_QWORD *)v18 = &off_24C970068;
  *((_QWORD *)v18 + 9) = &unk_24C970098;
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)v18 + 6, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
  else
    *((std::string *)v18 + 6) = v69;
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)v18 + 7, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
  else
    *((std::string *)v18 + 7) = v70;
  v40 = (std::string *)(v18 + 192);
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v40, v71.__r_.__value_.__l.__data_, v71.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v40->__r_.__value_.__l.__data_ = *(_OWORD *)&v71.__r_.__value_.__l.__data_;
    *((_QWORD *)v18 + 26) = *((_QWORD *)&v71.__r_.__value_.__l + 2);
  }
  *((_QWORD *)v18 + 27) = 0;
  v41 = operator new(0x18uLL);
  v41[2] = 0;
  v41[1] = 0;
  *v41 = v41 + 1;
  *((_QWORD *)v18 + 28) = v41;
  v74[0] = (_QWORD **)v41;
  v42 = operator new(0x20uLL);
  *v42 = off_24C9701C8;
  v42[1] = 0;
  v42[2] = 0;
  v42[3] = v41;
  *((_QWORD *)v18 + 29) = v42;
  v74[0] = 0;
  std::unique_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::reset[abi:ne180100](v74);
  *((_DWORD *)v18 + 62) = 0;
  v43 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  *((_QWORD *)v18 + 32) = 0;
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &v70;
  else
    v44 = (std::string *)v70.__r_.__value_.__r.__words[0];
  *((_QWORD *)v18 + 30) = CFStringCreateWithCString(*v43, (const char *)v44, 0x600u);
  ctu::LoggerCommonBase::setLogLevel();
  v45 = (std::__shared_weak_count *)operator new(0x20uLL);
  v45->__shared_owners_ = 0;
  v46 = (unint64_t *)&v45->__shared_owners_;
  v45->__vftable = (std::__shared_weak_count_vtbl *)off_24C970240;
  v45->__shared_weak_owners_ = 0;
  v45[1].__vftable = (std::__shared_weak_count_vtbl *)v18;
  v47 = (std::__shared_weak_count *)*((_QWORD *)v18 + 2);
  if (!v47)
  {
    do
      v51 = __ldxr(v46);
    while (__stxr(v51 + 1, v46));
    p_shared_weak_owners = (unint64_t *)&v45->__shared_weak_owners_;
    do
      v53 = __ldxr(p_shared_weak_owners);
    while (__stxr(v53 + 1, p_shared_weak_owners));
    *((_QWORD *)v18 + 1) = v18;
    *((_QWORD *)v18 + 2) = v45;
    do
LABEL_91:
      v54 = __ldaxr(v46);
    while (__stlxr(v54 - 1, v46));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
    goto LABEL_94;
  }
  if (v47->__shared_owners_ == -1)
  {
    do
      v48 = __ldxr(v46);
    while (__stxr(v48 + 1, v46));
    v49 = (unint64_t *)&v45->__shared_weak_owners_;
    do
      v50 = __ldxr(v49);
    while (__stxr(v50 + 1, v49));
    *((_QWORD *)v18 + 1) = v18;
    *((_QWORD *)v18 + 2) = v45;
    std::__shared_weak_count::__release_weak(v47);
    goto LABEL_91;
  }
LABEL_94:
  v55 = (std::__shared_weak_count *)v66;
  v65 = (unint64_t)v18;
  v66 = (unint64_t)v45;
  if (v55)
  {
    v56 = (unint64_t *)&v55->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  v58 = v68;
  if (v68)
  {
    v59 = (unint64_t *)&v68->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v71.__r_.__value_.__l.__data_);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v69.__r_.__value_.__l.__data_);
  v19 = v65;
  v74[0] = (_QWORD **)MEMORY[0x24BDAC760];
  v74[1] = (_QWORD **)0x40000000;
  v74[2] = (_QWORD **)___ZN12TelephonyXPC6Client5State4initEv_block_invoke;
  v74[3] = (_QWORD **)&__block_descriptor_tmp_8;
  v74[4] = (_QWORD **)v65;
  v75 = v74;
  block = (xpc_object_t *)MEMORY[0x24BDAC760];
  v77 = (const char *)0x40000000;
  v78 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v79 = &__block_descriptor_tmp_9;
  v80 = v65 + 8;
  v81 = &v75;
  v61 = *(NSObject **)(v65 + 24);
  if (*(_QWORD *)(v65 + 32))
    dispatch_async_and_wait(v61, &block);
  else
    dispatch_sync(v61, &block);
LABEL_21:
  if ((v73[55] & 0x80000000) != 0)
    operator delete(*(void **)&v73[32]);
  if ((v73[31] & 0x80000000) != 0)
    operator delete(*(void **)&v73[8]);
  if ((v73[7] & 0x80000000) != 0)
    operator delete((void *)__s);
  if (!v19)
LABEL_8:
    syslog(3, "Could not create TelephonyXPCClient, verify parameters\n", v62);
  if (v63)
  {
    v20 = (unint64_t *)&v63->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  xpc_release(object);
  object = 0;
  v22 = operator new(0x10uLL);
  v23 = v22;
  v24 = v65;
  v25 = (std::__shared_weak_count *)v66;
  if (v66)
  {
    v26 = (unint64_t *)(v66 + 8);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
    *v22 = v24;
    v22[1] = v25;
    do
      v28 = __ldxr(v26);
    while (__stxr(v28 + 1, v26));
  }
  else
  {
    *v22 = v65;
    v22[1] = 0;
  }
  *v62 = v22;
  v29 = operator new(0x20uLL);
  *v29 = off_24C970690;
  v29[1] = 0;
  v29[2] = 0;
  v29[3] = v23;
  v62[1] = v29;
  if (v25)
  {
    v30 = (unint64_t *)&v25->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v32 = (std::__shared_weak_count *)v66;
  if (v66)
  {
    v33 = (unint64_t *)(v66 + 8);
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

void sub_20E5C5544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, char a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  uint64_t v35;
  void **v36;
  void **v37;
  uint64_t v38;

  if (*(char *)(v35 + 191) < 0)
    operator delete(*v37);
  if (*(char *)(v35 + 167) < 0)
    operator delete(*v36);
  *(_QWORD *)(v35 + 72) = v38;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)v35);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  TelephonyXPC::Client::State::Parameters::~Parameters(&a19);
  operator delete((void *)v35);
  TelephonyXPC::Client::State::Parameters::~Parameters(&a35);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

_QWORD *TelephonyXPC::Client::Client(_QWORD *result, _QWORD *a2)
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

void TelephonyXPC::Client::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t *v8;
  std::string v9;
  _QWORD v10[5];
  std::string __p;
  void *aBlock;
  dispatch_object_t object;

  v4 = *a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v9 = *(std::string *)a2;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(*(const void **)a3);
  else
    v5 = 0;
  v6 = *(NSObject **)(a3 + 8);
  if (v6)
    dispatch_retain(v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZN12TelephonyXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_61;
  v10[4] = v4;
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
  else
    __p = v9;
  if (v5)
    v7 = _Block_copy(v5);
  else
    v7 = 0;
  v8 = (uint64_t *)(v4 + 8);
  aBlock = v7;
  object = v6;
  if (v6)
    dispatch_retain(v6);
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v8, (uint64_t)v10);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_20E5C58FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void TelephonyXPC::Client::eventsOn(TelephonyXPC::Client *this)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)this;
  v2 = (uint64_t *)(*(_QWORD *)this + 8);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZN12TelephonyXPC6Client5State8eventsOnEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_62;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void TelephonyXPC::Client::perform(uint64_t *a1, uint64_t a2, uint64_t a3, void **a4)
{
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  xpc_object_t object;
  void *aBlock;
  dispatch_object_t v22;
  uint64_t v23;
  unint64_t v24;

  v23 = 0xAAAAAAAAAAAAAAAALL;
  v24 = 0xAAAAAAAAAAAAAAAALL;
  v8 = *(void **)a3;
  if (*(_QWORD *)a3)
    v8 = _Block_copy(v8);
  v9 = *(NSObject **)(a3 + 8);
  aBlock = v8;
  v22 = v9;
  if (v9)
    dispatch_retain(v9);
  v10 = *a4;
  object = v10;
  if (v10)
    xpc_retain(v10);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create(a2, (uint64_t)&aBlock, &object, &v23);
  xpc_release(object);
  object = 0;
  if (v22)
    dispatch_release(v22);
  if (aBlock)
    _Block_release(aBlock);
  v11 = *a1;
  v12 = v23;
  v13 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    v14 = (unint64_t *)(v24 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    TelephonyXPC::Client::State::perform(v11, v12, v13);
    do
      v16 = __ldaxr(v14);
    while (__stlxr(v16 - 1, v14));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  else
  {
    TelephonyXPC::Client::State::perform(v11, v23, 0);
  }
  v17 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    v18 = (unint64_t *)(v24 + 8);
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

void sub_20E5C5B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
  xpc_release(object);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void TelephonyXPC::Client::performWithBlockingSyncReply(uint64_t *a1, uint64_t a2, uint64_t a3, void **a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  TelephonyXPC::Command::State **v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string *v26;
  std::__shared_weak_count *v27;
  xpc_object_t object;
  void *aBlock;
  dispatch_object_t v30;
  unint64_t v31;
  unint64_t v32;
  std::string v33;
  __int128 buf;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t v37;
  TelephonyXPC::Command::State **v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  uint64_t v41;
  std::string __p;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  aBlock = 0;
  v30 = 0;
  v9 = *a4;
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create(a2, (uint64_t)&aBlock, &object, &v31);
  xpc_release(object);
  object = 0;
  if (v30)
    dispatch_release(v30);
  if (aBlock)
    _Block_release(aBlock);
  v10 = *a1;
  v12 = (TelephonyXPC::Command::State **)v31;
  v11 = (std::__shared_weak_count *)v32;
  v27 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v13 = (unint64_t *)(v32 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  if (v12)
  {
    memset(&v33, 170, sizeof(v33));
    TelephonyXPC::Command::State::name(*v12);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v26 = &v33;
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v26 = (std::string *)v33.__r_.__value_.__r.__words[0];
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_debug_impl(&dword_20E5C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Performing %s", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 1174405120;
    v35 = ___ZN12TelephonyXPC6Client5State28performWithBlockingSyncReplyENSt3__110shared_ptrINS_7CommandEEERNS_6ResultERN3xpc4dictE_block_invoke;
    v36 = &__block_descriptor_tmp_64;
    v37 = v10;
    v38 = v12;
    v39 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    v40 = a5;
    v41 = a3;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
    else
      __p = v33;
    v17 = *(NSObject **)(v10 + 32);
    if (v17)
    {
      dispatch_retain(*(dispatch_object_t *)(v10 + 32));
      if (dispatch_workloop_is_current())
        v35((uint64_t)&buf);
      else
        dispatch_sync(*(dispatch_queue_t *)(v10 + 24), &buf);
      dispatch_release(v17);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(v10 + 24), &buf);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v18 = v39;
    if (v39)
    {
      v19 = (unint64_t *)&v39->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
    v11 = v27;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_20E5C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "No command provided, exiting perform", (uint8_t *)&buf, 2u);
  }
  if (v11)
  {
    v21 = (unint64_t *)&v11->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v23 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v24 = (unint64_t *)(v32 + 8);
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

void sub_20E5C5ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12, uint64_t a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  NSObject *v36;
  uint64_t v37;

  dispatch_release(v36);
  if (a36 < 0)
    operator delete(__p);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v37 + 40);
  if (a21 < 0)
    operator delete(a16);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::eventsOff(TelephonyXPC::Client *this)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)this;
  v2 = (uint64_t *)(*(_QWORD *)this + 8);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZN12TelephonyXPC6Client5State9eventsOffEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_65;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void TelephonyXPC::Client::State::handleServerError_sync(uint64_t a1, xpc::object *a2)
{
  uint64_t v4;
  _QWORD *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  const char *p_block;
  xpc_object_t v14;
  xpc_object_t v15;
  const void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  uint64_t v32;
  void *aBlock;
  dispatch_object_t v34;
  xpc_object_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  _QWORD v42[2];
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t object;
  xpc_object_t v47;
  xpc_object_t v48;
  __int128 block;
  __int128 v50;
  __int128 v51;
  unint64_t v52;

  v4 = *(_QWORD *)(a1 + 224);
  std::string::basic_string[abi:ne180100]<0>(&block, "EventServerStateChange");
  v5 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(v4, &block);
  if (SBYTE7(v50) < 0)
    operator delete((void *)block);
  if ((_QWORD *)(*(_QWORD *)(a1 + 224) + 8) != v5)
  {
    v48 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    v6 = xpc_dictionary_create(0, 0, 0);
    v7 = v6;
    v8 = MEMORY[0x24BDACFA0];
    if (v6)
    {
      v48 = v6;
    }
    else
    {
      v7 = xpc_null_create();
      v48 = v7;
      if (!v7)
      {
        v9 = xpc_null_create();
        v7 = 0;
        goto LABEL_11;
      }
    }
    if (MEMORY[0x212BC0184](v7) == v8)
    {
      xpc_retain(v7);
      goto LABEL_12;
    }
    v9 = xpc_null_create();
LABEL_11:
    v48 = v9;
LABEL_12:
    xpc_release(v7);
    v47 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = v10;
    if (v10)
    {
      v47 = v10;
    }
    else
    {
      v11 = xpc_null_create();
      v47 = v11;
      if (!v11)
      {
        v12 = xpc_null_create();
        v11 = 0;
        goto LABEL_19;
      }
    }
    if (MEMORY[0x212BC0184](v11) == v8)
    {
      xpc_retain(v11);
LABEL_20:
      xpc_release(v11);
      v45 = xpc_string_create("ServerStateError");
      if (!v45)
        v45 = xpc_null_create();
      *(_QWORD *)&block = &v47;
      *((_QWORD *)&block + 1) = "KeyServerState";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v45, &object);
      xpc_release(object);
      object = 0;
      xpc_release(v45);
      v45 = 0;
      xpc::object::to_string(a2);
      if ((SBYTE7(v50) & 0x80u) == 0)
        p_block = (const char *)&block;
      else
        p_block = (const char *)block;
      v43 = xpc_string_create(p_block);
      if (!v43)
        v43 = xpc_null_create();
      v42[0] = &v47;
      v42[1] = "KeyErrorString";
      xpc::dict::object_proxy::operator=((uint64_t)v42, &v43, &v44);
      xpc_release(v44);
      v44 = 0;
      xpc_release(v43);
      v43 = 0;
      if (SBYTE7(v50) < 0)
        operator delete((void *)block);
      v40 = xpc_string_create("eventNotification");
      if (!v40)
        v40 = xpc_null_create();
      *(_QWORD *)&block = &v48;
      *((_QWORD *)&block + 1) = "command";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v40, &v41);
      xpc_release(v41);
      v41 = 0;
      xpc_release(v40);
      v40 = 0;
      v38 = xpc_string_create("EventServerStateChange");
      if (!v38)
        v38 = xpc_null_create();
      *(_QWORD *)&block = &v48;
      *((_QWORD *)&block + 1) = "event";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v38, &v39);
      xpc_release(v39);
      v39 = 0;
      xpc_release(v38);
      v38 = 0;
      v14 = v47;
      if (v47)
        xpc_retain(v47);
      else
        v14 = xpc_null_create();
      xpc_dictionary_set_value(v48, "eventData", v14);
      v15 = xpc_null_create();
      xpc_release(v14);
      xpc_release(v15);
      v35 = v48;
      if (v48)
        xpc_retain(v48);
      else
        v35 = xpc_null_create();
      aBlock = 0;
      v34 = 0;
      TelephonyXPC::Event::create(&v35, (uint64_t)&aBlock, &v36);
      v16 = (const void *)v5[7];
      if (v16)
        v17 = _Block_copy(v16);
      else
        v17 = 0;
      v18 = v5[8];
      *(_QWORD *)&block = MEMORY[0x24BDAC760];
      *((_QWORD *)&block + 1) = 1174405120;
      *(_QWORD *)&v50 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
      *((_QWORD *)&v50 + 1) = &__block_descriptor_tmp_67;
      if (v17)
        v19 = _Block_copy(v17);
      else
        v19 = 0;
      *(_QWORD *)&v51 = v19;
      *((_QWORD *)&v51 + 1) = v36;
      v52 = (unint64_t)v37;
      if (v37)
      {
        p_shared_owners = (unint64_t *)&v37->__shared_owners_;
        do
          v21 = __ldxr(p_shared_owners);
        while (__stxr(v21 + 1, p_shared_owners));
      }
      dispatch_async(v18, &block);
      v22 = (std::__shared_weak_count *)v52;
      if (v52)
      {
        v23 = (unint64_t *)(v52 + 8);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if ((_QWORD)v51)
        _Block_release((const void *)v51);
      if (v17)
        _Block_release(v17);
      v25 = v37;
      if (v37)
      {
        v26 = (unint64_t *)&v37->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      if (v34)
        dispatch_release(v34);
      if (aBlock)
        _Block_release(aBlock);
      xpc_release(v35);
      v35 = 0;
      xpc_release(v47);
      xpc_release(v48);
      goto LABEL_67;
    }
    v12 = xpc_null_create();
LABEL_19:
    v47 = v12;
    goto LABEL_20;
  }
LABEL_67:
  if (*(_QWORD *)a2 != MEMORY[0x24BDACF48])
  {
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
    {
      v52 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v50 = v28;
      v51 = v28;
      block = v28;
      v29 = ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
      MEMORY[0x212BBFE3C](v29, "Destroy server connection");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](&block);
    }
    v30 = *(_DWORD *)(a1 + 248);
    if (v30)
    {
      *(_DWORD *)(a1 + 248) = v30 - 1;
      ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
      if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
      {
        v52 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v50 = v31;
        v51 = v31;
        block = v31;
        v32 = ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
        MEMORY[0x212BBFE3C](v32, "Extra decreased to ");
        ctu::operator<<();
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x212BBFDD0](&block);
      }
      if (!*(_DWORD *)(a1 + 248))
      {
        TelephonyXPC::Client::State::destroyConnection_sync((TelephonyXPC::Client::State *)a1);
        TelephonyXPC::Client::State::handleServerReady_sync((TelephonyXPC::Client::State *)a1);
      }
    }
    else
    {
      TelephonyXPC::Client::State::destroyConnection_sync((TelephonyXPC::Client::State *)a1);
    }
  }
}

void sub_20E5C65A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BBFDD0](v1 - 112);
  _Unwind_Resume(a1);
}

void sub_20E5C65C4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,xpc_object_t a25)
{
  uint64_t v25;

  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a10);
  xpc_release(object);
  object = 0;
  xpc_release(a25);
  xpc_release(*(xpc_object_t *)(v25 - 120));
  JUMPOUT(0x20E5C65B0);
}

uint64_t ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(a1 - 24), *(_QWORD *)(a1 - 16));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 - 24);
    a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 - 8);
  }
}

uint64_t ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

uint64_t ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
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
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

void ___ZN12TelephonyXPC18ClientStateTracker6removeEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  char *v3;
  _QWORD *v4;
  std::__shared_weak_count *v5;
  char *v6;
  const void *v7;
  size_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(char **)(v1 + 32);
  if (*(char **)(v1 + 24) == v2)
  {
    v3 = *(char **)(v1 + 24);
  }
  else
  {
    v3 = *(char **)(v1 + 24);
    while (*(_QWORD *)v3 != *(_QWORD *)(a1 + 40))
    {
      v3 += 8;
      if (v3 == v2)
      {
        v3 = *(char **)(v1 + 32);
        break;
      }
    }
  }
  if (v3 != v2)
  {
    v4 = *(_QWORD **)v3;
    if (*(_QWORD *)v3)
    {
      v5 = (std::__shared_weak_count *)v4[1];
      if (v5)
        std::__shared_weak_count::__release_weak(v5);
      operator delete(v4);
      v2 = *(char **)(v1 + 32);
    }
    v6 = v3;
    v7 = v3 + 8;
    v8 = v2 - (v3 + 8);
    if (v8)
      memmove(v6, v7, v8);
    *(_QWORD *)(v1 + 32) = &v6[v8];
  }
}

_QWORD *ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24C970148;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24C970148;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
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
  __cxa_throw(exception, (struct type_info *)off_24C96FCA0, MEMORY[0x24BEDAAF0]);
}

void sub_20E5C6938(_Unwind_Exception *a1)
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

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::__on_zero_shared(uint64_t a1)
{
  _QWORD **v1;

  v1 = *(_QWORD ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 24);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::unique_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::reset[abi:ne180100](_QWORD ***a1)
{
  _QWORD **v1;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ___ZN12TelephonyXPC6Client5State4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  std::__shared_weak_count_vtbl *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  os_unfair_lock_s *v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  void *__p[2];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;

  v1 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  v2 = (os_unfair_lock_s *)unk_253ECF618;
  if (!unk_253ECF618)
  {
    v3 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
    *(_OWORD *)&v3->__on_zero_shared = 0u;
    *(_OWORD *)&v3->__on_zero_shared_weak = 0u;
    *(_OWORD *)&v3->~__shared_weak_count = 0u;
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&v30, v3);
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::operator=[abi:ne180100](&v30);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v2 = (os_unfair_lock_s *)unk_253ECF618;
  }
  *(_QWORD *)&v28 = v2;
  *((_QWORD *)&v28 + 1) = off_253ECF620;
  if (off_253ECF620)
  {
    v7 = (unint64_t *)((char *)off_253ECF620 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  v9 = *(std::__shared_weak_count **)(v1 + 16);
  if (!v9 || (v10 = *(_QWORD *)(v1 + 8), (v11 = std::__shared_weak_count::lock(v9)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v12 = v11;
  if (v10)
  {
    *(_QWORD *)&v30 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v30 + 1) = 1174405120;
    *(_QWORD *)&v31 = ___ZN12TelephonyXPC18ClientStateTracker6insertENSt3__110shared_ptrINS_6Client5StateEEE_block_invoke;
    *((_QWORD *)&v31 + 1) = &__block_descriptor_tmp_11;
    *(_QWORD *)&v32 = v2;
    *((_QWORD *)&v32 + 1) = v10;
    v33 = (unint64_t)v11;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    v15 = v2 + 4;
    os_unfair_lock_lock(v2 + 4);
    v16 = ___ZN12TelephonyXPC18ClientStateTracker6insertENSt3__110shared_ptrINS_6Client5StateEEE_block_invoke(&v30);
    os_unfair_lock_unlock(v15);
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)(v1 + 256) = v16;
  v18 = (unint64_t *)&v12->__shared_owners_;
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  if (*((_QWORD *)&v28 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v28 + 1) + 16))(*((_QWORD *)&v28 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v28 + 1));
    }
  }
  if (*(_QWORD *)(v1 + 256))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(v1 + 256), (CFNotificationCallback)TelephonyXPC::Client::State::handleDaemonReadyNotificationStatic, *(CFStringRef *)(v1 + 240), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      v33 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v31 = v23;
      v32 = v23;
      v30 = v23;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v30);
      v24 = MEMORY[0x212BBFE3C](&v30, "Watching for notification: ");
      v28 = 0uLL;
      v29 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = 0uLL;
      v27 = 0;
      MEMORY[0x212BBFE48](v24, __p);
      if (SHIBYTE(v27) < 0)
        operator delete(__p[0]);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](&v30);
    }
    TelephonyXPC::Client::State::connect_sync((TelephonyXPC::Client::State *)v1);
  }
  else
  {
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 80))
    {
      v33 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v31 = v25;
      v32 = v25;
      v30 = v25;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v30);
      MEMORY[0x212BBFE3C](&v30, "ClientStateTracker unable to insert state pointer");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](&v30);
    }
  }
}

void sub_20E5C6EBC(_Unwind_Exception *a1, void *a2, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  if (a7 < 0)
    operator delete(a2);
  MEMORY[0x212BBFDD0](va);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::handleDaemonReadyNotificationStatic(TelephonyXPC::Client::State *this, __CFNotificationCenter *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  os_unfair_lock_s *v7;
  std::__shared_weak_count_vtbl *v8;
  std::__shared_weak_count *shared_owners;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count_vtbl *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  std::__shared_weak_count v23;
  void *v24;
  unint64_t v25;
  __CFNotificationCenter *v26;

  v21 = 0xAAAAAAAAAAAAAAAALL;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  v7 = (os_unfair_lock_s *)unk_253ECF618;
  if (!unk_253ECF618)
  {
    v8 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
    *(_OWORD *)&v8->__on_zero_shared = 0u;
    *(_OWORD *)&v8->__on_zero_shared_weak = 0u;
    *(_OWORD *)&v8->~__shared_weak_count = 0u;
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&v23, v8);
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::operator=[abi:ne180100]((__int128 *)&v23);
    shared_owners = (std::__shared_weak_count *)v23.__shared_owners_;
    if (v23.__shared_owners_)
    {
      v10 = (unint64_t *)(v23.__shared_owners_ + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))shared_owners->__on_zero_shared)(shared_owners);
        std::__shared_weak_count::__release_weak(shared_owners);
      }
    }
    v7 = (os_unfair_lock_s *)unk_253ECF618;
  }
  v12 = (std::__shared_weak_count *)off_253ECF620;
  if (off_253ECF620)
  {
    v13 = (unint64_t *)((char *)off_253ECF620 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  v15 = (std::__shared_weak_count_vtbl *)MEMORY[0x24BDAC760];
  if (a2)
  {
    v23.__vftable = (std::__shared_weak_count_vtbl *)MEMORY[0x24BDAC760];
    v23.__shared_owners_ = 0x40000000;
    v23.__shared_weak_owners_ = (uint64_t)___ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke;
    v24 = &__block_descriptor_tmp_14;
    v25 = (unint64_t)v7;
    v26 = a2;
    os_unfair_lock_lock(v7 + 4);
    ___ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke(&v23, &v21);
    os_unfair_lock_unlock(v7 + 4);
    if (!v12)
      goto LABEL_19;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    if (!v12)
      goto LABEL_19;
  }
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_19:
  if (v21)
  {
    v23.__vftable = v15;
    v23.__shared_owners_ = 0x40000000;
    v23.__shared_weak_owners_ = (uint64_t)___ZN12TelephonyXPC6Client5State17handleDaemonReadyEv_block_invoke;
    v24 = &__block_descriptor_tmp_17;
    v25 = v21;
    ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v21 + 8), (uint64_t)&v23);
  }
  v18 = (std::__shared_weak_count *)v22;
  if (v22)
  {
    v19 = (unint64_t *)(v22 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

void sub_20E5C7120(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::connect_sync(TelephonyXPC::Client::State *this)
{
  ctu::LoggerCommonBase *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  const char *v7;
  xpc_connection_t mach_service;
  xpc_object_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_weak_owners;
  unint64_t v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  xpc_object_t v26;
  xpc_object_t object[2];
  __int128 v28;
  __int128 v29;
  std::__shared_weak_count *v30;
  void *aBlock;
  void *v32[2];
  char v33;
  uint64_t v34;
  std::__shared_weak_count *v35;

  v2 = (TelephonyXPC::Client::State *)((char *)this + 80);
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))this + 10))(v2, 40))
  {
    v30 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v3;
    v29 = v3;
    *(_OWORD *)object = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
    v4 = MEMORY[0x212BBFE3C](object, "Started on name '");
    v5 = MEMORY[0x212BBFE48](v4, (char *)this + 144);
    MEMORY[0x212BBFE3C](v5, "'");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](object);
  }
  ctu::LoggerCommonBase::getLogLevel(v2);
  if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v2)(v2, 20))
  {
    v30 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v6;
    v29 = v6;
    *(_OWORD *)object = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
    MEMORY[0x212BBFE3C](object, "Create server connection");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](object);
  }
  v7 = (char *)this + 144;
  if (*((char *)this + 167) < 0)
    v7 = *(const char **)v7;
  mach_service = xpc_connection_create_mach_service(v7, *((dispatch_queue_t *)this + 3), 2uLL);
  if (mach_service)
  {
    v9 = mach_service;
    object[0] = mach_service;
LABEL_10:
    xpc_retain(v9);
    goto LABEL_11;
  }
  v9 = xpc_null_create();
  object[0] = v9;
  if (v9)
    goto LABEL_10;
  v9 = 0;
  object[0] = xpc_null_create();
LABEL_11:
  ctu::XpcClient::setServer_sync();
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9);
  if (*((_DWORD *)this + 54))
  {
    ctu::LoggerCommonBase::getLogLevel(v2);
    if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v2)(v2, 20))
    {
      v30 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v28 = v10;
      v29 = v10;
      *(_OWORD *)object = v10;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
      v11 = MEMORY[0x212BBFE3C](object, "Checked in state is ");
      v12 = v11;
      v13 = *((int *)this + 54);
      if (v13 <= 2)
        MEMORY[0x212BBFE3C](v11, off_24C9706F8[v13]);
      MEMORY[0x212BBFE3C](v12, ", skipping");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](object);
    }
  }
  else
  {
    TelephonyXPC::Client::State::changeCheckInState_sync((uint64_t)this, 1u);
    v14 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v14 || (v15 = *((_QWORD *)this + 1), (v16 = std::__shared_weak_count::lock(v14)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v17 = v16;
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v19 = __ldxr(p_shared_weak_owners);
    while (__stxr(v19 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v17);
    }
    std::string::basic_string[abi:ne180100]<0>(v32, "checkIn");
    object[0] = (xpc_object_t)MEMORY[0x24BDAC760];
    object[1] = (xpc_object_t)1174405120;
    *(_QWORD *)&v28 = ___ZN12TelephonyXPC6Client5State12checkIn_syncEv_block_invoke;
    *((_QWORD *)&v28 + 1) = &__block_descriptor_tmp_24;
    *(_QWORD *)&v29 = this;
    *((_QWORD *)&v29 + 1) = v15;
    v30 = v17;
    do
      v22 = __ldxr(p_shared_weak_owners);
    while (__stxr(v22 + 1, p_shared_weak_owners));
    aBlock = _Block_copy(object);
    v26 = xpc_null_create();
    TelephonyXPC::Client::State::createCommand_sync(&v34, (uint64_t)this, (uint64_t)v32, &aBlock, &v26);
    TelephonyXPC::Client::State::perform_sync((uint64_t)this, &v34);
    v23 = v35;
    if (v35)
    {
      v24 = (unint64_t *)&v35->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    xpc_release(v26);
    v26 = 0;
    if (aBlock)
      _Block_release(aBlock);
    if (v33 < 0)
      operator delete(v32[0]);
    if (v30)
      std::__shared_weak_count::__release_weak(v30);
    std::__shared_weak_count::__release_weak(v17);
  }
  if (*((_DWORD *)this + 55))
  {
    TelephonyXPC::Client::State::changeEventsState_sync((uint64_t)this, 0);
    TelephonyXPC::Client::State::eventsOn_sync(this);
  }
}

void sub_20E5C74F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  std::__shared_weak_count *v17;
  const void *v18;
  uint64_t v19;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v19 - 48);
  xpc_release(object);
  if (v18)
    _Block_release(v18);
  if (a17)
    std::__shared_weak_count::__release_weak(a17);
  if (*(char *)(v19 - 49) < 0)
    operator delete(*(void **)(v19 - 72));
  std::__shared_weak_count::__release_weak(v17);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c55_ZTSNSt3__110shared_ptrIN12TelephonyXPC6Client5StateEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c55_ZTSNSt3__110shared_ptrIN12TelephonyXPC6Client5StateEEE(uint64_t a1)
{
  return std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 40);
}

void std::vector<std::weak_ptr<TelephonyXPC::Client::State> *,std::allocator<std::weak_ptr<TelephonyXPC::Client::State> *>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void ___ZN12TelephonyXPC6Client5State17handleDaemonReadyEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  unint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
  {
    v7 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5 = v2;
    v6 = v2;
    v4 = v2;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v4);
    MEMORY[0x212BBFE3C](&v4, "Daemon ready received");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](&v4);
  }
  if (MEMORY[0x212BC0184](*(_QWORD *)(v1 + 40)) == MEMORY[0x24BDACF88])
  {
    ++*(_DWORD *)(v1 + 248);
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      v7 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v5 = v3;
      v6 = v3;
      v4 = v3;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v4);
      MEMORY[0x212BBFE3C](&v4, "Extra increased to ");
      ctu::operator<<();
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x212BBFDD0](&v4);
    }
  }
  else
  {
    TelephonyXPC::Client::State::handleServerReady_sync((TelephonyXPC::Client::State *)v1);
  }
}

void sub_20E5C78F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x212BBFDD0](&a9);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::handleServerReady_sync(TelephonyXPC::Client::State *this)
{
  char *v2;
  __int128 v3;
  _OWORD v4[3];
  unint64_t v5;

  v2 = (char *)this + 80;
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))(v2, 20))
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v4[1] = v3;
    v4[2] = v3;
    v4[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v4);
    MEMORY[0x212BBFE3C](v4, "Server ready");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](v4);
  }
  TelephonyXPC::Client::State::connect_sync(this);
}

void ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(uint64_t *a1, uint64_t a2)
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
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_18;
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

uint64_t TelephonyXPC::Client::State::changeEventsState_sync(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[3];
  unint64_t v12;

  v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  result = (**(uint64_t (***)(uint64_t, uint64_t))(a1 + 80))(v4, 40);
  if ((_DWORD)result)
  {
    v12 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = v6;
    v11[2] = v6;
    v11[0] = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v11);
    v7 = MEMORY[0x212BBFE3C](v11, "Changing event state from ");
    v8 = v7;
    v9 = *(int *)(a1 + 220);
    if (v9 <= 2)
      MEMORY[0x212BBFE3C](v7, off_24C970710[v9]);
    v10 = MEMORY[0x212BBFE3C](v8, " to ");
    if (a2 <= 2)
      MEMORY[0x212BBFE3C](v10, off_24C970710[a2]);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    result = MEMORY[0x212BBFDD0](v11);
  }
  *(_DWORD *)(a1 + 220) = a2;
  return result;
}

void TelephonyXPC::Client::State::eventsOn_sync(TelephonyXPC::Client::State *this)
{
  int v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[3];
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  xpc_object_t object;
  _QWORD aBlock[6];
  std::__shared_weak_count *v31;
  void *v32;
  void *v33[2];
  char v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  v2 = *((_DWORD *)this + 55);
  if (v2 == 1)
    goto LABEL_4;
  if (!v2)
  {
    TelephonyXPC::Client::State::changeEventsState_sync((uint64_t)this, 1u);
LABEL_4:
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v3 || (v4 = *((_QWORD *)this + 1), (v5 = std::__shared_weak_count::lock(v3)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v6 = v5;
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v6);
    }
    std::string::basic_string[abi:ne180100]<0>(v33, "eventsOn");
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TelephonyXPC6Client5State13eventsOn_syncEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_59;
    aBlock[4] = this;
    aBlock[5] = v4;
    v31 = v6;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
    v32 = _Block_copy(aBlock);
    v12 = (std::__shared_weak_count *)*((_QWORD *)this + 29);
    v27 = *((_QWORD *)this + 28);
    v28 = v12;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    TelephonyXPC::Client::State::convert_sync(&object, (uint64_t)this, (uint64_t)&v27);
    TelephonyXPC::Client::State::createCommand_sync(&v35, (uint64_t)this, (uint64_t)v33, &v32, &object);
    TelephonyXPC::Client::State::perform_sync((uint64_t)this, &v35);
    v15 = v36;
    if (v36)
    {
      v16 = (unint64_t *)&v36->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    xpc_release(object);
    object = 0;
    v18 = v28;
    if (v28)
    {
      v19 = (unint64_t *)&v28->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (v32)
      _Block_release(v32);
    if (v34 < 0)
      operator delete(v33[0]);
    if (v31)
      std::__shared_weak_count::__release_weak(v31);
    std::__shared_weak_count::__release_weak(v6);
    return;
  }
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))((char *)this + 80, 20))
  {
    v26 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25[1] = v21;
    v25[2] = v21;
    v25[0] = v21;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v25);
    v22 = MEMORY[0x212BBFE3C](v25, "Events state is ");
    v23 = v22;
    v24 = *((int *)this + 55);
    if (v24 <= 2)
      MEMORY[0x212BBFE3C](v22, off_24C970710[v24]);
    MEMORY[0x212BBFE3C](v23, ", skipping");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](v25);
  }
}

uint64_t TelephonyXPC::Client::State::changeCheckInState_sync(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[3];
  unint64_t v12;

  v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  result = (**(uint64_t (***)(uint64_t, uint64_t))(a1 + 80))(v4, 40);
  if ((_DWORD)result)
  {
    v12 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = v6;
    v11[2] = v6;
    v11[0] = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v11);
    v7 = MEMORY[0x212BBFE3C](v11, "Changing checked in state from ");
    v8 = v7;
    v9 = *(int *)(a1 + 216);
    if (v9 <= 2)
      MEMORY[0x212BBFE3C](v7, off_24C9706F8[v9]);
    v10 = MEMORY[0x212BBFE3C](v8, " to ");
    if (a2 <= 2)
      MEMORY[0x212BBFE3C](v10, off_24C9706F8[a2]);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    result = MEMORY[0x212BBFDD0](v11);
  }
  *(_DWORD *)(a1 + 216) = a2;
  return result;
}

void TelephonyXPC::Client::State::createCommand_sync(_QWORD *a1, uint64_t a2, uint64_t a3, void **a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  xpc_object_t object;
  void *v24;
  dispatch_object_t v25;
  __int128 v26;
  _QWORD aBlock[4];
  void *v28;
  unint64_t v29;
  const char *v30;
  xpc_object_t v31;
  xpc_object_t v32;

  v10 = MEMORY[0x212BC0184](*a5);
  v11 = MEMORY[0x24BDACFA0];
  if (v10 != MEMORY[0x24BDACFA0])
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    if (v12 || (v12 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x212BC0184](v12) == v11)
      {
        xpc_retain(v12);
        v13 = v12;
      }
      else
      {
        v13 = xpc_null_create();
      }
    }
    else
    {
      v13 = xpc_null_create();
      v12 = 0;
    }
    xpc_release(v12);
    v14 = xpc_null_create();
    v15 = (void *)*a5;
    *a5 = v13;
    xpc_release(v15);
    xpc_release(v14);
  }
  v16 = (const char *)(a2 + 192);
  if (*(char *)(a2 + 215) < 0)
    v16 = *(const char **)v16;
  v31 = xpc_string_create(v16);
  if (!v31)
    v31 = xpc_null_create();
  v29 = (unint64_t)a5;
  v30 = "clientName";
  xpc::dict::object_proxy::operator=((uint64_t)&v29, &v31, &v32);
  xpc_release(v32);
  v32 = 0;
  xpc_release(v31);
  v31 = 0;
  *a1 = 0;
  a1[1] = 0;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = (const char *)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke;
  aBlock[3] = &__block_descriptor_tmp_51;
  v17 = *a4;
  if (*a4)
    v17 = _Block_copy(v17);
  v28 = v17;
  v18 = _Block_copy(aBlock);
  v19 = *(NSObject **)(a2 + 24);
  if (v19)
    dispatch_retain(v19);
  v29 = (unint64_t)v18;
  v30 = (const char *)v19;
  if (v18)
    v20 = _Block_copy(v18);
  else
    v20 = 0;
  v24 = v20;
  v25 = v19;
  if (v19)
    dispatch_retain(v19);
  v21 = (void *)*a5;
  object = v21;
  if (v21)
    xpc_retain(v21);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create(a3, (uint64_t)&v24, &object, &v26);
  v22 = v26;
  v26 = 0uLL;
  *(_OWORD *)a1 = v22;
  xpc_release(object);
  object = 0;
  if (v25)
    dispatch_release(v25);
  if (v24)
    _Block_release(v24);
  if (v19)
    dispatch_release(v19);
  if (v18)
    _Block_release(v18);
  if (v28)
    _Block_release(v28);
}

void sub_20E5C827C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock,char a21)
{
  uint64_t v21;

  xpc_release(object);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a11);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a21);
  if (aBlock)
    _Block_release(aBlock);
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v21);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State12checkIn_syncEv_block_invoke(_QWORD *a1, _DWORD *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (a1[5] && !*a2)
        TelephonyXPC::Client::State::changeCheckInState_sync(v5, 2u);
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
  }
}

void sub_20E5C8384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t TelephonyXPC::Result::describe(TelephonyXPC::Result *this, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  char *v11;
  void **v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  TelephonyXPC::Result *v23;
  void *__p[2];
  unsigned __int8 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32[2];
  __int128 v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v44 = v4;
  v43 = v4;
  v42 = v4;
  v41 = v4;
  v40 = v4;
  v39 = v4;
  v38 = v4;
  v37 = v4;
  v36 = v4;
  *(_OWORD *)v32 = v4;
  v33 = v4;
  v30 = v4;
  v31 = v4;
  v28 = v4;
  v29 = v4;
  v5 = MEMORY[0x24BEDB870];
  v6 = MEMORY[0x24BEDB870] + 64;
  v35 = MEMORY[0x24BEDB870] + 64;
  v7 = (uint64_t *)MEMORY[0x24BEDB800];
  v8 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v27 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v27 + *(_QWORD *)(v27 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v27 + *(_QWORD *)(v27 - 24));
  std::ios_base::init(v9, &v28);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v27 = v5 + 24;
  v35 = v6;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v28 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)v32 = 0u;
  v33 = 0u;
  LODWORD(v34) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"Result:'", 8);
  switch(*(_DWORD *)a2)
  {
    case 0xE020E000:
      v11 = "kInternalError";
      break;
    case 0xE020E001:
      v11 = "kServerError";
      break;
    case 0xE020E002:
      v11 = "kCommandError";
      break;
    case 0xE020E003:
      v11 = "kTimeout";
      break;
    case 0xE020E004:
      v11 = "kNotSupported";
      break;
    case 0xE020E005:
      v11 = "kRetry";
      break;
    case 0xE020E006:
      v11 = "kPermissionDenied";
      break;
    case 0xE020E007:
      v11 = "kNotAvailable";
      break;
    default:
      if (*(_DWORD *)a2)
        v11 = "kInvalidErrorCode";
      else
        v11 = "kSuccess";
      break;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v11);
  if ((v26 & 0x80u) == 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  if ((v26 & 0x80u) == 0)
    v13 = v26;
  else
    v13 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v12, v13);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"'", 1);
  if ((char)v26 < 0)
    operator delete(__p[0]);
  if (*(char *)(a2 + 31) < 0)
  {
    if (!*(_QWORD *)(a2 + 16))
      goto LABEL_32;
  }
  else if (!*(_BYTE *)(a2 + 31))
  {
    goto LABEL_32;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" Info:'", 7);
  v14 = *(char *)(a2 + 31);
  if (v14 >= 0)
    v15 = a2 + 8;
  else
    v15 = *(_QWORD *)(a2 + 8);
  if (v14 >= 0)
    v16 = *(unsigned __int8 *)(a2 + 31);
  else
    v16 = *(_QWORD *)(a2 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, v15, v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"'", 1);
LABEL_32:
  if ((v34 & 0x10) != 0)
  {
    v18 = *((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1) < (unint64_t)v31)
    {
      *((_QWORD *)&v33 + 1) = v31;
      v18 = v31;
    }
    v19 = (const void **)&v30 + 1;
  }
  else
  {
    if ((v34 & 8) == 0)
    {
      v17 = 0;
      *((_BYTE *)this + 23) = 0;
      goto LABEL_47;
    }
    v19 = (const void **)&v29;
    v18 = v30;
  }
  v20 = *v19;
  v17 = v18 - (_QWORD)*v19;
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v17 >= 0x17)
  {
    v21 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v21 = v17 | 7;
    v22 = v21 + 1;
    v23 = (TelephonyXPC::Result *)operator new(v21 + 1);
    *((_QWORD *)this + 1) = v17;
    *((_QWORD *)this + 2) = v22 | 0x8000000000000000;
    *(_QWORD *)this = v23;
    this = v23;
    goto LABEL_46;
  }
  *((_BYTE *)this + 23) = v17;
  if (v17)
LABEL_46:
    memmove(this, v20, v17);
LABEL_47:
  *((_BYTE *)this + v17) = 0;
  v27 = *v7;
  *(uint64_t *)((char *)&v27 + *(_QWORD *)(v27 - 24)) = v7[3];
  *(_QWORD *)&v28 = v10 + 16;
  if (SBYTE7(v33) < 0)
    operator delete(v32[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BBFF80](&v35);
}

void sub_20E5C8724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::send_sync(uint64_t a1, xpc_object_t *a2)
{
  if (MEMORY[0x212BC0184](*(_QWORD *)(a1 + 40)) == MEMORY[0x24BDACF88])
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *a2);
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
  MEMORY[0x212BBFF80](a1 + 112);
  return a1;
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
  MEMORY[0x212BBFEF0](v23, a1);
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
  MEMORY[0x212BBFEFC](v23);
  return a1;
}

void sub_20E5C8A80(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x212BBFEFC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20E5C8A50);
}

void sub_20E5C8AE0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke(uint64_t a1, int *a2, void **a3)
{
  uint64_t v4;
  void *v5;
  xpc_object_t object;
  int v7;
  std::string __p;

  v4 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  if (*((char *)a2 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
  else
    __p = *(std::string *)(a2 + 2);
  v5 = *a3;
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v4 + 16))(v4, &v7, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5C8BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZN12TelephonyXPC6Client5State13eventsOn_syncEv_block_invoke(_QWORD *a1, _DWORD *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (a1[5] && !*a2)
        TelephonyXPC::Client::State::changeEventsState_sync(v5, 2u);
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
  }
}

void sub_20E5C8CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::convert_sync(xpc_object_t *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  _QWORD *v12;
  _QWORD *v13;
  const char *v14;
  xpc_object_t v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  xpc_object_t v19;
  xpc_object_t v20;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  *a1 = xpc_null_create();
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x212BC0184](v6) == MEMORY[0x24BDACFA0])
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
    v8 = xpc_null_create();
    v9 = *a1;
    *a1 = v7;
    xpc_release(v9);
    xpc_release(v8);
    v10 = xpc_array_create(0, 0);
    if (v10 || (v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x212BC0184](v10) == MEMORY[0x24BDACF78])
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
    v12 = *(_QWORD **)(a2 + 224);
    v13 = (_QWORD *)*v12;
    if ((_QWORD *)*v12 != v12 + 1)
    {
      do
      {
        v14 = (const char *)(v13 + 4);
        if (*((char *)v13 + 55) < 0)
          v14 = *(const char **)v14;
        v15 = xpc_string_create(v14);
        if (!v15)
          v15 = xpc_null_create();
        xpc_array_append_value(v11, v15);
        xpc_release(v15);
        v16 = (_QWORD *)v13[1];
        if (v16)
        {
          do
          {
            v17 = v16;
            v16 = (_QWORD *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (_QWORD *)v13[2];
            v18 = *v17 == (_QWORD)v13;
            v13 = v17;
          }
          while (!v18);
        }
        v13 = v17;
      }
      while (v17 != (_QWORD *)(*(_QWORD *)(a2 + 224) + 8));
    }
    if (v11)
    {
      xpc_retain(v11);
      v19 = v11;
    }
    else
    {
      v19 = xpc_null_create();
    }
    xpc_dictionary_set_value(*a1, "eventList", v19);
    v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    xpc_release(v11);
  }
}

void sub_20E5C8F50(_Unwind_Exception *a1)
{
  xpc_object_t *v1;
  void *v2;
  void *v3;

  xpc_release(v3);
  xpc_release(v2);
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  std::string::size_type v6;
  int v7;
  std::string::size_type size;
  BOOL v9;
  uint64_t **v10;
  char *v11;
  void **v12;
  char **v13;
  char **v14;
  _QWORD *v15;
  char *v16;
  std::string *v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  NSObject *v34;
  NSObject *object;
  std::string v36;
  _QWORD v37[2];
  unint64_t v38;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0)
    std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    v36 = *(std::string *)(a1 + 40);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    v4 = _Block_copy(v3);
  else
    v4 = 0;
  v5 = *(NSObject **)(a1 + 72);
  object = v5;
  if (v5)
    dispatch_retain(v5);
  v6 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
  v7 = SHIBYTE(v36.__r_.__value_.__r.__words[2]);
  size = v36.__r_.__value_.__l.__size_;
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v6 = v36.__r_.__value_.__l.__size_;
  if (v6)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (!v5)
    {
LABEL_64:
      _Block_release(v4);
      goto LABEL_65;
    }
    v10 = *(uint64_t ***)(v2 + 224);
    v12 = (void **)(v10 + 1);
    v11 = (char *)v10[1];
    v13 = (char **)(v10 + 1);
    v14 = (char **)(v10 + 1);
    if (v11)
    {
      do
      {
        while (1)
        {
          v14 = (char **)v11;
          v15 = v11 + 32;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v36, (_QWORD *)v11 + 4) & 0x80) == 0)break;
          v11 = *v14;
          v13 = v14;
          if (!*v14)
            goto LABEL_22;
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v15, &v36) & 0x80) == 0)
          goto LABEL_55;
        v11 = v14[1];
      }
      while (v11);
      v13 = v14 + 1;
    }
LABEL_22:
    v38 = 0xAAAAAAAAAAAAAA00;
    v16 = (char *)operator new(0x48uLL);
    v37[0] = v16;
    v37[1] = v10 + 1;
    v17 = (std::string *)(v16 + 32);
    if (v7 < 0)
    {
      std::string::__init_copy_ctor_external(v17, v36.__r_.__value_.__l.__data_, size);
    }
    else
    {
      *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)&v36.__r_.__value_.__l.__data_;
      *((_QWORD *)v16 + 6) = *((_QWORD *)&v36.__r_.__value_.__l + 2);
    }
    *((_QWORD *)v16 + 7) = 0;
    *((_QWORD *)v16 + 8) = 0;
    LOBYTE(v38) = 1;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v14;
    *v13 = v16;
    v18 = (uint64_t *)**v10;
    if (v18)
    {
      *v10 = v18;
      v16 = *v13;
    }
    v19 = (char *)*v12;
    v9 = v16 == *v12;
    v16[24] = v9;
    if (!v9)
    {
      do
      {
        v20 = *((_QWORD *)v16 + 2);
        if (*(_BYTE *)(v20 + 24))
          break;
        v21 = *(char **)(v20 + 16);
        v22 = *(_QWORD *)v21;
        if (*(_QWORD *)v21 == v20)
        {
          v25 = *((_QWORD *)v21 + 1);
          if (!v25 || (v26 = *(unsigned __int8 *)(v25 + 24), v23 = (_BYTE *)(v25 + 24), v26))
          {
            if (*(char **)v20 == v16)
            {
              v27 = (uint64_t *)*((_QWORD *)v16 + 2);
            }
            else
            {
              v27 = *(uint64_t **)(v20 + 8);
              v28 = *v27;
              *(_QWORD *)(v20 + 8) = *v27;
              if (v28)
              {
                *(_QWORD *)(v28 + 16) = v20;
                v21 = *(char **)(v20 + 16);
              }
              v27[2] = (uint64_t)v21;
              *(_QWORD *)(*(_QWORD *)(v20 + 16) + 8 * (**(_QWORD **)(v20 + 16) != v20)) = v27;
              *v27 = v20;
              *(_QWORD *)(v20 + 16) = v27;
              v21 = (char *)v27[2];
              v20 = *(_QWORD *)v21;
            }
            *((_BYTE *)v27 + 24) = 1;
            v21[24] = 0;
            v31 = *(_QWORD *)(v20 + 8);
            *(_QWORD *)v21 = v31;
            if (v31)
              *(_QWORD *)(v31 + 16) = v21;
            *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
            *(_QWORD *)(*((_QWORD *)v21 + 2) + 8 * (**((_QWORD **)v21 + 2) != (_QWORD)v21)) = v20;
            *(_QWORD *)(v20 + 8) = v21;
            goto LABEL_53;
          }
        }
        else if (!v22 || (v24 = *(unsigned __int8 *)(v22 + 24), v23 = (_BYTE *)(v22 + 24), v24))
        {
          if (*(char **)v20 == v16)
          {
            v29 = *((_QWORD *)v16 + 1);
            *(_QWORD *)v20 = v29;
            if (v29)
            {
              *(_QWORD *)(v29 + 16) = v20;
              v21 = *(char **)(v20 + 16);
            }
            *((_QWORD *)v16 + 2) = v21;
            *(_QWORD *)(*(_QWORD *)(v20 + 16) + 8 * (**(_QWORD **)(v20 + 16) != v20)) = v16;
            *((_QWORD *)v16 + 1) = v20;
            *(_QWORD *)(v20 + 16) = v16;
            v21 = (char *)*((_QWORD *)v16 + 2);
          }
          else
          {
            v16 = (char *)*((_QWORD *)v16 + 2);
          }
          v16[24] = 1;
          v21[24] = 0;
          v20 = *((_QWORD *)v21 + 1);
          v30 = *(char **)v20;
          *((_QWORD *)v21 + 1) = *(_QWORD *)v20;
          if (v30)
            *((_QWORD *)v30 + 2) = v21;
          *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
          *(_QWORD *)(*((_QWORD *)v21 + 2) + 8 * (**((_QWORD **)v21 + 2) != (_QWORD)v21)) = v20;
          *(_QWORD *)v20 = v21;
LABEL_53:
          *((_QWORD *)v21 + 2) = v20;
          break;
        }
        *(_BYTE *)(v20 + 24) = 1;
        v16 = v21;
        v21[24] = v21 == v19;
        *v23 = 1;
      }
      while (v21 != v19);
    }
    v10[2] = (uint64_t *)((char *)v10[2] + 1);
    v14 = (char **)v37[0];
    v37[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v37);
LABEL_55:
    v32 = (char *)_Block_copy(v4);
    v33 = v14[7];
    v14[7] = v32;
    if (v33)
      _Block_release(v33);
    v5 = object;
    if (object)
      dispatch_retain(object);
    v34 = v14[8];
    v14[8] = (char *)object;
    if (v34)
      dispatch_release(v34);
  }
  if (v5)
    dispatch_release(v5);
  if (v4)
    goto LABEL_64;
LABEL_65:
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
}

void sub_20E5C9324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a17);
  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c89_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;

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
  v6 = *(void **)(a2 + 64);
  if (v6)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v7;
  if (v7)
    dispatch_retain(v7);
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c89_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (_QWORD *)*a1;
    v3 = v2;
  }
  v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (_QWORD *)*a2;
    v5 = v4;
  }
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (v3 == v5)
      return 0;
    if (v3 >= v5)
      return 1;
  }
  return 255;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void ___ZN12TelephonyXPC6Client5State8eventsOnEv_block_invoke(uint64_t a1)
{
  TelephonyXPC::Client::State::eventsOn_sync(*(TelephonyXPC::Client::State **)(a1 + 32));
}

void ___ZN12TelephonyXPC6Client5State28performWithBlockingSyncReplyENSt3__110shared_ptrINS_7CommandEEERNS_6ResultERN3xpc4dictE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  _BYTE *v12;
  _QWORD *v13;
  xpc_object_t object;
  xpc_object_t message;
  _BYTE buf[12];
  char v17;
  uint8_t v18[4];
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (MEMORY[0x212BC0184](*(_QWORD *)(v2 + 40)) == MEMORY[0x24BDACF88])
  {
    v4 = xpc_null_create();
    TelephonyXPC::Command::State::get(**(void ****)(a1 + 40), &message);
    v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 40), message);
    if (v5 || (v5 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x212BC0184](v5) == MEMORY[0x24BDACFA0])
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
    v7 = xpc_null_create();
    xpc_release(v4);
    xpc_release(v7);
    xpc_release(v5);
    xpc_release(message);
    object = v6;
    message = 0;
    if (v6)
      xpc_retain(v6);
    else
      object = xpc_null_create();
    TelephonyXPC::Client::State::parseReply_sync((void **)buf, &object, *(_QWORD *)(a1 + 64));
    v8 = *(void ***)(a1 + 56);
    v9 = *(void **)buf;
    *(_QWORD *)buf = xpc_null_create();
    v10 = *v8;
    *v8 = v9;
    xpc_release(v10);
    xpc_release(*(xpc_object_t *)buf);
    *(_QWORD *)buf = 0;
    xpc_release(object);
    object = 0;
    v11 = *(_DWORD **)(a1 + 64);
    if (*v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, (uint64_t)v11);
        v12 = v17 >= 0 ? buf : *(_BYTE **)buf;
        *(_DWORD *)v18 = 136315138;
        v19 = v12;
        _os_log_error_impl(&dword_20E5C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failure: %s", v18, 0xCu);
        if (v17 < 0)
          operator delete(*(void **)buf);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v13 = (_QWORD *)(a1 + 72);
      if (*(char *)(a1 + 95) < 0)
        v13 = (_QWORD *)*v13;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v13;
      _os_log_debug_impl(&dword_20E5C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Successful: %s", buf, 0xCu);
    }
    xpc_release(v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v3 = (_QWORD *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0)
      v3 = (_QWORD *)*v3;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v3;
    _os_log_error_impl(&dword_20E5C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Server unavailable, unable to perform command %s", buf, 0xCu);
  }
}

void sub_20E5C97C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v2;
  unint64_t *v3;
  unint64_t v4;
  std::string *v5;
  __int128 v6;

  v2 = *(_QWORD *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 72), *(_QWORD *)(a2 + 80));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 72);
    v5->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 88);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_20E5C98C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  return std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN12TelephonyXPC6Client5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  xpc_object_t object;
  __int128 aBlock;
  __int128 v29;
  __int128 v30;
  std::__shared_weak_count *v31;
  void *v32;
  void *v33[2];
  char v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 220);
  if (v2 == 1)
    goto LABEL_4;
  if (v2 == 2)
  {
    TelephonyXPC::Client::State::changeEventsState_sync(*(_QWORD *)(a1 + 32), 1u);
LABEL_4:
    v3 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v3 || (v4 = *(_QWORD *)(v1 + 8), (v5 = std::__shared_weak_count::lock(v3)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v6 = v5;
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v6);
    }
    std::string::basic_string[abi:ne180100]<0>(v33, "eventsOff");
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1174405120;
    *(_QWORD *)&v29 = ___ZN12TelephonyXPC6Client5State14eventsOff_syncEv_block_invoke;
    *((_QWORD *)&v29 + 1) = &__block_descriptor_tmp_66;
    *(_QWORD *)&v30 = v1;
    *((_QWORD *)&v30 + 1) = v4;
    v31 = v6;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
    v32 = _Block_copy(&aBlock);
    v12 = *(std::__shared_weak_count **)(v1 + 232);
    v25 = *(_QWORD *)(v1 + 224);
    v26 = v12;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    TelephonyXPC::Client::State::convert_sync(&object, v1, (uint64_t)&v25);
    TelephonyXPC::Client::State::createCommand_sync(&v35, v1, (uint64_t)v33, &v32, &object);
    TelephonyXPC::Client::State::perform_sync(v1, &v35);
    v15 = v36;
    if (v36)
    {
      v16 = (unint64_t *)&v36->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    xpc_release(object);
    object = 0;
    v18 = v26;
    if (v26)
    {
      v19 = (unint64_t *)&v26->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (v32)
      _Block_release(v32);
    if (v34 < 0)
      operator delete(v33[0]);
    if (v31)
      std::__shared_weak_count::__release_weak(v31);
    std::__shared_weak_count::__release_weak(v6);
    return;
  }
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
  {
    v31 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v21;
    v30 = v21;
    aBlock = v21;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&aBlock);
    v22 = MEMORY[0x212BBFE3C](&aBlock, "Events state is ");
    v23 = v22;
    v24 = *(int *)(v1 + 220);
    if (v24 <= 2)
      MEMORY[0x212BBFE3C](v22, off_24C970710[v24]);
    MEMORY[0x212BBFE3C](v23, ", skipping");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](&aBlock);
  }
}

void ___ZN12TelephonyXPC6Client5State14eventsOff_syncEv_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
        TelephonyXPC::Client::State::changeEventsState_sync(v3, 0);
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
}

void sub_20E5C9D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::destroyConnection_sync(TelephonyXPC::Client::State *this)
{
  char *v2;
  __int128 v3;
  xpc_object_t object;
  _OWORD v5[3];
  unint64_t v6;

  v2 = (char *)this + 80;
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))(v2, 20))
  {
    v6 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[1] = v3;
    v5[2] = v3;
    v5[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v5);
    MEMORY[0x212BBFE3C](v5, "Destroy server connection");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x212BBFDD0](v5);
  }
  TelephonyXPC::Client::State::changeCheckInState_sync((uint64_t)this, 0);
  object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
}

void sub_20E5C9E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::to_debug_string(xpc::dict *this, uint64_t a2)
{
  char *v3;

  v3 = (char *)MEMORY[0x212BC013C](a2);
  memset(this, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(this, v3);
  free(v3);
}

void std::shared_ptr<TelephonyXPC::ClientStateTracker>::operator=[abi:ne180100](__int128 *a1)
{
  __int128 v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *a1;
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
  v2 = (std::__shared_weak_count *)off_253ECF620;
  unk_253ECF618 = v1;
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

std::__shared_weak_count_vtbl **std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>(std::__shared_weak_count_vtbl **a1, std::__shared_weak_count_vtbl *a2)
{
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

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_24C970618;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = a2;
  a1[1] = (std::__shared_weak_count_vtbl *)v4;
  if (a2)
  {
    v6 = (std::__shared_weak_count *)a2->~__shared_weak_count_0;
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        return a1;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
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
      a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
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
  return a1;
}

void sub_20E5C9FEC(_Unwind_Exception *exception_object)
{
  _QWORD *v1;

  if (v1)
    std::default_delete<TelephonyXPC::ClientStateTracker>::operator()[abi:ne180100](v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<TelephonyXPC::ClientStateTracker>::operator()[abi:ne180100](*(_QWORD **)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<TelephonyXPC::ClientStateTracker>::operator()[abi:ne180100](_QWORD *__p)
{
  void *v2;
  std::__shared_weak_count *v3;

  if (__p)
  {
    v2 = (void *)__p[3];
    if (v2)
    {
      __p[4] = v2;
      operator delete(v2);
    }
    v3 = (std::__shared_weak_count *)__p[1];
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    operator delete(__p);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    v2 = (void *)std::shared_ptr<TelephonyXPC::Event::State>::~shared_ptr[abi:ne180100](v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_2()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>::~PthreadMutexGuardPolicy, &ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance, &dword_20E5C1000);
  }
  return result;
}

_QWORD *TelephonyXPC::Command::Command(_QWORD *result, _QWORD *a2)
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

void TelephonyXPC::Command::name(TelephonyXPC::Command::State **this)
{
  TelephonyXPC::Command::State::name(*this);
}

void TelephonyXPC::Command::getName(TelephonyXPC::Command::State **this@<X0>, _QWORD *a2@<X8>)
{
  void *__p;
  char v4;

  TelephonyXPC::Command::State::name(*this);
  ctu::cf::convert_copy();
  if (v4 < 0)
    operator delete(__p);
  *a2 = 0xAAAAAAAAAAAAAAAALL;
}

void sub_20E5CA218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

xpc_object_t TelephonyXPC::Command::get@<X0>(void ***this@<X0>, _QWORD *a2@<X8>)
{
  return TelephonyXPC::Command::State::get(*this, a2);
}

BOOL TelephonyXPC::Command::notifiable(TelephonyXPC::Command *this)
{
  return *(_QWORD *)(*(_QWORD *)this + 8) && *(_QWORD *)(*(_QWORD *)this + 16) != 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<TelephonyXPC::Command::State>::operator()[abi:ne180100](uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 16);
    if (v2)
      dispatch_release(v2);
    v3 = *(const void **)(a1 + 8);
    if (v3)
      _Block_release(v3);
    xpc_release(*(xpc_object_t *)a1);
    operator delete((void *)a1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
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

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x24BED97E8]();
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
  return MEMORY[0x24BED99B8]();
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x24BED9A90]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
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

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D48]();
}

{
  return MEMORY[0x24BED9D58]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D68]();
}

{
  return MEMORY[0x24BED9D70]();
}

{
  return MEMORY[0x24BED9DA8]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog()
{
  return MEMORY[0x24BED9DC0]();
}

uint64_t ctu::LoggerCommonBase::getLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E58](this);
}

uint64_t ctu::LoggerCommonBase::getLocalLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E68](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x24BED9ED0](this);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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

void operator delete(void *__p)
{
  off_24C96FCD8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C96FCE0(__sz);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
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

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x24BDAE020]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
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

