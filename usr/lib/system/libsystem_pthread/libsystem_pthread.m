void start_wqthread(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  _pthread_wqthread(a1, a2, a3, a4, a5, a6);
  __break(1u);
}

void thread_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = _pthread_start(a1, a2, a3, a4, a5, a6);
  thread_chkstk_darwin(v9, v10, v11, v12, v13, v14, v15, v16, a9);
}

void thread_chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v9;
  unint64_t StatusReg;
  unint64_t v11;
  uint64_t *v12;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((unint64_t)&a9 >= *(_QWORD *)(StatusReg - 48)
    || (v11 = *(_QWORD *)(StatusReg - 40), (unint64_t)&a9 <= v11)
    || (unint64_t)&a9 < v9
    || (unint64_t)&a9 - v9 < v11)
  {
    v12 = &a9;
    if (v9 >= 0x1000)
    {
      do
      {
        v12 -= 512;
        v9 -= 4096;
      }
      while (v9 > 0x1000);
    }
  }
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1);
}

int pthread_main_np(void)
{
  unint64_t v0;

  v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return _main_thread_ptr == v0;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return a1 == a2;
}

uint64_t pthread_main_thread_np()
{
  return _main_thread_ptr;
}

pthread_t pthread_self(void)
{
  unint64_t StatusReg;
  pthread_t result;
  uint64_t v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v2 = *(_QWORD *)(StatusReg - 224);
  result = (pthread_t)(StatusReg - 224);
  if ((pthread_t)(_pthread_ptr_munge_token ^ v2) != result)
    pthread_self_cold_1();
  return result;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_rdlock_VARIANT_armv81;
  else
    return (int)pthread_rwlock_rdlock_VARIANT_mp;
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_unlock_VARIANT_armv81;
  else
    return (int)pthread_rwlock_unlock_VARIANT_mp;
}

uint64_t _pthread_qos_override_start_direct()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t _pthread_workqueue_override_reset()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  if (__pthread_sigmask() == -1)
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  else
    return 0;
}

uint64_t _pthread_workqueue_override_start_direct()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  unsigned int v3;
  unint64_t v4;
  int v7;
  vm_map_t *v8;
  mach_vm_address_t v9;
  mach_vm_address_t v10;
  int v11;
  mach_port_t v12;
  mach_vm_address_t address;

  if ((__relative_priority - 1) < 0xFFFFFFF0)
    return 0;
  HIDWORD(v4) = __qos_class - 5;
  LODWORD(v4) = __qos_class - 5;
  v3 = v4 >> 2;
  if (v3 > 7 || ((0xBBu >> v3) & 1) == 0)
    return 0;
  v7 = dword_1DEE46BE0[v3];
  v8 = (vm_map_t *)MEMORY[0x1E0C883F0];
  if (_pthread_malloc && (v9 = _pthread_malloc(32), (address = v9) != 0))
  {
    v10 = v9;
    v11 = 1;
  }
  else
  {
    address = *MEMORY[0x1E0C88820];
    if (mach_vm_allocate(*v8, &address, (address + 31) & -(uint64_t)address, 1241513985))
    {
      v10 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return (pthread_override_t)v10;
    }
    v11 = 0;
    v10 = address;
  }
  *(_DWORD *)v10 = 1870030194;
  *(_QWORD *)(v10 + 8) = __pthread;
  v12 = pthread_mach_thread_np(__pthread);
  *(_DWORD *)(v10 + 4) = v12;
  *(_QWORD *)(v10 + 16) = (128 << v7) | (__relative_priority + 255);
  *(_BYTE *)(v10 + 24) = v11;
  if (mach_port_mod_refs(*v8, v12, 0, 1))
  {
    if (v11)
      goto LABEL_9;
LABEL_15:
    mach_vm_deallocate(*v8, address, (*MEMORY[0x1E0C88820] + 31) & -*MEMORY[0x1E0C88820]);
    return 0;
  }
  if (__bsdthread_ctl())
  {
    mach_port_mod_refs(*v8, *(_DWORD *)(v10 + 4), 0, -1);
    if (v11)
    {
LABEL_9:
      if (_pthread_free)
        _pthread_free(v10);
      return 0;
    }
    goto LABEL_15;
  }
  return (pthread_override_t)v10;
}

uint64_t pthread_dependency_init_np(_QWORD *a1, pthread_t a2)
{
  uint64_t result;

  result = pthread_mach_thread_np(a2);
  *a1 = result;
  a1[1] = 0;
  return result;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  pthread_t v1;
  pthread_t v2;

  v1 = a1;
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1)
  {
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    LODWORD(v1) = *(_DWORD *)&a1->__opaque[232];
  }
  else if (a1)
  {
    os_unfair_lock_lock_with_options();
    v2 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v2 != v1)
      {
        v2 = *(pthread_t *)v2->__opaque;
        if (!v2)
          goto LABEL_6;
      }
      if ((pthread_t)(_pthread_ptr_munge_token ^ v1->__sig) != v1)
        pthread_cancel_VARIANT_mp_cold_1();
      LODWORD(v1) = *(_DWORD *)&v1->__opaque[232];
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }
    else
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      LODWORD(v1) = 0;
    }
  }
  return v1;
}

uint64_t __pthread_init(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v3)(_QWORD);
  unint64_t StatusReg;
  uint64_t v5;
  host_t v6;
  kern_return_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  __int16 v21;
  char *v22;
  int v23;
  kern_return_t v24;
  _BYTE *v25;
  _OWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  integer_t host_info_out[4];
  __int128 v31;
  mach_msg_type_number_t host_info_outCnt;
  mach_vm_address_t address;

  if (a1)
  {
    exitf = (uint64_t (*)(_QWORD))a1[1];
    if (*a1 >= 2uLL)
    {
      v3 = (uint64_t (*)(_QWORD))a1[3];
      _pthread_malloc = (uint64_t (*)(_QWORD))a1[2];
      _pthread_free = v3;
    }
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = StatusReg - 224;
  if (StatusReg == 224)
    __pthread_init_cold_1();
  _main_thread_ptr = StatusReg - 224;
  *(_QWORD *)v5 = _pthread_ptr_munge_token ^ v5;
  host_info_outCnt = 8;
  *(_OWORD *)host_info_out = 0u;
  v31 = 0u;
  v6 = MEMORY[0x1DF0F0510]();
  v7 = host_info(v6, 5, host_info_out, &host_info_outCnt);
  if (v7)
    __pthread_init_cold_4(v7);
  default_priority = host_info_out[3];
  mach_port_deallocate(*MEMORY[0x1E0C883F0], v6);
  v29 = 0;
  v8 = (char *)_simple_getenv();
  if (v8)
  {
    *(_QWORD *)&v27[0] = v8;
    v9 = _pthread_strtoul(v8, v27);
    v29 = v9;
    if (**(_BYTE **)&v27[0] == 44)
    {
      v10 = _pthread_strtoul((char *)(*(_QWORD *)&v27[0] + 1), v27);
      if (**(_BYTE **)&v27[0] == 44)
      {
        v11 = _pthread_strtoul((char *)(*(_QWORD *)&v27[0] + 1), v27);
        if (**(_BYTE **)&v27[0] == 44)
        {
          v12 = _pthread_strtoul((char *)(*(_QWORD *)&v27[0] + 1), v27);
          v13 = **(_BYTE **)&v27[0];
          v15 = v13 != 44 && v13 != 0;
LABEL_19:
          _platform_strlen();
          _platform_bzero();
          if (!v15 && v9 && v10)
            goto LABEL_25;
          goto LABEL_22;
        }
LABEL_18:
        v12 = 0;
        v15 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_18;
  }
LABEL_22:
  *(_QWORD *)&v27[0] = 8;
  address = 0x3B00000001;
  if (__sysctl())
    v29 = 0x16FE00000;
  v11 = 0;
  v12 = 0;
  v10 = 1032192;
LABEL_25:
  v16 = (char *)_simple_getenv();
  if (!v16 || (v17 = _pthread_strtoul(v16, v27), _platform_strlen(), _platform_bzero(), !v17))
  {
    v18 = (char *)_simple_getenv();
    if (!v18 || (v17 = _pthread_strtoul(v18, v27)) == 0)
      __pthread_init_cold_2();
  }
  _pthread_ptr_munge_token = v17;
  *(_QWORD *)_main_thread_ptr = v17 ^ _main_thread_ptr;
  v19 = v29;
  *(_QWORD *)v5 = _pthread_ptr_munge_token ^ v5;
  *(_QWORD *)(v5 + 224) = v5;
  *(_QWORD *)(v5 + 232) = v5 + 172;
  *(_QWORD *)(v5 + 256) = 2303;
  *(_QWORD *)(v5 + 280) = _pthread_ptr_munge_token;
  v20 = *(_BYTE *)(v5 + 49);
  *(_DWORD *)(v5 + 72) = 0;
  *(_QWORD *)(v5 + 176) = v19;
  *(_QWORD *)(v5 + 184) = v19 - v10;
  *(_QWORD *)(v5 + 192) = v11;
  *(_QWORD *)(v5 + 200) = v12;
  *(_QWORD *)(v5 + 208) = *MEMORY[0x1E0C88820];
  LOBYTE(v19) = v20 & 0xFA | 1;
  v21 = *(_WORD *)(v5 + 78);
  *(_BYTE *)(v5 + 48) = 1;
  *(_WORD *)(v5 + 78) = v21 & 0xFD00 | 1;
  *(_DWORD *)(v5 + 56) = default_priority;
  *(_DWORD *)(v5 + 60) = 10;
  *(_WORD *)(v5 + 166) = 3;
  *(_BYTE *)(v5 + 49) = v19;
  v22 = (char *)_simple_getenv();
  if (v22)
  {
    v23 = _pthread_strtoul(v22, v27);
    _platform_strlen();
    _platform_bzero();
  }
  else
  {
    v23 = 0;
  }
  _pthread_main_thread_init(v5, v23);
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  _pthread_bsdthread_init((uint64_t)v27);
  _pthread_key_global_init();
  _pthread_mutex_global_init(a2, (uint64_t)v27);
  if (MEMORY[0xFFFFFC10C] && (__pthread_supported_features & 0x1000) != 0)
  {
    address = (mach_vm_address_t)&_pthread_jit_config;
    v24 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, 0x4000uLL, 0x3FFFuLL, 16512, 0, 0, 0, 3, 3, 1u);
    if (v24 || (char *)address != &_pthread_jit_config)
      __pthread_init_cold_3(v24);
    _pthread_jit_config = 1;
    if ((__pthread_supported_features & 0x800) != 0)
      byte_1F045C001 = 1;
  }
  v25 = (_BYTE *)_simple_getenv();
  if (v25)
    pthread_yield_to_zero = *v25 == 49;
  return 0;
}

uint64_t _pthread_strtoul(char *a1, _QWORD *a2)
{
  uint64_t v2;
  int v3;
  int v4;

  if (a1 && *a1 == 48 && a1[1] == 120)
  {
    v2 = 0;
    for (a1 += 2; ; ++a1)
    {
      v3 = *a1;
      if ((v3 - 48) >= 0xAu)
      {
        v4 = -87;
        if ((v3 - 97) >= 6u)
        {
          if ((v3 - 65) > 5u)
            goto LABEL_12;
          v4 = -55;
        }
      }
      else
      {
        v4 = -48;
      }
      v2 = (v4 + v3) + 16 * v2;
    }
  }
  v2 = 0;
LABEL_12:
  *a2 = a1;
  return v2;
}

uint64_t _pthread_bsdthread_init(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  _platform_bzero();
  *(_OWORD *)a1 = xmmword_1DEE46B20;
  *(_QWORD *)(a1 + 24) = 0x28000000E0;
  *(_DWORD *)(a1 + 32) = 24;
  *(_QWORD *)(a1 + 48) = 0x3C000000188;
  result = __bsdthread_register();
  if ((int)result >= 1)
  {
    if ((~(_DWORD)result & 0x4000001E) != 0)
      _pthread_bsdthread_init_cold_1(result);
    __pthread_supported_features = result;
  }
  v3 = *(_QWORD *)(a1 + 16);
  if ((v3 & 0x22000000) == 0 && (v3 & 0x3F00) != 0)
  {
    result = _pthread_set_main_qos(*(_QWORD *)(a1 + 16));
    *(_QWORD *)(_main_thread_ptr + 256) = v3;
  }
  if (*(_QWORD *)(a1 + 36))
    __pthread_stack_hint = *(_QWORD *)(a1 + 36);
  if (__libdispatch_workerfunction)
    return __workq_open();
  return result;
}

unsigned __int8 *_pthread_mutex_global_init(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  _BYTE *v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  unsigned int v11;
  unsigned __int8 *result;
  int v13;
  unsigned int v14;

  v3 = *(_DWORD *)(a2 + 44);
  if (v3 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (v3 <= 3)
    v5 = v4;
  else
    v5 = 2;
  if (*(_DWORD *)(a2 + 44))
    v6 = v5;
  else
    v6 = 2;
  v7 = (_BYTE *)_simple_getenv();
  if (v7)
  {
    v8 = *v7 == 49 ? 1 : 2;
    if (((char)*v7 - 48) <= 3)
      v6 = v8;
  }
  if (v6 != __pthread_mutex_default_opt_policy)
    __pthread_mutex_default_opt_policy = v6;
  v9 = (unsigned __int8 *)_simple_getenv();
  if (v9)
  {
    v10 = *v9 == 49;
  }
  else
  {
    v11 = *(_DWORD *)(a2 + 44);
    if (v11)
      v10 = (v11 >> 8) & 1;
    else
      v10 = 0;
  }
  if (__pthread_mutex_use_ulock != v10)
    __pthread_mutex_use_ulock = v10;
  result = (unsigned __int8 *)_simple_getenv();
  if (result)
  {
    v13 = *result == 49;
  }
  else
  {
    v14 = *(_DWORD *)(a2 + 44);
    if (v14)
      v13 = (v14 >> 9) & 1;
    else
      v13 = 0;
  }
  if (__pthread_mutex_ulock_adaptive_spin != v13)
    __pthread_mutex_ulock_adaptive_spin = v13;
  return result;
}

uint64_t _pthread_main_thread_init(uint64_t a1, int a2)
{
  uint64_t result;
  char *v4;
  _QWORD *v5;
  BOOL v6;
  _QWORD *v7;
  mach_port_options_t v8;
  mach_port_name_t name;

  __pthread_head = 0;
  off_1ECCDC100 = &__pthread_head;
  _pthread_list_lock = 0;
  *(_DWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (!a2)
    a2 = MEMORY[0x1DF0F0540]();
  *(_DWORD *)(a1 + 248) = a2;
  name = 0;
  *(_OWORD *)&v8.flags = xmmword_1DEE46B60;
  v8.reserved[1] = 0;
  result = mach_port_construct(*MEMORY[0x1E0C883F0], &v8, 0, &name);
  *(_DWORD *)(a1 + 240) = name;
  *(_DWORD *)(a1 + 288) = 0;
  *(_DWORD *)(a1 + 296) = 0;
  v4 = (char *)__pthread_head;
  *(_QWORD *)(a1 + 16) = __pthread_head;
  v5 = v4 + 24;
  v6 = v4 == 0;
  __pthread_head = (_UNKNOWN *)a1;
  v7 = &off_1ECCDC100;
  if (!v6)
    v7 = v5;
  *v7 = a1 + 16;
  *(_QWORD *)(a1 + 24) = &__pthread_head;
  _pthread_count = 1;
  if (_pthread_introspection_hook)
    return _pthread_introspection_hook_callout_thread_start((_QWORD *)a1);
  return result;
}

uint64_t _pthread_set_main_qos(uint64_t result)
{
  _main_qos = result;
  return result;
}

uint64_t _pthread_key_global_init()
{
  uint64_t result;

  if (_simple_getenv())
    __pthread_key_legacy_behaviour = 1;
  result = _simple_getenv();
  if (result)
    __pthread_key_legacy_behaviour_log = 1;
  return result;
}

int pthread_setname_np(const char *a1)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;

  v1 = (_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if (a1)
    v2 = _platform_strlen();
  else
    v2 = 0;
  if ((_QWORD *)(_pthread_ptr_munge_token ^ *v1) != v1)
    pthread_cancel_VARIANT_mp_cold_1();
  getpid();
  v3 = __proc_info();
  if (!v3)
  {
    if (v2)
      _platform_strlcpy();
    else
      _platform_bzero();
  }
  return v3;
}

uint64_t _pthread_create(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, char a5)
{
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  mach_vm_size_t v14;
  mach_vm_size_t v15;
  mach_vm_size_t v16;
  mach_vm_size_t *v17;
  vm_map_t *v18;
  uint64_t v19;
  mach_vm_address_t v20;
  uint64_t v21;
  mach_vm_address_t v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  _QWORD *v26;
  __int16 v27;
  mach_port_name_t v28;
  uint64_t *v29;
  uint64_t *v30;
  ipc_space_t *v31;
  uint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  mach_vm_address_t address;

  if (!a2)
  {
    v7 = _pthread_attr_default;
LABEL_5:
    v9 = *((_QWORD *)v7 + 5);
    v10 = *((_QWORD *)v7 + 3);
    __is_threaded = 1;
    address = __pthread_stack_hint;
    if ((unint64_t)(v10 - 1) <= 0x3FFE)
      _pthread_create_cold_1(v10);
    v11 = *((_QWORD *)v7 + 2);
    if ((*MEMORY[0x1E0C88810] & v11) != 0)
      _pthread_create_cold_3(v11);
    v35 = a1;
    if (v11)
    {
      v14 = 0;
      v15 = 0;
      v16 = ~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320);
    }
    else
    {
      if ((v9 & 0x10000000) != 0)
        v17 = (mach_vm_size_t *)MEMORY[0x1E0C88820];
      else
        v17 = (mach_vm_size_t *)(v7 + 8);
      v15 = *v17;
      if (v10)
        v10 += 12288;
      else
        v10 = 536576;
      v14 = v15 + v10;
      v16 = ((~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320))
           + *MEMORY[0x1E0C88810]
           + v15
           + v10) & ~*MEMORY[0x1E0C88810];
    }
    v18 = (vm_map_t *)MEMORY[0x1E0C883F0];
    v19 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, v16, *MEMORY[0x1E0C88820] - 1, 503316481, 0, 0, 0, 3, 7, 1u);
    if ((_DWORD)v19)
    {
      v19 = mach_vm_allocate(*v18, &address, v16, 503316481);
      if ((_DWORD)v19)
        return 35;
    }
    else if ((a5 & 1) == 0 && *MEMORY[0x1E0C87F20])
    {
      v19 = ((uint64_t (*)(uint64_t, _QWORD, mach_vm_size_t, _QWORD, mach_vm_address_t, _QWORD))*MEMORY[0x1E0C87F20])(503316624, *MEMORY[0x1E0C883F0], v16, 0, address, 0);
    }
    if ((a5 & 1) == 0 && *MEMORY[0x1E0C87F20])
      v19 = ((uint64_t (*)(uint64_t, _QWORD, mach_vm_size_t, _QWORD, mach_vm_address_t, _QWORD))*MEMORY[0x1E0C87F20])(503316496, *MEMORY[0x1E0C883F0], v16, 0, address, 0);
    if (v15)
      v19 = mach_vm_protect(*MEMORY[0x1E0C883F0], address, v15, 0, 0);
    v20 = address;
    v21 = address + v14;
    if (*((_QWORD *)v7 + 2))
      v22 = *((_QWORD *)v7 + 2);
    else
      v22 = address + v14;
    *(_QWORD *)v21 = _pthread_ptr_munge_token ^ v21;
    *(_QWORD *)(v21 + 224) = v21;
    *(_QWORD *)(v21 + 232) = v21 + 172;
    if ((v7[43] & 1) != 0)
      v23 = 0;
    else
      v23 = *((_QWORD *)v7 + 4);
    v24 = (_QWORD *)MEMORY[0x1E0C88820];
    *(_QWORD *)(v21 + 256) = v23;
    *(_QWORD *)(v21 + 280) = _pthread_ptr_munge_token;
    v25 = *(_BYTE *)(v21 + 49) & 0xFB | (4 * (*((_QWORD *)v7 + 2) != 0));
    *(_BYTE *)(v21 + 49) = v25;
    *(_DWORD *)(v21 + 72) = 0;
    *(_QWORD *)(v21 + 176) = v22;
    *(_QWORD *)(v21 + 184) = v22 - v10;
    *(_QWORD *)(v21 + 192) = v20;
    *(_QWORD *)(v21 + 200) = v16;
    if ((*((_QWORD *)v7 + 5) & 0x10000000) != 0)
      v26 = v24;
    else
      v26 = v7 + 8;
    *(_QWORD *)(v21 + 208) = *v26;
    *(_BYTE *)(v21 + 49) = v25 & 0xFE | (v7[40] == 1);
    v27 = v7[41] | (*(unsigned __int8 *)(v21 + 79) << 8);
    *(_WORD *)(v21 + 78) = v27;
    *(_BYTE *)(v21 + 48) = BYTE2(*((_QWORD *)v7 + 5));
    *(_WORD *)(v21 + 78) = (*((_DWORD *)v7 + 10) >> 15) & 0x200 | v27 & 0xFDFF;
    if ((v7[43] & 1) != 0)
    {
      *(_QWORD *)(v21 + 56) = *((_QWORD *)v7 + 4);
    }
    else
    {
      *(_DWORD *)(v21 + 56) = default_priority;
      *(_DWORD *)(v21 + 60) = 10;
    }
    *(_WORD *)(v21 + 166) = 3;
    if ((a5 & 1) != 0)
      v28 = MEMORY[0x1DF0F0540](v19);
    else
      v28 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    *(_QWORD *)(v21 + 144) = a3;
    *(_QWORD *)(v21 + 152) = a4;
    os_unfair_lock_lock_no_tsd();
    *(_QWORD *)(v21 + 16) = 0;
    v29 = (uint64_t *)off_1ECCDC100;
    *(_QWORD *)(v21 + 24) = off_1ECCDC100;
    *v29 = v21;
    off_1ECCDC100 = (_UNKNOWN **)(v21 + 16);
    ++_pthread_count;
    os_unfair_lock_unlock_no_tsd();
    if ((a5 & 1) == 0 && _pthread_introspection_hook)
      _pthread_introspection_hook_callout_thread_create(v21);
    if (__bsdthread_create() == -1)
    {
      if (**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) == 24)
        _pthread_create_cold_2();
      os_unfair_lock_lock_no_tsd();
      v33 = *(_QWORD *)(v21 + 16);
      v34 = *(_QWORD **)(v21 + 24);
      if (v33)
      {
        *(_QWORD *)(v33 + 24) = v34;
        v34 = *(_QWORD **)(v21 + 24);
      }
      else
      {
        off_1ECCDC100 = *(_UNKNOWN ***)(v21 + 24);
      }
      v30 = v35;
      v31 = (ipc_space_t *)MEMORY[0x1E0C883F0];
      *v34 = v33;
      --_pthread_count;
      os_unfair_lock_unlock_no_tsd();
      _pthread_deallocate(v21, a5 & 1);
      v21 = 0;
      v8 = 35;
      if ((a5 & 1) == 0)
        goto LABEL_47;
    }
    else
    {
      v8 = 0;
      v30 = v35;
      v31 = (ipc_space_t *)MEMORY[0x1E0C883F0];
      if ((a5 & 1) == 0)
      {
LABEL_47:
        *v30 = v21;
        return v8;
      }
    }
    mach_port_deallocate(*v31, v28);
    goto LABEL_47;
  }
  v7 = a2;
  if (*a2 == 1414022209)
    goto LABEL_5;
  return 22;
}

uint64_t _pthread_workqueue_add_cooperativethreads()
{
  uint64_t result;

  if (!__libdispatch_workerfunction)
    return 1;
  result = __workq_kernreturn();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t _pthread_mutex_firstfit_wake()
{
  uint64_t result;
  uint64_t v1;

  result = __psynch_mutexdrop();
  if ((_DWORD)result == -1)
  {
    v1 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if ((v1 & 0xFFFFFFFB) != 0)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_1F0458040 = v1;
      __break(1u);
    }
  }
  return result;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cond_broadcast_VARIANT_armv81;
  else
    return (int)pthread_cond_broadcast_VARIANT_mp;
}

uint64_t _pthread_cond_check_init_slow(uint64_t result, unsigned int *a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  unint64_t StatusReg;
  unsigned int v6;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;

  v3 = result;
  v4 = (os_unfair_lock_s *)(result + 8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&v4->_os_unfair_lock_opaque))
  {
    if (!__stxr(v6, &v4->_os_unfair_lock_opaque))
      goto LABEL_6;
  }
  __clrex();
  result = os_unfair_lock_lock_with_options();
LABEL_6:
  v8 = *(_DWORD *)v3;
  if ((*(_DWORD *)v3 - 1129270853) < 2)
  {
    if (*a2 == 1129270852)
    {
      v9 = 0;
      *a2 = v8;
      goto LABEL_22;
    }
    if (*a2 != v8)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      return result;
    }
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  if (v8 == 1129270852)
  {
    if (*a2 != 1129270852)
    {
      v9 = 0;
      *(_DWORD *)v3 = *a2;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v8 == 1018212795)
  {
    v9 = 0;
    v10 = *a2;
    *(_QWORD *)(v3 + 16) = 0;
    *(_DWORD *)(v3 + 24) = 0;
    *(_DWORD *)(v3 + 28) = 0;
    *(_DWORD *)(v3 + 32) = 0;
    v11 = 32;
    if ((((_BYTE)v3 + 24) & 7) == 0)
      v11 = 28;
    *(_DWORD *)(v3 + v11) = 1;
    if ((((_BYTE)v3 + 24) & 7) != 0)
      v12 = -1610612736;
    else
      v12 = 0x80000000;
    *(_DWORD *)(v3 + 12) = v12;
    *(_DWORD *)(v3 + 4) = 0;
    atomic_store(v10, (unsigned int *)v3);
  }
  else
  {
    v9 = 22;
  }
LABEL_22:
  v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    v14 = __ldxr(&v4->_os_unfair_lock_opaque);
    if (v14 != v13)
      break;
    if (!__stlxr(0, &v4->_os_unfair_lock_opaque))
      return v9;
  }
  __clrex();
  os_unfair_lock_unlock(v4);
  return v9;
}

uint64_t _pthread_cond_check_init_slow_0(uint64_t result, unsigned int *a2)
{
  uint64_t v3;
  int v4;
  os_unfair_lock_s *v5;
  unint64_t StatusReg;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  int v13;

  v3 = result;
  v4 = 0;
  v5 = (os_unfair_lock_s *)(result + 8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(result + 8), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4)
    result = os_unfair_lock_lock_with_options();
  v7 = *(_DWORD *)v3;
  if ((*(_DWORD *)v3 - 1129270853) >= 2)
  {
    if (v7 != 1129270852)
    {
      if (v7 == 1018212795)
      {
        v8 = 0;
        v9 = *a2;
        *(_QWORD *)(v3 + 16) = 0;
        *(_DWORD *)(v3 + 24) = 0;
        *(_DWORD *)(v3 + 28) = 0;
        *(_DWORD *)(v3 + 32) = 0;
        v10 = 32;
        if ((((_BYTE)v3 + 24) & 7) == 0)
          v10 = 28;
        *(_DWORD *)(v3 + v10) = 1;
        if ((((_BYTE)v3 + 24) & 7) != 0)
          v11 = -1610612736;
        else
          v11 = 0x80000000;
        *(_DWORD *)(v3 + 12) = v11;
        *(_DWORD *)(v3 + 4) = 0;
        atomic_store(v9, (unsigned int *)v3);
      }
      else
      {
        v8 = 22;
      }
      goto LABEL_19;
    }
    if (*a2 != 1129270852)
    {
      v8 = 0;
      *(_DWORD *)v3 = *a2;
      goto LABEL_19;
    }
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if (*a2 != 1129270852)
  {
    if (*a2 != v7)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      return result;
    }
    goto LABEL_18;
  }
  v8 = 0;
  *a2 = v7;
LABEL_19:
  v12 = *(_DWORD *)(StatusReg + 24);
  v13 = v12;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v13, 0, memory_order_release, memory_order_relaxed);
  if (v13 != v12)
    os_unfair_lock_unlock(v5);
  return v8;
}

uint64_t _pthread_qos_override_end_direct()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cond_signal_VARIANT_armv81;
  else
    return (int)pthread_cond_signal_VARIANT_mp;
}

uint64_t _pthread_cond_updateval(uint64_t result, unsigned int a2, int a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int *v6;
  BOOL v7;
  unint64_t *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  unint64_t v19;

  if ((a2 & 0x100) != 0)
    v3 = 257;
  else
    v3 = 256;
  v4 = v3 | (a2 >> 8) & 2;
  if (!a2)
    v4 = a3;
  v5 = *(_DWORD *)(result + 12);
  v6 = (unsigned int *)(result + 28);
  v7 = (v5 & 0x20000000) == 0;
  if ((v5 & 0x20000000) != 0)
    v8 = (unint64_t *)(result + 28);
  else
    v8 = (unint64_t *)(result + 24);
  if (!v7)
    v6 = (unsigned int *)(result + 32);
  v9 = v4 & 0xFFFFFF00;
LABEL_12:
  v10 = *(unsigned int *)v8;
  v11 = *v6;
  v12 = v10 & 0xFFFFFF00;
  v13 = v11 & 0xFFFFFF00;
  v14 = v10 | (v11 << 32);
  if ((v4 & 2) != 0 || v12 != v13)
  {
    v18 = (v11 | v4) & 3;
    LODWORD(v15) = (v13 + v9) | v18;
    v16 = v13 + v9 == v12 && v18 == 3;
    if (v16)
      v15 = v15 & 0xFFFFFF01;
    else
      v15 = v15;
    v17 = v10 | (v15 << 32);
  }
  else
  {
    LODWORD(v15) = 0;
    v16 = 0;
    v17 = v14;
  }
  do
  {
    v19 = __ldaxr(v8);
    if (v19 != v14)
    {
      __clrex();
      goto LABEL_12;
    }
  }
  while (__stlxr(v17, v8));
  if (v12 != v13 && (v15 ^ v10) <= 0xFF)
    *(_QWORD *)(result + 16) = 0;
  if (v16)
    return __psynch_cvclrprepost();
  return result;
}

uint64_t _pthread_cond_updateval_0(uint64_t result, unsigned int a2, int a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int *v6;
  BOOL v7;
  atomic_ullong *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  unint64_t v19;

  if ((a2 & 0x100) != 0)
    v3 = 257;
  else
    v3 = 256;
  v4 = v3 | (a2 >> 8) & 2;
  if (!a2)
    v4 = a3;
  v5 = *(_DWORD *)(result + 12);
  v6 = (unsigned int *)(result + 28);
  v7 = (v5 & 0x20000000) == 0;
  if ((v5 & 0x20000000) != 0)
    v8 = (atomic_ullong *)(result + 28);
  else
    v8 = (atomic_ullong *)(result + 24);
  if (!v7)
    v6 = (unsigned int *)(result + 32);
  v9 = v4 & 0xFFFFFF00;
  do
  {
    v10 = *(unsigned int *)v8;
    v11 = *v6;
    v12 = v10 & 0xFFFFFF00;
    v13 = v11 & 0xFFFFFF00;
    v14 = v10 | (v11 << 32);
    if ((v4 & 2) != 0 || v12 != v13)
    {
      v18 = (v11 | v4) & 3;
      LODWORD(v15) = (v13 + v9) | v18;
      v16 = v13 + v9 == v12 && v18 == 3;
      if (v16)
        v15 = v15 & 0xFFFFFF01;
      else
        v15 = v15;
      v17 = v10 | (v15 << 32);
    }
    else
    {
      LODWORD(v15) = 0;
      v16 = 0;
      v17 = v14;
    }
    v19 = v14;
    atomic_compare_exchange_strong(v8, &v19, v17);
  }
  while (v19 != v14);
  if (v12 != v13 && (v15 ^ v10) <= 0xFF)
    *(_QWORD *)(result + 16) = 0;
  if (v16)
    return __psynch_cvclrprepost();
  return result;
}

uint64_t _pthread_workqueue_addthreads()
{
  uint64_t result;

  if (!__libdispatch_workerfunction)
    return 1;
  result = __workq_kernreturn();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t _pthread_atfork_prepare_handlers()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = _os_alloc_once();
  result = os_unfair_lock_lock_with_options();
  v2 = *(_QWORD *)(v0 + 16);
  if (v2)
  {
    v3 = 24 * v2 - 24;
    do
    {
      v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 264) + v3);
      if (v4)
        result = v4(result);
      v3 -= 24;
      --v2;
    }
    while (v2);
  }
  return result;
}

int pthread_join(pthread_t a1, void **a2)
{
  pthread_testcancel();
  return _pthread_join((uint64_t)a1, (uint64_t *)a2, 2);
}

uint64_t _pthread_mutex_unlock_init_slow(uint64_t a1)
{
  uint64_t result;
  int v3;

  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (result = _pthread_mutex_check_init_slow(a1), !(_DWORD)result))
  {
    v3 = *(_DWORD *)(a1 + 12);
    if ((v3 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_unlock_slow_VARIANT_mp(a1);
    }
    else if ((v3 & 0x4000) != 0)
    {
      _pthread_mutex_ulock_unlock_VARIANT_mp(a1);
      return 0;
    }
    else
    {
      return _pthread_mutex_firstfit_unlock_slow_VARIANT_mp(a1);
    }
  }
  return result;
}

uint64_t _pthread_mutex_unlock_init_slow_0(uint64_t a1)
{
  uint64_t result;
  int v3;

  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (result = _pthread_mutex_check_init_slow_0(a1), !(_DWORD)result))
  {
    v3 = *(_DWORD *)(a1 + 12);
    if ((v3 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_unlock_slow_VARIANT_armv81(a1);
    }
    else if ((v3 & 0x4000) != 0)
    {
      _pthread_mutex_ulock_unlock_VARIANT_armv81(a1);
      return 0;
    }
    else
    {
      return _pthread_mutex_firstfit_unlock_slow_VARIANT_armv81(a1);
    }
  }
  return result;
}

void (*_pthread_cond_wait())(uint64_t a1, uint64_t a2, void **a3, int a4, int a5)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _pthread_cond_wait_VARIANT_armv81;
  else
    return _pthread_cond_wait_VARIANT_mp;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_mutex_lock_VARIANT_armv81;
  else
    return (int)pthread_mutex_lock_VARIANT_mp;
}

uint64_t _pthread_mutex_check_init_slow(uint64_t a1)
{
  os_unfair_lock_s *v2;
  unint64_t StatusReg;
  unsigned int v4;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  _QWORD *v12;
  int v13;
  unsigned int v14;

  if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(&v2->_os_unfair_lock_opaque))
    {
      if (!__stxr(v4, &v2->_os_unfair_lock_opaque))
        goto LABEL_10;
    }
    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
    {
      v7 = *(_QWORD *)a1 & 0xF;
      *(_DWORD *)(a1 + 12) = 0x2000;
      v6 = 22;
      v8 = 8196;
      switch(v7)
      {
        case 1:
          goto LABEL_18;
        case 2:
          v8 = 8200;
LABEL_18:
          *(_WORD *)(a1 + 16) = 0;
          goto LABEL_20;
        case 3:
        case 7:
          *(_WORD *)(a1 + 16) = 0;
          if (v7 == 3)
          {
            *(_WORD *)(a1 + 18) = 0;
            v9 = 8352;
LABEL_24:
            v9 |= __pthread_mutex_use_ulock << 14;
            v10 = 1297437786;
            goto LABEL_26;
          }
          v8 = 0x2000;
LABEL_20:
          v10 = 1297437784;
          v11 = (__pthread_mutex_default_opt_policy & 7) << 6;
          v9 = v8 | v11 | 0x20;
          *(_WORD *)(a1 + 18) = 0;
          if ((v8 & 0xC) == 0 && (v11 == 128 || v11 == 64))
          {
            if ((((unsigned __int16)v8 | (unsigned __int16)v11) & 0x1CC) == 0x80)
              goto LABEL_24;
            v10 = 1297437786;
          }
LABEL_26:
          *(_DWORD *)(a1 + 12) = v9;
          if ((v9 & 0x4000) != 0)
          {
            *(_QWORD *)(a1 + 32) = -1;
            *(_QWORD *)(a1 + 40) = -1;
            *(_QWORD *)(a1 + 24) = -1;
            *(_DWORD *)(a1 + 24) = 0;
          }
          else
          {
            v12 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
            if ((_QWORD *)(a1 + 24) != v12)
            {
              *(_DWORD *)(a1 + 12) = v9 | 0x800;
              *(_QWORD *)(a1 + 24) = -1;
            }
            *(_QWORD *)(a1 + 40) = -1;
            *v12 = 0;
            *(_QWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8) = 0;
          }
          v6 = 0;
          *(_QWORD *)(a1 + 48) = ~a1;
          *(_DWORD *)(a1 + 56) = v10;
          *(_DWORD *)(a1 + 60) = v10;
          *(_DWORD *)(a1 + 20) = v10;
          *(_DWORD *)(a1 + 4) = 0;
          atomic_store(v10, (unsigned int *)a1);
          break;
        default:
          break;
      }
    }
    else if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
    {
      v6 = 0;
    }
    else
    {
      v6 = 22;
    }
    v13 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      v14 = __ldxr(&v2->_os_unfair_lock_opaque);
      if (v14 != v13)
        break;
      if (!__stlxr(0, &v2->_os_unfair_lock_opaque))
        return v6;
    }
    __clrex();
    os_unfair_lock_unlock(v2);
  }
  else if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
  {
    return 0;
  }
  else
  {
    return 22;
  }
  return v6;
}

uint64_t _pthread_mutex_check_init_slow_0(uint64_t a1)
{
  int v2;
  os_unfair_lock_s *v3;
  unint64_t StatusReg;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  _QWORD *v11;
  int v12;
  int v13;

  if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
  {
    v2 = 0;
    v3 = (os_unfair_lock_s *)(a1 + 8);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v2)
      os_unfair_lock_lock_with_options();
    if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
    {
      v5 = *(_QWORD *)a1 & 0xF;
      *(_DWORD *)(a1 + 12) = 0x2000;
      v6 = 22;
      v7 = 8196;
      switch(v5)
      {
        case 1:
          goto LABEL_15;
        case 2:
          v7 = 8200;
LABEL_15:
          *(_WORD *)(a1 + 16) = 0;
          goto LABEL_17;
        case 3:
        case 7:
          *(_WORD *)(a1 + 16) = 0;
          if (v5 == 3)
          {
            *(_WORD *)(a1 + 18) = 0;
            v8 = 8352;
LABEL_21:
            v8 |= __pthread_mutex_use_ulock << 14;
            v9 = 1297437786;
            goto LABEL_23;
          }
          v7 = 0x2000;
LABEL_17:
          v9 = 1297437784;
          v10 = (__pthread_mutex_default_opt_policy & 7) << 6;
          v8 = v7 | v10 | 0x20;
          *(_WORD *)(a1 + 18) = 0;
          if ((v7 & 0xC) == 0 && (v10 == 128 || v10 == 64))
          {
            if ((((unsigned __int16)v7 | (unsigned __int16)v10) & 0x1CC) == 0x80)
              goto LABEL_21;
            v9 = 1297437786;
          }
LABEL_23:
          *(_DWORD *)(a1 + 12) = v8;
          if ((v8 & 0x4000) != 0)
          {
            *(_QWORD *)(a1 + 32) = -1;
            *(_QWORD *)(a1 + 40) = -1;
            *(_QWORD *)(a1 + 24) = -1;
            *(_DWORD *)(a1 + 24) = 0;
          }
          else
          {
            v11 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
            if ((_QWORD *)(a1 + 24) != v11)
            {
              *(_DWORD *)(a1 + 12) = v8 | 0x800;
              *(_QWORD *)(a1 + 24) = -1;
            }
            *(_QWORD *)(a1 + 40) = -1;
            *v11 = 0;
            *(_QWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8) = 0;
          }
          v6 = 0;
          *(_QWORD *)(a1 + 48) = ~a1;
          *(_DWORD *)(a1 + 56) = v9;
          *(_DWORD *)(a1 + 60) = v9;
          *(_DWORD *)(a1 + 20) = v9;
          *(_DWORD *)(a1 + 4) = 0;
          atomic_store(v9, (unsigned int *)a1);
          break;
        default:
          break;
      }
    }
    else if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
    {
      v6 = 0;
    }
    else
    {
      v6 = 22;
    }
    v12 = *(_DWORD *)(StatusReg + 24);
    v13 = v12;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v13, 0, memory_order_release, memory_order_relaxed);
    if (v13 != v12)
      os_unfair_lock_unlock(v3);
  }
  else if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
  {
    return 0;
  }
  else
  {
    return 22;
  }
  return v6;
}

void pthread_testcancel(void)
{
  unint64_t StatusReg;
  int v1;
  unint64_t v2;
  uint64_t v3;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v1 = atomic_load((unsigned __int16 *)(StatusReg - 58));
  if ((~v1 & 0x11) == 0)
  {
    v3 = *(_QWORD *)(StatusReg - 224);
    v2 = StatusReg - 224;
    if ((_pthread_ptr_munge_token ^ v3) == v2)
    {
      *(_BYTE *)(v2 + 165) = 1;
      pthread_exit((void *)1);
    }
    pthread_cancel_VARIANT_mp_cold_1();
  }
}

uint64_t _pthread_mutex_firstfit_lock_wait(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t *v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;

  v1 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  do
  {
    do
      result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    v5 = *v3;
LABEL_4:
    v6 = v5;
    v7 = v5 + 256;
    if ((v6 & 2) == 0)
      v7 = v6 | 2;
    v8 = v6 & 0xFFFFFFFF00000000 | v7;
    do
    {
      v5 = __ldaxr(v3);
      if (v5 != v6)
      {
        __clrex();
        goto LABEL_4;
      }
    }
    while (__stxr(v8, v3));
  }
  while ((v6 & 2) != 0);
  *v1 = v2;
  return result;
}

uint64_t _pthread_mutex_firstfit_lock_wait_0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  atomic_ullong *v3;
  uint64_t result;
  atomic_ullong v5;
  atomic_ullong v6;
  unsigned int v7;

  v1 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v3 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  do
  {
    do
      result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    v5 = *v3;
    do
    {
      v6 = v5;
      v7 = v5 + 256;
      if ((v5 & 2) == 0)
        v7 = v5 | 2;
      atomic_compare_exchange_strong_explicit(v3, (unint64_t *)&v5, v5 & 0xFFFFFFFF00000000 | v7, memory_order_acquire, memory_order_acquire);
    }
    while (v5 != v6);
  }
  while ((v6 & 2) != 0);
  *v1 = v2;
  return result;
}

uint64_t pthread_key_init_np(int a1, uint64_t a2)
{
  if ((a1 - 10) > 0xF5)
    return 22;
  os_unfair_lock_lock_with_options();
  if (!_pthread_keys[a1])
    _pthread_keys[a1] = ~a2;
  if (__pthread_tsd_max < a1)
    __pthread_tsd_max = a1;
  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return 0;
}

void _pthread_atfork_parent_handlers()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = _os_alloc_once();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 8;
    do
    {
      v4 = *(void (**)(void))(*(_QWORD *)(v0 + 264) + v3);
      if (v4)
      {
        v4();
        v1 = *(_QWORD *)(v0 + 16);
      }
      ++v2;
      v3 += 24;
    }
    while (v2 < v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 12));
}

uint64_t __pthread_once_handler(uint64_t a1)
{
  unint64_t StatusReg;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];
  uint64_t v6;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(_QWORD *)a1 + 8;
  v5[0] = MEMORY[0x1E0C88A70];
  v5[1] = v3;
  v6 = *(_QWORD *)(StatusReg - 216);
  *(_QWORD *)(StatusReg - 216) = v5;
  result = (*(uint64_t (**)(void))(a1 + 8))();
  *(_QWORD *)(StatusReg - 216) = v6;
  **(_QWORD **)a1 = 1330529093;
  return result;
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_mutex_unlock_VARIANT_armv81;
  else
    return (int)pthread_mutex_unlock_VARIANT_mp;
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  unint64_t *opaque;
  unint64_t v4;

  opaque = (unint64_t *)a1->__opaque;
  do
  {
    v4 = atomic_load(opaque);
    if (v4 != -1)
      _os_once();
  }
  while (a1->__sig == 816954554);
  return 0;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_mutex_init_VARIANT_armv81;
  else
    return (int)pthread_mutex_init_VARIANT_mp;
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  pthread_key_t v4;
  int v5;

  os_unfair_lock_lock_with_options();
  v4 = 256;
  while (_pthread_keys[v4])
  {
    if (++v4 == 512)
    {
      v5 = 35;
      goto LABEL_6;
    }
  }
  v5 = 0;
  _pthread_keys[v4] = ~(unint64_t)a2;
  *a1 = v4;
LABEL_6:
  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return v5;
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  mach_vm_size_t v9;
  vm_map_t *v10;
  int v11;
  void (**v12)(void);
  mach_vm_address_t address;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v6 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v6 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  v7 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7 + 1;
  if (v7 == 10)
  {
    address = 0;
    v8 = (_QWORD *)MEMORY[0x1E0C88820];
    v9 = 24 * (*MEMORY[0x1E0C88820] / 0x18uLL);
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
    v10 = (vm_map_t *)MEMORY[0x1E0C883F0];
    LODWORD(v8) = mach_vm_map(*MEMORY[0x1E0C883F0], &address, v9, *v8 - 1, 1224736769, 0, 0, 0, 3, 7, 1u);
    os_unfair_lock_lock_with_options();
    if (!(_DWORD)v8)
    {
      if (*(_QWORD *)(v6 + 264) == v6 + 24)
      {
        *(_QWORD *)(v6 + 264) = address;
        _platform_memmove();
        _platform_bzero();
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
        mach_vm_deallocate(*v10, address, v9);
        os_unfair_lock_lock_with_options();
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (!v7)
    {
      *(_QWORD *)(v6 + 264) = v6 + 24;
LABEL_12:
      v11 = 0;
      v12 = (void (**)(void))(*(_QWORD *)(v6 + 264) + 24 * v7);
      *v12 = a1;
      v12[1] = a2;
      v12[2] = a3;
      goto LABEL_13;
    }
    if (v7 < *MEMORY[0x1E0C88820] / 0x18uLL)
      goto LABEL_12;
  }
  v11 = 12;
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
  return v11;
}

void sched_yield(void)
{
  if (pthread_yield_to_zero)
    swtch_pri(0);
  else
    MEMORY[0x1DF0F0708](0, 0, 0);
}

uint64_t _pthread_set_properties_self(int a1, int a2)
{
  unint64_t StatusReg;
  char v4;
  int v5;
  uint64_t v6;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((_pthread_ptr_munge_token ^ *(_QWORD *)(StatusReg - 224)) != StatusReg - 224)
    pthread_cancel_VARIANT_mp_cold_1();
  v4 = a1;
  if ((a1 & 0x2D) != 0 && *(_BYTE *)(StatusReg - 60) && (a1 & 0xFFFFFFD2) == 0)
  {
    v5 = 0;
    v6 = 0;
    if ((v4 & 1) == 0)
      return v6;
    goto LABEL_10;
  }
  v5 = __bsdthread_ctl();
  if ((v4 & 1) == 0)
    goto LABEL_11;
  if (!v5 || (v6 = **(unsigned int **)(StatusReg + 8), (_DWORD)v6 == 2))
  {
LABEL_10:
    *(_QWORD *)(StatusReg + 32) = a2 & 0xFF403FFF;
LABEL_11:
    if (v5)
      return **(unsigned int **)(StatusReg + 8);
    else
      return 0;
  }
  return v6;
}

uint64_t _pthread_wqthread(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  unsigned int v10;
  unint64_t v11;
  void (*v12)(void);
  void (*v13)();
  void (*v14)();
  uint64_t result;
  uint64_t v16;

  if ((a5 & 0x20000) == 0)
    _pthread_wqthread_setup(a1, a2, a3, a5);
  if ((a5 & 0x800000) != 0)
  {
    *(_BYTE *)(a1 + 164) = 1;
    v10 = 67111167;
  }
  else
  {
    *(_BYTE *)(a1 + 164) = 0;
    if ((a5 & 0x100000) != 0)
    {
      v10 = (32 * a5) & 0x1000000 | 0x2000000;
    }
    else
    {
      v10 = (32 * a5) & 0x1000000 | (BYTE2(a5) << 31);
      if ((a5 & 0x4000) != 0)
      {
        if (a5 - 1 < 6)
          v10 |= (128 << a5) | 0xFF;
      }
      else
      {
        if ((a5 & 0x8000) == 0)
          _pthread_wqthread_cold_1(a5);
        v10 |= 0xFFFFu;
      }
    }
  }
  *(_QWORD *)(a1 + 256) = v10;
  if (a6 == -1)
    _pthread_wqthread_exit(a1);
  if ((a5 & 0x400000) != 0)
  {
    v13 = __libdispatch_workloopfunction;
    *(_QWORD *)(a1 + 152) = a4;
    *(_QWORD *)(a1 + 144) = v13;
    *(_DWORD *)(a1 + 160) = a6;
    ((void (*)(uint64_t, uint64_t, uint64_t))v13)(a4 - 8, a1 + 152, a1 + 160);
  }
  if ((a5 & 0x80000) != 0)
  {
    v14 = __libdispatch_keventfunction;
    *(_QWORD *)(a1 + 152) = a4;
    *(_QWORD *)(a1 + 144) = v14;
    *(_DWORD *)(a1 + 160) = a6;
    ((void (*)(uint64_t, uint64_t))v14)(a1 + 152, a1 + 160);
  }
  v11 = v10 | (8 * a5) & 0x8000000;
  v12 = (void (*)(void))__libdispatch_workerfunction;
  *(_QWORD *)(a1 + 144) = __libdispatch_workerfunction;
  *(_QWORD *)(a1 + 152) = v11;
  *(_DWORD *)(a1 + 160) = 0;
  if (__workq_newapi == 1)
    v12();
  else
    _pthread_wqthread_legacy_worker_wrap(v11);
  result = __workq_kernreturn();
  v16 = *(int *)(a1 + 172);
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: __workq_kernreturn returned";
  qword_1F0458040 = v16;
  return result;
}

uint64_t _pthread_wqthread_setup(uint64_t result, int a2, uint64_t a3, int a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;

  v4 = (_QWORD *)MEMORY[0x1E0C88820];
  v5 = *MEMORY[0x1E0C88820];
  v6 = -*MEMORY[0x1E0C88820];
  v7 = *MEMORY[0x1E0C88810];
  *(_QWORD *)result = _pthread_ptr_munge_token ^ result;
  v8 = (result + v5 - 1) & v6;
  *(_QWORD *)(result + 224) = result;
  *(_QWORD *)(result + 232) = result + 172;
  *(_QWORD *)(result + 256) = 2303;
  v9 = a3 - v5;
  *(_QWORD *)(result + 280) = _pthread_ptr_munge_token;
  v10 = v8 - v9 + (~(_DWORD)v7 & (unint64_t)(v7 + 4320));
  LOBYTE(v8) = *(_BYTE *)(result + 49);
  *(_DWORD *)(result + 72) = 0;
  *(_QWORD *)(result + 176) = result;
  *(_QWORD *)(result + 184) = a3;
  *(_QWORD *)(result + 192) = v9;
  *(_QWORD *)(result + 200) = v10;
  *(_QWORD *)(result + 208) = *v4;
  LOWORD(v9) = *(_WORD *)(result + 78);
  *(_BYTE *)(result + 48) = 1;
  *(_DWORD *)(result + 56) = default_priority;
  *(_DWORD *)(result + 60) = 10;
  *(_WORD *)(result + 166) = 3;
  *(_DWORD *)(result + 248) = a2;
  *(_WORD *)(result + 78) = v9 & 0xF100 | 0x401;
  *(_BYTE *)(result + 49) = v8 & 0xFA;
  if ((a4 & 0x200000) == 0)
  {
    v12 = a4;
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_1F0458040 = a4;
    __break(1u);
    goto LABEL_10;
  }
  v11 = result;
  result = __thread_selfid();
  *(_QWORD *)(v11 + 216) = result;
  if (result == -1)
  {
LABEL_10:
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
LABEL_11:
    qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_1F0458040 = v12;
    __break(1u);
    return result;
  }
  os_unfair_lock_lock_no_tsd();
  *(_QWORD *)(v11 + 16) = 0;
  v13 = (uint64_t *)off_1ECCDC100;
  *(_QWORD *)(v11 + 24) = off_1ECCDC100;
  *v13 = v11;
  off_1ECCDC100 = (_UNKNOWN **)(v11 + 16);
  ++_pthread_count;
  result = os_unfair_lock_unlock_no_tsd();
  if (_pthread_introspection_hook)
    result = _pthread_introspection_hook_callout_thread_create(v11);
  v12 = *(unsigned int *)(v11 + 248);
  if ((v12 + 1) <= 1)
    goto LABEL_11;
  if (_pthread_introspection_hook)
    return _pthread_introspection_hook_callout_thread_start((_QWORD *)v11);
  return result;
}

void _pthread_wqthread_exit(uint64_t a1)
{
  if ((*(_QWORD *)(a1 + 256) & 0x22000000) != 0 || (*(_QWORD *)(a1 + 256) & 0xF00) == 0)
    *(_QWORD *)(a1 + 256) = 2303;
  _pthread_exit((_opaque_pthread_t *)a1, 0);
}

void _pthread_exit(_opaque_pthread_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __darwin_pthread_handler_rec *i;
  unint64_t StatusReg;
  uint64_t v12;

  __disable_threadsignal();
  j___pthread_setcancelstate_exit((uint64_t)a1, a2, v4, v5, v6, v7, v8, v9);
  for (i = a1->__cleanup_stack; i; a1->__cleanup_stack = i)
  {
    ((void (*)(void *))i->__routine)(i->__arg);
    i = i->__next;
  }
  _pthread_tsd_cleanup((uint64_t)a1);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v12 = *(_QWORD *)(StatusReg + 72);
  *(_QWORD *)(StatusReg + 72) = 0;
  if (v12)
    goto LABEL_5;
  while (1)
  {
    _pthread_terminate_invoke(a1, a2);
LABEL_5:
    _os_semaphore_dispose();
  }
}

uint64_t _pthread_tsd_cleanup(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t k;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v1 = result;
  v2 = 0;
  v3 = result + 2272;
  v4 = result + 1224;
  if ((__pthread_key_legacy_behaviour & 1) != 0)
  {
    do
    {
      v5 = *(unsigned __int16 *)(v1 + 76);
      if (v5 >= 0x100)
      {
        v6 = 0;
        do
        {
          v7 = _pthread_keys[v6 + 256];
          if (v7)
          {
            result = *(_QWORD *)(v3 + 8 * v6);
            if (result)
            {
              *(_QWORD *)(v3 + 8 * v6) = 0;
              if (v7 != -1)
              {
                result = ((uint64_t (*)(void))~v7)();
                LOWORD(v5) = *(_WORD *)(v1 + 76);
              }
            }
          }
          v8 = v6 + 256;
          ++v6;
        }
        while (v8 < (unsigned __int16)v5);
      }
      for (i = 0; i != 85; ++i)
      {
        v10 = _pthread_keys[i + 125];
        if (v10)
        {
          result = *(_QWORD *)(v4 + i * 8);
          if (result)
          {
            *(_QWORD *)(v4 + i * 8) = 0;
            if (v10 != -1)
              result = ((uint64_t (*)(void))~v10)();
          }
        }
      }
      ++v2;
    }
    while (v2 != 4);
    v11 = 0;
    *(_WORD *)(v1 + 76) = 0;
    v12 = v1 + 304;
    do
    {
      v13 = __pthread_tsd_max;
      if (__pthread_tsd_max >= 0xA)
      {
        v14 = 0;
        do
        {
          v15 = _pthread_keys[v14 + 10];
          if (v15)
          {
            result = *(_QWORD *)(v12 + 8 * v14);
            if (result)
            {
              *(_QWORD *)(v12 + 8 * v14) = 0;
              if (v15 != -1)
              {
                result = ((uint64_t (*)(void))~v15)();
                v13 = __pthread_tsd_max;
              }
            }
          }
          v16 = v14 + 10;
          ++v14;
        }
        while (v16 < v13);
      }
      if (__pthread_key_legacy_behaviour_log == 1 && *(_WORD *)(v1 + 76))
      {
        for (j = 0; j != 256; ++j)
        {
          v18 = _pthread_keys[j + 256];
          if (v18)
          {
            if (v18 != -1 && *(_QWORD *)(v1 + 2272 + j * 8) != 0)
              result = _simple_asl_log();
          }
        }
      }
      ++v11;
    }
    while (v11 != 4);
  }
  else
  {
    v20 = result + 304;
    do
    {
      v21 = *(unsigned __int16 *)(v1 + 76);
      if (v21 >= 0x100)
      {
        v22 = 0;
        do
        {
          v23 = _pthread_keys[v22 + 256];
          if (v23)
          {
            result = *(_QWORD *)(v3 + 8 * v22);
            if (result)
            {
              *(_QWORD *)(v3 + 8 * v22) = 0;
              if (v23 != -1)
              {
                result = ((uint64_t (*)(void))~v23)();
                LOWORD(v21) = *(_WORD *)(v1 + 76);
              }
            }
          }
          v24 = v22 + 256;
          ++v22;
        }
        while (v24 < (unsigned __int16)v21);
      }
      for (k = 0; k != 85; ++k)
      {
        v26 = _pthread_keys[k + 125];
        if (v26)
        {
          result = *(_QWORD *)(v4 + k * 8);
          if (result)
          {
            *(_QWORD *)(v4 + k * 8) = 0;
            if (v26 != -1)
              result = ((uint64_t (*)(void))~v26)();
          }
        }
      }
      v27 = __pthread_tsd_max;
      if (__pthread_tsd_max >= 0xA)
      {
        v28 = 0;
        do
        {
          v29 = _pthread_keys[v28 + 10];
          if (v29)
          {
            result = *(_QWORD *)(v20 + 8 * v28);
            if (result)
            {
              *(_QWORD *)(v20 + 8 * v28) = 0;
              if (v29 != -1)
              {
                result = ((uint64_t (*)(void))~v29)();
                v27 = __pthread_tsd_max;
              }
            }
          }
          v30 = v28 + 10;
          ++v28;
        }
        while (v30 < v27);
      }
      ++v2;
    }
    while (v2 != 4);
    *(_WORD *)(v1 + 76) = 0;
  }
  return result;
}

uint64_t (*_pthread_setcancelstate_exit())(uint64_t result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _pthread_setcancelstate_exit_VARIANT_armv81;
  else
    return _pthread_setcancelstate_exit_VARIANT_mp;
}

void _pthread_terminate_invoke(pthread_t a1, uint64_t a2)
{
  void *v4;
  size_t v5;
  uint64_t v6;
  uint64_t vars0;

  if ((((unint64_t)&vars0 ^ (unint64_t)a1) & -*MEMORY[0x1E0C88820]) == 0)
    bzero(&v6, 0x3000uLL);
  v4 = (void *)_pthread_terminate(a1, a2);
  bzero(v4, v5);
}

uint64_t _pthread_terminate(pthread_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v7;
  mach_port_t v8;
  int v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;

  if (_pthread_introspection_hook)
    _pthread_introspection_hook_callout_thread_terminate(a1);
  v4 = *(_QWORD *)&a1->__opaque[176];
  v5 = *(_QWORD *)&a1->__opaque[184];
  if (v4 < (unint64_t)a1 && v4 + v5 > (unint64_t)a1)
  {
    v7 = ((unint64_t)a1 - v4) & -*MEMORY[0x1E0C88820];
    *(_QWORD *)&a1->__opaque[176] = v4 + v7;
    *(_QWORD *)&a1->__opaque[184] = v5 - v7;
  }
  else if ((pthread_t)_main_thread_ptr == a1)
  {
    pthread_get_stacksize_np(a1);
    _pthread_current_stack_address();
  }
  if (*(_DWORD *)&a1->__opaque[272])
  {
    *(_DWORD *)&a1->__opaque[272] = 0;
    thread_destruct_special_reply_port();
  }
  v8 = *(_DWORD *)&a1->__opaque[224];
  if (v8)
    mig_dealloc_reply_port(v8);
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&a1->__opaque[36] = -1;
  *(_QWORD *)&a1->__opaque[24] = a2;
  v9 = _pthread_count--;
  v10 = *(_QWORD *)&a1->__opaque[16];
  if (v10)
    _pthread_joiner_prepost_wake((uint64_t)a1);
  v11 = a1->__opaque[33];
  v12 = v11 & 1;
  if ((v11 & 1) != 0)
  {
    a1->__opaque[33] = v11 | 2;
  }
  else
  {
    v13 = *(_QWORD *)a1->__opaque;
    v14 = *(_QWORD **)&a1->__opaque[8];
    if (v13)
    {
      *(_QWORD *)(v13 + 24) = v14;
      v14 = *(_QWORD **)&a1->__opaque[8];
    }
    else
    {
      off_1ECCDC100 = *(_UNKNOWN ***)&a1->__opaque[8];
    }
    *v14 = v13;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  if (v10)
  {
    _pthread_joiner_wake();
    os_unfair_lock_lock_with_options();
    if (*(_QWORD *)&a1->__opaque[16])
    {
      a1->__opaque[33] |= 2u;
      v12 = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }
  if ((v12 & 1) == 0 && (pthread_t)_main_thread_ptr != a1 && _pthread_introspection_hook)
    _pthread_introspection_hook_callout_thread_destroy((uint64_t)a1);
  if (v9 <= 1)
    exitf(0);
  result = __bsdthread_terminate();
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: thread didn't terminate";
  qword_1F0458040 = (uint64_t)a1;
  __break(1u);
  return result;
}

uint64_t _pthread_joiner_wake()
{
  uint64_t result;

  do
    result = __ulock_wake();
  while ((_DWORD)result == -4);
  if ((_DWORD)result != -2)
  {
    if ((_DWORD)result)
      _pthread_joiner_wake_cold_1(result);
  }
  return result;
}

uint64_t _pthread_joiner_prepost_wake(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;
  int v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 49);
  if ((v3 & 1) != 0)
  {
    result = *(unsigned int *)(v2 + 20);
    *(_BYTE *)(a1 + 49) = v3 & 0xFE;
  }
  else
  {
    result = 0;
    *(_BYTE *)(v2 + 24) = 1;
    *(_QWORD *)(a1 + 32) = 0;
  }
  if (*(_QWORD *)(v2 + 8))
  {
    v5 = atomic_load((unsigned __int16 *)(a1 + 166));
    if ((~v5 & 0x11) != 0)
      v6 = *(_QWORD *)(a1 + 40);
    else
      v6 = 1;
    **(_QWORD **)(v2 + 8) = v6;
  }
  return result;
}

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  if (return_addr)
    *return_addr = *(_QWORD *)(frame_addr + 8);
  return *(_QWORD *)frame_addr & 0xFFFFFFFFFFFFFFLL;
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  uint64_t v2;
  int v3;
  unint64_t StatusReg;

  if (a1 - 10 > 0x1F5)
    return 22;
  v2 = _pthread_keys[a1];
  if (a1 >= 0x100 && !v2)
    return 22;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 8 * a1) = a2;
  if (a1 <= 0xFF && !v2)
    _pthread_keys[a1] = -1;
  v3 = 0;
  if (*(unsigned __int16 *)(StatusReg - 148) < a1)
    *(_WORD *)(StatusReg - 148) = a1;
  return v3;
}

qos_class_t qos_class_self(void)
{
  uint64_t v0;
  unsigned int v2;
  unsigned int v3;

  v0 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32);
  if ((v0 & 0x22000000) != 0 || (v0 & 0x3F00) == 0)
  {
    v2 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  }
  v2 = (v0 >> 8) & 0x3F;
  if (!v2)
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  v3 = __clz(__rbit32(v2));
  if (v3 <= 5)
  {
    v2 = v3 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  }
  return 0;
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE00 | ((__pthread_mutex_default_opt_policy & 7) << 6);
  a1->__sig = 1297373249;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] = v1 | 0x20;
  return 0;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  int result;

  result = 22;
  if (a2 <= 2 && a1->__sig == 1297373249)
  {
    result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFF3 | (4 * (a2 & 3));
  }
  return result;
}

uint64_t _pthread_exit_if_canceled(uint64_t result)
{
  int v1;
  unint64_t StatusReg;
  unint64_t v3;
  uint64_t v4;

  if (result == 4)
  {
    v1 = result;
    result = __pthread_canceled();
    if (!(_DWORD)result)
    {
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v4 = *(_QWORD *)(StatusReg - 224);
      v3 = StatusReg - 224;
      if ((_pthread_ptr_munge_token ^ v4) == v3)
      {
        *(_DWORD *)(v3 + 168) = v1;
        *(_BYTE *)(v3 + 165) = 1;
        pthread_exit((void *)1);
      }
      pthread_cancel_VARIANT_mp_cold_1();
    }
  }
  return result;
}

uint64_t _pthread_qos_class_encode(int a1, char a2, int a3)
{
  unsigned int v3;
  unint64_t v4;

  HIDWORD(v4) = a1 - 5;
  LODWORD(v4) = a1 - 5;
  v3 = v4 >> 2;
  if (v3 < 8 && ((0xBBu >> v3) & 1) != 0)
    return (128 << dword_1DEE46BE0[v3]) | (a2 - 1) | a3 & 0xFF000000;
  else
    return a3 & 0xFF000000;
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return j___pthread_cond_wait((uint64_t)a1, (uint64_t)a2, 0, 0, 2, v2, v3, v4);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  int result;

  if (a1->__sig != 1297373249)
    return 22;
  result = 0;
  a1->__sig = 0;
  return result;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_mutex_destroy_VARIANT_armv81;
  else
    return (int)pthread_mutex_destroy_VARIANT_mp;
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return j___pthread_cond_wait((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0, 2, v3, v4, v5);
}

uint64_t pthread_qos_max_parallelism(int a1, unint64_t a2)
{
  int v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  _WORD *v11;
  unint64_t v12;
  _WORD *v13;
  char v14;
  uint64_t v15;

  v2 = a1 - 5;
  if (!a1)
    v2 = 16;
  HIDWORD(v4) = v2;
  LODWORD(v4) = v2;
  v3 = v4 >> 2;
  if (v3 < 8 && ((0xBBu >> v3) & 1) != 0 && a2 < 4)
  {
    v6 = qword_1DEE46C00[v3];
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    {
      v7 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
    }
    else
    {
      v14 = a2;
      v15 = v6;
      v7 = _os_alloc_once();
      v6 = v15;
      LOBYTE(a2) = v14;
    }
    v8 = v7 + 2 * v6;
    v9 = (_WORD *)(v8 + 272);
    v10 = 4;
    if ((a2 & 2) != 0)
      v9 = (_WORD *)(v8 + 300);
    else
      v10 = 1;
    v11 = (_WORD *)(v8 + 286);
    if ((a2 & 1) != 0)
      v12 = 0;
    else
      v12 = v10;
    if ((a2 & 1) != 0)
      v13 = v11;
    else
      v13 = v9;
    result = (unsigned __int16)*v13;
    if ((_DWORD)result == 0xFFFF)
    {
      LODWORD(result) = __bsdthread_ctl();
      if ((_DWORD)result != -1)
      {
        result = (unsigned __int16)result;
LABEL_22:
        *v13 = result;
        return result;
      }
      result = **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      if ((_DWORD)result != 22 && (_DWORD)result != 45)
        pthread_qos_max_parallelism_cold_1(result);
      if ((v12 & 1) != 0)
      {
        result = MEMORY[0xFFFFFC036];
        goto LABEL_22;
      }
      if (v12 < 4)
      {
        result = MEMORY[0xFFFFFC035];
        goto LABEL_22;
      }
      if ((_DWORD)result == 45)
      {
        result = 0;
        goto LABEL_22;
      }
      __break(1u);
    }
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return 0xFFFFFFFFLL;
  }
  return result;
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cond_init_VARIANT_armv81;
  else
    return (int)pthread_cond_init_VARIANT_mp;
}

uint64_t pthread_self_is_exiting_np()
{
  return (*(unsigned __int16 *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 58) >> 5) & 1;
}

int pthread_attr_init(pthread_attr_t *a1)
{
  *a1 = *(pthread_attr_t *)_pthread_attr_default;
  return 0;
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return j___pthread_cond_wait((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 1, 1, v3, v4, v5);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cond_destroy_VARIANT_armv81;
  else
    return (int)pthread_cond_destroy_VARIANT_mp;
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  unint64_t v4;
  pthread_t v5;
  int v6;
  __uint64_t v7;

  if (!a2)
    return 22;
  v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if (!a1 || (pthread_t)v4 == a1)
  {
    v6 = 0;
    *a2 = *(_QWORD *)(v4 + 216);
  }
  else
  {
    os_unfair_lock_lock_with_options();
    v5 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v5 != a1)
      {
        v5 = *(pthread_t *)v5->__opaque;
        if (!v5)
          goto LABEL_7;
      }
      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
        pthread_cancel_VARIANT_mp_cold_1();
      v7 = *(_QWORD *)&a1->__opaque[200];
      *a2 = v7;
      if (v7)
        v6 = 0;
      else
        v6 = _pthread_threadid_slow((uint64_t)a1, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }
    else
    {
LABEL_7:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 3;
    }
  }
  return v6;
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_wrlock_VARIANT_armv81;
  else
    return (int)pthread_rwlock_wrlock_VARIANT_mp;
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  void *v3;
  pthread_t v4;

  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (_QWORD)a1)
    return *(void **)&a1->__opaque[160];
  if (!a1)
    return (void *)3;
  os_unfair_lock_lock_with_options();
  v4 = (pthread_t)__pthread_head;
  if (!__pthread_head)
  {
LABEL_11:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return (void *)3;
  }
  while (v4 != a1)
  {
    v4 = *(pthread_t *)v4->__opaque;
    if (!v4)
      goto LABEL_11;
  }
  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
  v3 = *(void **)&a1->__opaque[160];
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v3;
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  int v2;

  if (a2 == 2)
    v2 = 45;
  else
    v2 = 22;
  if (a2 == 1)
    v2 = 0;
  if (a1->__sig == 1414022209)
    return v2;
  else
    return 22;
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  size_t v3;
  pthread_t v4;

  if (!a1)
    return 3;
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (_QWORD)a1)
  {
    v3 = *(_QWORD *)&a1->__opaque[160] - *(_QWORD *)&a1->__opaque[168];
    if (v3)
      return v3;
    return 0x80000;
  }
  os_unfair_lock_lock_with_options();
  v4 = (pthread_t)__pthread_head;
  if (!__pthread_head)
  {
LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 0x80000;
  }
  while (v4 != a1)
  {
    v4 = *(pthread_t *)v4->__opaque;
    if (!v4)
      goto LABEL_13;
  }
  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
  v3 = *(_QWORD *)&a1->__opaque[160] - *(_QWORD *)&a1->__opaque[168];
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  if (!v3)
    return 0x80000;
  return v3;
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1414022209)
  {
    result = 0;
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFFFFFF00 | a2;
  }
  return result;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  if ((a1->__opaque[35] & 1) != 0)
  {
    result = 0;
    *a2 = *(sched_param *)&a1->__opaque[24];
  }
  else
  {
    result = 0;
    a2->sched_priority = default_priority;
    *(_DWORD *)a2->__opaque = 10;
  }
  return result;
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_mutex_trylock_VARIANT_armv81;
  else
    return (int)pthread_mutex_trylock_VARIANT_mp;
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_properties_self(8, 0);
}

qos_class_t qos_class_main(void)
{
  unsigned int v1;
  unsigned int v2;

  if ((_main_qos & 0x22000000) != 0 || (_main_qos & 0x3F00) == 0)
  {
    v1 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  }
  v1 = (_main_qos >> 8) & 0x3F;
  if (!v1)
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  v2 = __clz(__rbit32(v1));
  if (v2 <= 5)
  {
    v1 = v2 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  }
  return 0;
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  int result;
  uint64_t v4;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  v4 = *(_QWORD *)&a1->__opaque[32] | 0x1000000;
  *(sched_param *)&a1->__opaque[24] = *a2;
  *(_QWORD *)&a1->__opaque[32] = v4;
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  mach_port_name_t v2;
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  v2 = *(_DWORD *)&a1->__opaque[40];
  if (v2 + 1 < 2 || (result = mach_port_mod_refs(*MEMORY[0x1E0C883F0], v2, 0, -1)) == 0)
  {
    result = 0;
    a1->__sig = 0;
  }
  return result;
}

uint64_t _pthread_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  if ((a6 & 0x20000000) != 0)
  {
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: kernel without PTHREAD_START_SUSPENDED support";
    qword_1F0458040 = a6;
    __break(1u);
    goto LABEL_8;
  }
  if ((a6 & 0x10000000) == 0)
  {
LABEL_8:
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_1F0458040 = a6;
    __break(1u);
    goto LABEL_9;
  }
  if ((_pthread_ptr_munge_token ^ *(_QWORD *)a1) != a1)
  {
LABEL_9:
    result = abort_with_reason();
    goto LABEL_10;
  }
  _pthread_markcancel_if_canceled(a1);
  result = __thread_selfid();
  *(_QWORD *)(a1 + 216) = result;
  if (result == -1)
  {
LABEL_10:
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    goto LABEL_11;
  }
  v8 = *(unsigned int *)(a1 + 248);
  if ((v8 + 1) > 1)
  {
    _pthread_introspection_thread_start((_QWORD *)a1);
    v9 = (*(uint64_t (**)(_QWORD))(a1 + 144))(*(_QWORD *)(a1 + 152));
    _pthread_exit((_opaque_pthread_t *)a1, v9);
  }
LABEL_11:
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
  qword_1F0458040 = v8;
  __break(1u);
  return result;
}

uint64_t _pthread_markcancel_if_canceled(uint64_t result)
{
  int v1;

  v1 = atomic_load((unsigned __int16 *)(result + 166));
  if ((~v1 & 0x11) == 0)
    return __pthread_markcancel();
  return result;
}

_QWORD *_pthread_introspection_thread_start(_QWORD *a1)
{
  if (_pthread_introspection_hook)
    return (_QWORD *)_pthread_introspection_hook_callout_thread_start(a1);
  return a1;
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  int v2;

  if (a1->__sig != 1414022209)
    return 22;
  if (a2 == 4 || a2 == 2)
    goto LABEL_6;
  if (a2 != 1)
    return 22;
  *(_QWORD *)&a1->__opaque[32] &= ~0x8000000uLL;
LABEL_6:
  v2 = 0;
  *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFF00FFFFLL | (a2 << 16) | 0x4000000u;
  return v2;
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_init_VARIANT_armv81;
  else
    return (int)pthread_rwlock_init_VARIANT_mp;
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_trywrlock_VARIANT_armv81;
  else
    return (int)pthread_rwlock_trywrlock_VARIANT_mp;
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  unsigned int v2;
  unint64_t v3;

  if ((__relative_priority - 1) >= 0xFFFFFFF0
    && (HIDWORD(v3) = __qos_class - 5, LODWORD(v3) = __qos_class - 5, v2 = v3 >> 2, v2 <= 7)
    && ((0xBBu >> v2) & 1) != 0)
  {
    return _pthread_set_properties_self(1, (128 << dword_1DEE46BE0[v2]) | (__relative_priority + 255));
  }
  else
  {
    return 22;
  }
}

void _pthread_clear_qos_tsd(int a1)
{
  _QWORD *v2;

  if (a1 && *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    os_unfair_lock_lock_with_options();
    v2 = __pthread_head;
    if (__pthread_head)
    {
      while (*((_DWORD *)v2 + 62) != a1)
      {
        v2 = (_QWORD *)v2[2];
        if (!v2)
          goto LABEL_9;
      }
      v2[32] = 0;
    }
LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }
  else
  {
    *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 0;
  }
}

void (*pthread_dependency_fulfill_np())(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return pthread_dependency_fulfill_np_VARIANT_armv81;
  else
    return pthread_dependency_fulfill_np_VARIANT_mp;
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_tryrdlock_VARIANT_armv81;
  else
    return (int)pthread_rwlock_tryrdlock_VARIANT_mp;
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  qos_class_t v7;
  BOOL v8;
  int v9;

  v3 = *(_QWORD *)&__pthread->__opaque[240];
  if (__qos_class)
  {
    if ((v3 & 0x22000000) != 0 || (*(_QWORD *)&__pthread->__opaque[240] & 0x3F00) == 0)
    {
      v5 = 0;
    }
    else
    {
      v5 = (v3 >> 8) & 0x3F;
      if (v5)
      {
        v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          v7 = QOS_CLASS_UNSPECIFIED;
          goto LABEL_12;
        }
        v5 = v6 + 1;
      }
    }
    v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_12:
    *__qos_class = v7;
  }
  if (__relative_priority)
  {
    v8 = (v3 & 0x3F00) != 0 && (v3 & 0x22000000) == 0;
    LODWORD(v3) = (char)v3;
    if (v8)
      v9 = v3 + 1;
    else
      v9 = 0;
    *__relative_priority = v9;
  }
  return 0;
}

uint64_t _pthread_rwlock_unlock_drop()
{
  unint64_t StatusReg;
  uint64_t result;
  int v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    result = __psynch_rw_unlock();
    if ((_DWORD)result != -1)
      break;
    v2 = **(_DWORD **)(StatusReg + 8);
    if (v2 != 4)
    {
      if (v2)
      {
        qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwunlock returned unknown error";
        qword_1F0458040 = v2;
        __break(1u);
      }
      return result;
    }
  }
  return result;
}

uint64_t _pthread_rwlock_lock_wait(uint64_t a1, int a2)
{
  unint64_t StatusReg;
  uint64_t result;
  int v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  int v18;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    result = a2 ? __psynch_rw_rdlock() : __psynch_rw_wrlock();
    if ((_DWORD)result != -1)
      break;
    v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 != 4)
    {
      if (v6)
      {
        qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
        qword_1F0458040 = v6;
        __break(1u);
        return result;
      }
      break;
    }
  }
  v7 = (unint64_t *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v7;
  do
  {
    v9 = HIDWORD(v8);
    if (result & 0x40 | BYTE4(v8) & 2)
    {
      v11 = result | v8;
      if (v8 & 4 | result & 1)
        v12 = 191;
      else
        v12 = 190;
      v13 = v12 & v11;
      if ((((v11 & 6) == 0) & (HIDWORD(v8) >> 2)) != 0)
        v14 = v13 | 5;
      else
        v14 = v13;
      v10 = v14 | v8 & 0xFFFFFF00;
      v15 = (result & 0xFFFFFF00) + HIDWORD(v8);
      if ((result & 0x40) == 0)
        v15 &= 0xFFFFFF00;
      v9 = v15 & 0xFFFFFFFB;
    }
    else
    {
      v10 = v8;
    }
    v16 = v10 | (v9 << 32);
    while (1)
    {
      v17 = __ldxr(v7);
      if (v17 != v8)
        break;
      if (!__stxr(v16, v7))
      {
        v18 = 1;
        goto LABEL_25;
      }
    }
    v18 = 0;
    __clrex();
LABEL_25:
    v8 = v17;
  }
  while (!v18);
  return result;
}

uint64_t _pthread_rwlock_lock_wait_0(uint64_t a1, int a2)
{
  unint64_t StatusReg;
  uint64_t result;
  int v6;
  atomic_ullong *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    result = a2 ? __psynch_rw_rdlock() : __psynch_rw_wrlock();
    if ((_DWORD)result != -1)
      break;
    v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 != 4)
    {
      if (v6)
      {
        qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
        qword_1F0458040 = v6;
        __break(1u);
        return result;
      }
      break;
    }
  }
  v7 = (atomic_ullong *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v7;
  do
  {
    v9 = HIDWORD(v8);
    if (result & 0x40 | BYTE4(v8) & 2)
    {
      v11 = result | v8;
      if (v8 & 4 | result & 1)
        v12 = 191;
      else
        v12 = 190;
      v13 = v12 & v11;
      if ((((v11 & 6) == 0) & (HIDWORD(v8) >> 2)) != 0)
        v14 = v13 | 5;
      else
        v14 = v13;
      v10 = v14 | v8 & 0xFFFFFF00;
      v15 = (result & 0xFFFFFF00) + HIDWORD(v8);
      if ((result & 0x40) == 0)
        v15 &= 0xFFFFFF00;
      v9 = v15 & 0xFFFFFFFB;
    }
    else
    {
      v10 = v8;
    }
    v16 = v10 | (v9 << 32);
    v17 = v8;
    atomic_compare_exchange_strong_explicit(v7, &v17, v16, memory_order_relaxed, memory_order_relaxed);
    v18 = v17 == v8;
    v8 = v17;
  }
  while (!v18);
  return result;
}

uint64_t _pthread_rwlock_check_init_slow(uint64_t a1)
{
  os_unfair_lock_s *v2;
  unint64_t StatusReg;
  unsigned int v4;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  unsigned int v11;

  if (*(_QWORD *)a1 == 766030772)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(&v2->_os_unfair_lock_opaque))
    {
      if (!__stxr(v4, &v2->_os_unfair_lock_opaque))
        goto LABEL_10;
    }
    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    if (*(_QWORD *)a1 == 766030772)
    {
      v7 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
      v8 = (_QWORD *)(a1 + 32);
      v9 = (_QWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
      if ((_QWORD *)(a1 + 24) != v7)
      {
        *(_DWORD *)(a1 + 12) |= 0x20000000u;
        *(_QWORD *)(a1 + 24) = -1;
      }
      if (v8 != v9)
      {
        *v8 = -1;
        *(_QWORD *)(a1 + 40) = -1;
      }
      v6 = 0;
      *(_QWORD *)(a1 + 48) = -1;
      *(_QWORD *)(a1 + 56) = -1;
      *v7 = 0;
      *v9 = 0x1000000C0;
      *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8) = 0;
      *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 12) & 0x3FFFFFFF | 0x80000000;
      *(_QWORD *)(a1 + 64) = ~a1;
      *(_DWORD *)(a1 + 196) = 1381452875;
      *(_QWORD *)(a1 + 16) = 0x52574C4B00000020;
      *(_DWORD *)(a1 + 4) = 0;
      atomic_store(0x52574C4Bu, (unsigned int *)a1);
    }
    else if (*(_QWORD *)a1 == 1381452875)
    {
      v6 = 0;
    }
    else
    {
      v6 = 22;
    }
    v10 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      v11 = __ldxr(&v2->_os_unfair_lock_opaque);
      if (v11 != v10)
        break;
      if (!__stlxr(0, &v2->_os_unfair_lock_opaque))
        return v6;
    }
    __clrex();
    os_unfair_lock_unlock(v2);
  }
  else if (*(_QWORD *)a1 == 1381452875)
  {
    return 0;
  }
  else
  {
    return 22;
  }
  return v6;
}

uint64_t _pthread_rwlock_check_init_slow_0(uint64_t a1)
{
  int v2;
  os_unfair_lock_s *v3;
  unint64_t StatusReg;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  int v10;

  if (*(_QWORD *)a1 == 766030772)
  {
    v2 = 0;
    v3 = (os_unfair_lock_s *)(a1 + 8);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v2)
      os_unfair_lock_lock_with_options();
    if (*(_QWORD *)a1 == 766030772)
    {
      v5 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
      v6 = (_QWORD *)(a1 + 32);
      v7 = (_QWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
      if ((_QWORD *)(a1 + 24) != v5)
      {
        *(_DWORD *)(a1 + 12) |= 0x20000000u;
        *(_QWORD *)(a1 + 24) = -1;
      }
      if (v6 != v7)
      {
        *v6 = -1;
        *(_QWORD *)(a1 + 40) = -1;
      }
      v8 = 0;
      *(_QWORD *)(a1 + 48) = -1;
      *(_QWORD *)(a1 + 56) = -1;
      *v5 = 0;
      *v7 = 0x1000000C0;
      *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8) = 0;
      *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 12) & 0x3FFFFFFF | 0x80000000;
      *(_QWORD *)(a1 + 64) = ~a1;
      *(_DWORD *)(a1 + 196) = 1381452875;
      *(_QWORD *)(a1 + 16) = 0x52574C4B00000020;
      *(_DWORD *)(a1 + 4) = 0;
      atomic_store(0x52574C4Bu, (unsigned int *)a1);
    }
    else if (*(_QWORD *)a1 == 1381452875)
    {
      v8 = 0;
    }
    else
    {
      v8 = 22;
    }
    v9 = *(_DWORD *)(StatusReg + 24);
    v10 = v9;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v10, 0, memory_order_release, memory_order_relaxed);
    if (v10 != v9)
      os_unfair_lock_unlock(v3);
  }
  else if (*(_QWORD *)a1 == 1381452875)
  {
    return 0;
  }
  else
  {
    return 22;
  }
  return v8;
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  pthread_t v6;
  int v7;

  if (!a1)
    return 3;
  os_unfair_lock_lock_with_options();
  v6 = (pthread_t)__pthread_head;
  if (__pthread_head)
  {
    while (v6 != a1)
    {
      v6 = *(pthread_t *)v6->__opaque;
      if (!v6)
        goto LABEL_5;
    }
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    if (a2)
      *a2 = a1->__opaque[32];
    v7 = 0;
    if (a3)
      *a3 = *(sched_param *)&a1->__opaque[40];
  }
  else
  {
LABEL_5:
    v7 = 3;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v7;
}

uint64_t _pthread_workloop_create(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = 22;
  if (a2 <= 1 && a3)
  {
    result = __kqueue_workloop_ctl();
    if ((_DWORD)result == -1)
      return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  pthread_t v4;

  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) != a1)
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options();
      v4 = (pthread_t)__pthread_head;
      if (__pthread_head)
      {
        while (v4 != a1)
        {
          v4 = *(pthread_t *)v4->__opaque;
          if (!v4)
            goto LABEL_6;
        }
        if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
          pthread_cancel_VARIANT_mp_cold_1();
        _platform_strlcpy();
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        return 0;
      }
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }
    return 3;
  }
  _platform_strlcpy();
  return 0;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_rwlock_destroy_VARIANT_armv81;
  else
    return (int)pthread_rwlock_destroy_VARIANT_mp;
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_properties_self(4, 0);
}

uint64_t _pthread_workqueue_supported()
{
  uint64_t result;

  result = __pthread_supported_features;
  if (!__pthread_supported_features)
    _pthread_workqueue_supported_cold_1();
  return result;
}

uint64_t _pthread_globals_init(uint64_t result)
{
  uint64_t i;
  _WORD *v2;

  for (i = 0; i != 14; i += 2)
  {
    v2 = (_WORD *)(result + i);
    v2[136] = -1;
    v2[143] = -1;
    v2[150] = -1;
  }
  return result;
}

uint64_t pthread_install_workgroup_functions_np(uint64_t a1)
{
  uint64_t result;

  result = _pthread_workgroup_functions;
  if (_pthread_workgroup_functions)
    pthread_install_workgroup_functions_np_cold_1(_pthread_workgroup_functions);
  _pthread_workgroup_functions = a1;
  return result;
}

uint64_t __pthread_late_init()
{
  uint64_t result;

  if (_pthread_jit_config[0])
  {
    if ((__pthread_supported_features & 0x200) != 0)
      result = _dyld_register_for_bulk_image_loads();
    if (!byte_1F045C001)
    {
      byte_1F045C002 = 1;
      return _pthread_jit_write_protect_freeze_config();
    }
  }
  return result;
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  *a2 = a1->__opaque[34];
  return result;
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  unint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  HIDWORD(v3) = __qos_class - 5;
  LODWORD(v3) = __qos_class - 5;
  v4 = (0x600050403000201uLL >> (8 * (v3 >> 2))) & 7;
  if ((v3 >> 2) > 7)
    LODWORD(v4) = 0;
  if ((__relative_priority - 1) >= 0xFFFFFFF0)
    v5 = v4;
  else
    v5 = 0;
  if (__attr->__sig != 1414022209)
    return 22;
  v6 = *(_QWORD *)&__attr->__opaque[32];
  if ((v6 & 0x1000000) != 0)
    return 22;
  v7 = 0;
  v8 = (128 << v5) | (__relative_priority - 1);
  if ((v5 - 1) > 5)
    v8 = 0;
  *(_QWORD *)&__attr->__opaque[24] = v8;
  *(_QWORD *)&__attr->__opaque[32] = v6 & 0xFFFFFFFFFCFFFFFFLL | 0x2000000;
  return v7;
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int result;
  int v9;
  int v10;
  vm_map_t *v11;

  result = j___pthread_atomic_xchg_uint32_relaxed((uint64_t)__override, 1919252079, v1, v2, v3, v4, v5, v6);
  if (result == 1870030194)
  {
    v9 = __bsdthread_ctl();
    if (v9 == -1)
      v9 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v9 == 14)
      v10 = 0;
    else
      v10 = v9;
    v11 = (vm_map_t *)MEMORY[0x1E0C883F0];
    if (mach_port_mod_refs(*MEMORY[0x1E0C883F0], *((_DWORD *)__override + 1), 0, -1))
      v10 = 22;
    if (*((_BYTE *)__override + 24))
    {
      if (_pthread_free)
        _pthread_free(__override);
    }
    else if (mach_vm_deallocate(*v11, (mach_vm_address_t)__override, (*MEMORY[0x1E0C88820] + 31) & -*MEMORY[0x1E0C88820]))
    {
      return 22;
    }
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unsigned int *(*_pthread_atomic_xchg_uint32_relaxed())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _pthread_atomic_xchg_uint32_relaxed_VARIANT_armv81;
  else
    return (unsigned int *(*)(unsigned int *))_pthread_atomic_xchg_uint32_relaxed_VARIANT_mp;
}

uint64_t _pthread_workqueue_set_event_manager_priority()
{
  uint64_t result;

  result = __workq_kernreturn();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t (*pthread_dependency_wait_np())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return pthread_dependency_wait_np_VARIANT_armv81;
  else
    return (uint64_t (*)(uint64_t))pthread_dependency_wait_np_VARIANT_mp;
}

uint64_t _pthread_workloop_destroy()
{
  uint64_t result;

  result = __kqueue_workloop_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

void _pthread_dependency_fulfill_slow(unsigned int a1@<W1>, int a2@<W8>)
{
  if (a1 == -1)
    goto LABEL_6;
  if (*(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    a2 = a1;
    qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fulfilled a dependency not owned by current thread";
    qword_1F0458040 = a1;
    __break(1u);
LABEL_6:
    qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fufilling pthread_dependency_t twice";
    __break(1u);
    goto LABEL_7;
  }
  a2 = -(int)__ulock_wake();
  if ((a2 | 2) != 2)
  {
LABEL_7:
    qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: __ulock_wake() failed";
    qword_1F0458040 = a2;
    __break(1u);
  }
}

uint64_t _pthread_workqueue_override_start_direct_check_owner(int a1, uint64_t a2, _DWORD *a3)
{
  unint64_t StatusReg;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    result = __bsdthread_ctl();
    if ((_DWORD)result == -1)
      result = **(unsigned int **)(StatusReg + 8);
    if (!a3 || (_DWORD)result != 14)
      break;
    if ((*a3 | 3) != a1)
      return 70;
  }
  return result;
}

int pthread_is_threaded_np(void)
{
  return __is_threaded;
}

int pthread_detach(pthread_t a1)
{
  pthread_t v2;
  int v3;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v2 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v2 != a1)
      {
        v2 = *(pthread_t *)v2->__opaque;
        if (!v2)
          goto LABEL_5;
      }
      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
        pthread_cancel_VARIANT_mp_cold_1();
      if ((a1->__opaque[33] & 1) == 0)
      {
        v3 = 22;
LABEL_11:
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        return v3;
      }
      if (*(_DWORD *)&a1->__opaque[36] == -1)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        pthread_join_NOCANCEL((uint64_t)a1, 0);
      }
      else
      {
        a1->__opaque[33] &= ~1u;
        if (!*(_QWORD *)&a1->__opaque[16])
        {
          v3 = 0;
          goto LABEL_11;
        }
        _pthread_joiner_prepost_wake((uint64_t)a1);
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        _pthread_joiner_wake();
      }
      return 0;
    }
LABEL_5:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }
  return 3;
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 22;
  if (a2 >= 0x4000 && (*MEMORY[0x1E0C88810] & a2) == 0)
  {
    result = 0;
    *(_QWORD *)&a1->__opaque[16] = a2;
  }
  return result;
}

uint64_t _pthread_mutex_fairshare_unlock(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  v1 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v2 = *v1;
  v3 = HIDWORD(*v1);
  if (((v3 ^ *v1) & 0xFFFFFF00) == 0)
    return 0;
  *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
  while (1)
  {
    v4 = (v3 + 256);
    if ((v4 ^ v2) > 0xFF)
      return _pthread_mutex_fairshare_unlock_slow_VARIANT_mp(a1);
    v5 = v2 & 0xFFFFFFFC;
    v6 = v2 | ((unint64_t)v3 << 32);
    v7 = v5 | (v4 << 32);
    while (1)
    {
      v8 = __ldxr(v1);
      if (v8 != v6)
        break;
      if (!__stlxr(v7, v1))
      {
        v9 = 1;
        goto LABEL_9;
      }
    }
    v9 = 0;
    __clrex();
LABEL_9:
    v3 = HIDWORD(v8);
    LODWORD(v2) = v8;
    if ((v9 & 1) != 0)
      return 0;
  }
}

uint64_t _pthread_mutex_fairshare_unlock_0(uint64_t a1)
{
  atomic_ullong *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v1 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v2 = *v1;
  v3 = HIDWORD(*v1);
  if (((v3 ^ *v1) & 0xFFFFFF00) == 0)
    return 0;
  *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
  while (1)
  {
    v4 = (v3 + 256);
    if ((v4 ^ v2) > 0xFF)
      break;
    v5 = v2 & 0xFFFFFFFC;
    v2 = v2 | ((unint64_t)v3 << 32);
    v6 = v5 | (v4 << 32);
    v7 = v2;
    atomic_compare_exchange_strong_explicit(v1, &v7, v6, memory_order_release, memory_order_relaxed);
    v3 = HIDWORD(v7);
    v8 = v7 == v2;
    LODWORD(v2) = v7;
    if (v8)
      return 0;
  }
  return _pthread_mutex_fairshare_unlock_slow_VARIANT_armv81(a1);
}

uint64_t pthread_workqueue_setup(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  int v4;
  unint64_t v5;
  void (*v6)();

  if (a2 < 4)
    return 22;
  v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 1)
  {
    v5 = 40;
  }
  else
  {
    if (v4 != 2)
      return 22;
    v5 = 48;
  }
  if (v5 > a2)
    return 22;
  if (*(_DWORD *)a1)
    return 45;
  if (__libdispatch_workerfunction)
    return 16;
  __workq_newapi = 1;
  if (__workq_kernreturn() == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  v6 = *(void (**)())(a1 + 16);
  __libdispatch_keventfunction = *(void (**)())(a1 + 8);
  __libdispatch_workloopfunction = v6;
  __libdispatch_workerfunction = *(_UNKNOWN **)(a1 + 24);
  __workq_open();
  result = 0;
  if (!__is_threaded)
    __is_threaded = 1;
  return result;
}

uint64_t _pthread_mutex_fairshare_lock(uint64_t a1, int a2)
{
  unint64_t *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v3 = *v2;
  if ((*v2 & 2) == 0)
  {
    v4 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    while (1)
    {
      v6 = v3;
      if (a2 && (v3 & 2) != 0)
      {
        while (1)
        {
          v3 = __ldaxr(v2);
          if (v3 != v6)
            break;
          if (!__stxr(v6, v2))
            return 16;
        }
      }
      else
      {
        if ((v3 & 2) != 0)
          return _pthread_mutex_fairshare_lock_slow_VARIANT_mp(a1, a2);
        v7 = v3 & 0xFFFFFFFF00000000 | ((v3 | 3) + 256);
        while (1)
        {
          v3 = __ldaxr(v2);
          if (v3 != v6)
            break;
          if (!__stxr(v7, v2))
          {
            result = 0;
            *v4 = v5;
            return result;
          }
        }
      }
      __clrex();
    }
  }
  return _pthread_mutex_fairshare_lock_slow_VARIANT_mp(a1, a2);
}

uint64_t _pthread_mutex_fairshare_lock_0(uint64_t a1, int a2)
{
  atomic_ullong *v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  v2 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v3 = *v2;
  if ((*v2 & 2) != 0)
    return _pthread_mutex_fairshare_lock_slow_VARIANT_armv81(a1, a2);
  v4 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  do
  {
    while (1)
    {
      v6 = v3;
      if (a2)
      {
        if ((v3 & 2) != 0)
          break;
      }
      if ((v3 & 2) != 0)
        return _pthread_mutex_fairshare_lock_slow_VARIANT_armv81(a1, a2);
      atomic_compare_exchange_strong_explicit(v2, &v3, v3 & 0xFFFFFFFF00000000 | ((v3 | 3) + 256), memory_order_acquire, memory_order_acquire);
      if (v3 == v6)
      {
        result = 0;
        *v4 = v5;
        return result;
      }
    }
    atomic_compare_exchange_strong_explicit(v2, &v3, v3, memory_order_acquire, memory_order_acquire);
  }
  while (v3 != v6);
  return 16;
}

int pthread_attr_setguardsize(pthread_attr_t *a1, size_t a2)
{
  int result;

  if (a1->__sig != 1414022209 || (*MEMORY[0x1E0C88810] & a2) != 0)
    return 22;
  result = 0;
  *(_QWORD *)&a1->__opaque[32] &= ~0x10000000uLL;
  *(_QWORD *)a1->__opaque = a2;
  return result;
}

int sched_get_priority_max(int a1)
{
  return default_priority + 16;
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  uint64_t v3;
  int result;
  unsigned int v5;
  unsigned int v6;
  qos_class_t v7;
  BOOL v8;
  int v9;

  if (__attr->__sig != 1414022209)
    return 22;
  if ((__attr->__opaque[35] & 2) != 0)
  {
    v3 = *(_QWORD *)&__attr->__opaque[24];
    if (!__qos_class)
      goto LABEL_14;
LABEL_7:
    v5 = 0;
    if ((v3 & 0x22000000) == 0 && (v3 & 0x3F00) != 0)
    {
      v5 = (v3 >> 8) & 0x3F;
      if (v5)
      {
        v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          v7 = QOS_CLASS_UNSPECIFIED;
          goto LABEL_13;
        }
        v5 = v6 + 1;
      }
    }
    v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_13:
    *__qos_class = v7;
    goto LABEL_14;
  }
  LODWORD(v3) = 0;
  if (__qos_class)
    goto LABEL_7;
LABEL_14:
  result = 0;
  if (__relative_priority)
  {
    v8 = (v3 & 0x3F00) != 0 && (v3 & 0x22000000) == 0;
    LODWORD(v3) = (char)v3;
    if (v8)
      v9 = v3 + 1;
    else
      v9 = 0;
    *__relative_priority = v9;
  }
  return result;
}

int pthread_kill(pthread_t a1, int a2)
{
  int result;
  unint64_t StatusReg;
  pthread_t v5;

  if (a2 > 0x20)
    return 22;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((pthread_t)(StatusReg - 224) != a1)
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options();
      v5 = (pthread_t)__pthread_head;
      if (__pthread_head)
      {
        while (v5 != a1)
        {
          v5 = *(pthread_t *)v5->__opaque;
          if (!v5)
            goto LABEL_8;
        }
        if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
          pthread_cancel_VARIANT_mp_cold_1();
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        goto LABEL_14;
      }
LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }
    return 3;
  }
  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
LABEL_14:
  result = __pthread_kill();
  if (result == -1)
    return **(_DWORD **)(StatusReg + 8);
  return result;
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  int v2;
  int v3;

  if (a1->__sig == 1297373249)
  {
    if (a2 == 1)
    {
      v2 = 64;
      goto LABEL_7;
    }
    if (a2 == 3)
    {
      v2 = 128;
LABEL_7:
      v3 = 0;
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | v2;
      return v3;
    }
  }
  return 22;
}

int pthread_setcanceltype(int a1, int *a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_setcanceltype_VARIANT_armv81;
  else
    return (int)pthread_setcanceltype_VARIANT_mp;
}

uint64_t _pthread_jit_write_protect_freeze_config()
{
  uint64_t result;

  result = mach_vm_protect(*MEMORY[0x1E0C883F0], (mach_vm_address_t)&_pthread_jit_config, 0x4000uLL, 1, 1);
  if ((_DWORD)result)
    _pthread_jit_write_protect_freeze_config_cold_1(result);
  return result;
}

uint64_t _pthread_mutex_fairshare_unlock_drop()
{
  uint64_t result;
  uint64_t v1;

  result = __psynch_mutexdrop();
  if ((_DWORD)result == -1)
  {
    v1 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if ((v1 & 0xFFFFFFFB) != 0)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_1F0458040 = v1;
      __break(1u);
    }
  }
  return result;
}

void pthread_exit(void *a1)
{
  unint64_t StatusReg;
  uint64_t v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((*(_WORD *)(StatusReg - 146) & 0x400) != 0)
  {
    qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_exit() called from a thread not created by pthread_create()";
    __break(1u);
  }
  else if ((_pthread_ptr_munge_token ^ *(_QWORD *)(StatusReg - 224)) == StatusReg - 224)
  {
    _pthread_exit((_opaque_pthread_t *)(StatusReg - 224), (uint64_t)a1);
  }
  v2 = abort_with_reason();
  _pthread_mutex_fairshare_lock_wait(v2);
}

uint64_t _pthread_mutex_fairshare_lock_wait(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t result;
  int v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  int v10;

  v2 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v4 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  do
  {
    do
      result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    v6 = *(_DWORD *)(a1 + 12) & 0x1C0;
    v7 = *v4;
    v8 = 1;
    do
    {
      if (v6 == 128)
      {
        v8 = (v7 & 2) == 0;
        goto LABEL_7;
      }
      if ((~(_DWORD)v7 & 3) == 0)
        break;
LABEL_7:
      while (1)
      {
        v9 = __ldaxr(v4);
        if (v9 != v7)
          break;
        if (!__stxr(v7 | 3, v4))
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v10 = 0;
      __clrex();
LABEL_11:
      v7 = v9;
    }
    while (!v10);
  }
  while (!v8);
  *v2 = v3;
  return result;
}

uint64_t _pthread_mutex_fairshare_lock_wait_0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  atomic_ullong *v4;
  uint64_t result;
  int v6;
  atomic_ullong v7;
  BOOL v8;
  atomic_ullong v9;
  BOOL v10;

  v2 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v4 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  do
  {
    do
      result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    v6 = *(_DWORD *)(a1 + 12) & 0x1C0;
    v7 = *v4;
    v8 = 1;
    do
    {
      if (v6 == 128)
      {
        v8 = (v7 & 2) == 0;
      }
      else if ((~(_DWORD)v7 & 3) == 0)
      {
        break;
      }
      v9 = v7;
      atomic_compare_exchange_strong_explicit(v4, (unint64_t *)&v9, v7 | 3, memory_order_acquire, memory_order_acquire);
      v10 = v9 == v7;
      v7 = v9;
    }
    while (!v10);
  }
  while (!v8);
  *v2 = v3;
  return result;
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  a1->__sig = 0;
  *(_DWORD *)a1->__opaque = 0;
  return 0;
}

uint64_t _pthread_join(uint64_t a1, uint64_t *a2, int a3)
{
  unint64_t StatusReg;
  unsigned int *v4;
  _QWORD *v8;
  uint64_t v9;
  char v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  char v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = (unsigned int *)(StatusReg - 224);
  v24[0] = StatusReg - 224;
  v24[1] = a2;
  v25 = 0;
  if (!a1)
    return 3;
  os_unfair_lock_lock_with_options();
  v8 = __pthread_head;
  if (!__pthread_head)
  {
LABEL_6:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 3;
  }
  v26 = 0;
  while (v8 != (_QWORD *)a1)
  {
    v8 = (_QWORD *)v8[2];
    if (!v8)
      goto LABEL_6;
  }
  if ((_pthread_ptr_munge_token ^ *(_QWORD *)a1) != a1
    || (unsigned int *)(_pthread_ptr_munge_token ^ *(_QWORD *)v4) != v4)
  {
    abort_with_reason();
    goto LABEL_55;
  }
  v11 = *(_BYTE *)(a1 + 49);
  if ((v11 & 1) != 0 && !*(_QWORD *)(a1 + 32))
  {
    if (v4 != (unsigned int *)a1)
    {
      v14 = *(_QWORD **)(StatusReg - 192);
      if (!v14 || *v14 != a1)
      {
        v4 = (unsigned int *)(a1 + 52);
        if (*(_DWORD *)(a1 + 52) == -1)
        {
          v16 = *(_QWORD *)(a1 + 16);
          v17 = *(_QWORD **)(a1 + 24);
          if (v16)
          {
            *(_QWORD *)(v16 + 24) = v17;
            v17 = *(_QWORD **)(a1 + 24);
          }
          else
          {
            off_1ECCDC100 = *(_UNKNOWN ***)(a1 + 24);
          }
          *v17 = v16;
          *(_BYTE *)(a1 + 49) &= ~1u;
          if (a2)
          {
            v18 = atomic_load((unsigned __int16 *)(a1 + 166));
            if ((~v18 & 0x11) != 0)
              v19 = *(_QWORD *)(a1 + 40);
            else
              v19 = 1;
            *a2 = v19;
          }
          goto LABEL_39;
        }
        LODWORD(v25) = *(_DWORD *)(a1 + 248);
        *(_DWORD *)(a1 + 52) = v25;
        *(_QWORD *)(a1 + 32) = v24;
        if ((v11 & 4) == 0)
          goto LABEL_39;
        v15 = *(_QWORD *)(StatusReg + 72);
        if (!v15)
          goto LABEL_56;
        *(_QWORD *)(StatusReg + 72) = 0;
        while (1)
        {
          HIDWORD(v25) = v15;
LABEL_39:
          os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
          if (!(_DWORD)v25)
            goto LABEL_52;
          v20 = atomic_load(v4);
          if ((_DWORD)v20 == -1)
            break;
          while (v20 == v25)
          {
            v21 = __ulock_wait();
            if (a3 == 2 && v21 == -4)
            {
              v22 = atomic_load((unsigned __int16 *)(v24[0] + 166));
              if ((~v22 & 0x11) == 0)
              {
                if (_pthread_joiner_abort_wait(a1, (uint64_t)v24))
                {
                  *(_BYTE *)(v24[0] + 165) = 1;
                  pthread_exit((void *)1);
                }
              }
            }
            v20 = atomic_load(v4);
            if ((_DWORD)v20 == -1)
              goto LABEL_41;
          }
LABEL_55:
          qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_join() state corruption";
          qword_1F0458040 = v20;
          __break(1u);
LABEL_56:
          LODWORD(v15) = _os_semaphore_create();
        }
LABEL_41:
        os_unfair_lock_lock_with_options();
        if ((_BYTE)v26)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
          goto LABEL_53;
        }
        *(_QWORD *)(a1 + 32) = 0;
        v23 = *(_BYTE *)(a1 + 49);
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        if ((v23 & 2) != 0)
LABEL_52:
          _pthread_deallocate(a1, 0);
LABEL_53:
        v9 = 0;
        goto LABEL_15;
      }
    }
    v9 = 11;
  }
  else
  {
    v9 = 22;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
LABEL_15:
  v12 = HIDWORD(v25);
  if (!(_DWORD)v9 && HIDWORD(v25) && !(_BYTE)v26)
  {
    while (__semwait_signal_nocancel())
      ;
    v12 = HIDWORD(v25);
  }
  if (v12)
  {
    v13 = *(_QWORD *)(StatusReg + 72);
    *(_QWORD *)(StatusReg + 72) = v12;
    if (v13)
      _os_semaphore_dispose();
  }
  return v9;
}

uint64_t _pthread_deallocate(uint64_t result, char a2)
{
  uint64_t v2;

  if (_main_thread_ptr != result)
  {
    v2 = result;
    if ((a2 & 1) == 0 && _pthread_introspection_hook)
      _pthread_introspection_hook_callout_thread_destroy(result);
    result = mach_vm_deallocate(*MEMORY[0x1E0C883F0], *(_QWORD *)(v2 + 192), *(_QWORD *)(v2 + 200));
    if ((_DWORD)result)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Unable to deallocate stack";
      qword_1F0458040 = (int)result;
      __break(1u);
    }
  }
  return result;
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  BOOL v6;
  int v7;
  pthread_t v8;
  thread_act_t v9;
  mach_msg_type_number_t v10;
  integer_t *v11;
  pthread_t v13;
  __int128 v14;

  v6 = (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (_QWORD)a1;
  v7 = !v6;
  if (v6)
  {
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    v9 = *(_DWORD *)&a1->__opaque[232];
  }
  else
  {
    if (!a1)
      return 3;
    os_unfair_lock_lock_with_options();
    v8 = (pthread_t)__pthread_head;
    if (!__pthread_head)
    {
LABEL_28:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 3;
    }
    while (v8 != a1)
    {
      v8 = *(pthread_t *)v8->__opaque;
      if (!v8)
        goto LABEL_28;
    }
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    v9 = *(_DWORD *)&a1->__opaque[232];
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }
  v14 = 0uLL;
  if ((a1->__opaque[63] & 4) == 0)
  {
    switch(a2)
    {
      case 4:
        v11 = (integer_t *)&v14 + 3;
        HIDWORD(v14) = a3->sched_priority;
        v10 = 1;
        break;
      case 2:
        v11 = (integer_t *)&v14 + 1;
        *(sched_param *)((char *)&v14 + 4) = *a3;
        v10 = 2;
        break;
      case 1:
        LODWORD(v14) = a3->sched_priority;
        v10 = 1;
        v11 = (integer_t *)&v14;
        break;
      default:
        return 22;
    }
    if (thread_policy(v9, a2, v11, v10, 1))
      return 22;
    os_unfair_lock_lock_with_options();
    if (!v7)
      goto LABEL_33;
    v13 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v13 != a1)
      {
        v13 = *(pthread_t *)v13->__opaque;
        if (!v13)
          goto LABEL_28;
      }
      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1)
        pthread_cancel_VARIANT_mp_cold_1();
LABEL_33:
      a1->__opaque[32] = a2;
      *(sched_param *)&a1->__opaque[40] = *a3;
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 0;
    }
    goto LABEL_28;
  }
  return 45;
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  a1->__sig = 1381452865;
  *(_DWORD *)a1->__opaque = 2;
  return 0;
}

int pthread_attr_setstack(pthread_attr_t *a1, void *a2, size_t a3)
{
  int result;

  if (a1->__sig != 1414022209 || (*MEMORY[0x1E0C88810] & (unint64_t)a2) != 0)
    return 22;
  result = 22;
  if (a3 >= 0x4000 && (*MEMORY[0x1E0C88810] & a3) == 0)
  {
    result = 0;
    *(_QWORD *)&a1->__opaque[8] = (char *)a2 + a3;
    *(_QWORD *)&a1->__opaque[16] = a3;
  }
  return result;
}

void _pthread_atfork_parent()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = _os_alloc_once();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)v0 + 72));
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 8));
}

uint64_t _pthread_atfork_prepare()
{
  _QWORD *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD **)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = (_QWORD *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  *v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return os_unfair_lock_lock_with_options();
}

uint64_t _pthread_yield_to_enqueuer_4dispatch(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  os_unfair_lock_lock_with_options();
  v6 = __pthread_head;
  if (__pthread_head)
  {
    do
    {
      v7 = v6[a1 + 28];
      if (a2)
      {
        if (v7 == a2)
          goto LABEL_8;
      }
      else if (v7)
      {
LABEL_8:
        v8 = *((unsigned int *)v6 + 62);
        goto LABEL_9;
      }
      v6 = (_QWORD *)v6[2];
    }
    while (v6);
  }
  v8 = 0;
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  MEMORY[0x1DF0F0708](v8, 4, a3);
  return 0;
}

int pthread_key_delete(pthread_key_t a1)
{
  _QWORD *v2;
  int v3;

  os_unfair_lock_lock_with_options();
  if ((a1 & 0xFFFFFFFFFFFFFF00) == 0x100 && _pthread_keys[a1])
  {
    _pthread_keys[a1] = 0;
    os_unfair_lock_lock_with_options();
    v2 = __pthread_head;
    if (__pthread_head)
    {
      do
      {
        v2[a1 + 28] = 0;
        v2 = (_QWORD *)v2[2];
      }
      while (v2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    v3 = 0;
  }
  else
  {
    v3 = 22;
  }
  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return v3;
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cond_signal_thread_np_VARIANT_armv81;
  else
    return (int)pthread_cond_signal_thread_np_VARIANT_mp;
}

uint64_t _pthread_setcancelstate_exit_VARIANT_mp(uint64_t result)
{
  unsigned __int16 *v1;
  unsigned __int16 v2;

  v1 = (unsigned __int16 *)(result + 166);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 & 0xFFDC | 0x22, v1));
  return result;
}

uint64_t pthread_cancel_VARIANT_mp(_QWORD *a1)
{
  unint64_t StatusReg;
  unsigned int v3;
  unsigned __int16 *v5;
  unsigned __int16 v6;
  uint64_t result;
  _QWORD *v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((_QWORD *)(StatusReg - 224) == a1)
  {
    if ((_QWORD *)(_pthread_ptr_munge_token ^ *a1) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    goto LABEL_8;
  }
  if (!a1)
    return 3;
  v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&_pthread_list_lock))
  {
    if (!__stxr(v3, (unsigned int *)&_pthread_list_lock))
      goto LABEL_17;
  }
  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_17:
  v8 = __pthread_head;
  if (!__pthread_head)
  {
LABEL_20:
    v9 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      v10 = __ldxr((unsigned int *)&_pthread_list_lock);
      if (v10 != v9)
        break;
      if (!__stlxr(0, (unsigned int *)&_pthread_list_lock))
        return 3;
    }
    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 3;
  }
  while (v8 != a1)
  {
    v8 = (_QWORD *)v8[2];
    if (!v8)
      goto LABEL_20;
  }
  if ((_QWORD *)(_pthread_ptr_munge_token ^ *a1) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
  v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    v12 = __ldxr((unsigned int *)&_pthread_list_lock);
    if (v12 != v11)
      break;
    if (!__stlxr(0, (unsigned int *)&_pthread_list_lock))
      goto LABEL_8;
  }
  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
LABEL_8:
  if ((*((_WORD *)a1 + 39) & 0x400) != 0)
    return 45;
  v5 = (unsigned __int16 *)a1 + 83;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 | 0x10, v5));
  if ((v6 & 1) == 0)
    return 0;
  result = *((unsigned int *)a1 + 62);
  if ((_DWORD)result)
  {
    __pthread_markcancel();
    return 0;
  }
  return result;
}

uint64_t pthread_setcancelstate_VARIANT_mp(unsigned int a1, int *a2)
{
  unint64_t StatusReg;
  unint64_t v3;
  uint64_t v4;
  __int16 v6;
  unsigned __int16 *v7;
  unsigned __int16 v8;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg - 224);
  v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3)
    pthread_cancel_VARIANT_mp_cold_1();
  v6 = a1;
  if (a1 > 1)
    return 22;
  __pthread_canceled();
  v7 = (unsigned __int16 *)(v3 + 166);
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 & 0xFFFE | v6, v7));
  result = 0;
  if (a2)
    *a2 = v8 & 1;
  return result;
}

uint64_t pthread_setcanceltype_VARIANT_mp(int a1, int *a2)
{
  unint64_t StatusReg;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  unsigned __int16 *v6;
  unsigned __int16 v7;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg - 224);
  v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3)
    pthread_cancel_VARIANT_mp_cold_1();
  if ((a1 & 0xFFFFFFFD) != 0)
    return 22;
  v6 = (unsigned __int16 *)(v3 + 166);
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 & 0xFFFD | a1, v6));
  result = 0;
  if (a2)
    *a2 = v7 & 2;
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return abort_with_reason();
}

void pthread_dependency_fulfill_np_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  unsigned int v3;

  *(_QWORD *)(a1 + 8) = a2;
  v2 = (unsigned int *)(a1 + 4);
  do
    v3 = __ldxr(v2);
  while (__stlxr(0xFFFFFFFF, v2));
  if (v3)
    _pthread_dependency_fulfill_slow(v3, (int)v2);
}

uint64_t pthread_dependency_wait_np_VARIANT_mp(unsigned int *a1)
{
  unsigned int v2;
  unsigned int *v3;
  unsigned int v5;
  unsigned int v7;

  v3 = a1 + 1;
  v2 = *a1;
  do
  {
    if (__ldxr(v3))
    {
      __clrex();
      goto LABEL_11;
    }
  }
  while (__stxr(v2, v3));
  do
  {
    v5 = -(int)__ulock_wait();
    if (v5 > 0xE || ((1 << v5) & 0x4011) == 0)
    {
      if (v5 == 105)
        pthread_dependency_wait_np_VARIANT_mp_cold_3(a1);
      pthread_dependency_wait_np_VARIANT_mp_cold_1(v5);
    }
  }
  while (a1[1] == (unint64_t)*a1);
LABEL_11:
  v7 = atomic_load(v3);
  if (v7 != -1)
    pthread_dependency_wait_np_VARIANT_mp_cold_2(v7);
  return *((_QWORD *)a1 + 1);
}

unint64_t _pthread_atomic_xchg_ptr_VARIANT_mp(unint64_t *a1, unint64_t a2)
{
  unint64_t result;

  do
    result = __ldaxr(a1);
  while (__stlxr(a2, a1));
  return result;
}

uint64_t _pthread_atomic_xchg_uint32_relaxed_VARIANT_mp(unsigned int *a1, unsigned int a2)
{
  uint64_t result;

  do
    result = __ldxr(a1);
  while (__stxr(a2, a1));
  return result;
}

uint64_t pthread_cond_destroy_VARIANT_mp(os_unfair_lock_s *a1)
{
  int os_unfair_lock_opaque;
  uint64_t result;
  unsigned int *p_os_unfair_lock_opaque;
  unint64_t StatusReg;
  unsigned int v7;
  uint32_t v9;
  os_unfair_lock_s *v10;
  BOOL v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  unsigned int v18;

  os_unfair_lock_opaque = a1->_os_unfair_lock_opaque;
  result = 22;
  if (os_unfair_lock_opaque <= 1129270852)
  {
    if (os_unfair_lock_opaque != 1018212795 && os_unfair_lock_opaque != 1129270852)
      return result;
LABEL_13:
    result = 0;
    a1->_os_unfair_lock_opaque = 0;
    return result;
  }
  if (os_unfair_lock_opaque == 1129270854)
    goto LABEL_13;
  if (os_unfair_lock_opaque == 1129270853)
  {
    p_os_unfair_lock_opaque = &a1[2]._os_unfair_lock_opaque;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v7 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(p_os_unfair_lock_opaque))
    {
      if (!__stxr(v7, p_os_unfair_lock_opaque))
        goto LABEL_15;
    }
    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_15:
    v9 = a1[3]._os_unfair_lock_opaque;
    v10 = a1 + 7;
    v11 = (v9 & 0x20000000) == 0;
    if ((v9 & 0x20000000) != 0)
      v12 = (unint64_t *)&a1[7]._os_unfair_lock_opaque;
    else
      v12 = (unint64_t *)&a1[6]._os_unfair_lock_opaque;
    if (!v11)
      v10 = a1 + 8;
    while (1)
    {
      v13 = *(unsigned int *)v12;
      v14 = v10->_os_unfair_lock_opaque;
      if ((v14 ^ v13) > 0xFF)
        break;
      v15 = v13 | (v14 << 32);
      while (1)
      {
        v16 = __ldaxr(v12);
        if (v16 != v15)
          break;
        if (!__stlxr(v15, v12))
          goto LABEL_26;
      }
      __clrex();
    }
LABEL_26:
    a1->_os_unfair_lock_opaque = 0;
    v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      v18 = __ldxr(p_os_unfair_lock_opaque);
      if (v18 != v17)
        break;
      if (!__stlxr(0, p_os_unfair_lock_opaque))
      {
        if ((v14 & 2) == 0)
          return 0;
        goto LABEL_30;
      }
    }
    __clrex();
    os_unfair_lock_unlock(a1 + 2);
    if ((v14 & 2) != 0)
LABEL_30:
      __psynch_cvclrprepost();
    return 0;
  }
  return result;
}

uint64_t pthread_cond_broadcast_VARIANT_mp(unsigned int *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t *v8;
  unsigned int *v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;

  v32 = 1129270852;
  v2 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v32 = v2;
  }
  else
  {
    if (v2 != 1018212795)
    {
      if (v2 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow((uint64_t)a1, &v32);
    v2 = v32;
    if ((_DWORD)result)
      return result;
  }
  if (v2 == 1129270852)
    return result;
  if (v2 != 1129270854)
  {
    if (v2 != 1129270853)
      pthread_cond_broadcast_VARIANT_mp_cold_1(v2);
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = a1[3];
    if ((v7 & 0x20000000) != 0)
      v8 = (unint64_t *)(a1 + 7);
    else
      v8 = (unint64_t *)(a1 + 6);
    if ((v7 & 0x20000000) != 0)
      v9 = a1 + 8;
    else
      v9 = a1 + 7;
    if ((v7 & 0x20000000) != 0)
      v10 = a1 + 6;
    else
      v10 = a1 + 8;
    while (1)
    {
      while (1)
      {
        v11 = *(unsigned int *)v8;
        v12 = *v10;
        v13 = *v9;
        v14 = v11 & 0xFFFFFF00;
        v15 = v13 & 0xFFFFFF00;
        v16 = *v10 & 0xFFFFFF00;
        if ((v11 & 0xFFFFFF00) != (v13 & 0xFFFFFF00) && v14 != v16)
          break;
        v18 = v11 | (v13 << 32);
        while (1)
        {
          v19 = __ldaxr(v8);
          if (v19 != v18)
            break;
          if (!__stlxr(v18, v8))
            return 0;
        }
LABEL_38:
        __clrex();
      }
      v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14)
        v20 = v15 - v14 > 0x7FFFFF7F;
      if (v20)
      {
        v21 = v14 - v16 < 0x7FFFFF81;
        if (v16 > v14)
          v21 = v16 - v14 > 0x7FFFFF7F;
        if (v21)
        {
          while (1)
          {
            v22 = __ldaxr(v10);
            if (v22 != v12)
              break;
            if (!__stlxr(v14, v10))
            {
              v31 = __psynch_cvbroad();
              if ((v31 - 1) <= 0xFFFFFFFD)
                _pthread_cond_updateval((uint64_t)a1, 0, v31);
              return 0;
            }
          }
          goto LABEL_38;
        }
        if (v5 < 0x2000)
        {
          ++v5;
        }
        else
        {
          if (v4)
            return 35;
          while (1)
          {
            v23 = __ldaxr(v10);
            if (v23 != v12)
              break;
            if (!__stlxr(v15, v10))
            {
              v4 = 1;
              goto LABEL_48;
            }
          }
          v4 = 0;
          __clrex();
LABEL_48:
          if (v4)
            v5 = 0;
          else
            ++v5;
        }
      }
      else
      {
        if (v6 >= 0x2000)
          return 35;
        ++v6;
      }
      sched_yield();
    }
  }
  v24 = (unint64_t *)&a1[(((unint64_t)a1[3] >> 29) & 1) + 6];
  do
  {
    v25 = __ldxr(v24);
    v26 = HIWORD(v25);
    if ((v25 & 0xFFFF00000000) == 0 || WORD2(v25) == (_DWORD)v26)
    {
      result = 0;
      __clrex();
      return result;
    }
  }
  while (__stlxr((v25 + 1) | (HIDWORD(v25) << 48) | v25 & 0xFFFF00000000, v24));
  if (WORD2(v25) > v26)
  {
    while (1)
    {
      v28 = __ulock_wake();
      if ((v28 & 0x80000000) == 0)
        break;
      v29 = v28;
      if (v28 != -4)
      {
        result = 0;
        v30 = -v29;
        if (v30 != 2)
        {
          if (v30 == 37)
            pthread_cond_broadcast_VARIANT_mp_cold_3();
          pthread_cond_broadcast_VARIANT_mp_cold_2(v30);
        }
        return result;
      }
    }
  }
  return 0;
}

uint64_t pthread_cond_signal_thread_np_VARIANT_mp(unsigned int *a1, pthread_t a2)
{
  mach_port_t v3;
  unsigned int v4;
  uint64_t result;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unint64_t *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;
  _BOOL4 v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  unsigned int v39;

  if (a2)
    v3 = pthread_mach_thread_np(a2);
  else
    v3 = 0;
  v39 = 1129270852;
  v4 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v39 = *a1;
  }
  else
  {
    if (v4 != 1018212795)
    {
      if (v4 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow((uint64_t)a1, &v39);
    v4 = v39;
    if ((_DWORD)result)
      return result;
  }
  if (v4 == 1129270852)
    return result;
  if (v4 != 1129270854)
  {
    if (v4 != 1129270853)
      pthread_cond_broadcast_VARIANT_mp_cold_1(v4);
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = a1[3];
    if ((v9 & 0x20000000) != 0)
      v10 = (unint64_t *)(a1 + 7);
    else
      v10 = (unint64_t *)(a1 + 6);
    if ((v9 & 0x20000000) != 0)
      v11 = a1 + 8;
    else
      v11 = a1 + 7;
    if ((v9 & 0x20000000) != 0)
      v12 = a1 + 6;
    else
      v12 = a1 + 8;
    while (1)
    {
      v13 = *(unsigned int *)v10;
      v14 = *v12;
      v15 = *v11;
      v16 = v13 & 0xFFFFFF00;
      v17 = v15 & 0xFFFFFF00;
      if ((v13 & 0xFFFFFF00) == (v15 & 0xFFFFFF00) || (v18 = v14 & 0xFFFFFF00, !v3) && v16 == v18)
      {
        v19 = v13 | (v15 << 32);
        while (1)
        {
          v20 = __ldaxr(v10);
          if (v20 != v19)
            break;
          if (!__stlxr(v19, v10))
            return 0;
        }
        goto LABEL_46;
      }
      if (v3)
      {
LABEL_76:
        v38 = __psynch_cvsignal();
        if ((v38 - 1) <= 0xFFFFFFFD)
          _pthread_cond_updateval((uint64_t)a1, 0, v38);
        return 0;
      }
      v21 = (unint64_t)((v13 & 0xFFFFFF00) - (v15 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v17 > v16)
        v21 = v17 - v16 > 0x7FFFFF7F;
      if (!v21)
        break;
      if (v18 <= v16)
        v22 = v16 - v18 < 0x7FFFFF81;
      else
        v22 = v18 - v16 > 0x7FFFFF7F;
      if (v22)
      {
        v23 = v17 - v18 > 0x7FFFFF7F;
        if (v18 >= v17)
          v23 = v18 - v17 < 0x7FFFFF81;
        if (v23)
          v17 = v14 & 0xFFFFFF00;
        v24 = v17 + 256;
        while (1)
        {
          v25 = __ldaxr(v12);
          if (v25 != v14)
            break;
          if (!__stlxr(v24, v12))
            goto LABEL_76;
        }
LABEL_46:
        __clrex();
      }
      else
      {
        if (v7 < 0x2000)
        {
          ++v7;
        }
        else
        {
          if (v6)
            return 35;
          while (1)
          {
            v26 = __ldaxr(v12);
            if (v26 != v14)
              break;
            if (!__stlxr(v17, v12))
            {
              v6 = 1;
              goto LABEL_56;
            }
          }
          v6 = 0;
          __clrex();
LABEL_56:
          if (v6)
            v7 = 0;
          else
            ++v7;
        }
LABEL_59:
        sched_yield();
      }
    }
    if (v8 >= 0x2000)
      return 35;
    ++v8;
    goto LABEL_59;
  }
  v27 = (unint64_t *)&a1[(((unint64_t)a1[3] >> 29) & 1) + 6];
  do
  {
    v28 = __ldxr(v27);
    v29 = v28 & 0xFFFF00000000;
    v30 = HIWORD(v28);
    v31 = WORD2(v28);
    if ((v28 & 0xFFFF00000000) == 0 || WORD2(v28) == (_DWORD)v30)
    {
      result = 0;
      __clrex();
      return result;
    }
    v33 = (v28 + 1);
    if ((int)v30 + 1 < v31)
      v34 = (v30 + 1);
    else
      v34 = v31;
  }
  while (__stlxr(v33 | (v34 << 48) | v29, v27));
  if (v31 <= v30)
    return 0;
  do
  {
    v35 = __ulock_wake();
    if ((v35 & 0x80000000) == 0)
      return 0;
    v36 = v35;
  }
  while (v35 == -4);
  result = 0;
  v37 = -v36;
  if (v37 != 2)
  {
    if (v37 != 37)
      pthread_cond_broadcast_VARIANT_mp_cold_2(v37);
    if (!v3)
      pthread_cond_broadcast_VARIANT_mp_cold_3();
    return pthread_cond_broadcast_VARIANT_mp(a1);
  }
  return result;
}

uint64_t pthread_cond_signal_VARIANT_mp(unsigned int *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t *v8;
  unsigned int *v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  _BOOL4 v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned int v30;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  unsigned int v39;

  v39 = 1129270852;
  v2 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v39 = v2;
  }
  else
  {
    if (v2 != 1018212795)
    {
      if (v2 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow((uint64_t)a1, &v39);
    v2 = v39;
    if ((_DWORD)result)
      return result;
  }
  if (v2 == 1129270852)
    return result;
  if (v2 != 1129270854)
  {
    if (v2 != 1129270853)
      pthread_cond_broadcast_VARIANT_mp_cold_1(v2);
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = a1[3];
    if ((v7 & 0x20000000) != 0)
      v8 = (unint64_t *)(a1 + 7);
    else
      v8 = (unint64_t *)(a1 + 6);
    if ((v7 & 0x20000000) != 0)
      v9 = a1 + 8;
    else
      v9 = a1 + 7;
    if ((v7 & 0x20000000) != 0)
      v10 = a1 + 6;
    else
      v10 = a1 + 8;
    while (1)
    {
      while (1)
      {
        v11 = *(unsigned int *)v8;
        v12 = *v10;
        v13 = *v9;
        v14 = v11 & 0xFFFFFF00;
        v15 = v13 & 0xFFFFFF00;
        v16 = *v10 & 0xFFFFFF00;
        if ((v11 & 0xFFFFFF00) != (v13 & 0xFFFFFF00) && v14 != v16)
          break;
        v18 = v11 | (v13 << 32);
        while (1)
        {
          v19 = __ldaxr(v8);
          if (v19 != v18)
            break;
          if (!__stlxr(v18, v8))
            return 0;
        }
LABEL_44:
        __clrex();
      }
      v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14)
        v20 = v15 - v14 > 0x7FFFFF7F;
      if (v20)
      {
        if (v16 <= v14)
          v21 = v14 - v16 < 0x7FFFFF81;
        else
          v21 = v16 - v14 > 0x7FFFFF7F;
        if (v21)
        {
          v22 = v15 - v16 > 0x7FFFFF7F;
          if (v16 >= v15)
            v22 = v16 - v15 < 0x7FFFFF81;
          if (v22)
            v15 = *v10 & 0xFFFFFF00;
          v23 = v15 + 256;
          while (1)
          {
            v24 = __ldaxr(v10);
            if (v24 != v12)
              break;
            if (!__stlxr(v23, v10))
            {
              v37 = __psynch_cvsignal();
              v38 = v37;
              result = 0;
              if ((v38 - 1) <= 0xFFFFFFFD)
              {
                _pthread_cond_updateval((uint64_t)a1, 0, v38);
                return 0;
              }
              return result;
            }
          }
          goto LABEL_44;
        }
        if (v5 < 0x2000)
        {
          ++v5;
        }
        else
        {
          if (v4)
            return 35;
          while (1)
          {
            v25 = __ldaxr(v10);
            if (v25 != v12)
              break;
            if (!__stlxr(v15, v10))
            {
              v4 = 1;
              goto LABEL_54;
            }
          }
          v4 = 0;
          __clrex();
LABEL_54:
          if (v4)
            v5 = 0;
          else
            ++v5;
        }
      }
      else
      {
        if (v6 >= 0x2000)
          return 35;
        ++v6;
      }
      sched_yield();
    }
  }
  v26 = (unint64_t *)&a1[(((unint64_t)a1[3] >> 29) & 1) + 6];
  do
  {
    v27 = __ldxr(v26);
    v28 = v27 & 0xFFFF00000000;
    v29 = HIWORD(v27);
    v30 = WORD2(v27);
    if ((v27 & 0xFFFF00000000) == 0 || WORD2(v27) == (_DWORD)v29)
    {
      result = 0;
      __clrex();
      return result;
    }
    v32 = (v27 + 1);
    if ((int)v29 + 1 < v30)
      v33 = (v29 + 1);
    else
      v33 = v30;
  }
  while (__stlxr(v32 | (v33 << 48) | v28, v26));
  if (v30 > v29)
  {
    while (1)
    {
      v34 = __ulock_wake();
      if ((v34 & 0x80000000) == 0)
        break;
      v35 = v34;
      if (v34 != -4)
      {
        result = 0;
        v36 = -v35;
        if (v36 != 2)
        {
          if (v36 == 37)
            pthread_cond_broadcast_VARIANT_mp_cold_3();
          pthread_cond_broadcast_VARIANT_mp_cold_2(v36);
        }
        return result;
      }
    }
  }
  return 0;
}

void _pthread_cond_wait_VARIANT_mp(uint64_t a1, uint64_t a2, void **a3, int a4, int a5)
{
  int v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int *v20;
  BOOL v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v33;
  int v34;
  unint64_t StatusReg;
  int v36;
  unsigned int v37;
  _QWORD v38[2];
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;

  if ((*(_QWORD *)a2 & 0xFFFFFFFDLL) != 0x4D555458 && (*(_QWORD *)a2 & 0xFFFFFFF0) != 850045856)
    return;
  v11 = *(_DWORD *)(a2 + 12);
  if ((v11 & 0x4000) != 0)
    v12 = 1129270854;
  else
    v12 = 1129270853;
  v37 = v12;
  v13 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1129270853) < 2)
  {
    if ((_DWORD)v12 != v13)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      goto LABEL_83;
    }
  }
  else if (v13 == 1018212795)
  {
    if (_pthread_cond_check_init_slow(a1, &v37))
      return;
  }
  else
  {
    if (v13 != 1129270852)
      return;
    *(_DWORD *)a1 = v12;
  }
  if (a5 == 2)
    pthread_testcancel();
  if (a3)
  {
    v14 = (unint64_t)a3[1];
    if (v14 > 0x3B9AC9FF)
      return;
    if (a4)
    {
      v15 = (unint64_t)*a3;
      v16 = (v15 | v14) == 0;
LABEL_34:
      if ((v11 & 0x4000) == 0)
      {
        v18 = *(_QWORD *)(a1 + 16);
        if (v18 && v18 != a2)
          return;
        if (!v16)
        {
LABEL_38:
          v43 = 0;
          v42 = 0;
          v38[0] = 0;
          v19 = *(_DWORD *)(a1 + 12);
          v20 = (unsigned int *)(a1 + 28);
          v21 = (v19 & 0x20000000) == 0;
          if ((v19 & 0x20000000) != 0)
            v22 = (unint64_t *)(a1 + 28);
          else
            v22 = (unint64_t *)(a1 + 24);
          if (!v21)
            v20 = (unsigned int *)(a1 + 32);
LABEL_43:
          v23 = *(unsigned int *)v22;
          v24 = *v20;
          v25 = v23 | (v24 << 32);
          v26 = (v23 + 256) | ((unint64_t)((v24 & 0xFFFFFF00) >> 8) << 40);
          do
          {
            v27 = __ldaxr(v22);
            if (v27 != v25)
            {
              __clrex();
              goto LABEL_43;
            }
          }
          while (__stlxr(v26, v22));
          *(_QWORD *)(a1 + 16) = a2;
          if (!_pthread_mutex_droplock_VARIANT_mp(a2, &v42, v38, (unsigned int *)&v43 + 1, &v43))
          {
            if ((v42 & 0x1000) == 0)
              v38[0] = 0;
            v42 &= ~0x2000u;
            if (a5 == 2)
            {
              StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v39 = _pthread_psynch_cond_cleanup;
              v40 = (_QWORD *)a1;
              v41 = *(_QWORD *)(StatusReg - 216);
              *(_QWORD *)(StatusReg - 216) = &v39;
              v36 = __psynch_cvwait();
              pthread_testcancel();
              *(_QWORD *)(StatusReg - 216) = v41;
            }
            else
            {
              v36 = __psynch_cvwait();
            }
            if (v36)
            {
              if (v36 == -1)
                _pthread_cond_updateval(a1, **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8), 0);
              else
                _pthread_cond_updateval(a1, 0, v36);
            }
            pthread_mutex_lock_VARIANT_mp(a2);
          }
          return;
        }
LABEL_49:
        if (!pthread_mutex_unlock_VARIANT_mp(a2))
          pthread_mutex_lock_VARIANT_mp(a2);
        return;
      }
      if (v16)
        goto LABEL_49;
      goto LABEL_51;
    }
    v39 = 0;
    v40 = 0;
    __gettimeofday();
    if (*a3 == v39)
    {
      if ((uint64_t)a3[1] > 1000 * (int)v40)
        goto LABEL_33;
    }
    else if ((uint64_t)*a3 >= (uint64_t)v39)
    {
LABEL_33:
      v16 = 0;
      goto LABEL_34;
    }
    v16 = 1;
    goto LABEL_34;
  }
  if ((v11 & 0x4000) == 0)
  {
    v17 = *(_QWORD *)(a1 + 16);
    if (v17 && v17 != a2)
      return;
    goto LABEL_38;
  }
LABEL_51:
  v28 = (unint64_t *)(a1 + 4 * (((unint64_t)*(unsigned int *)(a1 + 12) >> 29) & 1) + 24);
  do
    v29 = __ldxr(v28);
  while (__stxr(v29 + 0x100000000, v28));
  if (_pthread_mutex_ulock_unlock_VARIANT_mp(a2))
  {
    do
    {
      v30 = __ldaxr(v28);
      LODWORD(v31) = HIWORD(v30) - 1;
      if (HIWORD(v30))
        v31 = v31;
      else
        v31 = 0;
    }
    while (__stxr((v30 + 0xFFFF00000000) & 0xFFFF00000000 | (v31 << 48) | v30, v28));
    return;
  }
  v33 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    if (a5 == 2)
    {
      v38[0] = a1;
      v38[1] = a2;
      v39 = _pthread_ulock_cond_cleanup;
      v40 = v38;
      v41 = 0;
      v41 = *(_QWORD *)(v33 - 216);
      *(_QWORD *)(v33 - 216) = &v39;
      v34 = __ulock_wait2();
      pthread_testcancel();
      *(_QWORD *)(v33 - 216) = v41;
      if ((v34 & 0x80000000) == 0)
        goto LABEL_67;
    }
    else
    {
      v34 = __ulock_wait2();
      if ((v34 & 0x80000000) == 0)
        goto LABEL_67;
    }
    if (v34 != -14)
      break;
LABEL_67:
    if (*(_DWORD *)v28 != (_DWORD)v29)
      goto LABEL_73;
  }
  v12 = -v34;
  if ((_DWORD)v12 == 4 || (_DWORD)v12 == 60)
  {
LABEL_73:
    _pthread_ulock_cond_wait_complete((uint64_t)v28, a2);
    return;
  }
LABEL_83:
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
  qword_1F0458040 = v12;
  __break(1u);
}

uint64_t pthread_cond_init_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  v2 = *(_DWORD *)(a1 + 12);
  v3 = (((a1 + 24) & 7) != 0) << 29;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v2 & 0xC0000000 | v3;
  v4 = 32;
  if (((a1 + 24) & 7) == 0)
    v4 = 28;
  *(_DWORD *)(a1 + v4) = 1;
  if (a2)
    v5 = v3 | (*(_DWORD *)(a2 + 8) << 30);
  else
    v5 = v3 | 0x80000000;
  *(_DWORD *)(a1 + 12) = v5;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(0x434F4E44u, (unsigned int *)a1);
  return 0;
}

uint64_t _pthread_ulock_cond_wait_complete(uint64_t result, uint64_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (unint64_t *)result;
  if (a2)
    result = _pthread_mutex_ulock_lock_VARIANT_mp(a2, 0);
  do
  {
    v3 = __ldaxr(v2);
    LODWORD(v4) = HIWORD(v3) - 1;
    if (HIWORD(v3))
      v4 = v4;
    else
      v4 = 0;
  }
  while (__stxr((v3 + 0xFFFF00000000) & 0xFFFF00000000 | (v4 << 48) | v3, v2));
  return result;
}

uint64_t _pthread_ulock_cond_cleanup(uint64_t *a1)
{
  _pthread_ulock_cond_wait_complete(*a1 + 4 * (((unint64_t)*(unsigned int *)(*a1 + 12) >> 29) & 1) + 24, a1[1]);
  return pthread_cond_signal_VARIANT_mp((unsigned int *)*a1);
}

uint64_t _pthread_psynch_cond_cleanup(uint64_t result)
{
  unint64_t StatusReg;
  uint64_t v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (*(_BYTE *)(StatusReg - 59))
  {
    v2 = *(_QWORD *)(result + 16);
    result = _pthread_cond_updateval(result, *(_DWORD *)(StatusReg - 56), 0);
    if (v2)
      return pthread_mutex_lock_VARIANT_mp(v2);
  }
  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_relaxed(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;

  v3 = *a2;
  v4 = *a3;
  while (1)
  {
    v5 = __ldxr(a1);
    if (v5 != v3)
      break;
    if (!__stxr(v4, a1))
    {
      result = 1;
      goto LABEL_6;
    }
  }
  result = 0;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_acquire(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;

  v3 = *a2;
  v4 = *a3;
  while (1)
  {
    v5 = __ldaxr(a1);
    if (v5 != v3)
      break;
    if (!__stxr(v4, a1))
    {
      result = 1;
      goto LABEL_6;
    }
  }
  result = 0;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_release(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;

  v3 = *a2;
  v4 = *a3;
  while (1)
  {
    v5 = __ldxr(a1);
    if (v5 != v3)
      break;
    if (!__stlxr(v4, a1))
    {
      result = 1;
      goto LABEL_6;
    }
  }
  result = 0;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

uint64_t pthread_mutex_init_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  *(_QWORD *)(a1 + 8) = 0x200000000000;
  if (a2)
  {
    if (*(_QWORD *)a2 != 1297373249)
      return 22;
    *(_WORD *)(a1 + 16) = *(_DWORD *)(a2 + 8);
    v2 = *(_DWORD *)(a2 + 12) & 3 | 0x2000;
    *(_DWORD *)(a1 + 12) = v2;
    v3 = *(_DWORD *)(a2 + 12) & 0x1C0 | v2;
    *(_DWORD *)(a1 + 12) = v3;
    v4 = *(_DWORD *)(a2 + 12) & 0xC | v3;
    *(_DWORD *)(a1 + 12) = v4;
    v5 = *(_DWORD *)(a2 + 12) & 0x30 | v4;
  }
  else
  {
    *(_WORD *)(a1 + 16) = 0;
    v5 = ((__pthread_mutex_default_opt_policy & 7) << 6) | 0x2020;
  }
  v6 = 1297437784;
  *(_WORD *)(a1 + 18) = 0;
  if ((v5 & 0xC) == 0)
  {
    if ((v5 & 0x1C0) == 0x80 || (v5 & 0x1C0) == 0x40)
    {
      v6 = 1297437786;
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    if ((v5 & 0x1CC) == 0x80)
    {
      v9 = v7 ^ 1;
      if ((v5 & 0x30) != 0x20)
        v9 = 1;
      if ((v9 & 1) == 0)
        v5 |= __pthread_mutex_use_ulock << 14;
    }
  }
  *(_DWORD *)(a1 + 12) = v5;
  if ((v5 & 0x4000) != 0)
  {
    *(_QWORD *)(a1 + 32) = -1;
    *(_QWORD *)(a1 + 40) = -1;
    *(_QWORD *)(a1 + 24) = -1;
    *(_DWORD *)(a1 + 24) = 0;
  }
  else
  {
    v10 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    if ((_QWORD *)(a1 + 24) != v10)
    {
      *(_DWORD *)(a1 + 12) = v5 | 0x800;
      *(_QWORD *)(a1 + 24) = -1;
    }
    *(_QWORD *)(a1 + 40) = -1;
    *v10 = 0;
    *(_QWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8) = 0;
  }
  v8 = 0;
  *(_QWORD *)(a1 + 48) = ~a1;
  *(_DWORD *)(a1 + 56) = v6;
  *(_DWORD *)(a1 + 60) = v6;
  *(_DWORD *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(v6, (unsigned int *)a1);
  return v8;
}

uint64_t _pthread_mutex_fairshare_lock_slow_VARIANT_mp(uint64_t a1, int a2)
{
  unint64_t *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  int v13;

  v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) == 0 || *v5 != v6)
  {
LABEL_6:
    v9 = v4;
    v10 = (v4 >> 1) & 1;
    v11 = (v4 | 3) + 256;
    if ((a2 & v10) != 0)
      v11 = v9;
    v12 = v9 & 0xFFFFFFFF00000000 | v11;
    do
    {
      v4 = __ldaxr(v3);
      if (v4 != v9)
      {
        __clrex();
        goto LABEL_6;
      }
    }
    while (__stxr(v12, v3));
    if ((v9 & 2) != 0)
    {
      if ((a2 & 1) != 0)
        return 16;
      _pthread_mutex_fairshare_lock_wait(a1);
    }
    else
    {
      *v5 = v6;
    }
    if ((*(_DWORD *)(a1 + 12) & 0xC) != 8)
      return 0;
    result = 0;
    v13 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_25;
  }
  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    if (v7 > 0xFFFEFFFF)
      return 35;
    result = 0;
    v13 = v7 + 0x10000;
LABEL_25:
    *(_DWORD *)(a1 + 12) = v13;
    return result;
  }
  if (a2)
    return 16;
  else
    return 11;
}

uint64_t _pthread_mutex_fairshare_unlock_slow_VARIANT_mp(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  BOOL v10;
  _BOOL4 v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v15;
  int v16;

  v1 = *(_DWORD *)(a1 + 12);
  v2 = v1 & 0xFFFFEFFF;
  v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  if ((v1 & 0xC) == 0)
    goto LABEL_37;
  if (*v5 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    return 1;
  if ((v1 & 0xC) != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16), HIWORD(v1) == 1))
  {
LABEL_37:
    do
    {
      v6 = HIDWORD(v4);
      v7 = *v5;
      if (((HIDWORD(v4) ^ v4) & 0xFFFFFF00) != 0)
      {
        v6 = (HIDWORD(v4) + 256);
        v8 = v6 ^ v4;
        if ((v6 ^ v4) <= 0xFF)
          v9 = 0;
        else
          v9 = -1;
        v10 = v8 >= 0x100;
        v11 = v8 < 0x100;
        v12 = v4 & 0xFFFFFFFC;
        if (v10)
          v12 = v4;
        if (v10)
          v2 |= 0x1000u;
        if (v7 != v9)
        {
          do
          {
            v13 = __ldxr(v5);
            if (v13 != v7)
            {
              __clrex();
              _pthread_mutex_corruption_abort();
            }
          }
          while (__stxr(v9, v5));
        }
      }
      else
      {
        v11 = 0;
        v12 = v4;
      }
      if (((HIDWORD(v4) ^ v4) & 0xFFFFFF00) == 0 || v11)
        v2 &= ~0x1000u;
      while (1)
      {
        v15 = __ldxr(v3);
        if (v15 != v4)
          break;
        if (!__stlxr(v12 | (v6 << 32), v3))
        {
          v16 = 1;
          goto LABEL_29;
        }
      }
      v16 = 0;
      __clrex();
LABEL_29:
      v4 = v15;
    }
    while (!v16);
  }
  if ((v2 & 0x1000) != 0)
    _pthread_mutex_fairshare_unlock_drop();
  return 0;
}

uint64_t _pthread_mutex_ulock_lock_VARIANT_mp(uint64_t a1, char a2)
{
  unsigned int v3;
  unsigned int *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  v4 = (unsigned int *)(a1 + 24);
  while (1)
  {
    v5 = __ldaxr(v4);
    if ((_DWORD)v5)
      break;
    if (!__stxr(v3, v4))
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
  v6 = 0;
  __clrex();
LABEL_6:
  if (v6)
    v7 = 0;
  else
    v7 = 16;
  if ((v6 & 1) == 0 && (a2 & 1) == 0)
  {
    _pthread_mutex_ulock_lock_slow_VARIANT_mp(a1, v3, v5);
    return 0;
  }
  return v7;
}

uint64_t _pthread_mutex_ulock_lock_slow_VARIANT_mp(uint64_t result, int a2, uint64_t a3)
{
  char v5;
  char v6;
  unsigned int *v7;
  int v8;
  uint64_t v9;
  int v10;

  v5 = 0;
  v6 = 0;
  v7 = (unsigned int *)(result + 24);
  while (1)
  {
    if ((v5 & 1) != 0)
      v8 = -4;
    else
      v8 = a3 & 0xFFFFFFFC;
    do
    {
      v9 = __ldxr(v7);
      if ((_DWORD)v9 != (_DWORD)a3)
      {
        v5 = 0;
        __clrex();
        goto LABEL_12;
      }
    }
    while (__stxr(v8 | 1, v7));
    result = __ulock_wait();
    if ((result & 0x80000000) == 0)
    {
      v6 |= (_DWORD)result != 0;
LABEL_11:
      v5 = 0;
      v9 = *v7;
      goto LABEL_12;
    }
    if ((_DWORD)result == -4 || -(int)result == 14)
      goto LABEL_11;
    if (-(int)result != 105)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
      qword_1F0458040 = (int)result;
      __break(1u);
      return result;
    }
    v5 = 1;
    v9 = a3;
LABEL_12:
    a3 = v9;
    if (!(_DWORD)v9)
    {
      while (1)
      {
        a3 = __ldaxr(v7);
        if ((_DWORD)a3)
          break;
        if (!__stxr(v6 & 1 | a2, v7))
        {
          v10 = 1;
          goto LABEL_17;
        }
      }
      v10 = 0;
      __clrex();
LABEL_17:
      v5 = 0;
      if (v10)
        return result;
    }
  }
}

uint64_t _pthread_mutex_ulock_unlock_VARIANT_mp(uint64_t a1)
{
  unsigned int v1;
  unsigned int *v2;
  int v3;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  v2 = (unsigned int *)(a1 + 24);
  do
    v3 = __ldxr(v2);
  while (__stlxr(0, v2));
  if (v3 != v1)
    _pthread_mutex_ulock_unlock_slow_VARIANT_mp(a1, v1, v3);
  return 0;
}

uint64_t _pthread_mutex_ulock_unlock_slow_VARIANT_mp(uint64_t result, int a2, int a3)
{
  if (a3)
  {
    if ((a3 & 0xFFFFFFFC) != a2)
      goto LABEL_8;
    if ((a3 & 1) == 0)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: unlock_slow without orig_waiters";
      __break(1u);
    }
    while (1)
    {
      result = __ulock_wake();
      if ((result & 0x80000000) == 0)
        break;
      if ((_DWORD)result != -4)
      {
        if (-(int)result == 2)
          break;
        qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
        qword_1F0458040 = -(int)result;
        __break(1u);
LABEL_8:
        if ((a3 & 1) == 0)
          break;
      }
    }
  }
  return result;
}

uint64_t _pthread_mutex_firstfit_unlock_slow_VARIANT_mp(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;

  v1 = *(_DWORD *)(a1 + 12);
  v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v3 = *v2;
  v4 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  if ((v1 & 0xC) == 0)
    goto LABEL_5;
  if (*v4 == *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
  {
    if ((v1 & 0xC) == 8)
    {
      *(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16);
      if (HIWORD(v1) != 1)
        return 0;
    }
    do
    {
LABEL_5:
      v5 = *v4;
      if (*v4)
      {
        do
        {
          v6 = __ldxr(v4);
          if (v6 != v5)
          {
            __clrex();
            _pthread_mutex_corruption_abort();
          }
        }
        while (__stxr(0, v4));
      }
      v7 = (v3 & 0xFFFFFF00) - (HIDWORD(v3) & 0xFFFFFF00);
      v8 = v3 + 0x10000000000;
      if (v7 <= 0)
        v8 = v3;
      v9 = v8 & 0xFFFFFFFF00000000;
      while (1)
      {
        v10 = __ldxr(v2);
        if (v10 != v3)
          break;
        if (!__stlxr(v9 | v3 & 0xFFFFFFFD, v2))
        {
          v11 = 1;
          goto LABEL_15;
        }
      }
      v11 = 0;
      __clrex();
LABEL_15:
      v3 = v10;
    }
    while (!v11);
    if ((((v7 > 0) << 12) & 0x1000) != 0)
      _pthread_mutex_firstfit_wake();
    return 0;
  }
  return 1;
}

uint64_t _pthread_mutex_firstfit_lock_slow_VARIANT_mp(uint64_t a1, int a2)
{
  unint64_t *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  unint64_t v9;
  char v10;
  char v11;
  int v12;

  v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) != 0 && *v5 == v6)
  {
    if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
    {
      if (v7 > 0xFFFEFFFF)
        return 35;
      result = 0;
      v12 = v7 + 0x10000;
LABEL_35:
      *(_DWORD *)(a1 + 12) = v12;
    }
    else if (a2)
    {
      return 16;
    }
    else
    {
      return 11;
    }
    return result;
  }
  while (a2 && (v4 & 2) != 0)
  {
    while (1)
    {
      v9 = __ldaxr(v3);
      if (v9 != v4)
        break;
      if (!__stxr(v4, v3))
      {
        v11 = 1;
        goto LABEL_24;
      }
    }
    v11 = 0;
    __clrex();
LABEL_24:
    if ((v11 & 1) != 0)
      goto LABEL_25;
LABEL_13:
    v4 = v9;
  }
  if ((v4 & 2) == 0)
  {
    while (1)
    {
      v9 = __ldaxr(v3);
      if (v9 != v4)
        break;
      if (!__stxr(v4 | 2, v3))
      {
        *v5 = v6;
        goto LABEL_28;
      }
    }
    __clrex();
    goto LABEL_13;
  }
  do
  {
    v9 = __ldaxr(v3);
    if (v9 != v4)
    {
      v10 = 0;
      __clrex();
      goto LABEL_10;
    }
  }
  while (__stxr((v4 + 256) | v4 & 0xFFFFFFFF00000000, v3));
  v10 = 1;
LABEL_10:
  if ((v10 & 1) == 0)
    goto LABEL_13;
LABEL_25:
  if ((a2 & 1) != 0)
    return 16;
  _pthread_mutex_firstfit_lock_wait(a1);
LABEL_28:
  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    result = 0;
    v12 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_35;
  }
  return 0;
}

uint64_t _pthread_mutex_droplock_VARIANT_mp(uint64_t a1, unsigned int *a2, _QWORD *a3, unsigned int *a4, _DWORD *a5)
{
  int v5;
  unsigned int v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  BOOL v15;
  _BOOL4 v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t result;

  v5 = *(_DWORD *)(a1 + 12);
  v6 = v5 & 0xFFFFEFFF;
  v7 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = *v7;
  v9 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v10 = v5 & 0xC;
  if ((v5 & 0x1C0) == 0x40)
  {
    if ((v5 & 0xC) == 0)
      goto LABEL_6;
    if (*v9 == *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    {
      if (v10 != 8
        || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16), HIWORD(v5) == 1))
      {
        while (1)
        {
LABEL_6:
          v11 = HIDWORD(v8);
          v12 = *v9;
          if (((HIDWORD(v8) ^ v8) & 0xFFFFFF00) != 0)
          {
            v11 = (HIDWORD(v8) + 256);
            v13 = v11 ^ v8;
            if ((v11 ^ v8) <= 0xFF)
              v14 = 0;
            else
              v14 = -1;
            v15 = v13 >= 0x100;
            v16 = v13 < 0x100;
            v17 = v8 & 0xFFFFFFFC;
            if (v15)
              v17 = v8;
            if (v15)
              v6 |= 0x1000u;
            if (v12 != v14)
            {
              while (1)
              {
                v18 = __ldxr(v9);
                if (v18 != v12)
                  break;
                if (!__stxr(v14, v9))
                  goto LABEL_21;
              }
LABEL_61:
              __clrex();
              _pthread_mutex_corruption_abort();
            }
          }
          else
          {
            v16 = 0;
            v17 = v8;
          }
LABEL_21:
          if (((HIDWORD(v8) ^ v8) & 0xFFFFFF00) == 0 || v16)
            v6 &= ~0x1000u;
          while (1)
          {
            v20 = __ldxr(v7);
            if (v20 != v8)
              break;
            if (!__stlxr(v17 | (v11 << 32), v7))
            {
              v21 = 1;
              goto LABEL_30;
            }
          }
          v21 = 0;
          __clrex();
LABEL_30:
          v8 = v20;
          if (v21)
          {
            if (a4)
              *a4 = v17;
            if (a5)
              *a5 = v11;
            goto LABEL_55;
          }
        }
      }
      goto LABEL_57;
    }
    return 1;
  }
  if ((v5 & 0xC) == 0)
    goto LABEL_64;
  if (*v9 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    return 1;
  if (v10 != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16), HIWORD(v5) == 1))
  {
LABEL_64:
    do
    {
      v22 = v8;
      v23 = *v9;
      v24 = (v8 & 0xFFFFFF00) - (HIDWORD(v8) & 0xFFFFFF00);
      if (v24 <= 0)
        v25 = HIDWORD(v8);
      else
        v25 = (HIDWORD(v8) + 256);
      if (v23)
      {
        do
        {
          v26 = __ldxr(v9);
          if (v26 != v23)
            goto LABEL_61;
        }
        while (__stxr(0, v9));
      }
      while (1)
      {
        v27 = __ldxr(v7);
        if (v27 != v8)
          break;
        if (!__stlxr(v8 & 0xFFFFFFFD | (unint64_t)(v25 << 32), v7))
        {
          v28 = 1;
          goto LABEL_49;
        }
      }
      v28 = 0;
      __clrex();
LABEL_49:
      v8 = v27;
    }
    while (!v28);
    if (a4)
      *a4 = v22 & 0xFFFFFFFD;
    if (a5)
      *a5 = v25;
    v6 |= (v24 > 0) << 12;
LABEL_55:
    if (a3)
      *a3 = a1;
  }
LABEL_57:
  result = 0;
  if (a2)
    *a2 = v6;
  return result;
}

uint64_t _pthread_mutex_lock_init_slow_VARIANT_mp(uint64_t a1, int a2)
{
  uint64_t result;
  int v5;

  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (result = _pthread_mutex_check_init_slow(a1), !(_DWORD)result))
  {
    v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_lock_slow_VARIANT_mp(a1, a2);
    }
    else if ((v5 & 0x4000) != 0)
    {
      return _pthread_mutex_ulock_lock_VARIANT_mp(a1, a2);
    }
    else
    {
      return _pthread_mutex_firstfit_lock_slow_VARIANT_mp(a1, a2);
    }
  }
  return result;
}

uint64_t pthread_mutex_unlock_VARIANT_mp(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  char v5;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_unlock_init_slow(a1);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_unlock(a1);
  if ((v1 & 0x4000) != 0)
  {
    _pthread_mutex_ulock_unlock_VARIANT_mp(a1);
    return 0;
  }
  else
  {
    v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v3 = *v2;
    *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
    while (((HIDWORD(v3) ^ v3) & 0xFFFFFF00) == 0)
    {
      while (1)
      {
        v4 = __ldxr(v2);
        if (v4 != v3)
          break;
        if (!__stlxr(v3 & 0xFFFFFFFFFFFFFFFDLL, v2))
        {
          v5 = 1;
          goto LABEL_10;
        }
      }
      v5 = 0;
      __clrex();
LABEL_10:
      v3 = v4;
      if ((v5 & 1) != 0)
        return 0;
    }
    return _pthread_mutex_firstfit_unlock_slow_VARIANT_mp(a1);
  }
}

uint64_t pthread_mutex_lock_VARIANT_mp(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unsigned int v9;
  unsigned int *v10;
  uint64_t v11;
  char v12;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_lock_init_slow_VARIANT_mp(a1, 0);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_lock(a1, 0);
  if ((v1 & 0x4000) != 0)
  {
    v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
    v10 = (unsigned int *)(a1 + 24);
    while (1)
    {
      v11 = __ldaxr(v10);
      if ((_DWORD)v11)
        break;
      if (!__stxr(v9, v10))
      {
        v12 = 1;
        goto LABEL_23;
      }
    }
    v12 = 0;
    __clrex();
LABEL_23:
    if ((v12 & 1) == 0)
      _pthread_mutex_ulock_lock_slow_VARIANT_mp(a1, v9, v11);
    return 0;
  }
  else
  {
    v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v3 = *v2;
    if ((*v2 & 2) == 0)
    {
      v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
      v5 = v3;
      while ((v5 & 2) == 0)
      {
        v6 = v3 & 0xFFFFFFFF00000000 | v5;
        while (1)
        {
          v3 = __ldaxr(v2);
          if (v3 != v6)
            break;
          if (!__stxr(v6 | 2, v2))
          {
            v7 = 1;
            goto LABEL_12;
          }
        }
        v7 = 0;
        __clrex();
LABEL_12:
        v5 = v3;
        if ((v7 & 1) != 0)
        {
          *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = v4;
          return 0;
        }
      }
    }
    return _pthread_mutex_firstfit_lock_slow_VARIANT_mp(a1, 0);
  }
}

uint64_t pthread_mutex_trylock_VARIANT_mp(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t result;
  unsigned int v9;
  unsigned int *v10;
  int v12;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_lock_init_slow_VARIANT_mp(a1, 1);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_lock(a1, 1);
  if ((v1 & 0x4000) != 0)
  {
    v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
    v10 = (unsigned int *)(a1 + 24);
    while (!__ldaxr(v10))
    {
      if (!__stxr(v9, v10))
      {
        v12 = 1;
        goto LABEL_20;
      }
    }
    v12 = 0;
    __clrex();
LABEL_20:
    if (v12)
      return 0;
    else
      return 16;
  }
  else
  {
    v2 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    v4 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v5 = *v4;
    while ((v5 & 2) == 0)
    {
      while (1)
      {
        v6 = __ldaxr(v4);
        if (v6 != v5)
          break;
        if (!__stxr(v5 | 2, v4))
        {
          v7 = 1;
          goto LABEL_10;
        }
      }
      v7 = 0;
      __clrex();
LABEL_10:
      v5 = v6;
      if (v7)
      {
        result = 0;
        *v2 = v3;
        return result;
      }
    }
    __dmb(9u);
    return 16;
  }
}

uint64_t pthread_mutex_destroy_VARIANT_mp(uint64_t a1)
{
  os_unfair_lock_s *v2;
  unint64_t StatusReg;
  unsigned int v4;
  uint64_t v6;
  int v7;
  unsigned int v8;

  v2 = (os_unfair_lock_s *)(a1 + 8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&v2->_os_unfair_lock_opaque))
  {
    if (!__stxr(v4, &v2->_os_unfair_lock_opaque))
      goto LABEL_6;
  }
  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) != 0x4D555458)
  {
    if ((*(_QWORD *)a1 & 0xFFFFFFF0) != 0x32AAABA0)
    {
      v6 = 22;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if ((*(_BYTE *)(a1 + 13) & 0x40) != 0 && !*(_DWORD *)(a1 + 24)
    || !(*(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) | (*(_DWORD *)(((a1 + 39) & 0xFFFFFFFFFFFFFFF8) + 4) ^ *(_DWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8)) & 0xFFFFFF00))
  {
LABEL_12:
    v6 = 0;
    *(_QWORD *)a1 = 0;
    goto LABEL_14;
  }
  v6 = 16;
LABEL_14:
  v7 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    v8 = __ldxr(&v2->_os_unfair_lock_opaque);
    if (v8 != v7)
      break;
    if (!__stlxr(0, &v2->_os_unfair_lock_opaque))
      return v6;
  }
  __clrex();
  os_unfair_lock_unlock(v2);
  return v6;
}

uint64_t pthread_rwlock_destroy_VARIANT_mp(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  unint64_t StatusReg;
  unsigned int v4;
  unsigned __int128 *v6;
  unsigned __int128 v7;
  uint64_t v8;
  int v9;
  unsigned int v10;

  v2 = a1 + 2;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&v2->_os_unfair_lock_opaque))
  {
    if (!__stxr(v4, &v2->_os_unfair_lock_opaque))
      goto LABEL_6;
  }
  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (*(_QWORD *)&a1->_os_unfair_lock_opaque != 766030772)
  {
    if (*(_QWORD *)&a1->_os_unfair_lock_opaque != 1381452875)
    {
      v8 = 22;
      goto LABEL_14;
    }
    v6 = (unsigned __int128 *)(((unint64_t)&a1[11]._os_unfair_lock_opaque + 3) & 0xFFFFFFFFFFFFFFF0);
    do
      v7 = __ldxp(v6);
    while (__stxp(v7, v6));
    if ((v7 & 0xFFFFFF00) != DWORD2(v7))
    {
      v8 = 16;
      goto LABEL_14;
    }
  }
  v8 = 0;
  *(_QWORD *)&a1->_os_unfair_lock_opaque = 0;
LABEL_14:
  v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    v10 = __ldxr(&v2->_os_unfair_lock_opaque);
    if (v10 != v9)
      break;
    if (!__stlxr(0, &v2->_os_unfair_lock_opaque))
      return v8;
  }
  __clrex();
  os_unfair_lock_unlock(v2);
  return v8;
}

uint64_t pthread_rwlock_init_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  unsigned __int128 *v2;
  unsigned __int128 v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  unsigned int v8;
  uint64_t v9;

  if (a2 && *(_QWORD *)a2 != 1381452865)
    return 22;
  if (*(_QWORD *)a1 != 1381452875)
    goto LABEL_7;
  v2 = (unsigned __int128 *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  do
    v3 = __ldxp(v2);
  while (__stxp(v3, v2));
  if ((v3 & 0xFFFFFF00) != DWORD2(v3))
    return 16;
LABEL_7:
  *(_DWORD *)(a1 + 8) = 0;
  v4 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_QWORD *)(a1 + 32);
  v6 = (_QWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  if ((_QWORD *)(a1 + 24) != v4)
  {
    *(_DWORD *)(a1 + 12) |= 0x20000000u;
    *(_QWORD *)(a1 + 24) = -1;
  }
  if (v5 != v6)
  {
    *v5 = -1;
    *(_QWORD *)(a1 + 40) = -1;
  }
  *(_QWORD *)(a1 + 48) = -1;
  *(_QWORD *)(a1 + 56) = -1;
  *v4 = 0;
  *v6 = 0x1000000C0;
  *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8) = 0;
  if (a2 && *(_DWORD *)(a2 + 8) == 1)
  {
    v7 = 16;
    v8 = 0x40000000;
  }
  else
  {
    v7 = 32;
    v8 = 0x80000000;
  }
  v9 = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 12) & 0x3FFFFFFF | v8;
  *(_DWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 64) = ~a1;
  *(_DWORD *)(a1 + 196) = 1381452875;
  *(_DWORD *)(a1 + 20) = 1381452875;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(0x52574C4Bu, (unsigned int *)a1);
  return v9;
}

uint64_t _pthread_rwlock_lock_slow_VARIANT_mp(_QWORD *a1, int a2, int a3)
{
  uint64_t result;
  unsigned __int128 *v7;
  uint64_t v8;
  unsigned __int128 v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned __int128 v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char v35;

  if (*a1 == 1381452875 || (result = _pthread_rwlock_check_init_slow((uint64_t)a1), !(_DWORD)result))
  {
    v7 = (unsigned __int128 *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      v9 = __ldxp(v7);
      v8 = *((_QWORD *)&v9 + 1);
    }
    while (__stxp(v9, v7));
    LODWORD(v10) = v9;
    v11 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    if ((v9 & 2) != 0 && *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) == v11)
      return 11;
    v32 = v11;
    v33 = (_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v34 = (uint64_t)a1;
    v12 = HIDWORD(*((_QWORD *)&v9 + 1));
    v13 = DWORD1(v9);
    v35 = a3;
    v14 = a3 ^ 1;
    do
    {
      v15 = (v10 >> 6) & 1;
      if (a2)
        v16 = (v10 & 5) == 0;
      else
        v16 = (v10 >> 6) & 1;
      if ((v14 | v16) != 1)
      {
        v20 = v13;
        v21 = v10;
        v18 = v12;
        v19 = v8;
LABEL_26:
        v15 = 0;
        v24 = v21 | (v20 << 32);
        v8 = v19;
        v12 = v18;
        goto LABEL_36;
      }
      v17 = 0;
      v18 = v12;
      v19 = v8;
      v20 = v13;
      v21 = v10;
      while ((v16 & 1) != 0)
      {
        if (!a2)
        {
          v24 = v10 | (v13 << 32);
          v30 = v10 & 0xFFFFFF00 | 0x83;
          v19 = v8;
          LODWORD(v20) = v13;
LABEL_35:
          v21 = v30 + 256;
          v20 = (v20 + 256);
          v8 = v19;
          goto LABEL_36;
        }
        if ((unint64_t)(v21 - (v19 & 0xFFFFFF00)) < 0xFFFFFF00)
        {
          v24 = v21 | (v20 << 32);
          v30 = v21 & 0xFFFFFFBF;
          v15 = 1;
          v12 = v18;
          goto LABEL_35;
        }
        if (v17 == 1024)
          return 35;
        ++v17;
        sched_yield();
        do
        {
          v22 = __ldxp(v7);
          v19 = *((_QWORD *)&v22 + 1);
          v21 = v22;
        }
        while (__stxp(v22, v7));
        v18 = HIDWORD(*((_QWORD *)&v22 + 1));
        v20 = DWORD1(v22);
        LOBYTE(v16) = (v22 & 5) == 0;
        if ((v22 & 5) != 0)
          v23 = v14;
        else
          v23 = 1;
        if ((v23 & 1) == 0)
          goto LABEL_26;
      }
      v25 = v21;
      v26 = v20;
      v27 = v21 | 5;
      if (a2)
        v27 = v21 & 0xFFFFFFBF;
      v28 = v27 + 256;
      v29 = v20 & 0xFE | v21 & 0xFFFFFF00;
      v15 = 0;
      if ((v20 & 1) != 0)
        v20 = v29;
      else
        v20 = v20;
      v8 = v19;
      v24 = v25 | (v26 << 32);
      v12 = v18;
      v21 = v28;
LABEL_36:
      while (1)
      {
        v10 = __ldaxr((unint64_t *)v7);
        if (v10 != v24)
          break;
        if (!__stxr(v21 | (v20 << 32), (unint64_t *)v7))
        {
          v31 = 1;
          goto LABEL_40;
        }
      }
      v31 = 0;
      __clrex();
LABEL_40:
      v13 = HIDWORD(v10);
    }
    while (!v31);
    if (v15)
    {
      if ((a2 & 1) == 0)
      {
        result = 0;
        *v33 = v32;
        return result;
      }
    }
    else
    {
      if ((v35 & 1) != 0)
        return 16;
      _pthread_rwlock_lock_wait(v34, a2);
    }
    return 0;
  }
  return result;
}

uint64_t pthread_rwlock_rdlock_VARIANT_mp(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  if (*a1 == 1381452875)
  {
    v1 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      v5 = DWORD2(v4) & 0xFFFFFF00;
      while ((v2 & 5) == 0 && v2 - v5 <= 0xFFFFFEFF)
      {
        v6 = v2 | (unint64_t)(v3 << 32);
        v7 = (((v2 & 0xFFFFFFBF) + 256) | ((unint64_t)v3 << 32)) + 0x10000000000;
        while (1)
        {
          v2 = __ldaxr(v1);
          if (v2 != v6)
            break;
          if (!__stxr(v7, v1))
          {
            v8 = 1;
            goto LABEL_11;
          }
        }
        v8 = 0;
        __clrex();
LABEL_11:
        v3 = HIDWORD(v2);
        if ((v8 & 1) != 0)
          return 0;
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 1, 0);
}

uint64_t pthread_rwlock_tryrdlock_VARIANT_mp(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;

  if (*a1 == 1381452875)
  {
    v1 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      v5 = DWORD2(v4) & 0xFFFFFF00;
      while (1)
      {
        v6 = v2 | ((unint64_t)v3 << 32);
        if ((v2 & 5) != 0)
        {
          while (1)
          {
            v2 = __ldaxr(v1);
            if (v2 != v6)
              break;
            if (!__stxr(v6, v1))
              return 16;
          }
        }
        else
        {
          if (v2 - v5 > 0xFFFFFEFF)
            return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 1, 1);
          v7 = ((v3 << 32) + 0x10000000000) | ((v2 & 0xFFFFFFBF) + 256);
          while (1)
          {
            v2 = __ldaxr(v1);
            if (v2 != v6)
              break;
            if (!__stxr(v7, v1))
              return 0;
          }
        }
        __clrex();
        v3 = HIDWORD(v2);
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 1, 1);
}

uint64_t pthread_rwlock_wrlock_VARIANT_mp(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  if (*a1 == 1381452875)
  {
    v1 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      while ((v2 & 0x40) != 0)
      {
        v5 = v2 | (unint64_t)(v3 << 32);
        v6 = (((v2 & 0xFFFFFF00) + 387) | ((unint64_t)v3 << 32)) + 0x10000000000;
        while (1)
        {
          v2 = __ldaxr(v1);
          if (v2 != v5)
            break;
          if (!__stxr(v6, v1))
          {
            v7 = 1;
            goto LABEL_10;
          }
        }
        v7 = 0;
        __clrex();
LABEL_10:
        v3 = HIDWORD(v2);
        if ((v7 & 1) != 0)
        {
          *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                                      - 8);
          return 0;
        }
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 0, 0);
}

uint64_t pthread_rwlock_trywrlock_VARIANT_mp(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;

  if (*a1 != 1381452875)
    return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 0, 1);
  v1 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v2 = *v1;
  if ((*v1 & 2) != 0)
    return _pthread_rwlock_lock_slow_VARIANT_mp(a1, 0, 1);
  *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
  *(_QWORD *)&v4 = *v1;
  v3 = v4 >> 32;
  do
  {
    v5 = v2;
    v6 = v3 << 32;
    v7 = v5 | ((unint64_t)v3 << 32);
    LODWORD(v8) = (v5 & 0xFFFFFF00) + 387;
    if ((v5 & 0x40) != 0)
      v8 = v8;
    else
      v8 = v5;
    v9 = (v3 << 32) + 0x10000000000;
    if ((v5 & 0x40) != 0)
      v6 = v9;
    v10 = v6 | v8;
    while (1)
    {
      v2 = __ldaxr(v1);
      if (v2 != v7)
        break;
      if (!__stxr(v10, v1))
      {
        v11 = 1;
        goto LABEL_14;
      }
    }
    v11 = 0;
    __clrex();
LABEL_14:
    v3 = HIDWORD(v2);
  }
  while (!v11);
  if ((v5 & 0x40) == 0)
    return 16;
  v12 = 0;
  *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              - 8);
  return v12;
}

uint64_t _pthread_rwlock_unlock_slow_VARIANT_mp(_QWORD *a1, int a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int128 v17;
  int v18;
  BOOL v19;

  if (*a1 == 1381452875 || (result = _pthread_rwlock_check_init_slow((uint64_t)a1), !(_DWORD)result))
  {
    v5 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    LODWORD(v6) = *(_DWORD *)v5;
    if ((*(_DWORD *)v5 & 0x40) == 0)
    {
      v7 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
      v8 = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      v9 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
      if ((v6 & 2) != 0)
        *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
      v10 = 3;
      do
      {
        v11 = v9;
        v10 &= ~a2;
        LODWORD(v12) = v8 + 256;
        if ((v10 & 2) != 0)
          v12 = v12;
        else
          v12 = v8;
        if ((_DWORD)v12 == (v6 & 0xFFFFFF00))
        {
          v13 = 0;
          v14 = v12 | 0xC0;
          v15 = v12 | 1;
        }
        else if ((v6 & 7) != 0)
        {
          v14 = v6 & 0xFFFFFF00 | 1;
          LODWORD(v15) = v6 & 4 | v7 | 2;
          if ((_DWORD)v12 == (v7 & 0xFFFFFF00))
          {
            v15 = v15;
          }
          else
          {
            v14 = v6;
            v15 = v7;
          }
          v13 = v12 == (v7 & 0xFFFFFF00);
        }
        else
        {
          v13 = 0;
          v14 = v6;
          v15 = v7;
        }
        result = v6 | (v7 << 32);
        if (v10 == 1)
        {
          while (1)
          {
            v6 = __ldxr(v5);
            if (v6 != result)
              break;
            if (!__stlxr(v14 | (v15 << 32), v5))
            {
              a2 = 1;
              goto LABEL_37;
            }
          }
          a2 = 0;
          __clrex();
        }
        else
        {
          if (v10 != 3)
          {
            __break(1u);
            return result;
          }
          v16 = v8 | ((unint64_t)v9 << 32);
          do
          {
            while (1)
            {
              v17 = __ldxp((unsigned __int128 *)v5);
              v8 = DWORD2(v17);
              v6 = v17;
              v18 = (_QWORD)v17 != result;
              if (*((_QWORD *)&v17 + 1) != v16)
                ++v18;
              if (!v18)
                break;
              if (!__stlxp(v17, (unsigned __int128 *)v5))
                goto LABEL_27;
            }
          }
          while (__stlxp(__PAIR128__(v12 | (unint64_t)(v11 << 32), v14 | (v15 << 32)), (unsigned __int128 *)v5));
LABEL_27:
          v19 = *((_QWORD *)&v17 + 1) == v16 && (_QWORD)v17 == result;
          v9 = HIDWORD(*((_QWORD *)&v17 + 1));
          if (v19)
            a2 = 3;
          else
            a2 = 0;
        }
LABEL_37:
        v7 = HIDWORD(v6);
      }
      while (v10 != a2);
      if (v13)
        _pthread_rwlock_unlock_drop();
    }
    return 0;
  }
  return result;
}

uint64_t pthread_rwlock_unlock_VARIANT_mp(_QWORD *a1)
{
  unsigned __int128 *v1;
  unsigned int v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int128 v13;
  int v14;
  BOOL v15;

  if (*a1 != 1381452875)
    return _pthread_rwlock_unlock_slow_VARIANT_mp(a1, 0);
  v1 = (unsigned __int128 *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v2 = *(_DWORD *)v1;
  if ((*(_DWORD *)v1 & 0x40) == 0)
  {
    v4 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
    v3 = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
    v5 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
    if ((v2 & 2) != 0)
      *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
    do
    {
      v6 = v3 + 256;
      if ((_DWORD)v6 == (v2 & 0xFFFFFF00))
      {
        v7 = v6 | 0xC0;
        v8 = v6 | 1;
      }
      else
      {
        v7 = v2;
        v8 = v4;
        if ((v2 & 7) != 0)
        {
          v7 = v2;
          v8 = v4;
          if ((_DWORD)v6 == (v4 & 0xFFFFFF00))
            return _pthread_rwlock_unlock_slow_VARIANT_mp(a1, 0);
        }
      }
      v9 = v2 | (v4 << 32);
      v10 = v3 | ((unint64_t)v5 << 32);
      v11 = v7 | (v8 << 32);
      v12 = v6 | (v5 << 32);
      do
      {
        while (1)
        {
          v13 = __ldxp(v1);
          v3 = DWORD2(v13);
          v2 = v13;
          v14 = (_QWORD)v13 != v9;
          if (*((_QWORD *)&v13 + 1) != v10)
            ++v14;
          if (!v14)
            break;
          if (!__stlxp(v13, v1))
            goto LABEL_14;
        }
      }
      while (__stlxp(__PAIR128__(v12, v11), v1));
LABEL_14:
      v15 = *((_QWORD *)&v13 + 1) == v10 && (_QWORD)v13 == v9;
      v5 = HIDWORD(*((_QWORD *)&v13 + 1));
      v4 = DWORD1(v13);
    }
    while (!v15);
  }
  return 0;
}

uint64_t _pthread_setcancelstate_exit_VARIANT_armv81(uint64_t result)
{
  unsigned __int16 v1;
  int v2;
  BOOL v3;

  v1 = *(_WORD *)(result + 166);
  v2 = v1;
  do
  {
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(result + 166), (unsigned __int16 *)&v2, v1 & 0xFFDC | 0x22, memory_order_relaxed, memory_order_relaxed);
    v3 = v2 == v1;
    v1 = v2;
  }
  while (!v3);
  return result;
}

uint64_t pthread_cancel_VARIANT_armv81(_QWORD *a1)
{
  unint64_t StatusReg;
  int v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t result;
  int v8;
  int v9;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((_QWORD *)(StatusReg - 224) == a1)
  {
    if ((_QWORD *)(_pthread_ptr_munge_token ^ *a1) != a1)
      pthread_cancel_VARIANT_mp_cold_1();
    goto LABEL_12;
  }
  if (!a1)
    return 3;
  v3 = 0;
  atomic_compare_exchange_strong_explicit(&_pthread_list_lock, (unsigned int *)&v3, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v3)
    os_unfair_lock_lock_with_options();
  v4 = __pthread_head;
  if (!__pthread_head)
  {
LABEL_8:
    v5 = *(_DWORD *)(StatusReg + 24);
    v6 = v5;
    atomic_compare_exchange_strong_explicit(&_pthread_list_lock, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
    if (v6 != v5)
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 3;
  }
  while (v4 != a1)
  {
    v4 = (_QWORD *)v4[2];
    if (!v4)
      goto LABEL_8;
  }
  if ((_QWORD *)(_pthread_ptr_munge_token ^ *a1) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
  v8 = *(_DWORD *)(StatusReg + 24);
  v9 = v8;
  atomic_compare_exchange_strong_explicit(&_pthread_list_lock, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != v8)
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
LABEL_12:
  if ((*((_WORD *)a1 + 39) & 0x400) != 0)
    return 45;
  if ((atomic_fetch_or_explicit((atomic_ushort *volatile)a1 + 83, 0x10u, memory_order_relaxed) & 1) == 0)
    return 0;
  result = *((unsigned int *)a1 + 62);
  if ((_DWORD)result)
  {
    __pthread_markcancel();
    return 0;
  }
  return result;
}

uint64_t pthread_setcancelstate_VARIANT_armv81(unsigned int a1, int *a2)
{
  unint64_t StatusReg;
  unint64_t v3;
  uint64_t v4;
  __int16 v6;
  int v7;
  unsigned __int16 v8;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg - 224);
  v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3)
    pthread_cancel_VARIANT_mp_cold_1();
  v6 = a1;
  if (a1 > 1)
    return 22;
  __pthread_canceled();
  v7 = *(unsigned __int16 *)(v3 + 166);
  do
  {
    v8 = v7;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v3 + 166), (unsigned __int16 *)&v7, v7 & 0xFFFE | v6, memory_order_relaxed, memory_order_relaxed);
  }
  while (v7 != v8);
  result = 0;
  if (a2)
    *a2 = v8 & 1;
  return result;
}

uint64_t pthread_setcanceltype_VARIANT_armv81(int a1, int *a2)
{
  unint64_t StatusReg;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  unsigned __int16 v7;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg - 224);
  v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3)
    pthread_cancel_VARIANT_mp_cold_1();
  if ((a1 & 0xFFFFFFFD) != 0)
    return 22;
  v6 = *(unsigned __int16 *)(v3 + 166);
  do
  {
    v7 = v6;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v3 + 166), (unsigned __int16 *)&v6, v6 & 0xFFFD | a1, memory_order_relaxed, memory_order_relaxed);
  }
  while (v6 != v7);
  result = 0;
  if (a2)
    *a2 = v7 & 2;
  return result;
}

void pthread_dependency_fulfill_np_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  unsigned int v2;

  *(_QWORD *)(a1 + 8) = a2;
  v2 = atomic_exchange_explicit((atomic_uint *volatile)(a1 + 4), 0xFFFFFFFF, memory_order_release);
  if (v2)
    _pthread_dependency_fulfill_slow(v2, a1 + 4);
}

uint64_t pthread_dependency_wait_np_VARIANT_armv81(uint64_t a1)
{
  int v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v6;

  v2 = 0;
  v3 = (unsigned int *)(a1 + 4);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v2, *(_DWORD *)a1, memory_order_relaxed, memory_order_relaxed);
  if (!v2)
  {
    do
    {
      v4 = -(int)__ulock_wait();
      if (v4 > 0xE || ((1 << v4) & 0x4011) == 0)
      {
        if (v4 == 105)
          pthread_dependency_wait_np_VARIANT_mp_cold_3((unsigned int *)a1);
        pthread_dependency_wait_np_VARIANT_mp_cold_1(v4);
      }
    }
    while (*(_DWORD *)(a1 + 4) == *(_DWORD *)a1);
  }
  v6 = atomic_load(v3);
  if (v6 != -1)
    pthread_dependency_wait_np_VARIANT_mp_cold_2(v6);
  return *(_QWORD *)(a1 + 8);
}

unint64_t _pthread_atomic_xchg_ptr_VARIANT_armv81(atomic_ullong *a1, unint64_t a2)
{
  return atomic_exchange(a1, a2);
}

unsigned int *_pthread_atomic_xchg_uint32_relaxed_VARIANT_armv81(unsigned int *result)
{
  __swp(result, result);
  return result;
}

uint64_t pthread_cond_destroy_VARIANT_armv81(os_unfair_lock_s *a1)
{
  int os_unfair_lock_opaque;
  uint64_t result;
  int v5;
  unint64_t StatusReg;
  uint32_t v7;
  os_unfair_lock_s *v8;
  BOOL v9;
  atomic_ullong *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;

  os_unfair_lock_opaque = a1->_os_unfair_lock_opaque;
  result = 22;
  if (os_unfair_lock_opaque <= 1129270852)
  {
    if (os_unfair_lock_opaque != 1018212795 && os_unfair_lock_opaque != 1129270852)
      return result;
LABEL_19:
    result = 0;
    a1->_os_unfair_lock_opaque = 0;
    return result;
  }
  if (os_unfair_lock_opaque == 1129270854)
    goto LABEL_19;
  if (os_unfair_lock_opaque == 1129270853)
  {
    v5 = 0;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&a1[2], (unsigned int *)&v5, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v5)
      os_unfair_lock_lock_with_options();
    v7 = a1[3]._os_unfair_lock_opaque;
    v8 = a1 + 7;
    v9 = (v7 & 0x20000000) == 0;
    if ((v7 & 0x20000000) != 0)
      v10 = (atomic_ullong *)&a1[7];
    else
      v10 = (atomic_ullong *)&a1[6];
    if (!v9)
      v8 = a1 + 8;
    do
    {
      v11 = *(unsigned int *)v10;
      v12 = v8->_os_unfair_lock_opaque;
      if ((v12 ^ v11) > 0xFF)
        break;
      v13 = v11 | (v12 << 32);
      v14 = v13;
      atomic_compare_exchange_strong(v10, &v14, v13);
    }
    while (v14 != v13);
    a1->_os_unfair_lock_opaque = 0;
    v15 = *(_DWORD *)(StatusReg + 24);
    v16 = v15;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&a1[2], (unsigned int *)&v16, 0, memory_order_release, memory_order_relaxed);
    if (v16 != v15)
      os_unfair_lock_unlock(a1 + 2);
    if ((v12 & 2) != 0)
      __psynch_cvclrprepost();
    return 0;
  }
  return result;
}

uint64_t pthread_cond_broadcast_VARIANT_armv81(unsigned int *a1)
{
  unsigned int v2;
  uint64_t result;
  _BOOL4 v4;
  int v5;
  int v6;
  unsigned int v7;
  atomic_ullong *v8;
  unsigned int *v9;
  atomic_uint *v10;
  uint64_t v11;
  atomic_uint v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  atomic_uint v22;
  atomic_uint v23;
  unsigned int *v24;
  unint64_t v25;
  atomic_ullong *v26;
  unint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;

  v35 = 1129270852;
  v2 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v35 = v2;
  }
  else
  {
    if (v2 != 1018212795)
    {
      if (v2 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow_0((uint64_t)a1, &v35);
    v2 = v35;
    if ((_DWORD)result)
      return result;
  }
  if (v2 == 1129270852)
    return result;
  if (v2 != 1129270854)
  {
    if (v2 != 1129270853)
      pthread_cond_broadcast_VARIANT_mp_cold_1(v2);
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = a1[3];
    if ((v7 & 0x20000000) != 0)
      v8 = (atomic_ullong *)(a1 + 7);
    else
      v8 = (atomic_ullong *)(a1 + 6);
    if ((v7 & 0x20000000) != 0)
      v9 = a1 + 8;
    else
      v9 = a1 + 7;
    if ((v7 & 0x20000000) != 0)
      v10 = (atomic_uint *)(a1 + 6);
    else
      v10 = (atomic_uint *)(a1 + 8);
    while (1)
    {
      while (1)
      {
        v11 = *(unsigned int *)v8;
        v12 = *v10;
        v13 = *v9;
        v14 = v11 & 0xFFFFFF00;
        v15 = v13 & 0xFFFFFF00;
        v16 = *v10 & 0xFFFFFF00;
        v17 = (v11 & 0xFFFFFF00) == (v13 & 0xFFFFFF00) || v14 == v16;
        if (!v17)
          break;
        v18 = v11 | (v13 << 32);
        v19 = v18;
        atomic_compare_exchange_strong(v8, &v19, v18);
        if (v19 == v18)
          return 0;
      }
      v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14)
        v20 = v15 - v14 > 0x7FFFFF7F;
      if (!v20)
        break;
      v21 = v14 - v16 < 0x7FFFFF81;
      if (v16 > v14)
        v21 = v16 - v14 > 0x7FFFFF7F;
      if (v21)
      {
        v22 = *v10;
        atomic_compare_exchange_strong(v10, (unsigned int *)&v22, v14);
        if (v22 == v12)
        {
          v34 = __psynch_cvbroad();
          if ((v34 - 1) <= 0xFFFFFFFD)
            _pthread_cond_updateval_0((uint64_t)a1, 0, v34);
          return 0;
        }
      }
      else
      {
        if (v5 < 0x2000)
        {
          ++v5;
        }
        else
        {
          if (v4)
            return 35;
          v23 = *v10;
          atomic_compare_exchange_strong(v10, (unsigned int *)&v23, v15);
          v4 = v23 == v12;
          if (v23 == v12)
            v5 = 0;
          else
            ++v5;
        }
LABEL_43:
        sched_yield();
      }
    }
    if (v6 >= 0x2000)
      return 35;
    ++v6;
    goto LABEL_43;
  }
  v24 = &a1[((unint64_t)a1[3] >> 29) & 1];
  v27 = *((_QWORD *)v24 + 3);
  v26 = (atomic_ullong *)(v24 + 6);
  v25 = v27;
  do
  {
    result = 0;
    v28 = WORD2(v25);
    if (!WORD2(v25))
      return result;
    v29 = HIWORD(v25);
    if (WORD2(v25) == HIWORD(v25))
      return result;
    v30 = v25;
    atomic_compare_exchange_strong_explicit(v26, &v30, (v25 + 1) | (HIDWORD(v25) << 48) | v25 & 0xFFFF00000000, memory_order_release, memory_order_relaxed);
    v17 = v30 == v25;
    v25 = v30;
  }
  while (!v17);
  if (v29 >= v28)
    return 0;
  do
  {
    v31 = __ulock_wake();
    if ((v31 & 0x80000000) == 0)
      return 0;
    v32 = v31;
  }
  while (v31 == -4);
  result = 0;
  v33 = -v32;
  if (v33 != 2)
  {
    if (v33 == 37)
      pthread_cond_broadcast_VARIANT_mp_cold_3();
    pthread_cond_broadcast_VARIANT_mp_cold_2(v33);
  }
  return result;
}

uint64_t pthread_cond_signal_thread_np_VARIANT_armv81(unsigned int *a1, pthread_t a2)
{
  mach_port_t v3;
  unsigned int v4;
  uint64_t result;
  _BOOL4 v6;
  int v7;
  int v8;
  unsigned int v9;
  atomic_ullong *v10;
  unsigned int *v11;
  atomic_uint *v12;
  uint64_t v13;
  atomic_uint v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;
  _BOOL4 v23;
  atomic_uint v24;
  atomic_uint v25;
  unsigned int *v26;
  unint64_t v27;
  atomic_ullong *v28;
  unint64_t v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  BOOL v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  unsigned int v39;

  if (a2)
    v3 = pthread_mach_thread_np(a2);
  else
    v3 = 0;
  v39 = 1129270852;
  v4 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v39 = *a1;
  }
  else
  {
    if (v4 != 1018212795)
    {
      if (v4 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow_0((uint64_t)a1, &v39);
    v4 = v39;
    if ((_DWORD)result)
      return result;
  }
  if (v4 == 1129270852)
    return result;
  if (v4 != 1129270854)
  {
    if (v4 != 1129270853)
      pthread_cond_broadcast_VARIANT_mp_cold_1(v4);
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = a1[3];
    if ((v9 & 0x20000000) != 0)
      v10 = (atomic_ullong *)(a1 + 7);
    else
      v10 = (atomic_ullong *)(a1 + 6);
    if ((v9 & 0x20000000) != 0)
      v11 = a1 + 8;
    else
      v11 = a1 + 7;
    if ((v9 & 0x20000000) != 0)
      v12 = (atomic_uint *)(a1 + 6);
    else
      v12 = (atomic_uint *)(a1 + 8);
    while (1)
    {
      while (1)
      {
        v13 = *(unsigned int *)v10;
        v14 = *v12;
        v15 = *v11;
        v16 = v13 & 0xFFFFFF00;
        v17 = v15 & 0xFFFFFF00;
        if ((v13 & 0xFFFFFF00) != (v15 & 0xFFFFFF00))
        {
          v18 = v14 & 0xFFFFFF00;
          if (v3 || v16 != v18)
            break;
        }
        v19 = v13 | (v15 << 32);
        v20 = v19;
        atomic_compare_exchange_strong(v10, &v20, v19);
        if (v20 == v19)
          return 0;
      }
      if (v3)
      {
LABEL_66:
        v38 = __psynch_cvsignal();
        if ((v38 - 1) <= 0xFFFFFFFD)
          _pthread_cond_updateval_0((uint64_t)a1, 0, v38);
        return 0;
      }
      v21 = (unint64_t)((v13 & 0xFFFFFF00) - (v15 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v17 > v16)
        v21 = v17 - v16 > 0x7FFFFF7F;
      if (!v21)
        break;
      if (v18 <= v16)
        v22 = v16 - v18 < 0x7FFFFF81;
      else
        v22 = v18 - v16 > 0x7FFFFF7F;
      if (v22)
      {
        v23 = v17 - v18 > 0x7FFFFF7F;
        if (v18 >= v17)
          v23 = v18 - v17 < 0x7FFFFF81;
        if (v23)
          v17 = v14 & 0xFFFFFF00;
        v24 = *v12;
        atomic_compare_exchange_strong(v12, (unsigned int *)&v24, v17 + 256);
        if (v24 == v14)
          goto LABEL_66;
      }
      else
      {
        if (v7 < 0x2000)
        {
          ++v7;
        }
        else
        {
          if (v6)
            return 35;
          v25 = *v12;
          atomic_compare_exchange_strong(v12, (unsigned int *)&v25, v17);
          v6 = v25 == v14;
          if (v25 == v14)
            v7 = 0;
          else
            ++v7;
        }
LABEL_50:
        sched_yield();
      }
    }
    if (v8 >= 0x2000)
      return 35;
    ++v8;
    goto LABEL_50;
  }
  v26 = &a1[((unint64_t)a1[3] >> 29) & 1];
  v29 = *((_QWORD *)v26 + 3);
  v28 = (atomic_ullong *)(v26 + 6);
  v27 = v29;
  do
  {
    result = 0;
    v30 = WORD2(v27);
    if (!WORD2(v27))
      return result;
    v31 = HIWORD(v27);
    if (WORD2(v27) == HIWORD(v27))
      return result;
    if ((int)v31 + 1 < WORD2(v27))
      v32 = (v31 + 1);
    else
      v32 = WORD2(v27);
    v33 = v27;
    atomic_compare_exchange_strong_explicit(v28, &v33, (v27 + 1) | (unint64_t)(v32 << 48) | v27 & 0xFFFF00000000, memory_order_release, memory_order_relaxed);
    v34 = v33 == v27;
    v27 = v33;
  }
  while (!v34);
  if (v31 >= v30)
    return 0;
  do
  {
    v35 = __ulock_wake();
    if ((v35 & 0x80000000) == 0)
      return 0;
    v36 = v35;
  }
  while (v35 == -4);
  result = 0;
  v37 = -v36;
  if (v37 != 2)
  {
    if (v37 != 37)
      pthread_cond_broadcast_VARIANT_mp_cold_2(v37);
    if (!v3)
      pthread_cond_broadcast_VARIANT_mp_cold_3();
    return pthread_cond_broadcast_VARIANT_armv81(a1);
  }
  return result;
}

uint64_t pthread_cond_signal_VARIANT_armv81(unsigned int *a1)
{
  unsigned int v2;
  uint64_t result;
  _BOOL4 v4;
  int v5;
  int v6;
  unsigned int v7;
  atomic_ullong *v8;
  unsigned int *v9;
  atomic_uint *v10;
  uint64_t v11;
  atomic_uint v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  _BOOL4 v22;
  atomic_uint v23;
  atomic_uint v24;
  unsigned int *v25;
  unint64_t v26;
  atomic_ullong *v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  unsigned int v35;
  int v36;
  int v37;
  unsigned int v38;

  v38 = 1129270852;
  v2 = *a1;
  if (*a1 - 1129270853 < 2)
  {
    result = 0;
    v38 = v2;
  }
  else
  {
    if (v2 != 1018212795)
    {
      if (v2 == 1129270852)
        return 0;
      else
        return 22;
    }
    result = _pthread_cond_check_init_slow_0((uint64_t)a1, &v38);
    v2 = v38;
    if ((_DWORD)result)
      return result;
  }
  if (v2 == 1129270852)
    return result;
  if (v2 == 1129270854)
  {
    v25 = &a1[((unint64_t)a1[3] >> 29) & 1];
    v28 = *((_QWORD *)v25 + 3);
    v27 = (atomic_ullong *)(v25 + 6);
    v26 = v28;
    do
    {
      result = 0;
      v29 = WORD2(v26);
      if (!WORD2(v26))
        return result;
      v30 = HIWORD(v26);
      if (WORD2(v26) == HIWORD(v26))
        return result;
      if ((int)v30 + 1 < WORD2(v26))
        v31 = (v30 + 1);
      else
        v31 = WORD2(v26);
      v32 = v26;
      atomic_compare_exchange_strong_explicit(v27, &v32, (v26 + 1) | (unint64_t)(v31 << 48) | v26 & 0xFFFF00000000, memory_order_release, memory_order_relaxed);
      v17 = v32 == v26;
      v26 = v32;
    }
    while (!v17);
    if (v30 < v29)
    {
      while (1)
      {
        v33 = __ulock_wake();
        if ((v33 & 0x80000000) == 0)
          break;
        v34 = v33;
        if (v33 != -4)
        {
          result = 0;
          v35 = -v34;
          if (v35 != 2)
          {
            if (v35 == 37)
              pthread_cond_broadcast_VARIANT_mp_cold_3();
            pthread_cond_broadcast_VARIANT_mp_cold_2(v35);
          }
          return result;
        }
      }
    }
    return 0;
  }
  if (v2 != 1129270853)
    pthread_cond_broadcast_VARIANT_mp_cold_1(v2);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = a1[3];
  if ((v7 & 0x20000000) != 0)
    v8 = (atomic_ullong *)(a1 + 7);
  else
    v8 = (atomic_ullong *)(a1 + 6);
  if ((v7 & 0x20000000) != 0)
    v9 = a1 + 8;
  else
    v9 = a1 + 7;
  if ((v7 & 0x20000000) != 0)
    v10 = (atomic_uint *)(a1 + 6);
  else
    v10 = (atomic_uint *)(a1 + 8);
  do
  {
    while (1)
    {
      while (1)
      {
        v11 = *(unsigned int *)v8;
        v12 = *v10;
        v13 = *v9;
        v14 = v11 & 0xFFFFFF00;
        v15 = v13 & 0xFFFFFF00;
        v16 = *v10 & 0xFFFFFF00;
        v17 = (v11 & 0xFFFFFF00) == (v13 & 0xFFFFFF00) || v14 == v16;
        if (!v17)
          break;
        v18 = v11 | (v13 << 32);
        v19 = v18;
        atomic_compare_exchange_strong(v8, &v19, v18);
        if (v19 == v18)
          return 0;
      }
      v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14)
        v20 = v15 - v14 > 0x7FFFFF7F;
      if (!v20)
      {
        if (v6 >= 0x2000)
          return 35;
        ++v6;
        goto LABEL_48;
      }
      if (v16 <= v14 ? v14 - v16 < 0x7FFFFF81 : v16 - v14 > 0x7FFFFF7F)
        break;
      if (v5 < 0x2000)
      {
        ++v5;
      }
      else
      {
        if (v4)
          return 35;
        v24 = *v10;
        atomic_compare_exchange_strong(v10, (unsigned int *)&v24, v15);
        v4 = v24 == v12;
        if (v24 == v12)
          v5 = 0;
        else
          ++v5;
      }
LABEL_48:
      sched_yield();
    }
    v22 = v15 - v16 > 0x7FFFFF7F;
    if (v16 >= v15)
      v22 = v16 - v15 < 0x7FFFFF81;
    if (v22)
      v15 = *v10 & 0xFFFFFF00;
    v23 = *v10;
    atomic_compare_exchange_strong(v10, (unsigned int *)&v23, v15 + 256);
  }
  while (v23 != v12);
  v36 = __psynch_cvsignal();
  v37 = v36;
  result = 0;
  if ((v37 - 1) <= 0xFFFFFFFD)
  {
    _pthread_cond_updateval_0((uint64_t)a1, 0, v37);
    return 0;
  }
  return result;
}

void _pthread_cond_wait_VARIANT_armv81(uint64_t a1, uint64_t a2, void **a3, int a4, int a5)
{
  BOOL v5;
  int v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int *v20;
  BOOL v21;
  atomic_ullong *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  atomic_ullong *v26;
  int add_explicit;
  unint64_t v28;
  atomic_ullong v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  unint64_t StatusReg;
  int v34;
  unsigned int v35;
  _QWORD v36[2];
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;

  v5 = (*(_QWORD *)a2 & 0xFFFFFFFDLL) == 0x4D555458 || (*(_QWORD *)a2 & 0xFFFFFFF0) == 850045856;
  if (!v5)
    return;
  v11 = *(_DWORD *)(a2 + 12);
  if ((v11 & 0x4000) != 0)
    v12 = 1129270854;
  else
    v12 = 1129270853;
  v35 = v12;
  v13 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1129270853) < 2)
  {
    if ((_DWORD)v12 != v13)
    {
      qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      goto LABEL_79;
    }
  }
  else if (v13 == 1018212795)
  {
    if (_pthread_cond_check_init_slow_0(a1, &v35))
      return;
  }
  else
  {
    if (v13 != 1129270852)
      return;
    *(_DWORD *)a1 = v12;
  }
  if (a5 == 2)
    pthread_testcancel();
  if (a3)
  {
    v14 = (unint64_t)a3[1];
    if (v14 > 0x3B9AC9FF)
      return;
    if (a4)
    {
      v15 = (unint64_t)*a3;
      v16 = (v15 | v14) == 0;
LABEL_34:
      if ((v11 & 0x4000) == 0)
      {
        v18 = *(_QWORD *)(a1 + 16);
        if (v18 && v18 != a2)
          return;
        if (!v16)
        {
LABEL_38:
          v41 = 0;
          v40 = 0;
          v36[0] = 0;
          v19 = *(_DWORD *)(a1 + 12);
          v20 = (unsigned int *)(a1 + 28);
          v21 = (v19 & 0x20000000) == 0;
          if ((v19 & 0x20000000) != 0)
            v22 = (atomic_ullong *)(a1 + 28);
          else
            v22 = (atomic_ullong *)(a1 + 24);
          if (!v21)
            v20 = (unsigned int *)(a1 + 32);
          do
          {
            v23 = *(unsigned int *)v22;
            v24 = *v20;
            v25 = v23 | (v24 << 32);
            atomic_compare_exchange_strong(v22, (unint64_t *)&v25, (v23 + 256) | ((unint64_t)((v24 & 0xFFFFFF00) >> 8) << 40));
          }
          while (v25 != (v23 | (v24 << 32)));
          *(_QWORD *)(a1 + 16) = a2;
          if (!_pthread_mutex_droplock_VARIANT_armv81(a2, &v40, v36, (unsigned int *)&v41 + 1, &v41))
          {
            if ((v40 & 0x1000) == 0)
              v36[0] = 0;
            v40 &= ~0x2000u;
            if (a5 == 2)
            {
              StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              v37 = _pthread_psynch_cond_cleanup_0;
              v38 = (_QWORD *)a1;
              v39 = *(_QWORD *)(StatusReg - 216);
              *(_QWORD *)(StatusReg - 216) = &v37;
              v34 = __psynch_cvwait();
              pthread_testcancel();
              *(_QWORD *)(StatusReg - 216) = v39;
            }
            else
            {
              v34 = __psynch_cvwait();
            }
            if (v34)
            {
              if (v34 == -1)
                _pthread_cond_updateval_0(a1, **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8), 0);
              else
                _pthread_cond_updateval_0(a1, 0, v34);
            }
            pthread_mutex_lock_VARIANT_armv81(a2);
          }
          return;
        }
LABEL_47:
        if (!pthread_mutex_unlock_VARIANT_armv81(a2))
          pthread_mutex_lock_VARIANT_armv81(a2);
        return;
      }
      if (v16)
        goto LABEL_47;
      goto LABEL_49;
    }
    v37 = 0;
    v38 = 0;
    __gettimeofday();
    if (*a3 == v37)
    {
      if ((uint64_t)a3[1] > 1000 * (int)v38)
        goto LABEL_33;
    }
    else if ((uint64_t)*a3 >= (uint64_t)v37)
    {
LABEL_33:
      v16 = 0;
      goto LABEL_34;
    }
    v16 = 1;
    goto LABEL_34;
  }
  if ((v11 & 0x4000) == 0)
  {
    v17 = *(_QWORD *)(a1 + 16);
    if (v17 && v17 != a2)
      return;
    goto LABEL_38;
  }
LABEL_49:
  v26 = (atomic_ullong *)(a1 + 4 * (((unint64_t)*(unsigned int *)(a1 + 12) >> 29) & 1) + 24);
  add_explicit = atomic_fetch_add_explicit(v26, 0x100000000uLL, memory_order_relaxed);
  if (_pthread_mutex_ulock_unlock_VARIANT_armv81(a2))
  {
    v28 = *v26;
    v29 = *v26;
    do
    {
      LODWORD(v30) = HIWORD(v28) - 1;
      if (HIWORD(v28))
        v30 = v30;
      else
        v30 = 0;
      atomic_compare_exchange_strong_explicit(v26, (unint64_t *)&v29, (v28 + 0xFFFF00000000) & 0xFFFF00000000 | (v30 << 48) | v28, memory_order_acquire, memory_order_acquire);
      v5 = v29 == v28;
      v28 = v29;
    }
    while (!v5);
    return;
  }
  v31 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    if (a5 == 2)
    {
      v36[0] = a1;
      v36[1] = a2;
      v37 = _pthread_ulock_cond_cleanup_0;
      v38 = v36;
      v39 = 0;
      v39 = *(_QWORD *)(v31 - 216);
      *(_QWORD *)(v31 - 216) = &v37;
      v32 = __ulock_wait2();
      pthread_testcancel();
      *(_QWORD *)(v31 - 216) = v39;
      if ((v32 & 0x80000000) == 0)
        goto LABEL_63;
    }
    else
    {
      v32 = __ulock_wait2();
      if ((v32 & 0x80000000) == 0)
        goto LABEL_63;
    }
    if (v32 != -14)
      break;
LABEL_63:
    if (*(_DWORD *)v26 != add_explicit)
      goto LABEL_69;
  }
  v12 = -v32;
  if ((_DWORD)v12 == 4 || (_DWORD)v12 == 60)
  {
LABEL_69:
    _pthread_ulock_cond_wait_complete_0((uint64_t)v26, a2);
    return;
  }
LABEL_79:
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
  qword_1F0458040 = v12;
  __break(1u);
}

uint64_t pthread_cond_init_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  v2 = *(_DWORD *)(a1 + 12);
  v3 = (((a1 + 24) & 7) != 0) << 29;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v2 & 0xC0000000 | v3;
  v4 = 32;
  if (((a1 + 24) & 7) == 0)
    v4 = 28;
  *(_DWORD *)(a1 + v4) = 1;
  if (a2)
    v5 = v3 | (*(_DWORD *)(a2 + 8) << 30);
  else
    v5 = v3 | 0x80000000;
  *(_DWORD *)(a1 + 12) = v5;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(0x434F4E44u, (unsigned int *)a1);
  return 0;
}

uint64_t _pthread_ulock_cond_wait_complete_0(uint64_t result, uint64_t a2)
{
  atomic_ullong *v2;
  unint64_t v3;
  atomic_ullong v4;
  uint64_t v5;
  BOOL v6;

  v2 = (atomic_ullong *)result;
  if (a2)
    result = _pthread_mutex_ulock_lock_VARIANT_armv81(a2, 0);
  v3 = *v2;
  v4 = *v2;
  do
  {
    LODWORD(v5) = HIWORD(v3) - 1;
    if (HIWORD(v3))
      v5 = v5;
    else
      v5 = 0;
    atomic_compare_exchange_strong_explicit(v2, (unint64_t *)&v4, (v3 + 0xFFFF00000000) & 0xFFFF00000000 | (v5 << 48) | v3, memory_order_acquire, memory_order_acquire);
    v6 = v4 == v3;
    v3 = v4;
  }
  while (!v6);
  return result;
}

uint64_t _pthread_ulock_cond_cleanup_0(uint64_t *a1)
{
  _pthread_ulock_cond_wait_complete_0(*a1 + 4 * (((unint64_t)*(unsigned int *)(*a1 + 12) >> 29) & 1) + 24, a1[1]);
  return pthread_cond_signal_VARIANT_armv81((unsigned int *)*a1);
}

uint64_t _pthread_psynch_cond_cleanup_0(uint64_t result)
{
  unint64_t StatusReg;
  uint64_t v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (*(_BYTE *)(StatusReg - 59))
  {
    v2 = *(_QWORD *)(result + 16);
    result = _pthread_cond_updateval_0(result, *(_DWORD *)(StatusReg - 56), 0);
    if (v2)
      return pthread_mutex_lock_VARIANT_armv81(v2);
  }
  return result;
}

BOOL mutex_seq_atomic_cmpxchgv_relaxed_0(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 result;

  v3 = *a2;
  v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_relaxed, memory_order_relaxed);
  result = v4 == v3;
  *a2 = v4;
  return result;
}

BOOL mutex_seq_atomic_cmpxchgv_acquire_0(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 result;

  v3 = *a2;
  v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_acquire, memory_order_acquire);
  result = v4 == v3;
  *a2 = v4;
  return result;
}

BOOL mutex_seq_atomic_cmpxchgv_release_0(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 result;

  v3 = *a2;
  v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_release, memory_order_relaxed);
  result = v4 == v3;
  *a2 = v4;
  return result;
}

uint64_t pthread_mutex_init_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  *(_QWORD *)(a1 + 8) = 0x200000000000;
  if (a2)
  {
    if (*(_QWORD *)a2 != 1297373249)
      return 22;
    *(_WORD *)(a1 + 16) = *(_DWORD *)(a2 + 8);
    v2 = *(_DWORD *)(a2 + 12) & 3 | 0x2000;
    *(_DWORD *)(a1 + 12) = v2;
    v3 = *(_DWORD *)(a2 + 12) & 0x1C0 | v2;
    *(_DWORD *)(a1 + 12) = v3;
    v4 = *(_DWORD *)(a2 + 12) & 0xC | v3;
    *(_DWORD *)(a1 + 12) = v4;
    v5 = *(_DWORD *)(a2 + 12) & 0x30 | v4;
  }
  else
  {
    *(_WORD *)(a1 + 16) = 0;
    v5 = ((__pthread_mutex_default_opt_policy & 7) << 6) | 0x2020;
  }
  v6 = 1297437784;
  *(_WORD *)(a1 + 18) = 0;
  if ((v5 & 0xC) == 0)
  {
    if ((v5 & 0x1C0) == 0x80 || (v5 & 0x1C0) == 0x40)
    {
      v6 = 1297437786;
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    if ((v5 & 0x1CC) == 0x80)
    {
      v9 = v7 ^ 1;
      if ((v5 & 0x30) != 0x20)
        v9 = 1;
      if ((v9 & 1) == 0)
        v5 |= __pthread_mutex_use_ulock << 14;
    }
  }
  *(_DWORD *)(a1 + 12) = v5;
  if ((v5 & 0x4000) != 0)
  {
    *(_QWORD *)(a1 + 32) = -1;
    *(_QWORD *)(a1 + 40) = -1;
    *(_QWORD *)(a1 + 24) = -1;
    *(_DWORD *)(a1 + 24) = 0;
  }
  else
  {
    v10 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    if ((_QWORD *)(a1 + 24) != v10)
    {
      *(_DWORD *)(a1 + 12) = v5 | 0x800;
      *(_QWORD *)(a1 + 24) = -1;
    }
    *(_QWORD *)(a1 + 40) = -1;
    *v10 = 0;
    *(_QWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8) = 0;
  }
  v8 = 0;
  *(_QWORD *)(a1 + 48) = ~a1;
  *(_DWORD *)(a1 + 56) = v6;
  *(_DWORD *)(a1 + 60) = v6;
  *(_DWORD *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(v6, (unsigned int *)a1);
  return v8;
}

uint64_t _pthread_mutex_fairshare_lock_slow_VARIANT_armv81(uint64_t a1, int a2)
{
  atomic_ullong *v3;
  atomic_ullong v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  atomic_ullong v9;
  unsigned int v10;
  int v11;

  v3 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) == 0 || *v5 != v6)
  {
    do
    {
      v9 = v4;
      v10 = (v4 | 3) + 256;
      if ((a2 & ((v4 & 2) != 0)) != 0)
        v10 = v4;
      atomic_compare_exchange_strong_explicit(v3, (unint64_t *)&v4, v4 & 0xFFFFFFFF00000000 | v10, memory_order_acquire, memory_order_acquire);
    }
    while (v4 != v9);
    if ((v9 & 2) != 0)
    {
      if ((a2 & 1) != 0)
        return 16;
      _pthread_mutex_fairshare_lock_wait_0(a1);
    }
    else
    {
      *v5 = v6;
    }
    if ((*(_DWORD *)(a1 + 12) & 0xC) != 8)
      return 0;
    result = 0;
    v11 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_21;
  }
  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    if (v7 > 0xFFFEFFFF)
      return 35;
    result = 0;
    v11 = v7 + 0x10000;
LABEL_21:
    *(_DWORD *)(a1 + 12) = v11;
    return result;
  }
  if (a2)
    return 16;
  else
    return 11;
}

uint64_t _pthread_mutex_fairshare_unlock_slow_VARIANT_armv81(uint64_t a1)
{
  int v1;
  unsigned int v2;
  atomic_ullong *v3;
  unint64_t v4;
  atomic_ullong *v5;
  unint64_t v6;
  atomic_ullong v7;
  unsigned int v8;
  unint64_t v9;
  BOOL v10;
  _BOOL4 v11;
  unsigned int v12;
  atomic_ullong v13;
  unint64_t v15;
  BOOL v16;

  v1 = *(_DWORD *)(a1 + 12);
  v2 = v1 & 0xFFFFEFFF;
  v3 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  if ((v1 & 0xC) == 0)
    goto LABEL_25;
  if (*v5 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    return 1;
  if ((v1 & 0xC) != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16), HIWORD(v1) == 1))
  {
LABEL_25:
    do
    {
      v6 = HIDWORD(v4);
      v7 = *v5;
      if (((HIDWORD(v4) ^ v4) & 0xFFFFFF00) != 0)
      {
        v6 = (HIDWORD(v4) + 256);
        v8 = v6 ^ v4;
        if ((v6 ^ v4) <= 0xFF)
          v9 = 0;
        else
          v9 = -1;
        v10 = v8 >= 0x100;
        v11 = v8 < 0x100;
        v12 = v4 & 0xFFFFFFFC;
        if (v10)
          v12 = v4;
        if (v10)
          v2 |= 0x1000u;
        if (v7 != v9)
        {
          v13 = *v5;
          atomic_compare_exchange_strong_explicit(v5, (unint64_t *)&v13, v9, memory_order_relaxed, memory_order_relaxed);
          if (v13 != v7)
            _pthread_mutex_corruption_abort();
        }
      }
      else
      {
        v11 = 0;
        v12 = v4;
      }
      if (((HIDWORD(v4) ^ v4) & 0xFFFFFF00) == 0 || v11)
        v2 &= ~0x1000u;
      v15 = v4;
      atomic_compare_exchange_strong_explicit(v3, &v15, v12 | (v6 << 32), memory_order_release, memory_order_relaxed);
      v16 = v15 == v4;
      v4 = v15;
    }
    while (!v16);
  }
  if ((v2 & 0x1000) != 0)
    _pthread_mutex_fairshare_unlock_drop();
  return 0;
}

uint64_t _pthread_mutex_ulock_lock_VARIANT_armv81(uint64_t a1, char a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v4, v3, memory_order_acquire, memory_order_acquire);
  if ((_DWORD)v4)
    v5 = 16;
  else
    v5 = 0;
  if ((_DWORD)v4 && (a2 & 1) == 0)
  {
    _pthread_mutex_ulock_lock_slow_VARIANT_armv81(a1, v3, v4);
    return 0;
  }
  return v5;
}

uint64_t _pthread_mutex_ulock_lock_slow_VARIANT_armv81(uint64_t result, int a2, uint64_t a3)
{
  char v5;
  char v6;
  atomic_uint *v7;
  int v8;
  uint64_t v9;
  int v10;

  v5 = 0;
  v6 = 0;
  v7 = (atomic_uint *)(result + 24);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v8 = (v5 & 1) != 0 ? -4 : a3 & 0xFFFFFFFC;
        v9 = a3;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v9, v8 | 1, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v9 == (_DWORD)a3)
          break;
        v5 = 0;
        a3 = v9;
        if (!(_DWORD)v9)
        {
LABEL_11:
          v5 = 0;
          atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&a3, v6 & 1 | a2, memory_order_acquire, memory_order_acquire);
          if (!(_DWORD)a3)
            return result;
        }
      }
      result = __ulock_wait();
      if ((result & 0x80000000) != 0)
        break;
      v6 |= (_DWORD)result != 0;
LABEL_8:
      v5 = 0;
      a3 = *v7;
      if (!(_DWORD)a3)
        goto LABEL_11;
    }
    v10 = -(int)result;
    if ((_DWORD)result == -4 || v10 == 14)
      goto LABEL_8;
    if (v10 != 105)
      break;
    v5 = 1;
    if (!(_DWORD)a3)
      goto LABEL_11;
  }
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
  qword_1F0458040 = (int)result;
  __break(1u);
  return result;
}

uint64_t _pthread_mutex_ulock_unlock_VARIANT_armv81(uint64_t a1)
{
  unsigned int v1;
  int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  v2 = atomic_exchange_explicit((atomic_uint *volatile)(a1 + 24), 0, memory_order_release);
  if (v2 != v1)
    _pthread_mutex_ulock_unlock_slow_VARIANT_mp(a1, v1, v2);
  return 0;
}

uint64_t _pthread_mutex_firstfit_unlock_slow_VARIANT_armv81(uint64_t a1)
{
  int v1;
  atomic_ullong *v2;
  atomic_ullong v3;
  atomic_ullong *v4;
  atomic_ullong v5;
  atomic_ullong v6;
  int v7;
  atomic_ullong v8;
  atomic_ullong v9;
  BOOL v10;

  v1 = *(_DWORD *)(a1 + 12);
  v2 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v3 = *v2;
  v4 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  if ((v1 & 0xC) == 0)
    goto LABEL_5;
  if (*v4 == *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
  {
    if ((v1 & 0xC) == 8)
    {
      *(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16);
      if (HIWORD(v1) != 1)
        return 0;
    }
    do
    {
LABEL_5:
      v5 = *v4;
      if (*v4)
      {
        v6 = *v4;
        atomic_compare_exchange_strong_explicit(v4, (unint64_t *)&v6, 0, memory_order_relaxed, memory_order_relaxed);
        if (v6 != v5)
          _pthread_mutex_corruption_abort();
      }
      v7 = (v3 & 0xFFFFFF00) - (HIDWORD(v3) & 0xFFFFFF00);
      v8 = v3 + 0x10000000000;
      if (v7 <= 0)
        v8 = v3;
      v9 = v3;
      atomic_compare_exchange_strong_explicit(v2, (unint64_t *)&v9, v8 & 0xFFFFFFFF00000000 | v3 & 0xFFFFFFFD, memory_order_release, memory_order_relaxed);
      v10 = v9 == v3;
      v3 = v9;
    }
    while (!v10);
    if ((((v7 > 0) << 12) & 0x1000) != 0)
      _pthread_mutex_firstfit_wake();
    return 0;
  }
  return 1;
}

uint64_t _pthread_mutex_firstfit_lock_slow_VARIANT_armv81(uint64_t a1, int a2)
{
  atomic_ullong *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  unint64_t v9;
  int v10;

  v3 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v4 = *v3;
  v5 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) != 0 && *v5 == v6)
  {
    if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
    {
      if (v7 <= 0xFFFEFFFF)
      {
        result = 0;
        v10 = v7 + 0x10000;
LABEL_26:
        *(_DWORD *)(a1 + 12) = v10;
      }
      else
      {
        return 35;
      }
    }
    else if (a2)
    {
      return 16;
    }
    else
    {
      return 11;
    }
    return result;
  }
  while (1)
  {
    if (a2 && (v4 & 2) != 0)
    {
      v9 = v4;
      atomic_compare_exchange_strong_explicit(v3, &v9, v4, memory_order_acquire, memory_order_acquire);
      if (v9 == v4)
      {
        if ((a2 & 1) != 0)
          return 16;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    if ((v4 & 2) == 0)
      break;
    v9 = v4;
    atomic_compare_exchange_strong_explicit(v3, &v9, (v4 + 256) | v4 & 0xFFFFFFFF00000000, memory_order_acquire, memory_order_acquire);
    if (v9 == v4)
    {
      if ((a2 & 1) != 0)
        return 16;
LABEL_17:
      _pthread_mutex_firstfit_lock_wait_0(a1);
      goto LABEL_19;
    }
LABEL_10:
    v4 = v9;
  }
  v9 = v4;
  atomic_compare_exchange_strong_explicit(v3, &v9, v4 | 2, memory_order_acquire, memory_order_acquire);
  if (v9 != v4)
    goto LABEL_10;
  *v5 = v6;
LABEL_19:
  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    result = 0;
    v10 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_26;
  }
  return 0;
}

uint64_t _pthread_mutex_droplock_VARIANT_armv81(uint64_t a1, unsigned int *a2, _QWORD *a3, unsigned int *a4, _DWORD *a5)
{
  int v5;
  unsigned int v6;
  atomic_ullong *v7;
  unint64_t v8;
  atomic_ullong *v9;
  int v10;
  unint64_t v11;
  atomic_ullong v12;
  unsigned int v13;
  unint64_t v14;
  BOOL v15;
  _BOOL4 v16;
  unsigned int v17;
  atomic_ullong v18;
  unint64_t v20;
  BOOL v21;
  int v22;
  atomic_ullong v23;
  int v24;
  uint64_t v25;
  atomic_ullong v26;
  unint64_t v27;
  uint64_t result;

  v5 = *(_DWORD *)(a1 + 12);
  v6 = v5 & 0xFFFFEFFF;
  v7 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = *v7;
  v9 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v10 = v5 & 0xC;
  if ((v5 & 0x1C0) != 0x40)
  {
    if ((v5 & 0xC) != 0)
    {
      if (*v9 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
        return 1;
      if (v10 == 8)
      {
        *(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16);
        if (HIWORD(v5) != 1)
          goto LABEL_49;
      }
    }
    do
    {
      v22 = v8;
      v23 = *v9;
      v24 = (v8 & 0xFFFFFF00) - (HIDWORD(v8) & 0xFFFFFF00);
      if (v24 <= 0)
        v25 = HIDWORD(v8);
      else
        v25 = (HIDWORD(v8) + 256);
      if (v23)
      {
        v26 = *v9;
        atomic_compare_exchange_strong_explicit(v9, (unint64_t *)&v26, 0, memory_order_relaxed, memory_order_relaxed);
        if (v26 != v23)
LABEL_53:
          _pthread_mutex_corruption_abort();
      }
      v27 = v8;
      atomic_compare_exchange_strong_explicit(v7, &v27, v8 & 0xFFFFFFFD | (unint64_t)(v25 << 32), memory_order_release, memory_order_relaxed);
      v21 = v27 == v8;
      v8 = v27;
    }
    while (!v21);
    if (a4)
      *a4 = v22 & 0xFFFFFFFD;
    if (a5)
      *a5 = v25;
    v6 |= (v24 > 0) << 12;
    goto LABEL_47;
  }
  if ((v5 & 0xC) == 0)
    goto LABEL_6;
  if (*v9 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    return 1;
  if (v10 != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16), HIWORD(v5) == 1))
  {
    do
    {
LABEL_6:
      v11 = HIDWORD(v8);
      v12 = *v9;
      if (((HIDWORD(v8) ^ v8) & 0xFFFFFF00) != 0)
      {
        v11 = (HIDWORD(v8) + 256);
        v13 = v11 ^ v8;
        if ((v11 ^ v8) <= 0xFF)
          v14 = 0;
        else
          v14 = -1;
        v15 = v13 >= 0x100;
        v16 = v13 < 0x100;
        v17 = v8 & 0xFFFFFFFC;
        if (v15)
          v17 = v8;
        if (v15)
          v6 |= 0x1000u;
        if (v12 != v14)
        {
          v18 = *v9;
          atomic_compare_exchange_strong_explicit(v9, (unint64_t *)&v18, v14, memory_order_relaxed, memory_order_relaxed);
          if (v18 != v12)
            goto LABEL_53;
        }
      }
      else
      {
        v16 = 0;
        v17 = v8;
      }
      if (((HIDWORD(v8) ^ v8) & 0xFFFFFF00) == 0 || v16)
        v6 &= ~0x1000u;
      v20 = v8;
      atomic_compare_exchange_strong_explicit(v7, &v20, v17 | (v11 << 32), memory_order_release, memory_order_relaxed);
      v21 = v20 == v8;
      v8 = v20;
    }
    while (!v21);
    if (a4)
      *a4 = v17;
    if (a5)
      *a5 = v11;
LABEL_47:
    if (a3)
      *a3 = a1;
  }
LABEL_49:
  result = 0;
  if (a2)
    *a2 = v6;
  return result;
}

uint64_t _pthread_mutex_lock_init_slow_VARIANT_armv81(uint64_t a1, int a2)
{
  uint64_t result;
  int v5;

  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (result = _pthread_mutex_check_init_slow_0(a1), !(_DWORD)result))
  {
    v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_lock_slow_VARIANT_armv81(a1, a2);
    }
    else if ((v5 & 0x4000) != 0)
    {
      return _pthread_mutex_ulock_lock_VARIANT_armv81(a1, a2);
    }
    else
    {
      return _pthread_mutex_firstfit_lock_slow_VARIANT_armv81(a1, a2);
    }
  }
  return result;
}

uint64_t pthread_mutex_unlock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  atomic_ullong *v2;
  atomic_ullong v3;
  atomic_ullong v4;
  BOOL v5;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_unlock_init_slow_0(a1);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_unlock_0(a1);
  if ((v1 & 0x4000) != 0)
  {
    _pthread_mutex_ulock_unlock_VARIANT_armv81(a1);
    return 0;
  }
  else
  {
    v2 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v3 = *v2;
    *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
    while (((HIDWORD(v3) ^ v3) & 0xFFFFFF00) == 0)
    {
      v4 = v3;
      atomic_compare_exchange_strong_explicit(v2, (unint64_t *)&v4, v3 & 0xFFFFFFFFFFFFFFFDLL, memory_order_release, memory_order_relaxed);
      v5 = v4 == v3;
      v3 = v4;
      if (v5)
        return 0;
    }
    return _pthread_mutex_firstfit_unlock_slow_VARIANT_armv81(a1);
  }
}

uint64_t pthread_mutex_lock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  atomic_ullong *v2;
  atomic_ullong v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v8;
  uint64_t v9;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_lock_init_slow_VARIANT_armv81(a1, 0);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_lock_0(a1, 0);
  if ((v1 & 0x4000) != 0)
  {
    v9 = 0;
    v8 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v9, v8, memory_order_acquire, memory_order_acquire);
    if ((_DWORD)v9)
      _pthread_mutex_ulock_lock_slow_VARIANT_armv81(a1, v8, v9);
    return 0;
  }
  else
  {
    v2 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v3 = *v2;
    if ((*v2 & 2) == 0)
    {
      v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
      v5 = v3;
      while ((v5 & 2) == 0)
      {
        v6 = v3 & 0xFFFFFFFF00000000 | v5;
        v3 = v6;
        atomic_compare_exchange_strong_explicit(v2, (unint64_t *)&v3, v6 | 2, memory_order_acquire, memory_order_acquire);
        v5 = v3;
        if (v3 == v6)
        {
          *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) = v4;
          return 0;
        }
      }
    }
    return _pthread_mutex_firstfit_lock_slow_VARIANT_armv81(a1, 0);
  }
}

uint64_t pthread_mutex_trylock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;
  atomic_ullong *v4;
  atomic_ullong v5;
  atomic_ullong v6;
  BOOL v7;
  uint64_t result;
  int v9;

  if (*(_QWORD *)a1 != 1297437786)
    return _pthread_mutex_lock_init_slow_VARIANT_armv81(a1, 1);
  v1 = *(_DWORD *)(a1 + 12);
  if ((v1 & 0x1C0) == 0x40)
    return _pthread_mutex_fairshare_lock_0(a1, 1);
  if ((v1 & 0x4000) != 0)
  {
    v9 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v9, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC, memory_order_acquire, memory_order_acquire);
    if (v9)
      return 16;
    else
      return 0;
  }
  else
  {
    v2 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    v4 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v5 = *v4;
    while ((v5 & 2) == 0)
    {
      v6 = v5;
      atomic_compare_exchange_strong_explicit(v4, (unint64_t *)&v6, v5 | 2, memory_order_acquire, memory_order_acquire);
      v7 = v6 == v5;
      v5 = v6;
      if (v7)
      {
        result = 0;
        *v2 = v3;
        return result;
      }
    }
    __dmb(9u);
    return 16;
  }
}

uint64_t pthread_mutex_destroy_VARIANT_armv81(uint64_t a1)
{
  int v2;
  os_unfair_lock_s *v3;
  unint64_t StatusReg;
  uint64_t v5;
  int v6;
  int v7;

  v2 = 0;
  v3 = (os_unfair_lock_s *)(a1 + 8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2)
    os_unfair_lock_lock_with_options();
  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
  {
    if (((*(_BYTE *)(a1 + 13) & 0x40) == 0 || *(_DWORD *)(a1 + 24))
      && *(_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8) | (*(_DWORD *)(((a1 + 39) & 0xFFFFFFFFFFFFFFF8) + 4) ^ *(_DWORD *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8)) & 0xFFFFFF00)
    {
      v5 = 16;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
  {
LABEL_9:
    v5 = 0;
    *(_QWORD *)a1 = 0;
    goto LABEL_11;
  }
  v5 = 22;
LABEL_11:
  v6 = *(_DWORD *)(StatusReg + 24);
  v7 = v6;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v7, 0, memory_order_release, memory_order_relaxed);
  if (v7 != v6)
    os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t pthread_rwlock_destroy_VARIANT_armv81(uint64_t a1)
{
  int v2;
  os_unfair_lock_s *v3;
  unint64_t StatusReg;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v15;
  int v16;
  int v17;

  v2 = 0;
  v3 = (os_unfair_lock_s *)(a1 + 8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2)
    os_unfair_lock_lock_with_options();
  if (*(_QWORD *)a1 == 766030772)
    goto LABEL_8;
  if (*(_QWORD *)a1 == 1381452875)
  {
    LODWORD(_X0) = *(_DWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v6 = *(unsigned int *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
    LODWORD(_X1) = *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
    v8 = *(unsigned int *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
    do
    {
      v9 = _X1 | (v8 << 32);
      _X2 = _X0 | (v6 << 32);
      _X1 = v9;
      __asm { CASP            X0, X1, X2, X3, [X8] }
      v8 = HIDWORD(v9);
      v6 = HIDWORD(_X0);
    }
    while (_X0 != _X2);
    if ((_X0 & 0xFFFFFF00) == (_DWORD)v9)
    {
LABEL_8:
      v15 = 0;
      *(_QWORD *)a1 = 0;
      goto LABEL_11;
    }
    v15 = 16;
  }
  else
  {
    v15 = 22;
  }
LABEL_11:
  v16 = *(_DWORD *)(StatusReg + 24);
  v17 = v16;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
  if (v17 != v16)
    os_unfair_lock_unlock(v3);
  return v15;
}

uint64_t pthread_rwlock_init_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;

  if (a2 && *(_QWORD *)a2 != 1381452865)
    return 22;
  if (*(_QWORD *)a1 != 1381452875)
    goto LABEL_7;
  LODWORD(_X2) = *(_DWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v3 = *(unsigned int *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
  LODWORD(_X3) = *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
  v5 = *(unsigned int *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
  do
  {
    v6 = _X3 | (v5 << 32);
    _X4 = _X2 | (v3 << 32);
    _X3 = v6;
    __asm { CASP            X2, X3, X4, X5, [X8] }
    v5 = HIDWORD(v6);
    v3 = HIDWORD(_X2);
  }
  while (_X2 != _X4);
  if ((_X2 & 0xFFFFFF00) != (_DWORD)v6)
    return 16;
LABEL_7:
  *(_DWORD *)(a1 + 8) = 0;
  v12 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(a1 + 32);
  v14 = (_QWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  if ((_QWORD *)(a1 + 24) != v12)
  {
    *(_DWORD *)(a1 + 12) |= 0x20000000u;
    *(_QWORD *)(a1 + 24) = -1;
  }
  if (v13 != v14)
  {
    *v13 = -1;
    *(_QWORD *)(a1 + 40) = -1;
  }
  *(_QWORD *)(a1 + 48) = -1;
  *(_QWORD *)(a1 + 56) = -1;
  *v12 = 0;
  *v14 = 0x1000000C0;
  *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8) = 0;
  if (a2 && *(_DWORD *)(a2 + 8) == 1)
  {
    v15 = 16;
    v16 = 0x40000000;
  }
  else
  {
    v15 = 32;
    v16 = 0x80000000;
  }
  v17 = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 12) & 0x3FFFFFFF | v16;
  *(_DWORD *)(a1 + 16) = v15;
  *(_QWORD *)(a1 + 64) = ~a1;
  *(_DWORD *)(a1 + 196) = 1381452875;
  *(_DWORD *)(a1 + 20) = 1381452875;
  *(_DWORD *)(a1 + 4) = 0;
  atomic_store(0x52574C4Bu, (unsigned int *)a1);
  return v17;
}

uint64_t _pthread_rwlock_lock_slow_VARIANT_armv81(_QWORD *a1, int a2, int a3)
{
  unint64_t v5;
  uint64_t result;
  atomic_ullong *v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unint64_t v23;
  uint64_t v25;
  unint64_t v28;
  __int128 v29;
  int v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char v39;

  v5 = (unint64_t)a1;
  if (*a1 == 1381452875 || (result = _pthread_rwlock_check_init_slow_0((uint64_t)a1), !(_DWORD)result))
  {
    v7 = (atomic_ullong *)((v5 + 47) & 0xFFFFFFFFFFFFFFF0);
    _X0 = *v7;
    v9 = v7[1];
    v10 = HIDWORD(*v7);
    v11 = HIDWORD(v9);
    do
    {
      _X0 = _X0 | ((unint64_t)v10 << 32);
      v9 = v9 | ((unint64_t)v11 << 32);
      _X21 = v9;
      __asm { CASP            X20, X21, X0, X1, [X22] }
      v10 = HIDWORD(_X20);
      v11 = HIDWORD(v9);
      _ZF = _X20 == _X0;
      LODWORD(_X0) = _X20;
    }
    while (!_ZF);
    v18 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    if ((_X20 & 2) != 0 && *(_QWORD *)((v5 + 31) & 0xFFFFFFFFFFFFFFF8) == v18)
      return 11;
    v36 = v18;
    v37 = (_QWORD *)((v5 + 31) & 0xFFFFFFFFFFFFFFF8);
    v38 = v5;
    v39 = a3;
    v19 = a3 ^ 1;
    LODWORD(v5) = _X20;
    do
    {
      v20 = (v5 >> 6) & 1;
      if (a2)
        v21 = (v5 & 5) == 0;
      else
        v21 = (v5 >> 6) & 1;
      if ((v19 | v21) == 1)
      {
        v22 = 0;
        v23 = v11;
        _X1 = _X21;
        v25 = v10;
        LODWORD(_X0) = v5;
        while ((v21 & 1) != 0)
        {
          if (!a2)
          {
            v31 = v5 | (v10 << 32);
            v35 = v5 & 0xFFFFFF00 | 0x83;
            v23 = v11;
            _X1 = _X21;
            LODWORD(v25) = v10;
LABEL_37:
            v32 = v35 + 256;
            v33 = (v25 + 256);
            goto LABEL_38;
          }
          if (_X0 - (_X1 & 0xFFFFFF00) < 0xFFFFFF00)
          {
            v31 = _X0 | (unint64_t)(v25 << 32);
            v35 = _X0 & 0xFFFFFFBF;
            v20 = 1;
            goto LABEL_37;
          }
          if (v22 == 1024)
            return 35;
          sched_yield();
          _X2 = *v7;
          v28 = v7[1];
          *((_QWORD *)&v29 + 1) = v28;
          *(_QWORD *)&v29 = *v7;
          v25 = v29 >> 32;
          v23 = HIDWORD(v28);
          do
          {
            _X2 = _X2 | ((unint64_t)v25 << 32);
            v28 = v28 | ((unint64_t)v23 << 32);
            _X1 = v28;
            __asm { CASP            X0, X1, X2, X3, [X22] }
            _ZF = _X0 == _X2;
            v25 = HIDWORD(_X0);
            v23 = HIDWORD(v28);
            LODWORD(_X2) = _X0;
          }
          while (!_ZF);
          ++v22;
          LOBYTE(v21) = (_X0 & 5) == 0;
          if ((_X0 & 5) != 0)
            v30 = v19;
          else
            v30 = 1;
          if (v30 != 1)
            goto LABEL_28;
        }
        v34 = _X0 | 5;
        if (a2)
          v34 = _X0 & 0xFFFFFFBF;
        v32 = v34 + 256;
        v20 = 0;
        if ((v25 & 1) != 0)
          v33 = v25 & 0xFE | _X0 & 0xFFFFFF00;
        else
          v33 = v25;
        v31 = _X0 | (unint64_t)(v25 << 32);
      }
      else
      {
        v25 = v10;
        LODWORD(_X0) = v5;
        v23 = v11;
        _X1 = _X21;
LABEL_28:
        v20 = 0;
        v31 = _X0 | (unint64_t)(v25 << 32);
        v32 = _X0;
        v33 = v25;
      }
LABEL_38:
      v5 = v31;
      atomic_compare_exchange_strong_explicit(v7, &v5, v32 | (unint64_t)(v33 << 32), memory_order_acquire, memory_order_acquire);
      v10 = HIDWORD(v5);
      _X21 = _X1;
      v11 = v23;
    }
    while (v5 != v31);
    if (v20)
    {
      if ((a2 & 1) == 0)
      {
        result = 0;
        *v37 = v36;
        return result;
      }
    }
    else
    {
      if ((v39 & 1) != 0)
        return 16;
      _pthread_rwlock_lock_wait_0(v38, a2);
    }
    return 0;
  }
  return result;
}

uint64_t pthread_rwlock_rdlock_VARIANT_armv81(_QWORD *a1)
{
  atomic_ullong *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;

  if (*a1 == 1381452875)
  {
    v1 = (atomic_ullong *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      v5 = DWORD2(v4) & 0xFFFFFF00;
      while ((v2 & 5) == 0 && v2 - v5 <= 0xFFFFFEFF)
      {
        v6 = v2 | (unint64_t)(v3 << 32);
        v7 = (((v2 & 0xFFFFFFBF) + 256) | ((unint64_t)v3 << 32)) + 0x10000000000;
        v2 = v6;
        atomic_compare_exchange_strong_explicit(v1, &v2, v7, memory_order_acquire, memory_order_acquire);
        v3 = HIDWORD(v2);
        if (v2 == v6)
          return 0;
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 1, 0);
}

uint64_t pthread_rwlock_tryrdlock_VARIANT_armv81(_QWORD *a1)
{
  atomic_ullong *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;

  if (*a1 == 1381452875)
  {
    v1 = (atomic_ullong *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      v5 = DWORD2(v4) & 0xFFFFFF00;
      while (1)
      {
        v6 = v2 | ((unint64_t)v3 << 32);
        if ((v2 & 5) != 0)
        {
          v2 = v2 | ((unint64_t)v3 << 32);
          atomic_compare_exchange_strong_explicit(v1, &v2, v6, memory_order_acquire, memory_order_acquire);
          if (v2 == v6)
            return 16;
        }
        else
        {
          if (v2 - v5 > 0xFFFFFEFF)
            return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 1, 1);
          v7 = ((v3 << 32) + 0x10000000000) | ((v2 & 0xFFFFFFBF) + 256);
          v2 = v6;
          atomic_compare_exchange_strong_explicit(v1, &v2, v7, memory_order_acquire, memory_order_acquire);
          if (v2 == v6)
            return 0;
        }
        v3 = HIDWORD(v2);
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 1, 1);
}

uint64_t pthread_rwlock_wrlock_VARIANT_armv81(_QWORD *a1)
{
  atomic_ullong *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unint64_t v5;
  unint64_t v6;

  if (*a1 == 1381452875)
  {
    v1 = (atomic_ullong *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      *(_QWORD *)&v4 = *v1;
      v3 = v4 >> 32;
      while ((v2 & 0x40) != 0)
      {
        v5 = v2 | (unint64_t)(v3 << 32);
        v6 = (((v2 & 0xFFFFFF00) + 387) | ((unint64_t)v3 << 32)) + 0x10000000000;
        v2 = v5;
        atomic_compare_exchange_strong_explicit(v1, &v2, v6, memory_order_acquire, memory_order_acquire);
        v3 = HIDWORD(v2);
        if (v2 == v5)
        {
          *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                                      - 8);
          return 0;
        }
      }
    }
  }
  return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 0, 0);
}

uint64_t pthread_rwlock_trywrlock_VARIANT_armv81(_QWORD *a1)
{
  atomic_ullong *v1;
  unint64_t v2;
  uint64_t v3;
  __int128 v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*a1 != 1381452875)
    return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 0, 1);
  v1 = (atomic_ullong *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v2 = *v1;
  if ((*v1 & 2) != 0)
    return _pthread_rwlock_lock_slow_VARIANT_armv81(a1, 0, 1);
  *((_QWORD *)&v4 + 1) = *(_QWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
  *(_QWORD *)&v4 = *v1;
  v3 = v4 >> 32;
  do
  {
    v5 = v2;
    v6 = v3 << 32;
    v7 = v5 | ((unint64_t)v3 << 32);
    LODWORD(v8) = (v5 & 0xFFFFFF00) + 387;
    if ((v5 & 0x40) != 0)
      v8 = v8;
    else
      v8 = v5;
    v9 = (v3 << 32) + 0x10000000000;
    if ((v5 & 0x40) == 0)
      v9 = v6;
    v2 = v7;
    atomic_compare_exchange_strong_explicit(v1, &v2, v9 | v8, memory_order_acquire, memory_order_acquire);
    v3 = HIDWORD(v2);
  }
  while (v2 != v7);
  if ((v5 & 0x40) == 0)
    return 16;
  v10 = 0;
  *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              - 8);
  return v10;
}

uint64_t _pthread_rwlock_unlock_slow_VARIANT_armv81(_QWORD *a1, int a2)
{
  uint64_t result;
  atomic_ullong *v5;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  _BOOL4 v13;
  unsigned int v14;
  unint64_t v15;

  if (*a1 == 1381452875 || (result = _pthread_rwlock_check_init_slow_0((uint64_t)a1), !(_DWORD)result))
  {
    v5 = (atomic_ullong *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
    LODWORD(_X6) = *(_DWORD *)v5;
    if ((*(_DWORD *)v5 & 0x40) == 0)
    {
      v8 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
      LODWORD(_X7) = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
      v9 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
      if ((_X6 & 2) != 0)
        *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
      v10 = 3;
      do
      {
        v11 = v9;
        v10 &= ~a2;
        v12 = _X7 + 256;
        if ((v10 & 2) == 0)
          v12 = _X7;
        if (v12 == (_X6 & 0xFFFFFF00))
        {
          v13 = 0;
          v14 = v12 | 0xC0;
          v15 = v12 | 1u;
        }
        else if ((_X6 & 7) != 0)
        {
          v14 = _X6 & 0xFFFFFF00 | 1;
          LODWORD(v15) = _X6 & 4 | v8 | 2;
          if (v12 == (v8 & 0xFFFFFF00))
          {
            v15 = v15;
          }
          else
          {
            v14 = _X6;
            v15 = v8;
          }
          v13 = v12 == (v8 & 0xFFFFFF00);
        }
        else
        {
          v13 = 0;
          v14 = _X6;
          v15 = v8;
        }
        result = _X6 | (v8 << 32);
        if (v10 == 1)
        {
          _X6 = _X6 | (v8 << 32);
          atomic_compare_exchange_strong_explicit(v5, &_X6, v14 | (v15 << 32), memory_order_release, memory_order_relaxed);
          a2 = _X6 == result;
          v9 = v11;
        }
        else
        {
          if (v10 != 3)
          {
            __break(1u);
            return result;
          }
          _X2 = v14 | (v15 << 32);
          _X7 = _X7 | ((unint64_t)v11 << 32);
          __asm { CASPL           X6, X7, X2, X3, [X8] }
          _ZF = _X6 == result;
          v9 = HIDWORD(_X7);
          if (_ZF)
            a2 = 3;
          else
            a2 = 0;
        }
        v8 = HIDWORD(_X6);
      }
      while (v10 != a2);
      if (v13)
        _pthread_rwlock_unlock_drop();
    }
    return 0;
  }
  return result;
}

uint64_t pthread_rwlock_unlock_VARIANT_armv81(_QWORD *a1)
{
  unint64_t v3;
  unint64_t v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  if (*a1 != 1381452875)
    return _pthread_rwlock_unlock_slow_VARIANT_armv81(a1, 0);
  LODWORD(_X2) = *(_DWORD *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  if ((_X2 & 0x40) == 0)
  {
    v3 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 4);
    LODWORD(_X3) = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 8);
    LODWORD(v4) = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0) + 0xC);
    if ((_X2 & 2) != 0)
      *(_QWORD *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8) = 0;
    do
    {
      v5 = _X3 + 256;
      if ((_DWORD)_X3 + 256 == (_X2 & 0xFFFFFF00))
      {
        v6 = v5 | 0xC0;
        v7 = v5 | 1u;
      }
      else
      {
        v6 = _X2;
        v7 = v3;
        if ((_X2 & 7) != 0)
        {
          v6 = _X2;
          v7 = v3;
          if (v5 == (v3 & 0xFFFFFF00))
            return _pthread_rwlock_unlock_slow_VARIANT_armv81(a1, 0);
        }
      }
      v8 = _X2 | (v3 << 32);
      _X6 = v6 | (v7 << 32);
      _X3 = _X3 | ((unint64_t)v4 << 32);
      __asm { CASPL           X2, X3, X6, X7, [X8] }
      v4 = HIDWORD(_X3);
      v3 = HIDWORD(_X2);
    }
    while (_X2 != v8);
  }
  return 0;
}

unint64_t (*_pthread_atomic_xchg_ptr())(unint64_t *a1, unint64_t a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unint64_t (*)(unint64_t *, unint64_t))_pthread_atomic_xchg_ptr_VARIANT_armv81;
  else
    return _pthread_atomic_xchg_ptr_VARIANT_mp;
}

int pthread_cancel(pthread_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_cancel_VARIANT_armv81;
  else
    return (int)pthread_cancel_VARIANT_mp;
}

int pthread_setcancelstate(int a1, int *a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)pthread_setcancelstate_VARIANT_armv81;
  else
    return (int)pthread_setcancelstate_VARIANT_mp;
}

int pthread_attr_getdetachstate(const pthread_attr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  *a2 = a1->__opaque[32];
  return result;
}

int pthread_attr_getinheritsched(const pthread_attr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  *a2 = a1->__opaque[33];
  return result;
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1414022209)
  {
    result = 0;
    a1->__opaque[33] = a2;
  }
  return result;
}

int pthread_attr_getscope(const pthread_attr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  *a2 = 1;
  return result;
}

int pthread_attr_getstackaddr(const pthread_attr_t *a1, void **a2)
{
  int result;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  *a2 = *(void **)&a1->__opaque[8];
  return result;
}

int pthread_attr_setstackaddr(pthread_attr_t *a1, void *a2)
{
  int result;

  if (a1->__sig != 1414022209 || (*MEMORY[0x1E0C88810] & (unint64_t)a2) != 0)
    return 22;
  result = 0;
  *(_QWORD *)&a1->__opaque[32] &= ~0x10000000uLL;
  *(_QWORD *)a1->__opaque = 0;
  *(_QWORD *)&a1->__opaque[8] = a2;
  return result;
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  int result;
  size_t v4;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  v4 = *(_QWORD *)&a1->__opaque[16];
  if (!v4)
    v4 = 0x80000;
  *a2 = v4;
  return result;
}

int pthread_attr_getstack(const pthread_attr_t *a1, void **a2, size_t *a3)
{
  int result;
  size_t v5;
  uint64_t v6;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  v6 = *(_QWORD *)&a1->__opaque[8];
  v5 = *(_QWORD *)&a1->__opaque[16];
  *a2 = (void *)(v6 - v5);
  if (!v5)
    v5 = 0x80000;
  *a3 = v5;
  return result;
}

int pthread_attr_getguardsize(const pthread_attr_t *a1, size_t *a2)
{
  int result;
  uint64_t v4;
  char *opaque;

  if (a1->__sig != 1414022209)
    return 22;
  result = 0;
  v4 = *(_QWORD *)&a1->__opaque[32];
  opaque = a1->__opaque;
  if ((v4 & 0x10000000) != 0)
    opaque = (char *)MEMORY[0x1E0C88820];
  *a2 = *(_QWORD *)opaque;
  return result;
}

uint64_t pthread_attr_setcpupercent_np(_QWORD *a1, int a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = 22;
  if (a3 <= 0x1FFFFFE && a2 <= 254 && *a1 == 1414022209)
  {
    v5 = a1[5];
    if ((v5 & 0x4000000) != 0 && (BYTE2(v5) == 4 || BYTE2(v5) == 2))
    {
      result = 0;
      a1[5] = a1[5] | ((unint64_t)a2 << 32) | (a3 << 40) | 0x8000000;
    }
  }
  return result;
}

uint64_t pthread_attr_setworkinterval_np(uint64_t a1, mach_port_name_t a2)
{
  uint64_t result;

  result = 22;
  if (a2 - 1 <= 0xFFFFFFFD && *(_QWORD *)a1 == 1414022209)
  {
    result = mach_port_mod_refs(*MEMORY[0x1E0C883F0], a2, 0, 1);
    if (!(_DWORD)result)
      *(_DWORD *)(a1 + 48) = a2;
  }
  return result;
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  _opaque_pthread_t *v2;

  os_unfair_lock_lock_with_options();
  v2 = (_opaque_pthread_t *)__pthread_head;
  if (__pthread_head)
  {
    do
    {
      if (*(_DWORD *)&v2->__opaque[232] == a1)
        break;
      v2 = *(_opaque_pthread_t **)v2->__opaque;
    }
    while (v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v2;
}

uint64_t _pthread_threadid_slow(uint64_t a1, _QWORD *a2)
{
  thread_inspect_t v4;
  kern_return_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;
  _QWORD v9[3];
  mach_msg_type_number_t thread_info_outCnt;

  thread_info_outCnt = 6;
  v4 = *(_DWORD *)(a1 + 248);
  memset(v9, 0, sizeof(v9));
  v5 = thread_info(v4, 4u, (thread_info_t)v9, &thread_info_outCnt);
  v6 = v9[0];
  if (v5)
    v7 = 1;
  else
    v7 = v9[0] == 0;
  if (v7)
    return 22;
  result = 0;
  *a2 = v9[0];
  *(_QWORD *)(a1 + 216) = v6;
  return result;
}

int pthread_cpu_number_np(size_t *cpu_number_out)
{
  int result;

  if (cpu_number_out)
  {
    result = 0;
    *cpu_number_out = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    result = 22;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
  }
  return result;
}

int pthread_jit_write_protect_supported_np(void)
{
  return MEMORY[0xFFFFFC10C] != 0;
}

int pthread_jit_write_with_callback_np(pthread_jit_write_callback_t callback, void *ctx)
{
  uint64_t v2;
  unint64_t StatusReg;
  int result;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  if (!MEMORY[0xFFFFFC10C])
    return ((uint64_t (*)(void *))callback)(ctx);
  if (MEMORY[0xFFFFFC10C] - 2 >= 2)
  {
    if (MEMORY[0xFFFFFC10C] != 1)
      goto LABEL_30;
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC110]);
    __isb(0xFu);
    v2 = MEMORY[0xFFFFFC110];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
  }
  else
  {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC110]);
    __isb(0xFu);
    v2 = MEMORY[0xFFFFFC110];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
  }
  if (v2 != StatusReg)
    goto LABEL_30;
  if (_pthread_jit_config[0])
  {
    if (!byte_1F045C002)
      goto LABEL_31;
    if (dword_1F045C004)
    {
      v5 = 0;
      while (*(pthread_jit_write_callback_t *)&_pthread_jit_config[8 * v5 + 8] != callback)
      {
        if (dword_1F045C004 == ++v5)
          goto LABEL_14;
      }
    }
    else
    {
      LODWORD(v5) = 0;
    }
    if ((_DWORD)v5 == dword_1F045C004)
    {
LABEL_14:
      if (MEMORY[0xFFFFFC10C])
      {
        v6 = MEMORY[0xFFFFFC10C];
        __dmb(0xAu);
        if ((v6 - 2) >= 2)
        {
          if (v6 != 1)
            goto LABEL_30;
          _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC118]);
          __isb(0xFu);
          v7 = MEMORY[0xFFFFFC118];
          v8 = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
        }
        else
        {
          _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC118]);
          __isb(0xFu);
          v7 = MEMORY[0xFFFFFC118];
          v8 = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
        }
        if (v7 == v8)
          pthread_jit_write_with_callback_np_cold_2((uint64_t)callback);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  result = ((uint64_t (*)(void *))callback)(ctx);
  if (!MEMORY[0xFFFFFC10C])
    goto LABEL_30;
  v9 = MEMORY[0xFFFFFC10C];
  __dmb(0xAu);
  if ((v9 - 2) < 2)
  {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC118]);
    __isb(0xFu);
    v10 = MEMORY[0xFFFFFC118];
    v11 = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
    goto LABEL_24;
  }
  if (v9 != 1)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    pthread_jit_write_with_callback_np_cold_1();
  }
  _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC118]);
  __isb(0xFu);
  v10 = MEMORY[0xFFFFFC118];
  v11 = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
LABEL_24:
  if (v10 != v11)
    goto LABEL_30;
  return result;
}

void pthread_jit_write_freeze_callbacks_np(void)
{
  if (MEMORY[0xFFFFFC10C])
  {
    if (!byte_1F045C001)
      pthread_jit_write_freeze_callbacks_np_cold_1();
    os_unfair_lock_lock_with_options();
    if (byte_1F045C002)
      pthread_jit_write_freeze_callbacks_np_cold_2();
    byte_1F045C002 = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_jit_config_lock);
    _pthread_jit_write_protect_freeze_config();
  }
}

int pthread_create_from_mach_thread(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 1);
}

int pthread_create_suspended_np(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 2);
}

uint64_t pthread_create_with_workgroup_np()
{
  if (!_pthread_workgroup_functions)
    pthread_create_with_workgroup_np_cold_1();
  return (*(uint64_t (**)(void))(_pthread_workgroup_functions + 8))();
}

uint64_t __pthread_workqueue_setkill()
{
  return __bsdthread_ctl();
}

int sched_get_priority_min(int a1)
{
  return default_priority - 16;
}

uint64_t _pthread_set_self(uint64_t a1)
{
  uint64_t result;

  result = __thread_selfid();
  *(_QWORD *)(a1 + 216) = result;
  if (result != -1)
    return _thread_set_tsd_base();
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
  __break(1u);
  return result;
}

int pthread_getconcurrency(void)
{
  return pthread_concurrency;
}

int pthread_setconcurrency(int a1)
{
  int result;

  if (a1 < 0)
    return 22;
  result = 0;
  pthread_concurrency = a1;
  return result;
}

uint64_t _pthread_main_thread_postfork_init(uint64_t a1)
{
  uint64_t result;

  _pthread_main_thread_init(a1, 0);
  result = __thread_selfid();
  *(_QWORD *)(a1 + 216) = result;
  if (result == -1)
    _pthread_main_thread_postfork_init_cold_1();
  return result;
}

uint64_t pthread_current_stack_contains_np(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  BOOL v5;
  _BOOL4 v7;

  v4 = (unint64_t *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 48);
  v3 = *v4;
  v2 = v4[1];
  if (v2 == *v4)
    return 4294967251;
  v5 = __CFADD__(a1, a2);
  v7 = v2 <= a1 && a1 + a2 <= v3;
  if (v5)
    return 4294967274;
  else
    return v7;
}

uint64_t _pthread_wqthread_legacy_worker_wrap(unint64_t a1)
{
  BOOL v1;
  unsigned int v2;
  unsigned int v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, unint64_t, _QWORD);

  v1 = (a1 & 0x22000000) != 0 || (a1 & 0x3F00) == 0;
  v2 = (a1 >> 8) & 0x3F;
  if (!v1 && v2 != 0)
  {
    v4 = __clz(__rbit32(v2)) - 1;
    v5 = 0;
    v6 = (uint64_t (*)(uint64_t, unint64_t, _QWORD))__libdispatch_workerfunction;
    switch(v4)
    {
      case 0u:
        v5 = 3;
        return v6(v5, (a1 >> 31) & 1, 0);
      case 1u:
        v5 = 2;
        return v6(v5, (a1 >> 31) & 1, 0);
      case 2u:
        *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 4351;
        v5 = 1;
        return v6(v5, (a1 >> 31) & 1, 0);
      case 3u:
        return v6(v5, (a1 >> 31) & 1, 0);
      default:
        break;
    }
  }
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Invalid pthread priority for the legacy interface";
  qword_1F0458040 = a1;
  __break(1u);
  JUMPOUT(0x1DEE437B4);
}

uint64_t pthread_workqueue_setdispatchoffset_np()
{
  return __workq_kernreturn();
}

uint64_t _pthread_workqueue_init_with_workloop(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD v5[6];

  v5[0] = 0x200000000;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a1;
  v5[4] = a4;
  v5[5] = 0;
  return pthread_workqueue_setup((uint64_t)v5, 0x30uLL);
}

uint64_t _pthread_workqueue_init_with_kevent(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v4[6];

  v4[0] = 0x200000000;
  v4[1] = a2;
  v4[2] = 0;
  v4[3] = a1;
  v4[4] = a3;
  v4[5] = 0;
  return pthread_workqueue_setup((uint64_t)v4, 0x30uLL);
}

uint64_t _pthread_workqueue_init(uint64_t a1, int a2)
{
  _QWORD v3[6];

  v3[0] = 0x200000000;
  v3[1] = 0;
  v3[2] = 0;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = 0;
  return pthread_workqueue_setup((uint64_t)v3, 0x30uLL);
}

uint64_t pthread_workqueue_setdispatch_np(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = 0u;
  v3 = 0;
  v5 = 0u;
  DWORD1(v2) = 2;
  v4 = a1;
  return pthread_workqueue_setup((uint64_t)&v2, 0x30uLL);
}

uint64_t pthread_workqueue_addthreads_np(__int16 a1, int a2)
{
  uint64_t result;

  if (!__libdispatch_workerfunction)
    return 1;
  _pthread_qos_class_encode_workqueue(a1 & 0xFFF, a2 << 31);
  result = __workq_kernreturn();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

BOOL _pthread_workqueue_should_narrow()
{
  return __workq_kernreturn() - 1 < 0xFFFFFFFE;
}

uint64_t _pthread_workqueue_allow_send_signals()
{
  return __bsdthread_ctl();
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return (pthread_introspection_hook_t)j___pthread_atomic_xchg_ptr((uint64_t)&_pthread_introspection_hook, (uint64_t)hook, v1, v2, v3, v4, v5, v6);
}

uint64_t _pthread_introspection_hook_callout_thread_create(uint64_t a1)
{
  unint64_t v1;
  unint64_t StatusReg;
  __int16 v3;
  uint64_t result;

  v1 = ~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 1;
  result = _pthread_introspection_hook(1, a1, a1, v1);
  *(_WORD *)(StatusReg - 174) = v3;
  return result;
}

char *_pthread_current_stack_address()
{
  char v1;

  return &v1;
}

uint64_t _pthread_introspection_hook_callout_thread_terminate(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t StatusReg;
  __int16 v5;
  uint64_t result;

  if ((_QWORD *)_main_thread_ptr == a1)
  {
    v3 = a1[26];
    v2 = a1[22] - a1[23] + v3;
    v1 = a1[23] - v3;
  }
  else
  {
    v1 = a1[24];
    v2 = a1[25] - (~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320));
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 3;
  result = _pthread_introspection_hook(3, a1, v1, v2);
  *(_WORD *)(StatusReg - 174) = v5;
  return result;
}

void _pthread_jit_write_protect_bulk_image_load_callback(int a1, uint64_t a2)
{
  BOOL v4;
  uint64_t v5;
  const mach_header_64 *v6;
  uint8_t *v7;
  BOOL v8;
  BOOL v9;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t size;

  if (byte_1F045C001)
    os_unfair_lock_lock_with_options();
  if (byte_1F045C002)
    v4 = 1;
  else
    v4 = a1 == 0;
  if (!v4)
  {
    v5 = 0;
    do
    {
      v6 = *(const mach_header_64 **)(a2 + 8 * v5);
      if ((v6->flags & 0x80000000) == 0)
      {
        size = 0;
        v7 = getsectiondata(v6, "__DATA_CONST", "__pth_jit_func", &size);
        v8 = !v7 || size == 0;
        v9 = !v8 && (size & 7) == 0;
        if (v9 && size >= 8)
        {
          v11 = dword_1F045C004;
          v12 = size >> 3;
          LODWORD(v13) = 2047 - dword_1F045C004;
          if (dword_1F045C004 <= 0x7FF)
            v13 = v13;
          else
            v13 = 0;
          do
          {
            if (!*(_QWORD *)v7)
              break;
            if (!v13)
              _pthread_jit_write_protect_bulk_image_load_callback_cold_1(v11);
            *(_QWORD *)&_pthread_jit_config[8 * v11++ + 8] = *(_QWORD *)v7;
            dword_1F045C004 = v11;
            --v13;
            v7 += 8;
            --v12;
          }
          while (v12);
        }
      }
      ++v5;
    }
    while (v5 != a1);
  }
  if (byte_1F045C001)
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_jit_config_lock);
}

uint64_t _pthread_introspection_hook_callout_thread_start(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t StatusReg;
  __int16 v5;
  uint64_t result;

  if ((_QWORD *)_main_thread_ptr == a1)
  {
    v3 = a1[26];
    v2 = a1[22] - a1[23] + v3;
    v1 = a1[23] - v3;
  }
  else
  {
    v1 = a1[24];
    v2 = a1[25] - (~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320));
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 2;
  result = _pthread_introspection_hook(2, a1, v1, v2);
  *(_WORD *)(StatusReg - 174) = v5;
  return result;
}

uint64_t _pthread_introspection_hook_callout_thread_destroy(uint64_t a1)
{
  unint64_t v1;
  unint64_t StatusReg;
  __int16 v3;
  uint64_t result;

  v1 = ~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 4320);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 4;
  result = _pthread_introspection_hook(4, a1, a1, v1);
  *(_WORD *)(StatusReg - 174) = v3;
  return result;
}

uint64_t pthread_join_NOCANCEL(uint64_t a1, uint64_t *a2)
{
  return _pthread_join(a1, a2, 1);
}

uint64_t pthread_cond_wait_NOCANCEL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return j___pthread_cond_wait(a1, a2, 0, 0, 1, a6, a7, a8);
}

uint64_t pthread_cond_timedwait_NOCANCEL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return j___pthread_cond_wait(a1, a2, a3, 0, 1, a6, a7, a8);
}

uint64_t sigwait_NOCANCEL()
{
  unsigned int v1;

  if (__sigwait() != -1)
    return 0;
  v1 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (v1 == 4)
    return 0;
  else
    return v1;
}

uint64_t _pthread_joiner_abort_wait(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  os_unfair_lock_lock_with_options();
  if (*(_BYTE *)(a2 + 24) || *(_DWORD *)(a1 + 52) == -1)
  {
    v4 = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    v4 = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v4;
}

int pthread_condattr_init(pthread_condattr_t *a1)
{
  a1->__sig = 1129202753;
  *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | 2;
  return 0;
}

int pthread_condattr_destroy(pthread_condattr_t *a1)
{
  a1->__sig = 0;
  return 0;
}

int pthread_condattr_getpshared(const pthread_condattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1129202753)
    return 22;
  result = 0;
  *a2 = *(_DWORD *)a1->__opaque & 3;
  return result;
}

int pthread_condattr_setpshared(pthread_condattr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1129202753)
  {
    result = 0;
    *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | a2;
  }
  return result;
}

int pthread_mutex_getprioceiling(const pthread_mutex_t *a1, int *a2)
{
  char *opaque;

  if ((a1->__sig & 0xFFFFFFFDLL) != 0x4D555458)
    return 22;
  opaque = a1->__opaque;
  os_unfair_lock_lock_with_options();
  *a2 = *(__int16 *)&a1->__opaque[8];
  os_unfair_lock_unlock((os_unfair_lock_t)opaque);
  return 0;
}

int pthread_mutex_setprioceiling(pthread_mutex_t *a1, int a2, int *a3)
{
  char *opaque;
  int v7;

  if ((a1->__sig & 0xFFFFFFFDLL) != 0x4D555458)
    return 22;
  opaque = a1->__opaque;
  os_unfair_lock_lock_with_options();
  if ((a2 + 999) > 0x7CE)
  {
    v7 = 22;
  }
  else
  {
    v7 = 0;
    *a3 = *(__int16 *)&a1->__opaque[8];
    *(_WORD *)&a1->__opaque[8] = a2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)opaque);
  return v7;
}

int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1297373249)
    return 22;
  result = 0;
  *a2 = *(_DWORD *)a1->__opaque;
  return result;
}

int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1297373249)
    return 22;
  result = 0;
  *a2 = *(_DWORD *)&a1->__opaque[4] & 3;
  return result;
}

int pthread_mutexattr_getpolicy_np(const pthread_mutexattr_t *a1, int *a2)
{
  int v2;
  int result;

  if (a1->__sig == 1297373249)
  {
    v2 = (*(_DWORD *)&a1->__opaque[4] >> 6) & 7;
    if (v2 == 1)
    {
LABEL_5:
      result = 0;
      *a2 = v2;
      return result;
    }
    if (v2 == 2)
    {
      v2 = 3;
      goto LABEL_5;
    }
  }
  return 22;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1297373249)
    return 22;
  result = 0;
  *a2 = (*(_DWORD *)&a1->__opaque[4] >> 2) & 3;
  return result;
}

int pthread_mutexattr_getpshared(const pthread_mutexattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1297373249)
    return 22;
  result = 0;
  *a2 = (*(_DWORD *)&a1->__opaque[4] >> 4) & 3;
  return result;
}

int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 + 999) <= 0x7CE && a1->__sig == 1297373249)
  {
    result = 0;
    *(_DWORD *)a1->__opaque = a2;
  }
  return result;
}

int pthread_mutexattr_setprotocol(pthread_mutexattr_t *a1, int a2)
{
  int result;

  result = 22;
  if (a2 <= 2 && a1->__sig == 1297373249)
  {
    result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFFC | a2;
  }
  return result;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1297373249)
  {
    result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | (16 * (a2 & 3));
  }
  return result;
}

uint64_t pthread_set_qos_class_np(_QWORD *a1, qos_class_t __qos_class, int __relative_priority)
{
  if ((_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) != a1)
    return 1;
  if ((_QWORD *)(_pthread_ptr_munge_token ^ *a1) != a1)
    pthread_cancel_VARIANT_mp_cold_1();
  return pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

uint64_t _pthread_qos_class_decode(unsigned int a1, int *a2, _QWORD *a3)
{
  _BOOL4 v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;

  v3 = (a1 & 0x3F00) != 0 && (a1 & 0x22000000) == 0;
  if (v3)
  {
    v4 = (a1 >> 8) & 0x3F;
    if (v4)
    {
      v5 = __clz(__rbit32(v4));
      if (v5 > 5)
      {
        v6 = 0;
        if (a2)
          goto LABEL_10;
        goto LABEL_14;
      }
      v4 = v5 + 1;
    }
  }
  else
  {
    v4 = 0;
  }
  v6 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v4];
  if (a2)
  {
LABEL_10:
    if (v3)
      v7 = (char)a1 + 1;
    else
      v7 = 0;
    *a2 = v7;
  }
LABEL_14:
  if (a3)
    *a3 = a1 & 0xFF000000;
  return v6;
}

uint64_t _pthread_qos_class_and_override_encode(int a1, char a2, int a3, int a4)
{
  unint64_t v4;
  unint64_t v5;
  char v6;
  int v7;
  unint64_t v8;
  int v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  HIDWORD(v4) = a1 - 5;
  LODWORD(v4) = a1 - 5;
  v5 = 0x600050403000201uLL >> (8 * (v4 >> 2));
  if ((v4 >> 2) >= 8)
    v6 = 0;
  else
    v6 = v5;
  HIDWORD(v8) = a4 - 5;
  LODWORD(v8) = a4 - 5;
  v7 = v8 >> 2;
  v9 = 0;
  v10 = 6;
  switch(v7)
  {
    case 0:
      v9 = 0;
      v10 = 1;
      break;
    case 1:
      v9 = 0;
      v10 = 2;
      break;
    case 3:
    case 4:
    case 5:
      v9 = 0;
      v10 = v7;
      break;
    case 7:
      break;
    default:
      v10 = 0;
      v9 = 1;
      break;
  }
  v11 = (v6 - 1);
  v12 = (a2 - 1) | a3 & 0xFF000000 | (128 << v6);
  if (v11 > 5)
    v12 = a3 & 0xFF000000;
  v13 = (0x2000 << v10) | v12 | 0x800000;
  if (v9)
    return v12;
  else
    return v13;
}

uint64_t _pthread_qos_class_and_override_decode(unsigned int a1, int *a2, _QWORD *a3, _DWORD *a4)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  if (a4)
  {
    if ((a1 & 0x22800000) != 0x800000 || (*(_QWORD *)&a1 & 0x3FC000) == 0)
    {
      v5 = 0;
    }
    else
    {
      v5 = (a1 >> 14);
      if ((a1 >> 14))
      {
        v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          v7 = 0;
          goto LABEL_12;
        }
        v5 = v6 + 1;
      }
    }
    v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_12:
    *a4 = v7;
  }
  if (a3)
    *a3 = a1 & 0xFF000000;
  if (a2)
  {
    v8 = a1 & 0x3F00;
    if ((a1 & 0x3F00) != 0 && (a1 & 0x22000000) == 0)
      v10 = (char)a1 + 1;
    else
      v10 = 0;
    *a2 = v10;
  }
  else
  {
    v8 = a1 & 0x3F00;
  }
  v11 = 0;
  if ((a1 & 0x22000000) != 0 || !v8)
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  v12 = (a1 >> 8) & 0x3F;
  if (!v12)
  {
    v11 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  }
  v13 = __clz(__rbit32(v12));
  if (v13 <= 5)
  {
    v11 = v13 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  }
  return 0;
}

uint64_t _pthread_sched_pri_encode(int a1, int a2)
{
  return a2 & 0xFF000000 | a1 | 0x20000000;
}

uint64_t _pthread_sched_pri_decode(uint64_t result, _QWORD *a2)
{
  if (a2)
    *a2 = result & 0xDF000000;
  if ((result & 0x20000000) != 0)
    return (unsigned __int16)result;
  else
    return 0;
}

uint64_t _pthread_qos_class_encode_workqueue(int a1, int a2)
{
  char v2;

  v2 = 6;
  switch(a1)
  {
    case 0:
      return (128 << v2) | a2 & 0xFF000000 | 0xFF;
    case 1:
      v2 = 4;
      break;
    case 2:
      goto LABEL_4;
    case 3:
      v2 = 2;
      break;
    default:
      if (a1 != 128)
        _pthread_qos_class_encode_workqueue_cold_1(a1);
LABEL_4:
      v2 = 3;
      break;
  }
  return (128 << v2) | a2 & 0xFF000000 | 0xFF;
}

uint64_t pthread_prefer_alternate_cluster_self()
{
  return _pthread_set_properties_self(32, 0);
}

uint64_t _pthread_override_qos_class_start_direct()
{
  unint64_t StatusReg;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(StatusReg + 8);
  return result;
}

uint64_t _pthread_override_qos_class_end_direct()
{
  unint64_t StatusReg;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(StatusReg + 8);
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_add()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_self()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_all_self()
{
  uint64_t result;

  result = __bsdthread_ctl();
  if ((_DWORD)result == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return result;
}

uint64_t pthread_time_constraint_max_parallelism(char a1)
{
  uint64_t v2;
  _WORD *v3;
  char v4;
  uint64_t result;
  int v6;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) != -1)
  {
    v2 = _os_alloc_once();
    if ((a1 & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v3 = (_WORD *)(v2 + 286);
    v4 = 2;
    goto LABEL_8;
  }
  v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  if ((a1 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a1 & 2) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return 0xFFFFFFFFLL;
  }
  v3 = (_WORD *)(v2 + 272);
  v4 = 3;
LABEL_8:
  result = (unsigned __int16)*v3;
  if ((_DWORD)result == 0xFFFF)
  {
    LODWORD(result) = __bsdthread_ctl();
    if ((_DWORD)result == -1)
    {
      v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      if (v6 != 22 && v6 != 45)
        pthread_qos_max_parallelism_cold_1(v6);
      if ((v4 & 1) != 0)
        result = MEMORY[0xFFFFFC036];
      else
        result = MEMORY[0xFFFFFC035];
    }
    else
    {
      result = (unsigned __int16)result;
    }
    *v3 = result;
  }
  return result;
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  if (__qos_class == 5 || __qos_class == QOS_CLASS_UTILITY || __qos_class == QOS_CLASS_BACKGROUND)
    return posix_spawnattr_set_qos_clamp_np();
  else
    return 22;
}

int posix_spawnattr_get_qos_class_np(const posix_spawnattr_t *__attr, qos_class_t *__qos_class)
{
  int result;

  if (!__qos_class)
    return 22;
  result = posix_spawnattr_get_qos_clamp_np();
  if (!result)
  {
    result = 0;
    *__qos_class = QOS_CLASS_UNSPECIFIED;
  }
  return result;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *a1, int *a2)
{
  int result;

  if (a1->__sig != 1381452865)
    return 22;
  result = 0;
  *a2 = *(_DWORD *)a1->__opaque;
  return result;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *a1, int a2)
{
  int result;

  result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1381452865)
  {
    result = 0;
    *(_DWORD *)a1->__opaque = a2;
  }
  return result;
}

uint64_t _pthread_setspecific_static(unint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a1 > 0xFF)
    return 22;
  result = 0;
  *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1) = a2;
  return result;
}

int pthread_introspection_setspecific_np(pthread_t thread, pthread_key_t key, const void *value)
{
  uint64_t v6;
  int result;

  if (*(_WORD *)&pthread_self()->__opaque[34] != 1)
    pthread_introspection_setspecific_np_cold_1();
  if (key - 10 > 0x1F5)
    return 22;
  v6 = _pthread_keys[key];
  if (key >= 0x100 && !v6)
    return 22;
  *(_QWORD *)&thread->__opaque[8 * key + 208] = value;
  if (key <= 0xFF && !v6)
    _pthread_keys[key] = -1;
  result = 0;
  if (*(unsigned __int16 *)&thread->__opaque[60] < key)
    *(_WORD *)&thread->__opaque[60] = key;
  return result;
}

void *__cdecl pthread_introspection_getspecific_np(pthread_t thread, pthread_key_t key)
{
  if (*(_WORD *)&pthread_self()->__opaque[34] != 4)
    pthread_introspection_getspecific_np_cold_1();
  return *(void **)&thread->__opaque[8 * key + 208];
}

int sigwait(const sigset_t *a1, int *a2)
{
  int v3;

  pthread_testcancel();
  if (__sigwait() != -1)
    return 0;
  v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  pthread_testcancel();
  if (v3 == 4)
    return 0;
  else
    return v3;
}

uint64_t _pthread_atfork_child()
{
  uint64_t v0;
  _OWORD v2[3];
  uint64_t v3;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = _os_alloc_once();
  *(_DWORD *)(v0 + 8) = 0;
  __is_threaded = 0;
  _pthread_main_thread_postfork_init(*(_QWORD *)v0);
  v3 = 0;
  memset(v2, 0, sizeof(v2));
  return _pthread_bsdthread_init((uint64_t)v2);
}

void _pthread_atfork_child_handlers()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 256) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 264);
  else
    v0 = _os_alloc_once();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 16;
    do
    {
      v4 = *(void (**)(void))(*(_QWORD *)(v0 + 264) + v3);
      if (v4)
      {
        v4();
        v1 = *(_QWORD *)(v0 + 16);
      }
      ++v2;
      v3 += 24;
    }
    while (v2 < v1);
  }
  *(_DWORD *)(v0 + 12) = 0;
}

uint64_t _pthread_fork_prepare()
{
  _pthread_atfork_prepare_handlers();
  return _pthread_atfork_prepare();
}

void _pthread_fork_parent()
{
  _pthread_atfork_parent();
  _pthread_atfork_parent_handlers();
}

void pthread_cancel_VARIANT_mp_cold_1()
{
  int v0;

  v0 = OUTLINED_FUNCTION_0();
  pthread_dependency_wait_np_VARIANT_mp_cold_1(v0);
}

void pthread_dependency_wait_np_VARIANT_mp_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: __ulock_wait() failed";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_dependency_wait_np_VARIANT_mp_cold_2(unsigned int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Corrupted pthread_dependency_t";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_dependency_wait_np_VARIANT_mp_cold_3(unsigned int *a1)
{
  uint64_t v1;

  v1 = *a1;
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Waiting on orphaned dependency";
  qword_1F0458040 = v1;
  __break(1u);
}

void pthread_cond_broadcast_VARIANT_mp_cold_1(unsigned int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_cond_broadcast_VARIANT_mp_cold_2(unsigned int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_cond_broadcast_VARIANT_mp_cold_3()
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
  __break(1u);
}

void __pthread_invalid_workloopfunction()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqwl setup";
  __break(1u);
}

void __pthread_invalid_keventfunction()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqworkq setup";
  __break(1u);
}

void pthread_jit_write_with_callback_np_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_jit_write_with_callback_np() called before pthread_jit"
                             "_write_freeze_callbacks_np()";
  qword_1F0458040 = byte_1F045C001;
  __break(1u);
}

void pthread_jit_write_with_callback_np_cold_2(uint64_t a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_jit_write_with_callback_np() callback not in allowlist";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_jit_write_freeze_callbacks_np_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_jit_write_freeze_callbacks_np() called but freeze-late"
                             " entitlement is missing";
  __break(1u);
}

void pthread_jit_write_freeze_callbacks_np_cold_2()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_jit_write_freeze_callbacks_np() already called";
  __break(1u);
}

void _pthread_jit_write_protect_freeze_config_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: jit config vm_protect() failed";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_create_cold_1(uint64_t a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Stack size in attrs is too small";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_create_cold_2()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
  __break(1u);
}

void _pthread_create_cold_3(uint64_t a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unaligned stack addr in attrs";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_install_workgroup_functions_np_cold_1(uint64_t a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions already installed";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_create_with_workgroup_np_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions not yet installed";
  __break(1u);
}

void _pthread_joiner_wake_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: pthread_join() wake failure";
  qword_1F0458040 = -a1;
  __break(1u);
}

void __pthread_init_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: PTHREAD_SELF TSD not initialized";
  __break(1u);
}

void __pthread_init_cold_2()
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Token from the kernel is 0";
  qword_1F0458040 = 0;
  __break(1u);
}

void __pthread_init_cold_3(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: jit config vm_map PERMANENT failed";
  qword_1F0458040 = a1;
  __break(1u);
}

void __pthread_init_cold_4(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: host_info() failed";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_bsdthread_init_cold_1(unsigned int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Missing required kernel support";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_main_thread_postfork_init_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
  __break(1u);
}

void _pthread_wqthread_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: Missing priority";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_workqueue_supported_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: libpthread has not been initialized";
  __break(1u);
}

void _pthread_jit_write_protect_bulk_image_load_callback_cold_1(uint64_t a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Too many pthread jit write callbacks";
  qword_1F0458040 = a1;
  __break(1u);
}

void _pthread_mutex_corruption_abort()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_mutex corruption: mutex owner changed in the middle of lock/unlock";
  __break(1u);
}

void _pthread_qos_class_encode_workqueue_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid priority";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_qos_max_parallelism_cold_1(int a1)
{
  qword_1F0458010 = (uint64_t)"BUG IN LIBPTHREAD: qos_max_parallelism failed";
  qword_1F0458040 = a1;
  __break(1u);
}

void pthread_introspection_setspecific_np_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_setspecific_np outside of a CREA"
                             "TE introspection hook";
  __break(1u);
}

void pthread_introspection_getspecific_np_cold_1()
{
  qword_1F0458010 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_getspecific_np outside of a DEST"
                             "ROY introspection hook";
  __break(1u);
}

void pthread_self_cold_1()
{
  abort_with_reason();
  __bsdthread_create();
}

uint64_t __bsdthread_create()
{
  return MEMORY[0x1E0C87D48]();
}

uint64_t __bsdthread_ctl()
{
  return MEMORY[0x1E0C87D50]();
}

uint64_t __bsdthread_register()
{
  return MEMORY[0x1E0C87D58]();
}

uint64_t __bsdthread_terminate()
{
  return MEMORY[0x1E0C87D60]();
}

uint64_t __disable_threadsignal()
{
  return MEMORY[0x1E0C87D80]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1E0C87DD0]();
}

uint64_t __kqueue_workloop_ctl()
{
  return MEMORY[0x1E0C87DE8]();
}

uint64_t __proc_info()
{
  return MEMORY[0x1E0C87E30]();
}

uint64_t __psynch_cvbroad()
{
  return MEMORY[0x1E0C87E38]();
}

uint64_t __psynch_cvclrprepost()
{
  return MEMORY[0x1E0C87E40]();
}

uint64_t __psynch_cvsignal()
{
  return MEMORY[0x1E0C87E48]();
}

uint64_t __psynch_cvwait()
{
  return MEMORY[0x1E0C87E50]();
}

uint64_t __psynch_mutexdrop()
{
  return MEMORY[0x1E0C87E58]();
}

uint64_t __psynch_mutexwait()
{
  return MEMORY[0x1E0C87E60]();
}

uint64_t __psynch_rw_rdlock()
{
  return MEMORY[0x1E0C87E68]();
}

uint64_t __psynch_rw_unlock()
{
  return MEMORY[0x1E0C87E70]();
}

uint64_t __psynch_rw_wrlock()
{
  return MEMORY[0x1E0C87E78]();
}

uint64_t __pthread_canceled()
{
  return MEMORY[0x1E0C87E80]();
}

uint64_t __pthread_chdir()
{
  return MEMORY[0x1E0C87E88]();
}

uint64_t __pthread_fchdir()
{
  return MEMORY[0x1E0C87E90]();
}

uint64_t __pthread_kill()
{
  return MEMORY[0x1E0C87E98]();
}

uint64_t __pthread_markcancel()
{
  return MEMORY[0x1E0C87EA0]();
}

uint64_t __pthread_sigmask()
{
  return MEMORY[0x1E0C87EA8]();
}

uint64_t __semwait_signal_nocancel()
{
  return MEMORY[0x1E0C87ED0]();
}

uint64_t __sigwait()
{
  return MEMORY[0x1E0C87F10]();
}

uint64_t __sysctl()
{
  return MEMORY[0x1E0C87F28]();
}

uint64_t __thread_selfid()
{
  return MEMORY[0x1E0C87F38]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1E0C87F48]();
}

uint64_t __ulock_wait2()
{
  return MEMORY[0x1E0C87F50]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1E0C87F58]();
}

uint64_t __workq_kernreturn()
{
  return MEMORY[0x1E0C87F80]();
}

uint64_t __workq_open()
{
  return MEMORY[0x1E0C87F88]();
}

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x1E0C87310]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

uint64_t _os_semaphore_create()
{
  return MEMORY[0x1E0C88AA8]();
}

uint64_t _os_semaphore_dispose()
{
  return MEMORY[0x1E0C88AB0]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x1E0C88AB8]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x1E0C88AE0]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x1E0C88B10]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x1E0C88B18]();
}

uint64_t j___pthread_atomic_xchg_ptr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_atomic_xchg_ptr_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___pthread_atomic_xchg_uint32_relaxed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_atomic_xchg_uint32_relaxed_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___pthread_cond_wait(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_cond_wait_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___pthread_setcancelstate_exit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_setcancelstate_exit_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1E0C88B60]();
}

uint64_t _thread_set_tsd_base()
{
  return MEMORY[0x1E0C87FA8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C87FB8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C873B0](mhp, segname, sectname, size);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C88208](*(_QWORD *)&host, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88360](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C883B8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C883F8]();
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C88408](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C88410](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C88418](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1E0C88428](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C884B0](*(_QWORD *)&reply_port);
}

uint64_t os_unfair_lock_lock_no_tsd()
{
  return MEMORY[0x1E0C88BD8]();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_unfair_lock_unlock_no_tsd()
{
  return MEMORY[0x1E0C88BF8]();
}

uint64_t posix_spawnattr_get_qos_clamp_np()
{
  return MEMORY[0x1E0C885A8]();
}

uint64_t posix_spawnattr_set_qos_clamp_np()
{
  return MEMORY[0x1E0C885B8]();
}

int pthread_cancel_0(pthread_t a1)
{
  return ((uint64_t (*)(_opaque_pthread_t *))pthread_cancel_ptr[0])(a1);
}

int pthread_cond_broadcast_0(pthread_cond_t *a1)
{
  return ((uint64_t (*)(pthread_cond_t *))pthread_cond_broadcast_ptr[0])(a1);
}

int pthread_cond_destroy_0(pthread_cond_t *a1)
{
  return ((uint64_t (*)(pthread_cond_t *))pthread_cond_destroy_ptr[0])(a1);
}

int pthread_cond_init_0(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return ((uint64_t (*)(pthread_cond_t *, const pthread_condattr_t *))pthread_cond_init_ptr[0])(a1, a2);
}

int pthread_cond_signal_0(pthread_cond_t *a1)
{
  return ((uint64_t (*)(pthread_cond_t *))pthread_cond_signal_ptr[0])(a1);
}

int pthread_cond_signal_thread_np_0(pthread_cond_t *a1, pthread_t a2)
{
  return ((uint64_t (*)(pthread_cond_t *, _opaque_pthread_t *))pthread_cond_signal_thread_np_ptr[0])(a1, a2);
}

uint64_t pthread_dependency_fulfill_np_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_dependency_fulfill_np_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t pthread_dependency_wait_np_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_dependency_wait_np_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

int pthread_mutex_destroy_0(pthread_mutex_t *a1)
{
  return ((uint64_t (*)(pthread_mutex_t *))pthread_mutex_destroy_ptr[0])(a1);
}

int pthread_mutex_init_0(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return ((uint64_t (*)(pthread_mutex_t *, const pthread_mutexattr_t *))pthread_mutex_init_ptr[0])(a1, a2);
}

int pthread_mutex_lock_0(pthread_mutex_t *a1)
{
  return ((uint64_t (*)(pthread_mutex_t *))pthread_mutex_lock_ptr[0])(a1);
}

int pthread_mutex_trylock_0(pthread_mutex_t *a1)
{
  return ((uint64_t (*)(pthread_mutex_t *))pthread_mutex_trylock_ptr[0])(a1);
}

int pthread_mutex_unlock_0(pthread_mutex_t *a1)
{
  return ((uint64_t (*)(pthread_mutex_t *))pthread_mutex_unlock_ptr[0])(a1);
}

int pthread_rwlock_destroy_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_destroy_ptr[0])(a1);
}

int pthread_rwlock_init_0(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return ((uint64_t (*)(pthread_rwlock_t *, const pthread_rwlockattr_t *))pthread_rwlock_init_ptr[0])(a1, a2);
}

int pthread_rwlock_rdlock_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_rdlock_ptr[0])(a1);
}

int pthread_rwlock_tryrdlock_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_tryrdlock_ptr[0])(a1);
}

int pthread_rwlock_trywrlock_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_trywrlock_ptr[0])(a1);
}

int pthread_rwlock_unlock_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_unlock_ptr[0])(a1);
}

int pthread_rwlock_wrlock_0(pthread_rwlock_t *a1)
{
  return ((uint64_t (*)(pthread_rwlock_t *))pthread_rwlock_wrlock_ptr[0])(a1);
}

int pthread_setcancelstate_0(int a1, int *a2)
{
  return ((uint64_t (*)(uint64_t, int *))pthread_setcancelstate_ptr[0])(*(uint64_t *)&a1, a2);
}

int pthread_setcanceltype_0(int a1, int *a2)
{
  return ((uint64_t (*)(uint64_t, int *))pthread_setcanceltype_ptr)(*(uint64_t *)&a1, a2);
}

BOOLean_t swtch_pri(int pri)
{
  return MEMORY[0x1E0C88748](*(_QWORD *)&pri);
}

uint64_t thread_destruct_special_reply_port()
{
  return MEMORY[0x1E0C887A0]();
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C887B0](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy(thread_act_t thr_act, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, BOOLean_t set_limit)
{
  return MEMORY[0x1E0C887B8](*(_QWORD *)&thr_act, *(_QWORD *)&policy, base, *(_QWORD *)&baseCnt, *(_QWORD *)&set_limit);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1E0C887C0](*(_QWORD *)&thread_name, *(_QWORD *)&option, *(_QWORD *)&option_time);
}

uint64_t sub_1DEE4531C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _pthread_atomic_xchg_ptr_ptr[0] = (uint64_t (*)())_pthread_atomic_xchg_ptr();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_atomic_xchg_ptr_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _pthread_atomic_xchg_uint32_relaxed_ptr[0] = (uint64_t (*)())_pthread_atomic_xchg_uint32_relaxed();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_atomic_xchg_uint32_relaxed_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE453E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _pthread_setcancelstate_exit_ptr[0] = (uint64_t (*)())_pthread_setcancelstate_exit();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_setcancelstate_exit_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _pthread_cond_wait_ptr[0] = (uint64_t (*)())_pthread_cond_wait();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_pthread_cond_wait_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE454AC(_opaque_pthread_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cancel_ptr[0] = (uint64_t (*)())pthread_cancel(a1);
  return ((uint64_t (*)(_opaque_pthread_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cancel_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45510(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_setcancelstate_ptr[0] = (uint64_t (*)())pthread_setcancelstate(a1, a2);
  return ((uint64_t (*)(uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_setcancelstate_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45574(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_setcanceltype_ptr = (uint64_t (*)())pthread_setcanceltype(a1, a2);
  return ((uint64_t (*)(uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_setcanceltype_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE455D8(pthread_cond_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cond_broadcast_ptr[0] = (uint64_t (*)())pthread_cond_broadcast(a1);
  return ((uint64_t (*)(pthread_cond_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cond_broadcast_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE4563C(pthread_cond_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cond_destroy_ptr[0] = (uint64_t (*)())pthread_cond_destroy(a1);
  return ((uint64_t (*)(pthread_cond_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cond_destroy_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE456A0(pthread_cond_t *a1, const pthread_condattr_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cond_init_ptr[0] = (uint64_t (*)())pthread_cond_init(a1, a2);
  return ((uint64_t (*)(pthread_cond_t *, const pthread_condattr_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cond_init_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45704(pthread_cond_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cond_signal_ptr[0] = (uint64_t (*)())pthread_cond_signal(a1);
  return ((uint64_t (*)(pthread_cond_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cond_signal_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45768(pthread_cond_t *a1, _opaque_pthread_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_cond_signal_thread_np_ptr[0] = (uint64_t (*)())pthread_cond_signal_thread_np(a1, a2);
  return ((uint64_t (*)(pthread_cond_t *, _opaque_pthread_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_cond_signal_thread_np_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE457CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_dependency_fulfill_np_ptr[0] = (uint64_t (*)())pthread_dependency_fulfill_np();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_dependency_fulfill_np_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_dependency_wait_np_ptr[0] = (uint64_t (*)())pthread_dependency_wait_np();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_dependency_wait_np_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45894(pthread_mutex_t *a1, const pthread_mutexattr_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_init_ptr[0] = (uint64_t (*)())pthread_mutex_init(a1, a2);
  return ((uint64_t (*)(pthread_mutex_t *, const pthread_mutexattr_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_mutex_init_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE458F8(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_destroy_ptr[0] = (uint64_t (*)())pthread_mutex_destroy(a1);
  return ((uint64_t (*)(pthread_mutex_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_mutex_destroy_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE4595C(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_lock_ptr[0] = (uint64_t (*)())pthread_mutex_lock(a1);
  return ((uint64_t (*)(pthread_mutex_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_mutex_lock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE459C0(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_trylock_ptr[0] = (uint64_t (*)())pthread_mutex_trylock(a1);
  return ((uint64_t (*)(pthread_mutex_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_mutex_trylock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45A24(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_unlock_ptr[0] = (uint64_t (*)())pthread_mutex_unlock(a1);
  return ((uint64_t (*)(pthread_mutex_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_mutex_unlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45A88(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_destroy_ptr[0] = (uint64_t (*)())pthread_rwlock_destroy(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_destroy_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45AEC(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_init_ptr[0] = (uint64_t (*)())pthread_rwlock_init(a1, a2);
  return ((uint64_t (*)(pthread_rwlock_t *, const pthread_rwlockattr_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_init_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45B50(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_rdlock_ptr[0] = (uint64_t (*)())pthread_rwlock_rdlock(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_rdlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45BB4(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_tryrdlock_ptr[0] = (uint64_t (*)())pthread_rwlock_tryrdlock(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_tryrdlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45C18(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_trywrlock_ptr[0] = (uint64_t (*)())pthread_rwlock_trywrlock(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_trywrlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45C7C(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_unlock_ptr[0] = (uint64_t (*)())pthread_rwlock_unlock(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_unlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DEE45CE0(pthread_rwlock_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_rwlock_wrlock_ptr[0] = (uint64_t (*)())pthread_rwlock_wrlock(a1);
  return ((uint64_t (*)(pthread_rwlock_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))pthread_rwlock_wrlock_ptr[0])(a1, a2, a3, a4, a5, a6, a7, a8);
}
