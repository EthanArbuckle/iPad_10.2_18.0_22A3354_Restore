void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_5(_QWORD *a1, int a2)
{
  std::__shared_weak_count *v3;
  os_unfair_lock_s *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = (os_unfair_lock_s *)a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (a2 && a1[5])
        mav_router::device::pci_shim::handleError(v5);
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

void sub_20E5D2070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mav_router_service_transmit(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  unsigned int *v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v6;
  _QWORD v9[2];

  if (!a1)
    return 1;
  if (*(_DWORD *)a1 <= a2)
    return 1;
  v4 = *(unsigned int **)(*(_QWORD *)(a1 + 8) + 48 * a2 + 8);
  if (!v4)
    return 3;
  v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))*((_QWORD *)v4 + 3);
  if (!v5)
    return 4;
  v6 = *v4;
  if (*(_DWORD *)(a1 + 4) <= v6)
    return 1;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 40 * v6 + 16) >= 2u)
  {
    v9[1] = a3;
    v9[0] = a2;
    if (mav_mux_encode((uint64_t)v9))
      return 1;
    v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))*((_QWORD *)v4 + 3);
    v6 = *v4;
  }
  return v5(a1, v6, *a3, *((_QWORD *)v4 + 4));
}

uint64_t mav_router::device::shim::handle_transmit_static(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a4 + 16))(a4, a3);
}

void mav_router::device::pci_shim::dtor(mav_router::device::pci_shim *this, void *a2)
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _QWORD **v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  os_unfair_lock_lock(&mav_router::device::pci_shim::mapLock);
  v3 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&_MergedGlobals))
  {
    qword_253DE9F10 = 0;
    qword_253DE9F08 = 0;
    qword_253DE9F00 = (uint64_t)&qword_253DE9F08;
    __cxa_guard_release(&_MergedGlobals);
  }
  v4 = qword_253DE9F08;
  if (!qword_253DE9F08)
    goto LABEL_13;
  v5 = &qword_253DE9F08;
  v6 = qword_253DE9F08;
  do
  {
    v7 = *(_QWORD *)(v6 + 32);
    v8 = v7 >= (unint64_t)this;
    if (v7 >= (unint64_t)this)
      v9 = (uint64_t *)v6;
    else
      v9 = (uint64_t *)(v6 + 8);
    if (v8)
      v5 = (uint64_t *)v6;
    v6 = *v9;
  }
  while (*v9);
  if (v5 == &qword_253DE9F08 || v5[4] > (unint64_t)this)
LABEL_13:
    v5 = &qword_253DE9F08;
  v10 = v5[1];
  if (v10)
  {
    v11 = (uint64_t *)v5[1];
    do
    {
      v12 = v11;
      v11 = (uint64_t *)*v11;
    }
    while (v11);
  }
  else
  {
    v13 = v5;
    do
    {
      v12 = (uint64_t *)v13[2];
      v24 = *v12 == (_QWORD)v13;
      v13 = v12;
    }
    while (!v24);
  }
  if ((uint64_t *)qword_253DE9F00 == v5)
    qword_253DE9F00 = (uint64_t)v12;
  v14 = v5[5];
  --qword_253DE9F10;
  if (*v5)
  {
    if (v10)
    {
      do
      {
        v15 = v10;
        v10 = *(_QWORD *)v10;
      }
      while (v10);
      v10 = *(_QWORD *)(v15 + 8);
      if (!v10)
      {
LABEL_29:
        v16 = 1;
        v17 = *(uint64_t **)(v15 + 16);
        v18 = *v17;
        if (*v17 == v15)
          goto LABEL_30;
LABEL_35:
        v17[1] = v10;
        v19 = *(unsigned __int8 *)(v15 + 24);
        if ((uint64_t *)v15 == v5)
          goto LABEL_40;
        goto LABEL_36;
      }
    }
    else
    {
      v10 = *v5;
      v15 = (uint64_t)v5;
    }
  }
  else
  {
    v15 = (uint64_t)v5;
    if (!v10)
      goto LABEL_29;
  }
  v16 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v15 + 16);
  v17 = *(uint64_t **)(v15 + 16);
  v18 = *v17;
  if (*v17 != v15)
    goto LABEL_35;
LABEL_30:
  *v17 = v10;
  if (v15 != v4)
  {
    v18 = v17[1];
    v19 = *(unsigned __int8 *)(v15 + 24);
    if ((uint64_t *)v15 == v5)
      goto LABEL_40;
LABEL_36:
    v20 = v5[2];
    *(_QWORD *)(v15 + 16) = v20;
    *(_QWORD *)(v20 + 8 * (*(_QWORD *)v5[2] != (_QWORD)v5)) = v15;
    v22 = *v5;
    v21 = v5[1];
    *(_QWORD *)(v22 + 16) = v15;
    *(_QWORD *)v15 = v22;
    *(_QWORD *)(v15 + 8) = v21;
    if (v21)
      *(_QWORD *)(v21 + 16) = v15;
    *(_BYTE *)(v15 + 24) = *((_BYTE *)v5 + 24);
    if ((uint64_t *)v4 == v5)
      v4 = v15;
    goto LABEL_40;
  }
  v18 = 0;
  v4 = v10;
  v19 = *(unsigned __int8 *)(v15 + 24);
  if ((uint64_t *)v15 != v5)
    goto LABEL_36;
LABEL_40:
  if (!v19 || !v4)
    goto LABEL_99;
  if (!v16)
  {
    *(_BYTE *)(v10 + 24) = 1;
    goto LABEL_99;
  }
  while (1)
  {
    v25 = *(_QWORD ***)(v18 + 16);
    if (*v25 != (_QWORD *)v18)
      break;
    if (*(_BYTE *)(v18 + 24))
    {
      v27 = *(_QWORD *)v18;
      if (*(_QWORD *)v18)
        goto LABEL_72;
    }
    else
    {
      *(_BYTE *)(v18 + 24) = 1;
      *((_BYTE *)v25 + 24) = 0;
      v31 = *(_QWORD **)(v18 + 8);
      *v25 = v31;
      if (v31)
        v31[2] = v25;
      *(_QWORD *)(v18 + 16) = v25[2];
      v25[2][*v25[2] != (_QWORD)v25] = v18;
      *(_QWORD *)(v18 + 8) = v25;
      v25[2] = (_QWORD *)v18;
      if ((_QWORD **)v4 == v25)
        v4 = v18;
      v18 = (uint64_t)*v25;
      v27 = **v25;
      if (v27)
      {
LABEL_72:
        if (!*(_BYTE *)(v27 + 24))
          goto LABEL_94;
      }
    }
    v32 = *(_QWORD *)(v18 + 8);
    if (v32 && !*(_BYTE *)(v32 + 24))
    {
      if (v27 && !*(_BYTE *)(v27 + 24))
      {
LABEL_94:
        v32 = v18;
      }
      else
      {
        *(_BYTE *)(v32 + 24) = 1;
        *(_BYTE *)(v18 + 24) = 0;
        v33 = *(_QWORD *)v32;
        *(_QWORD *)(v18 + 8) = *(_QWORD *)v32;
        if (v33)
          *(_QWORD *)(v33 + 16) = v18;
        *(_QWORD *)(v32 + 16) = *(_QWORD *)(v18 + 16);
        *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v32;
        *(_QWORD *)v32 = v18;
        *(_QWORD *)(v18 + 16) = v32;
        v27 = v18;
      }
      v35 = *(_QWORD *)(v32 + 16);
      *(_BYTE *)(v32 + 24) = *(_BYTE *)(v35 + 24);
      *(_BYTE *)(v35 + 24) = 1;
      *(_BYTE *)(v27 + 24) = 1;
      v36 = *(uint64_t **)v35;
      v38 = *(_QWORD *)(*(_QWORD *)v35 + 8);
      *(_QWORD *)v35 = v38;
      if (v38)
        *(_QWORD *)(v38 + 16) = v35;
      v36[2] = *(_QWORD *)(v35 + 16);
      *(_QWORD *)(*(_QWORD *)(v35 + 16) + 8 * (**(_QWORD **)(v35 + 16) != v35)) = v36;
      v36[1] = v35;
      goto LABEL_98;
    }
    *(_BYTE *)(v18 + 24) = 0;
    v23 = *(_QWORD *)(v18 + 16);
    if (*(_BYTE *)(v23 + 24))
      v24 = v23 == v4;
    else
      v24 = 1;
    if (v24)
      goto LABEL_84;
LABEL_48:
    v18 = *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) == v23));
  }
  if (*(_BYTE *)(v18 + 24))
  {
    v26 = *(_QWORD *)v18;
    if (!*(_QWORD *)v18)
    {
LABEL_62:
      v30 = *(_QWORD *)(v18 + 8);
      if (v30 && !*(_BYTE *)(v30 + 24))
        goto LABEL_90;
      *(_BYTE *)(v18 + 24) = 0;
      v23 = *(_QWORD *)(v18 + 16);
      if (v23 == v4)
      {
        v23 = v4;
LABEL_84:
        *(_BYTE *)(v23 + 24) = 1;
        goto LABEL_99;
      }
      if (!*(_BYTE *)(v23 + 24))
        goto LABEL_84;
      goto LABEL_48;
    }
  }
  else
  {
    *(_BYTE *)(v18 + 24) = 1;
    *((_BYTE *)v25 + 24) = 0;
    v28 = v25[1];
    v29 = (_QWORD *)*v28;
    v25[1] = (_QWORD *)*v28;
    if (v29)
      v29[2] = v25;
    v28[2] = v25[2];
    v25[2][*v25[2] != (_QWORD)v25] = v28;
    *v28 = v25;
    v25[2] = v28;
    if (v4 == *(_QWORD *)v18)
      v4 = v18;
    v18 = *(_QWORD *)(*(_QWORD *)v18 + 8);
    v26 = *(_QWORD *)v18;
    if (!*(_QWORD *)v18)
      goto LABEL_62;
  }
  if (*(_BYTE *)(v26 + 24))
    goto LABEL_62;
  v30 = *(_QWORD *)(v18 + 8);
  if (v30 && !*(_BYTE *)(v30 + 24))
  {
LABEL_90:
    v26 = v18;
  }
  else
  {
    *(_BYTE *)(v26 + 24) = 1;
    *(_BYTE *)(v18 + 24) = 0;
    v34 = *(_QWORD *)(v26 + 8);
    *(_QWORD *)v18 = v34;
    if (v34)
      *(_QWORD *)(v34 + 16) = v18;
    *(_QWORD *)(v26 + 16) = *(_QWORD *)(v18 + 16);
    *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v26;
    *(_QWORD *)(v26 + 8) = v18;
    *(_QWORD *)(v18 + 16) = v26;
    v30 = v18;
  }
  v35 = *(_QWORD *)(v26 + 16);
  *(_BYTE *)(v26 + 24) = *(_BYTE *)(v35 + 24);
  *(_BYTE *)(v35 + 24) = 1;
  *(_BYTE *)(v30 + 24) = 1;
  v36 = *(uint64_t **)(v35 + 8);
  v37 = *v36;
  *(_QWORD *)(v35 + 8) = *v36;
  if (v37)
    *(_QWORD *)(v37 + 16) = v35;
  v36[2] = *(_QWORD *)(v35 + 16);
  *(_QWORD *)(*(_QWORD *)(v35 + 16) + 8 * (**(_QWORD **)(v35 + 16) != v35)) = v36;
  *v36 = v35;
LABEL_98:
  *(_QWORD *)(v35 + 16) = v36;
LABEL_99:
  operator delete(v5);
  os_unfair_lock_unlock(&mav_router::device::pci_shim::mapLock);
  dispatch_release(v14);
}

void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_2(_QWORD *a1, int a2, void *a3, unsigned int a4)
{
  os_unfair_lock_s *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v7 = (os_unfair_lock_s *)a1[4];
  v8 = (std::__shared_weak_count *)a1[6];
  if (v8)
  {
    v10 = std::__shared_weak_count::lock(v8);
    if (v10 && a1[5])
    {
      if (a2)
        mav_router::device::pci_shim::handleError(v7);
      else
        mav_router::device::pci_shim::handleRead(v7, a3, a4);
LABEL_11:
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
  }
  else
  {
    v10 = 0;
  }
  if (!a2 && a3)
    free(a3);
  if (v10)
    goto LABEL_11;
}

void sub_20E5D277C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void mav_router::device::pci_shim::handleRead(os_unfair_lock_s *this, const void *a2, unsigned int a3)
{
  os_unfair_lock_s *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  uint32_t os_unfair_lock_opaque;
  uint64_t v12;
  int v13;
  unsigned int *v14;
  dispatch_data_t *v15;
  void (*v16)(uint64_t);
  unint64_t *p_shared_owners;
  unint64_t v18;
  dispatch_data_t v19;
  unint64_t v20;
  unint64_t v21;

  v6 = this + 12;
  os_unfair_lock_lock(this + 12);
  v7 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
  if (!v7)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v8 = std::__shared_weak_count::lock(v7);
  if (!v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = *(_QWORD *)&this[2]._os_unfair_lock_opaque;
LABEL_6:
  v19 = dispatch_data_create(a2, a3, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    os_unfair_lock_opaque = this[6]._os_unfair_lock_opaque;
    if (*(_DWORD *)(v10 + 4) > os_unfair_lock_opaque)
    {
      v12 = *(_QWORD *)(v10 + 16);
      v13 = *(_DWORD *)(v12 + 40 * os_unfair_lock_opaque + 16);
      if (v13)
      {
        if (v13 == 1)
        {
          v14 = *(unsigned int **)(v12 + 40 * os_unfair_lock_opaque + 8);
          if (!v14)
            goto LABEL_17;
          v15 = &v19;
          v16 = *(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 48 * *v14 + 16);
          if (!v16)
            goto LABEL_17;
LABEL_16:
          v16(v10);
          *v15 = 0;
          goto LABEL_17;
        }
        v20 = 0xAAAAAAAAAAAAAAAALL;
        v21 = 0xAAAAAAAAAAAAAAAALL;
        if (!mav_mux_decode(&v19, (uint64_t)&v20) && *(_DWORD *)v10 > v20)
        {
          v15 = (dispatch_data_t *)v21;
          v16 = *(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 48 * v20 + 16);
          if (v16)
            goto LABEL_16;
        }
      }
    }
  }
LABEL_17:
  os_unfair_lock_unlock(v6);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

uint64_t mav_router::device::pci_shim::handle_transmit(os_unfair_lock_s *this, dispatch_data_t data)
{
  dispatch_data_t v4;
  dispatch_data_t v5;
  os_unfair_lock_s *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t *v13;
  unsigned int (*v14)(os_unfair_lock_s *, void *, _QWORD, uint8_t *, uint64_t, uint64_t, void (*)(mav_router::device::pci_shim *, void *));
  os_unfair_lock_s *v15;
  unsigned int (*v16)(os_unfair_lock_s *, void *, _QWORD, uint8_t *, uint64_t, uint64_t, void (*)(mav_router::device::pci_shim *, void *));
  uint64_t v17;
  NSObject *v18;
  size_t v20;
  void *buffer_ptr;
  uint8_t buf[8];
  uint64_t v23;
  __int128 v24;
  int v25;
  __int16 v26;
  dispatch_data_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAAAAAAAAAALL;
  buffer_ptr = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v20);
  if (!v4)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v23 = 0x40000000;
    *(_QWORD *)&v24 = ____mav_log_platform_os_log_handle_block_invoke;
    *((_QWORD *)&v24 + 1) = &__block_descriptor_tmp_3;
    v25 = 3;
    if (qword_253DE9EC0 == -1)
    {
      v18 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
        return 7;
    }
    else
    {
      dispatch_once(&qword_253DE9EC0, buf);
      v18 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
        return 7;
    }
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    v23 = 0x400000000000400;
    LODWORD(v24) = 0;
    WORD2(v24) = 2080;
    *(_QWORD *)((char *)&v24 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::handle_transmit(mav_buffer_t)";
    HIWORD(v24) = 1024;
    v25 = 283;
    v26 = 2048;
    v27 = data;
    _os_log_impl(&dword_20E5D1000, v18, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:failed to create mapping of buffer %p", buf, 0x2Eu);
    return 7;
  }
  v5 = v4;
  dispatch_release(data);
  v6 = this + 12;
  os_unfair_lock_lock(this + 12);
  *(_DWORD *)buf = -1431655766;
  os_unfair_lock_lock(&mav_router::device::pci_shim::mapLock);
  v7 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&_MergedGlobals))
  {
    qword_253DE9F10 = 0;
    qword_253DE9F08 = 0;
    qword_253DE9F00 = (uint64_t)&qword_253DE9F08;
    __cxa_guard_release(&_MergedGlobals);
  }
  v8 = buffer_ptr;
  v9 = qword_253DE9F08;
  if (qword_253DE9F08)
  {
    while (1)
    {
      while (1)
      {
        v11 = (uint64_t *)v9;
        v12 = *(_QWORD *)(v9 + 32);
        if ((unint64_t)buffer_ptr >= v12)
          break;
        v9 = *v11;
        v10 = v11;
        if (!*v11)
          goto LABEL_10;
      }
      if (v12 >= (unint64_t)buffer_ptr)
        break;
      v9 = v11[1];
      if (!v9)
      {
        v10 = v11 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = &qword_253DE9F08;
    v11 = &qword_253DE9F08;
LABEL_10:
    v13 = (uint64_t *)operator new(0x30uLL);
    v13[4] = (uint64_t)v8;
    v13[5] = (uint64_t)v5;
    *v13 = 0;
    v13[1] = 0;
    v13[2] = (uint64_t)v11;
    *v10 = (uint64_t)v13;
    if (*(_QWORD *)qword_253DE9F00)
    {
      qword_253DE9F00 = *(_QWORD *)qword_253DE9F00;
      v13 = (uint64_t *)*v10;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_253DE9F08, v13);
    ++qword_253DE9F10;
  }
  os_unfair_lock_unlock(&mav_router::device::pci_shim::mapLock);
  v16 = *(unsigned int (**)(os_unfair_lock_s *, void *, _QWORD, uint8_t *, uint64_t, uint64_t, void (*)(mav_router::device::pci_shim *, void *)))&this[14]._os_unfair_lock_opaque;
  v15 = this + 14;
  v14 = v16;
  if (v16)
  {
    if (v14(v15, buffer_ptr, v20, buf, 1, 1000, mav_router::device::pci_shim::dtor))
      v17 = 0;
    else
      v17 = 7;
  }
  else
  {
    v17 = 7;
  }
  os_unfair_lock_unlock(v6);
  return v17;
}

_QWORD *mav_router::device::controller_mac::controller_mac(_QWORD *a1, _QWORD *a2)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_weak_owners;
  unint64_t v5;
  _QWORD v7[2];

  v3 = (std::__shared_weak_count *)a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
  }
  mav_router::device::controller::controller((uint64_t)a1, v7);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  *a1 = &off_24C971148;
  return a1;
}

{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_weak_owners;
  unint64_t v5;
  _QWORD v7[2];

  v3 = (std::__shared_weak_count *)a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
  }
  mav_router::device::controller::controller((uint64_t)a1, v7);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  *a1 = &off_24C971148;
  return a1;
}

void sub_20E5D2CA4(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(exception_object);
}

void sub_20E5D2D28(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(exception_object);
}

void mav_router::device::controller_mac::~controller_mac(mav_router::device::controller_mac *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller_mac *v4;
  uint64_t v5;
  mav_router::device::controller_mac *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  *(_QWORD *)this = &unk_24C9712B0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*((_QWORD *)this + 3))
  {
    v3 = *((_QWORD *)this + 1);
    v4 = (mav_router::device::controller_mac *)*((_QWORD *)this + 2);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        v6 = (mav_router::device::controller_mac *)*((_QWORD *)v4 + 1);
        v7 = (std::__shared_weak_count *)*((_QWORD *)v4 + 3);
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
        operator delete(v4);
        v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller_mac *v4;
  uint64_t v5;
  mav_router::device::controller_mac *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  *(_QWORD *)this = &unk_24C9712B0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*((_QWORD *)this + 3))
  {
    v3 = *((_QWORD *)this + 1);
    v4 = (mav_router::device::controller_mac *)*((_QWORD *)this + 2);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        v6 = (mav_router::device::controller_mac *)*((_QWORD *)v4 + 1);
        v7 = (std::__shared_weak_count *)*((_QWORD *)v4 + 3);
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
        operator delete(v4);
        v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller_mac *v4;
  uint64_t v5;
  mav_router::device::controller_mac *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  *(_QWORD *)this = &unk_24C9712B0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*((_QWORD *)this + 3))
  {
    v3 = *((_QWORD *)this + 1);
    v4 = (mav_router::device::controller_mac *)*((_QWORD *)this + 2);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        v6 = (mav_router::device::controller_mac *)*((_QWORD *)v4 + 1);
        v7 = (std::__shared_weak_count *)*((_QWORD *)v4 + 3);
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
        operator delete(v4);
        v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }
  operator delete(this);
}

void mav_router::device::controller_mac::init_routes(mav_router::device::controller_mac *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;
  int v23;
  unint64_t *p_shared_owners;
  unint64_t v25;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (!v2)
  {
    v3 = 0;
LABEL_9:
    v4 = 0;
    v5 = (unsigned int *)MEMORY[0x10];
    v7 = *MEMORY[0x10];
    LODWORD(v6) = *(_DWORD *)(MEMORY[0x10] + 4);
    if (v6 >= v7)
      v6 = v7;
    else
      v6 = v6;
    if (!(_DWORD)v7)
      goto LABEL_25;
    goto LABEL_13;
  }
  v3 = std::__shared_weak_count::lock(v2);
  if (!v3)
    goto LABEL_9;
  v4 = *((_QWORD *)this + 4);
  v5 = *(unsigned int **)(v4 + 16);
  v7 = *v5;
  LODWORD(v6) = v5[1];
  if (v6 >= v7)
    v6 = v7;
  else
    v6 = v6;
  if (!(_DWORD)v7)
    goto LABEL_25;
LABEL_13:
  v8 = 0;
  v9 = *((_QWORD *)v5 + 1);
  do
  {
    v10 = v9 + 48 * v8;
    v13 = *(_QWORD *)(v10 + 8);
    v11 = (_QWORD *)(v10 + 8);
    v12 = v13;
    if (v13)
    {
      v14 = *(_DWORD *)(v12 + 16);
      *(_DWORD *)(v12 + 16) = v14 - 1;
      if (v14 == 1)
      {
        *(_QWORD *)(v12 + 8) = 0;
      }
      else if (v14 == 2)
      {
        v15 = v7;
        v16 = v9;
        while (*(_QWORD *)(v16 + 8) != v12)
        {
          v16 += 48;
          if (!--v15)
          {
            *v11 = 0;
            goto LABEL_25;
          }
        }
        *(_QWORD *)(v12 + 8) = v16;
      }
      *v11 = 0;
    }
    ++v8;
  }
  while (v8 != v7);
LABEL_25:
  if ((_DWORD)v6)
  {
    v17 = *(unsigned int **)(v4 + 16);
    if (v17)
    {
      v18 = 0;
LABEL_29:
      if (v18 < *v17 && v18 < v17[1])
      {
        v21 = v17 + 2;
        v19 = *((_QWORD *)v17 + 1);
        v20 = *((_QWORD *)v21 + 1);
        v22 = v20 + 40 * v18;
        *(_QWORD *)(v19 + 48 * v18 + 8) = v22;
        v23 = *(_DWORD *)(v22 + 16);
        *(_DWORD *)(v22 + 16) = v23 + 1;
        if (!v23)
          *(_QWORD *)(v20 + 40 * v18 + 8) = v19 + 48 * v18;
      }
      while (++v18 != v6)
      {
        v17 = *(unsigned int **)(v4 + 16);
        if (v17)
          goto LABEL_29;
      }
    }
  }
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

uint64_t std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](uint64_t result)
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

uint64_t mav_router::device::controller_mac::get_channel_for_service()
{
  return 0;
}

uint64_t mav_router_device_register_transmit(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = 1;
  if (a1 && a3 && *(_DWORD *)(a1 + 4) > a2)
  {
    result = 0;
    v6 = *(_QWORD *)(a1 + 16) + 40 * a2;
    *(_QWORD *)(v6 + 24) = a3;
    *(_QWORD *)(v6 + 32) = a4;
  }
  return result;
}

uint64_t mav_router_device_receive(uint64_t a1, unsigned int a2, dispatch_data_t *a3)
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  unsigned int *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t result;
  unint64_t v10;
  unint64_t v11;

  if (!a1)
    return 1;
  if (*(_DWORD *)(a1 + 4) <= a2)
    return 1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_DWORD *)(v4 + 40 * a2 + 16);
  if (!v5)
    return 6;
  v6 = a3;
  if (v5 != 1)
  {
    v10 = 0xAAAAAAAAAAAAAAAALL;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    if (!mav_mux_decode(a3, (uint64_t)&v10) && *(_DWORD *)a1 > v10)
    {
      v6 = (_QWORD *)v11;
      v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 48 * v10 + 16);
      if (v8)
        goto LABEL_7;
      return 4;
    }
    return 1;
  }
  v7 = *(unsigned int **)(v4 + 40 * a2 + 8);
  if (v7)
  {
    v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 48 * *v7 + 16);
    if (v8)
    {
LABEL_7:
      result = v8(a1);
      *v6 = 0;
      return result;
    }
    return 4;
  }
  return 3;
}

uint64_t mav_router_device_error(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  void (*v13)(unsigned int *, unint64_t, uint64_t, _QWORD);

  if (!a1)
    return 1;
  if (a1[1] <= a2)
    return 1;
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *((_QWORD *)a1 + 1);
      v11 = *(_DWORD **)(v10 + v7 + 8);
      if (v11 && *v11 == a2)
      {
        v12 = v10 + v7;
        v13 = *(void (**)(unsigned int *, unint64_t, uint64_t, _QWORD))(v10 + v7 + 32);
        if (v13)
        {
          v13(a1, v8, a3, *(_QWORD *)(v12 + 40));
          v5 = *a1;
        }
        else
        {
          v9 = 4;
        }
      }
      ++v8;
      v7 += 48;
    }
    while (v8 < v5);
    return v9;
  }
  return 0;
}

const char *mav_router_channel_get_name_as_cstr(unsigned int a1)
{
  if (a1 > 0xA)
    return "unknown channel";
  else
    return mav_router_channel_cstrings[a1];
}

const char *mav_router_device_get_name_as_cstr(unsigned int a1)
{
  if (a1 > 0x10)
    return "unknown device";
  else
    return mav_router_device_cstrings[a1];
}

uint64_t mav_router::device::controller::create@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t (***v4)(_QWORD);
  uint64_t (***v5)(_QWORD);
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  _QWORD *v10;
  _QWORD v12[2];

  *a2 = 0;
  a2[1] = 0;
  v4 = (uint64_t (***)(_QWORD))operator new(0x50uLL);
  v5 = v4;
  v6 = *a1;
  v7 = (std::__shared_weak_count *)a1[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }
  mav_router::device::controller_ios::controller_ios((uint64_t)v4, v12);
  v10 = operator new(0x20uLL);
  *v10 = off_24C971500;
  v10[1] = 0;
  v10[2] = 0;
  v10[3] = v5;
  *a2 = v5;
  a2[1] = v10;
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
  return (**v5)(v5);
}

void sub_20E5D3508(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;

  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_20E5D3568(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t mav_router::device::controller::controller(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;

  *(_QWORD *)a1 = &unk_24C9712B0;
  *(_QWORD *)(a1 + 8) = a1 + 8;
  *(_QWORD *)(a1 + 16) = a1 + 8;
  *(_QWORD *)(a1 + 24) = 0;
  v3 = a2[1];
  *(_QWORD *)(a1 + 32) = *a2;
  *(_QWORD *)(a1 + 40) = v3;
  v4 = (unint64_t *)(v3 + 16);
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  v6 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 40));
  v7 = *(unsigned int **)(*(_QWORD *)(a1 + 32) + 16);
  bzero(*((void **)v7 + 1), 48 * *v7);
  v8 = *v7;
  if ((_DWORD)v8)
  {
    v9 = *((_QWORD *)v7 + 1);
    if ((_DWORD)v8 == 1)
    {
      v10 = 0;
LABEL_9:
      v13 = (_DWORD *)(v9 + 48 * v10);
      do
      {
        *v13 = v10;
        v13 += 12;
        ++v10;
      }
      while (v8 != v10);
      goto LABEL_11;
    }
    v11 = 0;
    v10 = v8 & 0xFFFFFFFE;
    v12 = (_DWORD *)*((_QWORD *)v7 + 1);
    do
    {
      *v12 = v11;
      v12[12] = v11 + 1;
      v11 += 2;
      v12 += 24;
    }
    while (v10 != v11);
    if (v10 != v8)
      goto LABEL_9;
  }
LABEL_11:
  bzero(*((void **)v7 + 2), 40 * v7[1]);
  v14 = v7[1];
  if (!(_DWORD)v14)
    goto LABEL_19;
  v15 = *((_QWORD *)v7 + 2);
  if ((_DWORD)v14 == 1)
  {
    v16 = 0;
LABEL_17:
    v19 = (_DWORD *)(v15 + 40 * v16);
    do
    {
      *v19 = v16;
      v19 += 10;
      ++v16;
    }
    while (v14 != v16);
    goto LABEL_19;
  }
  v17 = 0;
  v16 = v14 & 0xFFFFFFFE;
  v18 = (_DWORD *)*((_QWORD *)v7 + 2);
  do
  {
    *v18 = v17;
    v18[10] = v17 + 1;
    v17 += 2;
    v18 += 20;
  }
  while (v16 != v17);
  if (v16 != v14)
    goto LABEL_17;
LABEL_19:
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v21 = __ldaxr(p_shared_owners);
  while (__stlxr(v21 - 1, p_shared_owners));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  return a1;
}

void mav_router::device::controller::~controller(mav_router::device::controller *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller *v4;
  uint64_t v5;
  mav_router::device::controller *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  *(_QWORD *)this = &unk_24C9712B0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*((_QWORD *)this + 3))
  {
    v3 = *((_QWORD *)this + 1);
    v4 = (mav_router::device::controller *)*((_QWORD *)this + 2);
    v5 = *(_QWORD *)v4;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v5;
    *((_QWORD *)this + 3) = 0;
    if (v4 != (mav_router::device::controller *)((char *)this + 8))
    {
      do
      {
        v6 = (mav_router::device::controller *)*((_QWORD *)v4 + 1);
        v7 = (std::__shared_weak_count *)*((_QWORD *)v4 + 3);
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
        operator delete(v4);
        v4 = v6;
      }
      while (v6 != (mav_router::device::controller *)((char *)this + 8));
    }
  }
}

uint64_t mav_router::device::controller::engage(uint64_t a1, const void *a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *global_queue;
  _QWORD v9[6];
  uint8_t buf[8];
  uint64_t v11;
  __int128 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  v11 = 0x40000000;
  *(_QWORD *)&v12 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v12 + 1) = &__block_descriptor_tmp_3;
  v13 = 0;
  if (__mav_log_platform_os_log_handle::once[0] != -1)
    dispatch_once(__mav_log_platform_os_log_handle::once, buf);
  v5 = __mav_log_platform_os_log_handle::logger[0];
  if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = 0;
    v11 = 0x400000000010400;
    LODWORD(v12) = 0;
    WORD2(v12) = 2080;
    *(_QWORD *)((char *)&v12 + 6) = "virtual mav_router_result_t mav_router::device::controller::engage(engage_callback_t)";
    HIWORD(v12) = 1024;
    v13 = 53;
    _os_log_impl(&dword_20E5D1000, v5, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:engaging", buf, 0x24u);
  }
  v6 = _Block_copy(a2);
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = v4;
  v9[1] = 1107296256;
  v9[2] = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke;
  v9[3] = &__block_descriptor_tmp_4;
  v9[4] = v6;
  v9[5] = a1;
  dispatch_async(global_queue, v9);
  return 0;
}

void ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[7];
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, _QWORD *);
  void *v11;
  _QWORD *v12;
  NSObject *i;
  _QWORD v14[3];
  char v15;

  v2 = *(_QWORD *)(a1 + 40);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2000000000;
  v15 = 1;
  v3 = dispatch_group_create();
  v4 = v2 + 8;
  v5 = *(_QWORD *)(v2 + 16);
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v10 = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_2;
  v11 = &__block_descriptor_tmp;
  v12 = v14;
  for (i = v3; v5 != v4; v5 = *(_QWORD *)(v5 + 8))
    v10((uint64_t)v9, (_QWORD *)(v5 + 16));
  dispatch_retain(v3);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v6;
  block[1] = 1107296256;
  block[2] = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_1;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v14;
  block[6] = v3;
  dispatch_group_notify(v3, global_queue, block);
  dispatch_release(v3);
  _Block_object_dispose(v14, 8);
}

void sub_20E5D3A98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_2(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)*a2 + 24))(*a2, *(_QWORD *)(result + 40));
    v3 = (_DWORD)result == 0;
    v2 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

void ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_1(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v3 = 0;
  else
    v3 = 6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void __copy_helper_block_e8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
}

void __destroy_helper_block_e8_32b40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

uint64_t mav_router::device::controller::engage(mav_router::device::controller *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v16 = 0;
  v17 = 0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v17 = v3;
    if (v3)
    {
      v4 = *((_QWORD *)this + 4);
      v16 = v4;
      if (v4)
      {
        v5 = *(NSObject **)(v4 + 80);
        if (v5)
          dispatch_assert_queue_not_V2(v5);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = -1431655766;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = ___ZN10mav_router6device10controller6engageEv_block_invoke;
  v11[3] = &__block_descriptor_tmp_6;
  v11[4] = &v12;
  v11[5] = v6;
  v7 = (*(uint64_t (**)(mav_router::device::controller *, _QWORD *))(*(_QWORD *)this + 32))(this, v11);
  if ((_DWORD)v7)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
    _Block_object_dispose(&v12, 8);
    if (!v3)
      return v7;
  }
  else
  {
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *((unsigned int *)v13 + 6);
    dispatch_release(v6);
    _Block_object_dispose(&v12, 8);
    if (!v3)
      return v7;
  }
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (v10)
    return v7;
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return v7;
}

void sub_20E5D3D68(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void sub_20E5D3D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v7 - 48);
  _Unwind_Resume(a1);
}

void ___ZN10mav_router6device10controller6engageEv_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(v2 + 8) + 24) = a2;
  dispatch_group_leave(v3);
}

uint64_t mav_router::device::controller::tearDown(mav_router::device::controller *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t, _QWORD *);
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v2 = (char *)this + 8;
  v3 = (char *)*((_QWORD *)this + 2);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v7 = ___ZN10mav_router6device10controller8tearDownEv_block_invoke;
  v8 = &__block_descriptor_tmp_7;
  v9 = &v10;
  if (v3 == (char *)this + 8)
    goto LABEL_4;
  do
  {
    v7((uint64_t)v6, (_QWORD *)v3 + 2);
    v3 = (char *)*((_QWORD *)v3 + 1);
  }
  while (v3 != v2);
  if (*((_BYTE *)v11 + 24))
  {
LABEL_4:
    (**(void (***)(mav_router::device::controller *))this)(this);
    v4 = 0;
  }
  else
  {
    v4 = 6;
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_20E5D3E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E5D3EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller8tearDownEv_block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 32))(*a2);
    v3 = (_DWORD)result == 0;
    v2 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::recover(mav_router::device::controller *this)
{
  char *v1;
  char *v2;
  uint64_t v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t, _QWORD *);
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v1 = (char *)this + 8;
  v2 = (char *)*((_QWORD *)this + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v6 = ___ZN10mav_router6device10controller7recoverEv_block_invoke;
  v7 = &__block_descriptor_tmp_8;
  v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (_QWORD *)v2 + 2);
      v2 = (char *)*((_QWORD *)v2 + 1);
    }
    while (v2 != v1);
    if (*((_BYTE *)v10 + 24))
      v3 = 0;
    else
      v3 = 6;
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_20E5D3FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller7recoverEv_block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 40))(*a2);
    v3 = (_DWORD)result == 0;
    v2 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::enterLowPower(mav_router::device::controller *this)
{
  char *v1;
  char *v2;
  uint64_t v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t, _QWORD *);
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v1 = (char *)this + 8;
  v2 = (char *)*((_QWORD *)this + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v6 = ___ZN10mav_router6device10controller13enterLowPowerEv_block_invoke;
  v7 = &__block_descriptor_tmp_9;
  v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (_QWORD *)v2 + 2);
      v2 = (char *)*((_QWORD *)v2 + 1);
    }
    while (v2 != v1);
    if (*((_BYTE *)v10 + 24))
      v3 = 0;
    else
      v3 = 6;
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_20E5D40F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller13enterLowPowerEv_block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 48))(*a2);
    v3 = (_DWORD)result == 0;
    v2 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::exitLowPower(mav_router::device::controller *this)
{
  char *v1;
  char *v2;
  uint64_t v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t, _QWORD *);
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v1 = (char *)this + 8;
  v2 = (char *)*((_QWORD *)this + 2);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v6 = ___ZN10mav_router6device10controller12exitLowPowerEv_block_invoke;
  v7 = &__block_descriptor_tmp_10;
  v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (_QWORD *)v2 + 2);
      v2 = (char *)*((_QWORD *)v2 + 1);
    }
    while (v2 != v1);
    if (*((_BYTE *)v10 + 24))
      v3 = 0;
    else
      v3 = 6;
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_20E5D4224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller12exitLowPowerEv_block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 56))(*a2);
    v3 = (_DWORD)result == 0;
    v2 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::hasFatalErrorOccurred(mav_router::device::controller *this, BOOL *a2)
{
  uint64_t v2;
  char *v4;
  char *v5;
  char v6;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, _QWORD *);
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v2 = 1;
  v20 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  if (a2)
  {
    v4 = (char *)this + 8;
    v5 = (char *)*((_QWORD *)this + 2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v9 = ___ZN10mav_router6device10controller21hasFatalErrorOccurredEPb_block_invoke;
    v10 = &__block_descriptor_tmp_11;
    v11 = &v17;
    v12 = &v13;
    if (v5 == (char *)this + 8)
    {
      v6 = 0;
      v2 = 0;
    }
    else
    {
      do
      {
        v9((uint64_t)v8, (_QWORD *)v5 + 2);
        v5 = (char *)*((_QWORD *)v5 + 1);
      }
      while (v5 != v4);
      v6 = *((_BYTE *)v14 + 24);
      if (*((_BYTE *)v18 + 24))
        v2 = 0;
      else
        v2 = 6;
    }
    *a2 = v6;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v2;
}

void sub_20E5D438C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller21hasFatalErrorOccurredEPb_block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  BOOL v5;
  uint64_t v6;
  char v7;

  v2 = result;
  v7 = 0;
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_BYTE *)(v3 + 24);
  if (v4)
  {
    result = (*(uint64_t (**)(_QWORD, char *))(*(_QWORD *)*a2 + 64))(*a2, &v7);
    v5 = (_DWORD)result == 0;
    v3 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
    v4 = v7 != 0;
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)(v3 + 24) = v5;
  v6 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    v4 = 1;
  *(_BYTE *)(v6 + 24) = v4;
  return result;
}

void __copy_helper_block_e8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
}

void __destroy_helper_block_e8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t mav_router::device::controller::getFatalErrorReason(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  size_t v7;
  __int128 v8;
  size_t v9;
  __int128 *v10;
  __int128 *v11;
  size_t v12;
  int v13;
  uint64_t v14;
  _QWORD v16[2];
  void (*v17)(uint64_t, _QWORD *);
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  void *__p;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v29 = 0;
  v30 = &v29;
  v3 = &v21;
  v31 = 0x2000000000;
  v32 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x4002000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v27 = 0;
  v28 = 0;
  __p = 0;
  v4 = a1 + 8;
  v5 = *(_QWORD *)(a1 + 16);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v17 = ___ZN10mav_router6device10controller19getFatalErrorReasonERNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
  v18 = &__block_descriptor_tmp_14;
  v19 = &v29;
  v20 = &v21;
  if (v5 != a1 + 8)
  {
    do
    {
      v17((uint64_t)v16, (_QWORD *)(v5 + 16));
      v5 = *(_QWORD *)(v5 + 8);
    }
    while (v5 != v4);
    v3 = v22;
  }
  v6 = (__int128 *)(v3 + 5);
  if (v3 + 5 != (uint64_t *)a2)
  {
    v7 = *((unsigned __int8 *)v3 + 63);
    if (*(char *)(a2 + 23) < 0)
    {
      v10 = (__int128 *)v3[5];
      v9 = v3[6];
      if ((v7 & 0x80u) == 0)
        v11 = v6;
      else
        v11 = v10;
      if ((v7 & 0x80u) == 0)
        v12 = v7;
      else
        v12 = v9;
      std::string::__assign_no_alias<false>((void **)a2, v11, v12);
    }
    else if ((v7 & 0x80) != 0)
    {
      std::string::__assign_no_alias<true>((_QWORD *)a2, (void *)v3[5], v3[6]);
    }
    else
    {
      v8 = *v6;
      *(_QWORD *)(a2 + 16) = v3[7];
      *(_OWORD *)a2 = v8;
    }
  }
  v13 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&v21, 8);
  if (SHIBYTE(v28) < 0)
    operator delete(__p);
  if (v13)
    v14 = 0;
  else
    v14 = 6;
  _Block_object_dispose(&v29, 8);
  return v14;
}

void sub_20E5D461C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  _Block_object_dispose(&a15, 8);
  if (a25 < 0)
    operator delete(__p);
  _Block_object_dispose((const void *)(v25 - 64), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
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

void __Block_byref_object_dispose_(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void ___ZN10mav_router6device10controller19getFatalErrorReasonERNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  BOOL v7;
  unsigned int v8;
  const char *v9;
  size_t v10;
  std::string::size_type v11;
  std::string *p_dst;
  uint64_t v13;
  uint64_t v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  const std::string::value_type *v19;
  std::string::size_type v20;
  std::string *v21;
  __int128 v22;
  void **v23;
  std::string::size_type v24;
  std::string __dst;
  std::string v26;
  std::string v27;
  void *__p[2];
  int64_t v29;
  int v30;
  std::string::value_type *v31;
  std::string::size_type v32;
  uint64_t v33;

  v32 = 0;
  v33 = 0;
  v31 = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_BYTE *)(v4 + 24);
  if (v5)
  {
    v5 = (*(unsigned int (**)(_QWORD, std::string::value_type **))(*(_QWORD *)*a2 + 72))(*a2, &v31) == 0;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v4 + 24) = v5;
  v30 = 16;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = (*(unsigned int (**)(_QWORD, int *))(*(_QWORD *)*a2 + 96))(*a2, &v30) == 0;
    v8 = v30;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    if (v8 > 0x10)
    {
      v9 = "unknown device";
      goto LABEL_8;
    }
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
    v8 = 16;
  }
  v9 = mav_router_device_cstrings[v8];
LABEL_8:
  v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_15;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10)
LABEL_15:
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  v15 = std::string::insert(&__dst, 0, "\n", 1uLL);
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v17 = std::string::append(&v26, ":  ", 3uLL);
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  if (v33 >= 0)
    v19 = (const std::string::value_type *)&v31;
  else
    v19 = v31;
  if (v33 >= 0)
    v20 = HIBYTE(v33);
  else
    v20 = v32;
  v21 = std::string::append(&v27, v19, v20);
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v29 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  if (v29 >= 0)
    v23 = __p;
  else
    v23 = (void **)__p[0];
  if (v29 >= 0)
    v24 = HIBYTE(v29);
  else
    v24 = (std::string::size_type)__p[1];
  std::string::append((std::string *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (const std::string::value_type *)v23, v24);
  if (SHIBYTE(v29) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_30:
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_31;
      goto LABEL_36;
    }
  }
  else if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  operator delete(v27.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_31:
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_32;
    goto LABEL_37;
  }
LABEL_36:
  operator delete(v26.__r_.__value_.__l.__data_);
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_32:
    if ((SHIBYTE(v33) & 0x80000000) == 0)
      return;
LABEL_38:
    operator delete(v31);
    return;
  }
LABEL_37:
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33) < 0)
    goto LABEL_38;
}

void sub_20E5D4934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;

  if ((*(char *)(v35 - 49) & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(*(void **)(v35 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t mav_router::device::controller::getMaxPayload(mav_router::device::controller *this, unint64_t *a2)
{
  char *v2;
  uint64_t v3;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;

  *a2 = -1;
  v2 = (char *)this + 8;
  v3 = *((_QWORD *)this + 2);
  if ((mav_router::device::controller *)v3 == (mav_router::device::controller *)((char *)this + 8))
    return 0;
  LOBYTE(v5) = 1;
  v6 = -1;
  do
  {
    v9 = 0;
    if (v5)
    {
      v5 = (*(uint64_t (**)(_QWORD, unint64_t *))(**(_QWORD **)(v3 + 16) + 88))(*(_QWORD *)(v3 + 16), &v9) == 0;
      v7 = v9;
      v6 = *a2;
    }
    else
    {
      v7 = 0;
      v5 = 0;
    }
    if (v7 < v6)
      v6 = v7;
    *a2 = v6;
    v3 = *(_QWORD *)(v3 + 8);
  }
  while ((char *)v3 != v2);
  if (v5)
    return 0;
  else
    return 6;
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
  __cxa_throw(exception, (struct type_info *)off_24C970F80, MEMORY[0x24BEDAAF0]);
}

void sub_20E5D4B28(_Unwind_Exception *a1)
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

void std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020E5DCB44)
    return a1 + 24;
  if (((v3 & 0x800000020E5DCB44 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000020E5DCB44))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020E5DCB44 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t mav_router::device::shim::shim(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)a1 = off_24C971560;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v6 = (unint64_t *)(v5 + 16);
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
  v8 = *(std::__shared_weak_count **)(a1 + 16);
  *(_DWORD *)(a1 + 24) = a3;
  v9 = std::__shared_weak_count::lock(v8);
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  if (v11)
  {
    v12 = *(_DWORD *)(a1 + 24);
    if (*(_DWORD *)(v11 + 4) > v12)
    {
      v13 = *(_QWORD *)(v11 + 16) + 40 * v12;
      *(_QWORD *)(v13 + 24) = mav_router::device::shim::handle_transmit_static;
      *(_QWORD *)(v13 + 32) = a1;
    }
  }
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v10);
  }
  return a1;
}

void mav_router::device::shim::register_for_transmit(std::__shared_weak_count **this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t shared_weak_owners;
  unsigned int v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = std::__shared_weak_count::lock(this[2]);
  v3 = v2;
  shared_weak_owners = this[1]->__shared_weak_owners_;
  if (shared_weak_owners)
  {
    v5 = *((_DWORD *)this + 6);
    if (*(_DWORD *)(shared_weak_owners + 4) > v5)
    {
      v6 = *(_QWORD *)(shared_weak_owners + 16) + 40 * v5;
      *(_QWORD *)(v6 + 24) = mav_router::device::shim::handle_transmit_static;
      *(_QWORD *)(v6 + 32) = this;
    }
  }
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void mav_router::device::shim::~shim(mav_router::device::shim *this)
{
  std::__shared_weak_count *v1;

  *(_QWORD *)this = off_24C971560;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t mav_router::device::shim::getDevice(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 1;
  result = 0;
  *a2 = *(_DWORD *)(a1 + 24);
  return result;
}

BOOL mav_router_channel_is_valid(unsigned int *a1, unsigned int a2)
{
  return !a1 || *a1 <= a2;
}

BOOL mav_router_device_is_valid(uint64_t a1, unsigned int a2)
{
  return !a1 || *(_DWORD *)(a1 + 4) <= a2;
}

uint64_t mav_router_get_device_muxed(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;

  result = 1;
  if (a1 && a3 && *(_DWORD *)(a1 + 4) > a2)
  {
    result = 0;
    *a3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 40 * a2 + 16) > 1u;
  }
  return result;
}

uint64_t *mav_router::device::pci_shim::getDataBufferMap(mav_router::device::pci_shim *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v1 & 1) != 0 || !__cxa_guard_acquire(&_MergedGlobals))
    return &qword_253DE9F00;
  qword_253DE9F10 = 0;
  qword_253DE9F08 = 0;
  qword_253DE9F00 = (uint64_t)&qword_253DE9F08;
  __cxa_guard_release(&_MergedGlobals);
  return &qword_253DE9F00;
}

uint64_t *mav_router::device::pci_shim::getIntToPCITransportMap(mav_router::device::pci_shim *this)
{
  unsigned __int8 v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = atomic_load((unsigned __int8 *)&qword_253DE9EF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_253DE9EF8))
  {
    v7 = xmmword_20E5DCBD0;
    std::map<unsigned int,PCITransportInterface>::map[abi:ne180100](&v4, (unsigned int *)&v7, 2);
    v3 = (_QWORD *)v5;
    qword_253DE9F18 = (uint64_t)v4;
    qword_253DE9F20 = v5;
    qword_253DE9F28 = v6;
    if (v6)
    {
      *(_QWORD *)(v5 + 16) = &qword_253DE9F20;
      v4 = &v5;
      v5 = 0;
      v6 = 0;
      v3 = 0;
    }
    else
    {
      qword_253DE9F18 = (uint64_t)&qword_253DE9F20;
    }
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(v3);
    __cxa_guard_release(&qword_253DE9EF8);
  }
  return &qword_253DE9F18;
}

void sub_20E5D51AC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253DE9EF8);
  _Unwind_Resume(a1);
}

uint64_t mav_router::device::pci_shim::pci_shim(uint64_t a1, uint64_t *a2, int a3, uint64_t a4)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::string *v20;
  __int128 v21;
  NSObject *v22;

  v6 = *a2;
  v7 = (std::__shared_weak_count *)a2[1];
  if (v7)
  {
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }
  *(_QWORD *)a1 = off_24C971560;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v10 = (unint64_t *)&v7->__shared_weak_owners_;
  do
    v11 = __ldxr(v10);
  while (__stxr(v11 + 1, v10));
  v12 = *(std::__shared_weak_count **)(a1 + 16);
  *(_DWORD *)(a1 + 24) = a3;
  v13 = std::__shared_weak_count::lock(v12);
  v14 = v13;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  if (v15)
  {
    v16 = *(_DWORD *)(a1 + 24);
    if (*(_DWORD *)(v15 + 4) > v16)
    {
      v17 = *(_QWORD *)(v15 + 16) + 40 * v16;
      *(_QWORD *)(v17 + 24) = mav_router::device::shim::handle_transmit_static;
      *(_QWORD *)(v17 + 32) = a1;
    }
  }
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v14);
  }
  std::__shared_weak_count::__release_weak(v7);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)a1 = off_24C9715E8;
  *(_DWORD *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_QWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 144) = *(_DWORD *)a4;
  v20 = (std::string *)(a1 + 152);
  if (*(char *)(a4 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v20, *(const std::string::value_type **)(a4 + 16), *(_QWORD *)(a4 + 24));
  }
  else
  {
    v21 = *(_OWORD *)(a4 + 16);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a4 + 32);
    *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
  }
  v22 = *(NSObject **)(a4 + 48);
  *(_QWORD *)(a1 + 176) = v22;
  if (v22)
    dispatch_retain(v22);
  *(_DWORD *)(a1 + 184) = *(_DWORD *)(a4 + 56);
  *(_BYTE *)(a1 + 215) = 0;
  *(_BYTE *)(a1 + 192) = 0;
  return a1;
}

void sub_20E5D533C(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;

  v4 = (std::__shared_weak_count *)v1[5];
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
    *v1 = v2 + 16;
    v5 = (std::__shared_weak_count *)v1[2];
    if (!v5)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    *v1 = v2 + 16;
    v5 = (std::__shared_weak_count *)v1[2];
    if (!v5)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(exception_object);
}

void mav_router::device::pci_shim::~pci_shim(mav_router::device::pci_shim *this)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_24C9715E8;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    v2 = *((_QWORD *)this + 22);
    if (!v2)
      goto LABEL_4;
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  v2 = *((_QWORD *)this + 22);
  if (v2)
LABEL_3:
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v3)
LABEL_6:
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(_QWORD *)this = off_24C971560;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_24C9715E8;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    v2 = *((_QWORD *)this + 22);
    if (!v2)
      goto LABEL_4;
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  v2 = *((_QWORD *)this + 22);
  if (v2)
LABEL_3:
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v3)
LABEL_6:
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(_QWORD *)this = off_24C971560;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_24C9715E8;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    v2 = *((_QWORD *)this + 22);
    if (!v2)
      goto LABEL_4;
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  v2 = *((_QWORD *)this + 22);
  if (v2)
LABEL_3:
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v3)
LABEL_6:
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(_QWORD *)this = off_24C971560;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(this);
}

uint64_t mav_router::device::pci_shim::init(mav_router::device::pci_shim *this)
{
  NSObject *v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v6 = 0x40000000;
  *(_QWORD *)&v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v7 + 1) = &__block_descriptor_tmp_3;
  v8 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v5);
  v2 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    v3 = *((_DWORD *)this + 36);
    v5 = 0x304000602;
    v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(_QWORD *)((char *)&v7 + 6) = "BOOL mav_router::device::pci_shim::init()";
    HIWORD(v7) = 1024;
    v8 = 67;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 1;
}

uint64_t mav_router::device::pci_shim::engage(mav_router::device::pci_shim *this, dispatch_group_s *a2)
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  os_unfair_lock_s *v15;
  __int128 v16;
  mav_router::device::pci_shim *inited;
  uint64_t *IntToPCITransportMap;
  uint64_t v19;
  unsigned int v20;
  uint64_t *v21;
  unsigned int v22;
  BOOL v23;
  uint64_t *v24;
  capabilities::radio *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  _QWORD v34[6];
  std::__shared_weak_count *v35;
  _QWORD v36[6];
  std::__shared_weak_count *v37;
  uint8_t block[8];
  uint64_t v39;
  __int128 v40;
  int v41;
  __int16 v42;
  int v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)this + 22);
  if (v3)
    dispatch_assert_queue_not_V2(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (!v4 || (v5 = *((_QWORD *)this + 4), (v6 = std::__shared_weak_count::lock(v4)) == 0))
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
  v12 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 0x40000000;
  *(_QWORD *)&v45 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v45 + 1) = &__block_descriptor_tmp_3;
  LODWORD(v46) = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, buf);
  v13 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    v14 = *((_DWORD *)this + 36);
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 1;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v45) = 0;
    WORD2(v45) = 2080;
    *(_QWORD *)((char *)&v45 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v45) = 1024;
    LODWORD(v46) = 121;
    WORD2(v46) = 1024;
    *(_DWORD *)((char *)&v46 + 6) = v14;
    _os_log_impl(&dword_20E5D1000, v13, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", buf, 0x2Au);
  }
  v15 = (os_unfair_lock_s *)((char *)this + 48);
  os_unfair_lock_lock((os_unfair_lock_t)this + 12);
  v49 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47 = v16;
  v48 = v16;
  v45 = v16;
  v46 = v16;
  *(_OWORD *)buf = v16;
  inited = (mav_router::device::pci_shim *)TelephonyBasebandPCITransportInitParameters();
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_QWORD *)this + 17) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_QWORD *)&v45 = &__block_literal_global;
  IntToPCITransportMap = mav_router::device::pci_shim::getIntToPCITransportMap(inited);
  v19 = qword_253DE9F20;
  if (!qword_253DE9F20)
    goto LABEL_26;
  v20 = *((_DWORD *)this + 36);
  v21 = &qword_253DE9F20;
  do
  {
    v22 = *(_DWORD *)(v19 + 28);
    v23 = v22 >= v20;
    if (v22 >= v20)
      v24 = (uint64_t *)v19;
    else
      v24 = (uint64_t *)(v19 + 8);
    if (v23)
      v21 = (uint64_t *)v19;
    v19 = *v24;
  }
  while (*v24);
  if (v21 == &qword_253DE9F20 || v20 < *((_DWORD *)v21 + 7))
LABEL_26:
    v21 = &qword_253DE9F20;
  mav_router::device::pci_shim::getIntToPCITransportMap((mav_router::device::pci_shim *)IntToPCITransportMap);
  if (v21 == &qword_253DE9F20)
  {
    *(_QWORD *)block = v12;
    v39 = 0x40000000;
    *(_QWORD *)&v40 = ____mav_log_platform_os_log_handle_block_invoke;
    *((_QWORD *)&v40 + 1) = &__block_descriptor_tmp_3;
    v41 = 3;
    if (qword_253DE9EC0 == -1)
    {
      v30 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
      {
LABEL_42:
        os_unfair_lock_unlock((os_unfair_lock_t)this + 12);
        v28 = 7;
        goto LABEL_50;
      }
    }
    else
    {
      dispatch_once(&qword_253DE9EC0, block);
      v30 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
        goto LABEL_42;
    }
    v31 = *((_DWORD *)this + 36);
    *(_DWORD *)block = 67110402;
    *(_DWORD *)&block[4] = 3;
    v39 = 0x400000000000400;
    LODWORD(v40) = 0;
    WORD2(v40) = 2080;
    *(_QWORD *)((char *)&v40 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v40) = 1024;
    v41 = 138;
    v42 = 1024;
    v43 = v31;
    _os_log_impl(&dword_20E5D1000, v30, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:invalid interface %u", block, 0x2Au);
    goto LABEL_42;
  }
  *(_DWORD *)buf = *((_DWORD *)v21 + 8);
  DWORD2(v45) = 5000;
  LODWORD(v46) = v46 | 4;
  v25 = (capabilities::radio *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  *(_QWORD *)((char *)&v46 + 4) = 0x180000000008;
  if (capabilities::radio::mavLegacy(v25))
    DWORD1(v46) = 4;
  v36[0] = v12;
  v36[1] = 1174405120;
  v36[2] = ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_2;
  v36[3] = &__block_descriptor_tmp_4_0;
  v36[4] = this;
  v36[5] = v5;
  v37 = v7;
  do
    v26 = __ldxr(p_shared_weak_owners);
  while (__stxr(v26 + 1, p_shared_weak_owners));
  *(_QWORD *)&v47 = v36;
  v34[0] = v12;
  v34[1] = 1174405120;
  v34[2] = ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_5;
  v34[3] = &__block_descriptor_tmp_6_0;
  v34[4] = this;
  v34[5] = v5;
  v35 = v7;
  do
    v27 = __ldxr(p_shared_weak_owners);
  while (__stxr(v27 + 1, p_shared_weak_owners));
  *((_QWORD *)&v47 + 1) = v34;
  *(_QWORD *)&v48 = 0;
  if (*((_QWORD *)this + 22))
    *((_QWORD *)&v48 + 1) = *((_QWORD *)this + 22);
  LODWORD(v49) = *((_DWORD *)this + 46);
  if ((TelephonyBasebandPCITransportCreate() & 1) == 0)
  {
    *(_QWORD *)block = v12;
    v39 = 0x40000000;
    *(_QWORD *)&v40 = ____mav_log_platform_os_log_handle_block_invoke;
    *((_QWORD *)&v40 + 1) = &__block_descriptor_tmp_3;
    v41 = 3;
    if (qword_253DE9EC0 == -1)
    {
      v32 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
        goto LABEL_46;
    }
    else
    {
      dispatch_once(&qword_253DE9EC0, block);
      v32 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
      {
LABEL_46:
        v28 = 7;
        os_unfair_lock_unlock(v15);
        v29 = v35;
        if (!v35)
          goto LABEL_48;
        goto LABEL_47;
      }
    }
    *(_DWORD *)block = 67110146;
    *(_DWORD *)&block[4] = 3;
    v39 = 0x400000000000400;
    LODWORD(v40) = 0;
    WORD2(v40) = 2080;
    *(_QWORD *)((char *)&v40 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v40) = 1024;
    v41 = 187;
    _os_log_impl(&dword_20E5D1000, v32, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:failed to create pci transport", block, 0x24u);
    goto LABEL_46;
  }
  v28 = 0;
  os_unfair_lock_unlock(v15);
  v29 = v35;
  if (v35)
LABEL_47:
    std::__shared_weak_count::__release_weak(v29);
LABEL_48:
  if (v37)
    std::__shared_weak_count::__release_weak(v37);
LABEL_50:
  std::__shared_weak_count::__release_weak(v7);
  return v28;
}

void sub_20E5D5C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v24;

  if (a15)
  {
    std::__shared_weak_count::__release_weak(a15);
    v24 = a22;
    if (!a22)
    {
LABEL_3:
      std::__shared_weak_count::__release_weak(v22);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v24 = a22;
    if (!a22)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v24);
  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_20E5D5C80(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void sub_20E5D5C94(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void sub_20E5D5CA8(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = MEMORY[0x24BDAC760];
  v9 = 0x40000000;
  *(_QWORD *)&v10 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v10 + 1) = &__block_descriptor_tmp_3;
  v11 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v8);
  v7 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    v8 = 0x304000802;
    v9 = 0x400000000010400;
    WORD2(v10) = 2080;
    LODWORD(v10) = 0;
    *(_QWORD *)((char *)&v10 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)_block_invoke";
    HIWORD(v10) = 1024;
    v11 = 132;
    v12 = 1024;
    v13 = a2;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_20E5D1000, v7, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:status %u, arg1 %p, arg2 %p", (uint8_t *)&v8, 0x3Eu);
  }
}

uint64_t mav_router::device::pci_shim::handleError(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  size_t v14;
  void **v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  size_t v21;
  void *v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  unsigned int *v32;
  os_unfair_lock_s *v33;
  uint32_t os_unfair_lock_opaque;
  unint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void **v41;
  uint32_t v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  uint64_t v46;
  _DWORD *v47;
  void (*v48)(unsigned int *, unint64_t, os_unfair_lock_s *, _QWORD);
  void (**v49)(unsigned int *, unint64_t, os_unfair_lock_s *, _QWORD);
  _DWORD *v50;
  uint64_t v51;
  int v52;
  void *__dst[2];
  int64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *__p[2];
  __int128 v61;
  unint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[8];
  uint64_t v74;
  __int128 v75;
  int v76;
  __int16 v77;
  void **v78;
  __int16 v79;
  uint32_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v2 = this + 12;
  os_unfair_lock_lock(this + 12);
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v62 = 0xAAAAAAAAAAAAAAAALL;
  v72 = v3;
  v71 = v3;
  v70 = v3;
  v69 = v3;
  v68 = v3;
  v67 = v3;
  v66 = v3;
  v65 = v3;
  v64 = v3;
  *(_OWORD *)__p = v3;
  v61 = v3;
  v58 = v3;
  v59 = v3;
  v56 = v3;
  v57 = v3;
  v4 = MEMORY[0x24BEDB870];
  v5 = MEMORY[0x24BEDB870] + 64;
  v63 = MEMORY[0x24BEDB870] + 64;
  v6 = (uint64_t *)MEMORY[0x24BEDB800];
  v7 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v55 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v55 + *(_QWORD *)(v55 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v55 + *(_QWORD *)(v55 - 24));
  std::ios_base::init(v8, &v56);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v55 = v4 + 24;
  v63 = v5;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v56 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v61 = 0u;
  LODWORD(v62) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v55, (uint64_t)"pci error: ", 11);
  v10 = (_QWORD *)std::ostream::operator<<();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)". failed on I/O 0x", 18);
  *(_DWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 8) = *(_DWORD *)((_BYTE *)v11 + *(_QWORD *)(*v11 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  v74 = 0x40000000;
  *(_QWORD *)&v75 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v75 + 1) = &__block_descriptor_tmp_3;
  v76 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, buf);
  v12 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    if ((v62 & 0x10) != 0)
    {
      v16 = *((_QWORD *)&v61 + 1);
      if (*((_QWORD *)&v61 + 1) < (unint64_t)v59)
      {
        *((_QWORD *)&v61 + 1) = v59;
        v16 = v59;
      }
      v17 = (const void *)*((_QWORD *)&v58 + 1);
      v14 = v16 - *((_QWORD *)&v58 + 1);
      if ((unint64_t)(v16 - *((_QWORD *)&v58 + 1)) > 0x7FFFFFFFFFFFFFF7)
        goto LABEL_48;
    }
    else
    {
      if ((v62 & 8) == 0)
      {
        v13 = v9;
        v14 = 0;
        HIBYTE(v54) = 0;
        v15 = __dst;
        goto LABEL_17;
      }
      v17 = (const void *)v57;
      v14 = v58 - v57;
      if ((_QWORD)v58 - (_QWORD)v57 > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_48:
        std::string::__throw_length_error[abi:ne180100]();
    }
    v13 = v9;
    if (v14 >= 0x17)
    {
      v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v18 = v14 | 7;
      v19 = v18 + 1;
      v15 = (void **)operator new(v18 + 1);
      __dst[1] = (void *)v14;
      v54 = v19 | 0x8000000000000000;
      __dst[0] = v15;
      v6 = (uint64_t *)MEMORY[0x24BEDB800];
    }
    else
    {
      HIBYTE(v54) = v14;
      v15 = __dst;
      if (!v14)
        goto LABEL_17;
    }
    memmove(v15, v17, v14);
LABEL_17:
    *((_BYTE *)v15 + v14) = 0;
    v20 = __dst;
    if (v54 < 0)
      v20 = (void **)__dst[0];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    v74 = 0x400000000010400;
    LODWORD(v75) = 0;
    WORD2(v75) = 2080;
    *(_QWORD *)((char *)&v75 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
    HIWORD(v75) = 1024;
    v76 = 353;
    v77 = 2080;
    v78 = v20;
    _os_log_impl(&dword_20E5D1000, v12, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:got error (%s)", buf, 0x2Eu);
    if (SHIBYTE(v54) < 0)
      operator delete(__dst[0]);
    v9 = v13;
  }
  if ((v62 & 0x10) != 0)
  {
    v23 = *((_QWORD *)&v61 + 1);
    if (*((_QWORD *)&v61 + 1) < (unint64_t)v59)
    {
      *((_QWORD *)&v61 + 1) = v59;
      v23 = v59;
    }
    v24 = (const void *)*((_QWORD *)&v58 + 1);
    v21 = v23 - *((_QWORD *)&v58 + 1);
    if ((unint64_t)(v23 - *((_QWORD *)&v58 + 1)) > 0x7FFFFFFFFFFFFFF7)
      goto LABEL_46;
  }
  else
  {
    if ((v62 & 8) == 0)
    {
      v21 = 0;
      BYTE7(v75) = 0;
      v22 = buf;
      goto LABEL_35;
    }
    v24 = (const void *)v57;
    v21 = v58 - v57;
    if ((_QWORD)v58 - (_QWORD)v57 > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_46:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v21 >= 0x17)
  {
    v25 = v9;
    v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v26 = v21 | 7;
    v27 = v26 + 1;
    v22 = operator new(v26 + 1);
    v74 = v21;
    *(_QWORD *)&v75 = v27 | 0x8000000000000000;
    *(_QWORD *)buf = v22;
    v9 = v25;
    goto LABEL_34;
  }
  BYTE7(v75) = v21;
  v22 = buf;
  if (v21)
LABEL_34:
    memmove(v22, v24, v21);
LABEL_35:
  *((_BYTE *)v22 + v21) = 0;
  mav_router::device::pci_shim::setErrorReason_sync((uint64_t)this, (void **)buf);
  if (SBYTE7(v75) < 0)
  {
    operator delete(*(void **)buf);
    v28 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
    if (!v28)
    {
LABEL_44:
      os_unfair_lock_unlock(v2);
      goto LABEL_64;
    }
  }
  else
  {
    v28 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
    if (!v28)
      goto LABEL_44;
  }
  v29 = std::__shared_weak_count::lock(v28);
  if (!v29)
    goto LABEL_44;
  v30 = v29;
  v31 = *(_QWORD *)&this[2]._os_unfair_lock_opaque;
  if (!v31)
    goto LABEL_60;
  v32 = *(unsigned int **)(v31 + 16);
  v33 = this + 48;
  if (SHIBYTE(this[53]._os_unfair_lock_opaque) < 0)
  {
    v33 = *(os_unfair_lock_s **)&v33->_os_unfair_lock_opaque;
    if (!v32)
      goto LABEL_53;
  }
  else if (!v32)
  {
    goto LABEL_53;
  }
  os_unfair_lock_opaque = this[6]._os_unfair_lock_opaque;
  if (v32[1] > os_unfair_lock_opaque)
  {
    v35 = *v32;
    if (!(_DWORD)v35)
      goto LABEL_60;
    v51 = *(_QWORD *)&this[2]._os_unfair_lock_opaque;
    v36 = 0;
    v52 = 0;
    do
    {
      v46 = *((_QWORD *)v32 + 1);
      v47 = *(_DWORD **)(v46 + 48 * v36 + 8);
      if (v47 && *v47 == os_unfair_lock_opaque)
      {
        v48 = *(void (**)(unsigned int *, unint64_t, os_unfair_lock_s *, _QWORD))(v46 + 48 * v36 + 32);
        if (v48)
        {
LABEL_68:
          v48(v32, v36, v33, *(_QWORD *)(v46 + 48 * v36 + 40));
          v35 = *v32;
        }
        else
        {
          if (v36 + 1 >= v35)
          {
LABEL_81:
            v37 = 4;
            v9 = MEMORY[0x24BEDB848];
            v31 = v51;
            goto LABEL_54;
          }
          v49 = (void (**)(unsigned int *, unint64_t, os_unfair_lock_s *, _QWORD))(v46 + 48 * v36++ + 80);
          while (1)
          {
            v50 = *(v49 - 3);
            if (!v50 || *v50 != os_unfair_lock_opaque)
              break;
            v48 = *v49;
            if (*v49)
            {
              v52 = 4;
              goto LABEL_68;
            }
            ++v36;
            v49 += 6;
            if (v36 >= v35)
              goto LABEL_81;
          }
          v52 = 4;
        }
      }
      ++v36;
    }
    while (v36 < v35);
    v9 = MEMORY[0x24BEDB848];
    v37 = v52;
    v31 = v51;
    if (!v52)
      goto LABEL_60;
    goto LABEL_54;
  }
LABEL_53:
  v37 = 1;
LABEL_54:
  v38 = v31;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  v74 = 0x40000000;
  *(_QWORD *)&v75 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v75 + 1) = &__block_descriptor_tmp_3;
  v76 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, buf);
  v39 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    v74 = 0x400000000010400;
    LODWORD(v75) = 0;
    WORD2(v75) = 2080;
    *(_QWORD *)((char *)&v75 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
    HIWORD(v75) = 1024;
    v76 = 364;
    v77 = 1024;
    LODWORD(v78) = v37;
    _os_log_impl(&dword_20E5D1000, v39, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:mav_router_device_error returned 0x%x", buf, 0x2Au);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v74 = 0x40000000;
    *(_QWORD *)&v75 = ____mav_log_platform_os_log_handle_block_invoke;
    *((_QWORD *)&v75 + 1) = &__block_descriptor_tmp_3;
    v76 = 3;
    if (qword_253DE9EC0 != -1)
    {
      dispatch_once(&qword_253DE9EC0, buf);
      v40 = qword_253DE9EE0;
      if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
        goto LABEL_60;
      goto LABEL_59;
    }
  }
  v40 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
LABEL_59:
    v41 = *(void ***)(v38 + 16);
    v42 = this[6]._os_unfair_lock_opaque;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)&buf[4] = 3;
    v74 = 0x400000000010400;
    LODWORD(v75) = 0;
    WORD2(v75) = 2080;
    *(_QWORD *)((char *)&v75 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
    HIWORD(v75) = 1024;
    v76 = 366;
    v77 = 2048;
    v78 = v41;
    v79 = 1024;
    v80 = v42;
    _os_log_impl(&dword_20E5D1000, v40, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:router %p, device %u", buf, 0x34u);
  }
LABEL_60:
  os_unfair_lock_unlock(v2);
  p_shared_owners = (unint64_t *)&v30->__shared_owners_;
  do
    v44 = __ldaxr(p_shared_owners);
  while (__stlxr(v44 - 1, p_shared_owners));
  if (!v44)
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
LABEL_64:
  v55 = *v6;
  *(uint64_t *)((char *)&v55 + *(_QWORD *)(v55 - 24)) = v6[3];
  *(_QWORD *)&v56 = v9 + 16;
  if (SBYTE7(v61) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC04F0](&v63);
}

void sub_20E5D6694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN10mav_router6device8pci_shimEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN10mav_router6device8pci_shimEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t mav_router::device::pci_shim::tearDown(os_unfair_lock_s *this)
{
  NSObject *v2;
  uint32_t os_unfair_lock_opaque;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int16 v9;
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v6 = 0x40000000;
  *(_QWORD *)&v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v7 + 1) = &__block_descriptor_tmp_3;
  v8 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v5);
  v2 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    os_unfair_lock_opaque = this[36]._os_unfair_lock_opaque;
    v5 = 0x304000602;
    v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(_QWORD *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::tearDown()";
    HIWORD(v7) = 1024;
    v8 = 197;
    v9 = 1024;
    v10 = os_unfair_lock_opaque;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  os_unfair_lock_lock(this + 12);
  TelephonyUtilTransportFree();
  os_unfair_lock_unlock(this + 12);
  return 0;
}

uint64_t mav_router::device::pci_shim::recover(os_unfair_lock_s *this)
{
  NSObject *v2;
  uint32_t os_unfair_lock_opaque;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int16 v9;
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v6 = 0x40000000;
  *(_QWORD *)&v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v7 + 1) = &__block_descriptor_tmp_3;
  v8 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v5);
  v2 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    os_unfair_lock_opaque = this[36]._os_unfair_lock_opaque;
    v5 = 0x304000602;
    v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(_QWORD *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::recover()";
    HIWORD(v7) = 1024;
    v8 = 210;
    v9 = 1024;
    v10 = os_unfair_lock_opaque;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  os_unfair_lock_lock(this + 12);
  if (SHIBYTE(this[53]._os_unfair_lock_opaque) < 0)
  {
    **(_BYTE **)&this[48]._os_unfair_lock_opaque = 0;
    *(_QWORD *)&this[50]._os_unfair_lock_opaque = 0;
  }
  else
  {
    LOBYTE(this[48]._os_unfair_lock_opaque) = 0;
    HIBYTE(this[53]._os_unfair_lock_opaque) = 0;
  }
  os_unfair_lock_unlock(this + 12);
  return 0;
}

uint64_t mav_router::device::pci_shim::clearErrorReason_sync(uint64_t this)
{
  if (*(char *)(this + 215) < 0)
  {
    **(_BYTE **)(this + 192) = 0;
    *(_QWORD *)(this + 200) = 0;
  }
  else
  {
    *(_BYTE *)(this + 192) = 0;
    *(_BYTE *)(this + 215) = 0;
  }
  return this;
}

uint64_t mav_router::device::pci_shim::enterLowPower(mav_router::device::pci_shim *this)
{
  NSObject *v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v6 = 0x40000000;
  *(_QWORD *)&v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v7 + 1) = &__block_descriptor_tmp_3;
  v8 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v5);
  v2 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    v3 = *((_DWORD *)this + 36);
    v5 = 0x304000602;
    v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(_QWORD *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::enterLowPower()";
    HIWORD(v7) = 1024;
    v8 = 223;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 0;
}

uint64_t mav_router::device::pci_shim::exitLowPower(mav_router::device::pci_shim *this)
{
  NSObject *v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v6 = 0x40000000;
  *(_QWORD *)&v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v7 + 1) = &__block_descriptor_tmp_3;
  v8 = 3;
  if (qword_253DE9EC0 != -1)
    dispatch_once(&qword_253DE9EC0, &v5);
  v2 = qword_253DE9EE0;
  if (os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
  {
    v3 = *((_DWORD *)this + 36);
    v5 = 0x304000602;
    v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(_QWORD *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::exitLowPower()";
    HIWORD(v7) = 1024;
    v8 = 230;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 0;
}

uint64_t mav_router::device::pci_shim::hasFatalErrorOccurred(mav_router::device::pci_shim *this, BOOL *a2)
{
  if (*((char *)this + 215) < 0)
    *a2 = *((_QWORD *)this + 25) != 0;
  else
    *a2 = *((_BYTE *)this + 215) != 0;
  return 0;
}

BOOL mav_router::device::pci_shim::isError_sync(mav_router::device::pci_shim *this)
{
  if (*((char *)this + 215) < 0)
    return *((_QWORD *)this + 25) != 0;
  else
    return *((_BYTE *)this + 215) != 0;
}

uint64_t mav_router::device::pci_shim::getFatalErrorReason(uint64_t a1, uint64_t a2)
{
  std::string v4;

  if (*(char *)(a1 + 215) < 0)
  {
    std::string::__init_copy_ctor_external(&v4, *(const std::string::value_type **)(a1 + 192), *(_QWORD *)(a1 + 200));
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = *(std::string *)(a1 + 192);
  if (*(char *)(a2 + 23) < 0)
LABEL_3:
    operator delete(*(void **)a2);
LABEL_4:
  *(std::string *)a2 = v4;
  return 0;
}

void mav_router::device::pci_shim::getErrorReason_sync(mav_router::device::pci_shim *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 215) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 24), *((_QWORD *)this + 25));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 12);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 26);
  }
}

uint64_t mav_router::device::pci_shim::snapshot()
{
  return 0;
}

uint64_t mav_router::device::pci_shim::getMaxPayload(mav_router::device::pci_shim *this, unint64_t *a2)
{
  capabilities::radio *v3;

  v3 = (capabilities::radio *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  capabilities::radio::mavLegacy(v3);
  *a2 = 6144;
  return 0;
}

void **mav_router::device::pci_shim::setErrorReason_sync(uint64_t a1, void **a2)
{
  NSObject *v4;
  void *v5;
  void **result;
  __int128 v7;
  int v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11 = MEMORY[0x24BDAC760];
  v12 = 0x40000000;
  *(_QWORD *)&v13 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v13 + 1) = &__block_descriptor_tmp_3;
  v14 = 3;
  if (qword_253DE9EC0 == -1)
  {
    v4 = qword_253DE9EE0;
    if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_253DE9EC0, &v11);
    v4 = qword_253DE9EE0;
    if (!os_log_type_enabled((os_log_t)qword_253DE9EE0, OS_LOG_TYPE_INFO))
      goto LABEL_7;
  }
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = *a2;
  v11 = 0x304000602;
  v12 = 0x400000000000400;
  LODWORD(v13) = 0;
  WORD2(v13) = 2080;
  *(_QWORD *)((char *)&v13 + 6) = "void mav_router::device::pci_shim::setErrorReason_sync(const std::string &)";
  HIWORD(v13) = 1024;
  v14 = 322;
  v15 = 2080;
  v16 = v5;
  _os_log_impl(&dword_20E5D1000, v4, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:reason %s", (uint8_t *)&v11, 0x2Eu);
LABEL_7:
  result = (void **)(a1 + 192);
  if (*(char *)(a1 + 215) < 0)
  {
    if (result != a2 && !*(_QWORD *)(a1 + 200))
    {
      v8 = *((char *)a2 + 23);
      if (v8 >= 0)
        v9 = a2;
      else
        v9 = *a2;
      if (v8 >= 0)
        v10 = *((unsigned __int8 *)a2 + 23);
      else
        v10 = (size_t)a2[1];
      return std::string::__assign_no_alias<false>(result, v9, v10);
    }
  }
  else if (result != a2 && !*(_BYTE *)(a1 + 215))
  {
    if (*((char *)a2 + 23) < 0)
    {
      return (void **)std::string::__assign_no_alias<true>(result, *a2, (size_t)a2[1]);
    }
    else
    {
      v7 = *(_OWORD *)a2;
      *(_QWORD *)(a1 + 208) = a2[2];
      *(_OWORD *)result = v7;
    }
  }
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
  MEMORY[0x212BC04F0](a1 + 112);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
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

uint64_t **std::map<unsigned int,PCITransportInterface>::map[abi:ne180100](uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  uint64_t *v4;
  unsigned int *v5;
  unsigned int *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  unsigned int v12;
  uint64_t **v13;
  uint64_t **v14;
  uint64_t *v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t *v18;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = &a2[2 * a3];
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        v12 = *v5;
        if (*((_DWORD *)v8 + 7) >= *v5)
          break;
      }
      if (v7)
        v13 = (uint64_t **)v8;
      else
        v13 = (uint64_t **)v4;
      if (v7)
        v14 = (uint64_t **)(v8 + 1);
      else
        v14 = (uint64_t **)v4;
      if (!*v14)
        goto LABEL_26;
LABEL_4:
      v5 += 2;
      if (v5 == v6)
        return a1;
    }
    v14 = (uint64_t **)v4;
    v13 = (uint64_t **)v4;
    if (v7)
    {
      v15 = a1[1];
      while (1)
      {
        while (1)
        {
          v13 = (uint64_t **)v15;
          v16 = *((_DWORD *)v15 + 7);
          if (v16 <= v12)
            break;
          v15 = *v13;
          v14 = v13;
          if (!*v13)
            goto LABEL_26;
        }
        if (v16 >= v12)
          goto LABEL_4;
        v15 = v13[1];
        if (!v15)
        {
          v14 = v13 + 1;
          break;
        }
      }
    }
LABEL_26:
    v17 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v17 + 28) = *(_QWORD *)v5;
    *v17 = 0;
    v17[1] = 0;
    v17[2] = (uint64_t)v13;
    *v14 = v17;
    v18 = (uint64_t *)**a1;
    if (v18)
    {
      *a1 = v18;
      v17 = *v14;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v17);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    goto LABEL_4;
  }
  return a1;
}

void sub_20E5D729C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

_QWORD *ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init()
{
  _QWORD *result;

  result = operator new(0x18uLL);
  result[1] = 0;
  result[2] = 0;
  *result = off_24C9718C0;
  ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::fsInstance = (uint64_t)result;
  return result;
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
  MEMORY[0x212BC0448](v13, a1);
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
  MEMORY[0x212BC0454](v13);
  return a1;
}

void sub_20E5D7618(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212BC0454](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20E5D75F8);
}

void sub_20E5D7660(_Unwind_Exception *a1)
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

void sub_20E5D7808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mav_router::service::transport_shim::create(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v12;
  unint64_t v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  char *v32;
  std::__shared_weak_count *v33;

  v4 = (char *)operator new(0x70uLL);
  mav_router::service::transport_shim::transport_shim(v4, a1);
  *(_QWORD *)v4 = off_24C971780;
  *((_QWORD *)v4 + 1) = 0;
  v6 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = v6;
  *((_QWORD *)v4 + 4) = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  *((_QWORD *)v4 + 5) = *(unsigned int *)(a1 + 16);
  v9 = dispatch_group_create();
  *((_QWORD *)v4 + 6) = v9;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  v4[104] = 1;
  dispatch_group_enter(v9);
  v32 = v4;
  v10 = (std::__shared_weak_count *)operator new(0x20uLL);
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__vftable = (std::__shared_weak_count_vtbl *)off_24C971820;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  v33 = v10;
  v12 = (std::__shared_weak_count *)*((_QWORD *)v4 + 2);
  if (v12)
  {
    if (v12->__shared_owners_ != -1)
      goto LABEL_17;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
    *((_QWORD *)v4 + 1) = v4;
    *((_QWORD *)v4 + 2) = v10;
    std::__shared_weak_count::__release_weak(v12);
  }
  else
  {
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
    v17 = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
    *((_QWORD *)v4 + 1) = v4;
    *((_QWORD *)v4 + 2) = v10;
  }
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
LABEL_17:
  v20 = *(_QWORD *)(*((_QWORD *)v4 + 3) + 16);
  v21 = *((_DWORD *)v4 + 10);
  v22 = operator new(0x10uLL);
  v23 = (std::__shared_weak_count *)*((_QWORD *)v32 + 2);
  if (!v23 || (v24 = *((_QWORD *)v32 + 1), (v25 = std::__shared_weak_count::lock(v23)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v26 = v25;
  *v22 = v24;
  v22[1] = v25;
  v27 = (unint64_t *)&v25->__shared_weak_owners_;
  do
    v28 = __ldxr(v27);
  while (__stxr(v28 + 1, v27));
  if (v20 && *(_DWORD *)v20 > v21)
  {
    v29 = *(_QWORD *)(v20 + 8) + 48 * v21;
    *(_QWORD *)(v29 + 16) = mav_router::service::transport_shim_private::handle_receive;
    *(_QWORD *)(v29 + 24) = v22;
  }
  v30 = (unint64_t *)&v25->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v26);
  }
  *a2 = v32;
  a2[1] = v33;
}

void sub_20E5D7A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E5D7A60(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_20E5D7A7C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_20E5D7A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  operator delete(v9);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *mav_router::service::transport_shim::transport_shim(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *a1 = off_24C971748;
  v8 = MEMORY[0x24BDAC760];
  v9 = 0x40000000;
  *(_QWORD *)&v10 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v10 + 1) = &__block_descriptor_tmp_3;
  v11 = 2;
  if (qword_253DE9EB8 == -1)
  {
    v4 = qword_253DE9ED8;
    if (!os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_INFO))
      return a1;
  }
  else
  {
    dispatch_once(&qword_253DE9EB8, &v8);
    v4 = qword_253DE9ED8;
    if (!os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_INFO))
      return a1;
  }
  v5 = *(unsigned int *)(a2 + 16);
  if (v5 > 0xA)
    v6 = "unknown channel";
  else
    v6 = mav_router_channel_cstrings[v5];
  v8 = 0x204000602;
  v9 = 0x400000000010400;
  LODWORD(v10) = 0;
  WORD2(v10) = 2080;
  *(_QWORD *)((char *)&v10 + 6) = "mav_router::service::transport_shim::transport_shim(const parameters &)";
  HIWORD(v10) = 1024;
  v11 = 353;
  v12 = 2080;
  v13 = v6;
  _os_log_impl(&dword_20E5D1000, v4, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:with channel %s", (uint8_t *)&v8, 0x2Eu);
  return a1;
}

uint64_t mav_router::service::transport_shim::get_shim@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  *a2 = 0;
  a2[1] = 0;
  v2 = *(uint64_t **)(result + 80);
  if (v2)
  {
    v4 = *v2;
    v3 = v2[1];
    if (v3)
    {
      v5 = (unint64_t *)(v3 + 8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }
    *a2 = v4;
    a2[1] = v3;
  }
  return result;
}

void mav_router::service::transport_shim_private::~transport_shim_private(mav_router::service::transport_shim_private *this)
{
  void *v1;

  mav_router::service::transport_shim_private::~transport_shim_private(this);
  operator delete(v1);
}

{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  void **v8;
  NSObject *v9;
  unint64_t v10;
  void **v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;

  *(_QWORD *)this = off_24C971780;
  v2 = *(_QWORD *)(*((_QWORD *)this + 3) + 16);
  if (!v2)
  {
    v5 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
    goto LABEL_6;
  }
  v3 = *((_DWORD *)this + 10);
  if (*(_DWORD *)v2 <= v3)
  {
    v5 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
    v6 = (std::__shared_weak_count *)MEMORY[0xAAAAAAAAAAAAAAB2];
    if (!MEMORY[0xAAAAAAAAAAAAAAB2])
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(v2 + 8) + 48 * v3;
  *(_QWORD *)(v4 + 16) = 0;
  v5 = *(_QWORD **)(v4 + 24);
  if (v5)
  {
LABEL_6:
    v6 = (std::__shared_weak_count *)v5[1];
    if (!v6)
    {
LABEL_8:
      operator delete(v5);
      goto LABEL_9;
    }
LABEL_7:
    std::__shared_weak_count::__release_weak(v6);
    goto LABEL_8;
  }
LABEL_9:
  v7 = *((_QWORD *)this + 12);
  if (v7)
  {
    do
    {
      v8 = (void **)*((_QWORD *)this + 8);
      v9 = (*(_QWORD **)((char *)v8 + ((*((_QWORD *)this + 11) >> 6) & 0x3FFFFFFFFFFFFF8)))[*((_QWORD *)this + 11) & 0x1FFLL];
      v10 = *((_QWORD *)this + 11) + 1;
      *((_QWORD *)this + 11) = v10;
      *((_QWORD *)this + 12) = v7 - 1;
      if (v10 >= 0x400)
      {
        operator delete(*v8);
        *((_QWORD *)this + 8) += 8;
        *((_QWORD *)this + 11) -= 512;
      }
      dispatch_release(v9);
      v7 = *((_QWORD *)this + 12);
    }
    while (v7);
    dispatch_group_enter(*((dispatch_group_t *)this + 6));
  }
  dispatch_group_leave(*((dispatch_group_t *)this + 6));
  dispatch_release(*((dispatch_object_t *)this + 6));
  v11 = (void **)*((_QWORD *)this + 8);
  v12 = (void **)*((_QWORD *)this + 9);
  *((_QWORD *)this + 12) = 0;
  v13 = (char *)v12 - (char *)v11;
  if ((unint64_t)((char *)v12 - (char *)v11) >= 0x11)
  {
    do
    {
      operator delete(*v11);
      v12 = (void **)*((_QWORD *)this + 9);
      v11 = (void **)(*((_QWORD *)this + 8) + 8);
      *((_QWORD *)this + 8) = v11;
      v13 = (char *)v12 - (char *)v11;
    }
    while ((unint64_t)((char *)v12 - (char *)v11) > 0x10);
  }
  v14 = v13 >> 3;
  if (v14 == 1)
  {
    v15 = 256;
    goto LABEL_21;
  }
  if (v14 == 2)
  {
    v15 = 512;
LABEL_21:
    *((_QWORD *)this + 11) = v15;
  }
  if (v11 != v12)
  {
    do
    {
      v16 = *v11++;
      operator delete(v16);
    }
    while (v11 != v12);
    v18 = *((_QWORD *)this + 8);
    v17 = *((_QWORD *)this + 9);
    if (v17 != v18)
      *((_QWORD *)this + 9) = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  v19 = (void *)*((_QWORD *)this + 7);
  if (v19)
    operator delete(v19);
  v20 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (!v20)
    goto LABEL_32;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    v23 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v23)
      return;
  }
  else
  {
LABEL_32:
    v23 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v23)
      return;
  }
  std::__shared_weak_count::__release_weak(v23);
}

std::__shared_weak_count *mav_router::service::transport_shim_private::apply_transport(uint64_t a1, uint64_t (**a2)(uint64_t a1, const void *a2, unsigned int a3, unsigned int *a4))
{
  uint64_t (*v4)(uint64_t, const void *, unsigned int, unsigned int *);
  std::__shared_weak_count *v5;
  std::__shared_weak_count *result;

  v4 = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))operator new(0x10uLL);
  v5 = *(std::__shared_weak_count **)(a1 + 16);
  *(_QWORD *)v4 = *(_QWORD *)(a1 + 8);
  if (!v5)
  {
    *((_QWORD *)v4 + 1) = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  result = std::__shared_weak_count::lock(v5);
  *((_QWORD *)v4 + 1) = result;
  if (!result)
    goto LABEL_5;
  a2[10] = v4;
  *a2 = mav_router::service::transport_shim_private::write_func;
  a2[1] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::read_func;
  a2[2] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::unblock_read_func;
  a2[3] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::flush_read_func;
  a2[6] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::free_func;
  a2[7] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::is_valid_func;
  return result;
}

void sub_20E5D7D28(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t mav_router::service::transport_shim_private::write_func(uint64_t a1, const void *a2, unsigned int a3, unsigned int *a4)
{
  NSObject *v8;
  uint64_t *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  NSObject *global_queue;
  dispatch_data_t v15;
  NSObject *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int (*v20)(uint64_t, uint64_t, NSObject *, _QWORD);
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v27;
  uint8_t buf[8];
  uint64_t v29;
  __int128 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  const void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 80))
    return 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  v29 = 0x40000000;
  *(_QWORD *)&v30 = ____mav_log_platform_os_log_handle_block_invoke;
  *((_QWORD *)&v30 + 1) = &__block_descriptor_tmp_3;
  v31 = 2;
  if (qword_253DE9EB8 != -1)
    dispatch_once(&qword_253DE9EB8, buf);
  v8 = qword_253DE9ED8;
  if (os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)&buf[4] = 2;
    v29 = 0x400000000030400;
    LODWORD(v30) = 0;
    WORD2(v30) = 2080;
    *(_QWORD *)((char *)&v30 + 6) = "static void mav_router::service::transport_shim_private::log_write(const unsigned ch"
                                    "ar *, unsigned int)";
    HIWORD(v30) = 1024;
    v31 = 153;
    v32 = 2080;
    v33 = &unk_20E5DD7E7;
    v34 = 1024;
    v35 = a3;
    v36 = 1040;
    v37 = a3;
    v38 = 2096;
    v39 = a2;
    _os_log_impl(&dword_20E5D1000, v8, OS_LOG_TYPE_DEBUG, "[%04x.%04u.%04u] %s:%u:%s (%u bytes): %.*P", buf, 0x44u);
  }
  v9 = *(uint64_t **)(a1 + 80);
  v11 = *v9;
  v10 = (std::__shared_weak_count *)v9[1];
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v27 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v15 = dispatch_data_create(a2, a3, global_queue, 0);
  v16 = v15;
  if (v15)
    v27 = v15;
  v17 = *(_QWORD *)(*(_QWORD *)(v11 + 24) + 16);
  if (!v17
    || (v18 = *(_DWORD *)(v11 + 40), *(_DWORD *)v17 <= v18)
    || (v19 = *(unsigned int **)(*(_QWORD *)(v17 + 8) + 48 * v18 + 8)) == 0
    || (v20 = (unsigned int (*)(uint64_t, uint64_t, NSObject *, _QWORD))*((_QWORD *)v19 + 3)) == 0
    || (v21 = *v19, *(_DWORD *)(v17 + 4) <= v21))
  {
LABEL_21:
    *a4 = 0;
    dispatch_release(v16);
    v23 = 0;
    if (!v10)
      return v23;
    goto LABEL_22;
  }
  if (*(_DWORD *)(*(_QWORD *)(v17 + 16) + 40 * v21 + 16) >= 2u)
  {
    *(_DWORD *)&buf[4] = 0;
    v29 = (uint64_t)&v27;
    *(_DWORD *)buf = v18;
    v22 = mav_mux_encode((uint64_t)buf);
    v16 = v27;
    if (v22)
      goto LABEL_21;
    v20 = (unsigned int (*)(uint64_t, uint64_t, NSObject *, _QWORD))*((_QWORD *)v19 + 3);
    v21 = *v19;
  }
  if (v20(v17, v21, v16, *((_QWORD *)v19 + 4)))
  {
    v16 = v27;
    goto LABEL_21;
  }
  *a4 = a3;
  v23 = 1;
  if (!v10)
    return v23;
LABEL_22:
  v24 = (unint64_t *)&v10->__shared_owners_;
  do
    v25 = __ldaxr(v24);
  while (__stlxr(v25 - 1, v24));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  return v23;
}

uint64_t mav_router::service::transport_shim_private::read_func(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, uint64_t a5, unsigned int a6)
{
  uint64_t *v6;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int64_t v15;
  dispatch_time_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int size;
  size_t v20;
  unsigned int v21;
  int v23;
  _BOOL4 v24;
  unsigned int v26;
  NSObject *v27;
  dispatch_data_t subrange;
  void **v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v36;
  int v38;
  _QWORD applier[7];
  int v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[5];

  v6 = *(uint64_t **)(a1 + 80);
  if (!v6)
    return 0;
  *a4 = 0;
  v12 = *v6;
  v11 = (std::__shared_weak_count *)v6[1];
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = 1000000 * a6;
  while (2)
  {
    if (a6 == -1)
    {
      while (1)
      {
        if (dispatch_group_wait(*(dispatch_group_t *)(v12 + 48), 0xFFFFFFFFFFFFFFFFLL))
          goto LABEL_41;
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 44));
        if (*(_QWORD *)(v12 + 96))
          break;
        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
      }
LABEL_13:
      v36 = v11;
      v17 = a5;
      v18 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(v12 + 64) + ((*(_QWORD *)(v12 + 88) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*(_QWORD *)(v12 + 88) & 0x1FFLL));
      size = dispatch_data_get_size(v18);
      if (a3 >= size)
        v20 = size;
      else
        v20 = a3;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2000000000;
      v43[3] = a2;
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2000000000;
      v42 = -1431655766;
      v21 = dispatch_data_get_size(v18);
      v38 = 0;
      if (v20 > v21 || (_DWORD)v20 == -1)
        v23 = v21;
      else
        v23 = v20;
      v42 = v23;
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 1107296256;
      applier[2] = ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke;
      applier[3] = &__block_descriptor_tmp_1;
      v40 = 0;
      applier[4] = v41;
      applier[5] = v43;
      applier[6] = &v38;
      v24 = dispatch_data_apply(v18, applier);
      _Block_object_dispose(v41, 8);
      _Block_object_dispose(v43, 8);
      if (v24 && v38 == (_DWORD)v20)
      {
        v26 = dispatch_data_get_size(v18);
        if (v26 >= v20)
        {
          if (v26 == (_DWORD)v20)
          {
            v27 = 0;
LABEL_32:
            dispatch_release(v18);
            v18 = v27;
            goto LABEL_33;
          }
          subrange = dispatch_data_create_subrange(v18, v20, v26 - v20);
          v27 = subrange;
          if (subrange)
            goto LABEL_32;
        }
      }
LABEL_33:
      a5 = v17;
      v11 = v36;
      *a4 += v20;
      if (!v18)
      {
        v29 = *(void ***)(v12 + 64);
        v30 = *(_QWORD *)(v12 + 96) - 1;
        v31 = *(_QWORD *)(v12 + 88) + 1;
        *(_QWORD *)(v12 + 88) = v31;
        *(_QWORD *)(v12 + 96) = v30;
        if (v31 >= 0x400)
        {
          operator delete(*v29);
          *(_QWORD *)(v12 + 64) += 8;
          v30 = *(_QWORD *)(v12 + 96);
          *(_QWORD *)(v12 + 88) -= 512;
        }
        if (!v30)
          dispatch_group_enter(*(dispatch_group_t *)(v12 + 48));
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
      v32 = 1;
      if ((_DWORD)a5)
      {
        a2 += v20;
        a3 -= v20;
        if (a3)
          continue;
      }
      goto LABEL_42;
    }
    break;
  }
  while (1)
  {
    v16 = dispatch_time(0, v15);
    if (dispatch_group_wait(*(dispatch_group_t *)(v12 + 48), v16))
      break;
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 44));
    if (*(_QWORD *)(v12 + 96))
      goto LABEL_13;
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
  }
LABEL_41:
  v32 = 0;
LABEL_42:
  if (v11)
  {
    v33 = (unint64_t *)&v11->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v32;
}

BOOL mav_router::service::transport_shim_private::unblock_read_func(uint64_t a1)
{
  uint64_t *v1;
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  void **v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  v1 = *(uint64_t **)(a1 + 80);
  if (!v1)
    return v1 != 0;
  v3 = *v1;
  v2 = (std::__shared_weak_count *)v1[1];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  v6 = *(_QWORD *)(v3 + 96);
  if (!v6)
  {
    *(_BYTE *)(v3 + 104) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2)
      return v1 != 0;
    goto LABEL_12;
  }
  do
  {
    v7 = *(void ***)(v3 + 64);
    v8 = (*(_QWORD **)((char *)v7 + ((*(_QWORD *)(v3 + 88) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(_QWORD *)(v3 + 88) & 0x1FFLL];
    v9 = *(_QWORD *)(v3 + 88) + 1;
    *(_QWORD *)(v3 + 88) = v9;
    *(_QWORD *)(v3 + 96) = v6 - 1;
    if (v9 >= 0x400)
    {
      operator delete(*v7);
      *(_QWORD *)(v3 + 64) += 8;
      *(_QWORD *)(v3 + 88) -= 512;
    }
    dispatch_release(v8);
    v6 = *(_QWORD *)(v3 + 96);
  }
  while (v6);
  dispatch_group_enter(*(dispatch_group_t *)(v3 + 48));
  *(_BYTE *)(v3 + 104) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
  if (v2)
  {
LABEL_12:
    v10 = (unint64_t *)&v2->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return v1 != 0;
}

uint64_t mav_router::service::transport_shim_private::flush_read_func(uint64_t a1)
{
  uint64_t *v1;
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  void **v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;

  v1 = *(uint64_t **)(a1 + 80);
  if (!v1)
    return 1;
  v3 = *v1;
  v2 = (std::__shared_weak_count *)v1[1];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  v6 = *(_QWORD *)(v3 + 96);
  if (v6)
  {
    do
    {
      v8 = *(void ***)(v3 + 64);
      v9 = (*(_QWORD **)((char *)v8 + ((*(_QWORD *)(v3 + 88) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(_QWORD *)(v3 + 88) & 0x1FFLL];
      v10 = *(_QWORD *)(v3 + 88) + 1;
      *(_QWORD *)(v3 + 88) = v10;
      *(_QWORD *)(v3 + 96) = v6 - 1;
      if (v10 >= 0x400)
      {
        operator delete(*v8);
        *(_QWORD *)(v3 + 64) += 8;
        *(_QWORD *)(v3 + 88) -= 512;
      }
      dispatch_release(v9);
      v6 = *(_QWORD *)(v3 + 96);
    }
    while (v6);
    dispatch_group_enter(*(dispatch_group_t *)(v3 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2)
      return 1;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2)
      return 1;
  }
  v11 = (unint64_t *)&v2->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (v12)
    return 1;
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  return 1;
}

BOOL mav_router::service::transport_shim_private::is_valid_func(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80) != 0;
}

uint64_t mav_router::service::transport_shim_private::free_func(uint64_t a1)
{
  os_unfair_lock_s **v1;
  std::__shared_weak_count *v3;
  os_unfair_lock_s *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;

  v1 = *(os_unfair_lock_s ***)(a1 + 80);
  if (!v1)
    return 1;
  v4 = *v1;
  v3 = (std::__shared_weak_count *)v1[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    v7 = (std::__shared_weak_count *)v1[1];
    if (v7)
    {
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
    operator delete(v1);
    os_unfair_lock_lock(v4 + 11);
    *(_QWORD *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    os_unfair_lock_unlock(v4 + 11);
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (v10)
      return 1;
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    return 1;
  }
  else
  {
    operator delete(*(void **)(a1 + 80));
    os_unfair_lock_lock(v4 + 11);
    *(_QWORD *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    os_unfair_lock_unlock(v4 + 11);
    return 1;
  }
}

uint64_t ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  int v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v10;
  size_t v11;

  v5 = *(_DWORD *)(a1 + 56) - a3;
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)v6)
    v7 = v5 < (int)a5;
  else
    v7 = 0;
  if (!v7)
    return 1;
  v10 = v5 & ~(v5 >> 31);
  if (v6 >= a5)
    v11 = a5;
  else
    v11 = v6;
  memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (const void *)(a4 + v10), v11);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) -= v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v11;
  **(_DWORD **)(a1 + 48) += v11;
  return 1;
}

uint64_t mav_router::service::transport_shim_private::handle_receive(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t *a4)
{
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  char *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  BOOL v39;
  int64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  char *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD *v51;
  unint64_t v52;
  char *v53;
  char *v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 *v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  __int128 *v77;
  _OWORD *v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  size_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  __int128 *v96;
  _OWORD *v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  unsigned int size;
  size_t v103;
  void *v104;
  NSObject *v105;
  unint64_t *p_shared_owners;
  unint64_t v107;
  unint64_t v109;
  char *v110;
  char *v111;
  int64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  __int128 *v119;
  _OWORD *v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  std::__shared_weak_count *v128;
  int v129;
  _QWORD v130[3];
  int v131;
  _QWORD v132[4];
  uint64_t applier;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[12];
  void *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a4[1];
  if (!v5)
  {
    v128 = 0;
    goto LABEL_21;
  }
  v6 = *a4;
  p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
  do
    v8 = __ldxr(p_shared_weak_owners);
  while (__stxr(v8 + 1, p_shared_weak_owners));
  v128 = std::__shared_weak_count::lock(v5);
  if (!v128 || !v6)
  {
LABEL_21:
    dispatch_release(a3);
    v25 = v128;
    if (!v128)
      goto LABEL_125;
    goto LABEL_121;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 44));
  if (*(_BYTE *)(v6 + 104))
  {
    v9 = *(char **)(v6 + 64);
    v10 = *(char **)(v6 + 72);
    v11 = v10 - v9;
    if (v10 == v9)
      v12 = 0;
    else
      v12 = ((v10 - v9) << 6) - 1;
    v13 = *(_QWORD *)(v6 + 88);
    v14 = v13 + *(_QWORD *)(v6 + 96);
    v127 = *(_QWORD *)(v6 + 96);
    if (v12 != v14)
    {
      v26 = *(_QWORD *)(v6 + 96);
      goto LABEL_108;
    }
    if (v13 >= 0x200)
    {
      *(_QWORD *)(v6 + 88) = v13 - 512;
      v15 = v9 + 8;
      v16 = *(_QWORD *)v9;
      *(_QWORD *)(v6 + 64) = v9 + 8;
      if (v10 != *(char **)(v6 + 80))
      {
LABEL_105:
        *(_QWORD *)v10 = v16;
        goto LABEL_106;
      }
      v17 = *(char **)(v6 + 56);
      if (v15 > v17)
      {
        v18 = (v15 - v17) >> 3;
        if (v18 >= -1)
          v19 = v18 + 1;
        else
          v19 = v18 + 2;
        v20 = v19 >> 1;
        v21 = -v20;
        v22 = &v15[-8 * v20];
        v23 = v10 - v15;
        if (v10 != v15)
        {
          memmove(&v15[-8 * v20], v15, v10 - v15);
          v10 = *(char **)(v6 + 64);
        }
        v24 = &v10[8 * v21];
        v10 = &v22[v23];
        *(_QWORD *)(v6 + 64) = v24;
        *(_QWORD *)(v6 + 72) = &v22[v23];
        goto LABEL_105;
      }
      if (v10 == v17)
        v36 = 1;
      else
        v36 = (v10 - v17) >> 2;
      if (!(v36 >> 61))
      {
        v37 = (char *)operator new(8 * v36);
        v38 = &v37[8 * (v36 >> 2)];
        v40 = v10 - v15;
        v39 = v10 == v15;
        v10 = v38;
        if (v39)
          goto LABEL_103;
        v10 = &v38[v40 & 0xFFFFFFFFFFFFFFF8];
        v41 = v40 - 8;
        if (v41 >= 0x38)
        {
          v93 = &v37[8 * (v36 >> 2)];
          v42 = v93;
          if ((unint64_t)(v93 - v15) >= 0x20)
          {
            v94 = (v41 >> 3) + 1;
            v95 = 8 * (v94 & 0x3FFFFFFFFFFFFFFCLL);
            v42 = &v38[v95];
            v15 += v95;
            v96 = (__int128 *)(v9 + 24);
            v97 = v93 + 16;
            v98 = v94 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v99 = *v96;
              *(v97 - 1) = *(v96 - 1);
              *v97 = v99;
              v96 += 2;
              v97 += 2;
              v98 -= 4;
            }
            while (v98);
            if (v94 == (v94 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_103:
              *(_QWORD *)(v6 + 56) = v37;
              *(_QWORD *)(v6 + 64) = v38;
              *(_QWORD *)(v6 + 72) = v10;
              *(_QWORD *)(v6 + 80) = &v37[8 * v36];
              if (v17)
              {
                operator delete(v17);
                v10 = *(char **)(v6 + 72);
              }
              goto LABEL_105;
            }
          }
        }
        else
        {
          v42 = &v37[8 * (v36 >> 2)];
        }
        do
        {
          v100 = *(_QWORD *)v15;
          v15 += 8;
          *(_QWORD *)v42 = v100;
          v42 += 8;
        }
        while (v42 != v10);
        goto LABEL_103;
      }
LABEL_147:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v27 = *(char **)(v6 + 80);
    v28 = *(char **)(v6 + 56);
    v125 = v11 >> 3;
    if (v11 >> 3 >= (unint64_t)((v27 - v28) >> 3))
    {
      if (v27 == v28)
        v31 = 1;
      else
        v31 = (v27 - v28) >> 2;
      if (!(v31 >> 61))
      {
        v32 = (char *)operator new(8 * v31);
        v124 = operator new(0x1000uLL);
        v33 = &v32[8 * v125];
        v34 = &v32[8 * v31];
        if (v125 == v31)
        {
          if (v11 < 1)
          {
            if (v10 == v9)
              v44 = 1;
            else
              v44 = v11 >> 2;
            if (v44 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v33 = (char *)operator new(8 * v44);
            v34 = &v33[8 * v44];
            operator delete(v32);
            v9 = *(char **)(v6 + 64);
            v10 = *(char **)(v6 + 72);
            v32 = v33;
          }
          else
          {
            v35 = v125 + 2;
            if (v125 >= -1)
              v35 = v125 + 1;
            v33 -= 8 * (v35 >> 1);
          }
        }
        *(_QWORD *)v33 = v124;
        v45 = v33 + 8;
        if (v10 != v9)
        {
          do
          {
            if (v33 == v32)
            {
              if (v45 >= v34)
              {
                if (v34 == v32)
                  v52 = 1;
                else
                  v52 = (v34 - v32) >> 2;
                if (v52 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v53 = (char *)operator new(8 * v52);
                v54 = v53;
                v55 = (v52 + 3) >> 2;
                v33 = &v53[8 * v55];
                v56 = v45 - v32;
                v39 = v45 == v32;
                v45 = v33;
                if (!v39)
                {
                  v45 = &v33[v56 & 0xFFFFFFFFFFFFFFF8];
                  v57 = v56 - 8;
                  v58 = &v53[8 * v55];
                  v59 = v32;
                  if (v57 < 0x38)
                    goto LABEL_151;
                  v60 = 8 * v55;
                  v58 = &v53[8 * v55];
                  v59 = v32;
                  if ((unint64_t)(v58 - v32) < 0x20)
                    goto LABEL_151;
                  v61 = (v57 >> 3) + 1;
                  v62 = 8 * (v61 & 0x3FFFFFFFFFFFFFFCLL);
                  v58 = &v33[v62];
                  v59 = &v32[v62];
                  v63 = (__int128 *)(v32 + 16);
                  v64 = &v53[v60 + 16];
                  v65 = v61 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v66 = *v63;
                    *((_OWORD *)v64 - 1) = *(v63 - 1);
                    *(_OWORD *)v64 = v66;
                    v63 += 2;
                    v64 += 32;
                    v65 -= 4;
                  }
                  while (v65);
                  if (v61 != (v61 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_151:
                    do
                    {
                      v67 = *(_QWORD *)v59;
                      v59 += 8;
                      *(_QWORD *)v58 = v67;
                      v58 += 8;
                    }
                    while (v58 != v45);
                  }
                }
                v34 = &v53[8 * v52];
                operator delete(v32);
                v32 = v54;
              }
              else
              {
                v48 = (v34 - v45) >> 3;
                if (v48 >= -1)
                  v49 = v48 + 1;
                else
                  v49 = v48 + 2;
                v50 = v49 >> 1;
                v33 = &v32[8 * (v49 >> 1)];
                v51 = v32;
                if (v45 != v32)
                {
                  memmove(v33, v32, v45 - v32);
                  v51 = v45;
                }
                v45 = (char *)v51 + 8 * v50;
              }
            }
            v47 = *((_QWORD *)v10 - 1);
            v10 -= 8;
            *((_QWORD *)v33 - 1) = v47;
            v33 -= 8;
          }
          while (v10 != *(char **)(v6 + 64));
        }
        v46 = *(void **)(v6 + 56);
        *(_QWORD *)(v6 + 56) = v32;
        *(_QWORD *)(v6 + 64) = v33;
        *(_QWORD *)(v6 + 72) = v45;
        *(_QWORD *)(v6 + 80) = v34;
        if (v46)
          operator delete(v46);
        goto LABEL_107;
      }
      goto LABEL_147;
    }
    v29 = operator new(0x1000uLL);
    v30 = v29;
    if (v27 != v10)
    {
      *(_QWORD *)v10 = v29;
LABEL_106:
      *(_QWORD *)(v6 + 72) += 8;
LABEL_107:
      v9 = *(char **)(v6 + 64);
      v26 = *(_QWORD *)(v6 + 96);
      v14 = *(_QWORD *)(v6 + 88) + v26;
LABEL_108:
      *(_QWORD *)(*(_QWORD *)&v9[(v14 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v14 & 0x1FF)) = a3;
      *(_QWORD *)(v6 + 96) = v26 + 1;
      v101 = MEMORY[0x24BDAC760];
      applier = MEMORY[0x24BDAC760];
      v134 = 0x40000000;
      *(_QWORD *)&v135 = ____mav_log_platform_os_log_handle_block_invoke;
      *((_QWORD *)&v135 + 1) = &__block_descriptor_tmp_3;
      LODWORD(v136) = 2;
      if (qword_253DE9EB8 == -1)
      {
        if (os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_DEBUG))
          goto LABEL_110;
      }
      else
      {
        dispatch_once(&qword_253DE9EB8, &applier);
        if (os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_DEBUG))
        {
LABEL_110:
          size = dispatch_data_get_size(a3);
          v103 = size;
          if (size)
          {
            v104 = operator new(size);
            v126 = (_DWORD)v104 + v103;
            bzero(v104, v103);
          }
          else
          {
            v104 = 0;
            v126 = 0;
          }
          v132[0] = 0;
          v132[1] = v132;
          v132[2] = 0x2000000000;
          v132[3] = v104;
          v130[0] = 0;
          v130[1] = v130;
          v130[2] = 0x2000000000;
          v131 = -1431655766;
          v129 = 0;
          v131 = dispatch_data_get_size(a3);
          applier = v101;
          v134 = 1107296256;
          *(_QWORD *)&v135 = ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke;
          *((_QWORD *)&v135 + 1) = &__block_descriptor_tmp_1;
          *(_DWORD *)&v137[8] = 0;
          *(_QWORD *)&v136 = v130;
          *((_QWORD *)&v136 + 1) = v132;
          *(_QWORD *)v137 = &v129;
          dispatch_data_apply(a3, &applier);
          _Block_object_dispose(v130, 8);
          _Block_object_dispose(v132, 8);
          applier = v101;
          v134 = 0x40000000;
          *(_QWORD *)&v135 = ____mav_log_platform_os_log_handle_block_invoke;
          *((_QWORD *)&v135 + 1) = &__block_descriptor_tmp_3;
          LODWORD(v136) = 2;
          if (qword_253DE9EB8 == -1)
          {
            v105 = qword_253DE9ED8;
            if (!os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_DEBUG))
              goto LABEL_116;
          }
          else
          {
            dispatch_once(&qword_253DE9EB8, &applier);
            v105 = qword_253DE9ED8;
            if (!os_log_type_enabled((os_log_t)qword_253DE9ED8, OS_LOG_TYPE_DEBUG))
            {
LABEL_116:
              if (v104)
                operator delete(v104);
              goto LABEL_118;
            }
          }
          applier = 0x204000902;
          v134 = 0x400000000030400;
          LODWORD(v135) = 0;
          WORD2(v135) = 2080;
          *(_QWORD *)((char *)&v135 + 6) = "static void mav_router::service::transport_shim_private::log_received(mav_buffer_t)";
          HIWORD(v135) = 1024;
          LODWORD(v136) = 91;
          WORD2(v136) = 2080;
          *(_QWORD *)((char *)&v136 + 6) = &unk_20E5DD7E7;
          HIWORD(v136) = 1024;
          *(_DWORD *)v137 = v126 - (_DWORD)v104;
          *(_WORD *)&v137[4] = 1040;
          *(_DWORD *)&v137[6] = v126 - (_DWORD)v104;
          *(_WORD *)&v137[10] = 2096;
          v138 = v104;
          _os_log_impl(&dword_20E5D1000, v105, OS_LOG_TYPE_DEBUG, "[%04x.%04u.%04u] %s:%u:%s (%u bytes): %.*P", (uint8_t *)&applier, 0x44u);
          goto LABEL_116;
        }
      }
LABEL_118:
      if (!v127)
        dispatch_group_leave(*(dispatch_group_t *)(v6 + 48));
      goto LABEL_120;
    }
    if (v9 == v28)
    {
      if (v10 == v9)
        v68 = 1;
      else
        v68 = (v27 - v9) >> 2;
      if (v68 >> 61)
        goto LABEL_147;
      v69 = (char *)operator new(8 * v68);
      v70 = (v68 + 3) >> 2;
      v43 = &v69[8 * v70];
      v71 = v43;
      if (v10 != v9)
      {
        v71 = &v43[8 * v125];
        v72 = &v69[8 * v70];
        v73 = v9;
        if ((unint64_t)(v11 - 8) < 0x38)
          goto LABEL_152;
        v74 = &v69[8 * v70];
        v72 = v74;
        v73 = v9;
        if ((unint64_t)(v74 - v9) < 0x20)
          goto LABEL_152;
        v75 = ((unint64_t)(v11 - 8) >> 3) + 1;
        v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
        v72 = &v43[v76];
        v73 = &v9[v76];
        v77 = (__int128 *)(v9 + 16);
        v78 = v74 + 16;
        v79 = v75 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v80 = *v77;
          *(v78 - 1) = *(v77 - 1);
          *v78 = v80;
          v77 += 2;
          v78 += 2;
          v79 -= 4;
        }
        while (v79);
        if (v75 != (v75 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_152:
          do
          {
            v81 = *(_QWORD *)v73;
            v73 += 8;
            *(_QWORD *)v72 = v81;
            v72 += 8;
          }
          while (v72 != v71);
        }
      }
      *(_QWORD *)(v6 + 56) = v69;
      *(_QWORD *)(v6 + 64) = v43;
      *(_QWORD *)(v6 + 72) = v71;
      *(_QWORD *)(v6 + 80) = &v69[8 * v68];
      if (v9)
      {
        operator delete(v9);
        v43 = *(char **)(v6 + 64);
      }
    }
    else
    {
      v43 = v9;
    }
    *((_QWORD *)v43 - 1) = v30;
    v82 = *(char **)(v6 + 64);
    v83 = *(char **)(v6 + 72);
    *(_QWORD *)(v6 + 64) = v82 - 8;
    v84 = *((_QWORD *)v82 - 1);
    *(_QWORD *)(v6 + 64) = v82;
    if (v83 != *(char **)(v6 + 80))
    {
LABEL_90:
      *(_QWORD *)v83 = v84;
      goto LABEL_106;
    }
    v85 = *(char **)(v6 + 56);
    if (v82 > v85)
    {
      v86 = (v82 - v85) >> 3;
      if (v86 >= -1)
        v87 = v86 + 1;
      else
        v87 = v86 + 2;
      v88 = v87 >> 1;
      v89 = -v88;
      v90 = &v82[-8 * v88];
      v91 = v83 - v82;
      if (v91)
      {
        memmove(&v82[-8 * v88], v82, v91);
        v82 = *(char **)(v6 + 64);
      }
      v92 = &v90[v91];
      *(_QWORD *)(v6 + 64) = &v82[8 * v89];
      *(_QWORD *)(v6 + 72) = v92;
      *(_QWORD *)v92 = v84;
      goto LABEL_106;
    }
    if (v83 == v85)
      v109 = 1;
    else
      v109 = (v83 - v85) >> 2;
    if (v109 >> 61)
      goto LABEL_147;
    v110 = (char *)operator new(8 * v109);
    v111 = &v110[8 * (v109 >> 2)];
    v112 = v83 - v82;
    v39 = v83 == v82;
    v83 = v111;
    if (!v39)
    {
      v83 = &v111[v112 & 0xFFFFFFFFFFFFFFF8];
      v113 = v112 - 8;
      if (v113 < 0x38)
      {
        v114 = &v110[8 * (v109 >> 2)];
        do
        {
LABEL_139:
          v123 = *(_QWORD *)v82;
          v82 += 8;
          *(_QWORD *)v114 = v123;
          v114 += 8;
        }
        while (v114 != v83);
        goto LABEL_140;
      }
      v115 = &v110[8 * (v109 >> 2)];
      v114 = v115;
      if ((unint64_t)(v115 - v82) < 0x20)
        goto LABEL_139;
      v116 = (v113 >> 3) + 1;
      v117 = 8 * (v116 & 0x3FFFFFFFFFFFFFFCLL);
      v114 = &v111[v117];
      v118 = &v82[v117];
      v119 = (__int128 *)(v82 + 16);
      v120 = v115 + 16;
      v121 = v116 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v122 = *v119;
        *(v120 - 1) = *(v119 - 1);
        *v120 = v122;
        v119 += 2;
        v120 += 2;
        v121 -= 4;
      }
      while (v121);
      v82 = v118;
      if (v116 != (v116 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_139;
    }
LABEL_140:
    *(_QWORD *)(v6 + 56) = v110;
    *(_QWORD *)(v6 + 64) = v111;
    *(_QWORD *)(v6 + 72) = v83;
    *(_QWORD *)(v6 + 80) = &v110[8 * v109];
    if (v85)
    {
      operator delete(v85);
      v83 = *(char **)(v6 + 72);
    }
    goto LABEL_90;
  }
  dispatch_release(a3);
LABEL_120:
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 44));
  v25 = v128;
LABEL_121:
  p_shared_owners = (unint64_t *)&v25->__shared_owners_;
  do
    v107 = __ldaxr(p_shared_owners);
  while (__stlxr(v107 - 1, p_shared_owners));
  if (!v107)
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
LABEL_125:
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  return 0;
}

void sub_20E5D936C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12)
{
  std::__shared_weak_count *v12;
  void *v13;

  operator delete(__p);
  operator delete(v13);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020E5DCDBDLL)
    return a1 + 24;
  if (((v3 & 0x800000020E5DCDBDLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000020E5DCDBDLL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020E5DCDBDLL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t mav_router_service_register_receive(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    result = 0;
    v6 = *(_QWORD *)(a1 + 8) + 48 * a2;
    *(_QWORD *)(v6 + 16) = a3;
    *(_QWORD *)(v6 + 24) = a4;
  }
  return result;
}

uint64_t mav_router_service_unregister_receive(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    result = 0;
    v5 = *(_QWORD *)(a1 + 8) + 48 * a2;
    *(_QWORD *)(v5 + 16) = 0;
    *a3 = *(_QWORD *)(v5 + 24);
  }
  return result;
}

uint64_t mav_router_service_register_error_handler(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    result = 0;
    v6 = *(_QWORD *)(a1 + 8) + 48 * a2;
    *(_QWORD *)(v6 + 32) = a3;
    *(_QWORD *)(v6 + 40) = a4;
  }
  return result;
}

uint64_t mav_router_service_unregister_error_handler(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v4;

  if (!a1 || *(_DWORD *)a1 <= a2)
    return 1;
  result = 0;
  v4 = *(_QWORD *)(a1 + 8) + 48 * a2;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  return result;
}

uint64_t mav_router_init_context(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;

  bzero(*((void **)a1 + 1), 48 * *a1);
  v2 = *a1;
  if ((_DWORD)v2)
  {
    v3 = *((_QWORD *)a1 + 1);
    if ((_DWORD)v2 == 1)
    {
      v4 = 0;
LABEL_7:
      v7 = (_DWORD *)(v3 + 48 * v4);
      do
      {
        *v7 = v4;
        v7 += 12;
        ++v4;
      }
      while (v2 != v4);
      goto LABEL_9;
    }
    v5 = 0;
    v4 = v2 & 0xFFFFFFFE;
    v6 = (_DWORD *)*((_QWORD *)a1 + 1);
    do
    {
      *v6 = v5;
      v6[12] = v5 + 1;
      v5 += 2;
      v6 += 24;
    }
    while (v4 != v5);
    if (v4 != v2)
      goto LABEL_7;
  }
LABEL_9:
  bzero(*((void **)a1 + 2), 40 * a1[1]);
  v8 = a1[1];
  if (!(_DWORD)v8)
    return 0;
  v9 = *((_QWORD *)a1 + 2);
  if ((_DWORD)v8 == 1)
  {
    v10 = 0;
LABEL_15:
    v13 = (_DWORD *)(v9 + 40 * v10);
    do
    {
      *v13 = v10;
      v13 += 10;
      ++v10;
    }
    while (v8 != v10);
    return 0;
  }
  v11 = 0;
  v10 = v8 & 0xFFFFFFFE;
  v12 = (_DWORD *)*((_QWORD *)a1 + 2);
  do
  {
    *v12 = v11;
    v12[10] = v11 + 1;
    v11 += 2;
    v12 += 20;
  }
  while (v10 != v11);
  if (v10 != v8)
    goto LABEL_15;
  return 0;
}

uint64_t mav_router_route(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;

  if (!a1 || *(_DWORD *)a1 <= a2 || *(_DWORD *)(a1 + 4) <= a3)
    return 1;
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = v3 + 40 * a3;
  *(_QWORD *)(v4 + 48 * a2 + 8) = v5;
  v6 = *(_DWORD *)(v5 + 16);
  *(_DWORD *)(v5 + 16) = v6 + 1;
  result = 0;
  if (!v6)
    *(_QWORD *)(v3 + 40 * a3 + 8) = v4 + 48 * a2;
  return result;
}

uint64_t mav_router_unroute(unsigned int *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  if (!a1)
    return 1;
  v2 = *a1;
  if (v2 <= a2)
    return 1;
  v3 = *((_QWORD *)a1 + 1);
  v4 = v3 + 48 * a2;
  v7 = *(_QWORD *)(v4 + 8);
  v5 = (_QWORD *)(v4 + 8);
  v6 = v7;
  if (!v7)
    return 3;
  v8 = *(_DWORD *)(v6 + 16);
  *(_DWORD *)(v6 + 16) = v8 - 1;
  if (v8 == 1)
  {
    result = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *v5 = 0;
  }
  else if (v8 == 2)
  {
    while (1)
    {
      v9 = *(_QWORD *)(v3 + 8);
      if (v9 == v6)
        break;
      v3 += 48;
      if (!--v2)
      {
        result = v9 != v6;
        *v5 = 0;
        return result;
      }
    }
    *(_QWORD *)(v6 + 8) = v3;
    result = 0;
    *v5 = 0;
  }
  else
  {
    result = 0;
    *v5 = 0;
  }
  return result;
}

uint64_t mav_router_unroute_all(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;

  if (!a1)
    return 1;
  v1 = *a1;
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = *((_QWORD *)a1 + 1);
    do
    {
      v4 = v3 + 48 * v2;
      v7 = *(_QWORD *)(v4 + 8);
      v5 = (_QWORD *)(v4 + 8);
      v6 = v7;
      if (v7)
      {
        v8 = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(v6 + 16) = v8 - 1;
        if (v8 == 1)
        {
          *(_QWORD *)(v6 + 8) = 0;
        }
        else if (v8 == 2)
        {
          v9 = v1;
          for (i = v3; *(_QWORD *)(i + 8) != v6; i += 48)
          {
            if (!--v9)
            {
              *v5 = 0;
              return 1;
            }
          }
          *(_QWORD *)(v6 + 8) = i;
        }
        *v5 = 0;
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return 0;
}

uint64_t mav_router_swap(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  if (!a1)
    return 1;
  if (*(_DWORD *)a1 <= a2 || *(_DWORD *)a1 <= a3)
    return 1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = v5 + 48 * a2;
  v9 = *(_QWORD *)(v6 + 8);
  v7 = (_QWORD *)(v6 + 8);
  v8 = v9;
  if (!v9)
    return 1;
  v10 = v5 + 48 * a3;
  v13 = *(_QWORD *)(v10 + 8);
  v11 = v10 + 8;
  v12 = v13;
  if (!v13)
    return 1;
  result = 0;
  *(_QWORD *)v11 = v8;
  *v7 = v12;
  v15 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(v12 + 8) = v15 + 48 * a2;
  *(_QWORD *)(*(_QWORD *)v11 + 8) = v15 + 48 * a3;
  return result;
}

uint64_t mav_router_get_pci_control_device(int a1)
{
  return (a1 + 13);
}

uint64_t mav_router_get_hsic_control_device(int a1)
{
  return (2 * a1 + 4);
}

uint64_t mav_router_get_qmi_channel(int a1)
{
  return (a1 + 4);
}

void mav_router_t::create(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  NSObject *v5;
  void *v6;
  std::string *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v14;
  unint64_t v15;
  unint64_t *p_shared_weak_owners;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  __int128 v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  mav_router_t *v36[2];
  __int128 v37;
  std::string __p;
  dispatch_object_t object;
  uint64_t v40;
  unsigned int v41;

  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = (char *)operator new(0x68uLL);
  v37 = *a1;
  if (*((char *)a1 + 39) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a1 + 2), *((_QWORD *)a1 + 3));
  else
    __p = *(std::string *)(a1 + 1);
  v5 = *((_QWORD *)a1 + 5);
  object = v5;
  if (v5)
    dispatch_retain(v5);
  v40 = *((_QWORD *)a1 + 6);
  v41 = *((_DWORD *)a1 + 14);
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v6 = operator new(0x18uLL);
  *((_QWORD *)v4 + 3) = 0;
  *((_QWORD *)v4 + 2) = v6;
  *((_QWORD *)v4 + 4) = 0;
  *(_OWORD *)(v4 + 40) = v37;
  v7 = (std::string *)(v4 + 56);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v7, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)v4 + 9) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  v8 = object;
  *((_QWORD *)v4 + 10) = object;
  if (v8)
    dispatch_retain(v8);
  *((_QWORD *)v4 + 11) = v40;
  *((_DWORD *)v4 + 24) = v41;
  v9 = HIDWORD(v40);
  v10 = *((_QWORD *)v4 + 2);
  *(_DWORD *)v10 = HIDWORD(v40);
  v11 = v41;
  *(_DWORD *)(v10 + 4) = v41;
  *(_QWORD *)(v10 + 8) = operator new[](48 * v9);
  *(_QWORD *)(v10 + 16) = operator new[](40 * v11);
  *a2 = (uint64_t)v4;
  v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)off_24C971870;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  a2[1] = (uint64_t)v12;
  v36[0] = 0;
  v14 = (std::__shared_weak_count *)*((_QWORD *)v4 + 1);
  if (v14)
  {
    if (v14->__shared_owners_ != -1)
      goto LABEL_24;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    do
      v17 = __ldxr(p_shared_weak_owners);
    while (__stxr(v17 + 1, p_shared_weak_owners));
    *(_QWORD *)v4 = v4;
    *((_QWORD *)v4 + 1) = v12;
    std::__shared_weak_count::__release_weak(v14);
  }
  else
  {
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
    v19 = (unint64_t *)&v12->__shared_weak_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    *(_QWORD *)v4 = v4;
    *((_QWORD *)v4 + 1) = v12;
  }
  do
    v21 = __ldaxr(p_shared_owners);
  while (__stlxr(v21 - 1, p_shared_owners));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_24:
  if (v36[0])
  {
    mav_router_t::~mav_router_t(v36[0]);
    operator delete(v22);
  }
  if (object)
    dispatch_release(object);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v24 = *a2;
  v23 = (std::__shared_weak_count *)a2[1];
  v34 = *a2;
  v35 = v23;
  if (v23)
  {
    v25 = (unint64_t *)&v23->__shared_weak_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  mav_router::device::controller::create(&v34, v36);
  v27 = *(_OWORD *)v36;
  v36[0] = 0;
  v36[1] = 0;
  v28 = *(std::__shared_weak_count **)(v24 + 32);
  *(_OWORD *)(v24 + 24) = v27;
  if (v28)
  {
    v29 = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = (std::__shared_weak_count *)v36[1];
  if (v36[1])
  {
    v32 = (unint64_t *)((char *)v36[1] + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  if (v35)
    std::__shared_weak_count::__release_weak(v35);
}

void sub_20E5D9BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v8;
  va_list va;

  va_start(va, a5);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v6);
  v8 = (std::__shared_weak_count *)v5[1];
  if (v8)
    std::__shared_weak_count::__release_weak(v8);
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)va);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void mav_router_parameters_t::~mav_router_parameters_t(mav_router_parameters_t *this)
{
  NSObject *v2;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    dispatch_release(v2);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

void mav_router_t::create(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  NSObject *v5;
  __int128 v6;
  std::string __p;
  dispatch_object_t object;
  uint64_t v9;
  int v10;

  *(_QWORD *)(a2 + 52) = *a1;
  v6 = *(_OWORD *)a2;
  if ((*(char *)(a2 + 39) & 0x80000000) == 0)
  {
    __p = *(std::string *)(a2 + 16);
    v5 = *(NSObject **)(a2 + 40);
    object = v5;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 16), *(_QWORD *)(a2 + 24));
  v5 = *(NSObject **)(a2 + 40);
  object = v5;
  if (v5)
LABEL_3:
    dispatch_retain(v5);
LABEL_4:
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_DWORD *)(a2 + 56);
  mav_router_t::create(&v6, a3);
  if (object)
    dispatch_release(object);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5D9D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)&a9);
  _Unwind_Resume(a1);
}

void mav_router_t::create(_QWORD *a1@<X0>, int a2@<W1>, uint64_t *a3@<X8>)
{
  __int128 v6;
  char *v7;
  __int128 v8;
  std::string __p;
  dispatch_object_t object;
  uint64_t v11;
  int v12;
  __int128 v13;
  char *v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = v6;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v7 = (char *)operator new(0x38uLL);
  v14 = v7;
  v15 = xmmword_20E5DCE30;
  strcpy(v7, "/var/wireless/Library/Logs/CoreTelephonyTraceScratch");
  v16 = 0;
  *(_QWORD *)&v17 = 0xB00000015;
  DWORD2(v17) = 17;
  LODWORD(v13) = a2;
  v8 = v13;
  std::string::__init_copy_ctor_external(&__p, v7, 0x34uLL);
  object = 0;
  v11 = v17;
  v12 = DWORD2(v17);
  mav_router_t::create(a1, (uint64_t)&v8, a3);
  if (object)
    dispatch_release(object);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  operator delete(v7);
}

void sub_20E5D9EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)&a9);
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)&a17);
  _Unwind_Resume(a1);
}

void sub_20E5D9ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)va);
  _Unwind_Resume(a1);
}

uint64_t mav_router_t::get_channel_for_service(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 8))(*(_QWORD *)(a1 + 24));
}

mav_router_t **std::unique_ptr<mav_router_t>::~unique_ptr[abi:ne180100](mav_router_t **a1)
{
  mav_router_t *v2;
  void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    mav_router_t::~mav_router_t(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::__on_zero_shared(uint64_t a1)
{
  mav_router_t *v1;
  void *v2;

  v1 = *(mav_router_t **)(a1 + 24);
  if (v1)
  {
    mav_router_t::~mav_router_t(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020E5DCEC5)
    return a1 + 24;
  if (((v3 & 0x800000020E5DCEC5 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000020E5DCEC5))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020E5DCEC5 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void mav_router_t::~mav_router_t(mav_router_t *this)
{
  void **v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;

  v2 = (void **)*((_QWORD *)this + 2);
  if (v2[1])
  {
    operator delete[](v2[1]);
    v2 = (void **)*((_QWORD *)this + 2);
  }
  v2[1] = 0;
  if (v2[2])
  {
    operator delete[](v2[2]);
    v2 = (void **)*((_QWORD *)this + 2);
  }
  operator delete(v2);
  *((_QWORD *)this + 2) = 0;
  v3 = *((_QWORD *)this + 10);
  if (v3)
    dispatch_release(v3);
  if (*((char *)this + 79) < 0)
  {
    operator delete(*((void **)this + 7));
    v4 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (!v4)
      goto LABEL_14;
  }
  else
  {
    v4 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
    if (!v4)
      goto LABEL_14;
  }
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (v6)
  {
LABEL_14:
    v7 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (!v7)
      return;
    goto LABEL_15;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  v7 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v7)
    return;
LABEL_15:
  std::__shared_weak_count::__release_weak(v7);
}

void mav_router_ios_preferences::mav_router_ios_preferences(mav_router_ios_preferences *this)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = off_24C9718C0;
}

{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = off_24C9718C0;
}

uint64_t mav_router_ios_preferences::should_use_qmi_over_pci(capabilities::ipc *a1, int a2)
{
  if ((a2 - 3) >= 2)
    return capabilities::ipc::supportsPCI(a1);
  else
    return 0;
}

uint64_t mav_router_ios_preferences::should_use_qmi_over_uart()
{
  return 0;
}

BOOL mav_router_ios_preferences::should_start_with_reliable_uart(uint64_t a1, int a2)
{
  return a2 == 3;
}

uint64_t mav_router_ios_preferences::should_enable_reliable_uart(uint64_t a1, unsigned int a2)
{
  return (a2 < 5) & (0xCu >> a2);
}

uint64_t mav_router_ios_preferences::get_max_pci_read_params(mav_router_ios_preferences *this, unsigned int *a2, unsigned int *a3)
{
  *a2 = 6144;
  *a3 = 8;
  if (capabilities::radio::mavLegacy(this))
    *a3 = 4;
  return 1;
}

void mav_router_ios_preferences::~mav_router_ios_preferences(mav_router_ios_preferences *this)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  *(_QWORD *)this = off_24C9718C0;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
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

  *(_QWORD *)this = off_24C9718C0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
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

uint64_t mav_router::device::null_shim::handle_transmit(mav_router::device::null_shim *this, dispatch_object_t object)
{
  dispatch_release(object);
  return 0;
}

void mav_router::device::null_shim::~null_shim(mav_router::device::null_shim *this)
{
  std::__shared_weak_count *v1;

  *(_QWORD *)this = off_24C971560;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = off_24C971560;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(this);
}

uint64_t mav_router::device::null_shim::engage(mav_router::device::null_shim *this, dispatch_group_s *a2)
{
  return 0;
}

uint64_t mav_router::device::null_shim::tearDown(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::recover(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::enterLowPower(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::exitLowPower(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::hasFatalErrorOccurred(mav_router::device::null_shim *this, BOOL *a2)
{
  *a2 = 0;
  return 0;
}

uint64_t mav_router::device::null_shim::getFatalErrorReason()
{
  return 0;
}

uint64_t mav_router::device::null_shim::snapshot()
{
  return 0;
}

uint64_t mav_router::device::null_shim::getMaxPayload(mav_router::device::null_shim *this, unint64_t *a2)
{
  *a2 = -1;
  return 0;
}

uint64_t mav_mux_init_paramameters(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (!a3)
    return 1;
  result = 0;
  *a3 = 0;
  a3[1] = a2;
  *(_DWORD *)a3 = a1;
  return result;
}

uint64_t mav_mux_encode(uint64_t a1)
{
  dispatch_data_t *v2;
  NSObject *global_queue;
  NSObject *v4;
  NSObject *v5;
  dispatch_data_t concat;
  NSObject *v7;
  dispatch_data_t *v8;
  NSObject *v9;
  dispatch_data_t v10;
  NSObject *v11;
  uint64_t v12;
  char v14;
  _WORD buffer[2];
  int v16;

  if (!a1)
    return 1;
  buffer[0] = -16657;
  buffer[1] = *(_DWORD *)a1;
  v2 = *(dispatch_data_t **)(a1 + 8);
  LOWORD(v16) = dispatch_data_get_size(*v2);
  v16 = (unsigned __int16)v16;
  v14 = -91;
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = dispatch_data_create(buffer, 8uLL, global_queue, 0);
  if (v4)
  {
    v5 = v4;
    concat = dispatch_data_create_concat(v4, *v2);
    if (!concat)
      goto LABEL_9;
    v7 = concat;
    dispatch_release(*v2);
    *v2 = v7;
    dispatch_release(v5);
    v8 = *(dispatch_data_t **)(a1 + 8);
    v9 = dispatch_data_create(&v14, 1uLL, global_queue, 0);
    if (v9)
    {
      v5 = v9;
      v10 = dispatch_data_create_concat(*v8, v9);
      if (v10)
      {
        v11 = v10;
        dispatch_release(*v8);
        v12 = 0;
        *v8 = v11;
LABEL_10:
        dispatch_release(v5);
        return v12;
      }
LABEL_9:
      v12 = 2;
      goto LABEL_10;
    }
  }
  return 2;
}

uint64_t mav_mux_decode(dispatch_data_t *a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v5;
  unsigned int size;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  unsigned int v12;
  dispatch_data_t subrange;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  dispatch_data_t v25;
  NSObject *v26;
  int v27;
  unsigned __int8 v28;
  uint64_t v29;
  int v30;
  uint64_t applier;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, int, uint64_t, unint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  int *v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  unsigned __int8 *v46;

  v29 = 0;
  v28 = 0;
  result = 1;
  if (!a1 || !a2)
    return result;
  *(_DWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *a1;
  if ((dispatch_data_get_size(*a1) & 0xFFFFFFF8) == 0)
    return 3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2000000000;
  v46 = (unsigned __int8 *)&v29;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2000000000;
  v42 = -1431655766;
  size = dispatch_data_get_size(v5);
  v30 = 0;
  v7 = size >= 8 ? 8 : size;
  v42 = v7;
  v8 = MEMORY[0x24BDAC760];
  applier = MEMORY[0x24BDAC760];
  v32 = 1107296256;
  v33 = __mav_buffer_copy_raw_block_invoke;
  v34 = &__block_descriptor_tmp_2;
  v38 = 0;
  v35 = &v39;
  v36 = &v43;
  v37 = &v30;
  v9 = dispatch_data_apply(v5, &applier);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  v10 = v30 == 8 ? 0 : 102;
  if (v9)
  {
    if (v30 == 8)
    {
      v11 = *a1;
      v12 = dispatch_data_get_size(*a1);
      if (v12 < 8)
        return 3;
      if (v12 == 8)
      {
        v14 = 0;
      }
      else
      {
        subrange = dispatch_data_create_subrange(v11, 8uLL, v12 - 8);
        if (!subrange)
          return 3;
        v14 = subrange;
        v11 = *a1;
      }
      dispatch_release(v11);
      v10 = 0;
      *a1 = v14;
    }
  }
  else
  {
    v10 = 103;
  }
  result = 3;
  if (v10)
    return result;
  if ((unsigned __int16)v29 != 48879)
    return result;
  v15 = *a1;
  if (!*a1)
    return result;
  v16 = dispatch_data_get_size(*a1);
  v17 = v16;
  if (v16 < 2)
    return 3;
  v18 = v16 - 1;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2000000000;
  v46 = &v28;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2000000000;
  v42 = -1431655766;
  v19 = dispatch_data_get_size(v15);
  v30 = 0;
  v20 = 102;
  v21 = v19 - v18;
  if (v19 >= v18)
  {
    if (v17 <= v19)
      v21 = 1;
    v42 = v21;
    applier = v8;
    v32 = 1107296256;
    v33 = __mav_buffer_copy_raw_block_invoke;
    v34 = &__block_descriptor_tmp_2;
    v38 = v18;
    v35 = &v39;
    v36 = &v43;
    v37 = &v30;
    if (dispatch_data_apply(v15, &applier))
      v20 = 0;
    else
      v20 = 103;
  }
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  if (v30 == 1)
    v22 = 0;
  else
    v22 = 102;
  if (!v20)
  {
    if (v30 != 1)
      goto LABEL_38;
    v23 = *a1;
    v24 = dispatch_data_get_size(*a1);
    if ((v24 & 0xFFFFFFFE) != 0)
    {
      v25 = dispatch_data_create_subrange(v23, 0, (v24 - 1));
      if (v25)
      {
        v26 = v25;
        dispatch_release(*a1);
        v22 = 0;
        *a1 = v26;
        goto LABEL_38;
      }
    }
    return 3;
  }
  v22 = v20;
LABEL_38:
  result = 3;
  if (!v22 && v28 == 165)
  {
    v27 = dispatch_data_get_size(*a1);
    if (HIDWORD(v29) == v27)
    {
      result = 0;
      *(_DWORD *)a2 = WORD1(v29);
      *(_QWORD *)(a2 + 8) = a1;
      return result;
    }
    return 3;
  }
  return result;
}

uint64_t __mav_buffer_copy_raw_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  int v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v10;
  size_t v11;

  v5 = *(_DWORD *)(a1 + 56) - a3;
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)v6)
    v7 = v5 < (int)a5;
  else
    v7 = 0;
  if (!v7)
    return 1;
  v10 = v5 & ~(v5 >> 31);
  if (v6 >= a5)
    v11 = a5;
  else
    v11 = v6;
  memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (const void *)(a4 + v10), v11);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) -= v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v11;
  **(_DWORD **)(a1 + 48) += v11;
  return 1;
}

void __copy_helper_block_8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
}

void __destroy_helper_block_8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t __mav_log_platform_os_log_handle(unsigned int a1)
{
  uint64_t v2;
  dispatch_once_t *v3;
  _QWORD block[4];
  unsigned int v6;

  v2 = a1;
  v3 = &__mav_log_platform_os_log_handle::once[a1];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ____mav_log_platform_os_log_handle_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  v6 = a1;
  if (*v3 != -1)
    dispatch_once(v3, block);
  return __mav_log_platform_os_log_handle::logger[v2];
}

os_log_t ____mav_log_platform_os_log_handle_block_invoke(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.telephony.ipc", kRouterLogCategory[*(unsigned int *)(a1 + 32)]);
  __mav_log_platform_os_log_handle::logger[*(unsigned int *)(a1 + 32)] = (uint64_t)result;
  return result;
}

uint64_t mav_router::device::controller_ios::controller_ios(uint64_t a1, _QWORD *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  capabilities::ipc *v9;
  capabilities::ipc *v10;
  __int128 v11;
  uint64_t v12;
  capabilities::pci *v13;
  char v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  mav_router::device::pci_shim *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count_vtbl *v46;
  std::__shared_weak_count_vtbl *v47;
  std::__shared_weak_count *v48;
  uint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  std::__shared_weak_count *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  uint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t v73;
  uint64_t v74;
  void *__p[2];
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  _QWORD v80[2];
  uint8_t buf[8];
  uint64_t v82;
  __int128 v83;
  int v84;
  __int16 v85;
  int v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = (std::__shared_weak_count *)a2[1];
  v80[0] = *a2;
  v80[1] = v4;
  if (v4)
  {
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
  }
  mav_router::device::controller::controller(a1, v80);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  *(_QWORD *)a1 = &off_24C971A08;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 48) = a1 + 56;
  *(_DWORD *)(a1 + 72) = 3;
  v78 = 0;
  v79 = 0;
  v7 = *(std::__shared_weak_count **)(a1 + 40);
  if (v7 && (v79 = std::__shared_weak_count::lock(v7)) != 0)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v78 = v8;
  }
  else
  {
    v8 = 0;
  }
  mav_router::device::controller_ios::determine_mappings((mav_router::device::controller_ios *)a1);
  v9 = (capabilities::ipc *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  if ((*(_DWORD *)(v8 + 40) - 3) >= 2)
  {
    v10 = (capabilities::ipc *)capabilities::ipc::supportsPCI(v9);
    if ((_DWORD)v10)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v73 = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = 0u;
      v76 = 0u;
      v77 = v11;
      v12 = capabilities::ipc::controlDataPrintSizeBytes(v10);
      v13 = (capabilities::pci *)__p;
      v74 = v12;
      if (__p != (void **)(v8 + 56))
      {
        v14 = *(_BYTE *)(v8 + 79);
        if (SBYTE7(v76) < 0)
        {
          if (v14 >= 0)
            v15 = (void *)(v8 + 56);
          else
            v15 = *(void **)(v8 + 56);
          if (v14 >= 0)
            v16 = *(unsigned __int8 *)(v8 + 79);
          else
            v16 = *(_QWORD *)(v8 + 64);
          v13 = (capabilities::pci *)std::string::__assign_no_alias<false>(__p, v15, v16);
          v8 = v78;
        }
        else if ((*(_BYTE *)(v8 + 79) & 0x80) != 0)
        {
          v13 = (capabilities::pci *)std::string::__assign_no_alias<true>(__p, *(void **)(v8 + 56), *(_QWORD *)(v8 + 64));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)(v8 + 56);
          *(_QWORD *)&v76 = *(_QWORD *)(v8 + 72);
        }
      }
      v17 = *(_QWORD *)(v8 + 80);
      *((_QWORD *)&v76 + 1) = *(_QWORD *)(v8 + 48);
      *(_QWORD *)&v77 = v17;
      DWORD2(v77) = *(_DWORD *)(v8 + 88);
      v18 = capabilities::pci::controlChannelCount(v13);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v82 = 0x40000000;
      *(_QWORD *)&v83 = ____mav_log_platform_os_log_handle_block_invoke;
      *((_QWORD *)&v83 + 1) = &__block_descriptor_tmp_3;
      v84 = 0;
      if (__mav_log_platform_os_log_handle::once[0] != -1)
        dispatch_once(__mav_log_platform_os_log_handle::once, buf);
      v19 = __mav_log_platform_os_log_handle::logger[0];
      if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = 0;
        v82 = 0x400000000010400;
        LODWORD(v83) = 0;
        WORD2(v83) = 2080;
        *(_QWORD *)((char *)&v83 + 6) = "mav_router::device::controller_ios::controller_ios(mav_router_weak_ptr_t)";
        HIWORD(v83) = 1024;
        v84 = 37;
        v85 = 1024;
        v86 = v18;
        _os_log_impl(&dword_20E5D1000, v19, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:PCI supported with %u control channels", buf, 0x2Au);
      }
      if (v18)
      {
        v20 = 0;
        while (1)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          v82 = 0x40000000;
          *(_QWORD *)&v83 = ____mav_log_platform_os_log_handle_block_invoke;
          *((_QWORD *)&v83 + 1) = &__block_descriptor_tmp_3;
          v84 = 0;
          if (__mav_log_platform_os_log_handle::once[0] == -1)
            break;
          dispatch_once(__mav_log_platform_os_log_handle::once, buf);
          v21 = __mav_log_platform_os_log_handle::logger[0];
          if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
            goto LABEL_33;
LABEL_34:
          LODWORD(v73) = v20;
          v22 = operator new(0xD8uLL);
          v23 = v22;
          v24 = (std::__shared_weak_count *)a2[1];
          v71 = *a2;
          v72 = v24;
          if (v24)
          {
            v25 = (unint64_t *)&v24->__shared_weak_owners_;
            do
              v26 = __ldxr(v25);
            while (__stxr(v26 + 1, v25));
          }
          mav_router::device::pci_shim::pci_shim((uint64_t)v22, &v71, v20 + 13, (uint64_t)&v73);
          *(_QWORD *)buf = v23;
          v27 = (std::__shared_weak_count *)operator new(0x20uLL);
          v27->__shared_owners_ = 0;
          p_shared_owners = (unint64_t *)&v27->__shared_owners_;
          v27->__vftable = (std::__shared_weak_count_vtbl *)off_24C971AC0;
          v27->__shared_weak_owners_ = 0;
          v27[1].__vftable = (std::__shared_weak_count_vtbl *)v23;
          v82 = (uint64_t)v27;
          v29 = (std::__shared_weak_count *)*((_QWORD *)v23 + 5);
          if (v29)
          {
            if (v29->__shared_owners_ != -1)
              goto LABEL_49;
            do
              v30 = __ldxr(p_shared_owners);
            while (__stxr(v30 + 1, p_shared_owners));
            v31 = (unint64_t *)&v27->__shared_weak_owners_;
            do
              v32 = __ldxr(v31);
            while (__stxr(v32 + 1, v31));
            *((_QWORD *)v23 + 4) = v23;
            *((_QWORD *)v23 + 5) = v27;
            std::__shared_weak_count::__release_weak(v29);
          }
          else
          {
            do
              v33 = __ldxr(p_shared_owners);
            while (__stxr(v33 + 1, p_shared_owners));
            v34 = (unint64_t *)&v27->__shared_weak_owners_;
            do
              v35 = __ldxr(v34);
            while (__stxr(v35 + 1, v34));
            *((_QWORD *)v23 + 4) = v23;
            *((_QWORD *)v23 + 5) = v27;
          }
          do
            v36 = __ldaxr(p_shared_owners);
          while (__stlxr(v36 - 1, p_shared_owners));
          if (!v36)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
            v37 = v72;
            if (!v72)
              goto LABEL_51;
LABEL_50:
            std::__shared_weak_count::__release_weak(v37);
            goto LABEL_51;
          }
LABEL_49:
          v37 = v72;
          if (v72)
            goto LABEL_50;
LABEL_51:
          v38 = *(mav_router::device::pci_shim **)buf;
          mav_router::device::pci_shim::init(*(mav_router::device::pci_shim **)buf);
          v39 = (std::__shared_weak_count *)v82;
          if (v82)
          {
            v40 = (unint64_t *)(v82 + 8);
            do
              v41 = __ldxr(v40);
            while (__stxr(v41 + 1, v40));
          }
          v42 = operator new(0x20uLL);
          v42[2] = v38;
          v42[3] = v39;
          v43 = *(_QWORD *)(a1 + 8);
          *v42 = v43;
          v42[1] = a1 + 8;
          *(_QWORD *)(v43 + 8) = v42;
          *(_QWORD *)(a1 + 8) = v42;
          ++*(_QWORD *)(a1 + 24);
          if (v39)
          {
            v44 = (unint64_t *)&v39->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
              std::__shared_weak_count::__release_weak(v39);
            }
          }
          if (++v20 == v18)
            goto LABEL_63;
        }
        v21 = __mav_log_platform_os_log_handle::logger[0];
        if (!os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
          goto LABEL_34;
LABEL_33:
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = 0;
        v82 = 0x400000000010400;
        LODWORD(v83) = 0;
        WORD2(v83) = 2080;
        *(_QWORD *)((char *)&v83 + 6) = "mav_router::device::controller_ios::controller_ios(mav_router_weak_ptr_t)";
        HIWORD(v83) = 1024;
        v84 = 41;
        v85 = 1024;
        v86 = v20;
        _os_log_impl(&dword_20E5D1000, v21, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:Create pci control for interface %u", buf, 0x2Au);
        goto LABEL_34;
      }
LABEL_63:
      if (SBYTE7(v76) < 0)
        operator delete(__p[0]);
    }
  }
  v46 = (std::__shared_weak_count_vtbl *)operator new(0x20uLL);
  v47 = v46;
  v49 = *a2;
  v48 = (std::__shared_weak_count *)a2[1];
  if (v48)
  {
    v50 = (unint64_t *)&v48->__shared_weak_owners_;
    do
      v51 = __ldxr(v50);
    while (__stxr(v51 + 1, v50));
    do
      v52 = __ldxr(v50);
    while (__stxr(v52 + 1, v50));
  }
  v46->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_24C971560;
  v46->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v49;
  v46->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v48;
  v53 = (unint64_t *)&v48->__shared_weak_owners_;
  do
    v54 = __ldxr(v53);
  while (__stxr(v54 + 1, v53));
  LODWORD(v46->__get_deleter) = 16;
  v55 = std::__shared_weak_count::lock(v48);
  v56 = v55;
  v57 = *(_QWORD *)(v49 + 16);
  if (v57 && *(_DWORD *)(v57 + 4) >= 0x11u)
  {
    v58 = *(_QWORD *)(v57 + 16);
    *(_QWORD *)(v58 + 664) = mav_router::device::shim::handle_transmit_static;
    *(_QWORD *)(v58 + 672) = v47;
  }
  v59 = (unint64_t *)&v55->__shared_owners_;
  do
    v60 = __ldaxr(v59);
  while (__stlxr(v60 - 1, v59));
  if (!v60)
  {
    ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
    std::__shared_weak_count::__release_weak(v56);
  }
  std::__shared_weak_count::__release_weak(v48);
  v47->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_24C971908;
  v73 = (unint64_t)v47;
  v61 = (std::__shared_weak_count *)operator new(0x20uLL);
  v61->__shared_owners_ = 0;
  v62 = (unint64_t *)&v61->__shared_owners_;
  v61->__vftable = (std::__shared_weak_count_vtbl *)off_24C971B10;
  v61->__shared_weak_owners_ = 0;
  v61[1].__vftable = v47;
  v74 = (uint64_t)v61;
  std::__shared_weak_count::__release_weak(v48);
  *(_QWORD *)buf = v47;
  v82 = (uint64_t)v61;
  do
    v63 = __ldxr(v62);
  while (__stxr(v63 + 1, v62));
  v64 = operator new(0x20uLL);
  v64[2] = v47;
  v64[3] = v61;
  v65 = *(_QWORD *)(a1 + 8);
  *v64 = v65;
  v64[1] = a1 + 8;
  *(_QWORD *)(v65 + 8) = v64;
  *(_QWORD *)(a1 + 8) = v64;
  ++*(_QWORD *)(a1 + 24);
  do
    v66 = __ldaxr(v62);
  while (__stlxr(v66 - 1, v62));
  if (!v66)
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  v67 = v79;
  if (v79)
  {
    v68 = (unint64_t *)&v79->__shared_owners_;
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
  }
  return a1;
}

void sub_20E5DB0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  char **v30;

  if (a22 < 0)
    operator delete(__p);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a26);
  std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(v30[7]);
  mav_router::device::controller::~controller((mav_router::device::controller *)v30);
  _Unwind_Resume(a1);
}

void sub_20E5DB1C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if ((a22 & 0x80000000) == 0)
    JUMPOUT(0x20E5DB1A0);
  JUMPOUT(0x20E5DB198);
}

void mav_router::device::controller_ios::determine_mappings(mav_router::device::controller_ios *this)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  std::ios_base *v7;
  void *v8;
  uint64_t v9;
  int v10;
  size_t v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const void *__dst[3];
  const void *v29[2];
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint8_t buf[8];
  _BYTE v35[48];
  __int128 v36;
  __int128 __p;
  __int128 v38;
  unint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0x4AAAAAAAAAAAAAALL;
  v30 = 0xC00000000000000;
  v31 = (void *)0xAAAAAA0078756D71;
  BYTE5(v29[1]) = 0;
  HIWORD(v29[1]) = 0;
  strcpy((char *)v29, "qmux_control");
  v1 = (*((_DWORD *)this + 18) - 1);
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)v35 = 0x40000000;
  *(_QWORD *)&v35[8] = ____mav_log_platform_os_log_handle_block_invoke;
  *(_QWORD *)&v35[16] = &__block_descriptor_tmp_3;
  *(_DWORD *)&v35[24] = 0;
  if (__mav_log_platform_os_log_handle::once[0] != -1)
    dispatch_once(__mav_log_platform_os_log_handle::once, buf);
  v2 = __mav_log_platform_os_log_handle::logger[0];
  if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v35 = 1024;
    *(_DWORD *)&v35[2] = 1;
    *(_WORD *)&v35[6] = 1024;
    *(_DWORD *)&v35[8] = 0;
    *(_WORD *)&v35[12] = 2080;
    *(_QWORD *)&v35[14] = "void mav_router::device::controller_ios::determine_mappings()";
    *(_WORD *)&v35[22] = 1024;
    *(_DWORD *)&v35[24] = 106;
    *(_WORD *)&v35[28] = 1024;
    *(_DWORD *)&v35[30] = v1;
    _os_log_impl(&dword_20E5D1000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:Number of local QMI instances %u", buf, 0x2Au);
  }
  if ((_DWORD)v1)
  {
    v3 = 0;
    v5 = *MEMORY[0x24BEDB800];
    v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
    v27 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
    v24 = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v26 = MEMORY[0x24BEDB870] + 64;
    v25 = MEMORY[0x24BEDB848] + 16;
    do
    {
      *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v48 = v6;
      v49 = v6;
      v46 = v6;
      v47 = v6;
      v44 = v6;
      v45 = v6;
      v42 = v6;
      v43 = v6;
      v39 = 0xAAAAAAAAAAAAAAAALL;
      v41 = v6;
      __p = v6;
      v38 = v6;
      *(_OWORD *)&v35[32] = v6;
      v36 = v6;
      *(_OWORD *)v35 = v6;
      *(_OWORD *)&v35[16] = v6;
      v40 = v26;
      *(_QWORD *)buf = v4;
      *(_QWORD *)&buf[*(_QWORD *)(v4 - 24)] = v27;
      v7 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
      std::ios_base::init(v7, v35);
      v7[1].__vftable = 0;
      v7[1].__fmtflags_ = -1;
      *(_QWORD *)buf = MEMORY[0x24BEDB870] + 24;
      v40 = MEMORY[0x24BEDB870] + 64;
      std::streambuf::basic_streambuf();
      *(_QWORD *)v35 = v25;
      __p = 0u;
      v38 = 0u;
      LODWORD(v39) = 16;
      if (v33 >= 0)
        v8 = &v31;
      else
        v8 = v31;
      if (v33 >= 0)
        v9 = HIBYTE(v33);
      else
        v9 = v32;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v8, v9);
      v10 = v3 + 1;
      std::ostream::operator<<();
      memset(__dst, 170, sizeof(__dst));
      if ((v39 & 0x10) != 0)
      {
        v13 = *((_QWORD *)&v38 + 1);
        v14 = (const void **)&v35[40];
        if (*((_QWORD *)&v38 + 1) < (unint64_t)v36)
        {
          *((_QWORD *)&v38 + 1) = v36;
          v13 = v36;
          v14 = (const void **)&v35[40];
        }
      }
      else
      {
        if ((v39 & 8) == 0)
        {
          v11 = 0;
          HIBYTE(__dst[2]) = 0;
          v12 = __dst;
          goto LABEL_28;
        }
        v13 = *(_QWORD *)&v35[32];
        v14 = (const void **)&v35[16];
      }
      v15 = *v14;
      v11 = v13 - (_QWORD)*v14;
      if (v11 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v11 >= 0x17)
      {
        v16 = v1;
        v17 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v11 | 7) != 0x17)
          v17 = v11 | 7;
        v18 = v17 + 1;
        v12 = (const void **)operator new(v17 + 1);
        __dst[1] = (const void *)v11;
        __dst[2] = (const void *)(v18 | 0x8000000000000000);
        __dst[0] = v12;
        v1 = v16;
      }
      else
      {
        HIBYTE(__dst[2]) = v13 - *(_BYTE *)v14;
        v12 = __dst;
        if (!v11)
          goto LABEL_28;
      }
      memmove(v12, v15, v11);
LABEL_28:
      *((_BYTE *)v12 + v11) = 0;
      *((_DWORD *)std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)this + 6, __dst, (uint64_t)__dst)+ 14) = v3 + 4;
      if (SHIBYTE(__dst[2]) < 0)
        operator delete((void *)__dst[0]);
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[*(_QWORD *)(v5 - 24)] = v24;
      *(_QWORD *)v35 = MEMORY[0x24BEDB848] + 16;
      if (SBYTE7(v38) < 0)
        operator delete((void *)__p);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x212BC04F0](&v40);
      ++v3;
    }
    while ((_DWORD)v1 != v10);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)v35 = 0;
  v19 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v19)
  {
    v20 = std::__shared_weak_count::lock(v19);
    *(_QWORD *)v35 = v20;
    if (v20)
      *(_QWORD *)buf = *((_QWORD *)this + 4);
  }
  else
  {
    v20 = 0;
  }
  pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  *((_DWORD *)std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)this + 6, v29, (uint64_t)v29)+ 14) = 4;
  if (!v20)
    goto LABEL_40;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    if ((SHIBYTE(v30) & 0x80000000) == 0)
    {
LABEL_41:
      if ((SHIBYTE(v33) & 0x80000000) == 0)
        return;
LABEL_45:
      operator delete(v31);
      return;
    }
  }
  else
  {
LABEL_40:
    if ((SHIBYTE(v30) & 0x80000000) == 0)
      goto LABEL_41;
  }
  operator delete((void *)v29[0]);
  if (SHIBYTE(v33) < 0)
    goto LABEL_45;
}

void sub_20E5DB6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a38);
  if (a31 < 0)
  {
    operator delete(__p);
    if ((a37 & 0x80000000) == 0)
      goto LABEL_3;
  }
  else if ((a37 & 0x80000000) == 0)
  {
LABEL_3:
    _Unwind_Resume(a1);
  }
  operator delete(a32);
  _Unwind_Resume(a1);
}

void mav_router::device::controller_ios::~controller_ios(mav_router::device::controller_ios *this)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *global_queue;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  mav_router::device::controller_ios *v13;
  uint64_t v14;
  uint64_t *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  mav_router::device::controller_ios *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD block[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  *(_QWORD *)this = &off_24C971A08;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x4002000000;
  v24[3] = __Block_byref_object_copy__0;
  v24[4] = __Block_byref_object_dispose__0;
  v25 = (uint64_t)&v25;
  v26 = &v25;
  v27 = 0;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    v4 = *((_QWORD *)this + 1);
    v3 = (uint64_t *)*((_QWORD *)this + 2);
    v5 = *v3;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v4 + 8);
    **(_QWORD **)(v4 + 8) = v5;
    v6 = v25;
    *(_QWORD *)(v25 + 8) = v3;
    *v3 = v6;
    v25 = v4;
    *(_QWORD *)(v4 + 8) = &v25;
    v27 = v2;
    *((_QWORD *)this + 3) = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1107296256;
  block[2] = ___ZN10mav_router6device14controller_iosD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  block[4] = v24;
  dispatch_async(global_queue, block);
  _Block_object_dispose(v24, 8);
  if (v27)
  {
    v8 = v25;
    v9 = v26;
    v10 = *v26;
    *(_QWORD *)(v10 + 8) = *(_QWORD *)(v25 + 8);
    **(_QWORD **)(v8 + 8) = v10;
    v27 = 0;
    if (v9 != &v25)
    {
      do
      {
        v15 = (uint64_t *)v9[1];
        v16 = (std::__shared_weak_count *)v9[3];
        if (v16)
        {
          p_shared_owners = (unint64_t *)&v16->__shared_owners_;
          do
            v18 = __ldaxr(p_shared_owners);
          while (__stlxr(v18 - 1, p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
        operator delete(v9);
        v9 = v15;
      }
      while (v15 != &v25);
    }
  }
  std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*((char **)this + 7));
  *(_QWORD *)this = &unk_24C9712B0;
  v11 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  if (*((_QWORD *)this + 3))
  {
    v12 = *((_QWORD *)this + 1);
    v13 = (mav_router::device::controller_ios *)*((_QWORD *)this + 2);
    v14 = *(_QWORD *)v13;
    *(_QWORD *)(v14 + 8) = *(_QWORD *)(v12 + 8);
    **(_QWORD **)(v12 + 8) = v14;
    *((_QWORD *)this + 3) = 0;
    if (v13 != (mav_router::device::controller_ios *)((char *)this + 8))
    {
      do
      {
        v19 = (mav_router::device::controller_ios *)*((_QWORD *)v13 + 1);
        v20 = (std::__shared_weak_count *)*((_QWORD *)v13 + 3);
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
        }
        operator delete(v13);
        v13 = v19;
      }
      while (v19 != (mav_router::device::controller_ios *)((char *)this + 8));
    }
  }
}

{
  void *v1;

  mav_router::device::controller_ios::~controller_ios(this);
  operator delete(v1);
}

_QWORD *__Block_byref_object_copy__0(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = result + 5;
  v3 = (_QWORD *)(a2 + 40);
  result[5] = result + 5;
  result[6] = result + 5;
  result[7] = 0;
  v4 = *(_QWORD **)(a2 + 48);
  if (v4 != (_QWORD *)(a2 + 40))
  {
    v5 = result;
    v6 = 0;
    v7 = result + 5;
    do
    {
      result = operator new(0x20uLL);
      v8 = v4[3];
      result[2] = v4[2];
      result[3] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
        v7 = (_QWORD *)v5[5];
        v6 = v5[7];
      }
      *result = v7;
      result[1] = v2;
      v7[1] = result;
      v5[5] = result;
      v5[7] = ++v6;
      v4 = (_QWORD *)v4[1];
      v7 = result;
    }
    while (v4 != v3);
  }
  return result;
}

void sub_20E5DBA70(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  if (v3)
  {
    v6 = *(_QWORD **)(v1 + 48);
    v7 = *v6;
    *(_QWORD *)(v7 + 8) = *(_QWORD *)(v4 + 8);
    **(_QWORD **)(v4 + 8) = v7;
    *(_QWORD *)(v1 + 56) = 0;
    if (v6 != v2)
    {
      v8 = v6;
      do
      {
        v9 = (_QWORD *)v8[1];
        v10 = (std::__shared_weak_count *)v8[3];
        if (v10)
        {
          p_shared_owners = (unint64_t *)&v10->__shared_owners_;
          do
            v12 = __ldaxr(p_shared_owners);
          while (__stlxr(v12 - 1, p_shared_owners));
          if (!v12)
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
        }
        operator delete(v8);
        v8 = v9;
      }
      while (v9 != v2);
    }
  }
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_dispose__0(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  if (a1[7])
  {
    v1 = a1 + 5;
    v2 = a1[5];
    v3 = (uint64_t *)a1[6];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(v2 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[7] = 0;
    if (v3 != a1 + 5)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        v6 = (std::__shared_weak_count *)v3[3];
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
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != v1);
    }
  }
}

void __copy_helper_block_e8_32rc(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void mav_router::device::controller_ios::init_routes(mav_router::device::controller_ios *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  int v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  capabilities::ipc *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t *p_shared_owners;
  unint64_t v30;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (!v2)
  {
    v3 = 0;
LABEL_6:
    v4 = 0;
    v5 = *((_DWORD *)this + 18);
    v6 = (unsigned int *)MEMORY[0x10];
    if (!MEMORY[0x10])
      goto LABEL_20;
    goto LABEL_7;
  }
  v3 = std::__shared_weak_count::lock(v2);
  if (!v3)
    goto LABEL_6;
  v4 = *((_QWORD *)this + 4);
  v5 = *((_DWORD *)this + 18);
  v6 = *(unsigned int **)(v4 + 16);
  if (!v6)
    goto LABEL_20;
LABEL_7:
  v7 = *v6;
  if ((_DWORD)v7)
  {
    v8 = 0;
    v9 = *((_QWORD *)v6 + 1);
    do
    {
      v10 = v9 + 48 * v8;
      v13 = *(_QWORD *)(v10 + 8);
      v11 = (_QWORD *)(v10 + 8);
      v12 = v13;
      if (v13)
      {
        v14 = *(_DWORD *)(v12 + 16);
        *(_DWORD *)(v12 + 16) = v14 - 1;
        if (v14 == 1)
        {
          *(_QWORD *)(v12 + 8) = 0;
        }
        else if (v14 == 2)
        {
          v15 = v7;
          v16 = v9;
          while (*(_QWORD *)(v16 + 8) != v12)
          {
            v16 += 48;
            if (!--v15)
            {
              *v11 = 0;
              goto LABEL_20;
            }
          }
          *(_QWORD *)(v12 + 8) = v16;
        }
        *v11 = 0;
      }
      ++v8;
    }
    while (v8 != v7);
  }
LABEL_20:
  v17 = (capabilities::ipc *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  if ((*(_DWORD *)(v4 + 40) - 3) >= 2)
  {
    v18 = capabilities::ipc::supportsPCI(v17);
    v19 = v5 == 1 ? 0 : v18;
    if (v19 == 1)
    {
      v20 = *(_QWORD *)(v4 + 16);
      if (v20)
      {
        v21 = 1;
LABEL_28:
        v22 = v21 + 3;
        if (*(_DWORD *)v20 > (v21 + 3))
        {
          v23 = v21 + 12;
          if (*(_DWORD *)(v20 + 4) > (v21 + 12))
          {
            v26 = v20 + 8;
            v24 = *(_QWORD *)(v20 + 8);
            v25 = *(_QWORD *)(v26 + 8);
            v27 = v25 + 40 * v23;
            *(_QWORD *)(v24 + 48 * v22 + 8) = v27;
            v28 = *(_DWORD *)(v27 + 16);
            *(_DWORD *)(v27 + 16) = v28 + 1;
            if (!v28)
              *(_QWORD *)(v25 + 40 * v23 + 8) = v24 + 48 * v22;
          }
        }
        while (v5 - 1 != v21)
        {
          v20 = *(_QWORD *)(v4 + 16);
          ++v21;
          if (v20)
            goto LABEL_28;
        }
      }
    }
  }
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_20E5DBDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mav_router::device::controller_ios::get_channel_for_service(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t *v3;
  int v4;
  const void *v5;
  size_t v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  size_t v10;
  size_t v11;
  int v12;
  int v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;

  v2 = a1 + 56;
  v3 = *(uint64_t **)(a1 + 56);
  if (!v3)
    return *(unsigned int *)(v2 + 56);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  v7 = (uint64_t *)(a1 + 56);
  do
  {
    while (1)
    {
      v8 = *((char *)v3 + 55);
      v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      v11 = v6 >= v10 ? v10 : v6;
      v12 = memcmp(v9, v5, v11);
      if (v12)
        break;
      if (v10 >= v6)
        goto LABEL_23;
LABEL_9:
      v3 = (uint64_t *)v3[1];
      if (!v3)
        goto LABEL_24;
    }
    if (v12 < 0)
      goto LABEL_9;
LABEL_23:
    v7 = v3;
    v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == (uint64_t *)v2)
    return *(unsigned int *)(v2 + 56);
  v13 = *((char *)v7 + 55);
  if (v13 >= 0)
    v14 = v7 + 4;
  else
    v14 = (const void *)v7[4];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)v7 + 55);
  else
    v15 = v7[5];
  if (v15 >= v6)
    v16 = v6;
  else
    v16 = v15;
  v17 = memcmp(v5, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      return *((unsigned int *)v7 + 14);
    return *(unsigned int *)(v2 + 56);
  }
  else
  {
    if (v6 < v15)
      return *(unsigned int *)(v2 + 56);
    return *((unsigned int *)v7 + 14);
  }
}

void std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020E5DD057)
    return a1 + 24;
  if (((v3 & 0x800000020E5DD057 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000020E5DD057))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020E5DD057 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020E5DD13FLL)
    return a1 + 24;
  if (((v3 & 0x800000020E5DD13FLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000020E5DD13FLL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020E5DD13FLL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t **std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  const void *v8;
  size_t v9;
  uint64_t **v10;
  _QWORD *v11;
  const void *v12;
  const void *v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v19;
  char *v20;
  std::string *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *((char *)a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *a2;
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    while (1)
    {
      v10 = (uint64_t **)v5;
      v13 = (const void *)v5[4];
      v11 = v5 + 4;
      v12 = v13;
      v14 = *((char *)v11 + 23);
      if (v14 >= 0)
        v15 = v11;
      else
        v15 = v12;
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v11 + 23);
      else
        v16 = v11[1];
      if (v16 >= v9)
        v17 = v9;
      else
        v17 = v16;
      v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0)
          goto LABEL_8;
LABEL_22:
        v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0)
            return v10;
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        v5 = v10[1];
        if (!v5)
        {
          v6 = v10 + 1;
LABEL_28:
          v20 = (char *)operator new(0x40uLL);
          v21 = (std::string *)(v20 + 32);
          if (*(char *)(a3 + 23) < 0)
            goto LABEL_31;
LABEL_29:
          *(_OWORD *)&v21->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
          v21->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16)
          goto LABEL_22;
LABEL_8:
        v5 = *v10;
        v6 = v10;
        if (!*v10)
          goto LABEL_28;
      }
    }
  }
  v10 = a1 + 1;
  v20 = (char *)operator new(0x40uLL);
  v21 = (std::string *)(v20 + 32);
  if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    goto LABEL_29;
LABEL_31:
  std::string::__init_copy_ctor_external(v21, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
LABEL_32:
  *((_DWORD *)v20 + 14) = 0;
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  *((_QWORD *)v20 + 2) = v10;
  *v6 = (uint64_t *)v20;
  v22 = (uint64_t *)**a1;
  v23 = (uint64_t *)v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_20E5DC224(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
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

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x24BED91B0](this);
}

uint64_t capabilities::ipc::controlDataPrintSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x24BED91C8](this);
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  return MEMORY[0x24BED91F0](this);
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  return MEMORY[0x24BED92C8](this);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
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
  return MEMORY[0x24BEDAF48]();
}

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
  off_24C970FB8(__p);
}

void operator delete(void *__p)
{
  off_24C970FC0(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24C970FC8(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C970FD0(__sz);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

