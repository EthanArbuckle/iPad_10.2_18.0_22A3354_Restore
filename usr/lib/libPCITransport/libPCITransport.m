uint64_t __destroy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t a1)
{
  return std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](a1 + 72);
}

uint64_t __copy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(result + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(result + 80) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t ___ZN3pci9transport2th9readAsyncEv_block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

uint64_t ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

void *__copy_helper_block_e8_32c46_ZTSN8dispatch5blockIU13block_pointerFviPvjEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c46_ZTSN8dispatch5blockIU13block_pointerFviPvjEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

BOOL TelephonyBasebandPCITransportWrite(uint64_t a1, const unsigned __int8 *a2, int a3, int *a4, uint64_t a5, unsigned int a6, _BOOL8 a7)
{
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  pci::log *v16;
  NSObject *v17;
  pci::log *v18;
  NSObject *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint8_t buf[8];
  std::__shared_weak_count *v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportWrite();
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    pci::system::info::get(&v26);
    pci::system::info::getTH((os_unfair_lock_s *)v26, *(_QWORD *)(a1 + 80), buf);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (*(_QWORD *)buf)
    {
      if (*(_BYTE *)(*(_QWORD *)buf + 74))
      {
        a7 = pci::transport::th::writeAsync(*(pci::transport::th **)buf, a2, a3, a7);
LABEL_24:
        v20 = v25;
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v22 = __ldaxr(p_shared_owners);
          while (__stlxr(v22 - 1, p_shared_owners));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        return a7;
      }
      if (pci::transport::th::write(*(pci::transport::th **)buf, a2, a3, a7, a6))
      {
        *a4 = a3;
        a7 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      v18 = (pci::log *)_TelephonyUtilDebugPrintError();
      v19 = pci::log::get(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LODWORD(v26) = 134217984;
        *(_QWORD *)((char *)&v26 + 4) = a1;
        _os_log_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v26, 0xCu);
      }
      if (!a7)
        goto LABEL_24;
      ((void (*)(const unsigned __int8 *))a7)(a2);
    }
    a7 = 0;
    goto LABEL_24;
  }
  v16 = (pci::log *)_TelephonyUtilDebugPrintError();
  v17 = pci::log::get(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB0C000, v17, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
  }
  if (a7)
  {
    ((void (*)(const unsigned __int8 *))a7)(a2);
    return 0;
  }
  return a7;
}

void sub_20DB0CFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void pci::system::info::get(_QWORD *a1@<X8>)
{
  unsigned __int8 v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  {
    pci::system::info::get(void)::sInstance = 0;
    *(_QWORD *)algn_253DA6A28 = 0;
  }
  if (pci::system::info::get(void)::sOnce != -1)
    dispatch_once(&pci::system::info::get(void)::sOnce, &__block_literal_global);
  v4 = *(_QWORD *)algn_253DA6A28;
  *a1 = pci::system::info::get(void)::sInstance;
  a1[1] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
}

void pci::system::info::getTH(os_unfair_lock_s *this@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  os_unfair_lock_s *v6;
  _QWORD *v7;
  char *v8;
  _QWORD *v9;
  uint64_t *v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;

  *a3 = 0;
  a3[1] = 0;
  v6 = this + 4;
  os_unfair_lock_lock(this + 4);
  v9 = *(_QWORD **)&this[10]._os_unfair_lock_opaque;
  v8 = (char *)&this[10];
  v7 = v9;
  if (v9)
  {
    v10 = (uint64_t *)v8;
    do
    {
      v11 = v7[4];
      v12 = v11 >= a2;
      if (v11 >= a2)
        v13 = v7;
      else
        v13 = v7 + 1;
      if (v12)
        v10 = v7;
      v7 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != (uint64_t *)v8 && v10[4] <= a2)
      std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](a3, v10 + 5);
  }
  os_unfair_lock_unlock(v6);
}

BOOL pci::transport::th::writeAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4)
{
  pci::log *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  int v17;
  const void *v18;
  _QWORD aBlock[5];
  _BYTE buf[22];
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const unsigned __int8 *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v21 = 1024;
    v22 = v17;
    v23 = 2080;
    v24 = "writeAsync";
    v25 = 2048;
    v26 = a2;
    v27 = 1024;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", buf, 0x40u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_23;
  aBlock[4] = this;
  v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v10)
    v11 = _Block_copy(v10);
  else
    v11 = 0;
  v18 = v11;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v18, (__int128 *)buf);
  if (v11)
    _Block_release(v11);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  v13 = *(_QWORD *)buf;
  v12 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      if (!v10)
        return v13 != 0;
      goto LABEL_13;
    }
  }
  if (v10)
LABEL_13:
    _Block_release(v10);
  return v13 != 0;
}

void sub_20DB0D364(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void pci::transport::th::writeInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, NSObject *a4@<X3>, const void **a5@<X4>, __int128 *a6@<X8>)
{
  pci::log *v12;
  NSObject *v13;
  pci::log *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  pci::log *v27;
  NSObject *v28;
  int v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  int v36;
  __int128 v37;
  __int128 v38;
  _BYTE buf[22];
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  uint8_t v44[4];
  _BYTE v45[20];
  int v46;
  __int16 v47;
  _BYTE v48[18];
  dispatch_object_t object[2];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v38 = 0uLL;
  v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v36 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v44 = 136316674;
    *(_QWORD *)v45 = "th";
    *(_WORD *)&v45[8] = 2048;
    *(_QWORD *)&v45[10] = a1;
    *(_WORD *)&v45[18] = 1024;
    v46 = v36;
    v47 = 2080;
    *(_QWORD *)v48 = "writeInternal";
    *(_WORD *)&v48[8] = 2048;
    *(_QWORD *)&v48[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v44, 0x40u);
    if (!a2)
      goto LABEL_5;
  }
  else if (!a2)
  {
    goto LABEL_5;
  }
  v14 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    pci::transport::th::writeInternal();
LABEL_5:
  *(_OWORD *)&v48[2] = 0u;
  *(_OWORD *)object = 0u;
  if (*a5)
    v16 = _Block_copy(*a5);
  else
    v16 = 0;
  *(_DWORD *)v44 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v45 = 3;
  *(_QWORD *)&v45[4] = a4;
  *(_QWORD *)&v45[12] = a2;
  v46 = a3;
  if (v16)
    v17 = _Block_copy(v16);
  else
    v17 = 0;
  v18 = *(const void **)&v48[2];
  *(_QWORD *)&v48[2] = v17;
  if (v18)
    _Block_release(v18);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v48[10], (uint64_t *)a1);
  v19 = *(NSObject **)(a1 + 16);
  if (v19)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v20 = object[1];
  object[1] = v19;
  if (v20)
    dispatch_release(v20);
  if (v16)
    _Block_release(v16);
  pci::transport::task::create((const pci::transport::task::parameters *)v44, a1 + 128, (uint64_t *)buf);
  v38 = *(_OWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v21 = *(_QWORD *)(a1 + 24);
    v37 = *(_OWORD *)buf;
    if (*(_QWORD *)&buf[8])
    {
      v22 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    pci::transport::bh::write(v21, (uint64_t)&v37);
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
    if (*((_QWORD *)&v37 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    *a6 = v38;
    a6 = &v38;
  }
  else
  {
    v27 = (pci::log *)_TelephonyUtilDebugPrintError();
    v28 = pci::log::get(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "th";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v40 = 1024;
      v41 = v29;
      v42 = 2080;
      v43 = "writeInternal";
      _os_log_impl(&dword_20DB0C000, v28, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task write", buf, 0x26u);
    }
  }
  *(_QWORD *)a6 = 0;
  *((_QWORD *)a6 + 1) = 0;
  if (object[1])
    dispatch_release(object[1]);
  v30 = (std::__shared_weak_count *)object[0];
  if (object[0])
  {
    v31 = (unint64_t *)&object[0][1];
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (*(_QWORD *)&v48[2])
    _Block_release(*(const void **)&v48[2]);
  v33 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v34 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
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

void sub_20DB0D794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Unwind_Resume(exception_object);
}

void pci::transport::bh::ioCompletion(pci::transport::bh *this, void *a2, uint64_t a3, void *a4)
{
  if (!this)
    pci::transport::bh::ioCompletion();
  (*((void (**)(pci::transport::bh *, void *, uint64_t, _QWORD))this + 2))(this, a2, a3, 0);
  _Block_release(this);
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke(uint64_t a1, int a2, unsigned int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  pci::log *v10;
  NSObject *v11;
  BOOL v12;
  pci::log *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 56);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 16));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v9 + 24))
    ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1();
  *(_BYTE *)(v9 + 24) = 1;
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_DWORD *)(v8 + 28);
    v18 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 136316930;
    v20 = "bh";
    v21 = 2048;
    v22 = v8;
    v23 = 1024;
    v24 = v17;
    v25 = 2080;
    v26 = "generateCallback_block_invoke";
    v27 = 2080;
    v28 = v18;
    v29 = 1024;
    v30 = a2;
    v31 = 1024;
    v32 = a3;
    v33 = 1024;
    v34 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s complete 0x%x, size %u, cookie %u", buf, 0x42u);
  }
  if (*(_BYTE *)(a1 + 88))
    v12 = a2 == -536870168;
  else
    v12 = 0;
  if (v12)
    a2 = 0;
  if (a2)
  {
    v13 = (pci::log *)_TelephonyUtilDebugPrintError();
    v14 = pci::log::get(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_DWORD *)(v8 + 28);
      v16 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 136316930;
      v20 = "bh";
      v21 = 2048;
      v22 = v8;
      v23 = 1024;
      v24 = v15;
      v25 = 2080;
      v26 = "generateCallback_block_invoke";
      v27 = 2080;
      v28 = v16;
      v29 = 1024;
      v30 = a2;
      v31 = 1024;
      v32 = a3;
      v33 = 1024;
      v34 = a4;
      _os_log_impl(&dword_20DB0C000, v14, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: %s failed, complete 0x%x, size %u, cookie %u", buf, 0x42u);
    }
  }
  std::list<void const*>::remove(v8 + 64, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  pci::transport::task::complete(*(pci::transport::task **)(a1 + 72), a2, a3, a4);
}

void pci::transport::task::complete(pci::transport::task *this, int a2, unsigned int a3, int a4)
{
  pci::log *v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  unsigned int v13;
  _QWORD *v14;
  void *v15;
  int v16;
  char *TypeString;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  pci::log *v26;
  NSObject *v27;
  int v28;
  char *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  pci::transport::task *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(*((os_unfair_lock_t *)this + 4));
  getTypeString(*((_DWORD *)this + 5));
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v16 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)buf = 136316418;
    v31 = "task";
    v32 = 2048;
    v33 = this;
    v34 = 1024;
    v35 = v16;
    v36 = 2080;
    v37 = "complete";
    v38 = 2080;
    v39 = TypeString;
    v40 = 1024;
    v41 = a2;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: status 0x%x", buf, 0x36u);
  }
  v10 = *((_QWORD *)this + 9);
  if (v10)
    v11 = 0;
  else
    v11 = a2 == 0;
  if (v11)
    v12 = -536870166;
  else
    v12 = a2;
  v13 = *((_DWORD *)this + 5);
  if (v13 >= 2)
  {
    if (v13 == 3)
    {
      v14 = (_QWORD *)((char *)this + 56);
      (*((void (**)(_QWORD))this + 3))(*((_QWORD *)this + 7));
LABEL_21:
      *v14 = 0;
      goto LABEL_22;
    }
    if (v13 != 2)
      pci::transport::task::complete();
    if (!v12)
    {
      v15 = *(void **)(v10 + 8);
      if (!v15 || !*((_BYTE *)this + 48))
      {
        *(_QWORD *)(v10 + 8) = *((_QWORD *)this + 7);
        goto LABEL_20;
      }
      if (*((_DWORD *)this + 16) < a3)
        pci::transport::task::complete();
      memcpy(v15, *((const void **)this + 7), a3);
    }
    (*((void (**)(_QWORD))this + 3))(*((_QWORD *)this + 7));
LABEL_20:
    v14 = (_QWORD *)((char *)this + 56);
    goto LABEL_21;
  }
LABEL_22:
  v18 = *((_QWORD *)this + 9);
  if (v18)
  {
    v19 = *((unsigned __int8 *)this + 48);
    v20 = *((_DWORD *)this + 5);
    *(_DWORD *)(v18 + 16) = a3;
    *(_DWORD *)(v18 + 64) = v12;
    *(_DWORD *)(v18 + 68) = a4;
    if (!v19 && (v12 || v20 == 3))
    {
      *(_QWORD *)(v18 + 8) = 0;
      *(_DWORD *)(v18 + 16) = 0;
    }
    pci::transport::bind::~bind((pci::transport::bind *)v18);
    MEMORY[0x212BAF90C](v21, 0x10A0C40F1E767F4, v22, v23, v24, v25);
    *((_QWORD *)this + 9) = 0;
  }
  else
  {
    getTypeString(*((_DWORD *)this + 5));
    v26 = (pci::log *)_TelephonyUtilDebugPrint();
    v27 = pci::log::get(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = *((_DWORD *)this + 4);
      v29 = getTypeString(*((_DWORD *)this + 5));
      *(_DWORD *)buf = 136316418;
      v31 = "task";
      v32 = 2048;
      v33 = this;
      v34 = 1024;
      v35 = v28;
      v36 = 2080;
      v37 = "complete";
      v38 = 2080;
      v39 = v29;
      v40 = 1024;
      v41 = a2;
      _os_log_debug_impl(&dword_20DB0C000, v27, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: poisoned completion, status 0x%x", buf, 0x36u);
    }
  }
  os_unfair_lock_unlock(*((os_unfair_lock_t *)this + 4));
}

uint64_t std::list<void const*>::remove(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11[2];
  uint64_t v12;

  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  v12 = 0;
  v2 = *(_QWORD **)(a1 + 8);
  if (v2 == (_QWORD *)a1)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      v6 = (_QWORD *)v2[1];
      v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (_QWORD *)a1)
        {
          v8 = 1;
LABEL_8:
          v6 = (_QWORD *)a1;
        }
        else
        {
          while (1)
          {
            v7 = v6[2];
            v8 = v7 == v5;
            if (v7 != v5)
              break;
            v6 = (_QWORD *)v6[1];
            if (v6 == (_QWORD *)a1)
              goto LABEL_8;
          }
        }
        std::list<void const*>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8)
          v6 = (_QWORD *)v6[1];
      }
      v2 = v6;
    }
    while (v6 != (_QWORD *)a1);
    v9 = v12;
  }
  std::__list_imp<void const*>::clear(v11);
  return v9;
}

void sub_20DB0DE7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__list_imp<void const*>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::list<void const*>::splice(uint64_t result, uint64_t *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (a4 != a5)
  {
    v5 = (_QWORD *)*a5;
    if (result != a3)
    {
      v6 = 1;
      if (v5 != a4)
      {
        v7 = a4;
        do
        {
          v7 = (_QWORD *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(_QWORD *)(a3 + 16) -= v6;
      *(_QWORD *)(result + 16) += v6;
    }
    v8 = *a4;
    *(_QWORD *)(v8 + 8) = v5[1];
    *(_QWORD *)v5[1] = v8;
    v9 = *a2;
    *(_QWORD *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

_QWORD *std::__list_imp<void const*>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void pci::transport::bind::~bind(pci::transport::bind *this)
{
  pci::log *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  const void *v8;

  v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    pci::transport::bind::~bind();
  v4 = *((_QWORD *)this + 3);
  if (v4)
  {
    v5 = *((unsigned int *)this + 16);
    if ((_DWORD)v5 == -536870911)
      __assert_rtn("~bind", "PCITransportTask.cpp", 47, "fStatus != kIOReturnInvalid");
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, v5, *((_QWORD *)this + 1), *((unsigned int *)this + 4), *((unsigned int *)this + 17));
    v6 = (const void *)*((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = 0;
    if (v6)
      _Block_release(v6);
  }
  std::list<std::shared_ptr<pci::transport::task>>::remove(*((_QWORD *)this + 7), (_QWORD *)this + 5);
  dispatch_group_leave(*((dispatch_group_t *)this + 4));
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  v7 = *((_QWORD *)this + 4);
  if (v7)
    dispatch_release(v7);
  v8 = (const void *)*((_QWORD *)this + 3);
  if (v8)
    _Block_release(v8);
}

uint64_t std::list<std::shared_ptr<pci::transport::task>>::remove(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11[2];
  uint64_t v12;

  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  v12 = 0;
  v2 = *(_QWORD **)(a1 + 8);
  if (v2 == (_QWORD *)a1)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      v6 = (_QWORD *)v2[1];
      v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (_QWORD *)a1)
        {
          v8 = 1;
LABEL_8:
          v6 = (_QWORD *)a1;
        }
        else
        {
          while (1)
          {
            v7 = v6[2];
            v8 = v7 == v5;
            if (v7 != v5)
              break;
            v6 = (_QWORD *)v6[1];
            if (v6 == (_QWORD *)a1)
              goto LABEL_8;
          }
        }
        std::list<void const*>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8)
          v6 = (_QWORD *)v6[1];
      }
      v2 = v6;
    }
    while (v6 != (_QWORD *)a1);
    v9 = v12;
  }
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(v11);
  return v9;
}

void sub_20DB0E150(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

void std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;

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
        v5 = (uint64_t *)v3[1];
        std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)(v3 + 2));
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

uint64_t pci::transport::task::init(uint64_t a1, int *a2, uint64_t a3)
{
  pci::log *v6;
  NSObject *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  BOOL v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  pci::log *v19;
  NSObject *v20;
  int v21;
  char *TypeString;
  pci::transport::bind *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  const char *v31;
  int v32;
  void *v33;
  int v34;
  uint64_t v35;
  int v36;
  dispatch_object_t object;
  uint64_t v38;
  uint64_t v39;
  _BYTE buf[22];
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 32));
  object = 0;
  v38 = 0;
  v39 = 0;
  v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    pci::transport::task::init();
  v34 = *a2;
  v35 = *((_QWORD *)a2 + 2);
  v36 = a2[6];
  v8 = *((_QWORD *)a2 + 7);
  if (v8)
    dispatch_retain(*((dispatch_object_t *)a2 + 7));
  object = v8;
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (_QWORD *)a1);
  v9 = *(std::__shared_weak_count **)&buf[8];
  v38 = *(_QWORD *)buf;
  v39 = *(_QWORD *)&buf[8];
  v10 = operator new();
  pci::transport::bind::bind(v10, (uint64_t)&v34, a3);
  *(_QWORD *)(a1 + 72) = v10;
  v11 = *(_DWORD *)(a1 + 20);
  if (v11 < 2)
    goto LABEL_17;
  if (v11 - 2 >= 2)
  {
    v31 = "false";
    v32 = 229;
LABEL_36:
    __assert_rtn("init", "PCITransportTask.cpp", v32, v31);
  }
  v12 = *(void **)(v10 + 8);
  if (v12 && !*(_BYTE *)(a1 + 48))
  {
    *(_QWORD *)(a1 + 56) = v12;
    v13 = 1;
  }
  else
  {
    v12 = malloc_type_malloc(*(unsigned int *)(a1 + 64), 0x48029968uLL);
    *(_QWORD *)(a1 + 56) = v12;
    v13 = v12 != 0;
    *(_QWORD *)(a1 + 24) = dataDtor;
    v11 = *(_DWORD *)(a1 + 20);
  }
  if (v11 != 3)
    goto LABEL_16;
  v14 = *(const void **)(*(_QWORD *)(a1 + 72) + 8);
  if (!v14)
  {
    v31 = "fBind->getCIO()";
    v32 = 219;
    goto LABEL_36;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    memcpy(v12, v14, *(unsigned int *)(a1 + 64));
    if (!v13)
    {
      v11 = *(_DWORD *)(a1 + 20);
      goto LABEL_23;
    }
LABEL_17:
    v15 = *(_QWORD *)(a1 + 72);
    v16 = (const void *)*((_QWORD *)a2 + 4);
    if (v16)
    {
      v17 = _Block_copy(v16);
      v33 = v17;
      pci::transport::bind::setCompletion(v15, &v33);
      if (v17)
        _Block_release(v17);
    }
    else
    {
      v33 = 0;
      pci::transport::bind::setCompletion(v15, &v33);
    }
    v18 = 1;
    if (v9)
      goto LABEL_28;
    goto LABEL_32;
  }
LABEL_16:
  if (v13)
    goto LABEL_17;
LABEL_23:
  getTypeString(v11);
  v19 = (pci::log *)_TelephonyUtilDebugPrintError();
  v20 = pci::log::get(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *(_DWORD *)(a1 + 16);
    TypeString = getTypeString(*(_DWORD *)(a1 + 20));
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "task";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a1;
    v41 = 1024;
    v42 = v21;
    v43 = 2080;
    v44 = "init";
    v45 = 2080;
    v46 = TypeString;
    _os_log_impl(&dword_20DB0C000, v20, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: %s: failed to init", buf, 0x30u);
  }
  v23 = *(pci::transport::bind **)(a1 + 72);
  if (v23)
  {
    pci::transport::bind::~bind(v23);
    MEMORY[0x212BAF90C](v24, 0x10A0C40F1E767F4, v25, v26, v27);
  }
  v18 = 0;
  *(_QWORD *)(a1 + 72) = 0;
  if (v9)
  {
LABEL_28:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v29 = __ldaxr(p_shared_owners);
    while (__stlxr(v29 - 1, p_shared_owners));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_32:
  if (object)
    dispatch_release(object);
  return v18;
}

void sub_20DB0E544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  pci::transport::bind::parameters::~parameters((pci::transport::bind::parameters *)va);
  _Unwind_Resume(a1);
}

void pci::transport::bind::setCompletion(uint64_t a1, void **a2)
{
  void *v3;
  const void *v4;

  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  v4 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    _Block_release(v4);
}

uint64_t pci::transport::bind::bind(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  pci::log *v10;
  NSObject *v11;
  uint64_t v12;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = *(NSObject **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = v6;
  if (v6)
    dispatch_retain(v6);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  *(_QWORD *)(a1 + 56) = a3;
  *(_QWORD *)(a1 + 64) = -536870911;
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    pci::transport::bind::bind((_DWORD *)a1, v11, v12);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  std::list<std::shared_ptr<pci::transport::task>>::push_back(*(uint64_t **)(a1 + 56), (_QWORD *)(a1 + 40));
  return a1;
}

void sub_20DB0E6DC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  const void *v5;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v2);
  v4 = *(NSObject **)(v1 + 32);
  if (v4)
    dispatch_release(v4);
  v5 = *(const void **)(v1 + 24);
  if (v5)
    _Block_release(v5);
  _Unwind_Resume(a1);
}

_QWORD *std::list<std::shared_ptr<pci::transport::task>>::push_back(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;

  result = operator new(0x20uLL);
  v5 = a2[1];
  result[2] = *a2;
  result[3] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = *a1;
  *result = *a1;
  result[1] = a1;
  *(_QWORD *)(v8 + 8) = result;
  *a1 = (uint64_t)result;
  ++a1[2];
  return result;
}

void pci::transport::th::readInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, NSObject *a4@<X3>, const void **a5@<X4>, __int128 *a6@<X8>)
{
  pci::log *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  pci::log *v25;
  NSObject *v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  __int128 v35;
  __int128 v36;
  _BYTE buf[22];
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  uint8_t v42[4];
  _BYTE v43[20];
  int v44;
  __int16 v45;
  _BYTE v46[18];
  dispatch_object_t object[2];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v36 = 0uLL;
  v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v42 = 136316674;
    *(_QWORD *)v43 = "th";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = a1;
    *(_WORD *)&v43[18] = 1024;
    v44 = v34;
    v45 = 2080;
    *(_QWORD *)v46 = "readInternal";
    *(_WORD *)&v46[8] = 2048;
    *(_QWORD *)&v46[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v42, 0x40u);
  }
  *(_OWORD *)&v46[2] = 0u;
  *(_OWORD *)object = 0u;
  if (*a5)
    v14 = _Block_copy(*a5);
  else
    v14 = 0;
  *(_DWORD *)v42 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v43 = 2;
  *(_QWORD *)&v43[4] = a4;
  *(_QWORD *)&v43[12] = a2;
  v44 = a3;
  if (v14)
    v15 = _Block_copy(v14);
  else
    v15 = 0;
  v16 = *(const void **)&v46[2];
  *(_QWORD *)&v46[2] = v15;
  if (v16)
    _Block_release(v16);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v46[10], (uint64_t *)a1);
  v17 = *(NSObject **)(a1 + 16);
  if (v17)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v18 = object[1];
  object[1] = v17;
  if (v18)
    dispatch_release(v18);
  if (v14)
    _Block_release(v14);
  pci::transport::task::create((const pci::transport::task::parameters *)v42, a1 + 128, (uint64_t *)buf);
  v36 = *(_OWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v19 = *(_QWORD *)(a1 + 24);
    v35 = *(_OWORD *)buf;
    if (*(_QWORD *)&buf[8])
    {
      v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    pci::transport::bh::read(v19, (uint64_t)&v35, *(_BYTE *)(a1 + 72));
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    *a6 = v36;
    a6 = &v36;
  }
  else
  {
    v25 = (pci::log *)_TelephonyUtilDebugPrintError();
    v26 = pci::log::get(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "th";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v38 = 1024;
      v39 = v27;
      v40 = 2080;
      v41 = "readInternal";
      _os_log_impl(&dword_20DB0C000, v26, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task read", buf, 0x26u);
    }
  }
  *(_QWORD *)a6 = 0;
  *((_QWORD *)a6 + 1) = 0;
  if (object[1])
    dispatch_release(object[1]);
  v28 = (std::__shared_weak_count *)object[0];
  if (object[0])
  {
    v29 = (unint64_t *)&object[0][1];
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (*(_QWORD *)&v46[2])
    _Block_release(*(const void **)&v46[2]);
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  if (*((_QWORD *)&v36 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
}

void sub_20DB0EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a27);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

pci::transport::task *std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__on_zero_shared(uint64_t a1)
{
  pci::transport::task *result;

  result = *(pci::transport::task **)(a1 + 24);
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

void pci::transport::task::~task(pci::transport::task *this)
{
  pci::log *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  int v5;
  char *TypeString;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  pci::transport::task *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  getTypeString(*((_DWORD *)this + 5));
  v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)buf = 136316162;
    v8 = "task";
    v9 = 2048;
    v10 = this;
    v11 = 1024;
    v12 = v5;
    v13 = 2080;
    v14 = "~task";
    v15 = 2080;
    v16 = TypeString;
    _os_log_debug_impl(&dword_20DB0C000, v3, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: ", buf, 0x30u);
  }
  if (*((_QWORD *)this + 9))
    __assert_rtn("~task", "PCITransportTask.cpp", 170, "!fBind");
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

void sub_20DB0ECFC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

char *getTypeString(unsigned int a1)
{
  if (a1 >= 4)
    getTypeString();
  return (&off_24C81A3E0)[a1];
}

uint64_t pci::transport::task::create@<X0>(const pci::transport::task::parameters *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  pci::transport::task *v6;
  uint64_t result;
  uint64_t (*v8)(void);

  v6 = (pci::transport::task *)operator new();
  pci::transport::task::task(v6, a1);
  std::shared_ptr<pci::transport::task>::shared_ptr[abi:ne180100]<pci::transport::task,void>(a3, v6);
  if (!*a3 || (result = pci::transport::task::init(*a3, (int *)a1, a2), (result & 1) == 0))
  {
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100](a3);
    result = *((_QWORD *)a1 + 2);
    if (result)
    {
      v8 = (uint64_t (*)(void))*((_QWORD *)a1 + 1);
      if (v8)
        return v8();
    }
  }
  return result;
}

void sub_20DB0EDC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

pci::transport::task *pci::transport::task::task(pci::transport::task *this, const pci::transport::task::parameters *a2)
{
  int v3;
  char *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  pci::log *v10;
  NSObject *v11;
  int v13;
  char *TypeString;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  pci::transport::task *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = *(_DWORD *)a2;
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 5);
  v4 = (char *)this + 32;
  *((_DWORD *)this + 4) = v3;
  v5 = *((_DWORD *)a2 + 1);
  *((_DWORD *)v4 - 3) = v5;
  v6 = *((_QWORD *)a2 + 1);
  *((_QWORD *)v4 - 1) = v6;
  v7 = *((_QWORD *)a2 + 6);
  *((_QWORD *)v4 + 1) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    v6 = *((_QWORD *)a2 + 1);
    v5 = *((_DWORD *)this + 5);
  }
  *((_BYTE *)this + 48) = v6 == 0;
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 6);
  *((_QWORD *)this + 9) = 0;
  getTypeString(v5);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)buf = 136316162;
    v16 = "task";
    v17 = 2048;
    v18 = this;
    v19 = 1024;
    v20 = v13;
    v21 = 2080;
    v22 = "task";
    v23 = 2080;
    v24 = TypeString;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: ", buf, 0x30u);
  }
  return this;
}

void sub_20DB0EF70(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v4;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v2);
  v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th9readAsyncEv_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  pci::log *v11;
  NSObject *v12;
  const void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const void *v18;
  int v19;
  const void *v20;
  void *v21;
  int v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  __int128 v27;
  _QWORD block[4];
  void *aBlock;
  uint64_t v30;
  int v31;
  int v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)buf = 136316674;
    v34 = "th";
    v35 = 2048;
    v36 = v8;
    v37 = 1024;
    v38 = v22;
    v39 = 2080;
    v40 = "readAsync_block_invoke";
    v41 = 1024;
    v42 = a2;
    v43 = 2048;
    v44 = a3;
    v45 = 1024;
    v46 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    if (!a3)
      goto LABEL_5;
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  v11 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    pci::transport::th::writeInternal();
LABEL_5:
  v13 = *(const void **)(v8 + 88);
  if (v13)
    v14 = _Block_copy(v13);
  else
    v14 = 0;
  v15 = *(NSObject **)(v8 + 48);
  if (v15)
    dispatch_retain(*(dispatch_object_t *)(v8 + 48));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke_28;
  block[3] = &__block_descriptor_tmp_29_1;
  if (v14)
    v16 = _Block_copy(v14);
  else
    v16 = 0;
  aBlock = v16;
  v30 = a3;
  v31 = a2;
  v32 = a4;
  dispatch_async(v15, block);
  if (a2 || *(_BYTE *)(v8 + 152))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(const void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;
    if (v18)
      _Block_release(v18);
  }
  else
  {
    v19 = *(_DWORD *)(v8 + 80);
    v20 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v20)
      v21 = _Block_copy(v20);
    else
      v21 = 0;
    v26 = v21;
    pci::transport::th::readInternal(v8, 0, v19, 0, (const void **)&v26, &v27);
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      v21 = v26;
    }
    if (v21)
      _Block_release(v21);
  }
  if (aBlock)
    _Block_release(aBlock);
  if (v15)
    dispatch_release(v15);
  if (v14)
    _Block_release(v14);
}

void sub_20DB0F280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *aBlock)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t pci::log::get(pci::log *this)
{
  if (pci::log::get(void)::once != -1)
    dispatch_once(&pci::log::get(void)::once, &__block_literal_global_0);
  return pci::log::get(void)::logger;
}

void ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v7;
  pci::log *v8;
  NSObject *v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  _QWORD block[4];
  void *aBlock;
  uint64_t v17;
  int v18;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_DWORD *)(v7 + 40);
    *(_DWORD *)buf = 136316674;
    v21 = "th";
    v22 = 2048;
    v23 = v7;
    v24 = 1024;
    v25 = v14;
    v26 = 2080;
    v27 = "writeAsync_block_invoke";
    v28 = 1024;
    v29 = a2;
    v30 = 2048;
    v31 = a3;
    v32 = 1024;
    v33 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  v10 = *(const void **)(v7 + 96);
  if (v10)
  {
    v11 = _Block_copy(v10);
    v12 = *(NSObject **)(v7 + 48);
    if (v12)
      dispatch_retain(v12);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_21;
    block[3] = &__block_descriptor_tmp_22;
    if (v11)
      v13 = _Block_copy(v11);
    else
      v13 = 0;
    aBlock = v13;
    v17 = a3;
    v18 = a2;
    v19 = a4;
    dispatch_async(v12, block);
    if (aBlock)
      _Block_release(aBlock);
    if (v12)
      dispatch_release(v12);
    if (v11)
      _Block_release(v11);
  }
}

void sub_20DB0F508(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::write(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t Data;
  uint64_t Size;
  void *v12;
  void *v13;
  int v14;
  pci::log *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19[2];
  void *aBlock;
  _BYTE buf[24];
  __int128 v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(std::__shared_weak_count **)(a2 + 8);
  v19[0] = *(_QWORD *)a2;
  v19[1] = (uint64_t)v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v19, (uint64_t)"write", 0, &aBlock);
  if (v4)
  {
    v7 = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v9 = *(_QWORD *)(a1 + 40);
  Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  v12 = aBlock;
  v13 = _Block_copy(aBlock);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(_QWORD *)v9 + 72))(v9, Data, Size, pci::transport::bh::ioCompletion, v13);
  if (v14)
  {
    v15 = (pci::log *)_TelephonyUtilDebugPrintError();
    v16 = pci::log::get(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v22) = v17;
      WORD2(v22) = 2080;
      *(_QWORD *)((char *)&v22 + 6) = "write";
      HIWORD(v22) = 1024;
      v23 = v14;
      _os_log_impl(&dword_20DB0C000, v16, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: write failed 0x%x", buf, 0x2Cu);
    }
    v18 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v22 = &unk_24C819B20;
    *((_QWORD *)&v22 + 1) = v12;
    v24 = 0;
    v25 = 0;
    v23 = v14;
    dispatch_async(v18, buf);
    _Block_release(v12);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v12)
    _Block_release(v12);
}

void sub_20DB0F76C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::read(uint64_t a1, uint64_t a2, char a3)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t Data;
  uint64_t Size;
  void *v13;
  void *v14;
  int v15;
  pci::log *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  uint64_t v20[2];
  void *aBlock;
  _BYTE buf[24];
  __int128 v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = *(std::__shared_weak_count **)(a2 + 8);
  v20[0] = *(_QWORD *)a2;
  v20[1] = (uint64_t)v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v20, (uint64_t)"read", a3, &aBlock);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v10 = *(_QWORD *)(a1 + 40);
  Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  v13 = aBlock;
  v14 = _Block_copy(aBlock);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(_QWORD *)v10 + 88))(v10, Data, Size, pci::transport::bh::ioCompletion, v14);
  if (v15)
  {
    v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    v17 = pci::log::get(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v23) = v18;
      WORD2(v23) = 2080;
      *(_QWORD *)((char *)&v23 + 6) = "read";
      HIWORD(v23) = 1024;
      v24 = v15;
      _os_log_impl(&dword_20DB0C000, v17, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: read failed 0x%x", buf, 0x2Cu);
    }
    v19 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v23 = &unk_24C819B20;
    *((_QWORD *)&v23 + 1) = v13;
    v25 = 0;
    v26 = 0;
    v24 = v15;
    dispatch_async(v19, buf);
    _Block_release(v13);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v13)
    _Block_release(v13);
}

void sub_20DB0F9FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::task::getSize(pci::transport::task *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t pci::transport::task::getData(pci::transport::task *this)
{
  return *((_QWORD *)this + 7);
}

void pci::transport::bh::generateCallback(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _QWORD *a5@<X8>)
{
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  os_unfair_lock_s *v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  _QWORD aBlock[10];
  std::__shared_weak_count *v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[5];
  uint64_t v37;
  std::__shared_weak_count *v38;

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3802000000;
  v36[3] = __Block_byref_object_copy__36;
  v36[4] = __Block_byref_object_dispose__37;
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(&v37, (_QWORD *)a1);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2000000000;
  v35 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2000000000;
  v33 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke;
  aBlock[3] = &unk_24C819AE8;
  aBlock[4] = v36;
  aBlock[5] = v34;
  v29 = a4;
  aBlock[6] = &v30;
  aBlock[7] = a1;
  v11 = *a2;
  v10 = (std::__shared_weak_count *)a2[1];
  aBlock[8] = a3;
  aBlock[9] = v11;
  v28 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = _Block_copy(aBlock);
  *a5 = v14;
  v31[3] = (uint64_t)v14;
  v15 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v16 = v31;
  v17 = operator new(0x18uLL);
  v18 = v16[3];
  v20 = *(_QWORD *)(a1 + 64);
  v19 = (_QWORD *)(a1 + 64);
  v17[1] = v19;
  v17[2] = v18;
  *v17 = v20;
  *(_QWORD *)(v20 + 8) = v17;
  *v19 = v17;
  ++v19[2];
  os_unfair_lock_unlock(v15);
  v21 = v28;
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
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
}

void sub_20DB0FC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;

  if (v28)
    _Block_release(v28);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v27);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v29 - 120), 8);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v26);
  _Unwind_Resume(a1);
}

uint64_t abpKernel::readAsync(abpKernel *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return IOABPClass::readAsync((abpKernel *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t abpKernel::writeAsync(abpKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return IOABPClass::writeAsync((abpKernel *)((char *)this + 8), a2, a3, a4, a5);
}

void getTypeString()
{
  __assert_rtn("getTypeString", "PCITransportTask.cpp", 126, "false");
}

void ___ZN3pci6system4info3getEv_block_invoke()
{
  pci::system::info *v0;
  std::__shared_weak_count *v1;
  unint64_t *v2;
  unint64_t v3;
  __int128 v4;

  v0 = (pci::system::info *)operator new();
  pci::system::info::info(v0);
  std::shared_ptr<pci::system::info>::shared_ptr[abi:ne180100]<pci::system::info,void>(&v4, v0);
  std::shared_ptr<pci::system::info>::operator=[abi:ne180100]((uint64_t)&pci::system::info::get(void)::sInstance, &v4);
  v1 = (std::__shared_weak_count *)*((_QWORD *)&v4 + 1);
  if (*((_QWORD *)&v4 + 1))
  {
    v2 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void sub_20DB0FD78(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BAF90C](v1, 0x1020C40399D3DCFLL);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<pci::system::info>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

pci::system::info *pci::system::info::info(pci::system::info *this)
{
  dispatch_workloop_t v2;
  pci::log *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  v2 = dispatch_workloop_create("com.apple.WirelessIPC.baseband.pci_workloop");
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 10) = (char *)this + 88;
  *((_QWORD *)this + 3) = v2;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 4) = (char *)this + 40;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = (char *)this + 64;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 12) = 0;
  v3 = (pci::log *)_TelephonyUtilDebugPrint();
  v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    pci::system::info::info(v4, v5, v6, v7, v8, v9, v10, v11);
  return this;
}

void sub_20DB0FED0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  std::__shared_weak_count *v7;

  std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(v3, *(_QWORD **)(v1 + 88));
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(v4, *(_QWORD **)(v1 + 64));
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(v2, *(_QWORD **)(v1 + 40));
  v6 = *(NSObject **)(v1 + 24);
  if (v6)
    dispatch_release(v6);
  v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
  _Unwind_Resume(a1);
}

void pci::system::info::~info(pci::system::info *this)
{
  pci::log *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  std::__shared_weak_count *v12;

  v2 = (pci::log *)_TelephonyUtilDebugPrint();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    pci::system::info::info(v3, v4, v5, v6, v7, v8, v9, v10);
  std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy((uint64_t)this + 80, *((_QWORD **)this + 11));
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy((uint64_t)this + 56, *((_QWORD **)this + 8));
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy((uint64_t)this + 32, *((_QWORD **)this + 5));
  v11 = *((_QWORD *)this + 3);
  if (v11)
    dispatch_release(v11);
  v12 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void pci::system::info::lock(os_unfair_lock_s *this)
{
  os_unfair_lock_lock(this + 4);
}

void pci::system::info::unlock(os_unfair_lock_s *this)
{
  os_unfair_lock_unlock(this + 4);
}

uint64_t pci::system::info::insertTH(uint64_t a1, uint64_t *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v14;
  std::__shared_weak_count *v15;

  v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v5 = ++pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  v7 = *a2;
  v6 = (std::__shared_weak_count *)a2[1];
  *(_QWORD *)&v14 = pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  *((_QWORD *)&v14 + 1) = v7;
  v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>((uint64_t **)(a1 + 32), &v14);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

void sub_20DB100B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t pci::system::info::eraseTH(pci::system::info *this, unint64_t a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  v4 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  v5 = (_QWORD *)*((_QWORD *)this + 5);
  if (!v5)
    goto LABEL_12;
  v6 = (uint64_t *)((char *)this + 40);
  do
  {
    v7 = v5[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == (uint64_t *)((char *)this + 40) || v6[4] > a2)
LABEL_12:
    pci::system::info::eraseTH();
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)this + 4, v6);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)(v6 + 5));
  operator delete(v6);
  os_unfair_lock_unlock(v4);
  return 1;
}

_QWORD *std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
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

uint64_t pci::system::info::insertBH(uint64_t a1, int a2, uint64_t **a3, unsigned int a4)
{
  os_unfair_lock_s *v8;
  pci::log *v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  uint64_t *v17;
  pci::log *v18;
  NSObject *v19;
  uint64_t **v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  _BOOL8 v26;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  uint64_t *v33;
  std::__shared_weak_count *v34;
  uint64_t *v35;
  unint64_t *p_shared_weak_owners;
  unint64_t v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  uint64_t *v40;
  uint64_t **v41;
  uint64_t *v42;
  uint64_t v43;
  dispatch_time_t v44;
  pci::log *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  BOOL v50;
  uint64_t *v51;
  pci::log *v52;
  NSObject *v53;
  _QWORD aBlock[8];
  std::__shared_weak_count *v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  int v62;
  _BYTE buf[12];
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  _BYTE v70[24];
  __int128 v71;
  dispatch_object_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v62 = a2;
  v8 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  v12 = a2;
  if (v11)
  {
    *(_DWORD *)v70 = 136316162;
    *(_QWORD *)&v70[4] = "system";
    *(_WORD *)&v70[12] = 2048;
    *(_QWORD *)&v70[14] = a1;
    *(_WORD *)&v70[22] = 1024;
    LODWORD(v71) = a2;
    WORD2(v71) = 2080;
    *(_QWORD *)((char *)&v71 + 6) = "insertBH";
    HIWORD(v71) = 1024;
    LODWORD(v72) = a2;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %u", v70, 0x2Cu);
    v12 = v62;
  }
  v13 = *(_QWORD *)(a1 + 64);
  if (!v13)
    goto LABEL_13;
  v14 = a1 + 64;
  do
  {
    v15 = *(_DWORD *)(v13 + 32);
    v16 = v15 < v12;
    if (v15 >= v12)
      v17 = (uint64_t *)v13;
    else
      v17 = (uint64_t *)(v13 + 8);
    if (!v16)
      v14 = v13;
    v13 = *v17;
  }
  while (*v17);
  if (v14 != a1 + 64 && v12 >= *(_DWORD *)(v14 + 32))
  {
    v29 = (uint64_t *)(a1 + 88);
    v28 = *(_QWORD *)(a1 + 88);
    if (!v28)
      goto LABEL_32;
    v30 = a1 + 88;
    do
    {
      v31 = *(_DWORD *)(v28 + 32);
      v32 = v31 < v12;
      if (v31 >= v12)
        v33 = (uint64_t *)v28;
      else
        v33 = (uint64_t *)(v28 + 8);
      if (!v32)
        v30 = v28;
      v28 = *v33;
    }
    while (*v33);
    if ((uint64_t *)v30 != v29 && v12 >= *(_DWORD *)(v30 + 32))
    {
      v52 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
      v53 = pci::log::get(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v70 = 136316162;
        *(_QWORD *)&v70[4] = "system";
        *(_WORD *)&v70[12] = 2048;
        *(_QWORD *)&v70[14] = a1;
        *(_WORD *)&v70[22] = 1024;
        LODWORD(v71) = a2;
        WORD2(v71) = 2080;
        *(_QWORD *)((char *)&v71 + 6) = "insertBH";
        HIWORD(v71) = 1024;
        LODWORD(v72) = v62;
        _os_log_debug_impl(&dword_20DB0C000, v53, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: already pending for interface %d", v70, 0x2Cu);
      }
      os_unfair_lock_unlock(v8);
      return 0;
    }
    else
    {
LABEL_32:
      v58 = 0;
      v59 = &v58;
      v60 = 0x2000000000;
      v61 = 1;
      *(_QWORD *)v70 = 0;
      *(_QWORD *)&v70[8] = v70;
      *(_QWORD *)&v70[16] = 0x3002000000;
      *(_QWORD *)&v71 = __Block_byref_object_copy_;
      *((_QWORD *)&v71 + 1) = __Block_byref_object_dispose_;
      v72 = dispatch_semaphore_create(0);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1174405120;
      aBlock[2] = ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke;
      aBlock[3] = &unk_24C8190E8;
      aBlock[4] = &v58;
      v56 = a2;
      v57 = v62;
      v35 = *a3;
      v34 = (std::__shared_weak_count *)a3[1];
      aBlock[6] = a1;
      aBlock[7] = v35;
      v55 = v34;
      if (v34)
      {
        p_shared_weak_owners = (unint64_t *)&v34->__shared_weak_owners_;
        do
          v37 = __ldxr(p_shared_weak_owners);
        while (__stxr(v37 + 1, p_shared_weak_owners));
      }
      aBlock[5] = v70;
      v38 = _Block_copy(aBlock);
      v39 = (void (**)(_QWORD, _QWORD))v38;
      if (v38)
        v40 = (uint64_t *)_Block_copy(v38);
      else
        v40 = 0;
      *(_QWORD *)buf = &v62;
      v41 = std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 80), &v62, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      v42 = v41[5];
      v41[5] = v40;
      if (v42)
        _Block_release(v42);
      os_unfair_lock_unlock(v8);
      v43 = *(_QWORD *)&v70[8];
      if (a4 == -1)
        v44 = -1;
      else
        v44 = dispatch_time(0, 1000000 * a4);
      if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v43 + 40), v44))
      {
        v45 = (pci::log *)_TelephonyUtilDebugPrintError();
        v46 = pci::log::get(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "system";
          v64 = 2048;
          v65 = a1;
          v66 = 1024;
          v67 = a2;
          v68 = 2080;
          v69 = "insertBH";
          _os_log_impl(&dword_20DB0C000, v46, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: Semaphore wait timed out!\n", buf, 0x26u);
        }
        os_unfair_lock_lock(v8);
        if (v39)
        {
          v47 = *v29;
          if (*v29)
          {
            v48 = a1 + 88;
            do
            {
              v49 = *(_DWORD *)(v47 + 32);
              v50 = v49 < v62;
              if (v49 >= v62)
                v51 = (uint64_t *)v47;
              else
                v51 = (uint64_t *)(v47 + 8);
              if (!v50)
                v48 = v47;
              v47 = *v51;
            }
            while (*v51);
            if ((uint64_t *)v48 != v29 && v62 >= *(_DWORD *)(v48 + 32))
            {
              v39[2](v39, 0);
              std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)(a1 + 80), (uint64_t *)v48);
              std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>(v48 + 32);
              operator delete((void *)v48);
            }
          }
        }
        os_unfair_lock_unlock(v8);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&v70[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
      }
      v26 = *((_BYTE *)v59 + 24) != 0;
      if (v55)
        std::__shared_weak_count::__release_weak(v55);
      _Block_object_dispose(v70, 8);
      if (v72)
        dispatch_release(v72);
      if (v39)
        _Block_release(v39);
      _Block_object_dispose(&v58, 8);
    }
  }
  else
  {
LABEL_13:
    v18 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
    v19 = pci::log::get(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v70 = 136316162;
      *(_QWORD *)&v70[4] = "system";
      *(_WORD *)&v70[12] = 2048;
      *(_QWORD *)&v70[14] = a1;
      *(_WORD *)&v70[22] = 1024;
      LODWORD(v71) = a2;
      WORD2(v71) = 2080;
      *(_QWORD *)((char *)&v71 + 6) = "insertBH";
      HIWORD(v71) = 1024;
      LODWORD(v72) = v62;
      _os_log_debug_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: add interface %d", v70, 0x2Cu);
    }
    *(_QWORD *)v70 = &v62;
    v20 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 56), &v62, (uint64_t)&std::piecewise_construct, (_DWORD **)v70);
    v22 = *a3;
    v21 = a3[1];
    if (v21)
    {
      v23 = (unint64_t *)(v21 + 2);
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    v25 = (std::__shared_weak_count *)v20[6];
    v20[5] = v22;
    v20[6] = v21;
    if (v25)
      std::__shared_weak_count::__release_weak(v25);
    os_unfair_lock_unlock(v8);
    return 1;
  }
  return v26;
}

void sub_20DB1081C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,char a24)
{
  const void *v24;
  uint64_t v25;
  NSObject *v27;

  if (a22)
    std::__shared_weak_count::__release_weak(a22);
  _Block_object_dispose((const void *)(v25 - 160), 8);
  v27 = *(NSObject **)(v25 - 120);
  if (v27)
    dispatch_release(v27);
  if (v24)
    _Block_release(v24);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

intptr_t ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  pci::log *v5;
  NSObject *v6;
  uint64_t **v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  int v14;
  _BYTE buf[12];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "system";
    v16 = 2048;
    v17 = v4;
    v18 = 1024;
    v19 = v14;
    v20 = 2080;
    v21 = "insertBH_block_invoke";
    v22 = 1024;
    v23 = a2;
    _os_log_debug_impl(&dword_20DB0C000, v6, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: completion %u", buf, 0x2Cu);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (a2)
  {
    *(_QWORD *)buf = a1 + 76;
    v7 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(v4 + 56), (int *)(a1 + 76), (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
    v9 = *(uint64_t **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 16);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (std::__shared_weak_count *)v7[6];
    v7[5] = v9;
    v7[6] = (uint64_t *)v8;
    if (v12)
      std::__shared_weak_count::__release_weak(v12);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __copy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(result + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 64) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t pci::system::info::removeBH(pci::system::info *this, int a2)
{
  os_unfair_lock_s *v4;
  pci::log *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t *v8;
  int v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t **v16;
  char *v17;
  uint64_t **v18;
  int v19;
  BOOL v20;
  char **v21;

  v4 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    pci::system::info::removeBH((uint64_t)this, a2, v6);
  v7 = *((_QWORD *)this + 8);
  if (!v7)
    goto LABEL_13;
  v8 = (uint64_t *)((char *)this + 64);
  do
  {
    v9 = *(_DWORD *)(v7 + 32);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (uint64_t *)v7;
    else
      v11 = (uint64_t *)(v7 + 8);
    if (!v10)
      v8 = (uint64_t *)v7;
    v7 = *v11;
  }
  while (*v11);
  if (v8 == (uint64_t *)((char *)this + 64) || *((_DWORD *)v8 + 8) > a2)
LABEL_13:
    pci::system::info::removeBH();
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase((uint64_t **)this + 7, v8);
  v17 = (char *)*((_QWORD *)this + 11);
  v16 = (uint64_t **)((char *)this + 88);
  v15 = v17;
  if (v17)
  {
    v18 = v16;
    do
    {
      v19 = *((_DWORD *)v15 + 8);
      v20 = v19 < a2;
      if (v19 >= a2)
        v21 = (char **)v15;
      else
        v21 = (char **)(v15 + 8);
      if (!v20)
        v18 = (uint64_t **)v15;
      v15 = *v21;
    }
    while (*v21);
    if (v18 != v16 && *((_DWORD *)v18 + 8) <= a2)
    {
      ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))v18[5][2])(v18[5], 1, v12, v13, v14);
      std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(v16 - 1, (uint64_t *)v18);
      std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)(v18 + 4));
      operator delete(v18);
    }
  }
  os_unfair_lock_unlock(v4);
  return 1;
}

_QWORD *std::shared_ptr<pci::system::info>::shared_ptr[abi:ne180100]<pci::system::info,void>(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24C819128;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>((uint64_t)a1, a2, (uint64_t)a2);
  return a1;
}

void sub_20DB10C68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<pci::system::info>::reset[abi:ne180100]((pci::system::info **)va, 0);
  _Unwind_Resume(a1);
}

void std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
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

void std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

pci::system::info *std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__on_zero_shared(uint64_t a1)
{
  pci::system::info *result;

  result = *(pci::system::info **)(a1 + 24);
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__get_deleter(uint64_t a1, uint64_t a2)
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

pci::system::info *std::unique_ptr<pci::system::info>::reset[abi:ne180100](pci::system::info **a1, pci::system::info *a2)
{
  pci::system::info *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

void std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, a2[1]);
    std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)(a2 + 5));
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  std::__shared_weak_count *v4;

  if (a2)
  {
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, a2[1]);
    v4 = (std::__shared_weak_count *)a2[6];
    if (v4)
      std::__shared_weak_count::__release_weak(v4);
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

uint64_t std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](uint64_t a1)
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

_OWORD *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>(uint64_t **a1, __int128 *a2)
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;
  _QWORD v11[2];
  char v12;

  v4 = operator new(0x38uLL);
  v5 = *a2;
  v6 = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  v7 = a1 + 1;
  v8 = a1[1];
  v11[0] = v4;
  v11[1] = a1 + 1;
  v4[2] = v5;
  *((_QWORD *)v4 + 6) = v6;
  v12 = 1;
  if (v8)
  {
    do
    {
      while (1)
      {
        v7 = (uint64_t **)v8;
        if ((unint64_t)v5 >= v8[4])
          break;
        v8 = (uint64_t *)*v8;
        v9 = v7;
        if (!*v7)
          goto LABEL_8;
      }
      v8 = (uint64_t *)v8[1];
    }
    while (v8);
    v9 = v7 + 1;
  }
  else
  {
    v9 = a1 + 1;
  }
LABEL_8:
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  v11[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  return v4;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void std::unique_ptr<std::__tree_node<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)v2 + 40);
    operator delete(v2);
  }
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
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
    if (*(uint64_t **)v12 == v7)
      break;
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
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
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
      else
      {
        v15 = v7;
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
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
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
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
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
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
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
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

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
        v10 = *((_DWORD *)v6 + 8);
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
    v11 = operator new(0x38uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    *((_QWORD *)v11 + 6) = 0;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t **std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t **v9;
  int v10;
  int v11;
  _DWORD *v12;
  _QWORD v14[2];
  char v15;

  v7 = a1 + 1;
  v6 = a1[1];
  v8 = a1 + 1;
  v9 = a1 + 1;
  if (v6)
  {
    v10 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11)
          break;
        v6 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v11 >= v10)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = operator new(0x30uLL);
    v14[1] = v7;
    v12[8] = **a4;
    *((_QWORD *)v12 + 5) = 0;
    v15 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void std::unique_ptr<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

uint64_t *std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  std::__shared_weak_count *v4;

  v3 = std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(a1, a2);
  v4 = (std::__shared_weak_count *)a2[6];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a2);
  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

double TelephonyBasebandPCITransportInitParameters(uint64_t a1)
{
  double result;

  if (a1)
    return pci::transport::th::initParams(a1);
  return result;
}

BOOL TelephonyBasebandPCITransportCreate(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  pci::log *v14;
  NSObject *v15;
  pci::log *v17;
  NSObject *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint8_t v24[8];
  std::__shared_weak_count *v25;
  uint8_t buf[8];
  std::__shared_weak_count *v27;

  if (!a1)
  {
    v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "no tu transport object", buf, 2u);
    }
    return 0;
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  if (!pci::transport::th::validateParams(a2))
    return 0;
  pci::transport::th::create(a2, (pci::transport::th **)buf);
  v4 = *(_QWORD *)buf != 0;
  if (*(_QWORD *)buf)
  {
    pci::system::info::get(v24);
    v5 = *(_QWORD *)v24;
    v22 = *(_QWORD *)buf;
    v23 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    *(_QWORD *)(a1 + 80) = pci::system::info::insertTH(v5, &v22);
    v8 = v23;
    if (v23)
    {
      v9 = (unint64_t *)&v23->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = v25;
    if (v25)
    {
      v12 = (unint64_t *)&v25->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    *(_QWORD *)a1 = TelephonyBasebandPCITransportWrite;
    *(_QWORD *)(a1 + 8) = TelephonyBasebandPCITransportRead;
    *(_QWORD *)(a1 + 32) = TelephonyBasebandPCITransportSendImage;
    *(_QWORD *)(a1 + 40) = TelephonyBasebandPCITransportReadRegister;
    *(_QWORD *)(a1 + 16) = TelephonyBasebandPCITransportUnblockRead;
    *(_QWORD *)(a1 + 24) = TelephonyBasebandPCITransportFlushRead;
    *(_QWORD *)(a1 + 48) = TelephonyBasebandPCITransportFree;
    *(_QWORD *)(a1 + 56) = TelephonyBasebandPCITransportIsValid;
  }
  else
  {
    v17 = (pci::log *)_TelephonyUtilDebugPrintError();
    v18 = pci::log::get(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_20DB0C000, v18, OS_LOG_TYPE_INFO, "failed to create transport internal", v24, 2u);
    }
  }
  v19 = v27;
  if (v27)
  {
    v20 = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  return v4;
}

void sub_20DB11B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportFree(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  pci::log *v9;
  NSObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  __int128 buf;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportFree();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v15);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = v15;
  if (v15)
  {
    pci::system::info::get(&buf);
    pci::system::info::eraseTH((pci::system::info *)buf, *(_QWORD *)(a1 + 80));
    v6 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
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
  else
  {
    v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    v10 = pci::log::get(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
  }
  v11 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v5 != 0;
}

void sub_20DB11D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t TelephonyBasebandPCITransportRead(uint64_t a1, const unsigned __int8 *a2, unsigned int a3, unsigned int *a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  pci::log *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  pci::log *v20;
  NSObject *v21;
  pci::log *v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint8_t buf[8];
  std::__shared_weak_count *v29;
  unsigned int v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  if (!a1)
    TelephonyBasebandPCITransportRead();
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    pci::system::info::get(&v31);
    pci::system::info::getTH((os_unfair_lock_s *)v31, *(_QWORD *)(a1 + 80), buf);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (*(_QWORD *)buf)
    {
      if (!*(_BYTE *)(*(_QWORD *)buf + 74))
      {
        if (pci::transport::th::read(*(pci::transport::th **)buf, a2, &v30, a7, a6))
        {
          *a4 = v30;
          a7 = 1;
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      v15 = (pci::log *)_TelephonyUtilDebugPrintError();
      v16 = pci::log::get(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        v17 = "client cannot issue read for async transport";
        v18 = v16;
        v19 = 2;
LABEL_20:
        _os_log_impl(&dword_20DB0C000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v31, v19);
      }
    }
    else
    {
      v22 = (pci::log *)_TelephonyUtilDebugPrintError();
      v23 = pci::log::get(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v31) = 134217984;
        *(_QWORD *)((char *)&v31 + 4) = a1;
        v17 = "transport %p is not valid";
        v18 = v23;
        v19 = 12;
        goto LABEL_20;
      }
    }
    if (!a7)
    {
LABEL_24:
      v24 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      return a7;
    }
    ((void (*)(const unsigned __int8 *))a7)(a2);
LABEL_23:
    a7 = 0;
    goto LABEL_24;
  }
  v20 = (pci::log *)_TelephonyUtilDebugPrintError();
  v21 = pci::log::get(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB0C000, v21, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
  }
  if (a7)
  {
    ((void (*)(const unsigned __int8 *))a7)(a2);
    return 0;
  }
  return a7;
}

void sub_20DB11FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportSendImage(uint64_t a1, const unsigned __int8 *a2, int a3, int *a4, unsigned int a5, unsigned int *a6, _BOOL8 a7)
{
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  pci::log *v17;
  NSObject *v18;
  pci::log *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint8_t buf[8];
  std::__shared_weak_count *v26;
  unsigned int v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  if (!a1)
    TelephonyBasebandPCITransportSendImage();
  if (a3 && a2 && a4 && a6)
  {
    *a4 = 0;
    *a6 = 0;
    pci::system::info::get(&v28);
    pci::system::info::getTH((os_unfair_lock_s *)v28, *(_QWORD *)(a1 + 80), buf);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (*(_QWORD *)buf)
    {
      if (*(_BYTE *)(*(_QWORD *)buf + 74))
      {
        a7 = pci::transport::th::sendImageAsync(*(pci::transport::th **)buf, a2, a3, a7);
LABEL_25:
        v21 = v26;
        if (v26)
        {
          p_shared_owners = (unint64_t *)&v26->__shared_owners_;
          do
            v23 = __ldaxr(p_shared_owners);
          while (__stlxr(v23 - 1, p_shared_owners));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        return a7;
      }
      if (pci::transport::th::sendImage(*(pci::transport::th **)buf, a2, a3, &v27, a7, a5))
      {
        *a4 = a3;
        *a6 = v27;
        a7 = 1;
        goto LABEL_25;
      }
    }
    else
    {
      v19 = (pci::log *)_TelephonyUtilDebugPrintError();
      v20 = pci::log::get(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LODWORD(v28) = 134217984;
        *(_QWORD *)((char *)&v28 + 4) = a1;
        _os_log_impl(&dword_20DB0C000, v20, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v28, 0xCu);
      }
      if (!a7)
        goto LABEL_25;
      ((void (*)(const unsigned __int8 *))a7)(a2);
    }
    a7 = 0;
    goto LABEL_25;
  }
  v17 = (pci::log *)_TelephonyUtilDebugPrintError();
  v18 = pci::log::get(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB0C000, v18, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
  }
  if (a7)
  {
    ((void (*)(const unsigned __int8 *))a7)(a2);
    return 0;
  }
  return a7;
}

void sub_20DB122A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t TelephonyBasebandPCITransportReadRegister(uint64_t a1, uint64_t a2, const unsigned __int8 *a3, unsigned int a4, unsigned int *a5)
{
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  pci::log *v13;
  NSObject *v14;
  pci::log *v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint8_t buf[8];
  std::__shared_weak_count *v22;
  unsigned int v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = a4;
  if (!a1)
    TelephonyBasebandPCITransportReadRegister();
  if (a4 && a3 && a5)
  {
    *a5 = 0;
    pci::system::info::get(&v24);
    pci::system::info::getTH((os_unfair_lock_s *)v24, *(_QWORD *)(a1 + 80), buf);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    if (*(_QWORD *)buf)
    {
      if (pci::transport::th::readRegister(*(pci::transport::th **)buf, a2, a3, &v23, 0xFFFFFFFF))
      {
        *a5 = v23;
        v12 = 1;
LABEL_19:
        v17 = v22;
        if (v22)
        {
          p_shared_owners = (unint64_t *)&v22->__shared_owners_;
          do
            v19 = __ldaxr(p_shared_owners);
          while (__stlxr(v19 - 1, p_shared_owners));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        return v12;
      }
    }
    else
    {
      v15 = (pci::log *)_TelephonyUtilDebugPrintError();
      v16 = pci::log::get(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LODWORD(v24) = 134217984;
        *(_QWORD *)((char *)&v24 + 4) = a1;
        _os_log_impl(&dword_20DB0C000, v16, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v24, 0xCu);
      }
    }
    v12 = 0;
    goto LABEL_19;
  }
  v13 = (pci::log *)_TelephonyUtilDebugPrintError();
  v14 = pci::log::get(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB0C000, v14, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
  }
  return 0;
}

void sub_20DB124EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t TelephonyBasebandPCITransportUnblockRead(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  pci::log *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  pci::transport::th *v12;
  std::__shared_weak_count *v13;
  __int128 buf;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportUnblockRead();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v12);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (v12)
  {
    v5 = pci::transport::th::unblockRead((os_unfair_lock_t *)v12);
  }
  else
  {
    v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    v7 = pci::log::get(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v5 = 0;
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v5;
}

void sub_20DB12684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportFlushRead(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  _BOOL8 v5;
  pci::log *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  pci::transport::th *v12;
  std::__shared_weak_count *v13;
  __int128 buf;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportFlushRead();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v12);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (v12)
  {
    v5 = pci::transport::th::flushRead(v12);
  }
  else
  {
    v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    v7 = pci::log::get(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v5 = 0;
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v5;
}

void sub_20DB1281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportIsValid(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  pci::log *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  __int128 buf;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportIsValid();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v12);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = v12;
  if (!v12)
  {
    v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    v7 = pci::log::get(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v5 != 0;
}

void sub_20DB129B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportTimesync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _BOOL8 v11;
  pci::log *v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  __int128 buf;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportTimesync_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v18);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v18)
  {
    v11 = pci::transport::th::timesyncAsync(v18, a2, a3, a4);
  }
  else
  {
    v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    v13 = pci::log::get(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v11 = 0;
  }
  v14 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v11;
}

void sub_20DB12B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportRegisterTimeEvent(uint64_t a1, uint64_t a2, NSObject *a3)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _BOOL8 v9;
  pci::log *v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  __int128 buf;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportRegisterTimeEvent_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v16);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (v16)
  {
    v9 = pci::transport::th::registerTimeEvent(v16, a2, a3);
  }
  else
  {
    v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
  }
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v9;
}

void sub_20DB12D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportDeregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _BOOL8 v7;
  pci::log *v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;
  __int128 buf;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportDeregisterTimeEvent_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v14);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v14)
  {
    v7 = pci::transport::th::deregisterTimeEvent(v14, a2);
  }
  else
  {
    v8 = (pci::log *)_TelephonyUtilDebugPrintError();
    v9 = pci::log::get(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v7 = 0;
  }
  v10 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v7;
}

void sub_20DB12EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportMapRegion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _BOOL8 v13;
  pci::log *v14;
  NSObject *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  __int128 buf;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportMapRegion_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v20);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v20)
  {
    v13 = pci::transport::th::mapRegionAsync(v20, a2, a3, a4, 0, 0, a5);
  }
  else
  {
    v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v13 = 0;
  }
  v16 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  return v13;
}

void sub_20DB13098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportMapRegionwithClientData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _BOOL8 v17;
  pci::log *v18;
  NSObject *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v24;
  std::__shared_weak_count *v25;
  __int128 buf;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportMapRegionwithClientData_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v24);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v24)
  {
    v17 = pci::transport::th::mapRegionAsync(v24, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    v18 = (pci::log *)_TelephonyUtilDebugPrintError();
    v19 = pci::log::get(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v17 = 0;
  }
  v20 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return v17;
}

void sub_20DB13278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandPCITransportUnmapRegion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _BOOL8 v9;
  pci::log *v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  __int128 buf;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    TelephonyBasebandPCITransportUnmapRegion_cold_1();
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(_QWORD *)(a1 + 80), &v16);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (v16)
  {
    v9 = pci::transport::th::unmapRegionAsync(v16, a2, a3);
  }
  else
  {
    v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
  }
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v9;
}

void sub_20DB13428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

os_log_t ___ZN3pci3log3getEv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.telephony.ipc", "PCI");
  pci::log::get(void)::logger = (uint64_t)result;
  return result;
}

BOOL pci::transport::kernel::isServicePresent(pci::transport::kernel *this, const char *a2)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_service_t v5;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching((const char *)this);
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v5 != 0;
}

uint64_t pci::transport::kernel::probeVariant(pci::transport::kernel *this)
{
  if (pci::transport::kernel::probeVariant(void)::sOnce != -1)
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  return pci::transport::kernel::probeVariant(void)::ret;
}

void ___ZN3pci9transport6kernel12probeVariantEv_block_invoke()
{
  const char *v0;
  _QWORD **v1;
  _QWORD *v2;
  _QWORD **v3;
  BOOL v4;
  int v5;
  _QWORD **v6;
  _QWORD *v7[2];
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8[0] = xmmword_24C819210;
  v8[1] = *(_OWORD *)&off_24C819220;
  std::map<char const*,pci::transport::kernel::variant>::map[abi:ne180100]((uint64_t)&v6, (unint64_t *)v8, 2);
  v1 = v6;
  if (v6 == v7)
  {
LABEL_9:
    v5 = 0;
  }
  else
  {
    while (!pci::transport::kernel::isServicePresent((pci::transport::kernel *)v1[4], v0))
    {
      v2 = v1[1];
      if (v2)
      {
        do
        {
          v3 = (_QWORD **)v2;
          v2 = (_QWORD *)*v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          v3 = (_QWORD **)v1[2];
          v4 = *v3 == v1;
          v1 = v3;
        }
        while (!v4);
      }
      v1 = v3;
      if (v3 == v7)
        goto LABEL_9;
    }
    v5 = *((_DWORD *)v1 + 10);
  }
  pci::transport::kernel::probeVariant(void)::ret = v5;
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v6, v7[0]);
}

void sub_20DB135F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11)
{
  _Unwind_Resume(exception_object);
}

unint64_t pci::transport::kernel::errorAsUnsigned(unint64_t a1)
{
  return HIDWORD(a1);
}

const char *pci::transport::kernel::errorAsString(int a1)
{
  if (a1 == 2)
    return (const char *)getACIPCErrorTypeString();
  if (a1 == 1)
    return (const char *)getABPErrorTypeString();
  return "unrecognized error code";
}

uint64_t pci::transport::kernel::getTimesyncBufferSize(pci::transport::kernel *this, int a2)
{
  unsigned int v3;
  int v4;

  v3 = (*(uint64_t (**)(pci::transport::kernel *))(*(_QWORD *)this + 176))(this);
  if (v3 <= 0x18)
    v4 = 24;
  else
    v4 = v3;
  return (v4 * a2);
}

uint64_t pci::transport::kernel::marshalTimesyncResults(pci::transport::kernel *this, char *a2, unsigned int a3)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  int v11;
  char *v12;
  __int128 v14;
  uint64_t v15;

  v6 = (*(uint64_t (**)(pci::transport::kernel *))(*(_QWORD *)this + 176))(this);
  v7 = a3 / v6;
  if (v6 <= a3)
  {
    v8 = v6;
    v9 = 0;
    if (v7 <= 1)
      v10 = 1;
    else
      v10 = v7;
    do
    {
      v11 = v7 + ~v9;
      (*(void (**)(__int128 *__return_ptr, pci::transport::kernel *, char *))(*(_QWORD *)this + 184))(&v14, this, &a2[v11 * v8]);
      v12 = &a2[24 * v11];
      *(_OWORD *)v12 = v14;
      *((_QWORD *)v12 + 2) = v15;
      ++v9;
      --v10;
    }
    while (v10);
  }
  return v7;
}

uint64_t abpKernel::pciTransportInterfaceToABP(int a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  int v8;
  int v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int __dst[72];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v8 = a1;
    a1 = v8;
    if (v9)
    {
      memcpy(__dst, &unk_24C819230, sizeof(__dst));
      std::map<PCITransportInterface,char const*>::map[abi:ne180100]((uint64_t)&v11, __dst, 18);
      v10 = (_QWORD *)v12;
      abpKernel::pciTransportInterfaceToABP(PCITransportInterface)::sMap = (uint64_t)v11;
      qword_253DA69B0 = v12;
      qword_253DA69B8 = v13;
      if (v13)
      {
        *(_QWORD *)(v12 + 16) = &qword_253DA69B0;
        v11 = &v12;
        v12 = 0;
        v13 = 0;
        v10 = 0;
      }
      else
      {
        abpKernel::pciTransportInterfaceToABP(PCITransportInterface)::sMap = (uint64_t)&qword_253DA69B0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  v2 = qword_253DA69B0;
  if (!qword_253DA69B0)
    return 0;
  v3 = &qword_253DA69B0;
  do
  {
    v4 = *(_DWORD *)(v2 + 32);
    v5 = v4 < a1;
    if (v4 >= a1)
      v6 = (uint64_t *)v2;
    else
      v6 = (uint64_t *)(v2 + 8);
    if (!v5)
      v3 = (uint64_t *)v2;
    v2 = *v6;
  }
  while (*v6);
  if (v3 != &qword_253DA69B0 && *((_DWORD *)v3 + 8) <= a1)
    return v3[5];
  else
    return 0;
}

void sub_20DB138A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t abpKernel::pciTransportRegisterToABP(int a1)
{
  unsigned __int8 v1;
  unint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  unint64_t *v6;
  uint64_t v7;
  int v9;
  int v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v9 = a1;
    a1 = v9;
    if (v10)
    {
      v15[0] = xmmword_20DB27FA0;
      v15[1] = unk_20DB27FB0;
      v15[2] = xmmword_20DB27FC0;
      std::map<PCITransportRegister,unsigned int>::map[abi:ne180100]((uint64_t)&v12, (int *)v15, 6);
      v11 = (_QWORD *)v13;
      abpKernel::pciTransportRegisterToABP(PCITransportRegister)::sMap = (uint64_t)v12;
      qword_253DA6998 = v13;
      qword_253DA69A0 = v14;
      if (v14)
      {
        *(_QWORD *)(v13 + 16) = &qword_253DA6998;
        v12 = &v13;
        v13 = 0;
        v14 = 0;
        v11 = 0;
      }
      else
      {
        abpKernel::pciTransportRegisterToABP(PCITransportRegister)::sMap = (uint64_t)&qword_253DA6998;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v12, v11);
      a1 = v9;
    }
  }
  v2 = qword_253DA6998;
  if (qword_253DA6998)
  {
    v3 = &qword_253DA6998;
    do
    {
      v4 = *(_DWORD *)(v2 + 28);
      v5 = v4 < a1;
      if (v4 >= a1)
        v6 = (unint64_t *)v2;
      else
        v6 = (unint64_t *)(v2 + 8);
      if (!v5)
        v3 = (uint64_t *)v2;
      v2 = *v6;
    }
    while (*v6);
    if (v3 == &qword_253DA6998 || *((_DWORD *)v3 + 7) > a1)
    {
      v7 = 0;
      v2 = 0;
    }
    else
    {
      v2 = (unint64_t)*((unsigned int *)v3 + 8) << 32;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  return v2 | v7;
}

void sub_20DB13A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *abpKernel::wrapNotificationBlock@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  void *result;
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN9abpKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke;
    aBlock[3] = &unk_24C819358;
    aBlock[4] = a1;
    result = _Block_copy(aBlock);
  }
  else
  {
    result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN9abpKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t abpKernel::start(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  const void *v7;
  uint64_t v8;
  const void *v10;

  if (!abpKernel::pciTransportInterfaceToABP(a2))
    return 0;
  abpKernel::wrapNotificationBlock(a6, &v10);
  v7 = v10;
  v8 = IOABPClass::start();
  if (v7)
    _Block_release(v7);
  return v8;
}

{
  const void *v7;
  uint64_t v8;
  const void *v10;

  if (!abpKernel::pciTransportInterfaceToABP(a2))
    return 0;
  abpKernel::wrapNotificationBlock(a6, &v10);
  v7 = v10;
  v8 = IOABPClass::start();
  if (v7)
    _Block_release(v7);
  return v8;
}

void sub_20DB13B70(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void sub_20DB13C30(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

uint64_t abpKernel::readRegister(uint64_t a1, int a2, void *a3, unsigned int *a4)
{
  unint64_t v7;

  v7 = abpKernel::pciTransportRegisterToABP(a2);
  if ((_BYTE)v7)
    return IOABPClass::readRegister((IOABPClass *)(a1 + 8), HIDWORD(v7), a3, a4);
  else
    return 3758097090;
}

uint64_t abpKernel::abortChannelAsync(uint64_t a1, int a2)
{
  if ((a2 - 3) <= 0xFFFFFFFD)
    abpKernel::abortChannelAsync();
  return IOABPClass::abortChannelAsync();
}

uint64_t abpKernel::startChannelAsync(uint64_t a1, int a2)
{
  if ((a2 - 3) <= 0xFFFFFFFD)
    abpKernel::startChannelAsync();
  return IOABPClass::startChannelAsync();
}

uint64_t abpKernel::PCITransportTimeDomainToABP(uint64_t a1, int a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t *v4;
  int v5;
  BOOL v6;
  uint64_t *v7;
  int v8;
  int v10;
  int v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  int v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((v2 & 1) == 0)
  {
    v10 = a2;
    a2 = v10;
    if (v11)
    {
      v16 = 1;
      v17 = 1;
      v18 = 2;
      v19 = 2;
      std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100]((uint64_t)&v13, &v16, 2);
      v12 = (_QWORD *)v14;
      abpKernel::PCITransportTimeDomainToABP(PCITransportTimeDomain)::sMap = (uint64_t)v13;
      qword_2549D96D0 = v14;
      qword_2549D96D8 = v15;
      if (v15)
      {
        *(_QWORD *)(v14 + 16) = &qword_2549D96D0;
        v13 = &v14;
        v14 = 0;
        v15 = 0;
        v12 = 0;
      }
      else
      {
        abpKernel::PCITransportTimeDomainToABP(PCITransportTimeDomain)::sMap = (uint64_t)&qword_2549D96D0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v13, v12);
      a2 = v10;
    }
  }
  v3 = qword_2549D96D0;
  if (qword_2549D96D0)
  {
    v4 = &qword_2549D96D0;
    do
    {
      v5 = *(_DWORD *)(v3 + 28);
      v6 = v5 < a2;
      if (v5 >= a2)
        v7 = (uint64_t *)v3;
      else
        v7 = (uint64_t *)(v3 + 8);
      if (!v6)
        v4 = (uint64_t *)v3;
      v3 = *v7;
    }
    while (*v7);
    if (v4 == &qword_2549D96D0 || *((_DWORD *)v4 + 7) > a2)
    {
      v8 = 0;
      LODWORD(v3) = 0;
    }
    else
    {
      LODWORD(v3) = *((unsigned __int8 *)v4 + 32);
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8 | ((_DWORD)v3 << 8);
}

void sub_20DB13E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t abpKernel::timesyncAsync(uint64_t a1, int a2, int a3, void *a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  uint64_t v7;
  uint64_t v8;
  __int16 v13;

  v7 = 3758097090;
  v8 = (32 * a3);
  if (v8 > a5)
    return 3758097115;
  v13 = abpKernel::PCITransportTimeDomainToABP(a1, a2);
  if ((_BYTE)v13)
    return IOABPClass::timeSyncAsync((IOABPClass *)(a1 + 8), HIBYTE(v13), a4, v8, a6, a7);
  return v7;
}

uint64_t abpKernel::registerTimeEvent(uint64_t a1, uint64_t a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  if (abpKernel::PCITransportTimeDomainToABP(a1, a2))
    return IOABPClass::registerTimeEvent((IOABPClass *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

uint64_t abpKernel::deregisterTimeEvent(uint64_t a1, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  if (abpKernel::PCITransportTimeDomainToABP(a1, a2))
    return IOABPClass::deregisterTimeEvent((IOABPClass *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

void abpKernel::marshalTimesyncMeasurement(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = a1[1];
  v4 = *((_DWORD *)a1 + 4) - v3;
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = v4;
  v5 = a1[3];
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v5;
}

uint64_t abpKernel::mapRegionAsync(uint64_t a1, unsigned __int16 a2, const void *a3, uint64_t a4, int a5, int a6, void (*a7)(void *, int), void *a8)
{
  return IOABPClass::mapMemoryAsync((IOABPClass *)(a1 + 8), a2, a3, a4, a7, a8);
}

uint64_t abpKernel::unmapRegionAsync(uint64_t a1, unsigned __int16 a2, void (*a3)(void *, int), void *a4)
{
  return IOABPClass::unmapMemoryAsync((IOABPClass *)(a1 + 8), a2, a3, a4);
}

void *abpKernelControl::wrapControlEventBlock@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  void *result;
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN16abpKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke;
    aBlock[3] = &unk_24C819380;
    aBlock[4] = a1;
    result = _Block_copy(aBlock);
  }
  else
  {
    result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN16abpKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t abpKernelControl::registerEventNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;
  uint64_t v4;
  const void *v6;

  abpKernelControl::wrapControlEventBlock(a3, &v6);
  v3 = v6;
  v4 = IOABPControlClass::registerEventNotification();
  if (v3)
    _Block_release(v3);
  return v4;
}

{
  const void *v3;
  uint64_t v4;
  const void *v6;

  abpKernelControl::wrapControlEventBlock(a3, &v6);
  v3 = v6;
  v4 = IOABPControlClass::registerEventNotification();
  if (v3)
    _Block_release(v3);
  return v4;
}

void sub_20DB1410C(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void sub_20DB14190(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void acipcKernel::acipcKernel(acipcKernel *this)
{
  _QWORD *v2;

  *(_QWORD *)this = &off_24C8193B0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  IOACIPCClass::IOACIPCClass((acipcKernel *)((char *)this + 8));
  *v2 = MEMORY[0x24BED4860] + 16;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 27) = -1;
}

uint64_t acipcKernel::pciTransportInterfaceToACIPC(int a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  int v8;
  int v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[13];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v8 = a1;
    a1 = v8;
    if (v9)
    {
      v14[9] = unk_24C819500;
      v14[10] = xmmword_24C819510;
      v14[11] = unk_24C819520;
      v14[12] = xmmword_24C819530;
      v14[7] = unk_24C8194E0;
      v14[8] = xmmword_24C8194F0;
      v14[2] = xmmword_24C819490;
      v14[3] = unk_24C8194A0;
      v14[5] = unk_24C8194C0;
      v14[6] = xmmword_24C8194D0;
      v14[4] = xmmword_24C8194B0;
      v14[0] = xmmword_24C819470;
      v14[1] = unk_24C819480;
      std::map<PCITransportInterface,__CFString const*>::map[abi:ne180100]((uint64_t)&v11, (int *)v14, 13);
      v10 = (_QWORD *)v12;
      acipcKernel::pciTransportInterfaceToACIPC(PCITransportInterface)::sMap = (uint64_t)v11;
      qword_253DA69D0 = v12;
      qword_253DA69D8 = v13;
      if (v13)
      {
        *(_QWORD *)(v12 + 16) = &qword_253DA69D0;
        v11 = &v12;
        v12 = 0;
        v13 = 0;
        v10 = 0;
      }
      else
      {
        acipcKernel::pciTransportInterfaceToACIPC(PCITransportInterface)::sMap = (uint64_t)&qword_253DA69D0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  v2 = qword_253DA69D0;
  if (!qword_253DA69D0)
    return 0;
  v3 = &qword_253DA69D0;
  do
  {
    v4 = *(_DWORD *)(v2 + 32);
    v5 = v4 < a1;
    if (v4 >= a1)
      v6 = (uint64_t *)v2;
    else
      v6 = (uint64_t *)(v2 + 8);
    if (!v5)
      v3 = (uint64_t *)v2;
    v2 = *v6;
  }
  while (*v6);
  if (v3 != &qword_253DA69D0 && *((_DWORD *)v3 + 8) <= a1)
    return v3[5];
  else
    return 0;
}

void sub_20DB143C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t acipcKernel::pciTransportRegisterToACIPC(int a1)
{
  unsigned __int8 v1;
  unint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  unint64_t *v6;
  uint64_t v7;
  int v9;
  int v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v9 = a1;
    a1 = v9;
    if (v10)
    {
      v15[0] = 5;
      std::map<PCITransportRegister,unsigned int>::map[abi:ne180100]((uint64_t)&v12, (int *)v15, 1);
      v11 = (_QWORD *)v13;
      acipcKernel::pciTransportRegisterToACIPC(PCITransportRegister)::sMap = (uint64_t)v12;
      qword_253DA6958 = v13;
      qword_253DA6960 = v14;
      if (v14)
      {
        *(_QWORD *)(v13 + 16) = &qword_253DA6958;
        v12 = &v13;
        v13 = 0;
        v14 = 0;
        v11 = 0;
      }
      else
      {
        acipcKernel::pciTransportRegisterToACIPC(PCITransportRegister)::sMap = (uint64_t)&qword_253DA6958;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v12, v11);
      a1 = v9;
    }
  }
  v2 = qword_253DA6958;
  if (qword_253DA6958)
  {
    v3 = &qword_253DA6958;
    do
    {
      v4 = *(_DWORD *)(v2 + 28);
      v5 = v4 < a1;
      if (v4 >= a1)
        v6 = (unint64_t *)v2;
      else
        v6 = (unint64_t *)(v2 + 8);
      if (!v5)
        v3 = (uint64_t *)v2;
      v2 = *v6;
    }
    while (*v6);
    if (v3 == &qword_253DA6958 || *((_DWORD *)v3 + 7) > a1)
    {
      v7 = 0;
      v2 = 0;
    }
    else
    {
      v2 = (unint64_t)*((unsigned int *)v3 + 8) << 32;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  return v2 | v7;
}

void sub_20DB14544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t acipcKernel::PCITransportTimeDomainToACIPC(int a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  int v7;
  int v9;
  int v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v9 = a1;
    a1 = v9;
    if (v10)
    {
      v15[0] = xmmword_20DB27FD0;
      v15[1] = unk_20DB27FE0;
      v16 = 0x300000005;
      std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100]((uint64_t)&v12, (int *)v15, 5);
      v11 = (_QWORD *)v13;
      acipcKernel::PCITransportTimeDomainToACIPC(PCITransportTimeDomain)::sMap = (uint64_t)v12;
      qword_253DA6970 = v13;
      qword_253DA6978 = v14;
      if (v14)
      {
        *(_QWORD *)(v13 + 16) = &qword_253DA6970;
        v12 = &v13;
        v13 = 0;
        v14 = 0;
        v11 = 0;
      }
      else
      {
        acipcKernel::PCITransportTimeDomainToACIPC(PCITransportTimeDomain)::sMap = (uint64_t)&qword_253DA6970;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v12, v11);
      a1 = v9;
    }
  }
  v2 = qword_253DA6970;
  if (qword_253DA6970)
  {
    v3 = &qword_253DA6970;
    do
    {
      v4 = *(_DWORD *)(v2 + 28);
      v5 = v4 < a1;
      if (v4 >= a1)
        v6 = (uint64_t *)v2;
      else
        v6 = (uint64_t *)(v2 + 8);
      if (!v5)
        v3 = (uint64_t *)v2;
      v2 = *v6;
    }
    while (*v6);
    if (v3 == &qword_253DA6970 || *((_DWORD *)v3 + 7) > a1)
    {
      v7 = 0;
      LODWORD(v2) = 0;
    }
    else
    {
      LODWORD(v2) = *((unsigned __int8 *)v3 + 32);
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7 | ((_DWORD)v2 << 8);
}

void sub_20DB146D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t acipcKernel::pciTransportMemRegionToACIPC(int a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t *v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  int v7;
  int v9;
  int v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0)
  {
    v9 = a1;
    a1 = v9;
    if (v10)
    {
      v15[0] = xmmword_20DB27FF8;
      v15[1] = unk_20DB28008;
      std::map<PCITransportMemRegion,unsigned short>::map[abi:ne180100]((uint64_t)&v12, (int *)v15, 4);
      v11 = (_QWORD *)v13;
      acipcKernel::pciTransportMemRegionToACIPC(PCITransportMemRegion)::sMap = (uint64_t)v12;
      qword_2549D96F0 = v13;
      qword_2549D96F8 = v14;
      if (v14)
      {
        *(_QWORD *)(v13 + 16) = &qword_2549D96F0;
        v12 = &v13;
        v13 = 0;
        v14 = 0;
        v11 = 0;
      }
      else
      {
        acipcKernel::pciTransportMemRegionToACIPC(PCITransportMemRegion)::sMap = (uint64_t)&qword_2549D96F0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v12, v11);
      a1 = v9;
    }
  }
  v2 = qword_2549D96F0;
  if (qword_2549D96F0)
  {
    v3 = &qword_2549D96F0;
    do
    {
      v4 = *(_DWORD *)(v2 + 28);
      v5 = v4 < a1;
      if (v4 >= a1)
        v6 = (uint64_t *)v2;
      else
        v6 = (uint64_t *)(v2 + 8);
      if (!v5)
        v3 = (uint64_t *)v2;
      v2 = *v6;
    }
    while (*v6);
    if (v3 == &qword_2549D96F0 || *((_DWORD *)v3 + 7) > a1)
    {
      v7 = 0;
      LODWORD(v2) = 0;
    }
    else
    {
      LODWORD(v2) = *((unsigned __int16 *)v3 + 16) << 16;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  return v2 | v7;
}

void sub_20DB1485C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void **acipcKernel::getMatchingDictionary@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  const void **result;
  const void **v4;
  __CFDictionary *v5;
  uint64_t (*v6)(uint64_t);
  CFMutableDictionaryRef theDict;

  result = (const void **)acipcKernel::pciTransportInterfaceToACIPC(a1);
  if (result)
  {
    v4 = result;
    v5 = IOServiceMatching("IOAppleConvergedIPCInterface");
    theDict = v5;
    v6 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
    if (!v5)
      v6 = 0;
    if (v6)
    {
      CFDictionarySetValue(v5, CFSTR("ACIPCInterfaceProtocol"), v4);
      CFDictionarySetValue(theDict, CFSTR("ACIPCInterfaceProviderDevice"), CFSTR("cellular"));
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(a2, (CFTypeRef *)&theDict);
    }
    else
    {
      *a2 = 0;
    }
    return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_20DB14918(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void *acipcKernel::wrapNotificationBlock@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  void *result;
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN11acipcKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke;
    aBlock[3] = &unk_24C819548;
    aBlock[4] = a1;
    result = _Block_copy(aBlock);
  }
  else
  {
    result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN11acipcKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t acipcKernel::start(uint64_t a1, int a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v9)(uint64_t);
  CFTypeRef v10;
  uint64_t v11;
  CFTypeRef v13;
  const void *v14;

  acipcKernel::getMatchingDictionary(a2, &v14);
  if (v14)
    v9 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v9 = 0;
  if (v9)
  {
    v13 = a3;
    ctu::cf::CFSharedRef<__CFRunLoop>::operator=((const void **)(a1 + 200), &v13);
    acipcKernel::wrapNotificationBlock(a6, &v13);
    v10 = v13;
    v11 = IOACIPCClass::start();
    if (v10)
      _Block_release(v10);
  }
  else
  {
    v11 = 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v14);
  return v11;
}

void sub_20DB14A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  const void *v10;

  if (v10)
    _Block_release(v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFRunLoop>::operator=(const void **a1, CFTypeRef *a2)
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
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(&v6);
  return a1;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t acipcKernel::start(uint64_t a1, int a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v9)(uint64_t);
  NSObject *v10;
  const void *v11;
  uint64_t v12;
  const void *v14;
  const void *v15;

  acipcKernel::getMatchingDictionary(a2, &v15);
  if (v15)
    v9 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v9 = 0;
  if (v9)
  {
    if (a3)
      dispatch_retain(a3);
    v10 = *(NSObject **)(a1 + 208);
    *(_QWORD *)(a1 + 208) = a3;
    if (v10)
      dispatch_release(v10);
    acipcKernel::wrapNotificationBlock(a6, &v14);
    v11 = v14;
    v12 = IOACIPCClass::start();
    if (v11)
      _Block_release(v11);
  }
  else
  {
    v12 = 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v15);
  return v12;
}

void sub_20DB14BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  const void *v10;

  if (v10)
    _Block_release(v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

const void **acipcKernel::findRings(acipcKernel *this)
{
  const __CFArray *TransferRingInfo;
  uint64_t (*v3)(uint64_t);
  CFIndex Count;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  CFTypeID v8;
  int *Value;
  int *v10;
  CFTypeID v11;
  const __CFNumber *v12;
  int *v13;
  int *v14;
  CFTypeID v15;
  const __CFNumber *v16;
  int v18;
  int v19;
  CFArrayRef theArray;

  *((_QWORD *)this + 27) = -1;
  TransferRingInfo = (const __CFArray *)IOACIPCClass::getTransferRingInfo((acipcKernel *)((char *)this + 8));
  theArray = TransferRingInfo;
  v3 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
  if (!TransferRingInfo)
    v3 = 0;
  if (v3)
  {
    Count = CFArrayGetCount(TransferRingInfo);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        if (*((_DWORD *)this + 54) != -1 && *((_DWORD *)this + 55) != -1)
          break;
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
        v7 = ValueAtIndex;
        if (!ValueAtIndex)
          break;
        v8 = CFGetTypeID(ValueAtIndex);
        if (v8 != CFDictionaryGetTypeID())
          break;
        v19 = 0;
        Value = (int *)CFDictionaryGetValue(v7, CFSTR("AppleConvergedIPCRingIndex"));
        v10 = Value;
        if (!Value)
          break;
        v11 = CFGetTypeID(Value);
        if (v11 != CFNumberGetTypeID())
          break;
        if ((ctu::cf::assign((ctu::cf *)&v19, v10, v12) & 1) == 0)
          break;
        v18 = 0;
        v13 = (int *)CFDictionaryGetValue(v7, CFSTR("AppleConvergedIPCRingDirection"));
        v14 = v13;
        if (!v13)
          break;
        v15 = CFGetTypeID(v13);
        if (v15 != CFNumberGetTypeID() || (ctu::cf::assign((ctu::cf *)&v18, v14, v16) & 1) == 0)
          break;
        if (v18 == 1)
        {
          if (*((_DWORD *)this + 55) == -1)
            *((_DWORD *)this + 55) = v19;
        }
        else if (v18 == 2 && *((_DWORD *)this + 54) == -1)
        {
          *((_DWORD *)this + 54) = v19;
        }
      }
    }
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_20DB14DAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

double acipcKernel::clearRings(acipcKernel *this)
{
  double result;

  result = NAN;
  *((_QWORD *)this + 27) = -1;
  return result;
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

double acipcKernel::open(acipcKernel *this)
{
  double result;

  acipcKernel::findRings(this);
  if (IOACIPCClass::open((acipcKernel *)((char *)this + 8)))
  {
    result = NAN;
    *((_QWORD *)this + 27) = -1;
  }
  return result;
}

uint64_t acipcKernel::close(acipcKernel *this)
{
  *((_QWORD *)this + 27) = -1;
  return IOACIPCClass::close((acipcKernel *)((char *)this + 8));
}

uint64_t acipcKernel::write(acipcKernel *this, const void *a2)
{
  if (*((_DWORD *)this + 55) == -1)
    return 3758097101;
  else
    return IOACIPCClass::io();
}

uint64_t acipcKernel::writeAsync(acipcKernel *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v8;

  v8 = *((unsigned int *)this + 55);
  if ((_DWORD)v8 == -1)
    return 3758097101;
  else
    return IOACIPCClass::ioAsync((acipcKernel *)((char *)this + 8), v8, a2, a3, 0, 0, a4, a5);
}

uint64_t acipcKernel::read(acipcKernel *this, void *a2, unsigned int *a3)
{
  if (*((_DWORD *)this + 54) == -1)
    return 3758097101;
  else
    return IOACIPCClass::io();
}

uint64_t acipcKernel::readAsync(acipcKernel *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v8;

  v8 = *((unsigned int *)this + 54);
  if ((_DWORD)v8 == -1)
    return 3758097101;
  else
    return IOACIPCClass::ioAsync((acipcKernel *)((char *)this + 8), v8, a2, a3, 0, 0, a4, a5);
}

uint64_t acipcKernel::readRegister(uint64_t a1, int a2, void *a3, unsigned int *a4)
{
  unint64_t v7;

  v7 = acipcKernel::pciTransportRegisterToACIPC(a2);
  if ((_BYTE)v7)
    return IOACIPCClass::readRegister((IOACIPCClass *)(a1 + 8), HIDWORD(v7), a3, a4);
  else
    return 3758097090;
}

uint64_t acipcKernel::abortChannelAsync(uint64_t a1, int a2, void (*a3)(void *, int), void *a4)
{
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v10)(uint64_t);
  __CFRunLoop *v11;
  uint64_t (*v12)(uint64_t);
  _QWORD v13[6];

  v5 = *(NSObject **)(a1 + 208);
  if (!v5
    && !(*(_QWORD *)(a1 + 200)
       ? ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get
       : 0))
  {
    return 3758097101;
  }
  v7 = 220;
  if (a2 == 1)
    v7 = 216;
  v8 = *(unsigned int *)(a1 + v7);
  if ((_DWORD)v8 != -1)
    return IOACIPCClass::abortTransferRingAsync((IOACIPCClass *)(a1 + 8), v8, a3, a4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = ___ZN11acipcKernel17abortChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke;
  v13[3] = &__block_descriptor_tmp_71;
  v13[4] = a3;
  v13[5] = a4;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 200))
      v10 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
    else
      v10 = 0;
    if (v10)
      acipcKernel::abortChannelAsync();
    dispatch_async(v5, v13);
  }
  v11 = *(__CFRunLoop **)(a1 + 200);
  if (v11)
    v12 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
  else
    v12 = 0;
  if (v12)
  {
    if (*(_QWORD *)(a1 + 208))
      acipcKernel::abortChannelAsync();
    CFRunLoopPerformBlock(v11, (CFTypeRef)*MEMORY[0x24BDBD5A0], v13);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 200));
  }
  return 0;
}

uint64_t ___ZN11acipcKernel17abortChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), 0);
}

uint64_t ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t acipcKernel::startChannelAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  uint64_t (*v7)(uint64_t);
  __CFRunLoop *v8;
  uint64_t (*v9)(uint64_t);
  _QWORD v11[6];

  v5 = *(NSObject **)(a1 + 208);
  if (!v5
    && !(*(_QWORD *)(a1 + 200)
       ? ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get
       : 0))
  {
    return 3758097101;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = ___ZN11acipcKernel17startChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke;
  v11[3] = &__block_descriptor_tmp_74;
  v11[4] = a3;
  v11[5] = a4;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 200))
      v7 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
    else
      v7 = 0;
    if (v7)
      acipcKernel::startChannelAsync();
    dispatch_async(v5, v11);
  }
  v8 = *(__CFRunLoop **)(a1 + 200);
  if (v8)
    v9 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
  else
    v9 = 0;
  if (v9)
  {
    if (*(_QWORD *)(a1 + 208))
      acipcKernel::startChannelAsync();
    CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x24BDBD5A0], v11);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 200));
  }
  return 0;
}

uint64_t ___ZN11acipcKernel17startChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), 0);
}

uint64_t acipcKernel::timesyncAsync(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  __int16 v13;

  v13 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if ((_BYTE)v13)
    return IOACIPCBBClass::timesyncAsync((IOACIPCBBClass *)(a1 + 8), HIBYTE(v13), a3, a4, a5, a6, a7);
  else
    return 3758097090;
}

uint64_t acipcKernel::registerTimeEvent(uint64_t a1, int a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  __int16 v7;

  v7 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if ((_BYTE)v7)
    return IOACIPCBBClass::registerTimeEvent((IOACIPCBBClass *)(a1 + 8), HIBYTE(v7), a3, a4);
  else
    return 3758097090;
}

uint64_t acipcKernel::deregisterTimeEvent(uint64_t a1, int a2, void (*a3)(void *, int), void *a4)
{
  __int16 v7;

  v7 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if ((_BYTE)v7)
    return IOACIPCBBClass::deregisterTimeEvent((IOACIPCBBClass *)(a1 + 8), HIBYTE(v7), a3, a4);
  else
    return 3758097090;
}

__n128 acipcKernel::marshalTimesyncMeasurement@<Q0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  __n128 result;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t acipcKernel::mapRegionAsync(uint64_t a1, int a2, const void *a3, uint64_t a4, const void *a5, unsigned int a6, void (*a7)(void *, int), void *a8)
{
  unsigned int v15;

  v15 = acipcKernel::pciTransportMemRegionToACIPC(a2);
  if ((_BYTE)v15)
    return IOACIPCClass::mapMemoryAsync((IOACIPCClass *)(a1 + 8), HIWORD(v15), a3, a4, 0, 0, a5, a6, a7, a8);
  else
    return 3758097090;
}

uint64_t acipcKernel::unmapRegionAsync(uint64_t a1, int a2, void (*a3)(void *, int), void *a4)
{
  unsigned int v7;

  v7 = acipcKernel::pciTransportMemRegionToACIPC(a2);
  if ((_BYTE)v7)
    return IOACIPCClass::unmapMemoryAsync((IOACIPCClass *)(a1 + 8), HIWORD(v7), a3, a4);
  else
    return 3758097090;
}

void *acipcKernelControl::wrapControlEventBlock@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  void *result;
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN18acipcKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke;
    aBlock[3] = &unk_24C8195B0;
    aBlock[4] = a1;
    result = _Block_copy(aBlock);
  }
  else
  {
    result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN18acipcKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const void **acipcKernelControl::getMatchingDictionary@<X0>(_QWORD *a1@<X8>)
{
  CFMutableDictionaryRef v3;
  uint64_t (*v4)(uint64_t);
  CFMutableDictionaryRef v6;

  v3 = IOServiceMatching("IOAppleConvergedIPCControl");
  v6 = v3;
  v4 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!v3)
    v4 = 0;
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("ACIPCControlVariant"), CFSTR("cellular"));
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(a1, (CFTypeRef *)&v6);
  }
  else
  {
    *a1 = 0;
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v6);
}

void sub_20DB154E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t acipcKernelControl::start(acipcKernelControl *this)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  __CFDictionary *v5;

  acipcKernelControl::getMatchingDictionary(&v5);
  v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v5)
    v2 = 0;
  if (v2)
    v3 = IOACIPCControlClass::start((acipcKernelControl *)((char *)this + 8), v5);
  else
    v3 = 0;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v5);
  return v3;
}

void sub_20DB1555C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t acipcKernelControl::registerEventNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;
  uint64_t v4;
  const void *v6;

  acipcKernelControl::wrapControlEventBlock(a3, &v6);
  v3 = v6;
  v4 = IOACIPCControlClass::registerEventNotification();
  if (v3)
    _Block_release(v3);
  return v4;
}

{
  const void *v3;
  uint64_t v4;
  const void *v6;

  acipcKernelControl::wrapControlEventBlock(a3, &v6);
  v3 = v6;
  v4 = IOACIPCControlClass::registerEventNotification();
  if (v3)
    _Block_release(v3);
  return v4;
}

void sub_20DB155D8(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void sub_20DB1565C(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void pci::transport::kernel::create(uint64_t *a1@<X8>)
{
  uint64_t v3;

  if (pci::transport::kernel::probeVariant(void)::sOnce != -1)
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  if (pci::transport::kernel::probeVariant(void)::ret)
  {
    if (pci::transport::kernel::probeVariant(void)::ret == 2)
    {
      v3 = operator new();
      *(_QWORD *)v3 = &off_24C8193B0;
      *(_OWORD *)(v3 + 24) = 0u;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *(_OWORD *)(v3 + 88) = 0u;
      *(_OWORD *)(v3 + 104) = 0u;
      *(_OWORD *)(v3 + 120) = 0u;
      *(_OWORD *)(v3 + 136) = 0u;
      *(_OWORD *)(v3 + 152) = 0u;
      *(_OWORD *)(v3 + 168) = 0u;
      *(_OWORD *)(v3 + 184) = 0u;
      *(_OWORD *)(v3 + 8) = 0u;
      IOACIPCClass::IOACIPCClass((IOACIPCClass *)(v3 + 8));
      *(_QWORD *)(v3 + 8) = MEMORY[0x24BED4860] + 16;
      *(_QWORD *)(v3 + 200) = 0;
      *(_QWORD *)(v3 + 208) = 0;
      *(_QWORD *)(v3 + 216) = -1;
    }
    else
    {
      v3 = operator new();
      *(_OWORD *)v3 = 0u;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_OWORD *)(v3 + 32) = 0u;
      *(_OWORD *)(v3 + 48) = 0u;
      *(_OWORD *)(v3 + 64) = 0u;
      *(_OWORD *)(v3 + 80) = 0u;
      *(_OWORD *)(v3 + 96) = 0u;
      *(_OWORD *)(v3 + 112) = 0u;
      *(_OWORD *)(v3 + 128) = 0u;
      *(_OWORD *)(v3 + 144) = 0u;
      *(_QWORD *)v3 = &off_24C8195E0;
      *(_OWORD *)(v3 + 160) = 0u;
      IOABPClass::IOABPClass((IOABPClass *)(v3 + 8));
    }
  }
  else
  {
    v3 = 0;
  }
  *a1 = v3;
}

void sub_20DB157A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BAF90C](v1, 0x10F1C40BDC3455ELL);
  _Unwind_Resume(a1);
}

void pci::transport::kernelControl::create(uint64_t *a1@<X8>)
{
  uint64_t v3;

  if (pci::transport::kernel::probeVariant(void)::sOnce != -1)
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  if (pci::transport::kernel::probeVariant(void)::ret == 2)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_OWORD *)(v3 + 80) = 0u;
    *(_OWORD *)(v3 + 96) = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 160) = 0u;
    *(_QWORD *)v3 = &off_24C8197A0;
    *(_QWORD *)(v3 + 176) = 0;
    IOACIPCControlClass::IOACIPCControlClass((IOACIPCControlClass *)(v3 + 8));
  }
  else if (pci::transport::kernel::probeVariant(void)::ret == 1)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_OWORD *)(v3 + 80) = 0u;
    *(_OWORD *)(v3 + 96) = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_QWORD *)v3 = &off_24C8196D8;
    *(_OWORD *)(v3 + 160) = 0u;
    IOABPControlClass::IOABPControlClass((IOABPControlClass *)(v3 + 8));
  }
  else
  {
    v3 = 0;
  }
  *a1 = v3;
}

void sub_20DB158E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BAF90C](v1, 0x10A1C40FA50A9EBLL);
  _Unwind_Resume(a1);
}

void pci::transport::kernelTrace::create(_QWORD *a1@<X8>)
{
  _OWORD *v3;

  if (pci::transport::kernel::probeVariant(void)::sOnce != -1)
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  if (pci::transport::kernel::probeVariant(void)::ret == 2)
  {
    v3 = (_OWORD *)operator new();
    *v3 = 0u;
    v3[1] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[6] = 0u;
    v3[7] = 0u;
    *(_QWORD *)v3 = &off_24C819910;
    IOACIPCTraceClass::IOACIPCTraceClass((IOACIPCTraceClass *)((char *)v3 + 8));
  }
  else if (pci::transport::kernel::probeVariant(void)::ret == 1)
  {
    v3 = (_OWORD *)operator new();
    *v3 = 0u;
    v3[1] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[6] = 0u;
    v3[7] = 0u;
    *(_QWORD *)v3 = &off_24C819840;
    IOABPTraceClass::IOABPTraceClass((IOABPTraceClass *)((char *)v3 + 8));
  }
  else
  {
    v3 = 0;
  }
  *a1 = v3;
}

void sub_20DB15A10(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BAF90C](v1, 0x10E1C40FAAEA384);
  _Unwind_Resume(a1);
}

void abpKernel::~abpKernel(abpKernel *this)
{
  *(_QWORD *)this = &off_24C8195E0;
  MEMORY[0x212BAF3F0]((char *)this + 8);
}

{
  *(_QWORD *)this = &off_24C8195E0;
  MEMORY[0x212BAF3F0]((char *)this + 8);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t abpKernel::getVariant(abpKernel *this)
{
  return 1;
}

uint64_t abpKernel::stop(abpKernel *this, dispatch_group_s *a2)
{
  return IOABPClass::stop((abpKernel *)((char *)this + 8), a2);
}

uint64_t abpKernel::open(abpKernel *this)
{
  return IOABPClass::open((abpKernel *)((char *)this + 8));
}

uint64_t abpKernel::close(abpKernel *this)
{
  return IOABPClass::close((abpKernel *)((char *)this + 8));
}

uint64_t abpKernel::write(abpKernel *this, const void *a2)
{
  return IOABPClass::write((abpKernel *)((char *)this + 8), a2);
}

uint64_t abpKernel::read(abpKernel *this, void *a2, unsigned int *a3)
{
  return IOABPClass::read((abpKernel *)((char *)this + 8), a2, a3);
}

uint64_t abpKernel::sendImage(abpKernel *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return IOABPClass::sendImage((abpKernel *)((char *)this + 8), a2, a3, a4);
}

uint64_t abpKernel::sendImageAsync(abpKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return IOABPClass::sendImageAsync((abpKernel *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t abpKernel::getTimesyncMeasurementSize(abpKernel *this)
{
  return 32;
}

void abpKernelControl::~abpKernelControl(abpKernelControl *this)
{
  *(_QWORD *)this = &off_24C8196D8;
  MEMORY[0x212BAF630]((char *)this + 8);
}

{
  *(_QWORD *)this = &off_24C8196D8;
  MEMORY[0x212BAF630]((char *)this + 8);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t abpKernelControl::getVariant(abpKernelControl *this)
{
  return 1;
}

uint64_t abpKernelControl::start(abpKernelControl *this)
{
  return IOABPControlClass::start((abpKernelControl *)((char *)this + 8));
}

uint64_t abpKernelControl::stop(abpKernelControl *this)
{
  return IOABPControlClass::stop((abpKernelControl *)((char *)this + 8));
}

uint64_t abpKernelControl::open(abpKernelControl *this, __CFRunLoop *a2)
{
  return IOABPControlClass::open((abpKernelControl *)((char *)this + 8), a2);
}

uint64_t abpKernelControl::open(abpKernelControl *this, dispatch_queue_s *a2)
{
  return IOABPControlClass::open((abpKernelControl *)((char *)this + 8), a2);
}

uint64_t abpKernelControl::close(abpKernelControl *this)
{
  return IOABPControlClass::close((abpKernelControl *)((char *)this + 8));
}

uint64_t abpKernelControl::readLogsAsync(abpKernelControl *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return IOABPControlClass::readLogsAsync((abpKernelControl *)((char *)this + 8), a2, a3, a4, a5, a6);
}

uint64_t abpKernelControl::deregisterEventNotification(abpKernelControl *this, dispatch_group_s *a2)
{
  return IOABPControlClass::deregisterEventNotification((abpKernelControl *)((char *)this + 8), a2);
}

uint64_t abpKernelControl::getLogInternalBufferSize(abpKernelControl *this, unsigned int *a2)
{
  return IOABPControlClass::getLogInternalBufferSize((abpKernelControl *)((char *)this + 8), a2);
}

uint64_t abpKernelControl::loggerTune(abpKernelControl *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return IOABPControlClass::loggerTune((abpKernelControl *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t abpKernelControl::getLastKnownBootStage(abpKernelControl *this, unsigned int *a2)
{
  return IOABPControlClass::getLastKnownBootStage((abpKernelControl *)((char *)this + 8), a2);
}

void acipcKernel::~acipcKernel(acipcKernel *this)
{
  acipcKernel::~acipcKernel(this);
  JUMPOUT(0x212BAF90CLL);
}

{
  NSObject *v2;

  *(_QWORD *)this = &off_24C8193B0;
  v2 = *((_QWORD *)this + 26);
  if (v2)
    dispatch_release(v2);
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 25);
  MEMORY[0x212BAF4D4]((char *)this + 8);
}

uint64_t acipcKernel::getVariant(acipcKernel *this)
{
  return 2;
}

uint64_t acipcKernel::stop(acipcKernel *this, dispatch_group_s *a2)
{
  return IOACIPCClass::stop((acipcKernel *)((char *)this + 8), a2);
}

uint64_t acipcKernel::sendImage(acipcKernel *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return IOACIPCClass::sendImage((acipcKernel *)((char *)this + 8), a2, a3, a4);
}

uint64_t acipcKernel::sendImageAsync(acipcKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return IOACIPCClass::sendImageAsync((acipcKernel *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t acipcKernel::getTimesyncMeasurementSize(acipcKernel *this)
{
  return 24;
}

void acipcKernelControl::~acipcKernelControl(acipcKernelControl *this)
{
  *(_QWORD *)this = &off_24C8197A0;
  MEMORY[0x212BAF78C]((char *)this + 8);
}

{
  *(_QWORD *)this = &off_24C8197A0;
  MEMORY[0x212BAF78C]((char *)this + 8);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t acipcKernelControl::getVariant(acipcKernelControl *this)
{
  return 2;
}

uint64_t acipcKernelControl::stop(acipcKernelControl *this)
{
  return IOACIPCControlClass::stop((acipcKernelControl *)((char *)this + 8));
}

uint64_t acipcKernelControl::open(acipcKernelControl *this, __CFRunLoop *a2)
{
  return IOACIPCControlClass::open((acipcKernelControl *)((char *)this + 8), a2);
}

uint64_t acipcKernelControl::open(acipcKernelControl *this, dispatch_queue_s *a2)
{
  return IOACIPCControlClass::open((acipcKernelControl *)((char *)this + 8), a2);
}

uint64_t acipcKernelControl::close(acipcKernelControl *this)
{
  return IOACIPCControlClass::close((acipcKernelControl *)((char *)this + 8));
}

uint64_t acipcKernelControl::readLogsAsync(acipcKernelControl *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return IOACIPCControlClass::readLogsAsync((acipcKernelControl *)((char *)this + 8), a2, a3, a4, a5, a6);
}

uint64_t acipcKernelControl::deregisterEventNotification(acipcKernelControl *this, dispatch_group_s *a2)
{
  return IOACIPCControlClass::deregisterEventNotification((acipcKernelControl *)((char *)this + 8), a2);
}

uint64_t acipcKernelControl::getLogInternalBufferSize(acipcKernelControl *this, unsigned int *a2)
{
  return IOACIPCControlClass::getLogInternalBufferSize((acipcKernelControl *)((char *)this + 8), a2);
}

uint64_t acipcKernelControl::loggerTune(acipcKernelControl *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return IOACIPCControlClass::loggerTune((acipcKernelControl *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t acipcKernelControl::getLastKnownBootStage(acipcKernelControl *this, unsigned int *a2)
{
  return IOACIPCControlClass::getLastKnownBootStage((acipcKernelControl *)((char *)this + 8), a2);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
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

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t std::map<char const*,pci::transport::kernel::variant>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,pci::transport::kernel::variant> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB15E3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,pci::transport::kernel::variant> const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, _OWORD *a4)
{
  void **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t v11;

  v6 = (void **)std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__find_equal<char const*>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__find_equal<char const*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::map<PCITransportInterface,char const*>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB1614C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::map<PCITransportRegister,unsigned int>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB163F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__find_equal<PCITransportRegister>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v7 + 28) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__find_equal<PCITransportRegister>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB1669C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<PCITransportInterface,__CFString const*>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB16718(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<PCITransportMemRegion,unsigned short>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB16794(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(_QWORD *a1, CFTypeRef *a2)
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

void abpKernelTrace::~abpKernelTrace(abpKernelTrace *this)
{
  *(_QWORD *)this = &off_24C819840;
  MEMORY[0x212BAF588]((char *)this + 8);
}

{
  *(_QWORD *)this = &off_24C819840;
  MEMORY[0x212BAF588]((char *)this + 8);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t abpKernelTrace::start(abpKernelTrace *this, __CFRunLoop *a2)
{
  return IOABPTraceClass::start((abpKernelTrace *)((char *)this + 8), a2);
}

uint64_t abpKernelTrace::start(abpKernelTrace *this, dispatch_queue_s *a2)
{
  return IOABPTraceClass::start((abpKernelTrace *)((char *)this + 8), a2);
}

uint64_t abpKernelTrace::stop(abpKernelTrace *this)
{
  return IOABPTraceClass::stop((abpKernelTrace *)((char *)this + 8));
}

uint64_t abpKernelTrace::getPipeCount(abpKernelTrace *this)
{
  return IOABPTraceClass::getPipeCount((abpKernelTrace *)((char *)this + 8));
}

uint64_t abpKernelTrace::getPipeCodeAndName(abpKernelTrace *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return IOABPTraceClass::getPipeCodeAndName((abpKernelTrace *)((char *)this + 8), a2, a3, a4);
}

uint64_t abpKernelTrace::openPipe(abpKernelTrace *this)
{
  return IOABPTraceClass::openPipe((abpKernelTrace *)((char *)this + 8));
}

uint64_t abpKernelTrace::closePipe(abpKernelTrace *this)
{
  return IOABPTraceClass::closePipe((abpKernelTrace *)((char *)this + 8));
}

uint64_t abpKernelTrace::readAsync(abpKernelTrace *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return IOABPTraceClass::readLogsAsync((abpKernelTrace *)((char *)this + 8), a2, a3, a4, a5, a6, a7);
}

uint64_t abpKernelTrace::flushBuffers(abpKernelTrace *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return IOABPTraceClass::flushTraceBuffers((abpKernelTrace *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t abpKernelTrace::dumpRegistry(abpKernelTrace *this)
{
  return IOABPTraceClass::dumpRegistry((abpKernelTrace *)((char *)this + 8));
}

uint64_t abpKernelTrace::getTraceCodeCount(abpKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOABPTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getTraceCodeSize(abpKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOABPTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getMinBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOABPTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getMaxBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOABPTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getSnapshotBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  return IOABPTraceClass::getSnapshotBufferSize((abpKernelTrace *)((char *)this + 8), a2);
}

uint64_t abpKernelTrace::getMaxBuffersInFlight(abpKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOABPTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getTraceCode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TraceCode;
  __int128 *v5;
  __int128 *i;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  std::string __p;
  int v12;
  std::string v13;
  int v14;
  _BYTE __str[32];
  __int128 v16;
  int v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t v20;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  memset(__str, 0, sizeof(__str));
  v16 = 0u;
  TraceCode = IOABPTraceClass::getTraceCode();
  if ((TraceCode & 1) != 0)
  {
    *(_DWORD *)(a3 + 48) = v17;
    std::string::operator=((std::string *)a3, (const std::string *)__str);
    std::string::operator=((std::string *)(a3 + 24), (const std::string *)&__str[24]);
    v5 = v18;
    for (i = v19; v5 != i; v5 += 2)
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v7 = *v5;
        v13.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
        *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
      }
      v14 = *((_DWORD *)v5 + 6);
      memset(&__p, 0, sizeof(__p));
      std::string::operator=(&__p, &v13);
      v12 = v14;
      v8 = *(_QWORD *)(a3 + 64);
      if (v8 >= *(_QWORD *)(a3 + 72))
      {
        v9 = std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>((uint64_t *)(a3 + 56), (__int128 *)&__p);
      }
      else
      {
        std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(a3 + 56, (__int128 *)&__p);
        v9 = v8 + 32;
      }
      *(_QWORD *)(a3 + 64) = v9;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v13.__r_.__value_.__l.__data_);
    }
  }
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v16) < 0)
    operator delete(*(void **)&__str[24]);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  return TraceCode;
}

void sub_20DB16BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23)
{
  IOABPTraceCodeDict::~IOABPTraceCodeDict(&a23);
  _Unwind_Resume(a1);
}

void IOABPTraceCodeDict::~IOABPTraceCodeDict(void **this)
{
  void **v2;

  v2 = this + 7;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
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
  __cxa_throw(exception, (struct type_info *)off_24C818EC0, MEMORY[0x24BEDAAF0]);
}

void sub_20DB16CD4(_Unwind_Exception *a1)
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

void std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  *(_DWORD *)(v4 + 24) = *((_DWORD *)a2 + 6);
  *(_QWORD *)(a1 + 8) = v4 + 32;
}

void sub_20DB16DFC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::string *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  v16 = (std::string *)((char *)v11 + 32);
  std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_20DB16EFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment const>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const std::string::value_type **v9;
  std::string *v10;
  __int128 *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  char v17;
  __int128 v18;
  __int128 v19;

  v7 = a7;
  *(_QWORD *)&v19 = a6;
  *((_QWORD *)&v19 + 1) = a7;
  v18 = v19;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  v17 = 0;
  if (a3 == a5)
  {
    v14 = a6;
  }
  else
  {
    v9 = (const std::string::value_type **)a3;
    do
    {
      v10 = (std::string *)(v7 - 32);
      v11 = (__int128 *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        std::string::__init_copy_ctor_external(v10, *(v9 - 4), (std::string::size_type)*(v9 - 3));
        v13 = *((_QWORD *)&v19 + 1);
      }
      else
      {
        v12 = *v11;
        *(_QWORD *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v12;
        v13 = v7;
      }
      *(_DWORD *)(v7 - 8) = *((_DWORD *)v9 - 2);
      v7 = v13 - 32;
      *((_QWORD *)&v19 + 1) = v13 - 32;
      v9 -= 4;
    }
    while (v11 != a5);
    v14 = v19;
  }
  v17 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

void sub_20DB1709C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment const>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment const*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment const>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment const>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment const>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void acipcKernelTrace::~acipcKernelTrace(acipcKernelTrace *this)
{
  *(_QWORD *)this = &off_24C819910;
  MEMORY[0x212BAF6E4]((char *)this + 8);
}

{
  *(_QWORD *)this = &off_24C819910;
  MEMORY[0x212BAF6E4]((char *)this + 8);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t acipcKernelTrace::start(acipcKernelTrace *this, __CFRunLoop *a2)
{
  return IOACIPCTraceClass::start((acipcKernelTrace *)((char *)this + 8), a2);
}

uint64_t acipcKernelTrace::start(acipcKernelTrace *this, dispatch_queue_s *a2)
{
  return IOACIPCTraceClass::start((acipcKernelTrace *)((char *)this + 8), a2);
}

uint64_t acipcKernelTrace::stop(acipcKernelTrace *this)
{
  return IOACIPCTraceClass::stop((acipcKernelTrace *)((char *)this + 8));
}

uint64_t acipcKernelTrace::getPipeCount(acipcKernelTrace *this)
{
  return IOACIPCTraceClass::getPipeCount((acipcKernelTrace *)((char *)this + 8));
}

uint64_t acipcKernelTrace::getPipeCodeAndName(acipcKernelTrace *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return IOACIPCTraceClass::getPipeCodeAndName((acipcKernelTrace *)((char *)this + 8), a2, a3, a4);
}

uint64_t acipcKernelTrace::openPipe(acipcKernelTrace *this)
{
  return IOACIPCTraceClass::openPipe((acipcKernelTrace *)((char *)this + 8));
}

uint64_t acipcKernelTrace::closePipe(acipcKernelTrace *this)
{
  return IOACIPCTraceClass::closePipe((acipcKernelTrace *)((char *)this + 8));
}

uint64_t acipcKernelTrace::readAsync(acipcKernelTrace *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return IOACIPCTraceClass::readLogsAsync((acipcKernelTrace *)((char *)this + 8), a2, a3, a4, a5, a6, a7);
}

uint64_t acipcKernelTrace::flushBuffers(acipcKernelTrace *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return IOACIPCTraceClass::flushTraceBuffers((acipcKernelTrace *)((char *)this + 8), a2, a3, a4, a5);
}

uint64_t acipcKernelTrace::dumpRegistry(acipcKernelTrace *this)
{
  return IOACIPCTraceClass::dumpRegistry((acipcKernelTrace *)((char *)this + 8));
}

uint64_t acipcKernelTrace::getTraceCodeCount(acipcKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOACIPCTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getTraceCodeSize(acipcKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOACIPCTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getMinBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOACIPCTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getMaxBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOACIPCTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getSnapshotBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  return IOACIPCTraceClass::getSnapshotBufferSize((acipcKernelTrace *)((char *)this + 8), a2);
}

uint64_t acipcKernelTrace::getMaxBuffersInFlight(acipcKernelTrace *this, unsigned int *a2)
{
  uint64_t result;
  unsigned int v4;

  if (!a2)
    return 0;
  result = IOACIPCTraceClass::getRegistryInfo();
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getTraceCode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TraceCode;
  __int128 *v5;
  __int128 *i;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  std::string __p;
  int v12;
  std::string v13;
  int v14;
  _BYTE __str[32];
  __int128 v16;
  int v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t v20;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  memset(__str, 0, sizeof(__str));
  v16 = 0u;
  TraceCode = IOACIPCTraceClass::getTraceCode();
  if ((TraceCode & 1) != 0)
  {
    *(_DWORD *)(a3 + 48) = v17;
    std::string::operator=((std::string *)a3, (const std::string *)__str);
    std::string::operator=((std::string *)(a3 + 24), (const std::string *)&__str[24]);
    v5 = v18;
    for (i = v19; v5 != i; v5 += 2)
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v7 = *v5;
        v13.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
        *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
      }
      v14 = *((_DWORD *)v5 + 6);
      memset(&__p, 0, sizeof(__p));
      std::string::operator=(&__p, &v13);
      v12 = v14;
      v8 = *(_QWORD *)(a3 + 64);
      if (v8 >= *(_QWORD *)(a3 + 72))
      {
        v9 = std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>((uint64_t *)(a3 + 56), (__int128 *)&__p);
      }
      else
      {
        std::vector<pci::transport::kernelTrace::traceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(a3 + 56, (__int128 *)&__p);
        v9 = v8 + 32;
      }
      *(_QWORD *)(a3 + 64) = v9;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v13.__r_.__value_.__l.__data_);
    }
  }
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v16) < 0)
    operator delete(*(void **)&__str[24]);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  return TraceCode;
}

void sub_20DB175F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23)
{
  IOABPTraceCodeDict::~IOABPTraceCodeDict(&a23);
  _Unwind_Resume(a1);
}

void pci::transport::bh::create(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)operator new();
  pci::transport::bh::bh((uint64_t)v4, a1);
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(a2, v4);
  if (!*a2 || !pci::transport::bh::init(*a2, a1))
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100](a2);
}

void sub_20DB176B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL pci::transport::bh::init(uint64_t a1, uint64_t a2)
{
  pci::log *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  char inserted;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  const void *v26;
  unint64_t *p_shared_weak_owners;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  pci::log *v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  const void *v36;
  unsigned int v37;
  dispatch_time_t v38;
  uint64_t v39;
  const void *v40;
  char v41;
  int v42;
  NSObject *v43;
  unsigned int v44;
  _BOOL8 v45;
  pci::log *v46;
  NSObject *v47;
  int v48;
  const char *v49;
  pci::log *v50;
  int v51;
  _QWORD v53[6];
  std::__shared_weak_count *v54;
  _QWORD v55[2];
  void (*v56)(_QWORD *);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  _QWORD v61[4];
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  _QWORD aBlock[7];
  dispatch_object_t object;
  uint64_t *v68;
  std::__shared_weak_count *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  void *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  _BYTE buf[22];
  __int16 v85;
  int v86;
  __int16 v87;
  const char *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v80 = 0;
  v81 = &v80;
  v82 = 0x2000000000;
  v83 = *(_DWORD *)(a2 + 8);
  v76 = 0;
  v77 = &v76;
  v78 = 0x2000000000;
  v79 = 1;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__13;
  v74 = __Block_byref_object_dispose__14;
  v75 = 0;
  v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    pci::transport::bh::init();
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_DWORD *)(a1 + 28);
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (_QWORD *)a1);
  v68 = *(uint64_t **)buf;
  v69 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  inserted = pci::system::info::insertBH(v6, v7, &v68, *(_DWORD *)(a2 + 4));
  if (v69)
    std::__shared_weak_count::__release_weak(v69);
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (!*(_QWORD *)&buf[8])
    goto LABEL_12;
  v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (v13)
  {
LABEL_12:
    if ((inserted & 1) != 0)
      goto LABEL_13;
LABEL_79:
    v46 = (pci::log *)_TelephonyUtilDebugPrintError();
    v47 = pci::log::get(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v85 = 1024;
      v86 = v48;
      v87 = 2080;
      v88 = "init";
      v49 = "%s::%p::%d::%s: failed to insert in system";
LABEL_83:
      _os_log_impl(&dword_20DB0C000, v47, OS_LOG_TYPE_INFO, v49, buf, 0x26u);
    }
LABEL_84:
    v45 = 0;
    goto LABEL_85;
  }
  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
  std::__shared_weak_count::__release_weak(v11);
  if ((inserted & 1) == 0)
    goto LABEL_79;
LABEL_13:
  *(_BYTE *)(a1 + 32) = 1;
  pci::transport::kernel::create((uint64_t *)buf);
  v14 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v14;
  if (v15)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
    v16 = *(_QWORD *)buf;
    *(_QWORD *)buf = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    v14 = *(_QWORD *)(a1 + 40);
  }
  if (!v14)
  {
    v50 = (pci::log *)_TelephonyUtilDebugPrintError();
    v47 = pci::log::get(v50);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v51 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v85 = 1024;
      v86 = v51;
      v87 = 2080;
      v88 = "init";
      v49 = "%s::%p::%d::%s: failed to create kernel instance";
      goto LABEL_83;
    }
    goto LABEL_84;
  }
  v17 = MEMORY[0x24BDAC760];
  do
  {
    std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (_QWORD *)a1);
    v19 = *(_QWORD *)buf;
    v18 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v24 = dispatch_semaphore_create(0);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    aBlock[0] = v17;
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke;
    aBlock[3] = &unk_24C819A18;
    aBlock[4] = &v76;
    aBlock[5] = &v80;
    aBlock[6] = a1;
    object = v24;
    if (v24)
      dispatch_retain(v24);
    v25 = _Block_copy(aBlock);
    v26 = (const void *)v71[5];
    v71[5] = (uint64_t)v25;
    if (v26)
      _Block_release(v26);
    v61[0] = v17;
    v61[1] = 1174405120;
    v61[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21;
    v61[3] = &unk_24C819A50;
    v63 = a1;
    v64 = v19;
    v65 = v18;
    if (v18)
    {
      p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
      do
        v28 = __ldxr(p_shared_weak_owners);
      while (__stxr(v28 + 1, p_shared_weak_owners));
      v62 = &v70;
      v55[0] = v17;
      v56 = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25;
      v57 = &__block_descriptor_tmp_29_0;
      v58 = a1;
      v59 = v19;
      v60 = v18;
      do
        v29 = __ldxr(p_shared_weak_owners);
      while (__stxr(v29 + 1, p_shared_weak_owners));
    }
    else
    {
      v62 = &v70;
      v55[0] = v17;
      v56 = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25;
      v57 = &__block_descriptor_tmp_29_0;
      v58 = a1;
      v59 = v19;
      v60 = 0;
    }
    v55[1] = 1174405120;
    v53[0] = v17;
    v53[1] = 1174405120;
    v53[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_30;
    v53[3] = &__block_descriptor_tmp_33;
    v53[4] = a1;
    v53[5] = v19;
    v54 = v18;
    if (v18)
    {
      v30 = (unint64_t *)&v18->__shared_weak_owners_;
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    if (((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD *, _QWORD *))(**(_QWORD **)(a1 + 40) + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 28), *(_QWORD *)(a1 + 16), v61, v55, v53) & 1) == 0)
    {
      v32 = (pci::log *)_TelephonyUtilDebugPrintError();
      v33 = pci::log::get(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "bh";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a1;
        v85 = 1024;
        v86 = v34;
        v87 = 2080;
        v88 = "init";
        _os_log_impl(&dword_20DB0C000, v33, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to start", buf, 0x26u);
      }
      v35 = v71[5];
      if (v35)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v35 + 16))(v35, 0, 0, 0);
        v36 = (const void *)v71[5];
        v71[5] = 0;
        if (v36)
          _Block_release(v36);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    v37 = *(_DWORD *)(a2 + 4);
    if (v37 == -1)
      v38 = -1;
    else
      v38 = dispatch_time(0, 1000000 * v37);
    if (dispatch_semaphore_wait(v24, v38))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
      v39 = v71[5];
      if (v39)
      {
        (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v39 + 16))(v39, 0, 1, 0);
        v40 = (const void *)v71[5];
        v71[5] = 0;
        if (v40)
          _Block_release(v40);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (*((_BYTE *)v77 + 24) || (v42 = *((_DWORD *)v81 + 6)) == 0)
    {
      v41 = 0;
    }
    else
    {
      *((_DWORD *)v81 + 6) = v42 - 1;
      v43 = dispatch_group_create();
      (*(void (**)(_QWORD, NSObject *))(**(_QWORD **)(a1 + 40) + 40))(*(_QWORD *)(a1 + 40), v43);
      dispatch_group_wait(v43, 0xFFFFFFFFFFFFFFFFLL);
      v44 = *(_DWORD *)(a2 + 4) / (*(_DWORD *)(a2 + 8) + 1);
      if (v44 >= 0x3E8)
        v44 = 1000;
      usleep(1000 * v44);
      if (v43)
        dispatch_release(v43);
      v41 = 1;
    }
    if (v54)
      std::__shared_weak_count::__release_weak(v54);
    if (v60)
      std::__shared_weak_count::__release_weak(v60);
    if (v65)
      std::__shared_weak_count::__release_weak(v65);
    if (object)
      dispatch_release(object);
    if (v24)
      dispatch_release(v24);
    if (v18)
      std::__shared_weak_count::__release_weak(v18);
  }
  while ((v41 & 1) != 0);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*((_BYTE *)v77 + 24))
    *(_BYTE *)(a1 + 33) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  v45 = *((_BYTE *)v77 + 24) != 0;
LABEL_85:
  _Block_object_dispose(&v70, 8);
  if (v75)
    _Block_release(v75);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  return v45;
}

void sub_20DB17EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,std::__shared_weak_count *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,std::__shared_weak_count *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,dispatch_object_t object,uint64_t a45,std::__shared_weak_count *a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,void *aBlock)
{
  uint64_t v52;

  _Block_object_dispose(&a47, 8);
  if (aBlock)
    _Block_release(aBlock);
  _Block_object_dispose((const void *)(v52 - 224), 8);
  _Block_object_dispose((const void *)(v52 - 192), 8);
  _Unwind_Resume(a1);
}

void std::shared_ptr<pci::transport::bh>::reset[abi:ne180100](_QWORD *a1)
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

uint64_t pci::transport::bh::bh(uint64_t a1, uint64_t a2)
{
  void **v4;
  NSObject *v5;
  pci::log *v6;
  NSObject *v7;
  void *v9[2];
  char v10;
  void *v11[2];
  char v12;
  void *__p[2];
  char v14;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>(v11, "com.apple.WirelessIPC.baseband.pci_bh");
  std::string::basic_string[abi:ne180100]<0>(v9, "_");
  v4 = __p;
  pci::transport::bh::generateString((uint64_t)v11, (uint64_t)v9, __p);
  if (v14 < 0)
    v4 = (void **)__p[0];
  v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)*(_DWORD *)(a2 + 24), 0);
  *(_QWORD *)(a1 + 16) = dispatch_queue_create_with_target_V2((const char *)v4, v5, *(dispatch_queue_t *)(a2 + 16));
  if (v14 < 0)
    operator delete(__p[0]);
  if (v10 < 0)
    operator delete(v9[0]);
  if (v12 < 0)
    operator delete(v11[0]);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = a1 + 64;
  *(_QWORD *)(a1 + 72) = a1 + 64;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = a1 + 96;
  *(_QWORD *)(a1 + 104) = 0;
  pci::system::info::get((_QWORD *)(a1 + 112));
  v6 = (pci::log *)_TelephonyUtilDebugPrint();
  v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    pci::transport::bh::bh();
  return a1;
}

void sub_20DB18210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  _QWORD **v31;
  uint64_t v33;
  NSObject *v34;
  std::__shared_weak_count *v35;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v29);
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(v28, *v31);
  std::__list_imp<void const*>::clear(v27);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v26);
  v33 = *v30;
  *v30 = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  v34 = *(NSObject **)(v25 + 16);
  if (v34)
    dispatch_release(v34);
  v35 = *(std::__shared_weak_count **)(v25 + 8);
  if (v35)
    std::__shared_weak_count::__release_weak(v35);
  _Unwind_Resume(a1);
}

uint64_t pci::transport::bh::generateString@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[10];
  char v16;
  uint64_t v17;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  v6 = *(char *)(a1 + 23);
  if (v6 >= 0)
    v7 = a1;
  else
    v7 = *(_QWORD *)a1;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a1 + 23);
  else
    v8 = *(_QWORD *)(a1 + 8);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, v7, v8);
  v10 = *(char *)(a2 + 23);
  if (v10 >= 0)
    v11 = a2;
  else
    v11 = *(_QWORD *)a2;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a2 + 23);
  else
    v12 = *(_QWORD *)(a2 + 8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a3);
  v14 = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)&v15[-1] + *(_QWORD *)(v14 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v15[0] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BAF8E8](&v17);
}

void sub_20DB183B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void pci::transport::bh::~bh(pci::transport::bh *this)
{
  pci::log *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  pci::log *v15;
  NSObject *v16;
  pci::log *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29[2];
  _QWORD block[6];

  v2 = (pci::log *)_TelephonyUtilDebugPrint();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    pci::transport::bh::~bh();
  if (*((_QWORD *)this + 10))
    __assert_rtn("~bh", "PCITransportBH.cpp", 58, "fCBL.empty()");
  v4 = *((_QWORD *)this + 6);
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3802000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v6 = (_QWORD *)*((_QWORD *)this + 7);
    v28 = v4;
    v29[0] = v6;
    *((_QWORD *)this + 6) = 0;
    *((_QWORD *)this + 7) = 0;
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100]((_QWORD *)this + 6);
    v7 = *((_QWORD *)this + 2);
    block[0] = v5;
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2bhD2Ev_block_invoke;
    block[3] = &unk_24C8199C8;
    block[4] = &v23;
    dispatch_async(v7, block);
    _Block_object_dispose(&v23, 8);
    v8 = (std::__shared_weak_count *)v29[0];
    if (v29[0])
    {
      v9 = v29[0] + 1;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  v11 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = (_QWORD *)*((_QWORD *)this + 13);
  if (v12)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x4002000000;
    v26 = __Block_byref_object_copy__7;
    v27 = __Block_byref_object_dispose__8;
    v13 = (_QWORD *)*((_QWORD *)this + 12);
    v28 = *((_QWORD *)this + 11);
    v29[0] = v13;
    v29[1] = v12;
    v13[2] = v29;
    *((_QWORD *)this + 11) = (char *)this + 96;
    *((_QWORD *)this + 12) = 0;
    *((_QWORD *)this + 13) = 0;
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)this + 88, 0);
    *((_QWORD *)this + 11) = (char *)this + 96;
    *((_QWORD *)this + 12) = 0;
    *((_QWORD *)this + 13) = 0;
    v14 = *((_QWORD *)this + 2);
    v22[0] = v5;
    v22[1] = 0x40000000;
    v22[2] = ___ZN3pci9transport2bhD2Ev_block_invoke_9;
    v22[3] = &unk_24C8199F0;
    v22[4] = &v23;
    dispatch_async(v14, v22);
    _Block_object_dispose(&v23, 8);
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)&v28, v29[0]);
  }
  if (*((_BYTE *)this + 32))
  {
    v15 = (pci::log *)_TelephonyUtilDebugPrint();
    v16 = pci::log::get(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      pci::transport::bh::~bh();
    pci::system::info::removeBH(*((pci::system::info **)this + 14), *((_DWORD *)this + 7));
    *((_BYTE *)this + 32) = 0;
  }
  std::shared_ptr<pci::transport::bh>::reset[abi:ne180100]((_QWORD *)this + 14);
  v17 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v18 = pci::log::get(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    pci::transport::bh::~bh();
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 112);
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)this + 88, *((_QWORD **)this + 12));
  std::__list_imp<void const*>::clear((_QWORD *)this + 8);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 48);
  v19 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = *((_QWORD *)this + 2);
  if (v20)
    dispatch_release(v20);
  v21 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
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

uint64_t __Block_byref_object_dispose__0(uint64_t a1)
{
  return std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN3pci9transport2bhD2Ev_block_invoke(uint64_t a1)
{
  pci::transport::task::complete(*(pci::transport::task **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), -536870183, 0, -1);
}

uint64_t *__Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  return std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::map[abi:ne180100]((uint64_t *)(a1 + 40), a2 + 40);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(a1 + 40, *(_QWORD **)(a1 + 48));
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

intptr_t ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  int v11;
  int v12;
  pci::log *v13;
  NSObject *v14;
  int v15;
  pci::log *v16;
  NSObject *v17;
  int v18;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 48);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v8 + 24));
  v9 = (pci::log *)_TelephonyUtilDebugPrint();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)buf = 136316674;
    v22 = "bh";
    v23 = 2048;
    v24 = v8;
    v25 = 1024;
    v26 = v20;
    v27 = 2080;
    v28 = "init_block_invoke";
    v29 = 1024;
    v30 = a2;
    v31 = 1024;
    v32 = a3;
    v33 = 1024;
    v34 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: in addComp added %u, started %u, service 0x%x", buf, 0x38u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 & a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_12;
  v11 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v8 + 40) + 48))(*(_QWORD *)(v8 + 40), a4);
  if (!v11)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  v12 = v11;
  if (v11 != -536870203)
  {
    v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    v17 = pci::log::get(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_DWORD *)(v8 + 28);
      *(_DWORD *)buf = 136316162;
      v22 = "bh";
      v23 = 2048;
      v24 = v8;
      v25 = 1024;
      v26 = v18;
      v27 = 2080;
      v28 = "init_block_invoke";
      v29 = 1024;
      v30 = v12;
      _os_log_impl(&dword_20DB0C000, v17, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to open 0x%x", buf, 0x2Cu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  v13 = (pci::log *)_TelephonyUtilDebugPrintError();
  v14 = pci::log::get(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)buf = 136316162;
    v22 = "bh";
    v23 = 2048;
    v24 = v8;
    v25 = 1024;
    v26 = v15;
    v27 = 2080;
    v28 = "init_block_invoke";
    v29 = 1024;
    v30 = -536870203;
    _os_log_impl(&dword_20DB0C000, v14, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to open 0x%x", buf, 0x2Cu);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __copy_helper_block_e8_56c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __destroy_helper_block_e8_56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 56);
  if (v1)
    dispatch_release(v1);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  os_unfair_lock_s *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  pci::log *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;

  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    v5 = (os_unfair_lock_s *)a1[5];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (a1[6])
      {
        os_unfair_lock_lock(v5 + 6);
        v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
        v9 = pci::log::get(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21_cold_1();
        v10 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
        if (v10)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, 1, 1, a2);
          v11 = *(_QWORD *)(a1[4] + 8);
          v12 = *(const void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = 0;
          if (v12)
            _Block_release(v12);
        }
        os_unfair_lock_unlock(v5 + 6);
      }
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_20DB18C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  pci::log *v5;
  NSObject *v6;
  pci::log *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  pci::transport::task *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v18;

  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    return;
  v3 = a1[4];
  v4 = std::__shared_weak_count::lock(v2);
  v18 = v4;
  if (!v4)
    return;
  if (!a1[5])
  {
    v12 = v4;
LABEL_21:
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
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
  v5 = (pci::log *)_TelephonyUtilDebugPrint();
  v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_2();
  v15 = 0;
  v16 = 0;
  if (*(_QWORD *)(v3 + 48))
  {
    if (!*(_BYTE *)(v3 + 33))
      __assert_rtn("init_block_invoke", "PCITransportBH.cpp", 227, "fActive");
    v7 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
    v8 = pci::log::get(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_1();
    std::shared_ptr<pci::system::info>::operator=[abi:ne180100]((uint64_t)&v15, (__int128 *)(v3 + 48));
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100]((_QWORD *)(v3 + 48));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
  if (v15)
    pci::transport::task::complete(v15, 0, 0, 0);
  v9 = v16;
  if (v16)
  {
    v10 = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v18;
  if (v18)
    goto LABEL_21;
}

void sub_20DB18EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_30(_QWORD *a1, unint64_t a2, int a3, int a4)
{
  std::__shared_weak_count *v5;
  os_unfair_lock_s *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  pci::log *v12;
  NSObject *v13;
  uint32_t os_unfair_lock_opaque;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  os_unfair_lock_s *v20;
  __int16 v21;
  uint32_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    v9 = (os_unfair_lock_s *)a1[4];
    v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      v11 = v10;
      if (a1[5])
      {
        os_unfair_lock_lock(v9 + 6);
        pci::transport::kernel::errorAsString(a2);
        pci::transport::kernel::errorAsUnsigned(a2);
        v12 = (pci::log *)_TelephonyUtilDebugPrintError();
        v13 = pci::log::get(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          os_unfair_lock_opaque = v9[7]._os_unfair_lock_opaque;
          *(_DWORD *)buf = 136316930;
          v18 = "bh";
          v19 = 2048;
          v20 = v9;
          v21 = 1024;
          v22 = os_unfair_lock_opaque;
          v23 = 2080;
          v24 = "init_block_invoke";
          v25 = 2080;
          v26 = pci::transport::kernel::errorAsString(a2);
          v27 = 1024;
          v28 = pci::transport::kernel::errorAsUnsigned(a2);
          v29 = 1024;
          v30 = a3;
          v31 = 1024;
          v32 = a4;
          _os_log_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: %s (%u): param 0x%x: status 0x%x", buf, 0x42u);
        }
        os_unfair_lock_unlock(v9 + 6);
      }
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_20DB190EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void pci::transport::bh::setNotify(uint64_t a1, uint64_t *a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 48);
  v5 = (_QWORD *)(a1 + 48);
  if (v6)
    pci::transport::bh::setNotify();
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](v5, a2);
  os_unfair_lock_unlock(v4);
}

__n128 __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__37(uint64_t a1)
{
  return std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](a1 + 40);
}

void pci::transport::bh::invokeCallbackAsync(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  NSObject *v5;
  _QWORD block[5];
  int v7;
  int v8;
  int v9;

  v5 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
  block[3] = &unk_24C819B20;
  block[4] = a2;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_async(v5, block);
}

uint64_t ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
}

void pci::transport::bh::open(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  pci::log *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23[2];
  void *aBlock;
  _BYTE block[24];
  __int128 v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a2[1];
  v23[0] = *a2;
  v23[1] = (uint64_t)v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v23, (uint64_t)"open pipe", 0, &aBlock);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v10 = *(_DWORD *)(a1 + 28);
  v11 = v10 > 0x11;
  v12 = (1 << v10) & 0x20041;
  if (v11 || v12 == 0)
  {
    v16 = *(_QWORD *)(a1 + 40);
    v14 = aBlock;
    v17 = _Block_copy(aBlock);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(_QWORD *)v16 + 128))(v16, a3, pci::transport::bh::cmdCompletion, v17);
    if (v18)
    {
      v19 = (pci::log *)_TelephonyUtilDebugPrintError();
      v20 = pci::log::get(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316162;
        *(_QWORD *)&block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(_QWORD *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v26) = v21;
        WORD2(v26) = 2080;
        *(_QWORD *)((char *)&v26 + 6) = "open";
        HIWORD(v26) = 1024;
        LODWORD(v27) = v18;
        _os_log_impl(&dword_20DB0C000, v20, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: open pipe failed 0x%x", block, 0x2Cu);
      }
      v22 = *(NSObject **)(a1 + 16);
      *(_QWORD *)block = MEMORY[0x24BDAC760];
      *(_QWORD *)&block[8] = 0x40000000;
      *(_QWORD *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(_QWORD *)&v26 = &unk_24C819B20;
      *((_QWORD *)&v26 + 1) = v14;
      v28 = 0;
      v27 = v18;
      dispatch_async(v22, block);
      _Block_release(v14);
    }
  }
  else
  {
    v14 = aBlock;
    v15 = *(NSObject **)(a1 + 16);
    *(_QWORD *)block = MEMORY[0x24BDAC760];
    *(_QWORD *)&block[8] = 0x40000000;
    *(_QWORD *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v26 = &unk_24C819B20;
    *((_QWORD *)&v26 + 1) = aBlock;
    v27 = 0;
    v28 = 0;
    dispatch_async(v15, block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v14)
    _Block_release(v14);
}

void sub_20DB1947C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  const void *v14;

  if (v14)
    _Block_release(v14);
  _Unwind_Resume(exception_object);
}

void pci::transport::bh::cmdCompletion(pci::transport::bh *this, void *a2)
{
  if (!this)
    pci::transport::bh::cmdCompletion();
  (*((void (**)(pci::transport::bh *, void *, _QWORD, _QWORD))this + 2))(this, a2, 0, 0);
  _Block_release(this);
}

void pci::transport::bh::close(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  int v10;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  pci::log *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  uint64_t v22[2];
  void *aBlock;
  _BYTE block[24];
  __int128 v25;
  uint64_t v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a2[1];
  v22[0] = *a2;
  v22[1] = (uint64_t)v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v22, (uint64_t)"close pipe", 0, &aBlock);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v10 = *(_DWORD *)(a1 + 28);
  if (v10 == 6 || v10 == 0)
  {
    v14 = aBlock;
    v12 = *(NSObject **)(a1 + 16);
    *(_QWORD *)block = MEMORY[0x24BDAC760];
    *(_QWORD *)&block[8] = 0x40000000;
    *(_QWORD *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v25 = &unk_24C819B20;
    *((_QWORD *)&v25 + 1) = aBlock;
    v26 = 0;
    v27 = 0;
    dispatch_async(v12, block);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = aBlock;
    v15 = _Block_copy(aBlock);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(_QWORD *)v13 + 120))(v13, a3, pci::transport::bh::cmdCompletion, v15);
    v17 = v16;
    if (v16)
    {
      v18 = (pci::log *)_TelephonyUtilDebugPrintError();
      v19 = pci::log::get(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316162;
        *(_QWORD *)&block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(_QWORD *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v25) = v20;
        WORD2(v25) = 2080;
        *(_QWORD *)((char *)&v25 + 6) = "close";
        HIWORD(v25) = 1024;
        LODWORD(v26) = v17;
        _os_log_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: close pipe failed 0x%x", block, 0x2Cu);
      }
      v21 = *(NSObject **)(a1 + 16);
      *(_QWORD *)block = MEMORY[0x24BDAC760];
      *(_QWORD *)&block[8] = 0x40000000;
      *(_QWORD *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(_QWORD *)&v25 = &unk_24C819B20;
      *((_QWORD *)&v25 + 1) = v14;
      v27 = 0;
      v26 = v17;
      dispatch_async(v21, block);
      _Block_release(v14);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v14)
    _Block_release(v14);
}

void sub_20DB19778(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  const void *v14;

  if (v14)
    _Block_release(v14);
  _Unwind_Resume(exception_object);
}

void pci::transport::bh::sendImage(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t Data;
  uint64_t Size;
  void *v12;
  void *v13;
  int v14;
  pci::log *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19[2];
  void *aBlock;
  _BYTE buf[24];
  __int128 v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(std::__shared_weak_count **)(a2 + 8);
  v19[0] = *(_QWORD *)a2;
  v19[1] = (uint64_t)v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v19, (uint64_t)"send image", 0, &aBlock);
  if (v4)
  {
    v7 = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v9 = *(_QWORD *)(a1 + 40);
  Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  v12 = aBlock;
  v13 = _Block_copy(aBlock);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, void *))(*(_QWORD *)v9 + 104))(v9, Data, Size, pci::transport::bh::imageCompletion, v13);
  if (v14)
  {
    v15 = (pci::log *)_TelephonyUtilDebugPrintError();
    v16 = pci::log::get(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v22) = v17;
      WORD2(v22) = 2080;
      *(_QWORD *)((char *)&v22 + 6) = "sendImage";
      HIWORD(v22) = 1024;
      v23 = v14;
      _os_log_impl(&dword_20DB0C000, v16, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: send image failed 0x%x", buf, 0x2Cu);
    }
    v18 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v22 = &unk_24C819B20;
    *((_QWORD *)&v22 + 1) = v12;
    v24 = 0;
    v25 = 0;
    v23 = v14;
    dispatch_async(v18, buf);
    _Block_release(v12);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v12)
    _Block_release(v12);
}

void sub_20DB19A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::imageCompletion(void (**this)(pci::transport::bh *, void *, uint64_t, void *, void *), void *a2, uint64_t a3, void *a4, void *a5)
{
  if (!this)
    pci::transport::bh::imageCompletion();
  this[2]((pci::transport::bh *)this, a2, a3, a4, a5);
  _Block_release(this);
}

void pci::transport::bh::readRegister(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t Data;
  int v13;
  pci::log *v14;
  NSObject *v15;
  int v16;
  const void *v17;
  NSObject *v18;
  int Size;
  uint64_t v20[2];
  const void *v21;
  _BYTE buf[24];
  __int128 v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  v20[0] = *(_QWORD *)a2;
  v20[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v20, (uint64_t)"read register", 0, &v21);
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
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  v11 = *(_QWORD *)(a1 + 40);
  Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)v11 + 112))(v11, a3, Data, &Size);
  v14 = (pci::log *)_TelephonyUtilDebugPrintError();
  v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "bh";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v23) = v16;
    WORD2(v23) = 2080;
    *(_QWORD *)((char *)&v23 + 6) = "readRegister";
    HIWORD(v23) = 1024;
    v24 = v13;
    _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: read register 0x%x", buf, 0x2Cu);
  }
  v17 = v21;
  v18 = *(NSObject **)(a1 + 16);
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 0x40000000;
  *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
  *(_QWORD *)&v23 = &unk_24C819B20;
  *((_QWORD *)&v23 + 1) = v21;
  v24 = v13;
  v25 = Size;
  v26 = 0;
  dispatch_async(v18, buf);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v17)
    _Block_release(v17);
}

void sub_20DB19CA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, void *aBlock)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::bh::getTimesyncBufferLength(pci::transport::bh *this, int a2)
{
  os_unfair_lock_s *v4;
  uint64_t TimesyncBufferSize;

  v4 = (os_unfair_lock_s *)((char *)this + 24);
  os_unfair_lock_lock((os_unfair_lock_t)this + 6);
  TimesyncBufferSize = pci::transport::kernel::getTimesyncBufferSize(*((pci::transport::kernel **)this + 5), a2);
  os_unfair_lock_unlock(v4);
  return TimesyncBufferSize;
}

uint64_t pci::transport::bh::marshalTimesyncResults(pci::transport::bh *this, char *a2, unsigned int a3)
{
  os_unfair_lock_s *v6;
  uint64_t v7;

  v6 = (os_unfair_lock_s *)((char *)this + 24);
  os_unfair_lock_lock((os_unfair_lock_t)this + 6);
  v7 = pci::transport::kernel::marshalTimesyncResults(*((pci::transport::kernel **)this + 5), a2, a3);
  os_unfair_lock_unlock(v6);
  return v7;
}

void pci::transport::bh::timesync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t Data;
  uint64_t Size;
  void *v16;
  void *v17;
  int v18;
  pci::log *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23[2];
  void *aBlock;
  _BYTE buf[24];
  __int128 v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = *(std::__shared_weak_count **)(a2 + 8);
  v23[0] = *(_QWORD *)a2;
  v23[1] = (uint64_t)v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v23, (uint64_t)"time sync", 0, &aBlock);
  if (v8)
  {
    v11 = (unint64_t *)&v8->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v13 = *(_QWORD *)(a1 + 40);
  Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  v16 = aBlock;
  v17 = _Block_copy(aBlock);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(_QWORD *)v13 + 136))(v13, a3, a4, Data, Size, pci::transport::bh::ioCompletion, v17);
  if (v18)
  {
    v19 = (pci::log *)_TelephonyUtilDebugPrintError();
    v20 = pci::log::get(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v26) = v21;
      WORD2(v26) = 2080;
      *(_QWORD *)((char *)&v26 + 6) = "timesync";
      HIWORD(v26) = 1024;
      v27 = v18;
      _os_log_impl(&dword_20DB0C000, v20, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time sync failed 0x%x", buf, 0x2Cu);
    }
    v22 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v26 = &unk_24C819B20;
    *((_QWORD *)&v26 + 1) = v16;
    v28 = 0;
    v29 = 0;
    v27 = v18;
    dispatch_async(v22, buf);
    _Block_release(v16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v16)
    _Block_release(v16);
}

void sub_20DB19FF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::bh::registerTimeEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  uint64_t *v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  pci::log *v16;
  NSObject *v17;
  int v18;
  _QWORD aBlock[5];
  int v21;
  int v22;
  uint8_t buf[4];
  _BYTE v24[18];
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v7 = *(_QWORD *)(a1 + 96);
  if (!v7)
    goto LABEL_11;
  v8 = a1 + 96;
  do
  {
    v9 = *(_DWORD *)(v7 + 32);
    v10 = v9 < (int)a2;
    if (v9 >= (int)a2)
      v11 = (uint64_t *)v7;
    else
      v11 = (uint64_t *)(v7 + 8);
    if (!v10)
      v8 = v7;
    v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 96 && *(_DWORD *)(v8 + 32) <= (int)a2)
  {
    v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    v17 = pci::log::get(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v24 = "bh";
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)&v24[10] = a1;
      v25 = 1024;
      v26 = v18;
      v27 = 2080;
      v28 = "registerTimeEvent";
      v29 = 1024;
      v30 = a2;
      _os_log_impl(&dword_20DB0C000, v17, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time event already registered for domain %u", buf, 0x2Cu);
    }
    os_unfair_lock_unlock(v6);
    return 3758097090;
  }
  else
  {
LABEL_11:
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3pci9transport2bh17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke;
    aBlock[3] = &unk_24C819B48;
    v21 = a2;
    aBlock[4] = a3;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    *(_DWORD *)buf = a2;
    if (v12)
      v14 = _Block_copy(v12);
    else
      v14 = 0;
    *(_QWORD *)&v24[4] = v14;
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>((uint64_t **)(a1 + 88), (int *)buf, (uint64_t)buf);
    if (*(_QWORD *)&v24[4])
      _Block_release(*(const void **)&v24[4]);
    v15 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, const void *))(**(_QWORD **)(a1 + 40) + 144))(*(_QWORD *)(a1 + 40), a2, pci::transport::bh::eventNotification, v13);
    if ((_DWORD)v15)
      std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__erase_unique<PCITransportTimeDomain>(a1 + 88, &v22);
    os_unfair_lock_unlock(v6);
    if (v13)
      _Block_release(v13);
  }
  return v15;
}

void sub_20DB1A27C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2bh17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke(uint64_t a1, int a2, _QWORD *a3, unsigned int a4)
{
  pci::log *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  pci::log *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    v7 = pci::log::get(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      return;
    v8 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109376;
    v17 = v8;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = a2;
    v9 = "got time event for domain %u with status 0x%08x";
    v10 = v7;
LABEL_7:
    _os_log_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_INFO, v9, buf, 0xEu);
    return;
  }
  if (a4 <= 3)
  {
    v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    v13 = pci::log::get(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      return;
    v14 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109376;
    v17 = v14;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = a4;
    v9 = "got time event for domain %u with only %u args";
    v10 = v13;
    goto LABEL_7;
  }
  buf[0] = *(_DWORD *)(a1 + 40);
  v15 = a3[1];
  buf[1] = *a3;
  *(_WORD *)&buf[2] = 0;
  v17 = v15;
  v18 = a3[3] | (a3[2] << 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    _Block_release(v2);
  return a1;
}

void pci::transport::bh::eventNotification(pci::transport::bh *this, void *a2, uint64_t a3, void **a4)
{
  if (!this)
    pci::transport::bh::eventNotification();
  _Block_copy(this);
  (*((void (**)(pci::transport::bh *, void *, uint64_t, void **))this + 2))(this, a2, a3, a4);
  _Block_release(this);
}

uint64_t pci::transport::bh::deregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t *v9;
  pci::log *v10;
  NSObject *v11;
  int v12;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  pci::log *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  _QWORD aBlock[9];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];
  void *v33;
  _BYTE buf[24];
  __int128 v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  _BYTE block[24];
  __int128 v39;
  int v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 96);
  if (!v5)
    goto LABEL_11;
  v6 = a1 + 96;
  do
  {
    v7 = *(_DWORD *)(v5 + 32);
    v8 = v7 < (int)a2;
    if (v7 >= (int)a2)
      v9 = (uint64_t *)v5;
    else
      v9 = (uint64_t *)(v5 + 8);
    if (!v8)
      v6 = v5;
    v5 = *v9;
  }
  while (*v9);
  if (v6 != a1 + 96 && *(_DWORD *)(v6 + 32) <= (int)a2)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3002000000;
    v32[3] = __Block_byref_object_copy__64;
    v32[4] = __Block_byref_object_dispose__65;
    v33 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)(a1 + 88), (uint64_t *)v6);
    std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(v6 + 32);
    operator delete((void *)v6);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3802000000;
    *(_QWORD *)&v35 = __Block_byref_object_copy__66;
    *((_QWORD *)&v35 + 1) = __Block_byref_object_dispose__67;
    std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(&v36, (_QWORD *)a1);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2000000000;
    v31 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke;
    aBlock[3] = &unk_24C819B70;
    aBlock[7] = &v26;
    aBlock[8] = a1;
    aBlock[4] = buf;
    aBlock[5] = v32;
    aBlock[6] = v30;
    v14 = _Block_copy(aBlock);
    v27[3] = (uint64_t)v14;
    v15 = operator new(0x18uLL);
    v16 = *(_QWORD *)(a1 + 64);
    v15[1] = a1 + 64;
    v15[2] = v14;
    *v15 = v16;
    *(_QWORD *)(v16 + 8) = v15;
    *(_QWORD *)(a1 + 64) = v15;
    ++*(_QWORD *)(a1 + 80);
    v17 = (*(uint64_t (**)(_QWORD, uint64_t, void (*)(pci::transport::bh *, void *), uint64_t))(**(_QWORD **)(a1 + 40) + 152))(*(_QWORD *)(a1 + 40), a2, pci::transport::bh::cmdCompletion, v27[3]);
    if (v17)
    {
      v18 = (pci::log *)_TelephonyUtilDebugPrintError();
      v19 = pci::log::get(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316418;
        *(_QWORD *)&block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(_QWORD *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v39) = v20;
        WORD2(v39) = 2080;
        *(_QWORD *)((char *)&v39 + 6) = "deregisterTimeEvent";
        HIWORD(v39) = 1024;
        v40 = a2;
        LOWORD(v41) = 1024;
        *(_DWORD *)((char *)&v41 + 2) = v17;
        _os_log_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: deregister time event for domain %u failed 0x%x", block, 0x32u);
      }
      v21 = *(NSObject **)(a1 + 16);
      *(_QWORD *)block = MEMORY[0x24BDAC760];
      *(_QWORD *)&block[8] = 0x40000000;
      *(_QWORD *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(_QWORD *)&v39 = &unk_24C819B20;
      *((_QWORD *)&v39 + 1) = v14;
      v41 = 0;
      v40 = v17;
      dispatch_async(v21, block);
      _Block_release(v14);
    }
    os_unfair_lock_unlock(v4);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);
    v22 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    _Block_object_dispose(v32, 8);
    if (v33)
      _Block_release(v33);
    return 0;
  }
  else
  {
LABEL_11:
    v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v35) = v12;
      WORD2(v35) = 2080;
      *(_QWORD *)((char *)&v35 + 6) = "deregisterTimeEvent";
      HIWORD(v35) = 1024;
      LODWORD(v36) = a2;
      _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time event not registered for domain %u", buf, 0x2Cu);
    }
    os_unfair_lock_unlock(v4);
    return 3758097090;
  }
}

void sub_20DB1A94C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *aBlock,char a39)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
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

uint64_t __Block_byref_object_dispose__67(uint64_t a1)
{
  return std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;

  v2 = a1[8];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  v3 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v3 + 24))
    ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke_cold_1();
  *(_BYTE *)(v3 + 24) = 1;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(const void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;
  if (v5)
    _Block_release(v5);
  std::list<void const*>::remove(v2 + 64, (_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
}

void pci::transport::bh::mapRegion(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  pci::log *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  pci::log *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  uint64_t v32;
  uint64_t v36;
  std::__shared_weak_count *v37;
  void *aBlock;
  _BYTE buf[24];
  __int128 v40;
  int v41;
  _BYTE v42[10];
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v32 = *(unsigned int *)(a1 + 28);
  v14 = (pci::log *)_TelephonyUtilDebugPrintError();
  v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "bh";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v40) = v16;
    WORD2(v40) = 2080;
    *(_QWORD *)((char *)&v40 + 6) = "mapRegion";
    HIWORD(v40) = 1024;
    v41 = a3;
    *(_WORD *)v42 = 2048;
    *(_QWORD *)&v42[2] = a4;
    v43 = 1024;
    v44 = a5;
    _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: region %u, buffer %p, length %u", buf, 0x3Cu);
  }
  v17 = *a2;
  v18 = (std::__shared_weak_count *)a2[1];
  v36 = v17;
  v37 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, &v36, (uint64_t)"map region", 0, &aBlock);
  if (v18)
  {
    v21 = (unint64_t *)&v18->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v23 = *(_QWORD *)(a1 + 40);
  v24 = aBlock;
  v25 = _Block_copy(aBlock);
  v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *, const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, std::__shared_weak_count *))(*(_QWORD *)v23 + 160))(v23, a3, a4, a5, a6, a7, pci::transport::bh::cmdCompletion, v25, "bh", "mapRegion", a1, v32, a3, a4, a5, v36, v37);
  if (v26)
  {
    v27 = (pci::log *)_TelephonyUtilDebugPrintError();
    v28 = pci::log::get(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v40) = v29;
      WORD2(v40) = 2080;
      *(_QWORD *)((char *)&v40 + 6) = "mapRegion";
      HIWORD(v40) = 1024;
      v41 = v26;
      _os_log_impl(&dword_20DB0C000, v28, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: map region failed 0x%x", buf, 0x2Cu);
    }
    v30 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v40 = &unk_24C819B20;
    *((_QWORD *)&v40 + 1) = v24;
    *(_DWORD *)v42 = 0;
    *(_DWORD *)&v42[4] = 0;
    v41 = v26;
    dispatch_async(v30, buf);
    _Block_release(v24);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v24)
    _Block_release(v24);
}

void sub_20DB1ADCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::unmapRegion(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  pci::log *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18[2];
  void *aBlock;
  _BYTE buf[24];
  __int128 v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a2[1];
  v18[0] = *a2;
  v18[1] = (uint64_t)v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  pci::transport::bh::generateCallback(a1, v18, (uint64_t)"unmap region", 0, &aBlock);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = aBlock;
  v12 = _Block_copy(aBlock);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(_QWORD *)v10 + 168))(v10, a3, pci::transport::bh::cmdCompletion, v12);
  if (v13)
  {
    v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v21) = v16;
      WORD2(v21) = 2080;
      *(_QWORD *)((char *)&v21 + 6) = "unmapRegion";
      HIWORD(v21) = 1024;
      v22 = v13;
      _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: unmap region failed 0x%x", buf, 0x2Cu);
    }
    v17 = *(NSObject **)(a1 + 16);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(_QWORD *)&v21 = &unk_24C819B20;
    *((_QWORD *)&v21 + 1) = v11;
    v23 = 0;
    v24 = 0;
    v22 = v13;
    dispatch_async(v17, buf);
    _Block_release(v11);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v11)
    _Block_release(v11);
}

void sub_20DB1B03C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
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

void sub_20DB1B1F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BAF8E8](v1);
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
  MEMORY[0x212BAF8E8](a1 + 112);
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
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x212BAF828](v13, a1);
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
  MEMORY[0x212BAF834](v13);
  return a1;
}

void sub_20DB1B3A8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212BAF834](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20DB1B388);
}

void sub_20DB1B3F0(_Unwind_Exception *a1)
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

void sub_20DB1B524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

_QWORD *std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24C819BA0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>((uint64_t)a1, a2, (uint64_t)a2);
  return a1;
}

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

void sub_20DB1B740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<pci::transport::bh>::reset[abi:ne180100]((pci::transport::bh **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

pci::transport::bh *std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__on_zero_shared(uint64_t a1)
{
  pci::transport::bh *result;

  result = *(pci::transport::bh **)(a1 + 24);
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::bh *std::unique_ptr<pci::transport::bh>::reset[abi:ne180100](pci::transport::bh **a1, pci::transport::bh *a2)
{
  pci::transport::bh *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

void std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

uint64_t *std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *> *,long>>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_20DB1B8D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_hint_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>> const&>(v5, v6, v4 + 8, (uint64_t)(v4 + 8));
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_hint_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  _QWORD v10[2];
  char v11;
  uint64_t v12;
  uint64_t *v13;

  v6 = std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(a1, a2, &v13, &v12, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x30uLL);
    v10[1] = a1 + 1;
    std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::pair[abi:ne180100]((uint64_t)(v7 + 4), a4);
    v11 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v13, v8, v7);
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::pair[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(void **)(a2 + 8);
  if (v3)
    v3 = _Block_copy(v3);
  *(_QWORD *)(a1 + 8) = v3;
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

uint64_t **std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t **v8;
  int v9;
  int v10;
  _DWORD *v11;
  _QWORD v13[2];
  char v14;

  v6 = a1 + 1;
  v5 = a1[1];
  v7 = a1 + 1;
  v8 = a1 + 1;
  if (v5)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v10 = *((_DWORD *)v5 + 8);
        if (v9 >= v10)
          break;
        v5 = *v8;
        v7 = v8;
        if (!*v8)
          goto LABEL_9;
      }
      if (v10 >= v9)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v7 = v8 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = operator new(0x30uLL);
    v13[1] = v6;
    v11[8] = *(_DWORD *)a3;
    *((_QWORD *)v11 + 5) = *(_QWORD *)(a3 + 8);
    *(_QWORD *)(a3 + 8) = 0;
    v14 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v8, v7, (uint64_t *)v11);
    v13[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v13, 0);
    return (uint64_t **)v11;
  }
  return v8;
}

uint64_t std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__erase_unique<PCITransportTimeDomain>(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(v4 + 32);
  operator delete((void *)v4);
  return 1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void pci::event::Listener::create(const void **a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  pci::event::Listener *v12[2];

  v6 = (_QWORD *)operator new();
  if (*a1)
    v7 = _Block_copy(*a1);
  else
    v7 = 0;
  v11 = v7;
  pci::event::Listener::Listener(v6, &v11, a2);
  std::shared_ptr<pci::event::Listener>::shared_ptr[abi:ne180100]<pci::event::Listener,void>(v12, v6);
  if (v7)
    _Block_release(v7);
  if (pci::event::Listener::init(v12[0]))
  {
    *(_OWORD *)a3 = *(_OWORD *)v12;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v8 = (std::__shared_weak_count *)v12[1];
    if (v12[1])
    {
      v9 = (unint64_t *)((char *)v12[1] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_20DB1BDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL pci::event::Listener::init(pci::event::Listener *this)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  int v12;
  pci::log *v13;
  NSObject *v14;
  std::mutex *v15;
  _BOOL8 v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  _BOOL8 v26;
  pci::log *v27;
  NSObject *v28;
  pci::log *v29;
  NSObject *v30;
  const char *v31;
  pci::log *v33;
  pci::log *v34;
  pci::log *v35;
  _QWORD v36[6];
  std::__shared_weak_count *v37;
  _QWORD v38[6];
  std::__shared_weak_count *v39;
  uint8_t buf[8];
  std::__shared_weak_count *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!*((_QWORD *)this + 2) || !*((_QWORD *)this + 3))
  {
    v29 = (pci::log *)_TelephonyUtilDebugPrintError();
    v30 = pci::log::get(v29);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v31 = "bad argument";
LABEL_45:
    _os_log_impl(&dword_20DB0C000, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
    return 0;
  }
  v2 = *((_QWORD *)this + 4);
  if (!v2)
  {
    v33 = (pci::log *)_TelephonyUtilDebugPrintError();
    v30 = pci::log::get(v33);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v31 = "failed to open control driver";
    goto LABEL_45;
  }
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2))
  {
    v34 = (pci::log *)_TelephonyUtilDebugPrintError();
    v30 = pci::log::get(v34);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v31 = "IOABPControlClass::start() returned failure";
    goto LABEL_45;
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, this);
  v4 = *(_QWORD *)buf;
  v3 = v41;
  if (v41)
  {
    p_shared_weak_owners = (unint64_t *)&v41->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v9 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 1174405120;
  v38[2] = ___ZN3pci5event8Listener4initEv_block_invoke;
  v38[3] = &__block_descriptor_tmp_3;
  v38[4] = this;
  v38[5] = v4;
  v39 = v3;
  if (v3)
  {
    v10 = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD *))(**((_QWORD **)this + 4) + 72))(*((_QWORD *)this + 4), *((_QWORD *)this + 3), v38);
  if (v12)
  {
    v13 = (pci::log *)_TelephonyUtilDebugPrintError();
    v14 = pci::log::get(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_20DB0C000, v14, OS_LOG_TYPE_INFO, "IOABPControlClass::registerEventCallback() returned %#x", buf, 8u);
    }
    (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 32))(*((_QWORD *)this + 4));
  }
  if (v39)
    std::__shared_weak_count::__release_weak(v39);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  if (v12)
    return 0;
  v15 = (std::mutex *)((char *)this + 40);
  v16 = pci::event::PDPListener::start((std::mutex *)((char *)this + 40));
  if (!v16)
  {
    if (pci::transport::kernel::probeVariant((pci::transport::kernel *)v16) == 2
      && (int)TelephonyRadiosGetRadio() > 13)
    {
      return 1;
    }
    v35 = (pci::log *)_TelephonyUtilDebugPrintError();
    v30 = pci::log::get(v35);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v31 = "PDPListener::start() returned failure";
    goto LABEL_45;
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, this);
  v18 = *(_QWORD *)buf;
  v17 = v41;
  if (v41)
  {
    v19 = (unint64_t *)&v41->__shared_weak_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    v21 = (unint64_t *)&v17->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v36[0] = v9;
  v36[1] = 1174405120;
  v36[2] = ___ZN3pci5event8Listener4initEv_block_invoke_22;
  v36[3] = &__block_descriptor_tmp_24_0;
  v36[4] = this;
  v36[5] = v18;
  v37 = v17;
  if (v17)
  {
    v23 = (unint64_t *)&v17->__shared_weak_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v25 = pci::event::PDPListener::registerEventNotification((uint64_t)this + 40, *((_QWORD *)this + 3), v36);
  v26 = v25 == 0;
  if (v25)
  {
    v27 = (pci::log *)_TelephonyUtilDebugPrintError();
    v28 = pci::log::get(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v25;
      _os_log_impl(&dword_20DB0C000, v28, OS_LOG_TYPE_INFO, "PDPListener::registerEventCallback() returned %#x", buf, 8u);
    }
    pci::event::PDPListener::stop(v15);
  }
  if (v37)
    std::__shared_weak_count::__release_weak(v37);
  if (v17)
    std::__shared_weak_count::__release_weak(v17);
  return v26;
}

void sub_20DB1C2B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  std::__shared_weak_count *v24;

  if (a17)
    std::__shared_weak_count::__release_weak(a17);
  if (v24)
    std::__shared_weak_count::__release_weak(v24);
  _Unwind_Resume(exception_object);
}

void pci::event::Listener::~Listener(pci::event::Listener *this)
{
  uint64_t v2;
  pci::log *v3;
  NSObject *v4;
  pci::log *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  pci::log *v9;
  uint64_t v10;
  const void *v11;
  std::__shared_weak_count *v12;
  __int16 v13;
  uint8_t buf[16];
  uint8_t v15[2];

  v2 = *((_QWORD *)this + 4);
  if (!v2)
  {
    v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    v6 = pci::log::get(v9);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    *(_WORD *)v15 = 0;
    v7 = "invalid control driver";
    v8 = v15;
    goto LABEL_10;
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 88))(v2, 0);
  if (((*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 32))(*((_QWORD *)this + 4)) & 1) == 0)
  {
    v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB0C000, v4, OS_LOG_TYPE_INFO, "IOABPControlClass::stop() returned failure", buf, 2u);
    }
  }
  pci::event::PDPListener::deregisterEventNotification((std::mutex *)((char *)this + 40));
  if ((pci::event::PDPListener::stop((std::mutex *)((char *)this + 40)) & 1) == 0)
  {
    v5 = (pci::log *)_TelephonyUtilDebugPrintError();
    v6 = pci::log::get(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v7 = "PDPListener::stop() returned failure";
      v8 = (uint8_t *)&v13;
LABEL_10:
      _os_log_impl(&dword_20DB0C000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    }
  }
LABEL_11:
  pci::event::PDPListener::~PDPListener((pci::event::Listener *)((char *)this + 40));
  v10 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 3);
  v11 = (const void *)*((_QWORD *)this + 2);
  if (v11)
    _Block_release(v11);
  v12 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
}

_QWORD *pci::event::Listener::Listener(_QWORD *a1, void **a2, CFTypeRef cf)
{
  void *v5;

  *a1 = 0;
  a1[1] = 0;
  v5 = *a2;
  if (*a2)
    v5 = _Block_copy(v5);
  a1[2] = v5;
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::SharedRef(a1 + 3, cf);
  pci::transport::kernelControl::create(a1 + 4);
  pci::event::PDPListener::PDPListener((pci::event::PDPListener *)(a1 + 5));
  return a1;
}

void sub_20DB1C524(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void **v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  const void *v7;
  std::__shared_weak_count *v8;

  v4 = v3;
  v6 = *v4;
  *v4 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(v2);
  v7 = *(const void **)(v1 + 16);
  if (v7)
    _Block_release(v7);
  v8 = *(std::__shared_weak_count **)(v1 + 8);
  if (v8)
    std::__shared_weak_count::__release_weak(v8);
  _Unwind_Resume(a1);
}

uint64_t pci::event::Listener::notify(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  pci::log *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t ACIPCErrorTypeString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t ACIPCAERErrorTypeString;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ABPLinkStateString;
  uint64_t v34;
  uint64_t ABPErrorTypeString;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ACIPCLinkStateString;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  pci::transport::kernel::errorAsString(a2);
  pci::transport::kernel::errorAsUnsigned(a2);
  v8 = (pci::log *)_TelephonyUtilDebugPrint();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v55 = pci::transport::kernel::errorAsString(a2);
    v56 = 1024;
    v57 = pci::transport::kernel::errorAsUnsigned(a2);
    v58 = 2048;
    v59 = a3;
    v60 = 2048;
    v61 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s (%u), arg1 %p, arg2 %p", buf, 0x26u);
  }
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)buf);
  switch((_DWORD)a2)
  {
    case 0:
      MEMORY[0x212BAF7C8](buf, "pci error (unsupported variant: unknown): ");
      v12 = ctu::operator<<();
      goto LABEL_14;
    case 2:
      if (HIDWORD(a2) <= 0x37)
      {
        if (((1 << SBYTE4(a2)) & 0xFE076BFFE07FFFLL) != 0)
        {
          v10 = MEMORY[0x212BAF7C8](buf, "pci error: ");
          ACIPCErrorTypeString = getACIPCErrorTypeString();
          goto LABEL_12;
        }
        if (HIDWORD(a2) == 39)
        {
          if (a3 < 3)
          {
            v36 = MEMORY[0x212BAF7C8](buf, "pci error: ");
            v37 = getACIPCErrorTypeString();
            v38 = MEMORY[0x212BAF7C8](v36, v37);
            v39 = MEMORY[0x212BAF7C8](v38, ": ");
            ACIPCLinkStateString = getACIPCLinkStateString();
            MEMORY[0x212BAF7C8](v39, ACIPCLinkStateString);
            goto LABEL_31;
          }
          if ((_DWORD)a3 != 3)
          {
            if ((_DWORD)a3 != 4)
              __assert_rtn("notify", "PCIEvent.cpp", 214, "false");
            goto LABEL_34;
          }
          v49 = MEMORY[0x212BAF7C8](buf, "pci error: ");
          v50 = getACIPCErrorTypeString();
          v51 = MEMORY[0x212BAF7C8](v49, v50);
          v52 = MEMORY[0x212BAF7C8](v51, ": ");
          v53 = getACIPCLinkStateString();
          MEMORY[0x212BAF7C8](v52, v53);
LABEL_40:
          v15 = 0;
          v16 = 1000;
          goto LABEL_16;
        }
        if (HIDWORD(a2) == 43)
        {
          v25 = MEMORY[0x212BAF7C8](buf, "pci error: ");
          v26 = getACIPCErrorTypeString();
          v27 = MEMORY[0x212BAF7C8](v25, v26);
          v23 = MEMORY[0x212BAF7C8](v27, ": ");
          ACIPCAERErrorTypeString = getACIPCAERErrorTypeString();
          goto LABEL_23;
        }
      }
      v34 = MEMORY[0x212BAF7C8](buf, "pci error: ");
      ABPErrorTypeString = getACIPCErrorTypeString();
      goto LABEL_30;
    case 1:
      if (HIDWORD(a2) > 0x31)
      {
LABEL_26:
        v34 = MEMORY[0x212BAF7C8](buf, "pci error: ");
        ABPErrorTypeString = getABPErrorTypeString();
LABEL_30:
        v41 = MEMORY[0x212BAF7C8](v34, ABPErrorTypeString);
        MEMORY[0x212BAF7C8](v41, ": (");
        v42 = ctu::operator<<();
        MEMORY[0x212BAF7C8](v42, ", ");
        v43 = ctu::operator<<();
        MEMORY[0x212BAF7C8](v43, ")");
        goto LABEL_31;
      }
      if (((1 << SBYTE4(a2)) & 0x3E77BFFE07FFFLL) != 0)
      {
        v10 = MEMORY[0x212BAF7C8](buf, "pci error: ");
        ACIPCErrorTypeString = getABPErrorTypeString();
LABEL_12:
        v12 = MEMORY[0x212BAF7C8](v10, ACIPCErrorTypeString);
LABEL_14:
        MEMORY[0x212BAF7C8](v12, ": (");
        v13 = ctu::operator<<();
        MEMORY[0x212BAF7C8](v13, ", ");
        v14 = ctu::operator<<();
        MEMORY[0x212BAF7C8](v14, ")");
        break;
      }
      if (HIDWORD(a2) != 39)
      {
        if (HIDWORD(a2) == 43)
        {
          v20 = MEMORY[0x212BAF7C8](buf, "pci error: ");
          v21 = getABPErrorTypeString();
          v22 = MEMORY[0x212BAF7C8](v20, v21);
          v23 = MEMORY[0x212BAF7C8](v22, ": ");
          ACIPCAERErrorTypeString = getABPAERErrorTypeString();
LABEL_23:
          v28 = MEMORY[0x212BAF7C8](v23, ACIPCAERErrorTypeString);
          MEMORY[0x212BAF7C8](v28, ": ");
          ctu::operator<<();
          break;
        }
        goto LABEL_26;
      }
      if (a3 < 3)
      {
        v29 = MEMORY[0x212BAF7C8](buf, "pci error: ");
        v30 = getABPErrorTypeString();
        v31 = MEMORY[0x212BAF7C8](v29, v30);
        v32 = MEMORY[0x212BAF7C8](v31, ": ");
        ABPLinkStateString = getABPLinkStateString();
        MEMORY[0x212BAF7C8](v32, ABPLinkStateString);
LABEL_31:
        v16 = 0;
        v15 = 1;
        goto LABEL_16;
      }
      if ((_DWORD)a3 != 3)
      {
        if ((_DWORD)a3 != 4)
          __assert_rtn("notify", "PCIEvent.cpp", 114, "false");
LABEL_34:
        MEMORY[0x212BAF7C8](buf, "AP-triggered baseband reset");
        break;
      }
      v44 = MEMORY[0x212BAF7C8](buf, "pci error: ");
      v45 = getABPErrorTypeString();
      v46 = MEMORY[0x212BAF7C8](v44, v45);
      v47 = MEMORY[0x212BAF7C8](v46, ": ");
      v48 = getABPLinkStateString();
      MEMORY[0x212BAF7C8](v47, v48);
      goto LABEL_40;
  }
  v15 = 0;
  v16 = 0;
LABEL_16:
  v17 = MEMORY[0x212BAF798](buf);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 16))(*(_QWORD *)(a1 + 16), v15, v17, v16, v18);
  return MEMORY[0x212BAF7B0](buf);
}

void sub_20DB1CB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  MEMORY[0x212BAF7B0](va);
  _Unwind_Resume(a1);
}

uint64_t pci::event::Listener::notifyPDP(uint64_t a1, unint64_t a2, uint64_t a3)
{
  pci::log *v6;
  NSObject *v7;
  uint64_t v8;
  const char *PDPMessageTypeString;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[56];

  pci::event::getPDPMessageTypeString(a2);
  pci::event::getPDPMessageTypeValue(a2);
  v6 = (pci::log *)_TelephonyUtilDebugPrint();
  v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    pci::event::Listener::notifyPDP(a2, a3, v7);
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v13);
  v8 = MEMORY[0x212BAF7C8](v13, "pdp error: ");
  PDPMessageTypeString = pci::event::getPDPMessageTypeString(a2);
  v10 = MEMORY[0x212BAF7C8](v8, PDPMessageTypeString);
  MEMORY[0x212BAF7C8](v10, ": ");
  ctu::operator<<();
  v11 = MEMORY[0x212BAF798](v13);
  (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 16))(*(_QWORD *)(a1 + 16), 0, v11, 0);
  return MEMORY[0x212BAF7B0](v13);
}

void ___ZN3pci5event8Listener4initEv_block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__shared_weak_count *v5;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    v9 = a1[4];
    v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      v11 = v10;
      if (a1[5])
        pci::event::Listener::notify(v9, a2, a3, a4);
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
  }
}

void sub_20DB1CD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN3pci5event8Listener4initEv_block_invoke_22(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;

  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v7 = a1[4];
    v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      v9 = v8;
      if (a1[5])
        pci::event::Listener::notifyPDP(v7, a2, a3);
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
  }
}

void sub_20DB1CE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<pci::event::Listener>::shared_ptr[abi:ne180100]<pci::event::Listener,void>(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_24C819C78;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>((uint64_t)a1, a2, (uint64_t)a2);
  return a1;
}

void sub_20DB1CE94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<pci::event::Listener>::reset[abi:ne180100]((pci::event::Listener **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

pci::event::Listener *std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__on_zero_shared(uint64_t a1)
{
  pci::event::Listener *result;

  result = *(pci::event::Listener **)(a1 + 24);
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::event::Listener *std::unique_ptr<pci::event::Listener>::reset[abi:ne180100](pci::event::Listener **a1, pci::event::Listener *a2)
{
  pci::event::Listener *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

_QWORD *ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

const char *getABPPDPMessageTypeString(int a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "invalid";
  while (abpPDPMessageTypeStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 52)
      return result;
  }
  return *(const char **)&abpPDPMessageTypeStrings[v2 + 2];
}

const char *getACIPCPDPMessageTypeString(int a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "invalid";
  while (acipcPDPMessageTypeStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 52)
      return result;
  }
  return *(const char **)&acipcPDPMessageTypeStrings[v2 + 2];
}

unint64_t pci::event::getPDPMessageTypeValue(unint64_t a1)
{
  return HIDWORD(a1);
}

const char *pci::event::getPDPMessageTypeString(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  int *v3;
  const char *result;

  v1 = HIDWORD(a1);
  if ((_DWORD)a1 == 1)
  {
    v2 = 0;
    v3 = abpPDPMessageTypeStrings;
    result = "invalid";
    while (abpPDPMessageTypeStrings[v2] != (_DWORD)v1)
    {
      v2 += 4;
      if (v2 == 52)
        return result;
    }
  }
  else
  {
    if ((_DWORD)a1 != 2)
      return "unrecognized error code";
    v2 = 0;
    v3 = acipcPDPMessageTypeStrings;
    result = "invalid";
    while (acipcPDPMessageTypeStrings[v2] != (_DWORD)v1)
    {
      v2 += 4;
      if (v2 == 52)
        return result;
    }
  }
  return *(const char **)&v3[v2 + 2];
}

double pci::event::PDPListener::PDPListener(pci::event::PDPListener *this)
{
  double result;

  *(_QWORD *)this = 850045863;
  *((_QWORD *)this + 13) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_DWORD *)this + 24) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = 850045863;
  *((_QWORD *)this + 13) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_DWORD *)this + 24) = 0;
  return result;
}

void pci::event::PDPListener::~PDPListener(pci::event::PDPListener *this)
{
  const void *v2;

  pci::event::PDPListener::stop((std::mutex *)this);
  v2 = (const void *)*((_QWORD *)this + 13);
  if (v2)
    _Block_release(v2);
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 9);
  std::mutex::~mutex((std::mutex *)this);
}

uint64_t pci::event::PDPListener::stop(std::mutex *this)
{
  io_object_t sig;

  std::mutex::lock(this);
  pci::event::PDPListener::deregisterEventNotification_nl((pci::event::PDPListener *)this);
  sig = this[1].__m_.__sig;
  if (sig)
  {
    IOObjectRelease(sig);
    LODWORD(this[1].__m_.__sig) = 0;
  }
  std::mutex::unlock(this);
  return 1;
}

void sub_20DB1D1B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL pci::event::PDPListener::start(std::mutex *this)
{
  pci::transport::kernel *v2;
  _BOOL8 v3;
  int v4;
  const char *v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  pci::log *v8;
  NSObject *v9;
  pci::log *v10;
  NSObject *v11;
  pci::log *v12;
  NSObject *v13;
  uint8_t buf[16];
  uint8_t v16[16];
  uint8_t v17[16];

  std::mutex::lock(this);
  if (LODWORD(this[1].__m_.__sig))
  {
    v3 = 1;
    goto LABEL_17;
  }
  v4 = pci::transport::kernel::probeVariant(v2);
  if (v4 == 1)
  {
    v5 = "AppleBasebandPCIPDPManagerBase";
  }
  else
  {
    if (v4 != 2)
    {
      v10 = (pci::log *)_TelephonyUtilDebugPrintError();
      v11 = pci::log::get(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, "unknown PCI variant", v17, 2u);
      }
      goto LABEL_14;
    }
    v5 = "AppleConvergedIPCPDPManager";
  }
  v6 = IOServiceMatching(v5);
  if (v6)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v6);
    v3 = MatchingService != 0;
    if (!MatchingService)
    {
      v8 = (pci::log *)_TelephonyUtilDebugPrintError();
      v9 = pci::log::get(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_INFO, "could not get matching service", buf, 2u);
      }
    }
    LODWORD(this[1].__m_.__sig) = MatchingService;
    goto LABEL_17;
  }
LABEL_14:
  v12 = (pci::log *)_TelephonyUtilDebugPrintError();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_INFO, "could not create matching dictionary", v16, 2u);
  }
  v3 = 0;
LABEL_17:
  std::mutex::unlock(this);
  return v3;
}

void sub_20DB1D390(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void pci::event::PDPListener::deregisterEventNotification_nl(pci::event::PDPListener *this)
{
  uint64_t (*v1)(uint64_t);
  NSObject *v3;
  NSObject *v4;
  __CFRunLoop *v5;
  const void *v6;
  _QWORD v7[5];
  dispatch_group_t group;

  if (*((_QWORD *)this + 9))
    v1 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
  else
    v1 = 0;
  if (v1)
  {
    pci::event::PDPListener::clearEventNotificationPort((CFRunLoopRef *)this);
    if (CFRunLoopGetCurrent() == *((CFRunLoopRef *)this + 9))
    {
      IOObjectRelease(*((_DWORD *)this + 24));
      *((_DWORD *)this + 24) = 0;
    }
    else
    {
      v3 = dispatch_group_create();
      v4 = v3;
      if (v3)
      {
        dispatch_retain(v3);
        dispatch_group_enter(v4);
      }
      v5 = (__CFRunLoop *)*((_QWORD *)this + 9);
      v6 = (const void *)*MEMORY[0x24BDBD5A0];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 1174405120;
      v7[2] = ___ZN3pci5event11PDPListener30deregisterEventNotification_nlEv_block_invoke;
      v7[3] = &__block_descriptor_tmp_4;
      v7[4] = this;
      group = v4;
      if (v4)
      {
        dispatch_retain(v4);
        dispatch_group_enter(v4);
      }
      CFRunLoopPerformBlock(v5, v6, v7);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 9));
      if (group)
      {
        dispatch_group_leave(group);
        if (group)
          dispatch_release(group);
      }
      if (v4)
      {
        dispatch_group_leave(v4);
        dispatch_release(v4);
      }
      std::mutex::unlock((std::mutex *)this);
      dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
      std::mutex::lock((std::mutex *)this);
      if (v4)
        dispatch_release(v4);
    }
  }
}

void sub_20DB1D4F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  NSObject *v14;

  if (v14)
    dispatch_release(v14);
  _Unwind_Resume(exception_object);
}

void pci::event::PDPListener::setEventNotificationPort(pci::event::PDPListener *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;

  if (!*((_QWORD *)this + 10))
  {
    v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    *((_QWORD *)this + 10) = v2;
    if (!v2)
      pci::event::PDPListener::setEventNotificationPort();
    RunLoopSource = IONotificationPortGetRunLoopSource(v2);
    *((_QWORD *)this + 11) = RunLoopSource;
    CFRunLoopAddSource(*((CFRunLoopRef *)this + 9), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  }
}

void pci::event::PDPListener::clearEventNotificationPort(CFRunLoopRef *this)
{
  _QWORD *v1;

  v1 = this + 10;
  if (this[10])
  {
    CFRunLoopRemoveSource(this[9], this[11], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    IONotificationPortDestroy(this[10]);
    *v1 = 0;
    v1[1] = 0;
  }
}

uint64_t pci::event::PDPListener::registerEventNotification(uint64_t a1, uint64_t a2, const void *a3)
{
  pci::log *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  pci::log *v10;
  NSObject *v11;
  uint32_t v12;
  void *v14;
  const void *v15;
  kern_return_t v16;
  pci::log *v17;
  NSObject *v18;
  pci::log *v19;
  uint8_t buf[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  std::mutex::lock((std::mutex *)a1);
  if (*(_DWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 104))
    {
      v6 = (pci::log *)_TelephonyUtilDebugPrintError();
      v7 = pci::log::get(v6);
      v8 = 3758097093;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = "a notification block is already registered. deregister it before registering a new block";
LABEL_7:
        v11 = v7;
        v12 = 2;
LABEL_8:
        _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, v9, buf, v12);
      }
    }
    else
    {
      if (!a3)
      {
        v19 = (pci::log *)_TelephonyUtilDebugPrintError();
        v7 = pci::log::get(v19);
        v8 = 3758097090;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_9;
        *(_WORD *)buf = 0;
        v9 = "block must be provided";
        goto LABEL_7;
      }
      v14 = _Block_copy(a3);
      v15 = *(const void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v14;
      if (v15)
        _Block_release(v15);
      *(_QWORD *)buf = a2;
      ctu::cf::CFSharedRef<__CFRunLoop>::operator=((const void **)(a1 + 72), (CFTypeRef *)buf);
      pci::event::PDPListener::setEventNotificationPort((pci::event::PDPListener *)a1);
      v16 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 80), *(_DWORD *)(a1 + 64), "IOGeneralInterest", (IOServiceInterestCallback)pci::event::PDPListener::generalInterestCallback, (void *)a1, (io_object_t *)(a1 + 96));
      if (!v16)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v17 = (pci::log *)_TelephonyUtilDebugPrintError();
      v18 = pci::log::get(v17);
      v8 = 3758097084;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v16;
        v9 = "could not add interest notification on service: %#x";
        v11 = v18;
        v12 = 8;
        goto LABEL_8;
      }
    }
  }
  else
  {
    v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    v7 = pci::log::get(v10);
    v8 = 3758097136;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "service is NULL - must successfully start() first";
      goto LABEL_7;
    }
  }
LABEL_9:
  std::mutex::unlock((std::mutex *)a1);
  return v8;
}

void sub_20DB1D86C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

_QWORD *pci::event::PDPListener::generalInterestCallback(pci::event::PDPListener *this, void *a2, int a3, void *a4, void *a5)
{
  return pci::event::PDPListener::generalInterestFunction(this, a3, a4);
}

_QWORD *pci::event::PDPListener::generalInterestFunction(_QWORD *this, int a2, void *a3)
{
  _QWORD *v3;
  uint64_t i;
  unint64_t v5;
  int *v6;
  int v7;

  if (this[13])
  {
    v3 = this;
    for (i = 0; i != 52; i += 4)
    {
      if (abpPDPMessageTypeStrings[i] == a2)
        goto LABEL_10;
    }
    if (a2 == -469794735)
    {
LABEL_10:
      pci::transport::kernel::probeVariant((pci::transport::kernel *)this);
      return (_QWORD *)(*(uint64_t (**)(void))(v3[13] + 16))();
    }
    v5 = -1;
    v6 = &dword_24C819DC0;
    while (v5 != 11)
    {
      v7 = *v6;
      v6 += 4;
      ++v5;
      if (v7 == a2)
      {
        if (v5 > 0xB)
          return this;
        goto LABEL_10;
      }
    }
  }
  return this;
}

BOOL pci::event::PDPListener::shouldNotify(pci::event::PDPListener *this, int a2)
{
  uint64_t i;
  unint64_t v4;
  int *v5;
  unint64_t v6;
  int v7;

  for (i = 0; i != 52; i += 4)
  {
    if (abpPDPMessageTypeStrings[i] == a2)
      return 1;
  }
  if (a2 == -469794735)
    return 1;
  v4 = 0;
  v5 = &dword_24C819DC0;
  do
  {
    v6 = v4;
    if (v4 == 12)
      break;
    v7 = *v5;
    v5 += 4;
    ++v4;
  }
  while (v7 != a2);
  return v6 < 0xC;
}

void pci::event::PDPListener::deregisterEventNotification(std::mutex *this)
{
  std::mutex::lock(this);
  pci::event::PDPListener::deregisterEventNotification_nl((pci::event::PDPListener *)this);
  std::mutex::unlock(this);
}

void sub_20DB1DA0C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN3pci5event11PDPListener30deregisterEventNotification_nlEv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  std::mutex::lock((std::mutex *)v1);
  IOObjectRelease(*(_DWORD *)(v1 + 96));
  *(_DWORD *)(v1 + 96) = 0;
  std::mutex::unlock((std::mutex *)v1);
}

void sub_20DB1DA54(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    v4 = *(NSObject **)(a1 + 40);
    if (v4)
      dispatch_group_enter(v4);
  }
}

void __destroy_helper_block_e8_40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
      dispatch_release(v3);
  }
}

void pci::transport::th::create(uint64_t a1@<X0>, pci::transport::th **a2@<X8>)
{
  uint64_t v4;

  v4 = operator new();
  pci::transport::th::th(v4, a1);
  std::shared_ptr<pci::transport::th>::shared_ptr[abi:ne180100]<pci::transport::th,void>(a2, v4);
  if (!*a2 || !pci::transport::th::init(*a2))
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100](a2);
}

void sub_20DB1DB60(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL pci::transport::th::init(pci::transport::th *this)
{
  NSObject *v2;
  _DWORD *v3;
  pci::log *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  NSObject *v9;
  uint64_t *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  pci::log *v14;
  NSObject *v15;
  int v16;
  void *v17;
  const void *v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t *PciTransportToDirectionMap;
  __int128 v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  pci::log *v37;
  NSObject *v38;
  int v39;
  uint64_t *v40;
  __int128 v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  pci::log *v54;
  NSObject *v55;
  int v56;
  unsigned int v57;
  dispatch_time_t v58;
  _BOOL4 v59;
  unsigned int v60;
  int v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  pci::transport::task *v72;
  pci::transport::task *v73;
  pci::transport::task *v74;
  pci::transport::task *v75;
  _QWORD aBlock[5];
  dispatch_object_t object;
  _BYTE __p[12];
  uint64_t v79;
  int v80;
  pci::transport::task *v81[2];
  pci::transport::task *v82[2];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  _BYTE v87[22];
  __int16 v88;
  int v89;
  __int16 v90;
  const char *v91;
  _BYTE buf[28];
  __int16 v93;
  _BYTE v94[18];
  __int128 v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v83 = 0;
  v84 = &v83;
  v85 = 0x2000000000;
  v86 = 1;
  v82[0] = 0;
  v82[1] = 0;
  v81[0] = 0;
  v81[1] = 0;
  v2 = dispatch_group_create();
  v3 = (_DWORD *)((char *)this + 40);
  v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    pci::transport::th::init();
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (!*((_QWORD *)this + 6))
  {
    std::string::basic_string[abi:ne180100]<0>(v87, "com.apple.WirelessIPC.baseband.pci_client");
    std::string::basic_string[abi:ne180100]<0>(__p, "_");
    v6 = buf;
    pci::transport::th::generateString((uint64_t)v87, (uint64_t)__p, buf);
    if (buf[23] < 0)
      v6 = *(const char **)buf;
    v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)*((_DWORD *)this + 30), 0);
    v8 = dispatch_queue_create_with_target_V2(v6, v7, *((dispatch_queue_t *)this + 14));
    v9 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = v8;
    if (v9)
      dispatch_release(v9);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v79) < 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v88) < 0)
      operator delete(*(void **)v87);
  }
  *(_DWORD *)__p = *((_DWORD *)this + 10);
  *(_QWORD *)&__p[4] = *((_QWORD *)this + 8);
  v79 = *((_QWORD *)this + 14);
  v80 = *((_DWORD *)this + 30);
  pci::transport::bh::create((uint64_t)__p, (uint64_t *)buf);
  v10 = (uint64_t *)((char *)this + 24);
  std::shared_ptr<pci::system::info>::operator=[abi:ne180100]((uint64_t)this + 24, (__int128 *)buf);
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (!*v10)
  {
    v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *((_DWORD *)this + 10);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "th";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = this;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v16;
      v93 = 2080;
      *(_QWORD *)v94 = "init";
      _os_log_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create bh", buf, 0x26u);
    }
    *((_BYTE *)v84 + 24) = 0;
  }
  *(_OWORD *)&v94[2] = 0u;
  v95 = 0u;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3pci9transport2th4initEv_block_invoke;
  aBlock[3] = &unk_24C819EF8;
  aBlock[4] = &v83;
  object = v2;
  if (v2)
    dispatch_retain(v2);
  v17 = _Block_copy(aBlock);
  v18 = v17;
  *(_DWORD *)buf = *v3;
  memset(&buf[4], 0, 24);
  if (v17)
    v19 = _Block_copy(v17);
  else
    v19 = 0;
  v20 = *(const void **)&v94[2];
  *(_QWORD *)&v94[2] = v19;
  if (v20)
    _Block_release(v20);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v94[10], (uint64_t *)this);
  v21 = *((_QWORD *)this + 2);
  if (v21)
    dispatch_retain(*((dispatch_object_t *)this + 2));
  v22 = *((_QWORD *)&v95 + 1);
  *((_QWORD *)&v95 + 1) = v21;
  if (v22)
    dispatch_release(v22);
  if (v18)
    _Block_release(v18);
  if (*((_BYTE *)v84 + 24))
  {
    *(_DWORD *)v87 = *v3;
    PciTransportToDirectionMap = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)PciTransportToDirectionMap, (int *)v87) & 0xFFFFFFFD) == 1)
    {
      dispatch_group_enter(v2);
      pci::transport::task::create((const pci::transport::task::parameters *)buf, (uint64_t)this + 128, (uint64_t *)v87);
      v24 = *(_OWORD *)v87;
      *(_QWORD *)v87 = 0;
      *(_QWORD *)&v87[8] = 0;
      v25 = (std::__shared_weak_count *)v82[1];
      *(_OWORD *)v82 = v24;
      if (v25)
      {
        p_shared_owners = (unint64_t *)&v25->__shared_owners_;
        do
          v27 = __ldaxr(p_shared_owners);
        while (__stlxr(v27 - 1, p_shared_owners));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      v28 = *(std::__shared_weak_count **)&v87[8];
      if (*(_QWORD *)&v87[8])
      {
        v29 = (unint64_t *)(*(_QWORD *)&v87[8] + 8);
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      if (v82[0])
      {
        v31 = *v10;
        v74 = v82[0];
        v75 = v82[1];
        if (v82[1])
        {
          v32 = (unint64_t *)((char *)v82[1] + 8);
          do
            v33 = __ldxr(v32);
          while (__stxr(v33 + 1, v32));
        }
        pci::transport::bh::open(v31, (uint64_t *)&v74, 1);
        v34 = (std::__shared_weak_count *)v75;
        if (v75)
        {
          v35 = (unint64_t *)((char *)v75 + 8);
          do
            v36 = __ldaxr(v35);
          while (__stlxr(v36 - 1, v35));
          if (!v36)
          {
            ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
            std::__shared_weak_count::__release_weak(v34);
          }
        }
      }
      else
      {
        v37 = (pci::log *)_TelephonyUtilDebugPrintError();
        v38 = pci::log::get(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = *((_DWORD *)this + 10);
          *(_DWORD *)v87 = 136315906;
          *(_QWORD *)&v87[4] = "th";
          *(_WORD *)&v87[12] = 2048;
          *(_QWORD *)&v87[14] = this;
          v88 = 1024;
          v89 = v39;
          v90 = 2080;
          v91 = "init";
          _os_log_impl(&dword_20DB0C000, v38, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task open in", v87, 0x26u);
        }
        *((_BYTE *)v84 + 24) = 0;
        dispatch_group_leave(v2);
      }
    }
  }
  if (*((_BYTE *)v84 + 24))
  {
    *(_DWORD *)v87 = *v3;
    v40 = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)v40, (int *)v87) & 0xFFFFFFFE) == 2)
    {
      dispatch_group_enter(v2);
      pci::transport::task::create((const pci::transport::task::parameters *)buf, (uint64_t)this + 128, (uint64_t *)v87);
      v41 = *(_OWORD *)v87;
      *(_QWORD *)v87 = 0;
      *(_QWORD *)&v87[8] = 0;
      v42 = (std::__shared_weak_count *)v81[1];
      *(_OWORD *)v81 = v41;
      if (v42)
      {
        v43 = (unint64_t *)&v42->__shared_owners_;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
      v45 = *(std::__shared_weak_count **)&v87[8];
      if (*(_QWORD *)&v87[8])
      {
        v46 = (unint64_t *)(*(_QWORD *)&v87[8] + 8);
        do
          v47 = __ldaxr(v46);
        while (__stlxr(v47 - 1, v46));
        if (!v47)
        {
          ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
          std::__shared_weak_count::__release_weak(v45);
        }
      }
      if (v81[0])
      {
        v48 = *v10;
        v72 = v81[0];
        v73 = v81[1];
        if (v81[1])
        {
          v49 = (unint64_t *)((char *)v81[1] + 8);
          do
            v50 = __ldxr(v49);
          while (__stxr(v50 + 1, v49));
        }
        pci::transport::bh::open(v48, (uint64_t *)&v72, 2);
        v51 = (std::__shared_weak_count *)v73;
        if (v73)
        {
          v52 = (unint64_t *)((char *)v73 + 8);
          do
            v53 = __ldaxr(v52);
          while (__stlxr(v53 - 1, v52));
          if (!v53)
          {
            ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
            std::__shared_weak_count::__release_weak(v51);
          }
        }
      }
      else
      {
        v54 = (pci::log *)_TelephonyUtilDebugPrintError();
        v55 = pci::log::get(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = *((_DWORD *)this + 10);
          *(_DWORD *)v87 = 136315906;
          *(_QWORD *)&v87[4] = "th";
          *(_WORD *)&v87[12] = 2048;
          *(_QWORD *)&v87[14] = this;
          v88 = 1024;
          v89 = v56;
          v90 = 2080;
          v91 = "init";
          _os_log_impl(&dword_20DB0C000, v55, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task open out", v87, 0x26u);
        }
        *((_BYTE *)v84 + 24) = 0;
        dispatch_group_leave(v2);
      }
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  v57 = *((_DWORD *)this + 16);
  if (v57 == -1)
    v58 = -1;
  else
    v58 = dispatch_time(0, 1000000 * v57);
  if (dispatch_group_wait(v2, v58))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)this);
    if (v82[0])
      pci::transport::task::poison(v82[0], -536870186);
    if (v81[0])
      pci::transport::task::poison(v81[0], -536870186);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
    dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((_BYTE *)v84 + 24) && (v59 = pci::transport::th::notify(this), *((_BYTE *)v84 + 24) = v59, v59))
  {
    if (*((_BYTE *)this + 74) && *((_DWORD *)this + 19))
    {
      v60 = 0;
      do
      {
        pci::transport::th::readAsync((os_unfair_lock_t *)this);
        ++v60;
      }
      while (v60 < *((_DWORD *)this + 19));
      v61 = *((unsigned __int8 *)v84 + 24);
    }
    else
    {
      v61 = 1;
    }
  }
  else
  {
    v61 = 0;
  }
  if (object)
    dispatch_release(object);
  if (*((_QWORD *)&v95 + 1))
    dispatch_release(*((dispatch_object_t *)&v95 + 1));
  v62 = (std::__shared_weak_count *)v95;
  if ((_QWORD)v95)
  {
    v63 = (unint64_t *)(v95 + 8);
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  if (*(_QWORD *)&v94[2])
    _Block_release(*(const void **)&v94[2]);
  if (v2)
    dispatch_release(v2);
  v65 = (std::__shared_weak_count *)v81[1];
  if (v81[1])
  {
    v66 = (unint64_t *)((char *)v81[1] + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  v68 = (std::__shared_weak_count *)v82[1];
  if (v82[1])
  {
    v69 = (unint64_t *)((char *)v82[1] + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  _Block_object_dispose(&v83, 8);
  return v61 != 0;
}

void sub_20DB1E4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  NSObject *v43;
  uint64_t v44;

  if (object)
    dispatch_release(object);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v44 - 160));
  if (v43)
    dispatch_release(v43);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a30);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a32);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

uint64_t pci::transport::th::th(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  dispatch_group_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  pci::log *v13;
  NSObject *v14;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24C81A328;
  *(_QWORD *)(a1 + 8) = v4;
  *((_DWORD *)v4 + 6) = 0;
  *(_QWORD *)a1 = v4 + 3;
  v5 = dispatch_group_create();
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 16) = v5;
  v6 = *(NSObject **)(a2 + 8);
  *(_QWORD *)(a1 + 48) = v6;
  if (v6)
    dispatch_retain(v6);
  v7 = *(void **)(a2 + 16);
  if (v7)
    v7 = _Block_copy(v7);
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 72) = v8 & 1;
  *(_BYTE *)(a1 + 73) = (v8 & 2) != 0;
  *(_BYTE *)(a1 + 74) = (v8 & 4) != 0;
  *(_QWORD *)(a1 + 76) = *(_QWORD *)(a2 + 36);
  v9 = *(void **)(a2 + 48);
  if (v9)
    v9 = _Block_copy(v9);
  *(_QWORD *)(a1 + 88) = v9;
  v10 = *(void **)(a2 + 56);
  if (v10)
    v10 = _Block_copy(v10);
  *(_QWORD *)(a1 + 96) = v10;
  v11 = *(void **)(a2 + 64);
  if (v11)
    v11 = _Block_copy(v11);
  *(_QWORD *)(a1 + 104) = v11;
  v12 = *(NSObject **)(a2 + 72);
  if (v12)
  {
    *(_QWORD *)(a1 + 112) = v12;
    dispatch_retain(v12);
  }
  else
  {
    pci::system::info::get(&v20);
    v16 = *(NSObject **)(v20 + 24);
    *(_QWORD *)(a1 + 112) = v16;
    if (v16)
      dispatch_retain(v16);
    v17 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 128) = a1 + 128;
  *(_QWORD *)(a1 + 136) = a1 + 128;
  *(_QWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 152) = 0;
  v13 = (pci::log *)_TelephonyUtilDebugPrint();
  v14 = pci::log::get(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    pci::transport::th::th();
  return a1;
}

void sub_20DB1E784(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  dispatch_object_t *v3;
  NSObject **v4;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  v6 = (const void *)v1[13];
  if (v6)
    _Block_release(v6);
  v7 = (const void *)v1[12];
  if (v7)
    _Block_release(v7);
  v8 = (const void *)v1[11];
  if (v8)
    _Block_release(v8);
  v9 = (const void *)v1[7];
  if (v9)
    _Block_release(v9);
  pci::transport::th::th(v4, v2, v3);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  _Unwind_Resume(a1);
}

void pci::transport::th::~th(pci::transport::th *this)
{
  int *v2;
  pci::log *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t *PciTransportToDirectionMap;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  pci::transport::task *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  pci::log *v43;
  NSObject *v44;
  NSObject *v45;
  const void *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *aBlock[2];
  dispatch_object_t object[2];

  v2 = (int *)((char *)this + 40);
  v3 = (pci::log *)_TelephonyUtilDebugPrint();
  v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    pci::transport::th::~th();
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  v6 = (uint64_t *)((char *)this + 24);
  v5 = *((_QWORD *)this + 3);
  *((_BYTE *)this + 152) = 1;
  if (v5)
  {
    *(_OWORD *)aBlock = 0u;
    *(_OWORD *)object = 0u;
    v7 = _Block_copy(&__block_literal_global_2);
    v8 = v7;
    v58 = *v2;
    v59 = 0;
    v61 = 0;
    v60 = 0;
    if (v7)
      v9 = _Block_copy(v7);
    else
      v9 = 0;
    v10 = aBlock[0];
    aBlock[0] = v9;
    if (v10)
      _Block_release(v10);
    std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&aBlock[1], (uint64_t *)this);
    v11 = *((_QWORD *)this + 2);
    if (v11)
      dispatch_retain(*((dispatch_object_t *)this + 2));
    v12 = object[1];
    object[1] = v11;
    if (v12)
      dispatch_release(v12);
    if (v8)
      _Block_release(v8);
    LODWORD(v56) = *v2;
    PciTransportToDirectionMap = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)PciTransportToDirectionMap, (int *)&v56) & 0xFFFFFFFD) == 1)
    {
      pci::transport::task::create((const pci::transport::task::parameters *)&v58, (uint64_t)this + 128, &v56);
      if (v56)
      {
        v14 = *v6;
        v54 = v56;
        v55 = v57;
        if (v57)
        {
          p_shared_owners = (unint64_t *)&v57->__shared_owners_;
          do
            v16 = __ldxr(p_shared_owners);
          while (__stxr(v16 + 1, p_shared_owners));
        }
        pci::transport::bh::close(v14, &v54, 1);
        v17 = v55;
        if (v55)
        {
          v18 = (unint64_t *)&v55->__shared_owners_;
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
      v20 = v57;
      if (v57)
      {
        v21 = (unint64_t *)&v57->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
    LODWORD(v56) = *v2;
    v23 = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)v23, (int *)&v56) & 0xFFFFFFFE) == 2)
    {
      pci::transport::task::create((const pci::transport::task::parameters *)&v58, (uint64_t)this + 128, &v56);
      if (v56)
      {
        v24 = *v6;
        v52 = v56;
        v53 = v57;
        if (v57)
        {
          v25 = (unint64_t *)&v57->__shared_owners_;
          do
            v26 = __ldxr(v25);
          while (__stxr(v26 + 1, v25));
        }
        pci::transport::bh::close(v24, &v52, 2);
        v27 = v53;
        if (v53)
        {
          v28 = (unint64_t *)&v53->__shared_owners_;
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
      v30 = v57;
      if (v57)
      {
        v31 = (unint64_t *)&v57->__shared_owners_;
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
    v33 = (_QWORD *)*((_QWORD *)this + 17);
    while (v33 != (_QWORD *)((char *)this + 128))
    {
      v35 = (pci::transport::task *)v33[2];
      v34 = (std::__shared_weak_count *)v33[3];
      v33 = (_QWORD *)v33[1];
      if (v34)
      {
        v36 = (unint64_t *)&v34->__shared_owners_;
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      if (!*((_BYTE *)this + 73) || pci::transport::task::getType(v35) == 1)
        pci::transport::task::poison(v35, -536870165);
      if (v34)
      {
        v38 = (unint64_t *)&v34->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
    }
    std::shared_ptr<pci::transport::bh>::reset[abi:ne180100]((_QWORD *)this + 3);
    if (object[1])
      dispatch_release(object[1]);
    v40 = (std::__shared_weak_count *)object[0];
    if (object[0])
    {
      v41 = (unint64_t *)&object[0][1];
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    if (aBlock[0])
      _Block_release(aBlock[0]);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  dispatch_group_wait(*((dispatch_group_t *)this + 2), 0xFFFFFFFFFFFFFFFFLL);
  v43 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v44 = pci::log::get(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    pci::transport::th::~th();
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)this + 16);
  v45 = *((_QWORD *)this + 14);
  if (v45)
    dispatch_release(v45);
  v46 = (const void *)*((_QWORD *)this + 13);
  if (v46)
    _Block_release(v46);
  v47 = (const void *)*((_QWORD *)this + 12);
  if (v47)
    _Block_release(v47);
  v48 = (const void *)*((_QWORD *)this + 11);
  if (v48)
    _Block_release(v48);
  v49 = (const void *)*((_QWORD *)this + 7);
  if (v49)
    _Block_release(v49);
  v50 = *((_QWORD *)this + 6);
  if (v50)
    dispatch_release(v50);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v51 = *((_QWORD *)this + 2);
  if (v51)
    dispatch_release(v51);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void pci::transport::th::lock(os_unfair_lock_t *this)
{
  os_unfair_lock_lock(*this);
}

void pci::transport::task::parameters::~parameters(pci::transport::task::parameters *this)
{
  NSObject *v2;
  const void *v3;

  v2 = *((_QWORD *)this + 7);
  if (v2)
    dispatch_release(v2);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  v3 = (const void *)*((_QWORD *)this + 4);
  if (v3)
    _Block_release(v3);
}

void pci::transport::th::unlock(os_unfair_lock_t *this)
{
  os_unfair_lock_unlock(*this);
}

uint64_t pci::transport::th::generateString@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[10];
  char v16;
  uint64_t v17;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  v6 = *(char *)(a1 + 23);
  if (v6 >= 0)
    v7 = a1;
  else
    v7 = *(_QWORD *)a1;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a1 + 23);
  else
    v8 = *(_QWORD *)(a1 + 8);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, v7, v8);
  v10 = *(char *)(a2 + 23);
  if (v10 >= 0)
    v11 = a2;
  else
    v11 = *(_QWORD *)a2;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a2 + 23);
  else
    v12 = *(_QWORD *)(a2 + 8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a3);
  v14 = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)&v15[-1] + *(_QWORD *)(v14 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v15[0] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BAF8E8](&v17);
}

void sub_20DB1EE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th4initEv_block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 8);
  if (a2)
    v5 = 1;
  else
    v5 = *(_BYTE *)(v4 + 24) == 0;
  v6 = !v5;
  *(_BYTE *)(v4 + 24) = v6;
  dispatch_group_leave(v2);
}

void __copy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

BOOL pci::transport::th::notify(pci::transport::th *this)
{
  _DWORD *v2;
  pci::log *v3;
  NSObject *v4;
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  pci::log *v18;
  NSObject *v19;
  int v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  _QWORD aBlock[5];
  _DWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37[2];
  dispatch_object_t object[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  pci::transport::th *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)((char *)this + 40);
  v3 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    pci::transport::th::notify();
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  *(_OWORD *)v37 = 0u;
  *(_OWORD *)object = 0u;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th6notifyEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_15;
  aBlock[4] = this;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  v33[0] = *v2;
  v33[1] = 1;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  if (v5)
    v7 = _Block_copy(v5);
  else
    v7 = 0;
  v8 = v37[0];
  v37[0] = v7;
  if (v8)
    _Block_release(v8);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v37[1], (uint64_t *)this);
  v9 = *((_QWORD *)this + 2);
  if (v9)
    dispatch_retain(*((dispatch_object_t *)this + 2));
  v10 = object[1];
  object[1] = v9;
  if (v10)
    dispatch_release(v10);
  if (v6)
    _Block_release(v6);
  pci::transport::task::create((const pci::transport::task::parameters *)v33, (uint64_t)this + 128, &v30);
  v11 = v30;
  if (v30)
  {
    v12 = *((_QWORD *)this + 3);
    v28 = v30;
    v29 = v31;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    pci::transport::bh::setNotify(v12, &v28);
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
  }
  else
  {
    v18 = (pci::log *)_TelephonyUtilDebugPrintError();
    v19 = pci::log::get(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *((_DWORD *)this + 10);
      *(_DWORD *)buf = 136315906;
      v40 = "th";
      v41 = 2048;
      v42 = this;
      v43 = 1024;
      v44 = v20;
      v45 = 2080;
      v46 = "notify";
      _os_log_impl(&dword_20DB0C000, v19, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task notify", buf, 0x26u);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
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
  if (object[1])
    dispatch_release(object[1]);
  v24 = (std::__shared_weak_count *)object[0];
  if (object[0])
  {
    v25 = (unint64_t *)&object[0][1];
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v37[0])
    _Block_release(v37[0]);
  return v11 != 0;
}

void sub_20DB1F1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va1);
  _Unwind_Resume(a1);
}

BOOL pci::transport::th::readAsync(os_unfair_lock_t *this)
{
  pci::log *v2;
  NSObject *v3;
  void *v4;
  const void *v5;
  int v6;
  const void *v7;
  void *v8;
  __int128 v9;
  unint64_t *v10;
  unint64_t v11;
  const void *v13;
  __int128 v14;
  _QWORD aBlock[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  const void *v21;

  v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    pci::transport::th::readAsync();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3002000000;
  v19 = __Block_byref_object_copy__26;
  v20 = __Block_byref_object_dispose__27;
  v21 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke;
  aBlock[3] = &unk_24C81A050;
  aBlock[4] = &v16;
  aBlock[5] = this;
  v4 = _Block_copy(aBlock);
  v5 = (const void *)v17[5];
  v17[5] = (uint64_t)v4;
  if (v5)
    _Block_release(v5);
  os_unfair_lock_lock(*this);
  v6 = *((_DWORD *)this + 20);
  v7 = (const void *)v17[5];
  if (v7)
    v8 = _Block_copy(v7);
  else
    v8 = 0;
  v13 = v8;
  pci::transport::th::readInternal((uint64_t)this, 0, v6, 0, &v13, &v14);
  if (v8)
    _Block_release(v8);
  os_unfair_lock_unlock(*this);
  v9 = v14;
  if (*((_QWORD *)&v14 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v9 + 1) + 16))(*((_QWORD *)&v9 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v9 + 1));
    }
  }
  _Block_object_dispose(&v16, 8);
  if (v21)
    _Block_release(v21);
  return (_QWORD)v9 != 0;
}

void sub_20DB1F404(_Unwind_Exception *a1)
{
  const void *v1;
  uint64_t v2;
  const void *v4;

  if (v1)
    _Block_release(v1);
  _Block_object_dispose((const void *)(v2 - 80), 8);
  v4 = *(const void **)(v2 - 40);
  if (v4)
    _Block_release(v4);
  _Unwind_Resume(a1);
}

double pci::transport::th::initParams(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 80) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 80) = 21;
  return result;
}

BOOL pci::transport::th::validateParams(uint64_t a1)
{
  pci::log *v2;
  NSObject *v3;
  _BOOL8 result;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  pci::log *v9;
  NSObject *v10;
  pci::log *v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    v10 = pci::log::get(v9);
    result = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v6 = "no params";
    goto LABEL_11;
  }
  if (*(int *)a1 >= 34)
  {
    v2 = (pci::log *)_TelephonyUtilDebugPrintError();
    v3 = pci::log::get(v2);
    result = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v5 = *(_DWORD *)a1;
    *(_DWORD *)buf = 67109120;
    v13 = v5;
    v6 = "invalid interface number %d";
    v7 = v3;
    v8 = 8;
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 16))
    return 1;
  v11 = (pci::log *)_TelephonyUtilDebugPrintError();
  v10 = pci::log::get(v11);
  result = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (result)
  {
    *(_WORD *)buf = 0;
    v6 = "status block is required";
LABEL_11:
    v7 = v10;
    v8 = 2;
LABEL_12:
    _os_log_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
    return 0;
  }
  return result;
}

void ___ZN3pci9transport2th6notifyEv_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  const void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  void *aBlock;
  int v13;

  if (!a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(const void **)(v6 + 56);
    if (v7)
      v8 = _Block_copy(v7);
    else
      v8 = 0;
    v9 = *(NSObject **)(v6 + 48);
    if (v9)
      dispatch_retain(v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1174405120;
    v11[2] = ___ZN3pci9transport2th6notifyEv_block_invoke_2;
    v11[3] = &__block_descriptor_tmp_14;
    if (v8)
      v10 = _Block_copy(v8);
    else
      v10 = 0;
    aBlock = v10;
    v13 = a5;
    dispatch_async(v9, v11);
    if (aBlock)
      _Block_release(aBlock);
    if (v9)
      dispatch_release(v9);
    if (v8)
      _Block_release(v8);
  }
}

uint64_t ___ZN3pci9transport2th6notifyEv_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0);
}

void *__copy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFv18PCITransportStatusPvS2_EEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFv18PCITransportStatusPvS2_EEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

BOOL pci::transport::th::write(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4, unsigned int a5)
{
  pci::log *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  pci::transport::task *v15;
  uint64_t *v16;
  dispatch_time_t v17;
  _BOOL8 v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v22;
  const void *v23;
  _QWORD aBlock[9];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  dispatch_object_t object;
  pci::transport::task *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE buf[22];
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const unsigned __int8 *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  unsigned int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2000000000;
  v37 = 1;
  v32 = 0;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3002000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  object = dispatch_semaphore_create(0);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v22 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v39 = 1024;
    v40 = v22;
    v41 = 2080;
    v42 = "write";
    v43 = 2048;
    v44 = a2;
    v45 = 1024;
    v46 = a3;
    v47 = 2048;
    v48 = a4;
    v49 = 1024;
    v50 = a5;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, dDtor %p, timeout %u", buf, 0x46u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke;
  aBlock[3] = &unk_24C819F80;
  aBlock[6] = this;
  aBlock[7] = a2;
  aBlock[8] = a4;
  v25 = a3;
  aBlock[4] = &v34;
  aBlock[5] = &v26;
  v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v12)
    v13 = _Block_copy(v12);
  else
    v13 = 0;
  v23 = v13;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v23, (__int128 *)buf);
  v15 = *(pci::transport::task **)buf;
  v14 = *(std::__shared_weak_count **)&buf[8];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v32 = v15;
  v33 = v14;
  if (v13)
    _Block_release(v13);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  if (v15)
  {
    v16 = v27;
    if (a5 == -1)
      v17 = -1;
    else
      v17 = dispatch_time(0, 1000000 * a5);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v16[5], v17))
    {
      os_unfair_lock_lock(*(os_unfair_lock_t *)this);
      pci::transport::task::poison(v15, -536870186);
      os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
      dispatch_semaphore_wait((dispatch_semaphore_t)v27[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    v18 = *((_BYTE *)v35 + 24) != 0;
    if (v12)
      goto LABEL_17;
  }
  else
  {
    v18 = 0;
    if (v12)
LABEL_17:
      _Block_release(v12);
  }
  _Block_object_dispose(&v26, 8);
  if (object)
    dispatch_release(object);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  _Block_object_dispose(&v34, 8);
  return v18;
}

void sub_20DB1FA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,dispatch_object_t object,char a35)
{
  const void *v35;
  uint64_t v36;

  if (v35)
    _Block_release(v35);
  _Block_object_dispose(&a29, 8);
  if (object)
    dispatch_release(object);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a35);
  _Block_object_dispose((const void *)(v36 - 192), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

intptr_t ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 48);
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)buf = 136316674;
    v21 = "th";
    v22 = 2048;
    v23 = v8;
    v24 = 1024;
    v25 = v19;
    v26 = 2080;
    v27 = "write_block_invoke";
    v28 = 1024;
    v29 = a2;
    v30 = 2048;
    v31 = a3;
    v32 = 1024;
    v33 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a2)
    v12 = 1;
  else
    v12 = *(_BYTE *)(v11 + 24) == 0;
  v13 = !v12;
  *(_BYTE *)(v11 + 24) = v13;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(_BYTE *)(v14 + 24);
  if (v15)
  {
    if (*(_QWORD *)(a1 + 56) == a3 && !*(_QWORD *)(a1 + 64))
    {
      v15 = 1;
    }
    else if (a3)
    {
      v15 = 0;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 64) != 0;
    }
  }
  *(_BYTE *)(v14 + 24) = v15;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(_BYTE *)(v16 + 24);
  if (v17)
  {
    if (*(_DWORD *)(a1 + 72) == a4 && !*(_QWORD *)(a1 + 64))
    {
      v17 = 1;
    }
    else if (a4)
    {
      v17 = 0;
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 64) != 0;
    }
  }
  *(_BYTE *)(v16 + 24) = v17;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

BOOL pci::transport::th::read(pci::transport::th *this, const unsigned __int8 *a2, unsigned int *a3, NSObject *a4, unsigned int a5)
{
  pci::log *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  std::__shared_weak_count *v15;
  pci::transport::task *v16;
  uint64_t *v17;
  dispatch_time_t v18;
  _BOOL8 v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  int v23;
  int v24;
  const void *v25;
  _QWORD aBlock[9];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  dispatch_object_t object;
  pci::transport::task *v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE buf[22];
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const unsigned __int8 *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  unsigned int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 1;
  v33 = 0;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3002000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  object = dispatch_semaphore_create(0);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v23 = *((_DWORD *)this + 10);
    v24 = *a3;
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v40 = 1024;
    v41 = v23;
    v42 = 2080;
    v43 = "read";
    v44 = 2048;
    v45 = a2;
    v46 = 1024;
    v47 = v24;
    v48 = 2048;
    v49 = a4;
    v50 = 1024;
    v51 = a5;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, dDtor %p, timeout %u", buf, 0x46u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_24C819FF8;
  aBlock[6] = this;
  aBlock[7] = a2;
  aBlock[8] = a3;
  aBlock[4] = &v35;
  aBlock[5] = &v27;
  v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  v13 = *a3;
  if (v12)
    v14 = _Block_copy(v12);
  else
    v14 = 0;
  v25 = v14;
  pci::transport::th::readInternal((uint64_t)this, (uint64_t)a2, v13, a4, &v25, (__int128 *)buf);
  v16 = *(pci::transport::task **)buf;
  v15 = *(std::__shared_weak_count **)&buf[8];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v33 = v16;
  v34 = v15;
  if (v14)
    _Block_release(v14);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  if (v16)
  {
    v17 = v28;
    if (a5 == -1)
      v18 = -1;
    else
      v18 = dispatch_time(0, 1000000 * a5);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v17[5], v18))
    {
      os_unfair_lock_lock(*(os_unfair_lock_t *)this);
      pci::transport::task::poison(v16, -536870186);
      os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
      dispatch_semaphore_wait((dispatch_semaphore_t)v28[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    v19 = *((_BYTE *)v36 + 24) != 0;
    if (v12)
      goto LABEL_17;
  }
  else
  {
    v19 = 0;
    if (v12)
LABEL_17:
      _Block_release(v12);
  }
  _Block_object_dispose(&v27, 8);
  if (object)
    dispatch_release(object);
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  _Block_object_dispose(&v35, 8);
  return v19;
}

void sub_20DB20070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t object,char a33)
{
  const void *v33;
  uint64_t v34;

  if (v33)
    _Block_release(v33);
  _Block_object_dispose(&a27, 8);
  if (object)
    dispatch_release(object);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a33);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke(_QWORD *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  pci::log *v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  unsigned int *v20;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a1[6];
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)buf = 136316674;
    v24 = "th";
    v25 = 2048;
    v26 = v8;
    v27 = 1024;
    v28 = v22;
    v29 = 2080;
    v30 = "read_block_invoke";
    v31 = 1024;
    v32 = a2;
    v33 = 2048;
    v34 = a3;
    v35 = 1024;
    v36 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    if (!a3)
      goto LABEL_5;
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  v11 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    pci::transport::th::writeInternal();
LABEL_5:
  v13 = *(_QWORD *)(a1[4] + 8);
  if (a2)
    v14 = 1;
  else
    v14 = *(_BYTE *)(v13 + 24) == 0;
  v15 = !v14;
  *(_BYTE *)(v13 + 24) = v15;
  v16 = *(_QWORD *)(a1[4] + 8);
  v17 = *(_BYTE *)(v16 + 24);
  if (v17)
    v17 = a1[7] == a3;
  *(_BYTE *)(v16 + 24) = v17;
  v18 = *(_QWORD *)(a1[4] + 8);
  v19 = *(_BYTE *)(v18 + 24);
  v20 = (unsigned int *)a1[8];
  if (v19)
    v19 = *v20 >= a4;
  *(_BYTE *)(v18 + 24) = v19;
  *v20 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

BOOL pci::transport::th::sendImage(pci::transport::th *this, const unsigned __int8 *a2, int a3, unsigned int *a4, NSObject *a5, unsigned int a6)
{
  pci::log *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  std::__shared_weak_count *v16;
  pci::transport::task *v17;
  uint64_t *v18;
  dispatch_time_t v19;
  _BOOL8 v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  int v24;
  int v25;
  const void *v26;
  _QWORD aBlock[10];
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  dispatch_object_t object;
  pci::transport::task *v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE buf[22];
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const unsigned __int8 *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  NSObject *v53;
  __int16 v54;
  unsigned int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = 1;
  v35 = 0;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3002000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  object = dispatch_semaphore_create(0);
  v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = *((_DWORD *)this + 10);
    v25 = *a4;
    *(_DWORD *)buf = 136317186;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v42 = 1024;
    v43 = v24;
    v44 = 2080;
    v45 = "sendImage";
    v46 = 2048;
    v47 = a2;
    v48 = 1024;
    v49 = a3;
    v50 = 1024;
    v51 = v25;
    v52 = 2048;
    v53 = a5;
    v54 = 1024;
    v55 = a6;
    _os_log_debug_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, cookie %u, dDtor %p, timeout %u", buf, 0x4Cu);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_24C81A078;
  aBlock[6] = this;
  aBlock[7] = a2;
  v28 = a3;
  aBlock[8] = a5;
  aBlock[9] = a4;
  aBlock[4] = &v37;
  aBlock[5] = &v29;
  v14 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v14)
    v15 = _Block_copy(v14);
  else
    v15 = 0;
  v26 = v15;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, a5, &v26, (__int128 *)buf);
  v17 = *(pci::transport::task **)buf;
  v16 = *(std::__shared_weak_count **)&buf[8];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v35 = v17;
  v36 = v16;
  if (v15)
    _Block_release(v15);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  if (v17)
  {
    v18 = v30;
    if (a6 == -1)
      v19 = -1;
    else
      v19 = dispatch_time(0, 1000000 * a6);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v18[5], v19))
    {
      os_unfair_lock_lock(*(os_unfair_lock_t *)this);
      pci::transport::task::poison(v17, -536870186);
      os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
      dispatch_semaphore_wait((dispatch_semaphore_t)v30[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    v20 = *((_BYTE *)v38 + 24) != 0;
    if (v14)
      goto LABEL_17;
  }
  else
  {
    v20 = 0;
    if (v14)
LABEL_17:
      _Block_release(v14);
  }
  _Block_object_dispose(&v29, 8);
  if (object)
    dispatch_release(object);
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  _Block_object_dispose(&v37, 8);
  return v20;
}

void sub_20DB20688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,dispatch_object_t object,char a37)
{
  const void *v37;
  uint64_t v38;

  if (v37)
    _Block_release(v37);
  _Block_object_dispose(&a31, 8);
  if (object)
    dispatch_release(object);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a37);
  _Block_object_dispose((const void *)(v38 - 208), 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10;
  pci::log *v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_DWORD *)(v10 + 40);
    *(_DWORD *)buf = 136316930;
    v23 = "th";
    v24 = 2048;
    v25 = v10;
    v26 = 1024;
    v27 = v21;
    v28 = 2080;
    v29 = "sendImage_block_invoke";
    v30 = 1024;
    v31 = a2;
    v32 = 2048;
    v33 = a3;
    v34 = 1024;
    v35 = a4;
    v36 = 1024;
    v37 = a5;
    _os_log_debug_impl(&dword_20DB0C000, v12, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u, code %u", buf, 0x42u);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a2)
    v14 = 1;
  else
    v14 = *(_BYTE *)(v13 + 24) == 0;
  v15 = !v14;
  *(_BYTE *)(v13 + 24) = v15;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(_BYTE *)(v16 + 24);
  if (v17)
  {
    if (*(_QWORD *)(a1 + 56) == a3 && !*(_QWORD *)(a1 + 64))
    {
      v17 = 1;
    }
    else if (a3)
    {
      v17 = 0;
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 64) != 0;
    }
  }
  *(_BYTE *)(v16 + 24) = v17;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v19 = *(_BYTE *)(v18 + 24);
  if (v19)
  {
    if (*(_DWORD *)(a1 + 80) == a4 && !*(_QWORD *)(a1 + 64))
    {
      v19 = 1;
    }
    else if (a4)
    {
      v19 = 0;
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 64) != 0;
    }
  }
  *(_BYTE *)(v18 + 24) = v19;
  **(_DWORD **)(a1 + 72) = a5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void pci::transport::th::sendImageInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, NSObject *a4@<X3>, const void **a5@<X4>, __int128 *a6@<X8>)
{
  pci::log *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  pci::log *v25;
  NSObject *v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  __int128 v35;
  __int128 v36;
  _BYTE buf[22];
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  uint8_t v42[4];
  _BYTE v43[20];
  int v44;
  __int16 v45;
  _BYTE v46[18];
  dispatch_object_t object[2];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v36 = 0uLL;
  v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v42 = 136316674;
    *(_QWORD *)v43 = "th";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = a1;
    *(_WORD *)&v43[18] = 1024;
    v44 = v34;
    v45 = 2080;
    *(_QWORD *)v46 = "sendImageInternal";
    *(_WORD *)&v46[8] = 2048;
    *(_QWORD *)&v46[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v42, 0x40u);
  }
  *(_OWORD *)&v46[2] = 0u;
  *(_OWORD *)object = 0u;
  if (*a5)
    v14 = _Block_copy(*a5);
  else
    v14 = 0;
  *(_DWORD *)v42 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v43 = 3;
  *(_QWORD *)&v43[4] = a4;
  *(_QWORD *)&v43[12] = a2;
  v44 = a3;
  if (v14)
    v15 = _Block_copy(v14);
  else
    v15 = 0;
  v16 = *(const void **)&v46[2];
  *(_QWORD *)&v46[2] = v15;
  if (v16)
    _Block_release(v16);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v46[10], (uint64_t *)a1);
  v17 = *(NSObject **)(a1 + 16);
  if (v17)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v18 = object[1];
  object[1] = v17;
  if (v18)
    dispatch_release(v18);
  if (v14)
    _Block_release(v14);
  pci::transport::task::create((const pci::transport::task::parameters *)v42, a1 + 128, (uint64_t *)buf);
  v36 = *(_OWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v19 = *(_QWORD *)(a1 + 24);
    v35 = *(_OWORD *)buf;
    if (*(_QWORD *)&buf[8])
    {
      v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    pci::transport::bh::sendImage(v19, (uint64_t)&v35);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    *a6 = v36;
    a6 = &v36;
  }
  else
  {
    v25 = (pci::log *)_TelephonyUtilDebugPrintError();
    v26 = pci::log::get(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "th";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v38 = 1024;
      v39 = v27;
      v40 = 2080;
      v41 = "sendImageInternal";
      _os_log_impl(&dword_20DB0C000, v26, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task send image", buf, 0x26u);
    }
  }
  *(_QWORD *)a6 = 0;
  *((_QWORD *)a6 + 1) = 0;
  if (object[1])
    dispatch_release(object[1]);
  v28 = (std::__shared_weak_count *)object[0];
  if (object[0])
  {
    v29 = (unint64_t *)&object[0][1];
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (*(_QWORD *)&v46[2])
    _Block_release(*(const void **)&v46[2]);
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  if (*((_QWORD *)&v36 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
}

void sub_20DB20CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a27);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

BOOL pci::transport::th::sendImageAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4)
{
  pci::log *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  int v17;
  const void *v18;
  _QWORD aBlock[5];
  _BYTE buf[22];
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const unsigned __int8 *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v21 = 1024;
    v22 = v17;
    v23 = 2080;
    v24 = "sendImageAsync";
    v25 = 2048;
    v26 = a2;
    v27 = 1024;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", buf, 0x40u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_37;
  aBlock[4] = this;
  v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v10)
    v11 = _Block_copy(v10);
  else
    v11 = 0;
  v18 = v11;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v18, (__int128 *)buf);
  if (v11)
    _Block_release(v11);
  v12 = *(_QWORD *)buf;
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
      if (!v10)
        return v12 != 0;
      goto LABEL_13;
    }
  }
  if (v10)
LABEL_13:
    _Block_release(v10);
  return v12 != 0;
}

void sub_20DB20F38(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v9;
  pci::log *v10;
  NSObject *v11;
  const void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  _QWORD block[4];
  void *aBlock;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 32);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_DWORD *)(v9 + 40);
    *(_DWORD *)buf = 136316930;
    v24 = "th";
    v25 = 2048;
    v26 = v9;
    v27 = 1024;
    v28 = v16;
    v29 = 2080;
    v30 = "sendImageAsync_block_invoke";
    v31 = 1024;
    v32 = a2;
    v33 = 2048;
    v34 = a3;
    v35 = 1024;
    v36 = a4;
    v37 = 1024;
    v38 = a5;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u, code %u", buf, 0x42u);
  }
  v12 = *(const void **)(v9 + 104);
  if (v12)
    v13 = _Block_copy(v12);
  else
    v13 = 0;
  v14 = *(NSObject **)(v9 + 48);
  if (v14)
    dispatch_retain(v14);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_35;
  block[3] = &__block_descriptor_tmp_36;
  if (v13)
    v15 = _Block_copy(v13);
  else
    v15 = 0;
  aBlock = v15;
  v19 = a3;
  v20 = a2;
  v21 = a4;
  v22 = a5;
  dispatch_async(v14, block);
  if (aBlock)
    _Block_release(aBlock);
  if (v14)
    dispatch_release(v14);
  if (v13)
    _Block_release(v13);
}

void sub_20DB21174(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
}

void *__copy_helper_block_e8_32c47_ZTSN8dispatch5blockIU13block_pointerFviPvjjEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c47_ZTSN8dispatch5blockIU13block_pointerFviPvjjEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

BOOL pci::transport::th::readRegister(pci::transport::th *this, uint64_t a2, const unsigned __int8 *a3, unsigned int *a4, unsigned int a5)
{
  pci::log *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  std::__shared_weak_count *v15;
  pci::transport::task *v16;
  uint64_t *v17;
  dispatch_time_t v18;
  _BOOL8 v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  int v23;
  int v24;
  const void *v25;
  _QWORD aBlock[9];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  dispatch_object_t object;
  pci::transport::task *v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE buf[22];
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const unsigned __int8 *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  unsigned int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 1;
  v33 = 0;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3002000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  object = dispatch_semaphore_create(0);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v23 = *((_DWORD *)this + 10);
    v24 = *a4;
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = this;
    v40 = 1024;
    v41 = v23;
    v42 = 2080;
    v43 = "readRegister";
    v44 = 1024;
    v45 = a2;
    v46 = 2048;
    v47 = a3;
    v48 = 1024;
    v49 = v24;
    v50 = 1024;
    v51 = a5;
    _os_log_debug_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: reg %u, buffer %p, length %u, timeout %u", buf, 0x42u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke;
  aBlock[3] = &unk_24C81A0F0;
  aBlock[6] = this;
  aBlock[7] = a3;
  aBlock[8] = a4;
  aBlock[4] = &v35;
  aBlock[5] = &v27;
  v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  v13 = *a4;
  if (v12)
    v14 = _Block_copy(v12);
  else
    v14 = 0;
  v25 = v14;
  pci::transport::th::readRegisterInternal((uint64_t)this, a2, (uint64_t)a3, v13, &v25, (__int128 *)buf);
  v16 = *(pci::transport::task **)buf;
  v15 = *(std::__shared_weak_count **)&buf[8];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v33 = v16;
  v34 = v15;
  if (v14)
    _Block_release(v14);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  if (v16)
  {
    v17 = v28;
    if (a5 == -1)
      v18 = -1;
    else
      v18 = dispatch_time(0, 1000000 * a5);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v17[5], v18))
    {
      os_unfair_lock_lock(*(os_unfair_lock_t *)this);
      pci::transport::task::poison(v16, -536870186);
      os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
      dispatch_semaphore_wait((dispatch_semaphore_t)v28[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    v19 = *((_BYTE *)v36 + 24) != 0;
    if (v12)
      goto LABEL_17;
  }
  else
  {
    v19 = 0;
    if (v12)
LABEL_17:
      _Block_release(v12);
  }
  _Block_object_dispose(&v27, 8);
  if (object)
    dispatch_release(object);
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  _Block_object_dispose(&v35, 8);
  return v19;
}

void sub_20DB21548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t object,char a33)
{
  const void *v33;
  uint64_t v34;

  if (v33)
    _Block_release(v33);
  _Block_object_dispose(&a27, 8);
  if (object)
    dispatch_release(object);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a33);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke(_QWORD *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  unsigned int *v18;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a1[6];
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)buf = 136316674;
    v22 = "th";
    v23 = 2048;
    v24 = v8;
    v25 = 1024;
    v26 = v20;
    v27 = 2080;
    v28 = "readRegister_block_invoke";
    v29 = 1024;
    v30 = a2;
    v31 = 2048;
    v32 = a3;
    v33 = 1024;
    v34 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  v11 = *(_QWORD *)(a1[4] + 8);
  if (a2)
    v12 = 1;
  else
    v12 = *(_BYTE *)(v11 + 24) == 0;
  v13 = !v12;
  *(_BYTE *)(v11 + 24) = v13;
  v14 = *(_QWORD *)(a1[4] + 8);
  v15 = *(_BYTE *)(v14 + 24);
  if (v15)
    v15 = a1[7] == a3;
  *(_BYTE *)(v14 + 24) = v15;
  v16 = *(_QWORD *)(a1[4] + 8);
  v17 = *(_BYTE *)(v16 + 24);
  v18 = (unsigned int *)a1[8];
  if (v17)
    v17 = *v18 >= a4;
  *(_BYTE *)(v16 + 24) = v17;
  *v18 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

void pci::transport::th::readRegisterInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, const void **a5@<X4>, __int128 *a6@<X8>)
{
  pci::log *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  pci::log *v25;
  NSObject *v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  __int128 v35;
  __int128 v36;
  _BYTE buf[22];
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  uint8_t v42[4];
  _BYTE v43[20];
  int v44;
  __int16 v45;
  _WORD v46[25];

  *(_QWORD *)&v46[21] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v36 = 0uLL;
  v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v42 = 136316674;
    *(_QWORD *)v43 = "th";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = a1;
    *(_WORD *)&v43[18] = 1024;
    v44 = v34;
    v45 = 2080;
    *(_QWORD *)v46 = "readRegisterInternal";
    v46[4] = 1024;
    *(_DWORD *)&v46[5] = a2;
    v46[7] = 2048;
    *(_QWORD *)&v46[8] = a3;
    v46[12] = 1024;
    *(_DWORD *)&v46[13] = a4;
    _os_log_debug_impl(&dword_20DB0C000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: reg %u, buffer %p, size %u", v42, 0x3Cu);
  }
  memset(&v46[1], 0, 32);
  if (*a5)
    v14 = _Block_copy(*a5);
  else
    v14 = 0;
  *(_DWORD *)v42 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v43 = 2;
  *(_QWORD *)&v43[4] = 0;
  *(_QWORD *)&v43[12] = a3;
  v44 = a4;
  if (v14)
    v15 = _Block_copy(v14);
  else
    v15 = 0;
  v16 = *(const void **)&v46[1];
  *(_QWORD *)&v46[1] = v15;
  if (v16)
    _Block_release(v16);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v46[5], (uint64_t *)a1);
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v18 = *(NSObject **)&v46[13];
  *(_QWORD *)&v46[13] = v17;
  if (v18)
    dispatch_release(v18);
  if (v14)
    _Block_release(v14);
  pci::transport::task::create((const pci::transport::task::parameters *)v42, a1 + 128, (uint64_t *)buf);
  v36 = *(_OWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v19 = *(_QWORD *)(a1 + 24);
    v35 = *(_OWORD *)buf;
    if (*(_QWORD *)&buf[8])
    {
      v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    pci::transport::bh::readRegister(v19, (uint64_t)&v35, a2);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    *a6 = v36;
    a6 = &v36;
  }
  else
  {
    v25 = (pci::log *)_TelephonyUtilDebugPrintError();
    v26 = pci::log::get(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "th";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      v38 = 1024;
      v39 = v27;
      v40 = 2080;
      v41 = "readRegisterInternal";
      _os_log_impl(&dword_20DB0C000, v26, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task read register", buf, 0x26u);
    }
  }
  *(_QWORD *)a6 = 0;
  *((_QWORD *)a6 + 1) = 0;
  if (*(_QWORD *)&v46[13])
    dispatch_release(*(dispatch_object_t *)&v46[13]);
  v28 = *(std::__shared_weak_count **)&v46[9];
  if (*(_QWORD *)&v46[9])
  {
    v29 = (unint64_t *)(*(_QWORD *)&v46[9] + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (*(_QWORD *)&v46[1])
    _Block_release(*(const void **)&v46[1]);
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  if (*((_QWORD *)&v36 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
}

void sub_20DB21B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a27);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

BOOL pci::transport::th::timesyncAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  pci::log *v8;
  NSObject *v9;
  void *v10;
  int TimesyncBufferLength;
  void *v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  pci::log *v24;
  NSObject *v25;
  int v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  int v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  _QWORD aBlock[6];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  uint8_t v48[4];
  _BYTE v49[20];
  int v50;
  __int16 v51;
  _WORD v52[25];

  *(_QWORD *)&v52[21] = *MEMORY[0x24BDAC8D0];
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v48 = 136316674;
    *(_QWORD *)v49 = "th";
    *(_WORD *)&v49[8] = 2048;
    *(_QWORD *)&v49[10] = a1;
    *(_WORD *)&v49[18] = 1024;
    v50 = v34;
    v51 = 2080;
    *(_QWORD *)v52 = "timesyncAsync";
    v52[4] = 1024;
    *(_DWORD *)&v52[5] = a2;
    v52[7] = 1024;
    *(_DWORD *)&v52[8] = a3;
    v52[10] = 2048;
    *(_QWORD *)&v52[11] = a4;
    _os_log_debug_impl(&dword_20DB0C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u, count %u, cb %p", v48, 0x3Cu);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke;
  aBlock[3] = &unk_24C81A140;
  aBlock[4] = a4;
  aBlock[5] = a1;
  v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v52[1], 0, 32);
  TimesyncBufferLength = pci::transport::bh::getTimesyncBufferLength(*(pci::transport::bh **)(a1 + 24), a3);
  if (v10)
    v12 = _Block_copy(v10);
  else
    v12 = 0;
  *(_DWORD *)v48 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v49 = 2;
  *(_QWORD *)&v49[4] = 0;
  *(_QWORD *)&v49[12] = 0;
  v50 = TimesyncBufferLength;
  if (v12)
    v13 = _Block_copy(v12);
  else
    v13 = 0;
  v14 = *(const void **)&v52[1];
  *(_QWORD *)&v52[1] = v13;
  if (v14)
    _Block_release(v14);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v52[5], (uint64_t *)a1);
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v16 = *(NSObject **)&v52[13];
  *(_QWORD *)&v52[13] = v15;
  if (v16)
    dispatch_release(v16);
  if (v12)
    _Block_release(v12);
  pci::transport::task::create((const pci::transport::task::parameters *)v48, a1 + 128, &v37);
  v17 = v37;
  if (v37)
  {
    v18 = *(_QWORD *)(a1 + 24);
    v35 = v37;
    v36 = v38;
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    pci::transport::bh::timesync(v18, (uint64_t)&v35, a2, a3);
    v21 = v36;
    if (v36)
    {
      v22 = (unint64_t *)&v36->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  else
  {
    v24 = (pci::log *)_TelephonyUtilDebugPrintError();
    v25 = pci::log::get(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v41 = "th";
      v42 = 2048;
      v43 = a1;
      v44 = 1024;
      v45 = v26;
      v46 = 2080;
      v47 = "timesyncAsync";
      _os_log_impl(&dword_20DB0C000, v25, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task time sync", buf, 0x26u);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  v27 = v38;
  if (v38)
  {
    v28 = (unint64_t *)&v38->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (*(_QWORD *)&v52[13])
    dispatch_release(*(dispatch_object_t *)&v52[13]);
  v30 = *(std::__shared_weak_count **)&v52[9];
  if (*(_QWORD *)&v52[9])
  {
    v31 = (unint64_t *)(*(_QWORD *)&v52[9] + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (*(_QWORD *)&v52[1])
    _Block_release(*(const void **)&v52[1]);
  if (v10)
    _Block_release(v10);
  return v17 != 0;
}

void sub_20DB21F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  const void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v12 - 160));
  if (v11)
    _Block_release(v11);
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke(uint64_t a1, int a2, char *a3, unsigned int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  _QWORD block[6];
  int v16;
  int v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)buf = 136316674;
    v19 = "th";
    v20 = 2048;
    v21 = v8;
    v22 = 1024;
    v23 = v14;
    v24 = 2080;
    v25 = "timesyncAsync_block_invoke";
    v26 = 1024;
    v27 = a2;
    v28 = 2048;
    v29 = a3;
    v30 = 1024;
    v31 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  v11 = 0;
  if (!a2 && a3)
    v11 = pci::transport::bh::marshalTimesyncResults(*(pci::transport::bh **)(v8 + 24), a3, a4);
  v12 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke_44;
  block[3] = &unk_24C81A118;
  v13 = *(_QWORD *)(a1 + 32);
  v16 = a2;
  v17 = v11;
  block[4] = v13;
  block[5] = a3;
  dispatch_async(v12, block);
}

void ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke_44(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 40));
  if (!*(_DWORD *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      free(v3);
  }
}

BOOL pci::transport::th::registerTimeEvent(uint64_t a1, uint64_t a2, NSObject *a3)
{
  pci::log *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  pci::log *v10;
  NSObject *v11;
  int v12;
  int v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _BYTE v26[24];
  __int128 v27;
  dispatch_object_t v28[3];

  v28[2] = *(dispatch_object_t *)MEMORY[0x24BDAC8D0];
  v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v26 = 136316418;
    *(_QWORD *)&v26[4] = "th";
    *(_WORD *)&v26[12] = 2048;
    *(_QWORD *)&v26[14] = a1;
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = v14;
    WORD2(v27) = 2080;
    *(_QWORD *)((char *)&v27 + 6) = "registerTimeEvent";
    HIWORD(v27) = 1024;
    LODWORD(v28[0]) = a2;
    WORD2(v28[0]) = 2048;
    *(dispatch_object_t *)((char *)v28 + 6) = a3;
    _os_log_debug_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u, cb %p", v26, 0x36u);
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  *(_QWORD *)v26 = 0;
  *(_QWORD *)&v26[8] = v26;
  *(_QWORD *)&v26[16] = 0x3002000000;
  *(_QWORD *)&v27 = __Block_byref_object_copy__49;
  *((_QWORD *)&v27 + 1) = __Block_byref_object_dispose__50;
  v8 = *(NSObject **)(a1 + 48);
  v28[0] = v8;
  if (v8)
    dispatch_retain(v8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 0x40000000;
  v15[2] = ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke;
  v15[3] = &unk_24C81A190;
  v15[4] = a3;
  v15[5] = v26;
  v9 = pci::transport::bh::registerTimeEvent(*(_QWORD *)(a1 + 24), a2, (uint64_t)v15);
  if (v9)
  {
    v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v17 = "th";
      v18 = 2048;
      v19 = a1;
      v20 = 1024;
      v21 = v12;
      v22 = 2080;
      v23 = "registerTimeEvent";
      v24 = 1024;
      v25 = v9;
      _os_log_impl(&dword_20DB0C000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to register time event 0x%08x", buf, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  _Block_object_dispose(v26, 8);
  if (v28[0])
    dispatch_release(v28[0]);
  return v9 == 0;
}

void sub_20DB22448(_Unwind_Exception *a1)
{
  uint64_t v1;
  NSObject *v3;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  v3 = *(NSObject **)(v1 - 88);
  if (v3)
    dispatch_release(v3);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

void ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  _QWORD v5[5];
  __int128 v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3802000000;
  v5[3] = __Block_byref_object_copy__51;
  v5[4] = __Block_byref_object_dispose__52;
  v6 = *a2;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke_53;
  block[3] = &unk_24C81A168;
  block[4] = v2;
  block[5] = v5;
  dispatch_async(v3, block);
  _Block_object_dispose(v5, 8);
}

__n128 __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

BOOL pci::transport::th::deregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  pci::log *v4;
  NSObject *v5;
  int v6;
  pci::log *v7;
  NSObject *v8;
  int v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316162;
    v13 = "th";
    v14 = 2048;
    v15 = a1;
    v16 = 1024;
    v17 = v11;
    v18 = 2080;
    v19 = "deregisterTimeEvent";
    v20 = 1024;
    v21 = a2;
    _os_log_debug_impl(&dword_20DB0C000, v5, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u", buf, 0x2Cu);
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  v6 = pci::transport::bh::deregisterTimeEvent(*(_QWORD *)(a1 + 24), a2);
  if (v6)
  {
    v7 = (pci::log *)_TelephonyUtilDebugPrintError();
    v8 = pci::log::get(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v13 = "th";
      v14 = 2048;
      v15 = a1;
      v16 = 1024;
      v17 = v9;
      v18 = 2080;
      v19 = "deregisterTimeEvent";
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_20DB0C000, v8, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to deregister time event 0x%08x", buf, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  return v6 == 0;
}

BOOL pci::transport::th::mapRegionAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  pci::log *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  pci::log *v29;
  NSObject *v30;
  int v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  int v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD aBlock[6];
  int v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  uint8_t v54[4];
  const char *v55;
  __int128 v56;
  __int16 v57;
  _BYTE v58[40];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v14 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v39 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v54 = 136316930;
    v55 = "th";
    LOWORD(v56) = 2048;
    *(_QWORD *)((char *)&v56 + 2) = a1;
    WORD5(v56) = 1024;
    HIDWORD(v56) = v39;
    v57 = 2080;
    *(_QWORD *)v58 = "mapRegionAsync";
    *(_WORD *)&v58[8] = 1024;
    *(_DWORD *)&v58[10] = a2;
    *(_WORD *)&v58[14] = 2048;
    *(_QWORD *)&v58[16] = a3;
    *(_WORD *)&v58[24] = 1024;
    *(_DWORD *)&v58[26] = a4;
    *(_WORD *)&v58[30] = 2048;
    *(_QWORD *)&v58[32] = a7;
    _os_log_debug_impl(&dword_20DB0C000, v15, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: region %u, buffer %p, length %u, cb %p", v54, 0x46u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke;
  aBlock[3] = &unk_24C81A1E0;
  v45 = a2;
  aBlock[4] = a7;
  aBlock[5] = a1;
  v16 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v58[2], 0, 32);
  if (v16)
    v17 = _Block_copy(v16);
  else
    v17 = 0;
  *(_DWORD *)v54 = *(_DWORD *)(a1 + 40);
  v55 = 0;
  v56 = 0uLL;
  if (v17)
    v18 = _Block_copy(v17);
  else
    v18 = 0;
  v19 = *(const void **)&v58[2];
  *(_QWORD *)&v58[2] = v18;
  if (v19)
    _Block_release(v19);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v58[10], (uint64_t *)a1);
  v20 = *(_QWORD *)(a1 + 16);
  if (v20)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v21 = *(NSObject **)&v58[26];
  *(_QWORD *)&v58[26] = v20;
  if (v21)
    dispatch_release(v21);
  if (v17)
    _Block_release(v17);
  pci::transport::task::create((const pci::transport::task::parameters *)v54, a1 + 128, &v42);
  v22 = v42;
  if (v42)
  {
    v23 = *(_QWORD *)(a1 + 24);
    v40 = v42;
    v41 = v43;
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
    }
    pci::transport::bh::mapRegion(v23, &v40, a2, a3, a4, a5, a6);
    v26 = v41;
    if (v41)
    {
      v27 = (unint64_t *)&v41->__shared_owners_;
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
  else
  {
    v29 = (pci::log *)_TelephonyUtilDebugPrintError();
    v30 = pci::log::get(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v47 = "th";
      v48 = 2048;
      v49 = a1;
      v50 = 1024;
      v51 = v31;
      v52 = 2080;
      v53 = "mapRegionAsync";
      _os_log_impl(&dword_20DB0C000, v30, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task map region", buf, 0x26u);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  v32 = v43;
  if (v43)
  {
    v33 = (unint64_t *)&v43->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (*(_QWORD *)&v58[26])
    dispatch_release(*(dispatch_object_t *)&v58[26]);
  v35 = *(std::__shared_weak_count **)&v58[18];
  if (*(_QWORD *)&v58[18])
  {
    v36 = (unint64_t *)(*(_QWORD *)&v58[18] + 8);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (*(_QWORD *)&v58[2])
    _Block_release(*(const void **)&v58[2]);
  if (v16)
    _Block_release(v16);
  return v22 != 0;
}

void sub_20DB22B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  const void *v12;
  uint64_t v13;
  va_list va;

  va_start(va, a12);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v13 - 176));
  if (v12)
    _Block_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8;
  pci::log *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  _QWORD block[5];
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_DWORD *)(v8 + 40);
    v14 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316930;
    v18 = "th";
    v19 = 2048;
    v20 = v8;
    v21 = 1024;
    v22 = v13;
    v23 = 2080;
    v24 = "mapRegionAsync_block_invoke";
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    v28 = v14;
    v29 = 2048;
    v30 = a3;
    v31 = 1024;
    v32 = a4;
    _os_log_debug_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, region %u, buff %p, size %u", buf, 0x42u);
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v12 = *(NSObject **)(v8 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke_62;
    block[3] = &unk_24C81A1B8;
    block[4] = v11;
    v16 = a2;
    dispatch_async(v12, block);
  }
}

uint64_t ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

BOOL pci::transport::th::unmapRegionAsync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pci::log *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  pci::log *v21;
  NSObject *v22;
  int v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  int v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  _QWORD aBlock[6];
  int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  uint8_t v46[4];
  const char *v47;
  __int128 v48;
  __int16 v49;
  _WORD v50[25];

  *(_QWORD *)&v50[21] = *MEMORY[0x24BDAC8D0];
  v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v31 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)v46 = 136316418;
    v47 = "th";
    LOWORD(v48) = 2048;
    *(_QWORD *)((char *)&v48 + 2) = a1;
    WORD5(v48) = 1024;
    HIDWORD(v48) = v31;
    v49 = 2080;
    *(_QWORD *)v50 = "unmapRegionAsync";
    v50[4] = 1024;
    *(_DWORD *)&v50[5] = a2;
    v50[7] = 2048;
    *(_QWORD *)&v50[8] = a3;
    _os_log_debug_impl(&dword_20DB0C000, v7, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: region %u, cb %p", v46, 0x36u);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke;
  aBlock[3] = &unk_24C81A230;
  v37 = a2;
  aBlock[4] = a3;
  aBlock[5] = a1;
  v8 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v50[1], 0, 32);
  if (v8)
    v9 = _Block_copy(v8);
  else
    v9 = 0;
  *(_DWORD *)v46 = *(_DWORD *)(a1 + 40);
  v47 = 0;
  v48 = 0uLL;
  if (v9)
    v10 = _Block_copy(v9);
  else
    v10 = 0;
  v11 = *(const void **)&v50[1];
  *(_QWORD *)&v50[1] = v10;
  if (v11)
    _Block_release(v11);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v50[5], (uint64_t *)a1);
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v13 = *(NSObject **)&v50[13];
  *(_QWORD *)&v50[13] = v12;
  if (v13)
    dispatch_release(v13);
  if (v9)
    _Block_release(v9);
  pci::transport::task::create((const pci::transport::task::parameters *)v46, a1 + 128, &v34);
  v14 = v34;
  if (v34)
  {
    v15 = *(_QWORD *)(a1 + 24);
    v32 = v34;
    v33 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    pci::transport::bh::unmapRegion(v15, &v32, a2);
    v18 = v33;
    if (v33)
    {
      v19 = (unint64_t *)&v33->__shared_owners_;
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
  else
  {
    v21 = (pci::log *)_TelephonyUtilDebugPrintError();
    v22 = pci::log::get(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v39 = "th";
      v40 = 2048;
      v41 = a1;
      v42 = 1024;
      v43 = v23;
      v44 = 2080;
      v45 = "unmapRegionAsync";
      _os_log_impl(&dword_20DB0C000, v22, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task unmap region", buf, 0x26u);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  v24 = v35;
  if (v35)
  {
    v25 = (unint64_t *)&v35->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (*(_QWORD *)&v50[13])
    dispatch_release(*(dispatch_object_t *)&v50[13]);
  v27 = *(std::__shared_weak_count **)&v50[9];
  if (*(_QWORD *)&v50[9])
  {
    v28 = (unint64_t *)(*(_QWORD *)&v50[9] + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (*(_QWORD *)&v50[1])
    _Block_release(*(const void **)&v50[1]);
  if (v8)
    _Block_release(v8);
  return v14 != 0;
}

void sub_20DB23130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  const void *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a10);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v11 - 144));
  if (v10)
    _Block_release(v10);
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  pci::log *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  _QWORD block[5];
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_DWORD *)(v4 + 40);
    v10 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316418;
    v14 = "th";
    v15 = 2048;
    v16 = v4;
    v17 = 1024;
    v18 = v9;
    v19 = 2080;
    v20 = "unmapRegionAsync_block_invoke";
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    v24 = v10;
    _os_log_debug_impl(&dword_20DB0C000, v6, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, region %u", buf, 0x32u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = *(NSObject **)(v4 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke_68;
    block[3] = &unk_24C81A208;
    block[4] = v7;
    v12 = a2;
    dispatch_async(v8, block);
  }
}

uint64_t ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t pci::transport::th::unblockRead(os_unfair_lock_t *this)
{
  pci::log *v2;
  NSObject *v3;
  os_unfair_lock_t *v4;
  std::__shared_weak_count *v5;
  pci::transport::task *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = (pci::log *)_TelephonyUtilDebugPrint();
  v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    pci::transport::th::unblockRead();
  if (!*((_BYTE *)this + 74))
  {
    os_unfair_lock_lock(*this);
    v4 = (os_unfair_lock_t *)this[17];
    while (v4 != this + 16)
    {
      v6 = (pci::transport::task *)v4[2];
      v5 = (std::__shared_weak_count *)v4[3];
      v4 = (os_unfair_lock_t *)v4[1];
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
      }
      if (pci::transport::task::getType(v6) == 2)
        pci::transport::task::poison(v6, -536870165);
      if (v5)
      {
        v9 = (unint64_t *)&v5->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
    os_unfair_lock_unlock(*this);
  }
  return 1;
}

void sub_20DB23460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL pci::transport::th::flushRead(pci::transport::th *this)
{
  _DWORD *v2;
  pci::log *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __uint64_t v7;
  __uint64_t v8;
  void *v9;
  pci::transport::task *v10;
  uint64_t *v11;
  dispatch_time_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  const void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  pci::log *v28;
  NSObject *v29;
  int v30;
  __int128 v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  pci::log *v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  dispatch_time_t v48;
  unsigned int v49;
  int v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  pci::transport::task *v61;
  pci::transport::task *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  _QWORD v65[6];
  _BYTE v66[20];
  uint64_t v67;
  void *v68[2];
  dispatch_object_t object[2];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t v75;
  pci::transport::task *v76[2];
  pci::transport::task *v77;
  std::__shared_weak_count *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  const void *v83;
  _QWORD aBlock[7];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  dispatch_object_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  int v94;
  _BYTE buf[22];
  __int16 v96;
  int v97;
  __int16 v98;
  const char *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)((char *)this + 40);
  v3 = (pci::log *)_TelephonyUtilDebugPrint();
  v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    pci::transport::th::flushRead();
  v91 = 0;
  v92 = &v91;
  v93 = 0x2000000000;
  v94 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3002000000;
  v88 = __Block_byref_object_copy__1;
  v89 = __Block_byref_object_dispose__1;
  v90 = dispatch_semaphore_create(0);
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9flushReadEv_block_invoke;
  aBlock[3] = &unk_24C81A258;
  aBlock[5] = &v85;
  aBlock[6] = this;
  aBlock[4] = &v91;
  v6 = _Block_copy(aBlock);
  v7 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v8 = 0;
  while (!*((_DWORD *)v92 + 6) && v8 <= 0xBB7)
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)this);
    if (v6)
      v9 = _Block_copy(v6);
    else
      v9 = 0;
    v83 = v9;
    pci::transport::th::readInternal((uint64_t)this, 0, 0x2000, 0, &v83, (__int128 *)v66);
    if (v9)
      _Block_release(v9);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
    v10 = *(pci::transport::task **)v66;
    if (*(_QWORD *)v66)
    {
      v11 = v86;
      v12 = dispatch_time(0, 50000000);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)v11[5], v12))
      {
        os_unfair_lock_lock(*(os_unfair_lock_t *)this);
        pci::transport::task::poison(v10, -536870165);
        os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
        dispatch_semaphore_wait((dispatch_semaphore_t)v86[5], 0xFFFFFFFFFFFFFFFFLL);
      }
      v8 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v7) / 0xF4240;
    }
    v13 = *(std::__shared_weak_count **)&v66[8];
    if (!*(_QWORD *)&v66[8])
      goto LABEL_19;
    v14 = (unint64_t *)(*(_QWORD *)&v66[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
      if (!v10)
        break;
    }
    else
    {
LABEL_19:
      if (!v10)
        break;
    }
  }
  v79 = 0;
  v80 = &v79;
  v81 = 0x2000000000;
  v82 = 1;
  v77 = 0;
  v78 = 0;
  v76[0] = 0;
  v76[1] = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__73;
  v74 = __Block_byref_object_dispose__74;
  v75 = dispatch_group_create();
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  *(_OWORD *)v68 = 0u;
  *(_OWORD *)object = 0u;
  v65[0] = v5;
  v65[1] = 0x40000000;
  v65[2] = ___ZN3pci9transport2th9flushReadEv_block_invoke_75;
  v65[3] = &unk_24C81A280;
  v65[4] = &v79;
  v65[5] = &v70;
  v16 = _Block_copy(v65);
  v17 = v16;
  *(_DWORD *)v66 = *v2;
  *(_OWORD *)&v66[4] = 0uLL;
  v67 = 0;
  if (v16)
    v18 = _Block_copy(v16);
  else
    v18 = 0;
  v19 = v68[0];
  v68[0] = v18;
  if (v19)
    _Block_release(v19);
  std::shared_ptr<pci::transport::th>::operator=[abi:ne180100](&v68[1], (uint64_t *)this);
  v20 = *((_QWORD *)this + 2);
  if (v20)
    dispatch_retain(*((dispatch_object_t *)this + 2));
  v21 = object[1];
  object[1] = v20;
  if (v21)
    dispatch_release(v21);
  if (v17)
    _Block_release(v17);
  if (*((_BYTE *)v80 + 24))
  {
    dispatch_group_enter((dispatch_group_t)v71[5]);
    pci::transport::task::create((const pci::transport::task::parameters *)v66, (uint64_t)this + 128, (uint64_t *)buf);
    v77 = *(pci::transport::task **)buf;
    v78 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)buf)
    {
      v22 = *((_QWORD *)this + 3);
      v63 = *(_QWORD *)buf;
      v64 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      pci::transport::bh::close(v22, &v63, 1);
      v25 = v64;
      if (v64)
      {
        p_shared_owners = (unint64_t *)&v64->__shared_owners_;
        do
          v27 = __ldaxr(p_shared_owners);
        while (__stlxr(v27 - 1, p_shared_owners));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
    }
    else
    {
      v28 = (pci::log *)_TelephonyUtilDebugPrintError();
      v29 = pci::log::get(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = *((_DWORD *)this + 10);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "th";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = this;
        v96 = 1024;
        v97 = v30;
        v98 = 2080;
        v99 = "flushRead";
        _os_log_impl(&dword_20DB0C000, v29, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task close in", buf, 0x26u);
      }
      *((_BYTE *)v80 + 24) = 0;
      dispatch_group_leave((dispatch_group_t)v71[5]);
    }
  }
  if (*((_BYTE *)v80 + 24))
  {
    dispatch_group_enter((dispatch_group_t)v71[5]);
    pci::transport::task::create((const pci::transport::task::parameters *)v66, (uint64_t)this + 128, (uint64_t *)buf);
    v31 = *(_OWORD *)buf;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v32 = (std::__shared_weak_count *)v76[1];
    *(_OWORD *)v76 = v31;
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
    v35 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v36 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    if (v76[0])
    {
      v38 = *((_QWORD *)this + 3);
      v61 = v76[0];
      v62 = v76[1];
      if (v76[1])
      {
        v39 = (unint64_t *)((char *)v76[1] + 8);
        do
          v40 = __ldxr(v39);
        while (__stxr(v40 + 1, v39));
      }
      pci::transport::bh::open(v38, (uint64_t *)&v61, 1);
      v41 = (std::__shared_weak_count *)v62;
      if (v62)
      {
        v42 = (unint64_t *)((char *)v62 + 8);
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        if (!v43)
        {
          ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
          std::__shared_weak_count::__release_weak(v41);
        }
      }
    }
    else
    {
      v44 = (pci::log *)_TelephonyUtilDebugPrintError();
      v45 = pci::log::get(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = *((_DWORD *)this + 10);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "th";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = this;
        v96 = 1024;
        v97 = v46;
        v98 = 2080;
        v99 = "flushRead";
        _os_log_impl(&dword_20DB0C000, v45, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to create task open in", buf, 0x26u);
      }
      *((_BYTE *)v80 + 24) = 0;
      dispatch_group_leave((dispatch_group_t)v71[5]);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  v47 = v71[5];
  v48 = dispatch_time(0, 2000000000);
  if (dispatch_group_wait(v47, v48))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)this);
    if (v77)
      pci::transport::task::poison(v77, -536870186);
    if (v76[0])
      pci::transport::task::poison(v76[0], -536870186);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
    dispatch_group_wait((dispatch_group_t)v71[5], 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((_BYTE *)v80 + 24))
  {
    if (*((_BYTE *)this + 74) && *((_DWORD *)this + 19))
    {
      v49 = 0;
      do
      {
        pci::transport::th::readAsync((os_unfair_lock_t *)this);
        ++v49;
      }
      while (v49 < *((_DWORD *)this + 19));
      v50 = *((unsigned __int8 *)v80 + 24);
    }
    else
    {
      v50 = 1;
    }
  }
  else
  {
    v50 = 0;
  }
  if (object[1])
    dispatch_release(object[1]);
  v51 = (std::__shared_weak_count *)object[0];
  if (object[0])
  {
    v52 = (unint64_t *)&object[0][1];
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (v68[0])
    _Block_release(v68[0]);
  _Block_object_dispose(&v70, 8);
  if (v75)
    dispatch_release(v75);
  v54 = (std::__shared_weak_count *)v76[1];
  if (v76[1])
  {
    v55 = (unint64_t *)((char *)v76[1] + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  v57 = v78;
  if (v78)
  {
    v58 = (unint64_t *)&v78->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  _Block_object_dispose(&v79, 8);
  if (v6)
    _Block_release(v6);
  _Block_object_dispose(&v85, 8);
  if (v90)
    dispatch_release(v90);
  _Block_object_dispose(&v91, 8);
  return v50 != 0;
}

void sub_20DB23D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,dispatch_object_t object,char a37,uint64_t a38,char a39,uint64_t a40,char a41)
{
  const void *v41;
  uint64_t v42;

  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a23);
  _Block_object_dispose(&a31, 8);
  if (object)
    dispatch_release(object);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a37);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)&a39);
  _Block_object_dispose(&a41, 8);
  if (v41)
    _Block_release(v41);
  pci::transport::th::flushRead((const void *)(v42 - 256), (dispatch_object_t *)(v42 - 216));
  _Block_object_dispose((const void *)(v42 - 208), 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th9flushReadEv_block_invoke(_QWORD *a1, int a2, void *a3, int a4)
{
  uint64_t v5;
  pci::log *v9;
  NSObject *v10;
  int v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a1[6];
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if (a2 != -536870165)
  {
    if (!a2)
      goto LABEL_6;
    v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    v10 = pci::log::get(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_DWORD *)(v5 + 40);
      *(_DWORD *)buf = 136316674;
      v14 = "th";
      v15 = 2048;
      v16 = v5;
      v17 = 1024;
      v18 = v11;
      v19 = 2080;
      v20 = "flushRead_block_invoke";
      v21 = 1024;
      v22 = a2;
      v23 = 2048;
      v24 = a3;
      v25 = 1024;
      v26 = a4;
      _os_log_impl(&dword_20DB0C000, v10, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    }
    if (!a2)
LABEL_6:
      free(a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

void __Block_byref_object_copy__73(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __Block_byref_object_dispose__74(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

void ___ZN3pci9transport2th9flushReadEv_block_invoke_75(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  char v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a2)
    v3 = 1;
  else
    v3 = *(_BYTE *)(v2 + 24) == 0;
  v4 = !v3;
  *(_BYTE *)(v2 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t *getPciTransportToDirectionMap(void)
{
  unsigned __int8 v0;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  int __dst[68];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  {
    memcpy(__dst, &unk_20DB28330, sizeof(__dst));
    std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100]((uint64_t)&v3, __dst, 34);
    v2 = v4;
    getPciTransportToDirectionMap(void)::sMap = (uint64_t)v3;
    qword_253DA69F8 = v4;
    qword_253DA6A00 = v5;
    if (v5)
    {
      v4[2] = &qword_253DA69F8;
      v3 = &v4;
      v4 = 0;
      v5 = 0;
      v2 = 0;
    }
    else
    {
      getPciTransportToDirectionMap(void)::sMap = (uint64_t)&qword_253DA69F8;
    }
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v3, v2);
  }
  return &getPciTransportToDirectionMap(void)::sMap;
}

void sub_20DB240E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::map<PCITransportInterface,PCITransportDirection>::at(uint64_t a1, int *a2)
{
  uint64_t *v2;
  int v3;
  int v4;

  v2 = *(uint64_t **)(a1 + 8);
  if (!v2)
LABEL_8:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  v3 = *a2;
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v2 + 7);
      if (v3 >= v4)
        break;
      v2 = (uint64_t *)*v2;
      if (!v2)
        goto LABEL_8;
    }
    if (v4 >= v3)
      return v2 + 4;
    v2 = (uint64_t *)v2[1];
    if (!v2)
      goto LABEL_8;
  }
}

uint64_t std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_20DB241B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C818EC8, MEMORY[0x24BEDAB00]);
}

void sub_20DB2420C(_Unwind_Exception *a1)
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

_QWORD *std::shared_ptr<pci::transport::th>::shared_ptr[abi:ne180100]<pci::transport::th,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24C81A2B0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_20DB242A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<pci::transport::th>::reset[abi:ne180100]((pci::transport::th **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

pci::transport::th *std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__on_zero_shared(uint64_t a1)
{
  pci::transport::th *result;

  result = *(pci::transport::th **)(a1 + 24);
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::th *std::unique_ptr<pci::transport::th>::reset[abi:ne180100](pci::transport::th **a1, pci::transport::th *a2)
{
  pci::transport::th *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C81A328;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C81A328;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t pci::transport::bind::setCIO(uint64_t this, void *a2)
{
  *(_QWORD *)(this + 8) = a2;
  return this;
}

uint64_t pci::transport::bind::setStatus(uint64_t result, int a2, int a3, int a4, char a5, int a6)
{
  *(_DWORD *)(result + 16) = a3;
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = a4;
  if ((a5 & 1) == 0 && (a2 || a6 == 3))
  {
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t pci::transport::bind::getCIO(pci::transport::bind *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t pci::transport::bind::getSize(pci::transport::bind *this)
{
  return *((unsigned int *)this + 4);
}

void pci::transport::bind::parameters::~parameters(pci::transport::bind::parameters *this)
{
  NSObject *v2;

  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  v2 = *((_QWORD *)this + 3);
  if (v2)
    dispatch_release(v2);
}

uint64_t pci::transport::task::poison(pci::transport::task *this, int a2)
{
  pci::log *v4;
  NSObject *v5;
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *TypeString;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  pci::transport::task *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(*((const os_unfair_lock **)this + 4));
  getTypeString(*((_DWORD *)this + 5));
  v4 = (pci::log *)_TelephonyUtilDebugPrint();
  v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)buf = 136316418;
    v17 = "task";
    v18 = 2048;
    v19 = this;
    v20 = 1024;
    v21 = v14;
    v22 = 2080;
    v23 = "poison";
    v24 = 2080;
    v25 = TypeString;
    v26 = 1024;
    v27 = a2;
    _os_log_debug_impl(&dword_20DB0C000, v5, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: status 0x%x", buf, 0x36u);
  }
  result = *((_QWORD *)this + 9);
  if (result)
  {
    v7 = *((unsigned __int8 *)this + 48);
    v8 = *((_DWORD *)this + 5);
    *(_DWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 64) = a2;
    *(_DWORD *)(result + 68) = -1;
    if (!v7 && (a2 || v8 == 3))
      *(_QWORD *)(result + 8) = 0;
    pci::transport::bind::~bind((pci::transport::bind *)result);
    result = MEMORY[0x212BAF90C](v9, 0x10A0C40F1E767F4, v10, v11, v12, v13);
    *((_QWORD *)this + 9) = 0;
  }
  return result;
}

uint64_t pci::transport::task::getType(pci::transport::task *this)
{
  return *((unsigned int *)this + 5);
}

_QWORD *std::shared_ptr<pci::transport::task>::shared_ptr[abi:ne180100]<pci::transport::task,void>(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24C81A378;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>((uint64_t)a1, a2, (uint64_t)a2);
  return a1;
}

void sub_20DB24688(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<pci::transport::task>::reset[abi:ne180100]((pci::transport::task **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAF90CLL);
}

uint64_t std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::task *std::unique_ptr<pci::transport::task>::reset[abi:ne180100](pci::transport::task **a1, pci::transport::task *a2)
{
  pci::transport::task *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x212BAF90CLL);
  }
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x26u);
}

void pci::system::info::info(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB0C000, a1, a3, "", a5, a6, a7, a8, 0);
}

void pci::system::info::eraseTH()
{
  __assert_rtn("eraseTH", "PCISystem.cpp", 96, "it != mth.end()");
}

void pci::system::info::removeBH()
{
  __assert_rtn("removeBH", "PCISystem.cpp", 213, "it != mbh.end()");
}

void pci::system::info::removeBH(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = 136316162;
  v4 = "system";
  v5 = 2048;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  v9 = 2080;
  v10 = "removeBH";
  v11 = 1024;
  v12 = a2;
  _os_log_debug_impl(&dword_20DB0C000, log, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %u", (uint8_t *)&v3, 0x2Cu);
}

void TelephonyBasebandPCITransportFree()
{
  __assert_rtn("TelephonyBasebandPCITransportFree", "TelephonyBasebandPCITransport.cpp", 330, "transport");
}

void TelephonyBasebandPCITransportWrite()
{
  __assert_rtn("TelephonyBasebandPCITransportWrite", "TelephonyBasebandPCITransport.cpp", 354, "transport");
}

void TelephonyBasebandPCITransportRead()
{
  __assert_rtn("TelephonyBasebandPCITransportRead", "TelephonyBasebandPCITransport.cpp", 407, "transport");
}

void TelephonyBasebandPCITransportSendImage()
{
  __assert_rtn("TelephonyBasebandPCITransportSendImage", "TelephonyBasebandPCITransport.cpp", 466, "transport");
}

void TelephonyBasebandPCITransportReadRegister()
{
  __assert_rtn("TelephonyBasebandPCITransportReadRegister", "TelephonyBasebandPCITransport.cpp", 520, "transport");
}

void TelephonyBasebandPCITransportUnblockRead()
{
  __assert_rtn("TelephonyBasebandPCITransportUnblockRead", "TelephonyBasebandPCITransport.cpp", 549, "transport");
}

void TelephonyBasebandPCITransportFlushRead()
{
  __assert_rtn("TelephonyBasebandPCITransportFlushRead", "TelephonyBasebandPCITransport.cpp", 564, "transport");
}

void TelephonyBasebandPCITransportIsValid()
{
  __assert_rtn("TelephonyBasebandPCITransportIsValid", "TelephonyBasebandPCITransport.cpp", 579, "transport");
}

void TelephonyBasebandPCITransportTimesync_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportTimesync", "TelephonyBasebandPCITransport.cpp", 237, "transport");
}

void TelephonyBasebandPCITransportRegisterTimeEvent_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportRegisterTimeEvent", "TelephonyBasebandPCITransport.cpp", 252, "transport");
}

void TelephonyBasebandPCITransportDeregisterTimeEvent_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportDeregisterTimeEvent", "TelephonyBasebandPCITransport.cpp", 267, "transport");
}

void TelephonyBasebandPCITransportMapRegion_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportMapRegion", "TelephonyBasebandPCITransport.cpp", 282, "transport");
}

void TelephonyBasebandPCITransportMapRegionwithClientData_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportMapRegionwithClientData", "TelephonyBasebandPCITransport.cpp", 297, "transport");
}

void TelephonyBasebandPCITransportUnmapRegion_cold_1()
{
  __assert_rtn("TelephonyBasebandPCITransportUnmapRegion", "TelephonyBasebandPCITransport.cpp", 311, "transport");
}

void abpKernel::abortChannelAsync()
{
  __assert_rtn("abortChannelAsync", "PCITransportKernel.cpp", 306, "dir == kPCITransportDirectionIn || dir == kPCITransportDirectionOut");
}

void abpKernel::startChannelAsync()
{
  __assert_rtn("startChannelAsync", "PCITransportKernel.cpp", 313, "dir == kPCITransportDirectionIn || dir == kPCITransportDirectionOut");
}

void acipcKernel::abortChannelAsync()
{
  __assert_rtn("abortChannelAsync", "PCITransportKernel.cpp", 921, "!fQueue");
}

{
  __assert_rtn("abortChannelAsync", "PCITransportKernel.cpp", 916, "!fRunLoopRef");
}

void acipcKernel::startChannelAsync()
{
  __assert_rtn("startChannelAsync", "PCITransportKernel.cpp", 950, "!fQueue");
}

{
  __assert_rtn("startChannelAsync", "PCITransportKernel.cpp", 945, "!fRunLoopRef");
}

void pci::transport::bh::init()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "init";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::bh::bh()
{
  unint64_t v0;
  int v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;
  __int128 v5;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  LODWORD(v4) = 136315906;
  *(_QWORD *)((char *)&v4 + 4) = "bh";
  WORD6(v4) = 2048;
  HIWORD(v4) = v0;
  LODWORD(v5) = v1;
  WORD2(v5) = 2080;
  *(_QWORD *)((char *)&v5 + 6) = "bh";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v2, v3, "%s::%p::%d::%s: ", (const char *)v4, *((const void **)&v4 + 1), v0 >> 16, (const char *)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::bh::~bh()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: --done", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: fRegistered\n", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: interface added", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: notify interface removed", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: interface removed", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::bh::setNotify()
{
  __assert_rtn("setNotify", "PCITransportBH.cpp", 325, "!fNotifyTask");
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1()
{
  __assert_rtn("generateCallback_block_invoke", "PCITransportBH.cpp", 345, "!called");
}

void pci::transport::bh::cmdCompletion()
{
  __assert_rtn("cmdCompletion", "PCITransportBH.cpp", 708, "cb");
}

void pci::transport::bh::ioCompletion()
{
  __assert_rtn("ioCompletion", "PCITransportBH.cpp", 719, "cb");
}

void pci::transport::bh::imageCompletion()
{
  __assert_rtn("imageCompletion", "PCITransportBH.cpp", 732, "cb");
}

void pci::transport::bh::eventNotification()
{
  __assert_rtn("eventNotification", "PCITransportBH.cpp", 745, "cb");
}

void ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke_cold_1()
{
  __assert_rtn("deregisterTimeEvent_block_invoke", "PCITransportBH.cpp", 640, "!called");
}

void pci::event::Listener::notifyPDP(unint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  const char *PDPMessageTypeString;
  __int16 v8;
  int PDPMessageTypeValue;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = 136315650;
  PDPMessageTypeString = pci::event::getPDPMessageTypeString(a1);
  v8 = 1024;
  PDPMessageTypeValue = pci::event::getPDPMessageTypeValue(a1);
  v10 = 2048;
  v11 = a2;
  _os_log_debug_impl(&dword_20DB0C000, a3, OS_LOG_TYPE_DEBUG, "%s (%#x), arg %p", (uint8_t *)&v6, 0x1Cu);
}

void pci::event::PDPListener::setEventNotificationPort()
{
  __assert_rtn("setEventNotificationPort", "PCIPDPEvent.cpp", 245, "fEventNotificationPort");
}

void pci::transport::th::init()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "init";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::th()
{
  unint64_t v0;
  int v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;
  __int128 v5;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  LODWORD(v4) = 136315906;
  *(_QWORD *)((char *)&v4 + 4) = "th";
  WORD6(v4) = 2048;
  HIWORD(v4) = v0;
  LODWORD(v5) = v1;
  WORD2(v5) = 2080;
  *(_QWORD *)((char *)&v5 + 6) = "th";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v2, v3, "%s::%p::%d::%s: ", (const char *)v4, *((const void **)&v4 + 1), v0 >> 16, (const char *)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::th(NSObject **a1, uint64_t a2, dispatch_object_t *a3)
{
  NSObject *v5;

  v5 = *a1;
  if (v5)
    dispatch_release(v5);
  std::shared_ptr<pci::transport::th>::~shared_ptr[abi:ne180100](a2);
  if (*a3)
    dispatch_release(*a3);
}

void pci::transport::th::~th()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "~th";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: --done", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "~th";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::notify()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "notify";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::readAsync()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "readAsync";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::writeInternal()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_20DB0C000, v0, v1, "%.*P");
  OUTLINED_FUNCTION_6();
}

void pci::transport::th::unblockRead()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "unblockRead";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::th::flushRead(const void *a1, dispatch_object_t *a2)
{
  _Block_object_dispose(a1, 8);
  if (*a2)
    dispatch_release(*a2);
}

void pci::transport::th::flushRead()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  _BYTE v5[14];

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)&v5[6] = "flushRead";
  OUTLINED_FUNCTION_1(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
  OUTLINED_FUNCTION_2();
}

void pci::transport::bind::bind(_DWORD *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  _DWORD *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315906;
  v5 = "bind";
  v6 = 2048;
  v7 = a1;
  v8 = 1024;
  v9 = v3;
  v10 = 2080;
  v11 = "bind";
  OUTLINED_FUNCTION_1_0(&dword_20DB0C000, a2, a3, "%s::%p::%d::%s: ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void pci::transport::bind::~bind()
{
  NSObject *v0;
  uint64_t v1;
  int v2[7];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0_0();
  v3 = "~bind";
  OUTLINED_FUNCTION_1_0(&dword_20DB0C000, v0, v1, "%s::%p::%d::%s: ", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void pci::transport::task::init()
{
  NSObject *v0;
  int v1[7];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0_0();
  v2 = "init";
  OUTLINED_FUNCTION_1_0(&dword_20DB0C000, v0, (uint64_t)v0, "%s::%p::%d::%s: ", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void pci::transport::task::complete()
{
  __assert_rtn("complete", "PCITransportTask.cpp", 309, "false");
}

{
  __assert_rtn("complete", "PCITransportTask.cpp", 291, "size <= fSize");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
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

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x24BED96E0]();
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

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x24BED97C0]();
}

uint64_t _TelephonyUtilDebugPrintBinaryVerbose()
{
  return MEMORY[0x24BED97C8]();
}

uint64_t _TelephonyUtilDebugPrintError()
{
  return MEMORY[0x24BED97D0]();
}

uint64_t _TelephonyUtilDebugPrintVerbose()
{
  return MEMORY[0x24BED97D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t getABPErrorTypeString()
{
  return MEMORY[0x24BED4498]();
}

uint64_t getABPLinkStateString()
{
  return MEMORY[0x24BED44A0]();
}

uint64_t getACIPCErrorTypeString()
{
  return MEMORY[0x24BED4640]();
}

uint64_t getACIPCLinkStateString()
{
  return MEMORY[0x24BED4648]();
}

uint64_t getABPAERErrorTypeString()
{
  return MEMORY[0x24BED44A8]();
}

uint64_t getACIPCAERErrorTypeString()
{
  return MEMORY[0x24BED4650]();
}

uint64_t IOABPClass::writeAsync(IOABPClass *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x24BED44B0](this, a2, a3, a4, a5);
}

uint64_t IOABPClass::readRegister(IOABPClass *this, uint64_t a2, void *a3, unsigned int *a4)
{
  return MEMORY[0x24BED44B8](this, a2, a3, a4);
}

uint64_t IOABPClass::timeSyncAsync(IOABPClass *this, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return MEMORY[0x24BED44C0](this, a2, a3, a4, a5, a6);
}

uint64_t IOABPClass::mapMemoryAsync(IOABPClass *this, uint64_t a2, const void *a3, uint64_t a4, void (*a5)(void *, int), void *a6)
{
  return MEMORY[0x24BED44C8](this, a2, a3, a4, a5, a6);
}

uint64_t IOABPClass::sendImageAsync(IOABPClass *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return MEMORY[0x24BED44D0](this, a2, a3, a4, a5);
}

uint64_t IOABPClass::unmapMemoryAsync(IOABPClass *this, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  return MEMORY[0x24BED44D8](this, a2, a3, a4);
}

uint64_t IOABPClass::abortChannelAsync()
{
  return MEMORY[0x24BED44E0]();
}

uint64_t IOABPClass::registerTimeEvent(IOABPClass *this, uint64_t a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  return MEMORY[0x24BED44E8](this, a2, a3, a4);
}

uint64_t IOABPClass::startChannelAsync()
{
  return MEMORY[0x24BED44F0]();
}

uint64_t IOABPClass::deregisterTimeEvent(IOABPClass *this, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  return MEMORY[0x24BED44F8](this, a2, a3, a4);
}

uint64_t IOABPClass::open(IOABPClass *this)
{
  return MEMORY[0x24BED4500](this);
}

uint64_t IOABPClass::read(IOABPClass *this, void *a2, unsigned int *a3)
{
  return MEMORY[0x24BED4508](this, a2, a3);
}

uint64_t IOABPClass::stop(IOABPClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x24BED4510](this, a2);
}

uint64_t IOABPClass::close(IOABPClass *this)
{
  return MEMORY[0x24BED4518](this);
}

uint64_t IOABPClass::start()
{
  return MEMORY[0x24BED4520]();
}

{
  return MEMORY[0x24BED4528]();
}

uint64_t IOABPClass::write(IOABPClass *this, const void *a2)
{
  return MEMORY[0x24BED4530](this, a2);
}

uint64_t IOABPClass::readAsync(IOABPClass *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x24BED4538](this, a2, a3, a4, a5);
}

uint64_t IOABPClass::sendImage(IOABPClass *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x24BED4540](this, a2, a3, a4);
}

void IOABPClass::IOABPClass(IOABPClass *this)
{
  MEMORY[0x24BED4548](this);
}

void IOABPClass::~IOABPClass(IOABPClass *this)
{
  MEMORY[0x24BED4550](this);
}

uint64_t IOACIPCClass::readRegister(IOACIPCClass *this, uint64_t a2, void *a3, unsigned int *a4)
{
  return MEMORY[0x24BED4658](this, a2, a3, a4);
}

uint64_t IOACIPCClass::mapMemoryAsync(IOACIPCClass *this, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, void (*a9)(void *, int), void *a10)
{
  return MEMORY[0x24BED4660](this, a2, a3, a4, a5, a6, a7);
}

uint64_t IOACIPCClass::sendImageAsync(IOACIPCClass *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return MEMORY[0x24BED4668](this, a2, a3, a4, a5);
}

uint64_t IOACIPCClass::unmapMemoryAsync(IOACIPCClass *this, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  return MEMORY[0x24BED4670](this, a2, a3, a4);
}

uint64_t IOACIPCClass::getTransferRingInfo(IOACIPCClass *this)
{
  return MEMORY[0x24BED4678](this);
}

uint64_t IOACIPCClass::abortTransferRingAsync(IOACIPCClass *this, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  return MEMORY[0x24BED4680](this, a2, a3, a4);
}

uint64_t IOACIPCClass::io()
{
  return MEMORY[0x24BED4690]();
}

uint64_t IOACIPCClass::open(IOACIPCClass *this)
{
  return MEMORY[0x24BED46A0](this);
}

uint64_t IOACIPCClass::stop(IOACIPCClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x24BED46B0](this, a2);
}

uint64_t IOACIPCClass::close(IOACIPCClass *this)
{
  return MEMORY[0x24BED46B8](this);
}

uint64_t IOACIPCClass::start()
{
  return MEMORY[0x24BED46C0]();
}

{
  return MEMORY[0x24BED46C8]();
}

uint64_t IOACIPCClass::ioAsync(IOACIPCClass *this, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void (*a7)(void *, int, void *), void *a8)
{
  return MEMORY[0x24BED46D8](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOACIPCClass::sendImage(IOACIPCClass *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x24BED46E0](this, a2, a3, a4);
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
  MEMORY[0x24BED46E8](this);
}

uint64_t IOACIPCBBClass::timesyncAsync(IOACIPCBBClass *this, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return MEMORY[0x24BED47F0](this, a2, a3, a4, a5, a6, a7);
}

uint64_t IOACIPCBBClass::registerTimeEvent(IOACIPCBBClass *this, uint64_t a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  return MEMORY[0x24BED47F8](this, a2, a3, a4);
}

uint64_t IOACIPCBBClass::deregisterTimeEvent(IOACIPCBBClass *this, uint64_t a2, void (*a3)(void *, int), void *a4)
{
  return MEMORY[0x24BED4800](this, a2, a3, a4);
}

void IOACIPCBBClass::~IOACIPCBBClass(IOACIPCBBClass *this)
{
  MEMORY[0x24BED4808](this);
}

uint64_t IOABPTraceClass::dumpRegistry(IOABPTraceClass *this)
{
  return MEMORY[0x24BED4558](this);
}

uint64_t IOABPTraceClass::getPipeCount(IOABPTraceClass *this)
{
  return MEMORY[0x24BED4560](this);
}

uint64_t IOABPTraceClass::getTraceCode()
{
  return MEMORY[0x24BED4568]();
}

uint64_t IOABPTraceClass::readLogsAsync(IOABPTraceClass *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return MEMORY[0x24BED4570](this, a2, a3, a4, a5, a6, a7);
}

uint64_t IOABPTraceClass::getRegistryInfo()
{
  return MEMORY[0x24BED4578]();
}

uint64_t IOABPTraceClass::flushTraceBuffers(IOABPTraceClass *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x24BED4580](this, a2, a3, a4, a5);
}

uint64_t IOABPTraceClass::getPipeCodeAndName(IOABPTraceClass *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return MEMORY[0x24BED4588](this, a2, a3, a4);
}

uint64_t IOABPTraceClass::getSnapshotBufferSize(IOABPTraceClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED4590](this, a2);
}

uint64_t IOABPTraceClass::stop(IOABPTraceClass *this)
{
  return MEMORY[0x24BED4598](this);
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, __CFRunLoop *a2)
{
  return MEMORY[0x24BED45A0](this, a2);
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, dispatch_queue_s *a2)
{
  return MEMORY[0x24BED45A8](this, a2);
}

uint64_t IOABPTraceClass::openPipe(IOABPTraceClass *this)
{
  return MEMORY[0x24BED45B0](this);
}

uint64_t IOABPTraceClass::closePipe(IOABPTraceClass *this)
{
  return MEMORY[0x24BED45B8](this);
}

void IOABPTraceClass::IOABPTraceClass(IOABPTraceClass *this)
{
  MEMORY[0x24BED45C0](this);
}

void IOABPTraceClass::~IOABPTraceClass(IOABPTraceClass *this)
{
  MEMORY[0x24BED45C8](this);
}

uint64_t IOABPControlClass::loggerTune(IOABPControlClass *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return MEMORY[0x24BED45D0](this, a2, a3, a4, a5);
}

uint64_t IOABPControlClass::readLogsAsync(IOABPControlClass *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return MEMORY[0x24BED45D8](this, a2, a3, a4, a5, a6);
}

uint64_t IOABPControlClass::getLastKnownBootStage(IOABPControlClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED45E0](this, a2);
}

uint64_t IOABPControlClass::getLogInternalBufferSize(IOABPControlClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED45E8](this, a2);
}

uint64_t IOABPControlClass::registerEventNotification()
{
  return MEMORY[0x24BED45F0]();
}

{
  return MEMORY[0x24BED45F8]();
}

uint64_t IOABPControlClass::deregisterEventNotification(IOABPControlClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x24BED4600](this, a2);
}

uint64_t IOABPControlClass::open(IOABPControlClass *this, __CFRunLoop *a2)
{
  return MEMORY[0x24BED4608](this, a2);
}

uint64_t IOABPControlClass::open(IOABPControlClass *this, dispatch_queue_s *a2)
{
  return MEMORY[0x24BED4610](this, a2);
}

uint64_t IOABPControlClass::stop(IOABPControlClass *this)
{
  return MEMORY[0x24BED4618](this);
}

uint64_t IOABPControlClass::close(IOABPControlClass *this)
{
  return MEMORY[0x24BED4620](this);
}

uint64_t IOABPControlClass::start(IOABPControlClass *this)
{
  return MEMORY[0x24BED4628](this);
}

void IOABPControlClass::IOABPControlClass(IOABPControlClass *this)
{
  MEMORY[0x24BED4630](this);
}

void IOABPControlClass::~IOABPControlClass(IOABPControlClass *this)
{
  MEMORY[0x24BED4638](this);
}

uint64_t IOACIPCTraceClass::dumpRegistry(IOACIPCTraceClass *this)
{
  return MEMORY[0x24BED46F8](this);
}

uint64_t IOACIPCTraceClass::getPipeCount(IOACIPCTraceClass *this)
{
  return MEMORY[0x24BED4700](this);
}

uint64_t IOACIPCTraceClass::getTraceCode()
{
  return MEMORY[0x24BED4708]();
}

uint64_t IOACIPCTraceClass::readLogsAsync(IOACIPCTraceClass *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return MEMORY[0x24BED4710](this, a2, a3, a4, a5, a6, a7);
}

uint64_t IOACIPCTraceClass::getRegistryInfo()
{
  return MEMORY[0x24BED4718]();
}

uint64_t IOACIPCTraceClass::flushTraceBuffers(IOACIPCTraceClass *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x24BED4720](this, a2, a3, a4, a5);
}

uint64_t IOACIPCTraceClass::getPipeCodeAndName(IOACIPCTraceClass *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return MEMORY[0x24BED4728](this, a2, a3, a4);
}

uint64_t IOACIPCTraceClass::getSnapshotBufferSize(IOACIPCTraceClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED4730](this, a2);
}

uint64_t IOACIPCTraceClass::stop(IOACIPCTraceClass *this)
{
  return MEMORY[0x24BED4738](this);
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, __CFRunLoop *a2)
{
  return MEMORY[0x24BED4740](this, a2);
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, dispatch_queue_s *a2)
{
  return MEMORY[0x24BED4748](this, a2);
}

uint64_t IOACIPCTraceClass::openPipe(IOACIPCTraceClass *this)
{
  return MEMORY[0x24BED4750](this);
}

uint64_t IOACIPCTraceClass::closePipe(IOACIPCTraceClass *this)
{
  return MEMORY[0x24BED4758](this);
}

void IOACIPCTraceClass::IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  MEMORY[0x24BED4760](this);
}

void IOACIPCTraceClass::~IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  MEMORY[0x24BED4768](this);
}

uint64_t IOACIPCControlClass::loggerTune(IOACIPCControlClass *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return MEMORY[0x24BED4770](this, a2, a3, a4, a5);
}

uint64_t IOACIPCControlClass::readLogsAsync(IOACIPCControlClass *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return MEMORY[0x24BED4778](this, a2, a3, a4, a5, a6);
}

uint64_t IOACIPCControlClass::getLastKnownBootStage(IOACIPCControlClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED4780](this, a2);
}

uint64_t IOACIPCControlClass::getLogInternalBufferSize(IOACIPCControlClass *this, unsigned int *a2)
{
  return MEMORY[0x24BED4788](this, a2);
}

uint64_t IOACIPCControlClass::registerEventNotification()
{
  return MEMORY[0x24BED4790]();
}

{
  return MEMORY[0x24BED4798]();
}

uint64_t IOACIPCControlClass::deregisterEventNotification(IOACIPCControlClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x24BED47A0](this, a2);
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, __CFRunLoop *a2)
{
  return MEMORY[0x24BED47B0](this, a2);
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, dispatch_queue_s *a2)
{
  return MEMORY[0x24BED47B8](this, a2);
}

uint64_t IOACIPCControlClass::stop(IOACIPCControlClass *this)
{
  return MEMORY[0x24BED47C0](this);
}

uint64_t IOACIPCControlClass::close(IOACIPCControlClass *this)
{
  return MEMORY[0x24BED47C8](this);
}

uint64_t IOACIPCControlClass::start(IOACIPCControlClass *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED47D0](this, a2);
}

void IOACIPCControlClass::IOACIPCControlClass(IOACIPCControlClass *this)
{
  MEMORY[0x24BED47E0](this);
}

void IOACIPCControlClass::~IOACIPCControlClass(IOACIPCControlClass *this)
{
  MEMORY[0x24BED47E8](this);
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9968](this);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9990](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B08](this, a2, a3);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D40]();
}

{
  return MEMORY[0x24BED9D58]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
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
  off_24C818F10(__p);
}

uint64_t operator delete()
{
  return off_24C818F18();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C818F20(__sz);
}

uint64_t operator new()
{
  return off_24C818F28();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE010](label);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
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

